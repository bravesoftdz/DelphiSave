unit unPrincipal;

//{$DEFINE DEBUG}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, ToolWin, ComCtrls, StdCtrls, ImgList,
  artSeguridad, artDbLogin, General, shellapi, Placemnt, ExtCtrls, Db, SDEngine, LookupDialog, Grids, DBGrids,
  unfraSubPrestacion, Login, XPMenu, JvTrayIcon, JvComponent, JvCaptionButton, JvBackgrounds, unRecepPartesGrales,
  AdvOfficeHint, ActnList, JvComponentBase, RxPlacemnt;

type                 
    TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    mnuSalir: TMenuItem;
    Sb_BarraDeEstado: TStatusBar;
    ilImagenes: TImageList;
    mnuVentana: TMenuItem;
    mnuMaximizar: TMenuItem;
    mnuRestaurar: TMenuItem;
    mnuMinimizar: TMenuItem;
    sep1: TMenuItem;
    mnuCascada: TMenuItem;
    mnuMosaicoHorizontal: TMenuItem;
    mnuMosaicoVertical: TMenuItem;
    mnuOrganizarIconos: TMenuItem;               
    DBLogin: TDBLogin;
    Seguridad: TSeguridad;
    mnuParteEvolutivo:   TMenuItem;
    FormPlacement:       TFormPlacement;
    mnuLiquiRecepcion:   TMenuItem;
    mnuAutorizaciones:   TMenuItem;
    mnuAutAprobacion:    TMenuItem;
    mnuAutCarga:         TMenuItem;
    mnuLiquidaciones:    TMenuItem;
    mnuLiquiAprobacion:  TMenuItem;
    mnuLiquiIngreso:     TMenuItem;
    mnuMantenimiento:    TMenuItem;
    mnuMantPrestadores:  TMenuItem;
    mnuMantPrestaciones: TMenuItem;
    mnuMantGrpTrabajo:   TMenuItem;
    N1:                  TMenuItem;
    imgLogoMUTUAL:       TImage;
    mnuPedInfo:          TMenuItem;
    mnuLiquiAutPago:     TMenuItem;
    mnuLiquiCarGen:      TMenuItem;
    mnuLiquiPorSiniestro:TMenuItem;
    mnuLiquiGenrica:     TMenuItem;
    mnuFirmantes:        TMenuItem;
    mnuDocumentos:       TMenuItem;
    mnuInformeEvol:      TMenuItem;
    mnuParteEvolutivoCarga: TMenuItem;
    mnuPasientesInternados: TMenuItem;
    imgGenColor:            TImageList;
    imgGenBW:               TImageList;
    mnuLiquiConsVol:        TMenuItem;
    dlgDetalle:             TLookupDialog;
    dsDetalle:              TDataSource;
    sdqDetalle:             TSDQuery;
    ldgHistoria:            TLookupDialog;
    sdqHistoria:            TSDQuery;
    sdqHistoriaAU_SINIESTRO:TFloatField;
    sdqHistoriaAU_ORDEN:    TFloatField;
    sdqHistoriaAU_RECAIDA:  TFloatField;
    sdqHistoriaAU_NUMAUTO:  TFloatField;
    sdqHistoriaAU_FECHASOLI:TDateTimeField;
    sdqHistoriaTB_DESCRIPCION: TStringField;
    sdqHistoriaPRESTADOR: TStringField;
    sdqHistoriaPRESTACION: TStringField;
    sdqHistoriaGRUPO_T: TStringField;
    sdqHistoriaOBSERVACIONES: TStringField;
    sdqHistoriaAU_USUAPRO: TStringField;
    sdqHistoriaAU_FECHAPRO: TDateTimeField;
    dsHistoria: TDataSource;
    mnuLiquiListApro: TMenuItem;
    mnuAuditores: TMenuItem;
    mnuListPasSinEvo: TMenuItem;
    mnuManRangos: TMenuItem;
    mnuLiquiImputPagos: TMenuItem;
    N3: TMenuItem;
    imgLogo: TImage;
    mnuListDiasCados: TMenuItem;
    mnuAutConsulta: TMenuItem;
    mnuCambGrupoTrabajo: TMenuItem;
    N4: TMenuItem;
    mnuListados: TMenuItem;
    N5: TMenuItem;
    mnuConsSin: TMenuItem;
    mnuListOpProg: TMenuItem;
    mnuCostosporCIE10: TMenuItem;
    mnuSegExpe: TMenuItem;
    mnuPresMed: TMenuItem;
    N7: TMenuItem;
    mnuListPorEmpr: TMenuItem;
    mnuMantTipoPrestador: TMenuItem;
    mnuMantEspecialidades: TMenuItem;
    N8: TMenuItem;
    mnuSegExpMantenimiento: TMenuItem;
    mnuTextosdeCartasDocumentos: TMenuItem;
    mnuTextosdeCartasDocumentosaTrab: TMenuItem;
    N9: TMenuItem;
    mnuSegExpManEventos: TMenuItem;
    mnuConsultaPrestadores: TMenuItem;
    mnuListSiniSinAltaMed: TMenuItem;
    mnuMantProtesisOrtesis: TMenuItem;
    mnuMantSubPrestaciones: TMenuItem;
    mnuPrestadoresGeneral: TMenuItem;
    mnuManPrestUnMedicas: TMenuItem;
    N2: TMenuItem;
    N10: TMenuItem;
    mnuManNomenclador: TMenuItem;
    mnuMantTiposTraslado: TMenuItem;
    mnuMantSolicitantes: TMenuItem;
    mnuReimpVolantes: TMenuItem;
    mrnLiqRecepVolantes: TMenuItem;
    ldgFirmas: TLookupDialog;
    sdqFirmas: TSDQuery;
    dsFirmas: TDataSource;
    sdqFirmasDF_CODFIRMA: TStringField;
    sdqFirmasUSUARIO: TStringField;
    sdqFirmasCARACTER: TStringField;
    mnuMantEmpresasVIP: TMenuItem;
    mnuMantCie10: TMenuItem;
    MnuSinSEvo: TMenuItem;
    N12: TMenuItem;
    ListadosdeRecalificacion1: TMenuItem;
    mnuListRecalGen: TMenuItem;
    mnuListRecalEven: TMenuItem;
    Rehabilitacin1: TMenuItem;
    mnuPorTratamiento: TMenuItem;
    mnuCostos: TMenuItem;
    mnuViajesalExterior: TMenuItem;
    mnuRatifAlta: TMenuItem;
    mnuCostosporSiniestro: TMenuItem;
    mnuManejodeConsultorio: TMenuItem;
    MnuManTurnosMedicos: TMenuItem;
    mnuContinaTratamientosinalta: TMenuItem;
    mnuRequerimientosSRT: TMenuItem;
    mnuLstWeb: TMenuItem;
    mnuLstWebMigracion: TMenuItem;
    mnuSuspensionPlazos: TMenuItem;
    mnuLstWebRecepcionParte: TMenuItem;
    ilByN: TImageList;
    ilColor: TImageList;
    mnuCompaniasAseguradoras: TMenuItem;
    mnuScoring: TMenuItem;
    N13: TMenuItem;
    mnuDerivacionVolantes: TMenuItem;
    JvCaptionButton: TJvCaptionButton;
    JvTrayIcon: TJvTrayIcon;
    JvBackground: TJvBackground;
    mnuElementosEnviados: TMenuItem;
    mnuAgenda: TMenuItem;
    mnuCorreoElectronico: TMenuItem;
    mnuEnviarCorreo: TMenuItem;
    mnuLibretaDeDirecciones: TMenuItem;
    mnuCargaDiaria: TMenuItem;
    MnuMotivosdenoCarga: TMenuItem;
    mnuRecepcionPartesGenerales: TMenuItem;
    MnuMotivosRechazo: TMenuItem;
    MnuMotivosAnulacion: TMenuItem;
    mnuSeguimientoAuditoriasMedicas: TMenuItem;
    mnuRecepcionTelegramas: TMenuItem;
    MnuSeguimientoMedico: TMenuItem;
    dsRecaidas: TDataSource;
    sdqRecaidas: TSDQuery;
    ldgRecaidas: TLookupDialog;
    sdqRecaidasEX_RECAIDA: TFloatField;
    sdqRecaidasEX_FECHARECAIDA: TDateTimeField;
    sdqRecaidasEX_BAJAMEDICA: TDateTimeField;
    sdqRecaidasEX_ALTAMEDICA: TDateTimeField;
    sdqRecaidasEX_CAUSAFIN: TStringField;
    sdqRecaidasDESCRCAUSAFIN: TStringField;
    MnuMotivosDebito: TMenuItem;
    MnuSegMedRecalificacion: TMenuItem;
    MnuRecalificacionSRT: TMenuItem;
    mnuManPracticasModulos: TMenuItem;
    MnuGeneracionTelegramas: TMenuItem;
    mnuImpresora: TMenuItem;
    mnuImpresoraConfigurar: TMenuItem;
    PrintDialog: TPrintDialog;
    mnuListRecepcionPartesMail: TMenuItem;
    mnuCartaRechPr: TMenuItem;
    mnuCartasPrestador: TMenuItem;
    mnuNotificacionAltasPr: TMenuItem;
    mnuMantCartasDoc: TMenuItem;
    mnuManTextosCartas: TMenuItem;
    mnuManAreasCartasDoc: TMenuItem;
    N16: TMenuItem;
    MnuManCodRecepcion: TMenuItem;
    mnuListCostos: TMenuItem;
    mnuConsultaPresupuestos: TMenuItem;
    mnuListSiniestrosConInternacion: TMenuItem;
    MnuCambioCuitSin: TMenuItem;
    MnuTelefonogramas: TMenuItem;
    MnuTelegramas: TMenuItem;
    mnuAdministracionCartas: TMenuItem;
    mnuManFirmantesCartas: TMenuItem;
    imgLogoGob: TImage;
    mnuDigitalizacion: TMenuItem;
    mnuRecepcionVolantes: TMenuItem;
    mnuLiqRecepcionAuditoria: TMenuItem;
    mnuNomencladorCargaManual: TMenuItem;
    mnuNomencladorCargaMasiva: TMenuItem;
    mnuLiqRecepOrtopedia: TMenuItem;
    mnuLiqRecepLiquidaciones: TMenuItem;
    mnuConsAlquileresOrt: TMenuItem;
    mnuOrtopedia: TMenuItem;
    mnuConsRecuperoOrt: TMenuItem;
    mnuConsStockOrt: TMenuItem;
    mnuListSeguimientoMedico: TMenuItem;
    mnuFax: TMenuItem;
    mnuBandejadeEntrada: TMenuItem;
    mnuElementosEnviadosFax: TMenuItem;
    mnuDocumentacion: TMenuItem;
    mnuGeneral: TMenuItem;
    N6: TMenuItem;
    N11: TMenuItem;
    N15: TMenuItem;
    mnuNovedadesDelSistema: TMenuItem;
    mnuManAutorizaciones: TMenuItem;
    MnuMotAnulTraslados: TMenuItem;
    mnuListHistoricoVolantes: TMenuItem;
    N17: TMenuItem;
    mnuSolicitudDePresupuestosAMP: TMenuItem;
    mnuLiqAMP: TMenuItem;
    mnuLiqAMPCarga: TMenuItem;
    mnuLiqAMPAprob: TMenuItem;
    mnuLiqAMPAutPago: TMenuItem;
    dlgDetalleAMP: TLookupDialog;
    sdqDetalleVolAMP: TSDQuery;
    dsDetalleAMP: TDataSource;
    mnuManMotAnulCitaciones: TMenuItem;
    mnuCeseILT: TMenuItem;
    sdqHistoriaUSUGESTOR: TStringField;
    MnuRemitosCartas: TMenuItem;
    mnuSegCronicos: TMenuItem;
    mnuManCuentasUsuarios: TMenuItem;
    N18: TMenuItem;
    mnuMediosdeTransporte: TMenuItem;
    mnuConfAgendaDeLosMediosDeTransporte: TMenuItem;
    mnuAgendaDeLosMediosDeTransporte: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    mnuSRT: TMenuItem;
    mnuVentanillaElectronica: TMenuItem;
    mnuUsuariosPrestador: TMenuItem;
    mnuPacientesCronicos: TMenuItem;
    mnuMedicamentosCronicos: TMenuItem;
    mnuManGruposPrestaciones: TMenuItem;
    mnuConsultaDePresupuestosySolicitudes: TMenuItem;
    mnuLugarCitacion: TMenuItem;
    mnuResponsable: TMenuItem;
    mnuRecalificacion: TMenuItem;
    mnuImportMedicCron: TMenuItem;
    mnuIngresoMasivo: TMenuItem;
    N21: TMenuItem;
    mnuGIS: TMenuItem;
    mnuIngresosSRT: TMenuItem;
    MnuRecalificacin: TMenuItem;
    MnuImportaciningresoSRT: TMenuItem;
    mnuMonitoreoGIS: TMenuItem;
    AdvOfficeHint: TAdvOfficeHint;
    mnuEnviosSRT: TMenuItem;
    mnuManPresupuestoMensual: TMenuItem;
    mnuSeguimientos: TMenuItem;
    mnuClasificacionAct: TMenuItem;
    mnuPlazosdeGuarda: TMenuItem;
    mnuTiposDeActivo: TMenuItem;
    ActionList1: TActionList;
    mnuManAuditoresVolantes: TMenuItem;
    mnuAuditConsultorio: TMenuItem;
    mnuManLiquidaciones: TMenuItem;
    mnuManMotivosDebitosAudit: TMenuItem;
    mnuManUsuAvisoVol: TMenuItem;
    mnuListExamenesPreocupacionales: TMenuItem;
    mnuManTipoDevolFacturas: TMenuItem;
    mnuDevolucionFacturas: TMenuItem;
    mnuManMotivosBajaSeguimientoMed: TMenuItem;
    mnuAbandonoTratamiento: TMenuItem;
    mnuRefDelegaciones: TMenuItem;
    mnuAgendaTelefonica: TMenuItem;
    N14: TMenuItem;
    mnuMotivosBajaPrest: TMenuItem;
    mnuPrestadoresAuditoria: TMenuItem;
    mnuIIBBProvincias: TMenuItem;
    mnuEventosAutorizacion: TMenuItem;
    mnuN22: TMenuItem;
    mnuPrestadorPreferencial: TMenuItem;
    mnuSiniestrosTopeados: TMenuItem;
    mnuEmpresasPrestadoras: TMenuItem;
    mnuServiciosAEmpresas: TMenuItem;
    mnuRecalifMantenimiento: TMenuItem;
    mnuMantRecalifEventos: TMenuItem;
    mnuPrestPorPresup: TMenuItem;
    mnuMantGrpTrabajo2: TMenuItem;
    mnuEnvioMailTipoPres: TMenuItem;
    mnuAuditoresPrestador: TMenuItem;
    mnuSMS: TMenuItem;
    mnuMantenimientoTextosSMS: TMenuItem;
    mnuListLiquidaciones: TMenuItem;
    mnuReportePLA: TMenuItem;
    mnuTableroControl: TMenuItem;
    mnuEgresosSemanales: TMenuItem;
    mnuAMF: TMenuItem;
    mnuReportePorAuditor: TMenuItem;
    mnuTableroControlAMF: TMenuItem;
    procedure mnuMaximizarClick(Sender: TObject);
    procedure mnuRestaurarClick(Sender: TObject);
    procedure mnuMinimizarClick(Sender: TObject);
    procedure mnuCascadaClick(Sender: TObject);
    procedure mnuMosaicoHorizontalClick(Sender: TObject);
    procedure mnuMosaicoVerticalClick(Sender: TObject);
    procedure mnuOrganizarIconosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLoginLogin(Sender: TObject);
    procedure mnuAutCargaClick(Sender: TObject);
    procedure mnuAutAprobacionClick(Sender: TObject);
    procedure mnuLiquiRecepcionClick(Sender: TObject);
    procedure mnuMantGrpTrabajoClick(Sender: TObject);
    procedure mnuLiquiIngresoClick(Sender: TObject);
    procedure mnuPedInfoClick(Sender: TObject);
    procedure mnuLiquiAprobacionClick(Sender: TObject);
    procedure mnuMantPrestadoresClick(Sender: TObject);
    procedure mnuLiquiCarGenClick(Sender: TObject);
    procedure mnuLiquiAutPagoClick(Sender: TObject);
    procedure mnuMantPrestacionesClick(Sender: TObject);
    procedure mnuFirmantesClick(Sender: TObject);
    procedure mnuDocumentosClick(Sender: TObject);
    procedure mnuInformeEvolClick(Sender: TObject);
    procedure mnuParteEvolutivoCargaClick(Sender: TObject);
    procedure mnuPasientesInternadosClick(Sender: TObject);
    procedure mnuLiquiConsVolClick(Sender: TObject);
    procedure ldgHistoriaTitleClick(Column: TColumn);
    procedure mnuSalirClick(Sender: TObject);
    procedure mnuLiquiListAproClick(Sender: TObject);
    procedure mnuAuditoresClick(Sender: TObject);
    procedure mnuListPasSinEvoClick(Sender: TObject);
    procedure mnuManRangosClick(Sender: TObject);
    procedure mnuLiquiImputPagosClick(Sender: TObject);
    procedure mnuListDiasCadosClick(Sender: TObject);
    procedure mnuAutConsultaClick(Sender: TObject);
    procedure mnuCambGrupoTrabajoClick(Sender: TObject);
    procedure mnuConsSinClick(Sender: TObject);
    procedure mnuListOpProgClick(Sender: TObject);
    procedure mnuCostosporCIE10Click(Sender: TObject);
    procedure mnuListPorEmprClick(Sender: TObject);
    procedure mnuMantTipoPrestadorClick(Sender: TObject);
    procedure mnuMantEspecialidadesClick(Sender: TObject);
    procedure mnuTextosdeCartasDocumentosClick(Sender: TObject);
    procedure mnuTextosdeCartasDocumentosaTrabClick(Sender: TObject);
    procedure mnuSegExpManEventosClick(Sender: TObject);
    procedure mnuConsultaPrestadoresClick(Sender: TObject);
    procedure mnuListSiniSinAltaMedClick(Sender: TObject);
    procedure mnuMantProtesisOrtesisClick(Sender: TObject);
    procedure mnuMantSubPrestacionesClick(Sender: TObject);
    procedure mnuManPrestUnMedicasClick(Sender: TObject);
    procedure mnuMantTiposTrasladoClick(Sender: TObject);
    procedure mnuMantSolicitantesClick(Sender: TObject);
    procedure mnuReimpVolantesClick(Sender: TObject);
    procedure mrnLiqRecepVolantesClick(Sender: TObject);
    procedure mnuMantEmpresasVIPClick(Sender: TObject);
    procedure mnuMantCie10Click(Sender: TObject);
    procedure MnuSinSEvoClick(Sender: TObject);
    procedure mnuListRecalGenClick(Sender: TObject);
    procedure mnuListRecalEvenClick(Sender: TObject);
    procedure mnuPorTratamientoClick(Sender: TObject);
    procedure mnuViajesalExteriorClick(Sender: TObject);
    procedure mnuCostosClick(Sender: TObject);
    procedure mnuRatifAltaClick(Sender: TObject);
    procedure mnuCostosporSiniestroClick(Sender: TObject);
    procedure mnuManejodeConsultorioClick(Sender: TObject);
    procedure MnuManTurnosMedicosClick(Sender: TObject);
    procedure mnuContinaTratamientosinaltaClick(Sender: TObject);
    procedure mnuCartaRechPrClick(Sender: TObject);
    procedure mnuRequerimientosSRTClick(Sender: TObject);
    procedure mnuLstWebMigracionClick(Sender: TObject);
    procedure mnuLstWebRecepcionParteClick(Sender: TObject);
    procedure mnuCompaniasAseguradorasClick(Sender: TObject);
    procedure mnuScoringClick(Sender: TObject);
    procedure mnuDerivacionVolantesClick(Sender: TObject);
    procedure JvCaptionButtonClick(Sender: TObject);
    procedure JvTrayIconDblClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mnuElementosEnviadosClick(Sender: TObject);
    procedure mnuAgendaClick(Sender: TObject);
    procedure mnuEnviarCorreoClick(Sender: TObject);
    procedure mnuLibretaDeDireccionesClick(Sender: TObject);
    procedure mnuCargaDiariaClick(Sender: TObject);
    procedure MnuMotivosdenoCargaClick(Sender: TObject);
    procedure mnuRecepcionPartesGeneralesClick(Sender: TObject);
    procedure MnuMotivosRechazoClick(Sender: TObject);
    procedure MnuMotivosAnulacionClick(Sender: TObject);
    procedure mnuSeguimientoAuditoriasMedicasClick(Sender: TObject);
    procedure ImpoExpo(Sender: TObject);
    procedure MnuMotivosDebitoClick(Sender: TObject);
    procedure MnuSegMedRecalificacionClick(Sender: TObject);
    procedure MnuRecalificacionSRTClick(Sender: TObject);
    procedure mnuManPracticasModulosClick(Sender: TObject);
    procedure mnuImpresoraConfigurarClick(Sender: TObject);
    procedure mnuListRecepcionPartesMailClick(Sender: TObject);
    procedure mnuNotificacionAltasPrClick(Sender: TObject);
    procedure mnuManTextosCartasClick(Sender: TObject);
    procedure mnuManAreasCartasDocClick(Sender: TObject);
    procedure MnuManCodRecepcionClick(Sender: TObject);
    procedure mnuSuspensionPlazosClick(Sender: TObject);
    procedure mnuConsultaPresupuestosClick(Sender: TObject);
    procedure mnuListSiniestrosConInternacionClick(Sender: TObject);
    procedure MnuCambioCuitSinClick(Sender: TObject);
    procedure MnuTelefonogramasClick(Sender: TObject);
    procedure mnuAdministracionCartasClick(Sender: TObject);
    procedure mnuManFirmantesCartasClick(Sender: TObject);
    procedure mnuDigitalizacionClick(Sender: TObject);
    procedure mnuLiqRecepcionAuditoriaClick(Sender: TObject);
    procedure mnuNomencladorCargaManualClick(Sender: TObject);
    procedure mnuLiqRecepOrtopediaClick(Sender: TObject);
    procedure mnuLiqRecepLiquidacionesClick(Sender: TObject);
    procedure mnuConsAlquileresOrtClick(Sender: TObject);
    procedure mnuConsRecuperoOrtClick(Sender: TObject);
    procedure mnuConsStockOrtClick(Sender: TObject);
    procedure mnuListSeguimientoMedicoClick(Sender: TObject);
    procedure mnuBandejadeEntradaClick(Sender: TObject);
    procedure mnuElementosEnviadosFaxClick(Sender: TObject);
    procedure mnuDocumentacionClick(Sender: TObject);
    procedure mnuNovedadesDelSistemaClick(Sender: TObject);
    procedure MnuMotAnulTrasladosClick(Sender: TObject);
    procedure mnuListHistoricoVolantesClick(Sender: TObject);
    procedure mnuSolicitudDePresupuestosAMPClick(Sender: TObject);
    procedure mnuLiqAMPCargaClick(Sender: TObject);
    procedure mnuLiqAMPAprobClick(Sender: TObject);
    procedure mnuLiqAMPAutPagoClick(Sender: TObject);
    procedure mnuManMotAnulCitacionesClick(Sender: TObject);
    procedure mnuCeseILTClick(Sender: TObject);
    procedure MnuRemitosCartasClick(Sender: TObject);
    procedure mnuSegCronicosClick(Sender: TObject);
    procedure mnuManCuentasUsuariosClick(Sender: TObject);
    procedure mnuMediosdeTransporteClick(Sender: TObject);
    procedure mnuConfAgendaDeLosMediosDeTransporteClick(Sender: TObject);
    procedure mnuAgendaDeLosMediosDeTransporteClick(Sender: TObject);
    procedure mnuClasificacionActClick(Sender: TObject);
    procedure mnuVentanillaElectronicaClick(Sender: TObject);
    procedure mnuUsuariosPrestadorClick(Sender: TObject);
    procedure mnuMedicamentosCronicosClick(Sender: TObject);
    procedure mnuManGruposPrestacionesClick(Sender: TObject);
    procedure mnuConsultaDePresupuestosySolicitudesClick(Sender: TObject);
    procedure mnuLugarCitacionClick(Sender: TObject);
    procedure mnuResponsableClick(Sender: TObject);
    procedure mnuGISClick(Sender: TObject);
    procedure mnuIngresosSRTClick(Sender: TObject);
    procedure mnuMonitoreoGISClick(Sender: TObject);
    procedure mnuEnviosSRTClick(Sender: TObject);
    procedure mnuManPresupuestoMensualClick(Sender: TObject);
    procedure mnuPlazosdeGuardaClick(Sender: TObject);
    procedure mnuSeguimientosClick(Sender: TObject);
    procedure mnuTiposDeActivoClick(Sender: TObject);
    procedure mnuManAuditoresVolantesClick(Sender: TObject);
    procedure mnuAuditConsultorioClick(Sender: TObject);
    procedure mnuManMotivosDebitosAuditClick(Sender: TObject);
    procedure mnuManUsuAvisoVolClick(Sender: TObject);
    procedure mnuListExamenesPreocupacionalesClick(Sender: TObject);
    procedure mnuManTipoDevolFacturasClick(Sender: TObject);
    procedure mnuDevolucionFacturasClick(Sender: TObject);
    procedure mnuManMotivosBajaSeguimientoMedClick(Sender: TObject);
    procedure mnuAbandonoTratamientoClick(Sender: TObject);
    procedure mnuAgendaTelefonicaClick(Sender: TObject);
    procedure mnuRefDelegacionesClick(Sender: TObject);
    procedure mnuMotivosBajaPrestClick(Sender: TObject);
    procedure mnuPrestadoresAuditoriaClick(Sender: TObject);
    procedure mnuIIBBProvinciasClick(Sender: TObject);
    procedure mnuEventosAutorizacionClick(Sender: TObject);
    procedure mnuPrestadorPreferencialClick(Sender: TObject);
    procedure mnuSiniestrosTopeadosClick(Sender: TObject);
    procedure mnuEmpresasPrestadorasClick(Sender: TObject);
    procedure mnuServiciosAEmpresasClick(Sender: TObject);
    procedure mnuMantRecalifEventosClick(Sender: TObject);
    procedure mnuPrestPorPresupClick(Sender: TObject);
    procedure mnuMantGrpTrabajo2Click(Sender: TObject);
    procedure mnuEnvioMailTipoPresClick(Sender: TObject);
    procedure mnuAuditoresPrestadorClick(Sender: TObject);
    procedure mnuMantenimientoTextosSMSClick(Sender: TObject);
    procedure mnuReportePLAClick(Sender: TObject);
    procedure mnuTableroControlClick(Sender: TObject);
    procedure mnuEgresosSemanalesClick(Sender: TObject);
    procedure mnuTableroControlAMFClick(Sender: TObject);
    procedure mnuReportePorAuditorClick(Sender: TObject);
  private
  public
    procedure ShowHistorias(ASiniestro, AOrden, ARecaida: Integer; ANumAuto: Integer = 0);
    procedure ShowRecaidas(ASiniestro, AOrden: Integer);
    procedure VolDetalle (pVolante: Integer);
  end;

  function IsInRange(AAccion: String; Monto: Currency): Boolean;

  procedure MostrarEstado(const AText: String);

var
  frmPrincipal: TfrmPrincipal;
  FromatoFecha: String;
  HistSql: String;

implementation

uses
  unDmPrincipal, unParteEvolutivo, unAutCarga, unAutSelPorSiniestro, unRecepcion, unManGrupoTrabajo, unLiqCarga,
  unPedidosInfo, unLiqAprob, unRepAutoriza, unLiqCargaGen, unLiqAutPago, unMantFirmantes,
  unMantDocumentos, unRepEvol, unManPrestador, unConsVol, unLiqListApro, unListPasSinEvol, unManRangos, AnsiSql,
  SqlFuncs, unLiquiImputPagos, unListDiasCaidos, unManPrestaciones, unCambGrupoTrabajo, unConsSin, unListOperProg,
  unListCostoPorCIE10, UnListPorEmpr, UnManTipoPrestador, UnManEspecialidades, unManTextosCartasDoc,
  unManTextosCartasDocTrab, unManAbandEventos, UnListConsPrest, UnListSiniSinAltaMed, CustomDlgs, UnManProtesisOrtesis,
  unListInternados, UnManSubPrestaciones, unManUnidadesMedicas, unManNomenclador, unManAuditores, UnManTiposTraslado,
  UnManSolicitantes, unReimprimirVolantes, unRecVolantes, UnManEmpresasVIP, UnManCIE10, UnSinSEvo,
  unFraEmpresa, unFraTrabajadorSIN, unfraPrestador, unListRecalGen,
  unListRecalPev, unListInternadosb, unPorTratamiento, unTrabExt, unCostosxSin, unRatificaAlta, unCostosxSiniestro,
  unConsultorio, unContTratSA, unCartaRechPr, unRequerimientosSRT, unWebMigracion,
  unSuspensionPlazos, unRecepPartes, unManCtbTablas, UnManCompaniasAseguradoras, unConfiguracionScoring,
  unManDerivacionVolantes, unElementosEnviados, unAgendaProtocolo, unLibretaDeDirecciones, unMoldeEnvioMail,
  unListCargaDiaria, unCITRIX, UnManMotivosNoCarga, unManCtbMotivosRechazo, unManCtbMotivosAnulacion,
  unSolicitudAuditoria, unImpoExpoWizard, unSegMedRecalif, unManMotivosDebito, unRecalificacionSRT,
  unManPracticasModulos, unListRecepcionPartes, unManTurnosMedicos,
  unCartaNotificacionAltas, unManCTC_TEXTOCARTA, unComunes, unManCAT_AREATEXTO, unManCTB_CODRE, 
  unListPresupuestos, unListSiniestrosConInternacion, unCambioCuitSin, unTelefonogramas,
  unRedPresAdministracionCartas, unManCFI_FIRMA, unSesion, unListAlquilerOrtopedia, unListRecuperoOrtopedia,
  unListStockOrtopedia, unListSeguimientoMedico, unConsFax, unFaxEnviados, unDocumentacion,
  unNovedades, unManMotAnulTraslados, unListHistoricoVolante,
  unSolicitarPresupuesto, unLiqAMPAprob, unLiqAMPAutPago, unLiqAMPCarga,
  unManMotAnulCitaciones, unCeseILT, unRemitosCartas,
  unSeguimientoCronicos, unManCuentaUsuario, unManSHT_HORARIOSTRASLADOS,
  unManSDT_DETALLETRANSPORTE, unCalendarioMediosDeTransporte, unVentanillaElectronica, 
  unMedicamentosCronicos, unManGruposPrestaciones, unPresupuestosCargados,
  unManCTB_CUBIC, unManResponsable, unGoogleMaps, unListIngresosSRT,
  unManCGI_GIS, unEnviosSRT, unManPresupuestoMensual,
  unListRecalSeguimiento, unManCPG_PLAZOGUARDA, unManCTA_TIPOACTIVOS,
  unClasificacionActivos, unManAuditoresVolantes, unCartaAuditConsultorio,
  unManMotivosDebitoAuditoria, unManUsuAvisoVol,
  unListExamenesPreocupacionales, unManTipoFacturas, unDevolucionFacturas,
  unManMotivosBajaSeguimiento, unFrmConsultaCarpetas,
  unAbandonoTratamiento, unReferentesDelegacion, unAgendaTelefonica,
  unMotivosBajaPrest, unPrestadorAuditoria, unManIIBBProvincias,
  unEventosAutorizacion, unManSiniestrosTopeados, unManMEP_EMPRESAPRESTADOR,
  unEmpresasPrestadoras, unServiciosAEmpresas, unManEventosReca,
  unManPrestadoresPorGTrabajo, unManPrestadorUsuario, unManGrupoTrabajo2,
  unControlGIS, unEnvioMailTipoPres, unAuditoresPrestador, unManCTS_TEXTOSMS,
  UnReportePLA, unEgresosSemanales, unUsuariosPorGrupo, unGruposPrestador,
  unReportePorAuditor;

{$R *.DFM}

Procedure MostrarEstado(const AText: String);
begin
  if AText = '*' then
    frmPrincipal.Sb_BarraDeEstado.SimpleText := 'Listo...'
  else
    frmPrincipal.Sb_BarraDeEstado.SimpleText := AText;
end;

procedure TfrmPrincipal.mnuMaximizarClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmPrincipal.mnuRestaurarClick(Sender: TObject);
begin
  WindowState := wsNormal;
end;

procedure TfrmPrincipal.mnuMinimizarClick(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

procedure TfrmPrincipal.mnuCascadaClick(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmPrincipal.mnuMosaicoHorizontalClick(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TfrmPrincipal.mnuMosaicoVerticalClick(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TfrmPrincipal.mnuOrganizarIconosClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Caption := Application.Title + ' - ' + DBLogin.Usuario;

//  mnuAbandonoTratamiento.Visible := Seguridad.Claves.IsActive('VerMenuAbandonoTratamiento_Nuevo');
 // mnuAbandonoTratamiento.Visible := ((Sesion.UserID = 'LPIPARO') or (Sesion.UserID = 'CAMARILLO')); // Nueva pantalla de Aband. Tratamiento (Migracion de Cartas doc) se hace visible solo con estos usuarios

  //Setea los Formatos de la Configuración Regional para la Aplicación
  Application.UpdateFormatSettings := False;
  CurrencyString    := '$';
  DecimalSeparator  := ',';
  ThousandSeparator := '.';
  DateSeparator     := '/';
  TimeSeparator     := ':';
  ShortTimeFormat   := 'H:mm:ss';
  LongTimeFormat    := 'H:mm:ss';
  ShortDateFormat   := 'dd/mm/yyyy';

  imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
  imgLogoMUTUAL.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_MUTUAL');
  imgLogoGob.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_PART_GOB');

  if IsCITRIX then
  begin
    JvBackground.Image.Picture.Assign(nil);
    JvCaptionButton.Visible := False;
    Color := clBtnFace;
  end;
end;

procedure TfrmPrincipal.DBLoginLogin(Sender: TObject);
begin
  Seguridad.Ejecutar;
  mnuClasificacionAct.Enabled := Seguridad.Activar(mnuClasificacionAct) or Sesion.EsJefe or (Sesion.Sector = 'COMPUTOS');
  mnuPlazosdeGuarda.Enabled := Seguridad.Activar(mnuPlazosdeGuarda) or Sesion.EsJefe or (Sesion.Sector = 'COMPUTOS');
  mnuTiposDeActivo.Enabled := Seguridad.Activar(mnuTiposDeActivo) or (Sesion.Sector = 'COMPUTOS');
end;

procedure TfrmPrincipal.mnuAutCargaClick(Sender: TObject);
begin
  TfrmAutCarga.Create(Self);
  mnuAutCarga.Enabled := False;
end;

procedure TfrmPrincipal.mnuAutAprobacionClick(Sender: TObject);
begin
  frmAutSelPorSiniestro := TfrmAutSelPorSiniestro.Create(Self);
  frmAutSelPorSiniestro.MenuItem := mnuAutAprobacion;
end;

procedure TfrmPrincipal.mnuLiquiRecepcionClick(Sender: TObject);
begin
  with TfrmRecepcion.Create(Self) do
  begin
    Visible := False;
    FormStyle := fsMDIChild;
  end;
  mnuLiquiRecepcion.Enabled := False;
end;

procedure TfrmPrincipal.mnuMantGrpTrabajoClick(Sender: TObject);
begin
  with TfrmManGrupoTrabajo.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuLiquiIngresoClick(Sender: TObject);
begin
  with TfrmLiquiCarga.Create(Self) do
  begin
    Visible := False;
    FormStyle := fsMDIChild;
  end;
  mnuLiquiIngreso.Enabled := False;
end;

procedure TfrmPrincipal.mnuPedInfoClick(Sender: TObject);
begin
  TfrmPedidosInfo.Create(Self);
  mnuPedInfo.Enabled := False;
end;

procedure TfrmPrincipal.mnuLiquiAprobacionClick(Sender: TObject);
begin
  TfrmLiquiAprob.Create(Self);
  mnuLiquiAprobacion.Enabled := False;
end;

procedure TfrmPrincipal.mnuMantPrestadoresClick(Sender: TObject);
begin
  Abrir(TfrmManPrestador, frmManPrestador, tmvMDIChild, mnuMantPrestadores);
end;

procedure TfrmPrincipal.mnuLiquiCarGenClick(Sender: TObject);
begin
  with TfrmLiquiCargaGen.Create(Self) do
  begin
    Visible := False;
    FormStyle := fsMDIChild;
  end;
  mnuLiquiCarGen.Enabled := False;
end;

procedure TfrmPrincipal.mnuLiquiAutPagoClick(Sender: TObject);
begin
  TfrmLiquiAutPago.Create(Self);
  mnuLiquiAutPago.Enabled := False;
end;

procedure TfrmPrincipal.mnuMantPrestacionesClick(Sender: TObject);
begin
  with TfrmManPrestaciones.Create(Self) do
  try
    Execute;              
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuFirmantesClick(Sender: TObject);
begin
  TfrmMantFirmantes.Create(Self);
  mnuFirmantes.Enabled := False;
end;

procedure TfrmPrincipal.mnuDocumentosClick(Sender: TObject);
begin
  with TfrmManDocumentos.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuInformeEvolClick(Sender: TObject);
begin
  mnuInformeEvol.Enabled := False;
  TfrmRepEvol.Create(Self);
end;

procedure TfrmPrincipal.mnuParteEvolutivoCargaClick(Sender: TObject);
begin
  frmParteEvolutivo.Free;
  frmParteEvolutivo := TfrmParteEvolutivo.Create(Self);
end;

procedure TfrmPrincipal.mnuPasientesInternadosClick(Sender: TObject);
begin
  TfrmListInternadosb.Create(Self);
  mnuPasientesInternados.Enabled := False;
end;

procedure TfrmPrincipal.mnuLiquiConsVolClick(Sender: TObject);
begin
  TfrmConsVol.Create(Self);
  mnuLiquiConsVol.Enabled := False;
end;

procedure TfrmPrincipal.VolDetalle(pVolante: Integer);
var
  sVista : String;
  DetAMP: Boolean;

  function EsVolanteAMP (idVolante: Integer): Boolean;
  begin
   Result := ExisteSql ('SELECT 1 ' +
                        '  FROM art.svo_volantes ' +
                        ' WHERE vo_volante = ' + SqlInteger(idVolante) +
                        '   AND vo_estado = ''PM'' ') or
             ExisteSql ('SELECT 1 ' +
                        '  FROM sif_itemfacturaamp ' +
                        ' WHERE if_idvolante = ' + SqlInteger(idVolante))
  end;

begin
  DetAMP := EsVolanteAMP(pVolante);

  sVista := 'MDF_DETALLEFAC';
  if DetAMP then
    sVista := 'MDF_DETALLEFACAMP';

  if not CheckView(sVista) then
  begin
    MsgBox('La vista "' + sVista + '"está en estado inválido o es inexistente.' + #13 +
           'Por ese motivo no se puede ver el detalle del volante.' + #13 + #13 +
           'Informe a Mantenimiento de este error.', MB_ICONERROR, 'Error del Sistema');
    Exit
  end;

  if not DetAMP then
  begin
    sdqDetalle.ParamByName('pVolante').AsInteger := pVolante;
    sdqDetalle.Open;
    if frmPrincipal.sdqDetalle.Eof then
      MsgBox('No se encontraron detalles que mostrar.')
    else
      dlgDetalle.Execute;
    sdqDetalle.Close
  end
  else begin
    sdqDetalleVolAMP.ParamByName('pVolante').AsInteger := pVolante;
    sdqDetalleVolAMP.Open;
    if frmPrincipal.sdqDetalleVolAMP.Eof then
      MsgBox('No se encontraron detalles que mostrar.')
    else
      dlgDetalleAMP.Execute;
    sdqDetalleVolAMP.Close
  end;
end;

procedure TfrmPrincipal.ShowHistorias(ASiniestro, AOrden, ARecaida: Integer; ANumAuto: Integer = 0);
begin
  HistSql :=
  	'SELECT au_siniestro, au_orden, au_recaida, au_numauto, au_fechasoli, tb_descripcion, ca_descripcion prestador,' +
    			' pr_descripcion prestacion, gp_nombre grupo_t, siniestro.get_usuariogestor(au_idexpediente) usugestor, ' +
          ' iif_char(au_estado, ''P'', au_observaciones, au_detalle) observaciones, au_usuapro, au_fechapro' +
     ' FROM sau_autorizaciones, ctb_tablas, cpr_prestador, mpr_prestaciones, mgp_gtrabajo' +
    ' WHERE iif_char(au_estado, ''P'', au_identifprestador, au_identifapro) = ca_identificador(+)' +
    	' AND iif_char(au_estado, ''P'', au_pressol, au_presapro) = pr_codigo(+)' +
      ' AND au_trabajo = gp_codigo(+)' +
      ' AND tb_clave = ''MUAUT''' +
      ' AND au_estado = tb_codigo(+)' +
      ' AND au_siniestro = ' + IntToStr(ASiniestro) +
      ' AND au_orden = ' + IntToStr(AOrden) +
      ' AND au_recaida = ' + IntToStr(ARecaida);
  OpenQuery(sdqHistoria, HistSql);

  if sdqHistoria.IsEmpty then
     MsgBox('No se encontraron datos que mostrar.', MB_ICONINFORMATION , 'Historia de Autorizaciones Médicas')
  else
  begin
     if ANumAuto > 0 then
       sdqHistoria.Locate('AU_NUMAUTO', ANumAuto, []);
    ldgHistoria.Execute;
  end;
  sdqHistoria.Close;
end;

procedure TfrmPrincipal.ShowRecaidas(ASiniestro, AOrden: Integer);
begin
  sdqRecaidas.ParamByName('siniestro').AsInteger := ASiniestro;
  sdqRecaidas.ParamByName('orden').AsInteger := AOrden;
  OpenQuery(sdqRecaidas);
  if sdqRecaidas.IsEmpty then
    MsgBox('No se encontraron datos que mostrar.', MB_ICONINFORMATION , 'Detalle de Recaidas')
  else
    ldgRecaidas.Execute;

  sdqRecaidas.Close;
end;

procedure TfrmPrincipal.ldgHistoriaTitleClick(Column: TColumn);
var
  Sql: String;
begin
  Sql := HistSql + ' ORDER BY ' + Column.Field.FieldName;
  if ldgHistoria.Tag = Column.Index then
  begin
    Sql := Sql + ' DESC' ;
    ldgHistoria.Tag := -1;
  end
  else
    ldgHistoria.Tag := Column.Index;

  sdqHistoria.Close;
  sdqHistoria.SQL.Text := Sql;
  sdqHistoria.Open;
end;

procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.mnuLiquiListAproClick(Sender: TObject);
begin
  TfrmLiqListApro.Create(Self);
  mnuLiquiListApro.Enabled := False;
end;

procedure TfrmPrincipal.mnuAuditoresClick(Sender: TObject);
begin
  with TfrmManAuditores.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuListPasSinEvoClick(Sender: TObject);
begin
  TfrmListPasSinEvol.Create(Self);
  mnuListPasSinEvo.Enabled := False;
end;

procedure TfrmPrincipal.mnuManRangosClick(Sender: TObject);
begin
  with TfrmManRangos.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

function IsInRange(AAccion: String; Monto: Currency): Boolean;
var
	sSql: String;
begin
	sSql :=
		'SELECT 1' +
     ' FROM DUAL' +
    ' WHERE AMEBPBA.IS_VALID_RANGE(:p1, :p2, :p3) IS NOT NULL';
	Result := ExisteSqlEx(sSql, [Sesion.LoginName, AAccion, SqlNumber(Monto)]);
end;

procedure TfrmPrincipal.mnuLiquiImputPagosClick(Sender: TObject);
begin
  TfrmLiquiImputPagos.Create(Self);
  mnuLiquiImputPagos.Enabled := False;
end;

procedure TfrmPrincipal.mnuListDiasCadosClick(Sender: TObject);
begin
  TfrmListDiasCaidos.Create(Self);
  mnuListDiasCados.Enabled := False;
end;

procedure TfrmPrincipal.mnuAutConsultaClick(Sender: TObject);
begin
  TqrpAutoriza.Create(Self);
  mnuAutConsulta.Enabled := False;
end;

procedure TfrmPrincipal.mnuCambGrupoTrabajoClick(Sender: TObject);
begin
  TfrmCambGrupoTrabajo.Create(Self);
  mnuCambGrupoTrabajo.Enabled := False;
end;

procedure TfrmPrincipal.mnuConsSinClick(Sender: TObject);
begin
  Abrir(TfrmConsSin, frmConsSin, tmvMDIChild, mnuConsSin);
end;

procedure TfrmPrincipal.mnuListOpProgClick(Sender: TObject);
begin
  mnuListOpProg.Enabled := False;
  TfrmListOperProg.Create(Self);
end;

procedure TfrmPrincipal.mnuCostosporCIE10Click(Sender: TObject);
begin
  mnuCostosporCIE10.Enabled := False;
  TfrmListCostoPorCIE10.Create(Self);
end;

procedure TfrmPrincipal.mnuListPorEmprClick(Sender: TObject);
begin
  TfrmListPorEmpr.Create(Self);
  mnuListPorEmpr.Enabled := False;
end;

procedure TfrmPrincipal.mnuConsultaPrestadoresClick(Sender: TObject);
begin
  Abrir(TfrmConsPrest, frmConsPrest, tmvMDIChild, mnuConsultaPrestadores);
end;

procedure TfrmPrincipal.mnuMantTipoPrestadorClick(Sender: TObject);
begin
  with TfrmManTipoPrestador.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuMantEspecialidadesClick(Sender: TObject);
begin
  with TfrmManEspecialidades.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuTextosdeCartasDocumentosClick(Sender: TObject);
begin
  with TfrmManTextosCartasDoc.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuTextosdeCartasDocumentosaTrabClick(Sender: TObject);
begin
  with TfrmManTextosCartasDocTrab.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuSegExpManEventosClick(Sender: TObject);
begin
  Abrir(TfrmManAbandEventos, frmManAbandEventos, tmvMDIChild, mnuSegExpManEventos);
end;

procedure TfrmPrincipal.mnuMantProtesisOrtesisClick(Sender: TObject);
begin
  with TfrmManProtesisOrtesis.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuListSiniSinAltaMedClick(Sender: TObject);
begin
  TfrmListSiniSinAltaMed.Create(Self);
  mnuListSiniSinAltaMed.Enabled := False;
end;

procedure TfrmPrincipal.mnuMantSubPrestacionesClick(Sender: TObject);
begin
  with TfrmManSubPrestaciones.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuMantTiposTrasladoClick(Sender: TObject);
begin
  with TfrmManTiposTraslado.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuMantSolicitantesClick(Sender: TObject);
begin
  with TfrmManSolicitantes.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManPrestUnMedicasClick(Sender: TObject);
begin
  with TfrmManUnidadesMedicas.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuMantEmpresasVIPClick(Sender: TObject);
begin
  TfrmManEmpresasVIP.Create(Self);
  mnuMantEmpresasVIP.Enabled := False;
end;

procedure TfrmPrincipal.mnuMantenimientoTextosSMSClick(Sender: TObject);
begin
  Abrir(TfrmManCTS_TEXTOSMS, frmManCTS_TEXTOSMS, tmvMDIChild, mnuMantenimientoTextosSMS);
end;

procedure TfrmPrincipal.mnuMantCie10Click(Sender: TObject);
begin
  TfrmManCIE10.Create(Self);
  mnuMantCIE10.Enabled := False;
end;

procedure TfrmPrincipal.mnuReimpVolantesClick(Sender: TObject);
begin
  TfrmReimprimirVolante.Create(Self);
end;

procedure TfrmPrincipal.mrnLiqRecepVolantesClick(Sender: TObject);
begin
  with TfrmRecVolantes.Create(Self) do
  begin
    FormStyle    := fsMDIChild;
    SectorOrigen := soInterior;
  end;
  mrnLiqRecepVolantes.Enabled := False;
end;

procedure TfrmPrincipal.MnuSinSEvoClick(Sender: TObject);
begin
  Abrir(TfrmSinSEvo, frmSinSEvo, tmvMDIChild, MnuSinSEvo);
end;

procedure TfrmPrincipal.mnuListRecalGenClick(Sender: TObject);
begin
  Abrir(TfrmListrecalGen, frmListrecalGen, tmvMDIChild, mnuListRecalGen);
end;

procedure TfrmPrincipal.mnuListRecalEvenClick(Sender: TObject);
begin
  Abrir(TfrmListrecalPev, frmListrecalPev, tmvMDIChild, mnuListRecalEven);
end;

procedure TfrmPrincipal.mnuPorTratamientoClick(Sender: TObject);
begin
  Abrir(TfrmPorTratamiento, frmPorTratamiento, tmvMDIChild, mnuPorTratamiento);
end;

procedure TfrmPrincipal.mnuViajesalExteriorClick(Sender: TObject);
begin
  Abrir(TfrmTrabExt, frmTrabExt, tmvMDIChild, mnuViajesalExterior);
end;

procedure TfrmPrincipal.mnuCostosClick(Sender: TObject);
begin
  Abrir(TfrmCostosxSin, frmCostosxSin, tmvMDIChild, mnuCostos);
end;

procedure TfrmPrincipal.mnuRatifAltaClick(Sender: TObject);
begin
  mnuRatifAlta.Enabled := False;
  TfrmRatificaAlta.Create(Self);
end;

procedure TfrmPrincipal.mnuCostosporSiniestroClick(Sender: TObject);
begin
  Abrir(TfrmCostosxSiniestro, frmCostosxSiniestro, tmvMDIChild, mnuCostosporSiniestro);
end;

procedure TfrmPrincipal.mnuManejodeConsultorioClick(Sender: TObject);
begin
  Abrir(TfrmConsultorio, frmConsultorio, tmvMDIChild, mnuManejodeConsultorio);
end;

procedure TfrmPrincipal.MnuManTurnosMedicosClick(Sender: TObject);
begin
  Abrir(TfrmManTurnosMedicos, frmManTurnosMedicos, tmvMDIChild, MnuManTurnosMedicos);
end;

procedure TfrmPrincipal.mnuContinaTratamientosinaltaClick(Sender: TObject);
begin
  Abrir(TfrmContTratSA, frmContTratSA, tmvMDIChild, mnuContinaTratamientosinalta);
end;

procedure TfrmPrincipal.mnuCartaRechPrClick(Sender: TObject);
begin
  Abrir(TfrmCartaRechPr, frmCartaRechPr, tmvMDIChild, mnuCartaRechPr);
end;

procedure TfrmPrincipal.mnuReportePLAClick(Sender: TObject);
begin
  Abrir(TfrmReportePLA, frmReportePLA, tmvMDIChild, mnuReportePLA);
end;

procedure TfrmPrincipal.mnuReportePorAuditorClick(Sender: TObject);
begin
  Abrir(TfrmReportePorAuditor, frmReportePorAuditor, tmvMDIChild, mnuReportePorAuditor);
end;

procedure TfrmPrincipal.mnuRequerimientosSRTClick(Sender: TObject);
begin
  Abrir(TfrmRequerimientosSRT, frmRequerimientosSRT, tmvMDIChild, mnuRequerimientosSRT);
end;

procedure TfrmPrincipal.mnuLstWebMigracionClick(Sender: TObject);
begin
  mnuLstWebMigracion.Enabled := False;
  TfrmWebMigracion.Create(Self);
end;

procedure TfrmPrincipal.mnuLstWebRecepcionParteClick(Sender: TObject);
begin
  TfrmPartesReceptadas.Create(Self);
  mnuLstWebRecepcionParte.Enabled := False;
end;

procedure TfrmPrincipal.mnuCompaniasAseguradorasClick(Sender: TObject);
begin
  with TfrmManCompaniasAseguradoras.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuScoringClick(Sender: TObject);
begin
  with TfrmConfiguracionScoring.Create(Self) do
    Show;
end;

procedure TfrmPrincipal.mnuDerivacionVolantesClick(Sender: TObject);
begin
  with TfrmManDerivacionVolantes.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.JvCaptionButtonClick(Sender: TObject);
begin
  JvTrayIcon.Active := True;
  JvTrayIcon.HideApplication;
end;

procedure TfrmPrincipal.JvTrayIconDblClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  JvTrayIcon.ShowApplication;
  JvTrayIcon.Active := False;
end;

procedure TfrmPrincipal.mnuEgresosSemanalesClick(Sender: TObject);
begin
  Abrir(TfrmEgresosSemanales, frmEgresosSemanales, tmvMDIChild, mnuEgresosSemanales);
end;

procedure TfrmPrincipal.mnuElementosEnviadosClick(Sender: TObject);
begin
  Abrir(TfrmElementosEnviados, frmElementosEnviados, tmvMDIChild, mnuElementosEnviados);
end;

procedure TfrmPrincipal.mnuAgendaClick(Sender: TObject);
begin
  frmAgenda := TfrmAgenda.Create(Self);
  frmAgenda.MenuItem := mnuAgenda;
  frmAgenda.FormStyle := fsMDIChild;
  mnuAgenda.Enabled   := False;
end;

procedure TfrmPrincipal.mnuEnviarCorreoClick(Sender: TObject);
begin
  EnviarMailBD('', '', [oAlwaysShowDialog, oAutoFirma]);
end;

procedure TfrmPrincipal.mnuLibretaDeDireccionesClick(Sender: TObject);
begin
  with TfrmLibretaDeDirecciones.Create(Self) do
  begin
    MenuItem := mnuLibretaDeDirecciones;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuCargaDiariaClick(Sender: TObject);
begin
  Abrir(TfrmListCargaDiaria, frmListCargaDiaria, tmvMDIChild, mnuCargaDiaria);
end;

procedure TfrmPrincipal.MnuMotivosdenoCargaClick(Sender: TObject);
begin
  with TfrmManMotivosNoCarga.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuRecepcionPartesGeneralesClick(Sender: TObject);
begin
  mnuRecepcionPartesGenerales.Enabled := False;
  TfrmRecepcionPartesGrales.Create(Self);
end;

procedure TfrmPrincipal.MnuMotivosRechazoClick(Sender: TObject);
begin
  with TfrmManCtbMotivosRechazo.Create(Self) do
  begin
    MenuItem := MnuMotivosRechazo;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.MnuMotivosAnulacionClick(Sender: TObject);
begin
  with TfrmManCtbMotivosAnulacion.Create(Self) do
  begin
    MenuItem := MnuMotivosAnulacion;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuSeguimientoAuditoriasMedicasClick(Sender: TObject);
begin
  Abrir(TfrmSolicitudAuditoria, frmSolicitudAuditoria, tmvMDIChild, mnuSeguimientoAuditoriasMedicas);
end;

procedure TfrmPrincipal.ImpoExpo(Sender: TObject);
begin
  ImpoExpoWizard(TMenuItem(Sender).Hint);
end;

procedure TfrmPrincipal.MnuMotivosDebitoClick(Sender: TObject);
begin
  with TfrmManMotivosDebito.Create(Self) do
  begin
     MenuItem := MnuMotivosDebito;
     FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.MnuSegMedRecalificacionClick(Sender: TObject);
begin
  Abrir(TFrmSegMedRecalif, FrmSegMedRecalif, tmvMDIChild, MnuSegMedRecalificacion);
end;

procedure TfrmPrincipal.MnuRecalificacionSRTClick(Sender: TObject);
begin
  Abrir(TFrmRecalificacionSRT, FrmRecalificacionSRT, tmvMDIChild, MnuRecalificacionSRT);
end;

procedure TfrmPrincipal.mnuManPracticasModulosClick(Sender: TObject);
begin
  with TfrmManPracticasModulos.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuImpresoraConfigurarClick(Sender: TObject);
begin
  PrintDialog.Execute;
end;

procedure TfrmPrincipal.mnuListRecepcionPartesMailClick(Sender: TObject);
begin
  Abrir(TfrmListRecepcionPartes, frmListRecepcionPartes, tmvMDIChild, mnuListRecepcionPartesMail);
end;

procedure TfrmPrincipal.mnuNotificacionAltasPrClick(Sender: TObject);
begin
  Abrir(TfrmCartaNotificacionAltas, frmCartaNotificacionAltas, tmvMDIChild, mnuNotificacionAltasPr);
end;

procedure TfrmPrincipal.mnuManTextosCartasClick(Sender: TObject);
begin
  Abrir(TfrmManCTC_TEXTOCARTA, frmManCTC_TEXTOCARTA, tmvMDIChild, mnuManTextosCartas);
  if (Sesion.Sector = 'PRESDIN') then
    frmManCTC_TEXTOCARTA.Area := aDinerarias
  else
    frmManCTC_TEXTOCARTA.Area := aMedSiniIncReca;
end;

procedure TfrmPrincipal.mnuManAreasCartasDocClick(Sender: TObject);
begin
  Abrir(TfrmManCAT_AREATEXTO, frmManCAT_AREATEXTO, tmvMDIChild, mnuManAreasCartasDoc);
  if (Sesion.Sector = 'PRESDIN') then
    frmManCAT_AREATEXTO.Area := aDinerarias
  else
    frmManCAT_AREATEXTO.Area := aMedSiniIncReca;
end;

procedure TfrmPrincipal.MnuManCodRecepcionClick(Sender: TObject);
begin
  Abrir(TfrmManCTB_CODRE, frmManCTB_CODRE, tmvMDIChild, MnuManCodRecepcion);
end;

procedure TfrmPrincipal.mnuSuspensionPlazosClick(Sender: TObject);
begin
  Abrir(TfrmSuspensionPlazos, frmSuspensionPlazos, tmvMDIChild, mnuSuspensionPlazos);
end;

procedure TfrmPrincipal.mnuTableroControlAMFClick(Sender: TObject);
begin
  ShellExecute(0, nil, PChar('http://nthouse.artprov.com.ar:7778/portal/page?_pageid=33,28962,33_29000&_dad=portal&_schema=PORTAL'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.mnuTableroControlClick(Sender: TObject);
begin
  ShellExecute(0, nil, PChar('http://nthouse.artprov.com.ar:7778/portal/page?_pageid=33,28782,33_28941&_dad=portal&_schema=PORTAL'), '', '', SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.mnuConsultaPresupuestosClick(Sender: TObject);
begin
  Abrir(TfrmListPresupuestos, frmListPresupuestos, tmvMDIChild, mnuConsultaPresupuestos);
end;

procedure TfrmPrincipal.mnuListSiniestrosConInternacionClick(Sender: TObject);
begin
  Abrir(TfrmListSiniestrosConInternacion, frmListSiniestrosConInternacion,
        tmvMDIChild, mnuListSiniestrosConInternacion);
end;

procedure TfrmPrincipal.MnuCambioCuitSinClick(Sender: TObject);
begin
  Abrir(TfrmCambioCuitSin, frmCambioCuitSin, tmvMDIChild, MnuCambioCuitSin);
end;

procedure TfrmPrincipal.MnuTelefonogramasClick(Sender: TObject);
begin
  Abrir(TfrmTelefonogramas, frmTelefonogramas, tmvMDIChild, MnuTelefonogramas);
end;

procedure TfrmPrincipal.mnuAdministracionCartasClick(Sender: TObject);
begin
  mnuAdministracionCartas.Enabled := False;
  with TfrmRedPresAdministracionCartas.Create(Self) do
  begin
    Area      := AREA_SIN +  ',' + AREA_MED + ',' +
                 AREA_INC + ',' + AREA_RECA;
    MenuItem  := mnuAdministracionCartas;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuManFirmantesCartasClick(Sender: TObject);
begin
  Abrir(TfrmManCFI_FIRMA, frmManCFI_FIRMA, tmvMDIChild, mnuManFirmantesCartas);
  if (Sesion.Sector = 'PRESDIN') then
    frmManCFI_FIRMA.Area := aDinerarias
  else
    frmManCFI_FIRMA.Area := aMedSiniIncReca;
end;

procedure TfrmPrincipal.mnuDigitalizacionClick(Sender: TObject);
begin
  Abrir(TfrmConsultaCarpetas, frmConsultaCarpetas, tmvMDIChild, mnuDigitalizacion);
end;

procedure TfrmPrincipal.mnuLiqRecepcionAuditoriaClick(Sender: TObject);
begin
  with TfrmRecVolantes.Create(Self) do
  begin
    FormStyle    := fsMDIChild;
    SectorOrigen := soAuditoria;
  end;
  mnuLiqRecepcionAuditoria.Enabled := False;
end;

procedure TfrmPrincipal.mnuNomencladorCargaManualClick(Sender: TObject);
begin
  TfrmManNomenclador.Create(Self);
  mnuNomencladorCargaManual.Enabled := False;
end;

procedure TfrmPrincipal.mnuLiqRecepOrtopediaClick(Sender: TObject);
begin
  with TfrmRecVolantes.Create(Self) do
  begin
    FormStyle    := fsMDIChild;
    SectorOrigen := soOrtopedia;
  end;
  mnuLiqRecepOrtopedia.Enabled := False;
end;

procedure TfrmPrincipal.mnuLiqRecepLiquidacionesClick(Sender: TObject);
begin
  with TfrmRecVolantes.Create(Self) do
  begin
    FormStyle    := fsMDIChild;
    SectorOrigen := soLiquidaciones;
  end;
  mnuLiqRecepLiquidaciones.Enabled := False;
end;

procedure TfrmPrincipal.mnuConsAlquileresOrtClick(Sender: TObject);
begin
  Abrir(TfrmListAlquilerOrtopedia, frmListAlquilerOrtopedia, tmvMDIChild, mnuConsAlquileresOrt);
end;

procedure TfrmPrincipal.mnuConsRecuperoOrtClick(Sender: TObject);
begin
  Abrir(TfrmListRecuperoOrtopedia, frmListRecuperoOrtopedia, tmvMDIChild, mnuConsRecuperoOrt);
end;

procedure TfrmPrincipal.mnuConsStockOrtClick(Sender: TObject);
begin
  Abrir(TfrmListStockOrtopedia, frmListStockOrtopedia, tmvMDIChild, mnuConsStockOrt);
end;

procedure TfrmPrincipal.mnuListSeguimientoMedicoClick(Sender: TObject);
begin
  with TfrmListSeguimientoMedico.Create(Self) do
  begin
     MenuItem  := mnuListSeguimientoMedico;
     FormStyle := fsMDIChild;
  end;
  mnuListSeguimientoMedico.Enabled := False;
end;

procedure TfrmPrincipal.mnuBandejadeEntradaClick(Sender: TObject);
begin
  Abrir(TfrmConsFax, frmConsFax, tmvMDIChild, mnuBandejadeEntrada);
end;

procedure TfrmPrincipal.mnuElementosEnviadosFaxClick(Sender: TObject);
begin
  Abrir(TfrmFaxEnviados, frmFaxEnviados, tmvMDIChild, mnuElementosEnviadosFax);
end;

procedure TfrmPrincipal.mnuDocumentacionClick(Sender: TObject);
begin
	Abrir(TfrmDocumentacion, frmDocumentacion, tmvMDIChild, mnuDocumentacion);
end;

procedure TfrmPrincipal.mnuNovedadesDelSistemaClick(Sender: TObject);
begin
  MostrarNovedades(True);
end;

procedure TfrmPrincipal.MnuMotAnulTrasladosClick(Sender: TObject);
begin
  with TfrmManMotAnulTraslados.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuListHistoricoVolantesClick(Sender: TObject);
begin
  Abrir(TfrmListHistoricoVolante, frmListHistoricoVolante, tmvMDIChild, mnuListHistoricoVolantes);
end;

procedure TfrmPrincipal.mnuSolicitudDePresupuestosAMPClick(Sender: TObject);
begin
  Abrir(TfrmSolicitarPresupuesto, frmSolicitarPresupuesto, tmvMDIChild, mnuSolicitudDePresupuestosAMP);
end;

procedure TfrmPrincipal.mnuLiqAMPCargaClick(Sender: TObject);
begin
  Abrir(TfrmLiqAMPCarga, frmLiqAMPCarga, tmvMDIChild, mnuLiqAMPCarga);
end;

procedure TfrmPrincipal.mnuLiqAMPAprobClick(Sender: TObject);
begin
  Abrir(TfrmLiqAMPAprob, frmLiqAMPAprob, tmvMDIChild, mnuLiqAMPAprob);
end;

procedure TfrmPrincipal.mnuLiqAMPAutPagoClick(Sender: TObject);
begin
  Abrir(TfrmLiqAMPAutPago, frmLiqAMPAutPago, tmvMDIChild, mnuLiqAMPAutPago);
end;

procedure TfrmPrincipal.mnuManMotAnulCitacionesClick(Sender: TObject);
begin
  with TfrmManMotAnulCitaciones.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuCeseILTClick(Sender: TObject);
begin
  Abrir(TfrmCeseILT, frmCeseILT, tmvMDIChild, mnuCeseILT);
end;

procedure TfrmPrincipal.MnuRemitosCartasClick(Sender: TObject);
begin
  Abrir(TfrmRemitosCartas, frmRemitosCartas, tmvMDIChild, MnuRemitosCartas);
end;

procedure TfrmPrincipal.mnuSegCronicosClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoCronicos, frmSeguimientoCronicos, tmvMDIChild, mnuSegCronicos);
end;

procedure TfrmPrincipal.mnuManCuentasUsuariosClick(Sender: TObject);
begin
  with TfrmManCuentaUsuario.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuMediosdeTransporteClick(Sender: TObject);
begin
  Abrir(TfrmManSDT_DETALLETRANSPORTE, frmManSDT_DETALLETRANSPORTE, tmvMDIChild, mnuMediosdeTransporte);
end;

procedure TfrmPrincipal.mnuConfAgendaDeLosMediosDeTransporteClick(Sender: TObject);
begin
  Abrir(TfrmManSHT_HORARIOSTRASLADOS, frmManSHT_HORARIOSTRASLADOS, tmvMDIChild, mnuConfAgendaDeLosMediosDeTransporte);
end;

procedure TfrmPrincipal.mnuAgendaDeLosMediosDeTransporteClick(Sender: TObject);
begin
  Abrir(TfrmCalendarioMediosDeTransporte, frmCalendarioMediosDeTransporte, tmvMDIChild, mnuAgendaDeLosMediosDeTransporte);
end;

procedure TfrmPrincipal.mnuClasificacionActClick(Sender: TObject);
begin
  Abrir(TfrmClasificacionActivos, frmClasificacionActivos, tmvMDIChild, mnuClasificacionAct);
end;

procedure TfrmPrincipal.mnuVentanillaElectronicaClick(Sender: TObject);
begin
  Abrir(TfrmVentanillaElectronica, frmVentanillaElectronica, tmvMDIChild, mnuVentanillaElectronica);
end;

procedure TfrmPrincipal.mnuUsuariosPrestadorClick(Sender: TObject);
begin
  Abrir(TfrmManPrestadorUsuario, frmManPrestadorUsuario, tmvMDIChild, mnuUsuariosPrestador);
end;

procedure TfrmPrincipal.mnuMedicamentosCronicosClick(Sender: TObject);
begin
  Abrir(TfrmMedicamentosCronicos, frmMedicamentosCronicos, tmvMDIChild, mnuMedicamentosCronicos);
end;

procedure TfrmPrincipal.mnuManGruposPrestacionesClick(Sender: TObject);
begin
  Abrir(TfrmManGruposPrestaciones, frmManGruposPrestaciones, tmvMDIChild, mnuManGruposPrestaciones);
end;

procedure TfrmPrincipal.mnuConsultaDePresupuestosySolicitudesClick(Sender: TObject);
begin
  Abrir(TfrmPresupuestosCargados, frmPresupuestosCargados, tmvMDIChild, mnuConsultaDePresupuestosySolicitudes);
end;

procedure TfrmPrincipal.mnuLugarCitacionClick(Sender: TObject);
begin
  Abrir(TfrmManCTB_CUBIC, frmManCTB_CUBIC, tmvMDIChild, mnuLugarCitacion);
end;

procedure TfrmPrincipal.mnuResponsableClick(Sender: TObject);
begin
  with TfrmManResponsable.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuGISClick(Sender: TObject);
begin
  Abrir(TfrmGoogleMaps, frmGoogleMaps, tmvMDIChild, mnuGIS);
end;

procedure TfrmPrincipal.mnuIngresosSRTClick(Sender: TObject);
begin
  Abrir(TFrmIngresosSRT, FrmIngresosSRT, tmvMDIChild, MnuIngresosSRT);
end;

procedure TfrmPrincipal.mnuMonitoreoGISClick(Sender: TObject);
begin
//  Abrir(TfrmManCGI_GIS, frmManCGI_GIS, tmvMDIChild, mnuManejodeExcepciones);
  Abrir(TfrmControlGIS, frmControlGIS, tmvMDIChild, mnuMonitoreoGIS);
end;

procedure TfrmPrincipal.mnuEnviosSRTClick(Sender: TObject);
begin
  Abrir(TfrmEnviosSRT, frmEnviosSRT, tmvMDIChild, mnuEnviosSRT);
end;

procedure TfrmPrincipal.mnuManPresupuestoMensualClick(Sender: TObject);
begin
  Abrir(TfrmManPresupuestoMensual, frmManPresupuestoMensual, tmvMDIChild, mnuManPresupuestoMensual);
end;

procedure TfrmPrincipal.mnuPlazosdeGuardaClick(Sender: TObject);
begin
  Abrir(TfrmManCPG_PLAZOGUARDA, frmManCPG_PLAZOGUARDA, tmvMDIChild, mnuPlazosdeGuarda);
end;

procedure TfrmPrincipal.mnuSeguimientosClick(Sender: TObject);        // TK 11368
begin
  Abrir(TFrmListRecalSeguimiento, FrmListRecalSeguimiento, tmvMDIChild, MnuSeguimientos);
end;

procedure TfrmPrincipal.mnuTiposDeActivoClick(Sender: TObject);
begin
  Abrir(TfrmManCTA_TIPOACTIVOS, frmManCTA_TIPOACTIVOS, tmvMDIChild, mnuTiposDeActivo);
end;

procedure TfrmPrincipal.mnuManAuditoresVolantesClick(Sender: TObject);  // TK 11136
begin
  with TfrmManAuditoresVolantes.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuAuditConsultorioClick(Sender: TObject);   // TK 16982
begin
  Abrir(TfrmCartaAuditConsultorio, frmCartaAuditConsultorio, tmvMDIChild, mnuAuditConsultorio);
end;

procedure TfrmPrincipal.mnuManMotivosDebitosAuditClick(Sender: TObject);
begin
  with TfrmManMotivoDebitoAuditoria.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManUsuAvisoVolClick(Sender: TObject);    // TK 24248
begin
  with TfrmManUsuAvisoVol.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuListExamenesPreocupacionalesClick(Sender: TObject);   // TK 23169
begin
  Abrir(TfrmListExamenesPreocupacionales, frmListExamenesPreocupacionales,
        tmvMDIChild, mnuListExamenesPreocupacionales);
end;

procedure TfrmPrincipal.mnuManTipoDevolFacturasClick(Sender: TObject);
begin
  with TfrmManTipoFacturas.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuDevolucionFacturasClick(Sender: TObject);
begin
  Abrir(TfrmDevolucionFacturas, frmDevolucionFacturas, tmvMDIChild, mnuDevolucionFacturas);
end;

procedure TfrmPrincipal.mnuManMotivosBajaSeguimientoMedClick(Sender: TObject);
begin
  Abrir(TfrmMotivosBajaSeguimientos, frmMotivosBajaSeguimientos, tmvMDIChild, mnuManMotivosBajaSeguimientoMed);
end;

procedure TfrmPrincipal.mnuAbandonoTratamientoClick(Sender: TObject);
begin
  Abrir(TfrmAbandonoTratamiento, frmAbandonoTratamiento, tmvMDIChild, mnuAbandonoTratamiento);     // Migracion Cartas Doc
end;

procedure TfrmPrincipal.mnuAgendaTelefonicaClick(Sender: TObject);
begin
  Abrir(TfrmAgendaTelefonica, frmAgendaTelefonica, tmvMDIChild, mnuAgendaTelefonica);
end;

procedure TfrmPrincipal.mnuRefDelegacionesClick(Sender: TObject);
begin
  Abrir(TfrmReferentesDel, frmReferentesDel, tmvMDIChild, mnuRefDelegaciones);
end;

procedure TfrmPrincipal.mnuMotivosBajaPrestClick(Sender: TObject);
begin
  Abrir(TfrmMotivosBajaPrest, frmMotivosBajaPrest, tmvMDIChild, mnuMotivosBajaPrest);
end;

procedure TfrmPrincipal.mnuPrestadoresAuditoriaClick(Sender: TObject);
begin
  Abrir(TfrmPrestadorAuditoria, frmPrestadorAuditoria, tmvMDIChild, mnuPrestadoresAuditoria);
end;

procedure TfrmPrincipal.mnuIIBBProvinciasClick(Sender: TObject);
begin
  Abrir(TfrmIIBBProvincias, frmIIBBProvincias, tmvMDIChild, mnuIIBBProvincias);
end;

procedure TfrmPrincipal.mnuEventosAutorizacionClick(Sender: TObject);
begin
  Abrir(TfrmEventosAutorizacion, frmEventosAutorizacion, tmvMDIChild, mnuEventosAutorizacion);
end;

procedure TfrmPrincipal.mnuPrestadorPreferencialClick(Sender: TObject);
begin
  Abrir(TfrmManMEP_EMPRESAPRESTADOR, frmManMEP_EMPRESAPRESTADOR, tmvMDIChild, mnuPrestadorPreferencial);
end;

procedure TfrmPrincipal.mnuSiniestrosTopeadosClick(Sender: TObject);
begin
  Abrir(TfrmManSiniestrosTopeados, frmManSiniestrosTopeados, tmvMDIChild, mnuSiniestrosTopeados);
end;

procedure TfrmPrincipal.mnuEmpresasPrestadorasClick(Sender: TObject);
begin
  Abrir(TfrmEmpresasPrestadoras, frmEmpresasPrestadoras, tmvMDIChild, mnuEmpresasPrestadoras);
end;

procedure TfrmPrincipal.mnuServiciosAEmpresasClick(Sender: TObject);
begin
  Abrir(TfrmServiciosAEmpresas, frmServiciosAEmpresas, tmvMDIChild, mnuServiciosAEmpresas);
end;

procedure TfrmPrincipal.mnuMantRecalifEventosClick(Sender: TObject);
begin
  Abrir(TfrmManEventosReca, frmManEventosReca, tmvMDIChild, mnuMantRecalifEventos);
end;

procedure TfrmPrincipal.mnuPrestPorPresupClick(Sender: TObject);
begin
  Abrir(TfrmPrestadoresPorGtrabajo, frmPrestadoresPorGtrabajo, tmvMDIChild, mnuPrestPorPresup);
end;

procedure TfrmPrincipal.mnuMantGrpTrabajo2Click(Sender: TObject);
begin
  Abrir(TfrmManGrupoTrabajo2, frmManGrupoTrabajo2, tmvMDIChild, mnuMantGrpTrabajo2);    // nuevo
end;

procedure TfrmPrincipal.mnuEnvioMailTipoPresClick(Sender: TObject);
begin
  Abrir(TfrmEnvioMailTipoPres, frmEnvioMailTipoPres, tmvMDIChild, mnuEnvioMailTipoPres);
end;

procedure TfrmPrincipal.mnuAuditoresPrestadorClick(Sender: TObject);
begin
  Abrir(TfrmAuditoresPorPrestador, frmAuditoresPorPrestador, tmvMDIChild, mnuAuditoresPrestador);
end;

end.
