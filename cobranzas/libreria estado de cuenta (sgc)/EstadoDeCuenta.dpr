library EstadoDeCuenta;

uses
  ComServ,
  EstadoDeCuentaProject_TLB in 'EstadoDeCuentaProject_TLB.pas',
  EstadoDeCuentaImplementation in 'EstadoDeCuentaImplementation.pas' {frmEstadoDeCuenta: TActiveForm} {EstadoDeCuenta: CoClass},
  unImpresionEstadoDeCuenta in '..\unImpresionEstadoDeCuenta.pas' {frmImpresionEstadodeCuenta},
  unQrEstadoCuentaResumen in '..\Reports\unQrEstadoCuentaResumen.pas' {frmEstadoCuentaResumen},
  unQrEstadoCuentaDetalle in '..\Reports\unQrEstadoCuentaDetalle.pas' {frmEstadoCuentaDetalle},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unCustomForm in '..\..\Comunes\unCustomForm.pas' {frmCustomForm},
  unCustomDataModule in '..\..\Comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\..\Comunes\ORACLE\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unFraToolbarRTF in '..\..\Comunes\FRAMES\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unCustomConsulta in '..\..\Comunes\REPOSIT\unCustomConsulta.pas' {frmCustomConsulta},
  unMoldeEnvioMail in '..\..\Comunes\Envio de Mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unSeleccionDestinatarios in '..\..\Comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios},
  unEnvioMail in '..\..\..\Comunes\unEnvioMail.pas',
  unContratoContacto in '..\..\Afiliaciones\unContratoContacto.pas',
  unFraTelefono in '..\..\Comunes\FRAMES\NEW\unFraTelefono.pas',
  unArtFrame in '..\..\Comunes\REPOSIT\unArtFrame.pas' {ArtFrame: TFrame},
  unArtDbFrame in '..\..\Comunes\REPOSIT\unArtDbFrame.pas',
  unArtDBAwareFrame in '..\..\Comunes\REPOSIT\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unfraContacto in '..\..\Comunes\FRAMES\unfraContacto.pas',
  unFraStaticCodigoDescripcion in '..\..\Comunes\FRAMES\unFraStaticCodigoDescripcion.pas' {fraStaticCodigoDescripcion: TFrame},
  unFraStaticCTB_TABLAS in '..\..\Comunes\FRAMES\unFraStaticCTB_TABLAS.pas' {fraStaticCTB_TABLAS: TFrame},
  unABMTelefonos in '..\..\Comunes\Forms\unABMTelefonos.pas',
  unFraCodigoDescripcion in '..\..\Comunes\FRAMES\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unFraCodDesc in '..\..\Comunes\FRAMES\NUEVOS\unFraCodDesc.pas' {fraCodDesc: TFrame},
  unLibretaDeDirecciones in '..\..\Comunes\Forms\unLibretaDeDirecciones.pas',
  unCustomGridABM in '..\..\Comunes\REPOSIT\unCustomGridABM.pas' {frmCustomGridABM},
  unCustomPanelABM in '..\..\Comunes\REPOSIT\unCustomPanelABM.pas' {frmCustomPanelABM},
  unTelefonosCargaRapida in '..\..\Comunes\Forms\unTelefonosCargaRapida.pas' {frmTelefonosCargaRapida},
  unFraUsuario in '..\..\comunes\frames\new\unFraUsuario.pas' {fraUsuarios: TFrame},
  unVisualizador in '..\..\comunes\unVisualizador.pas' {frmVisualizador},
  unRptCartaDocHeader in '..\..\comunes\reports\unRptCartaDocHeader.pas' {rptCartaDocHeader: TQuickRep},
  unRptCartaDocumento in '..\..\comunes\reports\unRptCartaDocumento.pas' {rptCartaDocumento: TQuickRep},
  unQRF817 in '..\reports\unQRF817.pas' {QRF817: TQuickRep},
  unQRCartaDocIntimacion in '..\reports\unQRCartaDocIntimacion.pas' {QRCartaDocIntimacion: TQuickRep},
  unQRF801C in '..\reports\unQRF801C.pas' {QRF801C: TQuickRep},
  unDebug in '..\..\comunes\unDebug.pas' {frmDebug},
  unRptCartaDocCompensacion in '..\compensacion\reports\unRptCartaDocCompensacion.pas' {rptCartaDocCompensacion: TQuickRep},
  unEstadoCuenta in '..\unEstadoCuenta.pas';

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
