unit unAfiAdministracionCartas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unFraCodigoDescripcion, unfraCtbTablas,
  Mask, StdCtrls, IntEdit, ComboEditor, CheckCombo, DBCheckCombo, ToolEdit, DateComboBox, unFraUsuario, unArtDbFrame,
  unFraEmpresa, unFraEmpresaSolicitud, Menus, FormPanel, unFraDomicilio, unArt, unFraEmpresaAfi,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, PatternEdit, CardinalEdit, unFraDomicilioTrab,
  unArtDBAwareFrame, OleServer, JvExExtCtrls, JvComponent, JvSecretPanel, JvExControls, JvSpecialProgress,
  Variants, FolderDialog, unfraCodigoDescripcionExt, BaseGrid, AdvGrid,
  Excel2000, DateUtils, StrUtils, AdvObj, RxToolEdit, RxPlacemnt;

type
  TfrmAfiAdministracionCartas = class(TfrmCustomConsulta)
    pmnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirCartasDocumento: TMenuItem;
    tbRecepcion: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    fpRecepcionCartaDoc: TFormPanel;
    BevelAbm: TBevel;
    btnRecepcionAceptar: TButton;
    btnCancelar: TButton;
    edFechaRecepcion: TDateComboBox;
    lbFRecepcion: TLabel;
    rgRecepOk: TRadioGroup;
    lbCodRecepcion: TLabel;
    fpReemplazar: TFormPanel;
    Bevel1: TBevel;
    btnDatosNuevos: TButton;
    Button1: TButton;
    tbReemplazo: TToolButton;
    gbDatosCartaDoc: TGroupBox;
    fraEmpresaDatosCartaDoc: TfraEmpresaSolicitud;
    gbDatosActuales: TGroupBox;
    fraEmpresaDatosActuales: TfraEmpresaSolicitud;
    btnMismosDatos: TButton;
    sdqCCA_CARTA: TSDQuery;
    sdusdqCCA_CARTA: TSDUpdateSQL;
    pcFiltros: TPageControl;
    tsFiltros0: TTabSheet;
    gbNroCarta: TGroupBox;
    edNroCarta: TIntEdit;
    gbNroCartaDoc: TGroupBox;
    Label1: TLabel;
    edNroCartaDocDesde: TMaskEdit;
    edNroCartaDocHasta: TMaskEdit;
    gbDelegacion: TGroupBox;
    gbCorreoImpresion: TGroupBox;
    gbCodigoNoRecepcion: TGroupBox;
    cmbCodigosNoRecepcion: TCheckCombo;
    gbModulo: TGroupBox;
    gbCodigoTexto: TGroupBox;
    gbCodigoFirmante: TGroupBox;
    gbUsuarioImpresion: TGroupBox;
    fraUsuarioImpresion: TfraUsuarios;
    tsFiltros1: TTabSheet;
    rgRecepcionOK: TRadioGroup;
    gbFormulario: TGroupBox;
    fraEmpresaAfiliaciones: TfraEmpresaSolicitud;
    gbFechaImpresion: TGroupBox;
    Label2: TLabel;
    edFechaImpresionDesde: TDateComboBox;
    edFechaImpresionHasta: TDateComboBox;
    gbFechaReimpresion: TGroupBox;
    Label4: TLabel;
    edFechaReImpresionDesde: TDateComboBox;
    edFechaReImpresionHasta: TDateComboBox;
    gbFechaRecepcion: TGroupBox;
    Label3: TLabel;
    edFechaRecepcionDesde: TDateComboBox;
    edFechaRecepcionHasta: TDateComboBox;
    gbPendientes: TGroupBox;
    chkPendienteImpresion: TCheckBox;
    chkPendienteRecepcion: TCheckBox;
    chkPendienteReemplazo: TCheckBox;
    gbFechaAlta: TGroupBox;
    Label5: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    gbUsuarioAlta: TGroupBox;
    fraUsuarioAlta: TfraUsuarios;
    fraCorreo: TfraStaticCTB_TABLAS;
    fraModulo: TfraStaticCodigoDescripcion;
    fraCodFirmante: TfraStaticCodigoDescripcion;
    fraCodTexto: TfraStaticCodigoDescripcion;
    fraDelegacion: TfraStaticCodigoDescripcion;
    fraCodRecepcion: TfraStaticCTB_TABLAS;
    ToolButton1: TToolButton;
    ToolButton9: TToolButton;
    edCantCartas: TCardinalEdit;
    fraDomicilioDatosCartaDoc: TfraDomicilioTrab;
    fraDomicilioDatosActuales: TfraDomicilioTrab;
    tbRecepcionMasiva: TToolButton;
    fpOpcionesImpresion: TFormPanel;
    Bevel2: TBevel;
    btnAceptarImpresion: TButton;
    btnCancelarImpresion: TButton;
    rbPreview: TRadioButton;
    rbImprimir: TRadioButton;
    edCantCopias: TIntEdit;
    Label7: TLabel;
    btnParar: TButton;
    Label8: TLabel;
    cmbImpresoras: TComboBox;
    BarProgreso: TProgressBar;
    mnuMarcarTodos: TMenuItem;
    mnuDesMarcarTodos: TMenuItem;
    edTotalCartas: TCardinalEdit;
    tbCalcularTotal: TToolButton;
    mnuRecepcion: TPopupMenu;
    mnuRecepcionRowing: TMenuItem;
    mnuRecepcionCorreoArgentino: TMenuItem;
    rgEstado: TRadioGroup;
    mnuCargaMasiva: TMenuItem;
    fpCargaMasivaCartaDoc: TFormPanel;
    Bevel3: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Button2: TButton;
    Button3: TButton;
    dcbFechaRecepcion: TDateComboBox;
    rgRecepcionSiNo: TRadioGroup;
    fraCodigoRecepcion: TfraStaticCTB_TABLAS;
    meNumCartaDoc: TMaskEdit;
    Label12: TLabel;
    gbMultiplesContratos: TGroupBox;
    Label13: TLabel;
    edContratos: TEdit;
    ToolBar1: TToolBar;
    tAgregarTXT: TToolButton;
    tbLimpiarTXT: TToolButton;
    tbFormatoContrato: TToolButton;
    OpenDialog: TOpenDialog;
    tbRecepcionMasiva2: TToolButton;
    fpRecepcionMasiva: TFormPanel;
    rgTipoCarta: TRadioGroup;
    lbModulo: TLabel;
    lbTexto: TLabel;
    lbCorreo: TLabel;
    Label17: TLabel;
    fraModuloRecMas: TfraStaticCodigoDescripcion;
    fraTextoRecMas: TfraStaticCodigoDescripcion;
    fraCorreoRecMas: TfraStaticCTB_TABLAS;
    edArchivo: TEdit;
    OpenDialog1: TOpenDialog;
    ToolBar2: TToolBar;
    tbAgregarExcel: TToolButton;
    tbVerFormato: TToolButton;
    btnProcesar: TButton;
    btnCancelar2: TButton;
    gridErrores: TArtDBGrid;
    dsErrores: TDataSource;
    sdqErrores: TSDQuery;
    fpProcesar: TFormPanel;
    progress: TJvSpecialProgress;
    btnCancelar3: TButton;
    t1: TTimer;
    coolErrores: TCoolBar;
    toolErrores: TToolBar;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    tbImprimir2: TToolButton;
    tbExportar2: TToolButton;
    tbSali2: TToolButton;
    ToolButton10: TToolButton;
    SortDialogErrores: TSortDialog;
    ExportDialogErrores: TExportDialog;
    QueryPrintErrores: TQueryPrint;
    lbAccion: TLabel;
    checkImprimirFirma: TCheckBox;
    checkMostrarLogo: TCheckBox;
    tbCambiarCorreo: TToolButton;
    fpCambiarCorreo: TFormPanel;
    Bevel4: TBevel;
    btnAceptar: TButton;
    btnCancelar4: TButton;
    GroupBox1: TGroupBox;
    fraNuevoCorreo: TfraStaticCTB_TABLAS;
    Label14: TLabel;
    memoObservaciones: TMemo;
    ExcelWB: TExcelWorkbook;
    ExcelWS: TExcelWorksheet;
    ExcelApp: TExcelApplication;
    GroupBox2: TGroupBox;
    fraEntregaMano: TfraUsuarios;
    GroupBox3: TGroupBox;
    fraEntregaManoNuevo: TfraUsuarios;
    tbCambiarFirmante: TToolButton;
    fpCambiarFirmante: TFormPanel;
    btnAceptar2: TButton;
    btnCancelar5: TButton;
    Bevel5: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    fraFirmanteAnterior: TfraStaticCodigoDescripcion;
    fraFirmanteNuevo: TfraStaticCodigoDescripcion;
    tbVerImpresion: TToolButton;
    tbImprimirAvisoRecibo: TToolButton;
    N1: TMenuItem;
    folderDialog: TFolderDialog;
    GroupBox4: TGroupBox;
    fraFormatoSalida: TfraStaticCTB_TABLAS;
    tbCopiar: TToolButton;
    mnuCopiar: TPopupMenu;
    mnuCartaComercial: TMenuItem;
    mnuCartaDocumento: TMenuItem;
    mnuVentanillaElectronica: TMenuItem;
    tbGenerarMultiplesCartas: TToolButton;
    GroupBox5: TGroupBox;
    fraUsuarioReimpresion: TfraUsuarios;
    tbVisualizadorDocumentacionDigitalizada: TToolButton;
    fpVerImpresion: TFormPanel;
    checkMostrarLogo2: TCheckBox;
    checkMostrarFirma: TCheckBox;
    Bevel7: TBevel;
    btnAceptar4: TButton;
    btnCancelar6: TButton;
    tbVerTarifas: TToolButton;
    tbSeguimiento: TToolButton;
    fpSeguimiento: TFormPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    gridSeguimiento1: TArtDBGrid;
    gridSeguimiento2: TArtDBGrid;
    pnButtons: TPanel;
    btnCerrar: TButton;
    sdqSeguimiento1: TSDQuery;
    dsSeguimiento1: TDataSource;
    sdqSeguimiento2: TSDQuery;
    dsSeguimiento2: TDataSource;
    fpSeleccionarCorreo: TFormPanel;
    Label6: TLabel;
    fraCorreo2: TfraStaticCTB_TABLAS;
    btnAceptar5: TButton;
    fpResultadosSRT: TFormPanel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    btnAcetarSRT: TButton;
    GridEnvios: TAdvStringGrid;
    edEnviosTotales: TEdit;
    edEnviosOk: TEdit;
    edEnviosFallados: TEdit;
    lbEnvios: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    GridNoEnviados: TAdvStringGrid;
    GroupBox6: TGroupBox;
    Label23: TLabel;
    edCuits: TEdit;
    ToolBar3: TToolBar;
    tbAgregarTXTCuit: TToolButton;
    tbLimparTXTCuit: TToolButton;
    tbFormatoCuit: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirCartasDocumentoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRecepcionClick(Sender: TObject);
    procedure btnRecepcionAceptarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure rgRecepOkClick(Sender: TObject);
    procedure tbReemplazoClick(Sender: TObject);
    procedure btnDatosNuevosClick(Sender: TObject);
    procedure DoCargarDatosCartaDoc(aIdCartaDoc, aIdUltimoEndoso: TTableId; var fraEmpresaDatos: TfraEmpresaSolicitud;
                                    var fraDomicilioDatos: TfraDomicilioTrab);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbRecepcionMasivaClick(Sender: TObject);
    procedure OpcionesImpresion(Sender: TObject);
    procedure btnCancelarImpresionClick(Sender: TObject);
    procedure btnAceptarImpresionClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesMarcarTodosClick(Sender: TObject);
    procedure tbCalcularTotalClick(Sender: TObject);
    procedure mnuRecepcionCorreoArgentinoClick(Sender: TObject);
    procedure mnuRecepcionRowingClick(Sender: TObject);
    procedure fpOpcionesImpresionEnter(Sender: TObject);
    procedure mnuCargaMasivaClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure rgRecepcionSiNoClick(Sender: TObject);
    procedure fpCargaMasivaCartaDocShow(Sender: TObject);
    procedure meNumCartaDocExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure tAgregarTXTClick(Sender: TObject);
    procedure tbLimpiarTXTClick(Sender: TObject);
    procedure tbFormatoContratoClick(Sender: TObject);
    procedure tbRecepcionMasiva2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure tbVerFormatoClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure tbAgregarExcelClick(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure t1Timer(Sender: TObject);
    procedure fpProcesarShow(Sender: TObject);
    procedure rgTipoCartaClick(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure tbImprimir2Click(Sender: TObject);
    procedure tbExportar2Click(Sender: TObject);
    procedure fpRecepcionMasivaBeforeShow(Sender: TObject);
    procedure tbSali2Click(Sender: TObject);
    procedure fpOpcionesImpresionShow(Sender: TObject);
    procedure btnCancelar4Click(Sender: TObject);
    procedure fpCambiarCorreoShow(Sender: TObject);
    procedure tbCambiarCorreoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure CambiaCorreoNuevo(Sender: TObject);
    procedure CambiaEntregaManoNuevo(Sender: TObject);
    procedure btnCancelar5Click(Sender: TObject);
    procedure fpCambiarFirmanteBeforeShow(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure tbCambiarFirmanteClick(Sender: TObject);
    procedure tbVerImpresionClick(Sender: TObject);
    procedure tbImprimirAvisoReciboClick(Sender: TObject);
    procedure mnuCopiarCartasClick(Sender: TObject);
    procedure tbCopiarClick(Sender: TObject);
    procedure tbGenerarMultiplesCartasClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure tbVisualizadorDocumentacionDigitalizadaClick(Sender: TObject);
    procedure fpVerImpresionKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelar6Click(Sender: TObject);
    procedure fpVerImpresionShow(Sender: TObject);
    procedure btnAceptar4Click(Sender: TObject);
    procedure tbVerTarifasClick(Sender: TObject);
    procedure tbSeguimientoClick(Sender: TObject);
    procedure btnAceptar5Click(Sender: TObject);
    procedure fpSeleccionarCorreoBeforeShow(Sender: TObject);
    procedure btnAcetarSRTClick(Sender: TObject);
    procedure tbFormatoCuitClick(Sender: TObject);
    procedure tbLimparTXTCuitClick(Sender: TObject);
    procedure tbAgregarTXTCuitClick(Sender: TObject);
  private
    FCancelarProceso: Boolean;
    FIdsCartas: String;
    FModoForm: String;
    FPararImpresion: Boolean;
    FRuta: String;

    function GetComputerAndUserName: String;
    function GetCountLineasExcel: Integer;
    function GetRecepcionOk(rg_RecepcOk: TRadioGroup): String;
    function GetRecepcionOk_Busqueda(rg_RecepcionOk: TRadioGroup): String;
    function IsDatosValidosRecepcion(const aFechaImpresion: TDateTime; aFechaRecepcion: TDateComboBox;
                                     aCodigoRecepcion: TfraStaticCTB_TABLAS; aRecepcionOk: TRadioGroup): Boolean;
    function IsEmptyLine(const aValor1, aValor2, aValor3: String): Boolean;
    function IsRegistroModificacionValido: Boolean;
    function IsRegistroRecepcionCartaDocValido: Boolean;
    function IsRegistroReemplazoValido(aIdCarta: TTableId): Boolean;
    function IsRegistrosBajaCartaDocValidos(var sListaIdCartasDocSeleccionadas: String): Boolean;
    function IsRegistrosImpresionCartaDocValidos: Boolean;
    function RecepcionarCartaDocumento(const aCloseWindow: Boolean; const aCartaId: Integer;
                                       const aFechaImpresion: TDateTime; aFechaRecepcion: TDateComboBox;
                                       aCodigoRecepcion: TfraStaticCTB_TABLAS; aRecepcionOk: TRadioGroup): Boolean;
    procedure AceptarImpresion;
    procedure CalcularFilas;
    procedure CargarImpresoras;
    procedure ClearCargaMasivaCartaDoc;
    procedure ClearDatosFormPanel;
    procedure DoEliminarCartasDoc(sListaIdCartasDocSeleccionadas: String);
    procedure DoHabilitarCodigoNoRecepcion;
    procedure DoHabilitarIngresoCodigoRecepcion(rgRecepcOk: TRadioGroup);
    procedure DoInicializarfpReemplazar(const aCartaId: Integer);
    procedure fraCorreoOnChange(Sender: TObject);
    procedure fraModuloOnChange(Sender: TObject);
    procedure fraModuloRecMasOnChange(Sender: TObject);
    procedure GuardarArchivoEnDisco(var aFileName: String; const aIdAdjunto: Integer);
    procedure GuardarFechaImpresion(const aIdCarta: Integer);
    procedure LoadDatosFormPanel;
    procedure ModuloOnChange(aModulo, aCodTexto, aCodFirmante: TfraStaticCodigoDescripcion);
    procedure ProcesarExcel;
    procedure RecepcionCarta;
    procedure VerificarExcel;
    //procedure EnviarSrt(const aArchivo, aComunicacion: String; const aCuit: String; const aTipoComunicacion: Integer);
    //procedure EnviarSrtMasivo(const aArchivo, aComunicacion: String; const aCuit: Array of String; const aTipoComunicacion: Integer);
    procedure AgregarEnvio(const aCuit, aEnvioResultado: String;  var aGrid: TAdvStringGrid);
    procedure RemoverCuitGrillaSRT(aCuit:String; var aGrilla: TAdvStringGrid);
  protected
    procedure SeleccionarFilas(const aShortCut : Integer);
  public
    procedure ImprimirRecienGeneradas(const aIdCartas: String);
  end;

var
  frmAfiAdministracionCartas: TfrmAfiAdministracionCartas;

implementation

uses
  unPrincipal, AnsiSql, VCLExtra, unDmPrincipal, unAfiliaciones, CustomDlgs, SqlFuncs, General, DBFuncs,
  unAfiGeneracionCartas, unCustomDataModule, unrptCartaDocumento, unComunes, unImpoExpoWizard, Printers, unAfiCartasDoc,
  unSesion, unrptCartaDocHeader, DateTimeFuncs, unQRAvisoRecibo, unExcel, Cuit, unGenerarMultiplesCartas, ShellAPI,
  ArchFuncs, unUtilsArchivo, unImportCryptoSrt, unSeleccionarCarpetaSRT;

{$R *.DFM}

procedure TfrmAfiAdministracionCartas.FormCreate(Sender: TObject);
begin
  inherited;

  FIdsCartas := '';

  BarProgreso.Position := 0;

  with fraCodTexto do
  begin
    TableName   := 'ctc_textocarta';
    FieldID     := 'tc_id';
    FieldCodigo := 'tc_codigo';
    FieldDesc   := 'tc_nombre';
    FieldBaja   := 'tc_fechabaja';
    ShowBajas   := True;
  end;

  with fraCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := True;
    OnChange  := fraCorreoOnChange;
  end;
  DoHabilitarCodigoNoRecepcion;

  with fraCorreo2 do
  begin
    Clave     := 'CORRE';
    ShowBajas := True;
  end;

  with fraCorreoRecMas do
  begin
    Clave     := 'CORRE';
    ShowBajas := True;
  end;

  with fraModulo do
  begin
    TableName      := 'cat_areatexto';
    FieldID        := 'at_id';
    FieldCodigo    := 'at_modulo';
    FieldDesc      := 'at_descripcion';
    FieldBaja      := 'at_fechabaja';
    ExtraCondition := 'AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
    ShowBajas      := True;
    OnChange       := fraModuloOnChange;
  end;

  with fraModuloRecMas do
  begin
    TableName      := 'cat_areatexto';
    FieldID        := 'at_id';
    FieldCodigo    := 'at_modulo';
    FieldDesc      := 'at_descripcion';
    FieldBaja      := 'at_fechabaja';
    ExtraCondition := 'AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
    ShowBajas      := True;
    OnChange       := fraModuloRecMasOnChange;
  end;

  with fraTextoRecMas do
  begin
    TableName   := 'ctc_textocarta';
    FieldID     := 'tc_id';
    FieldCodigo := 'tc_codigo';
    FieldDesc   := 'tc_nombre';
    FieldBaja   := 'tc_fechabaja';
    ShowBajas   := True;
  end;

  with fraCodFirmante do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := False;
  end;

  fraModuloOnChange(nil);
  fraUsuarioImpresion.ShowBajas   := True;
  fraUsuarioReimpresion.ShowBajas := True;
  fraUsuarioAlta.ShowBajas        := True;

  with fraDelegacion do
  begin
    TableName   := 'del_delegacion';
    FieldID     := 'el_id';
    FieldCodigo := 'el_id';
    FieldDesc   := 'el_nombre';
    FieldBaja   := 'el_fechabaja';
    ShowBajas   := True;
  end;

  fraEmpresaDatosCartaDoc.Locked   := True;
  fraDomicilioDatosCartaDoc.Locked := True;
  fraEmpresaDatosActuales.Locked   := True;
  fraDomicilioDatosActuales.Locked := True;

  with fraNuevoCorreo do
  begin
    Clave     := 'CORRE';
    ShowBajas := True;
    OnChange  := CambiaCorreoNuevo;
  end;

  with fraFirmanteAnterior do
  begin
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
    ShowBajas   := False;
  end;

  with fraFirmanteNuevo do
  begin
    TableName      := 'cfi_firma';
    FieldID        := 'fi_id';
    FieldCodigo    := 'fi_id';
    FieldDesc      := 'fi_firmante';
    FieldBaja      := 'fi_fechabaja';
    ShowBajas      := False;
  end;

  with fraEntregaMano do
  begin
    Sql :=
      'SELECT   se_usuario as ' + CD_ALIAS_ID + ', se_usuario as ' + CD_ALIAS_CODIGO + ', se_nombre as ' + CD_ALIAS_DESC + ', se_fechabaja as ' + CD_ALIAS_BAJA +
         ' FROM art.use_usuarios, art.usc_sectores' +
        ' WHERE se_sector = sc_codigo' +
          ' AND (   se_sector IN(''COME'', ''TECNICO'')' +
               ' OR sc_delegacion <> 840' +
               ' OR se_usuario IN (''JBALESTRINI'', ''MCLERICI'', ''FMFIRENZE'',  ''JISABELLA'', ''LSARTORI'', ''VSCETTA'')' +
               ' OR se_idsector = 33042)' +    // Sector Afiliaciones, según ticket 22382..
          ' AND se_fechabaja IS NULL' +
          ' AND se_usuariogenerico = ''N''';
  end;

  with fraEntregaManoNuevo do
  begin
    Sql :=
      'SELECT   se_usuario as ' + CD_ALIAS_ID + ', se_usuario as ' + CD_ALIAS_CODIGO + ', se_nombre as ' + CD_ALIAS_DESC + ', se_fechabaja as ' + CD_ALIAS_BAJA +
         ' FROM art.use_usuarios, art.usc_sectores' +
        ' WHERE se_sector = sc_codigo' +
          ' AND (   se_sector IN(''COME'', ''TECNICO'')' +
               ' OR sc_delegacion <> 840' +
               ' OR se_usuario IN (''JBALESTRINI'', ''JISABELLA'', ''VSCETTA'', ''FMFIRENZE'')' +
               ' OR se_idsector = 33042)' +    // Sector Afiliaciones, según ticket 22382..
          ' AND se_fechabaja IS NULL' +
          ' AND se_usuariogenerico = ''N''';
    OnChange := CambiaEntregaManoNuevo;
  end;

  with fraFormatoSalida do
  begin
    Clave     := 'TSCDO';
    ShowBajas := False;
  end;

  fraEmpresaAfiliaciones.ShowBajas := True;

  pcFiltros.ActivePageIndex := 0;

  tbCalcularTotal.ImageIndex := 39;

  LockControls(fraFirmanteAnterior, True);
end;

procedure TfrmAfiAdministracionCartas.tbRefrescarClick(Sender: TObject);
var
  iLoop: Integer;
  sNroCartaDocDesde: String;
  sNroCartaDocHasta: String;
  sRecepcionOK: String;
  sSql: String;
  sSqlWhere: String;
begin
  sSql := '';

  sNroCartaDocDesde := AgregarPrefijoNroCartaDocumento(edNroCartaDocDesde.Text);
  sNroCartaDocHasta := AgregarPrefijoNroCartaDocumento(edNroCartaDocHasta.Text);

  sSqlWhere := SqlBetween(' AND ca_nrocartadoc', sNroCartaDocDesde, sNroCartaDocHasta) +
               SqlBetweenDateTime(' AND ca_fechaimpresion', edFechaImpresionDesde.Date, edFechaImpresionHasta.Date) +
               SqlBetweenDateTime(' AND ca_fechareimpresion', edFechaReImpresionDesde.Date, edFechaReImpresionHasta.Date) +
               SqlBetween(' AND ca_fecharecepcion', edFechaRecepcionDesde.Date, edFechaRecepcionHasta.Date) +
               SqlBetweenDateTime(' AND ca_fechaalta', edFechaAltaDesde.Date, edFechaAltaHasta.Date);

  if not edNroCarta.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ca_id = ' + SqlValue(edNroCarta.Value);

  if not fraCorreo.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND NVL(ca_correoreimpresion, ca_correo) = ' + SqlValue(fraCorreo.edCodigo.Text);

  sRecepcionOK := GetRecepcionOk_Busqueda(rgRecepcionOk);
  if sRecepcionOK <> '' then
    sSqlWhere := sSqlWhere + ' AND ca_recepcionok = ' + SqlValue(sRecepcionOK);

  case rgEstado.ItemIndex of
    0: sSqlWhere := sSqlWhere + ' AND ca_fechabaja IS NULL';
    1: sSqlWhere := sSqlWhere + ' AND ca_fechabaja IS NOT NULL';
  end;

  if not fraEntregaMano.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ca_usuentregaenmano = ' + SqlValue(fraEntregaMano.Value);

  if cmbCodigosNoRecepcion.Text <> '' Then
  begin
    sSqlWhere := sSqlWhere + ' AND ca_codrecepcion IN (';
    for iLoop := 0 to cmbCodigosNoRecepcion.Items.Count - 1 do
      if cmbCodigosNoRecepcion.Checked[iLoop] then
        sSqlWhere := sSqlWhere + '''' + (cmbCodigosNoRecepcion.Items.Objects[iLoop] as TCadena).Cadena + ''',';
    sSqlWhere := Copy(sSqlWhere, 1, Length(sSqlWhere) - 1) + ')';
  end;
  
  if not fraModulo.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ca_idareatexto = ' + SqlValue(fraModulo.Value);

  if not fraCodTexto.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ca_idtextocarta = ' + SqlValue(fraCodTexto.Value);

  if not fraCodFirmante.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND NVL(ca_idfirmareimpresion, ca_idfirma) = ' + SqlValue(fraCodFirmante.Value);

  if not fraUsuarioImpresion.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ca_usuimpresion = ' + SqlValue(fraUsuarioImpresion.Value);

  if not fraUsuarioReimpresion.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ca_usureimpresion = ' + SqlValue(fraUsuarioReimpresion.Value);

  if not fraUsuarioAlta.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ca_usualta = ' + SqlValue(fraUsuarioAlta.Value);

  if not fraFormatoSalida.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ca_tiposalida = ' + SqlValue(fraFormatoSalida.Value);

  if chkPendienteImpresion.Checked then
    sSqlWhere := sSqlWhere + ' AND ca_fechaimpresion IS NULL' +
                             ' AND ca_fechabaja IS NULL';

  if chkPendienteRecepcion.Checked then
    sSqlWhere := sSqlWhere + ' AND ca_fecharecepcion IS NULL' +
                             ' AND ca_fechaimpresion IS NOT NULL';

  if chkPendienteReemplazo.Checked then
    sSqlWhere := sSqlWhere + ' AND ca_fechabaja IS NULL' +
                             ' AND ca_idcartaareemplazar IS NULL' +
                             ' AND ca_recepcionok = ''N''' +
                             ' AND ca_fecharecepcion IS NOT NULL' +
                             ' AND ca_manual = ''N''';

  if not fraDelegacion.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ca_iddelegacion = ' + SqlValue(fraDelegacion.Value);

  if FIdsCartas <> '' then
    sSqlWhere := sSqlWhere + ' AND ca_id IN (' + FIdsCartas + ')';


  sSql :=
    'SELECT utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocartadoc, utiles.armar_cuit(hm_cuit) cuit, hm_cuit cuit2,' +
          ' hm_nombre empresa, TO_CHAR(hc_contrato) contrato, fo_formulario formulario, ht_nombre tipocarta,' +
          ' correo.tb_descripcion ultcorreo, ca_usuimpresion, TRUNC(ca_fechaimpresion) fechaimpresion,' +
          ' DECODE(ca_recepcionok, ''S'', ''SI'', ''NO'') recepcionok, ca_fecharecepcion,' +
          ' codre.tb_descripcion desc_recepcion, TO_CHAR(fi_id) codigofirma, fi_firmante,' +
          ' TRUNC(ca_fechareimpresion) fechareimpresion, ca_observaciones, ca_usureimpresion, ca_id, ca_manual,' +
          ' ca_fechabaja, NVL(ca_correoreimpresion, ca_correo) correo, ca_idcartaareemplazar, ca_recepcionok,' +
          ' ca_codrecepcion, ca_idformulario, ca_idendoso, ca_usualta, TRUNC(ca_fechaalta) fechaalta, el_nombre,' +
          ' afiliacion.get_porcvariablecarta(ca_id) porcvariable, afiliacion.get_sumafijacarta(ca_id) sumafija,' +
          ' ca_idareatexto, ca_correoreimpresion, ca_correo, ca_usuentregaenmano,' +
          ' (SELECT ca_descripcion' +
             ' FROM avc_vendedorcontrato, xev_entidadvendedor, xve_vendedor, aca_canal' +
            ' WHERE vc_id = comision.get_ultidentidadvendcontrato(en_contrato)' +
              ' AND vc_identidadvend = ev_id' +
              ' AND ve_id = ev_idvendedor' +
              ' AND ca_id = ve_idcanal) canal,' +
          ' (SELECT en_nombre' +
             ' FROM avc_vendedorcontrato, xev_entidadvendedor, xen_entidad, xve_vendedor, aca_canal' +
            ' WHERE vc_id = comision.get_ultidentidadvendcontrato(en_contrato)' +
              ' AND vc_identidadvend = ev_id' +
              ' AND en_id = ev_identidad' +
              ' AND ve_id = ev_idvendedor' +
              ' AND ca_id = ve_idcanal) entidad,' +
          ' (SELECT ve_nombre' +
             ' FROM avc_vendedorcontrato, xev_entidadvendedor, xen_entidad, xve_vendedor, aca_canal' +
            ' WHERE vc_id = comision.get_ultidentidadvendcontrato(en_contrato)' +
              ' AND vc_identidadvend = ev_id' +
              ' AND en_id = ev_identidad' +
              ' AND ve_id = ev_idvendedor' +
              ' AND ca_id = ve_idcanal) vendedor, NVL(ca_idfirmareimpresion, ca_idfirma) idfirma, ht_id,' +
          ' DECODE(ca_calle, NULL, NULL, utiles.armar_domicilio(ca_calle, ca_numero, ca_piso, ca_departamento) ||' +
          ' '';'' || ca_localidad || '';'' || pv_descripcion || '';'' ||' +
          ' NVL(iif_char(ca_cpostala, ''99999999'', NULL, ca_cpostala), ca_cpostal)) domicilio, ca_tiposalida,' +
          ' salida.tb_descripcion salida, ca_idadjunto,' +
          ' (SELECT el_nombre' +
             ' FROM del_delegacion, adc_delegacioncontrato' +
            ' WHERE dc_iddelegacion = el_id' +
              ' AND dc_contrato = en_contrato' +                                                                                             
              ' AND actualdate BETWEEN dc_fecha_desde AND NVL(dc_fecha_hasta, SYSDATE + 2)' +
              ' AND ROWNUM = 1) delegacioncontrato, tc_codigo, null artanterior' +
     ' FROM aen_endoso, ahc_historicocontrato, ahm_historicoempresa, afo_formulario, comunes.cht_historicotextocarta,' +
          ' cfi_firma, ctb_tablas salida, ctb_tablas correo, ctb_tablas codre, cat_areatexto, cta_textoarea,' +
          ' del_delegacion, cpv_provincias, ctc_textocarta, cca_carta' +
    ' WHERE ca_idhistoricotextocarta = ht_id' +
      ' AND ta_idtextocarta = ht_idtextocarta' +
      ' AND ta_idareatexto = at_id' +
      ' AND at_area IN(' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')' +
      ' AND correo.tb_codigo(+) = NVL(ca_correoreimpresion, ca_correo)' +
      ' AND correo.tb_clave(+) = ''CORRE''' +
      ' AND codre.tb_codigo(+) = ca_codrecepcion' +
      ' AND codre.tb_clave(+) = ''CODRE''' +
      ' AND salida.tb_clave = ''TSCDO''' +
      ' AND salida.tb_codigo = ca_tiposalida' +
      ' AND hc_idformulario = fo_id' +
      ' AND en_idhistoricocontrato = hc_id' +
      ' AND en_idhistoricoempresa = hm_id' +
      ' AND NVL(ca_idfirmareimpresion, ca_idfirma) = fi_id' +
      ' AND ca_idendoso = en_id' +
      ' AND ca_iddelegacion = el_id' +
      ' AND ca_provincia = pv_codigo(+)' +
      ' AND ca_idtextocarta(+) = tc_id' +
      ' AND ca_idendoso IS NOT NULL' +
            sSqlWhere + ' ';

  if not fraEmpresaAfiliaciones.IsEmpty then
    sSql := sSql + ' AND en_contrato = ' + SqlValue(fraEmpresaAfiliaciones.Contrato);

  if edContratos.Text <> '' then
    sSql := sSql + ' AND en_contrato IN (' + edContratos.Text + ')';

  if edCuits.Text <> '' then
    sSql := sSql + ' AND hm_cuit IN (' + edCuits.Text + ')';

  sSql := sSql + ' UNION ' +
    'SELECT utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocartadoc, utiles.armar_cuit(sa_cuit) cuit, sa_cuit cuit2,' +
          ' sa_nombre empresa, NULL contrato, fo_formulario formulario, ht_nombre tipocarta,' +
          ' correo.tb_descripcion ultcorreo, ca_usuimpresion, TRUNC(ca_fechaimpresion) fechaimpresion,' +
          ' DECODE(ca_recepcionok, ''S'', ''SI'', ''NO'') recepcionok, ca_fecharecepcion,' +
          ' codre.tb_descripcion desc_recepcion, TO_CHAR(fi_id) codigofirma, fi_firmante,' +
          ' TRUNC(ca_fechareimpresion) fechareimpresion, ca_observaciones, ca_usureimpresion, ca_id, ca_manual,' +
          ' ca_fechabaja, NVL(ca_correoreimpresion, ca_correo) correo, ca_idcartaareemplazar, ca_recepcionok,' +
          ' ca_codrecepcion, ca_idformulario, ca_idendoso, ca_usualta, TRUNC(ca_fechaalta) fechaalta, el_nombre,' +
          ' afiliacion.get_porcvariablecarta(ca_id) porcvariable, afiliacion.get_sumafijacarta(ca_id) sumafija,' +
          ' ca_idareatexto, ca_correoreimpresion, ca_correo, ca_usuentregaenmano, NULL canal, NULL entidad,' +
          ' NULL vendedor, NVL(ca_idfirmareimpresion, ca_idfirma) idfirma, ht_id,' +
          ' DECODE(ca_calle, NULL, NULL, utiles.armar_domicilio(ca_calle, ca_numero, ca_piso, ca_departamento) ||' +
          ' '';'' || ca_localidad || '';'' || pv_descripcion || '';'' ||' +
          ' NVL(iif_char(ca_cpostala, ''99999999'', NULL, ca_cpostala), ca_cpostal)) domicilio, ca_tiposalida,' +
          ' salida.tb_descripcion salida, ca_idadjunto, null delegacioncontrato, tc_codigo, ar_nombre artanterior' +
     ' FROM asa_solicitudafiliacion, afo_formulario, comunes.cht_historicotextocarta, cfi_firma, ctb_tablas salida,' +
          ' ctb_tablas correo, ctb_tablas codre, cat_areatexto, cta_textoarea, del_delegacion, cpv_provincias, aar_art,' +
          ' ctc_textocarta, cca_carta' +
    ' WHERE ca_idhistoricotextocarta = ht_id' +
      ' AND ta_idtextocarta = ht_idtextocarta' +
      ' AND ta_idareatexto = at_id' +
      ' AND at_area IN(' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')' +
      ' AND correo.tb_codigo(+) = NVL(ca_correoreimpresion, ca_correo)' +
      ' AND correo.tb_clave(+) = ''CORRE''' +
      ' AND codre.tb_codigo(+) = ca_codrecepcion' +
      ' AND codre.tb_clave(+) = ''CODRE''' +
      ' AND salida.tb_clave = ''TSCDO''' +
      ' AND salida.tb_codigo = ca_tiposalida' +
      ' AND ca_idformulario = sa_idformulario' +
      ' AND sa_idformulario = fo_id' +
      ' AND NVL(ca_idfirmareimpresion, ca_idfirma) = fi_id' +
      ' AND ca_iddelegacion = el_id' +
      ' AND ca_provincia = pv_codigo(+)' +
      ' AND sa_idartanterior = ar_id(+)' +
      ' AND ca_idtextocarta(+) = tc_id' +
      ' AND ca_idendoso IS NULL' +
            sSqlWhere + ' ';

  if not fraEmpresaAfiliaciones.IsEmpty then
    sSql := sSql + ' AND ca_idformulario = ' + SqlValue(fraEmpresaAfiliaciones.Value);

  if edCuits.Text <> '' then
    sSql := sSql + ' AND sa_cuit IN (' + edCuits.Text + ')';

  sSql := sSql + ' UNION ' +
    'SELECT utiles.armar_nrocartadocumento(ca_nrocartadoc) nrocartadoc, utiles.armar_cuit(sa_cuit) cuit, sa_cuit cuit2,' +
          ' sa_nombre empresa, NULL contrato, fo_formulario formulario, ht_nombre tipocarta,' +
          ' correo.tb_descripcion ultcorreo, ca_usuimpresion, TRUNC(ca_fechaimpresion) fechaimpresion,' +
          ' DECODE(ca_recepcionok, ''S'', ''SI'', ''NO'') recepcionok, ca_fecharecepcion,' +
          ' codre.tb_descripcion desc_recepcion, TO_CHAR(fi_id) codigofirma, fi_firmante,' +
          ' TRUNC(ca_fechareimpresion) fechareimpresion, ca_observaciones, ca_usureimpresion, ca_id, ca_manual,' +
          ' ca_fechabaja, NVL(ca_correoreimpresion, ca_correo) correo, ca_idcartaareemplazar, ca_recepcionok,' +
          ' ca_codrecepcion, ca_idformulario, ca_idendoso, ca_usualta, TRUNC(ca_fechaalta) fechaalta, el_nombre,' +
          ' afiliacion.get_porcvariablecarta(ca_id) porcvariable, afiliacion.get_sumafijacarta(ca_id) sumafija,' +
          ' ca_idareatexto, ca_correoreimpresion, ca_correo, ca_usuentregaenmano, NULL canal, NULL entidad,' +
          ' NULL vendedor, NVL(ca_idfirmareimpresion, ca_idfirma) idfirma, ht_id,' +
          ' DECODE(ca_calle, NULL, NULL, utiles.armar_domicilio(ca_calle, ca_numero, ca_piso, ca_departamento) ||' +
          ' '';'' || ca_localidad || '';'' || pv_descripcion || '';'' ||' +
          ' NVL(iif_char(ca_cpostala, ''99999999'', NULL, ca_cpostala), ca_cpostal)) domicilio, ca_tiposalida,' +
          ' salida.tb_descripcion salida, ca_idadjunto, null delegacioncontrato, tc_codigo, ar_nombre artanterior' +
     ' FROM asa_solicitudafiliacion, afo_formulario, comunes.cht_historicotextocarta, cfi_firma, ctb_tablas salida,' +
          ' ctb_tablas correo, ctb_tablas codre, cat_areatexto, cta_textoarea, del_delegacion, cpv_provincias, aar_art,' +
          ' ctc_textocarta, cca_carta, ati_traspasoingreso' +
    ' WHERE ca_idhistoricotextocarta = ht_id' +
      ' AND ta_idtextocarta = ht_idtextocarta' +
      ' AND ta_idareatexto = at_id' +
      ' AND at_area IN(' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')' +
      ' AND correo.tb_codigo(+) = NVL(ca_correoreimpresion, ca_correo)' +
      ' AND correo.tb_clave(+) = ''CORRE''' +
      ' AND codre.tb_codigo(+) = ca_codrecepcion' +
      ' AND codre.tb_clave(+) = ''CODRE''' +
      ' AND salida.tb_clave = ''TSCDO''' +
      ' AND salida.tb_codigo = ca_tiposalida' +
      ' AND sa_idformulario = fo_id' +
      ' AND NVL(ca_idfirmareimpresion, ca_idfirma) = fi_id' +
      ' AND ca_iddelegacion = el_id' +
      ' AND ca_idformulario IS NULL' +
      ' AND ca_provincia = pv_codigo(+)' +
      ' AND sa_idartanterior = ar_id(+)' +
      ' AND ti_idcarta = ca_id' +
      ' AND sa_idformulario = ti_idformulario' +
      ' AND ca_idtextocarta(+) = tc_id' +
            sSqlWhere;

  if not fraEmpresaAfiliaciones.IsEmpty then
    sSql := sSql + ' AND sa_idformulario = ' + SqlValue(fraEmpresaAfiliaciones.Value);

  if edCuits.Text <> '' then
    sSql := sSql + ' AND sa_cuit IN (' + edCuits.Text + ')';

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;

  tbVerTarifasClick(nil);
  
  CalcularFilas;
end;

procedure TfrmAfiAdministracionCartas.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edNroCarta.Clear;
  edNroCartaDocDesde.Clear;
  edNroCartaDocHasta.Clear;
  fraCorreo.Clear;
  fraEntregaMano.Clear;
  cmbCodigosNoRecepcion.Clear;
  fraModulo.Clear;
  rgRecepcionOK.ItemIndex := 2;  // Todos
  rgEstado.ItemIndex      := 0;  // Activas
  fraCodTexto.Clear;
  fraCodFirmante.Clear;
  fraUsuarioImpresion.Clear;
  fraUsuarioReimpresion.Clear;
  edFechaImpresionDesde.Clear;
  edFechaImpresionHasta.Clear;
  chkPendienteImpresion.Checked := False;
  chkPendienteRecepcion.Checked := False;
  chkPendienteReemplazo.Checked := False;
  edFechaRecepcionDesde.Clear;
  edFechaRecepcionHasta.Clear;
  edFechaReImpresionDesde.Clear;
  edFechaReImpresionHasta.Clear;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  fraDelegacion.Clear;
  fraEmpresaAfiliaciones.Clear;
  fraUsuarioAlta.Clear;
  fraFormatoSalida.Clear;
  edContratos.Clear;

  DoHabilitarCodigoNoRecepcion;

  fraModuloOnChange(nil);

  pcFiltros.ActivePageIndex := 0;
  edNroCarta.SetFocus;

  inherited;
end;

procedure TfrmAfiAdministracionCartas.fraCorreoOnChange(Sender: TObject);
var
  sSql: String;
  aId: TCadena;
begin
  sSql :=
    'SELECT   codre.tb_codigo codigo, codre.tb_descripcion descripcion' +
       ' FROM ctb_tablas codre, ctb_tablas corre' +
      ' WHERE codre.tb_clave = ''CODRE''' +
        ' AND codre.tb_codigo <> ''0''' +
        ' AND codre.tb_especial1 = corre.tb_especial2' +
        ' AND corre.tb_clave = ''CORRE''' +
        ' AND corre.tb_codigo = :codigo' +
   ' ORDER BY codre.tb_descripcion';
  with GetQueryEx(sSql, [fraCorreo.edCodigo.Text]) do
  try
    cmbCodigosNoRecepcion.Items.Clear;
    while not Eof do
    begin
      aId := TCadena.Create;
      aId.Cadena := FieldByName('codigo').AsString;
      cmbCodigosNoRecepcion.Items.AddObject(aId.Cadena + ' - ' + FieldByName('descripcion').AsString, aId);
      Next;
    end;

    DoHabilitarCodigoNoRecepcion;
  finally
    Free;
  end;
end;

{ Habilita o deshabilita el ingreso de los códigos de recepción }
procedure TfrmAfiAdministracionCartas.DoHabilitarCodigoNoRecepcion;
var
  bDesHabilitar: Boolean;
begin
  bDesHabilitar := not fraCorreo.IsSelected;
  LockControl(cmbCodigosNoRecepcion, bDesHabilitar);

  if bDesHabilitar then
    cmbCodigosNoRecepcion.Clear;
end;

procedure TfrmAfiAdministracionCartas.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmAfiAdministracionCartas.mnuImprimirResultadosClick(Sender: TObject);
begin
  PrintResults
end;

{ Impresión de las cartas documento seleccionadas }
procedure TfrmAfiAdministracionCartas.mnuImprimirCartasDocumentoClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar al menos una fila de la grilla.')
  else
    if IsRegistrosImpresionCartaDocValidos then
    begin
      btnParar.Enabled := False;
      CargarImpresoras;
      fpOpcionesImpresion.ShowModal;
    end;
end;

{ Determina si las cartas documento seleccionadas en la grilla a imprimir son o no válidas }
function TfrmAfiAdministracionCartas.IsRegistrosImpresionCartaDocValidos: Boolean;
var
  iLoop: Integer;
  bSalir: Boolean;
  sMensaje: String;
begin
  bSalir := False;

  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

    // no debe estar dada de baja
    if not sdqConsulta.FieldByName('ca_fechabaja').IsNull then
    begin
      sMensaje := 'Alguna de las cartas documento ya se encuentra dada de baja.';
      bSalir := True;
    end;

    if bSalir then
    begin
      InvalidMsg (Grid, sMensaje);

      Result := False;
      Exit;
    end;
  end;

  Result := True;
end;

{ Baja de las cartas documento seleccionadas }
procedure TfrmAfiAdministracionCartas.tbEliminarClick(Sender: TObject);
var
  sListaIdCartasDocSeleccionadas: String;
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar al menos una fila de la grilla.')
  else
  begin
    if Grid.SelectedRows.Count = 1 then
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));

    if IsRegistrosBajaCartaDocValidos(sListaIdCartasDocSeleccionadas) then
      if MsgBox('¿ Realmente desea dar de baja las cartas documento seleccionadas ?', MB_YESNO + MB_ICONQUESTION) = IDYES then
        DoEliminarCartasDoc(sListaIdCartasDocSeleccionadas);
  end;
end;

{ Determina si las cartas documento seleccionadas en la grilla a dar de baja son o no válidas }
function TfrmAfiAdministracionCartas.IsRegistrosBajaCartaDocValidos(var sListaIdCartasDocSeleccionadas: String): Boolean;
var
  iLoop: Integer;
  bSalir: Boolean;
  sMensaje: String;
begin
  bSalir                         := False;
  sListaIdCartasDocSeleccionadas := '(';

  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));

    // no debe estar dada de baja
    if not sdqConsulta.FieldByName('ca_fechabaja').IsNull then
    begin
      sMensaje := 'Alguna de las cartas documento ya se encuentra dada de baja.';
      bSalir := True;
    end

      // no debe tener fecha de recepción
    else if not sdqConsulta.FieldByName('ca_fecharecepcion').IsNull then
    begin
      sMensaje := 'Alguna de las cartas documento ya se encuentra recepcionada.';
      bSalir := True;
    end;

    if bSalir then
    begin
      InvalidMsg (Grid, sMensaje);

      Result := False;
      Exit;
    end;

    sListaIdCartasDocSeleccionadas := sListaIdCartasDocSeleccionadas +  sdqConsulta.FieldByName('ca_id').AsString + ', ';
  end;

  sListaIdCartasDocSeleccionadas := Copy(sListaIdCartasDocSeleccionadas, 1, Length(sListaIdCartasDocSeleccionadas) - 2) + ')';

  Result := True;
end;

// Da de baja las cartas documento seleccionadas de la tabla de cartas documento
procedure TfrmAfiAdministracionCartas.DoEliminarCartasDoc(sListaIdCartasDocSeleccionadas: String);
var
  sSql: String;
begin
  try
    sSql :=
      'UPDATE cca_carta' +
        ' SET ca_usubaja = :usubaja,' +
            ' ca_fechabaja = SYSDATE' +
      ' WHERE ca_id IN ' + sListaIdCartasDocSeleccionadas;
    EjecutarSqlEx(sSql, [frmPrincipal.DBLogin.UserId]);

    MsgBox('Las cartas documento se dieron de baja correctamente.', MB_OK + MB_ICONINFORMATION);

    sdqConsulta.Refresh;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al dar de baja las cartas documento.');
  end;
end;

{ Recepción de la carta documento seleccionada }
procedure TfrmAfiAdministracionCartas.tbRecepcionClick(Sender: TObject);
begin
  RecepcionCarta;
end;

{ Determina si la carta doc. seleccionada en la grilla para ser recepcionada es o no válida }
function TfrmAfiAdministracionCartas.IsRegistroRecepcionCartaDocValido: Boolean;
begin
  Result := False;

  // la carta no debe estar dada de baja
  Verificar(not sdqConsulta.FieldByName('ca_fechabaja').IsNull, Grid, 'La carta documento se encuentra dada de baja.');

  // la carta debe estar impresa
  Verificar(sdqConsulta.FieldByName('fechaimpresion').IsNull, Grid, 'La carta documento aún no ha sido impresa.');

  // Si la fecha de impresión tiene mas de 2 meses, le pido una confirmación al usuario..
  if DBDate > (sdqConsulta.FieldByName('fechaimpresion').AsDateTime + 60) then
  begin
    if not MsgAsk(Format('La fecha de impresión de la carta tiene mas de 60 días (%s).', [FormatDateTime('dd/mm/yyyy', sdqConsulta.FieldByName('fechaimpresion').AsDateTime)]) + #13#10 +
                         '¿ Desea recepcionar la carta de todas formas ?') then
      Exit;
  end;

  Result := True;
end;

procedure TfrmAfiAdministracionCartas.btnRecepcionAceptarClick(Sender: TObject);
begin
  RecepcionarCartaDocumento(True, sdqConsulta.FieldByName('ca_id').AsInteger,
                            sdqConsulta.FieldByName('fechaimpresion').AsDateTime, edFechaRecepcion, fraCodRecepcion, rgRecepOk);
end;

{ Determina si los datos ingresados de la recepción de la carta doc. son o no válidos }
function TfrmAfiAdministracionCartas.IsDatosValidosRecepcion(const aFechaImpresion: TDateTime;
                                                             aFechaRecepcion: TDateComboBox;
                                                             aCodigoRecepcion: TfraStaticCTB_TABLAS;
                                                             aRecepcionOk: TRadioGroup): Boolean;
begin
  Result := False;

  // Debe seleccionar si recepción OK..
  if aRecepcionOk.ItemIndex = -1 then
    InvalidMsg(rgRecepOk, 'El campo recepción OK es obligatorio.')

  // Debe ingresar la fecha de recepción..
  else if aFechaRecepcion.IsEmpty then
    InvalidMsg(edFechaRecepcion, 'La fecha de recepción es obligatoria.')

  // La fecha de recepción debe ser mayor o igual a la de impresión..
  else if aFechaRecepcion.Date < aFechaImpresion then
    InvalidMsg(edFechaRecepcion, 'La fecha de recepción no puede ser menor a la fecha de impresión: ' +
      FormatDateTime('dd/mm/yyyy', aFechaImpresion))

  // Si la recepción no fue OK, debe ingresar el código de recepción..
  else if (aRecepcionOk.ItemIndex = 1) and (not aCodigoRecepcion.IsSelected) then  // no
    InvalidMsg(aRecepcionOk, 'El código de recepción es obligatorio, si Recepción OK = No.')

  else
    Result := True;
end;

procedure TfrmAfiAdministracionCartas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                        var Background: TColor; Highlight: Boolean);
begin
  inherited;

  // así lo muestra con letras en rojo
  if not sdqConsulta.FieldByName('ca_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmAfiAdministracionCartas.rgRecepOkClick(Sender: TObject);
begin
  inherited;

  DoHabilitarIngresoCodigoRecepcion(rgRecepOk);
end;

{ Habilita o deshabilita el ingreso del código de recepción }
procedure TfrmAfiAdministracionCartas.DoHabilitarIngresoCodigoRecepcion(rgRecepcOk: TRadioGroup);
var
  bHabilitar: Boolean;
begin
  bHabilitar := (GetRecepcionOk(rgRecepOk) = 'N');

  fraCodRecepcion.Locked := not bHabilitar;

  if not bHabilitar then
    fraCodRecepcion.Clear;
end;

{ Devuelve S/N según lo seleccionado en el radio group del código de recepción del form panel }
function TfrmAfiAdministracionCartas.GetRecepcionOk(rg_RecepcOk: TRadioGroup): String;
var
  sRecepOk: String;
begin
  case rg_RecepcOk.ItemIndex of
    0:  sRecepOk := 'S';   // si
    1:  sRecepOk := 'N';   // no
  else
    sRecepOk := '';
  end;

  Result := sRecepOk;
end;

{ Reemplazo de la carta documento seleccionada }
procedure TfrmAfiAdministracionCartas.tbReemplazoClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar una fila de la grilla.')
  else if Grid.SelectedRows.Count > 1 then
    InvalidMsg(Grid, 'Solo debe seleccionar una fila de la grilla.')
  else
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[0]));

    if IsRegistroReemplazoValido(sdqConsulta.FieldByName('ca_id').AsInteger) then
    begin
      DoInicializarfpReemplazar(sdqConsulta.FieldByName('ca_id').AsInteger);

      if fpReemplazar.ShowModal = mrOk then
        sdqConsulta.Refresh;
    end;
  end;
end;

{ Inicializa el form panel de reemplazo de cartas documento }
procedure TfrmAfiAdministracionCartas.DoInicializarfpReemplazar(const aCartaId: Integer);
var
  IdCartaDoc: TTableId;
  IdUltimoEndoso: TTableId;
  sSql: String;
begin
  sSql :=
    'SELECT *' +
     ' FROM cca_carta' +
    ' WHERE ca_id = :id';
  with GetQueryEx(sSql, [aCartaId]) do
  try
    btnDatosNuevos.Enabled := not FieldByName('ca_idendoso').IsNull;

    sSql := SqlSimpleQuery('NVL(art.afiliacion.get_ultendoso(' + SqlValue(FieldByName('ca_idformulario').AsInteger)  + '), ' + IntToStr(ART_EMPTY_ID) + ')');

    IdUltimoEndoso := ValorSqlInteger(sSql);
    IdCartaDoc     := aCartaId;

    // Datos de la carta doc..
    DoCargarDatosCartaDoc(IdCartaDoc, FieldByName('ca_idendoso').AsInteger, fraEmpresaDatosCartaDoc, fraDomicilioDatosCartaDoc);

    // Datos actuales..
    DoCargarDatosCartaDoc(IdCartaDoc, IdUltimoEndoso, fraEmpresaDatosActuales, fraDomicilioDatosActuales);
  finally
    Free;
  end;
end;

{ Determina si la carta doc. seleccionada en la grilla para ser reemplazada es o no válida }
function TfrmAfiAdministracionCartas.IsRegistroReemplazoValido(aIdCarta: TTableId): Boolean;
var
  sSql: String;
begin
  Result := False;

  sSql :=
    'SELECT ca_fechabaja, ca_idcartaareemplazar, ca_fecharecepcion, ca_recepcionok, ca_manual' +
     ' FROM cca_carta' +
    ' WHERE ca_id = :id';

  with GetQueryEx(sSql, [aIdCarta]) do
  try
    if not IsEmpty then
    begin
      // la carta doc. no debe estar dada de baja
      if not FieldByName('ca_fechabaja').IsNull then
        InvalidMsg(Grid, 'La carta documento seleccionada se encuentra dada de baja.')

      // la carta doc. no debe haber sido reemplazada
      else if not FieldByName('ca_idcartaareemplazar').IsNull then
        InvalidMsg(Grid, 'La carta documento seleccionada ya ha sido reemplazada.')

      // la carta doc. no debe haber sido recepcionada
      else if FieldByName('ca_fecharecepcion').IsNull then
        InvalidMsg(Grid, 'La carta documento seleccionada todavía no ha sido recepcionada.')

      // la carta doc. no debe hacer sido recepcionada bien
      else if FieldByName('ca_recepcionok').AsString = 'S' then
        InvalidMsg(Grid, 'La carta documento seleccionada ha sido recepcionada correctamente.')

      // la carta doc. no debe hacer sido generado manualmente
      else if FieldByName('ca_manual').AsString = 'S' then
        InvalidMsg(Grid, 'La carta documento seleccionada se generó en forma manual.')

      else
        Result := True;
    end;
  finally
    Free;
  end;
end;

{ Carga los datos de la empresa y del domicilio de la carta doc. para su reemplazo }
procedure TfrmAfiAdministracionCartas.DoCargarDatosCartaDoc(aIdCartaDoc, aIdUltimoEndoso: TTableId;
                                                            var fraEmpresaDatos: TfraEmpresaSolicitud;
                                                            var fraDomicilioDatos: TfraDomicilioTrab);
var
  sSql: String;
  iContrato: Integer;
begin
  // datos de la empresa
  sSql :=
    'SELECT sa_nombre rsocial, sa_cuit cuit, fo_formulario formulario, 0 contrato' +
     ' FROM asa_solicitudafiliacion, cca_carta, afo_formulario' +
    ' WHERE ca_idformulario = sa_idformulario' +
      ' AND ca_idformulario = fo_id' +
      ' AND ca_idendoso IS NULL' +
      ' AND ca_id = :id' +
    ' UNION' +
   ' SELECT hm_nombre rsocial, hm_cuit cuit, fo_formulario formulario, hc_contrato contrato' +
     ' FROM ahm_historicoempresa, ahc_historicocontrato, aen_endoso, afo_formulario' +
    ' WHERE en_id = :id' +
      ' AND en_idhistoricoempresa = hm_id' +
      ' AND en_idhistoricocontrato = hc_id' +
      ' AND hc_idformulario = fo_id';

  with GetQueryEx(sSql, [aIdCartaDoc, aIdUltimoEndoso]) do
  try
    if not IsEmpty then
      with fraEmpresaDatos do
      begin
        iContrato := FieldByName('contrato').AsInteger;

        mskCUIT.Text := FieldByName('cuit').AsString;
        cmbRSocial.Text := FieldByName('rsocial').AsString;
        if iContrato <> 0 then
          edContrato.Value := iContrato;
        edFormulario.Text := FieldByName('formulario').AsString;
      end;
  finally
    Free;
  end;

  // datos del domicilio
  sSql :=
    'SELECT sa_calle calle, sa_localidad localidad, sa_cpostal cpostal, sa_provincia provincia, sa_numero numero,' +
          ' sa_piso piso, sa_departamento departamento, sa_cpostala cpostala' +
     ' FROM asa_solicitudafiliacion, cca_carta' +
    ' WHERE ca_idformulario = sa_idformulario' +
      ' AND ca_idendoso IS NULL' +
      ' AND ca_id = :id' +
   ' UNION' +
   ' SELECT hd_calle calle, hd_localidad localidad, hd_cpostal cpostal, hd_provincia provincia, hd_numero numero,' +
          ' hd_piso piso, hd_departamento departamento, hd_cpostala cpostala' +
     ' FROM ahd_historicodomicilio, aen_endoso' +
    ' WHERE en_idhistoricodomicilio = hd_id' +
      ' AND en_id = :id';

  with GetQueryEx(sSql, [aIdCartaDoc, aIdUltimoEndoso]) do
  try
    if not IsEmpty then
      with fraDomicilioDatos do
      begin
        Calle        := FieldByName('calle').AsString;
        Localidad    := FieldByName('localidad').AsString;
        CodigoPostal := FieldByName('cpostal').AsString;

        sSql :=
          'SELECT pv_descripcion' +
           ' FROM cpv_provincias' +
          ' WHERE pv_codigo = :codigo';
        Provincia    := ValorSqlEx(sSql, [FieldByName('provincia').AsString]);
        
        Numero       := FieldByName('numero').AsString;
        Piso         := FieldByName('piso').AsString;
        Departamento := FieldByName('departamento').AsString;
        CPA          := FieldByName('cpostala').AsString;
      end;
  finally
    Free;
  end;
end;

procedure TfrmAfiAdministracionCartas.btnDatosNuevosClick(Sender: TObject);
var
  aTextoCarta: TStringList;
  IdEndoso: Variant;
  iNroCartaDoc: Integer;
  TipoModulo: TTipoModulo;
  sNroCartaDoc: String;
  sSql: String;
begin
  try
    BeginTrans;

    sdqCCA_CARTA.Close;
    sdqCCA_CARTA.ParamByName('pca_id').AsInteger := sdqConsulta.FieldByName('ca_id').AsInteger;
    sdqCCA_CARTA.Open;

    aTextoCarta := TStringList.Create;
    try
      if sdqCCA_CARTA.IsEmpty then
        raise Exception.Create('No se encontraron datos de la carta documento.');

      if Sender = btnDatosNuevos then  // con datos nuevos
      begin
        sSql :=
          'SELECT NVL(art.afiliacion.get_ultendoso(ca_idformulario), art.afiliacion.get_ultidendoso(en_contrato))' +
           ' FROM aen_endoso, cca_carta' +
          ' WHERE ca_idendoso = en_id' +
            ' AND ca_id = :id';
        IdEndoso := ValorSqlEx(sSql, [sdqConsulta.FieldByName('ca_id').AsInteger]);
        
        if IdEndoso = '' then
          IdEndoso := Null;
      end
      else    // con los mismos datos
        IdEndoso := sdqCCA_CARTA.FieldByName('ca_idendoso').Value;

      FieldToTString(sdqCCA_CARTA.FieldByName('ca_textofinal'), aTextoCarta);

      TipoModulo := GetTipoModulo(sdqCCA_CARTA.FieldByName('at_area').AsString);

      sdqCCA_CARTA.Insert; { ------------------------------- ------------------------------- }

      sdqCCA_CARTA.FieldByName('ca_idendoso').Value   := IdEndoso;
      sdqCCA_CARTA.FieldByName('ca_id').AsInteger     := sdqConsulta.FieldByName('ca_id').AsInteger;
      sdqCCA_CARTA.FieldByName('ca_usualta').AsString := frmPrincipal.DBLogin.UserId;

      if TipoModulo <> taNone then
      begin
        iNroCartaDoc := GetNroCartaDocReducido(TipoModulo);
        sNroCartaDoc  := GetNroCartaDocCompleto(iNroCartaDoc, TipoModulo);
        sdqCCA_CARTA.FieldByName('nrocartadoc').AsString := sNroCartaDoc;
      end;

      TStringToField(aTextoCarta, sdqCCA_CARTA.FieldByName('ca_textofinal'));

      sdqCCA_CARTA.Post;
      sdqCCA_CARTA.ApplyUpdates;
      sdqCCA_CARTA.Close;
    finally
      aTextoCarta.Free;
    end;

    // doy de baja la carta documento anterior
    with TSql.Create('cca_carta') do
    try
      PrimaryKey.Add('ca_id',    sdqConsulta.FieldByName('ca_id').AsInteger);
      Fields.Add('ca_fechabaja', exDateTime);
      Fields.Add('ca_usubaja',   frmPrincipal.DBLogin.UserId);

      SqlType := stUpdate;

      EjecutarSqlST(Sql);
    finally
      Free;
    end;

    CommitTrans;

    MsgBox('La carta documento se reemplazó correctamente.', MB_OK + MB_ICONINFORMATION);

    fpReemplazar.ModalResult := mrOk;
  except
    on E:Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message + CRLF + 'Error al reemplazar la carta documento.');
    end;
  end;
end;

{ Alta de las cartas documento }
procedure TfrmAfiAdministracionCartas.tbNuevoClick(Sender: TObject);
begin
  with TfrmAfiGeneracionCartas.Create(Self) do
  try
    if Sender = tbNuevo Then
      IdCarta := ART_EMPTY_ID
    else
      IdCarta := sdqConsulta.FieldByName('ca_id').AsInteger;

    if Execute(IdCarta) and sdqConsulta.Active then
      sdqConsulta.Refresh;
  finally
    free;
  end;
end;

{ Modificación de las cartas documento }
procedure TfrmAfiAdministracionCartas.tbModificarClick(Sender: TObject);
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar una fila de la grilla.')
  else if Grid.SelectedRows.Count > 1 then
    InvalidMsg(Grid, 'Solo debe seleccionar una fila de la grilla.')
  else
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));

    if IsRegistroModificacionValido() then
      tbNuevoClick(Sender);
  end;
end;

{ Determina si la carta doc. seleccionada en la grilla para ser modificada es o no válida }
function TfrmAfiAdministracionCartas.IsRegistroModificacionValido: Boolean;
begin
  Result := False;

  // la carta no debe estar dada de baja
  if not sdqConsulta.FieldByName('ca_fechabaja').IsNull then
    InvalidMsg(Grid, 'La carta documento se encuentra dada de baja.')

  // la carta no debe estar recepcionada
  else if not sdqConsulta.FieldByName('ca_fecharecepcion').IsNull then
    InvalidMsg(Grid, 'La carta documento ya ha sido recepcionada.')

  else
    Result := True;
end;

procedure TfrmAfiAdministracionCartas.ModuloOnChange(aModulo, aCodTexto, aCodFirmante: TfraStaticCodigoDescripcion);
begin
  if aModulo.IsSelected then
  begin
    aCodTexto.Sql :=
      'SELECT tc_id ' + CD_ALIAS_ID + ',' +
            ' tc_codigo ' + CD_ALIAS_CODIGO + ',' +
            ' tc_nombre ' + CD_ALIAS_DESC + ',' +
            ' tc_fechabaja ' + CD_ALIAS_BAJA +
       ' FROM ctc_textocarta, cta_textoarea' +
      ' WHERE tc_id = ta_idtextocarta' +
        ' AND ta_idareatexto = ' + SqlValue(aModulo.Value);

    if aCodFirmante <> nil then
      aCodFirmante.Sql :=
        'SELECT fi_id ' + CD_ALIAS_ID + ',' +
              ' fi_id ' + CD_ALIAS_CODIGO + ',' +
              ' fi_firmante ' + CD_ALIAS_DESC + ',' +
              ' fi_fechabaja ' + CD_ALIAS_BAJA +
         ' FROM cfi_firma, cfa_firmantearea' +
        ' WHERE fi_id = fa_idfirmante' +
          ' AND fa_idareatexto = ' + SqlValue(aModulo.Value);
  end
  else
  begin
    aCodTexto.Sql :=
      'SELECT DISTINCT tc_id ' + CD_ALIAS_ID + ',' +
                     ' tc_codigo ' + CD_ALIAS_CODIGO + ',' +
                     ' tc_nombre ' + CD_ALIAS_DESC + ',' +
                     ' tc_fechabaja ' + CD_ALIAS_BAJA +
                ' FROM ctc_textocarta, cat_areatexto, cta_textoarea' +
               ' WHERE tc_id = ta_idtextocarta' +
                 ' AND at_id = ta_idareatexto' +
                 ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';

    if aCodFirmante <> nil then
      aCodFirmante.Sql :=
        'SELECT DISTINCT fi_id ' + CD_ALIAS_ID + ',' +
                       ' fi_id ' + CD_ALIAS_CODIGO + ',' +
                       ' fi_firmante ' + CD_ALIAS_DESC + ',' +
                       ' fi_fechabaja ' + CD_ALIAS_BAJA +
                  ' FROM cfi_firma, cfa_firmantearea, cat_areatexto' +
                 ' WHERE fi_id = fa_idfirmante' +
                   ' AND at_id = fa_idareatexto' +
                   ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
  end;
end;

procedure TfrmAfiAdministracionCartas.fraModuloOnChange(Sender: TObject);
begin
  ModuloOnChange(fraModulo, fraCodTexto, fraCodFirmante)
end;

procedure TfrmAfiAdministracionCartas.fraModuloRecMasOnChange(Sender: TObject);
begin
  ModuloOnChange(fraModuloRecMas, fraTextoRecMas, nil)
end;

{ Devuelve S/N según lo seleccionado en el radio group del código de recepción }
function TfrmAfiAdministracionCartas.GetRecepcionOk_Busqueda(rg_RecepcionOk: TRadioGroup): String;
var
  sRecepOk: String;
begin
  case rg_RecepcionOk.ItemIndex of
    0:  sRecepOk := 'S';   // si
    1:  sRecepOk := 'N';   // no
  else
    sRecepOk := '';
  end;

  Result := sRecepOk;
end;

procedure TfrmAfiAdministracionCartas.RecepcionCarta;
var
  sSql: String;
begin
  if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'Debe seleccionar una fila de la grilla.')
  else if Grid.SelectedRows.Count > 1 then
    InvalidMsg(Grid, 'Solo debe seleccionar una fila de la grilla.')
  else
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[0]));
    if IsRegistroRecepcionCartaDocValido() then
    begin
      edFechaRecepcion.MaxDate := DBDateTime;

      with fraCodRecepcion do
      begin
        sSql :=
          'SELECT tb_especial2' +
           ' FROM ctb_tablas' +
          ' WHERE tb_clave = ''CORRE''' +
            ' AND tb_codigo = :codigo';

        Clave     := 'CODRE';
        Especial1 := ValorSqlEx(sSql, [sdqConsulta.FieldbyName('correo').AsString]);
        ShowBajas := False;
      end;
      DoHabilitarIngresoCodigoRecepcion(rgRecepOk);

      if not sdqConsulta.FieldByName('ca_fecharecepcion').IsNull then
      begin
        if MsgBox('La carta documento ya ha sido recepcionada.' + CRLF + '¿ Desea usted modificarla ?', MB_YESNO + MB_ICONINFORMATION) = IDYES then
        begin
          FModoForm := 'modif';
          LoadDatosFormPanel;
          if fpRecepcionCartaDoc.ShowModal = mrOk then
            sdqConsulta.Refresh;
        end;
      end
      else
      begin
        FModoForm := 'alta';
        ClearDatosFormPanel;
        if fpRecepcionCartaDoc.ShowModal = mrOk then
          sdqConsulta.Refresh;
      end;
    end;
  end;
end;

procedure TfrmAfiAdministracionCartas.GuardarArchivoEnDisco(var aFileName: String; const aIdAdjunto: Integer);
var
  aTextoFinal: TFileStream;
  sSql: String;
begin
  sSql :=
    'SELECT ad_extension' +
     ' FROM comunes.cad_cartaadjuntos' +
    ' WHERE ad_id = :id';
  aFileName := ChangeFileExt(aFileName, ValorSqlEx(sSql, [aIdAdjunto]));

  aTextoFinal := TFileStream.Create(aFileName, fmCreate);
  try
    BlobSql('SELECT ad_adjunto' +
             ' FROM comunes.cad_cartaadjuntos' +
            ' WHERE ad_id = ' + SqlInt(aIdAdjunto), aTextoFinal);
  finally
    aTextoFinal.Free;
  end;
end;

procedure TfrmAfiAdministracionCartas.GuardarFechaImpresion(const aIdCarta: Integer);
begin
  with TSql.Create('cca_carta') do
  try
    PrimaryKey.Add('ca_id',                     aIdCarta);
    Fields.AddExpression('ca_usuimpresion',     'NVL(ca_usuimpresion, ' + SqlValue(Sesion.UserID) + ')');
    Fields.AddExpression('ca_fechaimpresion',   'NVL(ca_fechaimpresion, SYSDATE)');
    Fields.AddExpression('ca_usureimpresion',   'DECODE(ca_usuimpresion, NULL, NULL, ' + SqlValue(Sesion.UserID) + ')');
    Fields.AddExpression('ca_fechareimpresion', 'DECODE(ca_usuimpresion, NULL, NULL, SYSDATE)');
    SqlType := stUpdate;

    EjecutarSql(Sql);
  finally
    Free;
  end;
end;

procedure TfrmAfiAdministracionCartas.LoadDatosFormPanel;
begin
  if sdqConsulta.FieldByName('ca_recepcionok').AsString = 'S' then
    rgRecepOk.ItemIndex := 0
  else
    rgRecepOk.ItemIndex := 1;

  fraCodRecepcion.Value := sdqConsulta.FieldByName('ca_codrecepcion').AsString;
  edFechaRecepcion.Date := sdqConsulta.FieldByName('ca_fecharecepcion').AsDateTime;
end;

procedure TfrmAfiAdministracionCartas.ClearDatosFormPanel;
begin
  rgRecepOk.ItemIndex := -1;
  fraCodRecepcion.Clear;
  edFechaRecepcion.Clear;
end;

procedure TfrmAfiAdministracionCartas.CalcularFilas;
begin
  edCantCartas.Value := Grid.SelectedRows.Count;
  if sdqConsulta.Active and tbCalcularTotal.Down then
    edTotalCartas.Value := sdqConsulta.RecordCount
  else
    edTotalCartas.Value := 0;
end;

procedure TfrmAfiAdministracionCartas.GridCellClick(Column: TColumn);
begin
  CalcularFilas;
end;

procedure TfrmAfiAdministracionCartas.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilas;
  SeleccionarFilas(ShortCut(Key, Shift));
end;

procedure TfrmAfiAdministracionCartas.tbRecepcionMasivaClick(Sender: TObject);
begin
 tbRecepcionMasiva.CheckMenuDropdown;
end;

procedure TfrmAfiAdministracionCartas.OpcionesImpresion(Sender: TObject);
begin
  VCLExtra.LockControls([edCantCopias, cmbImpresoras], rbPreview.Checked);
end;

procedure TfrmAfiAdministracionCartas.btnCancelarImpresionClick(Sender: TObject);
begin
  fpOpcionesImpresion.ModalResult := mrCancel;
end;

procedure TfrmAfiAdministracionCartas.btnAceptarImpresionClick(Sender: TObject);
begin
  AceptarImpresion;
end;

procedure TfrmAfiAdministracionCartas.btnPararClick(Sender: TObject);
begin
  FPararImpresion  := True;
  btnParar.Enabled := False;
end;

procedure TfrmAfiAdministracionCartas.CargarImpresoras;
begin
  cmbImpresoras.Clear;
  cmbImpresoras.Items.Assign(Printer.Printers);
  cmbImpresoras.ItemIndex := Printer.PrinterIndex;
end;

procedure TfrmAfiAdministracionCartas.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilas;
end;

procedure TfrmAfiAdministracionCartas.mnuDesMarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  CalcularFilas;
end;

procedure TfrmAfiAdministracionCartas.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularFilas;
end;

procedure TfrmAfiAdministracionCartas.mnuRecepcionCorreoArgentinoClick(Sender: TObject);
begin
  ImpoExpoWizard('RECCD');
end;

procedure TfrmAfiAdministracionCartas.mnuRecepcionRowingClick(Sender: TObject);
begin
  ImpoExpoWizard('RECCA');
end;

procedure TfrmAfiAdministracionCartas.fpOpcionesImpresionEnter(Sender: TObject);
begin
  BarProgreso.Position := 0
end;

procedure TfrmAfiAdministracionCartas.mnuCargaMasivaClick(Sender: TObject);
begin
  fpCargaMasivaCartaDoc.ShowModal;
end;

procedure TfrmAfiAdministracionCartas.Button3Click(Sender: TObject);
begin
  fpCargaMasivaCartaDoc.Close;
end;

procedure TfrmAfiAdministracionCartas.rgRecepcionSiNoClick(Sender: TObject);
begin
  inherited;
  fraCodigoRecepcion.Locked := (rgRecepcionSiNo.ItemIndex <> 1);
end;

procedure TfrmAfiAdministracionCartas.fpCargaMasivaCartaDocShow(Sender: TObject);
begin
  inherited;
  ClearCargaMasivaCartaDoc;
end;

procedure TfrmAfiAdministracionCartas.meNumCartaDocExit(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  sSql :=
    'SELECT *' +
     ' FROM cca_carta' +
    ' WHERE ca_nrocartadoc = :nrocarta';

  with GetQueryEx(sSql, [StringReplace(meNumCartaDoc.Text, '-', '', [rfReplaceAll])]) do
  try
    if not IsEmpty then
    begin
      meNumCartaDoc.Tag := FieldByName('ca_id').AsInteger;

      if FieldByName('ca_recepcionok').AsString = 'S' then
        rgRecepcionSiNo.ItemIndex := 0;
      if FieldByName('ca_recepcionok').AsString = 'N' then
        rgRecepcionSiNo.ItemIndex := 1;

      dcbFechaRecepcion.Date    := FieldByName('ca_fecharecepcion').AsDateTime;
      fraCodigoRecepcion.Value  := FieldByName('ca_codrecepcion').AsString;
      fraCodigoRecepcion.Locked := (rgRecepcionSiNo.ItemIndex <> 1);
    end;
  finally
    Free;
  end;
end;

function TfrmAfiAdministracionCartas.RecepcionarCartaDocumento(const aCloseWindow: Boolean; const aCartaId: Integer;
                                                               const aFechaImpresion: TDateTime;
                                                               aFechaRecepcion: TDateComboBox;
                                                               aCodigoRecepcion: TfraStaticCTB_TABLAS;
                                                               aRecepcionOk: TRadioGroup): Boolean;
var
  sRecepOk: String;
begin
  Result := False;

  if IsDatosValidosRecepcion(aFechaImpresion, aFechaRecepcion, aCodigoRecepcion, aRecepcionOk) then
  try
    Result := True;

    // Actualizo los datos de la recepción en la tabla de cartas doc..
    with TSql.Create('cca_carta') do
    try
      sRecepOk := GetRecepcionOk(aRecepcionOk);

      PrimaryKey.Add('ca_id',         aCartaId);
      Fields.Add('ca_recepcionok',    sRecepOk);
      Fields.Add('ca_codrecepcion',   aCodigoRecepcion.edCodigo.Text);
      Fields.Add('ca_fecharecepcion', aFechaRecepcion.Date);
      Fields.Add('ca_usurecepcion',   frmPrincipal.DBLogin.UserId);

      SqlType := stUpdate;

      EjecutarSql(Sql);
    finally
      Free;
    end;

    if sRecepOk = 'S' then
    begin
      MsgBox('La carta documento se recepcionó correctamente.' , MB_OK + MB_ICONINFORMATION);
      if aCloseWindow then
        fpRecepcionCartaDoc.ModalResult := mrOk;
    end
    else if sRecepOk = 'N' then
    begin
      if MsgBox('La carta documento no se recepcionó correctamente.' + CRLF + '¿ Desea, además, reemplazar la carta documento ?', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 ) = IDYES then
      begin
        if IsRegistroReemplazoValido(aCartaId) then
        begin
          DoInicializarfpReemplazar(aCartaId);
          fpReemplazar.ShowModal;
        end;

        if aCloseWindow then
          // Si cambio la operatoria de esta pantalla, tener en cuenta que si quedo en esta pantalla y salgo con Cancelar no se va a actualizar la grilla
          fpRecepcionCartaDoc.ModalResult := mrOk;
      end
      else
        if aCloseWindow then
          fpRecepcionCartaDoc.ModalResult := mrOk;
    end;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al recepcionar la carta documento.');
  end;
end;

procedure TfrmAfiAdministracionCartas.Button2Click(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT ca_fechaimpresion' +
     ' FROM cca_carta' +
    ' WHERE ca_id = :id';

  if RecepcionarCartaDocumento(False, meNumCartaDoc.Tag, ValorSqlDateTimeEx(sSql, [meNumCartaDoc.Tag]),
                               dcbFechaRecepcion, fraCodigoRecepcion, rgRecepcionSiNo) then
    ClearCargaMasivaCartaDoc;
end;

procedure TfrmAfiAdministracionCartas.ClearCargaMasivaCartaDoc;
begin
  meNumCartaDoc.Clear;
  rgRecepcionSiNo.ItemIndex := -1;
  dcbFechaRecepcion.Clear;
  fraCodigoRecepcion.Clear;
  fraCodigoRecepcion.Locked := True;

  meNumCartaDoc.SetFocus;
end;

procedure TfrmAfiAdministracionCartas.tAgregarTXTClick(Sender: TObject);
var
  aArchivo: TextFile;
  iCountContratos: Integer;
  sContratos: String;
  sTemp: String;
begin
  inherited;

  OpenDialog.Title := 'Archivo de contratos';
  OpenDialog.DefaultExt := 'txt';
  OpenDialog.Filter := 'Archivos de Texto(*.txt)|*.txt';
  if OpenDialog.Execute then
  try
    try
      AssignFile(aArchivo, OpenDialog.FileName);
      Reset(aArchivo);
      iCountContratos := 0;
      while not Eof(aArchivo) do
      begin
        Inc(iCountContratos);
        ReadLn(aArchivo, sTemp);
        if StrToIntDef(sTemp, 0) <> 0 then // Con esto chequeo que no ingrese cualquier cosa..
          sContratos := sContratos + sTemp + ',';

        if iCountContratos > 1000 then
        begin
          MessageDlg('La cantidad máxima de contratos es 1000.', mtError, [mbOK], 0);
          Exit;
        end;
      end;
      edContratos.Text := Copy(sContratos, 1, Length(sContratos) - 1);
    except
      edContratos.Text := '';
      MessageDlg('El archivo no posee un formato válido.', mtError, [mbOK], 0);
    end;
    //Quito la coma que sobra
  finally
    CloseFile(aArchivo);
  end;
end;

procedure TfrmAfiAdministracionCartas.tbLimpiarTXTClick(Sender: TObject);
begin
  edContratos.Clear;
end;

procedure TfrmAfiAdministracionCartas.tbFormatoContratoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:' + CRLF +
             '* Extensión: .TXT' + CRLF +
             '* Encabezado: No debe ingresarse encabezado' + CRLF +
             '* Cuerpo: ' + CRLF +
             '   - Campos: 1) NroDeContrato' + CRLF +
             '   - Obs: No deben ingresarse más campos que el de NroDeContrato' + CRLF +
             '          Se debe efectuar un salto de línea (Enter) al final de cada línea (incluyendo la última)'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmAfiAdministracionCartas.tbRecepcionMasiva2Click(Sender: TObject);
begin
  fpRecepcionMasiva.ShowModal;
end;

procedure TfrmAfiAdministracionCartas.btnCancelar2Click(Sender: TObject);
begin
  fpRecepcionMasiva.Close;
end;

procedure TfrmAfiAdministracionCartas.tbVerFormatoClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:' + CRLF +
             '* Extensión: .XLS' + CRLF +
             '* Encabezado: No debe ingresarse encabezado' + CRLF +
             '* Columnas:' + CRLF +
             '           A) Nº Contrato o Nº Carta Documento' + CRLF +
             '           B) Fecha Recepción (DD/MM/YYYY)' + CRLF +
             '           C) Estado Recepción (S/N)' + CRLF +
             '           D) Código Rechazo (solo si columna C = ''N'')'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmAfiAdministracionCartas.btnProcesarClick(Sender: TObject);
begin
  Verificar((rgTipoCarta.ItemIndex = -1), rgTipoCarta, 'Por favor, elija el Tipo de Carta.');
  Verificar(lbModulo.Enabled and fraModuloRecMas.IsEmpty, fraModuloRecMas, 'Por favor, elija el Módulo.');
  Verificar(lbTexto.Enabled and fraTextoRecMas.IsEmpty, fraTextoRecMas, 'Por favor, elija el Texto.');
  Verificar(lbCorreo.Enabled and fraCorreoRecMas.IsEmpty, fraCorreoRecMas, 'Por favor, elija el Correo.');
  Verificar(not FileExists(edArchivo.Text), edArchivo, 'Por favor, elija el Archivo a procesar.');

  FCancelarProceso := False;

  progress.Position := 0;
  progress.Minimum := 0;

  lbAccion.Caption := 'Verificando archivo...';
  fpProcesar.ShowModal;

//  fpRecepcionMasiva.ModalResult := fpProcesar.ShowModal;
end;

procedure TfrmAfiAdministracionCartas.tbAgregarExcelClick(Sender: TObject);
begin
  OpenDialog.Title := 'Archivos de recepción masiva';
  OpenDialog.DefaultExt := 'xls';
  OpenDialog.Filter := 'Archivos de Excel(*.xls)|*.xls';
  if OpenDialog.Execute then
    edArchivo.Text := OpenDialog.FileName;
end;

function TfrmAfiAdministracionCartas.GetComputerAndUserName: String;
begin
  Result := Format('%s/%s', [frmPrincipal.DBLogin.WindowsComputerName, Sesion.UserID]);
end;

procedure TfrmAfiAdministracionCartas.btnCancelar3Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar el proceso ?') then
    FCancelarProceso := True;
end;

procedure TfrmAfiAdministracionCartas.VerificarExcel;
  procedure InsertError(var aError: Boolean; const aNroLinea: Integer; const aContrato, aMsgError: String);
  var
    sSql: String;
  begin
    sSql :=
      'INSERT INTO trm_afirecmas' +
          ' VALUES (:username, :nrolinea, :contrato, :error)';
    EjecutarSqlEx(sSql, [GetComputerAndUserName, aNroLinea, StrToIntDef(aContrato, 0), Copy(aMsgError, 1, 200)]);
    aError := True;
  end;

var
  bError: Boolean;
  iIdCarta: Integer;
  iLCid: Integer;
  iRow: Integer;
  sColA: String;
  sColB: String;
  sColC: String;
  sColD: String;
  sSql: String;
begin
  // Reinicio la tabla..
  EjecutarSqlEx('DELETE FROM trm_afirecmas WHERE rm_usuario = :usuario', [GetComputerAndUserName]);

  iIdCarta := -1;
  iLCid := GetUserDefaultLCID;
  try
    try
      ExcelApp.Workbooks.Open(edArchivo.Text, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, Null, iLCid);
      ExcelApp.Visible[0] := False;
      ExcelWB.ConnectTo(ExcelApp.Workbooks[1] as _Workbook);
      ExcelWS.ConnectTo(ExcelWB.Worksheets[1] as _Worksheet);
      ExcelWS.Activate;

      with ExcelWS do
      begin
        iRow := 1;
        sColA := Range['A1', 'A1'].Value2;
        sColB := Range['B1', 'B1'].Value;
        sColC := Range['C1', 'C1'].Value2;
        sColD := Range['D1', 'D1'].Value2;
        progress.Maximum := GetCountLineasExcel;

        while not IsEmptyLine(sColA, sColB, sColC) do
        begin
          if FCancelarProceso then
            Break;

          bError := False;

          // ***  VERIFICO QUE LA PRIMER COLUMNA TENGA ALGÚN DATO  ***
          if sColA = '' then
            InsertError(bError, iRow, sColA, 'Columna A vacía.');

          // ***  VERIFICO QUE LA SEGUNDA COLUMNA TENGA ALGÚN DATO  ***
          if not bError then
            if sColB = '' then
              InsertError(bError, iRow, sColA, 'Columna B vacía.');

          // ***  VERIFICO QUE LA TERCER COLUMNA TENGA ALGÚN DATO  ***
          if not bError then
            if sColC = '' then
              InsertError(bError, iRow, sColA, 'Columna C vacía.');

          // ***  VERIFICO QUE LA FECHA SEA VÁLIDA  ***
          if not bError then
          try
            StrToDate(sColB);
          except
            InsertError(bError, iRow, sColA, 'Fecha inválida.');
          end;

          // ***  VERIFICO QUE LA COLUMNA C TENGA SOLO S O N  ***
          if not bError then
            if (sColC <> 'S') and (sColC <> 'N') then
              InsertError(bError, iRow, sColA, 'Valor inválido en columna C.');

          // ***  VERIFICO QUE EL CÓDIGO DE ERROR SEA VÁLIDO  ***
          if not bError then
            if sColC = 'N' then
            begin
              sSql :=
                'SELECT 1' +
                 ' FROM ctb_tablas' +
                ' WHERE tb_clave = ''CODRE''' +
                  ' AND UPPER(tb_codigo) = UPPER(:codigo)' +
               ' UNION' +
               ' SELECT 1' +
                 ' FROM ctb_tablas' +
                ' WHERE tb_clave = ''CODRE''' +
                  ' AND UPPER(tb_especial1) = UPPER(:especial)';
              if ValorSqlIntegerEx(sSql, [sColD, fraCorreoRecMas.cmbDescripcion.Text], -1) = -1 then
                InsertError(bError, iRow, sColA, 'Código de error inexistente.');
            end;

          if rgTipoCarta.ItemIndex = 0 then   // Carta Comercial..
          begin
            // ***  VERIFICO QUE EL CONTRATO SEA VÁLIDO  ***
            if not bError then
            try
              StrToInt(sColA);
            except
              InsertError(bError, iRow, sColA, 'Contrato inválido.');
            end;

            // ***  VERIFICO QUE EXISTA EL CONTRATO  ***
            if not bError then
            begin
              sSql :=
                'SELECT 1' +
                 ' FROM aco_contrato' +
                ' WHERE co_contrato = :contrato';
              if ValorSqlIntegerEx(sSql, [sColA], -1) = -1 then
                InsertError(bError, iRow, sColA, 'Contrato inexistente.');
            end;

            // ***  VERIFICO QUE HAYA CARTAS COMERCIALES EMITIDAS PARA EL MÓDULO, TEXTO Y CORREO SELECCIONADOS  ***
            if not bError then
            begin
              sSql :=
                'SELECT ca_id' +
                 ' FROM cca_carta, aco_contrato' +
                ' WHERE co_idformulario = ca_idformulario' +
                  ' AND co_contrato = :contrato' +
                  ' AND ca_idareatexto = :idareatexto' +
                  ' AND ca_idtextocarta = :idtextocarta' +
                  ' AND NVL(ca_correoreimpresion, ca_correo) = :correo';
              iIdCarta := ValorSqlIntegerEx(sSql, [sColA, fraModuloRecMas.Value, fraTextoRecMas.Value,
                                                   fraCorreoRecMas.Value], -1);
              if iIdCarta = -1 then
                InsertError(bError, iRow, sColA, 'No hay cartas comerciales emitidas para ese contrato.');
            end;
          end
          else    // Carta Documento..
          begin
            // ***  VERIFICO QUE EXISTA LA CARTA DOCUMENTO  ***
            if not bError then
            begin
              sSql :=
                'SELECT ca_id' +
                 ' FROM cca_carta' +
                ' WHERE ca_nrocartadoc = :nrocartadoc';
              iIdCarta := ValorSqlIntegerEx(sSql, [sColA], -1);
              if iIdCarta = -1 then
                InsertError(bError, iRow, sColA, 'Carta documento inexistente.');
            end;
          end;

          // ***  VERIFICO QUE LA FECHA SEA MAYOR A LA FECHA DE IMPRESIÓN  ***
          if not bError then
          begin
            sSql :=
              'SELECT ca_fechaimpresion' +
               ' FROM cca_carta' +
              ' WHERE ca_id = :id';
            if ValorSqlDateTimeEx(sSql, [iIdCarta]) > StrToDate(sColB) then
              InsertError(bError, iRow, sColA, 'Fecha menor a la fecha de impresión.');
          end;

          // ***  VERIFICO QUE LA FECHA DE RECEPCIÓN NO TENGA MAS DE 60 DÍAS CON RESPECTO A LA FECHA DE IMPRESIÓN  ***
          if not bError then
          begin
            sSql :=
              'SELECT ca_fechaimpresion + 60' +
               ' FROM cca_carta' +
              ' WHERE ca_id = :id';
            if StrToDate(sColB) > ValorSqlDateTimeEx(sSql, [iIdCarta]) then
              InsertError(bError, iRow, sColA, 'Fecha de recepción mayor a 2 meses con respecto a fecha de impresión.');
          end;

          // ***  VERIFICO QUE LA CARTA NO ESTÉ REGISTRADA  ***
          if not bError then
          begin
            sSql :=
              'SELECT ca_fecharecepcion' +
               ' FROM cca_carta' +
              ' WHERE ca_id = :id';
            if ValorSqlDateTimeEx(sSql, [iIdCarta]) > 0 then
              InsertError(bError, iRow, sColA, 'Recepción ya existente.');
          end;


          Inc(iRow);
          progress.StepIt;
          if (iRow mod 20) = 0 then
            Forms.Application.ProcessMessages;

          sColA := Range['A' + IntToStr(iRow), 'A' + IntToStr(iRow)].Value2;
          sColB := Range['B' + IntToStr(iRow), 'B' + IntToStr(iRow)].Value;
          sColC := Range['C' + IntToStr(iRow), 'C' + IntToStr(iRow)].Value2;
          sColD := Range['D' + IntToStr(iRow), 'D' + IntToStr(iRow)].Value2;
        end;
      end;

      if not FCancelarProceso then
        with sdqErrores do
        begin
          Close;
          ParamByName('usuario').AsString := GetComputerAndUserName;
          Open;
          
          if IsEmpty then
          begin
            lbAccion.Caption := 'Procesando archivo...';
            progress.Position := 0;
            progress.Minimum := 0;
            ProcesarExcel;
          end
          else
          begin
            coolErrores.Enabled := True;
            gridErrores.Enabled := True;
          end;
        end;

      fpProcesar.ModalResult := mrOk;
    except
      fpProcesar.ModalResult := mrCancel;
    end;
  finally
    ExcelWS.Disconnect;
    ExcelWB.Disconnect;
    ExcelApp.Visible[0] := True;
    ExcelApp.Quit;
    ExcelApp.Disconnect;
  end;
end;

procedure TfrmAfiAdministracionCartas.t1Timer(Sender: TObject);
begin
  t1.Enabled := False;

  VerificarExcel;
end;

procedure TfrmAfiAdministracionCartas.fpProcesarShow(Sender: TObject);
begin
  t1.Enabled := True;
end;

function TfrmAfiAdministracionCartas.GetCountLineasExcel: Integer;
const
  MAX_LINES = 65536;
  MAX_PASADAS = 17;
var
  iCountPasadas: Integer;
  iLineNumber: Integer;
  iRangoDesde: Integer;
  iRangoHasta: Integer;
  sColA: String;
  sColB: String;
  sColC: String;
begin
  iCountPasadas := 0;
  iLineNumber := -1;
  iRangoDesde := 1;
  iRangoHasta := MAX_LINES;

  while (iRangoHasta <> iRangoDesde) and (iCountPasadas < MAX_PASADAS) do
  begin
    iLineNumber := iRangoDesde + ((iRangoHasta - iRangoDesde) div 2);
    with ExcelWS do
    begin
      sColA := Range['A' + IntToStr(iLineNumber), 'A' + IntToStr(iLineNumber)].Value2;
      sColB := Range['B' + IntToStr(iLineNumber), 'B' + IntToStr(iLineNumber)].Value;
      sColC := Range['C' + IntToStr(iLineNumber), 'C' + IntToStr(iLineNumber)].Value2;
    end;

    if IsEmptyLine(sColA, sColB, sColC) then
      iRangoHasta := iLineNumber
    else
      iRangoDesde := iLineNumber;

    Inc(iCountPasadas);
  end;

  Result := iLineNumber;
end;

function TfrmAfiAdministracionCartas.IsEmptyLine(const aValor1, aValor2, aValor3: String): Boolean;
begin
  Result := (aValor1 = '') and (aValor2 = '') and (aValor3 = '');
end;

procedure TfrmAfiAdministracionCartas.rgTipoCartaClick(Sender: TObject);
begin
  lbModulo.Enabled := (rgTipoCarta.ItemIndex = 0);
  lbTexto.Enabled  := lbModulo.Enabled;
  lbCorreo.Enabled := lbModulo.Enabled;

  LockControls([fraModuloRecMas, fraTextoRecMas, fraCorreoRecMas], not lbModulo.Enabled);
end;

procedure TfrmAfiAdministracionCartas.ToolButton20Click(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialogErrores.SortFields, gridErrores.Columns);
  SortDialogErrores.Execute;
end;

procedure TfrmAfiAdministracionCartas.tbImprimir2Click(Sender: TObject);
var
  bAutoCols: Boolean;
begin
  tbImprimir2.Enabled := False;
  try
    if (sdqErrores.Active) and (not sdqErrores.IsEmpty) and (PrintDialog.Execute) then
    begin
      bAutoCols := (QueryPrintErrores.Fields.Count = 0);
      try
        if bAutoCols then
          QueryPrintErrores.SetGridColumns(gridErrores, True, [baDetail, baHeader, baTotal, baSubTotal]);

        if QueryPrintErrores.Title.Text = '' then
          QueryPrintErrores.Title.Text := Caption;

        QueryPrintErrores.Print;
      finally
        if bAutoCols Then
          QueryPrintErrores.Fields.Clear;
      end;
    end;
  finally
     tbImprimir2.Enabled := True; {Lo pone en true porque si entró acá quiere decir que estaba activado}
  end;
end;

procedure TfrmAfiAdministracionCartas.tbExportar2Click(Sender: TObject);
var
  bAutoCols: Boolean;
begin
  if (sdqErrores.Active) and (not sdqErrores.IsEmpty) then
  begin
    tbExportar2.Enabled := False;
    try
      bAutoCols := (ExportDialogErrores.Fields.Count = 0);
      try
        if bAutoCols then
          ExportDialogErrores.Fields.Assign(gridErrores.Columns);

        ExportDialogErrores.Execute;
      finally
        if bAutoCols then
          ExportDialogErrores.Fields.Clear;
      end;
    finally
      tbExportar2.Enabled := True;
    end;
  end;
end;

procedure TfrmAfiAdministracionCartas.fpRecepcionMasivaBeforeShow(Sender: TObject);
begin
  sdqErrores.Close;
  
  rgTipoCarta.ItemIndex := -1;
  fraModuloRecMas.Clear;
  fraTextoRecMas.Clear;
  fraCorreoRecMas.Clear;
  edArchivo.Clear;

  coolErrores.Enabled := False;
  gridErrores.Enabled := False;

  lbModulo.Enabled := False;
  lbTexto.Enabled := False;
  lbCorreo.Enabled := False;
  LockControls([fraModuloRecMas, fraTextoRecMas, fraCorreoRecMas], True);
end;

procedure TfrmAfiAdministracionCartas.ProcesarExcel;
var
  iRow: Integer;
  sColA: String;
  sColB: String;
  sColC: String;
  sColD: String;
  sSql: String;
begin
  with ExcelWS do
  begin
    iRow := 1;
    sColA := Range['A1', 'A1'].Value2;
    sColB := Range['B1', 'B1'].Value;
    sColC := Range['C1', 'C1'].Value2;
    sColD := Range['D1', 'D1'].Value2;

    while not IsEmptyLine(sColA, sColB, sColC) do
    begin
      if FCancelarProceso then
        Break;

      try
        if rgTipoCarta.ItemIndex = 0 then   // Carta Comercial..
        begin
          sSql :=
            'UPDATE cca_carta' +
              ' SET ca_fecharecepcion = :fecharecepcion,' +
                  ' ca_recepcionok = :recepcionok,' +
                  ' ca_codrecepcion = :codrecepcion,' +
                  ' ca_usurecepcion = :usurecepcion' +
            ' WHERE ca_id = (SELECT MIN(ca_id)' +
                             ' FROM cca_carta, aco_contrato' +
                            ' WHERE co_idformulario = ca_idformulario' +
                              ' AND co_contrato = :contrato' +
                              ' AND ca_idareatexto = :idareatexto' +
                              ' AND ca_idtextocarta = :idtextocarta' +
                              ' AND NVL(ca_correoreimpresion, ca_correo) = :correo' +
                              ' AND ca_fecharecepcion IS NULL)';
          EjecutarSqlEx(sSql, [TDateTimeEx.Create(StrToDateTime(sColB)), sColC, UpperCase(sColD), Sesion.UserID,
                               StrToInt(sColA), fraModuloRecMas.Value, fraTextoRecMas.Value, fraCorreoRecMas.Value]);
        end
        else    // Carta Documento..
        begin
          sSql :=
            'UPDATE cca_carta' +
              ' SET ca_fecharecepcion = :fecharecepcion,' +
                  ' ca_recepcionok = :recepcionok,' +
                  ' ca_codrecepcion = :codrecepcion,' +
                  ' ca_usurecepcion = :usurecepcion' +
            ' WHERE ca_nrocartadoc = :nrocartadoc';
          EjecutarSqlEx(sSql, [TDateTimeEx.Create(StrToDateTime(sColB)), sColC, UpperCase(sColD), Sesion.UserID, sColA]);
        end;
      except
        on E: Exception do
          raise Exception.Create(E.Message);
      end;

      Inc(iRow);
      progress.StepIt;
      if (iRow mod 20) = 0 then
        Forms.Application.ProcessMessages;

      sColA := Range['A' + IntToStr(iRow), 'A' + IntToStr(iRow)].Value2;
      sColB := Range['B' + IntToStr(iRow), 'B' + IntToStr(iRow)].Value;
      sColC := Range['C' + IntToStr(iRow), 'C' + IntToStr(iRow)].Value2;
      sColD := Range['D' + IntToStr(iRow), 'D' + IntToStr(iRow)].Value2;
    end;

    MsgBox('El proceso ha finalizado exitosamente.');
  end;
end;

procedure TfrmAfiAdministracionCartas.tbSali2Click(Sender: TObject);
begin
  fpRecepcionMasiva.Close;
end;

procedure TfrmAfiAdministracionCartas.fpOpcionesImpresionShow(Sender: TObject);
begin
  inherited;

  checkMostrarLogo.Checked := False;

  with sdqConsulta do
  begin
    // Si es una carta de bienvenida se tilda por defecto..
    checkImprimirFirma.Checked := (FieldByName('ca_idareatexto').AsInteger = TEXTO_BIENVENIDA);

    if FieldByName('ca_tiposalida').AsString = 'VE' then
    begin
      checkMostrarLogo.Checked := True;
      checkImprimirFirma.Checked := True;
    end;
  end;
end;

procedure TfrmAfiAdministracionCartas.btnCancelar4Click(Sender: TObject);
begin
  fpCambiarCorreo.Close;
end;

procedure TfrmAfiAdministracionCartas.fpCambiarCorreoShow(Sender: TObject);
begin
  fraNuevoCorreo.Clear;
  fraEntregaManoNuevo.Clear;
  memoObservaciones.Clear;
end;

procedure TfrmAfiAdministracionCartas.tbCambiarCorreoClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningun registro seleccionado.');
  if fpCambiarCorreo.ShowModal = mrOk then
  begin
    BeginTrans;

    try
      for iLoop := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));

        if sdqConsulta.FieldByName('ca_recepcionok').AsString <> 'S' then
        begin
          if not sdqConsulta.FieldByName('ca_correoreimpresion').IsNull then
          begin
            sSql :=
              'UPDATE cca_carta' +
                ' SET ca_correoreimpresion = :correo,' +
                    ' ca_usuentregaenmano = :entregamano,' +
                    ' ca_observaciones = ca_observaciones || :observaciones' +
              ' WHERE ca_id = :id';
            EjecutarSqlSTEx(sSql, [fraNuevoCorreo.Value, fraEntregaManoNuevo.Value, ' - ' + memoObservaciones.Lines.Text,
                                   sdqConsulta.FieldByName('ca_id').AsInteger]);
          end
          else
          begin
            sSql :=
              'UPDATE cca_carta' +
                ' SET ca_correo = :correo,' +
                    ' ca_usuentregaenmano = :entregamano,' +
                    ' ca_observaciones = ca_observaciones || :observaciones' +
              ' WHERE ca_id = :id';
            EjecutarSqlSTEx(sSql, [fraNuevoCorreo.Value, fraEntregaManoNuevo.Value, ' - ' + memoObservaciones.Lines.Text,
                                   sdqConsulta.FieldByName('ca_id').AsInteger]);
          end;

          Application.ProcessMessages;
        end;
      end;
      CommitTrans;

      tbRefrescarClick(nil);
    except
      Rollback;
    end;
  end;
end;

procedure TfrmAfiAdministracionCartas.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraNuevoCorreo.IsEmpty and fraEntregaManoNuevo.IsEmpty, fraNuevoCorreo.edCodigo, 'Por favor, elija el nuevo correo o el nuevo usuario entrega en mano.');

  fpCambiarCorreo.ModalResult := mrOk;
end;

procedure TfrmAfiAdministracionCartas.CambiaCorreoNuevo(Sender: TObject);
begin
  fraEntregaManoNuevo.Clear;
end;

procedure TfrmAfiAdministracionCartas.CambiaEntregaManoNuevo(Sender: TObject);
begin
  fraNuevoCorreo.Clear;
end;

procedure TfrmAfiAdministracionCartas.btnCancelar5Click(Sender: TObject);
begin
  fpCambiarFirmante.ModalResult := mrCancel;
end;

procedure TfrmAfiAdministracionCartas.fpCambiarFirmanteBeforeShow(Sender: TObject);
begin
  fraFirmanteAnterior.Value := sdqConsulta.FieldByName('idfirma').AsInteger;

  fraFirmanteNuevo.Sql :=
    'SELECT fi_id ' + CD_ALIAS_ID + ',' +
          ' fi_id ' + CD_ALIAS_CODIGO + ',' +
          ' fi_firmante ' + CD_ALIAS_DESC + ',' +
          ' fi_fechabaja ' + CD_ALIAS_BAJA +
     ' FROM cfi_firma, cfa_firmantearea' +
    ' WHERE fa_idfirmante = fi_id' +
      ' AND fa_fechabaja IS NULL' +
      ' AND fa_idareatexto = ' + SqlValue(sdqConsulta.FieldByName('ca_idareatexto').AsInteger);
  fraFirmanteNuevo.Clear;
end;

procedure TfrmAfiAdministracionCartas.btnAceptar2Click(Sender: TObject);
begin
  Verificar(fraFirmanteNuevo.IsEmpty, fraFirmanteNuevo.edCodigo, 'Debe elegir al nuevo firmante.');
  Verificar((fraFirmanteNuevo.Value = fraFirmanteAnterior.Value), fraFirmanteNuevo.edCodigo, 'El nuevo firmante no puede ser igual al anterior.');

  fpCambiarFirmante.ModalResult := mrOk;
end;

procedure TfrmAfiAdministracionCartas.tbCambiarFirmanteClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningún registro seleccionado.');

  if fpCambiarFirmante.ShowModal = mrOk then
  begin
    if sdqConsulta.FieldByName('fechaimpresion').IsNull then
      sSql :=
        'UPDATE cca_carta' +
          ' SET ca_idfirma = :idfirma' +
        ' WHERE ca_id = :id'
    else
      sSql :=
        'UPDATE cca_carta' +
          ' SET ca_idfirmareimpresion = :idfirmareimpresion' +
        ' WHERE ca_id = :id';
    EjecutarSqlEx(sSql, [fraFirmanteNuevo.Value, sdqConsulta.FieldByName('ca_id').AsInteger]);
    
    MsgBox('El cambio de firmante se realizó de manera exitosa.');
  end;
end;

procedure TfrmAfiAdministracionCartas.tbVerImpresionClick(Sender: TObject);
var
  aFechaReimpresion: TDateTime;
  aFileName: String;
  bMostrar: Boolean;
  iIdCarta: Integer;
  sSql: String;
  sUsuarioReImpresionAnt: String;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningún registro seleccionado.');
  Verificar((Grid.SelectedRows.Count > 1), Grid, 'Solo puede visualizar una carta a la vez.');
  Verificar((not Seguridad.Claves.IsActive('PermisoImpresionNotificacionAumentos')) and (sdqConsulta.FieldByName('ca_idareatexto').AsInteger in [4, 6, 22, 32, 91]) and (sdqConsulta.FieldByName('fechaimpresion').IsNull), nil, 'Usted no tiene permiso para visualizar la carta seleccionada.');

  iIdCarta := sdqConsulta.FieldByName('ca_id').AsInteger;

  // Obtengo el usuario y la fecha de reimpresión para dejarlo como estaba despues de mostrar la carta..
  sSql :=
    'SELECT ca_fechareimpresion, ca_usureimpresion' +
     ' FROM cca_carta' +
    ' WHERE ca_id = :id';
  with GetQueryEx(sSql, [iIdCarta]) do
  try
    aFechaReimpresion := FieldByName('ca_fechareimpresion').AsDateTime;
    sUsuarioReImpresionAnt := FieldByName('ca_usureimpresion').AsString;
  finally
    Free;
  end;

  with TAfiCartasDoc.Create.Create do
  try
    if (sdqConsulta.FieldByName('ca_tiposalida').AsString = 'VE') and (not sdqConsulta.FieldByName('ca_idadjunto').IsNull) then    // Si es un archivo externo por ventanilla electrónica..
    begin
      aFileName := Format('%s%s-%s', [IncludeTrailingBackslash(TempPath), SacarGuiones(sdqConsulta.FieldByName('cuit').AsString), sdqConsulta.FieldByName('contrato').AsString]);
      GuardarArchivoEnDisco(aFileName, sdqConsulta.FieldByName('ca_idadjunto').AsInteger);
      ShellExecute(Handle, 'open', PChar(aFileName), nil, nil, SW_SHOWNORMAL);
    end
    else
    begin
      bMostrar := True;
      if sdqConsulta.FieldByName('ca_tiposalida').AsString = 'VE' then
      begin
        checkMostrarLogo2.Checked := True;
        checkMostrarFirma.Checked := True;
      end
      else
        bMostrar := (fpVerImpresion.ShowModal = mrOk);

      if bMostrar then
      begin
        if sdqConsulta.FieldByName('ca_idareatexto').AsInteger = TEXTO_BIENVENIDA then    // Si es una carta de bienvenida..
          MostrarCartaDocumento(iIdCarta, tmBeginEnd, False, 1, False, True, checkMostrarFirma.Checked,
                                checkMostrarFirma.Checked, False, checkMostrarLogo2.Checked, checkMostrarFirma.Checked,
                                False, '', True)
        else
          MostrarCartaDocumento(iIdCarta, tmBeginEnd, False, 1, False, checkMostrarFirma.Checked, False, False, True,
                                checkMostrarLogo2.Checked, checkMostrarFirma.Checked, False, '', False);
      end;
    end;
  finally
    sSql :=
      'UPDATE cca_carta' +
        ' SET ca_fechareimpresion = :fechareimpresion,' +
            ' ca_usureimpresion = :usureimpresion' +
      ' WHERE ca_id = :id';
    EjecutarSqlEx(sSql, [TDateTimeEx.Create(aFechaReimpresion), sUsuarioReImpresionAnt, iIdCarta]);

    Free;
  end;
end;

procedure TfrmAfiAdministracionCartas.tbImprimirAvisoReciboClick(Sender: TObject);
var
  iLoop: Integer;
  sIds: String;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningún registro seleccionado.');

  sIds := '-1';
  for iLoop := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
    sIds := sIds + ',' + sdqConsulta.FieldByName('ca_id').AsString;
  end;

  Application.CreateForm(TrptAvisoRecibo, rptAvisoRecibo);
  try
    rptAvisoRecibo.Preparar(sIds);
    MsgBox('Los avisos de recibo fueron enviados a la impresora correctamente.', MB_OK + MB_ICONINFORMATION);
  finally
    FreeAndNil(rptAvisoRecibo);
  end;
end;

procedure TfrmAfiAdministracionCartas.AceptarImpresion;
var
  aFileName, aFileNameQrp: String;
  bPermisoImpresion: Boolean;
  iIdCarta: Integer;
  iLoop: Integer;
  iOldImpresora: Integer;
  sCarpetaDestino: String;
  sPrimerFormatoSalida: String;
  iEnviadosSRTOk, iEnviadosSRTFallo: Integer;
  iIdConsulta : Integer;
  ListaIds : Array of TListaIds;
  frmSeleccionarCarpetaSrt : TfrmSeleccionarCarpetaSrt;
begin
  iOldImpresora := Printer.PrinterIndex;
  Printer.PrinterIndex := cmbImpresoras.ItemIndex;

  GridEnvios.RowCount := 2;
  GridEnvios.Clear;
  GridNoEnviados.RowCount := 2;
  GridNoEnviados.Clear;
  iEnviadosSRTOk := 0;
  iEnviadosSRTFallo := 0;

  bPermisoImpresion := True;
  sCarpetaDestino := '';
  frmSeleccionarCarpetaSrt := TfrmSeleccionarCarpetaSrt.Create(Self);
  try
    FPararImpresion := False;
    btnParar.Enabled := True;
    frmSeleccionarCarpetaSrt.CarpetaDestino := FRuta;

    for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

      if iLoop = 0 then
        sPrimerFormatoSalida := sdqConsulta.FieldByName('ca_tiposalida').AsString;

      Verificar((sPrimerFormatoSalida <> sdqConsulta.FieldByName('ca_tiposalida').AsString), Grid, 'Si decide imprimir varias cartas al mismo tiempo, estas tienen que tener el mismo formato de salida.');

      if not Seguridad.Claves.IsActive('PermisoImpresionNotificacionAumentos') then
        if (sdqConsulta.FieldByName('ca_idareatexto').AsInteger in [4, 6, 22, 32, 91]) and (sdqConsulta.FieldByName('fechaimpresion').IsNull) then
          bPermisoImpresion := False;
    end;

    if (not bPermisoImpresion) and (not MsgAsk('Usted no tiene permiso para imprimir algunas de las cartas seleccionadas.' + #13#10 + '¿ Desea imprimir solo las que tiene permiso ?')) then
      Exit;



    if sPrimerFormatoSalida = 'VE' then   // Si el formato de salida es Ventanilla Electrónica..
      if frmSeleccionarCarpetaSRT.ShowModal = mrOk then
      begin
        sCarpetaDestino := frmSeleccionarCarpetaSrt.CarpetaDestino;
        if frmSeleccionarCarpetaSrt.EnviarSRT then
        begin
          SetLength(ListaIds, Grid.SelectedRows.Count);
          for iLoop := 0 to Grid.SelectedRows.Count - 1 do
          begin
            sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));    //Me cargo la grilla de no enviados
            AgregarEnvio(sdqConsulta.FieldByName('cuit2').AsString, 'NO ENVIADO', GridNoEnviados);
            iIdConsulta := GetSecNextVal('SRT.SEQ_SCRCONSULTASSRT_ID');

            ListaIds[iLoop].IdConsulta := iIdConsulta;
            LogAuditEnvio(sdqConsulta.FieldByName('cuit2').AsString, 'Preparar para enviar', iIdConsulta, sdqConsulta.FieldByName('ca_id').AsInteger);
          end;
         { if (FileExists(IncludeTrailingBackslash(sCarpetaDestino)+ 'NoEnviados.xlsx')) then  //guardo todos los no enviados
              DeleteReadOnlyFile(IncludeTrailingBackslash(sCarpetaDestino)+ 'NoEnviados.xlsx');
              GridNoEnviados.SaveToXLS(IncludeTrailingBackslash(sCarpetaDestino)+ 'NoEnviados.xlsx', True);}
        end;
      end
      else
        Exit;


    with TAfiCartasDoc.Create do
    try
      for iLoop := 0 to Grid.SelectedRows.Count - 1 do
      begin
        Verificar(FPararImpresion, btnAceptarImpresion, 'Ha decidido cancelar la impresión.');

        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
        iIdCarta := sdqConsulta.FieldByName('ca_id').AsInteger;

        if (not Seguridad.Claves.IsActive('PermisoImpresionNotificacionAumentos')) and
           (sdqConsulta.FieldByName('ca_idareatexto').AsInteger in [4, 6, 22, 32, 91]) and
           (sdqConsulta.FieldByName('fechaimpresion').IsNull) then
          Break;

        aFileName := '';
        if sCarpetaDestino <> '' then
          with sdqConsulta do
          begin
            aFileName := Format('%s%s-%s.pdf', [IncludeTrailingBackslash(sCarpetaDestino),
                                                SacarGuiones(FieldByName('cuit').AsString),
                                                FieldByName('contrato').AsString]);
            aFileNameQrp := Format('%s%s-%s.qrp', [IncludeTrailingBackslash(sCarpetaDestino),
                                                SacarGuiones(FieldByName('cuit').AsString),
                                                FieldByName('contrato').AsString]);
          end;
        try
        if sdqConsulta.FieldByName('ca_tiposalida').AsString = 'VE' then
        begin
          DeleteReadOnlyFile(aFileName);
          if not sdqConsulta.FieldByName('ca_idadjunto').IsNull then    // Si es un archivo externo..
            GuardarArchivoEnDisco(aFileName, sdqConsulta.FieldByName('ca_idadjunto').AsInteger)
            else  //controlar casos especiales.
            begin
              sCarpetaDestino := frmSeleccionarCarpetaSrt.CarpetaDestino;
              MostrarCartaDocumento(iIdCarta, tmBeginEnd, False, 1, False, checkMostrarFirma.Checked, False, False, True,
                                checkMostrarLogo2.Checked, checkMostrarFirma.Checked, False, '', True, sCarpetaDestino + '\' +
                                SacarGuiones(sdqConsulta.FieldByName('cuit').AsString) + '-' + sdqConsulta.FieldByName('contrato').AsString + '.pdf', False);
              DeleteFile(aFileNameQrp);
            end;
          GuardarFechaImpresion(sdqConsulta.FieldByName('ca_id').AsInteger);
        end
        else
        begin
          if sdqConsulta.FieldByName('ca_idareatexto').AsInteger = TEXTO_BIENVENIDA then    // Si es una carta de bienvenida..
            MostrarCartaDocumento(iIdCarta, tmBeginEnd, rbImprimir.Checked, edCantCopias.Value, False, True,
                                  checkImprimirFirma.Checked, checkImprimirFirma.Checked, False, checkMostrarLogo.Checked,
                                  checkImprimirFirma.Checked, False, '', False, aFileName, False)
          else
            MostrarCartaDocumento(iIdCarta, tmBeginEnd, rbImprimir.Checked, edCantCopias.Value, False,
                                  checkImprimirFirma.Checked, False, False, True, checkMostrarLogo.Checked,
                                  checkImprimirFirma.Checked, False, '', False, aFileName, False);
        end;
        except
          AgregarEnvio(sdqConsulta.FieldByName('cuit2').AsString, 'NO ENVIADO', GridNoEnviados);
          AgregarEnvio(sdqConsulta.FieldByName('cuit2').AsString, 'NO ENVIADO', GridEnvios);
          QuitarFechaImpresion(sdqConsulta.FieldByName('ca_id').AsInteger);
          AppendToFile(IncludeTrailingBackslash(sCarpetaDestino)+ 'Resultado.csv', sdqConsulta.FieldByName('cuit2').AsString + ';NO ENVIADO');
        end;

        BarProgreso.Position := Round((iLoop + 1) / Grid.SelectedRows.Count * 100);

        if (frmSeleccionarCarpetaSrt.EnviarSRT) then
        begin
          if EnviarSRTResult(aFileName, frmSeleccionarCarpetaSrt.Comunicacion, sdqConsulta.FieldByName('cuit2').AsString,
                             frmSeleccionarCarpetaSrt.TipoComunicacion, ListaIds[iLoop].IdConsulta, sdqConsulta.FieldByName('ca_id').AsInteger) then
          begin
            AppendToFile(IncludeTrailingBackslash(sCarpetaDestino)+ 'Resultado.csv', sdqConsulta.FieldByName('cuit2').AsString + ';ENVIADO');
            RemoverCuitGrillaSRT(sdqConsulta.FieldByName('cuit2').AsString, GridNoEnviados);
            AgregarEnvio(sdqConsulta.FieldByName('cuit2').AsString, 'OK', GridEnvios);
            Inc(iEnviadosSRTOk);
          end
          else
          begin
            AppendToFile(IncludeTrailingBackslash(sCarpetaDestino)+ 'Resultado.csv', sdqConsulta.FieldByName('cuit2').AsString + ';ENVIADO');
            AgregarEnvio(sdqConsulta.FieldByName('cuit2').AsString, 'NO ENVIADO', GridNoEnviados);
            Inc(iEnviadosSRTFallo);
          end;
        end;
        Application.ProcessMessages;
      end;
      if (frmSeleccionarCarpetaSrt.EnviarSRT) then
      begin
        with fpResultadosSRT do
        begin
          edEnviosTotales.Text := IntToStr(iEnviadosSRTOk + iEnviadosSRTFallo);
          edEnviosOk.Text := IntToStr(iEnviadosSRTOk);
          edEnviosFallados.Text := IntToStr(iEnviadosSRTFallo);
          //GridEnvios.SaveToXLS(IncludeTrailingBackslash(sCarpetaDestino)+ 'Resultado.xlsx', False);
         { if (FileExists(IncludeTrailingBackslash(sCarpetaDestino)+ 'NoEnviados.xlsx')) then
              DeleteReadOnlyFile(IncludeTrailingBackslash(sCarpetaDestino)+ 'NoEnviados.xlsx'); }
         // GridNoEnviados.SaveToXLS(IncludeTrailingBackslash(sCarpetaDestino)+ 'NoEnviados.xlsx', False);
          ShowModal;
        end;
      end;
    finally
      Free;
    end;
    FRuta := frmSeleccionarCarpetaSrt.CarpetaDestino;
    fpOpcionesImpresion.ModalResult := mrOk;
    Grid.UnSelectAll;
    sdqConsulta.Refresh;
  finally
    Printer.PrinterIndex := iOldImpresora;
    btnParar.Enabled := False;
    frmSeleccionarCarpetaSrt.Free;
  end;
end;

procedure TfrmAfiAdministracionCartas.mnuCopiarCartasClick(Sender: TObject);
var
  aTextoFinal: TStringList;
  iLoop: Integer;
  iSeq: Integer;
  sCorreo: String;
  sFormatoSalida: String;
  sPrimerFormatoSalida: String;
  sSql: String;
  iAtiId: Integer;
begin
  // 0 = Carta comercial..
  // 1 = Carta documento..
  // 2 = Ventanilla electrónica..
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'Debe seleccionar al menos una fila de la grilla.');

  FIdsCartas := '';
  sFormatoSalida := IIF((TMenuItem(Sender).Tag = 0), 'CC', IIF((TMenuItem(Sender).Tag = 1), 'C', 'VE'));
  with sdqConsulta do
  begin
    for iLoop := 0 to Grid.SelectedRows.Count - 1 do
    begin
      GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

      if iLoop = 0 then
        sPrimerFormatoSalida := FieldByName('ca_tiposalida').AsString;

      Verificar((sPrimerFormatoSalida <> FieldByName('ca_tiposalida').AsString), nil, 'Las cartas a copiar tienen que tener el mismo formato de salida.');
      Verificar((FieldByName('tc_codigo').AsString = 'EXT'), nil, 'No se puede copiar un archivo con una carta externa.');
    end;

    Verificar(((sPrimerFormatoSalida = 'CC') and (TMenuItem(Sender).Tag = 0)) or
              ((sPrimerFormatoSalida = 'C') and (TMenuItem(Sender).Tag = 1)) or
              ((sPrimerFormatoSalida = 'VE') and (TMenuItem(Sender).Tag = 2)), Grid, 'El formato de salida tiene que ser distinto al formato de salida de las cartas seleccionadas.');

    Verificar(((sPrimerFormatoSalida = 'CC') and (TMenuItem(Sender).Tag = 1)) or
              ((sPrimerFormatoSalida = 'C') and (TMenuItem(Sender).Tag = 0)), Grid, 'Ese tipo de cartas no puede ser copiado a ese formato de salida.');

    BeginTrans;
    try
      sCorreo := 'ca_correo';

      if TMenuItem(Sender).Tag = 1 then   // Si se copia como carta documento..
      begin
        if fpSeleccionarCorreo.ShowModal <> mrOk then
          Abort;

        sCorreo := fraCorreo2.Value;
      end;

      for iLoop := 0 to Grid.SelectedRows.Count - 1 do
      begin
        GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

        iSeq := GetSecNextVal('SEQ_CCA_ID');

        if TMenuItem(Sender).Tag = 2 then   // Si copia como ventanilla electrónica, guardo los ids..
        begin
//          FIdsCartas := FIdsCartas + IntToStr(iSeq) + ',';
          sCorreo := '10';
        end;

        sSql :=
          'INSERT INTO cca_carta' +
                     ' (ca_id, ca_nrocartadoc, ca_idtextocarta, ca_correo, ca_tiposalida, ca_idfirma, ca_observaciones,' +
                      ' ca_correoreimpresion, ca_idfirmareimpresion, ca_imprimeabandono2, ca_usuabandono2, ca_evento, ca_numliqui,' +
                      ' ca_seqcartadoc, ca_idformulario, ca_idtrabajador, ca_idendoso, ca_manual, ca_idcartaareemplazar, ca_usualta,' +
                      ' ca_fechaalta, ca_usumodif, ca_fechamodif, ca_fechabaja, ca_usubaja, ca_idart, ca_idareatexto, ca_iddelegacion,' +
                      ' ca_idempdeudora, ca_idendosotemp, ca_idendosoreimpresion, ca_idrecepcioncartadoc, ca_idexpediente,' +
                      ' ca_infoendosotarifa, ca_ideventoinca, ca_fechaaltamedica, ca_usuentregaenmano, ca_incluirenremito, ca_idremito,' +
                      ' ca_canthojas, ca_numliqui_otrosconc, ca_iddestinatariocarta, ca_idcomisionmedica, ca_idcuentarevision,' +
                      ' ca_fechamail, ca_usumail, ca_observrecepcion, ca_idhistoricotextocarta, ca_calle, ca_numero, ca_piso,' +
                      ' ca_departamento, ca_localidad, ca_provincia, ca_cpostal, ca_cpostala)' +
           ' SELECT :id, NULL, ca_idtextocarta, ' + IIF((sCorreo = 'ca_correo'), 'CA_CORREO', SqlString(sCorreo, True)) + ', :formatosalida,' +
                  ' ca_idfirma, ca_observaciones, ca_correoreimpresion, ca_idfirmareimpresion, ca_imprimeabandono2, ca_usuabandono2,' +
                  ' ca_evento, ca_numliqui, ca_seqcartadoc, ca_idformulario, ca_idtrabajador, ca_idendoso, ca_manual,' +
                  ' ca_idcartaareemplazar, :usualta, SYSDATE, ca_usumodif, ca_fechamodif, ca_fechabaja, ca_usubaja, ca_idart,' +
                  ' ca_idareatexto, ca_iddelegacion, ca_idempdeudora, ca_idendosotemp, ca_idendosoreimpresion, ca_idrecepcioncartadoc,' +
                  ' ca_idexpediente, ca_infoendosotarifa, ca_ideventoinca, ca_fechaaltamedica, ca_usuentregaenmano, ca_incluirenremito,' +
                  ' ca_idremito, ca_canthojas, ca_numliqui_otrosconc, ca_iddestinatariocarta, ca_idcomisionmedica, ca_idcuentarevision,' +
                  ' ca_fechamail, ca_usumail, ca_observrecepcion, ca_idhistoricotextocarta, ca_calle, ca_numero, ca_piso, ca_departamento,' +
                  ' ca_localidad, ca_provincia, ca_cpostal, ca_cpostala' +
             ' FROM cca_carta' +
            ' WHERE ca_id = :idanterior';
        EjecutarSqlSTEx(sSql, [iSeq, sFormatoSalida, Sesion.UserID, FieldByName('ca_id').AsInteger]);

        //Si es un traspaso ingreso no perder la referencia
        iAtiId := ValorSqlIntegerEx('SELECT rt_idtraspasoingreso FROM afi.art_relatraspingcarta WHERE rt_idcarta = :idcarta',[FieldByName('ca_id').AsInteger], -1);
        if iAtiId <> -1 then
        begin
          sSql :=
            'INSERT INTO afi.art_relatraspingcarta' +
                    ' (rt_idcarta, rt_idtraspasoingreso, rt_fechaalta, rt_usualta) VALUES' +
                    ' (:idcarta, :idtrasp, SYSDATE, :usualta) ';
          EjecutarSqlSTEx(sSql, [iSeq, iAtiId, frmPrincipal.DBLogin.UserID]);
        end;  


        aTextoFinal := TStringList.Create;
        try
          BlobSql('SELECT ca_textofinal' +
                   ' FROM cca_carta' +
                  ' WHERE ca_id = ' + SqlInt(FieldByName('ca_id').AsInteger), aTextoFinal);
          if (aTextoFinal.Text <> '') then
            SaveBlob('SELECT ca_textofinal' +
                      ' FROM cca_carta' +
                     ' WHERE ca_id = ' + SqlInt(iSeq),
                     'UPDATE cca_carta' +
                       ' SET ca_textofinal  = :ca_textofinal' +
                     ' WHERE ca_id = ' + SqlInt(iSeq),
                     'ca_textofinal', aTextoFinal);
        finally
          aTextoFinal.Free;
        end;

        if sFormatoSalida = 'VE' then   // Si es ventanilla electrónica..
        begin
          sSql :=
            'UPDATE cca_carta' +
              ' SET ca_fechaimpresion = SYSDATE,' +
                  ' ca_usuimpresion = :usuimpresion' +
            ' WHERE ca_id = :id';
          EjecutarSqlSTEx(sSql, [Sesion.UserID, iSeq]);
        end;
      end;
      CommitTrans;

{
Esto no va mas según ticket 16704..
      if TMenuItem(Sender).Tag = 2 then   // Si copia como ventanilla electrónica, imprimo las cartas..
      begin
        System.Delete(FIdsCartas, Length(FIdsCartas), 1);
        ImprimirRecienGeneradas(FIdsCartas);
      end;
}
      MsgBox('Las cartas fueron copiadas correctamente.');
    except
      on E: Exception do
      begin
        Rollback;
        MsgBox('Ha ocurrido un error. ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmAfiAdministracionCartas.tbCopiarClick(Sender: TObject);
begin
  tbCopiar.CheckMenuDropdown;
end;

procedure TfrmAfiAdministracionCartas.tbGenerarMultiplesCartasClick(Sender: TObject);
begin
  Abrir(TfrmGenerarMultiplesCartas, frmGenerarMultiplesCartas, tmvMDIChild, nil);
end;

procedure TfrmAfiAdministracionCartas.ImprimirRecienGeneradas(const aIdCartas: String);
begin
  FIdsCartas := aIdCartas;
  tbLimpiarClick(nil);
  rgEstado.ItemIndex := 2;    // Todas..
  tbRefrescarClick(nil);
  FIdsCartas := '';
  Grid.SelectAll;
  checkMostrarLogo.Checked := True;
  checkImprimirFirma.Checked := True;
  AceptarImpresion;
end;

procedure TfrmAfiAdministracionCartas.FSFormDestroy(Sender: TObject);
begin
  inherited;

  frmAfiAdministracionCartas := nil;
end;

procedure TfrmAfiAdministracionCartas.tbVisualizadorDocumentacionDigitalizadaClick(Sender: TObject);
begin
  if not fraEmpresaAfiliaciones.IsEmpty then
    DoCargarImagenesDigitalizadasAfi(Self, fraEmpresaAfiliaciones.Contrato);
end;

procedure TfrmAfiAdministracionCartas.fpVerImpresionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpVerImpresion.Close;
end;

procedure TfrmAfiAdministracionCartas.btnCancelar6Click(Sender: TObject);
begin
  fpVerImpresion.Close;
end;

procedure TfrmAfiAdministracionCartas.fpVerImpresionShow(Sender: TObject);
begin
  checkMostrarLogo2.Checked := True;
  checkMostrarFirma.Checked := True;
end;

procedure TfrmAfiAdministracionCartas.btnAceptar4Click(Sender: TObject);
begin
  fpVerImpresion.ModalResult := mrOk;
end;

procedure TfrmAfiAdministracionCartas.tbVerTarifasClick(Sender: TObject);
begin
  Grid.ColumnByField['porcvariable'].Visible := tbVerTarifas.Down;
  Grid.ColumnByField['sumafija'].Visible     := tbVerTarifas.Down;
end;

procedure TfrmAfiAdministracionCartas.tbSeguimientoClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.FieldByName('ca_id').AsInteger = 0), tbSeguimiento, 'Debe seleccionar una carta documento.');

  with sdqSeguimiento1 do
  begin
    Close;
    ParamByName('idcarta').AsInteger := sdqConsulta.FieldByName('ca_id').AsInteger;
    Open;
  end;

  with sdqSeguimiento2 do
  begin
    Close;
    ParamByName('idcarta').AsInteger := sdqConsulta.FieldByName('ca_id').AsInteger;
    Open;
  end;

  fpSeguimiento.Caption := Format('Seguimiento de la Carta Documento %s (%s)',
                                  [sdqConsulta.FieldByName('nrocartadoc').AsString,
                                   sdqConsulta.FieldByName('empresa').AsString]);
  fpSeguimiento.ShowModal;
end;

procedure TfrmAfiAdministracionCartas.btnAceptar5Click(Sender: TObject);
begin
  Verificar(fraCorreo2.IsEmpty, fraCorreo2.edCodigo, 'El campo Correo es obligatorio.');
  fpSeleccionarCorreo.ModalResult := mrOk;
end;

procedure TfrmAfiAdministracionCartas.fpSeleccionarCorreoBeforeShow(Sender: TObject);
begin
  fraCorreo2.Clear;
end;

procedure TfrmAfiAdministracionCartas.btnAcetarSRTClick(Sender: TObject);
begin
  fpResultadosSRT.ModalResult := MrOk;
end;

procedure TfrmAfiAdministracionCartas.AgregarEnvio(const aCuit,
  aEnvioResultado: String; var aGrid: TAdvStringGrid);
begin
  if (aGrid.RowCount = 2) and (aGrid.Cells[0, 1] = '') and (aGrid.Cells[1, 1] = '') then
  begin
    aGrid.RemoveRows(1, 1);
    aGrid.Clear;
  end;
  aGrid.AddRow;

  aGrid.Cells[0, aGrid.RowCount - 1] := aCuit;
  aGrid.Cells[1, aGrid.RowCount - 1] := aEnvioResultado;
  aGrid.Cells[0, 0] := 'Cuit';
  aGrid.Cells[1, 0] := 'Resultado';
  if aGrid.RowCount > 1 then
    aGrid.FixedRows := 1;
end;

procedure TfrmAfiAdministracionCartas.RemoverCuitGrillaSRT(aCuit: String; var
  aGrilla: TAdvStringGrid);
var
  aLoc: TPoint;
  aFp: TFindParams;
begin
  aLoc := Classes.Point(-1, -1);
  aFp := [fnMatchRegular];

  repeat
    aLoc := aGrilla.Find(aLoc, aCuit, aFp);
    if not ((aLoc.X = -1) or (aLoc.Y = -1) or (aLoc.X <> 0){columna que espero}) then
      aGrilla.RemoveNormalRow(aLoc.Y);
  until (aLoc.X = -1) or (aLoc.Y = -1);
end;

procedure TfrmAfiAdministracionCartas.tbFormatoCuitClick(Sender: TObject);
begin
  MessageDlg('El Formato del archivo es:' + CRLF +
             '* Extensión: .TXT' + CRLF +
             '* Encabezado: No debe ingresarse encabezado' + CRLF +
             '* Cuerpo: ' + CRLF +
             '   - Campos: 1) NroDeCuit' + CRLF +
             '   - Obs: No deben ingresarse más campos que el de NroDeCuit' + CRLF +
             '          Se debe efectuar un salto de línea (Enter) al final de cada línea (incluyendo la última)'
             , mtInformation, [mbOK], 0);
end;

procedure TfrmAfiAdministracionCartas.tbLimparTXTCuitClick(
  Sender: TObject);
begin
  edCuits.Clear;
end;


procedure TfrmAfiAdministracionCartas.tbAgregarTXTCuitClick(
  Sender: TObject);
var
  aArchivo: TextFile;
  iCountCuits: Integer;
  sCuits: String;
  sTemp: String;
begin
  inherited;

  OpenDialog.Title := 'Archivo de CUIT';
  OpenDialog.DefaultExt := 'txt';
  OpenDialog.Filter := 'Archivos de Texto(*.txt)|*.txt';
  if OpenDialog.Execute then
  try
    try
      AssignFile(aArchivo, OpenDialog.FileName);
      Reset(aArchivo);
      iCountCuits := 0;
      while not Eof(aArchivo) do
      begin
        Inc(iCountCuits);
        ReadLn(aArchivo, sTemp);
        SacarGuiones(sTemp);
        if isCuit(sTemp) then // Con esto chequeo que no ingrese cualquier cosa.. cambiar muy grande
          sCuits := sCuits + '''' + sTemp + '''' + ',';

        if iCountCuits > 1000 then
        begin
          MessageDlg('La cantidad máxima de cuits es 1000.', mtError, [mbOK], 0);
          Exit;
        end;
      end;
      edCuits.Text := Copy(sCuits, 1, Length(sCuits) - 1);
    except
      edCuits.Text := '';
      MessageDlg('El archivo no posee un formato válido.', mtError, [mbOK], 0);
    end;
    //Quito la coma que sobra
  finally
    CloseFile(aArchivo);
  end;
end;

procedure TfrmAfiAdministracionCartas.SeleccionarFilas(
  const aShortCut: Integer);
var
  Cell : TGridCoord;
  TitleOffset, DeltaY, Step, i: Integer;
begin
 if dgTitles in Grid.Options then  //offset del Titulo de la columna
    TitleOffset := 1
  else
    TitleOffset := 0;

  if (aShortCut <> 8227) and (aShortCut <> 8228) then //salgo si no son las teclas esperadas
    Exit;

  if aShortCut = 8227  then   //Si selecciona hacia arriba o hacia abajo
  begin
   DeltaY := Grid.DataSource.DataSet.RecordCount - Grid.DataSource.DataSet.RecNo;
   Step := 1
  end
  else
  begin
    DeltaY := Grid.DataSource.DataSet.RecNo;
    Step := -1;
  end;

  if (Grid.DataSource.DataSet.Active) then //que este activo
  begin
    if (dgMultiSelect in Grid.Options) then  //Veo que tenga la prop. multi
    begin
     if Cell.Y >= TitleOffset then  //si la grilla usa la fila de titulo uso ese offset
     begin
       try
         for i := 0 to DeltaY -1 do     //Selecciono
         begin
           Grid.DataSource.DataSet.MoveBy(Step);
           Grid.SelectedRows.CurrentRowSelected := True;
         end;
         if Step > 0 then //mover el cursor
           Grid.DataSource.DataSet.MoveBy(-DeltaY +1)
         else
           Grid.DataSource.DataSet.MoveBy(DeltaY);
       except
         ShowMessage('error al seleccionar');
       end;
     end;
  end
  else
    inherited;
  end;
end;

end.
