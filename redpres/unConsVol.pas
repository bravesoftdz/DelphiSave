unit unConsVol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  artSeguridad, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox, unfraPrestador,
  StdCtrls, ExtCtrls, ImgList, Grids, DBGrids, RXDBCtrl, Db, SDEngine, Placemnt,
  IntEdit, ArtComboBox, QueryPrint, LookupDialog, Menus, SortDlg, ArtDBGrid,
  HotKeyControl, ShortCutControl, CUIT, QueryToFile, ExportDialog, FormPanel,
  CheckCombo, CheckPanel, DBCheckCombo, Buttons, ComboEditor,
  PatternEdit, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, CurrEdit, unArtDbFrame, unFraCodigoDescripcion,
  unfraDelegacion, unfraUsuarios, JvgGroupBox, JvExExtCtrls, JvNetscapeSplitter,
  unVisualizador, DBTables, DBClient, unselecciondestinatarios, RxPlacemnt,
  RxCurrEdit, RxToolEdit;

const
  TEXTO_MAIL = '{\rtf1\ansi\ansicpg1252\deff0\deflang1033\deflangfe3082\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Tahoma;}}' +
               '{\colortbl ;\red0\green0\blue128;}' +
               '{\stylesheet{ Normal;}{\s1 heading 1;}}' +
               '\viewkind4\uc1\pard\cf1\lang3082\f0\fs16 NOTIFICACI\''d3N AUTOM\''c1TICA\par ' +
               '\cf0\par ' +
               'El volante \b %d\b0  ha sido derivado por \b %s\b0 .\par ' +
               'Motivo: \b %s\b0\par ' +
               'Prestador: \b %s %s\par ' +
               '\b0 Fecha de Recepci\''f3n: \b %s\b0\par ' +
               'Fecha de Derivaci\''f3n: \b %s\b0\par ' +
               'Monto: \b %m\b0\par \par ' +
               '\pard\keepn\s1\b Provincia ART\par}';

type
  TTipoSalida = (tsImpresion, tsMail, tsExportacion);

  TfrmConsVol = class(TForm)
    ImageList: TImageList;
    CoolBar: TCoolBar;
    ToolBar1: TToolBar;
    tbRefrescar: TToolButton;
    tbLimpiar: TToolButton;
    tbOcultarMostrar: TToolButton;
    SEP3: TToolButton;
    tbAsignarAuditorVolante: TToolButton;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    pnlFiltros: TPanel;
    tbImprimir: TToolButton;
    tbDetalles: TToolButton;
    pMnuImpresiones: TPopupMenu;
    mnuImpResultados: TMenuItem;
    N1: TMenuItem;
    mnuImpVolante: TMenuItem;
    mnuImpNotaDebito: TMenuItem;
    mnuImpDetalle: TMenuItem;
    QueryPrint: TQueryPrint;
    tbOrden: TToolButton;
    SortDialog: TSortDialog;
    tbCancelar: TToolButton;
    SEP4: TToolButton;
    dbgListado: TArtDBGrid;
    tbTotales: TToolButton;
    tbTotPorEstado: TToolButton;
    ludTotPorEstado: TLookupDialog;
    sdqTotPorEstado: TSDQuery;
    dsTotPorEstado: TDataSource;
    ShortCutControl: TShortCutControl;
    tbDesAprobar: TToolButton;
    tbReasignarAudit: TToolButton;
    tbCtaCte: TToolButton;
    N2: TMenuItem;
    mnuImpResMontosySaldos: TMenuItem;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    mnuImpTodasNotaDebito: TMenuItem;
    tbExportar: TToolButton;
    ExportDialog: TExportDialog;
    tbVerTemporarios: TToolButton;
    tbPasarTemporarios: TToolButton;
    pMnuTmp: TPopupMenu;
    mnuTmpPasarSeleccion: TMenuItem;
    mnuTmpPasarTodos: TMenuItem;
    tbEliminarTemporarios: TToolButton;
    sdqTraspasos: TSDQuery;
    dsTraspasos: TDataSource;
    qpTraspasos: TQueryPrint;
    N3: TMenuItem;
    mnuImpTodosVolante: TMenuItem;
    tbImpExpTemporarios: TToolButton;
    sdqDelegacionPago: TSDQuery;
    dsDelegacionPago: TDataSource;
    sdqProvinciaPrestador: TSDQuery;
    dsProvinciaPrestador: TDataSource;
    sdqEstados: TSDQuery;
    dsEstados: TDataSource;
    pMnuTmpImpExp: TPopupMenu;
    mnuImprimirTmp: TMenuItem;
    mnuExportarTmp: TMenuItem;
    ExportDialogTmp: TExportDialog;
    tbAuditoria: TToolButton;
    tbDerivar: TToolButton;
    tbReasignar: TToolButton;
    tbMarcarNoAuditable: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    PrintDialog: TPrintDialog;
    tbAuditoriaOrtopedia: TToolButton;
    tbEnviarMail: TToolButton;
    pMnuEnviarMail: TPopupMenu;
    MnuEnviarNotaDebito: TMenuItem;
    MnuEnviarDetalle: TMenuItem;
    pMnuCancelar: TPopupMenu;
    MnuCancelarVolante: TMenuItem;
    MnuCancelarReemplazar: TMenuItem;
    tbDebitoTotal: TToolButton;
    sdqHistoricoVolante: TSDQuery;
    dsHistoricoVolante: TDataSource;
    tbHistorico: TToolButton;
    pcFiltros: TPageControl;
    tsFiltros0: TTabSheet;
    pnlPrestador: TPanel;
    fraPrestador: TfraPrestador;
    chkNotaDebito: TCheckBox;
    pnlNotaDebito: TPanel;
    Label6: TLabel;
    edNotaDebitoDesde: TIntEdit;
    edNotaDebitoHasta: TIntEdit;
    chkNumero: TCheckBox;
    pnlSiniestro: TPanel;
    Label7: TLabel;
    edNumDesde: TIntEdit;
    edNumHasta: TIntEdit;
    chkPrestador: TCheckBox;
    cpnlRefacturacion: TCheckPanel;
    cmbRefacturacion: TComboBox;
    pnlEstado: TPanel;
    cmbEstados: TDBCheckCombo;
    chkEstado: TCheckBox;
    cpnlAuditado: TCheckPanel;
    cmbAuditado: TComboBox;
    cpnlVolAjustado: TCheckPanel;
    edVolAjustado: TIntEdit;
    pnlConNotaDebito: TPanel;
    chkConNotaDebito: TCheckBox;
    chkSinCheque: TCheckBox;
    pnlDelegacionPago: TPanel;
    cmbDelegacionPago: TArtComboBox;
    chkDelegacionPago: TCheckBox;
    pnlDelegacion: TPanel;
    cmbDelegacion: TArtComboBox;
    chkDelegacion: TCheckBox;
    pnlProvinciaPrestador: TPanel;
    cmbPrestProvincia: TArtComboBox;
    chkProvinciaPrestador: TCheckBox;
    tsFechas: TTabSheet;
    cpnlFecRecepCentral: TCheckPanel;
    Label8: TLabel;
    deFechaRecCentDesde: TDateComboBox;
    deFechaRecCentHasta: TDateComboBox;
    cpnlFecRecepOrtopedia: TCheckPanel;
    Label15: TLabel;
    deFechaRecOrtDesde: TDateComboBox;
    deFechaRecOrtHasta: TDateComboBox;
    cpnlFecRecepLiquid: TCheckPanel;
    Label16: TLabel;
    deFechaRecLiqDesde: TDateComboBox;
    deFechaRecLiqHasta: TDateComboBox;
    pnlFechaRecep: TCheckPanel;
    Label17: TLabel;
    deFechaRecepDesde: TDateComboBox;
    deFechaRecepHasta: TDateComboBox;
    pnlFechaAlta: TCheckPanel;
    Label9: TLabel;
    deFechaAltaDesde: TDateComboBox;
    deFechaAltaHasta: TDateComboBox;
    pnlFechaAuto: TCheckPanel;
    Label2: TLabel;
    deFechaAutoDesde: TDateComboBox;
    deFechaAutoHasta: TDateComboBox;
    pnlFechaApro: TCheckPanel;
    Label3: TLabel;
    deFechaAproDesde: TDateComboBox;
    deFechaAproHasta: TDateComboBox;
    pnlFecha: TCheckPanel;
    Label1: TLabel;
    deFechaDesde: TDateComboBox;
    deFechaHasta: TDateComboBox;
    cpnlFechaAud: TCheckPanel;
    Label4: TLabel;
    deFechaAudDesde: TDateComboBox;
    deFechaAudHasta: TDateComboBox;
    pnlFechaVenc: TCheckPanel;
    Label18: TLabel;
    deFechaVencDesde: TDateComboBox;
    deFechaVencHasta: TDateComboBox;
    cpnlFechaRecepAud: TCheckPanel;
    Label5: TLabel;
    deFechaRecepAudDesde: TDateComboBox;
    deFechaRecepAudHasta: TDateComboBox;
    sdHistorico: TSortDialog;
    N4: TMenuItem;
    mnuImpRemitoMP: TMenuItem;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    gbDetalleEstudios: TJvgGroupBox;
    dbgEstudios: TArtDBGrid;
    tbTrabajadores: TToolBar;
    tbOrdenarEstudios: TToolButton;
    sdqEstudios: TSDQuery;
    dsEstudios: TDataSource;
    SortDialog1: TSortDialog;
    tbImprimirEstudios: TToolButton;
    tbFechaTerm: TToolButton;
    cpnlFechaTerminacion: TCheckPanel;
    Label21: TLabel;
    deFechaTermDesde: TDateComboBox;
    deFechaTermHasta: TDateComboBox;
    pMnuExportar: TPopupMenu;
    mnuExportarGrilla: TMenuItem;
    mnuExportarNotaDebito: TMenuItem;
    OpenDialogPDF: TOpenDialog;
    pMnuAuditoria: TPopupMenu;
    mnuAudiSinD: TMenuItem;
    mnuAudiConD: TMenuItem;
    mnuAvalarDebito: TMenuItem;
    N5: TMenuItem;
    cpnlPendAudit: TCheckPanel;
    cmbPendAuditar: TComboBox;
    tbSalir: TToolButton;
    ToolButton4: TToolButton;
    cpnlAuditorVolante: TCheckPanel;
    fraUsuAuditorFiltro: TfraUsuario;
    cpnlUsuAuditoria: TCheckPanel;
    fraUsuarioAuditoria: TfraUsuario;
    ScrollBox1: TScrollBox;
    fpAsignarAuditorVolante: TFormPanel;
    Bevel5: TBevel;
    Label22: TLabel;
    Label23: TLabel;
    btnAceptarUsuAudit: TButton;
    btnCancelarUsuAudit: TButton;
    edVolanteUsuAudit: TIntEdit;
    fraUsuAuditor: TfraUsuario;
    ToolBar2: TToolBar;
    tbLimpiarAuditorAsignado: TToolButton;
    fpFechaTerm: TFormPanel;
    Label10: TLabel;
    Bevel1: TBevel;
    btnAceptarTerm: TButton;
    btnCancelarTerm: TButton;
    dcTerminacion: TDateComboBox;
    fpImporteNuevo: TFormPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Bevel3: TBevel;
    btnAceptarReemplazo: TButton;
    btnCancelarReemplazo: TButton;
    edImporteVolante: TCurrencyEdit;
    edImporteIVA: TCurrencyEdit;
    edImporteTotal: TCurrencyEdit;
    fpRemitoMalaPraxis: TFormPanel;
    Label20: TLabel;
    Bevel4: TBevel;
    btnAceptarMP: TButton;
    btnCancelarMP: TButton;
    GroupBox1: TGroupBox;
    rbUsuarioMP: TRadioButton;
    rbDelegMP: TRadioButton;
    fraUsuarioMP: TfraUsuario;
    fraDelegacionMP: TfraDelegacion;
    dcFechaMP: TDateComboBox;
    fpPrestador: TFormPanel;
    gbPresTMP: TGroupBox;
    edCuitTMP: TMaskEdit;
    edDescrTMP: TEdit;
    btnCancelarPres: TButton;
    btnAceptarPres: TButton;
    gbPresSel: TGroupBox;
    lvPrestadores: TListView;
    fpDerivacion: TFormPanel;
    Bevel2: TBevel;
    Label12: TLabel;
    btnAceptarDerivar: TButton;
    btnCancelarDerivar: TButton;
    fraStaticCTBDerivacion: TfraStaticCTB_TABLAS;
    fpObservaciones: TFormPanel;
    Label11: TLabel;
    memoObservaciones: TMemo;
    btnObsAceptar: TButton;
    fpImpVolantes: TFormPanel;
    lbTraspasos: TLabel;
    btnImpVolCancelar: TButton;
    ProgressBar: TProgressBar;
    fpHistorico: TFormPanel;
    bvNomMid: TBevel;
    dgHistorico: TArtDBGrid;
    btnCerrar: TBitBtn;
    btnOrdenarHist: TBitBtn;
    munAvalDebitoPendiente: TMenuItem;
    mnuVerDebitosPorAuditoria: TMenuItem;
    N7: TMenuItem;
    mnuDiscrepancias: TMenuItem;
    mnuAgregarDiscrepancia: TMenuItem;
    mnuAvalarDiscrepancia: TMenuItem;
    mnuVisualizarDiscrepancia: TMenuItem;
    mnuImpNotaDebitoInterna: TMenuItem;
    mnuSeleccionartodos: TMenuItem;
    N6: TMenuItem;
    cds: TClientDataSet;
    cdsVolante: TIntegerField;
    cdsMail: TStringField;
    cdsPrestador: TStringField;
    pnlFechaEnvioND: TCheckPanel;
    Label24: TLabel;
    cbFechaEnvioNDDesde: TDateComboBox;
    cbFechaEnvioNDHasta: TDateComboBox;
    cdsIdentificador: TStringField;
    cdsCUIT: TStringField;
    pMnuNoAuditable: TPopupMenu;
    mnuVolNoAuditable: TMenuItem;
    mnuVolanteYaAuditado: TMenuItem;
    ExportDialogAMP: TExportDialog;
    tbExportarEstudios: TToolButton;
    mnuExportarTodo: TMenuItem;
    cpnlFechaTraspaso: TCheckPanel;
    Label25: TLabel;
    dcFecTrasDesde: TDateComboBox;
    dcFecTrasHasta: TDateComboBox;
    mnuReimprimirTemp: TMenuItem;
    tbVencimientoEgresosSem: TToolButton;
    fpVencimientoEgSem: TFormPanel;
    Bevel6: TBevel;
    Label26: TLabel;
    Label27: TLabel;
    btnAceptarEgSem: TButton;
    Button2: TButton;
    ToolBar3: TToolBar;
    dcVencimEgSem: TDateComboBox;
    dcVencimVolEgSem: TDateComboBox;
    procedure tbOcultarMostrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbAsignarAuditorVolanteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkNumeroClick(Sender: TObject);
    procedure chkPrestadorClick(Sender: TObject);
    procedure chkEstadoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbDetallesClick(Sender: TObject);
    procedure dbgListadoGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                      var Background: TColor; Highlight: Boolean);
    procedure mnuImpResultadosClick(Sender: TObject);
    procedure mnuImpVolanteClick(Sender: TObject);
    procedure mnuImpNotaDebitoClick(Sender: TObject);
    procedure mnuImpDetalleClick(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure dbgListadoPaintFooter(Sender: TObject; Column: String; var Value: String;
                                    var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbTotalesClick(Sender: TObject);
    procedure tbTotPorEstadoClick(Sender: TObject);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure edNumHastaEnter(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbDesAprobarClick(Sender: TObject);
    procedure tbReasignarAuditClick(Sender: TObject);
    procedure tbCtaCteClick(Sender: TObject);
    procedure mnuImpResMontosySaldosClick(Sender: TObject);
    procedure chkNotaDebitoClick(Sender: TObject);
    procedure edNotaDebitoHastaEnter(Sender: TObject);
    procedure mnuImpTodasNotaDebitoClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
                                      var ABackground: TColor; var AAlignment: TAlignment);
    procedure tbVerTemporariosClick(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure chkDelegacionClick(Sender: TObject);
    procedure mnuTmpPasarSeleccionClick(Sender: TObject);
    procedure mnuTmpPasarTodosClick(Sender: TObject);
    procedure tbEliminarTemporariosClick(Sender: TObject);
    procedure mnuImpTodosVolanteClick(Sender: TObject);
    procedure btnImpVolCancelarClick(Sender: TObject);
    procedure tbImpExpTemporariosClick(Sender: TObject);
    procedure tbPasarTemporariosClick(Sender: TObject);
    procedure qpTraspasosGetSubTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure qpTraspasosGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure chkDelegacionPagoClick(Sender: TObject);
    procedure chkProvinciaPrestadorClick(Sender: TObject);
    procedure cpnlVolAjustadoChange(Sender: TObject);
    procedure cpnlFecRecepCentralChange(Sender: TObject);
    procedure mnuImprimirTmpClick(Sender: TObject);
    procedure mnuExportarTmpClick(Sender: TObject);
    procedure tbAuditoriaClick(Sender: TObject);
    procedure cpnlRefacturacionChange(Sender: TObject);
    procedure cpnlAuditadoChange(Sender: TObject);
    procedure tbReasignarClick(Sender: TObject);
    procedure tbDerivarClick(Sender: TObject);
    procedure fpDerivacionEnter(Sender: TObject);
    procedure btnCancelarDerivarClick(Sender: TObject);
    procedure btnAceptarDerivarClick(Sender: TObject);
    procedure tbMarcarNoAuditableClick(Sender: TObject);
    procedure tbAuditoriaOrtopediaClick(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure MnuEnviarNotaDebitoClick(Sender: TObject);
    procedure MnuEnviarDetalleClick(Sender: TObject);
    procedure MnuCancelarVolanteClick(Sender: TObject);
    procedure MnuCancelarReemplazarClick(Sender: TObject);
    procedure btnCancelarReemplazoClick(Sender: TObject);
    procedure btnAceptarReemplazoClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tbDebitoTotalClick(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure cpnlFecRecepOrtopediaChange(Sender: TObject);
    procedure cpnlFecRecepLiquidChange(Sender: TObject);
    procedure pnlFechaRecepChange(Sender: TObject);
    procedure pnlFechaAltaChange(Sender: TObject);
    procedure pnlFechaAutoChange(Sender: TObject);
    procedure pnlFechaAproChange(Sender: TObject);
    procedure pnlFechaChange(Sender: TObject);
    procedure fpPrestadorBeforeShow(Sender: TObject);
    procedure btnAceptarPresClick(Sender: TObject);
    procedure cpnlFechaAudChange(Sender: TObject);
    procedure pnlFechaVencChange(Sender: TObject);
    procedure cpnlFechaRecepAudChange(Sender: TObject);
    procedure btnOrdenarHistClick(Sender: TObject);
    procedure edNumDesdeExit(Sender: TObject);
    procedure edImporteVolanteKeyPress(Sender: TObject; var Key: Char);
    procedure edImporteIVAKeyPress(Sender: TObject; var Key: Char);
    procedure edImporteVolanteExit(Sender: TObject);
    procedure mnuImpRemitoMPClick(Sender: TObject);
    procedure rbUsuarioMPClick(Sender: TObject);
    procedure btnAceptarMPClick(Sender: TObject);
    procedure fpRemitoMalaPraxisBeforeShow(Sender: TObject);
    procedure tbOrdenarEstudiosClick(Sender: TObject);
    procedure tbImprimirEstudiosClick(Sender: TObject);
    procedure tbFechaTermClick(Sender: TObject);
    procedure btnAceptarTermClick(Sender: TObject);
    procedure cpnlFechaTerminacionChange(Sender: TObject);
    procedure mnuExportarGrillaClick(Sender: TObject);
    procedure mnuExportarNotaDebitoClick(Sender: TObject);
    procedure mnuAudiSinDClick(Sender: TObject);
    procedure mnuAudiConDClick(Sender: TObject);
    procedure mnuAvalarDebitoClick(Sender: TObject);
    procedure cpnlPendAuditChange(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure btnAceptarUsuAuditClick(Sender: TObject);
    procedure fpAsignarAuditorVolanteBeforeShow(Sender: TObject);
    procedure tbLimpiarAuditorAsignadoClick(Sender: TObject);
    procedure cpnlAuditorVolanteChange(Sender: TObject);
    procedure cpnlUsuAuditoriaChange(Sender: TObject);
    procedure munAvalDebitoPendienteClick(Sender: TObject);
    procedure mnuVerDebitosPorAuditoriaClick(Sender: TObject);
    procedure mnuAgregarDiscrepanciaClick(Sender: TObject);
    procedure mnuAvalarDiscrepanciaClick(Sender: TObject);
    procedure mnuVisualizarDiscrepanciaClick(Sender: TObject);
    procedure mnuImpNotaDebitoInternaClick(Sender: TObject);
    procedure mnuSeleccionartodosClick(Sender: TObject);
    procedure GenerarVariasND(vTipoSalida: TTipoSalida; bInternaAMF: Boolean = false);
    procedure ToolButton3Click(Sender: TObject);
    procedure pnlFechaEnvioNDChange(Sender: TObject);
    procedure DetalleEstudiosAMP1Click(Sender: TObject);
    procedure tbExportarEstudiosClick(Sender: TObject);
    procedure mnuExportarTodoClick(Sender: TObject);
    procedure cpnlFechaTraspasoChange(Sender: TObject);
    procedure mnuReimprimirTempClick(Sender: TObject);
    procedure btnObsAceptarClick(Sender: TObject);
    procedure fpVencimientoEgSemBeforeShow(Sender: TObject);
    procedure btnAceptarEgSemClick(Sender: TObject);
    procedure tbVencimientoEgresosSemClick(Sender: TObject);
  private
    ImporteAntVolante, ImporteNuevoVolante, ImporteIVA :Double;
    iPrestador: Integer;
    sNuevoEstado: String;
    SqlCtbEcheq: String;
    SqlCtbMuvol: String;
    SqlTotales: String;
    SqlWhere: String;
    Tot1: String;
    Tot2: String;
    Tot3: String;
    Tot4: String;
    Tot5: String;
    Tot6: String;

    function CantSel: Boolean;
    function Hay1RegistroActivo: Boolean;
    function HayRegistrosSeleccionados: Boolean;
    function HayRegistroActivo: Boolean;
    function IsRegistrosAuditoriaOrtopediaValidos: Boolean;
    function IsRegistrosAuditoriaValidos(bConDebito: Boolean): Boolean;
    function IsRegistrosDerivarValidos: Boolean;
    function IsRegistrosReasignarValidos: Boolean;
    function PasarVolante(AVolOrigen: Integer; AFecha: TDateTime): Boolean;
    function ShowPrestadores: Boolean;
    function Validar: Boolean;
    function ValidarAuditar: Boolean;  // TK 11136
    function ValidarTipoComprobante(iPrestador, iVolOrigen: Integer): Boolean;
    function GetDelegacionUsuario(sIdUsuario:string):string;
    function SetNuevoEstado(sNuevoEst, sMixto, sAntEst :String; iVolOrigen :Integer): String;
    function TieneAuditorAsignado(iNroVolante: integer): boolean;        // TK 11136
    function Auditor_EsAuditorLogueado (iNroVolante: integer): boolean;  // TK 11136

    procedure CalcTotales;
    procedure DoGenerarDetalleAjuste(bEsImpresion: Boolean);
    procedure DoGenerarNotaDebito(vTipoSalida: TTipoSalida; bInternaAMF: Boolean = False);
    procedure DoReplicarVolante;
    procedure MakeSubTitle; // Genera el subtitulo del reporte con los filtros seleccionados
    procedure OnPrestadorChange(Sender: TObject);
    procedure ReporteTraspasos(Accion: String; IsDateTime: Boolean = True; ConMensaje: Boolean = True; AFecha: TDateTime = 0);
    procedure DoAuditarVolante(bConDebito :Boolean);
    procedure DoAuditarVolanteConDebito;
    procedure DoDiscrepancia(bAval, bSoloLectura: Boolean);
  public
  end;

var
  frmConsVol: TfrmConsVol; condicionesND: boolean;

implementation

uses
  unPrincipal, General, unDmPrincipal, StrFuncs, Registros, unRptVolante, SDOra, 
  unDetFact, unRptNotaDebito, CustomDlgs, AnsiSql, unResMontosSaldos, unArt, 
  Numeros, unSesion, unMoldeEnvioMail, ArchFuncs, unExportPDF, unEnvioMail, 
  uncomunes, unRptRemitoMalaPraxis, unRptNDAMP, unRptEstudiosVolante, VCLExtra,
  unDebitosAuditoria, unDiscrepanciasAuditoria, unLiquidaciones, unEsperaSimple;

{$R *.DFM}

const
  sSqlNor = 'SELECT 1' +
            '  FROM mnd_notadebito' +
            ' WHERE nd_volante = :pivolante';

  sSqlGen = 'SELECT 1' +
            '  FROM mng_notadebitogen' +
            ' WHERE ng_volante = :pivolante';

  sSqlAMP = 'SELECT 1' +
            '  FROM mnd_notadebitoamp' +
            ' WHERE nd_idvolante = :pivolante';

  sSqlInt = 'SELECT 1' +
             ' FROM mni_notadebitointerno ' +
            ' WHERE nd_volante = :pidvolante ';

procedure TfrmConsVol.tbOcultarMostrarClick(Sender: TObject);
begin
  if tbOcultarMostrar.Down then
  begin
    pnlFiltros.Visible          := False;
    tbOcultarMostrar.Hint       := 'Mostrar Filtros';
    tbOcultarMostrar.ImageIndex := 5;
  end
  else begin
    pnlFiltros.Visible          := True;
    tbOcultarMostrar.Hint       := 'Ocultar Filtros';
    tbOcultarMostrar.ImageIndex := 6;
  end;
end;

procedure TfrmConsVol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuLiquiConsVol.Enabled := True;
  SetRegFromValue(Self, 'tbOcultarMostrar.Down', String(IIF(tbOcultarMostrar.Down, REG_TRUE, REG_FALSE)));
  SetRegFromValue(Self, 'tbTotales.Down',        String(IIF(tbTotales.Down, REG_TRUE, REG_FALSE)));
  SetRegFromValue(Self, 'tbCtaCte.Down',         String(IIF(tbCtaCte.Down, REG_TRUE, REG_FALSE)));
end;

procedure TfrmConsVol.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 116) and (tbRefrescar.Enabled) then
    tbRefrescarClick(nil);
end;

{---[ Muestra u Oculta los Filtros ]--------------------------------------------}
procedure TfrmConsVol.FormCreate(Sender: TObject);
begin
  sdqDelegacion.Open;
  sdqDelegacionPago.Open;
  sdqProvinciaPrestador.Open;
  sdqEstados.Open;
  dcTerminacion.MaxDate         := DBDateTime;
  JvNetscapeSplitter1.Enabled   := False;
  gbDetalleEstudios.Enabled     := False;
  gbDetalleEstudios.Collapsed   := True;
  fraPrestador.ShowBajas        := True;
  fraPrestador.ShowNombreFanta  := True;
  fraPrestador.OnChange         := OnPrestadorChange;
  tbOcultarMostrar.Down         := GetRegFromValue(Self, 'tbOcultarMostrar.Down', REG_FALSE) = REG_TRUE;
  tbOcultarMostrarClick(nil);
  tbTotales.Down := GetRegFromValue(Self,'tbTotales.Down', REG_TRUE) = REG_TRUE;
  tbTotalesClick(nil);
  cpnlAuditorVolante.enabled    := Seguridad.Claves.IsActive('VerFiltroAuditorVolante');  // TK 11136
  cpnlUsuAuditoria.enabled      := Seguridad.Claves.IsActive('VerFiltroUsuarioAuditoria');    // TK 16517
  tbImpExpTemporarios.Enabled   := Seguridad.Activar(tbImpExpTemporarios);

  if tbCtaCte.Enabled then
  begin
    tbCtaCte.Down := GetRegFromValue(Self,'tbCtaCte.Down', REG_FALSE) = REG_TRUE;
    tbCtaCteClick(Nil);
  end;

  cmbAuditado.ItemIndex      := 4;
  cmbPendAuditar.ItemIndex   := 2;
  cmbRefacturacion.ItemIndex := 2;

  with fraStaticCTBDerivacion do
  begin
   Clave          := 'MUVOL';
   ExtraCondition := 'AND substr(tb_especial2, 1, 1) = ''D''';
  end;

  dgHistorico.Columns[1].Visible := Seguridad.Claves.IsActive('VerUsuarioAltaHistorico');
  pcFiltros.ActivePage := tsFiltros0;

  dbgListado.ColumnByField['VO_USUAUDITOR'].Visible    := Seguridad.Claves.IsActive('VerUsuAuditor');   // TK 11136
  dbgListado.ColumnByField['VO_FECUSUAUDITOR'].Visible := Seguridad.Claves.IsActive('VerUsuAuditor');
  fraUsuAuditorFiltro.sql := fraUsuAuditorFiltro.sql + ' AND EXISTS (SELECT 1 FROM SVU_AUDITORESVOLANTES ' +
                                                                    ' WHERE VU_USUAUDITOR = SE_USUARIO ' +
                                                                      ' AND VU_FECHABAJA IS NULL) ';

  fraUsuarioAuditoria.sql := fraUsuarioAuditoria.sql + ' AND EXISTS (SELECT 1 FROM SVU_AUDITORESVOLANTES ' +   // TK 16517 : REscobares quiere que el "Usuario Auditoría" (vo_usuarioauditoria), en el filtro traiga lo mismo que el "Usuario Auditor", segun su mantenimiento. (raro pero es asi...)
                                                                    ' WHERE VU_USUAUDITOR = SE_USUARIO ' +
                                                                      ' AND VU_FECHABAJA IS NULL) ';

  condicionesND := false;
  vclextra.LockControl(dcVencimVolEgSem);
end;

procedure TfrmConsVol.chkNumeroClick(Sender: TObject);
begin
  if chkNumero.Checked then
  begin
    pnlSiniestro.Enabled := True;
    edNumDesde.SetFocus;
  end
  else
  begin
    pnlSiniestro.Enabled := False;
    edNumDesde.Text      := '';
    edNumHasta.Text      := '';
  end;
end;

procedure TfrmConsVol.chkPrestadorClick(Sender: TObject);
begin
  if chkPrestador.Checked then
  begin
    pnlPrestador.Enabled := True;
    fraPrestador.IDPrestadorFocus;
  end
  else begin
    pnlPrestador.Enabled         := False;
    fraPrestador.Limpiar;
  end;
end;

procedure TfrmConsVol.chkEstadoClick(Sender: TObject);
begin
  if chkEstado.Checked then
  begin
    pnlEstado.Enabled := True;
    cmbEstados.SetFocus;
    cmbEstados.DropDown;
  end
  else begin
    pnlEstado.Enabled := False;
    cmbEstados.ClearChecks;
  end;
end;

procedure TfrmConsVol.cpnlVolAjustadoChange(Sender: TObject);
begin
  if not cpnlVolAjustado.Checked then
    edVolAjustado.Text := '';
end;

procedure TfrmConsVol.chkNotaDebitoClick(Sender: TObject);
begin
  if chkNotaDebito.Checked then
  begin
    pnlNotaDebito.Enabled := True;
    edNotaDebitoDesde.SetFocus;
  end
  else begin
    pnlNotaDebito.Enabled  := False;
    edNotaDebitoDesde.Text := '';
    edNotaDebitoHasta.Text := '';
  end;
end;

procedure TfrmConsVol.cpnlFecRecepCentralChange(Sender: TObject);
begin
  if not cpnlFecRecepCentral.Checked then
  begin
    deFechaRecCentDesde.Clear;
    deFechaRecCentHasta.Clear;
  end;
end;

function TfrmConsVol.Validar: Boolean;
begin
  Verificar(chkNumero.Checked and ((edNumDesde.Text = '') and (edNumHasta.Text = '')),
            edNumDesde, 'Debe seleccionar el número del volante.');
  Verificar(pnlFecha.Checked and ((deFechaDesde.Date = 0) and (deFechaHasta.Date = 0)),
            deFechaDesde, 'Debe seleccionar la fecha de la factura.');
  Verificar(pnlFechaRecep.Checked and ((deFechaRecepDesde.Date = 0) and (deFechaRecepHasta.Date = 0)),
            deFechaRecepDesde, 'Debe seleccionar la fecha de recepción.');
  Verificar(pnlFechaVenc.Checked and ((deFechaVencDesde.Date = 0) and (deFechaVencHasta.Date = 0)),
            deFechaVencDesde, 'Debe seleccionar la fecha del vencimiento.');
  Verificar(cpnlFechaTerminacion.Checked and ((deFechaTermDesde.Date = 0) and (deFechaTermHasta.Date = 0)),
            deFechaTermDesde, 'Debe seleccionar la fecha de terminación de derivación.');
  Verificar(cpnlFechaAud.Checked and ((deFechaAudDesde.Date = 0) and (deFechaAudHasta.Date = 0)),
            deFechaAudDesde, 'Debe seleccionar la fecha de auditoría.');
  Verificar(cpnlFechaRecepAud.Checked and ((deFechaRecepAudDesde.Date = 0) and (deFechaRecepAudHasta.Date = 0)),
            deFechaRecepAudDesde, 'Debe seleccionar la fecha de recepción de auditoría.');
  Verificar(cpnlVolAjustado.Checked and (edVolAjustado.Text = ''),
            edVolAjustado, 'Debe seleccionar el volante Ajustado.');
  Verificar(pnlFechaAlta.Checked and ((deFechaAltaDesde.Date = 0) and (deFechaAltaHasta.Date = 0)),
            deFechaAltaDesde, 'Debe seleccionar alguna fecha de carga.');
  Verificar(chkPrestador.Checked and (fraPrestador.IDPrestador = 0),
            fraPrestador, 'Debe Seleccionar el prestador.');
  Verificar(chkProvinciaPrestador.Checked and (cmbPrestProvincia.FieldValue = ''),
            cmbPrestProvincia, 'Debe Seleccionar la provincia del prestador.');
  Verificar(chkEstado.Checked and (cmbEstados.Text = ''),
            cmbEstados, 'Debe seleccionar algún estado.');
  Verificar(chkDelegacionPago.Checked and (cmbDelegacionPago.FieldValue = ''),
            cmbDelegacionPago, 'Debe seleccionar la Delegación de pago.');
  Result := True;
end;

{---[ Genera la Consulta Customizada por el usuario ]---------------------------}
procedure TfrmConsVol.tbRefrescarClick(Sender: TObject);
var
  sCampos, Sql: String;
begin
  if not Validar then
    Exit;

  if SqlCtbMuvol = '' then
  begin
    SqlCtbMuvol := GetDecodeFromCTB('VO_ESTADO',       'MUVOL');
    SqlCtbEcheq := GetDecodeFromCTB('VO_ESTADOCHEQUE', 'ECHEQ');
  end;

  sdqEstudios.Close;
  JvNetscapeSplitter1.Enabled := false;
  gbDetalleEstudios.Enabled   := false;
  gbDetalleEstudios.Collapsed := true;

  SqlWhere := '';
  Cursor := crSQLWait;
  MostrarEstado('Ejecutando Consulta...');

  if tbvertemporarios.down then
    sCampos := 'vo_cuitprestador ca_clave, vo_descrprestador ca_descripcion, '
  else
    sCampos := 'ca_clave, ca_descripcion, ';

  Sql :=
    'SELECT vo_volante, vo_prestador, ca_identificador, ' + sCampos + ' ca_fechabaja, ca_provincia, gp_descripcion, ' +
          ' vo_facturatipo || ''-'' || vo_facturaestable || ''-'' || vo_facturanro factura, vo_facturatipo,' +
          ' vo_facturaestable, vo_facturanro, vo_montopercepcion, vo_montodebito, vo_fechalta, vo_monto,' +
          ' vo_estado, ' + sqlctbmuvol + ' estado, amebpba.get_montopagado(vo_volante) montopagado, vo_observaciones,' +
          ' vo_fechapro, vo_vencimiento, vo_fechafactura, vo_usuapro, vo_fechapago, vo_usupago, vo_notadebito,' +
          ' vo_ajuste, vo_ordenpago, tp_descripcion, to_char(vo_fechacheque, ''dd/mm/yyyy'') fechacheque, vo_cheque,' +
          ' to_number(iif_null(vo_tipopago, null, amebpba.get_montopagado(vo_volante))) imppagado,' +
          ' dcarga.lg_nombre delegcarga, dpago.lg_nombre delegpago, ca_nombrefanta, vo_fecharecepcion,' +
          ' ca_clave, ' + {ca_clave es para el fantasmita}
          ' vo_fecharecepcion_central, ' + sqlctbecheq + ' estadocheque, vo_auditado, vo_usuarioauditoria,' +
          ' vo_fechaauditoria, vo_refacturacion, vo_norequiereaudi, vo_observaciones_derivacion, vo_carga_central,' +
          ' decode(cp_idsucursal, null,' +
          ' art.utiles.iif_char(cp_cbu1, null, null, cp_cbu1 || ''-'' || cp_cbu2), cp_nrocuenta) cbu,' +
          ' vo_usuarioortopedia, vo_fechaortopedia, vo_facpen, ca_direlectronica, vo_fecharecepaudit, pv_descripcion,' +
          ' vo_fechareceportopedia, vo_fecharecepliquid, vo_volantecancela, vo_volantecancelado,' +
          ' amebpba.get_totaldebito(vo_volante) totaldebito, vo_montobruto, vo_montoiva, vo_mixto, ' +
          ' vo_fechaterminacion, vo_auditcondebito, vo_usuavaldebito, vo_fechaavaldebito, ' +
          ' vo_usuauditor, vo_fecusuauditor, VO_FECHAENVIOND, nvl(ca_maildebitos, ca_direlectronica) ca_maildebitos, ' +
          ' vo_estadopend, vo_fecharevisioncp, vo_fechaenviondauto ' + IIF(not tbvertemporarios.Down, ', vo_volantetemp,', ',') +           // TK 11136
          ' vo_vencimientoes ' +
     ' FROM dlg_delegaciones dcarga, dlg_delegaciones dpago, cpr_prestador, stp_tipopago, ' +
            IIF(tbvertemporarios.Down, 'tmp_', '') + 'svo_volantes, cpv_provincias, ccp_cuentapago, SIN.sgp_gruposprestador ' +
    ' WHERE ca_identificador(+) = vo_prestador' +
      ' AND vo_tipopago = tp_codigo (+)' +
      ' AND dcarga.lg_codigo = vo_delegacionalta' +
      ' AND dpago.lg_codigo  = vo_delegacion' +     // aclaracion: vo_delegacion=delegacion del pago ; vo_delegacionalta=delegacion de la carga.
      ' AND ca_provincia = pv_codigo (+)' +
      ' AND ca_identificador = cp_idacreedor(+)' +
      ' AND cp_tipoacreedor(+) = ''CA''' +
      ' AND cp_fechabaja(+) IS NULL ' +
      ' AND ca_idgrupousuario = gp_id(+) ';

  //-------------------------------------------------------------------------
  if chkNumero.Checked then
    if (edNumDesde.Text <> '') and (edNumHasta.Text <> '') then
      SqlWhere := SqlWhere + ' AND VO_VOLANTE BETWEEN ' + edNumDesde.TextSql + ' AND ' + edNumHasta.TextSql
    else if (edNumDesde.Text <> '') then
      SqlWhere := SqlWhere + ' AND VO_VOLANTE > ' + edNumDesde.TextSql
    else if (edNumHasta.Text <> '') then
      SqlWhere := SqlWhere + ' AND VO_VOLANTE < ' + edNumHasta.TextSql;
  //-------------------------------------------------------------------------
  if pnlFecha.Checked then
    if (deFechaDesde.Date <> 0) and (deFechaHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAFACTURA BETWEEN ' + deFechaDesde.SqlText + ' AND ' + deFechaHasta.SqlText
    else if (deFechaDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAFACTURA > ' + deFechaDesde.SqlText
    else if (deFechaHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAFACTURA < ' + deFechaHasta.SqlText;
  //-------------------------------------------------------------------------
  if pnlFechaVenc.Checked then
    if (deFechaVencDesde.Date <> 0) and (deFechaVencHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_VENCIMIENTO BETWEEN ' + deFechaVencDesde.SqlText + ' AND ' + deFechaVencHasta.SqlText
    else if (deFechaVencDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_VENCIMIENTO > ' + deFechaVencDesde.SqlText
    else if (deFechaVencHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_VENCIMIENTO < ' + deFechaVencHasta.SqlText;
  //-------------------------------------------------------------------------
  if cpnlFechaTerminacion.Checked then
    if (deFechaTermDesde.Date <> 0) and (deFechaTermHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHATERMINACION BETWEEN ' + deFechaTermDesde.SqlText + ' AND ' + deFechaTermHasta.SqlText
    else if (deFechaTermDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHATERMINACION > ' + deFechaTermDesde.SqlText
    else if (deFechaTermHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHATERMINACION < ' + deFechaTermHasta.SqlText;
  //-------------------------------------------------------------------------
  if pnlFechaRecep.Checked then
    if (deFechaRecepDesde.Date <> 0) and (deFechaRecepHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPCION BETWEEN ' + deFechaRecepDesde.SqlText + ' AND ' + deFechaRecepHasta.SqlText
    else if (deFechaRecepDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPCION > ' + deFechaRecepDesde.SqlText
    else if (deFechaRecepHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPCION < ' + deFechaRecepHasta.SqlText;
  //-------------------------------------------------------------------------
  if cpnlFecRecepCentral.Checked then
  begin
    if (deFechaRecCentDesde.Date <> 0) and (deFechaRecCentHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPCION_CENTRAL BETWEEN ' + deFechaRecCentDesde.SqlText +
                             ' AND ' + deFechaRecCentHasta.SqlText
    else if (deFechaRecCentDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPCION_CENTRAL > ' + deFechaRecCentDesde.SqlText
    else if (deFechaRecCentHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPCION_CENTRAL < ' + deFechaRecCentHasta.SqlText
    else
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPCION_CENTRAL IS NOT NULL';
  end;
  //-------------------------------------------------------------------------
  if cpnlFecRecepOrtopedia.Checked then
  begin
    if (deFechaRecOrtDesde.Date <> 0) and (deFechaRecOrtHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAREVISIONCP BETWEEN ' + deFechaRecOrtDesde.SqlText +
                             ' AND ' + deFechaRecOrtHasta.SqlText
    else if (deFechaRecOrtDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAREVISIONCP > ' + deFechaRecOrtDesde.SqlText
    else if (deFechaRecOrtHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAREVISIONCP < ' + deFechaRecOrtHasta.SqlText
    else
      SqlWhere := SqlWhere + ' AND VO_FECHAREVISIONCP IS NOT NULL';
  end;
  //-------------------------------------------------------------------------
  if cpnlFecRecepLiquid.Checked then
  begin
    if (deFechaRecLiqDesde.Date <> 0) and (deFechaRecLiqHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPLIQUID BETWEEN ' + deFechaRecLiqDesde.SqlText +
                             ' AND ' + deFechaRecLiqHasta.SqlText
    else if (deFechaRecLiqDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPLIQUID > ' + deFechaRecLiqDesde.SqlText
    else if (deFechaRecLiqHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPLIQUID < ' + deFechaRecLiqHasta.SqlText
    else
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPLIQUID IS NOT NULL';
  end;
  //-------------------------------------------------------------------------
  if cpnlFechaAud.Checked then
  begin
    if (deFechaAudDesde.Date <> 0) and (deFechaAudHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAAUDITORIA BETWEEN ' + deFechaAudDesde.SqlText +
                             ' AND ' + deFechaAudHasta.SqlText
    else if (deFechaAudDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAAUDITORIA > ' + deFechaAudDesde.SqlText
    else if (deFechaAudHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAAUDITORIA < ' + deFechaAudHasta.SqlText
    else
      SqlWhere := SqlWhere + ' AND VO_FECHAAUDITORIA IS NOT NULL  ';
  end;
  //-------------------------------------------------------------------------

  if pnlFechaEnvioND.Checked then
  begin
    if not cbFechaEnvioNDDesde.IsEmpty  then
      SqlWhere := SqlWhere + ' AND VO_FECHAENVIOND >= ' + SqlDate(cbFechaEnvioNDDesde.Date);
    if not cbFechaEnvioNDHasta.IsEmpty then
      SqlWhere := SqlWhere + ' AND VO_FECHAENVIOND <= ' + SqlDate(cbFechaEnvioNDHasta.Date);
  end;
  //-------------------------------------------------------------------------

  if cpnlFechaRecepAud.Checked then
  begin
    if (deFechaRecepAudDesde.Date <> 0) and (deFechaRecepAudHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPAUDIT BETWEEN ' + deFechaRecepAudDesde.SqlText +
                             ' AND ' + deFechaRecepAudHasta.SqlText
    else if (deFechaRecepAudDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPAUDIT > ' + deFechaRecepAudDesde.SqlText
    else if (deFechaRecepAudHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPAUDIT < ' + deFechaRecepAudHasta.SqlText
    else
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPAUDIT IS NOT NULL ';
  end;
  //-------------------------------------------------------------------------
  if cpnlFechaTraspaso.Checked and (not tbvertemporarios.Down) then
  begin
    if not dcFecTrasDesde.IsEmpty  then
      SqlWhere := SqlWhere + ' AND VO_FECHALTA >= ' + SqlDate(dcFecTrasDesde.Date);
    if not dcFecTrasHasta.IsEmpty then
      SqlWhere := SqlWhere + ' AND VO_FECHALTA <= ' + SqlDate(dcFecTrasHasta.Date);
    SqlWhere := SqlWhere + ' AND VO_VOLANTETEMP IS NOT NULL ';
  end;
  //-------------------------------------------------------------------------
  if cpnlVolAjustado.Checked then
    SqlWhere := SqlWhere + ' AND VO_AJUSTE = ' + edVolAjustado.Text;
  //-------------------------------------------------------------------------
  if pnlFechaAlta.Checked then
    if (deFechaAltaDesde.Date <> 0) and (deFechaAltaHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHALTA BETWEEN ' + deFechaAltaDesde.SqlText + ' AND ' + deFechaAltaHasta.SqlText
    else if (deFechaAltaDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHALTA > ' + deFechaAltaDesde.SqlText
    else if (deFechaAltaHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHALTA < ' + deFechaAltaHasta.SqlText;
  //-------------------------------------------------------------------------
  if pnlFechaApro.Checked then
    if (deFechaAproDesde.Date <> 0) and (deFechaAproHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAPRO BETWEEN ' + deFechaAproDesde.SqlText + ' AND ' + deFechaAproHasta.SqlText
    else if (deFechaAproDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAPRO > ' + deFechaAproDesde.SqlText
    else if (deFechaAproHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAPRO < ' + deFechaAproHasta.SqlText
    else
      SqlWhere := SqlWhere + ' AND VO_FECHAPRO IS NOT NULL';
  //-------------------------------------------------------------------------
  if pnlFechaAuto.Checked then
    if (deFechaAutoDesde.Date <> 0) and (deFechaAutoHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAPAGO BETWEEN ' + deFechaAutoDesde.SqlText + ' AND ' + deFechaAutoHasta.SqlText
    else if (deFechaAutoDesde.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAPAGO > ' + deFechaAutoDesde.SqlText
    else if (deFechaAutoHasta.Date <> 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHAPAGO < ' + deFechaAutoHasta.SqlText
    else
      SqlWhere := SqlWhere + ' AND VO_FECHAPAGO IS NOT NULL';
  //-------------------------------------------------------------------------
  if chkPrestador.Checked and (fraPrestador.IDPrestador <> 0) then
    SqlWhere := SqlWhere + ' AND VO_PRESTADOR = ' + SqlValue(fraPrestador.IDPrestador);
  //-------------------------------------------------------------------------
  if chkProvinciaPrestador.Checked and (cmbPrestProvincia.FieldValue <> '') then
    SqlWhere := SqlWhere + ' AND CA_PROVINCIA = ' + cmbPrestProvincia.FieldValue;
  //-------------------------------------------------------------------------
  if chkEstado.Checked and (cmbEstados.Text <> '') then
    SqlWhere := SqlWhere + ' AND VO_ESTADO ' +  cmbEstados.InSql;
  //-------------------------------------------------------------------------
  if chkNotaDebito.Checked then
    if (edNotaDebitoDesde.Text <> '') and (edNotaDebitoHasta.Text <> '') then
      SqlWhere := SqlWhere + ' AND VO_NOTADEBITO BETWEEN ' + edNotaDebitoDesde.TextSql +
                             ' AND ' + edNotaDebitoHasta.TextSql
    else if (edNotaDebitoDesde.Text <> '') then
      SqlWhere := SqlWhere + ' AND VO_NOTADEBITO > ' + edNotaDebitoDesde.TextSql
    else if (edNotaDebitoHasta.Text <> '') then
      SqlWhere := SqlWhere + ' AND VO_NOTADEBITO < ' + edNotaDebitoHasta.TextSql
    else
      SqlWhere := SqlWhere + ' AND VO_NOTADEBITO IS NOT NULL';
  //-------------------------------------------------------------------------
  if chkDelegacion.Checked then
    SqlWhere := SqlWhere + ' AND VO_DELEGACIONALTA = ''' + cmbDelegacion.FieldValue + '''';
  //-------------------------------------------------------------------------
  if chkDelegacionPago.Checked then
    SqlWhere := SqlWhere + ' AND VO_DELEGACION = ''' + cmbDelegacionPago.FieldValue + '''';
  //-------------------------------------------------------------------------
  if chkConNotaDebito.Checked then
    SqlWhere := SqlWhere + ' AND VO_NOTADEBITO IS NOT NULL';
  //-------------------------------------------------------------------------
  if chkSinCheque.Checked then
    SqlWhere := SqlWhere + ' AND VO_CHEQUE IS NULL';
  //-------------------------------------------------------------------------
  if cpnlAuditado.Checked then  { by NWK, 25/04/03 }
  begin
    if UpperCase(cmbAuditado.Text) = 'SI' then
      SqlWhere := SqlWhere + ' AND VO_AUDITADO = ''S'' '
    else if UpperCase(cmbAuditado.Text) = 'NO' then
      SqlWhere := SqlWhere + ' AND VO_AUDITADO = ''N'' '
    else if UpperCase(cmbAuditado.Text) = 'CON DéBITO' then
      SqlWhere := SqlWhere + ' AND VO_AUDITCONDEBITO = ''S'' '
    else if UpperCase(cmbAuditado.Text) = 'SIN DéBITO' then
      SqlWhere := SqlWhere + ' AND VO_AUDITCONDEBITO = ''N'' ';
  end;
  //-------------------------------------------------------------------------
  if cpnlPendAudit.Checked then
  begin
    if (cmbPendAuditar.ItemIndex = 0) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPAUDIT IS NOT NULL '
    else if (cmbPendAuditar.ItemIndex = 1) then
      SqlWhere := SqlWhere + ' AND VO_FECHARECEPAUDIT IS NULL ';
  end;
  //-------------------------------------------------------------------------
  if cpnlRefacturacion.Checked then  { by NWK, 27/01/04 }
  begin
    if UpperCase(cmbRefacturacion.Text) = 'SI' then
      SqlWhere := SqlWhere + ' AND VO_REFACTURACION = ''S'' '
    else if UpperCase(cmbRefacturacion.Text) = 'NO' then
      SqlWhere := SqlWhere + ' AND VO_REFACTURACION = ''N'' ';
  end;
  //-------------------------------------------------------------------------
  if cpnlAuditorVolante.Visible and cpnlAuditorVolante.Checked then   // TK 11136
    SqlWhere := SqlWhere + ' AND VO_USUAUDITOR = ' + SqlValue(fraUsuAuditorFiltro.edCodigo.text);
  //-------------------------------------------------------------------------
  if cpnlUsuAuditoria.Enabled and cpnlUsuAuditoria.Checked then           // TK 16517
    SqlWhere := SqlWhere + ' AND VO_USUARIOAUDITORIA = ' + SqlValue(fraUsuarioAuditoria.edCodigo.Text);


  SqlTotales :=
    'SELECT FMTNUMBER(SUM(VO_MONTO)), FMTNUMBER(SUM(AMEBPBA.GET_MONTOPAGADO(VO_VOLANTE))), COUNT(*),' +
          ' FMTNUMBER(SUM(IIF_NULL(VO_TIPOPAGO, NULL, amebpba.get_montopagado(vo_volante)))),' +
          ' FMTNUMBER(SUM(VO_FACPEN)), FMTNUMBER(SUM(AMEBPBA.GET_TOTALDEBITO(VO_VOLANTE)))' +
     ' FROM ' +  IIF(tbVerTemporarios.Down, 'TMP_', '') + 'SVO_VOLANTES, CPR_PRESTADOR' +
    ' WHERE CA_IDENTIFICADOR = VO_PRESTADOR ' +
            SqlWhere;

  Sql := Sql + SqlWhere + SortDialog.OrderBy;
  OpenQuery(sdqDatos, Sql, True);

  TFloatField(sdqDatos.FieldByName('VO_MONTO')).Currency    := True;
  TFloatField(sdqDatos.FieldByName('VO_FACPEN')).Currency   := True;
  TFloatField(sdqDatos.FieldByName('MONTOPAGADO')).Currency := True;
  TFloatField(sdqDatos.FieldByName('IMPPAGADO')).Currency   := True;
  TFloatField(sdqDatos.FieldByName('TOTALDEBITO')).Currency := True;

  // Si el Botón de Totales está Clickeado Calcula los Totales
  if tbTotales.Down then
    CalcTotales
  else
  begin
    Tot1 := '';
    Tot2 := '';
    Tot3 := '';
    Tot4 := '';
    Tot5 := '';
    Tot6 := '';
  end;

  Cursor := crDefault;
  MostrarEstado('*');

  if (pnlFechaAuto.Checked = false) or (chkConNotaDebito.Checked = false) or (chkEstado.Checked = false) or
           ((chkEstado.Checked = true) and (cmbEstados.Checked[5] = false) and (cmbEstados.Checked[6] = false) and (cmbEstados.Checked[7] = false)) then
     condicionesND := false
  else
     condicionesND := true;


end;

procedure TfrmConsVol.tbLimpiarClick(Sender: TObject);
begin
  chkNumero.Checked := False;
  chkNumeroClick(nil);

  pnlFecha.Checked              := False;
  pnlFechaAlta.Checked          := False;
  pnlFechaRecep.Checked         := False;
  cpnlFecRecepOrtopedia.Checked := False;
  cpnlFecRecepLiquid.Checked    := False;
  pnlFechaAuto.Checked          := False;
  pnlFechaApro.Checked          := False;
  cpnlFechaAud.Checked          := False;
  cpnlFechaRecepAud.Checked     := False;
  cpnlFechaTerminacion.Checked  := False;

  cpnlFecRecepCentral.Checked := False;
  cpnlFecRecepCentralChange(nil);

  if cpnlAuditorVolante.Visible then
  begin
    cpnlAuditorVolante.Checked := False;
    cpnlAuditorVolanteChange(nil);
  end;

  if cpnlUsuAuditoria.Visible then
  begin
    cpnlUsuAuditoria.Checked := False;
    cpnlUsuAuditoriaChange(nil);
  end;

  chkProvinciaPrestador.Checked := False;
  cmbPrestProvincia.FieldValue := '';
  chkProvinciaPrestadorClick(nil);

  chkPrestador.Checked   := False;
  chkPrestadorClick(nil);

  chkEstado.Checked := False;
  chkEstadoClick(nil);

  chkDelegacion.Checked := False;
  chkDelegacionClick(nil);

  chkDelegacionPago.Checked := False;
  chkDelegacionPagoClick(nil);

  chkNotaDebito.Checked := False;
  chkNotaDebitoClick(nil);

  cpnlVolAjustado.Checked := False;
  cpnlVolAjustadoChange(nil);

  cpnlAuditado.Checked := False;
  cpnlAuditadoChange(nil);

  cpnlRefacturacion.Checked := False;
  cpnlRefacturacionChange(nil);

  cpnlPendAudit.Checked := False;
  cpnlPendAuditChange(nil);

  chkConNotaDebito.Checked := False;
  chkSinCheque.Checked := False;

  cbFechaEnvioNDDesde.Clear;
  cbFechaEnvioNDHasta.Clear;
  pnlFechaEnvioND.Checked := False;

  SqlTotales := '';
  sdqDatos.Close;

end;

procedure TfrmConsVol.tbDetallesClick(Sender: TObject);
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro');
  frmPrincipal.VolDetalle(sdqDatos.FieldByName('VO_VOLANTE').AsInteger);
end;

procedure TfrmConsVol.dbgListadoGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                              Highlight: Boolean);
begin
  if Assigned(Field) then
  begin
    if (UpperCase(Field.FieldName) = 'CA_DESCRIPCION') and (not sdqDatos.FieldByName('CA_FECHABAJA').IsNull) then
      AFont.Color := clRed;

    if tbVerTemporarios.Down then
    begin
      if dbgListado.SelectedRows.CurrentRowSelected then
        Background := clNavy     // Color para la fila seleccionada
      else
      begin
        Background  := clWhite;  // Color de fondo para la fila no seleccionada
        AFont.Color := clBlack;  // Color de la Fuente para la fila no seleccionada
      end;
    end;
  end;

end;

procedure TfrmConsVol.mnuImpResultadosClick(Sender: TObject);
var
  MsgResult: Integer;
begin
  Verificar(not (HayRegistroActivo), nil, 'Debe realizar alguna selección para poder imprimirla.');
  MsgResult := MsgBox('¿ Desea incluir en el listado los filtros de su selección ?', MB_ICONQUESTION + MB_YESNOCANCEL +
                                                                                     MB_DEFBUTTON2);
  if MsgResult <> IDCANCEL then
  begin
    if MsgResult = IDYES then
      MakeSubTitle
    else
      QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.Footer.Text := Sesion.Usuario;
    if PrintDialog.Execute then
      QueryPrint.Print;
  end;
end;

procedure TfrmConsVol.mnuImpVolanteClick(Sender: TObject);
var
  rptVolante: TrptVolante;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  rptVolante := TrptVolante.Create(Self);
  with rptVolante do
  try
    sdqConsulta.ParamByName('pVolante').AsInteger := sdqDatos.FieldByName('vo_volante').AsInteger;
    sdqConsulta.Open;
    PreviewModal;
  finally
    Free;
  end;
end;

procedure TfrmConsVol.mnuImpNotaDebitoClick(Sender: TObject);
begin
  DoGenerarNotaDebito(tsImpresion);
end;

procedure TfrmConsVol.mnuImpDetalleClick(Sender: TObject);
begin
  DoGenerarDetalleAjuste(True);
end;

procedure TfrmConsVol.tbOrdenClick(Sender: TObject);
begin
  SortDialog.Execute;
end;

procedure TfrmConsVol.tbCancelarClick(Sender: TObject);
begin
  tbCancelar.CheckMenuDropdown;
end;

procedure TfrmConsVol.dbgListadoPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                            FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  if Column = 'IMPPAGADO' then
    Value := Tot4
  else if Column = 'VO_VOLANTE' then
    Value := Tot3
  else if Column = 'VO_MONTO' then
    Value := Tot1
  else if Column = 'MONTOPAGADO' then
    Value := Tot2
  else if Column = 'VO_FACPEN' then
    Value := Tot5
  else if Column = 'TOTALDEBITO' then
    Value := Tot6;
end;

procedure TfrmConsVol.tbTotalesClick(Sender: TObject);
begin
  if tbTotales.Down and (Tot1 = '') and (SqlTotales <> '') then
    CalcTotales
  else
  begin
    Tot1 := '';
    Tot2 := '';
    Tot3 := '';
    Tot4 := '';
    Tot5 := '';
    Tot6 := '';
  end;
  dbgListado.FooterBand := tbTotales.Down;
end;

procedure TfrmConsVol.CalcTotales;
var
  sTotales: TStringList;
begin
  sTotales := ValoresColSql(SqlTotales);
  if sTotales.Count > 0 then
  begin
    Tot1 := sTotales[0];
    Tot2 := sTotales[1];
    Tot3 := sTotales[2];
    Tot4 := sTotales[3];
    Tot5 := sTotales[4];
    Tot6 := sTotales[5];
  end
  else
  begin
    Tot1 := '';
    Tot2 := '';
    Tot3 := '';
    Tot4 := '';
    Tot5 := '';
    Tot6 := '';
  end;
end;

procedure TfrmConsVol.chkDelegacionClick(Sender: TObject);
begin
  if chkDelegacion.Checked then
  begin
    pnlDelegacion.Enabled := True;
    cmbDelegacion.SetFocus;
    cmbDelegacion.DoDropDown;
  end
  else begin
    pnlDelegacion.Enabled    := False;
    cmbDelegacion.FieldValue := '';
  end;
end;

procedure TfrmConsVol.chkDelegacionPagoClick(Sender: TObject);
begin
  if chkDelegacionPago.Checked then
  begin
    pnlDelegacionPago.Enabled := True;
    cmbDelegacionPago.SetFocus;
    cmbDelegacionPago.DoDropDown;
  end
  else begin
    pnlDelegacionPago.Enabled    := False;
    cmbDelegacionPago.FieldValue := '';
   end;
end;

procedure TfrmConsVol.chkProvinciaPrestadorClick(Sender: TObject);
begin
  if chkProvinciaPrestador.Checked then
  begin
    pnlProvinciaPrestador.Enabled := True;
    cmbPrestProvincia.SetFocus;
    cmbPrestProvincia.DoDropDown;
  end
  else begin
    pnlProvinciaPrestador.Enabled := False;
    cmbPrestProvincia.FieldValue  := '';
  end;
end;

{---[ Muestra la ventana con los Totales por Estado ]---------------------------}
procedure TfrmConsVol.tbTotPorEstadoClick(Sender: TObject);
begin
  sdqTotPorEstado.Close;
  sdqTotPorEstado.SQL.Text :=
    'SELECT tb_codigo estado, tb_descripcion, COUNT(*) cantidad, FMTNUMBER(SUM(vo_monto)) MONTO' +
     ' FROM ' +  IIF(tbVerTemporarios.Down, 'TMP_', '') + 'svo_volantes, ctb_tablas, cpr_prestador' +
    ' WHERE tb_clave = ''MUVOL''' +
      ' AND tb_codigo = vo_estado' +
      ' AND ca_identificador = vo_prestador' +
            SqlWhere +
 ' GROUP BY tb_codigo,tb_descripcion' +
 ' ORDER BY COUNT(*) DESC';
 
  sdqTotPorEstado.Open;
  if not sdqTotPorEstado.IsEmpty then
    ludTotPorEstado.Execute;
end;

procedure TfrmConsVol.QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  try
    if Field.DataField = 'VO_MONTO' then
      Value := Tot1
    else if Field.DataField = 'MONTOPAGADO' then
      Value := Tot2
    else if Field.DataField = 'IMPPAGADO' then
      Value := Tot4
    else if Field.DataField = 'VO_VOLANTE' then
      Value := Tot3
    else if Field.DataField = 'VO_FACPEN' then
      Value := Tot5
    else if Field.DataField = 'TOTALDEBITO' then
      Value := Tot6;
  except
    MsgBox('Error al Asignar los Totales al Reporte.', MB_ICONERROR, 'Consulta de Volante')
  end;
end;

procedure TfrmConsVol.edNumHastaEnter(Sender: TObject);
begin
 // Lu 17/04/2008 Comento lo que sigue por el Work 7324. (Se pide que al tabular desde el campo Desde, se copie el mismo numero en el Hasta.

 { if edNumHasta.Tag = 0 then
  begin
    edNumHasta.Tag := ValorSql('SELECT MAX(VO_VOLANTE) FROM ' +  IIF(tbVerTemporarios.Down, 'TMP_', '') + 'SVO_VOLANTES');
  end;

  if edNumHasta.Text = '' then
  begin
    edNumHasta.Text := IntToStr(edNumHasta.Tag);
    edNumHasta.SelectAll;
  end;     }
end;

procedure TfrmConsVol.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsVol.tbDesAprobarClick(Sender: TObject);
var
  sOldEstado, sNewEstado, Sql: String;
  iVolante :Integer;
begin
  sOldEstado := sdqDatos.FieldByName('VO_ESTADO').AsString;
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro');
  Verificar(not AreIn(sOldEstado, ['A', 'AP', 'AM', 'AAM', 'AAG']), nil,
            'No se puede desaprobar el volante porque su estado no es "Aprobado", ' +
            '"Aprobado Genérico", "Aprobado mixto" ó "Aprobado AMP".');
  if MsgAsk('¿Confirma que desea desaprobar el volante seleccionado?') then
  try
    if sOldEstado = 'A' then
      sNewEstado := 'L'
    else
      if sOldEstado = 'AAM' then
        sNewEstado := 'LAM'
      else
        if sOldEstado = 'AP' then
          sNewEstado := 'LG'
        else
          if sOldEstado = 'AAG' then
            sNewEstado := 'LAG'
          else
            sNewEstado := 'LM';

    iVolante   := sdqDatos.FieldByName('VO_VOLANTE').AsInteger;

    BeginTrans;

    Sql := 'UPDATE svo_volantes' +
             ' SET vo_usuapro = NULL,' +
                 ' vo_fechapro = NULL,' +
                 ' vo_notadebito = NULL,' +
                 ' vo_porboni = NULL,' +
                 ' vo_montoboni = 0,' +
                 ' vo_estado = ' + SqlValue(sNewEstado) + ',' +
                 ' vo_usuliqui = ' + SqlValue(Sesion.UserID) + ',' + //esto es más que nada para que se pueda
                 ' vo_fechaliqui = ActualDate ' +                    //guardar correctamente el historico de estados... 
           ' WHERE vo_volante = ' + SqlInt(iVolante);
    EjecutarSqlST(Sql);

    // Anulación AMP
    if AreIn(sNewEstado, ['LAM']) then
    begin
      Sql := 'DELETE FROM sif_itemfacturaamp' +
             ' WHERE if_idvolante = ' + SqlInt(iVolante) +
               ' AND if_valorfacturado < 0 ' +
               ' AND if_estado <> ''Z'' ';
      EjecutarSqlST(Sql);

      Sql := 'UPDATE sif_itemfacturaamp' +
               ' SET if_estado = ''P''' +
             ' WHERE if_idvolante = ' + SqlInt(iVolante) +
               ' AND if_estado NOT IN (''X'', ''Z'') ';
      EjecutarSqlST(Sql);
    end;

    if AreIn(sNewEstado, ['L', 'LM']) then
    begin
      Sql := 'DELETE FROM siv_itemvolante' +
             ' WHERE iv_volante = ' + SqlInt(iVolante) +
               ' AND iv_impfacturado < 0 ' +
               ' AND iv_estado <> ''Z'' ';
      EjecutarSqlST(Sql);
    end;

    if AreIn(sNewEstado, ['LG', 'LM']) then
    begin
      Sql := 'DELETE FROM svg_vol_generico' +
             ' WHERE vg_volante = ' + SqlInt(iVolante) +
               ' AND vg_impfacturado < 0';
      EjecutarSqlST(Sql);
    end;

    if AreIn(sNewEstado, ['L', 'LM']) then
    begin
      Sql := 'UPDATE siv_itemvolante' +
               ' SET iv_estado = ''P''' +
             ' WHERE iv_volante = ' + SqlInt(iVolante) +
               ' AND iv_estado NOT IN (''X'', ''Z'') ';
      EjecutarSqlST(Sql);
    end;

    if AreIn(sNewEstado, ['LG', 'LM']) then
    begin
      Sql := 'UPDATE svg_vol_generico' +
               ' SET vg_estado = ''P''' +
             ' WHERE vg_volante = ' + SqlInt(iVolante) +
               ' AND vg_estado <> ''X''';
      EjecutarSqlST(Sql);
    end;

    DoInsertarRegAuditLog('CONSVOL', 'DESAPROBAR',
                           SqlString('"' + sdqDatos.FieldByName('VO_VOLANTE').AsString + '";"' +
                                           sdqDatos.FieldByName('VO_USUAPRO').AsString  + '";"' +
                                          sdqDatos.FieldByName('VO_FECHAPRO').AsString  + '";"' +
                                          sdqDatos.FieldByName('VO_NOTADEBITO').AsString  + '"', True),
                           False, 'REDPRES');

    CommitTrans;
    tbRefrescarClick(nil);
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Error al Desaprobar el Volante.');
      Rollback(True);
    end;
  end;
end;

procedure TfrmConsVol.tbReasignarAuditClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  Verificar(sdqDatos.FieldByName('vo_estado').AsString <> 'D7', nil,
            'El volante seleccionado debe tener estado "Derivado Auditoría Médica".');

  if (MessageDlg('¿Confirma la reasignación del volante?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    sSql := 'UPDATE svo_volantes' +
              ' SET vo_fecharecepaudit = NVL(vo_fecharecepaudit, actualdate),' +
                  ' vo_fechamodif = actualdate,' +
                  ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' vo_fechaavaldebito = Null, ' +
                  ' vo_usuavaldebito = Null, ' +
                  ' vo_estado = ''PA''' +
            ' WHERE vo_volante = ' + SqlInt(sdqDatos.FieldByName('vo_volante').AsInteger);
    EjecutarSql(sSql);
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmConsVol.tbCtaCteClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to dbgListado.Columns.Count - 1 do
    if ArrayPos(dbgListado.Columns[i].FieldName, ['VO_ORDENPAGO', 'TP_DESCRIPCION', 'FECHACHEQUE', 'VO_CHEQUE', 'IMPPAGADO']) > -1 then
    begin
      QueryPrint.FieldByName[dbgListado.Columns[i].FieldName].Visible := tbCtaCte.Down;
      ExportDialog.FieldbyName[dbgListado.Columns[i].FieldName].Save  := tbCtaCte.Down;
      dbgListado.Columns[i].Visible := tbCtaCte.Down;
      if tbCtaCte.Down and (dbgListado.Columns[i].Width > 300) then
        dbgListado.Columns[i].Width := 300;
    end;
end;

procedure TfrmConsVol.mnuImpResMontosySaldosClick(Sender: TObject);
  procedure GetSqlValues(ASql: String; var Val1: Integer; var Val2: Currency);
  begin
    with dmPrincipal.sdqConsulta do
    begin
      Close;
      CopySqlClp(ASql + SqlWhere);
      Sql.Text := ASql + SqlWhere;
      Open;
      if IsEmpty then
      begin
        Val1 := 0;
        Val2 := 0;
      end
      else
      begin
        Val1 := Fields[0].AsInteger;
        Val2 := Fields[1].AsCurrency;
      end;
    end;
  end;

var
  Cant: Array[1..11] of Integer;
  i: Integer;
  rptResMontosSaldos: TrptResMontosSaldos;
  Sql: String;
  Tot: Array[1..11] of Currency;
begin
  if not chkPrestador.Checked then
    MsgBox('Debe filtrar el listado por prestador poder generar este reporte.', MB_ICONEXCLAMATION)
  else
  begin
    rptResMontosSaldos :=  TrptResMontosSaldos.Create(Self);
    with rptResMontosSaldos do
    begin
      qrlPrestRSocial.Caption := fraPrestador.RazonSocial;
      qrlPrestID.Caption      := IntToStr(fraPrestador.IDPrestador);
      qrlPrestCUIT.Caption    := PonerGuiones(fraPrestador.Cuit);
      qrlUsuario.Caption      := Sesion.Usuario;
    end;

    for i := 1 to 11 do
    begin
      Sql := '';
      case i of
        1:  Sql := 'SELECT count(*), sum(vo_monto)' +
                    ' FROM svo_volantes' +
                   ' WHERE vo_prestador = ' + SqlValue(fraPrestador.IDPrestador) +
                     ' AND vo_estado NOT IN (''C'')';

        2:  Sql := 'SELECT count(*), sum(vo_monto)' +
                    ' FROM svo_volantes' +
                   ' WHERE vo_prestador = ' + SqlValue(fraPrestador.IDPrestador) +
                     ' AND vo_estado NOT IN (''C'', ''P'')';

        3:
        begin
          Cant[i] := Cant[1] - Cant[2];
          Tot[i]  := Tot[1]  - Tot[2];
        end;

        4:  Sql := 'SELECT count(*), sum(vo_monto)' +
                    ' FROM svo_volantes' +
                   ' WHERE vo_prestador = ' + SqlValue(fraPrestador.IDPrestador) +
                     ' AND vo_estado IN (''A'', ''AP'', ''E'', ''EG'')';

        5:  Sql := 'SELECT 0, sum(abs(AMEBPBA.imp_negativo(vo_volante)) + abs(AMEBPBA.imp_negativo_gen(vo_volante)) + vo_montoboni)' +
                    ' FROM svo_volantes' +
                   ' WHERE vo_prestador = ' + SqlValue(fraPrestador.IDPrestador) +
                     ' AND vo_estado IN (''A'', ''AP'', ''E'', ''EG'')';

        6:  Tot[6] := Tot[4] - Tot[5];

        7:
        begin
          Cant[i] := Cant[2] - Cant[4];
          Tot[i]  := Tot[2]  - Tot[4];
        end;

        8:  Sql := 'SELECT count(*), sum(AMEBPBA.get_montopagado(vo_volante))' +
                    ' FROM svo_volantes' +
                   ' WHERE vo_prestador = ' + SqlValue(fraPrestador.IDPrestador) +
                     ' AND vo_estado IN (''E'', ''EG'')';

        9:
        begin
          Cant[i] := Cant[4] - Cant[8];
          Tot[i]  := Tot[6]  - Tot[8];
        end;

        10: Sql := 'SELECT count(*), sum(AMEBPBA.get_montopagado(vo_volante))' +
                    ' FROM svo_volantes' +
                   ' WHERE vo_prestador =  ' + SqlValue(fraPrestador.IDPrestador) +
                     ' AND vo_estado IN (''E'', ''EG'')' +
                     ' AND vo_tipopago IS NOT NULL';

        11:
        begin
          Cant[i] := Cant[8] - Cant[10];
          Tot[i]  := Tot[8]  - Tot[10];
        end;
      end;

      if Sql <> '' then
        GetSqlValues(Sql, Cant[i], Tot[i]);

      rptResMontosSaldos.SetValue(i, Cant[i], Tot[i]);
    end;

    // Imprimir
    rptResMontosSaldos.PreviewModal;
    rptResMontosSaldos.Free;
  end;
end;

procedure TfrmConsVol.edNotaDebitoHastaEnter(Sender: TObject);
begin
  if (edNotaDebitoHasta.Text = '') and (edNotaDebitoDesde.Text <> '') then
  begin
    edNotaDebitoHasta.Text := edNotaDebitoDesde.Text;
    edNotaDebitoHasta.SelectAll;
  end;
end;

procedure TfrmConsVol.MakeSubTitle;
begin
  with QueryPrint.SubTitle.Lines do
  begin
    Clear;
    Add('Filtros:');
    //--------------------------------------------------------------------------
    if chkNumero.Checked then
      if (edNumDesde.Text <> '') and (edNumHasta.Text <> '') then
        Add('Siniestros entre ' + edNumDesde.TextSql + ' y ' + edNumHasta.TextSql)
      else if (edNumDesde.Text <> '') then
        Add('Siniestros mayores a ' + edNumDesde.TextSql)
      else if (edNumHasta.Text <> '') then
        Add('Siniestros menores a ' + edNumHasta.TextSql);
    //--------------------------------------------------------------------------
    if pnlFecha.Checked then
      if (deFechaDesde.Date <> 0) and (deFechaHasta.Date <> 0) then
        Add('Fecha de la Factura entre el ' + deFechaDesde.Text + ' y el ' + deFechaHasta.Text)
      else if (deFechaDesde.Date <> 0) then
        Add('Fecha de la Factura mayor al ' + deFechaDesde.Text)
      else if (deFechaHasta.Date <> 0) then
        Add('Fecha de la Factura menor al ' + deFechaHasta.Text);
    //--------------------------------------------------------------------------
    if pnlFechaRecep.Checked then
      if (deFechaRecepDesde.Date <> 0) and (deFechaRecepHasta.Date <> 0) then
        Add('Fecha de Recepción entre el ' + deFechaRecepDesde.Text + ' y el ' + deFechaRecepHasta.Text)
      else if (deFechaRecepDesde.Date <> 0) then
        Add('Fecha de Recepción mayor al ' + deFechaRecepDesde.Text)
      else if (deFechaRecepHasta.Date <> 0) then
        Add('Fecha de Recepción menor al ' + deFechaRecepHasta.Text);
    //--------------------------------------------------------------------------
    if pnlFechaVenc.Checked then
      if (deFechaVencDesde.Date <> 0) and (deFechaVencHasta.Date <> 0) then
        Add('Fecha de Vencimiento de la Factura entre el ' + deFechaVencDesde.Text + ' y el ' + deFechaVencHasta.Text)
      else if (deFechaVencDesde.Date <> 0) then
        Add('Fecha de la Factura mayor al ' + deFechaVencDesde.Text)
      else if (deFechaVencHasta.Date <> 0) then
        Add('Fecha de la Factura menor al ' + deFechaVencHasta.Text);
    //--------------------------------------------------------------------------
    if pnlFechaAlta.Checked then
      if (deFechaAltaDesde.Date <> 0) and (deFechaAltaHasta.Date <> 0) then
        Add('Fecha de Alta entre el ' + deFechaAltaDesde.Text + ' y el ' + deFechaAltaHasta.Text)
      else if (deFechaAltaDesde.Date <> 0) then
        Add('Fecha de Alta mayor al ' + deFechaAltaDesde.Text)
      else if (deFechaAltaHasta.Date <> 0) then
        Add('Fecha de Alta menor al ' + deFechaAltaHasta.Text);
    //--------------------------------------------------------------------------
    if pnlFechaApro.Checked then
      if (deFechaAproDesde.Date <> 0) and (deFechaAproHasta.Date <> 0) then
        Add('Fecha de Aprobación entre el ' + deFechaAproDesde.Text + ' y el ' + deFechaAproHasta.Text)
      else if (deFechaAproDesde.Date <> 0) then
        Add('Fecha de Aprobación mayor al ' + deFechaAproDesde.Text)
      else if (deFechaAproHasta.Date <> 0) then
        Add('Fecha de Aprobación menor al ' + deFechaAproHasta.Text)
      else
        Add('Fecha de Aprobación distinta de Nulo ');
    //--------------------------------------------------------------------------
    if cpnlFecRecepCentral.Checked then
    begin
      if (deFechaRecCentDesde.Date <> 0) and (deFechaRecCentHasta.Date <> 0) then
        Add('Fecha de Recepción en Central entre el ' + deFechaRecCentDesde.Text + ' y ' + deFechaRecCentHasta.Text)
      else if (deFechaRecCentDesde.Date <> 0) then
        Add('Fecha de Recepción en Central mayor al ' + deFechaRecCentDesde.Text)
      else if (deFechaRecCentHasta.Date <> 0) then
        Add('Fecha de Recepción en Central menor al ' + deFechaRecCentHasta.Text)
      else
        Add('Fecha de Recepción en Central no nula ');
    end;
    //--------------------------------------------------------------------------
    if cpnlFecRecepOrtopedia.Checked then
    begin
      if (deFechaRecOrtDesde.Date <> 0) and (deFechaRecOrtHasta.Date <> 0) then
        Add('Fecha de Revisión de CP entre el ' + deFechaRecOrtDesde.Text + ' y ' + deFechaRecOrtHasta.Text)
      else if (deFechaRecOrtDesde.Date <> 0) then
        Add('Fecha de Revisión de CP mayor al ' + deFechaRecOrtDesde.Text)
      else if (deFechaRecOrtHasta.Date <> 0) then
        Add('Fecha de Revisión de CP menor al ' + deFechaRecOrtHasta.Text)
      else
        Add('Fecha de Revisión de CP no nula ');
    end;
    //--------------------------------------------------------------------------
    if cpnlFecRecepLiquid.Checked then
    begin
      if (deFechaRecLiqDesde.Date <> 0) and (deFechaRecLiqHasta.Date <> 0) then
        Add('Fecha de Recepción en Liquidaciones entre el ' + deFechaRecLiqDesde.Text + ' y ' + deFechaRecLiqDesde.Text)
      else if (deFechaRecLiqDesde.Date <> 0) then
        Add('Fecha de Recepción en Liquidaciones mayor al ' + deFechaRecLiqDesde.Text)
      else if (deFechaRecLiqHasta.Date <> 0) then
        Add('Fecha de Recepción en Liquidaciones menor al ' + deFechaRecLiqHasta.Text)
      else
        Add('Fecha de Recepción en Liquidaciones no nula ');
    end;
    //--------------------------------------------------------------------------
    if pnlFechaAuto.Checked then
      if (deFechaAutoDesde.Date <> 0) and (deFechaAutoHasta.Date <> 0) then
        Add('Fecha de Autorización entre el ' + deFechaAutoDesde.Text + ' y el ' + deFechaAutoHasta.Text)
      else if (deFechaAutoDesde.Date <> 0) then
        Add('Fecha de Autorización mayor al ' + deFechaAutoDesde.Text)
      else if (deFechaAutoHasta.Date <> 0) then
        Add('Fecha de Autorización menor al ' + deFechaAutoHasta.Text)
      else
        Add('Fecha de Autorización distinta de Nulo ');
    //--------------------------------------------------------------------------
    if cpnlFechaAud.Checked then
      if (deFechaAudDesde.Date <> 0) and (deFechaAudHasta.Date <> 0) then
        Add('Fecha de Auditoría entre el ' + deFechaAudDesde.Text + ' y el ' + deFechaAudHasta.Text)
      else if (deFechaAudDesde.Date <> 0) then
        Add('Fecha de Auditoría mayor al ' + deFechaAudDesde.Text)
      else if (deFechaAudHasta.Date <> 0) then
        Add('Fecha de Auditoría menor al ' + deFechaAudHasta.Text)
      else
        Add('Fecha de Auditoría distinta de Nulo ');
    //--------------------------------------------------------------------------
    if pnlFechaAuto.Checked then
      if (deFechaRecepAudDesde.Date <> 0) and (deFechaRecepAudHasta.Date <> 0) then
        Add('Fecha de Recepción de Auditoría entre el ' + deFechaRecepAudDesde.Text + ' y el ' + deFechaRecepAudHasta.Text)
      else if (deFechaRecepAudDesde.Date <> 0) then
        Add('Fecha de Recepción de Auditoría mayor al ' + deFechaRecepAudDesde.Text)
      else if (deFechaRecepAudHasta.Date <> 0) then
        Add('Fecha de Recepción de Auditoría menor al ' + deFechaRecepAudHasta.Text)
      else
        Add('Fecha de Recepción de Auditoría distinta de Nulo ');
    //--------------------------------------------------------------------------
    if (fraPrestador.IDPrestador <> 0) then
      Add('Prestador ' + fraPrestador.RazonSocial);
    //--------------------------------------------------------------------------
    if cmbPrestProvincia.FieldValue <> '' then
      Add('Pcia. del Prestador ' + cmbPrestProvincia.Text);
    //--------------------------------------------------------------------------
    if chkEstado.Checked  then
      Add('Estado ' + cmbEstados.Text);
    //--------------------------------------------------------------------------
    if cpnlVolAjustado.Checked then
      Add('Volante Ajustado ' + edVolAjustado.Text);
    //--------------------------------------------------------------------------
    if chkNotaDebito.Checked then
      if (edNotaDebitoDesde.Text <> '') and (edNotaDebitoHasta.Text <> '') then
        Add('Nota de Débito entre ' + edNotaDebitoDesde.TextSql + ' y ' + edNotaDebitoHasta.TextSql)
      else if (edNotaDebitoDesde.Text <> '') then
        Add('Nota de Débito mayor a ' + edNotaDebitoDesde.TextSql)
      else if (edNotaDebitoHasta.Text <> '') then
        Add('Nota de Débito menor a ' + edNotaDebitoHasta.TextSql)
      else
        Add('Con nota de débito');
    //--------------------------------------------------------------------------
    if chkDelegacion.Checked then
      Add('Delegación de la Carga ' + cmbDelegacion.Text);
    //--------------------------------------------------------------------------
    if chkDelegacionPago.Checked then
      Add('Delegación del Pago ' + cmbDelegacionPago.Text);
    //--------------------------------------------------------------------------
    if chkConNotaDebito.Checked then
      Add('Con Nota de Débito ');
    //--------------------------------------------------------------------------
    if chkSinCheque.Checked then
      Add('Sin Cheque ');
    //--------------------------------------------------------------------------
    if cpnlAuditado.Checked then
      Add('Auditado: ' + cmbAuditado.Text);
    //--------------------------------------------------------------------------
    if cpnlPendAudit.Checked then
      Add('Pendientes de auditar: ' + cmbPendAuditar.Text);
    //--------------------------------------------------------------------------
    if cpnlRefacturacion.Checked then
      Add('Refacturación: ' + cmbRefacturacion.Text);
    //--------------------------------------------------------------------------
  end;
end;

procedure TfrmConsVol.mnuImpTodasNotaDebitoClick(Sender: TObject);
var
  iCant: Integer;
  Tipo: TTipoNota;
  Reporte1 : TrptNotaDebito;
  Reporte2 : TrptNDAMP;
  NotaAMP : boolean;
begin
  iCant := 0; // Para evitar el Hit
  if  (not sdqDatos.IsEmpty) and (MsgBox('ATENCIÓN:' + #13 + '     Se dispone a imprimir Todas las notas de débito de los volantes consultados.' + #13 +
                                    '     ¿Desea Continuar?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2, 'Confirmar la Operación') = IDYES) then
  begin
    Reporte1 := TrptNotaDebito.Create(Self);
    Reporte2 := TrptNDAMP.Create(Self);

    try
      Reporte1.PrinterSetup;

      sdqDatos.First;
      while not sdqDatos.Eof do
      begin
        if not sdqDatos.FieldByName('VO_NOTADEBITO').IsNull then
        begin
          NotaAMP := false;
          Tipo := tnGenerica;

          if ExisteSqlEx(sSqlNor, [sdqDatos.FieldByName('VO_VOLANTE').AsString]) then
            Tipo := tnNormal
          else
            if ExisteSqlEx(sSqlAMP, [sdqDatos.FieldByName('VO_VOLANTE').AsString]) then
              NotaAMP := true;

          Inc(iCant);

          case NotaAMP of
            true: if not Reporte2.ImprimirNDAMP(StrToInt('0' + sdqDatos.FieldByName('VO_VOLANTE').AsString), trAMPPrint) then
                    if MsgBox('¿Desea Cancelar la Impresión?', MB_ICONQUESTION + MB_YESNO) = IDYES then
                      Break;
            else  if not Reporte1.Imprimir(sdqDatos.FieldByName('vo_volante').AsInteger, Tipo, trPrint) then
                    if MsgBox('¿Desea Cancelar la Impresión?', MB_ICONQUESTION + MB_YESNO) = IDYES then
                      Break;
          end
        end;

        sdqDatos.Next;
      end;
    finally
      Reporte1.Free;
      Reporte2.Free;

      MsgBox('Se imprimieron ' + IntToStr(iCant) + ' Notas de Débito', MB_ICONINFORMATION, 'Resultado');
    end
  end
end;

procedure TfrmConsVol.tbExportarClick(Sender: TObject);
begin
  tbExportar.CheckMenuDropdown;  // Lu TK 6093
end;

procedure TfrmConsVol.mnuExportarGrillaClick(Sender: TObject);
begin
  ExportDialog.Execute;
end;

procedure TfrmConsVol.mnuExportarNotaDebitoClick(Sender: TObject);  // Lu TK 6093
begin
  DoGenerarNotaDebito(tsExportacion);
end;

procedure TfrmConsVol.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
                                              var ABackground: TColor; var AAlignment: TAlignment);
begin
  if AreIn(Field.DataField , ['VO_ORDENPAGO', 'TP_DESCRIPCION', 'FECHACHEQUE', 'VO_CHEQUE', 'IMPPAGADO']) then
    ABackground := $00F8F8F8 //$00CDCDCD
  else if (Field.DataField = 'CA_DESCRIPCION') and (not sdqDatos.FieldByName('CA_FECHABAJA').IsNull) then
    AFont.Style := [fsStrikeOut]
  else if (Field.DataField = 'TOTALDEBITO') and (sdqDatos.FieldByName('TOTALDEBITO').Value = 0) then
    AText := '';
end;

procedure TfrmConsVol.tbVencimientoEgresosSemClick(Sender: TObject);
begin
  fpVencimientoEgSem.ShowModal;
end;

procedure TfrmConsVol.tbVerTemporariosClick(Sender: TObject);
begin
  sdqDatos.Close;
  edNumHasta.Tag := 0;
  if tbVerTemporarios.Down then
  begin
    tbCancelar.Enabled            := False;
    tbDesAprobar.Enabled          := False;
    tbDetalles.Enabled            := False;
    tbImprimir.Enabled            := False;
    tbEnviarMail.Enabled          := False;
    tbExportar.Enabled            := False;
    tbAuditoria.Enabled           := False;
    tbAuditoriaOrtopedia.Enabled  := False;
    tbMarcarNoAuditable.Enabled   := False;
    tbDerivar.Enabled             := False;
    tbReasignar.Enabled           := False;
    tbReasignarAudit.Enabled      := False;
    tbFechaTerm.Enabled           := False;
    tbPasarTemporarios.Enabled    := Seguridad.Activar(tbPasarTemporarios);
    mnuTmpPasarSeleccion.Enabled  := Seguridad.Activar(mnuTmpPasarSeleccion);
    mnuTmpPasarTodos.Enabled      := Seguridad.Activar(mnuTmpPasarTodos);
    tbEliminarTemporarios.Enabled := Seguridad.Activar(tbEliminarTemporarios);
    //tbImpExpTemporarios.Enabled   := Seguridad.Activar(tbImpExpTemporarios);
    dbgListado.Options            := dbgListado.Options + [dgRowSelect, dgMultiSelect];
    dbgListado.PopupMenu          := pMnuTmp;
    cpnlFechaTraspaso.Checked     := false;
    cpnlFechaTraspaso.Enabled     := false;
    mnuReimprimirTemp.Enabled     := true;
  end
  else
  begin
    tbCancelar.Enabled            := Seguridad.Activar(tbCancelar);
    tbDesAprobar.Enabled          := Seguridad.Activar(tbDesAprobar);
    tbFechaTerm.Enabled           := Seguridad.Activar(tbFechaTerm);
    tbDetalles.Enabled            := Seguridad.Activar(tbDetalles);
    tbImprimir.Enabled            := Seguridad.Activar(tbImprimir);
    tbEnviarMail.Enabled          := Seguridad.Activar(tbEnviarMail);
    tbExportar.Enabled            := Seguridad.Activar(tbExportar);
    tbAuditoria.Enabled           := Seguridad.Activar(tbAuditoria);
    tbAuditoriaOrtopedia.Enabled  := Seguridad.Activar(tbAuditoriaOrtopedia);
    tbMarcarNoAuditable.Enabled   := Seguridad.Activar(tbMarcarNoAuditable);
    tbDerivar.Enabled             := Seguridad.Activar(tbDerivar);
    tbReasignar.Enabled           := Seguridad.Activar(tbReasignar);
    tbReasignarAudit.Enabled      := Seguridad.Activar(tbReasignarAudit);
    tbPasarTemporarios.Enabled    := False;
    tbEliminarTemporarios.Enabled := False;
    //tbImpExpTemporarios.Enabled   := False;
    dbgListado.Options            := dbgListado.Options - [dgRowSelect, dgMultiSelect];
    dbgListado.PopupMenu          := pMnuImpresiones;
    cpnlFechaTraspaso.Enabled     := true;
    mnuReimprimirTemp.Enabled     := false;
  end;
end;

procedure TfrmConsVol.SeguridadAfterExecute(Sender: TObject);
begin
//  Sep5.Visible                  := tbVerTemporarios.Enabled;
  tbVerTemporarios.Visible      := tbVerTemporarios.Enabled;
  tbPasarTemporarios.Visible    := tbVerTemporarios.Enabled;
  tbEliminarTemporarios.Visible := tbVerTemporarios.Enabled;
  tbImpExpTemporarios.Visible   := tbVerTemporarios.Enabled;
end;

procedure TfrmConsVol.mnuTmpPasarSeleccionClick(Sender: TObject);
var
  FechaServer: TDateTime;
  i          : Integer;  
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  FechaServer := DBDateTime;
  for i := 0 to dbgListado.SelectedRows.Count - 1 do
  begin
    sdqDatos.GotoBookmark(Pointer(dbgListado.SelectedRows.Items[i]));
    if not PasarVolante(sdqDatos.FieldByName('VO_VOLANTE').AsInteger, FechaServer) then
      Break;
  end;

  tbRefrescarClick(nil);
  ReporteTraspasos('IMPRIMIR', True, False, FechaServer);
end;

procedure TfrmConsVol.mnuTmpPasarTodosClick(Sender: TObject);
var
  FechaServer: TDateTime;
begin
  Verificar(not (HayRegistroActivo), nil, 'Debe realizar alguna selección.');
  FechaServer := DBDateTime;
  sdqDatos.First;
  repeat
    if not PasarVolante(sdqDatos.FieldByName('VO_VOLANTE').AsInteger, FechaServer) then
      Break;
    sdqDatos.Next;
  until sdqDatos.Eof;

  tbRefrescarClick(nil);
  ReporteTraspasos('IMPRIMIR', True, False, FechaServer);
end;

function TfrmConsVol.PasarVolante(AVolOrigen: Integer; AFecha: TDateTime): Boolean;
const
  msgError = 'No se ha podido guardar los cambios a causa del siguiente error:' + #13;
var
  AVolDestino: Integer;
  flgGraba: Boolean;
  rptVolante: TrptVolante;
  sEstado, sEstadoPend, sSql: String;
  vencimiento: TDateTime;
begin
  Result      := False;
  flgGraba    := False;
  sEstadoPend := '';
  sSql := 'SELECT 1' +
           ' FROM svo_volantes, cpr_prestador' +
          ' WHERE vo_prestador = ca_identificador' +
            ' AND vo_facturatipo = ' + SqlValue(sdqDatos.FieldByName('vo_facturatipo').AsString) +
            ' AND vo_facturaestable = ' + SqlValue(sdqDatos.FieldByName('vo_facturaestable').AsString) +
            ' AND vo_facturanro = ' + SqlValue(sdqDatos.FieldByName('vo_facturanro').AsString) +
            ' AND ca_clave = ' + SqlValue(sdqDatos.FieldByName('ca_clave').AsString) +
            ' AND vo_volante <> ' + SqlInt(sdqDatos.FieldByName('vo_ajuste').AsString) +
            ' AND vo_estado NOT IN (''C'',''X'',''Z'') ';

  if ExisteSql(sSql) then
    MsgBox('Ya existe un volante para la factura ' +
           sdqDatos.FieldByName('vo_facturatipo').AsString + '-' +
           sdqDatos.FieldByName('vo_facturaestable').AsString + '-' +
           sdqDatos.FieldByName('vo_facturanro').AsString + '-' +
           ' para el prestador ' + sdqDatos.FieldByName('vo_prestador').AsString +
           ' (' + sdqDatos.FieldByName('ca_descripcion').AsString + ')', MB_ICONINFORMATION, 'Registro Duplicado')
  else
  begin
    rptVolante := TrptVolante.Create(Self);
    try
      // Se hace un Repeat-Until hasta que el MAX(vo_volante)+1 devuelva un numero de volante
      // que se pueda grabar controlando el error de PK.
      repeat
        AVolDestino := IncSql('SELECT MAX(vo_volante) FROM svo_volantes');
        MostrarEstado('Creando Volante Nro ' + IntToStr(AVolDestino));

        if not(ShowPrestadores) or not (ValidarTipoComprobante(iPrestador, AVolOrigen)) then
          Exit;

        if Is_EspecialidadPrestadorOrtopedia(iPrestador) then
        begin
          sEstado     := 'P';     // TK 21282
          sEstadoPend := 'PO';
        end
        else if (Get_PrestadorAuditable(iPrestador) = 'S') then
          sEstado := 'PA'
        else
          sEstado := '';

        vencimiento := ValorSqlDateTimeEx('SELECT amebpba.calcdiascorridos(actualdate, ca_diasvenci)' +
                                           ' FROM cpr_prestador ' +
                                          ' WHERE ca_identificador = :prest', [iPrestador]);
        try
          BeginTrans;
          sSql := 'INSERT INTO svo_volantes ' +
                  '(vo_volante, vo_prestador, vo_facturatipo, vo_facturaestable, vo_facturanro,' +
                  ' vo_fechafactura, vo_monto, vo_vencimiento, vo_montobruto, vo_observaciones, vo_usualta,' +
                  ' vo_fechalta, vo_estado, vo_delegacion, vo_fecharecepcion, vo_delegacionalta,' +
                  ' vo_chequenombre, vo_ajuste, vo_fecharecepcion_central, vo_estadopend, vo_volantetemp )' +              // TK 21282
                  ' SELECT ' + IntToStr(AVolDestino) + ',' + SqlInt(iPrestador) + ', vo_facturatipo,' +
                           ' vo_facturaestable, vo_facturanro, vo_fechafactura, vo_monto, ' + SqlDate(vencimiento) + ', ' +
                           ' vo_montobruto, vo_observaciones, vo_usualta, actualdate, ' +
                            IIF(sEstado = '', 'vo_estado', SqlValue(sEstado)) + ', vo_delegacion,' +
                           ' actualdate, vo_delegacionalta, vo_chequenombre, vo_ajuste,' +
                           ' vo_fecharecepcion_central, ' + IIF(sEstadoPend = '', 'vo_estadopend', SqlValue(sEstadoPend)) + ', ' +   // TK 21282
                           IntToStr(AVolOrigen) +
                      ' FROM tmp_svo_volantes' +
                     ' WHERE vo_volante = ' + IntToStr(AVolOrigen);
          EjecutarSqlST(ssql);
          //----------------------------------------------------------------------------
          sSql := ' DELETE tmp_svo_volantes' +
                   ' WHERE vo_volante = ' + IntToStr(AVolOrigen);
          EjecutarSqlST(sSql);
          //----------------------------------------------------------------------------
          {sSql := 'INSERT INTO tmp_str_traspasos ' +
                  '(tr_origen, tr_destino, tr_usuario, tr_fecha) VALUES (' +
                  SqlInt(AVolOrigen) + ', ' + SqlInt(AVolDestino) + ', ' +
                  'UPPER(''' + Sesion.UserID + '''), ' +  SqlDateTime(AFecha) +  ')';
          EjecutarSqlST(sSql);}
          //----------------------------------------------------------------------------
          Result    := True;
          flgGraba  := True;
          CommitTrans;
        except
          on E: Exception do
          begin
            if Pos('ORA-00001', E.Message) = 0 then
            begin
              flgGraba := MsgBox(msgError + E.Message, MB_ICONEXCLAMATION + MB_RETRYCANCEL) = IDCANCEL;
              Result := False;
            end
            else
            begin
              MsgBox(msgError + E.Message, MB_ICONEXCLAMATION);
              Result := False;
              flgGraba := True;
            end;
            if InTransaction then
              Rollback;
          end;
        end;
        //----------------------------------------------------------------------
        try
          MostrarEstado('Imprimiendo el Volante ' + IntToStr(AVolDestino) +  '...');
          rptVolante.sdqConsulta.Close;
          rptVolante.sdqConsulta.ParamByName('pVolante').AsInteger := AVolDestino;
          rptVolante.sdqConsulta.Open;
          rptVolante.Print;
        except
          on E: Exception do
            ErrorMsg(E, 'Error al Imprimir el Volante ' + IntToStr(AVolDestino));
        end;
        MostrarEstado('Listo');
      until flgGraba;
    finally
      rptVolante.Free;
    end;
  end;
end;

procedure TfrmConsVol.tbEliminarTemporariosClick(Sender: TObject);
var
  Sql: String;
begin
  Verificar(not (HayRegistroActivo), nil, 'Debe realizar alguna selección.');
  if MsgAsk('¿Desea eliminar el volante temporario ' + sdqDatos.FieldByName('VO_VOLANTE').AsString + ' ?') then
  try
    Sql := 'DELETE FROM tmp_svo_volantes' +
           ' WHERE vo_volante = ' + sdqDatos.FieldByName('VO_VOLANTE').AsString;
    EjecutarSql(Sql);
  except
    on E: Exception do
      ErrorMsg(E);
  end;
  tbRefrescarClick(nil);
end;

procedure TfrmConsVol.ReporteTraspasos(Accion: String; IsDateTime: Boolean = True;
                                       ConMensaje: Boolean = True; AFecha: TDateTime = 0);
var
  Sql: String;
begin
  Sql := 'SELECT vo_volantetemp, vo_volante, vo_facturatipo || ''-'' || vo_facturaestable || ''-'' || vo_facturanro factura,' +
               ' vo_fechafactura, vo_monto, vo_prestador, ca_descripcion' +
          ' FROM svo_volantes, cpr_prestador' +
         ' WHERE ca_identificador = vo_prestador';

  if IsDateTime then
    Sql := Sql + ' AND vo_usualta = ' + SqlValue(Sesion.UserID) + ' AND vo_volantetemp IS NOT NULL ' +
                 ' AND vo_fechalta = ' + SqlDate(AFecha)
  else
    Sql := Sql + ' AND vo_volantetemp IS NOT NULL ' +
           iif(not dcFecTrasDesde.IsEmpty, ' AND TO_DATE(TO_CHAR(vo_fechalta, ''DD/MM/YYYY''), ''DD/MM/YYYY'') >= ' + SqlDate(dcFecTrasDesde.Date), '') +
           iif(not dcFecTrasHasta.IsEmpty, ' AND TO_DATE(TO_CHAR(vo_fechalta, ''DD/MM/YYYY''), ''DD/MM/YYYY'') <= ' + SqlDate(dcFecTrasHasta.Date), '');

  OpenQuery(sdqTraspasos, Sql + ' ORDER BY vo_prestador');

  if sdqTraspasos.IsEmpty and ConMensaje then
     MsgBox('No se encontraron registros.', MB_ICONEXCLAMATION)
  else if not sdqTraspasos.IsEmpty then
  begin
    if (Accion = 'IMPRIMIR') then
    begin
      qpTraspasos.Footer.Text := Sesion.Usuario;
      if PrintDialog.Execute then
        qpTraspasos.Print;
    end
    else if (Accion = 'EXPORTAR') then
      ExportDialogTmp.Execute;
  end;
end;

procedure TfrmConsVol.mnuImpTodosVolanteClick(Sender: TObject);
begin
  Verificar(not(HayRegistroActivo), nil, 'Debe realizar alguna selección.');

  if (MsgBox('¿ Desea reimprimir TODOS los volantes seleccionados ?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES) then
    with TrptVolante.Create(Self) do
    try
      Tag := 0;
      PrinterSetup;
      if Tag = 0 then
      begin
        ProgressBar.Position := 0;
        ProgressBar.Max      := sdqDatos.RecordCount;
        ShowProgress         := False;
        fpImpVolantes.Tag    := 0;
        fpImpVolantes.ShowOnTop;
        sdqDatos.First;

        repeat
          sdqConsulta.Close;
          sdqConsulta.ParamByName('pVolante').AsInteger := sdqDatos.FieldByName('vo_volante').AsInteger;
          sdqConsulta.Open;
          lbTraspasos.Caption := 'Volante Nro.' + sdqDatos.FieldByName('vo_volante').AsString;
          ProgressBar.StepIt;
          Application.ProcessMessages;
          Print;
          sdqDatos.Next;
        until sdqDatos.Eof or Cancelled or (fpImpVolantes.Tag <> 0);
      end;
    finally
      fpImpVolantes.Close;
      Free;
    end;
end;

procedure TfrmConsVol.btnImpVolCancelarClick(Sender: TObject);
begin
  fpImpVolantes.Tag := 1;
end;

{------[Menu Imprimir ó Exportar Tmp]-------------------------------------------}
procedure TfrmConsVol.tbImpExpTemporariosClick(Sender: TObject);
begin
  tbImpExpTemporarios.CheckMenuDropdown;
end;

procedure TfrmConsVol.mnuImprimirTmpClick(Sender: TObject); // by Lu. (lo hice en dos veces porque ni el tag, ni el items me sirve.)
begin
  Verificar(not (HayRegistroActivo), nil, 'Debe realizar alguna selección.');
  ReporteTraspasos('IMPRIMIR', False);
end;

procedure TfrmConsVol.mnuExportarTmpClick(Sender: TObject);
begin
  Verificar(not (HayRegistroActivo), nil, 'Debe realizar alguna selección.');
  ReporteTraspasos('EXPORTAR', False)
end;

procedure TfrmConsVol.tbPasarTemporariosClick(Sender: TObject);
begin
  tbPasarTemporarios.CheckMenuDropdown;
end;

procedure TfrmConsVol.qpTraspasosGetSubTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  if Field.DataField = 'VO_FECHAFACTURA' then
    Value := 'SubTotal';
end;

procedure TfrmConsVol.qpTraspasosGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  if Field.DataField = 'VO_FECHAFACTURA' then
    Value := 'Total';
end;

procedure TfrmConsVol.OnPrestadorChange(Sender: TObject);
begin
end;

procedure TfrmConsVol.tbAuditoriaClick(Sender: TObject);
begin
  tbAuditoria.CheckMenuDropdown;
end;

function TfrmConsVol.IsRegistrosAuditoriaValidos(bConDebito: Boolean): Boolean;
var
  bAudiOtro: Boolean;
  sSql: String;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  sSql := 'SELECT 1 ' +
           ' FROM sin.sdv_debitosvolantes ' +
          ' WHERE dv_volante = :volante ' +
            ' AND dv_fechabaja IS NULL ';
  Verificar(not(bConDebito) and ExisteSqlEx(sSql, [sdqDatos.FieldByName('vo_volante').AsInteger]),
            nil, 'El volante posee débitos por auditoría. Debe darlos de baja antes.');
  bAudiOtro := (Sesion.UserID <> sdqDatos.FieldByName('vo_usuarioauditoria').AsString) and
               not(Seguridad.Claves.IsActive('CambiarAudDebito'));
  Verificar((sdqDatos.FieldByName('vo_auditcondebito').AsString = 'S') and
             not(bConDebito) and bAudiOtro, nil,
            'El volante seleccionado ha sido auditado con débito por otro usuario.');
  Verificar((sdqDatos.FieldByName('vo_auditcondebito').AsString = 'N') and
             bConDebito and bAudiOtro, nil,
            'El volante seleccionado ha sido auditado sin débito por otro usuario.');
  Verificar(not(sdqDatos.FieldByName('vo_fechaavaldebito').IsNull),
            nil, 'El volante seleccionado ya ha sido avalado.');
  Verificar(sdqDatos.FieldByName('vo_fecharecepaudit').IsNull, nil,
            'El volante seleccionado no fue recepcionado en el sector.');
  Verificar(not AreIn(sdqDatos.FieldByName('vo_estado').AsString, ['P', 'PA']), nil,
            'El volante seleccionado no está pendiente ni pendiente de auditar.');
  Verificar((sdqDatos.FieldByName('vo_estado').AsString = 'P') and
             sdqDatos.FieldByName('vo_auditcondebito').IsNull and
            (sdqDatos.FieldByName('vo_norequiereaudi').AsString <> 'S'), nil,
            'El volante seleccionado no está pendiente de auditar.');
  Verificar((sdqDatos.FieldByName('vo_estado').AsString = 'P') and
            (sdqDatos.FieldByName('vo_norequiereaudi').AsString = 'S') and bAudiOtro,
            nil, 'El volante seleccionado ya ha sido marcado como "No auditable" por otro usuario.');
  Result := ValidarAuditar;
end;

function TfrmConsVol.IsRegistrosAuditoriaOrtopediaValidos: Boolean;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  Verificar((sdqDatos.FieldByName('VO_ESTADO').AsString <> 'PO') and
            (sdqDatos.FieldByName('VO_ESTADOPEND').AsString <> 'PO'), nil, // TK 21282
            'El volante ' + sdqDatos.FieldByName('VO_VOLANTE').AsString + ' no está pendiente de auditar por ortopedia.');
  Result := True;
end;

procedure TfrmConsVol.cpnlAuditadoChange(Sender: TObject);
begin
  if not cpnlAuditado.Checked then cmbAuditado.ItemIndex := 4;
end;

procedure TfrmConsVol.cpnlRefacturacionChange(Sender: TObject);
begin
  if not cpnlRefacturacion.Checked then cmbRefacturacion.ItemIndex := 2;
end;

procedure TfrmConsVol.tbReasignarClick(Sender: TObject);
var
  sSql: String;
begin
  if IsRegistrosReasignarValidos and
     MsgAsk('¿Confirma que desea volver el volante seleccionado a pendiente?') then
  try
    sSql := 'UPDATE svo_volantes' +
              ' SET vo_fechamodif = actualdate,' +
                  ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' vo_estado = amebpba.get_estadoanterior_volante(vo_volante)' +
            ' WHERE vo_volante = ' + SqlInt(sdqDatos.FieldByName('vo_volante').AsInteger);
    EjecutarSql(sSql);
    sdqDatos.Refresh;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al grabar la reasignación.');
  end;
end;

function TfrmConsVol.IsRegistrosReasignarValidos: Boolean;
var
  sEstado: String;
  sSql: String;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  sEstado := sdqDatos.FieldByName('VO_ESTADO').AsString;
  sSql    := 'SELECT substr(tb_especial2, 1, 1)' +
              ' FROM ctb_tablas' +
             ' WHERE tb_clave = ''MUVOL''' +
               ' AND tb_codigo = ' + SqlValue(sEstado);
  Verificar((ValorSql(sSql) = ''), dbgListado,
            'El volante ' + sdqDatos.FieldByName('VO_VOLANTE').AsString +
            ' no puede modificarse porque no está en estado Derivado');
  Verificar(((sEstado = 'D7') and (Sesion.Sector <> 'AUDILIQ') and
            not(sdqDatos.FieldByName('VO_FECHAAUDITORIA').IsNull)) or
            ((sEstado = 'D7') and (Sesion.Sector = 'AUDILIQ') and
            sdqDatos.FieldByName('VO_FECHAAUDITORIA').IsNull), dbgListado,
            'No posee permisos para reasignar volantes con éste estado.');

  Result := True;
end;

procedure TfrmConsVol.tbDerivarClick(Sender: TObject);
var
  sSql: String;
begin
  if IsRegistrosDerivarValidos and (fpDerivacion.ShowModal = mrOK) then
  try
    sSql := 'UPDATE svo_volantes' +
              ' SET vo_fechamodif = ActualDate,' +
                  ' vo_usumodif = :USUARIO,' +
                  ' vo_observaciones_derivacion = :OBSERVACIONES,' +
                  ' vo_estado = ' + SqlValue(fraStaticCTBDerivacion.Value) +
            ' WHERE vo_volante = ' + SqlInt(sdqDatos.FieldByName('vo_volante').AsInteger);
    EjecutarSqlEx(sSql, [Sesion.UserID, memoObservaciones.Lines.Text]);
    memoObservaciones.Lines.Clear;
    sdqDatos.Close;
    OpenQuery(sdqDatos);
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al grabar la derivación.');
  end;
end;

function TfrmConsVol.IsRegistrosDerivarValidos: Boolean;
var
  sEstado: String;
begin
  sEstado := sdqDatos.FieldByName('vo_estado').AsString;

  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  Verificar(not AreIn(sEstado, ['P', 'PA', 'PM']), dbgListado,
            'El volante ' + sdqDatos.FieldByName('vo_volante').AsString +
            ' no puede derivarse porque no está en estado Pendiente.');
  Verificar(((sEstado = 'PA') and (Sesion.Sector <> 'AUDILIQ') and
             not(sdqDatos.FieldByName('vo_fecharecepaudit').IsNull)) or
              ((sEstado = 'PA') and (Sesion.Sector = 'AUDILIQ') and
                sdqDatos.FieldByName('vo_fecharecepaudit').IsNull),
            dbgListado, 'No posee permisos para derivar volantes con este estado.');
  
  Result := True;
end;

procedure TfrmConsVol.fpDerivacionEnter(Sender: TObject);
begin
  fraStaticCTBDerivacion.Clear;
end;

procedure TfrmConsVol.btnCancelarDerivarClick(Sender: TObject);
begin
  fpDerivacion.ModalResult := mrCancel;
end;

procedure TfrmConsVol.btnAceptarDerivarClick(Sender: TObject);
var
  sDirecciones, sObs, sContrat, sAlGestor :String;
begin
  sDirecciones := '';
  Verificar(fraStaticCTBDerivacion.IsEmpty, fraStaticCTBDerivacion.edCodigo, 'Debe elegir la derivación.');

  sContrat := ValorSqlEx('SELECT substr(tb_especial2, 3, 1)' +
                          ' FROM ctb_tablas' +
                         ' WHERE tb_clave = ''MUVOL''' +
                           ' AND tb_codigo = :Codigo ', [fraStaticCTBDerivacion.Codigo]);

  memoObservaciones.Lines.Clear;
  fpObservaciones.Caption := 'Observaciones de Derivación';

  fpObservaciones.ShowModal;

  if (sContrat <> 'S') or
     (sContrat = 'S') and MsgAsk('¿Desea enviar el aviso automático al responsable del área?') then
  begin
    sAlGestor := 'N';
    with GetQuery('SELECT se_mail, ud_enviaralgestor' +
                   ' FROM use_usuarios, sud_usuarioderivacionvolante' +
                  ' WHERE se_usuario = ud_usuario' +
                    ' AND ud_fechabaja IS NULL' +
                    ' AND ud_codderivacion = ' + SQLValue(fraStaticCTBDerivacion.Value)) do
    try
      First;
      while not Eof do
      begin
        if FieldByName('ud_enviaralgestor').AsString = 'S' then
          sAlGestor := 'S';

        if sDirecciones <> '' then
          sDirecciones := sDirecciones + ',';
        sDirecciones := sDirecciones + FieldByName('SE_MAIL').AsString;
        Next;
      end;
    finally
      Free;
    end;

    {if (sAlGestor = 'S') and (sdqDatos.FieldByName('ca_gestor').AsString <> '') then
      sDirecciones := sDirecciones + ', ' + ValorSqlEx('select se_mail from use_usuarios where se_usuario = :usu and se_fechabaja is null',
                                                      [sdqDatos.FieldByName('ca_gestor').AsString]); }
    if (sAlGestor = 'S') then
      sDirecciones := sDirecciones + ',contrataciones@provart.com.ar';

    {sGestor := ValorSqlEx('SELECT se_mail ' +
                           ' FROM use_usuarios, sud_usuarioderivacionvolante, ART.SVO_VOLANTES, ART.CPR_PRESTADOR ' +
                          ' WHERE se_usuario = CA_GESTOR ' +
                            ' AND VO_PRESTADOR = CA_IDENTIFICADOR ' +
                            ' AND VO_VOLANTE = :VOL ' +
                            ' AND ud_enviaralgestor = ''S'' ' +
                            ' AND ud_codderivacion = :COD ' +
                            ' AND ud_fechabaja IS NULL', [sdqDatos.FieldByName('vo_volante').AsString, fraStaticCTBDerivacion.Value]); }


    //sDirecciones := sDirecciones + ', ' + ValorSql('select art.varios.get_direccionesenviomail(''GES_PRES'') from dual');

    if sDirecciones <> '' then
    begin
      sObs          := Trim(memoObservaciones.Lines.Text);
      unMoldeEnvioMail.EnviarMailBD(sDirecciones,
                                  'Derivación de volante - Nº ' + sdqDatos.FieldByName('VO_VOLANTE').AsString,
                                  [oBodyIsRTF, oAutoFirma],
                                  Format(TEXTO_MAIL, [sdqDatos.FieldByName('VO_VOLANTE').AsInteger,
                                                      Sesion.Usuario, sObs,
                                                      sdqDatos.FieldByName('CA_IDENTIFICADOR').AsString,
                                                      sdqDatos.FieldByName('CA_DESCRIPCION').AsString,
                                                      FormatDateTime('DDDD DD/MM/YYYY', sdqDatos.FieldByName('VO_FECHARECEPCION').AsDateTime),
                                                      FormatDateTime('DDDD DD/MM/YYYY', Now), {Fecha de Derivación}
                                                      sdqDatos.FieldByName('VO_MONTO').AsFloat]));
    end;
  end;
  fpDerivacion.ModalResult := mrOk;
end;
            
procedure TfrmConsVol.btnAceptarEgSemClick(Sender: TObject);
var ssql: string;
begin

  ssql := ' UPDATE art.svo_volantes ' +
          '    SET vo_vencimientoes = ' + sqldate(dcVencimEgSem.Date) + ',' +
          '        vo_usuvencimientoes = :usu ' +
          '  WHERE vo_volante = :vol ';

  EjecutarSqlEx(ssql, [Sesion.UserID, sdqDatos.FieldByName('vo_volante').AsInteger]);

  fpVencimientoEgSem.ModalResult := mrOk;
  tbRefrescarClick(nil);
end;

procedure TfrmConsVol.tbMarcarNoAuditableClick(Sender: TObject);
var
  sSql: String; volAuditado: boolean;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  if ValidarAuditar then
  begin
    Verificar(sdqDatos.FieldByName('vo_fecharecepaudit').IsNull, nil,
              'El volante seleccionado no fue recepcionado en el sector.');
    Verificar(sdqDatos.FieldByName('vo_estado').AsString <> 'PA', nil,
              'El volante seleccionado debe tener estado "Pendiente de Auditar"'+#13+
              'para poder ser marcado como "No auditable" o "Ya auditado".');

    volAuditado := ValorSqlEx('select vo_auditado from art.svo_volantes where vo_volante = :vol', [sdqDatos.FieldByName('vo_volante').AsInteger]) = 'S';

    if TToolButton(sender).Name = 'mnuVolNoAuditable' then
    begin
      verificar(volAuditado = true, tbMarcarNoAuditable, 'El volante ya está auditado.');

      sSql := 'UPDATE art.svo_volantes' +
                ' SET vo_norequiereaudi = :REQUIERE,' +
                    ' vo_fechaauditoria = ACTUALDATE,' +
                    ' vo_usuarioauditoria = :USUARIO,' +
                    ' vo_estado = :ESTADO,' +
                    ' vo_usuauditor = null, ' +
                    ' vo_fecusuauditor = null ' +
              ' WHERE vo_volante = :VOLANTE';


      if MsgAsk('¿Confirma que el volante seleccionado no requiere auditoría?', 'Confirmación') then
      begin
        EjecutarSQLEx(sSql, ['S', Sesion.UserID, 'P', sdqDatos.FieldByName('vo_volante').AsInteger]);
        tbRefrescar.Click;
      end;
    end
    else    //mnuVolanteYaAuditado
    begin
      verificar(volAuditado = false, tbMarcarNoAuditable, 'El volante no está auditado');
      ssql := ' UPDATE art.svo_volantes ' +
                 ' SET vo_estado = :est, ' +
                     ' vo_fechaavaldebito = art.actualdate, ' +
                     ' vo_usuavaldebito = :usuaval ' +
               ' WHERE vo_volante = :vol ';

      if MsgAsk('¿Confirma que el volante seleccionado no es auditable?', 'Confirmación') then
      begin
        EjecutarSQLEx(sSql, ['P', Sesion.UserID, sdqDatos.FieldByName('vo_volante').AsInteger]);
        tbRefrescar.Click;
      end;

    end;
  end;
end;

procedure TfrmConsVol.tbAuditoriaOrtopediaClick(Sender: TObject);
var
  sEstado, sSql: String;
begin
  if IsRegistrosAuditoriaOrtopediaValidos then
  begin
    if MsgAsk('¿Confirma que el volante seleccionado fue auditado por ortopedia?') then
    try
      if CompareFloat(sdqDatos.FieldByName('vo_monto').AsFloat,
                     (sdqDatos.FieldByName('vo_montopercepcion').AsFloat +
                      sdqDatos.FieldByName('vo_montodebito').AsFloat)) = 0 then
        sEstado := 'L'
      else
        sEstado := 'P';

      sSql := 'UPDATE svo_volantes' +
                ' SET vo_fechaortopedia = ACTUALDATE,' +
                    ' vo_usuarioortopedia = ' + SqlValue(Sesion.UserID) + ',' +
                    ' vo_estado = ' + SqlValue(sEstado) +
              ' WHERE vo_volante= ' + SqlValue(sdqDatos.FieldByName('vo_volante').AsInteger);
      EjecutarSql(sSql);
      sdqDatos.Refresh;
    except
      on E: Exception do
        raise Exception.Create(E.Message + CRLF + 'Error al grabar la auditoría de ortopedia.');
    end;
  end;
end;

procedure TfrmConsVol.tbEnviarMailClick(Sender: TObject);
begin
  tbEnviarMail.CheckMenuDropdown;
end;

procedure TfrmConsVol.MnuEnviarNotaDebitoClick(Sender: TObject);
var i: integer;
begin
  Verificar(not(HayRegistrosSeleccionados), nil, 'Debe seleccionar al menos un registro.');
  for i := 0 to dbgListado.SelectedRows.Count - 1 do
  begin
    dbgListado.GotoSelection(i);
    verificar (sdqDatos.FieldByName('VO_FECHAENVIOND').AsString <> '', tbEnviarMail, 'Ya ha sido enviada la Nota de Débito para algunos de los registros seleccionados.' + chr(13) + 'Debe corregirlo para poder continuar.');
  end;
  if Hay1RegistroActivo = true then
    DoGenerarNotaDebito(tsMail)
  else
    GenerarVariasND(tsMail);

end;

procedure TfrmConsVol.MnuEnviarDetalleClick(Sender: TObject);
begin
  DoGenerarDetalleAjuste(False);
end;

//CAMARILLO - 18-07-06 - previsualiza o envia por mail la Nota de Debito según el parametro de entrada
procedure TfrmConsVol.DoGenerarNotaDebito(vTipoSalida: TTipoSalida; bInternaAMF: Boolean);
var
  bHabilitarEnvio: Boolean;
  Reporte: TrptNotaDebito;
  ReporteAMP: TrptNDAMP;
  Tipo: TTipoNota;
  vMailPrestador, vNombreArchivo: String;
  NotaAMP: boolean;
  iVolante: Integer;
begin

  NotaAMP   := False;
  Tipo      := tnGenerica;
  iVolante  := sdqDatos.FieldByName('vo_volante').AsInteger;
  Reporte := nil;
  ReporteAMP := nil;

  if bInternaAMF and ExisteSqlEx(sSqlInt, [iVolante]) then
    Tipo := tnInterna
  else if ExisteSqlEx(sSqlNor, [iVolante]) then
    Tipo := tnNormal
  else if ExisteSqlEx(sSqlGen, [iVolante]) then
    Tipo := tnGenerica
  else if ExisteSqlEx(sSqlAMP, [iVolante]) then
    NotaAMP := True
  else begin
    MsgBox('El Volante seleccionado (' + inttostr(iVolante) + ') no tiene Nota de Débito.');
    Exit;
  end;

  bHabilitarEnvio := not(sdqDatos.FieldByName('vo_ordenpago').IsNull) or
                     ((sdqDatos.FieldByName('montopagado').AsFloat = 0) and
                       AreIn(sdqDatos.FieldByName('vo_estado').AsString, ['E', 'EG', 'EM']));

  Verificar(not (bHabilitarEnvio) and (vTipoSalida = tsMail) {not (bEsImpresion)}, nil,
            'El Volante seleccionado no tiene Orden de Pago.'); //sólo si es envio por mail aplico la restricion



 //--[ Imprime/Envía/Exporta la Nota de Debito ]------------------------------
  if NotaAMP then
    ReporteAMP := TrptNDAMP.Create(Self)
  else
    Reporte := TrptNotaDebito.Create(Self);
  try
    if (vTipoSalida = tsImpresion) {bEsImpresion} then
      if NotaAMP then
        ReporteAMP.ImprimirNDAMP(StrToInt('0' + IntToStr(iVolante)))
      else
        Reporte.Imprimir(iVolante, Tipo, trPreview)

    else if (vTipoSalida = tsMail) then
    begin //si no es impresion, es envio de mail
      if NotaAMP then
        ReporteAMP.ImprimirNDAMP(StrToInt('0' + IntToStr(iVolante)), trAMPNone)
      else
        Reporte.Imprimir(iVolante, Tipo, trNone);

      vNombreArchivo := IncludeTrailingBackslash(TempPath) + 'NotaDebito.PDF';
      vMailPrestador := sdqDatos.FieldByName('ca_maildebitos').AsString;
      if NotaAMP then
        ExportarPDF(ReporteAMP, vNombreArchivo)
      else
        ExportarPDF(Reporte, vNombreArchivo);

      unMoldeEnvioMail.EnviarMailBD(vMailPrestador, 'Nota de Débito.',
                                   [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                                   'Se adjunta Nota de Débito correspondiente.' + CRLF + CRLF + 'Provincia ART',
                                   GetAttachments(vNombreArchivo, 7));
    end
    else if (vTipoSalida = tsExportacion) then
    begin
      if NotaAMP then
        ReporteAMP.ImprimirNDAMP(StrToInt('0' + IntToStr(iVolante)), trAMPNone)
      else
        Reporte.Imprimir(iVolante, Tipo, trNone);
          
      if OpenDialogPDF.Execute then
      begin
       vNombreArchivo := OpenDialogPDF.FileName;
       if NotaAMP then
         ExportarPDF(ReporteAMP, vNombreArchivo)
       else
         ExportarPDF(Reporte, vNombreArchivo);
      end;
    end;
  finally
    if NotaAMP then
      ReporteAMP.Free
    else
      Reporte.Free;
  end

end;

//CAMARILLO - 18-07-06 - previsualiza o envia por mail el Detalle / Ajuste según el parametro de entrada
procedure TfrmConsVol.DoGenerarDetalleAjuste(bEsImpresion: Boolean);     // Lu TK 6093 nuevo parametro para el pdf de Nicolas Ferro

  function EsVolanteAMP(idVolante: Integer): Boolean;
  begin
   Result := ExisteSqlEx('SELECT 1 ' +
                          ' FROM art.svo_volantes ' +
                         ' WHERE vo_volante = :vol ' +
                           ' AND vo_estado = ''PM'' ', [idVolante]) or
             ExisteSqlEx('SELECT 1 ' +
                          ' FROM sif_itemfacturaamp ' +
                          ' WHERE if_idvolante = :vol ', [idVolante]);
  end;

var
  Reporte: TrptNotaDebito;
  Tipo: TTipoNota;
  vMailPrestador: String;
  vNombreArchivo: String;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');

  if sdqDatos.FieldByName('vo_ajuste').IsNull then
  begin
    if EsVolanteAMP(sdqDatos.FieldByName('vo_volante').AsInteger) then
      tbDetallesClick(nil)
    else
      with TfrmDetFact.Create(Self) do
      begin
        Execute(Self.sdqDatos.FieldByName('vo_volante').AsInteger);
        Free;
      end
  end
  else begin
    if (sdqDatos.FieldByName('vo_mixto').AsString = 'S') then
      Tipo := tnMixta
    else if ExisteSqlEx('SELECT 1' +
                         ' FROM siv_itemvolante' +
                        ' WHERE iv_volante = :Vol ', [sdqDatos.FieldByName('vo_volante').AsInteger]) then
      Tipo := tnNormal
    else if ExisteSqlEx('SELECT 1' +
                         ' FROM svg_vol_generico' +
                        ' WHERE vg_volante = :Vol ', [sdqDatos.FieldByName('vo_volante').AsInteger]) then
      Tipo := tnGenerica
    else begin
      MsgBox('No se ha detallado la factura seleccionada.');
      Exit;
    end;

    if not(bEsImpresion) and sdqDatos.FieldByName('vo_ordenpago').IsNull then
    begin
      MsgBox('La factura seleccionada no tiene Orden de Pago.');
      Exit;
    end;

    Reporte := TrptNotaDebito.Create(Self);
    try
      if bEsImpresion then
        Reporte.ImprimirDevAjuste(sdqDatos.FieldByName('vo_volante').AsInteger, Tipo, trPreview)
      else
      begin //si no es impresion, es envio de mail
        Reporte.ImprimirDevAjuste(sdqDatos.FieldByName('vo_volante').AsInteger, Tipo, trNone);
        vNombreArchivo := IncludeTrailingBackslash(TempPath) + 'DevolucionAjuste.PDF';
        vMailPrestador := sdqDatos.FieldByName('ca_maildebitos').AsString;
        ExportarPDF(Reporte, vNombreArchivo);
        unMoldeEnvioMail.EnviarMailBD(vMailPrestador, 'Devolución de Ajuste.',
                                     [oAlwaysShowDialog, oDeleteAttach, oAutoFirma],
                                     'Se adjunta Devolución de Ajuste correspondiente.' + CRLF + CRLF + 'Provincia ART',
                                     GetAttachments(vNombreArchivo, 7));
      end;
    finally
      Reporte.Free;
    end;

  end;
end;

procedure TfrmConsVol.MnuCancelarVolanteClick(Sender: TObject);
var
  sSQL, sVolante, sEstado: String;
  iCantCons: Currency;
  sdqSecuencias: TSDQuery;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');

  if not(MsgAsk('Se dispone a cancelar el volante.' + #13 + '¿Está usted seguro?')) then
    Exit;

  sEstado := sdqDatos.FieldByName('vo_estado').AsString;

  if not(AreIn(sEstado, ['P', 'PA', 'PO', 'PM'])) then
    MsgBox('El volante debe estar pendiente de liquidación', MB_ICONEXCLAMATION)
  else begin  {estado: PENDIENTE, PENDIENTE DE AUDITAR, PENDIENTE DE ORTOPEDIA, PENDIENTE AMP se Cancela.}
    fpObservaciones.Caption := 'Volante a cancelar Nº ' + sdqDatos.FieldByName('VO_VOLANTE').AsString;
    memoObservaciones.Lines.Clear;
    BeginTrans(True);
    if fpObservaciones.ShowModal = mrOk then
    begin
      try
        sVolante := sdqDatos.FieldByName('VO_VOLANTE').AsString;
        sSQL :=
          'UPDATE svo_volantes' +
            ' SET vo_estado = ''C'',' +
                ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' vo_fechamodif = ACTUALDATE ,' +
                ' vo_observaciones = ' + SqlValue(memoObservaciones.Lines.Text) +
          ' WHERE vo_volante = ' + sVolante;
        EjecutarSqlST(sSQL);

        sSQL :=
          'DELETE FROM siv_itemvolante' +
               ' WHERE iv_volante = ' + sVolante +
                 ' AND iv_estado = ''X''';

        // este comentario que sigue merece un párrafo aparte: NWK si queres te paso la servilleta de papel que creo que te quedaron las manos humedas.....juaaa
        // by NWK, 22/04/03, por pedido de JBalestrini, con conformidad expresa de Maria Paula Atlante, y disconformidad plena de mi parte (ya que me viola todos mis principios morales y éticos), bajo protesta y contando como testigo absoluto de parte al Dr. SGabrielli
        EjecutarSqlST(sSQL);

        sSQL :=
          'DELETE FROM svg_vol_generico' +
               ' WHERE vg_volante = ' + sVolante +
                 ' AND vg_estado = ''X''';   // by NWK, 22/04/03, por pedido de JBalestrini, con conformidad expresa de Maria Paula Atlante, y disconformidad plena de mi parte (ya que me viola todos mis principios morales y éticos), bajo protesta y contando como testigo absoluto de parte al Dr. SGabrielli
        EjecutarSqlST(sSQL);

        sSQL :=
          'UPDATE siv_itemvolante' +
            ' SET iv_estado = ''X'',' +
                ' iv_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' iv_fecmodif = ACTUALDATE' +
          ' WHERE iv_volante = ' + sVolante;
        EjecutarSqlST(sSQL);

        {Libero el posible debito de auditoria que se le pudo haber aplicado}
        Do_LiberarPosibleDebitoAuditoria(StrToIntDef(sVolante, 0));

        {Cancelo los consumos individuales de cada item del volante}
        sSQL := ' SELECT iv_siniestro, iv_orden, iv_recaida, iv_numauto, iv_cantapro, iv_numvolante ' +
                  ' FROM art.siv_itemvolante ' +
                 ' WHERE iv_volante = ' + sVolante +
                 ' ORDER BY iv_numvolante';
        sdqSecuencias := GetQuery(sSQL);
        with sdqSecuencias do
        try
          IniciarEspera('Cancelando el volante' + sVolante);

          if not IsEmpty then
          while not Eof do
          begin
            sSQL := ' SELECT au_cantconsu, au_cantapro, au_siniestro, au_orden, au_recaida, au_numauto, e.tb_descripcion estado ' +
                      ' FROM art.sau_autorizaciones, art.ctb_tablas e ' +
                     ' WHERE au_siniestro = :siniestro ' +
                     '   AND au_orden = :orden ' +
                     '   AND au_recaida = :recaida ' +
                     '   AND au_numauto = :numauto ' +
                     '   AND e.tb_clave(+) = ''MUAUT'' ' +
                     '   AND e.tb_codigo(+) = au_estado ';

            with GetQueryEx(sSQL, [FieldByName('IV_SINIESTRO').AsInteger, FieldByName('IV_ORDEN').AsInteger, FieldByName('IV_RECAIDA').AsInteger, FieldByName('IV_NUMAUTO').AsInteger]) do
            try
              if not IsEmpty then
              try
                IniciarEspera('Restaurando la secuencia ' + sdqSecuencias.FieldByName('IV_NUMVOLANTE').AsString);
                try
                  iCantCons := (FieldByName('AU_CANTCONSU').AsCurrency - sdqSecuencias.FieldByName('IV_CANTAPRO').AsCurrency);
                  sEstado := Get_EstadoAutorizacion(iCantCons, FieldByName('AU_CANTAPRO').AsCurrency);
                  {Actualiza el estado y la cantidad consumida de la autorización}
                  Do_ActualizarAutorizacion(FieldByName('AU_SINIESTRO').AsInteger, FieldByName('AU_ORDEN').AsInteger, FieldByName('AU_RECAIDA').AsInteger, FieldByName('AU_NUMAUTO').AsInteger, iCantCons, sEstado);
                finally
                  DetenerEspera;
                end;
              except
                on E: ESDOraError do
                begin
                  if ESDOraError(E).ErrorCode = 2290 then
                    MsgBox('Se detectó una inconsistencia en las cantidades de una autorización, tome nota de esta información ya que el proceso de anulación del volante continuará.' + CRLF + CRLF +
                           'Siniestro: ' + FieldByName('AU_SINIESTRO').AsString + CRLF +
                           'Orden: ' + FieldByName('AU_ORDEN').AsString + CRLF +
                           'Recaída: ' + FieldByName('AU_RECAIDA').AsString + CRLF +
                           'Autorización: ' + FieldByName('AU_NUMAUTO').AsString + CRLF +
                           'Estado: ' + FieldByName('ESTADO').AsString + CRLF +                           
                           'Secuencia del volante: ' + sdqSecuencias.FieldByName('IV_NUMVOLANTE').AsString + CRLF + CRLF +
                           'Cantidad consumida: ' + FieldByName('AU_CANTCONSU').AsString + CRLF +
                           'Cantidad aprobada: ' + FieldByName('AU_CANTAPRO').AsString + CRLF +
                           'Cantidad liquidada: ' + sdqSecuencias.FieldByName('IV_CANTAPRO').AsString + CRLF + CRLF + 'Mensaje de Error' + CRLF + E.Message)
                  else begin
                    MsgBox('Ocurió un error inesperado relacionado con la base de datos, se cancelará el proceso de anulación del volante.' + CRLF + E.Message);
                    raise;
                  end;
                end;
                on E: Exception do
                begin
                  MsgBox('Error inesperado!' + CRLF + E.Message);
                  raise;
                end;
              end;
            finally
              Free;
            end;
            Next;
          end;
        finally
          Free;
          DetenerEspera(True);
        end;

        // Cancela volante AMP
        sSQL :=
          'UPDATE sif_itemfacturaamp ' +
            ' SET if_estado = ''X'',' +
                ' if_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' if_fechamodif = ACTUALDATE' +
          ' WHERE if_idvolante = ' + sVolante;
        EjecutarSqlST(sSQL);

        sSQL :=
          'UPDATE hys.hdl_detallelote' +
          '   SET dl_iddetvolante = NULL' +
          ' WHERE dl_iddetvolante IN (SELECT if_id' +
          '                             FROM art.sif_itemfacturaamp' +
          '                            WHERE if_idvolante = ' + sVolante + ')';
        EjecutarSqlST(sSQL);

        sSQL :=
          'UPDATE svg_vol_generico' +
            ' SET vg_estado = ''X'',' +
                ' vg_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' vg_fecmodif = ACTUALDATE' +
          ' WHERE vg_volante = ' + sVolante;
        EjecutarSqlST(sSQL);
        CommitTrans(True);
      except
        on E: Exception do
        begin
          MsgBox('Error al cancelar el volante' + CRLF + E.Message);
          RollBack(True);
        end;
      end;

      sdqDatos.Close;
      sdqDatos.Open;
      sdqDatos.Locate('VO_VOLANTE', sVolante, []);
    end;
  end;
end;

procedure TfrmConsVol.MnuCancelarReemplazarClick(Sender: TObject);
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');

  {estado: PENDIENTE, PENDIENTE DE AUDITAR, PENDIENTE DE ORTOPEDIA, se Cancela.}
  if not(AreIn(sdqDatos.FieldByName('vo_estado').AsString, ['P', 'PA', 'PO', 'PM'])) then
    MsgBox('El volante debe estar pendiente de liquidación.', MB_ICONEXCLAMATION)

  else if not(sdqDatos.FieldByName('vo_fechaauditoria').IsNull) and
          not(Seguridad.Claves.IsActive('CancelarVolantesAuditados')) then
    MsgBox('Usted no posee permisos para cancelar volantes auditados.', MB_ICONEXCLAMATION)

  else if (MessageDlg('¿ Confirma la cancelación del volante y el reemplazo por uno nuevo ?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    DoReplicarVolante;
end;

//CAMARILLO - 25-08-06 - cancela el volante original, inserta otro nuevo y relaciona los items con este ultimo
procedure TfrmConsVol.DoReplicarVolante;
const
  msgError = 'No se ha podido guardar los cambios a causa del siguiente error:' + #13;
var
  Consulta :TSDQuery;
  iVolDestino, iVolOrigen: Integer;
  rptVolante: TrptVolante;
  sSql :String;
begin
  ImporteAntVolante       := sdqDatos.FieldByName('vo_facpen').AsFloat +
                             sdqDatos.FieldByName('vo_montopercepcion').AsFloat +
                             sdqDatos.FieldByName('vo_montodebito').AsFloat;
  edImporteVolante.Value  := sdqDatos.FieldByName('vo_montobruto').AsFloat;
  edImporteIVA.Value      := sdqDatos.FieldByName('vo_montoiva').AsFloat;
  edImporteTotal.Value    := sdqDatos.FieldByName('vo_monto').AsFloat;

  if (fpImporteNuevo.ShowModal = mrOk) then
  begin
    rptVolante := TrptVolante.Create(Self);
    try
      iVolOrigen  := sdqDatos.FieldByName('vo_volante').AsInteger;
      iVolDestino := IncSql('SELECT MAX(vo_volante) FROM svo_volantes');
      MostrarEstado('Creando Volante Nro. ' + IntToStr(iVolDestino));
      sNuevoEstado := SetNuevoEstado(sNuevoEstado, sdqDatos.FieldByName('vo_mixto').AsString,
                                     sdqDatos.FieldByName('vo_estado').AsString, iVolOrigen);
      try
        BeginTrans;
        //------------inserta el nuevo volante----------------------------------
        sSql := ' INSERT INTO svo_volantes ' +
                '(vo_volante, vo_prestador, vo_facturatipo, vo_facturaestable, ' +
                ' vo_facturanro, vo_fechafactura, vo_monto, vo_montoiva, vo_montobruto, vo_vencimiento, ' +
                ' vo_observaciones, vo_usualta, vo_fechalta, vo_estado, vo_usuapro, ' +
                ' vo_fechapro, vo_usupago, vo_fechapago, vo_usumodif, vo_fechamodif, ' +
                ' vo_porboni, vo_facpen, vo_notadebito, vo_montoboni, vo_destinatario, ' +
                ' vo_delegacion, vo_ordenpago, vo_cheque, vo_fechacheque, vo_tipopago, ' +
                ' vo_fecharecepcion, vo_delegacionalta, vo_chequenombre, vo_ajuste, ' +
                ' vo_fecharecepcion_central, vo_bonificacion, vo_estadocheque, ' +
                ' vo_proxdigfactura, vo_montopercepcion, vo_montodebito, ' +
                ' vo_observaciondebito, vo_auditado, vo_usuarioauditoria, vo_fechaauditoria, ' +
                ' vo_refacturacion, vo_fechaordenpago, vo_norequiereaudi, vo_cai, ' +
                ' vo_observaciones_derivacion, vo_carga_central, vo_usuarioortopedia, ' +
                ' vo_fechaortopedia, vo_fechaproap, vo_mixto, vo_volantecancela, ' +
                ' vo_auditcondebito, vo_usuavaldebito, vo_fechaavaldebito, vo_usuauditor, ' +
                ' vo_fecusuauditor) ' +
                ' SELECT ' + SqlInt(iVolDestino) + ', vo_prestador, vo_facturatipo, ' +
                         ' vo_facturaestable, vo_facturanro, vo_fechafactura, ' +
                         SqlNumber(ImporteNuevoVolante + ImporteIVA) + ',' +
                         SqlNumber(ImporteIVA) + ',' + SqlNumber(ImporteNuevoVolante) + ',' +
                         ' vo_vencimiento, ''Reemplaza al volante ''|| ' + IntToStr(iVolOrigen) + ',' +
                         SqlValue(Sesion.UserID) + ', actualdate, ' + SqlValue(sNuevoEstado) + ',' +
                        ' vo_usuapro, vo_fechapro, vo_usupago, vo_fechapago, NULL, NULL, ' +
                        ' vo_porboni, vo_facpen, vo_notadebito, vo_montoboni, vo_destinatario, ' +
                        ' vo_delegacion , vo_ordenpago, vo_cheque, vo_fechacheque, vo_tipopago, ' +
                        ' vo_fecharecepcion, ' + SqlValue(GetDelegacionUsuario(Sesion.UserID)) + ',' +
                        ' vo_chequenombre,  vo_ajuste, ' +    // TK 6845
                        ' decode(vo_fecharecepcion_central, NULL, NULL, actualdate), vo_bonificacion, ' +
                        ' vo_estadocheque, vo_proxdigfactura, vo_montopercepcion, vo_montodebito, ' +
                        ' vo_observaciondebito, vo_auditado, vo_usuarioauditoria, ' +
                        ' decode(vo_fechaauditoria, NULL, NULL, actualdate), vo_refacturacion, ' +
                        ' vo_fechaordenpago, vo_norequiereaudi, vo_cai, vo_observaciones_derivacion, ' +
                        ' decode(vo_carga_central, NULL, NULL, actualdate), vo_usuarioortopedia, ' +
                        ' vo_fechaortopedia, vo_fechaproap, vo_mixto, ' + SqlInt(iVolOrigen) + ',' +
                        ' vo_auditcondebito, vo_usuavaldebito, vo_fechaavaldebito, vo_usuauditor, ' +
                        ' vo_fecusuauditor ' +
                   ' FROM svo_volantes ' +
                  ' WHERE vo_volante = ' + SqlInt(iVolOrigen);
        EjecutarSqlST(sSql);
        //--------------cancela el volante original-----------------------------
        sSql := ' UPDATE svo_volantes ' +
                   ' SET vo_estado = ''C'', ' +
                       ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' vo_fechamodif = actualdate, ' +
                       ' vo_volantecancelado = ' + SqlInt(iVolDestino) +
                 ' WHERE vo_volante = ' + SqlInt(iVolOrigen);
        EjecutarSqlST(sSql);
        //--------------inserta los nuevos items (si existen anteriores)--------
        if ExisteSqlEx('SELECT 1 FROM siv_itemvolante ' +
                       ' WHERE iv_volante = :Vol ', [iVolOrigen]) then
        begin
          sSql := 'SELECT iv_siniestro, iv_orden, iv_recaida, iv_numpago ' +
                   ' FROM siv_itemvolante ' +
                  ' WHERE iv_volante = :Vol ';
          Consulta := GetQueryEx(sSql, [iVolOrigen]);
          try
            while not Consulta.Eof do
            begin
              sSql := ' INSERT INTO siv_itemvolante ' +
                      '(iv_volante, iv_siniestro, iv_orden, iv_recaida, iv_numpago, iv_conpago, ' +
                      ' iv_fecpresta, iv_pres_nomenclador, iv_pres_capitulo, iv_pres_codigo, ' +
                      ' iv_presdet, iv_cantidad, iv_numauto, iv_impfacturado, iv_impconvenido, ' +
                      ' iv_imppagsinret, iv_imppagconret, iv_observaciones, iv_estado, iv_usualta, ' +
                      ' iv_fecalta, iv_usumodif, iv_fecmodif, iv_autorizacion, iv_cantapro, iv_motivo, ' +
                      ' iv_numvolante, iv_numdebito, iv_auto_go, iv_motivodebito, iv_auditado) ' +
                      ' SELECT ' + SqlInt(iVolDestino) + ', iv_siniestro, iv_orden, iv_recaida, ' +
                                 ' (SELECT MAX(iv_numpago) + 1 ' +
                                    ' FROM siv_itemvolante iv2 ' +
                                   ' WHERE iv2.iv_siniestro = iv1.iv_siniestro ' +
                                     ' AND iv2.iv_orden = iv1.iv_orden ' +
                                     ' AND iv2.iv_recaida = iv1.iv_recaida), ' +
                             ' iv_conpago, iv_fecpresta, iv_pres_nomenclador, iv_pres_capitulo, iv_pres_codigo, ' +
                             ' iv_presdet, iv_cantidad, iv_numauto, iv_impfacturado, iv_impconvenido, ' +
                             ' iv_imppagsinret, iv_imppagconret, iv_observaciones, iv_estado, ' + SqlValue(Sesion.UserID) + ',' +
                             ' actualdate, NULL, NULL, iv_autorizacion, iv_cantapro, iv_motivo, ' +
                             ' iv_numvolante, iv_numdebito, iv_auto_go, iv_motivodebito, iv_auditado ' +
                        ' FROM siv_itemvolante iv1 ' +
                       ' WHERE iv_volante = ' + SqlInt(iVolOrigen) +
                         ' AND iv_siniestro = ' + SqlInt(Consulta.FieldByName('iv_siniestro').AsInteger) +
                         ' AND iv_orden = ' + SqlInt(Consulta.FieldByName('iv_orden').AsInteger) +
                         ' AND iv_recaida = ' + SqlInt(Consulta.FieldByName('iv_recaida').AsInteger) +
                         ' AND iv_numpago = ' + SqlInt(Consulta.FieldByName('iv_numpago').AsInteger);
              EjecutarSqlST(sSql);
              Consulta.Next;
            end;
          finally
            Consulta.Free;
          end;
          //-------------anula los items del volante origial--------------------
          sSql := 'UPDATE siv_itemvolante ' +
                   ' SET iv_estado = ''X'', ' +
                       ' iv_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' iv_fecmodif = ActualDate ' +
                 ' WHERE iv_volante = ' + SqlInt(iVolOrigen);
          EjecutarSqlST(sSql);
        end;

        // Para volantes AMP: inserta los nuevos items (si existen anteriores)
        if ExisteSqlEx('SELECT 1 FROM sif_itemfacturaamp ' +
                       ' WHERE if_idvolante = :Vol ', [iVolOrigen]) then
        begin
          sSql := 'SELECT if_seqvolante ' +
                   ' FROM sif_itemfacturaamp ' +
                  ' WHERE if_idvolante = :Vol ';
          Consulta := GetQueryEx(sSql, [iVolOrigen]);
          try
            while not Consulta.Eof do
            begin
              sSql := ' INSERT INTO sif_itemfacturaamp ' +
                      '(if_id, if_idvolante, if_idlote, if_idempresa, if_idestableci, if_fecha, ' +
                      ' if_concepto, if_idestudio, if_valorconvenido, if_estado, if_cantfacturada, ' +
                      ' if_valorfacturado, if_cantaprobados, if_valoraprobados, if_observaciones, ' +
                      ' if_fechaalta, if_usualta, if_motivo, if_motivodebito, if_seqvolante, ' +
                      ' if_seqpago, if_seqdebito, if_refitem) ' +
                      ' SELECT art.seq_sif_id.NEXTVAL, ' + SqlInt(iVolDestino) + ', if_idlote, if_idempresa, if_idestableci, if_fecha, ' +
                             ' if_concepto, if_idestudio, if_valorconvenido, if_estado, if_cantfacturada, ' +
                             ' if_valorfacturado, if_cantaprobados, if_valoraprobados, if_observaciones, ' +
                             ' actualdate, ' + SqlValue(Sesion.UserID) + ', if_motivo, if_motivodebito, ' +
                             ' (SELECT NVL(MAX(if_seqvolante) + 1, 1) ' +
                              '   FROM sif_itemfacturaamp ' +
                               '  WHERE if_idvolante = ' + SqlInt(iVolDestino) + '), ' +
                             ' (SELECT NVL(MAX(if2.if_seqpago) + 1, 1) ' +
                                ' FROM sif_itemfacturaamp if2 ' +
                               ' WHERE if2.if_idvolante = ' + SqlInt(iVolDestino) +
                                 ' AND if2.if_idlote = if1.if_idlote ' +
                                 ' AND if2.if_idempresa = if1.if_idempresa ' +
                                 ' AND if2.if_idestableci = if1.if_idestableci ' + '), ' +
                             ' if_seqdebito, if_refitem ' +
                        ' FROM sif_itemfacturaamp if1 ' +
                       ' WHERE if1.if_idvolante = ' + SqlInt(iVolOrigen) +
                         ' AND if1.if_seqvolante = ' + SqlInt(Consulta.FieldByName('if_seqvolante').AsInteger);
              EjecutarSqlST(sSql);
              Consulta.Next;
            end;
          finally
            Consulta.Free;
          end;
          //-------------anula los items del volante origial--------------------
          sSql := 'UPDATE sif_itemfacturaamp ' +
                   ' SET if_estado = ''X'', ' +
                       ' if_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' if_fechamodif = ActualDate ' +
                 ' WHERE if_idvolante = ' + SqlInt(iVolOrigen);
          EjecutarSqlST(sSql);
        end;

        //--------------inserta los nuevos genericos (si existen anteriores)--------
        if ExisteSqlEx('SELECT 1 FROM svg_vol_generico ' +
                       ' WHERE vg_volante = :Vol ', [iVolOrigen]) then
        begin
          sSql := 'SELECT vg_numpago ' +
                   ' FROM svg_vol_generico ' +
                  ' WHERE vg_volante = :Vol ';
          Consulta := GetQueryEx(sSql, [iVolOrigen]);
          try
            while not Consulta.Eof do
            begin
              sSql := ' INSERT INTO svg_vol_generico ' +
                      '(vg_volante, vg_numpago, vg_conpago, vg_prestadesde, vg_prestahasta, ' +
                      ' vg_pres_nomenclador, vg_pres_capitulo, vg_pres_codigo, ' +
                      ' vg_presdet, vg_cantidad, vg_impfacturado, vg_impconvenido, ' +
                      ' vg_imppagconret, vg_observaciones, vg_estado, vg_usualta, ' +
                      ' vg_fecalta, vg_cantapro, vg_motivo) ' +
                      ' SELECT ' + SqlInt(iVolDestino) + ',' +
                                 ' (SELECT NVL(MAX(vg_numpago) + 1, 1) ' +    // TK 9441
                                    ' FROM svg_vol_generico vg2 ' +
                                   ' WHERE vg2.vg_volante = ' + SqlInt(iVolDestino) + '), ' +  // vg1.vg_volante), ' +  // TK 9441: se puso el SqlInt(iVolDestino), y comente el  // vg1.vg_volante)
                             ' vg_conpago, vg_prestadesde, vg_prestahasta, ' +
                             ' vg_pres_nomenclador, vg_pres_capitulo, vg_pres_codigo, ' +
                             ' vg_presdet, vg_cantidad, vg_impfacturado, vg_impconvenido, ' +
                             ' vg_imppagconret, vg_observaciones, vg_estado, ' + SqlValue(Sesion.UserID) + ',' +
                            ' actualdate, vg_cantapro, vg_motivo ' +
                       ' FROM svg_vol_generico vg1 ' +
                      ' WHERE vg_volante = ' + SqlInt(iVolOrigen) +
                        ' AND vg_numpago = ' + SqlInt(Consulta.FieldByName('vg_numpago').AsInteger);
              EjecutarSqlST(sSql);
              Consulta.Next;
            end;
          finally
            Consulta.Free;
          end;
          //-------------anula los items del volante origial--------------------
          sSql := 'UPDATE svg_vol_generico ' +
                   ' SET vg_estado = ''X'', ' +
                       ' vg_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                       ' vg_fecmodif = ActualDate ' +
                 ' WHERE vg_volante = ' + SqlInt(iVolOrigen);
          EjecutarSqlST(sSql);
        end;
        //---relaciona con el nuevo volante los remitos que haya tenido imputados----
        sSql := 'UPDATE crc_remitoscartas ' +
                  ' SET rc_volante = ' + SqlInt(iVolDestino) + ',' +
                      ' rc_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                      ' rc_fechamodif = ActualDate ' +
                ' WHERE rc_volante = ' + SqlInt(iVolOrigen);
        EjecutarSqlST(sSql);
        //-------------pasa los debitos de auditoria medica de factura que podrian existir--------
        sSql := 'INSERT INTO sin.sdv_debitosvolantes (' +
                ' dv_volante, dv_siniestro, dv_orden, dv_recaida, dv_idmotivo, dv_aplicado, ' +
                ' dv_observacion, dv_usualta, dv_fechaalta, dv_numpago, dv_observacioninterna, ' +
                ' dv_fechaprestacion, dv_idnomenclador, dv_valorprestacion, dv_cantprestacion, ' +
                ' dv_original, dv_codigo, dv_secuencia, dv_codoriginal) ' +
                ' SELECT ' + SqlInt(iVolDestino) + ', dv_siniestro, dv_orden, dv_recaida, ' +
                         ' dv_idmotivo, dv_aplicado, dv_observacion, dv_usualta, ' +
                         ' ActualDate, dv_numpago, dv_observacioninterna, dv_fechaprestacion, ' +
                         ' dv_idnomenclador, dv_valorprestacion, dv_cantprestacion, ' +
                         ' dv_original, dv_codigo, dv_secuencia, dv_codoriginal ' +
                    ' FROM sin.sdv_debitosvolantes ' +
                   ' WHERE dv_volante = ' + SqlInt(iVolOrigen) +
                     ' AND dv_fechabaja IS NULL ';
        EjecutarSqlST(sSql);
        //--------------anula los debitos del volante original ----------------------
        sSql := 'UPDATE sin.sdv_debitosvolantes ' +
                  ' SET dv_fechabaja = ActualDate, ' +
                      ' dv_usubaja = ' + SqlValue(Sesion.UserID) +
                ' WHERE dv_volante = ' + SqlInt(iVolOrigen) +
                  ' AND dv_fechabaja IS NULL';
        EjecutarSqlST(sSql);
        //----------------------------------------------------------------------
        CommitTrans;
        MsgBox('Volante cancelado con éxito, el número del nuevo volante es ' + IntToStr(iVolDestino));
        tbRefrescar.Click;
        //----------------------------------------------------------------------
        try
           MostrarEstado('Imprimiendo el Volante ' + IntToStr(iVolDestino) +  '...');
           rptVolante.sdqConsulta.Close;
           rptVolante.sdqConsulta.ParamByName('pVolante').AsInteger := iVolDestino;
           rptVolante.sdqConsulta.Open;
           rptVolante.Print;
        except
           on E: Exception do ErrorMsg(E, 'Error al Imprimir el Volante ' + IntToStr(iVolDestino));
        end;
        MostrarEstado('Listo');
      //------------------------------------------------------------------------
      except
        on E: Exception do
        begin
          MsgBox(msgError + E.Message, MB_ICONEXCLAMATION);
          if InTransaction then Rollback;
         end;
      end;
    finally
      rptVolante.Free;
    end;
  end;
end;

procedure TfrmConsVol.btnCancelarReemplazoClick(Sender: TObject);
begin
  fpImporteNuevo.ModalResult := mrCancel;
end;

procedure TfrmConsVol.btnAceptarReemplazoClick(Sender: TObject);
begin
  if (ImporteAntVolante > 0) then
  begin
    case CompareFloat(edImporteVolante.Value + edImporteIVA.Value, ImporteAntVolante) of
      -1:
      begin //si es menor, no se puede
        MsgBox('El nuevo monto no puede ser menor que el monto facturado hasta el momento (' + FloatToStr(ImporteAntVolante) + ')', MB_ICONEXCLAMATION);
        Exit;
      end;
      0:  sNuevoEstado := 'L'; //si es igual, queda liquidado
      1:  sNuevoEstado := 'P'; //si es mayor, queda pendiente
    end;
  end
  else sNuevoEstado := 'P';
  ImporteNuevoVolante         := edImporteVolante.Value;
  ImporteIVA                  := edImporteIVA.Value;
  fpImporteNuevo.ModalResult  := mrOk;
end;

procedure TfrmConsVol.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  tbDebitoTotal.Enabled := (sdqDatos.FieldByName('vo_estado').AsString = 'L') and
                           (sdqDatos.FieldByName('vo_montodebito').AsFloat = sdqDatos.FieldByName('vo_monto').AsFloat);

  tbAsignarAuditorVolante.Enabled := Seguridad.Claves.IsActive('VerBtnAsignarAuditorVolante')
                                     and (sdqDatos.FieldByName('vo_estado').AsString = 'PA')
                                     and (not(sdqDatos.FieldByName('vo_fecharecepaudit').IsNull));   // TK 11136

  with sdqEstudios do
  begin
    Close;
    ParamByName('idvolante').Value := sdqDatos.FieldByName('vo_volante').AsInteger;
    Open
  end;

  JvNetscapeSplitter1.Enabled := not sdqEstudios.IsEmpty;
  gbDetalleEstudios.Enabled   := not sdqEstudios.IsEmpty;
  gbDetalleEstudios.Repaint;
  tbOrdenarEstudios.Enabled   := not sdqEstudios.IsEmpty;
  tbImprimirEstudios.Enabled  := not sdqEstudios.IsEmpty;
  tbExportarEstudios.Enabled  := not sdqEstudios.IsEmpty;

  mnuAudiSinD.Checked         := (sdqDatos.FieldByName('vo_auditcondebito').AsString = 'N');
  mnuAudiConD.Checked         := (sdqDatos.FieldByName('vo_auditcondebito').AsString = 'S');
  mnuAvalarDebito.Checked     := not(sdqDatos.FieldByName('vo_fechaavaldebito').IsNull);
end;

procedure TfrmConsVol.tbDebitoTotalClick(Sender: TObject);
var
  sSql: String;
begin
  if (MessageDlg('¿Confirma que desea anular el débito total del volante?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    sSql := 'UPDATE svo_volantes' +
              ' SET vo_estado = ''P'',' +
                  ' vo_montodebito = 0,' +
                  ' vo_observaciondebito = Null,' +
                  ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' vo_fechamodif = ActualDate' +
            ' WHERE vo_volante = ' + SqlInt(sdqDatos.FieldByName('VO_VOLANTE').AsInteger);
    EjecutarSql(sSql);
    sdqDatos.Refresh;
    sdqDatos.Locate('VO_VOLANTE', sdqDatos.FieldByName('VO_VOLANTE').AsInteger, []);
  end;
end;

procedure TfrmConsVol.tbHistoricoClick(Sender: TObject);
var
  i: Integer;
  sAnd: String;
  sSql: String;
begin
  Verificar(not (HayRegistroActivo) or (dbgListado.SelCount < 1), nil, 'Debe seleccionar al menos un registro.');

  for i := 0 to dbgListado.SelectedRows.Count - 1 do
  begin
    sdqDatos.GotoBookmark(Pointer(dbgListado.SelectedRows.Items[i]));
    sAnd := sAnd + ',' + SqlInt(sdqDatos.FieldByName('VO_VOLANTE').AsInteger);
  end;
  sAnd := Copy(sAnd, 2, Length(sAnd)) + ')';

  sSql := 'SELECT hv_id, hv_volante, tb_descripcion, hv_fechaalta, hv_usualta, ' +
                ' art.amebpba.get_estadoprevio_vol(hv_volante, hv_id) anterior, ' +
                ' hv_fechaterminacion ' +
           ' FROM shv_historicovolante, ctb_tablas ' +
          ' WHERE hv_estado = tb_codigo ' +
            ' AND tb_clave = ''MUVOL'' ' +
            ' AND hv_volante IN (' + sAnd;
  sdqHistoricoVolante.Close;
  sdqHistoricoVolante.Sql.Text := sSql + sdHistorico.OrderBy;
  sdqHistoricoVolante.Open;
  fpHistorico.ShowModal;
end;

procedure TfrmConsVol.cpnlFecRecepOrtopediaChange(Sender: TObject);
begin
  if not cpnlFecRecepOrtopedia.Checked then
  begin
    deFechaRecOrtDesde.Clear;
    deFechaRecOrtHasta.Clear;
  end;
end;

procedure TfrmConsVol.cpnlFecRecepLiquidChange(Sender: TObject);
begin
  if not cpnlFecRecepLiquid.Checked then
  begin
    deFechaRecLiqDesde.Clear;
    deFechaRecLiqHasta.Clear;
  end;
end;

procedure TfrmConsVol.pnlFechaRecepChange(Sender: TObject);
begin
  if not pnlFechaRecep.Checked then
  begin
    deFechaRecepDesde.Clear;
    deFechaRecepHasta.Clear;
  end;
end;

procedure TfrmConsVol.pnlFechaAltaChange(Sender: TObject);
begin
  if not pnlFechaAlta.Checked then
  begin
    deFechaAltaDesde.Clear;
    deFechaAltaHasta.Clear;
  end;
end;

procedure TfrmConsVol.pnlFechaAutoChange(Sender: TObject);
begin
  if not pnlFechaAuto.Checked then
  begin
    deFechaAutoDesde.Clear;
    deFechaAutoHasta.Clear;
  end;
end;

procedure TfrmConsVol.pnlFechaAproChange(Sender: TObject);
begin
  if not pnlFechaApro.Checked then
  begin
    deFechaAproDesde.Clear;
    deFechaAproHasta.Clear;
  end;
end;

procedure TfrmConsVol.pnlFechaChange(Sender: TObject);
begin
  if not pnlFecha.Checked then
  begin
    deFechaDesde.Clear;
    deFechaHasta.Clear;
  end;
end;

function TfrmConsVol.HayRegistroActivo: Boolean;
begin
  Result := sdqDatos.Active and not (sdqDatos.Eof);
end;

procedure TfrmConsVol.fpPrestadorBeforeShow(Sender: TObject);
begin
  edCuitTMP.Text  := sdqDatos.FieldByName('ca_clave').AsString;
  edDescrTMP.Text := sdqDatos.FieldByName('ca_descripcion').AsString;
end;

procedure TfrmConsVol.btnAceptarPresClick(Sender: TObject);
var
  sSql: String;
begin
  iPrestador := 0;
  Verificar(not (CantSel), lvPrestadores, 'Debe seleccionar un prestador.');

  sSql := 'SELECT ca_concertado, ca_auditable, ca_fechabaja' +
           ' FROM cpr_prestador' +
          ' WHERE ca_identificador = :idpres';
  with GetQueryEx(sSql, [iPrestador]) do
  try
    Verificar(not(FieldByName('ca_fechabaja').IsNull) and
              (sdqDatos.FieldByName('vo_fechafactura').AsDateTime >
               FieldByName('ca_fechabaja').AsDateTime), nil,
              'El prestador está dado de BAJA.' + #13 + #10 +
              'La fecha de Factura debe ser menor a ' + FieldByName('ca_fechabaja').AsString);
    Verificar((FieldByName('ca_concertado').AsString <> 'S'), nil,
              'No se puede traspasar un volante a un prestador que no esté habilitado para Facturar');
    Verificar((FieldByName('ca_auditable').AsString = ''), nil,
              'Todavía no se indicó si el prestador es auditable');
  finally
    Free;
  end;
  fpPrestador.ModalResult := mrOk;
end;

function TfrmConsVol.CantSel: Boolean;
var
  iCant, i: Integer;
begin
  iCant := 0;
  for i := 0 to lvPrestadores.Items.Count - 1 do
    if lvPrestadores.Items.Item[i].Checked then
    begin
      Inc(iCant);
      iPrestador := StrToInt(lvPrestadores.Items[i].Caption);
    end;
  Result := (iCant = 1);
end;

{CAMARILLO - 14/08/2007 - seleccion de prestador de la cpr que se cargo en la tmp_svo}
function TfrmConsVol.ShowPrestadores: Boolean;
var
  sSql: String;
begin
  Result  := False;
  sSql    := 'SELECT ca_identificador, utiles.armar_cuit(ca_clave) cuit, ca_secuencia, ca_nombrefanta' +
              ' FROM cpr_prestador' +
             ' WHERE ca_clave = :cuit ';
  with GetQueryEx(sSql, [sdqDatos.FieldByName('ca_clave').AsString]) do
  try
    if Eof then
    begin
      MsgBox('No existe prestador para el CUIT: ' + sdqDatos.FieldByName('ca_clave').AsString + '.', MB_ICONEXCLAMATION);
      Exit;
    end
    else begin
      lvPrestadores.Items.BeginUpdate;
      lvPrestadores.Items.Clear;
      while not Eof do
      begin
        with lvPrestadores.Items.Add do
        begin
          Caption := FieldByName('ca_identificador').AsString;
          SubItems.Add(FieldByName('cuit').AsString);
          SubItems.Add(FieldByName('ca_secuencia').AsString);
          SubItems.Add(FieldByName('ca_nombrefanta').AsString);
        end;
        Next;
      end;
      lvPrestadores.Items.EndUpdate;
      Result := (fpPrestador.ShowModal = mrOk);
    end;
  finally
    Free;
  end;
end;

function TfrmConsVol.ValidarTipoComprobante(iPrestador, iVolOrigen: Integer): Boolean;
const
  MsgInv = 'El tipo de comprobante del prestador no corresponde con el del volante ingresado.' + #13 + #10 +
           'Actualice los datos económicos del prestador o anule el volante y carguelo correctamente.';
var
  sIvaPres, sSql, sTipoCompVol, sTipoCompPres: String;
begin
  Result := False;
  sTipoCompVol := ValorSqlEx('SELECT vo_facturatipo' +
                              ' FROM tmp_svo_volantes' +
                             ' WHERE vo_volante = :vol', [iVolOrigen]);

  sSql := 'SELECT ca_tipocomprobante, ca_iva' +
           ' FROM cpr_prestador' +
          ' WHERE ca_identificador = :prest';
  with GetQueryEx(sSql, [iPrestador]) do
  try
    sTipoCompPres := FieldByName('ca_tipocomprobante').AsString;
    sIvaPres      := FieldByName('ca_iva').AsString;
    if sTipoCompPres = '' then sTipoCompPres := 'FAC';
    if ((sTipoCompPres = 'CI') and (sTipoCompVol <> 'X')) or  //comprobante interno
       (
        ((sTipoCompPres = 'FAC') or (sTipoCompPres = 'REC')) and //factura o recibo
        (((sIvaPres = '1') and not AreIn(sTipoCompVol, ['A', 'B', 'M'])) or
         ((sIvaPres <> '1') and (sTipoCompVol <> 'C')))
       ) or
      ((sTipoCompPres = 'TIC') and (sTipoCompVol <> 'B')) //ticket
     then
    begin
      MessageDlg(MsgInv, mtWarning, [mbOK], 0);
      Exit;
    end
    else
      Result := True;
  finally
    Free;
  end;
end;

procedure TfrmConsVol.cpnlFechaAudChange(Sender: TObject);
begin
  if not cpnlFechaAud.Checked then
  begin
    deFechaAudDesde.Clear;
    deFechaAudHasta.Clear;
  end;
end;

procedure TfrmConsVol.pnlFechaVencChange(Sender: TObject);
begin
  if not pnlFechaVenc.Checked then
  begin
    deFechaVencDesde.Clear;
    deFechaVencHasta.Clear;
  end;
end;

procedure TfrmConsVol.cpnlFechaRecepAudChange(Sender: TObject);
begin
  if not cpnlFechaRecepAud.Checked then
  begin
    deFechaRecepAudDesde.Clear;
    deFechaRecepAudHasta.Clear;
  end;
end;

function TfrmConsVol.Hay1RegistroActivo: Boolean;
begin
  Result := sdqDatos.Active and not(sdqDatos.Eof) and (dbgListado.SelCount = 1);
end;

function TfrmConsVol.HayRegistrosSeleccionados: Boolean; //DGASTAL 08/07/11
begin
  Result := sdqDatos.Active and not(sdqDatos.Eof) and (dbgListado.SelCount > 0);
end;

procedure TfrmConsVol.btnObsAceptarClick(Sender: TObject);
begin
  if (fpObservaciones.Caption = 'Observaciones de Derivación') and (Length(memoObservaciones.Text) < 5) then
    InvalidHint(memoObservaciones, 'Debe ingresar al menos 5 caracteres')
  else
    fpObservaciones.ModalResult := mrOk;

end;

procedure TfrmConsVol.btnOrdenarHistClick(Sender: TObject);
begin
  sdHistorico.Execute;
end;

procedure TfrmConsVol.edNumDesdeExit(Sender: TObject);
begin
  if (edNumDesde.Text <> '') and (edNumHasta.Text = '') then
    edNumHasta.Text := edNumDesde.Text;
end;

procedure TfrmConsVol.edImporteVolanteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ThousandSeparator then Key := DecimalSeparator;
end;

procedure TfrmConsVol.edImporteIVAKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ThousandSeparator then Key := DecimalSeparator;
end;

procedure TfrmConsVol.edImporteVolanteExit(Sender: TObject);
begin
  edImporteTotal.Value := edImporteVolante.Value + edImporteIVA.Value;
end;

procedure TfrmConsVol.mnuImpRemitoMPClick(Sender: TObject);
begin
  if fpRemitoMalaPraxis.ShowModal = mrOk then
    DoImprimirRemitoMP(dcFechaMP.Date, IIF(rbUsuarioMP.Checked, fraUsuarioMP.edCodigo.Text, fraDelegacionMP.Codigo),
                       IIF(rbUsuarioMP.Checked, False, True));
end;

procedure TfrmConsVol.rbUsuarioMPClick(Sender: TObject);
begin
  fraUsuarioMP.Limpiar;
  fraDelegacionMP.Clear;
  fraUsuarioMP.Enabled    := rbUsuarioMP.Checked;
  fraDelegacionMP.Enabled := rbDelegMP.Checked;
end;

procedure TfrmConsVol.btnAceptarMPClick(Sender: TObject);
begin
  Verificar(rbUsuarioMP.Checked and fraUsuarioMP.IsEmpty, fraUsuarioMP, 'Debe seleccionar un usuario.');
  Verificar(rbDelegMP.Checked and fraDelegacionMP.IsEmpty, fraDelegacionMP, 'Debe seleccionar una delegación.');
  Verificar(dcFechaMP.IsEmpty, dcFechaMP, 'Debe seleccionar una fecha.');
  fpRemitoMalaPraxis.ModalResult := mrOk;  
end;

procedure TfrmConsVol.fpRemitoMalaPraxisBeforeShow(Sender: TObject);
begin
  rbUsuarioMP.Checked := True;
  fraUsuarioMP.Cargar(Sesion.UserID);
  dcFechaMP.Date := DBDate;
end;

procedure TfrmConsVol.tbOrdenarEstudiosClick(Sender:TObject);
begin
  SortDialog1.Execute
end;

procedure TfrmConsVol.tbImprimirEstudiosClick(Sender: TObject);
begin
  rptEstudiosVolante := TrptEstudiosVolante.Create(self);
  try
    rptEstudiosVolante.sdqEstudios.Close;
    rptEstudiosVolante.sdqEstudios.ParamByName('idvolante').Value := sdqDatos.FieldByName('vo_volante').AsInteger;
    rptEstudiosVolante.sdqEstudios.Open;
    Visualizar(rptEstudiosVolante, GetValores(), [oForceShowModal])
  finally
    rptEstudiosVolante.Free
  end
end;

procedure TfrmConsVol.tbFechaTermClick(Sender: TObject);
var
  sSql, sUsu: String;
begin
  Verificar(not sdqDatos.FieldByName('vo_fechaterminacion').IsNull, tbFechaTerm,
            'El volante ya posee fecha de terminación.');
  if IsRegistrosReasignarValidos and (fpFechaTerm.ShowModal = mrOk) then
  try
    sSql := 'UPDATE svo_volantes' +
              ' SET vo_fechamodif = actualdate,' +
                  ' vo_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                  ' vo_fechaterminacion = ' + SqlDate(dcTerminacion.Date) +
            ' WHERE vo_volante = ' + SqlInt(sdqDatos.FieldByName('vo_volante').AsInteger);
    EjecutarSql(sSql);

    sSql := 'SELECT MAX(a.hv_usualta) ' +
             ' FROM shv_historicovolante a ' +
            ' WHERE a.hv_volante = :Vol ' +
              ' AND a.hv_estado LIKE ''D%'' ' +
              ' AND a.hv_fechaalta = (SELECT MAX(b.hv_fechaalta) ' +
                                      ' FROM shv_historicovolante b ' +
                                     ' WHERE b.hv_volante = a.hv_volante ' +
                                       ' AND b.hv_estado LIKE ''D%'') ';
    sUsu := ValorSqlEx(sSql, [sdqDatos.FieldByName('vo_volante').AsInteger]);

    if not(IsEmptyString(sUsu)) then
      unMoldeEnvioMail.EnviarMailBD(sUsu, 'Derivación de volante - Nº ' + sdqDatos.FieldByName('vo_volante').AsString + ' finalizada',
                                    [oBodyIsRTF, oAutoFirma], 'Volante: ' + sdqDatos.FieldByName('vo_volante').AsString +
                                    ' - Usuario de terminación: ' + Sesion.Usuario);
    sdqDatos.Refresh;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al grabar la fecha de terminación.');
  end;
end;

procedure TfrmConsVol.btnAceptarTermClick(Sender: TObject);
var
  dDeriv :TDate;
begin
  Verificar(dcTerminacion.IsEmpty, dcTerminacion, 'Debe ingresar la fecha.');
  dDeriv := ValorSqlDateTimeEx('SELECT art.amebpba.get_fechacambiovolante(:Vol, ''D'') FROM dual',
                                [sdqDatos.FieldByName('vo_volante').AsInteger]);
  Verificar(dcTerminacion.Date < dDeriv, dcTerminacion,
            'La fecha de Terminación no puede ser anterior a la de Derivación (' + DateToStr(dDeriv) + ').');
  fpFechaTerm.ModalResult := mrOk;
end;

procedure TfrmConsVol.cpnlFechaTerminacionChange(Sender: TObject);
begin
  if not cpnlFechaTerminacion.Checked then
  begin
    deFechaTermDesde.Clear;
    deFechaTermHasta.Clear;
  end;
end;

function TfrmConsVol.GetDelegacionUsuario(sIdUsuario: string): string;   // TK 6845
var
  sSql: string;
begin
  sSql := 'SELECT se_delegacion FROM use_usuarios ' +
          ' WHERE se_usuario = :Usu';
  Result := ValorSqlEx(sSql, [sIdUsuario]);
end;

procedure TfrmConsVol.mnuAudiSinDClick(Sender: TObject);
begin
  DoAuditarVolante(False);
end;

procedure TfrmConsVol.DoAuditarVolante(bConDebito :Boolean);
var
  sEstado, sSql, sUsuLiq: String;
begin
  if IsRegistrosAuditoriaValidos(bConDebito) then
  begin
    if bConDebito then
      DoAuditarVolanteConDebito
    else if MsgAsk('¿Confirma que el volante seleccionado fue auditado sin débito?') then
    try
      if CompareFloat(sdqDatos.FieldByName('vo_monto').AsFloat -
                      sdqDatos.FieldByName('vo_montopercepcion').AsFloat -
                      sdqDatos.FieldByName('vo_montodebito').AsFloat,
                      sdqDatos.FieldByName('vo_facpen').AsFloat) = 0 then
      begin
        sEstado :=  IIF(sdqDatos.FieldByName('vo_mixto').AsString = 'S', 'LM', 'L');
        sUsuLiq := ', vo_usuliqui = ' + SqlValue(Sesion.UserID) +
                   ', vo_fechaliqui = ActualDate';
      end
      else
        sEstado := 'P';

      sSql := 'UPDATE svo_volantes' +
                ' SET vo_auditado = ''S'',' +
                    ' vo_auditcondebito = ' + IIF(bConDebito, '''S''', '''N''') + ',' +
                    ' vo_fechaauditoria = actualdate,' +
                    ' vo_usuarioauditoria = ' + SqlValue(Sesion.UserID) + ',' +
                    ' vo_norequiereaudi = ''N'', ' +
                    ' vo_estado = ' + SqlValue(sEstado) +  ', ' +
                    ' vo_usuauditor = null, ' +
                    ' vo_fecusuauditor = null ' + sUsuLiq +
              ' WHERE vo_volante = ' + SqlInt(sdqDatos.FieldByName('vo_volante').AsInteger);
      EjecutarSql(sSql);
      mnuAudiSinD.Checked := not(bConDebito);
      mnuAudiConD.Checked := bConDebito;
      sdqDatos.Refresh;
    except
      on E: Exception do
        raise Exception.Create(E.Message + CRLF + 'Error al grabar la auditoría.');
    end;
  end;
end;

procedure TfrmConsVol.mnuAudiConDClick(Sender: TObject);
begin
  DoAuditarVolante(True);
end;

procedure TfrmConsVol.mnuAvalarDebitoClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  Verificar(not AreIn(sdqDatos.FieldByName('vo_estado').AsString, ['A', 'AP', 'AM', 'AAM']),
            nil, 'El volante seleccionado no se encuentra en estado Aprobado.');
  Verificar((sdqDatos.FieldByName('vo_auditcondebito').AsString <> 'S') ,
             nil, 'El volante seleccionado no ha sido auditado con débito.');
  Verificar(not(sdqDatos.FieldByName('vo_fechaavaldebito').IsNull),
             nil, 'El volante seleccionado ya ha sido avalado.');

  if MsgAsk('¿Confirma el aval del volante auditado con débito?') then
  try
    sSql := 'UPDATE svo_volantes' +
              ' SET vo_fechaavaldebito = actualdate,' +
                  ' vo_usuavaldebito = ' + SqlValue(Sesion.UserID) +
            ' WHERE vo_volante = ' + SqlInt(sdqDatos.FieldByName('vo_volante').AsInteger);
    EjecutarSql(sSql);
    mnuAvalarDebito.Checked := True;
    sdqDatos.Refresh;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al grabar el aval.');
  end;
end;

procedure TfrmConsVol.cpnlPendAuditChange(Sender: TObject);
begin
  if not cpnlPendAudit.Checked then cmbPendAuditar.ItemIndex := 2;
end;

function TfrmConsVol.SetNuevoEstado(sNuevoEst, sMixto, sAntEst :String; iVolOrigen :Integer) :String;
var
  sEstado, sGEN :String;
begin
  if (sNuevoEst = 'P') then
    sEstado := sAntEst
  else if (sMixto = 'S') then
    sEstado := 'LM'
  else if (sAntEst = 'PM') then
    sEstado := 'LAM'
  else begin
    sGEN := 'SELECT 1 FROM svg_vol_generico ' +
            ' WHERE vg_volante = :Vol ' +
              ' AND vg_estado <> ''X'' ';
    if ExisteSqlEx(sGEN, [iVolOrigen]) then
      sEstado := 'LG'
    else
      sEstado := 'L';
  end;

  Result := sEstado;
end;

procedure TfrmConsVol.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsVol.tbAsignarAuditorVolanteClick(Sender: TObject);  // TK 11136
var sSql, sUsuAuditor, sFecha: string;
begin
  if (not sdqDatos.Eof) and (fpAsignarAuditorVolante.ShowModal = mrOk) then
  begin
    BeginTrans;
    try
      if fraUsuAuditor.IsEmpty then
      begin
        sUsuAuditor := ' null ';
        sFecha      := ' null ';
      end
      else begin
        sUsuAuditor := SqlValue(fraUsuAuditor.edCodigo.Text);
        sFecha      := ' trunc(sysdate) ';
      end;

      sSql := 'UPDATE svo_volantes' +
                ' SET vo_usuauditor = ' + sUsuAuditor + ', ' +
                    ' vo_fecusuauditor = ' + sFecha + 
              ' WHERE vo_volante = ' + SqlInt(edVolanteUsuAudit.Text);
      EjecutarSqlST(sSql);
      CommitTrans;
      tbRefrescarClick(nil);
    except
      on E: Exception do
      begin
        if InTransaction then Rollback;
        ErrorMsg(E, 'Error al guardar los datos');
      end;
    end;
  end;
end;

procedure TfrmConsVol.btnAceptarUsuAuditClick(Sender: TObject);    // TK 11136
begin
  fpAsignarAuditorVolante.ModalResult := mrOk;
end;

procedure TfrmConsVol.fpAsignarAuditorVolanteBeforeShow(Sender: TObject);  // TK 11136
begin
  edVolanteUsuAudit.Text := sdqDatos.FieldByName('VO_VOLANTE').AsString;
  fraUsuAuditor.Cargar(sdqDatos.FieldByName('VO_USUAUDITOR').AsString);
  fraUsuAuditor.sql := fraUsuAuditor.sql + ' AND EXISTS (SELECT 1 ' +
                                                         ' FROM svu_auditoresvolantes ' +
                                                        ' WHERE vu_usuauditor = se_usuario ' +
                                                          ' AND vu_fechabaja IS NULL) ';
end;

procedure TfrmConsVol.tbLimpiarAuditorAsignadoClick(Sender: TObject);
begin
  fraUsuAuditor.edCodigo.Text       := '';   // tuve que blanquearlo asi porque sino me da abstract error.
  fraUsuAuditor.cmbDescripcion.Text := '';
end;

procedure TfrmConsVol.cpnlAuditorVolanteChange(Sender: TObject);
begin
  if not cpnlAuditorVolante.Checked then
  begin
    fraUsuAuditorFiltro.edCodigo.Text       := '';
    fraUsuAuditorFiltro.cmbDescripcion.Text := '';
  end;
end;

function TfrmConsVol.ValidarAuditar: Boolean;  // TK 11136
var
  iNroVolante: integer;
begin
  iNroVolante := sdqDatos.FieldByName('VO_VOLANTE').AsInteger;
  Verificar(TieneAuditorAsignado(iNroVolante) and not Auditor_EsAuditorLogueado(iNroVolante),
             nil, 'No puede auditar/no auditar ya que usted no es el Auditor asignado a este volante. Auditor Asignado: ' +
             sdqDatos.FieldByName('VO_USUAUDITOR').AsString); 
  Result := True;
end;

function TfrmConsVol.TieneAuditorAsignado(iNroVolante: integer): boolean;    // TK 11136
var
  sSql: string;
begin
  sSql := 'SELECT vo_usuauditor ' +
           ' FROM svo_volantes ' +
          ' WHERE vo_volante = :nrovol';
  Result := (ValorSqlEx(sSql, [iNroVolante]) <> '');
end;

function TfrmConsVol.Auditor_EsAuditorLogueado(iNroVolante: integer): boolean;  // TK 11136
var
  sSql: string;
begin
  sSql := 'SELECT vo_usuauditor ' +
           ' FROM svo_volantes ' +
          ' WHERE vo_volante = :nrovol';
  Result := (ValorSqlEx(sSql, [iNroVolante]) = Sesion.UserID)
end;

procedure TfrmConsVol.cpnlUsuAuditoriaChange(Sender: TObject);    // TK 16517
begin
  if not cpnlUsuAuditoria.Checked then
  begin
    fraUsuarioAuditoria.edCodigo.Text       := '';
    fraUsuarioAuditoria.cmbDescripcion.Text := '';
  end;
end;

procedure TfrmConsVol.DoAuditarVolanteConDebito;
begin
  with TfrmDebitosAuditoria.Create(Self) do
  try
    if Execute(sdqDatos.FieldByName('vo_volante').AsInteger, 0, 0, 0,
               sdqDatos.FieldByName('vo_estado').AsString, False, False, True) then
      Self.tbRefrescarClick(Nil);
  finally
    Free;
  end;
end;

procedure TfrmConsVol.munAvalDebitoPendienteClick(Sender: TObject);
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  Verificar(sdqDatos.FieldByName('vo_estado').AsString <> 'PV', nil,
            'El volante seleccionado no se encuentra en estado Pendiente de Aval.');
  with TfrmDebitosAuditoria.Create(Self) do
  try
    if Execute(sdqDatos.FieldByName('vo_volante').AsInteger, 0, 0, 0,
               sdqDatos.FieldByName('vo_estado').AsString, True, False, True) then
        Self.tbRefrescarClick(Nil);
  finally
    Free;
  end;
end;

procedure TfrmConsVol.mnuVerDebitosPorAuditoriaClick(Sender: TObject);
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  with TfrmDebitosAuditoria.Create(Self) do
  try
    Execute(sdqDatos.FieldByName('vo_volante').AsInteger, 0, 0, 0,
            sdqDatos.FieldByName('vo_estado').AsString, False, True, True);
  finally
    Free;
  end;
end;

procedure TfrmConsVol.mnuAgregarDiscrepanciaClick(Sender: TObject);
begin
  DoDiscrepancia(False, False);
end;

procedure TfrmConsVol.DoDiscrepancia(bAval, bSoloLectura: Boolean);
var
  sSql, sFin, sAval: String;
  iVolante: Integer;
begin
  Verificar(not(Hay1RegistroActivo), nil, 'Debe seleccionar un registro.');
  Verificar(sdqDatos.FieldByName('vo_fecharecepaudit').IsNull, nil,
            'El volante seleccionado no fue recepcionado en el sector.');
  iVolante  := sdqDatos.FieldByName('vo_volante').AsInteger;
  sSql      := 'SELECT 1 ' +
                ' FROM sin.sda_discrepanciasauditoria ' +
               ' WHERE da_volante = :vol ' +
                 ' AND da_fechabaja IS NULL ';
  sAval     := ' AND da_aval = :aval ';
  sFin      := ' AND da_finalizada = :fin ';

  Verificar(not(bSoloLectura) and not(bAval) and ExisteSqlEx(sSql + sFin, [iVolante, 'S']),
            nil, 'La discrepancia ingresada para el volante ya ha sido finalizada.');
  Verificar(not(bSoloLectura) and not(bAval) and  ExisteSqlEx(sSql + sAval, [iVolante, 'S']),
            nil, 'La discrepancia ingresada para el volante ya ha sido avalada.');
  Verificar(not(bSoloLectura) and bAval and not(ExisteSqlEx(sSql, [iVolante])),
            nil, 'Aun no se ha cargado ninguna discrepancia para el volante seleccionado.');
  Verificar(not(bSoloLectura) and bAval and ExisteSqlEx(sSql + sFin, [iVolante, 'N']),
            nil, 'La discrepancia ingresada para el volante aun no ha sido finalizada.');
  with TfrmDiscrepanciasAuditoria.Create(Self) do
  try
    Execute(sdqDatos.FieldByName('vo_volante').AsInteger, bAval, bSoloLectura);
  finally
    Free;
  end;
end;

procedure TfrmConsVol.mnuAvalarDiscrepanciaClick(Sender: TObject);
begin
  DoDiscrepancia(True, False);
end;

procedure TfrmConsVol.mnuVisualizarDiscrepanciaClick(Sender: TObject);
begin
  DoDiscrepancia(False, True);
end;

procedure TfrmConsVol.mnuImpNotaDebitoInternaClick(Sender: TObject);
begin
  DoGenerarNotaDebito(tsImpresion, True);
end;

procedure TfrmConsVol.mnuSeleccionartodosClick(
  Sender: TObject);
begin
  if mnuSeleccionartodos.Checked = false then
  begin
    mnuSeleccionartodos.Checked := true;
    dbgListado.SelectAll;
  end
  else
  begin
    mnuSeleccionartodos.Checked := false;
    dbgListado.UnselectAll;
  end;
end;



procedure TfrmConsVol.GenerarVariasND(vTipoSalida: TTipoSalida; bInternaAMF: Boolean); //DGASTAL 04/07/11
var
  enviado, NotaAMP: Boolean;
  Reporte: TrptNotaDebito;
  ReporteAMP: TrptNDAMP;
  Tipo: TTipoNota;
  vMailPrestador, vNombreArchivo, prestanterior, ssql, mensaje: String;
  iVolante, i, numND, iPosic: Integer;
  Adjuntos: TArrayOfAttach;
  VolantesEnviados: array of integer;
  NoEnviados: array of string;
  tDest: TTipoDestinario;
begin
  Reporte := nil;
  ReporteAMP := nil;
  verificar((pnlFechaAuto.Checked = false) or (deFechaAutoDesde.IsEmpty) or (deFechaAutoHasta.IsEmpty) or (chkConNotaDebito.Checked = false) or (condicionesND = false) or
           ((cmbEstados.Checked[5] = false) and (cmbEstados.Checked[6] = false) and (cmbEstados.Checked[7] = false)),
             tbenviarmail, 'Para enviar múltiples notas de débito, se deben cumplir las siguientes condiciones: ' + chr(13) +
                           '* La marca ''Con nota débito'' debe estar seleccionada' + chr(13) +
                           '* Debe seleccionar un rango de fechas de autorización' + chr(13) +
                           '* El estado debe ser ''Autorizado el pago'', ''Autorizado el pago - Genérico'' o ''Autorizado el pago - Mixto''');

  if msgask('Confirma el envío para todos los volantes seleccionados?') = true then
  begin
    cds.EmptyDataSet;
    for i := 0 to dbgListado.SelectedRows.Count - 1 do
    begin
      dbgListado.GotoSelection(i);
      cds.Append;
      cdsVolante.AsInteger := sdqDatos.FieldByName('vo_volante').AsInteger;
      cdsIdentificador.AsString := sdqDatos.FieldByName('ca_identificador').AsString;
      cdsMail.AsString := sdqDatos.FieldByName('ca_maildebitos').AsString;
      cdsPrestador.AsString := sdqDatos.FieldByName('ca_descripcion').AsString;
      cds.Post;
    end;

    cds.First;
    prestanterior := cdsIdentificador.AsString;

    repeat
      iVolante  := cdsVolante.AsInteger;
      sdqDatos.Locate('vo_volante', iVolante, []);

      if cdsMail.AsString = '' then
      begin
        SetLength(NoEnviados, length(NoEnviados) + 1);
        NoEnviados[length(NoEnviados) - 1] := cdsPrestador.AsString;
      end;

      repeat
        Tipo := tnGenerica;
        NotaAMP := False;
        iVolante := cdsVolante.AsInteger;
        SetLength(VolantesEnviados, length(VolantesEnviados) + 1);
        VolantesEnviados[length(VolantesEnviados) - 1] := iVolante;

        if bInternaAMF and ExisteSqlEx(sSqlInt, [iVolante]) then
          Tipo := tnInterna
        else if ExisteSqlEx(sSqlNor, [iVolante]) then
          Tipo := tnNormal
        else if ExisteSqlEx(sSqlGen, [iVolante]) then
          Tipo := tnGenerica
        else if ExisteSqlEx(sSqlAMP, [iVolante]) then
          NotaAMP := True;

        if NotaAMP then
          ReporteAMP := TrptNDAMP.Create(Self)
        else
          Reporte := TrptNotaDebito.Create(Self);

        try
          begin
            numND := ValorSqlEx('SELECT vo_notadebito' +
                                 ' FROM svo_volantes ' +
                                ' WHERE vo_volante = :vol', [iVolante]);

            if NotaAMP then
              ReporteAMP.ImprimirNDAMP(StrToInt('0' + IntToStr(iVolante)), trAMPNone)
            else
              Reporte.Imprimir(iVolante, Tipo, trNone);

            vNombreArchivo := IncludeTrailingBackslash(TempPath) + 'NotaDebito' + inttostr(numND) + '.PDF';
            vMailPrestador := StringReplace(cdsMail.AsString, ' ', '', [rfReplaceAll]);

            if NotaAMP then
              ExportarPDF(ReporteAMP, vNombreArchivo)
            else
              ExportarPDF(Reporte, vNombreArchivo);

            iPosic := Length(Adjuntos)+1;
            SetLength(Adjuntos, iPosic);
            Adjuntos[iPosic-1] := GetAttach(vNombreArchivo, 7);
          end;
        finally
          if NotaAMP then
            ReporteAMP.Free
          else
            Reporte.Free;
        end;

        prestanterior := cdsIdentificador.AsString;
        cds.Next;
      until (prestanterior <> cdsIdentificador.AsString) or (cds.Eof);

      if vMailPrestador <> '' then
      begin
        tDest := tdContactoContrato;
        enviado := unMoldeEnvioMail.EnviarMailBD(vMailPrestador, 'Nota de Débito.',
                                           [oShowDialogIfEmpty, oDeleteAttach],
                                           'Se adjunta Nota de Débito correspondiente.' + CRLF + CRLF + 'Provincia ART',
                                           Adjuntos, 0, tcDefault, True, False, 2500, -1, [tDest], 'Liquidaciones - Provincia ART');//, [tdContactoContrato], );
        if enviado = true then
        begin
          for i:= 0 to length(VolantesEnviados) - 1 do
          begin
            ssql := 'update art.svo_volantes set vo_fechaenviond = art.actualdate, vo_usuenviond = :usu where vo_volante = :vol';
            EjecutarSqlEx(ssql, [sesion.UserID, VolantesEnviados[i]]);
          end;
        end;
      end;
      SetLength(Adjuntos, 0);
      SetLength(VolantesEnviados, 0);
    until cds.Eof;

    if length(NoEnviados) > 0 then
    begin
      mensaje := 'No se puede enviar a los siguientes prestadores porque no tienen una dirección de e-mail válida: ' + chr(13);
      for i := 0 to length(NoEnviados) - 1 do
        mensaje := mensaje + NoEnviados[i] + chr(13);
      msgbox(mensaje);
    end;
  end;

end;


procedure TfrmConsVol.ToolButton3Click(Sender: TObject);
begin
  GenerarVariasND(tsMail);
end;

procedure TfrmConsVol.pnlFechaEnvioNDChange(Sender: TObject);
begin
  if not cpnlFechaAud.Checked then
  begin
    cbFechaEnvioNDDesde.Clear;
    cbFechaEnvioNDHasta.Clear;
  end;
end;

procedure TfrmConsVol.DetalleEstudiosAMP1Click(Sender: TObject);
begin
  ExportDialogAMP.Execute;
end;

procedure TfrmConsVol.tbExportarEstudiosClick(Sender: TObject);
begin
  ExportDialogAMP.Execute;
end;

procedure TfrmConsVol.mnuExportarTodoClick(Sender: TObject);   // TK 48301
begin
  ExportDialog.Execute;
end;

procedure TfrmConsVol.cpnlFechaTraspasoChange(Sender: TObject);
begin
  if not cpnlFechaTraspaso.Checked then
  begin
    dcFecTrasDesde.Clear;
    dcFecTrasHasta.Clear;
  end;
end;

procedure TfrmConsVol.mnuReimprimirTempClick(Sender: TObject);
var rptVolanteTemp: TrptVolante;
begin
  Verificar(not (HayRegistroActivo), nil, 'Debe seleccionar un registro');
  rptVolanteTemp := TrptVolante.Create(nil);
  try
    try
      rptVolanteTemp.EsTemporal := True;
      with rptVolanteTemp.sdqConsulta do
      begin
        Close;
        Sql.Text :=
          'SELECT ''*'' || substr(''00000000'', 1, 8 - length(to_char(vo_volante))) || to_char(vo_volante) || ''*'' codbarras,' +
                ' substr(''00000000'', 1, 8 - length(to_char(vo_volante))) || to_char(vo_volante) volante,' +
                ' vo_facturatipo || ''-'' || vo_facturaestable  || ''-'' ||  vo_facturanro factura, vo_volante,' +
                ' vo_prestador, vo_facturatipo, vo_facturaestable, vo_facturanro, vo_fechafactura, vo_montobruto,' +
                ' vo_vencimiento, vo_observaciones, vo_fecharecepcion, vo_fechalta, vo_cuitprestador ca_clave, vo_descrprestador ca_descripcion, ca_asistencial,' +
                ' lg_nombre, tb_descripcion tipcomprobante, vo_chequenombre, vo_montopercepcion, vo_usualta,' +
                ' vo_refacturacion, vo_estado, vo_estadopend, utiles.iif_char (cp_cbu1, null, null, cp_cbu1 || ''-'' || cp_cbu2) cbu,' +
                ' vo_montoiva, vo_monto, ca_esreferente ' +
           ' FROM tmp_svo_volantes, cpr_prestador, dlg_delegaciones, ' +
                ' ctb_tablas, ccp_cuentapago' +
          ' WHERE ca_identificador(+) = vo_prestador' +
            ' AND lg_codigo(+) = vo_delegacion' +
            ' AND tb_clave(+)= ''TCOMP''' +
            ' AND tb_codigo(+)= ca_tipocomprobante' +
            ' AND ca_identificador = cp_idacreedor(+)' +
            ' AND cp_tipoacreedor(+) = ''CA''' +
            ' AND cp_fechabaja(+) IS NULL ' +
            ' AND cp_fechaaltamcarga(+) IS NOT NULL ' +
            ' AND vo_volante = ' + sdqDatos.fieldbyname('vo_volante').AsString;
        Open;
      end;
      rptVolanteTemp.PrinterSettings.Copies := 1;

      Application.ProcessMessages; // Fede (Para ver si se soluciona el problema del interior)
      rptVolanteTemp.Print;
      Application.ProcessMessages; // Fede (Para ver si se soluciona el problema del interior)
    except
      MsgBox('Error al Imprimir el Volante.' + #13 + 'El volante no se podrá imprimir.', MB_ICONERROR);
    end;
  finally
    rptVolanteTemp.Free;
  end;
end;

procedure TfrmConsVol.fpVencimientoEgSemBeforeShow(Sender: TObject);
begin
  dcVencimVolEgSem.Date := sdqDatos.FieldByName('vo_vencimiento').AsDateTime;
  dcVencimEgSem.Date := sdqDatos.FieldByName('vo_vencimientoes').AsDateTime;

end;

end.
