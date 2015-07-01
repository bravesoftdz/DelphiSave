unit unManAsigHijos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ABMDialog, Db, SDEngine, unFraTrabajador, EditDialog, Placemnt,
  artSeguridad;

type
  TfrmManAsigHijos = class(TForm)
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    ABMDialog: TABMDialog;
    PrintDialog: TPrintDialog;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
    procedure ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
    procedure ABMDialogCustomSetValue(EditField: TEditField; Value: String);
    procedure ABMDialogBeforeABM(Sender: TObject; ABMAction: TABMActions;
      var Cancel: Boolean);
  private
    FIdTrabajador :Integer;
    sCuil :String;
    procedure LoadValues;
    procedure SetIdTrabajador(Const Value :Integer);
    function EsRegistroUsado(IdAsig :Integer) :Boolean;
  public
    procedure Execute;
    property IdTrabajador: Integer   read FIdTrabajador    write SetIdTrabajador;
  end;

var
  frmManAsigHijos: TfrmManAsigHijos;

implementation

uses unDmPrincipal, AnsiSql;

{$R *.DFM}
{-------------------------------------------------------------------------------}
procedure TfrmManAsigHijos.Execute;
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
procedure TfrmManAsigHijos.ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
begin
  PrintDialog.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigHijos.LoadValues;
var
  sSql :String;
begin
  sSql := 'SELECT * FROM sah_asign_hijos ';
  if (IdTrabajador > 0) then
    sSql := sSql + ' WHERE ah_idtrabajador = ' + SqlInt(IdTrabajador);
  sdqDatos.Close;
  sdqDatos.SQL.Text := sSql;
  sdqDatos.Open;
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigHijos.ABMDialogCustomGetSQLValue(EditField: TEditField; var Value: String);
begin
  if EditField.FieldName = 'AH_IDTRABAJADOR' then Value := IntToStr(IdTrabajador);
  if EditField.FieldName = 'AH_CUIL' then Value := '''' + sCuil + '''';
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigHijos.SetIdTrabajador(Const Value :Integer);
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
procedure TfrmManAsigHijos.ABMDialogCustomSetValue(EditField: TEditField; Value: String);
begin
  if EditField.FieldName = 'AH_CUIL' then Value := '''' + sCuil + '''';
end;
{-------------------------------------------------------------------------------}
procedure TfrmManAsigHijos.ABMDialogBeforeABM(Sender: TObject;
  ABMAction: TABMActions; var Cancel: Boolean);
begin
  if (ABMAction = aaDelete) and EsRegistroUsado(sdqDatos.FieldByName('AH_ID').AsInteger) then
  begin
    MessageBox(0, 'El registro no puede darse de baja ya que ha sido utilizado en algunas liquidaciones.', 'Error', MB_ICONWARNING or MB_OK);
    Cancel := True;
  end;
end;
{-------------------------------------------------------------------------------}
function TfrmManAsigHijos.EsRegistroUsado(IdAsig :Integer) :Boolean;
var
  sSql :String;
begin
  sSql := ' SELECT 1 ' +
            ' FROM sle_liquiempsin, sex_expedientes, sah_asign_hijos ' +
           ' WHERE ah_id = ' + SqlInt(IdAsig) +
             ' AND ah_cuil = ex_cuil ' +
             ' AND ex_siniestro = le_siniestro ' +
             ' AND ex_orden = le_orden ' +
             ' AND ex_recaida = le_recaida ' +
             ' AND NVL(ex_causafin,''0'') NOT IN (''95'', ''99'') ' +
             ' AND le_asigfamiliar <> 0 ' +
             ' AND le_fechades >= NVL(ah_fechamodif, ah_fechaalta)';
  Result := ExisteSql(sSql);
end;
{-------------------------------------------------------------------------------}
end.
