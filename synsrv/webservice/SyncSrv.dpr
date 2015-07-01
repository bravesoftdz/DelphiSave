library SyncSrv;

uses
  ActiveX,
  ComObj,
  WebBroker,
  ISAPIThreadPool,
  unSyncSrv in 'unSyncSrv.pas' {dmWebModuleSincronizacion: TWebModule},
  SyncSrvImpl in 'SyncSrvImpl.pas',
  SyncSrvIntf in 'SyncSrvIntf.pas',
  unSyncProc in '..\Comunes\unSyncProc.pas',
  unSyncProcSqlServer in '..\Comunes\unSyncProcSqlServer.pas',
  unDmPrincipal in '..\..\Comunes\ORACLE\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unCustomDataModule in '..\..\comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unLogs in '..\..\comunes\unLogs.pas',
  unDebug in '..\..\comunes\unDebug.pas' {frmDebug},
  unCustomForm in '..\..\comunes\unCustomForm.pas' {frmCustomForm},
  unEspera in '..\..\comunes\forms\unEspera.pas' {frmEspera};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.CreateForm(TdmWebModuleSincronizacion, dmWebModuleSincronizacion);
  Application.Run;
end.
