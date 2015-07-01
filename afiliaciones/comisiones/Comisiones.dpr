program Comisiones;

{$R *.dres}

uses
  OneInstance,
  Forms,
  Controls,
  Windows,
  unCustomDataModule in '..\..\Comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\..\Comunes\ORACLE\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unCustomConsulta in '..\..\Comunes\REPOSIT\unCustomConsulta.pas' {frmCustomConsulta},
  unArtFrame in '..\..\Comunes\REPOSIT\unArtFrame.pas' {ArtFrame: TFrame},
  unArtDBAwareFrame in '..\..\Comunes\REPOSIT\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unArtDbFrame in '..\..\Comunes\REPOSIT\unArtDbFrame.pas' {ArtDbFrame: TFrame},
  unFraCodigoDescripcion in '..\..\Comunes\FRAMES\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unCustomGridABM in '..\..\Comunes\REPOSIT\unCustomGridABM.pas' {frmCustomGridABM},
  unCustomPanelABM in '..\..\Comunes\REPOSIT\unCustomPanelABM.pas' {frmCustomPanelABM},
  unFraDomicilio in '..\..\Comunes\FRAMES\NEW\unFraDomicilio.pas' {fraDomicilio: TFrame},
  unFraCtbTablas in '..\..\Comunes\FRAMES\unFraCtbTablas.pas' {fraCtbTablas: TFrame},
  unfraVendedores in '..\..\Comunes\FRAMES\unfraVendedores.pas' {fraVendedores: TFrame},
  unDmFinancials in '..\..\Comunes\ORACLE\unDmFinancials.pas' {dmFinancials: TDataModule},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unManEntidad in 'unManEntidad.pas' {frmManEntidad},
  unManVendedor in 'unManVendedor.pas' {frmManVendedor},
  unfraEntidadCUIT in '..\..\Comunes\FRAMES\NEW\unfraEntidadCUIT.pas' {fraEntidadCUIT: TFrame},
  unfraVendedoresCUIT in '..\..\Comunes\FRAMES\NEW\unfraVendedoresCUIT.pas' {fraVendedoresCUIT: TFrame},
  UnFirmantes in 'UnFirmantes.pas' {frmFirmantes},
  unComisionesALiquidar in 'unComisionesALiquidar.pas' {frmComisionesALiquidar},
  unComisionesConsulta in 'unComisionesConsulta.pas' {frmComisionesConsulta},
  unComisionesaAprobar in 'unComisionesaAprobar.pas' {frmComisionesaAprobar},
  unRptVendedorEtiquetas in 'unRptVendedorEtiquetas.pas' {rptVendedorEtiquetas: TQuickRep},
  unRPTLiquidacionComisiones in 'unRPTLiquidacionComisiones.pas' {frmRPTLiquidacionComision},
  unRPTComisionesConsulta in 'unRPTComisionesConsulta.pas' {frmRPTComisionesConsulta},
  unfrmCuotasNoPagadas in 'unfrmCuotasNoPagadas.pas' {frmCuotasNoPagadas},
  unRptCuotasNoPagadas in 'unRptCuotasNoPagadas.pas' {frmRptCuotasNoPagadas},
  unGeneraDBF in 'unGeneraDBF.pas' {frmGeneraDBF},
  unRptListadosBAPRO in 'unRptListadosBAPRO.pas' {frmRPTListadosBAPRO},
  unPagosNoComisionables in 'unPagosNoComisionables.pas' {frmPagosNoComisionables},
  unRPTEmpresasSinVendedor in 'unRPTEmpresasSinVendedor.pas' {qrEmpresasSinVendedor: TQuickRep},
  unManCtbTablas in '..\..\Comunes\Forms\unManCtbTablas.pas' {frmManCtbTablas},
  unFraStaticCodigoDescripcion in '..\..\Comunes\FRAMES\unFraStaticCodigoDescripcion.pas' {fraStaticCodigoDescripcion: TFrame},
  unFraStaticCTB_TABLAS in '..\..\Comunes\FRAMES\unFraStaticCTB_TABLAS.pas' {fraStaticCTB_TABLAS: TFrame},
  unManCCP_CUENTAPAGO in '..\..\Comunes\Forms\unManCCP_CUENTAPAGO.pas' {frmManCCP_CUENTAPAGO},
  unAltaModifCCP_CUENTAPAGO in '..\..\Comunes\Forms\unAltaModifCCP_CUENTAPAGO.pas' {frmAltaModifCCP_CUENTAPAGO},
  unfraPrestador in '..\..\comunes\frames\unfraPrestador.pas' {fraPrestador: TFrame},
  unfraCuentaBancaria in '..\..\Comunes\FRAMES\NEW\unfraCuentaBancaria.pas' {fraCuentaBancaria: TFrame},
  unComisionesCerrarPagos in 'unComisionesCerrarPagos.pas' {frmComisionesCerrarPagos},
  unBusquedaDomicilio in '..\..\Comunes\Forms\unBusquedaDomicilio.pas' {frmBusquedaDomicilio},
  unFraEmpresa in '..\..\Comunes\FRAMES\NEW\unFraEmpresa.pas' {fraEmpresa: TFrame},
  unFraDomicilioTrab in '..\..\Comunes\FRAMES\NEW\unFraDomicilioTrab.pas' {fraDomicilioTrab: TFrame},
  unConsEntidadVendedor in 'unConsEntidadVendedor.pas' {frmConsEntidadVendedor},
  unfraCPR_PRESTADOR in '..\..\Comunes\FRAMES\NEW\unfraCPR_PRESTADOR.pas' {fraCPR_PRESTADOR: TFrame},
  unExencionIB in 'unExencionIB.pas' {frmExencionIB},
  unCuitDuplicada in 'unCuitDuplicada.pas' {frmCuitDuplicada},
  unFraCanal in '..\..\Comunes\FRAMES\NEW\unFraCanal.pas' {fraCanal: TFrame},
  unConsultaFacturas in 'unConsultaFacturas.pas' {frmConsultaFacturas},
  unCustomForm in '..\..\Comunes\unCustomForm.pas' {frmCustomForm},
  unSesion in '..\..\..\Comunes\unSesion.pas',
  unLiquidacionesAplicadas in 'unLiquidacionesAplicadas.pas' {frmLiquidacionesAplicadas},
  CustomDlgs in '..\..\..\Comunes\CustomDlgs.pas',
  unVisualizador in '..\..\Comunes\unVisualizador.pas' {frmVisualizador},
  unFiltros in '..\..\..\Comunes\unFiltros.pas',
  unMoldeEnvioMail in '..\..\Comunes\Envio de Mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unFraToolbarRTF in '..\..\Comunes\FRAMES\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unfraContacto in '..\..\Comunes\FRAMES\unfraContacto.pas' {fraContacto: TFrame},
  unContratoContacto in '..\..\comunes\forms\unContratoContacto.pas' {frmContratoContacto},
  unLibretaDeDirecciones in '..\..\Comunes\Forms\unLibretaDeDirecciones.pas' {frmLibretaDeDirecciones},
  unFraTelefono in '..\..\Comunes\FRAMES\NEW\unFraTelefono.pas' {fraTelefono: TFrame},
  unFraCodDesc in '..\..\Comunes\FRAMES\NUEVOS\unFraCodDesc.pas' {fraCodDesc: TFrame},
  unABMTelefonos in '..\..\Comunes\Forms\unABMTelefonos.pas' {frmTelefonos},
  unTelefonosCargaRapida in '..\..\Comunes\Forms\unTelefonosCargaRapida.pas' {frmTelefonosCargaRapida},
  General in '..\..\..\comunes\General.pas',
  ArchFuncs in '..\..\..\comunes\ArchFuncs.pas',
  unManObjetivos in 'unManObjetivos.pas' {frmManObjetivos},
  unObjetivos in 'unObjetivos.pas' {frmObjetivos},
  unfraStaticActividad in '..\..\Comunes\FRAMES\unfraStaticActividad.pas' {fraStaticActividad: TFrame},
  unPasajeProductor in 'unPasajeProductor.pas' {frmPasajeProductor},
  VCLExtra in '..\..\..\comunes\VCLExtra.pas',
  unVisualizadorDigitalizacion in '..\..\comunes\forms\unVisualizadorDigitalizacion.pas',
  unSeleccionDestinatarios in '..\..\comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios},
  unFraVistaTIFF in '..\..\comunes\frames\new\unFraVistaTIFF.pas' {fraVistaTIFF: TFrame},
  unFraRTD_TIPODOCUMENTO in '..\..\comunes\frames\new\unFraRTD_TIPODOCUMENTO.pas' {fraRTD_TIPODOCUMENTO: TFrame},
  unFraTrabajador in '..\..\comunes\frames\new\unFraTrabajador.pas' {fraTrabajador: TFrame},
  unFraDigitalizacion in '..\..\comunes\frames\new\unFraDigitalizacion.pas' {fraDigitalizacion: TFrame},
  unDebug in '..\..\comunes\unDebug.pas' {frmDebug},
  unManBapro in 'unManBapro.pas' {frmManBapro},
  unFraUsuario in '..\..\comunes\frames\new\unFraUsuario.pas' {fraUsuarios: TFrame},
  unManEntidadGranOrganizador in 'unManEntidadGranOrganizador.pas' {frmManEntidadGranOrganizador},
  unFraEstablecimiento in '..\..\comunes\frames\new\unFraEstablecimiento.pas' {fraEstablecimiento: TFrame},
  unSiniestros in '..\..\Siniestros\unSiniestros.pas',
  unfraUsuarios in '..\..\comunes\frames\unfraUsuarios.pas' {fraUsuario: TFrame},
  unComunes in '..\..\..\comunes\unComunes.pas',
  unFormularioValidacionYRectificacionDatosEstablecimientos in '..\..\comunes\forms\unFormularioValidacionYRectificacionDatosEstablecimientos.pas' {frmFormularioValidacionYRectificacionDatosEstablecimientos},
  unRptFormularioValidacionYRectificacionDatosEstablecimientos in '..\..\comunes\reports\unRptFormularioValidacionYRectificacionDatosEstablecimientos.pas' {qrFormularioValidacionYRectificacionDatosEstablecimientos: TQuickRep},
  unRptCartaDocHeader in '..\..\comunes\reports\unRptCartaDocHeader.pas' {rptCartaDocHeader: TQuickRep},
  unManRetencionIngrBrutos in 'unManRetencionIngrBrutos.pas' {frmManRetencionIngrBrutos: TFSForm},
  OneSession in '..\..\..\comunes\OneSession.pas',
  unEspera in '..\..\comunes\forms\unEspera.pas' {frmEspera},
  unAnexoRes365 in '..\..\comunes\forms\unAnexoRes365.pas' {frmAnexoRes365},
  unRptAnexoRes365 in '..\..\comunes\reports\unRptAnexoRes365.pas' {qrAnexoRes365: TQuickRep},
  unConsFax in '..\..\Comunes\Forms\unConsFax.pas' {frmConsFax: TFSForm},
  unfraFFO_FAXFORMULARIO in '..\..\fax\faxclient_new\frames\unfraFFO_FAXFORMULARIO.pas' {fraFFO_FAXFORMULARIO: TFrame},
  unEstrategiaTIFF in '..\..\fax\faxclient_new\unEstrategiaTIFF.pas',
  unManRelacionEntVend in 'unManRelacionEntVend.pas' {frmManRelacionEntVend: TFSForm},
  unComisiones in 'unComisiones.pas',
  unManConceptos in 'unManConceptos.pas' {frmManConceptos: TFSForm},
  unManRelacionEntVendConcepto in 'unManRelacionEntVendConcepto.pas' {frmManRelacionEntVendConcepto: TFSForm},
  unCuentaCorriente in 'unCuentaCorriente.pas' {frmCuentaCorriente: TFSForm},
  unRptCuentaCorriente in 'unRptCuentaCorriente.pas' {qrCuentaCorriente: TQuickRep},
  unRptRetencionGanancias_IVA in 'unRptRetencionGanancias_IVA.pas' {qrRetencionGanancias_IVA: TQuickRep},
  unRptFacturasAprobadas in 'unRptFacturasAprobadas.pas' {frmRptFacturasAprobadas},
  unAdmInterfaces in '..\tesoreria\unAdmInterfaces.pas' {frmAdmInterfaces},
  unCustomPrincipal in '..\..\comunes\reposit\unCustomPrincipal.pas' {frmCustomPrincipal},
  unrptExcepcionesFNCLComisiones in '..\tesoreria\reports\unrptExcepcionesFNCLComisiones.pas' {rptExcepcionesFNCLComisiones: TQuickRep},
  unrptExcepcionesFNCLILTP in '..\tesoreria\reports\unrptExcepcionesFNCLILTP.pas' {rptExcepcionesFNCLILTP: TQuickRep},
  unVisorPDF in '..\..\comunes\forms\unVisorPDF.pas' {frmVisorPDF},
  unElementosEnviados in '..\..\comunes\forms\unElementosEnviados.pas' {frmElementosEnviados: TFSForm},
  unFaxEnviados in '..\..\comunes\forms\unFaxEnviados.pas' {frmFaxEnviados: TFSForm},
  unManCRR_RESPUESTA in '..\..\comunes\forms\unManCRR_RESPUESTA.pas' {frmManCRR_RESPUESTA: TFSForm},
  unManRDO_DOCUMENTO in '..\..\archivo_new\abm\unManRDO_DOCUMENTO.pas' {frmManRDO_DOCUMENTO: TFSForm},
  unFraTrabajadorSiniestro in '..\..\comunes\frames\new\unFraTrabajadorSiniestro.pas' {fraTrabajadorSiniestro: TFrame},
  unRptGestionDeReclamos in '..\..\comunes\reports\unRptGestionDeReclamos.pas' {frmRptGestionDeReclamos},
  unAgendaTelefonica in '..\..\comunes\forms\unAgendaTelefonica.pas' {frmAgendaTelefonica: TFSForm},
  unVentanillaElectronica in '..\..\comunes\forms\unVentanillaElectronica.pas' {frmVentanillaElectronica: TFSForm},
  unFraNavegadorWEB in '..\..\comunes\frames\new\unFraNavegadorWEB.pas' {fraNavegadorWEB: TFrame},
  unRptEstadisticasRGRL in '..\..\comunes\reports\unRptEstadisticasRGRL.pas' {qrEstadisticasRGRL: TQuickRep},
  unRptRGRL in '..\..\comunes\reports\unRptRGRL.pas' {qrRGRL: TQuickRep},
  unRGRL in '..\..\comunes\forms\unRGRL.pas' {frmRGRL},
  unGoogleMaps in '..\..\comunes\forms\unGoogleMaps.pas' {frmGoogleMaps},
  unFraDomicilioGIS in '..\..\comunes\frames\new\unFraDomicilioGIS.pas' {fraDomicilioGIS: TFrame},
  unManCGI_GIS in '..\..\comunes\forms\unManCGI_GIS.pas' {frmManCGI_GIS: TFSForm},
  unFraEmpresaAfi in '..\..\Comunes\FRAMES\NEW\unFraEmpresaAfi.pas' {fraEmpresaAfi: TFrame},
  unManCPG_PLAZOGUARDA in '..\..\comunes\forms\unManCPG_PLAZOGUARDA.pas' {frmManCPG_PLAZOGUARDA: TFSForm},
  unManCTA_TIPOACTIVOS in '..\..\comunes\forms\unManCTA_TIPOACTIVOS.pas' {frmManCTA_TIPOACTIVOS: TFSForm},
  unSeleccionMultiple in '..\..\comunes\forms\unSeleccionMultiple.pas' {frmSeleccionUsuarios: TFrame},
  unClasificacionActivos in '..\..\comunes\forms\unClasificacionActivos.pas' {frmClasificacionActivos: TFSForm},
  unfraCodigoDescripcionExt in '..\..\comunes\frames\unfraCodigoDescripcionExt.pas' {fraCodigoDescripcionExt: TFrame},
  unUtilsArchivo in '..\..\archivo_new\unUtilsArchivo.pas',
  unfraDelegacion in '..\..\comunes\frames\unfraDelegacion.pas' {fraDelegacion: TFrame},
  unLiquidacionesExigibles in 'unLiquidacionesExigibles.pas' {frmLiquidacionesExigibles: TFSForm},
  unLiquidacionesNoExigibles in 'unLiquidacionesNoExigibles.pas' {frmLiquidacionesNoExigibles: TFSForm},
  unContratoTrabajador in '..\unContratoTrabajador.pas' {frmContratoTrabajador},
  unFraActividad in '..\..\Comunes\FRAMES\unFraActividad.pas' {fraActividad: TFrame},
  unEstablecimientosTrabajador in '..\unEstablecimientosTrabajador.pas' {frmEstablecimientosTrabajador},
  unFraDomicilioEmpresa in '..\..\comunes\frames\new\unFraDomicilioEmpresa.pas' {fraDomicilioEmpresa: TFrame},
  unDlgBusSiniestro in '..\..\siniestros\unDlgBusSiniestro.pas' {frmDlgBusSiniestro: TFSForm},
  unImpresionEstadoDeCuenta in '..\..\cobranzas\unImpresionEstadoDeCuenta.pas' {frmImpresionEstadodeCuenta},
  unAfiliaciones in '..\unAfiliaciones.pas',
  unQrLibreDeuda in '..\..\cobranzas\reports\unQrLibreDeuda.pas' {qrLibreDeuda: TQuickRep},
  unQRCartaDocIntimacionNuevaGrilla in '..\..\cobranzas\reports\unQRCartaDocIntimacionNuevaGrilla.pas',
  unRptCartaDocumento in '..\..\Comunes\REPORTS\unRptCartaDocumento.pas' {rptCartaDocumento},
  unQRF801C in '..\..\cobranzas\reports\unQRF801C.pas' {QRF801C: TQuickRep},
  unQRF817 in '..\..\cobranzas\reports\unQRF817.pas' {QRF817: TQuickRep},
  unQRCartaDocIntimacion in '..\..\cobranzas\reports\unQRCartaDocIntimacion.pas',
  unRptCartaDocCompensacion in '..\..\cobranzas\compensacion\reports\unRptCartaDocCompensacion.pas',
  unQrEstadoCuentaDetalle in '..\..\cobranzas\reports\unQrEstadoCuentaDetalle.pas' {frmEstadoCuentaDetalle},
  unQrEstadoCuentaResumen in '..\..\cobranzas\reports\unQrEstadoCuentaResumen.pas' {frmEstadoCuentaResumen},
  unOpcionesDeImpresion in '..\..\cobranzas\unOpcionesDeImpresion.pas' {frmOpcionesDeImpresion},
  unConsultasAdicionales in '..\..\comunes\forms\unConsultasAdicionales.pas' {frmConsultasAdicionales},
  unEjecutivoCuenta in '..\..\comunes\forms\unEjecutivoCuenta.pas' {frmEjecutivoCuenta},
  unGestorCuenta in '..\..\comunes\forms\unGestorCuenta.pas' {frmGestorCuenta},
  unFrmDetalleArchivo in '..\..\archivo_new\unFrmDetalleArchivo.pas' {FrmDetalleArchivo},
  unFraFiltroArchivo in '..\..\archivo_new\frames\unFraFiltroArchivo.pas' {fraFiltroArchivo: TFrame},
  unfraArchJuicio in '..\..\archivo_new\frames\unfraArchJuicio.pas' {fraArchJuicio: TFrame},
  unfraProveedor in '..\..\comunes\frames\new\unfraProveedor.pas' {fraProveedor: TFrame},
  unConstantArchivo in '..\..\archivo_new\unConstantArchivo.pas',
  unFraDetalleArchivo in '..\..\archivo_new\frames\unFraDetalleArchivo.pas' {fraDetalleArchivo: TFrame},
  unCapturarCodigoBarras in '..\..\comunes\unCapturarCodigoBarras.pas' {frmCapturarCodigoBarras},
  unComunesArchivo in '..\..\archivo_new\unComunesArchivo.pas',
  unFrmCargaDocumentacion in '..\..\archivo_new\unFrmCargaDocumentacion.pas' {frmCargaDocumentacion},
  unImpoExpoWizard in '..\..\impoexpo\unImpoExpoWizard.pas' {frmImpoExpoWizard},
  unVisor in '..\..\comunes\forms\unVisor.pas' {frmVisor},
  unArchivoVisor in '..\..\comunes\unArchivoVisor.pas',
  unVisorExcel in '..\..\comunes\forms\unVisorExcel.pas' {frmVisorExcel},
  unDatosSiniestro in '..\..\comunes\forms\unDatosSiniestro.pas' {frmDatosSiniestro},
  unQrEtiquetasCarpetas in '..\..\archivo_new\unQrEtiquetasCarpetas.pas' {qrEtiquetasCarpetas: TQuickRep},
  unQrEtiquetasDocCarpetas in '..\..\archivo_new\unQrEtiquetasDocCarpetas.pas' {qrEtiquetasDocCarpetas: TQuickRep},
  unEstadoCuenta in '..\..\cobranzas\unEstadoCuenta.pas',
  unNovedades in '..\..\..\comunes\unNovedades.pas',
  unFraUsuarioConJerarquias in '..\..\comunes\frames\new\unFraUsuarioConJerarquias.pas' {fraUsuarioConJerarquias: TFrame},
  unFraUsuarioConSectorIntranet in '..\..\comunes\frames\new\unFraUsuarioConSectorIntranet.pas' {fraUsuarioConSectorIntranet: TFrame},
  unABMDelegacionTareas in '..\..\sic\unABMDelegacionTareas.pas' {frmABMDelegacionTareas},
  unSeleccionResponsableHYS in '..\..\hys\unSeleccionResponsableHYS.pas' {frmSeleccionResponsableHYS: TFSForm},
  unFraValidacionDatosEmpresa in '..\..\comunes\frames\new\unFraValidacionDatosEmpresa.pas' {fraValidacionDatosEmpresa: TFrame},
  unArbolSectores in '..\..\usuarios\unArbolSectores.pas' {frmArbolSectores},
  unFraTitulo in '..\..\comunes\frames\nuevos\unFraTitulo.pas' {fraTitulo: TFrame},
  unAyuda in '..\..\comunes\unAyuda.pas' {frmAyuda},
  unfraSectores in '..\..\comunes\frames\unfraSectores.pas' {fraSectores: TFrame},
  unRptPlantillaRGRL in '..\..\comunes\reports\unRptPlantillaRGRL.pas' {qrPlantillaRGRL: TQuickRep},
  unCargaDocumentosDigitaliz in '..\..\comunes\forms\unCargaDocumentosDigitaliz.pas' {frmCargaDocumentosDigitaliz},
  ProcFuncs in '..\..\..\comunes\ProcFuncs.pas',
  unArchivo in '..\..\archivo_new\unArchivo.pas',
  unFrmConsultaCarpetas in '..\..\archivo_new\unFrmConsultaCarpetas.pas' {FrmConsultaCarpetas: TFSForm},
  unFrmSolicitudCarpeta in '..\..\archivo_new\unFrmSolicitudCarpeta.pas' {FrmSolicitudCarpeta: TFSForm},
  unMovimientoCarpetas in '..\..\archivo_new\unMovimientoCarpetas.pas' {frmMovimientoCarpetas},
  unQrDetalleLoteEstudio in '..\..\archivo_new\unQrDetalleLoteEstudio.pas' {QrDetalleLoteEstudio},
  unReemplazoCarpetas in '..\..\archivo_new\unReemplazoCarpetas.pas' {frmReemplazoCarpetas},
  unfrmUbicacionActual in '..\..\archivo_new\unfrmUbicacionActual.pas' {FrmUbicacionActual},
  unTesoreria in '..\tesoreria\unTesoreria.pas',
  unListCuentaCorriente in 'unListCuentaCorriente.pas' {frmListCuentaCorriente: TFSForm},
  unRetencionesIIBB in 'unRetencionesIIBB.pas' {frmRetencionesIIBB: TFSForm},
  unLiquidacionesExigibles2 in 'unLiquidacionesExigibles2.pas' {frmLiquidacionesExigibles2: TFSForm},
  unfraSucursal in '..\..\Comunes\FRAMES\NEW\unfraSucursal.pas' {fraSucursal: TFrame},
  unInstitoriosSucursales in 'unInstitoriosSucursales.pas' {frmInstitoriosSucursales: TFSForm},
  unLiquidacionMantInstitorios in 'unLiquidacionMantInstitorios.pas' {frmLiquidacionMantInstitorios: TFSForm},
  unCustomSplash in '..\..\comunes\reposit\unCustomSplash.pas' {frmCustomSplash},
  unWelcomeSplash in '..\..\comunes\forms\unWelcomeSplash.pas' {frmWelcomeSplash},
  unRptAsignacionComision in 'unRptAsignacionComision.pas' {qrAsignacionComision: TQuickRep},
  unQRAnexoA in '..\reports\unQRAnexoA.pas' {QRAnexoA: TQuickRep},
  unQREndoso0 in '..\reports\unQREndoso0.pas',
  unQREndosoBase in '..\reports\unQREndosoBase.pas' {qrEndosoBase: TQuickRep},
  unQREndoso1 in '..\reports\unQREndoso1.pas' {qrEndoso1: TQuickRep},
  unQRContrato in '..\reports\unQRContrato.pas' {QRContrato: TQuickRep},
  unQRContrato2 in '..\reports\unQRContrato2.pas' {QRContrato2: TQuickRep},
  unQRContrato3 in '..\reports\unQRContrato3.pas' {QRContrato3: TQuickRep},
  unQRContratoNomina in '..\reports\unQRContratoNomina.pas' {qrContratoNomina: TQuickRep},
  unImprimeContrato in '..\unImprimeContrato.pas' {frmImprimeContrato},
  unQrDetalleRemitoDevolucion in '..\..\archivo_new\unQrDetalleRemitoDevolucion.pas' {QrDetalleRemitoDevolucion},
  unConceptosExenciones in 'unConceptosExenciones.pas' {frmConceptosExenciones: TFSForm},
  unFrmArmadoLote in '..\..\archivo_new\unFrmArmadoLote.pas' {FrmArmadoLote: TFSForm},
  unQrDetalleLote in '..\..\archivo_new\unQrDetalleLote.pas' {QrDetalleLote},
  unRptResumenLotes in '..\..\archivo_new\unRptResumenLotes.pas' {qrResumenLotes: TQuickRep},
  unVerImagenes in '..\..\archivo_new\unVerImagenes.pas' {frmVerImagenes},
  unMensajeAlerta in '..\..\..\comunes\unMensajeAlerta.pas',
  unMensajeAlertaAGA in '..\..\archivo_new\unMensajeAlertaAGA.pas',
  unAlarmas in '..\..\..\comunes\unAlarmas.pas',
  unManCVS_VENTANILLA_SUBTEMAS in '..\..\comunes\forms\unManCVS_VENTANILLA_SUBTEMAS.pas' {frmManCVS_VENTANILLA_SUBTEMAS: TFSForm},
  unEsperaSimple in '..\..\comunes\forms\unEsperaSimple.pas' {frmEsperaSimple},
  unFraWebBrowser in '..\..\comunes\frames\new\unFraWebBrowser.pas' {fraWebBrowser: TFrame},
  unFraGIS_APIv3 in '..\..\comunes\frames\new\unFraGIS_APIv3.pas' {fraGIS_APIv3: TFrame};

{$R *.RES}
{$R *.dres}

begin
  OnlyOneInstance ;
  Application.Initialize;
  Application.Title := 'Modulo de Comisiones';

  with TfrmWelcomeSplash.Create(Application) do
  try
    ShowOnTop;
    Application.CreateForm(TdmPrincipal, dmPrincipal);
    Application.CreateForm(TdmFinancials, dmFinancials);
    if dmPrincipal.sdbPrincipal.Connected then
      Application.CreateForm(TfrmPrincipal, frmPrincipal);

    OnlyOneSession;
  finally
    Free;
  end;

  MostrarNovedades;
  Application.Run;
end.