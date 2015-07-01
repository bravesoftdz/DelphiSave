unit unGestionSistemas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, JvgGroupBox, DBCtrls, FormPanel, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, JvExComCtrls, JvMonthCalendar, JvExExtCtrls,
  JvNavigationPane, ImgList, Mask, ToolEdit, DateComboBox, PatternEdit, IntEdit, JvComponent,
  JvExControls, CheckLst, ARTCheckListBox, Menus, 
  FileCtrl, JvDriveCtrls, ToolPanels, JvExDBGrids, JvDBGrid,
  JvDateTimePicker, OleCtrls, SHDocVw, RXDBCtrl,
  JvAppEvent, AdvGlowButton, Buttons, JvSpeedButton, 
  unfraUsuarios, JvComponentBase, RxToolEdit, RxPlacemnt, dxScreenTip,
  JvDBDateTimePicker, AdvPanel, AdvCardList, DBAdvCardList, dxCustomHint, cxHint,
  JvExtComponent, JvPanel, AdvGroupBox, AdvOfficeButtons;

type
  TfrmGestionSistemas = class(TfrmCustomConsulta)
    AdvToolPanelAdjuntos: TAdvToolPanel;
    AdvToolPanelLeyendas: TAdvToolPanel;
    AdvToolPanelTab: TAdvToolPanelTab;
    Bevel1: TBevel;
    BevelAbm: TBevel;
    btnAceptar: TAdvGlowButton;
    btnAceptarUsuario: TButton;
    btnAplicar: TAdvGlowButton;
    btnCancelar: TAdvGlowButton;
    btnCancelarUsuario: TButton;
    btnClearCalificacion: TJvSpeedButton;
    btnClearSector: TJvSpeedButton;
    btnClearUser: TJvSpeedButton;
    btnImprimir: TAdvGlowButton;
    chkHS_PRESENCIAL: TDBCheckBox;
    chkRESUELTO: TDBCheckBox;
    chkTieneAdjuntos: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    dbgAdjuntos: TJvDBGrid;
    dbgDiscos: TJvDBGrid;
    dbgHistoricoPedidos: TArtDBGrid;
    dbgSoftwareInstalado: TJvDBGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBText1: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText14: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    dsAdjuntos: TDataSource;
    dsDetalle: TDataSource;
    dsDiscos: TDataSource;
    dsInfoPC: TDataSource;
    dsPedidos: TDataSource;
    dsSoftwareInstalado: TDataSource;
    edCA_DESCRIPCION: TDBText;
    edHS_FECHACOMPROMETIDA: TDBDateEdit;
    edHS_FECHAREANUDACION: TDBDateEdit;
    edHS_FECHASOLICITUDREQUERIDA: TDBDateEdit;
    edHS_HORACOMPROMETIDA: TJvDateTimePicker;
    edHS_HORAREANUDACION: TJvDateTimePicker;
    edHS_NOTAS: TDBMemo;
    edHS_OBSERVACIONES: TDBMemo;
    edMotivoAutorizacion: TMemo;
    edNroTicket: TDBText;
    edSS_COMENTARIOS_USUARIO: TDBMemo;
    edSS_FECHA_SOLICITUD: TDBDateEdit;
    edSS_NOTAS: TDBMemo;
    edSS_NRO_TICKET: TIntEdit;
    edSS_OBSERVACIONES: TDBMemo;
    FormStorageHijo: TFormStorage;
    fpAbm: TFormPanel;
    fpAutorizacion: TFormPanel;
    fraCA_ID: TfraCodDesc;
    fraEJ_ID: TfraCodDesc;
    fraEQ_ID: TfraCodDesc;
    fraES_ID: TfraCodDesc;
    fraFiltroMotivoDetalle: TfraCodDesc;
    fraFiltroMotivoPadre: TfraCodDesc;
    fraHS_IDMOTIVOSOLICITUD: TfraCodDesc;
    fraHS_IDSECTOR_ASIGNADO: TfraCodDesc;
    fraHS_IDUSUARIO: TfraCodDesc;
    fraHS_IDUSUARIO_SOLICITUD: TfraCodDesc;
    fraHS_PRIORIDAD: TfraCodDesc;
    fraSS_IDEJECUTABLE: TfraCodDesc;
    fraSS_IDEQUIPO: TfraCodDesc;
    fraSS_IDESTADOACTUAL: TfraCodDesc;
    fraSS_IDMOTIVOSOLICITUD: TfraCodDesc;
    fraSS_IDSECTOR_ASIGNADO: TfraCodDesc;
    fraSS_IDUSUARIO: TfraCodDesc;
    fraSS_IDUSUARIO_SOLICITUD: TfraCodDesc;
    fraSS_PRIORIDAD: TfraCodDesc;
    fraUsuarioAutorizacion: TfraUsuario;
    gbBottom: TJvgGroupBox;
    gbControles: TJvgGroupBox;
    gbDatosExtra: TJvgGroupBox;
    gbFiltrosEmpresa: TJvgGroupBox;
    gbFechaCambio: TGroupBox;
    ImageList: TImageList;
    ImageListSectores: TImageList;
    imgFOTO: TImage;
    imgTelefono: TImage;
    JvAppEvents: TJvAppEvents;
    JvOutlookSplitter1: TJvOutlookSplitter;
    JvOutlookSplitter3: TJvOutlookSplitter;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lblEjecutable: TLabel;
    lblAplicacion: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbAdjuntos2: TJvFileListBox;
    lbGerencia: TLabel;
    lbInterno: TLabel;
    lbRegistroDesde: TLabel;
    lbRegistroHasta: TLabel;
    lbRespondeA: TLabel;
    lbSector: TLabel;
    mnuAbrirCarpetaContenedora: TMenuItem;
    mnuAgregarAdjunto: TMenuItem;
    mnuNoSeleccionarNinguno: TMenuItem;
    mnuPendientes: TMenuItem;
    mnuRemoverAdjunto: TMenuItem;
    mnuSeleccionarTodos: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel12: TPanel;
    Panel14: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel19: TPanel;
    Panel2: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    pmuAdjuntos: TPopupMenu;
    pmuEstados: TPopupMenu;
    pnlAnulado: TPanel;
    pnlCalificacion: TPanel;
    pnlCenter: TPanel;
    pnlEnCurso: TPanel;
    pnlFinalizado: TPanel;
    pnlHistorico1: TPanel;
    pnlHistorico2: TPanel;
    pnlHistorico3: TPanel;
    pnlLeft: TPanel;
    pnlMasInformacion: TPanel;
    pnlNofiltro: TPanel;
    pnlPendienteAutorizacion: TPanel;
    pnlPendienteRealizar: TPanel;
    pnlPermiso: TPanel;
    pnlRechazado: TPanel;
    pnlResolucionVencida: TPanel;
    pnlSinAsignar: TPanel;
    pnlSubFiltros: TPanel;
    pnlSuspendido: TPanel;
    pnlTerminado: TPanel;
    pnlVencido: TPanel;
    sbControles: TScrollBox;
    sdqAdjuntos: TSDQuery;
    sdqAdjuntosadjunto: TStringField;
    sdqAdjuntosAS_FECHAALTA: TDateTimeField;
    sdqAdjuntosAS_FECHABAJA: TDateTimeField;
    sdqAdjuntosAS_IDSOLICITUD: TFloatField;
    sdqAdjuntosAS_RUTAARCHIVO: TStringField;
    sdqAdjuntosAS_USUALTA: TStringField;
    sdqAdjuntosAS_USUBAJA: TStringField;
    sdqDetalle: TSDQuery;
    sdqDetalleHS_FECHACOMPROMETIDA: TDateTimeField;
    sdqDetalleHS_FECHAREANUDACION: TDateTimeField;
    sdqDetalleHS_FECHASOLICITUDREQUERIDA: TDateTimeField;
    sdqDetalleHS_FECHA_CAMBIO: TDateTimeField;
    sdqDetalleHS_IDESTADO: TFloatField;
    sdqDetalleHS_IDMOTIVOSOLICITUD: TFloatField;
    sdqDetalleHS_IDMOTIVOSOLICITUD_PADRE: TFloatField;
    sdqDetalleHS_IDSECTOR_ASIGNADO: TFloatField;
    sdqDetalleHS_IDSOLICITUD: TFloatField;
    sdqDetalleHS_IDUSUARIO: TFloatField;
    sdqDetalleHS_IDUSUARIO_CAMBIO: TFloatField;
    sdqDetalleHS_INDICACIONES: TStringField;
    sdqDetalleHS_NOTAS: TStringField;
    sdqDetalleHS_OBSERVACIONES: TStringField;
    sdqDetalleHS_PRESENCIAL: TStringField;
    sdqDetalleHS_PRIORIDAD: TFloatField;
    sdqDetalleSS_COMENTARIOS_USUARIO: TStringField;
    sdqDetalleSS_FECHACOMPROMETIDA: TDateTimeField;
    sdqDetalleSS_FECHAMODIF: TDateTimeField;
    sdqDetalleSS_FECHAREANUDACION: TDateTimeField;
    sdqDetalleSS_FECHASOLICITUDREQUERIDA: TDateTimeField;
    sdqDetalleSS_FECHA_CARGA: TDateTimeField;
    sdqDetalleSS_FECHA_SOLICITUD: TDateTimeField;
    sdqDetalleSS_ID: TFloatField;
    sdqDetalleSS_IDCALIFICACION: TFloatField;
    sdqDetalleSS_IDEJECUTABLE: TFloatField;
    sdqDetalleSS_IDEQUIPO: TFloatField;
    sdqDetalleSS_IDESTADOACTUAL: TFloatField;
    sdqDetalleSS_IDMOTIVOSOLICITUD: TFloatField;
    sdqDetalleSS_IDSECTOR_ASIGNADO: TFloatField;
    sdqDetalleSS_IDSISTEMATICKET: TFloatField;
    sdqDetalleSS_IDUSUARIO: TFloatField;
    sdqDetalleSS_IDUSUARIO_CARGA: TFloatField;
    sdqDetalleSS_IDUSUARIO_SOLICITUD: TFloatField;
    sdqDetalleSS_IDUSUMODIF: TFloatField;
    sdqDetalleSS_INDICACIONES: TStringField;
    sdqDetalleSS_NOTAS: TStringField;
    sdqDetalleSS_NRO_TICKET: TFloatField;
    sdqDetalleSS_OBSERVACIONES: TStringField;
    sdqDetalleSS_PRESENCIAL: TStringField;
    sdqDetalleSS_PRIORIDAD: TFloatField;
    sdqDetalleSS_RESUELTO: TStringField;
    sdqDetalleTIENE_ADJUNTOS: TStringField;
    sdqDetalleUSUARIO_CAMBIO: TStringField;
    sdqDiscos: TSDQuery;
    sdqDiscosED_ESPACIOLIBRE: TStringField;
    sdqDiscosED_ESPACIOLIBRE_MB: TFloatField;
    sdqDiscosED_ESPACIOOCUPADO: TStringField;
    sdqDiscosED_ESPACIOTOTAL: TStringField;
    sdqDiscosED_ESPACIOTOTAL_MB: TFloatField;
    sdqDiscosED_ETIQUETA: TStringField;
    sdqDiscosED_UNIDAD: TStringField;
    sdqDiscosPORC_LIBRE: TFloatField;
    sdqInfoPC: TSDQuery;
    sdqPedidos: TSDQuery;
    sdqPedidosCALIFICADO: TStringField;
    sdqPedidosCA_DESCRIPCION: TStringField;
    sdqPedidosEQ_DESCRIPCION: TStringField;
    sdqPedidosES_DESCRIPCION: TStringField;
    sdqPedidosMOTIVO_INDICE: TStringField;
    sdqPedidosMOVIMIENTOS: TFloatField;
    sdqPedidosMS_DESCRIPCION: TStringField;
    sdqPedidosRESUELTO: TStringField;
    sdqPedidosSE_DESCRIPCION: TStringField;
    sdqPedidosSE_NOMBRE: TStringField;
    sdqPedidosSS_COMENTARIOS_USUARIO: TStringField;
    sdqPedidosSS_FECHA_CARGA: TDateTimeField;
    sdqPedidosSS_FECHA_SOLICITUD: TDateTimeField;
    sdqPedidosSS_ID: TFloatField;
    sdqPedidosSS_IDCALIFICACION: TFloatField;
    sdqPedidosSS_IDEQUIPO: TFloatField;
    sdqPedidosSS_IDESTADOACTUAL: TFloatField;
    sdqPedidosSS_IDMOTIVOSOLICITUD: TFloatField;
    sdqPedidosSS_IDSECTOR_ASIGNADO: TFloatField;
    sdqPedidosSS_IDUSUARIO: TFloatField;
    sdqPedidosSS_IDUSUARIO_CARGA: TFloatField;
    sdqPedidosSS_IDUSUARIO_SOLICITUD: TFloatField;
    sdqPedidosSS_NOTAS: TStringField;
    sdqPedidosSS_OBSERVACIONES: TStringField;
    sdqPedidosSS_PRESENCIAL: TStringField;
    sdqPedidosSS_PRIORIDAD: TFloatField;
    sdqPedidosSS_RESUELTO: TStringField;
    sdqPedidosTIENE_ADJUNTOS: TStringField;
    sdqPedidosUSUARIO_ACTIVO: TStringField;
    sdqSoftwareInstalado: TSDQuery;
    sduDetalle: TSDUpdateSQL;
    ShortCutControlHijo: TShortCutControl;
    Splitter2: TJvOutlookSplitter;
    Splitter3: TJvOutlookSplitter;
    Splitter4: TJvOutlookSplitter;
    tbAnterior: TToolButton;
    tbAnular: TToolButton;
    tbArbolSectores: TToolButton;
    tbCerrarTicket: TToolButton;
    tbImprimirTicket: TToolButton;
    tbMails: TToolButton;
    tbNavegador: TToolBar;
    tbPrimero: TToolButton;
    tbSeparador1: TToolButton;
    tbSeparador2: TToolButton;
    tbSiguiente: TToolButton;
    tbSolicitarAutorizacion: TToolButton;
    tbUltimo: TToolButton;
    TimerGrilla: TTimer;
    ToolBarSectores: TToolBar;
    ToolPanelTab: TAdvToolPanelTab;
    tsAdjuntos: TAdvToolPanel;
    tsIntranet: TAdvToolPanel;
    tsPC: TAdvToolPanel;
    tsPedidos: TAdvToolPanel;
    tsSoftwareInstalado: TAdvToolPanel;
    tsUsuario: TAdvToolPanel;
    wbIntranet: TWebBrowser;
    pnlAutorizado: TPanel;
    tbCambioEjecutableTk: TToolButton;
    tbCambioEjecutablePl: TToolButton;
    tbSeparador3: TToolButton;
    fpCambioEjecutable: TFormPanel;
    Bevel2: TBevel;
    Label17: TLabel;
    btnAceptarCambioEjec: TButton;
    btnCancelarCambioEjec: TButton;
    fraEjecutable: TfraCodigoDescripcion;
    pmnuPropiedades: TPopupMenu;
    mnuPropiedadesGrid: TMenuItem;
    dbgParametrosOracle: TJvDBGrid;
    sdqParametrosOracle: TSDQuery;
    dsParametrosOracle: TDataSource;
    pnlTotales: TPanel;
    Panel3: TPanel;
    pnlCantidadTickets: TPanel;
    lbTotal: TLabel;
    Panel13: TPanel;
    Panel15: TPanel;
    pnlViendo: TPanel;
    lbTickets1: TLabel;
    Label18: TLabel;
    Panel1: TPanel;
    Panel11: TPanel;
    sdqAdjuntosAS_TIPO: TStringField;
    sdqAdjuntosSE_NOMBRE: TStringField;
    sdqAdjuntosTIPO: TStringField;
    mnuCrearDependencia: TMenuItem;
    mnuMisTickets: TMenuItem;
    mnuOtrosTickets: TMenuItem;
    AdvPanelStyler: TAdvPanelStyler;
    mnuAdjuntoVisible: TMenuItem;
    mnuAdjuntoInterno: TMenuItem;
    mnuDependenciaTicket: TMenuItem;
    cxHintStyleController1: TcxHintStyleController;
    StatusBar: TStatusBar;
    fpDependencia: TFormPanel;
    Bevel3: TBevel;
    Label39: TLabel;
    Label40: TLabel;
    btnAceptarDep: TButton;
    btnCancelarDep: TButton;
    edObservacionesDep: TMemo;
    edNroTicketDep: TIntEdit;
    Label41: TLabel;
    edMotivoDep: TEdit;
    pnlPlanificacionABM: TPanel;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label43: TLabel;
    edDIAS_RESOLUCION: TIntEdit;
    edHORAS_RESOLUCION: TIntEdit;
    edMINUTOS_RESOLUCION: TIntEdit;
    Label49: TLabel;
    sdqDetalleSS_PLAZO_ESTIMADO_USUARIO: TFloatField;
    sdqDetalleSS_FECHA_INICIO_PROBABLE: TDateTimeField;
    sdqDetalleSS_FECHA_FIN_PROBABLE: TDateTimeField;
    sdqDetalleHS_PLAZO_ESTIMADO_USUARIO: TFloatField;
    sdqDetalleHS_FECHA_INICIO_PROBABLE: TDateTimeField;
    sdqDetalleHS_FECHA_FIN_PROBABLE: TDateTimeField;
    sdqDetalleDIAS_RESOLUCION: TFloatField;
    sdqDetalleHORAS_RESOLUCION: TFloatField;
    sdqDetalleMINUTOS_RESOLUCION: TFloatField;
    AdvToolPanelDependencias: TAdvToolPanel;
    sdqDependencias: TSDQuery;
    dsDependencias: TDataSource;
    sdqDependenciasDT_ID: TFloatField;
    sdqDependenciasDT_IDTICKET: TFloatField;
    sdqDependenciasDT_IDTICKET_PADRE: TFloatField;
    sdqDependenciasDT_FECHAALTA: TDateTimeField;
    sdqDependenciasDT_USUALTA: TStringField;
    sdqDependenciasSE_NOMBRE: TStringField;
    sdqDependenciasMS_DESCRIPCION: TStringField;
    sdqDependenciasSS_NRO_TICKET: TFloatField;
    sdqDependenciasSS_NOTAS: TStringField;
    pnlPlanificacion: TPanel;
    Panel22: TPanel;
    JvOutlookSplitter2: TJvOutlookSplitter;
    edInicioProbable: TDBDateEdit;
    edFinProbable: TDBDateEdit;
    Label52: TLabel;
    Label51: TLabel;
    Label50: TLabel;
    pmuDependencias: TPopupMenu;
    mnuRemoverDependencia: TMenuItem;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    edHS_FECHA_INICIO_PROBABLE: TDBDateEdit;
    edHS_FECHA_FIN_PROBABLE: TDBDateEdit;
    edHORA_INICIO_PROBABLE: TJvDBDateTimePicker;
    edHORA_FIN_PROBABLE: TJvDBDateTimePicker;
    sdqDetalleHORA_INICIO_PROBABLE: TDateTimeField;
    sdqDetalleHORA_FIN_PROBABLE: TDateTimeField;
    Panel5: TPanel;
    Panel6: TPanel;
    cblES_ID: TARTCheckListBox;
    pnlDerecha: TJvPanel;
    calSS_FECHA_SOLICITUD: TJvMonthCalendar;
    edSS_FECHA_SOLICITUDHasta: TDateComboBox;
    edSS_FECHA_SOLICITUDDesde: TDateComboBox;
    Label9: TLabel;
    Label8: TLabel;
    rgPlan: TAdvOfficeRadioGroup;
    Label53: TLabel;
    fraID_SECTOR_USUARIO_SOLICITUD: TfraCodDesc;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    edDias: TDBEdit;
    edHoras: TDBEdit;
    edMinutos: TDBEdit;
    edHoraInicioProbable: TJvDBDateTimePicker;
    edHoraFinProbable: TJvDBDateTimePicker;
    pnlDependenciasInvisible: TPanel;
    DBAdvCardListDependencias: TDBAdvCardList;
    pnlAdjuntosInvisible: TPanel;
    DBAdvCardListAdjuntos: TDBAdvCardList;
    procedure btnAceptarUsuarioClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnClearCalificacionClick(Sender: TObject);
    procedure btnClearSectorClick(Sender: TObject);
    procedure btnClearUserClick(Sender: TObject);
    procedure calSS_FECHA_SOLICITUDClick(Sender: TObject);
    procedure CargoConsultasAdicionales(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure CargoDatos(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
    procedure ControlFiltroSolicitud(Sender: TObject);
    procedure ControlFiltroUsuario(Sender: TObject);
    procedure ControlSolicitud(Sender: TObject);
    procedure ControlUsuario(Sender: TObject);
    procedure dbgDiscosGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure dbgHistoricoPedidosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dsDetalleUpdateData(Sender: TObject);
    procedure edSS_NRO_TICKETKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure fraCA_IDPropiedadesChange(Sender: TObject);
    procedure fraHS_IDMOTIVOSOLICITUDPropiedadesChange(Sender: TObject);
    procedure fraHS_IDUSUARIOPropiedadesChange(Sender: TObject);
    procedure fraHS_IDUSUARIO_SOLICITUDPropiedadesChange(Sender: TObject);
    procedure fraHS_PRIORIDADcmbDescripcionDropDown(Sender: TObject);
    procedure fraSS_IDESTADOACTUALPropiedadesChange(Sender: TObject);
    procedure fraSS_IDUSUARIOPropiedadesChange(Sender: TObject);
    procedure FSFormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure GridAdjuntosGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Guardar(Sender: TObject);
    procedure JvAppEventsIdle(Sender: TObject; var Done: Boolean);
    procedure mnuAbrirCarpetaContenedoraClick(Sender: TObject);
    procedure mnuNoSeleccionarNingunoClick(Sender: TObject);
    procedure mnuPendientesClick(Sender: TObject);
    procedure mnuRemoverAdjuntoClick(Sender: TObject);
    procedure mnuSeleccionarTodosClick(Sender: TObject);
    procedure pmuAdjuntosPopup(Sender: TObject);
    procedure RefreshGrid(Sender: TObject);
    procedure RevisoCalendario(Sender: TObject);
    procedure sdqAdjuntosCalcFields(DataSet: TDataSet);
    procedure sdqConsultaAfterClose(DataSet: TDataSet);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqDetalleAfterOpen(DataSet: TDataSet);
    procedure sdqDetalleAfterScroll(DataSet: TDataSet);
    procedure sdqDetalleBeforeScroll(DataSet: TDataSet);
    procedure sdqDiscosAfterOpen(DataSet: TDataSet);
    procedure sdqPedidosAfterOpen(DataSet: TDataSet);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbAnularClick(Sender: TObject);
    procedure tbArbolSectoresClick(Sender: TObject);
    procedure tbCerrarTicketClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbImprimirTicketClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbMailsClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbPrimeroClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure tbSiguienteClick(Sender: TObject);
    procedure tbSolicitarAutorizacionClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure TimerGrillaTimer(Sender: TObject);
    procedure DoCambiarEjecutable(Sender: TObject);
    procedure btnAceptarCambioEjecClick(Sender: TObject);
    procedure fpCambioEjecutableEnter(Sender: TObject);
    procedure mnuPropiedadesGridClick(Sender: TObject);
    procedure sdqParametrosOracleAfterOpen(DataSet: TDataSet);
    procedure AbrirAdjunto(Sender: TObject; Card: TAdvCard);
    procedure DBAdvCardListAdjuntosDrawCardItemProp(Sender: TObject; Card: TAdvCard; Item: TAdvCardItem; AFont: TFont; ABrush: TBrush);
    procedure pmnuPropiedadesPopup(Sender: TObject);
    procedure mnuAdjuntoInternoClick(Sender: TObject);
    procedure mnuAdjuntoVisibleClick(Sender: TObject);
    procedure mnuDependenciaTicketClick(Sender: TObject);
    procedure edNroTicketDepExit(Sender: TObject);
    procedure btnAceptarDepClick(Sender: TObject);
    procedure mnuRemoverDependenciaClick(Sender: TObject);
    procedure pmuDependenciasPopup(Sender: TObject);
    procedure RecalcularFechas(Sender: TObject);
    procedure lbAdjuntos2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormActivate(Sender: TObject);
  private
    FHomeDirectory, FStorageDirectory, FPrefijoAsuntoMail: String;
    FPathNulo, FMaskNula: String;
    FSQL: String;
    FSQLPrioridad: String;
    FMotivoPadreExtraCondition, FMotivosExtraCondition, FUsuariosExtraCondition: String;
    FIdSistemaTicket: Integer;
    FRefreshing: Boolean;
    procedure ActualizarTicket(AEstado: Integer; AObservaciones: String; AConTrans: Boolean = True);
    procedure ChequearNavegador;
    function  GetMinActiveDate: TDate;
    function  GetUsuarioAutorizacion: String; overload;
    function  GetUsuarioAutorizacion(AIdSolicitud: Integer): String; overload;
    function  GetUsuarioAutorizacion(IdUsuario, IdNivel: Integer): String; overload;
    function  IsAuthorizedTicket(AIdSolicitud: Integer): Boolean;
    function  ProcesarTicket(APregunta: String; AEstado: Integer; AObservaciones: String = ''): Boolean;
    procedure VerControles;
    procedure VerEstados;
    procedure VerPermiso;
    procedure Adjuntar(ATipo: String);
    procedure mnuTicketClick(Sender: TObject);
    procedure EstablecerDependencia(ATicket: Integer = 0);
  protected
    procedure EnableButtons(AEnabled: Boolean); override;
    function  GetRefreshing: Boolean; override;
  public
    procedure AfterConstruction; override;
    procedure RefreshData; override;
    function Validar: Boolean;
  end;

var
  frmGestionSistemas: TfrmGestionSistemas;

implementation

uses
  VCLExtra, CustomDlgs, unFiltros, unDmPrincipal, unArbolSectores, AnsiSql, SqlFuncs, unPropiedadesFrame, unSesion,
  General, Strfuncs, unArt, ArchFuncs, ShellAPI, unGrids, unRptTicket,
  unVisualizador, unElementosEnviadosGlobal, DateTimeFuncs, unSistemas, Numeros,
  unAltaSolicitudesCambioExe, unComunes;

{$R *.dfm}

procedure TfrmGestionSistemas.btnAceptarUsuarioClick(Sender: TObject);
begin
  Verificar(fraUsuarioAutorizacion.IsEmpty, fraUsuarioAutorizacion.edCodigo, 'Debe seleccionar un usuario.');
  Verificar(Length(Trim(edMotivoAutorizacion.Lines.Text)) < 3, edMotivoAutorizacion, 'Debe indicar el motivo de la solicitud de autorización, al menos una breve explicación.');
  fpAutorizacion.ModalResult := mrOk;
end;

procedure TfrmGestionSistemas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if sdqDetalle.Active then
    sdqDetalle.CancelUpdates;
  RollBackUpdates;
  Rollback(True);
  EjecutarSQL('ROLLBACK');
  fpABM.ModalResult := mrCancel;
end;

procedure TfrmGestionSistemas.btnClearCalificacionClick(Sender: TObject);
begin
  fraCA_ID.Clear;
  btnClearCalificacion.Enabled := False;
  RefreshData;
end;

procedure TfrmGestionSistemas.btnClearSectorClick(Sender: TObject);
begin
  fraSS_IDSECTOR_ASIGNADO.Clear;
  btnClearSector.Enabled := False;
  fraSS_IDUSUARIO.Clear;
  btnClearUser.Enabled := False;
  RefreshData;
end;

procedure TfrmGestionSistemas.btnClearUserClick(Sender: TObject);
begin
  fraSS_IDUSUARIO.Clear;
  btnClearUser.Enabled := False;
  RefreshData;
end;

procedure TfrmGestionSistemas.calSS_FECHA_SOLICITUDClick(Sender: TObject);
begin
  inherited;
  edSS_FECHA_SOLICITUDDesde.Date := calSS_FECHA_SOLICITUD.Date;
  edSS_FECHA_SOLICITUDHasta.Date := calSS_FECHA_SOLICITUD.Date;

  if calSS_FECHA_SOLICITUD.Enabled then
    RefreshGrid(Sender);
end;

procedure TfrmGestionSistemas.CargoConsultasAdicionales(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
begin
  inherited;
  if (APanel = AdvToolPanelAdjuntos) or (APanel = AdvToolPanelDependencias) then
    sdqConsultaAfterScroll(sdqConsulta);
end;

procedure TfrmGestionSistemas.CargoDatos(Sender: TObject; Index: Integer; APanel: TAdvToolPanel);
var
  sFoto: String;
begin
  inherited;
  if APanel = tsUsuario then
  begin
    if fraHS_IDUSUARIO_SOLICITUD.IsSelected then
    begin
      sFoto := FStorageDirectory + 'fotos_personales\' + fraHS_IDUSUARIO_SOLICITUD.Codigo + '.jpg';
      if FileExists(sFoto) then
        imgFOTO.Picture.LoadFromFile(sFoto)
      else
        imgFOTO.Picture.LoadFromFile(FHomeDirectory + 'Images\Fotos\cartel.jpg');

      lbSector.Caption := fraHS_IDUSUARIO_SOLICITUD.sdqDatos.FieldByName('SECTOR').AsString;
      lbGerencia.Caption := fraHS_IDUSUARIO_SOLICITUD.sdqDatos.FieldByName('GERENCIA').AsString;
      lbInterno.Caption := fraHS_IDUSUARIO_SOLICITUD.sdqDatos.FieldByName('SE_INTERNO').AsString;
      lbRespondeA.Caption := fraHS_IDUSUARIO_SOLICITUD.sdqDatos.FieldByName('JEFE').AsString;      
    end else
    begin
      imgFOTO.Picture.LoadFromFile(FHomeDirectory + 'Images\Fotos\cartel.jpg');
      lbSector.Caption := '';                                                     
      lbGerencia.Caption := '';
      lbInterno.Caption := '';
      lbRespondeA.Caption := '';
    end;
    imgFOTO.Refresh;
  end;
  if APanel = tsIntranet then
  begin
    if fraHS_IDUSUARIO_SOLICITUD.IsSelected then
      wbIntranet.Navigate('http://www.artprov.com.ar/Modules/buscar_usuarios/informacion.php?id=' + fraHS_IDUSUARIO_SOLICITUD.sdqDatos.FieldByName('ID').AsString);
    wbIntranet.Width := fpAbm.Width - 48;
  end;
  if APanel = tsPedidos then
  begin
    OpenQueryEx(sdqPedidos, [fraHS_IDUSUARIO_SOLICITUD.Codigo, FIdSistemaTicket]);
  end;
  if APanel = tsPC then
  begin
    OpenQueryEx(sdqInfoPC, [fraSS_IDEQUIPO.Codigo]);
    OpenQueryEx(sdqDiscos, [fraSS_IDEQUIPO.Codigo]);
    OpenQueryEx(sdqParametrosOracle, [fraSS_IDEQUIPO.Codigo]);
  end;
  if APanel = tsSoftwareInstalado then
  begin
    OpenQueryEx(sdqSoftwareInstalado, [fraSS_IDEQUIPO.Codigo]);
  end;
  if APanel = tsAdjuntos then
  begin
    sdqConsultaAfterScroll(nil);
  end;
end;

procedure TfrmGestionSistemas.ControlFiltroSolicitud(Sender: TObject);
begin
  if fraFiltroMotivoPadre.IsSelected then
    fraFiltroMotivoDetalle.Propiedades.ExtraCondition := FMotivosExtraCondition + ' AND MS_IDPADRE = ' + SQLValue(fraFiltroMotivoPadre.Codigo)
  else
    fraFiltroMotivoDetalle.Propiedades.ExtraCondition := FMotivosExtraCondition + ' AND MS_IDPADRE > 0 ';

  if fraFiltroMotivoPadre.IsSelected and fraFiltroMotivoDetalle.IsSelected
  and (fraFiltroMotivoPadre.Codigo <> fraFiltroMotivoDetalle.sdqDatos.FieldByName('MS_IDPADRE').AsString) then
    fraFiltroMotivoDetalle.Clear;

  fraFiltroMotivoDetalle.cmbDescripcionDropDown(Sender);
  if TComponent(Sender).Owner <> fraFiltroMotivoDetalle then
    RefreshGrid(Sender);
end;

procedure TfrmGestionSistemas.ControlFiltroUsuario(Sender: TObject);
begin
  btnClearSector.Enabled := fraSS_IDSECTOR_ASIGNADO.IsSelected;
  inherited;

  with fraSS_IDUSUARIO.Propiedades do
  begin
    ExtraCondition := FUsuariosExtraCondition +
                      ' AND ((se_fechabaja is null) or (se_fechabaja > art.actualdate - 365)) ' +
                      ' AND se_usuariogenerico = ''N'' ';
      
    if fraSS_IDSECTOR_ASIGNADO.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTOR = ' + SQLValue(fraSS_IDSECTOR_ASIGNADO.Codigo)
    else
      ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT USUARIOS.SE_ID ' +
                                                         ' FROM ART.USE_USUARIOS USUARIOS ' +
                                                        ' WHERE USUARIOS.SE_IDSECTOR IN (SELECT SECTOR.SE_ID ' +
                                                                                         ' FROM COMPUTOS.CSE_SECTOR SECTOR, COMPUTOS.CSU_SECTORUSUARIO ' +
                                                                                        ' WHERE ART.AGENDA_PKG.IS_SECTORDEPENDIENTE(SU_IDSECTOR, SECTOR.SE_ID) = ''S'')) ' +
                                         ' AND SE_IDSECTOR > 0 ';
  end;
  
  if fraSS_IDSECTOR_ASIGNADO.IsSelected and fraSS_IDUSUARIO.IsSelected
  and (fraSS_IDSECTOR_ASIGNADO.Codigo <> fraSS_IDUSUARIO.sdqDatos.FieldByName('SE_IDSECTOR').AsString)
  and (not fraSS_IDUSUARIO.IsEmpty) then
    fraSS_IDUSUARIO.Clear;

  fraSS_IDUSUARIO.cmbDescripcionDropDown(Sender);
end;

procedure TfrmGestionSistemas.ControlSolicitud(Sender: TObject);
begin
  inherited;
  if fraSS_IDMOTIVOSOLICITUD.IsSelected then
    fraHS_IDMOTIVOSOLICITUD.Propiedades.ExtraCondition := FMotivosExtraCondition + ' AND MS_IDPADRE = ' + SQLValue(fraSS_IDMOTIVOSOLICITUD.Codigo)
  else
    fraHS_IDMOTIVOSOLICITUD.Propiedades.ExtraCondition := FMotivosExtraCondition + ' AND MS_IDPADRE > 0 ';

  if fraSS_IDMOTIVOSOLICITUD.IsSelected and fraHS_IDMOTIVOSOLICITUD.IsSelected
  and (fraSS_IDMOTIVOSOLICITUD.Codigo <> fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_IDPADRE').AsString) then
    fraHS_IDMOTIVOSOLICITUD.Clear;

  fraHS_IDMOTIVOSOLICITUD.cmbDescripcionDropDown(Sender);
end;

procedure TfrmGestionSistemas.ControlUsuario(Sender: TObject);
var
  nIdUsuario: Integer;
begin
  nIdUsuario := fraHS_IDUSUARIO.Value;
  with fraHS_IDUSUARIO.Propiedades do
  begin
    ExtraCondition := FUsuariosExtraCondition +
                      iif(tbSiguiente.Enabled, '', ' AND ((se_fechabaja is null) or (se_fechabaja > art.actualdate - 365)) ') +
                      ' AND se_usuariogenerico = ''N'' ';

    if fraHS_IDSECTOR_ASIGNADO.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTOR IN (' + SqlNumber(fraHS_IDSECTOR_ASIGNADO.Codigo) + iif(not sdqDetalle.IsEmpty,  ', ' + SqlNumber(sdqDetalle.FieldByName('hs_idsector_asignado').AsString), SQL_NULL) + ')'
    else
      ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT USUARIOS.SE_ID ' +
                                                         ' FROM ART.USE_USUARIOS USUARIOS ' +
                                                        ' WHERE USUARIOS.SE_IDSECTOR IN (SELECT SECTOR.SE_ID ' +
                                                                                         ' FROM COMPUTOS.CSE_SECTOR SECTOR, COMPUTOS.CSU_SECTORUSUARIO ' +
                                                                                        ' WHERE ART.AGENDA_PKG.IS_SECTORDEPENDIENTE(SU_IDSECTOR, SECTOR.SE_ID) = ''S'')) ' +
                                         ' AND SE_IDSECTOR > 0 ';
  end;

  if nIdUsuario > 0 then
    fraHS_IDUSUARIO.Value := nIdUsuario;

  if fraHS_IDUSUARIO.IsEmpty and (not sdqDetalle.IsEmpty) and (not sdqDetalle.FieldByName('hs_idusuario').IsNull) then
    fraHS_IDUSUARIO.Value := sdqDetalle.FieldByName('hs_idusuario').AsInteger;

  if fraHS_IDSECTOR_ASIGNADO.IsSelected and fraHS_IDUSUARIO.IsSelected
  and (fraHS_IDSECTOR_ASIGNADO.Codigo <> fraHS_IDUSUARIO.sdqDatos.FieldByName('SE_IDSECTOR').AsString) then
    fraHS_IDUSUARIO.Clear;

  if Assigned(Sender) then
    fraHS_IDUSUARIO.cmbDescripcionDropDown(Sender);
end;

procedure TfrmGestionSistemas.AbrirAdjunto(Sender: TObject; Card: TAdvCard);
begin
  if FileExists(sdqAdjuntos.FieldByName('AS_RUTAARCHIVO').AsString) then
    ShellExecute(Application.Handle,nil,PChar(sdqAdjuntos.FieldByName('AS_RUTAARCHIVO').AsString),'','',SW_SHOWNORMAL);
end;

procedure TfrmGestionSistemas.DBAdvCardListAdjuntosDrawCardItemProp(Sender: TObject; Card: TAdvCard; Item: TAdvCardItem; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if (not sdqAdjuntos.IsEmpty) and (not sdqAdjuntosAS_FECHABAJA.IsNull) then
  begin
    AFont.Style := AFont.Style + [fsStrikeOut];
    AFont.Color := clMaroon;
  end;
end;

procedure TfrmGestionSistemas.dbgDiscosGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  if sdqDiscosPORC_LIBRE.AsInteger > 90 then
    AFont.Color := clNavy
  else if sdqDiscosPORC_LIBRE.AsInteger > 50 then
    AFont.Color := clTeal
  else if sdqDiscosPORC_LIBRE.AsInteger < 5 then
    AFont.Color := clRed
  else if sdqDiscosPORC_LIBRE.AsInteger < 10 then
    AFont.Color := clMaroon
  else
    AFont.Color := clBlack
end;

procedure TfrmGestionSistemas.dbgHistoricoPedidosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if AreIn(Field.FullName, ['RESUELTO', 'CALIFICADO', 'TIENE_ADJUNTOS']) then
  begin
    AFont.Style := AFont.Style + [fsBold];
    if (Field.Value = vSI) then
      AFont.Color := clTeal
    else
      AFont.Color := clMaroon;
  end;
end;

procedure TfrmGestionSistemas.dsDetalleUpdateData(Sender: TObject);
begin
  inherited;
  with sdqDetalle do
  begin
    FieldByName('SS_IDUSUARIO_SOLICITUD').Value        := fraHS_IDUSUARIO_SOLICITUD.Value;
    FieldByName('HS_IDSECTOR_ASIGNADO').AsString       := fraHS_IDSECTOR_ASIGNADO.Codigo;
    FieldByName('SS_IDMOTIVOSOLICITUD').AsString       := fraHS_IDMOTIVOSOLICITUD.Codigo;
    FieldByName('HS_IDMOTIVOSOLICITUD').AsString       := fraHS_IDMOTIVOSOLICITUD.Codigo;
    FieldByName('SS_IDEQUIPO').AsString                := fraSS_IDEQUIPO.Codigo;
    FieldByName('SS_IDEJECUTABLE').AsString            := fraSS_IDEJECUTABLE.Codigo;
    FieldByName('HS_IDESTADO').AsString                := fraSS_IDESTADOACTUAL.Codigo;
    FieldByName('SS_IDESTADOACTUAL').AsString          := fraSS_IDESTADOACTUAL.Codigo;
    FieldByName('HS_PRIORIDAD').AsString               := fraHS_PRIORIDAD.Codigo;
    FieldByName('SS_PRIORIDAD').AsString               := fraHS_PRIORIDAD.Codigo;
    FieldByName('SS_FECHA_SOLICITUD').AsDateTime       := edSS_FECHA_SOLICITUD.Date;
    FieldByName('SS_IDUSUARIO').AsString               := fraHS_IDUSUARIO.Id;
    FieldByName('SS_IDUSUMODIF').AsInteger             := Sesion.ID;
    FieldByName('SS_FECHAMODIF').AsDateTime            := DBDateTime;
    FieldByName('HS_FECHACOMPROMETIDA').AsDateTime     := edHS_FECHACOMPROMETIDA.Date + edHS_HORACOMPROMETIDA.DateTime - Trunc(edHS_HORACOMPROMETIDA.DateTime);
    FieldByName('HS_FECHAREANUDACION').AsDateTime      := edHS_FECHAREANUDACION.Date + edHS_HORAREANUDACION.DateTime - Trunc(edHS_HORAREANUDACION.DateTime);
    FieldByName('SS_PLAZO_ESTIMADO_USUARIO').AsInteger := ConvertToMinutes(edDIAS_RESOLUCION.Value, edHORAS_RESOLUCION.Value, edMINUTOS_RESOLUCION.Value);
    FieldByName('HS_PLAZO_ESTIMADO_USUARIO').AsInteger := ConvertToMinutes(edDIAS_RESOLUCION.Value, edHORAS_RESOLUCION.Value, edMINUTOS_RESOLUCION.Value);
    FieldByName('SS_FECHA_INICIO_PROBABLE').AsDateTime := edHS_FECHA_INICIO_PROBABLE.Date + edHORA_INICIO_PROBABLE.Time - Trunc(edHORA_INICIO_PROBABLE.Time);
    FieldByName('HS_FECHA_INICIO_PROBABLE').AsDateTime := edHS_FECHA_INICIO_PROBABLE.Date;
    FieldByName('SS_FECHA_FIN_PROBABLE').AsDateTime    := edHS_FECHA_FIN_PROBABLE.Date + edHORA_FIN_PROBABLE.Time - Trunc(edHORA_FIN_PROBABLE.Time);
    FieldByName('HS_FECHA_FIN_PROBABLE').AsDateTime    := edHS_FECHA_FIN_PROBABLE.Date;

    if edHS_FECHACOMPROMETIDA.Date = 0 then
      FieldByName('HS_FECHACOMPROMETIDA').Value := Null;
    if edHS_FECHAREANUDACION.Date = 0 then
      FieldByName('HS_FECHAREANUDACION').Value := Null;
  end;
end;

procedure TfrmGestionSistemas.RecalcularFechas(Sender: TObject);
begin
  inherited;
  if (edHS_FECHA_INICIO_PROBABLE.Date > 0) and (edHORA_INICIO_PROBABLE.Time = 0) and edHORA_INICIO_PROBABLE.Enabled then
    edHORA_INICIO_PROBABLE.Time := 10/24; //10 a.m.

  if (Sender <> edHORA_FIN_PROBABLE) then
  begin
    if edHORAS_RESOLUCION.Value + edMINUTOS_RESOLUCION.Value = 0 then
      edHORA_FIN_PROBABLE.Time := edHORA_INICIO_PROBABLE.Time
    else
      edHORA_FIN_PROBABLE.Time := edHORA_INICIO_PROBABLE.Time + (edHORAS_RESOLUCION.Value / 24) + (edMINUTOS_RESOLUCION.Value / 24/ 60);

    if (edHS_FECHA_FIN_PROBABLE.Date > 0) and (edHORA_FIN_PROBABLE.Time = 0) and edHORA_FIN_PROBABLE.Enabled then
      edHORA_FIN_PROBABLE.Time := edHORA_INICIO_PROBABLE.Time;
  end;

  if ((Sender = edDIAS_RESOLUCION) or (Sender = edHORAS_RESOLUCION) or (Sender = edMINUTOS_RESOLUCION) or (Sender = edHS_FECHA_INICIO_PROBABLE))
  and (edHS_FECHA_INICIO_PROBABLE.Date > 0) and (Length(StringReplace(edHS_FECHA_INICIO_PROBABLE.Text, ' ', '', [rfReplaceAll])) = 10) and (IsValidDate(edHS_FECHA_INICIO_PROBABLE.Text, 'dd/mm/yyyy')) and (not edHS_FECHA_FIN_PROBABLE.ReadOnly) then
  begin
    edHS_FECHA_FIN_PROBABLE.Date := MaxDate(edHS_FECHA_INICIO_PROBABLE.Date, CalcDiasHabiles(edHS_FECHA_INICIO_PROBABLE.Date, edDIAS_RESOLUCION.Value));
    edHORA_FIN_PROBABLE.Date := edHORA_INICIO_PROBABLE.Date;
  end;

  if (Sender = edHS_FECHA_FIN_PROBABLE)
  and (edHS_FECHA_FIN_PROBABLE.Date > 0) and (Length(StringReplace(edHS_FECHA_FIN_PROBABLE.Text, ' ', '', [rfReplaceAll])) = 10) and (not edHS_FECHA_INICIO_PROBABLE.ReadOnly) then
    edHS_FECHA_INICIO_PROBABLE.Date := MinDate(edHS_FECHA_FIN_PROBABLE.Date, CalcDiasHabiles(edHS_FECHA_FIN_PROBABLE.Date, -1 * edDIAS_RESOLUCION.Value));
end;

procedure TfrmGestionSistemas.edNroTicketDepExit(Sender: TObject);
begin
  with GetQueryEx('SELECT ss_notas, ms_descripcion ' +
                    'FROM computos.css_solicitudsistemas, computos.cms_motivosolicitud ' +
                   'WHERE ss_idmotivosolicitud = ms_id ' +
                     'AND ss_nro_ticket = :id ' +
                     'AND ss_idsistematicket = :sistema', [edNroTicketDep.Value, FIdSistemaTicket]) do
  try
    if not IsEmpty then
    begin
      edObservacionesDep.Text := Fields[0].AsString;
      edMotivoDep.Text := Fields[1].AsString;
    end;
  finally
    Free;
  end;
end;

procedure TfrmGestionSistemas.edSS_NRO_TICKETKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    RefreshData;
end;

procedure TfrmGestionSistemas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {
  DBAdvCardListDependencias.Parent := pnlDependenciasInvisible;
  DBAdvCardListAdjuntos.Parent     := pnlAdjuntosInvisible;

  DBAdvCardListDependencias.Free;
  DBAdvCardListAdjuntos.Free;

  AdvToolPanelDependencias.Free;
  AdvToolPanelAdjuntos.Free;

  AdvToolPanelTab.Free;
  }
  inherited;
end;

procedure TfrmGestionSistemas.FormCreate(Sender: TObject);
var
  bEsDesarrollo: Boolean;
begin
  FRefreshing := False;
  FIdSistemaTicket := GetIdSistemaTicket();
  case FIdSistemaTicket of
    2: begin
         Grid.ColumnByField['EJ_DESCRIPCION'].Free;
         lblEjecutable.Enabled := False;
         tsSoftwareInstalado.Free;
         tsPC.Free;
       end;
    3: tsIntranet.OpenWidth := 0;
  end;
  FPrefijoAsuntoMail := ValorSQLEx('SELECT st_prefijo_asunto_mail FROM computos.cst_sistematicket WHERE st_id = :id', [FIdSistemaTicket]);

  VCLExtra.LockControls([fraEJ_ID], FIdSistemaTicket = 2);
  lblAplicacion.Enabled := FIdSistemaTicket <> 2;

  FMotivoPadreExtraCondition := 'AND ms_idpadre = -1 ' +
                                'AND ms_id IN (SELECT ms_idpadre ' +
                                                'FROM computos.cms_motivosolicitud, computos.cts_ticketsector ' +
                                               'WHERE art.agenda_pkg.is_sectordependiente(ts_idsector, ms_idsectordefault) = ''S'' ' +
                                                 'AND ts_idsistematicket = ' + SqlValue(FIdSistemaTicket) + ')';
  fraFiltroMotivoPadre.Propiedades.ExtraCondition := FMotivoPadreExtraCondition;
  fraSS_IDMOTIVOSOLICITUD.Propiedades.ExtraCondition := FMotivoPadreExtraCondition;

  FMotivosExtraCondition := 'AND ms_id IN (SELECT ms_id ' +
                                            'FROM computos.cms_motivosolicitud, computos.cts_ticketsector ' +
                                           'WHERE art.agenda_pkg.is_sectordependiente(ts_idsector, ms_idsectordefault) = ''S'' ' +
                                             'AND ts_idsistematicket = ' + SqlValue(FIdSistemaTicket) + ')';

  FUsuariosExtraCondition := 'AND se_idsector IN (SELECT sector2.se_id ' +
                                                   'FROM computos.cse_sector sector2, computos.cts_ticketsector, computos.cse_sector sector, computos.csu_sectorusuario, ' +
                                                        'art.use_usuarios users ' +
                                                  'WHERE users.se_usuario = ' + SQLValue(Sesion.UserID) + ' ' +
                                                    'AND art.agenda_pkg.is_sectordependiente(su_idsector, users.se_idsector) = ''S'' ' +
                                                    'AND art.agenda_pkg.is_sectordependiente(su_idsector, sector.se_id) = ''S'' ' +
                                                    'AND art.agenda_pkg.is_sectordependiente(ts_idsector, sector2.se_id) = ''S'' ' +
                                                    'AND ts_idsistematicket = ' + SqlValue(FIdSistemaTicket) + ')';

  fraSS_IDSECTOR_ASIGNADO.Propiedades.ExtraCondition := 'AND se_nivel = 4 ' +
                                                        'AND se_id IN (SELECT sector2.se_id ' +
                                                                        'FROM computos.cse_sector sector2, computos.cts_ticketsector, computos.cse_sector sector, computos.csu_sectorusuario, ' +
                                                                             'art.use_usuarios users ' +
                                                                       'WHERE users.se_usuario = ' + SQLValue(Sesion.UserID) + ' ' +
                                                                         'AND art.agenda_pkg.is_sectordependiente(su_idsector, users.se_idsector) = ''S'' ' +
                                                                         'AND art.agenda_pkg.is_sectordependiente(su_idsector, sector.se_id) = ''S'' ' +
                                                                         'AND art.agenda_pkg.is_sectordependiente(ts_idsector, sector2.se_id) = ''S'' ' +
                                                                         'AND ts_idsistematicket = ' + SqlValue(FIdSistemaTicket) + ')';
  fraHS_IDSECTOR_ASIGNADO.Propiedades.ExtraCondition := fraSS_IDSECTOR_ASIGNADO.Propiedades.ExtraCondition;
  calSS_FECHA_SOLICITUD.Date := DBDate;
  FPathNulo := 'C:\WINDOWS\TEMP_SISTEMAS\';
  FMaskNula := '*.###';
  try
    lbAdjuntos2.Mask := FMaskNula;
    ForceDirectories(FPathNulo);
    lbAdjuntos2.Directory := FPathNulo;
  except
  end;
  fraSS_IDUSUARIO.Codigo := Sesion.UserID;
  fraSS_IDSECTOR_ASIGNADO.Codigo := fraSS_IDUSUARIO.sdqDatos.FieldByName('se_idsector').AsString;
  inherited;
  FStorageDirectory := IncludeTrailingPathDelimiter(ValorSQLEx('SELECT DIRECTORY_PATH FROM SYS.ALL_DIRECTORIES WHERE DIRECTORY_NAME = :NAME', ['STORAGE_INTRANET']));
  FHomeDirectory := IncludeTrailingPathDelimiter(ValorSQLEx('SELECT DIRECTORY_PATH FROM SYS.ALL_DIRECTORIES WHERE DIRECTORY_NAME = :NAME', ['INTRANET']));
  VCLExtra.LockControls([edSS_NOTAS, edSS_OBSERVACIONES, edSS_COMENTARIOS_USUARIO, chkRESUELTO,
                         pnlHistorico1, pnlHistorico2, pnlHistorico3, dbgHistoricoPedidos,
                         edInicioProbable, edFinProbable, edDias, edHoras, edMinutos,
                         edHoraInicioProbable, edHoraFinProbable,
                         edObservacionesDep, edMotivoDep], True);
  FSQL := sdqConsulta.SQL.Text;

  edSS_FECHA_SOLICITUDDesde.Date := GetMinActiveDate;
  edSS_FECHA_SOLICITUDHasta.Date := DBDATE + 1;

  if fraSS_IDUSUARIO.sdqDatos.FieldByName('se_idsector').AsInteger <> SECTOR_DESARROLLO then
    fraSS_IDUSUARIO.Clear;

  FSQLPrioridad := 'SELECT * ' +
                    ' FROM (SELECT 1 as id, 1 as codigo, ''Alta'' as descripcion, NULL as baja ' +
                            ' FROM DUAL ' +
                           ' UNION ALL ' +
                          ' SELECT 2 as id, 2 as codigo, ''Media'' as descripcion, NULL as baja ' +
                            ' FROM DUAL ' +
                           ' UNION ALL ' +
                          ' SELECT 3 as id, 3 as codigo, ''Baja'' as descripcion, NULL as baja ' +
                            ' FROM DUAL) PRIORIDADES ' +
                   ' WHERE 1 = 1 ';
  fraHS_PRIORIDAD.Propiedades.Sql := FSQLPrioridad;
  fraSS_PRIORIDAD.Propiedades.Sql := FSQLPrioridad;

  with fraEjecutable do
    begin
      TableName      := 'COMUNES.CEJ_EJECUTABLE';
      FieldID        := 'EJ_ID';
      FieldCodigo    := 'EJ_ID';
      FieldDesc      := 'EJ_DESCRIPCION';
      FieldBaja      := 'EJ_FECHABAJA';
      ExtraCondition := 'AND EJ_ACTIVO = ''S''';
      ExtraFields    := ', EJ_PATH ';
      CaseSensitive  := False;
      ShowBajas      := False;
    end;

  if Sesion.Sector = 'COMPUTOS' then
    Grid.PopupMenu := pmnuPropiedades;

  tbSeparador2.Left            := tbEliminar.Left + 1;
  tbImprimirTicket.Left        := tbEliminar.Left + 1;
  tbMails.Left                 := tbEliminar.Left + 1;
  tbSeparador1.Left            := tbEliminar.Left + 1;
  tbCambioEjecutablePl.Left    := tbEliminar.Left + 1;
  tbCambioEjecutableTk.Left    := tbEliminar.Left + 1;
  tbSeparador3.Left            := tbEliminar.Left + 1;
  tbAnular.Left                := tbEliminar.Left + 1;
  tbCerrarTicket.Left          := tbEliminar.Left + 1;
  tbSolicitarAutorizacion.Left := tbEliminar.Left + 1;

  tbPropiedades.Down := True;

  bEsDesarrollo := (Sesion.IdSectorIntranet = SECTOR_DESARROLLO);

  tbCambioEjecutablePl.Visible := bEsDesarrollo;
  tbCambioEjecutableTk.Visible := bEsDesarrollo;
  tbSeparador3.Visible         := bEsDesarrollo;

  DBAdvCardListDependencias.Parent := AdvToolPanelDependencias;
  DBAdvCardListAdjuntos.Parent := AdvToolPanelAdjuntos;

  JvAppEvents.OnIdle := JvAppEventsIdle;
end;

procedure TfrmGestionSistemas.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  pnlPermiso.Caption := '';
  VerPermiso;
end;

procedure TfrmGestionSistemas.fpAbmShow(Sender: TObject);
begin
  inherited;
  tsPedidos.OpenWidth := fpAbm.Width - 28;
  tsIntranet.OpenWidth := fpAbm.Width - 28;
  wbIntranet.Width := fpAbm.Width - 48;
end;

procedure TfrmGestionSistemas.fraCA_IDPropiedadesChange(Sender: TObject);
begin
  if fraCA_ID.IsSelected then
  begin
    cblES_ID.UncheckAll;
    cblES_ID.Check('7');
  end;
  btnClearCalificacion.Enabled := fraCA_ID.IsSelected;
  RefreshData;
end;

procedure TfrmGestionSistemas.fraHS_IDMOTIVOSOLICITUDPropiedadesChange(Sender: TObject);
var
  sSQL: String;
  iMinutos: Integer;
  dFechaCarga: TDateTime;
begin
  inherited;
  sSQL := FSQLPrioridad;

  if fraHS_IDMOTIVOSOLICITUD.IsSelected then
  begin
    fraHS_IDSECTOR_ASIGNADO.Codigo := fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_IDSECTORDEFAULT').AsString;
    sdqDetalle.FieldByName('HS_IDSECTOR_ASIGNADO').AsInteger := fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_IDSECTORDEFAULT').AsInteger;

    AddCondition(sSQL, ' ID >= ' + fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_MAXIMAPRIORIDAD').AsString);
    fraHS_PRIORIDAD.Propiedades.Sql := sSQL;
    if fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_MAXIMAPRIORIDAD').AsString > fraHS_PRIORIDAD.Id then
      fraHS_PRIORIDAD.Clear;

    if not fraSS_IDMOTIVOSOLICITUD.IsSelected or (fraSS_IDMOTIVOSOLICITUD.Codigo <> fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_IDPADRE').AsString) then
      fraSS_IDMOTIVOSOLICITUD.Codigo := fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_IDPADRE').AsString;
      
    if fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_FECHA_SOLICITUD_REQUERIDA').AsString = 'N' then
      edHS_FECHASOLICITUDREQUERIDA.Clear;
    VCLExtra.LockControls([edHS_FECHASOLICITUDREQUERIDA], fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_FECHA_SOLICITUD_REQUERIDA').AsString = 'N');

    iMinutos := fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_TIEMPORESOLUCION').AsInteger;
    dFechaCarga := NVL(edSS_FECHA_SOLICITUD.Date, DBDate);
    if (iMinutos > 0) and ((dFechaCarga + (iMinutos / 24 / 60)) >= DBDateTime) then
    begin
      if GetDecimales(iMinutos / 24 / 60) = 0 then //El vencimiento fue configurado en cantidad de días
      begin
        edHS_FECHACOMPROMETIDA.Date := Trunc(DBDateTime + (iMinutos / 24 / 60));
        edHS_HORACOMPROMETIDA.Time  := 1/24*10 //10:00 am;
      end else
      begin
        edHS_FECHACOMPROMETIDA.Date := Trunc(DBDateTime + (iMinutos / 24 / 60));
        edHS_HORACOMPROMETIDA.Time  := StrToDateTime(FormatDateTime('HH:mm', DBDateTime + (iMinutos / 24 / 60)));
      end;
    end;
  end else
    fraHS_PRIORIDAD.Propiedades.Sql := sSQL;

  VerPermiso();
end;

procedure TfrmGestionSistemas.fraHS_IDUSUARIOPropiedadesChange(Sender: TObject);
var
  sUsuario: String;
begin
  with fraSS_IDESTADOACTUAL.Propiedades, sdqDetalle do
  begin
    if ((FieldByName('SS_IDESTADOACTUAL').AsInteger = 1) or (FieldByName('SS_IDESTADOACTUAL').AsInteger = 10))
    and fraHS_IDUSUARIO.IsSelected then
    begin
      if AreIn(fraSS_IDESTADOACTUAL.ID, ['1', '10']) then
      begin
        fraSS_IDESTADOACTUAL.Codigo := '3';
        FieldByName('SS_IDESTADOACTUAL').AsInteger := 3;
      end;

      ExtraCondition := ' AND ES_ID IN (3,4,5,9,11) ';
    end;
                                                                        
    if fraHS_IDMOTIVOSOLICITUD.sdqDatos.Active and not AreIn(FieldByName('SS_IDESTADOACTUAL').AsString, ['7', '5', '6', '8']) then
    begin
      sUsuario := GetUsuarioAutorizacion();

      if not IsAuthorizedTicket(FieldByName('SS_ID').AsInteger) and fraHS_IDUSUARIO.IsSelected and fraHS_IDMOTIVOSOLICITUD.IsSelected and (sUsuario > '') then
      begin
        if fraSS_IDESTADOACTUAL.ID = '2' then
        begin
          fraSS_IDESTADOACTUAL.Codigo := '2';
          if State <> dsBrowse then
            FieldByName('SS_IDESTADOACTUAL').AsInteger := 2;
        end;

        ExtraCondition := ' AND ES_ID IN (2, 9, 11) ';
      end;
    end;
  end;
end;

procedure TfrmGestionSistemas.fraHS_IDUSUARIO_SOLICITUDPropiedadesChange(Sender: TObject);
begin
  VerPermiso();
  if fraHS_IDUSUARIO_SOLICITUD.IsSelected and fraHS_IDUSUARIO_SOLICITUD.sdqDatos.Active then
    fraSS_IDEQUIPO.Codigo := fraHS_IDUSUARIO_SOLICITUD.sdqDatos.FieldByName('SE_PC').AsString;
end;

procedure TfrmGestionSistemas.fraHS_PRIORIDADcmbDescripcionDropDown(Sender: TObject);
var
  sSQL: String;
begin
  inherited;
  sSQL := FSQLPrioridad;

  if fraHS_IDMOTIVOSOLICITUD.IsSelected then
  begin
    AddCondition(sSQL, ' ID >= ' + fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_MAXIMAPRIORIDAD').AsString);
    fraHS_PRIORIDAD.Propiedades.Sql := sSQL;
    if fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_MAXIMAPRIORIDAD').AsString > fraHS_PRIORIDAD.Id then
      fraHS_PRIORIDAD.Clear;
  end else
    fraHS_PRIORIDAD.Propiedades.Sql := sSQL;

  fraHS_PRIORIDAD.cmbDescripcionDropDown(Sender);
end;

procedure TfrmGestionSistemas.fraSS_IDESTADOACTUALPropiedadesChange(Sender: TObject);
begin
  inherited;
  if (sdqDetalle.State <> dsInsert) then
    VerControles;
end;

procedure TfrmGestionSistemas.fraSS_IDUSUARIOPropiedadesChange(Sender: TObject);
begin
  btnClearUser.Enabled := fraSS_IDUSUARIO.IsSelected;
  if (not Refreshing) and fraSS_IDUSUARIO.IsSelected then
    RefreshData;
end;

procedure TfrmGestionSistemas.FSFormActivate(Sender: TObject);
begin
  inherited;
  TimerGrilla.Enabled := True;
end;

procedure TfrmGestionSistemas.FSFormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TimerGrilla.Enabled := False;
end;

procedure TfrmGestionSistemas.GridAdjuntosGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
  if AreIn(UpperCase(Field.FullName), ['ADJUNTO']) then
  begin
    if (Field.DataSet.FieldByName('AS_FECHABAJA').IsNull) then
      AFont.Color := clNavy
    else
      AFont.Color := clMaroon;

    if FileExists(sdqAdjuntosAS_RUTAARCHIVO.AsString) then
      AFont.Style := AFont.Style - [fsStrikeOut]
    else
      AFont.Style := AFont.Style + [fsStrikeOut];
  end else
    AFont.Color := clBlack;
end;

procedure TfrmGestionSistemas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Highlight then
  begin
    AFont.Style := AFont.Style + [fsBold];
    AFont.Color := clSilver;
    Background := clGray;
  end else
  begin
    AFont.Style := AFont.Style - [fsBold];
    AFont.Color := clBlack;
  end;

  if AreIn(Field.FullName, ['RESUELTO', 'CALIFICADO', 'TIENE_ADJUNTOS', 'TIENE_DEPENDENCIAS']) then
  begin
    AFont.Style := AFont.Style + [fsBold];
    if (Field.Value = vSI) then
      AFont.Color := clTeal
    else
      AFont.Color := clMaroon;
  end;

  if AreIn(Field.FullName, ['SS_FECHA_CARGA']) then
  begin
    if Field.DataSet.FieldByName('MS_TIEMPORESOLUCION').AsInteger > 0 then
    begin
      if Field.DataSet.FieldByName('TIEMPO_REAL').AsFloat > Field.DataSet.FieldByName('MS_TIEMPORESOLUCION').AsFloat then
      begin
        if AreIn(Field.DataSet.FieldByName('SS_IDESTADOACTUAL').AsString, ['5', '6', '7', '8']) then
          //AFont.Color := clPurple
          Background := $DE8080
        else
          //AFont.Color := clMaroon;
          Background := $00748FED;
      end else
        if AreIn(Field.DataSet.FieldByName('SS_IDESTADOACTUAL').AsString, ['1', '10', '3', '4', '9', '11']) then
          //AFont.Color := clNavy
          Background := $E7B040
        else
          //AFont.Color := clTeal;
          Background := $0088A28A;
    end else
      AFont.Color := clBlack;
  end;

  if AreIn(Field.FullName, ['ES_DESCRIPCION']) then
  begin
    case Field.DataSet.FieldByName('SS_IDESTADOACTUAL').AsInteger of
      1: Background := pnlSinAsignar.Color;//$E7B040;
      2: Background := pnlPendienteAutorizacion.Color;//$60A0C0;
      3: Background := pnlPendienteRealizar.Color;//$00BFFBDE;
      4: Background := pnlEnCurso.Color;//$00BCFFA6;
      5: Background := pnlTerminado.Color;//$00F8C2F7;
      6: Background := pnlAnulado.Color;//$DE8080;
      7: Background := pnlFinalizado.Color;//$0088A28A;
      8: Background := pnlRechazado.Color;//$00748FED;
      9: Background := pnlSuspendido.Color;//$AEABA4;
      10: Background := pnlAutorizado.Color;//$0086C5FD;
      11: Background := pnlMasInformacion.Color;//$008AECE0;
      else Background := Background;
    end;
  end;   
end;

procedure TfrmGestionSistemas.Guardar(Sender: TObject);
var
  nID: Integer;
begin
  nID := 0;

  if Validar then
  try
    with sdqDetalle do
    begin
      if (State = dsInsert) then
      begin
        nID := ValorSQLIntegerEx('SELECT MAX(SS_ID) FROM COMPUTOS.CSS_SOLICITUDSISTEMAS WHERE SS_IDSISTEMATICKET = :sistema', [FIdSistemaTicket]) + 1;
        FieldByName('SS_ID').AsInteger := nID;
        with GetQueryEx('SELECT st_id idsistematicket, NVL(st_ultimoticket, 0) ultimoticket ' +
                          'FROM computos.cst_sistematicket, computos.cts_ticketsector ' +
                         'WHERE st_id = ts_idsistematicket ' +
                           'AND art.agenda_pkg.is_sectordependiente(ts_idsector, :idsector) = :valor', [Sesion.IdSectorIntranet, 'S']) do
        try
          sdqDetalle.FieldByName('SS_IDSISTEMATICKET').AsInteger := FieldByName('idsistematicket').AsInteger;
          sdqDetalle.FieldByName('SS_NRO_TICKET').AsInteger := FieldByName('ultimoticket').AsInteger + 1;
        finally
          Free;
        end;
      end else
        nID := sdqConsulta.FieldByName('SS_ID').AsInteger;

      FieldByName('SS_IDUSUARIO_CARGA').AsInteger := Sesion.ID;
      FieldByName('SS_IDUSUARIO_SOLICITUD').AsInteger := fraHS_IDUSUARIO_SOLICITUD.Value;

      Post;
      ApplyUpdates;
      CommitUpdates;
      CommitTrans(True);
      EjecutarSQL('COMMIT');
    end;
{
    if Sender = btnAplicar then
    begin
      sdqDetalle.Close;
      OpenQueryEx(sdqDetalle, [nID]);
      sdqDetalle.Last;
    end else
      sdqDetalle.Close;
}
    sdqDetalle.Close;
    OpenQueryEx(sdqDetalle, [nID]);
    sdqDetalle.Last;
    {
    if sdqDetalle.FieldByName('SS_IDESTADOACTUAL').AsInteger = 3 then
      EjecutarStoreEx('art.intraweb.do_solicitarpermiso_sistemas(:id_usuario_solicitud, :id_accion, :id_solicitud)', [sdqDetalle.FieldByName('ss_idusuario_solicitud').AsInteger, 6, nID]);
    }  
  finally
    if Sender = btnAceptar then
      fpABM.ModalResult := mrOK;

    RefreshData;
    try
      sdqConsulta.Locate('SS_ID', nID, []);
    except
    end;
  end;
end;

procedure TfrmGestionSistemas.JvAppEventsIdle(Sender: TObject; var Done: Boolean);
begin
  inherited;
  TimerGrilla.Enabled := True;
end;

procedure TfrmGestionSistemas.lbAdjuntos2DblClick(Sender: TObject);
begin
  AbrirAdjunto(nil, nil);
end;

procedure TfrmGestionSistemas.mnuAbrirCarpetaContenedoraClick(Sender: TObject);
begin
  ShellExecute(Application.Handle,nil,PChar(IncludeTrailingPathDelimiter(lbAdjuntos2.Directory)),'','',SW_SHOWNORMAL)
end;

procedure TfrmGestionSistemas.mnuAdjuntoInternoClick(Sender: TObject);
begin
  Adjuntar('P');
end;

procedure TfrmGestionSistemas.mnuAdjuntoVisibleClick(Sender: TObject);
begin
  Adjuntar('U');
end;

procedure TfrmGestionSistemas.mnuDependenciaTicketClick(Sender: TObject);
begin
  EstablecerDependencia;
end;

procedure TfrmGestionSistemas.Adjuntar(ATipo: String);
var
  bGrabar: Boolean;
  sSQL, sDirectorio, sDestino: String;
  nIdTicket: Integer;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un ticket para poder adjuntarle un archivo.');
  if sdqDetalle.State = dsInsert then
    if not MsgAsk('Debe almacenar el ticket actual para continuar.' + CRLF + '¿Desea hacerlo ahora?') then
      Abort
    else
      btnAplicar.Click;

  nIdTicket := Integer(iif(fpAbm.Showing, sdqDetalle.FieldByName('HS_IDSOLICITUD').AsInteger, sdqConsulta.FieldByName('SS_ID').AsInteger));

  with TOpenDialog.Create(Self) do
  try
    if Execute then
    begin
      sDirectorio := FStorageDirectory + 'sistemas\gestion_sistemas\adjuntos' + iif(Is_ConectadoProduccion, '', '_pruebas') + '\' + IntToStr(nIdTicket);
      ForceDirectories(sDirectorio);
      sDestino := IncludeTrailingPathDelimiter(sDirectorio) + ExtractFileName(FileName);

      if FileExists(sDestino) then
        bGrabar := MsgAsk('Existe un archivo con el mismo nombre.' + CRLF + '¿Desea sobreescribirlo?')
      else
        bGrabar := True;

      BeginTrans(True);
      try
        if CopyFileExt(FileName, sDestino, not bGrabar) and bGrabar then
        begin
          sSQL := 'INSERT INTO COMPUTOS.CAS_ADJUNTOSOLICITUD ' +
                  '(AS_IDSOLICITUD, AS_RUTAARCHIVO, AS_USUALTA, AS_FECHAALTA, AS_TIPO) ' +
                  'VALUES ' +
                  '(:AS_IDSOLICITUD, :AS_RUTAARCHIVO, :AS_USUALTA, ART.ACTUALDATE, :TIPO)';

          try
            EjecutarSQLSTEx(sSQL, [nIdTicket, sDestino, Sesion.UserID, ATipo]);
          except
            sSQL := 'UPDATE COMPUTOS.CAS_ADJUNTOSOLICITUD SET AS_FECHABAJA = NULL, AS_USUBAJA = NULL WHERE AS_IDSOLICITUD = :ID AND AS_RUTAARCHIVO = :ARCHIVO';
            EjecutarSQLSTEx(sSQL, [Sesion.UserID, nIdTicket, sdqAdjuntos.FieldByName('AS_RUTAARCHIVO').AsString]);
          end;

          sdqAdjuntos.Close;
          OpenQueryEx(sdqAdjuntos, [nIdTicket]);

          CommitTrans(True);
        end;
      except
        RollBack(True);
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmGestionSistemas.mnuNoSeleccionarNingunoClick(Sender: TObject);
begin
  cblES_ID.UncheckAll;
  RefreshData;
end;

procedure TfrmGestionSistemas.mnuPendientesClick(Sender: TObject);
begin
  cblES_ID.UncheckAll;
  cblES_ID.Check('1');
  cblES_ID.Check('3');
  cblES_ID.Check('4');
  cblES_ID.Check('10');

  if Assigned(Sender) then
    RefreshData;    
end;

procedure TfrmGestionSistemas.mnuRemoverAdjuntoClick(Sender: TObject);
var
  sSQL: String;
begin
  if MsgAsk(Format('¿Esta seguro que desea remover el adjunto seleccionado %s?', [sdqAdjuntos.FieldByName('AS_RUTAARCHIVO').AsString])) then
  begin
    sSQL := 'UPDATE COMPUTOS.CAS_ADJUNTOSOLICITUD SET AS_FECHABAJA = SYSDATE, AS_USUBAJA = :USUARIO WHERE AS_IDSOLICITUD = :ID AND AS_RUTAARCHIVO = :ARCHIVO';
    EjecutarSQLEx(sSQL, [Sesion.UserID, sdqConsulta.FieldByName('SS_ID').AsInteger, sdqAdjuntos.FieldByName('AS_RUTAARCHIVO').AsString]);
    OpenQueryEx(sdqAdjuntos, [sdqConsulta.FieldByName('SS_ID').AsInteger]);
  end;
end;

procedure TfrmGestionSistemas.mnuRemoverDependenciaClick(Sender: TObject);
begin
  inherited;
  if Msgask('¿Está seguro que desea remover la dependencia del ticket ' + DBAdvCardListDependencias.SelectedCard.Caption + ' con respecto al ticket ' + sdqConsulta.FieldByName('SS_NRO_TICKET').AsString + '?') then
  begin
    EjecutarSQLEx('UPDATE computos.cdt_dependenciaticket SET dt_fechabaja = SYSDATE, dt_usubaja = :usuario WHERE dt_id = :id', [Sesion.UserID, sdqDependencias.FieldByName('DT_ID').AsInteger]);
    RefreshData;
  end;
end;

procedure TfrmGestionSistemas.mnuSeleccionarTodosClick(Sender: TObject);
begin
  cblES_ID.CheckAll;
  RefreshData;
end;

procedure TfrmGestionSistemas.EstablecerDependencia(ATicket: Integer);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un ticket para poder establecer una dependencia con otro.');
  edNroTicketDep.Value := ATicket;
  edMotivoDep.Clear;
  edObservacionesDep.Clear;
  edNroTicketDepExit(nil);
  if fpDependencia.ShowModal = mrOk then
  begin
    BeginTrans(True);
    try
      EjecutarSQLSTEx('INSERT INTO computos.cdt_dependenciaticket ' +
                      '(dt_id, dt_idticket, dt_idticket_padre, dt_fechaalta, dt_usualta) ' +
                      'SELECT computos.seq_cdt_id.nextval, :idticket, ss_id, SYSDATE, :usuario ' +
                      '  FROM computos.css_solicitudsistemas ' +
                      ' WHERE ss_nro_ticket = :idticketpadre', [sdqConsulta.FieldByName('SS_ID').AsInteger, Sesion.UserID, edNroTicketDep.Value]);
      EjecutarStoreSTEx('computos.general.do_recalcularfechas(:id);', [sdqConsulta.FieldByName('SS_ID').AsInteger]);
      CommitTrans(True);
    except
      Rollback(True);
    end;
    sdqConsultaAfterScroll(sdqConsulta);
  end;
end;

procedure TfrmGestionSistemas.mnuTicketClick(Sender: TObject);
begin
  EstablecerDependencia((Sender as TMenuItem).Tag);
end;

procedure TfrmGestionSistemas.pmnuPropiedadesPopup(Sender: TObject);
  procedure ArmarSubMenu(ASQL: String; objSubMenu: TMenuItem);
  var
    objAux, objAuxItemUsuario, objSubMenuPadre: TMenuItem;
    sNombreComponente: String;
  begin
    with GetQueryEx(ASql, [Sesion.ID]) do
      while not Eof do
      begin
        if objSubMenu <> mnuMisTickets then
        begin
          sNombreComponente := 'mnuSubMenuTicketUsuario' + Fields[3].AsString;
          objAuxItemUsuario := TMenuItem(Self.FindComponent(sNombreComponente));
          if not Assigned(objAuxItemUsuario) then
          begin
            objAuxItemUsuario := TMenuItem.Create(Self);
            objAuxItemUsuario.Caption := Fields[4].AsString;
            objAuxItemUsuario.Name := sNombreComponente;
            objAuxItemUsuario.Hint := Fields[4].AsString;
            objSubMenu.Add(objAuxItemUsuario);
          end;
          objSubMenuPadre := objAuxItemUsuario;
        end else
          objSubMenuPadre := objSubMenu;

        sNombreComponente := 'mnuSubMenuTicket' + Fields[0].AsString;
        if not Assigned(Self.FindComponent(sNombreComponente)) then
        begin
          objAux := TMenuItem.Create(Self);
          objAux.Tag := Fields[0].AsInteger;
          objAux.Caption := Fields[1].AsString;
          objAux.Name := sNombreComponente;
          objAux.Hint := Fields[2].AsString;
          objAux.OnClick := mnuTicketClick;
          objSubMenuPadre.Add(objAux);
        end;
        Next;
      end;
  end;
var
  bExisteArchivo: Boolean;
  sSQL: String;
begin
  with sdqConsulta do
  begin
    if not IsEmpty then
    begin
      mnuCrearDependencia.Visible := True;

      bExisteArchivo := FileExists(GetPathExe(FieldByName('ej_id').AsInteger));
      mnuPropiedadesGrid.Visible := Active and (not IsEmpty) and
                                    (not FieldByName('ej_path').IsNull);
      mnuPropiedadesGrid.Enabled := mnuPropiedadesGrid.Visible and bExisteArchivo;

      if mnuPropiedadesGrid.Enabled then
        mnuPropiedadesGrid.Caption := 'Propiedades del ejecutable ' + FieldByName('ej_descripcion').AsString
      else
        mnuPropiedadesGrid.Caption := 'La ruta actual del ejecutable ' + FieldByName('ej_descripcion').AsString + ' no es válida!';

      sSQL := '  SELECT ss_nro_ticket, ' +
                       'ss_nro_ticket || '' - '' || ms_descripcion || DECODE(ej_descripcion, NULL, '''', '' > '' || ej_descripcion || '''') texto, ' +
                       'ss_notas, ' +
                       'NVL(se_usuario, ''SINASIGNAR'') as nombre_componente, ' +
                       'NVL(se_nombre, ''Sin asignar'') as usuario ' +
                  'FROM computos.css_solicitudsistemas, computos.cms_motivosolicitud, comunes.cej_ejecutable, art.use_usuarios ' +
                 'WHERE ss_idejecutable = ej_id(+) ' +
                   'AND ss_idmotivosolicitud = ms_id(+) ' +
                   'AND ss_idusuario = se_id(+) ' +
                   'AND ss_idsistematicket = ' + IntToStr(FIdSistemaTicket) + ' ' +
                       '%s ' +
                   'AND ss_idestadoactual IN (1, 3, 4, 10, 11) ' +
                   'AND ss_id <> ' + FieldByName('ss_id').AsString + ' ' +
              'ORDER BY %s';

      mnuMisTickets.Clear;
      mnuOtrosTickets.Clear;

      ArmarSubMenu(Format(sSQL, ['AND ss_idusuario = :idusuario', '1 DESC']), mnuMisTickets);
      ArmarSubMenu(Format(sSQL, ['AND ss_idusuario <> :idusuario', '4, 1 DESC']), mnuOtrosTickets);
    end else
    begin
      mnuPropiedadesGrid.Visible := False;
      mnuCrearDependencia.Visible := False;
    end;
  end;
end;

procedure TfrmGestionSistemas.pmuAdjuntosPopup(Sender: TObject);
begin
  inherited;
  mnuRemoverAdjunto.Enabled := not sdqAdjuntos.IsEmpty;
end;

procedure TfrmGestionSistemas.pmuDependenciasPopup(Sender: TObject);
begin
  inherited;
  mnuRemoverDependencia.Enabled := not sdqDependencias.IsEmpty;
end;

procedure TfrmGestionSistemas.RefreshGrid(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmGestionSistemas.RevisoCalendario(Sender: TObject);
begin
  if Assigned(Sender) and (Sender is TDateComboBox) and Is_FechaValida(TDateComboBox(Sender).Text) then
  calSS_FECHA_SOLICITUD.Enabled := edSS_FECHA_SOLICITUDdesde.IsEmpty and edSS_FECHA_SOLICITUDhasta.IsEmpty;
end;

procedure TfrmGestionSistemas.sdqAdjuntosCalcFields(DataSet: TDataSet);
begin
  sdqAdjuntosADJUNTO.AsString := ExtractFileName(sdqAdjuntosAS_RUTAARCHIVO.AsString);
end;

procedure TfrmGestionSistemas.sdqConsultaAfterClose(DataSet: TDataSet);
begin
  inherited;
  sdqAdjuntos.Close;
  lbTotal.Caption := '';
  pnlTotales.Visible := False;
end;

procedure TfrmGestionSistemas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if tbPropiedades.Down then
    DynColWidthsByData(DBGrid, 100, True, False, [fsBold]);

  lbTotal.Caption := IntToStr(sdqConsulta.RecordCount);
  pnlTotales.Visible := True;
  sdqConsulta.First;
  TDateTimeField(sdqConsulta.FieldByName('FECHA_INICIO_PROBABLE')).DisplayFormat := 'dd/mm/yyyy HH:nn';
  TDateTimeField(sdqConsulta.FieldByName('FECHA_FIN_PROBABLE')).DisplayFormat := 'dd/mm/yyyy HH:nn';
end;

procedure TfrmGestionSistemas.sdqConsultaAfterScroll(DataSet: TDataSet);
var
  sDirectorio: String;
begin
  TimerGrilla.Enabled := False;
  inherited;
  if not sdqConsulta.IsEmpty then
  begin
    if (fpAbm.Showing or AdvToolPanelAdjuntos.Showing or tsAdjuntos.Showing) then
    begin
      if (fpAbm.Showing and (sdqDetalle.State = dsInsert)) or sdqConsulta.IsEmpty then
      begin
        sDirectorio := FPathNulo;
        sdqAdjuntos.Close;
      end else
      begin
        sDirectorio := FStorageDirectory + 'sistemas\gestion_sistemas\adjuntos' + iif(Is_ConectadoProduccion, '', '_pruebas') + '\' + sdqConsulta.FieldByName('SS_ID').AsString;
        OpenQueryEx(sdqAdjuntos, [sdqConsulta.FieldByName('SS_ID').AsInteger]);
      end;

      if DirectoryExists(sDirectorio) then
      begin
        lbAdjuntos2.Mask      := '*.*';
        lbAdjuntos2.Directory := sDirectorio;
        lbAdjuntos2.Visible   := True;
      end else
      begin
        try
          lbAdjuntos2.Mask      := FMaskNula;
          lbAdjuntos2.Directory := FPathNulo;
        except
          lbAdjuntos2.Visible := False;
        end;
      end;
    end;

    if AdvToolPanelDependencias.Showing then
      OpenQueryEx(sdqDependencias, [sdqConsulta.FieldByName('SS_ID').AsInteger]);
  end;
end;

procedure TfrmGestionSistemas.sdqDetalleAfterOpen(DataSet: TDataSet);
begin
  ChequearNavegador();
end;

procedure TfrmGestionSistemas.sdqDetalleAfterScroll(DataSet: TDataSet);
begin
  ChequearNavegador();
  ControlUsuario(nil);
  edHS_HORACOMPROMETIDA.DateTime := sdqDetalleHS_FECHACOMPROMETIDA.AsDateTime - Trunc(sdqDetalleHS_FECHACOMPROMETIDA.AsDateTime);
  edHS_HORAREANUDACION.DateTime := sdqDetalleHS_FECHAREANUDACION.AsDateTime - Trunc(sdqDetalleHS_FECHAREANUDACION.AsDateTime);
  edDIAS_RESOLUCION.Value := sdqDetalleDIAS_RESOLUCION.AsInteger;
  edHORAS_RESOLUCION.Value := sdqDetalleHORAS_RESOLUCION.AsInteger;
  edMINUTOS_RESOLUCION.Value := sdqDetalleMINUTOS_RESOLUCION.AsInteger;
end;

procedure TfrmGestionSistemas.sdqDetalleBeforeScroll(DataSet: TDataSet);
begin
  fraHS_PRIORIDAD.Propiedades.Sql := FSQLPrioridad;
  fraHS_IDMOTIVOSOLICITUD.Propiedades.ExtraCondition := FMotivosExtraCondition;
  fraSS_IDESTADOACTUAL.Propiedades.ExtraCondition := '';
end;

procedure TfrmGestionSistemas.sdqDiscosAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgDiscos);
  dbgDiscos.Width := GetColumnWidths(dbgDiscos, True) - (3 * dbgDiscos.Columns.Count) + 1;
end;

procedure TfrmGestionSistemas.sdqParametrosOracleAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgParametrosOracle);
  dbgParametrosOracle.Width := GetColumnWidths(dbgParametrosOracle, True) - (3 * dbgParametrosOracle.Columns.Count) + 1;
end;

procedure TfrmGestionSistemas.sdqPedidosAfterOpen(DataSet: TDataSet);
begin
  DynColWidthsByData(dbgHistoricoPedidos);
end;

procedure TfrmGestionSistemas.tbAnteriorClick(Sender: TObject);
begin
  sdqDetalle.Prior;
end;

procedure TfrmGestionSistemas.tbAnularClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un ticket para poder anularlo.');
  ProcesarTicket('¿Esta seguro que desea ANULAR el pedido?', 6);
end;

procedure TfrmGestionSistemas.tbArbolSectoresClick(Sender: TObject);
begin
  inherited;
  with TfrmArbolSectores.Create(Self) do
  try
    MostrarSector(StrToIntDef(fraHS_IDSECTOR_ASIGNADO.Id, 0));
    ShowModal;
  finally
    if sdqSectores.Active and (fraHS_IDSECTOR_ASIGNADO.Id <> sdqSectores.FieldByName('SE_ID').AsString) then
    begin
      fraHS_IDSECTOR_ASIGNADO.Codigo := sdqSectores.FieldByName('SE_ID').AsString;
      ControlUsuario(Sender);
    end;

    Free;
  end;
end;

procedure TfrmGestionSistemas.tbCerrarTicketClick(Sender: TObject);
var
  sEstadoActual: String;
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un ticket para poder cerrarlo.');
  sEstadoActual := ValorSqlEx('SELECT ss_idestadoactual FROM computos.css_solicitudsistemas WHERE ss_id = :id', [sdqConsulta.FieldByName('SS_ID').AsInteger]);
  Verificar(AreIn(sEstadoActual, ['6', '7', '8']), nil, 'El ticket seleccionado ya ha sido finalizado.');
  ProcesarTicket('¿Esta seguro que desea CERRAR el pedido?' + CRLF + 'Nota: El estado del mismo pasará a "Terminado - A Calificar".', 5);
end;

procedure TfrmGestionSistemas.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.IsEmpty, nil, 'Debe seleccionar un ticket para poder rechazarlo.');
  ProcesarTicket('¿Esta seguro que desea RECHAZAR el pedido?', 8);
end;

procedure TfrmGestionSistemas.tbImprimirTicketClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, tbImprimirTicket, 'Debe seleccionar una solicitud.');
  qrTicket := TqrTicket.Create(Self);
  with qrTicket do
  try
    OpenQueryEx(sdqDatos, [sdqConsulta.FieldByName('SS_ID').AsInteger]);
    Visualizar(qrTicket, GetValores(sdqConsulta.FieldByName('SS_NRO_TICKET').AsString), [oAlwaysShowDialog, oForceShowModal, oForceDB, oAutoFirma], True, '', '', True);
  finally
    qrTicket.Free;
  end;
end;

procedure TfrmGestionSistemas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraSS_IDESTADOACTUAL.Clear;
  fraSS_IDEQUIPO.Clear;
  fraSS_IDMOTIVOSOLICITUD.Clear;
  calSS_FECHA_SOLICITUD.Date := DBDate;
  edSS_FECHA_SOLICITUDDesde.Date := GetMinActiveDate;
  edSS_FECHA_SOLICITUDHasta.Date := DBDate + 1;
  fraEJ_ID.Clear;
  fraSS_IDSECTOR_ASIGNADO.Clear;
  fraSS_PRIORIDAD.Clear;
  cblES_ID.UncheckAll;
  fraSS_IDUSUARIO.Codigo := Sesion.UserID;
  fraSS_IDUSUARIO_SOLICITUD.Clear;
  fraID_SECTOR_USUARIO_SOLICITUD.Clear;
  edSS_NRO_TICKET.Clear;
  fraCA_ID.Clear;
  rgPlan.ItemIndex := 0;
end;

procedure TfrmGestionSistemas.tbMailsClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, tbImprimirTicket, 'Debe seleccionar una solicitud.');
  Abrir(TfrmElementosEnviadosGlobal, frmElementosEnviadosGlobal, tmvMDIChild, nil);
  frmElementosEnviadosGlobal.fraEE_DIRECCIONORIGEN.Limpiar;
  frmElementosEnviadosGlobal.cmbEE_FECHAMENSAJEDesde.Date := sdqConsulta.FieldByName('SS_FECHA_CARGA').AsDateTime;
  frmElementosEnviadosGlobal.edEE_MOTIVO_LIKE.Text := FPrefijoAsuntoMail + '%TICKET N°' + sdqConsulta.FieldByName('SS_NRO_TICKET').AsString;
  frmElementosEnviadosGlobal.tbRefrescarClick(nil);
end;

procedure TfrmGestionSistemas.tbModificarClick(Sender: TObject);
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, tbNuevo, 'Debe seleccionar una solicitud.');
  OpenQueryEx(sdqDetalle, [sdqConsulta.FieldByName('SS_ID').AsInteger]);
  sdqDetalle.Last;
  if fpABM.ShowModal = mrOK then
    RefreshData;
end;

procedure TfrmGestionSistemas.tbNuevoClick(Sender: TObject);
begin
  Verificar(False, nil, '');
  VCLExtra.LockControls(sbControles, False);
  VCLExtra.LockControls([edSS_FECHA_SOLICITUD], True);
  OpenQueryEx(sdqDetalle, [-1]);

  with sdqDetalle do
  begin
    if State <> dsInsert then
      Insert;
    FieldByName('SS_FECHA_SOLICITUD').AsDateTime := DBDateTime;
    FieldByName('SS_IDESTADOACTUAL').AsInteger := 1; // Sin asignar
    FieldByName('HS_PRESENCIAL').AsString := 'N';

    if Sesion.IdSectorIntranet = SECTOR_DESARROLLO then
    begin
      FieldByName('SS_IDUSUARIO_SOLICITUD').AsInteger := Sesion.ID;
      fraHS_IDUSUARIO_SOLICITUD.Codigo := Sesion.UserID;
      fraHS_IDUSUARIO_SOLICITUDPropiedadesChange(nil);
    end;
  end;

  if fpABM.ShowModal = mrOK then
    RefreshData;
end;

procedure TfrmGestionSistemas.tbOrdenarClick(Sender: TObject);
begin
  inherited;
  unArt.LoadDynamicSortFields(SortDialog.SortFields, DBGrid.Columns);
end;

procedure TfrmGestionSistemas.tbPrimeroClick(Sender: TObject);
begin
  sdqDetalle.First;
end;

procedure TfrmGestionSistemas.tbPropiedadesClick(Sender: TObject);
begin
  inherited;
  if tbPropiedades.Down then
    DynColWidthsByData(DBGrid);
end;

procedure TfrmGestionSistemas.tbSiguienteClick(Sender: TObject);
begin
  sdqDetalle.Next;
end;

procedure TfrmGestionSistemas.tbSolicitarAutorizacionClick(Sender: TObject);
var
  nIdSolicitud: Integer;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, tbSolicitarAutorizacion, 'Debe seleccionar un ticket para pedir autorización explícita del mismo.');  
  nIdSolicitud := sdqConsulta.FieldByName('SS_ID').AsInteger;
  fraUsuarioAutorizacion.Clear;
  edMotivoAutorizacion.Lines.Clear; //sdqConsulta.FieldByName('SS_OBSERVACIONES').AsString;
  if fpAutorizacion.ShowModal = mrOk then
  begin
    if MsgAsk(Format('¿Esta seguro que desea SOLICITAR AUTORIZACIÓN explícita de %s para este pedido?', [fraUsuarioAutorizacion.Nombre])) then
    begin
      BeginTrans(True);
      try
        EjecutarSQLSTEx('UPDATE computos.cps_permisosolicitud ' +
                           'SET ps_fechaautorizacion = SYSDATE, ' +
                               'ps_idusuarioautorizacion = :idusuario ' +
                         'WHERE ps_idsolicitud = :id ' +
                           'AND ps_fechaautorizacion IS NULL', [Sesion.Id, nIdSolicitud]);
        EjecutarSQLSTEx('INSERT INTO computos.cps_permisosolicitud ' +
                        '(ps_id, ps_idsolicitud, ps_idusuario, ps_usualta, ps_fechaalta) ' +
                        'VALUES ' +
                       '(computos.seq_cps_id.NEXTVAL, :id, :idusuario, :usuario, SYSDATE)',
                        [nIdSolicitud, fraUsuarioAutorizacion.ID, Sesion.UserID]);
        ActualizarTicket(2, edMotivoAutorizacion.Lines.Text, False);
        CommitTrans(True);
      except
        on E:Exception do
        begin
          RollBack(True);
          ShowMessage('Error al solicitar la autorización.' + CRLF + E.Message);
        end;
      end;
    end;
  end;
end;

procedure TfrmGestionSistemas.tbUltimoClick(Sender: TObject);
begin
  sdqDetalle.Last;
end;

procedure TfrmGestionSistemas.TimerGrillaTimer(Sender: TObject);
begin
  inherited;
  if Application.Active and (not fpAbm.Visible) and (not IsIconic(Application.Handle)) and
     (Sesion.IdSectorIntranet <> SECTOR_DESARROLLO) then
  begin
    RefreshData;
    TimerGrilla.Enabled := False;
  end;
end;

procedure TfrmGestionSistemas.ActualizarTicket(AEstado: Integer; AObservaciones: String; AConTrans: Boolean = True);
var
  sSQL: String;
begin
  sSQL := 'UPDATE computos.css_solicitudsistemas ' +
             'SET ss_idestadoactual = :estado, ' +
                 'ss_observaciones = :obs, ' +
                 'ss_fechamodif = sysdate, ' +
                 'ss_idusumodif = :usuario ' +
           'WHERE ss_id = :id';

  if AConTrans then
    EjecutarSQLEx(sSQL, [AEstado, AObservaciones, Sesion.Id, sdqConsulta.FieldByName('SS_ID').AsInteger])
  else
    EjecutarSQLSTEx(sSQL, [AEstado, AObservaciones, Sesion.Id, sdqConsulta.FieldByName('SS_ID').AsInteger]);
end;

procedure TfrmGestionSistemas.ChequearNavegador();
begin
  if (sdqDetalle.State <> dsInsert) then
  with fraSS_IDESTADOACTUAL.Propiedades, sdqDetalle do
  begin
    tbPrimero.Enabled   := not IsEmpty and (RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});
    tbAnterior.Enabled  := not IsEmpty and (RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});
    tbSiguiente.Enabled := not IsEmpty and (RecNo < RecordCount {$IFDEF VER150}- 1{$ENDIF});
    tbUltimo.Enabled    := not IsEmpty and (RecNo < RecordCount {$IFDEF VER150}- 1{$ENDIF});
    lbRegistroDesde.Caption := IntToStr(RecNo {$IFDEF VER150}+ 1{$ENDIF});
    lbRegistroHasta.Caption := IntToStr(RecordCount);
    VCLExtra.LockControls(sbControles, tbSiguiente.Enabled);
    VCLExtra.LockControls([ToolPanelTab, lbAdjuntos2, dbgAdjuntos, tsAdjuntos], False);
    VCLExtra.LockControls([fraSS_IDEJECUTABLE], tbSiguiente.Enabled or (FIdSistemaTicket = 2));
    btnAplicar.Enabled := (not tbSiguiente.Enabled) and Seguridad.Activar(btnAplicar);
    btnAceptar.Enabled := (not tbSiguiente.Enabled) and Seguridad.Activar(btnAceptar);

    if tbSiguiente.Enabled then
      btnCancelar.Caption := '&Cerrar'
    else
      btnCancelar.Caption := '&Cancelar';

    if not tbSiguiente.Enabled then
    begin
      BeginTrans(True);
      sdqDetalle.Edit;
      VerEstados;
    end;

    fraHS_IDUSUARIOPropiedadesChange(nil);
    VerControles;
  end else
  begin
    tbPrimero.Enabled   := False;
    tbAnterior.Enabled  := False;
    tbSiguiente.Enabled := False;
    tbUltimo.Enabled    := False;

    lbRegistroDesde.Caption := '1';
    lbRegistroHasta.Caption := '1';
    fraSS_IDESTADOACTUAL.Propiedades.ExtraCondition := ' AND ES_ID IN (3,4,5,8,9,11) ';
    VCLExtra.LockControls([fraHS_IDUSUARIO_SOLICITUD, edHS_NOTAS], False);
  end;

  with sdqDetalle do
  if (Active and (not FieldByName('SS_IDCALIFICACION').IsNull and (FieldByName('SS_IDESTADOACTUAL').AsString = '7'))) or tbSiguiente.Enabled then
  begin
    VCLExtra.LockControls(sbControles, True);
    VCLExtra.LockControls(fraSS_IDEJECUTABLE, True);
    VCLExtra.LockControls([ToolPanelTab, lbAdjuntos2, dbgAdjuntos, tsAdjuntos], False);
    btnAplicar.Enabled := False;
    btnAceptar.Enabled := False;
    VerPermiso;
  end;
end;

function TfrmGestionSistemas.GetMinActiveDate: TDate;
begin
  Result := ValorSqlDateTimeEx('SELECT MIN(ss_fecha_solicitud) ' +
                                 'FROM computos.css_solicitudsistemas ' +
                                'WHERE ss_idestadoactual NOT IN (5, 6, 7, 8) ' +
                                  'AND ss_idsistematicket = :sistema', [FIdSistemaTicket]);
end;

function TfrmGestionSistemas.GetRefreshing: Boolean;
begin
  Result := FRefreshing;
end;

function TfrmGestionSistemas.GetUsuarioAutorizacion: String;
begin
  if sdqDetalle.State = dsInsert then
    Result := GetUsuarioAutorizacion(fraHS_IDUSUARIO_SOLICITUD.Value, fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_NIVEL').AsInteger)
  else
    Result := GetUsuarioAutorizacion(sdqDetalle.FieldByName('HS_IDSOLICITUD').AsInteger);
end;

function TfrmGestionSistemas.GetUsuarioAutorizacion(AIdSolicitud: Integer): String;
begin
  Result := ValorSQLEx('SELECT se_nombre ' +
                         'FROM art.use_usuarios, computos.css_solicitudsistemas, computos.cms_motivosolicitud ' +
                        'WHERE se_id = computos.general.get_usuarioresponsable(ss_idusuario_solicitud, ms_nivel) ' +
                          'AND ss_id = :id ' +
                          'AND ss_idmotivosolicitud = ms_id ' +
                          'AND NOT EXISTS(SELECT 1 ' +
                                            'FROM computos.cps_permisosolicitud ' +
                                           'WHERE ps_idsolicitud = ss_id ' +
                                             'AND ps_fechaautorizacion IS NULL) ' +
                     'UNION ALL ' +
                        'SELECT se_nombre ' +
                          'FROM art.use_usuarios, computos.cps_permisosolicitud ' +
                         'WHERE ps_idsolicitud = :id ' +
                           'AND ps_idusuario = se_id ' +
                           'AND ps_fechaautorizacion IS NULL', [AIdSolicitud]);
end;

function TfrmGestionSistemas.GetUsuarioAutorizacion(IdUsuario, IdNivel: Integer): String;
begin
  Result := ValorSQLEx('SELECT se_nombre ' +
                         'FROM art.use_usuarios ' +
                        'WHERE se_id = computos.general.get_usuarioresponsable(:idusuario, :nivel)', [IdUsuario, IdNivel]);
end;

function TfrmGestionSistemas.IsAuthorizedTicket(AIdSolicitud: Integer): Boolean;
begin
  Result := ExisteSQLEx('SELECT 1 ' +
                          'FROM computos.chs_historicosolicitud ' +
                         'WHERE hs_idsolicitud = :id ' +
                           'AND hs_idestado = 10 ' +
                           'AND NOT EXISTS(SELECT 1 ' +
                                            'FROM computos.cps_permisosolicitud ' +
                                           'WHERE ps_idsolicitud = :id ' +
                                             'AND ps_fechaautorizacion IS NULL)' + 
                     'UNION ALL ' +
                        'SELECT DISTINCT 1 /* El usuario de carga es el mismo que le tocaría autorizar */ ' +
                          'FROM computos.cms_motivosolicitud, computos.css_solicitudsistemas, computos.chs_historicosolicitud ' +
                         'WHERE hs_idsolicitud = :id ' +
                           'AND ss_id = hs_idsolicitud ' +
                           'AND hs_idusuario_cambio = DECODE(computos.general.get_usuarioresponsable(ss_idusuario_solicitud, ms_nivel), ' +
                                                             '-1, hs_idusuario_cambio, computos.general.get_usuarioresponsable(ss_idusuario_solicitud, ms_nivel))' +
                           'AND hs_idusuario_cambio = (SELECT hs_idusuario_cambio ' +
                                                        'FROM computos.chs_historicosolicitud ' +
                                                       'WHERE hs_idsolicitud = ss_id ' +
                                                         'AND hs_fecha_cambio = (SELECT MIN(hs_fecha_cambio) ' +
                                                                                  'FROM computos.chs_historicosolicitud ' +
                                                                                 'WHERE hs_idsolicitud = ss_id)) ' +
//                           'AND hs_idestado IN(1, 10) ' +
                           'AND NOT EXISTS(SELECT 1 ' +
                                            'FROM computos.cps_permisosolicitud ' +
                                           'WHERE ps_idsolicitud = :id ' +
                                             'AND ps_fechaautorizacion IS NULL)' +
                           'AND hs_idmotivosolicitud = ms_id', [AIdSolicitud]);
end;

function TfrmGestionSistemas.ProcesarTicket(APregunta: String; AEstado: Integer; AObservaciones: String): Boolean;
var
  tslObs: TStringList;
begin
  TimerGrilla.Enabled := False;
  Result := False;
  inherited;
  if MsgAsk(APregunta) then
  begin
    tslObs := TStringList.Create;
    try
      tslObs.Text := sdqConsulta.FieldByName('SS_OBSERVACIONES').AsString;
      if not IsEmptyString(AObservaciones) or InputMemoBox('Observaciones', tslObs) then
      begin
        Result := True;
        ActualizarTicket(AEstado, NVL(Trim(AObservaciones), tslObs.Text));
      end;
    finally
      tslObs.Free;
      RefreshData;
    end;
  end else
    Result := False;
end;

procedure TfrmGestionSistemas.VerControles;
begin
  VCLExtra.LockControls([{fraHS_IDMOTIVOSOLICITUD, fraSS_IDMOTIVOSOLICITUD, }edHS_NOTAS, edHS_FECHASOLICITUDREQUERIDA,
                         edHS_FECHACOMPROMETIDA, edHS_HORACOMPROMETIDA, fraHS_IDSECTOR_ASIGNADO, ToolBarSectores,
                         fraHS_IDUSUARIO, chkHS_PRESENCIAL], tbSiguiente.Enabled or (AreIn(fraSS_IDESTADOACTUAL.Id, ['2', '6', '7', '8', '9', '11'])));
  VCLExtra.LockControls([edHS_FECHAREANUDACION, edHS_HORAREANUDACION], fraSS_IDESTADOACTUAL.Id <> '9');
  VCLExtra.LockControls([edHS_FECHASOLICITUDREQUERIDA], tbSiguiente.Enabled or fraHS_IDMOTIVOSOLICITUD.IsEmpty or (fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_FECHA_SOLICITUD_REQUERIDA').AsString = 'N'));
  VCLExtra.LockControls([edSS_FECHA_SOLICITUD, fraHS_IDUSUARIO_SOLICITUD, edHS_NOTAS], True);
  chkTieneAdjuntos.ReadOnly := True;
  chkTieneAdjuntos.Visible := chkTieneAdjuntos.Checked;

  if fraSS_IDESTADOACTUAL.Id <> '9' then
  begin
    edHS_FECHAREANUDACION.Clear;
    edHS_HORAREANUDACION.DateTime := 0;
  end;

  if fraHS_IDUSUARIO.Locked and fraHS_IDUSUARIO.IsEmpty and not tbSiguiente.Enabled then
    fraHS_IDUSUARIO.Codigo := Sesion.UserID;
end;

procedure TfrmGestionSistemas.VerEstados;
begin
  with fraSS_IDESTADOACTUAL.Propiedades, sdqDetalle do
  begin
    case FieldByName('SS_IDESTADOACTUAL').AsInteger of
      1: //Sin asignar
        ExtraCondition := ' AND ES_ID IN (1,3,4,5,9,11) ';
      2:	//Pendiente de autorizar
        if (GetUsuarioAutorizacion() > '') and
           (not IsAuthorizedTicket(FieldByName('SS_ID').AsInteger)) then
          ExtraCondition := ' AND ES_ID IN (2,9) '
        else begin
          if fraSS_IDESTADOACTUAL.Id = '2' then
            fraSS_IDESTADOACTUAL.Clear;

          ExtraCondition := ' AND ES_ID IN (2,3,4,5,9,11) ';
        end;
      3:	//Pendiente de realizar
        ExtraCondition := ' AND ES_ID IN (2,3,4,5,9,11) ';
      4:	//En curso
        ExtraCondition := ' AND ES_ID IN (2,3,4,5,9,11) ';
      5:	//Pendiente de aceptación
        ExtraCondition := ' AND ES_ID IN (5) ';
      6:	//Anulado
        ExtraCondition := ' AND ES_ID IN (6) ';
      7:	//Finalizado
        ExtraCondition := ' AND ES_ID IN (7) ';
      8:	//Rechazado
        ExtraCondition := ' AND ES_ID IN (8) ';
      9:	//Suspendido
        if GetUsuarioAutorizacion() > '' then
        begin
          if IsAuthorizedTicket(FieldByName('SS_ID').AsInteger) then
            ExtraCondition := ' AND ES_ID IN (3,4,9,11) '
          else
            ExtraCondition := ' AND ES_ID IN (2,9) ';
        end else
          ExtraCondition := ' AND ES_ID IN (3,4,5,9,11) ';
      10:	//Sin asignar - Autorizado
        ExtraCondition := ' AND ES_ID IN (10,3,4,5,9,11) ';
      11:	//A la espera de mas información
        ExtraCondition := ' AND ES_ID IN (3,4,11) ';
    end;
  end;
end;

procedure TfrmGestionSistemas.VerPermiso;
var
  sUsuario: String;
begin
  if fraHS_IDUSUARIO_SOLICITUD.IsSelected and fraHS_IDMOTIVOSOLICITUD.IsSelected then
  begin
    sUsuario := GetUsuarioAutorizacion();

    if sUsuario > '' then
    begin
      if not IsAuthorizedTicket(sdqDetalle.FieldByName('HS_IDSOLICITUD').AsInteger) then
      begin
        pnlPermiso.Caption := 'Requiere autorización de ' + sUsuario;
        pnlPermiso.Font.Color := clMaroon;
        if ((sdqDetalle.State = dsInsert) or (sdqDetalle.State = dsEdit)) and (sdqDetalle.Active and not AreIn(sdqDetalle.FieldByName('HS_IDESTADO').AsString, ['5', '6', '7', '8'])) then
        begin
          fraSS_IDESTADOACTUAL.Propiedades.ExtraCondition := ' AND ES_ID IN (2) ';
          fraSS_IDESTADOACTUAL.Codigo := '2';
        end else
          VerEstados;
      end else
      begin
        pnlPermiso.Caption := 'Autorizado/Rechazado por ' + sUsuario;
        pnlPermiso.Font.Color := clOlive;
        if (sdqDetalle.State = dsInsert) then
          fraSS_IDESTADOACTUAL.Propiedades.ExtraCondition := ' AND ES_ID IN (8,10) '
        else
          VerEstados;
      end;
    end else
    begin
      pnlPermiso.Caption := '';
      if (sdqDetalle.State = dsInsert) then
      begin
         if fraSS_IDESTADOACTUAL.Id = '2' then
          fraSS_IDESTADOACTUAL.Clear;

        fraSS_IDESTADOACTUAL.Propiedades.ExtraCondition := ' AND ES_ID IN (3,4,5,8,9,11) '
      end else
        VerEstados;
    end;
  end;

  if sdqDetalle.Active and not sdqDetalle.FieldByName('SS_IDCALIFICACION').IsNull then
  begin
    if sdqDetalle.FieldByName('SS_IDESTADOACTUAL').AsString = '7' then
    begin
      pnlPermiso.Caption := 'Esta solicitud ya ha sido calificada.';
      pnlPermiso.Font.Color := clNavy;
    end else
    begin
      pnlPermiso.Caption := 'Esta solicitud ya ha sido calificada y no ha sido resuelta aún.';
      pnlPermiso.Font.Color := clPurple;
    end;
  end;
end;

procedure TfrmGestionSistemas.EnableButtons(AEnabled: Boolean);
begin
  inherited;
  tbAnular.Enabled             := AEnabled and bAllowDelete;
  tbCambioEjecutableTk.Enabled := AEnabled and Seguridad.Activar(tbCambioEjecutableTk);
end;

procedure TfrmGestionSistemas.AfterConstruction;
begin
  inherited;
  mnuPendientesClick(nil);
end;

procedure TfrmGestionSistemas.RefreshData;
var
  sSQL, sSQLAux: String;
  nID: Integer;
begin
  if Refreshing then
    Exit;

  FRefreshing := True;
  try
    if sdqConsulta.Active and not sdqConsulta.IsEmpty then
      nID := sdqConsulta.FieldByName('SS_ID').AsInteger
    else
      nID := -1;

    if not(edSS_FECHA_SOLICITUDDesde.IsEmpty and edSS_FECHA_SOLICITUDHasta.IsEmpty) then
      calSS_FECHA_SOLICITUD.Enabled := False;

    if (not edSS_FECHA_SOLICITUDDesde.IsEmpty or not edSS_FECHA_SOLICITUDHasta.IsEmpty)
    and (edSS_FECHA_SOLICITUDDesde.Date <> edSS_FECHA_SOLICITUDHasta.Date) then
      calSS_FECHA_SOLICITUD.Enabled := False;

    if edSS_NRO_TICKET.IsEmpty then
    begin
      sSQL := FSQL + DoFiltro(pnlSubFiltros);

      if fraFiltroMotivoPadre.IsSelected then
        sSQL := sSQL + ' AND CMS_PADRE_MS_ID = ' + SQLValue(fraFiltroMotivoPadre.Codigo);

      if fraFiltroMotivoDetalle.IsSelected then
        sSQL := sSQL + ' AND CMS_MS_ID = ' + SQLValue(fraFiltroMotivoDetalle.Codigo);

      case rgPlan.ItemIndex of
        1: sSQL := sSQL + ' AND cms_padre_ms_id = 501 ';
        2: sSQL := sSQL + ' AND cms_padre_ms_id <> 501 ';
      end;
    end else
      sSQL := FSQL + DoFiltroComponente(edSS_NRO_TICKET, 'SS_NRO_TICKET');

    sSQLAux := ' AND ss_idsistematicket = ' + SqlValue(FIdSistemaTicket);

    sdqConsulta.SQL.Text := sSQL + sSQLAux + SortDialog.OrderBy;
  finally
    FRefreshing := False;
  end;

  inherited RefreshData;
  calSS_FECHA_SOLICITUD.Enabled := True;

  try
    if nID <> -1 then
      sdqConsulta.Locate('SS_ID', nID, []);
  except
  end;
end;

function TfrmGestionSistemas.Validar: Boolean;
begin
  Verificar(fraHS_IDUSUARIO_SOLICITUD.IsEmpty, fraHS_IDUSUARIO_SOLICITUD.edCodigo, 'Debe indicar el usuario solicitante.');
  Verificar(fraSS_IDMOTIVOSOLICITUD.IsEmpty, fraSS_IDMOTIVOSOLICITUD.edCodigo, 'Debe indicar el tipo de pedido.');
  Verificar(fraHS_IDMOTIVOSOLICITUD.IsEmpty, fraHS_IDMOTIVOSOLICITUD.edCodigo, 'Debe indicar el detalle del tipo de pedido.');
  Verificar((fraHS_IDMOTIVOSOLICITUD.sdqDatos.FieldByName('MS_EJECUTABLEOBLIGATORIO').AsString = 'S') and fraSS_IDEJECUTABLE.IsEmpty, fraSS_IDEJECUTABLE.edCodigo, 'Debe indicar la aplicación para el detalle del tipo de pedido seleccionado.');
  Verificar(fraHS_PRIORIDAD.IsEmpty, fraHS_PRIORIDAD.edCodigo, 'Debe indicar la prioridad del pedido.');
  Verificar(fraHS_IDSECTOR_ASIGNADO.IsEmpty, fraHS_IDSECTOR_ASIGNADO.edCodigo, 'Debe indicar el sector responsable del pedido.');
  Verificar(fraSS_IDESTADOACTUAL.IsEmpty, fraSS_IDESTADOACTUAL.edCodigo, 'Debe indicar el estado actual del pedido.');
  Verificar((fraSS_IDESTADOACTUAL.Id = '5') and (fraHS_IDUSUARIO.Codigo <> Sesion.UserID), fraHS_IDUSUARIO.edCodigo, 'El usuario responsable del pedido debe ser Ud. para finalizar este pedido.');
  Verificar((edHS_FECHASOLICITUDREQUERIDA.Date > 0) and (edHS_FECHASOLICITUDREQUERIDA.Date < DBDate), edHS_FECHASOLICITUDREQUERIDA, 'El pedido no puede ser solicitado para ser resuelto antes que hoy, no somos magos.');
  Verificar((not edHS_FECHACOMPROMETIDA.ReadOnly) and (edHS_FECHACOMPROMETIDA.Date > 0) and (edHS_FECHACOMPROMETIDA.Date < DBDate), edHS_FECHACOMPROMETIDA, 'No nos podemos comprometer a hacer el pedido antes que hoy, no somos magos.');
  Verificar((edHS_FECHA_INICIO_PROBABLE.Date > 0) and (edHS_FECHA_FIN_PROBABLE.Date > 0) and (edHS_FECHA_INICIO_PROBABLE.Date > edHS_FECHA_FIN_PROBABLE.Date), edHS_FECHA_INICIO_PROBABLE, 'La fecha de inicio probable no puede ser posterior a la fecha de finalización probable.');

  if (not AreIn(fraSS_IDESTADOACTUAL.Id, ['1', '2', '10']) and fraHS_IDUSUARIO.IsEmpty) then
  begin
    Verificar(True, fraHS_IDUSUARIO.edCodigo, 'Debe indicar el usuario responsable del pedido.');
    VCLExtra.LockControls(fraHS_IDUSUARIO, False);
  end;

  if (fraSS_IDESTADOACTUAL.Codigo = '2') then
    if not MsgAsk('Se solicitará explícitamente autorización a quién corresponda.' + CRLF + '¿Desea continuar?') then
      Abort;

  if (fraSS_IDESTADOACTUAL.Codigo = '5') and (Trim(edHS_OBSERVACIONES.Lines.Text) > '') then
    if not MsgAsk('El texto indicado en las observaciones se enviará al usuario en un correo.' + CRLF + '¿Desea continuar?' + CRLF + CRLF + 'Note: Si el texto de las observaciones es interno cancele esta operación, bórrelo y luego cierre el ticket.') then
      Abort;
      
  Result := True;
end;

procedure TfrmGestionSistemas.DoCambiarEjecutable(Sender: TObject);
var
  sPath, sEstadoActual: String;
  bContinuar: Boolean;
  IdCSS: TTableId;
begin
  bContinuar := False;
  IdCSS      := ART_EMPTY_ID;

  if Sender = tbCambioEjecutableTk then
  begin
    sPath := '';
    IdCSS := sdqConsulta.FieldByName('SS_ID').AsInteger;

    Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, tbImprimirTicket, 'Debe seleccionar una solicitud.');
    sEstadoActual := ValorSqlEx('SELECT ss_idestadoactual FROM computos.css_solicitudsistemas WHERE ss_id = :id', [IdCSS]);
    Verificar(not AreIn(sEstadoActual, ['3', '4', '10', '1']), nil, 'El ticket seleccionado debe estar pendiente de realizar, en curso, autorizado o sin asignar.');

    bContinuar := True;
  end else
  begin
    if fpCambioEjecutable.ShowModal = mrOk then
    begin
      sPath      := fraEjecutable.sdqDatos.FieldByName('EJ_PATH').AsString;
      bContinuar := True;
    end;
  end;

  if bContinuar then
    DoAltaSolcitudCambioExe(IdCSS, sPath);
end;

procedure TfrmGestionSistemas.btnAceptarCambioEjecClick(Sender: TObject);
begin
  Verificar(fraEjecutable.IsEmpty, fraEjecutable, 'Debe indicar el ejecutable.');
  fpCambioEjecutable.ModalResult := mrOk;
end;

procedure TfrmGestionSistemas.btnAceptarDepClick(Sender: TObject);
var
  sSQL: String;
begin
  inherited;
  edNroTicketDepExit(nil);

  sSQL := ' SELECT padre.ss_nro_ticket nro_ticket ' +
             'FROM computos.css_solicitudsistemas tkt, computos.css_solicitudsistemas padre, computos.cdt_dependenciaticket ' +
            'WHERE padre.ss_id = dt_idticket ' +
       'START WITH tkt.ss_nro_ticket = :ticket ' +
       'CONNECT BY PRIOR dt_idticket_padre = dt_idticket_padre ' +
              'AND tkt.ss_id = dt_idticket ' +
              'AND tkt.ss_nro_ticket <> padre.ss_nro_ticket';

  with GetQueryEx(sSQL, [sdqConsulta.FieldByName('SS_ID').AsInteger]) do
  try
    if Locate('NRO_TICKET', edNroTicketDep.Value, [loPartialKey]) then
      InfoHint(edNroTicketDep, 'No se permite establecer una referencia circular en la dependencia de los tickets.', True);
  finally
    Free;
  end;

  fpDependencia.ModalResult := mrOk;
end;

procedure TfrmGestionSistemas.fpCambioEjecutableEnter(Sender: TObject);
begin
  fraEjecutable.Clear;
end;

procedure TfrmGestionSistemas.mnuPropiedadesGridClick(Sender: TObject);
var
  sFile, sFecha: String;
begin
  if sdqConsulta.Active and not sdqConsulta.IsEmpty and not sdqConsulta.FieldByName('ej_id').IsNull then
  begin
    sFile := GetPathExe(sdqConsulta.FieldByName('ej_id').AsInteger);
    sFecha := Get_StrDateTimeFile(sFile);
    if not IsEmptyString(sFecha) then
      MsgBox('La Fecha de Creación del Ejecutable es: ' + sFecha, MB_ICONINFORMATION);
  end;
end;

end.
