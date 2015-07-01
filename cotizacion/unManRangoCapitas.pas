unit unManRangoCapitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, CurrEdit,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmManRangoCapitas = class(TfrmCustomGridABM)
    Label2: TLabel;
    Label3: TLabel;
    edValorRC: TCurrencyEdit;
    Label1: TLabel;
    edHasta: TCurrencyEdit;
    edDesde: TCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
  end;

var
  frmManRangoCapitas: TfrmManRangoCapitas;

implementation

uses
  AnsiSql, unSesion, SqlFuncs, CustomDlgs, unDmPrincipal;

{$R *.dfm}

function TfrmManRangoCapitas.DoABM: Boolean;
begin
  Validar;
  Sql.Clear;
  Sql.TableName := 'art.arc_rc_capitas';

  if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('rc_id',    sdqConsulta.FieldByName('rc_id').AsInteger, False);
    Sql.Fields.Add('rc_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('rc_usubaja',   Sesion.UserID);
    Sql.SqlType := stUpdate;
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      //Sql.PrimaryKey.Add('rc_id',    -1, False);
      Sql.Fields.Add('rc_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('rc_usualta',   Sesion.UserID);
    end
    else
    begin
      Sql.PrimaryKey.Add('rc_id',     sdqConsulta.FieldByName('rc_id').AsInteger, False);
      Sql.Fields.Add('rc_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('rc_usumodif',   Sesion.UserID);
    end;

    Sql.Fields.Add('rc_desde', edDesde.Value);
    Sql.Fields.Add('rc_hasta', edHasta.Value);
    Sql.Fields.Add('rc_valor', edValorRc.Value);
  end;

  Result := inherited DoABM;
end;

function TfrmManRangoCapitas.Validar: Boolean;
var
  sSql: String;
begin
  if ModoABM <> maBaja then
  begin
    Verificar(edDesde.Value >= edHasta.Value, edHasta, 'El valor hasta no puede ser menor o igual a desde.');

    sSql :=
      'SELECT 1' +
       ' FROM art.arc_rc_capitas' +
      ' WHERE (   (:desde BETWEEN rc_desde AND rc_hasta)' +
             ' OR (:hasta BETWEEN rc_desde AND rc_hasta)' +
             ' OR (    :desde < rc_desde' +
                 ' AND :hasta > rc_hasta)' +
             ' OR (    :desde > rc_desde' +
                 ' AND :hasta < rc_hasta))' +
        ' AND rc_fechabaja IS NULL';

    if ModoABM = maModificacion then
        sSql := sSql + ' AND ' + sdqConsulta.FieldByName('rc_id').AsString + ' <> rc_id';

    Verificar(ExisteSqlEx(sSql, [edDesde.Value, edHasta.Value]), btnAceptar, 'El rango desde/hasta se superpone con otro registro.');
  end;

  Result := True;
end;


procedure TfrmManRangoCapitas.ClearControls;
begin
  edDesde.Clear;
  edHasta.Clear;
  edValorRc.Clear;
end;

procedure TfrmManRangoCapitas.LoadControls;
begin
  with sdqConsulta do
  begin
    edDesde.Value   := FieldByName('rc_desde').AsInteger;
    edHasta.Value   := FieldByName('rc_hasta').AsInteger;
    edValorRC.Value := FieldByName('rc_valor').AsFloat;
  end;
end;

procedure TfrmManRangoCapitas.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM art.arc_rc_capitas' +
    ' WHERE 1 = 1';

  sdqConsulta.Sql.Text := sSql + SortDialog.OrderBy;

  inherited;
end;


procedure TfrmManRangoCapitas.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'rc_fechabaja';
end;

procedure TfrmManRangoCapitas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
  begin
  //  TFloatField(FieldByName('rs_desde')).DisplayFormat    := '';
  // TFloatField(FieldByName('rs_hasta')).DisplayFormat    := '';
    TFloatField(FieldByName('rc_valor')).DisplayFormat := ',0.00';
  end;
end;

procedure TfrmManRangoCapitas.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('rc_fechabaja').IsNull, tbModificar, 'Este registro está dado de baja.');
  inherited;
end;

procedure TfrmManRangoCapitas.tbEliminarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.FieldByName('rc_fechabaja').IsNull, tbModificar, 'Este registro ya está dado de baja.');
  inherited;
end;

end.
