unit unContratoPreventor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, ExtCtrls, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unFraCodigoDescripcion, unFraCodDesc;

type
  TfrmContratoPreventor = class(TfrmCustomGridABM)
    edPC_FECHA_DESDE: TDateComboBox;
    lbFD: TLabel;
    lbFH: TLabel;
    edPC_FECHA_HASTA: TDateComboBox;
    fraPC_CONTRATO: TfraEmpresa;
    Label1: TLabel;
    fraPC_CODIGOPREVENTOR: TfraCodDesc;
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
  frmContratoPreventor: TfrmContratoPreventor;

implementation

uses
  AnsiSql, SqlFuncs, CustomDlgs, unSesion, unDmPrincipal, unART, DateTimeFuncs;

{$R *.DFM}

{ TfrmContratoPreventor }

procedure TfrmContratoPreventor.ClearControls;
begin
  edPC_FECHA_DESDE.Clear;
  edPC_FECHA_HASTA.Clear;
  fraPC_CODIGOPREVENTOR.Clear;
end;

function TfrmContratoPreventor.DoABM: Boolean;
var
  iId: Integer;
begin
  iId := 1;
  Sql.Clear;
  Sql.TableName := 'apc_preventorcontrato';

  if ModoABM = maBaja then
  begin
    Sql.SqlType := stUpdate;
    iId := sdqConsulta.FieldByName('pc_id').AsInteger;
    Sql.Fields.Add('pc_usubaja',   Sesion.UserID);
    Sql.Fields.Add('pc_fechabaja', SQL_ACTUALDATE, False);
  end
  else
  begin
    if ModoABM = maAlta then
    begin
      Sql.SqlType := stInsert;
      iId := GetSecNextVal('AFI.SEQ_APC_ID');
      Sql.Fields.Add('pc_usualta',   Sesion.UserID);
      Sql.Fields.Add('pc_fechaalta', SQL_ACTUALDATE, False);
    end
    else if ModoABM = maModificacion then
    begin
      Sql.SqlType := stUpdate;
      iId := sdqConsulta.FieldByName('pc_id').AsInteger;
      Sql.Fields.Add('pc_usubaja',    SQL_NULL, False);
      Sql.Fields.Add('pc_fechabaja',  SQL_NULL, False);
      Sql.Fields.Add('pc_usumodif',   Sesion.UserID);
      Sql.Fields.Add('pc_fechamodif', SQL_ACTUALDATE, False);
    end;

    Sql.Fields.Add('pc_contrato',        Contrato, dtNumber);
    Sql.Fields.Add('pc_codigopreventor', fraPC_CODIGOPREVENTOR.Codigo);
    Sql.Fields.Add('pc_fecha_desde',     edPC_FECHA_DESDE.SqlText, False);
    Sql.Fields.Add('pc_fecha_hasta',     edPC_FECHA_HASTA.SqlText, False);
  end;

  Sql.PrimaryKey.Add('pc_id', iId, False);

  Result := inherited DoABM;
end;

procedure TfrmContratoPreventor.LoadControls;
begin
  with sdqConsulta do
  begin
    fraPC_CODIGOPREVENTOR.Codigo := FieldByName('pc_codigopreventor').AsString;
    edPC_FECHA_DESDE.Date        := FieldByName('pc_fecha_desde').AsDateTime;
    edPC_FECHA_HASTA.Date        := FieldByName('pc_fecha_hasta').AsDateTime;
  end;
end;

procedure TfrmContratoPreventor.RefreshData;
begin
  inherited;
end;

procedure TfrmContratoPreventor.SetContrato(const Value: Integer);
begin
  FContrato := Value;
  sdqConsulta.ParamByName('contrato').AsInteger := Value;
  fraPC_CONTRATO.Contrato := Value;
  OpenQuery(sdqConsulta);
end;

function TfrmContratoPreventor.Validar: Boolean;
var
  sSql: String;
begin
  Verificar((fraPC_CODIGOPREVENTOR.Codigo = ''), fraPC_CODIGOPREVENTOR.edCodigo, 'Debe seleccionar el preventor.');
  Verificar(edPC_FECHA_DESDE.IsEmpty, edPC_FECHA_DESDE, 'Debe indicar el inicio de la vigencia.');
  Verificar(not edPC_FECHA_HASTA.IsEmpty and (edPC_FECHA_DESDE.Date >= edPC_FECHA_HASTA.Date), edPC_FECHA_HASTA, 'La fecha de inicio no puede ser mayor a la fecha de finalización de la vigencia.');

  if edPC_FECHA_HASTA.IsEmpty then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM apc_preventorcontrato' +
      ' WHERE pc_contrato = :contrato' +
        ' AND pc_fechabaja IS NULL' +
        ' AND pc_fecha_desde > :fechadesde';

    if ModoABM = maModificacion then
      AddCondition(sSql, 'pc_id <> ' + sdqConsulta.FieldByName('pc_id').AsString);
    if ExisteSQLEx(sSql, [Contrato, TDateTimeEx.Create(edPC_FECHA_DESDE.Date)]) then
      InfoHint(btnAceptar, 'No puede dejar la vigencia abierta cuando existen períodos posteriores al que usted está ingresando.', True);
  end;

  sSql :=
    'SELECT 1' +
     ' FROM apc_preventorcontrato' +
    ' WHERE pc_contrato = :contrato' +
      ' AND pc_fecha_hasta IS NULL' +
      ' AND pc_fechabaja IS NULL' +
      ' AND pc_fecha_desde < :fechadesde';

  if ModoABM = maModificacion then
    AddCondition(sSql, 'pc_id <> ' + sdqConsulta.FieldByName('pc_id').AsString);
  if ExisteSQLEx(sSql, [Contrato, TDateTimeEx.Create(edPC_FECHA_DESDE.Date)]) then
    InfoHint(btnAceptar, 'Existe un preventor con vigencia anterior abierta.', True);

  sSql :=
    'SELECT 1' +
     ' FROM apc_preventorcontrato' +
    ' WHERE pc_contrato = :contrato' +
      ' AND pc_fechabaja IS NULL' +
      ' AND (   (:fecha1 BETWEEN pc_fecha_desde AND NVL(pc_fecha_hasta, :fecha2))' +
           ' OR (:fecha3 BETWEEN pc_fecha_desde AND NVL(pc_fecha_hasta, :fecha4))' +
           ' OR (    (pc_fecha_desde >= :fecha5)' +
               ' AND (pc_fecha_hasta <= :fecha6)))';

  if ModoABM = maModificacion then
    AddCondition(sSql, 'pc_id <> ' + sdqConsulta.FieldByName('pc_id').AsString);
  if ExisteSQLEx(sSql, [Contrato, TDateTimeEx.Create(edPC_FECHA_DESDE.Date), TDateTimeEx.Create(edPC_FECHA_DESDE.Date),
                        TDateTimeEx.Create(edPC_FECHA_HASTA.Date), TDateTimeEx.Create(edPC_FECHA_DESDE.Date),
                        TDateTimeEx.Create(edPC_FECHA_DESDE.Date), TDateTimeEx.Create(edPC_FECHA_HASTA.Date)]) then
    InfoHint(btnAceptar, 'Los períodos de vigencia de los preventores se superponen.', True);

  Result := True;
end;

procedure TfrmContratoPreventor.tbModificarClick(Sender: TObject);
begin
  Verificar(not(sdqConsulta.Active and not sdqConsulta.IsEmpty), nil, 'Debe seleccionar un registro para poder modificarlo.');
  Verificar(not(sdqConsulta.FieldByName('pc_fechabaja').IsNull), nil, 'El registro ha sido dado de baja.');

  inherited;
end;

procedure TfrmContratoPreventor.FormCreate(Sender: TObject);
begin
  inherited;

  fraPC_CONTRATO.ShowBajas := True;
end;

end.
