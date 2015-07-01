program Ora2SQLServer;

uses
  Forms,
  Windows,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  General in '..\..\..\comunes\General.pas',
  unDebug in '..\..\comunes\unDebug.pas' {frmDebug},
  unCustomDataModule in '..\..\comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\..\comunes\oracle\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unArt in '..\..\..\Comunes\unArt.pas',
  unCustomConsulta in '..\..\comunes\reposit\unCustomConsulta.pas' {frmCustomConsulta},
  unCustomForm in '..\..\comunes\unCustomForm.pas' {frmCustomForm},
  unDmPrincipal_SQLServer in '..\..\comunes\SqlServer\unDmPrincipal_SQLServer.pas' {dmPrincipal_SQLServer: TDataModule},
  SqlServer in '..\..\..\Comunes\SqlServer.pas',
  SqlOracle in '..\..\..\Comunes\SqlOracle.pas',
  unFraToolbarRTF in '..\..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unSeleccionDestinatarios in '..\..\comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios: TFSForm},
  VCLExtra in '..\..\..\comunes\VCLExtra.pas',
  unSesion in '..\..\..\comunes\unSesion.pas',
  unMoldeEnvioMail in '..\..\comunes\envio de mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unCustomGridABM in '..\..\comunes\reposit\unCustomGridABM.pas' {frmCustomGridABM: TFSForm},
  unCustomPanelABM in '..\..\comunes\reposit\unCustomPanelABM.pas' {frmCustomPanelABM: TFSForm},
  unLibretaDeDirecciones in '..\..\comunes\forms\unLibretaDeDirecciones.pas' {frmLibretaDeDirecciones: TFSForm},
  unArtFrame in '..\..\comunes\reposit\unArtFrame.pas' {ArtFrame: TFrame},
  unArtDBAwareFrame in '..\..\comunes\reposit\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unArtDbFrame in '..\..\comunes\reposit\unArtDbFrame.pas' {ArtDbFrame: TFrame},
  unFraCodigoDescripcion in '..\..\comunes\frames\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unfraUsuarios in '..\..\comunes\frames\unfraUsuarios.pas' {fraUsuario: TFrame},
  unFraUsuario in '..\..\comunes\frames\new\unFraUsuario.pas' {fraUsuarios: TFrame},
  unFraCodDesc in '..\..\comunes\frames\nuevos\unFraCodDesc.pas' {fraCodDesc: TFrame},
  unfraContacto in '..\..\comunes\frames\unfraContacto.pas' {fraContacto: TFrame},
  unFraStaticCodigoDescripcion in '..\..\comunes\frames\unFraStaticCodigoDescripcion.pas' {fraStaticCodigoDescripcion: TFrame},
  unFraStaticCTB_TABLAS in '..\..\comunes\frames\unFraStaticCTB_TABLAS.pas' {fraStaticCTB_TABLAS: TFrame},
  unFraTelefono in '..\..\comunes\frames\new\unFraTelefono.pas' {fraTelefono: TFrame},
  unFraCtbTablas in '..\..\comunes\frames\unFraCtbTablas.pas' {fraCtbTablas: TFrame},
  unABMTelefonos in '..\..\comunes\forms\unABMTelefonos.pas' {frmTelefonos},
  unTelefonosCargaRapida in '..\..\comunes\forms\unTelefonosCargaRapida.pas' {frmTelefonosCargaRapida},
  unEspera in '..\..\comunes\forms\unEspera.pas' {frmEspera};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Conexia Sincronization';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
