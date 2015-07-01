{-----------------------------------------------------------------------------
 Nombre Unidad: unFrmSimulacion
 Autor:         Conrado Chiappero
 Fecha:         05-Oct-2005
 Proposito:     Verificar los efectos que tendrán sobre las cuentas la aplicacíon
                de nóminas y el recálculo de períodos.
 Versiones:     0.1 Versión original.
-----------------------------------------------------------------------------}
unit unFrmSimulacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SortDlg, QueryPrint, StdCtrls, PeriodoPicker, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, unfraInfoEmpresa, unArtDbFrame,
  unFraEmpresa, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unfraStaticActividad,
  DB, SDEngine, Placemnt, artSeguridad, ShortCutControl, ComCtrls, ToolWin,
  ExtCtrls, JvExExtCtrls, JvNetscapeSplitter, FormPanel, JvMemoryDataset,
  JvCsvData, Buttons, CurrEdit, JvgGridHeaderControl, JvExStdCtrls,
  JvGroupBox, JvgGroupBox, PatternEdit, IntEdit, QueryToFile, ExportDialog,
  JvComponent, JvgStringContainer, DBClient, Provider,
  unFraCodigoDescripcion, DateTimeEditors, unSesion;

type
  TFrmSimulacion = class(TForm)
    pnlBusqueda: TPanel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbImprimir: TToolButton;
    tbSalir: TToolButton;
    tbNomina: TToolButton;
    pnlDatos: TPanel;
    ShortCutControl: TShortCutControl;
    Seguridad: TSeguridad;
    FormStorage: TFormStorage;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    gbEmpresa: TJvgGroupBox;
    edDC_TELEFONOS: TEdit;
    gbVigencia: TGroupBox;
    lblVigenciaHasta: TLabel;
    lblVigenciaDesde: TLabel;
    cmbFechaVigenciaHasta: TDateComboBox;
    cmbFechaVigenciaDesde: TDateComboBox;
    PrintDialog: TPrintDialog;
    QueryPrint: TQueryPrint;
    ColorDialog: TColorDialog;
    SortDialog: TSortDialog;
    tbAplicarRedevengado: TToolButton;
    gbDatosEmpresa: TGroupBox;
    lblMotivoBaja: TLabel;
    lblDomicilio: TLabel;
    lblCIIU: TLabel;
    lblEstado: TLabel;
    lblFechaBaja: TLabel;
    edtMotivoBaja: TEdit;
    fraActividad: TfraStaticActividad;
    edtDomicilio: TEdit;
    cmbFechaBaja: TDateComboBox;
    edtESTADO: TEdit;
    sdqDevengadoSimulado: TSDQuery;
    gbInformacionEmpresa: TGroupBox;
    fraInfoEmpresa: TfraInfoEmpresa;
    sdqMovimientosAjuste: TSDQuery;
    dsMovimientoAjuste: TDataSource;
    tbAjuste: TToolButton;
    gbSeleccionEmpresa: TGroupBox;
    lblCUIT: TLabel;
    fraContratoASimular: TfraEmpresa;
    tbImportarDeclaracion: TToolButton;
    tbRestringir: TToolButton;
    fpImportacionNomina: TFormPanel;
    bvSerparadorImportacionNomina: TBevel;
    btnAceptarArchivo: TButton;
    btnCancelarArchivo: TButton;
    gbContenidoArchivo: TGroupBox;
    tbFormulasEstados: TToolBar;
    tbNuevaFormulaEstado: TToolButton;
    edtArchivo: TEdit;
    lblArchivo: TLabel;
    bvSeparaImportacionArriba: TBevel;
    dsContenido: TDataSource;
    od: TOpenDialog;
    dbgContenidoArchivo: TDBGrid;
    mdContenido: TJvMemoryData;
    mdContenidoSI_CUIT: TStringField;
    mdContenidoSI_PERIOD: TStringField;
    mdContenidoSI_CONTRATO: TFloatField;
    mdContenidoSI_MASA: TFloatField;
    mdContenidoSI_TRABAJADOR: TIntegerField;
    mdContenidoSI_MASACERO: TIntegerField;
    ToolBarSeleccionContrato: TToolBar;
    tbSeleccionContratos: TToolButton;
    sdqContratosSeleccionablesSimulacion: TSDQuery;
    dsContratosSeleccionablesSimulacion: TDataSource;
    dbgContratosSimulacion: TDBGrid;
    pnSimulacionEmision: TPanel;
    splitter: TJvNetscapeSplitter;
    pnSimulacion: TPanel;
    pgSimulacion: TPageControl;
    tsRecalculo: TTabSheet;
    tsMovimientos: TTabSheet;
    tsFuentesCalculo: TTabSheet;
    sdqPeriodos: TSDQuery;
    dsPeriodos: TDataSource;
    dbgSimulacion: TArtDBGrid;
    gbOpcionesVisualizacion: TGroupBox;
    chkTodosLosContratos: TCheckBox;
    tbRefrescar: TToolButton;
    gbTarifa: TGroupBox;
    lblVigenciaTarifa: TLabel;
    edtFechaVigenciaTarifaVigente: TDateComboBox;
    edtVariableVigente: TCurrencyEdit;
    edtFijaVigente: TCurrencyEdit;
    lblFijo: TLabel;
    lblVariable: TLabel;
    gbNominaOriginal: TGroupBox;
    gbSimulada: TGroupBox;
    lblMasa: TLabel;
    lblTrabajadores: TLabel;
    edtMasa: TCurrencyEdit;
    edtTrabajadores: TIntEdit;
    lblMasaCero: TLabel;
    edtMasaCero: TIntEdit;
    lblOrigenRecalculo: TLabel;
    lblMasaRecalculo: TLabel;
    edtMasaRecalculo: TCurrencyEdit;
    edtOrigenRecalculo: TEdit;
    edtFormularioRecalculo: TEdit;
    lblFormularioRecalculo: TLabel;
    edtTrabajadoresRecalculo: TIntEdit;
    lblTrabajadoresRecalculo: TLabel;
    lblDetallePresentacion: TLabel;
    edtClase: TIntEdit;
    lblClase: TLabel;
    btnBorrar: TButton;
    tbExportar: TToolButton;
    gbColoresReferenciaSimulacion: TGroupBox;
    lblReferenciaDiferenciaAcreedor: TLabel;
    lblReferenciaDiferenciaDeudor: TLabel;
    pnColorSaldoDeudor: TPanel;
    pnColorSaldoAcreedor: TPanel;
    lblReferenciaDiferenciaDevengado: TLabel;
    pnColorDiferenciaDevengado: TPanel;
    lblReferenciaDiferenciaCuota: TLabel;
    pnColorDiferenciaCuota: TPanel;
    bvSeparadorColores: TBevel;
    lblTipo: TLabel;
    ExportDialog: TExportDialog;
    tbLimpiar: TToolButton;
    lblVerNominasAnteriores: TLabel;
    chkVerDevengado: TCheckBox;
    chkVerCuota: TCheckBox;
    sdqSimulacion: TSDQuery;
    dsSimulacion: TDataSource;
    pnPeriodos: TPanel;
    gbReferenciasColores: TGroupBox;
    lblReferenciaPeriodoEstimado: TLabel;
    lblReferenciaPeriodoRecalculo: TLabel;
    pnPeriodoARecalcular: TPanel;
    pn: TPanel;
    dbgPeriodos: TArtDBGrid;
    sdqMovimientosActual: TSDQuery;
    dsMovimientosActual: TDataSource;
    dsMovimientosSimulados: TDataSource;
    fpAprobacionRecalculo: TFormPanel;
    bvSeparador: TBevel;
    btnAceptarAprobacion: TButton;
    btnCancelarAprobacion: TButton;
    gbDerivacionNota: TGroupBox;
    lblObservacion: TLabel;
    lblFechaDerivacionNota: TLabel;
    lblObservaciones: TLabel;
    edtFechaAprobacion: TDateComboBox;
    mObservacionesAprobacion: TMemo;
    lblSinCobertura: TLabel;
    pnPeriodoSinCobertura: TPanel;
    tsDiferencias: TTabSheet;
    sdqDiferencias: TSDQuery;
    dsDiferencias: TDataSource;
    dbgDiferencias: TArtDBGrid;
    btnNoautorizar: TButton;
    edtFechaTarifaVigencia: TDateComboBox;
    lblFechaEndoso: TLabel;
    Label1: TLabel;
    edtSumaFija: TCurrencyEdit;
    Label2: TLabel;
    edtPorcentajeMasa: TCurrencyEdit;
    lblFechaEndosoOrigenal: TLabel;
    edtFechaTarifa: TDateComboBox;
    lblVigenciaTarifaOriginal: TLabel;
    edtVigenciaTarifa: TDateComboBox;
    lblOrigen: TLabel;
    edtOrigen: TEdit;
    lblFormulario: TLabel;
    edtFormulario: TEdit;
    gbSumatoria: TGroupBox;
    lblPeriodosAfectados: TLabel;
    lblDiferenciaEmision: TLabel;
    lblAcreedores: TLabel;
    lblDeudores: TLabel;
    lblConDiferencias: TLabel;
    lblSaldo: TLabel;
    edtCantidadAcreedores: TEdit;
    edtCantidadDeudores: TEdit;
    edtSaldoTotal: TEdit;
    edtPeriodosAfectados: TIntEdit;
    edtPeriodosConDiferencias: TIntEdit;
    edtDiferenciaEmision: TCurrencyEdit;
    cdsMovimientosSimulados: TClientDataSet;
    sdqMovimientosActualNro: TFloatField;
    sdqMovimientosActualCdigo: TStringField;
    sdqMovimientosActualMovim: TStringField;
    sdqMovimientosActualFechaRecepcin: TDateTimeField;
    sdqMovimientosActualFechaDistrib: TDateTimeField;
    sdqMovimientosActualImporte: TFloatField;
    sdqMovimientosActualFechaAprobado: TDateTimeField;
    splitterMovimientos: TJvNetscapeSplitter;
    Panel4: TPanel;
    Panel1: TPanel;
    tbComandosSolicitud: TToolBar;
    ToolButton1: TToolButton;
    tbRefrescarSimulacion: TToolButton;
    dbgMovimientosSimulados: TArtDBGrid;
    gbResumenRecalculado: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtDevengadoCuotaRecalculo: TCurrencyEdit;
    edtDevengadoFondoRecalculo: TCurrencyEdit;
    edtDevengadoInteresRecalculo: TCurrencyEdit;
    edtDevengadoOtrosRecalculo: TCurrencyEdit;
    GroupBox1: TGroupBox;
    dbgMovimientosAnteriores: TArtDBGrid;
    gbResumenOriginal: TGroupBox;
    lblDevengadoCuota: TLabel;
    lblDevenedoFondo: TLabel;
    lblDevengadoInteres: TLabel;
    Label5: TLabel;
    edtDevengadoCuota: TCurrencyEdit;
    edtDevengadoFondo: TCurrencyEdit;
    edtDevengadoInteres: TCurrencyEdit;
    edtDevengadoOtros: TCurrencyEdit;
    ppDesde: TPeriodoPicker;
    lbPerDesde: TLabel;
    lbPerHasta: TLabel;
    ppHasta: TPeriodoPicker;
    lblNivelRequeriod: TLabel;
    lblDetalleNivelAutorizacionRequerido: TLabel;
    lblMotivoRecalculo: TLabel;
    Label10: TLabel;
    tbNuevaNomina: TToolButton;
    tbSimular: TToolButton;
    tbPresentaciones: TTabSheet;
    GroupBox2: TGroupBox;
    sdqRecepciones: TSDQuery;
    dsRecepciones: TDataSource;
    dbgRecepciones: TArtDBGrid;
    Panel6: TPanel;
    lblTrabajadorActivo: TLabel;
    Panel7: TPanel;
    lbl: TLabel;
    Panel8: TPanel;
    Label11: TLabel;
    dspDevengadoSim: TDataSetProvider;
    cdsDevengadoSim: TClientDataSet;
    sdqDevengadoSim: TSDQuery;
    dsDevengadoSim: TDataSource;
    ToolButton4: TToolButton;
    tbEliminarNomina: TToolButton;
    fpFormularioIndividual: TFormPanel;
    bvSeparador1: TBevel;
    btnAceptarFormulario: TButton;
    btnCancelarFormulario: TButton;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    lbCodRect: TLabel;
    lbTipoNomina: TLabel;
    lblNroVerificacion: TLabel;
    lblFechaPresentacion: TLabel;
    bvSeparador2: TBevel;
    Label13: TLabel;
    lblFechaRecepcionARTMono: TLabel;
    Label14: TLabel;
    ppPeriodoPresentacion: TPeriodoPicker;
    edCodRectificativa: TIntEdit;
    fraTipoFormulario: TfraStaticCodigoDescripcion;
    edtNroVerificacion: TIntEdit;
    edtFechaPresentacion: TDateEditor;
    fraEmpresa: TfraEmpresa;
    edtFechaRecepcionART: TDateEditor;
    pnPersonal: TPanel;
    lbEmpleados: TLabel;
    lbMSalarial: TLabel;
    lbEmpleadosMasaEnCero: TLabel;
    lblCantidadEmpleadosDeclar: TLabel;
    lblMasaSalarialLTR: TLabel;
    lblSalarioEnCeroDeclar: TLabel;
    edtEmpleados: TIntEdit;
    edtMasaSalarial: TCurrencyEdit;
    edtEmpleadosMasaEnCero: TIntEdit;
    edtEmpleadosDeclar: TIntEdit;
    edtMasaSalarialDeclar: TCurrencyEdit;
    edtSalariosEnCeroDeclar: TIntEdit;
    btnCopiar: TButton;
    fraTipoNomina: TfraStaticCodigoDescripcion;
    Panel9: TPanel;
    Label15: TLabel;
    cdsRecepcionesSim: TClientDataSet;
    cdsRecepcionesSimDS_CUIT: TStringField;
    cdsRecepcionesSimDS_PERIODO: TStringField;
    cdsRecepcionesSimDS_EMPLEADOS: TFloatField;
    cdsRecepcionesSimDS_MASASALARIAL: TFloatField;
    cdsRecepcionesSimDS_ESTADO: TFloatField;
    cdsRecepcionesSimDS_SUSS: TStringField;
    cdsRecepcionesSimDS_CONTRATO: TFloatField;
    cdsRecepcionesSimDS_FECHAPRESENTACION: TDateTimeField;
    cdsRecepcionesSimDS_VALORESVARIABLES: TStringField;
    cdsRecepcionesSimDS_VALORESESTADOS: TFloatField;
    cdsRecepcionesSimDS_IDSETEO: TFloatField;
    cdsRecepcionesSimDS_CODIGORECTIFICATIVA: TStringField;
    cdsRecepcionesSimDS_IDORIGENNOMINA: TFloatField;
    cdsRecepcionesSimDS_IMPORTESCERO: TFloatField;
    cdsRecepcionesSimDS_EMPLEADOSMAXIMOS: TFloatField;
    cdsRecepcionesSimDS_EMPLEADOSPROMEDIOS: TFloatField;
    cdsRecepcionesSimDS_EMPLEADOSMINIMOS: TFloatField;
    cdsRecepcionesSimDS_IDTIPONOMINA: TFloatField;
    cdsRecepcionesSimDS_IDESTIMACION: TFloatField;
    cdsRecepcionesSimDS_ADEUDADAS: TFloatField;
    cdsRecepcionesSimDS_IDFORMULARIO: TFloatField;
    cdsRecepcionesSimDS_CODIGORECTIFICATIVAORIGINAL: TStringField;
    cdsRecepcionesSimDS_MASADECLARADA: TFloatField;
    cdsRecepcionesSimDS_EMPLEADOSDECLARADOS: TFloatField;
    cdsRecepcionesSimDS_IMPORTESCERODECLARADOS: TFloatField;
    cdsRecepcionesSimDS_EMPLEADOSDECLARADOSNOACTIVO: TFloatField;
    cdsRecepcionesSimDS_MODOCARGA: TStringField;
    cdsRecepcionesSimDS_IDDDJJ: TFloatField;
    cdsRecepcionesSimDS_SIMULADA: TStringField;
    dspRecepcionesSim: TDataSetProvider;
    sdqRecepcionesSim: TSDQuery;
    dsRecepcionesSim: TDataSource;
    sdqSimulacionContrato: TFloatField;
    sdqSimulacionPerodo: TStringField;
    sdqSimulacionDSDesigner: TFloatField;
    sdqSimulacionDSDesigner2: TFloatField;
    sdqSimulacionDJ_IDUSUADA: TFloatField;
    sdqSimulacionEmpleadosNomina: TFloatField;
    sdqSimulacionMasaNomina: TFloatField;
    sdqSimulacionEmpleadosSim: TFloatField;
    sdqSimulacionMasaSim: TFloatField;
    sdqSimulacionDevSim: TFloatField;
    sdqSimulacionDevAct: TFloatField;
    sdqSimulacionCuotaSim: TFloatField;
    sdqSimulacionCuotaAct: TFloatField;
    sdqSimulacionMximo: TFloatField;
    sdqSimulacionPromedio: TFloatField;
    sdqSimulacionMnimo: TFloatField;
    sdqSimulacionImportesCero: TFloatField;
    sdqSimulacionEndoso: TFloatField;
    sdqSimulacionVigencia: TDateTimeField;
    sdqSimulacionPERIODOASIMULAR: TStringField;
    sdqSimulacionEstado: TStringField;
    sdqSimulacionIDENDOSO: TFloatField;
    sdqSimulacionIMPORTEPAGOS: TFloatField;
    sdqSimulacionENDOSOAUSAR: TFloatField;
    sdqSimulacionENDOSOUSADO: TFloatField;
    tbMarcarASimular: TToolButton;
    cdsRecepcionesSimDS_ACCION: TStringField;
    ToolButton2: TToolButton;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    Panel5: TPanel;
    procedure btnMostrarDetalleClick(Sender: TObject);
    procedure btnAceptarAjusteClick(Sender: TObject);
    procedure btnCancelarAjusteClick(Sender: TObject);
    procedure tbAjusteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbNuevaFormulaEstadoClick(Sender: TObject);
    procedure tbImportarDeclaracionClick(Sender: TObject);
    procedure btnAceptarArchivoClick(Sender: TObject);
    procedure btnCancelarArchivoClick(Sender: TObject);
    procedure tbSeleccionContratosClick(Sender: TObject);
    procedure dbgContratosSimulacionExit(Sender: TObject);
    procedure sdqContratosSeleccionablesSimulacionAfterScroll(
      DataSet: TDataSet);
    procedure dbgContratosSimulacionDblClick(Sender: TObject);
    procedure dbgPeriodosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbRestringirClick(Sender: TObject);
    procedure chkTodosLosContratosClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNominaClick(Sender: TObject);
    procedure lblVerNominasAnterioresClick(Sender: TObject);
    procedure lblDetallePresentacionClick(Sender: TObject);
    procedure fpImportacionNominaShow(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure sdqPeriodosAfterScroll(DataSet: TDataSet);
    procedure dbgSimulacionGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure pgSimulacionChange(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgSimulacionPaintFooter(Sender: TObject; Column: String;
      var Value: String; var CellColor, FontColor: TColor;
      var AlignFooter: TAlingFooter);
    procedure tbLimpiarClick(Sender: TObject);
    procedure chkVerDevengadoClick(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField;
      var AText: String; var AFont: TFont; var ABackground: TColor;
      var AAlignment: TAlignment);
    procedure btnAceptarAprobacionClick(Sender: TObject);
    procedure btnCancelarAprobacionClick(Sender: TObject);
    procedure tbAplicarRedevengadoClick(Sender: TObject);
    procedure pnSimulacionResize(Sender: TObject);
    procedure fraInfoEmpresalblAdic_5Click(Sender: TObject);
    procedure splitterMinimize(Sender: TObject);
    procedure splitterMaximize(Sender: TObject);
    procedure tbRefrescarSimulacionClick(Sender: TObject);
    procedure dbgMovimientosSimuladosGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure dbgPeriodosCellClick(Column: TColumn);
    procedure dbgPeriodosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNoautorizarClick(Sender: TObject);
//    procedure cdsPeriodosAfterScroll(DataSet: TDataSet);
    procedure tbNuevaNominaClick(Sender: TObject);
    procedure tbSimularClick(Sender: TObject);
    procedure dbgRecepcionesGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnAceptarFormularioClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure tbEliminarNominaClick(Sender: TObject);
    procedure btnCancelarFormularioClick(Sender: TObject);
    procedure tbMarcarASimularClick(Sender: TObject);
    procedure AgregarPeriodoCalculado(APeriodo: String);
  private
    FContrato : integer;
    FSimulandoConCompatibilidad : Boolean;
    FTotalConsulta : array of extended;
    FPeriodoDesde  : string;
    FPeriodoHasta  : string;
    FEnAprobacion  : boolean;
    FNivelUsuario  : integer;
    CAMPOS_SUMA : array of string;
    procedure CargarCabecera(AContrato: Integer);
    procedure OnChangeContrato(Sender: TObject);
//    procedure Compatibilidad(ACUIT: string);
    procedure ProcesarArchivo(NombreArchivo: string);
    procedure IncorporarContratosASimular;
    procedure CerrarSeleccionContratos;
    procedure SetearInterfazCompatibilidad(ACompatibilidad: Boolean);
    procedure SetearInterfazDevengadoCuota(ADevengadoCuota : Boolean);
    procedure Init;

    procedure RestringirPeriodos;
    procedure RestringirDiferencias;

    procedure MostrarDiferencias;
    procedure MostrarPeriodos;
    procedure CargarFuentesCalculos;
    procedure CargarFuenteCalculo(ACuit, APeriodo : string; AIdDDJJ : Integer);
//    procedure CargarFuenteCalculoSimulado(ACuit, APeriodo : string; AIdDDJJ : Integer);
    procedure CargarFuenteCalculoSimulado(ACuit, APeriodo : string);
    procedure Salir;
    procedure PrintResults;
    procedure MoverRegistroSimulacion;
    procedure CalcTotales;
    procedure CalcularTotales;
    procedure CalcularTotalesRecalculados;
    procedure Limpiar;
    procedure ActivarControles;
    procedure HabilitarBotones;
    procedure DesHabilitarBotones;
    procedure CalcularMovimientosPeriodo;
    function PeriodoCalculado(APeriodo: String): boolean;
    procedure SetearColoresDiferencias(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    function VerificarPeriodos : boolean;
    procedure MostrarAprobacion;
    procedure CalcularDiferencias;
    procedure LimpiarFuenteCalculo;
    procedure LimpiarFuenteCalculoSimulado;
    procedure CargarDatosTarifa(contrato: integer; periodo: string);
    procedure CargarDatosTarifaOriginal(IdEndoso: Integer);
    procedure LimpiarTarifaVigente;
    procedure CompletarResumenMovimiento(Contrato: Integer; Periodo: String);
    procedure CompletarResumenMovimientoSimulado(Contrato: Integer; Periodo: String);
    procedure MostrarNivelRequerido;
    procedure MostrarMotivoRecalculo;
    function ObtenerMotivoRecalculo: string;
    procedure AprobarRecalculo(AAprobar: boolean);
    procedure CargarPresentaciones;
    function ValidarMasaYPersonal(SinPersonal: boolean; Empleados,
      EmpleadosDeclar, SalariosEnCero : Integer; MasaSalarial,
      MasaSalarialDeclar: Currency): boolean;
    procedure LimpiarFormularioIndividual;
    function ValidarPeriodoIndividual: Boolean;
  public
    procedure SimularContrato(AContrato : Integer);
    procedure SimularAutorizaciones(AContrato : Integer);
//    procedure SimularContrato(AContrato : Integer; ATipoAutorizacion : Integer); overload;
//    procedure SimularContrato(ATipoAutorizacion : Integer); overload;
(*
    procedure SimularContrato(AContrato, ATipoAutorizacion : Integer;
                              Periodo_Desde, Periodo_Hasta: string; EnAprobacion : boolean = True); overload;
*)
  end;




implementation

uses unDmPrincipal, unDmEmision, SqlFuncs, AnsiSql, unFuncionesEmision, DbFuncs, General, CustomDlgs,
  unDmSimulacion, unFrmDetalleNomina, unFrmAjustePorConceptos, unFrmDeclaracionesPresentadas, StrFuncs,
  unEspera, VCLExtra, unPresentacion, unConstEmision, unUtils;


const
 PAG_RECALCULO   = 0;
 PAG_MOVIMIENTOS   = 1;
 PAG_FUENTECALCULO = 2;
 PAG_DIFERENCIAS   = 4;

var
 PeriodosCalculados : array of string;

{$R *.dfm}

{ TFrmSimulacion }

{------------------------------------------------------------------------------}
(*
procedure TFrmSimulacion.SimularContrato(AContrato,
  ATipoAutorizacion: Integer);
begin
  CargarCabecera(AContrato);
  ShowModal;
end;
*)
{------------------------------------------------------------------------------}
(*
procedure TFrmSimulacion.SimularContrato(AContrato, ATipoAutorizacion : Integer;
  Periodo_Desde, Periodo_Hasta: string; EnAprobacion : boolean = True);
begin
  CargarCabecera(AContrato);
  do_cargarnominasperiodos(AContrato, Periodo_desde, Periodo_hasta);
  gbSeleccionEmpresa.Enabled := false;
  tbLimpiar.Enabled := false;
  FPeriodoDesde := Periodo_Desde;
  FPeriodoHasta := Periodo_Hasta;
  FEnAprobacion := EnAprobacion;
  ShowModal;
end;
*)
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.CargarCabecera( AContrato: Integer );
var
  sSql: string;
  Query: TSDquery;
begin
  if FContrato = AContrato then exit;

////  IniciarEspera;
  ActivarControles;

  FContrato := AContrato;


  sSql := 'SELECT CO_CONTRATO, DC_TELEFONOS || DC_FAX DC_TELEFONOS, AC_CODIGO, ' +
          '       AFEST.TB_DESCRIPCION AS ESTADO, CO_IDACTIVIDAD, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
          '       CO_FECHABAJA, '' ('' || BAJ.TB_CODIGO || '')  '' || BAJ.TB_DESCRIPCION AS MOTIVO_BAJA, ' +
          '       NVL(DC_DOMICILIO, ART.UTILES.ARMAR_DOMICILIO(DC_CALLE,DC_NUMERO,DC_PISO,DC_DEPARTAMENTO,NULL) ' +
          '       ||ART.UTILES.ARMAR_LOCALIDAD (DC_CPOSTAL, NULL, DC_LOCALIDAD, DC_PROVINCIA)) AS DOM_POSTAL' +
          '  FROM ACO_CONTRATO, ADC_DOMICILIOCONTRATO, CAC_ACTIVIDAD, CTB_TABLAS BAJ, CTB_TABLAS AFEST ' +
          ' WHERE CO_CONTRATO     = DC_CONTRATO' +
          '   AND CO_IDACTIVIDAD  = AC_ID' +
          '   AND BAJ.TB_CLAVE(+) = ''MOTIB''' +
          '   AND CO_MOTIVOBAJA   = BAJ.TB_CODIGO(+)' +
          '   AND AFEST.TB_CLAVE  = ''AFEST''' +
          '   AND AFEST.TB_CODIGO = CO_ESTADO' +
          '   AND CO_CONTRATO     = ' + SqlValue(AContrato);
  Query := GetQuery( sSql );
  try
    if not Query.Eof then
    begin
      With Query do
      begin
        if fraContratoASimular.Contrato <> FieldByName('CO_CONTRATO').AsInteger then
          fraContratoASimular.Contrato := FieldByName('CO_CONTRATO').AsInteger;

        edtDomicilio.Text          := FieldByName('DOM_POSTAL').AsString;
        cmbFechaVigenciaDesde.Date := FieldByName('CO_VIGENCIADESDE').AsDateTime;
        cmbFechaVigenciaHasta.Date := FieldByName('CO_VIGENCIAHASTA').AsDateTime;
        cmbFechaBaja.Date          := FieldByName('CO_FECHABAJA').AsDateTime;
        edtMotivoBaja.Text         := FieldByName('MOTIVO_BAJA').AsString;
        fraActividad.Value         := FieldByName('CO_IDACTIVIDAD').AsInteger;
        edtESTADO.Text             := FieldByName('ESTADO').AsString;
        fraInfoEmpresa.CargarContrato(fraContratoASimular.edContrato.Text, fraContratoASimular.mskCuit.Text);

        //Genera todos los registros de tablas auxiliares para contratos no migrados.
        //Al migrar eliminar.
        //Compatibilidad(fraContratoASimular.CUIT);

        //Mover los datos para el ambiente de simulación.
        MostrarPeriodos;
        MostrarDiferencias;
        CalcTotales;
        CalcularDiferencias;
        HabilitarBotones;

//        edtPeriodosAfectados.Text := IntToStr(Get_PeriodosComprometidos(fraContratoASimular.CUIT));
      end;
    end
    else
    MessageDlg('Los datos son incorrectos', mtWarning, [mbOK], 0);
  finally
    Query.Free;
////    DetenerEspera;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.btnMostrarDetalleClick(Sender: TObject);
begin

end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.btnAceptarAjusteClick(Sender: TObject);
begin

end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.btnCancelarAjusteClick(Sender: TObject);
begin

end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.tbAjusteClick(Sender: TObject);
begin
  Verificar(dbgSimulacion.SelectedRows.Count <> 0, nil, 'Debe seleccionar un periodo.');

  with TFrmAjustePorConceptos.Create(self) do
  try
    MostrarMovimientos(FContrato, sdqPeriodos.FieldByName('periodo').AsString);
  finally
    free;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.FormCreate(Sender: TObject);
begin
  Init;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.Init;
begin
  gbSeleccionEmpresa.Enabled := true;
  tbLimpiar.Enabled := true;
  fraContratoASimular.OnChange := OnChangeContrato;
  fraContratoASimular.ShowBajas := true;
  fraContratoASimular.UltContrato := true;
  FSimulandoConCompatibilidad := false;
  SetearInterfazDevengadoCuota(chkVerCuota.Checked);
  Do_InicializarSimulacion;
  fraEmpresa.Enabled := false;

  FContrato := -1;
//  FNivelUsuario := 3;
  FNivelUsuario := get_nivelautorizacionusuario(Sesion.LoginName);

  with fraTipoFormulario do
  begin
    TableName   := 'EMI.ITF_TIPOFORMULARIO';
    FieldID     := 'TF_ID';
    FieldCodigo := 'TF_ID';
    FieldDesc   := 'TF_DESCRIPCION';
    FieldBaja   := 'TF_FECHABAJA';
    ExtraCondition := ' AND TF_NOMINA = ''S'' ' +
                      ' AND TF_TRABAJADORES = ''N'' ' +
                      ' AND TF_MULTIPERIODO = ''N'' ' +
                      ' AND TF_PRESENTACIONMANUAL = ''S'' ';
    ExtraFields := ', TF_SINPERSONAL AS SIN_PERSONAL ';
    DynamicCols := true;

    ShowBajas   := False;
  end;

  with fraTipoNomina do
  begin
    TableName   := 'EMI.ITN_TIPONOMINA';
    FieldID     := 'TN_ID';
    FieldCodigo := 'TN_ID';
    FieldDesc   := 'TN_DESCRIPCION';
    FieldBaja   := 'TN_FECHABAJA';
//    ExtraCondition := ' AND TN_CARGAMANUAL = ''S''';
    ShowBajas   := False;
  end;

  Limpiar;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.Limpiar;
begin
  pgSimulacion.ActivePageIndex := PAG_RECALCULO;

  pnSimulacionEmision.Enabled := False;

  fraContratoASimular.Clear;
  sdqPeriodos.Close;
  sdqSimulacion.Close;
  mdContenido.EmptyTable;
  edtDomicilio.Text := '';
  fraActividad.Clear;
  edtESTADO.Text := '';
  cmbFechaBaja.Date := 0;
  edtMotivoBaja.Text := '';
  cmbFechaVigenciaDesde.Text := '';
  cmbFechaVigenciaHasta.Text := '';
  chkTodosLosContratos.Checked := true;
  fraInfoEmpresa.Clear;

  edtPeriodosAfectados.Value := 0;
  edtPeriodosConDiferencias.Value := 0;
  edtDiferenciaEmision.Text := '';
  edtCantidadAcreedores.Text := '';
  edtCantidadDeudores.Text := '';
  edtSaldoTotal.Text := '';

  edtFijaVigente.Value := 0;
  edtVariableVigente.Value  := 0;
  edtFechaVigenciaTarifaVigente.Date := 0;
  edtFechaTarifaVigencia.Date := 0;

  edtOrigen.Text := '';
  edtFormulario.Text := '';
  edtMasa.Value := 0;
  edtTrabajadores.Value := 0;

  edtMasaCero.Visible := false;
  lblMasaCero.Visible := false;
  edtMasaCero.Value := 0;
  lblTipo.Caption := '';

  edtOrigenRecalculo.Text := '';
  edtFormularioRecalculo.Text := '';
  edtMasaRecalculo.Value := 0;
  edtTrabajadoresRecalculo.Value := 0;

  DesHabilitarBotones;
end;

procedure TFrmSimulacion.ActivarControles;
begin
  pgSimulacion.ActivePageIndex := PAG_RECALCULO;
  pnSimulacionEmision.Enabled := True;
end;

procedure TFrmSimulacion.OnChangeContrato(Sender: TObject);
begin
  if fraContratoASimular.IsSelected then
   CargarCabecera(fraContratoASimular.Contrato);
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.tbRefrescarClick(Sender: TObject);
begin
  if fraContratoASimular.IsSelected then
  begin
   if (MessageDlg('Esta operación reinicia la simulación. ¿Desea continuar?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
   begin
     FContrato := -1;
     Do_InicializarSimulacion;
     CargarCabecera(fraContratoASimular.Contrato);
   end;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.tbSalirClick(Sender: TObject);
begin
    close;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.Salir;
begin
  try
////    IniciarEspera('Cerrando..');
    mdContenido.EmptyTable;
    sdqSimulacion.Close;
  finally
////    DetenerEspera;
  end;
end;

{
procedure TFrmSimulacion.Compatibilidad(ACUIT : string);
var
 Cont : Integer;
 sSql : string;
begin
////  IniciarEspera('Espere por favor..');
//  sSql := 'emi.emision.do_generarcompatibilidad(' + SqlValue( ACUIT ) + ');';
//  EjecutarStoreST( sSql );
////  DetenerEspera;
end;
}
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.SetearInterfazCompatibilidad(ACompatibilidad : Boolean);
begin
  ToolBarSeleccionContrato.Visible := true;
  dbgContratosSimulacion.Visible := false;
  dbgPeriodos.Refresh;

  FSimulandoConCompatibilidad := ACompatibilidad;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.tbNuevaFormulaEstadoClick(Sender: TObject);
begin
  if od.Execute then
  begin
    edtArchivo.Text := od.FileName;
    ProcesarArchivo(od.FileName);
    btnBorrar.Visible := mdContenido.RecordCount > 0;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.tbImportarDeclaracionClick(Sender: TObject);
begin
  fpImportacionNomina.ShowModal;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.ProcesarArchivo(NombreArchivo: string);
var
  Archivo: TextFile;
  TotalLineas: integer;
  Linea: string;
  Posicion: integer;
  NroCampo: integer;
  FCantLineas : Integer;

  function ProcesarLinea(ALinea: string): boolean;
  var
    sCuit, sPeriodo: string;
    sMasa: Currency;
    sContrato, sTrabajadores, sMasaCero : Integer;
    Campo : variant;
  begin
    nroCampo := 0;
    sMasa := 0; sCuit := ''; sPeriodo := '';
    sContrato := 0; sTrabajadores := 0; sMasaCero := 0;
    Campo := '';

    while (ALinea <> '') do
    begin
      //Si encuentro títulos paso al próximo.
      if Pos('A',ALinea) > 0 then exit;

      Posicion := Pos(';',ALinea);
      if Posicion = 0 then
      begin
        Posicion := Length(ALinea);
        Campo := Copy(ALinea, 1, Posicion);
      end
      else
        Campo := Copy(ALinea, 1, Posicion-1);

      ALinea := Copy(ALinea, Posicion+1, Length(ALinea));

      case nroCampo of
        0://'CUIL'
          sCuit := Campo;
        1://'PERIODO'
        begin
          sPeriodo := Campo;
        end;
        2://'CONTRATO'
        begin
          sContrato := Campo;
        end;
        3://'MASA'
        begin
          sMasa := Campo;
        end;
        4://'TRABAJADORES'
        begin
          sTrabajadores := Campo;
        end;
        5://'MASA CERO'
        begin
          sMasaCero := Campo;
        end;

      end;
      inc(NroCampo);
    end;

    If NroCampo <> 6 then
     raise Exception.Create('Cantidad de Campos Inválidos.');

    mdContenido.Insert;
    mdContenidoSI_CUIT.Value := sCuit;
    mdContenidoSI_PERIOD.Value := sPeriodo;
    mdContenidoSI_CONTRATO.Value := sContrato;
    mdContenidoSI_MASA.Value := sMasa;
    mdContenidoSI_TRABAJADOR.Value := sTrabajadores;
    mdContenidoSI_MASACERO.Value := sMasaCero;

    mdContenido.Post;
  end;
begin
////  IniciarEspera;
  try
    mdContenido.EmptyTable;
    mdContenido.Open;

    AssignFile(Archivo, NombreArchivo);
    Reset( Archivo );

    TotalLineas := 0;
    while (not Eof(Archivo)) do
    begin
      readln( Archivo );
      inc(TotalLineas);
    end;
    CloseFile(Archivo);

    if (TotalLineas<1) then
      Raise Exception.Create( 'El archivo no posee registros.' );

    Reset( Archivo );
    read( Archivo, Linea );

    FCantLineas  := 1;
    while (not Eof(Archivo)) do
    begin
      inc(FCantLineas);
      ProcesarLinea(Linea);
      readln( Archivo, Linea );
    end;
  finally
    CloseFile(Archivo);
////    DetenerEspera;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.btnAceptarArchivoClick(Sender: TObject);
begin

  if (MessageBox(0, '¿Confirma la simulación sobre estos contratos-períodos?',
      'Confirmación', MB_ICONQUESTION or MB_OKCANCEL or MB_DEFBUTTON1) = idOk) then
  begin
////    IniciarEspera;
    try
      IncorporarContratosASimular;
      fpImportacionNomina.Close;
      SetearInterfazCompatibilidad(true);
    finally
////      DetenerEspera;
    end;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.IncorporarContratosASimular;
var
 CUITActual : String;
begin
  mdContenido.SortOnFields('SI_CUIT',False,False);
  mdContenido.First;
  CUITActual := '';

  while not mdContenido.Eof do
  begin
    if CUITActual <> mdContenidoSI_CUIT.Value then
    begin
      CUITActual := mdContenidoSI_CUIT.Value;
    end;

(*
    //Inserta la que no existe, actualiza las que están.
    Do_ActualizaNominaSim( mdContenidoSI_CUIT.AsString,
                           mdContenidoSI_PERIOD.AsString,
                           mdContenidoSI_CONTRATO.AsInteger,
                           mdContenidoSI_MASA.AsCurrency,
                           mdContenidoSI_TRABAJADOR.AsInteger,
                           mdContenidoSI_MASACERO.AsInteger,
                           null, null);
*)

    mdContenido.Next;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.btnCancelarArchivoClick(Sender: TObject);
begin
  fpImportacionNomina.Close;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.tbSeleccionContratosClick(Sender: TObject);
begin
  sdqContratosSeleccionablesSimulacion.Open;

  dbgContratosSimulacion.Visible := true;
  if sdqContratosSeleccionablesSimulacion.RecordCount > 3 then
   dbgContratosSimulacion.Height := 150
  else dbgContratosSimulacion.Height := 70;

  dbgContratosSimulacion.SetFocus;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.dbgContratosSimulacionExit(Sender: TObject);
begin
  CerrarSeleccionContratos;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.sdqContratosSeleccionablesSimulacionAfterScroll(
  DataSet: TDataSet);
begin
  fraContratoASimular.CUIT := sdqContratosSeleccionablesSimulacion.FieldByName('rs_cuit').AsString;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.CerrarSeleccionContratos;
begin
  dbgContratosSimulacion.Visible := false;
  dbgContratosSimulacion.Height := 0;
  sdqContratosSeleccionablesSimulacion.Close;
  if fraContratoASimular.IsSelected then
    CargarCabecera(fraContratoASimular.Contrato);
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.tbRestringirClick(Sender: TObject);
begin
  MostrarPeriodos;
  MostrarDiferencias;
  CalcTotales;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.chkTodosLosContratosClick(Sender: TObject);
begin
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.dbgContratosSimulacionDblClick(Sender: TObject);
begin
  CerrarSeleccionContratos;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.dbgPeriodosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not IsEmptyString(FPeriodoDesde) and
     not IsEmptyString(FPeriodoHasta) then
  if (Field.dataset.FieldByName('Periodo').AsString >= FPeriodoDesde) and
     (Field.dataset.FieldByName('Periodo').AsString <=FPeriodoHasta) and
     (Field.dataset.FieldByName('codestado').AsString = 'P')  then
  begin
    AFont.Style := [fsBold];
  end
  else     AFont.Style := [];


  if (sdqPeriodos.FieldByName('periodo').AsString  <>
      sdqPeriodos.FieldByName('Período Cal.Dev.').AsString) then
  begin
    if Highlight Then
      Background := clTeal
    else
      Background := COLOR_SIMULACION_ESTIMADO;
  end;
      
  if (sdqPeriodos.FieldByName('Período Simulación').AsString <> '') or
//     (sdqPeriodos.FieldByName('DECLARACIONUSADA').AsString <>
//      sdqPeriodos.FieldByName('DECLARACIONAUSAR').AsString) or
     (sdqPeriodos.FieldByName('ENDOSOAUSAR').AsString <>
      sdqPeriodos.FieldByName('ENDOSOUSADO').AsString) or
     (sdqPeriodos.FieldByName('ANTERIORPREVISTO').AsString <>
      sdqPeriodos.FieldByName('ACTUALPREVISTO').AsString) then
  begin
    if Highlight Then
      Background := clNavy
    else
      Background := COLOR_SIMULACION_RECALCULO;
  end;

  if (sdqPeriodos.FieldByName('COBERTURA').AsString = 'Sin Cobertura')  then
  begin
    if Highlight Then
      Background := clNavy
    else
      Background := COLOR_SIMULACION_SINCOBERTURA;
  end;

end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.RestringirPeriodos;
var
 periodo_inicio : string;
 sSql : String;
begin
  try
    sdqPeriodos.DisableControls;
    sdqPeriodos.Close;
    sSql := ' SELECT   pe_cuit "CUIT",                                                   ' +
            '          pe_contrato "Contrato",                                           ' +
            '          pe_periodo "Periodo",                                             ' +
            'DECODE (NVL (rp_estado, ''S''),                                             ' +
            '     ''V'', ''Válido'',                                                     ' +
            '     ''I'', ''Pendiente Rec.'',                                             ' +
            '     ''P'', ''Pendient. Apr.'',                                             ' +
            '     ''S'', ''Sin Resumen.'') "Estado",                                     ' +
            'rp_cantidadobservaciones "Observaciones",                                   ' +
            'idj.dj_periodo "Período Cal.Dev.",                                          ' +
            'emi.simulacion.get_periodoasimular (pe_cuit, pe_periodo)                    ' +
            '                                                "Período Simulación",       ' +

            'rp_contrato "Contrato",                                                     ' +
            'rp_estado codestado,                                                        ' +
            'DECODE (art.cobranza.check_cobertura_periodocobranz (pe_contrato,           ' +
            '                                                     pe_periodo),           ' +
            '        1, ''Con Cobertura'',                                               ' +
            '           ''Sin Cobertura'') cobertura,                                    ' +
            ' idj.dj_id IdDDJJ,                                                          ' +
//            '       emi.utiles.get_ultimaiddeclaracion(pe_contrato,                      ' +
//            '           emi.simulacion.get_periodoasimular(pe_contrato,pe_periodo))      ' +
//            '                 IdDDJJSimular,
            ' ide.de_idendoso IDENDOSO,                   ' +
//            ' NVL (emi.utiles.get_declaracionusada (rp_contrato, rp_periodo), 0) declaracionusada, ' +
//            ' emi.utiles.get_ultimaiddeclaracion (rp_contrato, rp_periodo) declaracionausar, ' +
            ' emi.utiles.sumarcodigosreversioncuota (rp_contrato, rp_periodo) anteriorprevisto, ' +
            ' emi.emision.get_devengadoprevisto (rp_contrato, rp_periodo) actualprevisto, ' +
            ' art.afiliacion.get_idmaxendosovig (rp_contrato, rp_periodo, 1) endosoausar, ' +
            ' NVL (emi.utiles.get_ultimoendosodevengado (rp_contrato, rp_periodo), 0) endosousado ' +
            'FROM                                                                        ' +
            '     emi.irp_resumenperiodo irp,                                            ' +
            '     emi.ide_devengado ide,                                                 ' +
            '     emi.idj_ddjj idj,                                                      ' +
            '    (SELECT pe_periodo, co_contrato pe_contrato, em_cuit pe_cuit            ' +
            '        FROM comunes.cpe_periodo periodo,                                   ' +
            '             aco_contrato contrato,                                         ' +
            '             aem_empresa empresa                                            ' +
            '            WHERE empresa.em_id = contrato.co_idempresa                     ' +
            '            AND contrato.co_contrato = art.afiliacion.get_contratovigente(em_cuit, pe_periodo) ';


    if chkTodosLosContratos.Checked then
      sSql := sSql + '      AND em_cuit = ' + SqlValue(fraContratoASimular.CUIT)
    else
      sSql := sSql + '      AND co_contrato = ' + SqlValue(fraContratoASimular.Contrato);


    sSql := sSql + '       AND (pe_periodo >= art.utiles.periodo_anterior(to_char(' + SqlDate(cmbFechaVigenciaDesde.Date) + ', ''YYYYMM'')) ';

    if (cmbFechaBaja.Date > 0) and (not chkTodosLosContratos.Checked) then
      sSql := sSql + '  AND pe_periodo <= TO_CHAR (' + SqlDate(cmbFechaBaja.Date)  +  ', ''YYYYMM''))'
    else
      sSql := sSql + '  AND pe_periodo <= TO_CHAR (SYSDATE, ''YYYYMM''))';

    sSql := sSql + ') cpe ';

    sSql := sSql + '   WHERE (cpe.pe_periodo = irp.rp_periodo(+) AND            ' +
                   '          cpe.pe_contrato = irp.rp_contrato(+))             ' +
                   '     AND irp.rp_iddevengado = ide.de_id(+)                  ' +
                   '     AND ide.de_idddjj = idj.dj_id(+)';


    if tbRestringir.Down then
      sSql := sSql + '   AND ( (emi.simulacion.get_periodoasimular(rp_contrato, rp_periodo) is not null) ' +
                     '    or   (NVL (emi.utiles.get_declaracionusada (rp_contrato, rp_periodo), 0) <> NVL (emi.utiles.get_ultimaiddeclaracion (rp_contrato, rp_periodo), 0)) ' +
                     '    or   (NVL (emi.utiles.sumarcodigosreversioncuota (rp_contrato, rp_periodo), 0)  <> NVL(emi.emision.get_devengadoprevisto (rp_contrato, rp_periodo), 0)) ' +
                     '    or   (NVL (art.afiliacion.get_idmaxendosovig(rp_contrato, rp_periodo, 1), 0) <> NVL(emi.utiles.get_ultimoendosodevengado (rp_contrato, rp_periodo), 0))) ';
                     
    sSql := sSql + 'ORDER BY pe_periodo ASC';

    sdqPeriodos.Sql.text := sSql;
    //sdqPeriodos.Open;
    //cdsPeriodos.Open;
  finally
    sdqPeriodos.EnableControls;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.RestringirDiferencias;
var sSql : string;
begin
   sSql :=   'SELECT irp.rp_contrato "Contrato",                                        ' +
             '  irp.rp_periodo "Período",                                               ' +
             '  aht.ht_sumafija "$",                                                    ' +
             '  aht.ht_porcmasa "%",                                                    ' +
             '  idj.dj_id dj_idusuada,                                                  ' +
             '  idj.dj_empleados "Empleados Nomina",                                    ' +
             '  idj.dj_masasalarial "Masa Nomina",                                      ' +
(*
             '  ROUND ((  aht.ht_sumafija * idj.dj_empleados                            ' +
             '        + aht.ht_porcmasa * idj.dj_masasalarial / 100),                   ' +
             '       2) "Prima",                                                        ' +
             '  ROUND ((  aht.ht_sumafija * idj_ausar.dj_empleados                      ' +
             '        + aht.ht_porcmasa * idj_ausar.dj_masasalarial / 100),             ' +
             '       2) "Prima Sim",                                                    ' +
*)
(*
             '  idj_ausar.dj_empleados "Empleados Sim",                                 ' +
             '  idj_ausar.dj_masasalarial "Masa Sim",                                   ';
*)

             '  emi.simulacion.get_empleadossim(rp_contrato, rp_periodo) "Empleados Sim",                                 ' +
             '  emi.simulacion.get_masasim(rp_contrato, rp_periodo) "Masa Sim",                                   ';


   if chkVerDevengado.Checked then
   begin
     sSql := sSql + '  emi.simulacion.get_devengadosim (rp_contrato, rp_periodo) "Dev.Sim.",                                       ' +
                    '  emi.emision.get_devengadoactual (rp_contrato, rp_periodo) "Dev.Act.",';
//     sSql := sSql + '  ide.de_devengadocuota "Dev.Act.",                                       ' +
//                    '  emi.simulacion.get_cuotaprevistasim(rp_contrato, rp_periodo) "Dev.Sim.",';
     dbgSimulacion.Columns.Items[11].visible := true;
     dbgSimulacion.Columns.Items[12].visible := true;
   end else
   begin
     sSql := sSql + '   0 "Dev.Act.", ' +
                    '   0 "Dev.Sim.", ';
     dbgSimulacion.Columns.Items[11].visible := false;
     dbgSimulacion.Columns.Items[12].visible := false;

   end;

   if chkVerCuota.Checked then
   begin
     sSql := sSql + '  emi.simulacion.get_devengadocuotasim (rp_contrato, rp_periodo) "Cuota Sim.",       ' +
                    '  emi.emision.get_devengadocuotaactual (rp_contrato, rp_periodo) "Cuota Act.",             ';
     dbgSimulacion.Columns.Items[9].Visible := true;
     dbgSimulacion.Columns.Items[10].Visible := true;
   end else
   begin
     sSql := sSql + '   0 "Cuota Sim.", ' +
                    '   0 "Cuota Rec.", ';

     dbgSimulacion.Columns.Items[9].Visible := false;
     dbgSimulacion.Columns.Items[10].Visible := false;
   end;

   sSql := sSql + '       idj.dj_empleadosmaximos "Máximo",           ' +
                  '       idj.dj_empleadospromedios "Promedio",       ' +
                  '       idj.dj_empleadosminimos "Mínimo",           ' +
                  '       idj.dj_importescero "Importes Cero",        ' +
                  '       aen.en_endoso "Endoso",                     ' +
                  '       aen.en_vigenciaendoso "Vigencia",           ' +
                  '       emi.simulacion.get_periodoasimular(rp_contrato,rp_periodo) periodoasimular, ' +
//                  '       emi.utiles.get_ultimaiddeclaracion(rp_contrato,' +
//                  '           emi.simulacion.get_periodoasimular(rp_contrato,rp_periodo)) ' +
//                  '                 IdDDJJSimular,                     ' +
                  '       DECODE (NVL (rp_estado, ''S''),             ' +
                  '            ''V'', ''Válido'',                     ' +
                  '            ''I'', ''Pendiente Rec.'',             ' +
                  '            ''P'', ''Pendient. Apr.'',             ' +
                  '            ''S'', ''Sin Resumen.'') "Estado", ide.de_idendoso IDENDOSO, ' +
                  '       emi.emision.get_importepagado (rp_contrato, rp_periodo) importepagos, ' +
//                  '       NVL (emi.utiles.get_declaracionusada (rp_contrato, rp_periodo), 0) declaracionusada, ' +
//                  '       emi.utiles.get_ultimaiddeclaracion (rp_contrato, rp_periodo) declaracionausar, ' +
//                  '       emi.utiles.sumarcodigosreversioncuota (rp_contrato, rp_periodo) anteriorprevisto, ' +
//                  '       emi.emision.get_devengadoprevisto (rp_contrato, rp_periodo) actualprevisto, ' +
                  '       art.afiliacion.get_idmaxendosovig (rp_contrato, rp_periodo, 1) endosoausar, ' +
                  '       NVL (emi.utiles.get_ultimoendosodevengado (rp_contrato, rp_periodo), 0) endosousado ' +

                  '  FROM emi.irp_resumenperiodo irp,                 ' +
                  '       emi.ide_devengado ide,                      ' +
                  '       emi.idj_ddjj idj,                           ' +
//                  '       emi.idj_ddjj idj_ausar,                     ' +
                  '       afi.aen_endoso aen,                         ' +
                  '       afi.aht_historicotarifario aht             ' +
                  ' WHERE irp.rp_iddevengado = ide.de_id(+)           ' +
                  '   AND ide.de_idddjj = idj.dj_id(+)                ' +
                  '   AND aht.ht_id = art.afiliacion.get_idmaxendosovig (rp_contrato, rp_periodo)  ' +
                  '   AND aen.en_id = art.afiliacion.get_idmaxendosovigend(rp_contrato,rp_periodo) ';
//                  '   AND (irp.rp_contrato = idj_ausar.dj_contrato(+) ' +
//                  '   AND  irp.rp_periodo = idj_ausar.dj_periodo(+)   ' +
//                  '        AND idj_ausar.dj_id(+) = emi.utiles.get_ultimaiddeclaracion(rp_contrato, rp_periodo))';

    if  tbRestringir.Down then
      sSql := sSql + '   AND ( (emi.simulacion.get_periodoasimular(rp_contrato, rp_periodo) is not null) ' +
                     '    or   (NVL (emi.utiles.get_declaracionusada (rp_contrato, rp_periodo), 0) <> NVL (emi.utiles.get_ultimaiddeclaracion (rp_contrato, rp_periodo), 0)) ' +
                     '    or   (NVL (emi.utiles.sumarcodigosreversioncuota (rp_contrato, rp_periodo), 0)  <> NVL(emi.emision.get_devengadoprevisto (rp_contrato, rp_periodo), 0)) ' +
                     '    or   (NVL (art.afiliacion.get_idmaxendosovig(rp_contrato, rp_periodo, 1), 0) <> NVL(emi.utiles.get_ultimoendosodevengado (rp_contrato, rp_periodo), 0))) ';

    if chkTodosLosContratos.Checked then
         sSql := sSql + ' and rp_cuit = ' + SqlValue(fraContratoASimular.CUIT)
    else sSql := sSql + ' and rp_contrato = ' + SqlValue(fraContratoASimular.Contrato);

    sdqSimulacion.SQL.Text := sSql;
//    sdqSimulacion.Open;
//    cdsSimulacion.Open;

end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.MostrarPeriodos;
var
  b: TBookmark;
begin
////  IniciarEspera('Mostrando Períodos..');
//  with dmSimulacion do
  try
    if dbgPeriodos.DataSource.DataSet.Active and not dbgPeriodos.DataSource.DataSet.IsEmpty then
      b := dbgPeriodos.DataSource.DataSet.GetBookmark;

    sdqPeriodos.DisableControls;
    sdqPeriodos.Close;
    RestringirPeriodos;
    sdqPeriodos.Open;
    sdqPeriodos.FetchAll;
//    cdsPeriodos.Open;
    MostrarNivelRequerido;
  finally
    try
      if Assigned(b) then
      begin
        dbgPeriodos.DataSource.DataSet.GotoBookmark(b);
        dbgPeriodos.DataSource.DataSet.FreeBookmark(b);
      end;
    except
    end;
    sdqPeriodos.EnableControls;
////    DetenerEspera;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.MostrarNivelRequerido;
var
 IdNivelRequerido : integer;
 PeriodoDesde, PeriodoHasta : String;
begin
  SeleccionDesdeHasta(dbgPeriodos, 'periodo', PeriodoDesde, PeriodoHasta);

  IdNivelRequerido := get_nivelrequeridorecalculo(
        fraContratoASimular.Contrato,
        PeriodoDesde, PeriodoHasta);

  lblDetalleNivelAutorizacionRequerido.Caption := get_descripcionnivelrequerido(IdNivelRequerido);
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.MostrarDiferencias;
begin
////  IniciarEspera('Recalculando períodos..');

  try
    sdqSimulacion.DisableControls;
    sdqSimulacion.Close;
//    cdsSimulacion.DisableControls;
//    cdsSimulacion.Close;
    RestringirDiferencias;
    sdqSimulacion.Open;
    sdqSimulacion.FetchAll;
//    cdsSimulacion.Open;
  finally
//    cdsSimulacion.EnableControls;
    sdqSimulacion.EnableControls;
////    DetenerEspera;
  end;

end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.CalcTotales;
var
  PrevCursor: TCursor;

begin

//  SetLength(CAMPOS_SUMA, 2);
//  CAMPOS_SUMA[0] := 'Prima';
//  CAMPOS_SUMA[1] := 'Prima Sim.';

  if chkVerDevengado.Checked then
  begin
    SetLength(CAMPOS_SUMA, Length(CAMPOS_SUMA) + 2);
    CAMPOS_SUMA[high(CAMPOS_SUMA) - 1] := 'Dev.Act';
    CAMPOS_SUMA[high(CAMPOS_SUMA)] := 'Dev.Sim';
  end;

  if chkVerCuota.Checked then
  begin
    SetLength(CAMPOS_SUMA, Length(CAMPOS_SUMA) + 2);
    CAMPOS_SUMA[high(CAMPOS_SUMA) - 1] := 'Cuota Act.';
    CAMPOS_SUMA[high(CAMPOS_SUMA)] := 'Cuota Sim.';
  end;

  SetLength( FTotalConsulta,  High(CAMPOS_SUMA) + 1);

  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
        SumFields( sdqSimulacion, CAMPOS_SUMA, FTotalConsulta );
        CalcularTotales;
        CalcularTotalesRecalculados;
    except
      on E: Exception do
        MessageDlg('Error al Calcular Totales.', mtError, [mbOK], 0);
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.CalcularTotales;
var
  CantidadDiferencias : Integer;
  Diferencias : Currency;
  SaldoPeriodo : Currency;
  CantidadSaldoAcreedor, CantidadSaldoDeudor : integer;
  CantidadSaldoAcreedorSim, CantidadSaldoDeudorSim : integer;
  SumaSaldoAcreedor, SumaSaldoDeudor : Currency;
  SumaSaldoAcreedorSim, SumaSaldoDeudorSim : Currency;
begin
  CantidadDiferencias := 0;
  Diferencias := 0;
  CantidadSaldoAcreedor := 0; CantidadSaldoDeudor := 0;
  CantidadSaldoAcreedorSim := 0; CantidadSaldoDeudorSim := 0;
  SumaSaldoAcreedor := 0; SumaSaldoDeudor := 0;
  SumaSaldoAcreedorSim := 0; SumaSaldoDeudorSim := 0;

  with sdqSimulacion do
//  with cdsSimulacion do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      if chkVerDevengado.Checked then
      begin
        if (not FieldByName('periodoasimular').IsNull) and
           (FieldByName('Dev.Act.').AsString <>
           FieldByName('Dev.Sim.').AsString) then
        begin
          inc(CantidadDiferencias);
          Diferencias := FieldByName('Dev.Act.').AsCurrency - FieldByName('Dev.Sim.').AsCurrency;

          SaldoPeriodo := FieldByName('Dev.Sim.').AsCurrency - FieldByName('importepagos').AsCurrency;
          if SaldoPeriodo > 0 then
          begin
            inc(CantidadSaldoAcreedorSim);
            SumaSaldoAcreedorSim := SumaSaldoAcreedorSim + SaldoPeriodo;
          end else if SaldoPeriodo < 0 then
          begin
            inc(CantidadSaldoDeudorSim);
            SumaSaldoDeudorSim := SumaSaldoDeudorSim + SaldoPeriodo;
          end;
        end;

        SaldoPeriodo := FieldByName('Dev.Act.').AsCurrency - FieldByName('importepagos').AsCurrency;
        if SaldoPeriodo > 0 then
        begin
          inc(CantidadSaldoAcreedor);
          SumaSaldoAcreedor := SumaSaldoAcreedor + SaldoPeriodo;
        end else if SaldoPeriodo < 0 then
        begin
          inc(CantidadSaldoDeudor);
          SumaSaldoDeudor := SumaSaldoDeudor + SaldoPeriodo;
        end;
      end;

      next;
    end;
  finally
    EnableControls;

    if chkVerDevengado.Checked then
    begin
      edtPeriodosConDiferencias.Value := CantidadDiferencias;
      edtDiferenciaEmision.Value      := Diferencias;
      edtCantidadAcreedores.Text     := InttoStr(CantidadSaldoAcreedor) + ' / ' + InttoStr(CantidadSaldoAcreedorSim);
      edtCantidadDeudores.Text       := InttoStr(CantidadSaldoDeudor)  + ' / ' + InttoStr(CantidadSaldoDeudorSim);
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.CalcularTotalesRecalculados;
var
  b: TBookmark;
  CantidadRecalculos  : Integer;
begin
  CantidadRecalculos  := 0;
  with sdqPeriodos do
  try
    if dbgPeriodos.DataSource.DataSet.Active and not dbgPeriodos.DataSource.DataSet.IsEmpty then
    begin
      b := dbgPeriodos.DataSource.DataSet.GetBookmark;

      DisableControls;
      First;
      while not Eof do
      begin
        if (not FieldByName('Período Simulación').IsNull) then
          inc(CantidadRecalculos);

        Next;
      end;
    end;
  finally
    EnableControls;
    try
      if Assigned(b) then
      begin
        dbgPeriodos.DataSource.DataSet.GotoBookmark(b);
        dbgPeriodos.DataSource.DataSet.FreeBookmark(b);
      end;
    except
    end;
    edtPeriodosAfectados.Value := CantidadRecalculos;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.tbNominaClick(Sender: TObject);
begin
  with TfrmDeclaracionesPresentadas.Create(self) do
  try
    if sdqPeriodos.RecordCount > 0 then
     MostrarDeclaraciones(sdqPeriodos.FieldByName('cuit').AsString);
  finally
    free;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TFrmSimulacion.lblVerNominasAnterioresClick(Sender: TObject);
begin
  //FIXME.. mostrar anteriores del período solamente y no todas.
  with TfrmDeclaracionesPresentadas.Create(self) do
  try
     MostrarDeclaraciones(sdqPeriodos.FieldByName('cuit').AsString);
  finally
    free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.lblDetallePresentacionClick(Sender: TObject);
begin
  if sdqPeriodos.RecordCount > 0 then
    VerDetalleNominaSeleccionada(sdqPeriodos.FieldByName('IDDDJJ').AsInteger, sdqPeriodos.FieldByName('Contrato').AsInteger)
  else MessageDlg('Debe seleccionar un período', mtInformation, [mbOK], 0);
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.fpImportacionNominaShow(Sender: TObject);
begin
  btnBorrar.Visible := mdContenido.RecordCount > 0;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.btnBorrarClick(Sender: TObject);
begin
  mdContenido.EmptyTable;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.sdqPeriodosAfterScroll(DataSet: TDataSet);
begin
  CargarFuentesCalculos;
  MoverRegistroSimulacion;
  CalcularMovimientosPeriodo;
  MostrarMotivoRecalculo;
  CargarPresentaciones;
(*
  CargarFuentesCalculos;
  MoverRegistroSimulacion;
  CalcularMovimientosPeriodo;
  MostrarMotivoRecalculo;
*)
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.MoverRegistroSimulacion;
begin
//  if sdqSimulacion.Active then
//     sdqSimulacion.Locate('Período',cdsPeriodos.FieldByName('Periodo').Value,[]);
  if sdqSimulacion.Active then
     sdqSimulacion.Locate('Período',sdqPeriodos.FieldByName('Periodo').Value,[]);
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.CalcularMovimientosPeriodo;
begin
  if pgSimulacion.ActivePageIndex = PAG_MOVIMIENTOS then
  begin
    cdsMovimientosSimulados.Close;
    if sdqMovimientosActual.Active then sdqMovimientosActual.Close;
    sdqMovimientosActual.ParamByName('contrato').AsInteger :=
                                  sdqPeriodos.FieldByName('Contrato').AsInteger;
//                                  sdqPeriodos.FieldByName('Contrato').AsInteger;
    sdqMovimientosActual.ParamByName('periodo').AsString :=
                                  sdqPeriodos.FieldByName('Periodo').AsString;
//                                  sdqPeriodos.FieldByName('Periodo').AsString;
    sdqMovimientosActual.Open;
//    CompletarResumenMovimiento(cdsPeriodos.FieldByName('Contrato').AsInteger ,cdsPeriodos.FieldByName('Periodo').AsString);
    CompletarResumenMovimiento(sdqPeriodos.FieldByName('Contrato').AsInteger ,sdqPeriodos.FieldByName('Periodo').AsString);
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.CalcularDiferencias;
begin
////  IniciarEspera('Calculando diferencias..');
  try
    sdqDiferencias.DisableControls;
    sdqDiferencias.close;
    if (pgSimulacion.ActivePage = tsDiferencias) and
//       (cdsPeriodos.RecordCount > 0)  then
       (sdqPeriodos.RecordCount > 0)  then
    begin
//      sdqDiferencias.ParamByName('contrato').AsInteger := cdsPeriodos.FieldByName('Contrato').AsInteger;
//      sdqDiferencias.open;
      sdqDiferencias.ParamByName('contrato').AsInteger := sdqPeriodos.FieldByName('Contrato').AsInteger;
      sdqDiferencias.open;
    end;
  finally
    sdqDiferencias.EnableControls;
////    DetenerEspera;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.CargarDatosTarifa(contrato : integer; periodo : string);
var
 porcmasa, sumafija : real;
 fechaendoso, fechavigencia : TDate;
begin
  porcmasa := 0; sumafija := 0; fechaendoso := 0; fechavigencia := 0;
  get_tarifavigente(contrato, periodo, porcmasa, sumafija, fechaendoso, fechavigencia);
  if fechaendoso > 0 then
  begin
    edtFijaVigente.Value := sumafija;
    edtVariableVigente.Value := porcmasa;
    edtFechaVigenciaTarifaVigente.Date := fechavigencia;
    edtFechaTarifaVigencia.Date := fechaendoso;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.CargarDatosTarifaOriginal(IdEndoso : Integer);
var
 porcmasa, sumafija : real;
 fechaendoso, fechavigencia : TDate;
begin
  porcmasa := 0; sumafija := 0; fechaendoso := 0; fechavigencia := 0;
  get_tarifavigente(idendoso, porcmasa, sumafija, fechaendoso, fechavigencia);
  if fechaendoso > 0 then
  begin
    edtSumaFija.Value := sumafija;
    edtPorcentajeMasa.Value := porcmasa;
    edtFechaTarifa.Date := fechavigencia;
    edtVigenciaTarifa.Date := fechaendoso;
  end;
end;

{------------------------------------------------------------------------------}
procedure TFrmSimulacion.CargarFuentesCalculos;
begin
  LimpiarFuenteCalculo;
  LimpiarTarifaVigente;
  LimpiarFuenteCalculoSimulado;

  if (pgSimulacion.ActivePage = tsFuentesCalculo) and
//     (cdsPeriodos.RecordCount > 0)  then
     (sdqPeriodos.RecordCount > 0)  then
  begin

//    CargarDatosTarifa(cdsPeriodos.FieldByName('Contrato').AsInteger,
//                      cdsPeriodos.FieldByName('Periodo').AsString);

    CargarDatosTarifa(sdqPeriodos.FieldByName('Contrato').AsInteger,
                      sdqPeriodos.FieldByName('Periodo').AsString);

    CargarFuenteCalculo(
//           cdsPeriodos.FieldByName('Cuit').AsString,
//           cdsPeriodos.FieldByName('Periodo').AsString,
//           cdsPeriodos.FieldByName('IDDDJJ').AsInteger);
           sdqPeriodos.FieldByName('Cuit').AsString,
           sdqPeriodos.FieldByName('Periodo').AsString,
           sdqPeriodos.FieldByName('IDDDJJ').AsInteger);

//    CargarDatosTarifaOriginal(cdsPeriodos.FieldByName('idendoso').AsInteger);
    CargarDatosTarifaOriginal(sdqPeriodos.FieldByName('idendoso').AsInteger);


    if sdqPeriodos.FieldByName('Período Simulación').AsString <> '' then
//    if cdsPeriodos.FieldByName('Período Simulación').AsString <> '' then
    begin
       CargarFuenteCalculoSimulado(
//           cdsPeriodos.FieldByName('Cuit').AsString,
//           cdsPeriodos.FieldByName('Periodo').AsString,
//           cdsPeriodos.FieldByName('IDDDJJSIMULAR').AsInteger);
          sdqPeriodos.FieldByName('Cuit').AsString,
           sdqPeriodos.FieldByName('Periodo').AsString);
//          sdqPeriodos.FieldByName('IDDDJJSIMULAR').AsInteger);


       gbSimulada.Visible := true;

    end else gbSimulada.Visible := false;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.LimpiarTarifaVigente;
begin
  edtFijaVigente.Clear;
  edtVariableVigente.Clear;
  edtFechaTarifaVigencia.Clear;
  edtFechaVigenciaTarifaVigente.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.LimpiarFuenteCalculo;
begin
  edtOrigen.Clear;
  edtFormulario.Clear;
  edtMasa.Clear;
  edtTrabajadores.Clear;
  edtMasaCero.Visible := False;
  lblMasaCero.Visible := False;
  edtMasaCero.Clear;
  edtSumaFija.Clear;
  edtPorcentajeMasa.Clear;
  edtFechaTarifa.Clear;
  edtVigenciaTarifa.Clear;

  edtOrigenRecalculo.Clear;
  edtFormularioRecalculo.Clear;
  edtMasaRecalculo.Clear;
  edtTrabajadoresRecalculo.Clear;

  lblTipo.Caption := '';
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.CargarFuenteCalculo(ACuit, APeriodo : string; AIdDDJJ : integer);
begin
  LimpiarFuenteCalculo;
  with TPresentacion.Create(ACuit, APeriodo, AIdDDJJ) do
  try
    if Presentacion.RecordCount > 0 then
    begin
      edtOrigen.Text := Presentacion.FieldByName('Origen').AsString;
      edtFormulario.Text := Presentacion.FieldByName('Formulario').AsString;
//FIXME.. completar este campo que cambio de tabla.
//      edtFechaIngreso.Date := Presentacion.FieldByName('F.Ingreso').AsDateTime;
      edtMasa.Value := Presentacion.FieldByName('Masa Salarial').AsCurrency;
      edtTrabajadores.Value := Presentacion.FieldByName('Empleados').AsInteger;

      edtMasaCero.Visible := Presentacion.FieldByName('Sueldo Cero').AsInteger = 0;
      lblMasaCero.Visible := Presentacion.FieldByName('Sueldo Cero').AsInteger = 0;
      edtMasaCero.Value := Presentacion.FieldByName('Sueldo Cero').AsInteger;
      lblTipo.Caption := Presentacion.FieldByName('Rectificativa').AsString;
    end;
  finally
    Presentacion.Close;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.LimpiarFuenteCalculoSimulado;
begin
  edtOrigenRecalculo.Clear;
  edtFormularioRecalculo.Clear;
  edtMasaRecalculo.Clear;
  edtTrabajadoresRecalculo.Clear;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.CargarFuenteCalculoSimulado(ACuit, APeriodo : string);
var
 Q : TSDQuery;
begin
  Q := GetQuery(' SELECT ddjj.ds_masasalarial "Masa Salarial", ddjj.ds_empleados "Empleados", ddjj.ds_importescero, ' +
                ' ddjj.ds_idddjj, ddjj.ds_simulada, ion.on_descripcion "Origen", itf.tf_descripcion "Formulario" ' +
                ' FROM emi.ids_ddjjsimulada ddjj, emi.ids_devengadosimulacion desim, ' +
                ' emi.ion_origennomina ion, emi.itf_tipoformulario itf '+
                ' WHERE ddjj.ds_idddjj = desim.ds_idddjj ' +
                ' AND ddjj.ds_cuit = ' + SqlValue(ACuit) +
                ' AND ddjj.ds_periodo = ' + SqlValue(APeriodo) +
                ' AND ddjj.ds_idorigennomina = ion.on_id ' +
                ' AND ddjj.ds_idformulario = itf.tf_id ');

  try
      if (Q.RecordCount > 0) and (Q.FieldByName('ds_simulada').AsString = 'S') then
      begin
        edtOrigenRecalculo.Text := Q.FieldByName('Origen').AsString;
        edtFormularioRecalculo.Text := Q.FieldByName('Formulario').AsString;
//FIXME.. completar este campo que cambio de tabla.
//              edtFechaIngresoRecalculo.Date := Presentacion.FieldByName('F.Ingreso').AsDateTime;
        edtMasaRecalculo.Value := Q.FieldByName('Masa Salarial').AsCurrency;
        edtTrabajadoresRecalculo.Value := Q.FieldByName('Empleados').AsInteger;
      end;

(*
        edtOrigenRecalculo.Text := 'Simulación';
        edtFormularioRecalculo.Text := 'Diskette';
        edtFechaIngresoRecalculo.Date := DBDate;
        edtMasaRecalculo.Value := Q.FieldByName('ds_masasalarial').AsCurrency;
        edtTrabajadoresRecalculo.Value := Q.FieldByName('ds_empleados').AsInteger;
        lblVerDetalle.Visible := false;
      end
      else
      begin
          with TPresentacion.Create(ACuit, APeriodo, AIdDDJJ) do
          try
            if Presentacion.RecordCount > 0 then
            begin
              edtOrigenRecalculo.Text := Presentacion.FieldByName('Origen').AsString;
              edtFormularioRecalculo.Text := Presentacion.FieldByName('Formulario').AsString;
//FIXME.. completar este campo que cambio de tabla.
//              edtFechaIngresoRecalculo.Date := Presentacion.FieldByName('F.Ingreso').AsDateTime;
              edtMasaRecalculo.Value := Presentacion.FieldByName('Masa Salarial').AsCurrency;
              edtTrabajadoresRecalculo.Value := Presentacion.FieldByName('Empleados').AsInteger;
              lblVerDetalle.Visible := true;
            end;
          finally
            Free
          end;
     end;
*)
  finally
     Q.Free;
  end;
(*
  Q := GetQuery('SELECT irs.rs_masa, irs.rs_trabajadores, irs.rs_nominasencero,  ' +
                ' irs.rs_idddjj, irs.rs_origen ' +
                '  FROM emi.irs_resumennominasimulada irs ' +
                ' WHERE rs_Cuit = ' + SqlValue(ACuit) + '  AND rs_Period = ' + SqlValue(APeriodo));
  try
      if (Q.RecordCount > 0) and (Q.FieldByName('rs_origen').AsString = 'S') then
      begin
        edtOrigenRecalculo.Text := 'Simulación';
        edtFormularioRecalculo.Text := 'Diskette';
        edtFechaIngresoRecalculo.Date := DBDate;
        edtMasaRecalculo.Value := Q.FieldByName('rs_masa').AsCurrency;
        edtTrabajadoresRecalculo.Value := Q.FieldByName('rs_trabajadores').AsInteger;
        lblVerDetalle.Visible := false;
      end
      else
      begin
          with TPresentacion.Create(ACuit, APeriodo, AIdDDJJ) do
          try
            if Presentacion.RecordCount > 0 then
            begin
              edtOrigenRecalculo.Text := Presentacion.FieldByName('Origen').AsString;
              edtFormularioRecalculo.Text := Presentacion.FieldByName('Formulario').AsString;
//FIXME.. completar este campo que cambio de tabla.
//              edtFechaIngresoRecalculo.Date := Presentacion.FieldByName('F.Ingreso').AsDateTime;
              edtMasaRecalculo.Value := Presentacion.FieldByName('Masa Salarial').AsCurrency;
              edtTrabajadoresRecalculo.Value := Presentacion.FieldByName('Empleados').AsInteger;
              lblVerDetalle.Visible := true;
            end;
          finally
            Free
          end;
     end;
  finally
     Q.Free;
  end;
*)
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.dbgSimulacionGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  SetearColoresDiferencias(Sender, Field, AFont, Background, Highlight);
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.QueryPrintGetCellParams(Sender: TObject;
  Field: TPrintField; var AText: String; var AFont: TFont;
  var ABackground: TColor; var AAlignment: TAlignment);
begin
  SetearColoresDiferencias(sender,Field.Field, Afont, ABackground, false);
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.pgSimulacionChange(Sender: TObject);
begin
  CargarFuentesCalculos;
  CalcularMovimientosPeriodo;
  CalcularDiferencias;
  CargarPresentaciones
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.tbImprimirClick(Sender: TObject);
begin
  PrintResults;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.PrintResults;
Var AutoCols : Boolean;
begin
  tbImprimir.Enabled := False;
  Try
     if Assigned(QueryPrint) and QueryPrint.DataSource.DataSet.Active and
        (not QueryPrint.DataSource.DataSet.IsEmpty) and PrintDialog.Execute Then begin
        AutoCols := QueryPrint.Fields.Count = 0;
        try
          if AutoCols Then
             QueryPrint.SetGridColumns(dbgSimulacion, True, [baDetail, baHeader, baTotal, baSubTotal] );

          if QueryPrint.Title.Text = '' Then
             QueryPrint.Title.Text := Caption;

          QueryPrint.Print ;
        finally
          if AutoCols Then
             QueryPrint.Fields.Clear ;
        end;
     end;
  finally
     tbImprimir.Enabled := True; 
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.tbExportarClick(Sender: TObject);
Var
  AutoCols : Boolean;
begin
  if QueryPrint.DataSource.DataSet.Active and (not QueryPrint.DataSource.DataSet.IsEmpty) then begin
     tbExportar.Enabled := False;
     Try
       AutoCols := ExportDialog.Fields.Count = 0;
       try
         if AutoCols Then
           ExportDialog.Fields.Assign( dbgSimulacion.Columns );

         ExportDialog.Execute ;
       finally
         if AutoCols Then
            ExportDialog.Fields.Clear ;
       end;
     Finally
       tbExportar.Enabled := True;
     End;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Salir;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.dbgSimulacionPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var
 iPos : integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA );
  if (iPos > -1) and (iPos <= High(CAMPOS_SUMA)) then
    Value := CurrToStr(FTotalConsulta[iPos]);
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.tbLimpiarClick(Sender: TObject);
begin
  FContrato := -1;
  Do_InicializarSimulacion;
  Limpiar;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.HabilitarBotones;
begin
  tbNomina.Enabled := true;
  tbRestringir.Enabled := true;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.DesHabilitarBotones;
begin
  tbNomina.Enabled := false;
  tbRestringir.Enabled := false;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.chkVerDevengadoClick(Sender: TObject);
begin
  SetearInterfazDevengadoCuota(chkVerDevengado.Checked);
end;
{------------------------------------------------------------------------------}
function TFrmSimulacion.PeriodoCalculado(APeriodo : String) : boolean;
var
 i : integer;
begin
  result := false;
  for i := 0 to high(PeriodosCalculados) do
  if PeriodosCalculados[i] = APeriodo then
  begin
      result := true;
      exit;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.AgregarPeriodoCalculado(APeriodo : String);
begin
  if not PeriodoCalculado(APeriodo) then
  begin
    SetLength(PeriodosCalculados, length(PeriodosCalculados) + 1);
    PeriodosCalculados[high(PeriodosCalculados)] := APeriodo;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.SetearInterfazDevengadoCuota(
  ADevengadoCuota: Boolean);
begin
  tsMovimientos.TabVisible := ADevengadoCuota;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrmSimulacion.SetearColoresDiferencias(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  with Field.DataSet do
  begin
//    if FieldByName('dj_idusuada').AsInteger <> FieldByName('IdDDJJSimular').AsInteger then
    if not FieldByName('periodoasimular').IsNull then
    begin
      if not IsEmptyString(FPeriodoDesde) and
         not IsEmptyString(FPeriodoHasta) then
        if (FieldByName('Período').AsString >= FPeriodoDesde) and
           (FieldByName('Período').AsString <= FPeriodoHasta) and
           (FieldByName('Estado').AsString = 'P' )
           then
              AFont.Style := [fsBold]
        else  AFont.Style := [];

(*
      if (FieldByName('Prima Sim').AsString <> '') and
         (FieldByName('Prima').AsString  <>
         FieldByName('Prima Sim').AsString) then
      begin
        if Highlight Then
          Background := clTeal
        else
          Background := $00FFCEE7;//$00E1FFFF;
      end;
*)
//      if  (FieldByName('Dev.Sim.').AsString <> '') and
//      if (FieldByName('Dev.Sim.').AsInteger <> 0) and
      if (not FieldByName('Dev.Sim.').IsNull) and
         (FieldByName('Dev.Sim.').AsString  <>
          FieldByName('Dev.Act.').AsString) then
      begin
        if Highlight Then
          Background := clTeal
        else
          Background := $00E1FFFF;
      end;

      if chkVerCuota.Checked then
      begin
//        if (FieldByName('Cuota Sim.').AsString <> '') and
//        if (FieldByName('Cuota Sim.').AsInteger <> 0) and
        if (not FieldByName('Cuota Sim.').IsNull) and
           (FieldByName('Cuota Sim.').AsString  <>
           FieldByName('Cuota Act.').AsString) then
        begin
          if Highlight Then
            Background := clTeal
          else
            Background := $00C1D6FF;//$00FFCEE7;
        end;
      end;

      if chkVerDevengado.Checked then
      begin
//        if (FieldByName('Dev.Sim.').AsString <> '') and
//        if (FieldByName('Dev.Sim.').AsInteger <> 0) and
        if (not FieldByName('Dev.Sim.').IsNull) and
           ((FieldByName('Dev.Sim.').AsCurrency - FieldByName('importepagos').AsCurrency) > 0) then
        begin
          if Highlight Then
             AFont.Color := $00CCCCFF
          else AFont.Color := clRed;
        end
        else begin
//          if (FieldByName('Dev.Sim.').AsString <> '') and
//          if (FieldByName('Dev.Sim.').AsInteger <> 0) and
          if (not FieldByName('Dev.Sim.').IsNull) and
             ((FieldByName('Dev.Sim.').AsCurrency - FieldByName('importepagos').AsCurrency) < 0) then
            if Highlight Then
              AFont.Color := $00D5FFD5
            else AFont.Color := clGreen;
        end;
      end;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.MostrarAprobacion;
var
  PeriodoDesde, PeriodoHasta : string;
begin
  edtFechaAprobacion.Date := DBDate;
  mObservacionesAprobacion.Text := '';
  SeleccionDesdeHasta(dbgPeriodos, 'periodo', PeriodoDesde, PeriodoHasta);

  ppDesde.Text := PeriodoDesde;
  ppHasta.Text := PeriodoHasta;
  fpAprobacionRecalculo.ShowModal;
end;
{-------------------------------------------------------------------------------}
function TFrmSimulacion.VerificarPeriodos : boolean;
var
 ok : boolean;
 i : integer;
begin
  ok := true;
  if (FPeriodoDesde = '') or
     (FPeriodoHasta = '') then
     ok := true
  else
  begin
    for i := 0 to dbgSimulacion.SelectedRows.Count - 1 do
    begin
      sdqSimulacion.GotoBookmark(pointer(dbgSimulacion.SelectedRows.Items[i]));
//      cdsSimulacion.GotoBookmark(pointer(dbgSimulacion.SelectedRows.Items[i]));
      if (sdqSimulacion.FieldByName('Período').AsString < FPeriodoDesde) or
         (sdqSimulacion.FieldByName('Período').AsString > FPeriodoHasta) then
//      if (cdsSimulacion.FieldByName('Período').AsString < FPeriodoDesde) or
//         (cdsSimulacion.FieldByName('Período').AsString > FPeriodoHasta) then
      begin
        if (MessageDlg('Autorizando recálculo más allá de lo especificado. ¿Confirma la aplicación?',
              mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        begin
          ok := false;
          break;
        end;
      end;
    end;
  end;

  result := ok;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.AprobarRecalculo(AAprobar : boolean);
var
 i : integer;
// IdProceso : integer;
 PeriodoDesde, PeriodoHasta : string;
 IdNivelRequerido : integer;
 IdAutorizacion   : integer;
begin
  SeleccionDesdeHasta(dbgPeriodos, 'periodo', PeriodoDesde, PeriodoHasta);

  IdNivelRequerido := get_nivelrequeridorecalculo(
                              FContrato,
                              PeriodoDesde, PeriodoHasta);

  if IdNivelRequerido > FNivelUsuario then
  begin
    MessageBox(0, 'Nivel de aprobación insuficiente.', 'Aprobación de Solicitud', MB_ICONERROR or MB_OK);
    exit;
  end;

  VerificarMultiple(['Aprobando Períodos',
       mObservacionesAprobacion, Not IsEmptyString(mObservacionesAprobacion.Text),
       'Debe escribir una observación de la operación']);


  sdqPeriodos.DisableControls;
  try
    //FIXME.. el tipo de proceso no es 1.
    get_generarproceso(1, 'F', 0, mObservacionesAprobacion.Text);
    for i := 0 to dbgPeriodos.SelectedRows.Count - 1 do
    begin
      sdqPeriodos.GotoBookmark(pointer(dbgPeriodos.SelectedRows.Items[i]));
      IdAutorizacion := do_generarautorizacionperiodo(
                           sdqPeriodos.FieldByName('Contrato').AsInteger,
                           sdqPeriodos.FieldByName('Periodo').AsString, 1, 1,
                           TIPOAUTORIZACION_RECALCULOVOLUNTAD);
      //Esta función es la genera el devengado.
      do_aprobarsolicitud(IdAutorizacion, sdqPeriodos.FieldByName('Periodo').AsString, AAprobar, 0, mObservacionesAprobacion.Text);
    end;
  finally
    sdqPeriodos.EnableControls;
  end;

  fpAprobacionRecalculo.Close;
  if FEnAprobacion then self.close;
  
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.btnAceptarAprobacionClick(Sender: TObject);
begin
  AprobarRecalculo(True);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.btnNoautorizarClick(Sender: TObject);
begin
  AprobarRecalculo(False);
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.btnCancelarAprobacionClick(Sender: TObject);
begin
  fpAprobacionRecalculo.Close;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.tbAplicarRedevengadoClick(Sender: TObject);
begin
  Verificar(dbgPeriodos.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un movimiento.');
  if VerificarPeriodos then
  begin
      MostrarAprobacion;
  end;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.pnSimulacionResize(Sender: TObject);
begin
  pnSimulacion.visible := not (pnSimulacion.width < 100);
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.fraInfoEmpresalblAdic_5Click(Sender: TObject);
begin
  fraInfoEmpresa.CargarAdicionales(Sender);
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.splitterMinimize(Sender: TObject);
begin
  pnSimulacion.Visible := false;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.splitterMaximize(Sender: TObject);
begin
  pnSimulacion.Visible := true;
end;
{------------------------------------------------------------------------------}
procedure TFrmSimulacion.tbRefrescarSimulacionClick(Sender: TObject);
begin

  if sdqPeriodos.Active and not sdqPeriodos.IsEmpty then
  begin
    if (sdqPeriodos.FieldByName('COBERTURA').AsString = 'Sin Cobertura') then
    begin
      MessageDlg('No se puede simular en períodos sin cobertura.', mtError, [mbOK], 0);
      Exit;
    end;
  end;
////  IniciarEspera('Simulando movimientos...');
  BeginTrans(true);
  try
//    Do_GenerarDevengadoSimulado(sdqPeriodos.FieldByName('Contrato').AsInteger,
//                                sdqPeriodos.FieldByName('Periodo').AsString, cdsMovimientosSimulados);
//    CompletarResumenMovimientoSimulado(sdqPeriodos.FieldByName('Contrato').AsInteger,
//                                       sdqPeriodos.FieldByName('Periodo').AsString);

//    IniciarEspera('Simulando emisión...');

    cdsRecepcionesSim.Open;
    while not cdsRecepcionesSim.Eof do
    begin
      if (cdsRecepcionesSim.FieldByName('ds_accion').AsString <> SIMULACION_ACCION_RECHAZO) then
      begin
        if (cdsRecepcionesSim.FieldByName('ds_accion').AsString <> SIMULACION_ACCION_MODIF) then
        begin

          if (cdsRecepcionesSim.FieldByName('ds_accion').AsString = SIMULACION_ACCION_ALTA) then
            do_incorporardeclaracionsim(cdsRecepcionesSim.FieldByName('ds_contrato').AsInteger,
                                        cdsRecepcionesSim.FieldByName('ds_periodo').AsString,
                                        cdsRecepcionesSim.FieldByName('ds_empleados').AsInteger,
                                        cdsRecepcionesSim.FieldByName('ds_masasalarial').AsFloat,
                                        cdsRecepcionesSim.FieldByName('ds_importescero').AsInteger,
                                        cdsRecepcionesSim.FieldByName('ds_idformulario').AsInteger,
                                        cdsRecepcionesSim.FieldByName('ds_idtiponomina').AsInteger,
                                        cdsRecepcionesSim.FieldByName('ds_codigorectificativa').AsString,
                                        cdsRecepcionesSim.FieldByName('ds_masadeclarada').AsFloat,
                                        cdsRecepcionesSim.FieldByName('ds_empleadosdeclarados').AsInteger,
                                        cdsRecepcionesSim.FieldByName('ds_importescerodeclarados').AsInteger,
                                        cdsRecepcionesSim.FieldByName('ds_fechapresentacion').AsDateTime,
                                        cdsRecepcionesSim.FieldByName('ds_fechapresentacion').AsDateTime);

          do_activardeclaracionsim(cdsRecepcionesSim.FieldByName('ds_contrato').AsInteger,
                                   cdsRecepcionesSim.FieldByName('ds_periodo').AsString);
        end;
      end
      else begin
//        if (cdsRecepcionesSim.FieldByName('ds_simulada').AsString <> 'S') then
//        begin
          do_invalidarpresentacionsim(cdsRecepcionesSim.FieldByName('ds_idddjj').AsInteger);
          do_activardeclaracionsim(cdsRecepcionesSim.FieldByName('ds_contrato').AsInteger,
                                   cdsRecepcionesSim.FieldByName('ds_periodo').AsString);
//        end;
      end;
      cdsRecepcionesSim.Next;
    end;

    Do_GenerarDevengadoSimulado(sdqPeriodos.FieldByName('Contrato').AsInteger,
                                sdqPeriodos.FieldByName('Periodo').AsString, cdsMovimientosSimulados);

    CompletarResumenMovimientoSimulado(sdqPeriodos.FieldByName('Contrato').AsInteger,
                                       sdqPeriodos.FieldByName('Periodo').AsString);
  finally
    // Siempre se revierte al llamar a este procedimiento para que no queder
    // reflejado el recálculo
    Rollback(true);
    cdsRecepcionesSim.EmptyDataset;
    cdsRecepcionesSim.Close;
////    DetenerEspera;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.dbgMovimientosSimuladosGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if cdsMovimientosSimulados.FieldByName('mo_origen').AsString = 'S' then
    BackGround := $00FFDFDF;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.CompletarResumenMovimiento(Contrato : Integer; Periodo : String);
var
 Q : TSDQuery;
begin
  Q := GetQuery('select * from zrc_resumencobranza where rc_contrato = ' + SqlValue(Contrato) + ' and rc_periodo = ' + SqlValue(Periodo));
  try
    if Q.RecordCount > 0 then
    begin
      edtDevengadoCuota.Text := Q.FieldByName('RC_DEVENGADOCUOTA').AsString;
      edtDevengadoFondo.Text := Q.FieldByName('RC_DEVENGADOFONDO').AsString;
      edtDevengadoInteres.Text := Q.FieldByName('RC_DEVENGADOINTERES').AsString;
      edtDevengadoOtros.Text := Q.FieldByName('RC_DEVENGADOOTROS').AsString;
    end;
  finally
    Q.Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.CompletarResumenMovimientoSimulado(Contrato : Integer; Periodo : String);
var
 Q : TSDQuery;
begin



  Q := GetQuery('select * from emi.ids_devengadosimulacion where ds_contrato = ' + SqlValue(Contrato) + ' and ds_periodo = ' + SqlValue(Periodo));
  try
    if Q.RecordCount > 0 then
    begin
      edtDevengadoCuotaRecalculo.Text   := Q.FieldByName('DS_DEVENGADOCUOTA').AsString;
      edtDevengadoFondoRecalculo.Text   := Q.FieldByName('DS_DEVENGADOFONDO').AsString;
      edtDevengadoInteresRecalculo.Text := Q.FieldByName('DS_DEVENGADOINTERES').AsString;
      edtDevengadoOtrosRecalculo.Text   := Q.FieldByName('DS_DEVENGADOOTROS').AsString;
    end;
  finally
    Q.Free;
  end;

(*
  Q := GetQuery('select * from emi.irc_resumencobranzasimulacion where rc_contrato = ' + SqlValue(Contrato) + ' and rc_periodo = ' + SqlValue(Periodo));
  try
    if Q.RecordCount > 0 then
    begin
      edtDevengadoCuotaRecalculo.Text   := Q.FieldByName('RC_DEVENGADOCUOTA').AsString;
      edtDevengadoFondoRecalculo.Text   := Q.FieldByName('RC_DEVENGADOFONDO').AsString;
      edtDevengadoInteresRecalculo.Text := Q.FieldByName('RC_DEVENGADOINTERES').AsString;
      edtDevengadoOtrosRecalculo.Text   := Q.FieldByName('RC_DEVENGADOOTROS').AsString;
    end;
  finally
    Q.Free;
  end;
*)
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.dbgPeriodosCellClick(Column: TColumn);
begin
  MostrarNivelRequerido;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.dbgPeriodosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MostrarNivelRequerido;
end;
{-------------------------------------------------------------------------------}
procedure TFrmSimulacion.MostrarMotivoRecalculo;
begin
  lblMotivoRecalculo.Caption := ObtenerMotivoRecalculo
end;
{-------------------------------------------------------------------------------}
function TFrmSimulacion.ObtenerMotivoRecalculo : string;
var
 descripcion : string;
begin
  descripcion := '';
  if sdqPeriodos.Active and (sdqPeriodos.RecordCount > 0) then
  begin
//    if sdqPeriodos.FieldByName('DECLARACIONUSADA').AsString <>
//       sdqPeriodos.FieldByName('DECLARACIONAUSAR').AsString then
    if ExisteSql('SELECT 1 FROM emi.ids_ddjjsimulada WHERE DS_CONTRATO = ' + SqlValue(fraContratoASimular.Contrato) +
                 ' AND DS_PERIODO = ' +  SqlValue(sdqPeriodos.FieldByName('periodo').AsString))
    then
    begin
       descripcion := 'Cambio de Nómina.';
    end;

    if sdqPeriodos.FieldByName('ENDOSOAUSAR').AsString <>
       sdqPeriodos.FieldByName('ENDOSOUSADO').AsString then
    begin
      if descripcion = '' then
       descripcion := 'Cambio de Tarifa.'
      else
       descripcion := descripcion + #13#10 + 'Cambio de Tarifa';
    end;

    if sdqPeriodos.FieldByName('Período Simulación').AsString <> '' then
    begin
      if descripcion = '' then
       descripcion := 'Simula otra declaración.'
      else
       descripcion := descripcion + #13#10 + 'Simula otra declaración.';
    end;

    if (sdqPeriodos.FieldByName('ANTERIORPREVISTO').AsString <>
       sdqPeriodos.FieldByName('ACTUALPREVISTO').AsString) and
       (descripcion = '') then
    begin
       descripcion := 'Cambio de Importe.';
    end;

  end;

  result := descripcion;
end;


(*
procedure TFrmSimulacion.cdsPeriodosAfterScroll(DataSet: TDataSet);
begin
  CargarFuentesCalculos;
  MoverRegistroSimulacion;
  CalcularMovimientosPeriodo;
  MostrarMotivoRecalculo;
  CargarPresentaciones;
end;
*)

procedure TFrmSimulacion.tbNuevaNominaClick(Sender: TObject);
begin
  if sdqPeriodos.Active and not sdqPeriodos.IsEmpty then
  begin
    if (sdqPeriodos.FieldByName('COBERTURA').AsString = 'Sin Cobertura') then
    begin
      MessageDlg('No se puede simular en períodos sin cobertura.', mtError, [mbOK], 0);
      Exit;
    end;
    LimpiarFormularioIndividual;
    fraEmpresa.Contrato := fraContratoASimular.Contrato;
  //  if sdqPeriodos.Active then
    ppPeriodoPresentacion.Periodo.Valor := sdqPeriodos.FieldByName('periodo').AsString;
    fpFormularioIndividual.ShowModal;
 end;
end;

procedure TFrmSimulacion.tbSimularClick(Sender: TObject);
begin
  do_initsimulaciondevengado;
  BeginTrans(true);
////  IniciarEspera('Simulando emisión...');

  try
    try
      cdsRecepcionesSim.Open;
      while not cdsRecepcionesSim.Eof do
      begin
//        if (cdsRecepcionesSim.FieldByName('ds_simulada').AsString = 'N') then
//        begin
          if (cdsRecepcionesSim.FieldByName('ds_accion').AsString <> SIMULACION_ACCION_RECHAZO) then
          begin

            if (cdsRecepcionesSim.FieldByName('ds_accion').AsString <> SIMULACION_ACCION_MODIF) then
              do_incorporardeclaracionsim(cdsRecepcionesSim.FieldByName('ds_contrato').AsInteger,
                                          cdsRecepcionesSim.FieldByName('ds_periodo').AsString,
                                          cdsRecepcionesSim.FieldByName('ds_empleados').AsInteger,
                                          cdsRecepcionesSim.FieldByName('ds_masasalarial').AsFloat,
                                          cdsRecepcionesSim.FieldByName('ds_importescero').AsInteger,
                                          cdsRecepcionesSim.FieldByName('ds_idformulario').AsInteger,
                                          cdsRecepcionesSim.FieldByName('ds_idtiponomina').AsInteger,
                                          cdsRecepcionesSim.FieldByName('ds_codigorectificativa').AsString,
                                          cdsRecepcionesSim.FieldByName('ds_masadeclarada').AsFloat,
                                          cdsRecepcionesSim.FieldByName('ds_empleadosdeclarados').AsInteger,
                                          cdsRecepcionesSim.FieldByName('ds_importescerodeclarados').AsInteger,
                                          cdsRecepcionesSim.FieldByName('ds_fechapresentacion').AsDateTime,
                                          cdsRecepcionesSim.FieldByName('ds_fechapresentacion').AsDateTime);

            do_activardeclaracionsim(cdsRecepcionesSim.FieldByName('ds_contrato').AsInteger,
                                     cdsRecepcionesSim.FieldByName('ds_periodo').AsString);
          end
          else begin
            do_invalidarpresentacionsim(cdsRecepcionesSim.FieldByName('ds_idddjj').AsInteger);
            do_activardeclaracionsim(cdsRecepcionesSim.FieldByName('ds_contrato').AsInteger,
                                     cdsRecepcionesSim.FieldByName('ds_periodo').AsString);
          end;
//        end;
        cdsRecepcionesSim.Next;
      end;

      do_devengarinvalidcontratosim(fraContratoASimular.Contrato);

      do_actualizardevengadosim(fraContratoASimular.Contrato);

      cdsRecepcionesSim.Refresh;

      sdqDevengadoSim.Params.ParamByName('contrato').Value := fraContratoASimular.Contrato;
      cdsDevengadoSim.Open;
    except
      on E: Exception do
      begin
        Rollback(true);
////        DetenerEspera;
        MessageDlg('Error simular contrato.', mtError, [mbOK], 0);
        Exit;
      end;
    end;
  finally
    // Siempre se revierte al llamar a este procedimiento para que no queder
    // reflejado el recálculo
    Rollback(true);
  end;

  try
    try
      BeginTrans(true);
      Do_generardevengadosim(cdsDevengadoSim);
      Do_actualizarddjjsim(cdsRecepcionesSim);
      CommitTrans(true);
    except
      on E: Exception do
      begin
        Rollback(true);
        MessageDlg('Error simular contrato.', mtError, [mbOK], 0);
      end;
    end;
    MostrarDiferencias;
    CalcTotales;
    CargarPresentaciones;
  finally
    cdsRecepcionesSim.EmptyDataset;
    cdsRecepcionesSim.Close;
    cdsDevengadoSim.Close;
////    DetenerEspera;
  end;
end;

procedure TFrmSimulacion.CargarPresentaciones;
begin
  tbNuevaNomina.Enabled := (pgSimulacion.ActivePage = tbPresentaciones);
  tbMarcarASimular.Enabled := tbNuevaNomina.Enabled;
  tbEliminarNomina.Enabled := tbNuevaNomina.Enabled;

  if (pgSimulacion.ActivePage = tbPresentaciones) and sdqSimulacion.Active then
  begin
    try
      sdqRecepciones.DisableControls;
      sdqRecepciones.close;
      sdqRecepciones.ParamByName('contrato').AsInteger := sdqPeriodos.FieldByName('Contrato').AsInteger;
      sdqRecepciones.ParamByName('periodo').AsString := sdqPeriodos.FieldByName('Periodo').AsString;
      sdqRecepciones.open;
    finally
      sdqRecepciones.EnableControls;
    end;
  end;
end;

procedure TFrmSimulacion.dbgRecepcionesGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not sdqRecepciones.active) or (sdqRecepciones.Recordcount = 0) then exit;

  //Activa---
  if sdqRecepciones.FieldByName('id').AsInteger =
     sdqRecepciones.FieldByName('idddjj_activa').asInteger then
  begin
    if Highlight Then
      Background := clTeal
    else
      Background := $00E1FFFF;
  end;
  //Rechazada --
  if sdqRecepciones.FieldByName('Rechazada').asstring <> 'No' then
    AFont.Color := clRed;

  if sdqRecepciones.FieldByName('ds_simulada').asstring = 'N' then
    Background := $00A4FF82
  else begin
    if sdqRecepciones.FieldByName('ds_simulada').asstring = 'S' then
      Background := $00FFA6D2;
  end;


end;

procedure TFrmSimulacion.btnAceptarFormularioClick(Sender: TObject);
begin

(*
  VerificarMultiple(['Validando Período Individual',
      fraTipoFormulario, fraTipoFormulario.IsSelected, 'Debe seleccionar un formulario',
      fraTipoNomina, fraTipoNomina.IsSelected, 'Debe seleccionar un tipo de nomina',
      ppPeriodoPresentacion, (ppPeriodoPresentacion.Periodo.Valor > '199606'), 'Período Inválido.',
      edtEmpleados, ValidarMasaYPersonal((fraTipoFormulario.FieldValue('SIN_PERSONAL') = 'S'),
           edtEmpleados.Value, edtEmpleadosMasaEnCero.Value,
           edtMasaSalarial.Value),
                             'La especificación de cantidad de empleados y masa para este formulario es incorrecta.']);
*)

  ValidarPeriodoIndividual;

  Do_ActualizaNominaSim(fraEmpresa.Contrato,
     ppPeriodoPresentacion.Text, edtEmpleadosDeclar.Value, edtMasaSalarial.Value,
     edtSalariosEnCeroDeclar.Value, fraTipoFormulario.Value, fraTipoNomina.Value,
     edCodRectificativa.Text,
     edtMasaSalarial.Value, edtEmpleados.Value, edtEmpleadosMasaEnCero.Value,
     edtFechaRecepcionART.Date, edtFechaPresentacion.Date);

  MostrarPeriodos;
  fpFormularioIndividual.Close;

(*
  Do_ActualizaNominaSim(fraEmpresa.Cuit, ppPeriodoPresentacion.Periodo.Valor,
                        fraEmpresa.Contrato,
                        edtMasaSalarial.Value,
                        edtEmpleados.Value,
                        edtEmpleadosMasaEnCero.Value,
                        StrToInt(fraTipoFormulario.Codigo),
                        StrToInt(fraTipoNomina.Codigo));
*)

end;

function TFrmSimulacion.ValidarMasaYPersonal(SinPersonal : boolean; Empleados,
      EmpleadosDeclar, SalariosEnCero : Integer; MasaSalarial, MasaSalarialDeclar : Currency ) : boolean;
begin
  result := ( not  SinPersonal
              and  (Empleados > 0)
              and ((EmpleadosDeclar > 0)
              and  (MasaSalarial > 0)
              and  (MasaSalarialDeclar > 0))
              and  (Empleados > SalariosEnCero)
             )
           or
             (SinPersonal
              and  (Empleados    = 0)
              and ((EmpleadosDeclar = 0)
              and  (MasaSalarial = 0)
              and  (MasaSalarialDeclar = 0))
           );
end;

procedure TFrmSimulacion.LimpiarFormularioIndividual;
begin
  fraEmpresa.clear;
  fraEmpresa.Enabled := true;
  fraEmpresa.ShowBajas := True;

  fraTipoNomina.Clear;
  fraTipoNomina.ShowBajas := false;

  ppPeriodoPresentacion.Enabled := true;
  ppPeriodoPresentacion.Clear;
  ppPeriodoPresentacion.Periodo.MinPeriodo := '199601';

  fraTipoFormulario.Clear;
  edtFechaPresentacion.Clear;
  edtFechaRecepcionART.Clear;

  edCodRectificativa.Value := 0;
  edtNroVerificacion.Value := 0;

  edtEmpleados.Value := 0;
  edtEmpleadosDeclar.Value := 0;
  edtEmpleadosMasaEnCero.Value := 0;
  edtSalariosEnCeroDeclar.Value := 0;
  edtMasaSalarial.Value := 0;
  edtMasaSalarialDeclar.Value := 0;
end;

{------------------------------------------------------------------------------}
function TFrmSimulacion.ValidarPeriodoIndividual: Boolean;
begin
  Result := False;

  VerificarMultiple(['Validando Período Individual',
      fraEmpresa, fraEmpresa.IsSelected, 'Debe seleccionar una empresa.',
      fraTipoFormulario, fraTipoFormulario.IsSelected, 'Debe seleccionar un formulario',
      fraTipoNomina, fraTipoNomina.IsSelected, 'Debe seleccionar un tipo de nomina',
      edtFechaPresentacion, (edtFechaPresentacion.Date > 0), 'Debe Especificar una fecha de presentación',
      edtFechaPresentacion, (edtFechaPresentacion.Date <= DBDate), 'Fecha de presentación no puede establecerse en el futuro.',
      edtFechaRecepcionART, (edtFechaRecepcionART.Date > 0), 'Debe especificar una fecha de presentación',
      edtFechaRecepcionART, (edtFechaRecepcionART.Date >= edtFechaPresentacion.Date),
                             'La Fecha de Recepción ART debe ser anterior a la de presentación',
      edtFechaRecepcionART, edtFechaRecepcionART.Date <= DBDate, 'La Fecha de Presentanción no puede está en el futuro',
//Pablo      ppPeriodoPresentacion, (ppPeriodoPresentacion.Periodo.Valor > '199606'), 'Período Inválido.',
      edtEmpleados, ValidarMasaYPersonal((fraTipoFormulario.FieldValue('SIN_PERSONAL') = 'S'),
           edtEmpleados.Value, edtEmpleadosDeclar.Value, edtEmpleadosMasaEnCero.Value,
           edtMasaSalarial.Value, edtMasaSalarialDeclar.Value),
                             'La especificación de cantidad de empleados y masa para este formulario es incorrecta.',
      edtFechaPresentacion, (ValorSql('SELECT NVL(EMI.UTILES.get_idddjj(' +
                                SqlValue(fraEmpresa.CUIT) + ', ' +
                                SqlValue(ppPeriodoPresentacion.Periodo.Valor) + ',' +
                                SqlDate (edtFechaPresentacion.Date) + '), -1) from dual ') = -1),
                                'Ya existe una nómina para con la misma fecha de presentación.']);
end;
{------------------------------------------------------------------------------}

procedure TFrmSimulacion.btnCopiarClick(Sender: TObject);
begin
  edtEmpleadosDeclar.Text := edtEmpleados.Text;
  edtMasaSalarialDeclar.Text := edtMasaSalarial.Text;
  edtSalariosEnCeroDeclar.Text := edtEmpleadosMasaEnCero.Text;
end;

procedure TFrmSimulacion.tbEliminarNominaClick(Sender: TObject);
begin

  if sdqPeriodos.Active and sdqRecepciones.Active
  and (not sdqRecepciones.IsEmpty) and (not sdqPeriodos.IsEmpty) then
  begin
    if (sdqPeriodos.FieldByName('COBERTURA').AsString = 'Sin Cobertura') then
    begin
      MessageDlg('No se puede simular en períodos sin cobertura.', mtError, [mbOK], 0);
      Exit;
    end;
    if (sdqRecepciones.FieldByName('ds_Simulada').asstring = 'O') then
    begin
      if sdqRecepciones.FieldByName('Rechazada').AsString = 'No' then
      begin
        if (MessageDlg('¿Confirma la invalidación manual de la presentación?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
  ////        IniciarEspera;
          try
            Do_ActualizaInvalidNomSim(sdqRecepciones.FieldByName('Id').AsInteger);
            MostrarPeriodos;
          finally
  ////          DetenerEspera;
          end;
        end;
      end else
         MessageBox(0, 'No se puede invalidar una Presentación Rechazada.',
                       'Invalidar Presentación', MB_ICONWARNING or MB_OK);
    end
    else begin
      if (sdqRecepciones.FieldByName('ds_simulada').asstring = 'N') then
  //       (sdqRecepciones.FieldByName('ds_accion').asstring = SIMULACION_ACCION_RECHAZO) then
      begin
        do_eliminarpresentacionsim(fraEmpresa.Contrato,
                                   sdqRecepciones.FieldByName('Período').AsString,
                                   sdqRecepciones.FieldByName('Fecha Presentación').AsDateTime);
        MostrarPeriodos;
      end;
    end;
  end;
end;

procedure TFrmSimulacion.SimularContrato(AContrato: Integer);
begin
  //fraContratoASimular.Contrato := AContrato;//
  CargarCabecera(AContrato);
  SimularAutorizaciones(AContrato);
end;

procedure TFrmSimulacion.btnCancelarFormularioClick(Sender: TObject);
begin
  fpFormularioIndividual.Close;
end;

procedure TFrmSimulacion.tbMarcarASimularClick(Sender: TObject);
begin
  if sdqPeriodos.Active and sdqRecepciones.Active
  and (not sdqRecepciones.IsEmpty) and (not sdqPeriodos.IsEmpty)
  and (sdqRecepciones.FieldByName('ds_Simulada').asstring = 'O') then
  begin
////    IniciarEspera;
    if (sdqPeriodos.FieldByName('COBERTURA').AsString = 'Sin Cobertura') then
    begin
      MessageDlg('No se puede simular en períodos sin cobertura.', mtError, [mbOK], 0);
      Exit;
    end;
    try
      Do_ActualizaNominaSim(sdqRecepciones.FieldByName('Id').AsInteger);
      MostrarPeriodos;
    finally
////      DetenerEspera;
    end;
  end;
end;

procedure TFrmSimulacion.SimularAutorizaciones(AContrato: Integer);
var
 Q : TSDQuery;
begin
  Q := GetQuery(' SELECT dj_id ' +
                ' FROM emi.idj_ddjj, emi.isa_solicitudautorizacion ' +
                ' WHERE dj_contrato = ' + SqlInteger(AContrato) +
                ' AND sa_contrato = dj_contrato ' +
                ' AND dj_idsolicitudautorizacion = sa_id ' +
                ' AND sa_tipocumplimiento IS NULL ' );

  try
    while not Q.Eof do
    begin
      Do_ActualizaNominaSim(Q.FieldByName('dj_id').AsInteger);
      Q.Next;
    end;
    MostrarPeriodos;
    tbSimular.Click;
  finally
    Q.Free;
  end;
end;

end.

