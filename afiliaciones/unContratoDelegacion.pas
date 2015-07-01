unit unContratoDelegacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmContratoDelegacion = class(TfrmCustomGridABM)
    edDC_FECHA_DESDE: TDateComboBox;
    lbFD: TLabel;
    lbFH: TLabel;
    edDC_FECHA_HASTA: TDateComboBox;
    fraDC_CONTRATO: TfraEmpresa;
    Label1: TLabel;
    fraDC_IDDELEGACION: TfraCodDesc;
    Label2: TLabel;
    procedure tbModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FContrato: Integer;

    procedure SetContrato(const Value: Integer);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
    property Contrato: Integer read FContrato write SetContrato;
  end;

var
  frmContratoDelegacion: TfrmContratoDelegacion;

implementation

uses
  AnsiSql, SqlFuncs, CustomDlgs, unSesion, unDmPrincipal, unART;

{$R *.DFM}

{ TfrmContratoDelegacion }

procedure TfrmContratoDelegacion.ClearControls;
begin
  edDC_FECHA_DESDE.Clear;
  edDC_FECHA_HASTA.Clear;
  fraDC_IDDELEGACION.Clear;
end;

function TfrmContratoDelegacion.DoABM: Boolean;
var
  aId: Integer;
begin
  aId := 1;
  Sql.Clear;
  Sql.TableName := 'adc_delegacioncontrato';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    aId := sdqConsulta.FieldByName('dc_id').AsInteger;
    Sql.Fields.Add('dc_usubaja',   Sesion.UserID);
    Sql.Fields.Add('dc_fechabaja', SQL_ACTUALDATE, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      aId := GetSecNextVal('AFI.SEQ_ADELC_ID');
      Sql.Fields.Add('dc_usualta',   Sesion.UserID);
      Sql.Fields.Add('dc_fechaalta', SQL_ACTUALDATE, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      aId := sdqConsulta.FieldByName('dc_id').AsInteger;
      Sql.Fields.Add('dc_usubaja',    SQL_NULL, False);
      Sql.Fields.Add('dc_fechabaja',  SQL_NULL, False);
      Sql.Fields.Add('dc_usumodif',   Sesion.UserID);
      Sql.Fields.Add('dc_fechamodif', SQL_ACTUALDATE, False);
    end;

    Sql.Fields.Add('dc_contrato',     FContrato, dtNumber);
    Sql.Fields.Add('dc_iddelagacion', fraDC_IDDELEGACION.Value, dtNumber);
    Sql.Fields.Add('dc_fecha_desde',  edDC_FECHA_DESDE.SqlText, False);
    Sql.Fields.Add('dc_fecha_hasta',  edDC_FECHA_HASTA.SqlText, False);
  end;

  Sql.PrimaryKey.Add('dc_id', aId, False);
  Result := inherited DoABM;
end;

procedure TfrmContratoDelegacion.LoadControls;
begin
  with sdqConsulta do
  begin
    fraDC_IDDELEGACION.Value := FieldByName('dc_iddelegacion').AsInteger;
    edDC_FECHA_DESDE.Date    := FieldByName('dc_fecha_desde').AsDateTime;
    edDC_FECHA_HASTA.Date    := FieldByName('dc_fecha_hasta').AsDateTime;
  end;
end;

procedure TfrmContratoDelegacion.RefreshData;
begin
  inherited;
end;

procedure TfrmContratoDelegacion.SetContrato(const Value: Integer);
begin
  FContrato := Value;
  sdqConsulta.ParamByName('contrato').AsInteger := Value;
  fraDC_CONTRATO.Contrato := Value;
  OpenQuery(sdqConsulta);
end;

function TfrmContratoDelegacion.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(fraDC_IDDELEGACION.IsEmpty, fraDC_IDDELEGACION.edCodigo, 'Debe seleccionar la delegación.');
  Verificar(edDC_FECHA_DESDE.IsEmpty, edDC_FECHA_DESDE, 'Debe indicar el inicio de la vigencia.');
  Verificar(not edDC_FECHA_HASTA.IsEmpty and (edDC_FECHA_DESDE.Date >= edDC_FECHA_HASTA.Date), edDC_FECHA_HASTA, 'La fecha de inicio no puede ser mayor a la fecha de finalización de la vigencia.');

  if edDC_FECHA_HASTA.IsEmpty then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM adc_delegacioncontrato' +
      ' WHERE dc_contrato = :contrato' +
        ' AND dc_fechabaja IS NULL' +
        ' AND dc_fecha_desde > ' + edDC_FECHA_DESDE.SqlText;

    if ModoABM = maModificacion then
      AddCondition(sSql, 'dc_id <> ' + SqlValue(sdqConsulta.FieldByName('dc_id').AsInteger));
    if ExisteSQLEx(sSql, [FContrato]) then
      InfoHint(btnAceptar, 'No puede dejar la vigencia abierta cuando existen períodos posteriores al que usted está ingresando.', True);
  end;

  sSql :=
    'SELECT 1' +
     ' FROM adc_delegacioncontrato' +
    ' WHERE dc_contrato = :contrato' +
      ' AND dc_fecha_hasta IS NULL' +
      ' AND dc_fechabaja IS NULL' +
      ' AND dc_fecha_desde < ' + edDC_FECHA_DESDE.SqlText;

  if ModoABM = maModificacion then
    AddCondition(sSql, 'dc_id <> ' + SqlValue(sdqConsulta.FieldByName('dc_id').AsInteger));
  if ExisteSQLEx(sSql, [FContrato]) then
    InfoHint(btnAceptar, 'Existe una delegación con vigencia anterior abierta.', True);

  sSql :=
    'SELECT 1' +
     ' FROM adc_delegacioncontrato' +
    ' WHERE dc_contrato = :contrato' +
      ' AND dc_fechabaja IS NULL' +
      ' AND (   (' + edDC_FECHA_DESDE.SqlText + ' BETWEEN dc_fecha_desde AND NVL(dc_fecha_hasta, ' + edDC_FECHA_DESDE.SqlText + '))' +
           ' OR (' + edDC_FECHA_HASTA.SqlText + ' BETWEEN dc_fecha_desde AND NVL(dc_fecha_hasta, ' + edDC_FECHA_DESDE.SqlText + '))' +
           ' OR (    (dc_fecha_desde >= ' + edDC_FECHA_DESDE.SqlText + ')' +
               ' AND (dc_fecha_hasta <= ' + edDC_FECHA_HASTA.SqlText + ')))';

  if ModoABM = maModificacion then
    AddCondition(sSql, 'dc_id <> ' + SqlValue(sdqConsulta.FieldByName('dc_id').AsInteger));
  if ExisteSQLEx(sSql, [FContrato]) then
    InfoHint(btnAceptar, 'Los períodos de vigencia de las delegaciones se superponen.', True);

  Result := True;
end;

procedure TfrmContratoDelegacion.tbModificarClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), nil, 'Debe seleccionar un registro para poder modificarlo.');
  Verificar(not(sdqConsulta.FieldByName('dc_fechabaja').IsNull), nil, 'El registro ha sido dado de baja.');
  
  inherited;
end;

procedure TfrmContratoDelegacion.FormCreate(Sender: TObject);
begin
  inherited;
  
  fraDC_CONTRATO.ShowBajas := True;
end;

end.
