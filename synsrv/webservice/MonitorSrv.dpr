program MonitorSrv;

{$APPTYPE GUI}

uses
  Forms,
//  SockApp,
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
  unPrincipal in '..\..\mailsender\unPrincipal.pas' {frmPrincipal},
  frmSyncSrv in 'frmSyncSrv.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmWebModuleSincronizacion, dmWebModuleSincronizacion);
  Application.Run;
end.
