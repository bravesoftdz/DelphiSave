unit unServicio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs, ExtCtrls, Login, artDbLogin, ImgList, unImportFromSRT;

type
  TfrmServicioStatusSrt = class(TService)
    DBLogin: TDBLogin;
    ilColor: TImageList;
    ilByN: TImageList;
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceCreate(Sender: TObject);
  private
    FProcesando: Boolean;

    function ObtenerStatus(const aCuit: String): TStatusSrt;

    procedure ActualizarInfo(const aCodigoProvincia, aCuit, aStatus: String; const aIdArtAnterior: Integer);
    procedure BuscarRegistros;
  public
    function GetServiceController: TServiceController; override;
  end;

var
  frmServicioStatusSrt: TfrmServicioStatusSrt;

implementation

uses
  unDmPrincipal, AnsiSql, Registry;

const
  DESCRIPCION_DEL_SERVICIO = 'que obtiene el status ante la SRT.';

{$R *.DFM}

function TfrmServicioStatusSrt.ObtenerStatus(const aCuit: String): TStatusSrt;
begin
  try
    if dmPrincipal.Debug then
      LogMessage('Obteniendo Status ante la SRT', EVENTLOG_INFORMATION_TYPE, 0, 0);

    Result := ObtenerStatusSrt(aCuit, -1);
  except
    on E: Exception do
    begin
      Result.ArtAnterior := -1;
      Result.CodigoProvincia := '';
      Result.Error := True;
      Result.Status := '-1';
    
      LogMessage('Error al obtener el Status ante la SRT.' + #13#10 + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
    end;
  end;
end;


procedure TfrmServicioStatusSrt.ActualizarInfo(const aCodigoProvincia, aCuit, aStatus: String; const aIdArtAnterior: Integer);
var
  sSql: String;
begin
  if dmPrincipal.Debug then
    LogMessage('Actualizando información: (C.U.I.T. ' + aCuit + ')', EVENTLOG_INFORMATION_TYPE, 0, 0);

  try
    sSql :=
      'UPDATE tmp.tss_statussrt' +
        ' SET ss_fechahorafin = SYSDATE,' +
            ' ss_generar = ''F'',' +
            ' ss_idartanterior = :idartanterior,' +
            ' ss_provincia = :provincia,' +
            ' ss_status = :status' +
      ' WHERE ss_cuit = :cuit';
    EjecutarSqlEx(sSql, [aIdArtAnterior, aCodigoProvincia, aStatus, aCuit]);
  except
    on E: Exception do
      LogMessage('Error actualizando información: (C.U.I.T. ' + aCuit + ')' + #10#13 + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
  end;
end;

procedure TfrmServicioStatusSrt.BuscarRegistros;
var
  aStatusSrt: TStatusSrt;
  sSql: String;
begin
  if FProcesando then
    Exit;

  FProcesando := True;

  if dmPrincipal.Debug then
    LogMessage('Buscando registros para procesar', EVENTLOG_INFORMATION_TYPE, 0, 0);

  sSql :=
    'SELECT ss_cuit' +
     ' FROM tmp.tss_statussrt' +
    ' WHERE ss_generar = ''T''' +
 ' ORDER BY ss_fechahorainicio';
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      if dmPrincipal.Debug then
        LogMessage('Obteniendo Status ante la SRT de la C.U.I.T. ' + FieldByName('ss_cuit').AsString, EVENTLOG_INFORMATION_TYPE, 0, 0);

      try
        aStatusSrt := ObtenerStatus(FieldByName('ss_cuit').AsString);
        ActualizarInfo(aStatusSrt.CodigoProvincia, FieldByName('ss_cuit').AsString, aStatusSrt.Status, aStatusSrt.ArtAnterior);
      except
        LogMessage('Error al obtener el Status ante la SRT de la C.U.I.T. ' + FieldByName('ss_cuit').AsString, EVENTLOG_ERROR_TYPE, 0, 0);
      end;

      Next;
    end;
  finally
    FProcesando := False;
    Free;
  end;
end;


procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  frmServicioStatusSrt.Controller(CtrlCode);
end;

function TfrmServicioStatusSrt.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TfrmServicioStatusSrt.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  LogMessage('Instalando el servicio ' + DESCRIPCION_DEL_SERVICIO, EVENTLOG_INFORMATION_TYPE, 0, 0);

  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, False) then
    begin
      Reg.WriteString('Description', 'Servicio ' + DESCRIPCION_DEL_SERVICIO);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmServicioStatusSrt.ServiceExecute(Sender: TService);
const
  SecBetweenRuns = 5;
var
  iCount: Integer;
begin
  iCount := 0;
  while not Terminated do
  begin
    Inc(iCount);
    if iCount >= SecBetweenRuns then
    begin
      iCount := 0;
      BuscarRegistros;
    end;
    Sleep(1000);
    ServiceThread.ProcessRequests(False);
  end;
end;

procedure TfrmServicioStatusSrt.ServiceStart(Sender: TService; var Started: Boolean);
begin
  LogMessage('Inicio del servicio ' + DESCRIPCION_DEL_SERVICIO, EVENTLOG_INFORMATION_TYPE, 0, 0);
  FProcesando := False;

  DBLogin.CustomUserName := 'WEB';
  DBLogin.Execute;

  ShortDateFormat := 'dd/mm/yyyy';

  Started := True;
end;

procedure TfrmServicioStatusSrt.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  LogMessage('Fin del servicio ' + DESCRIPCION_DEL_SERVICIO, EVENTLOG_INFORMATION_TYPE, 0, 0);
end;

procedure TfrmServicioStatusSrt.ServiceCreate(Sender: TObject);
begin
  // Setea los Formatos de la Configuración Regional para el servicio..
  CurrencyString    := '$';
  DecimalSeparator  := ',';
  ThousandSeparator := '.';
  DateSeparator     := '/';
  TimeSeparator     := ':';
  ShortTimeFormat   := 'HH:mm:ss';
  LongTimeFormat    := 'HH:mm:ss';
  ShortDateFormat   := 'dd/mm/yyyy';
end;

end.
