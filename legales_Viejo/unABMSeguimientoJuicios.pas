unit unABMSeguimientoJuicios;

interface

uses
  {$IFNDEF VER150}
  RxPlacemnt, RxCurrEdit, RxToolEdit, JvComponentBase,
  {$ELSE}
  Placemnt, CurrEdit, ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ShortCutControl,
  artSeguridad, PeriodoPicker, unfraUsuarios, StdCtrls, DateComboBox, unDMLegales, unfraCtbTablas,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unArtFrame, unFraCodigoDescripcion, Mask, PatternEdit, IntEdit,
  ComCtrls, ToolWin, Buttons, SinEdit, CardinalEdit, Grids, DBGrids, CheckPanel, ExtCtrls, FormPanel, ArtComboBox,
  DateTimeEditors, ImgList, JvTFDays, JvComponent, JvTFManager, JvTFAlarm, JvTFMonths, JvExControls, JvTFGlance,
  JvTFWeeks, jpeg, db, SDEngine, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraTrabajador, ArtDbGrid,
  RxMemDS, JvCalendar, JvExExtCtrls, JvNetscapeSplitter, unfraAbogadosLegales, JvMemoryDataset, unSesion,
  unFraReclamoSentencia, unfraJuzgados, Menus, DBClient, JvTMTimeLine, unFraPuntosRevision, VCLExtra, RXDBCtrl, CUIT,
  unEspera, unfraCodigoDescripcionExt, RxRichEd, JvEnterTab, General, QueryPrint, unGrids,
  SortDlg, JvExStdCtrls, JvEdit, JvValidateEdit,ExComboBox, AdvEdit, unArt;

const
  CALCULANDORESERVADECAPITAL    = 0;
  CALCULANDORESERVADEHONORARIOS = 1;
  TIPO_EVENTO_CONTESTA_DEMANDA  = 102;

  TipoCalculoReserva: Array[0..1] of Integer = (CALCULANDORESERVADECAPITAL, CALCULANDORESERVADEHONORARIOS);

type
  TVistaTarea = (vtDiaria, vtSemanal, vtMensual);

  TFormulasReserva = record
     FormulaReservaCapital   : String;
     FormulaReservaHonorarios: String;
  end;

  TApptTareas = Class(TJvTFAppt)
  private
    FDescripcionResultado: String;
    FCompletado: Boolean;
    FTipoTarea: Integer;
    FTipoHecho: Integer;
  published
    property DescripcionResultado: String read FDescripcionResultado write FDescripcionResultado;
    property Completado: Boolean read FCompletado write FCompletado;
    property TipoTarea: Integer read FTipoTarea write FTipoTarea;
    property TipoHecho: Integer read FTipoHecho write FTipoHecho;
  end;                                   

  TJvTFApptClass = class of TJvTFAppt;

  TfrmAdminstracionJuicio = class(TForm)
    tbGestionDeuda: TToolBar;
    tbGuardar: TToolButton;
    tbSeparador: TToolButton;
    tbFijarSentencia: TToolButton;
    tbSeparador2: TToolButton;
    tbImprimir: TToolButton;
    tbSalir: TToolButton;
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    ShortCutControl: TShortCutControl;
    odAbrirArchivo: TOpenDialog;
    tbSeparador0: TToolButton;
    AlarmaEventos: TJvTFAlarm;
    Schedule: TJvTFScheduleManager;
    sdqIntervencionesAnteriores: TSDQuery;
    sdqFuncionariosJuzgado: TSDQuery;
    tbReasignarAbogado: TToolButton;
    imCustom: TImageList;
    sdqUpdApptQuery: TSDUpdateSQL;
    sdqGetApptQuery: TSDQuery;
    iStates: TImageList;
    tbSeparador3: TToolButton;
    tbVerPagosPendientes: TToolButton;
    pnCabecera: TPanel;
    sdqEventoJuicioEnTramite: TSDQuery;
    dsEventoJuicioEnTramite: TDataSource;
    sdqOrigenDemanda: TSDQuery;
    dsOrigenDemanda: TDataSource;
    sdqTareas: TSDQuery;
    sdqPericiasJuicios: TSDQuery;
    dsPericiasJuicios: TDataSource;
    sdqPagoLegal: TSDQuery;
    dsPagoLegal: TDataSource;
    pnDetalle: TPanel;
    pgDetallesJuicio: TPageControl;
    tbOrigenSiniestro: TTabSheet;
    cbOrigenDemanda: TCoolBar;
    tbOrigenDemanda: TToolBar;
    tbNuevoOrigenDemanda: TToolButton;
    tbEdicionOrigenDemanda: TToolButton;
    tbBajaOrigenDemanda: TToolButton;
    tbOrigenDemandaSeparador1: TToolButton;
    tbImprimirOrigenDemanda: TToolButton;
    tsReclamos: TTabSheet;
    fpReclamo: TFormPanel;
    lblReclamo: TLabel;
    bvSeparadorBotonesReclamos: TBevel;
    lblImporteDemandado: TLabel;
    lblPorcentajeIncapacidadDemanda: TLabel;
    lblPorcentaje: TLabel;
    tbReclamo: TToolBar;
    tbEditarReclamos: TToolButton;
    tbExplorarReclamos: TToolButton;
    btnAceptarReclamo: TButton;
    btnCancelarReclamo: TButton;
    edtImporteDemandadoReclamo: TCurrencyEdit;
    edPorcentajeIncapacidadDemanda: TCurrencyEdit;
    fraReclamoSentenciaReclamo: TfraReclamoSentencia;
    tbEventosSeguimiento: TTabSheet;
    cbEventos: TCoolBar;
    tbrEventos: TToolBar;
    tbNuevoEvento: TToolButton;
    tbModificarEvento: TToolButton;
    tbEliminarEvento: TToolButton;
    tbEventosSeparador: TToolButton;
    tbAccImprimir: TToolButton;
    fpEventoSeguimiento: TFormPanel;
    lbAccion: TLabel;
    bvSeparadorBotonesEventos: TBevel;
    lblFechaEvento: TLabel;
    lblVencimientoEvento: TLabel;
    lblObservacuinesEvento: TLabel;
    lblArchivosAsociados: TLabel;
    fraTipoEvento: TfraCodigoDescripcion;
    btnAccAceptar: TButton;
    btnAccCancelar: TButton;
    tbEdicionTiposEventos: TToolBar;
    tbEdicionTipoEvento: TToolButton;
    tbDetallesEvento: TToolButton;
    edFechaVencimientoEvento: TDateComboBox;
    edtArchivosAsociados: TEdit;
    tbrVerArchivosAsociados: TToolBar;
    tbSeleccionArchivosAsociar: TToolButton;
    tbTareas: TTabSheet;
    jvnsSeparador: TJvNetscapeSplitter;
    cbTareas: TCoolBar;
    tbrAgenda: TToolBar;
    tbNuevaTarea: TToolButton;
    tbEditarTarea: TToolButton;
    tbEliminarTarea: TToolButton;
    tbSeparadorTarea: TToolButton;
    tbVistaDia: TToolButton;
    tbVistaSemana: TToolButton;
    tbVistaMes: TToolButton;
    tbSeparadorTareas2: TToolButton;
    tbImprimirTareas: TToolButton;
    tbSeparadorTareas3: TToolButton;
    lblFechaFijadaTarea: TLabel;
    dtcFechaActualVisualizacion: TDateComboBox;
    pnCalendario: TPanel;
    mcCalendario: TJvMonthCalendar2;
    fpTareas: TFormPanel;
    lblTipoTarea: TLabel;
    bvSeparadorBotonesTareas: TBevel;
    lblFechaProgramacionTarea: TLabel;
    lblDescripcionTarea: TLabel;
    lblHecho: TLabel;
    lblResultadosObtenidosTarea: TLabel;
    imAlarma: TImage;
    lblMinutosAlarmaAntes: TLabel;
    bvSeparadorBotonesAlarmaTareas: TBevel;
    btnAceptarTarea: TButton;
    btnCancelarTarea: TButton;
    dtcFechaProgramacion: TDateComboBox;
    mDescripcionTarea: TMemo;
    mDescripcionResultadoTarea: TMemo;
    fraTareas: TfraCodigoDescripcion;
    fraHechos: TfraCodigoDescripcion;
    chkCompletado: TCheckBox;
    chkAlarmaActivada: TCheckBox;
    udMinutosAviso: TUpDown;
    ceMinutosAviso: TCardinalEdit;
    tsPeritajes: TTabSheet;
    cbPeritaje: TCoolBar;
    tbPeritajes: TToolBar;
    tbNuevoPeritaje: TToolButton;
    tbEditarPeritaje: TToolButton;
    tbEliminarPeritaje: TToolButton;
    tbSeparadorPeritaje2: TToolButton;
    tbImprimirPeritajes: TToolButton;
    dbgPeritajes: TRxDBGrid;
    fpPeritajes: TFormPanel;
    tsImportes: TTabSheet;
    gbImportes: TGroupBox;
    lbDemandado: TLabel;
    lbMontoprivilegio: TLabel;
    edIMPORTEDEMANDADO: TCurrencyEdit;
    edIMPORTESENTENCIA: TCurrencyEdit;
    tsPagos: TTabSheet;
    dbgPagosEfectuados: TRxDBGrid;
    cbEdicionPagosEfectudos: TCoolBar;
    tbPagos: TToolBar;
    tbIngresoPago: TToolButton;
    tbEdicionPago: TToolButton;
    tbEliminarPago: TToolButton;
    tbSeparadorPagos: TToolButton;
    tbImprimirPagos: TToolButton;
    plTotalesPago: TPanel;
    pmSeguimientoJuicios: TPopupMenu;
    ImprimirExpediente1: TMenuItem;
    mnuLiquidacion: TMenuItem;
    EvolucindeInstancias1: TMenuItem;
    mnuEventos: TMenuItem;
    mnuAgenda: TMenuItem;
    teHoraDesde: TDateTimePicker;
    teHoraHasta: TDateTimePicker;
    sdqArchivosAsociados: TSDQuery;
    dsConsulta: TDataSource;
    psTareas: TPageControl;
    tsPuntosRevision: TTabSheet;
    fraPuntosRevisionJuicioEnTramite: TfraPuntosRevision;
    tbEditarFormulas: TToolButton;
    lbFechaFinJuicio: TLabel;
    ProgramacionDiaria: TJvTFDays;
    jvwTareasSemanales: TJvTFWeeks;
    jvmTareasMensuales: TJvTFMonths;
    tbBloquear: TToolButton;
    gbReservasAsigandas: TGroupBox;
    chkReservaHonorarios: TCheckBox;
    chkReservaCapital: TCheckBox;
    tbAprobacionDeReservas: TToolBar;
    tbAprobarReservas: TToolButton;
    tbTareaNueva: TToolBar;
    tbEdicionTareas: TToolButton;
    tbObtenerEstadoPago: TToolButton;
    ProgramacionMensual: TJvTFMonths;
    ProgramacionSemanal: TJvTFWeeks;
    dbgOrigenDemanda: TRxDBGrid;
    dbgEventosJuicioEnTramite: TRxDBGrid;
    sduPagoLegal: TSDUpdateSQL;
    tbHistoricoReservas: TToolButton;
    fraDatosJuzgado: TfraJuzgados;
    lblDetalle: TLabel;
    edtDescripcion: TMemo;
    gbJuicio: TGroupBox;
    lblTipoJuicio: TLabel;
    lbConcurso: TLabel;
    lbAbogado: TLabel;
    lblCaratula: TLabel;
    lblFechaAsignacion: TLabel;
    lblCarpeta: TLabel;
    fraTipoJuicio: TfraCodigoDescripcion;
    edFECHANOTIFICACION: TDateComboBox;
    fraAbogadosPropios: TfraAbogadosLegales;
    edCARATULA: TEdit;
    tbEdicionAbogado: TToolBar;
    tbNuevoAbogado: TToolButton;
    edFECHAASIGNADO: TDateComboBox;
    edNroCarpeta: TIntEdit;
    edDemandante: TEdit;
    edDemandado: TEdit;
    gbDetalleJuicio: TGroupBox;
    lblMotivoJuicio: TLabel;
    lblEstadoJuicio: TLabel;
    fraEstado: TfraCodigoDescripcion;
    tbEdicionMotivo: TToolBar;
    tbNuevoMotivo: TToolButton;
    tbDetalleMotivo: TToolButton;
    tbExplorarHistoricoEstado: TToolBar;
    tbHistoricoEstados: TToolButton;
    psSentenciaMediacion: TPageControl;
    lblSentencia: TLabel;
    lblDescripcionSentencia: TLabel;
    fraTipoResultadoJuicio: TfraCodigoDescripcion;
    pnSentencia: TPanel;
    lblMediador: TLabel;
    lblTipoMediacion: TLabel;
    fraMediador: TfraAbogadosLegales;
    fraTipoMediacion: TfraCodigoDescripcion;
    lblNroExpedienteMediacion: TLabel;
    edNroExpedienteMediacion: TPatternEdit;
    tbElevacionAJuicio: TToolButton;
    lblFin: TLabel;
    edFECHASENTENCIA: TDateComboBox;
    lblContra: TLabel;
    lblOrganismosMediacion: TLabel;
    fraOrganismoMediacion: TfraCodigoDescripcionExt;
    Panel1: TPanel;
    tbInspeccionarDictamenAcustorio: TToolBar;
    tbExplorarDictamenAcusatorio: TToolButton;
    mDictamen: TMemo;
    sdqDictamenAcusatorio: TSDQuery;
    lblDictamen: TLabel;
    cdsArchivosAsociados: TClientDataSet;
    mSentencia: TRxRichEdit;
    EnterAsTab: TJvEnterAsTab;
    Label1: TLabel;
    edFECHAFINJUICIO: TDateComboBox;
    tbBloquearPagosSiniestros: TToolButton;
    tsEmbargos: TTabSheet;
    dsEmbargos: TDataSource;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbImprimirEmbargos: TToolButton;
    dbgEmbargos: TRxDBGrid;
    sdqEmbargos: TSDQuery;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    tbAplicacion: TToolButton;
    ToolButton2: TToolButton;
    fpVerAplicaciones: TFormPanel;
    gridAplicaciones: TArtDBGrid;
    btnCerrarAplicaciones: TButton;
    sdqAplicaciones: TSDQuery;
    dsAplicaciones: TDataSource;
    pnTotal: TPanel;
    Label9: TLabel;
    edIMPORTESRECEXTRAORD: TCurrencyEdit;
    tsRecursosExtraordinarios: TTabSheet;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbImprimirRecExtraord: TToolButton;
    ToolButton3: TToolButton;
    dsRecExtraord: TDataSource;
    sdqRecExtraord: TSDQuery;
    tbSumatoriaRecExtraord: TToolButton;
    ToolButton4: TToolButton;
    dbgRecExtraord: TArtDBGrid;
    Mes: TTabSheet;
    Semana: TTabSheet;
    Dia: TTabSheet;
    PuntosRevision: TTabSheet;
    Sentencia: TTabSheet;
    Mediacion: TTabSheet;
    tbseparator3: TToolButton;
    QueryPrintRecExtraord: TQueryPrint;
    ToolBar3: TToolBar;
    tbHistoricoReserva: TToolButton;
    lblAviso: TLabel;
    chkReservaGestion: TCheckBox;
    tbCalculaReservaGestion: TToolButton;
    pn1: TPanel;
    lblPericia: TLabel;
    lblResultadoPericia: TLabel;
    lblFechaRealizacionPericia: TLabel;
    lblFechaAsignacionPerito: TLabel;
    mResultadosPeritaje: TMemo;
    dcbFechaPericia: TDateComboBox;
    dcbFechaNotificacionPerito: TDateComboBox;
    fraPericia: TfraCodigoDescripcion;
    edFVencImpug: TDateComboBox;
    lblFVencImpug: TLabel;
    pnPorcentajeIncapacidad: TPanel;
    lblIncPeritoMedico: TLabel;
    lblIncapacidadDemanda: TLabel;
    edPorcentajeIncDemanda: TCurrencyEdit;
    edPorcentajeIncPeritoMedico: TCurrencyEdit;
    Label5: TLabel;
    lnlPorcentajeIncapacidad: TLabel;
    pnIBM: TPanel;
    lblIBMArt: TLabel;
    lblIBMPericial: TLabel;
    edIBMArt: TCurrencyEdit;
    edIBMPericial: TCurrencyEdit;
    pn4: TPanel;
    rgImpugnacion: TRadioGroup;
    lblImpugnacion: TLabel;
    tbImpresionEventos: TToolButton;
    fpJuicioRelacionado: TFormPanel;
    Bevel7: TBevel;
    btnAceptarProcedencia: TButton;
    btnCancelarProcedencia: TButton;
    lbNroCarpetaRelacionada: TLabel;
    fraJuicioRelacionado: TfraCodigoDescripcion;
    tbVerImagenes: TToolButton;
    chkCargaEstudioJuridico: TCheckBox;
    ceReservaCapital: TJvValidateEdit;
    ceReservaHonorarios: TJvValidateEdit;
    ceReservaGestion: TJvValidateEdit;
    fraPerito: TfraCodigoDescripcion;
    lbPerito: TLabel;
    pnConceptoDuplicado: TPanel;
    lbConceptoDuplicado: TLabel;
    lbColorConceptoDuplicado: TLabel;
    tbAprobacionConceptosDuplicados: TToolButton;
    pnAprobacionConDup: TFormPanel;
    lbMotivo: TLabel;
    btnAceptarAprobConDup: TButton;
    btnCancelarAprobConDup: TButton;
    gbAprobacion: TGroupBox;
    cbAprobadoConDup: TCheckBox;
    cbRechazadoConDup: TCheckBox;
    edMotivo: TMemo;
    tbOrdenar: TToolButton;
    SortDialogEvento: TSortDialog;
    pnBaremo: TPanel;
    lblBaremo: TLabel;
    rgBaremo: TRadioGroup;
    Panel2: TPanel;
    bvSeparadorBotonesPeritaje: TBevel;
    btnAceptarPericia: TButton;
    btnCancelarPericia: TButton;
    tbPeritosABM: TToolBar;
    tbModificarPerito: TToolButton;
    edFechaEventoDesde: TDateComboBox;
    Panel3: TPanel;
    lbTotalRetenido: TLabel;
    Panel4: TPanel;
    lblTotalRecursoExtra: TLabel;
    lbTotalEmbargo: TLabel;
    tbAsociarDoc: TToolButton;
    Panel5: TPanel;
    tbArchivosPericia: TToolBar;
    tbSeleccionArchivosAsociarPericias: TToolButton;
    tbAsociarDocPericias: TToolButton;
    edtArchivosAsociadosPericias: TEdit;
    lbAsociarDocPericia: TLabel;
    cdsArchivosAsociadosPericias: TClientDataSet;
    sdqArchivosAsociadosPericias: TSDQuery;
    dsArchivosAsociadosPericias: TDataSource;
    mObservacionesEvento: TRxRichEdit;
    procedure tbNuevoEventoClick(Sender: TObject);
    procedure tbModificarEventoClick(Sender: TObject);
    procedure tbEdicionPagoClick(Sender: TObject);
    procedure tbNuevaTareaClick(Sender: TObject);
    procedure tbEditarTareaClick(Sender: TObject);
    procedure tbDiaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbAgendaClick(Sender: TObject);
    procedure tbCalendarioClick(Sender: TObject);
    procedure tbEliminarEventoClick(Sender: TObject);
    procedure btnAccAceptarClick(Sender: TObject);
    procedure tbBajaOrigenDemandaClick(Sender: TObject);
    procedure tbEdicionOrigenDemandaClick(Sender: TObject);virtual;
    procedure tbNuevoOrigenDemandaClick(Sender: TObject);virtual;abstract;
    procedure ScheduleLoadBatch(Sender: TObject; BatchName: String; BatchStartDate, BatchEndDate: TDate);
    procedure dtcFechaActualVisualizacionChange(Sender: TObject);
    procedure ProgramacionDiariaDateChanged(Sender: TObject);
    procedure ProgramacionDiariaDateChanging(Sender: TObject; var NewDate: TDate);
    procedure tbEliminarTareaClick(Sender: TObject);
    procedure ProgramacionDiariaDblClick(Sender: TObject);
    procedure btnAceptarTareaClick(Sender: TObject);
    procedure btnCancelarTareaClick(Sender: TObject);
    procedure ScheduleDeleteAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure SchedulePostAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure ScheduleRefreshAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure FormShow(Sender: TObject);
    procedure mcCalendarioSelChange(Sender: TObject; StartDate, EndDate: TDateTime);
    procedure tbNuevoPeritajeClick(Sender: TObject);
    procedure tbEditarPeritajeClick(Sender: TObject);
    procedure tbEliminarPeritajeClick(Sender: TObject);
    procedure btnAceptarPericiaClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure chkReservaHonorariosClick(Sender: TObject);
    procedure chkReservaCapitalClick(Sender: TObject);
    procedure fraDatosJuzgadobtnInstanciasAnterioresClick(Sender: TObject);virtual;abstract;
    procedure tbSeleccionArchivosAsociarClick(Sender: TObject);
    procedure SeguridadDisableComponent(Component: TComponent; var Cancel: Boolean);
    procedure tbBloquearClick(Sender: TObject);
    procedure tbCopiarCalculoClick(Sender: TObject);
    procedure tbNuevoAbogadoClick(Sender: TObject);
    procedure fraReclamoSentenciaReclamotbEditarReclamosClick(Sender: TObject);
    procedure tbObtenerEstadoPagoClick(Sender: TObject);
    procedure tbImprimirPagosClick(Sender: TObject);
    procedure sdqPagoLegalAfterScroll(DataSet: TDataSet);
    procedure tbAprobarReservasClick(Sender: TObject);
    procedure tbEliminarPagoClick(Sender: TObject);
    procedure tbReasignarAbogadoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgEventosJuicioEnTramiteDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
    																									Column: TColumn; State: TGridDrawState);
    procedure dbgOrigenDemandaGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
    																				Highlight: Boolean);
    procedure dbgEventosJuicioEnTramiteGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
    																								 var Background: TColor; Highlight: Boolean);
    procedure dbgPeritajesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgPagosEfectuadosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
      																				Highlight: Boolean);
    procedure fraReclamoSentenciaReclamotbBajaReclamoClick(Sender: TObject);
    procedure fraReclamoSentenciaReclamodbReclamosPaintFooter(Sender: TObject; Column: String; var Value: String;
    																													var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure fraReclamoSentenciaReclamobtnAceptarReclamoClick(Sender: TObject);
    procedure tbHistoricoReservasClick(Sender: TObject);
    procedure tbElevacionAJuicioClick(Sender: TObject);
    procedure tbHistoricoEstadosClick(Sender: TObject);
    procedure ceReservaCapitalChange(Sender: TObject);
    procedure ceReservaCapitalKeyPress(Sender: TObject; var Key: Char);
    procedure fraReclamoSentenciaReclamotbEdicionReclamoClick(Sender: TObject);
    procedure fraDatosJuzgadobtnMasDatosJuzgadoClick(Sender: TObject);
    procedure tbBloquearPagosSiniestrosClick(Sender: TObject);
    procedure dbgEmbargosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqEmbargosAfterOpen(DataSet: TDataSet);
    procedure tbImprimirEmbargosClick(Sender: TObject);
    procedure tbAplicacionClick(Sender: TObject);
    procedure btnCerrarAplicacionesClick(Sender: TObject);
    procedure fpVerAplicacionesKeyPress(Sender: TObject; var Key: Char);
    procedure tbImprimirRecExtraordClick(Sender: TObject);
    procedure sdqRecExtraordAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaRecExtraordClick(Sender: TObject);
    procedure dbgRecExtraordPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure dbgOrigenDemandaDblClick(Sender: TObject);
    procedure fraReclamoSentenciaReclamodbReclamosDblClick(
      Sender: TObject);
    procedure dbgEventosJuicioEnTramiteDblClick(Sender: TObject);
    procedure dbgPeritajesDblClick(Sender: TObject);
    procedure dbgPagosEfectuadosDblClick(Sender: TObject);
    procedure chkReservaGestionClick(Sender: TObject);
    procedure fraPericiaOnChange(Sender: TObject);
    procedure tbImpresionEventosClick(Sender: TObject);
    procedure tbNuevoReclamoClickOverride(Sender: TObject);
    procedure btnAceptarProcedenciaClick(Sender: TObject);
    procedure tbVerImagenesClick(Sender: TObject);
    procedure tbAprobacionConceptosDuplicadosClick(Sender: TObject);
    procedure btnAceptarAprobConDupClick(Sender: TObject);
    procedure cbAprobadoConDupClick(Sender: TObject);
    procedure cbRechazadoConDupClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbFijarSentenciaClick(Sender: TObject); virtual; abstract;
    procedure pgDetallesJuicioChange(Sender: TObject);virtual;
    procedure tbModificarPeritoClick(Sender: TObject);
    procedure tbAsociarDocClick(Sender: TObject);
    procedure tbSeleccionArchivosAsociarPericiasClick(Sender: TObject);
    procedure tbAsociarDocPericiasClick(Sender: TObject);
  private
    procedure LoadDynamicSortFields(ASortFields: TSortFields;
      AColumns: TDBGridColumns);
    procedure SumatoriaEmbargo;
    procedure SumatoriaRecursoExtra;
    procedure MostrarArchivosAsociadosPericias;
    procedure CargarArchivosPericias;
  protected
    FIdEstadoJuicio: Integer;
    FIdJuicioEnTramite: Integer;
    FIdJuicioRelacionado : Integer;
    FIdEventoJuicioEnTramite: Integer;
    FIdPericia: Integer;
    FIdAcceso: Integer;
    FMediacion: Boolean;
    FAppt: TApptTareas;
    FModo: TModoEjecucion;
    FModoOriginal : TModoEjecucion;
    FModoEventosSeguimientos: TModoEjecucion;
    FModoTarea: TModoEjecucion;
    FModoPeritaje: TModoEjecucion;
    FModoAcceso: TModoEjecucion;
    FJuicioFinalizado: Boolean;
    FReservasAprobadas: Boolean;
    FReservasAprobadasInicial: Boolean;
    FNivelAccesoUsuario: Integer;
    FModificado: Boolean;
    FImporteDemandado : Extended;
    FarId: TTableId;

    function Alta: Boolean;
    function AltaEvento: Boolean;virtual;
    function CargarEstudioJuridico(IdAbogado: String): String;
    function ModificacionEvento: Boolean;
    procedure ActualizarInstanciaJuicio(AIdJuicioEnTramite, AJurisdiccion, AFuero, AJuzgado, ASecretaria,
    																		AInstancia: Integer; ANroExpediente, AAnioExpediente: String;ASinExpediente :Boolean; AFechaIngreso: TDate; Ausuario: String);
    procedure ActualizarSiniestrosJuicio;
    procedure AltaPeritaje;
    procedure AltaTarea;
    procedure CargarArchivos;
    procedure CargarDatos;
    procedure CargarDatosEvento(Campos: TFields);virtual;
    procedure CargarDatosPeritaje(Campos: TFields);
    procedure CargarDatosTareas(Appt: TApptTareas);
    procedure CargarFinancialsDatosPago;
    procedure CargarSentencia(AQuery: TDataSet);
    procedure CopiarValoresReservas;
    procedure DoCargarDatos(AQuery: TDataSet);virtual;
    procedure DesaprobarReservas;
    procedure EditarProgramacion(var Appt: TApptTareas);
    procedure GuardarAsignacionAbogado;
    procedure GuardarCambioEstado;
    procedure GuardarCambioReserva;
    procedure GuardarEvento;
    procedure GuardarInstanciaInicioJuicion(AIdJuicioEnTramite, AJurisdiccion, AFuero, AJuzgado, ASecretaria,
    																				AInstancia: Integer; ANroExpediente, AAnioExpediente: String; ASinExpediente :Boolean; AFechaIngreso: TDate;
                                            Ausuario: String);
    procedure GuardarJuicio;virtual;abstract;
    procedure GuardarPeritaje;
    procedure GuardarTarea;
    procedure HabilitarReservaCapital;
    procedure HabilitarReservaHonorarios;
    procedure HabilitarReservaGestion;
    procedure LimpiarCampos;

    procedure LimpiarCamposEvento;
    procedure LimpiarCamposPeritaje;
    procedure LimpiarCamposTareas;

    procedure ModificacionPeritaje;
    procedure ModificacionTarea;
    procedure MostrarArchivosAsociados; virtual;
    procedure MostrarDictamen(ADictamen: String);
    procedure ObtenerNumeroCarpeta;virtual;abstract;
    procedure PreValidarFijarSentencia;
    procedure RecargarAbogadoAsignado;
    procedure RecargarArchivosAsociados(cdsArchivosAsociados: TClientDataSet);
    procedure RecargarArchivosAsociadosPericias(cdsArchivosAsociadosPericias: TClientDataSet);
    procedure ReCargarSentencia;
    procedure SetearControlesConsulta;
    procedure SetearControlesJuicio;
    procedure SetearIntervalo(Index: Integer);
    procedure ValidarDemanda;
    procedure fraTipoMediacionOnChange(Sender: TObject);
    procedure CalcTotales;
    procedure ActivarControlesAlta(activar: boolean); virtual;
  public
    function AltaJuicio: Boolean;virtual;abstract;
    function AltaMediacion: Boolean;

    procedure CambiarDatosElevacionJuicio;
    procedure ConsultarJuicio(Tabla: TSDQuery);
    procedure Modificacion(Tabla: TSDQuery);virtual;abstract;
  end;

resourcestring
  LJT_GESTION_ALTA = 'Alta... (Administraci�n de Juicios)';
  LJT_GESTION_MODIF = 'Modificaci�n... (Administraci�n de Juicios)';
  LJT_GESTION_ALTAMEDIACION = 'Alta... (Administraci�n de Mediaciones)';
  LJT_GESTION_MODIFMEDIACION = 'Modificaci�n... (Administraci�n de Mediaciones)';
  LJT_GESTION_CONSJUICIO = 'Consulta... (Administraci�n de Juicios)';
  LJT_GESTION_CONSMEDIACION = 'Consulta... (Administraci�n de Mediaciones)';

implementation

uses
	unCustomDataModule, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unPrincipal, DateUtils, unABMOrigenDemanda,
  unInstanciasJuicio, unConstLegales, unArchivosAsociados, unFrmFormulasCalculoReservaJuicios, unManAbogados,
  unDmFinancials, unImpresionConceptoPago, StrFuncs, unReasignacionAbogado, UnFrmHistoricoReservas,
  UnFrmHistoricoEstados, unFijarImportesSentencia, unBloqueoPagosSiniestros, unManPeritos,
  unCustomConsulta, DbFuncs, unComunes, Math, unRptEventosJuicio, unLegales, unFrmDetalleArchivo,unRptAltaJuicio;

var
  TotalesRecExtraord: array of extended;

Const
  MAXCOLS_RECEXTRAORD = 0;

  CAMPOS_SUMARECEXTRAORD: Array[0..MAXCOLS_RECEXTRAORD] of String = ('IMPORTE');

{$R *.dfm}

procedure TfrmAdminstracionJuicio.FormCreate(Sender: TObject);
begin
  mcCalendario.Today := DBDate;
  with fraJuicioRelacionado do
  begin
    TableName   := 'legales.ljt_juicioentramite';
    FieldID     := 'jt_id';
    FieldCodigo := 'jt_numerocarpeta';
    FieldDesc   := 'NVL (jt_demandante, '''') || '' C/ '' '+
                   '|| NVL (jt_demandado, '''') || '' '' '+
                   '|| jt_caratula';
    FieldBaja   := 'jt_fechabaja';
    ExtraCondition := ' AND JT_ESTADOMEDIACION = ''J'' ';
    Showbajas   := True;
  end;

  with fraTipoJuicio do
  begin
    TableName   := 'legales.ltj_tipojuicio';
    FieldID     := 'tj_id';
    FieldCodigo := 'tj_id';
    FieldDesc   := 'tj_descripcion';
    FieldBaja   := 'tj_fechabaja';
    Showbajas   := True;
  end;

  with fraPerito do
  begin
    TableName   := 'legales.lpe_perito';
    FieldID     := 'pe_id';
    FieldCodigo := 'pe_id';
    FieldDesc   := 'pe_nombre';
    FieldBaja   := 'pe_fechabaja';
    Showbajas   := True;
  end;

  with fraEstado do
  begin
    TableName   := 'legales.lej_estadojuicio';
    FieldID     := 'ej_id';
    FieldCodigo := 'ej_id';
    FieldDesc   := 'ej_descripcion';
    FieldBaja   := 'ej_fechabaja';
    Showbajas   := True;
//    OnChange    := fraEstadoOnChange;
  end;

  with fraTipoEvento do
  begin
    TableName   := 'legales.lte_tipoevento';
    FieldID     := 'te_id';
    FieldCodigo := 'te_id';
    FieldDesc   := 'te_descripcion';
    FieldBaja   := 'te_fechabaja';
    ExtraCondition := ' AND te_etapa LIKE ''%J%'' AND (TE_FECHABAJA IS NULL)';
    Showbajas   := True;
  end;

  with fraTareas do
  begin
    TableName   := 'legales.ltt_tipotarea';
    FieldID     := 'tt_id';
    FieldCodigo := 'tt_id';
    FieldDesc   := 'tt_descripcion';
    Showbajas   := True;
  end;

  with fraHechos do
  begin
    TableName   := 'legales.lth_tipohecho';
    FieldID     := 'th_id';
    FieldCodigo := 'th_id';
    FieldDesc   := 'th_descripcion';
    Showbajas   := True;
  end;

  with fraTipoMediacion do
  begin
    TableName   := 'legales.ltm_tipomediacion';
    FieldID     := 'tm_id';
    FieldCodigo := 'tm_id';
    FieldDesc   := 'tm_descripcion';
    Showbajas   := True;
    OnChange 		:= fraTipoMediacionOnChange;
  end;

  with fraPericia do
  begin
    TableName   := 'legales.ltp_tipopericia';
    FieldID     := 'tp_id';
    FieldCodigo := 'tp_id';
    FieldDesc   := 'tp_descripcion';
    FieldBaja   := 'tp_fechabaja';
    Showbajas   := True;
    OnChange    := fraPericiaOnChange;
  end;

  fraAbogadosPropios.Parte := paPropia;
  fraAbogadosPropios.FieldBaja := 'bo_fechabaja';
  fraAbogadosPropios.ShowBajas := True;

  fraMediador.Parte := paMediacion;

  fraDatosJuzgado.Enabled := True;

  dtcFechaActualVisualizacion.Date := Date;

  FIdEstadoJuicio := -1;

  FarId := ART_EMPTY_ID;
  LoadDynamicSortFields( SortDialogEvento.SortFields, dbgEventosJuicioEnTramite.Columns );
  SetLength(TotalesRecExtraord, MAXCOLS_RECEXTRAORD + 1);
  tbSalir.Left := tbSalir.Left + 100; 
end;

function TfrmAdminstracionJuicio.AltaMediacion: Boolean;
begin
  FMediacion := True;
  Caption := LJT_GESTION_ALTAMEDIACION;
  psSentenciaMediacion.ActivePageIndex := 1;//'Mediacion';
  fraDatosJuzgado.Init(NOPERMITIREXPEDIENTE, NOPERMITIRINSTANCIAS);
  VCLExtra.LockControls(fraDatosJuzgado, True);
  fraDatosJuzgado.Enabled := False;
  fraEstado.ExtraCondition := ' AND ej_etapa LIKE ''%M%''';

  tbFijarSentencia.Enabled := False;
  tbVerPagosPendientes.Enabled := False;
  tbReasignarAbogado.Enabled := False;
  tbElevacionAJuicio.Enabled := False;
  tbBloquear.Enabled := False;

  Result := Alta;
end;

{function TfrmAdminstracionJuicio.AltaJuicio: Boolean;
begin
  FMediacion := false;
  Caption := LJT_GESTION_ALTA;
  fraDatosJuzgado.Init(PERMITIREXPEDIENTE, PERMITIRINSTANCIAS);
  VCLExtra.LockControls(fraDatosJuzgado, false);
  fraDatosJuzgado.Enabled := true;
  fraEstado.ExtraCondition := ' AND ej_etapa LIKE ''%J%''';
  psSentenciaMediacion.ActivePageIndex := 0;

  tbFijarSentencia.Enabled := false;
  tbVerPagosPendientes.Enabled := false;
  tbReasignarAbogado.Enabled := false;
  tbElevacionAJuicio.Enabled := false;
  tbBloquear.Enabled := false;

  result := Alta;
end; }

function TfrmAdminstracionJuicio.Alta: boolean;
begin
//  BeginTrans(True);

  FModo := meAlta;
  ActivarControlesAlta(false);

(*
  FIdJuicioEnTramite := GetSecNextVal('LEGALES.SEQ_LJT_ID');
  EjecutarSqlST('INSERT INTO LEGALES.LJT_JUICIOENTRAMITE (' +
                '  jt_id, jt_idestado) ' +
                'VALUES (' + SqlValue(FIdJuicioEnTramite) +  ',1)');

  Id := GetSecNextVal('LEGALES.seq_lnj_id');

  EjecutarSqlST('INSERT INTO legales.lnj_nivelaccesojuicio (' +
                '  nj_id, nj_idjuicioentramite, nj_idnivelacceso, nj_usuario, ' +
                '  nj_usualta, nj_fechaalta) ' +
                'VALUES ( ' +
                   SqlValue(Id) + ', ' +
                   SqlValue(FIdJuicioEnTramite) + ', ' +
                   SqlValue(1)  + ', ' +
                   SqlValue(Sesion.LoginName) +  ', ' +
                   SqlValue(Sesion.LoginName) + ', SysDate) ', tmNone);
*)

  LimpiarCampos;

  Seguridad.Ejecutar;

  fraEstado.ShowBajas := false;

  Result := (ShowModal = mrOK);
end;

{procedure TfrmAdminstracionJuicio.Modificacion(Tabla : TSDQuery);
begin
  FModo := meModificacion;
  FIdJuicioEnTramite := Tabla.FieldByName('jt_id').AsInteger;

  LimpiarCampos;

  if Tabla.FieldByName('jt_estadomediacion').AsString = 'M' then
  begin
    Caption := LJT_GESTION_MODIFMEDIACION;
    FMediacion := True;
    psSentenciaMediacion.ActivePageIndex := 1;
    fraDatosJuzgado.Init(NOPERMITIREXPEDIENTE, NOPERMITIRINSTANCIAS);
    fraEstado.ExtraCondition := ' AND ej_etapa LIKE ''%M%''';
    tbFijarSentencia.Enabled := False;
    tbVerPagosPendientes.Enabled := False;
  end
  else begin
    Caption := LJT_GESTION_MODIF;
    FMediacion := false;
    fraDatosJuzgado.Init(PERMITIREXPEDIENTE, PERMITIRINSTANCIAS);
    fraEstado.ExtraCondition := ' AND ej_etapa LIKE ''%J%''';
    psSentenciaMediacion.ActivePageIndex := 0;
    tbElevacionAJuicio.Enabled := False;
  end;

  DoCargarDatos(Tabla);
  Seguridad.Ejecutar;
  SetearControlesJuicio;
  ShowModal;
end; }

procedure TfrmAdminstracionJuicio.ConsultarJuicio(Tabla: TSDQuery);
begin
  FModo := meConsulta;
  FIdJuicioEnTramite := Tabla.FieldByName('jt_id').AsInteger;

  LimpiarCampos;

  if Tabla.FieldByName('jt_estadomediacion').AsString = 'M' then
  begin
    Caption := LJT_GESTION_CONSMEDIACION;
    FMediacion := True;
    psSentenciaMediacion.ActivePageIndex := 1;
    fraDatosJuzgado.Init(NOPERMITIREXPEDIENTE, NOPERMITIRINSTANCIAS);
    fraEstado.ExtraCondition := ' AND ej_etapa LIKE ''%M%''';
    tbFijarSentencia.Enabled := False;
    tbVerPagosPendientes.Enabled := False;
  end
  else begin
    Caption := LJT_GESTION_CONSJUICIO;
    FMediacion := false;
    fraDatosJuzgado.Init(PERMITIREXPEDIENTE, PERMITIRINSTANCIAS);
    fraEstado.ExtraCondition := ' AND ej_etapa LIKE ''%J%''';
    psSentenciaMediacion.ActivePageIndex := 0;
    tbElevacionAJuicio.Enabled := False;
  end;

  DoCargarDatos(Tabla);

  Seguridad.Ejecutar;
  SetearControlesJuicio;
  SetearControlesConsulta;

  ShowModal;
end;

procedure TfrmAdminstracionJuicio.LimpiarCampos;
begin
  edNroCarpeta.Text := '';
  fraTipoJuicio.Codigo := '';
  edCARATULA.Text := '';
  fraAbogadosPropios.Codigo := '';

  edFECHANOTIFICACION.Date := 0;
  edFECHANOTIFICACION.MaxDate := DBDate;
  edFECHANOTIFICACION.ErrorMessage := 'La fecha debe ser menor o igual a la fecha actual';

  edFECHAASIGNADO.Date := 0;
  edFECHAFINJUICIO.Date := 0;
  edFECHASENTENCIA.Date := 0;

  fraTipoResultadoJuicio.Codigo := '';
  fraEstado.Codigo := '';
  mSentencia.Text := '';
  fraDatosJuzgado.Limpiar;
  edtDescripcion.Text := '';
  FJuicioFinalizado := false;
  FReservasAprobadas := false;
  FReservasAprobadasInicial := false;
  FModificado := false;
  fraTipoMediacion.Codigo := '';
  fraMediador.Codigo := '';
  pgDetallesJuicio.ActivePageIndex := 0;
  pgDetallesJuicio.OnChange(Self);
end;

procedure TfrmAdminstracionJuicio.DoCargarDatos(AQuery: TDataSet);
var
 Q: TSDQuery;
begin
  FIdJuicioEnTramite := AQuery.FieldByName('JT_ID').AsInteger;
  if AQuery.FieldByName('jt_bloqueado').AsString = 'S' then
  begin
    tbBloquear.Hint := 'Desbloquear Juicio';
    tbBloquear.Down := True;
  end
  else
  begin
    tbBloquear.Hint := 'Bloquear Juicio';
    tbBloquear.Down := False;
  end;

  (* Juicio *)
  edNroCarpeta.Text            := AQuery.FieldByName('JT_NUMEROCARPETA').AsString;
  edDemandante.Text            := AQuery.FieldByName('JT_DEMANDANTE').AsString;
  edDemandado.Text             := AQuery.FieldByName('JT_DEMANDADO').AsString;
  edCARATULA.Text              := AQuery.FieldByName('JT_CARATULA').AsString;

  fraAbogadosPropios.Codigo    := AQuery.FieldByName('JT_IDABOGADO').AsString;

  edFECHAASIGNADO.Date         := AQuery.FieldByName('JT_FECHAASIGN').AsDateTime;
  edFECHAFINJUICIO.Date        := AQuery.FieldByName('JT_FECHAFINJUICIO').AsDateTime;
  FJuicioFinalizado            := not AQuery.FieldByName('jt_fechafinJuicio').IsNull;

  (* Detalle *)
  fraTipoResultadoJuicio.Codigo  := AQuery.FieldByName('JT_IDTIPORESULTADOSENTENCIA').AsString;

  fraEstado.Codigo               := AQuery.FieldByName('JT_IDESTADO').AsString;
  FIdEstadoJuicio                := fraEstado.Value;

  fraEstado.ShowBajas            := fraEstado.IsBaja;


  edtDescripcion.Text           := AQuery.FieldByName('jt_descripcion').AsString;
  fraTipoJuicio.Codigo          := AQuery.FieldByName('jt_idtipo').AsString;

  (* Mediacion *)
  if FMediacion then
  begin
    fraTipoMediacion.Codigo := AQuery.FieldByName('jt_idtipomediacion').AsString;
    fraOrganismoMediacion.Codigo := AQuery.FieldByName('jt_idorganismomediacion').AsString;
    fraMediador.Codigo := AQuery.FieldByName('jt_idmediador').AsString;
    edNroExpedienteMediacion.Text := AQuery.FieldByName('jt_expedientemediacion').asstring;
  end;

//  edNroOrdenRAJ.Text := AQuery.FieldByName('jt_numeroordenraj').AsString;
//  edFECHAINGRESORAJ.Date := AQuery.FieldByName('jt_fechaingresoraj').AsDateTime;
//  chkCondicionNoSeguro.Checked := AQuery.FieldByName('jt_condiciondenoseguro').AsString = 'S';

  (* Juzgado *)
  try
    if (Not FMediacion) or (FMediacion and (trim(fraTipoMediacion.Codigo) = MEDIACIONCIVIL)) then
    begin
      fraDatosJuzgado.cbSinExpediente.Visible := True;
      fraDatosJuzgado.Cargar(AQuery.FieldByName('jt_idjurisdiccion').AsInteger,
                             AQuery.FieldByName('jt_idfuero').AsInteger,
                             AQuery.FieldByName('jt_idjuzgado').AsInteger,
                             AQuery.FieldByName('jt_idsecretaria').AsInteger);
      fraDatosJuzgado.NroExpediente := AQuery.FieldByName('jt_nroexpediente').AsString;
      fraDatosJuzgado.AnioExpediente := AQuery.FieldByName('jt_anioexpediente').AsString;
      fraDatosJuzgado.Expediente := AQuery.FieldByName('jt_expediente').AsString;
      fraDatosJuzgado.SinExpediente := AQuery.FieldByName('jt_sinexpediente').AsString = 'S';
    end;

    if Not FMediacion then
      fraDatosJuzgado.FechaIngreso := AQuery.FieldByName('jt_fechaingreso').AsDateTime;
  except
    Q := GetQuery('SELECT jt_juzgado, jt_Secretaria secretaria , tbFuero.tb_Descripcion fuero, ' +
                  '       tbJurisdiccion.tb_Descripcion jurisdiccion ' +
                  '  FROM sjt_JuicioEnTramite, ctb_Tablas tbJuzgado, ctb_Tablas tbFuero, ctb_Tablas tbJurisdiccion ' +
                  ' WHERE jt_nrojuicio = ' + SqlValue(FIdJuicioEnTramite) +
                  '   AND tbFuero.tb_Codigo (+) = jt_Fuero ' +
                  '   AND tbFuero.tb_Clave (+) = ''FUERO''' +
                  '   AND tbJurisdiccion.tb_Clave (+)=''JURIS''' +
                  '   AND tbJurisdiccion.tb_Codigo (+)=jt_Jurisdiccion' );
    fraDatosJuzgado.gbJuzgados.Caption :=  'Juzgado';
    try
      if Q.RecordCount > 0 then
      begin
        fraDatosJuzgado.gbJuzgados.Caption := fraDatosJuzgado.gbJuzgados.Caption + ' ~ ' +
                                              'Jurizdicci�n: ' + Q.FieldByName('jurisdiccion').AsString + ' - ' +
                                              'Fuero:        ' + Q.FieldByName('fuero').AsString + ' - ' +
                                              'Juzgado:   ' + Q.FieldByName('jt_juzgado').AsString + ' - ' +
                                              'Secretaria:   ' + Q.FieldByName('secretaria').AsString;
      end;
    finally
      Q.Free;
    end;
  end;

  (* Importe *)
//  ceReservaCapitalCalculada.Text := AQuery.FieldByName('JT_RESERVACAPITALCALCULADA').AsString;
//  ceReservaHonorariosCalculada.Text := AQuery.FieldByName('JT_RESERVAHONORARIOCALCULADA').AsString;
  ceReservaCapital.Text       := AQuery.FieldByName('JT_IMPORTERESERVA').AsString;
  ceReservaHonorarios.Text    := AQuery.FieldByName('JT_IMPORTERESERVAHONORARIOS').AsString;
  edIMPORTEDEMANDADO.Text     := AQuery.FieldByName('JT_IMPORTEDEMANDADO').AsString;
  edIMPORTESENTENCIA.Text     := AQuery.FieldByName('JT_IMPORTESENTENCIA').AsString;
  edIMPORTESRECEXTRAORD.Text  := AQuery.FieldByName('JT_IMPORTERECURSOEXTRAORD').AsString;
  FReservasAprobadas          := not AQuery.FieldByName('JT_FECHAAPROBACIONRESERVAS').IsNull;
  FReservasAprobadasInicial   := not AQuery.FieldByName('JT_FECHAAPROBACIONRESERVAS').IsNull;
  ceReservaCapital.OnChange   := ceReservaCapitalChange;
  ceReservaHonorarios.OnChange:= ceReservaCapitalChange;

  (* Sentencia *)
  CargarDatos;
  CargarSentencia(AQuery);
  SumatoriaEmbargo;
  SumatoriaRecursoExtra;
  MostrarDictamen(AQuery.FieldByName('JT_NRODICTAMEN').AsString);

//  BeginTrans(True);
end;

function TfrmAdminstracionJuicio.CargarEstudioJuridico(
  IdAbogado: string): string;
var
 Q : TSDQuery;
begin
  if trim(IdAbogado) <> '' then
  begin
    Q := GetQuery('SELECT bo_idestudiojuridico FROM legales.lbo_abogado WHERE bo_id = ' + trim(IdAbogado));
    try
     if Q.RecordCount > 0 then
     begin
        result := Q.fieldbyname('BO_IDESTUDIOJURIDICO').AsString;
     end;
    finally
      Q.Free;
    end;
  end;
end;

procedure TfrmAdminstracionJuicio.CargarDatos;
begin
  FNivelAccesoUsuario := GetNivelAccesoUsuarioAJuicio;
  fraReclamoSentenciaReclamo.Init(FIdJuicioEnTramite, NOFIJASENTENCIA, fraDatosJuzgado.Instancia);
  edIMPORTEDEMANDADO.Value := fraReclamoSentenciaReclamo.TotalDemanda;
  edIMPORTESENTENCIA.Value := fraReclamoSentenciaReclamo.TotalSentenciaCapital;
end;

procedure TfrmAdminstracionJuicio.CargarSentencia(AQuery : TDataSet);
begin
  edFECHASENTENCIA.Date    := AQuery.FieldByName('jt_fechasentencia').AsDateTime;
  edIMPORTESENTENCIA.Value := AQuery.FieldByName('JT_IMPORTECAPITAL').AsCurrency + AQuery.FieldByName('JT_IMPORTEHONORARIOS').AsCurrency +
                              AQuery.FieldByName('JT_IMPORTETASAJUSTICIA').AsCurrency +
                              AQuery.FieldByName('jt_interesesSentencia').AsCurrency;

  BlobSql ('SELECT jt_detallesentencia ' +
           '  FROM legales.ljt_juicioentramite ' +
           ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite), mSentencia.Lines);

end;

procedure TfrmAdminstracionJuicio.SetearControlesJuicio;
begin
(*
//fixme lo saque porque no pueden ver los datos en los juicios con sentencia arreglar
  LockControls([gbJuicio, gbDetalleJuicio,
               tbNuevoOrigenDemanda, tbBajaOrigenDemanda, tbEdicionOrigenDemanda,
               tbNuevoEvento, tbEliminarEvento, tbModificarEvento,
               tbNuevoPeritaje, tbEditarPeritaje, tbEliminarPeritaje,
               tsImportes, tbrAgenda, edtDescripcion,
               tbIngresoPago, tbEdicionPago, tbEliminarPago], FJuicioFinalizado);
  fraDatosJuzgado.LockControls := FJuicioFinalizado;
*)

//  if (not FSentenciaFijada) and (fraTipoMediacion.sdqDatos.FieldByName('tm_sorteajuzgado').AsString = 'N') then
  if (FMediacion) and (fraTipoMediacion.sdqDatos.FieldByName('tm_sorteajuzgado').AsString = 'N') then
  begin
    VCLExtra.LockControls(fraDatosJuzgado, true);
    fraDatosJuzgado.Enabled := false;
  end;

  if (FMediacion) and (trim(fraTipoMediacion.Codigo) = MEDIACIONPRIVADA) then
  begin
    VCLExtra.LockControls(fraOrganismoMediacion, true);
    fraOrganismoMediacion.Enabled := false;
  end;

//fixme lo saque porque nom pueden ver los datos en los juicios con sentencia arreglar
//  fraReclamoSentenciaReclamo.Editable := not FJuicioFinalizado;

  tbAprobarReservas.Enabled := FNivelAccesoUsuario >= NIVELALTO;
//  tbAprobacionPagos.Enabled := FNivelAccesoUsuario = NIVELALTO;


  if FNivelAccesoUsuario = NIVELINTERMEDIO then
  begin
    ceReservaCapital.ReadOnly := True;
    ceReservaHonorarios.ReadOnly := True;
  end;

  if FNivelAccesoUsuario <> NIVELSUPERIOR then
  begin
    chkReservaGestion.Visible := False;
    ceReservaGestion.Visible := False;
    tbCalculaReservaGestion.Visible := False;
  end
  else
  begin
    chkReservaGestion.Visible := True;
    ceReservaGestion.Visible := True;
    tbCalculaReservaGestion.Visible := True;
  end;


  //Verifico el nivel de seguridad
  if FNivelAccesoUsuario = NIVELNORMAL then
  begin
    ceReservaCapital.PasswordChar := '*';
    ceReservaHonorarios.PasswordChar := '*';
    ceReservaCapital.Enabled := False;
    ceReservaHonorarios.Enabled := False;
    chkReservaCapital.Enabled := False;
    chkReservaHonorarios.Enabled := False;
    tbAprobacionDeReservas.Visible := False;
    tbHistoricoReserva.Visible := False;
  end;

  if (not FMediacion) and ((fraEstado.Value = 2)or (fraEstado.Value = 91) or (fraEstado.Value = 92)) then //Terminado
  begin
    ceReservaCapital.ReadOnly := True;
    ceReservaHonorarios.ReadOnly := True;
  end;

  //  LockControls([gbReservasAsigandas], (FReservasAprobadas and (FNivelAccesoUsuario <> NIVELALTO)));
end;

procedure TfrmAdminstracionJuicio.SetearControlesConsulta;
begin
  tbGuardar.Enabled := false;
  tbReasignarAbogado.Enabled := False;
  tbBloquear.Enabled := False;
  tbElevacionAJuicio.Enabled := False;
  tbOrigenDemanda.Enabled := False;
  cbOrigenDemanda.Enabled := False;
  fraReclamoSentenciaReclamo.cbReclamoSentencia.Enabled := False;
  cbEventos.Enabled := False;
  cbTareas.Enabled := False;
  cbPeritaje.Enabled := False;
  cbEdicionPagosEfectudos.Enabled := False;
//  cbSeguridad.Enabled := False;
  fraDatosJuzgado.btnInstanciasAnteriores.Enabled := False;
  (*
  tbNuevoOrigenDemanda
  tbNuevoReclamo
  tbNuevoEvento
  tbNuevaTarea
  tbNuevoPeritaje
  gbReservasCalculadas
  gbReservasAsigandas
  gbImportes
  tbNuevoAcceso
  tbElevacionAJuicio
  tbBloquear
  tbVerPagosPendientes
  tbReasignarAbogado.
  gbJuicio
  gbDetalleJuicio
  edtDescripcion
*)
end;

// Toolbar Form

procedure TfrmAdminstracionJuicio.tbGuardarClick(Sender: TObject);
begin
  if (FModo <> meAlta) then
  begin
    if fraEstado.Codigo = '3' then
    begin
      fraJuicioRelacionado.Value := FIdJuicioRelacionado;
      fpJuicioRelacionado.ShowModal;
    end;
  end;
  GuardarJuicio;
  if (FModo <> meAlta) then
  begin
    ModalResult := mrOk
  end
  else begin
    FModo := meModificacion;
    ActivarControlesAlta(true);
  end;
//  close;
end;

procedure TfrmAdminstracionJuicio.tbReasignarAbogadoClick(Sender: TObject);
begin
  with TfrmReasignacionAbogado.create(Self) do
  try
    MostrarAbogadosJuicio(FIdJuicioEnTramite);
    RecargarAbogadoAsignado;
  finally
    Free;
  end;
end;

procedure TfrmAdminstracionJuicio.PreValidarFijarSentencia;
begin
  VerificarMultiple (['Permitir Fijar Sentencia',
                      edNroCarpeta,
                      sdqOrigenDemanda.RecordCount > 0,
                      'Debe especificar el origen de la demanda',
                      edNroCarpeta,
                      fraReclamoSentenciaReclamo.CantidadReclamos > 0,
                      'Debe especificar los reclamos de la demanda'
                     ]);
end;

procedure TfrmAdminstracionJuicio.ReCargarSentencia;
var
 Q : TSDQuery;
begin
  Q := GetQuery('SELECT jt_fechasentencia, jt_idtiporesultadosentencia, jt_importecapital, ' +
                '       jt_importetasajusticia, jt_importehonorarios, jt_interesessentencia ' +
                '  FROM legales.ljt_juicioentramite ' +
                ' WHERE jt_id = ' + SqlValue(FIdJuicioentramite));
  try
   if Q.RecordCount > 0 then
   begin
    fraTipoResultadoJuicio.Codigo :=  Q.FieldByName('JT_IDTIPORESULTADOSENTENCIA').AsString;
    edIMPORTESENTENCIA.Value := Q.FieldByName('JT_IMPORTECAPITAL').AsCurrency +
                                Q.FieldByName('JT_IMPORTETASAJUSTICIA').AsCurrency +
                                Q.FieldByName('JT_IMPORTEHONORARIOS').AsCurrency +
                                Q.FieldByName('jt_interesesSentencia').AsCurrency;
    edFECHASENTENCIA.Date    := Q.FieldByName('jt_fechasentencia').AsDateTime;
    BlobSql('SELECT jt_detallesentencia ' +
            '  FROM legales.ljt_juicioentramite' +
            ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite), mSentencia.Lines);
   end;

  finally
    Q.Free;
  end;
end;

procedure TfrmAdminstracionJuicio.tbBloquearClick(Sender: TObject);
var
 Mensaje : string;
 Resultado : string;
begin
  if ValorSql('SELECT jt_bloqueado FROM legales.ljt_juicioentramite ' +
             ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite), 'N') = 'S' then
  begin
    Mensaje := '�Confirma el desbloqueo del Juicio?';
    Resultado := 'N';
  end else
  begin
    Mensaje := '�Confirma el bloqueo del Juicio?';
    Resultado := 'S';
  end;

  if (MessageBox(0, PChar(Mensaje), PChar('Bloqueo / Desbloqueo'), MB_ICONQUESTION or MB_YESNO) = idYes) then
  begin
    EjecutarSqlST('UPDATE legales.ljt_juicioentramite ' +
                  '   SET jt_bloqueado = ' + SqlValue(Resultado) + ', ' +
                  '       jt_usuariobloquea = ' + SqlValue(Sesion.LoginName) +
                  ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite));
  end;
end;

procedure TfrmAdminstracionJuicio.tbElevacionAJuicioClick(Sender: TObject);
begin
  If FMediacion then
    If (MessageBox(0, '�Confirma la elevaci�n a juicio de la mediaci�n?', 'Elevaci�n A Juicio', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) in [idYes, idNo]) then
      with TfrmInstanciasJuicio.Create(self) do
      try
        if ElevarAJuicio(FIdJuicioEnTramite, edFECHANOTIFICACION.Date) then
          CambiarDatosElevacionJuicio;
      finally
        Free;
      end;
end;

procedure TfrmAdminstracionJuicio.tbSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

// Juicio

procedure TfrmAdminstracionJuicio.tbNuevoAbogadoClick(Sender: TObject);
begin
  TfrmManAbogados.MostrarAbm;
  fraAbogadosPropios.Reload;
end;

{procedure TfrmAdminstracionJuicio.fraEstudioJuridicoChange(
  Sender: TObject);
begin
  fraAbogadosPropios.Codigo := '';
  if fraEstudioJuridico.IsSelected then
  begin
    fraAbogadosPropios.Parte := paPropia;
    fraAbogadosPropios.ExtraCondition := fraAbogadosPropios.ExtraCondition + ' AND BO_IDESTUDIOJURIDICO = ' + fraEstudioJuridico.Codigo;
  end
  else
    fraAbogadosPropios.ExtraCondition := ' AND 1=2 ';
end;
}
// Detalle

procedure TfrmAdminstracionJuicio.tbHistoricoEstadosClick(Sender: TObject);
begin
  TfrmHistoricoEstados.MostrarHistorico(FIdJuicioEnTramite);
end;



procedure TfrmAdminstracionJuicio.fraTipoMediacionOnChange(
  Sender: TObject);
begin
  if (trim(fraTipoMediacion.Codigo) = MEDIACIONPRIVADA) then
  begin
    if fraOrganismoMediacion.IsSelected and
      (MessageBox(0, '�Confirma descartar los datos asignados al organismo?', 'Datos del Organismo',
                  MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idNo) then
      Exit;
    fraOrganismoMediacion.Limpiar;
    VCLExtra.LockControls(fraOrganismoMediacion, true);
    fraOrganismoMediacion.Enabled := false;
  end else
  begin
    VCLExtra.LockControls(fraOrganismoMediacion, false);
    fraOrganismoMediacion.Enabled := true;
  end;

  if fraTipoMediacion.IsSelected and
    (fraTipoMediacion.sdqDatos.FieldByName('tm_sorteajuzgado').AsString = 'S') then
  begin
    VCLExtra.LockControls(fraDatosJuzgado, false);
    fraDatosJuzgado.Enabled := true;
  end else
  begin
    if fraDatosJuzgado.IsSelected and
      (MessageBox(0, '�Confirma descartar los datos asignados al juzgado?', 'Datos del Juzgado',
                  MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = idNo) then
      Exit;
    fraDatosJuzgado.Limpiar;
    VCLExtra.LockControls(fraDatosJuzgado, true);
    fraDatosJuzgado.Enabled := false;
  end;
end;

// Instancias
{
procedure TfrmAdminstracionJuicio.fraDatosJuzgadobtnInstanciasAnterioresClick(
  Sender: TObject);
begin

end;
}
// Origen Demanda
{
procedure TfrmAdminstracionJuicio.tbNuevoOrigenDemandaClick(
  Sender: TObject);
begin
  with TfrmAbmOrigenDemanda.Create(self) do
  try
    AltaOrigenDemanda(FIdJuicioEnTramite);
    sdqOrigenDemanda.Refresh;
  finally
    free;
  end;
end;}

procedure TfrmAdminstracionJuicio.tbEdicionOrigenDemandaClick(
  Sender: TObject);
begin
  if sdqOrigenDemanda.IsEmpty then
    Exit;

  if not sdqOrigenDemanda.FieldByName('od_fechabaja').IsNull then
  begin
    MsgBox('El origen de demanda est� dado de baja.' + #13 +
             'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK);
    exit
  end;

{  with TfrmAbmOrigenDemanda.Create(self) do
  try
    ModificacionOrigenDemanda(sdqOrigenDemanda);
    sdqOrigenDemanda.Refresh;
    frareclamante.e
  finally
    free;
  end;}
end;

procedure TfrmAdminstracionJuicio.tbBajaOrigenDemandaClick(Sender: TObject);
var
  v : integer;
begin
  if sdqOrigenDemanda.IsEmpty then
    Exit;

  if not sdqOrigenDemanda.FieldByName('od_fechabaja').IsNull then
  begin
    MsgBox('El origen de demanda ya est� dado de baja.', MB_ICONERROR + MB_OK);
    Exit
  end;

  if MsgBox('�Desea dar de baja el origen actual?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  v := ValorSql('SELECT count(*) FROM legales.lrt_reclamojuicioentramite ' +
                ' WHERE rt_idorigendemanda = ' + sdqOrigenDemanda.FieldByName('od_id').AsString +
                '   AND rt_fechabaja IS NULL', '0');
  if v = 0 then
  begin
    EjecutarSqlST('UPDATE legales.lod_origendemanda ' +
                  '   SET od_fechabaja = SYSDATE, '+
                  '       od_usubaja = ' + SqlValue(Sesion.LoginName) +
                  ' WHERE od_id = ' + sdqOrigenDemanda.FieldByName('od_id').AsString);

    EjecutarSqlST('UPDATE legales.lsj_siniestrosjuicioentramite ' +
                  '   SET sj_fechabaja = SYSDATE, ' +
                  '       sj_usubaja = ' + SqlValue(Sesion.LoginName) +
                  ' WHERE sj_idorigendemanda = ' + sdqOrigenDemanda.FieldByName('od_id').AsString);
  end
  else MessageDlg('El origen demanda se encuentra asociado a uno '+#13+#10+'o mas reclamos. Elimine estos reclamos primero.', mtWarning, [mbOK], 0);

  sdqOrigenDemanda.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
  sdqOrigenDemanda.Refresh;
end;

// Reclamo

procedure TfrmAdminstracionJuicio.fraReclamoSentenciaReclamotbEdicionReclamoClick(Sender: TObject);
begin
  fraReclamoSentenciaReclamo.tbEdicionReclamoClick(Sender);
end;

procedure TfrmAdminstracionJuicio.fraReclamoSentenciaReclamotbBajaReclamoClick(Sender: TObject);
begin
  fraReclamoSentenciaReclamo.tbBajaReclamoClick(Sender);
end;

procedure TfrmAdminstracionJuicio.fraReclamoSentenciaReclamodbReclamosPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  fraReclamoSentenciaReclamo.dbReclamosPaintFooter(Sender, Column,  Value, CellColor, FontColor, AlignFooter);
  edIMPORTEDEMANDADO.Value := fraReclamoSentenciaReclamo.TotalDemanda;
end;

procedure TfrmAdminstracionJuicio.fraReclamoSentenciaReclamobtnAceptarReclamoClick(Sender: TObject);
begin
  fraReclamoSentenciaReclamo.btnAceptarReclamoClick(Sender);
  edIMPORTEDEMANDADO.Value := fraReclamoSentenciaReclamo.TotalDemanda;
end;

procedure TfrmAdminstracionJuicio.fraReclamoSentenciaReclamotbEditarReclamosClick(Sender: TObject);
begin
  fraReclamoSentenciaReclamo.tbEditarReclamosClick(Sender);
end;

// Eventos

procedure TfrmAdminstracionJuicio.tbNuevoEventoClick(Sender: TObject);
begin
  AltaEvento;
end;

procedure TfrmAdminstracionJuicio.tbModificarEventoClick(Sender: TObject);
begin
  if sdqEventoJuicioEnTramite.IsEmpty then
    Exit;

  if not sdqEventoJuicioEnTramite.FieldByName('et_fechabaja').IsNull then
  begin
    MsgBox('El evento est� dado de baja.' + #13 +
           'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK);
    Exit
  end;

  ModificacionEvento;
end;

procedure TfrmAdminstracionJuicio.tbEliminarEventoClick(Sender: TObject);
begin
  if sdqEventoJuicioEnTramite.IsEmpty then
    Exit;

  if not sdqEventoJuicioEnTramite.FieldByName('et_fechabaja').IsNull then
  begin
    MsgBox('El evento ya est� dado de baja.', MB_ICONERROR + MB_OK);
    Exit
  end;

  if MsgBox('�Desea dar de baja el evento seleccionado?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  EjecutarSqlST('UPDATE legales.let_eventojuicioentramite ' +
                '   SET et_fechabaja = sysdate, et_usubaja = ' + SqlValue(Sesion.LoginName) +
                ' WHERE et_id = ' + sdqEventoJuicioEnTramite.FieldByName('et_id').AsString);

  sdqEventoJuicioEnTramite.Refresh;
end;

procedure TfrmAdminstracionJuicio.btnAccAceptarClick(Sender: TObject);
begin
  GuardarEvento;
end;

procedure TfrmAdminstracionJuicio.tbSeleccionArchivosAsociarClick(
  Sender: TObject);
begin
  MostrarArchivosAsociados;
end;

//  Tareas

procedure TfrmAdminstracionJuicio.tbNuevaTareaClick(Sender: TObject);
begin
  AltaTarea
end;

procedure TfrmAdminstracionJuicio.tbEditarTareaClick(Sender: TObject);
begin
  ModificacionTarea;
end;

procedure TfrmAdminstracionJuicio.tbEliminarTareaClick(Sender: TObject);
begin
  If Assigned(ProgramacionDiaria.SelAppt) and
    (MsgBox('�Desea dar de baja la tarea actual?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
    ProgramacionDiaria.SelAppt.Delete;
end;

procedure TfrmAdminstracionJuicio.ProgramacionDiariaDateChanged(
  Sender: TObject);
begin
  With ProgramacionDiaria.Template do
    If ActiveTemplate = agtLinear Then
      dtcFechaProgramacion.Date := LinearStartDate
    Else
      dtcFechaProgramacion.Date := CompDate;
end;

procedure TfrmAdminstracionJuicio.ProgramacionDiariaDateChanging(
  Sender: TObject; var NewDate: TDate);
begin
  ProgramacionDiaria.ScheduleManager.PostAppts;
end;

procedure TfrmAdminstracionJuicio.ProgramacionDiariaDblClick(
  Sender: TObject);
begin
  ModificacionTarea;
end;

procedure TfrmAdminstracionJuicio.btnAceptarTareaClick(Sender: TObject);
begin
  GuardarTarea;
end;

procedure TfrmAdminstracionJuicio.GuardarTarea;
var
  I : Integer;
begin
  VerificarMultiple(['Guardando Tarea',
                      dtcFechaProgramacion,
                      dtcFechaProgramacion.Date > 0,
                      'Debe especificar una fecha para la tarea',
                      dtcFechaProgramacion,
                      dtcFechaProgramacion.Date >= edFECHANOTIFICACION.Date,
                      'La Fecha de la tarea no puede ser anterior a la fecha de notificaci�n del juicio.',
                      teHoraDesde, teHoraDesde.Time > 0,
                      'Debe especificar una hora de inicio de la tarea.',
                      teHoraHasta, teHoraHasta.Time > 0,
                      'Debe especificar una hora de fin de la tarea',
                      fraTareas, fraTareas.Codigo <> '',
                      'Debe especificar una tarea.',
                      fraHechos, fraHechos.Codigo <> '',
                      'Debe especificar un hecho',
                      mDescripcionTarea, trim(mDescripcionTarea.Text) <> '',
                      'Debe especificar una descripci�n para la tarea.']);

  if Assigned(self.FAppt) then
  begin
    with self do
    begin
      FAppt.BeginUpdate;
//      BeginTrans(true);
      try
        FAppt.SetStartEnd(dtcFechaProgramacion.Date, teHoraDesde.Time,
                    dtcFechaProgramacion.Date, teHoraHasta.Time);
        FAppt.AlarmEnabled := chkAlarmaActivada.Checked;
        FAppt.AlarmAdvance := ceMinutosAviso.Value;
        FAppt.Description := mDescripcionTarea.Text;
        FAppt.DescripcionResultado := mDescripcionResultadoTarea.Text;

        FAppt.Completado := chkCompletado.Checked;
        FAppt.TipoTarea := StrToInt(fraTareas.Codigo);
        FAppt.TipoHecho := StrToInt(fraHechos.Codigo);

        If FModoTarea = meAlta  Then
        Begin
          If ProgramacionDiaria.ValidSelection Then
            For I :=  ProgramacionDiaria.SelStart.X to ProgramacionDiaria.SelEnd.X do
              FAppt.AddSchedule(IntToStr(FIdJuicioEnTramite));
          FAppt.Persistent := False;
        End;
      Finally
        FAppt.EndUpdate;  // this causes the appt to be posted
//        CommitTrans(true);
      End;
    End;
  end;
  FAppt := nil;

  fpTareas.close;
end;

procedure TfrmAdminstracionJuicio.btnCancelarTareaClick(Sender: TObject);
begin
  if Assigned(FAppt) and (FModoTarea = meAlta) then
  begin
    FAppt.Free;
    FAppt := nil;
  end;
end;

// Peritajes

procedure TfrmAdminstracionJuicio.tbNuevoPeritajeClick(Sender: TObject);
begin
  AltaPeritaje;
end;

procedure TfrmAdminstracionJuicio.AltaPeritaje;
begin
  LimpiarCamposPeritaje;
  FModoPeritaje := meAlta;
  fpPeritajes.ShowModal;
  sdqPericiasJuicios.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
  sdqPericiasJuicios.Refresh;
end;

procedure TfrmAdminstracionJuicio.tbEditarPeritajeClick(Sender: TObject);
begin
  if sdqPericiasJuicios.IsEmpty then
    Exit;

  if not sdqPericiasJuicios.FieldByName('pj_fechabaja').IsNull then
  begin
    MsgBox('La pericia est� dada de baja.' + #13 +
           'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK);
    Exit
  end;

  ModificacionPeritaje;
end;

procedure TfrmAdminstracionJuicio.ModificacionPeritaje;
begin
  if sdqPericiasJuicios.RecordCount > 0 then
  begin
    LimpiarCamposPeritaje;
    FModoPeritaje := meModificacion;
    FIdPericia := sdqPericiasJuicios.Fields.FieldByName('pj_id').AsInteger;
    CargarDatosPeritaje(sdqPericiasJuicios.Fields);
    fpPeritajes.ShowModal;
    sdqPericiasJuicios.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
    sdqPericiasJuicios.Refresh;
  end;
end;

procedure TfrmAdminstracionJuicio.tbEliminarPeritajeClick(Sender: TObject);
begin
  if sdqPericiasJuicios.IsEmpty then
    Exit;

  if not sdqPericiasJuicios.FieldByName('pj_fechabaja').IsNull then
  begin
    MsgBox('La pericia ya est� dada de baja.', MB_ICONERROR + MB_OK);
    Exit
  end;

  if MsgBox('�Desea dar de baja la pericia seleccionada?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  EjecutarSqlST('UPDATE legales.lpj_peritajejuicio  ' +
                '   SET pj_fechabaja = sysdate, ' +
                '       pj_usubaja = ' + SqlValue(Sesion.LoginName) +
                ' WHERE pj_id = ' + sdqPericiasJuicios.FieldByName('pj_id').AsString);

  sdqPericiasJuicios.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
  sdqPericiasJuicios.Refresh;
end;

procedure TfrmAdminstracionJuicio.LimpiarCamposPeritaje;
begin
  dcbFechaPericia.Clear;
  dcbFechaNotificacionPerito.Clear;
  mResultadosPeritaje.Text := '';
  fraPericia.Clear;
  fraPerito.Clear;
  edFVencImpug.Clear;
  edPorcentajeIncDemanda.Clear;
  edPorcentajeIncPeritoMedico.Clear;
  edIBMArt.Clear;
  edIBMPericial.Clear;
  chkCargaEstudioJuridico.Checked := False;
  rgImpugnacion.ItemIndex := -1;
  rgBaremo.ItemIndex := -1;
  edtArchivosAsociadosPericias.Clear;
  fraPericiaOnChange(nil);

end;

procedure TfrmAdminstracionJuicio.CargarDatosPeritaje(Campos : TFields);
begin
  fraPericia.Codigo := Campos.FieldByName('PJ_IDTIPOPERICIA').AsString;
  fraPerito.Value := Campos.FieldByName('PJ_IDPERITO').AsInteger;
  dcbFechaPericia.Date := Campos.FieldByName('PJ_FECHAPERITAJE').AsDateTime;
  dcbFechaNotificacionPerito.Date := Campos.FieldByName('PJ_FECHANOTIFICACION').AsDateTime;
  edFVencImpug.Date := Campos.FieldByName('PJ_FECHAVENCIMPUGNACION').AsDateTime;
  mResultadosPeritaje.Text := Campos.FieldByName('PJ_RESULTADOPERITAJE').AsString;
  edPorcentajeIncDemanda.Text := Campos.FieldByName('pj_incapacidaddemanda').AsString;
  edPorcentajeIncPeritoMedico.Text := Campos.FieldByName('pj_incapacidadperitomedico').AsString;
  edIBMArt.Text := Campos.FieldByName('pj_ibmart').AsString;
  edIBMPericial.Text := Campos.FieldByName('pj_ibmpericial').AsString;
  rgImpugnacion.ItemIndex := Campos.FieldByName('impugnacion').AsInteger;
  chkCargaEstudioJuridico.Checked := Campos.FieldByName('PJ_COMPLETAESTUDIO').AsString = 'S';
  rgBaremo.ItemIndex := Campos.FieldByName('baremo').AsInteger;
  fraPericiaOnChange(nil);
  CargarArchivosPericias;

  edtArchivosAsociadosPericias.Text := InttoStr(cdsArchivosAsociadosPericias.RecordCount) +
                               ' Archivos Asociados.';
end;


procedure TfrmAdminstracionJuicio.btnAceptarPericiaClick(Sender: TObject);
begin
  GuardarPeritaje;
end;

procedure TfrmAdminstracionJuicio.GuardarPeritaje;
var
 Impugnacion : String;
 baremo : string;
begin
  baremo := '';
  if not chkCargaEstudioJuridico.Checked then
  begin
    VerificarMultiple(['Guardando Pericia..',
                      dcbFechaNotificacionPerito,
                      not dcbFechaNotificacionPerito.IsEmpty,
                      'Debe indicar un Fecha de Notificaci�n de la Pericia',
                      dcbFechaNotificacionPerito,
                      dcbFechaNotificacionPerito.date >= edFECHANOTIFICACION.Date,
                      'La fecha de la pericia no puede ser anterior a la fecha de notificaci�n del juicio.',
                      dcbFechaNotificacionPerito,
                      dcbFechaNotificacionPerito.date <= DbDate,
                      'La fecha de la pericia puede ser posterior a la fecha actual.',
                      dcbFechaPericia,
                      ((not dcbFechaPericia.IsEmpty) and ((mResultadosPeritaje.Text) <> '')) or
                       ((dcbFechaPericia.IsEmpty) and (trim(mResultadosPeritaje.Text) = '')),
                      'Debe completar la finalizaci�n de la pericia correctamente, completando fecha de pericia y resultado de pericia.']);
    Verificar(edFVencImpug.Date = 0, edFVencImpug,'Debe ingresa la fecha de vencimiento de impugnaci�n.');
    Verificar(rgImpugnacion.ItemIndex = -1, rgImpugnacion,'Debe indicar la impugnaci�n');
  end;
  Verificar(not fraPericia.IsSelected, fraPericia, 'Debe Seleccionar una pericia.');
  if fraPerito.IsSelected then
    Verificar(ValorSql('SELECT pe_idtipoperito FROM legales.lpe_perito '+
                     ' WHERE pe_id = '+SqlValue(fraPerito.Value))<> fraPericia.Value, fraPerito, 'El perito debe pertenecer a la misma especialidad de la pericia.');


  If rgImpugnacion.ItemIndex = 0 then
    Impugnacion := 'S'
  else
    Impugnacion := 'N';

  if rgBaremo.ItemIndex = 0 then
    baremo := 'S'
  else if rgBaremo.ItemIndex = 1 then
    baremo := 'N'
  else
    baremo := '';

  if FModoPeritaje = meAlta then
  begin
    FIdPericia := GetSecNextVal('LEGALES.SEQ_LPJ_ID');
    EjecutarSqlST('INSERT INTO legales.lpj_peritajejuicio ' +
                  '(pj_id,pj_idperito, pj_idjuicioentramite, pj_idtipopericia,' +
                  ' pj_fechanotificacion, pj_fechaperitaje, pj_fechavencimpugnacion, '+
                  ' pj_resultadoperitaje, pj_incapacidaddemanda, pj_incapacidadperitomedico, '+                  ' pj_ibmart, pj_ibmpericial, pj_impugnacion, pj_fechaalta, ' +
                  ' pj_usualta,pj_completaestudio,       ' +
                  ' pj_baremo ) ' +
                  'VALUES (' + SqlValue(FIdPericia)                             + ', '+
                               SqlInt(fraPerito.Value,True)             + ', '+
                               SqlValue(FIdJuicioEnTramite)             + ', '+
                               SqlValue(fraPericia.Codigo)              + ', '+
                               SqlDate(dcbFechaNotificacionPerito.Date) + ', '+
                               SqlDate(dcbFechaPericia.Date)            + ', '+
                               SqlDate(edFVencImpug.Date)               + ', '+
                               SqlValue(mResultadosPeritaje.Text)       + ', '+
                               SqlNumber(edPorcentajeIncDemanda.Value)    + ', '+
                               SqlNumber(edPorcentajeIncPeritoMedico.Value)    + ', '+
                               SqlNumber(edIBMArt.Value)    + ', '+
                               SqlNumber(edIBMPericial.Value)    + ', '+
                               SqlValue(Impugnacion)    + ', '+
                               'SYSDATE, ' +
                               SqlValue(Sesion.LoginName)+', '+
                               SqlValue(string(Iif(chkCargaEstudioJuridico.Checked, 'S', 'N'))) + ', ' +
                               sqlvalue(baremo) + ') ' );
  end
  else begin
    EjecutarSqlST('UPDATE legales.lpj_peritajejuicio ' +
                  '   SET pj_idtipopericia           = '+ SqlValue(fraPericia.Codigo)+ ', '+
                  '       pj_fechanotificacion       = '+ SqlDate(dcbFechaNotificacionPerito.Date) + ', ' +
                  '       pj_idperito                = '+ SqlInt(fraPerito.Value,True)+', '+
                  '       pj_fechaperitaje           = '+ SqlDate(dcbFechaPericia.Date) + ', ' +
                  '       pj_fechavencimpugnacion    = '+ SqlDate(edFVencImpug.Date)+ ', '+
                  '       pj_resultadoperitaje       = '+ SqlValue(mResultadosPeritaje.Text) + ', ' +
                  '       pj_incapacidaddemanda      = '+ SqlNumber(edPorcentajeIncDemanda.Value)+ ', '+
                  '       pj_incapacidadperitomedico = '+ SqlNumber(edPorcentajeIncPeritoMedico.Value)+ ', '+
                  '       pj_ibmart                  = '+ SqlNumber(edIBMArt.Value)+ ', '+
                  '       pj_ibmpericial             = '+ SqlNumber(edIBMPericial.Value)+ ', '+
                  '       pj_impugnacion             = '+ SqlValue(Impugnacion)+', '+
                  '       pj_fechamodif              = SYSDATE, ' +
                  '       pj_usumodif                = '+ SqlValue(Sesion.LoginName) + ', ' +
                  '       pj_idjuicioentramite       = '+ SqlValue(FIdJuicioEnTramite) +', '+
                  '       pj_completaestudio         = '+ SqlValue(string(Iif(chkCargaEstudioJuridico.Checked, 'S', 'N')))+ ', ' +
                  '       pj_baremo                  = '+ SqlValue(baremo) +
                  ' WHERE pj_id = ' + SqlValue(FIdPericia));
  end;

  cdsArchivosAsociadosPericias.First;
  while not cdsArchivosAsociadosPericias.Eof do
  begin
    if cdsArchivosAsociadosPericias.FieldByName('STATE').AsString = 'I' then
    begin
      EjecutarSqlST('INSERT INTO legales.LPA_PERICIAARCHIVOASOCIADO ' +
                    ' (PA_ID, PA_DESCRIPCION, PA_PATHARCHIVO, ' +
                    '  PA_IDPERICIAS, PA_USUALTA, PA_FECHAALTA) ' +
                    'VALUES (' + SqlValue(cdsArchivosAsociadosPericias.FieldByName('ID').AsInteger) + ',  ' +
                                 SqlValue(cdsArchivosAsociadosPericias.FieldByName('DESCRIPCION').AsString) + ', ' +
                                 SqlValue(cdsArchivosAsociadosPericias.FieldByName('PATHARCHIVO').AsString) + ', ' +
                                 SqlValue(FIdPericia) + ',' +
                                 SqlValue(Sesion.LoginName) + ', SYSDATE)');
    end;
    cdsArchivosAsociadosPericias.Next;
  end;

  sdqPericiasJuicios.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
  sdqPericiasJuicios.Refresh;
  fpPeritajes.Close;
end;

procedure TfrmAdminstracionJuicio.fraPericiaOnChange(Sender: TObject);
begin
  pnBaremo.Visible:=false;
  rgBaremo.itemindex := -1;
  if (fraPericia.Codigo = '1') or (fraPericia.Codigo = '2') or (fraPericia.Codigo = '8') then
  begin
    if (fraPericia.Codigo = '1') or (fraPericia.Codigo = '8') then
      pnBaremo.Visible:=true;
    pnPorcentajeIncapacidad.Visible := True;
    pnIBM.Visible := False;
    edIBMArt.Clear;
    edIBMPericial.Clear;
  end
  else
  if (fraPericia.Codigo = '3') or (fraPericia.Codigo = '9') then
  begin
    pnPorcentajeIncapacidad.Visible := False;
    pnIBM.Visible := True;
    edPorcentajeIncDemanda.Clear;
    edPorcentajeIncPeritoMedico.Clear
  end
  else
  begin
    pnPorcentajeIncapacidad.Visible := False;
    pnIBM.Visible := False;
    edIBMArt.Clear;
    edIBMPericial.Clear;
    edPorcentajeIncDemanda.Clear;
    edPorcentajeIncPeritoMedico.Clear
  end;
end;
// Pagos

procedure TfrmAdminstracionJuicio.tbEdicionPagoClick(Sender: TObject);
begin
  if sdqPagoLegal.IsEmpty then
    Abort;

  if (sdqPagoLegal.FieldByName('PL_DUPLICADO').AsString = 'S') and
     (sdqPagoLegal.FieldByName('PL_ESTADODUPLICIDAD').IsNull) then
  begin
    MsgBox('El pago est� duplicado y pendiente de aprobacion.' + #13 +
           'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK);
    Abort;
  end;

  if (sdqPagoLegal.FieldByName('PL_ESTADODUPLICIDAD').AsString = 'R') then
  begin
    MsgBox('El pago est� rechazado por duplicado.' + #13 +
           'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK);
    Abort;
  end;

  if (sdqPagoLegal.FieldByName('PL_ESTADO').AsString = 'A') or
     (sdqPagoLegal.FieldByName('PL_ESTADO').AsString = 'X') then
  begin
    MsgBox('El pago est� dado de baja.' + #13 +
           'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK);
    Abort;
  end;

  if sdqPagoLegal.FieldByName('PL_ESTADO').AsString = 'E' then
  begin
    MsgBox('El pago ha sido aprobado.' + #13 +
           'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK);
    Abort;
  end;

  if (sdqPagoLegal.FieldByName('pl_importeconretencion').AsCurrency < 0) or
     (sdqPagoLegal.FieldByName('pl_importepago').AsCurrency < 0) then
  begin
    if (sdqPagoLegal.FieldByName('pl_estado').AsString = 'E') then
      MsgBox('El pago corresponde a una anulaci�n previa ya aprobada.' + #13 +
             'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK)
    else
      MsgBox('El pago corresponde a una anulaci�n previa.' + #13 +
             'Sus datos no pueden ser modificados.', MB_ICONERROR + MB_OK);
    Abort;
  end;

end;

procedure TfrmAdminstracionJuicio.tbEliminarPagoClick(Sender: TObject);
var
  IdPago,
  NumPago: integer;
begin
  if sdqPagoLegal.IsEmpty then
    Exit;

  if (sdqPagoLegal.FieldByName('pl_estado').AsString = 'A') or
     (sdqPagoLegal.FieldByName('pl_estado').AsString = 'X') then
  begin
    MsgBox('El pago ya est� dado de baja.', MB_ICONERROR + MB_OK);
    Exit
  end;

  if (sdqPagoLegal.FieldByName('pl_importeconretencion').AsCurrency < 0) or
     (sdqPagoLegal.FieldByName('pl_importepago').AsCurrency < 0) then
  begin
    if (sdqPagoLegal.FieldByName('pl_estado').AsString = 'E') and (sdqPagoLegal.FieldByName('pl_idembargo').IsNull) then
    begin
      MsgBox('El pago no puede darse de baja ' + #13 +
             'ya que corresponde a una anulaci�n previa ya autorizada.', MB_ICONERROR + MB_OK);
      Exit;
    end;
  end;

  if MessageDlg('�Confirma la Cancelaci�n del Pago Seleccionado?',
                    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  //Si el estado es Cargada, cancelo y ya, sino tengo que generar un movimiento contrario.
  if sdqPagoLegal.FieldByName('pl_estado').AsString = 'C' then
  begin
    // Cancelo el pago
    EjecutarSqlST('UPDATE legales.lpl_pagolegal ' +
                  '   SET pl_estado = ''A'', ' +
                  '       pl_importeconretencion = NULL, ' +
                  '       pl_importepago = NULL, ' +
                  '       pl_usumodif = ' + SqlValue (Sesion.LoginName) + ', ' +
                  '       pl_fechamodif = SYSDATE ' +
                  ' WHERE pl_id = ' + SqlValue(sdqPagoLegal.FieldByName('PL_ID').AsInteger)
                  , tmNone);

    // Desasigno el pago en legales.lir_importesreguladosjuicio
    EjecutarSqlST('UPDATE legales.lir_importesreguladosjuicio ' +
                  '   SET ir_nropago = NULL ' +
                  ' WHERE ir_nropago = ' + SqlValue(sdqPagoLegal.FieldByName('PL_ID').AsInteger)
                  , tmNone);
  end
  else if sdqPagoLegal.FieldByName('PL_ESTADO').AsString = 'E' then begin
    // Agrego el registro de movimiento contrario
    IdPago  := GetSecNextVal('LEGALES.seq_lpl_id');
    NumPago := Get_ProxNumPagoLegal(FIdJuicioEnTramite);

    EjecutarSqlST('INSERT INTO legales.lpl_pagolegal ' +
                  '(pl_id, pl_numpago, pl_fechapago, pl_conpago, ' +
                  ' pl_fechaemision, pl_cuitcuil, pl_letrafactura, ' +
                  ' pl_situacionfactura, pl_numerofactura, pl_fechafactura, ' +
                  ' pl_importepago, pl_formapago, pl_comentario, ' +
                  ' pl_estado, pl_fechavencimiento, pl_usuarioaprobado, ' +
                  ' pl_fechaaprobado, pl_importeconretencion, pl_chequenombre, ' +
                  ' pl_idjuicioentramite, pl_idtipooperacion, ' +
                  ' pl_movimientooperacion, pl_idbeneficiariopago, ' +
                  ' pl_detallebeneficiario, pl_fechavencimientopago, pl_paguesea, ' +
                  ' pl_iddetallebeneficiario, pl_idembargo, ' +
                  ' pl_nrofacturagenrada, pl_usualta, pl_fechaalta) ' +
                  ' SELECT ' + SqlValue (IdPago) + ', ' + SqlValue (NumPago) + ', ' +
                  '        pl_fechapago, pl_conpago, ' +
                  '        pl_fechaemision, pl_cuitcuil, pl_letrafactura, ' +
                  '        lPad(pl_idbeneficiariopago, 2, ''0'') || lPad(pl_iddetallebeneficiario, 2, ''0''), ' +
                  '        lPad(pl_idjuicioentramite, 6, ''0'') || lPad(' + SqlValue (NumPago) + ', 2, ''0''), ' +
                  '        pl_fechafactura, ' +
                  '        nvl(pl_importepago, 0) * -1, pl_formapago, pl_comentario, ' +
                  '        ''E'', pl_fechavencimiento, ' + SqlValue(Sesion.LoginName) + ', ' +
                  '        SYSDATE, NVL(pl_importeconretencion,0) * -1, pl_chequenombre, ' +
                  '        pl_idjuicioentramite, pl_idtipooperacion, ' +
                  '        pl_movimientooperacion, pl_idbeneficiariopago, ' +
                  '        pl_detallebeneficiario, pl_fechavencimientopago, pl_paguesea, ' +
                  '        pl_iddetallebeneficiario, pl_idembargo, ' +
                  '        pl_nrofacturagenrada, ' + SqlValue(Sesion.LoginName) + ', SYSDATE ' +
                  '   FROM legales.lpl_pagolegal ' +
                  '  WHERE pl_id = ' + sdqPagoLegal.FieldByName('pl_id').AsString);

    // Cancelo el pago
    EjecutarSqlST('UPDATE legales.lpl_pagolegal ' +
                  '   SET pl_estado = ''X'', ' +
                  '       pl_usumodif = ' + SqlValue (Sesion.LoginName) + ', ' +
                  '       pl_fechamodif = SYSDATE ' +
                  ' WHERE pl_id = ' + SqlValue(sdqPagoLegal.FieldByName('pl_id').AsInteger)
                  , tmNone);

    // Desasigno el pago en legales.lir_importesreguladosjuicio
    EjecutarSqlST('UPDATE legales.lir_importesreguladosjuicio ' +
                  '   SET ir_nropago = NULL ' + //+ SqlValue (IdPago) +
                  ' WHERE ir_nropago = ' + SqlValue(sdqPagoLegal.FieldByName('pl_id').AsInteger)
                  , tmNone);

    if sdqPagoLegal.FieldByName('pl_conpago').AsInteger = CONPAGO_RECEXTR then
      // Inserto en la lar_aplicacionrecursoext..
      DoInsertarAplicacionRecExtraordinario(sdqPagoLegal.FieldByName('pl_importepago').AsFloat, sdqPagoLegal.FieldByName('pl_idjuicioentramite').AsInteger, True);

    if sdqPagoLegal.FieldByName('pl_conpago').AsInteger = CONPAGO_EMBARGO then
      // Inserto en la lae_aplicacionembargo..
      DoInsertarAplicacionEmbargo(sdqPagoLegal.FieldByName('pl_importepago').AsFloat, sdqPagoLegal.FieldByName('pl_idembargo').AsInteger, True);
  end
  else InvalidMsg(dbgPagosEfectuados, 'No se puede cancelar un pago en este estado.', 'Cancelaci�n de Pago');

  sdqPagoLegal.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
  sdqPagoLegal.Refresh;
end;

procedure TfrmAdminstracionJuicio.tbImprimirPagosClick(Sender: TObject);
begin
  if sdqPagoLegal.IsEmpty then
    Exit;

  if (sdqPagoLegal.FieldByName('pl_duplicado').AsString = 'S') and
     sdqPagoLegal.FieldByName('pl_estadoduplicidad').IsNull then
  begin
    MsgBox('El pago est� pendiente de aprobacion por duplicado.' + #13 +
           'No puede imprimirse su liquidaci�n.', MB_ICONERROR + MB_OK);
    Exit;
  end;

  if (sdqPagoLegal.FieldByName('pl_estadoduplicidad').AsString = 'R') then
  begin
    MsgBox('El pago est� Rechazado.' + #13 +
           'No puede imprimirse su liquidaci�n.', MB_ICONERROR + MB_OK);
    Exit;
  end;

  if (sdqPagoLegal.FieldByName('pl_estado').AsString = 'A') or
     (sdqPagoLegal.FieldByName('pl_estado').AsString = 'X') then
  begin
    MsgBox('El pago est� dado de baja.' + #13 +
           'No puede imprimirse su liquidaci�n.', MB_ICONERROR + MB_OK);
    Exit
  end;

  with TfrmImpresionConceptoPago.Create(self) do
  try
    Tipo   := tJuicio;
    IdPago := sdqPagoLegal.FieldByName('pl_id').AsInteger;

    Imprimir;
  finally
    free;
  end;

  sdqPagoLegal.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
  sdqPagoLegal.Refresh
end;

procedure TfrmAdminstracionJuicio.tbObtenerEstadoPagoClick(Sender: TObject);
begin
  CargarFinancialsDatosPago;
end;

// Acceso

{procedure TfrmAdminstracionJuicio.tbNuevoAccesoClick(Sender: TObject);
begin
  AltaAcceso;
end;
}
{
procedure TfrmAdminstracionJuicio.tbModificarAccesoClick(Sender: TObject);
begin
  ModificacionAcceso;
end;
}
{
procedure TfrmAdminstracionJuicio.tbEliminarAccesoClick(Sender: TObject);
begin
  if (not sdqNivelAccesoJuicio.IsEmpty) and
      sdqNivelAccesoJuicio.FieldByName('nj_fechabaja').IsNull and
      (MsgBox('�Desea dar de baja el nivel seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    EjecutarSqlST('UPDATE legales.lnj_nivelaccesojuicio ' +
                  '   SET nj_fechabaja = SYSDATE, ' +
                  '       nj_usubaja = ' + SqlValue(Sesion.LoginName) +
                  ' WHERE nj_id = ' + sdqNivelAccesoJuicio.FieldByName('nj_id').AsString);

    sdqNivelAccesoJuicio.Refresh;
  end;
end;
}
{procedure TfrmAdminstracionJuicio.btnAceptarAccesoClick(Sender: TObject);
begin
  GuardarAcceso;
  fpNivelAccesoUsuario.Close;
end;
}
// Reservas

procedure TfrmAdminstracionJuicio.chkReservaHonorariosClick(
  Sender: TObject);
begin
  {if chkReservaHonorarios.Checked then
  begin
    if FReservasAprobadas then
    begin
      if (MessageDlg('Con esta operaci�n se obliga a reaprobar la reserva para este juicio.'+ #13+ #10+
                     '�Confirma la operaci�n?',
                     mtConfirmation, [mbYes, mbNo], 0) in [mrYes]) then begin
        FReservasAprobadas := false;
        DesaprobarReservas;
      end
      else Exit;
    end;
  end;      }
  HabilitarReservaHonorarios;
end;

procedure TfrmAdminstracionJuicio.chkReservaCapitalClick(Sender: TObject);
begin
  {if chkReservaCapital.Checked then
  begin
    if FReservasAprobadas then
    begin
      if (MessageDlg('Con esta operaci�n se obliga a reaprobar la reserva para este juicio.'+ #13+ #10+
                     '�Confirma la operaci�n?',
                     mtConfirmation, [mbYes, mbNo], 0) in [mrYes]) then begin
        FReservasAprobadas := false;
        DesaprobarReservas;
      end
      else Exit;
    end;
  end;     }
  HabilitarReservaCapital;
end;

procedure TfrmAdminstracionJuicio.tbCopiarCalculoClick(Sender: TObject);
begin
  if (ceReservaCapital.ReadOnly) or (ceReservaHonorarios.ReadOnly) then
  begin
    InvalidMsg(fraEstado.cmbDescripcion, 'El estado del juicio es terminado, no pueden modificarse las reservas', 'Modificaci�n Reservas', MB_ICONINFORMATION);
    Exit;
  end;

  if not FReservasAprobadas then
  begin
    CopiarValoresReservas;
  end else
  begin
    if (MessageDlg('Con esta operaci�n se obliga a reaprobar la reserva para este juicio.'+ #13+ #10+
                   '�Confirma la copia de las reservas calculadas?',
                   mtConfirmation, [mbYes, mbNo], 0) in [mrYes]) then
    begin
      DesaprobarReservas;
      CopiarValoresReservas;
    end;
  end;
end;

procedure TfrmAdminstracionJuicio.CopiarValoresReservas;
begin
  chkReservaCapital.Checked := true;
  chkReservaHonorarios.Checked := true;

end;

procedure TfrmAdminstracionJuicio.HabilitarReservaCapital;
begin
  if chkReservaCapital.Checked then
  begin
    ceReservaCapital.Enabled := true;
    ceReservaCapital.Color   := clWindow;
  end else
  begin
    ceReservaCapital.Enabled := false;
    ceReservaCapital.Color := clInactiveCaption;
  end;
end;

procedure TfrmAdminstracionJuicio.HabilitarReservaHonorarios;
begin
  if chkReservaHonorarios.Checked then
  begin
    ceReservaHonorarios.Enabled := true;
    ceReservaHonorarios.Color   := clWindow;
  end else
  begin
    ceReservaHonorarios.Enabled := false;
    ceReservaHonorarios.Color := clInactiveCaption;
  end;
end;

(* M�todo anterior
var
  Formulas : TFormulasReserva;
  IteracionCalculo : integer;
begin
  with dmLegales do
  begin
    sdqCalculoReservaJuicio.Close;
    sdqCalculoReservaJuicio.ParamByName('IdJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
    sdqCalculoReservaJuicio.Open;
    try
      // Se hace en dos pasadas para calcular primero la reserva de capital
      // y luego la reserva de honorarios.
      for IteracionCalculo := CALCULANDORESERVADECAPITAL to CALCULANDORESERVADEHONORARIOS do
      begin
        sdqCalculoReservaJuicio.First;
        while not sdqCalculoReservaJuicio.Eof do
        begin
          Formulas := GetFormula(sdqCalculoReservaJuicio.FieldByName('jt_idtipo').AsInteger,
                                 sdqCalculoReservaJuicio.FieldByName('rt_idreclamo').AsInteger);
          case IteracionCalculo of
            CALCULANDORESERVADECAPITAL   : AplicarFormula(trCapitalJuicio, Formulas.FormulaReservaCapital, sdqCalculoReservaJuicio.Fields);
            CALCULANDORESERVADEHONORARIOS: AplicarFormula(trHonorariosJuicio, Formulas.FormulaReservaHonorarios, sdqCalculoReservaJuicio.Fields);
          end;
          sdqCalculoReservaJuicio.Next;
        end;
      end;
    finally
      sdqCalculoReservaJuicio.Close;
      GetImporteReservasCalculadas;
    end;
  end;
end;
*)

{procedure TfrmAdminstracionJuicio.GetImporteReservasCalculadas;
var
 Q : TSDQuery;
begin
  Q := GetQuery('SELECT jt_reservahonorariocalculada, jt_reservacapitalcalculada FROM legales.ljt_juicioentramite WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite));
  try
    if Q.RecordCount > 0 then
    begin
      ceReservaCapitalCalculada.Value := Q.FieldByName('JT_RESERVACAPITALCALCULADA').AsCurrency;
      ceReservaHonorariosCalculada.Value := Q.FieldByName('JT_RESERVAHONORARIOCALCULADA').AsCurrency;
    end;
  finally
    Q.Free;
  end;
end;
}
{function TfrmAdminstracionJuicio.GetFormula(AIdTipoJuicio, AIdReclamo : integer) : TFormulasReserva;
var
 sdqFormula : TSDQuery;
 sSql : string;
 sSqlYReclamo : string;
 sSqlYTipoJuicio : string;
begin
  sSqlYTipoJuicio := ''; sSqlYReclamo := '';
  sSql := 'SELECT lfr.fr_id, lfr.fr_descripcion, lfr.fr_fechavigencia, lfr.fr_formulareservacapital, lfr.fr_formulareservahonorario, ' +
          '       lfj.fj_idtipojuicio, lfj.fj_idreclamo, lfr.fr_fechavigenciahasta FROM legales.lfr_formulareserva lfr, LEGALES.LFJ_FORMULARESERVAJUICIO lfj' +
          ' WHERE (lfr.fr_fechavigenciahasta >= SYSDATE OR ' +
          '        lfr.fr_fechavigenciahasta IS NULL)' +
          '   AND lfr.fr_id = lfj.fj_idformulareserva ' +
          '   AND lfr.fr_fechavigencia <= SYSDATE ';

  if AIdTipoJuicio > 0 then
    sSqlYTipoJuicio := ' AND  lfj.fj_idtipojuicio = '  + SqlValue(AIdTipoJuicio);

  if AIdReclamo > 0 then
    sSqlYReclamo    := ' AND lfj.fj_idreclamo = '  + SqlValue(AIdReclamo);

  //Busco una formula que coincida con tipo de juicio y reclamo
  //Si no existe, busco una formula que solo coincida en tipo de juicio.
  sdqFormula := GetQuery(sSql + sSqlYReclamo + sSqlYTipoJuicio);

  try
    if sdqFormula.RecordCount = 0 then
    begin
      sdqFormula.Free;
      sdqFormula := GetQuery(sSql + sSqlYTipoJuicio);
    end;

    if sdqFormula.RecordCount = 0 then
    begin
      sdqFormula.Free;
      sdqFormula := GetQuery(sSql + sSqlYReclamo);
    end;

    if sdqFormula.RecordCount > 0 then
    begin
      result.FormulaReservaCapital := sdqFormula.FieldByName('fr_formulareservacapital').AsString;
      result.FormulaReservaHonorarios := sdqFormula.FieldByName('fr_formulareservahonorario').AsString;
    end else
    begin
      result.FormulaReservaCapital := '';
      result.FormulaReservaHonorarios := '';
    end;
  finally
    sdqFormula.free;
  end;
end;
}
//procedure TfrmAdminstracionJuicio.tbRecalcularReservasClick(Sender: TObject);
//begin
//  CalcularReservas;
//end;

procedure TfrmAdminstracionJuicio.ceReservaCapitalChange(Sender: TObject);
begin
  DesaprobarReservas;
end;

procedure TfrmAdminstracionJuicio.ceReservaCapitalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Sender is TCurrencyEdit) and TCurrencyEdit(Sender).ReadOnly then
    InvalidMsg(fraEstado.cmbDescripcion, 'El estado del juicio es terminado, no pueden modificarse las reservas', 'Modificaci�n Reservas', MB_ICONINFORMATION);
end;

procedure TfrmAdminstracionJuicio.tbAprobarReservasClick(Sender: TObject);
begin
(*
  if not FReservasAprobadas then
  begin
   if (MessageDlg('�Confirma la aprobaci�n de las reservas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
   begin
      EjecutarSqlST('UPDATE legales.ljt_juicioentramite ' +
                    '   SET jt_fechaaprobacionreservas = ActualDate,' +
                    '       jt_fechaavisoreserva = NULL, ' +
                    '       jt_usuarioaprobacionreservas = ' + SqlValue(Sesion.LoginName) +
                    ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite), tmNone);
   end;
  end else InvalidHint(ceReservaCapital,'Las reservas ya se encuentran aprobadas.', 'Aprobaci�n de Reservas');
*)
end;

procedure TfrmAdminstracionJuicio.DesaprobarReservas;
begin
(*
  EjecutarSqlST('UPDATE legales.ljt_juicioentramite ' +
                '   SET jt_fechaaprobacionreservas = NULL, ' +
                '       jt_fechaavisoreserva = NULL, ' +
                '       jt_usuarioaprobacionreservas = NULL' +
                ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite), tmNone);
*)
end;


////////////////////////////////////////////////////////////////////////////////


procedure TfrmAdminstracionJuicio.tbDiaClick(Sender: TObject);
begin
  SetearIntervalo(0);
end;

procedure TfrmAdminstracionJuicio.SetearIntervalo(Index : Integer);
begin
  ProgramacionDiaria.Visible  := Index = 0;
  ProgramacionSemanal.Visible := Index = 1;
  ProgramacionMensual.Visible := Index = 2;
end;


procedure TfrmAdminstracionJuicio.tbAgendaClick(Sender: TObject);
begin
  SetearIntervalo(1);
end;

procedure TfrmAdminstracionJuicio.tbCalendarioClick(Sender: TObject);
begin
  SetearIntervalo(2)
end;

procedure TfrmAdminstracionJuicio.RecargarAbogadoAsignado;
var
 Q : TSDQuery;
begin
  Q := GetQuery('SELECT jt_idabogado, jt_fechaasign ' +
                '  FROM legales.ljt_juicioentramite ' +
                ' WHERE jt_id = ' + SqlValue(FIdJuicioentramite));
  try
   if Q.RecordCount > 0 then
   begin
     fraAbogadosPropios.Codigo := Q.FieldByName('jt_idabogado').AsString;
     edFECHAASIGNADO.Date := Q.FieldByName('jt_fechaasign').AsDateTime;
   end;
  finally
    Q.Free;
  end;
end;

procedure TfrmAdminstracionJuicio.GuardarAsignacionAbogado;
begin
  if edFECHAASIGNADO.Date > 0 then
    EjecutarStoreST('art.Legales.Set_ReasignacionAbogado( ' +
                 SqlInteger(FIdJuicioEnTramite) +  ', ' +
                 SqlInteger(fraAbogadosPropios.codigo) +  ', ' +
                 SqlDate(edFECHAASIGNADO.Date) +  ', ' +
                 SqlValue(Sesion.LoginName) +  '); ');
end;

function TfrmAdminstracionJuicio.AltaEvento : boolean;
begin
  LimpiarCamposEvento;
  FModoEventosSeguimientos := meAlta;
  FIdEventoJuicioEnTramite := -1;
  fraTipoEvento.ShowBajas := false;
  result :=  fpEventoSeguimiento.ShowModal = mrOK;
  sdqEventoJuicioEnTramite.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
  sdqEventoJuicioEnTramite.Refresh;
end;

procedure TfrmAdminstracionJuicio.GuardarEvento;
var
  textoareemplazar : String;
begin
  VerificarMultiple(['Administraci�n de Eventos',
                    edFechaEventoDesde,
                    edFechaEventoDesde.Date > 0,
                    'Debe especificar una fecha para el evento.',
                    edFechaEventoDesde,
                    edFechaEventoDesde.Date <= DBDate,
                    'La fecha para el evento no puede ser mayor que la actual.',
                    edFechaEventoDesde,
                    edFechaEventoDesde.Date >= edFECHANOTIFICACION.Date,
                    'La Fecha del evento no puede ser anterior a la fecha de notificaci�n del juicio.',
                    edFechaVencimientoEvento,
                    (edFechaVencimientoEvento.Date = 0) or
                    (edFechaVencimientoEvento.Date >= edFechaEventoDesde.Date) ,
                    'La fecha de vencimento del evento no puede ser anterior a la fecha del evento.',
                    edFechaVencimientoEvento,
                    (edFechaVencimientoEvento.Date = 0) or
                    (edFechaVencimientoEvento.Date >= edFECHANOTIFICACION.Date),
                    'La Fecha del evento no puede ser anterior a la fecha de notificaci�n del juicio.',
                    fraTipoEvento,
                    not fraTipoEvento.IsBaja,
                    'Debe seleccionar un Tipo de Reclamo activo',
                    fraTipoEvento,
                    fraTipoEvento.IsSelected,
                    'Debe seleccionar un Tipo de Reclamo']);

  if FModoEventosSeguimientos = meAlta then
  begin
    FIdEventoJuicioEnTramite := ValorSql('SELECT legales.seq_let_id.nextval FROM DUAL');
    EjecutarSqlST(' INSERT INTO legales.let_eventojuicioentramite ' +
                  ' (et_id, et_idjuicioentramite, et_fechaevento, ' +
                  '  et_fechavencimiento, ' +
                  '  et_idtipoevento, et_usualta, et_fechaalta) ' +
                  ' VALUES (' + SqlValue(FIdEventoJuicioEnTramite) + ', ' +
                              SqlValue(FIdJuicioEnTramite) + ', ' +
                              SqlDate(edFechaEventoDesde.Date) + ', ' +
                              SqlDate(edFechaVencimientoEvento.Date) + ', ' +
                              SqlValue(strtoint(fraTipoEvento.Codigo))   + ', ' +
                              SqlValue(Sesion.LoginName) + ', SYSDATE)')
  end
  else
    EjecutarSqlST('UPDATE legales.let_eventojuicioentramite ' +
                  '   SET et_fechaevento =        ' + SqlValue(edFechaEventoDesde.Date)        + ' , ' +
                  '       et_fechavencimiento =   ' + SqlValue(edFechaVencimientoEvento.Date)  + ' , ' +
                  '       et_idtipoevento =       ' + SqlValue(strtoint(fraTipoEvento.Codigo)) + ' , ' +
                  '       et_usumodif =           ' + SqlValue(Sesion.LoginName) + ' , ' +
                  '       et_fechamodif = SYSDATE ' +
                  ' WHERE et_id = ' + SqlValue(FIdEventoJuicioEnTramite));

  textoareemplazar := mObservacionesEvento.Text;
  ReplaceString( textoareemplazar,'<','');
  ReplaceString( textoareemplazar,'>','');
  mObservacionesEvento.Text := textoareemplazar;

  SaveBlob('SELECT et_observaciones ' +
           '  FROM legales.let_eventojuicioentramite ' +
           ' WHERE et_id = ' + SqlValue(FIdEventoJuicioEnTramite),
           'UPDATE legales.let_eventojuicioentramite' +
           '   SET et_observaciones = :et_observaciones ' +
           ' WHERE et_id = ' + SqlValue(FIdEventoJuicioEnTramite),
           'et_observaciones', mObservacionesEvento.Lines);
          
  cdsArchivosAsociados.First;
  while not cdsArchivosAsociados.Eof do
  begin
    if cdsArchivosAsociados.FieldByName('STATE').AsString = 'I' then
    begin
      EjecutarSqlST('INSERT INTO legales.lea_eventoarchivoasociado ' +
                    ' (ea_id, ea_descripcion, ea_patharchivo, ' +
                    '  ea_ideventojuicioentramite, ea_usualta, ea_fechaalta) ' +
                    'VALUES (' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger) + ',  ' +
                                 SqlValue(cdsArchivosAsociados.FieldByName('DESCRIPCION').AsString) + ', ' +
                                 SqlValue(cdsArchivosAsociados.FieldByName('PATHARCHIVO').AsString) + ', ' +
                                 SqlValue(FIdEventoJuicioEnTramite) + ',' +
                                 SqlValue(Sesion.LoginName) + ', SYSDATE)');
    end;
    cdsArchivosAsociados.Next;
  end;
  sdqEventoJuicioEnTramite.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
  sdqEventoJuicioEnTramite.Refresh;

  fpEventoSeguimiento.Close;
end;

procedure TfrmAdminstracionJuicio.LimpiarCamposEvento;
begin
  fraTipoEvento.Codigo := '';
  edFechaEventoDesde.Date := 0;
  edFechaVencimientoEvento.Date := 0;;
  mObservacionesEvento.Lines.Clear;
  edtArchivosAsociados.Text := '';
//  edFechaEventoDesde.MaxDate := DBDate;
end;

procedure TfrmAdminstracionJuicio.CargarDatosEvento(Campos : TFields);
begin
  fraTipoEvento.ShowBajas       := true;
  fraTipoEvento.ExtraCondition := ' AND te_etapa LIKE ''%J%'' AND (TE_FECHABAJA IS NULL OR te_id = '+
                                    sqlvalue(Campos.FieldByName('et_idtipoevento').AsString)+' )';
  fraTipoEvento.Codigo          := Campos.FieldByName('et_idtipoevento').asstring;
  fraTipoEvento.ShowBajas       := fraTipoEvento.IsBaja;
  edFechaEventoDesde.Date       := Campos.FieldByName('et_fechaevento').AsDateTime;
  edFechaVencimientoEvento.Date := Campos.FieldByName('et_fechavencimiento').AsDateTime;
  mObservacionesEvento.Text     := Campos.FieldByName('et_observaciones').AsString;

  CargarArchivos;

  edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                               ' Archivos Asociados.';
end;

procedure TfrmAdminstracionJuicio.CargarArchivos;
var
 i : integer;
begin
  try
    sdqArchivosAsociados.ParamByName('IdEventoJuicioEnTramite').AsInteger := FIdEventoJuicioEnTramite;
    sdqArchivosAsociados.Open;
    cdsArchivosAsociados.EmptyDataSet;
    if not (FModoEventosSeguimientos = meAlta) then
    begin
      while not sdqArchivosAsociados.Eof do
      begin
        cdsArchivosAsociados.Append;

        for i := 0 to sdqArchivosAsociados.Fields.count - 1 do
          cdsArchivosAsociados.fields[i].Value := sdqArchivosAsociados.Fields[i].Value;

        cdsArchivosAsociados.FieldByName('STATE').AsString := 'V';
        cdsArchivosAsociados.Post;
        sdqArchivosAsociados.Next;
      end;
    end;
  finally
    sdqArchivosAsociados.Close;
  end;
end;

procedure TfrmAdminstracionJuicio.CargarArchivosPericias;
var
 i : integer;
begin
  try
    sdqArchivosAsociadosPericias.ParamByName('idpericias').AsInteger := FIdPericia;
    sdqArchivosAsociadosPericias.Open;
    cdsArchivosAsociadosPericias.EmptyDataSet;
    if not (FModoPeritaje = meAlta) then
    begin
      while not sdqArchivosAsociadosPericias.Eof do
      begin
        cdsArchivosAsociadosPericias.Append;

        for i := 0 to sdqArchivosAsociadosPericias.Fields.count - 1 do
          cdsArchivosAsociadosPericias.fields[i].Value := sdqArchivosAsociadosPericias.Fields[i].Value;

        cdsArchivosAsociadosPericias.FieldByName('STATE').AsString := 'V';
        cdsArchivosAsociadosPericias.Post;
        sdqArchivosAsociadosPericias.Next;
      end;
    end;
  finally
    sdqArchivosAsociadosPericias.Close;
  end;
end;

procedure TfrmAdminstracionJuicio.MostrarArchivosAsociados;
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    if (FModoEventosSeguimientos = meAlta) then
      cdsArchivosAsociados.EmptyDataSet;

      CargarArchivosAsociados(FIdJuicioEnTramite, FIdEventoJuicioEnTramite, cdsArchivosAsociados);
      RecargarArchivosAsociados(cdsArchivosAsociados);
      edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                   ' Archivos Asociados.';
  finally
    Free;
  end;
end;

procedure TfrmAdminstracionJuicio.MostrarArchivosAsociadosPericias;
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    if (FModoPeritaje = meAlta) then
      cdsArchivosAsociadosPericias.EmptyDataSet;

      CargarArchivosAsociadosPericias(FIdJuicioEnTramite, FIdPericia, cdsArchivosAsociadosPericias);
      RecargarArchivosAsociados(cdsArchivosAsociados);
      edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                   ' Archivos Asociados.';
  finally
    Free;
  end;
end;

procedure TfrmAdminstracionJuicio.AltaTarea;
begin
  LimpiarCamposTareas;
  FModoTarea := meAlta;
  EditarProgramacion(self.FAppt);
  fpTareas.ShowModal;
end;

procedure TfrmAdminstracionJuicio.ModificacionTarea;
begin
  If Assigned(ProgramacionDiaria.SelAppt) Then
  Begin
    self.FAppt := TApptTareas(ProgramacionDiaria.SelAppt);
    EditarProgramacion(self.FAppt);
    FModoTarea := meModificacion;
    fpTareas.ShowModal;
  End
end;

procedure TfrmAdminstracionJuicio.LimpiarCamposTareas;
begin
  dtcFechaProgramacion.Text := '';
  teHoraDesde.Time := EncodeTime(8,0,0,0);
  teHoraHasta.Time := EncodeTime(8,0,0,0);
  fraTareas.Codigo := '';
  fraHechos.Codigo := '';
  mDescripcionTarea.Text := '';
  mDescripcionResultadoTarea.text := '';
  chkAlarmaActivada.Checked := false;
  ceMinutosAviso.Value := 0;
end;

{procedure TfrmAdminstracionJuicio.VistaTarea(Vista : TVistaTarea);
begin
   ProgramacionDiaria.Visible := Vista = vtDiaria;
//   ProgramacionSemanal.Visible := Vista = vtSemanal;
//   ProgramacionMensual.Visible := Vista = vtMensual;
end;}

procedure TfrmAdminstracionJuicio.EditarProgramacion(var Appt : TApptTareas);
var
  ApptStartDate,
  ApptEndDate : TDate;
  ApptStartTime,
  ApptEndTime : TTime;
begin
  If Assigned(Appt) Then
  Begin
    dtcFechaProgramacion.Date := Appt.StartDate;
    teHoraDesde.Time := Appt.StartTime;
    teHoraHasta.Time := Appt.EndTime;
    chkAlarmaActivada.Checked := Appt.AlarmEnabled;
    ceMinutosAviso.Text := IntToStr(Appt.AlarmAdvance);
    udMinutosAviso.Position := Appt.AlarmAdvance;
    mDescripcionTarea.Text := Appt.Description;
    mDescripcionResultadoTarea.Text := Appt.DescripcionResultado;
    chkCompletado.Checked := Appt.Completado;
    fraTareas.Codigo := InttoStr(Appt.TipoTarea);
    fraHechos.Codigo := InttoStr(Appt.TipoHecho);
   End
  Else Begin
    Appt := TApptTareas.Create(Schedule,'');
    Appt.Persistent := True;
    If ProgramacionDiaria.ValidSelection Then
    Begin
      ApptStartDate := ProgramacionDiaria.Cols[ProgramacionDiaria.SelStart.X].SchedDate;
      ApptEndDate := ProgramacionDiaria.Cols[ProgramacionDiaria.SelEnd.X].SchedDate;
      ApptStartTime := ProgramacionDiaria.RowToTime(ProgramacionDiaria.SelStart.Y);
      ApptEndTime := ProgramacionDiaria.RowEndTime(ProgramacionDiaria.SelEnd.Y);
    End
    Else
    Begin
      ApptStartDate := Date;
      ApptEndDate := Date;
      ApptStartTime := Time;
      ApptEndTime := ApptStartTime +
                     EncodeTime(0, ProgramacionDiaria.Granularity - 1, 0, 0) +
                     EncodeTime(0, 1, 0, 0);
    End;
    Appt.BeginUpdate;
    Appt.SetStartEnd(ApptStartDate, ApptStartTime, ApptEndDate, ApptEndTime);
    Appt.AlarmEnabled := True;
    Appt.AlarmAdvance := 15;
  End;
  CargarDatosTareas(Appt);
end;

procedure TfrmAdminstracionJuicio.ScheduleLoadBatch(Sender: TObject;
  BatchName: String; BatchStartDate, BatchEndDate: TDate);
var
  Appt : TApptTareas;
  NewAppt : Boolean;
begin
  With sdqTareas do
  Begin
    ParamByName('FechaDesde').AsDate := BatchStartDate;
    ParamByName('FechaHasta').AsDate := BatchEndDate;
    ParamByName('IdJuicioEnTramite').AsInteger := FIdJuicioEnTramite;

    Open;
    While not EOF do
    Begin
      Schedule.RequestAppt(FieldByName('ja_appid').AsString, TjvTFAppt(Appt), NewAppt);

      If NewAppt Then
      Begin
        // La clase TJvTFAppt y la Clase TJvTFScheduleManager dejan pocas opciones para extender la primera.
        // Si TApptTareas de TJvTFAppt el m�todo de TJvTFScheduleManager RequestAppt devuelve siempre TjvTFAppt en caso
        // de que ser un appoinment nuevo. La unica salida posible fue liberarlo y crearlo como corresponde.
        //
        Appt.Free;
        Appt := TApptTareas.Create(Schedule,'');
        Appt.SetStartEnd(FieldByName('ja_fechainicio').AsDateTime,
                         FieldByName('ja_fechainicio').AsDateTime,
                         FieldByName('ja_fechafin').AsDateTime,
                         FieldByName('ja_fechafin').AsDateTime);
        Appt.Description := FieldByName('ja_descripcionevento').AsString;
        Appt.AlarmEnabled := FieldByName('ja_alarmaactivada').AsString = 'S';
        Appt.AlarmAdvance := FieldByName('ja_alarma').AsInteger;
        Appt.Completado :=  FieldByName('ja_completado').AsString = 'S';
        Appt.DescripcionResultado :=  FieldByName('ja_resultadoevento').AsString;
        Appt.TipoTarea := FieldByName('ja_idtipotarea').AsInteger;
        Appt.TipoHecho := FieldByName('ja_idhecho').AsInteger;
        if not FieldByName('ja_appid').IsNull then
          Appt.FID := FieldByName('ja_appid').AsString;
        Appt.AddSchedule(IntToStr(FIdJuicioEnTramite));

      End;
      Next;
    End;
    Close;
  End;
end;

procedure TfrmAdminstracionJuicio.dtcFechaActualVisualizacionChange(
  Sender: TObject);
begin
  ProgramacionDiaria.GotoDate(dtcFechaActualVisualizacion.Date);
  mcCalendario.DateFirst := dtcFechaActualVisualizacion.Date;
//  ProgramacionSemanal.DisplayDate := dtcFechaActualVisualizacion.Date;
end;

procedure TfrmAdminstracionJuicio.CargarDatosTareas(Appt : TApptTareas);
begin
  if Assigned(Appt) then
  begin
    dtcFechaProgramacion.Date := Appt.StartDate;
    teHoraDesde.time := appt.StartTime;
    teHoraHasta.Time := appt.EndTime;

    mDescripcionTarea.Text := appt.Description;
    mDescripcionResultadoTarea.Text := appt.DescripcionResultado;

    fraTareas.Codigo := inttostr(appt.TipoTarea);
    fraHechos.Codigo := inttostr(appt.TipoHecho);

    chkCompletado.Checked := appt.Completado;
    chkAlarmaActivada.Checked := appt.AlarmEnabled;
    ceMinutosAviso.Value := appt.AlarmAdvance;
    udMinutosAviso.Position := appt.AlarmAdvance;
  end;
end;

{ TApptTareas }

procedure TfrmAdminstracionJuicio.ScheduleDeleteAppt(Sender: TObject;
  Appt: TJvTFAppt);
begin
//  EjecutarSqlST('delete from legales.lja_juicioentramiteagenda where ja_appid = ' + SqlValue(Appt.ID));
  EjecutarSqlST('UPDATE legales.lja_juicioentramiteagenda ' +
                '   SET ja_fechabaja = SYSDATE, ' +
                '       ja_usubaja = ' + SqlValue(Sesion.LoginName) +
                ' WHERE ja_appid = ' + SqlValue(Appt.ID));
end;

procedure TfrmAdminstracionJuicio.SchedulePostAppt(Sender: TObject; Appt: TJvTFAppt);
begin
  try
//    BeginTrans(true);
    With sdqGetApptQuery do
    Begin
      ParamByName('appid').AsString := Appt.ID;
      Open;

      If RecordCount > 0 Then begin
        Edit;
        FieldByName('ja_fechamodif').AsDateTime := DBDateTime;
        FieldByName('ja_usumodif').AsString := Sesion.LoginName;
      end Else
      Begin
        Insert;
        FieldByName('ja_id').AsInteger := GetSecNextVal('LEGALES.SEQ_LJA_ID');
        FieldByName('ja_AppID').AsString := Appt.ID;
        FieldByName('ja_idNroJuicio').AsInteger := FIdJuicioEnTramite;
        FieldByName('ja_fechaalta').AsDateTime := DBDateTime;
        FieldByName('ja_usualta').AsString := Sesion.LoginName;
      End;

      FieldByName('ja_fechainicio').AsDateTime := Appt.StartDate + Appt.StartTime;
      FieldByName('ja_fechafin').AsDateTime := Appt.EndDate + Appt.EndTime;
      FieldByName('ja_descripcionevento').AsString := Appt.Description;

      if Appt.AlarmEnabled then
        FieldByName('ja_alarmaactivada').Asstring :=  'S'
      else
        FieldByName('ja_alarmaactivada').Asstring :=  'N';

      FieldByName('ja_alarma').AsInteger := Appt.AlarmAdvance;

      if  TApptTareas(Appt).Completado then
        FieldByName('ja_completado').AsString := 'S'
      else
        FieldByName('ja_completado').AsString := 'N';

      FieldByName('ja_resultadoevento').AsString := TApptTareas(Appt).DescripcionResultado;
      FieldByName('ja_idtipotarea').AsInteger    := TApptTareas(Appt).TipoTarea;
      FieldByName('ja_idhecho').AsInteger        := TApptTareas(Appt).TipoHecho;

      Post;
      ApplyUpdates;
    End;
  finally
    sdqGetApptQuery.close;
//    CommitTrans(true);
  end;
end;

procedure TfrmAdminstracionJuicio.ScheduleRefreshAppt(Sender: TObject;
  Appt: TJvTFAppt);
begin
  try
    Appt.ClearSchedules;
    With sdqGetApptQuery do
    Begin
      ParamByName('appid').AsString := Appt.ID;
      Open;
      If RecordCount = 1 Then
      Begin
        Appt.SetStartEnd(FieldByName('ja_fechainicio').AsDateTime,
                         FieldByName('ja_fechainicio').AsDateTime,
                         FieldByName('ja_fechafin').AsDateTime,
                         FieldByName('ja_fechafin').AsDateTime);
        Appt.Description := FieldByName('ja_descripcionevento').AsString;
        Appt.AlarmEnabled := FieldByName('ja_alarmaactivada').AsString = 'S';
        Appt.AlarmAdvance := FieldByName('ja_alarma').AsInteger;
        TApptTareas(Appt).Completado :=  FieldByName('ja_completado').AsString = 'S';
        TApptTareas(Appt).DescripcionResultado :=  FieldByName('ja_resultadoevento').AsString;
        TApptTareas(Appt).TipoTarea := FieldByName('ja_idtipotarea').AsInteger;
        TApptTareas(Appt).TipoHecho := FieldByName('ja_idhecho').AsInteger;
      End;
      Close;
    End;
    Appt.AddSchedule(IntToStr(FIdJuicioEnTramite));
  finally
    sdqGetApptQuery.Close;
  end;
end;

procedure TfrmAdminstracionJuicio.FormShow(Sender: TObject);
var
	sSql: String;
begin
  ProgramacionDiaria.Template.ActiveTemplate := agtLinear;
  ProgramacionDiaria.Template.LinearName := IntToStr(FIdJuicioEnTramite);
  ProgramacionDiaria.Template.LinearStartDate := dtcFechaActualVisualizacion.Date;

  sSql :=
    'SELECT SUM(total) ' +
      'FROM (SELECT em_importe ' +
                   '+ (SELECT NVL(SUM(ae_importe * ta_operacion), 0) ' +
                        'FROM lta_tipoaplicacionembargo, lae_aplicacionembargo ' +
                       'WHERE ta_id = ae_idtipoaplicacion ' +
                         'AND ae_fechabaja IS NULL ' +
                         'AND (   ta_generapago = ''S'' ' +
                              'OR ta_reintegroembargo = ''S'') ' +
                         'AND ae_idembargo = em_id) total ' +
              'FROM lem_embargo ' +
             'WHERE em_repetido = ''N'' ' +
               'AND em_fechabaja IS NULL ' +
               'AND em_idjuicio = :ID)';

  if ValorSqlExtendedEx(sSql, [FIdJuicioEnTramite]) > (ceReservaCapital.Value + ceReservaHonorarios.Value) then
  	InfoHint(edNroCarpeta, 'El total de la reserva no puede ser menor que el del embargo');
end;

procedure TfrmAdminstracionJuicio.mcCalendarioSelChange(Sender: TObject;
  StartDate, EndDate: TDateTime);
var
   Y, M, D: Word;
begin
  dtcFechaActualVisualizacion.Date := StartDate;
  With sdqTareas do
  Begin
    try
      ParamByName('FechaDesde').AsDate := mcCalendario.DateFirst;
      ParamByName('FechaHasta').AsDate := mcCalendario.DateLast;

      ParamByName('IdJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
      Open;
      While not EOF do
      Begin
        DecodeDate(FieldByName('ja_fechainicio').AsDateTime, Y, M, D);
        mcCalendario.Bold[Y,M,D]:= true;
        Next;
      end;
    finally
      close;
    end;
  end;
end;
{
procedure TfrmAdminstracionJuicio.AltaAcceso;
begin
  LimpiarCamposAcceso;
  FModoAcceso := meAlta;
  fpNivelAccesoUsuario.ShowModal;
end;
}
{
procedure TfrmAdminstracionJuicio.ModificacionAcceso;
begin
  if sdqNivelAccesoJuicio.RecordCount > 0 then
  begin
    LimpiarCamposAcceso;
    FModoAcceso := meModificacion;
    FIdAcceso := sdqNivelAccesoJuicio.Fields.FieldByName('nj_id').AsInteger;
    CargarDatosAcceso(sdqNivelAccesoJuicio.Fields);
    fpNivelAccesoUsuario.ShowModal;
  end;
end;
}
{
procedure TfrmAdminstracionJuicio.LimpiarCamposAcceso;
begin
  fraUsuarioAcceso.Limpiar;
  fraNivelesAcceso.Codigo := '';
end;
}
{
procedure TfrmAdminstracionJuicio.GuardarAcceso;
var
 Id : integer;
 UsuarioCargado : boolean;
begin
  if FModoAcceso = meModificacion then
    UsuarioCargado := sdqNivelAccesoJuicio.Locate('nj_idjuicioentramite;nj_usuario',VarArrayOf([FIdJuicioEnTramite,fraUsuarioAcceso.edCodigo.Text]),[])
  else
    UsuarioCargado := false;

  VerificarMultiple(['Guardando Acceso',
                     fraUsuarioAcceso,
                     fraUsuarioAcceso.edCodigo.Text,
                     'Debe especificar un usuario del �rea LEGALES.',
                     fraNivelesAcceso,
                     fraNivelesAcceso.Codigo <> '',
                     'Debe especificar un Nivel de Acceso',
                     fraUsuarioAcceso,
                     not UsuarioCargado,
                     'El usuario ya tiene permisos cargados']);

  if FModoAcceso = meAlta then begin
    Id := GetSecNextVal('LEGALES.seq_lnj_id');
    EjecutarSqlST('INSERT INTO legales.lnj_nivelaccesojuicio ('+
                  '  nj_id, nj_idjuicioentramite, nj_idnivelacceso, ' +
                  '  nj_usuario, nj_usualta, nj_fechaalta) ' +
                  'VALUES ( ' + SqlValue(Id) + ', ' +
                                SqlValue(FIdJuicioEnTramite) + ', ' +
                                SqlValue(StrToInt(fraNivelesAcceso.Codigo))  + ', ' +
                                SqlValue(fraUsuarioAcceso.edCodigo.Text) +  ', ' +
                                SqlValue(Sesion.LoginName) +
                                ', SYSDATE) ', tmNone);
  end
  else begin
    EjecutarSqlST('UPDATE legales.lnj_nivelaccesojuicio ' +
                  '   SET nj_idnivelacceso = ' +  SqlValue(StrToInt(fraNivelesAcceso.Codigo))  + ' , ' +
                  '       nj_usuario = ' +   SqlValue(fraUsuarioAcceso.edCodigo.text)  + ' , ' +
                  '       nj_usumodif = ' +  SqlValue(Sesion.LoginName)  + ' , ' +
                  '       nj_fechamodif = SysDate ' +
                  ' WHERE nj_id = ' + SqlValue(FIdAcceso));
  end;
  sdqNivelAccesoJuicio.Refresh;
end;
}
{procedure TfrmAdminstracionJuicio.CargarDatosAcceso(Campos : TFields);
begin
  fraUsuarioAcceso.Cargar(Campos.FieldByName('nj_usuario').AsString);
  fraNivelesAcceso.Codigo := Campos.FieldByName('nj_idnivelacceso').AsString;
end;}

procedure TfrmAdminstracionJuicio.GuardarInstanciaInicioJuicion(
  AIdJuicioEnTramite, AJurisdiccion, AFuero, AJuzgado, ASecretaria, AInstancia: integer;
  ANroExpediente, AAnioExpediente: string; ASinExpediente :Boolean;  AFechaIngreso : TDate; Ausuario : String);
begin
  EjecutarSqlST('INSERT INTO legales.lij_instanciajuicioentramite (          ' +
                'ij_id, ij_idjuicioentramite, ij_idjurisdiccion,  ' +
                'ij_idfuero, ij_idjuzgado, ij_idsecretaria, ij_idinstancia, ' +
                'ij_nroexpediente,ij_anioexpediente,IJ_SINEXPEDIENTE, ij_fechatraspaso,                           ' +
                'ij_idmotivocambiojuzgado, ij_observaciones, ij_usualta,    ' +
                'ij_fechaalta)                                              ' +
                'VALUES (legales.seq_lij_id.nextval, ' +
                SqlValue(AIdJuicioEnTramite) + ', ' +
                SqlValue(AJurisdiccion)  + ', ' +
                SqlValue(AFuero)  + ', ' +
                SqlValue(AJuzgado) + ', ' +
                SqlValue(ASecretaria) + ', 1, ' +
                SqlValue(ANroExpediente) + ', ' +
                SqlValue(AAnioExpediente) + ', ' +
                SqlBoolean(ASinExpediente) + ', ' +
                SqlValue(AFechaIngreso) + ', 1,''Inicio de la causa'', ' +
                SqlValue(AUsuario) + ' , Sysdate)');
end;

procedure TfrmAdminstracionJuicio.SeguridadDisableComponent(
  Component: TComponent; var Cancel: Boolean);
begin
  if (FModo = meAlta) and (Component = tbFijarSentencia) then
    tbFijarSentencia.Enabled := false;

  if (FModo = meAlta) and (Component = tbReasignarAbogado) then
    tbReasignarAbogado.Enabled := false;
end;

{procedure TfrmAdminstracionJuicio.LockControls(AControls: array of TControl; ALocked: boolean = True);
var
  i: integer;
begin
  for i := Low(AControls) to High(AControls) do
    AControls[i].Enabled := Not ALocked;
end;
}
procedure TfrmAdminstracionJuicio.CargarFinancialsDatosPago;
//var
//  sdqDatosInfoPago: TSDQuery;
//  Bookmark: TBookmarkStr;
//  sSql: String;
begin
(*
  IniciarEspera;
  try
    sdqPagoLegal.DisableControls;
    try
      Bookmark := sdqPagoLegal.Bookmark;
      try
          sdqPagoLegal.First;

          while not sdqPagoLegal.EOF do
          begin
            sSql := ' SELECT ce_ordenpago ordennro, ce_fechaop ordenfecha, ce_numero chequenro, ce_fechacheque chequefecha ' +
                    ' FROM rce_chequeemitido, legales.lpl_pagolegal ' +
                    ' WHERE ce_id = pl_idchequeemitido ' +
                    '    AND pl_id =  ' +  SqlValue(sdqPagoLegal.FieldByName( 'pl_id' ).AsInteger);

            sdqDatosInfoPago := GetQuery(sSql);
            try
              {------------------------------------}
              sdqPagoLegal.Edit;
              sdqPagoLegal.FieldByName( 'OrdenNro' ).Value    :=  sdqDatosInfoPago.FieldByName( 'OrdenNro' ).Value;
              sdqPagoLegal.FieldByName( 'OrdenFecha' ).Value  :=  sdqDatosInfoPago.FieldByName( 'OrdenFecha' ).Value;
              sdqPagoLegal.FieldByName( 'ChequeNro' ).Value   :=  sdqDatosInfoPago.FieldByName( 'ChequeNro' ).Value;
              sdqPagoLegal.FieldByName( 'ChequeFecha' ).Value :=  sdqDatosInfoPago.FieldByName( 'ChequeFecha' ).Value;
              sdqPagoLegal.Post;
              {------------------------------------}
              sdqDatosInfoPago.Close;
              sdqPagoLegal.Next;
            finally
              sdqDatosInfoPago.Free;
            end;
          end;
      finally
        sdqPagoLegal.Bookmark := Bookmark;
      end;
    finally
      sdqPagoLegal.EnableControls;
    end;
  finally
    DetenerEspera;
  end;
*)
end;

procedure TfrmAdminstracionJuicio.sdqPagoLegalAfterScroll(
  DataSet: TDataSet);
begin
//  tbAprobacionPagos.Enabled := (sdqPagoLegal.FieldByName('PL_ESTADO').AsString = 'C') and
//                               (FNivelAccesoUsuario = NIVELALTO);
//  tbImprimirPagos.Enabled := (sdqPagoLegal.FieldByName('PL_ESTADO').AsString = 'C')
end;

procedure TfrmAdminstracionJuicio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (ModalResult <> mrOk) then
  begin
    if (MessageDlg('Se descartar�n todas las modificaciones realizadas. �Continua?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      RollBackUpdates
    else
      CanClose := false
  end;
end;

procedure TfrmAdminstracionJuicio.dbgEventosJuicioEnTramiteDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not sdqEventoJuicioEnTramite.FieldByName('et_fechabaja').IsNull Then
    dbgEventosJuicioEnTramite.Canvas.Font.Color := clRed;
end;

procedure TfrmAdminstracionJuicio.dbgOrigenDemandaGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName('od_fechabaja').IsNull Then
    AFont.Color := clRed;
end;

procedure TfrmAdminstracionJuicio.dbgEventosJuicioEnTramiteGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName('ET_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;

procedure TfrmAdminstracionJuicio.dbgPeritajesGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName('pj_fechabaja').IsNull Then
    AFont.Color := clRed;
end;

procedure TfrmAdminstracionJuicio.dbgPagosEfectuadosGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if (Field.DataSet.FieldByName('pl_estado').AsString = 'A') or
     (Field.DataSet.FieldByName('pl_estado').AsString = 'X') then
    AFont.Color := clRed
  else begin
    if (Field.DataSet.FieldByName('pl_importepago').AsFloat < 0) or
       (Field.DataSet.FieldByName('pl_importeconretencion').AsFloat < 0) then
      AFont.Color := clBlue
  end;
  if (Field.DataSet.FieldByName('pl_duplicado').AsString = 'S') then
    Background := clGreen;
end;

{procedure TfrmAdminstracionJuicio.sdqNivelAccesoJuicioAfterScroll(
  DataSet: TDataSet);
begin
  tbEliminarAcceso.Enabled := ((sdqNivelAccesoJuicio.RecNo = 1) and
                               (sdqNivelAccesoJuicio.RecordCount > 1));
end;
}
procedure TfrmAdminstracionJuicio.tbHistoricoReservasClick(
  Sender: TObject);
begin
  TfrmHistoricoReservas.MostrarHistorico(FIdJuicioEnTramite);
end;

procedure TfrmAdminstracionJuicio.MostrarDictamen(ADictamen : String);
begin
  if IsEmptyString(ADictamen) then
  begin
    mDictamen.Visible := false;
    lblDictamen.Visible := false;
    mSentencia.Height := 80
  end else
  begin
    mDictamen.Visible := true;
    lblDictamen.Visible := true;
    mSentencia.Height := 40;
    sdqDictamenAcusatorio.ParamByName('nrodictamen').AsString := ADictamen;
    sdqDictamenAcusatorio.Open;
    if sdqDictamenAcusatorio.RecordCount > 0 then
       mDictamen.Text := sdqDictamenAcusatorio.FieldByName('Dictamen').AsString;
  end;
end;

function TfrmAdminstracionJuicio.ModificacionEvento : boolean ;
begin
  result := false;
  if sdqEventoJuicioEnTramite.RecordCount > 0 then
  begin
   LimpiarCamposEvento;
   FModoEventosSeguimientos := meModificacion;
   FIdEventoJuicioEnTramite := sdqEventoJuicioEnTramite.Fields.FieldByName('et_id').AsInteger;
   CargarDatosEvento(sdqEventoJuicioEnTramite.Fields);
   result :=  fpEventoSeguimiento.ShowModal = mrOK;
   sdqEventoJuicioEnTramite.ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
   sdqEventoJuicioEnTramite.Refresh;
  end;
end;

procedure TfrmAdminstracionJuicio.pgDetallesJuicioChange(Sender: TObject);
begin
	case pgDetallesJuicio.ActivePageIndex of
  	0:
    begin
    	with sdqOrigenDemanda do
      	if not Active then
        begin
        	ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
          Open;
        end;
    end;
		2:
    begin
        // ESta sobreescrito en Parte Demandada y actora
    end;
		3:
  	begin
    	ProgramacionDiaria.GotoDate(dtcFechaActualVisualizacion.Date);
    end;
  	4:
    begin
    	with sdqPericiasJuicios do
      	if not Active then
        begin
        	ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
          Open;
        end;
    end;
  	5:
    begin
    	//CalcularReservas;
    end;
  	6:
    begin
    	with sdqPagoLegal do
      	if not Active then
        begin
        	ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
          Open;
        end;
    end;
  	7:
    begin
     {	with sdqNivelAccesoJuicio do
        if not Active then
        begin
          ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
          Open;
        end;}
    end;
  	8:
    begin
    	with sdqEmbargos do
      	if not Active then
        begin
          ParamByName('idJuicio').AsInteger := FIdJuicioEnTramite;
          Open;
        end;
    end;
  	9:
    begin
    	with sdqRecExtraord do
      	if not Active then
        begin
          ParamByName('idJuicio').AsInteger := FIdJuicioEnTramite;
          Open;
        end;
      CalcTotales;
    end;
  end;
end;

procedure TfrmAdminstracionJuicio.CambiarDatosElevacionJuicio;
var
  Qry : TSDQuery;
begin
  Qry := GetQuery('SELECT * FROM legales.ljt_juicioentramite WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite));
  try
    if Qry.RecordCount > 0 then
    begin
      fraDatosJuzgado.cbSinExpediente.Visible := True;
      fraDatosJuzgado.Init(PERMITIREXPEDIENTE, PERMITIRINSTANCIAS);
      fraDatosJuzgado.Cargar(Qry.FieldByName('JT_IDJURISDICCION').AsInteger,
                             Qry.FieldByName('JT_IDFUERO').AsInteger,
                             Qry.FieldByName('JT_IDJUZGADO').AsInteger,
                             Qry.FieldByName('JT_IDSECRETARIA').AsInteger);
      fraDatosJuzgado.Expediente := Qry.FieldByName('JT_EXPEDIENTE').AsString;
      fraDatosJuzgado.NroExpediente := Qry.FieldByName('JT_NROEXPEDIENTE').AsString;
      fraDatosJuzgado.AnioExpediente := Qry.FieldByName('JT_ANIOEXPEDIENTE').AsString;
      fraDatosJuzgado.SinExpediente := Qry.FieldByName('jt_sinexpediente').AsString = 'S';
      fraDatosJuzgado.FechaIngreso := Qry.FieldByName('jt_fechaingreso').AsDateTime;
    end
    else raise Exception.Create('Faltan cargar los datos del juzgado');

    Caption := LJT_GESTION_MODIF;
    FMediacion := false;
    fraEstado.ExtraCondition := ' and EJ_ETAPA LIKE ''%J%''';
    psSentenciaMediacion.ActivePageIndex := 0;
    tbElevacionAJuicio.Enabled := false;
    VCLExtra.LockControls(fraDatosJuzgado, false);
    fraDatosJuzgado.Enabled := true;

  finally
    Qry.Close;
    Qry.Free;
  end;
end;

procedure TfrmAdminstracionJuicio.GuardarCambioEstado;
begin
//  if (FModo <> meAlta) then
  EjecutarStoreST('art.Legales.Set_CambioEstado( ' +
               SqlInteger(FIdJuicioEnTramite) +  ', ' +
               SqlInteger(fraEstado.Value) +  ', ' +
               SqlDate(DBDateTime) +  ', ' +
               SqlValue(Sesion.LoginName) +  '); ');
end;

procedure TfrmAdminstracionJuicio.RecargarArchivosAsociados(
  cdsArchivosAsociados: TClientDataSet);
begin
  cdsArchivosAsociados.First;
  while not cdsArchivosAsociados.Eof do
  begin
    if cdsArchivosAsociados.FieldByName('STATE').AsString = 'D' then
    begin
      EjecutarSqlST('UPDATE legales.lea_eventoarchivoasociado ' +
                    '   SET ea_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       ea_fechabaja = SYSDATE' +
                    ' WHERE ea_id = ' + SqlValue(cdsArchivosAsociados.FieldByName('ID').AsInteger));

      cdsArchivosAsociados.Delete;


    end
    else cdsArchivosAsociados.Next;
  end;
end;

procedure TfrmAdminstracionJuicio.GuardarCambioReserva;
begin
{
    EjecutarStoreST('art.Legales.Set_CambioReserva( ' +
                 SqlInteger(FIdJuicioEnTramite) +  ', ' +
                 SqlNumber(ceReservaCapital.FloatValue, false) +  ', ' +
                 SqlNumber(ceReservaHonorarios.FloatValue, false) +  ', ' +
                 'null, null, ' +
                 SqlValue(FReservasAprobadasInicial) +  ', ' +
                 SqlString(Sesion.LoginName, true) +  '); ');
}
end;

procedure TfrmAdminstracionJuicio.ValidarDemanda;
var
  vSalario: real;
begin
{
  if (ValorSql('SELECT COUNT(*) FROM legales.let_eventojuicioentramite ' +
               ' WHERE et_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite) +
               '   AND et_idtipoevento = ' + SqlValue(TIPO_EVENTO_CONTESTA_DEMANDA) +
               '   AND et_fechaevento = ' + SqlValue(edFECHANOTIFICACION.Date)) = 0) then
  begin
    InvalidMsg(dbgOrigenDemanda, 'Debe agregar un evento con la fecha de notificaci�n del tipo contestaci�n de la demanda.', 'Guardar Juicio');
    abort;
  end;
}
  if (ExisteSql('SELECT 1 from legales.lod_origendemanda ' +
                ' WHERE od_idreclamante = 1 ' +
                '   AND (nvl(od_salariodeclarado, 0) = 0) ' +
                '   AND od_fechabaja IS NULL ' +
                '   AND od_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite))) then
  begin
    vSalario := (StrToFloat(ValorSql('SELECT nvl(art.legales.Get_IngresoBaseMensual(' + SqlValue(FIdJuicioEnTramite) + '), 0) FROM DUAL', '0')));
    if (vSalario = 0) then
    begin
      InvalidMsg(dbgOrigenDemanda, 'Debe especificar el valor del salario declarado por el trabajador.', 'Guardar Juicio');
      abort;
    end
    else begin
      EjecutarSqlST('UPDATE legales.lod_origendemanda ' +
                    '   SET od_salariodeclarado = ' + SqlNumber(vSalario) +
                    ' WHERE od_idreclamante = 1 ' +
                    '   AND (nvl(od_salariodeclarado, 0) = 0) ' +
                    '   AND od_fechabaja IS NULL ' +
                    '   AND od_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite));
    end;
  end;
end;

procedure TfrmAdminstracionJuicio.ActualizarInstanciaJuicio(
  AIdJuicioEnTramite, AJurisdiccion, AFuero, AJuzgado, ASecretaria,
  AInstancia: integer; ANroExpediente, AAnioExpediente : string;ASinExpediente :Boolean; AFechaIngreso: TDate;
  Ausuario: String);
var
  updFechaIngreso: string;
begin
  //Ticket 65770
  updFechaIngreso := ' ';
  if ( FormatDateTime('dd/mm/yyyy', AFechaIngreso)  <> '30/12/1899') then
    updFechaIngreso := '       ij_fechatraspaso = ' + SqlValue(AFechaIngreso) + ',';

  EjecutarSqlST('UPDATE legales.lij_instanciajuicioentramite' +
                '   SET ij_nroexpediente = ' + SqlValue(ANroExpediente) + ',' +
                '       ij_anioexpediente = ' + SqlValue(AAnioExpediente) + ',' +
                '       ij_sinexpediente = ' + SqlBoolean(ASinExpediente) + ','+
                updFechaIngreso +
                '       ij_usumodif = ' + SqlValue(AUsuario) + ',' +
                '       ij_fechamodif = sysdate' +
                ' WHERE ij_idjuicioentramite = ' + SqlValue(AIdJuicioEnTramite) +
                '   AND ij_idjurisdiccion =  ' + SqlValue(AJurisdiccion) +
                '   AND ij_idfuero = ' + SqlValue(AFuero) +
                '   AND ij_idjuzgado = ' + SqlValue(AJuzgado) +
                '   AND ij_idsecretaria = ' + SqlValue(ASecretaria) +
                '   AND ij_idinstancia = ' + SqlValue(AInstancia))
end;
(*
procedure TfrmAdminstracionJuicio.tbFijarSentenciaCambioInstanciaClick(
  Sender: TObject);
begin
//  with TfrmFijarSentencia.Create(Self) do
  with TfrmFijarImportesSentencia.Create(Self) do
  begin
    try
      PreValidarFijarSentencia;
      FijarSentenciaCambioJuzgado(FIdJuicioEnTramite);
      ReCargarSentencia;
    finally
      free;
    end;
  end;
end;
*)

procedure TfrmAdminstracionJuicio.fraDatosJuzgadobtnMasDatosJuzgadoClick(
  Sender: TObject);
begin
  fraDatosJuzgado.btnMasDatosJuzgadoClick(Sender);

end;

procedure TfrmAdminstracionJuicio.tbBloquearPagosSiniestrosClick(Sender: TObject);
begin
  if not ExisteSQL ('SELECT 1 ' +
                    '  FROM legales.lod_origendemanda ' +
                    ' WHERE od_fechabaja IS NULL ' +
                    '   AND od_idjuicioentramite =  ' + SqlValue(FIdJuicioEnTramite)) then
  begin
    MessageBox(0, 'El bloqueo de pagos no es aplicable a este juicio ya que no se '+#13+
                  'encontraron siniestros asociados al mismo.',
                  'Bloqueo de Pagos', MB_ICONINFORMATION or MB_OK);
    Exit
  end;

  TfrmBloqueoPagosSiniestros.MostrarAbm(FIdJuicioEnTramite, FModo);
end;

procedure TfrmAdminstracionJuicio.ActualizarSiniestrosJuicio;
var
	sSql: String;
begin
	if edFECHAFINJUICIO.Date > 0 then
  begin
  	sSql :=
    	'SELECT lsj.sj_siniestro, lsj.sj_orden, lsj.sj_recaida, ex_id, ex_estado, ex_causafin, ex_fechafin' +
       ' FROM legales.lod_origendemanda lod, legales.lsj_siniestrosjuicioentramite lsj, art.sex_expedientes sex' +
      ' WHERE lod.od_id = lsj.sj_idorigendemanda' +
      	' AND sex.ex_siniestro = lsj.sj_siniestro' +
        ' AND sex.ex_orden = lsj.sj_orden' +
        ' AND sex.ex_recaida = lsj.sj_recaida' +
        ' AND lod.od_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite) +
        ' AND lsj.sj_fechabaja IS NULL' +
        ' AND lod.od_fechabaja IS NULL';

    with GetQuery(sSql) do
    try
    	while not Eof do
     	begin
      	if (FieldByName('ex_estado').AsString <> '03') or
           ((FieldByName('ex_causafin').AsString <> '22') and (FieldByName('ex_causafin').AsString <> '27')) then
        begin
        	sSql :=
						'UPDATE art.sex_expedientes' +
            	' SET EX_ESTADO = ''03'',' +
              		' EX_CAUSAFIN = ''22'',' +
                  ' EX_FECHAFIN = ART.ACTUALDATE' +
            ' WHERE EX_ID = ' + SqlValue(FieldByName('ex_id').AsInteger);
        	EjecutarSqlST(sSql);

          EjecutarStoreST('art.siniestro.do_actu_estado_siniestro(' + SqlValue(FieldByName('ex_id').AsInteger) + ', '
                                                                    + SqlValue('03') + ', '
                                                                    + SqlValue('CIERRE POR FIN DE JUICIO ' + edNroCarpeta.Text) + ', '
                                                                    + SqlValue('22') + ', '
                                                                    + 'art.actualdate, '
                                                                    + SqlValue(Sesion.LoginName) + ', '
                                                                    + 'NULL ' + ');');
        end;
        Next;
     	end;
    finally
    	Free;
    end;
  end;
end;

procedure TfrmAdminstracionJuicio.dbgEmbargosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
																													 var Background: TColor; Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName('fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmAdminstracionJuicio.sdqEmbargosAfterOpen(DataSet: TDataSet);
begin
  if sdqEmbargos.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqEmbargos.FieldByName('IMPORTE')).Currency := True;

  if sdqEmbargos.FieldByName('MONTOEMBARGADO') is TFloatField then
    TFloatField(sdqEmbargos.FieldByName('MONTOEMBARGADO')).Currency := True;
end;

procedure TfrmAdminstracionJuicio.tbImprimirEmbargosClick(Sender: TObject);
begin
  PrintResultsNew(PrintDialog, dbgEmbargos, dsEmbargos, QueryPrint, tbImprimirEmbargos, '', '');
end;

procedure TfrmAdminstracionJuicio.tbAplicacionClick(Sender: TObject);
var
	sSql: String;
begin
  with sdqAplicaciones do
  begin
		Verificar((not sdqEmbargos.Active) or (sdqEmbargos.IsEmpty), dbgEmbargos, 'No ha seleccionado ning�n registro.');

    Close;
    ParamByName('idembargo').AsInteger := sdqEmbargos.FieldByName('em_id').AsInteger;
    Open;
	end;

  sSql :=
    'SELECT abs(NVL(SUM(ae_importe * ta_operacion), 0)) total' +
     ' FROM lta_tipoaplicacionembargo, lae_aplicacionembargo' +
    ' WHERE ta_id = ae_idtipoaplicacion' +
      ' AND ae_fechabaja IS NULL' +
      ' AND ae_idembargo = :idembargo';
  pnTotal.Caption :=  FormatFloat('#,##0.00', ValorSqlExtendedEx(sSql, [sdqEmbargos.FieldByName('em_id').AsInteger]));

	fpVerAplicaciones.ShowModal;
end;

procedure TfrmAdminstracionJuicio.btnCerrarAplicacionesClick(Sender: TObject);
begin
	fpVerAplicaciones.Close;
end;

procedure TfrmAdminstracionJuicio.fpVerAplicacionesKeyPress(Sender: TObject; var Key: Char);

begin
	if Key = #27 then
  	btnCerrarAplicacionesClick(nil);
end;

procedure TfrmAdminstracionJuicio.tbImprimirRecExtraordClick(Sender: TObject);
begin
  PrintResultsNew(PrintDialog, dbgRecExtraord, dsRecExtraord, QueryPrintRecExtraord, tbImprimirRecExtraord, '', '');
end;

procedure TfrmAdminstracionJuicio.sdqRecExtraordAfterOpen(DataSet: TDataSet);
begin
  if sdqRecExtraord.FieldByName('IMPORTE') is TFloatField then
    TFloatField(sdqRecExtraord.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmAdminstracionJuicio.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      dbgRecExtraord.FooterBand := tbSumatoriaRecExtraord.Down;
      if tbSumatoriaRecExtraord.Down and sdqRecExtraord.Active then
        SumFields(sdqRecExtraord, CAMPOS_SUMARECEXTRAORD, TotalesRecExtraord);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmAdminstracionJuicio.tbSumatoriaRecExtraordClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmAdminstracionJuicio.dbgRecExtraordPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMARECEXTRAORD);
  if (iPos > -1) and (iPos <= MAXCOLS_RECEXTRAORD) then
    Value := Get_AjusteDecimales(FloatToStr(TotalesRecExtraord[iPos]), '$');

end;

procedure TfrmAdminstracionJuicio.dbgOrigenDemandaDblClick(
  Sender: TObject);
begin
  tbEdicionOrigenDemandaClick(nil);
end;

procedure TfrmAdminstracionJuicio.fraReclamoSentenciaReclamodbReclamosDblClick(
  Sender: TObject);
begin
  fraReclamoSentenciaReclamotbEdicionReclamoClick(nil);
end;

procedure TfrmAdminstracionJuicio.dbgEventosJuicioEnTramiteDblClick(
  Sender: TObject);                                             
begin
  tbModificarEventoClick(nil);
end;

procedure TfrmAdminstracionJuicio.dbgPeritajesDblClick(Sender: TObject);
begin
  tbEditarPeritajeClick(nil);
end;

procedure TfrmAdminstracionJuicio.dbgPagosEfectuadosDblClick(
  Sender: TObject);
begin
  tbEdicionPagoClick(nil);
end;

procedure TfrmAdminstracionJuicio.ActivarControlesAlta(activar: boolean);
begin
  lblAviso.Visible := not activar;
  VclExtra.LockControls([tbOrigenSiniestro, tsReclamos, tbEventosSeguimiento,
                         tbTareas, tsPeritajes, tsPagos, tsEmbargos,
                         tsRecursosExtraordinarios], not activar);
  tbReasignarAbogado.Enabled := activar;
  tbVerPagosPendientes.Enabled := activar;
  tbFijarSentencia.Enabled := activar;
  tbBloquearPagosSiniestros.Enabled := activar;
  tbBloquear.Enabled    := activar;
  tbImprimir.Enabled    := activar;
  tbVerImagenes.Enabled := activar;
  fraDatosJuzgado.btnInstanciasAnteriores.Enabled := activar;
end;

procedure TfrmAdminstracionJuicio.chkReservaGestionClick(Sender: TObject);
begin
  HabilitarReservaGestion;
end;

procedure TfrmAdminstracionJuicio.HabilitarReservaGestion;
begin
  if chkReservaGestion.Checked then
  begin
    ceReservaGestion.Enabled := True;
    ceReservaGestion.Color   := clWindow;
  end else
  begin
    ceReservaGestion.Enabled := False;
    ceReservaGestion.Color := clInactiveCaption;
  end;
end;

procedure TfrmAdminstracionJuicio.tbImpresionEventosClick(Sender: TObject);
var
  f: TrptEventosJuicio;
begin
  f:= TrptEventosJuicio.Create(Self);
  with f do
  try
    tbImpresionEventos.Enabled := False;
    Load(FIdJuicioEnTramite);
  finally
  begin
    tbImpresionEventos.Enabled := True;
    Application.ProcessMessages;
    f.Free;
  end;
 end;
end;

procedure TfrmAdminstracionJuicio.tbNuevoReclamoClickOverride(Sender: TObject);
begin
  fraReclamoSentenciaReclamo.Init(FIdJuicioEnTramite, NOFIJASENTENCIA, fraDatosJuzgado.Instancia);
  fraReclamoSentenciaReclamo.tbNuevoReclamoClick(Sender);
end;

procedure TfrmAdminstracionJuicio.btnAceptarProcedenciaClick(
  Sender: TObject);
begin
  EjecutarSql(
    ' UPDATE legales.ljt_juicioentramite '+
    '    SET jt_idjuiciorelacionado =  '+ SqlValue(fraJuicioRelacionado.ID)+','+
    '        JT_NUMCARPETAJUICIORELACIONADO = '+SqlValue(fraJuicioRelacionado.Codigo)+
    '  WHERE jt_id = '+SqlValue(FIdJuicioEnTramite));
  fpJuicioRelacionado.ModalResult := mrOk;
end;

procedure TfrmAdminstracionJuicio.tbVerImagenesClick(Sender: TObject);
begin
  if FarId <> ART_EMPTY_ID then
    TFrmDetalleArchivo.MostrarDetalleArchivo(Self, FarId, True);
end;

procedure TfrmAdminstracionJuicio.tbAprobacionConceptosDuplicadosClick(
  Sender: TObject);
begin
  Verificar(not((sdqPagoLegal.FieldByName('PL_DUPLICADO').AsString = 'S') and
                sdqPagoLegal.FieldByName('pl_estadoduplicidad').IsNull),tbAprobacionConceptosDuplicados,
            'Debe ser Duplicado y no estar rechazado o aprobado.');

  cbAprobadoConDup.Checked := False;
  cbRechazadoConDup.Checked := False;
  edMotivo.Clear;
  pnAprobacionConDup.ShowModal;
end;

procedure TfrmAdminstracionJuicio.btnAceptarAprobConDupClick(
  Sender: TObject);
var
  sSql : String;
  estado : String;
begin
  Verificar(not cbAprobadoConDup.Checked and not cbRechazadoConDup.Checked, gbAprobacion,'Se debe seleccionar si es Rechazado o Aprobado.');
  Verificar(edMotivo.Text = '', edMotivo, 'Debe ingresar un motivo.');

  if cbAprobadoConDup.Checked then
    estado := ' pl_estadoduplicidad = ''A'' '
  else if cbRechazadoConDup.Checked then
    estado := ' pl_estadoduplicidad = ''R'', pl_estado = ''X'' ';

  sSql := ' UPDATE legales.lpl_pagolegal '+
          '    SET pl_motivoaprobacion = '+SqlValue(edMotivo.Text)+','+
          '        pl_fechaaprobacion = sysdate, '+
          '        pl_usuaprobacion = '+SqlValue(Sesion.LoginName)+','+estado+
          '  WHERE pl_id = '+sdqPagoLegal.FieldByName('pl_id').AsString;

  EjecutarSqlST(ssql);
  pnAprobacionConDup.ModalResult := mrOk;
  sdqPagoLegal.Refresh;
end;

procedure TfrmAdminstracionJuicio.cbAprobadoConDupClick(Sender: TObject);
begin
  if cbRechazadoConDup.Checked and cbAprobadoConDup.Checked then
    cbRechazadoConDup.Checked := False;
end;

procedure TfrmAdminstracionJuicio.cbRechazadoConDupClick(Sender: TObject);
begin
  if cbAprobadoConDup.Checked and cbRechazadoConDup.Checked then
    cbAprobadoConDup.Checked := False;
end;

procedure TfrmAdminstracionJuicio.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields( SortDialogEvento.SortFields, dbgEventosJuicioEnTramite.Columns );
  SortDialogEvento.Execute;
end;

procedure TfrmAdminstracionJuicio.LoadDynamicSortFields(ASortFields : TSortFields; AColumns : TDBGridColumns);
begin
  if SortDialogEvento.SortFields.Count <> GetVisibleColumnCount(dbgEventosJuicioEnTramite) then
  begin
    AsortFields.Clear;
    unArt.LoadDynamicSortFields(ASortFields, AColumns);
  end;
end;


procedure TfrmAdminstracionJuicio.tbModificarPeritoClick(Sender: TObject);
begin
  with TFrmManPeritos.Create(nil) do
  try
    FormStyle := fsNormal;
    VerSeleccion;
    Visible := false;
    ShowModal;
    fraPerito.Codigo := ObtenerPerito;
  finally
    free;
  end;

end;

procedure TfrmAdminstracionJuicio.SumatoriaEmbargo;
begin
  lbTotalEmbargo.Caption := 'T Embargo: $ '+ValorSql(' SELECT nvl(TRIM(TO_CHAR(art.legales.get_montototalembargo('+
                             SqlValue(FIdJuicioEnTramite)+'), ''9G999G999G999G990D99'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')),''0,00'') FROM dual');

  lbTotalRetenido.Caption := 'T Retenido: $ '+ValorSql(' SELECT nvl(TRIM(TO_CHAR(art.legales.get_montototalretenido('+
                             SqlValue(FIdJuicioEnTramite)+'), ''9G999G999G999G990D99'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')),''0,00'') FROM dual');
end;


procedure TfrmAdminstracionJuicio.SumatoriaRecursoExtra;
begin
  lblTotalRecursoExtra.Caption := 'T Recurso Extr: $ '+ValorSql(' SELECT nvl(TRIM(TO_CHAR(art.legales.get_montototalrecursoext('+
                                  SqlValue(FIdJuicioEnTramite)+'), ''9G999G999G999G990D99'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')),''0,00'') FROM dual');
end;


procedure TfrmAdminstracionJuicio.tbAsociarDocClick(Sender: TObject);
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    if (FModoEventosSeguimientos = meAlta) then
      cdsArchivosAsociados.EmptyDataSet;
    CargarDirectoArchivosAsociados(FIdJuicioEnTramite, FIdEventoJuicioEnTramite, cdsArchivosAsociados);
    RecargarArchivosAsociados(cdsArchivosAsociados);
      edtArchivosAsociados.Text := InttoStr(cdsArchivosAsociados.RecordCount) +
                                   ' Archivos Asociados.';
  finally
    Free;
  end;
end;

procedure TfrmAdminstracionJuicio.tbSeleccionArchivosAsociarPericiasClick(
  Sender: TObject);
begin
  MostrarArchivosAsociadosPericias;
end;

procedure TfrmAdminstracionJuicio.RecargarArchivosAsociadosPericias(
  cdsArchivosAsociadosPericias: TClientDataSet);
begin
  cdsArchivosAsociadosPericias.First;
  while not cdsArchivosAsociadosPericias.Eof do
  begin
    if cdsArchivosAsociadosPericias.FieldByName('STATE').AsString = 'D' then
    begin
      EjecutarSqlST('UPDATE legales.lpa_periciaarchivoasociado ' +
                    '   SET PA_USUBAJA = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       PA_FECHABAJA = SYSDATE' +
                    ' WHERE PA_ID = ' + SqlValue(cdsArchivosAsociadosPericias.FieldByName('ID').AsInteger));

      cdsArchivosAsociadosPericias.Delete;


    end
    else cdsArchivosAsociadosPericias.Next;
  end;
end;

procedure TfrmAdminstracionJuicio.tbAsociarDocPericiasClick(
  Sender: TObject);
begin
  with TfrmArchivosAsociados.Create(self) do
  try
    if (FModoPeritaje = meAlta) then
      cdsArchivosAsociadosPericias.EmptyDataSet;
    CargarDirectoArchivosAsociadosPericias(FIdJuicioEnTramite, FIdPericia, cdsArchivosAsociadosPericias);
    RecargarArchivosAsociados(cdsArchivosAsociadosPericias);
    edtArchivosAsociadosPericias.Text := InttoStr(cdsArchivosAsociadosPericias.RecordCount) + ' Archivos Asociados.';
  finally
    Free;
  end;
end;

end.

