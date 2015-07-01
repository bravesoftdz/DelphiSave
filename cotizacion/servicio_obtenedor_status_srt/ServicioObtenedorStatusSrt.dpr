program ServicioObtenedorStatusSrt;

uses
  SvcMgr,
  SysUtils,
  unCustomDataModule in '..\..\comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\..\comunes\oracle\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unServicio in 'unServicio.pas' {frmServicioStatusSrt: TService},
  unCustomForm in '..\..\comunes\unCustomForm.pas' {frmCustomForm},
  unDebug in '..\..\comunes\unDebug.pas' {frmDebug},
  unEspera in '..\..\comunes\forms\unEspera.pas' {frmEspera},
  unSesion in '..\..\..\comunes\unSesion.pas',
  unArt in '..\..\..\comunes\unArt.pas',
  strfuncs in '..\..\..\comunes\strfuncs.pas',
  General in '..\..\..\comunes\General.pas',
  unEsperaSimple in '..\..\comunes\forms\unEsperaSimple.pas' {frmEsperaSimple},
  unImportCryptoSrt in '..\..\..\comunes\unImportCryptoSrt.pas',
  unImportFromSRT in '..\..\comunes\unImportFromSRT.pas' {frmImportFromSRT};

{$R *.RES}

begin
  Application.Initialize;

  Application.Title := 'Servicio Obtenedor del Status de una empresa ante la SRT';
  Application.CreateForm(TdmPrincipal, dmPrincipal);

  if dmPrincipal.sdbPrincipal.Connected then
    Application.CreateForm(TfrmServicioStatusSrt, frmServicioStatusSrt);

  Application.Run;
end.
