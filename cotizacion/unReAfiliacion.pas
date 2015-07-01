unit unReAfiliacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, unFraCentroRegional, unfraSucursal, unFraStaticCodigoDescripcion, unFraCanal, unFraEntidades, unfraVendedores, unFraCodigoDescripcion, Mask,
  PatternEdit, IntEdit, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, ComboEditor, CheckCombo, DBCheckCombo, unFraCodDesc, ToolEdit,
  DateComboBox, unfraUsuarios, unFraStaticCTB_TABLAS, CurrEdit, unfraStaticActividad, Buttons, PeriodoPicker, unFraUsuario, Menus, JvExControls,
  JvComponent, JvButton, JvTransparentButton, DbFuncs, Variants, unCotizacion, DBCtrls, RxToolEdit, RxCurrEdit, RxPlacemnt, AdvToolBtn, unfraImportUART,
  JvExExtCtrls, JvBevel, JvScheduledEvents;

type
  TfrmReAfiliacion = class(TfrmCustomGridABM)
    tbSuspension: TToolButton;
    tbAsignarUsuario: TToolButton;
    tbNotificar: TToolButton;
    GroupBox1: TGroupBox;
    lbSolicitud: TLabel;
    fraEmpresaBusqueda: TfraEmpresa;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    edNumeroSolicitudBusqueda: TIntEdit;
    GroupBox3: TGroupBox;
    fraUsuarioSolicitoBusqueda: TfraUsuarios;
    gbOrigen: TGroupBox;
    Label22: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    fraVendedorBusqueda: TfraVendedores;
    fraEntidadBusqueda: TfraEntidades;
    fraSucursalBusqueda: TfraSucursal;
    fraCentroRegBusqueda: TfraCentroRegional;
    GroupBox4: TGroupBox;
    fraUsuarioAsignadoBusqueda: TfraUsuarios;
    gbEstado: TGroupBox;
    cbEstadoBusqueda: TDBCheckCombo;
    sdqEstado: TSDQuery;
    dsEstado: TDataSource;
    GroupBox10: TGroupBox;
    fraMotivoSolicitudBusqueda: TfraCodDesc;
    GroupBox5: TGroupBox;
    fraMotivoRespuestaBusqueda: TfraCodDesc;
    gbFechaSolicitud: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edFechaSolicitudDesde: TDateComboBox;
    edFechaSolicitudHasta: TDateComboBox;
    scroll: TScrollBox;
    pnComercial: TPanel;
    gbSolicitud: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    edNumeroSolicitud: TIntEdit;
    edFechaSolicitud: TDateEdit;
    GroupBox7: TGroupBox;
    fraMotivoSolicitud: TfraCodDesc;
    Label17: TLabel;
    Label9: TLabel;
    edCorreo: TEdit;
    lblContacto: TLabel;
    Label10: TLabel;
    edTelefono: TEdit;
    fraEstado: TfraStaticCTB_TABLAS;
    Label7: TLabel;
    fraMotivoBaja: TfraStaticCTB_TABLAS;
    Label16: TLabel;
    edFechaBaja: TDateComboBox;
    Label15: TLabel;
    edContacto: TEdit;
    Bevel1: TBevel;
    Label40: TLabel;
    lbHolding: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label41: TLabel;
    fraVendedor: TfraVendedores;
    fraEntidad: TfraEntidades;
    fraCanal: TfraCanal;
    fraSucursal: TfraSucursal;
    fraCentroReg: TfraCentroRegional;
    fraHolding: TfraCodDesc;
    Label8: TLabel;
    edComision: TCurrencyEdit;
    fraEjecutivo: TfraCodDesc;
    Label11: TLabel;
    fraSector: TfraStaticCTB_TABLAS;
    lbSector: TLabel;
    gbCiiuActual: TGroupBox;
    Label45: TLabel;
    Label48: TLabel;
    edTrabajadores: TIntEdit;
    fraCiiu1: TfraStaticActividad;
    fraCiiu2: TfraStaticActividad;
    fraCiiu3: TfraStaticActividad;
    edMasaSalarial: TCurrencyEdit;
    Label13: TLabel;
    gbCiiuNuevo: TGroupBox;
    edActividadReal: TEdit;
    gbDatosCompetencia: TGroupBox;
    Label29: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label50: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    edCompetenciaDECostoVariable: TCurrencyEdit;
    edCompetenciaDECostoFijo: TCurrencyEdit;
    edResultadoMensualTrabajador: TCurrencyEdit;
    edCompetenciaF931CostoVariable: TCurrencyEdit;
    edCompetenciaF931CostoFijo: TCurrencyEdit;
    edSumaFija: TCurrencyEdit;
    rbFormulario931: TRadioButton;
    rbDatosEmpresa: TRadioButton;
    rbSinDatos: TRadioButton;
    rbPagoTotalMensual: TRadioButton;
    edCompetenciaPTMCostoFijo: TCurrencyEdit;
    edPorcVariable: TCurrencyEdit;
    btnCalcular: TBitBtn;
    edCPTMA: TCurrencyEdit;
    gbObservaciones: TGroupBox;
    Label21: TLabel;
    memoObservaciones: TMemo;
    pnTecnica: TPanel;
    gbValoresCotizados: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    edCostoXTrabajadorCotizado: TCurrencyEdit;
    edCostoFijoCotizado: TCurrencyEdit;
    edPorcentajeVariableCotizado: TCurrencyEdit;
    fraMotivoRespuesta: TfraCodDesc;
    Label39: TLabel;
    Label42: TLabel;
    memoObservacionesTecnica: TMemo;
    edPeriodo: TPeriodoPicker;
    Label44: TLabel;
    fraUsuarioSolicitud: TfraUsuarios;
    fpAsignarUsuario: TFormPanel;
    fpCambiarUsuarioAutorizacion: TFormPanel;
    Bevel3: TBevel;
    Label23: TLabel;
    btnAceptarAsignacion: TButton;
    btnCancelar2: TButton;
    fraAsignarUsuario: TfraUsuarios;
    fpSuspender: TFormPanel;
    Label46: TLabel;
    memoObservacionesSuspension: TMemo;
    Bevel4: TBevel;
    btnAceptarSuspencion: TButton;
    btnCancelar3: TButton;
    btnAdministracionArchivos: TBitBtn;
    fpCancelar: TFormPanel;
    Label47: TLabel;
    Label49: TLabel;
    Bevel5: TBevel;
    fraMotivoCancelacion: TfraCodDesc;
    memoObservacionesCancelacion: TMemo;
    btnAceptaCancelacion: TButton;
    btnObservacionesCancelacion: TButton;
    pnCiiuNuevo: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    edTrabajadoresTotalNuevo: TIntEdit;
    fraCiiuNuevo1: TfraStaticActividad;
    fraCiiuNuevo2: TfraStaticActividad;
    fraCiiuNuevo3: TfraStaticActividad;
    edTrabajadoresNuevo1: TIntEdit;
    edTrabajadoresNuevo2: TIntEdit;
    edTrabajadoresNuevo3: TIntEdit;
    edMasaSalarialNuevo1: TCurrencyEdit;
    edMasaSalarialNuevo2: TCurrencyEdit;
    edMasaSalarialNuevo3: TCurrencyEdit;
    edMasaSalarialTotalNuevo: TCurrencyEdit;
    Label20: TLabel;
    StaticText1: TStaticText;
    fraEmpresa: TfraEmpresa;
    popupImprimir: TPopupMenu;
    mnuGrilla: TMenuItem;
    mnuSolicitud: TMenuItem;
    Label12: TLabel;
    edResultadoMensualTrabajadorActual: TCurrencyEdit;
    ToolButton1: TToolButton;
    tbSumatoria: TToolButton;
    btnImprimir: TBitBtn;
    gbEstadoSolicitud: TGroupBox;
    lbEstadoActual: TLabel;
    Label52: TLabel;
    Label33: TLabel;
    edDeuda: TCurrencyEdit;
    tbNoSeCotiza: TToolButton;
    fpNoSeCotiza: TFormPanel;
    Bevel2: TBevel;
    Label54: TLabel;
    btnAceptar3: TButton;
    btnCancelar4: TButton;
    memoObservacionesNoSeCotiza: TMemo;
    gbMotivoCancelacion: TGroupBox;
    fraMotivoNoSeCotiza: TfraStaticCTB_TABLAS;
    gbValoresTarifario: TGroupBox;
    Label56: TLabel;
    Label57: TLabel;
    Label60: TLabel;
    edCostoFinalTarifario: TCurrencyEdit;
    edSumaFijaTarifario: TCurrencyEdit;
    edPorcentajeVariableTarifario: TCurrencyEdit;
    tbClonar: TToolButton;
    gbPedidoACobranzasOLegales: TGroupBox;
    fpPedidoACobranzasOLegales: TFormPanel;
    lbDeuda: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Bevel6: TBevel;
    edDeuda2: TCurrencyEdit;
    memoObservaciones2: TMemo;
    btnAceptar2: TBitBtn;
    btnCancelar5: TBitBtn;
    fraGestor: TfraCodigoDescripcion;
    fraUsuarioAutorizo: TfraUsuarios;
    Label61: TLabel;
    lbObservacionesCobranzasOLegales: TLabel;
    lbAutorizacionCobranzasOLegales: TLabel;
    edAutorizo: TEdit;
    memoObservacionesCobranzaOLegales: TMemo;
    gbValoresTarifarioSSN: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    edCostoFinalTarifarioSSN: TCurrencyEdit;
    edSumaFijaTarifarioSSN: TCurrencyEdit;
    edPorcentajeVariableTarifarioSSN: TCurrencyEdit;
    Label31: TLabel;
    edCostoFijoUltimoContrato: TCurrencyEdit;
    Label32: TLabel;
    edPorcentajeVariableUltimoContrato: TCurrencyEdit;
    Label43: TLabel;
    edValoresPendientesAcreditar: TCurrencyEdit;
    edVigenciaTarifa: TDateEdit;
    Label70: TLabel;
    Label14: TLabel;
    edDeudaAl: TDateEdit;
    fpPedidoAutorizacion: TFormPanel;
    Label72: TLabel;
    Bevel7: TBevel;
    memoObservaciones3: TMemo;
    btnAceptar4: TBitBtn;
    btnCancelar6: TBitBtn;
    tbAutorizar: TToolButton;
    fpAutorizar: TFormPanel;
    Label63: TLabel;
    Bevel8: TBevel;
    memoObservaciones4: TMemo;
    btnAceptar5: TButton;
    btnCancelar7: TButton;
    rgAprobar: TRadioGroup;
    Label71: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    edConcurso: TEdit;
    edQuiebra: TEdit;
    gbPedidoAComercial: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    fraUsuarioAutorizoComercial: TfraUsuarios;
    edAutorizoComercial: TEdit;
    memoObservacionesComercial: TMemo;
    tbEstadoCuenta: TToolButton;
    Label79: TLabel;
    edCantidadContratosRescindidosFaltaPago: TIntEdit;
    tbRedireccionSolicitudPermiso: TToolButton;
    fpRedireccionarSolicitudPermiso: TFormPanel;
    Label80: TLabel;
    Label81: TLabel;
    memoObservaciones5: TMemo;
    fraDestinatario: TfraCodDesc;
    Bevel9: TBevel;
    btnAceptar6: TBitBtn;
    btnCancelar8: TBitBtn;
    fraGestor2: TfraCodigoDescripcion;
    Label62: TLabel;
    edComisionCotizada: TCurrencyEdit;
    Label66: TLabel;
    ToolbarBCRA: TToolBar;
    tbImportBCRA: TToolButton;
    fraStatusBCRA: TfraCodDesc;
    Label82: TLabel;
    edFechaAutorizoCobranzasOLegales: TDateEdit;
    Label83: TLabel;
    edFechaAutorizoComercial: TDateEdit;
    tbCerrarRevision: TToolButton;
    fpCerrarRevision: TFormPanel;
    GroupBox8: TGroupBox;
    memoObservacionesCierre: TMemo;
    rgEstado: TRadioGroup;
    btnAceptar7: TButton;
    btnCancelar9: TButton;
    GroupBox6: TGroupBox;
    chkUltimaSolicitud: TCheckBox;
    GroupBox9: TGroupBox;
    edNumeroSolicitudAfiliacion: TIntEdit;
    GroupBox12: TGroupBox;
    Label84: TLabel;
    Label85: TLabel;
    edFechaAprobacionAutomaticaDesde: TDateComboBox;
    edFechaAprobacionAutomaticaHasta: TDateComboBox;
    gbTarifaPendiente: TGroupBox;
    Label86: TLabel;
    edVigenciaTarifaPendiente: TDateEdit;
    Label87: TLabel;
    edSumaFijaPendiente: TCurrencyEdit;
    Label88: TLabel;
    edPorcentajeVariablePendiente: TCurrencyEdit;
    Label89: TLabel;
    edVigenciaIncumplimientoPendiente: TDateEdit;
    fraMotivoTarifaPendiente: TfraStaticCTB_TABLAS;
    Label90: TLabel;
    Label91: TLabel;
    edFechaVigenciaDesdeContrato: TDateComboBox;
    fpEstado: TFormPanel;
    Bevel10: TBevel;
    btnAceptar8: TButton;
    btnCancelar10: TButton;
    Panel1: TPanel;
    Label92: TLabel;
    GroupBox13: TGroupBox;
    rbEnPreparacion: TRadioButton;
    rbPendienteAutorizar: TRadioButton;
    rbAutorizada: TRadioButton;
    Label51: TLabel;
    fraCanalBusqueda: TDBCheckCombo;
    sdqCanal: TSDQuery;
    dsCanal: TDataSource;
    GroupBox18: TGroupBox;
    checkEntidadesEnTramite: TCheckBox;
    btnUltimaComisionContrato: TButton;
    tbAutorizarNotificar: TToolButton;
    tbCambiarUsuarioAutorizacion: TToolButton;
    tbColores: TToolButton;
    fpHintColores: TFormPanel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Label27: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Bevel11: TBevel;
    Shape8: TShape;
    Label96: TLabel;
    Shape9: TShape;
    Label97: TLabel;
    Shape10: TShape;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label109: TLabel;
    Label112: TLabel;
    Label116: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    btnCerrar: TButton;
    Shape1: TShape;
    Label98: TLabel;
    Label103: TLabel;
    Shape2: TShape;
    checkEnTramite: TCheckBox;
    tbBuscarEmails: TToolButton;
    lbStatusSRTLink: TLabel;
    Label104: TLabel;
    edCostoFijo: TCurrencyEdit;
    fraStatusSrt: TfraCodDesc;
    fraUsuario: TfraCodDesc;
    GroupBox14: TGroupBox;
    fraUsuarioAutorizacionBusqueda: TfraCodDesc;
    sdspValidarRevision: TSDStoredProc;
    fraDelegacionBusqueda: TDBCheckCombo;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    GroupBox11: TGroupBox;
    chkConTarifaCargada: TCheckBox;
    Label108: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label115: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    ToolBar1: TToolBar;
    tbImportSRT: TToolButton;
    Label99: TLabel;
    fraArtAnterior: TfraStaticCodigoDescripcion;
    fpEventos: TFormPanel;
    gridEventos: TArtDBGrid;
    tbNuevo2: TToolButton;
    tbModificar2: TToolButton;
    tbDarBaja: TToolButton;
    tbGuardar: TToolButton;
    tbCancelar: TToolButton;
    tbOrdenar2: TToolButton;
    tbImprimir2: TToolButton;
    edFechaEvento: TDateComboBox;
    memoDescripcionEvento: TMemo;
    btnCerrar2: TButton;
    panelEventos: TPanel;
    tbEventos: TToolButton;
    sdqEventos: TSDQuery;
    sdEventos: TSortDialog;
    dsEventos: TDataSource;
    tbCambiarUsuarioAutorizacion2: TToolButton;
    tbCambioEstado: TToolButton;
    fpCambioEstado: TFormPanel;
    Label119: TLabel;
    sdqEstado2: TSDQuery;
    dsEstado2: TDataSource;
    btnAceptar9: TButton;
    Bevel12: TBevel;
    fraNuevoEstado: TfraCodDesc;
    GroupBox15: TGroupBox;
    Label120: TLabel;
    Label121: TLabel;
    edFechaRespuestaComercialDesde: TDateComboBox;
    edFechaRespuestaComercialHasta: TDateComboBox;
    gbFinalVarios: TGroupBox;
    Label155: TLabel;
    chkIltEmpleador: TCheckBox;
    chkFrecuencuaSiniestral: TCheckBox;
    chkJuicios: TCheckBox;
    chkPrecioCompetencia: TCheckBox;
    chkIlp: TCheckBox;
    edIndiceCombinado: TCurrencyEdit;
    chkTarifaUnificada: TCheckBox;
    tbTarifa: TToolButton;
    Label122: TLabel;
    edAcpo: TCurrencyEdit;
    GroupBox16: TGroupBox;
    Label123: TLabel;
    Label124: TLabel;
    edFechaConfeccionDesde: TDateComboBox;
    edFechaConfeccionHasta: TDateComboBox;
    GroupBox17: TGroupBox;
    Label125: TLabel;
    Label126: TLabel;
    edFechaSuspensionDesde: TDateComboBox;
    edFechaSuspensionHasta: TDateComboBox;
    Label127: TLabel;
    fraCiiu1DigitoNuevo: TfraStaticActividad;
    Label128: TLabel;
    fraCiiu1Digito: TfraStaticActividad;
    gbLimiteSSN: TGroupBox;
    Label130: TLabel;
    Label131: TLabel;
    edLimiteSSNMaximo: TCurrencyEdit;
    edLimiteSSNMinimo: TCurrencyEdit;
    Label129: TLabel;
    edPeriodoNomina: TPeriodoPicker;
    gbInformacionComplementaria: TGroupBox;
    btnTarifador2014: TBitBtn;
    GroupBox20: TGroupBox;
    fraHoldingBusqueda: TfraCodDesc;
    popupEndoso: TPopupMenu;
    PedidoEndoso1: TMenuItem;
    VerEndoso1: TMenuItem;
    pnlEndoso: TPanel;
    tbFiltrarEndosos: TAdvToolButton;
    tbEndoso: TAdvToolButton;
    ToolButton2: TToolButton;
    tbRecuperarDatos: TButton;
    memoInformacionComplementaria: TMemo;
    fraImportUART: TfraImportUART;
    edMasaDivididaTrabajador: TCurrencyEdit;
    JvBevel1: TJvBevel;
    JvBevel2: TJvBevel;
    lbPendientes: TLabel;
    schRefreshPendientes: TJvScheduledEvents;
    lbTipoRegimen: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure scrollMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure btnCalcularClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure SumarTrabajadores(Sender: TObject);
    procedure SumarMasaSalarial(Sender: TObject);
    procedure CambiarMotivoSolicitud(Sender: TObject);
    procedure tbAsignarUsuarioClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure btnAceptarAsignacionClick(Sender: TObject);
    procedure tbSuspensionClick(Sender: TObject);
    procedure fpSuspenderKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelar3Click(Sender: TObject);
    procedure btnAceptarSuspencionClick(Sender: TObject);
    procedure fpSuspenderShow(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnObservacionesCancelacionClick(Sender: TObject);
    procedure fpCancelarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptaCancelacionClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbNotificarClick(Sender: TObject);
    procedure ClickDatosTarifa(Sender: TObject);
    procedure CambiaSector(Sender: TObject);
    procedure CambiaVendedor(Sender: TObject);
    procedure CambiarSucursal(Sender: TObject);
    procedure CambiarSucursalBusqueda(Sender: TObject);
    procedure CambiarCanal(Sender: TObject);
    procedure CambiarCentroReg(Sender: TObject);
    procedure CambiarCentroRegBusqueda(Sender: TObject);
    procedure fraEntidadBusquedaExit(Sender: TObject);
    procedure fraEntidadExit(Sender: TObject);
    procedure fraCanalExit(Sender: TObject);
    procedure fraCanalBusquedaExit(Sender: TObject);
    procedure CambiarEmpresa(Sender: TObject);
    procedure CambiarActividad(Sender: TObject);
    procedure CambiarActividadVieja(Sender: TObject);
    procedure mnuGrillaClick(Sender: TObject);
    procedure mnuSolicitudClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure btnImprimirClick(Sender: TObject);
    procedure edCompetenciaDECostoFijoExit(Sender: TObject);
    procedure edCompetenciaDECostoVariableExit(Sender: TObject);
    procedure tbNoSeCotizaClick(Sender: TObject);
    procedure btnCancelar4Click(Sender: TObject);
    procedure fpNoSeCotizaBeforeShow(Sender: TObject);
    procedure btnAceptar3Click(Sender: TObject);
    procedure tbClonarClick(Sender: TObject);
    procedure btnCancelar5Click(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure gbCiiuNuevoExit(Sender: TObject);
    procedure btnCancelar6Click(Sender: TObject);
    procedure btnAceptar4Click(Sender: TObject);
    procedure fpPedidoAutorizacionBeforeShow(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure btnCancelar7Click(Sender: TObject);
    procedure fpAutorizarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fpAutorizarBeforeShow(Sender: TObject);
    procedure btnAceptar5Click(Sender: TObject);
    procedure tbAutorizarClick(Sender: TObject);
    procedure fpCancelarBeforeShow(Sender: TObject);
    procedure tbEstadoCuentaClick(Sender: TObject);
    procedure fraMotivoSolicitudExit(Sender: TObject);
    procedure tbRedireccionSolicitudPermisoClick(Sender: TObject);
    procedure btnAceptar6Click(Sender: TObject);
    procedure btnCancelar8Click(Sender: TObject);
    procedure fpRedireccionarSolicitudPermisoBeforeShow(Sender: TObject);
    procedure edCostoFijoCotizadoChange(Sender: TObject);
    procedure edCostoXTrabajadorCotizadoChange(Sender: TObject);
    procedure edPorcentajeVariableCotizadoChange(Sender: TObject);
    procedure Label66Click(Sender: TObject);
    procedure ImportarDatosBCRA(Sender: TObject);
    procedure tbCerrarRevisionClick(Sender: TObject);
    procedure btnCancelar9Click(Sender: TObject);
    procedure btnAceptar7Click(Sender: TObject);
    procedure fpCerrarRevisionBeforeShow(Sender: TObject);
    procedure btnAdministracionArchivosClick(Sender: TObject);
    procedure btnAceptar8Click(Sender: TObject);
    procedure btnCancelar10Click(Sender: TObject);
    procedure fpEstadoBeforeShow(Sender: TObject);
    procedure fraMotivoRespuestaPropiedadesChange(Sender: TObject);
    procedure CambiaEntidadBusqueda(Sender: TObject);
    procedure CambiaEntidad(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure btnUltimaComisionContratoClick(Sender: TObject);
    procedure tbAutorizarNotificarClick(Sender: TObject);
    procedure tbCambiarUsuarioAutorizacionClick(Sender: TObject);
    procedure fpHintColoresKeyPress(Sender: TObject; var Key: Char);
    procedure tbColoresClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure tbBuscarEmailsClick(Sender: TObject);
    procedure lbStatusSRTLinkClick(Sender: TObject);
    procedure fpCambiarUsuarioAutorizacionShow(Sender: TObject);
    procedure btnCancelar41Click(Sender: TObject);
    procedure btnAceptar1Click(Sender: TObject);
    //procedure tbImportSRTClick(Sender: TObject);
    procedure CambiaStatusSrt(Sender: TObject);
    procedure gridEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbEventosClick(Sender: TObject);
    procedure tbNuevo2Click(Sender: TObject);
    procedure tbModificar2Click(Sender: TObject);
    procedure tbDarBajaClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbOrdenar2Click(Sender: TObject);
    procedure tbImprimir2Click(Sender: TObject);
    procedure gridEventosDblClick(Sender: TObject);
    procedure btnCerrar2Click(Sender: TObject);
    procedure fpEventosShow(Sender: TObject);
    procedure sdqEventosAfterScroll(DataSet: TDataSet);
    procedure sdqEventosAfterOpen(DataSet: TDataSet);
    procedure tbCambiarUsuarioAutorizacion2Click(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fraEmpresaExit(Sender: TObject);
    procedure tbCambioEstadoClick(Sender: TObject);
    procedure btnAceptar9Click(Sender: TObject);
    procedure fpCambioEstadoBeforeShow(Sender: TObject);
    procedure tbTarifaClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure Label122Click(Sender: TObject);
    procedure gbCiiuActualExit(Sender: TObject);
    procedure btnTarifador2014Click(Sender: TObject);
    procedure PedidoEndoso1Click(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbFiltrarEndososClick(Sender: TObject);
    procedure tbRecuperarDatosClick(Sender: TObject);
    procedure CalcularMasaDivididaTrabajador(Sender: TObject);
    procedure chkEndososClick(Sender: TObject);
    procedure schRefreshPendientesEvents0Execute(Sender: TJvEventCollectionItem; const IsSnoozeEvent: Boolean);
    procedure CambiarLimitesSSN(Sender: TObject);
  private
    FCiiuNuevo1Anterior: Integer;
    FCiiuNuevo2Anterior: Integer;
    FCiiuNuevo3Anterior: Integer;
    FComisionCalculada: Boolean;
    FComisionCotizadaAnterior: Extended;
    FEstadoNuevo: String;
    FPorcentajeVariableAnterior: Extended;
    FPrimaPorCapitaAnterior: Extended;
    FSector: Integer;
    FSumaFijaAnterior: Extended;
    FValidacionCotizacion: TRecValidacion;

    function CountEndosoPendientes: Integer;
//    function DescomponerEmails(const aEmails: String): String;
    function EnviarEmailHtml(const aIdCanal, aIdEntidad: Integer; var aFileName: String): Boolean;
    function GetComision(const aVendedor: Integer; const aSector: String; const aCantTrabajadores, aIdHolding: Integer): Extended;
    function GetCostoFijo(const aContrato: Integer): Extended;
    function GetEstadoFechaAnterior(const aCuit: String; var aEstadoAnterior: String; var aFecha: TDateTime; const aId: Integer = -1): Boolean;
    function GetEstadoSolicitudAnterior(const aCuit: String; const aIdActual: Integer): String;
    function GetStatusBCRA(const aCuit: String): Integer;
    function HayFiltrosAplicados: Boolean;
    function IsComercial: Boolean;
    function IsJefe: Boolean;
    function IsTecnica: Boolean;
    function RecuperarJuiciosArt: String;
    function RecuperarJuiciosUart: String;
    function RecuperarObservacionesCuit: String;
    function RecuperarSeclosArt: String;
    function RecuperarSeclosUart: String;
    function RecuperarSiniestros: String;
    function SolicitarPermiso(const aSolicitudId: Integer): Boolean;
    function SolicitarPermisoACobranza(const aSolicitudId, aContrato: Integer; const aDeuda: Real; const aCommit: Boolean = False): Boolean;
    function ValidarNotificacionAComercial: Boolean;
    function ValidarRevision(const aIdRevision: Integer): TRecValidacion;
    function ValoresPendientes(const aContrato: Integer): String;

    procedure ActivarABMEventos(const aEstado: Boolean);
    procedure ActualizarConsulta;
    procedure CalcularArchivos;
    procedure CalcularCPTMA;
    procedure CalcularLimiteSSN;
    procedure CalcularTarifarioSSN;
    procedure CalcularTotales;
    procedure Cancelar(const aMotivoCancelacion: Integer = -1; const aObservaciones: String = '');
    procedure CerrarRevision(aEstado: String);
    procedure GetEstadosDeCuenta;
    procedure GetUsuarioAutorizacion(var aUsuarioAutorizacion, aPuestoAutorizacion: String);
    procedure LimpiarDatosSoloLectura;
    procedure NotificarAComercial(const aMostrarConfirmacion: Boolean = True; const aRefrescarGrilla: Boolean = True);
    procedure OcultarCampos(const aOcultar: Boolean; aControls: Array of TControl);
    procedure RecalcularComision;
    procedure SavePhotoEstadoCuenta(const aId, aContrato: Integer);
    procedure SendAlerts(const aSolicitudId: Integer);
    procedure VerEndoso(Sender: TObject);
    procedure VerificarTarifarioSSN;

  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    procedure RefreshData; override;
  public
    FCalcularValoresCotizados: Boolean;

  	procedure SetArea;
  end;

const
  MAXCOLS = 18;

var
  CamposSuma: Array[0..MAXCOLS] of String = ('DEUDA', 'EMPLEADOS', 'MASASALARIAL', 'PRIMAMENSUAL', 'PRIMAMENSUALCOMPETENCIA', 'PRIMAMENSUALCOTIZADA',
                                             'PRIMAPERSONA', 'SR_AUTOCOSTOFINAL', 'SR_AUTOSUMAFIJA', 'SR_COSTOFIJO', 'SR_COSTOFIJOCOTIZADO',
                                             'SR_COSTOFINALCOMPETENCIA', 'SR_COSTOFINALCOTIZADO', 'SR_TOTALFIJOCOMPETENCIA',
                                             'SR_VALORESPENDIENTESACREDIT', 'SR_NROSOLICITUD', 'TIENESOLICITUDAFILIACION', 'MASASALARIAL', 'EMPLEADOS');
  frmReAfiliacion: TfrmReAfiliacion;
  Operadores: Array[0..MAXCOLS] of TOperador = (oSinOperador, oSinOperador, oSinOperador, oSinOperador, oSinOperador, oSinOperador, oSinOperador,
                                                oSinOperador, oSinOperador, oSinOperador, oSinOperador, oSinOperador, oSinOperador, oSinOperador,
                                                oSinOperador, oSinOperador, oDistinto, oSinOperador, oSinOperador);
  TiposOperacion: Array[0..MAXCOLS] of TOperacion = (oSum, oSum, oSum, oSum, oSum, oSum, oSum, oSum, oSum, oSum, oSum, oSum, oSum, oSum, oSum, oCount, oCount, oSum, oSum);
  TotalConsulta: Array of Extended;
  Values: Array[0..MAXCOLS] of Variant;

implementation

uses
  unSesion, CustomDlgs, unDmPrincipal, unFiltros, AnsiSql, CUIT, VCLExtra, General, SqlFuncs, ShellAPI, unPrincipal, unArt, ArtMail, unQRRevisionPrecio,
  unCustomConsulta, Strfuncs, ArchFuncs, unQRNotificacionClienteRevisionPrecios, unCobranzas, unImpresionEstadoDeCuenta, unEstadoCuenta, unEspera,
  unImportFromBCRA, unEnvioMail, unMoldeEnvioMail, unAdministracionArchivosRevisionPrecio, unContratoVendedor, unElementosEnviados, unQREventos,
  DateTimeFuncs, unCuadroTarifarioContrato, DateUtils, unPedidoEndoso;

{$R *.DFM}

function TfrmReAfiliacion.DoABM: Boolean;
var
  aFechaNotificacionAnterior: TDateTime;
  aQuery: TSDQuery;
  iContrato: Integer;
  iId: Integer;
  iIdHistoricoContrato: Integer;
  iIdHistoricoEmpresa: Integer;
  iIdResumenCobranza: Integer;
  iIndex: Integer;
  sEstadoAnterior: String;
  sPuestoAutorizacion: String;
  sSql: String;
  sUsuarioAutorizacion: String;
begin
  iContrato := -1;
  iId := -1;

  // Antes de guardar los datos, actualizo el tarifario de la SSN..
  CalcularTarifarioSSN;

  BeginTrans;

  try
    Sql.Clear;
    Sql.TableName := 'asr_solicitudreafiliacion';

    if ModoABM = maAlta then
    begin
      sSql :=
        'SELECT MAX(hc_id)' +
         ' FROM ahc_historicocontrato' +
        ' WHERE hc_contrato = :contrato';
      iIdHistoricoContrato := ValorSqlIntegerEx(sSql, [fraEmpresa.Contrato]);

      sSql :=
        'SELECT rc_id' +
         ' FROM aco_contrato' +
         ' JOIN zrc_resumencobranza ON rc_contrato = co_contrato' +
          ' AND rc_periodo = co_ultimoperiodomayorcero' +
        ' WHERE co_contrato = :contrato';
      iIdResumenCobranza := ValorSqlIntegerEx(sSql, [fraEmpresa.Contrato]);

      sSql :=
        'SELECT MAX(hm_id)' +
         ' FROM ahm_historicoempresa' +
        ' WHERE hm_cuit = :p1';
      iIdHistoricoEmpresa := ValorSqlIntegerEx(sSql, [fraEmpresa.CUIT]);

      iId := ValorSqlInteger('SELECT afi.seq_asr_id.NEXTVAL FROM DUAL', 0);
      Sql.SqlType := stInsert;

      Sql.Fields.Add('sr_costofijo',                edCostoFijoUltimoContrato.Value);
      Sql.Fields.Add('sr_deuda',                    edDeuda.Value);
      Sql.Fields.Add('sr_fechaalta',                SQL_DATETIME, False);
      Sql.Fields.Add('sr_idartanterior',            fraArtAnterior.Value);
      Sql.Fields.Add('sr_idhistoricocontrato',      iIdHistoricoContrato);
      Sql.Fields.Add('sr_idhistoricoempresa',       iIdHistoricoEmpresa);
      Sql.Fields.Add('sr_idresumencobranza',        iIdResumenCobranza);
      Sql.Fields.Add('sr_motivotarifapendiente',    fraMotivoTarifaPendiente.Value);
      Sql.Fields.Add('sr_porcentajevariable',       edPorcentajeVariableUltimoContrato.Value);
      Sql.Fields.Add('sr_porcvariablependiente',    edPorcentajeVariablePendiente.Value);
      Sql.Fields.Add('sr_sumafijapendiente',        edSumaFijaPendiente.Value);
      Sql.Fields.Add('sr_usualta',                  Sesion.UserID);
      Sql.Fields.Add('sr_valorespendientesacredit', edValoresPendientesAcreditar.Value);
      Sql.Fields.Add('sr_vigenciaincpendiente',     edVigenciaIncumplimientoPendiente.Date);
      Sql.Fields.Add('sr_vigenciatarifa',           edVigenciaTarifa.Date);
      Sql.Fields.Add('sr_vigenciatarifapendiente',  edVigenciaTarifaPendiente.Date);
    end
    else
    begin
      iId := sdqConsulta.FieldByName('sr_id').AsInteger;
      Sql.SqlType := stUpdate;
      Sql.Fields.Add('sr_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('sr_usumodif',   Sesion.UserID);

      if IsComercial then
      begin
        sSql :=
          'SELECT 1' +
           ' FROM asr_solicitudreafiliacion' +
          ' WHERE sr_origenweb = ''T''' +
            ' AND sr_id = :id';
        if ExisteSqlEx(sSql, [iId]) then
          Sql.Fields.Add('sr_usualta', Sesion.UserID);
      end;
    end;

    Sql.PrimaryKey.Add('sr_id', iId);

    if IsComercial then
    begin
      iContrato := fraEmpresa.Contrato;

      if (GetComision(fraVendedor.Value, fraSector.Value, IIF((edTrabajadoresTotalNuevo.Value = 0), edTrabajadores.Value, edTrabajadores.Value), fraHolding.Value) = -1) and
         (fraVendedor.Value > 0) then   // Si no tiene comisión y tiene vendedor cargado..
      begin
        Sql.Fields.Add('sr_comision',        exNull);
        Sql.Fields.Add('sr_estadosolicitud', EC_DATOS_FALTANTES);
      end
      else
      begin
        Sql.Fields.Add('sr_comision',                edComision.Value, dtNumber);
        Sql.Fields.Add('sr_estadosolicitud',         EC_PEND_COTIZ);
        Sql.Fields.Add('sr_fechaderivacionatecnica', SQL_DATETIME, False);
      end;

      Sql.Fields.Add('sr_acpo',              edAcpo.Value, dtNumber);
      Sql.Fields.Add('sr_idmotivosolicitud', fraMotivoSolicitud.Value, True);
      Sql.Fields.Add('sr_cuit',              fraEmpresa.CUIT);
      Sql.Fields.Add('sr_contrato',          iContrato, True);
      Sql.Fields.Add('sr_email',             edCorreo.Text);
      Sql.Fields.Add('sr_contacto',          edContacto.Text);
      Sql.Fields.Add('sr_telefono',          edTelefono.Text);
      Sql.Fields.Add('sr_idcanal',           fraCanal.Value, True);
      Sql.Fields.Add('sr_identidad',         fraEntidad.Value, True);
      Sql.Fields.Add('sr_idsucursal',        fraSucursal.Value, True);
      Sql.Fields.Add('sr_idcentroregional',  fraCentroReg.Value, True);
      Sql.Fields.Add('sr_idvendedor',        fraVendedor.Value, True);
      Sql.Fields.Add('sr_idholding',         fraHolding.Value, True);
      Sql.Fields.Add('sr_idstatusbcra',      fraStatusBCRA.Value, True);
      Sql.Fields.Add('sr_idstatussrt',       fraStatusSrt.Value, True);

      Sql.Fields.Add('sr_idactividad1',      fraCiiuNuevo1.Value, True);
      Sql.Fields.Add('sr_idactividad2',      fraCiiuNuevo2.Value, True);
      Sql.Fields.Add('sr_idactividad3',      fraCiiuNuevo3.Value, True);
      Sql.Fields.Add('sr_canttrabajadores',  edTrabajadoresTotalNuevo.Value, True);
      Sql.Fields.Add('sr_canttrabajadores1', edTrabajadoresNuevo1.Value, True);
      Sql.Fields.Add('sr_canttrabajadores2', edTrabajadoresNuevo2.Value, True);
      Sql.Fields.Add('sr_canttrabajadores3', edTrabajadoresNuevo3.Value, True);
      Sql.Fields.Add('sr_masasalarial',      edMasaSalarialTotalNuevo.Value, dtNumber);
      Sql.Fields.Add('sr_masasalarial1',     edMasaSalarialNuevo1.Value, dtNumber);
      Sql.Fields.Add('sr_masasalarial2',     edMasaSalarialNuevo2.Value, dtNumber);
      Sql.Fields.Add('sr_masasalarial3',     edMasaSalarialNuevo3.Value, dtNumber);
      Sql.Fields.Add('sr_actividadreal',     edActividadReal.Text);
      Sql.Fields.Add('sr_periodonomina',     edPeriodoNomina.Periodo.Valor);

      if edSumaFijaTarifarioSSN.Value = 0 then    // Si no hay valores cargados calculo antes de grabar..
        CalcularTarifarioSSN;

      //Sql.Fields.Add('sr_sumafijatarifariossn',      edSumaFijaTarifarioSSN.Value, dtNumber);
      //Sql.Fields.Add('sr_porcvariabletarifariossn',  edPorcentajeVariableTarifarioSSN.Value, dtNumber);
      //Sql.Fields.Add('sr_costofinaltarifariossn',    edCostoFinalTarifarioSSN.Value, dtNumber);
      Sql.Fields.Add('sr_tipodatotarifacompetencia', String(IIF(rbPagoTotalMensual.Checked, 'A',
                                                     IIF(rbDatosEmpresa.Checked, 'N',
                                                     IIF(rbFormulario931.Checked, 'S', '')))));
      Sql.Fields.Add('sr_costofijocompetencia',      Extended(IIF(rbPagoTotalMensual.Checked, edCompetenciaPTMCostoFijo.Value,
                                                     IIF(rbDatosEmpresa.Checked, edCompetenciaDECostoFijo.Value,
                                                     IIF(rbFormulario931.Checked, edCompetenciaF931CostoFijo.Value, 0)))), dtNumber);
      Sql.Fields.Add('sr_costovariablecompetencia',  Extended(IIF(rbDatosEmpresa.Checked, edCompetenciaDECostoVariable.Value,
                                                     IIF(rbFormulario931.Checked, edCompetenciaF931CostoVariable.Value, 0))), dtNumber);
      Sql.Fields.Add('sr_costofinalcompetencia',     edResultadoMensualTrabajador.Value, dtNumber);
      Sql.Fields.Add('sr_totalfijocompetencia',      edSumaFija.Value, dtNumber);
      Sql.Fields.Add('sr_totalvariablecompetencia',  edPorcVariable.Value, dtNumber);
      Sql.Fields.Add('sr_cptma',                     edCPTMA.Value, dtNumber);
      Sql.Fields.Add('sr_comisioncotizada',          edComision.Value, dtNumber);

      // Se agrega el guión para saber si estan usando la última versión del exe, por los error que cuentan
      // en el ticket 23545, cuando este resuelto, borrar guión..
      Sql.Fields.Add('sr_observaciones',             '- ' + memoObservaciones.Lines.Text);

      if FValidacionCotizacion.NumeroError = 15 then
      begin
        iIndex := Sql.Fields.FieldByName['sr_estadosolicitud'].Index;
        Sql.Fields.Delete(iIndex);
        Sql.Fields.Add('sr_estadosolicitud', EC_CON_ERRORES);
      end;
    end;

    if IsTecnica then
    begin
      Sql.Fields.Add('sr_idactividad1',              fraCiiuNuevo1.Value, True);
      Sql.Fields.Add('sr_idactividad2',              fraCiiuNuevo2.Value, True);
      Sql.Fields.Add('sr_idactividad3',              fraCiiuNuevo3.Value, True);
      Sql.Fields.Add('sr_canttrabajadores',          edTrabajadoresTotalNuevo.Value, True);
      Sql.Fields.Add('sr_canttrabajadores1',         edTrabajadoresNuevo1.Value, True);
      Sql.Fields.Add('sr_canttrabajadores2',         edTrabajadoresNuevo2.Value, True);
      Sql.Fields.Add('sr_canttrabajadores3',         edTrabajadoresNuevo3.Value, True);
      Sql.Fields.Add('sr_estadosolicitud',           FEstadoNuevo);
      Sql.Fields.Add('sr_idstatusbcra',              fraStatusBCRA.Value, True);
      Sql.Fields.Add('sr_idstatussrt',               fraStatusSrt.Value, True);
      Sql.Fields.Add('sr_masasalarial',              edMasaSalarialTotalNuevo.Value, dtNumber);
      Sql.Fields.Add('sr_masasalarial1',             edMasaSalarialNuevo1.Value, dtNumber);
      Sql.Fields.Add('sr_masasalarial2',             edMasaSalarialNuevo2.Value, dtNumber);
      Sql.Fields.Add('sr_masasalarial3',             edMasaSalarialNuevo3.Value, dtNumber);
      Sql.Fields.Add('sr_actividadreal',             edActividadReal.Text);
      Sql.Fields.Add('sr_periodonomina',             edPeriodoNomina.Periodo.Valor);
      Sql.Fields.Add('sr_infocomplementaria',        memoInformacionComplementaria.Lines.Text);
      Sql.Fields.Add('sr_checkilt',                  String(IIF(chkIltEmpleador.Checked, 'S', 'N')));
      Sql.Fields.Add('sr_checkfrecuenciasiniestral', String(IIF(chkFrecuencuaSiniestral.Checked, 'S', 'N')));
      Sql.Fields.Add('sr_checkjuicios',              String(IIF(chkJuicios.Checked, 'S', 'N')));
      Sql.Fields.Add('sr_checkilp',                  String(IIF(chkIlp.Checked, 'S', 'N')));
      Sql.Fields.Add('sr_checkpreciocompetencia',    String(IIF(chkPrecioCompetencia.Checked, 'S', 'N')));
      Sql.Fields.Add('sr_checktarifaunificada',      String(IIF(chkTarifaUnificada.Checked, 'S', 'N')));
      Sql.Fields.Add('sr_indicecombinado',           edIndiceCombinado.Value, dtNumber);


      if (fraMotivoRespuesta.Value = 21) or (fraMotivoRespuesta.Value = 27) or (fraMotivoRespuesta.Value = 30) or
         (fraMotivoRespuesta.Value = 39) or (fraMotivoRespuesta.Value = 103) then
      begin
        // Según ticket 57198, si el motivo de respuesta es "Se mantiene las alícuotas" se trae el valor del tarifario..
        sSql :=
          'SELECT   sr_costofijo costofijo,' +
                  ' (sr_costofijo - 0.6) * rc_empleados * 12 + (rc_masasalarial / DECODE(NVL(rc_empleados, 1), 0, 1) /(CASE' +
                                                                                                                     ' WHEN rc_periodonomina IN(6, 12) THEN 1.5' +
                                                                                                                     ' ELSE 1' +
                                                                                                                      ' END)) * sr_porcentajevariable / 100 * rc_empleados * 13 cuotaanualestimada,' +
                  ' sr_porcentajevariable porcentajevariable,' +
                  ' DECODE(NVL(rc_empleados, 0), 0, 0, (((rc_masasalarial / DECODE(NVL(rc_empleados, 1), 0, 1) * sr_porcentajevariable / 100) + sr_costofijo))) primapersona,' +
                  ' sr_vigenciatarifa vigenciatarifa' +
             ' FROM asr_solicitudreafiliacion, zrc_resumencobranza_ext' +
            ' WHERE sr_idresumencobranza = rc_id(+)' +
              ' AND sr_contrato = :contrato' +
              ' AND sr_id <= :id' +
         ' ORDER BY sr_id DESC';
        aQuery := GetQueryEx(sSql, [fraEmpresa.Contrato, iId]);
        try
          Sql.Fields.Add('sr_costofinalcotizado',         aQuery.FieldByName('primapersona').AsFloat, 2, True);
          Sql.Fields.Add('sr_costofijocotizado',          aQuery.FieldByName('costofijo').AsFloat, 2, True);
          Sql.Fields.Add('sr_porcentajevariablecotizado', aQuery.FieldByName('porcentajevariable').AsFloat, 4, True);
        finally
          aQuery.Free;
        end;
      end
      else
      begin
        Sql.Fields.Add('sr_costofinalcotizado',         edCostoXTrabajadorCotizado.Value, 2, True);
        Sql.Fields.Add('sr_costofijocotizado',          edCostoFijoCotizado.Value, 2, True);
        Sql.Fields.Add('sr_porcentajevariablecotizado', edPorcentajeVariableCotizado.Value, 4, True);
      end;

      Sql.Fields.Add('sr_tipodatotarifacompetencia', String(IIF(rbPagoTotalMensual.Checked, 'A',
                                                     IIF(rbDatosEmpresa.Checked, 'N',
                                                     IIF(rbFormulario931.Checked, 'S', '')))));
      Sql.Fields.Add('sr_costofijocompetencia',      Extended(IIF(rbPagoTotalMensual.Checked, edCompetenciaPTMCostoFijo.Value,
                                                     IIF(rbDatosEmpresa.Checked, edCompetenciaDECostoFijo.Value,
                                                     IIF(rbFormulario931.Checked, edCompetenciaF931CostoFijo.Value, 0)))), dtNumber);
      Sql.Fields.Add('sr_costovariablecompetencia',  Extended(IIF(rbDatosEmpresa.Checked, edCompetenciaDECostoVariable.Value,
                                                     IIF(rbFormulario931.Checked, edCompetenciaF931CostoVariable.Value, 0))), dtNumber);
      Sql.Fields.Add('sr_costofinalcompetencia',     edResultadoMensualTrabajador.Value, dtNumber);
      Sql.Fields.Add('sr_totalfijocompetencia',      edSumaFija.Value, dtNumber);
      Sql.Fields.Add('sr_totalvariablecompetencia',  edPorcVariable.Value, dtNumber);
      Sql.Fields.Add('sr_cptma',                     edCPTMA.Value, dtNumber);

      Sql.Fields.Add('sr_comisioncotizada',     edComisionCotizada.Value, 4, True);
      Sql.Fields.Add('sr_idmotivocotizacion',   fraMotivoRespuesta.Value, True);

      // Se agrega el guión para saber si estan usando la última versión del exe, por los error que cuentan
      // en el ticket 23545, cuando este resuelto, borrar guión..
      Sql.Fields.Add('sr_observacionestecnica', '- ' + memoObservacionesTecnica.Lines.Text);

      if FEstadoNuevo = EC_PEND_AUTORIZ then
      begin
        GetUsuarioAutorizacion(sUsuarioAutorizacion, sPuestoAutorizacion);
        Sql.Fields.Add('sr_usuarioautorizacion', sUsuarioAutorizacion);
        Sql.Fields.Add('sr_puestoautorizacion', sPuestoAutorizacion);

        Sql.Fields.Add('sr_fechaconfeccion', SQL_DATETIME, False);
        Sql.Fields.Add('sr_usuarioconfeccion', Sesion.UserID);

        Sql.Fields.Add('sr_fechamodifautorizacion', exNull);
        Sql.Fields.Add('sr_usumodifautorizacion', exNull);
      end;

      if (edPorcentajeVariableCotizado.Value <> FPorcentajeVariableAnterior) or
         (edCostoXTrabajadorCotizado.Value <> FPrimaPorCapitaAnterior) or
         (edCostoFijoCotizado.Value <> FSumaFijaAnterior) or
         (fraMotivoRespuesta.Value = 103) then
      begin
        Sql.Fields.Add('sr_fechatarifa',   SQL_DATETIME, False);
        Sql.Fields.Add('sr_usuariotarifa', Sesion.UserID);
      end;
    end;

    Sql.Fields.Add('sr_sumafijatarifariossn',      edSumaFijaTarifarioSSN.Value, dtNumber);
    Sql.Fields.Add('sr_porcvariabletarifariossn',  edPorcentajeVariableTarifarioSSN.Value, dtNumber);
    Sql.Fields.Add('sr_costofinaltarifariossn',    edCostoFinalTarifarioSSN.Value, dtNumber);

    EjecutarSqlST(Sql.Sql);

    Result := True;

    if IsComercial then
    begin
      if (GetEstadoFechaAnterior(fraEmpresa.CUIT, sEstadoAnterior, aFechaNotificacionAnterior, iId)) and
         (((sEstadoAnterior = EC_NOTIF_COMERCIAL) or (sEstadoAnterior = EC_NOTIF_CLIENTE) or
           (sEstadoAnterior = EC_NO_SE_COTIZA) or (sEstadoAnterior = EC_CANCELADA_DEUDOR) or
           (sEstadoAnterior = EC_CANCELADA_NO_AUTORIZADA)) and ((DBDate - aFechaNotificacionAnterior) <= 30)) and (not IsJefe) then
        Result := SolicitarPermiso(iId)
      else if (fraMotivoSolicitud.Codigo = '6') or (fraMotivoSolicitud.Codigo = '6.1') then
      begin
        if (edDeuda.Value > 0) or (ValoresPendientes(fraEmpresa.Contrato) <> '') then
          Result := SolicitarPermisoACobranza(iId, fraEmpresa.Contrato, edDeuda.Value)
        else
          SavePhotoEstadoCuenta(iId, iContrato);
      end
      else if (fraMotivoSolicitud.Codigo = '1.1') or (fraMotivoSolicitud.Codigo = '1.2') or
              (fraMotivoSolicitud.Codigo = '1.3') or (fraMotivoSolicitud.Codigo = '2.1') or
              (fraMotivoSolicitud.Codigo = '2.2') or
              (GetEstadoSolicitudAnterior(fraEmpresa.CUIT, iId) = EC_NO_SE_COTIZA) then
        Result := SolicitarPermiso(iId);
    end;

    if Result then
      CommitTrans
    else
    begin
      RollBack;
      fpAbm.Close;
    end;
  except
    on E:Exception do
    begin
      Result := False;
      ErrorMsg(E, 'Error al guardar los datos.');
      RollBack;
    end;
  end;

  if (ModoABM = maAlta) and (Result) then
    SendAlerts(iId);

{  if (Result) and (IsTecnica) and (fraEstadoNuevo.Codigo = EC_NOTIF_COMERCIAL) then
    if ValidarNotificacionAComercial then
      NotificarAComercial(False);}
end;

{function TfrmReAfiliacion.GetArt(const aArtWeb: String): Integer;
var
  sArt: String;
  sSql: String;
begin
  if aArtWeb = '' then
  begin
    Result := -1;
    Exit;
  end;


  if Pos(' ', aArtWeb) > 0 then
  begin
    sArt := Copy(aArtWeb, 1, Pos(' ', aArtWeb) - 1);
    if Length(sArt) = 2 then
      if Pos(' ', Copy(aArtWeb, 4, Length(aArtWeb))) > 0 then
        sArt := sArt + Copy(aArtWeb, 3, Pos(' ', Copy(aArtWeb, 4, Length(aArtWeb))))
      else
        sArt := sArt + Copy(aArtWeb, 3, Length(aArtWeb));
  end
  else
    sArt := aArtWeb;

  sSql :=
    'SELECT ar_id' +
     ' FROM aar_art' +
    ' WHERE UPPER(ar_nombre) LIKE UPPER(' + SqlValue(sArt + '%') + ')' +
      ' AND ar_fechabaja IS NULL';
  Result := ValorSqlInteger(sSql);
end; }

function TfrmReAfiliacion.GetComision(const aVendedor: Integer; const aSector: String; const aCantTrabajadores, aIdHolding: Integer): Extended;
var
  sSql: String;
begin
  sSql := 'SELECT art.cotizacion.get_porccomision(:vendedor, :sector, :empleados, :idholding) FROM DUAL';
  Result := ValorSqlExtendedEx(sSql, [aVendedor, aSector, aCantTrabajadores, aIdHolding], -1);
end;

function TfrmReAfiliacion.GetCostoFijo(const aContrato: Integer): Extended;
var
  sSql: String;
begin
  sSql :=
    'SELECT SUM(vc_montofijo)' +
     ' FROM xvc_entvendconcepto' +
    ' WHERE vc_contrato = :contrato' +
      ' AND vc_montofijo >= 0';
  Result := ValorSqlExtendedEx(sSql, [aContrato]);
end;

function TfrmReAfiliacion.GetEstadoFechaAnterior(const aCuit: String; var aEstadoAnterior: String; var aFecha: TDateTime; const aId: Integer = -1): Boolean;
var
  sSql: String;
begin
  Result          := False;
  aEstadoAnterior := '';
  aFecha          := 0;

  sSql :=
    'SELECT sr_estadosolicitud, NVL(sr_fechanotificacioncomercial, sr_fechaalta) fecha' +
     ' FROM asr_solicitudreafiliacion' +
    ' WHERE sr_cuit = :p1' +
      ' AND sr_id <> :p2' +
 ' ORDER BY sr_id DESC';
  with GetQueryEx(sSql, [aCuit, aId]) do
  try
    if not IsEmpty then
    begin
      Result          := True;
      aEstadoAnterior := FieldByName('sr_estadosolicitud').AsString;
      aFecha          := FieldByName('fecha').AsDateTime;
    end;
  finally
    Free;
  end;
end;

function TfrmReAfiliacion.GetEstadoSolicitudAnterior(const aCuit: String; const aIdActual: Integer): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT sr_estadosolicitud' +
     ' FROM asr_solicitudreafiliacion' +
    ' WHERE sr_cuit = :p1' +
      ' AND sr_id <> :p2' +
 ' ORDER BY sr_id DESC';
  Result := ValorSqlEx(sSql, [aCuit, aIdActual]);
end;

function TfrmReAfiliacion.EnviarEmailHtml(const aIdCanal, aIdEntidad: Integer; var aFileName: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT nc_nombrearchivo' +
     ' FROM afi.anc_archivonotificacioncliente' +
    ' WHERE nc_idcanal = :idcanal' +
      ' AND nc_identidad = :identidad';
  aFileName := ValorSqlEx(sSql, [aIdCanal, aIdEntidad]);

  if aFileName = '' then
  begin
    sSql :=
      'SELECT nc_nombrearchivo' +
       ' FROM afi.anc_archivonotificacioncliente' +
      ' WHERE nc_idcanal = :idcanal' +
        ' AND nc_identidad IS NULL';
    aFileName := ValorSqlEx(sSql, [aIdCanal]);
  end;

  Result := (aFileName <> '');
end;

function TfrmReAfiliacion.IsComercial: Boolean;
begin
  Result := (FSector = 1);
end;

function TfrmReAfiliacion.IsJefe: Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM use_usuarios' +
    ' WHERE se_respondea = ' + SqlValue(Sesion.UserID) +
      ' AND se_fechabaja IS NULL';
  Result := (ExisteSql(sSql)) and (Sesion.Delegacion = 840);
end;

function TfrmReAfiliacion.IsTecnica: Boolean;
begin
  Result := (FSector = 2);
end;

function TfrmReAfiliacion.SolicitarPermiso(const aSolicitudId: Integer): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM use_usuarios' +
    ' WHERE se_respondea = ' + SqlValue(Sesion.UserID) +
      ' AND se_fechabaja IS NULL';
  if (ExisteSql(sSql)) and (Sesion.Delegacion = 840) then   // Si es jefe de casa central no hace falta que pida permiso..
  begin
    Result := True;
    Exit;
  end;

  Result := (fpPedidoAutorizacion.ShowModal = mrOk);

  if Result then
  try
    sSql :=
      'BEGIN' +
       ' intraweb.do_solicpermisorevisionajefe(:idsolicitudrevision, :usuario, :observaciones);' +
     ' END;';
    EjecutarSqlSTEx(sSql, [aSolicitudId, Sesion.UserID, memoObservaciones3.Lines.Text]);

    sSql :=
      'UPDATE asr_solicitudreafiliacion' +
        ' SET sr_estadosolicitud = :estado' +
      ' WHERE sr_id = :id';
    EjecutarSqlSTEx(sSql, [EC_PEND_AUTO, aSolicitudId]);

    MsgBox('Su pedido fue enviado a un superior para que autorice, la respuesta la recibirá vía e-mail.');
  except
    on E: Exception do
      ErrorMsg(E, 'Error al realizar la solicitud.')
  end;
end;

function TfrmReAfiliacion.SolicitarPermisoACobranza(const aSolicitudId, aContrato: Integer; const aDeuda: Real; const aCommit: Boolean = False): Boolean;
  procedure BeforeShowFormPanel;
  var
    iGestor: Integer;
    sSql: String;
  begin
    edDeuda2.Value := aDeuda;
    fraGestor.Visible := (fpPedidoACobranzasOLegales.Tag = 0);
    fraGestor2.Visible := (fpPedidoACobranzasOLegales.Tag = 1);
    memoObservaciones2.Clear;

    if fpPedidoACobranzasOLegales.Tag = 0 then    // Si  el pedido va a Cobranzas..
    begin
      fraGestor.Clear;

      sSql :=
        'SELECT se_id' +
         ' FROM aco_contrato, agc_gestorcuenta, use_usuarios' +
        ' WHERE co_idgestor = gc_id' +
          ' AND LOWER(gc_direlectronica) = LOWER(se_mail)' +
          ' AND co_contrato = :contrato';
      iGestor := ValorSqlIntegerEx(sSql, [aContrato]);

      if iGestor <> 0 then
        fraGestor.Value := iGestor
      else
      begin
        sSql :=
          'SELECT se_id' +
           ' FROM use_usuarios' +
          ' WHERE se_sector = ''COB''' +
            ' AND se_cargo = ''JDIV''';
        fraGestor.Value := ValorSqlInteger(sSql);
      end;
    end
    else    // El pedido va para Legales..
      fraGestor2.Clear;
  end;

var
  sSector: String;
  sSql: String;
begin
  Result := False;

  sSql :=
    'SELECT 1' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = :contrato' +
      ' AND co_idestudio IS NOT NULL';
  if ExisteSqlEx(sSql, [aContrato]) then
  begin
    sSector := 'Legales';
    fpPedidoACobranzasOLegales.Tag := 1;
  end
  else
  begin
    fpPedidoACobranzasOLegales.Tag := 0;
    sSector := 'Cobranzas';
  end;

  if MsgAsk(Format('Esta empresa tiene una deuda con nosotros de $ %s por lo tanto debe pedirle autorización al sector %s.' + #13#10 +
                   '¿ Desea hacerlo ahora ?' + #13#10 +
                   'SI = Solicitar autorización a %s.' + #13#10 +
                   'NO = Salir sin grabar (se perderán las modificaciones).',
                   [FormatFloat('#,##0.00', aDeuda), sSector, sSector])) then
  begin
    BeforeShowFormPanel;
    Result := (fpPedidoACobranzasOLegales.ShowModal = mrOk);
    if Result then
    try
      if aCommit then
        BeginTrans;

      sSql :=
        'BEGIN' +
         ' intraweb.do_solicitarpermisorevision(:idsolicitudrevision, :usuario, :deuda, :gestor, :observaciones);' +
       ' END;';
      EjecutarSqlSTEx(sSql, [aSolicitudId, Sesion.UserID, aDeuda, IIF((fpPedidoACobranzasOLegales.Tag = 0), fraGestor.Codigo, fraGestor2.Codigo), memoObservaciones2.Lines.Text]);

      sSql :=
        'UPDATE asr_solicitudreafiliacion' +
          ' SET sr_estadosolicitud = :estado' +
        ' WHERE sr_id = :id';
      EjecutarSqlSTEx(sSql, [IIF((fpPedidoACobranzasOLegales.Tag = 0), EC_PEND_AUTO_COBRANZA, EC_PEND_AUTO_LEGALES), aSolicitudId]);

      if aCommit then
        CommitTrans;

      MsgBox(Format('Su pedido fue enviado al sector %s, la respuesta la recibirá vía e-mail.', [sSector]));
    except
      on E: Exception do
      begin
        Result := False;
        if aCommit then
          Rollback;
        ErrorMsg(E, 'Error al realizar la solicitud.')
      end;
    end;
  end;
end;

function TfrmReAfiliacion.Validar: Boolean;
  procedure ClearTipo;
  begin
    FValidacionCotizacion.Advertencia      := False;
    FValidacionCotizacion.ContinuarCarga   := 'N';
    FValidacionCotizacion.DescripcionError := '';
    FValidacionCotizacion.NumeroError      := 0;
    FValidacionCotizacion.VerificaTecnica  := False;
  end;

var
  aId: Integer;
  sMsg: String;
begin
  Result := False;

  if pnComercial.Enabled then
  begin
    ClearTipo;

    aId := 0;
    if sdqConsulta.Active then
      aId := sdqConsulta.FieldByName('sr_id').AsInteger;

    // Llamo al procedure de PL-SQL que valida la cotización..
    FValidacionCotizacion := ValidarRevision(aId);
    if not (FValidacionCotizacion.NumeroError in [0, 15]) then
    begin
      sMsg := Format('[%d] - %s', [FValidacionCotizacion.NumeroError, FValidacionCotizacion.DescripcionError]);

      if (FValidacionCotizacion.NumeroError = 2120) or (FValidacionCotizacion.NumeroError = 2130) then
      begin
        if IsTecnica then
          FValidacionCotizacion.ContinuarCarga := 'S'
        else
          MsgBox(sMsg, MB_ICONWARNING);
      end
      else
        MsgBox(sMsg, MB_ICONWARNING);

      if FValidacionCotizacion.ContinuarCarga = 'N' then
      begin
        case FValidacionCotizacion.NumeroError of
          2010: fraMotivoSolicitud.edCodigo.SetFocus;
          2020: fraEmpresa.mskCUIT.SetFocus;
          2040: fraMotivoSolicitud.edCodigo.SetFocus;
          2050: fraMotivoSolicitud.edCodigo.SetFocus;
          2060: fraMotivoSolicitud.edCodigo.SetFocus;
          2070: fraCanal.edCodigo.SetFocus;
          2080: fraMotivoSolicitud.edCodigo.SetFocus;
          2090: fraEntidad.edCodigo.SetFocus;
          2100: fraSucursal.edCodigo.SetFocus;
          2110: fraVendedor.edCodigo.SetFocus;
          2120: edComision.SetFocus;
          2130: edComision.SetFocus;
          2140: fraStatusBCRA.edCodigo.SetFocus;
          2150: if edResultadoMensualTrabajador.Focused then
                  edResultadoMensualTrabajador.SetFocus;
          2160: memoObservaciones.SetFocus;
          2170: fraCiiuNuevo1.edCodigo.SetFocus;
          2180: fraCiiuNuevo1.edCodigo.SetFocus;
          2190: fraCiiuNuevo2.edCodigo.SetFocus;
          2200: fraCiiuNuevo2.edCodigo.SetFocus;
          2210: fraCiiuNuevo3.edCodigo.SetFocus;
          2220: edTrabajadoresNuevo1.SetFocus;
          2230: edMasaSalarialNuevo1.SetFocus;
          2240: edActividadReal.SetFocus;
        end;

        Exit;
      end;
    end;
  end;

  //tk 37062. Guardan datos en 0
  if (IsComercial) and (ModoAbm = maAlta) then
    // Ticket 57198..
    Verificar(edPeriodoNomina.Periodo.IsNull, edPeriodoNomina, 'El Período de Nómina es obligatoria.');

    if fraMotivoSolicitud.Codigo <> '9' then
      Verificar((edCostoFijoUltimoContrato.Value = 0) and (edPorcentajeVariableUltimoContrato.Value = 0), edCostoFijoUltimoContrato, 'La Suma Fija y el Porcentaje Variable están en 0.');

//  if (IsComercial) and (ModoAbm = maAlta) then
//    Verificar(Trim(VerificarReafiliacionRepetida)<>'', fraEmpresaBusqueda, 'Existe una cotización activa con datos similares.');

  if IsTecnica then
  begin
    Verificar(fraStatusBCRA.IsEmpty, fraStatusBCRA.edCodigo, 'Debe ingresar el Status BCRA.');

    if (fraCiiuNuevo1.Value = FCiiuNuevo1Anterior) and (fraCiiuNuevo2.Value = FCiiuNuevo2Anterior) and (fraCiiuNuevo3.Value = FCiiuNuevo3Anterior) then
    begin
{
Comentado por pedido de CFlorio vía telefónica el 23.2.2011..
      if sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_PEND_AUTORIZ then
      begin
        Verificar(fraMotivoRespuesta.IsEmpty, fraMotivoRespuesta.edCodigo, 'El campo Motivo Respuesta es obligatorio.');
        if (fraMotivoRespuesta.Value <> 21) and (fraMotivoRespuesta.Value <> 38) and (fraMotivoRespuesta.Value <> 39) and
           (fraMotivoRespuesta.Value <> 103) and (fraMotivoRespuesta.Value <> 84) then
        begin
          Verificar((edCostoXTrabajadorCotizado.Value = 0), edCostoXTrabajadorCotizado, 'El campo Costo x Trab. es obligatorio.');
          Verificar((edCostoFijoCotizado.Value < 0.6), edCostoFijoCotizado, 'El campo Costo Fijo debe ser mayor o igual a $0.60.');
          Verificar((edPorcentajeVariableCotizado.Value = 0), edPorcentajeVariableCotizado, 'El campo Porc. Var. es obligatorio.');
        end;
      end;
}
      Verificar((fraMotivoSolicitud.Codigo = '7') and (fraMotivoRespuesta.Value = 84) and (memoObservacionesTecnica.Lines.Text = ''), memoObservacionesTecnica, 'El campo Observaciones es obligatorio.');
      VerificarTarifarioSSN;
    end;

    if fpEstado.ShowModal <> mrOk then
      Abort;
  end;

  Result := True;
end;

function TfrmReAfiliacion.ValoresPendientes(const aContrato: Integer): String;
var
  sSql: String;
  sValor1: String;
  sValor2: String;
  sValor3: String;
begin
  Result := '';
  
  sSql :=
    'SELECT DECODE(deuda, 0, NULL, ''Valores pendientes de acreditar por $ '' || REPLACE(TO_CHAR(deuda, ''FM9999999999.00''), ''.'', '',''))' +
     ' FROM (SELECT NVL(SUM(va_importe), 0) deuda' +
             ' FROM art.ctb_tablas, zva_valor' +
            ' WHERE va_idcontrato = :idcontrato' +
              ' AND va_fechabaja IS NULL' +
              ' AND tb_clave = ''ESVAL''' +
              ' AND tb_codigo = va_estado' +
              ' AND tb_especial1 = ''N''' +
              ' AND va_fecharechazo IS NULL)';
  sValor1 := ValorSqlEx(sSql, [aContrato]);

  sSql :=
    'SELECT DECODE(monto, NULL, NULL, ''Valores rechazados por $ '' || REPLACE(TO_CHAR(monto, ''FM9999999999.00''), ''.'', '',''))' +
     ' FROM (SELECT SUM(va_importe) monto' +
             ' FROM zva_valor' +
            ' WHERE va_estado = ''03''' +
              ' AND va_idcontrato = :idcontrato)';
  sValor2 := ValorSqlEx(sSql, [aContrato]);

  sSql :=
    'SELECT DECODE(monto, 0, NULL, ''Valores pendientes de entrega por $ '' || REPLACE(TO_CHAR(monto, ''FM9999999999.00''), ''.'', '',''))' +
     ' FROM (SELECT NVL(SUM(pc_amortizacion + pc_interesfinanc) - art.deuda.get_valoresplan(pp_id), 0) monto' +
             ' FROM art.ctb_tablas, zpc_plancuota, zpp_planpago' +
            ' WHERE pc_idplanpago = pp_id' +
              ' AND pp_estado = tb_codigo' +
              ' AND tb_clave = ''ESPLA''' +
              ' AND tb_especial1 = ''S''' +
              ' AND tb_especial2 <> ''A''' +
              ' AND pp_contrato = :contrato' +
         ' GROUP BY pp_id)';
  sValor3 := ValorSqlEx(sSql, [aContrato]);

  Result := sValor1 + ' - ';
  if sValor2 <> '' then
    Result := Result + sValor2 + ' - ';
  if sValor3 <> '' then
    Result := Result + sValor3 + ' - ';
  Delete(Result, Length(Result) - 2, 3);
end;


procedure TfrmReAfiliacion.ActivarABMEventos(const aEstado: Boolean);
begin
  tbNuevo2.Enabled     := not aEstado;
  tbModificar2.Enabled := not aEstado;
  tbDarBaja.Enabled    := not aEstado;
  tbGuardar.Enabled    := aEstado;
  tbCancelar.Enabled   := aEstado;
  tbOrdenar2.Enabled   := not aEstado;

  gridEventos.Enabled  := not aEstado;
  panelEventos.Enabled := aEstado;

  VCLExtra.LockControl(edFechaEvento, not aEstado);
  VCLExtra.LockControl(memoDescripcionEvento, not aEstado);

  if aEstado then
  begin
    if edFechaEvento.CanFocus then
      edFechaEvento.SetFocus;
  end
  else
    if gridEventos.CanFocus then
      gridEventos.SetFocus;
end;

procedure TfrmReAfiliacion.ActualizarConsulta;
begin
  if sdqConsulta.Active then
  begin
    sdqConsulta.Refresh;
    CheckButtons;
  end
  else
    RefreshData;
end;

procedure TfrmReAfiliacion.tbFiltrarEndososClick(Sender: TObject);
begin
  if not tbFiltrarEndosos.Down then
  begin
    edFechaSolicitudDesde.Date := DBDate - 30;
    tbFiltrarEndosos.Hint := 'Filtrar Endosos Pendientes';
  end
  else
  begin
    if HayFiltrosAplicados then
      if not MsgAsk('Hay Filtros aplicados, ¿Desea utilizarlos para filtrar los endosos?', 'Filtros Aplicados') then
        tbLimpiarClick(nil);
    tbFiltrarEndosos.Hint := 'Desactivar el filtro de Endosos Pendientes';
  end;
  tbRefrescarClick(nil);
end;

procedure TfrmReAfiliacion.CalcularArchivos;
var
  sSql: String;
begin
  if IsComercial then
    sSql :=
      'SELECT COUNT(*)' +
       ' FROM afi.aah_archivosreafiliacion' +
      ' WHERE (   (ah_sector = ''C'')' +
             ' OR (    ah_sector = ''T''' +
                 ' AND ah_visibilidad = ''U''))' +
        ' AND ah_fechabaja IS NULL' +
        ' AND ah_idsolicitudreafiliacion = :idsolicitudreafiliacion';

  if IsTecnica then
    sSql :=
      'SELECT COUNT(*)' +
       ' FROM afi.aah_archivosreafiliacion' +
      ' WHERE (   (ah_sector = ''T'')' +
             ' OR (    ah_sector = ''C''' +
                 ' AND ah_visibilidad = ''U''))' +
        ' AND ah_fechabaja IS NULL' +
        ' AND ah_idsolicitudreafiliacion = :idsolicitudreafiliacion';

  btnAdministracionArchivos.Caption := 'Administración de Archivos (' + ValorSqlEx(sSql, [sdqConsulta.FieldByName('sr_id').AsInteger]) + ')';
end;

procedure TfrmReAfiliacion.CalcularCPTMA;
begin
  if rbDatosEmpresa.Checked then
    edCPTMA.Value := ((edCompetenciaDECostoFijo.Value * TIntEdit(IIF((fraMotivoSolicitudBusqueda.Value = 3), edTrabajadoresTotalNuevo, edTrabajadores)).Value) + (TCurrencyEdit(IIF((fraMotivoSolicitudBusqueda.Value = 3), edMasaSalarialTotalNuevo, edMasaSalarial)).Value * edCompetenciaDECostoVariable.Value)) / 100
  else if rbFormulario931.Checked then
    edCPTMA.Value := edCompetenciaF931CostoFijo.Value + edCompetenciaF931CostoVariable.Value
  else
    edCPTMA.Value := 0;
end;

procedure TfrmReAfiliacion.CalcularLimiteSSN;
var
  sSql: String;
begin
  sSql :=
    'SELECT ls_maximo, ls_minimo' +
     ' FROM art.als_limitessn' +
    ' WHERE ls_idactividad = :idactividad' +
      ' AND art.actualdate BETWEEN ls_fechadesde AND ls_fechahasta' +
      ' AND ls_fechabaja IS NULL';
  with GetQueryEx(sSql, [IIF(fraCiiu1DigitoNuevo.IsEmpty, fraCiiu1Digito.Value, fraCiiu1DigitoNuevo.Value)]) do
  try
    edLimiteSSNMinimo.Value := FieldByName('ls_minimo').AsFloat;
    edLimiteSSNMaximo.Value := FieldByName('ls_maximo').AsFloat;
  finally
    Free;
  end;
end;

procedure TfrmReAfiliacion.CalcularMasaDivididaTrabajador(Sender: TObject);
begin
  if edTrabajadoresTotalNuevo.Value <> 0 then
    edMasaDivididaTrabajador.Value := edMasaSalarialTotalNuevo.Value / edTrabajadoresTotalNuevo.Value;
end;

procedure TfrmReAfiliacion.CalcularTarifarioSSN;
var
  eMasaSalarial: Extended;
  iTrabajadores: Integer;
  sSql: String;
begin
  eMasaSalarial := Integer(IIF((edMasaSalarialTotalNuevo.Value = 0), edMasaSalarial.Value, edMasaSalarialTotalNuevo.Value));
  iTrabajadores := Integer(IIF(edTrabajadoresTotalNuevo.IsEmpty, edTrabajadores.Value, edTrabajadoresTotalNuevo.Value));
  sSql :=
    'SELECT ts_tarifa1, ts_porce1' +
     ' FROM ats_tarifassn' +
    ' WHERE ts_idactividad = ' + SqlValue(Integer(IIF(fraCiiuNuevo1.IsEmpty, fraCiiu1.Value, fraCiiuNuevo1.Value))) +
      ' AND ts_fechahasta IS NULL' +
      ' AND ts_fechabaja IS NULL';
  with GetQuery(sSql) do
  try
    edSumaFijaTarifarioSSN.Value := FieldByName('ts_tarifa1').AsFloat;
    edPorcentajeVariableTarifarioSSN.Value := FieldByName('ts_porce1').AsFloat;
    if (iTrabajadores > 0) and (edPorcentajeVariableTarifarioSSN.Value > 0) then
      edCostoFinalTarifarioSSN.Value := (eMasaSalarial / iTrabajadores * edPorcentajeVariableTarifarioSSN.Value / 100) + edSumaFijaTarifarioSSN.Value;
  finally
    Free;
  end;
end;

procedure TfrmReAfiliacion.CalcularTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      if tbSumatoria.Down and sdqConsulta.Active then
        CalcFields(sdqConsulta, CamposSuma, Values, TiposOperacion, Operadores, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmReAfiliacion.CambiaEntidad(Sender: TObject);
var
  sSql: String;
begin
  fraSucursal.Entidad := fraEntidad.Value;

  sSql :=
    'SELECT (pr_porcentaje - 5) * 1.21' +
     ' FROM pago.ppr_porcentaje' +
    ' WHERE pr_identidad = :identidad';
  edAcpo.Value := ValorSqlExtendedEx(sSql, [fraEntidad.Value]);
end;

procedure TfrmReAfiliacion.CambiaEntidadBusqueda(Sender: TObject);
begin
  fraSucursalBusqueda.Entidad := fraEntidadBusqueda.Value;
end;

procedure TfrmReAfiliacion.CambiarMotivoSolicitud(Sender: TObject);
//var
//  aLock: Boolean;
begin
{
  aLock := ((fraMotivoSolicitud.Codigo <> '1.2') and (fraMotivoSolicitud.Codigo <> '3') and
            (fraMotivoSolicitud.Codigo <> '4') and (fraMotivoSolicitud.Codigo <> '6') and
            (fraMotivoSolicitud.Codigo <> '6.1') and (fraMotivoSolicitud.Codigo <> '7'));

  LockControl(gbCiiuNuevo, aLock);

  if (Sender <> nil) and (aLock) then
  begin
    fraCiiuNuevo1.Clear;
    fraCiiuNuevo2.Clear;
    fraCiiuNuevo3.Clear;
    edTrabajadoresNuevo1.Clear;
    edTrabajadoresNuevo2.Clear;
    edTrabajadoresNuevo3.Clear;
    edMasaDivididaTrabajador.Clear;
    edTrabajadoresTotalNuevo.Clear;
    edMasaSalarialNuevo1.Clear;
    edMasaSalarialNuevo2.Clear;
    edMasaSalarialNuevo3.Clear;
    edMasaSalarialTotalNuevo.Clear;
  end;
}
  fraMotivoRespuesta.Propiedades.ExtraCondition := Format(' AND rs_idsolicitud = %d ', [fraMotivoSolicitud.Value]);
end;

procedure TfrmReAfiliacion.Cancelar(const aMotivoCancelacion: Integer = -1; const aObservaciones: String = '');
var
  sAsunto: String;
  sBody: String;
  sDestinatario: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    sSql :=
      'UPDATE asr_solicitudreafiliacion' +
        ' SET sr_idmotivocancelacion = :Motivo,' +
            ' sr_observacioncancelacion = :Observacion,' +
            ' sr_fechacancelacion = SYSDATE,' +
            ' sr_estadosolicitud = :Estado,' +
            ' sr_usubaja = :Usuario,' +
            ' sr_fechabaja = SYSDATE' +
      ' WHERE sr_id = :Id';

    EjecutarSqlEx(sSql, [aMotivoCancelacion, aObservaciones, EC_CANCELADA, Sesion.UserID, FieldByName('sr_id').AsInteger]);

    sAsunto := 'Solicitud de revisión de precio cancelada';
    sBody :=
      'Nº Solicitud: ' + FieldByName('sr_nrosolicitud').AsString + CRLF +
      'C.U.I.T.: ' + PonerGuiones(FieldByName('sr_cuit').AsString) + CRLF +
      'Razón Social: ' + FieldByName('hm_nombre').AsString + CRLF;
      
    if fraMotivoCancelacion.Value > 0 then
      sBody := sBody + 'Motivo Cancelación: ' + fraMotivoCancelacion.cmbDescripcion.Text + CRLF;
    if aObservaciones <> '' then
      sBody := sBody + 'Observaciones: ' + memoObservacionesCancelacion.Lines.Text + CRLF + CRLF;

    if IsComercial then
      sDestinatario := FieldByName('sr_usuasignado').AsString;
    if IsTecnica then
      sDestinatario := FieldByName('sr_usualta').AsString;

    if sDestinatario <> '' then   // Esto es porque se puede cancelar una solicitud sin que tenga un usuario asignado..
      NotificacionPorMail('', sBody, sAsunto, 'ASR', FieldByName('sr_id').AsInteger, sDestinatario);
  end;
end;

procedure TfrmReAfiliacion.CerrarRevision(aEstado: String);
var
  sSql: String;
begin
  if (MsgBox('¿ Realmente desea cerrar esta revisión ?', MB_YESNO) = mrYes) then
  begin
    sSql :=
      'UPDATE asr_solicitudreafiliacion' +
        ' SET sr_observacionescierre = :observacionescierre,' +
            ' sr_fechacierre = SYSDATE,' +
            ' sr_usumodif = :usumodif,' +
            ' sr_estadosolicitud = :estadosolicitud' +
      ' WHERE sr_id = :id';
    EjecutarSqlEx(sSql, [memoObservacionesCierre.Lines.Text, Sesion.UserID, aEstado, sdqConsulta.FieldByName('sr_id').AsInteger]);
    InfoHint(Grid, 'La revisión ha sido cerrada.');

    tbRefrescarClick(nil);
  end;
end;

procedure TfrmReAfiliacion.chkEndososClick(Sender: TObject);
begin
{  if not chkEndosos.Checked then
    edFechaSolicitudDesde.Date := DBDate - 30
  else
    if HayFiltrosAplicados then
      if not MsgAsk('Hay Filtros aplicados, ¿Desea utilizarlos para filtrar los endosos?', 'Filtros Aplicados') then
      begin
        tbLimpiarClick(nil);
        chkEndosos.State := cbChecked;
      end;
  tbRefrescarClick(nil);  }
end;

procedure TfrmReAfiliacion.ClearControls;
begin
  LimpiarDatosSoloLectura;

  edNumeroSolicitud.Clear;
  edFechaSolicitud.Clear;
  fraUsuarioSolicitud.Clear;
  lbTipoRegimen.Caption := '';
  fraMotivoSolicitud.Clear;
  fraEmpresa.Clear;
  VCLExtra.EnableControls([fraEmpresa], True);
  edCorreo.Clear;
  edContacto.Clear;
  edTelefono.Clear;
  fraCanal.Clear;
  fraEntidad.Clear;
  fraSucursal.Clear;
  fraCentroReg.Clear;
  fraVendedor.Clear;
  fraHolding.Clear;
  edComision.Clear;
  edAcpo.Clear;
  fraStatusBCRA.Clear;
  fraStatusSrt.Clear;
  CambiaStatusSrt(nil);
  LockControl(gbCiiuNuevo, True);
  fraCiiuNuevo1.Clear;
  fraCiiuNuevo2.Clear;
  fraCiiuNuevo3.Clear;
  edTrabajadoresNuevo1.Clear;
  edTrabajadoresNuevo2.Clear;
  edTrabajadoresNuevo3.Clear;
  edMasaSalarialNuevo1.Clear;
  edMasaSalarialNuevo2.Clear;
  edMasaSalarialNuevo3.Clear;
  edActividadReal.Clear;
  edPeriodoNomina.Clear;
  edMasaDivididaTrabajador.Clear;
  edTrabajadoresTotalNuevo.Clear;
  edMasaSalarialTotalNuevo.Clear;
  rbSinDatos.Checked := True;
  edCompetenciaPTMCostoFijo.Clear;
  edCompetenciaDECostoFijo.Clear;
  edCompetenciaF931CostoFijo.Clear;
  edCompetenciaDECostoVariable.Clear;
  edCompetenciaF931CostoVariable.Clear;
  edCPTMA.Clear;
  edResultadoMensualTrabajador.Clear;
  edSumaFija.Clear;
  edPorcVariable.Clear;
  memoObservaciones.Clear;
  lbEstadoActual.Caption := '-';
  memoInformacionComplementaria.Clear;
  chkIltEmpleador.Checked := False;
  chkFrecuencuaSiniestral.Checked := False;
  chkJuicios.Checked := False;
  chkIlp.Checked := False;
  chkPrecioCompetencia.Checked := False;
  chkTarifaUnificada.Checked := False;
  edIndiceCombinado.Clear;
  edCostoXTrabajadorCotizado.Clear;
  edCostoFijoCotizado.Clear;
  edPorcentajeVariableCotizado.Clear;
  edComisionCotizada.Clear;
  fraMotivoRespuesta.Clear;
  memoObservacionesTecnica.Clear;
end;

procedure TfrmReAfiliacion.GetEstadosDeCuenta;
var
  sSql: String;
begin
  // Obtengo la foto de los estados de cuenta que no lo tengan que este en el estado 'Pendiente de Revisión'
  // (como hacerlo desde php es muy engorroso lo pongo aca para que se ejecute una vez por día por el primero que
  //  entra al sistema)..

  IniciarEspera('Actualizando estados de cuenta...');
  BeginTrans;

  sSql :=
    'SELECT sr_contrato, sr_id' +
     ' FROM asr_solicitudreafiliacion' +
    ' WHERE sr_estadosolicitud = ''00''' +
      ' AND sr_fotoestadodecuenta IS NULL';
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      SavePhotoEstadoCuenta(FieldByName('sr_id').AsInteger, FieldByName('sr_contrato').AsInteger);
      Next;
    end;
  finally
    Free;
    CommitTrans;
    DetenerEspera;
  end;
end;

procedure TfrmReAfiliacion.GetUsuarioAutorizacion(var aUsuarioAutorizacion, aPuestoAutorizacion: String);
var
  sSql: String;
begin
  aUsuarioAutorizacion := sdqConsulta.FieldByName('sr_usuarioautorizacion').AsString;
  aPuestoAutorizacion  := sdqConsulta.FieldByName('sr_puestoautorizacion').AsString;

  if aUsuarioAutorizacion = '' then   // Si no tiene usuario de autorización le coloco el que corresponde..
  begin
    sSql :=
      'SELECT   ac_puesto, ac_usuario' +
         ' FROM art.aac_autorizacotiza' +
        ' WHERE :capitas BETWEEN ac_capitasdesde AND ac_capitashasta' +
          ' AND (INSTR('','' || ac_srtrevision || '','', :srtrevision) > 0 OR ' + SqlString(sdqConsulta.FieldByName('statussrt').AsString, False, True) + ' IS NULL)' +
          ' AND INSTR('','' || ac_bcra || '','', :bcra) > 0' +
          ' AND INSTR('','' || ac_riesgo || '','', :riesgo) > 0' +
          ' AND ac_fechabaja IS NULL' +
     ' ORDER BY ac_prioridad';
    with GetQueryEx(sSql, [sdqConsulta.FieldByName('empleados').AsInteger,
                           ',' + sdqConsulta.FieldByName('statussrt').AsString + ',',
                           ',' + fraStatusBCRA.Codigo + ',',
                           ',' + sdqConsulta.FieldByName('ac_idtiporiesgo').AsString + ',']) do
    try
      aUsuarioAutorizacion := FieldByName('ac_usuario').AsString;
      aPuestoAutorizacion  := FieldByName('ac_puesto').AsString;
    finally
      Free;
    end;
  end;
end;

procedure TfrmReAfiliacion.LimpiarDatosSoloLectura;
begin
  fraEstado.Clear;
  edFechaVigenciaDesdeContrato.Clear;
  edCantidadContratosRescindidosFaltaPago.Clear;
  edFechaBaja.Clear;
  fraMotivoBaja.Clear;
  fraEjecutivo.Clear;
  fraSector.Clear;
  fraCiiu1.Clear;
  fraCiiu2.Clear;
  fraCiiu3.Clear;
  edVigenciaTarifa.Clear;
  edPeriodo.Clear;
  edTrabajadores.Clear;
  edMasaSalarial.Clear;
  fraCiiu1Digito.Clear;
  edResultadoMensualTrabajadorActual.Clear;
  edCostoFijoUltimoContrato.Clear;
  edPorcentajeVariableUltimoContrato.Clear;
  edVigenciaTarifaPendiente.Clear;
  edVigenciaIncumplimientoPendiente.Clear;
  edSumaFijaPendiente.Clear;
  edPorcentajeVariablePendiente.Clear;
  fraMotivoTarifaPendiente.Clear;
  edValoresPendientesAcreditar.Clear;
  edConcurso.Clear;
  edQuiebra.Clear;
  edSumaFijaTarifario.Clear;
  edPorcentajeVariableTarifario.Clear;
  edCostoFinalTarifario.Clear;
  edSumaFijaTarifarioSSN.Clear;
  edPorcentajeVariableTarifarioSSN.Clear;
  edCostoFinalTarifarioSSN.Clear;
  edLimiteSSNMinimo.Clear;
  edLimiteSSNMaximo.Clear;
  edDeuda.Clear;
  edDeudaAl.Clear;
  edAutorizo.Clear;
  edFechaAutorizoCobranzasOLegales.Clear;
  fraUsuarioAutorizo.Clear;
  memoObservacionesCobranzaOLegales.Clear;
  edAutorizoComercial.Clear;
  edFechaAutorizoComercial.Clear;
  fraUsuarioAutorizoComercial.Clear;
  memoObservacionesComercial.Clear;
end;

procedure TfrmReAfiliacion.ClearData;
begin
  edNumeroSolicitudBusqueda.Clear;
  fraEmpresaBusqueda.Clear;
  chkUltimaSolicitud.Checked := False;
  fraUsuarioSolicitoBusqueda.Clear;
  fraUsuarioAsignadoBusqueda.Clear;
  fraUsuarioAutorizacionBusqueda.Clear;
  cbEstadoBusqueda.Clear;
  fraCanalBusqueda.Clear;
  fraEntidadBusqueda.Clear;
  fraSucursalBusqueda.Clear;
  fraCentroRegBusqueda.Clear;
  fraVendedorBusqueda.Clear;
  fraDelegacionBusqueda.Clear;
  fraMotivoSolicitudBusqueda.Clear;
  fraMotivoRespuestaBusqueda.Clear;
  edFechaSolicitudDesde.Clear;
  edFechaSolicitudHasta.Clear;
  edFechaRespuestaComercialDesde.Clear;
  edFechaRespuestaComercialHasta.Clear;
  edNumeroSolicitudAfiliacion.Clear;
  checkEnTramite.Checked := False;
  edFechaAprobacionAutomaticaDesde.Clear;
  edFechaAprobacionAutomaticaHasta.Clear;
  edFechaConfeccionDesde.Clear;
  edFechaConfeccionHasta.Clear;
  edFechaSuspensionDesde.Clear;
  edFechaSuspensionHasta.Clear;
  checkEntidadesEnTramite.Checked := False;
  chkConTarifaCargada.Checked := False;
  fraHoldingBusqueda.Clear;
  {tbFiltrarEndosos.Down := False;
  chkEndosos.Checked := False;   }
  inherited;
end;

function TfrmReAfiliacion.GetStatusBCRA(const aCuit: String): Integer;
var
  aResultImportFromBCRA: TResultImportFromBCRA;
  bImportOk: Boolean;
  sSql: String;
begin
  Result := 0;
  Try
  // Importo el status del BCRA..
  aResultImportFromBCRA := ImportFromBCRA(aCuit, True, False);
  bImportOk := (not aResultImportFromBCRA.ProcesoCancelado) and (aResultImportFromBCRA.CuitExistente[0]) and
               (aResultImportFromBCRA.SituacionMasComprometida[0] <> '0') and (aResultImportFromBCRA.Error = '');
  except
    bImportOk := False;
  end;
  if bImportOk then
  begin
    sSql :=
      'SELECT tb_id' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''STBCR''' +
        ' AND tb_codigo = :codigo';
    Result := ValorSqlIntegerEx(sSql, [aResultImportFromBCRA.SituacionMasComprometida[0]]);
  end;
end;

//Comentado pedido por evila

{function TfrmReAfiliacion.GetStatusSRT(const aCuit: String): Integer;
var
  aResultImportFromSRT: TResultImportFromSRT;
  bImportOk: Boolean;
begin
  Result := 0;

  // Importo el status del SRT..
  try
  aResultImportFromSRT := ImportFromSRT(aCuit, True, False);
  bImportOk := (aResultImportFromSRT.Error = '') and (not aResultImportFromSRT.ProcesoCancelado);
  except
    bImportOk := False;
  end;
  
  if bImportOk then
  begin
    if aResultImportFromSRT.UltimaOperacion[0] = '' then
      Result := 1;
    if (aResultImportFromSRT.UltimaOperacion[0] = '1') or (aResultImportFromSRT.UltimaOperacion[0] = '14') then
      Result := 2;
    if aResultImportFromSRT.UltimaOperacion[0] = '13' then
      Result := 3;
    if (aResultImportFromSRT.UltimaOperacion[0] = '12') or (aResultImportFromSRT.UltimaOperacion[0] = '17') then
      Result := 4;
    if aResultImportFromSRT.UltimaOperacion[0] = '2' then
    begin
      if aResultImportFromSRT.UltimoContratoExtinguido[0] = '1' then
        Result := 5;
      if aResultImportFromSRT.UltimoContratoExtinguido[0] = '3' then
        Result := 6;
      if aResultImportFromSRT.UltimoContratoExtinguido[0] = '2' then
        Result := 7;
    end;

    fraArtAnterior.Value := GetArt(aResultImportFromSRT.UltimaArt[0]);
  end;
end;}

procedure TfrmReAfiliacion.LoadControls;
begin
	ClearControls;

  FCalcularValoresCotizados := False;

  with sdqConsulta do
  try
    FComisionCotizadaAnterior   := FieldByName('sr_comisioncotizada').AsFloat;
    FPorcentajeVariableAnterior := FieldByName('sr_porcentajevariablecotizado').AsFloat;
    FPrimaPorCapitaAnterior     := FieldByName('sr_costofinalcotizado').AsFloat;
    FSumaFijaAnterior           := FieldByName('sr_costofijocotizado').AsFloat;

    fraArtAnterior.Value                         := FieldByName('sr_idartanterior').AsInteger;

    edNumeroSolicitud.Value                      := FieldByName('sr_nrosolicitud').AsInteger;
    edFechaSolicitud.Date                        := FieldByName('sr_fechaalta').AsDateTime;
    fraUsuarioSolicitud.Value                    := FieldByName('sr_usualta').AsString;

    lbTipoRegimen.Caption                        := FieldByName('tiporegimen').AsString;

    fraMotivoSolicitud.Value                     := FieldByName('sr_idmotivosolicitud').AsInteger;
    CambiarMotivoSolicitud(Self);

    fraEmpresa.Contrato                          := FieldByName('sr_contrato').AsInteger;
    VCLExtra.EnableControls([fraEmpresa], False);
//    CambiarEmpresa(nil);

    edCorreo.Text                                := FieldByName('sr_email').AsString;
    edContacto.Text                              := FieldByName('sr_contacto').AsString;
    edTelefono.Text                              := FieldByName('sr_telefono').AsString;

    fraCanal.Value                               := FieldByName('sr_idcanal').AsInteger;
    CambiarCanal(nil);

    fraEntidad.Value                             := FieldByName('sr_identidad').AsInteger;
    CambiaEntidad(nil);

    fraSucursal.Value                            := FieldByName('sr_idsucursal').AsInteger;
    CambiarSucursal(nil);

    fraCentroReg.Value                           := FieldByName('sr_idcentroregional').AsInteger;
    CambiarCentroReg(nil);

    fraVendedor.Value                            := FieldByName('sr_idvendedor').AsInteger;
    fraHolding.Value                             := FieldByName('sr_idholding').AsInteger;
    edCostoFijo.Value                            := GetCostoFijo(fraEmpresa.Contrato);
    fraStatusBCRA.Value                          := FieldByName('sr_idstatusbcra').AsInteger;

    fraStatusSrt.Value                           := FieldByName('sr_idstatussrt').AsInteger;
    CambiaStatusSrt(nil);

    edCostoFijoUltimoContrato.Value              := FieldByName('sr_costofijo').AsFloat;
    edPorcentajeVariableUltimoContrato.Value     := FieldByName('sr_porcentajevariable').AsFloat;
    edSumaFijaTarifario.Value                    := FieldByName('sr_autosumafija').AsFloat;
    edPorcentajeVariableTarifario.Value          := FieldByName('sr_autoporcvariable').AsFloat;
    edCostoFinalTarifario.Value                  := FieldByName('sr_autocostofinal').AsFloat;
    edSumaFijaTarifarioSSN.Value                 := FieldByName('sr_sumafijatarifariossn').AsFloat;
    edPorcentajeVariableTarifarioSSN.Value       := FieldByName('sr_porcvariabletarifariossn').AsFloat;
    edCostoFinalTarifarioSSN.Value               := FieldByName('sr_costofinaltarifariossn').AsFloat;
    edDeuda.Value                                := FieldByName('deuda').AsFloat;
    edDeudaAl.Date                               := FieldByName('sr_fechaalta').AsDateTime;
    edAutorizo.Text                              := FieldByName('autorizo').AsString;
    edFechaAutorizoCobranzasOLegales.Date        := FieldByName('rd_fechaautorizacion').AsDateTime;
    fraUsuarioAutorizo.Value                     := FieldByName('rd_usuarioautorizo').AsString;
    memoObservacionesCobranzaOLegales.Lines.Text := Copy(FieldByName('rd_observacioncobranza').AsString, 1, 255);
    edAutorizoComercial.Text                     := FieldByName('autorizocomercial').AsString;
    edFechaAutorizoComercial.Date                := FieldByName('au_fechaautorizacion').AsDateTime;
    fraUsuarioAutorizoComercial.Value            := FieldByName('au_usuarioautorizo').AsString;
    memoObservacionesComercial.Lines.Text        := FieldByName('observacioncomercial').AsString;

    fraCiiuNuevo1.Value                          := FieldByName('sr_idactividad1').AsInteger;
    FCiiuNuevo1Anterior                          := FieldByName('sr_idactividad1').AsInteger;
    CambiarActividad(nil);

    fraCiiuNuevo2.Value                          := FieldByName('sr_idactividad2').AsInteger;
    FCiiuNuevo2Anterior                          := FieldByName('sr_idactividad2').AsInteger;
    fraCiiuNuevo3.Value                          := FieldByName('sr_idactividad3').AsInteger;
    FCiiuNuevo3Anterior                          := FieldByName('sr_idactividad3').AsInteger;
    edActividadReal.Text                         := FieldByName('sr_actividadreal').AsString;
    edTrabajadoresNuevo1.Value                   := FieldByName('sr_canttrabajadores1').AsInteger;
    edTrabajadoresNuevo2.Value                   := FieldByName('sr_canttrabajadores2').AsInteger;
    edTrabajadoresNuevo3.Value                   := FieldByName('sr_canttrabajadores3').AsInteger;
    edTrabajadoresTotalNuevo.Value               := FieldByName('sr_canttrabajadores').AsInteger;
    edMasaSalarialNuevo1.Value                   := FieldByName('sr_masasalarial1').AsFloat;
    edMasaSalarialNuevo2.Value                   := FieldByName('sr_masasalarial2').AsFloat;
    edMasaSalarialNuevo3.Value                   := FieldByName('sr_masasalarial3').AsFloat;
    edMasaSalarialTotalNuevo.Value               := FieldByName('sr_masasalarial').AsFloat;
    edPeriodoNomina.Periodo.Valor                := FieldByName('sr_periodonomina').AsString;
    edComision.Value                             := FieldByName('sr_comision').AsFloat;   // Esto va abajo de los trabajdores para que no se sobreescriba el valor..
    edAcpo.Value                                 := FieldByName('sr_acpo').AsFloat;
    rbSinDatos.Checked                           := (FieldByName('sr_tipodatotarifacompetencia').AsString = '');
    rbPagoTotalMensual.Checked                   := (FieldByName('sr_tipodatotarifacompetencia').AsString = 'A');
    rbDatosEmpresa.Checked                       := (FieldByName('sr_tipodatotarifacompetencia').AsString = 'N');
    rbFormulario931.Checked                      := (FieldByName('sr_tipodatotarifacompetencia').AsString = 'S');

    if FieldByName('sr_tipodatotarifacompetencia').AsString = 'A' then
      edCompetenciaPTMCostoFijo.Value            := FieldByName('sr_costofijocompetencia').AsFloat;

    if FieldByName('sr_tipodatotarifacompetencia').AsString = 'N' then
    begin
      edCompetenciaDECostoFijo.Value             := FieldByName('sr_costofijocompetencia').AsFloat;
      edCompetenciaDECostoVariable.Value         := FieldByName('sr_costovariablecompetencia').AsFloat;
    end;

    if FieldByName('sr_tipodatotarifacompetencia').AsString = 'S' then
    begin
      edCompetenciaF931CostoFijo.Value           := FieldByName('sr_costofijocompetencia').AsFloat;
      edCompetenciaF931CostoVariable.Value       := FieldByName('sr_costovariablecompetencia').AsFloat;
    end;

    edCPTMA.Value                                := FieldByName('sr_cptma').AsFloat;
    edResultadoMensualTrabajador.Value           := FieldByName('sr_costofinalcompetencia').AsFloat;
    edSumaFija.Value                             := FieldByName('sr_totalfijocompetencia').AsFloat;
    edPorcVariable.Value                         := FieldByName('sr_totalvariablecompetencia').AsFloat;
    memoObservaciones.Lines.Text                 := FieldByName('sr_observaciones').AsString;
    lbEstadoActual.Caption                       := FieldByName('estadosolicitud').AsString;
    memoInformacionComplementaria.Lines.Text     := FieldByName('sr_infocomplementaria').AsString;

    chkIltEmpleador.Checked                      := (FieldByName('sr_checkilt').AsString = 'S');
    chkFrecuencuaSiniestral.Checked              := (FieldByName('sr_checkfrecuenciasiniestral').AsString = 'S');
    chkJuicios.Checked                           := (FieldByName('sr_checkjuicios').AsString = 'S');
    chkIlp.Checked                               := (FieldByName('sr_checkilp').AsString = 'S');
    chkPrecioCompetencia.Checked                 := (FieldByName('sr_checkpreciocompetencia').AsString = 'S');
    chkTarifaUnificada.Checked                   := (FieldByName('sr_checktarifaunificada').AsString = 'S');
    edIndiceCombinado.Value                      := FieldByName('sr_indicecombinado').AsFloat;

    edCostoXTrabajadorCotizado.Value             := FieldByName('sr_costofinalcotizado').AsFloat;
    edCostoFijoCotizado.Value                    := FieldByName('sr_costofijocotizado').AsFloat;
    edPorcentajeVariableCotizado.Value           := FieldByName('sr_porcentajevariablecotizado').AsFloat;
    edComisionCotizada.Value                     := FieldByName('sr_comisioncotizada').AsFloat;
    fraMotivoRespuesta.Value                     := FieldByName('sr_idmotivocotizacion').AsInteger;
    memoObservacionesTecnica.Lines.Text          := FieldByName('sr_observacionestecnica').AsString;


    // Datos históricos..
    fraEstado.Value                               := FieldByName('hc_estado').AsString;
    edFechaVigenciaDesdeContrato.Date             := FieldByName('hc_vigenciadesde').AsDateTime;
    edCantidadContratosRescindidosFaltaPago.Value := FieldByName('cantcontratosbajafaltapago').AsInteger;
    edFechaBaja.Date                              := FieldByName('hc_fechabaja').AsDateTime;
    fraMotivoBaja.Value                           := FieldByName('hc_motivobaja').AsString;
    fraEjecutivo.Value                            := FieldByName('hc_idejecutivo').AsInteger;
    fraSector.Value                               := FieldByName('hm_sector').AsString;

    fraCiiu1.Value                                := FieldByName('hc_idactividad').AsInteger;
    CambiarActividadVieja(nil);

    fraCiiu2.Value                                := FieldByName('hc_idactividad2').AsInteger;
    fraCiiu3.Value                                := FieldByName('hc_idactividad3').AsInteger;
    edVigenciaTarifa.Date                         := FieldByName('sr_vigenciatarifa').AsDateTime;
    edPeriodo.Text                                := FieldByName('rc_periodonomina').AsString;
    edTrabajadores.Value                          := FieldByName('rc_empleados').AsInteger;
    edMasaSalarial.Value                          := FieldByName('rc_masasalarial').AsFloat;
    edVigenciaTarifaPendiente.Date                := FieldByName('sr_vigenciatarifapendiente').AsDateTime;
    edVigenciaIncumplimientoPendiente.Date        := FieldByName('sr_vigenciaincpendiente').AsDateTime;
    edSumaFijaPendiente.Value                     := FieldByName('sr_sumafijapendiente').AsFloat;
    edPorcentajeVariablePendiente.Value           := FieldByName('sr_porcvariablependiente').AsFloat;
    fraMotivoTarifaPendiente.Value                := FieldByName('sr_motivotarifapendiente').AsString;
    edValoresPendientesAcreditar.Value            := FieldByName('sr_valorespendientesacredit').AsFloat;
    edConcurso.Text                               := FieldByName('concurso').AsString;
    edQuiebra.Text                                := FieldByName('quiebra').AsString;

    if FieldByName('rc_empleados').AsInteger > 0 then
      edResultadoMensualTrabajadorActual.Value := ((FieldByName('rc_empleados').AsInteger * FieldByName('sr_costofijo').AsFloat) +
                                                   (FieldByName('rc_masasalarial').AsFloat * FieldByName('sr_porcentajevariable').AsFloat / 100)) / FieldByName('rc_empleados').AsInteger
    else
      edResultadoMensualTrabajadorActual.Clear;

    CalcularLimiteSSN;

    if IsComercial then
    begin
      if fraCanal.Value = 321 then   // Si es venta directa..
      begin
        edComision.DisplayFormat := '***';
        edComision.Enabled := False;
      end
      else
      begin
        edComision.DisplayFormat := '% ,0.00;-% ,0.00';
        edComision.Enabled := True;
      end;
    end;

    if IsTecnica then
      edCostoFijo.DisplayFormat := '$ ,0.00;-$ ,0.00'
    else
      edCostoFijo.DisplayFormat := '***';
  finally
    FCalcularValoresCotizados := True;
  end;
end;

procedure TfrmReAfiliacion.NotificarAComercial(const aMostrarConfirmacion: Boolean = True; const aRefrescarGrilla: Boolean = True);
var
  aBody: TStringList;
  aQuery: TSDQuery;
  sAsunto: String;
  sBody: String;
  sDirecciones: String;
  sDireccionesCliente: String;
  sDireccionRespuesta: String;
  sFileName: String;
  sNombreArchivoRevision: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    if aMostrarConfirmacion then
      if not MsgAsk('¿ Realmente desea notificar a Comercial ?') then
        Exit;

    sSql :=
      'UPDATE asr_solicitudreafiliacion' +
        ' SET sr_fechanotificacioncomercial = SYSDATE,' +
            ' sr_usunotificacioncomercial = :usuario, ' +
            ' sr_estadosolicitud = :estado' +
      ' WHERE sr_id = :Id';
    EjecutarSqlEx(sSql, [Sesion.UserID, EC_NOTIF_COMERCIAL, FieldByName('sr_id').AsInteger]);

    sSql := 'SELECT art.cotizacion.get_mailnotificacomercial(''R'', :idsolicitud) FROM DUAL';
    sDirecciones := ValorSqlEx(sSql, [FieldByName('sr_id').AsInteger]);

    sSql := 'SELECT art.cotizacion.get_mailnotificacliente(''R'', :idsolicitud) FROM DUAL';
    sDireccionesCliente := ValorSqlEx(sSql, [FieldByName('sr_id').AsInteger]);

    sAsunto := 'Solicitud de revisión de precio cotizada';

    if sDireccionesCliente <> '' then   // Si se le va a avisar al agente comercial, se lo informo a la gente de comercial..
      sBody := 'La siguiente revisión de precio ha sido cotizada y ya se le ha enviado un e-mail al agente comercial informándolo de dicha situación.'
    else
      sBody := 'La siguiente revisión de precio ha sido cotizada:';

    sBody := sBody + CRLF + CRLF +
      'Nº Solicitud: ' + FieldByName('sr_nrosolicitud').AsString + CRLF +
      'C.U.I.T.: ' + PonerGuiones(FieldByName('sr_cuit').AsString) + CRLF +
      'Razón Social: ' + FieldByName('hm_nombre').AsString + CRLF +
      'Entidad: ' + '(' + FieldByName('en_codbanco').AsString + ') ' + FieldByName('en_nombre').AsString + CRLF +
      'Vendedor: ' + '(' + FieldByName('ve_vendedor').AsString + ') ' + FieldByName('ve_nombre').AsString + CRLF +
      'Usuario Solicitud: ' + FieldByName('sr_usualta').AsString + CRLF;

    if FieldByName('sr_observacionestecnica').AsString <> '' then
      sBody := sBody + 'Observaciones de Técnica: ' + FieldByName('sr_observacionestecnica').AsString + CRLF;

    if FieldByName('sr_checkilt').AsString = 'S' then
      sBody := sBody + 'Condiciones particulares de ILT a consignarse en la ADDENDA respectiva.' + CRLF;

    if FieldByName('sr_checkfrecuenciasiniestral').AsString = 'S' then
      sBody := sBody + 'Alta Frecuencia Siniestral.' + CRLF;

    if FieldByName('sr_checkjuicios').AsString = 'S' then
      sBody := sBody + 'Alta Judicialidad.' + CRLF;

    if FieldByName('sr_checkilp').AsString = 'S' then
      sBody := sBody + 'Alta Frecuencia ILP.' + CRLF;

    if FieldByName('sr_checkpreciocompetencia').AsString = 'S' then
      sBody := sBody + 'El precio de la competencia es bajo para el riesgo a cotizar.' + CRLF;

    if FieldByName('sr_checktarifaunificada').AsString = 'S' then
      sBody := sBody + 'La tarifa es unificada para todo el grupo.' + CRLF;

    if (FieldByName('sr_indicecombinado').AsFloat > 100) and (FieldByName('sr_origenweb').AsString <> 'T') then
      sBody := sBody + 'IC = ' + FieldByName('sr_indicecombinado').AsString + '.' + CRLF;

    sBody := sBody + CRLF;
    NotificacionPorMail('', sBody, sAsunto, 'ASR', FieldByName('sr_id').AsInteger, sDirecciones);


    if sDireccionesCliente <> '' then   // Notifico al cliente..
    begin
	    sNombreArchivoRevision := IncludeTrailingBackslash(TempPath) + 'SolicitudRevision_' + FieldByName('sr_cuit').AsString + '.pdf';
  	  SetCurrentDir(TempPath);

      Application.CreateForm(TQRNotificacionClienteRevisionPrecios, QRNotificacionClienteRevisionPrecios);
      try
        QRNotificacionClienteRevisionPrecios.Preparar(sdqConsulta.FieldByName('sr_id').AsInteger, sNombreArchivoRevision);
      finally
        FreeAndNil(QRNotificacionClienteRevisionPrecios);
      end;

      sSql :=
        'UPDATE asr_solicitudreafiliacion' +
          ' SET sr_estadosolicitud = :estado,' +
              ' sr_fechanotificacioncliente = SYSDATE,' +
              ' sr_usunotificacioncliente = :usuario' +
        ' WHERE sr_id = :id';
      EjecutarSqlEx(sSql, [EC_NOTIF_CLIENTE, Sesion.UserID, FieldByName('sr_id').AsInteger]);

      sSql :=
        'SELECT NVL(se_mail, se_usuario) email' +
         ' FROM use_usuarios' +
        ' WHERE se_usuario = :usuario' +
    ' UNION ALL' +
       ' SELECT uw_mailavisoart' +
         ' FROM auw_usuarioweb' +
        ' WHERE uw_usuario = :usuario2';
      sDireccionRespuesta := ValorSqlEx(sSql, [FieldByName('sr_usualta').AsString, FieldByName('sr_usualta').AsString]);

      if EnviarEmailHtml(FieldByName('sr_idcanal').AsInteger, FieldByName('sr_identidad').AsInteger, sFileName) then
      begin
        aBody := TStringList.Create;
        with aBody do
        try
          if Is_ConectadoProduccion then
            LoadFromFile(PATH_FILE_NOTIFICACION_CLIENTE_PROD + sFileName)
          else
            LoadFromFile(PATH_FILE_NOTIFICACION_CLIENTE + sFileName);

          sSql :=
            'SELECT se_nombre, DECODE(se_delegacion, 840, ''011-4819-2800, interno 4980'', el_codareatelefonos || '' '' || el_telefonos) telefono' +
             ' FROM use_usuarios, del_delegacion' +
            ' WHERE se_delegacion = el_id(+)' +
              ' AND se_mail = :mail';
          aQuery := GetQueryEx(sSql, [sDireccionRespuesta]);
          try
            Text := StringReplace(Text, '{#CUIT#}', PonerGuiones(FieldByName('sr_cuit').AsString), [rfReplaceAll]);
            Text := StringReplace(Text, '{#EJECUTIVO#}', Nvl(aQuery.FieldByName('se_nombre').AsString, 'Provincia ART'), [rfReplaceAll]);
            Text := StringReplace(Text, '{#EMAIL_EJECUTIVO#}', Nvl(sDireccionRespuesta, 'atencionalcliente@provart.com.ar'), [rfReplaceAll]);
            Text := StringReplace(Text, '{#RAZON_SOCIAL#}', FieldByName('hm_nombre').AsString, [rfReplaceAll]);
            Text := StringReplace(Text, '{#TELEFONO_EJECUTIVO#}', Nvl(aQuery.FieldByName('telefono').AsString, '0800-333-1278'), [rfReplaceAll]);
          finally
            FreeAndNil(aQuery);
          end;

          unEnvioMail.EnviarMailBD(sDireccionesCliente, Format('Revisión de Precio - %s %s',
                                  [FieldByName('hm_nombre').AsString, PonerGuiones(FieldByName('sr_cuit').AsString)]),
                                  [oSinNotaAlPie, oDeleteAttach, oDisableBody, oDisableAdjuntos],
                                  [sNombreArchivoRevision], Text, 0, tcDefault, True, False, 2500, -1, [], '', True, sDireccionRespuesta, 'ASR', FieldByName('sr_id').AsInteger);
        finally
          Free;
        end;
      end
      else
    	  EnviarMail(sDireccionesCliente, 'Solicitud Revisión: ' + FieldByName('hm_nombre').AsString,
                   Sesion.UserID, [oForceDB, TOpcionARTMail(oAlwaysShowDialog), TOpcionARTMail(oDeleteAttach)],
                   'Provincia ART', [sNombreArchivoRevision], FieldByName('sr_contrato').AsInteger, True, 'ASR', FieldByName('sr_id').AsInteger, sDireccionRespuesta);
    end;

    if aRefrescarGrilla then
      ActualizarConsulta;
  end;
end;

procedure TfrmReAfiliacion.OcultarCampos(const aOcultar: Boolean; aControls: Array of TControl);
var
  iLoop: Integer;
begin
  for iLoop := Low(aControls) to High(aControls) do
    aControls[iLoop].Visible := not aOcultar;
end;

procedure TfrmReAfiliacion.RecalcularComision;
begin
  FComisionCalculada := False;
  edComision.Clear;
end;

procedure TfrmReAfiliacion.RefreshData;
var
  sSql: String;
begin
  sSql :=
    'SELECT asr.*, cac1.ac_descripcion actividad1, cac1.ac_codigo ciiu1, sr_deuda deuda,' +
          ' DECODE(NVL(sr_costofinalcompetencia, 0), 0, 0, (DECODE(rc_empleados, 0, 0, ((rc_empleados * sr_costofijo) + (rc_masasalarial * sr_porcentajevariable / 100)) / NVL(rc_empleados, 1)) - sr_costofinalcompetencia)) diferenciapesos,' +
          ' DECODE(NVL(sr_costofinalcompetencia, 0), 0, 0, DECODE(rc_empleados, 0, 0, ((rc_empleados * sr_costofijo) + (rc_masasalarial * sr_porcentajevariable / 100))) - (sr_costofinalcompetencia * NVL(rc_empleados, 0))) diferenciapesosmensual,' +
          ' DECODE(NVL(sr_costofinalcompetencia, 0), 0, 0, (sr_costofinalcompetencia / DECODE(rc_empleados, 0, 1, ((rc_empleados * sr_costofijo) + (rc_masasalarial * sr_porcentajevariable / 100)) / NVL(rc_empleados, 1))) - 1) * 100 diferenciaporcentaje,' +
          ' DECODE(NVL(sr_costofinalcotizado, 0),' +
                 ' 0, 0,' +
                 ' sr_costofinalcotizado' +
                 ' - (DECODE(DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores), 0, 0,' +
                          ' ((DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores) * sr_costofijo)' +
                           ' +(DECODE(NVL(sr_masasalarial, 0), 0, rc_masasalarial, sr_masasalarial) * sr_porcentajevariable / 100))' +
                          ' / DECODE(NVL(sr_canttrabajadores, 0), 0, DECODE(rc_empleados, 0, 1, NVL(rc_empleados, 1)), sr_canttrabajadores)))) diferenciapesosrecoti,' +
          ' (DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores) * sr_costofinalcotizado)' +
          ' - (DECODE(DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores), 0, 0,' +
                  ' ((DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores) * sr_costofijo)' +
                    ' +(DECODE(NVL(sr_masasalarial, 0), 0, rc_masasalarial, sr_masasalarial) * sr_porcentajevariable / 100)))) diferenciapesosmensualrecoti,' +
          ' (((sr_costofinalcotizado' +
             ' / DECODE(DECODE(NVL(sr_canttrabajadores, 0), 0, DECODE(rc_empleados, 0, 1, NVL(rc_empleados, 1)), sr_canttrabajadores), 0, 0,' +
                      ' ((DECODE(NVL(sr_canttrabajadores, 0), 0, DECODE(rc_empleados, 0, 1, NVL(rc_empleados, 1)), sr_canttrabajadores) * decode(sr_costofijo, 0, 1, sr_costofijo))' +
                      ' +(DECODE(NVL(sr_masasalarial, 0), 0, rc_masasalarial, sr_masasalarial) * sr_porcentajevariable / 100))' +
                      ' / DECODE(NVL(sr_canttrabajadores, 0), 0, DECODE(rc_empleados, 0, 1, NVL(rc_empleados, 1)), sr_canttrabajadores)))' +
             ' - 1)' +
            ' * 100) diferenciaporcentajerecoti,' +
          ' DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores) empleados,' +
          ' DECODE(sr_estadosolicitud, ''00'', ''Pendiente de Revisión'', est.tb_descripcion) estadosolicitud,' +
          ' hc_estado, hc_fechabaja, hc_idactividad, hc_idactividad2, hc_idactividad3, hc_idejecutivo, rc_masasalarial, hc_motivobaja, rc_empleados, rc_periodonomina, hm_nombre,' +
          ' hm_sector, ge_descripcion holding, DECODE(NVL(sr_masasalarial, 0), 0, rc_masasalarial, sr_masasalarial) masasalarial, cotba.tb_descripcion motivonosecotiza,' +
          ' DECODE(DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores), 0, 0,' +
                 ' ((DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores) * sr_costofijo) +' +
                 ' (DECODE(NVL(sr_masasalarial, 0), 0, rc_masasalarial, sr_masasalarial) * sr_porcentajevariable / 100))) primamensual,' +
          ' DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores) * sr_costofinalcotizado primamensualcotizada,' +
          ' (sr_costofinalcompetencia * DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores)) primamensualcompetencia,' +
          ' DECODE(DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores), 0, 0,' +
                 ' ((DECODE(NVL(sr_canttrabajadores, 0), 0, rc_empleados, sr_canttrabajadores) * sr_costofijo) + (DECODE(NVL(sr_masasalarial, 0), 0, rc_masasalarial, sr_masasalarial) * sr_porcentajevariable / 100))' +
                 ' / DECODE(NVL(sr_canttrabajadores, 0), 0, DECODE(rc_empleados, 0, 1, NVL(rc_empleados, 1)), sr_canttrabajadores)) primapersona,' +
          ' rs_detalle motivorespuesta, ms_detalle motivosolicitud, sr_costofijo, sr_porcentajevariable, ms_codigo,' +
          ' DECODE(rd_autorizado, ''S'', ''SI'', DECODE(rd_autorizado, ''N'', ''NO'', '' '')) autorizo, rd_fechaautorizacion, rd_usuarioautorizo, rd_observacioncobranza,' +
          ' DECODE(au_autorizado, ''S'', ''SI'', DECODE(au_autorizado, ''N'', ''NO'', '' '')) autorizocomercial, au_fechaautorizacion, au_usuarioautorizo,' +
          ' au_observacionrespuesta observacioncomercial, art.utiles.get_superiorencasacentral(sr_usualta) superiorencasacentral, ca_descripcion canal, xen.en_nombre entidad,' +
          ' TRIM(legales.get_fechaconcurso(sr_cuit) || '' ('' || utiles.periodo_ponerbarra(legales.get_periodoconcurso(sr_cuit)) || '')'') concurso,' +
          ' TRIM(legales.get_fechaquiebra(sr_cuit) || '' ('' || utiles.periodo_ponerbarra(legales.get_periodoquiebra(sr_cuit)) || '')'') quiebra,' +
          ' stbcr.tb_codigo statusbcra, (SELECT COUNT(*)' +
                                         ' FROM aco_contrato, aem_empresa' +
                                        ' WHERE co_idempresa = em_id' +
                                          ' AND co_estado = 6' +
                                          ' AND co_motivobaja = ''08''' +
                                          ' AND em_cuit = sr_cuit) cantcontratosbajafaltapago, fo_formulario, fo_fechaalta, hc_vigenciadesde, el_nombre,' +
          ' DECODE(sr_idformulario, NULL, NULL, ''Sí'') tienesolicitudafiliacion, sr_idformulario,' +
          ' (SELECT FLOOR(SYSDATE - fo_fechaalta)' +
             ' FROM afo_formulario' +
            ' WHERE fo_id = sr_idformulario) dias_suscripcionafi, cac1.ac_idtiporiesgo,' +
          ' reusa.tb_descripcion usuarioautorizacion, stsrt.tb_codigo statussrt,' +
          ' DECODE(sr_checkilt, ''S'', ''SÍ'', ''NO'') checkilt, DECODE(sr_checkilp, ''S'', ''SÍ'', ''NO'') checkilp,' +
          ' sr_indicecombinado, DECODE(co_idestudio, NULL, rd_fechaautorizacion, NULL) fechaautorizacioncobranzas,' +
          ' DECODE(co_idestudio, NULL, rd_usuarioautorizo, NULL) usuarioautorizacioncobranzas,' +
          ' DECODE(co_idestudio, NULL, NULL, rd_fechaautorizacion) fechaautorizacionlegales,' +
          ' DECODE(co_idestudio, NULL, NULL, rd_usuarioautorizo) usuarioautorizacionlegales, sr_idmotivocotizacion, rc_empleados, rc_masasalarial, rc_periodonomina,' +
          ' DECODE(co_idtiporegimen, 2, ''RÉGIMEN ESPECIAL'', 3, ''RÉGIMEN MIXTO'', '''') tiporegimen, en_codbanco, en_nombre, ve_vendedor, ve_nombre' +
     ' FROM asr_solicitudreafiliacion asr, ams_motivosolicreafiliacion, ars_respuestasolicreafiliacion, age_grupoeconomico, cac_actividad cac1, ctb_tablas est, ctb_tablas cotba,' +
          ' ctb_tablas stbcr, ahc_historicocontrato, ahm_historicoempresa, art.ard_autorizarevisioncondeuda, art.aau_autorizarevision, aca_canal, xen_entidad xen, afo_formulario,' +
          ' xve_vendedor, del_delegacion, ctb_tablas reusa, ctb_tablas stsrt, aco_contrato, afi.aet_endosotarifario et, zrc_resumencobranza_ext' +
    ' WHERE sr_idhistoricocontrato = hc_id' +
      ' AND sr_idresumencobranza = rc_id(+)' +
      ' AND ms_id(+) = sr_idmotivosolicitud' +
      ' AND rs_id(+) = sr_idmotivocotizacion' +
      ' AND ge_id(+) = sr_idholding' +
      ' AND cac1.ac_id = NVL (sr_idactividad1, hc_idactividad)' +
      ' AND est.tb_codigo(+) = sr_estadosolicitud' +
      ' AND est.tb_clave = ''ACOES''' +
      ' AND cotba.tb_codigo(+) = sr_motivonosecotiza' +
      ' AND cotba.tb_clave(+) = ''COTBA''' +
      ' AND stbcr.tb_id(+) = sr_idstatusbcra' +
      ' AND sr_idhistoricoempresa = hm_id' +
      ' AND sr_id = rd_idsolicitudrevision(+)' +
      ' AND (   rd_id = (SELECT MAX(rd_id)' +
                         ' FROM art.ard_autorizarevisioncondeuda' +
                        ' WHERE rd_idsolicitudrevision = sr_id)' +
           ' OR rd_id IS NULL)' +
      ' AND sr_id = au_idsolicitudrevision(+)' +
      ' AND (   au_id = (SELECT MAX(au_id)' +
                         ' FROM art.aau_autorizarevision' +
                        ' WHERE au_idsolicitudrevision = sr_id)' +
           ' OR au_id IS NULL)' +
      ' AND sr_idcanal = ca_id(+)' +
      ' AND sr_identidad = xen.en_id(+)' +
      ' AND sr_idformulario = fo_id(+)' +
      ' AND sr_idvendedor = ve_id(+)' +
      ' AND ve_iddelegacion = el_id(+)' +
      ' AND reusa.tb_clave(+) = ''REUSA''' +
      ' AND reusa.tb_codigo(+) = sr_puestoautorizacion' +
      ' AND stsrt.tb_id(+) = sr_idstatussrt' +
      ' AND sr_contrato = co_contrato(+)' +
      ' AND sr_id = et.et_idrevisionprecios (+)' +
      ' AND art.cotizacion.essuscripciones(sr_usualta, ' + SqlValue(Sesion.UserID) + ') = 1';

  sSql := sSql + DoFiltroComponente(edNumeroSolicitudBusqueda, 'SR_NROSOLICITUD') +
                 DoFiltroComponente(fraUsuarioSolicitoBusqueda, 'SR_USUALTA') +
                 DoFiltroComponente(fraUsuarioAsignadoBusqueda, 'SR_USUASIGNADO') +
                 DoFiltroComponente(fraUsuarioAutorizacionBusqueda, 'SR_USUARIOAUTORIZACION') +
                 DoFiltroComponente(fraEntidadBusqueda, 'SR_IDENTIDAD') +
                 DoFiltroComponente(fraSucursalBusqueda, 'SR_IDSUCURSAL') +
                 DoFiltroComponente(fraCentroRegBusqueda, 'SR_IDCENTROREGIONAL') +
                 DoFiltroComponente(fraVendedorBusqueda, 'SR_IDVENDEDOR') +
                 DoFiltroComponente(fraMotivoSolicitudBusqueda, 'SR_IDMOTIVOSOLICITUD') +
                 DoFiltroComponente(fraMotivoRespuestaBusqueda, 'SR_IDMOTIVOCOTIZACION') +
                 SqlBetweenDateTime(' AND sr_fechaalta', edFechaSolicitudDesde.Date, edFechaSolicitudHasta.Date, True) +
                 SqlBetweenDateTime(' AND sr_fechanotificacioncomercial', edFechaRespuestaComercialDesde.Date, edFechaRespuestaComercialHasta.Date, True) +
                 DoFiltroComponente(edNumeroSolicitudAfiliacion, 'FO_FORMULARIO') +
                 SqlBetweenDateTime(' AND FO_FECHAALTA', edFechaAprobacionAutomaticaDesde.Date, edFechaAprobacionAutomaticaHasta.Date, True) +
                 SqlBetweenDateTime(' AND sr_fechaconfeccion', edFechaConfeccionDesde.Date, edFechaConfeccionHasta.Date, True) +
                 SqlBetweenDateTime(' AND sr_fechasuspension', edFechaSuspensionDesde.Date, edFechaSuspensionHasta.Date, True);

  if checkEnTramite.Checked then
    sSql := sSql + ' AND EXISTS (SELECT 1 FROM asa_solicitudafiliacion WHERE sa_idformulario = fo_id AND sa_estado = ''20'')';

  if not fraEmpresaBusqueda.IsEmpty then
    sSql := sSql + ' AND sr_cuit = ' + SqlValue(fraEmpresaBusqueda.CUIT);

  if not fraCanalBusqueda.IsEmpty then
    sSql := sSql + ' AND sr_idcanal ' + fraCanalBusqueda.InSql;

  if not fraDelegacionBusqueda.IsEmpty then
    sSql := sSql + ' AND ve_iddelegacion ' + fraDelegacionBusqueda.InSql;

  if chkUltimaSolicitud.Checked then
    sSql := sSql + ' AND asr.sr_id = (SELECT MAX(sr.sr_id) FROM art.asr_solicitudreafiliacion sr WHERE sr.sr_contrato = asr.sr_contrato)';

  if cbEstadoBusqueda.Text <> '' then
    sSql := sSql + ' AND sr_estadosolicitud ' + cbEstadoBusqueda.InSql;

  if checkEntidadesEnTramite.Checked then
    sSql := sSql + ' AND en_entramite = ''S''';

  if chkConTarifaCargada.Checked then
    sSql := sSql + ' AND NVL(sr_costofijocotizado, 0) > 0';

  if not fraHoldingBusqueda.IsEmpty then
    sSql := sSql + ' AND sr_idholding = ' + SqlValue(fraHoldingBusqueda.Value);

  if IsTecnica then
  begin
// Pedido de HMartin el 14.11.8..
//    sSql := sSql + ' AND sr_estadosolicitud NOT IN (' + SqlValue(EC_PEND_AUTO_COBRANZA) + ', ' + SqlValue(EC_PEND_AUTO_LEGALES) + ')' +
    sSql := sSql + ' AND sr_estadosolicitud <> ' + SqlValue(EC_PEND_AUTO);

    // Esto es para que no vean los pedidos hechos desde la web hasta que comercial no guarde los datos correctamente..
// Comentado el 25.1.2011 a pedido de técnica..
//    sSql := sSql + ' AND ((sr_origenweb = ''F'') OR (sr_origenweb = ''T'' AND sr_fechamodif IS NOT NULL))';
  end;

  //**Filtro de endosos
  if tbFiltrarEndosos.Down then
  begin
    if IsTecnica then
      sSql := sSql + ' AND (et_estado = ''1.0'' OR et_estado = ''2.0'' OR et_estado = ''4.1'')'
    else
      sSql := sSql + ' AND (et_estado = ''1.0'' OR et_estado = ''4.1'')';
  end;


  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CalcularTotales;
  CheckButtons;
end;

procedure TfrmReAfiliacion.SavePhotoEstadoCuenta(const aId, aContrato: Integer);
var
  bConAmortizacion: Boolean;
  bConIntConcQuiebra: Boolean;
  bConPreview: Boolean;
  bSinConcQuiebra: Boolean;
  bSinReclamoAFIP: Boolean;
  sParametros: String;
  sTipoEstCta: String;
  sTipoResumen: String;
begin
  sParametros := Get_Parametros_EstadoCuentaCC;   // Se imprime el mismo estado de cuenta que el de la carta comercial..
  Get_Parametros_EstadoCuentaCartaComercial(sParametros, sTipoEstCta, sTipoResumen, bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra, bConPreview);

  sTipoResumen := 'total';

  Generar_EstadoCuenta(sTipoEstCta, sTipoResumen, bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra, bConPreview, aContrato, False, True, aId, taReafiliacion);
end;

procedure TfrmReAfiliacion.SendAlerts(const aSolicitudId: Integer);
var
  sSql: String;
begin
  if Sesion.Delegacion <> 840 then    // Si no es de capital salgo porque no se puede conectar..
    Exit;

  sSql :=
    'SELECT s.terminal' +
     ' FROM v$session s, use_usuarios' +
    ' WHERE UPPER(s.osuser) = UPPER(se_usuario)' +
      ' AND UPPER(s.terminal) <> (SELECT UPPER(SYS_CONTEXT(''USERENV'', ''TERMINAL''))' +
                                  ' FROM DUAL)' +
      ' AND UPPER(s.program) LIKE UPPER(''COTIZACI%'')' +
      ' AND se_sector = ''TECNICO''';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      frmPrincipal.SendMsgBySocket(FieldByName('terminal').AsString, IntToStr(aSolicitudId));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmReAfiliacion.SetArea;		// 1 - Comercial, 2 - Técnica..
begin
  FSector := MenuItem.Tag;

  btnTarifador2014.Visible := IsTecnica;
  fraCanal.FiltraUsuario   := not IsTecnica;

  Grid.ColumnByField['cantcontratosbajafaltapago'].Visible   := IsTecnica;
  Grid.ColumnByField['deuda'].Visible                        := IsTecnica;
  Grid.ColumnByField['diferenciapesos'].Visible              := IsTecnica;
  Grid.ColumnByField['diferenciapesosmensual'].Visible       := IsTecnica;
  Grid.ColumnByField['diferenciapesosmensualrecoti'].Visible := IsTecnica;
  Grid.ColumnByField['diferenciapesosrecoti'].Visible        := IsTecnica;
  Grid.ColumnByField['diferenciaporcentaje'].Visible         := IsTecnica;
  Grid.ColumnByField['diferenciaporcentajerecoti'].Visible   := IsTecnica;
  Grid.ColumnByField['primamensual'].Visible                 := IsTecnica;
  Grid.ColumnByField['primapersona'].Visible                 := IsTecnica;
  Grid.ColumnByField['sr_autocostofinal'].Visible            := IsTecnica;
  Grid.ColumnByField['sr_autoporcvariable'].Visible          := IsTecnica;
  Grid.ColumnByField['sr_autosumafija'].Visible              := IsTecnica;
  Grid.ColumnByField['sr_costofijo'].Visible                 := IsTecnica;
  Grid.ColumnByField['sr_porcentajevariable'].Visible        := IsTecnica;
  Grid.ColumnByField['sr_valorespendientesacredit'].Visible  := IsTecnica;
  Grid.ColumnByField['statusbcra'].Visible                   := IsTecnica;

  if IsComercial then
  begin
    gbInformacionComplementaria.Visible  := False;
    tbAsignarUsuario.Enabled             := False;
    tbAutorizarNotificar.Enabled         := False;
    tbCambiarUsuarioAutorizacion.Enabled := False;
    tbEstadoCuenta.Enabled               := False;
    tbNotificar.Hint                     := 'Notificar al Cliente';
    tbSuspension.Enabled                 := False;
    tbTarifa.Enabled                     := False;
  end;

  if IsTecnica then
  begin
    gbInformacionComplementaria.Visible   := True;
    tbNotificar.Hint                      := 'Notificar a Comercial';
    tbNuevo.Enabled                       := False;
    tbRedireccionSolicitudPermiso.Enabled := False;
    GetEstadosDeCuenta;
  end;

  LockControl(pnComercial, not IsComercial);
  LockControl(pnTecnica, not IsTecnica);

  LockControls([gbSolicitud, fraEstado, edFechaVigenciaDesdeContrato, edCantidadContratosRescindidosFaltaPago, edCostoFijo, edFechaBaja, fraMotivoBaja, edComision, edAcpo, fraEjecutivo,
                fraSector, gbCiiuActual, edMasaDivididaTrabajador, edTrabajadoresTotalNuevo, edMasaSalarialTotalNuevo, fraCiiu1DigitoNuevo, gbValoresTarifario, gbValoresTarifarioSSN,
                gbLimiteSSN], True);
  VCLExtra.EnableControls([edResultadoMensualTrabajador, edSumaFija, edPorcVariable, edCPTMA], False);
  VCLExtra.EnableControls([btnUltimaComisionContrato, gbObservaciones, gbValoresCotizados], True);
  VCLExtra.EnableControls([gbPedidoACobranzasOLegales, gbPedidoAComercial], not IsComercial);
  VCLExtra.EnableControls([tbNoSeCotiza], IsTecnica);

  VCLExtra.EnableControls([edMasaDivididaTrabajador, edTrabajadoresTotalNuevo, edMasaSalarialTotalNuevo], False);


  if IsTecnica then
  begin
    LockControls([fraStatusBCRA, fraStatusSrt, ToolbarBCRA], False);
  end;

  //pnlEndoso.Caption := 'Pendientes:' + IntToStr(CountEndosoPendientes)+ ' ';
  lbPendientes.Caption := 'Pendientes:' + IntToStr(CountEndosoPendientes)+ ' ';

end;

function TfrmReAfiliacion.ValidarNotificacionAComercial: Boolean;
var
  sSql: String;
begin
  with sdqConsulta do
  begin
    Verificar((FieldByName('sr_estadosolicitud').AsString <> EC_AUTORIZADA), Grid, Format('[Solicitud Nº %d] La solicitud no se encuentra en el estado apropiado.', [FieldByName('sr_nrosolicitud').AsInteger]));

    if (not FieldByName('sr_idmotivosolicitud').AsInteger in [4, 5]) or
         ((FieldByName('sr_idmotivosolicitud').AsInteger = 8) and (FieldByName('sr_idmotivocotizacion').AsInteger = 28)) then
      Verificar((FieldByName('sr_costofinalcotizado').IsNull) and (FieldByName('sr_costofijocotizado').IsNull) and
                (FieldByName('sr_porcentajevariablecotizado').IsNull), Grid, Format('[Solicitud Nº %d] La solicitud no ha sido cotizada.', [FieldByName('sr_nrosolicitud').AsInteger]));

    if not Seguridad.Claves.IsActive('PermisoAutorizarCargadasMismoUsuario') then
      Verificar((FieldByName('sr_usuariotarifa').AsString = Sesion.UserID), Grid,
                Format('[Solicitud Nº %d] La solicitud no puede notificarse a Comercial ya que el usuario de carga de tarifa fue usted.', [FieldByName('sr_nrosolicitud').AsInteger]));

    sSql :=
      'SELECT 1' +
       ' FROM art.als_limitessn, cac_actividad' +
      ' WHERE ls_idactividad = ac_id' +
        ' AND ac_codigo = SUBSTR(art.hys.get_codactividadrevdos(:idactividad), 1, 1)' +
        ' AND ((:costofijocotizado - 0.6) / (:masasalarial / :canttrabajador * 100) + :finalporcmasa) BETWEEN ls_minimo AND ls_maximo' +
        ' AND art.actualdate BETWEEN ls_fechadesde AND ls_fechahasta' +
        ' AND ls_fechabaja IS NULL';
    if not ExisteSqlEx(sSql, [IIF((FieldByName('sr_idactividad1').AsInteger = 0), FieldByName('hc_idactividad').AsInteger, FieldByName('sr_idactividad1').AsInteger),
                              FieldByName('sr_costofijocotizado').AsFloat,
                              IIF((FieldByName('sr_masasalarial').AsInteger = 0), FieldByName('rc_masasalarial').AsFloat, FieldByName('sr_masasalarial').AsFloat),
                              IIF((FieldByName('sr_canttrabajadores').AsInteger = 0), FieldByName('rc_empleados').AsInteger, FieldByName('sr_canttrabajadores').AsInteger),
                              FieldByName('sr_porcentajevariablecotizado').AsFloat]) then
      if MsgBox('El porcentaje variable se encuentra por fuera de los límites de la SSN según la resolución 38064/2013. ¿ Desea continuar ?', MB_YESNO + MB_ICONSTOP, 'Aviso importante') <> MRYES then
        Abort;
  end;

  Result := True;
end;

function TfrmReAfiliacion.ValidarRevision(const aIdRevision: Integer): TRecValidacion;
begin
  with sdspValidarRevision do
  begin
    ParamByName('cesclonacion').AsString               := 'F';
    ParamByName('corigen').AsString                    := 'D';
    ParamByName('ctipodatocompetencia').AsString       := IIF(rbPagoTotalMensual.Checked, 'A', IIF(rbDatosEmpresa.Checked, 'N', IIF(rbFormulario931.Checked, 'S', '')));
    ParamByName('ctiposolicitud').AsString             := 'R';
    ParamByName('cvalidarcomision').AsString           := IIF((not FComisionCalculada), 'T', 'F');
    ParamByName('nbcra').AsInteger                     := fraStatusBCRA.Value;
    ParamByName('ncant_trabajador').AsInteger          := IIF((edTrabajadoresTotalNuevo.Value = 0), edTrabajadores.Value, edTrabajadoresTotalNuevo.Value);
    ParamByName('ncant_trabajadornuevo').AsInteger     := edTrabajadoresTotalNuevo.Value;
    ParamByName('ncomision').AsFloat                   := edComision.Value;
    ParamByName('ncontrato').AsInteger                 := fraEmpresa.Contrato;
    ParamByName('nid').AsInteger                       := IIF((ModoABM = maAlta), 0, aIdRevision);
    ParamByName('nid_ciiu').AsInteger                  := fraCiiu1.Value;
    ParamByName('nid_ciiunuevo').AsInteger             := fraCiiuNuevo1.Value;
    ParamByName('nid_ciiunuevo2').AsInteger            := fraCiiuNuevo2.Value;
    ParamByName('nid_ciiunuevo3').AsInteger            := fraCiiuNuevo3.Value;
    ParamByName('nidartanterior').AsInteger            := fraArtAnterior.Value;
    ParamByName('nidcanal').AsInteger                  := fraCanal.Value;
    ParamByName('nidentidad').AsInteger                := fraEntidad.Value;
    ParamByName('nidholding').AsInteger                := fraHolding.Value;
    ParamByName('nidsector').AsInteger                 := StrToIntDef(fraSector.Value, 0);
    ParamByName('nidsucursal').AsInteger               := fraSucursal.Value;
    ParamByName('nidvendedor').AsInteger               := fraVendedor.Value;
    ParamByName('nmasasalarialnuevo').AsFloat          := edMasaSalarialTotalNuevo.Value;
    ParamByName('nmotivosolicitud').AsInteger          := fraMotivoSolicitud.Value;
    ParamByName('nresultadomensualtrabajador').AsFloat := edResultadoMensualTrabajador.Value;
    ParamByName('nsrt').AsInteger                      := ValorSqlIntegerEx('SELECT tb_codigo FROM ctb_tablas WHERE tb_id = :id', [fraStatusSRT.Value]);
    ParamByName('sactividadreal').AsString             := edActividadReal.Text;
    ParamByName('scodigomotivosolicitud').AsString     := fraMotivoSolicitud.Codigo;
    ParamByName('scontacto').AsString                  := edContacto.Text;
    ParamByName('scuit').AsString                      := fraEmpresa.CUIT;
    ParamByName('sestado').AsString                    := fraEstado.Value;
    ParamByName('sobservaciones').AsString             := memoObservaciones.Lines.Text;
    ParamByName('sprestacionesespeciales').AsString    := 'N';
    ParamByName('srazonsocial').AsString               := fraEmpresa.RazonSocial;
    ParamByName('ssector').AsString                    := Sesion.Sector;

    ExecProc;

    with Result do
    begin
      Advertencia      := (ParamByName('sadvertencia').AsString = 'A');
      ContinuarCarga   := ParamByName('scontinuarcarga').AsString;
      DescripcionError := ParamByName('serror').AsString;
      NumeroError      := ParamByName('nerror').AsInteger;
      VerificaTecnica  := (ParamByName('sverificatecnica').AsString = 'S');
    end;
  end;
end;

procedure TfrmReAfiliacion.VerificarTarifarioSSN;
var
  PorcSSN: Currency;
  TarSSN: Currency;
begin
  TarifaSSN('2', IIF(fraCiiuNuevo1.IsEmpty, fraCiiu1.Value, fraCiiuNuevo1.Value), DBDate, TarSSN, PorcSSN);
  TarSSN := TarSSN * 1.15 + 0.60;
  PorcSSN := PorcSSN * 1.15;

  if edCostoFijoCotizado.Value > TarSSN then
    if MsgBox('La suma fija se encuentra 15% por encima del valor dado por la SSN. ¿ Desea continuar ?', MB_YESNO + MB_ICONINFORMATION, 'Atención') <> MRYES then
      Abort;

  if edPorcentajeVariableCotizado.Value > PorcSSN then
    if MsgBox('El porcentaje se encuentra 15% por encima del valor dado por la SSN. ¿ Desea continuar ?', MB_YESNO + MB_ICONINFORMATION, 'Atención') <> MRYES then
      Abort;
end;


procedure TfrmReAfiliacion.FormCreate(Sender: TObject);
begin
  inherited;

  FCalcularValoresCotizados := True;
  FComisionCalculada := False;
//  FIdArtAnterior := 0;

  Values[16] := Null;

  ShowActived := False;

  fraArtAnterior.TableName   := 'aar_art';
  fraArtAnterior.FieldID     := 'ar_id';
  fraArtAnterior.FieldCodigo := 'ar_id';
  fraArtAnterior.FieldDesc   := 'ar_nombre';
  fraArtAnterior.FieldBaja   := 'ar_fechabaja';

  fraAsignarUsuario.Value            := frmPrincipal.DBLogin.UserID;
  fraAsignarUsuario.Sector           := 'TECNICO';
  fraCanal.OnChange                  := CambiarCanal;
  fraCentroReg.OnChange              := CambiarCentroReg;
  fraCentroRegBusqueda.OnChange      := CambiarCentroRegBusqueda;

  fraCiiu1.OnChange                  := CambiarActividadVieja;

  fraCiiu1Digito.ExtraCondition      := ' AND LENGTH(ac_codigo) = 1';
  fraCiiu1Digito.OnChange            := CambiarLimitesSSN;

  fraCiiu1DigitoNuevo.ExtraCondition := ' AND LENGTH(ac_codigo) = 1';
  fraCiiu1DigitoNuevo.OnChange       := CambiarLimitesSSN;

  fraCiiuNuevo1.FieldBaja            := 'ac_fechabaja';
  fraCiiuNuevo1.OnChange             := CambiarActividad;

  fraCiiuNuevo2.FieldBaja            := 'ac_fechabaja';

  fraCiiuNuevo3.FieldBaja            := 'ac_fechabaja';

  fraEmpresa.OnChange                := CambiarEmpresa;
  fraEmpresa.ShowBajas               := True;
  fraEmpresaBusqueda.ShowBajas       := True;
  fraEntidad.OnChange                := CambiaEntidad;
  fraEntidadBusqueda.OnChange        := CambiaEntidadBusqueda;
  fraEstado.Clave                    := 'AFEST';
  fraMotivoBaja.Clave                := 'MOTIB';
  fraMotivoNoSeCotiza.Clave          := 'COTBA';
  fraMotivoSolicitud.OnChange        := CambiarMotivoSolicitud;
  fraMotivoTarifaPendiente.Clave     := 'MOTEN';
  fraSector.Clave                    := 'SECT';
  fraSector.OnChange                 := CambiaSector;
  fraStatusSrt.OnChange              := CambiaStatusSrt;
  fraSucursal.OnChange               := CambiarSucursal;
  fraSucursalBusqueda.OnChange       := CambiarSucursalBusqueda;
  fraUsuarioAsignadoBusqueda.Sector  := 'TECNICO';
  fraVendedor.ShowBajasEntVend       := False;
  fraVendedor.OnChange               := CambiaVendedor;

  with fraGestor do
  begin
    TableName   := 'use_usuarios';
    FieldID     := 'se_id';
    FieldCodigo := 'se_usuario';
    FieldDesc   := 'gc_nombre';
    FieldBaja   := 'se_fechabaja';
    Sql         :=
      'SELECT *' +
       ' FROM (SELECT se_usuario codigo, gc_nombre descripcion, se_id ID, se_fechabaja baja, se_id, se_fechabaja' +
               ' FROM agc_gestorcuenta, use_usuarios' +
              ' WHERE LOWER(gc_direlectronica) = LOWER(se_mail)' +
                ' AND gc_estudio = ''N''' +
                ' AND se_sector = ''COB''' +
                ' AND se_fechabaja IS NULL' +
          ' UNION ALL' +
             ' SELECT se_usuario, UPPER(se_nombre), se_id, se_fechabaja, se_id, se_fechabaja' +
               ' FROM use_usuarios' +
              ' WHERE se_usuario IN(''NBOTTEGAL'', ''GMAMBERTO'')) use_usuarios' +
      ' WHERE 1 = 1';
  end;

  with fraGestor2 do
  begin
    TableName   := 'afi.aul_usuariosrevisionlegales';
    FieldID     := 'ul_id';
    FieldCodigo := 'se_usuario';
    FieldDesc   := 'se_nombre';
    FieldBaja   := 'ul_fechabaja';
    Sql         :=
      'SELECT *' +
       ' FROM (SELECT se_usuario codigo, se_nombre descripcion, se_id ID, ul_fechabaja baja, se_id, ul_fechabaja' +
               ' FROM afi.aul_usuariosrevisionlegales, use_usuarios' +
              ' WHERE ul_usuario = se_usuario' +
                ' AND ul_fechabaja IS NULL' +
                ' AND se_fechabaja IS NULL) use_usuarios' +
      ' WHERE 1 = 1';
  end;

  fraUsuarioAutorizacionBusqueda.Propiedades.Sql :=
    'SELECT ID, codigo, descripcion, baja' +
     ' FROM (SELECT ac_usuario as ' + CD_ALIAS_ID + ', ac_usuario as ' + CD_ALIAS_CODIGO + ', tb_descripcion as ' + CD_ALIAS_DESC + ', ac_fechabaja as ' + CD_ALIAS_BAJA +
             ' FROM art.aac_autorizacotiza aac, ctb_tablas' +
            ' WHERE tb_clave = ''REUSA''' +
              ' AND ac_puesto = tb_codigo) tabla' +
    ' WHERE 1 = 1';

  pnlEndoso.Left                     := 31;
  ToolButton2.Left                   := 31;
  tbSumatoria.Left                   := 31;
  tbSalir.Left                       := 31;
  ToolButton8.Left                   := 31;
  tbBuscarEmails.Left                := 31;
  tbEventos.Left                     := 31;
  tbTarifa.Left                      := 31;
  tbEstadoCuenta.Left                := 31;
  tbRedireccionSolicitudPermiso.Left := 31;
  tbCambioEstado.Left                := 31;
  tbClonar.Left                      := 31;
  tbCerrarRevision.Left              := 31;
  tbNuevo.Left                       := 32;
  ToolButton6.Left                   := 31;
  tbMostrarOcultarColumnas.Left      := 31;
  tbColores.Left                     := 31;
  ToolButton3.Left                   := 31;
  tbExportar.Left                    := 31;
  tbImprimir.Left                    := 31;
  tbOrdenar.Left                     := 31;
  tbLimpiar.Left                     := 31;
  ToolButton4.Left                   := 31;
  tbCambiarUsuarioAutorizacion2.Left := 31;
  tbCambiarUsuarioAutorizacion.Left  := 31;
  tbNotificar.Left                   := 31;
  tbAutorizarNotificar.Left          := 31;
  tbAutorizar.Left                   := 31;
  tbNoSeCotiza.Left                  := 31;
  tbEliminar.Left                    := 31;
  tbSuspension.Left                  := 31;
  tbAsignarUsuario.Left              := 31;
  tbModificar.Left                   := 31;
  tbCambiarUsuarioAutorizacion2.Enabled := Seguridad.Claves.IsActive('PermisoCambiarUsuarioAutorizacionAlternativo');

  ClearData;
  EnableButtons(False);
  OpenQuery(sdqEstado);
  OpenQuery(sdqEstado2);
  OpenQueryEx(sdqCanal, [Sesion.UserID]);

  //Campos Sumatoria
  SetLength(TotalConsulta, MAXCOLS + 1);
  VCLExtra.LockControls([edDeuda2], True);
end;

procedure TfrmReAfiliacion.schRefreshPendientesEvents0Execute(Sender: TJvEventCollectionItem; const IsSnoozeEvent: Boolean);
begin
  //cada 30 minutos actualizar este label. Pidio Celeste.
  lbPendientes.Caption := 'Pendientes:' + IntToStr(CountEndosoPendientes)+ ' ';
end;

procedure TfrmReAfiliacion.scrollMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
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
    scroll.Perform(msg, code, 0);
  scroll.Perform(msg, SB_ENDSCROLL, 0);
end;

procedure TfrmReAfiliacion.btnCalcularClick(Sender: TObject);
begin
  if rbSinDatos.Checked then
    InfoHint(btnCalcular, 'No hay datos para calcular.', True);

  Verificar((edTrabajadoresTotalNuevo.Value = 0) and (edTrabajadores.Value = 0), edTrabajadoresNuevo1, 'Antes de calcular debe ingresar la cantidad de trabajadores.');

  if rbPagoTotalMensual.Checked then
  begin
    if IIF((edTrabajadoresTotalNuevo.Value > 0), edTrabajadoresTotalNuevo.Value, edTrabajadores.Value) = 0 then
      edResultadoMensualTrabajador.Value := 0
    else
      edResultadoMensualTrabajador.Value := edCompetenciaPTMCostoFijo.Value / IIF((edTrabajadoresTotalNuevo.Value > 0), edTrabajadoresTotalNuevo.Value, edTrabajadores.Value);
    edSumaFija.Value     := 0;
    edPorcVariable.Value := 0;
  end;

  if rbDatosEmpresa.Checked then
  begin
    if TIntEdit(IIF((fraMotivoSolicitudBusqueda.Value = 3), edTrabajadoresTotalNuevo, edTrabajadores)).Value = 0 then
      edResultadoMensualTrabajador.Value := 0
    else
      edResultadoMensualTrabajador.Value := ((IIF((edTrabajadoresTotalNuevo.Value > 0), edTrabajadoresTotalNuevo.Value, edTrabajadores.Value) * edCompetenciaDECostoFijo.Value) +
                                             (IIF((edMasaSalarialTotalNuevo.Value > 0), edMasaSalarialTotalNuevo.Value, edMasaSalarial.Value) * edCompetenciaDECostoVariable.Value / 100)) /
                                              IIF((edTrabajadoresTotalNuevo.Value > 0), edTrabajadoresTotalNuevo.Value, edTrabajadores.Value);
    edSumaFija.Value                   := edCompetenciaDECostoFijo.Value;
    edPorcVariable.Value               := edCompetenciaDECostoVariable.Value;
  end;

  if rbFormulario931.Checked then
  begin
    Verificar((edMasaSalarialTotalNuevo.Value = 0) and (edMasaSalarial.Value = 0), edMasaSalarialNuevo1, 'Antes de calcular debe ingresar la masa salarial.');

    edResultadoMensualTrabajador.Value := (edCompetenciaF931CostoFijo.Value + edCompetenciaF931CostoVariable.Value) /
                                           IIF((edTrabajadoresTotalNuevo.Value > 0), edTrabajadoresTotalNuevo.Value, edTrabajadores.Value);
    edSumaFija.Value                   := edCompetenciaF931CostoFijo.Value / IIF((edTrabajadoresTotalNuevo.Value > 0), edTrabajadoresTotalNuevo.Value, edTrabajadores.Value);
    edPorcVariable.Value               := edCompetenciaF931CostoVariable.Value / IIF((edMasaSalarialTotalNuevo.Value > 0), edMasaSalarialTotalNuevo.Value, edMasaSalarial.Value) * 100;
  end;

  CalcularCPTMA;
end;

procedure TfrmReAfiliacion.fpAbmShow(Sender: TObject);
var
  bLockDatosNuevos: Boolean;

// Lo referente a la variable de abajo (bTienePermisoModificar) queda sin efecto a raíz del ticket 25118..
//  bTienePermisoModificar: Boolean;
//  sPrioridad: String;
  sSql: String;
begin
  inherited;

  btnAceptar.Enabled := True;
  btnAdministracionArchivos.Caption := 'Administración de Archivos';

  // Modifico algunos labels de acuerdo a si el que autoriza es Cobranzas o Legales..
  if ModoABM = maModificacion then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM aco_contrato' +
      ' WHERE co_contrato = :contrato' +
        ' AND co_idestudio IS NOT NULL';
    if ExisteSqlEx(sSql, [sdqConsulta.FieldByName('sr_contrato').AsInteger]) then
    begin
      lbAutorizacionCobranzasOLegales.Caption  := 'Autorización de Legales';
      lbObservacionesCobranzasOLegales.Caption := 'Observaciones Legales';
    end
    else
    begin
      lbAutorizacionCobranzasOLegales.Caption  := 'Autorización de Cobranzas';
      lbObservacionesCobranzasOLegales.Caption := 'Observaciones Cobranzas';
    end;
  end;

  if IsComercial then
  begin
    if ModoABM = maModificacion then
    begin
      btnAceptar.Enabled := (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_PEND_COTIZ) or
                            (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_DATOS_FALTANTES) or
                            (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_CON_ERRORES);

      if not btnAceptar.Enabled then
        InfoHint(btnAceptar, 'Esta solicitud no se puede modificar porque no se encuentra en el estado Pendiente.');

      if (sdqConsulta.FieldByName('sr_usualta').AsString <> Sesion.UserID) and (sdqConsulta.FieldByName('sr_origenweb').AsString = 'F') then
        btnAceptar.Enabled := False;
    end;

    LockControl(pnComercial, not btnAceptar.Enabled);
    LockControls([gbSolicitud, fraEstado, edFechaVigenciaDesdeContrato, edCantidadContratosRescindidosFaltaPago, edFechaBaja, fraMotivoBaja, edComision, edAcpo, fraEjecutivo, fraSector,
                  gbCiiuActual, edMasaDivididaTrabajador, edTrabajadoresTotalNuevo, edMasaSalarialTotalNuevo, fraCiiu1DigitoNuevo, gbValoresTarifario, gbValoresTarifarioSSN,
                  gbLimiteSSN], True);
    OcultarCampos(True, [edSumaFijaTarifario, edPorcentajeVariableTarifario, edCostoFinalTarifario, edSumaFijaTarifarioSSN, edPorcentajeVariableTarifarioSSN, edCostoFinalTarifarioSSN,
                         edLimiteSSNMinimo, edLimiteSSNMaximo]);
    VCLExtra.EnableControls([edResultadoMensualTrabajador, edSumaFija, edPorcVariable, edCPTMA], False);
    VCLExtra.EnableControls([btnUltimaComisionContrato, gbObservaciones, gbValoresCotizados], True);
    VCLExtra.EnableControls([gbPedidoACobranzasOLegales, gbPedidoAComercial], not btnAceptar.Enabled);
//    VCLExtra.EnableControls([fraStatusSrt], False);

    if ModoABM = maModificacion then
    begin
      CalcularArchivos;
	    CambiarMotivoSolicitud(nil);
//  	  CambiarEmpresa(nil);
    end;
  end;

  if IsTecnica then
  begin
  	if ModoABM = maModificacion then
    begin
      CalcularArchivos;
      //tk 39238 Piden que aparesca el costo fijo en 0.6
      if (edCostoFijoCotizado.Value = 0) and (edPorcentajeVariableCotizado.Value = 0) then
        edCostoFijoCotizado.Value := 0.6;
{
      bTienePermisoModificar := (Sesion.UserID = sdqConsulta.FieldByName('sr_usuasignado').AsString);

      if not bTienePermisoModificar then
        if sdqConsulta.FieldByName('SR_ESTADOSOLICITUD').AsString = EC_PEND_AUTORIZ then
        begin
          sSql :=
            'SELECT ac_prioridad' +
             ' FROM art.aac_autorizacotiza' +
            ' WHERE ac_puesto = 0' + SqlString(sdqConsulta.FieldByName('sr_puestoautorizacion').AsString);
          sPrioridad := ValorSql(sSql);

          sSql :=
            'SELECT 1' +
             ' FROM art.aac_autorizacotiza' +
            ' WHERE :p1 BETWEEN ac_capitasdesde AND ac_capitashasta' +
              ' AND (INSTR('','' || ac_srtrevision || '','', :p2) > 0 OR ' + SqlString(sdqConsulta.FieldByName('statussrt').AsString, False, True) + ' IS NULL)' +
              ' AND INSTR('','' || ac_bcra || '','', :p4) > 0' +
              ' AND INSTR('','' || ac_riesgo || '','', :p5) > 0' +
              ' AND INSTR('','' || ac_usuarionotificacion || '','', :p6) > 0' +
              ' AND ac_prioridad >= :p7' +
              ' AND ac_fechabaja IS NULL';
          bTienePermisoModificar := ExisteSqlEx(sSql, [sdqConsulta.FieldByName('empleados').AsInteger,
                                                       ',' + sdqConsulta.FieldByName('statussrt').AsString + ',',
                                                       ',' + sdqConsulta.FieldByName('statusbcra').AsString + ',',
                                                       ',' + sdqConsulta.FieldByName('ac_idtiporiesgo').AsString + ',',
                                                       Sesion.UserID,
                                                       sPrioridad]);
        end;
}
	    btnAceptar.Enabled := (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_ASIGNADA) or
                            (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_EN_PREPARACION) or
                            (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_PEND_AUTORIZ) or
                            (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_AUTORIZADA);
//                            (bTienePermisoModificar);

//      if not bTienePermisoModificar then
//        InfoHint(btnAceptar, 'Usted no tiene permiso para modificar esta solicitud.')
//      else if not btnAceptar.Enabled then
      if not btnAceptar.Enabled then
        InfoHint(btnAceptar, 'Esta solicitud no se puede modificar porque no se encuentra en el estado ''Asignada'',  ''En Preparación'' o ''Pendiente de Autorizar''.');
    end;


    bLockDatosNuevos := (fraMotivoSolicitud.Codigo <> '1.2') and (fraMotivoSolicitud.Codigo <> '3') and
                        (fraMotivoSolicitud.Codigo <> '4') and (fraMotivoSolicitud.Codigo <> '6') and
                        (fraMotivoSolicitud.Codigo <> '6.1') and (fraMotivoSolicitud.Codigo <> '7') and
                        (not btnAceptar.Enabled);

    VCLExtra.EnableControls([gbCiiuNuevo], not bLockDatosNuevos);
    LockControl(gbCiiuNuevo, bLockDatosNuevos);
    if sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_PEND_AUTORIZ then
    begin
      VCLExtra.EnableControls([gbCiiuNuevo], True);
      LockControl(gbCiiuNuevo, False);
      VCLExtra.EnableControls([gbDatosCompetencia], True);
      LockControl(gbDatosCompetencia, False);
    end;

    LockControl(pnTecnica, not btnAceptar.Enabled);
    OcultarCampos(False, [edSumaFijaTarifario, edPorcentajeVariableTarifario, edCostoFinalTarifario, edSumaFijaTarifarioSSN, edPorcentajeVariableTarifarioSSN,
                          edCostoFinalTarifarioSSN, edLimiteSSNMinimo, edLimiteSSNMaximo]);
    LockControls([fraStatusBCRA, fraStatusSrt, ToolbarBCRA], not btnAceptar.Enabled);
    VCLExtra.EnableControls([gbObservaciones, gbValoresCotizados], True);
    LockControl(fraCiiu1DigitoNuevo, True);
  end;

  VCLExtra.EnableControls([edCostoFijo], False);
  VCLExtra.EnableControls([gbInformacionComplementaria, memoInformacionComplementaria], True);
  memoInformacionComplementaria.ReadOnly := True;

  scroll.VertScrollBar.Position := 0;
end;

procedure TfrmReAfiliacion.SumarTrabajadores(Sender: TObject);
begin
  edTrabajadoresTotalNuevo.Value := edTrabajadoresNuevo1.Value + edTrabajadoresNuevo2.Value + edTrabajadoresNuevo3.Value;
  RecalcularComision;
end;

procedure TfrmReAfiliacion.SumarMasaSalarial(Sender: TObject);
var
  rDivisor: Real;
begin
  rDivisor := 1;
  if edPeriodoNomina.Periodo.Mes in [6, 12] then
    rDivisor := 1.5;

  edMasaSalarialTotalNuevo.Value := (edMasaSalarialNuevo1.Value + edMasaSalarialNuevo2.Value + edMasaSalarialNuevo3.Value) / rDivisor;
end;

procedure TfrmReAfiliacion.tbAsignarUsuarioClick(Sender: TObject);
var
  iLoop: Integer;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningún registro seleccionado.');

  with sdqConsulta do
  begin
    DisableControls;
    try
      for iLoop := 0 to (Grid.SelectedRows.Count - 1) do
      begin
        GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
        Verificar((not Active) or (Eof) or (((FieldByName('sr_estadosolicitud').AsString <> EC_ASIGNADA) and
                                             (FieldByName('sr_estadosolicitud').AsString <> EC_AUTORIZADA) and
                                             (FieldByName('sr_estadosolicitud').AsString <> EC_EN_PREPARACION) and
                                             (FieldByName('sr_estadosolicitud').AsString <> EC_PEND_COTIZ))), nil,
                  Format('[Solicitud Nº %d] El estado no es el correcto para asignar usuario.', [FieldByName('sr_nrosolicitud').AsInteger]));
      end;
    finally
      EnableControls;
    end;

    fraAsignarUsuario.Value := FieldByName('sr_usuasignado').AsString;
    fpAsignarUsuario.ShowModal;
  end;
end;

procedure TfrmReAfiliacion.tbModificarClick(Sender: TObject);
begin
  if IsTecnica then
    Verificar(sdqConsulta.FieldByName('sr_usuasignado').IsNull, Grid, 'La solicitud no tiene ningún usuario asignado.');
  
  inherited;
end;

procedure TfrmReAfiliacion.btnCancelar2Click(Sender: TObject);
begin
  inherited;

  fpAsignarUsuario.ModalResult := mrCancel;
end;

procedure TfrmReAfiliacion.btnAceptarAsignacionClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
   Verificar(fraAsignarUsuario.IsEmpty, fraAsignarUsuario.edCodigo, 'Debe elegir un usuario a quien asignar la solicitud.');

  sdqConsulta.DisableControls;
  try
    BeginTrans;
    try
      for iLoop := 0 to (Grid.SelectedRows.Count - 1) do
      begin
        sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

        if sdqConsulta.FieldByName('sr_estadosolicitud').AsString <> EC_AUTORIZADA then
        begin
          sSql :=
            'UPDATE asr_solicitudreafiliacion' +
              ' SET sr_usuasignado = :usuasignado,' +
                  ' sr_estadosolicitud = :estadosolicitud' +
            ' WHERE sr_id = :id';

          EjecutarSqlSTEx(sSql, [fraAsignarUsuario.Value, EC_ASIGNADA, sdqConsulta.FieldByName('sr_id').AsInteger]);
        end;
      end;
      CommitTrans;
      MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
      ActualizarConsulta;
      fpAsignarUsuario.ModalResult := mrOk;
    except
      on E:Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmReAfiliacion.tbSuspensionClick(Sender: TObject);
var
  sSql: String;
begin
  with sdqConsulta do
  begin
    if FieldByName('sr_estadosolicitud').AsString = EC_SUSPENDIDA then
    begin
      if MsgAsk('¿ Realmente desea reactivar esta solicitud ?') then
      begin
        sSql :=
          'UPDATE asr_solicitudreafiliacion' +
            ' SET sr_estadosolicitud = :estadosolicitud,' +
                ' sr_fechaprosecucion = SYSDATE' +
          ' WHERE sr_id = :id';
        EjecutarSqlEx(sSql, [FieldByName('sr_estadoanterior').AsString, FieldByName('sr_id').AsInteger]);
        ActualizarConsulta;
      end;
    end
    else
    begin
      Verificar((not Active) or (Eof), nil, Format('El estado de la solicitud %s no es correcto para suspenderla.', [FieldByName('sr_nrosolicitud').AsString]));
      Verificar(FieldByName('sr_usuasignado').IsNull, Grid, Format('La solicitud %s no tiene ningún usuario signado.', [FieldByName('sr_nrosolicitud').AsString]));
      Verificar((FieldByName('sr_estadosolicitud').AsString = EC_CANCELADA) or (FieldByName('sr_estadosolicitud').AsString = EC_CANCELADA_DEUDOR), Grid, 'La solicitud ya ha sido cancelada.');
      Verificar((FieldByName('sr_estadosolicitud').AsString = EC_NOTIF_COMERCIAL), Grid, 'La solicitud ya ha sido notificada a comercial.');

      fpSuspender.ShowModal;
    end;
  end;
end;

procedure TfrmReAfiliacion.fpSuspenderKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    fpSuspender.Close;
end;

procedure TfrmReAfiliacion.btnCancelar3Click(Sender: TObject);
begin
  fpSuspender.Close;
end;

procedure TfrmReAfiliacion.btnAceptarSuspencionClick(Sender: TObject);
var
  sAsunto: String;
  sBody: String;
  sSql: String;
begin
  Verificar((memoObservacionesSuspension.Lines.Text = ''), memoObservacionesSuspension, 'El campo Observaciones es obligatorio.');

  with sdqConsulta do
  begin
    sSql :=
      'UPDATE asr_solicitudreafiliacion' +
        ' SET sr_idmotivosuspension = NULL,' +
            ' sr_observacionsuspension = :observacionsuspension,' +
            ' sr_fechasuspension = SYSDATE,' +
            ' sr_fechaprosecucion = NULL,' +
            ' sr_estadosolicitud = :estadosolicitud,' +
            ' sr_estadoanterior = :estadoanterior' +
      ' WHERE sr_id = :id';

    EjecutarSqlEx(sSql, [memoObservacionesSuspension.Lines.Text, EC_SUSPENDIDA, FieldByName('sr_estadosolicitud').AsString, FieldByName('sr_id').AsInteger]);

    sAsunto := 'Revisión de precio suspendida';
    sBody :=
      'Nº Solicitud: ' + FieldByName('sr_nrosolicitud').AsString + CRLF +
      'C.U.I.T.: ' + PonerGuiones(FieldByName('sr_cuit').AsString) + CRLF +
      'Razón Social: ' + FieldByName('hm_nombre').AsString + CRLF +
      'Observaciones: ' + memoObservacionesSuspension.Lines.Text + CRLF + CRLF;
    NotificacionPorMail('', sBody, sAsunto, 'ASR', FieldByName('sr_id').AsInteger, FieldByName('sr_usualta').AsString);
  end;

  MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  ActualizarConsulta;
  fpSuspender.Close;
end;

procedure TfrmReAfiliacion.fpSuspenderShow(Sender: TObject);
begin
  memoObservacionesSuspension.Clear;
end;

procedure TfrmReAfiliacion.tbEliminarClick(Sender: TObject);
var
  sEstado: String;
  sNumeroAfiliacion: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    Verificar((FieldByName('sr_estadosolicitud').AsString = EC_CANCELADA) or (FieldByName('sr_estadosolicitud').AsString = EC_CANCELADA_DEUDOR), Grid, 'Esta solicitud ya ha sido cancelada.');

    if IsComercial then
    begin
      Verificar((FieldByName('sr_estadosolicitud').AsString <> EC_PEND_COTIZ), nil, 'Esta solicitud no se encuentra en el estado adecuado para realizar la operación.');
      Verificar((not FieldByName('sr_costofinalcotizado').IsNull) or (not FieldByName('sr_costofijocotizado').IsNull) or (not FieldByName('sr_porcentajevariablecotizado').IsNull), Grid, 'Esta solicitud no puede cancelarse porque ya ha sido cotizada.');

      if FieldByName('sr_idformulario').IsNull then
      begin
        Verificar(((FieldByName('sr_fechanotificacioncomercial').AsDateTime + 30) < DBDate), nil, 'La revisión de precio no está vigente.');

        sEstado := EC_CERRADA_COMERCIALIZADOR;
        if not MsgAsk('¿ Realmente desea dar de baja la revisión de precio seleccionada ?') then
          Exit;
      end
      else
      begin
        sSql :=
          'SELECT 1' +
           ' FROM asa_solicitudafiliacion' +
          ' WHERE sa_idformulario = :idformulario' +
            ' AND sa_fecharecepcion IS NULL';
        if ExisteSqlEx(sSql, [FieldByName('sr_idformulario').AsInteger]) then   // Si la afiliación se imprimió y no fué presentada en Provart..
        begin
          sSql :=
            'SELECT ''00051-'' || NVL(fo_cuit, uw_cuitsuscripcion) || ''-'' || fo_formulario' +
             ' FROM asr_solicitudreafiliacion, afo_formulario, afi.auw_usuarioweb' +
            ' WHERE sr_idformulario = fo_id(+)' +
              ' AND sr_idusuarioweb = uw_id(+)' +
              ' AND sr_id = :id';
          sNumeroAfiliacion := ValorSqlEx(sSql, [FieldByName('sr_id').AsString]);

          sEstado := EC_CERRADA_COMERCIALIZADOR;
          if not MsgAsk(Format('Estimado %s:' + #13#10 +
                               'Mediante la opción "Sí" procederá a dar de baja la revisión seleccionada:' + #13#10 +
                               'Nº de Solicitud de Afiliación %s' + #13#10 +
                               'C.U.I.T. %s' + #13#10 +
                               'RAZÓN SOCIAL %s' + #13#10 +
                               'siendo su responsabilidad la destrucción de los papeles impresos.' + #13#10 +
                               'Las solicitudes dadas de baja no pueden ser presentadas en Provincia ART,' +
                               ' quedando bajo su responsabilidad los efectos derivados de la falta de presentación.',
                               [Sesion.Usuario, sNumeroAfiliacion, FieldByName('sr_cuit').AsString,
                                FieldByName('hm_nombre').AsString])) then
            Exit;
        end
        else
        begin
          sEstado := EC_CERRADA_VENCIDA_CON_IMPRESION;
          if not MsgAsk('¿ Realmente desea dar de baja la revisión de precio seleccionada ?') then
            Exit;
        end;
      end;

      if sEstado = '' then
        raise Exception.Create('Estado inválido!');

      sSql :=
        'UPDATE asa_solicitudafiliacion' +
          ' SET sa_cotizacioncerrada = ''T'',' +
              ' sa_estado = :estado' +
        ' WHERE sa_idformulario = :idformulario';
      EjecutarSqlEx(sSql, [sEstado, FieldByName('sr_idformulario').AsInteger]);

      sSql :=
        'UPDATE asr_solicitudreafiliacion' +
          ' SET sr_fechacancelacion = SYSDATE,' +
              ' sr_estadosolicitud = :estado,' +
              ' sr_usubaja = :usubaja,' +
              ' sr_fechabaja = SYSDATE' +
        ' WHERE sr_id = :id';
      EjecutarSqlEx(sSql, [sEstado, Sesion.UserID, FieldByName('sr_id').AsInteger]);
      MsgBox('La revisión de precio ha sido cerrada.');

      ActualizarConsulta;
    end;

    if IsTecnica then
    begin
      Verificar((FieldByName('sr_estadosolicitud').AsString = EC_NOTIF_COMERCIAL), Grid, 'La solicitud ya ha sido notificada a comercial.');
      fpCancelar.ShowModal;
    end;
  end;
end;

procedure TfrmReAfiliacion.btnObservacionesCancelacionClick(Sender: TObject);
begin
  fpCancelar.Close;
end;

procedure TfrmReAfiliacion.fpCancelarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    fpCancelar.Close;
end;

procedure TfrmReAfiliacion.btnAceptaCancelacionClick(Sender: TObject);
begin
  Verificar(fraMotivoCancelacion.IsEmpty, fraMotivoCancelacion.edCodigo, 'El campo Motivo Cancelación es obligatorio.');
  Verificar((memoObservacionesCancelacion.Lines.Text = ''), memoObservacionesCancelacion, 'El campo Observaciones es obligatorio.');

  Cancelar(fraMotivoCancelacion.Value, memoObservacionesCancelacion.Lines.Text);
  MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  ActualizarConsulta;

  fpCancelar.ModalResult := mrOk;
end;

procedure TfrmReAfiliacion.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  sEstado: String;
begin
  inherited;

  if HighLight then
    AFont.Color := clWhite
  else
  begin
    sEstado := sdqConsulta.FieldByName('sr_estadosolicitud').AsString;

    if (sEstado = EC_ASIGNADA) or (sEstado = EC_PEND_COTIZ) then
      AFont.Color := clGray;

    if (sEstado = EC_AUTORIZADA) or (sEstado = EC_EN_PREPARACION) or (sEstado = EC_SUSPENDIDA) then
      AFont.Color := clBlack;

    if (sEstado = EC_CERRADA_BIEN) or (sEstado = EC_TARIFA_APROBADA) or (sEstado = EC_SOLICITUD_AFILIACION_TRAMITE) or
       (sEstado = EC_TRASPASO_TRAMITE) or (sEstado = EC_CERRADA_CONTRATO_ART) then
      AFont.Color := clGreen;

    if (sEstado = EC_CANCELADA) or (sEstado = EC_NO_SE_COTIZA) or (sEstado = EC_CANCELADA_NO_AUTORIZADA) or
       (sEstado = EC_DATOS_FALTANTES) or (sEstado = EC_CANCELADA_DEUDOR) or (sEstado = EC_CERRADA_SIN_INFORMACION) then
      AFont.Color := clRed;

    if (sEstado = EC_PEND_AUTORIZ) then
      AFont.Color := TColor($4080FF);

    if (sEstado = EC_NOTIF_COMERCIAL) or (sEstado = EC_NOTIF_CLIENTE) then
      AFont.Color := clPurple;

    if (sEstado = EC_CERRADO_AUTOMATICO) or (sEstado = EC_CERRADA_COMERCIALIZADOR) or
       (sEstado = EC_CERRADA_VENCIDA_CON_IMPRESION) or (sEstado = EC_CERRADA_VENCIDA_SIN_IMPRESION) or
       (sEstado = EC_CERRADA_MAL) or (sEstado = EC_CERRADA_SOLICITA_NUEVA) or
       (sEstado = EC_CERRADA_TRASPASO_OBJETADO) then
      AFont.Color := clBlue;

    if (sEstado = EC_PEND_AUTO_LEGALES) or (sEstado = EC_PEND_AUTO_COBRANZA) or (sEstado = EC_PEND_AUTO) then
      AFont.Color := TColor($00DFDF);
  end;
end;

procedure TfrmReAfiliacion.tbNotificarClick(Sender: TObject);
var
  aBody: TStringList;
  aQuery: TSDQuery;
  iLoop: Integer;
  sDireccionRespuesta: String;
  sEmailDestino: String;
  sFileName: String;
  sNombreArchivoRevision: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    if IsComercial then
    begin
      Verificar((FieldByName('sr_estadosolicitud').AsString <> EC_NOTIF_COMERCIAL) and (FieldByName('sr_estadosolicitud').AsString <> EC_NOTIF_CLIENTE), Grid, 'La solicitud no se encuentra en el estado apropiado.');

      Verificar((not (FieldByName('sr_idmotivocotizacion').AsInteger in [22, 23, 26, 31, 34, 35, 36, 37, 61, 82, 83])),
                tbNotificar, 'La solicitud no tiene un motivo de respuesta correcto como para ser notificada al cliente.');


	    sNombreArchivoRevision := IncludeTrailingBackslash(TempPath) + 'SolicitudRevision_' + FieldByName('sr_cuit').AsString + '.pdf';
  	  SetCurrentDir(TempPath);

      Application.CreateForm(TQRNotificacionClienteRevisionPrecios, QRNotificacionClienteRevisionPrecios);
      try
        QRNotificacionClienteRevisionPrecios.Preparar(sdqConsulta.FieldByName('sr_id').AsInteger, sNombreArchivoRevision);
      finally
        FreeAndNil(QRNotificacionClienteRevisionPrecios);
      end;

      BeginTrans;
      try
        sSql :=
          'UPDATE asr_solicitudreafiliacion' +
            ' SET sr_fechanotificacioncliente = SYSDATE,' +
                ' sr_usunotificacioncliente = :usunotificacioncliente, ' +
                ' sr_estadosolicitud = :estadosolicitud' +
          ' WHERE sr_id = :id';

        EjecutarSqlStEx(sSql, [Sesion.UserID, EC_NOTIF_CLIENTE, FieldByName('sr_id').AsInteger]);
        CommitTrans;
      except
        on E: Exception do
        begin
          RollBack;
          MessageDlg(E.Message, mtWarning, [mbOK], 0);
        end;
      end;

      sEmailDestino := FieldByName('sr_email').AsString;
      if FieldByName('sr_origenweb').AsString = 'T' then
      begin
        sSql :=
          'SELECT uw_mail' +
           ' FROM art.auw_usuarioweb ' +
          ' WHERE uw_id = :id';
        sEmailDestino := ValorSqlEx(sSql, [FieldByName('sr_idusuarioweb').AsInteger], sEmailDestino);
      end;

      sSql :=
        'SELECT NVL(se_mail, se_usuario) email' +
         ' FROM use_usuarios' +
        ' WHERE se_usuario = :usuario' +
    ' UNION ALL' +
       ' SELECT uw_mailavisoart' +
         ' FROM auw_usuarioweb' +
        ' WHERE uw_usuario = :usuario2';
      sDireccionRespuesta := ValorSqlEx(sSql, [FieldByName('sr_usualta').AsString, FieldByName('sr_usualta').AsString]);

      if EnviarEmailHtml(FieldByName('sr_idcanal').AsInteger, FieldByName('sr_identidad').AsInteger, sFileName) then
      begin
        aBody := TStringList.Create;
        with aBody do
        try
          if Is_ConectadoProduccion then
            LoadFromFile(PATH_FILE_NOTIFICACION_CLIENTE_PROD + sFileName)
          else
            LoadFromFile(PATH_FILE_NOTIFICACION_CLIENTE + sFileName);

          sSql :=
            'SELECT se_nombre, DECODE(se_delegacion, 840, ''011-4819-2800, interno 4980'', el_codareatelefonos || '' '' || el_telefonos) telefono' +
             ' FROM use_usuarios, del_delegacion' +
            ' WHERE se_delegacion = el_id(+)' +
              ' AND se_mail = :mail';
          aQuery := GetQueryEx(sSql, [sDireccionRespuesta]);
          try
            Text := StringReplace(Text, '{#CUIT#}', PonerGuiones(FieldByName('sr_cuit').AsString), [rfReplaceAll]);
            Text := StringReplace(Text, '{#EJECUTIVO#}', Nvl(aQuery.FieldByName('se_nombre').AsString, 'Provincia ART'), [rfReplaceAll]);
            Text := StringReplace(Text, '{#EMAIL_EJECUTIVO#}', Nvl(sDireccionRespuesta, 'atencionalcliente@provart.com.ar'), [rfReplaceAll]);
            Text := StringReplace(Text, '{#RAZON_SOCIAL#}', FieldByName('hm_nombre').AsString, [rfReplaceAll]);
            Text := StringReplace(Text, '{#TELEFONO_EJECUTIVO#}', Nvl(aQuery.FieldByName('telefono').AsString, '0800-333-1278'), [rfReplaceAll]);
          finally
            FreeAndNil(aQuery);
          end;

          unEnvioMail.EnviarMailBD(sEmailDestino, Format('Revisión de Precio - %s %s', [FieldByName('hm_nombre').AsString, PonerGuiones(FieldByName('sr_cuit').AsString)]),
                                   [oAlwaysShowDialog, oSinNotaAlPie, oDeleteAttach, oDisableBody, oDisableAdjuntos], [sNombreArchivoRevision], Text, 0, tcDefault, True,
                                   False, 2500, -1, [], '', True, sDireccionRespuesta, 'ASR', FieldByName('sr_id').AsInteger);
        finally
          Free;
        end;
      end
      else
    	  EnviarMail(sEmailDestino, 'Solicitud Revisión: ' + FieldByName('hm_nombre').AsString, Sesion.UserID, [TOpcionARTMail(oAlwaysShowDialog), TOpcionARTMail(oDeleteAttach)],
                   'Provincia ART', [sNombreArchivoRevision], FieldByName('sr_contrato').AsInteger, True, 'ASR', FieldByName('sr_id').AsInteger, sDireccionRespuesta);
    end;


    if IsTecnica then
    begin
      DisableControls;

      try
        for iLoop := 0 to (Grid.SelectedRows.Count - 1) do
        begin
          GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
          ValidarNotificacionAComercial;
        end;


        for iLoop := 0 to (Grid.SelectedRows.Count - 1) do
        begin
          GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));
          NotificarAComercial(False, False);
        end;

        MessageDlg('Las solicitudes han sido notificadas correctamente.', mtInformation, [mbOK], 0);
      finally
        EnableControls;
      end;

      tbRefrescarClick(nil);
    end;
  end;
end;

procedure TfrmReAfiliacion.CambiaSector(Sender: TObject);
begin
  RecalcularComision;
end;

procedure TfrmReAfiliacion.CambiaVendedor(Sender: TObject);
begin
  RecalcularComision;
end;

procedure TfrmReAfiliacion.ClickDatosTarifa(Sender: TObject);
begin
  edCompetenciaPTMCostoFijo.Clear;
  edCompetenciaDECostoFijo.Clear;
  edCompetenciaDECostoVariable.Clear;
  edCompetenciaF931CostoFijo.Clear;
  edCompetenciaF931CostoVariable.Clear;
  edCPTMA.Clear;
  edResultadoMensualTrabajador.Clear;
  edSumaFija.Clear;
  edPorcVariable.Clear;

  VCLExtra.EnableControls([edCompetenciaPTMCostoFijo], rbPagoTotalMensual.Checked);
  VCLExtra.EnableControls([edCompetenciaDECostoFijo, edCompetenciaDECostoVariable], rbDatosEmpresa.Checked);
  VCLExtra.EnableControls([edCompetenciaF931CostoFijo, edCompetenciaF931CostoVariable], rbFormulario931.Checked);
end;

function TfrmReAfiliacion.CountEndosoPendientes: Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM afi.aet_endosotarifario';

  if isTecnica then
    sSql := sSql +
      ' WHERE (et_estado = ''2.0''' +
         ' OR et_estado = ''1.0''' +
         ' OR et_estado = ''4.1'')'
  else
    sSql := sSql + ' WHERE (et_estado = ''1.0'' OR et_estado = ''4.1'')';

  Result := ValorSqlInteger(sSql, 0);
end;

procedure TfrmReAfiliacion.CambiarSucursal(Sender: TObject);
begin
  fraCentroReg.Value := fraSucursal.CentroReg;
end;

procedure TfrmReAfiliacion.CambiarSucursalBusqueda(Sender: TObject);
begin
  fraCentroRegBusqueda.Value := fraSucursalBusqueda.CentroReg;
end;

procedure TfrmReAfiliacion.CambiarCanal(Sender: TObject);
begin
  if fraCanal.IsSelected then
    fraEntidad.Canal := fraCanal.Value;

  if IsComercial then
  begin
    if fraCanal.Value = 321 then   // Si es venta directa..
    begin
      edComision.DisplayFormat := '***';
      edComision.Enabled := False;
    end
    else
    begin
      edComision.DisplayFormat := '% ,0.00;-% ,0.00';
      edComision.Enabled := True;
    end;
  end;
end;

procedure TfrmReAfiliacion.CambiarCentroReg(Sender: TObject);
begin
  fraSucursal.CentroReg := fraCentroReg.Value;
end;

procedure TfrmReAfiliacion.CambiarCentroRegBusqueda(Sender: TObject);
begin
  fraSucursalBusqueda.CentroReg := fraCentroRegBusqueda.Value;
end;

procedure TfrmReAfiliacion.fraEntidadBusquedaExit(Sender: TObject);
begin
  inherited;

  fraEntidadBusqueda.FrameExit(Sender);
  fraSucursalBusqueda.Entidad := fraEntidadBusqueda.Value;
  fraVendedorBusqueda.Entidad := fraEntidadBusqueda.Value;
end;

procedure TfrmReAfiliacion.fraEntidadExit(Sender: TObject);
begin
  inherited;

  fraEntidad.FrameExit(Sender);
  fraSucursal.Entidad := fraEntidad.Value;
  fraVendedor.Entidad := fraEntidad.Value;
end;

procedure TfrmReAfiliacion.fraCanalExit(Sender: TObject);
begin
  inherited;

  fraCanal.FrameExit(Sender);
  fraEntidad.Canal := fraCanal.Value;
  CambiaEntidad(nil);
end;

procedure TfrmReAfiliacion.fraCanalBusquedaExit(Sender: TObject);
begin
  inherited;

  fraEntidadBusqueda.Canales := fraCanalBusqueda.InSql2;
end;

procedure TfrmReAfiliacion.CambiarActividad(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
  	'SELECT ac_descripcionok' +
     ' FROM cac_actividad' +
    ' WHERE ac_codigo = :codigo';
  if ValorSqlEx(sSql, [fraCiiuNuevo1.edCodigo.Text]) = 'N' then
    edActividadReal.Clear
  else if (edActividadReal.Text = '') and (edActividadReal.Text <> fraCiiuNuevo1.cmbDescripcion.Text) then
    edActividadReal.Text := fraCiiuNuevo1.cmbDescripcion.Text;

  sSql :=
    'SELECT ac_id' +
     ' FROM cac_actividad' +
    ' WHERE ac_codigo = SUBSTR(art.hys.get_codactividadrevdos(:idactividad), 1, 1)';
  fraCiiu1DigitoNuevo.Value := ValorSqlIntegerEx(sSql, [fraCiiuNuevo1.Value]);

  CalcularLimiteSSN;
end;

procedure TfrmReAfiliacion.CambiarActividadVieja(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT ac_id' +
     ' FROM cac_actividad' +
    ' WHERE ac_codigo = SUBSTR(art.hys.get_codactividadrevdos(:idactividad), 1, 1)';
  fraCiiu1Digito.Value := ValorSqlIntegerEx(sSql, [fraCiiu1.Value]);

  CalcularLimiteSSN;
end;

procedure TfrmReAfiliacion.CambiarEmpresa(Sender: TObject);
  function GetComision(const aCuit: String): Extended;
  var
    sSql: String;
  begin
    sSql :=
      'SELECT SUM(vc_porccomision)' +
       ' FROM aem_empresa' +
       ' JOIN aco_contrato ON(em_id = co_idempresa)' +
  ' LEFT JOIN avc_vendedorcontrato ON(vc_contrato = co_contrato AND vc_vigenciahasta IS NULL)' +
      ' WHERE co_contrato = afiliacion.get_ultcontrato(:cuit)' +
        ' AND vc_fechabaja IS NULL';
    Result := ValorSqlExtendedEx(sSql, [aCuit]);
  end;

var
  sResultado: String;
  sSql: String;
begin
  if fraEmpresa.IsEmpty then
    Exit;

  // Le asigno al frame el último contrato que exista para ese CUIT por ticket 23993..
  sSql :=
    'SELECT   co_contrato' +
       ' FROM aem_empresa, aco_contrato' +
      ' WHERE em_id = co_idempresa' +
        ' AND em_cuit = :cuit' +
   ' ORDER BY co_contrato DESC';
  fraEmpresa.Contrato := ValorSqlIntegerEx(sSql, [fraEmpresa.CUIT]);


  sSql := 'SELECT art.cotizacion.get_permitecotizar(:cuit, ''R'') FROM DUAL';
  sResultado := Trim(ValorSqlEx(sSql, [fraEmpresa.CUIT]));
  if (sResultado <> '') and (sResultado <> 'S') then
  begin
    MsgBox(sResultado);
    fraEmpresa.mskCUIT.SetFocus;
    Abort;
  end;

  sSql :=
    'SELECT TRIM(art.legales.get_fechaconcurso(em_cuit) || ''('' || art.utiles.periodo_ponerbarra(art.legales.get_periodoconcurso(em_cuit)) || '')'') concurso,' +
          ' art.deuda.get_deudatotalconsolidada(hc_contrato, NULL, art.actualdate, ''S'') deuda, em_idgrupoeconomico, em_sector, xen.en_idcanal,' +
          ' DECODE(et_fechabaja, NULL, et_incumplido_desde, NULL) et_incumplido_desde, DECODE(et_fechabaja, NULL, et_motivo, NULL) et_motivo,' +
          ' DECODE(et_fechabaja, NULL, et_porcmasa, NULL) et_porcmasa, DECODE(et_fechabaja, NULL, DECODE(NVL(et_sumafija, 0), 0, 0, et_sumafija + 0.60), NULL) et_sumafija,' +
          ' DECODE(et_fechabaja, NULL, et_vigenciatarifa, NULL) et_vigenciatarifa, ev_identidad, ev_idvendedor, hc_contrato, hc_estado, hc_fechabaja, hc_idactividad, hc_idactividad2,' +
          ' hc_idactividad3, hc_idejecutivo, hc_motivobaja, hc_vigenciadesde,' +
          ' TRIM(art.legales.get_fechaquiebra(em_cuit) || ''('' || art.utiles.periodo_ponerbarra(art.legales.get_periodoquiebra(em_cuit)) || '')'') quiebra, tc_alicuotapesos,' +
          ' tc_porcmasa, tc_vigenciatarifa, vc_idsucursal,' +
          ' (SELECT NVL(SUM(va_importe), 0)' +
             ' FROM art.ctb_tablas, zva_valor' +
            ' WHERE va_idcontrato = hc_contrato' +
              ' AND va_fechabaja IS NULL' +
              ' AND tb_clave = ''ESVAL''' +
              ' AND tb_codigo = va_estado' +
              ' AND tb_especial1 = ''N''' +
              ' AND va_fecharechazo IS NULL) valorespendientes,' +
          ' (SELECT COUNT( * )' +
             ' FROM aco_contrato, aem_empresa' +
            ' WHERE co_idempresa = em_id' +
              ' AND co_estado = 6' +
              ' AND co_motivobaja = ''08''' +
              ' AND em_cuit = :cuit) cantcontratosbajafaltapago,' +
          ' DECODE(hc_idtiporegimen, 2, ''RÉGIMEN ESPECIAL'', 3, ''RÉGIMEN MIXTO'', '''') tiporegimen' +
     ' FROM ahc_historicocontrato, aen_endoso aen, aem_empresa, atc_tarifariocontrato, tet_endosotarifa, avc_vendedorcontrato, xev_entidadvendedor, xen_entidad xen' +
    ' WHERE hc_id = en_idhistoricocontrato' +
      ' AND aen.en_id = art.afiliacion.get_ultendoso((SELECT co_idformulario' +
                                                      ' FROM aco_contrato' +
                                                     ' WHERE co_contrato = :contrato))' +
      ' AND em_id = hc_idempresa' +
      ' AND tc_contrato(+) = hc_contrato' +
      ' AND hc_contrato = et_contrato(+)' +
      ' AND vc_identidadvend = ev_id(+)' +
      ' AND ev_identidad = xen.en_id(+)' +
      ' AND vc_id(+) = art.comision.get_ultidentidadvendcontrato(hc_contrato)' +
 ' ORDER BY et_fechaautoriza DESC';
  with GetQueryEx(sSql, [fraEmpresa.CUIT, fraEmpresa.Contrato]) do
  try
    LimpiarDatosSoloLectura;

    Verificar(IsEmpty, fraEmpresa.mskCUIT, 'No existe un contrato asociado a esta C.U.I.T.');

    lbTipoRegimen.Caption                         := FieldByName('tiporegimen').AsString;
    fraEstado.Value                               := FieldByName('hc_estado').AsString;
    edFechaVigenciaDesdeContrato.Date             := FieldByName('hc_vigenciadesde').AsDateTime;
    edCantidadContratosRescindidosFaltaPago.Value := FieldByName('cantcontratosbajafaltapago').AsInteger;
    edFechaBaja.Date                              := FieldByName('hc_fechabaja').AsDateTime;
    fraMotivoBaja.Value                           := FieldByName('hc_motivobaja').AsString;
//    edComision.Value                              := GetComision(fraEmpresa.CUIT);
    fraEjecutivo.Value                            := FieldByName('hc_idejecutivo').AsInteger;

    fraCanal.Value                                := FieldByName('en_idcanal').AsInteger;
    CambiarCanal(nil);

    fraEntidad.Value                              := FieldByName('ev_identidad').AsInteger;
    fraSucursal.Entidad                           := fraEntidad.Value;
    fraVendedor.Entidad                           := fraEntidad.Value;
    CambiaEntidad(nil);

    fraSucursal.Value                             := FieldByName('vc_idsucursal').AsInteger;
    fraVendedor.Value                             := FieldByName('ev_idvendedor').AsInteger;
    fraHolding.Value                              := FieldByName('em_idgrupoeconomico').AsInteger;
    fraSector.Value                               := FieldByName('em_sector').AsString;
    edCostoFijo.Value                             := GetCostoFijo(fraEmpresa.Contrato);

    if (ModoABM = maAlta) and ((fraMotivoSolicitud.Codigo = '6') or (fraMotivoSolicitud.Codigo = '6.1')) then
    begin
//      edComision.Value    := 0;
      fraStatusBCRA.Value := GetStatusBCRA(fraEmpresa.CUIT);
      VCLExtra.LockControl(fraStatusBCRA, not fraStatusBCRA.IsEmpty);
    end;

  //  fraStatusSRT.Codigo                           := IntToStr(GetStatusSRT(fraEmpresa.CUIT));

    fraCiiu1.Value                                := FieldByName('hc_idactividad').AsInteger;
    CambiarActividadVieja(nil);
    if fraCiiuNuevo1.IsEmpty then
      fraCiiuNuevo1.Value                         := FieldByName('hc_idactividad').AsInteger;
    if edActividadReal.Text = '' then
      edActividadReal.Text                        := fraCiiuNuevo1.Descripcion;

    fraCiiu2.Value                                := FieldByName('hc_idactividad2').AsInteger;
    if fraCiiuNuevo2.IsEmpty then
      fraCiiuNuevo2.Value                         := FieldByName('hc_idactividad2').AsInteger;

    fraCiiu3.Value                                := FieldByName('hc_idactividad3').AsInteger;
    if fraCiiuNuevo3.IsEmpty then
      fraCiiuNuevo3.Value                         := FieldByName('hc_idactividad3').AsInteger;

    edVigenciaTarifa.Date                         := FieldByName('tc_vigenciatarifa').AsDateTime;
    edVigenciaIncumplimientoPendiente.Date        := FieldByName('et_incumplido_desde').AsDateTime;
    edVigenciaTarifaPendiente.Date                := FieldByName('et_vigenciatarifa').AsDateTime;
    edSumaFijaPendiente.Value                     := FieldByName('et_sumafija').AsFloat;
    edPorcentajeVariablePendiente.Value           := FieldByName('et_porcmasa').AsFloat;
    fraMotivoTarifaPendiente.Value                := FieldByName('et_motivo').AsString;
    edValoresPendientesAcreditar.Value            := FieldByName('valorespendientes').AsFloat;
    edConcurso.Text                               := FieldByName('concurso').AsString;
    edQuiebra.Text                                := FieldByName('quiebra').AsString;

    edCostoFijoUltimoContrato.Value               := FieldByName('tc_alicuotapesos').AsFloat;
    edPorcentajeVariableUltimoContrato.Value      := FieldByName('tc_porcmasa').AsFloat;
    edDeuda.Value                                 := FieldByName('deuda').AsFloat;
    edDeudaAl.Date                                := DBDate;

    if fraMotivoSolicitud.Codigo = '4' then    // Incorporación CIIU / Actividad..
      fraCiiuNuevo1.Value := fraCiiu1.Value;


    if (fraMotivoSolicitud.Codigo <> '6') and (fraMotivoSolicitud.Codigo <> '6.1') then
    begin
      // Copio los valores actuales a los nuevos..
      if edPeriodo.Periodo.Mes in [6, 12] then
      begin
        edTrabajadoresNuevo1.Value := edTrabajadores.Value;
        edMasaSalarialNuevo1.Value := edMasaSalarial.Value * 1.5;
      end
      else
      begin
        edTrabajadoresNuevo1.Value := edTrabajadores.Value;
        edMasaSalarialNuevo1.Value := edMasaSalarial.Value;
      end;
//      edPeriodoNomina.Text := edPeriodo.Text;
    end;
  finally
    Free;
  end;

  // Traigo datos de la ZRC..
  sSql :=
    'SELECT rc_empleados, rc_masasalarial, rc_periodonomina' +
     ' FROM aco_contrato' +
     ' JOIN zrc_resumencobranza ON rc_contrato = co_contrato' +
      ' AND rc_periodo = co_ultimoperiodomayorcero' +
    ' WHERE co_contrato = :contrato';
  with GetQueryEx(sSql, [fraEmpresa.Contrato]) do
  try
    edPeriodo.Text       := FieldByName('rc_periodonomina').AsString;
    edPeriodoNomina.Text := FieldByName('rc_periodonomina').AsString;

    edTrabajadores.Value := FieldByName('rc_empleados').AsInteger;
    RecalcularComision;

    edMasaSalarial.Value := FieldByName('rc_masasalarial').AsFloat;

    if FieldByName('rc_empleados').AsInteger > 0 then
      edResultadoMensualTrabajadorActual.Value := ((FieldByName('rc_empleados').AsInteger * edCostoFijoUltimoContrato.Value) +
                                                   (FieldByName('rc_masasalarial').AsFloat * edPorcentajeVariableUltimoContrato.Value / 100)) / FieldByName('rc_empleados').AsInteger
    else
      edResultadoMensualTrabajadorActual.Clear;
  finally
    Free;
  end;
end;

procedure TfrmReAfiliacion.CambiarLimitesSSN(Sender: TObject);
begin
  CalcularLimiteSSN;
end;

procedure TfrmReAfiliacion.mnuGrillaClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmReAfiliacion.mnuSolicitudClick(Sender: TObject);
begin
  Verificar(IsComercial, nil, 'Esta operación solo puede ser realizada por el área técnica.');

  Application.CreateForm(TqrRevisionPrecio, qrRevisionPrecio);
  try
    qrRevisionPrecio.Imprimir(sdqConsulta.FieldByName('sr_id').AsInteger, FSector);
  finally
    FreeAndNil(qrRevisionPrecio);
  end;
end;

procedure TfrmReAfiliacion.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmReAfiliacion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(DataSet.FieldByName('deuda')).DisplayFormat                         := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('diferenciapesos')).DisplayFormat               := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('diferenciapesosmensual')).DisplayFormat        := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('diferenciapesosmensualrecoti')).DisplayFormat  := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('diferenciapesosrecoti')).DisplayFormat         := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('diferenciaporcentaje')).DisplayFormat          := ',0.00 %;-,0.00 %';
  TFloatField(DataSet.FieldByName('diferenciaporcentajerecoti')).DisplayFormat    := ',0.00 %;-,0.00 %';
  TFloatField(DataSet.FieldByName('masasalarial')).DisplayFormat                  := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('primamensual')).DisplayFormat                  := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('primamensualcompetencia')).DisplayFormat       := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('primamensualcotizada')).DisplayFormat          := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('primapersona')).DisplayFormat                  := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_autocostofinal')).DisplayFormat             := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_autoporcvariable')).DisplayFormat           := ',0.000 %;-,0.000 %';
  TFloatField(DataSet.FieldByName('sr_autosumafija')).DisplayFormat               := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_comision')).DisplayFormat                   := ',0.000 %;-,0.000 %';
  TFloatField(DataSet.FieldByName('sr_costofijocotizado')).DisplayFormat          := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_costofinalcompetencia')).DisplayFormat      := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_costofinalcotizado')).DisplayFormat         := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_indicecombinado')).DisplayFormat            := ',0.00 %;-,0.00 %';
  TFloatField(DataSet.FieldByName('sr_masasalarial1')).DisplayFormat              := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_porcentajevariablecotizado')).DisplayFormat := ',0.000 %;-,0.000 %';
  TFloatField(DataSet.FieldByName('sr_totalfijocompetencia')).DisplayFormat       := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_totalvariablecompetencia')).DisplayFormat   := ',0.000 %;-,0.000 %';
  TFloatField(DataSet.FieldByName('sr_costofijo')).DisplayFormat                  := '$ ,0.00;-$ ,0.00';
  TFloatField(DataSet.FieldByName('sr_porcentajevariable')).DisplayFormat         := ',0.000 %;-,0.000 %';
  TFloatField(DataSet.FieldByName('sr_valorespendientesacredit')).DisplayFormat   := '$ ,0.00;-$ ,0.00';
end;

procedure TfrmReAfiliacion.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if LowerCase(Column.FieldName) = 'estadosolicitud' then
    with Grid do
    begin
      if DataSource.DataSet.FieldByName('sr_estadosolicitud').AsString = EC_CERRADA_BIEN then
      begin
        Canvas.FillRect(Rect);
        Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, 'Cerrada - Revisión ingresada');
      end;
      if DataSource.DataSet.FieldByName('sr_estadosolicitud').AsString = EC_PEND_COTIZ then
      begin
        Canvas.FillRect(Rect);
        Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, 'Pendiente de Revisión');
      end;
    end;
end;

procedure TfrmReAfiliacion.tbSumatoriaClick(Sender: TObject);
begin
  Grid.FooterBand := tbSumatoria.Down;
  if tbSumatoria.Down then
    CalcularTotales;
end;

procedure TfrmReAfiliacion.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CamposSuma);

  if Column = CamposSuma[15] then
    Value := 'Total: ' + ToStr(TotalConsulta[iPos], 0)
  else if Column = CamposSuma[16] then
    Value := ToStr(TotalConsulta[iPos], 0)
  else if Column = CamposSuma[17] then
    Value := Get_AjusteDecimales(ToStr(TotalConsulta[iPos]), '$ ', 2)
  else if Column = CamposSuma[18] then
    Value := Get_AjusteDecimales(ToStr(TotalConsulta[iPos]), '', 0)
  else if iPos = 0 then
    Value := FormatFloat(',0', TotalConsulta[iPos])
  else if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(ToStr(TotalConsulta[iPos]), '$ ');
end;

function TfrmReAfiliacion.HayFiltrosAplicados: Boolean;
begin
  Result := False;

  if (edNumeroSolicitudBusqueda.Text <> '') or
     (not fraUsuarioSolicitoBusqueda.IsEmpty) or
     (not fraUsuarioAsignadoBusqueda.IsEmpty) or
     (not fraUsuarioAutorizacionBusqueda.IsEmpty) or
     (not fraEntidadBusqueda.IsEmpty) or
     (not fraSucursalBusqueda.IsEmpty) or
     (not fraCentroRegBusqueda.IsEmpty) or
     (not fraVendedorBusqueda.IsEmpty) or
     (not fraMotivoSolicitudBusqueda.IsEmpty) or
     (not fraMotivoRespuestaBusqueda.IsEmpty) or
     (not edFechaSolicitudDesde.IsEmpty) or
     (not edFechaSolicitudHasta.IsEmpty) or
     (not edFechaRespuestaComercialDesde.IsEmpty) or
     (not edFechaRespuestaComercialHasta.IsEmpty) or
     (edNumeroSolicitudAfiliacion.Text <> '') or
     (not edFechaAprobacionAutomaticaDesde.IsEmpty) or
     (not edFechaAprobacionAutomaticaHasta.IsEmpty) or
     (not edFechaConfeccionDesde.IsEmpty) or
     (not edFechaConfeccionHasta.IsEmpty) or
     (not edFechaSuspensionDesde.IsEmpty) or
     (not edFechaSuspensionHasta.IsEmpty) or
     (checkEnTramite.Checked) or
     (not fraEmpresaBusqueda.IsEmpty) or
     (not fraCanalBusqueda.IsEmpty) or
     (not fraDelegacionBusqueda.IsEmpty) or
     (chkUltimaSolicitud.Checked) or
     (cbEstadoBusqueda.Text <> '') or
     (checkEntidadesEnTramite.Checked) or
     (chkConTarifaCargada.Checked) or
     (not fraHoldingBusqueda.IsEmpty) then
    Result := True;
end;

procedure TfrmReAfiliacion.btnImprimirClick(Sender: TObject);
var
  sSql: String;
begin
  if btnAceptar.Enabled then
    if not MsgAsk('Antes de imprimir una solicitud debe guardarla.' + #13#10 + '¿ Desea hacerlo ahora ?') then
      Exit;

  if ModoABM = maAlta then
  begin
    if Validar and DoABM then
    begin
      ModoABM := maModificacion;
      ModoABMToSqlType;
    end
    else
      Exit;

    ClearData;
    sSql :=
      'SELECT MAX(sr_nrosolicitud)' +
       ' FROM asr_solicitudreafiliacion';
    edNumeroSolicitudBusqueda.Value := ValorSqlInteger(sSql);
    tbRefrescarClick(nil);
  end
  else
  begin
    if btnAceptar.Enabled then
      if not (Validar and DoABM) then
        Exit;
  end;

  mnuSolicitudClick(nil);
end;

procedure TfrmReAfiliacion.edCompetenciaDECostoFijoExit(Sender: TObject);
begin
  Verificar((edCompetenciaDECostoFijo.Value > 500), edCompetenciaDECostoFijo, 'Este campo no puede ser mayor a $500.');
end;

procedure TfrmReAfiliacion.edCompetenciaDECostoVariableExit(Sender: TObject);
begin
  Verificar((edCompetenciaDECostoVariable.Value > 100), edCompetenciaDECostoVariable, 'Este campo no puede ser mayor a 100%.');
end;

procedure TfrmReAfiliacion.tbNoSeCotizaClick(Sender: TObject);
var
  bMostrarError: Boolean;
  iLoop: Integer;
  sSql: String;
begin
  bMostrarError := True;

  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningún registro seleccionado.');
  Verificar((sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_CANCELADA), tbNoSeCotiza, 'Esta solicitud ya ha sido cancelada.');

  if MsgBox('¿ Realmente desea pasar estas revisiones a estado "No se Cotiza" ?', MB_YESNO) = mrNo then
    Exit;

  if fpNoSeCotiza.ShowModal <> mrOk then
    Exit;

  with sdqConsulta do
  begin
    DisableControls;
    try
      BeginTrans;

      try
        sSql :=
          'UPDATE asr_solicitudreafiliacion' +
            ' SET sr_estadosolicitud = :estado,' +
                ' sr_motivonosecotiza = :motivo,' +
                ' sr_observacionesnosecotiza = :observaciones' +
          ' WHERE sr_id = :id';

        for iLoop := 0 to (Grid.SelectedRows.Count - 1) do
        begin
          GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

          if (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_NOTIF_COMERCIAL) or
             (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_NOTIF_CLIENTE) then
          begin
            InfoHint(Grid, Format('La solicitud %s no se encuentra en el estado adecuado para realizar esta operación.', [sdqConsulta.FieldByName('sr_nrosolicitud').AsString]));
            bMostrarError := False;
            StrToInt('crash');
          end;

          EjecutarSqlSTEx(sSql, [EC_NO_SE_COTIZA, fraMotivoNoSeCotiza.Value, memoObservacionesNoSeCotiza.Lines.Text, sdqConsulta.FieldByName('sr_id').AsString]);
        end;

        CommitTrans;
        tbRefrescarClick(nil);
      except
        on E: Exception do
        begin
          if bMostrarError then
            MessageDlg(E.Message, mtWarning, [mbOK], 0);
          RollBack;
        end;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfrmReAfiliacion.btnCancelar4Click(Sender: TObject);
begin
  fpNoSeCotiza.ModalResult := mrCancel;
end;

procedure TfrmReAfiliacion.fpNoSeCotizaBeforeShow(Sender: TObject);
begin
  fraMotivoNoSeCotiza.Clear;
  memoObservacionesNoSeCotiza.Clear;
end;

procedure TfrmReAfiliacion.btnAceptar3Click(Sender: TObject);
begin
  Verificar((fraMotivoNoSeCotiza.IsEmpty), fraMotivoNoSeCotiza.edCodigo, 'El campo Motivo es obligatorio.');
  Verificar((Trim(memoObservacionesNoSeCotiza.Lines.Text) = ''), memoObservacionesNoSeCotiza, 'El campo Observaciones es obligatorio.');

  fpNoSeCotiza.ModalResult := mrOk;
end;

procedure TfrmReAfiliacion.tbClonarClick(Sender: TObject);
var
  aRevision: TSql;
  iId: Integer;
  iIdHistoricoContrato: Integer;
  iIdHistoricoEmpresa: Integer;
  sSql: String;
begin
  MsgBox('Funcionalidad no implementada.', MB_ICONWARNING);
  Exit;

  with sdqConsulta do
  begin
    Verificar((FieldByName('sr_costofinalcotizado').AsInteger = 0), Grid, 'No se puede clonar una solicitud que no esté cotizada.');

    if not MsgAsk('¿ Realmente desea clonar la solicitud de revisión ?') then
      Exit;

    aRevision := TSql.Create('asr_solicitudreafiliacion');
    try
      sSql :=
        'SELECT MAX(hc_id)' +
         ' FROM ahc_historicocontrato' +
        ' WHERE hc_contrato = :contrato';
      iIdHistoricoContrato := ValorSqlIntegerEx(sSql, [FieldByName('sr_contrato').AsInteger]);

      sSql :=
        'SELECT MAX(hm_id)' +
         ' FROM ahm_historicoempresa' +
        ' WHERE hm_cuit = :cuit';
      iIdHistoricoEmpresa := ValorSqlIntegerEx(sSql, [FieldByName('sr_cuit').AsInteger]);

      iId := ValorSqlInteger('SELECT afi.seq_asr_id.NEXTVAL FROM DUAL', 0);

      aRevision.SqlType := stInsert;
      aRevision.PrimaryKey.Add('SR_ID', iId, False);
      aRevision.Fields.Add('SR_COMISION',                   FieldByName('SR_COMISION').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_CONTACTO',                   FieldByName('SR_CONTACTO').AsString);
      aRevision.Fields.Add('SR_CONTRATO',                   FieldByName('SR_CONTRATO').AsInteger, True);
      aRevision.Fields.Add('SR_COSTOFIJO',                  FieldByName('SR_COSTOFIJO').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_COSTOFIJOCOMPETENCIA',       FieldByName('SR_COSTOFIJOCOMPETENCIA').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_COSTOFIJOCOTIZADO',          FieldByName('SR_COSTOFIJOCOTIZADO').AsFloat, 2, True);
      aRevision.Fields.Add('SR_COSTOFINALCOMPETENCIA',      FieldByName('SR_COSTOFINALCOMPETENCIA').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_COSTOFINALCOTIZADO',         FieldByName('SR_COSTOFINALCOTIZADO').AsFloat, 2, True);
      aRevision.Fields.Add('SR_COSTOVARIABLECOMPETENCIA',   FieldByName('SR_COSTOVARIABLECOMPETENCIA').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_CPTMA',                      FieldByName('SR_CPTMA').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_CUIT',                       FieldByName('SR_CUIT').AsString);
      aRevision.Fields.Add('SR_DEUDA',                      FieldByName('SR_DEUDA').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_EMAIL',                      FieldByName('SR_EMAIL').AsString);
      aRevision.Fields.Add('SR_ESTADOSOLICITUD',            EC_CLONADA);
      aRevision.Fields.Add('SR_FECHAALTA',                  SQL_DATETIME, False);
      aRevision.Fields.Add('SR_IDCANAL',                    FieldByName('SR_IDCANAL').AsInteger, True);
      aRevision.Fields.Add('SR_IDCENTROREGIONAL',           FieldByName('SR_IDCENTROREGIONAL').AsInteger, True);
      aRevision.Fields.Add('SR_IDHISTORICOCONTRATO',        iIdHistoricoContrato);
      aRevision.Fields.Add('SR_IDHISTORICOEMPRESA',         iIdHistoricoEmpresa);
      aRevision.Fields.Add('SR_IDENTIDAD',                  FieldByName('SR_IDENTIDAD').AsInteger, True);
      aRevision.Fields.Add('SR_IDHOLDING',                  FieldByName('SR_IDHOLDING').AsInteger, True);
      aRevision.Fields.Add('SR_IDMOTIVOCOTIZACION',         FieldByName('SR_IDMOTIVOCOTIZACION').AsInteger, True);
      aRevision.Fields.Add('SR_IDMOTIVOSOLICITUD',          FieldByName('SR_IDMOTIVOSOLICITUD').AsInteger, True);
      aRevision.Fields.Add('SR_IDSUCURSAL',                 FieldByName('SR_IDSUCURSAL').AsInteger, True);
      aRevision.Fields.Add('SR_IDVENDEDOR',                 FieldByName('SR_IDVENDEDOR').AsInteger, True);
      aRevision.Fields.Add('SR_OBSERVACIONES',              FieldByName('SR_OBSERVACIONES').AsString);
      aRevision.Fields.Add('SR_OBSERVACIONESTECNICA',       FieldByName('SR_OBSERVACIONESTECNICA').AsString);
      aRevision.Fields.Add('SR_PORCENTAJEVARIABLE',         FieldByName('SR_PORCENTAJEVARIABLE').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_PORCENTAJEVARIABLECOTIZADO', FieldByName('SR_PORCENTAJEVARIABLECOTIZADO').AsFloat, 4, True);
      aRevision.Fields.Add('SR_TELEFONO',                   FieldByName('SR_TELEFONO').AsString);
      aRevision.Fields.Add('SR_TIPODATOTARIFACOMPETENCIA',  FieldByName('SR_TIPODATOTARIFACOMPETENCIA').AsString);
      aRevision.Fields.Add('SR_TOTALFIJOCOMPETENCIA',       FieldByName('SR_TOTALFIJOCOMPETENCIA').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_TOTALVARIABLECOMPETENCIA',   FieldByName('SR_TOTALVARIABLECOMPETENCIA').AsFloat, dtNumber);
      aRevision.Fields.Add('SR_USUALTA',                    Sesion.UserID);
      aRevision.Fields.Add('SR_USUASIGNADO',                FieldByName('SR_USUASIGNADO').AsString);

      if (FieldByName('MS_CODIGO').AsString = '1.2') or (FieldByName('MS_CODIGO').AsString = '3') or
         (FieldByName('MS_CODIGO').AsString = '4') or (FieldByName('MS_CODIGO').AsString = '6') or
         (FieldByName('MS_CODIGO').AsString = '6.1') then
      begin
        aRevision.Fields.Add('SR_CANTTRABAJADORES',  FieldByName('SR_CANTTRABAJADORES').AsInteger, True);
        aRevision.Fields.Add('SR_CANTTRABAJADORES1', FieldByName('SR_CANTTRABAJADORES1').AsInteger, True);
        aRevision.Fields.Add('SR_CANTTRABAJADORES2', FieldByName('SR_CANTTRABAJADORES2').AsInteger, True);
        aRevision.Fields.Add('SR_CANTTRABAJADORES3', FieldByName('SR_CANTTRABAJADORES3').AsInteger, True);
        aRevision.Fields.Add('SR_IDACTIVIDAD1',      FieldByName('SR_IDACTIVIDAD1').AsInteger, True);
        aRevision.Fields.Add('SR_IDACTIVIDAD2',      FieldByName('SR_IDACTIVIDAD2').AsInteger, True);
        aRevision.Fields.Add('SR_IDACTIVIDAD3',      FieldByName('SR_IDACTIVIDAD3').AsInteger, True);
        aRevision.Fields.Add('SR_MASASALARIAL',      FieldByName('SR_MASASALARIAL').AsFloat, dtNumber);
        aRevision.Fields.Add('SR_MASASALARIAL1',     FieldByName('SR_MASASALARIAL1').AsFloat, dtNumber);
        aRevision.Fields.Add('SR_MASASALARIAL2',     FieldByName('SR_MASASALARIAL2').AsFloat, dtNumber);
        aRevision.Fields.Add('SR_MASASALARIAL3',     FieldByName('SR_MASASALARIAL3').AsFloat, dtNumber);

        if ((FieldByName('MS_CODIGO').AsString = '3') or (FieldByName('MS_CODIGO').AsString = '4')) and
            (FieldByName('SR_ACTIVIDADREAL').AsString = '') then
          aRevision.Fields.Add('SR_ACTIVIDADREAL', FieldByName('SR_IDACTIVIDAD1').AsString)
        else
          aRevision.Fields.Add('SR_ACTIVIDADREAL', FieldByName('SR_ACTIVIDADREAL').AsString);
      end;

      SendAlerts(iId);
      EjecutarSql(aRevision.Sql);

      edNumeroSolicitudBusqueda.Value := ValorSqlInteger('SELECT MAX(sr_nrosolicitud) FROM asr_solicitudreafiliacion');
      tbRefrescarClick(nil);
    finally
      aRevision.Free;
    end;
  end;
end;

procedure TfrmReAfiliacion.btnCancelar5Click(Sender: TObject);
begin
  fpPedidoACobranzasOLegales.Close;
end;

procedure TfrmReAfiliacion.btnAceptar2Click(Sender: TObject);
begin
  fpPedidoACobranzasOLegales.ModalResult := mrOk;
end;

procedure TfrmReAfiliacion.gbCiiuNuevoExit(Sender: TObject);
begin
  CalcularTarifarioSSN;
  CalcularLimiteSSN;
end;

procedure TfrmReAfiliacion.btnCancelar6Click(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea cancelar la solicitud de esta revisión ?') then
    fpPedidoAutorizacion.Close;
end;

procedure TfrmReAfiliacion.btnAceptar4Click(Sender: TObject);
begin
  fpPedidoAutorizacion.ModalResult := mrOk;
end;

procedure TfrmReAfiliacion.fpPedidoAutorizacionBeforeShow(Sender: TObject);
begin
  memoObservaciones3.Clear;
end;

procedure TfrmReAfiliacion.sdqConsultaAfterScroll(DataSet: TDataSet);
var
  sEstado : String;
begin
  inherited;

  with DataSet do
  begin
    tbAutorizar.Enabled := (FieldByName('sr_estadosolicitud').AsString = EC_PEND_AUTORIZ) and
                           ((FieldByName('superiorencasacentral').AsString = Sesion.UserID) or (Sesion.UserID = 'FMFIRENZE') or (Sesion.UserID = 'MMAGALLANES'));

    tbRedireccionSolicitudPermiso.Enabled := (FieldByName('sr_estadosolicitud').AsString = EC_PEND_AUTO) or
                                             (FieldByName('sr_estadosolicitud').AsString = EC_PEND_AUTO_COBRANZA) or
                                             (FieldByName('sr_estadosolicitud').AsString = EC_PEND_AUTO_LEGALES);


    sEstado := sdqConsulta.FieldByName('sr_estadosolicitud').AsString;
    {Diseño de Grossi: El boton Crear/Ver endoso debera estar grisado, mientras el estado de la revision de precio
     sea distinto a “NOTIFICADO AL CLIENTE” y “NOTIFICADO A COMERCIAL”.}
    if (sEstado = EC_NOTIF_COMERCIAL) or (sEstado = EC_NOTIF_CLIENTE) then
    begin
      if isTecnica then
        tbEndoso.Enabled := True
      else
      begin
        {$region 'Chekear Habilitacion por motivo'}
        tbEndoso.Enabled  := False;
         //aca preguntar a ggrossi cuando se debe activar o no. Segun MOTIVOSOLICITUD  MOTIVORESPUESTA
         //vamos a hacerlo prolijo(poco eficiente) porque despues lo van a querer cambiar 200veces ademas
         //no estan seguros de como va.

        if (FieldByName('ms_codigo').AsString = '1.1') and //	1.1  Solicitud de Rebajas - (por oferta de otra ART)
           ((FieldByName('sr_idmotivocotizacion').AsString = '102') or //Se rebajan las alícuotas.
           (FieldByName('sr_idmotivocotizacion').AsString = '22') or  //Se rebajan las alícuotas.
           (FieldByName('sr_idmotivocotizacion').AsString = '37')) then //Se rebajan las alícuotas.
          tbEndoso.Enabled  := True
        else
        if (FieldByName('ms_codigo').AsString = '1.2') and  //"	1.2  Solicitud de Rebajas - (por CIIU AFIP no representativo a la realidad)
           ((FieldByName('sr_idmotivocotizacion').AsString = '102') or //Se rebajan las alícuotas.
           (FieldByName('sr_idmotivocotizacion').AsString = '22') or //Se rebajan las alícuotas.
           (FieldByName('sr_idmotivocotizacion').AsString = '37')) then //Se rebajan las alícuotas.
          tbEndoso.Enabled  := True
        else
        if (FieldByName('ms_codigo').AsString = '1.3') and //	1.3  Solicitud de Rebajas - (otros)
           ((FieldByName('sr_idmotivocotizacion').AsString = '102') or //Se rebajan las alícuotas.
           (FieldByName('sr_idmotivocotizacion').AsString = '22') or //Se rebajan las alícuotas.
           (FieldByName('sr_idmotivocotizacion').AsString = '37')) then //Se rebajan las alícuotas.
          tbEndoso.Enabled  := True
        else
        if (FieldByName('ms_codigo').AsString = '2.1') and // 2.1  Informe sobre Resultado Técnico - (cliente)
           ((FieldByName('sr_idmotivocotizacion').AsString = '32') or //Informe resultado técnico cliente
           (FieldByName('sr_idmotivocotizacion').AsString = '25') or //Informe resultado técnico cliente
           (FieldByName('sr_idmotivocotizacion').AsString = '24') or //Informe resultado técnico interno.
           (FieldByName('sr_idmotivocotizacion').AsString = '33')) then //Informe resultado técnico interno.
          tbEndoso.Enabled  := True
        else
        if (FieldByName('ms_codigo').AsString = '2.2') and //	2.2  Informe sobre Resultado Técnico - (interno)
           ((FieldByName('sr_idmotivocotizacion').AsString = '32') or //Informe resultado técnico cliente
           (FieldByName('sr_idmotivocotizacion').AsString = '25') or //Informe resultado técnico cliente
           (FieldByName('sr_idmotivocotizacion').AsString = '24') or //Informe resultado técnico interno.
           (FieldByName('sr_idmotivocotizacion').AsString = '33')) then //Informe resultado técnico interno.
          tbEndoso.Enabled  := True
        else
        if (FieldByName('ms_codigo').AsString = '8') and //	8  Retarifación
           ((FieldByName('sr_idmotivocotizacion').AsString = '102') or //Se rebajan las alícuotas.
           (FieldByName('sr_idmotivocotizacion').AsString = '22') or  //Se rebajan las alícuotas.
           (FieldByName('sr_idmotivocotizacion').AsString = '37')) then //Se rebajan las alícuotas.
          tbEndoso.Enabled  := True;

        if not tbEndoso.Enabled then
          tbEndoso.Hint := 'No se puede crear el endoso porque su estado no lo permite.'
        else
          tbEndoso.Hint := 'Ver o Crear un Endoso';
        {$endregion}
      end;
    end
    else
      tbEndoso.Enabled  := False; //Si no es es  EC_NOTIF_COMERCIAL o sEstado = EC_NOTIF_CLIENTE lo deshabilito
  end; //end del Dataset
end;

procedure TfrmReAfiliacion.btnCancelar7Click(Sender: TObject);
begin
  fpAutorizar.Close;
end;

procedure TfrmReAfiliacion.fpAutorizarKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    fpAutorizar.Close;
end;

procedure TfrmReAfiliacion.fpAutorizarBeforeShow(Sender: TObject);
begin
  memoObservaciones4.Clear;
end;

procedure TfrmReAfiliacion.btnAceptar5Click(Sender: TObject);
var
  iTransaccionWeb: Integer;
  sNuevoEstado: String;
  sSql: String;
begin
  Verificar((rgAprobar.ItemIndex < 0), rgAprobar, 'Debe indicar si autoriza la carga de la solicitud o no.');

  BeginTrans;
  try
    sSql :=
      'SELECT MAX(au_idtransaccionweb)' +
       ' FROM art.aau_autorizarevision, asr_solicitudreafiliacion' +
      ' WHERE au_idsolicitudrevision = sr_id' +
        ' AND sr_id = :id';
    iTransaccionWeb := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('sr_id').AsInteger]);

    sSql :=
      'UPDATE web.wtw_transaccionweb' +
            ' SET tw_fechaejecucion = SYSDATE,' +
                ' tw_usuejecucion = :usuejecucion,' +
                ' tw_fecharespuestamail = SYSDATE' +
          ' WHERE tw_id = :id';
    EjecutarSqlSTEx(sSql, [Sesion.UserID, iTransaccionWeb]);

    sSql :=
      'UPDATE art.aau_autorizarevision' +
	      ' SET au_fechaautorizacion = SYSDATE,' +
  	        ' au_autorizado = ' + SqlValue(String(IIF((rgAprobar.ItemIndex = 0), 'S', 'N'))) + ',' +
         	  ' au_usuarioautorizo = ' + SqlValue(Sesion.UserID) + ',' +
	          ' au_observacionrespuesta = ' + SqlValue(memoObservaciones4.Lines.Text) +
    	' WHERE au_idtransaccionweb = ' + SqlValue(iTransaccionWeb);
    EjecutarSqlST(sSql);

    // Actualizo el estado de la solicitud..
    sSql :=
      'UPDATE asr_solicitudreafiliacion' +
    	 ' SET sr_estadosolicitud = ' + SqlValue(String(IIF((rgAprobar.ItemIndex = 0), '00', '05.2'))) +
 	   ' WHERE sr_id = ' + SqlValue(sdqConsulta.FieldByName('sr_id').AsInteger);
    EjecutarSqlST(sSql);

    // Si aprobó el pedido y tiene deuda..
    if (rgAprobar.ItemIndex = 0) and (sdqConsulta.FieldByName('deuda').AsFloat > 0) then
    begin
      sSql :=
        'BEGIN' +
         ' intraweb.do_solicitarpermisorevision(:idsolicitudrevision, :usuario, :deuda, :gestor, :observaciones);' +
       ' END;';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sr_id').AsInteger, Sesion.UserID, sdqConsulta.FieldByName('deuda').AsFloat, '', '']);

      sSql :=
        'SELECT 1' +
         ' FROM aco_contrato' +
        ' WHERE co_contrato = :contrato' +
          ' AND co_idestudio IS NOT NULL';
      if ExisteSqlEx(sSql, [sdqConsulta.FieldByName('sr_contrato').AsInteger]) then
        sNuevoEstado := EC_PEND_AUTO_LEGALES
      else
        sNuevoEstado := EC_PEND_AUTO_COBRANZA;

      sSql :=
        'UPDATE asr_solicitudreafiliacion' +
          ' SET sr_estadosolicitud = :estado' +
        ' WHERE sr_id = :id';
      EjecutarSqlSTEx(sSql, [sNuevoEstado, sdqConsulta.FieldByName('sr_id').AsInteger]);
    end;

    CommitTrans;

    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
    ActualizarConsulta;
    fpAutorizar.Close;
  except
    on E: Exception do
    begin
      RollBack;
      MsgBox(E.Message);
    end;
  end;
end;

procedure TfrmReAfiliacion.tbAutorizarClick(Sender: TObject);
begin
  fpAutorizar.ShowModal;
end;

procedure TfrmReAfiliacion.fpCancelarBeforeShow(Sender: TObject);
begin
  fraMotivoCancelacion.Clear;
  memoObservacionesCancelacion.Clear;
  LockControl(fraMotivoCancelacion, IsComercial);

  if IsComercial then
    fraMotivoCancelacion.Value := 6;
end;

procedure TfrmReAfiliacion.tbEstadoCuentaClick(Sender: TObject);
begin
  Verificar(sdqConsulta.FieldByName('sr_fotoestadodecuenta').IsNull, Grid, 'No hay un estado de cuenta disponible para esta solicitud.');
  Do_ImprimirArchivoEstCuenta(sdqConsulta.FieldByName('sr_fotoestadodecuenta').AsString);
end;

procedure TfrmReAfiliacion.fraMotivoSolicitudExit(Sender: TObject);
begin
  Verificar((fraMotivoSolicitud.Codigo = '6.1') and (Sesion.Sector <> 'TECNICO'), fraMotivoSolicitud.edCodigo, 'Usted no tiene habilitado este Motivo de Solicitud.');

  inherited;
  fraMotivoSolicitud.FrameExit(Sender);
end;

procedure TfrmReAfiliacion.tbRecuperarDatosClick(Sender: TObject);
begin
  memoInformacionComplementaria.Clear;                 //tk 62547
  IniciarEspera('Descargando información...');
  try
    Application.ProcessMessages;
    Sleep(1000);    // Hago una pausita porque la información baja tan rápida que ni se llega a mostrar el cartel..
    fraImportUART.BuscarPorEmpresa(fraEmpresa.mskCUIT.Text);
   // GuardarTotalJuiciosEnObservaciones;
   // CargarSolapaJuicios;
  finally
    DetenerEspera;
  end;

  memoInformacionComplementaria.Lines.Add(RecuperarJuiciosUart);
  memoInformacionComplementaria.Lines.Add(RecuperarSeclosUart);
  memoInformacionComplementaria.Lines.Add(RecuperarJuiciosArt);
  memoInformacionComplementaria.Lines.Add(RecuperarSeclosArt);
  memoInformacionComplementaria.Lines.Add(RecuperarSiniestros);
  memoInformacionComplementaria.Lines.Add(RecuperarObservacionesCuit);
end;

procedure TfrmReAfiliacion.tbRedireccionSolicitudPermisoClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningún registro seleccionado.');
  Verificar((sdqConsulta.FieldByName('sr_usualta').AsString <> Sesion.UserID), tbRedireccionSolicitudPermiso, 'Usted no es el usuario que cargó la solicitud.');

  if (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_PEND_AUTO_COBRANZA) or
     (sdqConsulta.FieldByName('sr_estadosolicitud').AsString = EC_PEND_AUTO_LEGALES) then
    SolicitarPermisoACobranza(sdqConsulta.FieldByName('sr_id').AsInteger, sdqConsulta.FieldByName('sr_contrato').AsInteger, sdqConsulta.FieldByName('sr_deuda').AsFloat, True)
  else
    if fpRedireccionarSolicitudPermiso.ShowModal = mrOk then
    try
      sSql :=
        'BEGIN' +
         ' intraweb.do_reenviarsolicpermrevision(:idsolicitudrevision, :destinatario, :usuario, :observaciones);' +
       ' END;';
      EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('sr_id').AsInteger, fraDestinatario.Codigo, Sesion.UserID, memoObservaciones5.Lines.Text]);

      MsgBox('Su pedido ha sido enviado exitosamente, la respuesta la recibirá vía e-mail.');
    except
      on E: Exception do
        ErrorMsg(E, 'Error al realizar la solicitud.')
    end;
end;

procedure TfrmReAfiliacion.tbRefrescarClick(Sender: TObject);
begin
  inherited;
  //pnlEndoso.Caption := 'Pendientes:' + IntToStr(CountEndosoPendientes) +' ';
  lbPendientes.Caption := 'Pendientes:' + IntToStr(CountEndosoPendientes) +' ';
end;

procedure TfrmReAfiliacion.btnAceptar6Click(Sender: TObject);
begin
  Verificar(fraDestinatario.IsEmpty, fraDestinatario.edCodigo, 'El campo destinatario es obligatorio.');

  fpRedireccionarSolicitudPermiso.ModalResult := mrOk;
end;

procedure TfrmReAfiliacion.btnCancelar8Click(Sender: TObject);
begin
  fpRedireccionarSolicitudPermiso.Close;
end;

procedure TfrmReAfiliacion.fpRedireccionarSolicitudPermisoBeforeShow(Sender: TObject);
var
  sSql: String;
begin
  fraDestinatario.Propiedades.Sql :=
    'SELECT ID, codigo, descripcion, baja' +
     ' FROM (SELECT se_usuario ID, se_usuario codigo, se_nombre descripcion, uc_fechabaja baja' +
             ' FROM auc_usuariocanal, use_usuarios' +
            ' WHERE uc_usuario = se_usuario' +
              ' AND uc_fechabaja IS NULL' +
              ' AND se_fechabaja IS NULL' +
              ' AND se_usuariogenerico <> ''S''' +
              ' AND uc_esresponsable = ''T''' +
              ' AND uc_idcanal = ' + SqlValue(sdqConsulta.FieldByName('sr_idcanal').AsInteger) +
           ' UNION' +
           ' SELECT se_usuario, se_usuario, se_nombre, NULL' +
             ' FROM use_usuarios' +
            ' WHERE se_usuario IN(''SSAIRE'', ''FMFIRENZE'', ''DGUARISTE'', ''JISABELLA'', ''MCECHOVIC'', ''FELIZALDE'')) tabla' +
    ' WHERE 1 = 1';

  sSql :=
    'SELECT au_observacion' +
     ' FROM art.aau_autorizarevision' +
    ' WHERE au_idsolicitudrevision = :idsolicitudrevision' +
 ' ORDER BY au_id DESC';
  memoObservaciones5.Lines.Text := ValorSqlEx(sSql, [sdqConsulta.FieldByName('SR_ID').AsInteger]);
end;

procedure TfrmReAfiliacion.edCostoFijoCotizadoChange(Sender: TObject);
var
  eMasaSalarial: Extended;
  iCantidadTrabajadores: Integer;
begin
  if (not FCalcularValoresCotizados) or (edPorcentajeVariableCotizado.ReadOnly) or (not edCostoFijoCotizado.Focused) then
    Exit;

  if edTrabajadoresTotalNuevo.Value = 0 then
    iCantidadTrabajadores := edTrabajadores.Value
  else
    iCantidadTrabajadores := edTrabajadoresTotalNuevo.Value;

  if edMasaSalarialTotalNuevo.Value = 0 then
    eMasaSalarial := edMasaSalarial.Value
  else
    eMasaSalarial := edMasaSalarialTotalNuevo.Value;

  if (iCantidadTrabajadores > 0) and (eMasaSalarial > 0) then
    edPorcentajeVariableCotizado.Value := (edCostoXTrabajadorCotizado.Value - edCostoFijoCotizado.Value) / eMasaSalarial * iCantidadTrabajadores * 100;
end;

procedure TfrmReAfiliacion.edCostoXTrabajadorCotizadoChange(Sender: TObject);
var
  eMasaSalarial: Extended;
  iCantidadTrabajadores: Integer;
begin
  if (not FCalcularValoresCotizados) or (edPorcentajeVariableCotizado.ReadOnly) or (not edCostoXTrabajadorCotizado.Focused) then
    Exit;

  if edTrabajadoresTotalNuevo.Value = 0 then
    iCantidadTrabajadores := edTrabajadores.Value
  else
    iCantidadTrabajadores := edTrabajadoresTotalNuevo.Value;

  if edMasaSalarialTotalNuevo.Value = 0 then
    eMasaSalarial := edMasaSalarial.Value
  else
    eMasaSalarial := edMasaSalarialTotalNuevo.Value;

  if (iCantidadTrabajadores > 0) and (eMasaSalarial > 0) then
    edPorcentajeVariableCotizado.Value := (edCostoXTrabajadorCotizado.Value - edCostoFijoCotizado.Value) / eMasaSalarial * iCantidadTrabajadores * 100;
end;

procedure TfrmReAfiliacion.edPorcentajeVariableCotizadoChange(Sender: TObject);
var
  eMasaSalarial: Extended;
  iCantidadTrabajadores: Integer;
begin
  if (not FCalcularValoresCotizados) or (edCostoFijoCotizado.ReadOnly) or (not edPorcentajeVariableCotizado.Focused) then
    Exit;

  if edTrabajadoresTotalNuevo.Value = 0 then
    iCantidadTrabajadores := edTrabajadores.Value
  else
    iCantidadTrabajadores := edTrabajadoresTotalNuevo.Value;

  if edMasaSalarialTotalNuevo.Value = 0 then
    eMasaSalarial := edMasaSalarial.Value
  else
    eMasaSalarial := edMasaSalarialTotalNuevo.Value;

  if (iCantidadTrabajadores > 0) and (eMasaSalarial > 0) then
    edCostoFijoCotizado.Value := edCostoXTrabajadorCotizado.Value - ((edPorcentajeVariableCotizado.Value / 100) * eMasaSalarial / iCantidadTrabajadores);
end;

procedure TfrmReAfiliacion.Label66Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', URL_STATUS_BCRA, nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmReAfiliacion.ImportarDatosBCRA(Sender: TObject);
begin
  fraStatusBCRA.Value := GetStatusBCRA(fraEmpresa.CUIT);
  VCLExtra.LockControl(fraStatusBCRA, not fraStatusBCRA.IsEmpty);
end;

procedure TfrmReAfiliacion.tbCerrarRevisionClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof) or (sdqConsulta.FieldByName('sr_estadosolicitud').AsString <> EC_NOTIF_CLIENTE), nil, 'Debe elegir una revisión con estado "Notificada al cliente".');

  if fpCerrarRevision.ShowModal = mrOk then
    case rgEstado.ItemIndex of
      0:  CerrarRevision(EC_CERRADA_MAL);
      1:  CerrarRevision(EC_CERRADA_BIEN);
    end;
end;

procedure TfrmReAfiliacion.btnCancelar9Click(Sender: TObject);
begin
  fpCerrarRevision.Close;
end;

procedure TfrmReAfiliacion.btnAceptar7Click(Sender: TObject);
begin
  Verificar((Trim(memoObservacionesCierre.Text) = ''), memoObservacionesCierre, 'El campo Observaciones es obligatorio.');

  fpCerrarRevision.ModalResult := mrOk;
end;

procedure TfrmReAfiliacion.fpCerrarRevisionBeforeShow(Sender: TObject);
begin
  memoObservacionesCierre.Clear;
  rgEstado.ItemIndex := 0;
end;

procedure TfrmReAfiliacion.btnAdministracionArchivosClick(Sender: TObject);
  procedure ShowFormAdmArchivos(const aIdRevision: Integer);
  begin
    Application.CreateForm(TfrmAdministracionArchivosRevisionPrecio, frmAdministracionArchivosRevisionPrecio);
    try
      frmAdministracionArchivosRevisionPrecio.Mostrar(aIdRevision, IIF(IsComercial, 'C', 'T'));
      CalcularArchivos;
    finally
      FreeAndNil(frmAdministracionArchivosRevisionPrecio);
    end;
  end;

var
  sSql: String;
begin
  if ModoABM = maAlta then
  begin
    if MsgAsk('Antes de entrar a este módulo debe guardar la solicitud actual. ¿ Desea guardarla ahora ?') then
    begin
      if Validar and DoABM then
      begin
        sSql := 'SELECT MAX(sr_id) FROM asr_solicitudreafiliacion';
        ShowFormAdmArchivos(ValorSqlInteger(sSql));
        fpAbm.Close;
      end;
    end;
  end
  else
    ShowFormAdmArchivos(sdqConsulta.FieldByName('sr_id').AsInteger);
end;

procedure TfrmReAfiliacion.btnAceptar8Click(Sender: TObject);
begin
  Verificar((not rbAutorizada.Checked) and (not rbEnPreparacion.Checked) and (not rbPendienteAutorizar.Checked), nil, 'Debe seleccionar un estado.');
  fpEstado.ModalResult := mrOk;

  if rbAutorizada.Checked then
    FEstadoNuevo := EC_AUTORIZADA;
  if rbEnPreparacion.Checked then
    FEstadoNuevo := EC_EN_PREPARACION;
  if rbPendienteAutorizar.Checked then
    FEstadoNuevo := EC_PEND_AUTORIZ;
end;

procedure TfrmReAfiliacion.btnCancelar10Click(Sender: TObject);
begin
  fpEstado.ModalResult := mrCancel;
end;

procedure TfrmReAfiliacion.fpEstadoBeforeShow(Sender: TObject);
//var
//  iCapitasHasta: Integer;
//  sSql: String;
begin
  rbAutorizada.Checked := False;
  rbEnPreparacion.Checked := False;
  rbPendienteAutorizar.Checked := False;

{
Se comenta esta validación el 8.11.2011 a pedido de MMAGALLANES por vía telefónica..
  sSql :=
    'SELECT ac_capitashasta' +
     ' FROM art.aac_autorizacotiza' +
    ' WHERE (INSTR('','' || ac_srtrevision || '','', :p1) > 0 OR ' + SqlString(sdqConsulta.FieldByName('statussrt').AsString, False, True) + ' IS NULL)' +
      ' AND INSTR('','' || ac_bcra || '','', :p3) > 0' +
      ' AND INSTR('','' || ac_riesgo || '','', :p4) > 0' +
      ' AND INSTR('','' || ac_usuarionotificacion || '','', :p5) > 0' +
      ' AND ac_puesto = :p6' +
      ' AND ac_fechabaja IS NULL';
  iCapitasHasta := ValorSqlIntegerEx(sSql, [',' + sdqConsulta.FieldByName('statussrt').AsString + ',',
                                            ',' + fraStatusBCRA.Codigo + ',',
                                            ',' + sdqConsulta.FieldByName('ac_idtiporiesgo').AsString + ',',
                                            Sesion.UserID,
                                            sdqConsulta.FieldByName('sr_puestoautorizacion').AsString]);
  rbAutorizada.Enabled := (iCapitasHasta >= IIF((edTrabajadoresTotalNuevo.Value = 0), edTrabajadores.Value, edTrabajadoresTotalNuevo.Value));
}
  rbAutorizada.Enabled := True;
end;

procedure TfrmReAfiliacion.fraMotivoRespuestaPropiedadesChange(Sender: TObject);
begin
  inherited;

  if (fraMotivoRespuesta.Value = 21) or (fraMotivoRespuesta.Value = 38) or (fraMotivoRespuesta.Value = 39) or (fraMotivoRespuesta.Value = 103) then
  begin
    edCostoXTrabajadorCotizado.Clear;
    edCostoFijoCotizado.Clear;
    edPorcentajeVariableCotizado.Clear;
  end;
end;

procedure TfrmReAfiliacion.Label8Click(Sender: TObject);
var
  eComision: Extended;
begin
  eComision := GetComision(fraVendedor.Value, fraSector.Value, IIF((edTrabajadoresTotalNuevo.Value = 0), edTrabajadores.Value, edTrabajadoresTotalNuevo.Value), fraHolding.Value);
  edComision.Value := eComision;
  FComisionCalculada := True;

  if eComision = -1 then
    MsgBox('El vendedor seleccionado no tiene cargada la comisión.');
end;

procedure TfrmReAfiliacion.btnUltimaComisionContratoClick(Sender: TObject);
begin
  with TfrmContratoVendedor.Create(Self) do
  try
    DoCargarDatos(fraEmpresa.Contrato);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmReAfiliacion.tbAutorizarNotificarClick(Sender: TObject);
var
  iLoop: Integer;
  iTransaccionWeb: Integer;
  sSql: String;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'Debe seleccionar algún registro.');

  sdqConsulta.DisableControls;

  try
    for iLoop := 0 to (Grid.SelectedRows.Count - 1) do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

      Verificar(not tbAutorizar.Enabled, Grid, Format('[Solicitud Nº %d] Usted no tiene permiso para autorizar.', [sdqConsulta.FieldByName('sr_nrosolicitud').AsInteger]));

      if not Seguridad.Claves.IsActive('PermisoAutorizarCargadasMismoUsuario') then
        Verificar((sdqConsulta.FieldByName('sr_usuariotarifa').AsString = Sesion.UserID), Grid, Format('[Solicitud Nº %d] El usuario de carga de tarifa fue usted.', [sdqConsulta.FieldByName('sr_nrosolicitud').AsInteger]));

      Verificar((sdqConsulta.FieldByName('deuda').AsFloat > 0), Grid, Format('[Solicitud Nº %d] Empresa con deuda.', [sdqConsulta.FieldByName('sr_nrosolicitud').AsInteger]));
    end;


    for iLoop := 0 to (Grid.SelectedRows.Count - 1) do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

      BeginTrans;
      try
        // Autorizar..
        sSql :=
          'SELECT MAX(au_idtransaccionweb)' +
           ' FROM art.aau_autorizarevision, asr_solicitudreafiliacion' +
          ' WHERE au_idsolicitudrevision = sr_id' +
            ' AND sr_id = :id';
        iTransaccionWeb := ValorSqlIntegerEx(sSql, [sdqConsulta.FieldByName('sr_id').AsInteger]);

        sSql :=
          'UPDATE web.wtw_transaccionweb' +
                ' SET tw_fechaejecucion = SYSDATE,' +
                    ' tw_usuejecucion = :usuejecucion,' +
                    ' tw_fecharespuestamail = SYSDATE' +
              ' WHERE tw_id = :id';
        EjecutarSqlSTEx(sSql, [Sesion.UserID, iTransaccionWeb]);

        sSql :=
          'UPDATE art.aau_autorizarevision' +
            ' SET au_fechaautorizacion = SYSDATE,' +
                ' au_autorizado = ''S'',' +
                ' au_usuarioautorizo = :usuarioautorizo' +
          ' WHERE au_idtransaccionweb = :idtransaccionweb';
        EjecutarSqlSTEx(sSql, [Sesion.UserID, iTransaccionWeb]);

        // Actualizo el estado de la solicitud..
        sSql :=
          'UPDATE asr_solicitudreafiliacion' +
           ' SET sr_estadosolicitud = ''03''' +
         ' WHERE sr_id = :id';
        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sr_id').AsInteger]);

        CommitTrans(True);
      except
        on E: Exception do
        begin
          RollBack(True);
          MessageDlg(E.Message, mtError, [mbOK], 0);
        end;
      end;

      NotificarAComercial(False, False);
    end;

    MessageDlg('Las solicitudes han sido autorizadas y notificadas correctamente.', mtInformation, [mbOK], 0);
  finally
    sdqConsulta.EnableControls;
  end;

  tbRefrescarClick(nil);
end;

procedure TfrmReAfiliacion.tbCambiarUsuarioAutorizacionClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((sdqConsulta.FieldByName('sr_estadosolicitud').AsString <> EC_PEND_AUTORIZ), Grid, 'El estado debe ser Pendiente de Autorizacion.');

  if fpCambiarUsuarioAutorizacion.ShowModal = mrOk then
  begin
    sSql :=
      'UPDATE asr_solicitudreafiliacion' +
        ' SET sr_usuarioautorizacion = :usuarioautorizacion,' +
            ' sr_puestoautorizacion = :puestoautorizacion,' +
            ' sr_fechamodifautorizacion = SYSDATE,' +
            ' sr_usumodifautorizacion = :usumodifautorizacion' +
      ' WHERE sr_id = :id';
    EjecutarSqlEx(sSql, [fraUsuario.Descripcion,
                         fraUsuario.sdqDatos.FieldByName('ac_puesto').AsInteger,
                         Sesion.UserID,
                         sdqConsulta.FieldByName('sr_id').AsInteger]);
    RefreshData;
  end;
end;

procedure TfrmReAfiliacion.fpHintColoresKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpHintColores.Close;
end;

procedure TfrmReAfiliacion.tbColoresClick(Sender: TObject);
begin
  fpHintColores.ShowModal;
end;

procedure TfrmReAfiliacion.btnCerrarClick(Sender: TObject);
begin
  fpHintColores.Close;
end;

procedure TfrmReAfiliacion.tbBuscarEmailsClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or(sdqConsulta.FieldByName('sr_id').IsNull), Grid, 'Debe seleccionar algún registro.');

  with TfrmElementosEnviados.Create(Self) do
  begin
    MenuItem := frmPrincipal.mnuElementosEnviados;
    FormStyle := fsMDIChild;

    IdRegistro := frmReAfiliacion.sdqConsulta.FieldByName('sr_id').AsInteger;
    TipoRegistro := 'ASR';
    RefreshData;
  end;
end;

procedure TfrmReAfiliacion.lbStatusSRTLinkClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.srt.gov.ar/consultas/vigencias/vigencias.asp', nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmReAfiliacion.fpCambiarUsuarioAutorizacionShow(Sender: TObject);
var
  iPrioridad: String;
  sIdTipoRiesgo: String;
  sSql: String;
begin
  sSql :=
    'SELECT ac_idtiporiesgo' +
     ' FROM cac_actividad' +
    ' WHERE ac_id = :id';
  sIdTipoRiesgo := ValorSqlEx(sSql, [sdqConsulta.FieldByName('sr_idactividad1').AsInteger]);

  sSql :=
    'SELECT   ac_prioridad' +
       ' FROM art.aac_autorizacotiza' +
      ' WHERE :capitas BETWEEN ac_capitasdesde AND ac_capitashasta' +
        ' AND INSTR('','' || ac_srt || '','', :srt) > 0' +
        ' AND INSTR('','' || ac_bcra || '','', :bcra) > 0' +
        ' AND INSTR('','' || ac_riesgo || '','', :riesgo) > 0' +
        ' AND ac_fechabaja IS NULL' +
   ' ORDER BY ac_prioridad';
  iPrioridad := ValorSqlEx(sSql, [sdqConsulta.FieldByName('empleados').AsInteger,
                                  ',' + sdqConsulta.FieldByName('statussrt').AsString + ',',
                                  ',' + sdqConsulta.FieldByName('statusbcra').AsString + ',',
                                  ',' + sIdTipoRiesgo + ',']);

  with fraUsuario do
  begin
    Propiedades.ExtraCondition := ' AND ac_prioridad >= 0' + SqlString(iPrioridad) + ' ';
    Clear;
  end;
end;

procedure TfrmReAfiliacion.btnCancelar41Click(Sender: TObject);
begin
  fpCambiarUsuarioAutorizacion.ModalResult := mrCancel;
end;

procedure TfrmReAfiliacion.btnAceptar1Click(Sender: TObject);
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'Por favor seleccione el usuario.');

  fpCambiarUsuarioAutorizacion.ModalResult := mrOk;
end;

{procedure TfrmReAfiliacion.tbImportSRTClick(Sender: TObject);
begin
  fraStatusSRT.Codigo := IntToStr(GetStatusSRT(fraEmpresa.CUIT));
end;  }

procedure TfrmReAfiliacion.CambiaStatusSrt(Sender: TObject);
begin
  fraArtAnterior.Locked := (fraStatusSRT.Codigo = '1');
  if fraStatusSRT.Codigo = '1' then
    fraArtAnterior.Clear;
end;

procedure TfrmReAfiliacion.gridEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if not Field.DataSet.FieldByName('er_fechabaja').IsNull then
  begin
    AFont.Style := AFont.Style + [fsStrikeOut];
    AFont.Color := clRed;
  end;
end;

procedure TfrmReAfiliacion.tbEventosClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir un registro.');

  lbSolicitud.Caption := 'Solicitud de revisión de precio Nº ' + sdqConsulta.FieldByName('sr_nrosolicitud').AsString;

  sSql := sdqEventos.SQL.Text;

  LoadDynamicSortFields(sdEventos.SortFields, gridEventos.Columns);

  sdqEventos.SQL.Text := sSql + sdEventos.OrderBy;

  sdqEventos.ParamByName('idrevisionprecio').AsInteger := sdqConsulta.FieldByName('sr_id').AsInteger;

  OpenQuery(sdqEventos);
  ActivarABMEventos(False);

  fpEventos.ShowModal;

  sdqEventos.SQL.Text := sSql;
end;

procedure TfrmReAfiliacion.tbNuevo2Click(Sender: TObject);
begin
  edFechaEvento.Clear;
  memoDescripcionEvento.Clear;
  tbGuardar.Tag := 1;

  ActivarABMEventos(True);
end;

procedure TfrmReAfiliacion.tbModificar2Click(Sender: TObject);
var
  bContinuar: Boolean;
begin
  if sdqEventos.FieldByName('er_id').AsInteger < 1 then
    Exit;


  bContinuar := True;

  tbGuardar.Tag := 2;

  if not sdqEventos.FieldByName('er_fechabaja').IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿ Desea restaurarlo ?') then
      bContinuar := False;

  if bContinuar then
    ActivarABMEventos(True);
end;

procedure TfrmReAfiliacion.tbDarBajaClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqEventos.FieldByName('er_id').AsInteger < 1 then
    Exit;


  if MsgAsk('¿ Realmente desea dar de baja el evento seleccionado ?') then
  try
    sSql :=
      'UPDATE afi.aer_eventosrevicionprecio' +
        ' SET er_fechabaja = SYSDATE,' +
            ' er_usubaja = :usubaja' +
      ' WHERE er_id = :ID';
    EjecutarSqlEx(sSql, [Sesion.UserID, sdqEventos.FieldByName('er_id').AsInteger]);
    sdqEventos.Refresh;
  except
    on E: Exception do
      InvalidMsg(nil, 'Error al guardar.' + CRLF + E.Message);
  end;
end;

procedure TfrmReAfiliacion.tbGuardarClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((edFechaEvento.Date = 0), edFechaEvento, 'La fecha es un dato obligatorio.');
  Verificar((memoDescripcionEvento.Text = ''), memoDescripcionEvento, 'La descripción es un dato obligatorio.');

  try
    if tbGuardar.Tag = 1 then   // Alta..
    begin
      sSql :=
        'INSERT INTO afi.aer_eventosrevicionprecio' +
                    '(er_descripcion, er_fecha, er_fechaalta, er_id, er_idrevisionprecio, er_usualta)' +
            ' VALUES (:descripcion, :fecha, SYSDATE, -1, :idrevisionprecio, :usualta)';
      EjecutarSqlEx(sSql, [memoDescripcionEvento.Lines.Text,
                           TDateTimeEx.Create(edFechaEvento.Date),
                           sdqConsulta.FieldByName('sr_id').AsInteger,
                           Sesion.UserID]);
    end;

    if tbGuardar.Tag = 2 then   // Modificación..
    begin
      sSql :=
        'UPDATE afi.aer_eventosrevicionprecio' +
          ' SET er_descripcion = :descripcion,' +
              ' er_fecha = :fecha,' +
              ' er_fechabaja = NULL,' +
              ' er_fechamodif = SYSDATE,' +
              ' er_usubaja = NULL,' +
              ' er_usumodif = :usumodif' +
        ' WHERE er_id = :id';
      EjecutarSqlEx(sSql, [memoDescripcionEvento.Lines.Text,
                           TDateTimeEx.Create(edFechaEvento.Date),
                           Sesion.UserID,
                           sdqEventos.FieldByName('er_id').AsInteger]);
    end;

    sdqEventos.Refresh;

    ActivarABMEventos(False);
  except
    on E: Exception do
      InvalidMsg(nil, 'Error al guardar.' + CRLF + E.Message);
  end;
end;

procedure TfrmReAfiliacion.tbCancelarClick(Sender: TObject);
begin
  ActivarABMEventos(False);
end;

procedure TfrmReAfiliacion.tbOrdenar2Click(Sender: TObject);
begin
  LoadDynamicSortFields(sdEventos.SortFields, gridEventos.Columns);
  sdEventos.Execute;
end;

procedure TfrmReAfiliacion.tbImprimir2Click(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TqrEventos, qrEventos);
  try
    qrEventos.Preparar('R', sdqConsulta.FieldByName('sr_id').AsInteger);
  finally
    FreeAndNil(qrEventos);
  end;
end;

procedure TfrmReAfiliacion.gridEventosDblClick(Sender: TObject);
begin
  if tbModificar2.Enabled then
    tbModificar2.Click;
end;

procedure TfrmReAfiliacion.btnCerrar2Click(Sender: TObject);
begin
  fpEventos.ModalResult := mrCancel;
end;

procedure TfrmReAfiliacion.fpEventosShow(Sender: TObject);
begin
  edFechaEvento.Clear;
  memoDescripcionEvento.Clear;
end;

procedure TfrmReAfiliacion.sdqEventosAfterScroll(DataSet: TDataSet);
begin
  edFechaEvento.Date := sdqEventos.FieldByName('er_fecha').AsDateTime;
  memoDescripcionEvento.Lines.Text := sdqEventos.FieldByName('er_descripcion').AsString;
end;

procedure TfrmReAfiliacion.sdqEventosAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
    TDateTimeField(FieldByName('fecha')).DisplayFormat := 'dd/mm/yyyy hh:nn';
end;

procedure TfrmReAfiliacion.tbCambiarUsuarioAutorizacion2Click(Sender: TObject);
var
  sSql: String;
begin
  Verificar(sdqConsulta.IsEmpty, Grid, 'No hay registros para modificar.');
  Verificar((Grid.SelectedIndex = -1), Grid, 'No hay registros seleccionados.');

  if fpCambiarUsuarioAutorizacion.ShowModal = mrOk then
  begin
    sSql :=
      'UPDATE asr_solicitudreafiliacion' +
        ' SET sr_usuarioautorizacion = :usuarioautorizacion,' +
            ' sr_puestoautorizacion = :puestoautorizacion,' +
            ' sr_fechamodifautorizacion = SYSDATE,' +
            ' sr_usumodifautorizacion = :usumodifautorizacion' +
      ' WHERE sr_id = :id';
    EjecutarSqlEx(sSql, [fraUsuario.Descripcion,
                         fraUsuario.sdqDatos.FieldByName('ac_puesto').AsInteger,
                         Sesion.UserID,
                         sdqConsulta.FieldByName('sr_id').AsInteger]);
    RefreshData;
  end;
end;
{
function TfrmReAfiliacion.VerificarReafiliacionRepetida: String;
var
  aQuery: TSDQuery;
  sRecotizacion: String;
  sSql: String;
begin
  sSql :=
      'SELECT sr_nrosolicitud' +
       ' FROM asr_solicitudreafiliacion' +
      ' WHERE sr_estadosolicitud NOT IN (''05'', ''05.1'', ''05.2'', ''18'', ''18.1'', ''18.2'', ''18.3'', ''18.4'')' +
        ' AND sr_fechaalta > SYSDATE - 30' +
        ' AND sr_cuit = :cuit';
  if not fraCanal.IsEmpty then
    sSql := sSql + ' AND sr_idcanal = ' + IntToStr(fraCanal.Value);
  if not fraEntidad.IsEmpty then
    sSql := sSql + ' AND sr_identidad = ' + SqlValue(fraEntidad.Value);
  if not fraSucursal.IsEmpty then
    sSql := sSql + ' AND sr_idsucursal = ' + SqlValue(fraSucursal.Value);
  if not fraHolding.IsEmpty then
    sSql := sSql + ' AND sr_idholding = ' + SqlValue(fraHolding.Value);
  if not fraCentroReg.IsEmpty then
    sSql := sSql + ' AND sr_idcentroregional = ' + SqlValue(fraCentroReg.Value);
  if not fraVendedor.IsEmpty then
    sSql := sSql + ' AND sr_idvendedor = ' + SqlValue(fraVendedor.Value);

  aQuery := GetQueryEx(sSql, [fraEmpresa.mskCUIT.Text]);
  try
    while not aQuery.Eof do
    begin
      sRecotizacion := sRecotizacion + aQuery.FieldByName('sr_nrosolicitud').AsString + ' ';
      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
    Result := sRecotizacion;
end;
}
procedure TfrmReAfiliacion.btnAceptarClick(Sender: TObject);
begin
    //si todo esta en 0, el costo fijo es 0.6, y no sacaron prima volver a ponerlo en 0 para que no se grabe con valor incorrecto.
    //Tk 39238
  if (edCostoFijoCotizado.Value = 0.6) and (edPorcentajeVariableCotizado.Value = 0) and (edCostoXTrabajadorCotizado.Value = 0) then
      edCostoFijoCotizado.Value := 0.0;

  inherited;
end;

procedure TfrmReAfiliacion.fraEmpresaExit(Sender: TObject);
var
  sResultado: String;
  sSql: String;
begin
  sSql := 'SELECT art.cotizacion.get_permitecotizar(:cuit, ''R'') FROM DUAL';
  sResultado := Trim(ValorSqlEx(sSql, [fraEmpresa.CUIT]));
  if (sResultado <> '') and (sResultado <> 'S') then
  begin
    MsgBox(sResultado);
    fraEmpresa.mskCUIT.SetFocus;
    Abort;
  end;

  sSql :=
    'SELECT co_idtiporegimen' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = :contrato';
  Verificar((fraMotivoSolicitud.Codigo = '9') and (ValorSqlIntegerEx(sSql, [fraEmpresa.Contrato], -1) <> 2), fraEmpresa.mskCUIT, 'El contrato no corresponde al Régimen Especial.');

  inherited;
  fraEmpresa.FrameExit(Sender);
end;

procedure TfrmReAfiliacion.tbCambioEstadoClick(Sender: TObject);
var
  iLoop: Integer;
  sSql: String;
begin
  Verificar((not sdqConsulta.Active) or(sdqConsulta.FieldByName('sr_id').IsNull), Grid, 'Debe seleccionar algún registro.');

  if fpCambioEstado.ShowModal <> mrOk then
    Exit;

  with sdqConsulta do
  begin
    DisableControls;
    try
      BeginTrans;
      try
        for iLoop := 0 to (Grid.SelectedRows.Count - 1) do
        begin
          GotoBookmark(Pointer(Grid.SelectedRows.Items[iLoop]));

          sSql :=
            'UPDATE asr_solicitudreafiliacion' +
              ' SET sr_estadosolicitud = :estadosolicitud' +
            ' WHERE sr_id = :id';
          EjecutarSqlSTEx(sSql, [fraNuevoEstado.Codigo, FieldByName('sr_id').AsInteger]);
        end;
        CommitTrans;
      except
        on E: Exception do
        begin
          Rollback;
          MsgBox(E.Message);
        end;
      end;
    finally
      EnableControls;
      RefreshData;
    end;
  end;
end;

procedure TfrmReAfiliacion.btnAceptar9Click(Sender: TObject);
begin
  Verificar(fraNuevoEstado.IsEmpty, fraNuevoEstado.edCodigo, 'Debe seleccionar el nuevo estado.');
  fpCambioEstado.ModalResult := mrOk;
end;

procedure TfrmReAfiliacion.fpCambioEstadoBeforeShow(Sender: TObject);
begin
  fraNuevoEstado.Clear;
end;

procedure TfrmReAfiliacion.tbTarifaClick(Sender: TObject);
var
  aCursor: TCursor;
begin
  Verificar((Grid.SelectedRows.Count = 0), Grid, 'No hay ningún registro seleccionado.');
  
  aCursor       := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  Application.CreateForm(TfrmContratoTarifa, frmContratoTarifa);

  with frmContratoTarifa do
  try
    DoCargarDatos(sdqConsulta.FieldByName('sr_contrato').AsInteger);

    tbNuevo.Enabled := False;
    ShowModal;

    // Vuelve a cargar el contrato
    DoCargarDatos(ART_EMPTY_ID, sdqConsulta.FieldByName('sr_contrato').AsInteger);
  finally
    FreeAndNil(frmContratoTarifa);
    Screen.Cursor := aCursor;
  end;
end;

procedure TfrmReAfiliacion.FSFormShow(Sender: TObject);
begin
  inherited;
  edFechaSolicitudDesde.Date := DBDate - 30;
end;

procedure TfrmReAfiliacion.Label122Click(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT (pr_porcentaje - 5) * 1.21' +
     ' FROM pago.ppr_porcentaje' +
    ' WHERE pr_identidad = :identidad';
  edAcpo.Value := ValorSqlExtendedEx(sSql, [fraEntidad.Value]);
end;

procedure TfrmReAfiliacion.gbCiiuActualExit(Sender: TObject);
begin
  CalcularLimiteSSN;
end;

procedure TfrmReAfiliacion.btnTarifador2014Click(Sender: TObject);
const
  ARCHIVO_TARIFADOR = '\\NTNAS2\Archivos\Gerencia Técnica Actuarial\Suscripción\Cotizaciones\04 ARCHIVOS COTIZACIONES Y REVISIONES DE PRECIO\TARIFARIO PROVART 2014.xlsx';
var
  iResult: Integer;
begin
  iResult := ShellExecute(Handle, 'open', ARCHIVO_TARIFADOR, nil, nil, SW_SHOWNORMAL);
  if iResult <= 32 then
    MsgBox('No se puede abrir el archivo.');
end;

procedure TfrmReAfiliacion.PedidoEndoso1Click(Sender: TObject);
begin
  VerEndoso(Sender);
end;

procedure TfrmReAfiliacion.VerEndoso(Sender: TObject);
begin
  Verificar(Grid.DataSource.DataSet.IsEmpty, Grid, 'No hay ningún registro seleccionado.');

  with TfrmPedidoEndoso.Create(Self) do
  try
    IsTecnica         := Self.IsTecnica;  //Le digo si estan llamandolo desde tecnica o comer
    IdReafiliacion    := Self.sdqConsulta.FieldByName('sr_id').AsInteger; //Paso el id de reafiliacion
    TipoVisualizacion := tvNuevo;

    ShowModal;
  finally
    Free;
  end;
end;

function TfrmReAfiliacion.RecuperarJuiciosUart: String;
var
  sSql: String;
begin
  // Traigo los juicios..
  sSql :=
    'SELECT   EXTRACT(YEAR FROM ju_fechanotificacion) ano, COUNT(*) total' +
       ' FROM comunes.cju_juiciosuart' +
      ' WHERE EXTRACT(YEAR FROM ju_fechanotificacion) IS NOT NULL' +
        ' AND ju_cuitempresa = :cuitempresa' +
   ' GROUP BY EXTRACT(YEAR FROM ju_fechanotificacion)' +
   ' ORDER BY 1 DESC';
  with GetQueryEx(sSql, [fraEmpresa.CUIT]) do
  try
    if Eof then
      Result := 'UART <<. SIN JUICIOS .>>'
    else
    begin
      Result := 'UART <<. Juicios';
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
end;

function TfrmReAfiliacion.RecuperarSeclosUart: String;
var
  sSql: String;
begin
  sSql :=
    'SELECT se_anio, se_cantidad ' +
     ' FROM afi.ase_seclos' +
    ' WHERE se_fechabaja IS NULL' +
      ' AND se_cuit = :cuit' +
 ' ORDER BY se_anio DESC';
  with GetQueryEx(sSql, [fraEmpresa.CUIT]) do
  try
    if Eof then
      Result := 'UART [<. SIN SECLOS .>]'
    else
    begin
      Result := 'UART [<. SECLOS';
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
end;

function TfrmReAfiliacion.RecuperarSiniestros: String;
var
  sSql: String;
begin
  Result := '';

  sSql :=
    'SELECT   TO_CHAR(ex_fechaaccidente, ''YYYY'') ano, COUNT(*) total' +
       ' FROM aco_contrato, aem_empresa, sex_expedientes' +
      ' WHERE ex_cuit = em_cuit' +
        ' AND co_idempresa = em_id' +
        ' AND co_contrato = NVL(afiliacion.get_contratovigente(ex_cuit, ex_fechaaccidente), afiliacion.get_ultcontrato(ex_cuit))' +
        ' AND NVL(ex_causafin, ''0'') NOT IN(''02'', ''99'', ''95'')' +
        ' AND ex_recaida = 0' +
        ' AND (TO_NUMBER(TO_CHAR(SYSDATE, ''YYYY'')) - TO_NUMBER(TO_CHAR(ex_fechaaccidente, ''YYYY''))) < 6' +
        ' AND ex_cuit = :cuit' +
   ' GROUP BY TO_CHAR(ex_fechaaccidente, ''YYYY'')' +
   ' ORDER BY 1 DESC';
  with GetQueryEx(sSql, [fraEmpresa.CUIT]) do
  try
    if Eof then
      Result := Result + '[<. SIN SINIESTROS .>]'
    else
    begin
      Result := Result + '[<. Siniestros';
      while not Eof do
      begin
        Result := Result + Format(' %d:%d,', [FieldByName('ano').AsInteger, FieldByName('total').AsInteger]);
        Next;
      end;
      System.Delete(Result, Length(Result), 1);
      Result := Result + ' .>]';
    end;
  except
    Free;
  end;
end;

function TfrmReAfiliacion.RecuperarObservacionesCuit: String;
var
  sSql: String;
begin
  sSql :=
    'SELECT RTRIM(XMLAGG(XMLELEMENT(a, oc_observacion || CHR(13) || CHR(10))).EXTRACT(''//text()''), '','')' +
     ' FROM afi.aoc_observacioncuit a' +
    ' WHERE oc_cuit = :cuit' +
      ' AND art.actualdate BETWEEN oc_fechadesde AND oc_fechahasta' +
      ' AND oc_fechabaja IS NULL';
  Result := ValorSqlEx(sSql, [fraEmpresa.CUIT]);

  if Result <> '' then
    Result := '<<OBS.CUIT: ' + Result + '>>';
end;

function TfrmReAfiliacion.RecuperarJuiciosArt: String;
var
  sSql: String;
begin
  sSql :=
    'SELECT EXTRACT (YEAR FROM jt_fechanotificacionjuicio) ano, COUNT (DISTINCT jt_id) total' +
     ' FROM art.sex_expedientes, legales.lsj_siniestrosjuicioentramite, legales.lod_origendemanda, legales.ljt_juicioentramite' +
    ' WHERE EXTRACT (YEAR FROM jt_fechanotificacionjuicio) IS NOT NULL' +
      ' AND od_idjuicioentramite = jt_id' +
      ' AND sj_idorigendemanda = od_id' +
      ' AND sj_idsiniestro = ex_id' +
      ' AND jt_idestado <> 3' +
      ' AND jt_estadomediacion = ''J''' +
      ' AND ex_cuit = :cuit' +
      ' AND od_fechabaja IS NULL' +
      ' AND sj_fechabaja IS NULL' +
 ' GROUP BY EXTRACT (YEAR FROM jt_fechanotificacionjuicio)' +
 ' ORDER BY 1 DESC';
  with GetQueryEx(sSql, [fraEmpresa.CUIT]) do
  try
    if Eof then
      Result := 'ART <<. SIN JUICIOS .>>'
    else
    begin
      Result := 'ART <<. Juicios';
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
end;

function TfrmReAfiliacion.RecuperarSeclosArt: String;
var
  sSql: String;
begin
  sSql :=
    'SELECT EXTRACT (YEAR FROM me_fechainicio) ano, COUNT (DISTINCT me_id) total' +
     ' FROM sex_expedientes, legales.lme_mediacion' +
    ' WHERE EXTRACT (YEAR FROM me_fechainicio) IS NOT NULL' +
      ' AND ex_id = me_idexpediente' +
      ' AND ex_cuit = :cuit' +
      ' AND me_idestado <> 3' +
 ' GROUP BY EXTRACT (YEAR FROM me_fechainicio)' +
 ' ORDER BY 1 DESC';
  with GetQueryEx(sSql, [fraEmpresa.CUIT]) do
  try
    if Eof then
      Result := 'ART [<. SIN SECLOS .>]'
    else
    begin
      Result := 'ART [<. SECLOS';
      while not Eof do
      begin
        Result := Result + Format(' %d:%d,', [FieldByName('ano').AsInteger, FieldByName('total').AsInteger]);
        Next;
      end;
      System.Delete(Result, Length(Result), 1);
      Result := Result + ' .>]';
    end;
  except
    Free;
  end;
end;

{function TfrmReAfiliacion.DescomponerEmails(const aEmails: String): String;
var
  aCaracter: Char;
  aLista: TStringList;
begin
  aCaracter := #0;
  if Pos(';', aEmails) > 0 then
    aCaracter := ';'
  else if Pos(',', aEmails) > 0 then
    aCaracter := ','
  else if Pos('/', aEmails) > 0 then
    aCaracter := '/'
  else if Pos(':', aEmails) > 0 then
    aCaracter := ':';


  aLista := TStringList.Create;
  with aLista do
  try
    Delimiter := aCaracter;
    DelimitedText := aEmails;
    Result := Trim(aLista[0]);
  finally
    Free;
  end;
end;}



//FALTARIA METER LA INFORMACION COMPLEMENTARIA AL MOMENTO DE IMPRIMIR...PERO PARA ESO, ANTES HAY QUE VER COMO LE HAGO SCROLL A UN REPORTE..







end.
