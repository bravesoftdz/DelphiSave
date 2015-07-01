unit unListAportesContribuciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, SinEdit,
  PeriodoPicker, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraCodDesc, FormPanel, Menus, QuickRpt, QRCtrls, CurrEdit, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, Buttons, RxCurrEdit, RxToolEdit,
  RxPlacemnt;

type
  TModoABM = (maNone, maAlta, maModificacion, maBaja);
  TfrmListAportesContribuciones = class(TfrmCustomConsulta)
    gbFechaAprobacion: TGroupBox;
    Label1: TLabel;
    edFechaAprobDesde: TDateComboBox;
    edFechaAprobHasta: TDateComboBox;
    gbTipoLiquidacion: TGroupBox;
    rbSuss: TRadioButton;
    rbNoSuss: TRadioButton;
    gbPeriodo: TGroupBox;
    ppPerFiltro: TPeriodoPicker;
    gbSiniestro: TGroupBox;
    edSiniestro: TSinEdit;
    tbGenerarPeriodo: TToolButton;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    sdqConsultaAux: TSDQuery;
    tbCerrarPeriodo: TToolButton;
    tbGenerarTXT: TToolButton;
    ToolButton9: TToolButton;
    sbDatosPeriodo: TStatusBar;
    tbReabrirPeriodo: TToolButton;
    ToolButton2: TToolButton;
    tbImprimir2: TToolButton;
    ToolButton10: TToolButton;
    pmnuImprimir: TPopupMenu;
    mnuLiqAprobadas: TMenuItem;
    mnuImpGrilla: TMenuItem;
    tbExportar2: TToolButton;
    pmnuExportar: TPopupMenu;
    mnuExportarGrilla: TMenuItem;
    mnuExportarAprobadas: TMenuItem;
    sdqDetalle1: TSDQuery;
    sdqDetalle: TSDQuery;
    edAprobadas: TExportDialog;
    ToolBar1: TToolBar;
    tbFechaPago: TToolButton;
    mnuExportarDetallePorCuil: TMenuItem;
    edPorCuil: TExportDialog;
    sdqPorCuil: TSDQuery;
    dsPorCuil: TDataSource;
    mnuImprimirDetallePorCuil: TMenuItem;
    GroupBox1: TGroupBox;
    rbActivoTodos: TRadioButton;
    rbActivoNo: TRadioButton;
    rbActivoSi: TRadioButton;
    Panel7: TPanel;
    pnl2: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    qrGrilla: TQuickRep;
    PageHeaderBand1: TQRBand;
    qrlTitulo: TQRLabel;
    qrlSubtitulo: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText24: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel24: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape2: TQRShape;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel23: TQRLabel;
    qrlUsuario: TQRLabel;
    QRSysData1: TQRSysData;
    imgLogo: TQRImage;
    qrlSeleccion: TQRLabel;
    qrlEmpDep: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape3: TQRShape;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    ScrollBox2: TScrollBox;
    qrDetallePorCuil: TQuickRep;
    QRBand1: TQRBand;
    QRLabel16: TQRLabel;
    qrlPeriodo: TQRLabel;
    QRImage1: TQRImage;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRBand3: TQRBand;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape4: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRBand4: TQRBand;
    QRLabel36: TQRLabel;
    QRExpr6: TQRExpr;
    QRShape5: TQRShape;
    QRExpr7: TQRExpr;
    QRLabel37: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRBand5: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel38: TQRLabel;
    qrlUsuarioImp: TQRLabel;
    QRSysData4: TQRSysData;
    QRShape6: TQRShape;
    QRLabel18: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    tbVerDuplicados: TToolButton;
    sdqDuplicados: TSDQuery;
    dsDuplicados: TDataSource;
    ToolButton7: TToolButton;
    tbVerMixtos: TToolButton;
    QRLabel17: TQRLabel;
    QRDBText27: TQRDBText;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    sdqMixtos: TSDQuery;
    dsMixtos: TDataSource;
    tbVerCompensables: TToolButton;
    sdqCompensables: TSDQuery;
    dsCompensables: TDataSource;
    sdqNoIncluidos: TSDQuery;
    dsNoIncluidos: TDataSource;
    tbNoIncluidos: TToolButton;
    ScrollBox3: TScrollBox;
    fpAlta: TFormPanel;
    Bevel6: TBevel;
    Button1: TButton;
    dbgNoIncluidos: TArtDBGrid;
    btnIncluirPeriodo: TButton;
    fpMixtos: TFormPanel;
    Bevel3: TBevel;
    btnCerrarMix: TButton;
    dgMixtos: TArtDBGrid;
    btnIncluirMix: TButton;
    fpCompensables: TFormPanel;
    Bevel4: TBevel;
    btnCerrarComp: TButton;
    dgCompensables: TArtDBGrid;
    btnCompensar: TButton;
    fpDuplicados: TFormPanel;
    Bevel2: TBevel;
    btnCerrarDup: TButton;
    dgDuplicados: TArtDBGrid;
    fpFechaPago: TFormPanel;
    lblPeriodo: TLabel;
    Bevel5: TBevel;
    dFechaPago: TDateComboBox;
    btnAceptarPago: TButton;
    btnCancelarPago: TButton;
    fpModif: TFormPanel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label70: TLabel;
    Label2: TLabel;
    lblSiguiente: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnAceptarAlta: TButton;
    btnCancelarAlta: TButton;
    edObservacionesABM: TMemo;
    fraOSocialABM: TfraCodigoDescripcion;
    fraAFJPABM: TfraCodigoDescripcion;
    fraZonaAFIPABM: TfraCodigoDescripcion;
    fraMotivoABM: TfraCodigoDescripcion;
    lblSeleccion: TPanel;
    fraCondicionAFIPABM: TfraCodigoDescripcion;
    edPorcContribABM: TCurrencyEdit;
    mnuImprimirResumenNoSus: TMenuItem;
    ScrollBox4: TScrollBox;
    qrResumenNoSuss: TQuickRep;
    QRBand6: TQRBand;
    qrlTitResumenNoSuss: TQRLabel;
    qrlPeriodoNoSuss: TQRLabel;
    QRImage2: TQRImage;
    QRBand7: TQRBand;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel39: TQRLabel;
    qrlRetJub: TQRLabel;
    qrlContribOS: TQRLabel;
    QRBand8: TQRBand;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRShape7: TQRShape;
    QRDBText31: TQRDBText;
    qrdbRetJub: TQRDBText;
    qrdbRetOS: TQRDBText;
    QRBand9: TQRBand;
    QRShape8: TQRShape;
    qreRetOS: TQRExpr;
    QRLabel48: TQRLabel;
    qreRetJub: TQRExpr;
    QRExpr15: TQRExpr;
    QRBand10: TQRBand;
    QRSysData5: TQRSysData;
    QRLabel49: TQRLabel;
    qrlUsuarioImpNoSuss: TQRLabel;
    QRSysData6: TQRSysData;
    QRShape9: TQRShape;
    qrlRetOS: TQRLabel;
    qrlContribJubil: TQRLabel;
    qrdbContribJubil: TQRDBText;
    qrdbContribOS: TQRDBText;
    qreContribJubil: TQRExpr;
    qreContribOS: TQRExpr;
    sdqResumenNoSuss: TSDQuery;
    dsResumenNoSuss: TDataSource;
    sdqResumenNoSussAux: TSDQuery;
    MnuImpOS: TMenuItem;
    mnuImpSistPrev: TMenuItem;
    edResumenNoSuss: TExportDialog;
    mnuExpResumenNoSuss: TMenuItem;
    mnuExpOS: TMenuItem;
    mnuExpSistPrev: TMenuItem;
    sdqTotales: TSDQuery;
    rgDifVal: TRadioGroup;
    GroupBox2: TGroupBox;
    dcConcepto: TDBCheckCombo;
    dsConcepto: TDataSource;
    sdqConcepto: TSDQuery;
    rgINR: TRadioGroup;
    tbPagarImponible: TToolButton;
    MnuImpResumenObraSocial: TMenuItem;
    MnuImpDetalleObraSocial: TMenuItem;
    mnuImpResumenSistPrev: TMenuItem;
    mnuImpDetalleSistPrev: TMenuItem;
    fpImpDetalleApYContNoSuss: TFormPanel;
    Bevel7: TBevel;
    btnAceptarDet: TButton;
    btnCancelarDet: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    fraOrganismoOS: TfraCodigoDescripcion;
    rbPorOrganismo: TRadioButton;
    rbPorMunicipio: TRadioButton;
    fraOrganismoSistPrev: TfraCodigoDescripcion;
    lblTema: TLabel;
    Bevel8: TBevel;
    ScrollBox5: TScrollBox;
    qrDetalleNoSuss: TQuickRep;
    QRBand11: TQRBand;
    QRLabel31: TQRLabel;
    qrlOrganismo: TQRLabel;
    QRImage3: TQRImage;
    qrlSeleccionNoSuss: TQRLabel;
    QRBand12: TQRBand;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel58: TQRLabel;
    QRBand13: TQRBand;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRShape10: TQRShape;
    QRDBText36: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText47: TQRDBText;
    QRBand14: TQRBand;
    QRLabel62: TQRLabel;
    QRExpr17: TQRExpr;
    QRLabel63: TQRLabel;
    QRExpr20: TQRExpr;
    QRExpr22: TQRExpr;
    QRBand15: TQRBand;
    QRSysData7: TQRSysData;
    QRLabel64: TQRLabel;
    qrlUsuarioDetNoSuss: TQRLabel;
    QRSysData8: TQRSysData;
    QRShape12: TQRShape;
    sdqDetalleNoSuss: TSDQuery;
    ppPerDesde: TPeriodoPicker;
    ppPerHasta: TPeriodoPicker;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText46: TQRDBText;
    QRExpr18: TQRExpr;
    mnuExpResumenOS: TMenuItem;
    mnuExpDetalleOS: TMenuItem;
    mnuExpResumenSistPrev: TMenuItem;
    mnuExpDetalleSistPrev: TMenuItem;
    edDetalleNoSuss: TExportDialog;
    ToolBar2: TToolBar;
    tbMarcar: TToolButton;
    qrlCantEmpresas: TQRLabel;
    GroupBox3: TGroupBox;
    rbExisteEnPerAnt_No: TRadioButton;
    rbExisteEnPerAnt_Si: TRadioButton;
    rbExisteEnPerAnt_Todos: TRadioButton;
    pmnuCompensarConNeg: TPopupMenu;
    mnuCompensRem: TMenuItem;
    mnuCompensNoRem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbGenerarPeriodoClick(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fpModifBeforeShow(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnAceptarAltaClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ppPerFiltroChange(Sender: TObject);
    procedure rbSussClick(Sender: TObject);
    procedure rbNoSussClick(Sender: TObject);
    procedure tbCerrarPeriodoClick(Sender: TObject);
    function is_todasLiquidacionesAprobadas: boolean;
    procedure tbReabrirPeriodoClick(Sender: TObject);
    procedure tbGenerarTXTClick(Sender: TObject);
    procedure mnuLiqAprobadasClick(Sender: TObject);
    procedure tbImprimir2Click(Sender: TObject);
    procedure mnuImpGrillaClick(Sender: TObject);
    procedure tbExportar2Click(Sender: TObject);
    procedure mnuExportarAprobadasClick(Sender: TObject);
    procedure mnuExportarGrillaClick(Sender: TObject);
    procedure fraMotivoABMOnChange(Sender: TObject);
    procedure tbFechaPagoClick(Sender: TObject);
    procedure btnAceptarPagoClick(Sender: TObject);
    procedure mnuExportarDetallePorCuilClick(Sender: TObject);
    procedure mnuImprimirDetallePorCuilClick(Sender: TObject);
    procedure tbVerDuplicadosClick(Sender: TObject);
    procedure tbVerMixtosClick(Sender: TObject);
    procedure btnIncluirMixClick(Sender: TObject);
    procedure tbVerCompensablesClick(Sender: TObject);
    procedure btnCompensarClick(Sender: TObject);
    procedure tbNoIncluidosClick(Sender: TObject);
    procedure btnIncluirPeriodoClick(Sender: TObject);
    procedure tbMostrarOcultarColumnasClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String;
      var Value: String; var CellColor, FontColor: TColor;
      var AlignFooter: TAlingFooter);
    procedure tbPagarImponibleClick(Sender: TObject);
    procedure MnuImpResumenObraSocialClick(Sender: TObject);
    procedure mnuImpResumenSistPrevClick(Sender: TObject);
    procedure btnAceptarDetClick(Sender: TObject);
    procedure MnuImpDetalleObraSocialClick(Sender: TObject);
    procedure mnuImpDetalleSistPrevClick(Sender: TObject);
    procedure fpImpDetalleApYContNoSussBeforeShow(Sender: TObject);
    procedure mnuExpResumenOSClick(Sender: TObject);
    procedure mnuExpResumenSistPrevClick(Sender: TObject);
    procedure mnuExpDetalleOSClick(Sender: TObject);
    procedure mnuExpDetalleSistPrevClick(Sender: TObject);
    procedure dbgNoIncluidosCellClick(Column: TColumn);
    procedure dbgNoIncluidosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgNoIncluidosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbMarcarClick(Sender: TObject);
    procedure mnuCompensRemClick(Sender: TObject);
    procedure mnuCompensNoRemClick(Sender: TObject);
  private
    ModoABM: TModoABM;
    bPerGenerado, bPerCerrado, bPerDefinitivo, bPerPagado, bRefrescar: Boolean;
    IdPeriodo: Integer;
    FRegistrosSeleccionados: TStringList;
    function HayRegistroActivo: Boolean;
    function HayRegistros: Boolean;
    procedure DoCargarDatosPeriodo;
    procedure DoImpExpDetallePorCUIL(bImprimir :Boolean);
    procedure DoImpExpResumenNoSuss(bImprimir, bObraSocial :Boolean);
    procedure Do_UpdatePagarImponible(var iIdReg: integer; bPagarImponible: boolean);
    procedure Do_UpdateRemuReal(var iIdReg: integer; bPagarImponible: boolean);
    procedure Do_HabilitarComboOrganismo(sTipo:string);
    procedure OnOrganismosOSChange(Sender: TObject);            // TK 32294 - Plan
    procedure OnOrganismosSistPrevChange(Sender: TObject);
    procedure Do_HabilitarRadioButtons_OrgMun(bHabilita:boolean);
    procedure Do_LimpiarFpDetalleApYContNoSuss;
    procedure Do_GenerarListadoNoSussDetalle(bImprimir :Boolean);
    procedure Do_VisualizarColumnas_ResumenNoSuss(bImprimir, bObraSocial: Boolean);   // TK 32294 Plan
    procedure Do_MarcarTodos;
    procedure Do_DesmarcarTodos;
    procedure Do_GenerarSdqCompensables(sTiporem:string);
    procedure Do_CompensablesClick(sTipoRem:string);
  public
    { Public declarations }
  end;

const
  MAXCOLSUMA = 11;
  CAMPOS_SUMA: Array [0..MAXCOLSUMA] of String = ('LE_SUBTOTAL', 'TOTEMP', 'TOTTRAB', 'LE_IMPORPERI',
                                                  'REMUNERACION', 'CONTREAL', 'APORJUB', 'APOROS',
                                                  'CONTJUB', 'CONTOS', 'RETREAL', 'AC_NOREMUNERATIVO');
  SISTPREV   = 'Sistema Previsional';   // TK 32294 Plan
  OBRASOCIAL = 'Obra Social';
var
  frmListAportesContribuciones: TfrmListAportesContribuciones;
  Totales: Array of Extended;

implementation

uses
  CustomDlgs, StrFuncs, unSesion, SqlFuncs, AnsiSql, unDmPrincipal,
  General, DateTimeFuncs, VCLExtra, unRptAportesContrib, Periodo,
  unImpoExpoWizard, Math, unVisualizador, DbFuncs;

{$R *.dfm}

{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.FormCreate(Sender: TObject);
begin
  inherited;
  ppPerFiltro.Periodo.Valor     := ValorSql('SELECT TO_CHAR(SYSDATE, ''MM/YYYY'') FROM DUAL');
  fraOrganismoOS.OnChange       := OnOrganismosOSChange;          // TK 32294 - Plan
  fraOrganismoSistPrev.OnChange := OnOrganismosSistPrevChange;

  with fraOSocialABM do
  begin
    TableName   := 'cos_osocial';
    FieldID     := 'os_codigo';
    FieldCodigo := 'os_codigo';
    FieldDesc   := 'os_descripcion || DECODE(os_tipo, ''S'', '' (SUSS)'', ''N'', '' (NO SUSS)'') ';
    FieldBaja   := 'os_fecbaja';
    ExtraFields := ', os_tipo ';
    ShowBajas   := False;
    IDType      := ctString;
  end;

  with fraAFJPABM do
  begin
    TableName   := 'sju_jubilacion';
    FieldID     := 'ju_codigo';
    FieldCodigo := 'ju_codigo';
    FieldDesc   := 'ju_nombre || DECODE(ju_tipo, ''S'', '' (SUSS)'', ''N'', '' (NO SUSS)'') ';
    FieldBaja   := 'ju_fechabaja';
    ExtraFields := ', ju_tipo ';
    ShowBajas   := False;
    IDType      := ctString;
  end;

  with fraZonaAFIPABM do
  begin
    TableName   := 'sza_zonaafip';
    FieldID     := 'za_id';
    FieldCodigo := 'za_zona';
    FieldDesc   := 'za_localidad';
    FieldBaja   := 'za_fechabaja';
    ShowBajas   := False;
    Sql := 'SELECT za_id ' + CD_ALIAS_ID + ', ' +
                  'za_zona ' + CD_ALIAS_CODIGO + ', ' +
                  'za_localidad || '' ('' || pv_descripcion || '')'' '  + CD_ALIAS_DESC + ', ' +
                  'za_fechabaja AS ' + CD_ALIAS_BAJA + ' ' +
             'FROM cpv_provincias, sza_zonaafip ' +
            'WHERE za_provincia = pv_codigo';
  end;

  with fraMotivoABM do
  begin
    TableName   := 'sin.sma_motivosaportes';
    FieldID     := 'ma_id';
    FieldCodigo := 'ma_codigo';
    FieldDesc   := 'ma_descripcion';
    FieldBaja   := 'ma_fechabaja';
    ShowBajas   := False;
    IDType      := ctInteger;
    OnChange    := fraMotivoABMOnChange;
    ExtraFields := ', ma_periodosiguiente ';
  end;

  with fraCondicionAFIPABM do
  begin
    TableName   := 'sin.sca_condicionafip';
    FieldID     := 'ca_id';
    FieldCodigo := 'ca_id';
    FieldDesc   := 'ca_descripcion';
    FieldBaja   := 'ca_fechabaja';
    ShowBajas   := True;
    IDType      := unFraCodigoDescripcion.TCodigoType(ctInteger);
  end;

  // TK 32294
  with fraOrganismoOS do
  begin
    TableName      := 'cos_osocial';
    FieldID        := 'os_codigo';
    FieldCodigo    := 'os_codigo';
    FieldBaja      := 'os_fecbaja';
    FieldDesc      := 'os_descripcion';
    ExtraCondition := ' AND os_tipo = ''N'' ';  // No Suss
    ShowBajas      := False;
    IDType         := ctString;
  end;
  // TK 32294
  with fraOrganismoSistPrev do
  begin
    TableName      := 'sju_jubilacion';
    FieldID        := 'ju_codigo';
    FieldCodigo    := 'ju_codigo';
    FieldBaja      := 'ju_fechabaja';
    FieldDesc      := 'ju_nombre';
    ExtraCondition := ' AND ju_tipo = ''N'' ';  // No Suss
    ShowBajas      := False;
    IDType         := ctString;
  end;

  tbMostrarOcultarColumnas.Down       := False;
  Grid.FooterBand                     := False;
  tbMostrarOcultarColumnas.ImageIndex := 48;
  SetLength(Totales, MAXCOLSUMA + 1);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbRefrescarClick(Sender: TObject);
var
  sSql :String;
begin
  Verificar(ppPerFiltro.Periodo.IsNull, ppPerFiltro, 'Debe seleccionar un periodo.');
  sSql := sdqConsultaAux.SQL.Text;
  if not(edSiniestro.IsEmpty) then
    sSql := sSql + ' AND le_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                   ' AND le_orden = ' + SqlInt(edSiniestro.Orden) +
                   ' AND le_recaida = ' + SqlInt(edSiniestro.Recaida);
  if not(edFechaAprobDesde.IsEmpty) then
    sSql := sSql + ' AND le_faprobado >= ' + SqlDate(edFechaAprobDesde.Date);
  if not(edFechaAprobHasta.IsEmpty) then
    sSql := sSql + ' AND le_faprobado <= ' + SqlDate(edFechaAprobHasta.Date);

  if rbActivoSi.Checked then
    sSql := sSql + ' AND ac_idmotivobaja IS NULL '
  else if rbActivoNo.Checked then
    sSql := sSql + ' AND ac_idmotivobaja IS NOT NULL ';

  if rbExisteEnPerAnt_Si.Checked then
    sSql := sSql + ' AND ac_existeenperiodoant = ''S'' '
  else if rbExisteEnPerAnt_No.Checked then
    sSql := sSql + ' AND ac_existeenperiodoant = ''N'' ';

  case rgDifVal.ItemIndex of
    0: ssql := ssql + ' AND decode(le_subtotal, ROUND(remunera, 2),''N'', ''S'') = ''S'' ';  //difvalor = 'S'
    1: ssql := ssql + ' AND decode(le_subtotal, ROUND(remunera, 2),''N'', ''S'') = ''N'' ';  //difvalor = 'N'
  end;

  case rgINR.ItemIndex of
    0: ssql := ssql + ' AND ac_noremunerativo > 0 ';  //difvalor = 'S'
    1: ssql := ssql + ' AND ac_noremunerativo = 0 ';  //difvalor = 'N'
  end;

  if (dcConcepto.InSql <> '') then
    ssql := ssql + ' AND le_conpago ' + dcConcepto.InSql;

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
  sdqConsulta.ParamByName('periodo').AsDate     := ValorSqlDateTime('SELECT TO_DATE(''01/' + ppPerFiltro.Periodo.Valor + ''', ''dd/mm/yyyy'') FROM DUAL');
  sdqConsulta.ParamByName('tiposuss').AsString  := IIF(rbSuss.Checked, 'S', 'N');
  inherited;
  tbMostrarOcultarColumnas.Down := False;
  Grid.FooterBand               := False;
  DoCargarDatosPeriodo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbLimpiarClick(Sender: TObject);
begin
  rbSuss.Checked := True;
  ppPerFiltro.Periodo.Valor := ValorSql('SELECT TO_CHAR(SYSDATE, ''MM/YYYY'') FROM DUAL');
  edSiniestro.Clear;
  edFechaAprobDesde.Clear;
  edFechaAprobHasta.Clear;
  rbActivoSi.Checked := True;
  rgDifVal.ItemIndex := 2;
  rgINR.ItemIndex := 2;
  dcConcepto.Clear;
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbGenerarPeriodoClick(Sender: TObject);
var
  sSql, sSuss :String;
  dPer, dProx: TDate;
begin
  Verificar(ppPerFiltro.Periodo.IsNull, ppPerFiltro, 'Debe seleccionar un periodo.');

  dProx := ValorSqlDateTime('SELECT TO_DATE(''01'' || TO_CHAR(ADD_MONTHS(SYSDATE, 1), ''mm/yyyy''), ''dd/mm/yyyy'') FROM DUAL');
  dPer  := ValorSqlDateTime('SELECT TO_DATE(''01/' + ppPerFiltro.Periodo.Valor + ''', ''dd/mm/yyyy'') FROM DUAL');
  Verificar(dPer >= dProx, ppPerFiltro, 'No es posible generar periodos posteriores al actual.');

  sSuss := IIF(rbSuss.Checked, 'S', 'N');
  sSql  := 'SELECT 1 FROM sin.spa_periodosaportes ' +
           ' WHERE TO_CHAR(pa_periodo, ''mm/yyyy'') = :per ' +
             ' AND pa_tiposuss = :tipo ' +
             ' AND pa_fechabaja IS NULL ';
  Verificar(ExisteSqlEx(sSql, [ppPerFiltro.Periodo.Valor, sSuss]),
            ppPerFiltro, 'El periodo seleccionado ya ha sido generado.');

  if MsgAsk('¿Confirma la generación del periodo ' + ppPerFiltro.Periodo.Valor +
            ' para las liquidaciones ' + IIF(rbSuss.Checked, 'SUSS', 'No SUSS') + '?') then
  try
    sSql := 'art.dinerarias.do_generarperiodoapycon(:periodo, :tipo, :usuario);';
    BeginTrans;
    EjecutarStoreSTEx(sSql, [TDateTimeEx.Create(dPer), sSuss, Sesion.UserID]);
    CommitTrans;
    MsgBox('El periodo ' + ppPerFiltro.Periodo.Valor + ' se ha generado correctamente.', MB_ICONINFORMATION);
    tbRefrescarClick(Nil);
  except
    on E:Exception do
      begin
        ErrorMsg(E, 'Error al intentar generar el periodo.');
        Rollback;
      end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbSalir2Click(Sender: TObject);
begin
  Close;
end;
{-------------------------------------------------------------------------------}
function TfrmListAportesContribuciones.HayRegistroActivo: Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty) and
            sdqConsulta.FieldByName('ac_idmotivobaja').IsNull;
end;
{-------------------------------------------------------------------------------}
function TfrmListAportesContribuciones.HayRegistros: Boolean;
begin
  Result := sdqConsulta.Active and not(sdqConsulta.IsEmpty);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbModificarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not HayRegistroActivo, Nil, 'Debe seleccionar un registro válido para modificar.');
  Verificar(bPerCerrado, Nil, 'El periodo seleccionado ya ha sido cerrado.');
  ModoABM         := maModificacion;
  fpModif.Caption := 'Modificación';
  if (fpModif.ShowModal = mrOk) then
  try
    sSql := 'UPDATE sin.sac_aportesycontribuciones ' +
              ' SET ac_codigoos = ' + SqlValue(fraOSocialABM.Codigo) + ',' +
                  ' ac_tipoos = ' + SqlValue(fraOSocialABM.sdqDatos.FieldByName('os_tipo').AsString) + ',' +
                  ' ac_codigoafjp = ' + SqlValue(fraAFJPABM.Codigo) + ',' +
                  ' ac_tipoafjp = ' + SqlValue(fraAFJPABM.sdqDatos.FieldByName('ju_tipo').AsString) + ',' +
                  ' ac_idzonaafip = ' + SqlInt(fraZonaAFIPABM.Value, True) + ',' +
                  ' ac_condicionafip = ' + SqlInt(fraCondicionAFIPABM.Value) + ',' +
                  ' ac_porcentajecont = ' + SqlNumber(edPorcContribABM.Value) + ',' + 
                  ' ac_idmotivomodif = ' + SqlInt(fraMotivoABM.Value) + ',' +
                  ' ac_observaciones = ' + SqlValue(edObservacionesABM.Lines.Text) + ',' +
                  ' ac_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' ac_fechamodif = Sysdate ' +
            ' WHERE ac_id = ' + SqlInt(sdqConsulta.FieldByName('ac_id').AsInteger);
    EjecutarSql(sSql);
    tbRefrescarClick(Nil);
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar modificar la liquidación.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.fpModifBeforeShow(Sender: TObject);
begin
  inherited;
  with sdqConsulta do
  begin
    lblSiguiente.Visible          := False;
    lblSeleccion.Caption          := 'Siniestro - Liq.: ' + FieldByName('nrosiniliq').AsString +
                                        ' - Trabajador: ' + FieldByName('tj_nombre').AsString;
    lblSeleccion.Color            := IIF((ModoABM = maBaja), clRed, $00427BF2);
    fraOSocialABM.Codigo          := FieldByName('ac_codigoos').AsString;
    fraAFJPABM.Codigo             := FieldByName('ac_codigoafjp').AsString;
    fraZonaAFIPABM.Value          := FieldByName('ac_idzonaafip').AsInteger;
    fraCondicionAFIPABM.Value     := FieldByName('ac_condicionafip').AsInteger;
    edPorcContribABM.Value        := StrToFloat(StringReplace(FieldByName('totpe').AsString, '.', ',', []));
    fraMotivoABM.ExtraCondition   := ' AND ma_esbaja = ' + SqlBoolean(ModoABM = maBaja);
    fraMotivoABM.Value            := IIF(ModoABM = maBaja, FieldByName('ac_idmotivobaja').AsInteger,
                                                           FieldByName('ac_idmotivomodif').AsInteger);
    edObservacionesABM.Lines.Text := FieldByName('ac_observaciones').AsString;
    LockControls([fraOSocialABM, fraAFJPABM, fraZonaAFIPABM, fraCondicionAFIPABM], (ModoABM = maBaja));
    LockControl(edPorcContribABM, (ModoABM = maBaja) or (FieldByName('mixto').AsString = 'S'));
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not HayRegistroActivo, Nil, 'Debe seleccionar un registro válido para eliminar.');
  Verificar(bPerCerrado, Nil, 'El periodo seleccionado ya ha sido cerrado.');
  ModoABM         := maBaja;
  fpModif.Caption := 'Baja';
  if (fpModif.ShowModal = mrOk) then
  try
    sSql := 'UPDATE sin.sac_aportesycontribuciones ' +
              ' SET ac_idmotivobaja = ' + SqlInt(fraMotivoABM.Value) + ',' +
                  ' ac_observaciones = ' + SqlValue(edObservacionesABM.Lines.Text) + ',' +
                  ' ac_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                  ' ac_fechabaja = Sysdate ' +
            ' WHERE ac_id = ' + SqlInt(sdqConsulta.FieldByName('ac_id').AsInteger);
    EjecutarSql(sSql);
    tbRefrescarClick(Nil);
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar eliminar la liquidación.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.btnAceptarAltaClick(Sender: TObject);
begin
  Verificar(fraMotivoABM.IsEmpty, fraMotivoABM, 'Debe seleccionar el motivo correspondiente.');
  fpModif.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Highlight then
  begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color := clNavy;
    Background := clGray;
  end else
  begin
    AFont.Style := AFont.Style - [fsBold];
    AFont.Color := clBlack;
  end;

  if not sdqConsulta.FieldByName('ac_idmotivobaja').IsNull then
    AFont.Color := clRed
  else if (sdqConsulta.FieldByName('mixto').AsString = 'S') then
    AFont.Color := $007A7A3D
  else if not sdqConsulta.FieldByName('ac_idmotivomodif').IsNull then
    AFont.Color := $00427BF2
  else if (sdqConsulta.FieldByName('ac_vienedeanterior').AsString = 'S') then
    AFont.Color := $00F4A500;

  if AreIn(Field.FullName, ['LE_SUBTOTAL', 'REMUNERACION']) and
     (sdqConsulta.FieldByName('LE_SUBTOTAL').AsCurrency <>
      sdqConsulta.FieldByName('REMUNERACION').AsCurrency) then
    AFont.Color :=  $00EA8BFE;

 { if field.FullName = 'difvalor' then
    if (sdqConsulta.FieldByName('LE_SUBTOTAL').AsCurrency <>
      sdqConsulta.FieldByName('REMUNERACION').AsCurrency) then
      grid.Fields[46].AsString := 'S'
    else
      grid.Fields[46].Value := 'N';  }



end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.ppPerFiltroChange(Sender: TObject);
begin
  inherited;
  DoCargarDatosPeriodo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.DoCargarDatosPeriodo;
var
  sSql: String;
begin
  IdPeriodo       := 0;
  bPerCerrado     := False;
  bPerPagado      := False;
  bPerDefinitivo  := False;
  sbDatosPeriodo.Panels[0].Text := '';
  sbDatosPeriodo.Panels[1].Text := '';
  sbDatosPeriodo.Panels[2].Text := '';
  if not ppPerFiltro.Periodo.IsNull then
  begin
    sbDatosPeriodo.Panels[0].Text := 'Periodo: ' + ppPerFiltro.Periodo.Valor +
                                     ' - Tipo: ' + IIF(rbSuss.Checked, 'SUSS', 'No SUSS');
    sSql := 'SELECT TRUNC(pa_fechaalta) falta, TRUNC(pa_fechacierre) fcierre, ' +
                  ' TRUNC(pa_fechadefinitivo) fdef, TRUNC(pa_fechapago) fpago, ' +
                  ' pa_id ' +
             ' FROM sin.spa_periodosaportes ' +
            ' WHERE TO_CHAR(pa_periodo, ''mm/yyyy'') = :per ' +
              ' AND pa_tiposuss = :tipo ' +
              ' AND pa_fechabaja IS NULL ';
    with GetQueryEx(sSql, [ppPerFiltro.Periodo.Valor, IIF(rbSuss.Checked, 'S', 'N')]) do
    try
      bPerGenerado := not Eof;
      if Eof then
        sbDatosPeriodo.Panels[1].Text := 'Estado: NO GENERADO'
      else begin
        IdPeriodo := FieldByName('pa_id').AsInteger;
        sbDatosPeriodo.Panels[1].Text := 'Estado: GENERADO';
        sbDatosPeriodo.Panels[2].Text := 'Fecha generación: ' + FieldByName('falta').AsString;
        if not(FieldByName('fcierre').IsNull) then
        begin
          sbDatosPeriodo.Panels[1].Text := 'Estado: CERRADO';
          sbDatosPeriodo.Panels[2].Text := sbDatosPeriodo.Panels[2].Text +
                                           ' - Fecha cierre: ' + FieldByName('fcierre').AsString;
          bPerCerrado := True;
        end;
        if not(FieldByName('fdef').IsNull) then
        begin
          sbDatosPeriodo.Panels[1].Text := 'Estado: DEFINITIVO';
          sbDatosPeriodo.Panels[2].Text := sbDatosPeriodo.Panels[2].Text +
                                           ' - Fecha definitivo: ' + FieldByName('fdef').AsString;
          bPerDefinitivo := True;
        end;
        if not(FieldByName('fpago').IsNull) then
        begin
          sbDatosPeriodo.Panels[1].Text := 'Estado: PAGADO';
          sbDatosPeriodo.Panels[2].Text := sbDatosPeriodo.Panels[2].Text +
                                           ' - Fecha pago: ' + FieldByName('fpago').AsString;
          bPerPagado := True;
        end;
      end;
    finally
      Free;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.rbSussClick(Sender: TObject);
begin
  inherited;
  DoCargarDatosPeriodo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.rbNoSussClick(Sender: TObject);
begin
  inherited;
  DoCargarDatosPeriodo;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbCerrarPeriodoClick(Sender: TObject);
var
  sSql: String;
  bHayCompensables: Boolean;
begin
  Verificar(not bPerGenerado, Nil, 'El periodo seleccionado no ha sido generado.');
  Verificar(bPerCerrado, Nil, 'El periodo seleccionado ya ha sido cerrado.');
  Verificar(bPerDefinitivo, Nil, 'El periodo seleccionado ha sido cerrado definitivamente.');
  Verificar(bPerPagado, Nil, 'El periodo seleccionado ha sido pagado.');

  sSql := ' SELECT 1 ' +
            ' FROM sin.sac_aportesycontribuciones, art.sex_expedientes, ' +
                 ' art.sle_liquiempsin, art.scp_conpago ' +
           ' WHERE ac_siniestro = ex_siniestro ' +
             ' AND ac_orden = ex_orden ' +
             ' AND ac_recaida = ex_recaida ' +
             ' AND ac_siniestro = le_siniestro ' +
             ' AND ac_orden = le_orden ' +
             ' AND ac_recaida = le_recaida ' +
             ' AND ac_numliqui = le_numliqui ' +
             ' AND le_conpago = cp_conpago ' +
             ' AND cp_anticipo <> ''S'' ' +
             ' AND ac_fechabaja IS NULL ' +
             ' AND ac_idperiodo = :idperiodo ' +
        ' GROUP BY ex_cuil ' +
       ' HAVING COUNT(DISTINCT le_conpago) > 1';
  Verificar(ExisteSqlEx(sSql, [IdPeriodo]), Nil,
            'El periodo seleccionado posee al menos un CUIL con diferentes conceptos de pago.');

  Verificar((not is_todasLiquidacionesAprobadas) and (not seguridad.Claves.IsActive('CerrarPerLiqPend')), Nil, 'No se puede cerrar el periodo ya que existen liquidaciones automaticas pendientes de generar.');

  Do_GenerarSdqCompensables('T'); // Subtotal Remunerativo o No Remunerativo

  sdqCompensables.ParamByName('idperiodo').AsInteger := IdPeriodo;
  sdqCompensables.Open;
  bHayCompensables := not(sdqCompensables.Eof);
  sdqCompensables.Close;

  if bHayCompensables and
     not(MsgAsk('Existen posibles casos para compensar, ¿Desea cerrar el periodo de todas formas?')) then
    Exit;

  if MsgAsk('¿Confirma el cierre del periodo ' + ppPerFiltro.Periodo.Valor +
            ' para las liquidaciones ' + IIF(rbSuss.Checked, 'SUSS', 'No SUSS') + '?') then
  try
    sSql := 'UPDATE sin.spa_periodosaportes ' +
              ' SET pa_usucierre = :usuario, ' +
                  ' pa_fechacierre = sysdate ' +
            ' WHERE pa_id = :idperiodo ';
    EjecutarSqlEx(sSql, [Sesion.UserID, IdPeriodo]);
    MsgBox('El periodo seleccionado se ha cerrado correctamente.', MB_ICONINFORMATION);
    DoCargarDatosPeriodo;
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar cerrar el periodo.');
  end;
end;

function TfrmListAportesContribuciones.is_todasLiquidacionesAprobadas: boolean;
var ssql: string;
begin
  is_todasLiquidacionesAprobadas := true;

  ssql := ' SELECT 1 ' +
            ' FROM SIN.scl_casosliqautomaticas, art.sle_liquiempsin ' +
           ' WHERE cl_idexpediente = le_idexpediente ' +
             ' AND cl_nroliquidacion = le_numliqui ' +
             ' AND cl_estado = 4 ' +
             ' AND cl_fechabaja IS NULL ' +
             ' AND le_femision >= TO_DATE (:per1, ''DD/MM/YYYY'') ' +
             ' AND le_femision <= TO_DATE (:per2, ''DD/MM/YYYY'') ' +
             ' AND le_estado IN (''S'', ''C'', ''M'', ''V'', ''R'', ''G'', ''D'', ''A'') ';

  if ExisteSqlEx(ssql, ['01/' + ppPerFiltro.Periodo.Valor, '20/' + ppPerFiltro.Periodo.Valor]) then
    is_todasLiquidacionesAprobadas := false;

end;

{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbReabrirPeriodoClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not bPerGenerado, Nil, 'El periodo seleccionado no ha sido generado.');
  Verificar(not bPerCerrado, Nil, 'El periodo seleccionado no se encuentra cerrado.');
  Verificar(bPerDefinitivo, Nil, 'El periodo seleccionado ha sido cerrado definitivamente.');
  Verificar(bPerPagado, Nil, 'El periodo seleccionado ha sido pagado.');
  if MsgAsk('¿Confirma la reapertura del periodo ' + ppPerFiltro.Periodo.Valor +
            ' para las liquidaciones ' + IIF(rbSuss.Checked, 'SUSS', 'No SUSS') + '?') then
  try
    sSql := 'UPDATE sin.spa_periodosaportes ' +
              ' SET pa_usucierre = Null, ' +
                  ' pa_fechacierre = Null, ' +
                  ' pa_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' pa_fechamodif = sysdate ' +
            ' WHERE pa_id = ' + SqlInt(IdPeriodo);
    EjecutarSql(sSql);
    MsgBox('El periodo seleccionado se ha reabierto correctamente.', MB_ICONINFORMATION);
    DoCargarDatosPeriodo;
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar reabrir el periodo.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbGenerarTXTClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not bPerGenerado, Nil, 'El periodo seleccionado no ha sido generado.');
  Verificar(not bPerCerrado, Nil, 'El periodo seleccionado aún no ha sido cerrado.');
  Verificar(bPerDefinitivo, Nil, 'El periodo seleccionado ha sido cerrado definitivamente.');  
  Verificar(bPerPagado, Nil, 'El periodo seleccionado ha sido pagado.');

  if rbNoSuss.Checked then
  begin
    if MsgAsk('Para liquidaciones No SUSS no se genera el archivo, ' + #13 +
              '¿Desea cerrar definitivamente el periodo seleccionado?') then
    begin
      sSql := 'UPDATE SIN.spa_periodosaportes ' +
                ' SET pa_usudefinitivo = ' + SqlValue(Sesion.UserID) + ',' +
                    ' pa_fechadefinitivo = SYSDATE ' +
              ' WHERE pa_id = ' + SqlInt(IdPeriodo);
      EjecutarSql(sSql);
      DoCargarDatosPeriodo;
    end;
  end
  else if MsgAsk('¿Confirma la generación del archivo del periodo ' + ppPerFiltro.Periodo.Valor +
                 ' para las liquidaciones SUSS?') then
  try
    ImpoExpoWizard('APYCO');
    MsgBox('Se ha generado el archivo correctamente.', MB_ICONINFORMATION);
    DoCargarDatosPeriodo;
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar generar el archivo.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuLiqAprobadasClick(Sender: TObject);
var
  sSubTituloRango: String;
begin
  Verificar(edFechaAprobDesde.IsEmpty, edFechaAprobDesde, 'Debe ingresar la fecha de aprobación desde');
  Verificar(edFechaAprobHasta.IsEmpty, edFechaAprobHasta, 'Debe ingresar la fecha de aprobación hasta');

  sSubTituloRango := 'Liquidaciones aprobadas entre ' + DateToStr(edFechaAprobDesde.Date) + ' y ' +
                                                        DateToStr(edFechaAprobHasta.Date);

  RptAportesContrib := TRptAportesContrib.Create(nil);
  with RptAportesContrib do
  try
    TipoListado    := tlAFJPOS_SUSS;
    SubTitulo      := 'AFJP/OBRA SOCIAL - SUSS';
    SubTituloRango := sSubTituloRango;

    Preparar(edFechaAprobDesde.Date, edFechaAprobHasta.Date);
  finally
    free;
  end;

  RptAportesContrib := TRptAportesContrib.Create(nil);
  with RptAportesContrib do
  try
    TipoListado    := tlAFJP_NOSUSS;
    SubTitulo      := 'AFJP - NO SUSS';
    SubTituloRango := sSubTituloRango;

    Preparar(edFechaAprobDesde.Date, edFechaAprobHasta.Date);
  finally
    free;
  end;

  RptAportesContrib := TRptAportesContrib.Create(nil);
  with RptAportesContrib do
  try
    TipoListado    := tlOS_NOSUSS;
    SubTitulo      := 'OBRA SOCIAL - NO SUSS';
    SubTituloRango := sSubTituloRango;

    Preparar(edFechaAprobDesde.Date, edFechaAprobHasta.Date);
  finally
    free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbImprimir2Click(Sender: TObject);
begin
  tbImprimir2.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuImpGrillaClick(Sender: TObject);
begin
  if HayRegistros then
    with qrGrilla do
    try
      qrlSubtitulo.Caption := sbDatosPeriodo.Panels[0].Text + ' - ' +
                              sbDatosPeriodo.Panels[1].Text + ' - ' +
                              sbDatosPeriodo.Panels[2].Text;
      if not(edFechaAprobDesde.IsEmpty) and not(edFechaAprobHasta.IsEmpty) then
        qrlSeleccion.Caption := 'Liquidaciones aprobadas entre ' + DateToStr(edFechaAprobDesde.Date) + ' y ' +
                                                                   DateToStr(edFechaAprobHasta.Date)
      else
        qrlSeleccion.Caption := '';
      qrlUsuario.Caption := Sesion.Usuario;
      sdqConsulta.DisableControls;
      Visualizar(qrGrilla, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
    finally
      sdqConsulta.EnableControls;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbExportar2Click(Sender: TObject);
begin
  tbExportar2.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuExportarAprobadasClick(Sender: TObject);
var
  TipoListado: TTiposListado;
  sCond, sSqlDetalle, sOrderBy, sSql: String;
begin
  Verificar(edFechaAprobDesde.IsEmpty, edFechaAprobDesde, 'Debe ingresar la fecha de aprobación desde');
  Verificar(edFechaAprobHasta.IsEmpty, edFechaAprobHasta, 'Debe ingresar la fecha de aprobación hasta');
  edAprobadas.Title := 'Liquidaciones aprobadas entre ' + DateToStr(edFechaAprobDesde.Date) + ' y ' +
                                                          DateToStr(edFechaAprobHasta.Date);
  sSql := sdqDetalle1.SQL.Text;

  with sdqDetalle do
  begin
    TipoListado                              := tlAFJPOS_SUSS;
    ParamByName('PeriodoHasta').AsString     := GetPeriodo(edFechaAprobHasta.Date, fpAnioMes);
    ParamByName('FAprobadoDesde').AsDateTime := edFechaAprobDesde.Date;
    ParamByName('FAprobadoHasta').AsDateTime := edFechaAprobHasta.Date;
    ParamByName('TipoListado').AsInteger     := Ord(TipoListado);
    sCond                                    := '(LE_OBRASOCIAL_SUSS = ''S'' OR LE_AFJP_SUSS = ''S'') ';
    sOrderBy                                 := 'CODGRUPO_CONPAGO, NROSINILIQ';
    sSqlDetalle                              := sSql;
    AddCondition(sSqlDetalle, sCond);
    SQL.Text                                 := sSqlDetalle + ' ORDER BY ' + sOrderBy;
    Open;
    if not IsEmpty then
    begin
     edAprobadas.OutputFile                  := 'AFJP-OBRA SOCIAL - SUSS';
     edAprobadas.Execute;
    end;

    Close;
    TipoListado                              := tlAFJP_NOSUSS;
    ParamByName('TipoListado').AsInteger     := Ord(TipoListado);
    sCond                                    := 'LE_AFJP IS NOT NULL AND LE_AFJP_SUSS <> ''S'' ';
    sOrderBy                                 := 'CODGRUPO_AFJP, CODGRUPO_CONPAGO, NROSINILIQ';
    sSqlDetalle                              := sSql;
    AddCondition(sSqlDetalle, sCond);
    SQL.Text                                 := sSqlDetalle + ' ORDER BY ' + sOrderBy;
    Open;
    if not IsEmpty then
    begin
     edAprobadas.OutputFile                  := 'AFJP - NO SUSS';
     edAprobadas.Execute;
    end;

    Close;
    TipoListado                              := tlOS_NOSUSS;
    ParamByName('TipoListado').AsInteger     := Ord(TipoListado);
    sCond                                    := 'LE_OBRASOCIAL_SUSS <> ''S'' ';
    sOrderBy                                 := 'CODGRUPO_OS, CODGRUPO_CONPAGO, NROSINILIQ';
    sSqlDetalle                              := sSql;
    AddCondition(sSqlDetalle, sCond);
    SQL.Text                                 := sSqlDetalle + ' ORDER BY ' + sOrderBy;

    Open;
    if not IsEmpty then
    begin
     edAprobadas.OutputFile                  := 'OS - NO SUSS';
     edAprobadas.Execute;
    end;
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuExportarGrillaClick(Sender: TObject);
begin
  if HayRegistros then tbExportarClick(Sender);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.fraMotivoABMOnChange(Sender: TObject);
begin
  lblSiguiente.Visible := (ModoABM = maBaja) and
                          (fraMotivoABM.sdqDatos.FieldByName('ma_periodosiguiente').AsString = 'S');
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbFechaPagoClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not bPerGenerado, Nil, 'El periodo seleccionado no ha sido generado.');
  Verificar(not bPerCerrado, Nil, 'El periodo seleccionado aún no ha sido cerrado.');
  Verificar(not bPerDefinitivo, Nil, 'El periodo seleccionado no ha sido cerrado definitivamente.');
  lblPeriodo.Caption := 'Periodo ' + ppPerFiltro.Periodo.Valor + ' (' +
                        IIF(rbSuss.Checked, rbSuss.Caption, rbNoSuss.Caption) + '):';
  if (fpFechaPago.ShowModal = mrOk) then
  try
    sSql := 'UPDATE sin.spa_periodosaportes ' +
              ' SET pa_usupago = ' + SqlValue(Sesion.UserID) + ',' +
                  ' pa_fechapago = ' + SqlDate(dFechaPago.Date) +
            ' WHERE pa_id = ' + SqlInt(IdPeriodo);
    EjecutarSql(sSql);
    DoCargarDatosPeriodo;
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar generar el archivo.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.btnAceptarPagoClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(dFechaPago.IsEmpty, dFechaPago, 'Debe ingresar la fecha.');
  sSql := 'SELECT TRUNC(pa_fechadefinitivo) fdef ' +
           ' FROM sin.spa_periodosaportes ' +
          ' WHERE pa_id = :idperiodo ';
  Verificar(dFechaPago.Date < ValorSqlDateTimeEx(sSql, [IdPeriodo]),
            dFechaPago, 'La fecha de pago no puede ser anterior a la de generación del archivo.');
  fpFechaPago.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuExportarDetallePorCuilClick(Sender: TObject);
begin
  DoImpExpDetallePorCUIL(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuImprimirDetallePorCuilClick(Sender: TObject);
begin
  DoImpExpDetallePorCUIL(True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.DoImpExpDetallePorCUIL(bImprimir :Boolean);
begin
  with sdqPorCuil do
  try
    ParamByName('idperiodo').AsInteger := IdPeriodo;
    Open;
    if Eof then
      MsgBox('No se han producido resultados para ' + IIF(bImprimir, 'imprimir', 'exportar') + '.', MB_ICONINFORMATION)
    else if bImprimir then
      try
        qrlPeriodo.Caption    := sbDatosPeriodo.Panels[0].Text;
        qrlUsuarioImp.Caption := Sesion.Usuario;
        DisableControls;
        Visualizar(qrDetallePorCuil, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
      finally
        EnableControls;
      end
    else begin
      edPorCuil.Title := 'Detalle por CUIL - ' + sbDatosPeriodo.Panels[0].Text;
      edPorCuil.Execute;
    end;
  finally
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbVerDuplicadosClick(Sender: TObject);
begin
  Verificar(not bPerGenerado, Nil, 'El periodo seleccionado no ha sido generado.');
  Verificar(bPerCerrado, Nil, 'El periodo seleccionado ya ha sido cerrado.');
  Verificar(bPerDefinitivo, Nil, 'El periodo seleccionado ha sido cerrado definitivamente.');
  Verificar(bPerPagado, Nil, 'El periodo seleccionado ha sido pagado.');
  with sdqDuplicados do
  try
    ParamByName('idperiodo').AsInteger := IdPeriodo;
    Open;
    fpDuplicados.ShowModal;
  finally
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbVerMixtosClick(Sender: TObject);
begin
  Verificar(not bPerGenerado, Nil, 'El periodo seleccionado no ha sido generado.');
  Verificar(bPerCerrado, Nil, 'El periodo seleccionado ya ha sido cerrado.');
  Verificar(bPerDefinitivo, Nil, 'El periodo seleccionado ha sido cerrado definitivamente.');
  Verificar(bPerPagado, Nil, 'El periodo seleccionado ha sido pagado.');
  with sdqMixtos do
  try
    ParamByName('periodo').AsString   := ppPerFiltro.Periodo.Valor;
    ParamByName('tiposuss').AsString  := IIF(rbSuss.Checked, 'S', 'N');
    Open;
    bRefrescar := False;
    fpMixtos.ShowModal;
    if bRefrescar then
      sdqConsulta.Refresh;
  finally
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.btnIncluirMixClick(Sender: TObject);
var
  sSql, sExisteEnPerAnt: String;
begin
  if sdqMixtos.Active and not(sdqMixtos.IsEmpty) and
     MsgAsk('¿Confirma la inclusión del Siniestro ' + sdqMixtos.FieldByName('siniestro').AsString +
            ' - Liquidación ' + sdqMixtos.FieldByName('ac_numliqui').AsString + ' en el periodo actual?') then
  try

    sExisteEnPerAnt := ValorSqlEx('SELECT dinerarias.get_existeenperiodoant(TO_DATE(''01/' + ppPerFiltro.Periodo.Valor + ''', ''dd/mm/yyyy''), ' +        // Por Plan Ap y Cont.
                                        ' :siniestro, :orden, :recaida, :tiposuss, :conpago) ' +
                                   ' FROM dual ',
                                   [sdqMixtos.FieldByName('le_siniestro').AsInteger, sdqMixtos.FieldByName('le_orden').AsInteger, sdqMixtos.FieldByName('le_recaida').AsInteger,
                                    IIF(rbSuss.Checked, 'S', 'N'), sdqMixtos.FieldByName('LE_CONPAGO').AsInteger]);


    sSql := ' INSERT INTO SIN.sac_aportesycontribuciones ' +
            '(ac_siniestro, ac_orden, ac_recaida, ac_numliqui, ac_idperiodo, ac_codigoos, ' +
            ' ac_tipoos, ac_codigoafjp, ac_tipoafjp, ac_idzonaafip, ac_usualta, ac_fechaalta, ' +
            ' ac_condicionafip, ac_porcentajecont, ac_noremunerativo, ac_existeenperiodoant) ' +
            ' SELECT ac_siniestro, ac_orden, ac_recaida, ac_numliqui, ' + SqlInt(IdPeriodo) + ', ac_codigoos, ' +
                   ' ac_tipoos, ac_codigoafjp, ac_tipoafjp, ac_idzonaafip, ' + SqlValue(Sesion.UserID) + ',' +
                   ' SysDate, ac_condicionafip, ac_porcentajecont, ac_noremunerativo, ' + SqlValue(sExisteEnPerAnt) +
              ' FROM SIN.sac_aportesycontribuciones ' +
             ' WHERE ac_id = ' + SqlInt(sdqMixtos.FieldByName('ac_id').AsInteger);
    EjecutarSql(sSql);
    sdqMixtos.Refresh;
    bRefrescar := True;
    MsgBox('Se ha incluido el caso con éxito en el periodo actual.', MB_ICONINFORMATION);
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar incluir el caso.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbVerCompensablesClick(Sender: TObject);
begin
  tbVerCompensables.CheckMenuDropdown;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.btnCompensarClick(Sender: TObject);
var sTipoRem: string;
begin
  if (btnCompensar.Caption = 'Compensar Rem.') then
    sTipoRem := 'R'
  else
    sTipoRem := 'N';

  if sdqCompensables.Active and not(sdqCompensables.IsEmpty) and
     MsgAsk('¿Confirma la compensación del Siniestro ' + sdqCompensables.FieldByName('siniestro').AsString +
            ' - Liquidación ' + sdqCompensables.FieldByName('ac_numliqui').AsString + ' con su/s negativa/s del periodo?') then
  try
    EjecutarStoreEx('art.dinerarias.do_compensarapycon(:idcaso, :usuario, :tipoRem);',
                    [sdqCompensables.FieldByName('ac_id').AsInteger, Sesion.UserID, sTipoRem]);
    sdqCompensables.Refresh;
    bRefrescar := True;
    MsgBox('Se ha compensado el caso con éxito en el periodo actual.', MB_ICONINFORMATION);
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar compensar el caso.');
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbNoIncluidosClick(Sender: TObject);
begin
  Verificar(not bPerGenerado, Nil, 'El periodo seleccionado no ha sido generado.');
  Verificar(bPerCerrado, Nil, 'El periodo seleccionado ya ha sido cerrado.');
  Verificar(bPerDefinitivo, Nil, 'El periodo seleccionado ha sido cerrado definitivamente.');
  Verificar(bPerPagado, Nil, 'El periodo seleccionado ha sido pagado.');
  with sdqNoIncluidos do
  try
    ParamByName('periodo').AsDate     := ValorSqlDateTime('SELECT TO_DATE(''01/' + ppPerFiltro.Periodo.Valor + ''', ''dd/mm/yyyy'') FROM DUAL');
    ParamByName('tiposuss').AsString  := IIF(rbSuss.Checked, 'S', 'N');
    Open;
    bRefrescar := False;

    FRegistrosSeleccionados := TStringList.Create;
    FRegistrosSeleccionados.Clear;
    fpAlta.ShowModal;
    if bRefrescar then
      sdqConsulta.Refresh;
  finally
    Close;
    FRegistrosSeleccionados.Free;
  end;
end;
{-------------------------------------------------------------------------------}
{procedure TfrmListAportesContribuciones.btnIncluirPeriodoClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqNoIncluidos.Active and not(sdqNoIncluidos.IsEmpty) and
     MsgAsk('¿Confirma la inclusión de Siniestro ' + sdqNoIncluidos.FieldByName('siniestro').AsString +
            ' - Liquidación ' + sdqNoIncluidos.FieldByName('le_numliqui').AsString + ' en el periodo actual?') then
  with sdqNoIncluidos do
  try
    sSql := ' INSERT INTO SIN.sac_aportesycontribuciones ' +
            '(ac_siniestro, ac_orden, ac_recaida, ac_numliqui, ac_idperiodo, ac_codigoos, ' +
            ' ac_tipoos, ac_codigoafjp, ac_tipoafjp, ac_idzonaafip, ac_usualta, ac_fechaalta, ' +
            ' ac_condicionafip, ac_porcentajecont) VALUES (' +
            SqlInt(FieldByName('le_siniestro').AsInteger) + ',' + SqlInt(FieldByName('le_orden').AsInteger) + ',' +
            SqlInt(FieldByName('le_recaida').AsInteger) + ',' +  SqlInt(FieldByName('le_numliqui').AsInteger) + ',' +
            SqlInt(IdPeriodo) + ',' + SqlValue(FieldByName('le_obrasocial').AsString) + ',' +
            SqlValue(FieldByName('le_obrasocial_suss').AsString) + ',' + SqlValue(FieldByName('le_afjp').AsString) + ',' +
            SqlValue(FieldByName('le_afjp_suss').AsString) + ',' + SqlInt(FieldByName('cb_idzonaafip').AsInteger) + ',' +
            SqlValue(Sesion.UserID) + ', SysDate, ' +
            SqlInt(FieldByName('cb_condicionafip').AsInteger) + ',' + SqlNumber(FieldByName('le_paporemp').AsFloat) + ')';
    EjecutarSql(sSql);
    sdqNoIncluidos.Refresh;
    bRefrescar := True;
    MsgBox('Se ha incluido el caso con éxito en el periodo actual.', MB_ICONINFORMATION);
  except
    on E:Exception do ErrorMsg(E, 'Error al intentar incluir el caso.');
  end;
end;      }
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.btnIncluirPeriodoClick(Sender: TObject);
var sSql, sExisteEnPerAnt: String;
    i: integer; topeaporte: extended;
begin
  Verificar(ppPerFiltro.Periodo.IsNull, ppPerFiltro, 'Debe seleccionar un periodo.');

  if sdqNoIncluidos.Active and not(sdqNoIncluidos.IsEmpty) and (FRegistrosSeleccionados.Count > 0) and
     MsgAsk('¿Confirma la inclusión de los ' + IntToStr(FRegistrosSeleccionados.Count) + ' Siniestro/s en el periodo actual?') then
  try

    BeginTrans;
    for i := 0 to (FRegistrosSeleccionados.Count - 1) do
    begin
      sdqNoIncluidos.Locate('ID', FRegistrosSeleccionados[i], []);

      with sdqNoIncluidos do
      begin

        topeaporte := valorsqlex('select siniestro.get_montoampo(TO_CHAR(LAST_DAY(:periodo), ''YYYYMM''), ''CS'') from dual', ['01/' + ppPerFiltro.Text]);
        //if FieldByName('le_subtotal').AsFloat > topeaporte then


        sExisteEnPerAnt := ValorSqlEx('SELECT dinerarias.get_existeenperiodoant(TO_DATE(''01/' + ppPerFiltro.Periodo.Valor + ''', ''dd/mm/yyyy''), ' +        // Por Plan Ap y Cont.
                                                                             ' :siniestro, :orden, :recaida, :tiposuss, :conpago) ' +
                                       ' FROM dual ',
                                      [FieldByName('le_siniestro').AsInteger, FieldByName('le_orden').AsInteger, FieldByName('le_recaida').AsInteger,
                                       IIF(rbSuss.Checked, 'S', 'N'), sdqNoIncluidos.FieldByName('LE_CONPAGO').AsInteger]);

        sSql := ' INSERT INTO SIN.sac_aportesycontribuciones ' +
                '(ac_siniestro, ac_orden, ac_recaida, ac_numliqui, ac_idperiodo, ac_codigoos, ' +
                ' ac_tipoos, ac_codigoafjp, ac_tipoafjp, ac_idzonaafip, ac_usualta, ac_fechaalta, ' +
                ' ac_condicionafip, ac_porcentajecont, ac_noremunerativo, ac_existeenperiodoant, ac_remuneracionreal) VALUES (' +
                SqlInt(FieldByName('le_siniestro').AsInteger) + ',' + SqlInt(FieldByName('le_orden').AsInteger)   + ',' +
                SqlInt(FieldByName('le_recaida').AsInteger) + ',' +  SqlInt(FieldByName('le_numliqui').AsInteger) + ',' +
                SqlInt(IdPeriodo) + ',' + SqlValue(FieldByName('le_obrasocial').AsString) + ',' +
                SqlValue(FieldByName('le_obrasocial_suss').AsString) + ',' + SqlValue(FieldByName('le_afjp').AsString) + ',' +
                SqlValue(FieldByName('le_afjp_suss').AsString) + ',' + SqlInt(FieldByName('cb_idzonaafip').AsInteger)  + ',' +
                SqlValue(Sesion.UserID) + ', SysDate, ' +
                SqlInt(FieldByName('cb_condicionafip').AsInteger) + ',' + SqlNumber(FieldByName('le_paporemp').AsFloat) + ',' +
                SqlNumber(FieldByName('le_subtotalnorem').AsFloat) + ',' + SqlValue(sExisteEnPerAnt) + ',' +
                iif(FieldByName('le_subtotal').AsFloat > topeaporte, SqlNumber(topeaporte), SqlValue('')) + ')';
      end;
      EjecutarSqlST(sSql);
    end;

    CommitTrans;
    sdqNoIncluidos.Refresh;
    bRefrescar := True;
    MsgBox('Se ha incluido el/los caso/s con éxito en el periodo actual.', MB_ICONINFORMATION);

  except
    on E:Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al intentar incluir los casos.');
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.DoImpExpResumenNoSuss(bImprimir, bObraSocial:Boolean);
var
  sSql: String;
begin
  Verificar(rbSuss.Checked, gbTipoLiquidacion, 'Debe seleccionar un periodo No Suss.');
  sSql := IIF(bObraSocial, 'SELECT ac_codigoos codigo, os_descripcion organismo, ',
                           'SELECT ac_codigoafjp codigo, ju_nombre organismo, ');
  sSql := sSql + sdqResumenNoSussAux.SQL.Text;

  if bObraSocial then
    sSql := sSql + ' AND os_tipo = ''N'') '
  else
    sSql := sSql + ' AND ju_tipo = ''N'') ';

  sSql := sSql + IIF(bObraSocial, ' GROUP BY ac_codigoos, os_descripcion ORDER BY os_descripcion ',
                                  ' GROUP BY ac_codigoafjp, ju_nombre ORDER BY ju_nombre ');

  with sdqResumenNoSuss do
  try
    SQL.Text := sSql;
    ParamByName('idperiodo').AsInteger := IdPeriodo;
    Open;
    if Eof then
      MsgBox('No se han producido resultados para ' + IIF(bImprimir, 'imprimir', 'exportar') + '.', MB_ICONINFORMATION)
    else begin
      qrlPeriodoNoSuss.Caption    := 'Periodo: ' + ppPerFiltro.Periodo.Valor +
                                 IIF(bObraSocial, ' - Obra social', ' - Sistema previsional');

      Do_VisualizarColumnas_ResumenNoSuss(bImprimir, bObraSocial);   // TK 32294 Plan

      if bImprimir then
      begin
        try
          qrlUsuarioImpNoSuss.Caption := Sesion.Usuario;
          DisableControls;
          Visualizar(qrResumenNoSuss, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
        finally
          EnableControls;
        end
      end
      else begin
        edResumenNoSuss.Title := qrlTitResumenNoSuss.Caption + ' - ' + qrlPeriodoNoSuss.Caption;
        edResumenNoSuss.Execute;
      end;
    end;
  finally
    Close;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbMostrarOcultarColumnasClick(Sender: TObject);
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor   := crHourGlass;
    Grid.FooterBand := tbMostrarOcultarColumnas.Down;
    try
      if sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, Totales);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.GridPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLSUMA) then
    Value := Get_AjusteDecimales(FloatToStr(Totales[iPos]), '$');
  inherited;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.tbPagarImponibleClick(Sender: TObject);
var iIdReg: integer;
begin
  Verificar(not HayRegistroActivo, Nil, 'Debe seleccionar un registro válido para realizar esta acción.');
  iIdReg := sdqConsulta.FieldByName('ac_id').AsInteger;

  if (sdqConsulta.FieldByName('ac_pagarimponible').AsString <> 'S') then       // AC_PAGARIMPONIBLE esta en  N o null
  begin
    if MsgAsk('Mediante esta acción, la Remuneración Real tomará el valor de la Remuneración Imponible. ¿Desea continuar?') then
    begin
      Try
        BeginTrans;
        Do_UpdatePagarImponible(iIdReg, True);
        Do_UpdateRemuReal(iIdReg, True);
        CommitTrans;
        tbRefrescarClick(Nil);
      except
        on E:Exception do
        begin
          ErrorMsg(E, 'Error al intentar modificar los datos.');
          Rollback;
        end;
      end;
    end;
  end

  else  // AC_PAGARIMPONIBLE esta en  S
    if MsgAsk('Mediante esta acción, la Remuneración Real tomará el valor de la Remuneración Real histórica anterior. ¿Desea continuar?') then
    begin
      Try
        BeginTrans;
        Do_UpdatePagarImponible(iIdReg, False);
        Do_UpdateRemuReal(iIdReg, False);
        CommitTrans;
        tbRefrescarClick(Nil);
      except
        on E:Exception do
        begin
          ErrorMsg(E, 'Error al intentar modificar los datos.');
          Rollback;
        end;
      end;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.Do_UpdatePagarImponible(var iIdReg: integer; bPagarImponible: boolean);        // Plan
var sSql, sPagar, sqlRemu: string;
begin
  if bPagarImponible then
  begin
    sPagar  := 'S';
    sqlRemu :=  ' ,ac_remuneracionreal_hist = ' + SqlNumber(sdqConsulta.FieldByName('REMUNERA').AsCurrency);
  end
  else begin
    sPagar  := 'N';
    sqlRemu := '';
  end;

  sSql := 'UPDATE sin.sac_aportesycontribuciones ' +
              ' SET ac_pagarimponible = ' + SqlValue(sPagar) + sqlRemu +
           '  WHERE ac_id = ' + SqlInt(iIdReg);
  EjecutarSqlST(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.Do_UpdateRemuReal(var iIdReg: integer; bPagarImponible: boolean);       // Plan
var sSql, sSqlSET: string;
begin
    if bPagarImponible then
      sSqlSET := ' SET ac_remuneracionreal =(SELECT le_subtotal from sle_liquiempsin ' +
                                           ' WHERE le_siniestro = ac_siniestro  ' +
                                             ' AND le_orden = ac_orden  ' +
                                             ' AND le_recaida = ac_recaida ' +
                                             ' AND le_numliqui = ac_numliqui) '
    else
      sSqlSET := ' SET ac_remuneracionreal = ac_remuneracionreal_hist ';

    sSql := 'UPDATE sin.sac_aportesycontribuciones ' +  sSqlSET +
            ' WHERE ac_id = ' + SqlInt(iIdReg);

    EjecutarSqlST(sSql);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.MnuImpResumenObraSocialClick(Sender: TObject);
begin
  DoImpExpResumenNoSuss(True, True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuImpResumenSistPrevClick(Sender: TObject);
begin
  DoImpExpResumenNoSuss(True, False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.btnAceptarDetClick(Sender: TObject);          // TK 32294 Plan
begin
  Verificar(ppPerDesde.Periodo.IsNull, ppPerDesde, 'Debe seleccionar un Periodo Desde');
  Verificar(ppPerHasta.Periodo.IsNull, ppPerHasta, 'Debe seleccionar un Periodo Hasta');
  Verificar(fraOrganismoOS.Enabled and fraOrganismoOS.IsEmpty, fraOrganismoOS, 'Debe completar un Organismo');
  Verificar(fraOrganismoSistPrev.Enabled and fraOrganismoSistPrev.IsEmpty, fraOrganismoSistPrev, 'Debe completar un Organismo');
  Verificar(rbPorOrganismo.Enabled and (not rbPorOrganismo.Checked and not rbPorMunicipio.Checked), rbPorOrganismo, 'Debe seleccionar una de las dos Opciones');

  fpImpDetalleApYContNoSuss.ModalResult := mrOk;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.MnuImpDetalleObraSocialClick(Sender: TObject);   // TK 32294 Plan   No Suss
begin
  Verificar(rbSuss.Checked, gbTipoLiquidacion, 'Debe seleccionar un periodo No Suss.');
  Do_HabilitarComboOrganismo(OBRASOCIAL);
  lblTema.Caption := OBRASOCIAL;
  if (fpImpDetalleApYContNoSuss.ShowModal = mrOk) then
    Do_GenerarListadoNoSussDetalle(true);

end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuImpDetalleSistPrevClick(Sender: TObject);   // TK 32294 Plan No Suss
begin
  Verificar(rbSuss.Checked, gbTipoLiquidacion, 'Debe seleccionar un periodo No Suss.');
  Do_HabilitarComboOrganismo(SISTPREV);
  lblTema.Caption := SISTPREV;
  if (fpImpDetalleApYContNoSuss.ShowModal = mrOk) then
    Do_GenerarListadoNoSussDetalle(true);
end;
{-------------------------------------------------------------------------------}      // TK 32294 Plan No Suss
procedure TfrmListAportesContribuciones.mnuExpDetalleOSClick(Sender: TObject);
begin
  Verificar(rbSuss.Checked, gbTipoLiquidacion, 'Debe seleccionar un periodo No Suss.');
  Do_HabilitarComboOrganismo(OBRASOCIAL);
  lblTema.Caption := OBRASOCIAL;
  if (fpImpDetalleApYContNoSuss.ShowModal = mrOk) then
    Do_GenerarListadoNoSussDetalle(false);
end;
{-------------------------------------------------------------------------------}      // TK 32294 Plan No Suss
procedure TfrmListAportesContribuciones.mnuExpDetalleSistPrevClick(Sender: TObject);
begin
  Verificar(rbSuss.Checked, gbTipoLiquidacion, 'Debe seleccionar un periodo No Suss.');
  Do_HabilitarComboOrganismo(SISTPREV);
  lblTema.Caption := SISTPREV;
  if (fpImpDetalleApYContNoSuss.ShowModal = mrOk) then
    Do_GenerarListadoNoSussDetalle(false);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.Do_HabilitarComboOrganismo(sTipo: string);   // TK 32294 Plan
begin
  if (sTipo = OBRASOCIAL) then
  begin
    fraOrganismoOS.Visible       := True;
    fraOrganismoOS.Enabled       := True;
    fraOrganismoSistPrev.Visible := False;
    fraOrganismoSistPrev.Enabled := False;
  end
  else if (sTipo = SISTPREV) then
  begin
    fraOrganismoOS.Visible       := False;
    fraOrganismoOS.Enabled       := False;
    fraOrganismoSistPrev.Visible := True;
    fraOrganismoSistPrev.Enabled := True;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.OnOrganismosOSChange(Sender: TObject);         // TK 32294 - Plan
begin
  if ValorSqlEx('SELECT os_selmunorg FROM art.cos_osocial ' +
                ' WHERE os_codigo = :codigo', [fraOrganismoOS.Codigo]) = 'S' then
    Do_HabilitarRadioButtons_OrgMun(True)
  else
    Do_HabilitarRadioButtons_OrgMun(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.OnOrganismosSistPrevChange(Sender: TObject);   // TK 32294 - Plan
begin
  if ValorSqlEx('SELECT ju_selmunorg FROM art.sju_jubilacion ' +
                ' WHERE ju_codigo = :codigo', [fraOrganismoSistPrev.Codigo]) = 'S' then
    Do_HabilitarRadioButtons_OrgMun(True)
  else
    Do_HabilitarRadioButtons_OrgMun(False);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.Do_HabilitarRadioButtons_OrgMun(bHabilita:boolean);    // TK 32294 - Plan
begin
  rbPorOrganismo.Enabled := bHabilita;
  rbPorMunicipio.Enabled := bHabilita;
  if not bHabilita then
  begin
    rbPorOrganismo.Checked := False;
    rbPorMunicipio.Checked := False;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.fpImpDetalleApYContNoSussBeforeShow(Sender: TObject);    // TK 32294 - Plan
begin
  Do_LimpiarFpDetalleApYContNoSuss;
  ppPerDesde.Periodo.Valor := ppPerFiltro.Periodo.Valor;
  ppPerHasta.Periodo.Valor := ppPerFiltro.Periodo.Valor;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.Do_LimpiarFpDetalleApYContNoSuss;           // TK 32294 - Plan
begin
  ppPerDesde.Clear;
  ppPerHasta.Clear;
  fraOrganismoSistPrev.Clear;
  fraOrganismoOS.Clear;
  rbPorOrganismo.Checked := False;
  rbPorMunicipio.Checked := False;
  rbPorOrganismo.Enabled := False;
  rbPorMunicipio.Enabled := False;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.Do_GenerarListadoNoSussDetalle(bImprimir :Boolean);            // TK 32294 - Plan
var sSql, sSqlSelect, sSqlSelectGlobal, sSqlFrom, sSqlWhere, sSqlWhereGlobal: string;
begin
  if lblTema.Caption = OBRASOCIAL then   // Obra social
  begin
    sSqlSelectGlobal := ' (ROUND(remunera, 2)) remunreal, ROUND(paporos,2) Porcent_Ret, ' +
                        ' (ROUND(remunera * paporos / 100, 2)) ret, pcont, (ROUND(remunera * pcont / 100, 2)) cont, sector ';
    sSqlSelect := 'SELECT art.iif_compara(''='', pa_tiposuss, os_tipo, le_ptanssal, 0) ' +
                      ' + art.iif_compara(''='', pa_tiposuss, os_tipo, le_ptosocial, 0) paporos, ' +
                        ' art.iif_compara(''='', pa_tiposuss, os_tipo, le_peanssal, 0) ' +
                      ' + art.iif_compara(''='', pa_tiposuss, os_tipo, le_peosocial, 0) pcont, ' +
                        ' ac_codigoos, os_descripcion, ';
    sSqlFrom   := ' art.cos_osocial, ';
    sSqlWhere  := ' AND ac_codigoos = os_codigo(+) ';
    sSqlWhereGlobal := ' AND ac_codigoos = ' + SqlValue(fraOrganismoOS.Codigo);
  end
  else                                  // Sistema Previsional
  begin
     sSqlSelectGlobal := ' (ROUND(remunera, 2)) remunreal, ROUND(paporjub,2) Porcent_Ret, ' +
                         ' (ROUND(remunera * paporjub / 100, 2)) ret, pcont, (ROUND(remunera * pcont / 100, 2)) cont, sector ';
     sSqlSelect := 'SELECT art.iif_compara(''='', pa_tiposuss, ju_tipo, le_ptjubila, 0) ' +
                       ' + art.iif_compara(''='', pa_tiposuss, ju_tipo, le_ptinssjp, 0) paporjub, ' +
                         ' art.iif_compara(''='', pa_tiposuss, ju_tipo, le_pejubila, 0) ' +
                       ' + art.iif_compara(''='', pa_tiposuss, ju_tipo, le_peinssjp, 0) ' +
                       ' + art.iif_compara(''='', pa_tiposuss, ju_tipo, le_pefnempleo, 0) ' +
                       ' + art.iif_compara(''='', pa_tiposuss, ju_tipo, le_pesfamiliar, 0) pcont, ' +
                         ' ac_codigoafjp, ju_nombre, ';
     sSqlFrom   := ' art.sju_jubilacion, ';
     sSqlWhere  := ' AND ac_codigoafjp = ju_codigo(+) ';
     sSqlWhereGlobal := ' AND ac_codigoAFJP = ' + SqlValue(fraOrganismoSistPrev.Codigo);
  end;


  sSql:= 'SELECT SiniestroLiq, cuit, empresa, fecDesde, fecHasta, cuil, trabajador, ConceptoPago, ' +
                sSqlSelectGlobal +
          ' FROM (' + sSqlSelect +
                     ' NVL(ac_remuneracionreal, GREATEST(le_subtotal, art.siniestro.get_montoampo(TO_CHAR(pa_periodo, ''YYYYMM''), ''M'') ' +
                   ' * art.iif_compara(''='', le_diasaplica, 0, art.dinerarias.get_diaspormes(ex_fechaaccidente), le_diasaplica) / art.dinerarias.get_diaspormes(ex_fechaaccidente))) remunera, ' +
                     ' art.utiles.armar_siniestro(le_siniestro,le_orden,le_recaida)||'' - ''|| LPAD(le_numliqui, 3, ''0'') SiniestroLiq, ' +
                     ' em_cuit cuit, em_nombre empresa, tj_cuil cuil, tj_nombre trabajador, cp_denpago ConceptoPago, ' +
                     ' le_fechaDes fecDesde, le_fechaHas fecHasta, em_sector sector ' +
                ' FROM SIN.sac_aportesycontribuciones, SIN.spa_periodosaportes, art.sle_liquiempsin, ' + sSqlFrom +
                     ' art.sex_expedientes, afi.aem_empresa, ctj_trabajador, art.scp_conpago ' +
               ' WHERE le_siniestro = ac_siniestro ' +
                 ' AND le_orden = ac_orden  ' +
                 ' AND le_recaida = ac_recaida ' +
                 ' AND le_numliqui = ac_numliqui ' +
                   sSqlWhere +
                 ' AND ac_idperiodo = pa_id ' +
                 ' AND TO_CHAR(pa_periodo, ''mm/yyyy'') between ' + SqlValue(ppPerDesde.Periodo.Valor) + ' and ' + SqlValue(ppPerHasta.Periodo.Valor) +
                 ' AND pa_tiposuss = ''N'' ' +
                 ' AND pa_fechabaja IS NULL ' +
                 ' AND ac_fechabaja IS NULL ' +
                 ' AND le_siniestro = ex_siniestro ' +
                 ' AND le_orden = ex_orden ' +
                 ' AND le_recaida = ex_recaida ' +
                 ' AND em_cuit = ex_cuit ' +
                 ' AND ex_idtrabajador = tj_id ' +
                 ' AND le_conpago = cp_conpago) ' +
          ' WHERE 1 = 1 ' + sSqlWhereGlobal;

    if rbPorOrganismo.Checked then
      sSql := sSql + ' AND sector <> 2 '
    else if rbPorMunicipio.Checked then
      sSql := sSql + ' AND sector = 2 ';

    sSql := sSql + ' ORDER BY SiniestroLiq ';

    sdqDetalleNoSuss.SQL.Text := sSql;
    sdqDetalleNoSuss.Open;

    if sdqDetalleNoSuss.Eof then
      MsgBox('No se han producido resultados para ' + IIF(bImprimir, 'imprimir', 'exportar') + '.', MB_ICONINFORMATION)
    else if bImprimir then    // Imprimir
      try
        qrlOrganismo.Caption :=  IIF((lblTema.Caption = OBRASOCIAL), fraOrganismoOS.Descripcion, fraOrganismoSistPrev.Descripcion);
        qrlUsuarioDetNoSuss.Caption  := Sesion.Usuario;
        qrlCantEmpresas.Caption := ValorSql(' select count(*) from (' +
                                              ' select distinct cuil from (' + sSql + '))') + ' Trabajadores Listados ';
        if rbPorOrganismo.Checked or rbPorMunicipio.Checked then
          qrlSeleccionNoSuss.Caption := IIF(rbPorOrganismo.Checked, 'Por Organismo', 'Por Municipio') + ' - '
        else
          qrlSeleccionNoSuss.Caption := '';
        qrlSeleccionNoSuss.Caption := qrlSeleccionNoSuss.Caption + 'Desde ' + ppPerDesde.Periodo.Valor + ' Hasta ' + ppPerHasta.Periodo.Valor;

        sdqDetalleNoSuss.DisableControls;
        Visualizar(qrDetalleNoSuss, GetValores(), [oForceDB, oForceShowModal, oAlwaysShowDialog]);
      finally
        sdqDetalleNoSuss.EnableControls;
      end
    else begin    // Exportar
      edDetalleNoSuss.Title := 'Detalle de Aportes y Contribuciones No Suss - ' + sbDatosPeriodo.Panels[0].Text;
      edDetalleNoSuss.Execute;
    end;
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuExpResumenOSClick(Sender: TObject);
begin
  DoImpExpResumenNoSuss(False, True);
end;
{-------------------------------------------------------------------------------}
procedure TfrmListAportesContribuciones.mnuExpResumenSistPrevClick(Sender: TObject);
begin
  DoImpExpResumenNoSuss(False, False);
end;
{-------------------------------------------------------------------------------}    // TK 32294 - Plan
procedure TfrmListAportesContribuciones.Do_VisualizarColumnas_ResumenNoSuss(bImprimir, bObraSocial: Boolean);
begin
  // muestra columnas según el tipo de reporte (por Obra Social o por Sistema Previcional)
  if bImprimir then
  begin
    qrlRetJub.Enabled        := not bObraSocial;
    qrdbRetJub.Enabled       := not bObraSocial;
    qrlContribJubil.Enabled  := not bObraSocial;
    qrdbContribJubil.Enabled := not bObraSocial;
    qreRetJub.Enabled        := not bObraSocial;
    qreContribJubil.Enabled  := not bObraSocial;
    qrlRetOs.Enabled         := bObraSocial;
    qrdbRetOS.Enabled        := bObraSocial;
    qrlContribOS.Enabled     := bObraSocial;
    qrdbContribOS.Enabled    := bObraSocial;
    qreRetOS.Enabled         := bObraSocial;
    qreContribOS.Enabled     := bObraSocial;
  end;
  // si no es Imprimir no hago nada, ya que en el caso de Exportar lo dejo igual.
end;

procedure TfrmListAportesContribuciones.dbgNoIncluidosCellClick(Column: TColumn);
begin
  if HayRegistroActivo and (UpperCase(Column.FieldName) = 'CHECKBOX') then
  begin
    if FRegistrosSeleccionados.IndexOf(sdqNoIncluidos.FieldByName('ID').AsString) > -1 then
      FRegistrosSeleccionados.Delete(FRegistrosSeleccionados.IndexOf(sdqNoIncluidos.FieldByName('ID').AsString))
    else
      FRegistrosSeleccionados.Add(sdqNoIncluidos.FieldByName('ID').AsString);
    dbgNoIncluidos.Repaint;
  end;
end;

procedure TfrmListAportesContribuciones.dbgNoIncluidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if UpperCase(Column.FieldName) = 'CHECKBOX' then
  begin
    dbgNoIncluidos.Canvas.FillRect(Rect);
    Check := 0;

    if FRegistrosSeleccionados.IndexOf(sdqNoIncluidos.FieldByName('ID').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(dbgNoIncluidos.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmListAportesContribuciones.dbgNoIncluidosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if FRegistrosSeleccionados.IndexOf(sdqNoIncluidos.FieldByName('ID').AsString) > -1 then
    BackGround := TColor($C0DCC0);//clMoneyGreen
end;

procedure TfrmListAportesContribuciones.tbMarcarClick(Sender: TObject);
begin
  if tbMarcar.Down then
  begin
    tbMarcar.Hint := 'Desmarcar Todos';
    tbMarcar.ImageIndex := 39;
    Do_MarcarTodos;
  end
  else begin
    tbMarcar.Hint := 'Marcar Todos';
    tbMarcar.ImageIndex := 57;
    Do_DesmarcarTodos;
  end;
end;

procedure TfrmListAportesContribuciones.Do_DesmarcarTodos;
begin
  FRegistrosSeleccionados.Clear;
  dbgNoIncluidos.Repaint;
end;

procedure TfrmListAportesContribuciones.Do_MarcarTodos;
var
  AMetodo: TDataSetNotifyEvent;
  APointer: TBookMark;
begin
  AMetodo := sdqNoIncluidos.AfterScroll;
  sdqNoIncluidos.AfterScroll := nil;
  APointer := sdqNoIncluidos.GetBookmark;

  FRegistrosSeleccionados.Clear;
  Screen.Cursor := crSQLWait;

  with sdqNoIncluidos do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      FRegistrosSeleccionados.Add(FieldByName('ID').AsString);
      Next;
    end;
  finally
    AfterScroll := AMetodo;
    GotoBookmark(APointer);
    EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmListAportesContribuciones.mnuCompensRemClick(Sender: TObject);
begin
  Do_CompensablesClick('R');
end;

procedure TfrmListAportesContribuciones.mnuCompensNoRemClick(Sender: TObject);
begin
  Do_CompensablesClick('N');
end;

procedure TfrmListAportesContribuciones.Do_GenerarSdqCompensables(sTiporem: string);
var
  sRem, sNoRem: String;
begin
  sRem := 'SELECT art.utiles.armar_siniestro(ac_siniestro, ac_orden, ac_recaida) siniestro, ' +
                ' ac_numliqui, art.utiles.armar_cuit(ex_cuil) cuil, ac_id ' +
           ' FROM SIN.sac_aportesycontribuciones a, art.sle_liquiempsin, art.sex_expedientes ' +
          ' WHERE a.ac_siniestro = le_siniestro ' +
                                ' AND a.ac_siniestro = le_siniestro ' +
                                ' AND a.ac_orden = le_orden ' +
                                ' AND a.ac_recaida = le_recaida ' +
                                ' AND a.ac_numliqui = le_numliqui ' +
                                ' AND ex_siniestro = le_siniestro ' +
                                ' AND ex_orden = le_orden ' +
                                ' AND ex_recaida = le_recaida ' +
                                ' AND le_subtotal > 0 ' +
                                ' AND a.ac_fechabaja IS NULL ' +
                                ' AND a.ac_remuneracionreal IS NULL ' +
                                ' AND a.ac_idperiodo = :idperiodo ' +
                                ' AND EXISTS(SELECT 1 ' +
                                             ' FROM SIN.sac_aportesycontribuciones b, art.sle_liquiempsin ' +
                                            ' WHERE b.ac_siniestro = a.ac_siniestro ' +
                                              ' AND b.ac_orden = a.ac_orden ' +
                                              ' AND b.ac_recaida = a.ac_recaida ' +
                                              ' AND b.ac_numliqui <> a.ac_numliqui ' +
                                              ' AND b.ac_idperiodo = a.ac_idperiodo ' +
                                              ' AND b.ac_siniestro = le_siniestro ' +
                                              ' AND b.ac_siniestro = le_siniestro ' +
                                              ' AND b.ac_orden = le_orden ' +
                                              ' AND b.ac_recaida = le_recaida ' +
                                              ' AND b.ac_numliqui = le_numliqui ' +
                                              ' AND le_subtotal < 0 ' +
                                              ' AND ((b.ac_fechabaja IS NULL) ' +
 			                                         ' OR ((b.ac_fechabaja IS NOT NULL) AND (b.ac_compensonorem = ''S''))) ' +
                                              ' AND NVL(b.ac_compensorem, ''N'') = ''N'') ';

  sNoRem := 'SELECT art.utiles.armar_siniestro(ac_siniestro, ac_orden, ac_recaida) siniestro, ' +
                ' ac_numliqui, art.utiles.armar_cuit(ex_cuil) cuil, ac_id ' +
           ' FROM SIN.sac_aportesycontribuciones a, art.sle_liquiempsin, art.sex_expedientes ' +
          ' WHERE a.ac_siniestro = le_siniestro ' +
                                ' AND a.ac_siniestro = le_siniestro ' +
                                ' AND a.ac_orden = le_orden ' +
                                ' AND a.ac_recaida = le_recaida ' +
                                ' AND a.ac_numliqui = le_numliqui ' +
                                ' AND ex_siniestro = le_siniestro ' +
                                ' AND ex_orden = le_orden ' +
                                ' AND ex_recaida = le_recaida ' +
                                ' AND a.ac_noremunerativo > 0 ' +
                                ' AND a.ac_fechabaja IS NULL ' +
                                ' AND a.ac_idperiodo = :idperiodo ' +
                                ' AND EXISTS(SELECT 1 ' +
                                             ' FROM SIN.sac_aportesycontribuciones b, art.sle_liquiempsin ' +
                                            ' WHERE b.ac_siniestro = a.ac_siniestro ' +
                                              ' AND b.ac_orden = a.ac_orden ' +
                                              ' AND b.ac_recaida = a.ac_recaida ' +
                                              ' AND b.ac_numliqui <> a.ac_numliqui ' +
                                              ' AND b.ac_idperiodo = a.ac_idperiodo ' +
                                              ' AND b.ac_siniestro = le_siniestro ' +
                                              ' AND b.ac_siniestro = le_siniestro ' +
                                              ' AND b.ac_orden = le_orden ' +
                                              ' AND b.ac_recaida = le_recaida ' +
                                              ' AND b.ac_numliqui = le_numliqui ' +
                                              ' AND b.ac_noremunerativo < 0 ' +
                                              ' AND ((b.ac_fechabaja IS NULL) ' +
 			                                         ' OR ((b.ac_fechabaja IS NOT NULL) AND (b.ac_compensorem = ''S''))) ' +
                                              ' AND NVL(b.ac_compensonorem, ''N'') = ''N'') ';

  sdqCompensables.Close;
  if sTiporem = 'R' then
    sdqCompensables.SQL.Text := sRem
  else if sTiporem = 'N' then
    sdqCompensables.SQL.Text := sNoRem
  else
    sdqCompensables.SQL.Text := sRem + ' UNION ALL ' + sNoRem;

end;

procedure TfrmListAportesContribuciones.Do_CompensablesClick(sTipoRem: string);
var sboton, sFormPanel: string;
begin
  Verificar(not bPerGenerado, Nil, 'El periodo seleccionado no ha sido generado.');
  Verificar(bPerCerrado, Nil, 'El periodo seleccionado ya ha sido cerrado.');
  Verificar(bPerDefinitivo, Nil, 'El periodo seleccionado ha sido cerrado definitivamente.');
  Verificar(bPerPagado, Nil, 'El periodo seleccionado ha sido pagado.');

  if (sTipoRem = 'R') then // Remunerativo
  begin
    Do_GenerarSdqCompensables('R'); // Subtotal Remunerativo (adjunto la clausula porque en otra parte necesito que vengan los dos (rem y no rem) y ahi pongo un "or"
    sboton     := 'Compensar Rem.';
    sFormPanel := 'Casos Remunerativos compensables del periodo';
  end
  else
  begin
    Do_GenerarSdqCompensables('N'); // Subtotal No Remunerativo
    sboton     := 'Compensar No Rem.';
    sFormPanel := 'Casos No Remunerativos compensables del periodo';
  end;

  with sdqCompensables do
  try
    ParamByName('idperiodo').AsInteger := IdPeriodo;
    Open;
    bRefrescar := False;
    btnCompensar.Caption   := sboton;
    fpCompensables.Caption := sFormPanel;
    fpCompensables.ShowModal;
    if bRefrescar then
      sdqConsulta.Refresh;
  finally
    Close;
  end;
end;

end.
