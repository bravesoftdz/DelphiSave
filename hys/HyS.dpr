program HyS;

{********************************************************}
{                                                        }
{    M�dulo de Higiene y Seguridad                       }
{    Autor: Federico Firenze                             }
{                                                        }
{    Utiliza ArtUtils.dpk                                }
{                                                        }
{********************************************************}

{$IFNDEF VER150}
  {$R *.dres}
{$ENDIF}

uses
  OneInstance,
  Forms,
  Controls,
  Windows,
  unCustomDataModule in '..\Comunes\unCustomDataModule.pas' {dmCustomDataModule: TDataModule},
  unDmPrincipal in '..\Comunes\ORACLE\unDmPrincipal.pas' {dmPrincipal: TDataModule},
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unArtFrame in '..\Comunes\REPOSIT\unArtFrame.pas' {ArtFrame: TFrame},
  unArtDBAwareFrame in '..\Comunes\REPOSIT\unArtDBAwareFrame.pas' {ArtDBAwareFrame: TFrame},
  unArtDbFrame in '..\Comunes\REPOSIT\unArtDbFrame.pas' {ArtDbFrame: TFrame},
  unFraCodigoDescripcion in '..\Comunes\FRAMES\unFraCodigoDescripcion.pas' {fraCodigoDescripcion: TFrame},
  unFraStaticCodigoDescripcion in '..\Comunes\FRAMES\unFraStaticCodigoDescripcion.pas' {fraStaticCodigoDescripcion: TFrame},
  unCustomPanelABM in '..\Comunes\REPOSIT\unCustomPanelABM.pas' {frmCustomPanelABM},
  unCustomConsulta in '..\Comunes\REPOSIT\unCustomConsulta.pas' {frmCustomConsulta},
  unCustomGridABM in '..\Comunes\REPOSIT\unCustomGridABM.pas' {frmCustomGridABM},
  unFraEmpresa in '..\Comunes\FRAMES\NEW\unFraEmpresa.pas' {fraEmpresa: TFrame},
  unFraTrabajador in '..\comunes\frames\new\unFraTrabajador.pas' {fraTrabajador: TFrame},
  unFraTrabajadorAMP in '..\comunes\frames\new\unFraTrabajadorAMP.pas' {fraTrabajadorAMP: TFrame},
  unFraStaticCTB_TABLAS in '..\Comunes\FRAMES\unFraStaticCTB_TABLAS.pas' {fraStaticCTB_TABLAS: TFrame},
  unFraCAV_ACTIVIDAD in '..\Comunes\FRAMES\unFraCAV_ACTIVIDAD.pas' {fraCAV_ACTIVIDAD: TFrame},
  unManPRG_RIESGOS in 'ABM\unManPRG_RIESGOS.pas' {frmManPRG_RIESGOS},
  unDlgBusInforme in 'unDlgBusInforme.pas' {frmDlgBusInforme},
  unConsExpuestos in 'unConsExpuestos.pas' {frmConsExpuestos},
  unInfInvestigacionAccidentes in 'unInfInvestigacionAccidentes.pas' {frmInfInvestigacionAccidentes},
  unFraTrabajadorSiniestro_D5 in '..\Comunes\FRAMES\NEW\unFraTrabajadorSiniestro_D5.pas' {fraTrabajadorSiniestro_D5: TFrame},
  unFraTrabajadorSinGrave in '..\Comunes\FRAMES\NEW\unFraTrabajadorSinGrave.pas' {fraTrabajadorSinGrave: TFrame},
  unContratoTrabajador in '..\Afiliaciones\unContratoTrabajador.pas' {frmContratoTrabajador},
  unFraDomicilioTrab in '..\Comunes\FRAMES\NEW\unFraDomicilioTrab.pas' {fraDomicilioTrab: TFrame},
  unCompatibilidad in '..\Afiliaciones\unCompatibilidad.pas',
  unAfiliaciones in '..\Afiliaciones\unAfiliaciones.pas',
  unEstablecimientosTrabajador in '..\Afiliaciones\unEstablecimientosTrabajador.pas' {frmEstablecimientosTrabajador},
  unManPIT_FIRMANTES in 'ABM\unManPIT_FIRMANTES.pas' {frmManPIT_FIRMANTES},
  unFraPAE_ACCIDENTEESTABLECIMIENTO in 'FRAMES\unFraPAE_ACCIDENTEESTABLECIMIENTO.pas' {fraPAE_ACCIDENTEESTABLECIMIENTO: TFrame},
  CustomDlgs in '..\..\Comunes\CustomDlgs.pas',
  unComunes in '..\..\Comunes\unComunes.pas',
  unManCCP_CUENTAPAGO in '..\Comunes\Forms\unManCCP_CUENTAPAGO.pas' {frmManCCP_CUENTAPAGO},
  unAltaModifCCP_CUENTAPAGO in '..\Comunes\Forms\unAltaModifCCP_CUENTAPAGO.pas',
  unfraVendedoresCUIT in '..\comunes\frames\new\unfraVendedoresCUIT.pas' {fraVendedoresCUIT: TFrame},
  unfraVendedores in '..\Comunes\FRAMES\unfraVendedores.pas' {fraVendedores: TFrame},
  unfraCPR_PRESTADOR in '..\Comunes\FRAMES\NEW\unfraCPR_PRESTADOR.pas' {fraCPR_PRESTADOR: TFrame},
  unqrInvestigacionAccidente in 'unqrInvestigacionAccidente.pas' {frmqrInvestigacionAccidente},
  unFraActividad in '..\Comunes\FRAMES\unFraActividad.pas' {fraActividad: TFrame},
  unBusquedaDomicilio in '..\comunes\forms\unBusquedaDomicilio.pas' {frmBusquedaDomicilio},
  unFraDomicilio in '..\comunes\frames\new\unFraDomicilio.pas' {fraDomicilio: TFrame},
  General in '..\..\comunes\General.pas',
  unFraRTD_TIPODOCUMENTO in '..\comunes\frames\new\unFraRTD_TIPODOCUMENTO.pas' {fraRTD_TIPODOCUMENTO: TFrame},
  libgfl in '..\..\Comunes\libgfl.pas',
  unFraVistaTIFF in '..\comunes\frames\new\unFraVistaTIFF.pas' {fraVistaTIFF: TFrame},
  ungrids in '..\..\Comunes\ungrids.pas',
  VCLExtra in '..\..\Comunes\VCLExtra.pas',
  unFraCodDesc in '..\comunes\frames\nuevos\unFraCodDesc.pas' {fraCodDesc: TFrame},
  unFraCtbTablas in '..\comunes\frames\unFraCtbTablas.pas' {fraCtbTablas: TFrame},
  unABMPRAM in 'unABMPRAM.pas' {frmABMPRAM},
  unfraEstablecimientoDomic in '..\comunes\frames\unfraEstablecimientoDomic.pas' {fraEstablecimientoDomic: TFrame},
  unConsVisitasRealizadas in '..\hys_anexo1\unConsVisitasRealizadas.pas' {frmConsVisitasRealizadas},
  unFraEstablecimiento in '..\comunes\frames\new\unFraEstablecimiento.pas' {fraEstablecimiento: TFrame},
  unFraEmpresaAfi in '..\comunes\frames\new\unFraEmpresaAfi.pas' {fraEmpresaAfi: TFrame},
  unInfCancerigenos in 'unInfCancerigenos.pas' {frmInfCancerigenos},
  unManSectores in 'unManSectores.pas' {frmManSectores},
  unManUsosProductos in 'unManUsosProductos.pas' {frmManUsosProductos},
  unManIncumplimientos in 'unManIncumplimientos.pas' {frmManIncumplimientos},
  unCustomForm in '..\comunes\unCustomForm.pas' {frmCustomForm},
  unFraToolbarRTF in '..\comunes\frames\unFraToolbarRTF.pas' {fraToolbarRTF: TFrame},
  unMoldeEnvioMail in '..\comunes\envio de mails\unMoldeEnvioMail.pas' {frmMoldeEnvioMail},
  unSeleccionDestinatarios in '..\comunes\unSeleccionDestinatarios.pas' {frmSeleccionDestinatarios},
  unContratoContacto in '..\comunes\forms\unContratoContacto.pas' {frmContratoContacto},
  unfraContacto in '..\comunes\frames\unfraContacto.pas' {fraContacto: TFrame},
  unFraTelefono in '..\comunes\frames\new\unFraTelefono.pas' {fraTelefono: TFrame},
  unABMTelefonos in '..\comunes\forms\unABMTelefonos.pas' {frmTelefonos},
  unDebug in '..\comunes\unDebug.pas' {frmDebug},
  unLibretaDeDirecciones in '..\comunes\forms\unLibretaDeDirecciones.pas' {frmLibretaDeDirecciones},
  unFraUsuario in '..\comunes\frames\new\unFraUsuario.pas' {fraUsuarios: TFrame},
  unfraUsuarios in '..\comunes\frames\unfraUsuarios.pas' {fraUsuario: TFrame},
  unTelefonosCargaRapida in '..\comunes\forms\unTelefonosCargaRapida.pas' {frmTelefonosCargaRapida},
  unfraEntidadCUIT in '..\comunes\frames\new\unfraEntidadCUIT.pas' {fraEntidadCUIT: TFrame},
  unCustomPrincipal in '..\comunes\reposit\unCustomPrincipal.pas' {frmCustomPrincipal},
  unConsFax in '..\comunes\forms\unConsFax.pas' {frmConsFax: TFSForm},
  unfraFFO_FAXFORMULARIO in '..\comunes\frames\unfraFFO_FAXFORMULARIO.pas' {fraFFO_FAXFORMULARIO: TFrame},
  unElementosEnviados in '..\comunes\forms\unElementosEnviados.pas' {frmElementosEnviados: TFSForm},
  unEspera in '..\comunes\forms\unEspera.pas' {frmEspera},
  unManRDO_DOCUMENTO in '..\archivo_new\abm\unManRDO_DOCUMENTO.pas' {frmManRDO_DOCUMENTO: TFSForm},
  unFaxEnviados in '..\comunes\forms\unFaxEnviados.pas' {frmFaxEnviados: TFSForm},
  unNovedades in '..\..\Comunes\unNovedades.pas',
  unEstrategiaTIFF in '..\fax\faxclient_new\unEstrategiaTIFF.pas',
  unFet in '..\hys_anexo1\unFet.pas' {frmFet},
  unFraPRS in '..\hys_anexo1\unFraPRS.pas' {frmPRS},
  unFrmObras in '..\hys_anexo1\unFrmObras.pas' {frmObras},
  unDenIncumplimiento in '..\hys_anexo1\unDenIncumplimiento.pas' {frmDenIncumplimiento},
  unConstFet in '..\hys_anexo1\unConstFet.pas',
  unCustomSplash in '..\Comunes\REPOSIT\unCustomSplash.pas' {frmCustomSplash},
  unManPreventores in '..\hys_anexo1\unManPreventores.pas' {frmAbmPreventores},
  Cuit in '..\..\Comunes\Cuit.pas',
  unfraLocalidad in '..\Comunes\FRAMES\unfraLocalidad.pas' {fraLocalidad: TFrame},
  unfraLocalidadEx in '..\Comunes\FRAMES\unfraLocalidadEx.pas' {fraLocalidadEx: TFrame},
  unfraCIIU in '..\Comunes\FRAMES\unfraCIIU.pas' {fraCIIU: TFrame},
  UnHistoricoTipoEstabPreventor in '..\hys_anexo1\UnHistoricoTipoEstabPreventor.pas' {frmHistoricoAsignaciones},
  unSolicitudConsultas in '..\hys_anexo1\unSolicitudConsultas.pas' {frmSolicitudConsultas},
  unManMotivosMovEAS in '..\hys_anexo1\unManMotivosMovEAS.pas' {frmManMotivosMovEAS},
  unDefinicionRanking in '..\hys_anexo1\unDefinicionRanking.pas' {frmDefRanking},
  unAutorizacionesEAS in '..\hys_anexo1\unAutorizacionesEAS.pas' {frmAutorizacionesEAS},
  unSeguimientoPQ in '..\hys_anexo1\unSeguimientoPQ.pas' {frmSeguimientoPQ},
  unAnalisisMotivos in '..\hys_anexo1\unAnalisisMotivos.pas' {frmAnalisisMotivos},
  unPlanMejoras in '..\hys_anexo1\unPlanMejoras.pas' {frmPlanMejoras},
  unConfidencial in '..\..\Comunes\unConfidencial.pas',
  unReasignacionCP in '..\hys_anexo1\unReasignacionCP.pas' {frmReasignacionCP},
  unContratoEstablecimiento in '..\afiliaciones\unContratoEstablecimiento.pas' {frmContratoEstablecimiento},
  unHistoricoEstablecimiento in '..\afiliaciones\unHistoricoEstablecimiento.pas' {frmHistoricoEstablecimiento},
  unTipoEstablecimientoPreventor in '..\hys_anexo1\unTipoEstablecimientoPreventor.pas' {frmAbmTipoEstablecimientoPreventor},
  unEstabSinAsignar in '..\hys_anexo1\unEstabSinAsignar.pas' {frmEstabSinAsignar},
  unSesion in '..\..\Comunes\unSesion.pas',
  unfraCodigoDescripcionExt in '..\comunes\frames\unfraCodigoDescripcionExt.pas' {fraCodigoDescripcionExt: TFrame},
  strfuncs in '..\..\Comunes\strfuncs.pas',
  unAbmPerfiles in '..\hys_anexo1\unAbmPerfiles.pas' {frmPerfiles},
  unfraPerfilPreventor in '..\hys_anexo1\unfraPerfilPreventor.pas' {fraPerfilPreventor: TFrame},
  unGestionEmpresasPreventor in '..\hys_anexo1\unGestionEmpresasPreventor.pas' {frmGestionEmpresasPreventor},
  unManRanking in '..\hys_anexo1\unManRanking.pas' {frmManRanking: TFSForm},
  unCapacitacion in '..\hys_anexo1\unCapacitacion.pas' {frmCapacitacion: TFSForm},
  unRiesgos in '..\hys_anexo1\unRiesgos.pas' {frmRiesgos: TFSForm},
  unSiniestros in '..\siniestros\unSiniestros.pas',
  unManActividades in '..\hys_anexo1\unManActividades.pas' {frmManActividades: TFSForm},
  unImportacionNominas in '..\hys_anexo1\unImportacionNominas.pas' {frmImportacionNominas},
  unManMotivoAsignacionPreventor in '..\hys_anexo1\unManMotivoAsignacionPreventor.pas' {frmMotivoAsignacionPreventor: TFSForm},
  unEventos in '..\hys_anexo1\unEventos.pas' {frmEventos: TFSForm},
  unManEventos in '..\hys_anexo1\unManEventos.pas' {frmManEventos: TFSForm},
  unfraAbogadosLegales in '..\comunes\frames\unfraAbogadosLegales.pas' {fraAbogadosLegales: TFrame},
  unFraNormaLegal in '..\comunes\frames\unFraNormaLegal.pas' {fraNormaLegal: TFrame},
  unfraJuzgados in '..\comunes\frames\unfraJuzgados.pas' {fraJuzgados: TFrame},
  unDmLegales in '..\legales\unDmLegales.pas' {dmLegales: TDataModule},
  unFrmSeguimientoDictamenesAcusatorios in '..\legales\unFrmSeguimientoDictamenesAcusatorios.pas' {frmSeguimientoDictamenesAcusatorios},
  UnFrmHistoricoReservasSumarios in '..\legales\UnFrmHistoricoReservasSumarios.pas' {frmHistoricoReservasSumarios},
  UnReasignacionAbogado in '..\legales\UnReasignacionAbogado.pas' {frmReasignacionAbogado},
  unBusqSini in '..\legales\unBusqSini.pas' {dlgBusqSini},
  unDmFinancials in '..\comunes\oracle\unDmFinancials.pas' {dmFinancials: TDataModule},
  unVerAntecedentes in '..\legales\unVerAntecedentes.pas' {frmVerAntecedente},
  unArchivosAsociados in '..\legales\unArchivosAsociados.pas' {frmArchivosAsociados},
  unABMPatronesBusqueda in '..\legales\unABMPatronesBusqueda.pas' {frmAbmPatronesBusqueda: TFSForm},
  UnRptLiquidacion in '..\legales\reportes\UnRptLiquidacion.pas' {RptLiquidacion: TQuickRep},
  unPagoSumarios in '..\legales\unPagoSumarios.pas' {frmPagoSumarios},
  unFijarImportesSentSumario in '..\legales\unFijarImportesSentSumario.pas' {frmFijarImportesSentSumario},
  UnRptLiquidacionSumario in '..\legales\reportes\UnRptLiquidacionSumario.pas' {RptLiquidacionSumario: TQuickRep},
  unLiquidacionPagoSumarios in '..\legales\unLiquidacionPagoSumarios.pas' {frmLiquidacionPagoSumarios},
  unConsultaDictamenesAcusatorios in '..\legales\unConsultaDictamenesAcusatorios.pas' {frmConsultaDictamenesAcustorios: TFSForm},
  unFrmMuestraError in '..\hys_anexo1\unFrmMuestraError.pas' {frmMuestraError},
  unConstLegales in '..\legales\unConstLegales.pas',
  unManMotivosVisitas in '..\hys_anexo1\unManMotivosVisitas.pas' {frmManMotivosVisitas: TFSForm},
  unHistoricoPlanMejoras in '..\hys_anexo1\unHistoricoPlanMejoras.pas' {frmHistoricoPlanMejoras: TFSForm},
  unRptConstanciaVisitas in '..\hys_anexo1\unRptConstanciaVisitas.pas' {rptConstanciaVisitas: TQuickRep},
  unVisualizador in '..\comunes\unVisualizador.pas' {frmVisualizador},
  unComunesFet in '..\hys_anexo1\unComunesFet.pas',
  unPreventorAprobo in '..\hys_anexo1\unPreventorAprobo.pas' {frmPreventorAprobo: TFSForm},
  unrptResolucionsrt in '..\hys_anexo1\unrptResolucionsrt.pas' {rptResolucionSRT},
  unRptResolucionSRT51 in '..\hys_anexo1\unRptResolucionSRT51.pas' {rptResolucionSRT51},
  unSeleccionPreventor in '..\hys_anexo1\unSeleccionPreventor.pas' {frmSeleccionPreventor: TFSForm},
  unGestionConstruccion in '..\hys_anexo1\unGestionConstruccion.pas' {frmGestionConstruccion: TFSForm},
  unRptNotificacion in '..\hys_anexo1\unRptNotificacion.pas' {rptNotificacion},
  unManObservaciones in '..\hys_anexo1\unManObservaciones.pas' {frmManObservaciones: TFSForm},
  unRptResolucionSRT51SinVisita in '..\hys_anexo1\unRptResolucionSRT51SinVisita.pas' {rptResolucionSRT51SinVisita},
  unfraCuentaBancaria in '..\comunes\frames\new\unfraCuentaBancaria.pas' {fraCuentaBancaria: TFrame},
  unAlarmas in '..\..\Comunes\unAlarmas.pas',
  unrptImportacionNominas in 'unrptImportacionNominas.pas' {rptImportacionNominas},
  unProgramasdeSeguridad in 'unProgramasdeSeguridad.pas' {frmProgramasDeSeguridad: TFSForm},
  unRptFormularioValidacionYRectificacionDatosEstablecimientos in '..\comunes\reports\unRptFormularioValidacionYRectificacionDatosEstablecimientos.pas' {qrFormularioValidacionYRectificacionDatosEstablecimientos: TQuickRep},
  unFormularioValidacionYRectificacionDatosEstablecimientos in '..\comunes\forms\unFormularioValidacionYRectificacionDatosEstablecimientos.pas' {frmFormularioValidacionYRectificacionDatosEstablecimientos},
  unSeguimientoAccidente in 'unSeguimientoAccidente.pas' {frmSeguimientoAccidente: TFSForm},
  unSeguimientoInvestigacion in 'unSeguimientoInvestigacion.pas' {frmSeguimientoInvestigacion: TFSForm},
  ArchFuncs in '..\..\comunes\ArchFuncs.pas',
  unRptCartaDocHeader in '..\comunes\reports\unRptCartaDocHeader.pas' {rptCartaDocHeader: TQuickRep},
  unHistoricoPrevAccidente in 'unHistoricoPrevAccidente.pas' {frmHistoricoPrevAccidente: TFSForm},
  unHistoricoEstado in 'unHistoricoEstado.pas' {frmHistoricoEstado: TFSForm},
  unManAbogados in '..\legales\unManAbogados.pas' {frmManAbogados: TFSForm},
  unEventosAccidentes in 'unEventosAccidentes.pas' {frmEventosAccidentes: TFSForm},
  unManEventosAccidente in 'unManEventosAccidente.pas' {frmManEventosAccidente: TFSForm},
  unRptInformeProgSeg in 'unRptInformeProgSeg.pas' {rptInformeProgSeg},
  unManVigenciaOperativo in 'unManVigenciaOperativo.pas' {frmManVigenciaOperativo: TFSForm},
  unrptAnexo2 in 'unrptAnexo2.pas' {rptAnexo2},
  unRptActividades in 'unRptActividades.pas' {rptActividades},
  unRptActividades51 in 'unRptActividades51.pas' {rptActividades51},
  unSeleccionResponsableHYS in 'unSeleccionResponsableHYS.pas' {frmSeleccionResponsableHYS: TFSForm},
  unfraArchJuicio in '..\archivo_new\frames\unfraArchJuicio.pas' {fraArchJuicio: TFrame},
  unFrmCargaDocumentacion in '..\archivo_new\unFrmCargaDocumentacion.pas' {frmCargaDocumentacion},
  unCapturarCodigoBarras in '..\comunes\unCapturarCodigoBarras.pas' {frmCapturarCodigoBarras},
  unUtilsArchivo in '..\archivo_new\unUtilsArchivo.pas',
  unFraTrabajadorSiniestro in '..\comunes\frames\new\unFraTrabajadorSiniestro.pas' {fraTrabajadorSiniestro: TFrame},
  unVentanillaElectronica in '..\comunes\forms\unVentanillaElectronica.pas' {frmVentanillaElectronica: TFSForm},
  unRptGestionDeReclamos in '..\comunes\reports\unRptGestionDeReclamos.pas' {frmRptGestionDeReclamos},
  ABMDialog in '..\..\paquetes\abmdialog\ABMDialog.pas',
  unABMForm in '..\..\paquetes\abmdialog\unABMForm.pas' {ABMForm},
  unComunesArchivo in '..\archivo_new\unComunesArchivo.pas',
  EditDialog in '..\..\paquetes\abmdialog\EditDialog.pas',
  unAgendaTelefonica in '..\comunes\forms\unAgendaTelefonica.pas' {frmAgendaTelefonica: TFSForm},
  unTableroControl in 'unTableroControl.pas' {frmTableroControl: TFSForm},
  unControlAccidente in 'unControlAccidente.pas' {frmControlAccidente: TFSForm},
  unControlEnfermedades in 'unControlEnfermedades.pas' {frmControlEnfermedades: TFSForm},
  unRptPersonalExtra in '..\adminanalisis\reports\unRptPersonalExtra.pas' {rptPersonalExtra},
  unRptTrabajadoresEnOtroEstab in 'unRptTrabajadoresEnOtroEstab.pas' {rptTrabajadoresEnOtroEstab},
  unRptNuevosTrabNominaActiva in 'unRptNuevosTrabNominaActiva.pas' {rptNuevosTrabNominaActiva},
  unfraContactoAgenda in '..\comunes\frames\unfraContactoAgenda.pas' {fraContactoAgenda: TFrame},
  unfraVendedorAGENDA in '..\comunes\frames\modulosAgenda\unfraVendedorAGENDA.pas' {fraVendedorAGENDA: TFrame},
  unfraEntidadVendedorAGENDA in '..\comunes\frames\modulosAgenda\unfraEntidadVendedorAGENDA.pas' {fraEntidadVendedorAGENDA: TFrame},
  unABMAgendaBase in '..\comunes\forms\unABMAgendaBase.pas' {frmABMAgendaBase},
  unABMAgendaBaseEvento in '..\comunes\forms\unABMAgendaBaseEvento.pas' {frmABMAgendaBaseEvento},
  unABMAgendaBaseTarea in '..\comunes\forms\unABMAgendaBaseTarea.pas' {frmABMAgendaBaseTarea},
  unSeleccionMultiple in '..\comunes\forms\unSeleccionMultiple.pas' {frmSeleccionUsuarios: TFrame},
  unTablaPeriodica in 'unTablaPeriodica.pas' {frmTablaPeriodica},
  unManEstudioJuridicos in '..\legales\unManEstudioJuridicos.pas' {frmManEstudioJuridico: TFSForm},
  unAutorizacionAgenda in '..\comunes\forms\unAutorizacionAgenda.pas' {frmAutorizacionAgenda},
  unReportesAgenda in '..\..\comunes\interfaces\unReportesAgenda.pas',
  unCargaDeViaticos in 'unCargaDeViaticos.pas' {frmCargaDeViaticos: TFSForm},
  unFraNavegadorWEB in '..\comunes\frames\new\unFraNavegadorWEB.pas' {fraNavegadorWEB: TFrame},
  unFraDomicilioGIS in '..\comunes\frames\new\unFraDomicilioGIS.pas' {fraDomicilioGIS: TFrame},
  unGoogleMaps in '..\comunes\forms\unGoogleMaps.pas' {frmGoogleMaps},
  unManCGI_GIS in '..\comunes\forms\unManCGI_GIS.pas' {frmManCGI_GIS: TFSForm},
  unDomicilioMiRegistro in 'unDomicilioMiRegistro.pas' {frmDomicilioMiRegistro: TFSForm},
  unVisorPDF in '..\comunes\forms\unVisorPDF.pas' {frmVisorPDF},
  unSeleccionTareas in '..\comunes\forms\unSeleccionTareas.pas' {frmSeleccionTareas},
  unFraPrestadorExtendido in '..\comunes\frames\new\unFraPrestadorExtendido.pas' {fraPrestadorExtendido: TFrame},
  unDlgBusSiniestro in '..\siniestros\unDlgBusSiniestro.pas' {frmDlgBusSiniestro: TFSForm},
  unAgenda in '..\..\comunes\interfaces\unAgenda.pas',
  unfraEmpresaAGENDA in '..\comunes\frames\modulosAgenda\unfraEmpresaAGENDA.pas' {fraEmpresaAGENDA: TFrame},
  unfraTrabajadorAGENDA in '..\comunes\frames\modulosAgenda\unfraTrabajadorAGENDA.pas' {fraTrabajadorAGENDA: TFrame},
  unfraEntidadAGENDA in '..\comunes\frames\modulosAgenda\unfraEntidadAGENDA.pas' {fraEntidadAGENDA: TFrame},
  unfraTrabajadorSiniestroAGENDA in '..\comunes\frames\modulosAgenda\unfraTrabajadorSiniestroAGENDA.pas' {fraTrabajadorSiniestroAGENDA: TFrame},
  unfraPrestadorAGENDA in '..\comunes\frames\modulosAgenda\unfraPrestadorAGENDA.pas' {fraPrestadorAGENDA: TFrame},
  unArchivo in '..\archivo_new\unArchivo.pas',
  unfraDomicilioEstablecimientoAGENDA in '..\comunes\frames\modulosagenda\unfraDomicilioEstablecimientoAGENDA.pas' {fraDomicilioEstablecimientoAGENDA: TFrame},
  unfraEstablecimientoAGENDA in '..\comunes\frames\modulosagenda\unfraEstablecimientoAGENDA.pas' {fraEstablecimientoAGENDA: TFrame},
  unfraDomicilioEmpresaAGENDA in '..\comunes\frames\modulosagenda\unfraDomicilioEmpresaAGENDA.pas' {fraDomicilioEmpresaAGENDA: TFrame},
  unAyuda in '..\comunes\unAyuda.pas' {frmAyuda},
  unfraNumAutoAGENDA in '..\comunes\frames\modulosagenda\unfraNumAutoAGENDA.pas' {fraNumAutoAGENDA: TFrame},
  unExcluirCancerigenos in 'unExcluirCancerigenos.pas' {frmExcluirCancerigenos: TFSForm},
  unAnexoRes365 in '..\comunes\forms\unAnexoRes365.pas' {frmAnexoRes365},
  OneSession in '..\..\comunes\OneSession.pas',
  unRptAnexoRes365 in '..\comunes\reports\unRptAnexoRes365.pas' {qrAnexoRes365: TQuickRep},
  unRptCartaDocumento in '..\comunes\reports\unRptCartaDocumento.pas' {rptCartaDocumento: TQuickRep},
  unRelevamientoRiesgosLaborales in 'unRelevamientoRiesgosLaborales.pas' {frmRelevamientosRiesgosLaborales},
  unRelevamientoCargaRapida in 'unRelevamientoCargaRapida.pas' {frmRelevamientoCargaRapida},
  unRelevGremialista in 'unRelevGremialista.pas' {frmRelevGremialista: TFSForm},
  unRelevTiposAnexos in 'unRelevTiposAnexos.pas' {frmRelevTiposAnexos},
  unRelevContratistas in 'unRelevContratistas.pas' {frmRelevContratista: TFSForm},
  unRelevResponsable in 'unRelevResponsable.pas' {frmRelevResponsable: TFSForm},
  unRptEstadisticasRGRL in '..\comunes\reports\unRptEstadisticasRGRL.pas' {qrEstadisticasRGRL: TQuickRep},
  unRptRGRL in '..\comunes\reports\unRptRGRL.pas' {qrRGRL: TQuickRep},
  unRGRL in '..\comunes\forms\unRGRL.pas' {frmRGRL},
  unRelevAnalisisCarga in 'unRelevAnalisisCarga.pas' {frmRelevAnalisiCarga: TFSForm},
  unManRelevObservacion in 'unManRelevObservacion.pas' {frmManRelevObservaciones: TFSForm},
  unPAL in 'unPAL.pas' {frmPAL},
  unRptResolucion463 in 'unRptResolucion463.pas' {rptResolucion463},
  unRptPal in 'unRptPal.pas' {rptPal},
  unRTTI in '..\..\comunes\unRTTI.pas',
  unRelevGestion463 in 'unRelevGestion463.pas',
  unfraContactoLibreAGENDA in '..\comunes\frames\modulosagenda\unfraContactoLibreAGENDA.pas' {fraContactoLibreAGENDA: TFrame},
  unfraDomicilioAGENDA in '..\comunes\frames\modulosagenda\unfraDomicilioAGENDA.pas' {fraDomicilioGISAGENDA: TFrame},
  unManCPG_PLAZOGUARDA in '..\comunes\forms\unManCPG_PLAZOGUARDA.pas' {frmManCPG_PLAZOGUARDA: TFSForm},
  unManCTA_TIPOACTIVOS in '..\comunes\forms\unManCTA_TIPOACTIVOS.pas' {frmManCTA_TIPOACTIVOS: TFSForm},
  unClasificacionActivos in '..\comunes\forms\unClasificacionActivos.pas' {frmClasificacionActivos: TFSForm},
  unConstantArchivo in '..\archivo_new\unConstantArchivo.pas',
  unInterfaces in '..\..\comunes\interfaces\unInterfaces.pas',
  unFraUsuarioConJerarquias in '..\comunes\frames\new\unFraUsuarioConJerarquias.pas' {fraUsuarioConJerarquias: TFrame},
  unRptVisitasNo in 'unRptVisitasNo.pas' {rptVisitasNo},
  unSolicitudExclusionEmpresa in 'unSolicitudExclusionEmpresa.pas' {frmSolicitudExclusionEmpresa: TFSForm},
  unDomicilio319 in 'unDomicilio319.pas' {frmDomicilio319: TFSForm},
  unRptRes463Preventor in 'unRptRes463Preventor.pas' {rptRes463Preventor},
  unfraProveedor in '..\comunes\frames\new\unfraProveedor.pas' {fraProveedor: TFrame},
  unFraUsuarioConSectorIntranet in '..\comunes\frames\new\unFraUsuarioConSectorIntranet.pas' {fraUsuarioConSectorIntranet: TFrame},
  unArbolSectores in '..\usuarios\unArbolSectores.pas' {frmArbolSectores},
  unUltimoRegistroDom in 'unUltimoRegistroDom.pas' {frmUltimoRegistroDom: TFSForm},
  unImpresionEstadoDeCuenta in '..\cobranzas\unImpresionEstadoDeCuenta.pas' {frmImpresionEstadodeCuenta},
  unfraInfoEmpresaExt in '..\comunes\frames\new\unfraInfoEmpresaExt.pas' {fraInfoEmpresaExt: TFrame},
  unFraValidacionDatosEmpresa in '..\comunes\frames\new\unFraValidacionDatosEmpresa.pas' {fraValidacionDatosEmpresa: TFrame},
  unFraDomicilioEmpresa in '..\comunes\frames\new\unFraDomicilioEmpresa.pas' {fraDomicilioEmpresa: TFrame},
  unEjecutivoCuenta in '..\comunes\forms\unEjecutivoCuenta.pas' {frmEjecutivoCuenta},
  unfraInfoEmpresa in '..\comunes\frames\new\unfraInfoEmpresa.pas' {fraInfoEmpresa: TFrame},
  unGestorCuenta in '..\comunes\forms\unGestorCuenta.pas' {frmGestorCuenta},
  unfraDelegacion in '..\comunes\frames\unfraDelegacion.pas' {fraDelegacion: TFrame},
  unQrEstadoCuentaResumen in '..\cobranzas\reports\unQrEstadoCuentaResumen.pas' {frmEstadoCuentaResumen},
  unQRF801C in '..\cobranzas\reports\unQRF801C.pas' {QRF801C: TQuickRep},
  unQRF817 in '..\cobranzas\reports\unQRF817.pas' {QRF817: TQuickRep},
  unQrLibreDeuda in '..\cobranzas\reports\unQrLibreDeuda.pas' {qrLibreDeuda: TQuickRep},
  unQRCartaDocIntimacion in '..\cobranzas\reports\unQRCartaDocIntimacion.pas' {QRCartaDocIntimacion: TQuickRep},
  unQRCartaDocIntimacionNuevaGrilla in '..\cobranzas\reports\unQRCartaDocIntimacionNuevaGrilla.pas' {QRCartaDocIntimacionNuevaGrilla: TQuickRep},
  unQrEstadoCuentaDetalle in '..\cobranzas\reports\unQrEstadoCuentaDetalle.pas' {frmEstadoCuentaDetalle},
  unOpcionesDeImpresion in '..\cobranzas\unOpcionesDeImpresion.pas' {frmOpcionesDeImpresion},
  unRptCartaDocCompensacion in '..\cobranzas\compensacion\reports\unRptCartaDocCompensacion.pas' {rptCartaDocCompensacion: TQuickRep},
  unConsultasAdicionales in '..\comunes\forms\unConsultasAdicionales.pas' {frmConsultasAdicionales},
  unAsignaciones in 'unAsignaciones.pas' {frmAsignaciones},
  unGestionEmpresasPreventorAsignaciones in 'unGestionEmpresasPreventorAsignaciones.pas' {frmGestionEmpPrevAsig: TFSForm},
  unInfInvestigacionEnfermedades in 'unInfInvestigacionEnfermedades.pas' {frmInfInvestigacionEnfermedades: TFSForm},
  unAsignacionesDetalle in 'unAsignacionesDetalle.pas' {frmCusto|mConsulta1: TFSForm},
  unEstadoCuenta in '..\cobranzas\unEstadoCuenta.pas',
  unCargaMultipleRiesgos in 'unCargaMultipleRiesgos.pas' {frmCargaMultipleRiesgos: TFSForm},
  unInfDifenilos in 'unInfDifenilos.pas' {frmInfDifenilos},
  unInfAccidentesMayores in 'unInfAccidentesMayores.pas' {frmInfAccidentesMayores},
  unFraTitulo in '..\comunes\frames\nuevos\unFraTitulo.pas' {fraTitulo: TFrame},
  unConsultaDifenilos in 'unConsultaDifenilos.pas' {frmConsultaDifenilos: TFSForm},
  unProfesionales in 'unProfesionales.pas' {frmProfesionales: TFSForm},
  unSustanciasSector in 'unSustanciasSector.pas' {frmSustanciasSector: TFSForm},
  unTraslados in 'unTraslados.pas' {frmTraslados: TFSForm},
  unManOrganismo in 'unManOrganismo.pas' {frmManOrganismo: TFSForm},
  unTrabajadoresDifenilos in 'unTrabajadoresDifenilos.pas' {frmTrabajadoresDifenilos: TFSForm},
  unConsultaAccidentesMayores in 'unConsultaAccidentesMayores.pas' {frmConsultaAccMayores: TFSForm},
  unCapacitacionResponsable in 'unCapacitacionResponsable.pas' {frmCapacitacionResponsable: TFSForm},
  unqrInvestigacionEnfermedad in 'unqrInvestigacionEnfermedad.pas' {frmqrInvestigacionEnfermedad},
  unImpoExpoWizard in '..\ImpoExpo\unImpoExpoWizard.pas' {frmImpoExpoWizard},
  unFraFiltroArchivo in '..\archivo_new\frames\unFraFiltroArchivo.pas' {fraFiltroArchivo: TFrame},
  unCargaRelevamientoPreventor463 in 'unCargaRelevamientoPreventor463.pas' {frmCargaRelevamientoPreventor463: TFSForm},
  unAgendaCargaConsulta in '..\comunes\forms\unAgendaCargaConsulta.pas' {frmAgendaCargaConsulta},
  unFraStaticCodDesc in '..\comunes\frames\nuevos\unFraStaticCodDesc.pas' {fraStaticCodDesc: TFrame},
  unFraCDG_DIAGNOSTICO in '..\siniestros\frames\unFraCDG_DIAGNOSTICO.pas' {fraCDG_DIAGNOSTICO: TFrame},
  unMANPUESTO in 'unMANPUESTO.pas' {frmManPuesto: TFSForm},
  unControlErgonomia in 'unControlErgonomia.pas' {frmControlErgonomia: TFSForm},
  unManRelevamientosPactados in 'unManRelevamientosPactados.pas' {frmManRelevamientosPactados: TFSForm},
  unPersonasEntrevistadas in 'unPersonasEntrevistadas.pas' {frmPersonasEntrevistadas: TFSForm},
  unInformesSiniestralidad in '..\comunes\forms\unInformesSiniestralidad.pas' {frmInformesSiniestralidad},
  unInfSiniestralidad in '..\comunes\unInfSiniestralidad.pas',
  unExcel in '..\..\comunes\unExcel.pas',
  unVisor in '..\comunes\forms\unVisor.pas' {frmVisor},
  unArchivoVisor in '..\comunes\unArchivoVisor.pas',
  unVisorExcel in '..\comunes\forms\unVisorExcel.pas' {frmVisorExcel},
  unConsultaTareas in 'unConsultaTareas.pas' {frmConsultaTareas: TFSForm},
  unComisiones in '..\afiliaciones\comisiones\unComisiones.pas',
  unFraCanal in '..\comunes\frames\new\unFraCanal.pas' {fraCanal: TFrame},
  unDatosSiniestro in '..\comunes\forms\unDatosSiniestro.pas' {frmDatosSiniestro},
  unManEstadoErgonomia in 'unManEstadoErgonomia.pas' {frmManEstadoErgonomia: TFSForm},
  unManSinExpuestos in 'unManSinExpuestos.pas' {frmManSinExpuestos: TFSForm},
  unfraProspectosAGENDA in '..\comunes\frames\modulosagenda\unfraProspectosAGENDA.pas' {fraProspectosAGENDA: TFrame},
  unConsultaRelevWeb in 'unConsultaRelevWeb.pas' {frmConsultaRelevWeb: TFSForm},
  unRptResolucion463SolicitudAfi in 'unRptResolucion463SolicitudAfi.pas' {rptResolucion463SolicitudAFI},
  unQrEtiquetasDocCarpetas in '..\archivo_new\unQrEtiquetasDocCarpetas.pas' {qrEtiquetasDocCarpetas: TQuickRep},
  unfraSectores in '..\comunes\frames\unfraSectores.pas' {fraSectores: TFrame},
  unRptPlantillaRGRL in '..\comunes\reports\unRptPlantillaRGRL.pas' {qrPlantillaRGRL: TQuickRep},
  unLegales in '..\Legales\unLegales.pas',
  unAgendaVistaEmpresa in '..\comunes\forms\unAgendaVistaEmpresa.pas' {frmAgendaVistaEmpresa},
  unfraVistaEventos in '..\comunes\frames\modulosagenda\unfraVistaEventos.pas' {fraVistaEventos: TFrame},
  unHistoricoEstadoSumario in '..\legales\unHistoricoEstadoSumario.pas' {frmHistoricoEstadoSumario: TFSForm},
  unConsultaSiniestrosHYS in 'unConsultaSiniestrosHYS.pas' {frmConsultaSiniestros: TFSForm},
  unCargaDocumentosDigitaliz in '..\comunes\forms\unCargaDocumentosDigitaliz.pas' {frmCargaDocumentosDigitaliz},
  unMailAbogado in '..\Legales\unMailAbogado.pas' {frmEmailAbogado: TFSForm},
  unFrmConsultaCarpetas in '..\archivo_new\unFrmConsultaCarpetas.pas' {FrmConsultaCarpetas: TFSForm},
  unFrmSolicitudCarpeta in '..\archivo_new\unFrmSolicitudCarpeta.pas' {FrmSolicitudCarpeta: TFSForm},
  unQrEtiquetasCarpetas in '..\archivo_new\unQrEtiquetasCarpetas.pas' {qrEtiquetasCarpetas: TQuickRep},
  unFraDetalleArchivo in '..\archivo_new\frames\unFraDetalleArchivo.pas' {fraDetalleArchivo: TFrame},
  unFrmDetalleArchivo in '..\archivo_new\unFrmDetalleArchivo.pas' {FrmDetalleArchivo},
  unMovimientoCarpetas in '..\archivo_new\unMovimientoCarpetas.pas' {frmMovimientoCarpetas},
  unQrDetalleLoteEstudio in '..\archivo_new\unQrDetalleLoteEstudio.pas' {QrDetalleLoteEstudio},
  unReemplazoCarpetas in '..\archivo_new\unReemplazoCarpetas.pas' {frmReemplazoCarpetas},
  unfrmUbicacionActual in '..\archivo_new\unfrmUbicacionActual.pas' {FrmUbicacionActual},
  unfraPrestador in '..\comunes\frames\unfraPrestador.pas' {fraPrestador: TFrame},
  unManEstimacionEstablecimiento in 'unManEstimacionEstablecimiento.pas' {frmManEstimacionEstablecimiento: TFSForm},
  unCotizacionPrevencion in 'unCotizacionPrevencion.pas' {frmCotizacionPrevencion},
  unPlanVisitas in 'unPlanVisitas.pas' {frmPlanVisitas: TFSForm},
  unPlanVisitasDetalle in 'unPlanVisitasDetalle.pas' {frmPlanVisitasDetalle: TFSForm},
  unCargaTareas in 'unCargaTareas.pas' {frmCargaTareas: TFSForm},
  unEstadisticaIndicadores in 'unEstadisticaIndicadores.pas' {frmEstadisticasIndicadores: TFSForm},
  unWelcomeSplash in '..\comunes\forms\unWelcomeSplash.pas' {frmWelcomeSplash},
  unTesoreria in '..\afiliaciones\tesoreria\unTesoreria.pas',
  unRptEventoImpresoSumario in '..\legales\unRptEventoImpresoSumario.pas' {RptEventoImpresoSumario},
  unManFrecuenciaVisita in 'unManFrecuenciaVisita.pas' {frmManFrecuenciaVisita: TFSForm},
  unNotificacionSiniestros in 'unNotificacionSiniestros.pas' {frmNotificacionSiniestros: TFSForm},
  unRptRemitoPreventor in 'unRptRemitoPreventor.pas' {RptRemitoPreventor},
  unRptAvisoObraRechazado in 'unRptAvisoObraRechazado.pas' {rptAvisoObraRechazado},
  unRptProgramaSeguridadRechazo in 'unRptProgramaSeguridadRechazo.pas' {rptProgramaSeguridadRechazo},
  unRptProgramaSeguridadAprobado in 'unRptProgramaSeguridadAprobado.pas' {rptProgramaSeguridadAprobado},
  unDetalleIndicadores in 'unDetalleIndicadores.pas' {frmDetalleIndicadores: TFSForm},
  unAdmVencidos in 'unAdmVencidos.pas' {frmAdmVencidos: TFSForm},
  unManObservacionesVencidos in 'unManObservacionesVencidos.pas' {frmManObservacionVencidos: TFSForm},
  unRptNotaDenuncia in 'unRptNotaDenuncia.pas' {rptNotaDenuncia},
  unQrDetalleRemitoDevolucion in '..\archivo_new\unQrDetalleRemitoDevolucion.pas' {QrDetalleRemitoDevolucion},
  unControlDeEnvioNotasDenuncia in 'unControlDeEnvioNotasDenuncia.pas' {frmControlDeEnvioNotasDenuncia: TFSForm},
  unFraEmpresaSolicitud in '..\comunes\frames\new\unFraEmpresaSolicitud.pas' {fraEmpresaSolicitud: TFrame},
  unfraEmpresaSolicitudAGENDA in '..\comunes\frames\modulosagenda\unfraEmpresaSolicitudAGENDA.pas' {fraEmpresaSolicitudAGENDA: TFrame},
  unRptNotaDenunciaRiegoInvalido in 'unRptNotaDenunciaRiegoInvalido.pas' {rptNotaDenunciaRiesgoInvalido},
  unConsultoria in 'unConsultoria.pas' {frmConsultoria: TFSForm},
  unRptConsultoria in 'unRptConsultoria.pas' {rptConsultoria},
  unRptConsultoriaEstablecimientos in 'unRptConsultoriaEstablecimientos.pas' {rptConsultoriaEstablecimiento},
  unRptConsultoriaPiePagina in 'unRptConsultoriaPiePagina.pas' {rptConsultoriaPiePagina},
  unManCVS_VENTANILLA_SUBTEMAS in '..\comunes\forms\unManCVS_VENTANILLA_SUBTEMAS.pas' {frmManCVS_VENTANILLA_SUBTEMAS: TFSForm},
  unfraDatoFechaAGENDA in '..\comunes\frames\modulosagenda\unfraDatoFechaAGENDA.pas' {fraDatoFecha: TFrame},
  unFrmArmadoLote in '..\archivo_new\unFrmArmadoLote.pas' {FrmArmadoLote: TFSForm},
  unQrDetalleLote in '..\archivo_new\unQrDetalleLote.pas' {QrDetalleLote},
  unRptResumenLotes in '..\archivo_new\unRptResumenLotes.pas' {qrResumenLotes: TQuickRep},
  unVerImagenes in '..\archivo_new\unVerImagenes.pas' {frmVerImagenes},
  unMensajeAlerta in '..\..\comunes\unMensajeAlerta.pas',
  unTareasaRevisar in 'unTareasaRevisar.pas' {frmTareasaRevisar: TFSForm},
  unFraMultiSeleccion in '..\comunes\frames\unFraMultiSeleccion.pas' {fraMultiSeleccion: TFrame},
  unFraWebBrowser in '..\comunes\frames\new\unFraWebBrowser.pas' {fraWebBrowser: TFrame},
  unFraGIS_APIv3 in '..\comunes\frames\new\unFraGIS_APIv3.pas' {fraGIS_APIv3: TFrame},
  unGIS in '..\..\comunes\unGIS.pas',
  unMensajeAlertaAGA in '..\archivo_new\unMensajeAlertaAGA.pas',
  unRTF in '..\..\comunes\unRTF.pas',
  unInformeRTF in '..\..\comunes\unInformeRTF.pas',
  unEsperaSimple in '..\comunes\forms\unEsperaSimple.pas' {frmEsperaSimple},
  unExportPDF in '..\..\comunes\unExportPDF.pas',
  unImportacionEstablecimientosSRT in 'unImportacionEstablecimientosSRT.pas' {frmImportacionEstablecimientosSRT},
  unManZonaCotizacion in 'unManZonaCotizacion.pas' {frmManZonaCotizacion: TFSForm},
  unControlDenunciasRiesgos in 'unControlDenunciasRiesgos.pas' {frmControlDenunciasRiesgos: TFSForm},
  unModificacionProvinciaZona in 'unModificacionProvinciaZona.pas' {frmModificacionProvinciaZona: TFSForm},
  unImpoExpoUtils in '..\impoexpo\unImpoExpoUtils.pas',
  unImportCryptoSrt in '..\..\comunes\unImportCryptoSrt.pas',
  unSeleccionarCarpetaSRT in '..\afiliaciones\unSeleccionarCarpetaSRT.pas' {frmSeleccionarCarpetaSRT},
  unConsultaVisitasAnual in 'unConsultaVisitasAnual.pas' {frmConsultaVisitasAnual: TFSForm},
  unEnvioSMS in '..\comunes\forms\unEnvioSMS.pas' {frmEnvioSMS},
  unAvisodeObraWeb in 'unAvisodeObraWeb.pas' {frmAvisoDeObraWeb: T},
  IArtMail in '..\comunes\IArtMail.pas',
  SortDlg in '..\..\paquetes\sortdlg\SortDlg.pas',
  unRptFormularioAvisoObra in 'unRptFormularioAvisoObra.pas' {rptFormularioAvisodeObraWeb},
  unManCantidadVisitasPreventor in 'unManCantidadVisitasPreventor.pas' {frmManCantidadVisitasPreventor: TFSForm},
  unTableroET in 'unTableroET.pas' {frmTableroET: TFSForm},
  unTableroEP in 'unTableroEP.pas' {frmTableroEP: TFSForm},
  unTableroCO in 'unTableroCO.pas' {frmTableroCO: TFSForm},
  unRARWeb in 'unRARWeb.pas' {frmRARWeb: TFSForm},
  unDetalleRARWeb in 'unDetalleRARWeb.pas' {frmDetalleRARWeb},
  unManPreventorConsultora in 'unManPreventorConsultora.pas' {frmManPreventorConsultoras: TFSForm},
  unFraTipoRegimen in '..\comunes\frames\new\unFraTipoRegimen.pas' {fraTipoRegimen: TFrame},
  unSeleccionarViatico in 'unSeleccionarViatico.pas' {frmSeleccionarViatico: TFSForm},
  unImpresionRelevamientoRiesgosLaborales in 'unImpresionRelevamientoRiesgosLaborales.pas' {frmImpresionRelevamientoRiesgosLaborales: TFSForm};

{$R *.RES}

begin
  OnlyOneInstance;
  Application.Initialize;
  Application.Title := 'Higiene y Seguridad';

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
