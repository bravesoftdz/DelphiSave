unit unParteEvolutivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, StdCtrls, ToolEdit, RxLookup, Mask,
  LookupDialog, Db, SDEngine, ComCtrls, ToolWin, ImgList, ExtCtrls, ArtComboBox, artSeguridad, CustomDlgs, DTPFuncs,
  AnsiSql, Placemnt, unfraPrestador, DateComboBox, unFraTrabajadorSIN, SinEdit, ValFuncs, ShortCutControl, IntEdit,
  SortDlg, unFraEmpresa, Menus, Cuit, unArtFrame, unArtDbFrame, PatternEdit, DateTimeEditors, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraCodigoDescripcion, FormPanel, CurrEdit, JvExStdCtrls, JvEdit,
  JvValidateEdit, Grids, DBGrids, RXDBCtrl, ArtDBGrid, QueryToFile, QueryPrint,
  ExportDialog, unFraTrabajador, unFraTrabajadorSiniestro, RxPlacemnt,
  RxCurrEdit, RxToolEdit, JvExMask, JvToolEdit;

type
  TTipoOperacion = (toAlta, toModif, toBaja);

  TfrmParteEvolutivo = class(TForm)
    sdqBusqueda: TSDQuery;
    dsBusqueda: TDataSource;
    sdqPartes: TSDQuery;
    dsPartes: TDataSource;
    sdqTipoTramite: TSDQuery;
    dsTipoTramite: TDataSource;
    Seguridad: TSeguridad;
    sdqTipoTramiteTB_CODIGO: TStringField;
    sdqTipoTramiteTB_DESCRIPCION: TStringField;
    FormPlacement: TFormPlacement;
    ShortCutControl: TShortCutControl;
    SortDialog: TSortDialog;
    sdqTipo: TSDQuery;
    dsTipo: TDataSource;
    sdqAutorizaciones: TSDQuery;
    dsAutorizaciones: TDataSource;
    ldAutorizaciones: TLookupDialog;
    pmnuHistoria: TPopupMenu;
    mnuHistoDetalle: TMenuItem;
    pmnuImprimir: TPopupMenu;
    mnuImprimirPartes: TMenuItem;
    mnuCartaDerivacion: TMenuItem;
    TimerConfidencial: TTimer;
    sdqPartesPV_SINIESTRO: TFloatField;
    sdqPartesPV_ORDEN: TFloatField;
    sdqPartesPV_RECAIDA: TFloatField;
    sdqPartesPV_NROPARTE: TFloatField;
    sdqPartesPV_FECHACONTROL: TDateTimeField;
    sdqPartesPV_PROXIMOCONTROL: TDateTimeField;
    sdqPartesPV_DIAGNOSTICO: TStringField;
    sdqPartesPV_IDENTIFPRESTADOR: TFloatField;
    sdqPartesPV_DIAGNOSTICOOMS: TStringField;
    sdqPartesPV_GRAVEDADCIE10: TStringField;
    sdqPartesPV_TIPOTRATAMIENTO: TStringField;
    sdqPartesPV_AUDITOR: TFloatField;
    sdqPartesPV_INTERNADODESDE: TDateTimeField;
    sdqPartesPV_INTERNADOHASTA: TDateTimeField;
    sdqPartesPV_DESDE: TDateTimeField;
    sdqPartesPV_HASTA: TDateTimeField;
    sdqPartesPV_SITIOINTERNACION: TStringField;
    sdqPartesPV_MEDICO: TStringField;
    sdqPartesPV_OBSERVACIONES: TStringField;
    sdqPartesPV_FECHARECEPCION: TDateTimeField;
    sdqPartesPV_TIPOPARTE: TStringField;
    sdqPartesPV_AUTORIZACION: TFloatField;
    sdqPartesPV_USUALTA: TStringField;
    sdqPartesPV_FECHAALTA: TDateTimeField;
    sdqPartesPV_OPERPROG: TStringField;
    sdqPartesPV_NRODENUNCIASRT: TStringField;
    sdqPartesPV_TURNO: TDateTimeField;
    sdqPartesPV_TURNOHORA: TStringField;
    sdqPartesPV_EVIP: TStringField;
    sdqPartesPV_MEDICACION: TStringField;
    sdqPartesPV_REPOSO: TStringField;
    sdqPartesPV_PROTOCOLOGENERAL: TStringField;
    sdqPartesPV_AREVISAR: TStringField;
    pMenuViajar: TPopupMenu;
    mnuViajarAutorizaciones: TMenuItem;
    mnViajarAgenda: TMenuItem;
    sdqPartesPV_FECHABAJA: TDateTimeField;
    sdqPartesPV_USUBAJA: TStringField;
    sdqPartesPV_MOTIVOBAJA: TStringField;
    sdqPartesPV_IDEXPEDIENTE: TFloatField;
    sdqPartesPV_USUMODIF: TStringField;
    sdqPartesPV_PORCINCAPACIDAD: TFloatField;
    sdqPartesPV_INFECTOLOGIA: TStringField;
    sdqPartesPV_IDCITACION: TFloatField;
    mnuViajarCalendario: TMenuItem;
    mnuImprimirInforme: TMenuItem;
    sdqMedicosResp: TSDQuery;
    dsMedicosResp: TDataSource;
    mnuViajarSuspPlazos: TMenuItem;
    mnuViajarSeguim: TMenuItem;
    sdqObsSupMed: TSDQuery;
    dsObsSupMed: TDataSource;
    SortDialog_Obs: TSortDialog;
    pMenuObs: TPopupMenu;
    mnuSupervisor: TMenuItem;
    mnuMedico: TMenuItem;
    exportObs: TExportDialog;
    qpObs: TQueryPrint;
    pdObs: TPrintDialog;
    sdqPartesPV_PRESTPORDICTAMEN: TStringField;
    sdqPartesPV_HORAPROXIMOCONTROL: TStringField;
    sdqResumenSum: TSDQuery;
    dsResumenSum: TDataSource;
    SortDialog_ResSum: TSortDialog;
    Export_ResSum: TExportDialog;
    QueryPrint_ResSum: TQueryPrint;
    pnlTop: TPanel;
    grpEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    GroupBox4: TGroupBox;
    grpTrabajador: TGroupBox;
    ToolBarHistoriaClinica: TToolBar;
    tbHC: TToolButton;
    GroupBox5: TGroupBox;
    MemoMecanismoAccid: TMemo;
    grpSiniestro: TGroupBox;
    blSinFecha: TLabel;
    btnSiniMasDatos: TSpeedButton;
    Label9: TLabel;
    edCausaFin: TEdit;
    pnlSiniestro: TPanel;
    sbtnBuscar: TSpeedButton;
    SinEdit: TSinEdit;
    pnlChecks: TPanel;
    chkComMed: TCheckBox;
    chkSRT: TCheckBox;
    chkReqSRT: TCheckBox;
    chkSumario: TCheckBox;
    chkRemis: TCheckBox;
    chkGSueldos: TCheckBox;
    edSinFecha: TDateEditor;
    edGesAud: TEdit;
    pnlBarra: TPanel;
    tbHerramientas: TToolBar;
    tbPrimero: TToolButton;
    tbAnterior: TToolButton;
    tbSiguiente: TToolButton;
    tbUltimo: TToolButton;
    ToolBu5: TToolButton;
    tbNuevo: TToolButton;
    tbGuardar: TToolButton;
    tbEliminar: TToolButton;
    tbDatosBaja: TToolButton;
    tbSep1: TToolButton;
    tbOrden: TToolButton;
    toolb2: TToolButton;
    tbLimpiar: TToolButton;
    tbRefrescar: TToolButton;
    ToolB1: TToolButton;
    tbTrabajador: TToolButton;
    tbSep2: TToolButton;
    tbImprimir: TToolButton;
    tbSep5: TToolButton;
    tbViajar: TToolButton;
    ToolBu3: TToolButton;
    tbPedInfo: TToolButton;
    TbEnvTlgCart: TToolButton;
    tbCostos: TToolButton;
    tbEvaluacion: TToolButton;
    tbAmeritaRemis: TToolButton;
    tbObsSupMed: TToolButton;
    tbResumenSum: TToolButton;
    ToolBu4: TToolButton;
    tbSalir: TToolButton;
    lbOperacion: TPanel;
    Panel2: TPanel;
    lbParte: TLabel;
    lbFechaControl: TLabel;
    lbFechaProxControl: TLabel;
    lbDiagnostico: TLabel;
    lbCIE10: TLabel;
    lbTipoTratam: TLabel;
    lblAuditor: TLabel;
    lbInterDesde: TLabel;
    lbInterHasta: TLabel;
    lbSitioInternac: TLabel;
    lbMedico: TLabel;
    lbRecibido: TLabel;
    lbObservaciones: TLabel;
    lbltipo: TLabel;
    lblAuto: TLabel;
    btnAutorizacion: TSpeedButton;
    lblGTRAb: TLabel;
    lbldelegacion: TLabel;
    lblTurno: TLabel;
    Label1: TLabel;
    Bevel5: TBevel;
    Label2: TLabel;
    btnAgregarObs: TSpeedButton;
    btnObsAud: TSpeedButton;
    Bevel3: TBevel;
    Label10: TLabel;
    Label14: TLabel;
    edObs: TMemo;
    dbcPartes: TArtComboBox;
    edDiagnostico: TEdit;
    cmbTipoTratam: TArtComboBox;
    edTipoTramite: TEdit;
    edInternacion: TEdit;
    edMedico: TEdit;
    grpPrestador: TGroupBox;
    fraPrestador: TfraPrestador;
    deIntDesde: TDateComboBox;
    deIntHasta: TDateComboBox;
    edRecibido: TDateComboBox;
    dtFechaControl: TDateComboBox;
    dtFechaProxControl: TDateComboBox;
    cmbTipo: TArtComboBox;
    edAutorizacion: TIntEdit;
    edGTrabajo: TEdit;
    edDelegacion: TEdit;
    cmbTurno: TDateComboBox;
    mskHora: TMaskEdit;
    chkEmpresaVIP: TCheckBox;
    fraCIE10: TfraCodigoDescripcion;
    fraGravedadCIE10: TfraStaticCTB_TABLAS;
    chkProtGeneral: TCheckBox;
    chkRevisar: TCheckBox;
    edUsuAlta: TEdit;
    edPorcentaje: TCurrencyEdit;
    pnlInca: TPanel;
    edPorcentajeN: TEdit;
    chkEstimar: TCheckBox;
    chkInfectologia: TCheckBox;
    fraAuditor: TfraCodigoDescripcion;
    edPrestPorDictPV: TEdit;
    mskHoraProxControl: TMaskEdit;
    ScrollBox1: TScrollBox;
    fpReqTraslado: TFormPanel;
    Bevel10: TBevel;
    btnAceptarTrasl: TButton;
    btnCancelarTrasl: TButton;
    chkRemisABM: TCheckBox;
    fpMedicoResp: TFormPanel;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    dbgMedicoResp: TRxDBGrid;
    edMedicoSelecc: TEdit;
    Button1: TButton;
    Button2: TButton;
    fpSolAudMedica: TFormPanel;
    GroupBox1: TGroupBox;
    rbSol24hs: TRadioButton;
    rbSol48hs: TRadioButton;
    rbSol72hs: TRadioButton;
    rbPuntual: TRadioButton;
    btnAceptar: TButton;
    btnCancelar: TButton;
    fpObservaciones: TFormPanel;
    GroupBox2: TGroupBox;
    edObsABM: TMemo;
    btnAceptarObs: TButton;
    btnCancelarObs: TButton;
    fpPracticasRealizadas: TFormPanel;
    lbEspCodigo: TLabel;
    Bevel8: TBevel;
    btnRealAceptar: TButton;
    edRealizadas: TCurrencyEdit;
    fpMotivoElim: TFormPanel;
    btnCerrarElim: TButton;
    gbMotivo: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edMotivoElim: TEdit;
    edUsuBaja: TEdit;
    edFechaBaja: TEdit;
    edUsuModif: TEdit;
    btnAceptarElim: TButton;
    ScrollBox2: TScrollBox;
    fpResumenSum: TFormPanel;
    ToolBar1: TToolBar;
    tbOrdenarRes: TToolButton;
    ToolButton1: TToolButton;
    tbExportarRes: TToolButton;
    tbImprimirRes: TToolButton;
    ToolButton15: TToolButton;
    tbSalirRes: TToolButton;
    dgResumenSum: TArtDBGrid;
    Panel1: TPanel;
    rbSinOrdRec: TRadioButton;
    rbSinOrd: TRadioButton;
    edSinOrdRec: TSinEdit;
    edSinOrd: TSinEdit;
    fpObsSupMed: TFormPanel;
    pnlFiltros: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edUsuarioObs: TEdit;
    MemoObservaciones: TMemo;
    edFechaObs: TDateEditor;
    edSiniestroObs: TEdit;
    ToolBar: TToolBar;
    tbRefrescarObs: TToolButton;
    ToolButton5: TToolButton;
    tbNuevoObs: TToolButton;
    ToolButton4: TToolButton;
    tbGuardarObs: TToolButton;
    tbCancelarObs: TToolButton;
    ToolButton2: TToolButton;
    tbOrdenarObs: TToolButton;
    tbExportarObs: TToolButton;
    tbImprimirObs: TToolButton;
    ToolButton6: TToolButton;
    tbSalirObs: TToolButton;
    dgObsSupMed: TArtDBGrid;
    MemoDiagnosticoSin: TMemo;
    btnPrimerRangoInternacion: TSpeedButton;
    fpPrimerRangoInternacion: TFormPanel;
    Bevel1: TBevel;
    btnAceptarInt: TButton;
    dgPrimerRangoInternacion: TArtDBGrid;
    dsPrimerRangoInternacion: TDataSource;
    sdqPrimerRangoInternacion: TSDQuery;
    grpChecks2: TGroupBox;
    chkPosibleFraude: TCheckBox;
    tbSuspension: TToolButton;
    btnDatosInca: TSpeedButton;
    edCatCIE10: TEdit;
    fraTrabajadorSIN: TfraTrabajadorSiniestro;
    mnuResumen: TMenuItem;
    edPuestoSector: TEdit;
    chkReca: TCheckBox;
    sdqPartesPV_RECALIFICACION: TStringField;
    sdqBusquedaEX_SINIESTRO: TFloatField;
    sdqBusquedaEX_ORDEN: TFloatField;
    sdqBusquedaEX_RECAIDA: TFloatField;
    sdqBusquedaEX_ID: TFloatField;
    sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField;
    sdqBusquedaEX_DIAGNOSTICO: TStringField;
    sdqBusquedaCAUSAFIN: TStringField;
    sdqBusquedaEX_CUIT: TStringField;
    sdqBusquedaEX_CUIL: TStringField;
    sdqBusquedaEX_CAUSAFIN: TStringField;
    sdqBusquedaEX_GTRABAJO: TStringField;
    sdqBusquedaGP_NOMBRE: TStringField;
    sdqBusquedaEL_NOMBRE: TStringField;
    sdqBusquedaEX_PRESTADOR: TFloatField;
    sdqBusquedaREQ: TStringField;
    sdqBusquedaSUM: TStringField;
    sdqBusquedaEX_FECHAGESTAUD: TDateTimeField;
    sdqBusquedaEX_CONTRATO: TFloatField;
    sdqBusquedaEX_AMERITAREMIS: TStringField;
    sdqBusquedaGRANSUELDO: TStringField;
    sdqBusquedaCOMMED: TStringField;
    sdqBusquedaEX_MECANISMOACCID: TStringField;
    sdqBusquedaRL_SECTOR: TStringField;
    sdqBusquedaRL_TAREA: TStringField;
    pnlTipoTopeo: TPanel;
    Label15: TLabel;
    chkTopeCie10: TRadioButton;
    chkTopeAutorizacion: TRadioButton;
    chkTopeTraslado: TRadioButton;
    chkTopeFKT: TRadioButton;
    Panel3: TPanel;
    chkDEAM: TCheckBox;
    sdqPartesPV_DEAM: TStringField;
    sdqPartesPV_FECHADEAM: TDateTimeField;
    chkRevisar48: TCheckBox;
    mObsRevisar48: TMemo;
    edEstadoSSA: TEdit;
    edTopeado: TEdit;
    tbSIC: TToolButton;
    sbtnSIC: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure dbcPartesCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure btnSiniMasDatosClick(Sender: TObject);
    procedure tbSiguienteClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbPrimeroClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure SinEditSelect(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure btnAutorizacionClick(Sender: TObject);
    procedure cmbTipoCloseUp(Sender: TObject);
    procedure ldAutorizacionesGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                            var Background: TColor; Highlight: Boolean);
    procedure tbTrabajadorClick(Sender: TObject);
    procedure mnuHistoDetalleClick(Sender: TObject);
    procedure tbViajarClick(Sender: TObject);
    procedure tbPedInfoClick(Sender: TObject);
    procedure mnuImprimirPartesClick(Sender: TObject);
    procedure mnuCartaDerivacionClick(Sender: TObject);
    procedure pmnuImprimirPopup(Sender: TObject);
    procedure TbEnvTlgCartClick(Sender: TObject);
    procedure cmbTipoTratamExit(Sender: TObject);
    procedure cmbTipoTratamKeyPress(Sender: TObject; var Key: Char);
    procedure tbCostosClick(Sender: TObject);
    procedure TimerConfidencialTimer(Sender: TObject);
    procedure fraEmpresamskCUITChange(Sender: TObject);
    procedure cmbTipoChange(Sender: TObject);
    procedure btnRealAceptarClick(Sender: TObject);
    procedure mnuViajarAutorizacionesClick(Sender: TObject);
    procedure mnViajarAgendaClick(Sender: TObject);
    procedure btnAgregarObsClick(Sender: TObject);
    procedure btnAceptarObsClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnObsAudClick(Sender: TObject);
    procedure tbDatosBajaClick(Sender: TObject);
    procedure btnAceptarElimClick(Sender: TObject);
    procedure sdqPartesAfterScroll(DataSet: TDataSet);
    procedure btnDatosIncaClick(Sender: TObject);
    procedure chkEstimarClick(Sender: TObject);
    procedure tbEvaluacionClick(Sender: TObject);
    procedure tbHCClick(Sender: TObject);
    procedure mnuViajarCalendarioClick(Sender: TObject);
    procedure mnuImprimirInformeClick(Sender: TObject);
    procedure sdqMedicosRespAfterScroll(DataSet: TDataSet);
    procedure mnuViajarSuspPlazosClick(Sender: TObject);
    procedure mnuViajarSeguimClick(Sender: TObject);
    procedure tbAmeritaRemisClick(Sender: TObject);
    procedure btnAceptarTraslClick(Sender: TObject);
    procedure tbObsSupMedClick(Sender: TObject);
    procedure tbSalirObsClick(Sender: TObject);
    procedure tbGuardarObsClick(Sender: TObject);
    procedure tbRefrescarObsClick(Sender: TObject);
    procedure tbNuevoObsClick(Sender: TObject);
    procedure tbOrdenarObsClick(Sender: TObject);
    procedure sdqObsSupMedAfterScroll(DataSet: TDataSet);
    procedure tbCancelarObsClick(Sender: TObject);
    procedure mnuSupervisorClick(Sender: TObject);
    procedure mnuMedicoClick(Sender: TObject);
    procedure tbExportarObsClick(Sender: TObject);
    procedure tbImprimirObsClick(Sender: TObject);
    procedure fpObsSupMedClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSalirResClick(Sender: TObject);
    procedure tbResumenSumClick(Sender: TObject);
    procedure rbSinOrdRecClick(Sender: TObject);
    procedure rbSinOrdClick(Sender: TObject);
    procedure tbOrdenarResClick(Sender: TObject);
    procedure tbExportarResClick(Sender: TObject);
    procedure tbImprimirResClick(Sender: TObject);
    procedure btnPrimerRangoInternacionClick(Sender: TObject);
    procedure btnAceptarIntClick(Sender: TObject);
    procedure tbSuspensionClick(Sender: TObject);
    procedure mnuResumenClick(Sender: TObject);
    function ValidarChkReca(Sender: TObject): boolean;
    procedure pMenuViajarPopup(Sender: TObject);
    procedure chkRevisar48Click(Sender: TObject);
    procedure tbSICClick(Sender: TObject);
    procedure sbtnSICClick(Sender: TObject);
  private
    IntDesde: TDate;
   // OpProgAnt: Boolean;
    PrestAnt: Integer;
    vCantMaxima :Integer;
    TipoUsuarioObs: string;

    function ActualizarAutorizacion: Boolean;
    function CargarCantRealizadas: Boolean;
    function EsSiniestroInternado: Boolean;
    function ExistsDireccionTrabajador: Boolean;
    function ExistsSolAuditoriaAbierta(bInfecto: Boolean): Boolean;
    function FaxPrestador: String;
    function Validar: Boolean;
    function ValidarHora: Boolean;
    function ValidarOtros(IdExpediente :Integer): Boolean;
    function ValidarSupObs: Boolean;  // TK 10083
    function Validar_SML_Evol: boolean;  // Plan - SML
    function Validar_AltaModif_SML(TipoOp:TTipoOperacion): boolean;  // Plan - SML
    function Valida_Baja_SML: boolean;   // Plan - SML
    function LugarImpresion:string;
    function Get_MedicoResponsGrupo:string;
    function GetTipoDoc :String;
    // Lu TK 1439 Funcion que determina si un sin/ord/rec/form/parte ya fue digitalizado.
    function EsParteDigitalizado(iSiniestro, iOrden, iRecaida, iNroParte: Integer;
                                 sFormulario: string): boolean;
    function HuboOtroCambio: Boolean;
    function HuboCambioNoObserv: Boolean;
    function Get_EstadoSSA(iIdExpediente :Integer): String;  // TK 19070
    function EsPrestadorSinContrato: Boolean;
    function Es_TipoPermitidoSML_ParaModif: Boolean;    // Plan - SML - Tipo de parte
    function Es_TipoPermitidoSML_ParaAlta: Boolean;     // Plan - SML - Tipo de parte
    function Es_TipoPermitidoSML_ParaBaja: Boolean;     // Plan - SML - Tipo de parte

    procedure ActualizarDelegacion;
    procedure DoHabilitarEvaluacion(iIdExped, iNroParte: Integer);
    procedure DoHabilitarInca(bHabilitar: Boolean);
    procedure DoHabilitarObs;
    procedure DoHabilitarObsAud;
    procedure DoHabilitarObsSupMed(bHabilitar: Boolean; sTipoUsu: String = '');  // TK 10083
    procedure DoLimpiar;
    procedure EnableNavigator;
    procedure ImprimirCartaDerivacion(Prest: String; LstDatosPrestOrigen: TStringList; Firmante :String;
                                      OrigenPrest: Integer; OrPrART: Boolean);   {Procedimiento de mnuCartaDerivacion, en esa opción se imprimen dos cartas}
    procedure ImprimirInforme(sFirmante, sNombre, sDNI, sInfoObserv, sMedicoResp: string);
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnPrestadorChange(Sender: TObject);
    procedure OnTrabajadorChange(Sender: TObject);
    procedure DoGuardarObsInfoSoc;  // Lu TK 1706
    procedure DoGuardarObsAdmMed;   // TK 24447
    procedure DoMostrarObserva(sTipoUsu: String; bMostrar: Boolean);
    procedure Do_setearFiltrosResumen;  // TK 19070
    procedure Do_RefrescarResumenSum(iSiniestro, iOrden, iRecaida:Integer);  // TK 19070
    procedure Do_EnviarMail_SolicAudMedica(iCantAudit, iIdExped: integer); // TK 24729 (reacomodo)
    procedure Do_Evaluar_SiniestroAdendaILT; // TK 26335
  //  procedure Do_EvaluarIFFI;                // TK 25970
    procedure DoViajarSuspension(bDecide, bConTransaccion: Boolean);
    procedure Do_EvaluarPosibleFraude;

    procedure DoEvaluar_LiberaTope(iIdExp: integer; sTipoTopeo: string);    // Plan Tope de Siniestros: libera el tope por cualquiera de las 4 opciones (Cie10, Autorizaciones, Traslados o FKT)
    procedure PreferenciasDerivacion(APregunta: Boolean = False);
    procedure DoCargar_TopeadoPor(iIdExped: integer);   // Plan topeados
    procedure Do_EvaluarDEAM;  // TK 50107
    function EsPrimerParte(Tipo: String; Siniestro, Orden, Recaida: Integer): Boolean;
    function PermiteCargaAdmin_SupervisorGrTrab: boolean;
    procedure DoCompletarLeyendaTopeado; // TK 61342

  public
    function CargarPartes(bMensaje: Boolean = True): Boolean;
  end;

var
  FechaActual: TDateTime;
  frmParteEvolutivo: TfrmParteEvolutivo;

const
  sOperaciones: Array[0..2] of String = ('Inactiva', 'Edición', 'Alta');
  sTITULOOBSINFORME = 'Observaciones para el Informe';
  sTITULOOBSINFSOC  = 'Observaciones Informe Social'; // Lu TK 1706
  sTITULOOBSADMMED  = 'Observaciones del parte Administrativo Médico'; // TK 24447

implementation

uses
  unPrincipal, unDmPrincipal, unBusqSini, unDatosSiniestro, unImpParteEvolutivo, General, StrFuncs, unAutAprob,
  unAutSelPorSiniestro, unPedidoInfo, unRTF, UnFirmantes, UnDestPapl, UnConsTlgCartas, unCostosxSiniestro, unArt,
  unConfidencial, VCLExtra, Printers, unRptMoldeReporteRTF, unVisualizador, unSesion, unRedPres, unMoldeEnvioMail,
  unEnvioMail, unEnviarSolicitudAuditoria, unAgendaProtocolo, unTercerizadoras, uncomunes, Periodo, unEvaluacionMedica,
  unABMAnalisis, unMoldeAbmAnalisis, unCalendarioPrestacional, QuickRpt,
  unCustomDataModule, unRptInformeParteEvol, unSuspensionPlazos, unSiniestros,
  unListSeguimientoMedico, unUtilsArchivo, unContratoTrabajador, unAgenda,
  unAgendaVistaExpediente;

{$R *.DFM}

procedure TfrmParteEvolutivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmParteEvolutivo := nil;
  frmPrincipal.mnuParteEvolutivoCarga.Enabled := True;
end;

procedure TfrmParteEvolutivo.sbtnBuscarClick(Sender: TObject);
var
  dlgBusqSini: TdlgBusqSini;
begin
  if not fraempresa.IsEmpty then
    LogAuditoria('REDPR', fraEmpresa.CUIT);

  dlgBusqSini := TdlgBusqSini.Create(Self);
  try
    dlgBusqSini.fraEmpresa.Contrato                 := fraEmpresa.Contrato;
    dlgBusqSini.fraEmpresa.CUIT                     := fraEmpresa.CUIT;
    dlgBusqSini.fraEmpresa.cmbRSocial.Text          := fraEmpresa.cmbRSocial.Text;
    dlgBusqSini.fraTrabajadorSIN.mskTrabCUIL.Text   := fraTrabajadorSIN.CUIL;
    dlgBusqSini.fraTrabajadorSIN.dbcTrabNombre.Text := fraTrabajadorSIN.Nombre;
    if (fraEmpresa.mskCUIT.Text <> '') or (fraTrabajadorSIN.CUIL <> '') then
      dlgBusqSini.tbBuscarClick(nil);

    if dlgBusqSini.ShowModal = mrOk then
    begin
      tbLimpiarClick(Sender);
      SinEdit.SetValues(dlgBusqSini.Siniestro, dlgBusqSini.Orden, dlgBusqSini.Recaida);
      SinEditSelect(Nil);
    end;
  finally
    dlgBusqSini.Free;
  end;
end;

procedure TfrmParteEvolutivo.sbtnSICClick(Sender: TObject);
begin
  Verificar(fraTrabajadorSIN.IsEmpty, SinEdit, 'Debe seleccionar un siniestro para acceder al SIC desde aquí.');
  DoMostrarEventosAgendaExpediente(fraTrabajadorSIN.IdExpediente);
end;

procedure TfrmParteEvolutivo.tbSalirClick(Sender: TObject);
begin
  Close;
end;

{---[Limpia los Datos Cargados]--------------------------------------------------}
procedure TfrmParteEvolutivo.tbLimpiarClick(Sender: TObject);
begin
  if not (Sender = nil) then
  begin
    btnSiniMasDatos.Enabled := False;
    VCLExtra.LockControls([fraEmpresa, fraTrabajadorSIN], False);

    pnlSiniestro.Enabled    := True;

    chkReqSRT.Checked       := False;
    chkSumario.Checked      := False;
    chkComMed.Checked       := False;
    chkSRT.Checked          := False;
    chkRemis.Checked        := False;
    chkGSueldos.Checked     := False;
    chkPosibleFraude.Checked := False;    // TK 63642

    chkDEAM.Checked         := False;   // TK 50107
    VCLExtra.LockControls([chkDEAM], True);

    tbPrimero.Enabled       := False;
    tbAnterior.Enabled      := False;
    tbSiguiente.Enabled     := False;
    tbUltimo.Enabled        := False;                              
    tbEliminar.Enabled      := False;
    tbDatosBaja.Enabled     := False;
    tbGuardar.Enabled       := False;
    lbOperacion.Caption     := sOperaciones[0];
    btnAgregarObs.Enabled   := False;
    tbRefrescar.Enabled     := False;
    tbPedInfo.Enabled       := False;
    TbEnvTlgCart.Enabled    := False;
  //  tbViajar.Enabled        := False;
    btnPrimerRangoInternacion.Enabled := False;  // TK 16759

    fraTrabajadorSIN.CUIT   := '';
    fraEmpresa.Clear;
    fraTrabajadorSIN.Clear;

    SinEdit.Clear;
    SinEdit.SetFocus;
    edSinFecha.Clear;
    edCausaFin.Clear;
    memoDiagnosticoSin.Lines.Clear; // TK 19070
    memoMecanismoAccid.Lines.Clear; // TK 19070
    edEstadoSSA.Clear;              // TK 19070
    edCatCIE10.Clear;
  end;

  //--[ Los datos Del Parte ]-----------------------------------------------//
  dbcPartes.Text              := '';
  dtFechaControl.Date         := Now;
  dtFechaProxControl.Date     := Now;
  dtFechaControl.ClearDate;
  dtFechaProxControl.ClearDate;
  mskHoraProxControl.Text     := '';  // TK 19562
  cmbTurno.ClearDate;
  mskHora.Text := '';
  deIntDesde.ClearRange;
  deIntHasta.ClearRange;
  fraPrestador.Limpiar;
  fraAuditor.Clear;

  edDiagnostico.Clear;
  edPrestPorDictPV.Clear;
  fraCIE10.Clear;
  fraCIE10.ShowBajas := False;
  fraGravedadCIE10.Clear;

  cmbTipoTratam.Clear;
  edTipoTramite.Clear;
  deIntDesde.Date    := 0;
  deIntHasta.Date    := 0;
  edInternacion.Text := '';
  edMedico.Text      := '';
  edRecibido.Date    := 0;
  edUsuAlta.Text     := '';
  edGTrabajo.Text    := '';
  edDelegacion.Text  := '';

  cmbTipo.Clear;
  chkReca.Checked := false;
  
  edAutorizacion.Enabled  := False;
  btnAutorizacion.Enabled := False;
  edAutorizacion.Text     := '';

  chkEmpresaVIP.Checked   := False;
  chkProtGeneral.Checked  := False;
  chkRevisar.Checked      := False;
  chkInfectologia.Checked := False;

  edObs.Lines.Clear;
  edObs.ReadOnly := True;

  DoHabilitarInca(False);
  sdqPartes.Close;
  mnuSupervisor.Enabled := False;
  mnuMedico.Enabled     := False;
  chkDEAM.Checked       := False;   // TK 50107
end;

function TfrmParteEvolutivo.CargarPartes(bMensaje: Boolean = True): Boolean;
var
  sMensaje, sMensajeCartel, TipoEgreso, ssql: String;
  bFaltaCeseILT: Boolean;
  dFechaAltaMedica, dEgreso: TDate;
begin
  sMensaje := '';
  sdqPartes.Close;
  Result := True;

  with sdqBusqueda do
  begin
    Close;
    ParamByName('pSiniestro').AsInteger := SinEdit.Siniestro;
    ParamByName('pOrden').AsInteger     := SinEdit.Orden;
    ParamByName('pRecaida').AsInteger   := SinEdit.Recaida;
    Open;
  end;

  if AreIn(sdqBusquedaEX_CAUSAFIN.AsString, ['99', '95']) then
  begin
    MsgBox('El siniestro seleccionado ha sido cerrado por error de carga.', MB_ICONEXCLAMATION);
    Result := False;
    tbPedInfo.Enabled := False;
  end
  else if sdqBusqueda.RecordCount = 0 then
  begin
    Result := False; //No existe el Siniestro
    ChkDialog('CargPartes_NoSini', 'No existe el siniestro buscado. Verifique los datos ingresados.', 'Error de Busqueda', '', mtInformation);
    tbPedInfo.Enabled := False;
  end
  else
  begin
    btnSiniMasDatos.Enabled := Seguridad.Activar(btnSiniMasDatos);

    if fraEmpresa.Contrato <> sdqBusquedaEX_CONTRATO.AsInteger then
    begin
      fraEmpresa.Contrato := sdqBusquedaEX_CONTRATO.AsInteger;

      sMensajeCartel := GetMensajeEstadoEmpresa(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);      // Por TK 39980
      if (sMensajeCartel > '') then
        InfoHint(fraEmpresa.edContrato, sMensajeCartel);
    end;

    if fraTrabajadorSIN.Siniestro <> SinEdit.SinOrdRec then
      fraTrabajadorSIN.IdSiniestro := sdqBusquedaEX_ID.AsInteger;

   // Do_EvaluarIFFI;  // TK 25970
    Do_EvaluarPosibleFraude; // TK  63642

    btnPrimerRangoInternacion.Enabled := Seguridad.Activar(btnPrimerRangoInternacion);  // TK 16759

    dtFechaControl.MinDate := sdqBusquedaEX_FECHAACCIDENTE.AsDateTime;
    edSinFecha.Date        := sdqBusquedaEX_FECHAACCIDENTE.AsDateTime;
    edCausaFin.Text        := sdqBusquedaCAUSAFIN.AsString;
    MemoDiagnosticoSin.Lines.Text := sdqBusquedaEX_DIAGNOSTICO.AsString;         // TK 19070
    MemoMecanismoAccid.Lines.Text := sdqBusquedaEX_MECANISMOACCID.AsString;      // TK 19070
    edPuestoSector.Text    := sdqBusquedarl_tarea.AsString + IIF(sdqBusquedarl_sector.AsString = '', '', ' (' + sdqBusquedarl_sector.AsString + ')');
    edEstadoSSA.Text       := Get_EstadoSSA(sdqBusquedaEX_ID.AsInteger);         // TK 19070
    edGTrabajo.Text        := sdqBusquedaGP_NOMBRE.AsString +
                              Get_UsuGestor(sdqBusquedaEX_ID.AsInteger, True);
    edDelegacion.Text      := sdqBusquedaEL_NOMBRE.AsString;
    chkReqSRT.Checked      := (sdqBusquedaREQ.AsString = 'S');
    chkSumario.Checked     := (sdqBusquedaSUM.AsString = 'S');
    chkRemis.Checked       := (sdqBusquedaEX_AMERITAREMIS.AsString = 'S');
    chkGSueldos.Checked    := (sdqBusquedaGRANSUELDO.AsString = 'S');
    edGesAud.Text          := sdqBusquedaEX_FECHAGESTAUD.AsString;
    chkComMed.Checked      := (sdqBusquedaCOMMED.AsString = 'S');
    chkSRT.Checked         := ExisteSql('SELECT 1' +
                                         ' FROM sdg_denunciasgraves' +
                                        ' WHERE dg_siniestro = ' + SinEdit.SiniestroSql +
                                          ' AND dg_orden = ' + SinEdit.OrdenSql);

    sdqPartes.Close;
    sdqPartes.Sql.Text :=
      'SELECT pv_idexpediente, pv_siniestro, pv_orden, pv_recaida, pv_nroparte, pv_fechacontrol, pv_proximocontrol,' +
            ' pv_diagnostico, pv_identifprestador, pv_diagnosticooms, pv_gravedadcie10, pv_tipotratamiento,' +
            ' pv_auditor, pv_internadodesde, pv_internadohasta, pv_desde, pv_hasta, pv_sitiointernacion, pv_medico,' +
            ' pv_observaciones, pv_fecharecepcion, pv_operprog, pv_nrodenunciasrt, pv_tipoparte, pv_autorizacion,' +
            ' pv_usualta, pv_fechaalta, pv_turno, pv_turnohora, pv_evip, pv_medicacion, pv_reposo,' +
            ' pv_protocologeneral, pv_arevisar, pv_fechabaja, pv_usubaja, pv_motivobaja, pv_usumodif,' +
            ' pv_porcincapacidad, pv_infectologia, pv_idcitacion, pv_prestpordictamen, pv_horaproximocontrol, pv_recalificacion, ' +  // TK 17588
            ' pv_deam, pv_fechadeam ' +
       ' FROM spv_parteevolutivo' +
      ' WHERE pv_siniestro = ' + SinEdit.SiniestroSql +
        ' AND pv_orden = ' + SinEdit.OrdenSql +
        ' AND pv_recaida = ' + SinEdit.RecaidaSql +
              SortDialog.OrderBy;
    OpenQuery(sdqPartes);

    if sdqPartes.RecordCount > 0 then
    begin
      dbcPartes.Enabled := True;
      dbcPartes.SetFocus;
      dbcPartes.Last; // Se va al Último Registro
      // dbcPartes.DoDropDown; //Desabilitado por el momento....no gusta

      //---[ Desactiva las Busquedas ]----------------------------------------//
      VCLExtra.LockControls([fraEmpresa, fraTrabajadorSIN], True);

      if (cmbTipo.FieldValue = 'M') and (Trim(edPrestPorDictPV.Text) = '') then      // TK 5967
        VCLExtra.LockControls([edPrestPorDictPV], False)
      else
        VCLExtra.LockControls([edPrestPorDictPV], True);

      edObs.ReadOnly          := True;
      tbNuevo.Enabled         := Seguridad.Activar(tbNuevo);
      tbPedInfo.Enabled       := Seguridad.Activar(tbPedInfo);
      TbEnvTlgCart.Enabled    := Seguridad.Activar(TbEnvTlgCart);
      tbImprimir.Enabled      := Seguridad.Activar(tbImprimir);
      tbEliminar.Enabled      := Seguridad.Activar(tbEliminar) and sdqPartesPV_FECHABAJA.IsNull;
    //  tbViajar.Enabled        := Seguridad.Activar(tbViajar);  // por TK 17530
      tbDatosBaja.Enabled     := Seguridad.Activar(tbDatosBaja);
      chkInfectologia.Enabled := False;
      DoHabilitarObs;
      EnableNavigator;

      Do_EvaluarDEAM;  // TK 50107


    end
    else if Seguridad.Activar(tbNuevo) then
      if MsgAsk('No se ha encontrado ningún parte para este siniestro.' + #13 + '¿Desea crear un nuevo parte?') and
         ValidarOtros(sdqBusquedaEX_ID.AsInteger) then
      begin
        tbNuevoClick(nil);
        fraPrestador.IDPrestador := sdqBusquedaEX_PRESTADOR.AsInteger;
        fraPrestador.FrameExit(Self);
        OnPrestadorChange(Self);
      end
      else begin
        Result          := False; // No quiere Crear uno Nuevo
        tbNuevo.Enabled := True;
      end;

    edCatCIE10.Text := get_descripcionCIE10(sdqBusqueda.fieldbyname('ex_id').AsInteger);

    // Para armar mensaje de Fecha de alta medica y parte de egreso. by LU -------------------
    dFechaAltaMedica := ValorSqlDateTimeEx('SELECT pe_fechaaltamedica' +
                                            ' FROM spe_parteegreso' +
                                           ' WHERE pe_siniestro = :Sini ' +
                                             ' AND pe_orden = :Ord ' +
                                             ' AND pe_recaida = :Reca', [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);

    TipoEgreso := ValorSqlEx('SELECT tb_descripcion' +
                              ' FROM spe_parteegreso, ctb_tablas' +
                             ' WHERE tb_clave = ''TEGRE''' +
                               ' AND tb_codigo = pe_tipodeegreso' +
                               ' AND pe_siniestro = :Sini ' +
                               ' AND pe_orden = :Ord ' +
                               ' AND pe_recaida = :Reca', [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);

    PrestAnt := fraPrestador.IDPrestador;

    if dFechaAltaMedica > 0 then
    begin
      sMensaje      := 'Fecha de alta Médica: ' + DateToStr(dFechaAltaMedica);
      bFaltaCeseILT := (dFechaAltaMedica > StrToDate('01/01/2008')) and
                       (sdqBusquedaEX_CAUSAFIN.AsString <> '02') and
                       (ValorSqlEx('SELECT NVL(ex_fechaceseilt, '''') ' +
                                    ' FROM sex_expedientes ' +
                                   ' WHERE ex_siniestro = :Sini ' +
                                     ' AND ex_orden = :Ord ' +
                                     ' AND ex_recaida = :Reca', [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) = '');
      if bFaltaCeseILT then
        sMensaje := sMensaje + #13 + 'Falta formulario de cese de ILT';
    end;
    if TipoEgreso <> '' then
      sMensaje := sMensaje + #13 + 'Tipo de Egreso: ' + TipoEgreso;

    sSql := ' select art.trabajador.get_fechaegresocontrato(:idtrab, :cont) from dual ';
    dEgreso := ValorSqlDateTimeEx(sSql, [fraTrabajadorSIN.IdTrabajador, fraTrabajadorSIN.Contrato]);

    if (dEgreso > 0) and (dEgreso >= sdqBusqueda.FieldByName('ex_fechaaccidente').AsDateTime) then
      sMensaje := sMensaje + #13 + 'El trabajador egresó de la empresa';

    if (sMensaje <> '') and (bMensaje) then
      //MsgBox(sMensaje, MB_ICONQUESTION);
      InfoHint(SinEdit, sMensaje, False, 'Información', blnInfo, 8);
  end;
end;

procedure TfrmParteEvolutivo.dbcPartesCloseUp(Sender: TObject);
var
  bActivar: Boolean;
  Sql: String;
begin
  deIntDesde.ClearRange;
  deIntHasta.ClearRange;
  //-------------------------------------------------------------------------//
  dtFechaControl.Date     := sdqPartesPV_FECHACONTROL.AsDateTime;
  dtFechaProxControl.Date := sdqPartesPV_PROXIMOCONTROL.AsDateTime;
  mskHoraProxControl.Text := sdqPartesPV_HORAPROXIMOCONTROL.AsString;   // TK 19562
  //-------------------------------------------------------------------------//
  edDiagnostico.Text  := sdqPartesPV_DIAGNOSTICO.AsString;
  //deIntDesde.Date     := sdqPartesPV_INTERNADODESDE.AsDateTime;       // Lu 15/09/2009 lo pasé para abajo
  //IntDesde            := deIntDesde.Date;
  deIntHasta.Date     := sdqPartesPV_INTERNADOHASTA.AsDateTime;
  edInternacion.Text  := sdqPartesPV_SITIOINTERNACION.AsString;
  edMedico.Text       := sdqPartesPV_MEDICO.AsString;
  edRecibido.Date     := sdqPartesPV_FECHARECEPCION.AsDateTime;
  edObs.Lines.Text    := sdqPartesPV_OBSERVACIONES.AsString;
  cmbTurno.Date       := sdqPartesPV_TURNO.AsDateTime;
  mskHora.Text        := sdqPartesPV_TURNOHORA.AsString;
  //edPrestPorDictPV.Text := sdqPartesPV_PRESTPORDICTAMEN.AsString  // TK 17588
  edPrestPorDictPV.Text := ValorSqlEx('Select ART.SINIESTRO.Get_PrestPorDictamen(:idexp, :nroparte) ' +   // TK 18740 : trae el pv_prestpordictamen anterior inmediato (o el mismo, en el caso que fuera tipo parte = 'M')
                                       ' From dual', [sdqPartesPV_IDEXPEDIENTE.AsInteger,
                                                      sdqPartesPV_NROPARTE.AsInteger]);
  DoHabilitarObs;

  chkEmpresaVIP.Checked   := IIF((sdqPartesPV_EVIP.AsString = 'S'), True, False);
  chkProtGeneral.Checked  := IIF((sdqPartesPV_PROTOCOLOGENERAL.AsString = 'S'), True, False);
  chkProtGeneral.Enabled  := IIF((sdqPartesPV_PROTOCOLOGENERAL.AsString = 'S'), False, True);
  chkRevisar.Checked      := IIF((sdqPartesPV_AREVISAR.AsString = 'S'), True, False);
  chkInfectologia.Checked := IIF((sdqPartesPV_INFECTOLOGIA.AsString = 'S'), True, False);
  chkReca.Checked         := IIF(sdqPartesPV_RECALIFICACION.AsString = 'S', True, False);

  chkDEAM.Checked         := IIF(sdqPartesPV_DEAM.AsString = 'S', True, False);   // TK 50107

  //----[ Tipo de Tratamiento ]----------------------------------------------//
  if sdqPartesPV_TIPOTRATAMIENTO.AsString <> '' then
  begin
    cmbTipoTratam.FieldValue := sdqPartesPV_TIPOTRATAMIENTO.AsString;
    cmbTipoTratamExit(nil);
  end
  else begin
    edTipoTramite.Clear;
    cmbTipoTratam.Clear;
  end;

  //----[ Auditores ]--------------------------------------------------------//
  fraAuditor.ShowBajas  := True; //sólo para cargar los que hayan sido dados de baja
  fraAuditor.Codigo     := sdqPartesPV_AUDITOR.AsString;
  fraAuditor.ShowBajas  := False;

  //---[ Carga el CIE10 ]----------------------------------------------------//
  fraCIE10.ShowBajas     := True;
  fraCIE10.Value         := sdqPartesPV_DIAGNOSTICOOMS.AsString;
  fraCIE10.ShowBajas     := False;
  fraGravedadCIE10.Value := sdqPartesPV_GRAVEDADCIE10.AsString;
  edPorcentaje.Value     := sdqPartesPV_PORCINCAPACIDAD.AsCurrency;
  edPorcentajeN.Visible  := sdqPartesPV_PORCINCAPACIDAD.IsNull;

  //---[ Carga el Prestador ]------------------------------------------------//
  fraPrestador.Cargar(sdqPartesPV_IDENTIFPRESTADOR.AsInteger);

  deIntDesde.Date     := sdqPartesPV_INTERNADODESDE.AsDateTime;      // Lu 15/09/2009 lo hago aca luego que se cargue el Prestador.
  IntDesde            := deIntDesde.Date;

  //---[ Rextricciones de las Fechas ]---------------------------------------//
  deIntDesde.MinDate   := edSinFecha.Date;
  //----[ Autorizaciones ]---------------------------------------------------//
  cmbTipo.FieldValue  := sdqPartesPV_TIPOPARTE.AsString;
  edAutorizacion.Text := sdqPartesPV_AUTORIZACION.AsString;

  edUsuAlta.Text      := sdqPartesPV_FECHAALTA.AsString + ' - ' + 
                         sdqPartesPV_USUALTA.AsString;

  Sql := 'SELECT 1' +
          ' FROM sau_autorizaciones' +
         ' WHERE au_siniestro = ' + SinEdit.SiniestroSql +
           ' AND au_orden = ' + SinEdit.OrdenSql +
           ' AND au_recaida = ' + SinEdit.RecaidaSql +
           ' AND au_numauto = ' + edAutorizacion.TextSql  +
           ' AND au_estado IN (''E'', ''A'')';
  bActivar := (edAutorizacion.Text = '') or ExisteSql(Sql);

  grpPrestador.Enabled    := bActivar;
  cmbTipo.Enabled         := bActivar;
  btnAutorizacion.Enabled := bActivar and (cmbTipo.FieldValue = 'I');
  //-------------------------------------------------------------------------//
  dbcPartes.Enabled       := True;
  tbNuevo.Enabled         := Seguridad.Activar(tbNuevo);
  tbPedInfo.Enabled       := Seguridad.Activar(tbPedInfo);
  TbEnvTlgCart.Enabled    := Seguridad.Activar(TbEnvTlgCart);
  tbEliminar.Enabled      := Seguridad.Activar(tbEliminar) and sdqPartesPV_FECHABAJA.IsNull;
  tbDatosBaja.Enabled     := Seguridad.Activar(tbDatosBaja);
  //si el parte es de Auditoría, no se puede modificar desde acá (solamente desde Siniestros)
  tbGuardar.Enabled       := Seguridad.Activar(tbGuardar) and (cmbTipo.FieldValue <> 'U') and
                            sdqPartesPV_FECHABAJA.IsNull;
  if tbGuardar.Enabled then
    lbOperacion.Caption := sOperaciones[1];
    
  EnableNavigator;
  DoHabilitarObsAud;
end;

procedure TfrmParteEvolutivo.FormCreate(Sender: TObject);
var
  bPermisoCie10: Boolean;
begin
  inherited;
  try
    CheckStoreProc('AMEBPBA');
    sdqTipo.Open;
    tbLimpiarClick(nil);
    sdqTipoTramite.Open;
    edRecibido.MaxDate              := DBDateTime;
    FechaActual                     := edRecibido.MaxDate;
    dtFechaControl.MaxDate          := edRecibido.MaxDate;
    fraPrestador.OnChange           := OnPrestadorChange;
    fraTrabajadorSIN.OnChange       := OnTrabajadorChange;
    fraTrabajadorSIN.Tercerizadoras := EsUsuarioDeTercerizadora;
    fraEmpresa.OnChange             := OnEmpresaChange;
    fraEmpresa.Tercerizadoras       := fraTrabajadorSIN.Tercerizadoras;
    fraPrestador.ShowBajas          := True;

    VCLExtra.LockControls([mskHoraProxControl, chkReca, chkDEAM], True);   // TK 19562 (este dato solo se muestra ya que se carga desde conexia)  // y ... TK 50107

    bPermisoCie10           := Seguridad.Claves.IsActive('CIE10-P.EVOLUTIVO');
    fraCIE10.Locked         := not bPermisoCie10;
    fraGravedadCIE10.Locked := not bPermisoCie10;
    tbResumenSum.Enabled    := Seguridad.Activar(tbResumenSum);  // TK 19070
    btnPrimerRangoInternacion.Enabled := False;                  // TK 16759

    frmPrincipal.mnuParteEvolutivoCarga.Enabled := False;

    with fraCIE10 do
    begin
      TableName   := 'CDG_DIAGNOSTICO';
      FieldID     := 'DG_CODIGO';
      FieldCodigo := 'DG_CODIGO';
      FieldDesc   := 'DG_DESCRIPCION';
      FieldBaja   := 'DG_FECHABAJA';
      ShowBajas   := False;
    end;

    fraTrabajadorSIN.SoloSiniestrados := True;
    fraGravedadCIE10.Clave     := 'GRAVC';
    fraGravedadCIE10.ShowBajas := False;

    with fraAuditor do
    begin
      FieldID     := 'AU_AUDITOR';
      FieldCodigo := 'AU_AUDITOR';
      FieldDesc   := 'AU_NOMBRE';
      TableName   := 'MAU_AUDITORES';
      FieldBaja   := 'AU_FBAJA';
      ShowBajas   := False;
    end;

    mnuSupervisor.Enabled := False;
    mnuMedico.Enabled     := False;
    tbSuspension.Enabled  := Seguridad.Activar(tbSuspension) and
                             Seguridad.Claves.IsActive('CargarAdministrativoMedico');

    vclextra.Lockcontrols([mObsRevisar48, chkRevisar48]);

  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Error al crear el Formulario.');
      Close;
    end;
  end;
end;


procedure TfrmParteEvolutivo.tbNuevoClick(Sender: TObject);
var
  Consulta: TSDQuery;
  EVIP_enTabla: Boolean;
  sSql: String;
begin
  Verificar(Is_SiniestroSML(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida))
            and not Is_UsuarioSML(Sesion.UserID)
            and not Seguridad.Claves.IsActive('CargaPartesSML'),
            tbNuevo, 'Usted no tiene permisos para Cargar un Parte');   // TK 38012

  tbLimpiarClick(nil);

  lbOperacion.Caption     := sOperaciones[2]; // Alta
  tbGuardar.Enabled       := True; // Sin preguntar por la Seguridad porque es Alta!
  tbEliminar.Enabled      := False;
  tbDatosBaja.Enabled     := False;
  tbNuevo.Enabled         := False;
  tbPedInfo.Enabled       := False;
  TbEnvTlgCart.Enabled    := False;
  tbRefrescar.Enabled     := False;
  tbImprimir.Enabled      := False;
  dbcPartes.Enabled       := False;
  edObs.ReadOnly          := False;
  grpPrestador.Enabled    := True;
  cmbTipo.Enabled         := True;
  btnAutorizacion.Enabled := True;
  chkInfectologia.Enabled := Seguridad.Activar(chkInfectologia);
  EVIP_enTabla := ExisteSql('SELECT 1' +
                             ' FROM mep_empresavip' +
                            ' WHERE ep_cuit = ' + SQLValue(fraEmpresa.CUIT) +
                              ' AND ep_fechabaja IS NULL');

  //-----[ Calcula el Número del nuevo parte y el Prestador por defecto ]------------------------------------------//
  MostrarEstado('Calculando el Número del nuevo parte...');
  sSql :=
    'SELECT pv_nroparte, pv_identifprestador, pv_internadodesde, pv_internadohasta, pv_operprog, pv_evip,' +
          ' pv_protocologeneral, art.siniestro.get_cie10(pv_idexpediente) cie10,' +               // TK 12140 se cambio la funcion art.amebpba.get_gravedadcie10_egreso por esta para el Cie10
          ' art.siniestro.get_Cie10Gravedad(pv_idexpediente) gravedadcie10, pv_idexpediente ' +   // TK 12140 idem se cambio la funcion, pero de Gravedad del Cie10.
     ' FROM spv_parteevolutivo t1' +
    ' WHERE pv_siniestro = :P1' +
      ' AND pv_orden =  :P2' +
      ' AND pv_recaida =  :P3' +
      ' AND pv_nroparte = (SELECT max(pv_nroparte)' +
                           ' FROM spv_parteevolutivo t2' +
                          ' WHERE t1.pv_siniestro = t2.pv_siniestro' +
                            ' AND t1.pv_orden = t2.pv_orden' +
                            ' AND t1.pv_recaida = t2.pv_recaida)';
  Consulta := GetQueryEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);
  try
    chkEmpresaVIP.Checked := IIF(EVIP_enTabla,True,False);
    if Consulta.Eof then
    begin
      if not ValidarOtros(sdqBusquedaEX_ID.AsInteger) then Exit;
      dbcPartes.Text := '1';
      fraPrestador.Value := ValorSqlIntegerEx('SELECT art.amebpba.get_prestador(:P1, :P2, :P3) FROM DUAL',
                                              [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);
    end
    else begin
      chkProtGeneral.Checked  := IIF(Consulta.FieldByName('PV_PROTOCOLOGENERAL').AsString = 'S', True, False);
      dbcPartes.Text          := IntToStr(Consulta.FieldByName('PV_NROPARTE').AsInteger + 1);
      fraPrestador.Value      := Consulta.FieldByName('PV_IDENTIFPRESTADOR').AsInteger;
      //------------------------------------------------------------------------------------------------
      if (Consulta.FieldByName('PV_INTERNADODESDE').AsDateTime > 0) and
         (Consulta.FieldByName('PV_INTERNADOHASTA').AsDateTime = 0) then
      begin
        deIntDesde.Date         := Consulta.FieldByName('PV_INTERNADODESDE').AsDateTime;
        deIntDesde.ReadOnly     := True;
      end
      else
        deIntDesde.ReadOnly     := False;

      if deIntDesde.Date <> 0 then
      begin
        IntDesde  := deIntDesde.Date;
        PrestAnt  := Consulta.FieldByName('PV_IDENTIFPRESTADOR').AsInteger;
      end
      else
        IntDesde := 0;

      fraCIE10.ShowBajas     := True;
      fraCIE10.Value         := Consulta.FieldByName('CIE10').AsString;
      fraCIE10.ShowBajas     := False;
      fraGravedadCIE10.Value := Consulta.FieldByName('GRAVEDADCIE10').AsString;
    end;
  finally
    Consulta.Free;
  end;
  dtFechaControl.SetFocus;
  MostrarEstado('Cargue los datos del nuevo parte.');
  DoHabilitarObsAud;
  PreferenciasDerivacion((ArrayPos(lbOperacion.Caption, sOperaciones) = 2) and fraPrestador.IsEmpty);

end;

procedure TfrmParteEvolutivo.tbGuardarClick(Sender: TObject);
var
  bModif :Boolean;
  iCantHojas, IdExped, sCantAudit :Integer;
  sDestinoPapel, sPorcInca, sSiniPres, sSiniDelPres, sSql,
  IdExpRelacionado, SiniPluriemp, sTipoDoc, sUsuAltaParte, marcareca{, sLeyendaTopeado} :String;
  dVencimiento: TDate;
  SeCargo, SeModifico: boolean;
begin
  iCantHojas := 0;
  sCantAudit := 1;  // Lu 06/05/2008 WF 7333 (lo inicializo en 1 por default)
  cmbTipoTratamExit(nil);
  IdExpRelacionado := '';
  SiniPluriemp     := '';
  SeCargo          := False;
  SeModifico       := False;

  IdExped   := Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
  sSiniPres := 'SELECT amebpba.is_sini_prestador( ' +
                                SqlInt(IdExped) + ',' +
                                SqlInt(fraPrestador.IDPrestador) + ')' +
                ' FROM dual';

  sSiniDelPres := 'SELECT amebpba.is_siniestrodelprestador( ' +              // TK 8638
                                SqlInt(IdExped) + ',' +
                                SqlInt(fraPrestador.IDPrestador) + ')' +
                   ' FROM dual';

  bModif := (ArrayPos(lbOperacion.Caption, sOperaciones) = 1);

  if Validar then
  begin

     // camarillo - si se carga un parte de tipo "Informe", se debe cargar la cantidad de practicas realizadas
     if not (bModif) and (cmbTipo.FieldValue = 'I') and not (CargarCantRealizadas) then
       Exit;

     //------------------------------------------------------------------------------------------
     if ActualizarAutorizacion then
     begin
       if bModif then
       begin // Modificacion
         SeModifico := True;

         sSql :=
           'UPDATE spv_parteevolutivo' +
             ' SET pv_fechacontrol = ' + dtFechaControl.SqlText + ',' +
                 ' pv_proximocontrol = ' + dtFechaProxControl.SqlText + ',' +
                 ' pv_diagnostico = ' + SqlString(edDiagnostico.Text, True) + ',' +
                 ' pv_identifprestador = 0' + IntToStr(fraPrestador.IDPrestador) + ',' +
                 ' pv_diagnosticooms = ' + SqlString(fraCIE10.Value, True) + ',' +
                 ' pv_gravedadcie10 = ' + SqlString(fraGravedadCIE10.Value, True) + ',' +
                 ' pv_tipotratamiento = ''' + cmbTipoTratam.Text + ''',' +
                 ' pv_auditor = ' + SqlInt(fraAuditor.ID) + ',' +
                 ' pv_internadodesde = ' + deIntDesde.SqlText + ',' +
                 ' pv_internadohasta = ' + deIntHasta.SqlText + ',' +
                 ' pv_sitiointernacion = ' + SqlString(edInternacion.Text, True) + ',' +
                 ' pv_medico = ' + SqlString(edMedico.Text, True) + ',' +
                 // WF 6758
                 ' pv_observaciones = ' + IIF((not fraCie10.IsEmpty) and IsEmptyString(edObs.Lines.Text) and
                                               EsPrimerParte ('V', SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida),
                                               SqlString('Actualización cie10', True),
                                               SqlString(edObs.lines.Text, True)) + ',' +
                 ' pv_fecharecepcion = ' + edRecibido.SqlText + ',' +
                 ' pv_tipoparte = ' + SqlString(cmbTipo.FieldValue, True) + ',' +
                 ' pv_autorizacion = ' + SqlInt(edAutorizacion.Value, True) + ',' +
                 ' pv_usumodif = ''' + Sesion.LoginName + ''',' +
                 ' pv_turno = ' + cmbTurno.SqlText + ',' +
                 ' pv_turnohora = ''' + mskHora.Text + ''',' +
                 ' pv_evip = ''' + IIF(chkEmpresaVip.Checked, 'S','N') + ''',' +
                 ' pv_protocologeneral = ''' + IIF(chkProtGeneral.Checked, 'S', 'N') + ''',' +
                 ' pv_arevisar = ''' + IIF(chkRevisar.Checked, 'S', 'N') + ''',' +
                 ' pv_fechamodif = ActualDate, ' +
                 ' pv_prestporDictamen = ' + SqlString(edPrestPorDictPV.Text,true) + ', ' +  // TK 17588
                 ' pv_recalificacion = ' + QuotedStr(iif(chkReca.Checked, 'S', 'N')) + ', ' +
                 ' pv_deam = ''' + IIF(chkDEAM.Checked, 'S', 'N') + ''',' +     // TK 50107
                 ' pv_fechadeam = art.actualdate ' +
           ' WHERE pv_siniestro = 0' + SinEdit.SiniestroS +
             ' AND pv_orden = 0' +  SinEdit.OrdenS +
             ' AND pv_recaida = 0' + SinEdit.RecaidaS +
             ' AND pv_nroparte = ' + dbcPartes.Text ;


         marcareca := ValorSqlEx('select nvl(pv_recalificacion, ''N'') from art.spv_parteevolutivo ' +
                                 ' where pv_siniestro = :sin and pv_orden = :ord ' +
                                   ' and pv_recaida = :rec and pv_nroparte = :nparte ',
                                   [SinEdit.SiniestroS, SinEdit.OrdenS, SinEdit.RecaidaS, dbcpartes.Text]);

         if (chkReca.Checked = false) then
         begin
           if marcareca = 'S' then
             EjecutarSqlEx(' BEGIN ART.SINIESTRO.DO_GENERAREVENTORECA(:SINIESTRO, :ORDEN, ''PEV'', :USUALTA, ' +
                           ' :RECALIFICACION, NULL, NULL, :RECAIDA, :NROPARTE); END; ', [SinEdit.SiniestroS,
                                           SinEdit.OrdenS, sesion.UserID, 'N', SinEdit.RecaidaS, dbcpartes.Text]);
         end
         else
         begin
           if marcareca = 'N' then
             EjecutarSqlEx(' BEGIN ART.SINIESTRO.DO_GENERAREVENTORECA(:SINIESTRO, :ORDEN, ''PEV'', :USUALTA, ' +
                           ' :RECALIFICACION, NULL, NULL, :RECAIDA, :NROPARTE); END;', [SinEdit.SiniestroS,
                                           SinEdit.OrdenS, sesion.UserID, 'S', SinEdit.RecaidaS, dbcpartes.Text])
         end;

         // Lu TK 1439
         sUsuAltaParte := ValorSql(' Select upper(pv_usualta) ' +
                                     ' From art.spv_parteevolutivo ' +
                                    ' WHERE pv_siniestro = 0' + SinEdit.SiniestroS +
                                      ' AND pv_orden = 0' +  SinEdit.OrdenS +
                                      ' AND pv_recaida = 0' + SinEdit.RecaidaS +
                                      ' AND pv_nroparte = ' + dbcPartes.Text);
         // Lu TL 1439 si el usu es conexia => Digitaliza:
         if sdqPartesPV_USUALTA.AsString = 'CONEXIA' then
         begin
           sTipoDoc        := GetTipoDoc;
           frmDestinoPapel := TfrmDestinoPapel.Create(self);
           try
             frmDestinoPapel.LblCDoc.Caption := 'Tipo de Documento: ' + sTipoDoc;
             frmDestinoPapel.Showmodal;
             sDestinoPapel := frmDestinoPapel.DestinoPapel;
             iCantHojas    := frmDestinoPapel.CantHojas;
           finally
             FreeAndNil(frmDestinoPapel);
           end;
           if not (sDestinoPapel = '') and (sDestinoPapel <> DP_SINPAPEL) then     // de Kuster "(sDestinoPapel <> DP_SINPAPEL)"  autorizado por patlante.
           begin
             if not EsParteDigitalizado(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida,
                                        StrToInt(dbcPartes.Text), sTipoDoc) then
             begin
               BeginTrans;
               try
                 Do_Actualizar_Archivo_Sin(False, IdExped, sDestinoPapel, iCantHojas,
                                           Sesion.LoginName, sTipoDoc, 0, 'A', StrToInt(dbcPartes.Text));
                 CommitTrans;
               except
                 Rollback;
                 raise;
               end;
             end
             else
               showmessage('El parte ya se encuentra Digitalizado');
           end;
         end;

       end
       else
       begin   // Alta
           SeCargo   := True;
           sPorcInca := IIF(chkEstimar.Checked, SqlNumber(edPorcentaje.Value), 'Null');

           // Lu 06/05/2008 WF 7333
           if rbPuntual.Checked then
             sCantAudit := 1
           else if rbSol24hs.Checked then
             sCantAudit := 4
           else if rbSol48hs.Checked then
             sCantAudit := 3
           else if rbSol72hs.Checked then
             sCantAudit := 2;

           // WF 6758
           if (not fraCie10.IsEmpty) and IsEmptyString(edObs.Text) and EsPrimerParte('A', SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida) then
             edObs.Text := 'Actualización cie10';

           sSql :=
             'INSERT INTO spv_parteevolutivo (pv_siniestro, pv_orden, pv_recaida, pv_nroparte, pv_fechacontrol,' +
                                            ' pv_proximocontrol, pv_diagnostico, pv_identifprestador, pv_diagnosticooms,' +
                                            ' pv_gravedadcie10, pv_tipotratamiento, pv_auditor, pv_internadodesde,' +
                                            ' pv_internadohasta, pv_sitiointernacion, pv_medico,' +
                                            ' pv_observaciones, pv_fecharecepcion, pv_tipoparte, pv_autorizacion,' +
                                           { ' pv_operprog, } ' pv_usualta, pv_fechaalta, pv_turno,' +
                                            ' pv_turnohora, pv_evip, pv_protocologeneral,' +
                                            ' pv_arevisar, pv_infectologia, pv_fechacarga, pv_porcincapacidad, pv_cantaudit, ' +  // Lu 06/05/2008 WF 7333
                                            ' pv_prestpordictamen, pv_recalificacion, pv_deam, pv_fechadeam)' +   // TK 19562     // y TK 50107
                                    ' VALUES (0' + SinEdit.SiniestroS + ', 0' + SinEdit.OrdenS + ', 0' + SinEdit.RecaidaS +
                                               ', ' + dbcPartes.Text + ', ' + dtFechaControl.SqlText + ', ' +
                                               dtFechaProxControl.SqlText + ', ' + SqlString(edDiagnostico.Text, True) +
                                               ', 0' + IntToStr(fraPrestador.IDPrestador) + ', ' +
                                               SqlString(fraCIE10.Value, True) + ', ' +
                                               SqlString(fraGravedadCIE10.Value, True) + ', ' +
                                               SqlValue(cmbTipoTratam.Text) + ',' +  SqlInt(fraAuditor.ID) + ', ' +
                                               deIntDesde.SqlText + ', ' + deIntHasta.SqlText + ', ' +
                                               SqlString(edInternacion.Text, True) + ', ' + SqlString(edMedico.Text, True) +
                                               ', ' + SqlString(edObs.lines.Text, True) + ', ' + edRecibido.SqlText + ', ' +
                                               SqlString(cmbTipo.FieldValue, True) + ', ' +
                                               SqlInt(edAutorizacion.Value, True) + ', ' + '''' +
                                               Sesion.LoginName + ''', ActualDate, ' + cmbTurno.SqlText + ', ''' +
                                               mskHora.Text + ''', ''' + IIF(chkEmpresaVip.Checked, 'S', 'N')  + ''', ''' +
                                               IIF(chkProtGeneral.Checked, 'S', 'N') + ''', ''' +
                                               IIF(chkRevisar.Checked, 'S', 'N') + ''', ''' +
                                               IIF(chkInfectologia.Checked, 'S', 'N') + ''', SysDate, ' + sPorcInca + ', ' +
                                               IntToStr(sCantAudit) + ', ' +
                                               SqlString(edPrestPorDictPV.Text, true)    + ', ' +  // Lu 06/05/2008 WF 7333
                                               QuotedStr(iif(chkReca.Checked, 'S', 'N')) + ', ''' +                     // TK 50107
                                               IIF(chkDEAM.Checked, 'S', 'N') + ''', art.actualdate ) ';                // TK 50107

           if chkReca.Checked then
             EjecutarSqlEx(' BEGIN ART.SINIESTRO.DO_GENERAREVENTORECA(:SINIESTRO, :ORDEN, ''PEV'', :USUALTA, ' +
                           ' :RECALIFICACION, NULL, NULL, :RECAIDA, :NROPARTE); END; ', [SinEdit.SiniestroS,
                                           SinEdit.OrdenS, sesion.UserID, 'S', SinEdit.RecaidaS, dbcpartes.Text]);

           // Pasa al estado de Modificación
           lbOperacion.Caption  := sOperaciones[1];
           tbNuevo.Enabled      := Seguridad.Activar(tbNuevo);
           tbPedInfo.Enabled    := Seguridad.Activar(tbPedInfo);
           TbEnvTlgCart.Enabled := Seguridad.Activar(TbEnvTlgCart);
           tbEliminar.Enabled   := Seguridad.Activar(tbEliminar) and sdqPartesPV_FECHABAJA.IsNull;
           tbDatosBaja.Enabled  := Seguridad.Activar(tbDatosBaja);

           IdExpRelacionado := Get_ExpedPluriempleo(sdqBusquedaEX_ID.AsString);   // Lu WF 8139
           if IdExpRelacionado <> '' then
           begin
             SiniPluriemp := ValorSQLEx('SELECT ART.SINIESTRO.get_siniestrocompleto(:IdExp) FROM DUAL', [IdExpRelacionado]);
             MsgBox('El Siniestro posee Pluriempleo. Se enviara un mail al Sector responsable.', MB_ICONINFORMATION + MB_OK);
             DoGenerarAvisoPluriempleo(SinEdit.SiniestroS, SinEdit.OrdenS, SinEdit.RecaidaS, PL_PEVOLUTIVO, SiniPluriemp);  // TK 9505
           end;

           //si el parte es de Auditoría, no se puede modificar desde acá (solamente desde Siniestros)
           tbGuardar.Enabled  := Seguridad.Activar(tbGuardar) and (cmbTipo.FieldValue <> 'U') and sdqPartesPV_FECHABAJA.IsNull;
           tbImprimir.Enabled := Seguridad.Activar(tbImprimir);

           if (ExisteSql('SELECT 1' +
                          ' FROM dlg_delegaciones' +
                         ' WHERE lg_sistemaarchivo = ''S''' +
                           ' AND lg_codigo = ''' + Sesion.Delegacion + '''' +
                        ' HAVING COUNT(*) > 0')) and (not bModif) then
           begin
             sTipoDoc        := GetTipoDoc;
             frmDestinoPapel := TfrmDestinoPapel.Create(self);
             try
               frmDestinoPapel.LblCDoc.Caption := 'Tipo de Documento: ' + sTipoDoc;
               frmDestinoPapel.Showmodal;
               sDestinoPapel := frmDestinoPapel.DestinoPapel;
               iCantHojas    := frmDestinoPapel.CantHojas;
             finally
               FreeAndNil(frmDestinoPapel);
             end;
           end;
       end; // del else

     end; // del if ActualizarAutorizacion

     if SeCargo or SeModifico then
     begin
       try
         BeginTrans;

         MostrarEstado('Guardando / Actualizando Datos...');
         EjecutarSqlST(sSql);
         {------------------------------------------------------------------------------------------------------------}
         if (bModif and ((fraCIE10.Value <> sdqPartesPV_DIAGNOSTICOOMS.AsString) or (sdqPartesPV_INTERNADOHASTA.IsNull and
            (deIntHasta.Date > 0)))) or ((not bModif) and ((fraCIE10.IsSelected) or ((deIntDesde.Date > 0) and
            (deIntHasta.Date = 0)))) or (cmbTipo.FieldValue = 'D') then    //camarillo 20/04/2006 tipo derivacion, debe actutalizar delegacion y grupo
         begin
           MostrarEstado('Asignando Delegación...');
           ActualizarDelegacion;
           MostrarEstado('Asignando Grupo de Trabajo...');
           EjecutarSqlST('BEGIN' +
                         ' art.amebpba.set_gtrabajo(' + SinEdit.SiniestroSql + ', ' +
                                                        SinEdit.OrdenSql + ', ' +
                                                        SinEdit.RecaidaSql + '); ' +
                        ' END;');
         end;
         {------------------------------------------------------------------------------------------------------------}
         MostrarEstado('Asignando Prestadores a Siniestros...');
         EjecutarSqlST('BEGIN' +
                       ' art.amebpba.set_prestador(' + SinEdit.SiniestroSql + ', ' +
                                                       SinEdit.OrdenSql + ', ' +
                                                       SinEdit.RecaidaSql + ');' +
                      ' END;');

         if not (bModif) and (cmbTipo.FieldValue = 'D') and ((ValorSql(sSiniPres) = 'N') or (ValorSql(sSiniDelPres) = 'N')) then
         begin
           if (ValorSql(sSiniPres) = 'N') and MsgAsk('La empresa del siniestro no pertenece al prestador seleccionado, ¿Desea continuar?') then
             EjecutarStoreSTEX('amebpba.do_enviarmail_prestadorempresa(:idex, ''E'', ''E'', :idpres);', [IdExped, fraPrestador.IDPrestador])
           else if (ValorSql(sSiniDelPres) = 'N') and MsgAsk('El siniestro no pertenece al prestador seleccionado, ¿Desea continuar?') then   // TK 8638
             EjecutarStoreSTEX('amebpba.do_enviarmail_prestadorempresa(:idex, ''E'', ''S'', :idpres);', [IdExped, fraPrestador.IDPrestador])
           else
           begin
             Rollback;
             CargarPartes;
             Exit;
           end;
         end;
         {------------------------------------------------------------------------------------------------------------}

         Actualizar_EX_DiagnosticoOMS(SinEdit .Siniestro, SinEdit.Orden, SinEdit.Recaida);

         {------------------------------------------------------------------------------------------------------------}

         if (not bModif) and (not (sDestinoPapel = '')) and (sDestinoPapel <> DP_SINPAPEL) then   // de kuster "and (sDestinoPapel <> DP_SINPAPEL)" autorizado por patlante.
           Do_Actualizar_Archivo_Sin(False, IdExped, sDestinoPapel, iCantHojas, Sesion.LoginName,
                                     sTipoDoc, 0, 'A', StrToInt(dbcPartes.Text));

         if not(bModif) and chkEstimar.Checked then
         begin
           sSql := 'inca.do_generarestimacionaut( ' + SqlInt(SinEdit.Siniestro) + ',' +
                                                      SqlInt(SinEdit.Orden) + ',' +
                                                      SqlNumber(edPorcentaje.Value) + ',' +   // volvi para atras esto porque estaba pasandole Null cuando era cero
                                                      SqlValue(Sesion.UserID) + ',' +
                                                      SqlValue(fraCIE10.Codigo) + ', ''E'');';
           EjecutarStoreST(sSql);
         end;

         if (cmbTipo.FieldValue = 'V') then
         begin
           dVencimiento := ValorSqlDateTimeEx('SELECT art.siniestro.get_vencimdecisionmedica(:idexp) ' +
                                               ' FROM dual', [IdExped]);
           if (dVencimiento > 0) and
              MsgAsk('Atención: aún no se ha tomado una decisión medica para el siniestro seleccionado ' + #13 +
                     '(fecha de vencimiento: ' + DateToStr(dVencimiento) + '), ¿Desea tomarla ahora?') then
              DoViajarSuspension(True, True);
         end;

         CommitTrans;
         // Si es una solicitud de auditoría médica envía un e-mail de aviso..
         if (not bModif) and (cmbTipo.FieldValue = 'O') then
           Do_EnviarMail_SolicAudMedica(sCantAudit, IdExped);

       except
         RollBack;
         raise;
       end;

       DoLimpiar;
     end;  // del if seCargo or seModifico

  end; // el if Validar
end;

procedure TfrmParteEvolutivo.tbRefrescarClick(Sender: TObject);
begin
  with sdqPartes do
  begin
    Close;
    Open;
    Locate('PV_NROPARTE', dbcPartes.Text, []);
    edPorcentaje.Value     := sdqPartesPV_PORCINCAPACIDAD.AsCurrency;
    edPorcentajeN.Visible  := sdqPartesPV_PORCINCAPACIDAD.IsNull;
    chkProtGeneral.Enabled := IIF((sdqPartesPV_PROTOCOLOGENERAL.AsString = 'S'), False, True);
  end;
end;

procedure TfrmParteEvolutivo.btnSiniMasDatosClick(Sender: TObject);
var
  frmDatosSiniestro: TfrmDatosSiniestro;
begin
  frmDatosSiniestro := TfrmDatosSiniestro.Create(Self);
  try
    frmDatosSiniestro.ShowDialog(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
  finally
    frmDatosSiniestro.Free;
  end;
end;

procedure TfrmParteEvolutivo.tbSiguienteClick(Sender: TObject);
begin
   dbcPartes.Next;
end;

procedure TfrmParteEvolutivo.tbAnteriorClick(Sender: TObject);
begin
   dbcPartes.Prior;
end;

procedure TfrmParteEvolutivo.tbPrimeroClick(Sender: TObject);
begin
   dbcPartes.First;
end;

procedure TfrmParteEvolutivo.tbUltimoClick(Sender: TObject);
begin
   dbcPartes.Last;
end;

procedure TfrmParteEvolutivo.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmParteEvolutivo.pmnuImprimirPopup(Sender: TObject);
begin
  mnuImprimirInforme.Enabled := ((dbcPartes.Text <> '') and
                                ((cmbTipo.FieldValue = 'E') or (cmbTipo.FieldValue = 'U')));  // Lu WF 7559
  mnuCartaDerivacion.Enabled := (dbcPartes.Text <> '');
end;

procedure TfrmParteEvolutivo.mnuImprimirPartesClick(Sender: TObject);
begin
  with TdlgImpParteEvolutivo.Create(Self) do
  try
    SinEdit.GetValues(ISiniestro, IOrden, IRecaida);
    edDesde.Value := 1;

    if dbcPartes.Text = '' then
    begin
      edHasta.Value          := 1;
      opSeleccionado.Enabled := False;
      opTodos.Checked        := True;
    end
    else
    begin
      edHasta.Text        := dbcPartes.Text;
      edSeleccionado.Text := dbcPartes.Text;
    end;
    BConTransaccionMail := True;
    Orden := SortDialog.OrderBy;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmParteEvolutivo.mnuCartaDerivacionClick(Sender: TObject);
var
  frmFirmantes: TfrmFirmantes;
  OrigenIdPrest: Integer;
  OrigPrestART: Boolean;
  SqlResults: TStringList;
begin
  OrigPrestART  := False;
  OrigenIdPrest := 0;
  frmFirmantes  := Nil;
  SqlResults    := Nil;

  if dbcPartes.Text <> '' then
    OrigenIdPrest := ValorSqlIntegerEx('SELECT pv_identifprestador ' +
                                        ' FROM spv_parteevolutivo ' +
                                       ' WHERE pv_siniestro = :Sin ' +
                                         ' AND pv_orden = :Ord ' +
                                         ' AND pv_recaida = :Reca ' +
                                         ' AND pv_nroparte = (SELECT NVL(MAX(pv_nroparte), 0) ' +
                                                              ' FROM spv_parteevolutivo ' +
                                                             ' WHERE pv_siniestro = :Sin ' +
                                                               ' AND pv_orden = :Ord ' +
                                                               ' AND pv_recaida = :Reca ' +
                                                               ' AND pv_tipoparte = ''E'' ' +
                                                               ' AND pv_nroparte < :Nro) ',
                                        [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida,
                                        SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida, StrToInt(dbcPartes.Text)]);

  if (dbcPartes.Text = '1') or (OrigenIdPrest = 0) then
    OrigenIdPrest := ValorSqlIntegerEx('SELECT amebpba.get_presderivacion(:Sin, :Ord, :Reca) ' +
                                        ' FROM dual', [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);

  try
    frmFirmantes := TfrmFirmantes.Create(Self);
    SqlResults   := ValoresColSql('SELECT ca_descripcion,' +
                                        ' armar_domicilio(ca_calle, ca_numero, ca_piso, ca_departamento) as domicilio,' +
                                        ' ca_codpostal, ca_localidad, pv_descripcion, ca_codarea || '' '' || ca_telefono ca_telefono, ca_fax, ca_clave,' +
                                        ' ca_direlectronica' +
                                   ' FROM cpr_prestador, cpv_provincias' +
                                  ' WHERE ca_provincia = pv_codigo(+)' +
                                    ' AND ca_identificador = ' + SqlInt(OrigenIdPrest));
    if SqlResults[7] = TXT_EMP_CUIT then
      OrigPrestART := True;

    frmFirmantes.Area := AREA_APAU;
    if frmFirmantes.ShowModal = mrOk then
    begin
      if (OrigenIdPrest > 0) and (not OrigPrestART) then
        ImprimirCartaDerivacion('ORIGEN_PREST', SqlResults, frmFirmantes.sdqFirmasUSUARIO.AsString, OrigenIdPrest,OrigPrestART);

      ImprimirCartaDerivacion('NUEVO_PREST', SqlResults, frmFirmantes.sdqFirmasUSUARIO.AsString, OrigenIdPrest,OrigPrestART);
    end
    else
      MsgBox('Debe seleccionar un Firmante para generar las cartas.', MB_ICONEXCLAMATION);

  finally
    SqlResults.Free;
    frmFirmantes.Free;
  end;

  if MsgBox('Desea enviar los antecedentes?', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    with TdlgImpParteEvolutivo.Create(Self) do
    try
      MailPrestadorDerivado := fraPrestador.CorreoElectronico;  // TK 54254 (prestador de destino, segun la carta de derivacion)
      SinEdit.GetValues(ISiniestro, IOrden, IRecaida);
      edDesde.Value := 1;

      if dbcPartes.Text = '' then
      begin
        edHasta.Value          := 1;
        opSeleccionado.Enabled := False;
        opTodos.Checked        := True;
      end
      else
      begin
        edHasta.Text        := dbcPartes.Text;
        edSeleccionado.Text := dbcPartes.Text;
      end;

      Orden := SortDialog.OrderBy;
      ShowModal;
    finally
      Free;
    end;

  end;
end;

{-------[del mnuCartaDerivacion]------------------------------------------------}
procedure TfrmParteEvolutivo.ImprimirCartaDerivacion(Prest: String; LstDatosPrestOrigen: TStringList;
                                                     Firmante :String; OrigenPrest: Integer; OrPrART: Boolean);
var
  nIndice: Integer;
  Resultado: TResultados;
  UsuarioAlta: String;
  SqlResults: TStringList;
begin
  SqlResults := TStringList.Create;

  with TqrMoldeReporteRTF.Create(Self) do
  try
    Codigo      := 'PEV';
    Fecha       := DBDateTime;
    Lugar       := TfrmAutAprob.LugarImpresion(Sesion.LoginName);
    Name        := ClassName + 'CartaDeDerivacion';
    GTrabajo    := sdqBusquedaGP_NOMBRE.AsString;
    Delegacion  := edDelegacion.Text;
    ReportTitle := 'Carta de Derivación - Siniestro ' + SinEdit.SiniestroS;

    if (Prest = 'ORIGEN_PREST') then
    begin
      EMail     := LstDatosPrestOrigen[8];
      Prestador := InitCap(LstDatosPrestOrigen[0]) + ' (' + LstDatosPrestOrigen[7] + ')';
      Domicilio := InitCap(LstDatosPrestOrigen[1]) + CRLF +
                   '(' + LstDatosPrestOrigen[2] + ') - ' + InitCap(LstDatosPrestOrigen[3]) + CRLF +
                   InitCap(LstDatosPrestOrigen[4]) + CRLF +
                   iif(LstDatosPrestOrigen[5] > '', 'Tel: ' + LstDatosPrestOrigen[5], '') +
                   iif(LstDatosPrestOrigen[6] > '', CRLF + 'Fax: ' + LstDatosPrestOrigen[6], '');
    end
    else
    begin
      EMail     := fraPrestador.CorreoElectronico;
      Prestador := fraPrestador.RazonSocial + ' (' + IntToStr(fraPrestador.IDPrestador) + ')';
      Domicilio := InitCap(fraPrestador.Domicilio) + CRLF +
                   '(' + fraPrestador.CodigoPostal + ') - ' + InitCap(fraPrestador.Localidad) + CRLF +
                   InitCap(fraPrestador.Provincia) + CRLF +
                   iif(fraPrestador.Telefono > '', 'Tel: ' + fraPrestador.Telefono, '') +
                   iif(FaxPrestador > '', CRLF + 'Fax: ' + FaxPrestador, '');
    end;

    Referente := 'Damnificado: ' + InitCap(fraTrabajadorSIN.Nombre) + CRLF +
                 'Dirección: ' + ValorSql('SELECT utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, ' +
                                                                       ' tj_departamento, tj_localidad) ' +
                                          ' FROM ctj_trabajador ' +
                                         ' WHERE tj_cuil = ' + SqlValue(sdqBusquedaEX_CUIL.AsString)) + CRLF +
                 'D.N.I.: ' + GetDNI(fraTrabajadorSIN.CUIL) + CRLF +
                 'Fecha de Ocurrencia: ' + edSinFecha.Text + CRLF +
                 'Denuncia Nº: ' + SinEdit.SiniestroS; // + CRLF +

    try // Lu WF 7559
      SqlResults := ValoresColSql('SELECT tj_fnacimiento, art.trabajador.get_telefono(tj_id, 4) Telefono ' +
                                   ' FROM ctj_trabajador ' +
                                  ' WHERE tj_cuil = ' + SqlValue(fraTrabajadorSIN.CUIL));

      if (SqlResults[0] <> '') then
        Referente := Referente + 'Fecha de Nacimiento: ' + SqlResults[0];
      if (SqlResults[1] <> '') then
        Referente := Referente + 'Teléfono: ' + SqlResults[1];
    finally
      SqlResults.Free;
    end;

    Referente := Referente + 'Empresa: ' + fraEmpresa.NombreEmpresa + CRLF +
                             'CUIT: ' + fraEmpresa.CUIT;

    with qrmDetalle do
    begin
      if (Prest = 'ORIGEN_PREST') then
      begin
        nIndice := Lines.Add('Nos dirigimos a Ud. a fin de informarle que se deriva el Paciente de la Referencia, al prestador: ' +
                             InitCap(fraPrestador.RazonSocial) + ' con domicilio en ' +
                             InitCap(fraPrestador.Domicilio) + ' (' +
                             fraPrestador.CodigoPostal + ') ' +
                             InitCap(fraPrestador.Localidad) + ', ' +
                             IIF(InitCap(fraPrestador.Provincia) = 'Capital Federal', 'Buenos Aires', InitCap(fraPrestador.Provincia)));
        if fraPrestador.Telefono <> '' then
          Lines[nIndice] := Lines[nIndice] + ', teléfono ' + fraPrestador.Telefono;
      end else
      begin
        nIndice := Lines.Add('Tenemos el agrado de dirigirnos a Ud. para informarle que se autoriza la derivación de la prestación');
        if (OrigenPrest > 0) and (not OrPrART) then
        begin   // no se imprime el prestador de Origen acá, si es que el PrestOrigen es = '', ó si el prestador es Provincia ART.-
          Lines[nIndice] := Lines[nIndice] + ' cuyo prestador original era ' +
                            InitCap(LstDatosPrestOrigen[0]) + ' ' +
                            ' con domicilio en ' + InitCap(LstDatosPrestOrigen[1]) +
                            ' (' + LstDatosPrestOrigen[2] + ') ' +
                            InitCap(LstDatosPrestOrigen[3]) + ', ' +
                            InitCap(LstDatosPrestOrigen[4]) +
                            iif(LstDatosPrestOrigen[5] > '', ', teléfono: ' + LstDatosPrestOrigen[5], '');
        end;
      end;

      Lines[nIndice] := Lines[nIndice] + '.';
      Lines.Add('');

      if cmbTurno.Date <> 0 then
        Lines.Add('Turno para el día ' + cmbTurno.LongDate('dddd, dd'' de ''MMMM'' de ''yyyy') +  ' a las ' + mskHora.Text  + 'Hs.');

      Lines.Add(''); Lines.Add(''); Lines.Add(''); Lines.Add('');
      Lines.Add(''); Lines.Add('');
      if not (Prest = 'ORIGEN_PREST') then
      begin
        if eddiagnostico.Text = '' then begin
          Lines.Add ('Diagnóstico: ' + MemoDiagnosticoSin.Text);
        end else begin
          Lines.Add ('Diagnóstico: ' + MemoDiagnosticoSin.Text);
        end;
        Lines.Add('');
        Lines.Add('');
        Lines.Add('Descripción del hecho: ' + sdqBusqueda.fieldbyname('ex_mecanismoaccid').AsString);
      end;

      Lines.Add('');
      Lines.Add('');

      UsuarioAlta := ValorSql('SELECT SE_NOMBRE FROM USE_USUARIOS WHERE SE_USUARIO = ''' + sdqPartesPV_USUALTA.Text + '''');

      Lines.Add('Aval: ' + Firmante);
      Lines.Add('');
      Lines.Add('Gestionó: ' + InitCap(UsuarioAlta));
    end;

    SinEdit.GetValues(ISiniestro, IOrden, IRecaida);
    Resultado := Ejecutar([oForceShowModal], '', '', '', '', '', '', 0, ISiniestro);
  finally
    Free;
  end;
end;

procedure TfrmParteEvolutivo.SinEditSelect(Sender: TObject);
var
  SqlResults: TStringList;
  sSQL: String;
begin
  mnuSupervisor.Enabled := (not SinEdit.IsEmpty) and Seguridad.Activar(mnuSupervisor);
  mnuMedico.Enabled     := (not SinEdit.IsEmpty) and Seguridad.Activar(mnuMedico);

  if Validar_SML_Evol then        // Por Plan - SML
  begin
    ValidacionTercerizadora(SinEdit);
    sSQL := 'SELECT 1' +
             ' FROM sex_expedientes, aem_empresa' +
            ' WHERE ex_siniestro = ' + SinEdit.SiniestroSql +
              ' AND ex_orden = ' + SinEdit.OrdenSql +
              ' AND ex_recaida = ' + SinEdit.RecaidaSql +
              ' AND ex_cuit = em_cuit';

    if fraEmpresa.Tercerizadoras then
      sSQL := sSQL + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SqlValue(Sesion.UserID) + ') = ''S'' ';

    if not ExisteSql(sSQL) then
    begin
      if fraEmpresa.Tercerizadoras then
        InfoHint(SinEdit, 'El siniestro seleccionado no existe o bien usted no tiene permiso para visualizarlo.')
      else
        InfoHint(SinEdit, 'El siniestro seleccionado no existe.');

      tbLimpiarClick(Sender);
      tbPedInfo.Enabled     := False;
      TbEnvTlgCart.Enabled  := False;
    end
    else begin
      tbPedInfo.Enabled     := Seguridad.Activar(tbPedInfo);
      TbEnvTlgCart.Enabled  := Seguridad.Activar(TbEnvTlgCart);
      btnPrimerRangoInternacion.Enabled := Seguridad.Activar(btnPrimerRangoInternacion);  // TK 16759
      Do_Evaluar_SiniestroAdendaILT;  // TK 26335
      if (SinEdit.SiniestroSql <> '0') and (SinEdit.OrdenSql <> '0') then
      begin
        CargarPartes;
        DoCompletarLeyendaTopeado; // TK 61342
        SqlResults := ValoresColSql('SELECT tb_descripcion, ev_porcincapacidad' +
                                    ' FROM sev_eventosdetramite, ctb_tablas' +
                                    ' WHERE ev_evento = art.amebpba.get_incapacidades(ev_siniestro,ev_orden)' +
                                      ' AND ev_siniestro = ' + SinEdit.SiniestroSql +
                                      ' AND ev_orden = ' + SinEdit.OrdenSql +
                                      ' AND tb_clave = ''EVTRA''' +
                                      ' AND ev_codigo = tb_codigo');
        try
          if (SqlResults[0] <> '') and (SqlResults[1] <> '') then
            MsgBox(SqlResults[0] + #13 + 'Porcentaje de Incapacidad: ' + SqlResults[1] + '%');
        finally
          SqlResults.Free;
        end;
      end;
    end;
  end;
end;

function TfrmParteEvolutivo.Validar: Boolean;
const
  msje = 'No se pueden guardar los cambios debido al siguiente error:' + #13 + #13;
var
  bCargaAutomatica, bCIE10Oblig, bCuitProvART, bCambiaTipo, bEsModif, bEsAlta: Boolean;
  SqlResults: TStringList;
  dFechaAlta: TDate;
  sSql, sTipoParte, sTipoAnt, sLeyenda, sLeyendaTopeado: String;
  TipoOp: TTipoOperacion;
begin
  bCuitProvART     := sdqTipo.FieldByName('TP_CUITPROVART').AsString = 'S';
  bCargaAutomatica := sdqTipo.FieldByName('TP_CARGAAUTO').AsString = 'S';
  bCIE10Oblig      := sdqTipo.FieldByName('TP_REQUIERECIE10').AsString = 'S';
  bEsModif         := (ArrayPos(lbOperacion.Caption, sOperaciones) = 1);
  bEsAlta          := (ArrayPos(lbOperacion.Caption, sOperaciones) = 2);
  TipoOp           := toAlta;

  if bEsModif then
    TipoOp := toModif
  else if bEsAlta then
    TipoOp := toAlta;

  Result := False;                //  SqlResults[0]  SqlResults[1]     SqlResults[2]
  SqlResults := ValoresColSql('SELECT ex_altamedica, ex_gtrabajo, nvl(pe_tratamiento,''N''), ' +
                                 //   SqlResults[3]                           SqlResults[4]
                                    ' to_char(ex_fechaalta, ''dd/mm/yyyy'') , nvl(ex_fecharecaida,ex_fechaaccidente) ' +
                               ' FROM sex_expedientes, spe_parteegreso ' +
                              ' WHERE ex_siniestro = pe_siniestro(+) ' +
                                ' AND ex_orden = pe_orden(+) ' +
                                ' AND ex_recaida = pe_recaida(+) ' +
                                ' AND ex_siniestro = ' + SinEdit.SiniestroSql +
                                ' AND ex_orden = ' + SinEdit.OrdenSql +
                                ' AND ex_recaida = ' + SinEdit.RecaidaSql);

  dFechaAlta  := sdqPartesPV_FECHAALTA.AsDateTime;
  sTipoAnt    := sdqPartesPV_TIPOPARTE.AsString;
  sTipoParte  := cmbTipo.FieldValue;
  sSql        := 'SELECT tp_cambiotipo permite ' +
                  ' FROM spv_parteevolutivo, SIN.stp_tipoparte ' +
                 ' WHERE tp_codigo = pv_tipoparte ' +
                   ' AND pv_idexpediente = :idexped ' +
                   ' AND pv_nroparte = :nroparte';
  bCambiaTipo := ValorSqlEx(sSql, [sdqPartesPV_IDEXPEDIENTE.AsInteger, sdqPartesPV_NROPARTE.AsInteger]) = 'S';

  try

    if (sTipoParte = 'O') and (not ExistsDireccionTrabajador) then
    begin
      if MessageDlg('El trabajador no tiene cargado el domicilio.' + #13 + #10 +
                    '¿Desea dar de alta este parte evolutivo de todas formas?', mtInformation, [mbYes, mbNo], 0) = idNo then
        Exit;
    end;

    if bEsModif and (sdqPartesPV_USUALTA.AsString = 'CONEXIA') and HuboOtroCambio then
      MsgBox(msje + 'Sólo se permite modificar el "Tipo" sobre partes cargados por CONEXIA.')

    else if EsSiniestroTopeado(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida), 'C', sLeyendaTopeado) and not PermiteCargaAdmin_SupervisorGrTrab then // Plan Tope de Siniestros por CIE-10  // TK 59398 "and not EsUsuarioSupervisorGrTrSin"
      MsgBox(msje + sLeyendaTopeado)

    else if EsSiniestroTopeado(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida), 'A', sLeyendaTopeado) and not PermiteCargaAdmin_SupervisorGrTrab then // Plan Tope de Siniestros por Autorizacion (cambia solo la letra A)  // TK 59398 "and not EsUsuarioSupervisorGrTrSin"
      MsgBox(msje + sLeyendaTopeado)

    else if not Validar_AltaModif_SML(TipoOp) then
    begin
      if (TipoOp = toAlta) then
        sLeyenda := 'cargar'
      else
        sLeyenda := 'modificar';
      MsgBox(msje + 'Usted no posee permiso para ' + sLeyenda + ' este tipo de parte en este siniestro');
    end
    else if fraPrestador.IDPrestador = 0 then
    begin
      MsgBox(msje + 'El prestador no puede ser nulo.');
      fraPrestador.IDPrestadorFocus;
    end
    else if bCargaAutomatica and HuboCambioNoObserv then
    begin
      MsgBox(msje + 'El Tipo Evolutivo seleccionado es de Carga Automática.');
      cmbTipo.SetFocus;
    end
    else if ((sTipoParte = 'O') and not(Seguridad.Claves.IsActive('CargarPartesAuditoria'))) or
            ((sTipoParte = 'V') and not(Seguridad.Claves.IsActive('CargarAdministrativoMedico'))) or
            ((sTipoParte = 'Y') and not(Seguridad.Claves.IsActive('CargarAbordajeFisiatrico'))) or
            ((sTipoParte = 'Z') and not(Seguridad.Claves.IsActive('CargarInformeFisiatrico'))) then
    begin
      MsgBox(msje + 'No posee permisos para cargar partes de este tipo.');
      cmbTipo.SetFocus;
    end
    else if (sTipoParte = 'O') and bEsAlta and
             ExistsSolAuditoriaAbierta(chkInfectologia.Checked) then
    // Si es una solicitud de auditoría, si estoy dando de alta y si existe alguna solicitud..
    begin
      MsgBox(msje + 'Existe una Solicitud de Auditoría Médica pendiente.');
      cmbTipo.SetFocus;
    end
    else if bEsModif and not(bCambiaTipo) and (sTipoParte <> sTipoAnt) then
    begin
      MsgBox(msje + 'Este tipo de parte evolutivo no puede ser cambiado.');
      cmbTipo.FieldValue := sTipoAnt;
      cmbTipo. SetFocus;
    end
    else if (dtFechaControl.Date = 0) then
    begin
      MsgBox(msje + 'La Fecha de Control no puede ser nula.');
      dtFechaControl.SetFocus;
    end
    else if (edRecibido.Date = 0) then
    begin
      MsgBox(msje + 'La Fecha de Recepción no puede ser nula.');
      edRecibido.SetFocus;
    end
    else if (edRecibido.Date < Trunc(dtFechaControl.Date)) then
    begin
      MsgBox(msje + 'La Fecha de Recepción debe ser mayor o igual a la Fecha de Control.');
      edRecibido.SetFocus;
    end
    else if (Trim(cmbTipo.Text) = '') then
    begin
      MsgBox(msje + 'El tipo es obligatorio.');
      cmbTipo.SetFocus;
    end
    else if (sTipoParte = 'I') and (edAutorizacion.Text = '') then
    begin
      MsgBox(msje + 'Si el tipo es "' + cmbTipo.Text + '" debe cargar una Autorización.');
      cmbTipo.SetFocus;
    end
    else if not(bCuitProvART) and (fraPrestador.Cuit = TXT_EMP_CUIT) and not(EsPrestadorSinContrato) then
    begin
      MsgBox(msje + 'No se pueden cargar evolutivos de este tipo ' + #13 + 'para el prestador ' + TXT_EMP_RSOCIAL);
      cmbTipo.SetFocus;
    end

    else if ValidarChkReca(nil) then
    
    {Validación de la Fecha Control}
     if (SqlResults[0] <> '') and (Trunc(dtFechaControl.Date) > StrToDate(SqlResults[0]))   {EX_ALTAMEDICA}
               and not ((SqlResults[1] = '24')  {EX_GTRABAJO}
                     or (SqlResults[2] = 'S')   {PE_TRATAMIENTO}
                     or ((sTipoParte <> 'E') and (sTipoParte <> 'D'))) then
    begin
      MsgBox(msje + 'La Fecha Control no puede ser mayor que el Alta Médica.');
      dtFechaControl.SetFocus;
    end
    else if (SqlResults[4] <> '') and (Trunc(dtFechaControl.Date) < StrToDate(SqlResults[4])) then
    begin {NVL(EX_FECHARECAIDA,EX_FECHAACCIDENTE)}
      MsgBox(msje + 'La Fecha Control no puede ser menor que la Fecha de Accidente y/o Recaída.');
      dtFechaControl.SetFocus;
    end

    {Validación de la Fecha de Internación}
    else if (SqlResults[4] <> '') and (deIntDesde.Date > 0) and (deIntDesde.Date < StrToDate(SqlResults[4])) then
    begin {NVL(EX_FECHARECAIDA,EX_FECHAACCIDENTE)}
      MsgBox(msje + 'La fecha de internación no puede ser menor que la Fecha de Accidente y/o Recaída.');
      if deIntDesde.CanFocus then
        deIntDesde.SetFocus;
    end
    else if (deIntDesde.Date > DBDate) then      // TK 28482
    begin
      MsgBox(msje + 'La fecha Desde de Internación no puede ser mayor a la actual');
      if deIntDesde.CanFocus then
        deIntDesde.SetFocus;
    end

    {Validación de la Fecha de Recepción}
    else if (SqlResults[3] <> '') and (edRecibido.Date < StrToDate(SqlResults[3])) then
    begin {EX_FECHAALTA}
      MsgBox(msje + 'La Fecha de Recibido no puede ser menor que la Fecha de Carga del Siniestro');
      edRecibido.SetFocus;
    end
    else if (SqlResults[4] <> '') and (edRecibido.Date < StrToDate(SqlResults[4])) then
    begin {NVL(EX_FECHARECAIDA,EX_FECHAACCIDENTE)}
      MsgBox(msje + 'La Fecha de Recibido no puede ser menor que la Fecha de Accidente y/o Recaída');
      edRecibido.SetFocus;
    end
    else if bEsModif and (edRecibido.Date < Trunc(dtFechaControl.Date)) then
    begin  // by lu.
      MsgBox(msje + 'La Fecha de Recibido no puede ser menor que la Fecha de Control');
      edRecibido.SetFocus;
    end
    else if (ValorSql('SELECT to_char(ca_fechabaja,''dd/mm/yyyy'') FROM cpr_prestador ' +
                         ' WHERE ca_identificador = ' + SqlValue(fraPrestador.IDPrestador)) <> '') then
    begin
      MsgBox(msje + 'El prestador está dado de baja.');
      fraPrestador.IDPrestadorFocus;
    end
    else if bCIE10Oblig and fraCIE10.IsEmpty and not(fraCIE10.ReadOnly) then
    begin
      MsgBox(msje + 'El CIE-10 es obligatorio para este Tipo de Eolutivo.');
      fraCIE10.edCodigo.SetFocus;
    end
    else if (sTipoParte = 'D') and ((cmbTurno.Date = 0) or (mskHora.Text = '')) then
    begin  // by Lu 1-10-01
      MsgBox(msje + 'Si el Tipo Evolutivo es "Derivación", el Turno y Hora son obligatorios.');
      cmbTurno.SetFocus;
    end
    else if (dFechaAlta > 0) and (dFechaAlta < edRecibido.Date) then // TK 13273
    begin
      MsgBox(msje + 'La Fecha de Recepción no puede ser mayor a la fecha de Carga.' + #13#10 +
                    'Fecha de Carga: ' + DateToStr(dFechaAlta));
      edRecibido.SetFocus;
    end
    else if (sTipoParte = 'M') and (fraprestador.Cuit <> ART_CUIT) then  // by Rama 15-04-02
      InvalidMsg(fraprestador, msje + 'Si el Tipo Evolutivo es "Dictamen", el prestador debe ser Provincia ART.')
    else if fraCIE10.IsSelected and fraGravedadCIE10.IsEmpty then
      InvalidMsg(fraGravedadCIE10.edCodigo, 'La gravedad del CIE10 es obligatoria si el CIE10 está seleccionado.')
    else if not ValidarHora then
      InvalidMsg(mskHora, msje + 'Hora inválida.')
     // Lu 06/05/2008 por wf 7333
    // Tipo de parte: "Solicitud Auditoria Médica"  y ademas debe ser un "Alta" sino no da las opciones, es decir no se puede "modificar"
    else if (sTipoParte = 'O') and bEsAlta and
            not(fpSolAudMedica.ShowModal = mrOk) then
      MsgBox(msje + 'Debe seleccionar el tipo de Solicitud de Auditoría médica.')
    else if ((not deIntHasta.IsEmpty) and (deIntDesde.IsEmpty)) then
      InvalidMsg(deIntHasta, msje + 'No puede haber una fecha ''Hasta'' de internación si no existe también una fecha ''Desde''')
    else if (sTipoParte = 'D') and
            (fraEmpresa.Contrato = 132646 {CONSEJO PROFESIONAL DE CIENCIAS ECONOMICAS DE LA C.A.B.A.}) and
            (fraPrestador.IDPrestador <> 11618 {CENTRO MEDICO INTEGRAL FITZ ROY  S.A.}) then
    begin
      if MsgAsk('Se sugiere que se realice una derivación preferencial al CENTRO MEDICO INTEGRAL FITZ ROY  S.A. (11618).' + CRLF + '¿Desea continuar?') then
        Result := True;
    end else
      Result := True;
  finally
    SqlResults.Free;
  end;
end;

procedure TfrmParteEvolutivo.OnPrestadorChange(Sender: TObject);
begin
  if PrestAnt = fraPrestador.IDPrestador then
  begin
    deIntDesde.Date         := IntDesde;
    deIntDesde.ReadOnly     := True;
  end
  else if (PrestAnt > 0) then
  begin
    deIntDesde.ReadOnly     := False;
    deIntDesde.Date         := 0;
  end;

  // Si se cambia el prestador la Autorizacion no va a coincidir
  if cmbTipo.FieldValue = 'I' then
  begin
    cmbTipo.FieldValue := 'E';
    cmbTipoCloseUp(nil);
  end;

  PreferenciasDerivacion((ArrayPos(lbOperacion.Caption, sOperaciones) = 2));
end;

procedure TfrmParteEvolutivo.OnTrabajadorChange(Sender: TObject);
begin
  if fraTrabajadorSIN.IsSelected then
  begin
    if Validar_SML(Sesion.UserID, Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida)) then    // Plan - SML
    begin
      SinEdit.SetValues(fraTrabajadorSIN.Sin,
                        fraTrabajadorSIN.Ord,
                        fraTrabajadorSIN.Rec);
      CargarPartes;
    end
    else begin
      tbLimpiarClick(nil);
      fraTrabajadorSIN.Clear;
      InfoHint(SinEdit, 'Usted no posee permisos para visualizar este siniestro');
    end;


  end;
end;

procedure TfrmParteEvolutivo.EnableNavigator;
begin
  tbAnterior.Enabled := Seguridad.Claves.IsActive('NAVEGADOR') and not (sdqPartes.RecNo = {$IFDEF VER150}0{$ELSE}1{$ENDIF});
  tbPrimero.Enabled := tbAnterior.Enabled;

  tbSiguiente.Enabled := Seguridad.Claves.IsActive('NAVEGADOR') and not (sdqPartes.RecNo = sdqPartes.RecordCount {$IFDEF VER150}- 1{$ENDIF});
  tbUltimo.Enabled := tbSiguiente.Enabled;
end;

procedure TfrmParteEvolutivo.tbOrdenClick(Sender: TObject);
begin
  SortDialog.Execute;
  dbcPartes.First;
end;

procedure TfrmParteEvolutivo.btnAutorizacionClick(Sender: TObject);
begin
  if (SinEdit.Siniestro > 0) then
    with sdqAutorizaciones do
    begin
      Close;
      ParamByName('pSiniestro').AsInteger := SinEdit.Siniestro;
      ParamByName('pOrden').AsInteger     := SinEdit.Orden;
      ParamByName('pRecaida').AsInteger   := SinEdit.Recaida;
      Open;

      if IsEmpty then
      begin
        MsgBox('No se encontraron autorizaciones sin evolución para el siniestro seleccionado.', MB_ICONEXCLAMATION);
        cmbTipo.FieldValue := 'E'; // Setea el tipo como E (Default)
        cmbTipoCloseUp(nil);     // Deshabilita los Controles
      end
      else
      begin
        if edAutorizacion.Text <> '' then
          Locate('AU_NUMAUTO', edAutorizacion.Text, []);
        ldAutorizaciones.Execute;

        if fraPrestador.IDPrestador <> FieldByName('AU_IDENTIFAPRO').AsInteger then
          MsgBox('El prestador de la Autorización seleccionada debe ser el mismo del Parte Evolutivo.', MB_ICONEXCLAMATION)
        else
          edAutorizacion.Text := FieldByName('AU_NUMAUTO').AsString;
      end;
      Close;
    end;
end;

procedure TfrmParteEvolutivo.cmbTipoCloseUp(Sender: TObject);
var
  bHabilita: Boolean;
  sSql: String;
begin
  if cmbTipo.FieldValue = 'I' then
  begin
    edAutorizacion.Enabled  := True;
    btnAutorizacion.Enabled := True;
    if (edAutorizacion.Text = '') then
      btnAutorizacionClick(nil);
  end
  else begin
    edAutorizacion.Enabled  := False;
    btnAutorizacion.Enabled := False;
    edAutorizacion.Text     := '';
  end;

  sSql := 'SELECT inca.is_sini_estimable( ' + SqlInt(SinEdit.Siniestro) + ',' +
                                              SqlInt(SinEdit.Orden) + ',' +
                                              SqlInt(SinEdit.Recaida) +
                                      ') FROM dual';
  bHabilita := (ArrayPos(lbOperacion.Caption, sOperaciones) = 2) and //si es alta
               ((cmbTipo.FieldValue = 'E') or (cmbTipo.FieldValue = 'V')) and //es una evolucion o un administrativo medico
               Seguridad.Claves.IsActive('EstimarIncapacidad') and //tiene permisos
              (ValorSql(sSql) = 'S'); //es un siniestro estimable
  DoHabilitarInca(bHabilita);

  Do_EvaluarDEAM;  // TK 50107
end;

procedure TfrmParteEvolutivo.ldAutorizacionesGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                           var Background: TColor; Highlight: Boolean);
begin
  if fraPrestador.IDPrestador <> sdqAutorizaciones.FieldByName('AU_IDENTIFAPRO').AsInteger then
    AFont.Color := IIF(Highlight, clYellow, clRed);
end;

function TfrmParteEvolutivo.ActualizarAutorizacion: Boolean;
var
  Sql: String;
begin
  Result := False;
  
  try
    if ArrayPos(lbOperacion.Caption, sOperaciones) = 1 then  // Si es un Modificación
      if (sdqPartesPV_AUTORIZACION.AsString <> '') and (edAutorizacion.Text <> sdqPartesPV_AUTORIZACION.AsString) then
      begin
        // si cambiaron la Autorización limpia el estado de la Aut. Anterior
        Sql :=
          'UPDATE sau_autorizaciones' +
            ' SET au_estado = ''E''' +
          ' WHERE au_siniestro = ' + SinEdit.SiniestroSql +
            ' AND au_orden = ' + SinEdit.OrdenSql +
            ' AND au_recaida = ' + SinEdit.RecaidaSql +
            ' AND au_numauto = ' + sdqPartesPV_AUTORIZACION.AsString;
        EjecutarSql(Sql);
      end;

    if edAutorizacion.Text <> '' then
      if (ArrayPos(lbOperacion.Caption, sOperaciones) = 2) or (edAutorizacion.Text <> sdqPartesPV_AUTORIZACION.AsString) then
      begin
        Sql :=
          'UPDATE sau_autorizaciones' +
            ' SET au_estado = ''A''' +
          ' WHERE au_siniestro = ' + SinEdit.SiniestroSql +
            ' AND au_orden = ' + SinEdit.OrdenSql +
            ' AND au_recaida = ' + SinEdit.RecaidaSql +
            ' AND au_numauto = ' + edAutorizacion.TextSql;
        EjecutarSql(Sql);
      end;

    Result := True;
  except
    on E: Exception do
       ErrorMsg(E);
  end;
end;

procedure TfrmParteEvolutivo.OnEmpresaChange(Sender: TObject);
begin
//  ValidacionTercerizadora(fraEmpresa.Contrato, fraEmpresa.cmbRSocial); Esto va?
  fraTrabajadorSIN.CUIT := fraEmpresa.CUIT;
  PreferenciasDerivacion((ArrayPos(lbOperacion.Caption, sOperaciones) = 2));
end;

procedure TfrmParteEvolutivo.tbTrabajadorClick(Sender: TObject);
begin
  if not SinEdit.IsEmpty then
    with TfrmContratoTrabajador.Create(Self) do
    try
      if Self.fraTrabajadorSIN.IsSelected and Self.fraTrabajadorSIN.TieneSiniestro then
        CargarDatosTrabajador(Self.fraTrabajadorSIN.Value,
                              ValorSQLIntegerEx('SELECT rl_id ' +
                                                 ' FROM crl_relacionlaboral ' +
                                                ' WHERE rl_contrato = :CONTRATO ' +
                                                  ' AND rl_idtrabajador = :IDTRABAJADOR',
                              [Self.fraTrabajadorSIN.Contrato, Self.fraTrabajadorSIN.Value]))
      else if Self.fraTrabajadorSIN.IsSelected then
        BuscarTrabajadores(' TJ_CUIL = ' + SqlValue(Self.fraTrabajadorSIN.CUIL), ART_EMPTY_ID)
      else
        DoCargarDatos(fraEmpresa.Contrato);

      ShowModal;
      fraTrabajadorSIN.Reload;
    finally
      Free;
    end;
end;

procedure TfrmParteEvolutivo.mnuHistoDetalleClick(Sender: TObject);
var
  frmAutAprob: TfrmAutAprob;
begin
  if not sdqAutorizaciones.IsEmpty then
  begin
    frmAutAprob := TfrmAutAprob.Create(Self);
    try
      frmAutAprob.CargarAutorizacion(sdqAutorizaciones.FieldByName('AU_ID').AsInteger);
      frmAutAprob.btnAprobar.Enabled      := False;
      frmAutAprob.btnHistoria.Enabled     := False;
      frmAutAprob.btnPedInfo.Enabled      := False;
      frmAutAprob.btnImprimir.Enabled     := False;
      frmAutAprob.btnRechazar.Enabled     := False;
      frmAutAprob.btnTrabajador.Enabled   := False;
      frmAutAprob.btnSiniMasDatos.Enabled := False;
      frmAutAprob.groAprobacion.Enabled   := False;
    finally
      frmAutAprob.Free;
    end;
  end;
end;

{-----[Viaja desde Parte Evolutivo a Autorizaciones]-----------------------------}
procedure TfrmParteEvolutivo.tbViajarClick(Sender: TObject);
begin
  tbViajar.CheckMenuDropdown;
end;

procedure TfrmParteEvolutivo.tbPedInfoClick(Sender: TObject);
var
  frmPedidoInfo: TfrmPedidoInfo;
begin
  if (SinEdit.SiniestroSql <> '0') and (SinEdit.OrdenSql <> '0') then
  begin
    frmPedidoInfo := TfrmPedidoInfo.Create(Self);
    try
       if (dbcPartes.Text <> '') then
           // el "0" que le paso como ultimo parametro, corresponde al parametro "Volante", que solo se utiliza en el modulo Liquidaciones, aca no se usa.
          frmPedidoInfo.ShowForm(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida, 0, 'E', 'Z', 0, StrToInt(dbcPartes.Text), fraPrestador.IDPrestador)
       else
          frmPedidoInfo.ShowForm(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida, 0, 'E', 'Z', 0, 0, fraPrestador.IDPrestador);
    finally
      frmPedidoInfo.Free;
    end;
    tbRefrescarClick(nil);  // por TK 19791: para que se actualice el nuevo parte ingresado desde el Pedido de Informacion.
    dbcPartes.Enabled := True;
    dbcPartes.SetFocus;
    dbcPartes.Last; 
  end
  else
  begin
    MsgBox('No se puede Cargar la Pantalla de Pedido de Información.' + #13 + 'El Siniestro está incompleto.');
    SinEdit.SetFocus;
  end;
end;

function TfrmParteEvolutivo.FaxPrestador: String;
begin
  Result := ValorSql ('SELECT ca_fax' +
                      ' FROM cpr_prestador' +
                     ' WHERE ca_identificador = ' + SqlValue(fraPrestador.IDPrestador));
end;

function TfrmParteEvolutivo.ValidarHora: Boolean;
var
  CadenaHora: String;
  j: Integer;
begin
  { Ver función ValFuncs.IsTime }
  CadenaHora := mskHora.Text;
  for j := 1 to 5 do
    if (CadenaHora[j] = ' ') then
      CadenaHora[j] := '0';
  mskHora.Text := CadenaHora;

  if (StrLeft(mskHora.Text,2) > '23') or
     (StrRight(mskHora.Text,2) > '59') then
    Result := False
  else
    Result := True;
end;

procedure TfrmParteEvolutivo.TbEnvTlgCartClick(Sender: TObject);
begin
  with TfrmConsTlgCartas.create(Self) do
  begin { Es un MDIChild }
    Siniestro    := Sinedit.Siniestro;
    Orden        := Sinedit.Orden;
    Recaida      := Sinedit.Recaida;
    CUIL         := self.fraTrabajadorSIN.CUIL;
    IdExpediente := self.fraTrabajadorSIN.IdExpediente;

    tbRefrescarClick(nil);
  end;
end;

procedure TfrmParteEvolutivo.cmbTipoTratamExit(Sender: TObject);
begin
  if (cmbTipoTratam.Text <> '') and (isnumber(cmbTipoTratam.Text)) then
  begin
    edTipoTramite.Text:=ValorSQL('SELECT tb_descripcion' +
                                  ' FROM ctb_tablas' +
                                 ' WHERE tb_clave = ''TRATA''' +
                                   ' AND tb_codigo <> ''0''' +
                                   ' AND tb_codigo=' + cmbTipoTratam.Text);

    if (cmbTipoTratam.Text = '03') then
    begin
      deIntDesde.Enabled := True;
      deIntHasta.Enabled := True;
    end
    else
    begin
      deIntDesde.Enabled := False;
      deIntHasta.Enabled := False;
      deIntDesde.ClearDate;
      deIntHasta.ClearDate;
    end;
  end
  else
    edTipoTramite.Text := '';   
end;

procedure TfrmParteEvolutivo.cmbTipoTratamKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    Self.SelectNext(cmbTipoTratam, True, True);
end;

procedure TfrmParteEvolutivo.tbCostosClick(Sender: TObject);
var
  TmpFrm: TfrmCostosxSiniestro;
begin
  if frmprincipal.mnuCostosporSiniestro.Enabled then
  begin
    if Sinedit.Siniestro > 0 then
    begin
      TmpFrm:=TfrmCostosxSiniestro.Create(Self);
      TmpFrm.edSOR.SiniestroS :=Sinedit.SiniestroS;
      TmpFrm.edSOR.OrdenS     :=Sinedit.OrdenS;
      TmpFrm.edSOR.RecaidaS   :=Sinedit.RecaidaS;
      TmpFrm.tbRefrescar.Click;
    end;
  end
  else
    Self.Close;
end;

procedure TfrmParteEvolutivo.TimerConfidencialTimer(Sender: TObject);
begin
  Caption := GetTituloPantallaConfidencial(Caption, False);
end;

procedure TfrmParteEvolutivo.fraEmpresamskCUITChange(Sender: TObject);
begin
  HabilitarTituloConfidencial(Self, TimerConfidencial, fraEmpresa.CUIT);
end;

procedure TfrmParteEvolutivo.cmbTipoChange(Sender: TObject);
begin
  if (cmbTipo.text <> '') and (sdqTipo.Fieldbyname('TP_CODIGO').AsString = 'M')  // Dictamen
      and Seguridad.Claves.IsActive('CargarPrestPorDict') then  // TK 5967
    LockControls([edPrestPorDictPV],False)
  else
    LockControls([edPrestPorDictPV],True);

  if (cmbTipo.text <> '') and (sdqTipo.Fieldbyname('TP_RECALIFICACION').AsString = 'S') then
    vclextra.LockControls([chkReca], false)
  else
  begin
    vclextra.LockControls([chkReca], true);
    chkreca.Checked := false;
  end;

  Do_EvaluarDEAM;  // TK 50107
end;

procedure TfrmParteEvolutivo.PreferenciasDerivacion(APregunta: Boolean = False);
var
  sSQL, sPrestador: String;
begin
  if APregunta and fraEmpresa.IsSelected then
  begin
    sSQL := 'SELECT wm_concat (ca_nombrefanta || '' (ID: '' || ca_identificador || '')'') AS prestador ' +
              'FROM art.mep_empresaprestador, art.cpr_prestador ' +
             'WHERE ep_prestador = ca_identificador ' +
               'AND ep_cuit = :cuit ' +
               'AND SYSDATE between ep_vigenciadesde AND NVL (ep_vigenciahasta, SYSDATE) ' +
               'AND ep_fechabaja IS NULL ' +
               'AND ep_preferencial = :preferencial ' +
               'AND ep_fechaauditado IS NOT NULL';

    sPrestador := ValorSQLEx(sSQL, [fraEmpresa.CUIT, 'P']);
    if Trim(sPrestador) > '' then
      InfoHint(fraPrestador, 'Derivación preferencial a ' + sPrestador);

    sPrestador := ValorSQLEx(sSQL, [fraEmpresa.CUIT, 'N']);
    if (Trim(sPrestador) > '') and (fraPrestador.IsEmpty or (Pos(IntToStr(fraPrestador.Value), sPrestador) > 0)) then
      InfoHint(fraPrestador, 'Empresa con prestador objetado ' + sPrestador, False, 'Atención!', blnWarning);
  end;
end;

function TfrmParteEvolutivo.CargarCantRealizadas: Boolean;
var
  Sql: String;
begin
  //la cantidad de realizadas no debe ser mayor que las aprobadas
  vCantMaxima := ValorSqlIntegerEx('SELECT au_cantapro' +
                                    ' FROM sau_autorizaciones' +
                                   ' WHERE au_siniestro = :sin ' +
                                     ' AND au_orden = :ord ' +
                                     ' AND au_recaida = :reca ' + 
                                     ' AND au_numauto = :aut', [SinEdit.Siniestro, SinEdit.Orden,
                                                                SinEdit.Recaida, edAutorizacion.Value]);
  fpPracticasRealizadas.Caption := 'Ingresar cantidad';
  if fpPracticasRealizadas.ShowModal = mrOk then
  begin
    Sql :=  'UPDATE sau_autorizaciones' +
              ' SET au_cantrealizadas = ' +  SqlNumber(edRealizadas.Value) +
            ' WHERE au_siniestro = ' + SinEdit.SiniestroSql +
              ' AND au_orden = ' + SinEdit.OrdenSql +
              ' AND au_recaida = ' + SinEdit.RecaidaSql +
              ' AND au_numauto = ' + edAutorizacion.TextSql;
    EjecutarSql(Sql);
    CargarCantRealizadas := True;
  end
  else
    CargarCantRealizadas := False;
end;

procedure TfrmParteEvolutivo.btnRealAceptarClick(Sender: TObject);
begin
  Verificar((Trim(edRealizadas.Text) = '') or (edRealizadas.Value <= 0),
             edRealizadas, 'Debe ingresar un valor.');
  Verificar(edRealizadas.Value > vCantMaxima, edRealizadas,
            'La cantidad de prácticas realizadas no puede ser mayor que las aprobadas (' +  IntToStr(vCantMaxima) + ')');
  fpPracticasRealizadas.ModalResult := mrOk;
end;

function TfrmParteEvolutivo.ExistsSolAuditoriaAbierta(bInfecto: Boolean): Boolean;
// Devuelve True si existe alguna solicitud abierta para el siniestro actual.
var
  sSql: String;
begin
  sSql := 'SELECT 1' +
           ' FROM ssu_seguimientoauditoria, spv_parteevolutivo' +
          ' WHERE su_siniestro = pv_siniestro' +
            ' AND su_orden = pv_orden' +
            ' AND su_recaida = pv_recaida' +
            ' AND su_nroparte = pv_nroparte' +
            ' AND su_siniestro = :Sin ' +
            ' AND su_orden = :Ord ' +
            ' AND su_recaida = :Reca ' +
            ' AND su_estado IN (''001'', ''002'')' +
            IIF(bInfecto, ' AND pv_infectologia = ''S''',
                          ' AND NVL(pv_infectologia, ''N'') <> ''S''');
  Result := ExisteSqlEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);
end;

function TfrmParteEvolutivo.ExistsDireccionTrabajador: Boolean;
var
  sSql: String;
begin
  sSql := Format(
    'SELECT utiles.armar_domicilio (tj_calle, tj_numero, tj_piso, tj_departamento, tj_localidad) domicilio' +
     ' FROM ctj_trabajador, sex_expedientes' +
    ' WHERE ex_cuil = tj_cuil' +
      ' AND ex_siniestro = %d' +
      ' AND ex_orden = %d' +
      ' AND ex_recaida = %d',
    [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);

  Result := (Trim(String(ValorSql(sSql))) <> '');
end;

procedure TfrmParteEvolutivo.ActualizarDelegacion;
var
  sDelegacion: String;
begin
  sDelegacion := ValorSqlEx('SELECT art.siniestro.get_delegacion(:Sin, :Ord, :Reca) ' +
                             ' FROM dual', [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);
  if sDelegacion <> '' then
    EjecutarSqlST('UPDATE sex_expedientes' +
                    ' SET ex_delegacion = ' + SqlValue(sDelegacion) +
                  ' WHERE ex_siniestro = ' + SinEdit.SiniestroSql +
                    ' AND ex_orden = ' + SinEdit.OrdenSql +
                    ' AND ex_recaida = ' + SinEdit.RecaidaSql);
end;

procedure TfrmParteEvolutivo.mnuViajarAutorizacionesClick(Sender: TObject);
begin
  if SinEdit.IsEmpty then
    Exit;

  with frmAutSelPorSiniestro do
  begin
    if not(Assigned(frmAutSelPorSiniestro)) then
    begin
      frmAutSelPorSiniestro := TfrmAutSelPorSiniestro.Create(frmPrincipal);
      MenuItem              := frmPrincipal.mnuAutAprobacion;
      FormStyle             := fsMDIChild;
    end;

    SinEdit.SetValues(Self.SinEdit.Siniestro, Self.SinEdit.Orden, Self.SinEdit.Recaida);
    tbRefrescarClick(nil);
    Show;
  end;

  Close;
end;

procedure TfrmParteEvolutivo.mnuViajarSuspPlazosClick(Sender: TObject);  // Lu WF 7862
begin
  DoViajarSuspension(False, False);
end;

procedure TfrmParteEvolutivo.mnViajarAgendaClick(Sender: TObject);
begin
  if SinEdit.IsEmpty then
    Exit;
  with frmAgenda do
    if not(Assigned(frmAgenda)) then
    begin
      frmAgenda := TfrmAgenda.Create(frmPrincipal);
      MenuItem  := frmPrincipal.mnuAgenda;
      FormStyle := fsMDIChild;
      edSiniestro.SetValues(Self.SinEdit.SiniestroS, Self.SinEdit.OrdenS, Self.SinEdit.RecaidaS);
      tbRefrescarClick(nil);
      Show;
    end;
  Close;
end;

procedure TfrmParteEvolutivo.btnAgregarObsClick(Sender: TObject);
begin
  edObsABM.Clear;
  fpObservaciones.Caption := 'Agregar observaciones';
  edObsABM.ReadOnly       := False;
  edObsABM.MaxLength      := edObs.MaxLength - Length(edObs.lines.Text);
  btnAceptarObs.Visible   := True;
  btnCancelarObs.Caption  := '&Cancelar';

  edObsABM.Enabled      := true;
  btnAceptarObs.Enabled := true;

  fpObservaciones.ShowModal;
end;

procedure TfrmParteEvolutivo.btnAceptarObsClick(Sender: TObject);
begin
  if (fpObservaciones.Caption = sTITULOOBSINFSOC) then   // Lu TK 1706 En este momento se guardan las observaciones para el Informe social en el campo pv_observinfsoc
    DoGuardarObsInfoSoc

  else if (fpObservaciones.Caption = sTITULOOBSADMMED) then   // TK 24447
    DoGuardarObsAdmMed

  else if (fpObservaciones.Caption <> sTITULOOBSINFORME) then

    if (Trim(edObs.lines.Text) = '') then
      edObs.lines.Text := edObsABM.Text
    else
      edObs.lines.Text := edObs.lines.Text + #13 + edObsABM.lines.Text;
end;

procedure TfrmParteEvolutivo.tbEliminarClick(Sender: TObject);
begin
  if sdqPartesPV_FECHABAJA.IsNull and
     Valida_Baja_SML and
     (MsgBox('¿ Confirma que desea eliminar el parte número ' +  dbcPartes.Text + ' ?', MB_ICONQUESTION + MB_YESNO) = IDYes)
  then
  begin
    edMotivoElim.ReadOnly  := False;
    edMotivoElim.Color     := clWindow;
    edMotivoElim.Clear;
    fpMotivoElim.Height    := 81;
    btnAceptarElim.Visible := True;
    btnCerrarElim.Visible  := False;
    fpMotivoElim.Caption   := 'Motivo de eliminación del parte';
    fpMotivoElim.ShowModal;
  end;
end;

procedure TfrmParteEvolutivo.DoHabilitarObs;
begin
  if sdqPartesPV_FECHABAJA.IsNull then
  begin
    btnAgregarObs.Enabled := True;
    edObs.Font.Color      := clBlack;
    dbcPartes.Font.Color  := clBlack;
  end
  else begin
    btnAgregarObs.Enabled := False;
    tbGuardar.Enabled     := False;
    tbEliminar.Enabled    := False;
    edObs.Font.Color      := clRed;
    dbcPartes.Font.Color  := clRed;
  end;
end;

procedure TfrmParteEvolutivo.btnObsAudClick(Sender: TObject);
var
  sSql: String;
  bhabInfo: boolean;
begin
  fpObservaciones.Caption := 'Observaciones del auditor';
  if (cmbTipo.FieldValue = 'U') then  //si es un parte de auditoria
    sSql := 'SELECT pa_observacionesmedicoauditor' +
             ' FROM sin.spa_partedeauditoria' +
            ' WHERE pa_idexpediente = ' + SqlInt(sdqPartesPV_IDEXPEDIENTE.AsInteger) +
              ' AND pa_nroparteevol = ' + SqlInt(sdqPartesPV_NROPARTE.AsInteger)
  else if (cmbTipo.FieldValue = 'C') then //si es un turno (auditoria en consultorio)
    sSql := 'SELECT cc_observauditor' +
             ' FROM mcc_citacionconsultorio' +
            ' WHERE cc_id  = ' + SqlInt(sdqPartesPV_IDCITACION.AsInteger)
  else if (cmbTipo.FieldValue = 'S') then  // si es Informe social (Lu TK 1706)
  begin
    fpObservaciones.Caption := sTITULOOBSINFSOC;
    sSql := 'SELECT pv_observinfsoc ' +
             ' FROM art.spv_parteevolutivo ' +
            ' WHERE pv_idexpediente = ' + SqlInt(sdqPartesPV_IDEXPEDIENTE.AsInteger) +
              ' AND pv_nroparte = ' + SqlInt(sdqPartesPV_NROPARTE.AsInteger);
  end
  else if (cmbTipo.FieldValue = 'V') then // si es Administrativo Médico (TK 24447)
  begin
    fpObservaciones.Caption := sTITULOOBSADMMED;
    sSql := 'SELECT pv_observAdmMed ' +
             ' FROM art.spv_parteevolutivo ' +
            ' WHERE pv_idexpediente = ' + SqlInt(sdqPartesPV_IDEXPEDIENTE.AsInteger) +
              ' AND pv_nroparte = ' + SqlInt(sdqPartesPV_NROPARTE.AsInteger);
  end;

  with GetQuery(sSql) do
  try
    edObsABM.Lines.Text := Fields[0].AsString;
    edObsABM.MaxLength  := Fields[0].Size;
  finally
    Free;
  end;

  // Para parte de auditoria y auditoria en consultorio deshabilita el guardar (solo se puede ver, así estaba de antes), y el boton se llama Cerrar.
  bhabInfo              := (cmbTipo.FieldValue = 'S') or (cmbTipo.FieldValue = 'V');  // estos son Informe Social y Administrativo Medico (para estos dos se puede guardar)
  edObsABM.ReadOnly     := not bhabInfo;
  btnAceptarObs.Visible := bhabInfo;
  if not bhabInfo then
    btnCancelarObs.Caption  := '&Cerrar';

  if (cmbTipo.FieldValue = 'S') then
  begin
    edObsABM.Enabled      := btnObsAud.Enabled and Seguridad.Claves.IsActive('CargarObservacionAuditor_InfoSocial');  
    btnAceptarObs.Enabled := btnObsAud.Enabled and Seguridad.Claves.IsActive('CargarObservacionAuditor_InfoSocial');
  end
  else if (cmbTipo.FieldValue = 'V') then begin
    edObsABM.Enabled      := btnObsAud.Enabled and Seguridad.Claves.IsActive('CargarObservacionAuditor_AdmMedico');  // por TK 24447
    btnAceptarObs.Enabled := btnObsAud.Enabled and Seguridad.Claves.IsActive('CargarObservacionAuditor_AdmMedico');
  end;

  fpObservaciones.ShowModal;
end;

procedure TfrmParteEvolutivo.tbDatosBajaClick(Sender: TObject);
begin
  edMotivoElim.ReadOnly   := True;
  edMotivoElim.Color      := clBtnFace;
  fpMotivoElim.Height     := 113;
  btnAceptarElim.Visible  := False;
  btnCerrarElim.Visible   := True;
  edMotivoElim.Text       := sdqPartesPV_MOTIVOBAJA.AsString;
  edUsuBaja.Text          := sdqPartesPV_USUBAJA.AsString;
  edFechaBaja.Text        := sdqPartesPV_FECHABAJA.AsString;
  edUsuModif.Text         := sdqPartesPV_USUMODIF.AsString;
  fpMotivoElim.Caption    := 'Datos de modificación';
  fpMotivoElim.ShowModal;
end;

procedure TfrmParteEvolutivo.btnAceptarElimClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(Trim(edMotivoElim.Text) = '', edMotivoElim, 'Debe ingresar el motivo de baja.');
  BeginTrans;
  try
    sSql := 'UPDATE spv_parteevolutivo' +
              ' SET pv_motivobaja = ' + SqlValue(Trim(edMotivoElim.Text)) + ',' +
                  ' pv_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                  ' pv_fechabaja = actualdate' +
            ' WHERE pv_siniestro = ' + SqlInt(SinEdit.Siniestro) +
              ' AND pv_orden = ' + SqlInt(SinEdit.Orden) +
              ' AND pv_recaida = ' + SqlInt(SinEdit.Recaida) +
              ' AND pv_nroparte = ' + SqlInt(sdqPartesPV_NROPARTE.AsInteger);
    EjecutarSqlST(sSql);

    if not(sdqPartesPV_AUTORIZACION.IsNull) then
    begin
      sSql := 'UPDATE sau_autorizaciones' +
                ' SET au_estado = ''E'',' +
                    ' au_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' au_fechamodif = actualdate ' +
              ' WHERE au_siniestro = ' + SqlInt(SinEdit.Siniestro) +
                ' AND au_orden = ' + SqlInt(SinEdit.Orden) +
                ' AND au_recaida = ' + SqlInt(SinEdit.Recaida) +
                ' AND au_numauto = ' + SqlInt(sdqPartesPV_AUTORIZACION.AsInteger) +
                ' AND au_estado = ''A'' '; //solo si están aprobadas
      EjecutarSqlST(sSql);
    end;
    
    CommitTrans;
    MsgBox('El parte se ha eliminado correctamente.', MB_ICONINFORMATION);
    fpMotivoElim.ModalResult := mrOk;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al intentar eliminar el parte.');
    end;
  end;
  
  tbRefrescarClick(nil);
  DoHabilitarObs;
end;

procedure TfrmParteEvolutivo.DoHabilitarObsAud;
var
  sSql, sTurno, sInfoS: String;  // Lu TK 1706
begin
  sSql    := 'SELECT NVL(pa_observacionesmedicoauditor, '''')' +
              ' FROM sin.spa_partedeauditoria' +
             ' WHERE pa_idexpediente = :IdExped' +
               ' AND pa_nroparteevol = :NroParte';

  sTurno  := 'SELECT NVL(cc_observauditor, '''')' +
              ' FROM mcc_citacionconsultorio' +
             ' WHERE cc_id  = :IdCita ';

  sInfoS  := 'SELECT NVL(pv_observinfsoc, '''')' +
              ' FROM art.spv_parteevolutivo ' +
             ' WHERE pv_idexpediente = :IdExped' +
               ' AND pv_nroparte = :NroParte';     // Lu TK 1706

  btnObsAud.Enabled := ((cmbTipo.FieldValue = 'U') and (ValorSqlEx(sSql, [sdqPartesPV_IDEXPEDIENTE.AsInteger,
                                                                          sdqPartesPV_NROPARTE.AsInteger]) <> '')) or
                       ((cmbTipo.FieldValue = 'C') and (ValorSqlEx(sTurno, [sdqPartesPV_IDCITACION.AsInteger]) <> '')) or
                        (cmbTipo.FieldValue = 'S') or
                        (cmbTipo.FieldValue = 'V');  // TK 24447
end;

procedure TfrmParteEvolutivo.sdqPartesAfterScroll(DataSet: TDataSet);
begin
  DoHabilitarObsAud;
  edObs.ReadOnly          := True;
  chkInfectologia.Enabled := False;
  DoHabilitarInca(False);
  DoHabilitarEvaluacion(sdqBusquedaEX_ID.AsInteger, sdqPartesPV_NROPARTE.AsInteger);
end;

function TfrmParteEvolutivo.EsSiniestroInternado: Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1' +
           ' FROM msi_siniestro_internado' +
          ' WHERE si_siniestro = :Sin ' +
            ' AND si_orden = :Ord ' +
            ' AND si_recaida = :Reca ' +
            ' AND si_internadohasta IS NULL' +
            ' AND si_fechabaja IS NULL';
  Result := ExisteSqlEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);
end;

procedure TfrmParteEvolutivo.btnDatosIncaClick(Sender: TObject);
var
  sDatos, sSql, sUltimaEstim: String;
begin
  sSql := 'SELECT inca.get_incaauto(:Sin, :Ord, :Reca) ' +
           ' FROM dual';
  sUltimaEstim := ValorSqlEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]);
  sDatos := 'Fecha: ' + Copy(sUltimaEstim, 1, 10) +
            ' - Porcentaje: ' + StringReplace(Copy(sUltimaEstim, 11, 17), '.', ',', []);
  InfoHint(pnlInca, sDatos);
end;

procedure TfrmParteEvolutivo.DoHabilitarInca(bHabilitar :Boolean);
begin
  edPorcentaje.Clear;
  LockControl(chkEstimar, not bHabilitar);
  edPorcentajeN.Visible := not bHabilitar;
  btnDatosInca.Enabled  := bHabilitar;
  chkEstimar.Checked    := False;
end;

procedure TfrmParteEvolutivo.chkEstimarClick(Sender: TObject);
begin
  edPorcentaje.Clear;
  LockControl(edPorcentaje, not chkEstimar.Checked);
end;

procedure TfrmParteEvolutivo.chkRevisar48Click(Sender: TObject);
begin
  if chkRevisar48.Checked then
    vclextra.Lockcontrols([mObsRevisar48], false)
  else
  begin
    vclextra.Lockcontrols([mObsRevisar48]);
    mObsRevisar48.Clear;
  end;
end;

procedure TfrmParteEvolutivo.DoLimpiar;
begin
  MostrarEstado('');
  tbRefrescarClick(nil);
  EnableNavigator;
end;

procedure TfrmParteEvolutivo.tbEvaluacionClick(Sender: TObject);
begin
  if not (SinEdit.IsEmpty) and not (Assigned(frmEvaluacionMedica)) then
    with frmEvaluacionMedica do
    begin
      frmEvaluacionMedica := TfrmEvaluacionMedica.Create(Self);
      FormStyle           := fsMDIChild;
      Execute(Self.sdqBusqueda.FieldByName('EX_ID').AsInteger, Self.sdqPartesPV_NROPARTE.AsInteger, True);
      Show;
    end;
end;

procedure TfrmParteEvolutivo.DoHabilitarEvaluacion(iIdExped, iNroParte: Integer);
var
  sSql: String;
begin
  sSql := 'SELECT 1' +
           ' FROM cem_evaluacionmedica' +
          ' WHERE em_idexpediente = :IdExped' +
            ' AND em_nroparte = :NroParte';
  tbEvaluacion.Enabled := Seguridad.Activar(tbEvaluacion) and ExisteSqlEx(sSql, [iIdExped, iNroParte]);
end;

procedure TfrmParteEvolutivo.tbHCClick(Sender: TObject);
begin
  Verificar(fraEmpresa.IsEmpty, fraEmpresa, 'Debe seleccionar la Empresa.');
  Verificar(Trim(fraTrabajadorSIN.CUIL) = '', fraTrabajadorSIN, 'Debe seleccionar el trabajador.');
  Verificar(SinEdit.IsEmpty, SinEdit, 'Debe seleccionar un siniestro para ver la historia clínica del paciente.');

  with TfrmAbmAnalisis.Create(Self) do
  try
    FormStyle := fsNormal;
    Show;
    fraEmpresaHijo.Contrato := fraEmpresa.Contrato;
    fraTrabajadorHijo.CUIL  := fraTrabajadorSIN.CUIL;
    fraTrabajadorHijo.IdExpediente := sdqPartesPV_IDEXPEDIENTE.AsInteger;  // plan IOMA
    VCLExtra.LockControls([fraEmpresaHijo, fraTrabajadorHijo], True);
    pnlFiltros.Enabled    := False;
    tbAgregar.Enabled     := False;
    tbModificar.Enabled   := False;
    tbQuitar.Enabled      := False;
    tbMover.Enabled       := False;
    tbReconfirmar.Enabled := False;
    tbLimpiar.Enabled     := False;
    tbRefrescar.Click;
    Hide;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmParteEvolutivo.mnuViajarCalendarioClick(Sender: TObject);
begin
  if SinEdit.IsEmpty then exit;

  with frmCalendarioPrestacional do
  begin
    if not(Assigned(frmCalendarioPrestacional)) then
    begin
      frmCalendarioPrestacional := TfrmCalendarioPrestacional.Create(Self);
      FormStyle                 := fsMDIChild;
    end;
    IdExpediente := Get_IdExpediente(Self.SinEdit.Siniestro, Self.SinEdit.Orden, Self.SinEdit.Recaida);
    Show;
  end;
end;

function TfrmParteEvolutivo.ValidarOtros(IdExpediente :Integer): Boolean;
var
  sSql :String;
begin
  sSql := 'SELECT 1 ' +
           ' FROM SIN.sde_denuncia ' +
          ' WHERE de_idexpediente = :IdExped ' +
          ' UNION ' +
         ' SELECT 1 ' +
           ' FROM SIN.spi_partedeingreso ' +
          ' WHERE pi_idexpediente = :IdExped ' +
          ' UNION ' +
         ' SELECT 1 ' +
           ' FROM SIN.ssa_solicitudasistencia ' +
          ' WHERE sa_idexpediente = :IdExped ';
  if ExisteSqlEx(sSql, [IdExpediente]) then
    Result := True
  else begin
    MsgBox('El siniestro no posee otra documentación (Denuncia, PMI ó Solicitud de Asistencia)', MB_ICONERROR);
    tbLimpiarClick(nil);
    Result := False;
  end;
end;

// Lu WF 7559 : Impresion de Informe.
procedure TfrmParteEvolutivo.mnuImprimirInformeClick(Sender: TObject);
var frmFirmantes: TfrmFirmantes;
    InfoObserv: String;
    sNombreMedResp: String;
begin
  // Para modificar las observaciones para el informe
  fpObservaciones.Caption := sTITULOOBSINFORME;
  edObsAbm.Lines.Text     := edObs.Lines.Text;
  if (fpObservaciones.ShowModal = mrOk) then
  begin
    InfoObserv   := edObsABM.Lines.Text;
    frmFirmantes := TfrmFirmantes.Create(Self);
    Try
      frmFirmantes.Area := AREA_APAU;
      if frmFirmantes.ShowModal = mrOk then
      begin
        sNombreMedResp := Get_MedicoResponsGrupo;  // si no hay medico responsable del grupo, le pasa blanco.
        If sNombreMedResp = '' then
          MsgBox('Atención: el Informe se imprimirá sin Aval de Médico Responsable, por alguno de estos motivos:' +
                 #13 + #13 + ' - El Grupo de trabajo no posee Médico Responsable. ' +
                       #13 + ' - El Grupo de trabajo posee mas de un Médico Responsable pero no se lo selecciono en la grilla.', MB_ICONINFORMATION);

        ImprimirInforme(frmFirmantes.sdqFirmasUSUARIO.AsString, fraTrabajadorSIN.Nombre, GetDNI(fraTrabajadorSIN.CUIL, true), InfoObserv, sNombreMedResp );
      end
      else
        MsgBox('Debe seleccionar un Firmante para generar el Informe.', MB_ICONEXCLAMATION);
    Finally
      frmFirmantes.Free;
    end;
  end;
end;

// Lu WF 7559 : Impresion de Informe.
procedure TfrmParteEvolutivo.ImprimirInforme(sFirmante, sNombre, sDNI, sInfoObserv, sMedicoResp: string);
var
  SqlResults: TStringList;
begin
  with TrptInformeParteEvol.Create(Self) do
  begin
    SqlResults := nil;
    try
      SqlResults := ValoresColSql(' SELECT ex_fechaaccidente, ex_diagnostico, ca_descripcion ' +
                                    ' FROM sex_expedientes, spv_parteevolutivo, cpr_prestador ' +
                                   ' WHERE pv_idexpediente = ex_id ' +
                                     ' AND pv_identifprestador = ca_identificador ' +
                                     ' AND pv_idexpediente = ' + sdqBusqueda.FieldByName('EX_ID').AsString +
                                     ' AND pv_nroparte = ' + dbcPartes.Text);

      if Is_SiniestroGobernacion(SinEdit.Siniestro) then
        qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_GOB')
      else begin
        qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
        qriLogoART.AutoSize := True;
        qriLogoART.Stretch := False;
      end;


      qrlFecha.Caption := LugarImpresion + ', ' + DateFormat(DBDate, 'd ''de'' MMMM ''de'' yyyy');
      qriLogoGBP.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_GBP');
      qrlPaciente.Caption              := sNombre;
      qrlDNI.Caption                   := sDNI;
      qrlSiniestro.Caption             := SinEdit.SiniestroS + '/' + SinEdit.OrdenS + '/' + SinEdit.RecaidaS;
      qrmResumenHistClinica.Lines.Text := sInfoObserv;
      qrlFechaAccidente.Caption        := SqlResults[0];
      qrlPrestador.Caption             := SqlResults[2];
      qrlDiagnostico.Caption           := SqlResults[1];
      qrlFirmante.Caption              := sFirmante;
      // Si no hay medico responsable no se imprime nada ahi.
      qrlAvalMedico.Caption            := sMedicoResp;
      if Trim(sMedicoResp) = '' then
        qrlCaptionAval.Caption := ''
      else
        qrlCaptionAval.Caption := 'Aval:';

      Ejecutar(SinEdit.Siniestro);

    finally
      SqlResults.Free;
      Free;
    end;
  end;
end;

function TfrmParteEvolutivo.LugarImpresion: string;
begin
  Result := ValorSqlEx('SELECT IIF_CHAR(lg_localidad, :V1, INITCAP(:V2), INITCAP(lg_localidad))' +
                        ' FROM dlg_delegaciones, usc_sectores, use_usuarios' +
                       ' WHERE se_sector = sc_codigo' +
                         ' AND lg_codigo = sc_delegacion' +
                         ' AND se_usuario = :Usuario', ['CAPITAL FEDERAL', 'BUENOS AIRES', Sesion.UserID]);
end;

// Obtiene el medico responsable del grupo del siniestro. Si no hay devuelve blanco,
// si hay mas de uno, arroja una pantalla para seleccinarlo desde alli.
function TfrmParteEvolutivo.Get_MedicoResponsGrupo: string;
var
  sMedico, sSql: string;
  iCantMedicos: integer;
begin
  sSql := 'SELECT se_nombre ' +
           ' FROM art.mug_usuariogrupotrabajo, art.use_usuarios ' +
          ' WHERE ug_usuario = se_usuario ' +
            ' AND ug_grupo = :grupo ' +
            ' AND ug_tipousuario = ''03'' ' +     // tipo usuario = 03 = medico
            ' AND ug_responsable = ''S'' ' +      // responsable = si
            ' AND ug_fechabaja is null';
  OpenQueryEx(sdqMedicosResp, [sdqBusqueda.FieldByName('ex_gtrabajo').AsString], sSql);
  iCantMedicos := sdqMedicosResp.RecordCount;
  if (iCantMedicos > 1) then
  begin
    if fpMedicoResp.ShowModal = mrOk then
       sMedico := edMedicoSelecc.Text
    else
       sMedico := '';
  end
  else if (iCantMedicos = 1) then
    sMedico := sdqMedicosResp.FieldByName('se_nombre').AsString
  else
    sMedico := '';
  Result := sMedico;
end;

procedure TfrmParteEvolutivo.sdqMedicosRespAfterScroll(DataSet: TDataSet);
begin
  edMedicoSelecc.Text := sdqMedicosResp.FieldByName('SE_NOMBRE').AsString;
end;

function TfrmParteEvolutivo.GetTipoDoc :String;
var
  sSql, sTipo :String;
begin
  if not edAutorizacion.IsEmpty then
  begin
    sSql := 'SELECT pr_digitalizacion ' +
             ' FROM mpr_prestaciones, sau_autorizaciones ' +
            ' WHERE au_siniestro = :Sin ' +
              ' AND au_orden = :Ord ' +
              ' AND au_recaida = :Reca ' +
              ' AND au_numauto = :Aut ' +
              ' AND au_presapro = pr_codigo ';
    sTipo := ValorSqlEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida, edAutorizacion.Value]);
  end;

  if sdqTipo.FieldByName('tp_codigo').AsString = 'S' then
    Result := 'ISO'
  else
    Result := IIF(sTipo <> '', sTipo, 'PEV');
end;

procedure TfrmParteEvolutivo.mnuViajarSeguimClick(Sender: TObject);
begin
  if SinEdit.IsEmpty then Exit;

  with frmListSeguimientoMedico do
  begin
    if not(Assigned(frmListSeguimientoMedico)) then
    begin
      frmListSeguimientoMedico  := TfrmListSeguimientoMedico.Create(frmPrincipal);   // TK 17530
      MenuItem                  := frmPrincipal.mnuListSeguimientoMedico;
      FormStyle                 := fsMDIChild;
    end;
    edSiniestro.SetValues(Self.SinEdit.Siniestro, Self.SinEdit.Orden, Self.SinEdit.Recaida);
    tbRefrescarClick(nil);
    Show;
  end;
end;

procedure TfrmParteEvolutivo.DoGuardarObsInfoSoc;    // Lu TK 1706
var
  sSql: string;
begin
  try
    sSql := 'UPDATE art.spv_parteevolutivo ' +
              ' SET pv_observinfsoc = ' + SqlValue(Trim(edObsABM.Text)) +
            ' WHERE pv_idexpediente = ' + SqlInt(sdqPartesPV_IDEXPEDIENTE.AsInteger) +
              ' AND pv_nroparte = ' + SqlInt(sdqPartesPV_NROPARTE.AsInteger);
     EjecutarSql(sSql);
  except
    on E: Exception do ErrorMsg(E, 'Error al intentar guardar, consulte con sistemas');
  end;
end;

// Lu TK 1439 (determina si ya esta el parte digitalizado, por todas las veces que pueda llegar a modificarse el mismo)
function TfrmParteEvolutivo.EsParteDigitalizado(iSiniestro, iOrden, iRecaida, iNroParte: Integer;
                                                sFormulario: string): boolean;
begin
  Result := Is_ExisteDocumentoSiniestro(iSiniestro, iOrden, iRecaida, iNroParte, sFormulario);
end;

procedure TfrmParteEvolutivo.tbAmeritaRemisClick(Sender: TObject);
var
  sSql :String;
begin
  if not SinEdit.IsEmpty then
  begin
    chkRemisABM.Checked := chkRemis.Checked;
    if fpReqTraslado.ShowModal = mrOk then
    begin
      sSql := 'UPDATE sex_expedientes ' +
                ' SET ex_ameritaremis = ' + SqlBoolean(chkRemisABM.Checked) +
              ' WHERE ex_id = ' + SqlInt(sdqBusquedaEX_ID.AsInteger);
      EjecutarSql(sSql);
      chkRemis.Checked := chkRemisABM.Checked;
    end;
  end;
end;

procedure TfrmParteEvolutivo.btnAceptarTraslClick(Sender: TObject);
begin
  //Verificar(chkRemis.Checked and not(chkRemisABM.Checked), chkRemisABM,
            //'No es posible marcar como que "No requiere traslado" desde aqui.');
  verificar((seguridad.Claves.IsActive('DesmarcarAmeritaRemis') = false) and (chkRemisABM.Checked = false) and (chkRemis.Checked = true), chkRemisABM, 'Ud. no posee permiso para realizar esta modificación');

  fpReqTraslado.ModalResult := mrOk;
end;

procedure TfrmParteEvolutivo.tbObsSupMedClick(Sender: TObject);    // TK 10083
begin
  tbObsSupMed.CheckMenuDropdown;
end;

procedure TfrmParteEvolutivo.tbSalirObsClick(Sender: TObject);              // TK 10083
begin
  fpObsSupMed.ModalResult := mrCancel;
end;

procedure TfrmParteEvolutivo.tbGuardarObsClick(Sender: TObject);            // TK 10083
var
  sSql, sTipoTope : string;
  iIdExped: integer;
begin
  BeginTrans;
  Try
    iIdExped := Get_idExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);

    if  ValidarSupObs then
    begin
      sTipoTope := '';     // esto es porque puede ser que no esté topeado...
      if chkTopeCie10.Checked then
        sTipoTope := 'C'
      else if chkTopeAutorizacion.Checked then
        sTipoTope := 'A'
      else if chkTopeTraslado.Checked then
        sTipoTope := 'T'
      else if chkTopeFKT.Checked then
        sTipoTope := 'F';

      sSql   := 'art.siniestro.do_grabar_observacionsiniestro( ' + SqlInt(iIdExped) + ',' +
                                                                   SqlValue(Sesion.UserID) + ',' +
                                                                   SqlValue(memoObservaciones.Text) + ',' +
                                                                   SqlValue(sdqObsSupMed.ParamByName('tipousu').AsString) + ',' +
                                                                   SqlValue(sTipoTope) + ',' + QuotedStr(iif(chkRevisar48.Checked, 'S', '')) + ',' + SqlValue(mObsRevisar48.Text) + ');';
      EjecutarStoreST(sSql);
      tbRefrescarObsClick(Nil);

      if (sTipoTope <> '') then
        DoEvaluar_LiberaTope(iIdExped, sTipoTope);   // Libera el tope por cualquiera de las 4 opciones

    end;
    CommitTrans;

  except
    on E:Exception do
    begin
      Rollback;
      ErrorMsg(E);
    end;
  end;
end;

procedure TfrmParteEvolutivo.tbRefrescarObsClick(Sender: TObject);         // TK 10083
begin
  DoMostrarObserva(tipoUsuarioObs, False);
  DoHabilitarObsSupMed(True, tipoUsuarioObs);
end;

procedure TfrmParteEvolutivo.tbNuevoObsClick(Sender: TObject);   // TK 10083
begin
  LockControls(memoObservaciones, false);
  memoObservaciones.Clear;
  memoObservaciones.SetFocus;
  DoHabilitarObsSupMed(False);
end;

function TfrmParteEvolutivo.ValidarSupObs: Boolean;     // TK 10083
begin
  Verificar((chkTopeCie10.Enabled or chkTopeAutorizacion.Enabled or chkTopeTraslado.Enabled or chkTopeFKT.Enabled) and
            (not chkTopeCie10.Checked) and (not chkTopeAutorizacion.Checked) and (not chkTopeTraslado.Checked) and (not chkTopeFKT.Checked),
             pnlTipoTopeo, 'Debe seleccionar alguna de estas opciones');
  Verificar(Trim(memoObservaciones.Text) = '', memoObservaciones, 'Debe completar el campo Observaciones');
  Result := True;
end;

procedure TfrmParteEvolutivo.tbOrdenarObsClick(Sender: TObject);
begin
  SortDialog_Obs.Execute;
end;

procedure TfrmParteEvolutivo.sdqObsSupMedAfterScroll(DataSet: TDataSet);
begin
//  if tbNuevoObs.Enabled then
 // begin
    memoObservaciones.text := DataSet.FieldByName('SO_OBSERVACIONES').AsString;
    edFechaObs.text        := DataSet.FieldByName('SO_FECHAALTA').AsString;
    edUsuarioObs.Text      := DataSet.FieldByName('NOMBREUSUARIO').AsString;
    chkRevisar48.Checked   := DataSet.FieldByName('SO_REVISAR48').AsString = 'S';
    mObsRevisar48.Text     := DataSet.FieldByName('SO_OBSREVISAR48').AsString;
//  end;
end;

procedure TfrmParteEvolutivo.DoHabilitarObsSupMed(bHabilitar: Boolean; sTipoUsu: String = '');
var
  bNuevo: Boolean;
begin
  if (sTipoUsu = '') then
    bNuevo := bHabilitar
  else if (sTipoUsu = 'S') then
    bNuevo := bHabilitar and Seguridad.Claves.IsActive('CargarObsSupervisor')
  else
    bNuevo := bHabilitar and Seguridad.Claves.IsActive('CargarObsMedico');

  tbNuevoObs.Enabled      := bNuevo;
  tbExportarObs.Enabled   := bHabilitar;
  tbImprimirObs.Enabled   := bHabilitar;
  tbRefrescarObs.Enabled  := bHabilitar;
  tbOrdenarObs.Enabled    := bHabilitar;
  tbGuardarObs.Enabled    := not bHabilitar;
  tbCancelarObs.Enabled   := not bHabilitar;
  LockControl(dgObsSupMed, not bHabilitar);
  LockControl(memoObservaciones, bHabilitar);
  if sTipoUsu = 'T' then
    tbNuevoObs.Enabled      := false;

  if chkTopeCie10.Checked and (tipoUsuarioObs = 'S') then
    vclextra.Lockcontrols([chkRevisar48], false)
  else
    vclextra.Lockcontrols([chkRevisar48]);

  chkRevisar48.Checked := false;

end;

procedure TfrmParteEvolutivo.tbCancelarObsClick(Sender: TObject);
begin
  DoHabilitarObsSupMed(True);
  memoObservaciones.Clear;
end;

procedure TfrmParteEvolutivo.mnuSupervisorClick(Sender: TObject);
begin
  tipoUsuarioObs := 'S';
  DoMostrarObserva(tipoUsuarioObs, True);
end;

procedure TfrmParteEvolutivo.DoMostrarObserva(sTipoUsu: String; bMostrar: Boolean);
var
  sSql: String;
  iIdExped: integer;
begin
  iIdExped := Get_idExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);

  sSql := 'SELECT art.siniestro.get_siniestrocompleto(so_idexpediente) siniestro, ' +
                ' so_fechaalta, se_nombre nombreusuario, so_observaciones, so_tipousuario, so_tipojustificacion, ' +
                ' so_revisar48, so_obsrevisar48' +
           ' FROM sin.sso_supervisoresobs, art.use_usuarios ' +
          ' WHERE se_usuario = so_usualta ' +
            ' AND so_idexpediente = :idexpe ' +
            iif (sTipoUsu <> 'T', ' AND so_tipousuario = :tipousu ' + SortDialog_Obs.OrderBy, SortDialog_Obs.OrderBy);

  sdqObsSupMed.Close;
  sdqObsSupMed.SQL.Text := sSql;
  sdqObsSupMed.ParamByName('idexpe').AsInteger := iIdExped;
  if sTipoUsu <> 'T' then
    sdqObsSupMed.ParamByName('tipousu').AsString := sTipoUsu;
  sdqObsSupMed.Open;
  if bMostrar then
  begin
    edSiniestroObs.Text := SinEdit.SinOrdRec;
    if sTipoUsu <> 'T' then
    begin
      fpObsSupMed.Caption := 'Observaciones del ' + IIF(sdqObsSupMed.ParamByName('tipousu').AsString = 'S',
                                                        'supervisor', 'médico');
      pnlTipoTopeo.Visible := True;
    end
    else
    begin
      fpObsSupMed.Caption  := 'Resumen de observaciones';
      pnlTipoTopeo.Visible := False;
    end;

    DoCargar_TopeadoPor(iIdExped);

    LockControls(memoObservaciones, true);
    DoHabilitarObsSupMed(True, sTipoUsu);
                                               
    fpObsSupMed.ShowModal;
  end;
end;

procedure TfrmParteEvolutivo.mnuMedicoClick(Sender: TObject);
begin
  tipoUsuarioObs := 'M';
  DoMostrarObserva(tipoUsuarioObs, True);
end;

procedure TfrmParteEvolutivo.tbExportarObsClick(Sender: TObject);
begin
  if sdqObsSupMed.Active and not(sdqObsSupMed.IsEmpty) then
  begin
    exportObs.Title := fpObsSupMed.Caption + ' - Siniestro: ' + edSiniestroObs.Text;
    exportObs.Execute;
  end;
end;

procedure TfrmParteEvolutivo.tbImprimirObsClick(Sender: TObject);
begin
  if sdqObsSupMed.Active and not(sdqObsSupMed.IsEmpty) and pdObs.Execute then
  begin
    qpObs.SubTitle.Lines.Add(fpObsSupMed.Caption + ' - Siniestro: ' + edSiniestroObs.Text);
    qpObs.Footer.Text := Sesion.Usuario;
    qpObs.Print;
   end;
end;

procedure TfrmParteEvolutivo.fpObsSupMedClose(Sender: TObject; var Action: TCloseAction);
begin
  memoObservaciones.Clear;
  edFechaObs.Clear;
  edUsuarioObs.Clear;
  //chkRevisar48.Checked := False;

end;

function TfrmParteEvolutivo.HuboOtroCambio: Boolean;
{solo pueden cambiar el tipo a "Informe" y relacionar la autorizacion para los partes de CONEXIA}
begin
  Result := (sdqPartesPV_FECHACONTROL.AsDateTime <> dtFechaControl.Date) or
            (sdqPartesPV_PROXIMOCONTROL.AsDateTime <> dtFechaProxControl.Date) or
            (IIF((sdqPartesPV_AREVISAR.AsString = 'S'), True, False) <> chkRevisar.Checked) or
            (IIF((sdqPartesPV_PROTOCOLOGENERAL.AsString = 'S'), True, False) <> chkProtGeneral.Checked) or
            (sdqPartesPV_IDENTIFPRESTADOR.AsInteger <> fraPrestador.IDPrestador) or
            (sdqPartesPV_DIAGNOSTICO.AsString <> edDiagnostico.Text) or
            (cmbTipoTratam.FieldValue <> sdqPartesPV_TIPOTRATAMIENTO.AsString) or
            (IIF(sdqPartesPV_AUDITOR.AsString = '0', '', sdqPartesPV_AUDITOR.AsString) <> fraAuditor.ID) or
            (sdqPartesPV_TURNO.AsDateTime <> cmbTurno.Date) or
            (NVL(sdqPartesPV_TURNOHORA.AsString, ':') <> Trim(mskHora.Text)) or
            (sdqPartesPV_SITIOINTERNACION.AsString <> edInternacion.Text) or
            (sdqPartesPV_MEDICO.AsString <> edMedico.Text) or
            (sdqPartesPV_FECHARECEPCION.AsDateTime <> edRecibido.Date) or
            (sdqPartesPV_OBSERVACIONES.AsString <> edObs.Lines.Text) or
            ((sdqPartesPV_TIPOPARTE.AsString <> cmbTipo.FieldValue) and (cmbTipo.FieldValue <> 'I'));
end;

function TfrmParteEvolutivo.HuboCambioNoObserv: Boolean;
{solo se deja agregar observaciones para los partes de suspension/aceptacion - rechazo}
begin
  Result := (sdqPartesPV_TIPOPARTE.AsString <> 'J') or
            ((sdqPartesPV_FECHACONTROL.AsDateTime <> dtFechaControl.Date) or
             (sdqPartesPV_PROXIMOCONTROL.AsDateTime <> dtFechaProxControl.Date) or
             (IIF((sdqPartesPV_AREVISAR.AsString = 'S'), True, False) <> chkRevisar.Checked) or
             (IIF((sdqPartesPV_PROTOCOLOGENERAL.AsString = 'S'), True, False) <> chkProtGeneral.Checked) or
             (sdqPartesPV_IDENTIFPRESTADOR.AsInteger <> fraPrestador.IDPrestador) or
             (sdqPartesPV_DIAGNOSTICO.AsString <> edDiagnostico.Text) or
             (cmbTipoTratam.FieldValue <> sdqPartesPV_TIPOTRATAMIENTO.AsString) or
             (IIF(sdqPartesPV_AUDITOR.AsString = '0', '', sdqPartesPV_AUDITOR.AsString) <> fraAuditor.ID) or
             (sdqPartesPV_TURNO.AsDateTime <> cmbTurno.Date) or
             (NVL(sdqPartesPV_TURNOHORA.AsString, ':') <> Trim(mskHora.Text)) or
             (sdqPartesPV_SITIOINTERNACION.AsString <> edInternacion.Text) or
             (sdqPartesPV_MEDICO.AsString <> edMedico.Text) or
             (sdqPartesPV_FECHARECEPCION.AsDateTime <> edRecibido.Date) or
             (sdqPartesPV_TIPOPARTE.AsString <> cmbTipo.FieldValue) or
             (sdqPartesPV_AUTORIZACION.AsInteger <> edAutorizacion.Value)
            );
end;

function TfrmParteEvolutivo.Get_EstadoSSA(iIdExpediente: Integer): String;   // TK 19070
begin
  Result := ValorSqlEx('SELECT tb_descripcion ' +
                        ' FROM art.ssa_siniestrossinalta, art.ctb_tablas ' +
                       ' WHERE tb_clave = ''ESTSA'' ' +
                         ' AND tb_codigo = sa_estado ' +
                         ' AND sa_idexpediente = :idexp', [iIdExpediente]);
end;

procedure TfrmParteEvolutivo.tbSalirResClick(Sender: TObject);   // TK 19070
begin
  fpResumenSum.ModalResult := mrCancel;
end;

procedure TfrmParteEvolutivo.tbSICClick(Sender: TObject);
begin
  Verificar(fraTrabajadorSIN.IsEmpty, SinEdit, 'Debe seleccionar un siniestro para acceder al SIC desde aquí.');
  DoMostrarEventosAgendaExpediente(fraTrabajadorSIN.IdExpediente);
end;

procedure TfrmParteEvolutivo.tbResumenSumClick(Sender: TObject);  // TK 19070
begin
  Verificar(SinEdit.IsEmpty, tbResumenSum, 'Debe completar el Siniestro para visualizar esta opción');

  rbSinOrdRec.Checked := True;
  edSinOrdRec.SetValues(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
  edSinOrd.SetValues(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida);
  Do_setearFiltrosResumen;
  Do_RefrescarResumenSum(edSinOrdRec.Siniestro, edSinOrdRec.Orden, edSinOrdRec.Recaida);
  fpResumenSum.ShowModal;
end;

procedure TfrmParteEvolutivo.Do_setearFiltrosResumen;            // TK 19070
begin
  if rbSinOrdRec.Checked then
  begin
    edSinOrdRec.Color := clInfoBk;
    edSinOrd.Color    := clSilver;
  end
  else begin
    edSinOrdRec.Color := clSilver;
    edSinOrd.Color    := clInfoBk;
  end;
end;

procedure TfrmParteEvolutivo.rbSinOrdRecClick(Sender: TObject);  // TK 19070
begin
  Do_setearFiltrosResumen;
  Do_RefrescarResumenSum(edSinOrdRec.Siniestro, edSinOrdRec.Orden, edSinOrdRec.Recaida);
end;

procedure TfrmParteEvolutivo.rbSinOrdClick(Sender: TObject);     // TK 19070
begin
  Do_setearFiltrosResumen;
  Do_RefrescarResumenSum(edSinOrdRec.Siniestro, edSinOrdRec.Orden, -1);
end;

procedure TfrmParteEvolutivo.Do_RefrescarResumenSum(iSiniestro, iOrden, iRecaida: Integer);  // TK 19070
var
  sSql, sSqlReca: string;
begin
  sSqlReca := '';
  if (iRecaida > -1) then
    sSqlReca := ' AND au_recaida = ' + SqlInt(iRecaida);

  sSql := 'SELECT sum(nvl(au_cantapro, au_cantidad)) Cantidad, ' +
                ' nvl(au_presapro, au_pressol) CodPrestacion, pr_descripcion Prestacion ' +
           ' FROM art.sau_autorizaciones, art.mpr_prestaciones ' +
          ' WHERE pr_codigo = nvl(au_presapro, au_pressol) ' +
            ' AND au_siniestro = ' + SqlInt(iSiniestro) +
            ' AND au_orden = ' + SqlInt(iOrden) +
            sSqlReca +
            ' AND au_estado not in (''D'',''N'',''R'',''U'',''V'',''X'') ' +
       ' GROUP BY au_presapro, au_pressol, pr_descripcion ';
  OpenQuery(sdqResumenSum, sSql);
end;

procedure TfrmParteEvolutivo.tbOrdenarResClick(Sender: TObject);    // TK 19070
begin
  SortDialog_ResSum.Execute;
end;

procedure TfrmParteEvolutivo.tbExportarResClick(Sender: TObject);   // TK 19070
begin
  if sdqResumenSum.Active and not(sdqResumenSum.IsEmpty) then
    Export_ResSum.Execute;
end;

procedure TfrmParteEvolutivo.tbImprimirResClick(Sender: TObject);   // TK 19070
var
  sSiniestro: string;
begin
  sSiniestro := edSinOrdRec.SiniestroS + '/' + edSinOrdRec.OrdenS;
  if rbSinOrdRec.Checked then
    sSiniestro := sSiniestro + '/' + edSinOrdRec.RecaidaS;

  if sdqResumenSum.Active and not(sdqResumenSum.IsEmpty) then
  begin
    QueryPrint_ResSum.SubTitle.Text := fpResumenSum.Caption + ' - Siniestro: ' + sSiniestro;
    QueryPrint_ResSum.Footer.Text   := Sesion.Usuario;
    QueryPrint_ResSum.Print;
  end;
end;

procedure TfrmParteEvolutivo.btnPrimerRangoInternacionClick(Sender: TObject);   // TK 21558
var
  sSql: string;
begin
  sSql := 'SELECT si_internadodesde, si_internadohasta, ca_descripcion prestador ' +
           ' FROM amed.msi_siniestro_internado, art.cpr_prestador ' +
          ' WHERE si_idprestador = ca_identificador ' +
            ' AND si_siniestro = ' + SinEdit.SiniestroSql +
            ' AND si_orden = '     + SinEdit.OrdenSql +
            ' AND si_recaida = '   + SinEdit.RecaidaSql +
            ' AND si_fechabaja IS NULL ' +
       ' ORDER BY si_id ';

  OpenQuery(sdqPrimerRangoInternacion, sSql);
  fpPrimerRangoInternacion.ShowModal;
end;

procedure TfrmParteEvolutivo.btnAceptarIntClick(Sender: TObject);  // TK 16759
begin
  fpPrimerRangoInternacion.ModalResult := mrOk;
end;

procedure TfrmParteEvolutivo.DoGuardarObsAdmMed;     // TK 24447
var sSql: string;
begin
  try
    sSql := 'UPDATE art.spv_parteevolutivo ' +
              ' SET pv_observadmmed = ' + SqlValue(Trim(edObsABM.Text)) +
            ' WHERE pv_idexpediente = ' + SqlInt(sdqPartesPV_IDEXPEDIENTE.AsInteger) +
              ' AND pv_nroparte = ' + SqlInt(sdqPartesPV_NROPARTE.AsInteger);
     EjecutarSql(sSql);
  except
    on E: Exception do ErrorMsg(E, 'Error al intentar guardar, consulte con sistemas');
  end;
end;

procedure TfrmParteEvolutivo.Do_EnviarMail_SolicAudMedica(iCantAudit, iIdExped: integer);   // TK 24729 (reacomodo)
var
  sMailsSol, cadenaCantAudit, sBody, sSql: string;
  aResultadoEnvio :TResultadoEnvio;
  iDeleg: Integer;
begin
   if ((fraGravedadCIE10.Value = '3') or EsSiniestroInternado) and
       (Seguridad.Claves.IsActive('EnvioSolicitudAuditoriaGrave')) then
     // Si es grave ó es un internado y tiene permiso para mandarle un e-mail a un prestador..
   begin
     Application.CreateForm(TfrmEnviarSolicitudAuditoria, frmEnviarSolicitudAuditoria);
     try
       frmEnviarSolicitudAuditoria.Mostrar(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida,
                                           StrToInt(dbcPartes.Text), 'G');
     finally
       FreeAndNil(frmEnviarSolicitudAuditoria);
     end;
   end
   else
   begin
     iDeleg := ValorSqlIntegerEx('SELECT ex_delegacion ' +
                                  ' FROM art.sex_expedientes ' +
                                 ' WHERE ex_id = :idex', [iIdExped]);
                                 
     case iDeleg of           // TK 24729
       DEL_CAPITAL:     sMailsSol := Get_DireccionesEnvioMail('SOL_CAP');
       DEL_TUCUMAN:     sMailsSol := Get_DireccionesEnvioMail('SOL_TUC');
       DEL_NEUQUEN:     sMailsSol := Get_DireccionesEnvioMail('SOL_NEU');
       DEL_MARDELPLATA: sMailsSol := Get_DireccionesEnvioMail('SOL_MAR');
       DEL_LAPLATA:     sMailsSol := Get_DireccionesEnvioMail('SOL_LAP');
       DEL_MENDOZA:     sMailsSol := Get_DireccionesEnvioMail('SOL_MEN');
       DEL_ROSARIO:     sMailsSol := Get_DireccionesEnvioMail('SOL_ROS');
       DEL_CORDOBA:     sMailsSol := Get_DireccionesEnvioMail('SOL_COR');
       DEL_BAHIABLANCA: sMailsSol := Get_DireccionesEnvioMail('SOL_BAH');
       DEL_USHUAIA:     sMailsSol := Get_DireccionesEnvioMail('SOL_USH');
       DEL_RIOGRANDE:   sMailsSol := Get_DireccionesEnvioMail('SOL_RIO');
     end;

     if iCantAudit = 1 then
       cadenaCantAudit := 'una nueva solicitud'
     else
       case iCantAudit of   // caso en que es mayor a uno:
         2: cadenaCantAudit := 'dos nuevas solicitudes';
         3: cadenaCantAudit := 'tres nuevas solicitudes';
         4: cadenaCantAudit := 'cuatro nuevas solicitudes';
       end;

     sBody := Format('Se ha cargado ' + cadenaCantAudit + ' de auditoría médica correspondiente a:' + #13#10#13#10 +
                     'Siniestro: %d-%d-%d' + #13#10 +
                     'Parte Nº: %s', [SinEdit.Siniestro, SinEdit.Orden,
                                      SinEdit.Recaida, dbcPartes.Text]);

     aResultadoEnvio := unMoldeEnvioMail.EnviarMailBDWithResults(sMailsSol, 'Solicitud de Auditoría Médica',
                                                                 [oAlwaysShowDialog], sBody);
     if aResultadoEnvio.EnvioOk then
     begin
       sSql := 'UPDATE ssu_seguimientoauditoria' +
                 ' SET su_emailaenviarid = :p1' +
               ' WHERE su_siniestro = :p2' +
                 ' AND su_orden = :p3' +
                 ' AND su_recaida = :p4' +
                 ' AND su_nroparte = :p5';
       EjecutarSqlEx(sSql, [aResultadoEnvio.MensajeId, SinEdit.Siniestro,
                            SinEdit.Orden, SinEdit.Recaida, dbcPartes.Text]);
     end;
   end;
end;

procedure TfrmParteEvolutivo.Do_Evaluar_SiniestroAdendaILT;    // TK 26335
var
  sSql: string;
begin    
  sSql := 'SELECT liq.is_bloqueoiltempresa(ex_cuit, ex_fechaaccidente) ' +
           ' FROM art.sex_expedientes ' +
          ' WHERE ex_siniestro = :sini ' +
            ' AND ex_orden = :orden ' +
            ' AND ex_recaida = :reca ';
 if (ValorSqlEx(sSql, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) = 'S') then
   SinEdit.Color := clSkyBlue
 else
   SinEdit.Color := clWindow;
end;

{procedure TfrmParteEvolutivo.Do_EvaluarIFFI;   // TK 25970
var
  sSql_PE, sSql_Doc: string;
begin
  // 1°) busco si existe algun parte evolutivo del tipo G - Informe Físico
  sSql_PE := 'SELECT 1 FROM art.spv_parteevolutivo ' +
            ' WHERE pv_siniestro = :sini' +
              ' AND pv_orden = :orden ' +
              ' AND pv_recaida = :reca ' +
              ' AND pv_fechabaja is null ' +
              ' AND pv_tipoparte = ''G'' ';

  // 2°) busco si existe en Documentación, el tipo de documento 15 - IFFI, buscando por Trabajador (si cuil, documento o nombre coinciden).
  sSql_Doc := 'SELECT 1 FROM COMUNES.cdr_documentacionrecibida ' +
              ' WHERE dr_tipodocumento = ''15'' ' +
                ' AND ( (dr_cuil = :cuil) or ' +
                      ' (dr_numerodocumento = :docu) )';

  chkIffi.Checked := ExisteSqlEx(sSql_PE, [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida])
                     and
                     ExisteSqlEx(sSql_Doc, [fraTrabajadorSIN.CUIL, GetDNI(fraTrabajadorSIN.CUIL)]);
end;    }

procedure TfrmParteEvolutivo.Do_EvaluarPosibleFraude;  // TK 63642
begin
  chkPosibleFraude.Checked := (ValorSqlEx('SELECT ex_posiblefraude FROM art.sex_expedientes ' +
                                          ' WHERE ex_siniestro = :sini' +
                                            ' AND ex_orden = :orden' +
                                            ' AND ex_recaida = :reca', [SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) = 'S');
end;

procedure TfrmParteEvolutivo.DoViajarSuspension(bDecide, bConTransaccion: Boolean);
begin
  if SinEdit.IsEmpty then Exit;

  with frmSuspensionPlazos do
  begin
    if not(Assigned(frmSuspensionPlazos)) then
      Abrir(TfrmSuspensionPlazos, frmSuspensionPlazos, tmvMDIChild, frmPrincipal.mnuSuspensionPlazos);
    tbLimpiarClick(nil);
    edSiniestro.SetValues(Self.SinEdit.Siniestro, Self.SinEdit.Orden, Self.SinEdit.Recaida);
    tbRefrescarClick(nil);
    DecisionMedica := bDecide;
    ConTransaccion := bConTransaccion;
    PrestadorParte := IIF(fraPrestador.IsSelected, fraPrestador.IDPrestador,
                                                   ValorSqlIntegerEx('SELECT art.amebpba.get_prestador(:p1, :p2, :p3) ' +
                                                                      ' FROM DUAL', [Self.SinEdit.Siniestro,
                                                                                     Self.SinEdit.Orden,
                                                                                     Self.SinEdit.Recaida]));
    Show;
    if bDecide then tbModificarClick(nil);
  end;

  if bDecide then
    CargarPartes(False)
  else
    Close;
end;

procedure TfrmParteEvolutivo.tbSuspensionClick(Sender: TObject);
begin
  DoViajarSuspension(True, False);
end;

function TfrmParteEvolutivo.EsPrestadorSinContrato: Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT ca_prestadorsincontrato ' +
           ' FROM cpr_prestador ' +
          ' WHERE ca_identificador = :idpres ';
  Result := (ValorSqlEx(sSql, [fraPrestador.IDPrestador]) = 'S');
end;

function TfrmParteEvolutivo.Validar_SML_Evol: boolean;      // Plan - SML
begin
  Result := True;
  if Is_UsuarioSML(Sesion.UserID)
     and (not Is_SiniestroSML(Get_IdExpediente(Self.SinEdit.Siniestro, Self.SinEdit.Orden, Self.SinEdit.Recaida))) then
  begin
    Result := False;
    tbLimpiarClick(nil);
    tbPedInfo.Enabled     := False;
    TbEnvTlgCart.Enabled  := False;
    fraEmpresa.Clear;
    fraTrabajadorSIN.Clear;
    SinEdit.Clear;
    Verificar(True, SinEdit, 'Usted no posee permisos para visualizar este siniestro.');
  end;
end;

function TfrmParteEvolutivo.Es_TipoPermitidoSML_ParaModif: Boolean;   // Por Plan - SML
begin
  Result := (ValorSqlEx('SELECT art.siniestro.get_tipopartenosml(:tipoparte, ''M'') FROM dual', [cmbTipo.FieldValue]) = 'S');
end;

function TfrmParteEvolutivo.Es_TipoPermitidoSML_ParaAlta: Boolean;   // Por Plan - SML
begin
  Result := (ValorSqlEx('SELECT art.siniestro.get_tipopartenosml(:tipoparte, ''A'') FROM dual', [cmbTipo.FieldValue]) = 'S');
end;

function TfrmParteEvolutivo.Es_TipoPermitidoSML_ParaBaja: Boolean;   // Por Plan - SML
begin
  Result := (ValorSqlEx('SELECT art.siniestro.get_tipopartenosml(:tipoparte, ''B'') FROM dual', [cmbTipo.FieldValue]) = 'S');
end;

function TfrmParteEvolutivo.Validar_AltaModif_SML(TipoOp:TTipoOperacion): boolean;     // Por Plan - SML
begin
  Result := True;
  if Is_SiniestroSML(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida))  // Validacion del tipo de parte para siniestros SML
    and not Is_UsuarioSML(Sesion.UserID)
    and not Es_UsuarioSupervisor(Sesion.UserID)
    and not esSiniestroMixto(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida) then

    if (TipoOp = toAlta) and (not Es_TipoPermitidoSML_ParaAlta)  then
      Result := False
    else if (TipoOp = toModif) and (not Es_TipoPermitidoSML_ParaModif) then
      Result := False;
end;

function TfrmParteEvolutivo.Valida_Baja_SML: boolean;
begin
  Result := True;
  if Is_SiniestroSML(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida))  // Validacion del tipo de parte para siniestros SML
    and not Is_UsuarioSML(Sesion.UserID)
    and not Es_UsuarioSupervisor(Sesion.UserID)
    and not Es_TipoPermitidoSML_ParaBaja then
  begin
    InvalidMsg(cmbTipo, 'Usted no posee permiso para eliminar este tipo de parte en este siniestro');
    Result := False;
  end;
end;

procedure TfrmParteEvolutivo.mnuResumenClick(Sender: TObject);
begin
  tipoUsuarioObs := 'T';
  DoMostrarObserva(tipoUsuarioObs, True);   //Todas
end;

function TfrmParteEvolutivo.ValidarChkReca(Sender: TObject): boolean;
var ssql: string;
begin
  if chkreca.Checked = true then
  begin
    ssql := ' SELECT 1 FROM spv_parteevolutivo ' +
             ' WHERE pv_siniestro = :sin ' +
               ' AND pv_orden = :ord ' +
               ' AND pv_recaida = :rec ' +
               ' AND pv_recalificacion = ''S'' ' +
               ' AND pv_nroparte <> :nparte ';
    Verificar(ExisteSqlEx(ssql, [SinEdit.SiniestroS, SinEdit.OrdenS, SinEdit.RecaidaS, dbcpartes.Text]),
              chkReca, 'Ya existe un parte marcado como RECA para este siniestro');

    ssql := ' SELECT 1 FROM sin.spe_partedeegreso ' +
             ' WHERE pe_idexpediente = :exp ';
    Verificar(ExisteSqlEx(ssql, [sdqBusqueda.FieldByName('ex_id').AsString]), chkreca,
              'No se puede marcar como RECA un siniestro que ya tiene alta médica');

    ssql := ' SELECT 1 FROM art.ser_evemedrecalif, SIN.sem_eventomedicoreca ' +
             ' WHERE er_codigo = em_codigo AND em_fechabaja IS NULL ' +
               ' AND em_iniciareca = ''S'' AND er_siniestro = :sin ' +
               ' AND er_orden = :ord and er_evento > 0 ';
    Verificar(ExisteSqlEx(ssql, [SinEdit.SiniestroS, SinEdit.OrdenS]),
              chkReca, 'No se puede marcar como RECA un siniestro con eventos 042, 010 ó 055');

  end;
  result := true;


end;

procedure TfrmParteEvolutivo.DoEvaluar_LiberaTope(iIdExp: integer; sTipoTopeo: string);   // Plan Tope de Siniestros: libera tope por cualquiera de las cuatro opciones (Cie10, Autorizacion, Traslados o FKT) se lo pasa en el parametro sTipoTopeo
var dFechaTope1, dFechaTope2: TDateTime;
    sSql, sTopeCant1, sTopeCant2: string;
    bTopear: boolean;
begin
  dFechaTope1 := ValorSqlDateTimeEx('SELECT ART.SINIESTRO.GET_SINIESTROTOPEADO(:idexp, ''P'', ' + SqlValue(sTipoTopeo) + ') From DUAL ', [iIdExp]);
  dFechaTope2 := ValorSqlDateTimeEx('SELECT ART.SINIESTRO.GET_SINIESTROTOPEADO(:idexp, ''S'', ' + SqlValue(sTipoTopeo) + ') From DUAL ', [iIdExp]);

  sTopeCant1 := ValorSqlEx('SELECT ART.SINIESTRO.GET_SINIESTROTOPEADO2(:idexp, ''P'', ' + SqlValue(sTipoTopeo) + ') From DUAL ', [iIdExp]);
  sTopeCant2 := ValorSqlEx('SELECT ART.SINIESTRO.GET_SINIESTROTOPEADO2(:idexp, ''S'', ' + SqlValue(sTipoTopeo) + ') From DUAL ', [iIdExp]);

  if ((sTipoTopeo = 'C') or (sTipoTopeo = 'A')) then
    bTopear := (dFechaTope1 > 0) and (dFechaTope1 < DBDate) and (dFechaTope2 = 0)  // Solo en el caso de que la fechatope1 esté, y la fechatope2 NO esté, se coloca el "libera tope", sino no.
  else
    bTopear := (sTopeCant1 = 'S') and (sTopeCant2 = 'N');                          // Solo en el caso de que la CantidadTope1 este y la CantidadTope2 no este, se coloca el "libera tope", sino no.

  if bTopear then
  begin
    // Si este select, devuelve 2 registros, es porque estan las dos observaciones como mínimo (una de supervisor y otra de Medico) ya que hago un Group By y filtro por los dos. Si hay menos de 2, es porque no estan las dos.. y entonces NO se debe realizar el update.
    sSql := 'SELECT so_idexpediente, so_tipousuario, count(*) ' +
             ' FROM SIN.SSO_SUPERVISORESOBS ' +
            ' WHERE so_fechaalta >= ' + SqlDate(dFechaTope1) +
              ' AND so_idexpediente = ' + SqlInt(iIdExp) +
              ' AND (so_tipousuario = ''S'' OR so_tipousuario = ''M'') ' +
              ' AND so_fechabaja IS NULL ' +
              ' AND so_tipojustificacion = ' + SqlValue(sTipoTopeo) +
         ' GROUP BY so_idexpediente, so_tipousuario ';

    with GetQuery(sSql) do
    try
      if (not Eof) and (RecordCount = 2) then  // Entonces aqui se hace el update (se coloca el "libera tope")
      begin
        EjecutarSqlSTEx('UPDATE sin.sst_siniestrostopeados ' +
                            ' SET st_fechalibera = art.actualdate, ' +
                                ' st_usulibera = :usu ' +
                          ' WHERE st_idexpediente = :idexp ' +
                            ' AND st_fechalibera IS NULL ' +
                            ' AND st_fechabaja IS NULL ' +
                            ' AND st_tipotopeo = ' + SqlValue(sTipoTopeo), [Sesion.UserID, iIdExp]);     // Esto es nuevo!!
      end;
    finally
      Free;
    end;
  end;
end;


procedure TfrmParteEvolutivo.DoCargar_TopeadoPor(iIdExped: integer);   // plan Topeados
var sSql: string;
begin
  sSql := 'SELECT CASE ' +
                   ' WHEN((art.siniestro.get_siniestrotopeado(ex_id,null,''C'') is not null) and (art.siniestro.get_siniestrotopeado(ex_id,null,''C'') < art.actualdate)) THEN ''S'' ' +
                   ' ELSE ''N'' ' +
                ' END  TopeadoPorCie10, ' +
                ' CASE ' +
                   ' WHEN((art.siniestro.get_siniestrotopeado(ex_id,null,''A'') is not null) and (art.siniestro.get_siniestrotopeado(ex_id,null,''A'') < art.actualdate)) THEN ''S'' ' +
                   ' ELSE ''N'' ' +
                ' END  TopeadoPorAutorizacion, ' +
                ' art.siniestro.get_siniestrotopeado2(ex_id,null,''T'') TopeadoPorTraslado, ' +
                ' art.siniestro.get_siniestrotopeado2(ex_id,null,''F'') TopeadoPorFKT ' +
           ' FROM art.sex_expedientes ' +
          ' WHERE ex_id = :idexped ';

  with GetQueryEx(sSql, [iIdExped]) do
  try
    chkTopeCie10.Checked        := False;
    chkTopeAutorizacion.Checked := False;
    chkTopeTraslado.Checked     := False;
    chkTopeFKT.Checked          := False;

    chkTopeCie10.Enabled        := (FieldByName('TopeadoPorCie10').AsString = 'S');
    chkTopeAutorizacion.Enabled := (FieldByName('TopeadoPorAutorizacion').AsString = 'S');
    chkTopeTraslado.Enabled     := (FieldByName('TopeadoPorTraslado').AsString = 'S');
    chkTopeFKT.Enabled          := (FieldByName('TopeadoPorFKT').AsString = 'S');
  finally
    Free;
  end;

end;


procedure TfrmParteEvolutivo.DoCompletarLeyendaTopeado;   // TK 61342
var sLeyendaTopeado: string;
begin
  if EsSiniestroTopeado(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida), 'C', sLeyendaTopeado) or     // saco las excepciones de los supervisores porque aca no se traba la carga sino que solo se muestra unaleyenda en la pantalla
     EsSiniestroTopeado(Get_IdExpediente(SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida), 'A', sLeyendaTopeado) then
    edTopeado.Text := 'TOPEADO'
  else
    edTopeado.Text := '';
end;

procedure TfrmParteEvolutivo.Do_EvaluarDEAM;   // TK 50107
var sSql: string;
    bBloquear: boolean;
begin
  sSql := 'SELECT tp_permitedeam ' +
           ' FROM sin.stp_tipoparte ' +
          ' WHERE tp_fechabaja IS NULL ' +
            ' AND tp_codigo = :codTipoParte ';

  bBloquear := (ValorSqlEx(sSql, [cmbTipo.FieldValue]) <> 'S');
  VCLExtra.LockControls([chkDEAM], bBloquear);
end;

procedure TfrmParteEvolutivo.pMenuViajarPopup(Sender: TObject);  // habilitaciones Btn Viajar
begin
  mnuViajarAutorizaciones.Enabled := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuAutAprobacion);
  mnViajarAgenda.Enabled          := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuAgenda);
  mnuViajarSuspPlazos.Enabled     := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuSuspensionPlazos);
  mnuViajarSeguim.Enabled         := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuListSeguimientoMedico);
end;

  // WF 6758
function TfrmParteEvolutivo.EsPrimerParte(Tipo: String; Siniestro, Orden, Recaida: Integer): Boolean;
begin
  Result := not ExisteSqlEx('SELECT 1' +
                             ' FROM art.spv_parteevolutivo' +
                            ' WHERE pv_tipoparte = :ptipo' +
                              ' AND pv_siniestro = :psiniestro' +
                              ' AND pv_orden = :porden' +
                              ' AND pv_recaida = :precaida',
                            [Tipo, Siniestro, Orden, Recaida])
end;

function TfrmParteEvolutivo.PermiteCargaAdmin_SupervisorGrTrab: boolean;    // TK 59398: Funcion para determinar si el usuario de carga es Supervisor del grupo de trabajo del siniestro.
var sSql: string;
    EsSupervisor: boolean;
begin
  sSql := ' SELECT ug_tipousuario ' +
            ' FROM mug_usuariogrupotrabajo, mgp_gtrabajo, sex_expedientes ' +
           ' WHERE ug_grupo = gp_codigo ' +
             ' AND ex_gtrabajo = ug_grupo ' +
             ' AND ug_usuario = :usuario ' +
             ' AND ex_siniestro = :sini ' +
             ' AND ex_orden = :orden ' +
             ' AND ex_recaida = :reca ';

  EsSupervisor := (ValorSqlEx(sSql, [sesion.UserID, SinEdit.Siniestro, SinEdit.Orden, SinEdit.Recaida]) = '02');

  if EsSupervisor then
  begin
    if (cmbTipo.FieldValue = 'A') and chkRevisar.Checked and (edObs.Lines.Text <> '') then
      Result := True
    else
      Result := False;
  end
  else
    Result := False;
end;

end.
