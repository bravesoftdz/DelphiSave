program ms;

uses
  SvcMgr,
  SysUtils,
  unDmPrincipal in '..\Comunes\ORACLE\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unCustomDataModule in '..\comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  ArchFuncs in '..\..\Comunes\ArchFuncs.pas',
  IArtMail in '..\Comunes\IArtMail.pas',
  WinShell in 'WinShell.pas',
  srvMailSender in 'srvMailSender.pas' {MailSender: TService},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unSesion in '..\..\Comunes\unSesion.pas',
  unDirUtils in '..\..\comunes\unDirUtils.pas',
  Internet in '..\..\comunes\Internet.pas',
  VCLExtra in '..\..\comunes\VCLExtra.pas',
  unCustomForm in '..\comunes\unCustomForm.pas' {frmCustomForm},
  unDebug in '..\comunes\unDebug.pas' {frmDebug},
  unEspera in '..\comunes\forms\unEspera.pas' {frmEspera},
  unMoldeEnvioMail in '..\comunes\envio de mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unFraToolbarRTF in '..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unArt in '..\..\comunes\unArt.pas',
  unCustomConsulta in '..\comunes\reposit\unCustomConsulta.pas' {frmCustomConsulta: TFSForm},
  unSeleccionDestinatarios in '..\comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios: TFSForm};

{$R *.RES}

begin
  Application.Initialize;
 	Application.Title := 'Mail Sender';
//  Sleep(5000);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  dmPrincipal.sdbPrincipal.Open;
  if dmPrincipal.sdbPrincipal.Connected then
  begin
    Application.CreateForm(TMailSender, MailSender);
    Application.Run;
  end;
end.
