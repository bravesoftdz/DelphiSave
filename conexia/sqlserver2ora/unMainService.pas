unit unMainService;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ExtCtrls;

type
  TSQLServer2Oracle = class(TService)
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
  SQLServer2Oracle: TSQLServer2Oracle;

implementation

uses
  unDmPrincipal, unPrincipal, SDOra, Registry;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  SQLServer2Oracle.Controller(CtrlCode);
end;

function TSQLServer2Oracle.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TSQLServer2Oracle.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'CONEXIA - Servicio que provee la recepción de información desde SQLSERVER a ORACLE.');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TSQLServer2Oracle.ServiceStart(Sender: TService; var Started: Boolean);
begin
  {$IFNDEF SERVICE}
  unDebug.AddToLog('Iniciando Servicio de ' + Application.Title, ltInfo);
  {$ENDIF}
  LogMessage('Iniciando Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
  TimerServiceTimer(nil);
end;

procedure TSQLServer2Oracle.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  {$IFNDEF SERVICE}
  unDebug.AddToLog('Finalizando Servicio de ' + Application.Title, ltInfo);
  {$ENDIF}
  LogMessage('Finalizando Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
  try
    frmPrincipal.Free;
  except
  end;
end;

procedure TSQLServer2Oracle.ServiceCreate(Sender: TObject);
begin
  {$IFNDEF SERVICE}
  unDebug.AddToLog('Creando el Servicio de ' + Application.Title, ltInfo);
  {$ENDIF}
//  LogMessage('Creando el Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
end;

procedure TSQLServer2Oracle.ServiceDestroy(Sender: TObject);
begin
  {$IFNDEF SERVICE}
  unDebug.AddToLog('Destruyendo el Servicio de ' + Application.Title, ltInfo);
  {$ENDIF}
//  LogMessage('Destruyendo el Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
end;

procedure TSQLServer2Oracle.ServiceExecute(Sender: TService);
begin
  LogMessage('Ejecutando el Servicio de ' + Application.Title, EVENTLOG_INFORMATION_TYPE, 0, 0);
  {$IFNDEF SERVICE}
  unDebug.AddToLog('Ejecutando el Servicio de ' + Application.Title, ltInfo);
  {$ENDIF}
  while not Self.Terminated do
    ServiceThread.ProcessRequests(True);
end;

procedure TSQLServer2Oracle.TimerServiceTimer(Sender: TObject);
begin
  if dmPrincipal.VerificaConexion({$IFDEF SERVICE}Self{$ENDIF}) then
  begin
    {$IFNDEF SERVICE}
    unDebug.AddToLog('Ejecutando el Timer del Servicio de ' + Application.Title, ltInfo);
    {$ENDIF}
    TimerService.Enabled := False;
    try
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
    finally
      TimerService.Enabled := True;
    end;
  end;
end;

end.
