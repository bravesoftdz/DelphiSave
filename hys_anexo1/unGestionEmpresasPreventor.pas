unit unGestionEmpresasPreventor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unFraCodigoDescripcion, unFraEmpresa,
  unArtDBAwareFrame, unArtDbFrame, unfraEstablecimientoDomic, unfraCtbTablas,
  ExComboBox, unDmPrincipal, unSesion, SqlFuncs, CustomDlgs, AnsiSql,
  unfraLocalidadEx, unfraLocalidad, unfraCIIU, unFraActividad, Mask,
  PatternEdit, IntEdit, General, VCLExtra, unHistoricoTipoEstabPreventor,
  Buttons, unfraEstablecimiento, ComboEditor, ComboGrid, CheckCombo,
  ToolEdit, DateComboBox, unSeleccionPreventor, unDomicilioMiRegistro,
  unSolicitudExclusionEmpresa, unFraCodDesc, unGrids, RxToolEdit, RxPlacemnt;
type

  TModoForm = (mfEmpresas, mfEstablecimientos);

  TfrmGestionEmpresasPreventor = class(TfrmCustomGridABM)
    pnlColorRef: TPanel;
    fraPreventor: TfraCodigoDescripcion;
    fraPreventorNuevo: TfraCodigoDescripcion;
    fraPreventorFiltro: TfraCodigoDescripcion;
    Label1: TLabel;
    fraEstablecimiento: TfraEstablecimientoDomic;
    fraEmpresaEstab: TfraEmpresa;
    Label2: TLabel;
    Label3: TLabel;
    fraTipoEmpresa: TfraCodigoDescripcion;
    cmbActividad: TExComboBox;
    cbTodosEstab: TCheckBox;
    tbCambiarPreventor: TToolButton;
    fpCambiarPreventor: TFormPanel;
    Bevel1: TBevel;
    btnAceptarCambioPreventor: TButton;
    btnCancelarCambioPreventor: TButton;
    Label6: TLabel;
    pcFiltros: TPageControl;
    tbGeneral: TTabSheet;
    tbVarios: TTabSheet;
    Label4: TLabel;
    cbSinPreventor: TCheckBox;
    Label7: TLabel;
    edCiuu: TIntEdit;
    Label14: TLabel;
    edEstablecimiento: TPatternEdit;
    edMotivoCambio: TRichEdit;
    Label13: TLabel;
    fpMotivoCambio: TFormPanel;
    Bevel3: TBevel;
    Label17: TLabel;
    btnAceptarMotivo: TButton;
    edMotivoCambioSolicitado: TRichEdit;
    btnTodos: TButton;
    tbCambios: TToolBar;
    Label15: TLabel;
    tbOperativo: TTabSheet;
    cbAnexoI: TCheckBox;
    cbPrs: TCheckBox;
    cbAnexoII: TCheckBox;
    cbDenunciasGrales: TCheckBox;
    cbAvisoObra: TCheckBox;
    cmbAnexoI: TExComboBox;
    cmbAnexoII: TExComboBox;
    cmbPrs: TExComboBox;
    cmbDenunciasGrales: TExComboBox;
    cmbAvisoObra: TExComboBox;
    btnInfoEstableci: TSpeedButton;
    cbReferente: TCheckBox;
    cbReferenteCambio: TCheckBox;
    cbPreventorReferente: TCheckBox;
    cbAnexoFicticio: TCheckBox;
    cmbAnexoFicticio: TExComboBox;
    Label19: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    Label20: TLabel;
    cbListarCoordinados: TCheckBox;
    cbCtosActivos: TCheckBox;
    sdqConSupervisor: TSDQuery;
    Label21: TLabel;
    fraRanking: TfraCodigoDescripcion;
    tbCP: TToolButton;
    tbAfiliaciones: TToolButton;
    ToolButton2: TToolButton;
    tbAplicarSugerido: TToolButton;
    edTipoSrt: TEdit;
    Label22: TLabel;
    fraSubTipoFiltro: TfraCodigoDescripcion;
    fraTipoFiltroSRT: TfraCtbTablas;
    Label23: TLabel;
    cbOtrasDenuncias: TCheckBox;
    cmbOtrasDenuncias: TExComboBox;
    dbgEmpresa: TArtDBGrid;
    dsDatosEmpresa: TDataSource;
    sdqDatosEmpresa: TSDQuery;
    Splitter: TSplitter;
    cbExcluirBajas: TCheckBox;
    cmbTipoEmpresaPrev: TCheckCombo;
    sdqConsultaSELECTED: TStringField;
    cbVerPreventorSugeridoABM: TCheckBox;
    sdqListaPrevSugeridos: TSDQuery;
    lbTipoSrt: TLabel;
    sdqConsultaEP_ID: TFloatField;
    sdqConsultaEP_CUIT: TStringField;
    sdqConsultaEP_IDEMPRESA: TFloatField;
    sdqConsultaEM_NOMBRE: TStringField;
    sdqConsultaEP_ESTABLECI: TFloatField;
    sdqConsultaES_NOMBRE: TStringField;
    sdqConsultaTIPOSRT: TStringField;
    sdqConsultaTIPOPREVENCION: TStringField;
    sdqConsultaEP_ACTIVIDAD: TStringField;
    sdqConsultaEP_IDFIRMANTE: TFloatField;
    sdqConsultaEP_ITCODIGO: TStringField;
    sdqConsultaIT_NOMBRE: TStringField;
    sdqConsultaES_EVENTUAL: TStringField;
    sdqConsultaIT_COORDINADOR: TStringField;
    sdqConsultaRC_EMPLEADOS: TFloatField;
    sdqConsultaDOMICILIO: TStringField;
    sdqConsultaES_LOCALIDAD: TStringField;
    sdqConsultaES_CPOSTAL: TStringField;
    sdqConsultaAC_RELACION: TStringField;
    sdqConsultaES_CPOSTALA: TStringField;
    sdqConsultaCO_CONTRATO: TFloatField;
    sdqConsultaPROV: TStringField;
    sdqConsultaEP_FECHABAJA: TDateTimeField;
    sdqConsultaEP_USUBAJA: TStringField;
    sdqConsultaES_FECHABAJA: TDateTimeField;
    sdqConsultaEP_ANEXO1: TStringField;
    sdqConsultaEP_ANEXO2: TStringField;
    sdqConsultaEP_ANEXO1FICTICIO: TStringField;
    sdqConsultaEP_TIENEDENUNCIAGRAL: TStringField;
    sdqConsultaEP_TIENEDENUNCIA: TStringField;
    sdqConsultaEP_TIENEPRS: TStringField;
    sdqConsultaEP_FECHAULTVISITA: TDateTimeField;
    sdqConsultaEP_FECHAULTRELEV: TDateTimeField;
    sdqConsultaEP_FECHAULTCAP: TDateTimeField;
    sdqConsultaPREVULTVISITA: TStringField;
    sdqConsultaPREVSUGERIDO: TStringField;
    sdqConsultaIDPREVSUGERIDO: TFloatField;
    tbEmpresas: TToolBar;
    ToolButton7: TToolButton;
    tbModificarEmpresa: TToolButton;
    ToolButton13: TToolButton;
    fpEmpresaModif: TFormPanel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label24: TLabel;
    Button1: TButton;
    Button2: TButton;
    fraPreventorRef: TfraCodigoDescripcion;
    fraTipoEmpresaModif: TfraCodigoDescripcion;
    edTipoEmpresaSrtModif: TEdit;
    fraEmpresaModif: TfraEmpresa;
    tbDesSeleccionarTodo: TToolButton;
    tbSeleccionarTodos: TToolButton;
    sdqConsultaEE_DESCRIPCION: TStringField;
    sdqConsultaEP_FECHAINICIOOBRA: TDateTimeField;
    sdqConsultaEP_FECHAEXTENSIONOBRA: TDateTimeField;
    sdqConsultaEP_FECHAFINOBRA: TDateTimeField;
    Button3: TButton;
    sdqConsultaES_PROVINCIA: TStringField;
    tbAfiliacion: TTabSheet;
    Label8: TLabel;
    edCantTrabajadoresMin: TIntEdit;
    Label12: TLabel;
    edCantTrabajadoresMax: TIntEdit;
    cbEventual: TCheckBox;
    lbAct: TLabel;
    edActividad: TIntEdit;
    fraLocalidad: TfraLocalidadEx;
    Label10: TLabel;
    cmbEstadoEstab: TCheckCombo;
    Label11: TLabel;
    fraPerfil: TfraCodigoDescripcion;
    Label25: TLabel;
    chkGBA: TCheckBox;
    sdqConsultaEP_CANTVISITAS: TFloatField;
    sdqConsultaEP_CANTCAPACIT: TFloatField;
    sdqConsultaEP_CANTRELEV: TFloatField;
    fraMotivoAsignacion: TfraCodigoDescripcion;
    Label26: TLabel;
    edVigenciaAsig: TDateComboBox;
    Label27: TLabel;
    Label28: TLabel;
    fraMotivoAsignacionModif: TfraCodigoDescripcion;
    Label29: TLabel;
    edVigenciaAsigModif: TDateComboBox;
    Label30: TLabel;
    edObservacionModif: TRichEdit;
    tbHistorico: TToolButton;
    sdqConsultaEP_MOTIVOASIGNACION: TFloatField;
    sdqConsultaEP_FECHAVENCIMIENTOASIG: TDateTimeField;
    sdqConsultaEP_OBSERVACION: TStringField;
    Label31: TLabel;
    Label32: TLabel;
    edVigenciaAsigFiltro: TDateComboBox;
    fraMotivoAsignacionFiltro: TfraCodigoDescripcion;
    sdqConsultaMA_DESCRIPCION: TStringField;
    Label33: TLabel;
    edVigenciaAsigFiltro2: TDateComboBox;
    Label34: TLabel;
    tbOcultarGridEmpresa: TToolButton;
    tbCambioVista: TToolButton;
    tbLimpiarEmpresa: TToolButton;
    tbSalirEmpresa: TToolButton;
    tbRefrescarEmpresa: TToolButton;
    cbUltimoOperativo: TCheckBox;
    Label35: TLabel;
    fraPreventorNotif: TfraCodigoDescripcion;
    Label36: TLabel;
    edFNotif: TDateComboBox;
    ToolButton1: TToolButton;
    tbImprimirEmpresa: TToolButton;
    tbExportarEmpresa: TToolButton;
    PrintDialogEmpresa: TPrintDialog;
    QueryPrintEmpresa: TQueryPrint;
    ExportDialogEmpresa: TExportDialog;
    sdqDatosEmpresaCO_CUIT: TStringField;
    sdqDatosEmpresaEM_NOMBRE: TStringField;
    sdqDatosEmpresaCO_OPERATIVO: TStringField;
    sdqDatosEmpresaTIPOSTR: TStringField;
    sdqDatosEmpresaTIPOPREVENCION: TStringField;
    sdqDatosEmpresaSUBTIPO: TStringField;
    sdqDatosEmpresaREFERENTE: TStringField;
    sdqDatosEmpresaCO_IDEMPRESA: TFloatField;
    sdqDatosEmpresaTE_ID: TFloatField;
    sdqDatosEmpresaIDREFERENTE: TStringField;
    sdqDatosEmpresaCO_ID: TFloatField;
    sdqDatosEmpresaCO_IDPREVENTORNOTIF: TFloatField;
    sdqDatosEmpresaCO_FECHANOTIFICACION: TDateTimeField;
    sdqDatosEmpresaTELEFONOEMP: TStringField;
    sdqDatosEmpresaIT_NOMBRE: TStringField;
    sdqDatosEmpresaIT_CODIGO: TStringField;
    sdqDatosEmpresaINCID: TFloatField;
    sdqDatosEmpresaCO_RIGEDESDE: TDateTimeField;
    sdqDatosEmpresaCO_RIGEHASTA: TDateTimeField;
    sdqDatosEmpresaSECTOR: TStringField;
    sdqDatosEmpresaSELECTED: TStringField;
    ToolButton9: TToolButton;
    tbBorrarMarcas: TToolButton;
    tbMarcarTodas: TToolButton;
    fpCambioPreventorRef: TFormPanel;
    Bevel4: TBevel;
    btnAceptarCambioprev: TButton;
    fraCambioPrevRef: TfraCodigoDescripcion;
    Label37: TLabel;
    tbCambiarPrevRef: TToolButton;
    btnCancel: TButton;
    sdqConsultaDC_TELEFONOS: TStringField;
    ToolBar3: TToolBar;
    tbPreventorPerfil: TToolButton;
    cmbHolding: TCheckCombo;
    Label38: TLabel;
    sdqConsultaGE_DESCRIPCION: TStringField;
    sdqDatosEmpresaGE_DESCRIPCION: TStringField;
    sdqDatosEmpresaIncidenciaActual: TFloatField;
    sdqDatosEmpresaIncidencia1mesatras: TFloatField;
    sdqDatosEmpresaIncidencia2mesesatras: TFloatField;
    sdqDatosEmpresaIncidencia3mesesatras: TFloatField;
    sdqDatosEmpresaIncidencia4mesesatras: TFloatField;
    sdqDatosEmpresaIncidencia5mesesatras: TFloatField;
    sdqDatosEmpresaIncidencia6mesesatras: TFloatField;
    sdqDatosEmpresaIncidencia7mesesatras: TFloatField;
    sdqDatosEmpresaIncidencia8mesesatras: TFloatField;
    sdqDatosEmpresaIncidencia9mesesatras: TFloatField;
    sdqDatosEmpresaIncidencia10mesesatras: TFloatField;
    sdqDatosEmpresaIncidencia11mesesatras: TFloatField;
    sdqDatosEmpresaCP_FECHA: TDateTimeField;
    cmbSector: TCheckCombo;
    cmbVerPreventorExclusivo: TCheckBox;
    sdqConsultaPE_PREVENTORID: TFloatField;
    sdqDatosEmpresaPE_PREVENTORID: TFloatField;
    sdqDatosEmpresaPREVEX: TStringField;
    sdqConsultaIT_ID: TFloatField;
    sdqDatosEmpresaIT_ID: TFloatField;
    cmbPreventorUltVisita: TCheckBox;
    fraPreventorExclusivo: TfraCodigoDescripcion;
    Label41: TLabel;
    cbPreventorExclusivo: TCheckBox;
    cmbEmpresaSinPreventorExclusivo: TCheckBox;
    cmbEmpresaPreventorExclusivo: TCheckBox;
    cbTercerizado: TCheckBox;
    cbExclusivoCambio: TCheckBox;
    tbCambiarPrevExclusivo: TToolButton;
    fpCambioPrevExclusivo: TFormPanel;
    Bevel5: TBevel;
    Label42: TLabel;
    btnAceptarCambioprevExclusivo: TButton;
    fraCambioPrevExclusivo: TfraCodigoDescripcion;
    btnCancelPrevExclusivo: TButton;
    Label39: TLabel;
    sdqConsultaIDREFERENTE: TStringField;
    Panel2: TPanel;
    sdqConsultaEP_NRORESOLUCION: TFloatField;
    Label40: TLabel;
    Panel3: TPanel;
    Label43: TLabel;
    sdqDatosEmpresaCO_FECHABAJA: TDateTimeField;
    fraEstablecimientoModif: TfraEstablecimientoDomic;
    sdqDatosEmpresaCO_ESTAB_EVENTO: TFloatField;
    cbVerPreventorSugerido: TCheckBox;
    fraSubTipo: TfraCodigoDescripcion;
    Label16: TLabel;
    sdqDatosEmpresaCO_IDSUBTIPO: TFloatField;
    cbReferenteExclusivo: TCheckBox;
    cbReferenteNotif: TCheckBox;
    cmbResolucion: TCheckCombo;
    cbSinReferente: TCheckBox;
    sdqConsultaAC_IDCATEGORIARIESGO: TFloatField;
    sdqConsultaCA_DESCRIPCION: TStringField;
    sdqConsultaCA_ID: TFloatField;
    cmbCategoriaRiesgo: TCheckCombo;
    lbCategoriaRiesgo: TLabel;
    tbDomicilioMiRegistro: TToolButton;
    TabSheet1: TTabSheet;
    chkCancerigenos: TCheckBox;
    chkDifenilos: TCheckBox;
    chkAccMayores: TCheckBox;
    sdqConsultaEP_CANCERIGENOS: TStringField;
    sdqConsultaEP_DIFENILOS: TStringField;
    sdqConsultaEP_ACCMAYORES: TStringField;
    tbExclusionEmpresas: TToolButton;
    chkEstabConCPPrev: TCheckBox;
    tbVisitas: TTabSheet;
    Label44: TLabel;
    edVisitaDesde: TDateComboBox;
    Label46: TLabel;
    edVisitaHasta: TDateComboBox;
    chkSinVisita: TCheckBox;
    tbComandosSel: TToolBar;
    tbAddPrev: TToolButton;
    tbDeletePrev: TToolButton;
    tbViewPrev: TToolButton;
    fpPreventoresSel: TFormPanel;
    Bevel6: TBevel;
    btnPreventoresClose: TButton;
    lstPrev: TListBox;
    cbPAL: TCheckBox;
    cmbPAL: TExComboBox;
    sdqConsultaEP_TIENEPAL: TStringField;
    sdqConsultaCO_ESTAB_EVENTO: TFloatField;
    sdqConsultaZC_DESCRIPCION: TStringField;
    Label45: TLabel;
    cmbZona: TCheckCombo;
    sdqConsultaCO_VIGENCIAHASTA: TDateTimeField;
    sdqDatosEmpresaCO_VIGENCIAHASTA: TDateTimeField;
    cmbEstabTiposEventual: TCheckCombo;
    sdqConsultaCP_DEPARTAMENTO: TStringField;
    fraDepart: TfraCodDesc;
    Label47: TLabel;
    cbNoTercerizado: TCheckBox;
    tbCambioTipoPrev: TToolButton;
    fpCambioTipoPrevencion: TFormPanel;
    Bevel7: TBevel;
    Label48: TLabel;
    btnAceptarCambioTipoPrev: TButton;
    btnCancelarCambioTipoPrev: TButton;
    fraTipoEmpresaCambioTipoPrev: TfraCodigoDescripcion;
    sdqConsultaTE_CARGAMANUAL: TStringField;
    chkMarcarPram: TCheckBox;
    sdqConsultaep_pramet: TStringField;
    sdqDatosEmpresaCO_PRAMET: TStringField;
    sdqConsultaEP_TIPORELEV: TStringField;
    cbEmpresaVip: TCheckBox;
    fpMotivoReasignacion: TFormPanel;
    Bevel8: TBevel;
    Label49: TLabel;
    Button4: TButton;
    btnCancelarMotivo: TButton;
    fraMotivoReasignacion: TfraCodigoDescripcion;
    edObservacionReasignacion: TRichEdit;
    Label50: TLabel;
    sdqConsultaEMPRESAVIP: TStringField;
    tbCambioPeriodicidad: TToolButton;
    edCantVisitas: TIntEdit;
    Label52: TLabel;
    Label51: TLabel;
    sdqConsultaFRECUENCIAVISITAPERS: TFloatField;
    fpFrecuenciaVisita: TFormPanel;
    Bevel9: TBevel;
    btnAceptarCambioFrecuencia: TButton;
    btnCancelarCambioFrecuencia: TButton;
    Label53: TLabel;
    edCantVisitasMulti: TIntEdit;
    Label54: TLabel;
    sdqConsultasector: TStringField;
    tbConsSiniestros: TToolButton;
    sdqConsultaAC_CODIGOACTUAL: TStringField;
    sdqConsultaTIPOPREVEMPRESA: TStringField;
    tbEstimacionVisitasAnual: TToolButton;
    ToolBar1: TToolBar;
    tbEstimacionVisitasAnualPrev: TToolButton;
    sdqConsultaVALIDO463: TStringField;
    fraPreventorProvisorio: TfraCodigoDescripcion;
    Label55: TLabel;
    Label56: TLabel;
    edFDesdeVigenciaPrevProvisorio: TDateComboBox;
    edFHastaVigenciaPrevProvisorio: TDateComboBox;
    Label57: TLabel;
    Label58: TLabel;
    sdqConsultaEP_IDPREVENTORPROVISORIO: TFloatField;
    sdqConsultaEP_FDESDEPREVPROVISORIO: TDateTimeField;
    sdqConsultaEP_FHASTAPREVPROVISORIO: TDateTimeField;
    cbPreventorProvisorioFiltro: TCheckBox;
    sdqConsultaPREVENTORPROVISORIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure cbTodosEstabClick(Sender: TObject);
    procedure tbCambiarPreventorClick(Sender: TObject);
    procedure btnAceptarCambioPreventorClick(Sender: TObject);
    procedure cbSinPreventorClick(Sender: TObject);
    procedure btnCancelarCambiosClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure fraPreventorFiltrocmbDescripcionDropDown(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure fraPreventorNuevocmbDescripcionDropDown(Sender: TObject);
    procedure fraPreventorcmbDescripcionDropDown(Sender: TObject);
    procedure fpMotivoCambioClose(Sender: TObject;
      var Action: TCloseAction);
    procedure fpMotivoCambioBeforeShow(Sender: TObject);
    procedure tbHistoricoClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnInfoEstableciClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure cbPreventorReferenteClick(Sender: TObject);
    procedure fraEmpresaFiltroExit(Sender: TObject);
    function GenerarSolicitudInforme (CUIT: String; idPreventor: Integer; Motivo: String): Boolean;
    procedure tbCPClick(Sender: TObject);
    procedure tbAfiliacionesClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure FSFormDestroy(Sender: TObject);
    procedure sdqConsultaSELECTEDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure GridCellClick(Column: TColumn);
    procedure tbAplicarSugeridoClick(Sender: TObject);
    procedure cbVerPreventorSugeridoABMClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqListaPrevSugeridosAfterClose(DataSet: TDataSet);
    procedure tbModificarEmpresaClick(Sender: TObject);
    procedure fraPreventorRefcmbDescripcionDropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbgEmpresaDblClick(Sender: TObject);
    procedure tbSeleccionarTodosClick(Sender: TObject);
    procedure tbDesSeleccionarTodoClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure fraMotivoAsignacionModifChange(Sender: TObject);
    procedure fraMotivoAsignacionChange(Sender: TObject);
    procedure tbOcultarGridEmpresaClick(Sender: TObject);
    procedure tbCambioVistaClick(Sender: TObject);
    procedure sdqDatosEmpresaAfterScroll(DataSet: TDataSet);
    procedure tbLimpiarEmpresaClick(Sender: TObject);
    procedure tbSalirEmpresaClick(Sender: TObject);
    procedure tbRefrescarEmpresaClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgEmpresaCellClick(Column: TColumn);
    procedure dbgEmpresaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbImprimirEmpresaClick(Sender: TObject);
    procedure tbExportarEmpresaClick(Sender: TObject);
    procedure tbMarcarTodasClick(Sender: TObject);
    procedure tbBorrarMarcasClick(Sender: TObject);
    procedure btnAceptarCambioprevClick(Sender: TObject);
    procedure tbCambiarPrevRefClick(Sender: TObject);
    procedure tbPreventorPerfilClick(Sender: TObject);
    procedure dbgEmpresaGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbCambiarPrevExclusivoClick(Sender: TObject);
    procedure btnAceptarCambioprevExclusivoClick(Sender: TObject);
    procedure cbListarCoordinadosClick(Sender: TObject);
    procedure cmbVerPreventorExclusivoClick(Sender: TObject);
    procedure cmbPreventorUltVisitaClick(Sender: TObject);
    procedure cbReferenteExclusivoClick(Sender: TObject);
    procedure cbReferenteNotifClick(Sender: TObject);
    procedure tbDomicilioMiRegistroClick(Sender: TObject);
    procedure tbExclusionEmpresasClick(Sender: TObject);
    procedure chkEstabConCPPrevClick(Sender: TObject);
    procedure chkSinVisitaClick(Sender: TObject);
    procedure fraDepartcmbDescripcionChange(Sender: TObject);
    procedure fraDepartcmbDescripcionExit(Sender: TObject);
    procedure tbAddPrevClick(Sender: TObject);
    procedure tbDeletePrevClick(Sender: TObject);
    procedure tbViewPrevClick(Sender: TObject);
    procedure tbCambioTipoPrevClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure tbCambioPeriodicidadClick(Sender: TObject);
    procedure tbConsSiniestrosClick(Sender: TObject);
    procedure tbEstimacionVisitasAnualClick(Sender: TObject);
    procedure tbEstimacionVisitasAnualPrevClick(Sender: TObject);
    procedure cbPreventorProvisorioFiltroClick(Sender: TObject);
  private
    FModoForm: TModoForm;
    FHacerCommit : Boolean;
    sWhere: String;
    sFrom: string;
    sSelect: string;
    FTodos: Boolean;
    FCambio: Boolean;
    dHoy : TDate;
    SelectedListEmpresas : TBookMarkLst;
    FIDPreventorAnterior: integer;
    FCuitAnterior : String;
    procedure LlenarEstabTipoEventual(Marca: boolean);
    procedure BorrarFiltros;
    procedure ArmarQueryEstablecimiento;
    procedure ArmarQueryEmpresa;
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnEmpresaChangeFiltro(Sender: TObject);
    function VerifyChanges: boolean;
    procedure FiltrarPreventor(Sender: TObject; fraPreventor: TfraCodigoDescripcion);
    procedure fraTipoEmpresaChange(Sender: TObject);
    Function EsEmpresaEAS (aCUIT: String; aFecha: TDateTime): Boolean;
    procedure setModoForm(const Value: TModoForm);
    procedure setHacerCommit(const Value: Boolean);
    procedure ReasignarTareas(Cuit: String; Estableci,
      idpreventor: Integer);
    procedure BorrarReasignacion;
    procedure GuardarCantVisitasPersonalizada(aIdEmpresa: Integer; aEstableci: Integer; aCantVisitas: Integer);
  protected
    SelectedList: TBookMarkLst;
    function ArmarFiltroEstab(Establecimientos: string): string;

  public
    procedure ActualizarPreventorReferente(aCuit, aIdPreventor: string);
    procedure ActualizarPreventorExclusivo(aIdEmpresa, aIdPreventor: Integer);
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    property ModoForm: TModoForm read FModoForm write setModoForm;
    property HacerCommit : Boolean read FHacerCommit write setHacerCommit;
  end;

var
  frmGestionEmpresasPreventor: TfrmGestionEmpresasPreventor;

implementation

uses unReasignacionCP, unContratoEstablecimiento, unPrincipal,strfuncs,
     unManPreventores, DateUtils, unCustomConsulta, Math, StrUtils,
     unConsultaSiniestrosHYS, unConsultaVisitasAnual;

{$R *.DFM}

{ TfrmAbmTipoEstablecimientoPreventor }

procedure TfrmGestionEmpresasPreventor.ClearControls;
begin
    fraEmpresaEstab.Locked := false;
    fraEstablecimiento.Locked := false;
    fraEmpresaEstab.Clear;
    fraEstablecimiento.Clear;
    fraTipoEmpresa.Clear;
    cmbActividad.Value := '';
    fraPreventor.Clear;
    fraPreventorProvisorio.Clear;
    edFDesdeVigenciaPrevProvisorio.Clear;
    edFDesdeVigenciaPrevProvisorio.Tag := 0;
    edFHastaVigenciaPrevProvisorio.Clear;
    fraMotivoAsignacionModif.clear;
    fraMotivoAsignacion.Clear;
    edVigenciaAsig.Clear;
    edVigenciaAsigModif.Clear;
    edObservacionModif.Clear;
    cbTodosEstab.Checked := false;
    cbReferente.Checked := false;
    cbExcluirBajas.Checked := true;
    edTipoSrt.Clear;
    cbVerPreventorSugeridoABM.Checked := false;
    fraPreventor.ExtraCondition := '';
    FIDPreventorAnterior := -1;
    chkMarcarPram.Checked := false;
    chkMarcarPram.Tag := 0;
end;

function TfrmGestionEmpresasPreventor.DoABM: Boolean;
var
  MarcaPram: boolean;
  IdOperativo: integer;
  iResPregunta : Integer;
  tiposrt: String;
begin
  try
    Result := true;
    If HacerCommit then
      BeginTrans(true);

    iResPregunta := IDNO;
    If (ModoABM <> maBaja) and  (fraPreventor.Codigo <> sdqConsulta.FieldByName('ep_itcodigo').AsString) then
    begin
      iResPregunta := MsgBox('¿Desea reasignar las tareas al nuevo preventor?',MB_ICONQUESTION + MB_YESNOCANCEL);
      if iResPregunta = IDYES then
      begin
        BorrarReasignacion;
        if fpMotivoReasignacion.ShowModal = mrOK then
          ReasignarTareas(sdqConsulta.fieldbyname('EP_CUIT').AsString,
                          sdqConsulta.fieldbyname('EP_ESTABLECI').AsInteger,
                          fraPreventor.Value);
      end;
    end;
    if (iResPregunta <> IDCANCEL) then
    begin
      Sql.Clear;
      if ModoABM = maBaja Then
      begin
        Sql.PrimaryKey.Add('ep_cuit', sdqConsulta.FieldByName('ep_cuit').AsString);
        Sql.PrimaryKey.Add('ep_estableci', sdqConsulta.FieldByName('ep_estableci').AsInteger);
        Sql.Fields.Add('EP_USUBAJA', Sesion.LoginName );
        Sql.Fields.Add('EP_FECHABAJA', exDateTime );
        Sql.SqlType := stUpdate;
        EjecutarSqlST( GetSqlABM );
      end else begin
        if not cbTodosEstab.Checked then
        begin
            Sql.Fields.Add('EP_PRAMET', chkMarcarPram.Checked);
            Sql.Fields.Add('EP_IDTIPOESTABPREV', fraTipoEmpresa.Value);
  //          Sql.Fields.Add('ep_actividad', cmbActividad.Value);

            Sql.Fields.Add('ep_itcodigo', fraPreventor.Codigo);
            if fraPreventor.IsSelected then
              Sql.Fields.Add('ep_idfirmante', fraPreventor.Value)
            else
              Sql.Fields.Add('ep_idfirmante', exNull);

            if (ModoABM = maAlta) Then
            begin
              if (ExisteSql('SELECT 1 FROM hys.hep_estabporpreventor WHERE EP_CUIT = ' + SqlValue(fraEmpresaEstab.mskCUIT.Text)
                            + ' AND EP_ESTABLECI = ' + SqlValue(fraEstablecimiento.edCodigo.Text))) then
              begin
                  if (MsgBox('El establecimiento ya existe. ¿Desea reemplazarlo con estos datos?',  MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES) then
                  begin
                      Sql.SqlType := stUpdate;
                      Sql.Fields.Add('EP_USUMODIF', Sesion.LoginName);
                      Sql.Fields.Add('EP_FECHAMODIF', exDateTime );
  //                    Sql.Fields.Add('EP_USUBAJA', exNull );
  //                    Sql.Fields.Add('EP_FECHABAJA', exNull );
                  end
                  else Exit;
              end;

              if (Sql.SqlType <> stUpdate) then
              begin
                Sql.Fields.Add('EP_USUALTA', Sesion.LoginName);
                Sql.Fields.Add('EP_FECHAALTA', exDateTime);
              end;

              Sql.PrimaryKey.Add('ep_cuit', fraEmpresaEstab.mskCUIT.Text);
              Sql.PrimaryKey.Add('ep_estableci', fraEstablecimiento.edCodigo.Text);
            end else begin
              Sql.PrimaryKey.Add('ep_cuit', sdqConsulta.FieldByName('ep_cuit').AsString);
              Sql.PrimaryKey.Add('ep_estableci', sdqConsulta.FieldByName('ep_estableci').AsInteger);
              Sql.Fields.Add('EP_MOTIVOASIGNACION', fraMotivoAsignacionModif.Codigo);
              Sql.Fields.Add('EP_FECHAVENCIMIENTOASIG', edVigenciaAsigModif.Date);
              Sql.Fields.Add('EP_OBSERVACION', edObservacionModif.Text);
              if fraPreventorProvisorio.IsSelected then
              begin
                Sql.Fields.Add('EP_IDPREVENTORPROVISORIO', fraPreventorProvisorio.Value);
                Sql.Fields.Add('EP_FDESDEPREVPROVISORIO', edFDesdeVigenciaPrevProvisorio.Date);
                Sql.Fields.Add('EP_FHASTAPREVPROVISORIO', edFHastaVigenciaPrevProvisorio.Date);
              end
              else
              begin
                Sql.Fields.Add('EP_IDPREVENTORPROVISORIO', exNull);
                Sql.Fields.Add('EP_FDESDEPREVPROVISORIO', exNull);
                Sql.Fields.Add('EP_FHASTAPREVPROVISORIO', exNull);
              end;




  (*
              //Este es para el caso de una empresa no asignada que pasa a darse de alta en hep_estaporpreventor
              if (ModoABM = maModificacion) and (sdqConsulta.FieldByName('ep_tipo').IsNull) then
              begin
                  Sql.Fields.Add('EP_USUALTA', Sesion.LoginName);
                  Sql.Fields.Add('EP_FECHAALTA', exDateTime );
                  Sql.SqlType := stInsert;
              end
              else begin //Modif Común
                  Sql.Fields.Add('EP_USUMODIF', Sesion.LoginName);
                  Sql.Fields.Add('EP_FECHAMODIF', exDateTime );
              end;
  *)
              Sql.Fields.Add('EP_USUMODIF', Sesion.LoginName);
              Sql.Fields.Add('EP_FECHAMODIF', exDateTime );
  //            Sql.Fields.Add('EP_USUBAJA', exNull );
  //            Sql.Fields.Add('EP_FECHABAJA', exNull );
            end;
            //verifico si hubo cambios
            FCambio:= VerifyChanges;
            EjecutarSqlST( GetSqlABM );

            if (chkMarcarPram.Checked  and (chkMarcarPram.Tag = 0)) or
               (not chkMarcarPram.Checked  and (chkMarcarPram.Tag = 1)) then
            begin
              MarcaPram := ExisteSqlEx('SELECT 1 ' +
                                       'FROM hys.hep_estabporpreventor ' +
                                       'WHERE ep_idempresa = :idempresa ' +
                                       ' AND ep_pramet = ''S''', [sdqConsultaEP_IDEMPRESA.Value]);
              IdOperativo := ValorSqlEx('SELECT art.hys.get_idoperativovigente_empresa(:idempresa, sysdate) FROM dual', [sdqConsulta.fieldbyname('ep_idempresa').AsInteger]);
              EjecutarSqlSTEx('UPDATE hys.hco_cuitoperativo ' +
                              '   SET co_pramet = ' + SqlValue(MarcaPram) +', '+
                              '       co_usumodif = '+SqlValue(Sesion.UserID)+', '+
                              '       co_fechamodif = sysdate '+
                              ' WHERE co_id = :id', [IdOperativo]);

              with GetQueryEx(' SELECT ep_id, ep_estableci' +
                              ' FROM hys.hep_estabporpreventor ' +
                              ' WHERE ep_idempresa = :idempresa', [sdqConsulta.fieldbyname('ep_idempresa').AsInteger]) do
              try
                while not Eof do
                begin
                  tiposrt := ValorSql('SELECT art.hys.get_calc_tipo_estab_srt(' + SqlValue(sdqConsulta.fieldbyname('ep_idempresa').AsInteger) + ', ' +
                                                                                  SqlValue(fieldbyname('ep_estableci').AsInteger)  + ') FROM dual');

                  EjecutarSqlST(' UPDATE hys.hep_estabporpreventor '+
                                '    SET ep_actividad = ' +
                                '             NVL (art.hys.getactividadestablecimiento (ep_cuit, ep_estableci),'+
                                '                 ''D''),'+
                                '        ep_tipo = ' + SqlValue(tiposrt) +
                                '  WHERE ep_id = '+ SqlValue(fieldbyname('ep_id').AsInteger));
                  Next;
                end;
              finally
                free;
              end;

              EjecutarStoreST('art.hys.do_actualizartipoempresaprev(' +  SqlValue(sdqConsulta.fieldbyname('ep_idempresa').AsInteger) + ');');

            end;

            EjecutarStoreST('art.hys.do_actualizarestado(' +  SqlValue(sdqConsulta.fieldbyname('ep_id').AsInteger) + ');');
            GuardarCantVisitasPersonalizada(sdqConsulta.fieldbyname('ep_idempresa').AsInteger, sdqConsulta.fieldbyname('ep_estableci').AsInteger, edCantVisitas.Value);
            tbRefrescarClick(nil);
  //          if (Sql.SqlType <> stInsert) then ActualizarHistorico;
        end else
        begin //Doy de alta todos los establecimiento para ese CUIT
          fraEstablecimiento.Cargar;
          fraEstablecimiento.sdqDatos.First;
          while (not fraEstablecimiento.sdqDatos.Eof) do
          begin
              Sql.Clear;
              Sql.Fields.Add('EP_IDTIPOESTABPREV', fraTipoEmpresa.Value);
  //            Sql.Fields.Add('ep_actividad', cmbActividad.Value);
              Sql.Fields.Add('ep_itcodigo', fraPreventor.Codigo);
              Sql.Fields.Add('ep_idfirmante', fraPreventor.Value);
              Sql.PrimaryKey.Add('ep_cuit', fraEmpresaEstab.mskCUIT.Text);
              Sql.PrimaryKey.Add('ep_estableci', fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger);
              if (ExisteSql('SELECT 1 FROM hys.hep_estabporpreventor WHERE EP_CUIT = ' + SqlValue(fraEmpresaEstab.mskCUIT.Text)
                                + ' AND EP_ESTABLECI = ' + SqlValue(fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger))) then
              begin
                  Sql.Fields.Add('EP_MOTIVOASIGNACION', fraMotivoAsignacionModif.Codigo);
                  Sql.Fields.Add('EP_FECHAVENCIMIENTOASIG', SqlDate(edVigenciaAsigModif.Date));
                  Sql.Fields.Add('EP_OBSERVACION', edObservacionModif.Text);
                  Sql.Fields.Add('EP_USUMODIF', Sesion.LoginName);
                  Sql.Fields.Add('EP_FECHAMODIF', exDateTime );
                  Sql.SqlType := stUpdate;
  (*
              end;
              else begin
                  Sql.Fields.Add('EP_USUALTA', Sesion.LoginName);
                  Sql.Fields.Add('EP_FECHAALTA', exDateTime );
                  Sql.SqlType := stInsert;
              end;
  *)
                //verifico si hubo cambios
                FCambio:= VerifyChanges;
                EjecutarSqlST( GetSqlABM );
                EjecutarStoreST('art.hys.do_actualizarestado(' +  SqlValue(fraEmpresaEstab.Value ) + ', ' + SqlValue(SqlValue(fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger)) + ');');
                GuardarCantVisitasPersonalizada(fraEmpresaEstab.Value, fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger, edCantVisitas.Value);

  //              if (Sql.SqlType <> stInsert) then ActualizarHistorico;
              end;
              fraEstablecimiento.sdqDatos.Next;
          end;
        end;
        if cbReferente.Checked then ActualizarPreventorReferente(fraEmpresaEstab.Cuit, fraPreventor.Codigo);
        if cbPreventorExclusivo.Checked then ActualizarPreventorExclusivo(fraEmpresaEstab.Value,fraPreventor.Value);
      end;
    end;
    If HacerCommit then
      CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
  FTodos := false;
  //sdqDatosEmpresa.Refresh;
  //sdqDatosEmpresaAfterScroll(dbgEmpresa.DataSource.DataSet);
end;

procedure TfrmGestionEmpresasPreventor.LoadControls;
begin
  ClearControls;
  cbVerPreventorSugeridoABM.Checked := false;
  fraPreventor.ExtraCondition := '';
  fraEmpresaEstab.Locked := true;
  fraEstablecimiento.Locked := true;
  cbTodosEstab.Checked := false;
  cbReferente.Checked := sdqConsulta.FieldbyName('ep_itcodigo').AsString = sdqConsulta.FieldbyName('idreferente').AsString;
  cbPreventorExclusivo.Checked := (sdqConsulta.FieldbyName('it_id').AsInteger = sdqConsulta.FieldbyName('pe_preventorid').AsInteger) and not(sdqConsulta.FieldbyName('it_id').AsInteger = 0);
  fraEmpresaEstab.Value := sdqConsulta.FieldbyName('ep_idempresa').AsInteger;
  fraEmpresaEstab.Reload;

  fraEstablecimiento.Cargar(sdqConsulta.FieldbyName('ep_cuit').AsString,
                            sdqConsulta.FieldbyName('ep_estableci').AsInteger, false);

  edCiuu.Text := ValorSql('SELECT art.hys.get_codactividadrevdos(ac_id, ac_revision) FROM comunes.cac_actividad WHERE AC_CODIGO = ' + SqlValue(fraEstablecimiento.Actividad), '');;
  if ValorSql(' SELECT te_cargamanual FROM hys.hte_tipoempresaprev '+
              '  WHERE te_codigo = '+SqlValue(sdqConsulta.FieldbyName('tipoprevencion').AsString)) = 'S' then
  begin
    fraTipoEmpresa.Locked := False;
    fraTipoEmpresa.ExtraCondition := 'AND te_cargamanual = ''S'' ';
  end
  else
  begin
    fraTipoEmpresa.Locked := True;
    fraTipoEmpresa.ExtraCondition := '';
  end;

  fraTipoEmpresa.Codigo:= sdqConsulta.FieldbyName('tipoprevencion').AsString;
  edTipoSrt.Text := sdqConsulta.FieldbyName('tiposrt').AsString;
  cmbActividad.Value  := sdqConsulta.FieldbyName('ep_actividad').AsString;
  fraPreventor.Codigo := sdqConsulta.FieldbyName('ep_itcodigo').AsString;
  fraMotivoAsignacionModif.Codigo := sdqConsulta.FieldbyName('ep_motivoasignacion').AsString;
  edVigenciaAsigModif.Date := sdqconsulta.FieldbyName('ep_fechavencimientoasig').AsDateTime;
  edObservacionModif.Text := sdqConsulta.FieldbyName('ep_observacion').AsString;
  FIDPreventorAnterior := fraPreventor.Value;
  chkMarcarPram.Enabled := (edTipoSrt.Text = 'ET') or (edTipoSrt.Text = 'GB') or (edTipoSrt.Text = 'CO');
  fraPreventorProvisorio.Value := sdqConsulta.FieldbyName('ep_idpreventorprovisorio').AsInteger;
  edFDesdeVigenciaPrevProvisorio.Tag := trunc(sdqConsulta.FieldbyName('ep_fdesdeprevprovisorio').AsDateTime);
  edFDesdeVigenciaPrevProvisorio.Date := sdqConsulta.FieldbyName('ep_fdesdeprevprovisorio').AsDateTime;
  edFHastaVigenciaPrevProvisorio.Date := sdqConsulta.FieldbyName('ep_fhastaprevprovisorio').AsDateTime;
  if sdqConsulta.FieldbyName('frecuenciavisitapers').IsNull then
    edCantVisitas.Text := ''
  else
    edCantVisitas.Value := sdqConsulta.FieldbyName('frecuenciavisitapers').AsInteger;

  if (sdqConsulta.FieldbyName('ep_pramet').AsString = 'S') then
  begin
    chkMarcarPram.Checked := true;
    chkMarcarPram.Tag := 1;
  end
  else begin
    chkMarcarPram.Checked := false;
    chkMarcarPram.Tag := 0;
  end;
(*
  cbReferente.Checked := ExisteSql(' select 1 ' +
                                   ' from afi.APC_PREVENTORCONTRATO ' +
                                   ' where PC_CONTRATO = art.get_vultcontrato(' + SqlValue(sdqConsulta.FieldbyName('em_cuit').AsString)  + ') ' +
                                   ' and PC_CODIGOPREVENTOR = ' + SqlValue(fraPreventor.Codigo) +
                                   ' and (PC_FECHA_HASTA >= sysdate or PC_FECHA_HASTA is null) ');
*)
end;

function TfrmGestionEmpresasPreventor.Validar: Boolean;
begin
    {if ModoABM = maModificacion Then
    begin
      if(sdqConsulta.FieldByName('EP_ITCODIGO').AsString <> fraPreventor.Codigo) and not cbVerPreventorSugeridoABM.Checked then
      begin
        Verificar(fraMotivoAsignacionModif.IsEmpty,fraMotivoAsignacionModif,'Debe seleccionar un motivo por el cual se cambio el preventor.');
        Verificar(fraMotivoAsignacionModif.IsBaja,fraMotivoAsignacionModif,'Debe ser un motivo activo.');
      end;
    end;
    }
    Verificar(fraPreventorProvisorio.IsSelected and (edFDesdeVigenciaPrevProvisorio.Date = 0), edFDesdeVigenciaPrevProvisorio,
              'Debe completar la fecha desde si esta asignado un preventor provisorio.');
    if edFDesdeVigenciaPrevProvisorio.Date > 0 then
      Verificar((edFDesdeVigenciaPrevProvisorio.Tag <> edFDesdeVigenciaPrevProvisorio.Date) and (edFDesdeVigenciaPrevProvisorio.Date < DBDate),
                 edFDesdeVigenciaPrevProvisorio,'La fecha de desde debe ser mayor o igual a hoy');
    verificar(edFHastaVigenciaPrevProvisorio.Date < edFDesdeVigenciaPrevProvisorio.Date,edFHastaVigenciaPrevProvisorio,
              'La fecha hasta debe ser mayor igual a la desde');
    Result := VerificarMultiple(['ABM de Establecimiento por Preventor',
                                fraEmpresaEstab, fraEmpresaEstab.IsSelected, 'Debe especificar la empresa.',
                                fraEstablecimiento, (fraEstablecimiento.IsSelected) or (cbTodosEstab.Checked), 'Debe especificar el establecimiento',
                                fraTipoEmpresa, fraTipoEmpresa.IsSelected, 'Debe especificar el tipo de Empresa',
                                cmbActividad, cmbActividad.Text <> '', 'Debe especificar la actividad de la Empresa',
                                fraPreventor, (not fraPreventor.IsSelected) or (fraPreventor.IsSelected and fraPreventor.sdqDatos.FieldByName(CD_ALIAS_BAJA).IsNull), 'El preventor debe estar activo'
                              ]);
end;

procedure TfrmGestionEmpresasPreventor.FormCreate(Sender: TObject);
begin
  inherited;
  setHacerCommit(True);
  dHoy := DBDate;

  ModoForm := mfEstablecimientos;
  SelectedList := TBookMarkLst.Create;
  SelectedListEmpresas := TBookMarkLst.Create;
  FTodos:= false;

  with fraDepart do
  begin
    Propiedades.SQL :=
              '  SELECT  ROWNUM AS ID, '
            + '          ROWNUM AS codigo, '
            + '          cp_departamento AS descripcion '
            + '    FROM  (SELECT  DISTINCT cp_departamento '
            + '             FROM  art.ccp_codigopostal '
            + '            WHERE  cp_departamento IS NOT NULL) depto WHERE 1=1'
            ;

  end;

  with fraTipoEmpresa do
  begin
    TableName := 'HYS.HTE_TIPOEMPRESAPREV';
    FieldDesc := 'TE_CODIGO';
    FieldID := 'TE_ID';
    FieldCodigo := 'TE_CODIGO';
    FieldBaja := 'TE_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ExtraFields := ', te_tiposrt ';
    OnChange := fraTipoEmpresaChange;
  end;

  with fraMotivoReasignacion do
  begin
    TableName := 'HYS.HMR_MOTIVOREASIGNACIONTAREA';
    FieldDesc := 'MR_DESCRIPCION';
    FieldID := 'MR_ID';
    FieldCodigo := 'MR_ID';
    FieldBaja := 'MR_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := false;
  end;

  with fraTipoEmpresaCambioTipoPrev do
  begin
    TableName := 'HYS.HTE_TIPOEMPRESAPREV';
    FieldDesc := 'TE_CODIGO';
    FieldID := 'TE_ID';
    FieldCodigo := 'TE_CODIGO';
    FieldBaja := 'TE_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ExtraFields := ', te_tiposrt ';
    ExtraCondition := 'AND te_cargamanual = ''S'' ';
  end;

  with fraTipoEmpresa do
  begin
    TableName := 'HYS.HTE_TIPOEMPRESAPREV';
    FieldDesc := 'TE_CODIGO';
    FieldID := 'TE_ID';
    FieldCodigo := 'TE_CODIGO';
    FieldBaja := 'TE_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ExtraFields := ', te_tiposrt ';
    OnChange := fraTipoEmpresaChange;
  end;

  with fraSubTipo do
  begin
    TableName := 'HYS.HST_SUBTIPO';
    FieldDesc := 'ST_DESCRIPCION';
    FieldID := 'ST_ID';
    FieldCodigo := 'ST_ID';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraCambioPrevExclusivo do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := false;
  end;

  with GetQuery('SELECT * FROM HYS.hor_obrasresolucion ') do
  try
    cmbResolucion.Items.AddObject('Sin Programa', TObject(0));
    while not Eof do
    begin
      cmbResolucion.Items.AddObject(fieldbyname('or_descripcion').AsString, TObject(fieldbyname('or_id').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  with GetQuery('SELECT * FROM hys.hzc_zonacodigopostal order by zc_descripcion') do
  try
    cmbZona.Items.AddObject('Sin Zona', TObject(0));
    while not Eof do
    begin
      cmbZona.Items.AddObject(fieldbyname('zc_descripcion').AsString, TObject(fieldbyname('zc_id').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  with fraTipoEmpresaModif do
  begin
    TableName := 'HYS.HTE_TIPOEMPRESAPREV';
    FieldDesc := 'TE_CODIGO';
    FieldID := 'TE_ID';
    FieldCodigo := 'TE_CODIGO';
    FieldBaja := 'TE_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ExtraFields := ', te_tiposrt ';
  end;

  with fraPreventorRef do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  with fraPreventorExclusivo do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;


  with fraCambioPrevRef do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := false;
  end;

  with fraPreventorNotif do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;

  fraTipoFiltroSRT.Clave := 'TFET';

  fraEmpresaEstab.OnChange := OnEmpresaChange;
  fraEmpresaEstab.ShowBajas := true;
  fraEmpresaEstab.ExtraCondition := '     AND co_contrato = '+
                                    ' (SELECT MAX (b.co_contrato) '+
                                    '    FROM aco_contrato b '+
                                    '   WHERE b.co_idempresa = em_id '+
                                    '     AND NOT EXISTS (SELECT 1 '+
                                    '    FROM art.abc_bajadecontrato '+
                                    '   WHERE b.co_contrato = bc_contrato)) ';

  fraEmpresaModif.ShowBajas := true;
  fraEmpresaModif.ExtraCondition := '     AND co_contrato = '+
                                    ' (SELECT MAX (b.co_contrato) '+
                                    '    FROM aco_contrato b '+
                                    '   WHERE b.co_idempresa = em_id '+
                                    '     AND NOT EXISTS (SELECT 1 '+
                                    '    FROM art.abc_bajadecontrato '+
                                    '   WHERE b.co_contrato = bc_contrato)) ';

  fraEmpresaFiltro.OnChange := OnEmpresaChangeFiltro;
  fraEmpresaFiltro.ShowBajas := true;
  fraEmpresaFiltro.ExtraCondition := '     AND co_contrato = '+
                                     ' (SELECT MAX (b.co_contrato) '+
                                     '    FROM aco_contrato b '+
                                     '   WHERE b.co_idempresa = em_id '+
                                     '     AND NOT EXISTS (SELECT 1 '+
                                     '    FROM art.abc_bajadecontrato '+
                                     '   WHERE b.co_contrato = bc_contrato)) ';
  VCLExtra.LockControl(edEstablecimiento, true);

  fraEstablecimiento.ShowBajas := false;

  with GetQuery('SELECT * FROM HYS.HTE_TIPOEMPRESAPREV WHERE TE_APLICA LIKE ''%C%''') do
  try
    while not Eof do
    begin
      cmbTipoEmpresaPrev.Items.AddObject(fieldbyname('TE_CODIGO').AsString, TObject(fieldbyname('TE_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  with GetQuery('SELECT *  FROM afi.age_grupoeconomico WHERE ge_temporal IS NULL order by GE_DESCRIPCION') do
  try
    while not Eof do
    begin
      cmbHolding.Items.AddObject(fieldbyname('GE_DESCRIPCION').AsString, TObject(fieldbyname('GE_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  with GetQuery('SELECT * FROM HYS.HEE_ESTADOESTAB ') do
  try
    while not Eof do
    begin
      cmbEstadoEstab.Items.AddObject(fieldbyname('EE_DESCRIPCION').AsString, TObject(fieldbyname('EE_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  with fraPreventor do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
  end;

  with fraPreventorProvisorio do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
  end;

  with fraPreventorFiltro do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := true;
  end;

  with fraPreventorNuevo do
  begin
      TableName := 'ART.PIT_FIRMANTES';
      FieldDesc := 'IT_NOMBRE';
      FieldID := 'IT_ID';
      FieldCodigo := 'IT_CODIGO';
      FieldBaja := 'IT_FECHABAJA';
      CaseSensitive := false;
      ShowBajas := false;
  end;

  pcFiltros.ActivePageIndex := 0;

  Sql.TableName := 'hys.hep_estabporpreventor';
  FieldBaja := 'ep_fechabaja';

  fraLocalidad.FieldCPostal := 'es_cpostal';
  fraLocalidad.FieldLocalidad := 'es_localidad';
  fraLocalidad.FieldProvincia := 'es_provincia';

  With fraRanking do
  begin
    TableName    := 'HYS.HRK_RANKING';
    FieldID      := 'RK_ID';
    FieldCodigo  := 'RK_ID';
    FieldDesc    := 'RK_DESCRIPCION';
    FieldBaja    := 'RK_FECHABAJA';
    ShowBajas    := True;
  end;

  With fraSubTipoFiltro do
  begin
    TableName    := 'hys.hst_subtipo';
    FieldID      := 'st_id';
    FieldCodigo  := 'st_id';
    FieldDesc    := 'st_descripcion';
  end;

  with fraPerfil do
  begin
    TableName := 'hys.hpf_perfil';
    FieldDesc := 'pf_descripcion';
    FieldID := 'pf_id';
    FieldCodigo := 'pf_id';
    FieldBaja := 'pf_fechabaja';
    ShowBajas := false;
  end;

  with fraMotivoAsignacion do
  begin
    TableName := 'HYS.HMA_MOTIVOASIGPREV';
    FieldDesc := 'ma_descripcion';
    FieldID := 'ma_id';
    FieldCodigo := 'ma_id';
    FieldBaja := 'ma_fechabaja';
    ExtraFields := ' , ma_diasvigencia ';
    OnChange := fraMotivoAsignacionChange;
    ShowBajas := false;
  end;

  with fraMotivoAsignacionFiltro do
  begin
    TableName := 'HYS.HMA_MOTIVOASIGPREV';
    FieldDesc := 'ma_descripcion';
    FieldID := 'ma_id';
    FieldCodigo := 'ma_id';
    FieldBaja := 'ma_fechabaja';
    ExtraFields := ' , ma_diasvigencia ';
    ShowBajas := true;
  end;

  with fraMotivoAsignacionModif do
  begin
    TableName := 'HYS.HMA_MOTIVOASIGPREV';
    FieldDesc := 'ma_descripcion';
    FieldID := 'ma_id';
    FieldCodigo := 'ma_id';
    FieldBaja := 'ma_fechabaja';
    ExtraFields := ' , ma_diasvigencia ';
    OnChange := fraMotivoAsignacionModifChange;
    ShowBajas := false;
  end;

  with GetQuery('SELECT * FROM art.ctb_tablas WHERE tb_clave = ''SECT'' and tb_codigo <> 0') do
  try
    while not Eof do
    begin
      cmbSector.Items.AddObject(fieldbyname('TB_DESCRIPCION').AsString, TObject(fieldbyname('TB_CODIGO').AsInteger));
      if fieldbyname('TB_CODIGO').AsInteger <> 1 then
        cmbSector.Checked[fieldbyname('TB_CODIGO').AsInteger-1] := True;
      Next;
    end;
  finally
    free;
  end;

  with GetQuery('SELECT * FROM hys.hca_categoriariesgo') do
  try
    while not Eof do
    begin
      cmbCategoriaRiesgo.Items.AddObject(fieldbyname('CA_DESCRIPCION').AsString, TObject(fieldbyname('CA_ID').AsInteger));
      Next;
    end;
  finally
    free;
  end;

  {true para que aparezcan por default tildados los asiganbles en el combo de filtro}
  LlenarEstabTipoEventual(False); //26-04 se pone en false ticket 17500
  chkGBA.Checked := false;
  cbNoTercerizado.Checked := True;
  edCantTrabajadoresMin.Text := '1';

  tbSalir.Left := tbEstimacionVisitasAnual.Left + 1;
  pnlColorRef.Top := Grid.Top;
end;

procedure TfrmGestionEmpresasPreventor.tbRefrescarClick(
  Sender: TObject);
begin
  VerificarMultiple(['Aplicar Consulta',
                     fraTipoFiltroSrt,
                     (not fraSubTipoFiltro.IsSelected) or
                     (fraSubTipoFiltro.IsSelected and fraTipoFiltroSrt.IsSelected),
                     'Debe especificar también el tipo de empresa']);

  SelectedList.Clear;
  ArmarQueryEstablecimiento;
  ArmarQueryEmpresa;
  if (FModoForm = mfEstablecimientos) then
    RefreshData
  else
    sdqDatosEmpresa.Open;

end;

procedure TfrmGestionEmpresasPreventor.ArmarQueryEstablecimiento;
var
  Indice: String;
  Lista: String;
  sIn: String;
  sFiltroPreventor: String;
  sPreventorIn: String;

  i: integer;
  sSelectSug, sFromSug, sWhereSug, sEstabTipoEventual, sWhereDepart, sWhereFechasVisita: String;

  function HayDependencia (Actual, Buscado: LongInt): Boolean;
  begin
    Result := False;

    if Actual <> 0 then
      Result := (Actual = Buscado) or
                HayDependencia (ValorSqlInteger('SELECT it_idsupervisor ' +
                                '  FROM art.pit_firmantes ' +
                                ' WHERE it_id = ' + SqlInteger(Actual)), Buscado)
  end;

begin
    Indice := '';

(*
    // Cancelo filtro por Referente si está seleccionado pero no hay Referente indicado
    cbPreventorReferente.Checked := cbPreventorReferente.Checked and
                                    (Trim(fraPreventorFiltro.cmbDescripcion.Text) <> '');
*)

    sdqDatosEmpresa.Close;
    sdqConsulta.SQL.Clear;
    sWhere := '';
    sFrom := '';
    sSelect := '';
    sSelectSug := '';
    sFromSug := '';
    sWhereSug := '';
    sFiltroPreventor := '';
    sPreventorIn := '';

    for i:=0 to lstPrev.Count-1 do
    begin
      if (sPreventorIn <> '') then
        sPreventorIn := sPreventorIn + ', ';
      sPreventorIn := sPreventorIn + IntToStr(Integer(lstPrev.Items.Objects[i]));
    end;

    if (sPreventorIn = '') and fraPreventorFiltro.IsSelected then
      sPreventorIn := IntToStr(fraPreventorFiltro.Value);

    if fraEmpresaFiltro.IsSelected then
      sWhere := sWhere + ' and hep.ep_idempresa = ' +  SqlValue(fraEmpresaFiltro.Value);

    if fraEmpresaFiltro.IsSelected then
      sWhere := sWhere + ' and hep.ep_idempresa = ' +  SqlValue(fraEmpresaFiltro.Value);

    if cbEmpresaVip.Checked then
      sWhere := sWhere +
        ' AND EXISTS(SELECT DISTINCT 1 '+
        '        FROM comunes.cev_empresavip '+
        '       WHERE ev_idempresa = hep.ep_idempresa '+
        '         AND SYSDATE BETWEEN ev_vigenciadesde AND NVL(ev_vigenciahasta, SYSDATE + 1)) ';

    if (FModoForm = mfEstablecimientos) and (sPreventorIn <> '')
    and cmbVerPreventorExclusivo.Checked then
      sWhere := sWhere +
        ' AND EXISTS ( '+
        '  SELECT 1 '+
        '    FROM hys.hpe_preventorexclusivo '+
        '   WHERE pe_idempresa = em_id '+
        '     AND pe_fechabaja IS NULL '+
        '     AND pe_preventorid in ' +  sPreventorIn + ')';
    if (FModoForm = mfEstablecimientos) and cmbEmpresaPreventorExclusivo.Checked then
      sWhere := sWhere +
        '  AND EXISTS (SELECT 1 '+
        '                FROM hys.hpe_preventorexclusivo '+
        '               WHERE pe_idempresa = em_id AND pe_fechabaja IS NULL) ';
    if (FModoForm = mfEstablecimientos) and cmbEmpresaSinPreventorExclusivo.Checked then
      sWhere := sWhere +
        '  AND NOT EXISTS (SELECT 1 '+
        '                    FROM hys.hpe_preventorexclusivo '+
        '                   WHERE pe_idempresa = em_id AND pe_fechabaja IS NULL) ';

    if (FModoForm = mfEstablecimientos) and fraPreventorFiltro.IsSelected then
    begin
      if (cbListarCoordinados.Checked) then
      begin

        Lista := SqlValue(fraPreventorFiltro.Codigo);

        with sdqConSupervisor do
        begin
          Sql.Clear;
          Sql.Add ( 'SELECT it_id, it_codigo ' +
                    '  FROM art.pit_firmantes ' +
                    ' WHERE it_id <> ' + SqlNumber(fraPreventorFiltro.Value) +
                    '   AND NOT (it_idsupervisor IS NULL)' );
          Open;
          while not EoF do
          begin
            if HayDependencia (FieldByName('it_id').AsInteger, fraPreventorFiltro.Value) then
               Lista := Lista + ', ''' + FieldByName('it_codigo').AsString+'''';
            Next;
          end;
          Close;
        end;

        Indice := '';  // HASTA QUE NO DE ERROR!!!!  '/*+ FULL(PIT) */';
        sFiltroPreventor := sFiltroPreventor + 'AND hep.ep_itcodigo IN ( ' + Lista + ')'
      end;
    end;

    // agrego filtro por Preventor referente
    if fraPreventorFiltro.IsSelected and (cbPreventorReferente.Checked) then
      sWhere := sWhere + ' and art.hys.get_preventor_referente(hep.ep_cuit) = ' + SqlValue(fraPreventorFiltro.Codigo);

    if (cmbPreventorUltVisita.Checked) and (sPreventorIn <> '') then
      sWhere := sWhere + ' AND ep_preventorultvisita in (' + sPreventorIn + ') '
    else begin
      if not cbSinPreventor.Checked and not cbListarCoordinados.Checked and
         not cbPreventorReferente.Checked and not cmbVerPreventorExclusivo.Checked and
         not cbPreventorProvisorioFiltro.Checked and
         (sPreventorIn <> '') then
        sFiltroPreventor := sFiltroPreventor + ' and hep.ep_idfirmante in (' + sPreventorIn + ') ';
    end;

    if (cbPreventorProvisorioFiltro.Checked) and (sPreventorIn <> '') then
      sWhere := sWhere + ' AND ep_idpreventorprovisorio in (' + sPreventorIn + ') ';

    if (cbSinPreventor.Checked) then
        sWhere := sWhere + ' and hep.ep_idfirmante is null ';

    if (FModoForm = mfEstablecimientos) and (cmbResolucion.Text <> '') then
    begin
      sIn := '';
      for i:=0 to cmbResolucion.Items.Count-1 do
        if cmbResolucion.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbResolucion.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + ' and nvl(hep.EP_NRORESOLUCION,0) in (' + sIn  + ')';

    sIn := '';

    if (FModoForm = mfEstablecimientos) and (cmbZona.Text <> '') then
    begin
      sIn := '';
      for i:=0 to cmbZona.Items.Count-1 do
        if cmbZona.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbZona.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + ' and nvl((SELECT distinct zc_id FROM art.ccp_codigopostal, hys.hzc_zonacodigopostal '+
                         ' WHERE cp_zonaucap = zc_id AND cp_codigo = es_cpostal '+
                         ' AND cp_provincia = es_provincia),0) in (' + sIn  + ')';
    sIn := '';


    if (not fraLocalidad.IsEmpty) then
        sWhere := sWhere + fraLocalidad.GetWhere;

    if (FModoForm = mfEstablecimientos) and not edActividad.IsEmpty then
        sWhere := sWhere + ' and  substr(art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision),1,' + inttostr(length(edActividad.Text)) + ') = ' + SqlValue(edActividad.Text);

    if (FModoForm = mfEstablecimientos) and ((not edCantTrabajadoresMin.IsEmpty) or (not edCantTrabajadoresMax.IsEmpty)) then
    begin
        sWhere := sWhere + iif((not edCantTrabajadoresMin.IsEmpty), ' and NVL (co_totempleadosactual, co_totempleados) >= ' + SqlValue(edCantTrabajadoresMin.Value), '');
        sWhere := sWhere + iif((not edCantTrabajadoresMax.IsEmpty), ' and NVL (co_totempleadosactual, co_totempleados) <= ' + SqlValue(edCantTrabajadoresMax.Value), '');
    end;

    if chkGBA.Checked then
      sWhere := sWhere + ' and exists (select 1 from art.ccp_codigopostal where aes.es_cpostal = cp_codigo and cp_gba = ''S''' + ')';

    if chkCancerigenos.Checked then
      sWhere := sWhere + ' and  EP_CANCERIGENOS = ''S'' ';

    if chkDifenilos.Checked then
      sWhere := sWhere + ' and  EP_DIFENILOS = ''S'' ';

    if chkAccMayores.Checked then
      sWhere := sWhere + ' and  EP_ACCMAYORES = ''S'' ';

    if edEstablecimiento.Text <> '' then
        sWhere := sWhere + ' and aes.es_nroestableci in (' + ArmarFiltroEstab(edEstablecimiento.Text)  + ')';

    if (FModoForm = mfEstablecimientos) and (fraSubTipoFiltro.IsSelected) then
      sWhere := sWhere + '   AND co_idsubtipo = ' + SqlValue(fraSubTipoFiltro.Value);

    if (fraMotivoAsignacionFiltro.IsSelected) then
      sWhere := sWhere + '   AND ep_motivoasignacion = ' + SqlValue(fraMotivoAsignacionFiltro.Codigo);

    if (edVigenciaAsigFiltro.Date>0) and (edVigenciaAsigFiltro2.Date >0) then
      sWhere := sWhere + '   AND ep_fechavencimientoasig between ' + SqlDate(edVigenciaAsigFiltro.Date)+ ' AND '+SqlDate(edVigenciaAsigFiltro2.Date);

    if (fraPerfil.IsSelected) then
      sWhere := sWhere + '   AND pit.it_idperfil = ' + SqlValue(fraPerfil.Value);

    if (FModoForm = mfEstablecimientos) and fraTipoFiltroSRT.IsSelected then
      sWhere := sWhere + ' and hep.ep_tipo = ' + SqlValue(fraTipoFiltroSRT.Codigo);

    if (FModoForm = mfEstablecimientos) and (cmbTipoEmpresaPrev.Text <> '') then
    begin
      sIn := '';
      for i:=0 to cmbTipoEmpresaPrev.Items.Count-1 do
        if cmbTipoEmpresaPrev.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbTipoEmpresaPrev.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + ' and EP_IDTIPOESTABPREV in (' + sIn  + ')';

    sIn := '';
    if cmbEstadoEstab.Text <> '' then
    begin
      sIn := '';
      for i:=0 to cmbEstadoEstab.Items.Count-1 do
        if cmbEstadoEstab.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbEstadoEstab.Items.Objects[i]));
        end;
    end;

    if (sIn <> '') then
      sWhere := sWhere + ' and hep.ep_idestado + 0 in (' + sIn  + ')';

    sIn := '';
    if cmbHolding.Text <> '' then
    begin
      sIn := '';
      for i:=0 to cmbHolding.Items.Count-1 do
        if cmbHolding.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbHolding.Items.Objects[i]));
        end;
    end;

    if(FModoForm = mfEstablecimientos) and (sIn <> '') then
      sWhere := sWhere + ' and aem.em_idgrupoeconomico + 0 in (' + sIn  + ')';

    sIn := '';
    if cmbSector.Text <> '' then
    begin
      sIn := '';
      for i:=0 to cmbSector.Items.Count-1 do
        if cmbSector.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbSector.Items.Objects[i]));
        end;
    end;

    if (FModoForm = mfEstablecimientos) and (sIn <> '') then
      sWhere := sWhere + '   AND em_sector + 0 in (' + sIn  + ')';

    sIn := '';
    if cmbCategoriaRiesgo.Text <> '' then
    begin
      sIn := '';
      for i:=0 to cmbCategoriaRiesgo.Items.Count-1 do
        if cmbCategoriaRiesgo.Checked[i] then
        begin
          if (sIn <> '') then sIn := sIn + ', ';
          sIn := sIn + SqlValue(integer(cmbCategoriaRiesgo.Items.Objects[i]));
        end;
    end;

    if (FModoForm = mfEstablecimientos) and (sIn <> '') then
      sWhere := sWhere + '   AND ca_id + 0 in (' + sIn  + ')';

    if cbAnexoI.Checked then
      sWhere := sWhere + ' and EP_ANEXO1 = ' + SqlValue(cmbAnexoI.Value);

    if cbAnexoII.Checked then
      sWhere := sWhere + ' and EP_ANEXO2 = ' + SqlValue(cmbAnexoII.Value);

    if cbPrs.Checked then
      sWhere := sWhere + ' and EP_TIENEPRS = ' + SqlValue(cmbPrs.Value);

    if cbPAL.Checked then
      sWhere := sWhere + ' and EP_TIENEPAL = ' + SqlValue(cmbPAL.Value);

    if cbDenunciasGrales.Checked then
      sWhere := sWhere + ' and EP_TIENEDENUNCIAGRAL = ' + SqlValue(cmbDenunciasGrales.Value);

    if cbOtrasDenuncias.Checked then
      sWhere := sWhere + ' and EP_TIENEDENUNCIA = ' + SqlValue(cmbOtrasDenuncias.Value);

    if cbUltimoOperativo.Checked then
      sWhere := sWhere + ' and CO_OPERATIVO = art.hys.get_operativovigente_empresa (ep_cuit, SYSDATE)' ;

    if cbAvisoObra.Checked then
      if cmbAvisoObra.Value = 'S' then
        sWhere := sWhere + ' AND ep_fechainicioobra IS NOT NULL '
      else if cmbAvisoObra.Value = 'N' then
        sWhere := sWhere + ' AND ep_fechainicioobra IS NULL ';

    if (cbExcluirBajas.Checked) then
        sWhere := sWhere + ' and aes.es_fechabaja is null ';

    if (cbEventual.Checked) then
        sWhere := sWhere + ' and aes.es_eventual = ''S'' '
    else
        sWhere := sWhere + '      AND NOT EXISTS(SELECT 1 ' +
                           '                       FROM hys.pev_estabeventual ' +
                           '                     WHERE ev_id = es_idestabeventual ' +
                           '                       AND ev_asignable = ''N'')';


    if (FModoForm = mfEstablecimientos) and fraRanking.IsSelected then
    begin
      sWhere := sWhere + ' and (exists (SELECT 1 ' +
                         '                FROM hys.hre_rankingempresa ' +
                         '               WHERE re_idranking =  ' + sqlInteger(fraRanking.Codigo) +
                         '                 AND re_idempresa = em_id))'
    end;

    // agrego filtro por Preventor tercerizado
    if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
    begin
      if (cbTercerizado.Checked) then
        sWhere := sWhere + ' AND (es_idestabeventual = 3 OR es_idestabeventual IS NULL)' ;

      if (cbNoTercerizado.Checked) then
        sWhere := sWhere + ' AND (es_idestabeventual <> 3 OR es_idestabeventual IS NULL)';
    end;

    if cbVerPreventorSugerido.Checked then
    begin
      sSelectSug := sSelectSug + ', pit3.it_nombre prevsugerido, pit3.it_id idprevsugerido ' ;
      sFromSug := sFromSug + ', art.pit_firmantes pit3 ';
      sWhereSug := sWhereSug + ' AND pit3.it_id = art.hys.get_preventor_sugerido(es_cpostal, es_provincia, ep_idtipoestabprev, ep_actividad, em_sector, ' +
                       '                           es_idactividad, NVL (co_totempleadosactual, co_totempleados)) ';
      Grid.ColumnByField['prevsugerido'].Visible := true;
    end
    else begin
      Grid.ColumnByField['prevsugerido'].Visible := false;
      sSelectSug := sSelectSug + ', null prevsugerido, to_number(null) idprevsugerido ' ;
    end;

    if cbCtosActivos.Checked then
      sWhere := sWhere + ' and co_estado = ''1'' ';

    sIN := '';
    if cmbEstabTiposEventual.CheckedCount > 0 then
    begin
      for i := 0 to cmbEstabTiposEventual.Items.Count -1 do
      begin
        if cmbEstabTiposEventual.Checked[i] then
          sIN := sIN + SqlValue(integer(cmbEstabTiposEventual.Items.Objects[i])) + ',';
      end;
      sIN := LeftStr(sIN, Length(sIN)-1);
      sEstabTipoEventual :=
          ' AND nvl(ES_IDESTABEVENTUAL, 1) in (' + sIN + ')';
    end;

    sIN := '';
    if fraDepart.IsSelected then
      sWhereDepart :=
          ' AND art.utiles.get_partido(aes.es_cpostal, aes.es_provincia) = ' +
              SqlValue(fraDepart.cmbDescripcion.Text);


    if not chkSinVisita.Checked then
    begin
      if (not edVisitaDesde.IsEmpty) and (not edVisitaHasta.IsEmpty) then
        Verificar(
            edVisitaDesde.Date > edVisitaHasta.Date,
            edVisitaHasta, 'La fecha HASTA no puede ser menor a la fecha DESDE.');

      if (not edVisitaDesde.IsEmpty) and (not edVisitaHasta.IsEmpty) then
        sWhereFechasVisita :=
            sWhereFechasVisita
            + ' AND (ep_fechaultvisita BETWEEN ' + QuotedStr(DateToStr(edVisitaDesde.Date))
            + '      AND ' + QuotedStr(DateToStr(edVisitaHasta.Date)) + ')'
      else if not edVisitaDesde.IsEmpty then
        sWhereFechasVisita :=
            sWhereFechasVisita + ' AND ep_fechaultvisita >= ' + QuotedStr(DateToStr(edVisitaDesde.Date))
      else if not edVisitaHasta.IsEmpty then
        sWhereFechasVisita :=
            sWhereFechasVisita + ' AND ep_fechaultvisita <= ' + QuotedStr(DateToStr(edVisitaHasta.Date));
    end else
      sWhereFechasVisita := ' AND ep_fechaultvisita IS NULL ';

    sdqConsulta.SQL.Add(
              'SELECT  /*+ first_rows */ '
            + '      ep_id, '
            + '        ep_cuit, '
            + '        ep_idempresa, '
            + '        aem.em_nombre, '
            + '        ep_estableci, '
            + '        aes.es_nombre, '
            + '        ep_tipo tiposrt, '
            + '        tipoestab.te_codigo tipoprevencion,tipoestab.te_cargamanual, '
            + '        tipoemp.te_codigo tipoprevempresa, '
            + '        art.hys.get_preventor_referente (hco.co_cuit) idreferente, '
            + '        ep_actividad, '
            + '        ep_idfirmante, '
            + '        ep_itcodigo, '
            + '        pit.it_nombre, '
            + '        NVL (es_eventual, ''N'') es_eventual, '
            + '        art.hys.get_nombre_preventor_coord (pit.it_codigo) it_coordinador, '
            + '        NVL (co_totempleadosactual, co_totempleados) AS rc_empleados, '
            + '        dc_telefonos, '
            + '        art.afi.armar_domicilio ( '
            + '                                 es_calle, '
            + '                                 es_numero, '
            + '                                 es_piso, '
            + '                                 es_departamento, '
            + '                                 es_localidad '
            + '                                ) || '
            + '        NVL2 ( '
            + '              es_telefonos, '
            + '              '' Tel.'' || (NVL (es_codareatelefonos, '''') || es_telefonos), '
            + '              '''' '
            + '             ) '
            + '           AS domicilio, '
            + '        es_localidad, '
            + '        es_cpostal, '
            + '        art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision) ac_relacion, '
            + '        ac_codigo ac_codigoactual, '
            + '        es_cpostala, '
            + '        co_contrato, '
            + '        ge_descripcion, '
            + '        ca_id, '
            + '        ca_descripcion, '
            + '        ac_idcategoriariesgo, '
            + '        art.getdescripcionprovincia (es_provincia) AS prov, '
            + '        es_provincia, '
            + '        ep_motivoasignacion, '
            + '        ep_fechavencimientoasig, '
            + '        ep_observacion, '
            + '        hma.ma_descripcion, '
            + '        ep_fechabaja, '
            + '        ep_usubaja, '
            + '        es_fechabaja, '
            + '        ep_anexo1, '
            + '        ep_anexo2, '
            + '        ep_anexo1ficticio, '
            + '        ep_tienedenunciagral, '
            + '        ep_tienedenuncia, '
            + '        ep_tieneprs, '
            + '        ep_tienepal, '
            + '        ep_fechaultvisita, '
            + '        ep_fechaultrelev, '
            + '        ep_fechaultcap, '
            + '        pit2.it_nombre prevultvisita, '
            + '        ee_descripcion, '
            + '        co_estab_evento, '
            + '        ep_fechainicioobra, '
            + '        ep_fechaextensionobra, '
            + '        ep_fechafinobra, '
            + '        ep_cantvisitas, '
            + '        ep_cantcapacit, '
            + '        ep_cantrelev, '
            + '        pit.it_id, '
            + '        ep_nroresolucion, '
            + '        (SELECT  pe_preventorid '
            + '           FROM  hys.hpe_preventorexclusivo '
            + '          WHERE  pe_idempresa = em_id AND pe_fechabaja IS NULL) '
            + '           pe_preventorid, '
            + '        ep_cancerigenos, '
            + '        ep_difenilos, '
            + '        ep_accmayores, ep_tiporelev, '
            + '        (SELECT  DISTINCT zc_descripcion '
            + '           FROM  art.ccp_codigopostal, '
            + '                 hys.hzc_zonacodigopostal '
            + '          WHERE  cp_zonaucap = zc_id AND cp_codigo = es_cpostal AND cp_provincia = es_provincia) '
            + '           AS zc_descripcion, '
            + '        co_vigenciahasta '
            +          sSelectSug + ', '
            + '        art.utiles.get_partido(aes.es_cpostal, aes.es_provincia) departamento, '
            + '        ep_pramet, '
            + '        DECODE(art.afiliacion.is_empresavip(co_contrato), ''S'', ''VIP'', ''N'', NULL) empresavip, '
            + '        hys.get_frecuenciapersonalizada(ep_idempresa, ep_estableci) frecuenciavisitapers, '
            + '        tb_descripcion sector,art.hys.get_validorelev463(co_contrato,ep_estableci) valido463, '
            + '        ep_idpreventorprovisorio, ep_fdesdeprevprovisorio, ep_fhastaprevprovisorio, pit3.it_nombre preventorprovisorio '
            +          sSelect
            + '  FROM  afi.adc_domiciliocontrato ahdl, '
            + '        hys.hep_estabporpreventor hep, '
            + '        afi.aem_empresa aem, '
            + '        afi.aco_contrato aco, '
            + '        afi.aes_establecimiento aes, '
            + '        art.ctb_tablas tbsector, '
            + '        comunes.cac_actividad cac, '
            + '        afi.age_grupoeconomico age, '
            + '        hys.hte_tipoempresaprev tipoestab, '
            + '        hys.hte_tipoempresaprev tipoemp, '
            + '        hys.hco_cuitoperativo hco, '
            + '        hys.hee_estadoestab, '
            + '        hys.hca_categoriariesgo hca, '
            + '        art.pit_firmantes pit, '
            + '        art.pit_firmantes pit2, '
            + '        art.pit_firmantes pit3, '
            + '        hys.hma_motivoasigprev hma '
            +          sFrom
            +          sFromSug
            + ' WHERE  co_contrato             = art.get_vultcontrato (em_cuit) '
            + '    AND ahdl.dc_contrato(+)     = aco.co_contrato '
            + '    AND ahdl.dc_tipo(+)         = ''L'' '
            + '    AND cac.ac_idcategoriariesgo= hca.ca_id(+) '
            + '    AND aem.em_idgrupoeconomico = ge_id(+) '
            + '    AND hep.ep_idempresa        = aem.em_id '
            + '    AND aem.em_id               = aco.co_idempresa '
            + '    AND aes.es_nroestableci     = hep.ep_estableci '
            + '    AND aco.co_contrato         = aes.es_contrato '
            + '    AND cac.ac_id               = aes.es_idactividad '
            + '    AND ep_idtipoestabprev      = tipoestab.te_id(+) '
            + '    AND co_idtipoempresaprev    = tipoemp.te_id(+) '
            + '    AND hco.co_id(+)            = ep_idcooperativo '
            + '    AND hep.ep_idestado         = ee_id '
            + '    AND hep.ep_idfirmante       = pit.it_id(+) '
            + '    AND hma.ma_id(+)            = hep.ep_motivoasignacion '
            + '    AND pit2.it_id(+)           = hep.ep_preventorultvisita '
            + '    and pit3.it_id(+) = hep.ep_idpreventorprovisorio '
            + '    AND tbsector.tb_clave       = ''SECT'' '
            + '    AND tbsector.tb_codigo      = em_sector '
            +      sFiltroPreventor
            +      sWhere
            +      sWhereSug
            +      sEstabTipoEventual
            +      sWhereDepart
            +      sWhereFechasVisita
    );

    if (FModoForm = mfEmpresas) then
      sdqConsulta.SQL.Add(' AND aem.em_id = :idempresa ');

    if cbVerPreventorSugerido.Checked then
      sdqConsulta.SQL.Add(
              ' UNION ALL SELECT                                                                                             /*+ first_rows */ '
            + '      ep_id, '
            + '        ep_cuit, '
            + '        ep_idempresa, '
            + '        aem.em_nombre, '
            + '        ep_estableci, '
            + '        aes.es_nombre, '
            + '        ep_tipo tiposrt, '
            + '        tipoestab.te_codigo tipoprevencion,tipoestab.te_cargamanual, '
            + '        tipoemp.te_codigo tipoprevempresa, '
            + '        art.hys.get_preventor_referente (hco.co_cuit) idreferente, '
            + '        ep_actividad, '
            + '        ep_idfirmante, '
            + '        ep_itcodigo, '
            + '        pit.it_nombre, '
            + '        NVL (es_eventual, ''N'') es_eventual, '
            + '        art.hys.get_nombre_preventor_coord (pit.it_codigo) it_coordinador, '
            + '        NVL (co_totempleadosactual, co_totempleados) AS rc_empleados, '
            + '        dc_telefonos, '
            + '        art.afi.armar_domicilio ( '
            + '                                 es_calle, '
            + '                                 es_numero, '
            + '                                 es_piso, '
            + '                                 es_departamento, '
            + '                                 es_localidad '
            + '                                ) || '
            + '        NVL2 ( '
            + '              es_telefonos, '
            + '              '' Tel.'' || (NVL (es_codareatelefonos, '''') || es_telefonos), '
            + '              '''' '
            + '             ) '
            + '           AS domicilio, '
            + '        es_localidad, '
            + '        es_cpostal, '
            + '        art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision) ac_relacion, '
            + '        es_cpostala, '
            + '        co_contrato, '
            + '        ge_descripcion, '
            + '        ca_id, '
            + '        ca_descripcion, '
            + '        ac_idcategoriariesgo, '
            + '        art.getdescripcionprovincia (es_provincia) AS prov, '
            + '        es_provincia, '
            + '        ep_motivoasignacion, '
            + '        ep_fechavencimientoasig, '
            + '        ep_observacion, '
            + '        hma.ma_descripcion, '
            + '        ep_fechabaja, '
            + '        ep_usubaja, '
            + '        es_fechabaja, '
            + '        ep_anexo1, '
            + '        ep_anexo2, '
            + '        ep_anexo1ficticio, '
            + '        ep_tienedenunciagral, '
            + '        ep_tienedenuncia, '
            + '        ep_tieneprs, '
            + '        ep_tienepal, '
            + '        ep_fechaultvisita, '
            + '        ep_fechaultrelev, '
            + '        ep_fechaultcap, '
            + '        pit2.it_nombre prevultvisita, '
            + '        ee_descripcion, '
            + '        co_estab_evento, '
            + '        ep_fechainicioobra, '
            + '        ep_fechaextensionobra, '
            + '        ep_fechafinobra, '
            + '        ep_cantvisitas, '
            + '        ep_cantcapacit, '
            + '        ep_cantrelev, '
            + '        pit.it_id, '
            + '        ep_nroresolucion, '
            + '        (SELECT  pe_preventorid '
            + '           FROM  hys.hpe_preventorexclusivo '
            + '          WHERE  pe_idempresa = em_id AND pe_fechabaja IS NULL) '
            + '           pe_preventorid, '
            + '        ep_cancerigenos, '
            + '        ep_difenilos, '
            + '        ep_accmayores, ep_tiporelev, '
            + '        (SELECT  DISTINCT zc_descripcion '
            + '           FROM  art.ccp_codigopostal, '
            + '                 hys.hzc_zonacodigopostal '
            + '          WHERE  cp_zonaucap = zc_id AND cp_codigo = es_cpostal AND cp_provincia = es_provincia) '
            + '           AS zc_descripcion, '
            + '        co_vigenciahasta, '
            + '        NULL prevsugerido, '
            + '        TO_NUMBER (NULL) idprevsugerido, '
            + '        art.utiles.get_partido(aes.es_cpostal, aes.es_provincia) departamento, '
            + '        ep_pramet, '
            + '        DECODE(art.afiliacion.is_empresavip(co_contrato), ''S'', ''VIP'', ''N'', NULL) empresavip, '
            + '        hys.get_frecuenciapersonalizada(ep_idempresa, ep_estableci) frecuenciavisitapers, '
            + '        tb_descripcion sector, art.hys.get_validorelev463(co_contrato,ep_estableci) valido463, '
            + '        ep_idpreventorprovisorio, ep_fdesdeprevprovisorio, ep_fhastaprevprovisorio, pit3.it_nombre preventorprovisorio '
            +          sSelect
            + '  FROM  afi.adc_domiciliocontrato ahdl, '
            + '        hys.hep_estabporpreventor hep, '
            + '        afi.aem_empresa aem, '
            + '        afi.aco_contrato aco, '
            + '        afi.aes_establecimiento aes, '
            + '        art.ctb_tablas tbsector, '
            + '        comunes.cac_actividad cac, '
            + '        afi.age_grupoeconomico age, '
            + '        hys.hte_tipoempresaprev tipoestab, '
            + '        hys.hte_tipoempresaprev tipoemp, '
            + '        hys.hco_cuitoperativo hco, '
            + '        hys.hee_estadoestab, '
            + '        hys.hca_categoriariesgo hca, '
            + '        art.pit_firmantes pit, '
            + '        art.pit_firmantes pit2, '
            + '        art.pit_firmantes pit3, '
            + '        hys.hma_motivoasigprev hma '
            +          sFrom
            + ' WHERE  co_contrato             = art.get_vultcontrato (em_cuit) '
            + '    AND ahdl.dc_contrato(+)     = aco.co_contrato '
            + '    AND ahdl.dc_tipo(+)         = ''L'' '
            + '    AND cac.ac_idcategoriariesgo= hca.ca_id(+) '
            + '    AND aem.em_idgrupoeconomico = ge_id(+) '
            + '    AND hep.ep_idempresa        = aem.em_id '
            + '    AND aem.em_id               = aco.co_idempresa '
            + '    AND aes.es_nroestableci     = hep.ep_estableci '
            + '    AND aco.co_contrato         = aes.es_contrato '
            + '    AND cac.ac_id               = aes.es_idactividad '
            + '    AND co_idtipoempresaprev    = tipoestab.te_id(+) '
            + '    AND co_idtipoempresaprev    = tipoemp.te_id(+) '
            + '    AND hco.co_id(+)            = ep_idcooperativo '
            + '    AND hep.ep_idestado         = ee_id '
            + '    AND hep.ep_idfirmante       = pit.it_id(+) '
            + '    AND hma.ma_id(+)            = hep.ep_motivoasignacion '
            + '    AND pit2.it_id(+)           = hep.ep_preventorultvisita '
            + '    and pit3.it_id(+) = hep.ep_idpreventorprovisorio '
            + '    AND art.hys.get_preventor_sugerido ( '
            + '                                        es_cpostal, '
            + '                                        es_provincia, '
            + '                                        ep_idtipoestabprev, '
            + '                                        ep_actividad, '
            + '                                        em_sector, '
            + '                                        es_idactividad, '
            + '                                        NVL (co_totempleadosactual, co_totempleados) '
            + '                                       ) IS NULL '
            + '    AND tbsector.tb_clave       = ''SECT'' '
            + '    AND tbsector.tb_codigo      = em_sector '
            +     sFiltroPreventor
            +     sWhere
            +     sEstabTipoEventual
            +     sWhereDepart
            +     sWhereFechasVisita
      );

    if chkEstabConCPPrev.Checked then
      sdqConsulta.SQL.Add(
              ' UNION ALL SELECT                                                                                             /*+ first_rows */ '
            + '      ep_id, '
            + '        ep_cuit, '
            + '        ep_idempresa, '
            + '        aem.em_nombre, '
            + '        ep_estableci, '
            + '        aes.es_nombre, '
            + '        ep_tipo tiposrt, '
            + '        tipoestab.te_codigo tipoprevencion,tipoestab.te_cargamanual, '
            + '        tipoemp.te_codigo tipoprevempresa, '
            + '        art.hys.get_preventor_referente (hco.co_cuit) idreferente, '
            + '        ep_actividad, '
            + '        ep_idfirmante, '
            + '        ep_itcodigo, '
            + '        pit.it_nombre, '
            + '        NVL (es_eventual, ''N'') es_eventual, '
            + '        art.hys.get_nombre_preventor_coord (pit.it_codigo) it_coordinador, '
            + '        NVL (co_totempleadosactual, co_totempleados) AS rc_empleados, '
            + '        dc_telefonos, '
            + '        art.afi.armar_domicilio ( '
            + '                                 es_calle, '
            + '                                 es_numero, '
            + '                                 es_piso, '
            + '                                 es_departamento, '
            + '                                 es_localidad '
            + '                                ) || '
            + '        NVL2 ( '
            + '              es_telefonos, '
            + '              '' Tel.'' || (NVL (es_codareatelefonos, '''') || es_telefonos), '
            + '              '''' '
            + '             ) '
            + '           AS domicilio, '
            + '        es_localidad, '
            + '        es_cpostal, '
            + '        art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision) ac_relacion, '
            + '        es_cpostala, '
            + '        co_contrato, '
            + '        ge_descripcion, '
            + '        ca_id, '
            + '        ca_descripcion, '
            + '        ac_idcategoriariesgo, '
            + '        art.getdescripcionprovincia (es_provincia) AS prov, '
            + '        es_provincia, '
            + '        ep_motivoasignacion, '
            + '        ep_fechavencimientoasig, '
            + '        ep_observacion, '
            + '        hma.ma_descripcion, '
            + '        ep_fechabaja, '
            + '        ep_usubaja, '
            + '        es_fechabaja, '
            + '        ep_anexo1, '
            + '        ep_anexo2, '
            + '        ep_anexo1ficticio, '
            + '        ep_tienedenunciagral, '
            + '        ep_tienedenuncia, '
            + '        ep_tieneprs, '
            + '        ep_tienepal, '
            + '        ep_fechaultvisita, '
            + '        ep_fechaultrelev, '
            + '        ep_fechaultcap, '
            + '        pit2.it_nombre prevultvisita, '
            + '        ee_descripcion, '
            + '        co_estab_evento, '
            + '        ep_fechainicioobra, '
            + '        ep_fechaextensionobra, '
            + '        ep_fechafinobra, '
            + '        ep_cantvisitas, '
            + '        ep_cantcapacit, '
            + '        ep_cantrelev, '
            + '        pit.it_id, '
            + '        ep_nroresolucion, '
            + '        (SELECT  pe_preventorid '
            + '           FROM  hys.hpe_preventorexclusivo '
            + '          WHERE  pe_idempresa = em_id AND pe_fechabaja IS NULL) '
            + '           pe_preventorid, '
            + '        ep_cancerigenos, '
            + '        ep_difenilos, '
            + '        ep_accmayores, ep_tiporelev, '
            + '        (SELECT  DISTINCT zc_descripcion '
            + '           FROM  art.ccp_codigopostal, '
            + '                 hys.hzc_zonacodigopostal '
            + '          WHERE  cp_zonaucap = zc_id AND cp_codigo = es_cpostal AND cp_provincia = es_provincia) '
            + '           AS zc_descripcion, '
            + '        co_vigenciahasta '
            +          sSelectSug + ', '
            + '        art.utiles.get_partido(aes.es_cpostal, aes.es_provincia) departamento, '
            + '        ep_pramet, '
            + '        DECODE(art.afiliacion.is_empresavip(co_contrato), ''S'', ''VIP'', ''N'', NULL) empresavip, '
            + '        hys.get_frecuenciapersonalizada(ep_idempresa, ep_estableci) frecuenciavisitapers, '
            + '        tb_descripcion sector, art.hys.get_validorelev463(co_contrato,ep_estableci) valido463, '
            + '        ep_idpreventorprovisorio, ep_fdesdeprevprovisorio, ep_fhastaprevprovisorio, pit3.it_nombre preventorprovisorio '
            +          sSelect
            + '  FROM  afi.adc_domiciliocontrato ahdl, '
            + '        hys.hep_estabporpreventor hep, '
            + '        afi.aem_empresa aem, '
            + '        afi.aco_contrato aco, '
            + '        afi.aes_establecimiento aes, '
            + '        art.ctb_tablas tbsector, '
            + '        comunes.cac_actividad cac, '
            + '        afi.age_grupoeconomico age, '
            + '        hys.hte_tipoempresaprev tipoestab, '
            + '        hys.hte_tipoempresaprev tipoemp, '
            + '        hys.hco_cuitoperativo hco, '
            + '        hys.hee_estadoestab, '
            + '        hys.hca_categoriariesgo hca, '
            + '        art.pit_firmantes pit, '
            + '        art.pit_firmantes pit2, '
            + '        art.pit_firmantes pit3, '
            + '        hys.hma_motivoasigprev hma '
            +          sFrom
            +          sFromSug
            + ' WHERE  co_contrato             = art.get_vultcontrato (em_cuit) '
            + '    AND ahdl.dc_contrato(+)     = aco.co_contrato '
            + '    AND ahdl.dc_tipo(+)         = ''L'' '
            + '    AND cac.ac_idcategoriariesgo= hca.ca_id(+) '
            + '    AND aem.em_idgrupoeconomico = ge_id(+) '
            + '    AND hep.ep_idempresa        = aem.em_id '
            + '    AND aem.em_id               = aco.co_idempresa '
            + '    AND aes.es_nroestableci     = hep.ep_estableci '
            + '    AND aco.co_contrato         = aes.es_contrato '
            + '    AND cac.ac_id               = aes.es_idactividad '
            + '    AND co_idtipoempresaprev    = tipoestab.te_id(+) '
            + '    AND co_idtipoempresaprev    = tipoemp.te_id(+) '
            + '    AND hco.co_id(+)            = ep_idcooperativo '
            + '    AND hep.ep_idestado         = ee_id '
            + '    AND hep.ep_idfirmante       = pit.it_id(+) '
            + '    AND hma.ma_id(+)            = hep.ep_motivoasignacion '
            + '    AND EXISTS (SELECT 1 '
            + '                FROM hys.hpc_preventorcpostal '
            + '                WHERE  pc_codigo = es_cpostal '
            + '                 AND pc_provincia = es_provincia '
            + '                 AND pc_fechabaja IS NULL '
            + '                 AND pc_idpreventor =  ' + SqlValue(fraPreventorFiltro.Value) +  ') '
            + '    AND NVL(hep.ep_idfirmante, 0) <>   ' + SqlValue(fraPreventorFiltro.Value)
            + '    AND pit2.it_id(+) = hep.ep_preventorultvisita '
            + '    and pit3.it_id(+) = hep.ep_idpreventorprovisorio '
            + '    AND tbsector.tb_clave       = ''SECT'' '
            + '    AND tbsector.tb_codigo      = em_sector '
            +      sWhere
            +      sEstabTipoEventual
            +      sWhereDepart
            +      sWhereFechasVisita
      );

    if (FModoForm = mfEmpresas) then
      sdqConsulta.SQL.Add(' AND aem.em_id = :idempresa ');

end;

procedure TfrmGestionEmpresasPreventor.OnEmpresaChange(
  Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraEmpresaEstab.mskCUIT.Text;
end;

procedure TfrmGestionEmpresasPreventor.tbLimpiarClick(
  Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  fraPreventorFiltro.Clear;
  cbSinPreventor.Checked := False;
  cbTercerizado.Checked := False;
  cbPreventorReferente.Checked := False;
  cmbEmpresaSinPreventorExclusivo.Checked := False;
  cmbEmpresaPreventorExclusivo.Checked := False;
  cmbVerPreventorExclusivo.Checked := False;
  cmbPreventorUltVisita.Checked := False;
  fraLocalidad.Clear;
  edActividad.Clear;
  edEstablecimiento.Clear;
  edCantTrabajadoresMin.Clear;
  edCantTrabajadoresMax.Clear;
  VCLExtra.LockControl(edEstablecimiento, not fraEmpresaFiltro.IsSelected);
  fraTipoFiltroSrt.Limpiar;
  cmbTipoEmpresaPrev.Clear;
  cmbEstadoEstab.Clear;
  fraSubTipoFiltro.Clear;
  fraPerfil.Clear;
  fraRanking.Clear;
  cbAnexoI.Checked := false;
  cbAnexoII.Checked := false;
  cbPrs.Checked := false;
  cbPAL.Checked := False;
  cbDenunciasGrales.Checked := false;
  cbOtrasDenuncias.Checked := false;
  cbAvisoObra.Checked := false;
  cbEventual.Checked := false;
  sdqDatosEmpresa.Close;
  edCantTrabajadoresMin.Text := '1';
  cmbResolucion.Clear;
  cmbZona.Clear;
  chkEstabConCPPrev.Checked := false;
  chkSinVisita.Checked := false;
  edVisitaDesde.Clear;
  edVisitaHasta.Clear;
  fraDepart.Clear;
  lstPrev.Clear;
end;

procedure TfrmGestionEmpresasPreventor.cbTodosEstabClick(
  Sender: TObject);
begin
    if cbTodosEstab.Checked then
    begin
        fraEstablecimiento.Locked := true;
        fraEstablecimiento.Limpiar(false);
        cbVerPreventorSugeridoABM.Checked := false;
        cbVerPreventorSugeridoABM.Enabled := false;
    end
    else begin
        if (ModoABM <> maModificacion) then fraEstablecimiento.Locked := false
        else fraEstablecimiento.Cargar(sdqConsulta.FieldbyName('ep_cuit').AsString,
                                       sdqConsulta.FieldbyName('ep_estableci').AsInteger, false);
        cbVerPreventorSugeridoABM.Enabled := true;
    end;
end;

procedure TfrmGestionEmpresasPreventor.tbCambiarPreventorClick(
  Sender: TObject);
begin
    Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
    fraPreventorNuevo.Clear;
    fraMotivoAsignacion.Clear;
    edVigenciaAsig.Clear;
    edMotivoCambio.Clear;
    cbReferenteCambio.Checked := false;
    fpCambiarPreventor.ShowModal;
end;

function TfrmGestionEmpresasPreventor.EsEmpresaEAS (aCUIT: String; aFecha: TDateTime): Boolean;
begin
  result := ExisteSql('SELECT 1 ' +
                      '  FROM hys.hre_rankingempresa ' +
                      ' WHERE (   re_vigenciahasta IS NULL ' +
                      '        OR (    (re_vigenciahasta IS NOT NULL) ' +
                      '            AND (' + SqlDate (aFecha) + ' <= re_vigenciahasta) ' +
                      '           ) ' +
                      '       ) ' +
                      '   AND ' + SqlDate (aFecha) + ' >= re_vigenciadesde ' +
                      '   AND re_idempresa = (SELECT em_id ' +
                      '                         FROM afi.aem_empresa ' +
                      '                        WHERE em_cuit = ' + SqlValue(aCUIT) + ') ')
end;

procedure TfrmGestionEmpresasPreventor.btnAceptarCambioPreventorClick(
  Sender: TObject);
var
  i: integer;
  acontrato, aContratoExclusivo: integer;
  actualizarestado : Boolean;
begin
  inherited;
  aContratoExclusivo := -1;
  acontrato := -1;
  If HacerCommit then
    BeginTrans(true);
  try
    if MsgBox('¿Desea reasignar las tareas al nuevo preventor?',MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      BorrarReasignacion;
      if fpMotivoReasignacion.ShowModal = mrOK then
        actualizarestado := True
      else
        actualizarestado := False;
    end
    else
      actualizarestado := False;
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      if fraPreventorNuevo.IsSelected then
      begin
        EjecutarSqlST(' update hys.hep_estabporpreventor ' +
                      ' set ep_idfirmante = ' + SqlValue(fraPreventorNuevo.Value) + ', ' +
                      ' ep_itcodigo = ' + SqlValue(fraPreventorNuevo.Codigo) + ', ' +
                      ' EP_MOTIVOASIGNACION = ' + SqlValue(fraMotivoAsignacion.Codigo) + ', ' +
                      ' EP_FECHAVENCIMIENTOASIG = ' + SqlDate(edVigenciaAsig.Date) + ', ' +
                      ' EP_OBSERVACION = ' + SqlValue(edMotivoCambio.Text)+
                      ' where ep_id = ' + SqlValue(SelectedList.Strings[i]));
        if actualizarestado then
          ReasignarTareas(Grid.DataSource.DataSet.fieldbyname('EP_CUIT').AsString,
                          Grid.DataSource.DataSet.fieldbyname('EP_ESTABLECI').AsInteger,
                          fraPreventorNuevo.Value);
      end
      else
      begin
        EjecutarSqlST(' update hys.hep_estabporpreventor ' +
                      ' set ep_idfirmante = null, ' +
                      ' ep_itcodigo = null ' +', ' +
                      ' EP_MOTIVOASIGNACION = ' + SqlValue(fraMotivoAsignacion.Codigo) + ', ' +
                      ' EP_FECHAVENCIMIENTOASIG = ' + SqlDate(edVigenciaAsig.Date) + ', ' +
                      ' EP_OBSERVACION = ' + SqlValue(edMotivoCambio.Text)+
                      ' where ep_id = ' + SqlValue(SelectedList.Strings[i]));
        if actualizarestado then
          ReasignarTareas(Grid.DataSource.DataSet.fieldbyname('EP_CUIT').AsString,
                          Grid.DataSource.DataSet.fieldbyname('EP_ESTABLECI').AsInteger,
                          0);
      end;

      EjecutarStoreST('art.hys.do_actualizarestado(' +  SqlValue(Grid.DataSource.DataSet.fieldbyname('ep_id').AsInteger) + ');');
      if cbExclusivoCambio.Checked and (aContratoExclusivo <> Grid.DataSource.DataSet.fieldbyname('co_contrato').AsInteger) then
      begin
        ActualizarPreventorExclusivo(Grid.DataSource.DataSet.fieldbyname('ep_idempresa').AsInteger, fraPreventorNuevo.Value);
        aContratoExclusivo := Grid.DataSource.DataSet.fieldbyname('co_contrato').AsInteger;
      end;
      if cbReferenteCambio.Checked and (acontrato <> Grid.DataSource.DataSet.fieldbyname('co_contrato').AsInteger) then
      begin
        ActualizarPreventorReferente(Grid.DataSource.DataSet.fieldbyname('ep_cuit').AsString, fraPreventorNuevo.Codigo);
        acontrato := Grid.DataSource.DataSet.fieldbyname('co_contrato').AsInteger;
      end;
    end;
    If HacerCommit then
      CommitTrans(true);
    SelectedList.Clear;
    fpCambiarPreventor.ModalResult := mrOk;
    sdqConsulta.Refresh;
    sdqConsultaAfterScroll( Grid.DataSource.DataSet);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al aplicar los sugeridos');
    end;
  end;
end;

procedure TfrmGestionEmpresasPreventor.cbSinPreventorClick(
  Sender: TObject);
begin
    if (cbSinPreventor.Checked) then
    begin
      fraPreventorFiltro.Clear;
      fraPreventorFiltro.Locked := true;
      cbPreventorReferente.Enabled := false;
      cbPreventorReferente.Checked := false;
      lstPrev.Clear;
      tbComandosSel.Enabled := false;
    end
    else begin
      fraPreventorFiltro.Locked := false;
      cbPreventorReferente.Enabled := true;
      cbPreventorReferente.Checked := false;
      tbComandosSel.Enabled := true;
    end;
end;

procedure TfrmGestionEmpresasPreventor.btnCancelarCambiosClick(
  Sender: TObject);
begin
    RollBackUpdates;
    if sdqConsulta.Active then
    begin
      sdqConsulta.Refresh;
      sdqConsultaAfterScroll(sdqConsulta.DataSource.DataSet);
    end;
    ModalResult := mrCancel;
end;

procedure TfrmGestionEmpresasPreventor.btnGuardarClick(
  Sender: TObject);
begin
    If HacerCommit then
      BeginTrans(true);
    If HacerCommit then
      CommitTrans;
end;

procedure TfrmGestionEmpresasPreventor.fraPreventorFiltrocmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorFiltro.cmbDescripcion.Text := '%' + fraPreventorFiltro.cmbDescripcion.Text;
  fraPreventorFiltro.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorFiltro.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorFiltro.cmbDescripcion.Text)[1] = '%') then
      fraPreventorFiltro.cmbDescripcion.Text := copy(fraPreventorFiltro.cmbDescripcion.Text, 2, length(fraPreventorFiltro.cmbDescripcion.Text));

  inherited;
end;

procedure TfrmGestionEmpresasPreventor.FSFormShow(Sender: TObject);
begin
  if fraEmpresaFiltro.IsSelected
    then tbRefrescarClick(Sender);
end;

function TfrmGestionEmpresasPreventor.ArmarFiltroEstab(
  Establecimientos: string): string;
var
    i, j: integer;
    cotaMenor, cotaMayor: integer;
    tmpValores: string;
begin
    while (pos('-', Establecimientos) > 0) do
    begin
        i:= pos('-', Establecimientos);
        while (i > 0) and (Establecimientos[i] <> ',') do
            i := i - 1;

        cotaMenor := strtoint(copy(Establecimientos, i+1, pos('-', Establecimientos)-1 - i ));

        i:= pos('-', Establecimientos);
        while (i <= length(Establecimientos)) and (Establecimientos[i] <> ',') do
            i := i + 1;
        cotaMayor := strtoint(copy(Establecimientos, pos('-', Establecimientos)+1, i-1 - pos('-', Establecimientos)));

        tmpValores := '';

        for j:=cotaMenor to cotaMayor do
            tmpValores := tmpValores + ',' + IntToStr(j);

        Establecimientos := StringReplace(Establecimientos, '-', tmpValores + ',', []);
    end;

    result := Establecimientos;
end;

procedure TfrmGestionEmpresasPreventor.fraPreventorNuevocmbDescripcionDropDown(
  Sender: TObject);
begin
  FiltrarPreventor(Sender, fraPreventorNuevo);
  inherited;
end;

procedure TfrmGestionEmpresasPreventor.FiltrarPreventor(
  Sender: TObject; fraPreventor: TfraCodigoDescripcion);
begin
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] <> '%') then
      fraPreventor.cmbDescripcion.Text := '%' + fraPreventor.cmbDescripcion.Text;
  fraPreventor.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] = '%') then
      fraPreventor.cmbDescripcion.Text := copy(fraPreventor.cmbDescripcion.Text, 2, length(fraPreventor.cmbDescripcion.Text));
end;

procedure TfrmGestionEmpresasPreventor.fraPreventorcmbDescripcionDropDown(
  Sender: TObject);
begin
  FiltrarPreventor(Sender, fraPreventor);
end;

procedure TfrmGestionEmpresasPreventor.OnEmpresaChangeFiltro(
  Sender: TObject);
begin
  if (FModoForm = mfEstablecimientos) then
  begin
  VCLExtra.LockControl(edEstablecimiento, not fraEmpresaFiltro.IsSelected);
  end;
end;
{
procedure TfrmGestionEmpresasPreventor.ActualizarHistorico;
begin
  if (not FTodos) and FCambio then
   if (fpMotivoCambio.ShowModal = mrOk) then
      EjecutarSqlST('UPDATE HYS.HHE_HISTESTABPORPREVENTOR ' +
                    'SET HE_OBSERVACION = ' + SqlString(edMotivoCambioSolicitado.text, true) +
                    'WHERE HE_CUIT = ' +  SqlValue(fraEmpresaEstab.mskCUIT.Text) + ' AND ' +
                    'HE_ESTABLECI = ' + SqlValue(fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger) + ' AND ' +
                    'HE_ID = (SELECT MAX(HE_ID) FROM  HYS.HHE_HISTESTABPORPREVENTOR ' +
                    '         WHERE HE_CUIT = ' +  SqlValue(fraEmpresaEstab.mskCUIT.Text) + ' AND ' +
                    '         HE_ESTABLECI = ' + SqlValue(fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger) +  ')');
end;
}
procedure TfrmGestionEmpresasPreventor.fpMotivoCambioClose(
  Sender: TObject; var Action: TCloseAction);
begin
    if VerificarMultiple(['Motivo Cambio',
                          edMotivoCambioSolicitado, edMotivoCambioSolicitado.text<>'', 'Debe especificar un motivo de cambio'
                         ]) then Action := caFree
    else Action := caNone;
end;

procedure TfrmGestionEmpresasPreventor.fpMotivoCambioBeforeShow(
  Sender: TObject);
begin
    edMotivoCambioSolicitado.Clear;
end;

procedure TfrmGestionEmpresasPreventor.tbHistoricoClick(
  Sender: TObject);
begin
    if (fraEstablecimiento.edCodigo.Text <> '') and (fraEmpresaEstab.mskCUIT.Text <> '') then
        TfrmHistoricoAsignaciones.MostrarHistorico(fraEmpresaEstab.mskCUIT.Text, strtoint(fraEstablecimiento.edCodigo.Text));
end;

procedure TfrmGestionEmpresasPreventor.btnTodosClick(
  Sender: TObject);
begin
    FTodos := True;
    fpMotivoCambio.ModalResult := mrOk;
end;

procedure TfrmGestionEmpresasPreventor.fraTipoEmpresaChange(
  Sender: TObject);
begin
  if fraTipoEmpresa.Locked then
  begin
    if fraTipoEmpresa.Codigo = 'CO' then
    begin
      cmbActividad.Clear;
      cmbActividad.Items.Add('C=Construcción');
    end
    else begin
      cmbActividad.Clear;
      cmbActividad.Items.Add('A=Agro');
      cmbActividad.Items.Add('I=Industria');
      cmbActividad.Items.Add('C=Construcción');
    end;
  end;
  edTipoSrt.Text := fraTipoEmpresa.sdqDatos.fieldbyname('TE_TIPOSRT').AsString;
end;

procedure TfrmGestionEmpresasPreventor.btnInfoEstableciClick(
  Sender: TObject);
begin
   if fraEstablecimiento.edCodigo.Value <> 0 Then
   begin
       MsgBox('Teléfono de la Empresa: ' +  sdqConsulta.fieldbyname('TELEFONOEMP').AsString + #13 + 'Teléfonos del Establecimiento: ' +
              sdqConsulta.fieldbyname('TELEFONOSESTAB').AsString , MB_ICONINFORMATION, 'Información del Establecimiento');
   end;
end;

function TfrmGestionEmpresasPreventor.VerifyChanges: boolean;
var
    Qry: TSDQuery;
begin
    Qry := GetQuery('SELECT EP_ACTIVIDAD, EP_TIPO, EP_ITCODIGO FROM HYS.HEP_ESTABPORPREVENTOR WHERE EP_CUIT = ' +  SqlValue(fraEmpresaEstab.mskCUIT.Text) +
                    ' AND EP_ESTABLECI = ' + SqlValue(fraEstablecimiento.sdqDatos.fieldByName('ST_CLAVE').AsInteger));
    try
      result := ((fraPreventor.Codigo <> Qry.FieldByName('EP_ITCODIGO').AsString) and not Qry.FieldByName('EP_ITCODIGO').IsNull)  or
                (cmbActividad.Value <> (Qry.FieldByName('EP_ACTIVIDAD').AsString)) or
                (fraTipoEmpresa.Codigo <> (Qry.FieldByName('EP_TIPO').AsString));

      // Mandar Informes de Accidentes si la empresa es ET/EP/EAS
      if (fraPreventor.Codigo <> Qry.FieldByName('EP_ITCODIGO').AsString) and
         ((fraTipoEmpresa.Codigo = 'ET') or
          (fraTipoEmpresa.Codigo = 'EP') or
          EsEmpresaEAS (fraEmpresaFiltro.mskCUIT.Text, DBDate)) then
        GenerarSolicitudInforme (fraEmpresaEstab.mskCUIT.Text, fraPreventor.Value, '')
    finally
      Qry.free;
    end;

end;

procedure TfrmGestionEmpresasPreventor.ActualizarPreventorReferente(aCuit,
  aIdPreventor: string);
var
    PreventorAnterior: string;
begin
    PreventorAnterior :=ValorSql(' select PC_CODIGOPREVENTOR ' +
                                 ' from afi.APC_PREVENTORCONTRATO ' +
                                 ' where PC_CONTRATO = art.get_vultcontrato(' + SqlValue(aCuit)  + ') ' +
                                 ' and (PC_FECHA_HASTA >= sysdate or PC_FECHA_HASTA is null) ', '');
                  //                 ' and PC_CODIGOPREVENTOR = ' + SqlValue(aIdPreventor)) then
    if (PreventorAnterior <> aIdPreventor) then
    begin
        if (PreventorAnterior <> '') then
            EjecutarSqlST(' update afi.APC_PREVENTORCONTRATO ' +
                          ' set PC_FECHA_HASTA = sysdate-0.00001,  ' +
                          ' PC_USUMODIF = ' +  SqlValue(Sesion.LoginName) + ', ' +
                          ' PC_FECHAMODIF = SYSDATE ' +
                          ' where PC_CONTRATO = art.get_vultcontrato(' + SqlValue(aCuit)  + ') ' +
                          ' and (PC_FECHA_HASTA >= sysdate or PC_FECHA_HASTA is null) ');

        if (aIdPreventor <> '') then
            EjecutarSqlST(' insert into afi.APC_PREVENTORCONTRATO(PC_ID, PC_CONTRATO, PC_CODIGOPREVENTOR, ' +
                          ' PC_FECHA_DESDE, PC_FECHA_HASTA, PC_USUALTA, PC_FECHAALTA) ' +
                          ' VALUES(AFI.SEQ_APC_ID.NEXTVAL, art.get_vultcontrato(' + SqlValue(aCuit)  + '), ' +
                          SqlValue(aIdPreventor) + ', SYSDATE, NULL, ' + SqlValue(Sesion.LoginName) + ', SYSDATE)');

    end;

end;

procedure TfrmGestionEmpresasPreventor.GridGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  inherited;

  if (AFont.Color <> clRed) then
  begin
    if sdqConsulta.Active and not (sdqConsulta.FieldByName('ES_FECHABAJA').IsNull) then
    begin
      AFont.Color := clRed;
    end
  end;

  if assigned(field) then begin
    if arein(field.FieldName, ['EP_CUIT','EP_ESTABLECI', 'EP_FECHAVENCIMIENTOASIG'])
        and (sdqconsulta.fieldbyname('EP_FECHAVENCIMIENTOASIG').AsDateTime < dHoy)
        and not (sdqconsulta.fieldbyname('EP_FECHAVENCIMIENTOASIG').IsNull)  then
      AFont.Color := clBlue;

    if not sdqconsulta.fieldbyname('PE_PREVENTORID').IsNull then
      Background := clMoneyGreen;

    if (sdqconsulta.fieldbyname('EP_NRORESOLUCION').AsInteger = 1) then
      Background := clSkyBlue;

    if not sdqconsulta.fieldbyname('EP_IDPREVENTORPROVISORIO').IsNull then
      if not Highlight then
        AFont.Color := clHotLight;
  end;
end;

procedure TfrmGestionEmpresasPreventor.cbPreventorProvisorioFiltroClick(
  Sender: TObject);
begin
  if (Trim(fraPreventorFiltro.cmbDescripcion.Text) = '') and (lstPrev.Count = 0) then
  begin
    cbPreventorProvisorioFiltro.Checked := false;
    Verificar(1=1,cbPreventorProvisorioFiltro, 'Debe Seleccionar un Preventor');
  end;
end;

procedure TfrmGestionEmpresasPreventor.cbPreventorReferenteClick(
  Sender: TObject);
begin
  if not (fraPreventorFiltro.IsSelected) and (ModoForm = mfEstablecimientos) then
  begin
    cbPreventorReferente.Checked := false;
    Verificar(1=1,cbPreventorReferente, 'Debe Seleccionar un Preventor');
  end
  else
    if not (fraPreventorFiltro.IsSelected) and (lstPrev.Count = 0) and (ModoForm = mfEmpresas) then
    begin
      cbPreventorReferente.Checked := false;
      Verificar(1=1,cbPreventorReferente, 'Debe Seleccionar un Preventor');
  end;
end;

procedure TfrmGestionEmpresasPreventor.fraEmpresaFiltroExit(
  Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.FrameExit(Sender);
end;

function TfrmGestionEmpresasPreventor.GenerarSolicitudInforme (CUIT: String;
            idPreventor: Integer; Motivo: String): Boolean;
var
  NroPedido: LongInt;
  eMail,
  OperActual: String;
  FechaDesde,
  FechaHasta: TDateTime;
begin
  Result := false;

  // Obtengo e-mail del preventor
  eMail := ValorSql ('SELECT NVL(it_email,'''') it_email' +
                     '  FROM art.pit_firmantes ' +
                     ' WHERE it_id = ' + SqlValue(idPreventor));
  if not ((eMail <> '') and (CUIT <> '') and (idPreventor <> 0)) then
    Exit;

  // Defino FechaDesde y FechaHasta correspondientes al Operativo Actual de la Empresa
  OperActual := ValorSql ('SELECT art.hys.get_operativovigente_empresa (' +
                          SQLValue (CUIT) + ', SYSDATE) FROM DUAL');
  FechaDesde := StrToDate ('01/' + Copy (OperActual, 5, 2) + '/' + Copy (OperActual, 1, 4));
  FechaHasta := DBDate;

  // Verifico si el reporte está pedido y sin enviar
  if ExisteSQL ('SELECT 1 ' +
                '  FROM hys.hpr_pedidosreporte pr, ' +
                '       hys.hpp_parametrospedido pp, ' +
                '       hys.hpw_pedidosweb pw ' +
                ' WHERE pp.pp_idpedidoreporte = pr.pr_id ' +
                '   AND pw.pw_idpedido = pr.pr_id ' +
                '   AND pw.pw_idreporte = 1 ' +
                '   AND (   (    UPPER (pp.pp_parametro) LIKE UPPER (''CUIT%'') ' +
                '            AND pp.pp_valor = ' + SqlValue (CUIT) +
                '           ) ' +
                '        OR (    UPPER (pp.pp_parametro) LIKE UPPER (''FECHADESDE%'') ' +
                '            AND pp.pp_valor = ' + SqlValue (FormatDateTime('DD/MM/YYYY', FechaDesde)) +
                '           ) ' +
                '        OR (    UPPER (pp.pp_parametro) LIKE UPPER (''FECHAHASTA%'') ' +
                '            AND pp.pp_valor = ' + SqlValue (FormatDateTime('DD/MM/YYYY', FechaHasta)) +
                '           ) ' +
                '       ) ' +
                '   AND pr.pr_fechaenvio IS NULL ' +
                '   AND pr.pr_emailrespuesta = ' + SqlValue(Trim(eMail))) then
    Exit;

  try
    // Obtengo el nro. de Pedido
    NroPedido := ValorSqlInteger ('SELECT hys.seq_hpr_id.nextval FROM dual');

    // Inserto el nuevo pedido
    EjecutarSqlST(
      'INSERT INTO hys.hpr_pedidosreporte(PR_ID, PR_EMAILRESPUESTA, PR_FECHAALTA, PR_USUALTA, PR_ASUNTO, PR_ORIGENPEDIDO) ' +
      'VALUES (' + SqlValue(NroPedido) + ', ' + SqlValue(Trim(eMail)) +
      ', sysdate, ' + SqlValue(Sesion.LoginName) + ', ' + SqlValue(Motivo) + ', ''F'')'
    );

    // Informe de Accidentes
    EjecutarSqlST(
      'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
      'VALUES (hys.seq_hpw_id.nextval, ' + SqlValue (1) + ', sysdate, ' +
      SqlValue(Sesion.LoginName) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Informe de Evolución de Accidentes
    EjecutarSqlST(
      'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
      'VALUES (hys.seq_hpw_id.nextval, ' + SqlValue (4) + ', sysdate, ' +
      SqlValue(Sesion.LoginName) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Informe de Establecimientos
    EjecutarSqlST(
      'INSERT INTO hys.hpw_pedidosweb(PW_ID, PW_IDREPORTE, PW_FECHAALTA, PW_USUALTA, PW_IDPEDIDO) ' +
      'VALUES (hys.seq_hpw_id.nextval, ' + SqlValue (2) + ', sysdate, ' +
      SqlValue(Sesion.LoginName) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Inserto parámetro CUIT
    EjecutarSqlST(
      'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
      'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('CUITFILTRO') + ', ' +
      SqlValue (CUIT) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Inserto parámetro FechaDesde
    EjecutarSqlST(
      'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
      'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('FECHADESDEFILTRO') + ', ' +
      SqlValue (FormatDateTime('DD/MM/YYYY', FechaDesde)) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Inserto parámetro FechaHasta
    EjecutarSqlST(
      'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
      'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('FECHAHASTAFILTRO') + ', ' +
      SqlValue (FormatDateTime('DD/MM/YYYY', FechaHasta)) + ', ' + SqlValue(NroPedido) + ')'
    );

    // Inserto parámetro e-Mail
    EjecutarSqlST(
      'INSERT INTO hys.hpp_parametrospedido(PP_ID, PP_PARAMETRO, PP_VALOR, PP_IDPEDIDOREPORTE) ' +
      'VALUES (hys.seq_hpp_id.nextval, ' + SqlValue ('EMAILFILTRO') + ', ' +
      SqlValue (eMail) + ', ' + SqlValue(NroPedido) + ')'
    );

    Result := true
  except
    On E: Exception do Result := false
  end
end;

procedure TfrmGestionEmpresasPreventor.tbCPClick(
  Sender: TObject);
begin
  Abrir(TfrmReasignacionCP, frmReasignacionCP, tmvNormal, frmPrincipal.mnuReasigCP);

  frmReasignacionCP.Caption := 'Consulta de CP asignados';
//  frmReasignacionCP.pnlAsignacion.Visible := false;
//  frmReasignacionCP.btnGuardar.Visible := false;
  frmReasignacionCP.edCP.Text := fraLocalidad.edCPostal.Text;
  if fraPreventorFiltro.IsSelected then
    frmReasignacionCP.fraPreventorOrigen.Value := fraPreventorFiltro.Value;
  frmReasignacionCP.btnCancelar.Caption := '&Salir';
end;

procedure TfrmGestionEmpresasPreventor.tbAfiliacionesClick(
  Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  with TfrmContratoEstablecimiento.Create(Self) do
  try
    DoCargarDatos(sdqConsulta.fieldbyname('co_contrato').AsInteger);
    Visible := false;
    ShowModal;
    LlenarEstabTipoEventual(False);
  finally
    Free;
  end;
end;

procedure TfrmGestionEmpresasPreventor.sdqConsultaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if (ModoForm = mfEstablecimientos) and dbgEmpresa.Visible and
    (sdqConsulta.FieldbyName('ep_cuit').AsString <> FCuitAnterior) then
  begin
  {  sdqDatosEmpresa.close;
    sdqDatosEmpresa.ParamByName('idempresa').Value := DataSet.fieldbyname('ep_idempresa').AsInteger;
    sdqDatosEmpresa.Open;}
    sdqDatosEmpresa.Close;
  end;
  FCuitAnterior := sdqConsulta.FieldbyName('ep_cuit').AsString;
end;

procedure TfrmGestionEmpresasPreventor.FSFormDestroy(Sender: TObject);
begin
  SelectedList.Free;
  SelectedListEmpresas.Free;
  inherited;
end;

procedure TfrmGestionEmpresasPreventor.sdqConsultaSELECTEDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if (SelectedList.IndexOf(sdqConsulta.fieldbyname('EP_ID').AsString) <> -1) then
    Text := 'S'
  else
    Text := '';
end;

procedure TfrmGestionEmpresasPreventor.GridCellClick(Column: TColumn);
var
 i :integer;
begin
  inherited;

  if Assigned(Column.Field) then
    if (Column.Field.FieldName = 'SELECTED') then
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('EP_ID').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('EP_ID').AsString, sdqConsulta.GetBookmark)
      else begin
        {$IFDEF VER150}
        sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
        {$ENDIF}
        SelectedList.Delete(i);
      end;
      Column.Grid.Refresh;
    end;

end;

procedure TfrmGestionEmpresasPreventor.tbAplicarSugeridoClick(
  Sender: TObject);
var
  i: integer;
  actualizarestado : Boolean;
begin
  inherited;
  Verificar(not cbVerPreventorSugerido.Checked, cbVerPreventorSugerido, 'Debe seleccionar el sugerido.');
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');

  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;

  If HacerCommit then
    BeginTrans(true);
  if MsgBox('¿Desea reasignar las tareas al nuevo preventor?',MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    BorrarReasignacion;
    if fpMotivoReasignacion.ShowModal = mrOK then
      actualizarestado := True
    else
      actualizarestado := False;
  end
  else
    actualizarestado := False;
  try
    for i:=0 to SelectedList.Count-1 do
    begin
      Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
      if not ExisteSql('SELECT 1 FROM hys.hpe_preventorexclusivo WHERE pe_idempresa = '+
                       SqlValue(Grid.DataSource.DataSet.fieldbyname('ep_idempresa').AsInteger)+
                       'AND pe_fechabaja IS NULL') then
      begin
        if not Grid.DataSource.DataSet.fieldbyname('idprevsugerido').IsNull and (Grid.DataSource.DataSet.fieldbyname('EP_NRORESOLUCION').AsInteger <> 1) then
        begin
          if (Grid.DataSource.DataSet.fieldbyname('ep_idfirmante').IsNull) or
            (ExisteSql(' Select 1 from hys.hpc_preventorcpostal ' +
                       ' where pc_codigo = ' + SqlValue(Grid.DataSource.DataSet.fieldbyname('es_cpostal').AsString)  +
                       ' and pc_provincia = ' + SqlValue(Grid.DataSource.DataSet.fieldbyname('es_provincia').AsString) +
                       ' and pc_idpreventor = ' + SqlValue(Grid.DataSource.DataSet.fieldbyname('ep_idfirmante').AsInteger) +
                       ' and pc_fechabaja is null ') )  then
          begin
            EjecutarSqlST(' update hys.hep_estabporpreventor ' +
                          ' set ep_idfirmante = ' + SqlValue(Grid.DataSource.DataSet.fieldbyname('idprevsugerido').AsInteger) + ', ' +
                          ' ep_itcodigo = (select it_codigo from art.pit_firmantes where it_id = ' +  SqlValue(Grid.DataSource.DataSet.fieldbyname('idprevsugerido').AsInteger) + ')' +
                          ' where ep_id = ' + SqlValue(Grid.DataSource.DataSet.fieldbyname('ep_id').AsInteger)
                         );
            if actualizarestado then
              ReasignarTareas(Grid.DataSource.DataSet.fieldbyname('EP_CUIT').AsString,
                              Grid.DataSource.DataSet.fieldbyname('EP_ESTABLECI').AsInteger,
                              Grid.DataSource.DataSet.fieldbyname('idprevsugerido').AsInteger);
          end;
        end;
      end;
      EjecutarStoreST('art.hys.do_actualizarestado(' +  SqlValue(Grid.DataSource.DataSet.fieldbyname('ep_id').AsInteger) + ');');
    end;
    If HacerCommit then
      CommitTrans(true);
    SelectedList.Clear;
    sdqConsulta.Refresh;
    sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
    sdqConsultaAfterScroll(grid.DataSource.DataSet);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al aplicar los sugeridos');
    end;
  end;
  sdqConsulta.EnableControls;
end;
(*
var
  i: integer;
begin
  inherited;
  Verificar(not cbVerPreventorSugerido.Checked, cbVerPreventorSugerido, 'Debe seleccionar el sugerido.');

  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;

  Grid.DataSource := nil;

  BeginTrans(true);

  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      if not sdqConsulta.fieldbyname('idprevsugerido').IsNull then
      begin
        if (sdqConsulta.fieldbyname('ep_idfirmante').IsNull) or
           (ExisteSqlEx(' Select 1 from hys.hpc_preventorcpostal ' +
                        ' where pc_codigo = :v1' +
                        ' and pc_provincia = :v2' +
                        ' and pc_idpreventor = :v3' +
                        ' and pc_fechabaja is null ', [sdqConsulta.fieldbyname('es_cpostal').AsString,
                                                       sdqConsulta.fieldbyname('es_provincia').AsString,
                                                       sdqConsulta.fieldbyname('ep_idfirmante').AsInteger]) ) then

          EjecutarSqlST(' update hys.hep_estabporpreventor ' +
                        ' set ep_idfirmante = ' + SqlValue(sdqConsulta.fieldbyname('idprevsugerido').AsInteger) + ', ' +
                        ' ep_itcodigo = (select it_codigo from art.pit_firmantes where it_id = ' +  SqlValue(sdqConsulta.fieldbyname('idprevsugerido').AsInteger) + ')' +
                        ' where ep_id = ' + SqlValue(sdqConsulta.fieldbyname('ep_id').AsInteger)
                        );
      end;

      EjecutarStoreST('art.hys.do_actualizarestado(' +  SqlValue(sdqConsulta.fieldbyname('ep_id').AsInteger) + ');');
      sdqConsulta.Next;
    end;
    CommitTrans(true);
    Grid.DataSource := dsConsulta;
    sdqConsulta.Refresh;
    sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
    sdqConsultaAfterScroll(grid.DataSource.DataSet);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al aplicar los sugeridos');
    end;
  end;
  sdqConsulta.EnableControls;
end;
*)

procedure TfrmGestionEmpresasPreventor.cbVerPreventorSugeridoABMClick(
  Sender: TObject);
var
  sqlIn: String;
begin
  inherited;
  if cbVerPreventorSugeridoABM.Checked then
  begin
    fraPreventor.Clear;
    sqlIn := '';
    sdqListaPrevSugeridos.SQL.Clear;
    sdqListaPrevSugeridos.ParamCheck := false;
    sdqListaPrevSugeridos.SQL.Add(' begin ' +
                                  ' art.hys.get_listapreventor_sugerido( ' + SqlValue(fraEmpresaEstab.Value) + ', ' +
                                    SqlValue(fraEstablecimiento.Value) + ', :cursor); ' +
                                  ' end; ' );
    sdqListaPrevSugeridos.Params.Clear;
    sdqListaPrevSugeridos.Params.CreateParam(ftCursor, 'cursor', ptOutput);
    sdqListaPrevSugeridos.Prepare;
    sdqListaPrevSugeridos.Open;
    while not sdqListaPrevSugeridos.Eof do
    begin
      if sqlIn <> '' then
        sqlIn := sqlIn + ', ';
      sqlIn := sqlIn + sdqListaPrevSugeridos.fieldbyname('idpreventor').AsString;
      sdqListaPrevSugeridos.Next;
    end;
    sdqListaPrevSugeridos.Close;
    if (sqlIn <> '') then
    begin
      fraPreventor.ExtraCondition := fraPreventor.ExtraCondition + ' and it_id in ( ' + sqlIn + ')';
      fraPreventor.cmbDescripcionDropDown(sender);
      if fraPreventor.sdqDatos.RecordCount = 1 then
        fraPreventor.SelectFirst;
    end
    else
      fraPreventor.ExtraCondition := ' and 1 = 2 ';
  end
  else begin
    fraPreventor.ExtraCondition := '';
    fraPreventor.Value := FIDPreventorAnterior;
  end;

end;


procedure TfrmGestionEmpresasPreventor.fpAbmShow(Sender: TObject);
begin
  inherited;
  //fraTipoEmpresa.Locked := true;
  VclExtra.LockControl(cmbActividad, true);
end;

procedure TfrmGestionEmpresasPreventor.sdqConsultaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  tbModificarEmpresa.Enabled := not DataSet.IsEmpty;
end;

procedure TfrmGestionEmpresasPreventor.sdqListaPrevSugeridosAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  tbModificarEmpresa.Enabled := false;
end;

procedure TfrmGestionEmpresasPreventor.tbModificarEmpresaClick(
  Sender: TObject);
begin
  inherited;
  Verificar(sdqDatosEmpresa.FieldByName('co_operativo').AsString <> ValorSql('select hys.get_operativovigente_empresa(' + SqlValue(sdqDatosEmpresa.fieldbyname('co_cuit').AsString) + ') from dual'),
            dbgEmpresa, 'Sólo se puede modificar datos del operativo actual.');

  cbReferenteNotif.Checked := false;
  cbReferenteExclusivo.Checked := false;
  fraPreventorNotif.Locked := not( (sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'ET') or (sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'EP'));

  fraEstablecimientoModif.Locked := not( (sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'ET') or (sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'EP'));
  fraPreventorNotif.Clear;

  vclextra.LockControls([edFNotif], not( (sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'ET') or (sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'EP')));

  edFNotif.Clear;
  fraEstablecimientoModif.Clear;
  if(sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'ET') or (sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'EP') then
  begin
    fraPreventorNotif.Codigo := sdqDatosEmpresa.fieldbyname('IT_CODIGO').AsString;
    edFNotif.Date := sdqDatosEmpresa.fieldbyname('CO_FECHANOTIFICACION').AsDateTime;

    fraEstablecimientoModif.CUIT := sdqDatosEmpresa.fieldbyname('co_cuit').AsString;
    if not sdqDatosEmpresa.fieldbyname('CO_ESTAB_EVENTO').IsNull then
      fraEstablecimientoModif.Cargar(sdqDatosEmpresa.fieldbyname('co_cuit').AsString, sdqDatosEmpresa.fieldbyname('CO_ESTAB_EVENTO').AsString);
  end;
  fraEmpresaModif.Value := sdqDatosEmpresa.fieldbyname('co_idempresa').AsInteger;
  fraEmpresaModif.Locked := true;
  //et o ep
  fraTipoEmpresaModif.Locked := (sdqDatosEmpresa.fieldbyname('te_id').AsInteger = 1) or (sdqDatosEmpresa.fieldbyname('te_id').AsInteger = 2);
  if not fraTipoEmpresaModif.Locked then
    fraTipoEmpresaModif.ExtraCondition := ' AND TE_TIPOSRT = ''GB'' AND TE_APLICA LIKE ''%C%'''
  else
    fraTipoEmpresaModif.ExtraCondition := '';
  fraTipoEmpresaModif.Value := sdqDatosEmpresa.fieldbyname('te_id').AsInteger;
  edTipoEmpresaSrtModif.Text := sdqDatosEmpresa.fieldbyname('tipostr').AsString;
  fraPreventorRef.Codigo := sdqDatosEmpresa.fieldbyname('idreferente').AsString;
  fraPreventorExclusivo.Value := sdqDatosEmpresa.fieldbyname('pe_preventorid').AsInteger;
  fraSubTipo.Codigo := sdqDatosEmpresa.fieldByName('co_idsubtipo').AsString;
  fpEmpresaModif.ShowModal;
end;

procedure TfrmGestionEmpresasPreventor.fraPreventorRefcmbDescripcionDropDown(
  Sender: TObject);
begin
  inherited;
  FiltrarPreventor(Sender, fraPreventorRef);
end;

procedure TfrmGestionEmpresasPreventor.Button1Click(Sender: TObject);
begin
  if HacerCommit then
    BeginTrans(true);
  Verificar(edFNotif.Date > DBDate, edFNotif, 'La fecha de notificación no puede ser mayor a hoy');
  try
    if (fraTipoEmpresaModif.Modified) then
    begin
      if(fraTipoEmpresaModif.Codigo = 'EADS')then
      begin
        if not ExisteSql(
            ' SELECT 1 '+
            '   FROM afi.aem_empresa, hys.hre_rankingempresa '+
            '  WHERE em_id = re_idempresa '+
            '    AND em_cuit = '+SqlValue(sdqDatosEmpresa.fieldbyname('co_cuit').AsString)+
            '    AND re_fechabaja IS NULL '+
            '    AND (re_vigenciadesde <= art.actualdate) '+
            '    AND ((re_vigenciahasta > art.actualdate) OR (re_vigenciahasta IS NULL)) ')then
        EjecutarSqlST(
            ' INSERT INTO hys.hre_rankingempresa '+
            '             (re_id, re_idranking, re_idempresa, re_vigenciadesde, '+
            '              re_fechaalta, re_usualta) '+
            '      SELECT hys.seq_hre_id.NEXTVAL, 1, em_id, art.actualdate, SYSDATE, '+
                         SqlValue(Sesion.UserID)+
            '        FROM afi.aem_empresa '+
            '       WHERE em_cuit = '+SqlValue(sdqDatosEmpresa.fieldbyname('co_cuit').AsString));

      end
      else begin
        if ExisteSql(
            ' SELECT 1 '+
            '   FROM afi.aem_empresa, hys.hre_rankingempresa '+
            '  WHERE em_id = re_idempresa '+
            '    AND em_cuit = '+SqlValue(sdqDatosEmpresa.fieldbyname('co_cuit').AsString)+
            '    AND re_fechabaja IS NULL '+
            '    AND (re_vigenciadesde <= art.actualdate) '+
            '    AND ((re_vigenciahasta > art.actualdate) OR (re_vigenciahasta IS NULL)) ')then
              EjecutarSqlST(
                ' UPDATE hys.hre_rankingempresa '+
                '    SET re_vigenciahasta = art.actualdate '+
                '  WHERE re_idempresa = '+ SqlValue(fraEmpresaModif.Value)+
                '    AND re_fechabaja IS NULL ');
      end;
    end;

    // Actualizo el establecimiento de los eventos, del tipo generado en el
    // módulo, correspondientes al establecimiento previo con el nuevo
    // establecimiento
    EjecutarSqlST('UPDATE hys.hee_eventoempresa '+
                  '   SET ee_fechamodif = sysdate, '+
                  '       ee_establecimiento = ' + fraEstablecimientoModif.edCodigo.TextSql + ', ' +
                  '       ee_usumodif = '+SqlValue(Sesion.UserID)+
                  ' WHERE ee_cuit = '+SqlValue(sdqDatosEmpresa.fieldbyname('co_cuit').AsString)+
                  '   AND (ee_establecimiento = ' + SqlValue(sdqDatosEmpresa.fieldbyname('co_estab_evento').AsString) +
                  '        OR ee_establecimiento IS NULL) ' +
                  '   AND ee_tipo = '+SqlValue(sdqDatosEmpresa.fieldbyname('tipostr').AsString)+
                  '   AND ee_fechaevento = '+SqlDate(sdqDatosEmpresa.FieldByName ('CO_FECHANOTIFICACION').AsDateTime)+
                  '   AND ee_operativo = '+SqlValue(sdqDatosEmpresa.fieldbyname('co_operativo').AsString)+
                  '   AND ee_idtipoevento = 7');

    EjecutarSqlST('UPDATE hys.hco_cuitoperativo ' +
                  '   SET co_usumodif = '+SqlValue(Sesion.UserID)+', '+
                  '       co_fechamodif = sysdate, '+
                  '       co_fechanotificacion = '+ SqlValue(edFNotif.Date)+
                  ' WHERE co_id = ' + SqlValue(sdqDatosEmpresa.fieldbyname('co_id').AsInteger));


    // Hay cambio de Preventor, actualiza o genera evento
    if ((sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'ET') or
        (sdqDatosEmpresa.fieldbyname('tipostr').AsString = 'EP')) and
       (fraPreventorNotif.CODIGO <> sdqDatosEmpresa.fieldbyname('IT_CODIGO').AsString) then
    begin
      EjecutarSqlST('UPDATE hys.hco_cuitoperativo ' +
                    '   SET co_idtipoempresaprev = ' + SqlValue(fraTipoEmpresaModif.Value) +', '+
                    '       co_idpreventornotif  = ' + SqlValue(fraPreventorNotif.Value)+', '+
                    '       co_idsubtipo = ' + SqlValue(fraSubTipo.Codigo)+', '+
                    '       co_estab_evento  = ' + fraEstablecimientoModif.edCodigo.TextSql + ', '+
                    '       co_usumodif = '+SqlValue(Sesion.UserID)+', '+
                    '       co_fechamodif = sysdate '+
                    ' WHERE co_id = ' + SqlValue(sdqDatosEmpresa.fieldbyname('co_id').AsInteger));

      if ExisteSql ('SELECT 1 '+
                    '  FROM hys.hee_eventoempresa '+
                    ' WHERE ee_cuit = '+ SqlValue(sdqDatosEmpresa.fieldbyname('co_cuit').AsString)+
                    '   AND ee_establecimiento = ' + fraEstablecimientoModif.edCodigo.TextSql +
                    '   AND ee_tipo = '+ SqlValue(sdqDatosEmpresa.fieldbyname('tipostr').AsString)+
                    '   AND ee_operativo = '+SqlValue(sdqDatosEmpresa.fieldbyname('co_operativo').AsString)+
                    '   AND ee_fechaevento = '+SqlDate(sdqDatosEmpresa.FieldByName ('CO_FECHANOTIFICACION').AsDateTime)+
                    '   AND ee_fechabaja is null'+
                    '   AND ee_idtipoevento = 7') then
        EjecutarSqlST('UPDATE hys.hee_eventoempresa '+
                      '   SET ee_fechaevento = art.actualdate,'+
                      '       ee_fechamodif = sysdate, '+
                      '       ee_idpreventor = '+SqlValue(fraPreventorNotif.Value)+','+
                      '       ee_usumodif = '+SqlValue(Sesion.UserID)+
                      ' WHERE ee_cuit = '+SqlValue(sdqDatosEmpresa.fieldbyname('co_cuit').AsString)+
                      '   AND ee_establecimiento = ' + fraEstablecimientoModif.edCodigo.TextSql +
                      '   AND ee_tipo = '+SqlValue(sdqDatosEmpresa.fieldbyname('tipostr').AsString)+
                      '   AND ee_fechaevento = '+SqlDate(sdqDatosEmpresa.FieldByName ('CO_FECHANOTIFICACION').AsDateTime)+
                      '   AND ee_operativo = '+SqlValue(sdqDatosEmpresa.fieldbyname('co_operativo').AsString)+
                      '   AND ee_idtipoevento = 7')
      else
        EjecutarSqlST('INSERT INTO hys.hee_eventoempresa (ee_id, ee_cuit, ee_establecimiento, '+
                      '            ee_tipo, ee_operativo, ee_idtipoevento, '+
                      '            ee_muestracuit, ee_fechaevento, ee_fechaalta, ee_usualta, ee_idpreventor)'+
                      '    Values(hys.seq_hee_id.NEXTVAL,'+
                                  SqlValue(sdqDatosEmpresa.fieldbyname('co_cuit').AsString)+', '+
                                  fraEstablecimientoModif.edCodigo.TextSql + ', ' +
                                  SqlValue(sdqDatosEmpresa.fieldbyname('tipostr').AsString)+', '+
                                  SqlValue(sdqDatosEmpresa.fieldbyname('co_operativo').AsString)+
                                  ', 7, ''S'', art.actualdate, sysdate,'+
                                  SqlValue(Sesion.UserID)+','+
                                  SqlValue(fraPreventorNotif.Value)+')');
    end
    else
      EjecutarSqlST('UPDATE hys.hco_cuitoperativo ' +
                    '   SET co_idtipoempresaprev = ' + SqlValue(fraTipoEmpresaModif.Value) + ', '+
                    '       co_idsubtipo = ' + SqlValue(fraSubTipo.Codigo)+', '+
                    '       co_usumodif = '+SqlValue(Sesion.UserID)+', '+
                    '       co_fechamodif = sysdate, '+
                    '       co_estab_evento  = ' + fraEstablecimientoModif.edCodigo.TextSql +
                    ' WHERE co_id = ' + SqlValue(sdqDatosEmpresa.fieldbyname('co_id').AsInteger));

    ActualizarPreventorExclusivo(fraEmpresaModif.Value, fraPreventorExclusivo.Value );

    EjecutarStoreST(' art.hys.do_actualizartipoestabprev(' + SqlValue(fraEmpresaModif.Value) + ', ' + SqlValue(fraTipoEmpresaModif.Value) + ');');
    ActualizarPreventorReferente(fraEmpresaModif.CUIT, fraPreventorRef.Codigo);
    If HacerCommit then
      CommitTrans(true);
    fpEmpresaModif.ModalResult := mrOk;
//    sdqDatosEmpresa.Refresh;
    sdqConsulta.Refresh;
  except
    on E: Exception do begin
      Rollback(true);
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
end;

procedure TfrmGestionEmpresasPreventor.dbgEmpresaDblClick(Sender: TObject);
begin
  tbModificarEmpresa.Click;
end;

procedure TfrmGestionEmpresasPreventor.tbSeleccionarTodosClick(
  Sender: TObject);
var
  i: integer;
begin
  sdqConsulta.DisableControls;
  sdqConsulta.AfterScroll := nil;
  try
    sdqConsulta.First;
    while not sdqConsulta.Eof do
    begin
      i:= SelectedList.IndexOf(sdqConsulta.fieldbyname('EP_ID').AsString);
      if (i = -1) then
        SelectedList.AddObject(sdqConsulta.fieldbyname('EP_ID').AsString, sdqConsulta.GetBookmark);
      sdqConsulta.Next;
    end;
  finally
    sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
    sdqConsulta.EnableControls;
    Grid.Refresh;
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbDesSeleccionarTodoClick(
  Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedList.Count - 1 do
    sdqConsulta.FreeBookmark(TBookmark(SelectedList.Objects[i]));
{$ENDIF}
  SelectedList.Clear;
  Grid.Refresh;
end;

procedure TfrmGestionEmpresasPreventor.tbExportarClick(Sender: TObject);
begin
  sdqConsulta.AfterScroll := nil;
  try
    inherited;
  finally
    sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
  end;
end;

procedure TfrmGestionEmpresasPreventor.fraMotivoAsignacionChange(Sender: TObject);
begin
  if not fraMotivoAsignacion.IsEmpty and not fraMotivoAsignacion.sdqDatos.FieldByName('ma_diasvigencia').IsNull then
    edVigenciaAsig.Date := IncDay(DBDate, fraMotivoAsignacion.sdqDatos.FieldByName('ma_diasvigencia').AsInteger)
  else
    edVigenciaAsig.Clear;
end;

procedure TfrmGestionEmpresasPreventor.fraMotivoAsignacionModifChange(Sender: TObject);
begin
  if not fraMotivoAsignacionModif.IsEmpty and not fraMotivoAsignacionModif.sdqDatos.FieldByName('ma_diasvigencia').IsNull then
    edVigenciaAsigModif.Date := IncDay(DBDate, fraMotivoAsignacionModif.sdqDatos.FieldByName('ma_diasvigencia').AsInteger)
  else
    edVigenciaAsigModif.Clear;
end;

{procedure TfrmGestionEmpresasPreventor.fraPreventorChange(Sender: TObject);
begin
  inherited;
    VCLExtra.LockControls([fraMotivoAsignacionModif, edObservacionModif, edVigenciaAsigModif], sdqConsulta.FieldByName('EP_ITCODIGO').AsString = fraPreventor.Codigo);
end;}





procedure TfrmGestionEmpresasPreventor.tbOcultarGridEmpresaClick(
  Sender: TObject);
begin
  if tbOcultarGridEmpresa.Down then
  begin
    Splitter.Visible := false;
    dbgEmpresa.Visible := false;
    tbOcultarGridEmpresa.ImageIndex := 11;
    sdqDatosEmpresa.Close;
  end
  else begin
    Splitter.Visible := true;
    dbgEmpresa.Visible := true;
    tbEmpresas.Top := Grid.Top + 1;
    dbgEmpresa.Top := tbEmpresas.Top + 1;
    Splitter.Top := dbgEmpresa.Top - 1;
    tbOcultarGridEmpresa.ImageIndex := 10;
    if sdqConsulta.Active then
      sdqConsultaAfterScroll(Grid.DataSource.DataSet);
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbCambioVistaClick(Sender: TObject);
begin
  inherited;
  if (FModoForm = mfEstablecimientos) then
  begin
    ModoForm := mfEmpresas;
    cbUltimoOperativo.Checked := true;
  end
  else
  begin
    ModoForm := mfEstablecimientos;
    cbUltimoOperativo.Checked := false;
  end;
//  tbLimpiarClick(Sender);
  if sdqDatosEmpresa.Active or sdqConsulta.Active then
    tbRefrescarClick(Sender)
end;

procedure TfrmGestionEmpresasPreventor.setModoForm(const Value: TModoForm);
var
  auxHeight: integer;
begin
  FModoForm := Value;
  if (FModoForm = mfEstablecimientos) then
  begin
    Grid.ColumnByField['SELECTED'].Visible := True;
    dbgEmpresa.ColumnByField['SELECTED'].Visible := False;
    auxHeight := Grid.Height;

    tbEmpresas.Align := alBottom;
    dbgEmpresa.Align := alBottom;
    dbgEmpresa.Top := Splitter.Top + 1;
    Grid.Top := dbgEmpresa.Top - 1;
    CoolBar.Align := alTop;
    Grid.Align := alClient;
//    tbRefrescarEmpresa.Visible := false;
    tbLimpiarEmpresa.Visible := false;
    tbSalirEmpresa.Visible := false;
    tbOcultarGridEmpresa.Visible := true;

    sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
    sdqDatosEmpresa.AfterScroll := nil;

    vclExtra.LockControls([{edEstablecimiento,} cbListarCoordinados, cmbPreventorUltVisita,
                  cbSinPreventor, cbTercerizado,cbEventual,chkGBA,
                  cmbEstadoEstab,edVigenciaAsigFiltro,edVigenciaAsigFiltro2,cmbPrs,cmbPAL,
                  cbAnexoI,cbAnexoII,cbAnexoFicticio,cbPrs,cbPAL,cbDenunciasGrales,
                  cbOtrasDenuncias,cbAvisoObra,cmbAnexoI,cmbAnexoII,cmbAnexoFicticio,
                  cmbDenunciasGrales,cmbOtrasDenuncias,cmbAvisoObra,cmbResolucion, cmbZona,
                  cbVerPreventorSugerido, chkEstabConCPPrev],
                  false);

//    dbgEmpresa.Height := Grid.Height;
    dbgEmpresa.Height := auxHeight;

    fraLocalidad.Locked := False;
    fraMotivoAsignacionFiltro.Locked := False;
    fraPerfil.Locked := False;
    tbRefrescar.Visible := true;
    tbSalir.Visible := true;
  end
  else begin
    dbgEmpresa.ColumnByField['SELECTED'].Visible := true;
    Grid.ColumnByField['SELECTED'].Visible := false;
    auxHeight := dbgEmpresa.Height;

    CoolBar.Align := alBottom;
    Grid.Align := alBottom;
    dbgEmpresa.Top := Grid.Top - 1;
    Grid.Top := Splitter.Top + 1;
    tbEmpresas.Align := alTop;
    dbgEmpresa.Align := alClient;

    tbRefrescarEmpresa.Visible := true;
    tbLimpiarEmpresa.Visible := true;
    tbSalirEmpresa.Visible := true;
    tbOcultarGridEmpresa.Visible := false;

    sdqConsulta.AfterScroll := nil;
    sdqDatosEmpresa.AfterScroll := sdqDatosEmpresaAfterScroll;

    vclExtra.LockControls([edEstablecimiento, cmbPreventorUltVisita,
                  cbSinPreventor, cbListarCoordinados, cbTercerizado,cbEventual,chkGBA,
                  cmbEstadoEstab,edVigenciaAsigFiltro,edVigenciaAsigFiltro2,cmbPrs,cmbPAL,
                  cbAnexoI,cbAnexoII,cbAnexoFicticio,cbPrs,cbPAL,cbDenunciasGrales,
                  cbOtrasDenuncias,cbAvisoObra,cmbAnexoI,cmbAnexoII,cmbAnexoFicticio,
                  cmbDenunciasGrales,cmbOtrasDenuncias,cmbAvisoObra,cmbResolucion,cmbZona,
                  cbVerPreventorSugerido, chkEstabConCPPrev],
                  true);

//    Grid.Height := dbgEmpresa.Height;
    Grid.Height := auxHeight;

    fraLocalidad.Locked := True;
    fraMotivoAsignacionFiltro.Locked := True;
    fraPerfil.Locked := True;
    BorrarFiltros;

    tbRefrescar.Visible := false;
    tbSalir.Visible := false;

  end;
end;


procedure TfrmGestionEmpresasPreventor.BorrarFiltros;
begin
    edEstablecimiento.Clear;
    cbListarCoordinados.Checked := False;
    cbSinPreventor.Checked := False;
    cbPreventorProvisorioFiltro.Checked := False;
    cbTercerizado.Checked := False;
    cbEventual.Checked := False;
    chkGBA.Checked := False;
    cmbEstadoEstab.Clear;
    edVigenciaAsigFiltro.Clear;
    edVigenciaAsigFiltro2.Clear;
    cbAnexoI.Checked := false;
    cbAnexoII.Checked := false;
    cbAnexoFicticio.Checked := false;
    cbPrs.Checked := false;
    cbPAL.Checked := False;
    cbDenunciasGrales.Checked := false;
    cbOtrasDenuncias.Checked := false;
    cbAvisoObra.Checked := false;
end;

procedure TfrmGestionEmpresasPreventor.ArmarQueryEmpresa;
var
  sIn: String;
  sSelectIncidencia : String;
  i: integer;
  sPreventorIn: String;
begin
    sdqConsulta.Close;
    sdqDatosEmpresa.SQL.Clear;
    sWhere := '';
    sFrom := '';
    sSelect := '';
    sPreventorIn := '';

    for i:=0 to lstPrev.Count-1 do
    begin
      if (sPreventorIn <> '') then
        sPreventorIn := sPreventorIn + ', ';
      sPreventorIn := sPreventorIn + IntToStr(Integer(lstPrev.Items.Objects[i]));
    end;

    if (sPreventorIn = '') and fraPreventorFiltro.IsSelected then
      sPreventorIn := IntToStr(fraPreventorFiltro.Value);


    if cbUltimoOperativo.Checked then
      sWhere := sWhere + ' and co_id = art.hys.get_idoperativovigente_empresa (co_cuit, SYSDATE)';
    sIn := '';
    if cmbHolding.Text <> '' then
      begin
        sIn := '';
        for i:=0 to cmbHolding.Items.Count-1 do
          if cmbHolding.Checked[i] then
          begin
            if (sIn <> '') then sIn := sIn + ', ';
            sIn := sIn + SqlValue(integer(cmbHolding.Items.Objects[i]));
          end;
      end;

    if(sIn <> '') then
        sWhere := sWhere + ' and aem.em_idgrupoeconomico + 0 in (' + sIn  + ')';

    sSelectIncidencia :=
      ' ,(SELECT distinct cp_fecha FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = (SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion WHERE cp_idempresa = '+
      ' aco.co_idempresa)) as cp_fecha, '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa'+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), 0))) AS "Incidencia Actual", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -1))) AS "Incidencia 1 mes atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -2))) AS "Incidencia 2 meses atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -3))) AS "Incidencia 3 meses atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -4))) AS "Incidencia 4 meses atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -5))) AS "Incidencia 5 meses atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -6))) AS "Incidencia 6 meses atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -7))) AS "Incidencia 7 meses atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -8))) AS "Incidencia 8 meses atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -9))) AS "Incidencia 9 meses atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -10))) AS "Incidencia 10 meses atras", '+
      ' (SELECT cp_incidencia FROM hys.hcp_carteraprevencion WHERE cp_idempresa = aco.co_idempresa '+
      ' AND cp_fecha = LAST_DAY (ADD_MONTHS ((SELECT MAX (cp_fecha) FROM hys.hcp_carteraprevencion '+
      ' WHERE cp_idempresa = aco.co_idempresa), -11))) AS "Incidencia 11 meses atras" ';


    if FModoForm = mfEmpresas then
    begin

      if cbSinReferente.Checked then
        sWhere := sWhere + ' AND art.hys.get_preventor_referente(hco.co_cuit) is null';

      if (not edCantTrabajadoresMin.IsEmpty) or (not edCantTrabajadoresMax.IsEmpty) then
        begin
            sWhere := sWhere + iif((not edCantTrabajadoresMin.IsEmpty), ' and NVL (co_totempleadosactual, co_totempleados) >= ' + SqlValue(edCantTrabajadoresMin.Value), '');
            sWhere := sWhere + iif((not edCantTrabajadoresMax.IsEmpty), ' and NVL (co_totempleadosactual, co_totempleados) <= ' + SqlValue(edCantTrabajadoresMax.Value), '');
        end;

      sIn := '';
      if cmbSector.Text <> '' then
      begin
        sIn := '';
        for i:=0 to cmbSector.Items.Count-1 do
          if cmbSector.Checked[i] then
          begin
            if (sIn <> '') then sIn := sIn + ', ';
            sIn := sIn + SqlValue(integer(cmbSector.Items.Objects[i]));
          end;
      end;

      if (sPreventorIn <> '') and cmbVerPreventorExclusivo.Checked then
        sWhere := sWhere +
        ' AND EXISTS ( '+
        '  SELECT 1 '+
        '    FROM hys.hpe_preventorexclusivo '+
        '   WHERE pe_idempresa = em_id '+
        '     AND pe_fechabaja IS NULL '+
        '     AND pe_preventorid in (' + sPreventorIn + ')) ';

      if cmbEmpresaPreventorExclusivo.Checked then
        sWhere := sWhere +
        '  AND EXISTS (SELECT 1 '+
        '                FROM hys.hpe_preventorexclusivo '+
        '               WHERE pe_idempresa = em_id AND pe_fechabaja IS NULL) ';

      if cmbEmpresaSinPreventorExclusivo.Checked then
        sWhere := sWhere +
        '  AND NOT EXISTS (SELECT 1 '+
        '                    FROM hys.hpe_preventorexclusivo '+
        '                   WHERE pe_idempresa = em_id AND pe_fechabaja IS NULL) ';

      if (sIn <> '') then
        sWhere := sWhere + ' AND em_sector + 0 in (' + sIn  + ') ';

      if not edActividad.IsEmpty then
          sWhere := sWhere + ' and  substr(art.hys.get_codactividadrevdos(cac.ac_id, cac.ac_revision),1,' + inttostr(length(edActividad.Text)) + ') = ' + SqlValue(edActividad.Text);

      if (sPreventorIn <> '') and cbPreventorReferente.Checked then
      begin
          sWhere := sWhere +
            ' AND aco.co_contrato = pc_contrato '+
            ' AND pitprev.it_codigo = pc_codigopreventor '+
            ' AND pitprev.it_id in (' + sPreventorIn + ')' +
            ' AND SYSDATE BETWEEN pc_fecha_desde AND NVL(pc_fecha_hasta, SYSDATE) ';
          sFrom := sFrom + ', afi.apc_preventorcontrato,art.pit_firmantes pitprev '
      end;

      if fraEmpresaFiltro.IsSelected then
          sWhere := sWhere + ' and aem.em_id = ' +  SqlValue(fraEmpresaFiltro.Value);

      if (fraSubTipoFiltro.IsSelected) then
        sWhere := sWhere + '   AND co_idsubtipo = ' + SqlValue(fraSubTipoFiltro.Value);

      if fraTipoFiltroSRT.IsSelected then
        sWhere := sWhere + ' and hco.co_tipo = ' + SqlValue(fraTipoFiltroSRT.Codigo);

      sIn := '';
      if cmbTipoEmpresaPrev.Text <> '' then
      begin
        sIn := '';
        for i:=0 to cmbTipoEmpresaPrev.Items.Count-1 do
          if cmbTipoEmpresaPrev.Checked[i] then
          begin
            if (sIn <> '') then sIn := sIn + ', ';
            sIn := sIn + SqlValue(integer(cmbTipoEmpresaPrev.Items.Objects[i]));
          end;
      end;

      if (sIn <> '') then
        sWhere := sWhere + ' and hco.co_idtipoempresaprev in (' + sIn  + ')';

      if fraRanking.IsSelected then
      begin
        sWhere := sWhere + ' and (exists (SELECT 1 ' +
                           '                FROM hys.hre_rankingempresa ' +
                           '               WHERE re_idranking =  ' + sqlInteger(fraRanking.Codigo) +
                           '                 AND re_idempresa = em_id))'
      end;

      if cbCtosActivos.Checked then
        sWhere := sWhere + ' and aco.co_estado = ''1'' ';

      sdqDatosEmpresa.SQL.Add(' SELECT /*+rule*/ hco.co_cuit, em_nombre, hco.co_operativo, hco.co_tipo tipostr, te_codigo tipoprevencion, st_descripcion subtipo,' +
                              '   art.hys.get_nombre_preventor_ref(hco.co_cuit) referente, hco.co_idempresa, te_id, hco.CO_IDPREVENTORNOTIF, hco.CO_FECHANOTIFICACION,hco.co_fechabaja, ' +
                              '   art.hys.get_preventor_referente(hco.co_cuit) idreferente, hco.co_id,(NVL(dc_codareatelefonos, '''') || dc_telefonos) telefonoemp,pit.it_id,co_idsubtipo, ' +
                              '   art.hys.get_ultimaincidenciaempresa(em_id) incid, hco.co_rigedesde, hco.co_rigehasta, tb_descripcion sector,pit.IT_NOMBRE, pit.IT_CODIGO, ge_descripcion, co_estab_evento,' +
                              '   (SELECT pe_preventorid FROM hys.hpe_preventorexclusivo WHERE pe_idempresa = em_id AND pe_fechabaja IS NULL) pe_preventorid, '+
                              '   (SELECT pex.it_nombre FROM hys.hpe_preventorexclusivo, art.pit_firmantes pex WHERE pe_idempresa = em_id AND pe_fechabaja IS NULL'+
                              '    AND pex.it_id = pe_preventorid) prevex, co_vigenciahasta, co_pramet '+ sSelectIncidencia+
                              ' FROM afi.adc_domiciliocontrato ahdl, art.ctb_tablas tbsector, ' +
                              '      afi.aem_empresa aem, afi.age_grupoeconomico age, ' +
                              '      afi.aco_contrato aco, comunes.cac_actividad cac, hys.hst_subtipo, hys.hte_tipoempresaprev, hys.hco_cuitoperativo hco, ART.PIT_FIRMANTES pit' + sFrom+
                              ' WHERE te_id = hco.co_idtipoempresaprev ' +
                              '   AND CO_IDPREVENTORNOTIF = pit.IT_ID(+) '+
                              '   AND hco.co_idempresa = em_id ' +
                              '   AND aem.em_idgrupoeconomico = ge_id(+) '+
                              '   AND tbsector.tb_clave = ''SECT'' ' +
                              '   AND tbsector.tb_codigo = em_sector ' +
                              '   AND st_id(+) = hco.co_idsubtipo ' +
                              '   AND em_id = aco.co_idempresa ' +
                              '   AND cac.ac_id = co_idactividad ' +
                              '   AND aco.co_contrato = art.get_vultcontrato(em_cuit) ' +
                              '   AND ahdl.dc_contrato(+) = aco.co_contrato ' +
                              '   AND ahdl.dc_tipo(+) = ''L'' ' +  sWhere);
  //                            ' ORDER BY hco.co_cuit, hco.co_operativo desc, hco.co_rigehasta desc, hco.co_fechabaja desc ');
  end
  else begin
      sdqDatosEmpresa.SQL.Add(' SELECT /*+rule*/ hco.co_cuit, em_nombre, hco.co_operativo, hco.co_tipo tipostr, te_codigo tipoprevencion, st_descripcion subtipo, ' +
                              '   art.hys.get_nombre_preventor_ref(hco.co_cuit) referente, hco.co_idempresa, te_id, hco.CO_IDPREVENTORNOTIF, hco.CO_FECHANOTIFICACION, hco.co_fechabaja, ' +
                              '   art.hys.get_preventor_referente(hco.co_cuit) idreferente, hco.co_id,(NVL(dc_codareatelefonos, '''') || dc_telefonos) telefonoemp, pit.it_id,co_idsubtipo, ' +
                              '   art.hys.get_ultimaincidenciaempresa(em_id) incid, hco.co_rigedesde, hco.co_rigehasta, tb_descripcion sector, pit.IT_NOMBRE, pit.IT_CODIGO, ge_descripcion, co_estab_evento, ' +
                              '   (SELECT pe_preventorid FROM hys.hpe_preventorexclusivo WHERE pe_idempresa = em_id AND pe_fechabaja IS NULL) pe_preventorid, '+
                              '   (SELECT pex.it_nombre FROM hys.hpe_preventorexclusivo, art.pit_firmantes pex WHERE pe_idempresa = em_id AND pe_fechabaja IS NULL'+
                              '    AND pex.it_id = pe_preventorid) prevex, co_vigenciahasta, co_pramet '+ sSelectIncidencia+
                              ' FROM afi.adc_domiciliocontrato ahdl, art.ctb_tablas tbsector, ' +
                              '      afi.aem_empresa aem, afi.age_grupoeconomico age, ' +
                              '      afi.aco_contrato aco, hys.hst_subtipo, hys.hte_tipoempresaprev, hys.hco_cuitoperativo hco, ART.PIT_FIRMANTES pit ' +sFrom+
                              ' WHERE te_id = hco.co_idtipoempresaprev ' +
                              '   AND CO_IDPREVENTORNOTIF = pit.IT_ID(+) '+
                              '   AND hco.co_idempresa = em_id ' +
                              '   AND aem.em_idgrupoeconomico = ge_id(+) '+
                              '   AND tbsector.tb_clave = ''SECT'' ' +
                              '   AND tbsector.tb_codigo = em_sector ' +
                              '   AND st_id(+) = hco.co_idsubtipo ' +
                              '   AND em_id = aco.co_idempresa ' +
                              '   AND aco.co_contrato = art.get_vultcontrato(em_cuit) ' +
                              '   AND ahdl.dc_contrato(+) = aco.co_contrato ' +
                              '   AND hco.co_idempresa = :idempresa ' +
                              '   AND ahdl.dc_tipo(+) = ''L'' ' + sWhere +
                              ' ORDER BY hco.co_cuit, hco.co_operativo desc, hco.co_rigehasta desc, hco.co_fechabaja desc ');
  end;
end;

procedure TfrmGestionEmpresasPreventor.sdqDatosEmpresaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if (ModoForm = mfEmpresas) then
  begin
    sdqConsulta.close;
    sdqConsulta.ParamByName('idempresa').Value := DataSet.fieldbyname('co_idempresa').AsInteger;
    sdqConsulta.Open;
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbLimpiarEmpresaClick(
  Sender: TObject);
begin
  inherited;
  tbLimpiarClick(Sender);
end;

procedure TfrmGestionEmpresasPreventor.tbSalirEmpresaClick(
  Sender: TObject);
begin
  inherited;
  tbSalirClick(Sender);
end;

procedure TfrmGestionEmpresasPreventor.tbRefrescarEmpresaClick(
  Sender: TObject);
begin
  inherited;
  //ArmarQueryEmpresa;
  //tbRefrescarClick(Sender);
  if (ModoForm = mfEstablecimientos) and (dbgEmpresa.Visible) then
  begin
    sdqDatosEmpresa.close;
    sdqDatosEmpresa.ParamByName('idempresa').Value := sdqconsulta.fieldbyname('ep_idempresa').AsInteger;
    sdqDatosEmpresa.Open;
  end
  else begin
    if (ModoForm = mfEmpresas) then
    begin
      ArmarQueryEmpresa;
      tbRefrescarClick(Sender);
    end;
  end;
end;

procedure TfrmGestionEmpresasPreventor.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    Grid.Canvas.FillRect(Rect);
    Check := 0;

    if SelectedList.IndexOf(sdqConsulta.FieldByName('EP_ID').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(Grid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmGestionEmpresasPreventor.GridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (FModoForm = mfEstablecimientos) then
  if Key = VK_SPACE then
    GridCellClick(Grid.ColumnByField['SELECTED']);
end;

procedure TfrmGestionEmpresasPreventor.dbgEmpresaCellClick(
  Column: TColumn);
var
  i : integer;
begin
  inherited;
  if (Column.Field.FieldName = 'SELECTED') then
  begin
    i:= SelectedListEmpresas.IndexOf(sdqDatosEmpresa.fieldbyname('CO_CUIT').AsString);
    if (i = -1) then
      SelectedListEmpresas.AddObject(sdqDatosEmpresa.fieldbyname('CO_CUIT').AsString, sdqDatosEmpresa.GetBookmark)
    else begin
      {$IFDEF VER150}
      sdqDatosEmpresa.FreeBookmark(TBookmark(SelectedListEmpresas.Objects[i]));
      {$ENDIF}
      SelectedListEmpresas.Delete(i);
    end;
    Column.Grid.Refresh;
  end;
end;

procedure TfrmGestionEmpresasPreventor.dbgEmpresaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SELECTED' then
  begin
    dbgEmpresa.Canvas.FillRect(Rect);
    Check := 0;

    if SelectedListEmpresas.IndexOf(sdqDatosEmpresa.FieldByName('CO_CUIT').AsString) > -1 then
      Check := DFCS_CHECKED;

    R := Rect;
    InflateRect(R, -2, -2); //Disminuye el tamaño del CheckBox
    DrawFrameControl(dbgEmpresa.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfrmGestionEmpresasPreventor.dbgEmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not (FModoForm = mfEstablecimientos) then
  if Key = VK_SPACE then
    dbgEmpresaCellClick(dbgEmpresa.ColumnByField['SELECTED']);
end;

procedure TfrmGestionEmpresasPreventor.tbImprimirEmpresaClick(
  Sender: TObject);
begin
  tbImprimirEmpresa.Enabled := False;
  try
     if PrintDialogEmpresa.Execute then
     try
       QueryPrintEmpresa.SetGridColumns(dbgEmpresa, True, [baDetail, baHeader, baTotal, baSubTotal]);
       QueryPrintEmpresa.Print;
     finally
       QueryPrintEmpresa.Fields.Clear;
     end;
  finally
    tbImprimirEmpresa.Enabled := True;
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbExportarEmpresaClick(
  Sender: TObject);
begin
  tbExportarEmpresa.Enabled := False;
  try
    ExportDialogEmpresa.Fields.Assign(dbgEmpresa.Columns);
    ExportDialogEmpresa.Execute;
  finally
    tbExportarEmpresa.Enabled := True;
  end;

end;

procedure TfrmGestionEmpresasPreventor.tbMarcarTodasClick(Sender: TObject);
var
  i: integer;
begin
  sdqDatosEmpresa.DisableControls;
  sdqDatosEmpresa.AfterScroll := nil;
  try
    sdqDatosEmpresa.First;
    while not sdqDatosEmpresa.Eof do
    begin
      i:= SelectedListEmpresas.IndexOf(sdqDatosEmpresa.fieldbyname('CO_CUIT').AsString);
      if (i = -1) then
        SelectedListEmpresas.AddObject(sdqDatosEmpresa.fieldbyname('CO_CUIT').AsString, sdqDatosEmpresa.GetBookmark);
      sdqDatosEmpresa.Next;
    end;
  finally
    sdqDatosEmpresa.AfterScroll := sdqDatosEmpresaAfterScroll;
    sdqDatosEmpresa.EnableControls;
    dbgEmpresa.Refresh;
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbBorrarMarcasClick(
  Sender: TObject);
{$IFDEF VER150}
var
  i: integer;
{$ENDIF}
begin
{$IFDEF VER150}
  for i:=0 to SelectedListEmpresas.Count - 1 do
    sdqDatosEmpresa.FreeBookmark(TBookmark(SelectedListEmpresas.Objects[i]));
{$ENDIF}
  SelectedListEmpresas.Clear;
  dbgEmpresa.Refresh;
end;

procedure TfrmGestionEmpresasPreventor.btnAceptarCambioprevClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  If HacerCommit then
    BeginTrans(true);
  try
    for i:=0 to SelectedListEmpresas.Count-1 do
    begin
      dbgEmpresa.DataSource.DataSet.GotoBookmark(SelectedListEmpresas.Objects[i]);
      ActualizarPreventorReferente(SelectedListEmpresas.Strings[i], fraCambioPrevRef.Codigo);
    end;
    If HacerCommit then
      CommitTrans(true);
    SelectedListEmpresas.Clear;
    fpCambioPreventorRef.ModalResult := mrOk;
//    sdqDatosEmpresa.Refresh;
//    sdqDatosEmpresaAfterScroll( dbgEmpresa.DataSource.DataSet);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al cambiar preventores Referentes.');
    end;
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbCambiarPrevRefClick(
  Sender: TObject);
begin
    Verificar(SelectedListEmpresas.Count = 0, dbgEmpresa, 'No hay nada seleccionado.');
    fraCambioPrevRef.Clear;
    fpCambioPreventorRef.ShowModal;
end;


procedure TfrmGestionEmpresasPreventor.setHacerCommit(
  const Value: Boolean);
begin
  FHacerCommit := Value;
end;

procedure TfrmGestionEmpresasPreventor.tbPreventorPerfilClick(Sender: TObject);
begin
  try
    Abrir(TfrmSeleccionPreventor, frmSeleccionPreventor, tmvModal, nil);

    if frmSeleccionPreventor.FCodigo <> '' then
      fraPreventor.Codigo := frmSeleccionPreventor.FCodigo;
  finally
    frmSeleccionPreventor.Free;
  end;
end;

procedure TfrmGestionEmpresasPreventor.dbgEmpresaGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  inherited;
  if not sdqDatosEmpresa.fieldbyname('PE_PREVENTORID').IsNull then
    Background := clMoneyGreen;
  if not sdqDatosEmpresa.fieldbyname('co_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmGestionEmpresasPreventor.ActualizarPreventorExclusivo(aIdEmpresa,
  aIdPreventor: Integer);
begin
  if (aIdPreventor = 0 )
       and ExisteSql(
          ' SELECT 1 FROM hys.hpe_preventorexclusivo '+
          ' WHERE pe_idempresa = '+ SqlValue(aIdEmpresa)+
          '   AND pe_fechabaja IS NULL ') then
      EjecutarSqlST(
        ' UPDATE hys.hpe_preventorexclusivo '+
        '    SET pe_fechabaja = SYSDATE, '+
        '        pe_usubaja = '+SqlValue(Sesion.UserID)+
        '  WHERE pe_fechabaja IS NULL AND pe_idempresa = '+SqlValue(aIdEmpresa))
    else
      if not ExisteSql(' SELECT 1 FROM hys.hpe_preventorexclusivo '+
          ' WHERE pe_idempresa = '+ SqlValue(aIdEmpresa)+
          '   AND pe_fechabaja IS NULL '+
          '   AND pe_preventorid = '+SqlValue(aIdPreventor)) and (aIdPreventor <> 0) then
      BEGIN
        EjecutarSqlST(
        ' UPDATE hys.hpe_preventorexclusivo '+
        '    SET pe_fechabaja = SYSDATE, '+
        '        pe_usubaja = '+SqlValue(Sesion.UserID)+
        '  WHERE pe_fechabaja IS NULL AND pe_idempresa = '+SqlValue(aIdEmpresa));
        EjecutarSqlST(
          ' INSERT INTO hys.hpe_preventorexclusivo '+
          '             (pe_id, pe_preventorid, pe_fechaalta, pe_usualta, pe_idempresa '+
          '             ) '+
          '      VALUES (hys.seq_hpe_id.NEXTVAL,'+SqlValue(aIdPreventor)+
          ', SYSDATE,'+ SqlValue(Sesion.UserID)+', '+SqlValue(aIdEmpresa)+
          '  )');
      end;
end;

procedure TfrmGestionEmpresasPreventor.tbCambiarPrevExclusivoClick(
  Sender: TObject);
begin
  Verificar(SelectedListEmpresas.Count = 0, dbgEmpresa, 'No hay nada seleccionado.');
  fraCambioPrevExclusivo.Clear;
  fpCambioPrevExclusivo.ShowModal;
end;

procedure TfrmGestionEmpresasPreventor.btnAceptarCambioprevExclusivoClick(
  Sender: TObject);
var
  i: integer;
begin
  inherited;
  If HacerCommit then
    BeginTrans(true);
  try
    for i:=0 to SelectedListEmpresas.Count-1 do
    begin
      dbgEmpresa.DataSource.DataSet.GotoBookmark(SelectedListEmpresas.Objects[i]);
      ActualizarPreventorExclusivo(Grid.DataSource.DataSet.fieldbyname('ep_idempresa').AsInteger, fraCambioPrevExclusivo.Value);
    end;
    If HacerCommit then
      CommitTrans(true);
    SelectedListEmpresas.Clear;
    fpCambioPrevExclusivo.ModalResult := mrOk;
//    sdqDatosEmpresa.Refresh;
//    sdqDatosEmpresaAfterScroll( dbgEmpresa.DataSource.DataSet);
  except
    on E: Exception do
    begin
      Rollback(true);
      ErrorMsg(E, 'Error al cambiar preventores Exclusivos.');
    end;
  end;
end;

procedure TfrmGestionEmpresasPreventor.cbListarCoordinadosClick(
  Sender: TObject);
begin
  if Trim(fraPreventorFiltro.cmbDescripcion.Text) = '' then
  begin
    cbListarCoordinados.Checked := false;
    Verificar(1=1,cbListarCoordinados, 'Debe Seleccionar un Preventor');
  end;
end;

procedure TfrmGestionEmpresasPreventor.cmbVerPreventorExclusivoClick(
  Sender: TObject);
begin
  if (Trim(fraPreventorFiltro.cmbDescripcion.Text) = '') and (lstPrev.Count = 0) then
  begin
    cmbVerPreventorExclusivo.Checked := false;
    Verificar(1=1,cmbVerPreventorExclusivo, 'Debe Seleccionar un Preventor');
  end;
end;

procedure TfrmGestionEmpresasPreventor.cmbPreventorUltVisitaClick(
  Sender: TObject);
begin
  if (Trim(fraPreventorFiltro.cmbDescripcion.Text) = '') and (lstPrev.Count = 0) then
  begin
    cmbPreventorUltVisita.Checked := false;
    Verificar(1=1,cmbPreventorUltVisita, 'Debe Seleccionar un Preventor');
  end;
end;

procedure TfrmGestionEmpresasPreventor.cbReferenteExclusivoClick(
  Sender: TObject);
begin
  fraPreventorExclusivo.Codigo := fraPreventorRef.Codigo;
end;

procedure TfrmGestionEmpresasPreventor.cbReferenteNotifClick(
  Sender: TObject);
begin
  if not fraPreventorNotif.ReadOnly then
    fraPreventorNotif.Codigo := fraPreventorRef.Codigo;
end;

procedure TfrmGestionEmpresasPreventor.tbDomicilioMiRegistroClick(
  Sender: TObject);
begin
  Abrir( TfrmDomicilioMiRegistro, frmDomicilioMiRegistro, tmvMDIChild, nil);
end;

procedure TfrmGestionEmpresasPreventor.tbExclusionEmpresasClick(
  Sender: TObject);
begin
  Abrir( TfrmSolicitudExclusionEmpresa, frmSolicitudExclusionEmpresa, tmvMDIChild, nil);
end;

procedure TfrmGestionEmpresasPreventor.chkEstabConCPPrevClick(
  Sender: TObject);
begin
  inherited;
  if not fraPreventorFiltro.IsSelected then
  begin
    chkEstabConCPPrev.Checked := false;
    Verificar(1=1,chkEstabConCPPrev, 'Debe Seleccionar un Preventor');
  end;
end;

procedure TfrmGestionEmpresasPreventor.chkSinVisitaClick(Sender: TObject);
begin
  inherited;
  edVisitaDesde.Clear;
  edVisitaHasta.Clear;
  edVisitaDesde.Enabled := not chkSinVisita.Checked;
  edVisitaHasta.Enabled := not chkSinVisita.Checked;
end;

procedure TfrmGestionEmpresasPreventor.fraDepartcmbDescripcionChange(Sender:
    TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
end;

procedure TfrmGestionEmpresasPreventor.fraDepartcmbDescripcionExit(Sender:
    TObject);
begin
  if Trim(fraDepart.cmbDescripcion.Text) = '' then
    fraDepart.Clear;
end;

procedure TfrmGestionEmpresasPreventor.tbAddPrevClick(Sender: TObject);
begin
  if fraPreventorFiltro.IsSelected then
  begin
    lstPrev.Items.AddObject(fraPreventorFiltro.Descripcion, TObject(fraPreventorFiltro.Value));
    fraPreventorFiltro.Clear;
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbDeletePrevClick(Sender: TObject);
begin
  if fraPreventorFiltro.IsSelected then
  begin
    lstPrev.Items.Delete(lstPrev.Items.IndexOfObject(TObject(fraPreventorFiltro.Value)));
    fraPreventorFiltro.Clear;
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbViewPrevClick(Sender: TObject);
begin
  fpPreventoresSel.ShowModal;
end;

procedure TfrmGestionEmpresasPreventor.LlenarEstabTipoEventual(Marca: boolean);
var
  SDQuery: TSDQuery;
  i: integer;
  idxSelec: array of integer;
begin

  {guarda la selcción previa}
  for i := 0 to cmbEstabTiposEventual.Items.Count -1 do
    if cmbEstabTiposEventual.Checked[i] then
    begin
      SetLength(idxSelec, Length(idxSelec) + 1);
      idxSelec[Length(idxSelec) -1] := integer(cmbEstabTiposEventual.Items.Objects[i]);
    end;

  {rellena el combo}
  try
    SDQuery := TSDQuery.Create(Self);
    SDQuery.DatabaseName := 'dbPrincipal';
    SDQuery.SQL.Text := 'select * from hys.pev_estabeventual order by ev_descripcion';
    SDQuery.Open;
    cmbEstabTiposEventual.Items.Clear;
    for i := 0 to SDQuery.RecordCount -1 do
    begin
      cmbEstabTiposEventual.Items.AddObject(
          iif(SDQuery.FieldByName('EV_ASIGNABLE').AsString  = 'S', 'A', 'N') + ' - ' +
          SDQuery.FieldByName('EV_DESCRIPCION').AsString,
          TObject(SDQuery.FieldByName('EV_ID').AsInteger)
      );

      if Marca then
        if SDQuery.FieldByName('EV_ASIGNABLE').AsString = 'S' then
          cmbEstabTiposEventual.Checked[i] := True;

      SDQuery.Next;
    end;

    {agrega la selcción previa}
    for i := 0 to Length(idxSelec) -1 do
    cmbEstabTiposEventual.Checked[
        cmbEstabTiposEventual.Items.IndexOfObject(TObject(idxSelec[i]))] := True;

  finally
    idxSelec := nil;
    SDQuery.Close;
    FreeAndNil(SDQuery);
  end;

end;

procedure TfrmGestionEmpresasPreventor.tbCambioTipoPrevClick(
  Sender: TObject);
var
  i: integer;
begin
  inherited;
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  if  fpCambioTipoPrevencion.ShowModal = mrok then
  begin
    sdqConsulta.DisableControls;
    sdqConsulta.AfterScroll := nil;

    If HacerCommit then
      BeginTrans(true);

    try
      for i:=0 to SelectedList.Count-1 do
      begin
        Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
        if Grid.DataSource.DataSet.fieldbyname('te_cargamanual').AsString = 'S' then
        begin
          EjecutarSqlST(' update hys.hep_estabporpreventor ' +
                        ' set EP_IDTIPOESTABPREV = ' + SqlValue(fraTipoEmpresaCambioTipoPrev.Value) +
                        ' where ep_id = ' + SqlValue(Grid.DataSource.DataSet.fieldbyname('ep_id').AsInteger)
                       );
        end;
      end;
      If HacerCommit then
        CommitTrans(true);
      SelectedList.Clear;
      sdqConsulta.Refresh;
      sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
      sdqConsultaAfterScroll(grid.DataSource.DataSet);
    except
      on E: Exception do
      begin
        Rollback(true);
        ErrorMsg(E, 'Error al aplicar Cambios Tipo Prevencion ');
      end;
    end;
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmGestionEmpresasPreventor.ReasignarTareas(Cuit : String; Estableci : Integer;idpreventor : Integer);
var
  idempresa: integer;
  codigoprev, codigocor, nombreprev : String;
begin
  with GetQuery(
    ' SELECT prev.it_codigo prevcod, cor.it_codigo corcod, prev.it_nombre nombreprev '+
    '   FROM art.pit_firmantes prev, art.pit_firmantes cor '+
    '  WHERE prev.it_idsupervisor = cor.it_id(+) '+
    '    AND prev.it_id = '+SqlValue(idpreventor)) do
  try
    codigoprev := FieldByName('prevcod').AsString;
    codigocor  := FieldByName('corcod').AsString;
    nombreprev := FieldByName('nombreprev').AsString;
  finally
    Free;
  end;
  idempresa := ValorSql(
    ' SELECT em_id '+
    '   FROM afi.aem_empresa '+
    '  WHERE em_cuit = '+SqlValue(Cuit));
  EjecutarSqlST(
    ' UPDATE hys.htp_tareasprevencion '+
    '    SET tp_itcodigo = '+SqlValue(codigoprev)+','+
    '        tp_itcoordinador = '+SqlValue(codigocor)+','+
    '        tp_nombrepreventor = '+SqlValue(nombreprev)+
    '  WHERE tp_cuit = '+SqlValue(Cuit)+
    '    AND tp_establecimiento = '+SqlValue(Estableci));

(*
  EjecutarSqlST(
    ' UPDATE hys.hts_tareahys '+
    '    SET ts_idpreventor = '+SqlInteger(idpreventor,True)+
    '  WHERE ts_idempresa = '+SqlValue(idempresa)+
    '    AND ts_estableci = '+SqlValue(Estableci)+
    '    AND ts_idvisitapreventor IS NULL '+
    '    AND ts_idproceso = art.hys_plan.get_idproceso(''M'', trunc(art.actualdate, ''MM''), LAST_DAY(art.actualdate)) '+
    '    AND ts_fechahasta >= art.actualdate ');
*)

  EjecutarSqlST(
    ' UPDATE hys.hps_planhys '+
    '    SET ps_idpreventor = '+SqlInteger(idpreventor,True)+','+
    '        ps_idmotivoreasignacion = '+SqlValue(fraMotivoReasignacion.Value)+','+
    '        ps_observaciones = '+SqlValue(edObservacionReasignacion.Text)+','+
    '        ps_usureasignacion = '+SqlValue(Sesion.LoginName)+','+
    '        ps_fechareasignacion = sysdate '+
    '  WHERE ps_idempresa = '+SqlValue(idempresa)+
    '    AND ps_estableci = '+SqlValue(Estableci)+
    '    AND ps_estado = ''N'' '+
    '    AND ps_idproceso = hys_plan.get_idproceso(''M'', trunc(art.actualdate, ''MM''), last_day(art.actualdate)) '+
    '    AND ps_fechahasta >= art.actualdate ');

end;

procedure TfrmGestionEmpresasPreventor.BorrarReasignacion;
begin
  fraMotivoReasignacion.Clear;
  edObservacionReasignacion.Clear;
end;

procedure TfrmGestionEmpresasPreventor.Button4Click(Sender: TObject);
begin
  inherited;
  Verificar(not fraMotivoReasignacion.IsSelected,fraMotivoReasignacion,'Debe seleccionar Motivo.');
  fpMotivoReasignacion.ModalResult := mrOk;
end;

procedure TfrmGestionEmpresasPreventor.tbCambioPeriodicidadClick(
  Sender: TObject);
var
  i: integer;
begin
  edCantVisitasMulti.Clear;
  Verificar(SelectedList.Count = 0, Grid, 'No hay nada seleccionado.');
  if (fpFrecuenciaVisita.ShowModal = mrOk) then
  begin
    sdqConsulta.DisableControls;
    sdqConsulta.AfterScroll := nil;
    If HacerCommit then
      BeginTrans(true);
    try
      for i:=0 to SelectedList.Count-1 do
      begin
        Grid.DataSource.DataSet.GotoBookmark(SelectedList.Objects[i]);
        GuardarCantVisitasPersonalizada(Grid.DataSource.DataSet.fieldbyname('ep_idempresa').AsInteger,
                                        Grid.DataSource.DataSet.fieldbyname('ep_estableci').AsInteger,
                                        edCantVisitasMulti.Value);
      end;
      if HacerCommit then
        CommitTrans(true);
      SelectedList.Clear;
      sdqConsulta.Refresh;
      sdqConsulta.AfterScroll := sdqConsultaAfterScroll;
      sdqConsultaAfterScroll(grid.DataSource.DataSet);
    except
      on E: Exception do
      begin
        Rollback(true);
        ErrorMsg(E, 'Error al aplicar cambio de periodicidad.');
      end;
    end;
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmGestionEmpresasPreventor.GuardarCantVisitasPersonalizada(
  aIdEmpresa, aEstableci, aCantVisitas: Integer);
begin
  if aCantVisitas <> 0 then
  begin
    if ExisteSqlEx('SELECT 1 FROM HYS.HFV_FRECUENCIAVISITA WHERE FV_IDEMPRESA = :IDEMPRESA AND FV_ESTABLECI = :ESTAB', [aIdEmpresa, aEstableci]) then
    begin
      EjecutarSqlSTEx(' UPDATE HYS.HFV_FRECUENCIAVISITA ' +
                    ' SET FV_CANTVISITAS = :CANT, ' +
                    '     FV_FECHABAJA = NULL,    ' +
                    '     FV_USUBAJA = NULL       ' +
                    ' WHERE FV_IDEMPRESA = :IDEMPRESA ' +
                    '    AND FV_ESTABLECI = :ESTAB ', [aCantVisitas, aIdEmpresa, aEstableci]);
    end
    else begin
      EjecutarSqlSTEx(' INSERT INTO HYS.HFV_FRECUENCIAVISITA(fv_id, fv_idempresa, fv_estableci, fv_cantvisitas, fv_fechaalta, fv_usualta) ' +
                    ' VALUES (HYS.SEQ_HFV_FRECUENCIAVISITA_ID.NEXTVAL, :idempresa, :estableci, :cant, SYSDATE, :usualta) ', [aIdEmpresa, aEstableci, aCantVisitas, Sesion.LoginName]);
    end;
  end
  else begin
    EjecutarSqlSTEx(' UPDATE HYS.HFV_FRECUENCIAVISITA ' +
                    ' SET FV_FECHABAJA = SYSDATE,    ' +
                    '     FV_USUBAJA = :USUARIO       ' +
                    ' WHERE FV_IDEMPRESA = :IDEMPRESA ' +
                    '    AND FV_ESTABLECI = :ESTAB ', [Sesion.LoginName, aIdEmpresa, aEstableci]);
  end;

end;

procedure TfrmGestionEmpresasPreventor.tbConsSiniestrosClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmConsultaSiniestros, frmConsultaSiniestros, tmvMDIChild, nil);
  if not sdqConsulta.IsEmpty then
  begin
    frmConsultaSiniestros.FijarFechaOperativo := true;
    frmConsultaSiniestros.Cuit := sdqConsultaEP_CUIT.Value;
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbEstimacionVisitasAnualClick(
  Sender: TObject);
begin
  inherited;
  if not sdqConsulta.IsEmpty then
  begin
    with TfrmConsultaVisitasAnual.Create(Self) do
    try
      FormStyle := fsNormal;
      Visible := false;
      PreventorId := self.sdqConsulta.FieldbyName('it_id').AsInteger;
      if not self.sdqConsulta.FieldbyName('it_id').IsNull then tbRefrescarClick(self);
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmGestionEmpresasPreventor.tbEstimacionVisitasAnualPrevClick(
  Sender: TObject);
begin
  inherited;
  if not sdqConsulta.IsEmpty then
  begin
    with TfrmConsultaVisitasAnual.Create(Self) do
    try
      FormStyle := fsNormal;
      Visible := false;
      PreventorId := fraPreventor.Value;
      VerPanelSeleccion := true;
      if fraPreventor.IsSelected then tbRefrescarClick(self);
      if ShowModal = mrOk then
        fraPreventor.Value := PreventorId;
    finally
      Free;
    end;
  end;
end;

end.




