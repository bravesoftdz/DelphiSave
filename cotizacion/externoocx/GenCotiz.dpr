library GenCotiz;

uses
  ComServ,
  unCustomDataModule in '..\..\Comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\..\Comunes\ORACLE\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  GenCotiz_TLB in 'GenCotiz_TLB.pas',
  unQRCartaSolicitud in '..\Reports\unQRCartaSolicitud.pas' {QrCartaSolicitud: TQuickRep},
  GeneracionCotizacionImpl in 'GeneracionCotizacionImpl.pas' {GeneracionCotizacion: TActiveForm} {GeneracionCotizacion: CoClass},
  DateTimeEditors in '..\..\..\paquetes\firesoft\DateTimeEditors.pas',
  PatternEdit in '..\..\..\paquetes\firesoft\PatternEdit.pas',
  IntEdit in '..\..\..\paquetes\firesoft\IntEdit.pas',
  QueryPrint in '..\..\..\paquetes\firesoft\QueryPrint.pas',
  CardinalEdit in '..\..\..\paquetes\firesoft\CardinalEdit.pas',
  ArtComboBox in '..\..\..\paquetes\ArtComboBox.pas',
  unSesion in '..\..\..\comunes\unSesion.pas',
  unVisualizador in '..\..\comunes\unVisualizador.pas' {frmVisualizador},
  unFraToolbarRTF in '..\..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unCustomForm in '..\..\comunes\unCustomForm.pas' {frmCustomForm},
  unMoldeEnvioMail in '..\..\comunes\envio de mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unCustomConsulta in '..\..\comunes\reposit\unCustomConsulta.pas' {frmCustomConsulta: TFSForm},
  unSeleccionDestinatarios in '..\..\comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios: TFSForm},
  unPrincipal in '..\..\comunes\unPrincipal.pas' {frmPrincipal},
  unArtFrame in '..\..\comunes\reposit\unArtFrame.pas' {ArtFrame: TFrame},
  unArtDBAwareFrame in '..\..\comunes\reposit\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unArtDbFrame in '..\..\comunes\reposit\unArtDbFrame.pas' {ArtDbFrame: TFrame},
  unFraCodigoDescripcion in '..\..\comunes\frames\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unFraCodDesc in '..\..\comunes\frames\nuevos\unFraCodDesc.pas' {fraCodDesc: TFrame},
  unContratoContacto in '..\..\afiliaciones\unContratoContacto.pas' {frmContratoContacto},
  unfraContacto in '..\..\comunes\frames\unfraContacto.pas' {fraContacto: TFrame},
  unFraStaticCodigoDescripcion in '..\..\comunes\frames\unFraStaticCodigoDescripcion.pas' {fraStaticCodigoDescripcion: TFrame},
  unFraStaticCTB_TABLAS in '..\..\comunes\frames\unFraStaticCTB_TABLAS.pas' {fraStaticCTB_TABLAS: TFrame},
  unFraTelefono in '..\..\comunes\frames\new\unFraTelefono.pas' {fraTelefono: TFrame},
  unABMTelefonos in '..\..\comunes\forms\unABMTelefonos.pas' {frmTelefonos},
  unTelefonosCargaRapida in '..\..\comunes\forms\unTelefonosCargaRapida.pas' {frmTelefonosCargaRapida},
  unCustomGridABM in '..\..\comunes\reposit\unCustomGridABM.pas' {frmCustomGridABM: TFSForm},
  unLibretaDeDirecciones in '..\..\comunes\forms\unLibretaDeDirecciones.pas' {frmLibretaDeDirecciones: TFSForm},
  unFraUsuario in '..\..\comunes\frames\new\unFraUsuario.pas' {fraUsuarios: TFrame},
  unEspera in '..\..\comunes\forms\unEspera.pas' {frmEspera},
  unDebug in '..\..\comunes\unDebug.pas' {frmDebug},
  unCustomPanelABM in '..\..\comunes\reposit\unCustomPanelABM.pas' {frmCustomPanelABM: TFSForm};

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
