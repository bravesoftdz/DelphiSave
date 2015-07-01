unit unManAsigEspeciales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Placemnt, artSeguridad, ABMDialog, Db, SDEngine, EditDialog, unArtFrame,
  unFraCodigoDescripcion, StdCtrls, Mask, ToolEdit, CurrEdit, DateComboBox,
  unArtDBAwareFrame;

type
  TfrmManAsigEspeciales = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    fraTiposAsig: TfraCodigoDescripcion;
    edCantidad: TCurrencyEdit;
    edFImputacion: TDateComboBox;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
    procedure ABMDialogCustomSetValue(EditField: TEditField; Value: String);
    procedure ABMDialogNeedControl(EditField: TEditField);
    procedure ABMDialogBeforeSave(Sender: TObject; var Cancel: Boolean {$IFDEF ART2}; ABMAction: TABMActions{$ENDIF});
    procedure SetIdTrabajador(Const Value :Integer);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions;
      var Cancel: Boolean);
  private
    FIdTrabajador :Integer;
    sCuil :String;
    procedure LoadValues;
    function EsRegistroUsado(IdAsig :Integer) :Boolean;
  public
    procedure Execute;
    property IdTrabajador: Integer   read FIdTrabajador   write SetIdTrabajador;
  end;

var
  frmManAsigEspeciales: TfrmManAsigEspeciales;

implementation

uses unDmPrincipal, AnsiSql, General, uncomunes;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.Execute;
begin
  dmPrincipal.sdbPrincipal.StartTransaction;
  try
    LoadValues;
    ABMDialog.Execute;
    sdqDatos.Close;
    dmPrincipal.sdbPrincipal.Commit;
  except
    dmPrincipal.sdbPrincipal.Rollback;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.LoadValues;
var
  sSql :String;
begin
  sSql := 'SELECT * FROM sas_asign_especiales, stf_tiposasigfamiliares ' +
          ' WHERE as_tipoasignacion = tf_tipo ';
  if (IdTrabajador > 0) then
    sSql := sSql + ' AND as_idtrabajador = ' + SqlInt(IdTrabajador);
  sdqDatos.Close;
  sdqDatos.SQL.Text := sSql;
  sdqDatos.Open;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  PrintDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
  if EditField.FieldName = 'AS_IDTRABAJADOR' then Value := IntToStr(IdTrabajador);
  if EditField.FieldName = 'AS_TIPOASIGNACION' then
    Value := '''' + fraTiposAsig.Codigo + '''';
  if EditField.FieldName = 'AS_CANTIDAD' then
    Value := '''' + edCantidad.Text + '''';
  if EditField.FieldName = 'AS_FECHAPRESENTACION' then
    Value := '''' + edFImputacion.Text + '''';
  if EditField.FieldName = 'AS_CUIL' then
    Value := '''' + sCuil + '''';
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.FormCreate(Sender: TObject);
begin
  with fraTiposAsig do
  begin
    TableName       := 'STF_TIPOSASIGFAMILIARES';
    FieldID         := 'TF_TIPO';
    FieldCodigo     := 'TF_TIPO';
    FieldDesc       := 'TF_DESCRIPCION';
    FieldBaja       := 'TF_FECHABAJA';
    ShowBajas       := False;
    OrderBy         := 'DESCRIPCION';
    ExtraCondition  := ' AND tf_tipo NOT IN (''01'',''02'') ';
  end;
  edFImputacion.MaxDate := DBDate;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.ABMDialogCustomSetDefault(EditField: TEditField; Value: String);
begin
  if EditField.FieldName = 'AS_TIPOASIGNACION' then
    fraTiposAsig.Value := {$IFDEF ART2}StrToInt(Value){$ELSE}Value{$ENDIF};
  if EditField.FieldName = 'AS_CANTIDAD' then
    edCantidad.Text := Value;
  if EditField.FieldName = 'AS_FECHAPRESENTACION' then
    edFImputacion.Text := Value;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.ABMDialogCustomSetValue(EditField: TEditField; Value: String);
begin
  if EditField.FieldName = 'AS_TIPOASIGNACION' then
    fraTiposAsig.Value := {$IFDEF ART2}StrToInt(Value){$ELSE}Value{$ENDIF};
  if EditField.FieldName = 'AS_CANTIDAD' then
    Value := '''' + edCantidad.Text + '''';
  if EditField.FieldName = 'AS_FECHAPRESENTACION' then
    Value := '''' + edFImputacion.Text + '''';
  if EditField.FieldName = 'AS_CUIL' then
    Value := '''' + sCuil + '''';
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.ABMDialogNeedControl(EditField: TEditField);
begin
  if EditField.FieldName = 'AS_TIPOASIGNACION' then
    EditField.EditObject := fraTiposAsig;
  if EditField.FieldName = 'AS_CANTIDAD' then
    EditField.EditObject := edCantidad;
  if EditField.FieldName = 'AS_FECHAPRESENTACION' then
    EditField.EditObject := edFImputacion;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.ABMDialogBeforeSave(Sender: TObject; var Cancel: Boolean{$IFDEF ART2}; ABMAction: TABMActions{$ENDIF});
begin
  if fraTiposAsig.IsEmpty then
  begin
    MsgBox('Debe ingresar el Tipo de Asignación.', MB_ICONEXCLAMATION);
    Cancel := True;
  end
  else if ((fraTiposAsig.Codigo = '03') or (fraTiposAsig.Codigo = '04')) and
          (edCantidad.Value <> 0) then
  begin
    MsgBox('La Cantidad no puede ser distinta a 0.', MB_ICONEXCLAMATION);
    Cancel := True;
  end
  else if (fraTiposAsig.Codigo = '05') and (edCantidad.Value = 0) then
  begin
    MsgBox('La Cantidad debe ser distinta a 0.', MB_ICONEXCLAMATION);
    Cancel := True;
  end
  else if edFImputacion.IsEmpty then
  begin
    MsgBox('Debe ingresar la Fecha de Imputación del Certificado.', MB_ICONEXCLAMATION);
    Cancel := True;
  end
  else if (edFImputacion.Date < StrToDate(ART_FECHA_INICIO)) then
  begin
    MsgBox('La Fecha de Imputación del Certificado no puede ser menor al ' + ART_FECHA_INICIO + '.', MB_ICONEXCLAMATION);
    Cancel := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.SetIdTrabajador(Const Value :Integer);
var
  sSql :String;
begin
  if (Value <> FIdTrabajador) then
  begin
    FIdTrabajador := Value;
    sSql := 'SELECT tj_cuil ' +
             ' FROM ctj_trabajador ' +
            ' WHERE tj_id = ' + SqlInt(IdTrabajador);
    sCuil := ValorSql(sSql);
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmManAsigEspeciales.EsRegistroUsado(IdAsig :Integer) :Boolean;
var
  sSql :String;
begin
  sSql := ' SELECT 1 ' +
            ' FROM sle_liquiempsin, sex_expedientes, sas_asign_especiales ' +
           ' WHERE as_id = ' + SqlInt(IdAsig) +
             ' AND as_cuil = ex_cuil ' +
             ' AND ex_siniestro = le_siniestro ' +
             ' AND ex_orden = le_orden ' +
             ' AND ex_recaida = le_recaida ' +
             ' AND NVL(ex_causafin,''0'') NOT IN (''95'', ''99'') ' +
             ' AND le_asigfamiliar <> 0 ' +
             ' AND le_fechades >= as_fechapresentacion';
  Result := ExisteSql(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigEspeciales.ABMDialogBeforeABM(Sender: TObject;
  ABMAction: TABMActions; var Cancel: Boolean);
begin
  if (ABMAction = aaDelete) and EsRegistroUsado(sdqDatos.FieldByName('AS_ID').AsInteger) then
  begin
    MessageBox(0, 'El registro no puede darse de baja ya que ha sido utilizado en algunas liquidaciones.', 'Error', MB_ICONWARNING or MB_OK);
    Cancel := True;
  end;
end;
{-------------------------------------------------------------------------------}
end.
