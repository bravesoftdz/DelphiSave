unit unConsultaSolicitud;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, unArtFrame, unFraCodigoDescripcion, unFraUsuario, ToolEdit, DateComboBox, Mask, PatternEdit, IntEdit, CurrEdit, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unfraStaticActividad, unFraEntidades, unArtDBAwareFrame, unfraVendedores, unFraCanal, unfraSucursal, unFraCentroRegional, Menus,
  DBCtrls, DBTables, unfraCtbTablas, Buttons, unFraCodDesc, JvExControls, JvComponent, JvLabel, DateUtils, PeriodoPicker, ComboEditor, CheckCombo,
  DBCheckCombo, DBFuncs, unArt, unSeleccionDestinatarios, unCotizacion, AdvPicture, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Variants, RxCurrEdit, RxToolEdit, RxPlacemnt, StaticGrid;

type
  TRecValorCotizacion = record
    CostoAnual: Real;
    CostoCapitas: Real;
    CostoMensual: Real;
    Error: Integer;
    ErrorDescripcion: String;
    SumaAsegurada: Real;
    SumaFija: Real;
    SumaVariable: Real;
    ValorRC: Real;
end;

type
  TfrmConsultaSolicitud = class(TfrmCustomGridABM)
    edSC_NROSOLICITUD: TIntEdit;
    Label1: TLabel;
    edSC_RAZONSOCIAL: TEdit;
    Label7: TLabel;
    edSC_CONTACTO: TEdit;
    Label8: TLabel;
    edSC_TELEFONO: TEdit;
    fraSC_USUARIOSOLICITUD: TfraUsuarios;
    Label6: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    edSC_CUIT: TMaskEdit;
    tbSeparador: TToolButton;
    gbFechaSolicitud: TGroupBox;
    Label2: TLabel;
    cmbSC_FECHASOLICITUDDesde: TDateComboBox;
    Label4: TLabel;
    cmbSC_FECHASOLICITUDHasta: TDateComboBox;
    gbFechaCierre: TGroupBox;
    Label21: TLabel;
    cmbCO_FECHACERRADODesde: TDateComboBox;
    cmbCO_FECHACERRADOHasta: TDateComboBox;
    Label31: TLabel;
    gbTipo: TGroupBox;
    rbAmbos: TRadioButton;
    rbCotizaciones: TRadioButton;
    rbSolicitudes: TRadioButton;
    gbOrigen: TGroupBox;
    Label22: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    fraSC_IDVENDEDOR: TfraVendedores;
    Label32: TLabel;
    tbEnviarCarta: TToolButton;
    tbSeparadorCarta: TToolButton;
    tbCerrarSolicitud: TToolButton;
    fpCierre: TFormPanel;
    Bevel1: TBevel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    Label13: TLabel;
    tbClonar: TToolButton;
    tbSeparadorClon: TToolButton;
    fraSC_IDENTIDAD: TfraEntidades;
    edNumeroCotizacion: TIntEdit;
    Label52: TLabel;
    tbRefrescarCombos: TToolButton;
    ScrollBox: TScrollBox;
    Label40: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    lbHolding: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label41: TLabel;
    Bevel3: TBevel;
    labelActividadReal: TLabel;
    edfpSC_TELEFONO: TEdit;
    edfpSC_MAIL: TEdit;
    edfpSC_RAZONSOCIAL: TEdit;
    gbSolicitud: TGroupBox;
    Label5: TLabel;
    Label19: TLabel;
    Label11: TLabel;
    edfpSC_NROSOLICITUD: TIntEdit;
    cmbfpSC_FECHASOLICITUD: TDateComboBox;
    frafpSC_USUARIOSOLICITUD: TfraUsuarios;
    edfpSC_CUIT: TMaskEdit;
    frafpSC_VENDEDOR: TfraVendedores;
    gbCotizacion: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label43: TLabel;
    edTC_PORCVARIABLE: TCurrencyEdit;
    edTC_SUMAFIJA: TCurrencyEdit;
    edTC_COSTOFINAL: TCurrencyEdit;
    edfpObsATecnica: TMemo;
    frafpSC_ENTIDAD: TfraEntidades;
    gbDatosTarifa: TGroupBox;
    Label29: TLabel;
    Label28: TLabel;
    edSC_PORCVARIABLECOMPETENCIAPARC: TCurrencyEdit;
    edSC_COSTOFIJOCOMPETENCIAPARCIAL: TCurrencyEdit;
    edResultadoMensualTrabajador: TCurrencyEdit;
    edSC_PORCVARIABLE931PARCIAL: TCurrencyEdit;
    edSC_COSTOFIJO931PARCIAL: TCurrencyEdit;
    edSumaFija: TCurrencyEdit;
    rbForm931: TRadioButton;
    rbDatosEmpresa: TRadioButton;
    rbSinDatos: TRadioButton;
    gbStatusSrt: TGroupBox;
    fraSC_IDARTANTERIOR: TfraStaticCodigoDescripcion;
    edfpSC_ACTIVIDADREAL: TEdit;
    gbComision: TGroupBox;
    Label51: TLabel;
    edSC_PORCCOMISION: TCurrencyEdit;
    frafpSC_CANAL: TfraCanal;
    frafpSC_IDSUCURSAL: TfraSucursal;
    frafpIDCENTROREG: TfraCentroRegional;
    gbObservaciones2: TGroupBox;
    Label15: TLabel;
    Label38: TLabel;
    edfpSC_OBSERVACIONES: TMemo;
    edfpSC_OBSERVACIONESCIERRE: TMemo;
    mnuImprimir: TPopupMenu;
    mnuImprimirCarta: TMenuItem;
    mnuMail: TMenuItem;
    fraSC_IDSUCURSAL: TfraSucursal;
    Label53: TLabel;
    tbExcepcion: TToolButton;
    pFrame: TPanel;
    gbObservaciones: TGroupBox;
    rgEstados: TRadioGroup;
    edSC_OBSERVACIONESCIERRE: TMemo;
    fpEventos: TFormPanel;
    Bevel2: TBevel;
    btnCerrar: TButton;
    dbgACE_COTIZACIONEVENTOS: TArtDBGrid;
    pnlACE_COTIZACIONEVENTOS: TPanel;
    cmbCE_FECHA: TDBDateEdit;
    edCE_DESCRIPCION: TDBMemo;
    Label39: TLabel;
    Label54: TLabel;
    tbToolBarEventos: TToolBar;
    tb_ACE_Nuevo: TToolButton;
    tb_ACE_Modificar: TToolButton;
    tb_ACE_Eliminar: TToolButton;
    tb_ACE_Guardar: TToolButton;
    tb_ACE_Cancelar: TToolButton;
    ToolButton12: TToolButton;
    tb_ACE_Ordenar: TToolButton;
    ToolButton14: TToolButton;
    sdqACE_COTIZACIONEVENTO: TSDQuery;
    sduACE_COTIZACIONEVENTO: TSDUpdateSQL;
    dsACE_COTIZACIONEVENTO: TDataSource;
    lbSolicitud: TLabel;
    tbEventos: TToolButton;
    SortDialogEventos: TSortDialog;
    lblContacto: TLabel;
    edfpSC_CONTACTO: TEdit;
    fraSU_IDCENTROREG: TfraCentroRegional;
    Label55: TLabel;
    gbGestion: TGroupBox;
    lbNroEvento: TLabel;
    rgOrigenSolicitud: TRadioGroup;
    Label56: TLabel;
    cmbEventos: TComboBox;
    edSC_IDEVENTO: TIntEdit;
    tb_ACE_Imprimir: TToolButton;
    fraStatusSRT: TfraStaticCTB_TABLAS;
    gbStatusBcra: TGroupBox;
    fraStatusBCRA: TfraStaticCTB_TABLAS;
    Label57: TLabel;
    lbStatusBCRALink: TLabel;
    lbStatusSRTLink: TLabel;
    gbCiius: TGroupBox;
    Label14: TLabel;
    Label45: TLabel;
    edfpSC_CANTTRABAJADOR: TIntEdit;
    frafpSC_IDACTIVIDAD: TfraStaticActividad;
    frafpSC_IDACTIVIDAD2: TfraStaticActividad;
    frafpSC_IDACTIVIDAD3: TfraStaticActividad;
    edfpSC_CANTTRABAJADOR1: TIntEdit;
    edfpSC_CANTTRABAJADOR2: TIntEdit;
    edfpSC_CANTTRABAJADOR3: TIntEdit;
    edfpSC_MASASALARIAL1: TCurrencyEdit;
    Label48: TLabel;
    edfpSC_MASASALARIAL2: TCurrencyEdit;
    edfpSC_MASASALARIAL3: TCurrencyEdit;
    edfpSC_MASASALARIAL: TCurrencyEdit;
    sdspGetCotizacion: TSDStoredProc;
    fpCostos: TFormPanel;
    Label16: TLabel;
    Label18: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    ceSumaFija: TCurrencyEdit;
    ceSumaVariable: TCurrencyEdit;
    ceCostoCapitas: TCurrencyEdit;
    ceCostoMensual: TCurrencyEdit;
    ceCostoAnual: TCurrencyEdit;
    btnAceptarCostos: TButton;
    sdspGetValidarCotizacion: TSDStoredProc;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    gbMotivoCancelacion: TGroupBox;
    fraMotivoCancelacion: TfraStaticCTB_TABLAS;
    fraMotivoRecotizacion: TfraStaticCTB_TABLAS;
    GroupBox5: TGroupBox;
    fraMotivoCancelacion2: TfraStaticCTB_TABLAS;
    tbRecotizacion: TToolButton;
    fraMotivoExcepcion: TfraStaticCTB_TABLAS;
    Label23: TLabel;
    ceCostoActual: TCurrencyEdit;
    Label47: TLabel;
    edResultado: TEdit;
    Label49: TLabel;
    ceDiferencia: TCurrencyEdit;
    gbEdadPromedio: TGroupBox;
    rbPagoTotalMensual: TRadioButton;
    edSC_PAGOCOMPETENCIAPARCIAL: TCurrencyEdit;
    Label30: TLabel;
    edPorcVariable: TCurrencyEdit;
    Bevel5: TBevel;
    Label50: TLabel;
    Label58: TLabel;
    btnCalcular: TBitBtn;
    Label59: TLabel;
    edCPTMA: TCurrencyEdit;
    GroupBox10: TGroupBox;
    fraHoldingBuscar: TfraCodDesc;
    edfpSC_IDGRUPOECONOMICO: TfraCodDesc;
    GroupBox13: TGroupBox;
    chkCantTrab1: TCheckBox;
    chkCantTrab2: TCheckBox;
    chkCantTrab3: TCheckBox;
    chkCantTrab4: TCheckBox;
    chkCantTrab5: TCheckBox;
    GroupBox11: TGroupBox;
    checkVerPedidosWeb: TCheckBox;
    tbRevisarEstado: TToolButton;
    checkIncluyeIva: TCheckBox;
    gbSector: TGroupBox;
    fraSector: TfraCtbTablas;
    ToolbarBCRA: TToolBar;
    tbImportBCRA: TToolButton;
    btnHistorialVigencias: TBitBtn;
    chkCantTrab6: TCheckBox;
    edOtrosDesde: TIntEdit;
    edOtrosHasta: TIntEdit;
    GroupBox14: TGroupBox;
    chkUltimaSolicitud: TCheckBox;
    GroupBox15: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    edContrato: TIntEdit;
    edFechaAprobacionAutomaticaDesde: TDateComboBox;
    Label63: TLabel;
    edFechaAprobacionAutomaticaHasta: TDateComboBox;
    gbCantidadEstablecimientos: TGroupBox;
    edEstablecimientos: TIntEdit;
    gbProbabilidadCierreNegocio: TGroupBox;
    fraProbabilidadCierreNegocio: TfraCodDesc;
    Label64: TLabel;
    edPeriodo: TPeriodoPicker;
    Label65: TLabel;
    fraEstado: TDBCheckCombo;
    sdqEstado: TSDQuery;
    dsEstado: TDataSource;
    btnCalcularComision: TBitBtn;
    Label66: TLabel;
    fraCanalBusqueda: TDBCheckCombo;
    sdqCanal: TSDQuery;
    dsCanal: TDataSource;
    GroupBox18: TGroupBox;
    checkEntidadesEnTramite: TCheckBox;
    fpEstablecimientos: TFormPanel;
    btnAceptar3: TButton;
    gbEstablecimientos: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    fraCiiu: TfraStaticActividad;
    fraProvincia: TfraCodDesc;
    fraLocalidad: TfraCodDesc;
    fraActividad: TfraCodDesc;
    edTrabajadores: TIntEdit;
    dbgridEstablecimientos: TArtDBGrid;
    tbEstablecimientos2: TToolBar;
    tbAgregar: TToolButton;
    tbModificar2: TToolButton;
    tbEliminar3: TToolButton;
    sdqEstablecimientos: TSDQuery;
    dsEstablecimientos: TDataSource;
    ToolButton7: TToolButton;
    checkCopiarCiiu: TCheckBox;
    btnVerHistorialVigencias: TBitBtn;
    edNumeroSolicitudAfiliacion: TEdit;
    checkEnTramite: TCheckBox;
    tbBuscarEmails: TToolButton;
    pnCancelar: TPanel;
    sbCancelar: TSpeedButton;
    gbDescuento: TGroupBox;
    lbTope: TLabel;
    edDescuento: TCurrencyEdit;
    btnCalcularDescuento: TBitBtn;
    lbTituloDescuentoAplicado: TLabel;
    lbDescuentoAplicado: TLabel;
    edDescuentoTope: TCurrencyEdit;
    Label67: TLabel;
    edDescuentoAplicado: TCurrencyEdit;
    Label73: TLabel;
    fraEN_IDEJECUTIVO: TfraCodDesc;
    tbPosibleDescuento: TToolButton;
    fraDelegacionBusqueda: TDBCheckCombo;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    tbCambiarDatos: TToolButton;
    popupCambiarDatos: TPopupMenu;
    mnuCanalEntidadVendedor: TMenuItem;
    mnuUsuarioCarga: TMenuItem;
    fpCambiarCanalEntidadVendedor: TFormPanel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    fraCanal: TfraCanal;
    fraEntidad: TfraEntidades;
    fraVendedor: TfraVendedores;
    btnAceptar4: TButton;
    btnCancelar3: TButton;
    Bevel7: TBevel;
    fpCambiarUsuarioCarga: TFormPanel;
    btnAceptar5: TButton;
    btnCancelar4: TButton;
    Bevel8: TBevel;
    Label77: TLabel;
    fraUsuario: TfraUsuarios;
    fpDatosFaltantes: TFormPanel;
    btnAceptar6: TButton;
    btnCancelar5: TButton;
    fraMotivoExcepcionRecotizacion: TfraStaticCTB_TABLAS;
    Label78: TLabel;
    Label79: TLabel;
    memoObservaciones: TMemo;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    edEdadPromedio: TCurrencyEdit;
    fraSector2: TfraCtbTablas;
    fraProbabilidadCierre: TfraCodDesc;
    edCantidadEstablecimientos: TIntEdit;
    dbgridEstablecimientos2: TArtDBGrid;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    tbAgregar2: TToolButton;
    tbModificar3: TToolButton;
    tbEliminar2: TToolButton;
    Panel1: TPanel;
    edSC_EDADPROMEDIO: TIntEdit;
    gbAumento: TGroupBox;
    lbTopeAumento: TLabel;
    edAumento: TCurrencyEdit;
    btnCalcularAumento: TBitBtn;
    edAumentoTope: TCurrencyEdit;
    lbTituloAumentoAplicado: TLabel;
    Bevel9: TBevel;
    lbAumentoAplicado: TLabel;
    Label84: TLabel;
    edAumentoAplicado: TCurrencyEdit;
    Label85: TLabel;
    edPoliza: TCurrencyEdit;
    gbRC: TGroupBox;
    gbRecalcRC: TGroupBox;
    btnRecalcRC: TButton;
    Label87: TLabel;
    edCalcPolizaRC: TCurrencyEdit;
    edSumaAsegurada: TCurrencyEdit;
    Label88: TLabel;
    Bevel10: TBevel;
    Label89: TLabel;
    edSumaPolizaRC: TCurrencyEdit;
    btnActualizar: TButton;
    gbSeleccionRC: TGroupBox;
    rb2: TRadioButton;
    rb5: TRadioButton;
    rb10: TRadioButton;
    rbRCSi: TRadioButton;
    rbRCNo: TRadioButton;
    Label86: TLabel;
    AdvPicture1: TAdvPicture;
    Label90: TLabel;
    gbZonaGeografica: TGroupBox;
    fraZonaGeografica: TfraCodDesc;
    AdvPicture2: TAdvPicture;
    AdvPicture3: TAdvPicture;
    ceMasaSalarial: TCurrencyEdit;
    ceCuotaInicial: TCurrencyEdit;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    sbtnCancelar: TButton;
    gbValoresRC: TGroupBox;
    edValoresSumaAsegurada: TCurrencyEdit;
    edValoresAlicuota: TCurrencyEdit;
    edValoresMasaSalarial: TCurrencyEdit;
    edValoresCuotaInicial: TCurrencyEdit;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    lbDestinoEmail: TLabel;
    fraDestinoEmail: TfraCodDesc;
    tbRedireccionarEmailAutorizacion: TToolButton;
    GroupBox19: TGroupBox;
    checkResultadoOk: TCheckBox;
    checkResultadoOut: TCheckBox;
    GroupBox20: TGroupBox;
    fraCIIUFiltro: TfraStaticActividad;
    edOrden: TIntEdit;
    fpCostosF931: TFormPanel;
    Label100: TLabel;
    btnAceptar8: TButton;
    Label101: TLabel;
    lbAlicuotaF931: TLabel;
    lbAlicuotaDescuento: TLabel;
    lbAlicuotaAumento: TLabel;
    edPorcVarTarifario: TCurrencyEdit;
    edPorcVarF931: TCurrencyEdit;
    edPorcVarDescuento: TCurrencyEdit;
    edPorcVarAumento: TCurrencyEdit;
    AdvPicture4: TAdvPicture;
    Label106: TLabel;
    Label105: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    edCostoFinalTarifario: TCurrencyEdit;
    edCostoFinalF931: TCurrencyEdit;
    edCostoFinalDescuento: TCurrencyEdit;
    edCostoFinalAumento: TCurrencyEdit;
    edCostoMensualTarifario: TCurrencyEdit;
    edCostoMensualF931: TCurrencyEdit;
    edCostoMensualDescuento: TCurrencyEdit;
    edCostoMensualAumento: TCurrencyEdit;
    edCostoAnualTarifario: TCurrencyEdit;
    edCostoAnualF931: TCurrencyEdit;
    edCostoAnualDescuento: TCurrencyEdit;
    edCostoAnualAumento: TCurrencyEdit;
    Bevel6: TBevel;
    edAlicuotaFinalF931: TCurrencyEdit;
    edSumaFijaF931: TCurrencyEdit;
    Label109: TLabel;
    lbTopesAlicuotaFinal: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    AdvPicture5: TAdvPicture;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    edSumaAseguradaRCF931: TCurrencyEdit;
    edAlicuotaVariableRCF931: TCurrencyEdit;
    edMasaSalarialRCF931: TCurrencyEdit;
    edCuotaInicialRCF931: TCurrencyEdit;
    Bevel11: TBevel;
    edDescuentoTopeF931: TCurrencyEdit;
    edAumentoTopeF931: TCurrencyEdit;
    btnImprimir: TButton;
    fpCostosClonacion: TFormPanel;
    Bevel12: TBevel;
    Label102: TLabel;
    Label103: TLabel;
    AdvPicture6: TAdvPicture;
    Label104: TLabel;
    Label110: TLabel;
    Label117: TLabel;
    edSumaAseguradaRCClonacion: TCurrencyEdit;
    edAlicuotaVariableRCClonacion: TCurrencyEdit;
    edMasaSalarialRCClonacion: TCurrencyEdit;
    edCuotaInicialRCClonacion: TCurrencyEdit;
    Bevel13: TBevel;
    btnAceptar9: TButton;
    Label118: TLabel;
    lbAlicuotaMinima: TLabel;
    Label120: TLabel;
    edPorVarAlicuotaActualCotizada: TCurrencyEdit;
    edPorVarAlicuotaMinima: TCurrencyEdit;
    edPorVarAlicuotaMaxima: TCurrencyEdit;
    edCostoFinalCapitasAlicuotaActualCotizada: TCurrencyEdit;
    edCostoFinalCapitasAlicuotaMinima: TCurrencyEdit;
    edCostoFinalCapitasAlicuotaMaxima: TCurrencyEdit;
    edCostoMensualAlicuotaActualCotizada: TCurrencyEdit;
    edCostoMensualAlicuotaMinima: TCurrencyEdit;
    edCostoMensualAlicuotaMaxima: TCurrencyEdit;
    edCostoAnualAlicuotaActualCotizada: TCurrencyEdit;
    edCostoAnualAlicuotaMinima: TCurrencyEdit;
    edCostoAnualAlicuotaMaxima: TCurrencyEdit;
    Label121: TLabel;
    lbTopesAlicuotaVariable: TLabel;
    edAlicuotaVariable: TCurrencyEdit;
    AdvPicture7: TAdvPicture;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    edSumaFijaAlicuotaActualCotizada: TCurrencyEdit;
    edSumaFijaAlicuotaMinima: TCurrencyEdit;
    edSumaFijaAlicuotaMaxima: TCurrencyEdit;
    Label128: TLabel;
    Label129: TLabel;
    lbTopesAlicuotaFija: TLabel;
    edAlicuotaFija: TCurrencyEdit;
    btnPasarCotizacionATecnica: TButton;
    gbPrestacionesEspeciales: TGroupBox;
    checkPrestacionesEspeciales: TCheckBox;
    Label99: TLabel;
    fraOrganizador: TfraCodDesc;
    gbSoloPCP: TGroupBox;
    chkSoloPCP: TCheckBox;
    gbPCP: TGroupBox;
    Label119: TLabel;
    sgGridPCP: TStaticGrid;
    GroupBox1: TGroupBox;
    chkSoloPCPBusqueda: TCheckBox;
    gbMicroPyme: TGroupBox;
    checkMicroPyme: TCheckBox;
    Label27: TLabel;
    fraFormaJuridica: TfraStaticCTB_TABLAS;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure frafpSC_ENTIDADExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fraSC_IDENTIDADExit(Sender: TObject);
    procedure fraSC_IDVENDEDORExit(Sender: TObject);
    procedure tbEnviarCartaClick(Sender: TObject);
    procedure tbCerrarSolicitudClick(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure EstadoTarifa(Sender: TObject);
    procedure CalcularDatos931(Sender: TObject);
    procedure tbClonarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure CalcularTrabajadores(Sender: TObject);
    procedure frafpSC_ENTIDADcmbDescripcionDropDown(Sender: TObject);
    procedure fraSC_IDSUCURSALcmbDescripcionDropDown(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbRefrescarCombosClick(Sender: TObject);
    procedure mnuMailClick(Sender: TObject);
    procedure mnuImprimirCartaClick(Sender: TObject);
    procedure fraSC_IDSUCURSALExit(Sender: TObject);
    procedure tbExcepcionClick(Sender: TObject);
    procedure edfpSC_CUITExit(Sender: TObject);
    procedure frafpSC_IDACTIVIDADedCodigoExit(Sender: TObject);
    procedure frafpSC_IDACTIVIDADcmbDescripcionExit(Sender: TObject);
    procedure fpCierreResize(Sender: TObject);
    procedure tbEventosClick(Sender: TObject);
    procedure tb_ACE_NuevoClick(Sender: TObject);
    procedure tb_ACE_ModificarClick(Sender: TObject);
    procedure tb_ACE_GuardarClick(Sender: TObject);
    procedure tb_ACE_CancelarClick(Sender: TObject);
    procedure tb_ACE_OrdenarClick(Sender: TObject);
    procedure tb_ACE_EliminarClick(Sender: TObject);
    procedure dbgACE_COTIZACIONEVENTOSGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgACE_COTIZACIONEVENTOSDblClick(Sender: TObject);
    procedure sdqACE_COTIZACIONEVENTOAfterOpen(DataSet: TDataSet);
    procedure ChequeoSGC(Sender: TObject);
    procedure CambioOrigen(Sender: TObject);
    procedure tb_ACE_ImprimirClick(Sender: TObject);
    procedure frafpSC_IDSUCURSALcmbDescripcionDropDown(Sender: TObject);
    procedure fraSC_IDVENDEDORcmbDescripcionDropDown(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure lbStatusBCRALinkClick(Sender: TObject);
    procedure lbStatusSRTLinkClick(Sender: TObject);
    procedure btnAceptarCostosClick(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure fpCostosShow(Sender: TObject);
    procedure tbSalir2Click(Sender: TObject);
    procedure fpCierreShow(Sender: TObject);
    procedure tbRecotizacionClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure btnCalcularClick(Sender: TObject);
    procedure ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure fpAbmKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbRevisarEstadoClick(Sender: TObject);
    procedure ImportarDatosBCRA(Sender: TObject);
    procedure btnHistorialVigenciasClick(Sender: TObject);
    procedure btnCalcularComisionClick(Sender: TObject);
    procedure fraStatusSRTExit(Sender: TObject);
    procedure fraCanalBusquedaExit(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure fraProvinciaPropiedadesChange(Sender: TObject);
    procedure btnAceptar3Click(Sender: TObject);
    procedure tbAgregarClick(Sender: TObject);
    procedure tbModificar2Click(Sender: TObject);
    procedure tbEliminar3Click(Sender: TObject);
    procedure sdqEstablecimientosAfterOpen(DataSet: TDataSet);
    procedure dbgridEstablecimientosDblClick(Sender: TObject);
    procedure fraLocalidadPropiedadesChange(Sender: TObject);
    procedure tbBuscarEmailsClick(Sender: TObject);
    procedure btnCalcularDescuentoClick(Sender: TObject);
    procedure tbPosibleDescuentoClick(Sender: TObject);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbCambiarDatosClick(Sender: TObject);
    procedure btnCancelar3Click(Sender: TObject);
    procedure mnuCanalEntidadVendedorClick(Sender: TObject);
    procedure btnAceptar4Click(Sender: TObject);
    procedure mnuUsuarioCargaClick(Sender: TObject);
    procedure btnCancelar4Click(Sender: TObject);
    procedure btnAceptar5Click(Sender: TObject);
    procedure fpCambiarCanalEntidadVendedorBeforeShow(Sender: TObject);
    procedure fpCambiarUsuarioCargaBeforeShow(Sender: TObject);
    procedure btnCancelar5Click(Sender: TObject);
    procedure tbAgregar2Click(Sender: TObject);
    procedure tbModificar3Click(Sender: TObject);
    procedure tbEliminar2Click(Sender: TObject);
    procedure fpDatosFaltantesBeforeShow(Sender: TObject);
    procedure btnAceptar6Click(Sender: TObject);
    procedure btnCalcularAumentoClick(Sender: TObject);
    procedure edDescuentoChange(Sender: TObject);
    procedure edAumentoChange(Sender: TObject);
    procedure btnRecalcRCClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure edCalcPolizaRCClick(Sender: TObject);
    procedure rbRCSiClick(Sender: TObject);
    procedure rbRCNoClick(Sender: TObject);
    procedure tbRedireccionarEmailAutorizacionClick(Sender: TObject);
    procedure edPeriodoChange(Sender: TObject);
    procedure edNumeroCotizacionKeyPress(Sender: TObject; var Key: Char);
    procedure edSC_CUITExit(Sender: TObject);
    procedure btnAceptar8Click(Sender: TObject);
    procedure edAlicuotaFinalF931Change(Sender: TObject);
    procedure fpCostosF931Close(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure fpCostosClonacionClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptar9Click(Sender: TObject);
    procedure edAlicuotaVariableChange(Sender: TObject);
    procedure btnPasarCotizacionATecnicaClick(Sender: TObject);
    procedure chkSoloPCPClick(Sender: TObject);
    procedure sgGridPCPGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure sgGridPCPKeyPress(Sender: TObject; var Key: Char);
    procedure sgGridPCPKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    idHTTP1: TIdHTTP;
    FCalcularDatos931: Boolean;
    FComisionCalculada: Boolean;
    FCostosClonacionOk: Boolean;
    FEliminarSolicitud: Boolean;
    FEsClonacion: Boolean;
    FHtmlStatusBcra: String;
    FIdCotizacionAnterior: Integer;
    FIdSolicitudAnterior: Integer;
    FMostrarColumnasPiso: Boolean;
    FPermisoExcepcion: Boolean;
    FPermisoRecotizacion: Boolean;
    FStatusSrtOk: Boolean;
    FValidacionCotizacion: TRecValidacion;

    function ArmPathFromNumber(const aNumero: String): String;
    function EnviarEmailHtml(const aIdCanal, aIdEntidad: Integer; var aFileName: String): Boolean;
    function FiltroProvincia: String;
//    function GetArt(const aArtWeb: String): Integer;
    function GetComision(const aVendedor: Integer; const aSector: String; const aCantTrabajadores, aIdHolding: Integer): Real;
    function GetIdLocalidadEstablecimiento(const aIdSolicitud: Integer): Integer;
    function GetIdZonaGeograficaEstablecimiento(const aIdSolicitud: Integer): Integer;
    function GetImportePCP: Extended;
    function GetTopeMaximoF931: Extended;
    function GetTopeMaximoFijoClonacion: Extended;
    function GetTopeMaximoVariableClonacion: Extended;
    function GetTopeMinimoF931: Extended;
    function GetTopeMinimoFijoClonacion: Extended;
    function GetTopeMinimoVariableClonacion: Extended;
    function GetValidacionCotizacion(const aIdSolicitud: Integer): TRecValidacion;
    function GetValorCotizacion(const aDescuento, aAumento: Real): TRecValorCotizacion;
    function GetValorResponsabilidadCivil(const aCuit, aZonaGeografica: String; const aIdSolicitud, aCapitas, aSumaAsegurada: Integer; const aMasaSalarial, aSumaVariable, aSumaFija,
                                          aDescuento: Extended): Real;
    function IsJefe: Boolean;
    function PrintLetter(const aIdSolicitudCotizacion: Integer; const aFileNameCoti, aFileNameSolAfi: String): Boolean;

    procedure ActivarABM(bEstado: Boolean);
    procedure ActualizarResultadosAutoCotizacion;
    procedure ActualizarZonaGeografica(const aIdSolicitud: Integer; const aCommitear: Boolean = False);
    procedure CalcularCPTMA;
    procedure CalcularTotales;
    procedure Clonar(const aPedirConfirmacion: Boolean = True);
    procedure FillGridPCP;
    procedure GuardarEstablecimientos(const aIdSolicitud: Integer);
    procedure GuardarHtmlBcra(const aIdSolicitud: Integer; const aHtml: String);
    procedure GuardarPCP(const aIdSolicitud: Integer);
    procedure HabilitarGroupBoxResponsabilidadCivil(const aEstado: Boolean);
    procedure NotificarAlCliente(const bEnvioMail: Boolean); overload;
    procedure RefrescarEstablecimientos(const aIdSolicitud: Integer);
    procedure SetearValoresSoloPCP;
    procedure UpdateSeguimientoEvento(const aExisteEvento: Boolean; const aEstado: String; const aIdSolicitudCotizacion, aIdEvento: Integer);
    procedure UpdateValoresSolicitud(const aEstadoActual: String);
    procedure ValidarReservaCuit(const aCuit: String; const aValidarPorVendedor: Boolean; aFoco: TControl = nil);
    procedure VerificarPCP;
  protected
    FEstadoSolicitud: String;
    FIdSolicitud: Integer;
    FLockSolicitud: Boolean;
    FNroSolicitud: String;

    function DoABM: Boolean; override;
    function EnviarPorMail(const aIDSolicitudCotizacion, aRazonSocial, aCuit: String; const aOrigen: String = 'C'; const aCommitTrans: Boolean = True): Boolean;
    function GetSumaAseguradaRC: Integer;
    function IsEventoSGC: Boolean;
    function Validar: Boolean; override;

    procedure CambiaActividad(Sender: TObject);
    procedure CambiaCanal(Sender: TObject);
    procedure CambiaCanal2(Sender: TObject);
    procedure CambiaCentroReg(Sender: TObject);
    procedure CambiaCiiuEstablecimiento(Sender: TObject);
    procedure CambiaEntidad(Sender: TObject);
    procedure CambiaEntidad2(Sender: TObject);
    procedure CambiaEntidadBusqueda(Sender: TObject);
    procedure CambiaSector(Sender: TObject);
    procedure CambiaSucursal(Sender: TObject);
    procedure CambiaVendedor(Sender: TObject);
    procedure ClearControls; override;
    procedure DoCancelarSolicitud;
    procedure DoCerrarSolicitud(AEstado: String);
    procedure DoGuardarExcepcion;
    procedure DoPedirExcepcion;
    procedure FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure LoadControls; override;
    procedure LockControls(ALocked: Boolean = True); override;
    procedure ObtenerTarifaComercial;
    procedure RecalcularComision;
    procedure SetLockSolicitud(const Value: Boolean);

    property LockSolicitud: Boolean read fLockSolicitud write SetLockSolicitud;
  public
    function NotificarAlCliente(const aIdSolicitud: Integer; const aOrigen: String; const aCommitTrans: Boolean = True): Boolean; overload;
  end;

const
  MAXCOLS = 3;

var
  CamposSuma: Array[0..MAXCOLS] of String = ('SC_NROSOLICITUD', 'TIENESOLICITUDAFILIACION', 'SC_MASASALARIAL', 'SC_CANTTRABAJADOR');
  frmConsultaSolicitud: TfrmConsultaSolicitud;
  Operadores: Array[0..MAXCOLS] of TOperador = (oSinOperador, oDistinto, oSinOperador, oSinOperador);
  TiposOperacion: Array[0..MAXCOLS] of TOperacion = (oCount, oCount, oSum, oSum);
  TotalConsulta: Array of Extended;
  Values: Array[0..MAXCOLS] of Variant;

implementation

uses
  unPrincipal, unDmPrincipal, SqlFuncs, VCLExtra, unFiltros, CustomDlgs, CUIT, AnsiSql, unQRCartaSolicitud, strFuncs, Numeros, ArtMail, ArchFuncs, General, FileCtrl,
  unCITRIX, unCustomDataModule, unSesion, unExterno, unQREventos, unVisualizador, ShellAPI, unMoldeEnvioMail, Math, unImportFromBCRA, unHistorialVigenciasContrato,
  unQRSolicitudAfiliacion, unExportPDF, unEnvioMail, unElementosEnviados, unCustomConsulta, unVisorPDF, unImportFromSRT, unImportFromSRTReclamos,
  unConsultaCotizacion;

{$R *.DFM}

function TfrmConsultaSolicitud.DoABM: Boolean;
  procedure ClearValores(var aValorCotizacion: TRecValorCotizacion);
  begin
    aValorCotizacion.CostoAnual       := 0;
    aValorCotizacion.CostoCapitas     := 0;
    aValorCotizacion.CostoMensual     := 0;
    aValorCotizacion.Error            := 0;
    aValorCotizacion.ErrorDescripcion := '';
    aValorCotizacion.SumaFija         := 0;
    aValorCotizacion.SumaVariable     := 0;
    aValorCotizacion.ValorRC          := 0;
    aValorCotizacion.SumaAsegurada    := 0;
  end;

var
  aBlob: TStringList;
//  aFrmConsultaCotizacion: TfrmConsultaCotizacion;
  aQuery1: TSDQuery;
  aQuery2: TSDQuery;
  aValorCotizacion: TRecValorCotizacion;
  aValorCotizacionTmp: TRecValorCotizacion;
  bAsignarNuevoNumeroCotizacion: Boolean;
  bCantidadTrabajadoresOk: Boolean;
  bUsarCostosF931: Boolean;
  iIdCotizacion: Integer;
  iIdCotizador: Integer;
  iIdSolicitudAnterior: Integer;
  iIndex: Integer;
  Mensaje: String;
  sEstado: String;
  sSql: String;
  sUpdateSql: String;
begin
  ClearValores(aValorCotizacion);
  try
    BeginTrans;

    bCantidadTrabajadoresOk := (edfpSC_CANTTRABAJADOR.Value <= frafpSC_IDACTIVIDAD.CantidadTrabajadoresAutocotizable);

    // Llamo al procedure de PL-SQL que cotiza..
    if ((FValidacionCotizacion.NumeroError = 0) or (FValidacionCotizacion.Advertencia)) and (bCantidadTrabajadoresOk) then
    begin
      if not chkSoloPCP.Checked then
        aValorCotizacion := GetValorCotizacion(0, 0);

      if aValorCotizacion.Error in [3, 9, 10] then
      begin
        Mensaje := Format('%d - %s', [aValorCotizacion.Error, aValorCotizacion.ErrorDescripcion]);
        MsgBox(Mensaje);
      end
      else if aValorCotizacion.Error <> 0 then
      begin
        Mensaje := Format('Se produjo el siguiente error:' + CRLF + CRLF + '%d - %s', [aValorCotizacion.Error, aValorCotizacion.ErrorDescripcion]);
        MsgBox(Mensaje);

        Result := False;
        RollBack;
        Exit;
      end;
    end;

    Sql.Clear;
    Sql.TableName := 'asc_solicitudcotizacion';
    if ModoABM = maAlta then
    begin
      FIdSolicitud  := ValorSqlInteger('SELECT seq_asc_id.NEXTVAL FROM DUAL', 0);
      FNroSolicitud := ValorSql('SELECT seq_asc_nrosolicitud.NEXTVAL FROM DUAL', '0');
    end;

    if (not FValidacionCotizacion.VerificaTecnica) and   // o la solicitud está en alguno de los estados en que permite modificar la solicitud..
      ((FEstadoSolicitud = '') or
       (FEstadoSolicitud = EC_PEND_COTIZ) or
       (FEstadoSolicitud = EC_SOLIC_A_REVISAR) or
       (FEstadoSolicitud = EC_CLONADA) or
       (FEstadoSolicitud = EC_DATOS_FALTANTES)) then
    begin
      Sql.Fields.Add('sc_finalsumafija',      aValorCotizacion.SumaFija, dtNumber);
      Sql.Fields.Add('sc_finalporcmasa',      aValorCotizacion.SumaVariable, dtNumber);
      Sql.Fields.Add('sc_finalportrabajador', aValorCotizacion.CostoCapitas, dtNumber);
      Sql.Fields.Add('sc_fechavigencia',      SQL_DATETIME, False);
      Sql.Fields.Add('sc_estado',             EC_NOTIF_COMERCIAL);
    end
    else
      if IsEventoSGC and (ModoABM = maAlta) then
        Sql.Fields.Add('sc_estado', EC_SOLIC_A_REVISAR)
      else
        Sql.Fields.Add('sc_estado', EC_PEND_COTIZ);

    if IsEventoSGC then
      Sql.Fields.Add('sc_idevento', StrToIntDef(sIDEvento, 0), dtNumber);

    Sql.PrimaryKey.Add('sc_id',                  FIdSolicitud, False);
    Sql.Fields.Add('sc_nrosolicitud',            FNroSolicitud, False);
    Sql.Fields.Add('sc_cuit',                    edfpSC_CUIT.Text);
    Sql.Fields.Add('sc_razonsocial',             edfpSC_RAZONSOCIAL.Text);
    Sql.Fields.Add('sc_mail',                    edfpSC_MAIL.Text);
    Sql.Fields.Add('sc_contacto',                edfpSC_CONTACTO.Text);
    Sql.Fields.Add('sc_telefono',                edfpSC_TELEFONO.Text);
    Sql.Fields.Add('sc_idactividad',             frafpSC_IDACTIVIDAD.Value);
    Sql.Fields.Add('sc_idactividad2',            frafpSC_IDACTIVIDAD2.Value);
    Sql.Fields.Add('sc_idactividad3',            frafpSC_IDACTIVIDAD3.Value);
    Sql.Fields.Add('sc_actividadreal',           edfpSC_ACTIVIDADREAL.Text);
    Sql.Fields.Add('sc_idsucursal',              frafpSC_IDSUCURSAL.Value);
    Sql.Fields.Add('sc_masasalarial',            edfpSC_MASASALARIAL.Value, dtNumber);
    Sql.Fields.Add('sc_totalmasa1',              edfpSC_MASASALARIAL1.Value, dtNumber);
    Sql.Fields.Add('sc_totalmasa2',              edfpSC_MASASALARIAL2.Value, dtNumber);
    Sql.Fields.Add('sc_totalmasa3',              edfpSC_MASASALARIAL3.Value, dtNumber);
    Sql.Fields.Add('sc_canttrabajador',          edfpSC_CANTTRABAJADOR.Value, dtNumber);
    Sql.Fields.Add('sc_canttrabajador1',         edfpSC_CANTTRABAJADOR1.Value, dtNumber);
    Sql.Fields.Add('sc_canttrabajador2',         edfpSC_CANTTRABAJADOR2.Value, dtNumber);
    Sql.Fields.Add('sc_canttrabajador3',         edfpSC_CANTTRABAJADOR3.Value, dtNumber);
    Sql.Fields.Add('sc_periodo',                 edPeriodo.Periodo.Valor);

    if checkPrestacionesEspeciales.Checked then
      edfpSC_OBSERVACIONES.Lines.Insert(0, 'Cotizar con Otras Erogaciones, pasar a Comite II.');

    Sql.Fields.Add('sc_observaciones',           edfpSC_OBSERVACIONES.Lines.Text);
    Sql.Fields.Add('sc_idgrupoeconomico',        edfpSC_IDGRUPOECONOMICO.Value);
    Sql.Fields.Add('sc_cotizacion_pcp',          String(IIF(chkSoloPCP.Checked, 'S', 'N')));
    Sql.Fields.Add('sc_canal',                   frafpSC_CANAL.Value);
    Sql.Fields.Add('sc_identidad',               frafpSC_ENTIDAD.Value, dtNumber);
    Sql.Fields.Add('sc_idvendedor',              frafpSC_VENDEDOR.Value, dtNumber);
    Sql.Fields.Add('sc_usuariosolicitud',        Sesion.UserID);
    Sql.Fields.Add('sc_fechasolicitud',          SQL_DATETIME, False);
    Sql.Fields.Add('sc_porccomision',            edSC_PORCCOMISION.Value, dtNumber);
    Sql.Fields.Add('sc_edadpromedio',            edSC_EDADPROMEDIO.Value, dtNumber);
    Sql.Fields.Add('sc_sector',                  fraSector.Value);
    Sql.Fields.Add('sc_establecimientos',        edEstablecimientos.Value);
    Sql.Fields.Add('sc_prestaciones_especiales', String(IIF(checkPrestacionesEspeciales.Checked, 'S', 'N')));
//    Sql.Fields.Add('sc_micropyme',               Integer(IIF(checkMicroPyme.Checked, 1, 0)));
//    Sql.Fields.Add('sc_formajuridica',           fraFormaJuridica.Value, True);
    Sql.Fields.Add('sc_idprobabilidadcierre',    fraProbabilidadCierreNegocio.Value);
    Sql.Fields.Add('sc_idartanterior',           fraSC_IDARTANTERIOR.Value, True);
    Sql.Fields.Add('sc_statussrt',               fraStatusSRT.Value);
    Sql.Fields.Add('sc_statusbcra',              fraStatusBCRA.Value);
    Sql.Fields.Add('sc_error',                   Integer(IIF(FValidacionCotizacion.Advertencia, 0, FValidacionCotizacion.NumeroError)), True);
    Sql.Fields.Add('sc_fecharevision',           ExNull);
    Sql.Fields.Add('sc_usuariorevision',         ExNull);
    Sql.Fields.Add('sc_porcvariabletarifario',   aValorCotizacion.SumaVariable, dtNumber);

    if chkSoloPCP.Checked then
    begin
      Sql.Fields.Add('sc_sumafijatarifario', GetImportePCP, dtNumber);

      iIndex := Sql.Fields.FieldByName['sc_finalportrabajador'].Index;
      Sql.Fields.Delete(iIndex);
      Sql.Fields.Add('sc_finalportrabajador', GetImportePCP, dtNumber);
    end
    else
      Sql.Fields.Add('sc_sumafijatarifario', aValorCotizacion.SumaFija, dtNumber);

    // Se comenta lo de abajo por ticket 48700..
{    // Blanqueo los dos campos de abajo por las dudas según ticket 46592..
    Sql.Fields.Add('sc_porcaumento',           exNull);
    Sql.Fields.Add('sc_porcdescuento',         exNull);}


    if (not fraZonaGeografica.IsEmpty) and (fraZonaGeografica.Codigo <> '') then
      Sql.Fields.Add('sc_idzonageografica', fraZonaGeografica.Codigo);

    if ((FValidacionCotizacion.NumeroError <> 0) and (not FValidacionCotizacion.Advertencia)) or (FValidacionCotizacion.NumeroError = 15) then
    begin
      iIndex := Sql.Fields.FieldByName['sc_estado'].Index;
      Sql.Fields.Delete(iIndex);
      Sql.Fields.Add('sc_estado', EC_CON_ERRORES);
    end;

    Sql.Fields.Add('sc_pagocompetenciaparcial',      edSC_PAGOCOMPETENCIAPARCIAL.Value, dtNumber);
    Sql.Fields.Add('sc_costofijo931parcial',         edSC_COSTOFIJO931PARCIAL.Value, dtNumber);
    Sql.Fields.Add('sc_porcvariable931parcial',      edSC_PORCVARIABLE931PARCIAL.Value, dtNumber);
    Sql.Fields.Add('sc_costofijocompetenciaparcial', edSC_COSTOFIJOCOMPETENCIAPARCIAL.Value, dtNumber);
    Sql.Fields.Add('sc_porcvariablecompetenciaparc', edSC_PORCVARIABLECOMPETENCIAPARC.Value, dtNumber);

    if rbSinDatos.Checked then
    begin
      Sql.Fields.Add('sc_form931',                'NULL', False);

      Sql.Fields.Add('sc_sumafijacompetencia',     0, dtNumber);
      Sql.Fields.Add('sc_porcvariablecompetencia', 0, dtNumber);
      Sql.Fields.Add('sc_costofinalpagomensual',   0, dtNumber);

      Sql.Fields.Add('sc_sumafijaform931',         0, dtNumber);
      Sql.Fields.Add('sc_porcvariableform931',     0, dtNumber);
      Sql.Fields.Add('sc_costofinalform931',       0, dtNumber);

      Sql.Fields.Add('sc_sumafija',                0, dtNumber);
      Sql.Fields.Add('sc_porcvariable',            0, dtNumber);
      Sql.Fields.Add('sc_costofinal',              0, dtNumber);
    end
    else
    begin
      if rbPagoTotalMensual.Checked then
      begin
        Sql.Fields.Add('sc_form931', 'A');

        Sql.Fields.Add('sc_sumafijacompetencia',     edSumaFija.Value, dtNumber);
        Sql.Fields.Add('sc_porcvariablecompetencia', edPorcVariable.Value, dtNumber);
        Sql.Fields.Add('sc_costofinalpagomensual',   edResultadoMensualTrabajador.Value, dtNumber);
      end;
      if rbDatosEmpresa.Checked then
      begin
        Sql.Fields.Add('sc_form931', 'N');

        Sql.Fields.Add('sc_sumafija',     edSumaFija.Value, dtNumber);
        Sql.Fields.Add('sc_porcvariable', edPorcVariable.Value, dtNumber);
        Sql.Fields.Add('sc_costofinal',   edResultadoMensualTrabajador.Value, dtNumber);
      end;
      if rbForm931.Checked then
      begin
        Sql.Fields.Add('sc_form931', 'S');
        CalcularDatos931(nil);

        Sql.Fields.Add('sc_sumafijaform931',     edSumaFija.Value, dtNumber);
        Sql.Fields.Add('sc_porcvariableform931', edPorcVariable.Value, dtNumber);
        Sql.Fields.Add('sc_costofinalform931',   edResultadoMensualTrabajador.Value, dtNumber);
      end;
    end;

    if GetComision(frafpSC_VENDEDOR.Value, fraSector.Value, edfpSC_CANTTRABAJADOR.Value, edfpSC_IDGRUPOECONOMICO.Value) = -1 then
    begin
      iIndex := Sql.Fields.FieldByName['sc_estado'].Index;
      Sql.Fields.Delete(iIndex);
      Sql.Fields.Add('sc_estado', EC_DATOS_FALTANTES);

      iIndex := Sql.Fields.FieldByName['sc_error'].Index;
      Sql.Fields.Delete(iIndex);
      Sql.Fields.Add('sc_error', '14');

      iIndex := Sql.Fields.FieldByName['sc_porccomision'].Index;
      Sql.Fields.Delete(iIndex);
      Sql.Fields.Add('sc_porccomision', exNull);
    end;

    if FStatusSrtOk then
      Sql.Fields.Add('sc_fecha_ctrl_srt', SQL_DATETIME, False);

    if ModoABM = maAlta then
    begin
      Sql.Fields.Add('sc_usualta',   Sesion.UserID);
      Sql.Fields.Add('sc_fechaalta', SQL_ACTUALDATE, False);
    end
    else
    begin
      Sql.Fields.Add('sc_usumodif',   Sesion.UserID);
      Sql.Fields.Add('sc_fechamodif', SQL_ACTUALDATE, False);
    end;
  except
    on E: Exception do
      MsgBox(E.Message + #13 + #10 + 'Por favor informe de este error al área de sistemas. (4)');
  end;

  try
    EjecutarSqlST(Sql.Sql);

    sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
    EjecutarSqlSTEx(sSql, [FIdSolicitud]);

    GuardarPCP(FIdSolicitud);

    if ModoABM = maAlta then
      GuardarEstablecimientos(FIdSolicitud);

    GuardarHtmlBcra(FIdSolicitud, FHtmlStatusBcra);

     // Ahora lo tomo del fraZonaGeografica;
     // ActualizarZonaGeografica(FIdSolicitud);

    if aValorCotizacion.Error in [3, 9, 10] then
    begin
      FValidacionCotizacion.VerificaTecnica := True;
      FValidacionCotizacion.DescripcionError := FValidacionCotizacion.DescripcionError + 'Número de error ' + IntToStr(aValorCotizacion.Error) + '. // ';

      UpdateValoresSolicitud(Sql.Fields.FieldByName['sc_estado'].Value);

      // Las 6 líneas de abajo fueron agregadas el 14.5.9 por el ticket 6732..
      if Sql.Fields.FieldByName['sc_estado'].Value <> EC_CON_ERRORES then
      begin
        iIndex := Sql.Fields.FieldByName['sc_estado'].Index;
        Sql.Fields.Delete(iIndex);
        Sql.Fields.Add('sc_estado', EC_PEND_COTIZ);
      end;
    end;

    if ((FValidacionCotizacion.NumeroError = 0) or (FValidacionCotizacion.Advertencia)) and (not FValidacionCotizacion.VerificaTecnica) then
    begin
      ceSumaFija.Value     := aValorCotizacion.SumaFija;
      ceSumaVariable.Value := aValorCotizacion.SumaVariable;
      ceCostoCapitas.Value := aValorCotizacion.CostoCapitas;
      ceCostoMensual.Value := aValorCotizacion.CostoMensual;
      ceCostoAnual.Value   := aValorCotizacion.CostoAnual;
      edSumaAsegurada.Value:= aValorCotizacion.SumaAsegurada;

      edTC_SUMAFIJA.Visible       := True;
      edTC_COSTOFINAL.Visible     := True;
      edTC_PORCVARIABLE.Visible   := True;
      edDescuentoAplicado.Visible := True;
      edAumentoAplicado.Visible   := True;
      edTC_SUMAFIJA.Value         := ceSumaFija.Value;
      edTC_COSTOFINAL.Value       := ceCostoCapitas.Value;
      edTC_PORCVARIABLE.Value     := ceSumaVariable.Value;

      sSql :=
        'SELECT 1' +
         ' FROM afi.aca_campania931' +
        ' WHERE ca_identidad = :identidad' +
          ' AND SYSDATE < ca_fechahasta' +
          ' AND ca_fechabaja IS NULL' +
          ' AND NOT EXISTS (SELECT 1' +
                            ' FROM comercial.cse_sucursalexcluidof931' +
                           ' WHERE se_identidad = ca_identidad' +
                             ' AND se_idsucursal = :idsucursal' +
                             ' AND se_fechabaja IS NULL)';
      bUsarCostosF931 := (not rbSinDatos.Checked) and (ExisteSqlEx(sSql, [frafpSC_ENTIDAD.Value, frafpSC_IDSUCURSAL.Value]));

      if bUsarCostosF931 then
      begin
        sSql :=
          'SELECT ca_descuento' +
           ' FROM afi.aca_campania931' +
          ' WHERE ca_identidad = :identidad' +
            ' AND SYSDATE < ca_fechahasta' +
            ' AND ca_fechabaja IS NULL';
        lbAlicuotaF931.Caption := Format('Alícuota F931 %s Descuento', [ValorSqlEx(sSql, [frafpSC_ENTIDAD.Value]) + '%']);

        edPorcVarTarifario.Value := aValorCotizacion.SumaVariable;
        edPorcVarF931.Value := ((edPorcVariable.Value * (edfpSC_MASASALARIAL.Value / edfpSC_CANTTRABAJADOR.Value)) + (edSumaFija.Value - 0.6)) / (edfpSC_MASASALARIAL.Value / edfpSC_CANTTRABAJADOR.Value);
        edPorcVarF931.Value := edPorcVarF931.Value * (1 - (ValorSqlExtendedEx(sSql, [frafpSC_ENTIDAD.Value]) / 100));
        if (edPorcVarTarifario.Value * 0.3) > edPorcVarF931.Value then
          edPorcVarF931.Value := edPorcVarTarifario.Value * 0.3;

        // No dejo que el porcentaje variable del F931 pase los límites de la SSN..
        sSql :=
          'SELECT ls_minimo minimo, ls_maximo maximo' +
           ' FROM als_limitessn' +
          ' WHERE ls_idactividad IN(SELECT ac_id' +
                                    ' FROM cac_actividad' +
                                   ' WHERE ac_codigo = SUBSTR(art.hys.get_codactividadrevdos(:idactividad), 1, 1))' +
            ' AND ls_fechadesde <= SYSDATE' +
            ' AND ls_fechahasta >= SYSDATE' +
            ' AND ls_fechabaja IS NULL';
        with GetQueryEx(sSql, [frafpSC_IDACTIVIDAD.Value]) do
        try
          Verificar(Eof, nil, 'No se encontraron los límites de la SSN.');

          if edPorcVarF931.Value < FieldByName('minimo').AsFloat then
            edPorcVarF931.Value := FieldByName('minimo').AsFloat;

          if edPorcVarF931.Value > FieldByName('maximo').AsFloat then
            edPorcVarF931.Value := FieldByName('maximo').AsFloat;
        finally
          Free;
        end;

        edPorcVarDescuento.Value := aValorCotizacion.SumaVariable * (1 - (25 / 100));

        if not chkSoloPCP.Checked then
          aValorCotizacionTmp := GetValorCotizacion(0, 121);
        edPorcVarAumento.Value := aValorCotizacionTmp.SumaVariable;

        edCostoFinalTarifario.Value   := aValorCotizacion.CostoCapitas;
        edCostoMensualTarifario.Value := aValorCotizacion.CostoMensual;
        edCostoAnualTarifario.Value   := aValorCotizacion.CostoAnual;
        edCostoFinalF931.Value        := (edPorcVarF931.Value /100) * edfpSC_MASASALARIAL.Value / edfpSC_CANTTRABAJADOR.Value + 0.6;
        edCostoMensualF931.Value      := ((edPorcVarF931.Value / 100) * edfpSC_MASASALARIAL.Value) + 0.6 * edfpSC_CANTTRABAJADOR.Value;
        edCostoAnualF931.Value        := ((edPorcVarF931.Value / 100) * edfpSC_MASASALARIAL.Value * 13) + 0.6 * edfpSC_CANTTRABAJADOR.Value * 12;
        edCostoFinalDescuento.Value   := (edPorcVarDescuento.Value /100) * edfpSC_MASASALARIAL.Value / edfpSC_CANTTRABAJADOR.Value  + 0.6;
        edCostoMensualDescuento.Value := ((edPorcVarDescuento.Value / 100) * edfpSC_MASASALARIAL.Value) + 0.6 * edfpSC_CANTTRABAJADOR.Value;
        edCostoAnualDescuento.Value   := ((edPorcVarDescuento.Value / 100) * edfpSC_MASASALARIAL.Value * 13) + 0.6 * edfpSC_CANTTRABAJADOR.Value * 12;
        edCostoFinalAumento.Value     := (edPorcVarAumento.Value / 100) * edfpSC_MASASALARIAL.Value / edfpSC_CANTTRABAJADOR.Value + 0.6;
        edCostoMensualAumento.Value   := ((edPorcVarAumento.Value / 100) * edfpSC_MASASALARIAL.Value) + 0.6 * edfpSC_CANTTRABAJADOR.Value;
        edCostoAnualAumento.Value     := ((edPorcVarAumento.Value / 100) * edfpSC_MASASALARIAL.Value * 13) + 0.6 * edfpSC_CANTTRABAJADOR.Value * 12;

        sSql :=
          'SELECT cotizacion.get_descuento(:cuit, :canttrabajador, :idactividad, :usuario)' +
           ' FROM DUAL';
        edDescuentoTopeF931.Value := ValorSqlIntegerEx(sSql, [edfpSC_CUIT.Text, edfpSC_CANTTRABAJADOR.Value,
                                                              frafpSC_IDACTIVIDAD.Value, Sesion.UserID]);
        lbAlicuotaDescuento.Caption := Format('Alícuota %s Descuento', [FormatFloat('##0%', edDescuentoTopeF931.Value)]);

        lbAlicuotaDescuento.Visible     := (edDescuentoTopeF931.Value > 0);
        edPorcVarDescuento.Visible      := lbAlicuotaDescuento.Visible;
        edCostoFinalDescuento.Visible   := lbAlicuotaDescuento.Visible;
        edCostoMensualDescuento.Visible := lbAlicuotaDescuento.Visible;
        edCostoAnualDescuento.Visible   := lbAlicuotaDescuento.Visible;

        sSql :=
          'SELECT art.cotizacion.get_aumento(:idactividad, :masacoti, :emplecoti, :sumafija, :porcvariable, :user)' +
           ' FROM DUAL';
        edAumentoTopeF931.Value := ValorSqlIntegerEx(sSql, [frafpSC_IDACTIVIDAD.Value, edfpSC_MASASALARIAL.Value,
                                                            edfpSC_CANTTRABAJADOR.Value, aValorCotizacion.SumaFija,
                                                            aValorCotizacion.SumaVariable, Sesion.UserID]);
//        lbAlicuotaAumento.Caption := Format('Alícuota %s Aumento', [FormatFloat('##0%', edAumentoTopeF931.Value)]);

        lbAlicuotaAumento.Visible     := (edAumentoTopeF931.Value > 0);
        edPorcVarAumento.Visible      := lbAlicuotaAumento.Visible;
        edCostoFinalAumento.Visible   := lbAlicuotaAumento.Visible;
        edCostoMensualAumento.Visible := lbAlicuotaAumento.Visible;
        edCostoAnualAumento.Visible   := lbAlicuotaAumento.Visible;

        lbTopesAlicuotaFinal.Caption := Format('(Entre %s y %s)', [FormatFloat('##0.000%', GetTopeMinimoF931), FormatFloat('##0.000%', GetTopeMaximoF931)]);
        edSumaFijaF931.Value := aValorCotizacion.SumaFija;

        edSumaAseguradaRCF931.Value    := 0;
        edAlicuotaVariableRCF931.Value := 0;
        edMasaSalarialRCF931.Value     := edfpSC_MASASALARIAL.Value;
        edCuotaInicialRCF931.Value     := 0;

        fpCostosF931.ShowModal;
      end
      else
        if not chkSoloPCP.Checked then
          fpCostos.ShowModal;


      if bUsarCostosF931 then
      begin
        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_campania931 = ''S'',' +
                ' sc_finalsumafija = :finalsumafija,' +
                ' sc_finalporcmasa = :finalporcmasa,' +
                ' sc_finalportrabajador = :finalportrabajador,' +
                ' sc_porcaumento = NULL,' +
                ' sc_porcaumentotope = NULL,' +
                ' sc_porcdescuento = NULL,' +
                ' sc_porcdescuentotope = NULL' +
          ' WHERE sc_id = :id';
        EjecutarSqlSTEx(sSql, [edSumaFijaF931.Value, edAlicuotaFinalF931.Value, ((edAlicuotaFinalF931.Value /100) * edfpSC_MASASALARIAL.Value / edfpSC_CANTTRABAJADOR.Value + 0.6), FIdSolicitud]);

        sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
        EjecutarSqlSTEx(sSql, [FIdSolicitud]);
      end
      else
      begin
        // Guardo los nuevos costos luego del descuento aplicado si hubiera algún tope cargado..
        if (edDescuentoTope.Value > 0) and (lbDescuentoAplicado.Caption <> '-') then
        begin
          sSql :=
            'UPDATE asc_solicitudcotizacion' +
              ' SET sc_finalsumafija = :finalsumafija,' +
                  ' sc_finalporcmasa = :finalporcmasa,' +
                  ' sc_finalportrabajador = :finalportrabajador,' +
                  ' sc_porcdescuento = :porcdescuento,' +
                  ' sc_porcdescuentotope = :porcdescuentotope' +
            ' WHERE sc_id = :id';
          EjecutarSqlSTEx(sSql, [ceSumaFija.Value, ceSumaVariable.Value, ceCostoCapitas.Value, edDescuento.Value,
                                 edDescuentoTope.Value, FIdSolicitud]);

          sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
          EjecutarSqlSTEx(sSql, [FIdSolicitud]);
        end;

        if (edAumentoTope.Value > 0) and (lbAumentoAplicado.Caption <> '-') then
        begin
          sSql :=
            'UPDATE asc_solicitudcotizacion' +
              ' SET sc_finalsumafija = :finalsumafija,' +
                  ' sc_finalporcmasa = :finalporcmasa,' +
                  ' sc_finalportrabajador = :finalportrabajador,' +
                  ' sc_porcaumento = :porcaumento,' +
                  ' sc_porcaumentotope = :porcaumentotope' +
            ' WHERE sc_id = :id';
          EjecutarSqlSTEx(sSql, [ceSumaFija.Value, ceSumaVariable.Value, ceCostoCapitas.Value,
                                 edAumento.Value, edAumentoTope.Value, FIdSolicitud]);

          sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
          EjecutarSqlSTEx(sSql, [FIdSolicitud]);
        end;
      end;


      //Guardo los valores RC
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_sumaasegurada_rc = :suma,' +
              ' sc_valor_rc = :valor,' +
              ' sc_poliza_rc = :sino' +
        ' WHERE sc_id = :id';
      EjecutarSqlSTEx(sSql, [GetSumaAseguradaRC, edSumaPolizaRC.Value, IIF(rbRCsi.Checked, 'S', 'N'), FIdSolicitud]);

      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [FIdSolicitud]);
    end;


    if FValidacionCotizacion.VerificaTecnica then
    begin
      // Guardo el motivo de no autocotización..
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_motivonoautocotizacion = :motivo' +
        ' WHERE sc_id = :id';
      EjecutarSqlSTEx(sSql, [Copy(FValidacionCotizacion.MotivoNoAutoCotizacion, 1, 256), FIdSolicitud]);

      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [FIdSolicitud]);

      //Guardo los valores RC cuando es a tecnica
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_sumaasegurada_rc = :suma,' +
              ' sc_valor_rc = :valor,' +
              ' sc_poliza_rc = :sino' +
        ' WHERE sc_id = :id';
      EjecutarSqlSTEx(sSql, [GetSumaAseguradaRC, aValorCotizacion.ValorRC, IIF(rbRCsi.Checked, 'S', 'N'), FIdSolicitud]);

      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [FIdSolicitud]);
    end;

    Result := True;
    CommitTrans;

    if (not FValidacionCotizacion.VerificaTecnica) and   // o la solicitud está en alguno de los estados en que permite modificar la solicitud..
      ((FValidacionCotizacion.NumeroError = 0) or (FValidacionCotizacion.Advertencia)) and
      ((FEstadoSolicitud = '') or (FEstadoSolicitud = EC_PEND_COTIZ) or (FEstadoSolicitud = EC_SOLIC_A_REVISAR) or (FEstadoSolicitud = EC_CLONADA) or (FEstadoSolicitud = EC_DATOS_FALTANTES)) then
    begin
      if MsgAsk(IIF((not sdqConsulta.Active) or (sdqConsulta.FieldByName('SC_IDUSUARIOWEB').IsNull),
                '¿ Desea enviar la cotización por e-mail ?', '¿ Desea enviarle la cotización por e-mail al productor ?')) then
      begin
        if not dmPrincipal.sdbPrincipal.Connected then
        begin
          MsgBox('La conexión con la base de datos se ha cerrado. La operación se aborta.');
          Exit;
        end;

        FEliminarSolicitud := False;
        EnviarPorMail(IntToStr(FIdSolicitud), edfpSC_RAZONSOCIAL.Text, edfpSC_CUIT.Text);

        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_estado = :estado,' +
                ' sc_fecharespuesta = SYSDATE' +
          ' WHERE sc_id = :id';
        EjecutarSqlEx(sSql, [EC_NOTIF_CLIENTE, FIdSolicitud]);

        sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
        EjecutarSqlEx(sSql, [FIdSolicitud]);


        if IsEventoSGC then
        begin
          sSql :=
            'UPDATE cse_seguimientoevento' +
              ' SET se_fecharealizado = SYSDATE,' +
                  ' se_idsolicitudcotizacion = :idsolicitudcotizacion,' +
                  ' se_finalsumafija = :finalsumafija,' +
                  ' se_finalporcmasa = :finalporcmasa,' +
                  ' se_finalportrabajador = :FINAL,' +
                  ' se_usurealizado = :usurealizado,' +
                  ' se_fechaaltarealizado = SYSDATE' +
            ' WHERE se_id = :id';
          EjecutarSqlEx(sSql, [FIdSolicitud, edTC_SUMAFIJA.Value, edTC_PORCVARIABLE.Value, edTC_COSTOFINAL.Value, Sesion.UserID, sIDEvento]);
        end;
      end;
    end;

    if ModoABM = maAlta then
    begin
      sSql :=
        'SELECT sc_idevento, sc_estado' +
         ' FROM asc_solicitudcotizacion' +
        ' WHERE sc_id = :id';
      with GetQueryEx(sSql, [FIdSolicitud]) do
      try
        UpdateSeguimientoEvento(not FieldByName('sc_idevento').IsNull, FieldByName('sc_estado').AsString, FIdSolicitud, StrToIntDef(sIDEvento, 0))
      finally
        Free;
      end;
    end
    else
      UpdateSeguimientoEvento(not sdqConsulta.FieldByName('sc_idevento').IsNull, String(Sql.Fields.FieldByName['sc_estado'].Value), FIdSolicitud, StrToIntDef(sIDEvento, 0));
  except
    on E: Exception do
    begin
      RollBack(True);
      raise Exception.Create(E.Message + #13#10#13#10 + 'Por favor avise de este error a la Gerencia de Sistemas.');
    end;
  end;

  sSql :=
    'SELECT co_id' +
     ' FROM aco_cotizacion, asc_solicitudcotizacion' +
    ' WHERE sc_idcotizacion = co_id' +
      ' AND sc_id = :id';
  iIdCotizacion := ValorSqlIntegerEx(sSql, [FIdSolicitud]);

  if ((FValidacionCotizacion.NumeroError <> 0) and (not FValidacionCotizacion.Advertencia)) or (FValidacionCotizacion.NumeroError = 15) then
    sEstado := EC_CON_ERRORES
  else
    sEstado := Sql.Fields.FieldByName['sc_estado'].Value;

  sSql :=
    'UPDATE aco_cotizacion' +
      ' SET co_estado = :estado,' +
          ' co_cuit = :cuit,' +
          ' co_razonsocial = :razonsocial,' +
          ' co_contacto = :contacto,' +
          ' co_idactividad = :id_actividad,' +
          ' co_telefono = :telefono' +
    ' WHERE co_id = :id';
  EjecutarSqlEx(sSql, [sEstado, edfpSC_CUIT.Text, edfpSC_RAZONSOCIAL.Text, edfpSC_CONTACTO.Text, frafpSC_IDACTIVIDAD.Value, edfpSC_TELEFONO.Text, iIdCotizacion]);


  if FEsClonacion and FValidacionCotizacion.VerificaTecnica then
  try
    // Clono los valores correspondientes a la cotización siempre que haya habido una..
    BeginTrans;

    if FIdCotizacionAnterior <> 0 then
    begin
      iIdCotizacion  := ValorSql('SELECT seq_aco_id.NEXTVAL FROM DUAL');


      sSql :=
        'INSERT INTO aco_cotizacion' +
                   ' (co_acpo, co_acpopiso, co_cantempldesde, co_cantemplhasta, co_cantempresa, co_cantempresas, co_cantempresastro, co_canttrabajador,' +
                    ' co_carterapromedio, co_carterapromediopond, co_chek_iltempleador, co_clausulasadicionales, co_comision, co_comisionpiso, co_concie10, co_contacto,' +
                    ' co_costofinalanterior, co_costofinalpiso, co_costomedico, co_costosiniestral, co_cuit, co_empresanueva,' +
                    ' co_establecimientos, co_estado, co_form931, co_frecuencia, co_id, co_idactividad,' +
                    ' co_idcotizacionanterior, co_idfidelitas, co_idgrupoeconomico, co_masasalarial, co_nivel, co_nrocotizacion, co_observaciones, co_orden,' +
                    ' co_porcvariableanterior, co_porcvariablepiso, co_primaporcsalario, co_primaprommercado, co_puestoautorizacion, co_razonsocial, co_salariopromedio,' +
                    ' co_sincie10, co_statusbcra, co_statussrt, co_sumafijaanterior, co_sumafijapiso, co_tasaincidencia, co_telefono, co_usuarioautorizacion,' +
                    ' co_usuarioconfecciono, co_usuariosolicitado, co_usucerrado)' +
           ' (SELECT co_acpo, co_acpopiso, co_cantempldesde, co_cantemplhasta, co_cantempresa, co_cantempresas, co_cantempresastro, co_canttrabajador,' +
                   ' co_carterapromedio, co_carterapromediopond, co_chek_iltempleador, co_clausulasadicionales, co_comision, co_comisionpiso, co_concie10, co_contacto,' +
                   ' co_costofinalanterior, co_costofinalpiso, co_costomedico, co_costosiniestral, co_cuit, co_empresanueva,' +
                   ' DECODE(NVL(co_establecimientos, 0), 0, :establecimientos, co_establecimientos), :estado, co_form931, co_frecuencia, :idcotizacion, co_idactividad,' +
                   ' co_id, co_idfidelitas, :idgrupoeconomico, co_masasalarial, co_nivel, co_nrocotizacion, :observaciones, co_orden + 1,' +
                   ' co_porcvariableanterior, co_porcvariablepiso, co_primaporcsalario, co_primaprommercado, co_puestoautorizacion, co_razonsocial, co_salariopromedio,' +
                   ' co_sincie10, co_statusbcra, co_statussrt, co_sumafijaanterior, co_sumafijapiso, co_tasaincidencia, co_telefono, co_usuarioautorizacion,' +
                   ' co_usuarioconfecciono, :usuariosolicitado, co_usucerrado' +
              ' FROM aco_cotizacion' +
             ' WHERE co_id = :idcotizacionanterior)';
      EjecutarSqlSTEx(sSql, [edEstablecimientos.Value,
                             sEstado,
                             iIdCotizacion,
                             edfpSC_IDGRUPOECONOMICO.Value,
                             edSC_OBSERVACIONESCIERRE.Lines.Text,
                             Sesion.UserID,
                             FIdCotizacionAnterior]);


      // GRABO EL TEXTO DEL FIDELITAS..
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
        aBlob.Text := ValorSqlEx('SELECT co_textofidelitas FROM aco_cotizacion WHERE co_id = :id', [FIdCotizacionAnterior]);
        SaveBlob(sSql, sUpdateSql, 'co_textofidelitas', aBlob);
      finally
        aBlob.Free;
      end;


      sSql :=
        'INSERT INTO acz_cotizador' +
                   ' (cz_id, cz_idcotizacion, cz_fechacotizacion, cz_edadpromedio, cz_zonageografica, cz_examenesperiodicos, cz_sector,' +
                    ' cz_ponderadores, cz_reclamoilt, cz_tasas, cz_explotacionvariables, cz_explotacionfijos, cz_mgutilidad,' +
                    ' cz_frecuenciaesperada, cz_siniestrosporano, cz_especiesfrecvalorcartera, cz_especiesfrecvalorcuit,' +
                    ' cz_especiesfrecvalorsuscriptor, cz_especiesfrecfactorriesgo, cz_especiessinespvalorcartera,' +
                    ' cz_especiessinespvalorcuit, cz_especiessinespvalorsuscript, cz_especiesespvalorcartera, cz_especiesespfactorriesgo,' +
                    ' cz_especiesespcostoprom, cz_especiesesptotalempresa, cz_especiesespcapitafija, cz_iltfrecvalorcartera,' +
                    ' cz_iltfrecvalorcuit, cz_iltfrecvalorsuscriptor, cz_iltfrecfactorriesgo, cz_iltsinespvalorcartera,' +
                    ' cz_iltsinespvalorcuit, cz_iltsinespvalorsuscriptor, cz_iltespvalorcartera, cz_iltespfactorriesgo,' +
                    ' cz_iltespcostopromedio, cz_iltesptotalempresa, cz_iltespcapitafija, cz_iltprestvalorcartera, cz_iltprestvalorcuit,' +
                    ' cz_iltprestcostopromedio, cz_iltpresttotalempresa, cz_iltprestcapitavariable, cz_incap050frecvalorcartera,' +
                    ' cz_incap050frecvalorcuit, cz_incap050frecvalorsuscriptor, cz_incap050frecfactorriesgo,' +
                    ' cz_incap050sinespvalorcartera, cz_incap050sinespvalorcuit, cz_incap050sinespvalorsuscript,' +
                    ' cz_incap050espvalorcartera, cz_incap050espfactorriesgo, cz_incap050espcostopromedio, cz_incap050esptotalempresa,' +
                    ' cz_incap050espcapitafija, cz_incap050iltvalorcartera, cz_incap050iltvalorcuit, cz_incap050iltcostopromedio,' +
                    ' cz_incap050ilttotalempresa, cz_incap050iltcapitavariable, cz_incap050incapvalorcartera,' +
                    ' cz_incap050incapvalorsuscript, cz_incap050incapcostopromedio, cz_incap050incaptotalempresa,' +
                    ' cz_incap050incapcapitavariable, cz_incap5066frecvalorcartera, cz_incap5066frecvalorcuit,' +
                    ' cz_incap5066frecvalorsuscript, cz_incap5066frecfactorriesgo, cz_incap5066sinespvalorcartera,' +
                    ' cz_incap5066sinespvalorcuit, cz_incap5066sinespvalorsuscrip, cz_incap5066espvalorcartera,' +
                    ' cz_incap5066espfactorriesgo, cz_incap5066espcostopromedio, cz_incap5066esptotalempresa, cz_incap5066espcapitafija,' +
                    ' cz_incap5066iltvalorcartera, cz_incap5066iltvalorcuit, cz_incap5066iltcostopromedio, cz_incap5066ilttotalempresa,' +
                    ' cz_incap5066iltcapitavariable, cz_incap5066adicvalorcartera, cz_incap5066adicvalorcuit,' +
                    ' cz_incap5066adiccostopromedio, cz_incap5066adictotalempresa, cz_incap5066adiccapitafija,' +
                    ' cz_incap5066incapvalorcartera, cz_incap5066incapvalorsuscript, cz_incap5066incapfactorriesgo,' +
                    ' cz_incap5066incapcostopromedio, cz_incap5066incaptotalempresa, cz_incap5066incapcapitavar,' +
                    ' cz_incap66100frecvalorcartera, cz_incap66100frecvalorcuit, cz_incap66100frecvalorsuscript,' +
                    ' cz_incap66100frecfactorriesgo, cz_incap66100sinespvalorcart, cz_incap66100sinespvalorcuit,' +
                    ' cz_incap66100sinespvalorsuscr, cz_incap66100espvalorcartera, cz_incap66100espfactorriesgo,' +
                    ' cz_incap66100espcostopromedio, cz_incap66100esptotalempresa, cz_incap66100espcapitafija,' +
                    ' cz_incap66100iltvalorcartera, cz_incap66100iltvalorcuit, cz_incap66100iltcostopromedio,' +
                    ' cz_incap66100ilttotalempresa, cz_incap66100iltcapitavariable, cz_incap66100adicvalorcartera,' +
                    ' cz_incap66100adiccostopromedio, cz_incap66100adictotalempresa, cz_incap66100adiccapitafija,' +
                    ' cz_incap66100incapvalorcartera, cz_incap66100incapvalorsuscrip, cz_incap66100incapfactorriesgo,' +
                    ' cz_incap66100incapcostoprom, cz_incap66100incaptotalempresa, cz_incap66100incapcapitavar,' +
                    ' cz_muertefrecvalorcartera, cz_muertefrecvalorcuit, cz_muertefrecvalorsuscriptor, cz_muertefrecfactorriesgo,' +
                    ' cz_muertesinespvalorcartera, cz_muertesinespvalorcuit, cz_muertesinespvalorsuscriptor, cz_muerteespvalorcartera,' +
                    ' cz_muerteespfactorriesgo, cz_muerteespcostopromedio, cz_muerteesptotalempresa, cz_muerteespcapitafija,' +
                    ' cz_muerteiltvalorcartera, cz_muerteiltvalorcuit, cz_muerteiltcostopromedio, cz_muerteilttotalempresa,' +
                    ' cz_muerteiltcapitavar, cz_muerteadicvalorcartera, cz_muerteadiccostopromedio, cz_muerteadictotalempresa,' +
                    ' cz_muerteadiccapitafija, cz_muerteincapvalorcartera, cz_muerteincapvalorcuit, cz_muerteincapfactorriesgo,' +
                    ' cz_muerteincapcostopromedio, cz_muerteincaptotalempresa, cz_muerteincapcapitavariable, cz_juiciosfrecvalorcartera,' +
                    ' cz_juiciosfrecvalorsuscriptor, cz_juiciossinespvalorcartera, cz_juiciossinespvalorrefsusc,' +
                    ' cz_juiciosdempromvalorcartera, cz_juiciosdempromtotalempresa, cz_juiciosdempromcapitavar,' +
                    ' cz_juiciosrecvalorcartera, cz_juiciosrecfactorriesgo, cz_juiciosrectotalempresa, cz_juiciosreccapitafija,' +
                    ' cz_juiciosreccapitavariable, cz_subtotaltotalempresa, cz_subtotalcapitafija, cz_subtotalcapitavariable,' +
                    ' cz_gastosprevtotalempresa, cz_gastosprevcapitafija, cz_comisionestotalempresa, cz_comisionescapitavariable,' +
                    ' cz_gastosexpvartotalempresa, cz_gastosexpvarcapitavariable, cz_gastosexpfijtotalempresa, cz_gastosexpfijcapitafija,' +
                    ' cz_impuestostotalempresa, cz_impuestoscapitavariable, cz_subgasesttotalempresa, cz_subgasestcapitafija,' +
                    ' cz_subgasestcapitavariable, cz_toterototalempresa, cz_toterocapitafija, cz_utilidadanualtotalempresa,' +
                    ' cz_utilidadanualcapitafija, cz_tarsuganualtotalempresa, cz_tarsuganualcapitafija, cz_enpesostotalempresa,' +
                    ' cz_alicuotacapitafija, cz_alicuotacapitavariable, cz_tasavariabletotalempresa, cz_idartanterior,' +
                    ' cz_competenciacostofijo, cz_competenciacostovariable, cz_competenciapesosporcapita, cz_competenciatasavariable,' +
                    ' cz_infomercadosalarioprom, cz_finalsumafija, cz_finalporcentajevariable, cz_finalpesosporcapita, cz_observaciones,' +
                    ' cz_usualta, cz_fechaalta, cz_usumodif, cz_fechamodif, cz_usubaja, cz_fechabaja, cz_iltprestvalorsuscriptor,' +
                    ' cz_incap050iltvalorsuscripto, cz_incap5066iltvalorsuscriptor, cz_incap66100iltvalorsuscripto,' +
                    ' cz_muerteiltvalorsuscriptor, cz_incap66100adicvalorcuit, cz_muerteadicvalorcuit, cz_tarifariorango110,' +
                    ' cz_tarifariorango1125, cz_tarifariotarifamaxima, cz_tarifariotarifaminima, cz_iltprestvalorsuscriptordef,' +
                    ' cz_incap050frecvalorsuscripdef, cz_incap050iltvalorsuscriptdef, cz_incap050incapvalorsuscridef,' +
                    ' cz_incap5066frecvalorsuscridef, cz_incap5066iltvalorsuscripdef, cz_incap5066incapvalorsuscrdef,' +
                    ' cz_incap66100frecvalorsuscrdef, cz_incap66100iltvalorsuscridef, cz_incap66100incapvalorsuscdef,' +
                    ' cz_muertefrecvalorsuscriptodef, cz_muerteiltvalorsuscriptordef, cz_iltfrecvalorsuscriptordef,' +
                    ' cz_frecuenciaesperadamodif, cz_idzonageografica, cz_establecimientos, cz_idlocalidad, cz_actividadreal,' +
                    ' cz_idprobabilidadcierre, cz_empresatestigo, cz_muestra1, cz_muestra2, cz_muestra3, cz_muestra4, cz_muestra5,' +
                    ' cz_muestra6, cz_muestra7, cz_muestra8, cz_muestra9, cz_licitacion, cz_acpo)' +
         ' SELECT seq_acz_id.NEXTVAL, :idcotizacion, cz_fechacotizacion, cz_edadpromedio, cz_zonageografica, cz_examenesperiodicos,' +
                ' cz_sector, cz_ponderadores, cz_reclamoilt, cz_tasas, cz_explotacionvariables, :explotacionfijos, cz_mgutilidad,' +
                ' cz_frecuenciaesperada, cz_siniestrosporano, cz_especiesfrecvalorcartera, cz_especiesfrecvalorcuit,' +
                ' cz_especiesfrecvalorsuscriptor, cz_especiesfrecfactorriesgo, cz_especiessinespvalorcartera, cz_especiessinespvalorcuit,' +
                ' cz_especiessinespvalorsuscript, cz_especiesespvalorcartera, cz_especiesespfactorriesgo, cz_especiesespcostoprom,' +
                ' cz_especiesesptotalempresa, cz_especiesespcapitafija, cz_iltfrecvalorcartera, cz_iltfrecvalorcuit,' +
                ' cz_iltfrecvalorsuscriptor, cz_iltfrecfactorriesgo, cz_iltsinespvalorcartera, cz_iltsinespvalorcuit,' +
                ' cz_iltsinespvalorsuscriptor, cz_iltespvalorcartera, cz_iltespfactorriesgo, cz_iltespcostopromedio,' +
                ' cz_iltesptotalempresa, cz_iltespcapitafija, cz_iltprestvalorcartera, cz_iltprestvalorcuit, cz_iltprestcostopromedio,' +
                ' cz_iltpresttotalempresa, cz_iltprestcapitavariable, cz_incap050frecvalorcartera, cz_incap050frecvalorcuit,' +
                ' cz_incap050frecvalorsuscriptor, cz_incap050frecfactorriesgo, cz_incap050sinespvalorcartera, cz_incap050sinespvalorcuit,' +
                ' cz_incap050sinespvalorsuscript, cz_incap050espvalorcartera, cz_incap050espfactorriesgo, cz_incap050espcostopromedio,' +
                ' cz_incap050esptotalempresa, cz_incap050espcapitafija, cz_incap050iltvalorcartera, cz_incap050iltvalorcuit,' +
                ' cz_incap050iltcostopromedio, cz_incap050ilttotalempresa, cz_incap050iltcapitavariable, cz_incap050incapvalorcartera,' +
                ' cz_incap050incapvalorsuscript, cz_incap050incapcostopromedio, cz_incap050incaptotalempresa,' +
                ' cz_incap050incapcapitavariable, cz_incap5066frecvalorcartera, cz_incap5066frecvalorcuit, cz_incap5066frecvalorsuscript,' +
                ' cz_incap5066frecfactorriesgo, cz_incap5066sinespvalorcartera, cz_incap5066sinespvalorcuit,' +
                ' cz_incap5066sinespvalorsuscrip, cz_incap5066espvalorcartera, cz_incap5066espfactorriesgo, cz_incap5066espcostopromedio,' +
                ' cz_incap5066esptotalempresa, cz_incap5066espcapitafija, cz_incap5066iltvalorcartera, cz_incap5066iltvalorcuit,' +
                ' cz_incap5066iltcostopromedio, cz_incap5066ilttotalempresa, cz_incap5066iltcapitavariable, cz_incap5066adicvalorcartera,' +
                ' cz_incap5066adicvalorcuit, cz_incap5066adiccostopromedio, cz_incap5066adictotalempresa, cz_incap5066adiccapitafija,' +
                ' cz_incap5066incapvalorcartera, cz_incap5066incapvalorsuscript, cz_incap5066incapfactorriesgo,' +
                ' cz_incap5066incapcostopromedio, cz_incap5066incaptotalempresa, cz_incap5066incapcapitavar,' +
                ' cz_incap66100frecvalorcartera, cz_incap66100frecvalorcuit, cz_incap66100frecvalorsuscript,' +
                ' cz_incap66100frecfactorriesgo, cz_incap66100sinespvalorcart, cz_incap66100sinespvalorcuit,' +
                ' cz_incap66100sinespvalorsuscr, cz_incap66100espvalorcartera, cz_incap66100espfactorriesgo,' +
                ' cz_incap66100espcostopromedio, cz_incap66100esptotalempresa, cz_incap66100espcapitafija, cz_incap66100iltvalorcartera,' +
                ' cz_incap66100iltvalorcuit, cz_incap66100iltcostopromedio, cz_incap66100ilttotalempresa, cz_incap66100iltcapitavariable,' +
                ' cz_incap66100adicvalorcartera, cz_incap66100adiccostopromedio, cz_incap66100adictotalempresa,' +
                ' cz_incap66100adiccapitafija, cz_incap66100incapvalorcartera, cz_incap66100incapvalorsuscrip,' +
                ' cz_incap66100incapfactorriesgo, cz_incap66100incapcostoprom, cz_incap66100incaptotalempresa,' +
                ' cz_incap66100incapcapitavar, cz_muertefrecvalorcartera, cz_muertefrecvalorcuit, cz_muertefrecvalorsuscriptor,' +
                ' cz_muertefrecfactorriesgo, cz_muertesinespvalorcartera, cz_muertesinespvalorcuit, cz_muertesinespvalorsuscriptor,' +
                ' cz_muerteespvalorcartera, cz_muerteespfactorriesgo, cz_muerteespcostopromedio, cz_muerteesptotalempresa,' +
                ' cz_muerteespcapitafija, cz_muerteiltvalorcartera, cz_muerteiltvalorcuit, cz_muerteiltcostopromedio,' +
                ' cz_muerteilttotalempresa, cz_muerteiltcapitavar, cz_muerteadicvalorcartera, cz_muerteadiccostopromedio,' +
                ' cz_muerteadictotalempresa, cz_muerteadiccapitafija, cz_muerteincapvalorcartera, cz_muerteincapvalorcuit,' +
                ' cz_muerteincapfactorriesgo, cz_muerteincapcostopromedio, cz_muerteincaptotalempresa, cz_muerteincapcapitavariable,' +
                ' cz_juiciosfrecvalorcartera, cz_juiciosfrecvalorsuscriptor, cz_juiciossinespvalorcartera, cz_juiciossinespvalorrefsusc,' +
                ' cz_juiciosdempromvalorcartera, cz_juiciosdempromtotalempresa, cz_juiciosdempromcapitavar, cz_juiciosrecvalorcartera,' +
                ' cz_juiciosrecfactorriesgo, cz_juiciosrectotalempresa, cz_juiciosreccapitafija, cz_juiciosreccapitavariable,' +
                ' cz_subtotaltotalempresa, cz_subtotalcapitafija, cz_subtotalcapitavariable, cz_gastosprevtotalempresa,' +
                ' cz_gastosprevcapitafija, cz_comisionestotalempresa, cz_comisionescapitavariable, cz_gastosexpvartotalempresa,' +
                ' cz_gastosexpvarcapitavariable, cz_gastosexpfijtotalempresa, cz_gastosexpfijcapitafija, cz_impuestostotalempresa,' +
                ' cz_impuestoscapitavariable, cz_subgasesttotalempresa, cz_subgasestcapitafija, cz_subgasestcapitavariable,' +
                ' cz_toterototalempresa, cz_toterocapitafija, cz_utilidadanualtotalempresa, cz_utilidadanualcapitafija,' +
                ' cz_tarsuganualtotalempresa, cz_tarsuganualcapitafija, cz_enpesostotalempresa, cz_alicuotacapitafija,' +
                ' cz_alicuotacapitavariable, cz_tasavariabletotalempresa, cz_idartanterior, cz_competenciacostofijo,' +
                ' cz_competenciacostovariable, cz_competenciapesosporcapita, cz_competenciatasavariable, cz_infomercadosalarioprom,' +
                ' cz_finalsumafija, cz_finalporcentajevariable, cz_finalpesosporcapita, cz_observaciones, cz_usualta, cz_fechaalta,' +
                ' cz_usumodif, cz_fechamodif, cz_usubaja, cz_fechabaja, cz_iltprestvalorsuscriptor, cz_incap050iltvalorsuscripto,' +
                ' cz_incap5066iltvalorsuscriptor, cz_incap66100iltvalorsuscripto, cz_muerteiltvalorsuscriptor,' +
                ' cz_incap66100adicvalorcuit, cz_muerteadicvalorcuit, cz_tarifariorango110, cz_tarifariorango1125,' +
                ' cz_tarifariotarifamaxima, cz_tarifariotarifaminima, cz_iltprestvalorsuscriptordef, cz_incap050frecvalorsuscripdef,' +
                ' cz_incap050iltvalorsuscriptdef, cz_incap050incapvalorsuscridef, cz_incap5066frecvalorsuscridef,' +
                ' cz_incap5066iltvalorsuscripdef, cz_incap5066incapvalorsuscrdef, cz_incap66100frecvalorsuscrdef,' +
                ' cz_incap66100iltvalorsuscridef, cz_incap66100incapvalorsuscdef, cz_muertefrecvalorsuscriptodef,' +
                ' cz_muerteiltvalorsuscriptordef, cz_iltfrecvalorsuscriptordef, cz_frecuenciaesperadamodif, cz_idzonageografica,' +
                ' cz_establecimientos, cz_idlocalidad, cz_actividadreal, cz_idprobabilidadcierre, cz_empresatestigo, cz_muestra1,' +
                ' cz_muestra2, cz_muestra3, cz_muestra4, cz_muestra5, cz_muestra6, cz_muestra7, cz_muestra8, cz_muestra9, cz_licitacion,' +
                ' (SELECT (pr_porcentaje - 5) * 1.21' +
                   ' FROM pago.ppr_porcentaje, asc_solicitudcotizacion' +
                  ' WHERE pr_identidad = sc_identidad' +
                    ' AND sc_id = :id)' +
           ' FROM acz_cotizador' +
          ' WHERE cz_idcotizacion = :idcotizacionanterior';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, Extended(IIF(checkPrestacionesEspeciales.Checked, OTRAS_EROGACIONES, 0)), FIdSolicitud, FIdCotizacionAnterior]);

      sSql :=
        'UPDATE acz_cotizador' +
          ' SET cz_competenciacostofijo = (SELECT DECODE(sc_form931,' +
                                                       ' ''A'', sc_sumafijacompetencia,' +
                                                       ' ''N'', sc_sumafija,' +
                                                       ' ''S'', sc_sumafijaform931)' +
                                           ' FROM asc_solicitudcotizacion' +
                                          ' WHERE sc_id = :idsolicitud),' +
              ' cz_competenciacostovariable = (SELECT DECODE(sc_form931,' +
                                                           ' ''A'', sc_porcvariablecompetencia,' +
                                                           ' ''N'', sc_porcvariable,' +
                                                           ' ''S'', sc_porcvariableform931)' +
                                               ' FROM asc_solicitudcotizacion' +
                                              ' WHERE sc_id = :idsolicitud),' +
              ' cz_competenciapesosporcapita = (SELECT DECODE(sc_form931,' +
                                                            ' ''A'', sc_costofinalpagomensual,' +
                                                            ' ''N'', sc_costofinal,' +
                                                            ' ''S'', sc_costofinalform931)' +
                                                ' FROM asc_solicitudcotizacion' +
                                               ' WHERE sc_id = :idsolicitud),' +
              ' cz_competenciatasavariable = (SELECT DECODE(sc_form931,' +
                                                          ' ''A'', sc_porcvariablecompetencia,' +
                                                          ' ''N'', sc_porcvariable,' +
                                                          ' ''S'', sc_porcvariableform931)' +
                                              ' FROM asc_solicitudcotizacion' +
                                             ' WHERE sc_id = :idsolicitud)' +
        ' WHERE cz_idcotizacion = :idcotizacion';
      EjecutarSqlSTEx(sSql, [FIdSolicitud, FIdSolicitud, FIdSolicitud, FIdSolicitud, iIdCotizacion]);


      sSql :=
        'SELECT cz_id' +
         ' FROM acz_cotizador' +
        ' WHERE cz_idcotizacion = :idcotizacion';
      iIdCotizador := ValorSqlIntegerEx(sSql, [iIdCotizacion]);

      sSql := 'art.cotizacion.set_historico_cotizador(:idcotizador, TRUE);';
      EjecutarStoreSTEx(sSql, [iIdCotizador]);


      sSql :=
        'INSERT INTO aac_alternativascotizacion' +
                   ' (ac_id, ac_idcotizacion, ac_frecuencia, ac_comision, ac_juicios, ac_gsvariables, ac_utilidad, ac_totalerogaciones,' +
                    ' ac_pesosporcapita, ac_pesos, ac_porcentaje, ac_variable, ac_cotizada, ac_usualta, ac_fechaalta, ac_usumodif,' +
                    ' ac_fechamodif, ac_usubaja, ac_fechabaja, ac_numero, ac_fijo, ac_pesosporcapitasinsac)' +
         ' SELECT seq_aac_id.NEXTVAL, :idcotizacion, ac_frecuencia, ac_comision, ac_juicios, ac_gsvariables, ac_utilidad,' +
                ' ac_totalerogaciones, ac_pesosporcapita, ac_pesos, ac_porcentaje, ac_variable, ac_cotizada, ac_usualta, ac_fechaalta,' +
                ' ac_usumodif, ac_fechamodif, ac_usubaja, ac_fechabaja, ac_numero, ac_fijo, ac_pesosporcapitasinsac' +
           ' FROM aac_alternativascotizacion' +
          ' WHERE ac_idcotizacion = :idcotizacionanterior';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, FIdCotizacionAnterior]);

      sSql :=
        'SELECT 1' +
         ' FROM aac_alternativascotizacion' +
        ' WHERE ac_numero = 3' +
          ' AND ac_fijo = ''T''' +
          ' AND ac_idcotizacion = :idcotizacion';
      if not ExisteSqlEx(sSql, [iIdCotizacion]) then    // Si no tiene la alternativa 3, la agrego..
      begin
        sSql :=
          'UPDATE aac_alternativascotizacion' +
            ' SET ac_numero = ac_numero + 1' +
          ' WHERE ac_numero > 2' +
            ' AND ac_idcotizacion = :idcotizacion';
        EjecutarSqlSTEx(sSql, [iIdCotizacion]);

        with TSql.Create('aac_alternativascotizacion') do
        try
          SqlType := stInsert;
          PrimaryKey.Add('ac_id', 			'SEQ_AAC_ID.NEXTVAL', False);

          Fields.Add('ac_idcotizacion', iIdCotizacion, False);
          Fields.Add('ac_usualta', 			Sesion.UserId);
          Fields.Add('ac_fechaalta', 		SQL_ACTUALDATE, False);
          Fields.Add('ac_numero', 		  3, False);
          Fields.Add('ac_comision', 		edSC_PORCCOMISION.Value);
          Fields.Add('ac_juicios', 		  ValorSqlExtendedEx('SELECT zg_valorjuiciosprivados' +
                                                            ' FROM afi.azg_zonasgeograficas' +
                                                           ' WHERE zg_id = :id',
                                                           [fraZonaGeografica.Value]));
          Fields.Add('ac_gsvariables', 	GASTOS_VARIABLES_ALTERNATIVA_COTIZACION_3);
          Fields.Add('ac_fijo', 		    'T');
          EjecutarSqlST(Sql);
        finally
          Free;
        end;
      end;


      sSql :=
        'INSERT INTO acc_cotizacioncostocartera' +
                  ' (cc_id, cc_idcotizacion, cc_idempresa, cc_suma, cc_porcentaje, cc_salario, cc_trabajador, cc_costo)' +
           ' (SELECT seq_accc_id.NEXTVAL, :idcotizacion, cc_idempresa, cc_suma, cc_porcentaje, cc_salario, cc_trabajador, cc_costo' +
              ' FROM acc_cotizacioncostocartera' +
             ' WHERE cc_idcotizacion = :idcotizacionanterior)';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, FIdCotizacionAnterior]);


      sSql :=
        'INSERT INTO acs_cotizacionsiniestro' +
                  ' (cs_id, cs_idcotizacion, cs_anio, cs_cantidadtrabajador, cs_salariocubierto, cs_periodocubierto,' +
                   ' cs_cantsiniestro, cs_cantsiniestroconbaja, cs_cantmuerte, cs_cantsiniestroleve,' +
                   ' cs_cantsiniestrograve, cs_cantipp50, cs_cantipp5066, cs_cantincapacidadtotal,' +
                   ' cs_cantdiasbajaart, cs_cantmuerteinitinere, cs_cantdiasilt)' +
           ' (SELECT seq_tec_acs_id.NEXTVAL, :idcotizacion, cs_anio, cs_cantidadtrabajador, cs_salariocubierto, cs_periodocubierto,' +
                   ' cs_cantsiniestro, cs_cantsiniestroconbaja, cs_cantmuerte, cs_cantsiniestroleve,' +
                   ' cs_cantsiniestrograve, cs_cantipp50, cs_cantipp5066, cs_cantincapacidadtotal,' +
                   ' cs_cantdiasbajaart, cs_cantmuerteinitinere, cs_cantdiasilt' +
              ' FROM acs_cotizacionsiniestro' +
             ' WHERE cs_idcotizacion = :idcotizacionanterior)';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, FIdCotizacionAnterior]);


      sSql :=
        'INSERT INTO adi_detalleilp' +
                  ' (di_id, di_idcotizacion, di_sexo, di_fechanac, di_edad, di_anio, di_porcentaje, di_muerte, di_fechamodif, di_usumodif)' +
           ' (SELECT seq_adi_id.NEXTVAL, :idcotizacion, di_sexo, di_fechanac, di_edad, di_anio, di_porcentaje, di_muerte, SYSDATE, :usumodif' +
              ' FROM adi_detalleilp' +
             ' WHERE di_idcotizacion = :idcotizacionanterior)';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, 'S_' + Sesion.UserID, FIdCotizacionAnterior]);


      sSql :=
        'INSERT INTO atc_tarifacobrar' +
                   ' (tc_costofinal, tc_fechaalta, tc_fechaautorizacion, tc_fechacomercial, tc_fechacomite, tc_fechaoperaciones,' +
                    ' tc_fechaprevencion, tc_fechatecnica, tc_id, tc_idcotizacion, tc_observaciones, tc_porcvariable,' +
                    ' tc_puestoautorizacion, tc_sumafija, tc_usualta, tc_usuautorizacion, tc_usucomercial, tc_usucomite,' +
                    ' tc_usuoperaciones, tc_usuprevencion, tc_usutecnica)' +
         ' (SELECT tc_costofinal, SYSDATE, tc_fechaautorizacion, tc_fechacomercial, tc_fechacomite, tc_fechaoperaciones,' +
                 ' tc_fechaprevencion, tc_fechatecnica, seq_atcc_id.NEXTVAL, :idcotizacion, tc_observaciones, tc_porcvariable,' +
                 ' tc_puestoautorizacion, tc_sumafija, tc_usualta, tc_usuautorizacion, tc_usucomercial, tc_usucomite, tc_usuoperaciones,' +
                 ' tc_usuprevencion, tc_usutecnica' +
            ' FROM atc_tarifacobrar' +
           ' WHERE tc_id = (SELECT MAX(tc_id)' +
                            ' FROM atc_tarifacobrar' +
                           ' WHERE tc_idcotizacion = :idcotizacionanterior))';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, FIdCotizacionAnterior]);


      sSql :=
        'INSERT INTO aco_costootros' +
                  ' (co_id, co_idcotizacion, co_idart, co_suma, co_porcentaje, co_salario, co_costo, co_trabajador)' +
           ' (SELECT seq_acoo_id.NEXTVAL, :idcotizacion, co_idart, co_suma, co_porcentaje, co_salario, co_costo, co_trabajador' +
              ' FROM aco_costootros' +
             ' WHERE co_idcotizacion = :idcotizacionanterior)';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, FIdCotizacionAnterior]);


      sSql :=
        'INSERT INTO ass_solicitudsrt' +
                  ' (ss_id, ss_idcotizacion, ss_idart, ss_vigenciadesde, ss_vigenciahasta, ss_operacion, ss_nivel,' +
                   ' ss_fechaextincion, ss_fecharegularizacion, ss_usualta, ss_fechaalta, ss_usumodif, ss_fechamodif,' +
                   ' ss_usubaja, ss_fechabaja, ss_idactividad1, ss_idactividad2, ss_idactividad3, ss_rescision)' +
           ' (SELECT afi.seq_ass_id.NEXTVAL, :idcotizacion, ss_idart, ss_vigenciadesde, ss_vigenciahasta, ss_operacion, ss_nivel,' +
                   ' ss_fechaextincion, ss_fecharegularizacion, ss_usualta, ss_fechaalta, ss_usumodif, ss_fechamodif,' +
                   ' ss_usubaja, ss_fechabaja, ss_idactividad1, ss_idactividad2, ss_idactividad3, ss_rescision' +
              ' FROM ass_solicitudsrt' +
             ' WHERE ss_idcotizacion = :idcotizacionanterior)';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, FIdCotizacionAnterior]);
    end;


    if iIdCotizacion > 0 then
    begin
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_idcotizacion = :idcotizacion' +
        ' WHERE sc_id = :id';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, FIdSolicitud]);


      sSql :=
        'SELECT sc_canal, sc_identidad, sc_idvendedor' +
         ' FROM asc_solicitudcotizacion' +
        ' WHERE sc_idcotizacion = :id';
      aQuery1 := GetQueryEx(sSql, [FIdCotizacionAnterior]);
      sSql :=
        'SELECT sc_canal, sc_identidad, sc_idvendedor' +
         ' FROM asc_solicitudcotizacion' +
        ' WHERE sc_id = :id';
      aQuery2 := GetQueryEx(sSql, [FIdSolicitud]);
      try
        if (aQuery1.FieldByName('sc_canal').AsInteger = aQuery2.FieldByName('sc_canal').AsInteger) and
           (aQuery1.FieldByName('sc_identidad').AsInteger = aQuery2.FieldByName('sc_identidad').AsInteger) and
           (aQuery1.FieldByName('sc_idvendedor').AsInteger = aQuery2.FieldByName('sc_idvendedor').AsInteger) then
        begin
          sSql :=
            'UPDATE asc_solicitudcotizacion' +
              ' SET sc_porccomision = (SELECT co_comision' +
                                       ' FROM aco_cotizacion' +
                                      ' WHERE co_id = :idcotizacion2)' +
            ' WHERE sc_id = :id';
          EjecutarSqlSTEx(sSql, [iIdCotizacion, FIdSolicitud]);
        end;
      finally
        aQuery1.Free;
        aQuery2.Free;
      end;
    end;

    sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
    EjecutarSqlSTEx(sSql, [FIdSolicitud]);


    if ((FValidacionCotizacion.NumeroError = 0) or (FValidacionCotizacion.Advertencia)) then   // Si la cotización no tuvo errores, hago lo de abajo, sino no..
    begin
      sSql :=
        'SELECT sc_id' +
         ' FROM asc_solicitudcotizacion' +
        ' WHERE sc_idcotizacion = :idcotizacion';
      iIdSolicitudAnterior := ValorSqlIntegerEx(sSql, [FIdCotizacionAnterior]);

      sSql := 'SELECT art.cotizacion.get_cambiosignificativo(:idsolicitudnew, :idsolicitudold) FROM DUAL';
      bAsignarNuevoNumeroCotizacion := (ValorSqlIntegerEx(sSql, [FIdSolicitud, iIdSolicitudAnterior]) <> 0);

      if not bAsignarNuevoNumeroCotizacion then    // Si no hay que asignar un nuevo número de cotización..
      begin
        // Muestro los valores para que seleccionen el que quieran..

        // Alícuota actual cotizada..
        sSql :=
          'SELECT tc_porcvariable porcentajevariable, tc_sumafija costofijo, tc_costofinal costofinal,' +
                ' tc_costofinal * co_canttrabajador costomensual,' +
                ' tc_costofinal * co_canttrabajador * 12 costoanual' +
           ' FROM aco_cotizacion, atc_tarifacobrar' +
          ' WHERE co_id = tc_idcotizacion' +
            ' AND co_id = :id' +
       ' ORDER BY tc_fechaalta DESC';
        with GetQueryEx(sSql, [FIdCotizacionAnterior]) do
        try
          edPorVarAlicuotaActualCotizada.Value            := FieldByName('porcentajevariable').AsFloat;
          edSumaFijaAlicuotaActualCotizada.Value          := FieldByName('costofijo').AsFloat;
          edCostoFinalCapitasAlicuotaActualCotizada.Value := FieldByName('costofinal').AsFloat;
          edCostoMensualAlicuotaActualCotizada.Value      := FieldByName('costomensual').AsFloat;
          edCostoAnualAlicuotaActualCotizada.Value        := FieldByName('costoanual').AsFloat;
        finally
          Free;
        end;


        // Alícuota mínima..
        sSql :=
          'SELECT co_porcvariablepiso porcentajevariable, co_sumafijapiso costofijo, co_costofinalpiso costofinal,' +
                ' co_costofinalpiso * co_canttrabajador costomensual,' +
                ' co_costofinalpiso * co_canttrabajador * 12 costoanual' +
           ' FROM aco_cotizacion' +
          ' WHERE co_id = :id';
        with GetQueryEx(sSql, [FIdCotizacionAnterior]) do
        try
          edPorVarAlicuotaMinima.Value            := FieldByName('porcentajevariable').AsFloat;
          edSumaFijaAlicuotaMinima.Value          := FieldByName('costofijo').AsFloat;
          edCostoFinalCapitasAlicuotaMinima.Value := FieldByName('costofinal').AsFloat;
          edCostoMensualAlicuotaMinima.Value      := FieldByName('costomensual').AsFloat;
          edCostoAnualAlicuotaMinima.Value        := FieldByName('costoanual').AsFloat;
        finally
          Free;
        end;


        // Alícuota máxima..
        sSql :=
          'SELECT ts_porce2 porcentajevariable, ts_tarifa2 costofijo,' +
                ' (ts_tarifa2 / 100) * co_masasalarial / co_canttrabajador + ts_porce2 costofinal,' +
                ' ((ts_tarifa2 / 100) * co_masasalarial) + ts_porce2 * co_canttrabajador costomensual,' +
                ' ((ts_tarifa2 / 100) * co_masasalarial * 13) + ts_porce2 * co_canttrabajador * 12 costoanual' +
           ' FROM ats_tarifassn, aco_cotizacion' +
          ' WHERE ts_idactividad = co_idactividad' +
            ' AND ts_fechabaja IS NULL' +
            ' AND ts_fechadesde <= actualdate' +
            ' AND (   ts_fechahasta >= actualdate' +
                 ' OR ts_fechahasta IS NULL)' +
            ' AND co_id = :id';
        with GetQueryEx(sSql, [FIdCotizacionAnterior]) do
        try
          edPorVarAlicuotaMaxima.Value            := FieldByName('porcentajevariable').AsFloat;
          edSumaFijaAlicuotaMaxima.Value          := FieldByName('costofijo').AsFloat;
          edCostoFinalCapitasAlicuotaMaxima.Value := FieldByName('costofinal').AsFloat;
          edCostoMensualAlicuotaMaxima.Value      := FieldByName('costomensual').AsFloat;
          edCostoAnualAlicuotaMaxima.Value        := FieldByName('costoanual').AsFloat;
        finally
          Free;
        end;


        lbTopesAlicuotaVariable.Caption := Format('(Entre %s y %s)', [FormatFloat('##0.000%', GetTopeMinimoVariableClonacion), FormatFloat('##0.000%', GetTopeMaximoVariableClonacion)]);
        lbTopesAlicuotaFija.Caption := Format('(Entre %s y %s)', [FormatFloat('$##0.00', GetTopeMinimoFijoClonacion), FormatFloat('$##0.00', GetTopeMaximoFijoClonacion)]);

        edAlicuotaVariable.Value := edPorVarAlicuotaActualCotizada.Value;
        edAlicuotaFija.Value := edSumaFijaAlicuotaActualCotizada.Value;

        edSumaAseguradaRCClonacion.Value    := 0;
        edAlicuotaVariableRCClonacion.Value := 0;
        edMasaSalarialRCClonacion.Value     := edfpSC_MASASALARIAL.Value;
        edCuotaInicialRCClonacion.Value     := 0;

        sSql :=
          'SELECT 1' +
           ' FROM art.aum_usuariotarifaminima' +
          ' WHERE um_usuario = :usuario' +
            ' AND um_fechabaja IS NULL';
        lbAlicuotaMinima.Visible                  := (ExisteSqlEx(sSql, [Sesion.UserID])) and (edPorVarAlicuotaMinima.Value > 0) and (edSumaFijaAlicuotaMinima.Value > 0);
        edPorVarAlicuotaMinima.Visible            := lbAlicuotaMinima.Visible;
        edSumaFijaAlicuotaMinima.Visible          := lbAlicuotaMinima.Visible;
        edCostoFinalCapitasAlicuotaMinima.Visible := lbAlicuotaMinima.Visible;
        edCostoMensualAlicuotaMinima.Visible      := lbAlicuotaMinima.Visible;
        edCostoAnualAlicuotaMinima.Visible        := lbAlicuotaMinima.Visible;

        FCostosClonacionOk := True;

        fpCostosClonacion.ShowModal;

        if FCostosClonacionOk then
        begin
          // Valido que tenga algún costo cargado..
          Verificar((edAlicuotaVariable.Value = 0), edAlicuotaVariable, 'La Alícuota Variable debe ser mayor a cero.');


          // Guardo los valores..
          sSql :=
            'UPDATE asc_solicitudcotizacion' +
              ' SET sc_estado = :estado,' +
                  ' sc_finalsumafija = :finalsumafija,' +
                  ' sc_finalporcmasa = :finalporcmasa,' +
                  ' sc_finalportrabajador = :finalportrabajador,' +
                  ' sc_motivoclonacion = :motivoclonacion' +
            ' WHERE sc_id = :id';
          EjecutarSqlSTEx(sSql, [EC_NOTIF_COMERCIAL, edAlicuotaFija.Value, edAlicuotaVariable.Value,
                                 ((edAlicuotaVariable.Value /100) * edfpSC_MASASALARIAL.Value / edfpSC_CANTTRABAJADOR.Value + edAlicuotaFija.Value),
                                 IIF(FCostosClonacionOk, 1, 2), FIdSolicitud]);

          sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
          EjecutarSqlSTEx(sSql, [FIdSolicitud]);

          sSql :=
            'UPDATE aco_cotizacion' +
              ' SET co_estado = :estado,' +
                  ' co_fechacerrado = SYSDATE' +
            ' WHERE co_id = :id';
          EjecutarSqlSTEx(sSql, [EC_NOTIF_COMERCIAL, iIdCotizacion]);

          sSql :=
            'DELETE FROM atc_tarifacobrar' +
                 ' WHERE tc_idcotizacion = :idcotizacion' +
                   ' AND tc_id <> (SELECT MIN(tc_id)' +
                                   ' FROM atc_tarifacobrar' +
                                  ' WHERE tc_idcotizacion = :idcotizacion)';
          EjecutarSqlSTEx(sSql, [iIdCotizacion]);

          sSql :=
            'UPDATE atc_tarifacobrar' +
              ' SET tc_costofinal = :costofinal,' +
                  ' tc_observaciones = NULL,' +
                  ' tc_porcvariable = :porcvariable,' +
                  ' tc_sumafija = :sumafija' +
            ' WHERE tc_idcotizacion = :idcotizacion';
          EjecutarSqlSTEx(sSql, [((edAlicuotaVariable.Value /100) * edfpSC_MASASALARIAL.Value / edfpSC_CANTTRABAJADOR.Value + edAlicuotaFija.Value),
                                 edAlicuotaVariable.Value, edAlicuotaFija.Value, iIdCotizacion]);

        end
        else
        begin
          bAsignarNuevoNumeroCotizacion := True;

          sSql :=
            'UPDATE asc_solicitudcotizacion' +
              ' SET sc_motivonoautocotizacion = SUBSTR(sc_motivonoautocotizacion || :motivo, 1, 256)' +
            ' WHERE sc_id = :id';
          EjecutarSqlSTEx(sSql, [' Cotización pedida por ' + Sesion.UserID + '.', FIdSolicitud]);
        end;
      end;

      if bAsignarNuevoNumeroCotizacion then
      begin
        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_estado = :estado,' +
                ' sc_fechacierre = NULL,' +
                ' sc_fechavigencia = NULL,' +
                ' sc_finalporcmasa = NULL,' +
                ' sc_finalportrabajador = NULL,' +
                ' sc_finalsumafija = NULL,' +
                ' sc_porcaumento = NULL,' +
                ' sc_porcdescuento = NULL,' +
                ' sc_valor_rc = NULL' +
          ' WHERE sc_id = :id';
        EjecutarSqlSTEx(sSql, [EC_PEND_COTIZ, FIdSolicitud]);

        sSql :=
          'UPDATE aco_cotizacion' +
            ' SET co_nrocotizacion = (SELECT NVL(MAX(co_nrocotizacion), 0) + 1' +
                                      ' FROM aco_cotizacion),' +
                ' co_orden = 0,' +
                ' co_estado = :estado,' +
                ' co_canttrabajador = (SELECT sc_canttrabajador FROM asc_solicitudcotizacion WHERE sc_id = :idsolicitud),' +
                ' co_masasalarial = (SELECT sc_masasalarial FROM asc_solicitudcotizacion WHERE sc_id = :idsolicitud),' +
                ' co_usuarioconfecciono = NULL,' +
                ' co_puestoautorizacion = NULL,' +
                ' co_usuarioautorizacion = NULL,' +
                ' co_usucerrado = NULL' +
          ' WHERE co_id = :id';
        EjecutarSqlSTEx(sSql, [EC_PEND_COTIZ, FIdSolicitud, FIdSolicitud, iIdCotizacion]);

        sSql :=
          'DELETE FROM atc_tarifacobrar' +
               ' WHERE tc_idcotizacion = :idcotizacion' +
                 ' AND tc_id <> (SELECT MIN(tc_id)' +
                                 ' FROM atc_tarifacobrar' +
                                ' WHERE tc_idcotizacion = :idcotizacion)';
        EjecutarSqlSTEx(sSql, [iIdCotizacion]);

        sSql :=
          'UPDATE atc_tarifacobrar' +
            ' SET tc_costofinal = 0,' +
                ' tc_observaciones = NULL,' +
                ' tc_porcvariable = 0,' +
                ' tc_sumafija = 0' +
          ' WHERE tc_idcotizacion = :idcotizacion';
        EjecutarSqlSTEx(sSql, [iIdCotizacion]);

        sSql :=
          'DELETE FROM aac_alternativascotizacion' +
               ' WHERE ac_idcotizacion = :idcotizacion' +
                 ' AND ac_fijo = ''F''';
        EjecutarSqlSTEx(sSql, [iIdCotizacion]);
      end;

      // Pongo las tarifas piso en 0 luego de haberlas utilizado para mostrar los costos de la clonación..
      sSql :=
        'UPDATE aco_cotizacion' +
          ' SET co_acpopiso = NULL,' +
              ' co_comisionpiso = NULL,' +
              ' co_costofinalpiso = NULL,' +
              ' co_porcvariablepiso = NULL,' +
              ' co_sumafijapiso = NULL' +
        ' WHERE co_id = :id' +
          ' AND co_estado <> :estado';
      EjecutarSqlSTEx(sSql, [iIdCotizacion, EC_NOTIF_COMERCIAL]);
    end;

{
25.3.2014 - Se comenta lo de abajo porque la suspensión se hace desde el trigger afi.trg_asc_suspendersolicporciiu..

    // Suspendo la cotización, en caso de corresponder..
    sSql :=
      'SELECT 1' +
       ' FROM afi.acu_ciiususpendidoauto' +
      ' WHERE cu_idactividad = :idactividad' +
        ' AND :canttrabajador > cu_capitas' +
        ' AND SYSDATE BETWEEN cu_fechadesde AND cu_fechahasta' +
        ' AND cu_fechabaja IS NULL';
    if ExisteSqlEx(sSql, [frafpSC_IDACTIVIDAD.Value, edfpSC_CANTTRABAJADOR.Value]) then
    begin
      aFrmConsultaCotizacion := TfrmConsultaCotizacion.Create(nil);
      with aFrmConsultaCotizacion do
      try
        Constraints.MinHeight := 0;
        Constraints.MinWidth := 0;

        Height := 8;
        Width := 8;

        tbLimpiarClick(nil);

        sSql :=
          'SELECT sc_nrosolicitud' +
           ' FROM asc_solicitudcotizacion' +
          ' WHERE sc_idcotizacion = :idcotizacion';
        edSC_NROSOLICITUD.Value := ValorSqlIntegerEx(sSql, [iIdCotizacion]);

        tbRefrescarClick(nil);

        Suspender(True);
      finally
        Free;
      end;
    end;
}

    CommitTrans(True);
  except
    on E: Exception do
    begin
      RollBack(True);
      MsgBox(E.Message);
    end;
  end;
end;

function TfrmConsultaSolicitud.EnviarEmailHtml(const aIdCanal, aIdEntidad: Integer; var aFileName: String): Boolean;
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

function TfrmConsultaSolicitud.FiltroProvincia: String;
begin
  Result := '';
  if (fraProvincia.sdqDatos.Active) and (StrToIntDef(fraProvincia.sdqDatos.FieldByName('zg_idprovincia').AsString, 0) <> 0) then
    Result := ' AND cp_provincia = ' + SqlValue(fraProvincia.sdqDatos.FieldByName('zg_idprovincia').AsString);
end;

{function TfrmConsultaSolicitud.GetArt(const aArtWeb: String): Integer;
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
end;}

function TfrmConsultaSolicitud.GetComision(const aVendedor: Integer; const aSector: String;
                                           const aCantTrabajadores, aIdHolding: Integer): Real;
var
  sSql: String;
begin
  sSql := 'SELECT art.cotizacion.get_porccomision(:vendedor, :sector, :empleados, :holding) FROM DUAL';
  Result := ValorSqlExtendedEx(sSql, [aVendedor, aSector, aCantTrabajadores, aIdHolding], -1);
end;

function TfrmConsultaSolicitud.GetIdLocalidadEstablecimiento(const aIdSolicitud: Integer): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT   eu_idlocalidad' +
       ' FROM afi.aeu_establecimientos' +
      ' WHERE eu_idsolicitud = :idsolicitud' +
        ' AND eu_idlocalidad IS NOT NULL' +
        ' AND eu_tiposolicitud = 1' +
        ' AND eu_fechabaja IS NULL' +
   ' ORDER BY eu_id';
  Result := ValorSqlIntegerEx(sSql, [aIdSolicitud]);
end;

function TfrmConsultaSolicitud.GetIdZonaGeograficaEstablecimiento(const aIdSolicitud: Integer): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT   eu_idzonageografica' +
       ' FROM afi.aeu_establecimientos' +
      ' WHERE eu_idsolicitud = :idsolicitud' +
        ' AND eu_idzonageografica IS NOT NULL' +
        ' AND eu_tiposolicitud = 1' +
        ' AND eu_fechabaja IS NULL' +
   ' ORDER BY eu_id';
  Result := ValorSqlIntegerEx(sSql, [aIdSolicitud]);
end;

function TfrmConsultaSolicitud.GetValidacionCotizacion(const aIdSolicitud: Integer): TRecValidacion;
begin
  with sdspGetValidarCotizacion do
  begin
    ParamByName('cesclonacion').AsString               := IIF(FEsClonacion, 'T', 'F');
    ParamByName('corigen').AsString                    := 'D';
    ParamByName('csuscribepolizarc').AsString          := IIF(rbRCsi.Checked, 'S', 'N');
    ParamByName('ctipodatocompetencia').AsString       := IIF(rbPagoTotalMensual.Checked, 'A', IIF(rbDatosEmpresa.Checked, 'N', IIF(rbForm931.Checked, 'S', '')));
    ParamByName('ctiposolicitud').AsString             := 'C';
    ParamByName('cvalidarcomision').AsString           := IIF((not FComisionCalculada), 'T', 'F');
    ParamByName('nbcra').AsInteger                     := StrToIntDef(fraStatusBCRA.Value, 0);
    ParamByName('ncant_trabajador').AsInteger          := edfpSC_CANTTRABAJADOR.Value;
    ParamByName('ncant_trabajador1').AsInteger         := edfpSC_CANTTRABAJADOR1.Value;
    ParamByName('ncant_trabajador2').AsInteger         := edfpSC_CANTTRABAJADOR2.Value;
    ParamByName('ncant_trabajador3').AsInteger         := edfpSC_CANTTRABAJADOR3.Value;
    ParamByName('ncantidadestablecimientos').AsInteger := edEstablecimientos.Value;
    ParamByName('ncomision').AsFloat                   := edSC_PORCCOMISION.Value;
    ParamByName('ncostofijocompetencia').AsFloat       := edSC_COSTOFIJOCOMPETENCIAPARCIAL.Value;
    ParamByName('ncostofijoform931').AsFloat           := edSC_COSTOFIJO931PARCIAL.Value;
    ParamByName('ncostovariablecompetencia').AsFloat   := edSC_PORCVARIABLECOMPETENCIAPARC.Value;
    ParamByName('ncostovariableform931').AsFloat       := edSC_PORCVARIABLE931PARCIAL.Value;
    ParamByName('nedadpromedio').AsInteger             := IIF(edSC_EDADPROMEDIO.IsEmpty, -1, edSC_EDADPROMEDIO.Value);
    ParamByName('nid').AsInteger                       := IIF((ModoABM = maAlta), 0, aIdSolicitud);
    ParamByName('nid_ciiu').AsInteger                  := frafpSC_IDACTIVIDAD.Value;
    ParamByName('nid_ciiu2').AsInteger                 := frafpSC_IDACTIVIDAD2.Value;
    ParamByName('nid_ciiu3').AsInteger                 := frafpSC_IDACTIVIDAD3.Value;
    ParamByName('nidartanterior').AsInteger            := fraSC_IDARTANTERIOR.Value;
    ParamByName('nidcanal').AsInteger                  := frafpSC_CANAL.Value;
    ParamByName('nidcentroregional').AsInteger         := frafpIDCENTROREG.Value;
    ParamByName('nidentidad').AsInteger                := frafpSC_ENTIDAD.Value;
    ParamByName('nidholding').AsInteger                := edfpSC_IDGRUPOECONOMICO.Value;
    ParamByName('nidprobabilidadcierre').AsInteger     := fraProbabilidadCierreNegocio.Value;
    ParamByName('nidsector').AsInteger                 := StrToIntDef(fraSector.Value, 0);
    ParamByName('nidsolicitudanterior').AsInteger      := FIdSolicitudAnterior;
    ParamByName('nidsucursal').AsInteger               := frafpSC_IDSUCURSAL.Value;
    ParamByName('nidvendedor').AsInteger               := frafpSC_VENDEDOR.Value;
    ParamByName('nidzonageografica').AsInteger         := StrToIntDef(fraZonaGeografica.Codigo,0);
    ParamByName('nmasasalarial').AsFloat               := edfpSC_MASASALARIAL.Value;
    ParamByName('nmasasalarial1').AsFloat              := edfpSC_MASASALARIAL1.Value;
    ParamByName('nmasasalarial2').AsFloat              := edfpSC_MASASALARIAL2.Value;
    ParamByName('nmasasalarial3').AsFloat              := edfpSC_MASASALARIAL3.Value;
    ParamByName('npagototalmensual').AsFloat           := edSC_PAGOCOMPETENCIAPARCIAL.Value;
    ParamByName('nresultadomensualtrabajador').AsFloat := edResultadoMensualTrabajador.Value;
    ParamByName('nsrt').AsInteger                      := StrToIntDef(fraStatusSRT.Value, 0);
    ParamByName('nsumaaseguradarc').AsFloat            := GetSumaAseguradaRc;
    ParamByName('sactividadreal').AsString             := edfpSC_ACTIVIDADREAL.Text;
    ParamByName('scontacto').AsString                  := edfpSC_CONTACTO.Text;
    ParamByName('scuit').AsString                      := edfpSC_CUIT.Text;
    ParamByName('semail').AsString                     := edfpSC_MAIL.Text;
    ParamByName('sobservaciones').AsString             := edfpSC_OBSERVACIONES.Lines.Text;
    ParamByName('speriodo').AsString                   := edPeriodo.Text;
    ParamByName('sprestacionesespeciales').AsString    := IIF(checkPrestacionesEspeciales.Checked, 'S', 'N');
    ParamByName('srazonsocial').AsString               := edfpSC_RAZONSOCIAL.Text;
    ParamByName('ssolo_pcp').AsString                  := IIF(chkSoloPCP.Checked, 'S', 'N');
    ParamByName('susualta').AsString                   := Sesion.UserID;

		if chkSoloPCP.Checked then
    begin
      ParamByName('ctipodatocompetencia').AsString       := '';
      ParamByName('nbcra').AsInteger                     := -1;
      ParamByName('ncantidadestablecimientos').AsInteger := 0;
      ParamByName('ncant_trabajador').AsInteger          := StrToInt(sgGridPCP.Cells[2, sgGridPCP.RowCount - 1]);
      ParamByName('ncant_trabajador1').AsInteger         := StrToInt(sgGridPCP.Cells[2, sgGridPCP.RowCount - 1]);
      ParamByName('nedadpromedio').AsInteger             := 35;
      ParamByName('nid_ciiu').AsInteger                  := 1569;
      ParamByName('nidsector').AsInteger                 := 4;
      ParamByName('nidzonageografica').AsInteger         := 1;
      ParamByName('nmasasalarial').AsFloat               := 0;
      ParamByName('sactividadreal').AsString             := 'Servicios de hogares privados que contratan servicio doméstico';
      ParamByName('speriodo').AsString                   := FormatDateTime('yyyymm', DBDate);
    end;

    ExecProc;

    with Result do
    begin
      Advertencia            := (ParamByName('sadvertencia').AsString = 'A');
      ContinuarCarga         := ParamByName('scontinuarcarga').AsString;
      DescripcionError       := ParamByName('serror').AsString;
      MotivoNoAutoCotizacion := ParamByName('smotivonoautocotizacion').AsString;
      NumeroError            := ParamByName('nerror').AsInteger;
      VerificaTecnica        := (ParamByName('sverificatecnica').AsString = 'S');
    end;
  end;
end;

function TfrmConsultaSolicitud.GetValorCotizacion(const aDescuento, aAumento: Real): TRecValorCotizacion;
begin
  with sdspGetCotizacion do    //Get_Valor_Online.
  begin
    ParamByName('naumento').AsFloat           := aAumento;
    ParamByName('ncant_trabajador').AsInteger := edfpSC_CANTTRABAJADOR.Value;
    ParamByName('ndescuento').AsFloat         := aDescuento;
    ParamByName('nid_ciiu').AsInteger         := frafpSC_IDACTIVIDAD.Value;
    ParamByName('nmasa_salarial').AsFloat     := edfpSC_MASASALARIAL.Value;
//    ParamByName('nmpyme').AsInteger           := IIF(checkMicroPyme.Checked, 1, 0);

    ExecProc;

    with Result do
      if ParamByName('nError').AsInteger = 0 then
      begin
        CostoAnual   := ParamByName('ncosto_anual').AsFloat;
        CostoCapitas := ParamByName('ncosto_capitas').AsFloat;
        CostoMensual := ParamByName('ncosto_mensual').AsFloat;
        SumaFija     := ParamByName('nsuma_fija').AsFloat;
        SumaVariable := RoundTo(ParamByName('nvariable').AsFloat, -3);

        ValorRc := GetValorResponsabilidadCivil(edfpSC_CUIT.Text, fraZonaGeografica.Codigo, FIdSolicitud, edfpSC_CANTTRABAJADOR.Value, GetSumaAseguradaRc,
                                                edfpSC_MASASALARIAL.Value, SumaVariable, SumaFija, aDescuento);

      end
      else
      begin
        Error := ParamByName('nError').AsInteger;
        ErrorDescripcion := ParamByName('sError').AsString;
      end;
  end;
end;

function TfrmConsultaSolicitud.IsEventoSGC: Boolean;
begin
  Result := ((ModoABM = maAlta) and (Self.ClassName = 'TfrmConsultaSolicitudExt')) or
            (sdqConsulta.Active and (not sdqConsulta.FieldByName('sc_idevento').IsNull));
end;

function TfrmConsultaSolicitud.Validar: Boolean;
  procedure ClearTipo;
  begin
    FValidacionCotizacion.Advertencia            := False;
    FValidacionCotizacion.ContinuarCarga         := 'N';
    FValidacionCotizacion.DescripcionError       := '';
    FValidacionCotizacion.MotivoNoAutoCotizacion := '';
    FValidacionCotizacion.NumeroError            := 0;
    FValidacionCotizacion.VerificaTecnica        := False;
  end;

var
  aId: Integer;
  sMsg: String;
  sResultado: String;
  sSql: String;
begin
  Result := False;

  ClearTipo;

  aId := 0;

  if sdqConsulta.Active then
    aId := sdqConsulta.FieldByName('sc_id').AsInteger;

  SetearValoresSoloPCP;

  Verificar((not chkSoloPCP.Checked) and (fraStatusSRT.IsEmpty), fraStatusSRT, 'No se ha completado el status ante la SRT.');

  // Agregado acá por ticket 43651, habría que meterlo en la función que valida de PL-SQL tal vez..
  sSql := 'SELECT art.cotizacion.get_permitecotizar(:cuit, ''C'') FROM DUAL';
  sResultado := Trim(ValorSqlEx(sSql, [edfpSC_CUIT.Text]));
  if (sResultado <> '') and (sResultado <> 'S') then
  begin
    MsgBox(sResultado);
    edfpSC_CUIT.SetFocus;
    Exit;
  end;


  // Llamo al procedure de PL-SQL que valida la cotización..
  FValidacionCotizacion := GetValidacionCotizacion(aId);
  if (FValidacionCotizacion.NumeroError <> 0) or (FValidacionCotizacion.Advertencia) then
  begin
    sMsg := Format('[%d] - %s', [FValidacionCotizacion.NumeroError, FValidacionCotizacion.DescripcionError]);
    if FValidacionCotizacion.Advertencia then
      MsgBox(sMsg, MB_ICONINFORMATION)
    else
      MsgBox(sMsg, MB_ICONWARNING);

    if (not FValidacionCotizacion.Advertencia) and (FValidacionCotizacion.ContinuarCarga = 'N') then
    begin
      case FValidacionCotizacion.NumeroError of
        500: edfpSC_CUIT.SetFocus;
        520: edfpSC_RAZONSOCIAL.SetFocus;
        530: edfpSC_CONTACTO.SetFocus;
        535: edfpSC_MAIL.SetFocus;
        540: frafpSC_CANAL.edCodigo.SetFocus;
        550: frafpSC_ENTIDAD.edCodigo.SetFocus;
        560: frafpSC_IDSUCURSAL.edCodigo.SetFocus;
        570: frafpIDCENTROREG.edCodigo.SetFocus;
        580: frafpSC_VENDEDOR.edCodigo.SetFocus;
        590: frafpSC_IDACTIVIDAD.edCodigo.SetFocus;
        600: try edfpSC_CANTTRABAJADOR1.SetFocus except end;
        610: edfpSC_MASASALARIAL1.SetFocus;
        620: edfpSC_MASASALARIAL1.SetFocus;
        630: edfpSC_MASASALARIAL1.SetFocus;
        640: edPeriodo.SetFocus;
        650: edPeriodo.SetFocus;
        660: edfpSC_ACTIVIDADREAL.SetFocus;
        670: fraSC_IDARTANTERIOR.edCodigo.SetFocus;
        680: fraStatusBCRA.edCodigo.SetFocus;
        690: btnCalcular.SetFocus;
        695: edSC_EDADPROMEDIO.SetFocus;
        700: fraSector.edCodigo.SetFocus;
        705: fraZonaGeografica.edCodigo.SetFocus;
        710: edEstablecimientos.SetFocus;
        720: fraProbabilidadCierreNegocio.edCodigo.SetFocus;
        //730: edSC_PORCCOMISION.SetFocus;    //si no esta activado da error
        //740: edSC_PORCCOMISION.SetFocus;
        730: InvalidMsg(edSC_PORCCOMISION, 'Campo Obligatorio');
        740: InvalidMsg(edSC_PORCCOMISION, 'Campo Obligatorio');
        750: edEstablecimientos.SetFocus;
        753: rbRCsi.SetFocus;
      end;
      Exit;
    end;
  end;
  Result := True;
end;


procedure TfrmConsultaSolicitud.ActivarABM(bEstado: Boolean);
begin
  tb_ACE_Nuevo.Enabled     := not bEstado;
  tb_ACE_Modificar.Enabled := not bEstado;
  tb_ACE_Eliminar.Enabled  := not bEstado;
  tb_ACE_Guardar.Enabled   := bEstado;
  tb_ACE_Cancelar.Enabled  := bEstado;
  tb_ACE_Ordenar.Enabled   := not bEstado;

  dbgACE_COTIZACIONEVENTOS.Enabled := not bEstado;
  pnlACE_COTIZACIONEVENTOS.Enabled := bEstado;
  VCLExtra.LockControl(cmbCE_FECHA, not bEstado);
  VCLExtra.LockControl(edCE_DESCRIPCION, not bEstado);

  if bEstado then
  begin
    if cmbCE_FECHA.CanFocus then
      cmbCE_FECHA.SetFocus;
  end
  else
    if dbgACE_COTIZACIONEVENTOS.CanFocus then
      dbgACE_COTIZACIONEVENTOS.SetFocus;
end;

procedure TfrmConsultaSolicitud.ActualizarResultadosAutoCotizacion;
var
  sSql: String;
begin
  // Completo los 3 campos de la derecha..
  sSql :=
    'SELECT DECODE(sc_fechavigencia,' +
                 ' NULL, TO_NUMBER(NULL),' +
                 ' DECODE(' + StringReplace(FloatToStr(edResultadoMensualTrabajador.Value), ',', '.', []) + ', 0, TO_NUMBER(NULL),((' + StringReplace(FloatToStr(ceCostoCapitas.Value), ',', '.', []) + ' / ' + StringReplace(FloatToStr(edResultadoMensualTrabajador.Value), ',', '.', []) + ') - 1) * 100)) difporc,' +
          ' DECODE(sc_fechavigencia,' +
                 ' NULL, NULL,' +
                 ' DECODE(sc_form931,' +
                        ' ''A'', DECODE(' + StringReplace(FloatToStr(edResultadoMensualTrabajador.Value), ',', '.', []) + ',' +
                                    ' 0, NULL,' +
                                    ' utiles.iif_compara(''<'', ' + StringReplace(FloatToStr(ceCostoCapitas.Value), ',', '.', []) + ', ' + StringReplace(FloatToStr(edResultadoMensualTrabajador.Value), ',', '.', []) + ', ''OK'', ''OUT'')),' +
                        ' DECODE(sc_form931,' +
                               ' ''S'', DECODE(' + StringReplace(FloatToStr(edResultadoMensualTrabajador.Value), ',', '.', []) + ',' +
                                           ' 0, NULL,' +
                                           ' utiles.iif_compara(''<'', ' + StringReplace(FloatToStr(ceCostoCapitas.Value), ',', '.', []) + ', ' + StringReplace(FloatToStr(edResultadoMensualTrabajador.Value), ',', '.', []) + ', ''OK'', ''OUT'')),' +
                               ' DECODE(' + StringReplace(FloatToStr(edResultadoMensualTrabajador.Value), ',', '.', []) + ',' +
                                      ' 0, NULL,' +
                                      ' utiles.iif_compara(''<'', ' + StringReplace(FloatToStr(ceCostoCapitas.Value), ',', '.', []) + ', ' + StringReplace(FloatToStr(edResultadoMensualTrabajador.Value), ',', '.', []) + ', ''OK'', ''OUT''))))) resultado' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_id = :id';
  with GetQueryEx(sSql, [FIdSolicitud]) do
  try
    ceCostoActual.Value := edResultadoMensualTrabajador.Value;
    edResultado.Text    := FieldByName('resultado').AsString;
    ceDiferencia.Value  := FieldByName('difporc').AsFloat;
  finally
    Free;
  end;
end;

procedure TfrmConsultaSolicitud.ActualizarZonaGeografica(const aIdSolicitud: Integer; const aCommitear: Boolean = False);
var
  sSql: String;
begin
  sSql :=
    'UPDATE asc_solicitudcotizacion' +
      ' SET sc_idzonageografica = :idzonageografica' +
    ' WHERE sc_id = :id';
  if aCommitear then
    EjecutarSqlEx(sSql, [GetIdZonaGeograficaEstablecimiento(aIdSolicitud), aIdSolicitud])
  else
    EjecutarSqlSTEx(sSql, [GetIdZonaGeograficaEstablecimiento(aIdSolicitud), aIdSolicitud]);

  sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
  if aCommitear then
    EjecutarSqlEx(sSql, [aIdSolicitud])
  else
    EjecutarSqlSTEx(sSql, [aIdSolicitud]);
end;

procedure TfrmConsultaSolicitud.CalcularCPTMA;
begin
  if rbDatosEmpresa.Checked then
    edCPTMA.Value := ((edSC_COSTOFIJOCOMPETENCIAPARCIAL.Value * edfpSC_CANTTRABAJADOR.Value) + (edfpSC_MASASALARIAL.Value * edSC_PORCVARIABLECOMPETENCIAPARC.Value)) / 100
  else if rbForm931.Checked then
    edCPTMA.Value := edSC_COSTOFIJO931PARCIAL.Value + edSC_PORCVARIABLE931PARCIAL.Value
  else
    edCPTMA.Value := 0;
end;

procedure TfrmConsultaSolicitud.CalcularDatos931(Sender: TObject);
var
  rDivisor: Real;
begin
  if rbForm931.Checked then
  begin
    if (edfpSC_CANTTRABAJADOR.Value <> 0) then
    begin
      if edfpSC_MASASALARIAL.Value = 0 then
        edSC_PORCVARIABLECOMPETENCIAPARC.Value := 0;
    end
    else
    begin
      edSC_COSTOFIJOCOMPETENCIAPARCIAL.Value := 0;
      edSC_PORCVARIABLECOMPETENCIAPARC.Value := 0;
    end;
  end;

  rDivisor := 1;
  if edPeriodo.Periodo.Mes in [6, 12] then
    rDivisor := 1.5;

  edfpSC_MASASALARIAL.Value := (edfpSC_MASASALARIAL1.Value + edfpSC_MASASALARIAL2.Value + edfpSC_MASASALARIAL3.Value) / rDivisor;

  // El IF de abajo fue pedido por SSaire de manera teléfonica el 27.12.2011 para evitar los nabos que se olvidaban de presionar el botón Calcular..
  if (Sender <> nil) and (TComponent(Sender).Name = 'edPeriodo') and (edResultadoMensualTrabajador.Value > 0) then
    btnCalcularClick(nil);

{--- Agregado 29-Nov-2004 ---------------------------------------------------}
  ObtenerTarifaComercial;
{--- Fin Agregado 29-Nov-2004 -----------------------------------------------}
end;

procedure TfrmConsultaSolicitud.CalcularTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      if sdqConsulta.Active then
        CalcFields(sdqConsulta, CamposSuma, Values, TiposOperacion, Operadores, TotalConsulta, '');
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmConsultaSolicitud.CalcularTrabajadores(Sender: TObject);
begin
  edfpSC_CANTTRABAJADOR.Value := edfpSC_CANTTRABAJADOR1.Value + edfpSC_CANTTRABAJADOR2.Value + edfpSC_CANTTRABAJADOR3.Value;

//  EnableControls([gbMicroPyme], ((edfpSC_CANTTRABAJADOR.Value >= 1) and (edfpSC_CANTTRABAJADOR.Value <= 7)));
//  if not gbMicroPyme.Enabled then
//  begin
//    checkMicroPyme.Checked := False;
//    fraFormaJuridica.Clear;
//  end;

  CalcularDatos931(nil);
  RecalcularComision;
end;

procedure TfrmConsultaSolicitud.CambiaActividad(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT ac_descripcionok' +
     ' FROM cac_actividad' +
    ' WHERE ac_codigo = :codigo';

  if ValorSqlEx(sSql, [frafpSC_IDACTIVIDAD.edCodigo.Text]) = 'N' then
    edfpSC_ACTIVIDADREAL.Clear
  else
    edfpSC_ACTIVIDADREAL.Text := frafpSC_IDACTIVIDAD.cmbDescripcion.Text;
end;

procedure TfrmConsultaSolicitud.CambiaCanal(Sender: TObject);
begin
  if frafpSC_CANAL.IsSelected then
    frafpSC_ENTIDAD.Canal := frafpSC_CANAL.Value
  else
    frafpSC_ENTIDAD.Clear;

  if frafpSC_CANAL.Value = 321 then   // Si es venta directa..
  begin
    edSC_PORCCOMISION.DisplayFormat := '***';
    edSC_PORCCOMISION.Enabled := False;
  end
  else
  begin
    edSC_PORCCOMISION.DisplayFormat := '% ,0.00;-% ,0.00';
    edSC_PORCCOMISION.Enabled := True;
  end;
end;

procedure TfrmConsultaSolicitud.CambiaCanal2(Sender: TObject);
begin
  if fraCanal.IsSelected then
    fraEntidad.Canal := fraCanal.Value
  else
    fraEntidad.Clear;
end;

procedure TfrmConsultaSolicitud.CambiaCentroReg(Sender: TObject);
begin
  frafpSC_IDSUCURSAL.CentroReg := frafpIDCENTROREG.Value;
end;

procedure TfrmConsultaSolicitud.CambiaCiiuEstablecimiento(Sender: TObject);
begin
  checkCopiarCiiu.Checked := False;
end;

procedure TfrmConsultaSolicitud.CambiaEntidad(Sender: TObject);
var
  sSql: String;
begin
  frafpSC_IDSUCURSAL.Clear;
  frafpSC_IDSUCURSAL.ClearFilter;
  frafpSC_IDSUCURSAL.ExtraCondition := 'AND su_identidad = ' + SqlValue(frafpSC_ENTIDAD.Value);

  frafpIDCENTROREG.Clear;
  frafpIDCENTROREG.ClearFilter;

  frafpSC_VENDEDOR.Entidad := frafpSC_ENTIDAD.Value;

  // Las lineas de abajo son por el ticket 44825..
  if frafpSC_CANAL.Codigo = '2' then
  begin
    frafpSC_VENDEDOR.Codigo := '0';
    btnCalcularComisionClick(nil);
  end;

  sSql :=
    'SELECT 1' +
     ' FROM afi.ape_prestacionesespeciales' +
    ' WHERE pe_fechabaja IS NULL' +
      ' AND ((pe_identidad = :identidad) OR (pe_usuario = :usuario AND pe_tipousuario = ''S''))';
  gbPrestacionesEspeciales.Visible := (not chkSoloPCP.Checked) and (ExisteSqlEx(sSql, [frafpSC_ENTIDAD.Value, Sesion.UserID]));
  if not gbPrestacionesEspeciales.Visible then
    checkPrestacionesEspeciales.Checked := False;
end;

procedure TfrmConsultaSolicitud.CambiaEntidad2(Sender: TObject);
begin
  fraVendedor.Entidad := fraEntidad.Value;
end;

procedure TfrmConsultaSolicitud.CambiaEntidadBusqueda(Sender: TObject);
begin
  fraSC_IDSUCURSAL.Entidad := fraSC_IDENTIDAD.Value;

  if fraSC_IDENTIDAD.Value > 0 then
    fraEN_IDEJECUTIVO.Propiedades.ExtraCondition :=
      ' AND EXISTS(SELECT 1' +
                   ' FROM xen_entidad' +
                  ' WHERE ec_id = ' + SqlValue(fraSC_IDENTIDAD.Ejecutivo) + ') '
  else
    fraEN_IDEJECUTIVO.Propiedades.ExtraCondition := '';
  fraEN_IDEJECUTIVO.Clear;
end;

procedure TfrmConsultaSolicitud.CambiaSector(Sender: TObject);
begin
  RecalcularComision;
end;

procedure TfrmConsultaSolicitud.CambiaSucursal(Sender: TObject);
begin
  frafpIDCENTROREG.Value := frafpSC_IDSUCURSAL.CentroReg;
end;

procedure TfrmConsultaSolicitud.CambiaVendedor(Sender: TObject);
begin
  RecalcularComision;
end;

procedure TfrmConsultaSolicitud.CambioOrigen(Sender: TObject);
begin
  if (not edSC_IDEVENTO.IsEmpty) and (rgOrigenSolicitud.ItemIndex = 2) then
    rgOrigenSolicitud.ItemIndex := 1;
  if (edSC_IDEVENTO.IsEmpty) and (rgOrigenSolicitud.ItemIndex = 1) then
    rgOrigenSolicitud.ItemIndex := 0;
end;

procedure TfrmConsultaSolicitud.ChequeoSGC(Sender: TObject);
begin
  if rgOrigenSolicitud.ItemIndex = 2 then
    edSC_IDEVENTO.Clear;
end;

procedure TfrmConsultaSolicitud.chkSoloPCPClick(Sender: TObject);
begin
  gbCiius.Visible                     := not chkSoloPCP.Checked;
  labelActividadReal.Visible          := not chkSoloPCP.Checked;
  edfpSC_ACTIVIDADREAL.Visible        := not chkSoloPCP.Checked;
  gbStatusSrt.Visible                 := not chkSoloPCP.Checked;
  gbStatusBcra.Visible                := not chkSoloPCP.Checked;
  gbDatosTarifa.Visible               := not chkSoloPCP.Checked;
  gbObservaciones2.Visible            := not chkSoloPCP.Checked;
  gbCotizacion.Visible                := not chkSoloPCP.Checked;
  gbEdadPromedio.Visible              := not chkSoloPCP.Checked;
  gbSector.Visible                    := not chkSoloPCP.Checked;
  gbProbabilidadCierreNegocio.Visible := not chkSoloPCP.Checked;
  gbComision.Visible                  := not chkSoloPCP.Checked;
  gbZonaGeografica.Visible            := not chkSoloPCP.Checked;
  gbCantidadEstablecimientos.Visible  := not chkSoloPCP.Checked;
  gbPrestacionesEspeciales.Visible    := not chkSoloPCP.Checked;
  tbEstablecimientos2.Visible         := not chkSoloPCP.Checked;
  dbgridEstablecimientos.Visible      := not chkSoloPCP.Checked;
  gbRC.Visible                        := not chkSoloPCP.Checked;
end;

procedure TfrmConsultaSolicitud.ClearControls;
begin
  FEstadoSolicitud := '';
  FIdSolicitud := 0;
  FNroSolicitud := '';
  FStatusSrtOk := False;

  // *** cuidado que filtra por usuario ***
  frafpSC_CANAL.FiltraUsuario := True;

  edfpSC_NROSOLICITUD.Clear;
  cmbfpSC_FECHASOLICITUD.Clear;
  frafpSC_USUARIOSOLICITUD.Clear;
  edfpSC_CUIT.Clear;
  edfpSC_RAZONSOCIAL.Clear;
  edfpSC_MAIL.Clear;
  edfpSC_CONTACTO.Clear;
  edfpSC_TELEFONO.Clear;
  frafpSC_IDACTIVIDAD.Clear;
  frafpSC_IDACTIVIDAD2.Clear;
  frafpSC_IDACTIVIDAD3.Clear;
  edfpSC_ACTIVIDADREAL.Clear;
  frafpSC_IDSUCURSAL.Clear;
  frafpIDCENTROREG.Clear;
  edfpSC_MASASALARIAL.Clear;
  edfpSC_MASASALARIAL1.Clear;
  edfpSC_MASASALARIAL2.Clear;
  edfpSC_MASASALARIAL3.Clear;
  edfpSC_CANTTRABAJADOR.Clear;
  edfpSC_CANTTRABAJADOR1.Clear;
  edfpSC_CANTTRABAJADOR2.Clear;
  edfpSC_CANTTRABAJADOR3.Clear;

  FCalcularDatos931 := False;
  edPeriodo.Clear;
  FCalcularDatos931 := True;

  edfpSC_OBSERVACIONES.Clear;
  edfpSC_OBSERVACIONESCIERRE.Clear;
  edfpSC_IDGRUPOECONOMICO.Clear;

  gbSoloPCP.Hide;
  chkSoloPCP.Checked := False;
  chkSoloPCPClick(chkSoloPCP);
  gbPCP.Hide;

  frafpSC_CANAL.Clear;
  frafpSC_ENTIDAD.Clear;
  frafpSC_VENDEDOR.Clear;
  checkIncluyeIva.Checked := True;
  edSC_PORCCOMISION.Clear;
  edSC_EDADPROMEDIO.Value := 35;
  fraSector.Clear;
  edEstablecimientos.Clear;
  gbPrestacionesEspeciales.Hide;
  checkPrestacionesEspeciales.Checked := False;
//  checkMicroPyme.Checked := False;
//  fraFormaJuridica.Clear;
  fraProbabilidadCierreNegocio.Clear;
  fraStatusSRT.Clear;
  fraSC_IDARTANTERIOR.Clear;
  fraStatusBCRA.Clear;
  edTC_SUMAFIJA.Clear;
  edTC_PORCVARIABLE.Clear;
  edTC_COSTOFINAL.Clear;
  edDescuentoAplicado.Clear;
  rb2.Checked:=False;
  rb5.Checked:=False;
 // rb7.Checked:=False;
  rb10.Checked:=False;
  rbRCsi.Checked:=False;
  rbRCNo.Checked:=False;
  edAumentoAplicado.Clear;
  edfpObsATecnica.Clear;
  edCalcPolizaRc.Clear;
  edPoliza.Clear;

  edValoresSumaAsegurada.Clear;
  edValoresAlicuota.Clear;
  edValoresMasaSalarial.Clear;
  edValoresCuotaInicial.Clear;

  rbSinDatos.Checked := True;
  edSC_PAGOCOMPETENCIAPARCIAL.Clear;
  edSC_COSTOFIJOCOMPETENCIAPARCIAL.Clear;
  edSC_PORCVARIABLECOMPETENCIAPARC.Clear;
  edSC_COSTOFIJO931PARCIAL.Clear;
  edSC_PORCVARIABLE931PARCIAL.Clear;

  fraMotivoCancelacion2.Clear;
  checkResultadoOk.Checked := False;
  checkResultadoOut.Checked := False;
  fraHoldingBuscar.Clear;
  fraZonaGeografica.Clear;

  FillGridPCP;
end;

procedure TfrmConsultaSolicitud.Clonar(const aPedirConfirmacion: Boolean = True);
var
  iIdCotizacionActual: Integer;
  iIdSolicitudActual: Integer;
  iIdSolicitudNueva: Integer;
  sEstado: String;
  sNroSolicitud: String;
  sSql: String;
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir un registro.');

  sSql :=
    'SELECT 1' +
     ' FROM asc_solicitudcotizacion, aco_cotizacion' +
    ' WHERE sc_idcotizacion = co_id(+)' +
      ' AND NVL(co_fechaconfecciono, sc_fechaalta) < (SYSDATE - 365)' +
      ' AND sc_id = :id';
  Verificar(ExisteSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]), nil, 'Esta solicitud no puede ser clonada porque tiene mas de 365 días.');

  sSql :=
    'SELECT NVL(co_nrocotizacion, 0) co_nrocotizacion, co_orden, co_nrocotizacion || ''/'' || co_orden nrocotiorden,' +
          ' sc_nrosolicitud' +
     ' FROM asc_solicitudcotizacion, aco_cotizacion' +
    ' WHERE sc_idcotizacion = co_id(+)' +
      ' AND sc_cuit = :cuit' +
 ' ORDER BY sc_nrosolicitud DESC, co_nrocotizacion DESC, co_orden DESC';
  with GetQueryEx(sSql, [sdqConsulta.FieldByName('sc_cuit').AsString]) do
  try
    if (FieldByName('sc_nrosolicitud').AsInteger <> sdqConsulta.FieldByName('sc_nrosolicitud').AsInteger) or
       (FieldByName('co_nrocotizacion').AsInteger <> sdqConsulta.FieldByName('co_nrocotizacion').AsInteger) or
       (FieldByName('co_orden').AsString <> sdqConsulta.FieldByName('co_orden').AsString) then
    begin
      if FieldByName('co_nrocotizacion').AsInteger < 1 then
        Verificar(True, nil, 'Esta C.U.I.T. no puede clonarse porque la última solicitud no tiene cotización.')
      else
        Verificar(True, nil, Format('La única cotización que puede ser clonada para esta C.U.I.T. es la Nº %s.', [FieldByName('nrocotiorden').AsString]));
    end;
  finally
    Free;
  end;

  sSql :=
    'SELECT 1' +
     ' FROM aem_empresa, aco_contrato' +
    ' WHERE co_idempresa = em_id' +
      ' AND co_estado IN(''1'', ''15'')' +
      ' AND em_cuit = :cuit';
  Verificar(ExisteSqlEx(sSql, [sdqConsulta.FieldByName('sc_cuit').AsString]), nil, 'Esta C.U.I.T. tiene un contrato activo con Provincia A.R.T.');

  sSql :=
    'SELECT 1' +
     ' FROM art.apc_permiteclonacion' +
    ' WHERE pc_codigo = :codigo' +
      ' AND pc_fechabaja IS NULL';
  Verificar(not ExisteSqlEx(sSql, [sdqConsulta.FieldByName('co_estado').AsString]), nil, 'El estado de la cotización no permite que esta sea clonada.');

  ValidarReservaCuit(sdqConsulta.FieldByName('sc_cuit').AsString, True);

  if aPedirConfirmacion then
    if MsgBox('¿ Realmente desea clonar esta solicitud ?', MB_YESNO) = mrNo then
      Exit;

  // Clono la solicitud..
  BeginTrans;
  try
    iIdCotizacionActual := sdqConsulta.FieldByName('sc_idcotizacion').AsInteger;
    iIdSolicitudActual  := sdqConsulta.FieldByName('sc_id').AsInteger;
    iIdSolicitudNueva   := ValorSql('SELECT seq_asc_id.NEXTVAL FROM DUAL', '0');
    sEstado             := EC_CLONADA;
    sNroSolicitud       := ValorSql('SELECT seq_asc_nrosolicitud.NEXTVAL FROM DUAL', '0');

    sSql :=
      'INSERT INTO asc_solicitudcotizacion' +
                ' (sc_id, sc_nrosolicitud, sc_fechasolicitud, sc_usuariosolicitud, sc_cuit, sc_razonsocial, sc_idactividad, sc_masasalarial, sc_canttrabajador,' +
                 ' sc_observaciones, sc_contacto, sc_telefono, sc_costofinal, sc_porcvariable, sc_sumafija, sc_idgrupoeconomico, sc_fechaapertura, sc_canal,' +
                 ' sc_idartanterior, sc_usualta, sc_fechaalta, sc_form931, sc_idvendedor, sc_identidad, sc_costofinalform931, sc_porcvariableform931, sc_sumafijaform931,' +
                 ' sc_estado, sc_idsucursal, sc_actividadreal, sc_canttrabajador1, sc_canttrabajador2, sc_canttrabajador3, sc_idactividad2, sc_idactividad3,' +
                 ' sc_detalleoper, sc_detalleadmin, sc_detallecalle, sc_porccomision, sc_nuevaregimen, sc_usuasignado, sc_statussrt, sc_statusbcra, sc_totalmasa1,' +
                 ' sc_totalmasa2, sc_totalmasa3, sc_edadpromedio, sc_idzonageografica, sc_sumafijacompetencia, sc_porcvariablecompetencia, sc_costofijo931parcial,' +
                 ' sc_porcvariable931parcial, sc_costofijocompetenciaparcial, sc_porcvariablecompetenciaparc, sc_pagocompetenciaparcial, sc_costofinalpagomensual,' +
                 ' sc_sector, sc_establecimientos, sc_periodo, sc_idprobabilidadcierre, sc_porcdescuento, sc_porcaumento, sc_valor_rc, sc_finalsumafija, sc_finalporcmasa,' +
                 ' sc_finalportrabajador, sc_fechavigencia, sc_fechacierre, sc_prestaciones_especiales, sc_idsolicitudanterior)' +
          '(SELECT :idnuevo, :nrosolicitud, SYSDATE, :usuariosolicitud, sc_cuit, sc_razonsocial, sc_idactividad, sc_masasalarial, sc_canttrabajador,' +
                 ' :observaciones, sc_contacto, sc_telefono, sc_costofinal, sc_porcvariable, sc_sumafija, sc_idgrupoeconomico, sc_fechaapertura, sc_canal,' +
                 ' sc_idartanterior, :usualta, SYSDATE, sc_form931, sc_idvendedor, sc_identidad, sc_costofinalform931, sc_porcvariableform931, sc_sumafijaform931,' +
                 ' :estado, sc_idsucursal, sc_actividadreal, sc_canttrabajador1, sc_canttrabajador2, sc_canttrabajador3, sc_idactividad2, sc_idactividad3,' +
                 ' sc_detalleoper, sc_detalleadmin, sc_detallecalle, sc_porccomision, sc_nuevaregimen, sc_usuasignado, sc_statussrt, sc_statusbcra, sc_totalmasa1,' +
                 ' sc_totalmasa2, sc_totalmasa3, sc_edadpromedio, sc_idzonageografica, sc_sumafijacompetencia, sc_porcvariablecompetencia, sc_costofijo931parcial,' +
                 ' sc_porcvariable931parcial, sc_costofijocompetenciaparcial, sc_porcvariablecompetenciaparc, sc_pagocompetenciaparcial, sc_costofinalpagomensual,' +
                 ' sc_sector, sc_establecimientos, sc_periodo, sc_idprobabilidadcierre, sc_porcdescuento, sc_porcaumento, sc_valor_rc, sc_finalsumafija, sc_finalporcmasa,' +
                 ' sc_finalportrabajador, SYSDATE, sc_fechacierre, sc_prestaciones_especiales, :idsolicitudanterior' +
            ' FROM asc_solicitudcotizacion' +
           ' WHERE sc_id = :id)';
    EjecutarSqlSTEx(sSql, [iIdSolicitudNueva,
                           sNroSolicitud,
                           Sesion.UserID,
                           edSC_OBSERVACIONESCIERRE.Lines.Text,
                           Sesion.UserID,
                           sEstado,
                           iIdSolicitudActual,
                           iIdSolicitudActual]);

    sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
    EjecutarSqlSTEx(sSql, [iIdSolicitudNueva]);

    // Clono los establecimientos..
    sSql :=
      'INSERT INTO afi.aeu_establecimientos' +
                ' (eu_idsolicitud, eu_numero, eu_idzonageografica, eu_idlocalidad, eu_idtipoactividad,' +
                 ' eu_idactividad, eu_trabajadores, eu_fechaalta, eu_usualta, eu_usuarioweb, eu_tiposolicitud)' +
         ' (SELECT :idsolicitudnueva, eu_numero, eu_idzonageografica, eu_idlocalidad, eu_idtipoactividad,' +
                 ' eu_idactividad, eu_trabajadores, SYSDATE, :usualta, ''F'', eu_tiposolicitud' +
            ' FROM afi.aeu_establecimientos' +
           ' WHERE eu_idsolicitud = :idsolicitud' +
             ' AND eu_fechabaja IS NULL)';
    EjecutarSqlSTEx(sSql, [iIdSolicitudNueva, Sesion.UserID, iIdSolicitudActual]);

    if not sdqConsulta.FieldByName('sc_idformulario').IsNull then
    begin
      sSql :=
        'UPDATE asa_solicitudafiliacion' +
          ' SET sa_cotizacioncerrada = ''T'',' +
              ' sa_estado = :estado' +
        ' WHERE sa_idformulario = :idformulario';
      EjecutarSqlSTEx(sSql, [EC_CERRADA_SOLICITA_NUEVA, sdqConsulta.FieldByName('sc_idformulario').AsInteger]);
    end;

    // Actualizo la actividad de la solicitud nueva desde la actividad de la cotización vieja..
    sSql :=
      'UPDATE asc_solicitudcotizacion' +
        ' SET (sc_idactividad, sc_canttrabajador, sc_masasalarial) =' +
              ' (SELECT co_idactividad, co_canttrabajador, co_masasalarial' +
                 ' FROM aco_cotizacion' +
                ' WHERE sc_idcotizacion = co_id)' +
      ' WHERE sc_idcotizacion = :sc_idcotizacion';
    EjecutarSqlSTEx(sSql, [iIdCotizacionActual]);

    if (sdqConsulta.FieldByName('co_estado').AsString <> EC_CERRADA_COMERCIALIZADOR) or
       (sdqConsulta.FieldByName('co_estado').AsString <> EC_CERRADA_SIN_INFORMACION) or
       (sdqConsulta.FieldByName('co_estado').AsString <> EC_NO_SE_COTIZA) then    // Este if se pone el 7.6.2011 por ticket 29019..
    begin
      if ((sdqConsulta.FieldByName('sc_fechavigencia').AsDateTime + 30) >= DBDate) or   // Si está vigente..
          (sdqConsulta.FieldByName('co_estado').AsString = EC_CERRADA_COMERCIALIZADOR) then   // o es 18.0..
      begin
        sSql :=
          'UPDATE aco_cotizacion' +
            ' SET co_estadoanterior = co_estado,' +
                ' co_estado = :estado' +
          ' WHERE co_id = :id';
        EjecutarSqlSTEx(sSql, [EC_CERRADA_SOLICITA_NUEVA, iIdCotizacionActual]);

        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_estadoanterior = sc_estado,' +
                ' sc_estado = :estado' +
          ' WHERE sc_id = :id';
        EjecutarSqlSTEx(sSql, [EC_CERRADA_SOLICITA_NUEVA, iIdSolicitudActual]);

        sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
        EjecutarSqlSTEx(sSql, [iIdSolicitudActual]);
      end
      else
        // Le cambio el estado a la solicitud clonada, siempre y cuando el estado no sea CANCELADA..
        if (sdqConsulta.FieldByName('co_estado').AsString <> EC_CANCELADA) and (sdqConsulta.FieldByName('co_estado').AsString <> EC_NO_SE_COTIZA) then
        begin
          sSql :=
            'UPDATE aco_cotizacion' +
              ' SET co_estadoanterior = co_estado,' +
                  ' co_estado = :estado' +
            ' WHERE co_id = :id';
          EjecutarSqlSTEx(sSql, [EC_CERRADA_MAL, iIdCotizacionActual]);

          sSql :=
            'UPDATE asc_solicitudcotizacion' +
              ' SET sc_estadoanterior = sc_estado,' +
                  ' sc_estado = :estado' +
            ' WHERE sc_id = :id';
          EjecutarSqlSTEx(sSql, [EC_CERRADA_MAL, iIdSolicitudActual]);

          sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
          EjecutarSqlSTEx(sSql, [iIdSolicitudActual]);
        end;
    end;

    CommitTrans;

    tbLimpiarClick(nil);
    edSC_NROSOLICITUD.Text := sNroSolicitud;
    tbRefrescarClick(nil);

    FEsClonacion := True;
    try
      FEliminarSolicitud := True;
      FIdCotizacionAnterior := iIdCotizacionActual;
      FIdSolicitudAnterior := iIdSolicitudActual;

      tbModificarClick(nil);
    finally
      FEsClonacion := False;
    end;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
      RollBack;
    end;
  end;
end;

procedure TfrmConsultaSolicitud.DoCancelarSolicitud;
var
  sBody: String;
  sDirecciones: String;
  sSql: String;
begin
  with sdqConsulta do
    if (Active) and (not Eof) then
      if (MsgBox('¿ Está usted seguro de querer cancelar esta solicitud ?', MB_YESNO) = mrYes) then
      begin
        BeginTrans;
        try
          sSql :=
            'UPDATE asc_solicitudcotizacion' +
              ' SET sc_motivocancelacion = :motivocancelacion,' +
                  ' sc_fechabaja = SYSDATE,' +
                  ' sc_usubaja = :usubaja,' +
                  ' sc_estado = :estado,' +
                  ' sc_motcancelacion = :motcancelacion' +
            ' WHERE sc_id = :id';
          EjecutarSqlSTEx(sSql,
            [
              edSC_OBSERVACIONESCIERRE.Lines.Text,
              Sesion.UserID,
              EC_CANCELADA,
              fraMotivoCancelacion.Value,
              FieldByName('sc_id').AsInteger
            ]);

          sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
          EjecutarSqlSTEx(sSql, [FieldByName('sc_id').AsInteger]);

          if not FieldByName('sc_idcotizacion').IsNull then
            UpdateCO_ESTADO(FieldByName('sc_idcotizacion').AsInteger, EC_CANCELADA, False);

          if not FieldByName('sc_usuasignado').IsNull then
          begin
            sSql :=
              'SELECT NVL(se_mail, se_usuario)' +
               ' FROM use_usuarios' +
              ' WHERE se_usuario = :usuario';
            sDirecciones := ValorSqlEx(sSql, [FieldByName('sc_usuasignado').AsString]);
            sBody := Format('La solicitud de cotización Nº %d ha sido cancelada.' + #13#10 + 'Motivo: ' + fraMotivoCancelacion.cmbDescripcion.Text, [FieldByName('SC_NROSOLICITUD').AsInteger]);
            EnviarMail(sDirecciones, 'Solicitud de Cotización Cancelada: ' + FieldByName('sc_razonsocial').AsString, Sesion.UserID, [], sBody, [''], 0, True, 'ASC', FieldByName('sc_id').AsInteger, Sesion.UserMail);
          end;


          CommitTrans;
          tbRefrescarClick(nil);
        except
          on E: Exception do
          begin
            MessageDlg(E.Message, mtWarning, [mbOK], 0);
            RollBack;
          end;
        end;
      end;
end;

procedure TfrmConsultaSolicitud.DoCerrarSolicitud(AEstado : String);
var
  sSql: String;
begin
  if (MsgBox('¿ Está usted seguro de querer cerrar la solicitud de cotización ?', MB_YESNO) = mrYes) then
  begin
    BeginTrans;
    try
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_observacionescierrecom = :observacionescierrecom,' +
              ' sc_usumodif = :usumodif,' +
              ' sc_estado = :estado,' +
              ' sc_fechacierre = SYSDATE' +
        ' WHERE sc_id = :id';
      EjecutarSqlSTEx(sSql, [edSC_OBSERVACIONESCIERRE.Lines.Text, Sesion.UserID, AEstado, sdqConsulta.FieldByName('sc_id').AsInteger]);

      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);

      if not sdqConsulta.FieldByName('sc_idcotizacion').IsNull then
        UpdateCO_ESTADO(sdqConsulta.FieldByName('sc_idcotizacion').AsInteger, AEstado, False);

      CommitTrans;
      MessageDlg('La cotización ha sido cerrada.', mtInformation, [mbOK], 0);
      fpCierre.ModalResult := mrOk;
    except
      on E:Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOK], 0);
        RollBack;
      end;
    end;
    tbRefrescarClick(nil);
  end;
end;

procedure TfrmConsultaSolicitud.DoGuardarExcepcion;
var
  sSql: String;
  sqlSolCotizacion: TSql;
begin
  if IsJefe then
  begin
    sqlSolCotizacion := TSql.Create('asc_solicitudcotizacion');
    try
      sqlSolCotizacion.SqlType := stUpdate;
      sqlSolCotizacion.PrimaryKey.Add('sc_id', sdqConsulta.FieldByName('sc_id').AsInteger, False);

      sqlSolCotizacion.Fields.Add('sc_codmotivoexcepcion',   fraMotivoExcepcionRecotizacion.Value);
      sqlSolCotizacion.Fields.Add('sc_edadpromedio',         edEdadPromedio.Value);
      sqlSolCotizacion.Fields.Add('sc_establecimientos',     edCantidadEstablecimientos.Value);
      sqlSolCotizacion.Fields.Add('sc_fechaexcepcion',       SQL_ACTUALDATE, False);
      sqlSolCotizacion.Fields.Add('sc_idprobabilidadcierre', fraProbabilidadCierre.Value);
      sqlSolCotizacion.Fields.Add('sc_motivoexcepcion',      memoObservaciones.Text);
//      sqlSolCotizacion.Fields.Add('sc_porcaumento',          exNull);
//      sqlSolCotizacion.Fields.Add('sc_porcdescuento',        exNull);
      sqlSolCotizacion.Fields.Add('sc_sector',               fraSector2.Value);
      sqlSolCotizacion.Fields.Add('sc_usuarioexcepcion',     Sesion.UserId);

      // Se comentan las 2 líneas de abajo según ticket 23749..
  //    if not sdqConsulta.FieldByName('sc_idusuarioweb').IsNull then
  //      sqlSolCotizacion.Fields.Add('sc_usuariosolicitud', Sesion.UserID);

      if sdqConsulta.FieldByName('sc_idcotizacion').IsNull then    // Si no tiene cotización..
        sqlSolCotizacion.Fields.Add('sc_estado', EC_PEND_COTIZ)
      else
        sqlSolCotizacion.Fields.Add('sc_estado', EC_EN_PREPARACION);

      EjecutarSql(sqlSolCotizacion.Sql);

      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);
    finally
      sqlSolCotizacion.Free;
    end;

    ActualizarZonaGeografica(sdqConsulta.FieldByName('sc_id').AsInteger, True);

    if not sdqConsulta.FieldByName('sc_idcotizacion').IsNull then    // Si tiene cotización..
    begin
      sSql :=
        'UPDATE aco_cotizacion' +
          ' SET co_establecimientos = :establecimientos,' +
              ' co_estado = :estado' +
        ' WHERE co_id = :id';
      EjecutarSqlEx(sSql, [edCantidadEstablecimientos.Value, EC_EN_PREPARACION, sdqConsulta.FieldByName('sc_idcotizacion').AsInteger]);

      sSql :=
        'UPDATE acz_cotizador' +
          ' SET cz_edadpromedio = :edadpromedio,' +
              ' cz_establecimientos = :establecimientos,' +
              ' cz_idlocalidad = :idlocalidad,' +
              ' cz_idprobabilidadcierre = :idprobabilidadcierre,' +
              ' cz_idzonageografica = :idzonageografica,' +
              ' cz_sector = :sector' +
        ' WHERE cz_idcotizacion = :idcotizacion';
      EjecutarSqlEx(sSql, [edEdadPromedio.Value, edCantidadEstablecimientos.Value,
                           GetIdLocalidadEstablecimiento(sdqConsulta.FieldByName('sc_id').AsInteger),
                           fraProbabilidadCierre.Value,
                           GetIdZonaGeograficaEstablecimiento(sdqConsulta.FieldByName('sc_id').AsInteger),
                           fraSector2.Value, sdqConsulta.FieldByName('sc_idcotizacion').AsInteger]);

      // Actualizo los valores del cotizador que varian si se cargan o eliminan detalles ilp..
      if sdqConsulta.FieldByName('sc_idcotizacion').AsInteger > 0 then
      begin
        sSql := 'ART.AFI.update_valores_fijos_cotizador(:idcotizacion);';
        EjecutarStoreEx(sSql, [sdqConsulta.FieldByName('sc_idcotizacion').AsInteger]);
      end;
    end;
  end
  else
  begin
    sSql :=
      'BEGIN' +
       ' intraweb.do_solicpermisorecotijefe(:nedadpromedio, :nestablecimientos, :nidprobabilidadcierre, :nidsolicitud, :scodmotivorecotizacion, :sobservaciones, :ssector, :susuario, :destinatario);' +
     ' END;';
    EjecutarSqlEx(sSql, [edEdadPromedio.Value, edCantidadEstablecimientos.Value, fraProbabilidadCierre.Value, sdqConsulta.FieldByName('sc_id').AsInteger,
                         fraMotivoExcepcionRecotizacion.Value, memoObservaciones.Lines.Text, fraSector2.Value, Sesion.UserID, fraDestinoEmail.Codigo]);

    MsgBox('Su pedido fue enviado a un superior para que lo autorice, la respuesta la recibirá vía e-mail.');
  end;

  tbRefrescarClick(nil);
end;

procedure TfrmConsultaSolicitud.DoPedirExcepcion;
var
  sDirecciones: String;
  sSql: String;
begin
  with sdqConsulta do
    if (Active) and (not Eof) then
      if (MsgBox('¿ Realmente desea pedir una excepción ?', MB_YESNO) = mrYes) then
      begin
        BeginTrans;
        try
          if IsJefe then
          begin
            sSql :=
              'UPDATE asc_solicitudcotizacion' +
                ' SET sc_codmotivoexcepcion = :codmotexcepcion,' +
                    ' sc_edadpromedio = :edadpromedio,' +
                    ' sc_establecimientos = :establecimientos,' +
                    ' sc_estado = :estado,' +
                    ' sc_fechaexcepcion = SYSDATE,' +
                    ' sc_idprobabilidadcierre = :idprobabilidadcierre,' +
                    ' sc_motivoexcepcion = :motivoexcepcion,' +
                    ' sc_sector = :sector,' +
                    ' sc_usuarioexcepcion = :usuarioexcepcion' +
              ' WHERE sc_id = :sc_id';
            EjecutarSqlSTEx(sSql,
              [
                fraMotivoExcepcionRecotizacion.Value,
                edEdadPromedio.Value,
                edCantidadEstablecimientos.Value,
                IIF((FieldByName('sc_idcotizacion').AsInteger > 0), EC_EN_PREPARACION, EC_PEND_COTIZ),
                fraProbabilidadCierre.Value,
                memoObservaciones.Text,
                fraSector2.Value,
                Sesion.UserID,
                FieldByName('sc_id').AsString
              ]);

            sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
            EjecutarSqlSTEx(sSql, [FieldByName('sc_id').AsString]);

            ActualizarZonaGeografica(FieldByName('sc_id').AsInteger);

            sSql :=
              'UPDATE aco_cotizacion' +
                ' SET co_establecimientos = :establecimientos,' +
                    ' co_estado = :estado' +
              ' WHERE co_id = :id';
            EjecutarSqlSTEx(sSql, [edCantidadEstablecimientos.Value,
                                   IIF((FieldByName('sc_idcotizacion').AsInteger > 0), EC_EN_PREPARACION, EC_PEND_COTIZ),
                                   FieldByName('sc_idcotizacion').AsInteger]);

            sSql :=
              'UPDATE acz_cotizador' +
                ' SET cz_edadpromedio = :edadpromedio,' +
                    ' cz_establecimientos = :establecimientos,' +
                    ' cz_idlocalidad = :idlocalidad,' +
                    ' cz_idprobabilidadcierre = :idprobabilidadcierre,' +
                    ' cz_idzonageografica = :idzonageografica,' +
                    ' cz_sector = :sector' +
              ' WHERE cz_idcotizacion = :idcotizacion';
            EjecutarSqlSTEx(sSql, [edEdadPromedio.Value, edCantidadEstablecimientos.Value,
                                   GetIdLocalidadEstablecimiento(FieldByName('sc_id').AsInteger),
                                   fraProbabilidadCierre.Value,
                                   GetIdZonaGeograficaEstablecimiento(FieldByName('sc_id').AsInteger), fraSector2.Value,
                                   FieldByName('sc_idcotizacion').AsInteger]);

            // Actualizo los valores del cotizador que varian si se cargan o eliminan detalles ilp..
            if FieldByName('sc_idcotizacion').AsInteger > 0 then
            begin
              sSql := 'ART.AFI.update_valores_fijos_cotizador(:idcotizacion);';
              EjecutarStoreSTEx(sSql, [FieldByName('sc_idcotizacion').AsInteger]);
            end;

            if not FieldByName('sc_idcotizacion').IsNull then
              UpdateCO_ESTADO(FieldByName('sc_idcotizacion').AsInteger, EC_EN_PREPARACION, False);

            CommitTrans;

            if (FieldByName('sc_idcotizacion').AsInteger > 0) then
            begin
              sSql :=
                'SELECT NVL(se_mail, se_usuario)' +
                 ' FROM use_usuarios' +
                ' WHERE se_usuario = :usuario';
              sDirecciones := ValorSqlEx(sSql, [FieldByName('co_usuarioconfecciono').AsString]);

              NotificacionPorMail('',
                                  edSC_OBSERVACIONESCIERRE.Lines.Text,
                                  Format('[Pedido de Recotización] - Cotización Nº %s', [FieldByName('nrocotiorden').AsString]),
                                  'ASC',
                                  FieldByName('sc_id').AsInteger,
                                  sDirecciones);
              ShowMessage(Format('Se ha enviado un e-mail a %s solicitando un pedido de recotización sobre la cotización Nº %s.', [FieldByName('co_usuarioconfecciono').AsString, FieldByName('nrocotiorden').AsString]));
            end;
          end
          else
          begin
            sSql :=
              'BEGIN' +
               ' intraweb.do_solicpermisorecotijefe(:nedadpromedio, :nestablecimientos, :nidprobabilidadcierre, :nidsolicitud, :scodmotivorecotizacion, :sobservaciones, :ssector, :susuario, :destinatario);' +
             ' END;';
            EjecutarSqlEx(sSql, [edEdadPromedio.Value, edCantidadEstablecimientos.Value, fraProbabilidadCierre.Value, sdqConsulta.FieldByName('sc_id').AsInteger,
                                 fraMotivoExcepcionRecotizacion.Value, memoObservaciones.Lines.Text, fraSector2.Value, Sesion.UserID, fraDestinoEmail.Codigo]);
            MsgBox('Su pedido fue enviado a un superior para que lo autorice, la respuesta la recibirá vía e-mail.');
          end;

          tbRefrescarClick(nil);
        except
          on E: Exception do
          begin
            MessageDlg(E.Message, mtWarning, [mbOK], 0);
            RollBack;
          end;
        end;
      end;
end;

function TfrmConsultaSolicitud.EnviarPorMail(const aIDSolicitudCotizacion, aRazonSocial, aCuit: String; const aOrigen: String = 'C'; const aCommitTrans: Boolean = True): Boolean;
  function DescomponerEmails(const aEmails: String): String;
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
  end;

// aOrigen: C=Comercial, T=Técnica..
var
  aOpcionesEnvioMail: TOpcionesEnvioMail;
  aQuery: TSDQuery;
  sBody: String;
  sBodyList: TStringList;
  sDirecciones: String;
  sDireccionOrigen: String;
  sFileName: String;
  sNombreArchivoCotizacion: String;
  sSql: String;
begin
  Result := True;

  try
    sSql := 'SELECT art.cotizacion.get_mailnotificacliente(''C'', :idsolicitud) FROM DUAL';
    sDirecciones := ValorSqlEx(sSql, [aIDSolicitudCotizacion]);

    aOpcionesEnvioMail := [];
    if (aOrigen = 'C') or (sDirecciones = '') then
      aOpcionesEnvioMail := [oAlwaysShowDialog];

    sSql :=
      'SELECT DECODE(sc_fechavigencia,' +
                   ' NULL, NULL,' +
                   ' DECODE(sc_form931,' +
                          ' ''A'', DECODE(sc_costofinalpagomensual,' +
                                      ' 0, NULL,' +
                                      ' utiles.iif_compara(''<'', sc_finalportrabajador, sc_costofinalpagomensual, ''OK'', ''OUT'')),' +
                          ' DECODE(sc_form931,' +
                                 ' ''S'', DECODE(sc_costofinalform931,' +
                                             ' 0, NULL,' +
                                             ' utiles.iif_compara(''<'', sc_finalportrabajador, sc_costofinalform931, ''OK'', ''OUT'')),' +
                                 ' DECODE(sc_costofinal,' +
                                        ' 0, NULL,' +
                                        ' utiles.iif_compara(''<'', sc_finalportrabajador, sc_costofinal, ''OK'', ''OUT''))))) resultado,' +
            ' TO_NUMBER(DECODE(sc_fechavigencia,' +
                             ' NULL, NULL,' +
                             ' DECODE(sc_form931,' +
                                    ' ''A'', DECODE(sc_costofinalpagomensual, 0, NULL, sc_finalportrabajador - sc_costofinalpagomensual),' +
                                    ' DECODE(sc_form931,' +
                                           ' ''S'', DECODE(sc_costofinalform931, 0, NULL, sc_finalportrabajador - sc_costofinalform931),' +
                                           ' DECODE(sc_costofinal, 0, NULL, sc_finalportrabajador - sc_costofinal))))) difplata,' +
            ' TO_NUMBER(DECODE(sc_fechavigencia,' +
                             ' NULL, NULL,' +
                             ' DECODE(sc_form931,' +
                                    ' ''A'', DECODE(sc_costofinalpagomensual,' +
                                                ' 0, NULL,' +
                                                ' ((sc_finalportrabajador / sc_costofinalpagomensual) - 1) * 100),' +
                                    ' DECODE(sc_form931,' +
                                           ' ''S'', DECODE(sc_costofinalform931,' +
                                                       ' 0, NULL,' +
                                                       ' ((sc_finalportrabajador / sc_costofinalform931) - 1) * 100),' +
                                           ' DECODE(sc_costofinal, 0, NULL,((sc_finalportrabajador / sc_costofinal) - 1) * 100)))))' +
                                                                                                                             ' difporc,' +
            ' sc_canal, sc_identidad, sc_idusuarioweb, sc_nrosolicitud, sc_razonsocial, sc_usuariosolicitud' +
       ' FROM asc_solicitudcotizacion' +
      ' WHERE sc_id = :id';

    with GetQueryEx(sSql, [aIDSolicitudCotizacion]) do
    try
      sSql :=
        'SELECT NVL(se_mail, se_usuario) email' +
         ' FROM use_usuarios' +
        ' WHERE se_usuario = :usuario' +
    ' UNION ALL' +
       ' SELECT uw_mailavisoart' +
         ' FROM auw_usuarioweb' +
        ' WHERE uw_usuario = :usuario2';
      sDireccionOrigen := DescomponerEmails(ValorSqlEx(sSql, [FieldByName('sc_usuariosolicitud').AsString, Copy(FieldByName('sc_usuariosolicitud').AsString, 3, 1000)]));

      if EnviarEmailHtml(FieldByName('sc_canal').AsInteger, FieldByName('sc_identidad').AsInteger, sFileName) then
      begin
        sNombreArchivoCotizacion := IncludeTrailingBackslash(TempPath) + 'SolicitudCotizacion_' + ACuit + '.pdf';
        SetCurrentDir(TempPath);
        if not PrintLetter(StrToIntDef(aIDSolicitudCotizacion, 0), sNombreArchivoCotizacion, '') then
          raise Exception.Create('Error al imprimir la carta.');

        sBodyList := TStringList.Create;
        with sBodyList do
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
          aQuery := GetQueryEx(sSql, [sDireccionOrigen]);
          try
            Text := StringReplace(Text, '{#CUIT#}', aCuit, [rfReplaceAll]);
            Text := StringReplace(Text, '{#EJECUTIVO#}', Nvl(aQuery.FieldByName('se_nombre').AsString, 'Provincia ART'), [rfReplaceAll]);
            Text := StringReplace(Text, '{#EMAIL_EJECUTIVO#}', Nvl(sDireccionOrigen, 'atencionalcliente@provart.com.ar'), [rfReplaceAll]);
            Text := StringReplace(Text, '{#RAZON_SOCIAL#}', aRazonSocial, [rfReplaceAll]);
            Text := StringReplace(Text, '{#TELEFONO_EJECUTIVO#}', Nvl(aQuery.FieldByName('telefono').AsString, '0800-333-1278'), [rfReplaceAll]);
          finally
            FreeAndNil(aQuery);
          end;

          aOpcionesEnvioMail := aOpcionesEnvioMail + [oSinNotaAlPie, oDeleteAttach, oDisableBody, oDisableAdjuntos];

          Result := unEnvioMail.EnviarMailBD(sDirecciones, Format('Cotización - %s %s', [aRazonSocial, PonerGuiones(aCuit)]), aOpcionesEnvioMail,
                                             [sNombreArchivoCotizacion], Text, 0, tcDefault, aCommitTrans, False, 2500, -1, [], '', True, sDireccionOrigen, 'ASC',
                                             StrToIntDef(aIDSolicitudCotizacion, -1));
        finally
          Free;
        end;
      end
      else
      begin
        if FieldByName('sc_idusuarioweb').IsNull then   // Si la cotización se cargó desde la art..
        begin
          sNombreArchivoCotizacion := IncludeTrailingBackslash(TempPath) + 'SolicitudCotizacion_' + ACuit + '.pdf';
          SetCurrentDir(TempPath);
          if not PrintLetter(StrToIntDef(aIDSolicitudCotizacion, 0), sNombreArchivoCotizacion, '') then
            raise Exception.Create('Error al imprimir la carta.');

          if FieldByName('resultado').AsString <> '' then
            sBody :=
              'Resultado: ' + FieldByName('resultado').AsString + CRLF +
              'Diferencia en $: ' + FormatFloat('#,##0.00', FieldByName('difplata').AsFloat) + CRLF +
              'Diferencia en %: ' + FormatFloat('#,##0.00', FieldByName('difporc').AsFloat) + CRLF + CRLF;

          if (aOrigen = 'C') or (sDirecciones = '') then
            EnviarMail(sDirecciones, 'Solicitud Cotización: ' + ARazonSocial, Sesion.UserID, [TOpcionARTMail(oAlwaysShowDialog), TOpcionARTMail(oDeleteAttach)],
                       sBody + 'Provincia ART', [sNombreArchivoCotizacion], 0, aCommitTrans, 'ASC', StrToIntDef(aIDSolicitudCotizacion, -1), sDireccionOrigen)
          else
            EnviarMail(sDirecciones, 'Solicitud Cotización: ' + ARazonSocial, Sesion.UserID, [TOpcionARTMail(oDeleteAttach)], sBody + 'Provincia ART',
                       [sNombreArchivoCotizacion], 0, aCommitTrans, 'ASC', StrToIntDef(aIDSolicitudCotizacion, -1), sDireccionOrigen);
        end
        else    // Si la cotización se cargó desde la web..
        begin
          sBody := Format('Su solicitud de cotización Nº %d %s (%s) %s ya se efectuó y se encuentra disponible para su información al cliente. %s Atte.',
                          [FieldByName('sc_nrosolicitud').AsInteger, #13#10#13#10, FieldByName('sc_razonsocial').AsString, #13#10#13#10, #13#10#13#10#13#10]);

          aOpcionesEnvioMail := aOpcionesEnvioMail + [oAutoFirma, oDeleteAttach, oSinNotaAlPie];

          unMoldeEnvioMail.EnviarMailBD(sDirecciones, 'Solicitud Cotización: ' + aRazonSocial, aOpcionesEnvioMail, sBody, nil, 0, tcDefault, aCommitTrans, False, 2500,
                                        -1, [tdContactoContrato], '', False, sDireccionOrigen, 'ASC', StrToIntDef(aIDSolicitudCotizacion, -1));
        end;
      end;
    finally
      Free;
    end;
  except
    Result := False;
  end;
end;

procedure TfrmConsultaSolicitud.EstadoTarifa(Sender: TObject);
begin
  edSC_PAGOCOMPETENCIAPARCIAL.Value      := 0;
  edSC_COSTOFIJOCOMPETENCIAPARCIAL.Value := 0;
  edSC_PORCVARIABLECOMPETENCIAPARC.Value := 0;
  edSC_COSTOFIJO931PARCIAL.Value         := 0;
  edSC_PORCVARIABLE931PARCIAL.Value      := 0;
  edResultadoMensualTrabajador.Value     := 0;
  edSumaFija.Value                       := 0;
  edPorcVariable.Value                   := 0;

  VCLExtra.LockControls([edResultadoMensualTrabajador, edSumaFija, edPorcVariable, edCPTMA], True);
  VCLExtra.EnableControls([edSC_PAGOCOMPETENCIAPARCIAL], rbPagoTotalMensual.Checked);
  VCLExtra.EnableControls([edSC_COSTOFIJOCOMPETENCIAPARCIAL, edSC_PORCVARIABLECOMPETENCIAPARC], rbDatosEmpresa.Checked);
  VCLExtra.EnableControls([edSC_COSTOFIJO931PARCIAL, edSC_PORCVARIABLE931PARCIAL], rbForm931.Checked);

  CalcularDatos931(nil);
  CalcularCPTMA;
end;

procedure TfrmConsultaSolicitud.FormateaTexto(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  try
    if AreIn(LowerCase(Sender.FieldName), ['costofinal', 'difplata', 'masasalarialtecnica', 'sc_masasalarial', 'tc_sumafija', 'tc_costofinal', 'sumafijacomp',
                                           'co_sumafijapiso', 'co_costofinalpiso', 'sc_sumafijatarifario']) then
      Text := Get_AjusteDecimales(Sender.AsString, '$ ', 2, True)
    else if AreIn(LowerCase(Sender.FieldName), ['tc_porcvariable', 'porcvarcomp', 'co_porcvariablepiso']) then
      Text := Get_AjusteDecimales(Sender.AsString, '% ', 4, True)
    else if AreIn(LowerCase(Sender.FieldName), ['difporc', 'sc_porcaumento', 'sc_porcdescuento', 'co_comision', 'porc_aumento', 'tope_aumento', 'porc_descuento',
                                                'tope_descuento', 'co_comisionpiso', 'sc_porcvariabletarifario', 'co_acpo']) then
      Text := Get_AjusteDecimales(Sender.AsString, '% ', 2, True)
    else
      Text := Sender.AsString;
  except
    Text := Sender.AsString;
  end;
end;

procedure TfrmConsultaSolicitud.GuardarEstablecimientos(const aIdSolicitud: Integer);
var
  sSql: String;
begin
  sSql :=
    'UPDATE afi.aeu_establecimientos' +
      ' SET eu_idsolicitud = :idsolicitud' +
    ' WHERE eu_idsolicitud = -1' +
      ' AND eu_usualta = :usualta' +
      ' AND eu_usuarioweb = ''F''';
  EjecutarSqlSTEx(sSql, [aIdSolicitud, Sesion.UserID]);
end;

procedure TfrmConsultaSolicitud.GuardarHtmlBcra(const aIdSolicitud: Integer; const aHtml: String);
var
  aBlob: TStringList;
  sSql: String;
  sUpdateSql: String;
begin
  sSql :=
    'SELECT sc_htmlbcra' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_id = ' + SqlValue(aIdSolicitud);

  sUpdateSql :=
    'UPDATE asc_solicitudcotizacion' +
      ' SET sc_htmlbcra = :sc_htmlbcra' +
    ' WHERE sc_id = ' + SqlValue(aIdSolicitud);

  aBlob := TStringList.Create;
  try
    aBlob.Text := aHtml;
    SaveBlob(sSql, sUpdateSql, 'sc_htmlbcra', aBlob);
  finally
    aBlob.Free;
  end;

  sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
  EjecutarSqlSTEx(sSql, [aIdSolicitud]);
end;

procedure TfrmConsultaSolicitud.LoadControls;
var
  sSql: String;
begin
  with sdqConsulta do
  begin
    sIDEvento 			 := FieldByName('sc_idevento').AsString;
    FIdSolicitud 		 := FieldByName('sc_id').AsInteger;
    FNroSolicitud 	 := FieldByName('sc_nrosolicitud').AsString;
    FEstadoSolicitud := FieldByName('co_estado').AsString;

    edfpSC_CUIT.Text                := FieldByName('sc_cuit').AsString;
    edfpSC_NROSOLICITUD.Value       := FieldByName('sc_nrosolicitud').AsInteger;
    cmbfpSC_FECHASOLICITUD.Date     := FieldByName('sc_fechasolicitud').AsDateTime;
    frafpSC_USUARIOSOLICITUD.Value  := FieldByName('sc_usuariosolicitud').AsString;
    edfpSC_RAZONSOCIAL.Text         := FieldByName('sc_razonsocial').AsString;
    edfpSC_MAIL.Text                := FieldByName('sc_mail').AsString;
    edfpSC_CONTACTO.Text            := FieldByName('sc_contacto').AsString;
    edfpSC_TELEFONO.Text            := FieldByName('sc_telefono').AsString;
    frafpSC_CANAL.Value             := FieldByName('sc_canal').AsInteger;

    if FieldByName('sc_identidad').AsString <> '' then
    begin
      frafpSC_ENTIDAD.Value := FieldByName('sc_identidad').AsInteger;
      CambiaEntidad(nil);
    end;
    if FieldByName('sc_idvendedor').AsString <> '' then
      frafpSC_VENDEDOR.Value := FieldByName('sc_idvendedor').AsInteger;

    edfpSC_IDGRUPOECONOMICO.Value := FieldByName('sc_idgrupoeconomico').AsInteger;

    chkSoloPCP.Checked := (FieldByName('sc_cotizacion_pcp').AsString = 'S');
    chkSoloPCPClick(chkSoloPCP);
    FillGridPCP;
    gbSoloPCP.Show;
    gbPCP.Show;

    //DATOS DE TARIFA - ART ACTUAL
    if (FieldByName('sc_form931').AsString = '') then
      rbSinDatos.Checked := True
    else if (FieldByName('sc_form931').AsString = 'A') then
      rbPagoTotalMensual.Checked := True
    else if (FieldByName('sc_form931').AsString = 'S') then
      rbForm931.Checked := True
    else if (FieldByName('sc_form931').AsString = 'N') then
      rbDatosEmpresa.Checked := True;

    if FieldByName('sc_idartanterior').AsString <> '' then
      fraSC_IDARTANTERIOR.Value := FieldByName('sc_idartanterior').AsInteger;

    if FieldByName('sc_pagocompetenciaparcial').AsString <> '' then
      edSC_PAGOCOMPETENCIAPARCIAL.Value := FieldByName('sc_pagocompetenciaparcial').AsFloat;

    if FieldByName('sc_costofijocompetenciaparcial').AsString <> '' then
      edSC_COSTOFIJOCOMPETENCIAPARCIAL.Value := FieldByName('sc_costofijocompetenciaparcial').AsFloat;

    if FieldByName('sc_porcvariablecompetenciaparc').AsString <> '' then
      edSC_PORCVARIABLECOMPETENCIAPARC.Value := FieldByName('sc_porcvariablecompetenciaparc').AsFloat;

    if FieldByName('sc_costofijo931parcial').AsString <> '' then
      edSC_COSTOFIJO931PARCIAL.Value := FieldByName('sc_costofijo931parcial').AsFloat;

    if FieldByName('sc_porcvariable931parcial').AsString <> '' then
      edSC_PORCVARIABLE931PARCIAL.Value := FieldByName('sc_porcvariable931parcial').AsFloat;


    if rbPagoTotalMensual.Checked then   //SC_FORM931 = A
    begin
      edResultadoMensualTrabajador.Value := FieldByName('sc_costofinalpagomensual').AsFloat;
      edSumaFija.Value                   := FieldByName('sc_sumafijacompetencia').AsFloat;
      edPorcVariable.Value               := FieldByName('sc_porcvariablecompetencia').AsFloat;
    end;
    if rbDatosEmpresa.Checked then   //SC_FORM931 = N
    begin
      edResultadoMensualTrabajador.Value := FieldByName('sc_costofinal').AsFloat;
      edSumaFija.Value                   := FieldByName('sc_sumafija').AsFloat;
      edPorcVariable.Value               := FieldByName('sc_porcvariable').AsFloat;
    end;
    if rbForm931.Checked then   //SC_FORM931 = S
    begin
      edResultadoMensualTrabajador.Value := FieldByName('sc_costofinalform931').AsFloat;
      edSumaFija.Value                   := FieldByName('sc_sumafijaform931').AsFloat;
      edPorcVariable.Value               := FieldByName('sc_porcvariableform931').AsFloat;
    end;
    CalcularCPTMA;

    if FieldByName('sc_idactividad').AsString <> '' then
      frafpSC_IDACTIVIDAD.Value := FieldByName('sc_idactividad').AsInteger;

    if FieldByName('sc_idactividad2').AsString <> '' then
      frafpSC_IDACTIVIDAD2.Value := FieldByName('sc_idactividad2').AsInteger;

    if FieldByName('sc_idactividad3').AsString <> '' then
      frafpSC_IDACTIVIDAD3.Value := FieldByName('sc_idactividad3').AsInteger;

    edfpSC_ACTIVIDADREAL.Text    := FieldByName('sc_actividadreal').AsString;

    if FieldByName('sc_idsucursal').AsString <> '' then
    begin
      frafpSC_IDSUCURSAL.Value := FieldByName('sc_idsucursal').AsInteger;

      sSql :=
        'SELECT su_idcentroreg' +
         ' FROM asu_sucursal' +
        ' WHERE su_id = :id';
      frafpIDCENTROREG.Value   := ValorSqlIntegerEx(sSql, [FieldByName('sc_idsucursal').AsString]);
    end;

    if FieldByName('sc_masasalarial').AsString <> '' then
    begin
      edfpSC_MASASALARIAL.Value   := FieldByName('sc_masasalarial').AsFloat;
      edValoresMasaSalarial.Value := FieldByName('sc_masasalarial').AsFloat;
    end;

    if FieldByName('sc_totalmasa1').AsString <> '' then
      edfpSC_MASASALARIAL1.Value := FieldByName('sc_totalmasa1').AsFloat;

    if FieldByName('sc_totalmasa2').AsString <> '' then
      edfpSC_MASASALARIAL2.Value := FieldByName('sc_totalmasa2').AsFloat;

    if FieldByName('sc_totalmasa3').AsString <> '' then
      edfpSC_MASASALARIAL3.Value := FieldByName('sc_totalmasa3').AsFloat;

    //Cantidad de trabajadores
    if FieldByName('sc_canttrabajador').AsString <> '' then
      edfpSC_CANTTRABAJADOR.Value := FieldByName('sc_canttrabajador').AsInteger;

    if FieldByName('sc_canttrabajador1').AsString <> '' then
      edfpSC_CANTTRABAJADOR1.Value := FieldByName('sc_canttrabajador1').AsInteger;

    if FieldByName('sc_canttrabajador2').AsString <> '' then
      edfpSC_CANTTRABAJADOR2.Value := FieldByName('sc_canttrabajador2').AsInteger;

    if FieldByName('sc_canttrabajador3').AsString <> '' then
      edfpSC_CANTTRABAJADOR3.Value := FieldByName('sc_canttrabajador3').AsInteger;

    FCalcularDatos931 := False;
    edPeriodo.Periodo.Valor               := FieldByName('sc_periodo').AsString;
    FCalcularDatos931 := True;

    edSC_PORCCOMISION.Value               := FieldByName('sc_porccomision').AsFloat;
    edSC_EDADPROMEDIO.Value               := FieldByName('sc_edadpromedio').AsInteger;
    fraSector.Value                       := FieldByName('sc_sector').AsString;
    edEstablecimientos.Value              := FieldByName('sc_establecimientos').AsInteger;
    checkPrestacionesEspeciales.Checked   := (FieldByName('sc_prestaciones_especiales').AsString = 'S');
//    checkMicroPyme.Checked                := (FieldByName('sc_micropyme').AsInteger = 1);
//    fraFormaJuridica.Value                := FieldByName('sc_formajuridica').AsString;
    fraProbabilidadCierreNegocio.Value    := FieldByName('sc_idprobabilidadcierre').AsInteger;
    edfpSC_OBSERVACIONES.Lines.Text       := FieldByName('sc_observaciones').AsString;
    edfpSC_OBSERVACIONESCIERRE.Lines.Text := FieldByName('sc_observacionescierre').AsString;

    if FieldByName('tc_sumafija').AsString <> '' then
      edTC_SUMAFIJA.Value := FieldByName('tc_sumafija').AsFloat;

    if FieldByName('tc_porcvariable').AsString <> '' then
      edTC_PORCVARIABLE.Value := FieldByName('tc_porcvariable').AsFloat;

    if FieldByName('tc_costofinal').AsString <> '' then
      edTC_COSTOFINAL.Value := FieldByName('tc_costofinal').AsFloat;

    edDescuentoAplicado.Value    := FieldByName('sc_porcdescuento').AsFloat;
    edAumentoAplicado.Value      := FieldByName('sc_porcaumento').AsFloat;
    edPoliza.Value               := FieldByName('sc_valor_rc').AsFloat; //Poliza
    edValoresAlicuota.Value      := FieldByName('sc_valor_rc').AsFloat;
    edValoresSumaAsegurada.Value := FieldByName('sc_sumaasegurada_rc').AsCurrency;

    //Cuota Inicial, es la cuenta de Alicuota_Variable * Masa Salarial /100.
    edValoresCuotaInicial.Value:= FieldByName('sc_valor_rc').AsFloat * FieldByName('sc_masasalarial').AsFloat / 100;

    //Check suma asegurada seleccionado
    rb2.Checked:=False;
    rb5.Checked:=False;
   // rb7.Checked:=False;
    rb10.Checked:=False;

    rb2.Checked := (FieldByName('sc_sumaasegurada_rc').AsInteger = 250000);
    rb5.Checked := (FieldByName('sc_sumaasegurada_rc').AsInteger = 500000);
//    rb7.Checked := (FieldByName('sc_sumaasegurada_rc').AsInteger = 750000);
    rb10.Checked := (FieldByName('sc_sumaasegurada_rc').AsInteger = 1000000);

    //check RC si o no seleccionado.
    rbRCSi.Checked := (FieldByName('sc_poliza_rc').AsString = 'S');
    rbRCNo.Checked := (FieldByName('sc_poliza_rc').AsString <> 'S');

    if rbRCNo.Checked then
    begin
      edValoresAlicuota.Value      := 0;
      edValoresSumaAsegurada.Value := 0;
      edValoresCuotaInicial.Value  := 0;
      edValoresMasaSalarial.Value  := 0;
    end;

    btnRecalcRCClick(nil);

    fraZonaGeografica.Codigo := FieldByName('sc_idzonageografica').AsString;

    edDescuentoAplicado.Visible := (edDescuentoAplicado.Value > 0);
    edAumentoAplicado.Visible   := (edAumentoAplicado.Value > 0);

    fraStatusSRT.Value 	       := FieldByName('sc_statussrt').AsString;
    fraSC_IDARTANTERIOR.Locked := (fraStatusSRT.Value = '1');
    fraStatusBCRA.Value        := FieldByName('sc_statusbcra').AsString;

    //Observaciones de Area Tecnica
    edfpObsATecnica.Lines.Text := FieldByName('obsatecnica').AsString;

    //Actualiza las distintas asociaciones
    //ActualizaCambios;
  end;

  if frafpSC_CANAL.Value = 321 then   // Si es venta directa..
  begin
    edSC_PORCCOMISION.DisplayFormat := '***';
    edSC_PORCCOMISION.Enabled := False;
  end
  else
  begin
    edSC_PORCCOMISION.DisplayFormat := '% ,0.00;-% ,0.00';
    edSC_PORCCOMISION.Enabled := True;
  end;
end;

procedure TfrmConsultaSolicitud.LockControls(ALocked: Boolean = True);
begin
  inherited;

 // sbCancelar.Enabled := not ALocked;
  pnCancelar.Enabled := not ALocked;
  sbtnCancelar.Enabled := not ALocked;
end;

function TfrmConsultaSolicitud.NotificarAlCliente(const aIdSolicitud: Integer; const aOrigen: String; const aCommitTrans: Boolean = True): Boolean;
var
  bSend: Boolean;
  sSql: String;
begin
  tbLimpiarClick(nil);

  sSql :=
    'SELECT sc_nrosolicitud' +
     ' FROM asc_solicitudcotizacion' +
    ' WHERE sc_id = :id';
  edSC_NROSOLICITUD.Value := ValorSqlIntegerEx(sSql, [aIdSolicitud]);
  tbRefrescarClick(nil);

  bSend := EnviarPorMail(IntToStr(aIdSolicitud), sdqConsulta.FieldByName('sc_razonsocial').AsString, sdqConsulta.FieldByName('sc_cuit').AsString, aOrigen, aCommitTrans);
  if bSend then
  begin
    UpdateCO_ESTADO(sdqConsulta.FieldByName('sc_idcotizacion').AsInteger, EC_NOTIF_CLIENTE, aCommitTrans);

    sSql :=
      'UPDATE asc_solicitudcotizacion' +
        ' SET sc_estado = :estado,' +
            ' sc_fecharespuesta = SYSDATE' +
      ' WHERE sc_id = :idsolicitudcotizacion';
    if aCommitTrans then
      EjecutarSqlEx(sSql, [EC_NOTIF_CLIENTE, aIdSolicitud])
    else
      EjecutarSqlSTEx(sSql, [EC_NOTIF_CLIENTE, aIdSolicitud]);

    sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
    if aCommitTrans then
      EjecutarSqlEx(sSql, [aIdSolicitud])
    else
      EjecutarSqlSTEx(sSql, [aIdSolicitud]);


    if IsEventoSGC then
    begin
      sSql :=
        'UPDATE cse_seguimientoevento' +
          ' SET se_fecharealizado = SYSDATE,' +
              ' se_idsolicitudcotizacion = :idsolicitud,' +
              ' se_finalsumafija = :tarifa,' +
              ' se_finalporcmasa = :proporcion,' +
              ' se_finalportrabajador = :FINAL,' +
              ' se_usurealizado = :usuario,' +
              ' se_fechaaltarealizado = SYSDATE' +
        ' WHERE se_id = :evento';
      if aCommitTrans then
        EjecutarSqlEx(sSql,
                      [aIdSolicitud,
                       sdqConsulta.FieldByName('tc_sumafija').AsFloat,
                       sdqConsulta.FieldByName('tc_porcvariable').AsFloat,
                       sdqConsulta.FieldByName('tc_costofinal').AsFloat,
                       Sesion.UserID,
                       sdqConsulta.FieldByName('sc_idevento').AsInteger])
      else
        EjecutarSqlSTEx(sSql,
                        [aIdSolicitud,
                         sdqConsulta.FieldByName('tc_sumafija').AsFloat,
                         sdqConsulta.FieldByName('tc_porcvariable').AsFloat,
                         sdqConsulta.FieldByName('tc_costofinal').AsFloat,
                         Sesion.UserID,
                         sdqConsulta.FieldByName('sc_idevento').AsInteger]);
    end;
  end;

  Result := bSend;
end;

procedure TfrmConsultaSolicitud.NotificarAlCliente(const bEnvioMail: Boolean);
var
  bSend: Boolean;
  sEstado: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    Verificar((not Active) or (Eof), nil, 'Debe elegir un registro.');

    sEstado := FieldByName('co_estado').AsString;
    Verificar(((sEstado <> EC_NOTIF_COMERCIAL) and (sEstado <> EC_NOTIF_CLIENTE) and (sEstado <> EC_CERRADA_MAL)), nil, 'Debe elegir una solicitud de cotizacion "Pendiente de Notificación".');

    if not bEnvioMail then
    begin
      bSend := True;
      if not PrintLetter(sdqConsulta.FieldByName('sc_id').AsInteger, '', '') then
        raise Exception.Create('Error al imprimir la carta.');
    end
    else
      bSend := EnviarPorMail(FieldByName('sc_id').AsString, FieldByName('sc_razonsocial').AsString, FieldByName('sc_cuit').AsString);

    if bSend then
    begin
      if sEstado = EC_NOTIF_COMERCIAL then
      begin
        UpdateCO_ESTADO(FieldByName('sc_idcotizacion').AsInteger, EC_NOTIF_CLIENTE);

        sSql :=
          'UPDATE asc_solicitudcotizacion' +
            ' SET sc_estado = :estado,' +
                ' sc_fecharespuesta = SYSDATE' +
          ' WHERE sc_id = :id';
        EjecutarSqlEx(sSql, [EC_NOTIF_CLIENTE, FieldByName('sc_id').AsInteger]);

        sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
        EjecutarSqlEx(sSql, [FieldByName('sc_id').AsInteger]);
      end;

      if IsEventoSGC then
      begin
        sSql :=
          'UPDATE cse_seguimientoevento' +
            ' SET se_fecharealizado = SYSDATE,' +
                ' se_idsolicitudcotizacion = :idsolicitudcotizacion,' +
                ' se_finalsumafija = :finalsumafija,' +
                ' se_finalporcmasa = :finalporcmasa,' +
                ' se_finalportrabajador = :finalportrabajador,' +
                ' se_usurealizado = :usurealizado,' +
                ' se_fechaaltarealizado = SYSDATE' +
          ' WHERE se_id = :id';
        EjecutarSqlEx(sSql, [FieldByName('sc_id').AsInteger,
                             FieldByName('tc_sumafija').AsFloat,
                             FieldByName('tc_porcvariable').AsFloat,
                             FieldByName('tc_costofinal').AsFloat,
                             Sesion.UserID,
                             FieldByName('sc_idevento').AsInteger]);
      end;

      tbRefrescarClick(nil);
    end;
  end;
end;

procedure TfrmConsultaSolicitud.ObtenerTarifaComercial;
var
  cTarifa: Currency;
  ePorcentaje: Extended;
begin
  if not sdqConsulta.Active then
    Exit;

  if ((Trim(sdqConsulta.FieldByName('tc_sumafija').AsString) = '')) then
  begin
    if (edfpSC_CANTTRABAJADOR.Value <= frafpSC_IDACTIVIDAD.CantidadTrabajadoresAutocotizable) and (edfpSC_CANTTRABAJADOR.Value > 0) and
       (frafpSC_IDACTIVIDAD.AsString <> '') and (ModoABM <> maAlta) then
    begin
      TarifaComercial(frafpSC_IDACTIVIDAD.Value, edfpSC_CANTTRABAJADOR.Value, DBDate, cTarifa, ePorcentaje);

      edTC_SUMAFIJA.Value := cTarifa;

      //Modificado 14-01-2005. Según formula aportada por Saire
      edTC_COSTOFINAL.Value  := edfpSC_MASASALARIAL.Value / edfpSC_CANTTRABAJADOR.Value * (ePorcentaje / 100) +  cTarifa;
      edTC_PORCVARIABLE.Value := ePorcentaje;
    end
    else
    begin
      edTC_SUMAFIJA.Value := 0;
      edTC_COSTOFINAL.value := 0;
      edTC_PORCVARIABLE.Value := 0;
    end;
  end;
end;

function TfrmConsultaSolicitud.PrintLetter(const aIdSolicitudCotizacion: Integer; const aFileNameCoti, aFileNameSolAfi: String): Boolean;
const
  MAX_INTENTOS = 20;
var
  IdHTTP1: TIdHTTP;
  iLoop: Integer;
  sArchivo: String;
  sNroSolicitud: String;
  sRuta: String;
  sSql: String;
begin
{
  with TQrCartaSolicitud.Create(Self) do
  try
    bResultado := Preparar(AIDSolicitudCotizacion, aFileNameCoti);
  finally
    Free;
  end;
}
  Result := False;

  IdHTTP1 := TIdHTTP.Create(nil);
  IdHTTP1.Request.ContentType := 'text/xml; charset=utf-8';   //Tipo de contenido a enviar (sin esto no anda)
  try
    sSql :=
      'SELECT sc_nrosolicitud' +
       ' FROM asc_solicitudcotizacion' +
      ' WHERE sc_id = :id';
    sNroSolicitud := ValorSqlEx(sSql, [aIdSolicitudCotizacion], '0');

    iLoop := 0;
    sArchivo := 'carta_cotizacion_' + sNroSolicitud + '.pdf';

    if Is_ConectadoProduccion then
    begin
      sRuta := '\\ntwebart1\Storage_Data\Web\Carta_Cotizacion\' + ArmPathFromNumber(sNroSolicitud);
      IdHTTP1.Get('http://www.provinciart.com.ar/index.php?pageid=29&id=C' + IntToStr(aIdSolicitudCotizacion) + '&delphi=t');
    end
    else
    begin
      sRuta := '\\ntwebart3\Storage_Data\Web\Carta_Cotizacion\' + ArmPathFromNumber(sNroSolicitud);
      IdHTTP1.Get('http://extranet-desa.artprov.com.ar/index.php?pageid=29&id=C' + IntToStr(aIdSolicitudCotizacion) + '&delphi=t');
    end;

    while not FileExists(sRuta + sArchivo) do
    begin
      if iLoop > MAX_INTENTOS then
        Exit;

      Sleep(500);
      Inc(iLoop);
    end;
  finally
    IdHTTP1.Free;
  end;

  if aFileNameCoti = '' then
  begin
    Sleep(200);
    ShellExecute(Handle, 'open', PChar(sRuta + sArchivo), nil, nil, SW_SHOWNORMAL);
    Result := True;
  end
  else
  begin
    if FileExists(aFileNameCoti) then
      DeleteFile(aFileNameCoti);

//    Result := RenameFile(sRuta + sArchivo, aFileNameCoti);
    Result := CopyFileExt(PChar(sRuta + sArchivo), PChar(aFileNameCoti), False);
//    Result := MoveFile(sRuta + sArchivo, aFileNameCoti);
  end;
end;

function TfrmConsultaSolicitud.ArmPathFromNumber(const aNumero: String): String;
var
  iLoop: Integer;
begin
  Result := '';

	for iLoop := 1 to Length(aNumero) do
		Result := aNumero[iLoop] + '\' + Result;
end;

procedure TfrmConsultaSolicitud.RecalcularComision;
begin
  FComisionCalculada := False;
  edSC_PORCCOMISION.Clear;
end;

procedure TfrmConsultaSolicitud.RefrescarEstablecimientos(const aIdSolicitud: Integer);
var
  sSql: String;
begin
  sSql :=
    'SELECT ac_codigo, ac_descripcion, cp_localidadcap, eu_id, eu_idactividad, eu_idlocalidad, eu_idtipoactividad,' +
          ' eu_trabajadores, eu_idzonageografica, ta_detalle, zg_descripcion' +
     ' FROM afi.aeu_establecimientos, afi.azg_zonasgeograficas, art.ccp_codigopostal, afi.ata_tipoactividad,' +
          ' cac_actividad' +
    ' WHERE eu_idzonageografica = zg_id(+)' +
      ' AND eu_idlocalidad = cp_id(+)' +
      ' AND eu_idtipoactividad = ta_id(+)' +
      ' AND eu_idactividad = ac_id(+)';

  if ModoABM = maAlta then
    sSql := sSql +
      ' AND eu_idsolicitud = :idsolicitud' +
      ' AND eu_usualta = :usualta'
  else
    sSql := sSql +
      ' AND eu_idsolicitud = :idsolicitud';

  sSql := sSql +
     ' AND eu_fechabaja IS NULL' +
' ORDER BY eu_id';

  with sdqEstablecimientos do
  begin
    Close;
    SQL.Text := sSql;

    if ModoABM = maAlta then
    begin
      ParamByName('idsolicitud').AsInteger := -1;
      ParamByName('usualta').AsString := Sesion.UserID;
    end
    else
      ParamByName('idsolicitud').AsInteger := aIdSolicitud;

    Open;
  end;
end;

procedure TfrmConsultaSolicitud.SetLockSolicitud(const Value: Boolean);
begin
  FLockSolicitud := Value;
  VCLExtra.LockControls(fpABM, Value);
  VCLExtra.LockControls(gbRC, False);
end;

procedure TfrmConsultaSolicitud.sgGridPCPGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if ACol > 1 then
    AAlignment := taRightJustify
  else
    AAlignment := taLeftJustify;
end;

procedure TfrmConsultaSolicitud.sgGridPCPKeyPress(Sender: TObject; var Key: Char);
begin
  with (Sender as TStaticGrid) do
  begin
    if (Row = 0) or (Row = (RowCount - 1)) or (Col = 0) or (Col = 1) or (Col = 3) or (Col = 4) then
      Key := #0;

    // Esto permite automatizar el pasaje al campo siguiente
    if (Key = #13) then
    begin
      if Row < (RowCount - 2) then
         Row := Row + 1
      else
        Row := 1;
    end
    else if not (Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', #8]) then
      Key := #0;  // Solo estos caracteres pueden escribirse

    if (Cells[Col, Row] <> '') and (Key <> #8) then
      if StrToInt(Cells[Col, Row]) > 99999 then
        Key := #0;
  end;
end;

procedure TfrmConsultaSolicitud.sgGridPCPKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  iLoop: Integer;
  iTotalAlicuota: Integer;
  iTotalTrabajadores: Integer;
begin
  inherited;

  if (sgGridPCP.Col = 2) and (sgGridPCP.Row <> 0) and (sgGridPCP.Row <> sgGridPCP.RowCount - 1) then
  begin
    if sgGridPCP.Cells[2, sgGridPCP.Row] = '' then
      sgGridPCP.Cells[4, sgGridPCP.Row] := '0'
    else
      sgGridPCP.Cells[4, sgGridPCP.Row] := FormatFloat('$ #,##0', StrToInt(sgGridPCP.Cells[2, sgGridPCP.Row]) * StrToInt(sgGridPCP.Cells[3, sgGridPCP.Row]));
  end;

  // Calculo los totales..
  iTotalAlicuota := 0;
  iTotalTrabajadores := 0;
  for iLoop := 1 to sgGridPCP.RowCount - 2 do
  begin
    if sgGridPCP.Cells[2, iLoop] <> '' then
    begin
      iTotalAlicuota := iTotalAlicuota + (StrToInt(sgGridPCP.Cells[2, iLoop]) * StrToInt(sgGridPCP.Cells[3, iLoop]));
      iTotalTrabajadores := iTotalTrabajadores + StrToInt(sgGridPCP.Cells[2, iLoop]);
    end;
  end;

  sgGridPCP.Cells[2, sgGridPCP.RowCount - 1] := IntToStr(iTotalTrabajadores);
  sgGridPCP.Cells[4, sgGridPCP.RowCount - 1] := FormatFloat('$ #,##0', iTotalAlicuota);
end;

procedure TfrmConsultaSolicitud.UpdateSeguimientoEvento(const aExisteEvento: Boolean; const aEstado: String; const aIdSolicitudCotizacion, aIdEvento: Integer);
var
  sSql: String;
begin
  if (aExisteEvento) and
    ((aEstado = EC_CANCELADA) or
     (aEstado = EC_CERRADA_BIEN) or
     (aEstado = EC_CERRADA_MAL) or
     (aEstado = EC_CERRADA_SIN_INFORMACION) or
     (aEstado = EC_CON_ERRORES) or
     (aEstado = EC_NO_SE_COTIZA) or
     (aEstado = EC_NOTIF_CLIENTE) or
     (aEstado = EC_SUSPENDIDA) or
     (aEstado = EC_CERRADO_AUTOMATICO)) then
  begin
    sSql :=
      'UPDATE cse_seguimientoevento' +
        ' SET se_eventointerrumpido = ''S'',' +
            ' se_usurealizado = :usu,' +
            ' se_fecharealizado = SYSDATE,' +
            ' se_fechaaltarealizado = SYSDATE,' +
            ' se_idsolicitudcotizacion = :idsolicitud' +
      ' WHERE se_id = :evento';
    EjecutarSqlEx(sSql, [Sesion.UserID, aIdSolicitudCotizacion, aIdEvento])
  end;
end;

procedure TfrmConsultaSolicitud.UpdateValoresSolicitud(const aEstadoActual: String);
var
  sSql: String;
begin
  sSql :=
    'UPDATE asc_solicitudcotizacion' +
      ' SET sc_finalsumafija = NULL,' +
          ' sc_finalporcmasa = NULL,' +
          ' sc_finalportrabajador = NULL,' +
          ' sc_fechavigencia = NULL,' +
          ' sc_estado = :estado,' +
          ' sc_fecharevision = SYSDATE,' +
          ' sc_usuariorevision = :usuariorevision' +
    ' WHERE sc_id = :id';
  EjecutarSqlStEx(sSql, [IIF((aEstadoActual = EC_CON_ERRORES), EC_CON_ERRORES, EC_PEND_COTIZ), Sesion.UserId, FIdSolicitud]);

  sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
  EjecutarSqlSTEx(sSql, [FIdSolicitud]);
end;


procedure TfrmConsultaSolicitud.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  IdHTTP1 := TIdHTTP.Create(Self);

  FCalcularDatos931 := True;
  FComisionCalculada := False;
  FEsClonacion := False;

  sSql :=
    'SELECT 1' +
     ' FROM art.aum_usuariotarifaminima' +
    ' WHERE um_fechabaja IS NULL' +
      ' AND um_usuario = :usuario';
  FMostrarColumnasPiso := ExisteSqlEx(sSql, [Sesion.UserID]);

  Values[1] := Null;

  with Seguridad.Claves.Add do
    Name := 'NoVerUsuarioAsignado';

  inherited;

  FPermisoExcepcion    := ExisteSqlEx('SELECT 1 FROM afi.apr_permisorevision WHERE pr_usuario = :id AND pr_excepcion = ''T''', [Sesion.ID]);
//  FPermisoRecotizacion := ExisteSqlEx('SELECT 1 FROM afi.apr_permisorevision WHERE pr_usuario = :id AND pr_revision = ''T''', [Sesion.ID]);
  FPermisoRecotizacion := True;   // Se pone siempre en True según ticket 30223..

  if Seguridad.Claves.IsActive('NoVerUsuarioAsignado') then
    Grid.ColumnByField['sc_usuasignado'].Visible := False;

  ShowActived := False;

  cmbEventos.ItemIndex := 0;

  edNumeroCotizacion.Clear;
  edOrden.Clear;

  fraCanal.OnChange         := CambiaCanal2;
  fraCiiu.OnChange          := CambiaCiiuEstablecimiento;
  fraEntidad.OnChange       := CambiaEntidad2;
  frafpIDCENTROREG.OnChange := CambiaCentroReg;
  frafpSC_CANAL.OnChange    := CambiaCanal;
  frafpSC_ENTIDAD.OnChange  := CambiaEntidad;

  frafpSC_IDACTIVIDAD.FieldBaja := 'ac_fechabaja';
  frafpSC_IDACTIVIDAD.OnChange  := CambiaActividad;

  frafpSC_IDACTIVIDAD2.FieldBaja := 'ac_fechabaja';
  frafpSC_IDACTIVIDAD3.FieldBaja := 'ac_fechabaja';
  frafpSC_IDSUCURSAL.OnChange    := CambiaSucursal;

  frafpSC_VENDEDOR.ShowBajasEntVend := False;
  frafpSC_VENDEDOR.OnChange         := CambiaVendedor;

//  fraFormaJuridica.Clave 	 := 'FJURI';
//  fraFormaJuridica.Especial2 := 'MPyme';
//  fraFormaJuridica.OrderBy := ' TB_DESCRIPCION ';

  fraMotivoCancelacion.Clave  := 'COTBA';
  fraMotivoCancelacion2.Clave := 'COTBA';
  fraMotivoExcepcion.Clave    := 'COTEX';
  fraMotivoRecotizacion.Clave := 'COTRE';

  fraSC_IDARTANTERIOR.TableName   := 'aar_art';
  fraSC_IDARTANTERIOR.FieldID     := 'ar_id';
  fraSC_IDARTANTERIOR.FieldCodigo := 'ar_id';
  fraSC_IDARTANTERIOR.FieldDesc   := 'ar_nombre';
  fraSC_IDARTANTERIOR.FieldBaja   := 'ar_fechabaja';

  fraSC_IDENTIDAD.OnChange     := CambiaEntidadBusqueda;
  fraSC_USUARIOSOLICITUD.Value := Sesion.UserID;

  fraSector.Clave    := 'SECT';
  fraSector.OnChange := CambiaSector;

  fraSector2.Clave := 'SECT';

  fraStatusSRT.Clave 	 := 'STSRT';
  fraStatusSRT.OrderBy := ' TB_CODIGO ';

  fraStatusBCRA.Clave 	:= 'STBCR';
  fraStatusBCRA.OrderBy := ' TB_CODIGO ';

  fraVendedor.ShowBajasEntVend := False;

  rgOrigenSolicitud.ItemIndex := 0;

  tbSeparadorCarta.Left                 := 31;
  tbRedireccionarEmailAutorizacion.Left := 31;
  tbCambiarDatos.Left                   := 31;
  tbBuscarEmails.Left                   := 31;
  tbEventos.Left                        := 31;
  tbPosibleDescuento.Left               := 31;
  tbRecotizacion.Left                   := 31;
  tbExcepcion.Left                      := 31;
  tbRevisarEstado.Left                  := 31;
  tbCerrarSolicitud.Left                := 31;
	tbSeparador.Left                      := 31;
  tbEnviarCarta.Left                    := 31;
  tbSeparadorClon.Left                  := 31;
  tbClonar.Left                         := 31;
  tbRefrescarCombos.Left                := 464;

  //sbCancelar.Top := 17;

  LoadDynamicSortFields(SortDialogEventos.SortFields, dbgACE_COTIZACIONEVENTOS.Columns);
  LockControls([fraSC_IDARTANTERIOR], True);
  OpenQuery(sdqDelegacion);
  OpenQuery(sdqEstado);
  OpenQueryEx(sdqCanal, [Sesion.UserID]);
  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmConsultaSolicitud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmConsultaSolicitud.tbRefrescarClick(Sender: TObject);
var
  Aux1: String;
  Aux2: String;
  EsCotizacion: Boolean;
  EsSolicitud: Boolean;
  sCantTrab: String;
  sSql: String;
  sWhere: String;
begin
  sCantTrab := '';

  Verificar((chkCantTrab6.Checked) and (edOtrosDesde.IsEmpty), edOtrosDesde, 'Debe indicar un valor en este campo.');
  Verificar((chkCantTrab6.Checked) and (edOtrosHasta.IsEmpty), edOtrosHasta, 'Debe indicar un valor en este campo.');


  if chkCantTrab1.Checked or chkCantTrab2.Checked or chkCantTrab3.Checked or chkCantTrab4.Checked or chkCantTrab5.Checked or chkCantTrab6.Checked then
  begin
    sCantTrab := ' AND (1=2 ';

    if chkCantTrab1.Checked then
      sCantTrab := sCantTrab + ' OR sc_canttrabajador BETWEEN 1 AND 10 ';

    if chkCantTrab2.Checked then
      sCantTrab := sCantTrab + ' OR sc_canttrabajador BETWEEN 11 AND 50 ';

    if chkCantTrab3.Checked then
      sCantTrab := sCantTrab + ' OR sc_canttrabajador BETWEEN 51 AND 100 ';

    if chkCantTrab4.Checked then
      sCantTrab := sCantTrab + ' OR sc_canttrabajador BETWEEN 101 AND 500 ';

    if chkCantTrab5.Checked then
      sCantTrab := sCantTrab + ' OR sc_canttrabajador > 500';

    if chkCantTrab6.Checked then
      sCantTrab := sCantTrab + ' OR sc_canttrabajador BETWEEN ' + SqlValue(edOtrosDesde.Value) + ' AND ' + SqlValue(edOtrosHasta.Value);

    sCantTrab := sCantTrab + ') ';
  end;


  Aux1 :=
    'SELECT /*+ RULE */' +
          ' sc_id, sc_nrosolicitud, TO_NUMBER(NULL) co_nrocotizacion,' +
          ' TO_CHAR(sc_fechasolicitud, ''DD/MM/YYYY HH24:MI'') sc_fechasolicitud, sc_usuariosolicitud, sc_cuit, sc_razonsocial,' +
          ' sc_idactividad, sc_masasalarial, sc_canttrabajador, sc_idcotizacion, sc_observaciones, sc_contacto, sc_telefono,' +
          ' sc_usuasignado, sc_costofinal, sc_porcvariable, sc_sumafija, sc_idgrupoeconomico, sc_fechaapertura, sc_canal,' +
          ' sc_idartanterior, sc_usualta, sc_fechaalta, sc_usumodif, sc_fechamodif, sc_usubaja, sc_fechabaja, sc_form931,' +
          ' sc_idvendedor, sc_identidad, sc_observacionescierre, sc_costofinalform931, sc_sumafijaform931, sc_porcvariableform931,' +
          ' est.tb_descripcion estado, sc_estado co_estado, TO_NUMBER(NULL) tc_idcotizacion, sc_finalsumafija tc_sumafija,' +
          ' sc_finalporcmasa tc_porcvariable, sc_finalportrabajador tc_costofinal, ac_descripcion, ac_codigo,' +
          ' canal.ca_descripcion desccanal, hold.ge_descripcion holding, art.ar_nombre artactual, ve_nombre, en_nombre,' +
          ' NULL obsatecnica, sc_idsucursal, sc_actividadreal, sc_canttrabajador1, sc_canttrabajador2, sc_canttrabajador3,' +
          ' sc_idactividad2, sc_idactividad3, sc_detalleoper, sc_detalleadmin, sc_detallecalle, sc_porccomision, sc_nuevaregimen,' +
          ' TO_CHAR(sc_fechavigencia, ''DD/MM/YYYY HH24:MI'') co_fechacerrado,' +
          ' art.cotizacion.get_prima_x_capita_competencia(sc_id) costofinal,' +
          ' DECODE(sc_fechavigencia,' +
                 ' NULL, 0,' +
                 ' DECODE(sc_form931,' +
                        ' NULL, 0,' +
                        ' (art.cotizacion.get_prima_x_capita(sc_id) - art.cotizacion.get_prima_x_capita_competencia(sc_id))))' +
                                                                                                                          ' difplata,' +
          ' DECODE(sc_fechavigencia,' +
                 ' NULL, 0,' +
                 ' DECODE(sc_form931,' +
                        ' NULL, 0,' +
                        ' DECODE(art.cotizacion.get_prima_x_capita_competencia(sc_id),' +
                               ' 0, 0,' +
                               ' (art.cotizacion.get_prima_x_capita(sc_id) - art.cotizacion.get_prima_x_capita_competencia(sc_id))' +
                               ' * 100 / art.cotizacion.get_prima_x_capita_competencia(sc_id)))) difporc,' +
          ' DECODE(sc_fechavigencia,' +
                 ' NULL, NULL,' +
                 ' DECODE(sc_form931,' +
                        ' NULL, NULL,' +
                        ' art.utiles.iif_compara(''<'', art.cotizacion.get_prima_x_capita(sc_id),' +
                                               ' art.cotizacion.get_prima_x_capita_competencia(sc_id), ''OK'', ''OUT''))) resultado,' +
          ' TO_CHAR(sc_fechacierre, ''DD/MM/YYYY HH24:MI'') sc_fechacierre, su_codsucursal, su_descripcion, sc_motivocancelacion,' +
          ' sc_motivorevision, NULL co_usuarioconfecciono, TO_NUMBER(NULL) co_idcotizacionanterior, sc_motivosuspension,' +
          ' TO_CHAR(sc_fecharespuesta, ''DD/MM/YYYY HH24:MI'') sc_fecharespuesta, sc_idevento, sc_mail,' +
          ' afiliacion.is_solicitudtieneeventos(sc_id) tieneeventos, contratos.co_contrato, cr_descripcion, sc_usubaja,' +
          ' TRUNC(sc_fechabaja) fechabaja, sc_statussrt, sc_statusbcra, sc_totalmasa1, sc_totalmasa2, sc_totalmasa3, sc_detalleoper2,' +
          ' sc_detalleoper3, sc_detalleadmin2, sc_detalleadmin3, sc_detallecalle2, sc_detallecalle3, stsrt.tb_descripcion statussrt,' +
          ' stbcr.tb_descripcion statusbcra, sc_error, errco.tb_descripcion errorcotiz,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_CANCELADA) + ', cotmc.tb_descripcion, NULL) cotmc,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_NO_SE_COTIZA) + ', cotba.tb_descripcion, NULL) cotba, cotre.tb_descripcion cotre,' +
          ' sc_fecharevision, sc_usuariorevision, sc_fechaexcepcion, sc_usuarioexcepcion, cotex.tb_descripcion motivoexcepcion,' +
          ' sc_edadpromedio, sc_idzonageografica, sc_sumafijacompetencia, sc_porcvariablecompetencia, sc_costofijo931parcial,' +
          ' sc_porcvariable931parcial, sc_costofijocompetenciaparcial, sc_porcvariablecompetenciaparc, sc_pagocompetenciaparcial,' +
          ' sc_costofinalpagomensual, sc_idusuarioweb, sc_idgrupoeconomico, NULL capitastecnica, NULL masasalarialtecnica,' +
          ' NULL codigociiutecnica, NULL ciiutecnica, sc_sector, sc_idprobabilidadcierre, pn_detalle probabilidadcierre,' +
          ' fo_formulario, fo_fechaalta, sc_establecimientos, sc_periodo, el_nombre,' +
          ' DECODE(sc_idformulario, NULL, NULL, ''Sí'') tienesolicitudafiliacion,' +
          ' (SELECT ce_fecha' +
             ' FROM ace_cotizacionevento' +
            ' WHERE ce_id = (SELECT MAX(ce_id)' +
                             ' FROM ace_cotizacionevento' +
                            ' WHERE ce_idsolicitudcotizacion = sc_id' +
                              ' AND ce_fechabaja IS NULL)) fechaultimoevento,' +
           '(SELECT ce_descripcion' +
             ' FROM ace_cotizacionevento' +
            ' WHERE ce_id = (SELECT MAX(ce_id)' +
                             ' FROM ace_cotizacionevento' +
                            ' WHERE ce_idsolicitudcotizacion = sc_id' +
                              ' AND ce_fechabaja IS NULL)) descripcionultimoevento, sc_idformulario, sc_fechavigencia,' +
          ' (SELECT FLOOR(SYSDATE - fo_fechaalta)' +
             ' FROM afo_formulario' +
            ' WHERE fo_id = sc_idformulario) dias_suscripcionafi, sc_porcdescuento, sc_valor_rc, sc_sumaasegurada_rc, sc_porcaumento,' +
          ' sc_poliza_rc, ec_nombre, art.cotizacion.get_suma_fija_competencia(sc_id) sumafijacomp,' +
          ' art.cotizacion.get_porcentaje_variable_comp(sc_id) porcvarcomp, NULL usuarioautorizacion, sc_observacionescierrecom,' +
          ' sc_motivonoautocotizacion, sc_motivoexcepcion, sc_codmotivorevision, ir_fechaimpresion fimpresionsolicafi,' +
          ' sc_porccomision co_comision, NULL diasvencimiento, NULL co_orden, NULL nrocotiorden,' +
          ' CASE WHEN sc_porcaumento < 0 THEN NULL ELSE sc_porcaumento END AS porc_aumento,' +
          ' CASE WHEN sc_porcaumentotope < 0 THEN NULL ELSE sc_porcaumentotope END AS tope_aumento,' +
          ' CASE WHEN sc_porcdescuento < 0 THEN NULL ELSE sc_porcdescuento END AS porc_descuento,' +
          ' CASE WHEN sc_porcdescuentotope < 0 THEN NULL ELSE sc_porcdescuentotope END AS tope_descuento,' +
          ' NULL co_sumafijapiso, NULL co_porcvariablepiso, NULL co_costofinalpiso, NULL co_comisionpiso, sc_sumafijatarifario, sc_porcvariabletarifario,' +
          ' NULL co_acpo, sc_prestaciones_especiales,' +
          ' (SELECT     en_nombre' +
             ' FROM xgo_granorganizador, xen_entidad' +
            ' WHERE go_identorganizador = en_id' +
              ' AND go_fechabaja IS NULL' +
              ' AND go_fechaaprobado IS NOT NULL' +
              ' AND LEVEL = 1' +
       ' START WITH go_identidad = ev_identidad' +
       ' CONNECT BY NOCYCLE PRIOR go_identorganizador = go_identidad) organizador, sc_dias_respuesta, sc_cotizacion_pcp, sc_formajuridica, sc_micropyme' +
     ' FROM asc_solicitudcotizacion sc, aca_canal canal, ctb_tablas est, ctb_tablas stsrt, ctb_tablas stbcr, ctb_tablas errco, ctb_tablas cotba, ctb_tablas cotmc,' +
          ' ctb_tablas cotre, ctb_tablas cotex, aco_contrato contratos, age_grupoeconomico hold, cac_actividad, aar_art art, xve_vendedor, xen_entidad, asu_sucursal,' +
          ' acr_centroregional, afo_formulario, afi.apn_probabilidadcierrenegocio, del_delegacion, aec_ejecutivocuenta, asa_solicitudafiliacion,' +
          ' web.wir_impresionesrgrl, xev_entidadvendedor' +
    ' WHERE canal.ca_id = sc_canal' +
      ' AND EXISTS(SELECT 1' +
                   ' FROM auc_usuariocanal' +
                  ' WHERE uc_usuario = ' + SqlValue(Sesion.UserID) +
                    ' AND uc_idcanal = canal.ca_id' +
                    ' AND uc_fechabaja IS NULL)' +
      ' AND hold.ge_id(+) = sc_idgrupoeconomico' +
      ' AND est.tb_clave(+) = ''ACOES''' +
      ' AND est.tb_codigo(+) = sc_estado' +
      ' AND stsrt.tb_clave(+) = ''STSRT''' +
      ' AND stsrt.tb_codigo(+) = sc_statussrt' +
      ' AND stbcr.tb_clave(+) = ''STBCR''' +
      ' AND stbcr.tb_codigo(+) = sc_statusbcra' +
      ' AND errco.tb_clave(+) = ''ERRCO''' +
      ' AND errco.tb_codigo(+) = sc_error' +
      ' AND cotba.tb_clave(+) = ''COTBA''' +
      ' AND cotba.tb_codigo(+) = sc_motcancelacion' +
      ' AND cotmc.tb_clave(+) = ''COTMC''' +
      ' AND cotmc.tb_codigo(+) = sc_motcancelacion' +
      ' AND cotre.tb_clave(+) = ''COTRE''' +
      ' AND cotre.tb_codigo(+) = sc_codmotivorevision' +
      ' AND cotex.tb_clave(+) = ''COTEX''' +
      ' AND cotex.tb_codigo(+) = sc_codmotivoexcepcion' +
      ' AND art.ar_id(+) = sc_idartanterior' +
      ' AND sc_idvendedor = ve_id(+)' +
      ' AND sc_idsucursal = su_id(+)' +
      ' AND sc_identidad = en_id(+)' +
      ' AND sc_idactividad = ac_id(+)' +
      ' AND sc_idcotizacion IS NULL' +
      ' AND su_idcentroreg = cr_id(+)' +
      ' AND sc_idformulario = fo_id(+)' +
      ' AND sc_idprobabilidadcierre = pn_id(+)' +
      ' AND sc_iddelegacion = el_id(+)' +
      ' AND en_idejecutivo = ec_id(+)' +
      ' AND ve_id = ev_idvendedor(+)' +
      ' AND ev_fechabaja(+) IS NULL' +
      ' AND sc_id = sa_idsolicitudcotizacion(+)' +
      ' AND sa_id = ir_idsolicitudafiliacion(+)' +
      ' AND ir_idtipopdf(+) = 1' +
      ' AND art.cotizacion.essuscripciones(sc_usuariosolicitud, ' + SqlValue(Sesion.UserID) + ') = 1' +
      ' AND contratos.co_idformulario(+) = sc_idformulario';


  if not fraEstado.IsEmpty then
    Aux1 := Aux1 + ' AND sc_estado ' + fraEstado.InSql;

  Aux1 := Aux1 + SqlBetweenDateTime(' AND sc_fechacierre', cmbCO_FECHACERRADODesde.Date, cmbCO_FECHACERRADOHasta.Date, True);

  Aux2 :=
    'SELECT sc_id, sc_nrosolicitud, co_nrocotizacion, TO_CHAR(sc_fechasolicitud, ''DD/MM/YYYY HH24:MI'') sc_fechasolicitud,' +
          ' sc_usuariosolicitud, sc_cuit, sc_razonsocial, sc_idactividad, sc_masasalarial, sc_canttrabajador, sc_idcotizacion,' +
          ' sc_observaciones, sc_contacto, sc_telefono, sc_usuasignado, sc_costofinal, sc_porcvariable, sc_sumafija,' +
          ' sc_idgrupoeconomico, sc_fechaapertura, sc_canal, sc_idartanterior, sc_usualta, sc_fechaalta, sc_usumodif, sc_fechamodif,' +
          ' sc_usubaja, sc_fechabaja, sc_form931, sc_idvendedor, sc_identidad, sc_observacionescierre, sc_costofinalform931,' +
          ' sc_sumafijaform931, sc_porcvariableform931, est.tb_descripcion estado, cotizaciones.co_estado, tc_idcotizacion,' +
          ' DECODE(co_fechacerrado, NULL, TO_NUMBER(NULL), tc_sumafija) tc_sumafija,' +
          ' DECODE(co_fechacerrado, NULL, TO_NUMBER(NULL), tc_porcvariable) tc_porcvariable,' +
          ' DECODE(co_fechacerrado, NULL, TO_NUMBER(NULL), tc_costofinal) tc_costofinal, ac1.ac_descripcion, ac1.ac_codigo,' +
          ' canal.ca_descripcion desccanal, hold.ge_descripcion holding, art.ar_nombre artactual, ve_nombre, en_nombre,' +
          ' utiles.iif_compara(''>='', cotizaciones.co_estado, ' + SqlValue(EC_NOTIF_COMERCIAL) + ',' +
                             ' SUBSTR(tc_observaciones, 1, 500), NULL) obsatecnica,' +
          ' sc_idsucursal, sc_actividadreal, sc_canttrabajador1, sc_canttrabajador2, sc_canttrabajador3, sc_idactividad2,' +
          ' sc_idactividad3, sc_detalleoper, sc_detalleadmin, sc_detallecalle, sc_porccomision, sc_nuevaregimen,' +
          ' TO_CHAR(co_fechacerrado, ''DD/MM/YYYY HH24:MI'') co_fechacerrado,' +
          ' art.cotizacion.get_prima_x_capita_competencia(sc_id) costofinal,' +
          ' DECODE(sc_fechavigencia,' +
                 ' NULL, 0,' +
                 ' DECODE(sc_form931,' +
                        ' NULL, 0,' +
                        ' (art.cotizacion.get_prima_x_capita(sc_id) - art.cotizacion.get_prima_x_capita_competencia(sc_id))))' +
                                                                                                                          ' difplata,' +
          ' DECODE(sc_fechavigencia,' +
                 ' NULL, 0,' +
                 ' DECODE(sc_form931,' +
                        ' NULL, 0,' +
                        ' DECODE(art.cotizacion.get_prima_x_capita_competencia(sc_id),' +
                               ' 0, 0,' +
                               ' (art.cotizacion.get_prima_x_capita(sc_id) - art.cotizacion.get_prima_x_capita_competencia(sc_id))' +
                               ' * 100 / art.cotizacion.get_prima_x_capita_competencia(sc_id)))) difporc,' +
          ' DECODE(sc_fechavigencia,' +
                 ' NULL, NULL,' +
                 ' DECODE(sc_form931,' +
                        ' NULL, NULL,' +
                        ' art.utiles.iif_compara(''<'', art.cotizacion.get_prima_x_capita(sc_id),' +
                                               ' art.cotizacion.get_prima_x_capita_competencia(sc_id), ''OK'', ''OUT''))) resultado,' +
          ' TO_CHAR(sc_fechacierre, ''DD/MM/YYYY HH24:MI'') sc_fechacierre, su_codsucursal, su_descripcion, sc_motivocancelacion,' +
          ' sc_motivorevision, co_usuarioconfecciono, co_idcotizacionanterior, sc_motivosuspension,' +
          ' TO_CHAR(sc_fecharespuesta, ''DD/MM/YYYY HH24:MI'') sc_fecharespuesta, sc_idevento, sc_mail,' +
          ' afiliacion.is_solicitudtieneeventos(sc_id) tieneeventos, contratos.co_contrato, cr_descripcion, sc_usubaja,' +
          ' TRUNC(sc_fechabaja) fechabaja, sc_statussrt, sc_statusbcra, sc_totalmasa1, sc_totalmasa2, sc_totalmasa3, sc_detalleoper2,' +
          ' sc_detalleoper3, sc_detalleadmin2, sc_detalleadmin3, sc_detallecalle2, sc_detallecalle3, stsrt.tb_descripcion statussrt,' +
          ' stbcr.tb_descripcion statusbcra, sc_error, errco.tb_descripcion errorcotiz,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_CANCELADA) + ', cotmc.tb_descripcion, NULL) cotmc,' +
          ' DECODE(sc_estado, ' + SqlValue(EC_NO_SE_COTIZA) + ', cotba.tb_descripcion, NULL) cotba, cotre.tb_descripcion cotre,' +
          ' sc_fecharevision, sc_usuariorevision, sc_fechaexcepcion, sc_usuarioexcepcion, cotex.tb_descripcion motivoexcepcion,' +
          ' sc_edadpromedio, sc_idzonageografica, sc_sumafijacompetencia, sc_porcvariablecompetencia, sc_costofijo931parcial,' +
          ' sc_porcvariable931parcial, sc_costofijocompetenciaparcial, sc_porcvariablecompetenciaparc, sc_pagocompetenciaparcial,' +
          ' sc_costofinalpagomensual, sc_idusuarioweb, sc_idgrupoeconomico, co_canttrabajador capitastecnica,' +
          ' co_masasalarial masasalarialtecnica, ac2.ac_codigo codigociiutecnica, ac2.ac_descripcion ciiutecnica, sc_sector,' +
          ' sc_idprobabilidadcierre, pn_detalle probabilidadcierre, fo_formulario, fo_fechaalta,' +
          ' co_establecimientos sc_establecimientos, sc_periodo, el_nombre,' +
          ' DECODE(sc_idformulario, NULL, NULL, ''Sí'') tienesolicitudafiliacion,' +
          ' (SELECT ce_fecha' +
             ' FROM ace_cotizacionevento' +
            ' WHERE ce_id = (SELECT MAX(ce_id)' +
                             ' FROM ace_cotizacionevento' +
                            ' WHERE ce_idsolicitudcotizacion = sc_id' +
                              ' AND ce_fechabaja IS NULL)) fechaultimoevento,' +
          ' (SELECT ce_descripcion' +
             ' FROM ace_cotizacionevento' +
            ' WHERE ce_id = (SELECT MAX(ce_id)' +
                             ' FROM ace_cotizacionevento' +
                            ' WHERE ce_idsolicitudcotizacion = sc_id' +
                              ' AND ce_fechabaja IS NULL)) descripcionultimoevento, sc_idformulario, sc_fechavigencia,' +
          ' (SELECT FLOOR(SYSDATE - fo_fechaalta)' +
             ' FROM afo_formulario' +
            ' WHERE fo_id = sc_idformulario) dias_suscripcionafi, sc_porcdescuento, sc_valor_rc, sc_sumaasegurada_rc, sc_porcaumento,' +
          ' sc_poliza_rc, ec_nombre, art.cotizacion.get_suma_fija_competencia(sc_id) sumafijacomp,' +
          ' art.cotizacion.get_porcentaje_variable_comp(sc_id) porcvarcomp, reusa.tb_descripcion usuarioautorizacion,' +
          ' sc_observacionescierrecom, sc_motivonoautocotizacion, sc_motivoexcepcion, sc_codmotivorevision,' +
          ' ir_fechaimpresion fimpresionsolicafi, cotizaciones.co_comision,' +
          ' (SELECT NULLIF(GREATEST(FLOOR((cotizaciones.co_fechacerrado + 1 + CASE' +
                                           ' WHEN(ca_tipo = ''B'') THEN 60' +
                                           ' ELSE 30' +
                                         ' END)' +
                                        ' - SYSDATE),' +
                                  ' -1),' +
                         ' -1)' +
             ' FROM DUAL) AS diasvencimiento,' +
          ' co_orden, co_nrocotizacion || ''/'' || co_orden nrocotiorden,' +
          ' CASE WHEN sc_porcaumento < 0 THEN NULL ELSE sc_porcaumento END AS porc_aumento,' +
          ' CASE WHEN sc_porcaumentotope < 0 THEN NULL ELSE sc_porcaumentotope END AS tope_aumento,' +
          ' CASE WHEN sc_porcdescuento < 0 THEN NULL ELSE sc_porcdescuento END AS porc_descuento,' +
          ' CASE WHEN sc_porcdescuentotope < 0 THEN NULL ELSE sc_porcdescuentotope END AS tope_descuento,' +
          ' co_sumafijapiso, co_porcvariablepiso, co_costofinalpiso, co_comisionpiso, sc_sumafijatarifario, sc_porcvariabletarifario, co_acpo,' +
          ' sc_prestaciones_especiales,' +
          ' (SELECT     en_nombre' +
             ' FROM xgo_granorganizador, xen_entidad' +
            ' WHERE go_identorganizador = en_id' +
              ' AND go_fechabaja IS NULL' +
              ' AND go_fechaaprobado IS NOT NULL' +
              ' AND LEVEL = 1' +
       ' START WITH go_identidad = ev_identidad' +
       ' CONNECT BY NOCYCLE PRIOR go_identorganizador = go_identidad) organizador, sc_dias_respuesta, sc_cotizacion_pcp, sc_formajuridica, sc_micropyme' +
     ' FROM asc_solicitudcotizacion sc, aco_cotizacion cotizaciones, ctb_tablas est, ctb_tablas stsrt, ctb_tablas stbcr, ctb_tablas errco, ctb_tablas cotba,' +
          ' ctb_tablas cotmc, ctb_tablas cotre, ctb_tablas cotex, aca_canal canal, aco_contrato contratos, age_grupoeconomico hold, atc_tarifacobrar,' +
          ' cac_actividad ac1, aar_art art, xve_vendedor, xen_entidad, asu_sucursal, acr_centroregional, cac_actividad ac2, afo_formulario,' +
          ' afi.apn_probabilidadcierrenegocio, del_delegacion, aec_ejecutivocuenta, ctb_tablas reusa, asa_solicitudafiliacion, web.wir_impresionesrgrl,' +
          ' xev_entidadvendedor' +
    ' WHERE sc_idcotizacion = co_id' +
      ' AND est.tb_codigo(+) = cotizaciones.co_estado' +
      ' AND est.tb_clave(+) = ''ACOES''' +
      ' AND stsrt.tb_clave(+) = ''STSRT''' +
      ' AND stsrt.tb_codigo(+) = sc_statussrt' +
      ' AND stbcr.tb_clave(+) = ''STBCR''' +
      ' AND stbcr.tb_codigo(+) = sc_statusbcra' +
      ' AND errco.tb_clave(+) = ''ERRCO''' +
      ' AND errco.tb_codigo(+) = sc_error' +
      ' AND cotba.tb_clave(+) = ''COTBA''' +
      ' AND cotba.tb_codigo(+) = sc_motcancelacion' +
      ' AND cotmc.tb_clave(+) = ''COTMC''' +
      ' AND cotmc.tb_codigo(+) = sc_motcancelacion' +
      ' AND cotre.tb_clave(+) = ''COTRE''' +
      ' AND cotre.tb_codigo(+) = sc_codmotivorevision' +
      ' AND cotex.tb_clave(+) = ''COTEX''' +
      ' AND cotex.tb_codigo(+) = sc_codmotivoexcepcion' +
      ' AND reusa.tb_clave(+) = ''REUSA''' +
      ' AND reusa.tb_codigo(+) = co_puestoautorizacion' +
      ' AND canal.ca_id = sc_canal' +
      ' AND EXISTS(SELECT 1' +
                   ' FROM auc_usuariocanal' +
                  ' WHERE uc_usuario = ' + SqlValue(Sesion.UserID) +
                    ' AND uc_idcanal = canal.ca_id' +
                    ' AND uc_fechabaja IS NULL)' +
      ' AND hold.ge_id(+) = sc_idgrupoeconomico' +
      ' AND art.ar_id(+) = sc_idartanterior' +
      ' AND sc_idvendedor = ve_id(+)' +
      ' AND sc_idsucursal = su_id(+)' +
      ' AND sc_identidad = en_id(+)' +
      ' AND sc_idactividad = ac1.ac_id(+)' +
      ' AND su_idcentroreg = cr_id(+)' +
      ' AND cotizaciones.co_idactividad = ac2.ac_id(+)' +
      ' AND sc_idformulario = fo_id(+)' +
      ' AND sc_idprobabilidadcierre = pn_id(+)' +
      ' AND sc_iddelegacion = el_id(+)' +
      ' AND en_idejecutivo = ec_id(+)' +
      ' AND ve_id = ev_idvendedor(+)' +
      ' AND ev_fechabaja(+) IS NULL' +
      ' AND sc_id = sa_idsolicitudcotizacion(+)' +
      ' AND sa_id = ir_idsolicitudafiliacion(+)' +
      ' AND ir_idtipopdf(+) = 1' +
      ' AND art.cotizacion.essuscripciones(sc_usuariosolicitud, ' + SqlValue(Sesion.UserID) + ') = 1' +
      ' AND contratos.co_idformulario(+) = sc_idformulario' +
      ' AND tc_id(+) = art.cotizacion.get_idultimatarifa(co_id)';

  if not fraEstado.IsEmpty then
    Aux2 := Aux2 + ' AND cotizaciones.co_estado ' + fraEstado.InSql;

  if not edNumeroCotizacion.IsEmpty then
    Aux2 := Aux2 + ' AND co_nrocotizacion = ' + SqlValue(edNumeroCotizacion.Value);

  if not edOrden.IsEmpty then
    Aux2 := Aux2 + ' AND co_orden = ' + SqlValue(edOrden.Value);

	Aux2 := Aux2 + SqlBetweenDateTime(' AND sc_fechacierre', cmbCO_FECHACERRADODesde.Date, cmbCO_FECHACERRADOHasta.Date, True);
  sWhere := sWhere + DoFiltroComponente(edSC_NROSOLICITUD, 'SC_NROSOLICITUD')
                   + DoFiltroComponente(edSC_TELEFONO, 'SC_TELEFONO')
                   + SqlBetweenDateTime(' AND sc_fechasolicitud', cmbSC_FECHASOLICITUDDesde.Date, cmbSC_FECHASOLICITUDHasta.Date, True)
                   + DoFiltroComponente(edSC_CONTACTO, 'SC_CONTACTO', 'LIKE')
                   + DoFiltroComponente(edSC_RAZONSOCIAL, 'SC_RAZONSOCIAL', 'LIKE')
                   + DoFiltroComponente(fraSC_USUARIOSOLICITUD, 'SC_USUARIOSOLICITUD')
                   + DoFiltroComponente(edSC_IDEVENTO, 'SC_IDEVENTO')
                   + DoFiltro          (gbOrigen);

  if edSC_CUIT.Text <> '' then
    sWhere := sWhere + ' AND sc_cuit = ' + SqlValue(edSC_CUIT.Text);

  if cmbEventos.ItemIndex > 0 then
    sWhere := sWhere + ' AND DECODE(afiliacion.is_solicitudtieneeventos(sc_id), ''S'', ''1'', ''2'') = ' + IntToStr(cmbEventos.ItemIndex);

  if rgOrigenSolicitud.ItemIndex > 0 then
    sWhere := sWhere + ' AND sc_idevento IS ' + IIF(rgOrigenSolicitud.ItemIndex = 1, 'NOT ', '') + 'NULL';

  if not fraMotivoCancelacion2.IsEmpty then
    sWhere := sWhere + ' AND sc_motcancelacion = ' + SqlValue(fraMotivoCancelacion2.Value);

  if checkResultadoOk.Checked and checkResultadoOut.Checked then
    sWhere := sWhere + ' AND sc_fechavigencia IS NOT NULL' +
                       ' AND sc_form931 IS NOT NULL'
  else if checkResultadoOk.Checked then
    sWhere := sWhere + ' AND sc_fechavigencia IS NOT NULL' +
                       ' AND sc_form931 IS NOT NULL' +
                       ' AND art.cotizacion.get_prima_x_capita_competencia(sc_id) >= art.cotizacion.get_prima_x_capita(sc_id)'
  else if checkResultadoOut.Checked then
    sWhere := sWhere + ' AND sc_fechavigencia IS NOT NULL' +
                       ' AND sc_form931 IS NOT NULL' +
                       ' AND art.cotizacion.get_prima_x_capita_competencia(sc_id) < art.cotizacion.get_prima_x_capita(sc_id)';

  if not fraHoldingBuscar.IsEmpty then
    sWhere := sWhere + ' AND sc_idgrupoeconomico = ' + SqlValue(fraHoldingBuscar.Value) + ' ';

  if checkVerPedidosWeb.Checked then
    sWhere := sWhere + ' AND sc_idusuarioweb IS NOT NULL';

  if chkUltimaSolicitud.Checked then
    sWhere := sWhere + ' AND sc.sc_id = (SELECT MAX(sol.sc_id) FROM asc_solicitudcotizacion sol WHERE sol.sc_cuit = sc.sc_cuit)';

  if checkEntidadesEnTramite.Checked then
    sWhere := sWhere + ' AND en_entramite = ''S''';

  if edNumeroSolicitudAfiliacion.Text <> '' then
    sWhere := sWhere + ' AND fo_formulario = ' + SqlValue(edNumeroSolicitudAfiliacion.Text);

  if edContrato.Value > 0 then
    sWhere := sWhere + ' AND contratos.co_contrato = ' + SqlValue(edContrato.Value);

  if checkEnTramite.Checked then
    sWhere := sWhere + ' AND EXISTS (SELECT 1 FROM asa_solicitudafiliacion WHERE sa_idformulario = fo_id AND sa_estado = ''20'')';

  if edFechaAprobacionAutomaticaDesde.Date > 0 then
    sWhere := sWhere + ' AND fo_fechaalta >= ' + SqlDate(edFechaAprobacionAutomaticaDesde.Date);

  if edFechaAprobacionAutomaticaHasta.Date > 0 then
    sWhere := sWhere + ' AND fo_fechaalta < ' + SqlDate(edFechaAprobacionAutomaticaHasta.Date + 1);

  if not fraCanalBusqueda.IsEmpty then
    sWhere := sWhere + ' AND sc_canal ' + fraCanalBusqueda.InSql;

  if not fraOrganizador.IsEmpty then
    sWhere := sWhere + ' AND sc_identidad IN (SELECT en_id' +
                                              ' FROM xen_entidad' +
                                             ' WHERE en_id = ' + SqlValue(fraOrganizador.Value) +
                                             ' UNION' +
                                            ' SELECT go_identidad' +
                                              ' FROM xgo_granorganizador' +
                                             ' WHERE go_fechabaja IS NULL' +
                                               ' AND go_fechaaprobado IS NOT NULL' +
                                        ' START WITH go_identorganizador = ' + SqlValue(fraOrganizador.Value) +
                                  ' CONNECT BY NOCYCLE PRIOR go_identidad = go_identorganizador)';

  if not fraDelegacionBusqueda.IsEmpty then
    sWhere := sWhere + ' AND sc_iddelegacion ' + fraDelegacionBusqueda.InSql;

  if not fraCIIUFiltro.IsEmpty then
    sWhere := sWHere + ' AND (sc_idactividad = ' + (SqlValue(fraCIIUFiltro.Value)) +
                           ' OR sc_idactividad2 = ' + (SqlValue(fraCIIUFiltro.Value)) +
                           ' OR sc_idactividad3 = ' + (SqlValue(fraCIIUFiltro.Value)) + ')';

  if chkSoloPCPBusqueda.Checked then
    sWhere := sWhere + ' AND sc_cotizacion_pcp = ''S''';

  sSql := '';
  EsCotizacion := (rbCotizaciones.Checked) or (not edNumeroCotizacion.IsEmpty);
  EsSolicitud  := rbSolicitudes.Checked;

  Aux1 := Aux1 + sCantTrab;

  // Reemplazo el nombre de la columna en las solicitudes para no repetir todo el lío que hice arriba para armar el
  // sCantTrab -> AND (1=2, or CO_... = ..., ...)

  ReplaceString(sCantTrab, 'sc_canttrabajador', 'co_canttrabajador');
  Aux2 := Aux2 + sCantTrab;

  if EsCotizacion then
    sSql := Aux2 + sWhere
  else if EsSolicitud then
    sSql := Aux1 + sWhere
  else
    sSql := Aux2 + sWhere + ' UNION ALL ' + Aux1 + sWhere;

  OpenQuery(sdqConsulta, sSql + SortDialog.OrderBy, True);
  CalcularTotales;
  CheckButtons;
end;

procedure TfrmConsultaSolicitud.fpAbmShow(Sender: TObject);
var
  sSql: String;
begin
  with sdqConsulta do
  begin
    if (ModoABM <> maAlta) and (FieldByName('sc_fechabaja').AsString <> '') then
    begin
      LockSolicitud := True;
      MessageDlg('La solicitud ha sido dada de baja.', mtError, [mbOK], 0);
    end
    else if (ModoABM <> maAlta) and ((FieldByName('co_estado').AsString = EC_NO_SE_COTIZA) or
                                     (FieldByName('co_estado').AsString = EC_CERRADA_SIN_INFORMACION) or
                                     (FieldByName('co_estado').AsString = EC_CERRADA_MAL) or
                                     (FieldByName('co_estado').AsString = EC_CERRADA_BIEN) or
                                     (FieldByName('co_estado').AsString = EC_CERRADO_AUTOMATICO) or
                                     (FieldByName('co_estado').AsString = EC_CERRADA_COMERCIALIZADOR) or
                                     (FieldByName('co_estado').AsString = EC_CERRADA_SOLICITA_NUEVA) or
                                     (FieldByName('co_estado').AsString = EC_CERRADA_VENCIDA_SIN_IMPRESION) or
                                     (FieldByName('co_estado').AsString = EC_CERRADA_VENCIDA_CON_IMPRESION) or
                                     (FieldByName('co_estado').AsString = EC_CERRADA_TRASPASO_OBJETADO) or
                                     (FieldByName('co_estado').AsString = EC_CERRADA_CONTRATO_ART)) then
    begin
      LockSolicitud := True;
    end
    else if (ModoABM <> maAlta) and
            ((FieldByName('sc_idcotizacion').AsString  <> '') or (FieldByName('tc_sumafija').AsString <> '')) and
            (FieldByName('co_estado').AsString <> EC_CLONADA) then
    begin
      LockSolicitud := True;
      MessageDlg('No se puede modificar una solicitud que posee cotización.', mtError, [mbOK], 0);

    end
    else if (ModoABM <> maAlta) and (FieldByName('co_estado').AsString = EC_ASIGNADA) then
    begin
      LockSolicitud := True;
      MessageDlg('No se puede modificar una solicitud que ha sido asignada.', mtError, [mbOK], 0);
    end
    else if (ModoABM <> maAlta) and (FieldByName('co_estado').AsString = EC_CON_ERRORES) then
    begin
      LockSolicitud := True;
      MessageDlg('No se puede modificar una solicitud en estado No Cotizable.', mtError, [mbOK], 0)
    end
    else
      LockSolicitud := False;

    VCLExtra.LockControls([btnCancelar, pnCancelar, sbtnCancelar, btnHistorialVigencias], False);
    VCLExtra.LockControls(gbCotizacion, True);
    VCLExtra.LockControls(gbSolicitud, True);
    VCLExtra.LockControls(edfpSC_OBSERVACIONESCIERRE, True);
    VCLExtra.LockControls([edfpSC_CANTTRABAJADOR], True);
    VCLExtra.LockControls([frafpIDCENTROREG], True);
    VCLExtra.LockControls([edCPTMA], True);
    VCLExtra.LockControls([checkIncluyeIva], True);

    edTC_SUMAFIJA.Visible       := (ModoABM <> maAlta);
    edTC_COSTOFINAL.Visible     := (ModoABM <> maAlta);
    edTC_PORCVARIABLE.Visible   := (ModoABM <> maAlta);
    edDescuentoAplicado.Visible := (ModoABM <> maAlta);
    edAumentoAplicado.Visible   := (ModoABM <> maAlta);

    if ModoABM = maAlta then
    begin
      CambiaActividad(nil);
      CambiaCanal(nil);
    end;
    fraStatusSRTExit(nil);

    if Active then
    begin
      edTC_SUMAFIJA.Value         := FieldByName('tc_sumafija').AsFloat;
      edTC_PORCVARIABLE.Value     := FieldByName('tc_porcvariable').AsFloat;
      edTC_COSTOFINAL.Value       := FieldByName('tc_costofinal').AsFloat;
      edDescuentoAplicado.Value   := FieldByName('sc_porcdescuento').AsFloat;
      edDescuentoAplicado.Visible := (edDescuentoAplicado.Value > 0);
      edAumentoAplicado.Value     := FieldByName('sc_porcaumento').AsFloat;
      edAumentoAplicado.Visible   := (edAumentoAplicado.Value > 0);
    end;

    if FEsClonacion then
    begin
      edSC_PORCCOMISION.Value := GetComision(FieldByName('sc_idvendedor').AsInteger, FieldByName('sc_sector').AsString, FieldByName('sc_canttrabajador').AsInteger, edfpSC_IDGRUPOECONOMICO.Value);
      FComisionCalculada := True;
    end;

    if LockSolicitud then
      sgGridPCP.Options := (sgGridPCP.Options - [goEditing])
    else
      sgGridPCP.Options := (sgGridPCP.Options + [goEditing]);

    tbAgregar.Visible    := not LockSolicitud;
    tbModificar2.Visible := tbAgregar.Visible;
    tbEliminar3.Visible  := tbAgregar.Visible;

    sSql :=
      'DELETE FROM afi.aeu_establecimientos' +
           ' WHERE eu_idsolicitud = -1' +
             ' AND eu_usualta = :usualta' +
             ' AND eu_usuarioweb = ''F''';
    EjecutarSqlEx(sSql, [Sesion.UserID]);
    RefrescarEstablecimientos(FIdSolicitud);

    ScrollBox.VertScrollBar.Position := 0;

    if (ModoABM = maAlta) then
    begin
      edDescuentoAplicado.Enabled := True;
      edDescuentoAplicado.Visible := True;
      edDescuentoAplicado.Clear;

      edAumentoAplicado.Enabled := True;
      edAumentoAplicado.Visible := True;
      edAumentoAplicado.Clear;
    end;
    
    HabilitarGroupBoxResponsabilidadCivil(ModoABM <> maAlta);
  end;

  edfpSC_CUIT.SetFocus; //Focus arriba de todo al abrir.
end;

procedure TfrmConsultaSolicitud.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  sEstado: String;
begin
  if HighLight then
    AFont.Color := clWhite
  else
  begin
    sEstado := sdqConsulta.FieldByName('co_estado').AsString;
    if (sEstado = EC_PEND_COTIZ) or (sEstado = EC_ASIGNADA)  then
      AFont.Color := clGray;
    if (sEstado = EC_CERRADA_MAL) then
      AFont.Color := clGreen;
    if (sEstado = EC_CANCELADA) or (sEstado = EC_NO_SE_COTIZA) or (sEstado = EC_CERRADA_SIN_INFORMACION) then
      AFont.Color := clRed;
  end;
end;

procedure TfrmConsultaSolicitud.frafpSC_ENTIDADExit(Sender: TObject);
begin
  inherited;

  frafpSC_ENTIDAD.FrameExit(Sender);
  frafpSC_VENDEDOR.Entidad := frafpSC_ENTIDAD.Value;
end;

procedure TfrmConsultaSolicitud.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edSC_NROSOLICITUD.Clear;
  edNumeroCotizacion.Clear;
  edOrden.Clear;
  edSC_CUIT.Clear;
  edSC_RAZONSOCIAL.Clear;
  edSC_CONTACTO.Clear;
  edSC_TELEFONO.Clear;
  fraSC_USUARIOSOLICITUD.Clear;
  rbAmbos.Checked := True;
  fraEstado.Clear;
  fraCanalBusqueda.Clear;
  fraSC_IDENTIDAD.Clear;
  fraOrganizador.Clear;
  fraEN_IDEJECUTIVO.Clear;
  fraSC_IDSUCURSAL.Clear;
  fraSC_IDVENDEDOR.Clear;
  fraDelegacionBusqueda.Clear;
  fraSU_IDCENTROREG.Clear;
  cmbSC_FECHASOLICITUDDesde.Clear;
  cmbSC_FECHASOLICITUDHasta.Clear;
  cmbCO_FECHACERRADODesde.Clear;
  cmbCO_FECHACERRADOHasta.Clear;
  cmbEventos.ItemIndex := 0;
  rgOrigenSolicitud.ItemIndex := 0;
  edSC_IDEVENTO.Clear;
  fraMotivoCancelacion2.Clear;
  checkResultadoOk.Checked := False;
  checkResultadoOut.Checked := False;
  fraHoldingBuscar.Clear;
  chkCantTrab1.Checked := False;
  chkCantTrab2.Checked := False;
  chkCantTrab3.Checked := False;
  chkCantTrab4.Checked := False;
  chkCantTrab5.Checked := False;
  chkCantTrab6.Checked := False;
  edOtrosDesde.Clear;
  edOtrosHasta.Clear;
  checkVerPedidosWeb.Checked := False;
  chkUltimaSolicitud.Checked := False;
  checkEntidadesEnTramite.Checked := False;
  edNumeroSolicitudAfiliacion.Clear;
  edContrato.Clear;
  checkEnTramite.Checked := False;
  edFechaAprobacionAutomaticaDesde.Clear;
  edFechaAprobacionAutomaticaHasta.Clear;
  fraCIIUFiltro.Clear;
  chkSoloPCPBusqueda.Checked := False;
end;

procedure TfrmConsultaSolicitud.tbEliminarClick(Sender: TObject);
var
  sEstado: String;
  sNumeroAfiliacion: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    if not Active then
      Exit;

    if FieldByName('sc_idformulario').IsNull then
    begin
      Verificar(((FieldByName('sc_fechavigencia').AsDateTime + 30) < DBDate), nil, 'La solicitud de cotización no está vigente.');

      sEstado := EC_CERRADA_COMERCIALIZADOR;
      if not MsgAsk('¿ Realmente desea dar de baja la solicitud de cotización seleccionada ?') then
        Exit;
    end
    else
    begin
       sSql :=
        'SELECT 1' +
         ' FROM asa_solicitudafiliacion' +
        ' WHERE sa_idformulario = :idformulario' +
          ' AND sa_fecharecepcionsectorafi IS NULL';
      if ExisteSqlEx(sSql, [FieldByName('sc_idformulario').AsInteger]) then   // Si la afiliación se imprimió y no fué presentada en Provart..
      begin
        if (FieldByName('sc_fechavigencia').AsDateTime + 30) >= DBDate then    // Si está vigente..
        begin
          sSql :=
            'SELECT ''00051-'' || NVL(fo_cuit, uw_cuitsuscripcion) || ''-'' || fo_formulario' +
             ' FROM asc_solicitudcotizacion, afo_formulario, afi.auw_usuarioweb' +
            ' WHERE sc_idformulario = fo_id(+)' +
//              ' AND sc_usuariosolicitud = uw_usuario(+)' +
              ' AND DECODE(SUBSTR(sc_usuariosolicitud, 1, 2), ''W_'', SUBSTR(sc_usuariosolicitud, 3, 50), sc_usuariosolicitud) = uw_usuario(+)' +
              ' AND sc_id = :id';
          sNumeroAfiliacion := ValorSqlEx(sSql, [FieldByName('sc_id').AsString]);

          sEstado := EC_CERRADA_COMERCIALIZADOR;
          if not MsgAsk(Format('Estimado %s:' + #13#10 +
                               'Mediante la opción "Sí" procederá a dar de baja la solicitud seleccionada:' + #13#10 +
                               'Nº de Solicitud de Afiliación %s' + #13#10 +
                               'C.U.I.T. %s' + #13#10 +
                               'RAZÓN SOCIAL %s' + #13#10 +
                               'siendo su responsabilidad la destrucción de los papeles impresos.' + #13#10 +
                               'Las solicitudes dadas de baja no pueden ser presentadas en Provincia ART,' +
                               ' quedando bajo su responsabilidad los efectos derivados de la falta de presentación.',
                               [Sesion.Usuario, sNumeroAfiliacion, FieldByName('sc_cuit').AsString,
                                FieldByName('sc_razonsocial').AsString])) then
            Exit;
        end
        else
        begin
          sEstado := EC_CERRADA_VENCIDA_CON_IMPRESION;
          if not MsgAsk('¿ Realmente desea dar de baja la solicitud de cotización seleccionada ?') then
            Exit;
        end;
      end;
    end;

    if sEstado = '' then
      raise Exception.Create('Estado inválido!');

    BeginTrans;
    try
      sSql :=
        'UPDATE asa_solicitudafiliacion' +
          ' SET sa_cotizacioncerrada = ''T'',' +
              ' sa_estado = :estado' +
        ' WHERE sa_idformulario = :idformulario';
      EjecutarSqlSTEx(sSql, [sEstado, FieldByName('sc_idformulario').AsInteger]);

      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_estado = :estado,' +
              ' sc_fechabaja = SYSDATE,' +
              ' sc_fechacierre = SYSDATE,' +
              ' sc_usubaja = :usubaja' +
        ' WHERE sc_id = :id';
      EjecutarSqlSTEx(sSql, [sEstado, Sesion.UserID, FieldByName('sc_id').AsInteger]);
      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [FieldByName('sc_id').AsInteger]);

      sSql :=
        'UPDATE aco_cotizacion' +
          ' SET co_estado = :estado' +
        ' WHERE co_id = :idcotizacion';
      EjecutarSqlSTEx(sSql, [sEstado, FieldByName('sc_idcotizacion').AsInteger]);
      CommitTrans;
      MsgBox('La solicitud ha sido cerrada.');
    except
      on E: Exception do
      begin
        Rollback;
        MsgBox(E.Message);
      end;
    end;
  end;
end;

procedure TfrmConsultaSolicitud.tbModificarClick(Sender: TObject);
begin
  ClearControls;
  inherited;
end;

procedure TfrmConsultaSolicitud.fraSC_IDENTIDADExit(Sender: TObject);
begin
  inherited;

  fraSC_IDENTIDAD.FrameExit(Sender);
  fraSC_IDSUCURSAL.Entidad := fraSC_IDENTIDAD.Value;
  fraSC_IDVENDEDOR.Entidad := fraSC_IDENTIDAD.Value;
end;

procedure TfrmConsultaSolicitud.fraSC_IDVENDEDORExit(Sender: TObject);
begin
  inherited;

  fraSC_IDVENDEDOR.FrameExit(Sender);
  fraSC_IDENTIDAD.Vendedor := fraSC_IDVENDEDOR.Value;
end;

procedure TfrmConsultaSolicitud.tbEnviarCartaClick(Sender: TObject);
begin
  tbEnviarCarta.CheckMenuDropdown;
end;

procedure TfrmConsultaSolicitud.tbCerrarSolicitudClick(Sender: TObject);
var
  sEstado: String;
  sNumeroAfiliacion: String;
  sSql: String;
begin
  inherited;

  if (not sdqConsulta.Active) or (sdqConsulta.Eof) or
     ((sdqConsulta.FieldByName('co_estado').AsString <> EC_NOTIF_CLIENTE) and
     (sdqConsulta.FieldByName('co_estado').AsString <> EC_SOLICITUD_AFILIACION_TRAMITE)) then
    InfoHint(nil, 'Debe elegir una solicitud de cotizacion con estado "Notificada" o "Solicitud Afiliación en trámite".', True);

  if sdqConsulta.FieldByName('co_estado').AsString = EC_SOLICITUD_AFILIACION_TRAMITE then
  begin
    sSql :=
      'SELECT ''00051-'' || NVL(fo_cuit, uw_cuitsuscripcion) || ''-'' || fo_formulario' +
       ' FROM asc_solicitudcotizacion, afo_formulario, afi.auw_usuarioweb' +
      ' WHERE sc_idformulario = fo_id(+)' +
//        ' AND sc_usuariosolicitud = uw_usuario(+)' +
        ' AND DECODE(SUBSTR(sc_usuariosolicitud, 1, 2), ''W_'', SUBSTR(sc_usuariosolicitud, 3, 50), sc_usuariosolicitud) = uw_usuario(+)' +
        ' AND sc_id = :id';
    sNumeroAfiliacion := ValorSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsString]);

    if not MsgAsk(Format('Estimado %s:' + #13#10 +
                         'Mediante la opción "Sí" procederá a dar de baja la solicitud seleccionada:' + #13#10 +
                         'Nº de Solicitud de Afiliación %s' + #13#10 +
                         'C.U.I.T. %s' + #13#10 +
                         'RAZÓN SOCIAL %s' + #13#10 +
                         'siendo su responsabilidad la destrucción de los papeles impresos.' + #13#10 +
                         'Las solicitudes dadas de baja no pueden ser presentadas en Provincia ART,' +
                         ' quedando bajo su responsabilidad los efectos derivados de la falta de presentación.',
                         [Sesion.Usuario, sNumeroAfiliacion, sdqConsulta.FieldByName('sc_cuit').AsString,
                          sdqConsulta.FieldByName('sc_razonsocial').AsString])) then
      Exit;


    if not sdqConsulta.FieldByName('dias_suscripcionafi').AsInteger <= 30 then
      sEstado := EC_CERRADA_COMERCIALIZADOR
    else
      sEstado := EC_CERRADA_VENCIDA_CON_IMPRESION;

    if not sdqConsulta.FieldByName('sc_idformulario').IsNull then
    begin
      sSql :=
        'UPDATE asa_solicitudafiliacion' +
          ' SET sa_cotizacioncerrada = ''T'',' +
              ' sa_estado = :estado' +
        ' WHERE sa_idformulario = :idformulario';
      EjecutarSqlSTEx(sSql, [sEstado, sdqConsulta.FieldByName('sc_idformulario').AsInteger]);
    end;

    sSql :=
      'UPDATE aco_cotizacion' +
        ' SET co_estadoanterior = co_estado,' +
            ' co_estado = :estado' +
      ' WHERE co_id = :id';
    EjecutarSqlSTEx(sSql, [sEstado, sdqConsulta.FieldByName('sc_idcotizacion').AsInteger]);

    sSql :=
      'UPDATE asc_solicitudcotizacion' +
        ' SET sc_estadoanterior = sc_estado,' +
            ' sc_estado = :estado' +
      ' WHERE sc_id = :id';
    EjecutarSqlSTEx(sSql, [sEstado, sdqConsulta.FieldByName('sc_id').AsInteger]);
    sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
    EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);
  end
  else
  begin
    edSC_OBSERVACIONESCIERRE.Lines.Text := sdqConsulta.FieldByName('sc_observacionescierre').AsString;
    fpCierre.Caption := 'Cierre de la solicitud';

    try
      gbMotivoCancelacion.Visible := False;
      rgEstados.Visible := True;
      rgEstados.ItemIndex := 0;

      if fpCierre.ShowModal = mrOk then
        case rgEstados.ItemIndex of
          0:  DoCerrarSolicitud(EC_CERRADA_MAL);
          1:  DoCerrarSolicitud(EC_CERRADA_BIEN);
        end;
    finally
      gbMotivoCancelacion.Visible := True;
      rgEstados.Visible := False;
    end;
  end;
end;

procedure TfrmConsultaSolicitud.btnAceptar2Click(Sender: TObject);
begin
  if gbMotivoCancelacion.Visible then
  begin
    if fraMotivoCancelacion.Visible then
      Verificar((fraMotivoCancelacion.IsEmpty), fraMotivoCancelacion.edCodigo, 'Debe ingresar el motivo que indica porque no se realizó la cotización.');

    if fraMotivoRecotizacion.Visible then
      Verificar((fraMotivoRecotizacion.IsEmpty), fraMotivoRecotizacion.edCodigo, 'Debe ingresar el motivo que indica porque se pide una recotización.');

    if fraMotivoExcepcion.Visible then
      Verificar((fraMotivoExcepcion.IsEmpty), fraMotivoExcepcion.edCodigo, 'Debe ingresar el motivo que indica porque se pide una excepción.');
  end;

  Verificar((Trim(edSC_OBSERVACIONESCIERRE.Text) = ''), edSC_OBSERVACIONESCIERRE, 'El campo observaciones es obligatorio.');

  fpCierre.ModalResult := mrOk;
end;

procedure TfrmConsultaSolicitud.btnCancelar2Click(Sender: TObject);
begin
  fpCierre.ModalResult := mrCancel;
end;

procedure TfrmConsultaSolicitud.tbClonarClick(Sender: TObject);
begin
  Verificar((sdqConsulta.FieldByName('sc_cotizacion_pcp').AsString = 'S'), nil, 'Esta cotización no puede ser clonada porque es una cotización PCP.');

  Clonar;
end;

procedure TfrmConsultaSolicitud.btnAceptarClick(Sender: TObject);
begin
  if rbRCSi.Checked then
    Verificar(not (rb2.Checked or rb5.Checked or rb10.Checked), gbSeleccionRC, 'Ha seleccionado que suscribe Resp. Civil. Seleccione la suma asegurada por favor.');

  CalcularDatos931(edPeriodo);

  // Las lineas de abajo son por el ticket 44825..
  if (frafpSC_CANAL.Codigo = '2') and (edSC_PORCCOMISION.Value = 0) then
    btnCalcularComisionClick(nil);

  if Validar and DoABM then
  begin
    edSC_NROSOLICITUD.Text := FNroSolicitud;
    tbRefrescarClick(nil);
    fpABM.ModalResult := mrOk;
  end;
end;

procedure TfrmConsultaSolicitud.frafpSC_ENTIDADcmbDescripcionDropDown(Sender: TObject);
begin
  CambiaCanal(nil);
  inherited;
  frafpSC_ENTIDAD.cmbDescripcionDropDown(Sender);
end;

procedure TfrmConsultaSolicitud.fraSC_IDSUCURSALcmbDescripcionDropDown(Sender: TObject);
begin
  if fraSC_IDENTIDAD.IsSelected then
    fraSC_IDSUCURSAL.Entidad := fraSC_IDENTIDAD.Value;

  if fraSU_IDCENTROREG.IsSelected then
    fraSC_IDSUCURSAL.CentroReg := fraSU_IDCENTROREG.Value;

  inherited;

  fraSC_IDSUCURSAL.cmbDescripcionDropDown(Sender);
end;

procedure TfrmConsultaSolicitud.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.Active and not sdqConsulta.Eof then
    with sdqConsulta do
    begin
      FieldByName('co_acpo').OnGetText                  := FormateaTexto;
      FieldByName('co_comision').OnGetText              := FormateaTexto;
      FieldByName('co_comisionpiso').OnGetText          := FormateaTexto;
      FieldByName('co_costofinalpiso').OnGetText        := FormateaTexto;
      FieldByName('co_porcvariablepiso').OnGetText      := FormateaTexto;
      FieldByName('co_sumafijapiso').OnGetText          := FormateaTexto;
      FieldByName('costofinal').OnGetText               := FormateaTexto;
      FieldByName('difplata').OnGetText                 := FormateaTexto;
      FieldByName('difporc').OnGetText                  := FormateaTexto;
      FieldByName('masasalarialtecnica').OnGetText      := FormateaTexto;
      FieldByName('porc_aumento').OnGetText             := FormateaTexto;
      FieldByName('porc_descuento').OnGetText           := FormateaTexto;
      FieldByName('porcvarcomp').OnGetText              := FormateaTexto;
      FieldByName('sc_masasalarial').OnGetText          := FormateaTexto;
      FieldByName('sc_porcaumento').OnGetText           := FormateaTexto;
      FieldByName('sc_porcdescuento').OnGetText         := FormateaTexto;
      FieldByName('sc_porcvariabletarifario').OnGetText := FormateaTexto;
      FieldByName('sc_sumafijatarifario').OnGetText     := FormateaTexto;
      FieldByName('sumafijacomp').OnGetText             := FormateaTexto;
      FieldByName('tc_costofinal').OnGetText            := FormateaTexto;
      FieldByName('tc_porcvariable').OnGetText          := FormateaTexto;
      FieldByName('tc_sumafija').OnGetText              := FormateaTexto;
      FieldByName('tope_aumento').OnGetText             := FormateaTexto;
      FieldByName('tope_descuento').OnGetText           := FormateaTexto;
    end;

  with Grid do
  begin
    ColumnByField['co_sumafijapiso'].Visible     := FMostrarColumnasPiso;
    ColumnByField['co_porcvariablepiso'].Visible := FMostrarColumnasPiso;
    ColumnByField['co_costofinalpiso'].Visible   := FMostrarColumnasPiso;
    ColumnByField['co_comisionpiso'].Visible     := FMostrarColumnasPiso;
  end;

  Grid.ColumnByField['co_acpo'].Visible := Seguridad.Claves.IsActive('VerColumnaAcpo');
end;

procedure TfrmConsultaSolicitud.tbRefrescarCombosClick(Sender: TObject);              
begin
  fraCanalBusqueda.Clear;
  fraSC_IDENTIDAD.Reload;
  fraOrganizador.Reload;
  fraEN_IDEJECUTIVO.Reload;
  frafpSC_CANAL.ClearGrid;
  frafpSC_ENTIDAD.Reload;
  frafpSC_IDSUCURSAL.ClearGrid;
  fraSC_IDSUCURSAL.ClearGrid;
  frafpIDCENTROREG.ClearGrid;
  edfpSC_IDGRUPOECONOMICO.Clear;
  fraDelegacionBusqueda.Clear;
end;

procedure TfrmConsultaSolicitud.mnuMailClick(Sender: TObject);
begin
  NotificarAlCliente(True);
end;

procedure TfrmConsultaSolicitud.mnuImprimirCartaClick(Sender: TObject);
begin
  NotificarAlCliente(False);
end;

procedure TfrmConsultaSolicitud.fraSC_IDSUCURSALExit(Sender: TObject);
begin
  inherited;

  fraSC_IDSUCURSAL.FrameExit(Sender);
  fraSC_IDVENDEDOR.Entidad := fraSC_IDSUCURSAL.Entidad;
end;

procedure TfrmConsultaSolicitud.tbExcepcionClick(Sender: TObject);
begin
  if not sdqConsulta.Active or sdqConsulta.Eof then
    Exit;

  fraMotivoExcepcionRecotizacion.Clave := 'COTEX';

  if (sdqConsulta.FieldByName('co_estado').AsString = EC_CON_ERRORES) then
  begin
    memoObservaciones.Clear;

    fpDatosFaltantes.Caption := 'Solicitud de Excepción';

    if fpDatosFaltantes.ShowModal = mrOk then
      DoGuardarExcepcion;
  end
  else
  begin
//    if (sdqConsulta.FieldByName('co_estado').AsString <> EC_NOTIF_COMERCIAL) then
//      InfoHint(nil, 'La solicitud NO debe haber sido notificada al cliente para pedir recotización de la misma.', True);

    memoObservaciones.Lines.Text := sdqConsulta.FieldByName('sc_motivoexcepcion').AsString;
    fpDatosFaltantes.Caption := 'Recotización de la cotización';
    if fpDatosFaltantes.ShowModal = mrOk then
      DoPedirExcepcion;
  end;
end;

procedure TfrmConsultaSolicitud.edfpSC_CUITExit(Sender: TObject);
var
  aStatusSrt: TStatusSrt;
  sResultado: String;
  sSql: String;
begin
  Verificar((Length(edfpSC_CUIT.Text) = 11) and not(IsCuit(edfpSC_CUIT.Text)), edfpSC_CUIT, 'La C.U.I.T. no es correcta.');
  ValidarReservaCuit(edfpSC_CUIT.Text, False, edfpSC_CUIT);

  if not FLockSolicitud then
  begin
    sSql := 'SELECT art.cotizacion.get_permitecotizar(:cuit, ''C'') FROM DUAL';
    sResultado := Trim(ValorSqlEx(sSql, [edfpSC_CUIT.Text]));
    if (sResultado <> '') and (sResultado <> 'S') then
    begin
      MsgBox(sResultado);
      edfpSC_CUIT.SetFocus;
      Abort;
    end;
  end;

  if (fpAbm.Visible) and (not FLockSolicitud) and (edfpSC_CUIT.Enabled) and (IsCuit(edfpSC_CUIT.Text)) then
  begin
    aStatusSrt := ObtenerStatusSrt(edfpSC_CUIT.Text, FIdSolicitud);
    FStatusSrtOk := (aStatusSrt.Status <> '-1');
    fraStatusSRT.Value := aStatusSrt.Status;
    fraSC_IDARTANTERIOR.Value := aStatusSrt.ArtAnterior;

    VCLExtra.LockControls([fraSC_IDARTANTERIOR], (fraStatusSRT.Value <> '2') or ((fraStatusSRT.Value = '2') and (not fraSC_IDARTANTERIOR.IsEmpty)));

    if aStatusSrt.MsgError <> '' then
      MsgBox(aStatusSrt.MsgError, MB_ICONWARNING)
    else
    begin
      sSql :=
        'SELECT 1' +
         ' FROM srt.sem_empresas e JOIN srt.shv_historialvigencias v ON v.hv_id = art.cotizacion.get_idultimavigencia(em_cuit)' +
        ' WHERE CASE' +
                ' WHEN v.hv_idoperaciondesde = 10888 THEN ADD_MONTHS(v.hv_vigenciadesde, 10) + 11' +
                ' ELSE ADD_MONTHS(v.hv_vigenciadesde, 6)' +
              ' END <= SYSDATE' +
          ' AND e.em_cuit = :cuit';
      if (fraStatusSRT.Value <> '1') and (not ExisteSqlEx(sSql, [edfpSC_CUIT.Text])) then
        MsgBox('La C.U.I.T. ingresada NO cumple con la vigencia para una cotización / traspaso, según los datos en la SRT.', MB_ICONWARNING);

      if edfpSC_RAZONSOCIAL.Text = '' then
      begin
        sSql :=
          'SELECT em_nombre' +
           ' FROM srt.sem_empresas' +
          ' WHERE em_cuit = :cuit' +
       ' ORDER BY 1 DESC';
        edfpSC_RAZONSOCIAL.Text := ValorSqlEx(sSql, [edfpSC_CUIT.Text]);
      end;
    end;
    
    if (fraSC_IDARTANTERIOR.Value = 51) and ((fraStatusSRT.Value = '2') or (fraStatusSRT.Value = '5') or (fraStatusSRT.Value = '6') or (fraStatusSRT.Value = '7')) then
    begin
      MsgBox('Esta solicitud debe ser cargada como Revisión de Precio. (Motivo 06)', MB_ICONWARNING);
      fpAbm.Close;
      Exit;
    end;

    // Pedido el 4.2.2011 por Suscripción..
    VCLExtra.LockControls([fraStatusSRT], not fraStatusSRT.IsEmpty and not aStatusSrt.Error);

    ImportarDatosBCRA(nil);

    VerificarPCP;
  end;
end;

procedure TfrmConsultaSolicitud.ImportarDatosBCRA(Sender: TObject);
var
  aResultImportFromBCRA: TResultImportFromBCRA;
  bImportOk: Boolean;
begin
  // Importo el status del BCRA..
  aResultImportFromBCRA := ImportFromBCRA(edfpSC_CUIT.text, True, False);
  bImportOk := (not aResultImportFromBCRA.ProcesoCancelado) and (aResultImportFromBCRA.Error = '') and
               (aResultImportFromBCRA.CuitExistente[0]) and
               (aResultImportFromBCRA.SituacionMasComprometida[0] <> '0') and (aResultImportFromBCRA.Error = '');
  VclExtra.LockControl(fraStatusBCRA, bImportOk);

  if Length(aResultImportFromBCRA.Html) > 0 then
    FHtmlStatusBcra := aResultImportFromBCRA.Html[0];

  if bImportOk then
    fraStatusBCRA.Value := aResultImportFromBCRA.SituacionMasComprometida[0]
  else
    fraStatusBCRA.Clear;
end;

procedure TfrmConsultaSolicitud.frafpSC_IDACTIVIDADedCodigoExit(Sender: TObject);
begin
  inherited;

  ObtenerTarifaComercial;
end;

procedure TfrmConsultaSolicitud.frafpSC_IDACTIVIDADcmbDescripcionExit(Sender: TObject);
begin
  inherited;

  ObtenerTarifaComercial;
end;

procedure TfrmConsultaSolicitud.fpCierreResize(Sender: TObject);
begin
  inherited;

  edSC_OBSERVACIONESCIERRE.Height := gbObservaciones.Height - 25;
end;

{-------------------------ADMINISTRACION DE EVENTOS----------------------------}
procedure TfrmConsultaSolicitud.tbEventosClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir un registro.');

  lbSolicitud.Caption := 'Solicitud de cotización nº ' + sdqConsulta.FieldByName('sc_nrosolicitud').AsString;

  sSql := sdqACE_COTIZACIONEVENTO.SQL.Text;

  sdqACE_COTIZACIONEVENTO.ParamByName('ce_idsolicitudcotizacion').AsInteger := sdqConsulta.FieldByName('sc_id').AsInteger;

  LoadDynamicSortFields(SortDialogEventos.SortFields, dbgACE_COTIZACIONEVENTOS.Columns);

  sdqACE_COTIZACIONEVENTO.SQL.Text := sSql + SortDialogEventos.OrderBy;

  OpenQuery(sdqACE_COTIZACIONEVENTO);
  ActivarABM(False);

  fpEventos.ShowModal;

  sdqACE_COTIZACIONEVENTO.SQL.Text := sSql;
end;

procedure TfrmConsultaSolicitud.tb_ACE_NuevoClick(Sender: TObject);
begin
  with sdqACE_COTIZACIONEVENTO do
  begin
    Insert;
    FieldByName('ce_fechaalta').AsDateTime := DBDateTime;
    FieldByName('ce_usualta').AsString     := Sesion.UserID;
  end;
  ActivarABM(True);
end;

procedure TfrmConsultaSolicitud.tb_ACE_ModificarClick(Sender: TObject);
var
  bContinuar: Boolean;
begin
  bContinuar := True;

  if not sdqACE_COTIZACIONEVENTO.FieldByName('ce_fechabaja').IsNull then
    if not MsgAsk('El registro seleccionado ha sido dado de baja.' + CRLF + '¿ Desea restaurarlo ?') then
      bContinuar := False;

  if bContinuar then
  begin
    with sdqACE_COTIZACIONEVENTO do
    begin
      Edit;
      FieldByName('ce_fechamodif').AsDateTime := DBDateTime;
      FieldByName('ce_usumodif').AsString     := Sesion.UserID;
    end;
    ActivarABM(True);
  end;
end;

procedure TfrmConsultaSolicitud.tb_ACE_GuardarClick(Sender: TObject);
begin
  Verificar((cmbCE_FECHA.Date = 0), cmbCE_FECHA, 'La fecha es un dato obligatorio.');
  Verificar((edCE_DESCRIPCION.Text = ''), edCE_DESCRIPCION, 'La descripción es un dato obligatorio.');

  BeginTrans;
  with sdqACE_COTIZACIONEVENTO do
  try
    try
      if State = dsInsert then
      begin
        FieldByName('ce_id').AsInteger := GetSecNextVal('SEQ_AOE_ID');
        FieldByName('ce_idsolicitudcotizacion').AsInteger := sdqConsulta.FieldByName('sc_id').AsInteger;
      end;

      FieldByName('ce_fechabaja').AsVariant := Null;
      FieldByName('ce_usubaja').AsVariant := Null;
      ActivarABM(False);
      Post;
//      ApplyUpdates;
      CommitTrans;
    except
      on E: Exception do
      begin
        InvalidMsg(nil, 'Error al guardar.' + CRLF + E.Message);
        Cancel;
        CancelUpdates;
        Rollback;
      end;
    end;
  finally
    Close;
    OpenQuery(sdqACE_COTIZACIONEVENTO);
  end;
end;

procedure TfrmConsultaSolicitud.tb_ACE_CancelarClick(Sender: TObject);
begin
  try
    sdqACE_COTIZACIONEVENTO.Cancel;
    ActivarABM(False);
  finally
    //
  end;
end;

procedure TfrmConsultaSolicitud.tb_ACE_OrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialogEventos.SortFields, dbgACE_COTIZACIONEVENTOS.Columns);
  SortDialogEventos.Execute;
end;

procedure TfrmConsultaSolicitud.tb_ACE_EliminarClick(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea eliminar el evento ?') then
  begin
    BeginTrans;

    with sdqACE_COTIZACIONEVENTO do
    try
      Edit;
      FieldByName('ce_fechabaja').AsDateTime := DBDateTime;
      FieldByName('ce_usubaja').AsString     := Sesion.UserID;
      Post;
//      ApplyUpdates;
      CommitTrans;
    except
      on E: Exception do
      begin
        InvalidMsg(nil, 'Error al guardar.' + CRLF + E.Message);
        Cancel;
        CancelUpdates;
        Rollback;
      end;
    end;
  end;
end;

procedure TfrmConsultaSolicitud.dbgACE_COTIZACIONEVENTOSGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                                      var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if not Field.DataSet.FieldByName('ce_fechabaja').IsNull then
  begin
    AFont.Style := AFont.Style + [fsStrikeOut];
    AFont.Color := clRed;
  end;
end;

procedure TfrmConsultaSolicitud.dbgACE_COTIZACIONEVENTOSDblClick(Sender: TObject);
begin
  if tb_ACE_Modificar.Enabled then
    tb_ACE_Modificar.Click;
end;

procedure TfrmConsultaSolicitud.sdqACE_COTIZACIONEVENTOAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
    TDateTimeField(FieldByName('fecha')).DisplayFormat := 'dd/mm/yyyy hh:nn';
end;

procedure TfrmConsultaSolicitud.tb_ACE_ImprimirClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TqrEventos, qrEventos);
  try
    qrEventos.Preparar('C', sdqConsulta.FieldByName('sc_id').AsInteger);
  finally
    FreeAndNil(qrEventos);
  end;
end;

procedure TfrmConsultaSolicitud.frafpSC_IDSUCURSALcmbDescripcionDropDown(Sender: TObject);
begin
  if frafpIDCENTROREG.IsSelected then
    frafpSC_IDSUCURSAL.CentroReg := frafpIDCENTROREG.Value;

  inherited;
  frafpSC_IDSUCURSAL.cmbDescripcionDropDown(Sender);
end;

procedure TfrmConsultaSolicitud.fraSC_IDVENDEDORcmbDescripcionDropDown(Sender: TObject);
begin
  if fraSC_IDENTIDAD.IsSelected then
    fraSC_IDVENDEDOR.Entidad := fraSC_IDENTIDAD.Value;

  inherited;
  fraSC_IDVENDEDOR.cmbDescripcionDropDown(Sender);
end;

procedure TfrmConsultaSolicitud.btnCancelarClick(Sender: TObject);
var
  sSql: String;
begin

  if FEsClonacion then
    if not MsgAsk('¿ Realmente desea cancelar la carga de esta clonación ?') then
      Exit;

  inherited;

  fpAbm.ModalResult := mrCancel;

  if FEsClonacion and FEliminarSolicitud then
  begin
    BeginTrans;
    try
      sSql :=
        'DELETE FROM asc_solicitudcotizacion' +
             ' WHERE sc_nrosolicitud = :nrosolicitud';
      EjecutarSqlSTEx(sSql, [edSC_NROSOLICITUD.Value]);

      // Que no actualice el estado de las solicitudes canceladas..
      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_estado = sc_estadoanterior' +
        ' WHERE sc_estado <> :estado' +
          ' AND sc_id = :id';
      EjecutarSqlSTEx(sSql, [EC_CANCELADA, FIdSolicitudAnterior]);
      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlSTEx(sSql, [FIdSolicitudAnterior]);

      // Que no actualice el estado de las cotizaciones canceladas..
      sSql :=
        'UPDATE aco_cotizacion' +
          ' SET co_estado = co_estadoanterior' +
        ' WHERE co_estado <> :estado' +
          ' AND co_id = :id';
      EjecutarSqlSTEx(sSql, [EC_CANCELADA, FIdCotizacionAnterior]);

      CommitTrans;

      tbRefrescarClick(nil);
    except
      on E: Exception do
      begin
        Rollback;
        MsgBox('Ocurrió el siguiente error: ' + E.Message);
      end;
    end;
  end;
end;

procedure TfrmConsultaSolicitud.lbStatusBCRALinkClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', URL_STATUS_BCRA, nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmConsultaSolicitud.lbStatusSRTLinkClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.srt.gov.ar/consultas/vigencias/vigencias.asp', nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmConsultaSolicitud.btnAceptarCostosClick(Sender: TObject);
begin
  fpCostos.Close;
end;

procedure TfrmConsultaSolicitud.fpAbmClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  // Si por algún error al cerrar el formulario quedó la transacción activa, hago un rollback..
  Rollback(True);
end;

procedure TfrmConsultaSolicitud.fpCostosShow(Sender: TObject);
var
  ResultadoRC: Real;
  sSql: String;
  sSql2: String;
begin
  ceSumaFija.ReadOnly := True;
  ceSumaVariable.ReadOnly := True;
  ceCostoCapitas.ReadOnly := True;
  ceCostoMensual.ReadOnly := True;
  ceCostoAnual.ReadOnly := True;

  ceMasaSalarial.Value := edfpSC_MASASALARIAL.Value;

    //Descuento
  sSql :=
    'SELECT cotizacion.get_descuento(:cuit, :canttrabajador, :idactividad, :usuario)' +
     ' FROM DUAL';
  edDescuentoTope.Value := ValorSqlExtendedEx(sSql, [edfpSC_CUIT.Text, edfpSC_CANTTRABAJADOR.Value, frafpSC_IDACTIVIDAD.Value, Sesion.UserID]);

  edDescuento.Clear;

  gbDescuento.Visible := (edDescuentoTope.Value > 0);
  lbTituloDescuentoAplicado.Visible := gbDescuento.Visible;
  lbDescuentoAplicado.Caption := '-';
  lbDescuentoAplicado.Visible := gbDescuento.Visible;

  if edDescuentoTope.Value > 0 then
  begin
    edDescuento.MaxValue := edDescuentoTope.Value;
    lbTope.Caption := FormatFloat('0.##', edDescuentoTope.Value) + '% Tope';
    //edDescuento.SetFocus;
  end;

  //Aumento
  try
    sSql2 :=
      'SELECT art.cotizacion.get_aumento(:idactividad, :masacoti, :emplecoti, :sumafija, :porcvariable, :user)' +
       ' FROM DUAL';
    edAumentoTope.Value := ValorSqlExtendedEx (sSql2, [frafpSC_IDACTIVIDAD.Value,
                                                       edfpSC_MASASALARIAL.Value,
                                                       edfpSC_CANTTRABAJADOR.Value,
                                                       ceSumaFija.Value,
                                                       ceSumaVariable.Value,
                                                       Sesion.UserID]);
    edAumento.Clear;
    gbAumento.Visible := (edAumentoTope.Value > 0);

    lbTituloAumentoAplicado.Visible := gbAumento.Visible;
    lbAumentoAplicado.Caption := '-';
    lbAumentoAplicado.Visible := gbAumento.Visible;

    if edAumentoTope.Value > 0 then
    begin
      edAumento.MaxValue := edAumentoTope.Value;
      lbTopeAumento.Caption := FormatFloat('0.##', edAumentoTope.Value) + '% Tope';
    end;
  except
    gbAumento.Visible := False;
  end;

  ResultadoRC := GetValorResponsabilidadCivil(edfpSC_CUIT.Text, fraZonaGeografica.Codigo, FIdSolicitud, edfpSC_CANTTRABAJADOR.Value, GetSumaAseguradaRc,
                                              edfpSC_MASASALARIAL.Value, ceSumaVariable.Value, ceSumaFija.Value, edDescuento.Value);

  if (ResultadoRc >= 0) and (rbRCsi.Checked) then
  begin
    edSumaPolizaRc.Value := ResultadoRc;
    edSumaAsegurada.Value := GetSumaAseguradaRc;
  end
  else
  begin
    edSumaPolizaRc.Value := 0;
    edSumaAsegurada.Value := 0;
  end;

  //Cuota Inicial, es la cuenta de Alicuota_Variable * Masa Salarial /100.
  ceCuotaInicial.Value := edSumaPolizaRC.Value * ceMasaSalarial.Value / 100;

  ActualizarResultadosAutoCotizacion;
  VCLExtra.LockControls([ceCostoActual, edResultado, ceDiferencia, edSumaAsegurada, edSumaPolizaRC, ceMasaSalarial, ceCuotaInicial], True);
end;

procedure TfrmConsultaSolicitud.tbSalir2Click(Sender: TObject);
begin
  tbSalirClick(Sender);
end;

procedure TfrmConsultaSolicitud.fpCierreShow(Sender: TObject);
begin
  inherited;

  fraMotivoRecotizacion.Clear;
  fraMotivoExcepcion.Clear;
end;

procedure TfrmConsultaSolicitud.tbRecotizacionClick(Sender: TObject);
var
  aSqlSolCotizacion: TSql;
  sSql: String;
begin
  fraMotivoExcepcionRecotizacion.Clave := 'COTRE';
  memoObservaciones.Clear;
  fpDatosFaltantes.Caption := 'Solicitud de Recotización';

  if fpDatosFaltantes.ShowModal <> mrOk then
    Exit;


  if IsJefe then
  begin
    aSqlSolCotizacion := TSql.Create('asc_solicitudcotizacion');
    try
      aSqlSolCotizacion.SqlType := stUpdate;
      aSqlSolCotizacion.PrimaryKey.Add('sc_id', sdqConsulta.FieldByName('sc_id').AsInteger, False);

      aSqlSolCotizacion.Fields.Add('sc_codmotivorevision',    fraMotivoExcepcionRecotizacion.Value);
      aSqlSolCotizacion.Fields.Add('sc_edadpromedio',         edEdadPromedio.Value);
      aSqlSolCotizacion.Fields.Add('sc_establecimientos',     edCantidadEstablecimientos.Value);
      aSqlSolCotizacion.Fields.Add('sc_fecharevision',        SQL_ACTUALDATE, False);
      aSqlSolCotizacion.Fields.Add('sc_idprobabilidadcierre', fraProbabilidadCierre.Value);
      aSqlSolCotizacion.Fields.Add('sc_motivorevision',       memoObservaciones.Text);
//      aSqlSolCotizacion.Fields.Add('sc_porcaumento',          exNull);
//      aSqlSolCotizacion.Fields.Add('sc_porcdescuento',        exNull);
      aSqlSolCotizacion.Fields.Add('sc_sector',               fraSector2.Value);
      aSqlSolCotizacion.Fields.Add('sc_usuariorevision',      Sesion.UserId);

      if not sdqConsulta.FieldByName('sc_idusuarioweb').IsNull then
        aSqlSolCotizacion.Fields.Add('sc_usuariosolicitud', Sesion.UserID);

      if sdqConsulta.FieldByName('sc_idcotizacion').AsInteger > 0 then
        aSqlSolCotizacion.Fields.Add('sc_estado', EC_EN_PREPARACION)
      else
        aSqlSolCotizacion.Fields.Add('sc_estado', EC_PEND_COTIZ);

      EjecutarSql(aSqlSolCotizacion.Sql);

      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);
    finally
      aSqlSolCotizacion.Free;
    end;

    ActualizarZonaGeografica(sdqConsulta.FieldByName('sc_id').AsInteger, True);

    aSqlSolCotizacion := TSql.Create('aco_cotizacion');
    try
      aSqlSolCotizacion.SqlType := stUpdate;
      aSqlSolCotizacion.PrimaryKey.Add('co_id', sdqConsulta.FieldByName('sc_idcotizacion').AsInteger, False);

      aSqlSolCotizacion.Fields.Add('co_estado', EC_EN_PREPARACION);
      aSqlSolCotizacion.Fields.Add('co_establecimientos', edCantidadEstablecimientos.Value);

      EjecutarSql(aSqlSolCotizacion.Sql);
    finally
      aSqlSolCotizacion.Free;
    end;

    sSql :=
      'UPDATE acz_cotizador' +
        ' SET cz_edadpromedio = :edadpromedio,' +
            ' cz_establecimientos = :establecimientos,' +
            ' cz_idlocalidad = :idlocalidad,' +
            ' cz_idprobabilidadcierre = :idprobabilidadcierre,' +
            ' cz_idzonageografica = :idzonageografica,' +
            ' cz_sector = :sector' +
      ' WHERE cz_idcotizacion = :idcotizacion';
    EjecutarSqlEx(sSql, [edEdadPromedio.Value, edCantidadEstablecimientos.Value,
                         GetIdLocalidadEstablecimiento(sdqConsulta.FieldByName('sc_id').AsInteger),
                         fraProbabilidadCierre.Value,
                         GetIdZonaGeograficaEstablecimiento(sdqConsulta.FieldByName('sc_id').AsInteger),
                         fraSector2.Value, sdqConsulta.FieldByName('sc_idcotizacion').AsInteger]);
  end
  else
  begin
    sSql :=
      'BEGIN' +
       ' intraweb.do_solicpermisorecotijefe(:nedadpromedio, :nestablecimientos, :nidprobabilidadcierre, :nidsolicitud, :scodmotivorecotizacion, :sobservaciones, :ssector, :susuario, :destinatario);' +
     ' END;';
    EjecutarSqlEx(sSql, [edEdadPromedio.Value, edCantidadEstablecimientos.Value, fraProbabilidadCierre.Value, sdqConsulta.FieldByName('sc_id').AsInteger,
                         fraMotivoExcepcionRecotizacion.Value, memoObservaciones.Lines.Text, fraSector2.Value, Sesion.UserID, fraDestinoEmail.Codigo]);

    MsgBox('Su pedido fue enviado a un superior para que lo autorice, la respuesta la recibirá vía e-mail.');
  end;

  tbRefrescarClick(nil);
end;

procedure TfrmConsultaSolicitud.sdqConsultaAfterScroll(DataSet: TDataSet);
var
  bFechaPedidoOk: Boolean;
  sSql: String;
begin
  inherited;

  with sdqConsulta do
  begin
    sSql :=
      'SELECT 1' +
       ' FROM asc_solicitudcotizacion' +
      ' WHERE actualdate <=(TRUNC(sc_fechasolicitud) + 30)' +
        ' AND sc_id = :id';
    bFechaPedidoOk := ExisteSqlEx(sSql, [FieldByName('sc_id').AsInteger]);

    tbExcepcion.Enabled := (FPermisoExcepcion) and
                           (bFechaPedidoOk) and
                           ((not FieldByName('sc_error').IsNull) or (FieldByName('co_estado').AsString = EC_CON_ERRORES)) and
                           (FieldByName('co_orden').AsInteger = 0);
    tbRecotizacion.Enabled := (FPermisoRecotizacion) and (FieldByName('sc_idcotizacion').AsInteger = 0) and
                              ((FieldByName('co_estado').AsString = EC_NOTIF_CLIENTE) or
                              (FieldByName('co_estado').AsString = EC_NOTIF_COMERCIAL));
    tbRedireccionarEmailAutorizacion.Enabled := (FieldByName('co_estado').AsString = EC_PEND_AUTORIZ) or
                                                (FieldByName('co_estado').AsString = EC_PEND_AUTO_COBRANZA) or
                                                (FieldByName('co_estado').AsString = EC_PEND_AUTO) or
                                                (FieldByName('co_estado').AsString = EC_PEND_AUTO_LEGALES);
  end;
end;

procedure TfrmConsultaSolicitud.btnCalcularClick(Sender: TObject);
  function IsMesConSAC: Boolean;
  begin
    Result := (edPeriodo.Periodo.Mes = 6) or (edPeriodo.Periodo.Mes = 12);
  end;

begin
  if rbSinDatos.Checked then
    InfoHint(btnCalcular, 'No hay datos para calcular.', True);

  if rbPagoTotalMensual.Checked then
  begin
    Verificar(edfpSC_CANTTRABAJADOR.IsEmpty, edfpSC_CANTTRABAJADOR1, 'Antes de calcular debe ingresar la cantidad de trabajdores.');

    edResultadoMensualTrabajador.Value := IIF(IsMesConSAC, (edSC_PAGOCOMPETENCIAPARCIAL.Value / 1.5), edSC_PAGOCOMPETENCIAPARCIAL.Value) / edfpSC_CANTTRABAJADOR.Value;
    edSumaFija.Value                   := 0.6;
    edPorcVariable.Value               := (edSC_PAGOCOMPETENCIAPARCIAL.Value - (edfpSC_CANTTRABAJADOR.Value * 0.6)) / edfpSC_MASASALARIAL.Value * 100;
  end;

  if rbDatosEmpresa.Checked then
  begin
    Verificar(edfpSC_CANTTRABAJADOR.IsEmpty, edfpSC_CANTTRABAJADOR1, 'Antes de calcular debe ingresar la cantidad de trabajdores.');

    edResultadoMensualTrabajador.Value := ((edfpSC_CANTTRABAJADOR.Value * edSC_COSTOFIJOCOMPETENCIAPARCIAL.Value) +
                                           (edfpSC_MASASALARIAL.Value * edSC_PORCVARIABLECOMPETENCIAPARC.Value / 100)) / edfpSC_CANTTRABAJADOR.Value;
    edSumaFija.Value                   := edSC_COSTOFIJOCOMPETENCIAPARCIAL.Value;
    edPorcVariable.Value               := edSC_PORCVARIABLECOMPETENCIAPARC.Value;
  end;

  if rbForm931.Checked then
  begin
    Verificar(edfpSC_CANTTRABAJADOR.IsEmpty, edfpSC_CANTTRABAJADOR1, 'Antes de calcular debe ingresar la cantidad de trabajdores.');
    Verificar((edfpSC_MASASALARIAL.Value = 0), edfpSC_MASASALARIAL1, 'Antes de calcular debe ingresar la masa salarial.');

    edResultadoMensualTrabajador.Value := (edSC_COSTOFIJO931PARCIAL.Value + IIF(IsMesConSAC,
                                          (edSC_PORCVARIABLE931PARCIAL.Value / 1.5), edSC_PORCVARIABLE931PARCIAL.Value)) / edfpSC_CANTTRABAJADOR.Value;
    edSumaFija.Value                   := edSC_COSTOFIJO931PARCIAL.Value / edfpSC_CANTTRABAJADOR.Value;
    edPorcVariable.Value               := IIF(IsMesConSAC, (edSC_PORCVARIABLE931PARCIAL.Value / 1.5), edSC_PORCVARIABLE931PARCIAL.Value) / edfpSC_MASASALARIAL.Value * 100;
  end;

  CalcularCPTMA;
end;

procedure TfrmConsultaSolicitud.ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
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
    ScrollBox.Perform(msg, code, 0);
  ScrollBox.Perform(msg, SB_ENDSCROLL, 0);
end;

procedure TfrmConsultaSolicitud.fpAbmKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F4 then
    Key := 0;
end;

procedure TfrmConsultaSolicitud.tbRevisarEstadoClick(Sender: TObject);
begin
  inherited;

  if (not sdqConsulta.Active) or (sdqConsulta.Eof) or ((sdqConsulta.FieldByName('co_estado').AsString <> EC_CERRADA_MAL) and (sdqConsulta.FieldByName('co_estado').AsString <> EC_CERRADA_BIEN)) then
    InfoHint(nil, 'Debe elegir una solicitud de cotización con estado "Cerrada - no aceptada por el cliente" o "Cerrada - solicitud ingresada".', True);

  edSC_OBSERVACIONESCIERRE.Lines.Text := sdqConsulta.FieldByName('sc_observacionescierre').AsString;
  fpCierre.Caption := 'Cierre de la solicitud';

  try
    gbMotivoCancelacion.Visible := False;
    rgEstados.Visible := True;
    rgEstados.ItemIndex := 0;

    if fpCierre.ShowModal = mrOk then
      case rgEstados.ItemIndex of
        0:  DoCerrarSolicitud(EC_CERRADA_MAL);
        1:  DoCerrarSolicitud(EC_CERRADA_BIEN);
      end;
  finally
    gbMotivoCancelacion.Visible := True;
    rgEstados.Visible := False;
  end;
end;

procedure TfrmConsultaSolicitud.btnHistorialVigenciasClick(Sender: TObject);
begin
  Application.CreateForm(TfrmHistorialVigenciasContrato, frmHistorialVigenciasContrato);
  with frmHistorialVigenciasContrato do
  try
    frmHistorialVigenciasContrato.Mostrar(edfpSC_CUIT.Text);
  finally
    FreeAndNil(frmHistorialVigenciasContrato);
  end;
end;

procedure TfrmConsultaSolicitud.btnCalcularComisionClick(Sender: TObject);
var
  rComision: Real;
begin
  rComision := GetComision(frafpSC_VENDEDOR.Value, fraSector.Value, edfpSC_CANTTRABAJADOR.Value, edfpSC_IDGRUPOECONOMICO.Value);
  edSC_PORCCOMISION.Value := rComision;
  FComisionCalculada := True;

  if rComision = -1 then
    MsgBox('El vendedor seleccionado no tiene cargada la comisión.');
end;

procedure TfrmConsultaSolicitud.fraStatusSRTExit(Sender: TObject);
begin
  VCLExtra.LockControls([fraSC_IDARTANTERIOR], (fraStatusSRT.Value <> '2') or (LockSolicitud));
  if (fraSC_IDARTANTERIOR.Locked) and (Sender <> nil) then
    fraSC_IDARTANTERIOR.Clear;
end;

procedure TfrmConsultaSolicitud.fraCanalBusquedaExit(Sender: TObject);
begin
  fraSC_IDENTIDAD.Canales := fraCanalBusqueda.InSql2;
end;

procedure TfrmConsultaSolicitud.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CamposSuma);

  if Column = CamposSuma[0] then
    Value := 'Total: ' + ToStr(TotalConsulta[iPos], 0);
  if Column = CamposSuma[1] then
    Value := ToStr(TotalConsulta[iPos], 0);
  if Column = CamposSuma[2] then
    Value := Get_AjusteDecimales(ToStr(TotalConsulta[iPos]), '$ ', 2);
  if Column = CamposSuma[3] then
    Value := Get_AjusteDecimales(ToStr(TotalConsulta[iPos]), '', 0);
end;

procedure TfrmConsultaSolicitud.fraProvinciaPropiedadesChange(Sender: TObject);
begin
  fraLocalidad.Propiedades.ExtraCondition := FiltroProvincia;
  fraLocalidad.Clear;
  LockControl(fraLocalidad, (fraProvincia.Value = 2));
end;

procedure TfrmConsultaSolicitud.btnAceptar3Click(Sender: TObject);
begin
  Verificar(fraProvincia.IsEmpty, fraProvincia.edCodigo, 'El campo Provincia es obligatorio.');
  Verificar((fraProvincia.Value <> 2) and (fraLocalidad.IsEmpty), fraLocalidad.edCodigo, 'El campo Localidad es obligatorio.');
  Verificar(fraActividad.IsEmpty, fraActividad.edCodigo, 'El campo Actividad es obligatorio.');

  fpEstablecimientos.ModalResult := mrOk;
end;

procedure TfrmConsultaSolicitud.tbAgregarClick(Sender: TObject);
var
  sSql: String;
begin
  fraProvincia.Clear;
  fraLocalidad.Clear;
  fraActividad.Clear;
  checkCopiarCiiu.Checked := False;
  fraCiiu.Clear;
  edTrabajadores.Clear;

  if fpEstablecimientos.ShowModal = mrOk then
  begin
    sSql :=
      'INSERT INTO afi.aeu_establecimientos' +
                 ' (eu_id, eu_idsolicitud, eu_idzonageografica, eu_idlocalidad, eu_idtipoactividad, eu_idactividad,' +
                  ' eu_trabajadores, eu_fechaalta, eu_usualta, eu_usuarioweb)' +
          ' VALUES (-1, :idsolicitud, :idzonageografica, :idlocalidad, :idtipoactividad, ' +
                    SqlNumber(Integer(IIF(checkCopiarCiiu.Checked, frafpSC_IDACTIVIDAD.Value, fraCiiu.Value)), True) + ', ' +
                    SqlNumber(edTrabajadores.Value, True) + ', SYSDATE, :usualta, ''F'')';
    EjecutarSqlEx(sSql, [sdqEstablecimientos.ParamByName('idsolicitud').AsInteger, fraProvincia.Value, fraLocalidad.Value, fraActividad.Value, Sesion.UserID]);
    RefrescarEstablecimientos(FIdSolicitud);

  end;
end;

procedure TfrmConsultaSolicitud.tbModificar2Click(Sender: TObject);
var
  sSql: String;
begin
  with sdqEstablecimientos do
  begin
    checkCopiarCiiu.Checked := False;
    fraProvincia.Value   := FieldByName('eu_idzonageografica').AsInteger;
    fraLocalidad.Value   := FieldByName('eu_idlocalidad').AsInteger;
    fraActividad.Value   := FieldByName('eu_idtipoactividad').AsInteger;
    fraCiiu.Value        := FieldByName('eu_idactividad').AsInteger;
    edTrabajadores.Value := FieldByName('eu_trabajadores').AsInteger;
  end;

  if fpEstablecimientos.ShowModal = mrOk then
  begin
    sSql :=
      'UPDATE afi.aeu_establecimientos' +
        ' SET eu_idzonageografica = :idzonageografica,' +
            ' eu_idlocalidad = :idlocalidad,' +
            ' eu_idtipoactividad = :idtipoactividad,' +
            ' eu_idactividad = ' + SqlNumber(Integer(IIF(checkCopiarCiiu.Checked, frafpSC_IDACTIVIDAD.Value, fraCiiu.Value)), True) + ',' +
            ' eu_trabajadores = ' + SqlNumber(edTrabajadores.Value, True) + ',' +
            ' eu_fechamodif = SYSDATE,' +
            ' eu_usumodif = :usumodif' +
      ' WHERE eu_id = :id';
    EjecutarSqlEx(sSql, [fraProvincia.Value, fraLocalidad.Value, fraActividad.Value, Sesion.UserID, sdqEstablecimientos.FieldByName('eu_id').AsInteger]);
    RefrescarEstablecimientos(FIdSolicitud);
  end;
end;

procedure TfrmConsultaSolicitud.tbEliminar3Click(Sender: TObject);
var
  sSql: String;
begin
  if MsgAsk('¿ Realmente desea eliminar el establecimiento seleccionado ?') then
  begin
    sSql :=
      'UPDATE afi.aeu_establecimientos' +
        ' SET eu_fechabaja = SYSDATE,' +
            ' eu_usubaja = :usubaja' +
      ' WHERE eu_id = :id';
    EjecutarSqlEx(sSql, [Sesion.UserID, sdqEstablecimientos.FieldByName('eu_id').AsInteger]);
    RefrescarEstablecimientos(FIdSolicitud);
  end;
end;

procedure TfrmConsultaSolicitud.sdqEstablecimientosAfterOpen(DataSet: TDataSet);
begin
  tbModificar2.Enabled := (not LockSolicitud) and (DataSet.Active) and (not DataSet.IsEmpty);
  tbEliminar3.Enabled := tbModificar2.Enabled;
end;

procedure TfrmConsultaSolicitud.dbgridEstablecimientosDblClick(Sender: TObject);
begin
  if tbModificar2.Enabled then
    tbModificar2Click(Sender);
end;

procedure TfrmConsultaSolicitud.fraLocalidadPropiedadesChange(Sender: TObject);
var
  iIdProvincia: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT zg_id' +
     ' FROM afi.azg_zonasgeograficas' +
    ' WHERE zg_idprovincia = :idprovincia';
  iIdProvincia := ValorSqlIntegerEx(sSql, [fraLocalidad.sdqDatos.FieldByName('cp_provincia').AsInteger]);

  if fraProvincia.Value <> iIdProvincia then
  begin
    fraProvincia.Value := iIdProvincia;
    fraLocalidad.Propiedades.ExtraCondition := FiltroProvincia;
    LockControl(fraLocalidad, (fraProvincia.Value = 2));
    if fraProvincia.Value = 2 then
      fraLocalidad.Clear;
  end;
end;

procedure TfrmConsultaSolicitud.tbBuscarEmailsClick(Sender: TObject);
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.FieldByName('sc_id').IsNull), Grid, 'Debe seleccionar algún registro.');

  with TfrmElementosEnviados.Create(Self) do
  begin
    MenuItem := frmPrincipal.mnuElementosEnviados;
    FormStyle := fsMDIChild;

    IdRegistro := frmConsultaSolicitud.sdqConsulta.FieldByName('sc_id').AsInteger;
    TipoRegistro := 'ASC';
    RefreshData;
  end;
end;

procedure TfrmConsultaSolicitud.btnCalcularDescuentoClick(Sender: TObject);
var
  aValorCotizacion: TRecValorCotizacion;
begin
  edAumento.Value := 0;
  lbAumentoAplicado.Caption:='-';

  aValorCotizacion := GetValorCotizacion(edDescuento.Value, edAumento.Value);

  ceSumaFija.Value     := aValorCotizacion.SumaFija;
  ceSumaVariable.Value := aValorCotizacion.SumaVariable;
  ceCostoCapitas.Value := aValorCotizacion.CostoCapitas;
  ceCostoMensual.Value := aValorCotizacion.CostoMensual;
  ceCostoAnual.Value   := aValorCotizacion.CostoAnual;
  edSumaPolizaRc.Value := aValorCotizacion.ValorRC;

  lbDescuentoAplicado.Caption := FormatFloat('0.##%', edDescuento.Value);

  edSumaAsegurada.Value := GetSumaAseguradaRc;

  ceCuotaInicial.Value := edSumaPolizaRC.Value * ceMasaSalarial.Value / 100;
  ActualizarResultadosAutoCotizacion;
end;

procedure TfrmConsultaSolicitud.tbPosibleDescuentoClick(Sender: TObject);
var
  rDescuento: Real;
  sMotivoNoDescuento: String;
  sMsg: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    if not Active then
      Exit;

    sMotivoNoDescuento := '';

    // Los mensajes se agregan según ticket 24063..
    if not sdqConsulta.FieldByName('sc_idcotizacion').IsNull then
      sMotivoNoDescuento := 'La solicitud tiene una cotización asociada.';

    if sdqConsulta.FieldByName('sc_canttrabajador').AsInteger > 50 then
      sMotivoNoDescuento := 'La solicitud tiene más de 50 trabajadores.';

    if sdqConsulta.FieldByName('sc_porcdescuento').AsFloat > 0 then
      sMotivoNoDescuento := 'La solicitud ya tiene un descuento aplicado.';

    sSql := 'SELECT ac_cotizable FROM cac_actividad WHERE ac_id = :id';
    if ValorSqlEx(sSql, [sdqConsulta.FieldByName('sc_idactividad').AsInteger]) = 'N' then
      sMotivoNoDescuento := 'El CIIU no permite autocotizar la solicitud.';

    sSql := 'SELECT ac_excluido FROM cac_actividad WHERE ac_id = :id';
    if ValorSqlEx(sSql, [sdqConsulta.FieldByName('sc_idactividad').AsInteger]) = 'S' then
      sMotivoNoDescuento := 'El CIIU está excluido.';

    if sdqConsulta.FieldByName('sc_porcaumento').AsFloat > 0 then
      sMotivoNoDescuento := 'La solicitud ya tiene un aumento aplicado.';

    if sMotivoNoDescuento <> '' then
    begin
      sMsg := 'Usted no tiene la posibilidad de hacer ningún descuento sobre esta solicitud de cotización.';
      sMsg := sMsg + #13#10 + 'MOTIVO: ' + sMotivoNoDescuento;
      MsgBox(sMsg);
      Exit;
    end;


//    aStatusSrt := ObtenerStatusSrt(FIdSolicitud);

    sSql := 'SELECT art.cotizacion.get_descuento(:cuit, :trabajadores, :ciiu, :usuario) FROM DUAL';
    rDescuento := ValorSqlExtendedEx(sSql, [FieldByName('sc_cuit').AsString,
                                            FieldByName('sc_canttrabajador').AsInteger,
                                            FieldByName('sc_idactividad').AsInteger,
                                            Sesion.UserID]);
    if rDescuento > 0 then
      MsgBox(Format('Usted puede hacer hasta un %s de descuento sobre esta solicitud de cotización.', [FloatToStr(rDescuento) + '%']))
    else
      MsgBox('Usted no tiene la posibilidad de hacer ningún descuento sobre esta solicitud de cotización.');
  end;
end;

procedure TfrmConsultaSolicitud.GridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if ((LowerCase(Column.FieldName) = 'co_comisionpiso') or
     (LowerCase(Column.FieldName) = 'co_costofinalpiso') or
     (LowerCase(Column.FieldName) = 'co_porcvariablepiso') or
     (LowerCase(Column.FieldName) = 'co_sumafijapiso')) and
     (sdqConsulta.FieldByName('co_estado').AsString <> EC_NOTIF_COMERCIAL) and
     (sdqConsulta.FieldByName('co_estado').AsString <> EC_NOTIF_CLIENTE) then
  begin
    TArtDBGrid(Sender).Canvas.TextRect(Rect, Rect.Right - Canvas.TextWidth('***') - 2, Rect.Top + 2, '***');
  end;

  if LowerCase(Column.FieldName) = 'sc_porcdescuento' then
  begin
    if Column.Field.AsFloat < 0 then
      TArtDBGrid(Sender).Canvas.TextRect(Rect, Rect.Right - Canvas.TextWidth(' ') - 2, Rect.Top + 2, ' ');
  end;

  if LowerCase(Column.FieldName) = 'sc_porcaumento' then
  begin
    if Column.Field.AsFloat < 0 then
      TArtDBGrid(Sender).Canvas.TextRect(Rect, Rect.Right - Canvas.TextWidth(' ') - 2, Rect.Top + 2, ' ');
  end;
end;

procedure TfrmConsultaSolicitud.tbCambiarDatosClick(Sender: TObject);
begin
  tbCambiarDatos.CheckMenuDropdown;
end;

procedure TfrmConsultaSolicitud.btnCancelar3Click(Sender: TObject);
begin
  fpCambiarCanalEntidadVendedor.Close;
end;

procedure TfrmConsultaSolicitud.mnuCanalEntidadVendedorClick(Sender: TObject);
var
  aBookmark: TBookmark;
  sSql: String;
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.FieldByName('sc_id').IsNull), Grid, 'Debe seleccionar algún registro.');
  Verificar((sdqConsulta.FieldByName('sc_motivonoautocotizacion').AsString <> ''), Grid, 'Estos datos no se pueden modificar porque la solicitud no se autocotizó.');
  Verificar((sdqConsulta.FieldByName('co_estado').AsString = EC_NOTIF_CLIENTE), Grid, 'Esta solicitud ya fue notificado al cliente.');

  if fpCambiarCanalEntidadVendedor.ShowModal = mrOk then
  begin
    sSql :=
      'UPDATE asc_solicitudcotizacion' +
        ' SET sc_canal = :canal,' +
            ' sc_identidad = :identidad,' +
            ' sc_idvendedor = :idvendedor' +
      ' WHERE sc_id = :id';
    EjecutarSqlEx(sSql, [fraCanal.Value, fraEntidad.Value, fraVendedor.Value, sdqConsulta.FieldByName('sc_id').AsInteger]);
    sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
    EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);

    aBookmark := sdqConsulta.GetBookmark;
    tbRefrescarClick(nil);
    sdqConsulta.GotoBookmark(aBookmark);

    MsgBox('Los datos fueron modificados.');
  end;
end;

procedure TfrmConsultaSolicitud.btnAceptar4Click(Sender: TObject);
begin
  Verificar(fraCanal.IsEmpty, fraCanal.edCodigo, 'Debe seleccionar el Canal.');
  Verificar(fraEntidad.IsEmpty, fraEntidad.edCodigo, 'Debe seleccionar la Entidad.');
  Verificar(fraVendedor.IsEmpty, fraVendedor.edCodigo, 'Debe seleccionar el Vendedor.');

  fpCambiarCanalEntidadVendedor.ModalResult := mrOk;
end;

procedure TfrmConsultaSolicitud.mnuUsuarioCargaClick(Sender: TObject);
var
  aBookmark: TBookmark;
  sBody: String;
  sDestinatario: String;
  sSql: String;
  sSubject: String;
begin
  Verificar((not sdqConsulta.Active) or (sdqConsulta.FieldByName('sc_id').IsNull), Grid, 'Debe seleccionar algún registro.');
  Verificar((sdqConsulta.FieldByName('sc_canal').AsInteger <> 321), Grid, 'Estos datos no se pueden modificar porque la solicitud no se cotizó por el canal Venta Directa.');
  Verificar((sdqConsulta.FieldByName('co_estado').AsString = EC_NOTIF_CLIENTE), Grid, 'Esta solicitud ya fue notificado al cliente.');

  if fpCambiarUsuarioCarga.ShowModal = mrOk then
  begin
    sSql :=
      'UPDATE asc_solicitudcotizacion' +
        ' SET sc_iddelegacion = :iddelegacion,' +
            ' sc_usuariosolicitud = :usuariosolicitud' +
      ' WHERE sc_id = :id';
    EjecutarSqlEx(sSql, [StrToInt('111' + fraUsuario.sdqDatos.FieldByName('se_delegacion').AsString), fraUsuario.Value, sdqConsulta.FieldByName('sc_id').AsInteger]);
    sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
    EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);

    // Envío el e-mail de aviso..
    sSql :=
      'SELECT NVL(se_mail, se_usuario)' +
       ' FROM use_usuarios' +
      ' WHERE se_usuario = :usuario';
    sDestinatario := ValorSqlEx(sSql, [fraUsuario.Value]);

    sBody := Format('Se le ha asignado la solicitud de cotización nº %s para que le haga un seguimiento.', [sdqConsulta.FieldByName('sc_nrosolicitud').AsString]);
    sSubject := Format('Solicitud de cotización %s asignada', [sdqConsulta.FieldByName('sc_nrosolicitud').AsString]);

    unEnvioMail.EnviarMailBD(sDestinatario, sSubject, [oSinNotaAlPie, oDeleteAttach], [], sBody, 0, tcDefault, True, False, 2500, -1, [], '', False, Sesion.UserMail,
                             'ASC', sdqConsulta.FieldByName('sc_id').AsInteger);

    // Refresco la grilla..
    aBookmark := sdqConsulta.GetBookmark;
    tbRefrescarClick(nil);
    sdqConsulta.GotoBookmark(aBookmark);

    MsgBox('Los datos fueron modificados.');
  end;
end;

procedure TfrmConsultaSolicitud.btnCancelar4Click(Sender: TObject);
begin
  fpCambiarUsuarioCarga.Close;
end;

procedure TfrmConsultaSolicitud.btnAceptar5Click(Sender: TObject);
begin
  Verificar(fraUsuario.IsEmpty, fraUsuario.edCodigo, 'Debe seleccionar el Usuario.');

  fpCambiarUsuarioCarga.ModalResult := mrOk;
end;

procedure TfrmConsultaSolicitud.fpCambiarCanalEntidadVendedorBeforeShow(Sender: TObject);
begin
  fraCanal.Clear;
  fraEntidad.Clear;
  fraVendedor.Clear;
end;

procedure TfrmConsultaSolicitud.fpCambiarUsuarioCargaBeforeShow(Sender: TObject);
begin
  fraUsuario.Clear;
end;

procedure TfrmConsultaSolicitud.btnCancelar5Click(Sender: TObject);
begin
  fpDatosFaltantes.Close;
end;

procedure TfrmConsultaSolicitud.tbAgregar2Click(Sender: TObject);
var
  sSql: String;
begin
  fraProvincia.Clear;
  fraLocalidad.Clear;
  fraActividad.Clear;
  checkCopiarCiiu.Checked := False;
  fraCiiu.Clear;
  edTrabajadores.Clear;

  if fpEstablecimientos.ShowModal = mrOk then
  begin
    sSql :=
      'INSERT INTO afi.aeu_establecimientos' +
                 ' (eu_id, eu_idsolicitud, eu_idzonageografica, eu_idlocalidad, eu_idtipoactividad, eu_idactividad,' +
                  ' eu_trabajadores, eu_fechaalta, eu_usualta, eu_usuarioweb)' +
          ' VALUES (-1, :idsolicitud, :idzonageografica, :idlocalidad, :idtipoactividad, ' +
                    SqlNumber(Integer(IIF(checkCopiarCiiu.Checked, sdqConsulta.FieldByName('sc_idactividad').AsInteger, fraCiiu.Value)), True) + ', ' +
                    SqlNumber(edTrabajadores.Value, True) + ', SYSDATE, :usualta, ''F'')';
    EjecutarSqlEx(sSql, [sdqEstablecimientos.ParamByName('idsolicitud').AsInteger, fraProvincia.Value, fraLocalidad.Value, fraActividad.Value, Sesion.UserID]);
    RefrescarEstablecimientos(sdqConsulta.FieldByName('sc_id').AsInteger);
  end;
end;

procedure TfrmConsultaSolicitud.tbModificar3Click(Sender: TObject);
var
  sSql: String;
begin
  with sdqEstablecimientos do
  begin
    if (not Active) or (Eof) then
      Exit;

    checkCopiarCiiu.Checked := False;
    fraProvincia.Value      := FieldByName('eu_idzonageografica').AsInteger;
    fraLocalidad.Value      := FieldByName('eu_idlocalidad').AsInteger;
    fraActividad.Value      := FieldByName('eu_idtipoactividad').AsInteger;
    fraCiiu.Value           := FieldByName('eu_idactividad').AsInteger;
    edTrabajadores.Value    := FieldByName('eu_trabajadores').AsInteger;
  end;

  if fpEstablecimientos.ShowModal = mrOk then
  begin
    sSql :=
      'UPDATE afi.aeu_establecimientos' +
        ' SET eu_idzonageografica = :idzonageografica,' +
            ' eu_idlocalidad = :idlocalidad,' +
            ' eu_idtipoactividad = :idtipoactividad,' +
            ' eu_idactividad = ' + SqlNumber(Integer(IIF(checkCopiarCiiu.Checked, sdqConsulta.FieldByName('sc_idactividad').AsInteger, fraCiiu.Value)), True) + ',' +
            ' eu_trabajadores = ' + SqlNumber(edTrabajadores.Value, True) + ',' +
            ' eu_fechamodif = SYSDATE,' +
            ' eu_usumodif = :usumodif' +
      ' WHERE eu_id = :id';
    EjecutarSqlEx(sSql, [fraProvincia.Value, fraLocalidad.Value, fraActividad.Value, Sesion.UserID, sdqEstablecimientos.FieldByName('eu_id').AsInteger]);
    RefrescarEstablecimientos(sdqConsulta.FieldByName('sc_id').AsInteger);
  end;
end;

procedure TfrmConsultaSolicitud.tbEliminar2Click(Sender: TObject);
var
  sSql: String;
begin
  if (not sdqEstablecimientos.Active) or (sdqEstablecimientos.Eof) then
    Exit;

  if MsgAsk('¿ Realmente desea eliminar el establecimiento seleccionado ?') then
  begin
    sSql :=
      'UPDATE afi.aeu_establecimientos' +
        ' SET eu_fechabaja = SYSDATE,' +
            ' eu_usubaja = :usubaja' +
      ' WHERE eu_id = :id';
    EjecutarSqlEx(sSql, [Sesion.UserID, sdqEstablecimientos.FieldByName('eu_id').AsInteger]);
    RefrescarEstablecimientos(sdqConsulta.FieldByName('sc_id').AsInteger);
  end;
end;

procedure TfrmConsultaSolicitud.fpDatosFaltantesBeforeShow(Sender: TObject);
var
  sJefe: String;
  sSql: String;
  sUsuarios: String;
begin
  LockControls([fpEstablecimientos], False);

  with sdqConsulta do
  begin
    fraMotivoExcepcionRecotizacion.Clear;
    edEdadPromedio.Value             := IIF((FieldByName('sc_edadpromedio').AsInteger = 0), 35, FieldByName('sc_edadpromedio').AsInteger);
    fraSector2.Value                 := FieldByName('sc_sector').AsString;
    fraProbabilidadCierre.Value      := FieldByName('sc_idprobabilidadcierre').AsInteger;
    edCantidadEstablecimientos.Value := FieldByName('sc_establecimientos').AsInteger;
    fraDestinoEmail.Clear;
  end;

  sSql :=
    'SELECT se_usuario' +
     ' FROM afi.apr_permisorevision, use_usuarios' +
    ' WHERE pr_usuario = se_id' +
      ' AND se_respondea = :respondea' +
      ' AND se_fechabaja IS NULL';
  sJefe := ValorSqlEx(sSql, [Sesion.UserID]);

  lbDestinoEmail.Visible  := (sJefe = '');
  fraDestinoEmail.Visible := lbDestinoEmail.Visible;

  if fraDestinoEmail.Visible then
  begin
    sUsuarios := IntToStr(Sesion.ID);
    sSql :=
      'SELECT se_id' +
       ' FROM afi.apr_permisorevision, use_usuarios' +
      ' WHERE pr_usuario = se_id' +
        ' AND se_fechabaja IS NULL' +
        ' AND pr_fechabaja IS NULL' +
        ' AND se_usuario IN(SELECT se_respondea' +
                            ' FROM afi.apr_permisorevision, use_usuarios' +
                           ' WHERE pr_usuario = se_id' +
                             ' AND se_fechabaja IS NULL' +
                             ' AND pr_fechabaja IS NULL)';

    with GetQuery(sSql) do
    try
      while not Eof do
      begin
        sUsuarios := sUsuarios + ', ' + FieldByName('se_id').AsString;
        Next;
      end;
    finally
      Free;
    end;

    fraDestinoEmail.Propiedades.ExtraCondition := 'AND se_id IN (' + sUsuarios + ')';
  end;

  ModoABM := maModificacion;

  RefrescarEstablecimientos(sdqConsulta.FieldByName('sc_id').AsInteger);
end;

procedure TfrmConsultaSolicitud.btnAceptar6Click(Sender: TObject);
  function StatusSrtOk: Boolean;
  var
    aStatusSrt: TStatusSrt;
    sSql: String;
  begin
    Result := True;

    if StrToIntDef(sdqConsulta.FieldByName('sc_statussrt').AsString, 0) < 1 then
    begin
      aStatusSrt := ObtenerStatusSrt(sdqConsulta.FieldByName('sc_cuit').AsString, sdqConsulta.FieldByName('sc_id').AsInteger);
      FStatusSrtOk := (aStatusSrt.Status <> '-1');

      Verificar((aStatusSrt.ArtAnterior = 51) and ((aStatusSrt.Status = '2') or (aStatusSrt.Status = '5') or (aStatusSrt.Status = '6') or (aStatusSrt.Status = '7')), nil, 'Esta solicitud debe ser cargada como Revisión de Precio. (Motivo 06)');

      sSql :=
        'UPDATE asc_solicitudcotizacion' +
          ' SET sc_idartanterior = :idartanterior,' +
              ' sc_statussrt = :statussrt' +
        ' WHERE sc_id = :id';
      EjecutarSqlEx(sSql, [aStatusSrt.ArtAnterior, aStatusSrt.Status, sdqConsulta.FieldByName('sc_id').AsInteger]);
      sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
      EjecutarSqlEx(sSql, [sdqConsulta.FieldByName('sc_id').AsInteger]);

      Result := True;
    end;
  end;

var
  bFaltaZona: Boolean;
begin
  Verificar(fraMotivoExcepcionRecotizacion.IsEmpty, fraMotivoExcepcionRecotizacion.edCodigo, 'Debe indicar el Motivo.');
  Verificar((memoObservaciones.Text = ''), memoObservaciones, 'El campo Observaciones es obligatorio.');
  Verificar((edEdadPromedio.Value = 0), edEdadPromedio, 'Debe indicar la Edad Promedio.');
  Verificar((edEdadPromedio.Value < 18) or (edEdadPromedio.Value > 65), edEdadPromedio, 'La Edad Promedio debe ser entre 18 y 65.');
  Verificar(fraSector2.IsEmpty, fraSector2.edCodigo, 'Debe indicar el Sector.');
  Verificar(fraProbabilidadCierre.IsEmpty, fraProbabilidadCierre.edCodigo, 'Debe indicar la Probabilidad de Cierre.');
  Verificar((edCantidadEstablecimientos.Value = 0), edCantidadEstablecimientos, 'La Cantidad de Establecimientos debe ser mayor a cero (0).');
  Verificar((sdqEstablecimientos.RecordCount <> edCantidadEstablecimientos.Value), dbgridEstablecimientos2, 'La Cantidad de Establecimientos cargados no coincide con el campo "Cantidad de Establecimientos".');

  bFaltaZona := False;
  with sdqEstablecimientos do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      if (FieldByName('eu_idzonageografica').IsNull) or (FieldByName('eu_idlocalidad').IsNull) then
      begin
        bFaltaZona := True;
        Break;
      end;

      Next;
    end;
  finally
    EnableControls;
  end;

  Verificar(bFaltaZona, dbgridEstablecimientos2, 'Debe indicar la Provincia y Localidad de todos los establecimientos.');
  Verificar((fraDestinoEmail.Visible and fraDestinoEmail.IsEmpty), fraDestinoEmail.edCodigo, 'Debe indicar el destino del e-mail.');

  fpDatosFaltantes.ModalResult := mrOk;
end;

procedure TfrmConsultaSolicitud.btnCalcularAumentoClick(Sender: TObject);
var
  aValorCotizacion: TRecValorCotizacion;
begin
  edDescuento.Value := 0;
  lbDescuentoAplicado.Caption := '-';

  aValorCotizacion := GetValorCotizacion(edDescuento.Value, edAumento.Value);

  ceSumaFija.Value     := aValorCotizacion.SumaFija;
  ceSumaVariable.Value := aValorCotizacion.SumaVariable;
  ceCostoCapitas.Value := aValorCotizacion.CostoCapitas;
  ceCostoMensual.Value := aValorCotizacion.CostoMensual;
  ceCostoAnual.Value   := aValorCotizacion.CostoAnual;
  edSumaPolizaRc.Value := aValorCotizacion.ValorRC;

  lbAumentoAplicado.Caption := FormatFloat('0.##%', edAumento.Value);

  ActualizarResultadosAutoCotizacion;
end;

procedure TfrmConsultaSolicitud.edDescuentoChange(Sender: TObject);
begin
  btnCalcularDescuentoClick(nil);
end;

procedure TfrmConsultaSolicitud.edAumentoChange(Sender: TObject);
begin
  btnCalcularAumentoClick(nil);
end;

procedure TfrmConsultaSolicitud.btnRecalcRCClick(Sender: TObject);
var
  rValorRc: Real;
begin
  if rbRCsi.Checked then
  begin
    btnActualizar.Enabled := (FEstadoSolicitud <> EC_SOLICITUD_AFILIACION_TRAMITE);
    btnImprimir.Enabled := btnActualizar.Enabled;

    Verificar((edTC_SUMAFIJA.Value = 0) and (edTC_PORCVARIABLE.Value = 0), btnRecalcRC, 'Esta solicitud no se puede recalcular ya que no tiene valores cotizados.');

    rValorRc := GetValorResponsabilidadCivil(edfpSC_CUIT.Text, fraZonaGeografica.Codigo, FIdSolicitud, edfpSC_CANTTRABAJADOR.Value, GetSumaAseguradaRc,
                                             edfpSC_MASASALARIAL.Value, edTC_PORCVARIABLE.Value, edTC_SUMAFIJA.Value, edDescuentoAplicado.Value);

    edCalcPolizaRc.Value  := rValorRC;
  end
  else
  begin
    btnActualizar.Enabled := True;
    btnImprimir.Enabled   := True;
    edCalcPolizaRc.Value  := 0;
  end;
end;

procedure TfrmConsultaSolicitud.HabilitarGroupBoxResponsabilidadCivil(const aEstado: Boolean);
begin
  btnActualizar.Enabled  := False;
  btnImprimir.Enabled    := False;
  btnRecalcRc.Enabled    := aEstado;
  edCalcPolizaRc.Enabled := aEstado;
  gbRecalcRc.Visible     := aEstado;
end;

procedure TfrmConsultaSolicitud.btnActualizarClick(Sender: TObject);
var
  iIdVendedor: Integer;
  iSumaAseguradaRc: Integer;
  sSiNo: String;
  sSql: String;
begin
  btnActualizar.Enabled := False;
  iSumaAseguradaRc := GetSumaAseguradaRc;

  sSql :=
    'SELECT ve_id' +
     ' FROM xev_entidadvendedor, xve_vendedor' +
    ' WHERE ev_idvendedor = ve_id' +
      ' AND ev_identidad = :identidad' +
      ' AND ev_fechabaja IS NULL' +
      ' AND ve_fechabaja IS NULL' +
      ' AND ve_id = :vendedor';
  iIdVendedor := ValorSqlIntegerEx(sSql, [frafpSC_ENTIDAD.Value, frafpSC_VENDEDOR.Value]);

  sSql :=
    'SELECT pr_id, sa_id' +
     ' FROM art.apr_polizarc, asa_solicitudafiliacion' +
    ' WHERE pr_idsolicitudafi = sa_id' +
      ' AND sa_idsolicitudcotizacion = :idsolicitudcotizacion';
  with GetQueryEx(sSql, [FIdSolicitud]) do
  try
    if Eof then   // Alta..
    begin
      if FieldByName('sa_id').AsInteger > 0 then
      begin
        sSql :=
          'INSERT INTO art.apr_polizarc' +
                     ' (pr_cod_actividad, pr_cod_productor, pr_fechaalta, pr_id, pr_idsolicitudafi, pr_poliza, pr_sumaasegurada, pr_tipo_doc, pr_usualta, pr_valor_rc)' +
              ' VALUES ((SELECT ac_relacion' +
                         ' FROM cac_actividad' +
                        ' WHERE ac_codigo = :codigo), (SELECT ve_provinciaseguros' +
                                                       ' FROM xve_vendedor' +
                                                      ' WHERE ve_id = :id), SYSDATE, -1, :idsolicitudafi, :poliza, :sumaasegurada, ''DNI'', :usualta, :valor_rc)';
        EjecutarSqlEx(sSql, [frafpSC_IDACTIVIDAD.Value, iIdVendedor, FieldByName('sa_id').AsInteger,
                             IIF(rbRCsi.Checked, 'S', 'N'), GetSumaAseguradaRC, Sesion.UserID, edCalcPolizaRC.Value]);
      end;
    end
    else    // Modificación..
    begin
      sSql :=
        'UPDATE art.apr_polizarc' +
          ' SET pr_cod_actividad = (SELECT ac_relacion' +
                                    ' FROM cac_actividad' +
                                   ' WHERE ac_codigo = :codigo),' +
              ' pr_cod_productor = (SELECT ve_provinciaseguros' +
                                    ' FROM xve_vendedor' +
                                   ' WHERE ve_id = :id),' +
              ' pr_fechamodif = SYSDATE,' +
              ' pr_poliza = :poliza,' +
              ' pr_sumaasegurada = :sumaasegurada,' +
              ' pr_usumodif = :usumodif,' +
              ' pr_valor_rc = :valor_rc' +
        ' WHERE pr_id = :id';
      EjecutarSqlEx(sSql, [frafpSC_IDACTIVIDAD.Value, iIdVendedor, IIF(rbRCsi.Checked, 'S', 'N'), GetSumaAseguradaRC, Sesion.UserID, edCalcPolizaRC.Value, FieldByName('pr_id').AsInteger]);
    end;
  finally
    Free;
  end;


  // guardar rc
  sSql :=
    'UPDATE asc_solicitudcotizacion' +
      ' SET sc_sumaasegurada_rc = :suma,' +
          ' sc_valor_rc = :valor,' +
          ' sc_poliza_rc = :sino' +
    ' WHERE sc_id = :id';

  if rbRCsi.Checked then
  begin
    sSino := 'S';
    EjecutarSqlEx(sSql, [iSumaAseguradaRc, edCalcPolizaRC.Value, sSino, FIdSolicitud]);
    edValoresAlicuota.Value := edCalcPolizaRC.Value;
    edValoresSumaAsegurada.Value := iSumaAseguradaRc;
    //Cuota Inicial, es la cuenta de Alicuota_Variable * Masa Salarial /100.
    edValoresCuotaInicial.Value := edCalcPolizaRC.Value * edfpSC_MASASALARIAL.Value / 100;
    edValoresMasaSalarial.Value := edfpSC_MASASALARIAL.Value;
  end
  else
  begin
    sSino := 'N';
    EjecutarSqlEx(sSql, ['0', '0', sSino, FIdSolicitud]);
    edValoresAlicuota.Value := 0;
    edValoresSumaAsegurada.Value := 0;
    edValoresCuotaInicial.Value := 0;
    edValoresMasaSalarial.Value := 0;
  end;

  sSql := 'BEGIN art.afiliacion.do_rankingbna(''S'', :id); END;';
  EjecutarSqlEx(sSql, [FIdSolicitud]);

  ShowMessage('Póliza de Responsabilidad Civil actualizada correctamente.');

  edPoliza.Value := edCalcPolizaRc.Value;
  sdqConsulta.Refresh;
end;

procedure TfrmConsultaSolicitud.rb2Click(Sender: TObject);
begin
  edCalcPolizaRc.Value := 0;
  btnActualizar.Enabled := False;
  btnImprimir.Enabled := False;

  if rbRCno.Checked then
  begin
    rb2.Checked := False;
    rb5.Checked := False;
    rb10.Checked := False;
    Verificar(rbRCno.Checked, rbRCno, 'Debe seleccionar suscribe responsabilidad civil antes de la suma asegurada.');
  end;
end;

function TfrmConsultaSolicitud.GetSumaAseguradaRC: Integer;
var
  iRes: Integer;
begin
  iRes := 0;

  if rb2.Checked then
    iRes := 250000;
  if rb5.Checked then
    iRes := 500000;

 // if rb7.Checked = True  then Res := 750000;

  if rb10.Checked then
    iRes := 1000000;

  Result := iRes;
end;

procedure TfrmConsultaSolicitud.edCalcPolizaRCClick(Sender: TObject);
begin
  btnActualizar.Enabled := False;
  btnImprimir.Enabled := False;
end;

function TfrmConsultaSolicitud.GetValorResponsabilidadCivil(const aCuit, aZonaGeografica: String; const aIdSolicitud, aCapitas, aSumaAsegurada: Integer; const aMasaSalarial,
                                                            aSumaVariable, aSumaFija, aDescuento: Extended): Real;
var
  iIdCotizacion: Integer;
  rSumaFija: Currency;
  rResultadoRC :Real;
  sSql: String;
begin
  if chkSoloPCP.Checked then
    rResultadoRC := 0
  else
  begin
    rSumafija := aSumaFija - 0.6;

    sSql :=
      'SELECT co_id' +
       ' FROM aco_cotizacion, asc_solicitudcotizacion' +
      ' WHERE sc_idcotizacion = co_id' +
        ' AND sc_id = :id';
    iIdCotizacion := ValorSqlIntegerEx(sSql, [aIdSolicitud]);

    if aZonaGeografica = '' then
    begin
      sSql :=
        'SELECT art.cotizacion.get_valor_rc(:cuit, :capitas, :masasalarial, :porcvar, :sumafija, NULL, :idcotizacion,' +
                                          ' :seleccionsumaaseg, :descuento)' +
         ' FROM DUAL';
      rResultadoRC := ValorSqlExtendedEx(sSql, [aCuit, aCapitas, aMasaSalarial, aSumaVariable, rSumaFija, iIdCotizacion, aSumaAsegurada, 0]);
    end
    else
    begin
      sSql :=
        'SELECT art.cotizacion.get_valor_rc(:cuit, :capitas, :masasalarial, :porcvar, :sumafija, :idzonageo,' +
                                          ' :idcotizacion, :seleccionsumaaseg, :descuento)' +
         ' FROM DUAL';
      rResultadoRC := ValorSqlExtendedEx(sSql, [aCuit, aCapitas, aMasaSalarial, aSumaVariable, rSumaFija, StrToInt(aZonaGeografica), iIdCotizacion ,aSumaAsegurada, 0]);
    end;
  end;

  if (rResultadoRc >= 0) then
    Result := rResultadoRC
  else
    Result := 0;
end;

function TfrmConsultaSolicitud.IsJefe: Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM use_usuarios' +
    ' WHERE se_respondea = :respondea' +
      ' AND se_fechabaja IS NULL';
  Result := ExisteSqlEx(sSql, [Sesion.UserID]);
end;

procedure TfrmConsultaSolicitud.rbRCSiClick(Sender: TObject);
begin
  if not (rb2.Checked or rb5.Checked or rb10.Checked) then
    rb2.Checked := True;
end;

procedure TfrmConsultaSolicitud.rbRCNoClick(Sender: TObject);
begin
  if rb2.Checked or rb5.Checked or rb10.Checked then
  begin
    rb2.Checked  := False;
    rb5.Checked  := False;
    rb10.Checked := False;
  end;
end;

procedure TfrmConsultaSolicitud.tbRedireccionarEmailAutorizacionClick(Sender: TObject);
var
  sDestinatario: String;
  sSql: String;
begin
  with sdqConsulta do
  begin
    if not Active then
      Exit;


    sSql :=
      'SELECT se_id' +
       ' FROM art.use_usuarios' +
      ' WHERE se_usuario = art.utiles.get_superiorencasacentral(se_usuario)';
    sDestinatario := ValorSql(sSql);

    sSql :=
      'BEGIN' +
       ' intraweb.do_solicpermisorecotijefe(:nedadpromedio, :nestablecimientos, :nidprobabilidadcierre, :nidsolicitud, :scodmotivorecotizacion, :sobservaciones, :ssector, :susuario, :destinatario);' +
     ' END;';
    EjecutarSqlEx(sSql, [FieldByName('sc_edadpromedio').AsInteger,
                         FieldByName('sc_establecimientos').AsInteger,
                         FieldByName('sc_idprobabilidadcierre').AsInteger,
                         FieldByName('sc_id').AsInteger,
                         FieldByName('sc_codmotivorevision').AsString,
                         FieldByName('sc_motivorevision').AsString,
                         FieldByName('sc_sector').AsString,
                         Sesion.UserID,
                         sDestinatario]);
  end;

  MsgBox('Su pedido fue enviado a un superior para que lo autorice, la respuesta la recibirá vía e-mail.');
  tbRefrescarClick(nil);
end;

procedure TfrmConsultaSolicitud.edPeriodoChange(Sender: TObject);
begin
  if FCalcularDatos931 then
    CalcularDatos931(edPeriodo);
end;

procedure TfrmConsultaSolicitud.edNumeroCotizacionKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edOrden.SetFocus;
end;

procedure TfrmConsultaSolicitud.edSC_CUITExit(Sender: TObject);
begin
  Verificar((Length(edSC_CUIT.Text) > 0) and (not IsCuit(edSC_CUIT.Text)), edSC_CUIT, 'La C.U.I.T. no es correcta.');
  ValidarReservaCuit(edSC_CUIT.Text, False, edSC_CUIT);
end;

function TfrmConsultaSolicitud.GetTopeMinimoF931: Extended;
begin
  Result := edPorcVarTarifario.Value;

  if edPorcVarF931.Value < Result then
    Result := edPorcVarF931.Value;

  if (edDescuentoTopeF931.Value > 0) and (edPorcVarDescuento.Value < Result) then
    Result := edPorcVarDescuento.Value;

  if (edAumentoTopeF931.Value > 0) and (edPorcVarAumento.Value < Result) then
    Result := edPorcVarAumento.Value;
end;

function TfrmConsultaSolicitud.GetTopeMaximoF931: Extended;
begin
  Result := edPorcVarTarifario.Value;

  if edPorcVarF931.Value > Result then
    Result := edPorcVarF931.Value;

  if (edDescuentoTopeF931.Value > 0) and (edPorcVarDescuento.Value > Result) then
    Result := edPorcVarDescuento.Value;

  if (edAumentoTopeF931.Value > 0) and (edPorcVarAumento.Value > Result) then
    Result := edPorcVarAumento.Value;

  if Result > edPorcVarAumento.Value then   // La alícuota máxima es el tope..
    Result := edPorcVarAumento.Value;
end;

procedure TfrmConsultaSolicitud.btnAceptar8Click(Sender: TObject);
begin
  fpCostosF931.Close;
end;

procedure TfrmConsultaSolicitud.edAlicuotaFinalF931Change(Sender: TObject);
var
  rResultadoRC: Real;
begin
  rResultadoRC := GetValorResponsabilidadCivil(edfpSC_CUIT.Text, fraZonaGeografica.Codigo, FIdSolicitud, edfpSC_CANTTRABAJADOR.Value, GetSumaAseguradaRc, edfpSC_MASASALARIAL.Value,
                                               edAlicuotaFinalF931.Value, edSumaFijaF931.Value, 0);

  if (rResultadoRc >= 0) and (rbRCsi.Checked) then
  begin
    edAlicuotaVariableRCF931.Value := rResultadoRc;
    edSumaAseguradaRCF931.Value := GetSumaAseguradaRc;
  end
  else
  begin
    edAlicuotaVariableRCF931.Value := 0;
    edSumaAseguradaRCF931.Value := 0;
  end;

  edCuotaInicialRCF931.Value := edAlicuotaVariableRCF931.Value * edMasaSalarialRCF931.Value / 100;
end;

procedure TfrmConsultaSolicitud.fpCostosF931Close(Sender: TObject; var Action: TCloseAction);
begin
  Verificar((edAlicuotaFinalF931.Value < GetTopeMinimoF931) or (edAlicuotaFinalF931.Value > GetTopeMaximoF931), edAlicuotaFinalF931, Format('El campo Alícuota FINAL debe estar entre %s y %s.', [FormatFloat('##0.000%', GetTopeMinimoF931), FormatFloat('##0.000%', GetTopeMaximoF931)]));

  inherited;
end;

procedure TfrmConsultaSolicitud.btnImprimirClick(Sender: TObject);
const
  MAX_INTENTOS = 20;
var
  iLoop: Integer;
  sArchivo: String;
  sRuta: String;
  sUrl: String;
begin
  sArchivo := Sesion.UserID + '_' + FormatDateTime('yyyymmddhhnnss', DBDateTime) + '.pdf';

  if Is_ConectadoProduccion then
  begin
    sURL := Format('http://www.provinciart.com.ar/modules/solicitud_afiliacion/reporte_responsabilidad_civil.php?idmodulo=C%d&idestablecimiento=&f=%s', [FIdSolicitud, sArchivo]);
    sRuta := '\\ntwebart1\Storage_Data\Suscripciones\Responsabilidad_Civil\';
  end
  else
  begin
    sURL := Format('http://extranet-desa.artprov.com.ar/modules/solicitud_afiliacion/reporte_responsabilidad_civil.php?idmodulo=C%d&idestablecimiento=&f=%s', [FIdSolicitud, sArchivo]);
    sRuta := '\\ntwebart3\Storage_Data\Suscripciones\Responsabilidad_Civil\';
  end;

  IdHttp1.Get(sURL);

  iLoop := 0;
  while not FileExists(sRuta + sArchivo) do
  begin
    if iLoop > MAX_INTENTOS then
    begin
      MsgBox('No se pudo generar el reporte de Responsabilidad Civil.', MB_ICONERROR);
      Break;
    end;

    Sleep(500);
    Inc(iLoop);
  end;

  AbrirPDF(sRuta + sArchivo);
end;

function TfrmConsultaSolicitud.GetTopeMinimoVariableClonacion: Extended;
begin
  Result := edPorVarAlicuotaActualCotizada.Value;

  if (edPorVarAlicuotaMinima.Visible) and (edPorVarAlicuotaMinima.Value < Result) then
    Result := edPorVarAlicuotaMinima.Value;
end;

function TfrmConsultaSolicitud.GetTopeMaximoVariableClonacion: Extended;
begin
  Result := edPorVarAlicuotaActualCotizada.Value;

  if (edPorVarAlicuotaMinima.Visible) and (edPorVarAlicuotaMinima.Value > Result) then
    Result := edPorVarAlicuotaMinima.Value;

  if edPorVarAlicuotaMaxima.Value > Result then
    Result := edPorVarAlicuotaMaxima.Value;
end;

function TfrmConsultaSolicitud.GetTopeMinimoFijoClonacion: Extended;
begin
  Result := edSumaFijaAlicuotaActualCotizada.Value;

  if (edSumaFijaAlicuotaMinima.Visible) and (edSumaFijaAlicuotaMinima.Value < Result) then
    Result := edSumaFijaAlicuotaMinima.Value;
end;

function TfrmConsultaSolicitud.GetTopeMaximoFijoClonacion: Extended;
begin
  Result := edSumaFijaAlicuotaActualCotizada.Value;

  if (edSumaFijaAlicuotaMinima.Visible) and (edSumaFijaAlicuotaMinima.Value > Result) then
    Result := edSumaFijaAlicuotaMinima.Value;

  if edSumaFijaAlicuotaMaxima.Value > Result then
    Result := edSumaFijaAlicuotaMaxima.Value;
end;

procedure TfrmConsultaSolicitud.fpCostosClonacionClose(Sender: TObject; var Action: TCloseAction);
begin
  Verificar((edAlicuotaVariable.Value < GetTopeMinimoVariableClonacion) or (edAlicuotaVariable.Value > GetTopeMaximoVariableClonacion), edAlicuotaVariable, Format('El campo Alícuota Variable debe estar entre %s y %s.', [FormatFloat('##0.000%', GetTopeMinimoVariableClonacion), FormatFloat('##0.000%', GetTopeMaximoVariableClonacion)]));
  Verificar((edAlicuotaFija.Value < GetTopeMinimoFijoClonacion) or (edAlicuotaFija.Value > GetTopeMaximoFijoClonacion), edAlicuotaFija, Format('El campo Alícuota Fija debe estar entre %s y %s.', [FormatFloat('$ ##0.00', GetTopeMinimoFijoClonacion), FormatFloat('$ ##0.00', GetTopeMaximoFijoClonacion)]));

  inherited;
end;

procedure TfrmConsultaSolicitud.btnAceptar9Click(Sender: TObject);
begin
  // Valido que tenga algún costo cargado..
  Verificar((edAlicuotaVariable.Value = 0), edAlicuotaVariable, 'La Alícuota Variable debe ser mayor a cero.');

  FCostosClonacionOk := True;
  fpCostosClonacion.Close;
end;

procedure TfrmConsultaSolicitud.edAlicuotaVariableChange(Sender: TObject);
var
  rResultadoRC: Real;
begin
  rResultadoRC := GetValorResponsabilidadCivil(edfpSC_CUIT.Text, fraZonaGeografica.Codigo, FIdSolicitud, edfpSC_CANTTRABAJADOR.Value, GetSumaAseguradaRc,
                                               edfpSC_MASASALARIAL.Value, edAlicuotaVariable.Value, edAlicuotaFija.Value, 0);

  if (rResultadoRc >= 0) and (rbRCsi.Checked) then
  begin
    edAlicuotaVariableRCClonacion.Value := rResultadoRc;
    edSumaAseguradaRCClonacion.Value    := GetSumaAseguradaRc;
  end
  else
  begin
    edAlicuotaVariableRCClonacion.Value := 0;
    edSumaAseguradaRCClonacion.Value := 0;
  end;

  edCuotaInicialRCClonacion.Value := edAlicuotaVariableRCClonacion.Value * edMasaSalarialRCClonacion.Value / 100;
end;

procedure TfrmConsultaSolicitud.btnPasarCotizacionATecnicaClick(Sender: TObject);
begin
  FCostosClonacionOk := False;
  fpCostosClonacion.Close;
end;

procedure TfrmConsultaSolicitud.ValidarReservaCuit(const aCuit: String; const aValidarPorVendedor: Boolean; aFoco: TControl = nil);
var
  bDistintoVendedor: Boolean;
  sMsg: String;
  sSql: String;
begin
  sSql :=
    'SELECT ru.*, ca_descripcion canal, en_nombre entidad, ru_fechadesde fechadesde, ru_fechahasta fechahasta, ve_nombre vendedor' +
     ' FROM aru_reservacuit ru, aca_canal, xen_entidad, xve_vendedor' +
    ' WHERE ru_idcanal = ca_id(+)' +
      ' AND ru_identidad = en_id(+)' +
      ' AND ru_idvendedor = ve_id(+)' +
      ' AND ru_cuit = :cuit' +
      ' AND ru_fechabaja IS NULL' +
      ' AND actualdate BETWEEN ru_fechadesde AND ru_fechahasta';
  with GetQueryEx(sSql, [aCuit]) do
  try
    if not Eof then
    begin
      sMsg := Format(
        'Esta C.U.I.T. se encuentra reservada entre el %s y el %s por ' + #13 + #10 +
        'CANAL: %s' + #13 + #10 +
        'ENTIDAD: %s',
        [FieldByName('fechadesde').AsString, FieldByName('fechahasta').AsString, FieldByName('canal').AsString, FieldByName('entidad').AsString]);

      if FieldByName('vendedor').AsString <> '' then
        sMsg := sMsg + #13 + #10 + 'VENDEDOR: ' + FieldByName('vendedor').AsString;

      if aValidarPorVendedor then
      begin
        bDistintoVendedor := (FieldByName('vendedor').AsString <> '') and (FieldByName('ru_idvendedor').AsInteger <> sdqConsulta.FieldByName('sc_idvendedor').AsInteger);

        if (FieldByName('ru_idcanal').AsInteger <> sdqConsulta.FieldByName('sc_canal').AsInteger) or (FieldByName('ru_identidad').AsInteger <> sdqConsulta.FieldByName('sc_identidad').AsInteger) or (bDistintoVendedor) then
          Verificar(True, aFoco, sMsg);
      end
      else
        InfoHint(aFoco, sMsg, False, 'C.U.I.T. RESERVADA', blnInfo, 10, False);
    end;
  finally
    Free;
  end;
end;

procedure TfrmConsultaSolicitud.FillGridPCP;
var
  iTotalAlicuota: Integer;
  iTotalFilas: Integer;
  iTotalTrabajadores: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT (SELECT cp_canttrabajador' +
             ' FROM afi.acp_cotizacion_pcp' +
            ' WHERE cp_idparametro_pcp = pp_id' +
              ' AND cp_idsolicitudcotizacion = :idsolicitudcotizacion) canttrabajador, pp_descripcion, pp_id, pp_valor' +
     ' FROM afi.app_parametro_pcp' +
    ' WHERE art.actualdate BETWEEN pp_fechadesde AND pp_fechahasta' +
      ' AND pp_fechabaja IS NULL' +
 ' ORDER BY pp_renglon';
  with GetQueryEx(sSql, [FIdSolicitud]) do
  try
    iTotalAlicuota := 0;
    iTotalFilas := 0;
    iTotalTrabajadores := 0;

    while not Eof do
    begin
      Inc(iTotalFilas);
      Next;
    end;

    sgGridPCP.Height := (iTotalFilas + 2) * 18;
    sgGridPCP.RowCount := iTotalFilas + 2;
    gbPCP.Height := sgGridPCP.Height + 80;

    sgGridPCP.Cells[0, 0] := 'Horas Trabajadas Semanalmente';
    sgGridPCP.Cells[1, 0] := 'ID';
    sgGridPCP.Cells[2, 0] := '# Trabajadores';
    sgGridPCP.Cells[3, 0] := 'Valor';
    sgGridPCP.Cells[4, 0] := 'Alícuota';

    First;
    iTotalFilas := 1;
    while not Eof do
    begin
      sgGridPCP.Cells[0, iTotalFilas] := FieldByName('pp_descripcion').AsString;
      sgGridPCP.Cells[1, iTotalFilas] := FieldByName('pp_id').AsString;
      sgGridPCP.Cells[2, iTotalFilas] := FieldByName('canttrabajador').AsString;
      sgGridPCP.Cells[3, iTotalFilas] := FieldByName('pp_valor').AsString;
      sgGridPCP.Cells[4, iTotalFilas] := IntToStr(FieldByName('canttrabajador').AsInteger * FieldByName('pp_valor').AsInteger);
      Inc(iTotalFilas);

      iTotalAlicuota := iTotalAlicuota + (FieldByName('canttrabajador').AsInteger * FieldByName('pp_valor').AsInteger);
      iTotalTrabajadores := iTotalTrabajadores + FieldByName('canttrabajador').AsInteger;
      Next;
    end;

    sgGridPCP.Cells[0, iTotalFilas] := 'Cuota Inicial Resultante (*)';
    sgGridPCP.Cells[1, iTotalFilas] := '';
    sgGridPCP.Cells[2, iTotalFilas] := IntToStr(iTotalTrabajadores);
    sgGridPCP.Cells[3, iTotalFilas] := '';
    sgGridPCP.Cells[4, iTotalFilas] := IntToStr(iTotalAlicuota);
  finally
    Free;
  end;
end;

procedure TfrmConsultaSolicitud.GuardarPCP(const aIdSolicitud: Integer);
var
  aSql: TSql;
  bEsAlta: Boolean;
  iLoop: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM afi.acp_cotizacion_pcp' +
    ' WHERE cp_idsolicitudcotizacion = :idsolicitudcotizacion';
  bEsAlta := not ExisteSqlEx(sSql, [aIdSolicitud]);

  aSql := TSql.Create('afi.acp_cotizacion_pcp');
  try
    for iLoop := 1 to sgGridPCP.RowCount - 2 do
    begin
      aSql.Clear;

      if sgGridPCP.Cells[2, iLoop] = '' then
        sgGridPCP.Cells[2, iLoop] := '0';

      if bEsAlta then
      begin
        aSql.SqlType := stInsert;
        aSql.Fields.AddInteger('cp_idparametro_pcp', StrToInt(sgGridPCP.Cells[1, iLoop]));
        aSql.Fields.AddInteger('cp_idsolicitudcotizacion', aIdSolicitud);
        aSql.Fields.AddString('cp_usualta', Sesion.UserID);
      end
      else
      begin
        aSql.SqlType := stUpdate;
        aSql.PrimaryKey.Add('cp_idparametro_pcp', StrToInt(sgGridPCP.Cells[1, iLoop]));
      end;

      aSql.Fields.AddInteger('cp_alicuota', StrToInt(sgGridPCP.Cells[2, iLoop]) * StrToInt(sgGridPCP.Cells[3, iLoop]));
      aSql.Fields.AddInteger('cp_canttrabajador', StrToInt(sgGridPCP.Cells[2, iLoop]));

      EjecutarSqlST(aSql.Sql);
    end;
  finally
    aSql.Free;
  end;
end;

procedure TfrmConsultaSolicitud.SetearValoresSoloPCP;
begin
  if chkSoloPCP.Checked then
  begin
    edfpSC_ACTIVIDADREAL.Text := 'Servicios de hogares privados que contratan servicio doméstico';
    edEstablecimientos.Value := 0;
    frafpSC_IDACTIVIDAD.Codigo := '950000';
    edSC_EDADPROMEDIO.Value := 35;
    edfpSC_MASASALARIAL1.Value := 0;
    edPeriodo.Periodo.Valor := FormatDateTime('yyyymm', DBDate);
    rbSinDatos.Checked;
    fraSector.Codigo := '4';
    fraStatusBCRA.Value := '-1';
    edfpSC_CANTTRABAJADOR.Value := StrToInt(sgGridPCP.Cells[2, sgGridPCP.RowCount - 1]);
    edfpSC_CANTTRABAJADOR1.Value := StrToInt(sgGridPCP.Cells[2, sgGridPCP.RowCount - 1]);
    fraZonaGeografica.Value := 1;
  end;
end;

procedure TfrmConsultaSolicitud.VerificarPCP;
var
  sSql: String;
begin
  if Copy(edfpSC_CUIT.Text, 1, 1) <> '3' then
  begin
    gbSoloPCP.Show;

    sSql :=
    'SELECT ac_codigo' +
     ' FROM srt.sem_empresas, srt.shv_historialvigencias, cac_actividad' +
    ' WHERE em_id = hv_idempresa' +
      ' AND hv_ciiu = ac_codigo' +
      ' AND em_cuit = :cuit' +
 ' ORDER BY hv_vigenciadesde DESC';
    if ValorSqlIntegerEx(sSql, [edfpSC_CUIT.Text]) = 950000 then
      gbPCP.Show
    else if not fraSC_IDARTANTERIOR.IsEmpty then
      gbPCP.Hide
    else
      gbPCP.Show;
  end
  else
  begin
    gbSoloPCP.Hide;

    if fraSC_IDARTANTERIOR.IsEmpty then
      gbPCP.Show
    else
      gbPCP.Hide;
  end;
end;

function TfrmConsultaSolicitud.GetImportePCP: Extended;
var
  iLoop: Integer;
begin
  Result := 0;

  for iLoop := 1 to sgGridPCP.RowCount - 2 do
    if sgGridPCP.Cells[2, iLoop] <> '' then
      Result := Result + (StrToInt(sgGridPCP.Cells[2, iLoop]) * StrToInt(sgGridPCP.Cells[3, iLoop]));
end;

end.
