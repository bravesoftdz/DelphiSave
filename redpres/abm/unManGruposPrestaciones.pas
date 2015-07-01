unit unManGruposPrestaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unfraNomenclador, Buttons;

type
  TfrmManGruposPrestaciones = class(TfrmCustomGridABM)
    Label1: TLabel;
    edGrupoABM: TEdit;
    fraNomencladorABM: TfraNomenclador;
    Label2: TLabel;
    dgMedicBase: TArtDBGrid;
    Label10: TLabel;
    btnQuitarBase: TBitBtn;
    btnAgregarBase: TBitBtn;
    dsPrestaciones: TDataSource;
    sdqPrestaciones: TSDQuery;
    fpAltaGrupo: TFormPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    btnAceptarGrupo: TButton;
    btnCancelarGrupo: TButton;
    edGrupo: TEdit;
    procedure btnAgregarBaseClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpAltaGrupoBeforeShow(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarGrupoClick(Sender: TObject);
    procedure btnQuitarBaseClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private

  protected
    procedure RefreshData; override;
  public
    { Public declarations }
  end;

var
  frmManGruposPrestaciones: TfrmManGruposPrestaciones;

implementation

uses CustomDlgs, Strfuncs, SqlFuncs, AnsiSql, unSesion, unDmPrincipal,
  unCustomConsulta, General;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.RefreshData;
var
  sSql :string;
begin
  sSql := 'SELECT gp_id, gp_descripcion, gp_fechaalta, on_descripcion, gp_fechabaja, ' +
                ' on_nomenclador || ''-'' || on_capitulo || ''-'' || on_codigo nomenclador ' +
           ' FROM sin.sgp_gruposprestaciones, sin.spg_prestacionesxgrupo, art.son_nomenclador ' +
          ' WHERE gp_id = pg_idgrupo(+) ' +
            ' AND pg_idnomenclador = on_id(+) ' +
            ' AND on_fechabaja(+) IS NULL ' +
            ' AND pg_fechabaja(+) IS NULL ';
  sdqConsulta.Sql.Text :=  sSql + SortDialog.OrderBy;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.btnAgregarBaseClick(Sender: TObject);
var
  sSql :String;
  iGrupo :Integer;
begin
  Verificar(not(fraNomencladorABM.IsSelected), fraNomencladorABM, 'Debe seleccionar prestación.');

  iGrupo  := sdqConsulta.FieldByName('gp_id').AsInteger;
  sSql    := 'SELECT 1 ' +
              ' FROM sin.sgp_gruposprestaciones, sin.spg_prestacionesxgrupo ' +
             ' WHERE gp_id = pg_idgrupo ' +
               ' AND pg_idnomenclador = :IdNom ' +
               ' AND gp_fechabaja IS NULL ' + 
               ' AND pg_fechabaja IS NULL ';
  Verificar(ExisteSqlEx(sSql + ' AND pg_idgrupo = :IdGrupo',
            [fraNomencladorABM.IdNomenclador, iGrupo]), fraNomencladorABM,
            'La prestación ya existe en el grupo actual.');
  Verificar(ExisteSqlEx(sSql + ' AND pg_idgrupo <> :IdGrupo',
            [fraNomencladorABM.IdNomenclador, iGrupo]), fraNomencladorABM,
            'La prestación ya existe en otro grupo.');

  sSql := 'INSERT INTO sin.spg_prestacionesxgrupo ' +
          '(pg_idgrupo, pg_idnomenclador, pg_fechaalta, pg_usualta) VALUES (' +
          SqlInt(iGrupo) + ',' + SqlInt(fraNomencladorABM.IdNomenclador) + ',' +
          'ActualDate, ' + SqlValue(Sesion.UserID) + ')';
  EjecutarSql(sSql);

  fraNomencladorABM.Limpiar;
  sdqPrestaciones.Refresh;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.tbNuevoClick(Sender: TObject);
var
  sSql :String;
begin
  if fpAltaGrupo.ShowModal = mrOk then
  begin
    sSql := 'INSERT INTO sin.sgp_gruposprestaciones ' +
            '(gp_descripcion, gp_fechaalta, gp_usualta) VALUES ( ' +
            SqlValue(edGrupo.Text) + ', ActualDate, ' + SqlValue(Sesion.UserID) + ')';
    EjecutarSql(sSql);
    if sdqConsulta.Active then sdqConsulta.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.btnAceptarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(IsEmptyString(Trim(edGrupoABM.Text)), edGrupoABM, 'Debe ingresar nombre del grupo.');
  sSql := 'SELECT 1 FROM sin.sgp_gruposprestaciones ' +
          ' WHERE gp_descripcion = ' + SqlValue(Trim(edGrupoABM.Text)) +
            ' AND gp_fechabaja IS NULL ' +
            ' AND gp_id <> :IdGrupo ';
  Verificar(ExisteSqlEx(sSql, [sdqConsulta.FieldByName('gp_id').AsInteger]), edGrupoABM,
            'Ya existe un grupo con el mismo nombre.');

  sSql := 'UPDATE sin.sgp_gruposprestaciones ' +
            ' SET gp_descripcion = ' + SqlValue(edGrupoABM.Text) + ',' +
                ' gp_fechamodif = ActualDate, ' +
                ' gp_usumodif = ' + SqlValue(Sesion.UserID) +
          ' WHERE gp_id = ' + SqlInt(sdqConsulta.FieldByName('gp_id').AsInteger);
  EjecutarSql(sSql);
  fpAbm.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.fpAltaGrupoBeforeShow(Sender: TObject);
begin
  edGrupo.Clear;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.tbModificarClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.FieldByName('gp_fechabaja').IsNull), Nil,
            'El grupo se encuentra dado de baja.');
  edGrupoABM.Text := sdqConsulta.FieldByName('gp_descripcion').AsString;
  sdqPrestaciones.Close;
  sdqPrestaciones.ParamByName('grupo').AsInteger := sdqConsulta.FieldByName('gp_id').AsInteger;
  sdqPrestaciones.Open;
  fpAbm.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.fpAbmClose(Sender: TObject; var Action: TCloseAction);
begin
  fraNomencladorABM.Limpiar;
  sdqPrestaciones.Close;
  if sdqConsulta.Active then sdqConsulta.Refresh;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.btnAceptarGrupoClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(IsEmptyString(Trim(edGrupo.Text)), edGrupo, 'Debe ingresar nombre del grupo.');
  sSql := 'SELECT 1 FROM sin.sgp_gruposprestaciones ' +
          ' WHERE gp_descripcion = ' + SqlValue(Trim(edGrupo.Text)) +
            ' AND gp_fechabaja IS NULL ';
  Verificar(ExisteSql(sSql), edGrupo, 'Ya existe un grupo con el mismo nombre.');
  fpAltaGrupo.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.btnQuitarBaseClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(sdqPrestaciones.IsEmpty, dgMedicBase, 'Debe seleccionar prestación.');

  if MsgAsk('¿Confirma eliminar del grupo la prestación seleccionada?') then
  begin
    sSql := 'UPDATE sin.spg_prestacionesxgrupo ' +
              ' SET pg_fechabaja = ActualDate, ' +
                  ' pg_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE pg_id = ' + SqlInt(sdqPrestaciones.FieldByName('pg_id').AsInteger);
    EjecutarSql(sSql);
    sdqPrestaciones.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.tbEliminarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(not(sdqConsulta.Active) or sdqConsulta.IsEmpty, Grid, 'Debe seleccionar grupo.');
  Verificar(not(sdqConsulta.FieldByName('gp_fechabaja').IsNull), Nil, 'El grupo ya se encuentra dado de baja.');

  if MsgAsk('¿Confirma eliminar el grupo seleccionado?') then
  begin
    sSql := 'UPDATE sin.sgp_gruposprestaciones ' +
              ' SET gp_fechabaja = ActualDate, ' +
                  ' gp_usubaja = ' + SqlValue(Sesion.UserID) +
            ' WHERE gp_id = ' + SqlInt(sdqConsulta.FieldByName('gp_id').AsInteger);
    EjecutarSql(sSql);
    sdqConsulta.Refresh;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManGruposPrestaciones.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.DataSet.FieldByName('gp_fechabaja').IsNull then
  begin
    Background := clInfoBK;
    AFont.Color := clNavy;
  end
  else AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
end.
