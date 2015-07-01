unit unFrmAdministracionNominas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, unArtFrame,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, ToolWin, dbcgrids,
  JvgLabel, JvExControls, JvComponent, JvgProgress, JvExExtCtrls,
  JvItemsPanel, DB, SDEngine, JvScrollMax, JvStaticText,
  JvNetscapeSplitter, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  PeriodoPicker, JvChart, Menus, unFraProcesoArchivo, FormPanel, unArtDBAwareFrame, unArtDbFrame, Periodo,
  unFraEmpresa, IdMultipartFormData, SortDlg, JvgCheckBox, JvgGroupBox,
  JvSplitter, JvThread, unFraTrabajador, QueryPrint, QueryToFile,
  ExportDialog, FieldHider, artSeguridad, Placemnt, ShortCutControl,
  JvDBGridFooter, JvExDBGrids, JvDBGrid, JvBaseDlg, JvProgressDialog,
  IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, JvExComCtrls, JvStatusBar,
  unFrmConsultaNotas, ZipMstr, ArchFuncs, Mask, ToolEdit, DateComboBox,
  unfraInfoEmpresa, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  unfraCtbTablas, Periodos, unArt;

type
  Tparametros = record
    Archivo        : string;
    TipoFormulario : integer;
  end;

  TfrmAdministracionNominas = class(TForm)
    pnBotones: TPanel;
    sdqCabeceraImportacion: TSDQuery;
    od: TOpenDialog;
    sdqContratos: TSDQuery;
    sdqRecepciones: TSDQuery;
    dsContratos: TDataSource;
    dsRecepciones: TDataSource;
    sdqProcesos: TSDQuery;
    dsProcesos: TDataSource;
    fpProcesos: TFormPanel;
    btnSalirProcesos: TButton;
    tsNominas: TPageControl;
    tsProcesosEmision: TTabSheet;
    cbOpcionesProceso: TCoolBar;
    tbProcesosEmision: TToolBar;
    tbRefresh: TToolButton;
    gbProcesoRecepcion: TGroupBox;
    lblObservarComoVariables: TLabel;
    btnProcesarArchivo: TSpeedButton;
    lblArchivo: TLabel;
    lblObservaciones: TLabel;
    fraFormatoArchivo: TfraCodigoDescripcionExt;
    edtArchivo: TEdit;
    tbFormulasEstados: TToolBar;
    tbSeleccionarArchivo: TToolButton;
    mObservaciones: TMemo;
    ScrollProcesos: TJvScrollMax;
    tsDeclaracionesJuradasPresentadas: TTabSheet;
    cbOpciones: TCoolBar;
    tbComandosDelcaracionesJuradas: TToolBar;
    tbRefrescar: TToolButton;
    tbNuevo: TToolButton;
    tbDevengadoMensual: TToolButton;
    tbProcesarDevengadoIndividual: TToolButton;
    tbDetalleNomina: TToolButton;
    tbEstadoCuenta: TToolButton;
    tbArchivosProcesados: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbMostrarFiltros: TToolButton;
    tbSalir: TToolButton;
    SortDialog: TSortDialog;
    btnAceptar: TButton;
    pnSeparador: TPanel;
    fpProgramaEmision: TFormPanel;
    btnSalirProgramaEmision: TButton;
    gbProgramaEmision: TJvgGroupBox;
    Shape1: TShape;
    gbProcesos: TJvgGroupBox;
    fpDevengadoMensual: TFormPanel;
    lblPeriodo: TLabel;
    lblObservacionesDevengado: TLabel;
    lblNota: TLabel;
    Bevel1: TBevel;
    btnAceptarDevengadoMensual: TButton;
    btnCancelarDevengadoMensual: TButton;
    ppPeriodoDevengadoMensual: TPeriodoPicker;
    mObservacionesProcesoDevengado: TMemo;
    gdbProcesosEjecutados: TArtDBGrid;
    Bevel2: TBevel;
    ToolButton2: TToolButton;
    fraGrupoParaDevengado: TfraCodigoDescripcionExt;
    lblGrupoADevengar: TLabel;
    tbRecalcularObs: TToolButton;
    ToolButton5: TToolButton;
    tbVista: TToolButton;
    pnLeyenda: TPanel;
    gbLeyenda: TGroupBox;
    pn: TPanel;
    lblReferenciaPeriodoEstimado: TLabel;
    Panel4: TPanel;
    lblReferenciaPeriodoRecalculo: TLabel;
    pnColorFondoPeriodoInvalidado: TPanel;
    lblLeyendaPeriodoInvalidado: TLabel;
    pnColorFOndoPendienteAprobacion: TPanel;
    lblLeyendaPeriodoPendienteAprob: TLabel;
    pnColorFondoPeriodoObservacion: TPanel;
    lblLeyendaPeriodoObservacion: TLabel;
    ShortCutControl: TShortCutControl;
    FormStorage: TFormStorage;
    Seguridad: TSeguridad;
    FieldHider: TFieldHider;
    ExportDialog: TExportDialog;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    ExportDialogPresentaciones: TExportDialog;
    QueryPrintPresentaciones: TQueryPrint;
    tbSoloPresentacionesActivas: TToolButton;
    sdqPresentacionesTrabajador: TSDQuery;
    dsPresentacionesTrabajador: TDataSource;
    Bevel3: TBevel;
    lblTrabajadorActivo: TLabel;
    lbl: TLabel;
    tbTotales: TToolButton;
    ProgressDialog: TJvProgressDialog;
    tbSolicitudesAutoPeriodo: TToolButton;
    btnEliminarManualDeclaracion: TToolButton;
    tbRestablecer: TToolButton;
    StatusBar: TStatusBar;
    Panel3: TPanel;
    Label1: TLabel;
    gbFiltros: TJvgGroupBox;
    chkMonotributo: TCheckBox;
    chkDeterminativas: TCheckBox;
    chkNominativas: TCheckBox;
    chkMiRegistro: TCheckBox;
    lblFechaDesdeFiltro: TLabel;
    edFechaArchDesde: TDateComboBox;
    lblFechaHastaFIltro: TLabel;
    edFechaArchHasta: TDateComboBox;
    Label2: TLabel;
    edFechaProcesoDesde: TDateComboBox;
    Label3: TLabel;
    edFechaProcesoHasta: TDateComboBox;
    pnFiltro: TPanel;
    pcFiltros: TPageControl;
    tsFiltros1: TTabSheet;
    gbTrabajadores: TGroupBox;
    lblPeriodoTrabajadorDesde: TLabel;
    lblPeriodoTrabajadorHasta: TLabel;
    lbTrabCUIL: TLabel;
    lblCuil: TLabel;
    edtPeriodoDesdeTrabajador: TPeriodoPicker;
    edtPeriodoHastaTrabajador: TPeriodoPicker;
    fraEmpresaTrabajador: TfraEmpresa;
    chkTodosLosContratosTrabajador: TCheckBox;
    fraTrabajadores: TfraTrabajador;
    gbInfoEmpresa: TGroupBox;
    fraInfoEmpresa: TfraInfoEmpresa;
    gbCriterios: TGroupBox;
    lblCUIT: TLabel;
    fraEmpresaPresentacion: TfraEmpresa;
    chkMostrarTodosLosContratos: TCheckBox;
    tsFiltros2: TTabSheet;
    gbCriterios2: TGroupBox;
    lblSUSS: TLabel;
    lblSector: TLabel;
    lblHolding: TLabel;
    lblEjecutivo: TLabel;
    cboSUSS: TComboBox;
    fraSector: TfraCodigoDescripcionExt;
    fraHolding: TfraCodigoDescripcionExt;
    fraEjecutivo: TfraCodigoDescripcionExt;
    gbOpcionesFiltro: TGroupBox;
    lblHasta: TStaticText;
    chkEmpresasSinPresentacionPeriodo: TCheckBox;
    chkEmpresasSinEmisionRealPeriodo: TCheckBox;
    chkConObservacionesEnPeriodo: TCheckBox;
    chkContratoDadoBajaPeriodo: TCheckBox;
    chkContratoPedidosAprobacion: TCheckBox;
    chkProceso: TCheckBox;
    edtProcesadosEn: TEdit;
    edtPeriodoDesde: TPeriodoPicker;
    edtPeriodoHasta: TPeriodoPicker;
    gbDatosContrato: TGroupBox;
    Label5: TLabel;
    edEstado: TEdit;
    Label14: TLabel;
    edVigDesde: TDateComboBox;
    Label10: TLabel;
    edVigHasta: TDateComboBox;
    Label4: TLabel;
    edActividad: TEdit;
    Label6: TLabel;
    edMotivoAlta: TEdit;
    edARTAnterior: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edBaja: TEdit;
    Label9: TLabel;
    edSector: TEdit;
    Label11: TLabel;
    edSuss: TEdit;
    gbSiniestros: TGroupBox;
    Label12: TLabel;
    lblSiniestros: TLabel;
    tbMostrarOcultarColumnas: TToolButton;
    gbBlockNotas: TGroupBox;
    lblBlockNotas: TLabel;
    edBlockNotas: TMemo;
    tbCuadroComparativo: TToolButton;
    Panel5: TPanel;
    splitter: TJvSplitter;
    dbgRecepcionesTrabajadores: TArtDBGrid;
    dbgContratoPeriodo: TArtDBGrid;
    lbl_0: TLabel;
    lblNotas: TLabel;
    edFechaInscripcion: TDateComboBox;
    Label13: TLabel;
    pnColorFondoMovPendienteAprobacion: TPanel;
    lblMovimientosPendientes: TLabel;
    lblDDJJSinPres: TLabel;
    lblDDJJSinPresentar: TLabel;
    tbAsesorEmision: TToolButton;
    ToolButton4: TToolButton;
    tbRegenerarCabecera: TToolButton;
    fpReprocesarDDJJ: TFormPanel;
    Bevel4: TBevel;
    Label18: TLabel;
    btnAceptarReproceso: TButton;
    btnCancelarReproceso: TButton;
    fraObservacionRegenerarDDJJ: TfraCodigoDescripcionExt;
    tbMotivoGestion: TToolButton;
    ToolButton6: TToolButton;
    fpMotivoGestion: TFormPanel;
    Bevel5: TBevel;
    Label15: TLabel;
    btnAceptarMotivoGestion: TButton;
    btnCancelarMotivoGestion: TButton;
    fraMotivoGestion: TfraCtbTablas;
    chkAgendar: TCheckBox;
    lblContactos: TLabel;
    lblVerContactos: TLabel;
    TbSitFacturacion: TToolButton;
    lblPreventorReferente: TLabel;
    lblPrevReferenteData: TLabel;
    fpSolicitanteSitFac: TFormPanel;
    Bevel6: TBevel;
    Label16: TLabel;
    btnAceptarSolicitanteSitFac: TButton;
    btnCancelarSolicitanteSitFac: TButton;
    fraSolicitanteSitFac: TfraCodigoDescripcionExt;
    OpenDialog1: TOpenDialog;
    fpOpcionSitFac: TFormPanel;
    btnAceptarOpcionSitFac: TButton;
    btnCancelarOpcionSitFac: TButton;
    rgOpciones: TRadioGroup;
    fpSitFacturacion: TFormPanel;
    Bevel7: TBevel;
    btnSalirSitFac: TButton;
    JvgGroupBox1: TJvgGroupBox;
    dbgItemsGestionablesSitFac: TArtDBGrid;
    sdqItemsSitFac: TSDQuery;
    dsItemsSitFac: TDataSource;
    dbgDetalleSitFac: TArtDBGrid;
    sdqDetSitFac: TSDQuery;
    dsDetSitFac: TDataSource;
    Label17: TLabel;
    procedure btnProcesarArchivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbRefreshClick(Sender: TObject);
    procedure tbSeleccionarArchivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbArchivosProcesadosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarDevengadoMensualClick(Sender: TObject);
    procedure btnCancelarDevengadoMensualClick(Sender: TObject);
    procedure tbProcesarDevengadoIndividualClick(Sender: TObject);
    procedure tbDevengadoMensualClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
//    procedure tbModificarClick(Sender: TObject);
    procedure btnSalirProcesosClick(Sender: TObject);
    procedure tbEstadoCuentaClick(Sender: TObject);
    procedure dbgContratoPeriodoGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbDetalleNominaClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure dbgRecepcionesTrabajadoresDblClick(Sender: TObject);
    procedure chkProcesoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnSalirProgramaEmisionClick(Sender: TObject);
    procedure tbReprogramarClick(Sender: TObject);
    procedure fpProgramaEmisionClose(Sender: TObject; var Action: TCloseAction);
    procedure gbProgramaEmisionCollapsed(Sender: TObject);
    procedure sdqContratosAfterScroll(DataSet: TDataSet);
    procedure dbgRecepcionesTrabajadoresGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormResize(Sender: TObject);
    procedure gdbProcesosEjecutadosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbMostrarFiltrosClick(Sender: TObject);
    procedure tbVistaClick(Sender: TObject);
    procedure fraEmpresaTrabajadorExit(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tsNominasChange(Sender: TObject);
    procedure tbTotalesClick(Sender: TObject);
    procedure tbRecalcularObsClick(Sender: TObject);
    procedure tbSolicitudesAutoPeriodoClick(Sender: TObject);
    procedure dbgContratoPeriodoDblClick(Sender: TObject);
    procedure tbDetalleProcesoClick(Sender: TObject);
    procedure btnEliminarManualDeclaracionClick(Sender: TObject);
    procedure tbRestablecerClick(Sender: TObject);
    procedure dbgContratoPeriodoPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure lblNotasClick(Sender: TObject);
    function GetTipoProceso(AIdProceso: Integer): string;
    procedure sdqContratosAfterOpen(DataSet: TDataSet);
    procedure lblSiniestrosClick(Sender: TObject);
    procedure CalcularTotalesResumen;
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure lblBlockNotasClick(Sender: TObject);
    procedure tbCuadroComparativoClick(Sender: TObject);
    procedure lblDDJJSinPresentarClick(Sender: TObject);
    procedure tbAsesorEmisionClick(Sender: TObject);
    procedure tbRegenerarCabeceraClick(Sender: TObject);
    procedure btnAceptarReprocesoClick(Sender: TObject);
    procedure fpReprocesarDDJJShow(Sender: TObject);
    procedure fpMotivoGestionEnter(Sender: TObject);
    procedure tbMotivoGestionClick(Sender: TObject);
    procedure btnAceptarMotivoGestionClick(Sender: TObject);
    procedure fraInfoEmpresalblAdic_1Click(Sender: TObject);
    procedure lblVerContactosClick(Sender: TObject);
    procedure TbSitFacturacionClick(Sender: TObject);
    procedure fraInfoEmpresalblAdic_10Click(Sender: TObject);
    procedure fpSolicitanteSitFacShow(Sender: TObject);
    procedure btnAceptarSolicitanteSitFacClick(Sender: TObject);
    procedure fpOpcionSitFacShow(Sender: TObject);
    procedure btnAceptarOpcionSitFacClick(Sender: TObject);
    procedure sdqItemsSitFacAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FIdProceso : integer;
    FCalculando : boolean;
    FArchivoAProcesar: String;
    FArchivoAProcesar2: String;
    //FPeriodoSACAnterior: String;
    procedure RefrescarProcesos;
    procedure GetPanelProceso(AIdProceso : Integer);
    procedure VerificarFormulario(AArchivo: string);
    procedure GenerarDevengadoMensual;
    procedure SeleccionarProceso;
    function GetFiltroConsulta : string;
    function VerifyFile(AArchivo: String; var Id: integer; var OutputFile : String): boolean;
    procedure MostrarProcesos;
    procedure LimpiarArchivoProcesar;
    procedure CrearOpcion(AId: Integer; ATexto: String);
    procedure MostrarPrograma;
    procedure ProcesarRecepcionLocalmente(AArchivo: String);
    procedure ProcesarRecepcionPorServidor(AArchivo: String);
    procedure DesSeleccionarProceso;
    procedure ProcesarArchivo(AArchivo: String; ATipoFormulario: Integer); overload;
    procedure ProcesarArchivo; overload;
    procedure RecargarPresentanciones;
    procedure Limpiar;
    procedure VistaContrato;
    procedure VistaTrabajador;
    function GetFiltroConsultaTrabajador: string;
    procedure EmpresaTrabajadorChange(Sender: TObject);
    procedure RecargarPresentancionesContrato;
    procedure RecargarPresentancionesTrabajador;
    procedure SetearGrilla;
    procedure MostrarFormato(AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MostrarFormatoContrato(AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MostrarFormatoTrabajadores(AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure PrintResults;
    procedure TerminarVistaProcesos;
    function GetFiltrosTrabajadores: string;
    procedure CalcularTotales;
    procedure CalcularTotalesContrato;
    procedure CalcularTotalesTrabajador;
    procedure FormatearGrilla(Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure VerDetalleNomina(SinPeriodo: Boolean);
    procedure MostrarEstadoCuenta;
    procedure LimpiarGeneracionDevengadoMensual;
    procedure VerificarPeriodosConsecutivo(var APeriodoDesde, APeriodoHasta: String);
    procedure fraGrupoParaDevengadoChange(Sender: TObject);
    function GetConsultaRecepciones: String;
    procedure DoDescomprimirZip(Archivo: String; var aArchivoAProcesar, aArchivoAProcesar2: String);
    procedure DoMostrarNotas(Contrato: Integer);
    procedure DoLimpiarLabel(lbl: TLabel);
    procedure CargarLabel(Lbl: TLabel; Texto: string; Reemplazo: string; Default: string = '');
    procedure DoCargarDatosContrato(Contrato: Integer);
    procedure DoMostrarSiniestros(Contrato: Integer; Periodo: String);
    procedure DoMostrarDDJJSinPresentar(Contrato: Integer);
    procedure DoMostrarBlockNotas(CUIT: String);
    procedure do_informar_gestiones_pendientes(aContrato: integer);
    function GenerarMinuta(aContrato: integer): integer;
  public
    procedure EmpresaOnchange(Sender: TObject);
    procedure Refrescar;
  end;

var
  frmAdministracionNominas: TfrmAdministracionNominas;
  Totales : array[0..10] of Integer;
  TotalConsulta: array of extended;

const
  TituloVer: String = 'Ver...';
  TituloSinDatos: String = 'Sin Datos';
  MAXCOLS = 7;
  CAMPOS_SUMA : array [0..MAXCOLS] of string = ('DEVENGADOCUOTA', 'DEVENGADOFONDO', 'DEVENGADOINTERES', 'DEVENGADOOTROS', 'PAGOCUOTA', 'PAGOFONDO', 'PAGOINTERES', 'PAGOOTROS');

implementation

uses unDmPrincipal, unDmEmision, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General,   StrFuncs,
  IntEdit, unRecalculoDevengado, objPeriodo, unFrmDetalleNomina,
  unFuncionesEmision, //unFrmDetalleComunicacion,
  ShellApi, VCLExtra,
  unEspera, unUtils, unDirUtils, unConstEmision, unfraProgramacion,
  unDmProcesoArchivo, unAdminEstadoDeCuenta, unFrmSolicitudAutorizacion,
//  unFrmConsultaLogs,
  unfrmObservacion, unConsultaSiniestros,unfrmABMBlockNotas,
  unfrmCuadroComparativo, unRptDDJJSinPresentar, unVisualizador, unAsesorEmision,
  unEnvioMail, unMoldeEnvioMail, unComunes, unContratoContactoEmi, unComunesGestion,
  unGestionEnTramite, unAgendaVistaEmpresa, Numeros, unABMMinutaReunion;

{$R *.dfm}

(*
const
  MAXCOLS_RESUMEN = 4;
  CAMPOS_RESUMEN : array [0..MAXCOLS_RESUMEN] of string =
      ('Contrato', 'PERIODO', 'COBERTURA', 'ESTADO_PERIODO', 'RP_CANTIDADOBSERVACIONES');
*)

{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.FormCreate(Sender: TObject);
begin
  tsProcesosEmision.TabVisible := (Sesion.Sector = 'EMI') or (Sesion.Sector = 'COMPUTOS');

  with fraGrupoParaDevengado do
  begin
    TableName   := 'EMI.IGE_GRUPOEMISION';
    FieldID     := 'GE_ID';
    FieldCodigo := 'GE_ID';
    FieldDesc   := 'GE_DESCRIPCION';
    FieldBaja   := 'GE_FECHABAJA';
    ShowBajas   := false;
    OnChange    := fraGrupoParaDevengadoChange;
  end;

  with fraFormatoArchivo do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
    ExtraCondition := ' AND TF_NOMINA = ''S'' ';
  end;

  with fraHolding do
  begin
    TableName 	   := 'afi.age_grupoeconomico';
    FieldID        := 'ge_id';
    FieldCodigo    := 'ge_codigo';
    FieldDesc      := 'ge_descripcion';
    ExtraCondition := ' AND ge_temporal IS NULL';
  end;

  with fraSector do
  begin
    TableName   := 'CTB_TABLAS';
    FieldID     := 'TB_CODIGO';
    FieldCodigo := 'TB_CODIGO';
    FieldDesc   := 'TB_DESCRIPCION';
    FieldBaja   := 'TB_FECHABAJA';
    ExtraFields := ', TB_CLAVE, TB_ESPECIAL1, TB_ESPECIAL2 ';
    ExtraCondition := ' AND TB_CLAVE = ''SECT'' ';
  end;

  with fraEjecutivo do
  begin
    TableName := ' afi.aec_ejecutivocuenta ';
    FieldID := 'ec_id';
    FieldCodigo := 'ec_id';
    FieldDesc := 'ec_nombre';
    FieldBaja := 'ec_fechabaja';
    ShowBajas := true;
  end;

  with fraObservacionRegenerarDDJJ do
  begin
    TableName := 'emi.iob_observacion';
    FieldID := 'ob_id';
    FieldCodigo := 'ob_id';
    FieldDesc := 'ob_descripcion';
    FieldBaja := 'ob_fechabaja';
    ExtraJoinCondition := ' OB_RECHAZO in (''N'', ''I'' ) ';
    ShowBajas := false;
  end;

  with fraSolicitanteSitFac do
  begin
    TableName := 'emi.iss_solicitantesitfac';
    FieldID := 'ss_id';
    FieldCodigo := 'ss_id';
    FieldDesc := 'ss_descripcion';
    FieldBaja := 'ss_fechabaja';
    ShowBajas := false;
  end;

  with fraMotivoGestion do
  begin
    Clave     := 'MOGES';
    ShowBajas := false;
  end;

  fraEmpresaTrabajador.ShowBajas := true;
  fraEmpresaTrabajador.OnChange := EmpresaTrabajadorChange;

  fraEmpresaPresentacion.ShowBajas := true;
  fraEmpresaPresentacion.OnChange := EmpresaOnchange;
  fraEmpresaPresentacion.UltContrato := true;

  pnFiltro.visible := not tbMostrarFiltros.Down;

//Pablo  edtPeriodoDesdeTrabajador.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);
//Pablo  edtPeriodoHastaTrabajador.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);

//Pablo  edtPeriodoDesde.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);
//Pablo  edtPeriodoHasta.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);

  // por ahora, quedan deshabilitados, porque tarda demasiado
  with fraInfoEmpresa do
    begin
      VerSinCompensados := False;
      VerCartasImpresas := False;
    end;

  VCLExtra.LockControls([edVigDesde, edVigHasta, edEstado, edActividad, edMotivoAlta, edARTAnterior, edBaja, edEstado, edSector, edSuss, edBlockNotas, edFechaInscripcion], True);

  SetLength(TotalConsulta, MAXCOLS + 1);

  VistaContrato;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.FormShow(Sender: TObject);
begin
  //Refresca los procesos pero luego detiene la ejecución.
  RefrescarProcesos;
//  TerminarVistaProcesos;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.btnProcesarArchivoClick(
  Sender: TObject);
begin
  ProcesarArchivo;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbRefreshClick(Sender: TObject);
begin
  RefrescarProcesos;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbSeleccionarArchivoClick(Sender: TObject);
begin
//  fraFormatoArchivo.Enabled := true;
  fraFormatoArchivo.Clear; 
  if od.Execute then
  begin
    edtArchivo.Text := od.FileName;
    FArchivoAProcesar := '';
    FArchivoAProcesar2 := '';

    if (UpperCase(ExtractFileExt(edtArchivo.Text)) = '.ZIP') then
      DoDescomprimirZip(edtArchivo.Text, FArchivoAProcesar, FArchivoAProcesar2)
    else
      FArchivoAProcesar := edtArchivo.Text;

    if FileExists(FArchivoAProcesar) then
    begin
      VerificarFormulario(FArchivoAProcesar);
      btnProcesarArchivo.Enabled := Enabled;
    end else
      btnProcesarArchivo.Enabled := Enabled;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.EmpresaTrabajadorChange(Sender: TObject);
begin
  if fraEmpresaTrabajador.IsSelected then
  begin
    fraTrabajadores.Contrato := fraEmpresaTrabajador.Contrato;
    fraTrabajadores.Clear;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbRefrescarClick(Sender: TObject);
begin
  Refrescar;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.btnAceptarDevengadoMensualClick(Sender: TObject);
const
  razon = 'No corresponde devengado mensual para el período en curso.';
begin
(*
  AnteriorReal     := Get_UltimoPeriodoDevengado('R');
  AnteriorEstimada := Get_UltimoPeriodoDevengado('E');

  VerificarMultiple(['Generando Devengado.',
      fraGrupoParaDevengado, fraGrupoParaDevengado.isselected, 'Debe seleccionar un grupo para general la emisión',
      ppPeriodoDevengadoMensual, not get_existeresumendevengado(fraGrupoParaDevengado.Value,
                AnteriorReal,
                AnteriorEstimada), 'Ya se a corrido la emisión mensual sobre el período.',
      ppPeriodoDevengadoMensual, ppPeriodoDevengadoMensual.Periodo.Valor < GetPeriodo(DBDate,fpAnioMes), 'El período no es devengable.']);
  do_generardevengadogrupo(fraGrupoParaDevengado.Value);

*)

 Verificar(not fraGrupoParaDevengado.IsSelected, fraGrupoParaDevengado, 'Debe seleccionar un grupo para generar la emisión');
 Do_GenerarDevengadoMensual(fraGrupoParaDevengado.Value, ppPeriodoDevengadoMensual.Periodo.Valor);
 fpDevengadoMensual.close;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.btnCancelarDevengadoMensualClick(Sender: TObject);
begin
   fpDevengadoMensual.close;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.VerificarPeriodosConsecutivo(var APeriodoDesde, APeriodoHasta : String);
var
 i : integer;
 b : TBookmark;
 dataset : TDataset;
begin
  APeriodoDesde := '999999';
  APeriodoHasta := '';

  dataset := dbgContratoPeriodo.DataSource.DataSet;
  b := dataset.GetBookmark;

  with dataset do
  try
    DisableControls;
    if dbgContratoPeriodo.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgContratoPeriodo.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(dbgContratoPeriodo.SelectedRows.Items[i]));
        if FieldByName('periodo').AsString < APeriodoDesde then
          APeriodoDesde := FieldByName('periodo').AsString;

        if FieldByName('periodo').AsString > APeriodoHasta then
          APeriodoHasta := FieldByName('periodo').AsString;
      end;
    end else
    begin
        if RecordCount > 0 then
        begin
          APeriodoDesde := FieldByName('periodo').AsString;
          APeriodoHasta := FieldByName('periodo').AsString;
        end;
    end;
  finally
    GotoBookmark(b);
    FreeBookmark(b);
    EnableControls;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbProcesarDevengadoIndividualClick(
  Sender: TObject);
var
 PeriodoDesde : string;
 PeriodoHasta : string;
begin
(*
  if sdqContratos.Active and (sdqContratos.FieldByName('rp_estado').AsString = ESTADO_PERIODO_PENDIENTE) then
  begin
    MessageBox(0, 'No se puede recálcular periodos marcados como pendiente de aprobación. ',
                  'Recálculo de Períodos', MB_ICONINFORMATION or MB_OK);
    exit;
  end;
*)

  if (sdqContratos.RecordCount > 0) then
  begin
    With TfrmRecalculoDevengado.Create(self) do
    begin
      VerificarPeriodosConsecutivo(PeriodoDesde, PeriodoHasta);
      Redevengar(sdqContratos.FieldByName('contrato').AsInteger,
                 PeriodoDesde,
                 PeriodoHasta);
      Refrescar;
    end;
  end else MessageDlg('Debe seleccionar un contrato.', mtInformation, [mbOK], 0);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbDevengadoMensualClick(
  Sender: TObject);
begin
   GenerarDevengadoMensual;
//   Refrescar;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbNuevoClick(Sender: TObject);
begin
  if sdqContratos.RecordCount > 0 then
  begin
    with TfrmConsultaNotas.create(self) do
    try
      FormStyle := fsNormal;
      WindowState := wsNormal;
      Hide;
      FiltrarNotas(sdqContratos.FieldByName('Contrato').AsInteger , sdqContratos.FieldByName('Periodo').AsString);
      ShowModal;
      Refrescar;
    finally
      free;
    end;
  end;

(*
  with TFrmRecepcionNota.Create(self)  do
  try
    if sdqContratos.RecordCount > 0 then


      NuevaNota(sdqContratos.FieldByName('Contrato').AsInteger,
                       sdqContratos.FieldByName('Periodo').AsString);
    Refrescar;
  finally
     free;
  end;
*)
(*
  with TfrmCargaIndividual.Create(self)  do
  try
    if sdqContratos.RecordCount > 0 then

      CargarIndividual(sdqContratos.FieldByName('Contrato').AsInteger,
                       sdqContratos.FieldByName('Periodo').AsString);
    Refrescar;
  finally
     free;
  end;
*)
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbSalirClick(Sender: TObject);
begin
   close;
end;
{------------------------------------------------------------------------------}
(*
procedure TfrmAdministracionNominas.tbModificarClick(Sender: TObject);
begin
  with TfrmCargaIndividual.Create(self)  do
  try
     Showmodal;
  finally
     free;
  end;
end;
*)
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbEstadoCuentaClick(Sender: TObject);
begin
  if not sdqContratos.Active or sdqContratos.IsEmpty then
    raise Exception.Create( 'Debe elegir un registro.' );

  MostrarEstadoCuenta;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.MostrarEstadoCuenta;
begin
  if not sdqContratos.Active or sdqContratos.IsEmpty then
    raise Exception.Create( 'Debe elegir un registro.' );

  frmAdminEstadoDeCuenta.Free;
  frmAdminEstadoDeCuenta := TfrmAdminEstadoDeCuenta.Create(Self);

  frmAdminEstadoDeCuenta.Collapsed := True;
  frmAdminEstadoDeCuenta.CargarCabecera(
              sdqContratos.FieldByName('CONTRATO').AsString,
              sdqContratos.FieldByName('PERIODO').AsString);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbLimpiarClick(Sender: TObject);
begin
  Limpiar;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbDetalleNominaClick(Sender: TObject);
begin
  if not sdqContratos.Active or sdqContratos.IsEmpty then
    raise Exception.Create( 'Debe elegir un registro.' );

  VerDetalleNomina(True);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.VerDetalleNomina(SinPeriodo: Boolean);
begin
  if SinPeriodo then
    VerDetalleNominaSeleccionada(ART_EMPTY_ID, sdqContratos.FieldByName('Contrato').AsInteger, sdqContratos.FieldByName('Periodo').AsString)
  else
    begin
      if sdqRecepciones.RecordCount > 0 then
        VerDetalleNominaSeleccionada(sdqRecepciones.FieldByName('Id').AsInteger, sdqContratos.FieldByName('Contrato').AsInteger, sdqContratos.FieldByName('Periodo').AsString);
    end
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbOrdenarClick(Sender: TObject);
begin
//  SortDialog.SortFields.Clear;
  LoadDynamicSortFields(SortDialog.SortFields, dbgContratoPeriodo.Columns);
  SortDialog.Execute;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.dbgRecepcionesTrabajadoresDblClick(Sender: TObject);
begin
  if not tbVista.Down then
    VerDetalleNomina(False);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.chkProcesoClick(Sender: TObject);
var
  Contrato : Integer;
begin
  if sdqContratos.Active then
    Contrato := sdqContratos.FieldByName('contrato').AsInteger
  else
    Contrato := -1;

  Limpiar;
  if chkProceso.checked then
  begin
    SeleccionarProceso;
    Refrescar;
  end
  else
  begin
    DesSeleccionarProceso;
    if Contrato > -1 then
    begin
     fraEmpresaPresentacion.Contrato := Contrato;
     Refrescar;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.btnAceptarClick(Sender: TObject);
begin
  fpProcesos.Close;
  edtProcesadosEn.Visible := true;
  edtProcesadosEn.Text := sdqProcesos.FieldByName('PR_ID').AsString + ' - Desc.: ' +
                          sdqProcesos.FieldByName('TP_DESCRIPCION').AsString + ' - ' +
                          sdqProcesos.FieldByName('PR_OBSERVACIONES').AsString;
  FIdProceso := sdqProcesos.FieldByName('pr_id').AsInteger;
  sdqProcesos.Close;
  Refrescar;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.btnSalirProcesosClick(Sender: TObject);
begin
  DesSeleccionarProceso;
  fpProcesos.Close;
end;
{-------------------------------------------------------------------------------}

procedure TfrmAdministracionNominas.btnSalirProgramaEmisionClick(Sender: TObject);
begin
  fpProgramaEmision.Close;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbReprogramarClick(Sender: TObject);
begin
  MostrarPrograma;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.fpProgramaEmisionClose(Sender: TObject;
  var Action: TCloseAction);
var
 opcion : TfraOpcionProgramacion;
begin
  while gbProgramaEmision.ControlCount > 1 do
   if gbProgramaEmision.Controls[gbProgramaEmision.ControlCount - 1] is TfraOpcionProgramacion then
   begin
     opcion := TfraOpcionProgramacion(gbProgramaEmision.Controls[gbProgramaEmision.ControlCount - 1]);
     gbProgramaEmision.RemoveControl(opcion);
     opcion.free;
   end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.gbProgramaEmisionCollapsed(Sender: TObject);
begin
  gbProgramaEmision.Collapse(false);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.sdqContratosAfterScroll(DataSet: TDataSet);
var
  Q : TSDQuery;
  iContrato: Integer;
  sPeriodo: String;
begin
  if not FCalculando then RecargarPresentanciones;

  iContrato := sdqContratos.fieldbyname('contrato').AsInteger;
  sPeriodo  := sdqContratos.fieldbyname('periodo').AsString;

  DoMostrarSiniestros(iContrato, sPeriodo);

  Q := GetQuery(' SELECT a.rc_empleados, a.rc_masasalarial, ' +
                ' afiliacion.get_suma_fija(a.rc_contrato, a.rc_periodo) sumafija, ' +
                ' afiliacion.get_porcmasa(a.rc_contrato, a.rc_periodo) sumavar ' +
                ' FROM zrc_resumencobranza a ' +
                ' WHERE a.rc_periodo = ' + SqlValue(sPeriodo) +
                ' AND a.rc_contrato = ' + SqlValue(iContrato));

  try
    if not Q.IsEmpty then
    begin
      StatusBar.Panels[1].Text := Format( '  Emple.: %8.0f  /  Mas Sal.: %12.2f  /  S.Fija: %8.2f  /  Variable: %6.3f',
                                        [Q.fieldbyname('rc_empleados').AsFloat,
                                        Q.fieldbyname('rc_masasalarial').AsFloat,
                                        Q.fieldbyname('sumafija').AsFloat,
                                        Q.fieldbyname('sumavar').AsFloat] );
    end;
  finally
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.FormResize(Sender: TObject);
begin
//  gbCriterios.Width := pnFiltro.Width - 5;
//  gbTrabajadores.Width := pnFiltro.Width - 5;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.gdbProcesosEjecutadosGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if sdqProcesos.FieldByName('ci_cantidaderrores').asinteger > 0 then
    AFont.Color := clRed;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbMostrarFiltrosClick(Sender: TObject);
begin
  pnFiltro.visible := not tbMostrarFiltros.Down;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbVistaClick(Sender: TObject);
begin
  if tbVista.Down then
    VistaTrabajador
  else
    VistaContrato;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.fraEmpresaTrabajadorExit(
  Sender: TObject);
begin
  fraEmpresaTrabajador.FrameExit(Sender);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbImprimirClick(Sender: TObject);
begin
    PrintResults;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.dbgRecepcionesTrabajadoresGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  MostrarFormato(AFont, BackGround, Highlight);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.dbgContratoPeriodoGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  FormatearGrilla(Field,AFont,Background,Highlight);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tsNominasChange(Sender: TObject);
begin
(*
  if (tsNominas.ActivePage = tsDeclaracionesJuradasPresentadas) then
    TerminarVistaProcesos
  else
    RefrescarProcesos;
*)
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbTotalesClick(Sender: TObject);
begin
  if tbTotales.Down then
    CalcularTotales;

  dbgContratoPeriodo.FooterBand         := tbTotales.Down;
//  dbgRecepcionesTrabajadores.FooterBand := tbTotales.Down;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.ProcesarArchivo;
var
 Modo : string;
begin

  if ProcesandoArchivo then
  begin
    LiberarProcesando;
    Exit;
  end;

//  IniciarEspera;
  try
    if FileExists(FArchivoAProcesar) and fraFormatoArchivo.IsSelected then
      begin
         if not chkAgendar.Checked then
         begin
           if (MessageDlg('¿Confirma el proceso del archivo seleccionado?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
         end
         else begin
           if (MessageDlg('¿Desea agendar del archivo seleccionado?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
         end;
        begin
          Modo := ValorSql('select tf_modo from emi.itf_tipoformulario where tf_id = ' +
                      SqlValue(fraFormatoArchivo.Codigo), 'S');
          if Modo = 'S' then
               ProcesarRecepcionPorServidor(FArchivoAProcesar)
          else ProcesarRecepcionLocalmente(FArchivoAProcesar);
        end;
      end
        else begin
          LiberarProcesando;
          InvalidMsg(edtArchivo, 'El archivo especificado no existe', 'Proceso de Archivo');
        end;

      if (FArchivoAProcesar2 <> '') then
      begin
        if FileExists(FArchivoAProcesar2) then
        begin
            VerificarFormulario(FArchivoAProcesar2);
            if fraFormatoArchivo.IsSelected then
            begin
              Modo := ValorSql('select tf_modo from emi.itf_tipoformulario where tf_id = ' +
                          SqlValue(fraFormatoArchivo.Codigo), 'S');
              if Modo = 'S' then
                   ProcesarRecepcionPorServidor(FArchivoAProcesar2)
              else ProcesarRecepcionLocalmente(FArchivoAProcesar2);
            end;
        end
        else begin
          LiberarProcesando;
          InvalidMsg(edtArchivo, 'El archivo especificado no existe', 'Proceso de Archivo');
        end;
      end;

    LimpiarArchivoProcesar;

  finally
    LiberarProcesando;
//    DetenerEspera;
  end;

end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.PrintResults;
//Var AutoCols : Boolean;
begin
(*  tbImprimir.Enabled := False;
  Try
     if Assigned(FDBPrint) and FDataSource.DataSet.Active and (not FDataSource.DataSet.IsEmpty) and PrintDialog.Execute Then begin
        AutoCols := FDBPrint.Fields.Count = 0;
        try
          if AutoCols Then
             FDBPrint.SetGridColumns( FDBGrid, True, [baDetail, baHeader, baTotal, baSubTotal] );

          if FDBPrint.Title.Text = '' Then
             FDBPrint.Title.Text := Caption;

          FDBPrint.Print ;
        finally
          if AutoCols Then
             FDBPrint.Fields.Clear ;
        end;
     end;
  finally
     tbImprimir.Enabled := True; {Lo pone en true porque si entró acá quiere decir que estaba activado}
  end;
*)
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.CalcularTotalesResumen;
var
 contratos : integer;
 contrato : integer;
 cobertura : integer;
 observaciones : integer;
 pendiente_aprobacion: integer;
 b : TBookmark;
begin
  if not sdqContratos.Active then exit;

  sdqContratos.DisableControls;

  contrato := -1; contratos := 0; cobertura := 0;
  observaciones := 0; pendiente_aprobacion := 0;

  b := sdqContratos.GetBookmark;
  try
    FCalculando := true;
    sdqContratos.First;
    while not sdqContratos.Eof do
    begin
      if sdqContratos.FieldByName('contrato').AsInteger <> contrato then
      begin
        contrato := sdqContratos.FieldByName('contrato').AsInteger;
        inc(contratos);
      end;

      if sdqContratos.FieldByName('COBERTURA').AsString <> 'No' then
        inc(cobertura);

      if sdqContratos.FieldByName('rp_estado').asstring = 'P' then
        inc(pendiente_aprobacion);

      if sdqContratos.FieldByName('RP_CANTIDADOBSERVACIONES').AsInteger > 0 then
        inc(observaciones);

      sdqContratos.Next;
    end;
  finally
    FCalculando := false;
    sdqContratos.GotoBookmark(b);
    sdqContratos.FreeBookmark(b);
    sdqContratos.EnableControls;
  end;

  Totales[0] := contratos;                   //Contratos
  Totales[1] := sdqContratos.RecordCount;   //Períodos
  Totales[2] := cobertura;                  //Con cobertura
  Totales[3] := pendiente_aprobacion;       //Pendientes de Aprobación
  Totales[4] := observaciones;              //Con observaciones
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.CalcularTotalesTrabajador;
begin

end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.CalcularTotalesContrato;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Try
      dbgContratoPeriodo.FooterBand := tbTotales.Down;
      if tbTotales.Down and sdqContratos.Active Then
        SumFields( sdqContratos, CAMPOS_SUMA, TotalConsulta );
    Except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.CalcularTotales;
begin
//  CalcularTotalesResumen;

  if tbVista.Down then
    CalcularTotalesTrabajador
  else
    CalcularTotalesContrato;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.VistaTrabajador;
begin
  gbCriterios.Visible     := False;
  gbDatosContrato.Visible := False;
  gbTrabajadores.Visible  := True;
//  pnFiltro.Height := 110;
  FIdProceso := -1;
  Limpiar;
  SetearGrilla;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.VistaContrato;
begin
  gbCriterios.Visible     := True;
  gbDatosContrato.Visible := True;
  gbTrabajadores.Visible  := False;
//  pnFiltro.Height := 176;
  Limpiar;
  SetearGrilla;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.SetearGrilla;
begin
  sdqRecepciones.Disablecontrols;
  sdqPresentacionesTrabajador.DisableControls;
  try
    if not tbVista.down then
      dbgRecepcionesTrabajadores.DataSource := dsRecepciones
    else
      dbgRecepcionesTrabajadores.DataSource := dsPresentacionesTrabajador;

//    for i := 2 to 12 do
//      dbgRecepcionesTrabajadores.Columns[i].Visible := tbVista.down;
  finally
    sdqRecepciones.EnableControls;
    sdqPresentacionesTrabajador.EnableControls;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.ProcesarRecepcionLocalmente(AArchivo: String);
var
  TipoFormulario : Integer;
  Id : Integer;
  NombreArchivo : string;
begin
//  IniciarEspera;
  TipoFormulario := ValorSql('select tf_formato from emi.itf_tipoformulario where tf_id = ' + SqlValue(fraFormatoArchivo.Codigo), 'S');
//  try
    //FIXME.. truchada.

    if VerifyFile(AArchivo, Id, NombreArchivo) then
    begin
      if not chkAgendar.Checked then
        ProcesarArchivo(NombreArchivo, TipoFormulario);
//      LimpiarArchivoProcesar;
    end;
    RefrescarProcesos;
//  finally
//    DetenerEspera;
//  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.ProcesarArchivo(AArchivo : String;
   ATipoFormulario : Integer);
var
  Procesador : TProcesador;
begin
  IniciarEspera;
  Procesador := TProcesador.Create;
  try
    Procesador.ProcesarDDJJ(AArchivo, ATipoFormulario);
  finally
    Procesador.Free;
    DetenerEspera;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.ProcesarRecepcionPorServidor(AArchivo: String);
var
   Id : Integer;
   NombreArchivo : string;
begin
  IniciarEspera;
  try
    if VerifyFile(AArchivo, Id, NombreArchivo) then
    begin
      LimpiarArchivoProcesar;
    end;
    RefrescarProcesos;
  finally
    DetenerEspera;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.TerminarVistaProcesos;
begin
  while ScrollProcesos.BandCount > 0 do
    ScrollProcesos.Bands[ScrollProcesos.BandCount - 1].Free;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.RefrescarProcesos;
var
 Q : TSDQuery;
 sqlwhere, sqlFrom: String;
 formSelect: String;
begin
  TerminarVistaProcesos;

  sqlwhere := '';
  sqlFrom := '';
  formSelect := '';

  if chkNominativas.Checked or chkDeterminativas.Checked or chkMiRegistro.Checked or chkMonotributo.Checked or
    (edFechaArchDesde.Date <> 0) or (edFechaArchHasta.Date <> 0) then
  begin
    sqlFrom := ', emi.tci_ddjjcabeceraimportacion ';
    sqlwhere := ' AND ci_idproceso = pr_id ';
  end;


  if chkNominativas.Checked then
    formSelect := formSelect + ', ' + SqlValue(TF_Nominativa_Afip);

  if chkDeterminativas.Checked then
    formSelect := formSelect + ', ' + SqlValue(TF_Determinativa_Afip);

  if chkMonotributo.Checked then
    formSelect := formSelect + ', ' + SqlValue(TF_Monotributo_Afip);

  if chkMiRegistro.Checked then
    formSelect := formSelect + ', ' + SqlValue(TF_Mi_Registro_Afip);

  if (formSelect <> '') then
    sqlwhere:= sqlwhere + ' AND ci_idtipoformulario in (0 ' + formSelect  + ')';

  if edFechaArchDesde.Date > 0 then
    sqlwhere:= sqlwhere + ' AND trunc(ci_fechaproceso) >= ' + SqlValue(edFechaArchDesde.Date);

  if edFechaArchDesde.Date > 0 then
    sqlwhere:= sqlwhere + ' AND trunc(ci_fechaproceso) <= ' + SqlValue(edFechaArchHasta.Date);

  if edFechaProcesoDesde.Date > 0 then
    sqlwhere:= sqlwhere + ' AND trunc(pr_fechainicio) >= ' + SqlValue(edFechaProcesoDesde.Date);

  if edFechaProcesoHasta.Date > 0 then
    sqlwhere:= sqlwhere + ' AND trunc(pr_fechainicio) <= ' + SqlValue(edFechaProcesoHasta.Date);

  Q := GetQuery('select * from emi.ipr_procesos ' + sqlFrom + ' where pr_visible = ''S'' ' + sqlwhere + ' order by pr_id desc');

  try
    while not Q.eof do
    begin
      GetPanelProceso(Q.FieldByName('pr_id').AsInteger);
      Q.Next;
      if (Q.RecNo = 22 {$IFDEF VER150}- 1{$ENDIF}) then Break;
    end;
  finally
    ScrollProcesos.ScrollPos := 0;
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.GetPanelProceso(AIdProceso : Integer);
var
  PanelProcesoArchivo: TfraProcesoArchivo;
  ScrollBandProceso  : TJvScrollMaxBand;
begin
  ScrollBandProceso := TJvScrollMaxBand.Create(ScrollProcesos);
  with ScrollBandProceso do
  begin
    Name := 'ScrollBandProceso' + Inttostr(AIdProceso);
    Width := 840;
    Height := 25;
    Expanded := true;
    ExpandedHeight := 135;
    {$IFNDEF VER150}
    Caption := '';
    {$ENDIF}
  end;

  PanelProcesoArchivo:= TfraProcesoArchivo.Create(self);
  with PanelProcesoArchivo do
  begin
      Name     := 'PanelProcesoArchivo' + Inttostr(AIdProceso);
      Parent   := ScrollBandProceso;
      Left     := 7;
      Top      := 19;
      Width    := 830;
      Height   := 112;
      TabOrder := 0;
      ID := AIdProceso;
      ScrollBandProceso.Expanded := progress < 100;
      if (Estado = 'A') then
        ScrollBandProceso.Color := clSkyBlue
      else
        ScrollBandProceso.Color := clBtnFace;

  end;
  ScrollProcesos.AddBand(ScrollBandProceso);
end;
{------------------------------------------------------------------------------}
function TfrmAdministracionNominas.GetTipoProceso(AIdProceso : Integer) : string;
begin
  result := ValorSql('SELECT itp.tp_descripcion                            ' +
                     '  FROM emi.ipr_procesos ipr, emi.itp_tipoproceso itp ' +
                     ' WHERE ipr.pr_idtiproceso = itp.tp_id                ' +
                     '   AND ipr.pr_id = ' + SqlValue(AIdProceso));
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.VerificarFormulario(AArchivo : string);
var
  Archivo: TextFile;
  CodigoFormulario : string;
  Linea : string;
begin
  try
    AssignFile(Archivo, AArchivo);
    Reset(Archivo);
    readln(Archivo, Linea);
(*
    CodigoArchivo := Trim(copy(linea, 3, 10));
    CodigoFormulario := ValorSql('select tf_id from emi.itf_tipoformulario where tf_header like ''%' + CodigoArchivo + '%'' ', '0');

    if CodigoFormulario = '0' then
    begin
      CodigoArchivo := Trim(copy(linea, 11, 13));
      CodigoFormulario := ValorSql('select tf_id from emi.itf_tipoformulario where tf_header like ''%' + CodigoArchivo + '%'' ', '0');
    end;
*)

    CodigoFormulario := GetCodigoArchivo(linea);

    if CodigoFormulario <> '0' then //begin
    begin
      fraFormatoArchivo.Codigo := CodigoFormulario;
      chkAgendar.Checked := GetAgendarDefault(CodigoFormulario) = 'S';
    end;
//      fraFormatoArchivo.Enabled := false;
//    end else
//      fraFormatoArchivo.Enabled := true;
  finally
    CloseFile(Archivo);
  end;
end;
{------------------------------------------------------------------------------}
function TfrmAdministracionNominas.GetFiltroConsulta : string;
var
  sFrom : string;
  sWherezrc : string;
  sWhereirp : string;
  sWhere : string;
  sSql   : string;
begin

  sWherezrc := '';
  sWhereirp := '';

  if fraEmpresaPresentacion.IsSelected then
  begin
    if chkMostrarTodosLosContratos.checked then
      sWhere := sWhere + ' and em_cuit =  ' + SqlValue(fraEmpresaPresentacion.CUIT)
    else
      sWhere := ' and co_contrato =  ' + SqlValue(fraEmpresaPresentacion.Contrato);
  end
  else
  begin
    if IsEmptyString(edtPeriodoDesde.Text) and
       IsEmptyString(edtPeriodoHasta.Text) and (FIdProceso = 0) then
      raise exception.create('Debe indicar períodos cuando no se indica empresa.');

    if (cboSUSS.ItemIndex > 0) then
       sWhere := sWhere + ' AND em_suss = ' + SqlValue(cboSUSS.ItemIndex);

    if chkEmpresasSinPresentacionPeriodo.Checked then
      sWhereirp := sWhereirp + ' and rp_idddjj is null ';

    if chkEmpresasSinEmisionRealPeriodo.Checked then
    begin
      sFrom  := sFrom  + ', emi.ide_devengado ide ';
      sWhereirp := sWhereirp + '  and ide.de_id = rp_iddevengado ' +
                               '  and de_idtipodevengado = ''R'' ';
      sWherezrc := ' 1=2 ';
    end;

    if chkConObservacionesEnPeriodo.Checked then
      sWhereirp := sWhereirp + ' and rp_cantidadobservaciones > 0 ';

    if chkContratoPedidosAprobacion.Checked then
      sWhereirp := sWhereirp + ' and rp_estado = ''P'' ';

    if fraEjecutivo.IsSelected then
      sWhere := sWhere + ' and co_codejecutivo = ' + SqlValue(fraEjecutivo.Codigo);

    if fraHolding.IsSelected then
      sWhere := sWhere + ' and em_idgrupoeconomico = ' + SqlValue(fraHolding.Value);

    if fraSector.IsSelected then
      sWhere := sWhere + ' and em_sector = ' + SqlValue(fraSector.Codigo);
  end;

  if FIdProceso > 0  then
  begin
    sFrom  := sFrom  + ', emi.idj_ddjj idj2 , emi.tci_ddjjcabeceraimportacion tci ';
    sWherezrc := sWherezrc + '   AND (tci.ci_idproceso = ' + SqlValue(FIdProceso)      		+
                             '        AND idj2.dj_idddjjcabeceraimportacion = tci.ci_id ' +
                             '        AND rc_contrato = idj2.dj_contrato   					' +
              							 '        AND rc_periodo =  idj2.dj_periodo)            ';

    sWhereirp := sWhereirp + '   AND (tci.ci_idproceso = ' + SqlValue(FIdProceso)      		+
                             '        AND idj2.dj_idddjjcabeceraimportacion = tci.ci_id ' +
                             '        AND irp.rp_contrato = idj2.dj_contrato   					' +
              							 '        AND irp.rp_periodo =  idj2.dj_periodo)            ';
  end else
  begin
    if not IsEmptyString(edtPeriodoDesde.Text)  then
      sWhereirp := sWhereirp + ' AND rc_periodo >= ' + SqlValue(edtPeriodoDesde.Text);
    if not IsEmptyString(edtPeriodoHasta.Text)  then
      sWhereirp := sWhereirp + ' AND rc_periodo >= ' + SqlValue(edtPeriodoHasta.Text);
(*
    if not IsEmptyString(edtPeriodoDesde.Text) and not IsEmptyString(edtPeriodoHasta.Text) then
      sWhereirp := sWhereirp + ' AND (rc_periodo between ' + SqlValue(edtPeriodoDesde.Text)
                            +  ' AND ' + SqlValue(edtPeriodoHasta.Text) + ' ) ';
*)
  end;

  if chkContratoDadoBajaPeriodo.Checked then
  begin
    sWhereirp := sWhereirp + ' AND (RP_COBERTURA = ''N'') ';
    sWherezrc := sWherezrc + ' AND (ART.COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(RC_CONTRATO, RC_PERIODO) <> 1) ';

  end;

  if (trim(sWhere) = '') and (sWherezrc = '') and (sWhereirp='') then sWhere:= sWhere + ' AND 1 = 2 ';

  sSql := 'SELECT CO_CONTRATO CONTRATO, RP_PERIODO PERIODO, EM_CUIT CUIT, EM_NOMBRE RSOCIAL, ' +
                 'DECODE(RP_COBERTURA, ''S'', ''Si'', ''No'') COBERTURA, ' +
                 'EMI.UTILES.GET_PERIODODECLARACION(EMI.UTILES.GET_DECLARACIONUSADA(RP_CONTRATO, RP_PERIODO)) PERIODO_NOMINA, ' +
                 'RP_IDDDJJ, RP_IDDEVENGADO, RP_ESTADO, ' +
                 'DECODE(RP_ESTADO, ''I'', ''Inválido'', ''P'', ''Pendiente Aprobación'', ''V'', ''Válido'') ESTADO_PERIODO, ' +
                 'RP_COBERTURA, RP_CANTIDADOBSERVACIONES, RP_CLASEHISTORICA CLASEHISTORICA, ' +
                 'RC_DEVENGADOCUOTA DEVENGADOCUOTA, RC_DEVENGADOFONDO DEVENGADOFONDO, ' +
                 'RC_DEVENGADOINTERES DEVENGADOINTERES, RC_DEVENGADOOTROS DEVENGADOOTROS, ' +
                 'RC_PAGOCUOTA+RC_RECUPEROCUOTA PAGOCUOTA, RC_PAGOFONDO+RC_RECUPEROFONDO PAGOFONDO, ' +
                 'RC_PAGOINTERES+RC_RECUPEROINTERES PAGOINTERES, RC_PAGOOTROS PAGOOTROS, ' +
                 'CTBCLASE.TB_DESCRIPCION DESCR_CLASE, ON_DESCRIPCION TIPORECEPCION, ' +
                 'DEUDA.GET_VENCIMIENTOCUOTACONTRATO(RP_CONTRATO, RP_PERIODO) VENCPERIODO, ' +
                 'IDJ.DJ_PERIODO ULTIMANOMINA, IDJ.DJ_CODIGORECTIFICATIVAORIGINAL, IDJ.DJ_FECHAPRESENTACION, ' +
                 'ART.COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(RP_CONTRATO, RP_PERIODO) CODESTADOPERIODO, ' +
                 'DECODE(ART.COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(RP_CONTRATO, RP_PERIODO), ''1'', ''Activo'', ''2'', ''No Activo'', ''3'', ''Rescindido'') DESCRESTADOPERIODO, ' +
                 '(SELECT COUNT(*) ' +
                 'FROM EMI.IMM_MOVIMIENTOMANUAL ' +
                 'WHERE MM_CONTRATO = RP_CONTRATO AND MM_PERIODO = RP_PERIODO AND MM_FECHAAPROBADO IS NULL) MovPendientes, ' +
                 'RC_GESTIONABLE || NVL(RC_GESTIONABLEAMPLIADO, '''') GESTIONABLE, CTBGESTIONABLE.TB_DESCRIPCION DESCRMOTIVOGESTION, ' +
                 'DECODE(EMI.UTILES.IS_PERIODOAGUINALDO(RP_CONTRATO, RP_PERIODO), ''S'', ''Si'', ''No'') PERIODOAGUINALDO, ' +
                 ' (SELECT MP_DESCRIPCION ' +
                 '  FROM EMI.IMP_MODOPRESENTACION ' +
                 '  WHERE EMI.UTILES.GET_MODOPRESENTACION(EM_ID, RP_PERIODO) = MP_ID) ModoPresentacion, ' +
                 'DECODE(EMI.UTILES.GET_TOPEAEMPRESAMINIMO(EM_CUIT, RP_PERIODO), ''D'', ''S'', ''S'', ''S'', ''N'', ''N'') TOPEAMIN, ' +
                 'DECODE(EMI.UTILES.GET_TOPEAEMPRESAMAXIMO(EM_CUIT, RP_PERIODO), ''D'', ''S'', ''S'', ''S'', ''N'', ''N'') TOPEAMAX ' +
            'FROM CTB_TABLAS CTBGESTIONABLE, CTB_TABLAS CTBCLASE, ZRC_RESUMENCOBRANZA, AEM_EMPRESA, AFI.ACO_CONTRATO, ' +
                 'EMI.IRP_RESUMENPERIODO IRP, EMI.IDJ_DDJJ IDJ, EMI.ION_ORIGENNOMINA ION ' + sFrom +
           'WHERE CO_CONTRATO = RP_CONTRATO ' +
           	 'AND EM_ID = CO_IDEMPRESA ' +
             'AND RC_CONTRATO(+) = IRP.RP_CONTRATO ' +
             'AND RC_PERIODO(+) = IRP.RP_PERIODO ' +
             'AND CTBCLASE.TB_CODIGO(+) = RC_CLASE ' +
             'AND IRP.RP_IDDDJJ = IDJ.DJ_ID(+) ' +
             'AND IDJ.DJ_IDORIGENNOMINA = ION.ON_ID(+) ' +
             'AND CTBGESTIONABLE.TB_CODIGO(+)= RC_MOTIVOGESTION ' +
             'AND CTBGESTIONABLE.TB_CLAVE(+)= ''MOGES'' ' +
             'AND CTBCLASE.TB_CLAVE(+)= ''CODEV'' ' 
//             'AND NOT (IRP.RP_IDDEVENGADO IS NULL AND RP_PERIODO = EMI.UTILES.GET_MAXIMOPERIODODEV AND IRP.RP_ESTADO <> ''P'') '
             + sWhere + sWhereirp;

  sSql := sSql + 'UNION ALL SELECT RC_CONTRATO CONTRATO, RC_PERIODO PERIODO, EM_CUIT CUIT, EM_NOMBRE RSOCIAL, ' +
                 'DECODE(ART.COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(RC_CONTRATO, RC_PERIODO), ''1'', ''Si'', ''No'') COBERTURA, ' +
                 'EMI.UTILES.GET_PERIODODECLARACION(EMI.UTILES.GET_DECLARACIONUSADA(RC_CONTRATO, RC_PERIODO)) PERIODO_NOMINA, ' +
                 'NULL RP_IDDDJJ, NULL RP_IDDEVENGADO, NULL RP_ESTADO, ' +
                 '''Válido'' ESTADO_PERIODO, ' +
                 'DECODE(ART.COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(RC_CONTRATO, RC_PERIODO), ''1'', ''S'', ''N'') RP_COBERTURA, 0 RP_CANTIDADOBSERVACIONES, RC_CLASE CLASEHISTORICA, ' +
                 'RC_DEVENGADOCUOTA DEVENGADOCUOTA, RC_DEVENGADOFONDO DEVENGADOFONDO, ' +
                 'RC_DEVENGADOINTERES DEVENGADOINTERES, RC_DEVENGADOOTROS DEVENGADOOTROS, ' +
                 'RC_PAGOCUOTA+RC_RECUPEROCUOTA PAGOCUOTA, RC_PAGOFONDO+RC_RECUPEROFONDO PAGOFONDO, ' +
                 'RC_PAGOINTERES+RC_RECUPEROINTERES PAGOINTERES, RC_PAGOOTROS PAGOOTROS, ' +
                 'CTBCLASE.TB_DESCRIPCION DESCR_CLASE, NULL TIPORECEPCION, ' +
                 'DEUDA.GET_VENCIMIENTOCUOTACONTRATO(RC_CONTRATO, RC_PERIODO) VENCPERIODO, ' +
                 'RC_PERIODONOMINA ULTIMANOMINA, NULL DJ_CODIGORECTIFICATIVAORIGINAL, NULL DJ_FECHAPRESENTACION, ' +
                 'ART.COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(RC_CONTRATO, RC_PERIODO) CODESTADOPERIODO, ' +
                 'DECODE(ART.COBRANZA.CHECK_COBERTURA_PERIODOCOBRANZ(RC_CONTRATO, RC_PERIODO), ''1'', ''Activo'', ''2'', ''No Activo'', ''3'', ''Rescindido'') DESCRESTADOPERIODO, ' +
                 '(SELECT COUNT(*) ' +
                 'FROM EMI.IMM_MOVIMIENTOMANUAL ' +
                 'WHERE MM_CONTRATO = RC_CONTRATO AND MM_PERIODO = RC_PERIODO AND MM_FECHAAPROBADO IS NULL) MovPendientes, ' +
                 'NVL(RC_GESTIONABLE, ''S'') || NVL(RC_GESTIONABLEAMPLIADO, '''') GESTIONABLE, NVL(CTBGESTIONABLE.TB_DESCRIPCION, DECODE(RC_PERIODO, RC_PERIODONOMINA, ''El periodo posee DDJJ'', ''El periodo no posee DDJJ'')) DESCRMOTIVOGESTION, ' +
                 'DECODE(EMI.UTILES.IS_PERIODOAGUINALDO(RC_CONTRATO, RC_PERIODO), ''S'', ''Si'', ''No'') PERIODOAGUINALDO, ' +
                 ' (SELECT MP_DESCRIPCION ' +
                 '  FROM EMI.IMP_MODOPRESENTACION ' +
                 '  WHERE EMI.UTILES.GET_MODOPRESENTACION(EM_ID, RC_PERIODO) = MP_ID) ModoPresentacion, ' +
                 'DECODE(EMI.UTILES.GET_TOPEAEMPRESAMINIMO(EM_CUIT, RC_PERIODO), ''D'', ''S'', ''S'', ''S'', ''N'', ''N'') TOPEAMIN, ' +
                 'DECODE(EMI.UTILES.GET_TOPEAEMPRESAMAXIMO(EM_CUIT, RC_PERIODO), ''D'', ''S'', ''S'', ''S'', ''N'', ''N'') TOPEAMAX ' +
            'FROM CTB_TABLAS CTBGESTIONABLE, CTB_TABLAS CTBCLASE, ZRC_RESUMENCOBRANZA, AEM_EMPRESA, AFI.ACO_CONTRATO ' + sFrom +
           'WHERE CO_CONTRATO = RC_CONTRATO ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND CTBCLASE.TB_CODIGO(+) = RC_CLASE ' +
             'AND CTBCLASE.TB_CLAVE(+)= ''CODEV'' ' +
             'AND CTBGESTIONABLE.TB_CODIGO(+)= RC_MOTIVOGESTION ' +
             'AND CTBGESTIONABLE.TB_CLAVE(+)= ''MOGES'' ' +
             'AND NOT EXISTS (SELECT 1 ' +
             '                FROM EMI.IRP_RESUMENPERIODO IRP ' +
             '                WHERE RC_CONTRATO = IRP.RP_CONTRATO ' +
             '                 AND RC_PERIODO = IRP.RP_PERIODO) '  + sWhere + sWherezrc;

  if SortDialog.SortFields.Count = 0 then
   	Result := sSql + ' ORDER BY 1, 2 '
  else
   	Result := sSql + SortDialog.OrderBy;
end;

function TfrmAdministracionNominas.GetFiltroConsultaTrabajador : string;
var
  sFrom : string;
  sWhere : string;
  sSelect : string;
  sSql   : string;
begin
  sFrom := ''; sWhere := ''; sSelect := '';

  if (IsEmptyString(edtPeriodoDesdeTrabajador.Text) or
      IsEmptyString(edtPeriodoHastaTrabajador.Text)) and
     not fraTrabajadores.IsSelected  then
  begin
    InvalidMsg(edtPeriodoDesdeTrabajador,
          'Debe completar mas datos para realizar la consulta. ' +
          'Si no especifica trabajador, especifique un rango de períodos.',
          'Consulta por Trabajadores');
    abort;
  end;

  if not IsEmptyString(edtPeriodoDesdeTrabajador.Text) and
     not IsEmptyString(edtPeriodoHastaTrabajador.Text) then
      sWhere := sWhere + ' AND (irp.rp_periodo between ' + SqlValue(edtPeriodoDesdeTrabajador.Text)
                          +  ' AND ' + SqlValue(edtPeriodoDesdeTrabajador.Text) + ' ) ';


  if fraTrabajadores.isselected and (fraTrabajadores.mskCUIL.Text <> '') then
  begin
    sWhere := sWhere + ' and (idt.dt_cuil = ' + SqlValue(fraTrabajadores.mskCUIL.Text) +  ') ';
    sSelect := sSelect + ', dt_cuil cuil ';
  end;

  if tbSoloPresentacionesActivas.down then
    sWhere := sWhere + ' and irp.rp_id = idj.dj_id '
  else
    sWhere := sWhere + '  and   irp.rp_contrato = idj.dj_contrato  ' +
                       '  and   irp.rp_periodo  = idj.dj_periodo   ';

  if fraEmpresaTrabajador.IsSelected then
  begin
    if chkTodosLosContratosTrabajador.checked then
      sWhere := sWhere + ' and (idj.dj_cuit = ' + SqlValue(fraEmpresaTrabajador.CUIT) +  ') '
    else
      sWhere := sWhere + ' and (idj.dj_contrato = ' + SqlValue(fraEmpresaTrabajador.Contrato) +  ') ';
  end;

//  sSql := 'Select DISTINCT EM_CUIT CUIT,                                                      ' +
  sSql := 'Select EM_CUIT CUIT,                                                      ' +
        '   EM_NOMBRE MP_NOMBRE, RP_CONTRATO CONTRATO, RP_PERIODO PERIODO,              ' +
        '   CO_ESTADO MP_ESTADO, CO_FECHAAFILIACION MP_FAFILIACION,                     ' +
        '   CO_VIGENCIADESDE MP_VIGENCIADESDE, CO_VIGENCIAHASTA MP_VIGENCIAHASTA,       ' +
        '   CO_MOTIVOALTA MP_MOTIVOALTA, lpad(co_idartanterior, 5, ''0'') MP_ARTANTERIOR, ' +
        '   CO_FECHABAJA MP_FBAJA, CO_MOTIVOBAJA MP_MOTIVOBAJA,                         ' +
        '   lpad(co_idartfutura, 5, ''0'') MP_ARTFUTURA, EM_FORMAJ MP_FORMAJ,             ' +
        '   EM_FEINICACTIV MP_FEINICACTIV, GE_CODIGO MP_HOLDING,                       ' +
        '   CO_FECHARECEPCION MP_FECHARECEPCION, CO_FECHAIMPRESION MP_FECHAIMPRESION,   ' +
        '   CO_RECEPCONTRATO MP_RECEPCONTRATO,  CO_NIVEL MP_NIVEL,                      ' +
        '   CO_MASATOTAL MP_MASATOTAL, CO_TOTEMPLEADOS MP_TOTEMPLEADOS,                 ' +
        '   CO_DIASFRANQUICIA MP_DIASFRANQUICIA,  CO_VIGENCIAFRANQUICIA MP_VIGENCIAFRANQUICIA, ' +
        '   CO_CLAUSULAESPECIAL MP_CLAUSULAESPECIAL,  CO_VIGENCIACLAUSULA MP_VIGENCIACLAUSULA, ' +
        '   CO_FECHAINT MP_FECHAINT, CO_FECHARES MP_FECHARES, rp_idddjj, rp_iddevengado, ' +
        '   rp_estado, decode(rp_estado, ''I'', ''Inválido'', ''P'', ''Pendiente Aprobación'', ''V'', ''Válido'') estado_periodo, ' +
        '   rp_cobertura, decode(rp_cobertura, ''S'', ''Si'', ''No'') cobertura, ' +
        '   rp_cantidadobservaciones, ' +
        '   emi.utiles.get_declaracionusada(rp_contrato, rp_periodo) periodo_nomina,  ' +
//        '   (SELECT dj_periodo FROM emi.idj_ddjj WHERE dj_id = irp.rp_idddjj) periodo_estimado,
        ' rp_clasehistorica clasehistorica ' + sSelect +  ', dt_id ' +
        ' From afi.AEM_EMPRESA AEM, afi.ACO_CONTRATO ACO, ' +
        '      emi.irp_resumenperiodo irp, emi.idj_ddjj idj, emi.idt_ddjjtrabajador idt, afi.age_grupoeconomico age ' +
        ' Where ' +
//Pablo        '         irp.rp_periodo < ' + GetPeriodo(DBDate, fpAnioMes) + ' and ' +
        '         aco.co_contrato = irp.rp_contrato ' +
        '   and   aem.em_id = aco.co_idempresa      ' +
        '   and   idt.dt_idddjj = idj.dj_id          ' +
        '   and   aem.em_idgrupoeconomico = ge_id(+) ' + sWhere;
  result := sSql + ' order by rp_contrato, rp_periodo ';
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.Refrescar;
var
  bc : Tbookmark;
  bd : Tbookmark;
begin
  bd := dbgRecepcionesTrabajadores.DataSource.DataSet.GetBookmark;
  bc := dbgContratoPeriodo.DataSource.DataSet.GetBookmark;

  try
    FCalculando := true;
    sdqRecepciones.Close;
    sdqContratos.Close;

    if not tbVista.Down then
       sdqContratos.SQL.text := GetFiltroConsulta
    else
       sdqContratos.SQL.text := GetFiltroConsultaTrabajador;
    sdqContratos.Open;
  finally
    FCalculando := false;
    If tbTotales.Down then CalcularTotales;

    try
      RecargarPresentanciones;
      dbgContratoPeriodo.DataSource.DataSet.GotoBookmark(bc);
      dbgRecepcionesTrabajadores.DataSource.DataSet.GotoBookmark(bd);

      dbgContratoPeriodo.DataSource.DataSet.FreeBookmark(bc);
      dbgRecepcionesTrabajadores.DataSource.DataSet.FreeBookmark(bd);
    except
      //Silencia la exception que se produce por no encontrar el campo.
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbArchivosProcesadosClick(
  Sender: TObject);
begin
  MostrarProcesos;
end;
{------------------------------------------------------------------------------}
procedure TFrmAdministracionNominas.MostrarProcesos;
begin
  sdqProcesos.Open;
  fpProcesos.Showmodal;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.FormatearGrilla(Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not sdqContratos.active then exit;
  if (sdqContratos.FieldByName('rp_idddjj').IsNull or
    (sdqContratos.FieldByName('periodo').asstring <> sdqContratos.FieldByName('periodo_nomina').asstring))
    and (sdqContratos.FieldByName('rp_cobertura').asstring = 'S') then
  begin
//    if not sdqContratos.FieldByName('periodo_nomina').IsNull then
      if Highlight Then Background := clTeal else Background := $00E1FFFF;
//    else
//      if Highlight Then Background := clTeal else   Background := clWindow;
  end else
  if sdqContratos.FieldByName('rp_cobertura').asstring = 'N' then
  begin
    if Highlight Then Background := clTeal else Background := clSilver;
  end else
    if Highlight Then  Background := clTeal else   Background := clWindow;

  if sdqContratos.FieldByName('rp_estado').asstring = 'I' then
    AFont.Color := clRed
  else begin
    if sdqContratos.FieldByName('rp_estado').asstring = 'P' then
      AFont.Color := clNavy
    else begin
      if (sdqContratos.FieldByName('MovPendientes').AsInteger <> 0) then
        AFont.Color := lblMovimientosPendientes.Font.Color
      else
        if Highlight Then  AFont.Color := clWhite else AFont.Color := clBlack ;
    end;
  end;

  if sdqContratos.FieldByName('rp_cantidadobservaciones').asinteger > 0 then
    AFont.Style := [fsBold]
  else AFont.Style := [];

end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.Limpiar;
begin
  cboSUSS.ItemIndex := 0;
  fraEmpresaPresentacion.Clear;
  fraHolding.Clear;
  fraEjecutivo.Clear;
  fraSector.Clear;
  chkEmpresasSinPresentacionPeriodo.Checked := false;
  chkEmpresasSinEmisionRealPeriodo.Checked := false;
  chkConObservacionesEnPeriodo.Checked := false;
  chkContratoDadoBajaPeriodo.Checked := false;
  chkContratoPedidosAprobacion.Checked := false;
  edtPeriodoDesde.Text := '';
  edtPeriodoHasta.Text := '';
  sdqContratos.close;
  sdqRecepciones.Close;
  sdqPresentacionesTrabajador.Close;
  fraTrabajadores.Clear;
  fraEmpresaTrabajador.Clear;
  edtPeriodoDesdeTrabajador.Text := '';
  edtPeriodoHastaTrabajador.Text := '';
  fraInfoEmpresa.Clear;
  lblPrevReferenteData.Caption := '-';
  DoLimpiarLabel(lblNotas);
  DoLimpiarLabel(lblSiniestros);
  DoCargarDatosContrato(-1);
  CargarLabel(lblDDJJSinPresentar, '', TituloSinDatos);
  edBlockNotas.Lines.Text := '';
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.LimpiarGeneracionDevengadoMensual;
begin
//  ppPeriodoDevengadoMensual.text := GetPeriodo(DBDate, fpAnioMes);
  ppPeriodoDevengadoMensual.Clear;
  fraGrupoParaDevengado.Clear;
  mObservacionesProcesoDevengado.Clear;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.GenerarDevengadoMensual;
begin
  LimpiarGeneracionDevengadoMensual;
  fpDevengadoMensual.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.SeleccionarProceso;
begin
  sdqProcesos.Open;
  btnAceptar.Visible := true;
  fpProcesos.ShowModal;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.DesSeleccionarProceso;
begin
  sdqProcesos.Close;
  edtProcesadosEn.Visible := false;
  edtProcesadosEn.Text := '';
  FIdProceso := -1;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.LimpiarArchivoProcesar;
begin
  edtArchivo.Text := '';
  FArchivoAProcesar := '';
  FArchivoAProcesar2 := '';
  fraFormatoArchivo.Clear;
  mObservaciones.Text := '';
end;
{-------------------------------------------------------------------------------}
function TfrmAdministracionNominas.VerifyFile(AArchivo : String; var Id : integer; var OutputFile : String) : boolean;
var
  Buffer : String;
  Cabecera : Integer;
  Linea : TLineaCabecera;
  Archivo: TextFile;
  Proceso : Integer;
  BaseDir : string;
  ServiceDir : string;
  NombreArchivo : string;
begin
  OutputFile := '';
  Result := False;
  
  try
    try

      AssignFile(Archivo, AArchivo);
      Reset( Archivo );
      readln( Archivo, Buffer);

      //Obtiene del archivo el registro de si ya fue procesado.
      Linea := ParseoCabeceraArchivo(Buffer);

      //Verifica si ya fue procesado.
      Cabecera := ValorSql('select count(*) from emi.tci_ddjjcabeceraimportacion ' +
                 ' where ci_codigoregistro   = ' + SqlValue(Linea.CodRegistro) +
                 '   and ci_codigoarchivo    = ' + SqlValue(Linea.CodArchivo) +
                 '   and ci_subcodigoarchivo = ' + SqlValue(Linea.SubcodigoArch) +
                 '   and ci_fechaproceso     = ' + SqlValue(Linea.FechaProceso) +
                 '   and (ci_horaproceso      = ' + SqlValue(Linea.HoraProceso) + ' or ci_horaproceso is null) ', '0');


      if Cabecera <> 0 then
       raise Exception.Create('El archivo indicado ya fue procesado.');

      result := not (Cabecera <> 0) or (Linea.CodRegistro <> '')
                or (Linea.CodArchivo <> '') or (Linea.SubcodigoArch <> '');


      //Obtiene el directorio base configurado.
      BaseDir := get_parametrobyclave('BASEDIR');

      if not chkAgendar.Checked then
      begin
        //Si el directorio no existe lo crea
        if not DirectoryExists(BaseDir) then MkDir(BaseDir);
        //Construye el nombre del archivo destino
        NombreArchivo := GetNewTempPath(BaseDir) + '\Novedad.tmp';

        //Copia en el destino
        copyfile(PChar(AArchivo),PChar(NombreArchivo), True);

        //Verifica y Renombra el archivo al nombre de trabajo. De no poderlo renombrar
        //Genera una exception.

        OutputFile := ChangeFileExt(NombreArchivo, '.dat');

        if not RenameFile(NombreArchivo, OutputFile ) then
           raise Exception.Create('El archivo no pudo ser renombrado. Verifique los permisos'
                                  +#13+#10+
                                  'del usuario sobre el directorio destino. ');
      end
      else begin
        //Obtiene donde el servicio leera los archivos
        ServiceDir := get_parametrobyclave('SERVICEDIR');
        if not DirectoryExists(ServiceDir) then
          raise Exception.Create('El directorio no existe o no tiene permisos.'
                                  + #13+#10 + ServiceDir);

        OutputFile := ServiceDir + '\' +  ExtractFileName(AArchivo);

        if not copyfile(PChar(AArchivo), PChar(OutputFile), true) then
           raise Exception.Create('El archivo no pudo ser copiado. Verifique los permisos'
                                  +#13+#10+
                                  'del usuario sobre el directorio destino. ');

      end;

      if result then
      begin
        //Registra el proceso que se usa para incorporar la nómina.
        BeginTrans(true);
        Proceso := GetSecNextVal('emi.seq_ipr_id');
        EjecutarSqlST('INSERT INTO emi.ipr_procesos                         ' +
                    '           (pr_id, pr_observaciones, pr_idtiproceso, pr_fechainicio)   ' +
                    '     VALUES (' + SqlValue(Proceso) + ', ' +
                                      SqlValue(mObservaciones.Text) +  ' , 1, Sysdate)');

        //Registra la cabecera de la nómina a incorporar.
        Id := GetSecNextVal('emi.seq_tci_id');
        EjecutarSqlST(' INSERT INTO emi.tci_ddjjcabeceraimportacion                             ' +
                   ' (ci_id, ci_codigoregistro, ci_codigoarchivo, ci_subcodigoarchivo,        ' +
                   '  ci_fechaproceso, ci_horaproceso, ci_idtipoformulario, ci_observacion,    ' +
                   '  ci_idproceso, ci_cantidadregistros, ci_estadoimportacion, ci_nombrearchivo, ci_usualta, ci_fechaalta)    ' +
                   ' VALUES (' + SqlValue(Id) + ','  +
                                 SqlValue(Linea.CodRegistro) + ', ' +
                                 SqlValue(Linea.CodArchivo) + ', ' +
                                 SqlValue(Linea.SubcodigoArch) + ', ' +
                                 SqlDate(Linea.FechaProceso) + ', ' +
                                 SqlValue(Linea.HoraProceso) + ', ' +
                                 SqlValue(fraFormatoArchivo.Codigo)  + ', ' +
                                 SqlValue(mObservaciones.Text) +  ', ' +
                                 SqlValue(Proceso) + ', 0, ' +
                                 iif(chkAgendar.Checked, SqlValue('A'), 'NULL')  + ', ' +
                                 SqlValue(ExtractFileName(OutputFile)) + ', ' + SqlValue(Sesion.LoginName) + ', sysdate)');
        CommitTrans(True);
      end;
    except
      on E : Exception do
      begin
        Rollback(True);
        raise EExceptionDDJJ.Create('Error Verificando cabecera de Archivo. ' + #10#13 + E.Message , E.Message, ERROR_VERIFICACIONCABECER);
      end;
    end;
  finally
     CloseFile(Archivo);
  end;
end;
{-----------------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.CrearOpcion(AId : Integer; ATexto : String);
var opcion : TfraOpcionProgramacion;
begin
  opcion := TfraOpcionProgramacion.Create(self, AId);
  opcion.Name := 'Opcion' + IntToStr(AId);
  opcion.Parent := gbProgramaEmision;
  opcion.cbOpcion.Caption := '  ' + ATexto;
  opcion.Align := alTop;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.MostrarPrograma;
var
 Q : TSDQuery;
begin
  Q := GetQuery('select ge_id id, ge_descripcion descripcion from emi.ige_grupoemision where ge_fechabaja is null order by ge_id asc');
  try
    while not Q.eof do
    begin
      CrearOpcion(Q.FieldByName('id').AsInteger, Q.FieldByName('descripcion').AsString);
      Q.Next;
    end;
    fpProgramaEmision.ShowModal;
  finally
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.RecargarPresentanciones;
begin
  if not tbVista.Down then
    RecargarPresentancionesContrato
  else
    RecargarPresentancionesTrabajador;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.RecargarPresentancionesContrato;
begin
  if sdqContratos.Active then
  begin
    try
      sdqRecepciones.DisableControls;
      sdqRecepciones.close;

      sdqRecepciones.Sql.Text := GetConsultaRecepciones;

      sdqRecepciones.ParamByName('contrato').AsInteger := sdqContratos.FieldByName('contrato').AsInteger;
      sdqRecepciones.ParamByName('periodo').AsString := sdqContratos.FieldByName('periodo').AsString;
    finally
      sdqRecepciones.open;

      TFloatField(sdqRecepciones.FieldByName('Masa Salarial')).currency := True;
      TFloatField(sdqRecepciones.FieldByName('Masa Declarada')).currency := True;

      sdqRecepciones.EnableControls;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.RecargarPresentancionesTrabajador;
begin
  if sdqContratos.Active then
  begin
    try
      sdqPresentacionesTrabajador.DisableControls;
      sdqPresentacionesTrabajador.close;
      sdqPresentacionesTrabajador.Sql.Text := GetFiltrosTrabajadores;

    finally
      sdqPresentacionesTrabajador.open;

      TFloatField(sdqPresentacionesTrabajador.FieldByName('Masa Salarial')).currency := True;
      TFloatField(sdqPresentacionesTrabajador.FieldByName('Masa Declarada')).currency := True;
      TFloatField(sdqPresentacionesTrabajador.FieldByName('Remun.')).currency := True;

      sdqPresentacionesTrabajador.EnableControls;
    end;
  end;
end;
{------------------------------------------------------------------------------}
function TfrmAdministracionNominas.GetFiltrosTrabajadores : string;
var
 SQL : string;
begin
  SQL := 'SELECT /*+ RULE */ idt.dt_codigosituacion "Cod.Condición",         ' +
    '   idt.dt_codigocondicion,         ' +
    '   idt.dt_actividades "Cod.Actividad",         ' +
    '   idt.dt_modocontratacion "Mod.Contrat.",         ' +
    '   idt.dt_zona "Zona",         ' +
    '   idt.dt_remuneracion "Remun.",         ' +
    '   idt.dt_codigoobrasocial "Cod.O.S.",         ' +
    '   idt.dt_secdj "Sec.DJ",         ' +
    '   idt.dt_secnom "Sec.Nom",         ' +
    '   idt.dt_cuil "CUIL",         ' +
    '   ctj.tj_nombre "Nombre Trabajador",         ' +
    '   idj.dj_id "Id",         ' +
    '   idj.dj_periodo "Período",         ' +
    '   idj.dj_empleados "Empleados",         ' +
    '   idj.dj_empleadosdeclarados "Empleados Decl.",  ' +
    '   idj.dj_masasalarial "Masa Salarial",         ' +
    '   idj.dj_masadeclarada "Masa Declarada",         ' +
    '   idj.dj_empleadosdeclaradosnoactivo  "Empleados Decl.NA",  ' +
    '   DECODE (idj.dj_suss, ''1'', ''Suss'', ''2'', ''No Suss'', ''3'', ''Mixta'') "SUSS",         ' +
    '   idj.dj_fechapresentacion "Fecha Presentación",         ' +
    '   DECODE (idj.dj_codigorectificativa,         ' +
    '           ''0'', ''Original'',         ' +
    '           ''1'', ''1ª Rectificativa'',         ' +
    '           ''2'', ''2ª Rectificativa'',         ' +
    '           ''3'', ''3ª Rectificativa'',         ' +
    '           ''4'', ''4ª Rectificativa'',         ' +
    '           ''5'', ''5ª Rectificativa'',         ' +
    '           ''6'', ''6ª Rectificativa'',         ' +
    '           ''7'', ''7ª Rectificativa'',         ' +
    '           ''8'', ''8ª Rectificativa'',         ' +
    '           ''9'', ''9ª Rectificativa'',         ' +
    '           ''Rectificativa'') "Rectificativa",            ' +
    '   ion.on_descripcion "Origen",         ' +
    '   idj.dj_codigorectificativa "Cod.Rect.",         ' +
    '   idj.dj_codigorectificativaoriginal "Cod.Rect. Orig",         ' +
    '   DECODE (emi.utiles.get_trabajadordevengable (dj_contrato, dt_cuil, dj_periodo), ''S'', ''Sí'', ''No'') "Devengable" , ' +
    '   ht_porcmasa "%",         ' +
    '   ht_sumafija "Fija",         ' +
    '   (SELECT MAX (de_fechacalculo)         ' +
    '      FROM emi.ide_devengado         ' +
    '     WHERE de_idddjj = dj_id) "F.Emisión",         ' +
     '  (SELECT MAX (ld_id)         ' +
     '     FROM emi.ild_loteddjj         ' +
     '    WHERE ld_idddjj = dj_id) "Gestión",         ' +
     '  DECODE ((SELECT COUNT (*)         ' +
     '             FROM emi.ild_loteddjj         ' +
     '            WHERE ld_idddjj = dj_id AND ld_fechafinalgestion IS NULL),         ' +
     '          0, '''',         ' +
     '          ''pendiente'') "Estado Gestión",         ' +
     '  (SELECT COUNT (*)         ' +
     '     FROM emi.ido_ddjjobservacion ido         ' +
     '    WHERE ido.do_idddjj = dj_id AND do_fechafinobservacion IS NULL)         ' +
     '                                                         "Observaciones",         ' +
     '  DECODE ((SELECT COUNT (*)         ' +
     '             FROM emi.ido_ddjjobservacion ido, emi.iob_observacion iob         ' +
     '            WHERE ido.do_idddjj = dj_id         ' +
     '              AND do_fechafinobservacion IS NULL         ' +
     '              AND ido.do_idobservacion = iob.ob_id         ' +
     '              AND iob.ob_rechazo = ''S''),         ' +
     '          0, ''No'',         ' +
     '          ''Sí'') "Rechazada",         ' +
     ' ci_fechaactualizacion "Fecha Incorporac.", dt_id  ' +
    'FROM emi.tci_ddjjcabeceraimportacion tci,         ' +
    '     emi.ion_origennomina ion,         ' +
    '     comunes.ctj_trabajador ctj,         ' +
    '     emi.idj_ddjj idj,         ' +
    '     emi.idt_ddjjtrabajador idt,         ' +
    '     afi.aht_historicotarifario aht         ' +
    'WHERE idt.dt_idddjj = idj.dj_id         ' +
    '  AND idj.dj_idorigennomina = ion.on_id         ' +
    '  AND idj.dj_idddjjcabeceraimportacion = tci.ci_id(+)         ' +
    '  AND aht.ht_id = art.afiliacion.get_idmaxendosovig (' +
        SqlValue(sdqContratos.FieldByName('contrato').AsInteger) + ',' +
        SqlValue(sdqContratos.FieldByName('periodo').asstring)   + ')' +
    '  AND idj.dj_contrato = ' + SqlInteger(sdqContratos.FieldByName('contrato').AsInteger) +
    '  AND idj.dj_periodo = ' + SqlValue(sdqContratos.FieldByName('periodo').asstring) +
    '  AND (idt.dt_cuil = ctj.tj_cuil)         ';

  if fraTrabajadores.isselected then
    SQL := SQL + '  AND (idt.dt_cuil = ' + SqlValue(sdqContratos.FieldByName('cuil').AsString) + ') ';

  result := SQL;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.MostrarFormato(AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not tbVista.Down then
    MostrarFormatoContrato(AFont, BackGround,Highlight)
  else
    MostrarFormatoTrabajadores(AFont, BackGround,Highlight);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.MostrarFormatoContrato(AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqRecepciones.active or not sdqContratos.active or (sdqRecepciones.Recordcount = 0) then exit;

  //Activa---
  if sdqRecepciones.FieldByName('id').AsInteger =
     sdqRecepciones.FieldByName('idddjj_activa').asInteger then
  begin
    if Highlight Then
      Background := clTeal
    else
      Background := $00E1FFFF;
  end;

  //Con autorizacion
  if (not sdqRecepciones.FieldByName('sa_id').IsNull) and
     (   sdqRecepciones.FieldByName('sa_tipocumplimiento').IsNull or
        (sdqRecepciones.FieldByName('sa_tipocumplimiento').AsString = 'U') or
        (sdqRecepciones.FieldByName('sa_tipocumplimiento').AsString = 'O')
     ) then
  begin
    //En analisis manual
    if (sdqRecepciones.FieldByName('ta_tipoanalisis').AsString = 'M') then
    begin
      if Highlight Then
        AFont.Color  := $00AAFF55 
      else
        AFont.Color  := $00408000;
    end
    else begin
      AFont.Color := clNavy;
      if Highlight Then Background := clTeal;
    end;
  end;

  //Rechazada --
  if sdqRecepciones.FieldByName('Rechazada').asstring <> 'No' then
    AFont.Color := clRed;

end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.MostrarFormatoTrabajadores(AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPresentacionesTrabajador.active or
     not sdqContratos.active or
        (sdqPresentacionesTrabajador.RecordCount = 0) then exit;

  if sdqPresentacionesTrabajador.FieldByName('id').AsInteger =
     sdqContratos.FieldByName('rp_idddjj').asInteger then
  begin
    if Highlight Then
      Background := clTeal
    else
      Background := $00E1FFFF;
  end;

  if (sdqPresentacionesTrabajador.FieldByName('Rechazada').asstring = 'Sí') or
     (sdqPresentacionesTrabajador.FieldByName('Devengable').asstring = 'No')  then
       AFont.Color := clRed;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbRecalcularObsClick(Sender: TObject);
var
  idddjjpotencial: integer;
begin
  if not sdqContratos.Active or sdqContratos.IsEmpty then
    raise Exception.Create( 'Debe elegir un registro.' );

  IniciarEspera;
  try
    if not tbVista.Down and (sdqRecepciones.RecordCount > 0) then
    begin
      do_initdebug(0);
      BeginTrans(true);
      idddjjpotencial := Get_IdDeclaracionPotencial(sdqRecepciones.FieldByName('contrato').AsInteger,
                                                   sdqRecepciones.FieldByName('Período').AsString);
      do_inicializarobservaciones(idddjjpotencial, 'D');
      do_verificardeclaracion(idddjjpotencial);
      CommitTrans(true);
      Refrescar;
    end;
  finally
    DetenerEspera;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbSolicitudesAutoPeriodoClick(Sender: TObject);
begin

  if not sdqContratos.Active or sdqContratos.IsEmpty then
    raise Exception.Create( 'Debe elegir un registro.' );

    //  if sdqContratos.FieldByName('rp_estado').asstring = ESTADO_PERIODO_PENDIENTE then
//  begin
    with TFrmSolicitudAutorizacion.create(self) do
    begin
      frmAdministracionNominas := Self;
      MostrarAutorizaciones(sdqContratos.FieldByName('contrato').AsInteger,
                            sdqContratos.FieldByName('periodo').AsString);
    end;
    //No lo muestra como Modal por lo que no se puede Refrescar;
//  end else
//  MessageDlg('Debe seleccionar un período marcado como "pendiente de aprobación" ' +#13+#10+
//             'para acceder al modo de aprobación.', mtConfirmation, [mbOK], 0);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.dbgContratoPeriodoDblClick(Sender: TObject);
begin
  MostrarEstadoCuenta;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbDetalleProcesoClick(Sender: TObject);
begin
(*
  with TFrmConsultaLogs.Create(self) do
  begin
    visible := false;
    FormStyle := fsNormal;
    Showmodal;
  end;
*)
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.btnEliminarManualDeclaracionClick(Sender: TObject);
var
  ok: boolean;
  observ: String;
  idObs: integer;
begin
  if not sdqContratos.Active or sdqContratos.IsEmpty then
    raise Exception.Create( 'Debe elegir un registro.' );

  if not tbVista.Down  then
  begin
    if sdqContratos.Active and (sdqContratos.FieldByName('rp_estado').AsString = ESTADO_PERIODO_PENDIENTE) then
    begin
      MsgBox('No se puede rechazar ddjj de periodos marcados como pendiente de aprobación. ',
                    MB_ICONINFORMATION or MB_OK, 'Recálculo de Períodos');
      exit;
    end;

     // si está rechazada = no.
    if sdqRecepciones.FieldByName('Rechazada').AsString = 'No' then
    begin
      if (MessageDlg('¿Confirma la invalidación manual de la presentación?',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        with TfrmObservacion.Create(self) do
        try
          TablaObservacion := 'EMI.IMA_MOTIVOACEPRECH';
          FieldId := 'MA_ID';
          FieldCodigo := 'MA_ID';
          FieldDescripcion := 'MA_DESCRIPCION';
          FieldFechaBaja := 'MA_FECHABAJA';
          ExtraCondition := ' AND MA_TIPO = ''R''';
          ShowBajas := true;
          ok := (ShowModal = mrOk);
          observ   := Observacion;
          idObs    := IdObservacion;
        finally
          free;
        end;

        if ok then
        begin
          IniciarEspera;
          BeginTrans(true);
          try
           try
              EjecutarSqlST(' insert into emi.ida_ddjjaceptacionrech ' +
                          ' values(emi.seq_idc_id.nextval, ' + SqlValue(sdqRecepciones.FieldByName('Id').AsInteger) + ', ' +
                            SqlValue(IdObs)  +  ', sysdate, ' + SqlValue(Sesion.LoginName) + ', ' +
                            SqlValue(Observ) +' )' );
              do_invalidarpresentacion(sdqRecepciones.FieldByName('Id').AsInteger);

              DoEnviarMailAceptacionRechazo('R', sdqRecepciones.FieldByName('contrato').AsInteger,
                                            sdqRecepciones.FieldByName('período').AsString,
                                            sdqRecepciones.FieldByName('Id').AsInteger,
                                            IdObs, Observ);

              CommitTrans(true);
              Refrescar;
            finally
              DetenerEspera;
            end;
          except
            on E : Exception do
            begin
              Rollback(true);
              MsgBox('Error al invalidar la nómina. ' + E.Message, MB_ICONERROR)
            end;
          end;
        end;
      end;
    end else
      if sdqRecepciones.FieldByName('Rechazada').AsString <> '' then
         MsgBox('No se puede invalidar una Presentación Rechazada.',
                 MB_ICONWARNING or MB_OK, 'Invalidar Presentación')
      else
         MsgBox('Debe seleccionar un declaración para invalidar', MB_ICONASTERISK or MB_OK, 'Invalidación de Presentación' );
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbRestablecerClick(Sender: TObject);
var
  ok: boolean;
  observ: String;
  idObs: integer;
  idddjjrestab: integer;
  empleados: integer;
  masasalarial, devsim, devactual: real;
  periodopresentacion: string;
begin
  if not sdqContratos.Active or sdqContratos.IsEmpty then
    raise Exception.Create( 'Debe elegir un registro.' );

  if not tbVista.Down  then
  begin
     // si está rechazada = no.
    if (sdqRecepciones.FieldByName('Rechazada').AsString = 'Rechazo Manual') or
       (sdqRecepciones.FieldByName('Rechazada').AsString = 'Rechazo') then
    begin
      idddjjrestab:= get_iddeclaracionrestabsim(sdqRecepciones.FieldByName('contrato').AsInteger,
                                                sdqRecepciones.FieldByName('período').AsString,
                                                sdqRecepciones.FieldByName('Id').AsInteger);
      devactual := 0;
      devsim    := 0;
      if (idddjjrestab <> 0) then
      begin
        get_empleadosymasa(idddjjrestab, empleados, masasalarial, periodopresentacion);
        devactual := SumarCodigosReversionCuota(sdqRecepciones.FieldByName('contrato').AsInteger, sdqRecepciones.FieldByName('período').AsString);
        devsim := get_devengadoprevistosim(sdqRecepciones.FieldByName('contrato').AsInteger, sdqRecepciones.FieldByName('período').AsString, empleados, masasalarial);
      end;

      if (MessageDlg('¿Confirma el restablecimiento manual de la presentación? ' +
                      iif(idddjjrestab <> 0, #13#10 + #13#10 + 'Dev. Actual: ' + FormatFloat('$ #,##0.00', devactual) +
                                             #13#10 + 'Dev. a Generar: ' + FormatFloat('$ #,##0.00', devsim), ''),
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        with TfrmObservacion.Create(self) do
        try
          TablaObservacion := 'EMI.IMA_MOTIVOACEPRECH';
          FieldId := 'MA_ID';
          FieldCodigo := 'MA_ID';
          FieldDescripcion := 'MA_DESCRIPCION';
          FieldFechaBaja := 'MA_FECHABAJA';
          ExtraCondition := ' AND MA_TIPO = ''A''';
          ShowBajas := true;
          ok := (ShowModal = mrOk);
          observ   := Observacion;
          idObs    := IdObservacion;
        finally
          free;
        end;

        if ok then
        begin
          IniciarEspera;
          BeginTrans(true);
          try
           try
              EjecutarSqlST(' insert into emi.ida_ddjjaceptacionrech ' +
                          ' values(emi.seq_idc_id.nextval, ' + SqlValue(sdqRecepciones.FieldByName('Id').AsInteger) + ', ' +
                            SqlValue(IdObs)  +  ', sysdate, ' + SqlValue(Sesion.LoginName) + ', ' +
                            SqlValue(Observ) +' )' );
              do_revalidarpresentacion(sdqRecepciones.FieldByName('Id').AsInteger);

              DoEnviarMailAceptacionRechazo('A', sdqRecepciones.FieldByName('contrato').AsInteger,
                                            sdqRecepciones.FieldByName('período').AsString,
                                            sdqRecepciones.FieldByName('Id').AsInteger,
                                            IdObs, Observ);

              CommitTrans(true);
              Refrescar;
            finally
              DetenerEspera;
            end;
          except
            on E : Exception do
            begin
              Rollback(true);
              MsgBox('Error al reestablecer la nómina. ' + E.Message, MB_ICONERROR)
            end;
          end;
        end;
      end;
    end else
      if sdqRecepciones.FieldByName('Rechazada').AsString = 'No' then
         MsgBox('Solo una presentación rechazada pueden ser restablecidas.',
                 MB_ICONWARNING or MB_OK, 'Revalidar Presentación')
      else
         MsgBox('Debe seleccionar un declaración para revalidar', MB_ICONASTERISK or MB_OK, 'Revalidar de Presentación' );
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.dbgContratoPeriodoPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) Then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]));

(*
var
  Pos : integer;
begin
  AlignFooter := afRight;
  Pos := ArrayPos( Column, CAMPOS_RESUMEN);
  if (Pos > -1) and (Pos <= MAXCOLS_RESUMEN) Then
     Value := ToStr(Totales[Pos]);
*)
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.EmpresaOnchange(Sender: TObject);
var
  iContrato: Integer;
  sCuit: String;
begin
  if fraEmpresaPresentacion.IsSelected then
  begin
    iContrato := fraEmpresaPresentacion.Contrato;
    sCuit     := fraEmpresaPresentacion.CUIT;

    if fraEmpresaPresentacion.IsBaja then
      MostrarInfoBaja(iContrato)
    else
      MostrarInfoReafiliada(iContrato);

    fraInfoEmpresa.CargarContrato(iContrato, sCuit);
    DoMostrarNotas(iContrato);
    DoCargarDatosContrato(iContrato);
    DoMostrarBlockNotas(sCuit);
    DoMostrarDDJJSinPresentar(iContrato);
    try
      lblPrevReferenteData.Caption := ValorSqlEx('SELECT nvl(art.hys.get_nombre_preventor_ref(:cuit, sysdate), ''-'') FROM dual', [fraEmpresaPresentacion.CUIT], '');
    except
      on E: Exception do ErrorMsg(E, 'Error cargar al preventor.');
    end;
    do_informar_notas_no_aplicadas(iContrato);

    do_informar_gestiones_pendientes(iContrato);


    sdqRecepciones.Close;

    Refrescar;
  end
  else
    Limpiar;
end;
{-------------------------------------------------------------------------------}
function TfrmAdministracionNominas.GetConsultaRecepciones: String;
begin
  result := ' SELECT   idj.dj_id "Id", idj.dj_contrato contrato,idj.dj_periodo "Período", ' +
            '          idj.dj_empleados "Empleados", ' +
            '          idj.dj_empleadosdeclarados "Empleados Decl.", ' +
            '          idj.dj_empleadosdeclaradosnoactivo "Empleados Decl.NA", ' +
            '          idj.dj_masasalarial "Masa Salarial", ' +
            '          idj.dj_masadeclarada "Masa Declarada", ' +
            '          DECODE (idj.dj_suss, ' +
            '                  ''1'', ''Suss'', ' +
            '                  ''2'', ''No Suss'', ' +
            '                  ''3'', ''Mixta'' ' +
            '                 ) "SUSS", ' +
            '          idj.dj_fechapresentacion "Fecha Presentación", ' +
            '          DECODE (idj.dj_codigorectificativa, ' +
            '                 ''0'', ''Original'', ' +
            '                 ''1'', ''1ª Rectificativa'', ' +
            '                 ''2'', ''2ª Rectificativa'', ' +
            '                 ''3'', ''3ª Rectificativa'', ' +
            '                 ''4'', ''4ª Rectificativa'', ' +
            '                 ''5'', ''5ª Rectificativa'', ' +
            '                 ''6'', ''6ª Rectificativa'', ' +
            '                 ''7'', ''7ª Rectificativa'', ' +
            '                 ''8'', ''8ª Rectificativa'', ' +
            '                 ''9'', ''9ª Rectificativa'', ' +
            '                 ''Rectificativa'' ' +
            '                 ) "Rectificativa", ' +
            '          ion.on_descripcion "Origen", idj.dj_codigorectificativa "Cod.Rect.", ' +
            '          idj.dj_codigorectificativaoriginal "Cod.Rect. Orig", ht_porcmasa "%", ' +
            '          ht_sumafija "Fija", (SELECT MAX (de_fechacalculo) ' +
            '                                 FROM emi.ide_devengado ' +
            '                                WHERE de_idddjj = dj_id) "F.Emisión", ' +

{
            '          (SELECT MAX (ld_id) ' +
            '             FROM emi.ild_loteddjj ' +
            '            WHERE ld_idddjj = dj_id) "Gestión", ' +
            '          DECODE ((SELECT COUNT (*) ' +
            '                     FROM emi.ild_loteddjj ' +
            '                    WHERE ld_idddjj = dj_id AND ld_fechafinalgestion IS NULL), ' +
            '                  0, '''', ' +
            '                  ''pendiente'' ' +
            '                 ) "Estado", ' +

}
            '          (SELECT COUNT (*) ' +
            '             FROM emi.ido_ddjjobservacion ido ' +
            '            WHERE ido.do_idddjj = dj_id ' +
            '              AND do_fechafinobservacion IS NULL) "Observaciones", ' +
            '          dj_estado, ' +
            '          DECODE (emi.utiles.get_tipoestadoverificado (dj_id), ' +
            '                  ''R'', ''Rechazo'', ' +
            '                  ''M'', ''Rechazo Manual'', ' +
            '                  ''A'', ''No'', ' +
            '                  ''P'', ''No'', ' +
            '                  ''I'', ''No'' ' +
            '                 ) "Rechazada", ' +
            '          (SELECT ev_descripcion ' +
            '             FROM emi.iev_estadoverificado ' +
            '            WHERE dj_estado = ev_id) estado_verificado, ' +
            '          DECODE (dj_modocarga, ''A'', ''Automático'', ''Manual'') "Modo Carga", ' +
            '          emi.nominas.get_inforecepcion (dj_id) adicional, ' +
            '          (select rp_idddjj from emi.irp_resumenperiodo ' +
            '           where rp_contrato = dj_contrato and ' +
            '                 rp_periodo = dj_periodo) idddjj_activa, ' +
            '          sa_id, ' +
            '          sa_tipocumplimiento, ' +
            '          ta_tipoanalisis, ' +
            '          dj_secuenciaobligacion, ' +
            '          decode(dj_topeoaplicado, 0, ''Sin Topeo'', 1, ''Mínimo'', 2, ''Máximo'', 3, ''Máximo y Mínimo'')  topeoaplicado, ' +
            '          tf_descripcion ' +
(*
            '          (select sa_tipocumplimiento ' +
            '           from emi.isa_solicitudautorizacion ' +
            '           where sa_id = dj_idsolicitudautorizacion) sa_tipocumplimiento' +
*)
(*
            Puede servir para los estados, habria que resolver el tema del estado verificado

            '          (select de_idddjj from emi.irp_resumenperiodo, emi.ide_devengado ' +
            '           where rp_contrato = dj_contrato and ' +
            '                 rp_periodo = dj_periodo and ' +
            '                 rp_iddevengado = de_id) idddjj_activa ' +
*)
            '     FROM emi.idj_ddjj idj, ' +
            '          emi.ion_origennomina ion, ' +
            '          afi.aht_historicotarifario aht, ' +
            '          emi.isa_solicitudautorizacion isa, ' +
            '          emi.ita_tipoautorizacion ita, ' +
            '          emi.itf_tipoformulario itf ' +
            '    WHERE idj.dj_idorigennomina = ion.on_id(+) ' +
            '      AND aht.ht_id = art.afiliacion.get_idmaxendosovig (:contrato, :periodo) ' +
            '      AND idj.dj_idformulario = itf.tf_id(+) ' +
            '      AND idj.dj_idsolicitudautorizacion = isa.sa_id (+) ' +
            '      AND isa.sa_idtipoautorizacion = ita.ta_id(+) ' +
            '      AND isa.sa_fechacumplimiento(+) is null ' +
            '      AND idj.dj_contrato = :contrato ' +
            '      AND idj.dj_periodo = :periodo ';

  if tbSoloPresentacionesActivas.down then
    result := result + ' AND idj.dj_estado <= 2 ';

  result := result + ' ORDER BY idj.dj_cuit, dj_periodo, dj_codigorectificativa desc';

end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.DoDescomprimirZip(Archivo: String; var aArchivoAProcesar, aArchivoAProcesar2: String);
var
  sUbicArchivo: string;
begin
  sUbicArchivo := TempPath;
  aArchivoAProcesar := '';
  aArchivoAProcesar2 := '';
  with TZipMaster.Create(Self) do
  try
    ZipFileName  := Archivo;
    FSpecArgs.Clear;
    ExtrBaseDir  := sUbicArchivo;
    TempDir      := sUbicArchivo;
    ExtrOptions  := [ExtrOverWrite];

    Extract;

    if SuccessCnt = 1 then
      aArchivoAProcesar := sUbicArchivo + {$IFDEF VER150}ZipDirEntry(ZipContents[0]^){$ELSE}DirEntry[0]{$ENDIF}.Filename
    else
      if SuccessCnt = 2 then
      begin
        aArchivoAProcesar := sUbicArchivo + {$IFDEF VER150}ZipDirEntry(ZipContents[0]^){$ELSE}DirEntry[0]{$ENDIF}.Filename;
        aArchivoAProcesar2 := sUbicArchivo + {$IFDEF VER150}ZipDirEntry(ZipContents[1]^){$ELSE}DirEntry[1]{$ENDIF}.Filename;
      end;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.DoMostrarNotas(Contrato: Integer);
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM EMI.INO_NOTA ' +
           'WHERE NO_CONTRATO=:Contrato ' +
             'AND NO_FECHABAJA IS NULL';

  if ExisteSqlEx(sSql, [Contrato]) then
    CargarLabel(lblNotas, TituloVer, TituloVer, '')
  else
    DoLimpiarLabel(lblNotas);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.CargarLabel(Lbl: TLabel; Texto: string; Reemplazo: string; Default: string = '');
begin
  if (Texto <> Default) then
  begin
    Lbl.Caption    := Texto;
    Lbl.Font.Color := clBlue;
    Lbl.Font.Style := [fsUnderline];
    Lbl.Cursor     := crHandPoint;
  end
  else
  begin
    Lbl.Caption    := Reemplazo;
    Lbl.Font.Color := clBlack;
    Lbl.Font.Style := [];
    Lbl.Cursor     := crArrow;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.DoLimpiarLabel(lbl: TLabel);
begin
  CargarLabel(lbl, '', TituloSinDatos);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.lblNotasClick(Sender: TObject);
begin
  if lblNotas.Caption = TituloVer then
    with TfrmConsultaNotas.Create(self) do
      try
        FormStyle   := fsNormal;
        WindowState := wsNormal;
        Hide;
        FiltrarNotas(fraEmpresaPresentacion.Contrato, '');
        ShowModal;
        Refrescar;
      finally
        free;
      end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.DoCargarDatosContrato(Contrato: Integer);
var
  sSql: String;
  SqlResults: TStringList;
begin
  sSql := 'SELECT AC_CODIGO || ''  '' || AC_DESCRIPCION ACTIVIDAD, ' +
                 'CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
                 'MOTALTA.TB_DESCRIPCION DESCRMOTALTA, AR_NOMBRE ARTANTERIOR, ' +
                 'TO_CHAR(CO_FECHABAJA, ''DD/MM/YYYY'') || ''  '' || BAJ.TB_DESCRIPCION MOTIVOBAJA, ' +
                 'AFEST.TB_CODIGO || ''  '' || AFEST.TB_DESCRIPCION ESTADO, ' +
                 'SECT.TB_DESCRIPCION DESCRSECTOR, SUSS.TB_DESCRIPCION DESCRSUSS, CO_FECHAINSCRIPCION INSCRIPCION ' +
            'FROM CAC_ACTIVIDAD, CTB_TABLAS MOTALTA, CTB_TABLAS SECT, CTB_TABLAS SUSS, ' +
                 'CTB_TABLAS BAJ, CTB_TABLAS AFEST, AAR_ART, AEM_EMPRESA, ACO_CONTRATO ' +
          'WHERE EM_ID = CO_IDEMPRESA ' +
            'AND CO_IDACTIVIDAD = AC_ID ' +
            'AND BAJ.TB_CLAVE(+) = ''MOTIB'' ' +
            'AND BAJ.TB_CODIGO(+) = CO_MOTIVOBAJA ' +
            'AND AFEST.TB_CLAVE  = ''AFEST'' ' +
            'AND AFEST.TB_CODIGO = CO_ESTADO ' +
            'AND SUSS.TB_CLAVE = ''SUSS'' ' +
            'AND SUSS.TB_CODIGO = EM_SUSS ' +
            'AND MOTALTA.TB_CLAVE(+) = ''MOTIA'' ' +
            'AND MOTALTA.TB_CODIGO(+) = CO_MOTIVOALTA ' +
            'AND SECT.TB_CLAVE = ''SECT'' ' +
            'AND SECT.TB_CODIGO= EM_SECTOR ' +
            'AND AR_ID(+) = CO_IDARTANTERIOR ' +
            'AND CO_CONTRATO = ' + SqlValue(Contrato);

    SqlResults := ValoresColSql(sSql);
    try
      edActividad.Text   := SqlResults[0];
      edVigDesde.Text    := SqlResults[1];
      edVigHasta.Text    := SqlResults[2];
      edMotivoAlta.Text  := SqlResults[3];
      edARTAnterior.Text := SqlResults[4];
      edBaja.Text        := SqlResults[5];
      edEstado.Text      := SqlResults[6];
      edSector.Text      := SqlResults[7];
      edSuss.Text        := SqlResults[8];
      edFechaInscripcion.Text := SqlResults[9];
    finally
      SqlResults.Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.sdqContratosAfterOpen(DataSet: TDataSet);
begin
  if not tbVista.Down then
    begin
      if sdqContratos.FieldByName( 'DEVENGADOCUOTA' ) is TFloatField then
        TFloatField( sdqContratos.FieldByName( 'DEVENGADOCUOTA' ) ).Currency := True;

      if sdqContratos.FieldByName( 'DEVENGADOFONDO' ) is TFloatField then
        TFloatField( sdqContratos.FieldByName( 'DEVENGADOFONDO' ) ).Currency := True;

      if sdqContratos.FieldByName( 'DEVENGADOINTERES' ) is TFloatField then
        TFloatField( sdqContratos.FieldByName( 'DEVENGADOINTERES' ) ).Currency := True;

      if sdqContratos.FieldByName( 'DEVENGADOOTROS' ) is TFloatField then
        TFloatField( sdqContratos.FieldByName( 'DEVENGADOOTROS' ) ).Currency := True;

      if sdqContratos.FieldByName( 'PAGOCUOTA' ) is TFloatField then
        TFloatField( sdqContratos.FieldByName( 'PAGOCUOTA' ) ).Currency := True;

      if sdqContratos.FieldByName( 'PAGOFONDO' ) is TFloatField then
        TFloatField( sdqContratos.FieldByName( 'PAGOFONDO' ) ).Currency := True;

      if sdqContratos.FieldByName( 'PAGOINTERES' ) is TFloatField then
        TFloatField( sdqContratos.FieldByName( 'PAGOINTERES' ) ).Currency := True;

      if sdqContratos.FieldByName( 'PAGOOTROS' ) is TFloatField then
        TFloatField( sdqContratos.FieldByName( 'PAGOOTROS' ) ).Currency := True;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.DoMostrarSiniestros(Contrato: Integer; Periodo: String);
var
  iCantSiniestros: Integer;
begin
//  por ahora, queda deshabilitado, porque tarda demasiado
//  iCantSiniestros := Get_CantSiniestrosPeriodo(Contrato, Periodo);
iCantSiniestros := 0;

  if iCantSiniestros > 0 then
    CargarLabel(lblSiniestros, IntToStr(iCantSiniestros), TituloVer, '')
  else
    DoLimpiarLabel(lblSiniestros);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.lblSiniestrosClick(Sender: TObject);
var
  iContrato: Integer;
  sPeriodo: String;
begin
  if lblSiniestros.Caption <> TituloSinDatos then
    with TfrmSiniestros.Create(nil) do
      try
        iContrato := sdqContratos.fieldbyname('contrato').AsInteger;
        sPeriodo  := sdqContratos.fieldbyname('periodo').AsString;

        Contrato  := iContrato;
        Periodo   := sPeriodo;
        FormStyle := fsNormal;
        Visible   := False;
        tbRefrescarClick(nil);
        ShowModal;
      finally
        Free;
      end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbMostrarOcultarColumnasClick(Sender: TObject);
begin
  FieldHider.Execute;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.DoMostrarBlockNotas(CUIT: String);
begin
  edBlockNotas.Lines.Text := GetUltimoBlockNota(CUIT);
  if edBlockNotas.Text <> '' then
    edBlockNotas.Font.Color := clRed
  else
    edBlockNotas.Font.Color := clBlack;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.lblBlockNotasClick(Sender: TObject);
begin
  Verificar(fraEmpresaPresentacion.IsEmpty, nil, 'Debe elegir una empresa.');

  if Trim(edBlockNotas.Lines.Text) <> '' then
    Do_CargarBlockNotas(fraEmpresaPresentacion.Contrato);
  DoMostrarBlockNotas(CUIT);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbCuadroComparativoClick(Sender: TObject);
begin
  if not sdqContratos.Active or sdqContratos.IsEmpty then
    raise Exception.Create( 'Debe elegir un registro.' );

  CargarCuadroComparativo(sdqContratos.fieldbyname('contrato').AsInteger, sdqContratos.fieldbyname('periodo').AsString);
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.fraGrupoParaDevengadoChange(Sender: TObject);
begin
  if fraGrupoParaDevengado.IsSelected then
    ppPeriodoDevengadoMensual.Periodo.Valor := get_periodoproximo(get_ultimodevengadogrupo(fraGrupoParaDevengado.Value, 'D'));
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.DoMostrarDDJJSinPresentar(Contrato: Integer);
var
  Resultado: String;
begin
  if (edSuss.Text = 'No SUSS') then
  begin
    Resultado :=  ValorSql('SELECT ''Si''' +
                           'FROM zrc_resumencobranza  ' +
                           'WHERE rc_periodo <> nvl(rc_periodonomina, '' '')' +
                           'AND rc_contrato = ' + SqlValue(Contrato) +
                           'AND rc_periodo < art.cobranza.get_ultperiododevengado(''D'', art.actualdate) ' +
                           'AND ROWNUM = 1 ', 'No');
    CargarLabel(lblDDJJSinPresentar, Resultado, Resultado, 'No');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.lblDDJJSinPresentarClick(Sender: TObject);
begin
  Verificar(true, nil, 'Informe en construcción solicitado por el Sector Emisión.');

  Verificar(fraEmpresaPresentacion.IsEmpty, nil, 'Debe seleccionar una empresa.');
  qrDDJJSinPresentar := TqrDDJJSinPresentar.Create(Self);
  with qrDDJJSinPresentar do
  try
    OpenQueryEx(sdqDatos, [fraEmpresaPresentacion.Contrato]);
    OpenQueryEx(sdqDetalle, [fraEmpresaPresentacion.Contrato]);
    Visualizar(qrDDJJSinPresentar,
               GetValores(' - Contrato ' + IntToStr(fraEmpresaPresentacion.Contrato),
                          fraEmpresaPresentacion.CorreoElectronico,
                          fraEmpresaPresentacion.Contrato,
                          0,
                          qrlTitulo.Caption + CRLF + CRLF + qrlInstrucciones.Lines.Text),
               [TOpcionVisualizador(oAlwaysShowDialog), TOpcionVisualizador(oAutoFirma), TOpcionVisualizador(oForceDB), TOpcionVisualizador(oForceShowModal)]);
  finally
    qrDDJJSinPresentar.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbAsesorEmisionClick(Sender: TObject);
begin
  Verificar(fraEmpresaPresentacion.IsEmpty, nil, 'Debe elegir una empresa.');

  with TfrmAsesorEmision.Create(Self) do
    try
      DoCargarDatos(fraEmpresaPresentacion.Contrato);
      ShowModal;
    finally
      Free;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmAdministracionNominas.tbRegenerarCabeceraClick(Sender: TObject);
begin
  if not sdqContratos.Active or sdqContratos.IsEmpty then
    raise Exception.Create( 'Debe elegir un registro.' );
  if (fpReprocesarDDJJ.ShowModal = mrOk) then
  begin
    IniciarEspera;
    BeginTrans;
    try
      do_regenerardeclaracion(sdqRecepciones.FieldByName('Id').AsInteger, fraObservacionRegenerarDDJJ.Value, 'M', true,
                              (sdqRecepciones.FieldByName('dj_estado').AsInteger = 1) or (sdqRecepciones.FieldByName('dj_estado').AsInteger = 2));
      CommitTrans;
      Refrescar;
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Error al regenerar cabecera.');
      end;
    end;
    DetenerEspera;
  end;
end;

procedure TfrmAdministracionNominas.btnAceptarReprocesoClick(Sender: TObject);
begin
  Verificar(not fraObservacionRegenerarDDJJ.IsSelected, fraObservacionRegenerarDDJJ, 'Debe seleccionar una observación.');
  fpReprocesarDDJJ.ModalResult := mrOk;
end;

procedure TfrmAdministracionNominas.fpReprocesarDDJJShow(Sender: TObject);
begin
  fraObservacionRegenerarDDJJ.Clear;
end;

procedure TfrmAdministracionNominas.fpMotivoGestionEnter(Sender: TObject);
begin
  fraMotivoGestion.Clear;
end;

procedure TfrmAdministracionNominas.tbMotivoGestionClick(Sender: TObject);
begin
  Verificar(not sdqContratos.Active or sdqContratos.IsEmpty, tbMotivoGestion, 'Debe elegir un registro.');

  fpMotivoGestion.ShowModal;
end;

procedure TfrmAdministracionNominas.btnAceptarMotivoGestionClick(Sender: TObject);
var
  sPeriodo, sSql: String;
  iContrato: Integer;
begin
  Verificar(fraMotivoGestion.IsEmpty, fraMotivoGestion, 'Debe indicar un motivo de gestión.');

  Begintrans;
  try
    iContrato := sdqContratos.FieldByName('Contrato').AsInteger;
    sPeriodo  := sdqContratos.FieldByName('Periodo').AsString;

     sSql := 'UPDATE ZRC_RESUMENCOBRANZA ' +
                'SET RC_GESTIONABLE = :Gestionable, ' +
                     iif(fraMotivoGestion.Especial2 = 'N', ' RC_GESTIONABLEAMPLIADO = NULL, ', '') +
                    'RC_MOTIVOGESTION = :MotivoGestion ' +
              'WHERE RC_CONTRATO = :Contrato ' +
                'AND RC_PERIODO = :Periodo';
     EjecutarSqlSTEx(sSql, [fraMotivoGestion.Especial2, fraMotivoGestion.Codigo, iContrato , sPeriodo]);

     DoInsertarRegAuditLog('MOTIVO DE GESTION DE NOMINAS', 'MODIFICACION', '<' + IntToStr(iContrato) + '><' + sPeriodo + '>', False, 'EMISION');
     CommitTrans;

     fpMotivoGestion.Close;
     sdqContratos.Refresh;
  except
    on E: Exception do
      begin
        Rollback;
        raise Exception.Create(E.Message + CRLF + 'Error al modificar el motivo de gestión');
      end;
  end;
end;

procedure TfrmAdministracionNominas.fraInfoEmpresalblAdic_1Click(
  Sender: TObject);
begin
  fraInfoEmpresa.ManEjecutivo(Sender);

end;

procedure TfrmAdministracionNominas.lblVerContactosClick(Sender: TObject);
begin
  if fraEmpresaPresentacion.IsSelected then
  begin
    with TfrmContratoContactoEmi.Create(self) do
    try
      DoCargarDatos(fraEmpresaPresentacion.Contrato, fraEmpresaPresentacion.Value);
      ShowModal;
    finally
      free;
    end;
  end;
end;

procedure TfrmAdministracionNominas.TbSitFacturacionClick(Sender: TObject);
var
  IdMinutaReunion: integer;
begin
  if fraEmpresaPresentacion.IsSelected then
  begin
    if (fpOpcionSitFac.ShowModal = mrOk) then
    begin
      if (rgOpciones.ItemIndex = SALIDA_PANTALLA) or (fpSolicitanteSitFac.ShowModal = mrOk) then
      begin
        IdMinutaReunion := 0;
        if (rgOpciones.ItemIndex = SALIDA_IMPRESORA) and MsgAsk('¿Desea generar la minuta de reunión junto a la situación de facturación?') then
          IdMinutaReunion := GenerarMinuta(fraEmpresaPresentacion.Contrato);
        GenerarSituacionFacturacion(fraEmpresaPresentacion.Contrato, fraEmpresaPresentacion.ID, fraEmpresaPresentacion.CUIT, fraSolicitanteSitFac.Value, IdMinutaReunion, rgOpciones.ItemIndex);
        if (rgOpciones.ItemIndex = SALIDA_PANTALLA) then
        begin
          sdqDetSitFac.Close;
          sdqItemsSitFac.Close;
          sdqItemsSitFac.ParamByName('contrato').AsInteger := fraEmpresaPresentacion.Contrato;
          sdqItemsSitFac.Open;
          fpSitFacturacion.ShowModal;
        end;
      end;
    end;
  end;
end;

procedure TfrmAdministracionNominas.do_informar_gestiones_pendientes(
  aContrato: integer);
var
  sSql: String;
begin
  sSql  := ' SELECT DISTINCT 1 ' +
           ' FROM emi.ige_gestionable, emi.idg_detallesubloteengestion, emi.ids_detallesublote, ' +
           '      art.use_usuarios, emi.isl_sublote sublote, emi.ilo_lote ' +
           ' WHERE sublote.sl_idlote = lo_id ' +
           '   AND se_id = sl_idusuariogestion ' +
           '   AND ds_idsublote = sublote.sl_id ' +
           '   AND dg_iddetallesublote = ds_id ' +
           '   AND ge_id = dg_idgestionable ' +
           '   AND sublote.sl_fechabaja is null ' +
           '   AND ds_fechabaja is null ' +
           '   AND dg_fechabaja is null ' +
           '   AND lo_idestado = ' + SqlValue(LOTE_EN_CURSO) +
           '   AND dg_idestadogestion <> ' + SqlValue(GESTION_FINALIZADA) +
           '   AND ds_contrato = ' + SqlValue(aContrato);
  if (Sesion.Sector = 'EMI') and ExisteSql(sSQL) and MsgAsk('La empresa tiene gestiones pendientes.' + #13#10 + '¿Desea visualizarlas?') then
    with TfrmGestionEnTramite.Create(self) do
    try
      CargarFormulario(aContrato);
      ShowModal;
    finally
      free;
    end;
end;

procedure TfrmAdministracionNominas.fraInfoEmpresalblAdic_10Click(
  Sender: TObject);
begin
  Verificar(not fraEmpresaPresentacion.IsSelected, nil, 'Debe elegir una empresa.');
  with TfrmAgendaVistaEmpresa.Create(nil) do
  try
    Contrato := fraEmpresaPresentacion.Contrato;
    SectorID := Sesion.IdSectorIntranet;
    DoMostrarEventosAgenda;
    ShowModal;
  finally
    free;
  end;
end;

function TfrmAdministracionNominas.GenerarMinuta(aContrato: integer): integer;
begin
  with TfrmMinutaReunion.Create(self) do
  try
    Contrato := aContrato;
    ShowModal;
    result := IdMinutaReunion;
  finally
    free;
  end;
end;

procedure TfrmAdministracionNominas.fpSolicitanteSitFacShow(
  Sender: TObject);
begin
  fraSolicitanteSitFac.Clear;
end;

procedure TfrmAdministracionNominas.btnAceptarSolicitanteSitFacClick(
  Sender: TObject);
begin
  Verificar(not fraSolicitanteSitFac.IsSelected, fraSolicitanteSitFac, 'Debe seleccionar un solicitante.');
  fpSolicitanteSitFac.ModalResult := mrOk;
end;

procedure TfrmAdministracionNominas.fpOpcionSitFacShow(Sender: TObject);
begin
  rgOpciones.ItemIndex := -1;
end;

procedure TfrmAdministracionNominas.btnAceptarOpcionSitFacClick(
  Sender: TObject);
begin
  Verificar(rgOpciones.ItemIndex = -1, fpOpcionSitFac, 'Debe seleccionar una opción.');
  fpOpcionSitFac.ModalResult := mrOk;
end;

procedure TfrmAdministracionNominas.sdqItemsSitFacAfterScroll(
  DataSet: TDataSet);
var
  sSql: String;
begin
  //Notas
  if sdqItemsSitFac.FieldByName('ge_tipodetallegestion').AsString = 'N' then
    sSql := ' SELECT np_periodo "Período", dbms_lob.substr(ng_textoobservacion, 4000) "Gestión" ' +
            '  FROM emi.ing_notagestion, emi.ipo_notaperiodoobservacion, emi.inp_notacontratoperiodo inp, ' +
            '       emi.idg_detallesubloteengestion, emi.ids_detallesublote ' +
            ' WHERE ds_contrato = :contrato ' +
            '   AND np_iddetallesublotegestion = dg_id ' +
            '   AND po_idnotacontratoperiodo = np_id ' +
            '   AND po_id = ng_idnotaperiodoobs ' +
            '   AND dg_iddetallesublote = ds_id ' +
            '   AND ds_fechabaja IS NULL ' +
            '   AND np_fechabaja IS NULL ' +
            '   AND dg_fechabaja IS NULL ' +
            '   AND np_id = (SELECT MAX(inp2.np_id) ' +
            '                  FROM emi.ing_notagestion ing2, emi.ipo_notaperiodoobservacion ipo2, emi.inp_notacontratoperiodo inp2, ' +
            '                       emi.idg_detallesubloteengestion idg2, emi.ids_detallesublote ids2 ' +
            '                 WHERE ids2.ds_contrato = :contrato ' +
            '                   AND inp2.np_iddetallesublotegestion = idg2.dg_id ' +
            '                   AND ipo2.po_idnotacontratoperiodo = inp2.np_id ' +
            '                   AND ipo2.po_id = ing2.ng_idnotaperiodoobs ' +
            '                   AND idg2.dg_iddetallesublote = ids2.ds_id ' +
            '                   AND ids2.ds_fechabaja IS NULL ' +
            '                   AND inp2.np_fechabaja IS NULL ' +
            '                   AND idg2.dg_fechabaja IS NULL ' +
            '                   AND inp2.np_periodo = inp.np_periodo) ' +
            ' ORDER BY 1 ';

  //DDJJ
  if (sdqItemsSitFac.FieldByName('ge_tipodetallegestion').AsString = 'D') then
    sSql := ' SELECT dj_periodo "Período", dbms_lob.substr(dg_textoobservacion, 4000) "Gestión" ' +
            '  FROM emi.idg_ddjjgestion idg, emi.ido_ddjjobservacion, emi.idj_ddjj idj, emi.idg_detallesubloteengestion det, ' +
            '       emi.ids_detallesublote ' +
            ' WHERE ds_contrato = :contrato ' +
            '   AND dj_iddetallesublotegestion = det.dg_id ' +
            '   AND do_idddjj = dj_id ' +
            '   AND do_id = dg_idddjjobservacion ' +
            '   AND det.dg_iddetallesublote = ds_id ' +
            '   AND det.dg_fechabaja IS NULL ' +
            '   AND ds_fechabaja IS NULL ' +
            '   AND dj_id = (SELECT MAX(dj_id) ' +
            '                  FROM emi.idg_ddjjgestion idg2, emi.ido_ddjjobservacion ido2, emi.idj_ddjj idj2, ' +
            '                       emi.idg_detallesubloteengestion det2, emi.ids_detallesublote ids2 ' +
            '                 WHERE ids2.ds_contrato = :contrato ' +
            '                   AND idj2.dj_iddetallesublotegestion = det2.dg_id ' +
            '                   AND ido2.do_idddjj = idj2.dj_id ' +
            '                   AND ido2.do_id = idg2.dg_idddjjobservacion ' +
            '                   AND det2.dg_iddetallesublote = ids2.ds_id ' +
            '                   AND idj2.dj_periodo = idj.dj_periodo ' +
            '                   AND det2.dg_fechabaja IS NULL ' +
            '                   AND ids2.ds_fechabaja IS NULL) ' +
            ' ORDER BY 1 ';

  if (sdqItemsSitFac.FieldByName('ge_tipodetallegestion').AsString = 'C') then
    sSql := ' SELECT sf_periodo "Período", sf_cuil "Cuil" ' +
            '  FROM emi.isf_situacionfacturacion ' +
            ' WHERE sf_contrato = :contrato ' +
            '   AND sf_idgestionable = ' + SqlValue(sdqItemsSitFac.FieldByName('ge_id').AsInteger) +
            ' ORDER BY 1, 2 ';

  if (sdqItemsSitFac.FieldByName('ge_tipodetallegestion').AsString = 'P') then
    sSql := ' SELECT sf_periodo "Período" ' +
            '  FROM emi.isf_situacionfacturacion ' +
            ' WHERE sf_contrato = :contrato ' +
            '   AND sf_idgestionable = ' + SqlValue(sdqItemsSitFac.FieldByName('ge_id').AsInteger) +
            ' ORDER BY 1 ';

    sdqDetSitFac.Close;
    sdqDetSitFac.SQL.Text := sSql;
//    sdqDetSitFac.Prepare;
    sdqDetSitFac.ParamByName('contrato').AsInteger := fraEmpresaPresentacion.Contrato;
    sdqDetSitFac.Open;
end;

end.




