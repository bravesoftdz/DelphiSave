program ServicioWorldsys;

uses
  SvcMgr,
  unCustomDataModule in '..\..\comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\..\comunes\oracle\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unCustomForm in '..\..\comunes\unCustomForm.pas' {frmCustomForm},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unEnvioMail in '..\..\..\comunes\unEnvioMail.pas',
  unMoldeEnvioMail in '..\..\comunes\envio de mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  numeros in '..\..\..\comunes\numeros.pas',
  unServicio in 'unServicio.pas' {frmServicioActualizacionWorldsys: TService},
  DBFuncs in '..\..\..\comunes\DBFuncs.pas',
  AnsiSql in '..\..\..\comunes\AnsiSql.pas',
  unArt in '..\..\..\comunes\unArt.pas',
  unDebug in '..\..\comunes\unDebug.pas' {frmDebug},
  unSesion in '..\..\..\comunes\unSesion.pas',
  unFraToolbarRTF in '..\..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unEspera in '..\..\comunes\forms\unEspera.pas' {frmEspera};

{$R *.RES}

begin
  Application.Initialize;

  Application.Title := 'Servicio Actualizacion Worldsys';
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  if dmPrincipal.sdbPrincipal.Connected then
     Application.CreateForm(TfrmServicioActualizacionWorldsys, frmServicioActualizacionWorldsys);
  Application.Run;
end.
