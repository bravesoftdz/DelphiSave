unit unMainService;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ExtCtrls;

type
  TOra2SQLServer = class(TService)
    TimerService: TTimer;
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure TimerServiceTimer(Sender: TObject);

    function  GetServiceController: TServiceController; override;
    procedure ServiceAfterInstall(Sender: TService);
  end;

var
  Ora2SQLServer: TOra2SQLServer;

implementation

uses
  unDmPrincipal, unDebug, unPrincipal, SDOra, Registry;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  Ora2SQLServer.Controller(CtrlCode);
end;

function TOra2SQLServer.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TOra2SQLServer.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'CONEXIA - Servicio que provee envío de información desde ORACLE a SQLSERVER.');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TOra2SQLServer.ServiceStart(Sender: TService; var Started: Boolean);
begin
  LogMessage('Iniciando Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
  TimerServiceTimer(nil);
end;

procedure TOra2SQLServer.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  LogMessage('Finalizando Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
  try
    frmPrincipal.Free;
  except
  end;
end;

procedure TOra2SQLServer.ServiceCreate(Sender: TObject);
begin
//  unDebug.AddToLog('Creando el Servicio de ' + Application.Title, ltInfo);
end;

procedure TOra2SQLServer.ServiceDestroy(Sender: TObject);
begin
//  unDebug.AddToLog('Destruyendo el Servicio de ' + Application.Title, ltInfo);
end;

procedure TOra2SQLServer.ServiceExecute(Sender: TService);
begin
  LogMessage('Ejecutando el Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
  while not Self.Terminated do
    ServiceThread.ProcessRequests(True);
end;

procedure TOra2SQLServer.TimerServiceTimer(Sender: TObject);
begin
  if dmPrincipal.Debug then
    LogMessage('Ejecutando el Timer del Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
  TimerService.Enabled := False;
  if not Assigned(frmPrincipal) then
  try
    if dmPrincipal.VerificaConexion(Self) then
    begin
      if dmPrincipal.Debug then
        LogMessage('Conexión exitosa del Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
    end;
  finally
    TimerService.Enabled := True;
  end;
end;

end.
