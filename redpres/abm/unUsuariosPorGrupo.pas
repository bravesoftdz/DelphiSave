unit unUsuariosPorGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, Vcl.StdCtrls, Vcl.Mask,
  PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, FieldHider, ShortCutControl,
  RxPlacemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg,
  Data.DB, SDEngine, Vcl.ExtCtrls, FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  ArtComboBox, ArtDBGrid, Vcl.ComCtrls, Vcl.ToolWin;

type
  TfrmUsuariosPorGrupo = class(TfrmCustomGridABM)
    fraGrupo: TfraCodigoDescripcion;
    Label1: TLabel;
    Label2: TLabel;
    cmbUsuarios: TDBCheckCombo;
    sdqUsuarios: TSDQuery;
    dsUsuarios: TDataSource;
    GroupBox1: TGroupBox;
    fraGrupoFiltro: TfraCodigoDescripcion;
    sdqConsultaUG_ID: TFloatField;
    sdqConsultaGP_CODIGO: TStringField;
    sdqConsultaGP_DESCRIPCION: TStringField;
    sdqConsultaUG_USUARIO: TStringField;
    sdqConsultaUG_FECHABAJA: TDateTimeField;
    rgVerBajas: TRadioGroup;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure LoadControls; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuariosPorGrupo: TfrmUsuariosPorGrupo;

implementation

{$R *.dfm}

uses unDmPrincipal, unSesion, unPrincipal, CustomDlgs;

procedure TfrmUsuariosPorGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'SIN.sug_usuariosporgrupo';
  FieldBaja := 'UG_FECHABAJA';

  with fraGrupo do
  begin
    TableName   := 'SIN.sgp_gruposprestador';
    FieldID     := 'gp_id';
    FieldCodigo := 'gp_codigo';
    FieldDesc   := 'gp_descripcion';
    FieldBaja   := 'gp_fechabaja';
    ShowBajas   := False;
  end;

  with fraGrupoFiltro do
  begin
    TableName   := 'SIN.sgp_gruposprestador';
    FieldID     := 'gp_id';
    FieldCodigo := 'gp_codigo';
    FieldDesc   := 'gp_descripcion';
    FieldBaja   := 'gp_fechabaja';
    ShowBajas   := False;
  end;

end;

procedure TfrmUsuariosPorGrupo.ClearControls;
begin
  inherited;
  cmbUsuarios.Clear;
  fraGrupo.Clear;

end;

function TfrmUsuariosPorGrupo.DoABM: boolean;
var i: integer;
begin
  result := true;
  case ModoABM of
    maAlta:
    begin
      BeginTrans;
      try
        for i := 0 to cmbUsuarios.Count - 1 do
          if cmbUsuarios.Checked[i] then
            EjecutarSqlSTEx(' insert into SIN.sug_usuariosporgrupo (ug_idgrupo, ug_usuario, ug_fechaalta, ug_usualta) ' +
                            ' values (:idgrupo, :usu, trunc(sysdate), :usualta) ', [fraGrupo.ID,
                                       Copy(cmbUsuarios.ItemValue[i], 2, length(cmbUsuarios.ItemValue[i]) - 2), Sesion.UserID]);
        CommitTrans;
      except
        on E: Exception do
        begin
          MsgBox(E.Message);
          Rollback;
          result := false;
        end;
      end;
    end;
    maModificacion:
    begin
//
    end;
    maBaja:
    begin
      try
        EjecutarSqlEx(' update SIN.sug_usuariosporgrupo ' +
                      '    set ug_usubaja = :usu, ' +
                      '        ug_fechabaja = trunc(sysdate) ' +
                      '  where ug_id = :id ', [Sesion.UserID, sdqConsulta.FieldByName('ug_id').AsInteger]);
      except
        on E: Exception do
        begin
          MsgBox(E.Message);
          result := false;
        end;
      end;
    end;
  end;

end;

function TfrmUsuariosPorGrupo.Validar: boolean;
var ssql: string; i: integer; bAviso: boolean;
begin
  bAviso := False;
  verificar(fraGrupo.IsEmpty, fraGrupo, 'Debe seleccionar un grupo');
  verificar(cmbUsuarios.IsEmpty, cmbUsuarios, 'Debe seleccionar un usuario para asociar');

  for i := 0 to cmbUsuarios.Count - 1 do
    if cmbUsuarios.Checked[i] then
    begin
      ssql := 'SELECT 1' +
               ' FROM SIN.sug_usuariosporgrupo' +
              ' WHERE ug_usuario = :usu' +
              '   AND ug_fechabaja IS NULL';

      if ExisteSqlEx(ssql, [Copy(cmbUsuarios.ItemValue[i], 2, length(cmbUsuarios.ItemValue[i]) - 2)]) then
      begin
        cmbUsuarios.Checked[i] := False;
        bAviso := True;
      end;
    end;

  if bAviso then
    MsgBox('Algunos de los usuarios seleccionados ya se encontraban ingresados');

  result := true;
end;

procedure TfrmUsuariosPorGrupo.tbRefrescarClick(Sender: TObject);
var ssql: string;
begin

  ssql := ' select ug_id, gp_codigo, gp_descripcion, ug_usuario, ug_fechabaja ' +
          '   from SIN.sug_usuariosporgrupo, SIN.sgp_gruposprestador ' +
          '  where gp_fechabaja is null ' +
          '    and ug_idgrupo = gp_id ';

  if not fraGrupoFiltro.IsEmpty then
    ssql := ssql + ' AND ug_idgrupo = ' + fraGrupoFiltro.ID;

  case rgVerBajas.ItemIndex of
    0: ssql := ssql + ' AND ug_fechabaja is not null ';
    1: ssql := ssql + ' AND ug_fechabaja is null ';
  end;

  sdqConsulta.SQL.Text := ssql + SortDialog.OrderBy;

  inherited;

end;

procedure TfrmUsuariosPorGrupo.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraGrupoFiltro.Clear;

end;

procedure TfrmUsuariosPorGrupo.LoadControls;
begin
  inherited;
//
end;

end.
