unit unAdminCotizacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl,
  StdCtrls, ComCtrls, ToolWin, ExtCtrls, Mask, PatternEdit, IntEdit, ToolEdit, DateComboBox, unArtFrame, unFraStaticCodigoDescripcion,
  unfraStaticActividad, Grids, StaticGrid, Menus, CurrEdit, CardinalEdit, unFraUsuario, unFraStaticCTB_TABLAS, DBGrids, FormPanel, unFraCodigoDescripcion,
  RxRichEd, QRPrntr, unArtDBAwareFrame, unArt, unfraVendedores, unFraCanal, unFraEntidades, RXDBCtrl, ArtComboBox, ArtDBGrid, RXSplit, ShellAPI,
  unfraCtbTablas, unFraCodDesc, Buttons, DateUtils, PeriodoPicker, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdAuthentication,
  unfraImportUART, RxToolEdit, RxCurrEdit, RxPlacemnt;

type
  TIntegerArray = Array of Integer;

type
  TfrmAdminCotizacion = class(TfrmCustomPanelABM)
    cmbCO_FECHAVIGENCIA: TDateComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    fraCO_IDACTIVIDAD: TfraStaticActividad;
    edCO_CUIT: TMaskEdit;
    edCO_RAZONSOCIAL: TEdit;
    edCO_CONTACTO: TEdit;
    edCO_TELEFONO: TEdit;
    Bevel2: TBevel;
    Label20: TLabel;
    fraCO_USUARIOSOLICITADO: TfraUsuarios;
    PCCotizaciones: TPageControl;
    tsDatos: TTabSheet;
    GridDatos: TStaticGrid;
    tsCostos: TTabSheet;
    GridCosto: TStaticGrid;
    tsCostoCartera: TTabSheet;
    Label10: TLabel;
    GridCostoCartera1: TStaticGrid;
    GridCostoCartera2: TStaticGrid;
    tsFinal: TTabSheet;
    gbTecnica: TGroupBox;
    Label17: TLabel;
    cmbTC_FECHATECNICA: TDateComboBox;
    Label1: TLabel;
    edCO_NROCOTIZACION: TIntEdit;
    Label21: TLabel;
    GridHistorico: TDBGrid;
    sdqHistorico: TSDQuery;
    gbConfecciono: TGroupBox;
    Label16: TLabel;
    cmbCO_FECHACONFECCIONO: TDateComboBox;
    fraCO_USUARIOCONFECCIONO: TfraUsuarios;
    TSDetalleILP: TTabSheet;
    GridDetalleILP: TStaticGrid;
    ToolBar1: TToolBar;
    tbNuevoDetalle: TToolButton;
    tbEliminarDetalle: TToolButton;
    ToolButton5: TToolButton;
    tbLimpiarDetalle: TToolButton;
    Label28: TLabel;
    edCO_COSTOMEDICO: TCurrencyEdit;
    GridEvolucionAnual: TStaticGrid;
    Label11: TLabel;
    edCO_OBSERVACIONES: TMemo;
    TsFidelitas: TTabSheet;
    GroupBox7: TGroupBox;
    fraCO_IDFIDELITAS: TfraStaticCTB_TABLAS;
    tlbFidelitas: TToolBar;
    tbObtenerFidelitas: TToolButton;
    ToolButton9: TToolButton;
    tbLimpiarFidelitas: TToolButton;
    Bevel5: TBevel;
    tbGrabar: TToolButton;
    frmImpresion: TFormPanel;
    Bevel1: TBevel;
    btnAceptarImpresion: TButton;
    btnCancelarImpresion: TButton;
    chkTasa: TCheckBox;
    chkFidelitas: TCheckBox;
    tbSeparador: TToolButton;
    tsClausulas: TTabSheet;
    edCO_CLAUSULASADICIONALES: TMemo;
    Label31: TLabel;
    edCO_TEXTOFIDELITAS: TRxRichEdit;
    GroupBox8: TGroupBox;
    fraCO_IDCLAUSULA: TfraStaticCodigoDescripcion;
    Label32: TLabel;
    Label33: TLabel;
    edCO_MASASALARIAL: TCurrencyEdit;
    gbCartera: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    btnActualizarRango: TButton;
    edCO_CARTERAPROMEDIO: TCurrencyEdit;
    tbAprobar: TToolButton;
    fraCO_ESTADO: TfraStaticCTB_TABLAS;
    Label38: TLabel;
    gbCierreCotizacion: TGroupBox;
    Label39: TLabel;
    cmbCO_FECHACERRADO: TDateComboBox;
    fraCO_USUCERRADO: TfraUsuarios;
    edCO_CANTEMPRESAS: TIntEdit;
    edCO_CANTTRABAJADOR: TIntEdit;
    Label40: TLabel;
    lbHolding: TLabel;
    Label41: TLabel;
    cmbCO_FECHAAPERTURA: TDateComboBox;
    tsSRT: TTabSheet;
    GridCostoCartera3: TStaticGrid;
    Label42: TLabel;
    Label35: TLabel;
    edCO_CANTEMPLHASTA: TIntEdit;
    edCO_CANTEMPLDESDE: TIntEdit;
    Label34: TLabel;
    Label44: TLabel;
    edCO_CARTERAPROMEDIOPOND: TCurrencyEdit;
    edCO_COMISION: TCurrencyEdit;
    Label46: TLabel;
    Label47: TLabel;
    edSC_OBSERVACIONES: TMemo;
    tsReporte: TTabSheet;
    PreviewCotizacion: TQRPreview;
    gbTarifaSugerida: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edTC_SUMAFIJA: TCurrencyEdit;
    edTC_PORCVARIABLE: TCurrencyEdit;
    edTC_COSTOFINAL: TCurrencyEdit;
    Label12: TLabel;
    edTC_OBSERVACIONES: TMemo;
    gbDetalleILP: TGroupBox;
    Label22: TLabel;
    cmbDI_FECHANAC: TDateComboBox;
    Label23: TLabel;
    edDI_EDAD: TCardinalEdit;
    Label25: TLabel;
    edDI_ANIO: TIntEdit;
    Label49: TLabel;
    cmbDI_FECHAACCIDENTE: TDateComboBox;
    Label18: TLabel;
    cmbDI_SEXO: TComboBox;
    Label27: TLabel;
    edDI_PORCENTAJE: TCurrencyEdit;
    Label43: TLabel;
    cmbDI_MUERTE: TComboBox;
    Label45: TLabel;
    edMultiplicador: TIntEdit;
    tsSolicitud: TTabSheet;
    tlbDatos: TToolBar;
    tbPegarDatosSRT: TToolButton;
    ToolButton2: TToolButton;
    tbLimpiarDatosSRT: TToolButton;
    edCO_NIVEL: TIntEdit;
    lblDatosPrecioCartera: TLabel;
    lblDatosPrecioCompetencia: TLabel;
    tsSRTLiteral: TTabSheet;
    tsHistorico: TTabSheet;
    PreviewHistorico: TQRPreview;
    sdqCotizacionesHistoricas: TSDQuery;
    dsCotizacionesHistoricas: TDataSource;
    gbCotizacionesHistoricas: TGroupBox;
    btnRefrescarHistorico: TButton;
    btnImprimirHistorico: TButton;
    GridCotizacionHistorica: TArtDBGrid;
    lbClonacion: TLabel;
    lbHistorico: TLabel;
    gbRevision: TGroupBox;
    Label58: TLabel;
    fraMotivoRevision: TfraStaticCTB_TABLAS;
    Label59: TLabel;
    Label71: TLabel;
    dcbFechaRevision: TDateComboBox;
    edUsuarioRevision: TEdit;
    gbExcepcion: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    fraMotivoExcepcion: TfraStaticCTB_TABLAS;
    dcbFechaExcepcion: TDateComboBox;
    edUsuarioExcepcion: TEdit;
    fpObservacionesExcepcion: TFormPanel;
    memoObservacionesExcepcion: TMemo;
    btnCerrar: TButton;
    fpObervacionesRevision: TFormPanel;
    memoObservacionesRevision: TMemo;
    btnCerrar2: TButton;
    GroupBox5: TGroupBox;
    lbStatusBCRALink: TLabel;
    fraStatusBCRA2: TfraStaticCTB_TABLAS;
    scrollSolicitud: TScrollBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label60: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label64: TLabel;
    Label67: TLabel;
    GroupBox4: TGroupBox;
    Label70: TLabel;
    fraSC_IDARTANTERIOR: TfraStaticCodigoDescripcion;
    fraStatusSRT: TfraStaticCTB_TABLAS;
    GroupBox2: TGroupBox;
    fraStatusBCRA: TfraStaticCTB_TABLAS;
    edfpSC_CANTTRABAJADOR: TIntEdit;
    frafpSC_IDACTIVIDAD: TfraStaticActividad;
    frafpSC_IDACTIVIDAD2: TfraStaticActividad;
    frafpSC_IDACTIVIDAD3: TfraStaticActividad;
    edfpSC_CANTTRABAJADOR1: TIntEdit;
    edfpSC_CANTTRABAJADOR2: TIntEdit;
    edfpSC_CANTTRABAJADOR3: TIntEdit;
    edfpSC_ACTIVIDADREAL: TEdit;
    frafpSC_ENTIDAD: TfraEntidades;
    frafpSC_CANAL: TfraCanal;
    frafpSC_VENDEDOR: TfraVendedores;
    GroupBox3: TGroupBox;
    edfpSC_MASASALARIAL: TCurrencyEdit;
    GroupBox1: TGroupBox;
    Label51: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    edSC_MOTIVOSUSPENSION: TMemo;
    edSC_FECHASUSPDESDE: TDateComboBox;
    edSC_FECHASUSPHASTA: TDateComboBox;
    edMasaSalarial1: TCurrencyEdit;
    edMasaSalarial2: TCurrencyEdit;
    edMasaSalarial3: TCurrencyEdit;
    GroupBox6: TGroupBox;
    edSC_EDADPROMEDIO: TCurrencyEdit;
    GroupBox9: TGroupBox;
    edTC_USUTECNICA: TEdit;
    Label19: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    edPorcVariable: TCurrencyEdit;
    edSumaFija: TCurrencyEdit;
    edResultadoMensualTrabajador: TCurrencyEdit;
    fraCO_IDGRUPOECONOMICO: TfraCodDesc;
    GroupBox10: TGroupBox;
    fraSector: TfraCtbTablas;
    fraZonaGeografica: TfraCodDesc;
    Label52: TLabel;
    edComisionCotizada: TCurrencyEdit;
    fpEstado: TFormPanel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    Bevel6: TBevel;
    Panel1: TPanel;
    Label65: TLabel;
    GroupBox11: TGroupBox;
    rbEnPreparacion: TRadioButton;
    rbPendienteAutorizar: TRadioButton;
    btnHistorialVigencias: TBitBtn;
    edCO_ESTABLECIMIENTOS: TIntEdit;
    Label66: TLabel;
    GroupBox12: TGroupBox;
    edSC_ESTABLECIMIENTOS: TCurrencyEdit;
    GroupBox13: TGroupBox;
    edPeriodo: TPeriodoPicker;
    tsPrevencion: TTabSheet;
    tbObtenerDatosSRT: TToolButton;
    ScrollBox1: TScrollBox;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    edCostoTotalPeriodicos: TCurrencyEdit;
    edCostoPromedioVisita: TCurrencyEdit;
    edCantidadVisitasTotales: TCurrencyEdit;
    edTotalVisitas: TCurrencyEdit;
    edOtrasErogaciones: TCurrencyEdit;
    edCostoTotalPrevencion: TCurrencyEdit;
    edFechaPrevencion: TDateEdit;
    edUsuarioPrevencion: TEdit;
    Panel2: TPanel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    edCostoExamen1: TCurrencyEdit;
    edPorcentajeExpuestos1: TCurrencyEdit;
    edTrabajadoresExpuestos1: TCurrencyEdit;
    edCostoPeriodicos1: TCurrencyEdit;
    Panel3: TPanel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    edCostoExamen2: TCurrencyEdit;
    edPorcentajeExpuestos2: TCurrencyEdit;
    edTrabajadoresExpuestos2: TCurrencyEdit;
    edCostoPeriodicos2: TCurrencyEdit;
    Panel4: TPanel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    edCostoExamen3: TCurrencyEdit;
    edPorcentajeExpuestos3: TCurrencyEdit;
    edTrabajadoresExpuestos3: TCurrencyEdit;
    edCostoPeriodicos3: TCurrencyEdit;
    Panel5: TPanel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    edCostoExamen4: TCurrencyEdit;
    edPorcentajeExpuestos4: TCurrencyEdit;
    edTrabajadoresExpuestos4: TCurrencyEdit;
    edCostoPeriodicos4: TCurrencyEdit;
    dbgridEstablecimientos: TArtDBGrid;
    Panel6: TPanel;
    dsEstablecimientos: TDataSource;
    sdqEstablecimientos: TSDQuery;
    edUsuarioSolicito: TEdit;
    tbRecuperarDatosCotizacionesAnteriores: TToolButton;
    fpRecuperarDatos: TFormPanel;
    gridCotizacionesAnteriores: TArtDBGrid;
    GroupBox14: TGroupBox;
    Label50: TLabel;
    edFechaCargaTarifa: TDateComboBox;
    fraUsuarioCargaTarifa: TfraUsuarios;
    rbAutorizada: TRadioButton;
    edOrden: TIntEdit;
    GroupBox15: TGroupBox;
    edMotivoClonacion: TEdit;
    tsJuicios: TTabSheet;
    ToolBar2: TToolBar;
    tbDescargarDatosUART: TToolButton;
    ToolButton7: TToolButton;
    tbVerDetalles: TToolButton;
    fraImportUART: TfraImportUART;
    gridJuicios: TArtDBGrid;
    sdqJuicios: TSDQuery;
    dsJuicios: TDataSource;
    fpDetalleJuicio: TFormPanel;
    scrollJuicios: TScrollBox;
    Label75: TLabel;
    Label76: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    edJuicioArt: TEdit;
    edJuicioNumeroExpediente: TEdit;
    edJuicioCaracterArt: TEdit;
    edJuicioJuzgadoTribunal: TEdit;
    edJuicioCuilTrabajador: TEdit;
    edJuicioNumeroSiniestro: TEdit;
    edJuicioNumeroExpedienteCMOHV: TEdit;
    edJuicioPresentaronEstudiosMedicos: TEdit;
    edJuicioPresentaronCertificadosMedicos: TEdit;
    edJuicioAbogadosActora: TEdit;
    Label116: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    edJuicioMedicosActora: TEdit;
    edJuicioPeritosOficiales: TEdit;
    edJuicioReclamanIncapacidad: TEdit;
    edJuicioArtRevaluacion: TEdit;
    edJuicioActuacionArt: TEdit;
    edJuicioVinculoLaboral: TEdit;
    edJuicioMediacion: TEdit;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    edJuicioEnfermedadReclamada1: TEdit;
    edJuicioContingencia3: TEdit;
    edJuicioContingencia2: TEdit;
    edJuicioContingencia1: TEdit;
    edJuicioEnfermedadReclamada4: TEdit;
    edJuicioEnfermedadReclamada3: TEdit;
    edJuicioEnfermedadReclamada2: TEdit;
    edJuicioDiagnostico: TEdit;
    edJuicioZonaCuerpo: TEdit;
    edJuicioProvincia: TEdit;
    edJuicioTipoOperacion: TEdit;
    btnCerrar3: TButton;
    memoJuicioCaratula: TMemo;
    memoJuicioDepartamentoJudicial: TMemo;
    memoJuicioSentenciaCorteProvincial: TMemo;
    memoJuicioSentenciaCorteSuprema: TMemo;
    memoJuicioSentencia1ra: TMemo;
    memoJuicioSentencia2da: TMemo;
    memoJuicioObjetoArt1: TMemo;
    memoJuicioObjetoArt2: TMemo;
    memoJuicioObjetoArt3: TMemo;
    memoJuicioObjetoArt4: TMemo;
    memoJuicioObjetoArt5: TMemo;
    edJuicioFechaNotificacion: TDateComboBox;
    edJuicioFechaAccidente: TDateComboBox;
    edJuicioMontoReclamado: TCurrencyEdit;
    edJuicioIncapacidadPerito: TCurrencyEdit;
    edJuicioIncapacidadArt: TCurrencyEdit;
    edJuicioIncapacidad1raSentencia: TCurrencyEdit;
    edJuicioMonto1ra: TCurrencyEdit;
    edJuicioMonto2da: TCurrencyEdit;
    edJuicioIncapacidad2daSentencia: TCurrencyEdit;
    Label151: TLabel;
    edJuicioFechaProceso: TDateComboBox;
    Label48: TLabel;
    btnCotizador: TButton;
    btnRefrescar: TButton;
    btnImprimir: TButton;
    btnExportarPDF: TBitBtn;
    gbTarifaPiso: TGroupBox;
    Label74: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    edCostoFijoTP: TCurrencyEdit;
    edCostoVariableTP: TCurrencyEdit;
    edCostoFinalTP: TCurrencyEdit;
    edComisionTP: TCurrencyEdit;
    btnRecuperarTarifaPiso: TButton;
    gbFinalVarios: TGroupBox;
    chkIltEmpleador: TCheckBox;
    chkFrecuencuaSiniestral: TCheckBox;
    chkJuicios: TCheckBox;
    chkPrecioCompetencia: TCheckBox;
    chkIlp: TCheckBox;
    Label155: TLabel;
    edIndiceCombinado: TCurrencyEdit;
    pnObservaciones: TPanel;
    edTC_OBSERVACIONESAlta: TMemo;
    sdspGetCotizacion: TSDStoredProc;
    Label156: TLabel;
    edAcpoTP: TCurrencyEdit;
    btnCopiarTarifaSugerida: TButton;
    chkTarifaUnificada: TCheckBox;
    btnCopiarTarifaPiso: TButton;
    Label157: TLabel;
    edAcpo: TCurrencyEdit;
    edPrevencion1: TCurrencyEdit;
    edPrevencion2: TCurrencyEdit;
    Label158: TLabel;
    Label159: TLabel;
    sdspGetCotizacionPrevencion: TSDStoredProc;
    toolPrevencion1: TToolBar;
    tbEditar: TToolButton;
    tbCancelar: TToolButton;
    Label160: TLabel;
    edOE: TCurrencyEdit;
    Label161: TLabel;
    edOETP: TCurrencyEdit;
    Panel7: TPanel;
    checkMostrarSoloUltimaCotizacion: TCheckBox;
    tbSeparador1: TToolButton;
    tbRecuperarDatosCotizacionesAnteriores2: TToolButton;
    chkCargaManual: TCheckBox;
    procedure KeyPressGrilla(Sender: TObject; var Key: Char);
    procedure FSFormCreate(Sender: TObject);
    procedure PCCotizacionesChange(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure GridDatosSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);
    procedure edCO_NROCOTIZACIONKeyPress(Sender: TObject; var Key: Char);
    procedure tbModificarClick(Sender: TObject);
    procedure LimpiarDetalle(Sender: TObject);
    procedure EliminarDetalle(Sender: TObject);
    procedure NuevoDetalle(Sender: TObject);
    procedure cmbDI_FECHANACValidate(Sender: TObject; var Cancel: Boolean);
    procedure edDI_EDADExit(Sender: TObject);
    procedure ActualizarCotizacionCosto(Sender: TObject);
    procedure cmbDI_FECHANACExit(Sender: TObject);
    procedure cmbDI_FECHANACAcceptDate(Sender: TObject; var ADate: TDateTime; var Action: Boolean);
    procedure GridDatosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbLimpiarFidelitasClick(Sender: TObject);
    procedure tbObtenerFidelitasClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure btnCancelarImpresionClick(Sender: TObject);
    procedure GridDatosGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure btnActualizarRangoClick(Sender: TObject);
    procedure sdqHistoricoAfterScroll(DataSet: TDataSet);
    procedure tbAprobarClick(Sender: TObject);
    procedure fraCO_ESTADOExit(Sender: TObject);
    procedure edDI_PORCENTAJEExit(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure CambiaFidelitas ( Sender: TObject );
    procedure GridCostoGetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
    procedure GridEvolucionAnualGetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
    procedure GridCostoCartera1GetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
    procedure GridCostoCartera3GetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
    procedure GridCostoCartera2GetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
    procedure ActualizarCotizacionPorc(Sender: TObject);
    procedure ActualizarCotizacionCostoFinal(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure CalcularTrabajadores(Sender: TObject);
    procedure tbPegarDatosSRTClick(Sender: TObject);
    procedure tbLimpiarDatosSRTClick(Sender: TObject);
    procedure edCO_CUITChange(Sender: TObject);
    procedure GridCostoGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure AlinearGrilla(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure GridCostoCartera3GetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure GridDetalleILPGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure btnRefrescarHistoricoClick(Sender: TObject);
    procedure sdqCotizacionesHistoricasAfterOpen(DataSet: TDataSet);
    procedure btnImprimirHistoricoClick(Sender: TObject);
    procedure fraStatusSRTExit(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnCerrar2Click(Sender: TObject);
    procedure Label62Click(Sender: TObject);
    procedure Label59Click(Sender: TObject);
    procedure fpObervacionesRevisionKeyPress(Sender: TObject; var Key: Char);
    procedure fpObservacionesExcepcionKeyPress(Sender: TObject; var Key: Char);
    procedure lbStatusBCRALinkClick(Sender: TObject);
    procedure btnCotizadorClick(Sender: TObject);
    procedure FSFormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure btnExportarPDFClick(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure fpEstadoBeforeShow(Sender: TObject);
    procedure btnHistorialVigenciasClick(Sender: TObject);
    procedure tbObtenerDatosSRTClick(Sender: TObject);
    procedure IdHTTP1Authorization(Sender: TObject; Authentication: TIdAuthentication; var Handled: Boolean);
    procedure fpRecuperarDatosKeyPress(Sender: TObject; var Key: Char);
    procedure tbRecuperarDatosCotizacionesAnterioresClick(Sender: TObject);
    procedure gridCotizacionesAnterioresDblClick(Sender: TObject);
    procedure fpRecuperarDatosBeforeShow(Sender: TObject);
    procedure DetalleILPClear;
    procedure edOrdenKeyPress(Sender: TObject; var Key: Char);
    procedure tbDescargarDatosUARTClick(Sender: TObject);
    procedure sdqJuiciosAfterOpen(DataSet: TDataSet);
    procedure tbVerDetallesClick(Sender: TObject);
    procedure btnCerrar3Click(Sender: TObject);
    procedure fpDetalleJuicioKeyPress(Sender: TObject; var Key: Char);
    procedure scrollJuiciosMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure gridJuiciosDblClick(Sender: TObject);
    procedure fpDetalleJuicioBeforeShow(Sender: TObject);
    procedure btnRecuperarTarifaPisoClick(Sender: TObject);
    procedure edCostoFijoTPChange(Sender: TObject);
    procedure edCostoVariableTPChange(Sender: TObject);
    procedure edCostoFinalTPChange(Sender: TObject);
    procedure edComisionTPChange(Sender: TObject);
    procedure btnCopiarTarifaSugeridaClick(Sender: TObject);
    procedure btnCopiarTarifaPisoClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure checkMostrarSoloUltimaCotizacionClick(Sender: TObject);
    procedure tbRecuperarDatosCotizacionesAnteriores2Click(Sender: TObject);
    procedure chkCargaManualClick(Sender: TObject);
    procedure PreviewCotizacionPageAvailable(Sender: TObject; PageNum: Integer);
  private
    FCambioCotizacion: Boolean;
    FCantidadTotal5066: Integer;
    FCantidadTotalMas66: Integer;
    FCIIUAnterior: Integer;
    FEsSolicitud: Boolean;
    FEstado: String;
    FIdCotizacion: Integer;
    FIdSolicitud: Integer;
    FIdTarifa: Integer;
    FIndemnizacionInca5066: Double;
    FIndemnizacionIncaMas66: Double;
    FIndemnizacionMuerte: Double;
    FIndemnizacionTope: Double;
    FNroCotizacion: Integer;
    FOldActividad: Integer;
    FOldNivel: Integer;
    FStatusSrtCotizacion: String;

    function CargarCotizacion(aIdCotizacion: Integer; aEstado: String): Boolean;
    function GetColPosDatos(const aAno: Integer): Integer;
    function GetDepartamentoJudicial(const aDepartamentoJudicial: String): String;
    function GetObjetoArt(const aObjetoArt: String): String;
    function GetRowPosDatos(const aPorcentaje: Real): Integer;
    function GetSentencia(const aSentencia1ra: String): String;

    procedure ActualizarFechas;
    procedure ActualizarFilasGrid(aNroFila: Integer);
    procedure ActualizarFilasGridCosto(aNroFila: Integer);
    procedure ActualizarFilasGridEvolucionAnual(aNroFila: Integer);
    procedure ActualizarRangoCartera;
    procedure AsignaPreview(Sender: TObject);
    procedure AutorizaCotizacion;
    procedure CambiaActividad(Sender: TObject);
    procedure CargarCostoCartera1;
    procedure CargarCostoCartera2;
    procedure CargarCostoCartera3;
    procedure CargarCostoMedico(aEstado: String);
    procedure CargarCostos;
    procedure CargarCotizacionesHistoricas;
    procedure CargarCotizacionSiniestro;
    procedure CargarDatos;
    procedure CargarDatosSolicitud(aIdSolicitud: Integer);
    procedure CargarDetalleILP(const aIdCotizacion: Integer);
    procedure CargarSolapaJuicios;
    procedure CargarSolapaPrevencion(const aIdCotizacion: Integer);
    procedure CargarSRT(aIdCotizacion: Integer);
    procedure CargarTarifa;
    procedure ClipBoardToGrid;
    procedure DescargarReportes;
    procedure GetUsuarioAutorizacion(var aUsuarioAutorizacion, aPuestoAutorizacion: String);
    procedure GuardarObservacionesPorCuit(const aIdCotizacion: Integer);
    procedure GuardarTotalJuiciosEnObservaciones;
    procedure LimpiarGrid(aGrilla: TStaticGrid; aRowsNoLimpiar, aColsNoLimpiar: Array of Integer; aValor: String = '0');
    procedure LoadStaticGrid(aSdqAux: TSDQuery; aGrilla: TStaticGrid; aCampoVertical: String = '');
    procedure SetToolBarPrevencion(const aAccion: String);
    procedure TransferirSolicitud;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure CleanControls;
    procedure ClearControls(aClearPK: Boolean = False); override;
    procedure LockControls(aLocked: Boolean = True); override;
    procedure VerificarAutorizacion;
    procedure Verificar(aCondicion: Boolean; aControl: TWinControl; aTabIndex: Integer; aText: String);
  public
    function CalcularIndiceCombinado(const aCantTrabajador, aIdActividad, aIdCotizacion: Integer; aMasaSalarial, aCostoFinal: Extended): Extended;

    procedure DoCargar(aIdCotizacion: Integer; aEstado: String);

    property IdCotizacion: Integer  read FIdCotizacion write FIdCotizacion;
    property NroCotizacion: Integer read FNroCotizacion;
  end;

  TCadena = class
  public
    Valor: String;
  end;

const
  PAGE_SOLICITUD    = 0;
  PAGE_SRT          = 1;
  PAGE_SRT_TAL_CUAL = 2;
  PAGE_DATOS        = 3;
  PAGE_DETALLE      = 4;
  PAGE_COSTOS       = 5;
  PAGE_COSTOCARTERA = 6;
  PAGE_FIDELITAS    = 7;
  PAGE_CLAUSULAS    = 8;
  PAGE_FINAL        = 9;
  PAGE_REPORT       = 10;
  PAGE_HISTORICO    = 11;
  PAGE_PREVENCION   = 12;
  PAGE_JUICIOS      = 13;

  DISABLED_GRID_ROWS = [6, 7, 13, 14, 15];

  // Estos son los campos de la base de datos que se corresponden con las columnas del TStaticGrid
  CAMPOS_GRID: Array [0..22] of String = ('CS_ANIO', 'CS_PERIODOCUBIERTO', 'CS_CANTIDADTRABAJADOR', 'CS_CANTSINIESTRO', 'CS_CANTSINIESTROSINBAJA',
                                          'CS_CANTSINIESTROCONBAJA', 'CS_CANTMUERTE', 'CS_CANTMUERTEINITINERE', 'CS_CANTACCIDENTETRABAJO',
                                          'CS_CANTSINIESTROINITINERE', 'CS_CANTSINIESTROSINTIPO', 'CS_ATYEP', 'CS_ACCTRABAJOCONBAJA',
                                          'CS_ENFERPROFESCONBAJA', 'CS_CANTSINIESTROCONINCAPACIDAD', 'CS_CANTIPP50', 'CS_CANTIPP5066',
                                          'CS_CANTINCAPACIDADTOTAL', 'CS_CANTSINIESTROSINPORCENTAJE', 'CS_CANTDIASILT', 'CS_DIASILTEMPLEADOR',
                                          'CS_CANTDIASBAJAART', 'CS_INDICEINCIDENCIA');
  CAMPOS_DETALLE: Array [0..6] of String = ('DI_SEXO', 'DI_FECHANAC', 'DI_EDAD', 'DI_ANIO', 'DI_PORCENTAJE', 'DI_MUERTE', 'DI_FECHAACCIDENTE');

var
  frmAdminCotizacion: TfrmAdminCotizacion;

implementation

{$R *.DFM}

uses
  unPrincipal, AnsiSql, unDmPrincipal, sqlfuncs, strFuncs, VCLExtra, CustomDlgs, unQrAnalisis, unQrAnalisisChart, unQRAnalisisFidelitas, Cuit, Clipbrd,
  unCargaSRTCoti, unConsultaCotizacion, DateTimeFuncs, unSesion, unCotizacion, unCotizador, unQRCotizador, General, unExportPDF,
  unHistorialVigenciasContrato, unImportFromSRT, ParsearIndicadoresSiniestrosSRT, unEspera, Math, unImportCryptoSrt;

function TfrmAdminCotizacion.Validar: Boolean;
var
  iTabIndex: Integer;
  sSql: String;
begin
  //CARGO TODAS LAS GRILLAS POR LAS DUDAS QUE NO HAYA ENTRADO EN LAS PAGINAS DEL PAGECONTROL
  CargarDatos;
  ActualizarRangoCartera;
  CargarCostoMedico(FEstado);
  CargarCostoCartera2;
  CargarCostos;

  Result := True;
  iTabIndex := PAGE_DATOS;
  Verificar((edCO_NIVEL.Value > 4) or (edCO_NIVEL.Value < 1), edCO_NIVEL, iTabIndex, 'El nivel no es correcto.');
  Verificar((edCO_CUIT.Text = '') or (not isCuit(edCO_CUIT.Text)), edCO_CUIT, iTabIndex, 'La C.U.I.T. no es correcta.');
  Verificar((Trim(edCO_RAZONSOCIAL.Text) = ''), edCO_RAZONSOCIAL, iTabIndex, 'La razón social es obligatoria.');
  Verificar(fraCO_IDACTIVIDAD.IsEmpty, fraCO_IDACTIVIDAD.edCodigo, iTabIndex, 'El CIIU es obligatorio.');

  sSql :=
    'SELECT 1' +
     ' FROM cac_actividad' +
    ' WHERE ac_fechabaja IS NULL' +
      ' AND ac_codigo = :codigo';
  Verificar((not ExisteSqlEx(sSql, [fraCO_IDACTIVIDAD.Codigo])), fraCO_IDACTIVIDAD.edCodigo, iTabIndex, 'Ese CIIU se encuentra dado de baja.');

  Verificar((Trim(edCO_CONTACTO.Text) = ''), edCO_CONTACTO, iTabIndex, 'El contacto es obligatorio.');
  Verificar((fraCO_USUARIOSOLICITADO.Visible) and (fraCO_USUARIOSOLICITADO.IsEmpty), fraCO_USUARIOSOLICITADO.edCodigo, iTabIndex, 'El usuario que solicitó la cotización es obligatorio.');
  Verificar((edCO_MASASALARIAL.Value = 0), edCO_MASASALARIAL, iTabIndex, 'La masa salarial es obligatoria.');
  Verificar((edCO_CANTTRABAJADOR.Value = 0), edCO_CANTTRABAJADOR, iTabIndex, 'La cantidad de trabajadores es obligatoria.');

  //Validaciones sobre la grilla
  Verificar((GridDatos.Cells[1, GridDatos.ColCount - 1] <> '') and (ToFloat(GridDatos.Cells[GridDatos.ColCount, 1]) > 99), GridDatos, iTabIndex, 'El número de períodos no es correcto.');
  Verificar(fraCO_IDFIDELITAS.IsEmpty, fraCO_IDFIDELITAS.edCodigo, PAGE_FIDELITAS, 'El FIDELITAS es obligatorio.');

  if fpEstado.ShowModal <> mrOk then
    Abort;


  if (rbAutorizada.Checked) or (rbPendienteAutorizar.Checked) then
    Verificar((edTC_SUMAFIJA.Value < 0.6), edTC_SUMAFIJA, PAGE_REPORT, 'El costo fijo no puede ser inferior a $0,60.');

  if rbAutorizada.Checked then
  begin
    Verificar((edTC_COSTOFINAL.Value < 0.6), edTC_COSTOFINAL, PAGE_REPORT, 'El costo final no puede ser inferior a $0,60.');

    if edTC_PORCVARIABLE.Value > (edCostoVariableTP.Value * 1.4) then
      Verificar(not MsgAsk('La diferencia entre el variable sugerido y el variable piso es mayor a 40%.' + #13#10 + ' ¿ Desea continuar de todas formas ?'), nil, PAGE_REPORT, '');

    if not chkCargaManual.Checked then
      edIndiceCombinado.Value := CalcularIndiceCombinado(edCO_CANTTRABAJADOR.Value, fraCO_IDACTIVIDAD.Value, FIdCotizacion, edCO_MASASALARIAL.Value, edTC_COSTOFINAL.Value);

    fraCO_ESTADO.Value := EC_AUTORIZADA;
  end;

  if rbEnPreparacion.Checked then
    fraCO_ESTADO.Value := EC_EN_PREPARACION;

  if rbPendienteAutorizar.Checked then
  begin
    if not frmCargaSRTCoti.EmpresaNueva then
    begin
      sSql :=
        'SELECT 1' +
         ' FROM tss_solicitudsrt' +
        ' WHERE ss_idcotizacion = :idcotizacion' +
          ' AND ss_fechabaja IS NULL';
      Verificar(not ExisteSqlEx(sSql, [FIdCotizacion]), tsSRT, PAGE_SRT, 'Debe ingresar los registros correspondientes a los datos de la SRT.');
    end;

    fraCO_ESTADO.Value := EC_PEND_AUTORIZ;

    if edCO_CANTTRABAJADOR.Value < 50 then
    begin
      // Le pongo la comisión de comercial..
      edComisionCotizada.Value := edCO_COMISION.Value;
      edComisionTP.Value       := edCO_COMISION.Value;
    end;
  end;
end;

procedure TfrmAdminCotizacion.CargarSolapaPrevencion(const aIdCotizacion: Integer);
  function GetPrevencion1: Extended;
  var
    iEstablecimientos: Integer;
    sSql: String;
  begin
    Result := 0;

    sSql :=
      'SELECT co_establecimientos' +
       ' FROM aco_cotizacion' +
      ' WHERE co_id = :id';
    iEstablecimientos := ValorSqlIntegerEx(sSql, [FIdCotizacion]);

    with sdspGetCotizacionPrevencion do
    begin
      ParamByName('cantempleados').AsInteger := edCO_CANTTRABAJADOR.Value;
      ParamByName('cantestab').AsInteger     := iEstablecimientos;
      ParamByName('codprovincia').AsString   := fraZonaGeografica.sdqDatos.FieldByName('zg_idprovincia').AsString;
      ParamByName('cuit').AsString           := edCO_CUIT.Text;
      ParamByName('idactividad').AsInteger   := fraCO_IDACTIVIDAD.Value;
      ParamByName('licitacion').AsString     := 'N';
      ParamByName('sectorempresa').AsString  := fraSector.Value;
      ParamByName('tipoempresa').AsString    := '';

      ExecProc;

      if ParamByName('costo').AsFloat > 0 then
        Result := ParamByName('costo').AsFloat;
    end;
end;

var
  iLoop: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT se_nombre, si_cantidadvisitastotales, si_costoexamen1, si_costoexamen2, si_costoexamen3, si_costoexamen4, si_costoperiodicos1, si_costoperiodicos2,' +
          ' si_costoperiodicos3, si_costoperiodicos4, si_costopromediovisita, si_costototalperiodicos, si_costototalprevencion, si_fecharespuesta,si_otraserogaciones,' +
          ' si_porcentajeexpuestos1, si_porcentajeexpuestos2, si_porcentajeexpuestos3, si_porcentajeexpuestos4, si_trabajadoresexpuestos1, si_trabajadoresexpuestos2,' +
          ' si_trabajadoresexpuestos3, si_trabajadoresexpuestos4, si_totalvisitas' +
     ' FROM asi_solicitudinfoprevencion, use_usuarios' +
    ' WHERE si_usurespuesta = se_usuario' +
      ' AND si_idsolicitudcotizacion = (SELECT sc_id' +
                                        ' FROM asc_solicitudcotizacion' +
                                       ' WHERE sc_idcotizacion = :id)';
  with GetQueryEx(sSql, [aIdCotizacion]) do
  try
    edCostoTotalPeriodicos.Value   := FieldByName('si_costototalperiodicos').AsFloat;
    edCostoPromedioVisita.Value    := FieldByName('si_costopromediovisita').AsFloat;
    edCantidadVisitasTotales.Value := FieldByName('si_cantidadvisitastotales').AsFloat;
    edTotalVisitas.Value           := FieldByName('si_totalvisitas').AsFloat;
    edOtrasErogaciones.Value       := FieldByName('si_otraserogaciones').AsFloat;
    edCostoTotalPrevencion.Value   := FieldByName('si_costototalprevencion').AsFloat;
    edFechaPrevencion.Date         := FieldByName('si_fecharespuesta').AsDateTime;
    edUsuarioPrevencion.Text       := FieldByName('se_nombre').AsString;

    for iLoop := 1 to 4 do
    begin
      TCurrencyEdit(frmAdminCotizacion.FindComponent('edPorcentajeExpuestos' + IntToStr(iLoop))).Value   := FieldByName('si_porcentajeexpuestos' + IntToStr(iLoop)).AsFloat;
      TCurrencyEdit(frmAdminCotizacion.FindComponent('edCostoExamen' + IntToStr(iLoop))).Value           := FieldByName('si_costoexamen' + IntToStr(iLoop)).AsFloat;
      TCurrencyEdit(frmAdminCotizacion.FindComponent('edTrabajadoresExpuestos' + IntToStr(iLoop))).Value := FieldByName('si_trabajadoresexpuestos' + IntToStr(iLoop)).AsFloat;
      TCurrencyEdit(frmAdminCotizacion.FindComponent('edCostoPeriodicos' + IntToStr(iLoop))).Value       := FieldByName('si_costoperiodicos' + IntToStr(iLoop)).AsFloat;
    end;
  finally
    Free;
  end;

  if edPrevencion1.Value = 0 then
    edPrevencion1.Value := GetPrevencion1;
end;

procedure TfrmAdminCotizacion.CargarSRT(aIdCotizacion: Integer);
begin
  frmCargaSRTCoti.DoCargar(aIdCotizacion);
end;

procedure TfrmAdminCotizacion.CargarDatos;
var
  aIpp1: Array of Integer;
  aIpp2: Array of Integer;
  aIpp3: Array of Integer;
  aIpp4: Array of Integer;
  aIpp5: Array of Integer;
  ePorcentaje: Extended;
  iLoop: Integer;
  iPosicion: Integer;
begin
  if GridDetalleILP.Cells[0, 1] <> '' then
  try
    with GridDetalleILP do
    begin
      SetLength(aIpp1, GridDatos.ColCount - 2);
      SetLength(aIpp2, GridDatos.ColCount - 2);
      SetLength(aIpp3, GridDatos.ColCount - 2);
      SetLength(aIpp4, GridDatos.ColCount - 2);
      SetLength(aIpp5, GridDatos.ColCount - 2);
      for iLoop := FixedRows to RowCount - 1 do
      begin
        ePorcentaje := ToFloat(Cells[4, iLoop]);
        iPosicion   := StrToInt(Cells[3, iLoop]) - 1996;
        if (Cells[5, iLoop] = 'S') then
          aIpp4[iPosicion] := aIpp4[iPosicion] + 1
        else if (Cells[5, iLoop] = 'I') then
        begin
          aIpp4[iPosicion] := aIpp4[iPosicion] + 1;
          aIpp5[iPosicion] := aIpp5[iPosicion] + 1;
        end
        else
        begin
          if ePorcentaje <= 50 then
            aIpp1[iPosicion] := aIpp1[iPosicion] + 1
          else if (ePorcentaje > 50) and (ePorcentaje < 66) then
            aIpp2[iPosicion] := aIpp2[iPosicion] + 1
          else
            aIpp3[iPosicion] := aIpp3[iPosicion] + 1;
        end;
      end;
    end;

    with GridDatos do
    begin
      // Ahora tengo un vector para cada IPP, lo que tengo que hacer es pasar la informacion a la grilla
      for iLoop := FixedCols to ColCount - 2 do
      begin
        Cells[iLoop, 15] := IntToStr(aIpp1[iLoop - FixedCols]);
        Cells[iLoop, 16] := IntToStr(aIpp2[iLoop - FixedCols]);
        Cells[iLoop, 17] := IntToStr(aIpp3[iLoop - FixedCols]);
        Cells[iLoop, 6]  := IntToStr(aIpp4[iLoop - FixedCols]);
      end;
    end;

    ActualizarFilasGrid(6);
    ActualizarFilasGrid(15);
    ActualizarFilasGrid(16);
    ActualizarFilasGrid(17);
  except
    on E: Exception do
      MsgBox('CargarDatos: ' + E.Message);
  end;
end;

procedure TfrmAdminCotizacion.CargarCotizacionSiniestro;
var
  iLoop: Integer;
  sAux: String;
  sSql: String;
begin
  // Genero la lista de campos
  for iLoop := 0 to High(CAMPOS_GRID) do
    sAux := sAux + CAMPOS_GRID[iLoop] + ', ';
  SetLength(sAux, Length(sAux) - 2);

  sSql :=
  	'SELECT ' + sAux +
     ' FROM acs_cotizacionsiniestro' +
    ' WHERE cs_idcotizacion = :idcotizacion';
  sdqConsulta.Sql.Clear;
  OpenQueryEx(sdqConsulta, [FIdCotizacion], sSql, True);

  // Completo la grilla
  LoadStaticGrid(sdqConsulta, GridDatos, 'CS_ANIO');

  // Carga los totales de la grilla
  for iLoop := GridDatos.FixedRows to (GridDatos.RowCount - GridDatos.FixedRows) do
    ActualizarFilasGrid(iloop);
end;

procedure TfrmAdminCotizacion.CargarDetalleILP(const aIdCotizacion: Integer);
var
  iLoop: Integer;
  sAux: String;
  sSql: String;
begin

  // Genero la lista de campos
  for iLoop := 0 to High(CAMPOS_DETALLE) do
    sAux := sAux + CAMPOS_DETALLE[iloop] + ', ';
  SetLength (sAux, Length(sAux) - 2);

  sSql :=
  	'SELECT ' + sAux +
     ' FROM adi_detalleilp ' +
    ' WHERE di_idcotizacion = :idcotizacion';
  sdqConsulta.Sql.Clear;
  OpenQueryEx(sdqConsulta, [aIdCotizacion], sSql, True);

  // Completo la grilla
  if not sdqConsulta.Eof then
    LoadStaticGrid(sdqConsulta, GridDetalleILP);
  LimpiarDetalle(nil);
end;

procedure TfrmAdminCotizacion.LockControls(aLocked: Boolean = True);
begin
  inherited;

  if aLocked then
  begin
    GridDatos.Options        := (GridDatos.Options - [goEditing]); //anula la edicion
    GridDatos.Color          := clBtnFace;
    GridDetalleILP.Color     := clBtnFace;
    GridCosto.Color          := clBtnFace;
    GridEvolucionAnual.Color := clBtnFace;
    GridCostoCartera1.Color  := clBtnFace;
    GridCostoCartera2.Color  := clBtnFace;
    GridCostoCartera3.Color  := clBtnFace;
  end
  else
  begin
    GridDatos.Options        := (GridDatos.Options + [goEditing]); // Permite la edición
    GridDatos.Color          := clWindow;
    GridDetalleILP.Color     := clWindow;
    GridCosto.Color          := clWindow;
    GridEvolucionAnual.Color := clWindow;
    GridCostoCartera1.Color  := clWindow;
    GridCostoCartera2.Color  := clWindow;
    GridCostoCartera3.Color  := clWindow;
  end;

  // Form principal
  if ((ModoABM = maModificacion) or (ModoABM = maAlta)) then
    fraCO_ESTADO.Value := EC_EN_PREPARACION;

  VCLExtra.LockControls(edCO_COMISION, True);
  VCLExtra.LockControls(edCO_CONTACTO, True);
  LockControl(fraCO_USUARIOSOLICITADO, True);
  VCLExtra.LockControl(edUsuarioSolicito, True);
  LockControl(fraCO_ESTADO, True);
  VCLExtra.LockControl(PCCotizaciones.Pages[PAGE_DETALLE], aLocked);
  VCLExtra.EnableControls([tlbDatos], not aLocked);
  VCLExtra.LockControls(edDI_ANIO, True);

  LockControl(fraMotivoExcepcion, True);
  LockControl(dcbFechaExcepcion, True);
  LockControl(edUsuarioExcepcion, True);
  LockControl(memoObservacionesExcepcion, True);

  LockControl(fraMotivoRevision, True);
  LockControl(dcbFechaRevision, True);
  LockControl(edUsuarioRevision, True);
  LockControl(memoObservacionesRevision, True);

  // Página de la solicitud
  LockControl(PCCotizaciones.Pages[PAGE_SOLICITUD], True);
  scrollSolicitud.Enabled := True;

  // Página Costo cartera
  LockControl(gbCartera, aLocked);
  edCO_CANTEMPRESAS.Enabled := False;
  edCO_CARTERAPROMEDIO.Enabled := False;
  edCO_CARTERAPROMEDIOPOND.Enabled := False;

  // Página de claúsulas
  LockControl(PCCotizaciones.Pages[PAGE_CLAUSULAS], True);

  // Página Fidelitas
  LockControl(PCCotizaciones.Pages[PAGE_FIDELITAS], aLocked);
  VCLExtra.LockControl(edCO_TEXTOFIDELITAS, True);
  CambiaFidelitas(nil);

  // Página Final
  LockControl(PCCotizaciones.Pages[PAGE_FINAL], aLocked);
  LockControl(gbTecnica, True);
  LockControl(gbConfecciono, True);
  LockControl(gbCierreCotizacion, True);
  LockControl(gbTarifaSugerida, True);
  LockControl(gbTarifaPiso, True);
  LockControl(gbFinalVarios, True);
  LockControl(pnObservaciones, True);

  // Prevención..
  VCLExtra.LockControl(toolPrevencion1, aLocked);
  SetToolBarPrevencion('G');

  // Este campo no se debe modificar nunca..
  VCLExtra.LockControl(edCO_CUIT, True);

  // Este campo tiene que estar habilitado siempre..
  VCLExtra.LockControl(btnHistorialVigencias, False);

  frmCargaSRTCoti.LockForm := aLocked;
end;

procedure TfrmAdminCotizacion.ClearControls(aClearPK: Boolean = False);
begin
  frmCargaSRTCoti.Clear;
  LimpiarGrid(GridDatos, [], []);
  LimpiarGrid(GridCosto, [], []);
  LimpiarGrid(GridEvolucionAnual, [], []);
  LimpiarGrid(GridCostoCartera1, [], [], '');
  LimpiarGrid(GridCostoCartera2, [], [], '');
  LimpiarGrid(GridCostoCartera3, [], [], '');
  LimpiarGrid(GridDetalleILP, [], [], '');
  edCO_NROCOTIZACION.Clear;
  edOrden.Clear;
  cmbCO_FECHAVIGENCIA.Clear;
  edCO_NIVEL.Value := 1;
  edCO_CUIT.Clear;
  edCO_RAZONSOCIAL.Clear;
  fraCO_IDACTIVIDAD.Clear;
  edCO_CONTACTO.Clear;
  edCO_TELEFONO.Clear;
  fraCO_USUARIOSOLICITADO.Clear;
  edUsuarioSolicito.Clear;
  edCO_CANTTRABAJADOR.Clear;
  edCO_ESTABLECIMIENTOS.Clear;
  edCO_MASASALARIAL.Clear;
  fraCO_IDGRUPOECONOMICO.Clear;
  edSC_OBSERVACIONES.Clear;
  fraMotivoExcepcion.Clear;
  dcbFechaExcepcion.Clear;
  edUsuarioExcepcion.Clear;
  memoObservacionesExcepcion.Clear;
  fraMotivoRevision.Clear;
  dcbFechaRevision.Clear;
  edUsuarioRevision.Clear;
  memoObservacionesRevision.Clear;
  cmbCO_FECHAAPERTURA.Clear;
  edCO_COMISION.Clear;

  edfpSC_CANTTRABAJADOR.Clear;
  edfpSC_CANTTRABAJADOR1.Clear;
  edfpSC_CANTTRABAJADOR2.Clear;
  edfpSC_CANTTRABAJADOR3.Clear;
  edfpSC_ACTIVIDADREAL.Clear;

  edSC_MOTIVOSUSPENSION.Clear;
  edSC_FECHASUSPDESDE.Clear;
  edSC_FECHASUSPHASTA.Clear;

  edMotivoClonacion.Clear;

  edCO_CANTEMPLDESDE.Value := 1;
  edCO_CANTEMPLHASTA.Value := 999999;
  edCO_CANTEMPRESAS.Clear;
  edCO_CARTERAPROMEDIO.Clear;
  edCO_CARTERAPROMEDIOPOND.Clear;

  fraCO_IDFIDELITAS.Clear;
  fraStatusBCRA2.Clear;
  edCO_TEXTOFIDELITAS.Clear;

  edCO_CLAUSULASADICIONALES.Clear;

  sdqHistorico.Close;
  edTC_SUMAFIJA.Value := 0.6;
  edTC_PORCVARIABLE.Clear;
  edTC_COSTOFINAL.Clear;
  edComisionCotizada.Clear;
  edAcpo.Clear;
  edOE.Clear;

  edCostoFijoTP.Clear;
  edCostoVariableTP.Clear;
  edCostoFinalTP.Clear;
  edComisionTP.Clear;
  edAcpoTP.Clear;
  edOETP.Clear;

  chkIltEmpleador.Checked         := False;
  chkFrecuencuaSiniestral.Checked := False;
  chkJuicios.Checked              := False;
  chkTarifaUnificada.Checked      := False;
  chkIlp.Checked                  := False;
  chkPrecioCompetencia.Checked    := False;
  edIndiceCombinado.Clear;
  chkCargaManual.Checked          := False;

  edCO_OBSERVACIONES.Clear;
  cmbCO_FECHACONFECCIONO.Clear;
  fraCO_USUARIOCONFECCIONO.Clear;
  edFechaCargaTarifa.Clear;
  fraUsuarioCargaTarifa.Clear;
  cmbTC_FECHATECNICA.Clear;
  edTC_USUTECNICA.Clear;
  edTC_OBSERVACIONES.Clear;
  edTC_OBSERVACIONESAlta.Clear;

  sdqJuicios.Close;
end;

procedure TfrmAdminCotizacion.DoCargar(aIdCotizacion: Integer; aEstado: String);
var
  OldCursor: TCursor;
  sEstado: String;
  sSql: String;
begin
  //********************************
  DetalleILPClear;                  //Clear de GridDetalleILP apenas le dan enter
  GridDetalleILP.RowCount := 2;    //Lo pongo aca porque mas adelante no anda misteriosamente
  //******************************
  FEsSolicitud := False;

  // Necesito bloquear los controles hasta que se termine de cargar el report
  LockControls(True);
  VCLExtra.EnableControls([tbSalir], False);
  frmAdminCotizacion.Enabled := False;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  lblDatosPrecioCartera.Visible     := False;
  lblDatosPrecioCompetencia.Visible := False;
  try
    // Chequea que no modifique algo que ya esta aprobado, autorizado, suspendido o cancelado..
    if aEstado = 'altasolicitud' then
      sEstado := ValorSqlEx('SELECT NVL(sc_estado, ''0'') FROM asc_solicitudcotizacion WHERE sc_id = :id', [aIdCotizacion], '0')
    else
      sEstado := ValorSqlEx('SELECT NVL(co_estado, ''0'') FROM aco_cotizacion WHERE co_id = :id', [aIdCotizacion], '0');

    if (sEstado <> EC_ASIGNADA) and (sEstado <> EC_AUTORIZADA) and (sEstado <> EC_EN_PREPARACION) and (sEstado <> EC_PEND_AUTORIZ) and (aEstado = 'modif') then
    begin
      aEstado := 'consulta';
      MessageDlg('Está cotización no puede ser modificada.', mtWarning, [mbOK], 0);
    end
    else if sEstado = EC_SUSPENDIDA then
    begin
      aEstado := 'consulta';
      MessageDlg('La cotización está suspendida. Solo puede ingresar en modo consulta.', mtWarning, [mbOK], 0);
    end
    else if ((sEstado = EC_NOTIF_COMERCIAL) or (sEstado = EC_NOTIF_CLIENTE) or (sEstado = EC_CERRADA_MAL) or (sEstado = EC_CERRADA_BIEN) or (sEstado = EC_CERRADO_AUTOMATICO)) and (aEstado <> 'consulta') then
    begin
      aEstado := 'consulta';
      MessageDlg('La cotización ya se ha efectuado. Solo puede ingresar en modo consulta.', mtWarning, [mbOK], 0);
    end
    else if ((sEstado = EC_CANCELADA) or (sEstado = EC_NO_SE_COTIZA) or (sEstado = EC_CERRADA_SIN_INFORMACION) or (sEstado = EC_CERRADA_COMERCIALIZADOR)) and (aEstado <> 'consulta') then
    begin
      aEstado := 'consulta';
      MessageDlg('La cotización ha sido cancelada. Solo puede ingresar en modo consulta.', mtWarning, [mbOK], 0);
    end;


    // Cargo los controles
    VCLExtra.EnableControls([tbAprobar], False);
    DescargarReportes;
    if aEstado = 'alta' then
    begin
      // Cargo el FIdCotizacion acá porque lo necesito para dar de alta las SRT
      FIdCotizacion := ValorSql('SELECT seq_aco_id.NEXTVAL FROM DUAL');
      FCambioCotizacion := True;  // Siempre se guarda la primer cotización
      ModoABM := maAlta;
      FEstado := aEstado;
      LockControls(False);
      VCLExtra.EnableControls([tbImprimir, tbModificar, tbAprobar], False);
      VCLExtra.EnableControls([tbGrabar], True);
    end
    else if aEstado = 'altasolicitud' then
    begin
      // Cargo el FIdCotizacion acá porque lo necesito para dar de alta las SRT
      FIdCotizacion := ValorSql('SELECT seq_aco_id.NEXTVAL FROM DUAL');
      FEsSolicitud  := True;
      FIdSolicitud  := aIdCotizacion;
      FCambioCotizacion := True;  // Siempre se guarda la primer cotización
      ModoABM  := maAlta;
      FEstado := aEstado;
      LockControls(False);
      ClearControls(False);
      VCLExtra.EnableControls([tbImprimir, tbModificar, tbAprobar], False);
      VCLExtra.EnableControls([tbGrabar], True);
      TransferirSolicitud;
      Caption := 'Administración de Cotizaciones - Modo Alta';
    end
    else if (aEstado = 'modif') and CargarCotizacion(aIdCotizacion, aEstado) then
    begin
      FIdCotizacion := aIdCotizacion;
      FCambioCotizacion := False;
      ModoABM  := unCustomPanelABM.maModificacion;
      FEstado := aEstado;
      LockControls(False);

      LockControl(gbTarifaSugerida, False);
      LockControl(gbTarifaPiso, False);
      LockControl(gbFinalVarios, False);
      LockControl(pnObservaciones, False);
      LockControl(edCO_OBSERVACIONES, False);
      VCLExtra.EnableControls([tbImprimir, tbAprobar], False);
      VCLExtra.EnableControls([tbModificar, tbGrabar], True);
      VCLExtra.LockControl(btnImprimir, False);
      VCLExtra.LockControl(btnRefrescar, False);
      VCLExtra.LockControl(btnCotizador, False);
      VCLExtra.LockControl(btnExportarPDF, False);
      VCLExtra.LockControls([edOE, edOETP], True);
      Caption := 'Administración de Cotizaciones - Modo Modificación';
    end
    else if (aEstado = 'consulta') and CargarCotizacion(aIdCotizacion, aEstado) then
    begin
      FIdCotizacion := aIdCotizacion;
      FCambioCotizacion := False;
      ModoABM := unCustomPanelABM.maNone;
      FEstado := aEstado;
      LockControls(True);

      VCLExtra.EnableControls([tbImprimir, tbModificar, tbAprobar], True);
      VCLExtra.EnableControls([tbGrabar], False);
      VCLExtra.LockControl(btnImprimir, False);
      VCLExtra.LockControl(btnRefrescar, False);
      VCLExtra.LockControl(btnCotizador, False);
      VCLExtra.LockControl(btnExportarPDF, False);
      Caption := 'Administración de Cotizaciones - Modo Consulta';
    end
    else if aEstado = 'seleccion' then
    begin
      FIdCotizacion := aIdCotizacion;
      FCambioCotizacion := False;
      ModoABM := unCustomPanelABM.maNone;
      FEstado := aEstado;

      LockControls(True);
      VCLExtra.EnableControls([tbImprimir, tbModificar, tbGrabar, tbAprobar], False);

      Caption := 'Administración de Cotizaciones - Modo Selección';
    end
    else if (aEstado = 'autorizar') and CargarCotizacion(aIdCotizacion, aEstado) then
    begin
      FIdCotizacion := aIdCotizacion;
      FCambioCotizacion := False;
      ModoABM := unCustomPanelABM.maNone;
      FEstado := aEstado;
      LockControls(True);

      LockControl(gbTarifaSugerida, False);
      LockControl(gbTarifaPiso, False);
      LockControl(gbFinalVarios, False);
      LockControl(pnObservaciones, False);
      VCLExtra.LockControl(edCO_OBSERVACIONES, False);
      VCLExtra.LockControls([edOE, edOETP], True);
      VCLExtra.EnableControls([tbImprimir, tbModificar, tbGrabar], True);
      VCLExtra.EnableControls([tbAprobar], False);
      Caption := 'Administración de Cotizaciones - Modo Autorización';
    end;

    if FIdCotizacion <> 0 then
      CargarSRT(FIdCotizacion);

    // Muestro los establecimientos de la solapa Prevención..
    with sdqEstablecimientos do
    begin
      Close;
      ParamByName('idsolicitud').AsInteger := FIdSolicitud;
      Open;
    end;

    if aEstado = 'altasolicitud' then
    begin
      sSql :=
        'SELECT 1' +
         ' FROM afi.aco_cotizacion, afi.atc_tarifacobrar' +
        ' WHERE co_id = tc_idcotizacion' +
          ' AND co_cuit = :co_cuit' +
          ' AND tc_fechaalta = (SELECT MAX(tc_fechaalta)' +
                                ' FROM afi.atc_tarifacobrar' +
                               ' WHERE tc_idcotizacion = co_id)';
      lbHistorico.Visible := ExisteSqlEx(sSql, [edCO_CUIT.Text]);
    end;

    GuardarObservacionesPorCuit(aIdCotizacion);

    if sEstado = EC_SUSPENDIDA then
      VCLExtra.EnableControls([tbModificar, tbGrabar], False);
  finally
    VCLExtra.EnableControls([tbSalir], True);
    VCLExtra.LockControls([edIndiceCombinado], True);
    edTC_OBSERVACIONES.ReadOnly := True;
    frmAdminCotizacion.Enabled := True;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmAdminCotizacion.CargarCostos;
var
  iLoop: Integer;
begin
  ////////////////////
  // Init Variables //
  ////////////////////
  FIndemnizacionTope      := 180000;
  FIndemnizacionMuerte    := MUERTEADICVALORCARTERA;
  FIndemnizacionInca5066  := INCAP5066ADICVALORCARTERA;
  FIndemnizacionIncaMas66 := INCAP66100ADICVALORCARTERA;
  
  for iLoop := GridDetalleILP.FixedRows to GridDetalleILP.RowCount do
  begin
    if (ToFloat(GridDetalleILP.Cells[4, iLoop]) > 50) and (ToFloat(GridDetalleILP.Cells[4, iLoop]) < 66) then
      Inc(FCantidadTotal5066)
    else if (ToFloat(GridDetalleILP.Cells[4, iLoop]) >= 66) then
      Inc(FCantidadTotalMas66);
  end;
  ////////////////////////
  //  Fin Init Variables  //
  ////////////////////////

  //se encarga de hacer los calculos para completar la grilla
  for iLoop := GridCosto.FixedRows to GridCosto.RowCount do
    ActualizarFilasGridCosto(iLoop);

  //se encarga de hacer los calculos para completar la grilla
  for iLoop := GridEvolucionAnual.FixedRows to GridEvolucionAnual.RowCount do
    ActualizarFilasGridEvolucionAnual(iLoop);
end;

procedure TfrmAdminCotizacion.ActualizarFilasGridEvolucionAnual(aNroFila: Integer);
var
  iloop: Integer;
  Valor: Double;
begin
  for iLoop := GridEvolucionAnual.FixedCols to (GridEvolucionAnual.ColCount - GridEvolucionAnual.FixedCols - 1 ) do // dejo afuera el total
  try
    case aNroFila of
      0:  // Tasa de Frecuencia
          GridEvolucionAnual.Cells[iLoop, aNroFila] := ToStr(ToFloat(GridDatos.Cells[iLoop, 4]) / ToFloat(GridDatos.Cells[iLoop, 2]) / ToFloat(GridDatos.Cells[iLoop, 1]) * 12 * 100);
      1:  // Tarifa a cobrar sin siniestralidad
          GridEvolucionAnual.Cells[iLoop, aNroFila] := ToStr(ToFloat(GridCosto.Cells[iLoop, 19]) / ToFloat(GridDatos.Cells[iLoop, 1]) / ToFloat(GridDatos.Cells[iLoop, 2]));
    end;
  except
    // Si se movió a otra celda y dejó un valor invalido entonces lo hago volver para que modifique el valor
    GridEvolucionAnual.Cells[iLoop, aNroFila] := '0';
  end;

  try
    // Ahora calculo el total
    Valor := 0;
    for iLoop := GridEvolucionAnual.FixedCols to (GridEvolucionAnual.ColCount - GridEvolucionAnual.FixedCols - 1) do
      Valor := Valor + ToFloat(GridEvolucionAnual.Cells[iLoop, aNroFila]);
    GridEvolucionAnual.Cells[GridEvolucionAnual.ColCount - GridEvolucionAnual.FixedCols, aNroFila] := ToStr(Valor / (GridEvolucionAnual.ColCount - GridEvolucionAnual.FixedCols - 1));
  except
    // Si se movió a otra celda y dejó un valor invalido entonces lo hago volver para que modifique el valor
    GridEvolucionAnual.Cells[GridEvolucionAnual.ColCount - GridEvolucionAnual.FixedCols, aNroFila] := '0';
  end;
end;

procedure TfrmAdminCotizacion.ActualizarFilasGridCosto(aNroFila: Integer);
  function Porcentaje(aCadena: String): Double;
  begin
    Result := ToFloat(aCadena) / 100;
  end;

var
  dAux: Double;
  dDivisor: Double;
  iLoop: Integer;
  iLoop2: Integer;
  dvalor: Double;
begin
  for iLoop := GridCosto.FixedCols to (GridCosto.ColCount - GridCosto.FixedCols - 1) do //dejo afuera el total
  try
    case aNroFila of
      1://dias promedio por siniestro con baja
        GridCosto.Cells[iLoop, aNroFila] := ToStr(ToFloat(GridDatos.Cells[iLoop, 16]) / ToFloat(GridDatos.Cells[iLoop, 5]), 0);
      2://dias art prom por siniestro con baja
        GridCosto.Cells[iLoop, aNroFila] := ToStr(ToFloat(GridDatos.Cells[iLoop, 17]) / ToFloat(GridDatos.Cells[iLoop, 5]), 0);
      3://Costo medico total
        GridCosto.Cells[iLoop, aNroFila] := ToStr(edCO_COSTOMEDICO.Value * ToFloat(GridDatos.Cells[iLoop, 4]));
      5://indemnizacion ILT
        GridCosto.Cells[iLoop, aNroFila] := ToStr(ToFloat(GridDatos.Cells[iLoop, 15]) * ToFloat(GridDatos.Cells[iLoop, 3]) / 30.4 * 1.33);
      7://indemnizacion ILP estimada a real ILP<50%
      begin
        dValor := 0;
        for iLoop2 := 1 to GridDetalleILP.RowCount - 1 do
        begin   // 'N', Mismo año, Incapacidad < 50
          if (GridDetalleILP.Cells[5, iLoop2] = 'N' ) and (GridDetalleILP.Cells[3, iLoop2] = GridCosto.Cells[iLoop, 0]) and (ToFloat(GridDetalleILP.Cells[4, iLoop2]) < 50) then
          begin                       //edad                                       //salario promedio                                                        //% incapacidad
            dAux := 53 * 65 / ToFloat(GridDetalleILP.Cells[2, iLoop2]) * ToFloat(GridDatos.Cells[iLoop, 3]) * porcentaje(GridDetalleILP.Cells[4, iLoop2]);
            if dAux < (FIndemnizacionTope * Porcentaje(GridDetalleILP.Cells[4, iLoop2])) then
              dValor := dValor + dAux
            else
              dValor := dValor + FIndemnizacionTope * Porcentaje(GridDetalleILP.Cells[4, iLoop2]);
          end;
        end;
        GridCosto.Cells[iLoop, aNroFila] := ToStr(dValor);
      end;
      9://indemnizacion ILP estimada a real ILP 50% y 66%
      begin
        dValor := 0;
        for iLoop2 := 1 to GridDetalleILP.RowCount - 1 do
        begin   // 'N', Mismo año, Incapacidad > 50, Incapacidad < 66
          if (GridDetalleILP.Cells[5, iLoop2] = 'N') and (GridDetalleILP.Cells[3, iLoop2] = GridCosto.Cells[iLoop, 0]) and (ToFloat(GridDetalleILP.Cells[4, iLoop2]) > 50) and
             (ToFloat(GridDetalleILP.Cells[4, iLoop2]) < 66) then
          begin
            dAux := ValorSqlEx('SELECT AFILIACION.GET_VALORACTUARIAL(:p1, :p2) FROM DUAL', [GridDetalleILP.Cells[0, iLoop2]], GridDetalleILP.Cells[2, iLoop2]);
            dAux := dAux * ToFloat(GridDatos.Cells[iLoop, 3]) * porcentaje(GridDetalleILP.Cells[4, iLoop2]);
            if dAux < (FIndemnizacionTope + (FIndemnizacionInca5066 * FCantidadTotal5066)) then
              dValor := dValor + dAux
            else
              dValor := dValor + (FIndemnizacionTope + (FIndemnizacionInca5066 * FCantidadTotal5066));
          end;
        end;
        GridCosto.Cells[iLoop, aNroFila] := ToStr(dValor);
      end;
      11://indemnizacion ILP estimada a real ILP > 66%
      begin
        dValor := 0;
        for iLoop2 := 1 to GridDetalleILP.RowCount - 1 do
        begin   // 'N', Mismo año, Incapacidad > 66
          if (GridDetalleILP.Cells[5, iLoop2] = 'N') and (GridDetalleILP.Cells[3, iLoop2] = GridCosto.Cells[iLoop, 0]) and (ToFloat(GridDetalleILP.Cells[4, iLoop2]) >= 66) then
          begin
            dAux := 53 * (65 / ToFloat(GridDetalleILP.Cells[2, iLoop2]) * ToFloat(GridDatos.Cells[iLoop, 3]));
            if dAux < (FIndemnizacionTope + (FIndemnizacionIncaMas66 * FCantidadTotalMas66)) then
              dValor := dValor + dAux
            else
              dValor := dValor + (FIndemnizacionTope + (FIndemnizacionIncaMas66 * FCantidadTotalMas66));
          end;
        end;
        GridCosto.Cells[iLoop, aNroFila] := ToStr(dValor);
      end;
      13://Mortales
      begin
        dValor := 0;
        for iLoop2 := 1 to GridDetalleILP.RowCount - 1 do
        begin   // 'N', Mismo año
          if (GridDetalleILP.Cells[5, iLoop2] = 'S') and (GridDetalleILP.Cells[3, iLoop2] = GridCosto.Cells[iLoop, 0]) then
          begin
            dAux := 53 * (65 / ToFloat(GridDetalleILP.Cells[2, iLoop2]) * ToFloat(GridDatos.Cells[iLoop, 3]));
            if dAux < FIndemnizacionTope then
              dValor := dAux + FIndemnizacionMuerte
            else
              dValor := FIndemnizacionTope + FIndemnizacionMuerte;
          end;
        end;
        GridCosto.Cells[iLoop, aNroFila] := ToStr(dValor);
      end;
      17://Gastos administrativos
      begin
        dValor := (ToFloat(GridCosto.Cells[iLoop, 3]) + ToFloat(GridCosto.Cells[iLoop, 5]) + ToFloat(GridCosto.Cells[iLoop, 7]) + ToFloat(GridCosto.Cells[iLoop, 9]) +
                   ToFloat(GridCosto.Cells[iLoop, 11]) + ToFloat(GridCosto.Cells[iLoop, 13]) + ToFloat(GridCosto.Cells[iLoop, 15])) * 0.40;

        GridCosto.Cells[iLoop, aNroFila] := ToStr(dValor);
      end;
      19://Total
      begin
        dValor := ToFloat(GridCosto.Cells[iLoop, 3]) + ToFloat(GridCosto.Cells[iLoop, 5]) + ToFloat(GridCosto.Cells[iLoop, 7]) + ToFloat(GridCosto.Cells[iLoop, 9]) +
                  ToFloat(GridCosto.Cells[iLoop, 11]) + ToFloat(GridCosto.Cells[iLoop, 13]) + ToFloat(GridCosto.Cells[iLoop, 15]) + ToFloat(GridCosto.Cells[iLoop, 17]);
        GridCosto.Cells[iLoop, aNroFila] := ToStr(dValor);
      end;
    else //campo anterior /CS_CANTSINIESTRO/CS_CANTTRABAJADOR
      dDivisor := ToFloat(GridDatos.Cells[iLoop, 1]) * ToFloat(GridDatos.Cells[iLoop, 2]);
      GridCosto.Cells[iLoop, aNroFila] := ToStr(ToFloat(GridCosto.Cells[iLoop, aNroFila - 1]) / dDivisor);
    end;

    if GridCosto.Cells[iLoop, aNroFila] = 'NAN' then
      GridCosto.Cells[iLoop, aNroFila] := ToStr(0);
  except
    //Si se movió a otra celda y dejó un valor invalido entonces lo hago volver para que modifique el valor
    GridCosto.Cells[iLoop, aNroFila] := ToStr(0);
  end;

  try
    //Ahora calculo el total
    dValor := 0;
    for iLoop := GridCosto.FixedCols to (GridCosto.ColCount - GridCosto.FixedCols - 1) do
      dValor := dValor + ToFloat(GridCosto.Cells[iLoop, aNroFila]);

    case aNroFila of
      1, 2: GridCosto.Cells[GridCosto.ColCount - GridCosto.FixedCols, aNroFila] := ToStr(dValor, 0);
      3, 5, 7, 9, 11, 13, 17, 19: GridCosto.Cells[GridCosto.ColCount - GridCosto.FixedCols, aNroFila] := ToStr(dValor);
    else    //campo anterior /CS_CANTPERIODOS/CS_CANTTRABAJADOR
      dDivisor := ToFloat(GridDatos.Cells[GridDatos.ColCount - 1, 1]) * ToFloat(GridDatos.Cells[GridDatos.ColCount - 1, 2]);
      GridCosto.Cells[GridCosto.ColCount - 1, aNroFila] := ToStr(ToFloat(GridCosto.Cells[GridCosto.ColCount - 1, aNroFila - 1]) / dDivisor);
    end;
  except
    //Si se movió a otra celda y dejó un valor invalido entonces lo hago volver para que modifique el valor
    GridCosto.Cells[GridCosto.ColCount - GridCosto.FixedCols, aNroFila] :=  ToStr(0);
  end;
end;

procedure TfrmAdminCotizacion.ActualizarFilasGrid(aNroFila: Integer);
var
  iLoop: Integer;
  PrimCol: Integer;
  UltCol: Integer;
  Valor: Extended;
begin
  // Esta rutina se encarga de actualizar el valor de cada columna total
  UltCol  := GridDatos.ColCount - 1;
  PrimCol := GridDatos.FixedCols;
  Valor   := 0;
  try
    case aNroFila of
    2:
    begin
      for iLoop := PrimCol to UltCol - 1 do
        Valor := Valor + ToFloat(GridDatos.Cells[iLoop, aNroFila]) * ToFloat(GridDatos.Cells[iLoop, aNroFila - 1]);
      Valor := Valor / ToFloat(GridDatos.Cells[UltCol, aNroFila - 1]);
      GridDatos.Cells[UltCol, aNroFila] := ToStr(Valor, 0);
    end;
    else
      for iLoop := PrimCol to UltCol - 1 do
        if aNroFila = 22 then    // Si es la fila del Índice de incidencia..
          Valor := Valor + StrToFloatDef(StringReplace(GridDatos.Cells[iLoop, aNroFila], '.', ',', [rfReplaceAll]), 0)
        else
          Valor := Valor + ToFloat(GridDatos.Cells[iLoop, aNroFila]);
      GridDatos.Cells[UltCol, aNroFila] := ToStrDec(Valor, True);
    end; // del case
  except
    //Si se movió a otra celda y dejó un valor invalido entonces lo hago volver para que modifique el valor
    GridDatos.Cells[UltCol, aNroFila] := '0';
  end;
end;

function TfrmAdminCotizacion.CargarCotizacion(aIdCotizacion: Integer; aEstado: String): Boolean;
var
  sPuestoAutorizacion: String;
  sSql: String;
begin
  sSql :=
  	'SELECT *' +
     ' FROM aco_cotizacion, acz_cotizador' +
    ' WHERE co_id = cz_idcotizacion(+)' +
      ' AND co_id = :id';
  OpenQueryEx(sdqConsulta, [aIdCotizacion], sSql, True);

  with sdqConsulta do
  begin
    Result := not Eof;

    if not Eof then
    begin
      //Carga el encabezado
      FIdCotizacion                        := FieldByName('co_id').AsInteger;
      FStatusSrtCotizacion                 := FieldByName('co_statussrt').AsString;
      sPuestoAutorizacion                  := FieldByName('co_puestoautorizacion').AsString;

      fraCO_ESTADO.Value                   := FieldByName('co_estado').AsString;
      edCO_NROCOTIZACION.Text              := FieldByName('co_nrocotizacion').AsString;
      edOrden.Text                         := FieldByName('co_orden').AsString;
      edCO_CUIT.Text                       := FieldByName('co_cuit').AsString;
      cmbCO_FECHAVIGENCIA.Date             := FieldByName('co_fechavigencia').AsDateTime;
      edCO_NIVEL.Text                      := FieldByName('co_nivel').AsString;
      edCO_RAZONSOCIAL.Text                := FieldByName('co_razonsocial').AsString;
      fraCO_IDACTIVIDAD.Value              := FieldByName('co_idactividad').AsInteger;
      FCIIUAnterior                        := fraCO_IDACTIVIDAD.Value;
      edCO_CONTACTO.Text                   := FieldByName('co_contacto').AsString;
      edCO_TELEFONO.Text                   := FieldByName('co_telefono').AsString;
      fraCO_USUARIOSOLICITADO.Value        := FieldByName('co_usuariosolicitado').AsString;
      edUsuarioSolicito.Text               := 'WEB: ' + Copy(FieldByName('co_usuariosolicitado').AsString, 3, 100);
      edCO_OBSERVACIONES.Lines.Text        := FieldByName('co_observaciones').AsString;
      fraCO_IDFIDELITAS.Value              := FieldByName('co_idfidelitas').AsString;
      fraStatusBCRA2.Value                 := FieldByName('co_statusbcra').AsString;
      edCO_TEXTOFIDELITAS.Lines.Text       := FieldByName('co_textofidelitas').AsString;
      edCO_CLAUSULASADICIONALES.Lines.Text := FieldByName('co_clausulasadicionales').AsString;
      edCO_CANTTRABAJADOR.Value            := FieldByName('co_canttrabajador').AsInteger;
      edCO_ESTABLECIMIENTOS.Value          := FieldByName('co_establecimientos').AsInteger;
      edCO_MASASALARIAL.Value              := FieldByName('co_masasalarial').AsFloat;
      cmbCO_FECHAAPERTURA.Date             := FieldByName('co_fechaapertura').AsDateTime;
      fraCO_IDGRUPOECONOMICO.Value         := FieldByName('co_idgrupoeconomico').AsInteger;
      edCO_CANTEMPLDESDE.Value             := FieldByName('co_cantempldesde').AsInteger;
      edCO_CANTEMPLHASTA.Value             := FieldByName('co_cantemplhasta').AsInteger;
      edCO_CANTEMPRESAS.Value              := FieldByName('co_cantempresas').AsInteger;
      edCO_CARTERAPROMEDIO.Value           := FieldByName('co_carterapromedio').AsFloat;
      edCO_CARTERAPROMEDIOPOND.Value       := FieldByName('co_carterapromediopond').AsFloat;
      cmbCO_FECHACONFECCIONO.Date          := FieldByName('co_fechaconfecciono').AsDateTime;
      fraCO_USUARIOCONFECCIONO.Value       := FieldByName('co_usuarioconfecciono').AsString;
      cmbCO_FECHACERRADO.Date              := FieldByName('co_fechacerrado').AsDateTime;
      fraCO_USUCERRADO.Value               := FieldByName('co_usucerrado').AsString;
      if FieldByName('co_comision').AsString <> '' then
        edComisionCotizada.Value           := FieldByName('co_comision').AsFloat;
      edAcpo.Value                         := FieldByName('co_acpo').AsFloat;
      edOE.Value                           := FieldByName('cz_explotacionfijos').AsFloat;

      edCostoFijoTP.Value     := FieldByName('co_sumafijapiso').AsFloat;
      edCostoVariableTP.Value := FieldByName('co_porcvariablepiso').AsFloat;
      edCostoFinalTP.Value    := FieldByName('co_costofinalpiso').AsFloat;
      edComisionTP.Value      := FieldByName('co_comisionpiso').AsFloat;
      edAcpoTP.Value          := FieldByName('co_acpopiso').AsFloat;
      edOETP.Value            := FieldByName('cz_explotacionfijos').AsFloat;

      chkIltEmpleador.Checked         := (FieldByName('co_chek_iltempleador').AsString = 'S');
      chkFrecuencuaSiniestral.Checked := (FieldByName('co_chek_frecuenciasin').AsString = 'S');
      chkJuicios.Checked              := (FieldByName('co_chek_juicios').AsString = 'S');
      chkTarifaUnificada.Checked      := (FieldByName('co_checktarifaunificada').AsString = 'S');
      chkIlp.Checked                  := (FieldByName('co_chek_ilp').AsString = 'S');
      chkPrecioCompetencia.Checked    := (FieldByName('co_chek_preciocomp').AsString = 'S');
      edIndiceCombinado.Value         := FieldByName('co_indicecombinado').AsFloat;
      chkCargaManual.Checked          := (FieldByName('co_cargamanualic').AsString = 'S');

      edPrevencion1.Value := FieldByName('co_prevencion1').AsFloat;
      edPrevencion2.Value := FieldByName('co_prevencion2').AsFloat;

      // Muestro los datos de carga de la tarifa..
      sSql :=
        'SELECT   tc_fechaalta, tc_usualta' +
           ' FROM atc_tarifacobrar' +
          ' WHERE tc_idcotizacion = :idcotizacion' +
       ' ORDER BY tc_fechaalta DESC';
      with GetQueryEx(sSql, [aIdCotizacion]) do
      try
        edFechaCargaTarifa.Date     := FieldByName('tc_fechaalta').AsDateTime;
        fraUsuarioCargaTarifa.Value := FieldByName('tc_usualta').AsString;;
      finally
        Free;
      end;

      fraCO_USUARIOSOLICITADO.Visible := (Copy(FieldByName('co_usuariosolicitado').AsString, 1, 2) <> 'W_');
      edUsuarioSolicito.Visible       := (Copy(FieldByName('co_usuariosolicitado').AsString, 1, 2) = 'W_');

      frmCargaSRTCoti.EmpresaNueva := (FieldByName('co_empresanueva').AsString = 'S');
      frmCargaSRTCoti.Cuit         := FieldByName('co_cuit').AsString;

      sSql :=
        'SELECT sc_id' +
         ' FROM asc_solicitudcotizacion' +
        ' WHERE sc_idcotizacion = :idcotizacion';
      CargarDatosSolicitud(ValorSqlEx(sSql, [aIdCotizacion]));

      //Carga la grilla principal y secundarias
      CargarCostoMedico(aEstado);
      CargarCotizacionSiniestro;
      CargarDetalleILP(FIdCotizacion);
      CargarCostos;
      ActualizarRangoCartera;
      CargarCostoCartera2;
      CargarCostoCartera3;
      CargarTarifa;
      CargarCotizacionesHistoricas;
      CargarSolapaPrevencion(aIdCotizacion);
      CargarSolapaJuicios;

      // Lo pongo acá abajo porque primero tengo que cargar los datos de la tarifa..
      if cmbTC_FECHATECNICA.Date > 0 then
      begin
        sSql :=
          'SELECT ac_usuario' +
           ' FROM art.aac_autorizacotiza' +
          ' WHERE ac_puesto = :puesto' +
            ' AND ac_fechabaja IS NULL';
        edTC_USUTECNICA.Text := ValorSqlEx(sSql, [sPuestoAutorizacion]);
      end
      else
        edTC_USUTECNICA.Clear;
    end
    else
      MessageDlg(Format('No se encontró la cotización Nº %d/%d.', [edCO_NROCOTIZACION.Value, edOrden.Value]), mtWarning, [mbOK], 0);
  end;
end;

procedure TfrmAdminCotizacion.LoadStaticGrid(aSdqAux: TSDQuery; aGrilla: TStaticGrid; aCampoVertical: String = '');
var
  iLoop: Integer;
  iLoop2: Integer;
  Valor: String;
begin
  if aCampoVertical <> '' then
  begin
    // Las columnas de la grilla son las filas del query (hay una rotacion a 90 de la informacion)
    // El CampoVertical indica cual es el campo del query utilizado para ordenar verticalmente y deberia ser el primero
    // en la lista del query
    Verificar(aGrilla.FixedRows <> 1, nil, PAGE_DETALLE, 'Si el modo es vertical, la grilla debe tener una fila fija.');
    Verificar(aSdqAux.FieldCount <> aGrilla.RowCount, nil, PAGE_DETALLE, 'La grilla y la consulta poseen distinto número de campos.');
    Verificar(aSdqAux.FieldByName(aCampoVertical).Index <> 0, nil, PAGE_DETALLE, 'El campo vertical no es el primero de la consulta.');

    LimpiarGrid(aGrilla, [], []);
    while not aSdqAux.Eof do
    begin
      //Tomo un registro y me fijo que valor tiene en el query el campoVertical
      Valor := aSdqAux.FieldByName(aCampoVertical).AsString;
      //Busco que columna de la grilla le corresponde
      for iLoop := aGrilla.FixedCols to (aGrilla.ColCount - aGrilla.FixedCols - 1) do
        if LCase(aGrilla.Cells[iloop, 0]) = LCase(Valor) then
        begin
          // iLoop tiene el valor de la columna de la grilla donde se deben insertar los datos
          for iLoop2 := aGrilla.FixedRows to (aSdqAux.FieldCount - aGrilla.FixedRows) do
            aGrilla.Cells[iLoop, iloop2] := aSdqAux.Fields.Fields[iLoop2].AsString;
          Break;
        end;

      //Continua con el resto de los registros
      aSdqAux.Next;
    end;
  end
  else
  begin
    Verificar(aSdqAux.FieldCount <> (aGrilla.ColCount - aGrilla.FixedCols), nil, PAGE_DETALLE, 'La grilla y la consulta poseen distinto número de campos.');

    LimpiarGrid(aGrilla, [], []);
    aGrilla.RowCount := aGrilla.FixedRows + aSdqAux.RecordCount;
    iLoop := 0;
    while not aSdqAux.Eof do
    begin
      for iLoop2 := 0 to (aSdqAux.FieldCount - 1) do
        aGrilla.Cells[aGrilla.FixedCols + iLoop2, aGrilla.FixedRows + iLoop] := aSdqAux.Fields.Fields[iLoop2].AsString;
      aSdqAux.Next;
      iLoop := iLoop + 1;
    end;
  end;
end;

procedure TfrmAdminCotizacion.CargarTarifa;
var
  sSql: String;
begin
  sSql :=
  	'SELECT *' +
     ' FROM atc_tarifacobrar' +
    ' WHERE tc_idcotizacion = :idcotizacion' +
 ' ORDER BY tc_id DESC';
  OpenQueryEx(sdqHistorico, [FIdCotizacion], sSql, True);

  TFloatField(sdqHistorico.FieldByName('tc_porcvariable')).DisplayFormat := '% ,0.0000;-% ,0.0000';
  TFloatField(sdqHistorico.FieldByName('tc_sumafija')).DisplayFormat     := '$ ,0.00;-$ ,0.00';
  TFloatField(sdqHistorico.FieldByName('tc_costofinal')).DisplayFormat   := '$ ,0.00;-$ ,0.00';

  if not sdqHistorico.Eof then
  begin
    edTC_SUMAFIJA.Value     := sdqHistorico.FieldByName('tc_sumafija').AsFloat;
    if edTC_SUMAFIJA.Value = 0 then
      edTC_SUMAFIJA.Value := 0.6;
    edTC_PORCVARIABLE.Value := sdqHistorico.FieldByName('tc_porcvariable').AsFloat;
    edTC_COSTOFINAL.Value   := sdqHistorico.FieldByName('tc_costofinal').AsFloat;

    //Guardo el primer ID de la tarifa
    FIdTarifa                         := sdqHistorico.FieldByName('tc_id').AsInteger;
    cmbTC_FECHATECNICA.Date           := sdqHistorico.FieldByName('tc_fechaautorizacion').AsDateTime;
//    edTC_USUTECNICA.Text              := sdqHistorico.FieldByName('tc_usuautorizacion').AsString;
    edTC_OBSERVACIONES.Lines.Text     := sdqHistorico.FieldByName('tc_observaciones').AsString;
    edTC_OBSERVACIONESAlta.Lines.Text := sdqHistorico.FieldByName('tc_observaciones').AsString;
  end
  else
  begin
    edTC_SUMAFIJA.Value     := 0;
    edTC_PORCVARIABLE.Value := 0;
    edTC_COSTOFINAL.Value   := 0;
  end;
end;

procedure TfrmAdminCotizacion.CargarCostoCartera1;
var
  Cadena: TCadena;
  iLoop: Integer;
  iLoop2: Integer;
  sdqDatos: TSDQuery;
  sSql: String;
begin
  FOldNivel     := edCO_NIVEL.Value;
  FOldActividad := fraCO_IDACTIVIDAD.Value;
  if (ModoABM = maAlta) or (ModoABM = maModificacion) then
  begin
    Verificar((edCO_CANTEMPLDESDE.Value < 1) or (edCO_CANTEMPLHASTA.Value < 1), nil, PAGE_COSTOCARTERA, 'La cantidad de empleados debe ser mayor a cero.');

    sSql := 'BEGIN afiliacion.do_cargarcompetencia(:p1, :p2, :p3, :p4); END;';
    EjecutarSqlEx(sSQl, [fraCO_IDACTIVIDAD.AsString, edCO_CANTEMPLDESDE.Value, edCO_CANTEMPLHASTA.Value, Sesion.UserId]);
    
    sSql :=
      'SELECT   cc_cuit, cc_nombre, cc_suma, cc_porcentaje, cc_salario, cc_trabajador, cc_costo' +
         ' FROM tcc_cotizacioncostocartera' +
        ' WHERE cc_usuario = :usuario' +
     ' ORDER BY 7';
   sdqDatos:= GetQueryEx(sSql, [Sesion.UserId]);
  end
  else
  begin
    sSql :=
      'SELECT   em_cuit, em_nombre, cc_suma, cc_porcentaje, cc_salario, cc_trabajador, cc_costo' +
         ' FROM acc_cotizacioncostocartera, aem_empresa' +
        ' WHERE cc_cuit = em_cuit' +
          ' AND cc_idcotizacion = :idcotizacion' +
     ' ORDER BY 7';
   sdqDatos:= GetQueryEx(sSql, [FIdCotizacion]);
  end;

  if not sdqDatos.Eof then
  begin
    GridCostoCartera1.RowCount := GridCostoCartera1.FixedRows + sdqDatos.RecordCount;
    iLoop := 0;
    while not sdqDatos.Eof do
    begin
      //Cargo el ID en un objeto
      Cadena := TCadena.Create;
      Cadena.Valor := sdqDatos.Fields.Fields[0].AsString;
      GridCostoCartera1.Objects[0, GridCostoCartera1.FixedRows + iloop] := Cadena;
      for iLoop2 := 1 to (sdqDatos.FieldCount - 1) do
        case iloop2 of
          1:  GridCostoCartera1.Cells[iloop2 - 1, GridCostoCartera1.FixedRows + iloop] := sdqDatos.Fields.Fields[iloop2].AsString;
          3:  GridCostoCartera1.Cells[iloop2 - 1, GridCostoCartera1.FixedRows + iloop] := ToStr(ToFloat(strReplace(sdqDatos.Fields.Fields[iloop2].AsString, '.', ',')), 3);
          5:  GridCostoCartera1.Cells[iloop2 - 1, GridCostoCartera1.FixedRows + iloop] := ToStr(ToFloat(strReplace(sdqDatos.Fields.Fields[iloop2].AsString, '.', ',')), 0);
        else
          GridCostoCartera1.Cells[iloop2 - 1, GridCostoCartera1.FixedRows + iloop] := ToStr(ToFloat(strReplace(sdqDatos.Fields.Fields[iloop2].AsString, '.', ',')));
      end; //case
      sdqDatos.Next;
      iLoop := iLoop + 1;
    end;
    lblDatosPrecioCartera.Visible := False;
  end
  else
  begin
    LimpiarGrid(GridCostoCartera1, [], [], '');
    lblDatosPrecioCartera.Visible := True;
  end;
end;

procedure TfrmAdminCotizacion.CargarCostoMedico(aEstado: String);
var
  sSql: String;
begin
  if (aEstado = 'altasolicitud') or (aEstado = 'modif') then
  begin
    sSql :=
      'SELECT NVL(dt_costomedico, 0)' +
       ' FROM adt_datotarifador' +
      ' WHERE dt_idactividad = :idactividad' +
        ' AND dt_fechabaja IS NULL';
    edCO_COSTOMEDICO.Value := ValorSqlEx(sSql, [fraCO_IDACTIVIDAD.Value], '0');
  end
  else
  begin
    sSql :=
      'SELECT NVL(co_costomedico, 0)' +
       ' FROM aco_cotizacion' +
      ' WHERE co_id = :id';
    edCO_COSTOMEDICO.Value := ValorSqlEx(sSql, [FIdCotizacion], '0');
  end;
end;

procedure TfrmAdminCotizacion.CargarCostoCartera3;
var
  Cadena: TCadena;
  Query: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT ar_id, ar_nombre, co_idartanterior, co_sumafijaanterior, co_porcvariableanterior, co_masasalarial, co_canttrabajador, co_costofinalanterior, co_form931' +
     ' FROM aco_cotizacion, aar_art' +
    ' WHERE co_idartanterior = ar_id(+)' +
      ' AND co_id = :id';

  //Carga la grilla con el costo de competencia
  Query:= GetQueryEx(sSql, [FIdCotizacion]);
  try
    if not Query.Eof then
    begin
      Cadena := TCadena.Create;
      Cadena.Valor := Query.FieldByName('co_idartanterior').AsString;
      GridCostoCartera3.Objects[0,1] := Cadena;
      GridCostoCartera3.Cells[0,1] := Query.FieldByName('ar_nombre').AsString;
      GridCostoCartera3.Cells[1,1] := Query.FieldByName('co_sumafijaanterior').AsString;
      GridCostoCartera3.Cells[2,1] := ToStr(ToFloat(Query.FieldByName('co_porcvariableanterior').AsString),3);

      //Salario individual
      if ((Query.FieldByName('co_masasalarial').AsString <> '') and (Query.FieldByName('co_canttrabajador').AsString <> '') and (Query.FieldByName('co_canttrabajador').AsFloat <> 0)) then
        GridCostoCartera3.Cells[3,1] := ToStr(Query.FieldByName('co_masasalarial').AsFloat / Query.FieldByName('co_canttrabajador').AsFloat)
      else
        GridCostoCartera3.Cells[3,1] := '';
      GridCostoCartera3.Cells[4,1] := Query.FieldByName('co_canttrabajador').AsString;
      GridCostoCartera3.Cells[5,1] := Query.FieldByName('co_costofinalanterior').AsString;

      //Form931
      if Query.FieldByName('co_form931').AsString = 'S' then
        GridCostoCartera3.Cells[6,1] := 'Datos provenientes de Form. 931'
      else
        GridCostoCartera3.Cells[6,1] := '';
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmAdminCotizacion.CargarCostoCartera2;
var
  Cadena: TCadena;
  iLoop: Integer;
  iLoop2: integer;
  sdqDatos: TSDQuery;
  sSql: String;
begin
//COSTO EN LAS OTRAS AFJP
  fOldNivel := edCO_NIVEL.Value;
  fOldActividad := fraCO_IDACTIVIDAD.Value;

  if (ModoABM = maAlta) or (ModoABM = maModificacion) then
  begin
    sSql :=
      'SELECT ar_id, ar_nombre, cp_suma suma, cp_porcentaje porcentaje' +
       ' FROM acp_costocompetencia, aar_art' +
      ' WHERE cp_idart = ar_id' +
        ' AND cp_idactividad = :idactividad' +
        ' AND cp_nivel = :nivel';
    sdqDatos:= GetQueryEx(sSql, [fraCO_IDACTIVIDAD.AsString, edCO_NIVEL.Value]);
  end
  else
  begin
    sSql :=
      'SELECT ar_id, ar_nombre, co_suma suma, co_porcentaje porcentaje' +
       ' FROM aco_costootros, aar_art' +
      ' WHERE co_idart = ar_id' +
        ' AND co_idcotizacion = :idcotizacion';
    sdqDatos:= GetQueryEx(sSql, [FIdCotizacion]);
  end;

  if not sdqDatos.Eof then
  begin
    GridCostoCartera2.RowCount := GridCostoCartera2.FixedRows + sdqDatos.RecordCount;
    iLoop := 0;
    while not sdqDatos.Eof do
    begin
      iLoop := iLoop + 1;

      //Cargo el ID en un objeto
      Cadena := TCadena.Create;
      Cadena.Valor := sdqDatos.Fields.Fields[0].AsString;
      GridCostoCartera2.Objects[0, iloop] := Cadena;
      for iLoop2 := 0 to (GridCostoCartera2.ColCount - 1) do
        case iloop2 of   //de acuerdo a la columna que sea, eljo que poner...
          0..1: GridCostoCartera2.Cells[iloop2, iloop] := sdqDatos.Fields.Fields[iloop2 + 1].AsString;
          2:    GridCostoCartera2.Cells[iloop2, iloop] := ToStr(ToFloat(sdqDatos.Fields.Fields[iloop2 + 1].AsString), 3);
          3:    GridCostoCartera2.Cells[iloop2, iloop] := GridDatos.Cells[GridDatos.ColCount - 1, 3];  //CS_SALARIOPROMEDIO
          4:    GridCostoCartera2.Cells[iloop2, iloop] := GridDatos.Cells[GridDatos.ColCount - 1, 2];  //CS_CANTTRABAJADORES
          5:    GridCostoCartera2.Cells[iloop2, iloop] := ToStr(ToFloat(GridDatos.Cells[GridDatos.ColCount - 1, 3]) * sdqDatos.FieldByName('porcentaje').AsFloat / 100 + sdqDatos.FieldByName('suma').AsFloat);  //CS_SALARIOPROMEDIO (Total)*CO_PORCENTAJE+CO_SUMA
        end;
      sdqDatos.Next;
    end;
    lblDatosPrecioCompetencia.Visible := False;
  end
  else
  begin
    LimpiarGrid(GridCostoCartera2, [], [], '');
    lblDatosPrecioCompetencia.Visible := True;
  end;
end;

procedure TfrmAdminCotizacion.LimpiarGrid(aGrilla: TStaticGrid; aRowsNoLimpiar, aColsNoLimpiar: Array of Integer; aValor: String = '0');
  function ValueInArray(const aValue: Integer; aArray: Array of Integer): Boolean;
  var
    iLoop: Integer;
  begin
    Result := False;

    for iLoop := Low(aArray) to High(aArray) do
      if aValue = aArray[iLoop] then
      begin
        Result := True;
        Break;
      end;
  end;

var
  iLoop: Integer;
  iLoop2: Integer;
begin
  for iLoop := aGrilla.FixedRows to aGrilla.RowCount do
    if not ValueInArray(iLoop, aRowsNoLimpiar) then
      for iLoop2 := aGrilla.FixedCols to aGrilla.ColCount do
        if not ValueInArray(iLoop2, aColsNoLimpiar) then
          aGrilla.Cells[iLoop2, iLoop] := aValor;
end;

function TfrmAdminCotizacion.DoABM: Boolean;
var
  aBlob: TStringList;
  aCadena: TCadena;
  bExisteACZ: Boolean;
  eValor: Extended;
  IDArt: String;
  iLoop: Integer;
  iLoop2: Integer;
  iTmpId: Integer;
  sPuestoAutorizacion: String;
  SqlAlternativasCotizacion: TSql;
  SqlCostoCartera1: TSql;
  SqlCostoCartera2: TSql;
  SqlCotizacion: TSql;
  SqlCotizador: TSql;
  SqlDetalleILP: TSql;
  SqlPrevencion: TSql;
  SqlSiniestro: TSql;
  SqlTarifa: TSql;
  sSql: String;
  sUpdateSql: String;
  sUsuarioAutorizacion: String;
begin
  Result := True;

  BeginTrans;
  SqlCotizacion             := TSql.Create('aco_cotizacion');
  SqlTarifa                 := TSql.Create('atc_tarifacobrar');
  SqlPrevencion             := TSql.Create('acp_cotizacionprevencion');
  SqlCotizador              := TSql.Create('acz_cotizador');
  SqlAlternativasCotizacion := TSql.Create('aac_alternativascotizacion');
  try
    try
      //GRABA LOS DATOS CORRESPONDIENTES A LA SRT
      if frmCargaSrtCoti.HuboCambios then
        frmCargaSrtCoti.GuardarCambios;

      if ModoABM = maAlta then
      begin
        SqlCotizacion.SqlType := stInsert;
        SqlCotizacion.PrimaryKey.Add('co_id', FIdCotizacion, False);
        SqlCotizacion.Fields.Add('co_nrocotizacion', ValorSqlInteger('SELECT NVL(MAX(co_nrocotizacion), 0) + 1 FROM aco_cotizacion'));
      end
      else
      begin
        SqlCotizacion.SqlType := stUpdate;
        SqlCotizacion.PrimaryKey.Add('co_id', FIdCotizacion, False);
      end;

      if not cmbCO_FECHAVIGENCIA.IsEmpty then
        SqlCotizacion.Fields.Add('co_fechavigencia', 			cmbCO_FECHAVIGENCIA.Date);

      SqlCotizacion.Fields.Add('co_cuit', 								edCO_CUIT.Text);
      SqlCotizacion.Fields.Add('co_razonsocial', 					edCO_RAZONSOCIAL.Text);
      SqlCotizacion.Fields.Add('co_idactividad', 					fraCO_IDACTIVIDAD.Value);

      if fraCO_USUARIOSOLICITADO.Visible then
        SqlCotizacion.Fields.Add('co_usuariosolicitado', 		fraCO_USUARIOSOLICITADO.Value)
      else
        SqlCotizacion.Fields.Add('co_usuariosolicitado', 		'W_' + Copy(edUsuarioSolicito.Text, 6, 100));

      SqlCotizacion.Fields.Add('co_contacto', 						edCO_CONTACTO.Text);
      SqlCotizacion.Fields.Add('co_telefono', 						edCO_TELEFONO.Text);
      SqlCotizacion.Fields.Add('co_nivel', 								edCO_NIVEL.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_costomedico', 					edCO_COSTOMEDICO.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_idfidelitas', 					fraCO_IDFIDELITAS.edCodigo.Text);
      SqlCotizacion.Fields.Add('co_statusbcra', 					fraStatusBCRA2.edCodigo.Text);
      SqlCotizacion.Fields.Add('co_clausulasadicionales', edCO_CLAUSULASADICIONALES.Text);
      SqlCotizacion.Fields.Add('co_canttrabajador', 			edCO_CANTTRABAJADOR.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_establecimientos', 		edCO_ESTABLECIMIENTOS.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_masasalarial', 				edCO_MASASALARIAL.Value, dtNumber);

      if not cmbCO_FECHAAPERTURA.IsEmpty then
        SqlCotizacion.Fields.Add('co_fechaapertura', 			cmbCO_FECHAAPERTURA.Date)
      else
        SqlCotizacion.Fields.Add('co_fechaapertura', 			'NULL', False);

      SqlCotizacion.Fields.Add('co_idgrupoeconomico', 		fraCO_IDGRUPOECONOMICO.Value);
      SqlCotizacion.Fields.Add('co_cantempldesde', 				edCO_CANTEMPLDESDE.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_cantemplhasta', 				edCO_CANTEMPLHASTA.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_cantempresas', 				edCO_CANTEMPRESAS.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_carterapromedio', 			edCO_CARTERAPROMEDIO.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_carterapromediopond', 	edCO_CARTERAPROMEDIOPOND.Value, dtNumber);


      //Costo competencia
      IDArt := ValorSqlEx('SELECT ar_id FROM aar_art WHERE ar_nombre = :nombre', [GridCostoCartera3.Cells[0, 1]]);
      if IDArt <> '' then
        SqlCotizacion.Fields.Add('co_idartanterior', 				StrToIntDef(IDArt, 0));
      if GridCostoCartera3.Cells[1, 1] <> '' then
        SqlCotizacion.Fields.Add('co_sumafijaanterior', 		GridCostoCartera3.Cells[1, 1], dtNumber);
      if GridCostoCartera3.Cells[2, 1] <> '' then
        SqlCotizacion.Fields.Add('co_porcvariableanterior', GridCostoCartera3.Cells[2, 1], dtNumber);
      if GridCostoCartera3.Cells[5, 1] <> '' then
        SqlCotizacion.Fields.Add('co_costofinalanterior', 	GridCostoCartera3.Cells[5, 1], dtNumber);
      if GridCostoCartera3.Cells[6, 1] <> '' then
        SqlCotizacion.Fields.Add('co_form931', 							'S')
      else
        SqlCotizacion.Fields.Add('co_form931', 							'N');


      //Costo Siniestral y tasa de incidencia
      SqlCotizacion.Fields.Add('co_costosiniestral', GridEvolucionAnual.Cells[GridEvolucionAnual.ColCount - 1, 0], dtNumber);
      SqlCotizacion.Fields.Add('co_tasaincidencia',  GridEvolucionAnual.Cells[GridEvolucionAnual.ColCount - 1, 1], dtNumber);

      //ultima Pagina
      SqlCotizacion.Fields.Add('co_observaciones', edCO_OBSERVACIONES.Lines.Text);

      sSql :=
        'SELECT co_usuarioconfecciono' +
         ' FROM aco_cotizacion' +
        ' WHERE co_id = :id';
      if ValorSqlEx(sSql, [FIdCotizacion]) = '' then
      begin
        SqlCotizacion.Fields.Add('co_fechaconfecciono', 	SQL_DATETIME, False);
        SqlCotizacion.Fields.Add('co_usuarioconfecciono', Sesion.UserID);
      end;

      //Pone el estado correspondiente
      SqlCotizacion.Fields.Add('co_estado', fraCO_ESTADO.Value);

      sSql :=
        'SELECT co_usuariocambiousuautoriza' +
         ' FROM aco_cotizacion' +
        ' WHERE co_id = :id';
      if (fraCO_ESTADO.Value = EC_PEND_AUTORIZ) and (ValorSqlEx(sSql, [FIdCotizacion]) = '') then
      begin
        GetUsuarioAutorizacion(sUsuarioAutorizacion, sPuestoAutorizacion);
        SqlCotizacion.Fields.Add('co_usuarioautorizacion', sUsuarioAutorizacion);
        SqlCotizacion.Fields.Add('co_puestoautorizacion', sPuestoAutorizacion);
      end;

      SqlCotizacion.Fields.Add('co_comision', edComisionCotizada.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_acpo',     edAcpo.Value, dtNumber);

      SqlCotizacion.Fields.Add('co_sumafijapiso',     edCostoFijoTP.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_porcvariablepiso', edCostoVariableTP.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_costofinalpiso',   edCostoFinalTP.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_comisionpiso',     edComisionTP.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_acpopiso',         edAcpoTP.Value, dtNumber);

      SqlCotizacion.Fields.Add('co_chek_iltempleador',    IIF(chkIltEmpleador.Checked, 'S', 'N'), dtString);
      SqlCotizacion.Fields.Add('co_chek_frecuenciasin',   IIF(chkFrecuencuaSiniestral.Checked, 'S', 'N'), dtString);
      SqlCotizacion.Fields.Add('co_chek_juicios',         IIF(chkJuicios.Checked, 'S', 'N'), dtString);
      SqlCotizacion.Fields.Add('co_checktarifaunificada', IIF(chkTarifaUnificada.Checked, 'S', 'N'), dtString);
      SqlCotizacion.Fields.Add('co_chek_ilp',             IIF(chkIlp.Checked, 'S', 'N'), dtString);
      SqlCotizacion.Fields.Add('co_chek_preciocomp',      IIF(chkPrecioCompetencia.Checked, 'S', 'N'), dtString);
      SqlCotizacion.Fields.Add('co_indicecombinado',      edIndiceCombinado.Value, dtNumber);
      SqlCotizacion.Fields.Add('co_cargamanualic',        IIF(chkCargaManual.Checked, 'S', 'N'), dtString);

      //grabo si la empresa en nueva en el regimen de la SRT
      if frmCargaSRTCoti.EmpresaNueva then
        SqlCotizacion.Fields.Add('co_empresanueva', 'S')
      else
        SqlCotizacion.Fields.Add('co_empresanueva', 'N');


      //Ejecuto la transaccion
      EjecutarSqlST(SqlCotizacion.Sql);

      // Guardo la fecha en que se guardan las observaciones..
      sSql :=
        'UPDATE aco_cotizacion' +
          ' SET co_fechaobservacioncuit = SYSDATE' +
        ' WHERE co_fechaobservacioncuit IS NULL' +
          ' AND co_id = :id';
      EjecutarSqlSTEx(sSql, [FIdCotizacion]);


      //GRABO EL TEXTO DEL FIDELITAS
      sSql :=
        'SELECT co_textofidelitas' +
         ' FROM aco_cotizacion' +
        ' WHERE co_id = ' + SqlValue(FIdCotizacion);
      sUpdateSql :=
        'UPDATE aco_cotizacion' +
          ' SET co_textofidelitas = :co_textofidelitas' +
        ' WHERE co_id = ' + SqlValue(FIdCotizacion);
      aBlob := TStringList.Create;
      try
        aBlob.Text := edCO_TEXTOFIDELITAS.Lines.Text;
        SaveBlob(sSql, sUpdateSql, 'CO_TEXTOFIDELITAS', aBlob);
      finally
        aBlob.Free;
      end;

      //Agrega la informacion correspondiente a los siniestros
      sSql :=
        'UPDATE aco_cotizacion' +
          ' SET (co_concie10, co_sincie10, co_frecuencia, co_cantempresa, co_cantempresastro) =' +
                ' (SELECT DISTINCT NVL(dt_concie10, 0), NVL(dt_sincie10, 0), NVL(dt_frecuencia * 100, 0), NVL(dt_cantempresa, 0), NVL(dt_cantempresaconstro, 0)' +
                            ' FROM adt_datotarifador' +
                           ' WHERE dt_idactividad = :idactividad' +
                             ' AND dt_fechabaja IS NULL)' +
        ' WHERE co_id = :id';
      EjecutarSqlSTEx(sSql, [fraCO_IDACTIVIDAD.AsString, FIdCotizacion]);

      //Actualizo la tabla de solicitudes de cotizacion si es necesario
      if FEsSolicitud then
      begin
        // Valido que la cotización no haya sudo cargada por otro usuario..
        sSql :=
          'SELECT sc_idcotizacion' +
           ' FROM asc_solicitudcotizacion' +
          ' WHERE sc_id = :id';
        iTmpId := ValorSqlIntegerEx(sSql, [FIdSolicitud]);

        // Si ya tiene cotización y no es la misma que la que está haciendo el usuario actual..
        sSql :=
          'SELECT co_usuarioconfecciono' +
           ' FROM aco_cotizacion' +
          ' WHERE co_id = :id';
        Verificar(((iTmpId > 0) and (iTmpId <> FIdCotizacion)), nil, PCCotizaciones.ActivePageIndex, Format('La cotización ya fue cargada por el usuario %s.', [ValorSqlEx(sSql, [FIdCotizacion])]));


        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_idcotizacion = :idcotizacion' +
          ' WHERE sc_id = :id';
        EjecutarSqlSTEx(sSql, [FIdCotizacion, FIdSolicitud]);
        sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
        EjecutarSqlSTEx(sSql, [FIdSolicitud]);
      end;

      //Actualizo el estado de la solicitud
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_estado = :estado' +
        ' WHERE sc_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [fraCO_ESTADO.Value, FIdCotizacion]);
      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [FIdCotizacion]);


      //Prevencion
      if ModoABM = maAlta then
      begin
        //ACA DEBERIA MANDAR UN MAIL
        SqlPrevencion.SqlType := stInsert;
        SqlPrevencion.PrimaryKey.Add('cp_id', 			'SEQ_ACOP_ID.NEXTVAL', False);
        SqlPrevencion.Fields.Add('cp_informe', 			'');
        SqlPrevencion.Fields.Add('cp_estado', 			'05'); //Estado pendiente de respuesta
        SqlPrevencion.Fields.Add('cp_idcotizacion', FIdCotizacion);
        SqlPrevencion.Fields.Add('cp_usualta', 			Sesion.UserId);
        SqlPrevencion.Fields.Add('cp_fechaalta', 		SQL_ACTUALDATE, False);
        EjecutarSqlST(SqlPrevencion.Sql);
      end;

      if FCambioCotizacion then
      begin
        with SqlTarifa do
        begin
          SqlType := stInsert;
          PrimaryKey.Add('tc_id', 			'SEQ_ATCC_ID.NEXTVAL', false);
          Fields.Add('tc_idcotizacion',  FIdCotizacion, False);
          Fields.Add('tc_sumafija', 		 edTC_SUMAFIJA.Value);
          Fields.Add('tc_porcvariable',  edTC_PORCVARIABLE.Value);
          Fields.Add('tc_costofinal', 	 edTC_COSTOFINAL.Value);
          Fields.Add('tc_observaciones', edTC_OBSERVACIONESAlta.Lines.Text);
          Fields.Add('tc_fechaalta',		'SYSDATE', False);
          Fields.Add('tc_usualta', 			 Sesion.UserId);
          EjecutarSqlST(Sql);
        end;
      end
      else if (edTC_OBSERVACIONESAlta.Lines.Text <> sdqHistorico.FieldByName('tc_observaciones').AsString) then
      begin
        sSql :=
          'UPDATE atc_tarifacobrar' +
            ' SET tc_observaciones = :observaciones' +
          ' WHERE tc_id = :id';
        EjecutarSqlSTEx(sSql, [edTC_OBSERVACIONESAlta.Lines.Text, FIdTarifa]);
      end;

      if ModoABM <> maAlta then
      begin
        // Borro los registros anteriores
        // Borro primero los campos
        sSql := 'DELETE FROM adi_detalleilp WHERE di_idcotizacion = :idcotizacion';
        EjecutarSqlSTEx(sSql, [FIdCotizacion]);
      end;

      // Graba si posee un registro no vacio
      if (GridDetalleILP.Cells[0, GridDetalleILP.RowCount - 1] <> '') then
        for iLoop := GridDetalleILP.FixedRows to (GridDetalleILP.RowCount - 1) do
        begin
          SqlDetalleILP := TSql.Create('adi_detalleilp');

          with SqlDetalleILP do
          try
            SqlType := stInsert;
            PrimaryKey.Add('di_id', 'SEQ_ADI_ID.NEXTVAL', False);

            Fields.Add('di_idcotizacion', FIdCotizacion, False);
            Fields.Add('di_fechaalta',    SQL_DATETIME, False);
            Fields.Add('di_usualta',      'D_' + Sesion.UserID);
            Fields.Add('di_fechamodif',   SQL_DATETIME, False);
            Fields.Add('di_usumodif',     'D1_' + Sesion.UserID);

            // Cargo los campos con la información de la grilla
            Fields.Add('di_sexo', GridDetalleILP.Cells[0, iLoop]);
            if GridDetalleILP.Cells[1, iLoop] <> '' then
              Fields.Add('di_fechanac', StrToDate(GridDetalleILP.Cells[1, iLoop]));
            Fields.Add('di_edad',       GridDetalleILP.Cells[2, iLoop], dtNumber);
            Fields.Add('di_anio',       GridDetalleILP.Cells[3, iLoop], dtNumber);
            Fields.Add('di_porcentaje', GridDetalleILP.Cells[4, iLoop], dtNumber);
            Fields.Add('di_muerte',     GridDetalleILP.Cells[5, iLoop]);
            if GridDetalleILP.Cells[6, iLoop] <> '' then
              Fields.Add('di_fechaaccidente', StrToDate(GridDetalleILP.Cells[6, iLoop]));

            EjecutarSqlST(Sql);
          finally
            FreeAndNil(SqlDetalleILP);
          end;
        end;

      if ModoABM <> maAlta then
      begin
        // Borro primero los campos
        sSql := 'DELETE FROM acc_cotizacioncostocartera WHERE cc_idcotizacion = :idcotizacion';
        EjecutarSqlSTEx(sSql, [FIdCotizacion]);
      end;

      for iLoop := GridCostoCartera1.FixedRows to (GridCostoCartera1.RowCount - GridCostoCartera1.FixedRows) do
        if (Assigned(GridCostoCartera1.Objects[0, iLoop])) and (GridCostoCartera1.Cells[0, iLoop] <> '') then
        begin
          SqlCostoCartera1 := TSql.Create('acc_cotizacioncostocartera');
          with SqlCostoCartera1 do
          try
            SqlType := stInsert;
            PrimaryKey.Add('cc_id', 'SEQ_ACCC_ID.NEXTVAL', False);
            Fields.Add('cc_idcotizacion', FIdCotizacion, False);
            Fields.Add('cc_cuit',         (GridCostoCartera1.Objects[0, iLoop] as TCadena).Valor); //Toma el objeto
            Fields.Add('cc_suma',         GridCostoCartera1.Cells[1, iLoop], dtNumber);
            Fields.Add('cc_porcentaje',   GridCostoCartera1.Cells[2, iLoop], dtNumber);
            Fields.Add('cc_salario',      GridCostoCartera1.Cells[3, iLoop], dtNumber);
            Fields.Add('cc_trabajador',   GridCostoCartera1.Cells[4, iLoop], dtNumber);
            Fields.Add('cc_costo',        GridCostoCartera1.Cells[5, iLoop], dtNumber);
            EjecutarSqlST(Sql);
          finally
            FreeAndNil(SqlCostoCartera1);
          end;
        end;

      // Grid Costo Cartera 2
      if ModoABM <> maAlta then
      begin
        // Borro primero los campos
        sSql := 'DELETE FROM aco_costootros WHERE co_idcotizacion = :idcotizacion';
        EjecutarSqlSTEx(sSql, [FIdCotizacion]);
      end;

      for iLoop := GridCostoCartera2.FixedRows to (GridCostoCartera2.RowCount - GridCostoCartera2.FixedRows) do
      begin
        SqlCostoCartera2 := TSql.Create('aco_costootros');
        with SqlCostoCartera2 do
        try
          SqlType := stInsert;
          PrimaryKey.Add('co_id', 'SEQ_ACOO_ID.NEXTVAL', False);
          Fields.Add('co_idcotizacion', FIdCotizacion, False);

          if GridCostoCartera2.Objects[0, iLoop] = nil then
          begin
            aCadena := TCadena.Create;
            aCadena.Valor := '0';
            GridCostoCartera2.Objects[0, iLoop] := aCadena;
          end;

          Fields.Add('co_idart',      (GridCostoCartera2.Objects[0, iLoop] as TCadena).Valor, dtNumber); //Toma el objeto
          Fields.Add('co_suma',       StrToFloatDef(GridCostoCartera2.Cells[1, iLoop], 0), dtNumber);
          Fields.Add('co_porcentaje', StrToFloatDef(GridCostoCartera2.Cells[2, iLoop], 0), dtNumber);
          Fields.Add('co_salario',    StrToFloatDef(GridCostoCartera2.Cells[3, iLoop], 0), dtNumber);
          Fields.Add('co_trabajador', StrToFloatDef(GridCostoCartera2.Cells[4, iLoop], 0), dtNumber);
          Fields.Add('co_costo',      StrToFloatDef(GridCostoCartera2.Cells[5, iLoop], 0), dtNumber);
          EjecutarSqlST(Sql);
        finally
          FreeAndNil(SqlCostoCartera2);
        end;
      end;

      // Agrego los datos correspondientes a la grilla principal de datos de siniestro
      if ModoABM <> maAlta then
      begin
        // Borro primero los campos menos el año actual que lo cargaron desde el cotizador porque no lo pueden capturar
        // desde la web arts.gov.ar..
        sSql := 'DELETE FROM acs_cotizacionsiniestro WHERE cs_idcotizacion = :idcotizacion';
        EjecutarSqlSTEx(sSql, [FIdCotizacion]);
      end;

      for iLoop := GridDatos.FixedCols to (GridDatos.ColCount - GridDatos.FixedCols - 1) do //dejo afuera la columna de totales y la fija
      begin
        SqlSiniestro := TSql.Create('acs_cotizacionsiniestro');
        with SqlSiniestro do
        try
          SqlType := stInsert;
          PrimaryKey.Add('cs_id', 'SEQ_TEC_ACS_ID.NEXTVAL', False);
          Fields.Add('cs_idcotizacion', FIdCotizacion, False);

          // Cargo los campos con la información de la grilla
          for iLoop2 := 0 to High(CAMPOS_GRID) do
            if iLoop2 = 22 then    // Si es el índice de incidencia..
              Fields.Add(CAMPOS_GRID[iLoop2], '0' + StrReplace(GridDatos.Cells[iLoop, iLoop2], ',', ''))
            else
              Fields.Add(CAMPOS_GRID[iLoop2], '0' + StrReplace(StrReplace(GridDatos.Cells[iLoop, iLoop2], '.', ''), ',', '.'));

          EjecutarSqlST(Sql);
        finally
          FreeAndNil(SqlSiniestro);
        end;
      end;


      // Agrego datos en la tabla ACZ_COTIZADOR..
      sSql :=
        'SELECT cz_id' +
         ' FROM acz_cotizador' +
        ' WHERE cz_idcotizacion = :idcotizacion';
      bExisteACZ := ExisteSqlEx(sSql, [FIdCotizacion]);
      if not bExisteACZ then
      begin
        SqlCotizador.SqlType := stInsert;
        SqlCotizador.PrimaryKey.Add('cz_id', 									'SEQ_ACZ_ID.NEXTVAL', False);
        SqlCotizador.Fields.Add('cz_idcotizacion', 						 FIdCotizacion, False);
        SqlCotizador.Fields.Add('cz_usualta', 								 Sesion.UserId);
        SqlCotizador.Fields.Add('cz_fechaalta', 							 SQL_ACTUALDATE, False);
        SqlCotizador.Fields.Add('cz_idartanterior', 					 fraSC_IDARTANTERIOR.Value, True);
        SqlCotizador.Fields.Add('cz_competenciacostofijo', 		 Extended(IIF((edSumaFija.Value > 0.6), edSumaFija.Value - 0.6, 0)));
        SqlCotizador.Fields.Add('cz_competenciacostovariable', edPorcVariable.Value);

				eValor := (edPorcVariable.Value / 100) * ((edCO_MASASALARIAL.Value / edCO_CANTTRABAJADOR.Value) * 13 / 12) + Extended(IIF((edSumaFija.Value > 0.6), edSumaFija.Value - 0.6, 0));
				SqlCotizador.Fields.Add('cz_competenciapesosporcapita', eValor);

		    if (edCO_MASASALARIAL.Value / edCO_CANTTRABAJADOR.Value) = 0 then
        	eValor := 0
		    else
    		  eValor := eValor / ((edCO_MASASALARIAL.Value / edCO_CANTTRABAJADOR.Value) * 13 / 12) * 100;
        SqlCotizador.Fields.Add('cz_competenciatasavariable', eValor);

        if fraSector.Value <> '' then
        begin
          sSql :=
            'SELECT ' + IIF((fraSector.Codigo = '2'), 'zg_valorjuiciosmunicipio',
                        IIF((fraSector.Codigo = '3'), 'zg_valorjuiciosotros',
                        IIF((fraSector.Codigo = '4'), 'zg_valorjuiciosprivados', '0'))) +
             ' FROM afi.azg_zonasgeograficas' +
            ' WHERE zg_id = ' + SqlValue(fraZonaGeografica.Value);

          // Según ticket 20254 se pone este valor en 0..
          SqlCotizador.Fields.Add('cz_juiciosrecvalorcartera', 0, -1, True);
//          SqlCotizador.Fields.Add('cz_juiciosrecvalorcartera', ValorSqlExtended(sSql), -1, True);
        end;

        SqlCotizador.Fields.Add('cz_actividadreal',        edfpSC_ACTIVIDADREAL.Text);
        SqlCotizador.Fields.Add('cz_edadpromedio', 				 edSC_EDADPROMEDIO.Value);
        SqlCotizador.Fields.Add('cz_idprobabilidadcierre', ValorSqlInteger('SELECT sc_idprobabilidadcierre FROM asc_solicitudcotizacion WHERE sc_id = ' + SqlValue(FIdSolicitud)));
        SqlCotizador.Fields.Add('cz_idzonageografica',     fraZonaGeografica.Value);
        SqlCotizador.Fields.Add('cz_sector', 					     fraSector.Value);
        SqlCotizador.Fields.Add('cz_acpo', 					       ValorSqlExtendedEx('SELECT (pr_porcentaje - 5) * 1.21' +
                                                                               ' FROM pago.ppr_porcentaje, asc_solicitudcotizacion' +
                                                                              ' WHERE pr_identidad = sc_identidad' +
                                                                                ' AND sc_id = :id', [FIdSolicitud]));

        // Lleno los campos con valores por default según tengan prestaciones especiales o no..
        sSql :=
          'SELECT DECODE(sc_prestaciones_especiales, ''S'', 0.2, 1) factorriesgo,' +
                ' DECODE(sc_prestaciones_especiales, ''S'', :valor, 0) otraserogaciones,' +
                ' DECODE(sc_prestaciones_especiales, ''S'', 1, NULL) ponderadores' +
           ' FROM asc_solicitudcotizacion' +
          ' WHERE sc_id = :id';
        with GetQueryEx(sSql, [OTRAS_EROGACIONES, FIdSolicitud]) do
        try
          SqlCotizador.Fields.Add('cz_explotacionfijos', FieldByName('otraserogaciones').AsFloat, -1);
          edOE.Value   := FieldByName('otraserogaciones').AsFloat;
          edOETP.Value := FieldByName('otraserogaciones').AsFloat;

          SqlCotizador.Fields.Add('cz_ponderadores', FieldByName('ponderadores').AsInteger);

          // Pongo los valores por defecto del factor riesgo..
          SqlCotizador.Fields.Add('cz_especiesespfactorriesgo',     FieldByName('factorriesgo').AsFloat, -1, True);
          SqlCotizador.Fields.Add('cz_iltespfactorriesgo',          FieldByName('factorriesgo').AsFloat, -1, True);

          SqlCotizador.Fields.Add('cz_especiesfrecfactorriesgo',    1, False);
          SqlCotizador.Fields.Add('cz_iltfrecfactorriesgo',         1, False);
          SqlCotizador.Fields.Add('cz_incap050frecfactorriesgo',    1, False);
          SqlCotizador.Fields.Add('cz_incap050espfactorriesgo',     1, False);
          SqlCotizador.Fields.Add('cz_incap5066frecfactorriesgo',   1, False);
          SqlCotizador.Fields.Add('cz_incap5066espfactorriesgo',    1, False);
          SqlCotizador.Fields.Add('cz_incap5066incapfactorriesgo',  1, False);
          SqlCotizador.Fields.Add('cz_incap66100frecfactorriesgo',  1, False);
          SqlCotizador.Fields.Add('cz_incap66100espfactorriesgo',   1, False);
          SqlCotizador.Fields.Add('cz_incap66100incapfactorriesgo', 1, False);
          SqlCotizador.Fields.Add('cz_muertefrecfactorriesgo',      1, False);
          SqlCotizador.Fields.Add('cz_muerteespfactorriesgo',       1, False);
          SqlCotizador.Fields.Add('cz_muerteincapfactorriesgo',     1, False);
          SqlCotizador.Fields.Add('cz_juiciosrecfactorriesgo',      1, False);
        finally
          Free;
        end;
      end
      else
      begin
        SqlCotizador.SqlType := stUpdate;
        SqlCotizador.PrimaryKey.Add('cz_id', 		 ValorSqlIntegerEx(sSql, [FIdCotizacion]), False);
        SqlCotizador.Fields.Add('cz_usumodif', 	 Sesion.UserId);
//        SqlCotizador.Fields.Add('cz_fechamodif', SQL_ACTUALDATE, False);
      end;
      SqlCotizador.Fields.Add('cz_establecimientos', 				edCO_ESTABLECIMIENTOS.Value);
      SqlCotizador.Fields.Add('cz_finalsumafija', 					edTC_SUMAFIJA.Value);
      SqlCotizador.Fields.Add('cz_finalporcentajevariable', edTC_PORCVARIABLE.Value);
      SqlCotizador.Fields.Add('cz_finalpesosporcapita', 		edTC_COSTOFINAL.Value);

      if FIdCotizacion > 0 then
      begin
        sSql :=
          'SELECT cz_idlocalidad' +
           ' FROM acz_cotizador' +
          ' WHERE cz_idcotizacion = :idcotizacion';
        if ValorSqlIntegerEx(sSql, [FIdCotizacion]) < 1 then
        begin
          sSql :=
            'SELECT   eu_idlocalidad' +
               ' FROM afi.aeu_establecimientos, asc_solicitudcotizacion' +
              ' WHERE eu_idsolicitud = sc_id' +
                ' AND eu_idlocalidad IS NOT NULL' +
                ' AND eu_tiposolicitud = 1' +
                ' AND eu_fechabaja IS NULL' +
                ' AND sc_idcotizacion = :idcotizacion' +
           ' ORDER BY eu_id';
          SqlCotizador.Fields.Add('cz_idlocalidad', ValorSqlIntegerEx(sSql, [FIdCotizacion]));
        end;
      end
      else
      begin
        sSql :=
          'SELECT   eu_idlocalidad' +
             ' FROM afi.aeu_establecimientos' +
            ' WHERE eu_idsolicitud = :idsolicitud' +
              ' AND eu_idlocalidad IS NOT NULL' +
              ' AND eu_tiposolicitud = 1' +
              ' AND eu_fechabaja IS NULL' +
         ' ORDER BY eu_id';
        SqlCotizador.Fields.Add('cz_idlocalidad', ValorSqlIntegerEx(sSql, [FIdSolicitud]));
      end;

      EjecutarSqlST(SqlCotizador.Sql);

      if (not bExisteACZ) or ((bExisteACZ) and (FCIIUAnterior <> fraCO_IDACTIVIDAD.Value)) then
      begin
        if FCIIUAnterior <> fraCO_IDACTIVIDAD.Value then
          MsgBox('Los valores de referencia de cartera se actualizan según el CIIU, por favor verificar.');

        sSql := 'art.afi.set_valores_fijos_cotizador(:idcotizacion);';
        EjecutarStoreSTEx(sSql, [FIdCotizacion]);
      end;


      // Actualizo los valores del cotizador que varian si se cargan o eliminan detalles ilp..
      sSql := 'art.afi.update_valores_fijos_cotizador(:idcotizacion);';
      EjecutarStoreSTEx(sSql, [FIdCotizacion]);


      // Agrego datos en la tabla AAC_ALTERNATIVASCOTIZACION..
      sSql :=
        'SELECT   ac_id' +
           ' FROM aac_alternativascotizacion' +
          ' WHERE ac_idcotizacion = :idcotizacion' +
       ' ORDER BY ac_id';
      if not ExisteSqlEx(sSql, [FIdCotizacion]) then
      begin
        // Inserto la opción 1 del cotizador..
        SqlAlternativasCotizacion.SqlType := stInsert;
        SqlAlternativasCotizacion.PrimaryKey.Add('ac_id', 			'SEQ_AAC_ID.NEXTVAL', False);
        SqlAlternativasCotizacion.Fields.Add('ac_idcotizacion', FIdCotizacion, False);
        SqlAlternativasCotizacion.Fields.Add('ac_usualta', 			Sesion.UserId);
        SqlAlternativasCotizacion.Fields.Add('ac_fechaalta', 		SQL_ACTUALDATE, False);
        SqlAlternativasCotizacion.Fields.Add('ac_comision', 		edCO_COMISION.Value);
        SqlAlternativasCotizacion.Fields.Add('ac_fijo', 		    'T');
        EjecutarSqlST(SqlAlternativasCotizacion.Sql);

        // Inserto la opción 2 del cotizador..
        SqlAlternativasCotizacion.Fields.Clear;
        SqlAlternativasCotizacion.PrimaryKey.Clear;

        SqlAlternativasCotizacion.PrimaryKey.Add('ac_id', 			'SEQ_AAC_ID.NEXTVAL', False);
        SqlAlternativasCotizacion.Fields.Add('ac_idcotizacion', FIdCotizacion, False);
        SqlAlternativasCotizacion.Fields.Add('ac_usualta', 			Sesion.UserId);
        SqlAlternativasCotizacion.Fields.Add('ac_fechaalta', 		SQL_ACTUALDATE, False);
        SqlAlternativasCotizacion.Fields.Add('ac_numero', 		  2, False);
        SqlAlternativasCotizacion.Fields.Add('ac_comision', 		edCO_COMISION.Value);
        SqlAlternativasCotizacion.Fields.Add('ac_juicios', 		  ValorSqlExtendedEx('SELECT zg_valorjuiciosprivados' +
                                                                                    ' FROM afi.azg_zonasgeograficas' +
                                                                                   ' WHERE zg_id = :id',
                                                                                   [fraZonaGeografica.Value]));
        SqlAlternativasCotizacion.Fields.Add('ac_gsvariables', 	GASTOS_VARIABLES_ALTERNATIVA_COTIZACION_2);
        SqlAlternativasCotizacion.Fields.Add('ac_fijo', 		    'T');
        EjecutarSqlST(SqlAlternativasCotizacion.Sql);

        // Inserto la opción 3 del cotizador..
        SqlAlternativasCotizacion.Fields.Clear;
        SqlAlternativasCotizacion.PrimaryKey.Clear;

        SqlAlternativasCotizacion.PrimaryKey.Add('ac_id', 			'SEQ_AAC_ID.NEXTVAL', False);
        SqlAlternativasCotizacion.Fields.Add('ac_idcotizacion', FIdCotizacion, False);
        SqlAlternativasCotizacion.Fields.Add('ac_usualta', 			Sesion.UserId);
        SqlAlternativasCotizacion.Fields.Add('ac_fechaalta', 		SQL_ACTUALDATE, False);
        SqlAlternativasCotizacion.Fields.Add('ac_numero', 		  3, False);
        SqlAlternativasCotizacion.Fields.Add('ac_comision', 		edCO_COMISION.Value);
        SqlAlternativasCotizacion.Fields.Add('ac_juicios', 		  ValorSqlExtendedEx('SELECT zg_valorjuiciosprivados' +
                                                                                    ' FROM afi.azg_zonasgeograficas' +
                                                                                   ' WHERE zg_id = :id',
                                                                                   [fraZonaGeografica.Value]));
        SqlAlternativasCotizacion.Fields.Add('ac_gsvariables', 	GASTOS_VARIABLES_ALTERNATIVA_COTIZACION_3);
        SqlAlternativasCotizacion.Fields.Add('ac_fijo', 		    'T');
        EjecutarSqlST(SqlAlternativasCotizacion.Sql);
      end;

      if Assigned(frmConsultaCotizacion) then
        frmConsultaCotizacion.tbRefrescarClick(nil);
      CommitTrans;
    except
      on E: Exception do
      begin
        if Pos('ORA-20008', E.Message) > 0 then
          MsgBox('No se puede autorizar una cotización que no tenga cargada la tarifa piso.')
        else
          ErrorMsg(E, 'Error al guardar los datos.');
        RollBack;
        Result := False;
      end;
    end;
  finally
    SqlCotizacion.Free;
    SqlTarifa.Free;
    SqlPrevencion.Free;
    SqlCotizador.Free;
    SqlAlternativasCotizacion.Free;
  end;
end;

procedure TfrmAdminCotizacion.FSFormCreate(Sender: TObject);
begin
  UnTouch := TList.Create;
  UnTouch.Add(edCO_NROCOTIZACION);
  UnTouch.Add(edOrden);
  UnTouch.Add(PCCotizaciones);
  FreeAndNil(frmCargaSRTCoti);
  frmCargaSRTCoti := TfrmCargaSRTCoti.Create(PCCotizaciones.Pages[PAGE_SRT]);

  inherited;

  edCO_NROCOTIZACION.Clear;
  edOrden.Clear;

  PCCotizaciones.ActivePageIndex := PAGE_SOLICITUD;
//  frmPrincipal.mnuAdminCotizacion.Enabled := False;
  fraCO_IDFIDELITAS.Clave := 'FIDEL';
  fraCO_IDFIDELITAS.OnChange := CambiaFidelitas;
  //PnlDatos.Anchors := PnlDatos.Anchors + [AkBottom];
  PnlDatos.Anchors := [];
  PnlDatos.Align := alClient;
  fraCO_ESTADO.Clave := 'ACOES';

  edDI_ANIO.MaxValue := YearOf(DBDate);

  // Reorganizo los botones de la coolbar
  tbSeparador.Left := 0;
  tbGrabar.Left := 0;
  tbAprobar.Left := 0;

  fraCO_USUARIOSOLICITADO.ShowBajas := True;

  fraCO_USUCERRADO.ShowBajas := True;

  fraSC_IDARTANTERIOR.TableName   := 'aar_art';
  fraSC_IDARTANTERIOR.FieldID     := 'ar_id';
  fraSC_IDARTANTERIOR.FieldCodigo := 'ar_id';
  fraSC_IDARTANTERIOR.FieldDesc   := 'ar_nombre';
  fraSC_IDARTANTERIOR.FieldBaja   := 'ar_fechabaja';
  fraSC_IDARTANTERIOR.ShowBajas   := True;

  FreeAndNil(qrAnalisisHistorico);
  FreeAndNil(qrAnalisis);
  FreeAndNil(qrCotizador);

  Application.CreateForm(TQRAnalisis, qrAnalisisHistorico);
  qrAnalisisHistorico.OnPreview := AsignaPreview;
  qrAnalisisHistorico.Name := 'qrAnalisisHistorico';

  Application.CreateForm(TQRAnalisis, qrAnalisis);
  qrAnalisis.OnPreview := AsignaPreview;

  Application.CreateForm(TQRCotizador, qrCotizador);
  qrCotizador.OnPreview := AsignaPreview;
  
  fraStatusSRT.Clave       := 'STSRT';
  fraStatusBCRA.Clave      := 'STBCR';
  fraStatusBCRA2.Clave     := 'STBCR';
  fraMotivoExcepcion.Clave := 'COTEX';
  fraMotivoRevision.Clave  := 'COTRE';
  fraSector.Clave          := 'SECT';

  frafpSC_IDACTIVIDAD.OnChange := CambiaActividad;

  lbHistorico.Visible := False;

  if fraCO_IDFIDELITAS.IsEmpty then
    fraCO_IDFIDELITAS.Value := '01';
end;

procedure TfrmAdminCotizacion.PCCotizacionesChange(Sender: TObject);
var
  bHabilitarSRT: Boolean;
  bRecalcular: Boolean;
begin
  bHabilitarSRT := frmCargaSRTCoti.LockForm or frmCargaSRTCoti.EmpresaNueva;

  if PCCotizaciones.ActivePageIndex = PAGE_DETALLE then
  begin
    LockControl(PCCotizaciones.Pages[PAGE_DETALLE], bHabilitarSRT);
    LimpiarDetalle(nil);
  end
  else if PCCotizaciones.ActivePageIndex = PAGE_COSTOCARTERA then
  begin
    if (edCO_NIVEL.Value < 1) or (edCO_NIVEL.Value > 4) or (fraCO_IDACTIVIDAD.IsEmpty) then
    begin
      LimpiarGrid(GridCostoCartera1, [], [], '');
      LimpiarGrid(GridCostoCartera2, [], [], '');
    end
    else
    begin
      if (ModoABM = maAlta) or (ModoABM = maModificacion) then
      begin
        bRecalcular := False;
        if fOldNivel <> edCO_NIVEL.Value then
          bRecalcular := MsgAsk('El nivel cambió. ¿ Desea recalcular los valores ?')
        else if fOldActividad <> fraCO_IDACTIVIDAD.Value then
          bRecalcular := MsgAsk('La actividad cambió. ¿ Desea recalcular los valores ?');

        if bRecalcular then
        begin
          ActualizarRangoCartera;
          CargarCostoCartera2;
        end;
      end;
    end;
  end
  else if PCCotizaciones.ActivePageIndex = PAGE_COSTOS then
  begin
    if (ModoABM = maAlta) or (ModoABM = maModificacion) then
    begin
      CargarCostoMedico(FEstado);
      CargarCostos;
    end;
  end
  else if PCCotizaciones.ActivePageIndex = PAGE_DATOS then
  begin
    if (ModoABM = maAlta) or (ModoABM = maModificacion) then
    begin
      LockControl(PCCotizaciones.Pages[PAGE_DATOS], bHabilitarSRT);
      CargarDatos;
    end;
  end;
end;

procedure TfrmAdminCotizacion.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT MAX(co_orden)' +
     ' FROM aco_cotizacion' +
    ' WHERE co_nrocotizacion = :nrocotizacion';
  Verificar((ValorSqlIntegerEx(sSql, [edCO_NROCOTIZACION.Value]) > edOrden.Value), edOrden, PCCotizaciones.ActivePageIndex, Format('La cotización %d/%d no puede modificarse porque existe una posterior.', [edCO_NROCOTIZACION.Value, edOrden.Value]));

  if FEstado = 'autorizar' then
    AutorizaCotizacion
  else
    if Validar and DoABM then
      DoCargar(FIdCotizacion, 'consulta');
end;

procedure TfrmAdminCotizacion.GridDatosSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);
var
  Periodos: String;
  Trabajadores: String;
begin
  ///////////////////////////////////////////////
  //  VALIDACION DE LO INGRESADO EN LA GRILLA  //
  ///////////////////////////////////////////////
  if (Value <> '0') and (Value <> '') then
  begin
    Periodos     := GridDatos.Cells[ACol, 1];
    Trabajadores := GridDatos.Cells[ACol, 2];
    if (ARow = 1) or (ARow = 2) then
    begin
      if (ARow = 1) then
      begin
        // Valida que los periodos sean menores que 12
        // Salvo para 1996 que son 6 y para el ultimo año que deberia llegar al periodo actual
        Verificar((ACol = 1) and (StrToInt(Value) > 6), nil, PCCotizaciones.ActivePageIndex, 'La cantidad de períodos no puede superar 6.');
        Verificar((ACol <> GridDatos.ColCount - 1) and (StrToInt(Value) > 12), nil, PCCotizaciones.ActivePageIndex, 'La cantidad de períodos no puede superar 12.');
        //Valida que no ingrese trabajadores si no indico periodos
      end;

      if ((Periodos = '') or (Periodos = '0')) then
      begin
        GridDatos.Cells[ACol, 2] := '0';
        Verificar(True, nil, PCCotizaciones.ActivePageIndex, 'No se han registrado períodos en este año.');
      end;
    end
    else if (ARow = 10) or (ARow = 12) then
    begin
      // Valida que los dias de baja a cargo de la ART no sean superiores a los totales
      if (StrToInt('0' + GridDatos.Cells[ACol, 12]) > StrToInt('0' + GridDatos.Cells[ACol, 10])) then
      begin
        GridDatos.Cells[ACol, ARow] := '0';
        Verificar(True, nil, PCCotizaciones.ActivePageIndex, 'La cantidad de días de baja ART no pueden superar a los días de baja totales.');
      end;
    end;
    // Valida que no se pueden ingresar datos si el periodo y la cantidad de trabajadores estan ambas en cero
    if ((ARow <> 1) and (ARow <> 2)) and
      (((Periodos = '') or (Periodos = '0')) or ((Trabajadores = '') or (Trabajadores = '0'))) then
    begin
      GridDatos.Cells[ACol, ARow] := '0';
      Verificar(True, nil, PCCotizaciones.ActivePageIndex, 'No se han registrado trabajadores o períodos en este año.');
    end;
  end;
  ActualizarFilasGrid((Sender as TStaticGrid).Row);
end;

procedure TfrmAdminCotizacion.edCO_NROCOTIZACIONKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edOrden.Value := 0;
    edOrden.SelectAll;
    edOrden.SetFocus;
  end;
end;

procedure TfrmAdminCotizacion.tbModificarClick(Sender: TObject);
var
  aIdCotizacion: Integer;
  sSql: String;
begin
  if ((edCO_NROCOTIZACION.IsFilled) and (edCO_NROCOTIZACION.Value <> 0)) then
  begin
    sSql :=
      'SELECT MAX(co_orden)' +
       ' FROM aco_cotizacion' +
      ' WHERE co_nrocotizacion = :nrocotizacion';
    Verificar((ValorSqlIntegerEx(sSql, [edCO_NROCOTIZACION.Value]) > edOrden.Value), edOrden, PCCotizaciones.ActivePageIndex, Format('La cotización %d/%d no puede modificarse porque existe una posterior.', [edCO_NROCOTIZACION.Value, edOrden.Value]));

    sSql :=
      'SELECT NVL(co_id, 0)' +
       ' FROM aco_cotizacion' +
      ' WHERE co_nrocotizacion = :nrocotizacion' +
        ' AND co_orden = :orden';
		aIdCotizacion := ValorSqlEx(sSql, [edCO_NROCOTIZACION.Value, edOrden.Value], '0');
    DoCargar(aIdCotizacion, 'modif');
  end;
end;

procedure TfrmAdminCotizacion.LimpiarDetalle(Sender: TObject);
begin
  cmbDI_SEXO.ItemIndex   := 0;
  cmbDI_FECHANAC.Clear;
  edDI_EDAD.Value        := 35;
  edDI_PORCENTAJE.Value  := 0;
  edDI_ANIO.Clear;
  cmbDI_FECHAACCIDENTE.Clear;
  cmbDI_MUERTE.ItemIndex := 0;
  edMultiplicador.Value  := 1;
end;

procedure TfrmAdminCotizacion.EliminarDetalle(Sender: TObject);
var
  iColDatos: Integer;
  iLoop: Integer;
  iLoop2: Integer;
  iRowDatos: Integer;
begin
  // Actualizo los datos de la grilla de Datos..
  if GridDetalleILP.Cells[5, GridDetalleILP.Row] = 'N' then   // Si es una incapacidad..
  begin
    iColDatos := GetColPosDatos(StrToIntDef(GridDetalleILP.Cells[3, GridDetalleILP.Row], 0));
    if iColDatos > -1 then    // Si el año en que se produjo la ILP existe en la grilla de Datos..
    begin
      iRowDatos := GetRowPosDatos(StrToIntDef(GridDetalleILP.Cells[4, GridDetalleILP.Row], 0));
      GridDatos.Cells[iColDatos, iRowDatos] := IntToStr(StrToIntDef(GridDatos.Cells[iColDatos, iRowDatos], 0) - 1);
      GridDatos.Cells[GridDatos.ColCount - 1, iRowDatos] := IntToStr(StrToIntDef(GridDatos.Cells[GridDatos.ColCount - 1, iRowDatos], 0) - 1);

      // Actualizo el total de Siniestros con incapacidad..
      GridDatos.Cells[iColDatos, 14] := IntToStr(StrToIntDef(GridDatos.Cells[iColDatos, 14], 0) - 1);
      GridDatos.Cells[GridDatos.ColCount - 1, 14] := IntToStr(StrToIntDef(GridDatos.Cells[GridDatos.ColCount - 1, 14], 0) - 1);

      // Veo que no queden en menos de cero..
      if StrToIntDef(GridDatos.Cells[iColDatos, iRowDatos], 0) < 0 then
        GridDatos.Cells[iColDatos, iRowDatos] := '0';
      if StrToIntDef(GridDatos.Cells[GridDatos.ColCount - 1, iRowDatos], 0) < 0 then
        GridDatos.Cells[GridDatos.ColCount - 1, iRowDatos] := '0';
      if StrToIntDef(GridDatos.Cells[iColDatos, 14], 0) < 0 then
        GridDatos.Cells[iColDatos, 14] := '0';
      if StrToIntDef(GridDatos.Cells[GridDatos.ColCount - 1, 14], 0) < 0 then
        GridDatos.Cells[GridDatos.ColCount - 1, 14] := '0';
    end;
  end;

  // Doy de baja en la grilla Detalle ILP/Mortales..
  if GridDetalleILP.RowCount <> (GridDetalleILP.FixedRows + 1) then
  begin
    for iLoop := 0 to GridDetalleILP.ColCount - 1 do
      for iLoop2 := GridDetalleILP.Row to GridDetalleILP.RowCount - 1 do
        GridDetalleILP.Cells[iLoop, iLoop2] := GridDetalleILP.Cells[iLoop, iLoop2 + 1];
    GridDetalleILP.RowCount := GridDetalleILP.RowCount - 1;
  end
  else
    for iLoop := 0 to GridDetalleILP.ColCount -1 do
      GridDetalleILP.Cells[iLoop, GridDetalleILP.RowCount - 1] := '';
end;

procedure TfrmAdminCotizacion.NuevoDetalle(Sender: TObject);
var
  iColDatos: Integer;
  iLoop: Integer;
  iRowDatos: Integer;
  iUltimoAno: Integer;
  Periodos: String;
  Trabajadores: String;
begin
  iUltimoAno := StrToIntDef(gridDatos.Cells[gridDatos.ColCount - 2, 0], YearOf(DBDate));
  gbDetalleILP.SetFocus;
  Verificar(cmbDI_SEXO.ItemIndex = -1, cmbDI_SEXO, PAGE_DETALLE, 'Debe elegir el sexo.');
  Verificar((edDI_EDAD.Value < 13) or (edDI_EDAD.Value > 100), edDI_EDAD, PAGE_DETALLE, 'La edad debe ser mayor a 13 y menor a 100.');
  Verificar((edDI_PORCENTAJE.Value = 0) and (cmbDI_MUERTE.ItemIndex = 0), cmbDI_MUERTE, PAGE_DETALLE, 'El porcentaje no es correcto.');
  Verificar(cmbDI_FECHAACCIDENTE.IsEmpty, cmbDI_FECHAACCIDENTE, PAGE_DETALLE, 'Debe ingresar la fecha de accidente.');
  Verificar((edDI_ANIO.Value < 1996) or (edDI_ANIO.Value > iUltimoAno), edDI_ANIO, PAGE_DETALLE, Format('La fecha debe encontrarse entre 1996 y %d.', [iUltimoAno]));

  // Multiplicador
  Verificar((edMultiplicador.Value < 1), edMultiplicador, PAGE_DETALLE, 'El multiplicador debe ser superior a 1.');

  // Se fija si tiene periodos o trabajadores cargados
  for iloop := 0 to GridDatos.ColCount - 1 do
  begin
    // Obtengo la columna que corresponde
    if edDI_ANIO.Text = GridDatos.Cells[iloop, 0] then
    begin
      Periodos     := GridDatos.Cells[iloop, 1];
      Trabajadores := GridDatos.Cells[iloop, 2];
      Break;
    end;
  end;
  Verificar(((Periodos = '') or (Periodos = '0')) or ((Trabajadores = '') or (Trabajadores = '0')),
            nil, PAGE_DETALLE, 'No se han registrado trabajadores o períodos en este año.');

  for iloop := 1 to edMultiplicador.Value do
  begin
    // Agrega la fila
    if GridDetalleILP.Cells[0, GridDetalleILP.RowCount - 1] <> '' then
      GridDetalleILP.RowCount := GridDetalleILP.RowCount + 1;
      
    ///////////////////////////////////
    //  Agrega los distintos campos  //
    ///////////////////////////////////

    // Sexo
    if cmbDI_SEXO.Itemindex = 0 then
      GridDetalleILP.Cells[0, GridDetalleILP.RowCount - 1] := 'M'
    else
      GridDetalleILP.Cells[0, GridDetalleILP.RowCount - 1] := 'F';

    // Fecha de Nacimiento
    if not cmbDI_FECHANAC.IsEmpty then
      GridDetalleILP.Cells[1, GridDetalleILP.RowCount - 1] := cmbDI_FECHANAC.Text
    else
      GridDetalleILP.Cells[1, GridDetalleILP.RowCount - 1] := '';

    // Edad
    GridDetalleILP.Cells[2, GridDetalleILP.RowCount - 1] := IntToStr(edDI_EDAD.Value);

    // Porcentaje ILP
    GridDetalleILP.Cells[3, GridDetalleILP.RowCount - 1] := edDI_ANIO.Text;

    // Año
    if edDI_PORCENTAJE.Text = '' then
      GridDetalleILP.Cells[4, GridDetalleILP.RowCount - 1] := '0'
    else
      GridDetalleILP.Cells[4, GridDetalleILP.RowCount - 1] := edDI_PORCENTAJE.Text;

    // Mortales
    case cmbDI_MUERTE.ItemIndex of
      0:  GridDetalleILP.Cells[5, GridDetalleILP.RowCount - 1] := 'N';
      1:  GridDetalleILP.Cells[5, GridDetalleILP.RowCount - 1] := 'S';
      2:  GridDetalleILP.Cells[5, GridDetalleILP.RowCount - 1] := 'I';
    end;

    // Fecha de Accidente
    if not cmbDI_FECHAACCIDENTE.IsEmpty then
      GridDetalleILP.Cells[6, GridDetalleILP.RowCount - 1] := cmbDI_FECHAACCIDENTE.Text
    else
      GridDetalleILP.Cells[6, GridDetalleILP.RowCount - 1] := '';
  end;

  // Actualizo la grilla de la solapa Datos..
  if cmbDI_MUERTE.ItemIndex = 0 then    // incapacidad..
  begin
    iColDatos := GetColPosDatos(edDI_ANIO.Value);
    if iColDatos > -1 then    // Si el año en que se produjo la ILP existe en la grilla de Datos..
    begin
      iRowDatos := GetRowPosDatos(edDI_PORCENTAJE.Value);
      GridDatos.Cells[iColDatos, iRowDatos] := IntToStr(StrToIntDef(GridDatos.Cells[iColDatos, iRowDatos], 0) + edMultiplicador.Value);
      GridDatos.Cells[GridDatos.ColCount - 1, iRowDatos] := IntToStr(StrToIntDef(GridDatos.Cells[GridDatos.ColCount - 1, iRowDatos], 0) + edMultiplicador.Value);

      // Actualizo el total de Siniestros con incapacidad..
      GridDatos.Cells[iColDatos, 12] := IntToStr(StrToIntDef(GridDatos.Cells[iColDatos, 12], 0) + edMultiplicador.Value);
      GridDatos.Cells[GridDatos.ColCount - 1, 12] := IntToStr(StrToIntDef(GridDatos.Cells[GridDatos.ColCount - 1, 12], 0) + edMultiplicador.Value);
    end;
  end
  else if cmbDI_MUERTE.ItemIndex = 1 then    // Si es mortal..
  begin
    iColDatos := GetColPosDatos(edDI_ANIO.Value);
    if iColDatos > -1 then    // Si el año en que se produjo el siniestro mortal existe en la grilla de Datos..
    begin
      iRowDatos := 6;
      GridDatos.Cells[iColDatos, iRowDatos] := IntToStr(StrToIntDef(GridDatos.Cells[iColDatos, iRowDatos], 0) + edMultiplicador.Value);
      GridDatos.Cells[GridDatos.ColCount - 1, iRowDatos] := IntToStr(StrToIntDef(GridDatos.Cells[GridDatos.ColCount - 1, iRowDatos], 0) + edMultiplicador.Value);
    end;
  end;

  if (GridDetalleILP.RowCount mod 10) = 0 then
    InfoHint(tbGrabar, 'Recuerde que si está cargando muchos registros es recomendable grabar la cotización periodicamente.', False, 'Información', blnInfo, 6);

  // Mueve el foco
  LimpiarDetalle(nil);
  cmbDI_SEXO.SetFocus;
end;

procedure TfrmAdminCotizacion.cmbDI_FECHANACValidate(Sender: TObject; var Cancel: Boolean);
begin
  ActualizarFechas;
end;

procedure TfrmAdminCotizacion.edDI_EDADExit(Sender: TObject);
begin
  if (not cmbDI_FECHANAC.IsEmpty) and (edDI_EDAD.Value <> Trunc((cmbDI_FECHAACCIDENTE.Date - cmbDI_FECHANAC.Date) / 365)) then
    cmbDI_FECHANAC.Clear;
end;

procedure TfrmAdminCotizacion.ActualizarCotizacionCosto(Sender: TObject);
begin
  FCambioCotizacion := True;
  if (not (edCO_MASASALARIAL.Value = 0)) and ((ActiveControl = edTC_SUMAFIJA) or (ActiveControl = btnCotizador)) then
    edTC_PORCVARIABLE.Value := (edTC_COSTOFINAL.Value - edTC_SUMAFIJA.Value) / edCO_MASASALARIAL.Value * edCO_CANTTRABAJADOR.Value * 100;
end;

procedure TfrmAdminCotizacion.cmbDI_FECHANACExit(Sender: TObject);
begin
  ActualizarFechas;
end;

procedure TfrmAdminCotizacion.cmbDI_FECHANACAcceptDate(Sender: TObject; var ADate: TDateTime; var Action: Boolean);
begin
  ActualizarFechas;
end;

procedure TfrmAdminCotizacion.GridDatosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Si la fila es 10-11-12 no le permite escribir (son solo lectura)
  // Permite unicamente Tab, enter y las flechas, captura solamente el Delete de las teclas de control
  with (Sender as TStaticGrid) do
    if (Row in DISABLED_GRID_ROWS) then
      if Key = 46 then
        Key := 0;

  inherited;
end;

procedure TfrmAdminCotizacion.KeyPressGrilla(Sender: TObject; var Key: Char);
begin
  with (Sender as TStaticGrid) do
  begin
    // Si la fila es 10-11-12 no le permite escribir (son solo lectura)
    // Permite unicamente Tab, enter y las flechas
    if (Row in DISABLED_GRID_ROWS) then
      Key := #0;

    // Reemplaza el punto por una coma
    if Key = '.' then
      Key := ',';

    // Solo permito una coma
    if Pos(',',Cells[Col,Row]) > 0 then
      if Key = ',' then
        Key := #0;

    // Esto permite automatizar el pasaje al campo siguiente
    if (Key = #13) then
    begin
      if Col < (ColCount - 2) then
         Col := Col + 1
      else
        if Row < (RowCount - 1) then
        begin
          Col := 1;
          Row := Row + 1;
          while (Row in DISABLED_GRID_ROWS) and (Row <> RowCount - 1) do
            Row := Row + 1;
        end;
    end
    else if not(Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ',', #8]) then
      Key := #0;  // Solo estos caracteres pueden escribirse
  end;
end;

procedure TfrmAdminCotizacion.tbLimpiarFidelitasClick(Sender: TObject);
begin
  edCO_TEXTOFIDELITAS.Clear;
end;

procedure TfrmAdminCotizacion.tbObtenerFidelitasClick(Sender: TObject);
begin
  edCO_TEXTOFIDELITAS.ReadOnly := False;
  edCO_TEXTOFIDELITAS.PasteFromClipboard;
  edCO_TEXTOFIDELITAS.ReadOnly := True;
end;

procedure TfrmAdminCotizacion.CambiaFidelitas(Sender: TObject);
var
  Habilitar: Boolean;
begin
  Habilitar := ((FEstado = 'altasolicitud') or (FEstado = 'modif')) and fraCO_IDFIDELITAS.IsSelected and (fraCO_IDFIDELITAS.Value <> '01') and (fraCO_IDFIDELITAS.Value <> '02');
  VCLExtra.EnableControls([tlbFidelitas, tbObtenerFidelitas, tbLimpiarFidelitas], Habilitar);
end;

procedure TfrmAdminCotizacion.btnAceptarImpresionClick(Sender: TObject);
begin
  CustomDlgs.Verificar(not (chkTasa.Checked or chkFidelitas.Checked ), chkTasa, 'Debe elegir una opción de impresión.');

  try
    if chkTasa.Checked then
    try
      with TQrAnalisisChart.Create(nil) do
      try
        Preparar(GridEvolucionAnual.Rows[0], GridEvolucionAnual.Rows[1]);
      finally
        Free;
      end;
    except
      //
    end;

    if chkFidelitas.Checked then
    try
      with TQRAnalisisFidelitas.Create(Self) do
      try
        Preparar(Self);
      finally
        Free;
      end;
    except
      //
    end;
  finally
    frmImpresion.ModalResult := mrOk;
  end;
end;

procedure TfrmAdminCotizacion.tbImprimirClick(Sender: TObject);
begin
//  chkInforme.Checked   := True;
  chkTasa.Checked      := False;
  chkFidelitas.Checked := False;
  frmImpresion.ShowModal;
end;

procedure TfrmAdminCotizacion.btnCancelarImpresionClick(Sender: TObject);
begin
  frmImpresion.ModalResult := mrCancel;
end;

procedure TfrmAdminCotizacion.GridDatosGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if (ARow in DISABLED_GRID_ROWS) then
    if BackGround = clBtnFace then
       AFont.Color := clBlack
    else
       AFont.Color := clGrayText;
  if (ACol <> 0) and (ARow <> 0) then
    AAlignment := taRightJustify
  else if (ACol = 0) then
    AAlignment := taLeftJustify
  else
    AAlignment := taCenter;
end;

procedure TfrmAdminCotizacion.btnActualizarRangoClick(Sender: TObject);
begin
  ActualizarRangoCartera;
end;

procedure TfrmAdminCotizacion.ActualizarRangoCartera;
var
  eTotalEmpleados: Extended;
  sSql: String;
  sWhere: String;
begin
  Verificar(fraCO_IDACTIVIDAD.IsEmpty, fraCO_IDACTIVIDAD.edCodigo, PAGE_COSTOCARTERA, 'La actividad es obligatoria para este cálculo.');

	/////////////////////////////////////////////////
	//  CARGA LA TABLA TEMPORAL Y DEMAS YERBAS...  //
	/////////////////////////////////////////////////
  CargarCostoCartera1;

  if (ModoABM = maAlta) or (ModoABM = maModificacion) then
  begin
    Verificar((edCO_CANTEMPLDESDE.Value < 1) or (edCO_CANTEMPLHASTA.Value < 1), edCO_CANTEMPLDESDE, PAGE_COSTOCARTERA, 'La cantidad de empleados debe ser mayor a cero.');

    //Porcion generica de condiciones de todas las consultas
    sWhere :=
    	' FROM tau_auxcotizacion' +
     ' WHERE ta_usuario = :usuario';

    ///////////////////////
    //  PROMEDIO LINEAL  //
    ///////////////////////
    //Sql de la cantidad de empresas que se promediaron
    sSql := 'SELECT COUNT(*)';
    edCO_CANTEMPRESAS.Value := ValorSqlEx(sSql + sWhere, [Sesion.UserID], '0');

    //Obtengo el numerador del costo promedio lineal
    sSql := 'SELECT SUM(ta_costounitario)';

    if edCO_CANTEMPRESAS.Value > 0 then
      edCO_CARTERAPROMEDIO.Value := ValorSqlExtendedEx(sSql + sWhere, [Sesion.UserID]) / edCO_CANTEMPRESAS.Value
    else
      edCO_CARTERAPROMEDIO.Value := 0;

    //////////////////////////
    //  PROMEDIO PONDERADO  //
    //////////////////////////

    //Sql de la cantidad de empleados
    sSql := 'SELECT SUM(ta_empleados)';
    eTotalEmpleados := ValorSqlExtendedEx(sSql + sWhere, [Sesion.UserID]);

    //Obtengo el numerador del costo promedio ponderado
    sSql := 'SELECT SUM(ta_devengado)';

    if (eTotalEmpleados > 0) then
      edCO_CARTERAPROMEDIOPOND.Value := ValorSqlExtendedEx(sSql + sWhere, [Sesion.UserID]) / eTotalEmpleados
    else
      edCO_CARTERAPROMEDIOPOND.Value := 0;
  end;
end;

procedure TfrmAdminCotizacion.sdqHistoricoAfterScroll(DataSet: TDataSet);
begin
//  cmbTC_FECHATECNICA.Date       := sdqHistorico.FieldByName('tc_fechaautorizacion').AsDateTime;
//  edTC_USUTECNICA.Text          := sdqHistorico.FieldByName('tc_usuautorizacion').AsString;
  edTC_OBSERVACIONES.Lines.Text := sdqHistorico.FieldByName('tc_observaciones').AsString;

  if (InStr(FEstado, 'aprobar') > 0) then
    VCLExtra.LockControls(edTC_OBSERVACIONESAlta, FIdTarifa <> sdqHistorico.FieldByName('tc_id').AsInteger)
  else
    VCLExtra.LockControls(edTC_OBSERVACIONESAlta, True);
end;

procedure TfrmAdminCotizacion.tbAprobarClick(Sender: TObject);
var
//  sIdTipoRiesgo: String;
  sSql: String;
begin
{
Se comenta esta validación el 8.11.2011 a pedido de MMAGALLANES por vía telefónica..
  sSql :=
    'SELECT ac_idtiporiesgo' +
     ' FROM cac_actividad' +
    ' WHERE ac_id = :codigo';
  sIdTipoRiesgo := ValorSqlEx(sSql, [fraCO_IDACTIVIDAD.Value]);

  sSql :=
    'SELECT 1' +
     ' FROM art.aac_autorizacotiza' +
    ' WHERE :p1 BETWEEN ac_capitasdesde AND ac_capitashasta' +
      ' AND INSTR('','' || ac_srt || '','', :p2) > 0' +
      ' AND INSTR('','' || ac_bcra || '','', :p3) > 0' +
      ' AND INSTR('','' || ac_riesgo || '','', :p4) > 0' +
      ' AND INSTR('','' || ac_usuarionotificacion || '','', :p5) > 0' +
      ' AND ac_fechabaja IS NULL';
  Verificar(not ExisteSqlEx(sSql, [edCO_CANTTRABAJADOR.Value,
                                   ',' + IIF((StrToIntDef(FStatusSrtCotizacion, 0) > 0), FStatusSrtCotizacion, fraStatusSRT.Value) + ',',
                                   ',' + fraStatusBCRA2.Value + ',',
                                   ',' + sIdTipoRiesgo + ',',
                                   Sesion.UserID]), nil, 0, 'Usted no tiene permiso para realizar esa acción.');
}
  if fraCO_ESTADO.Value = EC_PEND_AUTORIZ then
  begin
    sSql :=
      'SELECT MAX(co_orden)' +
       ' FROM aco_cotizacion' +
      ' WHERE co_nrocotizacion = :nrocotizacion';
    Verificar((ValorSqlIntegerEx(sSql, [edCO_NROCOTIZACION.Value]) > edOrden.Value), edOrden, PCCotizaciones.ActivePageIndex, Format('La cotización %d/%d no puede modificarse porque existe una posterior.', [edCO_NROCOTIZACION.Value, edOrden.Value]));

    DoCargar(FIdCotizacion, 'autorizar');
  end
  else
    MessageDlg('El estado no es Pendiente Autorización', mtError, [mbOK], 0);
end;

procedure TfrmAdminCotizacion.TransferirSolicitud;
var
  Cadena: TCadena;
  Query: TSDQuery;
  sSql: String;
  bExiste: Boolean;
begin
  bExiste := False;

  sSql :=
  	'SELECT a.sc_id, a.sc_nrosolicitud, a.sc_fechasolicitud, a.sc_usuariosolicitud, a.sc_cuit, a.sc_razonsocial, a.sc_idactividad, a.sc_masasalarial, a.sc_canttrabajador,' +
          ' a.sc_estadosolicitud, a.sc_idcotizacion, a.sc_observaciones, a.sc_contacto, a.sc_telefono, a.sc_cotizacionobservacion, a.sc_relarcocotizacion,' +
          ' a.sc_usuasignado, a.sc_costofinal, a.sc_porcvariable, a.sc_sumafija, a.sc_fechaapertura, a.sc_canal, a.sc_identidadvendedor, a.sc_idartanterior, a.sc_usualta,' +
          ' a.sc_fechaalta, a.sc_usumodif, a.sc_fechamodif, a.sc_usubaja, a.sc_fechabaja, a.sc_form931, a.sc_idvendedor, a.sc_identidad, a.sc_observacionescierre,' +
          ' a.sc_costofinalform931, a.sc_sumafijaform931, a.sc_estado, a.sc_idsucursal, a.sc_idactividad2, a.sc_idactividad3, a.sc_actividadreal, a.sc_canttrabajador1,' +
          ' a.sc_canttrabajador2, a.sc_canttrabajador3, a.sc_detalleoper, a.sc_detalleadmin, a.sc_detallecalle, a.sc_fechasuspdesde, a.sc_fechasusphasta,' +
          ' a.sc_porccomision, a.sc_nuevaregimen, a.sc_idgrupoeconomico, a.sc_motivocancelacion, a.sc_motivosuspension, a.sc_motivorevision, a.sc_idevento,' +
          ' a.sc_finalsumafija, a.sc_finalporcmasa, a.sc_finalportrabajador, a.sc_fechavigencia, a.sc_fecharespuesta, a.sc_fechacierre, a.sc_mail, a.sc_statussrt,' +
          ' a.sc_statusbcra, a.sc_detalleoper2, a.sc_detalleoper3, a.sc_detalleadmin2, a.sc_detalleadmin3, a.sc_detallecalle2, a.sc_detallecalle3, a.sc_totalmasa1,' +
          ' a.sc_totalmasa2, a.sc_totalmasa3, a.sc_error, a.sc_codmotivorevision, a.sc_fecharevision, a.sc_usuariorevision, a.sc_motcancelacion, a.sc_codmotivoexcepcion,' +
          ' a.sc_fechaexcepcion, a.sc_usuarioexcepcion, a.sc_motivoexcepcion, a.sc_idusuarioweb, a.sc_edadpromedio, a.sc_zonageografica, a.sc_porcvariableform931,' +
          ' a.sc_pagocompetenciaparcial, a.sc_sumafijacompetencia, a.sc_porcvariablecompetencia, a.sc_costofijo931parcial, a.sc_porcvariable931parcial,' +
          ' a.sc_costofijocompetenciaparcial, a.sc_porcvariablecompetenciaparc, a.sc_costofinalpagomensual, a.sc_idgrupoeconomico, a.sc_sector, a.sc_idzonageografica,' +
          ' a.sc_estadoanterior, ar_nombre, a.sc_establecimientos, a.sc_periodo' +
     ' FROM asc_solicitudcotizacion a, aar_art' +
    ' WHERE sc_idartanterior = ar_id(+)' +
      ' AND sc_id = :id';


  Query := GetQueryEx(sSql, [FIdSolicitud]);
  try
    bExiste := not Query.IsEmpty;

    if bExiste then
    begin
      edCO_RAZONSOCIAL.Text                 := Query.FieldByName('sc_razonsocial').AsString;
      edCO_CUIT.Text                        := Query.FieldByName('sc_cuit').AsString;
      fraCO_IDACTIVIDAD.Value               := Query.FieldByName('sc_idactividad').AsInteger;
      FCIIUAnterior                         := fraCO_IDACTIVIDAD.Value;
      edCO_CONTACTO.Text                    := Query.FieldByName('sc_contacto').AsString;
      edCO_TELEFONO.Text                    := Query.FieldByName('sc_telefono').AsString;
      edCO_CANTTRABAJADOR.Value             := Query.FieldByName('sc_canttrabajador').AsInteger;
      edCO_ESTABLECIMIENTOS.Value           := Query.FieldByName('sc_establecimientos').AsInteger;
      cmbCO_FECHAAPERTURA.Date              := Query.FieldByName('sc_fechaapertura').AsDateTime;
      edCO_MASASALARIAL.Value               := Query.FieldByName('sc_masasalarial').AsFloat;
      fraCO_USUARIOSOLICITADO.Value         := Query.FieldByName('sc_usuariosolicitud').AsString;
      edUsuarioSolicito.Text                := 'WEB: ' + Copy(Query.FieldByName('sc_usuariosolicitud').AsString, 3, 100);
      edSC_OBSERVACIONES.Lines.Text 				:= Query.FieldByName('sc_observaciones').AsString;

      if edCO_OBSERVACIONES.Text = '' then
        edCO_OBSERVACIONES.Lines.Text       := edSC_OBSERVACIONES.Lines.Text;

      fraMotivoExcepcion.Value      				:= Query.FieldByName('sc_codmotivoexcepcion').AsString;
      dcbFechaExcepcion.Date        				:= Query.FieldByName('sc_fechaexcepcion').AsDateTime;
      edUsuarioExcepcion.Text       				:= Query.FieldByName('sc_usuarioexcepcion').AsString;
      memoObservacionesExcepcion.Lines.Text := Query.FieldByName('sc_motivoexcepcion').AsString;
      fraMotivoRevision.Value       				:= Query.FieldByName('sc_codmotivorevision').AsString;
      dcbFechaRevision.Date         				:= Query.FieldByName('sc_fecharevision').AsDateTime;
      edUsuarioRevision.Text        				:= Query.FieldByName('sc_usuariorevision').AsString;
      memoObservacionesRevision.Lines.Text 	:= Query.FieldByName('sc_motivorevision').AsString;
      edCO_COMISION.Value           				:= Query.FieldByName('sc_porccomision').AsFloat;
      edComisionCotizada.Value           		:= Query.FieldByName('sc_porccomision').AsFloat;
      fraCO_IDGRUPOECONOMICO.Value 			    := Query.FieldByName('sc_idgrupoeconomico').AsInteger;

      fraCO_USUARIOSOLICITADO.Visible := (Copy(Query.FieldByName('sc_usuariosolicitud').AsString, 1, 2) <> 'W_');
      edUsuarioSolicito.Visible := (Copy(Query.FieldByName('sc_usuariosolicitud').AsString, 1, 2) = 'W_');

      //Carga la grilla con el costo de competencia
      Cadena := TCadena.Create;
      Cadena.Valor := Query.FieldByName('sc_idartanterior').AsString;
      GridCostoCartera3.Objects[0,1] := Cadena;
      GridCostoCartera3.Cells[0,1] := Query.FieldByName('ar_nombre').AsString;

      if ToFloat(Query.FieldByName('sc_canttrabajador').AsString) <> 0 then
        GridCostoCartera3.Cells[3,1] := ToStr(ToFloat(Query.FieldByName('sc_masasalarial').AsString) / (ToFloat(Query.FieldByName('sc_canttrabajador').AsString)))
      else
        GridCostoCartera3.Cells[3,1] := '0,00';
      GridCostoCartera3.Cells[4,1] := Query.FieldByName('sc_canttrabajador').AsString;

      if Query.FieldByName('sc_form931').AsString = 'A' then
      begin
        GridCostoCartera3.Cells[1,1] := Query.FieldByName('sc_sumafijacompetencia').AsString;
        GridCostoCartera3.Cells[2,1] := ToStr(ToFloat(Query.FieldByName('sc_porcvariablecompetencia').AsString), 4);
        GridCostoCartera3.Cells[5,1] := Query.FieldByName('sc_costofinalpagomensual').AsString;
        GridCostoCartera3.Cells[6,1] := 'Datos provenientes de Pago Total Mensual';
      end;
      if Query.FieldByName('sc_form931').AsString = 'N' then
      begin
        GridCostoCartera3.Cells[1,1] := Query.FieldByName('sc_sumafija').AsString;
        GridCostoCartera3.Cells[2,1] := ToStr(ToFloat(Query.FieldByName('sc_porcvariable').AsString), 4);
        GridCostoCartera3.Cells[5,1] := Query.FieldByName('sc_costofinal').AsString;
        GridCostoCartera3.Cells[6,1] := '';
      end;
      if Query.FieldByName('sc_form931').AsString = 'S' then
      begin
        GridCostoCartera3.Cells[1,1] := Query.FieldByName('sc_sumafijaform931').AsString;
        GridCostoCartera3.Cells[2,1] := ToStr(ToFloat(Query.FieldByName('sc_porcvariableform931').AsString), 4);
        GridCostoCartera3.Cells[5,1] := Query.FieldByName('sc_costofinalform931').AsString;
        GridCostoCartera3.Cells[6,1] := 'Datos provenientes de Form. 931'
      end;

      fraCO_ESTADO.Value := EC_EN_PREPARACION;
      if Query.FieldByName('sc_nuevaregimen').AsString = 'S' then
      begin
        //Ingresa los datos de trabajadores y masa salarial en la ultima columna
        GridDatos.Cells[GridDatos.ColCount - 2, 2] := Query.FieldByName('sc_canttrabajador').AsString;
        //GridDatos.Cells[GridDatos.ColCount - 2, 3] := Query.FieldByName('sc_masasalarial').AsString;
      end;

      frmCargaSRTCoti.EmpresaNueva := (Query.FieldByName('sc_nuevaregimen').AsString = 'S');
    end;
  finally
    Query.Free;
    if bExiste then
      CargarDatosSolicitud(FIdSolicitud);
  end;
end;

procedure TfrmAdminCotizacion.fraCO_ESTADOExit(Sender: TObject);
begin
  inherited;

  fraCO_ESTADO.FrameExit(Sender);
end;

procedure TfrmAdminCotizacion.edDI_PORCENTAJEExit(Sender: TObject);
begin
  Verificar((edDI_PORCENTAJE.Value < 0) or (edDI_PORCENTAJE.Value > 100), edDI_PORCENTAJE, PAGE_DETALLE, 'El porcentaje debe estar entre 0 y 100.');
end;

procedure TfrmAdminCotizacion.FSFormShow(Sender: TObject);
begin
  inherited;

  frmCargaSRTCoti.Parent := PCCotizaciones.Pages[PAGE_SRT];
  frmCargaSRTCoti.Show;
end;

procedure TfrmAdminCotizacion.GridCostoGetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
begin
  if not (ARow in [0, 1, 2]) and (Text <> '') and (ACol <> 0) then
    Text := '$ ' + ToStr(ToFloat(Text));
end;

procedure TfrmAdminCotizacion.GridEvolucionAnualGetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
begin
  if (ARow = 0) and (Text <> '') and (ACol <> 0) then
    Text := '% ' + ToStr(ToFloat(Text))
  else if (ARow = 1) and (Text <> '') and (ACol <> 0) then
    Text := '$ ' + ToStr(ToFloat(Text));
end;

procedure TfrmAdminCotizacion.GridCostoCartera1GetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
begin
  if (ARow <> 0) and (Text <> '') and (ACol in [1, 3, 5]) then
    Text := '$ ' + ToStr(ToFloat(Text))
  else if (ARow <> 0) and (Text <> '') and (ACol = 2) then
    Text := '% ' + ToStr(ToFloat(Text),3);
end;

procedure TfrmAdminCotizacion.GridCostoCartera3GetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
begin
  if (ARow <> 0) and (Text <> '') and (ACol in [1, 3, 5]) then
    Text := '$ ' + ToStr(ToFloat(Text))
  else if (ARow <> 0) and (Text <> '') and (ACol = 2) then
    Text := '% ' + ToStr(ToFloat(Text),3);
end;

procedure TfrmAdminCotizacion.GridCostoCartera2GetCellDisplayText(Sender: TObject; ACol, ARow: Integer; var Text: String);
begin
  if (ARow <> 0) and (Text <> '') and (ACol in [1, 3, 5]) then
    Text := '$ ' + ToStr(ToFloat(Text))
  else if (ARow <> 0) and (Text <> '') and (ACol = 2) then
    Text := '% ' + ToStr(ToFloat(Text),3);
end;

procedure TfrmAdminCotizacion.VerificarAutorizacion;
var
  PorcSSN: Currency;
  sSql: String;
  TarSSN: Currency;
begin
  // Validaciones sobre la tarifa
  Verificar(edTC_SUMAFIJA.Value < 0, edTC_SUMAFIJA, PAGE_REPORT, 'La suma fija debe ser superior o igual a cero.');
  Verificar(edTC_PORCVARIABLE.Value < 0, edTC_PORCVARIABLE, PAGE_REPORT, 'El porcentaje debe ser superior o igual a cero.');
  Verificar(edTC_PORCVARIABLE.Value > 100, edTC_PORCVARIABLE, PAGE_REPORT, 'El porcentaje debe ser inferior a 100.');
  Verificar(edTC_COSTOFINAL.Value < 0.6, edTC_COSTOFINAL, PAGE_REPORT, 'El costo final no puede ser inferior a $0,60.');
  TarifaSSN(edCO_NIVEL.Text, fraCO_IDACTIVIDAD.Value, Date, TarSSN, PorcSSN);
  TarSSN := TarSSN * 1.15 + 0.60;
  PorcSSN := PorcSSN * 1.15;




  sSql :=
    'SELECT 1' +
     ' FROM acz_cotizador' +
    ' WHERE ((:sumafija - 0.6) / (:masasalarial / :canttrabajador * 100) + :porcvariable) BETWEEN cz_limitessnminimo AND cz_limitessnmaximo' +
      ' AND cz_idcotizacion = :idcotizacion';
  if not ExisteSqlEx(sSql, [edTC_SUMAFIJA.Value, edCO_MASASALARIAL.Value, edCO_CANTTRABAJADOR.Value, edTC_PORCVARIABLE.Value, FIdCotizacion]) then
    if MsgBox('El porcentaje variable se encuentra por fuera de los límites de la SSN según la resolución 38064/2013. ¿ Desea continuar ?', MB_YESNO + MB_ICONSTOP, 'Aviso importante') <> MRYES then
      Abort;

  if edTC_SUMAFIJA.Value > TarSSN then
    if MsgBox('La suma fija se encuentra 15% por encima del valor dado por la SSN. ¿ Desea continuar ?', MB_YESNO + MB_ICONINFORMATION, 'Atención') <> MRYES then
      Abort;

  if edTC_PORCVARIABLE.Value > PorcSSN then
    if MsgBox('El porcentaje variable se encuentra 15% por encima del valor dado por la SSN. ¿ Desea continuar ?', MB_YESNO + MB_ICONINFORMATION, 'Atención') <> MRYES then
      Abort;
end;

procedure TfrmAdminCotizacion.Verificar(aCondicion: Boolean; aControl: TWinControl; aTabIndex: Integer; aText: String);
begin
  if aCondicion then
  begin
    PCCotizaciones.ActivePageIndex := aTabIndex;
    if aText <> '' then
      InvalidMsg(aControl, aText);
    Abort;
  end;
end;

procedure TfrmAdminCotizacion.ActualizarCotizacionPorc(Sender: TObject);
begin
  FCambioCotizacion := True;
  if (not edCO_CANTTRABAJADOR.IsEmpty) and ((ActiveControl = edTC_PORCVARIABLE) or (ActiveControl = btnCotizador)) then
    edTC_SUMAFIJA.Value := edTC_COSTOFINAL.Value - ((edTC_PORCVARIABLE.Value / 100) * edCO_MASASALARIAL.Value / edCO_CANTTRABAJADOR.Value);
end;

procedure TfrmAdminCotizacion.ActualizarCotizacionCostoFinal(Sender: TObject);
begin
  FCambioCotizacion := True;
  if not (edCO_MASASALARIAL.Value = 0) and ((ActiveControl = edTC_COSTOFINAL) or (ActiveControl = btnCotizador)) then
    edTC_PORCVARIABLE.Value := (edTC_COSTOFINAL.Value - edTC_SUMAFIJA.Value) / edCO_MASASALARIAL.Value * edCO_CANTTRABAJADOR.Value * 100;
end;

procedure TfrmAdminCotizacion.AsignaPreview(Sender: TObject);
begin
  case PCCotizaciones.ActivePageIndex of
    PAGE_REPORT   : PreviewCotizacion.QRPrinter := TQRPrinter(Sender);
    PAGE_HISTORICO: PreviewHistorico.QRPrinter  := TQRPrinter(Sender);
  end;
end;

procedure TfrmAdminCotizacion.btnRefrescarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT sc_fechasolicitud' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_idcotizacion = :idcotizacion';

  if ValorSqlDateTimeEx(sSql, [FIdCotizacion]) > StrToDate('01/01/2007') then   // fecha en que se puso en producción el cotizador..
  begin
    sSql :=
      'SELECT 1' +
       ' FROM acz_cotizador' +
      ' WHERE cz_idcotizacion = :idcotizacion';
    Verificar((not ExisteSqlEx(sSql, [FIdCotizacion])), btnRefrescar, PAGE_REPORT, 'Antes de actualizar debe grabar la cotización.');

    btnExportarPDF.Visible := True;
    qrCotizador.Mostrar(FIdCotizacion, False, False);
  end
  else
    qrAnalisis.Preparar(Self);
end;

procedure TfrmAdminCotizacion.DescargarReportes;
begin
  if Assigned(qrAnalisis) then
  begin
    if Assigned(PreviewCotizacion.QRPrinter) then
      PreviewCotizacion.QRPrinter.ClosePreview(nil);
    VCLExtra.LockControl(btnImprimir, True);
    VCLExtra.LockControl(btnRefrescar, True);
    VCLExtra.LockControl(btnCotizador, True);
    VCLExtra.LockControl(btnExportarPDF, True);
  end;

  if Assigned(qrAnalisisHistorico) then
    if Assigned(PreviewHistorico.QRPrinter) then
      PreviewHistorico.QRPrinter.ClosePreview(nil);
end;

procedure TfrmAdminCotizacion.btnImprimirClick(Sender: TObject);
begin
  if Assigned(PreviewCotizacion.QRPrinter) then
  begin
    qrCotizador.GuardarImpresion := True;

    PreviewCotizacion.QRPrinter.PrintSetup;
    PreviewCotizacion.QRPrinter.Print;
  end;
end;

procedure TfrmAdminCotizacion.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(UnTouch) then
  begin
     UnTouch.Free;
     UnTouch := nil;
  end;

  if Assigned(frmCargaSRTCoti) then
  begin
    frmCargaSRTCoti.Free;
    frmCargaSRTCoti := nil;
  end;

  frmAdminCotizacion := nil;
  DescargarReportes;

  qrAnalisis.Free;
  qrAnalisis := nil;

  qrCotizador.Free;
  qrCotizador := nil;

  qrAnalisisHistorico.Free;
  qrAnalisisHistorico := nil;

//  frmPrincipal.mnuAdminCotizacion.Enabled := True;
  Action := caFree;
  
  inherited;
end;

procedure TfrmAdminCotizacion.ActualizarFechas;
begin
  if cmbDI_FECHANAC.Enabled then
  begin
    if not cmbDI_FECHANAC.IsEmpty and not cmbDI_FECHAACCIDENTE.IsEmpty then
      edDI_EDAD.Value := YearsBetween( cmbDI_FECHANAC.Date, cmbDI_FECHAACCIDENTE.Date)
    else
      edDI_EDAD.Value := 35;

    // Actualiza el año de accidente
    if not cmbDI_FECHAACCIDENTE.IsEmpty then
      edDI_ANIO.Value := GetYear(cmbDI_FECHAACCIDENTE.Date)
    else
      edDI_ANIO.Clear;
  end;
end;

procedure TfrmAdminCotizacion.AutorizaCotizacion;
var
  SqlTarifa: TSql;
  sSql: String;
  sUsuarioAutorizacion: String;
begin
  VerificarAutorizacion;

  if not chkCargaManual.Checked then
    edIndiceCombinado.Value := CalcularIndiceCombinado(edCO_CANTTRABAJADOR.Value, fraCO_IDACTIVIDAD.Value, FIdCotizacion, edCO_MASASALARIAL.Value, edTC_COSTOFINAL.Value);

  sSql :=
    'SELECT co_usuarioautorizacion' +
     ' FROM aco_cotizacion' +
    ' WHERE co_id = :id';
  sUsuarioAutorizacion := ValorSqlEx(sSql, [FIdCotizacion]);

  SqlTarifa := TSql.Create('atc_tarifacobrar');
  try
    BeginTrans;

    if FCambioCotizacion then
    begin
      SqlTarifa.SqlType := stInsert;
      SqlTarifa.PrimaryKey.Add('tc_id',       'SEQ_ATCC_ID.NEXTVAL', False);
      SqlTarifa.Fields.Add('tc_idcotizacion',  FIdCotizacion, False);
      SqlTarifa.Fields.Add('tc_sumafija',      edTC_SUMAFIJA.Value);
      SqlTarifa.Fields.Add('tc_porcvariable',  edTC_PORCVARIABLE.Value);
      SqlTarifa.Fields.Add('tc_costofinal',    edTC_COSTOFINAL.Value);
      SqlTarifa.Fields.Add('tc_observaciones', edTC_OBSERVACIONESAlta.Lines.Text);
      SqlTarifa.Fields.Add('tc_fechaalta',    'SYSDATE', False);
      SqlTarifa.Fields.Add('tc_usualta',       Sesion.UserId);
    end
    else
    begin
      SqlTarifa.SqlType := stUpdate;
      SqlTarifa.PrimaryKey.Add('tc_id', 			 FIdTarifa, False);
      SqlTarifa.Fields.Add('tc_observaciones', edTC_OBSERVACIONESAlta.Lines.Text);
    end;

    SqlTarifa.Fields.Add('tc_fechaautorizacion', SQL_ACTUALDATE, False);
    SqlTarifa.Fields.Add('tc_usuautorizacion',   sUsuarioAutorizacion);

    // Actualiza el estado de la cotización
    sSql :=
      'UPDATE aco_cotizacion' +
        ' SET co_estado = :estado,' +
            ' co_comision = :comision,' +
            ' co_acpo = :acpo,' +
            ' co_indicecombinado = :indicecombinado' +
      ' WHERE co_id = :id';
    EjecutarSqlSTEx(sSql, [EC_AUTORIZADA, edComisionCotizada.Value, edAcpo.Value, edIndiceCombinado.Value, FIdCotizacion]);

    // Actualizo el estado de la solicitud asociada
    sSql :=
      'UPDATE asc_solicitudcotizacion' +
        ' SET sc_estado = :estado' +
      ' WHERE sc_idcotizacion = :idcotizacion';
    EjecutarSqlSTEx(sSql, [EC_AUTORIZADA, FIdCotizacion]);
    sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
    EjecutarSqlSTEx(sSql, [FIdCotizacion]);

    try
      // Ejecuto la transacción
      EjecutarSqlST(SqlTarifa.Sql);
      CommitTrans;

      if Assigned(frmConsultaCotizacion) then
        frmConsultaCotizacion.tbRefrescarClick(nil);

      MessageDlg('La cotización ha sido autorizada correctamente.', mtInformation, [mbOK], 0);
      DoCargar(FIdCotizacion, 'consulta');
    except
      on E: Exception do
      begin
        RollBack;
        MessageDlg(E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    SqlTarifa.Free;
  end;
end;

procedure TfrmAdminCotizacion.CargarDatosSolicitud(aIdSolicitud: Integer);
const
  CLONACION = 'Clonación correspondiente a la cotización nº ';
var
  Query: TSDQuery;
  Query2: TSDQuery;
  sSql: String;
begin
  CleanControls;
  sSql :=
  	'SELECT a.sc_id, a.sc_nrosolicitud, a.sc_fechasolicitud, a.sc_usuariosolicitud, a.sc_cuit, a.sc_razonsocial, a.sc_idactividad, a.sc_masasalarial, a.sc_canttrabajador,' +
          ' a.sc_estadosolicitud, a.sc_idcotizacion, a.sc_observaciones, a.sc_contacto, a.sc_telefono, a.sc_cotizacionobservacion, a.sc_relarcocotizacion,' +
          ' a.sc_usuasignado, a.sc_costofinal, a.sc_porcvariable, a.sc_sumafija, a.sc_fechaapertura, a.sc_canal, a.sc_identidadvendedor, a.sc_idartanterior, a.sc_usualta,' +
          ' a.sc_fechaalta, a.sc_usumodif, a.sc_fechamodif, a.sc_usubaja, a.sc_fechabaja, a.sc_form931, a.sc_idvendedor, a.sc_identidad, a.sc_observacionescierre,' +
          ' a.sc_costofinalform931, a.sc_sumafijaform931, a.sc_estado, a.sc_idsucursal, a.sc_idactividad2, a.sc_idactividad3, a.sc_actividadreal, a.sc_canttrabajador1,' +
          ' a.sc_canttrabajador2, a.sc_canttrabajador3, a.sc_detalleoper, a.sc_detalleadmin, a.sc_detallecalle, a.sc_fechasuspdesde, a.sc_fechasusphasta,' +
          ' a.sc_porccomision, a.sc_nuevaregimen, a.sc_idgrupoeconomico, a.sc_motivocancelacion, a.sc_motivosuspension, a.sc_motivorevision, a.sc_idevento,' +
          ' a.sc_finalsumafija, a.sc_finalporcmasa, a.sc_finalportrabajador, a.sc_fechavigencia, a.sc_fecharespuesta, a.sc_fechacierre, a.sc_mail, a.sc_statussrt,' +
          ' a.sc_statusbcra, a.sc_detalleoper2, a.sc_detalleoper3, a.sc_detalleadmin2, a.sc_detalleadmin3, a.sc_detallecalle2, a.sc_detallecalle3, a.sc_totalmasa1,' +
          ' a.sc_totalmasa2, a.sc_totalmasa3, a.sc_error, a.sc_codmotivorevision, a.sc_fecharevision, a.sc_usuariorevision, a.sc_motcancelacion, a.sc_codmotivoexcepcion,' +
          ' a.sc_fechaexcepcion, a.sc_usuarioexcepcion, a.sc_motivoexcepcion, a.sc_idusuarioweb, a.sc_edadpromedio, a.sc_zonageografica, a.sc_porcvariableform931,' +
          ' a.sc_pagocompetenciaparcial, a.sc_sumafijacompetencia, a.sc_porcvariablecompetencia, a.sc_costofijo931parcial, a.sc_porcvariable931parcial,' +
          ' a.sc_costofijocompetenciaparcial, a.sc_porcvariablecompetenciaparc, a.sc_costofinalpagomensual, a.sc_idgrupoeconomico, a.sc_sector, a.sc_idprobabilidadcierre,' +
          ' a.sc_idzonageografica, a.sc_estadoanterior, a.sc_establecimientos, a.sc_periodo, DECODE(sc_motivoclonacion, 1, ''Mantener misma cotización.'',' +
                                                                                                  ' DECODE(sc_motivoclonacion, 2, ''Incrementar cotización.'',' +
                                                                                                         ' DECODE(sc_motivoclonacion, 3, ''Reducir cotización'', ''-''))) motivoclonacion,' +
          ' aco_cotizacion.*' +
     ' FROM aco_cotizacion, asc_solicitudcotizacion a' +
    ' WHERE sc_idcotizacion = co_id (+)' +
    	' AND sc_id = :id';

  Query := GetQueryEx(sSql, [aIdSolicitud]);
  try
    if not Query.Eof then
    begin
      if Query.FieldByName('sc_idactividad').AsString <> '' then
        frafpSC_IDACTIVIDAD.Value := Query.FieldByName('sc_idactividad').AsInteger;

      if Query.FieldByName('sc_idactividad2').AsString <> '' then
        frafpSC_IDACTIVIDAD2.Value := Query.FieldByName('sc_idactividad2').AsInteger;

      if Query.FieldByName('sc_idactividad3').AsString <> '' then
        frafpSC_IDACTIVIDAD3.Value := Query.FieldByName('sc_idactividad3').AsInteger;

      if Query.FieldByName('sc_canal').AsString <> '' then
        frafpSC_CANAL.Value := Query.FieldByName('sc_canal').AsInteger;

      if Query.FieldByName('sc_edadpromedio').AsString <> '' then
        edSC_EDADPROMEDIO.Value := Query.FieldByName('sc_edadpromedio').AsInteger;

      if Query.FieldByName('sc_establecimientos').AsString <> '' then
        edSC_ESTABLECIMIENTOS.Value := Query.FieldByName('sc_establecimientos').AsInteger;

      if Query.FieldByName('sc_periodo').AsString <> '' then
        edPeriodo.Periodo.Valor := Query.FieldByName('sc_periodo').AsString;

      if Query.FieldByName('sc_idzonageografica').AsString <> '' then
        fraZonaGeografica.Value := Query.FieldByName('sc_idzonageografica').AsInteger;

      if Query.FieldByName('sc_sector').AsString <> '' then
        fraSector.Value := Query.FieldByName('sc_sector').AsString;

      if Query.FieldByName('sc_idvendedor').AsString <> '' then
        frafpSC_VENDEDOR.Value := Query.FieldByName('sc_idvendedor').AsInteger;

      if Query.FieldByName('sc_identidad').AsString <> '' then
        frafpSC_ENTIDAD.Value := Query.FieldByName('sc_identidad').AsInteger;

      if Query.FieldByName('sc_statussrt').AsString <> '' then
        fraStatusSRT.Value := Query.FieldByName('sc_statussrt').AsString;

      if Query.FieldByName('sc_idartanterior').AsString <> '' then
        fraSC_IDARTANTERIOR.Value := Query.FieldByName('sc_idartanterior').AsInteger;

      if Query.FieldByName('sc_statusbcra').AsString <> '' then
      begin
        fraStatusBCRA.Value := Query.FieldByName('sc_statusbcra').AsString;
        if fraStatusBCRA2.Value = '' then
          fraStatusBCRA2.Value := fraStatusBCRA.Value;
      end;

      if Query.FieldByName('sc_totalmasa1').AsString <> '' then
        edMasaSalarial1.Value := Query.FieldByName('sc_totalmasa1').AsInteger;

      if Query.FieldByName('sc_totalmasa2').AsString <> '' then
        edMasaSalarial2.Value := Query.FieldByName('sc_totalmasa2').AsInteger;

      if Query.FieldByName('sc_totalmasa3').AsString <> '' then
        edMasaSalarial3.Value := Query.FieldByName('sc_totalmasa3').AsInteger;

      if Query.FieldByName('sc_masasalarial').AsString <> '' then
        edfpSC_MASASALARIAL.Value := Query.FieldByName('sc_masasalarial').AsInteger;

      if Query.FieldByName('sc_canttrabajador1').AsString <> '' then
        edfpSC_CANTTRABAJADOR1.Value := Query.FieldByName('sc_canttrabajador1').AsInteger;

      if Query.FieldByName('sc_canttrabajador2').AsString <> '' then
        edfpSC_CANTTRABAJADOR2.Value := Query.FieldByName('sc_canttrabajador2').AsInteger;

      if Query.FieldByName('sc_canttrabajador3').AsString <> '' then
        edfpSC_CANTTRABAJADOR3.Value := Query.FieldByName('sc_canttrabajador3').AsInteger;

      if Query.FieldByName('sc_porccomision').AsString <> '' then
        edCO_COMISION.Value := Query.FieldByName('sc_porccomision').AsFloat;

      if Query.FieldByName('sc_form931').AsString = 'A' then
      begin
        edSumaFija.Value	 								 := Query.FieldByName('sc_sumafijacompetencia').AsFloat;
        edPorcVariable.Value 							 := Query.FieldByName('sc_porcvariablecompetencia').AsFloat;
        edResultadoMensualTrabajador.Value := Query.FieldByName('sc_costofinalpagomensual').AsFloat;
      end;

      if Query.FieldByName('sc_form931').AsString = 'N' then
      begin
        edSumaFija.Value 									 := Query.FieldByName('sc_sumafija').AsFloat;
        edPorcVariable.Value 							 := Query.FieldByName('sc_porcvariable').AsFloat;
        edResultadoMensualTrabajador.Value := Query.FieldByName('sc_costofinal').AsFloat;
      end;

      if Query.FieldByName('sc_form931').AsString = 'S' then
      begin
        edSumaFija.Value 									 := Query.FieldByName('sc_sumafijaform931').AsFloat;
        edPorcVariable.Value 							 := Query.FieldByName('sc_porcvariableform931').AsFloat;
        edResultadoMensualTrabajador.Value := Query.FieldByName('sc_costofinalform931').AsFloat;
      end;

      edfpSC_ACTIVIDADREAL.Text 			 := Query.FieldByName('sc_actividadreal').AsString;
      edSC_OBSERVACIONES.Lines.Text 	 := Query.FieldByName('sc_observaciones').AsString;
      fraMotivoExcepcion.Value 				 := Query.FieldByName('sc_codmotivoexcepcion').AsString;
      dcbFechaExcepcion.Date 					 := Query.FieldByName('sc_fechaexcepcion').AsDateTime;
      edUsuarioExcepcion.Text 				 := Query.FieldByName('sc_usuarioexcepcion').AsString;
      memoObservacionesExcepcion.Text  := Query.FieldByName('sc_motivoexcepcion').AsString;
      fraMotivoRevision.Value 				 := Query.FieldByName('sc_codmotivorevision').AsString;
      dcbFechaRevision.Date 					 := Query.FieldByName('sc_fecharevision').AsDateTime;
      edUsuarioRevision.Text 					 := Query.FieldByName('sc_usuariorevision').AsString;
      memoObservacionesRevision.Text 	 := Query.FieldByName('sc_motivorevision').AsString;
      edSC_MOTIVOSUSPENSION.Lines.Text := Query.FieldByName('sc_motivosuspension').AsString;
      edSC_FECHASUSPDESDE.Date         := Query.FieldByName('sc_fechasuspdesde').AsDateTime;
      edSC_FECHASUSPHASTA.Date         := Query.FieldByName('sc_fechasusphasta').AsDateTime;
      edMotivoClonacion.Text           := Query.FieldByName('motivoclonacion').AsString;

      CalcularTrabajadores(nil);
    end;

    lbClonacion.Visible := False;
    lbHistorico.Visible := False;


    // Verifico si la cotización es una clonación de otra para marcar las diferencias...
    if Query.FieldByName('co_idcotizacionanterior').AsString <> '' then
    begin
      lbClonacion.Visible := True;

      sSql :=
        'SELECT a.sc_id, a.sc_nrosolicitud, a.sc_fechasolicitud, a.sc_usuariosolicitud, a.sc_cuit, a.sc_razonsocial, a.sc_idactividad, a.sc_masasalarial,' +
              ' a.sc_canttrabajador, a.sc_estadosolicitud, a.sc_idcotizacion, a.sc_observaciones, a.sc_contacto, a.sc_telefono, a.sc_cotizacionobservacion,' +
              ' a.sc_relarcocotizacion, a.sc_usuasignado, a.sc_costofinal, a.sc_porcvariable, a.sc_sumafija, a.sc_fechaapertura, a.sc_canal, a.sc_identidadvendedor,' +
              ' a.sc_idartanterior, a.sc_usualta, a.sc_fechaalta, a.sc_usumodif, a.sc_fechamodif, a.sc_usubaja, a.sc_fechabaja, a.sc_form931, a.sc_idvendedor,' +
              ' a.sc_identidad, a.sc_observacionescierre, a.sc_costofinalform931, a.sc_sumafijaform931, a.sc_estado, a.sc_idsucursal, a.sc_idactividad2,' +
              ' a.sc_idactividad3, a.sc_actividadreal, a.sc_canttrabajador1, a.sc_canttrabajador2, a.sc_canttrabajador3, a.sc_detalleoper, a.sc_detalleadmin,' +
              ' a.sc_detallecalle, a.sc_fechasuspdesde, a.sc_fechasusphasta, a.sc_porccomision, a.sc_nuevaregimen, a.sc_idgrupoeconomico, a.sc_motivocancelacion,' +
              ' a.sc_motivosuspension, a.sc_motivorevision, a.sc_idevento, a.sc_finalsumafija, a.sc_finalporcmasa, a.sc_finalportrabajador, a.sc_fechavigencia,' +
              ' a.sc_fecharespuesta, a.sc_fechacierre, a.sc_mail, a.sc_statussrt, a.sc_statusbcra, a.sc_detalleoper2, a.sc_detalleoper3, a.sc_detalleadmin2,' +
              ' a.sc_detalleadmin3, a.sc_detallecalle2, a.sc_detallecalle3, a.sc_totalmasa1, a.sc_totalmasa2, a.sc_totalmasa3, a.sc_error, a.sc_codmotivorevision,' +
              ' a.sc_fecharevision, a.sc_usuariorevision, a.sc_motcancelacion, a.sc_codmotivoexcepcion, a.sc_fechaexcepcion, a.sc_usuarioexcepcion, a.sc_motivoexcepcion,' +
              ' a.sc_idusuarioweb, a.sc_edadpromedio, a.sc_establecimientos, a.sc_periodo, a.sc_zonageografica, a.sc_porcvariableform931, a.sc_pagocompetenciaparcial,' +
              ' a.sc_sumafijacompetencia, a.sc_porcvariablecompetencia, a.sc_costofijo931parcial, a.sc_porcvariable931parcial, a.sc_costofijocompetenciaparcial,' +
              ' a.sc_porcvariablecompetenciaparc, a.sc_costofinalpagomensual, a.sc_idgrupoeconomico, a.sc_sector, a.sc_idzonageografica, a.sc_estadoanterior,' +
              ' ca_descripcion, ar_nombre, en_nombre, ve_nombre, cac_1.ac_descripcion actividad_1, cac_2.ac_descripcion actividad_2, cac_3.ac_descripcion actividad_3,' +
              ' ctb_statussrt.tb_descripcion statussrt, ctb_statusbcra.tb_descripcion statusbcra,' +
              ' DECODE(sc_motivoclonacion,' +
                           ' 1, ''Mantener misma cotización.'',' +
                           ' DECODE(sc_motivoclonacion,' +
                                  ' 2, ''Incrementar cotización.'',' +
                                  ' DECODE(sc_motivoclonacion, 3, ''Reducir cotización'', ''-''))) motivoclonacion,' +
              ' aco_cotizacion.*' +
         ' FROM cac_actividad cac_1, cac_actividad cac_2, cac_actividad cac_3, xen_entidad, xve_vendedor, aar_art, ctb_tablas ctb_statussrt, ctb_tablas ctb_statusbcra,' +
              ' aca_canal, aco_cotizacion, asc_solicitudcotizacion a' +
        ' WHERE sc_idcotizacion = co_id' +
          ' AND sc_idactividad = cac_1.ac_id' +
          ' AND sc_idactividad2 = cac_2.ac_id(+)' +
          ' AND sc_idactividad3 = cac_3.ac_id(+)' +
          ' AND sc_canal = ca_id' +
          ' AND sc_statussrt = ctb_statussrt.tb_codigo' +
          ' AND ctb_statussrt.tb_clave = ''STSRT''' +
          ' AND sc_statusbcra = ctb_statusbcra.tb_codigo' +
          ' AND ctb_statusbcra.tb_clave = ''STBCR''' +
          ' AND sc_idartanterior = ar_id(+)' +
          ' AND sc_identidad = en_id(+)' +
          ' AND sc_idvendedor = ve_id(+)' +
          ' AND co_id = :co_id';

      Query2 := GetQueryEx(sSql, [Query.FieldByName('co_idcotizacionanterior').AsInteger]);
      try
        if not Query2.Eof then
        begin
          lbClonacion.Caption := CLONACION + Format('%d/%d', [Query2.FieldByName('co_nrocotizacion').AsInteger, Query2.FieldByName('co_orden').AsInteger]);

          CompareDataHint(frafpSC_IDACTIVIDAD.cmbDescripcion.Text, Query2.FieldByName('actividad_1').AsString, frafpSC_IDACTIVIDAD);
          CompareDataHint(frafpSC_IDACTIVIDAD2.cmbDescripcion.Text, Query2.FieldByName('actividad_2').AsString, frafpSC_IDACTIVIDAD2);
          CompareDataHint(frafpSC_IDACTIVIDAD3.cmbDescripcion.Text, Query2.FieldByName('actividad_3').AsString, frafpSC_IDACTIVIDAD3);
          CompareDataHint(frafpSC_CANAL.cmbDescripcion.Text, Query2.FieldByName('ca_descripcion').AsString, frafpSC_CANAL);
          CompareDataHint(edSC_EDADPROMEDIO.Text, Query2.FieldByName('sc_edadpromedio').AsString, edSC_EDADPROMEDIO);
          CompareDataHint(edSC_ESTABLECIMIENTOS.Text, Query2.FieldByName('sc_establecimientos').AsString, edSC_ESTABLECIMIENTOS);
          CompareDataHint(edPeriodo.Text, Query2.FieldByName('sc_periodo').AsString, edPeriodo);
          CompareDataHint(fraZonaGeografica.cmbDescripcion.Text, Query2.FieldByName('sc_idzonageografica').AsString, fraZonaGeografica);
          CompareDataHint(fraSector.cmbDescripcion.Text, Query2.FieldByName('sc_sector').AsString, fraSector);
          CompareDataHint(frafpSC_VENDEDOR.cmbDescripcion.Text, Query2.FieldByName('ve_nombre').AsString, frafpSC_VENDEDOR);
          CompareDataHint(frafpSC_ENTIDAD.cmbDescripcion.Text, Query2.FieldByName('en_nombre').AsString, frafpSC_ENTIDAD);
          CompareDataHint(fraStatusSRT.cmbDescripcion.Text, Query2.FieldByName('statussrt').AsString, fraStatusSRT);
          CompareDataHint(fraSC_IDARTANTERIOR.cmbDescripcion.Text, Query2.FieldByName('ar_nombre').AsString, fraSC_IDARTANTERIOR);
          CompareDataHint(fraStatusBCRA.cmbDescripcion.Text, Query2.FieldByName('statusbcra').AsString, fraStatusBCRA);
          CompareDataHint(Query.FieldByName('sc_totalmasa1').AsString, Query2.FieldByName('sc_totalmasa1').AsString, edMasaSalarial1);
          CompareDataHint(Query.FieldByName('sc_totalmasa2').AsString, Query2.FieldByName('sc_totalmasa2').AsString, edMasaSalarial2);
          CompareDataHint(Query.FieldByName('sc_totalmasa3').AsString, Query2.FieldByName('sc_totalmasa3').AsString, edMasaSalarial3);
          CompareDataHint(Query.FieldByName('sc_masasalarial').AsString, Query2.FieldByName('sc_masasalarial').AsString, edfpSC_MASASALARIAL);
          CompareDataHint(Query.FieldByName('sc_canttrabajador1').AsString, Query2.FieldByName('sc_canttrabajador1').AsString, edfpSC_CANTTRABAJADOR1);
          CompareDataHint(Query.FieldByName('sc_canttrabajador2').AsString, Query2.FieldByName('sc_canttrabajador2').AsString, edfpSC_CANTTRABAJADOR2);
          CompareDataHint(Query.FieldByName('sc_canttrabajador3').AsString, Query2.FieldByName('sc_canttrabajador3').AsString, edfpSC_CANTTRABAJADOR3);

{
PENDIENTE DE HACER ¿?
          CompareDataHint(Query.FieldByName('sc_sumafija').AsString, Query2.FieldByName('sc_sumafija').AsString, edSC_SUMAFIJA);
          CompareDataHint(Query.FieldByName('sc_porcvariable').AsString, Query2.FieldByName('sc_porcvariable').AsString, edSC_PORCVARIABLE);
          CompareDataHint(Query.FieldByName('sc_costofinal').AsString, Query2.FieldByName('sc_costofinal').AsString, edSC_COSTOFINAL);
}

          CompareDataHint(Query.FieldByName('sc_actividadreal').AsString, Query2.FieldByName('sc_actividadreal').AsString, edfpSC_ACTIVIDADREAL);
          CompareDataHint(Query.FieldByName('sc_observaciones').AsString, Query2.FieldByName('sc_observaciones').AsString, edSC_OBSERVACIONES);
          CompareDataHint(Query.FieldByName('sc_motivosuspension').AsString, Query2.FieldByName('sc_motivosuspension').AsString, edSC_MOTIVOSUSPENSION);
          CompareDataHint(Query.FieldByName('sc_fechasuspdesde').AsString, Query2.FieldByName('sc_fechasuspdesde').AsString, edSC_FECHASUSPDESDE);
          CompareDataHint(Query.FieldByName('sc_fechasusphasta').AsString, Query2.FieldByName('sc_fechasusphasta').AsString, edSC_FECHASUSPHASTA);
          CompareDataHint(Query.FieldByName('motivoclonacion').AsString, Query2.FieldByName('motivoclonacion').AsString, edMotivoClonacion);
          CompareDataHint(Query.FieldByName('co_cuit').AsString, Query2.FieldByName('co_cuit').AsString, edCO_CUIT);
          CompareDataHint(Query.FieldByName('co_fechavigencia').AsString, Query2.FieldByName('co_fechavigencia').AsString, cmbCO_FECHAVIGENCIA);
          CompareDataHint(Query.FieldByName('co_nivel').AsString, Query2.FieldByName('co_nivel').AsString, edCO_NIVEL);
          CompareDataHint(Query.FieldByName('co_razonsocial').AsString, Query2.FieldByName('co_razonsocial').AsString, edCO_RAZONSOCIAL);
          CompareDataHint(Query.FieldByName('co_contacto').AsString, Query2.FieldByName('co_contacto').AsString, edCO_CONTACTO);
          CompareDataHint(Query.FieldByName('co_telefono').AsString, Query2.FieldByName('co_telefono').AsString, edCO_TELEFONO);
          CompareDataHint(Query.FieldByName('co_observaciones').AsString, Query2.FieldByName('co_observaciones').AsString, edCO_OBSERVACIONES);
          CompareDataHint(Query.FieldByName('co_clausulasadicionales').AsString, Query2.FieldByName('co_clausulasadicionales').AsString, edCO_CLAUSULASADICIONALES);
          CompareDataHint(Query.FieldByName('co_canttrabajador').AsString, Query2.FieldByName('co_canttrabajador').AsString, edCO_CANTTRABAJADOR);
          CompareDataHint(Query.FieldByName('co_establecimientos').AsString, Query2.FieldByName('co_establecimientos').AsString, edCO_ESTABLECIMIENTOS);
          CompareDataHint(Query.FieldByName('co_masasalarial').AsString, Query2.FieldByName('co_masasalarial').AsString, edCO_MASASALARIAL);
          CompareDataHint(Query.FieldByName('co_fechaapertura').AsString, Query2.FieldByName('co_fechaapertura').AsString, cmbCO_FECHAAPERTURA);
          CompareDataHint(Query.FieldByName('co_idgrupoeconomico').AsString, Query2.FieldByName('co_idgrupoeconomico').AsString, fraCO_IDGRUPOECONOMICO);
          CompareDataHint(Query.FieldByName('co_cantempldesde').AsString, Query2.FieldByName('co_cantempldesde').AsString, edCO_CANTEMPLDESDE);
          CompareDataHint(Query.FieldByName('co_cantemplhasta').AsString, Query2.FieldByName('co_cantemplhasta').AsString, edCO_CANTEMPLHASTA);
          CompareDataHint(Query.FieldByName('co_cantempresas').AsString, Query2.FieldByName('co_cantempresas').AsString, edCO_CANTEMPRESAS);
          CompareDataHint(Query.FieldByName('co_carterapromedio').AsString, Query2.FieldByName('co_carterapromedio').AsString, edCO_CARTERAPROMEDIO);
          CompareDataHint(Query.FieldByName('co_carterapromediopond').AsString, Query2.FieldByName('co_carterapromediopond').AsString, edCO_CARTERAPROMEDIOPOND);
          CompareDataHint(Query.FieldByName('co_fechaconfecciono').AsString, Query2.FieldByName('co_fechaconfecciono').AsString, cmbCO_FECHACONFECCIONO);
          CompareDataHint(Query.FieldByName('co_fechacerrado').AsString, Query2.FieldByName('co_fechacerrado').AsString, cmbCO_FECHACERRADO);
          CompareDataHint(Query.FieldByName('co_comision').AsString, Query2.FieldByName('co_comision').AsString, edComisionCotizada);
          CompareDataHint(Query.FieldByName('co_acpo').AsString, Query2.FieldByName('co_acpo').AsString, edAcpo);
        end;
      finally
        Query2.Free;
      end;
    end;
  finally
    Query.Free;
  end;
end;

procedure TfrmAdminCotizacion.CalcularTrabajadores(Sender: TObject);
begin
  edfpSC_CANTTRABAJADOR.Value := edfpSC_CANTTRABAJADOR1.Value + edfpSC_CANTTRABAJADOR2.Value + edfpSC_CANTTRABAJADOR3.Value;
end;

procedure TfrmAdminCotizacion.tbPegarDatosSRTClick(Sender: TObject);
begin
//  InfoHint(tbPegarDatosSRT, 'Para obtener la información desde la SRT es recomendable utilizar el botón "Obtener Datos desde la  SRT" que está a la derecha.');
  ClipBoardToGrid;
end;

procedure TfrmAdminCotizacion.ClipBoardToGrid;
var
  Anios: TDynStringArray;
  Cadena: TDynStringArray;
  ListaDatos: TStringList;

  function GetColsNoLimpiar: TIntegerArray;
  var
    bExiste: Boolean;
    iLoop: Integer;
    iLoop2: Integer;
  begin
    SetLength(Result, 0);

    for iLoop := 1 to GridDatos.ColCount - 2 do
    begin
      bExiste := False;
      for iLoop2 := Low(Anios) to High(Anios) do
        if Anios[iLoop2] = GridDatos.Cells[iLoop, 0] then
        begin
          bExiste := True;
          Break;
        end;
      if not bExiste then
      begin
        SetLength(Result, Length(Result) + 1);
        Result[Length(Result) - 1] := iLoop;
      end;
    end;
  end;


  procedure ObtenerValor(Clave: String; var ArrayValores: TDynStringArray; PosIzq: Boolean = False);
  var
    Aux: String;
    iLoop: Integer;
    Posicion: Integer;
    Valor: String;
  begin
    // Esta funcion busca la cadena de caracteres en la lista y si la encuentra
    // devuelve el string que le sigue hasta el final de la linea
    for iLoop := 0 to ListaDatos.Count - 1 do
    begin
      Aux := ListaDatos.Strings[iLoop];
      Posicion := Pos(Clave, Aux);
      if Posicion > 0 then
      begin
        if PosIzq then // La información está a la izquierda de la clave
          Valor := Copy(Aux, 0, Posicion)
        else
          Valor := Copy(Aux, Posicion + Length(Clave), Length(Aux));
        ArrayValores := ParseText(Trim(Valor), ' ');
        // se queda con la primera que encuentra
        Break;
      end;
    end;
    Verificar((High(ArrayValores) = -1) or (ArrayValores[0] = ''), nil, PAGE_DATOS, 'El texto en el portapapeles no es válido.');
  end;

  procedure IngresarValores(NroFila: Integer; ArrayValores, ArrayAnios: TDynStringArray);
  var
    iLoop: Integer;
    iLoop2: Integer;
    Valor: String;
  begin
    for iLoop := 0 to High(ArrayAnios) do
    begin
      Valor := ArrayAnios[iLoop];

      // Busco que columna de la grilla le corresponde
      for iLoop2 := GridDatos.FixedCols to (GridDatos.ColCount - GridDatos.FixedCols - 1) do
        if LCase(GridDatos.Cells[iLoop2, 0]) = LCase(Valor) then
        begin
          // iLoop2 tiene el valor de la columna de la grilla
          // donde se deben insertar los datos
          GridDatos.Cells[iLoop2, NroFila] := StrReplace(StrReplace(ArrayValores[iLoop], ',', ''), '-', '0');
          Break;
        end;
    end;

    ActualizarFilasGrid(NroFila);
  end;
begin
  //lo meto en un stringlist para manejarlo mas facil
  ListaDatos := TStringList.Create;
  try
    ListaDatos.Text := Clipboard.AsText;

    // Obtengo el Cuit de la empresa
    ObtenerValor('Cuit: ', Cadena);
    Verificar(Cadena[0] <> edCO_CUIT.Text, edCO_CUIT, PAGE_DATOS, 'La C.U.I.T. obtenida no es la ingresada en el formulario.');

    // Saco texto que no me sirve (la linea "datos agrupados" y "CUIT")..
    ListaDatos.Text := Trim(Copy(ListaDatos.Text, Pos('Datos agrupados de siniestros', ListaDatos.Text) + 29, 100000));
    ListaDatos.Text := Trim(Copy(ListaDatos.Text, Pos('Definitiva', ListaDatos.Text) + 10, 100000));

    // Agrego la palabra "Total" antes de los años para poder recuperar los años..
    ListaDatos.Text := ' Total ' + ListaDatos.Text;


    // Busco la cantidad de años que existen
    ObtenerValor(' Total ', Anios);


    // Limpia la grilla
    // Limpio aca para no limpiar los años que no se recuperan..
    // *******************************************
//    tbLimpiarDatosSRTClick(nil);
    LimpiarGrid(GridDatos, [14, 15, 16, 17, 18], GetColsNoLimpiar);
    CargarDatos;    // Carga los datos del detalle ILP
    // *******************************************


    // Ingreso los valores de la grilla
    ObtenerValor('1. Cantidad de períodos cubiertos', Cadena);
    IngresarValores(1, Cadena, Anios);

    ObtenerValor('2. Promedio de Trabajadores', Cadena);
    IngresarValores(2, Cadena, Anios);

    ObtenerValor('3. Siniestros', Cadena);
    IngresarValores(3, Cadena, Anios);

    ObtenerValor('3.1.a. Siniestros sin baja', Cadena);
    IngresarValores(4, Cadena, Anios);

    ObtenerValor('3.1.b. Siniestros con baja', Cadena);
    IngresarValores(5, Cadena, Anios);

    ObtenerValor('3.2.a Siniestros mortales', Cadena);
    IngresarValores(6, Cadena, Anios);

    ObtenerValor('3.2.a.1 siniestros mortales in itinere', Cadena);
    IngresarValores(7, Cadena, Anios);

    ObtenerValor('3.3.a. Accidentes de trabajo, enfermedad profesional y reagravaciones', Cadena);
    IngresarValores(8, Cadena, Anios);

    ObtenerValor('3.3.b. Siniestros in itinere', Cadena);
    IngresarValores(9, Cadena, Anios);

// **  Este tipo no viene mas..  **
//    ObtenerValor('3.3.c. Siniestros sin especificar el tipo:', Cadena);
//    IngresarValores(10, Cadena, Anios);

    ObtenerValor('3.4. AT y EP con baja (no incluye acc. in itinere ni reagravaciones)', Cadena);
    IngresarValores(11, Cadena, Anios);

// **  Este tipo no viene mas..  **
//    ObtenerValor('3.4.a. Acc. de Trabajo con baja', Cadena);
//    IngresarValores(12, Cadena, Anios);

// **  Este tipo no viene mas..  **
//    ObtenerValor('3.4.b. Enfer. Profesionales con baja', Cadena);
//    IngresarValores(13, Cadena, Anios);


    ObtenerValor('3.5.a. Siniestros con incapacidad', Cadena);
    IngresarValores(14, Cadena, Anios);

    ObtenerValor('3.5.a.1. IPP menores al 50% ', Cadena);
    IngresarValores(15, Cadena, Anios);

    ObtenerValor('3.5.a.2. IPP entre 50% y 66%', Cadena);
    IngresarValores(16, Cadena, Anios);

    ObtenerValor('3.5.a.3. IP Totales', Cadena);
    IngresarValores(17, Cadena, Anios);

    ObtenerValor('3.5.a.4 Sin especificar porcentaje', Cadena);
    IngresarValores(18, Cadena, Anios);

    ObtenerValor('4. Días de ILT', Cadena);
    IngresarValores(19, Cadena, Anios);

    ObtenerValor('4.1.a. A cargo del empleador', Cadena);
    IngresarValores(20, Cadena, Anios);

    ObtenerValor('4.1.b. A cargo de la ART', Cadena);
    IngresarValores(21, Cadena, Anios);

    ObtenerValor('5. Índice de Incidencia', Cadena);
    IngresarValores(22, Cadena, Anios);
  finally
    ListaDatos.Free;
  end;
end;

procedure TfrmAdminCotizacion.tbLimpiarDatosSRTClick(Sender: TObject);
begin
  LimpiarGrid(GridDatos, [], []);

  // Carga los datos del detalle ILP
  CargarDatos;
end;

procedure TfrmAdminCotizacion.edCO_CUITChange(Sender: TObject);
begin
  frmCargaSRTCoti.Cuit := edCO_CUIT.Text;
end;

procedure TfrmAdminCotizacion.GridCostoGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if (ACol <> 0) and (ARow <> 0) then
    AAlignment := taRightJustify
  else if (ACol = 0) then
    AAlignment := taLeftJustify
  else
    AAlignment := taCenter;
end;

procedure TfrmAdminCotizacion.AlinearGrilla(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if (ARow = 0) then
    AAlignment := taCenter
  else if (ACol = 0) then
    AAlignment := taLeftJustify
  else
    AAlignment := taRightJustify;
end;

procedure TfrmAdminCotizacion.GridCostoCartera3GetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if (ARow = 0) then
    AAlignment := taCenter
  else if (ACol = 0) or (ACol = GridCostoCartera3.ColCount - 1) then
    AAlignment := taLeftJustify
  else
    AAlignment := taRightJustify;
end;

procedure TfrmAdminCotizacion.GridDetalleILPGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if (ARow = 0) then
    AAlignment := taCenter
  else if (ACol = 4) then
    AAlignment := taRightJustify;
end;

procedure TfrmAdminCotizacion.CambiaActividad(Sender: TObject);
begin
  if (edfpSC_ACTIVIDADREAL.Text = '') and (edfpSC_ACTIVIDADREAL.Text <> frafpSC_IDACTIVIDAD.cmbDescripcion.Text) then
    edfpSC_ACTIVIDADREAL.Text := frafpSC_IDACTIVIDAD.cmbDescripcion.Text;
end;

procedure TfrmAdminCotizacion.btnRefrescarHistoricoClick(Sender: TObject);
begin
  qrAnalisisHistorico.Preparar(sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger);
end;

procedure TfrmAdminCotizacion.sdqCotizacionesHistoricasAfterOpen(DataSet: TDataSet);
begin
  TFloatField(DataSet.FieldByName('tc_costofinal')).DisplayFormat   := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('tc_porcvariable')).DisplayFormat := '% ,0.0000;-% ,0.0000';
  TFloatField(DataSet.FieldByName('tc_sumafija')).DisplayFormat     := '$ ,0.00;-$ ,0.00';
end;

procedure TfrmAdminCotizacion.btnImprimirHistoricoClick(Sender: TObject);
begin
  if Assigned(PreviewHistorico.QRPrinter) then
  begin
    PreviewHistorico.QRPrinter.PrintSetup;
    PreviewHistorico.QRPrinter.Print;
  end;
end;

procedure TfrmAdminCotizacion.CargarCotizacionesHistoricas;
begin
  with sdqCotizacionesHistoricas do
  begin
    Close;
    ParamByName('cantfilas').AsInteger := IIF(checkMostrarSoloUltimaCotizacion.Checked, 2, 1000);
    ParamByName('co_cuit').AsString    := edCO_CUIT.Text;
    ParamByName('co_id').AsInteger     := FIdCotizacion;
    Open;

    lbHistorico.Visible := not IsEmpty;
    tbRecuperarDatosCotizacionesAnteriores.Hide;
    tbRecuperarDatosCotizacionesAnteriores.Enabled := not IsEmpty;
    tbRecuperarDatosCotizacionesAnteriores2.Enabled := not IsEmpty;

    VCLExtra.LockControl(btnImprimirHistorico, IsEmpty);
    VCLExtra.LockControl(btnRefrescarHistorico, IsEmpty);
  end;
end;

procedure TfrmAdminCotizacion.CleanControls;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if not(Self.Components[i] is TWinControl) then
      Continue;
    try
      TFontControl(Self.Components[i]).Font.Color := clWindowText;
    except
      //
    end;
    
    TControl(Self.Components[i]).Hint := '';
    TControl(Self.Components[i]).ShowHint := False;
  end;
end;

procedure TfrmAdminCotizacion.fraStatusSRTExit(Sender: TObject);
begin
  VCLExtra.LockControls([fraSC_IDARTANTERIOR], (fraStatusSRT.Value = '1'));
  if fraSC_IDARTANTERIOR.Locked then
    fraSC_IDARTANTERIOR.Clear;
end;

procedure TfrmAdminCotizacion.btnCerrarClick(Sender: TObject);
begin
  fpObservacionesExcepcion.Close;
end;

procedure TfrmAdminCotizacion.btnCerrar2Click(Sender: TObject);
begin
  fpObervacionesRevision.Close;
end;

procedure TfrmAdminCotizacion.Label62Click(Sender: TObject);
begin
  fpObservacionesExcepcion.ShowModal;
end;

procedure TfrmAdminCotizacion.Label59Click(Sender: TObject);
begin
  fpObervacionesRevision.ShowModal;
end;

procedure TfrmAdminCotizacion.fpObervacionesRevisionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpObervacionesRevision.Close;
end;

procedure TfrmAdminCotizacion.fpObservacionesExcepcionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpObservacionesExcepcion.Close;
end;

procedure TfrmAdminCotizacion.lbStatusBCRALinkClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', URL_STATUS_BCRA, nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmAdminCotizacion.btnCotizadorClick(Sender: TObject);
var
  sCO_ESTADO: String;
  sSql: String;
begin
  Verificar(not Seguridad.Claves.IsActive('PuedeCotizar'), btnCotizador, PAGE_REPORT, 'Usted no tiene permiso para cotizar.');

  sSql :=
    'SELECT 1' +
     ' FROM acz_cotizador' +
    ' WHERE cz_idcotizacion = :idcotizacion';
  Verificar((not ExisteSqlEx(sSql, [FIdCotizacion])), btnCotizador, PAGE_REPORT, 'Antes de ingresar al cotizador debe grabar la cotización.');

  if FIdCotizacion <> 0 then
  begin
    sSql :=
      'SELECT NVL(co_estado, ''0'')' +
       ' FROM aco_cotizacion' +
      ' WHERE co_id = :id';
    sCO_ESTADO := ValorSqlEx(sSql, [FIdCotizacion], '0');

    Verificar((sCO_ESTADO <> EC_PEND_AUTORIZ), btnCotizador, PAGE_REPORT, 'El estado de la cotización no permite usar el Cotizador.');
  end;

  frmCotizador := TfrmCotizador.Create(Self);
  frmCotizador.Mostrar(FIdCotizacion);
end;

function TfrmAdminCotizacion.GetColPosDatos(const aAno: Integer): Integer;
var
  iLoop: Integer;
begin
  Result := -1;

  for iLoop := 1 to GridDatos.ColCount - 1 do
    if StrToIntDef(GridDatos.Cells[iLoop, 0], 0) = aAno then
      Result := iLoop;
end;

function TfrmAdminCotizacion.GetDepartamentoJudicial(const aDepartamentoJudicial: String): String;
var
  sSql: String;
begin
  Result := '';

  sSql :=
    'SELECT ju_descripcion jurisdiccion, jz_descripcion juzgado, fu_descripcion fuero, sc_descripcion secretaria' +
     ' FROM legales.lsc_secretaria, legales.ljz_juzgado, legales.lfu_fuero, legales.lju_jurisdiccion' +
    ' WHERE LPAD(sc_codigosrt, 4, 0) = :codigosrt' +
      ' AND sc_idjuzgado = jz_id' +
      ' AND jz_idfuero = fu_id' +
      ' AND jz_idjurisdiccion = ju_id';
  with GetQueryEx(sSql, [aDepartamentoJudicial]) do
  try
    while not Eof do
    begin
      Result := Result + #13#10 +
        'JURISDICCIÓN: ' + FieldByName('jurisdiccion').AsString +
        '.-  JUZGADO: ' + FieldByName('juzgado').AsString +
        '.-  FUERO: ' +  FieldByName('fuero').AsString +
        '.-  SECRETARIA: ' + FieldByName('secretaria').AsString + ' ';
      Next;
    end;
  finally
    Free;
  end;
end;

function TfrmAdminCotizacion.GetRowPosDatos(const aPorcentaje: Real): Integer;
begin
  if aPorcentaje = 0 then
    Result := 15
  else if (aPorcentaje > 0) and (aPorcentaje < 50) then
    Result := 12
  else if (aPorcentaje >= 50) and (aPorcentaje <= 66) then
    Result := 13
  else
    Result := 14;
end;

procedure TfrmAdminCotizacion.FSFormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  msg: Cardinal;
  code: Cardinal;
  i, n: Integer;
begin
  if WindowFromPoint(mouse.Cursorpos) = PreviewCotizacion.Handle then
  begin
    Handled := True;
    if ssShift in Shift then
      msg := WM_HSCROLL
    else
      msg := WM_VSCROLL;

    if WheelDelta < 0 then
      code := SB_LINEDOWN
    else
      code := SB_LINEUP;

    n:= Mouse.WheelScrollLines;
    for i:= 1 to n do
      PreviewCotizacion.Perform(msg, code, 0);
    PreviewCotizacion.Perform(msg, SB_ENDSCROLL, 0);
  end;
end;

procedure TfrmAdminCotizacion.btnExportarPDFClick(Sender: TObject);
begin
  with TSaveDialog.Create(Self) do
  try
    qrCotizador.GuardarImpresion := True;
    
    Title := 'Exportar Cotización';
    DefaultExt := 'pdf';
    Filter := 'Portable Document Format (*.pdf)|*.pdf';
    Options := [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoValidate, ofPathMustExist, ofShareAware, ofNoReadOnlyReturn, ofNoTestFileCreate, ofNoNetworkButton,
                ofNoDereferenceLinks, ofEnableIncludeNotify];
    if Execute then
      if FileExists(FileName) then
      begin
        if MsgAsk(Format('¿ Desea reemplazar el archivo %s ?', [FileName])) then
        begin
          DeleteFile(FileName);
          ExportarPDF(qrCotizador, FileName + '.' + DefaultExt);
        end;
      end
      else
        ExportarPDF(qrCotizador, FileName + '.' + DefaultExt);
  finally
    Free;
  end;
end;

procedure TfrmAdminCotizacion.btnCancelar2Click(Sender: TObject);
begin
  fpEstado.ModalResult := mrCancel;
end;

procedure TfrmAdminCotizacion.btnAceptar2Click(Sender: TObject);
begin
  Verificar((not rbEnPreparacion.Checked) and (not rbPendienteAutorizar.Checked) and (not rbAutorizada.Checked), nil, 0, 'Debe seleccionar un estado.');
  if rbAutorizada.Checked then
    VerificarAutorizacion;
  fpEstado.ModalResult := mrOk;
end;

procedure TfrmAdminCotizacion.fpEstadoBeforeShow(Sender: TObject);
begin
  rbEnPreparacion.Checked := False;
  rbPendienteAutorizar.Checked := False;
  rbAutorizada.Checked := False;
end;

procedure TfrmAdminCotizacion.btnHistorialVigenciasClick(Sender: TObject);
begin
  Application.CreateForm(TfrmHistorialVigenciasContrato, frmHistorialVigenciasContrato);
  with frmHistorialVigenciasContrato do
  try
    frmHistorialVigenciasContrato.Mostrar(edCO_CUIT.Text);
  finally
    FreeAndNil(frmHistorialVigenciasContrato);
  end;
end;

procedure TfrmAdminCotizacion.tbObtenerDatosSRTClick(Sender: TObject);
  procedure GuardarDatos(const aDatosSiniestros: TSiniestrosAgrupados);
  var
    iCol: Integer;
  begin
    iCol := StrToInt(aDatosSiniestros.Periodo) - 1995;
    GridDatos.Cells[iCol, 1] := aDatosSiniestros.CantPeriodo; //IntToStr(aDatosSiniestros.PeriodosCubiertos);
    GridDatos.Cells[iCol, 2] := aDatosSiniestros.PromTrabajadores; //IntToStr(aDatosSiniestros.PromedioTrabajadores);
    GridDatos.Cells[iCol, 3] := aDatosSiniestros.CantSiniestros; // IntToStr(aDatosSiniestros.Siniestros);
    GridDatos.Cells[iCol, 4] := aDatosSiniestros.SinBaja; //  IntToStr(aDatosSiniestros.SinSinBaja);
    GridDatos.Cells[iCol, 5] := aDatosSiniestros.ConBaja; //  IntToStr(aDatosSiniestros.SinConBaja);
    GridDatos.Cells[iCol, 6] := aDatosSiniestros.Mortales; // IntToStr(aDatosSiniestros.SinMortales);
    GridDatos.Cells[iCol, 7] := aDatosSiniestros.MortalesInItinere; //IntToStr(aDatosSiniestros.SinMortalesInItinere);
    GridDatos.Cells[iCol, 8] := aDatosSiniestros.Accidentes; //IntToStr(aDatosSiniestros.AccidenteTrabajo);
    GridDatos.Cells[iCol, 9] := aDatosSiniestros.InItinere;  //IntToStr(aDatosSiniestros.SinInItinere);
    GridDatos.Cells[iCol, 11] := aDatosSiniestros.ConBajaATEP; // IntToStr(aDatosSiniestros.ATEPConBaja);
    GridDatos.Cells[iCol, 14] := aDatosSiniestros.ConIncapacidad; // IntToStr(aDatosSiniestros.SinConIncapacidad);
    GridDatos.Cells[iCol, 15] := aDatosSiniestros.IPPMenores50; //IntToStr(aDatosSiniestros.IPPMenos50);
    GridDatos.Cells[iCol, 16] := aDatosSiniestros.IPP50_60; // IntToStr(aDatosSiniestros.IPP5066);
    GridDatos.Cells[iCol, 17] := aDatosSiniestros.IPTotales; //IntToStr(aDatosSiniestros.IPTotales);
    GridDatos.Cells[iCol, 18] := aDatosSiniestros.SinPorcentaje; //  IntToStr(aDatosSiniestros.SinPorcentaje);
    GridDatos.Cells[iCol, 19] := aDatosSiniestros.DiasILT; //IntToStr(aDatosSiniestros.DiasILT);
    GridDatos.Cells[iCol, 20] := aDatosSiniestros.CargoEmpleador; // IntToStr(aDatosSiniestros.DiasEmpleador);
    GridDatos.Cells[iCol, 21] := aDatosSiniestros.CargoART; //IntToStr(aDatosSiniestros.DiasArt);
    GridDatos.Cells[iCol, 22] := aDatosSiniestros.IndiceIncidencia; // FloatToStr(aDatosSiniestros.IndiceIncidencia);
    iCol := GridDatos.ColCount - 1;
    GridDatos.Cells[iCol, 1] := IntToStr(StrToInt(GridDatos.Cells[iCol, 1]) + StrToInt(aDatosSiniestros.CantPeriodo));
    GridDatos.Cells[iCol, 2] := IntToStr(StrToInt(GridDatos.Cells[iCol, 2]) + StrToInt(aDatosSiniestros.PromTrabajadores));
    GridDatos.Cells[iCol, 3] := IntToStr(StrToInt(GridDatos.Cells[iCol, 3]) + StrToInt(aDatosSiniestros.CantSiniestros));
    GridDatos.Cells[iCol, 4] := IntToStr(StrToInt(GridDatos.Cells[iCol, 4]) + StrToInt(aDatosSiniestros.SinBaja));
    GridDatos.Cells[iCol, 5] := IntToStr(StrToInt(GridDatos.Cells[iCol, 5]) + StrToInt(aDatosSiniestros.ConBaja));
    GridDatos.Cells[iCol, 6] := IntToStr(StrToInt(GridDatos.Cells[iCol, 6]) + StrToInt(aDatosSiniestros.Mortales));
    GridDatos.Cells[iCol, 7] := IntToStr(StrToInt(GridDatos.Cells[iCol, 7]) + StrToInt(aDatosSiniestros.MortalesInItinere));
    GridDatos.Cells[iCol, 8] := IntToStr(StrToInt(GridDatos.Cells[iCol, 8]) + StrToInt(aDatosSiniestros.Accidentes));
    GridDatos.Cells[iCol, 9] := IntToStr(StrToInt(GridDatos.Cells[iCol, 9]) + StrToInt(aDatosSiniestros.InItinere));
    GridDatos.Cells[iCol, 11] := IntToStr(StrToInt(GridDatos.Cells[iCol, 11]) + StrToInt(aDatosSiniestros.ConBajaATEP));
    GridDatos.Cells[iCol, 14] := IntToStr(StrToInt(GridDatos.Cells[iCol, 14]) + StrToInt(aDatosSiniestros.ConIncapacidad));
    GridDatos.Cells[iCol, 15] := IntToStr(StrToInt(GridDatos.Cells[iCol, 15]) + StrToInt(aDatosSiniestros.IPPMenores50));
    GridDatos.Cells[iCol, 16] := IntToStr(StrToInt(GridDatos.Cells[iCol, 16]) + StrToInt(aDatosSiniestros.IPP50_60));
    GridDatos.Cells[iCol, 17] := IntToStr(StrToInt(GridDatos.Cells[iCol, 17]) + StrToInt(aDatosSiniestros.IPTotales));
    GridDatos.Cells[iCol, 18] := IntToStr(StrToInt(GridDatos.Cells[iCol, 18]) + StrToInt(aDatosSiniestros.SinPorcentaje));
    GridDatos.Cells[iCol, 19] := IntToStr(StrToInt(GridDatos.Cells[iCol, 19]) + StrToInt(aDatosSiniestros.DiasILT));
    GridDatos.Cells[iCol, 20] := IntToStr(StrToInt(GridDatos.Cells[iCol, 20]) + StrToInt(aDatosSiniestros.CargoEmpleador));
    GridDatos.Cells[iCol, 21] := IntToStr(StrToInt(GridDatos.Cells[iCol, 21]) + StrToInt(aDatosSiniestros.CargoART));
    GridDatos.Cells[iCol, 22] := FloatToStr(StrToFloat(GridDatos.Cells[iCol, 22]) + StrToFloat(aDatosSiniestros.IndiceIncidencia));
  end;
var
  iLoop: Integer;
  aDatosSrt: TCuilSiniestralidad;
begin
    LimpiarGrid(GridDatos, [], [GridDatos.ColCount]);

    aDatosSrt := ConsultarSiniestralidad(edCO_CUIT.Text, '1996', IntToStr(YearOf(DBDate)));
    if aDatosSrt.Error = '' then
    begin
      for iLoop := 0 to Length(aDatosSrt.SiniestrosAgrupados) -1 do
      begin
        GuardarDatos(aDatosSrt.SiniestrosAgrupados[iLoop]);
      end;
    GridDatos.Refresh; //quedan algunos valores mal sin esto
    end
    else
    begin
      ShowMessage('No se pudieron recuperar los datos. ' + aDatosSrt.Error);
    end;
end;

procedure TfrmAdminCotizacion.IdHTTP1Authorization(Sender: TObject; Authentication: TIdAuthentication; var Handled: Boolean);
begin
//  Authentication.UserName := USER_SRT;
//  Authentication.Password := PASSWORD_SRT;
end;

procedure TfrmAdminCotizacion.GetUsuarioAutorizacion(var aUsuarioAutorizacion, aPuestoAutorizacion: String);
var
  sIdTipoRiesgo: String;
  sSql: String;
  sStatusSrt : String;
begin
  sSql :=
    'SELECT ac_idtiporiesgo' +
     ' FROM cac_actividad' +
    ' WHERE ac_id = :id';
  sIdTipoRiesgo := ValorSqlEx(sSql, [fraCO_IDACTIVIDAD.Value]);


  //TK 37348 no cambia el usuario autorizacion cuando Tecnica agrega datos de SRT con contrato Rescindido.
  sStatusSrt := '';
  if FIdCotizacion <> 0 then   //busco el ultimo dato de srt por tecnica.
  begin
    sSql :=
      'SELECT tb_codigo' +
       ' FROM art.tss_solicitudsrt a, art.ctb_tablas' +
      ' WHERE ss_operacion = tb_codigo' +
        ' AND tb_clave = ''COPER''' +
        ' AND a.ss_idcotizacion = :idcotizacion' +
        ' AND ss_vigenciadesde = (SELECT MAX(b.ss_vigenciadesde)' +
                                  ' FROM art.tss_solicitudsrt b' +
                                 ' WHERE b.ss_idcotizacion = :idcotizacion)';
    sStatusSrt := ValorSqlEx(sSql, [FIdCotizacion, FIdCotizacion]);

    if sStatusSrt = '2' then     //2 es igual a rescindido para Tecnica
      sStatusSrt := '5'   //Lo paso a 5 para que el query de abajo tome el siguiente usuario autorizacion
    else
      sStatusSrt := '';   //sino lo dejo como viene
  end;

  if sStatusSrt = '' then    //Si no hay datos de cotizacion agarro los de comercial como antes
    sStatusSrt := IIF((StrToIntDef(FStatusSrtCotizacion, 0) > 0), FStatusSrtCotizacion, fraStatusSRT.Value);

  sSql :=
    'SELECT   ac_puesto, ac_usuario, ac_prioridad' +
       ' FROM art.aac_autorizacotiza' +
      ' WHERE :p1 BETWEEN ac_capitasdesde AND ac_capitashasta' +
        ' AND INSTR('','' || ac_srt || '','', :p2) > 0' +
        ' AND INSTR('','' || ac_bcra || '','', :p3) > 0' +
        ' AND INSTR('','' || ac_riesgo || '','', :p4) > 0' +
        ' AND ac_fechabaja IS NULL' +
   ' ORDER BY ac_prioridad';
  with GetQueryEx(sSql, [edCO_CANTTRABAJADOR.Value,
                         ',' + sStatusSrt + ',',
                         ',' + fraStatusBCRA2.Value + ',',
                         ',' + sIdTipoRiesgo + ',']) do
  try
    aUsuarioAutorizacion := FieldByName('ac_usuario').AsString;
    aPuestoAutorizacion  := FieldByName('ac_puesto').AsString;
  finally
    Free;
  end;
end;

procedure TfrmAdminCotizacion.fpRecuperarDatosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpRecuperarDatos.Close;
end;

procedure TfrmAdminCotizacion.tbRecuperarDatosCotizacionesAnterioresClick(Sender: TObject);
begin
//  fpRecuperarDatos.ShowModal;
end;

procedure TfrmAdminCotizacion.gridCotizacionesAnterioresDblClick(Sender: TObject);
  function GetUsuarioSolicitado: String;
  var
    sSql: String;
  begin
    if FIdSolicitud <> 0 then
    begin
      sSql :=
        'SELECT sc_usuariosolicitud' +
         ' FROM asc_solicitudcotizacion' +
        ' WHERE sc_id = :id';
      Result := ValorSqlEx(sSql, [FIdSolicitud]);
    end
    else
    begin
      sSql :=
        'SELECT sc_usuariosolicitud' +
         ' FROM asc_solicitudcotizacion' +
        ' WHERE sc_idcotizacion = :idcotizacion';
      Result := ValorSqlEx(sSql, [FIdCotizacion]);
    end;
  end;

var
//  aBlob: TStringList;
//  bError: Boolean;
//  iIdCotizacion: Integer;
//  iNumeroCotizacion: Integer;
  sSql: String;
//  sUpdateSql: String;
begin
  if (not sdqCotizacionesHistoricas.Active) or (sdqCotizacionesHistoricas.IsEmpty) then
    Exit;


// 2.9.2013, LO DE ABAJO ESTÁ TODO COMENTADO POR LAS DUDAS..
{
  bError := True;
  iIdCotizacion := -1;

  BeginTrans;
  try
    if edCO_NROCOTIZACION.IsEmpty then
    begin
      iNumeroCotizacion        := ValorSqlInteger('SELECT NVL(MAX(co_nrocotizacion), 0) + 1 FROM aco_cotizacion', 1);
      iIdCotizacion            := ValorSqlInteger('SELECT seq_aco_id.NEXTVAL FROM DUAL');
      edCO_NROCOTIZACION.Value := iNumeroCotizacion;
      edOrden.Value            := 0;

      sSql :=
        'INSERT INTO aco_cotizacion' +
                  ' (co_cantempldesde, co_cantemplhasta, co_cantempresa, co_cantempresas, co_cantempresastro, co_canttrabajador, co_carterapromedio,' +
                   ' co_carterapromediopond, co_clausulasadicionales, co_comision, co_concie10, co_contacto, co_costomedico, co_costosiniestral, co_cuit,' +
                   ' co_empresanueva, co_establecimientos, co_estado, co_form931, co_frecuencia, co_id, co_idactividad, co_idcotizacionanterior, co_idfidelitas,' +
                   ' co_idgrupoeconomico, co_masasalarial, co_nivel, co_nrocotizacion, co_observaciones, co_primaporcsalario, co_primaprommercado, co_razonsocial,' +
                   ' co_salariopromedio, co_sincie10, co_statusbcra, co_statussrt, co_tasaincidencia, co_telefono, co_usuariosolicitado)' +
           ' (SELECT co_cantempldesde, co_cantemplhasta, co_cantempresa, co_cantempresas, co_cantempresastro, :canttrabajador, co_carterapromedio,' +
                   ' co_carterapromediopond, co_clausulasadicionales, :comision, co_concie10, :contacto, co_costomedico, co_costosiniestral, co_cuit,' +
                   ' co_empresanueva, :establecimientos, :estado, co_form931, co_frecuencia, :id, :idactividad, co_id, co_idfidelitas,' +
                   ' :idgrupoeconomico, :masasalarial, co_nivel, :nrocotizacion, co_observaciones, co_primaporcsalario, co_primaprommercado, co_razonsocial,' +
                   ' co_salariopromedio, co_sincie10, co_statusbcra, co_statussrt, co_tasaincidencia, :telefono, :usuariosolicitado' +
              ' FROM aco_cotizacion' +
             ' WHERE co_id = :idcotizacionanterior)';
      EjecutarSqlSTEx(sSql, [edfpSC_CANTTRABAJADOR.Value,
                             edCO_COMISION.Value,
                             edCO_CONTACTO.Text,
                             edSC_ESTABLECIMIENTOS.Value,
                             EC_EN_PREPARACION,
                             iIdCotizacion,
                             frafpSC_IDACTIVIDAD.Value,
                             fraCO_IDGRUPOECONOMICO.Value,
                             edfpSC_MASASALARIAL.Value,
                             iNumeroCotizacion,
                             edCO_TELEFONO.Text,
                             GetUsuarioSolicitado,
                             sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger]);

      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_estado = :estado,' +
              ' sc_idcotizacion = :idcotizacion' +
        ' WHERE sc_id = :id';
      EjecutarSqlSTEx(sSql, [EC_EN_PREPARACION, iIdCotizacion, FIdSolicitud]);
      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [FIdSolicitud]);
    end
    else
    begin
      if not MsgAsk('¿ Desea reemplazar todos los datos por los de la cotización seleccionada ?') then
        Exit;


      iIdCotizacion := FIdCotizacion;

      sSql :=
        'UPDATE aco_cotizacion a' +
          ' SET (co_cantempldesde, co_cantemplhasta, co_cantempresa, co_cantempresas, co_cantempresastro, co_carterapromedio, co_carterapromediopond,' +
               ' co_clausulasadicionales, co_concie10, co_costomedico, co_costosiniestral, co_cuit, co_empresanueva, co_form931, co_frecuencia,' +
               ' co_idcotizacionanterior, co_idfidelitas, co_nivel, co_observaciones, co_primaporcsalario, co_primaprommercado, co_razonsocial,' +
               ' co_salariopromedio, co_sincie10, co_statusbcra, co_statussrt, co_tasaincidencia, co_usuariosolicitado) =' +
               ' (SELECT co_cantempldesde, co_cantemplhasta, co_cantempresa, co_cantempresas, co_cantempresastro, co_carterapromedio, co_carterapromediopond,' +
                       ' co_clausulasadicionales, co_concie10, co_costomedico, co_costosiniestral, co_cuit, co_empresanueva, co_form931, co_frecuencia,' +
                       ' co_idcotizacionanterior, co_idfidelitas, co_nivel, co_observaciones, co_primaporcsalario, co_primaprommercado, co_razonsocial,' +
                       ' co_salariopromedio, co_sincie10, co_statusbcra, co_statussrt, co_tasaincidencia, :usuariosolicitado' +
                  ' FROM aco_cotizacion b' +
                 ' WHERE b.co_id = :idcotizacionanterior)' +
        ' WHERE a.co_id = :id';
      EjecutarSqlSTEx(sSql, [GetUsuarioSolicitado, sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger, iIdCotizacion]);

      sSql :=
        'DELETE FROM acc_cotizacioncostocartera' +
             ' WHERE cc_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [iIdCotizacion]);

      sSql :=
        'DELETE FROM acs_cotizacionsiniestro' +
             ' WHERE cs_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [iIdCotizacion]);

      sSql :=
        'DELETE FROM adi_detalleilp' +
             ' WHERE di_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [iIdCotizacion]);

      sSql :=
        'DELETE FROM atc_tarifacobrar' +
             ' WHERE tc_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [iIdCotizacion]);

      sSql :=
        'DELETE FROM aco_costootros' +
             ' WHERE co_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [iIdCotizacion]);

      sSql :=
        'UPDATE ass_solicitudsrt' +
          ' SET ss_fechabaja = SYSDATE,' +
              ' ss_usubaja = :usubaja' +
        ' WHERE ss_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [Sesion.UserID, iIdCotizacion]);
    end;


    // Grabo el texto de Fildelitas..
    sSql :=
      'SELECT co_textofidelitas' +
       ' FROM aco_cotizacion' +
      ' WHERE co_id = ' + SqlValue(iIdCotizacion);
    sUpdateSql :=
      'UPDATE aco_cotizacion' +
        ' SET co_textofidelitas = :co_textofidelitas' +
      ' WHERE co_id = ' + SqlValue(iIdCotizacion);
    aBlob := TStringList.Create;
    try
      aBlob.Text := ValorSqlEx('SELECT co_textofidelitas FROM aco_cotizacion WHERE co_id = :id', [sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger]);
      SaveBlob(sSql, sUpdateSql, 'co_textofidelitas', aBlob);
    finally
      aBlob.Free;
    end;


    sSql :=
      'INSERT INTO acc_cotizacioncostocartera' +
                 ' (cc_id, cc_idcotizacion, cc_idempresa, cc_suma, cc_porcentaje, cc_salario, cc_trabajador, cc_costo)' +
         ' (SELECT seq_accc_id.NEXTVAL, :idcotizacion, cc_idempresa, cc_suma, cc_porcentaje, cc_salario, cc_trabajador, cc_costo' +
            ' FROM acc_cotizacioncostocartera' +
           ' WHERE cc_idcotizacion = :idcotizacionanterior)';
    EjecutarSqlSTEx(sSql, [iIdCotizacion, sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger]);


    sSql :=
      'INSERT INTO acs_cotizacionsiniestro' +
                 ' (cs_id, cs_idcotizacion, cs_anio, cs_cantidadtrabajador, cs_salariocubierto, cs_periodocubierto, cs_cantsiniestro,' +
                  ' cs_cantsiniestroconbaja, cs_cantmuerte, cs_cantsiniestroleve, cs_cantsiniestrograve, cs_cantipp50, cs_cantipp5066, cs_cantincapacidadtotal,' +
                  ' cs_cantdiasbajaart, cs_cantmuerteinitinere, cs_cantdiasilt)' +
         ' (SELECT seq_tec_acs_id.NEXTVAL, :idcotizacion, cs_anio, cs_cantidadtrabajador, cs_salariocubierto, cs_periodocubierto, cs_cantsiniestro,' +
                 ' cs_cantsiniestroconbaja, cs_cantmuerte, cs_cantsiniestroleve, cs_cantsiniestrograve, cs_cantipp50, cs_cantipp5066, cs_cantincapacidadtotal,' +
                 ' cs_cantdiasbajaart, cs_cantmuerteinitinere, cs_cantdiasilt' +
            ' FROM acs_cotizacionsiniestro' +
           ' WHERE cs_idcotizacion = :idcotizacionanterior)';
    EjecutarSqlSTEx(sSql, [iIdCotizacion, sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger]);


    sSql :=
      'INSERT INTO adi_detalleilp' +
                 ' (di_id, di_idcotizacion, di_sexo, di_fechanac, di_edad, di_anio, di_porcentaje, di_muerte, di_fechaalta, di_usualta, di_fechamodif, di_usumodif)' +
         ' (SELECT seq_adi_id.NEXTVAL, :idcotizacion, di_sexo, di_fechanac, di_edad, di_anio, di_porcentaje, di_muerte, SYSDATE, :usualta, SYSDATE, :usumodif' +
            ' FROM adi_detalleilp' +
           ' WHERE di_idcotizacion = :idcotizacionanterior)';
    EjecutarSqlSTEx(sSql, [iIdCotizacion, 'C_' + Sesion.UserID, 'C_' + Sesion.UserID, sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger]);


    sSql :=
      'INSERT INTO atc_tarifacobrar' +
                 ' (tc_id, tc_idcotizacion, tc_usualta, tc_fechaalta, tc_sumafija, tc_porcvariable, tc_costofinal)' +
         ' (SELECT seq_atcc_id.NEXTVAL, :idcotizacion, :usualta, actualdate, 0, 0, 0' +
            ' FROM DUAL)';
    EjecutarSqlSTEx(sSql, [iIdCotizacion, Sesion.UserID]);


    sSql :=
      'INSERT INTO aco_costootros' +
                 ' (co_id, co_idcotizacion, co_idart, co_suma, co_porcentaje, co_salario, co_costo, co_trabajador)' +
         ' (SELECT seq_acoo_id.NEXTVAL, :idcotizacion, co_idart, co_suma, co_porcentaje, co_salario, co_costo, co_trabajador' +
            ' FROM aco_costootros' +
           ' WHERE co_idcotizacion = :idcotizacionanterior)';
    EjecutarSqlSTEx(sSql, [iIdCotizacion, sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger]);


    sSql :=
      'INSERT INTO ass_solicitudsrt' +
                 ' (ss_id, ss_idcotizacion, ss_idart, ss_vigenciadesde, ss_vigenciahasta, ss_operacion, ss_nivel, ss_fechaextincion, ss_fecharegularizacion,' +
                  ' ss_usualta, ss_fechaalta, ss_usumodif, ss_fechamodif, ss_usubaja, ss_fechabaja, ss_idactividad1, ss_idactividad2, ss_idactividad3, ss_rescision)' +
         ' (SELECT afi.seq_ass_id.NEXTVAL, :idcotizacion, ss_idart, ss_vigenciadesde, ss_vigenciahasta, ss_operacion, ss_nivel, ss_fechaextincion, ss_fecharegularizacion,' +
                 ' ss_usualta, ss_fechaalta, ss_usumodif, ss_fechamodif, ss_usubaja, ss_fechabaja, ss_idactividad1, ss_idactividad2, ss_idactividad3, ss_rescision' +
            ' FROM ass_solicitudsrt' +
           ' WHERE ss_idcotizacion = :idcotizacionanterior)';
    EjecutarSqlSTEx(sSql, [iIdCotizacion, sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger]);


    CommitTrans;

    bError := False;
  except
    on E: Exception do
    begin
      RollBack;
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
    end;
  end;

  if not bError then
  begin
    fpRecuperarDatos.Close;
    DoCargar(iIdCotizacion, 'consulta');
  end;
}


  BeginTrans;
  try
    if not MsgAsk('¿ Desea reemplazar todos los datos de la grilla por los de la cotización seleccionada ?') then
      Exit;


    // Borro los datos de la tabla..
    sSql :=
      'DELETE FROM adi_detalleilp' +
           ' WHERE di_idcotizacion = :idcotizacion';
    EjecutarSqlSTEx(sSql, [FIdCotizacion]);

    // Inserto los datos en la grilla..
    CargarDetalleILP(sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger);

    // Inserto los datos en la tabla solo si ya existe la cotización..
    if edCO_NROCOTIZACION.Value > 0 then
    begin
      sSql :=
        'INSERT INTO adi_detalleilp' +
                   ' (di_id, di_idcotizacion, di_sexo, di_fechanac, di_edad, di_anio, di_porcentaje, di_muerte, di_fechaalta, di_usualta, di_fechamodif, di_usumodif)' +
           ' (SELECT seq_adi_id.NEXTVAL, :idcotizacion, di_sexo, di_fechanac, di_edad, di_anio, di_porcentaje, di_muerte, SYSDATE, :usualta, SYSDATE, :usumodif' +
              ' FROM adi_detalleilp' +
             ' WHERE di_idcotizacion = :idcotizacionanterior)';
      EjecutarSqlSTEx(sSql, [FIdCotizacion, 'C_' + Sesion.UserID, 'C_' + Sesion.UserID, sdqCotizacionesHistoricas.FieldByName('co_id').AsInteger]);
    end;

    CommitTrans;

    fpRecuperarDatos.Close;
  except
    on E: Exception do
    begin
      RollBack;
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfrmAdminCotizacion.fpRecuperarDatosBeforeShow(Sender: TObject);
begin
  checkMostrarSoloUltimaCotizacion.Checked := True;

  if not sdqCotizacionesHistoricas.Active then
    CargarCotizacionesHistoricas;
end;

procedure TfrmAdminCotizacion.DetalleILPClear;
//var
//  iCol: Integer;
begin
// COMENTO TODO LO QUE HACE ESTA FUNCIÓN, PORQUE LE BORRA EL TÍTULO A LAS COLUMNAS Y NO VEO QUE TENGA NINGÚN SENTIDO ESO..
//  for iCol := 0 to GridDetalleILP.ColCount - 1 do
//    GridDetalleILP.Cols[iCol].Clear;
end;

procedure TfrmAdminCotizacion.edOrdenKeyPress(Sender: TObject; var Key: Char);
var
  sSql: String;
begin
  if Key = #13 then
  begin
    if ((edCO_NROCOTIZACION.IsFilled) and (edCO_NROCOTIZACION.Value <> 0)) then
    begin
      sSql :=
        'SELECT NVL(co_id, 0)' +
         ' FROM aco_cotizacion' +
        ' WHERE co_nrocotizacion = :nrocotizacion' +
          ' AND co_orden = :orden';
      DoCargar(ValorSqlEx(sSql, [edCO_NROCOTIZACION.Value, edOrden.Value], '0'), 'consulta');
    end;
  end;
end;

procedure TfrmAdminCotizacion.tbDescargarDatosUARTClick(Sender: TObject);
begin
  IniciarEspera('Descargando información...');
  try
    Application.ProcessMessages;
    Sleep(1000);    // Hago una pausita porque la información baja tan rápida que ni se llega a mostrar el cartel..
    fraImportUART.BuscarPorEmpresa(edCO_CUIT.Text);
    GuardarTotalJuiciosEnObservaciones;
    CargarSolapaJuicios;
  finally
    DetenerEspera;
  end;
end;

procedure TfrmAdminCotizacion.GuardarTotalJuiciosEnObservaciones;
  function GuardarSeclo(aObservaciones: String): String;
    var
      iPosFinal: Integer;
      iPosInicial: Integer;
      sSql: String;
  begin
    Result := '';

    iPosInicial := Pos('[<.', aObservaciones);
    iPosFinal   := Pos('.>]', aObservaciones);

    if (iPosInicial > 0) and (iPosFinal > 0) then   // Solo borra si encuentra los caracteres de apertura y cierre..
      Delete(aObservaciones, iPosInicial, (iPosFinal - iPosInicial + 3));

    sSql :=
      'SELECT se_anio, se_cantidad ' +
       ' FROM afi.ase_seclos' +
      ' WHERE se_fechabaja IS NULL' +
        ' AND se_cuit = :cuit' +
   ' ORDER BY se_anio DESC';
    with GetQueryEx(sSql, [edCO_CUIT.Text]) do
    try
      if Eof then
        Result := Chr(13) + Chr(10) + '[<. SIN SECLOS .>]'
      else
      begin
        Result := Chr(13) + Chr(10) + '[<. SECLOS';
        while not Eof do
        begin
          Result := Result + Format(' %d:%d,', [FieldByName('se_anio').AsInteger, FieldByName('se_cantidad').AsInteger]);
          Next;
        end;
        System.Delete(Result, Length(Result), 1);
        Result := Result + ' .>]';
      end;
    except
      Free;
    end;

    Result := aObservaciones + Result;
  end;


  function Guardar(aObservaciones: String): String;
  var
    iPosFinal: Integer;
    iPosInicial: Integer;
    sSql: String;
  begin
    Result := '';
    iPosInicial := Pos('<<.', aObservaciones);
    iPosFinal   := Pos('.>>', aObservaciones);

    if (iPosInicial > 0) and (iPosFinal > 0) then   // Solo borra si encuentra los caracteres de apertura y cierre..
      Delete(aObservaciones, iPosInicial, (iPosFinal - iPosInicial + 3));

    sSql :=
      'SELECT   EXTRACT(YEAR FROM ju_fechanotificacion) ano, COUNT(*) total' +
         ' FROM comunes.cju_juiciosuart' +
        ' WHERE EXTRACT(YEAR FROM ju_fechanotificacion) IS NOT NULL' +
          ' AND ju_cuitempresa = :cuitempresa' +
     ' GROUP BY EXTRACT(YEAR FROM ju_fechanotificacion)' +
     ' ORDER BY 1 DESC';
    with GetQueryEx(sSql, [edCO_CUIT.Text]) do
    try
      if Eof then
        Result := Chr(13) + Chr(10) + '<<. SIN JUICIOS .>>'
      else
      begin
        Result := Chr(13) + Chr(10) + '<<. Juicios';
        while not Eof do
        begin
          Result := Result + Format(' %d:%d,', [FieldByName('ano').AsInteger, FieldByName('total').AsInteger]);
          Next;
        end;
        System.Delete(Result, Length(Result), 1);
        Result := Result + ' .>>';
      end;
    except
      Free;
    end;

    Result := aObservaciones + Result;
  end;

var
  sObservaciones: String;
  sSql: String;
begin
  // Guardo el total en la base de datos..
  sSql :=
    'SELECT co_observaciones' +
     ' FROM aco_cotizacion' +
    ' WHERE co_id = :id';
  sObservaciones := Guardar(ValorSqlEx(sSql, [FIdCotizacion]));
  sObservaciones := GuardarSeclo(sObservaciones);
  sSql :=
    'UPDATE aco_cotizacion' +
      ' SET co_observaciones = :observaciones' +
    ' WHERE co_id = :id';
  EjecutarSqlEx(sSql, [sObservaciones, FIdCotizacion]);

  // Guardo el total en el campo del formulario..
  edCO_OBSERVACIONES.Lines.Text := Guardar(edCO_OBSERVACIONES.Lines.Text);
  edCO_OBSERVACIONES.Lines.Text := GuardarSeclo(edCO_OBSERVACIONES.Lines.Text);
end;

procedure TfrmAdminCotizacion.CargarSolapaJuicios;
var
  sSql: String;
begin
  sdqJuicios.Close;

  sSql :=
    'SELECT ju.*, ar_nombre art, DECODE(ju_artrevaluacion, ''S'', ''Sí'', ''No'') artrevaluacion, ci_descripcion caracterart, stipo1.tb_descripcion contingencia1,' +
          ' stipo2.tb_descripcion contingencia2, stipo3.tb_descripcion contingencia3, art.utiles.armar_cuit(ju_cuiltrabajador) cuiltrabajador, dg_descripcion diagnostico,' +
          ' lec1.ec_descripcion enfermedadreclamada1, lec2.ec_descripcion enfermedadreclamada2, lec3.ec_descripcion enfermedadreclamada3,' +
          ' lec4.ec_descripcion enfermedadreclamada4, DECODE(ju_presentaroncm, ''S'', ''Sí'', ''No'') presentaroncm,' +
          ' DECODE(ju_presentaronem, ''S'', ''Sí'', ''No'') presentaronem, pv_descripcion provincia, DECODE(ju_reclamaincapacidad, ''S'', ''Sí'', ''No'') reclamaincapacidad,' +
          ' DECODE(ju_vinculolaboral, ''S'', ''Sí'', ''No'') vinculolaboral, lz_descripcion zonacuerpo' +
     ' FROM comunes.cju_juiciosuart ju, afi.aar_art, legales.lci_caracterintervencion, art.cpv_provincias, ctb_tablas stipo1, ctb_tablas stipo2, ctb_tablas stipo3,' +
          ' legales.lec_enfermedadreclamada lec1, legales.lec_enfermedadreclamada lec2, legales.lec_enfermedadreclamada lec3, legales.lec_enfermedadreclamada lec4,' +
          ' art.cdg_diagnostico, slz_lesionzona' +
    ' WHERE ju_codigoart = ar_codigosrt(+)' +
      ' AND ju_caracterart = ci_codigosrt(+)' +
      ' AND ju_provincia = pv_codigodgi(+)' +
      ' AND ju_contingencia1 = stipo1.tb_codigo(+)' +
      ' AND stipo1.tb_clave(+) = ''STIPO''' +
      ' AND ju_contingencia2 = stipo2.tb_codigo(+)' +
      ' AND stipo2.tb_clave(+) = ''STIPO''' +
      ' AND ju_contingencia3 = stipo3.tb_codigo(+)' +
      ' AND stipo3.tb_clave(+) = ''STIPO''' +
      ' AND ju_enfermedadreclamada1 = lec1.ec_codigo(+)' +
      ' AND ju_enfermedadreclamada2 = lec2.ec_codigo(+)' +
      ' AND ju_enfermedadreclamada3 = lec3.ec_codigo(+)' +
      ' AND ju_enfermedadreclamada4 = lec4.ec_codigo(+)' +
      ' AND ju_zonacuerpo = lz_codigo(+)' +
      ' AND ju_diagnostico = dg_codigo(+)' +
      ' AND ar_fechabaja IS NULL' +
      ' AND ci_fechabaja IS NULL' +
      ' AND pv_fechabaja IS NULL' +
      ' AND stipo1.tb_fechabaja IS NULL' +
      ' AND stipo2.tb_fechabaja IS NULL' +
      ' AND stipo3.tb_fechabaja IS NULL' +
      ' AND lec1.ec_fechabaja IS NULL' +
      ' AND lec2.ec_fechabaja IS NULL' +
      ' AND lec3.ec_fechabaja IS NULL' +
      ' AND lec4.ec_fechabaja IS NULL' +
      ' AND dg_fechabaja IS NULL' +
      ' AND lz_fechabaja IS NULL' +
      ' AND ju_cuitempresa = :cuitempresa' +
 ' ORDER BY ju_fechanotificacion DESC';

  OpenQueryEx(sdqJuicios, [edCO_CUIT.Text], sSql, True);
end;

procedure TfrmAdminCotizacion.sdqJuiciosAfterOpen(DataSet: TDataSet);
begin
  TFloatField(DataSet.FieldByName('ju_montoreclamado')).DisplayFormat := '$ ,0.00;-$ ,0.00';

  TFloatField(DataSet.FieldByName('ju_porcincapacidadart')).DisplayFormat    := '% ,0.00;-% ,0.00';
  TFloatField(DataSet.FieldByName('ju_porcincapacidadperito')).DisplayFormat := '% ,0.00;-% ,0.00';
end;

procedure TfrmAdminCotizacion.tbVerDetallesClick(Sender: TObject);
begin
  Verificar((not sdqJuicios.Active) or (sdqJuicios.FieldByName('ju_id') = nil), nil, PAGE_JUICIOS, 'Debe seleccionar un registro.');

  fpDetalleJuicio.ShowModal;
end;

procedure TfrmAdminCotizacion.btnCerrar3Click(Sender: TObject);
begin
  fpDetalleJuicio.Close;
end;

procedure TfrmAdminCotizacion.fpDetalleJuicioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpDetalleJuicio.Close;
end;

procedure TfrmAdminCotizacion.scrollJuiciosMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
                                                      MousePos: TPoint; var Handled: Boolean);
var
  msg: Cardinal;
  code: Cardinal;
  i, n: Integer;
begin
  Handled := True;
  if ssShift in Shift then
    msg := WM_HSCROLL
  else
    msg := WM_VSCROLL;

  if WheelDelta < 0 then
    code := SB_LINEDOWN
  else
    code := SB_LINEUP;

  n := Mouse.WheelScrollLines;
  for i:= 1 to n do
    scrollJuicios.Perform(msg, code, 0);
  scrollJuicios.Perform(msg, SB_ENDSCROLL, 0);
end;

procedure TfrmAdminCotizacion.gridJuiciosDblClick(Sender: TObject);
begin
  tbVerDetallesClick(Sender);
end;

procedure TfrmAdminCotizacion.fpDetalleJuicioBeforeShow(Sender: TObject);
begin
  with sdqJuicios do
  begin
    fpDetalleJuicio.Caption := 'Detalle del Juicio con Nº de Expediente ' + FieldByName('ju_numeroexpediente').AsString;

    edJuicioArt.Text                              := FieldByName('art').AsString;
    edJuicioNumeroExpediente.Text                 := FieldByName('ju_numeroexpediente').AsString;
    memoJuicioCaratula.Lines.Text                 := FieldByName('ju_caratula').AsString;
    edJuicioCaracterArt.Text                      := FieldByName('caracterart').AsString;
    edJuicioFechaNotificacion.Date                := FieldByName('ju_fechanotificacion').AsDateTime;
    memoJuicioDepartamentoJudicial.Lines.Text     := GetDepartamentoJudicial(FieldByName('ju_departamentojudicial').AsString);
    edJuicioJuzgadoTribunal.Text                  := FieldByName('ju_juzgadotribunal').AsString;
    edJuicioCuilTrabajador.Text                   := FieldByName('cuiltrabajador').AsString;
    edJuicioNumeroSiniestro.Text                  := FieldByName('ju_numerosiniestro').AsString;
    edJuicioFechaAccidente.Date                   := FieldByName('ju_fechaaccidente').AsDateTime;
    edJuicioNumeroExpedienteCMOHV.Text            := FieldByName('ju_numeroexpedientecmohv').AsString;
    edJuicioMontoReclamado.Value                  := FieldByName('ju_montoreclamado').AsCurrency;
    edJuicioPresentaronEstudiosMedicos.Text       := FieldByName('presentaronem').AsString;
    edJuicioPresentaronCertificadosMedicos.Text   := FieldByName('presentaroncm').AsString;
    edJuicioAbogadosActora.Text                   := FieldByName('ju_abogadosactora').AsString;
    edJuicioMedicosActora.Text                    := FieldByName('ju_medicosactora').AsString;
    edJuicioPeritosOficiales.Text                 := FieldByName('ju_peritosoficiales').AsString;
    edJuicioReclamanIncapacidad.Text              := FieldByName('reclamaincapacidad').AsString;
    edJuicioIncapacidadPerito.Value               := FieldByName('ju_porcincapacidadperito').AsFloat;
    edJuicioIncapacidadArt.Value                  := FieldByName('ju_porcincapacidadart').AsFloat;
    edJuicioArtRevaluacion.Text                   := FieldByName('artrevaluacion').AsString;
    edJuicioActuacionArt.Text                     := FieldByName('ju_actuacionart').AsString;
    edJuicioVinculoLaboral.Text                   := FieldByName('vinculolaboral').AsString;
    edJuicioMediacion.Text                        := FieldByName('ju_seclomediacion').AsString;
    memoJuicioSentenciaCorteProvincial.Lines.Text := FieldByName('ju_sentenciacorteprovincial').AsString;
    memoJuicioSentenciaCorteSuprema.Lines.Text    := FieldByName('ju_sentenciacortesuprema').AsString;
    memoJuicioSentencia1ra.Lines.Text             := GetSentencia(FieldByName('ju_sentencia1ra').AsString);
    edJuicioMonto1ra.Value                        := FieldByName('ju_monto1ra').AsCurrency;
    edJuicioIncapacidad1raSentencia.Value         := FieldByName('ju_porcincapacidad1rasentencia').AsFloat;
    memoJuicioSentencia2da.Lines.Text             := GetSentencia(FieldByName('ju_sentencia2da').AsString);
    edJuicioMonto2da.Value                        := FieldByName('ju_monto2da').AsCurrency;
    edJuicioIncapacidad2daSentencia.Value         := FieldByName('ju_porcincapacidad2dasentencia').AsFloat;
    edJuicioContingencia1.Text                    := FieldByName('contingencia1').AsString;
    edJuicioContingencia2.Text                    := FieldByName('contingencia2').AsString;
    edJuicioContingencia3.Text                    := FieldByName('contingencia3').AsString;
    edJuicioEnfermedadReclamada1.Text             := FieldByName('enfermedadreclamada1').AsString;
    edJuicioEnfermedadReclamada2.Text             := FieldByName('enfermedadreclamada2').AsString;
    edJuicioEnfermedadReclamada3.Text             := FieldByName('enfermedadreclamada3').AsString;
    edJuicioEnfermedadReclamada4.Text             := FieldByName('enfermedadreclamada4').AsString;
    memoJuicioObjetoArt1.Lines.Text               := GetObjetoArt(FieldByName('ju_objetoart1').AsString);
    memoJuicioObjetoArt2.Lines.Text               := GetObjetoArt(FieldByName('ju_objetoart2').AsString);
    memoJuicioObjetoArt3.Lines.Text               := GetObjetoArt(FieldByName('ju_objetoart3').AsString);
    memoJuicioObjetoArt4.Lines.Text               := GetObjetoArt(FieldByName('ju_objetoart4').AsString);
    memoJuicioObjetoArt5.Lines.Text               := GetObjetoArt(FieldByName('ju_objetoart5').AsString);
    edJuicioTipoOperacion.Text                    := FieldByName('ju_tipooperacion').AsString;
    edJuicioProvincia.Text                        := FieldByName('provincia').AsString;
    edJuicioZonaCuerpo.Text                       := FieldByName('zonacuerpo').AsString;
    edJuicioDiagnostico.Text                      := FieldByName('diagnostico').AsString;
    edJuicioFechaProceso.Date                     := FieldByName('ju_fechaproceso').AsDateTime;
  end;
end;

function TfrmAdminCotizacion.GetSentencia(const aSentencia1ra: String): String;
var
  sSql: String;
begin
  Result := '';

  sSql :=
    'SELECT tr_descripcion' +
     ' FROM legales.ltr_tiporesultadosentencia' +
    ' WHERE tr_codigosrt = :codigosrt';
  with GetQueryEx(sSql, [aSentencia1ra]) do
  try
    while not Eof do
    begin
      Result := Result + FieldByName('tr_descripcion').AsString + #13#10;
      Next;
    end;
  finally
    Free;
  end;
end;

function TfrmAdminCotizacion.GetObjetoArt(const aObjetoArt: String): String;
var
  sSql: String;
begin
  Result := '';

  sSql :=
    'SELECT rc_descripcion' +
     ' FROM legales.lrc_reclamo' +
    ' WHERE rc_codigosrt = :codigosrt';
  with GetQueryEx(sSql, [aObjetoArt]) do
  try
    while not Eof do
    begin
      Result := Result + FieldByName('rc_descripcion').AsString + #13#10;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmAdminCotizacion.btnRecuperarTarifaPisoClick(Sender: TObject);
var
//  iMicroPyme: Integer;
  sSql: String;
begin
{  sSql :=
    'SELECT sc_micropyme' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_idcotizacion = :idcotizacion';
  iMicroPyme := ValorSqlIntegerEx(sSql, [FIdCotizacion]);}

  if edCO_CANTTRABAJADOR.Value <= 50 then
  begin
    with sdspGetCotizacion do
    begin
      ParamByName('ncant_trabajador').AsInteger := edCO_CANTTRABAJADOR.Value;
      ParamByName('ndescuento').AsFloat         := 0;
      ParamByName('nid_ciiu').AsInteger         := fraCO_IDACTIVIDAD.Value;
      ParamByName('nmasa_salarial').AsFloat     := edCO_MASASALARIAL.Value;
//      ParamByName('nmpyme').AsInteger           := iMicroPyme;

      ExecProc;

      if ParamByName('nerror').AsInteger in [0, 3] then
      begin
        edCostoFijoTP.Value     := ParamByName('nsuma_fija').AsFloat;
        edCostoVariableTP.Value := ParamByName('nvariable').AsFloat;
        edCostoFinalTP.Value    := ParamByName('ncosto_capitas').AsFloat;
      end;
    end;
  end
  else
  begin
    sSql :=
      'SELECT 1' +
       ' FROM aac_alternativascotizacion' +
      ' WHERE ac_idcotizacion = :idcotizacion' +
        ' AND ac_fechabaja IS NULL' +
        ' AND ac_gsvariables = 15';   // Pedido asi por ticket 60024..
    Verificar(not ExisteSqlEx(sSql, [FIdCotizacion]), btnRecuperarTarifaPiso, PCCotizaciones.ActivePageIndex, 'No existe una alternativa de cotización con "Gs variables" igual a 15.');

    sSql :=
      'UPDATE aco_cotizacion' +
        ' SET (co_sumafijapiso, co_porcvariablepiso, co_costofinalpiso, co_comisionpiso, co_acpopiso) =' +
              ' (SELECT sumafija, porcvariable, costofinal, comision, acpo' +
                 ' FROM (SELECT   0.6 sumafija, a.ac_variable porcvariable, a.ac_pesosporcapitasinsac + 0.6 costofinal, a.ac_comision comision, a.ac_juicios acpo' +
                           ' FROM aac_alternativascotizacion a' +
                          ' WHERE ac_idcotizacion = :idcotizacion' +
                            ' AND ac_fechabaja IS NULL' +
                            ' AND ac_gsvariables = 15)' +
                ' WHERE ROWNUM = 1)' +
      ' WHERE co_id = :idcotizacion';
    EjecutarSqlEx(sSql, [FIdCotizacion]);

    sSql :=
      'SELECT co_sumafijapiso, co_porcvariablepiso, co_costofinalpiso, co_comisionpiso, co_acpopiso' +
       ' FROM aco_cotizacion' +
      ' WHERE co_id = :id';
    with GetQueryEx(sSql, [FIdCotizacion]) do
    try
      edCostoFijoTP.Value     := FieldByName('co_sumafijapiso').AsFloat;
      edCostoVariableTP.Value := FieldByName('co_porcvariablepiso').AsFloat;
      edCostoFinalTP.Value    := FieldByName('co_costofinalpiso').AsFloat;
      edComisionTP.Value      := FieldByName('co_comisionpiso').AsFloat;
      edAcpoTP.Value          := FieldByName('co_acpopiso').AsFloat;
    finally
      Free;
    end;
  end;
end;

procedure TfrmAdminCotizacion.edCostoFijoTPChange(Sender: TObject);
begin
  if (not (edCO_MASASALARIAL.Value = 0)) and (ActiveControl = edCostoFijoTP) then
    edCostoVariableTP.Value := (edCostoFinalTP.Value - edCostoFijoTP.Value) / edCO_MASASALARIAL.Value * edCO_CANTTRABAJADOR.Value * 100;
end;

procedure TfrmAdminCotizacion.edCostoVariableTPChange(Sender: TObject);
begin
  if (not edCO_CANTTRABAJADOR.IsEmpty) and (ActiveControl = edCostoVariableTP) then
    edCostoFijoTP.Value := edCostoFinalTP.Value - ((edCostoVariableTP.Value / 100) * edCO_MASASALARIAL.Value / edCO_CANTTRABAJADOR.Value);
end;

procedure TfrmAdminCotizacion.edCostoFinalTPChange(Sender: TObject);
begin
  if not (edCO_MASASALARIAL.Value = 0) and (ActiveControl = edCostoFinalTP) then
    edCostoVariableTP.Value := (edCostoFinalTP.Value - edCostoFijoTP.Value) / edCO_MASASALARIAL.Value * edCO_CANTTRABAJADOR.Value * 100;
end;

procedure TfrmAdminCotizacion.edComisionTPChange(Sender: TObject);
begin
  if (not edCO_CANTTRABAJADOR.IsEmpty) and ((ActiveControl = edCostoVariableTP) or (ActiveControl = btnCotizador)) then
    edCostoFijoTP.Value := edCostoFinalTP.Value - ((edCostoVariableTP.Value / 100) * edCO_MASASALARIAL.Value / edCO_CANTTRABAJADOR.Value);
end;

procedure TfrmAdminCotizacion.btnCopiarTarifaSugeridaClick(Sender: TObject);
begin
  edCostoFijoTP.Value     := edTC_SUMAFIJA.Value;
  edCostoVariableTP.Value := edTC_PORCVARIABLE.Value;
  edCostoFinalTP.Value    := edTC_COSTOFINAL.Value;
  edComisionTP.Value      := edComisionCotizada.Value;
  edAcpoTP.Value          := edAcpo.Value;
end;

procedure TfrmAdminCotizacion.btnCopiarTarifaPisoClick(Sender: TObject);
begin
  edTC_SUMAFIJA.Value      := edCostoFijoTP.Value;
  edTC_PORCVARIABLE.Value  := edCostoVariableTP.Value;
  edTC_COSTOFINAL.Value    := edCostoFinalTP.Value;
  edComisionCotizada.Value := edComisionTP.Value;
  edAcpo.Value             := edAcpoTP.Value;
end;

procedure TfrmAdminCotizacion.SetToolBarPrevencion(const aAccion: String);
begin
  VCLExtra.LockControl(edPrevencion1, (aAccion <> 'E'));

  if aAccion = 'E' then
  begin
    tbCancelar.Show;
    tbEditar.Hint := 'Guardar';
    tbEditar.ImageIndex := 3;
  end;

  if aAccion = 'G' then
  begin
    tbCancelar.Hide;
    tbEditar.Hint := 'Editar';
    tbEditar.ImageIndex := 7;
  end;
end;

procedure TfrmAdminCotizacion.tbEditarClick(Sender: TObject);
var
  sSql: String;
begin
  if tbCancelar.Visible then
  begin
    sSql :=
      'UPDATE aco_cotizacion' +
        ' SET co_fechamodprevencion1 = SYSDATE,' +
            ' co_prevencion1 = :prevencion1,' +
            ' co_usumodprevencion1 = :usumodprevencion1' +
      ' WHERE co_id = :id';
    EjecutarSqlEx(sSql, [edPrevencion1.Value, Sesion.UserID, FIdCotizacion]);
  end;

  SetToolBarPrevencion(IIF((tbCancelar.Visible), 'G', 'E'));
end;

procedure TfrmAdminCotizacion.tbCancelarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT co_prevencion1' +
     ' FROM aco_cotizacion' +
    ' WHERE co_id = :id';
  edPrevencion1.Value := ValorSqlExtendedEx(sSql, [FIdCotizacion]);

  SetToolBarPrevencion('G');
end;

procedure TfrmAdminCotizacion.checkMostrarSoloUltimaCotizacionClick(Sender: TObject);
begin
  CargarCotizacionesHistoricas;
end;

procedure TfrmAdminCotizacion.tbRecuperarDatosCotizacionesAnteriores2Click(Sender: TObject);
begin
  fpRecuperarDatos.ShowModal;
end;

procedure TfrmAdminCotizacion.chkCargaManualClick(Sender: TObject);
begin
  with edIndiceCombinado do
    if chkCargaManual.Checked then
    begin
      Color := clWhite;
      ReadOnly := False;
    end
    else
    begin
      Color := clBtnFace;
      ReadOnly := True;
    end;
end;

procedure TfrmAdminCotizacion.PreviewCotizacionPageAvailable(Sender: TObject; PageNum: Integer);
begin
  inherited;
  PreviewCotizacion.Zoom := 100;
end;

function TfrmAdminCotizacion.CalcularIndiceCombinado(const aCantTrabajador, aIdActividad, aIdCotizacion: Integer; aMasaSalarial, aCostoFinal: Extended): Extended;
var
  dCostoFinalTPOriginal: Double;
//  iMicroPyme: Integer;
  sSql: String;
begin
{  sSql :=
    'SELECT sc_micropyme' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_idcotizacion = :idcotizacion';
  iMicroPyme := ValorSqlIntegerEx(sSql, [FIdCotizacion]);}

  if aCantTrabajador <= 50 then
  begin
    dCostoFinalTPOriginal := 0;
    with sdspGetCotizacion do
    begin
      ParamByName('ncant_trabajador').AsInteger := aCantTrabajador;
      ParamByName('ndescuento').AsFloat         := 0;
      ParamByName('nid_ciiu').AsInteger         := aIdActividad;
      ParamByName('nmasa_salarial').AsFloat     := aMasaSalarial;
//      ParamByName('nmpyme').AsInteger           := iMicroPyme;

      ExecProc;
      if ParamByName('nerror').AsInteger in [0, 3, 9] then
        dCostoFinalTPOriginal := ParamByName('ncosto_capitas').AsFloat;   //necesito el valor original de este sp
    end;
    Result :=  dCostoFinalTPOriginal / aCostoFinal * 100
  end

  else
  begin
    sSql :=
      'SELECT ac_pesosporcapitasinsac' +
       ' FROM aac_alternativascotizacion' +
      ' WHERE ac_idcotizacion = :idcotizacion' +
        ' AND ac_fechabaja IS NULL' +
        ' AND ac_gsvariables = 15';
    Result := ((ValorSqlExtendedEx(sSql, [aIdCotizacion]) + 0.60) / aCostoFinal) * 100;
  end;
end;

procedure TfrmAdminCotizacion.GuardarObservacionesPorCuit(const aIdCotizacion: Integer);
var
  iPosFinal: Integer;
  iPosInicial: Integer;
  sObservaciones: String;
  sSql: String;
begin
  // Traigo las observaciones de la cotización..
  sSql :=
    'SELECT co_observaciones' +
     ' FROM aco_cotizacion' +
    ' WHERE co_id = :id';
  sObservaciones := ValorSqlEx(sSql, [aIdCotizacion]);

  // Borro las observaciones relacionadas con la C.U.I.T..
  iPosInicial := Pos('[<!', sObservaciones);
  iPosFinal   := Pos('!>]', sObservaciones);
  if (iPosInicial > 0) and (iPosFinal > 0) then   // Solo borra si encuentra los caracteres de apertura y cierre..
    Delete(sObservaciones, iPosInicial, (iPosFinal - iPosInicial + 3));

  // Traigo las observaciones de la C.U.I.T..
  sSql :=
    'SELECT ''[<!'' || RTRIM(XMLAGG(XMLELEMENT(a, oc_observacion || '', '')).EXTRACT(''//text()''), '','') || ''!>]''' +
     ' FROM afi.aoc_observacioncuit a' +
    ' WHERE oc_cuit = :cuit' +
      ' AND art.actualdate BETWEEN oc_fechadesde AND oc_fechahasta' +
      ' AND oc_fechabaja IS NULL';
  Insert(ValorSqlEx(sSql, [edCO_CUIT.Text]), sObservaciones, iPosInicial);

{  sSql :=
    'SELECT 1' +
     ' FROM aco_cotizacion' +
    ' WHERE co_fechaobservacioncuit IS NULL' +
      ' AND co_id = :id';
  if ExisteSqlEx(sSql, [aIdCotizacion]) then}
  begin
    sSql :=
      'UPDATE aco_cotizacion' +
        ' SET co_fechaobservacioncuit = SYSDATE,' +
            ' co_observaciones = :observaciones' +
      ' WHERE co_id = :id';
    EjecutarSqlEx(sSql, [sObservaciones, aIdCotizacion]);
  end;

  edCO_OBSERVACIONES.Lines.Text := sObservaciones;
end;

end.
