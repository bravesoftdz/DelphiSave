unit unVentanillaElectronica;

interface

{$IFDEF AFILIACIONES}
  {$DEFINE  MODOAFIL}
{$ELSE}
  {$IFDEF COBRANZAS}
    {$DEFINE  MODOAFIL}
  {$ENDIF}
{$ENDIF}


uses
  {$IFDEF VER150}{$IFDEF MODOAFIL}unImportFromSRTReclamos, {$ENDIF} {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, JvExComCtrls, JvMonthCalendar,
  CheckLst, ARTCheckListBox, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, JvgGroupBox,
  unArtDbFrame, unFraEmpresa, SinEdit, JvExMask, JvToolEdit, JvMaskEdit,
  unFraTrabajador, unFraTrabajadorSiniestro, PatternEdit, IntEdit,
  JvExStdCtrls, JvEdit, unfraDelegacion, Buttons, AdvGroupBox,
  AdvOfficeButtons, AdvSplitter, AdvCardList, DBAdvCardList, ToolPanels,
  Menus, DBCtrls, JvExExtCtrls, JvComponent, JvPanel, RxToolEdit,
  JvExtComponent, RxPlacemnt, unFraEstablecimiento;

const
  TIPO_NOTA_CORRECTIVA_SIN_PLAZO = '3';
  TIPO_OTRO                      = '9';
  
type
  TfrmVentanillaElectronica = class(TfrmCustomGridABM)
    gbFiltrosEmpresa: TJvgGroupBox;
    pnlSubFiltros: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label29: TLabel;
    fraVE_ID_LIKE: TfraCodDesc;
    edVR_FECHARECLAMODesde: TDateComboBox;
    edVR_FECHARECLAMOHasta: TDateComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    cblVE_ID: TARTCheckListBox;
    calVR_FECHAVENCIMIENTODesde: TJvMonthCalendar;
    fraVA_ID: TfraCodDesc;
    pnlNofiltro: TPanel;
    Label6: TLabel;
    Label24: TLabel;
    fraVS_ID: TfraCodDesc;
    fraVT_ID: TfraCodDesc;
    fraCO_CONTRATO: TfraEmpresa;
    Label2: TLabel;
    edEX_ID: TSinEdit;
    Label3: TLabel;
    sdqConsultaVR_ID: TFloatField;
    sdqConsultaVR_IDEXPEDIENTE: TFloatField;
    sdqConsultaVR_IDSUBTEMA: TFloatField;
    sdqConsultaVR_IDESTADO: TFloatField;
    sdqConsultaVR_FECHARECLAMO: TDateTimeField;
    sdqConsultaVR_FECHAVENCIMIENTO: TDateTimeField;
    sdqConsultaVR_CONTRATO: TFloatField;
    sdqConsultaVR_CUIL_CUIT_DENUNCIANTE: TStringField;
    sdqConsultaVR_NOMBRE_DENUNCIANTE: TStringField;
    sdqConsultaVE_DESCRIPCION: TStringField;
    sdqConsultaVS_DESCRIPCION: TStringField;
    sdqConsultaVT_DESCRIPCION: TStringField;
    sdqConsultaEX_ID: TFloatField;
    sdqConsultaSINIESTRO: TStringField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaVR_USUALTA: TStringField;
    sdqConsultaVR_FECHAALTA: TDateTimeField;
    sdqConsultaVR_USUMODIF: TStringField;
    sdqConsultaVR_FECHAMODIF: TDateTimeField;
    sdqConsultaVR_USUBAJA: TStringField;
    sdqConsultaVR_FECHABAJA: TDateTimeField;
    ShortCutControlHijo: TShortCutControl;
    Label17: TLabel;
    edVR_NRORECLAMO_SRT: TJvMaskEdit;
    sdqConsultaVS_ID: TFloatField;
    sdqConsultaVT_ID: TFloatField;
    sdqConsultaVR_NRORECLAMO_SRT: TStringField;
    sdqConsultaEX_SINIESTRO: TFloatField;
    sdqConsultaEX_ORDEN: TFloatField;
    sdqConsultaEX_RECAIDA: TFloatField;
    sdqConsultaVR_TIPODOCUMENTO_DENUNCIANTE: TStringField;
    sdqConsultaVR_IDARTICULO: TFloatField;
    sdqConsultaVR_HECHO: TStringField;
    sdqConsultaVR_RESPUESTA: TStringField;
    sdqConsultaTJ_NOMBRE: TStringField;
    fpAvisos: TFormPanel;
    Bevel1: TBevel;
    btnAvisar: TButton;
    btnNoAvisar: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    clbUsuarios: TARTCheckListBox;
    sdqDestinatarios: TSDQuery;
    edObservaciones: TMemo;
    Panel3: TPanel;
    Panel11: TPanel;
    pnl2: TPanel;
    pnl4: TPanel;
    Panel4: TPanel;
    pnl6: TPanel;
    pnl0: TPanel;
    sdqConsultaVE_ID: TFloatField;
    sdqConsultaGP_NOMBRE: TStringField;
    fraEX_GTRABAJO: TfraCodDesc;
    Label23: TLabel;
    sdqConsultaVR_IDTIPO: TFloatField;
    sdqConsultaVP_DESCRIPCION: TStringField;
    sdqConsultaVR_SECUENCIA: TFloatField;
    fraVP_ID: TfraCodDesc;
    Label26: TLabel;
    pnlSumatoria: TPanel;
    sdqConsultaLG_NOMBRE: TStringField;
    sdqConsultaVR_FECHA_RESPUESTA: TDateTimeField;
    sdqConsultaVR_DOCUMENTACION_COMPLETA: TStringField;
    sdqConsultaDIAS_RESOLUCION: TFloatField;
    sdqConsultaVENCIDO_HACE: TFloatField;
    Label27: TLabel;
    Label28: TLabel;
    edVR_FECHAVENCIMIENTODesde: TDateComboBox;
    edVR_FECHAVENCIMIENTOHasta: TDateComboBox;
    cmbDOCUMENTACION_FULL_LIKE: TComboBox;
    Label30: TLabel;
    sdqConsultaDOCUMENTACION: TStringField;
    cmbRECIBIDO_FULL_LIKE: TComboBox;
    Label31: TLabel;
    sdqConsultaVR_RECIBIDO: TStringField;
    sdqConsultaRECIBIDO: TStringField;
    fraTJ_ID: TfraTrabajador;
    Label32: TLabel;
    sdqConsultaTJ_ID: TFloatField;
    sdqConsultaCO_CONTRATO: TFloatField;
    Panel7: TPanel;
    edDireccionesDeCorreo: TJvEdit;
    sdqConsultaEX_GTRABAJO: TStringField;
    sdqConsultaVA_ID: TFloatField;
    sdqConsultaVP_ID: TFloatField;
    fraLG_CODIGO: TfraDelegacion;
    Label33: TLabel;
    chkAdjuntar: TCheckBox;
    sdqUsuariosART: TSDQuery;
    clbUsuariosART: TARTCheckListBox;
    Panel8: TPanel;
    tbRevisarSRT: TToolButton;
    dsRespuestas: TDataSource;
    sdqRespuestas: TSDQuery;
    sdqConsultavr_usuario_srt: TStringField;
    sdqConsultaVR_USUARIO_ASIGNADO: TStringField;
    sdqConsultaVR_ARCHIVO_SRT: TStringField;
    pnl1: TPanel;
    pgDatos: TPageControl;
    tsPrincipal: TTabSheet;
    pnlDatos: TPanel;
    fraVR_IDTIPO: TfraCodDesc;
    lbTipo: TLabel;
    fraTEMA: TfraCodDesc;
    fraVR_IDSUBTEMA: TfraCodDesc;
    fraVR_IDESTADO: TfraCodDesc;
    edNRORECLAMOSRT: TJvMaskEdit;
    lbTema: TLabel;
    lbMotivo: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    pnlDenunciante: TPanel;
    Denunciante: TLabel;
    edVR_NOMBRE_DENUNCIANTE: TEdit;
    fraVR_TIPODOCUMENTO_DENUNCIANTE: TfraCodDesc;
    Label14: TLabel;
    Label15: TLabel;
    edVR_CUIL_CUIT_DENUNCIANTE: TMaskEdit;
    pnlEmpresa: TPanel;
    fraVR_CONTRATO: TfraEmpresa;
    Label11: TLabel;
    pnlMotivo: TPanel;
    fraVR_IDARTICULO: TfraCodDesc;
    Label21: TLabel;
    pnlTrabajador: TPanel;
    Label12: TLabel;
    fraVR_IDEXPEDIENTE: TfraTrabajadorSiniestro;
    pnlUsuarios: TPanel;
    Label41: TLabel;
    edUsuarioSRT: TEdit;
    Label42: TLabel;
    edUsuarioART: TEdit;
    pnlReclamo: TPanel;
    Label45: TLabel;
    lbAbrirReclamoAfi: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    edSecuencia: TIntEdit;
    edVR_FECHARECLAMO: TDateComboBox;
    edVR_FECHAVENCIMIENTO: TDateComboBox;
    pnlDocumentacion: TPanel;
    chkDocumentacion: TCheckBox;
    rbFiltroFecha: TRadioButton;
    rbFiltroFechaNo: TRadioButton;
    pnlHecho: TPanel;
    edVR_HECHO: TMemo;
    edVR_RESPUESTA: TMemo;
    Label18: TLabel;
    btnBuscarExpedienteSrt: TBitBtn;
    gbFiltroBajas: TGroupBox;
    chkVerTodos: TRadioButton;
    chkNoVerTodos: TRadioButton;
    fpRespuesta: TFormPanel;
    Label4: TLabel;
    Label5: TLabel;
    lbAbrirRespuestaOtorgada: TLabel;
    Label19: TLabel;
    edRespuestaOtorgada: TFilenameEdit;
    edFechaRta: TDateComboBox;
    edHecho: TMemo;
    btnGuardar: TButton;
    btnCerrarRespuesta: TButton;
    rgMailOrSIC: TAdvOfficeRadioGroup;
    chkIncluirmeComoDest: TCheckBox;
    fraVR_IDASEGURADORA: TfraCodDesc;
    lblAseguradora: TLabel;
    sdqConsultaVR_IDASEGURADORA: TFloatField;
    sdqConsultaAR_CODIGOSRT: TStringField;
    sdqConsultaAR_NOMBRE: TStringField;
    sdqConsultaLG_CODIGO: TStringField;
    fraAR_ID: TfraCodDesc;
    lblFiltroAseguradora: TLabel;
    sdqConsultaAR_ID: TFloatField;
    dsSIC: TDataSource;
    sdqSIC: TSDQuery;
    AdvToolPanelTab1: TAdvToolPanelTab;
    AdvToolPanelSIC: TAdvToolPanel;
    pnlSIC: TPanel;
    DBAdvCardListPrestadores: TDBAdvCardList;
    pmSIC: TPopupMenu;
    mnuAgregarObservacionesTarea: TMenuItem;
    fpObservacionesSIC: TFormPanel;
    lbl4: TLabel;
    mmoObservacionesSIC: TMemo;
    btnGuardarObservacionesSIC: TButton;
    btnCancelarObservacionesSIC: TButton;
    mnuAgregarObservacionesEvento: TMenuItem;
    lblMotivo: TLabel;
    dbtxtTIPO: TDBText;
    Label20: TLabel;
    dbtxtRESPONSABLE: TDBText;
    lbl1: TLabel;
    dbtxtINSTANCIA: TDBText;
    dbmmoDESCRIPCION: TDBMemo;
    sdqConsultaPRIMERA_RESPUESTA: TFloatField;
    sdqConsultaVENCIDO_PRIMERA_RESPUESTA: TFloatField;
    pnl53: TJvPanel;
    pnl3: TJvPanel;
    pnl52: TJvPanel;
    pnl51: TJvPanel;
    pnl54: TJvPanel;
    pnlRecibido: TPanel;
    chkRecibido: TCheckBox;
    sdqConsultaVS_FECHABAJA: TDateTimeField;
    sdqConsultaVP_FECHABAJA: TDateTimeField;
    pnlUsuariosSeleccionados: TPanel;
    edUsuarios: TEdit;
    sdqConsultaVA_DESCRIPCION: TStringField;
    Label22: TLabel;
    edVR_OBSERVACIONES: TMemo;
    sdqConsultaVR_OBSERVACIONES: TStringField;
    tbFechaVencimiento: TToolButton;
    fpFechaVencimiento: TFormPanel;
    Bevel2: TBevel;
    btnAceptarFechaVencimiento: TButton;
    btnCancelarFechaVencimiento: TButton;
    Label25: TLabel;
    edFechaVencimientoModificar: TDateComboBox;
    edNuevoEstado: TEdit;
    Label34: TLabel;
    tbRecategorizarMotivo: TToolButton;
    fpRecategorizarMotivo: TFormPanel;
    Bevel3: TBevel;
    Label35: TLabel;
    btnAceptarRecategorizarMotivo: TButton;
    btnCancelarRecategorizarMotivo: TButton;
    fraRecategorizarMotivo: TfraCodDesc;
    fraTipoDeComunicacion: TfraCodDesc;
    Label36: TLabel;
    pnlEstablecimiento: TPanel;
    Label37: TLabel;
    sdqConsultaVR_IDESTABLECIMIENTO: TFloatField;
    gbFiltrosHYS: TJvgGroupBox;
    Panel10: TPanel;
    Label38: TLabel;
    fraTIPOEMPRESA: TfraCodDesc;
    fraES_TIPOESTABLECIMIENTO: TfraCodDesc;
    Label39: TLabel;
    Label40: TLabel;
    sdqTipoEstablecimiento: TSDQuery;
    fraES_IDACTIVIDAD: TfraCodDesc;
    sdqConsultaES_TIPOESTABLECIMIENTO: TStringField;
    sdqConsultaTIPOEMPRESA: TStringField;
    sdqConsultaES_IDACTIVIDAD: TFloatField;
    sdqConsultaAC_DESCRIPCION: TStringField;
    sdqConsultaDESCTIPOEMPRESA: TStringField;
    sdqConsultaTIPOESTABLECIMIENTO: TStringField;
    sdqConsultaDIF: TFloatField;
    pgRespuestas: TPageControl;
    tsRespuestas: TTabSheet;
    tlbBarra: TToolBar;
    btnRefresh: TToolButton;
    ToolButton2: TToolButton;
    btnAgregar: TToolButton;
    btnModificar: TToolButton;
    btnEliminar: TToolButton;
    ToolButton12: TToolButton;
    btnAGA: TToolButton;
    ToolButton14: TToolButton;
    btnVerRespuesta: TToolButton;
    Panel9: TPanel;
    GridRespuestas: TArtDBGrid;
    tsArchivos: TTabSheet;
    tlbArchivos: TToolBar;
    btnRefreshArchivos: TToolButton;
    ToolButton7: TToolButton;
    btnAgregarArchivo: TToolButton;
    btnEliminarArchivo: TToolButton;
    ToolButton17: TToolButton;
    btnVerArchivo: TToolButton;
    Panel12: TPanel;
    GridArchivos: TArtDBGrid;
    dsArchivos: TDataSource;
    sdqArchivos: TSDQuery;
    sdqArchivosVJ_ARCHIVO: TStringField;
    sdqArchivosVJ_USUALTA: TStringField;
    sdqArchivosVJ_FECHAALTA: TDateTimeField;
    sdqArchivosVJ_USUBAJA: TStringField;
    sdqArchivosVJ_FECHABAJA: TDateTimeField;
    sdqArchivosVJ_ID: TFloatField;
    sdqArchivosVJ_IDRECLAMO: TFloatField;
    sdqArchivosVJ_NOMBREARCHIVO: TStringField;
    fraVR_USUALTA: TfraCodDesc;
    Label43: TLabel;
    fraUsuAltaResp_NO_FILTRAR: TfraCodDesc;
    Label44: TLabel;
    sdqConsultaDERIVACION: TStringField;
    fpTextosRespuesta: TFormPanel;
    Bevel4: TBevel;
    Label47: TLabel;
    btnAceptarTextosRespuesta: TButton;
    Button2: TButton;
    Label46: TLabel;
    Label48: TLabel;
    btnLimpiar: TButton;
    mTexto1: TMemo;
    mTexto2: TMemo;
    mTexto3: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure ControlSubtema(Sender: TObject);
    procedure ControlSubtemaFiltro(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure fraVR_IDESTADOPropiedadesChange(Sender: TObject);
    procedure edVR_FECHARECLAMOChange(Sender: TObject);
    procedure btnAvisarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fraVR_IDTIPOPropiedadesChange(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure GridRespuestasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure edRespuestaOtorgadaChange(Sender: TObject);
    procedure lbAbrirRespuestaOtorgadaClick(Sender: TObject);
    procedure lbAbrirReclamoAfiClick(Sender: TObject);
    procedure tbRevisarSRTClick(Sender: TObject);
    procedure GridRespuestasCellClick(Column: TColumn);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCerrarRespuestaClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure GridRespuestasDblClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnVerRespuestaClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure rbFiltroFechaClick(Sender: TObject);
    procedure rbFiltroFechaNoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure btnBuscarExpedienteSrtClick(Sender: TObject);
    procedure btnGuardarObservacionesSICClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure fpAvisosShow(Sender: TObject);
    procedure fpObservacionesSICShow(Sender: TObject);
    procedure mnuAgregarObservacionesEventoClick(Sender: TObject);
    procedure mnuAgregarObservacionesTareaClick(Sender: TObject);
    procedure pmSICPopup(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqRespuestasAfterOpen(DataSet: TDataSet);
    procedure ControlMotivoTipo(Sender: TObject);
    procedure ControlRecategorizarMotivo(Sender: TObject);
    procedure ControlMotivoArticulo(Sender: TObject);
    procedure ControlFiltroMotivoTipo(Sender: TObject);
    procedure OcultarFrames(Sender: TObject);
    procedure ControlFiltroMotivoArticulo(Sender: TObject);
    procedure CambioMotivo(Sender: TObject);
    procedure ControlFiltroMotivo(Sender: TObject);
    procedure RegistroUsuarios(Sender: TObject);
    procedure RegistroUsuariosTecla(Sender: TObject; var Key: Char);
    procedure tbFechaVencimientoClick(Sender: TObject);
    procedure btnAceptarFechaVencimientoClick(Sender: TObject);
    procedure edFechaVencimientoModificarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFechaVencimientoModificarChange(Sender: TObject);
    procedure CalcularNuevoEstado;
    procedure tbRecategorizarMotivoClick(Sender: TObject);
    procedure btnAceptarRecategorizarMotivoClick(Sender: TObject);
    procedure fraRecategorizarMotivoPropiedadesChange(Sender: TObject);
    procedure btnAgregarArchivoClick(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEliminarArchivoClick(Sender: TObject);
    procedure sdqArchivosAfterOpen(DataSet: TDataSet);
    procedure GridArchivosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnVerArchivoClick(Sender: TObject);
    procedure GridArchivosDblClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnAceptarTextosRespuestaClick(Sender: TObject);
  private
    FSQL, {FSQLAux,} FStorageDirectory: String;
    bEsAfi: Boolean;
    bAgregarRespuesta: Boolean;
    FPCDatosAlto: Integer;
    fraVR_IDESTABLECIMIENTO: TFraEstablecimiento;
    FAlta: Boolean;
    procedure CambioTrabajador(Sender: TObject);
    procedure CambioEmpresa(Sender: TObject);
    procedure GuardarRespuesta(const aIdReclamo: Integer);
    procedure UpdateRespuesta;
    procedure ModificarRespuesta;
    procedure VerificarRespuesta;
    procedure AbrirRespuesta;
    procedure RefreshRespuestas(aIdReclamo: Integer);
    procedure RefreshArchivos(aIdReclamo: Integer);
    procedure ConfigurarForm;
    procedure VerificarRespuestaVieja;
    procedure ActualizarFiltroFechaVencimiento;
    procedure AgregarRespuestaVieja(const aNombreArchivo, aRespuesta: String; const aFechaRespuesta: TDate; const aIdReclamo, aSecuencia: Integer);
    function VerificarFechaReclamo(const aDate: TDate; const aVR_IDTIPO: Integer): boolean;
    function VerificarFechaRespuesta(const aDateReclamo, aDateRespuesta: TDate): boolean;
    function EsRojo(sdqConsultaActiva: TSDquery; sFieldBaja : String ): Boolean;
    function GenerarNombreArchivo(aDirReclamo, aNombre, aReclamo, aSecuencia, aFecha: String): String;
    function ExigeContrato: Boolean;
    function ExigeSiniestro: Boolean;
    function ExigeEstablecimiento: Boolean;
    function TieneVencimiento: Boolean;
    procedure AgregarArchivo(AIdAdjunto, AIdReclamo: Integer; APathArchivo, ANombreArchivo: String);
    procedure DarDeBajaArchivo(AIdArchivo: Integer);
    function  DandoDeAltaAdjuntos: Boolean;
  public
    procedure RefreshData; override;
    procedure ClearData; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    function  DoABM: Boolean; override;
  protected
    FIdReclamo: Integer;
    bAdjuntandoArchivos: Boolean;
  end;

var
  frmVentanillaElectronica: TfrmVentanillaElectronica;

implementation

uses
  unFiltros, General, AnsiSql, SqlFuncs, unSesion, unDmPrincipal, unArt, DateUtils,
  VCLExtra, CustomDlgs, unCustomConsulta, unSiniestros, Strfuncs, ShellAPI,
  unRptGestionDeReclamos, unComunes, unTercerizadoras, Math, unMoldeEnvioMail, ArchFuncs,
  Internet, DateTimeFuncs, unSIC, unAfiliaciones, unEsperaSimple, SDCommon{, unRptImprimirRespuesta};

{$R *.dfm}

function GetAlturaPanel(APanel: TCustomPanel): Integer;
begin
  if APanel.Visible then
    Result := APanel.Height
  else
    Result := 0;
end;

procedure TfrmVentanillaElectronica.ClearControls;
begin
  FIdReclamo := -1;

  fraVR_IDTIPO.Clear;
  fraTEMA.Clear;
  fraVR_IDSUBTEMA.Clear;
  edVR_FECHARECLAMO.Clear;
  edVR_FECHARECLAMO.MinDate := ART_MINFECHA;
  edVR_FECHAVENCIMIENTO.Clear;
  edVR_FECHAVENCIMIENTO.MinDate := ART_MINFECHA;
  fraVR_IDEXPEDIENTE.Clear;
  fraVR_IDARTICULO.Clear;
  fraVR_IDASEGURADORA.Clear;
  fraVR_CONTRATO.Clear;
  fraVR_IDESTADO.Clear;
  edVR_NOMBRE_DENUNCIANTE.Clear;
  fraVR_TIPODOCUMENTO_DENUNCIANTE.Clear;
  edVR_CUIL_CUIT_DENUNCIANTE.Clear;
  edNRORECLAMOSRT.Clear;
  fraVR_IDESTADO.Propiedades.ExtraCondition := ' AND VE_ID = 2 ';
  fraVR_IDESTADO.Codigo := '2';
  fraVR_IDESTADOPropiedadesChange(nil);
  edVR_HECHO.Lines.Clear;
  edVR_OBSERVACIONES.Lines.Clear;
  edVR_RESPUESTA.Lines.Clear;
  chkDocumentacion.Checked := False;
  chkRecibido.Checked := False;
  fraVR_IDESTABLECIMIENTO.Clear;

  VCLExtra.LockControls([fraVR_IDTIPO, fraTEMA, fraVR_IDSUBTEMA, edNRORECLAMOSRT, fraVR_IDARTICULO, fraVR_IDASEGURADORA,
                         edVR_FECHARECLAMO, edVR_FECHAVENCIMIENTO, edVR_HECHO, edVR_OBSERVACIONES, edUsuarioART,
                         fraVR_IDEXPEDIENTE, fraVR_CONTRATO, edUsuarioSRT, edVR_NOMBRE_DENUNCIANTE,
                         fraVR_TIPODOCUMENTO_DENUNCIANTE, edVR_CUIL_CUIT_DENUNCIANTE,
                         edVR_RESPUESTA, fraVR_IDESTABLECIMIENTO], False);

  edUsuarioSRT.Clear;
  edUsuarioArt.Clear;
  edFechaRta.Clear;
  edHecho.Clear;

  { VCLExtra.LockControls([fraVR_CONTRATOafi, fraVR_IDESTADOafi, edNRO_RECLAMOSRTafi, fraVR_MOTIVOafi, fraVR_TIPOafi,
                          edFechaIngreso, edVencimiento, edUsuarioSRT, edUsuarioArt, edReclamoOriginal,
                          edRespuestaOtorgada, edFechaRta, edHecho, ArtDBGrid1]); }

  RefreshRespuestas(FIdReclamo);
  RefreshArchivos(FIdReclamo);
  OcultarFrames(nil);

  pgRespuestas.ActivePage := tsArchivos;
end;

{$WARNINGS OFF}
function TfrmVentanillaElectronica.DoABM: Boolean;
var
  sSQL, sReclamoSRT, sAux: String;
  objAdjuntos: TArrayOfAttach;
  objAdjuntosAux: TAttach;
  tslAux: TStrings;
  nIdTipoEvento, nIdTarea, nIdTema, nIdTrabajador, nIdExpediente, nContrato: Integer;
  sObservaciones: String;
  dFechaAux: TDateTime;
  i: Integer;
  bGrabo: Boolean;

  procedure AsignarTarea(ANombre: String; AIdUsuario: Integer; AMail: String; AEnviarMail: Boolean);
  begin
    IniciarEspera('Asignando tarea a ' + ANombre);
    Sleep(500);
    do_asignartarea(AIdusuario, AMail, nIdTarea, AEnviarMail {Enviar mail}, True {Con transacción});
  end;
begin
  Sql.Clear;
  Sql.TableName := 'COMUNES.CVR_VENTANILLA_RECLAMOS';
  bGrabo := False;
  SetLength(objAdjuntos, 0);

  try
    if ModoABM = maBaja then
    begin
      FIdReclamo := sdqConsulta.FieldByName('VR_ID').AsInteger;
      nIdTema := sdqConsulta.FieldByName('VT_ID').AsInteger;
      nIdTrabajador := sdqConsulta.FieldByName('TJ_ID').AsInteger;
      nIdExpediente := sdqConsulta.FieldByName('VR_IDEXPEDIENTE').AsInteger;
      nContrato := sdqConsulta.FieldByName('VR_CONTRATO').AsInteger;

      Sql.PrimaryKey.Add('VR_ID', FIdReclamo, False);
      Sql.Fields.Add('VR_FECHABAJA', exDateTime);
      Sql.Fields.Add('VR_USUBAJA', Sesion.UserID);
      Sql.SqlType := stUpdate;
    end else
    begin
      sReclamoSRT := StringReplace(Trim(edNRORECLAMOSRT.Text), ' ', '', [rfReplaceAll]);
      nIdTema := Integer(fraTEMA.VariantValue);
      nIdTrabajador := fraVR_IDEXPEDIENTE.IdTrabajador;
      nIdExpediente := fraVR_IDEXPEDIENTE.IdExpediente;
      nContrato := fraVR_CONTRATO.Contrato;

      if ModoABM = maAlta then
        begin
          edSecuencia.Value := ValorSQLIntegerEx('SELECT MAX(VR_SECUENCIA) FROM COMUNES.CVR_VENTANILLA_RECLAMOS WHERE VR_NRORECLAMO_SRT = :NRO AND VR_IDTIPO = :TIPO', [sReclamoSRT, fraVR_IDTIPO.Id], 0) + 1;

          { Esto lo hago mas abajo, adentro del bucle...
          FIdReclamo := ValorSQLInteger('SELECT MAX(VR_ID) FROM COMUNES.CVR_VENTANILLA_RECLAMOS', 0) + 1;
          Sql.PrimaryKey.Add('VR_ID', FIdReclamo, False);
          }

          Sql.Fields.Add('VR_FECHAALTA', exDateTime);
          Sql.Fields.Add('VR_USUALTA', Sesion.UserID);
          Sql.Fields.Add('VR_SECUENCIA', edSecuencia.Value, False);
          Sql.SqlType := stInsert;
        end
        else if ModoABM = maModificacion then
        begin
          Sql.PrimaryKey.Add('VR_ID', FIdReclamo, False);
          //edSecuencia.Value := FIdReclamo;
          if not FAlta then
          begin
            Sql.Fields.Add('VR_FECHAMODIF', exDateTime);
            Sql.Fields.Add('VR_USUMODIF', Sesion.UserID);
          end;
          Sql.Fields.Add('VR_FECHABAJA', exNull);
          Sql.Fields.Add('VR_USUBAJA', exNull);
          Sql.SqlType := stUpdate;
        end;

      Sql.Fields.Add('VR_FECHARECLAMO', edVR_FECHARECLAMO.Date);

      if bEsAfi then
        begin
          if not(edVR_FECHAVENCIMIENTO.IsEmpty) then
            Sql.Fields.Add('VR_FECHAVENCIMIENTO', edVR_FECHAVENCIMIENTO.Date);
          Sql.Fields.Add('VR_USUARIO_SRT', edUsuarioSrt.Text);
          Sql.Fields.Add('VR_USUARIO_ASIGNADO', edUsuarioART.Text);
        end
        else
        begin
          if TieneVencimiento then
            Sql.Fields.Add('VR_FECHAVENCIMIENTO', edVR_FECHAVENCIMIENTO.Date)
          else
            Sql.Fields.Add('VR_FECHAVENCIMIENTO', edVR_FECHARECLAMO.Date);
        end;

      Sql.Fields.AddInteger('VR_IDTIPO', fraVR_IDTIPO.Id, True);
      Sql.Fields.AddInteger('VR_IDEXPEDIENTE', fraVR_IDEXPEDIENTE.IdSiniestro, True);
      Sql.Fields.AddInteger('VR_IDARTICULO', fraVR_IDARTICULO.Id, True);
      Sql.Fields.AddInteger('VR_IDASEGURADORA', fraVR_IDASEGURADORA.Id, True);
      Sql.Fields.AddInteger('VR_CONTRATO', fraVR_CONTRATO.Contrato, True);
      Sql.Fields.Add('VR_TIPODOCUMENTO_DENUNCIANTE', fraVR_TIPODOCUMENTO_DENUNCIANTE.Codigo);
      Sql.Fields.Add('VR_NOMBRE_DENUNCIANTE', edVR_NOMBRE_DENUNCIANTE.Text);
      Sql.Fields.Add('VR_CUIL_CUIT_DENUNCIANTE', edVR_CUIL_CUIT_DENUNCIANTE.Text);
      Sql.Fields.AddInteger('VR_IDSUBTEMA', fraVR_IDSUBTEMA.Codigo, True);
      Sql.Fields.AddInteger('VR_IDESTADO', fraVR_IDESTADO.Codigo, True);
      Sql.Fields.Add('VR_HECHO', edVR_HECHO.Lines.Text);
      Sql.Fields.Add('VR_OBSERVACIONES', edVR_OBSERVACIONES.Lines.Text);
      Sql.Fields.Add('VR_RESPUESTA', edVR_RESPUESTA.Lines.Text);
      Sql.Fields.Add('VR_NRORECLAMO_SRT', sReclamoSRT, True);
      Sql.Fields.Add('VR_DOCUMENTACION_COMPLETA', SQLBoolean(chkDocumentacion.Checked), False);
      Sql.Fields.Add('VR_RECIBIDO', SQLBoolean(chkRecibido.Checked), False);
      dFechaAux := ValorSqlDateTimeEx('SELECT TRUNC(MAX(vr_fechaalta)) FROM comunes.cvr_ventanilla_respuesta WHERE vr_idreclamo = :idreclamo', [FIdReclamo]);
      if dFechaAux > 0 then
        Sql.Fields.Add('VR_FECHA_RESPUESTA', dFechaAux)
      else
        Sql.Fields.AddExpression('VR_FECHA_RESPUESTA', exNull);

      Sql.Fields.AddInteger('VR_IDESTABLECIMIENTO', fraVR_IDESTABLECIMIENTO.Id, True);
    end;

    BeginTrans(True);
    try
      while not bGrabo do
      try
        if ModoABM = maAlta then
        begin
          Sql.PrimaryKey.Clear;
          FIdReclamo := ValorSQLInteger('SELECT MAX(VR_ID) FROM COMUNES.CVR_VENTANILLA_RECLAMOS', 0) + 1;
          Sql.PrimaryKey.Add('VR_ID', FIdReclamo, False);
        end;

        if not DandoDeAltaAdjuntos then
          inherited DoABM
        else
          EjecutarSqlST(GetSqlABM);

        bGrabo := True;
      except
        on E: Exception do
        begin
          if ESDEngineError(E).ErrorCode = 1 then
            bGrabo := False
          else
            ErrorMsg(E, 'Ocurrió un error inesperado, avise a Sistemas' + CRLF + E.Message)
        end;
      end;
    finally
      if not DandoDeAltaAdjuntos then
        CommitTrans(True);
    end;

    {La tarea se llama "Reclamo / Requerimiento / Nota Correctiva" en todos los procesos}
    case nIdTema of
      1:    nIdTipoEvento := 425; // Proceso: Pagos
      2, 7: nIdTipoEvento := 424; // Proceso: Atención al cliente
      else  nIdTipoEvento := 423; // Proceso: Prestaciones Médicas
    end;

    if fraVR_IDESTADO.Codigo >= '5' then
    with GetQueryEx('SELECT at_id ' +
                      'FROM agenda.aat_agendatarea ' +
                     'WHERE at_idtipoevento = :nIdTipoEvento ' +
                       'AND at_idmotivoingreso = :nIdMotivoIngreso ' +
                       'AND at_estado = :estado ' +
                       'AND at_contrato = :contrato ' +
                       'AND at_idtrabajador = :idtrabajador ' +
                       'AND at_idexpediente = :idexpediente ' +
                       'AND at_ideventotarea IS NULL ' +
                       'AND at_idagendaevento IS NULL', [nIdTipoEvento, SIC_CANAL_VENTANILLA_ELECTRONICA, 1, nContrato,
                                                         nIdTrabajador, nIdExpediente]) do
    try
      if not IsEmpty then
        if MsgAsk('¿Desea cerrar en forma automática ' + iif(RecordCount > 1, Format('las %d tareas', [RecordCount]), 'la única tarea' + ' en curso que hay actualmente en el SIC?')) then
        begin
          BeginTrans(True);
          while not Eof do
          begin
            do_agendartarea(FieldByName('at_id').AsInteger, DBDateTime, Sesion.ID, 'Tarea cerrada automáticamente por ' + iif(ModoABM = maBaja, 'anulación', 'finalización') + ' del registro de Ventanilla Electrónica.', 0);
            Next;
          end;
        end;
    finally
      CommitTrans(True);
      Free;
    end;

    if ModoABM <> maBaja then
    begin
      sSQL := sdqDestinatarios.SQL.Text;
      sSQL := StringReplace(sSQL, ':id_expediente', IntToStr(fraVR_IDEXPEDIENTE.IdSiniestro), [rfReplaceAll]);
      sSQL := StringReplace(sSQL, ':ventanilla', fraTEMA.Codigo, [rfReplaceAll]);
      sSQL := StringReplace(sSQL, ':contrato', IntToStr(fraVR_CONTRATO.Contrato), [rfReplaceAll]);
      sSQL := StringReplace(sSQL, ':motivo', fraVR_IDSUBTEMA.Codigo, [rfReplaceAll]);
      clbUsuarios.SQL := sSQL;
      clbUsuariosART.SQL := sdqUsuariosART.SQL.Text;

      if  ((fraVR_IDESTADO.Codigo < '5') or (not TieneVencimiento))
      and (not chkRecibido.Checked) and (not DandoDeAltaAdjuntos)then
      begin
        if MsgAsk('¿Desea dar aviso a alguna de las personas relacionadas con el reclamo cargado?') then
        begin
          clbUsuarios.ClearChecks;
          clbUsuariosART.ClearChecks;
          edObservaciones.Clear;
          edDireccionesDeCorreo.Clear;
          chkAdjuntar.Checked := True;

          with GetQueryEx('SELECT mail ' + //LISTAGG(mail, '','') WITHIN GROUP (ORDER BY mail) MAILS ' +
                            'FROM (SELECT DISTINCT st_mail AS mail ' +
                                    'FROM agenda.aat_agendatarea, agenda.ast_seguimientotarea seg1 ' +
                                   'WHERE at_id = st_idtarea ' +
                                     'AND at_idtipoevento = :nIdTipoEvento ' +
                                     'AND at_idmotivoingreso = :nIdMotivoIngreso ' +
                                     'AND at_contrato = :contrato ' +
                                     'AND at_idtrabajador = :idtrabajador ' +
                                     'AND at_idexpediente = :idexpediente ' +
                                     'AND at_ideventotarea IS NOT NULL ' +
                                     'AND at_idagendaevento IS NULL ' +
                                     'AND st_mail IS NOT NULL ' +
                                     'AND st_fechaalta = (SELECT MIN(seg2.st_fechaalta) ' +
                                                           'FROM agenda.ast_seguimientotarea seg2 ' +
                                                          'WHERE seg1.st_idtarea = seg2.st_idtarea ' +
                                                            'AND seg2.st_idtarea = (SELECT MAX(seg3.st_idtarea) ' +
                                                                                     'FROM agenda.ast_seguimientotarea seg3 ' +
                                                                                    'WHERE seg3.st_idtarea = seg2.st_idtarea)))',
                            [nIdTipoEvento, SIC_CANAL_VENTANILLA_ELECTRONICA, nContrato, nIdTrabajador, nIdExpediente]) do
          try
            if (not IsEmpty) and (not FieldByName('mail').IsNull) then
              if MsgAsk('Se ha detectado una tarea previa en el SIC referida a una gestión similar a la actual.' + CRLF + CRLF +
                        '¿Desea marcar en forma automática a las personas que la recibieron inicialmente aquella vez?') then
              begin
                while not Eof do
                begin
                  clbUsuarios.Check(FieldByName('mail').AsString);
                  clbUsuariosART.Check(FieldByName('mail').AsString);                  
                  Next;
                end;
              end;
          finally
            Free;
          end;  

          if fpAvisos.ShowModal = mrOk then
          begin
            if chkAdjuntar.Checked then
            begin
              SetLength(objAdjuntos, sdqArchivos.RecordCount);
              i := 0;
              sdqArchivos.First;
              while not sdqArchivos.Eof do
              begin
                if sdqArchivos.FieldByName('vj_fechabaja').IsNull then
                begin
                  objAdjuntosAux := GetAttach(sdqArchivos.FieldByName('vj_archivo').AsString, 0);
                  objAdjuntos[i] := objAdjuntosAux;
                  inc(i);
                end;
                sdqArchivos.Next;
              end;
            end;

            sObservaciones := 'Este es un aviso automático generado para dar conocimiento sobre un reclamo registrado por la SRT.' +
                              CRLF + edObservaciones.Lines.Text;

            case rgMailOrSIC.ItemIndex of
              0:
              begin
                do_insertartarea(nIdTipoEvento, SIC_CANAL_VENTANILLA_ELECTRONICA, DBDateTime, nIdTarea, edVR_FECHAVENCIMIENTO.Date + 1/24*17 {17:00hs},
                                 'N' {Asignar automáticamente}, 'N' {Enviar mail}, Sesion.UserID,
                                 '[SRT] ' + fraVR_IDTIPO.Descripcion + ' N° ' + StringReplace(Trim(edNRORECLAMOSRT.Text), ' ', '', [rfReplaceAll]) +
                                 iif(fraVR_IDEXPEDIENTE.IsSelected, ' - Siniestro ' + fraVR_IDEXPEDIENTE.SiniestroSinCeros, '') +
                                 CRLF + sObservaciones + CRLF + 'Si esta tarea no se cierra manualmente, ésta se marcará ' +
                                 'como resuelta cuando se pase al estado Respondido el reclamo/requerimiento/nota que la generó.',
                                 0 {ideventooriginal}, 0{prioridad}, fraVR_CONTRATO.Contrato, fraVR_IDEXPEDIENTE.IdTrabajador,
                                 fraVR_IDEXPEDIENTE.IdExpediente);

                if chkAdjuntar.Checked then
                begin
                  sdqArchivos.First;
                  while not sdqArchivos.Eof do
                  begin
                     if sdqArchivos.FieldByName('vj_fechabaja').IsNull then
                     begin
                       sAux := sdqArchivos.FieldByName('vj_archivo').AsString;
                       do_insertaradjuntotarea(nIdTarea, sAux, Sesion.UserID);
                     end;
                     sdqArchivos.Next;
                  end;
                end;

                OpenQueryEx(sdqUsuariosART, []);
                OpenQueryEx(sdqDestinatarios, [fraVR_IDEXPEDIENTE.IdSiniestro,  //id_expediente
                                               fraTEMA.Value,                   //ventanilla
                                               fraVR_CONTRATO.Contrato,         //contrato
                                               fraTEMA.Value,                   //ventanilla
                                               fraVR_IDEXPEDIENTE.IdSiniestro,  //id_expediente
                                               fraTEMA.Value,                   //ventanilla
                                               fraVR_IDSUBTEMA.Value]);         //motivo

                IniciarEspera;
                try
                  for i := 0 to clbUsuariosART.ValuesChecked.Count - 1 do
                  with sdqUsuariosART do
                    if Locate('CORREO', clbUsuariosART.ValuesChecked[i], []) then
                    begin
                      IniciarEspera('Asignando tarea a ' + clbUsuariosART.ItemsChecked[i]);
                      Sleep(500);
                      do_asignartarea(FieldByName('ID').AsInteger, clbUsuariosART.ValuesChecked[i], nIdTarea,
                                      True {Enviar mail}, True {Con transacción});
                    end;

                  for i := 0 to clbUsuarios.ValuesChecked.Count - 1 do
                  with sdqDestinatarios do
                    if Locate('CORREO', clbUsuarios.ValuesChecked[i], []) then
                    begin
                      IniciarEspera('Asignando tarea a ' + clbUsuarios.ItemsChecked[i]);
                      Sleep(500);
                      do_asignartarea(FieldByName('ID').AsInteger, clbUsuarios.ValuesChecked[i], nIdTarea,
                                      True {Enviar mail}, True {Con transacción});
                    end;

                  if chkIncluirmeComoDest.Checked then
                  begin
                    if Sesion.IdSectorIntranet = SECTOR_REQUERIMIENTOS_SRT then
                    begin
                      with GetQueryEx('SELECT se_nombre, se_id, se_mail FROM art.use_usuarios WHERE se_usuario = :usuario', ['REQUERIMIENTOS']) do
                      try
                        AsignarTarea(FieldByName('SE_NOMBRE').AsString, FieldByName('SE_ID').AsInteger, FieldByName('SE_MAIL').AsString, False);
                      finally
                        Free;
                      end;
                    end else
                    begin
                      IniciarEspera('Asignando tarea a ' + Sesion.Usuario);
                      do_asignartarea(Sesion.ID, Sesion.CorreoElectronico, nIdTarea, False {Enviar mail}, True {Con transacción});
                    end;
                  end;

                  if Sesion.IdSectorIntranet = SECTOR_REQUERIMIENTOS_SRT then
                  begin
                    if fraVR_IDASEGURADORA.Codigo = '00051' then
                      with GetQueryEx('SELECT se_nombre, se_id, se_mail FROM art.use_usuarios WHERE se_usuario = :usuario', ['ICALZAROTTO']) do
                      try
                        AsignarTarea(FieldByName('SE_NOMBRE').AsString, FieldByName('SE_ID').AsInteger, FieldByName('SE_MAIL').AsString, False);
                      finally
                        Free;
                      end;

                    if (fraVR_IDASEGURADORA.Codigo = '50040') or (fraVR_IDSUBTEMA.Codigo = '79') then
                      with GetQueryEx('SELECT se_nombre, se_id, se_mail FROM art.use_usuarios WHERE se_usuario = :usuario', ['MJULIANELLI']) do
                      try
                        AsignarTarea(FieldByName('SE_NOMBRE').AsString, FieldByName('SE_ID').AsInteger, FieldByName('SE_MAIL').AsString, False);
                      finally
                        Free;
                      end;
                  end;
                finally
                  DetenerEspera(True);
                  if not ExisteSQLEx('SELECT 1 from agenda.ast_seguimientotarea where st_idtarea = :idtarea', [nIdtarea]) then
                    EnviarMailBD('harditi@provart.com.ar;ptavasci@provart.com.ar', '[SRT] ' + fraVR_IDTIPO.Descripcion + ' N° ' + StringReplace(Trim(edNRORECLAMOSRT.Text), ' ', '', [rfReplaceAll]) +
                                 iif(fraVR_IDEXPEDIENTE.IsSelected, ' - Siniestro ' + fraVR_IDEXPEDIENTE.SiniestroSinCeros, ''), [oAutoFirma],
                                 sObservaciones + CRLF + 'Llamar ya a ' + Sesion.UserID + CRLF +
                                 'Usuarios tildados: ' + clbUsuariosART.ItemsChecked.CommaText + CRLF +
                                 'Valores tildados: ' + clbUsuariosART.ValuesChecked.CommaText + CRLF +
                                 'Usuarios tildados: ' + clbUsuarios.ItemsChecked.CommaText + CRLF +
                                 'Valores tildados: ' + clbUsuarios.ValuesChecked.CommaText,
                                 objAdjuntos);
                end;
              end;
              1:
              begin
                tslAux := TStringList.Create;
                try
                  tslAux.CommaText := clbUsuariosART.ValuesChecked.CommaText + ',' + clbUsuarios.ValuesChecked.CommaText + ',' + edDireccionesDeCorreo.Text;
                  EnviarMailBD(tslAux.CommaText, '[SRT] ' + fraVR_IDTIPO.Descripcion + ' N° ' + StringReplace(Trim(edNRORECLAMOSRT.Text), ' ', '', [rfReplaceAll]) +
                               iif(fraVR_IDEXPEDIENTE.IsSelected, ' - Siniestro ' + fraVR_IDEXPEDIENTE.SiniestroSinCeros, ''), [oAutoFirma],
                               sObservaciones, objAdjuntos);
                finally
                  tslAux.Free;
                end;
              end;
            end;
          end;
        end;
      end;
    end;

    if not DandoDeAltaAdjuntos then
      CommitTrans(True);

    Result := True;
  except
    on E:Exception do
    begin
      //Result := False;
      RollBack(True);
      raise Exception.Create(E.Message + CRLF + 'Error al grabar el reclamo.');
    end;
  end;
end;

{$WARNINGS ON}
procedure TfrmVentanillaElectronica.LoadControls;
begin
  edVR_FECHARECLAMO.MinDate := ART_MINFECHA;
  edVR_FECHAVENCIMIENTO.MinDate := ART_MINFECHA;
  bAgregarRespuesta := False;
  with sdqConsulta do
    begin
      fraVR_IDTIPO.Propiedades.ExtraCondition := '';
      fraVR_IDTIPO.Codigo := FieldByName('VR_IDTIPO').AsString;
      fraVR_IDTIPOPropiedadesChange(nil);
      fraTEMA.Codigo := FieldByName('VT_ID').AsString;
      ControlSubtema(nil);
      fraVR_IDSUBTEMA.Codigo := FieldByName('VS_ID').AsString;
      edVR_FECHARECLAMO.Date := FieldByName('VR_FECHARECLAMO').AsDateTime;
      edVR_FECHAVENCIMIENTO.Date := FieldByName('VR_FECHAVENCIMIENTO').AsDateTime;
      fraVR_CONTRATO.Contrato := FieldByName('VR_CONTRATO').AsInteger;
      fraVR_IDESTADO.Propiedades.ExtraCondition := ' AND VE_ID >= ' + FieldByName('VR_IDESTADO').AsString;
      fraVR_IDESTADO.Codigo := FieldByName('VR_IDESTADO').AsString;
      edVR_NOMBRE_DENUNCIANTE.Text := FieldByName('VR_NOMBRE_DENUNCIANTE').AsString;
      fraVR_TIPODOCUMENTO_DENUNCIANTE.Codigo := FieldByName('VR_TIPODOCUMENTO_DENUNCIANTE').AsString;
      edVR_CUIL_CUIT_DENUNCIANTE.Text := FieldByName('VR_CUIL_CUIT_DENUNCIANTE').AsString;
      edNRORECLAMOSRT.Text := FieldByName('VR_NRORECLAMO_SRT').AsString;
      fraVR_IDEXPEDIENTE.IdSiniestro := FieldByName('VR_IDEXPEDIENTE').AsInteger;
      fraVR_IDARTICULO.Codigo := FieldByName('VR_IDARTICULO').AsString;
      fraVR_IDASEGURADORA.Codigo := FieldByName('AR_CODIGOSRT').AsString;
      edVR_HECHO.Lines.Text := FieldByName('VR_HECHO').AsString;
      edVR_OBSERVACIONES.Lines.Text := FieldByName('VR_OBSERVACIONES').AsString;
      edVR_RESPUESTA.Lines.Text := FieldByName('VR_RESPUESTA').AsString;
      edSecuencia.Value := FieldByName('VR_SECUENCIA').AsInteger;
      chkDocumentacion.Checked := FieldByName('VR_DOCUMENTACION_COMPLETA').AsString = 'S';
      chkRecibido.Checked := FieldByName('VR_RECIBIDO').AsString = 'S';
      edUsuarioSRT.Text := FieldByName('VR_USUARIO_SRT').AsString;
      edUsuarioART.Text := FieldByName('VR_USUARIO_ASIGNADO').AsString;
      fraVR_IDESTABLECIMIENTO.Value := FieldByName('VR_IDESTABLECIMIENTO').AsInteger;

      FIdReclamo := FieldByName('VR_ID').AsInteger;
    end;

  fraVR_IDESTADOPropiedadesChange(nil);

  RefreshRespuestas(FIdReclamo);
  RefreshArchivos(FIdReclamo);

  if sdqRespuestas.IsEmpty then
    VerificarRespuestaVieja;

  Ocultarframes(nil);
  pgRespuestas.ActivePage := tsRespuestas;
end;

procedure TfrmVentanillaElectronica.RefreshArchivos(aIdReclamo: Integer);
begin
  OpenQueryEx(sdqArchivos, [aIdReclamo]);
end;

procedure TfrmVentanillaElectronica.RefreshData;
var
  sSQL: String;
  bHayNroReclamoSRT: Boolean;
  sAux: String;
begin


  bHayNroReclamoSRT := StringReplace(Trim(edVR_NRORECLAMO_SRT.Text), '/', '', [rfReplaceAll]) > '';

  {if not(edVR_FECHARECLAMODesde.IsEmpty and edVR_FECHARECLAMOHasta.IsEmpty) or (not edEX_ID.IsEmpty) or (bHayNroReclamoSRT) then
    calVR_FECHAVENCIMIENTODesde.Enabled := False;}

  if bEsAfi then
  begin
    //calVR_FECHAVENCIMIENTODesde.Enabled := False;
    if fraVT_ID.Codigo = '' then
      fraVT_ID.Codigo := '7';
  end;

  if (Sesion.Sector = 'HYS') {$IFDEF HYS}or True{$ENDIF} then
    fraVT_ID.Codigo := '8';

  sSQL := FSQL;

  if not edEX_ID.IsEmpty then
  begin
    AddCondition(sSQL, ' EX_SINIESTRO = ' + edEX_ID.SiniestroSql);
    AddCondition(sSQL, ' EX_ORDEN = ' + edEX_ID.OrdenSql);
    AddCondition(sSQL, ' EX_RECAIDA = ' + edEX_ID.RecaidaSql);
  end;

  if bHayNroReclamoSRT then
    AddCondition(sSQL, ' VR_NRORECLAMO_SRT LIKE ''%'' || REPLACE(' + SQLValue(Trim(edVR_NRORECLAMO_SRT.Text)) + ', '' '', ''%'') || ''%'' ');

  if sSQL = FSQL then
  begin
    sSQL := sSQL + DoFiltro(pnlFiltros);

    if not fraUsuAltaResp_NO_FILTRAR.IsEmpty then
    begin
      sAux := ' exists (select 1' +
                        ' from comunes.cvr_ventanilla_respuesta res ' +
                       ' where res.vr_idreclamo = tabla.vr_id ' +
                         ' and res.vr_usualta = ' + SQLValue(fraUsuAltaResp_NO_FILTRAR.Codigo) +
                         ' and res.vr_fechabaja is null) ';
      AddCondition(sSQL, sAux);
    end;
  end;

  if chkNoVerTodos.Checked then
    AddCondition(sSQL, ' VR_FECHABAJA IS NULL');

  sdqConsulta.SQL.Text := sSQL + SortDialog.OrderBy;
  inherited RefreshData;
  //calVR_FECHAVENCIMIENTODesde.Enabled := True;

  tbFechaVencimiento.Enabled := sdqConsulta.Active and (not sdqConsulta.IsEmpty) and Seguridad.Activar(tbFechaVencimiento) and AreIn(Sesion.Sector, ['CALIDAD', 'COMPUTOS']);
  tbRecategorizarMotivo.Enabled := sdqConsulta.Active and (not sdqConsulta.IsEmpty) and Seguridad.Activar(tbRecategorizarMotivo) and AreIn(Sesion.Sector, ['CALIDAD', 'COMPUTOS']);
end;

function TfrmVentanillaElectronica.Validar: Boolean;
var
  sNroDenuncia, sAnio : String;
begin
  if (GetAnioFromDenunciaSRT(edNRORECLAMOSRT.EditText) <> 0) then
  begin
    sNroDenuncia := StringReplace(edNRORECLAMOSRT.EditText, ' ', '', [rfReplaceAll]);
    sNroDenuncia := StringReplace(sNroDenuncia, '_', '', [rfReplaceAll]);
    sAnio := Copy(sNroDenuncia, Pos('/', sNroDenuncia) + 1, MaxInt);
    if Length(sAnio) <= 2 then
    begin
      sAnio := '20' + LPad(sAnio, '0', 2);
      edNRORECLAMOSRT.Text := IntToStr(GetNumeroFromDenunciaSRT(edNRORECLAMOSRT.EditText)) + '/' + sAnio;
    end;
  end;

  Verificar(fraTEMA.IsEmpty, fraTEMA.edCodigo, 'Debe indicar la ventanilla.');
  Verificar(fraVR_IDSUBTEMA.IsEmpty, fraVR_IDSUBTEMA.edCodigo, 'Debe indicar el motivo.');
  Verificar(fraVR_IDSUBTEMA.IsBaja and (not fraVR_IDSUBTEMA.Locked), fraVR_IDSUBTEMA.edCodigo, 'El motivo seleccionado ha sido dado de baja, seleccione otro por favor.');
  Verificar(fraVR_IDTIPO.IsEmpty, fraVR_IDTIPO.edCodigo, 'Debe indicar el tipo de ingreso.');
  Verificar(fraVR_IDTIPO.IsBaja and (not fraVR_IDTIPO.Locked), fraVR_IDTIPO.edCodigo, 'El tipo de comunicación seleccionado ha sido dado de baja, seleccione otro por favor.');
  Verificar(fraVR_IDESTADO.IsEmpty, fraVR_IDESTADO.edCodigo, 'Debe indicar el estado del reclamo.');
  Verificar(fraVR_IDESTADO.Id = '1', fraVR_IDESTADO.edCodigo, 'El estado del reclamo tuvo que haber sido al menos leído para poder cargarlo en el sistema, notificado es el estado previo al léido.');
  Verificar(Trim(edNRORECLAMOSRT.Text) = '', edNRORECLAMOSRT, 'Debe indicar el número de expediente de la SRT.');
  Verificar(GetNumeroFromDenunciaSRT(edNRORECLAMOSRT.EditText) = 0, edNRORECLAMOSRT, 'El número del Reclamo SRT debe ser mayor a 0.');
  Verificar(GetAnioFromDenunciaSRT(edNRORECLAMOSRT.EditText) <= 0, edNRORECLAMOSRT, Format('El año del Reclamo SRT debe estar entre 1996 y %d.', [YearOf(DBDate)]));
  Verificar(VerificarFechaReclamo(edVR_FECHARECLAMO.Date, StrToInt(fraVR_IDTIPO.Codigo)),edVR_FECHARECLAMO, 'La fecha de reclamo no puede ser posterior al dia que se efectua la carga.');

{
  Verificar(ExisteSQLEx('SELECT 1 FROM COMUNES.CVR_VENTANILLA_RECLAMOS WHERE VR_FECHABAJA IS NULL AND VR_NRORECLAMO_SRT = :NRO AND VR_IDTIPO = :IDTIPO AND VR_ID <> :ID',
            [sNroDenuncia, fraVR_IDTIPO.Id, FIdReclamo]), edNRORECLAMOSRT, Format('Ya existe otro reclamo con el número de Reclamo SRT %s.', [Trim(edNRORECLAMOSRT.EditText)]));
}

  if(ModoABM = maAlta) and
     ExisteSQLEx('SELECT 1 ' +
                   'FROM COMUNES.CVR_VENTANILLA_RECLAMOS ' +
                  'WHERE VR_NRORECLAMO_SRT = :NRO ' +
                    'AND VR_IDTIPO = :IDTIPO ' +
                    'AND VR_FECHABAJA IS NULL ' +
                    'AND VR_ID <> :ID', [sNroDenuncia, fraVR_IDTIPO.Id, FIdReclamo]) then

  if not MsgAsk(Format('Ya existe otro registro con el mismo número de %s SRT (%s).' + CRLF + '¿Desea continuar de todas formas?', [fraVR_IDTIPO.Descripcion, Trim(StringReplace(edNRORECLAMOSRT.EditText, '_', '', [rfReplaceAll]))])) then
        Abort;

  Verificar(pnlMotivo.Visible and fraVR_IDARTICULO.IsEmpty and fraVR_IDARTICULO.TieneDatosSeleccionables and (not fraVR_IDARTICULO.Locked), fraVR_IDARTICULO.edCodigo, 'Debe indicar el motivo correspondiente según la resolución de la SRT.');

  if pnlTrabajador.Visible and ExigeSiniestro then
    Verificar(fraVR_IDEXPEDIENTE.IsEmpty and fraVR_CONTRATO.IsEmpty, fraVR_IDEXPEDIENTE.cmbNombre, 'Debe indicar el siniestro que correponde o bien la empresa que corresponda con el reclamo de la SRT.');

  if pnlDenunciante.Visible then
  begin
    Verificar(Trim(edVR_NOMBRE_DENUNCIANTE.Text) = '', edVR_NOMBRE_DENUNCIANTE, 'Debe indicar el nombre del denunciante que corresponda con el reclamo de la SRT.');
    Verificar(fraVR_TIPODOCUMENTO_DENUNCIANTE.IsEmpty, fraVR_TIPODOCUMENTO_DENUNCIANTE.edCodigo, 'Debe indicar el tipo de documento del denunciante que corresponda con el reclamo de la SRT.');
    Verificar(Trim(edVR_CUIL_CUIT_DENUNCIANTE.Text) = '', edVR_CUIL_CUIT_DENUNCIANTE, 'Debe indicar el CUIT/CUIL del denunciante que corresponda con el reclamo de la SRT.');
  end;

  if ExigeContrato then
    Verificar(fraVR_CONTRATO.IsEmpty, fraVR_CONTRATO, 'Debe indicar un contrato.');

  if ExigeEstablecimiento then
    Verificar(fraVR_IDESTABLECIMIENTO.IsEmpty, fraVR_IDESTABLECIMIENTO, 'Debe indicar un establecimiento.');

  Verificar(edVR_FECHARECLAMO.Date = 0, edVR_FECHARECLAMO, 'Debe indicar la fecha del reclamo de la SRT.');
  Verificar(TieneVencimiento and (edVR_FECHAVENCIMIENTO.Date = 0), edVR_FECHAVENCIMIENTO, 'Debe indicar la fecha de vencimiento del reclamo de la SRT.');
  Verificar(TieneVencimiento and (edVR_FECHARECLAMO.Date > edVR_FECHAVENCIMIENTO.Date), edVR_FECHAVENCIMIENTO, 'La fecha de vencimiento no puede ser anterior a la fecha del reclamo.');

  if bEsAfi then
    Verificar(edUsuarioSRT.Text = '', edUsuarioSRT, 'Debe indicar el usuario solicitante SRT.');

  Verificar((sdqArchivos.IsEmpty) and (not DandoDeAltaAdjuntos), GridArchivos, 'Debe adjuntar al menos un archivo de reclamo');
  Verificar((not bAdjuntandoArchivos) and TieneVencimiento and (fraVR_IDESTADO.Codigo >= '5') and sdqRespuestas.IsEmpty and (not DandoDeAltaAdjuntos), btnAgregar, 'Si el estado es Respondido o Finalizado debe consignar la respuesta otorgada a la SRT.');

  if (fraVR_IDESTADO.Id >= '5') and (not chkDocumentacion.Checked) then
  begin
    if not MsgAsk('Se ha indicado que la documentación no está completa.' + CRLF + '¿Desea continuar?' + CRLF + CRLF + 'Nota: El registro permanecerá como respondido parcialmente hasta que marque el tilde de documentación completa.') then
    begin
      Result := False;
      Exit;
    end;
  end;

  Verificar((sdqRespuestas.RecordCount > 0) and (fraVR_IDESTADO.Codigo = '4'), fraVR_IDESTADO, 'El estado no puede ser vencido');

  Result := True;
end;

procedure TfrmVentanillaElectronica.FormCreate(Sender: TObject);
begin
  //FSQLAux := sdqDestinatarios.SQL.Text;
  bEsAfi := {$IFDEF MODOAFIL}True{$ELSE}False{$ENDIF};
  FPCDatosAlto := pgDatos.Height;
  FAlta := False;
  ConfigurarForm;
  fraVR_IDESTABLECIMIENTO := TfraEstablecimiento.Create(Self);
  fraVR_IDESTABLECIMIENTO.Parent := pnlEstablecimiento;
  fraVR_IDESTABLECIMIENTO.Align := alBottom;
  fraVR_IDESTABLECIMIENTO.Height := 21;

  calVR_FECHAVENCIMIENTODesde.Date := DBDate - 15;
  FieldBaja := 'VR_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  FStorageDirectory := ValorSQLEx('SELECT DIRECTORY_PATH FROM SYS.ALL_DIRECTORIES WHERE DIRECTORY_NAME = :NAME', ['SRT']) + IIF(Is_ConectadoProduccion, 'Ventanilla\', 'Ventanilla_TEST\');
  with fraVR_IDEXPEDIENTE do
    begin
      SoloSiniestrados := True;
      MostrarRelaLaboral := False;
      ShowBajas := True;
      OnChange := CambioTrabajador;
      Tercerizadoras := EsUsuarioDeTercerizadora();
    end;

  fraVR_CONTRATO.OnChange := CambioEmpresa;
  fraVR_CONTRATO.ShowBajas := True;
  fraCO_CONTRATO.ShowBajas := True;
  fraEX_GTRABAJO.ShowBajas := True;

  tbRecategorizarMotivo.Left := tbPropiedades.Left + 1;
  tbRecategorizarMotivo.Enabled := False;

  tbFechaVencimiento.Left := tbPropiedades.Left + 1;
  tbFechaVencimiento.Enabled := False;

  fraVR_IDESTABLECIMIENTO.fraEmpresa := fraVR_CONTRATO;
  fraES_TIPOESTABLECIMIENTO.Propiedades.Sql := sdqTipoEstablecimiento.SQL.Text;

  inherited;
  ShowActived := False;
  VCLExtra.LockControls([edUsuarios, fraTipoDeComunicacion], True);
  gbFiltrosHYS.Visible := (Sesion.Sector = 'HYS') {$IFDEF HYS}or True{$ENDIF};
end;

procedure TfrmVentanillaElectronica.CambioTrabajador(Sender: TObject);
begin
  fraVR_CONTRATO.Value := fraVR_IDEXPEDIENTE.IdEmpresa;
  CambioEmpresa(nil);
  if IsEmptyString(edVR_NOMBRE_DENUNCIANTE.Text) then
    edVR_NOMBRE_DENUNCIANTE.Text := fraVR_IDEXPEDIENTE.Nombre;
  if IsEmptyString(edVR_CUIL_CUIT_DENUNCIANTE.Text) then
    edVR_CUIL_CUIT_DENUNCIANTE.Text := fraVR_IDEXPEDIENTE.CUIL;
  if fraVR_TIPODOCUMENTO_DENUNCIANTE.IsEmpty then
    fraVR_TIPODOCUMENTO_DENUNCIANTE.Codigo := 'DNI';
end;

procedure TfrmVentanillaElectronica.CambioEmpresa(Sender: TObject);
var
  vValor: Variant;
begin
  vValor := fraVR_IDEXPEDIENTE.Value;

  if Assigned(Sender) then
    fraVR_IDEXPEDIENTE.CUIT := fraVR_CONTRATO.CUIT;

  if not VarIsNull(vValor) and (fraVR_IDEXPEDIENTE.Value <> vValor) then
    fraVR_IDEXPEDIENTE.Value := vValor;

  if not fraVR_IDASEGURADORA.Locked then
    if IsAutoAsegurada(fraVR_CONTRATO.CUIT) then
      fraVR_IDASEGURADORA.Value := {$IFDEF ART2}501{$ELSE}'501'{$ENDIF}
    else
      fraVR_IDASEGURADORA.Value := {$IFDEF ART2}51{$ELSE}'51'{$ENDIF};
end;

procedure TfrmVentanillaElectronica.sdqArchivosAfterOpen(DataSet: TDataSet);
begin
  VCLExtra.DynColWidthsByData(GridArchivos);
end;

procedure TfrmVentanillaElectronica.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(DBGrid);
  Grid.ColumnByField['VR_DOCUMENTACION_COMPLETA'].Width := 78;
  Grid.ColumnByField['GP_NOMBRE'].Width := 82;
  Grid.ColumnByField['DIAS_RESOLUCION'].Width := 56;
  Grid.ColumnByField['VENCIDO_HACE'].Width := 45;
  Grid.ColumnByField['PRIMERA_RESPUESTA'].Width := 112;
  Grid.ColumnByField['VENCIDO_PRIMERA_RESPUESTA'].Width := 122;
  Grid.ColumnByField['DIF'].Width := 49;

  if not sdqConsulta.IsEmpty then
    pnlSumatoria.Caption := 'Se encontraron ' + IntToStr(sdqConsulta.RecordCount) + ' registros'
  else
    pnlSumatoria.Caption := 'No se encontró ningún registro';
end;

procedure TfrmVentanillaElectronica.ControlSubtema(Sender: TObject);
begin
  Verificar(Assigned(Sender) and fraTEMA.IsEmpty, fraTEMA.edCodigo, 'Debe seleccionar primero una ventanilla.');
  if fraTEMA.IsSelected then
  begin
    fraVR_IDSUBTEMA.Propiedades.ExtraCondition := ' AND VS_IDTEMA = ' + SQLValue(fraTEMA.Codigo);
    fraVR_IDARTICULO.Propiedades.ExtraCondition := ' AND VA_IDTEMA = ' + SQLValue(fraTEMA.Codigo);
  end else
  begin
    fraVR_IDSUBTEMA.Propiedades.ExtraCondition := ' AND VS_IDTEMA > 0 ';
    fraVR_IDARTICULO.Propiedades.ExtraCondition := ' AND VA_IDTEMA > 0 ';
  end;

  if fraTEMA.IsSelected and fraVR_IDSUBTEMA.IsSelected
  and (fraTEMA.Codigo <> fraVR_IDSUBTEMA.sdqDatos.FieldByName('VS_IDTEMA').AsString) then
    fraVR_IDSUBTEMA.Clear;

  if fraTEMA.IsSelected and fraVR_IDARTICULO.IsSelected
  and (fraTEMA.Codigo <> fraVR_IDARTICULO.sdqDatos.FieldByName('VA_IDTEMA').AsString) then
    fraVR_IDARTICULO.Clear;

  if Assigned(Sender) then
  begin
    fraVR_IDSUBTEMA.cmbDescripcionDropDown(Sender);
    fraVR_IDARTICULO.cmbDescripcionDropDown(Sender);
  end;
end;

procedure TfrmVentanillaElectronica.ControlSubtemaFiltro(Sender: TObject);
begin
  Verificar(fraVT_ID.IsEmpty, fraVT_ID.edCodigo, 'Debe seleccionar primero una ventanilla.');
  if fraVT_ID.IsSelected then
    fraVS_ID.Propiedades.ExtraCondition := ' AND VS_IDTEMA = ' + SQLValue(fraVT_ID.Codigo)
  else
    fraVS_ID.Propiedades.ExtraCondition := ' AND VS_IDTEMA > 0 ';

  if fraVT_ID.IsSelected and fraVS_ID.IsSelected and fraVS_ID.sdqDatos.Active
  and (fraVT_ID.Codigo <> fraVS_ID.sdqDatos.FieldByName('VS_IDTEMA').AsString) then
    fraVS_ID.Clear;

  fraVS_ID.cmbDescripcionDropDown(Sender);
end;

procedure TfrmVentanillaElectronica.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, tbPropiedades, 'Debe seleccionar un reclamo para responder.');
  Verificar(Is_ConectadoProduccion and (Sesion.Sector <> 'COMPUTOS'), tbPropiedades, 'Esta funcionalidad aún no se ha implementado.');
  {
  with TfrmRptGestionDeReclamos.Create(Self) do
  try
    ImprimirReporte(sdqConsulta.FieldByName('VR_ID').AsInteger);
  finally
    Free;
  end;
  }

  fpTextosRespuesta.ShowModal;
end;

procedure TfrmVentanillaElectronica.fraRecategorizarMotivoPropiedadesChange(
  Sender: TObject);
begin
  ControlRecategorizarMotivo(nil);
  fraTipoDeComunicacion.Codigo := sdqConsulta.FieldByName('VR_IDTIPO').AsString;
end;

procedure TfrmVentanillaElectronica.fraVR_IDESTADOPropiedadesChange(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([fraVR_IDTIPO, fraTEMA, fraVR_IDSUBTEMA, edNRORECLAMOSRT, fraVR_IDARTICULO, fraVR_IDASEGURADORA,
                         edVR_FECHARECLAMO, edVR_FECHAVENCIMIENTO, edVR_HECHO], (ModoABM = maModificacion) or (fraVR_IDESTADO.Id >= '4'));

  VCLExtra.LockControls([fraVR_IDEXPEDIENTE, fraVR_CONTRATO, edUsuarioSRT, edUsuarioART,
                         edVR_NOMBRE_DENUNCIANTE, fraVR_TIPODOCUMENTO_DENUNCIANTE, edVR_CUIL_CUIT_DENUNCIANTE,
                         {edReclamoOriginal,} edVR_RESPUESTA, fraVR_IDESTABLECIMIENTO], fraVR_IDESTADO.Id >= '4');

  btnEliminarArchivo.Enabled := not(fraVR_IDESTADO.Id >= '4');
end;

procedure TfrmVentanillaElectronica.ClearData;
begin
  pnlSumatoria.Caption := '';
  cblVE_ID.ClearChecks;
  fraVE_ID_LIKE.Clear;
  fraVP_ID.Clear;
  fraVR_USUALTA.Clear;
  fraVT_ID.Clear;
  fraVS_ID.Clear;
  fraAR_ID.Clear;
  edVR_FECHARECLAMODesde.ClearDate();
  edVR_FECHARECLAMOHasta.ClearDate();
  edEX_ID.Clear;
  edVR_NRORECLAMO_SRT.Clear;
  fraCO_CONTRATO.Clear;
  fraEX_GTRABAJO.Clear;
  fraTJ_ID.Clear;
  fraLG_CODIGO.Clear;
  edVR_FECHAVENCIMIENTODesde.ClearDate;
  edVR_FECHAVENCIMIENTOHasta.ClearDate;
  calVR_FECHAVENCIMIENTODesde.Date := DBDate - 15;
  cmbDOCUMENTACION_FULL_LIKE.ItemIndex := 0;
  cmbRECIBIDO_FULL_LIKE.ItemIndex := 0;
  tbFechaVencimiento.Enabled := False;
  tbRecategorizarMotivo.Enabled := False;
  ClearComponentData(gbFiltrosHYS);
  fraUsuAltaResp_NO_FILTRAR.Clear;
  inherited;
end;

procedure TfrmVentanillaElectronica.edVR_FECHARECLAMOChange(Sender: TObject);
begin
  inherited;
  if (edVR_FECHAVENCIMIENTO.IsEmpty or (ModoABM = maAlta)) and TieneVencimiento then
    edVR_FECHAVENCIMIENTO.Date := CalcDiasHabiles(edVR_FECHARECLAMO.Date, NVL(fraVR_IDSUBTEMA.sdqDatos.FieldByName('VS_PLAZOPREDETERMINADO').AsInteger, 5));

  if (ModoABM = maAlta) and (not TieneVencimiento) then
    edVR_FECHAVENCIMIENTO.Date := edVR_FECHARECLAMO.Date;
end;

procedure TfrmVentanillaElectronica.btnAvisarClick(Sender: TObject);
begin
  Verificar((clbUsuariosART.ItemsChecked.Count = 0) and (clbUsuarios.ItemsChecked.Count = 0) and IsEmptyString(edDireccionesDeCorreo.Text), btnAvisar, 'Debe seleccionar al menos un usuario.');
  Verificar((clbUsuariosART.ItemsChecked.Count = 0) and (clbUsuarios.ItemsChecked.Count = 0) and (rgMailOrSIC.ItemIndex = 0), btnAvisar, 'Debe seleccionar al menos un destinatario cuando se genera una tarea en el SIC.');
  Verificar(IsEmptyString(edObservaciones.Lines.Text), edObservaciones, 'Debe completar las observaciones a enviar a los destinatarios.');
  Verificar((not IsEmptyString(edDireccionesDeCorreo.Text)) and (not IsEMails(edDireccionesDeCorreo.Text)), edDireccionesDeCorreo, 'Las direcciones adicionales de correo no son válidas.');
  Verificar((not TieneVencimiento) and (rgMailOrSIC.ItemIndex = 0), rgMailOrSIC, 'Si se trata de una "Nota correctiva sin plazos" o este registro no tendrá vencimiento (por haber seleccionado el motivo "' + fraVR_IDSUBTEMA.Descripcion + '") no se puede generar una tarea a través del SIC ya que no implica gestión directa.');
  fpAvisos.ModalResult := mrOK;
end;

procedure TfrmVentanillaElectronica.GridArchivosDblClick(Sender: TObject);
begin
  btnVerArchivoClick(Sender);
end;

procedure TfrmVentanillaElectronica.GridArchivosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqArchivos.FieldByName('VJ_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmVentanillaElectronica.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FullName, ['VE_DESCRIPCION']) then
  try
    if Field.DataSet.Active and not Field.DataSet.IsEmpty then
      Background := TPanel(FindComponent('pnl' + Field.DataSet.FieldByName('VE_ID').AsString)).Color;
  except
  end;
  
  if (Field.FieldName = 'VP_DESCRIPCION') and (not Field.DataSet.FieldByName('VP_FECHABAJA').IsNull) then
    AFont.Color := clRed;
  if (Field.FieldName = 'VS_DESCRIPCION') and (not Field.DataSet.FieldByName('VS_FECHABAJA').IsNull) then
    AFont.Color := clRed;
end;

procedure TfrmVentanillaElectronica.fraVR_IDTIPOPropiedadesChange(Sender: TObject);
begin
  VCLExtra.LockControls([edVR_FECHAVENCIMIENTO, fraVR_IDESTADO], not TieneVencimiento);
  if not TieneVencimiento then
  begin
    edVR_FECHAVENCIMIENTO.Clear;
    fraVR_IDESTADO.Propiedades.ExtraCondition := ' AND VE_ID = 6 ';
    fraVR_IDESTADO.Codigo := '6';
  end
  else
    if ModoABM = maAlta then
      fraVR_IDESTADO.Propiedades.ExtraCondition := ' AND VE_ID = 2 '
    else
      fraVR_IDESTADO.Propiedades.ExtraCondition := ' AND VE_ID <> 4 AND VE_ID >= ' + sdqConsulta.FieldByName('VR_IDESTADO').AsString;
end;

procedure TfrmVentanillaElectronica.FSFormShow(Sender: TObject);
begin
  gbFiltrosHYS.Height := gbFiltrosHYS.Height + 1;
  gbFiltrosHYS.Height := gbFiltrosHYS.Height - 1;
end;

function TfrmVentanillaElectronica.DandoDeAltaAdjuntos: Boolean;
begin
  Result := btnAgregarArchivo.Tag = 1;
end;

procedure TfrmVentanillaElectronica.btnAgregarArchivoClick(Sender: TObject);
var
  sDirReclamoSRT, sReclamoSRT, sExtensionRec, sAux, spath, sNombreArchivo: String;
  iSecuencia, iIdAdjunto: Integer;
  bSeguir: Boolean;
begin
  if ModoABM = maAlta then
  begin
    if MsgAsk('Para continuar debe guardar los datos ingresados hasta el momento.' + CRLF + '¿Desea guardar el reclamo ahora?') then
    try
      FAlta := True;
      btnAgregarArchivo.Tag := 1;
      if Validar and DoABM then
      begin
        bSeguir := True;
        FIdReclamo := Sql.PrimaryKey.FieldByName['VR_ID'].Value;
        //RefreshData;
        ModoABM := maModificacion;
        fraVR_IDESTADO.Propiedades.ExtraCondition := ' AND VE_ID <> 4 AND VE_ID >= 2';
      end else
        bSeguir := False;
    finally
      btnAgregarArchivo.Tag := 0;
    end
    else
      bSeguir := False
  end else //ModoABM <> maAlta
    bSeguir := True;

  if bSeguir then
  begin
      with TOpenDialog.Create(Self) do
      try
        Filter := 'Archivos Adobe PDF|*.pdf|Archivos de Imagenes JPG|*.jpg|Todos los archivos|*.*';
        if Execute then
        begin
          iIdAdjunto := ValorSqlInteger('SELECT NVL(MAX(VJ_ID), 0) + 1 FROM comunes.cvj_ventanilla_adjunto');
          sReclamoSRT := StringReplace(Trim(edNRORECLAMOSRT.Text), ' ', '', [rfReplaceAll]);
          sDirReclamoSRT := FStorageDirectory + IntToStr(YearOf(edVR_FECHARECLAMO.Date)) +  '\' + IntToStr(MonthOf(edVR_FECHARECLAMO.Date)) + '\' + IntToStr(DayOf(edVR_FECHARECLAMO.Date));
          sPath := ExtractFileName(FileName);
          sNombreArchivo := sPath;
          ForceDirectories(sDirReclamoSRT);
          sExtensionRec := Copy(sPath, Length(sPath) -3, 4);
          iSecuencia := FIdReclamo;
          sAux := sDirReclamoSRT +  '\' + IntToStr(iIdAdjunto) + '_' + IntToStr(GetNumeroFromDenunciaSRT(sReclamoSRT)) + iif(iSecuencia > 0, '_' + IntToStr(iSecuencia), '') + '_' + sNombreArchivo;
          CopyFileExt(FileName, sAux, False);  //****************Guarda el archivo
          AgregarArchivo(iIdAdjunto, FIdReclamo, sAux, sNombreArchivo);
        end;
      finally
        Free;
      end;
  end;
end;

procedure TfrmVentanillaElectronica.AgregarArchivo(AIdAdjunto, AIdReclamo: Integer; APathArchivo, ANombreArchivo: String);
var
  sSql: String;
begin
  sSql := 'INSERT INTO comunes.cvj_ventanilla_adjunto ' +
          '(VJ_ID, VJ_IDRECLAMO, VJ_ARCHIVO, VJ_USUALTA, VJ_FECHAALTA, VJ_NOMBREARCHIVO) ' +
          'VALUES (:idadjunto, :idreclamo, :patharchivo, :usualta, SYSDATE, :nombrearchivo)';

  EjecutarSqlSTEx(sSql, [AIdAdjunto, AIdReclamo, APathArchivo, Sesion.UserID, ANombreArchivo]);
  OpenQueryEx(sdqArchivos, [AIdReclamo]);

  if not DandoDeAltaAdjuntos then
    CommitTrans(True);
end;

procedure TfrmVentanillaElectronica.btnAgregarClick(Sender: TObject);
begin
  bAdjuntandoArchivos := True;
  if Validar then
  try
    if ExigeContrato then
      Verificar(fraVR_CONTRATO.IsEmpty ,fraVR_CONTRATO, 'Debe indicar un contrato.');

    if FidReclamo = - 1 then
      begin

        DoAbm;
      end;
    bAgregarRespuesta := True;
    Verificar(FIdReclamo = -1, btnAceptar, 'Debe guardar el reclamo antes de agregar respuestas');
    edRespuestaOtorgada.Clear;
    edFechaRta.Clear;
    edHecho.Clear;
    fpRespuesta.Caption := 'Agregar una nueva respuesta';
    fpRespuesta.ShowModal;
  finally
    bAdjuntandoArchivos := False;
  end;
end;

procedure TfrmVentanillaElectronica.GridRespuestasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if EsRojo( (( Sender as TArtDbGrid ).DataSource.DataSet) as TSDQuery , 'VR_FECHABAJA') Then
    AFont.Color := clRed;
end;

function TfrmVentanillaElectronica.EsRojo(sdqConsultaActiva: TSDquery; sFieldBaja: String): Boolean;
begin
  Result := (sFieldBaja <> '') and sdqConsultaActiva.Active and ( not sdqConsultaActiva.FieldByName( sFieldBaja ).IsNull);
end;

procedure TfrmVentanillaElectronica.CalcularNuevoEstado;
var
  dFechaVencimientoModificar: TDate;
  dFechaReclamo: TDate;
  dFechaRespuesta: TDate;
begin
  try
    dFechaVencimientoModificar := StrToDate(edFechaVencimientoModificar.Text);
    if sdqConsulta.FieldByName('vr_idestado').AsInteger = 5 then
    begin
      dFechaReclamo := sdqConsulta.FieldByName('VR_FECHARECLAMO').AsDateTime;
      dFechaRespuesta :=  sdqConsulta.FieldByName('VR_FECHA_RESPUESTA').AsDateTime;
      if dFechaVencimientoModificar >= dFechaRespuesta then
      begin
        edNuevoEstado.Text := pnl52.Caption;
        edNuevoEstado.Color := pnl52.Color;
      end
      else
      if dFechaVencimientoModificar < dFechaReclamo then
      begin
        edNuevoEstado.Clear;
        edNuevoEstado.Color := clBtnFace;
      end
      else
      begin
        edNuevoEstado.Text := pnl51.Caption;
        edNuevoEstado.Color := pnl51.Color;
      end
    end
    else
    begin
      edNuevoEstado.Text := sdqConsulta.FieldByName('VE_DESCRIPCION').AsString;
      edNuevoEstado.Color := TPanel(FindComponent('pnl' + sdqConsulta.FieldByName('VE_ID').AsString)).Color;
    end;
  except on e: EConvertError do
  begin
    edNuevoEstado.Clear;
    edNuevoEstado.Color := clBtnFace;
  end;
  end;
end;

procedure TfrmVentanillaElectronica.edFechaVencimientoModificarChange(Sender: TObject);
begin
  CalcularNuevoEstado;
end;

procedure TfrmVentanillaElectronica.edFechaVencimientoModificarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularNuevoEstado;
end;

procedure TfrmVentanillaElectronica.edRespuestaOtorgadaChange(Sender: TObject);
begin
  lbAbrirRespuestaOtorgada.Visible := FileExists(edRespuestaOtorgada.FileName);
end;

procedure TfrmVentanillaElectronica.lbAbrirRespuestaOtorgadaClick(Sender: TObject);
begin
  if FileExists(edRespuestaOtorgada.FileName) then
    ShellExecute(Application.Handle, nil, PChar(edRespuestaOtorgada.FileName), '', '', SW_SHOWNORMAL)
  else
    InfoHint(edRespuestaOtorgada, 'No se encontró el archivo indicado.');
end;

procedure TfrmVentanillaElectronica.lbAbrirReclamoAfiClick(Sender: TObject);
begin
//  if FileExists(edReclamoOriginal.FileName) then
//    ShellExecute(Application.Handle, nil, PChar(edReclamoOriginal.FileName), '', '', SW_SHOWNORMAL)
//  else
//    InfoHint(edReclamoOriginal, 'No se encontró el archivo indicado.');
end;

procedure TfrmVentanillaElectronica.tbRecategorizarMotivoClick(Sender: TObject);
var
  sSql: String;
begin
  fraRecategorizarMotivo.Clear;
  fraTipoDeComunicacion.Clear;
  fraRecategorizarMotivo.Propiedades.ExtraCondition := ' AND VS_IDTEMA = ' + SQLValue(sdqConsulta.FieldByName('VT_ID').AsInteger);
  fraRecategorizarMotivo.Codigo := sdqConsulta.FieldByName('VS_ID').AsString;
  fraRecategorizarMotivoPropiedadesChange(nil);
  fraTipoDeComunicacion.Codigo := sdqConsulta.FieldByName('VR_IDTIPO').AsString;
  if fpRecategorizarMotivo.ShowModal = mrOk then
  begin
    sSql := 'UPDATE comunes.cvr_ventanilla_reclamos ' +
               'SET vr_idsubtema = :idsubtema, ' +
                  ' vr_usumodif = :usuario, ' +
                  ' vr_fechamodif = SYSDATE ' +
             'WHERE vr_id = :id';
    EjecutarSQLEx(sSql, [fraRecategorizarMotivo.Value,
                         Sesion.UserID,
                         sdqConsulta.FieldByName('VR_ID').AsInteger]);
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmVentanillaElectronica.tbRevisarSRTClick(Sender: TObject);
{$IFDEF VER150}
begin
{$IFDEF MODOAFIL}
  with TfrmImportFromSRTReclamos.Create(Self) do
    try
      begin
        FStorageDirectory := Self.FStorageDirectory;
        ShowModal;
        if ModalResult = MrOk then
        begin
          MsgBox('Descarga Completa. Expedientes leidos: ' + IntToStr(iRegsLeidos)+ ' nuevos: ' + IntToStr(iRegsNuevos) + ' actualizados: ' + IntToStr(iRegsActualizados),MB_ICONINFORMATION + MB_OK);
          sdqConsulta.Refresh;
        end;
      end;
    finally
      Free;
    end;
{$ENDIF}
{$ELSE}
begin
  InfoHint(tbRevisarSRT, 'Esta funcionalidad no está disponible momentáneamente.');
{$ENDIF}
end;

procedure TfrmVentanillaElectronica.GridRespuestasCellClick(Column: TColumn);
begin
  inherited;
  edRespuestaOtorgada.Text := sdqRespuestas.FieldByName('VR_ARCHIVO').AsString;
  edHecho.Text := sdqRespuestas.FieldByName('VR_RESPUESTA').AsString;
  edFechaRta.Date :=  sdqRespuestas.FieldByName('VR_FECHA').AsDateTime;
end;

procedure TfrmVentanillaElectronica.GuardarRespuesta(const aIdReclamo: Integer);
var
  sSql, sReclamoSRT, sDirReclamoSRT, sNroDenuncia, sAnio, ExtensionRes, sAuxRes: String;
  sSecuenciaRespuesta: String;
begin
  Verificar(VerificarFechaRespuesta(edVR_FECHARECLAMO.Date,edFechaRta.Date),edFechaRta,'La fecha no puede ser anterior a la fecha de ingreso del reclamo.');

  sSecuenciaRespuesta := '0';
  sSql := 'SELECT 1 FROM comunes.cvr_ventanilla_reclamos WHERE vr_id = :vr';

  if ExisteSQLEx(sSql, [aIdReclamo]) then
  begin
    //Verificar(fraVR_MOTIVOAfi.IsEmpty, fraVR_MOTIVOAfi.edCodigo, 'Debe indicar el motivo.');

    if (GetAnioFromDenunciaSRT(edNRORECLAMOSRT.EditText) <> 0) then
    begin
      sNroDenuncia := StringReplace(edNRORECLAMOSRT.EditText, ' ', '', [rfReplaceAll]);
      // sNroDenuncia := StringReplace(sNroDenuncia, '_', '', [rfReplaceAll]);
      sAnio := Copy(sNroDenuncia, Pos('/', sNroDenuncia) + 1, MaxInt);
      if Length(sAnio) <= 2 then
      begin
        sAnio := '20' + LPad(sAnio, '0', 2);
        edNRORECLAMOSRT.Text := IntToStr(GetNumeroFromDenunciaSRT(edNRORECLAMOSRT.EditText)) + '/' + sAnio;
      end;
    end;

    sReclamoSRT := StringReplace(Trim(edNRORECLAMOSRT.Text), ' ', '', [rfReplaceAll]);
    sDirReclamoSRT := FStorageDirectory + IntToStr(GetAnioFromDenunciaSRT(sReclamoSRT));
    //sSecuenciaRespuesta:=ValorSQLEx('SELECT MAX(VR_SECUENCIA)+1 FROM COMUNES.CVR_VENTANILLA_RESPUESTA WHERE VR_IDRECLAMO = :VRID', [sdqConsulta.FieldByName('VR_ID').AsString]);
    sSecuenciaRespuesta := ValorSQLEx('SELECT NVL(MAX(VR_SECUENCIA),0)+1 FROM COMUNES.CVR_VENTANILLA_RESPUESTA WHERE VR_IDRECLAMO =:VRID', [sdqConsulta.FieldByName('VR_ID').AsString]);

    {Respuesta}
    ForceDirectories(sDirReclamoSRT);
    ExtensionRes := Copy (edRespuestaOtorgada.ShortName,Length(edRespuestaOtorgada.ShortName) -3, 4);
    //Nombre de archivo
    sAuxRes := GenerarNombreArchivo(sDirReclamoSRT,edRespuestaOtorgada.ShortName,sNroDenuncia,sSecuenciaRespuesta,sdqConsulta.FieldByName('VR_FECHARECLAMO').AsString);

    VerificarRespuesta;

    if FileExists(edRespuestaOtorgada.FileName) and (ExtractFileDir(edRespuestaOtorgada.FileName) <> sDirReclamoSRT) then
    begin
      if not FileExists(sAuxRes) or MsgAsk('¿Desea sobreescribir el archivo de respuesta?') then
        CopyFileExt(edRespuestaOtorgada.FileName, sAuxRes, False);     ////********************ACA guarda el archivo.
    end;

    sSql := 'INSERT INTO comunes.cvr_ventanilla_respuesta ' +
              '(VR_USUALTA, VR_IDRECLAMO, VR_FECHAALTA, VR_FECHA, VR_FECHA_ENVIO, VR_RESPUESTA, VR_ARCHIVO, VR_SECUENCIA) ' +
              'VALUES (:usualta, :idreclamo, SYSDATE, ' + SqlDate(edFechaRta.Date) + ', ' + SqlDate(edFechaRta.Date) + ' , :Resp, :Archivo, :Secuencia)';

    EjecutarSqlSTEx(sSql, [Sesion.UserID, aIdReclamo, edHecho.Text, sAuxRes, sSecuenciaRespuesta]);
//    MsgBox('Respuesta guardada', MB_ICONINFORMATION + MB_OK);
    fpRespuesta.Close;
    if bAgregarRespuesta then
    begin
      RefreshRespuestas(FIdReclamo);
      bAgregarRespuesta := False
    end
    else
      OpenQuery(sdqRespuestas);
  end else
    MsgBox('No existe el reclamo');
end;

procedure TfrmVentanillaElectronica.btnGuardarClick(Sender: TObject);
begin
  if (fpRespuesta.Caption = 'Agregar una nueva respuesta') then
    GuardarRespuesta(FIdReclamo)
  else
    UpdateRespuesta;
end;

procedure TfrmVentanillaElectronica.btnCerrarRespuestaClick(Sender: TObject);
begin
  fpRespuesta.Close;
end;

procedure TfrmVentanillaElectronica.btnModificarClick(Sender: TObject);
begin
  ModificarRespuesta;
end;

procedure TfrmVentanillaElectronica.GridRespuestasDblClick(Sender: TObject);
begin
  AbrirRespuesta;
end;

procedure TfrmVentanillaElectronica.ModificarRespuesta;
begin
  bAdjuntandoArchivos := True;
  if Validar then
  try
    Verificar(sdqRespuestas.FieldByName('VR_ID').IsNull, GridRespuestas, 'Debe seleccionar una respuesta.');
    Verificar(Not(sdqRespuestas.FieldByName('VR_FECHABAJA').IsNull), GridRespuestas, 'El registro esta eliminado, no se puede modificar.');
    fpRespuesta.Caption := 'Modificar una respuesta';
    fpRespuesta.ShowModal;
  finally
    bAdjuntandoArchivos := False;     
  end;
end;

procedure TfrmVentanillaElectronica.OcultarFrames(Sender: TObject);
const
  ALTURAAUX = 72;
begin
  pnlEmpresa.Visible := not(fraVR_IDSUBTEMA.IsSelected and (fraVR_IDSUBTEMA.sdqDatos.FieldByName('VS_CONTRATO').AsString = 'X'));
  pnlTrabajador.Visible := not(fraVR_IDSUBTEMA.IsSelected and (fraVR_IDSUBTEMA.sdqDatos.FieldByName('VS_SINIESTRO').AsString = 'X'));
  pnlEstablecimiento.Visible := not(fraVR_IDSUBTEMA.IsSelected and (fraVR_IDSUBTEMA.sdqDatos.FieldByName('VS_ESTABLECIMIENTO').AsString = 'X'));

  pnlEstablecimiento.Top := pnlMotivo.Top + 1;
  pnlEmpresa.Top := pnlMotivo.Top + 1;
  pnlTrabajador.Top := pnlMotivo.Top + 1;

  pgDatos.Height :=   GetAlturaPanel(pnlDatos) + GetAlturaPanel(pnlMotivo) + GetAlturaPanel(pnlReclamo)
                    + GetAlturaPanel(pnlEmpresa) + GetAlturaPanel(pnlTrabajador) + GetAlturaPanel(pnlEstablecimiento)
                    + GetAlturaPanel(pnlDenunciante) + GetAlturaPanel(pnlUsuarios) + ALTURAAUX;
  GridRespuestas.Height := fpAbm.Height - pgDatos.Height - (fpAbm.Height - BevelAbm.Top) - 48;
end;

procedure TfrmVentanillaElectronica.btnEliminarArchivoClick(Sender: TObject);
begin
  Verificar(sdqArchivos.FieldByName('VJ_ID').IsNull, GridArchivos, 'Debe seleccionar una archivo.');
  Verificar(Not(sdqArchivos.FieldByName('VJ_FECHABAJA').IsNull), GridArchivos, 'El archivo se encuentra eliminado, no se puede volver a eliminar.');
  if MsgAsk('¿Desea dar de baja el archivo seleccionado?') then
  begin
    BeginTrans(True);
    DarDeBajaArchivo(sdqArchivos.FieldByName('VJ_ID').AsInteger);
  end;
end;

procedure TfrmVentanillaElectronica.DarDeBajaArchivo(AIdArchivo: Integer);
begin
  EjecutarSqlSTEx('UPDATE comunes.cvj_ventanilla_adjunto ' +
                     'SET VJ_USUBAJA = :idusuario, ' +
                         'VJ_FECHABAJA = SYSDATE ' +
                   'WHERE VJ_ID = :idarchivo '
                   , [Sesion.UserID, AIdArchivo]);
  OpenQueryEx(sdqArchivos, [FIdReclamo]);
//  MsgBox('Archivo Eliminado', MB_ICONEXCLAMATION + MB_OK);
end;

procedure TfrmVentanillaElectronica.btnEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqRespuestas.FieldByName('VR_ID').IsNull, GridRespuestas, 'Debe seleccionar una respuesta.');
  Verificar(Not(sdqRespuestas.FieldByName('VR_FECHABAJA').IsNull), GridRespuestas, 'El registro se encuentra eliminado, no se puede volver a eliminar.');
  if MsgBox('¿Desea eliminar esta respuesta?', MB_ICONINFORMATION + MB_YESNO) = idYes then
  begin
    sSql := 'UPDATE comunes.cvr_ventanilla_respuesta ' +
               'SET vr_usubaja = :usu, ' +
                   'vr_fechabaja = sysdate ' +
             'WHERE vr_id = :id';
    EjecutarSqlSTEx(sSql, [Sesion.UserID, sdqRespuestas.FieldByName('VR_ID').AsInteger]);
    //MsgBox('Respuesta Eliminada', MB_ICONEXCLAMATION + MB_OK);
    sdqRespuestas.Refresh;
  end;
end;

procedure TfrmVentanillaElectronica.UpdateRespuesta;
var
  sSql, sReclamoSRT, sDirReclamoSRT, sNroDenuncia, sAnio, ExtensionRes, sAuxRes: String;
  sSecuenciaRespuesta: String;
begin
  sSecuenciaRespuesta := '0';

  {verificar si existe el reclamo antes de hacer cambios}
  sSql := 'SELECT 1 ' +
            'FROM comunes.cvr_ventanilla_reclamos ' +
           'WHERE vr_id = :vr';

  if ExisteSQLEx(sSql, [FIdReclamo]) then
  begin
    if ExigeContrato then
      Verificar(fraVR_CONTRATO.IsEmpty ,fraVR_CONTRATO, 'Debe indicar un contrato.');

    //Verificar(fraVR_MOTIVOAfi.IsEmpty, fraVR_MOTIVOAfi.edCodigo, 'Debe indicar el motivo.');

    {verificar que el año de la denuncia no sea 0 antes de procesar, luego guardamos en vars}
    if (GetAnioFromDenunciaSRT(edNRORECLAMOSRT.EditText) <> 0) then
    begin
      sNroDenuncia := StringReplace(edNRORECLAMOSRT.EditText, ' ', '', [rfReplaceAll]);
      sAnio := Copy(sNroDenuncia, Pos('/', sNroDenuncia) + 1, MaxInt);
          {el año viene de 2 tipos, 2001 o 09 por ej. arreglarlo antes de guardar}
      if Length(sAnio) <= 2 then
      begin
        sAnio := '20' + LPad(sAnio, '0', 2);
        edNRORECLAMOSRT.Text := IntToStr(GetNumeroFromDenunciaSRT(edNRORECLAMOSRT.EditText)) + '/' + sAnio;
      end;
    end;

      {trimear}
    sReclamoSRT := StringReplace(Trim(edNRORECLAMOSRT.Text), ' ', '', [rfReplaceAll]);
      {obtener el directorio compartido a donde va a parar el archivo}
    sDirReclamoSRT := FStorageDirectory + IntToStr(GetAnioFromDenunciaSRT(sReclamoSRT));

      {Respuesta}
    ForceDirectories(sDirReclamoSRT);
    ExtensionRes := Copy (edRespuestaOtorgada.ShortName, Length(edRespuestaOtorgada.ShortName) -3, 4);
       //Secuencia
    sSecuenciaRespuesta := ValorSQLEx('SELECT VR_SECUENCIA FROM COMUNES.CVR_VENTANILLA_RESPUESTA WHERE VR_ID=:VRID', [sdqRespuestas.FieldByName('VR_ID').AsString]);

      {al actualizar el nombre de archivo verificar que eligio otro y no es el mismo, sino el server le agrega un chars extraños}
    if edRespuestaOtorgada.FileName = sdqRespuestas.FieldByName('VR_ARCHIVO').AsString then
      sAuxRes := sdqRespuestas.FieldByName('VR_ARCHIVO').AsString
    else
      sAuxRes := GenerarNombreArchivo(sDirReclamoSRT, edRespuestaOtorgada.ShortName, sNroDenuncia, sSecuenciaRespuesta, sdqConsulta.FieldByName('VR_FECHARECLAMO').AsString);

      {verificar que el archivo existe y que completo la fecha}
    VerificarRespuesta;

      {si existe un archivo con el mismo nombre}
    if FileExists(edRespuestaOtorgada.FileName) and (ExtractFileDir(edRespuestaOtorgada.FileName) <> sDirReclamoSRT) then
    begin
      if not FileExists(sAuxRes) or MsgAsk('¿Desea sobreescribir el archivo de respuesta?') then
      CopyFileExt(edRespuestaOtorgada.FileName, sAuxRes, False);     ////********************ACA guarda el archivo.
    end;
      {Update}
    sSql := 'UPDATE comunes.cvr_ventanilla_respuesta ' +
               'SET VR_USUMODIF = :usumodif, VR_FECHAMODIF = SYSDATE, VR_FECHA = ' + SqlDate(edFechaRta.Date) + ', VR_FECHA_ENVIO=' + SqlDate(edFechaRta.Date) + ', VR_RESPUESTA=:Resp, VR_ARCHIVO=:Archivo ' +
             'WHERE VR_ID=:id';

    EjecutarSqlSTEx(sSql, [Sesion.UserID, edHecho.Text, sAuxRes, sdqRespuestas.FieldByName('VR_ID').AsInteger]);
    //MsgBox('Respuesta actualizada', MB_ICONINFORMATION + MB_OK);
    fpRespuesta.Close;
    sdqRespuestas.Refresh;
  end
  else
    MsgBox('No existe el reclamo');
end;

function TfrmVentanillaElectronica.GenerarNombreArchivo(aDirReclamo, aNombre, aReclamo, aSecuencia, aFecha: String): String;
var
  sAuxRes, sFecha: String;
begin
  sAuxRes := '';
  sFecha := aFecha;
  sFecha := Copy(sFecha, 1, 5);
  sFecha := StrReplace(sFecha, '/', '-');
  sFecha := Copy(sFecha, 4, 2) + '-' + Copy(sFecha, 1, 2); {mm-dd, sino queda al revez}

  sAuxRes := aDirReclamo +
            '\' +
            IntToStr(GetNumeroFromDenunciaSRT(aReclamo)) +
            '_' +
            IntToStr(GetAnioFromDenunciaSRT(aReclamo)) +
            '-' +
            sFecha +
            '_' +
            aSecuencia +
            '_' +
            aNombre;
  Result := sAuxRes;
end;

procedure TfrmVentanillaElectronica.VerificarRespuesta;
begin
  Verificar(Not(FileExists(edRespuestaOtorgada.FileName)), edRespuestaOtorgada, 'Debe seleccionar un archivo válido.');
  Verificar(edFechaRta.IsEmpty, edFechaRta, 'Debe indicar la fecha de respuesta.');
end;

procedure TfrmVentanillaElectronica.btnVerArchivoClick(Sender: TObject);
begin
  Verificar(Not(sdqArchivos.FieldByName('VJ_FECHABAJA').IsNull), GridArchivos, 'El archivo se encuentra en estado eliminado.');
  if FileExists(sdqArchivos.FieldByName('VJ_ARCHIVO').AsString) then
    ShellExecute(Application.Handle, nil, PChar(sdqArchivos.FieldByName('VJ_ARCHIVO').AsString), '', '', SW_SHOWNORMAL)
  else
    InfoHint(GridArchivos, 'No se encontró el archivo indicado.');
end;

procedure TfrmVentanillaElectronica.btnVerRespuestaClick(Sender: TObject);
begin
  AbrirRespuesta;
end;

procedure TfrmVentanillaElectronica.btnAceptarFechaVencimientoClick(Sender: TObject);
var dFechaReclamo: TDateTime;
begin
  Verificar(edFechaVencimientoModificar.IsEmpty, edFechaVencimientoModificar, 'Debe completar la fecha de vencimiento.');
  dFechaReclamo := sdqConsulta.FieldByName('VR_FECHARECLAMO').AsDateTime;
  Verificar(dFechaReclamo > edFechaVencimientoModificar.Date, edFechaVencimientoModificar, 'La fecha de vencimiento no puede ser anterior a la fecha de reclamo ('+ DateToStr(dFechaReclamo) + ').');
  fpFechaVencimiento.ModalResult := mrOk;
end;

procedure TfrmVentanillaElectronica.btnAceptarRecategorizarMotivoClick(
  Sender: TObject);
begin
  Verificar(fraTipoDeComunicacion.IsEmpty, fraTipoDeComunicacion.edCodigo, 'Tipo de comunicación no puede quedar vacío. Debe elegir un motivo válido.');
  fpRecategorizarMotivo.ModalResult := mrOk;
end;

procedure TfrmVentanillaElectronica.btnAceptarTextosRespuestaClick(Sender: TObject);
begin
//  with TfrmRptImprimirRespuesta.Create(Self) do
//  try
//    ImprimirReporte(sdqConsulta.FieldByName('VR_ID').AsInteger, mTexto1.Text, mTexto2.Text, mTexto3.text);
//  finally
//    Free;
//  end;
end;

procedure TfrmVentanillaElectronica.AbrirRespuesta;
begin
  Verificar(Not(sdqRespuestas.FieldByName('VR_FECHABAJA').IsNull), GridRespuestas, 'El registro se encuentra en estado eliminado.');

  if FileExists(sdqRespuestas.FieldByName('VR_ARCHIVO').AsString) then
    ShellExecute(Application.Handle, nil, PChar(sdqRespuestas.FieldByName('VR_ARCHIVO').AsString), '', '', SW_SHOWNORMAL)
  else
    InfoHint(GridRespuestas, 'No se encontró el archivo indicado.');
end;

procedure TfrmVentanillaElectronica.RefreshRespuestas(aIdReclamo: Integer);
var
  sSql: String;
begin
  sSQL := 'SELECT vr_secuencia, vr_id, vr_idreclamo, vr_fecha, vr_fecha_envio, vr_respuesta, vr_archivo, ' +
                 'vr_usualta, vr_fechaalta, vr_usumodif, vr_fechamodif, vr_usubaja, vr_fechabaja ' +
            'FROM comunes.cvr_ventanilla_respuesta ' +
           'WHERE vr_idreclamo = :idreclamo ' +
        'ORDER BY vr_secuencia ASC';
  OpenQueryEx(sdqRespuestas, [aIdReclamo], sSQL);
end;

procedure TfrmVentanillaElectronica.VerificarRespuestaVieja;
var
  sFileName, sReclamoSRT: String;
begin
  sReclamoSRT := StringReplace(Trim(edNRORECLAMOSRT.Text), ' ', '', [rfReplaceAll]);

  sFileName := FStorageDirectory + IntToStr(GetAnioFromDenunciaSRT(sReclamoSRT)) + '\' + IntToStr(GetNumeroFromDenunciaSRT(sReclamoSRT)) + '_' + UpperCase(fraVR_IDTIPO.Descripcion) + iif(edSecuencia.Value > 0, '_' + IntToStr(edSecuencia.Value), '') + '_RESPUESTA.pdf';
  if FileExists(sFileName) then
  begin
      AgregarRespuestaVieja(sFileName,sdqConsulta.FieldByName('VR_RESPUESTA').AsString,
                            sdqConsulta.FieldByName('VR_FECHA_RESPUESTA').AsDateTime,
                            FIdReclamo,1);
  end
  else
  begin
    if edVR_FECHARECLAMO.Date < StrToDate('01/08/2009') then // Fecha de implementación de la corrección de este bug
    begin
      sFileName := FStorageDirectory + IntToStr(GetAnioFromDenunciaSRT(sReclamoSRT)) + '\' +
                   IntToStr(GetNumeroFromDenunciaSRT(sReclamoSRT)) + '_' + UpperCase(fraVR_IDTIPO.Descripcion) +
                   iif(edSecuencia.Value > 0, '_' + IntToStr(edSecuencia.Value), '') + '_RESPUESTA.pdf';
      if FileExists(sFileName) then
      begin
        AgregarRespuestaVieja(sFileName,sdqConsulta.FieldByName('VR_RESPUESTA').AsString,
                                    sdqConsulta.FieldByName('VR_FECHA_RESPUESTA').AsDateTime,
                                    FIdReclamo,1);
      end;
    end;
  end;
end;

procedure TfrmVentanillaElectronica.AgregarRespuestaVieja(const aNombreArchivo, aRespuesta: String; const aFechaRespuesta: TDate; const aIdReclamo, aSecuencia: Integer);
var
  sSql: String;
begin
  if aFechaRespuesta <> 0 then
  begin
    sSql := 'INSERT INTO comunes.cvr_ventanilla_respuesta ' +
              '(VR_USUALTA, VR_IDRECLAMO, VR_FECHAALTA, VR_FECHA, VR_FECHA_ENVIO, VR_RESPUESTA, VR_ARCHIVO, VR_SECUENCIA) ' +
              'VALUES (:usualta, :idreclamo, SYSDATE, :fecharespuesta, :fecharespuesta, :Resp, :Archivo, :Secuencia)';

    EjecutarSqlEx(sSql, ['SISTEMA', aIdReclamo, TDateTimeEx.Create(aFechaRespuesta), TDateTimeEx.Create(aFechaRespuesta), aRespuesta, aNombreArchivo, aSecuencia]);
    sdqRespuestas.Refresh;
  end;
end;

procedure TfrmVentanillaElectronica.tbNuevoClick(Sender: TObject);
begin
  FIdReclamo := -1;
  inherited;
end;

procedure TfrmVentanillaElectronica.tbFechaVencimientoClick(Sender: TObject);
var
  sSql: String;
begin
  edFechaVencimientoModificar.Date := sdqConsulta.FieldByName('VR_FECHAVENCIMIENTO').AsDateTime;
  edNuevoEstado.Text := sdqConsulta.FieldByName('VE_DESCRIPCION').AsString;
  edNuevoEstado.Color := TPanel(FindComponent('pnl' + sdqConsulta.FieldByName('VE_ID').AsString)).Color;
  if fpFechaVencimiento.ShowModal = mrOk then
  begin
    sSql := 'UPDATE comunes.cvr_ventanilla_reclamos ' +
               'SET vr_fechavencimiento = :fecha, ' +
                  ' vr_usumodif = :usuario, ' +
                  ' vr_fechamodif = SYSDATE ' +
             'WHERE vr_id = :id';
    EjecutarSQLEx(sSql, [TDateTimeEx.Create(edFechaVencimientoModificar.Date),
                         Sesion.UserID, sdqConsulta.FieldByName('VR_ID').AsInteger]);
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmVentanillaElectronica.ConfigurarForm;
var
  iAlturaPanel: Integer;
begin
  iAlturaPanel := GetAlturaPanel(pnlDatos) + GetAlturaPanel(pnlEmpresa) + GetAlturaPanel(pnlEstablecimiento) + GetAlturaPanel(pnlReclamo) + GetAlturaPanel(pnlHecho);
  pnlTrabajador.Visible :=  (not bEsAfi) and (Sesion.Sector <> 'HYS') {$IFDEF HYS}and False{$ENDIF};
  pnlDenunciante.Visible := pnlTrabajador.Visible;

  if bEsAfi then
  begin
    fraVR_IDSUBTEMA.Propiedades.ExtraCondition := ' AND VS_IDTEMA=7';
    tbRevisarSRT.Left := 120;
    FieldHider.HideField('VR_NOMBRE_DENUNCIANTE');
    FieldHider.HideField('VR_CUIL_CUIT_DENUNCIANTE');
    FieldHider.ShowField('VE_DESCRIPCION');

    pnlMotivo.Visible := False;
    pnlRecibido.Visible := False;
  end else
  begin
    pnlUsuarios.Visible := False;
  end;

  iAlturaPanel := iAlturaPanel + GetAlturaPanel(pnlUsuarios) + GetAlturaPanel(pnlMotivo) + GetAlturaPanel(pnlTrabajador) + GetAlturaPanel(pnlDenunciante);
  pgDatos.Height := iAlturaPanel + 33;
  Application.ProcessMessages;
  //GridRespuestas.Height := fpAbm.Height - pgDatos.Height - (fpAbm.Height - BevelAbm.Top) - 48;
end;

procedure TfrmVentanillaElectronica.rbFiltroFechaClick(Sender: TObject);
begin
  ActualizarFiltroFechaVencimiento;
end;

procedure TfrmVentanillaElectronica.ActualizarFiltroFechaVencimiento;
begin
  if rbFiltroFecha.Checked then
  begin
    calVR_FECHAVENCIMIENTODesde.Visible := True;
    calVR_FECHAVENCIMIENTODesde.Enabled := True;
  end
  else
  begin
    calVR_FECHAVENCIMIENTODesde.Visible := False;
    calVR_FECHAVENCIMIENTODesde.Enabled := False;
  end;

  tbRefrescarClick(nil);
end;

procedure TfrmVentanillaElectronica.rbFiltroFechaNoClick(Sender: TObject);
begin
  ActualizarFiltroFechaVencimiento;
end;

procedure TfrmVentanillaElectronica.btnAceptarClick(Sender: TObject);
begin
	if Validar and DoABM then
  begin
  	if sdqConsulta.Active then
    begin
    	sdqConsulta.Refresh;
      CheckButtons;
    end
    else
    	tbRefrescarClick(nil);

    if not(bAgregarRespuesta) then
		  fpABM.ModalResult := mrOk;
	end;
end;

procedure TfrmVentanillaElectronica.fpAbmClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  RollBack(True);
end;

procedure TfrmVentanillaElectronica.fpAbmShow(Sender: TObject);
begin
  inherited;           
  if (Sesion.Sector = 'PRESDIN') and (ModoABM = maAlta) then
  begin
    fraVR_IDTIPO.Codigo    := '1';
    fraTEMA.Codigo         := '1';
    fraVR_IDSUBTEMA.Codigo := '26';
    fraVR_IDARTICULO.Codigo:= '7';
  end;

  if (Sesion.Sector = 'HYS') {$IFDEF HYS}or True{$ENDIF} then
    fraTEMA.Codigo := '8';

  FAlta := False;
  BeginTrans(True);
end;

procedure TfrmVentanillaElectronica.btnBuscarExpedienteSrtClick(Sender: TObject);
var
  sSql, sReclamoSRT: String;
begin
  Verificar(edNRORECLAMOSRT.ReadOnly, edNRORECLAMOSRT, 'No se puede recuperar información cuando el registro ya se cargó.');
  Verificar(edNRORECLAMOSRT.Text = '', edNRORECLAMOSRT, 'El número de reclamo S.R.T. no puede estar vacío.');
  sReclamoSRT := Get_DenunciaSRT(edNRORECLAMOSRT.Text);

  if ExisteSQLEx('SELECT 1 ' +
                   'FROM COMUNES.CVR_VENTANILLA_RECLAMOS ' +
                  'WHERE VR_NRORECLAMO_SRT = :NRO ' +
                    'AND VR_FECHABAJA IS NULL ' +
               'ORDER BY VR_ID ASC', [sReclamoSRT]) then
  begin
    if not MsgAsk(Format('Existe otro registro con el mismo número de %s SRT (%s).' + CRLF + '¿Desea cargar los datos?', [fraVR_IDTIPO.Descripcion, Trim(StringReplace(edNRORECLAMOSRT.EditText, '_', '', [rfReplaceAll]))])) then
        Abort;

    sSql := 'SELECT vr_idtipo, vs_idtema, vr_idsubtema, vr_idarticulo, vr_idexpediente, vr_contrato, vr_nombre_denunciante, '+
                   'vr_tipodocumento_denunciante, vr_cuil_cuit_denunciante, vr_idaseguradora ' +
              'FROM aem_empresa, ctj_trabajador, aco_contrato, comunes.cve_ventanilla_estados, comunes.cva_ventanilla_articulos,' +
                   'comunes.cvs_ventanilla_subtemas, comunes.cvp_ventanilla_tipo, comunes.cvt_ventanilla_temas, comunes.cvr_ventanilla_reclamos, ' +
                   'art.sex_expedientes ' +
            ' WHERE VR_NRORECLAMO_SRT = :NRO AND VR_FECHABAJA IS NULL '+
               'AND vr_idestado = ve_id ' +
               'AND vr_idsubtema = vs_id ' +
               'AND vs_idtema = vt_id ' +
               'AND vr_idarticulo = va_id(+) ' +
               'AND vr_idtipo = vp_id(+) ' +
               'AND vr_idexpediente = ex_id(+) ' +
               'AND vr_contrato = co_contrato(+) ' +
               'AND co_idempresa = em_id(+) ' +
               'AND ex_cuil = tj_cuil(+) ' +
          'ORDER BY vr_id DESC';

    with GetQueryEx(sSql, [sReclamoSRT]) do
    try
      if not Eof then
        fraVR_IDTIPO.Codigo                    := FieldByName('vr_idtipo').AsString;
        fraTEMA.Codigo                         := FieldByName('vs_idtema').AsString;
        fraVR_IDSUBTEMA.Codigo                 := FieldByName('vr_idsubtema').AsString;
        fraVR_IDARTICULO.Codigo                := FieldByName('vr_idarticulo').AsString;
        fraVR_IDASEGURADORA.Codigo             := FieldByName('vr_idaseguradora').AsString;
        fraVR_IDEXPEDIENTE.IdSiniestro         := FieldByName('vr_idexpediente').AsInteger;
        fraVR_CONTRATO.Contrato                := FieldByName('vr_contrato').AsInteger;
        CambioEmpresa(nil);
        edVR_NOMBRE_DENUNCIANTE.Text           := FieldByName('vr_nombre_denunciante').AsString;
        fraVR_TIPODOCUMENTO_DENUNCIANTE.Codigo := FieldByName('vr_tipodocumento_denunciante').AsString;
        edVR_CUIL_CUIT_DENUNCIANTE.Text        := FieldByName('vr_cuil_cuit_denunciante').AsString;
    finally
      Free;
    end;
  end;
end;

procedure TfrmVentanillaElectronica.btnGuardarObservacionesSICClick(Sender: TObject);
begin
  Verificar(IsEmptyString(Trim(mmoObservacionesSIC.Lines.Text)), mmoObservacionesSIC,
            'Debe completar una observación para notificar ' + iif(sdqSIC.FieldByName('tarea').AsString = 'S', 'a los responsables de la tarea.', 'al responsable del evento.'));
  if not MsgAsk(iif(sdqSIC.FieldByName('tarea').AsString = 'S',
                    'Está a punto de generar una notificación para:' + CRLF + sdqSIC.FieldByName('responsable').AsString + CRLF + CRLF + '¿Desea continuar?', 
                    'La observación que Ud. agregue no será notificada a ' + sdqSIC.FieldByName('responsable').AsString + ' ya que el evento seleccionado no corresponde a una Tarea en Curso.' + CRLF + CRLF + '¿Desea continuar de todas formas?')) then
    Abort;
  fpObservacionesSIC.ModalResult := mrOk;
end;

procedure TfrmVentanillaElectronica.btnLimpiarClick(Sender: TObject);
begin
  mTexto1.Lines.Clear;
  mTexto2.Lines.Clear;
  mTexto3.Lines.Clear;
end;

procedure TfrmVentanillaElectronica.btnRefreshClick(Sender: TObject);
begin
  inherited;
  OpenQuery(sdqRespuestas);
end;

procedure TfrmVentanillaElectronica.fpAvisosShow(Sender: TObject);
begin
  inherited;
  rgMailOrSIC.ItemIndex := 0; //SIC
  chkIncluirmeComoDest.Checked := True;
  RegistroUsuarios(nil);
end;

procedure TfrmVentanillaElectronica.fpObservacionesSICShow(Sender: TObject);
begin
  mmoObservacionesSIC.Lines.Clear;
end;

procedure TfrmVentanillaElectronica.mnuAgregarObservacionesEventoClick(Sender: TObject);
begin
  if fpObservacionesSIC.ShowModal = mrOk then
    AgregarObservaciones('agenda.aoe_observacionevento', 'oe_', 'idagendaevento', sdqSIC.FieldByName('id').AsInteger, mmoObservacionesSIC.Lines.Text);
end;

procedure TfrmVentanillaElectronica.mnuAgregarObservacionesTareaClick(Sender: TObject);
begin
  if fpObservacionesSIC.ShowModal = mrOk then
    AgregarObservaciones('agenda.aot_observaciontarea', 'ot_', 'idagendatarea', sdqSIC.FieldByName('id').AsInteger, mmoObservacionesSIC.Lines.Text);
end;

procedure TfrmVentanillaElectronica.pmSICPopup(Sender: TObject);
begin
  mnuAgregarObservacionesEvento.Visible := (not sdqSIC.IsEmpty) and (sdqSIC.FieldByName('tarea').AsString = 'N');
  mnuAgregarObservacionesTarea.Visible := (not sdqSIC.IsEmpty) and (sdqSIC.FieldByName('tarea').AsString = 'S');

  mnuAgregarObservacionesEvento.Caption := 'Agregar observaciones en el Evento' + iif(mnuAgregarObservacionesEvento.Visible, ' ' + sdqSIC.FieldByName('id').AsString, '');
  mnuAgregarObservacionesTarea.Caption := 'Agregar observaciones en la Tarea' + iif(mnuAgregarObservacionesTarea.Visible, ' ' + sdqSIC.FieldByName('id').AsString, '');  
end;

procedure TfrmVentanillaElectronica.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  OpenQueryEx(sdqSIC, [sdqConsulta.FieldByName('VR_IDEXPEDIENTE').AsInteger]);
end;

procedure TfrmVentanillaElectronica.sdqRespuestasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(GridRespuestas);
  if not sdqRespuestas.IsEmpty then
    if fraVR_IDESTADO.Codigo <= '3' then
      fraVR_IDESTADO.Codigo := '5';
end;

function TfrmVentanillaElectronica.VerificarFechaReclamo(const aDate: TDate; const aVR_IDTIPO: Integer): boolean;
begin
  if aDate > DBDate then
    Result := True
  else
    Result := False;
end;

function TfrmVentanillaElectronica.VerificarFechaRespuesta(const aDateReclamo, aDateRespuesta: TDate): boolean;
begin
  if aDateReclamo > aDateRespuesta then
    Result := True
  else
    Result := False;
end;

procedure ControlFiltro(ASender: TObject; AFrameFiltro: TfraCodDesc; AFrameFiltrado: TfraCodDesc; ATabla: String; ACampoJoin: String);
var
  Valor: Variant;
  sDescripcion: String;
begin
  if (not Assigned(ASender)) and AFrameFiltrado.IsSelected then
  begin
    Valor := AFrameFiltrado.Value;
    sDescripcion := AFrameFiltrado.Descripcion;
    AFrameFiltrado.Clear;
  end;
  
  if AFrameFiltro.IsSelected then
    AFrameFiltrado.Propiedades.ExtraCondition := ' AND EXISTS(SELECT 1 FROM ' + ATabla + ' WHERE ' + Copy(ACampoJoin, 1, 3) + 'IDSUBTEMA = ' + SQLValue(AFrameFiltro.Value) + ' AND ' + ACampoJoin + ' = ' + AFrameFiltrado.Propiedades.FieldCodigo + ')'
  else
    AFrameFiltrado.Propiedades.ExtraCondition := '';

  if not Assigned(ASender) then
  begin
    AFrameFiltrado.Value := Valor;
    if (not IsEmptyString(sDescripcion)) and AFrameFiltrado.IsEmpty then
      InfoHint(AFrameFiltrado, 'El ítem "' + sDescripcion + '" ya no está disponible para este motivo.');
  end else
    AFrameFiltrado.cmbDescripcionDropDown(ASender)
end;

procedure TfrmVentanillaElectronica.ControlMotivoTipo(Sender: TObject);
begin
  ControlFiltro(Sender, fraVR_IDSUBTEMA, fraVR_IDTIPO, 'COMUNES.CVU_VENTANILLA_SUBTEMA_TIPO', 'VU_IDTIPO');
end;

procedure TfrmVentanillaElectronica.ControlRecategorizarMotivo(Sender: TObject);
begin
  ControlFiltro(Sender, fraRecategorizarMotivo, fraTipoDeComunicacion, 'COMUNES.CVU_VENTANILLA_SUBTEMA_TIPO', 'VU_IDTIPO');
end;

procedure TfrmVentanillaElectronica.ControlMotivoArticulo(Sender: TObject);
begin
  ControlFiltro(Sender, fraVR_IDSUBTEMA, fraVR_IDARTICULO, 'COMUNES.CVI_VENTANILLA_SUBTEMA_ARTI', 'VI_IDARTICULO');
end;

procedure TfrmVentanillaElectronica.ControlFiltroMotivoTipo(Sender: TObject);
begin
  ControlFiltro(Sender, fraVS_ID, fraVP_ID, 'COMUNES.CVU_VENTANILLA_SUBTEMA_TIPO', 'VU_IDTIPO');
end;

procedure TfrmVentanillaElectronica.ControlFiltroMotivoArticulo(Sender: TObject);
begin
  ControlFiltro(Sender, fraVS_ID, fraVA_ID, 'COMUNES.CVI_VENTANILLA_SUBTEMA_ARTI', 'VI_IDARTICULO');
end;

procedure TfrmVentanillaElectronica.CambioMotivo(Sender: TObject);
begin
  ControlMotivoTipo(nil);
  ControlMotivoArticulo(nil);
  OcultarFrames(nil);
end;

procedure TfrmVentanillaElectronica.ControlFiltroMotivo(Sender: TObject);
begin
  ControlFiltroMotivoTipo(nil);
  ControlFiltroMotivoArticulo(nil);
end;

procedure TfrmVentanillaElectronica.RegistroUsuarios(Sender: TObject);
begin
  edUsuarios.Text := clbUsuarios.CheckedItems.CommaText + ' ' + clbUsuariosART.CheckedItems.CommaText;
end;

procedure TfrmVentanillaElectronica.RegistroUsuariosTecla(Sender: TObject; var Key: Char);
begin
  RegistroUsuarios(nil);
end;

function TfrmVentanillaElectronica.ExigeContrato: Boolean;
begin
  Result := fraVR_IDSUBTEMA.IsSelected and (fraVR_IDSUBTEMA.sdqDatos.FieldByName('VS_CONTRATO').AsString = 'S');
end;

function TfrmVentanillaElectronica.ExigeSiniestro: Boolean;
begin
  Result := fraVR_IDSUBTEMA.IsSelected and (fraVR_IDSUBTEMA.sdqDatos.FieldByName('VS_SINIESTRO').AsString = 'S');
end;

function TfrmVentanillaElectronica.ExigeEstablecimiento: Boolean;
begin
  Result := fraVR_IDSUBTEMA.IsSelected and (fraVR_IDSUBTEMA.sdqDatos.FieldByName('VS_ESTABLECIMIENTO').AsString = 'S');
end;

function TfrmVentanillaElectronica.TieneVencimiento: Boolean;
begin
  if fraVR_IDSUBTEMA.IsSelected then
    Result := (fraVR_IDSUBTEMA.sdqDatos.FieldByName('VS_TIENEVENCIMIENTO').AsString = 'S') and ((fraVR_IDTIPO.ID <> TIPO_NOTA_CORRECTIVA_SIN_PLAZO))
  else
    Result := False;
end;

end.
