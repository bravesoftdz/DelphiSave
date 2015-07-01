
{********************************************************}
{                                                        }
{    Sistema de Fax - Cliente                            }
{    En este aplicativo se encuentran las consultas de   }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  10/2003                                     }
{                                                        }
{********************************************************}

program FaxClient;

uses
  OneInstance,
  Forms,
  Controls,
  Windows,
  unCustomDataModule in '..\..\Comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\..\Comunes\ORACLE\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unCustomPrincipal in '..\..\comunes\reposit\unCustomPrincipal.pas' {frmCustomPrincipal},
  unArtFrame in '..\..\Comunes\REPOSIT\unArtFrame.pas' {ArtFrame: TFrame},
  unArtDBAwareFrame in '..\..\Comunes\REPOSIT\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unArtDbFrame in '..\..\Comunes\REPOSIT\unArtDbFrame.pas' {ArtDbFrame: TFrame},
  unFraCodigoDescripcion in '..\..\Comunes\FRAMES\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unCustomConsulta in '..\..\Comunes\REPOSIT\unCustomConsulta.pas' {frmCustomConsulta},
  unCustomSplash in '..\..\Comunes\REPOSIT\unCustomSplash.pas' {frmCustomSplash},
  unWelcomeSplash in '..\unWelcomeSplash.pas' {frmWelcomeSplash},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unConsFax in '..\..\Comunes\Forms\unConsFax.pas' {frmConsFax},
  unCustomGridABM in '..\..\Comunes\REPOSIT\unCustomGridABM.pas' {frmCustomGridABM},
  unManFFO_FAXFORMULARIO in 'unManFFO_FAXFORMULARIO.pas' {frmManFFO_FAXFORMULARIO},
  unCustomPanelABM in '..\..\Comunes\REPOSIT\unCustomPanelABM.pas' {frmCustomPanelABM},
  unManFFU_FORMULARIOUSUARIO in 'unManFFU_FORMULARIOUSUARIO.pas' {frmManFFU_FORMULARIOUSUARIO},
  unConsulta in '..\..\Comunes\Forms\unConsulta.pas' {frmConsulta},
  unEstrategiaTIFF in 'unEstrategiaTIFF.pas',
  unEspera in '..\..\comunes\forms\unEspera.pas' {frmEspera},
  unSesion in '..\..\..\Comunes\unSesion.pas',
  unDebug in '..\..\comunes\unDebug.pas' {frmDebug},
  unCITRIX in '..\..\..\Comunes\unCITRIX.pas',
  General in '..\..\..\Comunes\General.pas',
  libgfl in '..\..\..\Comunes\libgfl.pas',
  unImageFunctions in '..\..\..\Comunes\unImageFunctions.pas',
  CustomDlgs in '..\..\..\Comunes\CustomDlgs.pas',
  unCustomForm in '..\..\comunes\unCustomForm.pas' {frmCustomForm},
  unSeleccionDestinatarios in '..\..\comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios: TFSForm},
  unFraCtbTablas in '..\..\comunes\frames\unFraCtbTablas.pas' {fraCtbTablas: TFrame},
  OneSession in '..\..\..\comunes\OneSession.pas',
  unNovedades in '..\..\..\comunes\unNovedades.pas',
  unCapturarCodigoBarras in '..\..\comunes\unCapturarCodigoBarras.pas' {frmCapturarCodigoBarras},
  unFraTrabajador in '..\..\Comunes\FRAMES\NEW\unFraTrabajador.pas' {fraTrabajador: TFrame},
  unFraEstablecimiento in '..\..\Comunes\FRAMES\new\unFraEstablecimiento.pas' {fraEstablecimiento: TFrame},
  unArchivo in '..\..\archivo_new\unArchivo.pas',
  unFrmConsultaCarpetas in '..\..\archivo_new\unFrmConsultaCarpetas.pas' {FrmConsultaCarpetas: TFSForm},
  unFrmSolicitudCarpeta in '..\..\archivo_new\unFrmSolicitudCarpeta.pas' {FrmSolicitudCarpeta: TFSForm},
  unQrEtiquetasCarpetas in '..\..\archivo_new\unQrEtiquetasCarpetas.pas' {qrEtiquetasCarpetas: TQuickRep},
  unFraDetalleArchivo in '..\..\archivo_new\frames\unFraDetalleArchivo.pas' {fraDetalleArchivo: TFrame},
  unFrmDetalleArchivo in '..\..\archivo_new\unFrmDetalleArchivo.pas' {FrmDetalleArchivo},
  unMovimientoCarpetas in '..\..\archivo_new\unMovimientoCarpetas.pas' {frmMovimientoCarpetas},
  unFrmCargaDocumentacion in '..\..\archivo_new\unFrmCargaDocumentacion.pas' {frmCargaDocumentacion},
  unQrDetalleLoteEstudio in '..\..\archivo_new\unQrDetalleLoteEstudio.pas' {QrDetalleLoteEstudio},
  unReemplazoCarpetas in '..\..\archivo_new\unReemplazoCarpetas.pas' {frmReemplazoCarpetas},
  unfrmUbicacionActual in '..\..\archivo_new\unfrmUbicacionActual.pas' {FrmUbicacionActual},
  unFraFiltroArchivo in '..\..\archivo_new\frames\unFraFiltroArchivo.pas' {fraFiltroArchivo: TFrame},
  unfraArchJuicio in '..\..\archivo_new\frames\unfraArchJuicio.pas' {fraArchJuicio: TFrame},
  unfraSectores in '..\..\Comunes\Frames\unfraSectores.pas' {fraSectores: TFrame},
  unfraProveedor in '..\..\comunes\frames\new\unfraProveedor.pas' {fraProveedor: TFrame},
  unQrEtiquetasDocCarpetas in '..\..\archivo_new\unQrEtiquetasDocCarpetas.pas' {qrEtiquetasDocCarpetas: TQuickRep},
  unUtilsArchivo in '..\..\archivo_new\unUtilsArchivo.pas',
  unConstantArchivo in '..\..\archivo_new\unConstantArchivo.pas',
  unComunesArchivo in '..\..\archivo_new\unComunesArchivo.pas',
  unFraVistaTIFF in '..\..\comunes\frames\new\unFraVistaTIFF.pas' {fraVistaTIFF: TFrame},
  unFraRTD_TIPODOCUMENTO in '..\..\comunes\frames\new\unFraRTD_TIPODOCUMENTO.pas' {fraRTD_TIPODOCUMENTO: TFrame},
  unfraVendedores in '..\..\Comunes\FRAMES\unfraVendedores.pas' {fraVendedores: TFrame},
  unfraVendedoresCUIT in '..\..\Comunes\FRAMES\NEW\unfraVendedoresCUIT.pas' {fraVendedoresCUIT: TFrame},
  unfraEntidadCUIT in '..\..\Comunes\FRAMES\NEW\unfraEntidadCUIT.pas' {fraEntidadCUIT: TFrame},
  unfraCPR_PRESTADOR in '..\..\comunes\frames\new\unfraCPR_PRESTADOR.pas' {fraCPR_PRESTADOR: TFrame},
  unFraTrabajadorSiniestro in '..\..\comunes\frames\new\unFraTrabajadorSiniestro.pas' {fraTrabajadorSiniestro: TFrame},
  unfraPrestador in '..\..\comunes\frames\unfraPrestador.pas' {fraPrestador: TFrame},
  unfraDelegacion in '..\..\comunes\frames\unfraDelegacion.pas' {fraDelegacion: TFrame},
  unVentanillaElectronica in '..\..\comunes\forms\unVentanillaElectronica.pas' {frmVentanillaElectronica: TFSForm},
  unAfiliaciones in '..\..\afiliaciones\unAfiliaciones.pas',
  unfraCuentaBancaria in '..\..\Comunes\FRAMES\NEW\unfraCuentaBancaria.pas' {fraCuentaBancaria: TFrame},
  unFaxEnviados in '..\..\comunes\forms\unFaxEnviados.pas' {frmFaxEnviados},
  unfraFFO_FAXFORMULARIO in '..\..\comunes\frames\unfraFFO_FAXFORMULARIO.pas' {fraFFO_FAXFORMULARIO: TFrame},
  unRptAnexoRes365 in '..\..\comunes\reports\unRptAnexoRes365.pas' {qrAnexoRes365: TQuickRep},
  unRptFormularioValidacionYRectificacionDatosEstablecimientos in '..\..\comunes\reports\unRptFormularioValidacionYRectificacionDatosEstablecimientos.pas' {qrFormularioValidacionYRectificacionDatosEstablecimientos: TQuickRep},
  unRptPlantillaRGRL in '..\..\comunes\reports\unRptPlantillaRGRL.pas' {qrPlantillaRGRL: TQuickRep},
  unRptGestionDeReclamos in '..\..\comunes\reports\unRptGestionDeReclamos.pas' {frmRptGestionDeReclamos},
  unFraDomicilioGIS in '..\..\comunes\frames\new\unFraDomicilioGIS.pas' {fraDomicilioGIS: TFrame},
  unRptRGRL in '..\..\comunes\reports\unRptRGRL.pas' {qrRGRL: TQuickRep},
  unRGRL in '..\..\comunes\forms\unRGRL.pas' {frmRGRL},
  unRptEstadisticasRGRL in '..\..\comunes\reports\unRptEstadisticasRGRL.pas' {qrEstadisticasRGRL: TQuickRep},
  unfraCodigoDescripcionExt in '..\..\comunes\frames\unfraCodigoDescripcionExt.pas' {fraCodigoDescripcionExt: TFrame},
  unManRDO_DOCUMENTO in '..\..\archivo_new\abm\unManRDO_DOCUMENTO.pas' {frmManRDO_DOCUMENTO: TFSForm},
  unFraNavegadorWEB in '..\..\comunes\frames\new\unFraNavegadorWEB.pas' {fraNavegadorWEB: TFrame},
  unFraDomicilio in '..\..\Comunes\FRAMES\NEW\unFraDomicilio.pas' {fraDomicilio: TFrame},
  unfraContacto in '..\..\Comunes\FRAMES\unfraContacto.pas' {fraContacto: TFrame},
  unFraTelefono in '..\..\Comunes\FRAMES\NEW\unFraTelefono.pas' {fraTelefono: TFrame},
  unART in '..\..\..\Comunes\unART.pas',
  unFraEmpresa in '..\..\Comunes\FRAMES\NEW\unFraEmpresa.pas' {fraEmpresa: TFrame},
  unFraUsuario in '..\..\Comunes\FRAMES\NEW\unFraUsuario.pas' {fraUsuarios: TFrame},
  unFraToolbarRTF in '..\..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unFraStaticCodigoDescripcion in '..\..\Comunes\FRAMES\unFraStaticCodigoDescripcion.pas' {fraStaticCodigoDescripcion: TFrame},
  unFraStaticCTB_TABLAS in '..\..\Comunes\FRAMES\unFraStaticCTB_TABLAS.pas' {fraStaticCTB_TABLAS: TFrame},
  unFraCodDesc in '..\..\Comunes\FRAMES\NUEVOS\unFraCodDesc.pas' {fraCodDesc: TFrame},
  unRptCartaDocHeader in '..\..\Comunes\REPORTS\unRptCartaDocHeader.pas' {rptCartaDocHeader: TQuickRep},
  unMoldeEnvioMail in '..\..\Comunes\Envio de Mails\unMoldeEnvioMail.pas',
  unVisualizador in '..\..\Comunes\unVisualizador.pas' {frmVisualizador},
  unRptCartaDocumento in '..\..\Comunes\REPORTS\unRptCartaDocumento.pas' {rptCartaDocumento: TQuickRep},
  unImpoExpoWizard in '..\..\impoexpo\unImpoExpoWizard.pas' {frmImpoExpoWizard},
  unQrDetalleRemitoDevolucion in '..\..\archivo_new\unQrDetalleRemitoDevolucion.pas' {QrDetalleRemitoDevolucion},
  unfraUsuarios in '..\..\Comunes\FRAMES\unfraUsuarios.pas' {fraUsuario: TFrame},
  unFraEmpresaAfi in '..\..\comunes\frames\new\unFraEmpresaAfi.pas' {fraEmpresaAfi: TFrame},
  unLibretaDeDirecciones in '..\..\comunes\forms\unLibretaDeDirecciones.pas' {frmLibretaDeDirecciones: TFSForm},
  unABMTelefonos in '..\..\comunes\forms\unABMTelefonos.pas' {frmTelefonos},
  unContratoContacto in '..\..\comunes\forms\unContratoContacto.pas' {frmContratoContacto},
  unElementosEnviados in '..\..\comunes\forms\unElementosEnviados.pas' {frmElementosEnviados: TFSForm},
  unCargaDocumentosDigitaliz in '..\..\comunes\forms\unCargaDocumentosDigitaliz.pas' {frmCargaDocumentosDigitaliz},
  unBusquedaDomicilio in '..\..\comunes\forms\unBusquedaDomicilio.pas' {frmBusquedaDomicilio: TFSForm},
  unClasificacionActivos in '..\..\comunes\forms\unClasificacionActivos.pas' {frmClasificacionActivos: TFSForm},
  unAgendaTelefonica in '..\..\comunes\forms\unAgendaTelefonica.pas' {frmAgendaTelefonica: TFSForm},
  unAnexoRes365 in '..\..\comunes\forms\unAnexoRes365.pas' {frmAnexoRes365},
  unFormularioValidacionYRectificacionDatosEstablecimientos in '..\..\comunes\forms\unFormularioValidacionYRectificacionDatosEstablecimientos.pas' {frmFormularioValidacionYRectificacionDatosEstablecimientos},
  unGoogleMaps in '..\..\comunes\forms\unGoogleMaps.pas' {frmGoogleMaps},
  unManCGI_GIS in '..\..\comunes\forms\unManCGI_GIS.pas' {frmManCGI_GIS: TFSForm},
  unManCTA_TIPOACTIVOS in '..\..\comunes\forms\unManCTA_TIPOACTIVOS.pas' {frmManCTA_TIPOACTIVOS: TFSForm},
  unManCVS_VENTANILLA_SUBTEMAS in '..\..\comunes\forms\unManCVS_VENTANILLA_SUBTEMAS.pas' {frmManCVS_VENTANILLA_SUBTEMAS: TFSForm},
  unSeleccionMultiple in '..\..\comunes\forms\unSeleccionMultiple.pas' {frmSeleccionUsuarios: TFrame},
  unTelefonosCargaRapida in '..\..\comunes\forms\unTelefonosCargaRapida.pas' {frmTelefonosCargaRapida},
  unVisor in '..\..\comunes\forms\unVisor.pas' {frmVisor},
  unVisorExcel in '..\..\comunes\forms\unVisorExcel.pas' {frmVisorExcel},
  unVisorPDF in '..\..\comunes\forms\unVisorPDF.pas' {frmVisorPDF},
  unManCPG_PLAZOGUARDA in '..\..\comunes\forms\unManCPG_PLAZOGUARDA.pas' {frmManCPG_PLAZOGUARDA: TFSForm},
  Vcl.Themes,
  Vcl.Styles,
  unFraWebBrowser in '..\..\comunes\frames\new\unFraWebBrowser.pas' {fraWebBrowser: TFrame},
  unFraGIS_APIv3 in '..\..\comunes\frames\new\unFraGIS_APIv3.pas' {fraGIS_APIv3: TFrame},
  unEnvioSMS in '..\..\comunes\forms\unEnvioSMS.pas' {frmEnvioSMS},
  unEsperaSimple in '..\..\comunes\forms\unEsperaSimple.pas' {frmEsperaSimple},
  unFrmArmadoLote in '..\..\archivo_new\unFrmArmadoLote.pas' {FrmArmadoLote: TFSForm},
  unQrDetalleLote in '..\..\archivo_new\unQrDetalleLote.pas' {QrDetalleLote},
  unRptResumenLotes in '..\..\archivo_new\unRptResumenLotes.pas' {qrResumenLotes: TQuickRep},
  unVerImagenes in '..\..\archivo_new\unVerImagenes.pas' {frmVerImagenes};

{$R *.RES}

begin
  OnlyOneInstance;
  Application.Initialize;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.Title := 'ART - FaxClient';

  with TfrmWelcomeSplash.Create(Application) do
  try
    ShowOnTop;
    Application.CreateForm(TdmPrincipal, dmPrincipal);
    if dmPrincipal.sdbPrincipal.Connected then
      Application.CreateForm(TfrmPrincipal, frmPrincipal);

    OnlyOneSession;
  finally
    Free;
  end;

  MostrarNovedades;
  Application.Run;
end.
