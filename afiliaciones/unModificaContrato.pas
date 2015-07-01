unit unModificaContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, Placemnt, artSeguridad, ToolWin, ShortCutControl, StdCtrls, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas, Mask, ToolEdit, DateComboBox, IntEdit, PatternEdit, RxDBComb, Db, SDEngine, RxLookup, ArtComboBox, unArt, unFraDomicilio,
  CurrEdit, ExtCtrls, unFraActividad, LookupDialog, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, CardinalEdit, FormPanel, unfraStaticActividad, Menus,
  unfraMotivoEndoso, unFraDomicilioTrab, unArtDBAwareFrame, AnsiSQL, unFraTelefono, JvComponent, JvAppHotKey, unFraCodDesc, Buttons, Grids, DBGrids, RXDBCtrl, ArtDBGrid,
  unArtDbFrame, unfraContacto, unFraEmpresa, BaseGrid, AdvGrid, OleServer, StrUtils, Excel2000,
  JvComponentBase, RxPlacemnt, AdvObj, RxToolEdit, RxCurrEdit;

type
  TEstadoForm = (efSeleccionContrato, efContratoFijo, efConsultaContrato, efEndososMultiples, efSinContrato, efModificaEndoso, efCampania);

  TPersoneria = record
    iCaracter: Integer;
    iNombre: Integer;   //Index of edFirmante
    sCargo: String;
  end;

  TfrmModificacionContrato = class(TForm)
    Seguridad: TSeguridad;
    ShortCutControl: TShortCutControl;
    ToolBar: TToolBar;
    tblNomina: TToolButton;
    tblEstablecimiento: TToolButton;
    tblImprimir: TToolButton;
    tblSalir: TToolButton;
    sdqNombresEmpresas: TSDQuery;
    tblSRT: TToolButton;
    tbVendedor: TToolButton;
    tbContactos: TToolButton;
    tbTarifa: TToolButton;
    tbEndosos: TToolButton;
    tbCartas: TToolButton;
    PgContrato: TPageControl;
    tbContrato: TTabSheet;
    tsDomicilio: TTabSheet;
    NroContratoPanel: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cmbCO_FECHAIMPRESION: TDateComboBox;
    cmbCO_RECEPCONTRATO: TDateComboBox;
    grbVigenciaContrato: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    cmbCO_VIGENCIADESDE: TDateComboBox;
    cmbCO_VIGENCIAHASTA: TDateComboBox;
    lbOrigen: TLabel;
    lbFechaAfiliacion: TLabel;
    lbFRecepcion: TLabel;
    fraCO_ORIGEN: TfraStaticCTB_TABLAS;
    edCO_FECHAAFILIACION: TDateComboBox;
    edCO_FECHARECEPCION: TDateComboBox;
    lbARTAnterior: TLabel;
    lbMotivoAlta: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbCO_IDARTFUTURA: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    fraCO_MOTIVOALTA: TfraStaticCTB_TABLAS;
    fraAR_NOMBRE: TfraStaticCodigoDescripcion;
    fraCO_IDARTFUTURA: TfraStaticCodigoDescripcion;
    cmbCO_FECHABAJA: TDateComboBox;
    lbObservacion: TLabel;
    grbCuadroTarifario: TGroupBox;
    lbCIIU: TLabel;
    lbNivel: TLabel;
    lbMasaSalarial: TLabel;
    lbCantEmpleados: TLabel;
    edNIVEL: TPatternEdit;
    edMASATOTAL: TCurrencyEdit;
    edTOTEMPLEADOS: TCurrencyEdit;
    edCO_OBSERVACIONES: TMemo;
    grbFranquicia: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    edCO_DIASFRANQUICIA: TCurrencyEdit;
    cmbCO_VIGENCIAFRANQUICIA: TDateComboBox;
    grbClausulasEspeciales: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    cmbCO_VIGENCIACLAUSULA: TDateComboBox;
    grbDomicilioLegal: TGroupBox;
    lbCAFAX: TLabel;
    lbFAX: TLabel;
    edDC_FAX: TPatternEdit;
    edDC_CODAREAFAX: TPatternEdit;
    grbDomicilioPostal: TGroupBox;
    lbCAFaxPostal: TLabel;
    lbFaxPostal: TLabel;
    edDC_CODAREAFAX_POST: TPatternEdit;
    edDC_FAX_POST: TPatternEdit;
    lbRazonSocial: TLabel;
    lbCUIT: TLabel;
    edEM_CUIT: TMaskEdit;
    Label17: TLabel;
    edDC_OBSERVACIONESLegal: TMemo;
    lbFormaJuridica: TLabel;
    fraEM_FORMAJ: TfraStaticCTB_TABLAS;
    lbSector: TLabel;
    fraEM_SECTOR: TfraStaticCTB_TABLAS;
    lbHolding: TLabel;
    lbSUSS: TLabel;
    fraEM_SUSS: TfraStaticCTB_TABLAS;
    Label18: TLabel;
    edDC_OBSERVACIONESPostal: TMemo;
    fraCO_ESTADO: TfraStaticCTB_TABLAS;
    fraCO_CLAUSULAESPECIAL: TfraStaticCTB_TABLAS;
    tbGuardar: TToolButton;
    ToolButton4: TToolButton;
    lbNroFormulario: TLabel;
    edFO_FORMULARIO: TEdit;
    lbFInicioAct: TLabel;
    edEM_FEINICACTIV: TDateComboBox;
    tsEndosos: TTabSheet;
    tbGestorCuenta: TToolButton;
    tbEjecutivoCuenta: TToolButton;
    cmbEM_NOMBRE: TArtComboBox;
    dsNombresEmpresas: TDataSource;
    fraCO_MOTIVOBAJA: TfraStaticCTB_TABLAS;
    tbLimpiar: TToolButton;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label19: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    cmbEN_VIGENCIAENDOSO: TDateComboBox;
    edEN_USUALTA: TEdit;
    cmbEN_FECHAALTA: TDateComboBox;
    cmbEN_FECHAIMPRESION: TDateComboBox;
    cmbEN_FENVIOSTR: TDateComboBox;
    cmbEN_FRECEPCIONSTR: TDateComboBox;
    edEN_TIPOENVIOSTR: TEdit;
    edEN_CODRECHAZOSTR: TEdit;
    edEN_CODOBSERVACIONSTR: TEdit;
    edEN_ENDOSO: TEdit;
    edEN_MOVIMIENTO: TEdit;
    fraEN_MOTIVO: TfraStaticCTB_TABLAS;
    lbVigencia: TLabel;
    Label34: TLabel;
    cmbEN_VIGENCIAENDOSO_Alta: TDateComboBox;
    ToolButton2: TToolButton;
    tbCambiarCuit: TToolButton;
    fpDialogCambioCuit: TFormPanel;
    BevelAbm: TBevel;
    btnAceptarCambioCuit: TButton;
    btnCancelarCambioCuit: TButton;
    edCuitActual: TMaskEdit;
    lbCuitAnterior: TLabel;
    edCuitNuevo: TMaskEdit;
    lbCuitNuevo: TLabel;
    fraCIIU: TfraStaticActividad;
    fraCIIU2: TfraStaticActividad;
    fraCIIU3: TfraStaticActividad;
    Label3: TLabel;
    Label33: TLabel;
    tbHerramientas: TToolBar;
    tbPrimero: TToolButton;
    tbAnterior: TToolButton;
    tbSiguiente: TToolButton;
    tbUltimo: TToolButton;
    ToolBu5: TToolButton;
    edtbDesc: TEdit;
    ToolButton1: TToolButton;
    Label35: TLabel;
    edtbEndoso: TEdit;
    ToolButton3: TToolButton;
    Label36: TLabel;
    edtbMov: TEdit;
    ToolButton5: TToolButton;
    Label37: TLabel;
    edtbVigencia: TDateComboBox;
    Label38: TLabel;
    Label39: TLabel;
    tbCuentasBancarias: TToolButton;
    cbEN_ENVIOSRT: TCheckBox;
    cbEN_ENVIOCARTA: TCheckBox;
    cbEN_NOTASRT: TCheckBox;
    cbEN_ENVIOSRT_C: TCheckBox;
    cbEN_ENVIOCARTA_C: TCheckBox;
    cbEN_NOTASRT_C: TCheckBox;
    fraCO_IDGESTOR: TfraStaticCodigoDescripcion;
    fraCO_IDEJECUTIVO: TfraStaticCodigoDescripcion;
    fraEN_MOTIVO_Alta: TfraMotivoEndoso;
    tbExtensionVigencia: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    lblAfiliacion: TLabel;
    edCO_CONTRATO: TIntEdit;
    tbModificarEndoso: TToolButton;
    ToolButton8: TToolButton;
    tbTraspasoIngreso: TToolButton;
    cbCO_ADDENDA: TCheckBox;
    FormStorage: TFormStorage;
    tbGestorAumento: TToolButton;
    fraCO_IDESTUDIOCONTABLE: TfraStaticCodigoDescripcion;
    Label20: TLabel;
    edCO_DIRELECTRONICA: TEdit;
    Label31: TLabel;
    edCO_PAGINAWEB: TEdit;
    Label24: TLabel;
    fpModificaFechasSRT: TFormPanel;
    Bevel1: TBevel;
    Label32: TLabel;
    btnAceptarModFecSRT: TButton;
    btnCancelarModFecSRT: TButton;
    cmbEnvioSRT: TDateComboBox;
    ToolButton10: TToolButton;
    Label40: TLabel;
    cmbRecepcionSRT: TDateComboBox;
    tbFechaSRT: TToolButton;
    tbPreventor: TToolButton;
    tbDelegacion: TToolButton;
    ToolButton12: TToolButton;
    fraTelefonoLegal: TfraTelefono;
    fraTelefonoPostal: TfraTelefono;
    fraDOMICILIO_LEGAL: TfraDomicilio;
    fraDOMICILIO_POSTAL: TfraDomicilio;
    lbFechaRecepcionAfiliaciones: TLabel;
    dcbFechaRecepcionAfiliaciones: TDateComboBox;
    tbRecepcionCarta: TToolButton;
    fpRecepcionCarta: TFormPanel;
    Bevel2: TBevel;
    Label41: TLabel;
    lbCodRecepcion: TLabel;
    btnRecepcionAceptar: TButton;
    btnCancelar: TButton;
    dcbFechaRecepcion: TDateComboBox;
    rgRecepOk: TRadioGroup;
    Label42: TLabel;
    dcbFechaImpresion: TDateComboBox;
    cbRecepcionSi: TComboBox;
    btnCerrar: TButton;
    Label43: TLabel;
    edDC_MAIL: TEdit;
    Label44: TLabel;
    edDC_MAIL_POST: TEdit;
    popupNominas: TPopupMenu;
    mnuNominaIndividual: TMenuItem;
    mnuNominaMasiva: TMenuItem;
    JvApplicationHotKey: TJvApplicationHotKey;
    lbFechaRecepcionContratoFirmado: TLabel;
    edFechaRecepcionContratoFirmado: TDateComboBox;
    fraEM_IDGRUPOECONOMICO: TfraCodDesc;
    checkPagoDirecto: TCheckBox;
    GroupBox2: TGroupBox;
    Label45: TLabel;
    edNumeroFormRectificacionDatos: TIntEdit;
    edDetalleRectificacionDatos: TEdit;
    edNumeroFormRectificacionDatosActual: TIntEdit;
    checkLimpiarRechazo: TCheckBox;
    cbCO_ADDENDA_DDJJ: TCheckBox;
    lbDesmarcarEnvioSRT: TLabel;
    chkNoTieneEmail: TCheckBox;
    Label46: TLabel;
    fraOrigenDatoEmail: TfraCodigoDescripcion;
    Label47: TLabel;
    edFechaRecepcionVentanillaElectronica: TDateComboBox;
    tbDocumentacion: TToolButton;
    fpDocumentacion: TFormPanel;
    sdqDocumentacion: TSDQuery;
    tbVisualizadorDocumentacionDigitalizada: TToolButton;
    GroupBox3: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    edFechaImpresion: TDateComboBox;
    rgRecepcionOk: TRadioGroup;
    edFechaRecepcion: TDateComboBox;
    edCodigoRecepcion: TEdit;
    edFechaRecepcionAnexoFirmado: TDateComboBox;
    edFechaRecepcionContratoFirmado2: TDateComboBox;
    pbControles: TPanel;
    gbPresentoRgrl: TGroupBox;
    chkContratoFirmado: TCheckBox;
    gbCotizacion: TGroupBox;
    chkCotizacionTitular: TCheckBox;
    chkCotizacionVendedor: TCheckBox;
    chkCotizacionCotizacion: TCheckBox;
    btnAceptar: TButton;
    btnCerrar2: TButton;
    gbDatosModificacion: TGroupBox;
    Label14: TLabel;
    Label48: TLabel;
    edUsuario: TEdit;
    edFecha: TDateComboBox;
    pnBotones: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    tbBotones: TToolBar;
    tbPrimero2: TToolButton;
    tbAnterior2: TToolButton;
    tbSiguiente2: TToolButton;
    tbUltimo2: TToolButton;
    edEndoso: TEdit;
    edMovimiento: TEdit;
    btnRevisionLegajo: TButton;
    tsIndicadores: TTabSheet;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    edAltaContrato: TEdit;
    edAprobacionSrt: TEdit;
    edEnvioContratoCliente: TEdit;
    edTotalDias: TEdit;
    btnGuardar: TBitBtn;
    btnEditar: TBitBtn;
    tsFirmante: TTabSheet;
    sdqDatosContacto: TSDQuery;
    sdDatosContacto: TDataSource;
    sdqSucesos: TSDQuery;
    sdPep: TDataSource;
    fpGuardarFirmante: TFormPanel;
    btnCerrarFirmante: TButton;
    btnAceptarFirmante: TButton;
    GroupBox4: TGroupBox;
    rbRevisionLegajo: TRadioButton;
    rbRevisionIncorporaDoc: TRadioButton;
    rbRevisionDDJJ: TRadioButton;
    rbRevisionNada: TRadioButton;
    fpErroresEndoso: TFormPanel;
    ToolBar3: TToolBar;
    tbExcel: TToolButton;
    tbImprimirErrores: TToolButton;
    GroupBox5: TGroupBox;
    btnAceptarErrores: TButton;
    GridSrt: TAdvStringGrid;
    ExcelApp: TExcelApplication;
    ExcelWS: TExcelWorksheet;
    ExcelWB: TExcelWorkbook;
    dcbRecepcionFechaFax: TDateComboBox;
    lbFechaRecepcionFax: TLabel;
    lbUsuRevision: TLabel;
    edUsuarioRevision: TEdit;
    lbFechaRevision: TLabel;
    edFechaRevision: TEdit;
    GroupBox6: TGroupBox;
    edCO_USUARIORECEPCIONSECTORAFI: TEdit;
    edCO_FECHAALTASECTORAFI: TEdit;
    Label59: TLabel;
    Label64: TLabel;
    tbImprimirUltimaRenovacion: TToolButton;
    mnuRenovacionAutomatica: TPopupMenu;
    mnuImprimirRenovacionAutomatica: TMenuItem;
    mnuMailRenovacionAutomatica: TMenuItem;
    sdspExposicion: TSDStoredProc;
    edComentariosAddenda: TMemo;
    cbCO_ADDENDAESPECIAL: TCheckBox;
    lbComentariosAddenda: TLabel;
    fpTareaSIC: TFormPanel;
    Label58: TLabel;
    Label65: TLabel;
    edObservacionSIC: TMemo;
    btnAceptarSIC: TButton;
    btnCancelarSIC: TButton;
    GridDocFaltante: TAdvStringGrid;
    ToolBar4: TToolBar;
    tbCheckSic: TToolButton;
    tbUncheckSic: TToolButton;
    ToolButton11: TToolButton;
    tbSalirSic: TToolButton;
    btnCopiarDomicilio: TBitBtn;
    fraRecepcionNo: TfraCodigoDescripcion;
    ScrollBox1: TScrollBox;
    tbFirmante: TToolBar;
    tbRefresh: TToolButton;
    tbNuevoFirmante: TToolButton;
    tbModif: TToolButton;
    tbElim: TToolButton;
    ToolButton13: TToolButton;
    tbGuarda: TToolButton;
    tbCancel: TToolButton;
    ToolButton9: TToolButton;
    tbReactivar: TToolButton;
    tbEliminarSucesos: TToolButton;
    fraEmpresaFirmante: TfraEmpresa;
    pnlFirmante: TPanel;
    Label66: TLabel;
    ToolBar1: TToolBar;
    tbPrimerSuceso: TToolButton;
    tbAnteriorSuceso: TToolButton;
    tbProximoSuceso: TToolButton;
    tbUltimoSuceso: TToolButton;
    edSuceso: TEdit;
    dbGridContactos: TArtDBGrid;
    gbContacto: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label74: TLabel;
    Label69: TLabel;
    fraContacto: TfraContacto;
    fraCaracter: TfraCodigoDescripcion;
    edNumeroDocumento: TEdit;
    fraTipoDocumento: TfraCtbTablas;
    cboxSexo: TComboBox;
    fraTipoFirmante: TfraCtbTablas;
    btnBuscarContacto: TButton;
    gbFirmaPersoneriaFirmante: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    gbFormulariosAnexosFirmante: TGroupBox;
    rbRefreshDocFirmante: TBitBtn;
    gbPep: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    lbWorldsys: TLabel;
    chkPep: TCheckBox;
    chkFirma1: TCheckBox;
    chkFirma2: TCheckBox;
    cboxEsPep: TComboBox;
    btnWorldSys: TButton;
    gbInformeComercial: TGroupBox;
    Label56: TLabel;
    btnInformeComercial: TButton;
    btnVisualizar: TButton;
    edInformeFecha: TEdit;
    gbContrato: TGroupBox;
    chkContratoFirmadoPep: TCheckBox;
    ToolBar2: TToolBar;
    tbGuardarEstadoContrato: TToolButton;
    cboxComentario: TGroupBox;
    edComentarios: TMemo;
    btnRevisionPep: TButton;
    gbRevisionPepComentario: TGroupBox;
    Label57: TLabel;
    edRevisionPep: TEdit;
    edRevisionPepComentario: TMemo;
    edExposicion: TEdit;
    edExpNum: TEdit;
    edExp: TEdit;
    gbDatosModificacionFirmante: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    edUsuarioFirmante: TEdit;
    edFechaFirmante: TDateComboBox;
    chkVerBajas: TCheckBox;
    tblLugarTrabajo: TToolButton;
    tblRiesgoPCP: TToolButton;
    ToolButton15: TToolButton;
    ToolBar5: TToolBar;
    lbRE: TLabel;
    fpTarifaPCP: TFormPanel;
    pnlPCP: TPanel;
    Label80: TLabel;
    GroupBox7: TGroupBox;
    Bevel3: TBevel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    edCantTrabMenosDe12: TIntEdit;
    edCantTrabDe12a16: TIntEdit;
    edCantTrabMasDe16: TIntEdit;
    edAlicuotaMenosDe12: TCurrencyEdit;
    edAlicuotaDe12a16: TCurrencyEdit;
    edAlicuotaMasDe16: TCurrencyEdit;
    edAlicuota: TCurrencyEdit;
    edValorMenosDe12: TCurrencyEdit;
    edValorDesde12a16: TCurrencyEdit;
    edValorMasDe16: TCurrencyEdit;
    btnAceptarPCP: TButton;
    btnCancelarPCP: TButton;
    btnCambiarOrigen: TBitBtn;
    btnGuardarOrigen: TBitBtn;
    procedure tblSalirClick(Sender: TObject);
    procedure cmbEM_NOMBREDropDown(Sender: TObject);
    procedure cmbEM_NOMBRECloseUp(Sender: TObject);
    procedure edEM_CUITExit(Sender: TObject);
    procedure edCO_CONTRATOExit(Sender: TObject);
    procedure edFO_FORMULARIOExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tblNominaClick(Sender: TObject);
    procedure tblEstablecimientoClick(Sender: TObject);
    procedure tblSRTClick(Sender: TObject);
    procedure tbVendedorClick(Sender: TObject);
    procedure tbContactosClick(Sender: TObject);
    procedure tbTarifaClick(Sender: TObject);
    procedure tbEndososClick(Sender: TObject);
    procedure tbCartasClick(Sender: TObject);
    procedure tbGestorCuentaClick(Sender: TObject);
    procedure tbEjecutivoCuentaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraCO_MOTIVOBAJAExit(Sender: TObject);
    procedure fraEN_MOTIVO_AltaOnChange(Sender: TObject);
    procedure btnAceptarCambioCuitClick(Sender: TObject);          
    procedure tbCambiarCuitClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure tbPrimeroClick(Sender: TObject);
    procedure tbSiguienteClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tblImprimirClick(Sender: TObject);
    procedure tbCuentasBancariasClick(Sender: TObject);
    procedure cmbEM_NOMBREGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fraCO_CLAUSULAESPECIALExit(Sender: TObject);
    procedure fraCO_ESTADOExit(Sender: TObject);
    procedure tbExtensionVigenciaClick(Sender: TObject);
    procedure edEM_CUITKeyPress(Sender: TObject; var Key: Char);
    procedure tbModificarEndosoClick(Sender: TObject);
    procedure tbTraspasoIngresoClick(Sender: TObject);
    procedure tbGestorAumentoClick(Sender: TObject);
    procedure btnAceptarModFecSRTClick(Sender: TObject);
    procedure tbFechaSRTClick(Sender: TObject);
    procedure tbDelegacionClick(Sender: TObject);
    procedure tbPreventorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbRecepcionCartaClick(Sender: TObject);
    procedure ClearDatosFormRecepcion;
    procedure rgRecepOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRecepcionAceptarClick(Sender: TObject);
    procedure fpRecepcionCartaShow(Sender: TObject);
    procedure cmbCO_RECEPCONTRATOExit(Sender: TObject);
    procedure mnuNominaIndividualClick(Sender: TObject);
    procedure mnuNominaMasivaClick(Sender: TObject);
    procedure JvApplicationHotKeyHotKey(Sender: TObject);
    procedure cbRecepcionSiChange(Sender: TObject);
    procedure edNumeroFormRectificacionDatosExit(Sender: TObject);
    procedure fpModificaFechasSRTBeforeShow(Sender: TObject);
    procedure lbDesmarcarEnvioSRTMouseEnter(Sender: TObject);
    procedure lbDesmarcarEnvioSRTMouseLeave(Sender: TObject);
    procedure lbDesmarcarEnvioSRTClick(Sender: TObject);
    procedure chkNoTieneEmailClick(Sender: TObject);
    procedure edNumeroFormRectificacionDatosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CambiaMotivoBaja(Sender: TObject);
    procedure btnCerrar2Click(Sender: TObject);
    procedure fpDocumentacionBeforeShow(Sender: TObject);
    procedure sdqDocumentacionAfterScroll(DataSet: TDataSet);
    procedure tbPrimero2Click(Sender: TObject);
    procedure tbAnterior2Click(Sender: TObject);
    procedure tbSiguiente2Click(Sender: TObject);
    procedure tbUltimo2Click(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbDocumentacionClick(Sender: TObject);
    procedure tbVisualizadorDocumentacionDigitalizadaClick(Sender: TObject);
    procedure fraDOMICILIO_POSTALbtnBuscarClick(Sender: TObject);
    procedure btnRevisionLegajoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure tbRefreshClick(Sender: TObject);
    procedure dbGridContactosCellClick(Column: TColumn);
    procedure sdqDatosContactoAfterScroll(DataSet: TDataSet);
    procedure tbModifClick(Sender: TObject);
    procedure tbNuevoFirmanteClick(Sender: TObject);
    procedure tbGuardaClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure sdqSucesosAfterScroll(DataSet: TDataSet);
    procedure tbAnteriorSucesoClick(Sender: TObject);
    procedure tbProximoSucesoClick(Sender: TObject);
    procedure tbUltimoSucesoClick(Sender: TObject);
    procedure tbPrimerSucesoClick(Sender: TObject);
    procedure tsFirmanteEnter(Sender: TObject);
    procedure tbElimClick(Sender: TObject);
    procedure btnInformeComercialClick(Sender: TObject);
    procedure btnRevisionPepClick(Sender: TObject);
    procedure btnAceptarFirmanteClick(Sender: TObject);
    procedure btnCerrarFirmanteClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure fpGuardarFirmanteShow(Sender: TObject);
    procedure dbGridContactosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbReactivarClick(Sender: TObject);
    procedure rbRefreshDocFirmanteClick(Sender: TObject);
    procedure btnWorldSysClick(Sender: TObject);
    procedure btnBuscarContactoClick(Sender: TObject);
    procedure tbEliminarSucesosClick(Sender: TObject);
    procedure chkVerBajasClick(Sender: TObject);
    procedure tbGuardarEstadoContratoClick(Sender: TObject);
    procedure tbImprimirErroresClick(Sender: TObject);
    procedure tbExcelClick(Sender: TObject);
    procedure btnAceptarErroresClick(Sender: TObject);
    procedure fpErroresEndosoBeforeShow(Sender: TObject);
    procedure edNumeroDocumentoExit(Sender: TObject);
    procedure mnuImprimirRenovacionAutomaticaClick(Sender: TObject);
    procedure mnuMailRenovacionAutomaticaClick(Sender: TObject);
    procedure tbImprimirUltimaRenovacionClick(Sender: TObject);
    procedure cbCO_ADDENDAESPECIALClick(Sender: TObject);
    procedure fpTareaSICShow(Sender: TObject);
    procedure btnAceptarSICClick(Sender: TObject);
    procedure btnCancelarSICClick(Sender: TObject);
    procedure tbCheckSicClick(Sender: TObject);
    procedure tbUncheckSicClick(Sender: TObject);
    procedure tbSalirSicClick(Sender: TObject);
    procedure btnCopiarDomicilioClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure fraEN_MOTIVO_AltaExit(Sender: TObject);
    procedure tblLugarTrabajoClick(Sender: TObject);
    procedure tblRiesgoPCPClick(Sender: TObject);
    procedure chkFirma1Click(Sender: TObject);
    procedure fpTarifaPCPShow(Sender: TObject);
    procedure btnAceptarPCPClick(Sender: TObject);
    procedure btnCancelarPCPClick(Sender: TObject);
    procedure edCantTrabMenosDe12Exit(Sender: TObject);
    procedure edCantTrabDe12a16Exit(Sender: TObject);
    procedure edCantTrabMasDe16Exit(Sender: TObject);
    procedure btnCambiarOrigenClick(Sender: TObject);
    procedure btnGuardarOrigenClick(Sender: TObject);

  private
    EM_NOMBRE, EM_CUIT, CO_CONTRATO, CO_ESTADO, FO_FORMULARIO, CO_ORIGEN, EM_FORMAJ, EM_SECTOR, EM_SUSS, CO_MOTIVOALTA, CO_MOTIVOBAJA, CO_NIVEL, CO_OBSERVACIONES,
    CO_CLAUSULAESPECIAL, CO_IDEMPRESA, CO_ADDENDA, CO_ADDENDAESPECIAL, CO_ADDENDA_DDJJ, CO_PAGODIRECTO, DC_NUMERO_Legal, DC_PISO_Legal, DC_DEPARTAMENTO_Legal,
    DC_CPOSTALA_Legal, DC_CODAREATELEFONOS_Legal, DC_TELEFONOS_Legal, DC_CODAREAFAX_Legal, DC_FAX_Legal, DC_MAIL_Legal, DC_OBSERVACIONES_Legal, DC_ID_Legal,
    DC_NUMERO_Postal, DC_PISO_Postal, DC_DEPARTAMENTO_Postal, DC_CPOSTALA_Postal, DC_CODAREATELEFONOS_Postal, DC_TELEFONOS_Postal, DC_CODAREAFAX_Postal, DC_FAX_Postal,
    DC_MAIL_Postal, DC_OBSERVACIONES_Postal, CO_DIRELECTRONICA, CO_PAGINAWEB, DC_ID_Postal, EN_MOTIVO_Alta, CO_RECEPCIONCONTRATO, CO_MOTIVORECEPCIONCONTRATO,
    CO_OBSERVACIONES_ADDENDA: String;

    CO_FECHAIMPRESION, CO_RECEPCONTRATO, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, CO_FECHARECEPCION, EM_FEINICACTIV, CO_FECHAAFILIACION, CO_FECHABAJA, CO_VIGENCIAFRANQUICIA,
    CO_VIGENCIACLAUSULA, EN_VIGENCIAENDOSO_Alta, CO_RECEPCONTRATOFIRMADO, CO_FECHARECEPCIONANEXO: TDateTime;

    CO_IDEJECUTIVO, CO_IDGESTOR, CO_IDARTANTERIOR, CO_IDARTFUTURA, CO_IDESTUDIOCONTABLE, CO_IDACTIVIDAD, CO_IDACTIVIDAD2, CO_IDACTIVIDAD3, CO_TOTEMPLEADOS,
    CO_DIASFRANQUICIA, EM_IDGRUPOECONOMICO, CO_SINDIRELECTRONICA, CO_IDORIGENDATOEMAIL: Integer;

    DC_CALLE_LEGAL, DC_LOCALIDAD_LEGAL, DC_PROVINCIA_LEGAL, DC_CALLE_POSTAL, DC_LOCALIDAD_POSTAL, DC_PROVINCIA_POSTAL, DC_CPOSTAL_LEGAL, DC_CPOSTAL_POSTAL: String;

    CO_MASATOTAL: Currency;

    FAntInformeNosis: String;
    FBusqueda: String;
    FEsPep: Integer;
    FFirma1: Boolean;
    FFirma2: Boolean;
    FInformeNosis: String;
    FPep: Boolean;
    FRevisionPep: String;
    FExposicion : String;
    FExposicionNum: String;
    FNombreContacto: String;
    FComentariosFirmante: String;
   // sAntContacto, sFraCargo, sFax, sMail, sTipoDoc, sTipoFirmante, sDocumento, sSexo, sComentario :string;

    FAgregar: Boolean;
    FContrato: TTableId;
    FCUIT: String;
    FEstadoForm: TEstadoForm;
    FFuncion: TFuncionShowForm;
    FIdContactoSeleccionado: Integer;
    FIdDomicilioLegal: String;
    FIdDomicilioPostal: String;
    FIdEmpresa: TTableId;
    FIdEndoso: TTableId;
    FIdFormulario: TTableId;
    FIdsContratos: Array of Integer;
    FIdsEmpresas: Array of Integer;
    FPermisoModificarSRT: Boolean;
    FTipoEndoso: String;
    FPeriodo: String;
    FCuota: Currency;
    FTextoSIC : String;
    FTipoRegimen : Integer;

    function CotizacionStr: String;
    function DocumentoRepetido(const aDocumento: String) : Boolean;
    function EsRojo(const aConsultaActiva: TSDquery; const aFieldBaja: String): Boolean;
//    function GetNombreOriginal(aNombre: String): String;
    function GetProximoSuceso(aIdContacto, aIdFormulario: Integer): Integer;
    function GuardarContratoEndosos(IdContrato, IdEmpresa: TTableId): Boolean;
    function GuardarFirmante: Integer;
    function HuboCambio: Boolean;
    function HuboCambioACO: Boolean;
    function HuboCambioADC_LEGAL: Boolean;
    function HuboCambioADC_POSTAL: Boolean;
    function HuboCambioAEM: Boolean;
    function HuboCambioDocumentacion: Boolean;
    function HuboCambioInformeNosis: Boolean;
    function HuboCambioPep: Boolean;
    function LoadSQLDatosContacto: String;
    function MotivoAltaEndosoParaRectificacionDomicilioOk: Boolean;
    function VerificarDocumentacionFaltante(const aFormaJuridica: String; const aCaracterFirma, aIdDocumentoAfi: Integer; const aPresento, aFirmaTitular, aFirmaVendedor: String): String;
    function GetCantidadFirmatesContrato(const aContrato: TTableId): Integer;
    function GetDocumentacion(const aTexto, aTipo: String): String;
    function ParceObservacion(const aTexto: String): String;
    function GetUltIdVendedor(const aContrato: TTableId): Integer;
    function GetUltIdEntidad(const aContrato: TTableId): Integer;
   //function GetCantidadDocFaltante(const aContrato: Integer): Integer;
    function IsDomicilioIgual: boolean; //Verifica si los domicilios Legal y Postal son iguales //No verifica el comentario
    function IsDomicilioIgualSQL: boolean; //Verifica los registros de la base de datos del domicilio lega y postal // no verifica comentario.
    function GetIdRenglonPCP(const aRenglon: Integer): Integer;

    procedure ActualizarCartas;
    procedure ActualizarColorEstado;
    procedure ActualizarDocumentacionFaltante(const aComponentName: String);
    procedure ActualizarRecepcionVentanillaElectronica;
    procedure BuscarEnWorldSys(const aDni: String);
    procedure CambioClausulaEspecial(Sender: TObject);
    procedure CargarCombosTelefonos(const aContrato, aEndosoId: Integer);
    procedure ClearDocumentacion;
    procedure CargarContacto;
    procedure CargarContratoFirmado(const aContrato: Integer);
    procedure CargarDatosFirmante;
    procedure CargarDocumentacion;
    procedure CargarDocumentacionFirmante(const aIdRelaDocumentacion: Integer);
    procedure CargarDatosHistorico(aIdEndoso: TTableId);
    procedure CargarInformeComercial;
    procedure CargarListaEndosos(IDContrato, IDEndoso: TTableId);
    procedure CargarPep(const aIdRelaPersonaExpuesta: Integer);
    procedure CargarSql(var Sql: TSQL; TipoSql: String);
    procedure CargarSucesos;
    procedure ChequearEstado(Sender: TObject);
    procedure ClearPep;
    procedure ClickFirmaPresentoFirmante(Sender: TObject);
    procedure ClickFirmaTitularFirmante(Sender: TObject);
    procedure ClickFirmaVendedorFirmante(Sender: TObject);
    procedure CrearComponentesDocumentacionFirmante;
    procedure EliminarContacto(const aIdContacto : Integer);
    procedure EliminarDocumentacion(const aId: Integer);
    procedure EliminarInformeComercial(const aId: Integer);
    procedure EliminarPep(const aId: Integer);
    procedure EliminarSucesoFirmante(const aIdContacto, aIdFormulario : Integer);
    procedure GenerarMovimiento(const aNumeroMovimiento: String);
    procedure GuardarContrato(IdContrato: TTableId; const aMostrarMensajeOk: Boolean = True);
    procedure GuardarDatosDocumentacion(const aIdEndoso: Integer);
    procedure GuardarDatosDocumentacionFirmante(const aIdEndoso, aIdRelaDocumentacion, aIdContacto: Integer);
    procedure GuardarDatosInformeNosis(const aidRela, aIdContacto: Integer; const sBusqueda: String);
    procedure GuardarEndoso;
    procedure GuardarEndosoRevision;
    procedure GuardarPep(const aIdContacto, aIdEndoso, aIdRelaPersonaExpuesta: Integer);
    procedure GuardarSuceso(const aIdContacto, aIdEndoso: Integer; const aEsReemplazado: Boolean);
    procedure GuardarSucesoBajaReactivar(const aIdContacto, aIdEndoso: Integer; const Reactivar: Boolean);
    procedure LocalDatosContrato(Qry: TSDQuery);
    procedure LocalDatosDomicilioLegal(Qry: TSDQuery);
    procedure LocalDatosDomicilioPostal(Qry: TSDQuery);
    procedure LocalDatosEndoso(Qry: TSDQuery);
    procedure LockContactoFirmante(const aBoolean: Boolean);
    procedure ModificarAparienciaDesmarcarEnvioSRT;
    procedure ProcesarExcel;
    procedure RecuperarInformeNosis(const aDni, aSexo: String);
    procedure ReemplazarContacto(const aIdContactoOrigen, aIdContactoDestino : TTableId);
    procedure RefreshAfterScroll;
    procedure SetBajaContacto(const aIdContacto: Integer);
    procedure SetEstadoForm(aEstado: TEstadoForm);
    procedure StatusAfiliacion(Contrato: TTableId);
    procedure SwitchToolBtnFirmante(const aBoolean: Boolean);
    procedure UpdateFechaRecepcionContratoFirmado;
    procedure Validar;
    procedure VerificarDocumentacionFaltanteFila(const aTag: Integer; const bFirmante: Boolean);
    procedure DoTareaSic(aIdFormulario: Integer);
    procedure ClearFpSic;
    procedure LoadDocumentosFaltantes(const aIdContrato: TTableId; var aDocs: TStringList);
    procedure LoadDocumentos(var aDocs, aDocsActuales : TStringList);
    procedure CompareAndFillDocumentosFaltantes(const aDocs, aDocsActualesSic, aDocumentosFaltantes: TStringList);
    procedure AddText(const aText: String; const StrikedOut, Checked : Boolean);
    procedure SicListCheckState(aChecked: Boolean);
    procedure CerrarTareaSiExiste(const aIdFormulario, aTarea: integer);
    procedure CopiarDomicilio;
    procedure SetRegimen(aRegimen: Integer);
    procedure CargarDatosTarifaPCP(const aContrato: integer);
    procedure GuardarTarifaPCP;
    procedure CalcularCostosPCP;

    property EstadoForm: TEstadoForm read FEstadoForm write SetEstadoForm;
  protected
   {$IFDEF TRON}
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
   {$ENDIF}
  public
    FCurrentLine: String;

    function DoCargarDatos(aIdEndoso, aContrato: TTableId; aFuncion: TFuncionShowForm): Boolean; overload;

    procedure DoAgregarLinea(const aLinea, aContrato, aEndoso, aDescripcion, aMotivo, aVigencia, aErrores: String);
    procedure DoAutoEndoso(const aContrato, aArtFuturaId: Integer; const aFechaBaja: TDate; const aEstado, aMotivo, aMotivoEndoso: String);
    procedure DoCargarDatos(aIdsContratos, aIdsEmpresas: Array of TTableId); overload;

    property Contrato: TTableId read FContrato;
  end;
var
  frmModificacionContrato: TfrmModificacionContrato;
  ListaEndosos: TStringList;

implementation

uses
  unPrincipal, unDmPrincipal, DateUtil, CustomDlgs, CUIT, General, SqlFuncs, unCargaEstablecimiento, unCargaTrabajador, unCargaSRT, unCargaSolicitud, VCLExtra,
  unContratoTrabajador, unContratoEstablecimiento, unContratoSRT, unContratoContacto, unContratoVendedor, unFrmConsultaCarta, DateTimeFuncs, unGestorCuenta,
  unEjecutivoCuenta, unCuadroTarifarioContrato, unAfiGeneracionCartas, unCompatibilidad, unManCCP_CUENTAPAGO, unAltaNotaSRT, unAfiliaciones, Periodo, Internet,
  unContratoConsultaEndoso, unConsultaTraspasoIngreso, unGestorAumento, unContratoDelegacion, unContratoPreventor, Strfuncs, unSesion, unCargaNominaManual, unEnvioMail,
  unMoldeEnvioMail, unComunes, unUtilsArchivo, unImportInformeComercial, unContratoBuscarContacto, unImprimeContrato, unCargaLugarDeTrabajo, unPCP;

const
  SIC_DOCU_FALTANTE: Integer = 354;
  SIC_RECEP_FALTANTE = 355;
  SIC_DOCU_FALTANTE_CONTRATO: Integer = 356;
  SIC_RECEP_FALTANTE_CONTRATO = 357;
  SIC_MOTIVO_INGRESO: Integer = 11;

{$R *.DFM}

procedure TfrmModificacionContrato.SetEstadoForm(aEstado: TEstadoForm);
begin
  LockControls([cmbCO_VIGENCIADESDE, cmbCO_VIGENCIAHASTA, fraCO_IDEJECUTIVO, fraCO_IDGESTOR], True);
  FEstadoForm := aEstado;

  case FEstadoForm of
    efSinContrato:
    begin
      EnableControls([tbLimpiar, tbGuardar, tblNomina, tblEstablecimiento, tblSRT, tbVendedor, tbContactos, tbTarifa, tbEndosos, tbCartas, tbTraspasoIngreso,
                      tbGestorCuenta, tbGestorAumento, tbEjecutivoCuenta, tblImprimir, tbCambiarCuit, tbCuentasBancarias, tbExtensionVigencia, tbModificarEndoso,
                      tbFechaSRT, tbDelegacion, tbPreventor, tbRecepcionCarta, tbDocumentacion, tbVisualizadorDocumentacionDigitalizada, tbImprimirUltimaRenovacion,
                      tblLugarTrabajo, tblRiesgoPCP], False);

      LockControls([cmbEM_NOMBRE, edEM_CUIT, edCO_CONTRATO, edFO_FORMULARIO], False);

      LockControls([fraCO_ESTADO, cmbCO_FECHAIMPRESION, cmbCO_RECEPCONTRATO, fraCO_ORIGEN, edCO_DIRELECTRONICA, chkNoTieneEmail, fraOrigenDatoEmail, edCO_PAGINAWEB,
                    edCO_FECHARECEPCION, edEM_FEINICACTIV, fraEM_FORMAJ, fraEM_SECTOR, fraEM_IDGRUPOECONOMICO, fraCO_IDESTUDIOCONTABLE, fraEM_SUSS, cmbCO_FECHABAJA,
                    fraCO_MOTIVOBAJA, fraCO_IDARTFUTURA, edNIVEL, edTOTEMPLEADOS, edMASATOTAL, edCO_OBSERVACIONES, edCO_DIASFRANQUICIA, cbCO_ADDENDA, cbCO_ADDENDA_DDJJ,
                    checkPagoDirecto, edComentariosAddenda, cbCO_ADDENDAESPECIAL, cmbCO_VIGENCIAFRANQUICIA, fraCO_CLAUSULAESPECIAL, cmbCO_VIGENCIACLAUSULA,
                    fraTelefonoLegal, edDC_CODAREAFAX, edDC_FAX, edDC_MAIL, edDC_OBSERVACIONESLegal, fraTelefonoPostal, edDC_CODAREAFAX_POST, edDC_FAX_POST,
                    edDC_MAIL_POST, edDC_OBSERVACIONESPostal, edNumeroFormRectificacionDatos, cmbEN_VIGENCIAENDOSO_Alta, fraEN_MOTIVO_Alta, cbEN_ENVIOSRT,
                    cbEN_ENVIOCARTA, cbEN_NOTASRT, btnCopiarDomicilio {fraRegimen}], True);

      fraDOMICILIO_LEGAL.Locked := True;
      fraDOMICILIO_POSTAL.Locked := True;

      LockControls([edCO_FECHAAFILIACION, fraCO_MOTIVOALTA, fraAR_NOMBRE, fraCIIU, fraCIIU2, fraCIIU3, cmbEN_VIGENCIAENDOSO, fraEN_MOTIVO, edEN_ENDOSO, edEN_MOVIMIENTO,
                    edEN_USUALTA, cmbEN_FECHAALTA, cmbEN_FECHAIMPRESION, cmbEN_FENVIOSTR, cmbEN_FRECEPCIONSTR, edEN_TIPOENVIOSTR, edEN_CODRECHAZOSTR,
                    edEN_CODOBSERVACIONSTR, cbEN_ENVIOSRT_C, cbEN_ENVIOCARTA_C, cbEN_NOTASRT_C], True);

      if (PgContrato.ActivePage = tbContrato) and (edCO_CONTRATO.Enabled) and (Self.Visible) then
        edCO_CONTRATO.SetFocus;
    end;

    efSeleccionContrato:
    begin
      EnableControls([tbLimpiar, tbGuardar, tblNomina, tblEstablecimiento, tblSRT, tbVendedor, tbContactos, tbTarifa, tbEndosos, tbCartas, tbTraspasoIngreso,
                      tbGestorCuenta, tbGestorAumento, tbEjecutivoCuenta, tblImprimir, tbModificarEndoso, tbFechaSRT, tbDelegacion, tbPreventor, tbRecepcionCarta,
                      tbDocumentacion, tbVisualizadorDocumentacionDigitalizada, tbImprimirUltimaRenovacion, tblLugarTrabajo, tblRiesgoPCP], True);

      EnableControls([tbGuardar, tbCambiarCuit, tbCuentasBancarias, tbExtensionVigencia], False);

      LockControls([cmbEM_NOMBRE, edEM_CUIT, edCO_CONTRATO, edFO_FORMULARIO], False);

      LockControls([fraCO_ESTADO, cmbCO_FECHAIMPRESION, cmbCO_RECEPCONTRATO, fraCO_ORIGEN, edCO_DIRELECTRONICA, chkNoTieneEmail, fraOrigenDatoEmail, edCO_PAGINAWEB,
                    edCO_FECHARECEPCION, edEM_FEINICACTIV, fraEM_FORMAJ, fraEM_SECTOR, fraEM_IDGRUPOECONOMICO, fraCO_IDESTUDIOCONTABLE, fraEM_SUSS, cmbCO_FECHABAJA,
                    fraCO_MOTIVOBAJA, fraCO_IDARTFUTURA, edNIVEL, edTOTEMPLEADOS, edMASATOTAL, edCO_OBSERVACIONES, edCO_DIASFRANQUICIA, cbCO_ADDENDA, cbCO_ADDENDA_DDJJ,
                    checkPagoDirecto, edComentariosAddenda, cbCO_ADDENDAESPECIAL, cmbCO_VIGENCIAFRANQUICIA, fraCO_CLAUSULAESPECIAL, cmbCO_VIGENCIACLAUSULA,
                    fraTelefonoLegal, edDC_CODAREAFAX, edDC_FAX, edDC_MAIL, edDC_OBSERVACIONESLegal, fraTelefonoPostal, edDC_CODAREAFAX_POST, edDC_FAX_POST,
                    edDC_MAIL_POST, edDC_OBSERVACIONESPostal, edNumeroFormRectificacionDatos, cmbEN_VIGENCIAENDOSO_Alta, fraEN_MOTIVO_Alta, cbEN_ENVIOSRT,
                    cbEN_ENVIOCARTA, cbEN_NOTASRT, btnCopiarDomicilio{, fraRegimen}], True);

      fraDOMICILIO_LEGAL.Locked := True;
      fraDOMICILIO_POSTAL.Locked := True;

      LockControls([edCO_FECHAAFILIACION, fraCO_MOTIVOALTA, fraAR_NOMBRE, fraCIIU, fraCIIU2, fraCIIU3, cmbEN_VIGENCIAENDOSO, fraEN_MOTIVO, edEN_ENDOSO, edEN_MOVIMIENTO,
                    edEN_USUALTA, cmbEN_FECHAALTA, cmbEN_FECHAIMPRESION, cmbEN_FENVIOSTR, cmbEN_FRECEPCIONSTR, edEN_TIPOENVIOSTR, edEN_CODRECHAZOSTR,
                    edEN_CODOBSERVACIONSTR, cbEN_ENVIOSRT_C, cbEN_ENVIOCARTA_C, cbEN_NOTASRT_C], True);

      tbGuardar.Enabled                               := Seguridad.Activar(tbGuardar);
      tbDelegacion.Enabled                            := Seguridad.Activar(tbDelegacion);
      tbPreventor.Enabled                             := Seguridad.Activar(tbPreventor);
      tbRecepcionCarta.Enabled                        := Seguridad.Activar(tbRecepcionCarta);
      tbDocumentacion.Enabled                         := Seguridad.Activar(tbDocumentacion);
      tbVisualizadorDocumentacionDigitalizada.Enabled := Seguridad.Activar(tbVisualizadorDocumentacionDigitalizada);
      tbEliminarSucesos.Enabled                       := Seguridad.Activar(tbEliminarSucesos);
    end;

    efCampania:
    begin
      EnableControls([tbLimpiar, tblEstablecimiento, tbContactos, tblImprimir, tblLugarTrabajo, tblRiesgoPCP], True);

      EnableControls([tblNomina, tblSRT, tbVendedor, tbCambiarCuit, tbCuentasBancarias, tbTarifa, tbEndosos, tbCartas, tbTraspasoIngreso, tbExtensionVigencia,
                      tbGestorCuenta, tbGestorAumento, tbEjecutivoCuenta, tbModificarEndoso, tbFechaSRT, tbDelegacion, tbPreventor, tbRecepcionCarta, tbDocumentacion,
                      tbVisualizadorDocumentacionDigitalizada, tbImprimirUltimaRenovacion], False);

      LockControls([cmbEM_NOMBRE, edEM_CUIT, edCO_CONTRATO, edFO_FORMULARIO], False);

      LockControls([fraCO_ESTADO, cmbCO_FECHAIMPRESION, cmbCO_RECEPCONTRATO, fraCO_ORIGEN, edCO_FECHARECEPCION, edEM_FEINICACTIV, fraEM_FORMAJ, fraEM_SECTOR,
                    fraEM_IDGRUPOECONOMICO, fraCO_IDESTUDIOCONTABLE, fraEM_SUSS, cmbCO_FECHABAJA, fraCO_MOTIVOBAJA, fraCO_IDARTFUTURA, edNIVEL, edTOTEMPLEADOS,
                    edMASATOTAL, edCO_OBSERVACIONES, edCO_DIASFRANQUICIA, cbCO_ADDENDA, cbCO_ADDENDA_DDJJ, edComentariosAddenda, cbCO_ADDENDAESPECIAL, checkPagoDirecto,
                    cmbCO_VIGENCIAFRANQUICIA, fraCO_CLAUSULAESPECIAL, cmbCO_VIGENCIACLAUSULA, edDC_OBSERVACIONESLegal, edDC_OBSERVACIONESPostal,
                    edNumeroFormRectificacionDatos, cmbEN_VIGENCIAENDOSO_Alta, fraEN_MOTIVO_Alta, cbEN_ENVIOSRT, cbEN_ENVIOCARTA, cbEN_NOTASRT,
                    btnCopiarDomicilio{, fraRegimen}], True);

      fraDOMICILIO_LEGAL.Locked := True;
      fraDOMICILIO_POSTAL.Locked := True;

      LockControls([edCO_FECHAAFILIACION, fraCO_MOTIVOALTA, fraAR_NOMBRE, fraCIIU, fraCIIU2, fraCIIU3, cmbEN_VIGENCIAENDOSO, fraEN_MOTIVO, edEN_ENDOSO, edEN_MOVIMIENTO,
                    edEN_USUALTA, cmbEN_FECHAALTA, cmbEN_FECHAIMPRESION, cmbEN_FENVIOSTR, cmbEN_FRECEPCIONSTR, edEN_TIPOENVIOSTR, edEN_CODRECHAZOSTR,
                    edEN_CODOBSERVACIONSTR, cbEN_ENVIOSRT_C, cbEN_ENVIOCARTA_C, cbEN_NOTASRT_C], True);

      LockControls([edCO_DIRELECTRONICA, chkNoTieneEmail, fraOrigenDatoEmail, edCO_PAGINAWEB, fraTelefonoLegal, edDC_CODAREAFAX, edDC_FAX, edDC_MAIL, fraTelefonoPostal,
                    edDC_CODAREAFAX_POST, edDC_FAX_POST, edDC_MAIL_POST], not (not (tbUltimo.Enabled) and (edCO_CONTRATO.Value <> ART_EMPTY_ID) and (ListaEndosos.Count = 0)));

      tbGuardar.Enabled                               := Seguridad.Activar(tbGuardar);
      tbDelegacion.Enabled                            := Seguridad.Activar(tbDelegacion);
      tbPreventor.Enabled                             := Seguridad.Activar(tbPreventor);
      tbRecepcionCarta.Enabled                        := Seguridad.Activar(tbRecepcionCarta);
      tbDocumentacion.Enabled                         := Seguridad.Activar(tbDocumentacion);
      tbVisualizadorDocumentacionDigitalizada.Enabled := Seguridad.Activar(tbVisualizadorDocumentacionDigitalizada);
    end;

    efContratoFijo:
    begin
      EnableControls([tbLimpiar, tbGuardar, tblNomina, tblEstablecimiento, tblSRT, tbVendedor, tbContactos, tbTarifa, tbEndosos, tbCartas, tbTraspasoIngreso,
                      tbGestorCuenta, tbGestorAumento, tbEjecutivoCuenta, tblImprimir, tbCambiarCuit, tbCuentasBancarias, tbExtensionVigencia, tbModificarEndoso,
                      tbFechaSRT, tbDelegacion, tbPreventor, tbRecepcionCarta, tbDocumentacion, tbVisualizadorDocumentacionDigitalizada, tbImprimirUltimaRenovacion,
                      tblLugarTrabajo, tblRiesgoPCP]);

      LockControls([edEM_CUIT, edCO_CONTRATO, edFO_FORMULARIO, cmbEM_NOMBRE, fraCO_ESTADO, cmbCO_FECHAIMPRESION, cmbCO_RECEPCONTRATO, fraCO_ORIGEN, edCO_DIRELECTRONICA,
                    chkNoTieneEmail, fraOrigenDatoEmail, edCO_PAGINAWEB, edEM_FEINICACTIV, fraEM_FORMAJ, fraEM_SECTOR, fraEM_IDGRUPOECONOMICO, fraCO_IDESTUDIOCONTABLE,
                    fraEM_SUSS, cmbCO_FECHABAJA, fraCO_MOTIVOBAJA, fraCO_IDARTFUTURA, edNIVEL, edTOTEMPLEADOS, edMASATOTAL, edCO_OBSERVACIONES, edCO_DIASFRANQUICIA,
                    cbCO_ADDENDA, edComentariosAddenda, cbCO_ADDENDAESPECIAL, cbCO_ADDENDA_DDJJ, checkPagoDirecto, cmbCO_VIGENCIAFRANQUICIA, fraCO_CLAUSULAESPECIAL,
                    cmbCO_VIGENCIACLAUSULA, fraTelefonoLegal, edDC_CODAREAFAX, edDC_FAX, edDC_MAIL, edDC_OBSERVACIONESLegal, fraTelefonoPostal, edDC_CODAREAFAX_POST,
                    edDC_FAX_POST, edDC_MAIL_POST, edDC_OBSERVACIONESPostal, edNumeroFormRectificacionDatos, cmbEN_VIGENCIAENDOSO_Alta, fraEN_MOTIVO_Alta, cbEN_ENVIOSRT,
                    cbEN_ENVIOCARTA, cbEN_NOTASRT, btnCopiarDomicilio{, fraRegimen}], False);

      fraDOMICILIO_LEGAL.Locked := False;
      fraDOMICILIO_POSTAL.Locked := False;

      tbGuardar.Enabled                               := Seguridad.Activar(tbGuardar);
      tbDelegacion.Enabled                            := Seguridad.Activar(tbDelegacion);
      tbPreventor.Enabled                             := Seguridad.Activar(tbPreventor);
      tbRecepcionCarta.Enabled                        := Seguridad.Activar(tbRecepcionCarta);
      tbDocumentacion.Enabled                         := Seguridad.Activar(tbDocumentacion);
      tbVisualizadorDocumentacionDigitalizada.Enabled := Seguridad.Activar(tbVisualizadorDocumentacionDigitalizada);
    end;

    efConsultaContrato:
    begin
      EnableControls([tblNomina, tblEstablecimiento, tblSRT, tbVendedor, tbContactos, tbTarifa, tbEndosos, tbCartas, tbTraspasoIngreso, tbGestorCuenta, tbGestorAumento,
                      tbEjecutivoCuenta, tblImprimir, tblLugarTrabajo, tblRiesgoPCP]);

      EnableControls([tbLimpiar, tbGuardar, tbCambiarCuit, tbCuentasBancarias, tbExtensionVigencia, tbModificarEndoso, tbFechaSRT, tbDelegacion, tbPreventor,
                      tbRecepcionCarta, tbDocumentacion, tbVisualizadorDocumentacionDigitalizada, tbImprimirUltimaRenovacion], False);

      LockControls([edEM_CUIT, edCO_CONTRATO, edFO_FORMULARIO, fraCO_ESTADO, cmbCO_FECHAIMPRESION, cmbCO_RECEPCONTRATO, fraCO_ORIGEN, edCO_DIRELECTRONICA,
                    chkNoTieneEmail, fraOrigenDatoEmail, edCO_PAGINAWEB, edCO_FECHARECEPCION, edEM_FEINICACTIV, fraEM_FORMAJ, fraEM_SECTOR, fraEM_IDGRUPOECONOMICO,
                    fraCO_IDESTUDIOCONTABLE, fraEM_SUSS, cmbCO_FECHABAJA, fraCO_MOTIVOBAJA, fraCO_IDARTFUTURA, edNIVEL, edTOTEMPLEADOS, edMASATOTAL, edCO_OBSERVACIONES,
                    edCO_DIASFRANQUICIA, cbCO_ADDENDA, edComentariosAddenda, cbCO_ADDENDAESPECIAL, cbCO_ADDENDA_DDJJ, checkPagoDirecto, cmbCO_VIGENCIAFRANQUICIA,
                    fraCO_CLAUSULAESPECIAL, cmbCO_VIGENCIACLAUSULA, fraTelefonoLegal, edDC_CODAREAFAX, edDC_FAX, edDC_MAIL, edDC_OBSERVACIONESLegal, fraTelefonoPostal,
                    edDC_CODAREAFAX_POST, edDC_FAX_POST, edDC_MAIL_POST, edDC_OBSERVACIONESPostal, edNumeroFormRectificacionDatos, cmbEN_VIGENCIAENDOSO_Alta,
                    fraEN_MOTIVO_Alta, cbEN_ENVIOSRT, cbEN_ENVIOCARTA, cbEN_NOTASRT, cmbEM_NOMBRE, btnCopiarDomicilio{, fraRegimen}], True);

      fraDOMICILIO_LEGAL.Locked := True;
      fraDOMICILIO_POSTAL.Locked := True;

      LockControls([edCO_FECHAAFILIACION, fraCO_MOTIVOALTA, fraAR_NOMBRE, fraCIIU, fraCIIU2, fraCIIU3, cmbEN_VIGENCIAENDOSO, fraEN_MOTIVO, edEN_ENDOSO, edEN_MOVIMIENTO,
                    edEN_USUALTA, cmbEN_FECHAALTA, cmbEN_FECHAIMPRESION, cmbEN_FENVIOSTR, cmbEN_FRECEPCIONSTR, edEN_TIPOENVIOSTR, edEN_CODRECHAZOSTR,
                    edEN_CODOBSERVACIONSTR, cbEN_ENVIOSRT_C, cbEN_ENVIOCARTA_C, cbEN_NOTASRT_C], True);

      tbDelegacion.Enabled                            := Seguridad.Activar(tbDelegacion);
      tbPreventor.Enabled                             := Seguridad.Activar(tbPreventor);
      tbRecepcionCarta.Enabled                        := Seguridad.Activar(tbRecepcionCarta);
      tbDocumentacion.Enabled                         := Seguridad.Activar(tbDocumentacion);
      tbVisualizadorDocumentacionDigitalizada.Enabled := Seguridad.Activar(tbVisualizadorDocumentacionDigitalizada);
    end;

    efEndososMultiples:
    begin
      EnableControls([tbLimpiar, tblNomina, tblEstablecimiento, tblSRT, tbVendedor, tbContactos, tbTarifa, tbEndosos, tbCartas,tbTraspasoIngreso, tbGestorCuenta,
                      tbGestorAumento, tbEjecutivoCuenta, tblImprimir, tbCambiarCuit, tbCuentasBancarias, tbExtensionVigencia, tbModificarEndoso, tbFechaSRT,
                      tbDelegacion, tbPreventor, tbRecepcionCarta, tbDocumentacion, tbVisualizadorDocumentacionDigitalizada, tbImprimirUltimaRenovacion,
                      tblLugarTrabajo, tblRiesgoPCP], False);

      EnableControls([tbGuardar]);

      LockControls([edEM_CUIT, edCO_CONTRATO, edFO_FORMULARIO, cmbCO_FECHAIMPRESION, cmbEM_NOMBRE, fraCO_ESTADO, cmbCO_RECEPCONTRATO, fraCO_ORIGEN, edCO_DIRELECTRONICA,
                    chkNoTieneEmail, fraOrigenDatoEmail, edCO_PAGINAWEB, edEM_FEINICACTIV, fraEM_FORMAJ, fraEM_SECTOR, fraEM_IDGRUPOECONOMICO, fraCO_IDESTUDIOCONTABLE,
                    fraEM_SUSS, cmbCO_FECHABAJA, fraCO_MOTIVOBAJA, fraCO_IDARTFUTURA, edNIVEL, edTOTEMPLEADOS, edMASATOTAL, edCO_OBSERVACIONES, edCO_DIASFRANQUICIA,
                    cbCO_ADDENDA, edComentariosAddenda, cbCO_ADDENDAESPECIAL, cbCO_ADDENDA_DDJJ, checkPagoDirecto, cmbCO_VIGENCIAFRANQUICIA, fraCO_CLAUSULAESPECIAL,
                    cmbCO_VIGENCIACLAUSULA, fraTelefonoLegal, edDC_CODAREAFAX, edDC_FAX, edDC_MAIL, edDC_OBSERVACIONESLegal, fraTelefonoPostal, edDC_CODAREAFAX_POST,
                    edDC_FAX_POST, edDC_MAIL_POST, edDC_OBSERVACIONESPostal, edNumeroFormRectificacionDatos, cmbEN_VIGENCIAENDOSO_Alta, fraEN_MOTIVO_Alta, cbEN_ENVIOSRT,
                    cbEN_ENVIOCARTA, cbEN_NOTASRT, btnCopiarDomicilio{, fraRegimen}], False);

      fraDOMICILIO_LEGAL.Locked := False;
      fraDOMICILIO_POSTAL.Locked := False;

      tbGuardar.Enabled                               := Seguridad.Activar(tbGuardar);
      tbDelegacion.Enabled                            := Seguridad.Activar(tbDelegacion);
      tbPreventor.Enabled                             := Seguridad.Activar(tbPreventor);
      tbRecepcionCarta.Enabled                        := Seguridad.Activar(tbRecepcionCarta);
      tbDocumentacion.Enabled                         := Seguridad.Activar(tbDocumentacion);
      tbVisualizadorDocumentacionDigitalizada.Enabled := Seguridad.Activar(tbVisualizadorDocumentacionDigitalizada);
    end;

    efModificaEndoso:
    begin
      EnableControls([tbLimpiar, tblNomina, tblEstablecimiento, tblSRT, tbVendedor, tbContactos, tbTarifa, tbEndosos, tbCartas,tbTraspasoIngreso, tbGestorCuenta,
                      tbGestorAumento, tbEjecutivoCuenta, tblImprimir, tbCambiarCuit, tbCuentasBancarias, tbExtensionVigencia, tbModificarEndoso, tbFechaSRT,
                      tbDelegacion, tbPreventor, tbRecepcionCarta, tbDocumentacion, tbVisualizadorDocumentacionDigitalizada, tbImprimirUltimaRenovacion,
                      tblLugarTrabajo, tblRiesgoPCP], False);

      EnableControls([tbGuardar]);

      LockControls([cmbCO_VIGENCIADESDE, cmbCO_VIGENCIAHASTA], False);

      LockControls([edEM_CUIT, edCO_CONTRATO, edFO_FORMULARIO, cmbCO_FECHAIMPRESION, cmbEM_NOMBRE, fraCO_ESTADO, cmbCO_RECEPCONTRATO, fraCO_ORIGEN, edCO_DIRELECTRONICA,
                    chkNoTieneEmail, fraOrigenDatoEmail, edCO_PAGINAWEB, edEM_FEINICACTIV, fraEM_FORMAJ, fraEM_SECTOR, fraEM_IDGRUPOECONOMICO, fraCO_IDESTUDIOCONTABLE,
                    fraEM_SUSS, cmbCO_FECHABAJA, fraCO_MOTIVOBAJA, fraCO_IDARTFUTURA, edNIVEL, edTOTEMPLEADOS, edMASATOTAL, edCO_OBSERVACIONES, edCO_DIASFRANQUICIA,
                    cbCO_ADDENDA, edComentariosAddenda, cbCO_ADDENDAESPECIAL, cbCO_ADDENDA_DDJJ, checkPagoDirecto, cmbCO_VIGENCIAFRANQUICIA, fraCO_CLAUSULAESPECIAL,
                    cmbCO_VIGENCIACLAUSULA, fraTelefonoLegal, edDC_CODAREAFAX, edDC_FAX, edDC_MAIL, edDC_OBSERVACIONESLegal, fraTelefonoPostal, edDC_CODAREAFAX_POST,
                    edDC_FAX_POST, edDC_MAIL_POST, edDC_OBSERVACIONESPostal, edNumeroFormRectificacionDatos, cmbEN_VIGENCIAENDOSO_Alta, fraEN_MOTIVO_Alta,
                    cbEN_ENVIOSRT, cbEN_ENVIOCARTA, cbEN_NOTASRT, fraAR_NOMBRE, fraCO_MOTIVOALTA, btnCopiarDomicilio{, fraRegimen}], False);

      fraDOMICILIO_LEGAL.Locked := False;
      fraDOMICILIO_POSTAL.Locked := False;

      tbGuardar.Enabled                               := Seguridad.Activar(tbGuardar);
      tbDelegacion.Enabled                            := Seguridad.Activar(tbDelegacion);
      tbPreventor.Enabled                             := Seguridad.Activar(tbPreventor);
      tbRecepcionCarta.Enabled                        := Seguridad.Activar(tbRecepcionCarta);
      tbDocumentacion.Enabled                         := Seguridad.Activar(tbDocumentacion);
      tbVisualizadorDocumentacionDigitalizada.Enabled := Seguridad.Activar(tbVisualizadorDocumentacionDigitalizada);
    end;
  end;

  // Si quedo el domicilio legal habilitado y no tiene permiso para modificarlo, cambiar el estado
  if (not fraDOMICILIO_LEGAL.Locked) and (not Seguridad.Claves.IsActive('PermisoModificarDomicilio')) then
    fraDOMICILIO_LEGAL.Locked := True;
  //1.	Grisar el domicilio Postal y que no pueda ser modificado manualmente.
  //tk 55833
  LockControls([fraDOMICILIO_POSTAL, fraTelefonoPostal, edDC_CODAREAFAX_POST, edDC_FAX_POST, edDC_MAIL_POST,
                edDC_OBSERVACIONESPostal ], True);
end;

procedure TfrmModificacionContrato.SetRegimen(aRegimen: Integer);
begin
  tblLugarTrabajo.Visible := (aRegimen = 2) or (aRegimen = 3);
  tblEstablecimiento.Visible := (aRegimen = 1) or (aRegimen = 3);
  tblRiesgoPCP.Visible := (aRegimen = 2) or (aRegimen = 3);

  lbRE.Visible := (aRegimen = 2) or (aRegimen = 3);
  if aRegimen = 2 then
    lbRe.Caption := 'RÉGIMEN ESPECIAL'
  else
  if aRegimen = 3 then
    lbRe.Caption := 'RÉGIMEN MIXTO';

  if aRegimen = 2 then
    edNivel.Pattern := '0'
  else
    edNivel.Pattern := '1234';
end;

function TfrmModificacionContrato.DoCargarDatos(aIdEndoso, aContrato: TTableId; aFuncion: TFuncionShowForm): Boolean;
var
  iContratoAnterior: Integer;
  oldCursor: TCursor;
  sSql: String;
begin
  Result := True;

  FFuncion := aFuncion;
  oldCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  try
    if aIdEndoso = ART_EMPTY_ID then
      if aContrato <> ART_EMPTY_ID then
      begin
        sSql :=
          'SELECT   en_id' +
             ' FROM aen_endoso' +
            ' WHERE en_contrato = :contrato' +
         ' ORDER BY en_endoso DESC, en_movimiento DESC';
        aIdEndoso := ValorSqlIntegerEx(sSql, [aContrato]);

        sSql :=
          'SELECT co_idtiporegimen ' +
          '   FROM aco_contrato ' +
          ' WHERE co_contrato = :contrato';
         FTipoRegimen :=  ValorSqlIntegerEx(sSql, [aContrato], 1);
      end;

    case FFuncion of
      fsModificar:
      begin
        if Seguridad.Claves.IsActive('ModalidadCampaña') then
        begin
          Caption := 'Modificación de Contrato [MODIFICAR - CAMPAÑA]';
          EstadoForm := efCampania;
        end
        else
        begin
          Caption := 'Modificación de Contrato [MODIFICAR]';
          EstadoForm := efSeleccionContrato;
        end;
      end;
      fsConsultar:
      begin
        Caption := 'Modificación de Contrato [CONSULTA]';
        EstadoForm := efConsultaContrato;
      end;
    end;

    // Carga los datos
    if aIdEndoso <> ART_EMPTY_ID then
    begin
      CargarDatosHistorico(aIdEndoso);
      FContrato       := edCO_CONTRATO.Value;
      FIdEndoso       := aIdEndoso;
      FCUIT           := edEM_CUIT.Text;
      CargarListaEndosos(FContrato, aIdEndoso);
      CargarCombosTelefonos(FContrato, aIdEndoso);
    end
    else
    begin
      EstadoForm      := efSinContrato;
      FContrato       := ART_EMPTY_ID;
      FIdEndoso       := ART_EMPTY_ID;
      FIdEmpresa      := ART_EMPTY_ID;
      FCUIT           := '';
    end;


    sSql := 'SELECT afiliacion.get_contratoanteriorvigente(:cuit, NULL, :contrato) FROM DUAL';
    if ValorSqlIntegerEx(sSql, [FCUIT, FContrato]) > 0 then
      InfoHint(edCO_CONTRATO, 'Existe un Contrato Menor Activo para esta empresa.', False, 'ATENCIÓN');

    if cmbCO_VIGENCIADESDE.Date = cmbCO_FECHABAJA.Date then
    begin
      sSql :=
        'SELECT co_contrato' +
         ' FROM aem_empresa, aco_contrato' +
        ' WHERE ADD_MONTHS(NVL(NULL, actualdate), 1) >= co_vigenciadesde' +
          ' AND em_id = co_idempresa' +
          ' AND em_cuit = :cuit' +
          ' AND co_contrato < :contrato' +
          ' AND TRUNC(co_fechabaja) > :fechabaja';
      iContratoAnterior := ValorSqlIntegerEx(sSql, [edEM_CUIT.Text, edCO_CONTRATO.Value, TDateTimeEx.Create(cmbCO_FECHABAJA.Date)]);
      if iContratoAnterior > 0 then
        InfoHint(edCO_CONTRATO, Format('Revisar el contrato %d y sus endosos.', [iContratoAnterior]), False, 'ATENCIÓN');
    end;

    sSql := 'SELECT art.afiliacion.is_guardaafiliacion(:contrato, :usuario) FROM DUAL';
    if ValorSqlEx(sSql, [edCO_CONTRATO.Value, Sesion.UserID]) = 'S' then
      edCO_CONTRATO.Color := COLOR_GUARDA
    else
      edCO_CONTRATO.Color := clWindow;

    //Pone en purple la razon social si es true
    if not edCO_CONTRATO.IsEmpty then
      if ValorSQLEx('SELECT afiliacion.is_empresavip(:contrato) FROM DUAL', [edCO_CONTRATO.Value]) = 'S' then
      begin
        cmbEM_NOMBRE.Font.Color  := clPurple;
        edCO_CONTRATO.Font.Color := clPurple;
        edEM_CUIT.Font.Color     := clPurple; //126603
      end
      else
      begin
        cmbEM_NOMBRE.Font.Color  := clWindowText;
        edCO_CONTRATO.Font.Color := clWindowText;
        edEM_CUIT.Font.Color     := clWindowText;
      end;

    Screen.Cursor := oldCursor;
  except
    on E: Exception do
    begin
      Screen.Cursor := oldCursor;
      ErrorMsg(E, 'Ha ocurrido un error en la recuperación de datos.');
      Result := False;
    end;
  end;
end;

procedure TfrmModificacionContrato.DoCargarDatos(aIdsContratos, aIdsEmpresas: Array of TTableId);
var
  iLoop: Integer;
begin
  FFuncion := fsNone;
  SetLength(FIdsContratos, High(aIdsContratos) + 1);
  SetLength(FIdsEmpresas, High(aIdsEmpresas) + 1);

  for iLoop := Low(aIdsContratos) to High(aIdsContratos) do
  begin
    FIdsContratos[iLoop] := aIdsContratos[iLoop];
    FIdsEmpresas[iLoop] := aIdsEmpresas[iLoop];
  end;

  Caption := 'Modificación de Contrato[ENDOSOS MULTIPLES]';
  EstadoForm := efEndososMultiples;
end;

procedure TfrmModificacionContrato.CargarDatosHistorico(aIdEndoso: TTableId);
var
  sdqCargaDatos: TSDQuery;
  sSql: String;
begin
  sdqCargaDatos := TSDQuery.Create(Self);

  // Solapa Contrato
  try
    sdqCargaDatos.DataBaseName := 'dbPrincipal';
    sSql :=
      'SELECT ahm.hm_nombre, ahm.hm_cuit, ahc.hc_contrato, ahc.hc_estado, estado.tb_descripcion estado,' +
            ' ahc.hc_vigenciadesde, ahc.hc_vigenciahasta, ahc.hc_fechaimpresion, ahc.hc_recepcontrato,' +
            ' afo.fo_formulario, ahc.hc_origen, origen.tb_descripcion origen, ahc.hc_fecharecepcion,' +
            ' ahm.hm_feinicactiv, ahc.hc_fechaafiliacion, ahm.hm_formaj, formaj.tb_descripcion formaj, ahm.hm_sector,' +
            ' sector.tb_descripcion sector, ge_codigo hm_holding, holding.ge_descripcion holding, ahm.hm_suss,' +
            ' ahc.hc_idejecutivo, ecuenta.ec_nombre ejcuenta, ahc.hc_idgestor, gestor.gc_nombre gestor,' +
            ' ahc.hc_motivoalta, ahc.hc_addenda, ahc.hc_addenda_ddjj, hc_idestudiocontable,' +
            ' mot_alta.tb_descripcion motivo_alta, ahc.hc_idartanterior, ahc.hc_fechabaja, ahc.hc_motivobaja,' +
            ' mot_baj.tb_descripcion motivo_baja, ahc.hc_idartfutura, ahc.hc_nivel, ahc.hc_totempleados,' +
            ' ahc.hc_masatotal, ahc.hc_observaciones, ahc.hc_diasfranquicia, ahc.hc_vigenciafranquicia,' +
            ' ahc.hc_clausulaespecial, ahc.hc_idactividad, ahc.hc_idactividad2, ahc.hc_idactividad3,' +
            ' clau.tb_descripcion clausula, ahc.hc_vigenciaclausula, ahc.hc_idempresa,' +
            ' afo.fo_id, ahc.hc_direlectronica, ahc.hc_paginaweb, ahc.hc_fecharecepcionsectorafi,' +
            ' hc_recepcioncontrato, hc_motivorecepcioncontrato, hc_recepcontratofirmado, ahc.hc_pagodirecto,' +
            ' ahm.hm_idgrupoeconomico, hc_sindirelectronica, hc_idorigendatoemail, hc_fecharecepcionanexo,' +
            ' hc_fecharecepcionfaxemail, hc_fecharevision, hc_usurevision, co_fechaaltasectorafi,' +
            ' co_usurecepcionsectorafi, hc_observaciones_addenda, hc_addendaespecial, hc_idtiporegimen' +
       ' FROM ahc_historicocontrato ahc, ahm_historicoempresa ahm, ctb_tablas estado, afo_formulario afo,' +
            ' ctb_tablas origen, ctb_tablas formaj, ctb_tablas sector, age_grupoeconomico holding, ctb_tablas clau,' +
            ' ctb_tablas mot_alta, afi.aec_ejecutivocuenta ecuenta, afi.agc_gestorcuenta gestor, ctb_tablas mot_baj,' +
            ' aen_endoso aen, aco_contrato aco' +
      ' WHERE estado.tb_codigo = ahc.hc_estado' +
        ' AND estado.tb_clave = ''AFEST''' +
        ' AND afo.fo_id = ahc.hc_idformulario' +
        ' AND origen.tb_codigo = ahc.hc_origen' +
        ' AND origen.tb_clave = ''ORSOL''' +
        ' AND formaj.tb_codigo(+) = ahm.hm_formaj' +
        ' AND formaj.tb_clave(+) = ''FJURI''' +
        ' AND sector.tb_codigo = ahm.hm_sector' +
        ' AND sector.tb_clave = ''SECT''' +
        ' AND holding.ge_id(+) = ahm.hm_idgrupoeconomico' +
        ' AND ecuenta.ec_id(+) = ahc.hc_idejecutivo' +
        ' AND gestor.gc_id(+) = ahc.hc_idgestor' +
        ' AND mot_baj.tb_codigo(+) = ahc.hc_motivobaja' +
        ' AND mot_baj.tb_clave(+) = ''MOTIB''' +
        ' AND mot_alta.tb_codigo(+) = ahc.hc_motivoalta' +
        ' AND mot_alta.tb_clave(+) = ''MOTIA''' +
        ' AND clau.tb_codigo(+) = ahc.hc_clausulaespecial' +
        ' AND aen.en_idhistoricocontrato = ahc.hc_id' +
        ' AND aen.en_idhistoricoempresa = ahm.hm_id' +
        ' AND clau.tb_clave(+) = ''CLAUS''' +
        ' AND aco.co_idformulario = ahc.hc_idformulario' +
        ' AND aen.en_id = :id';
    OpenQueryEx(sdqCargaDatos, [aIdEndoso], sSql, True);

    if not sdqCargaDatos.IsEmpty then
    begin
      FIdEmpresa                         := sdqCargaDatos.FieldByName('hc_idempresa').AsInteger;
      FIdFormulario                      := sdqCargaDatos.FieldByName('fo_id').AsInteger;

      cmbEM_NOMBRE.Text                  := sdqCargaDatos.FieldByName('hm_nombre').AsString;
      edEM_CUIT.Text                     := sdqCargaDatos.FieldByName('hm_cuit').AsString;
      edCO_CONTRATO.Text                 := sdqCargaDatos.FieldByName('hc_contrato').AsString;

      fraCO_ESTADO.Value                 := sdqCargaDatos.FieldByName('hc_estado').AsString;
      ActualizarColorEstado;

      cmbCO_FECHAIMPRESION.Date          := sdqCargaDatos.FieldByName('hc_fechaimpresion').AsDateTime;
      cmbCO_RECEPCONTRATO.Date           := sdqCargaDatos.FieldByName('hc_recepcontrato').AsDateTime;
      edFO_FORMULARIO.Text               := sdqCargaDatos.FieldByName('fo_formulario').AsString;

     // fraRegimen.Value                   := sdqCargaDatos.FieldByName('hc_idtiporegimen').AsInteger;

      SetRegimen(sdqCargaDatos.FieldByName('hc_idtiporegimen').AsInteger);
      cmbCO_VIGENCIADESDE.Date           := sdqCargaDatos.FieldByName('hc_vigenciadesde').AsDateTime;
                                          //Esto lo hago porque hay un bug al cargar varias veces la fecha en el TDateComboBox
      if cmbCO_VIGENCIADESDE.IsEmpty then //Es muy extraño, no funciona la asignacion y sigue en empty, si se ejecuta de nuevo funciona tk44324
       cmbCO_VIGENCIADESDE.Date := sdqCargaDatos.FieldByName('hc_vigenciadesde').AsDateTime;

      cmbCO_VIGENCIAHASTA.Date           := sdqCargaDatos.FieldByName('hc_vigenciahasta').AsDateTime;
      fraCO_ORIGEN.Value                 := sdqCargaDatos.FieldByName('hc_origen').AsString;
      edCO_FECHARECEPCION.Date           := sdqCargaDatos.FieldByName('hc_fecharecepcion').AsDateTime;
      edEM_FEINICACTIV.Date              := sdqCargaDatos.FieldByName('hm_feinicactiv').AsDateTime;
      edCO_FECHAAFILIACION.Date          := sdqCargaDatos.FieldByName('hc_fechaafiliacion').AsDateTime;
      fraEM_FORMAJ.Value                 := sdqCargaDatos.FieldByName('hm_formaj').AsString;
      fraEM_SECTOR.Value                 := sdqCargaDatos.FieldByName('hm_sector').AsString;
      fraEM_IDGRUPOECONOMICO.Value       := sdqCargaDatos.FieldByName('hm_idgrupoeconomico').AsInteger;
      fraCO_IDESTUDIOCONTABLE.Value      := sdqCargaDatos.FieldByName('hc_idestudiocontable').AsInteger;
      fraEM_SUSS.Value                   := sdqCargaDatos.FieldByName('hm_suss').AsString;
      fraCO_IDEJECUTIVO.Value            := sdqCargaDatos.FieldByName('hc_idejecutivo').AsInteger;
      fraCO_IDGESTOR.Value               := sdqCargaDatos.FieldByName('hc_idgestor').AsInteger;
      fraCO_MOTIVOALTA.Value             := sdqCargaDatos.FieldByName('hc_motivoalta').AsString;

      if sdqCargaDatos.FieldByName('hc_idartanterior').AsString <> '' then
        fraAR_NOMBRE.Value               := sdqCargaDatos.FieldByName('hc_idartanterior').AsInteger;

      cmbCO_FECHABAJA.Date               := sdqCargaDatos.FieldByName('hc_fechabaja').AsDateTime;
      fraCO_MOTIVOBAJA.Value             := sdqCargaDatos.FieldByName('hc_motivobaja').AsString;

      if sdqCargaDatos.FieldByName('hc_idartfutura').AsString <> '' then
        fraCO_IDARTFUTURA.Value          := sdqCargaDatos.FieldByName('hc_idartfutura').AsInteger
      else
        fraCO_IDARTFUTURA.Clear;

      if sdqCargaDatos.FieldByName('hc_idactividad').AsString <> '' then
        fraCIIU.Value                    := sdqCargaDatos.FieldByName('hc_idactividad').AsInteger;

      fraCIIU2.Value                     := sdqCargaDatos.FieldByName('hc_idactividad2').AsInteger;
      fraCIIU3.Value                     := sdqCargaDatos.FieldByName('hc_idactividad3').AsInteger;
      edNIVEL.Text                       := sdqCargaDatos.FieldByName('hc_nivel').AsString;
      edTOTEMPLEADOS.Value               := sdqCargaDatos.FieldByName('hc_totempleados').AsInteger;
      edMASATOTAL.Value                  := sdqCargaDatos.FieldByName('hc_masatotal').AsCurrency;
      edCO_OBSERVACIONES.Text            := sdqCargaDatos.FieldByName('hc_observaciones').AsString;
      edCO_DIASFRANQUICIA.Value          := sdqCargaDatos.FieldByName('hc_diasfranquicia').AsInteger;
      cmbCO_VIGENCIAFRANQUICIA.Date      := sdqCargaDatos.FieldByName('hc_vigenciafranquicia').AsDateTime;
      fraCO_CLAUSULAESPECIAL.Value       := sdqCargaDatos.FieldByName('hc_clausulaespecial').AsString;
      cmbCO_VIGENCIACLAUSULA.Date        := sdqCargaDatos.FieldByName('hc_vigenciaclausula').AsDateTime;
      cbCO_ADDENDA.Checked               := (sdqCargaDatos.FieldByName('hc_addenda').AsString = 'S');
      cbCO_ADDENDA_DDJJ.Checked          := (sdqCargaDatos.FieldByName('hc_addenda_ddjj').AsString = 'S');
      edComentariosAddenda.Text          := sdqCargaDatos.FieldByName('hc_observaciones_addenda').AsString;
      cbCO_ADDENDAESPECIAL.Checked       := (sdqCargaDatos.FieldByName('hc_addendaespecial').AsString = 'S');
      checkPagoDirecto.Checked           := (sdqCargaDatos.FieldByName('hc_pagodirecto').AsString = 'S');
      edCO_DIRELECTRONICA.Text           := sdqCargaDatos.FieldByName('hc_direlectronica').AsString;
      fraOrigenDatoEmail.Value           := sdqCargaDatos.FieldByName('hc_idorigendatoemail').AsInteger;

      chkNoTieneEmail.Checked            := (sdqCargaDatos.FieldByName('hc_sindirelectronica').AsInteger > 0);
      chkNoTieneEmailClick(nil);

      edCO_PAGINAWEB.Text                := sdqCargaDatos.FieldByName('hc_paginaweb').AsString;
      dcbFechaRecepcionAfiliaciones.Date := sdqCargaDatos.FieldByName('hc_fecharecepcionsectorafi').AsDateTime;
      dcbRecepcionFechaFax.Date          := sdqCargaDatos.FieldByName('hc_fecharecepcionfaxemail').AsDateTime;
      edUsuarioRevision.Text             := sdqCargaDatos.FieldByName('hc_usurevision').AsString;
      edFechaRevision.Text               := sdqCargaDatos.FieldByName('hc_fecharevision').AsString;
      edCO_FECHAALTASECTORAFI.Text       := sdqCargaDatos.FieldByName('co_fechaaltasectorafi').AsString;
      edCO_USUARIORECEPCIONSECTORAFI.Text:= sdqCargaDatos.FieldByName('co_usurecepcionsectorafi').AsString;

      LocalDatosContrato(sdqCargaDatos);
    end;
    sdqCargaDatos.Close;

    // Solapa Domicilio
    sSql :=
      'SELECT hd_calle, hd_contrato, hd_id, hd_numero, hd_piso, hd_departamento, hd_cpostal, hd_cpostala,' +
            ' hd_localidad, pv_descripcion provincia, hd_codareatelefonos, hd_telefonos, hd_codareafax, hd_fax,' +
            ' hd_observaciones, hd_mail' +
       ' FROM ahd_historicodomicilio, cpv_provincias, aen_endoso' +
      ' WHERE en_idhistoricodomicilio = hd_id' +
        ' AND hd_provincia = pv_codigo(+)' +
        ' AND hd_tipo = ''L''' +
        ' AND en_id = :id';
    OpenQueryEx(sdqCargaDatos, [aIdEndoso], sSql, True);

    with sdqCargaDatos do
    begin
      if not IsEmpty then
      begin
        fraDOMICILIO_LEGAL.Numero       := IIF((FieldByName('hd_numero').AsString <> ''), FieldByName('hd_numero').AsString, 'S/N');
        fraDOMICILIO_LEGAL.Piso         := FieldByName('hd_piso').AsString;
        fraDOMICILIO_LEGAL.Departamento := FieldByName('hd_departamento').AsString;
        fraDOMICILIO_LEGAL.CPA          := FieldByName('hd_cpostala').AsString;
        fraDOMICILIO_LEGAL.CodigoPostal := FieldByName('hd_cpostal').AsString;
        fraDOMICILIO_LEGAL.Calle        := FieldByName('hd_calle').AsString;
        fraDOMICILIO_LEGAL.Localidad    := FieldByName('hd_localidad').AsString;
        fraDOMICILIO_LEGAL.Provincia    := FieldByName('provincia').AsString;
        edDC_CODAREAFAX.Text            := FieldByName('hd_codareafax').AsString;
        edDC_FAX.Text                   := FieldByName('hd_fax').AsString;
        edDC_MAIL.Text                  := FieldByName('hd_mail').AsString;
        edDC_OBSERVACIONESLegal.Text    := FieldByName('hd_observaciones').AsString;

        FIdDomicilioLegal := FieldByName('hd_id').AsString;
        LocalDatosDomicilioLegal(sdqCargaDatos);
      end;
      Close;
    end;

    sSql :=
      'SELECT hd_id, hd_contrato, hd_calle, hd_numero, hd_piso, hd_departamento, hd_cpostal, hd_cpostala, hd_localidad,' +
            ' pv_descripcion provincia, hd_codareatelefonos, hd_telefonos, hd_codareafax, hd_fax, hd_observaciones,' +
            ' ct_direlectronica, hd_mail' +
       ' FROM ahd_historicodomicilio, ahm_historicoempresa, act_contacto, cpv_provincias, aen_endoso' +
      ' WHERE en_idhistoricodomiciliopostal = hd_id' +
        ' AND en_idhistoricoempresa = hm_id' +
        ' AND hd_provincia = pv_codigo(+)' +
        ' AND hd_tipo = ''P''' +
        ' AND ct_id = afiliacion.get_idcontactoempresa(hm_cuit)' +
        ' AND en_id = :id';
    OpenQueryEx(sdqCargaDatos, [aIdEndoso], sSql, True);

    with sdqCargaDatos do
    begin
      if not IsEmpty then
      begin
        fraDOMICILIO_POSTAL.Numero       := IIF(FieldByName('hd_numero').AsString <> '', FieldByName('hd_numero').AsString, 'S/N');
        fraDOMICILIO_POSTAL.Piso         := FieldByName('hd_piso').AsString;
        fraDOMICILIO_POSTAL.Departamento := FieldByName('hd_departamento').AsString;
        fraDOMICILIO_POSTAL.CPA          := FieldByName('hd_cpostala').AsString;
        fraDOMICILIO_POSTAL.CodigoPostal := FieldByName('hd_cpostal').AsString;
        fraDOMICILIO_POSTAL.Calle        := FieldByName('hd_calle').AsString;
        fraDOMICILIO_POSTAL.Localidad    := FieldByName('hd_localidad').AsString;
        fraDOMICILIO_POSTAL.Provincia    := FieldByName('provincia').AsString;
        edDC_CODAREAFAX_POST.Text        := FieldByName('hd_codareafax').AsString;
        edDC_FAX_POST.Text               := FieldByName('hd_fax').AsString;
        edDC_MAIL_POST.Text              := FieldByName('hd_mail').AsString;
        edDC_OBSERVACIONESPostal.Text    := FieldByName('hd_observaciones').AsString;

        // El combo de teléfonos se llena en el procedimiento CargarCombosTelefonos..
        FIdDomicilioPostal := FieldByName('hd_id').AsString;
        LocalDatosDomicilioPostal(sdqCargaDatos);
      end;
      Close;
    end;

    // Datos del formulario de rectificación de datos..
    sSql :=
      'SELECT afe.fe_id' +
       ' FROM afi.afe_formulariosestablecimiento afe' +
      ' WHERE afe.fe_contrato = :contrato' +
        ' AND fe_idendosomovimiento = (SELECT MAX(a.fe_idendosomovimiento)' +
                                       ' FROM afi.afe_formulariosestablecimiento a' +
                                      ' WHERE a.fe_contrato = afe.fe_contrato' +
                                        ' AND a.fe_idendosomovimiento <= :idendosomovimiento)';
    with GetQueryEx(sSql, [edCO_CONTRATO.Value, aIdEndoso]) do
    try
      edNumeroFormRectificacionDatos.Value       := FieldByName('fe_id').AsInteger;
      edNumeroFormRectificacionDatosExit(nil);
      edNumeroFormRectificacionDatosActual.Value := FieldByName('fe_id').AsInteger;

      sSql :=
        'SELECT afiliacion.getformulariovalidacion(:contrato, :endoso)' +
         ' FROM DUAL';
      edDetalleRectificacionDatos.Text := ValorSqlEx(sSql, [edCO_CONTRATO.Value, aIdEndoso]);
    finally
      Free;
    end;

    // Solapa Endosos
    sSql :=
      'SELECT en_endoso, en_vigenciaendoso, en_movimiento, en_motivo, mot.tb_descripcion motivo, en_usualta,' +
            ' en_fechaalta, en_fechaimpresion, en_fenviosrt, en_frecepcionsrt, envio.tb_descripcion envio_srt,' +
            ' rechazo.tb_descripcion rechazo_srt, observ.tb_descripcion observaciones_srt, en_enviosrt, en_enviocarta,' +
            ' mot.tb_especial1 tipoendoso' +
       ' FROM ctb_tablas mot, ctb_tablas envio, ctb_tablas rechazo, ctb_tablas observ, aen_endoso' +
      ' WHERE mot.tb_codigo = en_motivo' +
        ' AND mot.tb_clave = ''MOTEN''' +
        ' AND envio.tb_codigo(+) = en_tipoenviosrt' +
        ' AND envio.tb_clave(+) = ''SRTTE''' +
        ' AND rechazo.tb_codigo(+) = en_tipoenviosrt' +
        ' AND rechazo.tb_clave(+) = ''SRTRE''' +
        ' AND observ.tb_codigo(+) = en_tipoenviosrt' +
        ' AND observ.tb_clave(+) = ''SRTOB''' +
        ' AND en_id = :id';
    OpenQueryEx(sdqCargaDatos, [aIdEndoso], sSql, True);
    if not sdqCargaDatos.IsEmpty then
    begin
      edEN_ENDOSO.Text            := sdqCargaDatos.FieldByName('en_endoso').AsString;
      cmbEN_VIGENCIAENDOSO.Date   := sdqCargaDatos.FieldByName('en_vigenciaendoso').AsDateTime;
      edEN_MOVIMIENTO.Text        := sdqCargaDatos.FieldByName('en_movimiento').AsString;
      fraEN_MOTIVO.Value          := sdqCargaDatos.FieldByName('en_motivo').AsString;
      edEN_USUALTA.Text           := sdqCargaDatos.FieldByName('en_usualta').AsString;
      cmbEN_FECHAALTA.Date        := sdqCargaDatos.FieldByName('en_fechaalta').AsDateTime;
      cmbEN_FECHAIMPRESION.Date   := sdqCargaDatos.FieldByName('en_fechaimpresion').AsDateTime;
      cmbEN_FENVIOSTR.Date        := sdqCargaDatos.FieldByName('en_fenviosrt').AsDateTime;
      cmbEN_FRECEPCIONSTR.Date    := sdqCargaDatos.FieldByName('en_frecepcionsrt').AsDateTime;
      edEN_TIPOENVIOSTR.Text      := sdqCargaDatos.FieldByName('envio_srt').AsString;
      edEN_CODRECHAZOSTR.Text     := sdqCargaDatos.FieldByName('rechazo_srt').AsString;
      edEN_CODOBSERVACIONSTR.Text := sdqCargaDatos.FieldByName('observaciones_srt').AsString;
      cbEN_ENVIOSRT_C.Checked     := (sdqCargaDatos.FieldByName('en_enviosrt').AsString = 'S');
      ModificarAparienciaDesmarcarEnvioSRT;
      cbEN_ENVIOCARTA_C.Checked   := (sdqCargaDatos.FieldByName('en_enviocarta').AsString = 'S');
      FTipoEndoso                 := sdqCargaDatos.FieldByName('tipoendoso').AsString;
      LocalDatosEndoso(sdqCargaDatos);
    end;

    // Solapa Endosos, Grupo Recepción de Contratos..
     sSql :=
      'SELECT hc_fechaimpresion, hc_recepcioncontrato, hc_recepcontrato, hc_motivorecepcioncontrato,' +
            ' hc_recepcontratofirmado, hc_fecharecepcionanexo, tb_codigo' +
          ' FROM aen_endoso '+
          ' LEFT JOIN ahc_historicocontrato ON en_idhistoricocontrato = hc_id' +
          ' LEFT JOIN art.ctb_tablas ON hc_motivorecepcioncontrato = tb_codigo AND tb_clave = ''CODRE'' AND tb_especial1 IN (''SEPRIT'', ''LA POSTAL'')' +
        ' WHERE en_id = :idendoso';
    with GetQueryEx(sSql, [aIdEndoso]) do
    try
      edFechaImpresion.Date                 := FieldByName('hc_fechaimpresion').AsDateTime;

      if (FieldByName('hc_recepcioncontrato').AsString <> 'S') and (FieldByName('hc_recepcioncontrato').AsString <> 'N') then
        rgRecepcionOk.ItemIndex             := -1
      else
        rgRecepcionOk.ItemIndex             := IIF((FieldByName('hc_recepcioncontrato').AsString = 'S'), 0, 1);

      edFechaRecepcion.Date                 := FieldByName('hc_recepcontrato').AsDateTime;

      if FieldByName('hc_recepcioncontrato').AsString = 'S' then
        edCodigoRecepcion.Text              := IIF((FieldByName('hc_motivorecepcioncontrato').AsString = '0'), 'FIRMADO', IIF((FieldByName('hc_motivorecepcioncontrato').AsString = '1'), 'NO FIRMADO', ''))
      else if FieldByName('hc_recepcioncontrato').AsString = 'N' then
        edCodigoRecepcion.Text              := FieldByName('tb_codigo').AsString
      else
        edCodigoRecepcion.Text              := '';

      edFechaRecepcionContratoFirmado2.Date := FieldByName('hc_recepcontratofirmado').AsDateTime;
      edFechaRecepcionAnexoFirmado.Date     := FieldByName('hc_fecharecepcionanexo').AsDateTime;
    finally
      Free;
    end;


    // Blanquea el motivo de endoso
    CambioClausulaEspecial(nil);
    fraEN_MOTIVO_Alta.Clear;


    // Solapa Indicadores..
    sSql :=
      'SELECT co_contrato, utiles.get_diferenciaentrefechas(co_fecharecepcionsectorafi, en_fechaalta) dias_alta,' +
            ' CASE' +
              ' WHEN en_fenviosrt IS NOT NULL THEN utiles.get_diferenciaentrefechas(en_fechaalta, en_fenviosrt)' +
              ' ELSE 0' +
            ' END dias_srt,' +
            ' CASE' +
              ' WHEN(en_frecepcionsrt IS NOT NULL)' +
               ' OR (co_fechaimpresion IS NOT NULL) THEN utiles.get_diferenciaentrefechas(en_frecepcionsrt, co_fechaimpresion)' +
              ' ELSE 0' +
            ' END dias_imp' +
       ' FROM aco_contrato JOIN aen_endoso ON en_contrato = co_contrato' +
      ' WHERE 1 = 1' +
        ' AND en_endoso = 0' +
        ' AND en_movimiento = 0' +
        ' AND co_contrato = :contrato';
    with GetQueryEx(sSql, [edCO_CONTRATO.Value]) do
    try
      edAltaContrato.Text         := Format('%d DÍAS', [FieldByName('dias_alta').AsInteger]);
      edAprobacionSrt.Text        := Format('%d DÍAS', [FieldByName('dias_srt').AsInteger]);
      edEnvioContratoCliente.Text := Format('%d DÍAS', [FieldByName('dias_imp').AsInteger]);
      edTotalDias.Text            := Format('%d DÍAS', [FieldByName('dias_alta').AsInteger + FieldByName('dias_srt').AsInteger + FieldByName('dias_imp').AsInteger]);
    finally
      Free;
    end;
  finally
    sdqCargaDatos.Free;
  end;
end;

procedure TfrmModificacionContrato.CargarDatosTarifaPCP(
  const aContrato: integer);
var
  sSql: String;
  aQuery: TSDQuery;
begin
  edCantTrabMenosDe12.Clear;
  edCantTrabDe12a16.Clear;
  edCantTrabMasDe16.Clear;

  sSql :=
        'SELECT pp_renglon, pp_valor ' +
        '   FROM afi.app_parametro_pcp ' +
        '  WHERE pp_fechabaja IS NULL ';
  aQuery := GetQueryEx(sSql, []);
  try
    while not aQuery.Eof do
    begin
      if aQuery.FieldByName('pp_renglon').AsInteger = 1 then
        edValorMenosDe12.Value := aQuery.FieldByName('pp_valor').AsCurrency;
      if aQuery.FieldByName('pp_renglon').AsInteger = 2 then
        edValorDesde12a16.Value := aQuery.FieldByName('pp_valor').AsCurrency;
      if aQuery.FieldByName('pp_renglon').AsInteger = 3 then
        edValorMasDe16.Value := aQuery.FieldByName('pp_valor').AsCurrency;
      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;

  sSql :=
         'SELECT pp_renglon, ap_canttrabajador, ap_alicuota ' +
         '  FROM afi.aap_alicuotas_pcp ' +
         '       LEFT JOIN afi.app_parametro_pcp ON ap_idparametro_pcp = pp_id AND NVL(ap_fechaalta, SYSDATE) BETWEEN pp_fechadesde AND pp_fechahasta ' +
         ' WHERE ap_contrato = :id ' ;

  aQuery := GetQueryEx(sSql, [aContrato]);
  try
    while not aQuery.Eof do
    begin
      case aQuery.FieldByName('pp_renglon').AsInteger of
      1:
        begin
          edCantTrabMenosDe12.Value :=  aQuery.FieldByName('ap_canttrabajador').AsInteger;
          edAlicuotaMenosDe12.Value :=  aQuery.FieldByName('ap_alicuota').AsInteger;
        end;
        2:
        begin
          edCantTrabDe12a16.Value :=  aQuery.FieldByName('ap_canttrabajador').AsInteger;
          edAlicuotaDe12a16.Value :=  aQuery.FieldByName('ap_alicuota').AsInteger;
        end;
        3:
        begin
          edCantTrabMasDe16.Value :=  aQuery.FieldByName('ap_canttrabajador').AsInteger;
          edAlicuotaMasDe16.Value :=  aQuery.FieldByName('ap_alicuota').AsInteger;
        end;
      end;
      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
  CalcularCostosPCP;
end;

procedure TfrmModificacionContrato.Validar;
var
  Day: Word;
  EsSuperUsuario: Boolean;
  FechaAlta: TDateTime;
  Month: Word;
  NroEndoso: Integer;
  TabIndex: Integer;
  Year: Word;

  procedure Verificar(Condicion: Boolean; AControl: TWinControl; TabIndex: Integer; AText: String;
                      EsSuperCondicion: Boolean = False);
  begin
    if Condicion then
    begin
      if EsSuperUsuario and EsSuperCondicion then
      begin
        PgContrato.ActivePageIndex := TabIndex;
        if AControl.CanFocus then
          AControl.SetFocus;
        if not MsgAsk(AText + #13#10 + 'Tiene permiso para seguir adelante. ¿ Desea hacerlo ?') then
          Abort;
      end
      else
      begin
        PgContrato.ActivePageIndex := TabIndex;
        if (AText <> '') then
        begin
          DoAgregarLinea(FCurrentLine, IntToStr(FContrato), '', '', '', '', AText); //tk 36126 y 41944
          InvalidMsg(AControl, AText);
        end;
        Abort;
      end;
    end;
  end;

var
  sSql: String;
begin
  EsSuperUsuario := Seguridad.Claves.IsActive('PermisoSuperUsuarioSinValidar') or (EstadoForm = efModificaEndoso);
  TabIndex := 0;

  // VALIDAR DATOS GENERALES DEL CONTRATO
  if EstadoForm <> efEndososMultiples then
  begin
    Verificar(cmbEM_NOMBRE.Text = '', cmbEM_NOMBRE, TabIndex, 'El nombre de la empresa es obligatorio.');
    Verificar(edEM_CUIT.Text = '', edEM_CUIT, TabIndex, 'La C.U.I.T. de la empresa es obligatoria.');
    Verificar((not cmbCO_FECHAIMPRESION.IsEmpty) and (cmbCO_FECHAIMPRESION.Date>Date), cmbCO_FECHAIMPRESION, TabIndex, 'La fecha de impresión del contrato no puede ser posterior a hoy.');
    Verificar(fraCO_ESTADO.IsEmpty, fraCO_ESTADO, TabIndex, 'El estado del contrato es obligatorio.');
    Verificar(fraCO_ORIGEN.IsEmpty, fraCO_ORIGEN, TabIndex, 'El origen es obligatorio.');
    Verificar(fraEM_SECTOR.IsEmpty, fraEM_SECTOR, TabIndex, 'El Sector es Obligatorio.');
    Verificar(fraEM_SUSS.IsEmpty, fraEM_SUSS, TabIndex, 'El SUSS es Obligatorio.');
    Verificar(edNIVEL.Text = '', edNIVEL, TabIndex, 'El Nivel es Obligatorio.');
    Verificar(edTOTEMPLEADOS.Value < 0, edTOTEMPLEADOS, TabIndex, 'La cantidad de Empleados debe ser mayor o igual a cero.');
    Verificar((edMASATOTAL.Value < 0) and (FTipoRegimen <> 2), edMASATOTAL, TabIndex, 'La Masa Salarial debe ser mayor o igual a cero.');
    Verificar((edMASATOTAL.Value > 0) and (FTipoRegimen = 2), edMASATOTAL, TabIndex, 'La Masa Salarial debe ser cero para el régimen especial');
    Verificar(edCO_DIASFRANQUICIA.Value < 0, edCO_DIASFRANQUICIA, TabIndex, 'La cantidad de dias de franquicia debe ser mayor o igual a cero.');
    Verificar(cmbCO_VIGENCIAFRANQUICIA.IsEmpty, cmbCO_VIGENCIAFRANQUICIA, TabIndex, 'La Fecha de Vigencia de la Franquicia es Obligatoria.');
    Verificar(cmbCO_VIGENCIAFRANQUICIA.Date < cmbCO_VIGENCIADESDE.Date, cmbCO_VIGENCIAFRANQUICIA, TabIndex, 'La Vigencia Franquicia debe ser superior a la Vigencia Desde.');
    Verificar(not fraCO_CLAUSULAESPECIAL.IsEmpty and cmbCO_VIGENCIACLAUSULA.IsEmpty, cmbCO_VIGENCIACLAUSULA, TabIndex, 'La vigencia de la cláusula no puede quedar en blanco si existe una cláusula cargada.');
    Verificar(not fraCO_CLAUSULAESPECIAL.IsEmpty and (cmbCO_VIGENCIACLAUSULA.Date < cmbCO_VIGENCIADESDE.Date), cmbCO_VIGENCIACLAUSULA, TabIndex, 'La Vigencia de Cláusula debe ser superior a la Vigencia Desde.');
    Verificar(((fraCO_ESTADO.Value = '6') or (fraCO_ESTADO.Value = '9')) and (cmbCO_FECHABAJA.IsEmpty), cmbCO_FECHABAJA, TabIndex, 'Falta la fecha de baja del contrato.');
    Verificar(((fraCO_ESTADO.Value = '6') or (fraCO_ESTADO.Value = '9')) and (fraCO_MOTIVOBAJA.IsEmpty), fraCO_MOTIVOBAJA, TabIndex, 'Falta el motivo de baja del contrato.');
//    Verificar((fraCO_ESTADO.Value <> '6') and (fraCO_MOTIVOBAJA.Value = '08'), fraCO_MOTIVOBAJA, TabIndex, 'El Motivo de baja no puede ser "08" si el Estado no es "6".', True);
    Verificar((fraCO_ESTADO.Value = '9') and (fraCO_MOTIVOBAJA.Value <> '08'), fraCO_MOTIVOBAJA, TabIndex, 'Si el Estado es "9", el Motivo de Baja debe ser "08".', True);
    Verificar((not cmbCO_FECHABAJA.IsEmpty) and (cmbCO_FECHABAJA.Date > DBDate) and (fraCO_MOTIVOBAJA.Value <> '07') and (fraCO_ESTADO.Value <> '9'), cmbCO_FECHABAJA, TabIndex, 'La Fecha de Baja no puede ser posterior al día de hoy.');
    Verificar(not cmbCO_FECHABAJA.IsEmpty and (cmbCO_FECHABAJA.Date < edCO_FECHAAFILIACION.Date), cmbCO_FECHABAJA, TabIndex, 'La Fecha de Baja tiene que ser mayor o igual a la Fecha de Afiliación.');
    Verificar(not cmbCO_FECHABAJA.IsEmpty and (cmbCO_FECHABAJA.Date < cmbCO_VIGENCIADESDE.Date), cmbCO_FECHABAJA, TabIndex, 'La Fecha de Baja tiene que ser mayor o igual a la Fecha de vigencia inicial del contrato.');
    Verificar(not cmbCO_FECHABAJA.IsEmpty and (cmbCO_FECHABAJA.Date > cmbCO_VIGENCIAHASTA.Date), cmbCO_FECHABAJA, TabIndex, 'La Fecha de Baja tiene que ser menor o igual a la Fecha de vigencia final del contrato.');
    Verificar(not cmbCO_FECHABAJA.IsEmpty and fraCO_MOTIVOBAJA.IsEmpty, fraCO_MOTIVOBAJA, TabIndex, 'El Motivo de baja es Obligatorio si existe Fecha de Baja.');
    Verificar(not cmbCO_FECHABAJA.IsEmpty and (fraCO_ESTADO.Value = '1'), fraCO_ESTADO, TabIndex, 'Con Fecha de Baja el Estado no puede ser ACTIVO.');
    Verificar(not fraCO_MOTIVOBAJA.IsEmpty and (fraCO_ESTADO.Value = '1'), fraCO_ESTADO, TabIndex, 'Con Motivo de Baja el Estado no puede ser ACTIVO.');
    Verificar((not cmbCO_VIGENCIAFRANQUICIA.IsEmpty) and ((cmbCO_VIGENCIAFRANQUICIA.Date<cmbCO_VIGENCIADESDE.Date) or (cmbCO_VIGENCIAFRANQUICIA.Date>cmbCO_VIGENCIAHASTA.Date)), cmbCO_VIGENCIAFRANQUICIA, TabIndex, 'La fecha de la vigencia de la franquicia no puede estar fuera del período de vigencia del contrato');
    Verificar(not fraCO_IDARTFUTURA.IsEmpty and (fraCO_ESTADO.Value = '1'), fraCO_ESTADO, TabIndex, 'Con Estado ACTIVO no es posible seleccionar una Art Futura.');
    Verificar(not fraCO_IDARTFUTURA.IsEmpty and (fraCO_MOTIVOBAJA.Value <> '07'), fraCO_MOTIVOBAJA, TabIndex, 'No es posible seleccionar una Art Futura si el motivo de baja no es "Baja por Traspaso".');
    Verificar(fraCO_IDARTFUTURA.IsEmpty and (fraCO_MOTIVOBAJA.Value = '07'), fraCO_IDARTFUTURA, TabIndex, 'La ART Futura es obligatoria.');


    //Si la franquicia se dejo vacia o si estamos en el endoso '0' debe tener el valor de Vigencia Desde
    if edCO_CONTRATO.Text = '' then
      NroEndoso := 0
    else
    begin
      sSql :=
        'SELECT MAX(en_endoso)' +
         ' FROM aen_endoso' +
        ' WHERE en_contrato = :contrato';
      NroEndoso := ValorSqlIntegerEx(sSql, [edCO_CONTRATO.Text], 0);
    end;
    if ((cmbCO_VIGENCIAFRANQUICIA.IsEmpty) or (NroEndoso = 0) and (cmbCO_VIGENCIAFRANQUICIA.Date <> cmbCO_VIGENCIADESDE.Date)) then
    begin
      MessageDlg('Se corregirá la vigencia de la franquicia para que sea igual a la vigencia Desde del contrato.', mtInformation, [mbOK], 0);
      cmbCO_VIGENCIAFRANQUICIA.Date := cmbCO_VIGENCIADESDE.Date;
    end;

    // VALIDAR DATOS DEL DOMICILIO DEL CONTRATO
    TabIndex := 1;
    Verificar(not fraDOMICILIO_LEGAL.IsValid, fraDOMICILIO_LEGAL, TabIndex, '');
    Verificar((fraDOMICILIO_LEGAL.Localidad = ''), fraDOMICILIO_LEGAL, TabIndex, 'El campo Localidad es obligatorio.');
    Verificar((edDC_MAIL.Text > '') and (not IsEMails(edDC_MAIL.Text)), edDC_MAIL, TabIndex, 'La dirección de e-mail no es válida.');
    Verificar(not fraDOMICILIO_POSTAL.IsValid, fraDOMICILIO_POSTAL, TabIndex, '');
   // Verificar((fraDOMICILIO_POSTAL.Localidad = ''), fraDOMICILIO_POSTAL, TabIndex, 'El campo Localidad es obligatorio.');
    Verificar((edDC_MAIL_POST.Text > '') and (not IsEMails(edDC_MAIL_POST.Text)), edDC_MAIL_POST, TabIndex, 'La dirección de e-mail no es válida.');

    if fraEN_MOTIVO_Alta.Codigo = '323' then
      Verificar(IsDomicilioIgualSQL, fraEN_MOTIVO_Alta, 2, 'El domicilio Constituido y el Postal son iguales, no podrá guardar los datos con éste tipo de endoso');

    if not edNumeroFormRectificacionDatos.IsEmpty then
    begin
      if edNumeroFormRectificacionDatos.Value <> edNumeroFormRectificacionDatosActual.Value then
      begin                                                                                                      //tk 40831
        Verificar (not MotivoAltaEndosoParaRectificacionDomicilioOk, fraEN_MOTIVO_Alta, 2, 'El motivo del endoso no es correcto para actualizar el Formulario de Rectificación de Datos' + #13#10 +
                                                                                            'Los motivos aceptados son: 01.2 Cambio de Domicilio, 13.1 Agrega y/o Cambia Teléfono, ' +
                                                                                            '13.4 Agrega y/o Cambio E-Mail Corporativo, 320 Cambio de Domicilio Postal, 321 Validación de Domicilio Ok');
        sSql :=
            'SELECT 1' +
            ' FROM afi.afe_formulariosestablecimiento' +
            ' WHERE fe_id = :id' +
              ' AND fe_contrato = :contrato';
        Verificar(not ExisteSqlEx(sSql, [edNumeroFormRectificacionDatos.Value, edCO_CONTRATO.Value]), edNumeroFormRectificacionDatos, TabIndex, 'El Nº de Formulario de Rectificación de Datos ingresado no fue impreso para ese contrato.');
      end;
    end;

    Verificar((edCO_DIRELECTRONICA.Text > '') and (not IsEMails(edCO_DIRELECTRONICA.Text)), edCO_DIRELECTRONICA, TabIndex, 'La dirección de e-mail no es válida.');
//    Verificar(chkNoTieneEmail.Checked and fraOrigenDatoEmail.IsEmpty, fraOrigenDatoEmail, TabIndex, 'Debe indicar el origen del e-mail.');
    Verificar((edCO_PAGINAWEB.Text > '') and (not IsWebPage(edCO_PAGINAWEB.Text)), edCO_PAGINAWEB, TabIndex, 'La dirección de la página web no es válida.');

    /////////////////////////////
    // VALIDACIONES ESPECIALES //
    /////////////////////////////
    if (EstadoForm <> efModificaEndoso) and (not (FPermisoModificarSRT and (fraCO_ESTADO.Value = '2'))) then
    begin
      if EstadoForm = efCampania then
      begin
        sSql :=
          'SELECT tb_codigo' +
           ' FROM ctb_tablas' +
          ' WHERE tb_especial1 = :especial1' +
            ' AND tb_clave = :clave';
        fraEN_MOTIVO_Alta.Value := ValorSQLEx(sSql, ['12', 'MOTEN'], '0');
      end;

      TabIndex := 2;
      Verificar(fraEN_MOTIVO_Alta.IsEmpty, fraEN_MOTIVO_Alta, TabIndex, 'El motivo del endoso es obligatorio.');
    end;

    TabIndex := 0;
    sSql :=
      'SELECT co_fechaalta' +
       ' FROM aco_contrato' +
      ' WHERE co_contrato = :contrato';
    FechaAlta := ValorSqlDateTimeEx(sSql, [FContrato]);
    DecodeDate(FechaAlta, Year, Month, Day);

    if not fraCO_MOTIVOBAJA.IsEmpty then
      if ((fraCO_MOTIVOBAJA.Value = '2') or (fraCO_MOTIVOBAJA.Value = '3')) then
      begin
        //Si el motivo de baja es 02 o 03 (baja por reafiliacion o error de carga, entonces la baja debe hacerse
        //el mismo dia de inicio de vigencia y los campos vigencia desde y hasta deben ser iguales
        Verificar(cmbCO_VIGENCIADESDE.Date <> cmbCO_VIGENCIAHASTA.Date, cmbCO_VIGENCIADESDE, TabIndex, 'La vigencia Desde del contrato debe ser igual a la vigencia Hasta.', EsSuperUsuario);
        Verificar(cmbCO_FECHABAJA.Date <> cmbCO_VIGENCIAHASTA.Date, cmbCO_FECHABAJA, TabIndex, 'La vigencia Hasta del contrato debe ser igual a la fecha de baja.', EsSuperUsuario);
      end
      else
      begin
        //Si no es este el caso, entonces la vigencia minima es de dos meses
        Verificar(IncMonth(cmbCO_VIGENCIADESDE.Date, 2) > cmbCO_VIGENCIAHASTA.Date, cmbCO_VIGENCIADESDE, TabIndex, 'La vigencia de un contrato debe ser por lo menos de 2 meses.', EsSuperUsuario);
      end;
    Verificar((not edEM_FEINICACTIV.IsEmpty) and (edEM_FEINICACTIV.Date>cmbCO_VIGENCIADESDE.Date), edEM_FEINICACTIV, TabIndex, 'La fecha de inicio de actividades no puede ser mayor a la vigencia desde del contrato.', EsSuperUsuario);
    Verificar((not cmbCO_RECEPCONTRATO.IsEmpty) and (cmbCO_RECEPCONTRATO.Date<edCO_FECHAAFILIACION.Date), cmbCO_RECEPCONTRATO, TabIndex, 'La fecha de recepción del contrato no puede ser anterior a la fecha de afiliación.', EsSuperUsuario);
    Verificar((not cmbCO_RECEPCONTRATO.IsEmpty) and (cmbCO_RECEPCONTRATO.Date>Date), cmbCO_RECEPCONTRATO, TabIndex, 'La fecha de recepción del contrato no puede ser ser posterior a hoy.', EsSuperUsuario);


    // VALIDAR DATOS DE LOS ENDOSOS DEL CONTRATO
    TabIndex := 2;
    Verificar((CO_ESTADO = '6') and ((fraEN_MOTIVO_Alta.Value = '04') or (fraEN_MOTIVO_Alta.Value = '05')), fraEN_MOTIVO_Alta, TabIndex, 'No se puede realizar un endoso con ese motivo porque la empresa ya se encuentra dada de baja.');
    if not (FPermisoModificarSRT and (fraCO_ESTADO.Value = '2')) and cmbEN_VIGENCIAENDOSO_Alta.Visible then
      Verificar(cmbEN_VIGENCIAENDOSO_Alta.IsEmpty, cmbEN_VIGENCIAENDOSO_Alta, TabIndex, 'La fecha de vigencia del endoso es obligatoria.', EsSuperUsuario);

    //4.	Siempre que se genere el movimiento 321 y el domicilio Postal no coincida con el Legal tiene que advertir esto al usuario
    //y no permitirle el cambio.
    if fraEN_MOTIVO_Alta.Value = '321' then
      Verificar(not IsDomicilioIgual, grbDomicilioLegal, 1, 'El Domicilio Postal no es igual a el Constituido.', EsSuperUsuario);

    //tk 56140 - Solicito nueva validación para los casos que se habilita el campo vigencia en la generación de
    //ciertos endosos (de acuerdo están definidos), esta nunca tiene que ser menor a 12 meses contados a partir del día
    //que se está realzando el movimiento. Para los usuarios Florencia Firenze y Celeste Allo la vigencia nunca podrá
    //ser menor a 1996
    if (cmbEN_VIGENCIAENDOSO_Alta.Visible) and (not cmbEN_VIGENCIAENDOSO_Alta.IsEmpty) then
    begin
      if (Sesion.UserID = 'CALLO') or (Sesion.UserID = 'FMFIRENZE') then
        Verificar(cmbEN_VIGENCIAENDOSO_Alta.Date < StrToDate('01/01/1996'), cmbEN_VIGENCIAENDOSO_Alta, TabIndex, 'La fecha de vigencia del endoso no puede ser anterior a 1996')
      else
        Verificar(cmbEN_VIGENCIAENDOSO_Alta.Date < IncMonth(DBDate, -12), cmbEN_VIGENCIAENDOSO_Alta, TabIndex, 'La fecha de vigencia del endoso no puede ser anterior a 12 meses');
    end;

    Verificar((dcbFechaRecepcionAfiliaciones.Visible) and (not dcbFechaRecepcionAfiliaciones.ReadOnly) and (dcbFechaRecepcionAfiliaciones.Date = 0), dcbFechaRecepcionAfiliaciones, TabIndex, 'El campo Fecha Recepción Afiliaciones es obligatorio.');

    if EstadoForm <> efModificaEndoso then
      if ((fraCO_ESTADO.Value = '6') or (fraCO_ESTADO.Value = '9')) then
      begin
        sSql :=
          'SELECT en_endoso, en_vigenciaendoso, en_motivo, tb_descripcion' +
           ' FROM art.acc_controlcn' +
           ' JOIN aen_endoso on en_contrato = cc_contrato AND en_endoso = cc_endoso and en_movimiento = 0' +
           ' JOIN art.ctb_tablas on en_motivo = tb_codigo AND tb_clave = ''MOTEN''' +
          ' WHERE cc_envio = 0' +
            ' AND cc_contrato = :contrato';
        with GetQueryEx(sSql, [FContrato]) do
        try
          if not IsEmpty then
          begin
            DoAgregarLinea(FCurrentLine,
                           IntToStr(FContrato),
                           FieldByName('en_endoso').AsString,
                           FieldByName('tb_descripcion').AsString,
                           FieldByName('en_motivo').AsString,
                           FieldByName('en_vigenciaendoso').AsString,
                           'Pendiente de Envio a la súper');
            if frmModificacionContrato.Visible then
              begin
                if not MsgAsk('Envios pendientes a la súper. Tiene permiso para seguir adelante. ¿ Desea hacerlo ?') then
                  Abort;
              end
              else
                Abort;
          end;
        finally
          Free;
        end;
      end;
    /////////////////////////////////
    // FIN VALIDACIONES ESPECIALES //
    /////////////////////////////////
  end;
end;

procedure TfrmModificacionContrato.FormCreate(Sender: TObject);
begin
  inherited;

  fraCO_ESTADO.Clave    := 'AFEST'; {Static}
  fraCO_ESTADO.OnChange := ChequearEstado;
  fraCO_ORIGEN.Clave    := 'ORSOL'; {Static}
  fraEM_FORMAJ.Clave    := 'FJURI'; {Static}
  fraEM_SECTOR.Clave    := 'SECT';  {Static}
  fraEM_SUSS.Clave      := 'SUSS';  {Static}

  fraCO_MOTIVOALTA.Clave       := 'MOTIA';  {Static}
  fraCO_MOTIVOBAJA.Clave       := 'MOTIB';  {Static}
  fraCO_MOTIVOBAJA.OnChange    := CambiaMotivoBaja;
  fraCO_CLAUSULAESPECIAL.Clave := 'CLAUS';  {Static}
  fraEN_MOTIVO.Clave           := 'MOTEN';  {Static}

  with fraCO_IDEJECUTIVO do
  begin
    TableName   := 'aec_ejecutivocuenta';
    FieldID     := 'ec_id';
    FieldCodigo := 'ec_id';
    FieldDesc   := 'ec_nombre';
    FieldBaja   := 'ec_fechabaja';
  end;

  with fraCO_IDESTUDIOCONTABLE do
  begin
    TableName   := 'aec_estudiocontable';
    FieldID     := 'ec_id';
    FieldCodigo := 'ec_id';
    FieldDesc   := 'ec_nombre';
    FieldBaja   := 'ec_fechabaja';
  end;

  with fraCO_IDGESTOR do
  begin
    TableName   := 'agc_gestorcuenta';
    FieldID     := 'gc_id';
    FieldCodigo := 'gc_id';
    FieldDesc   := 'gc_nombre';
    FieldBaja   := 'gc_fechabaja';
  end;

  with fraAR_NOMBRE do
  begin
    TableName   := 'aar_art';
    FieldID     := 'ar_id';
    FieldCodigo := 'ar_id';
    FieldDesc   := 'ar_nombre';
    FieldBaja   := 'ar_fechabaja';
  end;

  with fraCO_IDARTFUTURA do
  begin
    TableName   := 'aar_art';
    FieldID     := 'ar_id';
    FieldCodigo := 'ar_id';
    FieldDesc   := 'ar_nombre';
    FieldBaja   := 'ar_fechabaja';
    ShowBajas   := True;
  end;

  with fraOrigenDatoEmail do
  begin
    TableName   := 'comunes.cod_origendatoemail';
    FieldID     := 'od_id';
    FieldCodigo := 'od_id';
    FieldDesc   := 'od_detalle';
    FieldBaja   := 'od_fechabaja';
  end;

  with fraCaracter do
    begin
      TableName      := 'acf_caracterfirma';
      FieldID        := 'cf_id';
      FieldCodigo    := 'cf_id';
      FieldDesc      := 'cf_caracter';
      FieldBaja      := 'cf_fechabaja';
      if not (fraEM_FORMAJ.IsEmpty) then
        ExtraCondition := ' AND cf_id IN (SELECT df_caracterfirma FROM adf_documentacionfalta WHERE df_formajuridica = ' + fraEM_FORMAJ.Value + ')';
      ShowBajas      := False;
    end;

  fraEN_MOTIVO_Alta.OnChange := fraEN_MOTIVO_AltaOnChange;

  fraCO_CLAUSULAESPECIAL.OnChange := CambioClausulaEspecial;

  ListaEndosos := TStringList.Create;
  PgContrato.ActivePageIndex := 0;
  frmPrincipal.mnuModificacionContrato.Enabled := False;

  fraEN_MOTIVO_Alta.ExtraFields := ', t2.tb_codigo tipoendoso ';

  //fraRecepcionNo.Clave := 'CODRE';
  //fraRecepcionNo.Especial1 := 'SEPRIT';
  fraRecepcionNo.ShowBajas := False;

  fraRecepcionNo.TableName := 'ctb_tablas';
  fraRecepcionNo.FieldBaja := 'tb_fechabaja';
  fraRecepcionNo.FieldCodigo := 'tb_codigo';
  fraRecepcionNo.FieldDesc := 'tb_descripcion';
  fraRecepcionNo.FieldID := 'tb_id';

  fraRecepcionNo.ExtraCondition := ' AND tb_clave = ''CODRE'' AND tb_especial1 = ''SEPRIT'' ';


  fraTipoFirmante.Clave  := 'TFIRM';
  fraTipoDocumento.Clave := 'TDOC';

  CrearComponentesDocumentacionFirmante;

  LockControls([dcbFechaRecepcionAfiliaciones, edNumeroFormRectificacionDatosActual, edDetalleRectificacionDatos,
                dcbRecepcionFechaFax, edUsuarioRevision, edFechaRevision], True);
  LockControls([edAltaContrato, edAprobacionSrt, edEnvioContratoCliente, edTotalDias], True);

  LockContactoFirmante(True);
  LockControls([edRevisionPep, edRevisionPepComentario, edExposicion]);

  lbWorldSys.Caption := '';

  fraEmpresaFirmante.Locked := True;
end;

procedure TfrmModificacionContrato.cmbEM_NOMBREDropDown(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT aem.em_nombre, afo.fo_formulario, aco.co_contrato, aco.co_vigenciadesde,' +
          ' NVL(aco.co_fechabaja, aco.co_vigenciahasta) AS vigenciahasta, est.tb_descripcion AS estado,' +
          ' baj.tb_descripcion, em_id, aco.co_fechabaja, afiliacion.check_cobertura(aco.co_contrato) esbaja' +
     ' FROM aco_contrato aco, ctb_tablas est, afo_formulario afo, ctb_tablas baj, aem_empresa aem' +
    ' WHERE co_idempresa = em_id' +
      ' AND co_idformulario = fo_id' +
      ' AND co_estado = est.tb_codigo' +
      ' AND est.tb_clave = ''AFEST''' +
      ' AND baj.tb_codigo(+) = co_motivobaja' +
      ' AND baj.tb_clave(+) = ''MOTIB''';

  if (edEM_CUIT.Text <> '') and (edEM_CUIT.Text <> '0') then
    sSql := sSql + ' AND em_cuit = ' + SQLString(edEM_CUIT.Text, True)
  else // Introdujo el cuit...
    sSql := sSql + ' AND em_nombre LIKE (' + SQLString(cmbEM_NOMBRE.Text + SQL_WILLCARD, True) + ')';

  OpenQuery(sdqNombresEmpresas, sSql, True);
end;

procedure TfrmModificacionContrato.cmbEM_NOMBRECloseUp(Sender: TObject);
begin
  cmbEM_NOMBRE.Text := Trim(cmbEM_NOMBRE.Text);
  if (cmbEM_NOMBRE.Text <> '') then
    DoCargarDatos(ART_EMPTY_ID, cmbEM_NOMBRE.Columns[2].Field.AsInteger, fsModificar);
end;

procedure TfrmModificacionContrato.edEM_CUITExit(Sender: TObject);
var
  Contrato: TTableId;
begin
  edEM_CUIT.Text := Trim(edEM_CUIT.Text);
  if (edEM_CUIT.Text <> '') and (edEM_CUIT.Text <> '0') and (FCUIT <> Trim(edEM_CUIT.Text)) then
  begin
    Verificar(not IsCuit(edEM_CUIT.Text), edEM_CUIT, 'La C.U.I.T. ingresada no es válida.');
    Contrato := ValorSqlIntegerEx('SELECT art.afiliacion.get_contratovigente(:cuit, art.actualdate) FROM DUAL', [edEM_CUIT.Text]);
    DoCargarDatos(ART_EMPTY_ID, Contrato, FFuncion);
    fraEN_MOTIVO_AltaOnChange(nil);
  end;
end;

procedure TfrmModificacionContrato.edCantTrabDe12a16Exit(Sender: TObject);
begin
  CalcularCostosPCP;
end;

procedure TfrmModificacionContrato.edCantTrabMasDe16Exit(Sender: TObject);
begin
  CalcularCostosPCP;
end;

procedure TfrmModificacionContrato.edCantTrabMenosDe12Exit(Sender: TObject);
begin
  CalcularCostosPCP;
end;

procedure TfrmModificacionContrato.edCO_CONTRATOExit(Sender: TObject);
begin
  if (edCO_CONTRATO.Text <> '') and (edCO_CONTRATO.Value <> FContrato) then
    if ExisteSqlEx('SELECT co_contrato FROM aco_contrato WHERE co_contrato = :contrato', [edCO_CONTRATO.Value]) then
    begin
      DoCargarDatos(ART_EMPTY_ID, edCO_CONTRATO.Value, FFuncion);
      fraEN_MOTIVO_AltaOnChange(nil);  //esto es porque me dijo ggrossi que no se estaban limpiando los 3 checks de endoso al cambiar el contrato
      fraEmpresaFirmante.Contrato := edCO_CONTRATO.Value;     //para que no se confundan
      fraEmpresaFirmante.cmbRSocial.Font.Color := clBlack;    //cuando esta en rojo
      fraEmpresaFirmante.mskCUIT.Font.Color := clBlack;       //dijo evila.
      fraEmpresaFirmante.edContrato.Font.Color := clBlack;
      fraEmpresaFirmante.ShowBajas := True;
      fraEmpresaFirmante.Locked := True;
    end
  else
    InfoHint(edCO_CONTRATO, 'El número de contrato ingresado no es válido.');
end;

procedure TfrmModificacionContrato.edFO_FORMULARIOExit(Sender: TObject);
var
  NroContrato: TTableId;
  sSql: String;
begin
  edFO_FORMULARIO.Text := Trim(edFO_FORMULARIO.Text);
  if (edFO_FORMULARIO.Text <> '') and (FO_FORMULARIO <> Trim(edFO_FORMULARIO.Text)) then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM aco_contrato, afo_formulario' +
      ' WHERE co_idformulario = fo_id' +
        ' AND co_contrato = :contrato' +
        ' AND fo_formulario = :formulario';

    // Esto permite mantener el contrato elegido sin que salte a otro en el caso de una
    // reafiliacion que mantiene el mismo nro de formulario
    if not ExisteSqlEx(sSql, [edCO_CONTRATO.Value, edFO_FORMULARIO.Text]) then
    begin
      sSql :=
        'SELECT co_contrato' +
         ' FROM aco_contrato, afo_formulario' +
        ' WHERE co_idformulario = fo_id' +
          ' AND fo_formulario = :formulario';
      NroContrato := ValorSqlIntegerEx(sSql, [edFO_FORMULARIO.Text]);
      if NroContrato <> ART_EMPTY_ID then
      begin
        if NroContrato <> FContrato then
          DoCargarDatos(ART_EMPTY_ID, NroContrato, fFuncion);
      end
      else
        InfoHint(edFO_FORMULARIO, 'El Nº de Formulario ingresado no es válido.');
    end;
  end;
end;

procedure TfrmModificacionContrato.tbLimpiarClick(Sender: TObject);
begin
  PgContrato.ActivePageIndex := 0;
  cmbEM_NOMBRE.Clear;
  edEM_CUIT.Clear;
  edCO_CONTRATO.Clear;
  fraCO_ESTADO.Clear;
  ActualizarColorEstado;
  cmbCO_FECHAIMPRESION.Clear;
  cmbCO_RECEPCONTRATO.Clear;
  edFO_FORMULARIO.Clear;
 // fraRegimen.Clear;
  cmbCO_VIGENCIADESDE.Clear;
  cmbCO_VIGENCIAHASTA.Clear;
  fraCO_ORIGEN.Clear;
  edCO_FECHARECEPCION.Clear;
  edEM_FEINICACTIV.Clear;
  edCO_FECHAAFILIACION.Clear;
  fraEM_FORMAJ.Clear;
  fraEM_SECTOR.Clear;
  fraEM_IDGRUPOECONOMICO.Clear;
  fraEM_SUSS.Clear;
  fraCO_IDESTUDIOCONTABLE.Clear;
  fraCO_IDEJECUTIVO.Clear;
  fraCO_IDGESTOR.Clear;
  fraCO_MOTIVOALTA.Clear;
  fraAR_NOMBRE.Clear;
  cmbCO_FECHABAJA.Clear;
  fraCO_MOTIVOBAJA.Clear;
  fraCO_IDARTFUTURA.Clear;
  fraCIIU.Clear;
  fraCIIU2.Clear;
  fraCIIU3.Clear;
  edNIVEL.Clear;
  edTOTEMPLEADOS.Clear;
  edMASATOTAL.Clear;
  edCO_OBSERVACIONES.Clear;
  edCO_DIASFRANQUICIA.Clear;
  cmbCO_VIGENCIAFRANQUICIA.Clear;
  fraCO_CLAUSULAESPECIAL.Clear;
  cmbCO_VIGENCIACLAUSULA.Clear;
  cbCO_ADDENDA.Checked := False;
  cbCO_ADDENDA_DDJJ.Checked := False;
  cbCO_ADDENDAESPECIAL.Checked := False;
  edComentariosAddenda.Text := '';
  checkPagoDirecto.Checked := False;

  fraDOMICILIO_LEGAL.Clear;
  fraTelefonoLegal.Clear;
  edDC_CODAREAFAX.Clear;
  edDC_FAX.Clear;
  edDC_MAIL.Clear;
  edDC_OBSERVACIONESLegal.Clear;

  fraDOMICILIO_POSTAL.Clear;
  fraTelefonoPostal.Clear;
  edDC_CODAREAFAX_POST.Clear;
  edDC_FAX_POST.Clear;
  edDC_MAIL_POST.Clear;
  edDC_OBSERVACIONESPostal.Clear;
  edNumeroFormRectificacionDatos.Clear;
  edNumeroFormRectificacionDatosActual.Clear;
  edDetalleRectificacionDatos.Clear;

  edEN_ENDOSO.Clear;
  cmbEN_VIGENCIAENDOSO.Clear;
  cmbEN_VIGENCIAENDOSO_Alta.Clear;
  edEN_MOVIMIENTO.Clear;
  edEN_USUALTA.Clear;
  cmbEN_FECHAALTA.Clear;
  cmbEN_FECHAIMPRESION.Clear;
  cmbEN_FENVIOSTR.Clear;
  cmbEN_FRECEPCIONSTR.Clear;
  edEN_TIPOENVIOSTR.Clear;
  edEN_CODRECHAZOSTR.Clear;
  edEN_CODOBSERVACIONSTR.Clear;
  fraEN_MOTIVO.Clear;
  fraEN_MOTIVO_Alta.Clear;
  fraEN_MOTIVO_AltaOnChange(nil);
  cbEN_ENVIOSRT_C.Checked := False;
  ModificarAparienciaDesmarcarEnvioSRT;
  cbEN_ENVIOCARTA_C.Checked := False;
  cbEN_NOTASRT_C.Checked := False;

  edFechaImpresion.Clear;
  rgRecepcionOk.ItemIndex := -1;
  edFechaRecepcion.Clear;
  edCodigoRecepcion.Clear;
  edFechaRecepcionContratoFirmado2.Clear;
  edFechaRecepcionAnexoFirmado.Clear;

  edtbDesc.Clear;
  edtbMov.Clear;
  edtbEndoso.Clear;
  edtbVigencia.Clear;
  ListaEndosos.Clear;
  tbPrimero.Enabled   := False;
  tbAnterior.Enabled  := False;
  tbSiguiente.Enabled := False;
  tbUltimo.Enabled    := False;

  EstadoForm         := efSinContrato;
  FContrato          := ART_EMPTY_ID;
  FIdFormulario      := ART_EMPTY_ID;
  FIdEndoso          := ART_EMPTY_ID;
  FIdEmpresa         := ART_EMPTY_ID;
  FCUIT              := '';
  FIdDomicilioLegal  := '';
  FIdDomicilioPostal := '';

  ClearDatosFormRecepcion;

  ClearPep;
  sdqDatosContacto.Close;
  fraContacto.Clear;
  fraCaracter.Clear;
  fraTipoDocumento.Clear;
  edNumeroDocumento.Clear;
  edComentarios.Clear;
  fraTipoFirmante.Clear;
  cboxSexo.ItemIndex := -1;
  ClearPep;
  edRevisionPep.Clear;
  edExposicion.Clear;
  edExp.Clear;
  edExpNum.Clear;
  FPeriodo := '';
  FCuota   := 0;
  edRevisionPepComentario.Clear;
  ClearDocumentacion;
  fraEmpresaFirmante.Clear;
  lbRE.Visible := False;

  LockContactoFirmante(True);
  SwitchToolBtnFirmante(True);
end;

procedure TfrmModificacionContrato.tbGuardarClick(Sender: TObject);
var
  I: Integer;
  ResultadoOk: Boolean;
begin
  if EstadoForm = efEndososMultiples then
  begin
    ResultadoOk := True;
    for I := Low(FIdsContratos) to High(FIdsContratos) do
      ResultadoOk := ResultadoOk and GuardarContratoEndosos(FIdsContratos[I], FIdsEmpresas[I]);
    if ResultadoOk then
      MessageDlg('La operación se realizó con éxito.', mtInformation, [mbOK], 0);
  end
  else
  begin
    Verificar(not HuboCambio, nil, 'No hay cambios realizados que deban ser guardados.');

    Validar;
    if EstadoForm = efModificaEndoso then
    begin
      GuardarEndoso;
      DoCargarDatos(FIdEndoso, FContrato, fsModificar);
    end
    else
    begin
      GuardarContrato(FContrato);
      DoCargarDatos(ART_EMPTY_ID, FContrato, fsModificar);
    end;
  end;
end;

procedure TfrmModificacionContrato.GuardarDatosDocumentacion(const aIdEndoso: Integer);
var
  aCheck: TCheckBox;
  aSql: TSQL;
  iIdFormulario: Integer;
  iLoop: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT hc_idformulario' +
     ' FROM ahc_historicocontrato, aen_endoso' +
    ' WHERE hc_id = en_idhistoricocontrato' +
      ' AND en_id = :idendoso';
  iIdFormulario := ValorSqlIntegerEx(sSql, [aIdEndoso]);

  for iLoop := 0 to ComponentCount - 1 do
  begin
    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 7) = '_check_') then
    begin
      aSql := TSQL.Create('ado_documentacion');
      try
        aSql.SqlType := stInsert;
        aSql.PrimaryKey.Add('do_id', 0);
        aSql.Fields.Add('do_fechaalta',      SQL_DATETIME, False);
        aSql.Fields.Add('do_iddocumentoafi', Components[iLoop].Tag);
        aSql.Fields.Add('do_idendoso',       aIdEndoso);
        aSql.Fields.Add('do_idformulario',   iIdFormulario);
        aSql.Fields.Add('do_usualta',        Sesion.UserID);

        aCheck := TCheckBox(Components[iLoop]);
        aSql.Fields.Add('do_presente', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_firmatitular', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('check_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_firmavendedor', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('check_faltante_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_faltante', String(IIF(aCheck.Checked, 'S', 'N')));

        EjecutarSqlST(aSql.Sql);
      finally
        aSql.Free;
      end;
    end;
  end;
end;

procedure TfrmModificacionContrato.GuardarEndoso;
var
  IdAHC: TTableId;
  IdAHD_L: TTableId;
  IdAHD_P: TTableId;
  IdAHM: TTableId;
  IDLegal: String;
  IDPostal: String;
  Results: TStringList;
  sSql: String;
  sSqlContrato: TSQL;
  sSqlDomicilioLegal: TSQL;
  sSqlDomicilioPostal: TSQL;
  sSqlEmpresa: TSQL;

  procedure GuardarDatosPrincipales(EsUltimoEndoso: Boolean);
  var
    IdAHC_UltEndoso: TTableId;
    IdAHD_L_UltEndoso: TTableId;
    IdAHD_P_UltEndoso: TTableId;
    IdAHM_UltEndoso: TTableId;
  begin
    sSql :=
      'SELECT en_idhistoricocontrato, en_idhistoricoempresa, en_idhistoricodomicilio, en_idhistoricodomiciliopostal' +
       ' FROM aen_endoso' +
      ' WHERE en_contrato = ' + SqlValue(FContrato) +
        ' AND en_endoso = afiliacion.get_ultnroendoso(en_contrato)' +
        ' AND en_movimiento = afiliacion.get_ultnromovimiento(en_contrato)';
    Results := ValoresColSQL(sSql);   // id's de los histórico para el último endoso/movimiento del contrato
    try
      IdAHC_UltEndoso   := StrToInt(Results[0]);
      IdAHM_UltEndoso   := StrToInt(Results[1]);
      IdAHD_L_UltEndoso := StrToInt(Results[2]);
      IdAHD_P_UltEndoso := StrToInt(Results[3]);
    finally
      Results.Free;
    end;

    sSqlContrato        := TSQL.Create('');
    sSqlEmpresa         := TSQL.Create('');
    sSqlDomicilioLegal  := TSQL.Create('');
    sSqlDomicilioPostal := TSQL.Create('');

    try
      sSqlContrato.TableName        := 'aco_contrato';
      sSqlEmpresa.TableName         := 'aem_empresa';
      sSqlDomicilioLegal.TableName  := 'adc_domiciliocontrato';
      sSqlDomicilioPostal.TableName := 'adc_domiciliocontrato';

      // CONTRATO
      if HuboCambioACO and (IdAHC_UltEndoso = IdAHC) then
      begin  // hubo cambios y el id del histórico del último endoso es igual al id del histórico del endoso actual que se está modificando
        CargarSql(sSqlContrato, 'ACO');
        sSqlContrato.PrimaryKey.Add('co_contrato', FContrato, False);
        sSqlContrato.SqlType := stUpdate;
        EjecutarSQLST(sSqlContrato.Sql);

        // Obtengo el ID del Historico que se acaba de generar
        if EsUltimoEndoso then
          IdAHC := ValorSqlEx('SELECT afiliacion.get_ultidcontrato(:contrato) FROM DUAL', [FContrato]);
      end;

      // EMPRESA
      if HuboCambioAEM and (IdAHM_UltEndoso = IdAHM) then
      begin  // hubo cambios y el id del histórico del último endoso es igual al id del histórico del endoso actual que se está modificando
        CargarSql(sSqlEmpresa, 'AEM');
        sSqlEmpresa.PrimaryKey.Add('em_id', FIdEmpresa, False);
        sSqlEmpresa.SqlType := stUpdate;
        EjecutarSQLST(sSqlEmpresa.Sql);

        // Obtengo el ID del Historico que se acaba de generar
        if EsUltimoEndoso then
          IdAHM := ValorSqlEx('SELECT afiliacion.get_ultidempresa(:contrato) FROM DUAL', [FContrato]);
      end;

      // DOMICILIO (LEGAL)
      if (
           (HuboCambioADC_LEGAL) or
           (fraEN_MOTIVO_Alta.Codigo = '01.2') or
           (fraEN_MOTIVO_Alta.Codigo = '13.1') or
           (fraEN_MOTIVO_Alta.Codigo = '13.4') or
           (fraEN_MOTIVO_Alta.Codigo = '323')
          ) and (IdAHD_L_UltEndoso = IdAHD_L) then
      begin  // hubo cambios y el id del histórico del último endoso es igual al id del histórico del endoso actual que se está modificando
        CargarSql(sSqlDomicilioLegal, 'ADC_LEGAL');
        IDLegal := ValorSqlEx('SELECT dc_id FROM adc_domiciliocontrato WHERE dc_contrato = :contrato AND dc_tipo = ''L''', [FContrato]);
        sSqlDomicilioLegal.PrimaryKey.Add('dc_id', IDLegal, False);
        sSqlDomicilioLegal.SqlType := stUpdate;
        EjecutarSQLST(sSqlDomicilioLegal.Sql);
        fraTelefonoLegal.CopiarTempATelefonos(StrToInt(IDLegal));

        // Obtengo el ID del Historico que se acaba de generar
        if EsUltimoEndoso then
          IdAHD_L := ValorSqlEx('SELECT afiliacion.get_ultiddomicilio(:contrato, ''L'') FROM DUAL', [FContrato]);
      end;

      // DOMICILIO (POSTAL)
      if  (
            (HuboCambioADC_POSTAL) or
            (fraEN_MOTIVO_Alta.Codigo = '01.2') or
            (fraEN_MOTIVO_Alta.Codigo = '13.1') or
            (fraEN_MOTIVO_Alta.Codigo = '13.4') or
            (fraEN_MOTIVO_Alta.Codigo = '323')
          )
          and (IdAHD_P_UltEndoso = IdAHD_P) then
      begin  // hubo cambios y el id del histórico del último endoso es igual al id del histórico del endoso actual que se está modificando
        CargarSql(sSqlDomicilioPostal, 'ADC_POSTAL');
        IDPostal := ValorSqlEx('SELECT dc_id FROM adc_domiciliocontrato WHERE dc_contrato = :contrato AND dc_tipo = ''P''', [FContrato]);
        sSqlDomicilioPostal.PrimaryKey.Add('dc_id', IDPostal, False);
        sSqlDomicilioPostal.SqlType := stUpdate;
        EjecutarSQLST(sSqlDomicilioPostal.Sql);

        fraTelefonoPostal.CopiarTempATelefonos(StrToInt(IDPostal));

        // Obtengo el ID del Historico que se acaba de generar
        if EsUltimoEndoso then
          IdAHD_P := ValorSqlEx('SELECT afiliacion.get_ultiddomicilio(:contrato, ''P'') FROM DUAL', [FContrato]);
      end;
    finally
      sSqlContrato.Free;
      sSqlEmpresa.Free;
      sSqlDomicilioLegal.Free;
      sSqlDomicilioPostal.Free;
    end;
  end;
begin
  {
  Si estoy en el ultimo endoso :
   - actualizar la tabla actual (ACO, AEM, ADC)
   - Actualizar la AEN para que apunté al historico que se acaba de generar
   - ¿Delete del historico que no se usa más?
  Si estoy en un endoso anterior
   - Update del historico correspondiente al cambio hecho (AHC, AHM, AHD)
   - Si el id del histórico del endoso que se está modificando es igual al id del histórico del último endoso se
      actualiza la tabla principal correspondiente correspondiente (ACO, AEM, ADC)
  }

  sSql :=
    'SELECT en_idhistoricocontrato, en_idhistoricoempresa, en_idhistoricodomicilio, en_idhistoricodomiciliopostal' +
     ' FROM aen_endoso' +
    ' WHERE en_id = ' + SqlValue(FIdEndoso);
  Results := ValoresColSQL(sSql);
  try
    IdAHC   := StrToInt(Results[0]);
    IdAHM   := StrToInt(Results[1]);
    IdAHD_L := StrToInt(Results[2]);
    IdAHD_P := StrToInt(Results[3]);
  finally
    Results.Free;
  end;

  BeginTrans;
  try
    if not tbSiguiente.Enabled then // estoy en el último endoso posible
    begin
      GuardarDatosPrincipales(True);

      // Actualizo la AEN con el valor que se cambió
      sSql :=
        'UPDATE aen_endoso' +
          ' SET en_idhistoricocontrato = :contrato,' +
              ' en_idhistoricoempresa = :empresa,' +
              ' en_idhistoricodomicilio = :domicilio,' +
              ' en_idhistoricodomiciliopostal = :domiciliopostal' +
        ' WHERE en_id = :id';
      EjecutarSQLSTEx(sSql, [IdAHC, IdAHM, IdAHD_L, IdAHD_P, FIdEndoso]);

      if MotivoAltaEndosoParaRectificacionDomicilioOk then
      begin
        if edNumeroFormRectificacionDatos.IsEmpty then
        begin
          sSql :=
            'UPDATE afi.afe_formulariosestablecimiento' +
              ' SET fe_estado = ''R''' +
            ' WHERE fe_contrato = :contrato' +
              ' AND fe_estado = ''P''';
          EjecutarSqlSTEx(sSql, [edCO_CONTRATO.Value]);
        end;

        if edNumeroFormRectificacionDatos.Value <> edNumeroFormRectificacionDatosActual.Value then
        begin
          // Actualizo la relación del contrato con la tabla del formulario de rectificación de datos..
          sSql :=
            'UPDATE afi.afe_formulariosestablecimiento' +
              ' SET fe_idendosomovimiento = :idendosomovimiento' +
            ' WHERE fe_id = :id';
          EjecutarSQLSTEx(sSql, [FIdEndoso, edNumeroFormRectificacionDatos.Value]);

          sSql :=
            'UPDATE afi.afe_formulariosestablecimiento' +
              ' SET fe_validacion = ''OK'',' +
                  ' fe_estado = ''R''' +
            ' WHERE fe_contrato = :contrato';
          EjecutarSQLSTEx(sSql, [edCO_CONTRATO.Value]);
        end;
      end;
    end
    else
    begin
      sSqlContrato        := TSQL.Create('');
      sSqlEmpresa         := TSQL.Create('');
      sSqlDomicilioLegal  := TSQL.Create('');
      sSqlDomicilioPostal := TSQL.Create('');

      try
        sSqlContrato.TableName        := 'ahc_historicocontrato';
        sSqlEmpresa.TableName         := 'ahm_historicoempresa';
        sSqlDomicilioLegal.TableName  := 'ahd_historicodomicilio';
        sSqlDomicilioPostal.TableName := 'ahd_historicodomicilio';

        // CONTRATO
        if HuboCambioACO then
        begin
          CargarSql(sSqlContrato, 'AHC');
          sSqlContrato.PrimaryKey.Add('hc_id', IdAHC, False);
          sSqlContrato.SqlType := stUpdate;
          EjecutarSQLST(sSqlContrato.Sql);
        end;

        // EMPRESA
        if HuboCambioAEM then
        begin
          CargarSql(sSqlEmpresa, 'AHM');
          sSqlEmpresa.PrimaryKey.Add('hm_id', IdAHM, False);
          sSqlEmpresa.SqlType := stUpdate;
          EjecutarSQLST(sSqlEmpresa.Sql);
        end;

        // DOMICILIO (LEGAL)
        if (HuboCambioADC_LEGAL)  then
        begin
          CargarSql(sSqlDomicilioLegal, 'AHD_LEGAL');
          sSqlDomicilioLegal.PrimaryKey.Add('hd_id', IdAHD_L, False);
          sSqlDomicilioLegal.SqlType := stUpdate;
          EjecutarSQLST(sSqlDomicilioLegal.Sql);
        end;

        // DOMICILIO (POSTAL)
        if (HuboCambioADC_POSTAL) then
        begin
          CargarSql(sSqlDomicilioPostal, 'AHD_POSTAL');
          sSqlDomicilioPostal.PrimaryKey.Add('hd_id', IdAHD_P, False);
          sSqlDomicilioPostal.SqlType := stUpdate;
          EjecutarSQLST(sSqlDomicilioPostal.Sql);
        end;
      finally
        sSqlContrato.Free;
        sSqlEmpresa.Free;
        sSqlDomicilioLegal.Free;
        sSqlDomicilioPostal.Free;
      end;
      fraTelefonoLegal.CopiarLegalAPostalNoRepetir;
      fraTelefonoLegal.CopiarAEndoso(FIdEndoso);
      GuardarDatosPrincipales(False);
    end;

    // Si cambio la cantidad de empleados o la masa salarial..
    if (CO_TOTEMPLEADOS <> edTOTEMPLEADOS.Value) or (CO_MASATOTAL <> edMASATOTAL.Value) then
      EjecutarStoreSTEx('art.afiliacion.do_devengarporcambiosolafi(:contrato);', [FContrato]);

    CommitTrans;
    MsgBox('El Endoso/Movimiento se modificó con éxito.');
  except
    on E: Exception do
    begin
      RollBack;
      ErrorMsg(E, 'Error al modificar el endoso.')
    end;
  end;
end;

procedure TfrmModificacionContrato.CargarSql(var Sql: TSQL; TipoSql: String);
var
  Prefijo: String;
begin
  if (TipoSql = 'ACO') or (TipoSql = 'AHC') then
  begin
    Prefijo := Copy(TipoSql, 2, 2); // se queda con los dos ultimos
    Sql.Fields.Add(Prefijo + '_estado',             fraCO_ESTADO.Value);
    Sql.Fields.Add(Prefijo + '_vigenciadesde',      cmbCO_VIGENCIADESDE.Date);
    Sql.Fields.Add(Prefijo + '_vigenciahasta',      cmbCO_VIGENCIAHASTA.Date);
    Sql.Fields.Add(Prefijo + '_fechaimpresion',     cmbCO_FECHAIMPRESION.Date);
    Sql.Fields.Add(Prefijo + '_recepcontrato',      cmbCO_RECEPCONTRATO.Date);
    Sql.Fields.Add(Prefijo + '_origen',             fraCO_ORIGEN.Value);
    Sql.Fields.Add(Prefijo + '_fecharecepcion',     edCO_FECHARECEPCION.Date);
    Sql.Fields.Add(Prefijo + '_fechaafiliacion',    edCO_FECHAAFILIACION.Date);
    Sql.Fields.Add(Prefijo + '_idactividad',        fraCIIU.Value, true);
    Sql.Fields.Add(Prefijo + '_idactividad2',       fraCIIU2.Value, true);
    Sql.Fields.Add(Prefijo + '_idactividad3',       fraCIIU3.Value, true);
    Sql.Fields.Add(Prefijo + '_motivoalta',         fraCO_MOTIVOALTA.Value);
    Sql.Fields.Add(Prefijo + '_fechabaja',          cmbCO_FECHABAJA.Date);
    Sql.Fields.Add(Prefijo + '_motivobaja',         fraCO_MOTIVOBAJA.Value);
    Sql.Fields.Add(Prefijo + '_idartfutura',        fraCO_IDARTFUTURA.Value, True);
    Sql.Fields.Add(Prefijo + '_nivel',              edNIVEL.Text);
    Sql.Fields.Add(Prefijo + '_totempleados',       edTOTEMPLEADOS.Value);
    Sql.Fields.Add(Prefijo + '_masatotal',          edMASATOTAL.Value);
    Sql.Fields.Add(Prefijo + '_observaciones',      edCO_OBSERVACIONES.Text);
    Sql.Fields.Add(Prefijo + '_diasfranquicia',     edCO_DIASFRANQUICIA.Value);
    Sql.Fields.Add(Prefijo + '_vigenciafranquicia', cmbCO_VIGENCIAFRANQUICIA.Date);
    Sql.Fields.Add(Prefijo + '_clausulaespecial',   fraCO_CLAUSULAESPECIAL.Value);
    Sql.Fields.Add(Prefijo + '_vigenciaclausula',   cmbCO_VIGENCIACLAUSULA.Date);
    Sql.Fields.Add(Prefijo + '_addenda',            cbCO_ADDENDA.Checked);
    Sql.Fields.Add(Prefijo + '_addenda_ddjj',       cbCO_ADDENDA_DDJJ.Checked);
    Sql.Fields.Add(Prefijo + '_addendaespecial',    cbCO_ADDENDAESPECIAL.Checked);
    Sql.Fields.Add(Prefijo + '_observaciones_addenda', edComentariosAddenda.Text);
    Sql.Fields.Add(Prefijo + '_pagodirecto',        checkPagoDirecto.Checked);
    Sql.Fields.Add(Prefijo + '_fechamodif',         SQL_ACTUALDATE, False);
    Sql.Fields.Add(Prefijo + '_usumodif',           frmPrincipal.DBLogin.UserId);
    Sql.Fields.Add(Prefijo + '_idestudiocontable',  fraCO_IDESTUDIOCONTABLE.Value);
    Sql.Fields.Add(Prefijo + '_direlectronica',     edCO_DIRELECTRONICA.Text);
    Sql.Fields.Add(Prefijo + '_idorigendatoemail',  fraOrigenDatoEmail.Value, True);
    Sql.Fields.Add(Prefijo + '_sindirelectronica',  Integer(IIF(chkNoTieneEmail.Checked, 1, 0)));
    Sql.Fields.Add(Prefijo + '_paginaweb',          edCO_PAGINAWEB.Text);
   // Sql.Fields.Add(Prefijo + '_idtiporegimen',      fraRegimen.Value);

    if (rgRecepOk.ItemIndex = 0) then   // Si es Sí..
    begin
      Sql.Fields.Add(Prefijo + '_recepcioncontrato', 'S');
      Sql.Fields.Add(Prefijo + '_motivorecepcioncontrato', IntToStr(cbRecepcionSi.ItemIndex));
      Sql.Fields.Add(Prefijo + '_recepcontratofirmado',    edFechaRecepcionContratoFirmado.Date);
      Sql.Fields.Add(Prefijo + '_fecharecepcionanexo',     edFechaRecepcionVentanillaElectronica.Date);
    end
    else if (rgRecepOk.ItemIndex = 1) then   // Si es No..
    begin
      Sql.Fields.Add(Prefijo + '_recepcioncontrato',      'N');
      Sql.Fields.Add(Prefijo + '_motivorecepcioncontrato', fraRecepcionNo.Codigo);
    end
    else
    begin
      {Sql.Fields.Add(Prefijo + '_recepcioncontrato', '');
      Sql.Fields.Add(Prefijo + '_motivorecepcioncontrato', '');}
      if rgRecepcionOk.ItemIndex = -1 then
        Sql.Fields.Add(Prefijo + '_recepcioncontrato', '')
      else
        Sql.Fields.AddString(Prefijo + '_recepcioncontrato', IIF(rgRecepcionOk.ItemIndex = 0, 'S', 'N'));
      Sql.Fields.Add(Prefijo + '_motivorecepcioncontrato', edCodigoRecepcion.Text);
    end;
  end
  else if (TipoSql = 'AEM') or (TipoSql = 'AHM') then
  begin
    Prefijo := Copy(TipoSql, 2,2); //se queda con los dos ultimos

    Sql.Fields.Add(Prefijo + '_nombre',           cmbEM_NOMBRE.Text);
    Sql.Fields.Add(Prefijo + '_cuit',             edEM_CUIT.Text);
    Sql.Fields.Add(Prefijo + '_feinicactiv',      edEM_FEINICACTIV.Date);
    Sql.Fields.Add(Prefijo + '_formaj',           fraEM_FORMAJ.Value);
    Sql.Fields.Add(Prefijo + '_sector',           fraEM_SECTOR.Value);
    Sql.Fields.Add(Prefijo + '_idgrupoeconomico', fraEM_IDGRUPOECONOMICO.Value);
    Sql.Fields.Add(Prefijo + '_suss',             fraEM_SUSS.Value);
    Sql.Fields.Add(Prefijo + '_fechamodif',       SQL_ACTUALDATE, false);
    Sql.Fields.Add(Prefijo + '_usumodif',         frmPrincipal.DBLogin.UserId);
  end
  else if (TipoSql = 'ADC_LEGAL') or (TipoSql = 'AHD_LEGAL') then
  begin
    Prefijo := Copy(TipoSql, 2,2); //se queda con los dos ultimos
    Sql.Fields.Add(Prefijo + '_cpostal',       fraDOMICILIO_LEGAL.CodigoPostal);
    Sql.Fields.Add(Prefijo + '_calle',         fraDOMICILIO_LEGAL.Calle);
    Sql.Fields.Add(Prefijo + '_localidad',     fraDOMICILIO_LEGAL.Localidad);
    Sql.Fields.Add(Prefijo + '_provincia',     ValorSqlIntegerEx('SELECT pv_codigo' +
                                                                  ' FROM cpv_provincias' +
                                                                 ' WHERE pv_descripcion = :descripcion',
                                                                 [fraDOMICILIO_LEGAL.Provincia], 0), False);
    Sql.Fields.Add(Prefijo + '_numero',        fraDOMICILIO_LEGAL.Numero);
    Sql.Fields.Add(Prefijo + '_piso',          fraDOMICILIO_LEGAL.Piso);
    Sql.Fields.Add(Prefijo + '_departamento',  fraDOMICILIO_LEGAL.Departamento);
    Sql.Fields.Add(Prefijo + '_cpostala',      fraDOMICILIO_LEGAL.CPA);
    Sql.Fields.Add(Prefijo + '_codareafax',    edDC_CODAREAFAX.Text);
    Sql.Fields.Add(Prefijo + '_fax',           edDC_FAX.Text);
    Sql.Fields.Add(Prefijo + '_mail',          edDC_MAIL.Text);
    Sql.Fields.Add(Prefijo + '_observaciones', edDC_OBSERVACIONESLegal.Text);
    Sql.Fields.Add(Prefijo + '_fechamodif',    SQL_ACTUALDATE, false);
    Sql.Fields.Add(Prefijo + '_usumodif',      frmPrincipal.DBLogin.UserId);
    Sql.Fields.Add(Prefijo + '_domicilio',     SQL_NULL, False);
  end
  else if (TipoSql = 'ADC_POSTAL') or (TipoSql = 'AHD_POSTAL') then
  begin
    Prefijo := Copy(TipoSql, 2,2); //se queda con los dos ultimos
    if ((HuboCambioADC_LEGAL) and (not IsDomicilioIgual)) or
       (fraEN_MOTIVO_Alta.Codigo = '01.2') or
       (fraEN_MOTIVO_Alta.Codigo = '13.1') or
       (fraEN_MOTIVO_Alta.Codigo = '13.4') or
       (fraEN_MOTIVO_Alta.Codigo = '321') or
       (fraEN_MOTIVO_Alta.Codigo = '323')
        then //Si es diferente y ademas lo cambiaron copiarlo del legal
    begin  //aca pidieron un cambio medio loco
          {De: Pellegrini, Federico
          Enviado el: martes, 04 de febrero de 2014 11:16 a.m.
          Para: Vila, Eduardo
          Asunto: RE: [Sistemas] Solicitud para realizar Ticket N°56806

          Edu, te paso

          Endoso 01.2 (Cambio de Domicilio)
          Traspasa los siguientes datos: Calle, Nro, Piso, Dto. C.Postal, CPA, Localidad, Provincia, Tel., Fax, E-mail, Observaciones. (Todo)

          Endoso 13.1 (Agrega y/o Cambia Teléfono)
          Traspasa los siguientes datos: Tel., Fax, E-mail, Observaciones.

          Endoso 13.4 (Agrega y/o Cambia E-mail corporativo)
          Traspasa los siguientes datos: E-mail, Observaciones.}

          //lo vamos a separar todo asi se entiende que se copia en cada caso.

      if (fraEN_MOTIVO_Alta.Codigo = '01.2') or (fraEN_MOTIVO_Alta.Codigo = '321') or (fraEN_MOTIVO_Alta.Codigo = '323') then
      begin
        Sql.Fields.Add(Prefijo + '_cpostal',       fraDOMICILIO_LEGAL.CodigoPostal);
        Sql.Fields.Add(Prefijo + '_calle',         fraDOMICILIO_LEGAL.Calle);
        Sql.Fields.Add(Prefijo + '_localidad',     fraDOMICILIO_LEGAL.Localidad);
        Sql.Fields.Add(Prefijo + '_provincia',     ValorSqlIntegerEx('SELECT pv_codigo' +
                                                                  ' FROM cpv_provincias' +
                                                                 ' WHERE pv_descripcion = :descripcion',
                                                                 [fraDOMICILIO_LEGAL.Provincia], 0), False);
        Sql.Fields.Add(Prefijo + '_numero',        fraDOMICILIO_LEGAL.Numero);
        Sql.Fields.Add(Prefijo + '_piso',          fraDOMICILIO_LEGAL.Piso);
        Sql.Fields.Add(Prefijo + '_departamento',  fraDOMICILIO_LEGAL.Departamento);
        Sql.Fields.Add(Prefijo + '_cpostala',      fraDOMICILIO_LEGAL.CPA);
        Sql.Fields.Add(Prefijo + '_codareafax',    edDC_CODAREAFAX.Text);
        Sql.Fields.Add(Prefijo + '_fax',           edDC_FAX.Text);
        Sql.Fields.Add(Prefijo + '_mail',          edDC_MAIL.Text);
        Sql.Fields.Add(Prefijo + '_observaciones', edDC_OBSERVACIONESLegal.Text);
      end else
        if (fraEN_MOTIVO_Alta.Codigo = '13.1') then
        begin
          Sql.Fields.Add(Prefijo + '_cpostal',       fraDOMICILIO_POSTAL.CodigoPostal);
          Sql.Fields.Add(Prefijo + '_calle',         fraDOMICILIO_POSTAL.Calle);
          Sql.Fields.Add(Prefijo + '_localidad',     fraDOMICILIO_POSTAL.Localidad);
          Sql.Fields.Add(Prefijo + '_provincia',     ValorSqlIntegerEx('SELECT pv_codigo' +
                                                                  ' FROM cpv_provincias' +
                                                                 ' WHERE pv_descripcion = :descripcion',
                                                                 [fraDOMICILIO_POSTAL.Provincia], 0), False);
          Sql.Fields.Add(Prefijo + '_numero',        fraDOMICILIO_POSTAL.Numero);
          Sql.Fields.Add(Prefijo + '_piso',          fraDOMICILIO_POSTAL.Piso);
          Sql.Fields.Add(Prefijo + '_departamento',  fraDOMICILIO_POSTAL.Departamento);
          Sql.Fields.Add(Prefijo + '_cpostala',      fraDOMICILIO_POSTAL.CPA);
          Sql.Fields.Add(Prefijo + '_codareafax',    edDC_CODAREAFAX.Text);  //legal
          Sql.Fields.Add(Prefijo + '_fax',           edDC_FAX.Text);   //legal
          Sql.Fields.Add(Prefijo + '_mail',          edDC_MAIL.Text);  //legal
          Sql.Fields.Add(Prefijo + '_observaciones', edDC_OBSERVACIONESLegal.Text);  //legal
        end else
        if (fraEN_MOTIVO_Alta.Codigo = '13.4') then
        begin
          Sql.Fields.Add(Prefijo + '_cpostal',       fraDOMICILIO_POSTAL.CodigoPostal);
          Sql.Fields.Add(Prefijo + '_calle',         fraDOMICILIO_POSTAL.Calle);
          Sql.Fields.Add(Prefijo + '_localidad',     fraDOMICILIO_POSTAL.Localidad);
          Sql.Fields.Add(Prefijo + '_provincia',     ValorSqlIntegerEx('SELECT pv_codigo' +
                                                                  ' FROM cpv_provincias' +
                                                                 ' WHERE pv_descripcion = :descripcion',
                                                                 [fraDOMICILIO_POSTAL.Provincia], 0), False);
          Sql.Fields.Add(Prefijo + '_numero',        fraDOMICILIO_POSTAL.Numero);
          Sql.Fields.Add(Prefijo + '_piso',          fraDOMICILIO_POSTAL.Piso);
          Sql.Fields.Add(Prefijo + '_departamento',  fraDOMICILIO_POSTAL.Departamento);
          Sql.Fields.Add(Prefijo + '_cpostala',      fraDOMICILIO_POSTAL.CPA);
          Sql.Fields.Add(Prefijo + '_codareafax',    edDC_CODAREAFAX_POST.Text);
          Sql.Fields.Add(Prefijo + '_fax',           edDC_FAX_POST.Text);
          Sql.Fields.Add(Prefijo + '_mail',          edDC_MAIL.Text); //esta es legal
          Sql.Fields.Add(Prefijo + '_observaciones', edDC_OBSERVACIONESLegal.Text);  //esta es legal
        end else
        begin    //Si no es ninguno de esos 3 dejamos como esta
          Sql.Fields.Add(Prefijo + '_cpostal',       fraDOMICILIO_POSTAL.CodigoPostal);
          Sql.Fields.Add(Prefijo + '_calle',         fraDOMICILIO_POSTAL.Calle);
          Sql.Fields.Add(Prefijo + '_localidad',     fraDOMICILIO_POSTAL.Localidad);
          Sql.Fields.Add(Prefijo + '_provincia',     ValorSqlIntegerEx('SELECT pv_codigo' +
                                                                  ' FROM cpv_provincias' +
                                                                 ' WHERE pv_descripcion = :descripcion',
                                                                 [fraDOMICILIO_POSTAL.Provincia], 0), False);
          Sql.Fields.Add(Prefijo + '_numero',        fraDOMICILIO_POSTAL.Numero);
          Sql.Fields.Add(Prefijo + '_piso',          fraDOMICILIO_POSTAL.Piso);
          Sql.Fields.Add(Prefijo + '_departamento',  fraDOMICILIO_POSTAL.Departamento);
          Sql.Fields.Add(Prefijo + '_cpostala',      fraDOMICILIO_POSTAL.CPA);
          Sql.Fields.Add(Prefijo + '_codareafax',    edDC_CODAREAFAX_POST.Text);
          Sql.Fields.Add(Prefijo + '_fax',           edDC_FAX_POST.Text);
          Sql.Fields.Add(Prefijo + '_mail',          edDC_MAIL_POST.Text); //esta es legal
          Sql.Fields.Add(Prefijo + '_observaciones', edDC_OBSERVACIONESPostal.Text);  //esta es legal
        end;

      Sql.Fields.Add(Prefijo + '_fechamodif',    SQL_ACTUALDATE, false);
      Sql.Fields.Add(Prefijo + '_usumodif',      frmPrincipal.DBLogin.UserId);
      Sql.Fields.Add(Prefijo + '_domicilio',     SQL_NULL, False);
    end
    else
    begin
      Sql.Fields.Add(Prefijo + '_cpostal',       fraDOMICILIO_POSTAL.CodigoPostal);
      Sql.Fields.Add(Prefijo + '_calle',         fraDOMICILIO_POSTAL.Calle);
      Sql.Fields.Add(Prefijo + '_localidad',     fraDOMICILIO_POSTAL.Localidad);
      Sql.Fields.Add(Prefijo + '_provincia',     ValorSqlIntegerEx('SELECT pv_codigo' +
                                                                  ' FROM cpv_provincias' +
                                                                 ' WHERE pv_descripcion = :descripcion',
                                                                 [fraDOMICILIO_POSTAL.Provincia], 0), False);
      Sql.Fields.Add(Prefijo + '_numero',        fraDOMICILIO_POSTAL.Numero);
      Sql.Fields.Add(Prefijo + '_piso',          fraDOMICILIO_POSTAL.Piso);
      Sql.Fields.Add(Prefijo + '_departamento',  fraDOMICILIO_POSTAL.Departamento);
      Sql.Fields.Add(Prefijo + '_cpostala',      fraDOMICILIO_POSTAL.CPA);
      Sql.Fields.Add(Prefijo + '_codareafax',    edDC_CODAREAFAX_POST.Text);
      Sql.Fields.Add(Prefijo + '_fax',           edDC_FAX_POST.Text);
      Sql.Fields.Add(Prefijo + '_mail',          edDC_MAIL_POST.Text);
      Sql.Fields.Add(Prefijo + '_observaciones', edDC_OBSERVACIONESPostal.Text);
      Sql.Fields.Add(Prefijo + '_fechamodif',    SQL_ACTUALDATE, False);
      Sql.Fields.Add(Prefijo + '_usumodif',      frmPrincipal.DBLogin.UserId);
      Sql.Fields.Add(Prefijo + '_domicilio',     SQL_NULL, False);
    end
  end
end;

procedure TfrmModificacionContrato.GuardarContrato(IdContrato: TTableId; const aMostrarMensajeOk: Boolean = True);
var
//  aSqlEstablecimiento: TSql;
  CancelarCarta: Boolean;
//  iActividadId: Integer;
  IDLegal: String;
  IDPostal: String;
//  iEmpresaId: Integer;
  iEndosoId: Integer;
//  iEstablecimientoId: Integer;
//  iEstablecimientoViejoId: Integer;
//  iNumeroEstablecimiento: Integer;
  sBody: String;
  sEstadoAnterior: String;
//  sNombre: String;
  sSql: String;
  sSqlContrato: TSQL;
  sSqlDomicilioLegal: TSQL;
  sSqlDomicilioPostal: TSQL;
  sSqlEmpresa: TSQL;
begin
  CancelarCarta := False;
  sSqlContrato        := TSQL.Create('aco_contrato');
  sSqlEmpresa         := TSQL.Create('aem_empresa');
  sSqlDomicilioLegal  := TSQL.Create('adc_domiciliocontrato');
  sSqlDomicilioPostal := TSQL.Create('adc_domiciliocontrato');
  try
    try
      BeginTrans;

      // CONTRATO
      if HuboCambioACO then
      begin
        CargarSql(sSqlContrato, 'ACO');
        sSqlContrato.PrimaryKey.Add('co_contrato', IdContrato, False);
        sSqlContrato.SqlType := stUpdate;
        EjecutarSQLST(sSqlContrato.Sql);
      end;

      // EMPRESA
      if HuboCambioAEM then
      begin
        CargarSql(sSqlEmpresa, 'AEM');
        sSqlEmpresa.PrimaryKey.Add('em_id', FIdEmpresa, False);
        sSqlEmpresa.SqlType := stUpdate;
        EjecutarSQLST(sSqlEmpresa.Sql);
      end;

      // DOMICILIO (LEGAL)
      if (HuboCambioADC_LEGAL) or
         (fraEN_MOTIVO_Alta.Codigo = '01.2') or
         (fraEN_MOTIVO_Alta.Codigo = '13.1') or
         (fraEN_MOTIVO_Alta.Codigo = '13.4') or
         (fraEN_MOTIVO_Alta.Codigo = '321') or
         (fraEN_MOTIVO_Alta.Codigo = '323') then
      begin
        CargarSql(sSqlDomicilioLegal, 'ADC_LEGAL');
        IDLegal := ValorSqlEx('SELECT dc_id FROM adc_domiciliocontrato  WHERE dc_contrato = :contrato AND dc_tipo = ''L''', [IDContrato]);
        sSqlDomicilioLegal.PrimaryKey.Add('dc_id', IDLegal, False);
        sSqlDomicilioLegal.SqlType := stUpdate;
        EjecutarSQLST(sSqlDomicilioLegal.Sql);

        // Pasa las modificaciones sobre los teléfonos de la tabla temporal a la original..
        fraTelefonoLegal.CopiarTempATelefonos(IdContrato);
      end;

      // DOMICILIO (POSTAL)
      if (HuboCambioADC_POSTAL) or
         (fraEN_MOTIVO_Alta.Codigo = '01.2') or
         (fraEN_MOTIVO_Alta.Codigo = '13.1') or
         (fraEN_MOTIVO_Alta.Codigo = '13.4') or
         (fraEN_MOTIVO_Alta.Codigo = '321') or
         (fraEN_MOTIVO_Alta.Codigo = '323') then
      begin
        CargarSql(sSqlDomicilioPostal, 'ADC_POSTAL');
        IDPostal := ValorSqlEx('SELECT dc_id FROM adc_domiciliocontrato WHERE dc_contrato = :contrato AND dc_tipo = ''P''', [IDContrato]);
        sSqlDomicilioPostal.PrimaryKey.Add('dc_id', IDPostal, False);
        sSqlDomicilioPostal.SqlType := stUpdate;
        EjecutarSQLST(sSqlDomicilioPostal.Sql);

        // Pasa las modificaciones sobre los teléfonos de la tabla temporal a la original..
        if (fraEN_MOTIVO_Alta.Codigo = '01.2') or (fraEN_MOTIVO_Alta.Codigo = '13.1') or (fraEN_MOTIVO_Alta.Codigo = '321') or (fraEN_MOTIVO_Alta.Codigo = '323') then
          fraTelefonoPostal.CopiarLegalAPostalNoRepetir;
        fraTelefonoPostal.CopiarTempATelefonos(IdContrato);

      end;

      sSql :=
        'SELECT   hc_estado' +
           ' FROM aen_endoso, ahc_historicocontrato' +
          ' WHERE en_idhistoricocontrato = hc_id' +
            ' AND en_contrato = :contrato' +
       ' ORDER BY en_endoso DESC, en_movimiento DESC';
      sEstadoAnterior := ValorSqlEx(sSql, [IdContrato]);


      if not cmbEN_VIGENCIAENDOSO_Alta.Visible then
        cmbEN_VIGENCIAENDOSO_Alta.Date := Date;

      iEndosoId := DoEndosoGrabar(IdContrato, cmbEN_VIGENCIAENDOSO_Alta.Date, fraEN_MOTIVO_Alta.edCodigo.Text,
                                  IIF(cbEN_ENVIOSRT.Checked, 'S', 'N'), IIF(cbEN_ENVIOCARTA.Checked, 'S', 'N'), 'S',
                                  frmPrincipal.DBLogin.UserId, False);

      EjecutarStoreSTEx('art.afiliacion.set_contratoactivoanterior(:endoso);', [iEndosoId]);

      if (fraEN_MOTIVO_Alta.Value = '01.2') or (fraEN_MOTIVO_Alta.Value = '13.1') or
         (fraEN_MOTIVO_Alta.Value = '13.4') or (fraEN_MOTIVO_Alta.Value = '320') or
         (fraEN_MOTIVO_Alta.Value = '321') or (fraEN_MOTIVO_Alta.Codigo = '323') then
      begin
        if edNumeroFormRectificacionDatos.IsEmpty then
        begin
          sSql :=
            'UPDATE afi.afe_formulariosestablecimiento' +
              ' SET fe_estado = ''R''' +
            ' WHERE fe_contrato = :contrato' +
              ' AND fe_estado = ''P''';
          EjecutarSqlSTEx(sSql, [IdContrato]);
        end;

        if edNumeroFormRectificacionDatos.Value <> edNumeroFormRectificacionDatosActual.Value then
        begin
          // Actualizo la relación del contrato con la tabla del formulario de rectificación de datos..
          sSql :=
            'UPDATE afi.afe_formulariosestablecimiento' +
              ' SET fe_idendosomovimiento = :idendosomovimiento' +
            ' WHERE fe_id = :id';
          EjecutarSQLSTEx(sSql, [iEndosoId, edNumeroFormRectificacionDatos.Value]);

          sSql :=
            'UPDATE afi.afe_formulariosestablecimiento' +
              ' SET fe_validacion = ''OK'',' +
                  ' fe_estado = ''R''' +
            ' WHERE fe_contrato = :contrato';
          EjecutarSQLSTEx(sSql, [IdContrato]);
        end;
      end;


      if fraCO_ESTADO.Value = '6' then
        EjecutarStoreSTEx('art.trabajador.bajatrabajador_x_bajaempresa(:contrato);', [IdContrato]);


      if fraCO_ESTADO.Value <> '6' then
        if sEstadoAnterior = '6' then
          EjecutarStoreSTEx('art.trabajador.altatrabajador_x_reactivacion(:contrato);', [IdContrato]);

      // Si cambio la cantidad de empleados o la masa salarial..
      if (CO_TOTEMPLEADOS <> edTOTEMPLEADOS.Value) or (CO_MASATOTAL <> edMASATOTAL.Value) then
        EjecutarStoreSTEx('art.afiliacion.do_devengarporcambiosolafi(:contrato);', [FContrato]);


{
***  Comentado por pedido hecho en ticket 9653..  ***

      if fraEN_MOTIVO_Alta.Value = '01.2' then    // Si es un cambio de domicilio..
      begin
        aSqlEstablecimiento := TSQL.Create('');
        aSqlEstablecimiento.TableName := 'AES_ESTABLECIMIENTO';
        try
          iActividadId := fraCIIU.Value;
          iEmpresaId := ValorSqlIntegerEx('SELECT CO_IDEMPRESA FROM AFI.ACO_CONTRATO WHERE CO_CONTRATO = :contrato', [FContrato]);
          iEstablecimientoId := GetSecNextVal('SEQ_AES_ID');
          iEstablecimientoViejoId := -1;
          iNumeroEstablecimiento := ValorSqlEx('SELECT NVL(MAX(ES_NROESTABLECI), 0) + 1 FROM AES_ESTABLECIMIENTO WHERE ES_CONTRATO = :Contrato', [FContrato]);
          sNombre := cmbEM_NOMBRE.Text + ' (LEGAL)';

          aSqlEstablecimiento.SqlType := stInsert;
          aSqlEstablecimiento.PrimaryKey.Add('ES_ID', iEstablecimientoId, False);
          aSqlEstablecimiento.Fields.Add('ES_NROESTABLECI', iNumeroEstablecimiento);
          aSqlEstablecimiento.Fields.Add('ES_CONTRATO',     FContrato);
          aSqlEstablecimiento.Fields.Add('ES_IDUBICACION',  fraDOMICILIO_LEGAL.Ubicacion);
          aSqlEstablecimiento.Fields.Add('ES_NUMERO',       fraDOMICILIO_LEGAL.Numero);
          aSqlEstablecimiento.Fields.Add('ES_PISO',         fraDOMICILIO_LEGAL.Piso);
          aSqlEstablecimiento.Fields.Add('ES_DEPARTAMENTO', fraDOMICILIO_LEGAL.Departamento);
          aSqlEstablecimiento.Fields.Add('ES_CPOSTALA',     fraDOMICILIO_LEGAL.CPA);
          aSqlEstablecimiento.Fields.Add('ES_USUALTA',      Sesion.UserId);
          aSqlEstablecimiento.Fields.Add('ES_FECHAALTA',    DBDateTime);
          aSqlEstablecimiento.Fields.Add('ES_CALLE',        fraDOMICILIO_LEGAL.Calle);
          aSqlEstablecimiento.Fields.Add('ES_LOCALIDAD',    fraDOMICILIO_LEGAL.Localidad);
          aSqlEstablecimiento.Fields.Add('ES_CPOSTAL',      fraDOMICILIO_LEGAL.CodigoPostal);
          aSqlEstablecimiento.Fields.Add('ES_PROVINCIA',    ValorSqlIntegerEx('SELECT PV_CODIGO' +
                                                                               ' FROM CPV_PROVINCIAS' +
                                                                              ' WHERE PV_DESCRIPCION = :provincia',
                                                                                [fraDOMICILIO_LEGAL.Provincia], 0), False);
          aSqlEstablecimiento.Fields.Add('ES_LEGAL',        'T');

          sSql :=
            'SELECT *' +
             ' FROM aes_establecimiento' +
            ' WHERE es_contrato = ' + SqlValue(FContrato) +
              ' AND es_legal = ''T''';
          with GetQuery(sSql) do
          try
            if not IsEmpty then
            begin
              iActividadId := FieldByName('ES_IDACTIVIDAD').AsInteger;
              iEstablecimientoViejoId := FieldByName('ES_ID').AsInteger;
              sNombre := FieldByName('ES_NOMBRE').AsString;

              aSqlEstablecimiento.Fields.Add('ES_NIVEL',             FieldByName('ES_NIVEL').AsString);
              aSqlEstablecimiento.Fields.Add('ES_CODAREATELEFONOS',  FieldByName('ES_CODAREATELEFONOS').AsString);
              aSqlEstablecimiento.Fields.Add('ES_TELEFONOS',         FieldByName('ES_TELEFONOS').AsString);
              aSqlEstablecimiento.Fields.Add('ES_CODAREAFAX',        FieldByName('ES_CODAREAFAX').AsString);
              aSqlEstablecimiento.Fields.Add('ES_FAX',               FieldByName('ES_FAX').AsString);
              aSqlEstablecimiento.Fields.Add('ES_OBSERVACIONES',     FieldByName('ES_OBSERVACIONES').AsString);
              aSqlEstablecimiento.Fields.Add('ES_EMPLEADOS',         FieldByName('ES_EMPLEADOS').AsInteger);
              aSqlEstablecimiento.Fields.AddExtended('ES_MASA',      FieldByName('ES_MASA').AsFloat, ALL_DECIMALS, False);
              aSqlEstablecimiento.Fields.Add('ES_FEINICACTIV',       FieldByName('ES_FEINICACTIV').AsDateTime);
              aSqlEstablecimiento.Fields.Add('ES_FECHAINICEST',      FieldByName('ES_FECHAINICEST').AsDateTime);
              aSqlEstablecimiento.Fields.Add('ES_EVENTUAL',          FieldByName('ES_EVENTUAL').AsString);
              aSqlEstablecimiento.Fields.AddExtended('ES_IMPUESTOS', FieldByName('ES_IMPUESTOS').AsFloat, ALL_DECIMALS, False);
              aSqlEstablecimiento.Fields.Add('ES_REAFILIACION',      FieldByName('ES_REAFILIACION').AsString);

              // Doy de baja el establecimiento anterior..
              sSql :=
                'UPDATE aes_establecimiento' +
                  ' SET es_fechabaja = SYSDATE,' +
                      ' es_fecharecepcionbaja = SYSDATE,' +
                      ' es_usubaja = ' + SqlValue(Sesion.UserId) + ',' +
                      ' es_nombre = ' + SqlValue(GetNombreOriginal(sNombre)) +
                ' WHERE es_contrato = ' + SqlValue(FContrato) +
                  ' AND es_legal = ''T''';
              EjecutarSQLST(sSql);

              // Actualizo (vaya uno a saber que) en hys..
              EjecutarStoreSTEx('hys.do_actualizarestado(:idempresa, :nroestablecimiento);', [iEmpresaId, FieldByName('ES_NROESTABLECI').AsInteger]);
            end;
          finally
            Free;
          end;

          // Inserto el nuevo establecimiento..

          aSqlEstablecimiento.Fields.Add('ES_IDACTIVIDAD', iActividadId);
          aSqlEstablecimiento.Fields.Add('ES_NOMBRE',      sNombre);
          EjecutarSQLST(aSqlEstablecimiento.Sql);

          // Paso los trabajadores al nuevo establecimiento..
          if iEstablecimientoViejoId > -1 then
          begin
            sSql :=
              'UPDATE cre_relacionestablecimiento' +
                ' SET re_idestablecimiento = ' + SqlNumber(iEstablecimientoId, True) + ',' +
                    ' re_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                    ' re_fechamodif = SYSDATE' +
              ' WHERE re_idestablecimiento = :estViejo' +
                ' AND re_idrelacionlaboral IN(SELECT rl_id' +
                                              ' FROM crl_relacionlaboral' +
                                             ' WHERE rl_contrato = :contrato)';
            EjecutarSqlSTEx(sSql, [iEstablecimientoViejoId, FContrato]);
          end;
        finally
          aSqlEstablecimiento.Free;
        end;
      end;
}

      // Después de grabar, si cbEN_ENVIOCARTA is checked, mostrar TfrmAfiGeneracionCartas
      if cbEN_ENVIOCARTA.Checked then
        with TfrmAfiGeneracionCartas.Create(Self) do
        try
          if not Execute(FIdFormulario, iEndosoId, IdContrato, False, False) then
          begin
            CancelarCarta := True;
            Abort;
          end;
        finally
          Free;
        end;

      CommitTrans;

      sSql := 'art.afi.update_telefono_in_adc(:contrato, :tipo);';

      if fraEN_MOTIVO_Alta.Value = '320' then    // Si es un cambio de domicilio postal..
      begin
        sBody :=
          'Se ha generado un nuevo endoso con motivo "Cambio de domicilio postal".' + #13#10 +
          'Los datos de la empresa son:' + #13#10#13#10 +
          'CUIT: ' + PonerGuiones(edEM_CUIT.Text) + #13#10 +
          'Contrato: ' + edCO_CONTRATO.Text + #13#10 +
          'Razón social: ' + cmbEM_NOMBRE.Text + #13#10#13#10 +
          '** Domicilio Nuevo **' + #13#10 +
          'Calle: ' + fraDOMICILIO_POSTAL.Calle + #13#10 +
          'Número: ' + fraDOMICILIO_POSTAL.Numero + #13#10 +
          'Piso: ' + fraDOMICILIO_POSTAL.Piso + #13#10 +
          'Depto.: ' + fraDOMICILIO_POSTAL.Departamento + #13#10 +
          'Código Postal: ' + fraDOMICILIO_POSTAL.CodigoPostal + #13#10 +
          'CPA: ' + fraDOMICILIO_POSTAL.CPA + #13#10 +
          'Localidad: ' + fraDOMICILIO_POSTAL.Localidad + #13#10 +
          'Provincia: ' + fraDOMICILIO_POSTAL.Provincia + #13#10;
        unEnvioMail.EnviarMailDB('gdragani@provart.com.ar',
                                 'Cambio de domicilio postal',
                                 [oAutoFirma, oSinNotaAlPie],
                                 sBody,
                                 nil,
                                 IdContrato);
      end;

      if aMostrarMensajeOk then
        MsgBox('El Endoso/Movimiento se realizó con éxito.');
    except
      on E: Exception do
      begin
        RollBack;
        if not CancelarCarta then
          ErrorMsg(E, 'Error al guardar los datos.')
        else
          MessageDlg('Ha decidido cancelar el endoso.', mtInformation, [mbOK], 0);
      end;
    end;

    // Si cbEN_NOTASRT quedó checked, mostrar form para carga de texto libre
    if cbEN_NOTASRT.Checked then
      with TfrmAltaNotaSRT.Create(Self) do
      try
        Funcion := fNuevo;
        ShowModal;
      finally
        Free;
      end;
  finally
    sSqlContrato.Free;
    sSqlEmpresa.Free;
    sSqlDomicilioLegal.Free;
    sSqlDomicilioPostal.Free;
  end;
end;

function TfrmModificacionContrato.GuardarContratoEndosos(IdContrato, IdEmpresa: TTableId): Boolean;
var
  CambioContrato: Boolean;
  CambioEmpresa: Boolean;
  CambioDomicilioLegal: Boolean;
  CambioDomicilioPostal: Boolean;
  CancelarCarta: Boolean;
  IdDomicilioPostal: String;
  IdDomicilioLegal: String;
  iEndosoId: Integer;
  iSinDirElectronica: Integer;
  Provincia: String;
  sAddenda: String;
  sPagoDirecto: String;
  sSql: String;
  sSqlContrato: TSQL;
  sSqlDomicilioLegal: TSQL;
  sSqlDomicilioPostal: TSQL;
  sSqlEmpresa: TSQL;

  procedure IfCambio(Cond: Boolean; Sql: TSQL; Col: String; Valor: String; var Cambio: Boolean); overload;
  begin
    if Cond then
    begin
      Sql.Fields.Add(Col, Valor);
      Cambio := True;
    end;
  end;

  procedure IfCambio(Cond: Boolean; Sql: TSQL; Col: String; Valor: Integer; var Cambio: Boolean); overload;
  begin
    if Cond then
    begin
      Sql.Fields.Add(Col, Valor);
      Cambio := True;
    end;
  end;

  procedure IfCambio(Cond: Boolean; Sql: TSQL; Col: String; Valor: TDate; var Cambio: Boolean); overload;
  begin
    if Cond then
    begin
      Sql.Fields.Add(Col, Valor);
      Cambio := True;
    end;
  end;
begin
  CancelarCarta := False;
  CambioContrato := False;
  CambioEmpresa := False;
  CambioDomicilioLegal := False;
  CambioDomicilioPostal := False;

  sSqlContrato := TSQL.Create('aco_contrato');
  sSqlEmpresa := TSQL.Create('aem_empresa');
  sSqlDomicilioLegal := TSQL.Create('adc_domiciliocontrato');
  sSqlDomicilioPostal := TSQL.Create('adc_domiciliocontrato');
  try
    // CONTRATO
    IfCambio(not fraCO_ESTADO.IsEmpty, sSqlContrato, 'co_estado', fraCO_ESTADO.Value, CambioContrato);
    IfCambio(not cmbCO_VIGENCIADESDE.IsEmpty, sSqlContrato, 'co_vigenciadesde', cmbCO_VIGENCIADESDE.Date, CambioContrato);
    IfCambio(not cmbCO_VIGENCIAHASTA.IsEmpty, sSqlContrato, 'co_vigenciahasta', cmbCO_VIGENCIAHASTA.Date, CambioContrato);
    IfCambio(not cmbCO_FECHAIMPRESION.IsEmpty, sSqlContrato, 'co_fechaimpresion', cmbCO_FECHAIMPRESION.Date, CambioContrato);
    IfCambio(not cmbCO_RECEPCONTRATO.IsEmpty, sSqlContrato, 'co_recepcontrato', cmbCO_RECEPCONTRATO.Date, CambioContrato);
    IfCambio(not fraCO_ORIGEN.IsEmpty, sSqlContrato, 'co_origen', fraCO_ORIGEN.Value, CambioContrato);
    IfCambio(not edCO_FECHARECEPCION.IsEmpty, sSqlContrato, 'co_fecharecepcion', edCO_FECHARECEPCION.Date, CambioContrato);
    IfCambio(not fraCO_MOTIVOALTA.IsEmpty, sSqlContrato, 'co_motivoalta', fraCO_MOTIVOALTA.Value, CambioContrato);
    IfCambio(not cmbCO_FECHABAJA.IsEmpty, sSqlContrato, 'co_fechabaja', cmbCO_FECHABAJA.Date, CambioContrato);
    IfCambio(not fraCO_MOTIVOBAJA.IsEmpty, sSqlContrato, 'co_motivobaja', fraCO_MOTIVOBAJA.Value, CambioContrato);
    IfCambio(not fraCO_IDARTFUTURA.IsEmpty, sSqlContrato, 'co_idartfutura', fraCO_IDARTFUTURA.Value, CambioContrato);
    IfCambio(edNIVEL.Text <> '', sSqlContrato, 'co_nivel', edNIVEL.Text, CambioContrato);
    IfCambio(edTOTEMPLEADOS.Text <> '', sSqlContrato, 'co_totempleados', edTOTEMPLEADOS.Value, CambioContrato);
    IfCambio(edMASATOTAL.Text <> '', sSqlContrato, 'co_masatotal', edMASATOTAL.Value, CambioContrato);
    IfCambio(edCO_OBSERVACIONES.Text <> '', sSqlContrato, 'co_observaciones', edCO_OBSERVACIONES.Text, CambioContrato);
    IfCambio(edCO_DIASFRANQUICIA.Text <> '', sSqlContrato, 'co_diasfranquicia', edCO_DIASFRANQUICIA.Value, CambioContrato);
    IfCambio(not cmbCO_VIGENCIAFRANQUICIA.IsEmpty, sSqlContrato, 'co_vigenciafranquicia', cmbCO_VIGENCIAFRANQUICIA.Date, CambioContrato);
    IfCambio(not fraCO_CLAUSULAESPECIAL.IsEmpty, sSqlContrato, 'co_clausulaespecial', fraCO_CLAUSULAESPECIAL.Value, CambioContrato);
    IfCambio(not cmbCO_VIGENCIACLAUSULA.IsEmpty, sSqlContrato, 'co_vigenciaclausula', cmbCO_VIGENCIACLAUSULA.Date, CambioContrato);
    IfCambio(not fraCO_IDESTUDIOCONTABLE.IsEmpty, sSqlContrato, 'co_idestudiocontable', fraCO_IDESTUDIOCONTABLE.Value, CambioContrato);
    IfCambio(edCO_DIRELECTRONICA.Text > '', sSqlContrato, 'co_direlectronica', edCO_DIRELECTRONICA.Text, CambioContrato);
    IfCambio(not fraOrigenDatoEmail.IsEmpty, sSqlContrato, 'co_idorigendatoemail', fraOrigenDatoEmail.Value, CambioContrato);

    iSinDirElectronica := IIF(chkNoTieneEmail.Checked, 1, 0);
    IfCambio(CO_SINDIRELECTRONICA <> iSinDirElectronica, sSqlContrato, 'co_sindirelectronica', iSinDirElectronica, CambioContrato);

    IfCambio(edCO_PAGINAWEB.Text > '', sSqlContrato, 'co_paginaweb', edCO_PAGINAWEB.Text, CambioContrato);

    sAddenda := IIF(cbCO_ADDENDA.Checked, 'S', 'N');
    IfCambio(CO_ADDENDA <> sAddenda, sSqlContrato, 'co_addenda', sAddenda, CambioContrato);

    sAddenda := IIF(cbCO_ADDENDA_DDJJ.Checked, 'S', 'N');
    IfCambio(CO_ADDENDA_DDJJ <> sAddenda, sSqlContrato, 'co_addenda_ddjj', sAddenda, CambioContrato);

    sAddenda := IIF(cbCO_ADDENDAESPECIAL.Checked, 'S', 'N');
    ifCambio(CO_ADDENDAESPECIAL <> sAddenda, sSqlContrato, 'co_addendaespecial', sAddenda, CambioContrato);

    IfCambio(CO_OBSERVACIONES_ADDENDA <> '', sSqlContrato, 'co_observaciones_addenda', edComentariosAddenda.Text, CambioContrato);

    sPagoDirecto := IIF(checkPagoDirecto.Checked, 'S', 'N');
    IfCambio(CO_PAGODIRECTO <> sPagoDirecto, sSqlContrato, 'co_pagodirecto', sPagoDirecto, CambioContrato);

    if CambioContrato then
    begin
      sSqlContrato.Fields.Add('co_fechamodif', SQL_ACTUALDATE, false);
      sSqlContrato.Fields.Add('co_usumodif', frmPrincipal.DBLogin.UserId);
      sSqlContrato.PrimaryKey.Add('co_contrato', IdContrato, false);
      sSqlContrato.SqlType := stUpdate;
    end;

    // EMPRESA
    IfCambio(cmbEM_NOMBRE.Text <> '', sSqlEmpresa, 'em_nombre', cmbEM_NOMBRE.Text, CambioEmpresa);
    IfCambio(not edEM_FEINICACTIV.IsEmpty, sSqlEmpresa, 'em_feinicactiv', edEM_FEINICACTIV.Date, CambioEmpresa);
    IfCambio(not fraEM_FORMAJ.IsEmpty, sSqlEmpresa, 'em_formaj', fraEM_FORMAJ.Value, CambioEmpresa);
    IfCambio(not fraEM_SECTOR.IsEmpty, sSqlEmpresa, 'em_sector', fraEM_SECTOR.Value, CambioEmpresa);
    IfCambio(not fraEM_IDGRUPOECONOMICO.IsEmpty, sSqlEmpresa, 'em_idgrupoaconomico', fraEM_IDGRUPOECONOMICO.Value, CambioEmpresa);
    IfCambio(not fraEM_SUSS.IsEmpty, sSqlEmpresa, 'em_suss', fraEM_SUSS.Value, CambioEmpresa);
    if CambioEmpresa then
    begin
      sSqlEmpresa.Fields.Add('em_fechamodif', SQL_ACTUALDATE, false);
      sSqlEmpresa.Fields.Add('em_usumodif',   frmPrincipal.DBLogin.UserId);
      sSqlEmpresa.PrimaryKey.Add('em_id',     IdEmpresa, false);
      sSqlEmpresa.SqlType := stUpdate;
    end;

    // DOMICILIO (LEGAL)
    IfCambio(fraDOMICILIO_LEGAL.CodigoPostal <> '', sSqlDomicilioLegal, 'dc_cpostal', fraDOMICILIO_LEGAL.CodigoPostal, CambioDomicilioLegal);
    IfCambio(fraDOMICILIO_LEGAL.Calle <> '', sSqlDomicilioLegal, 'dc_calle', fraDOMICILIO_LEGAL.Calle, CambioDomicilioLegal);
    IfCambio(fraDOMICILIO_LEGAL.Localidad <> '', sSqlDomicilioLegal, 'dc_localidad', fraDOMICILIO_LEGAL.Localidad, CambioDomicilioLegal);
    Provincia := ValorSqlEx('SELECT pv_codigo' +
                             ' FROM cpv_provincias' +
                            ' WHERE pv_descripcion = :descripcion',
                            [fraDOMICILIO_LEGAL.Provincia], 'NULL');
    IfCambio(fraDOMICILIO_LEGAL.Provincia <> '', sSqlDomicilioLegal, 'dc_provincia', Provincia, CambioDomicilioLegal);

    IfCambio(fraDOMICILIO_LEGAL.Numero <> '', sSqlDomicilioLegal, 'dc_numero', fraDOMICILIO_LEGAL.Numero, CambioDomicilioLegal);
    IfCambio(fraDOMICILIO_LEGAL.Piso <> '', sSqlDomicilioLegal, 'dc_piso', fraDOMICILIO_LEGAL.Piso, CambioDomicilioLegal);
    IfCambio(fraDOMICILIO_LEGAL.Departamento <> '', sSqlDomicilioLegal, 'dc_departamento', fraDOMICILIO_LEGAL.Departamento, CambioDomicilioLegal);
    IfCambio(fraDOMICILIO_LEGAL.CPA <> '', sSqlDomicilioLegal, 'dc_cpostala', fraDOMICILIO_LEGAL.CPA, CambioDomicilioLegal);
    IfCambio(edDC_CODAREAFAX.Text <> '', sSqlDomicilioLegal, 'dc_codareafax', edDC_CODAREAFAX.Text, CambioDomicilioLegal);
    IfCambio(edDC_FAX.Text <> '', sSqlDomicilioLegal, 'dc_fax', edDC_FAX.Text, CambioDomicilioLegal);
    IfCambio(edDC_MAIL.Text <> '', sSqlDomicilioLegal, 'dc_mail', edDC_MAIL.Text, CambioDomicilioLegal);
    IfCambio(edDC_OBSERVACIONESLegal.Text <> '', sSqlDomicilioLegal, 'dc_observaciones', edDC_OBSERVACIONESLegal.Text, CambioDomicilioLegal);
    if CambioDomicilioLegal then
    begin
      sSqlDomicilioLegal.Fields.Add('dc_fechamodif', SQL_ACTUALDATE, false);
      sSqlDomicilioLegal.Fields.Add('dc_usumodif', frmPrincipal.DBLogin.UserId);

      sSql :=
        'SELECT dc_id' +
         ' FROM adc_domiciliocontrato, cpv_provincias, aco_contrato' +
        ' WHERE dc_contrato = co_contrato' +
          ' AND dc_provincia = pv_codigo(+)' +
          ' AND dc_tipo = ''L''' +
          ' AND co_contrato = :contrato';
      IdDomicilioLegal := ValorSqlEx(sSql, [IdContrato]);
      sSqlDomicilioLegal.PrimaryKey.Add('dc_id', IdDomicilioLegal, False);
      sSqlDomicilioLegal.SqlType := stUpdate;
    end;

    // DOMICILIO (POSTAL)
    IfCambio(fraDOMICILIO_POSTAL.CodigoPostal <> '', sSqlDomicilioPostal, 'dc_cpostal', fraDOMICILIO_POSTAL.CodigoPostal, CambioDomicilioPostal);
    IfCambio(fraDOMICILIO_POSTAL.Calle <> '', sSqlDomicilioPostal, 'dc_calle', fraDOMICILIO_POSTAL.Calle, CambioDomicilioPostal);
    IfCambio(fraDOMICILIO_POSTAL.Localidad <> '', sSqlDomicilioPostal, 'dc_localidad', fraDOMICILIO_POSTAL.Localidad, CambioDomicilioPostal);

    Provincia := ValorSqlEx('SELECT pv_codigo' +
                             ' FROM cpv_provincias' +
                            ' WHERE pv_descripcion = :descripcion',
                            [fraDOMICILIO_POSTAL.Provincia], 'NULL');
    IfCambio(fraDOMICILIO_POSTAL.Provincia <> '', sSqlDomicilioPostal, 'dc_provincia', Provincia, CambioDomicilioPostal);
    IfCambio(fraDOMICILIO_POSTAL.Numero <> '', sSqlDomicilioPostal, 'dc_numero', fraDOMICILIO_POSTAL.Numero, CambioDomicilioPostal);
    IfCambio(fraDOMICILIO_POSTAL.Piso <> '', sSqlDomicilioPostal, 'dc_piso', fraDOMICILIO_POSTAL.Piso, CambioDomicilioPostal);
    IfCambio(fraDOMICILIO_POSTAL.Departamento <> '', sSqlDomicilioPostal, 'dc_departamento', fraDOMICILIO_POSTAL.Departamento, CambioDomicilioPostal);
    IfCambio(fraDOMICILIO_POSTAL.CPA <> '', sSqlDomicilioPostal, 'dc_cpostala', fraDOMICILIO_POSTAL.CPA, CambioDomicilioPostal);
    IfCambio(edDC_CODAREAFAX_POST.Text <> '', sSqlDomicilioPostal, 'dc_codareafax', edDC_CODAREAFAX_POST.Text, CambioDomicilioPostal);
    IfCambio(edDC_FAX_POST.Text <> '', sSqlDomicilioPostal, 'dc_fax', edDC_FAX_POST.Text, CambioDomicilioPostal);
    IfCambio(edDC_MAIL_POST.Text <> '', sSqlDomicilioPostal, 'dc_mail', edDC_MAIL_POST.Text, CambioDomicilioPostal);
    IfCambio(edDC_OBSERVACIONESPostal.Text <> '', sSqlDomicilioPostal, 'dc_observaciones', edDC_OBSERVACIONESPostal.Text, CambioDomicilioPostal);
    if CambioDomicilioPostal then
    begin
      sSqlDomicilioPostal.Fields.Add('dc_fechamodif', SQL_ACTUALDATE, false);
      sSqlDomicilioPostal.Fields.Add('dc_usumodif',   frmPrincipal.DBLogin.UserId);

      sSql :=
        'SELECT dc_id' +
         ' FROM adc_domiciliocontrato, cpv_provincias, aco_contrato' +
        ' WHERE dc_contrato = co_contrato' +
          ' AND dc_provincia = pv_codigo(+)' +
          ' AND dc_tipo = ''P''' +
          ' AND co_contrato = :contrato';
      IdDomicilioPostal := ValorSqlEx(sSql, [IdContrato]);
      sSqlDomicilioPostal.PrimaryKey.Add('dc_id', IdDomicilioPostal, False);
      sSqlDomicilioPostal.SqlType := stUpdate;
    end;

    try
      BeginTrans;

      if CambioContrato then
        EjecutarSQLST(sSqlContrato.Sql);

      if CambioEmpresa then
        EjecutarSQLST(sSqlEmpresa.Sql);

      if CambioDomicilioLegal then
        EjecutarSQLST(sSqlDomicilioLegal.Sql);

      if CambioDomicilioPostal then
        EjecutarSQLST(sSqlDomicilioPostal.Sql);

      if not cmbEN_VIGENCIAENDOSO_Alta.Visible then
        cmbEN_VIGENCIAENDOSO_Alta.Date := Date;
      iEndosoId := DoEndosoGrabar(IdContrato, cmbEN_VIGENCIAENDOSO_Alta.Date, fraEN_MOTIVO_Alta.Value,
                                  IIF(cbEN_ENVIOSRT.Checked, 'S', 'N'), 'S', 'S', frmPrincipal.DBLogin.UserId, False);

      // Después de grabar, si cbEN_ENVIOCARTA is checked, mostrar TfrmAfiGeneracionCartas
      if cbEN_ENVIOCARTA.Checked then
        with TfrmAfiGeneracionCartas.Create(Self) do
        try
          if not Execute(FIdFormulario, iEndosoId, IdContrato, False, False) then
          begin
            CancelarCarta := True;
            Abort;
          end;
        finally
          Free;
        end;

      if cbEN_NOTASRT.Checked then
        with TfrmAltaNotaSRT.Create(Self) do
        try
          Funcion := fNuevo;
          ShowModal;
        finally
          Free;
        end;
      Result := True;
      CommitTrans;
    except
      on E: Exception do
      begin
        Result := False;
        RollBack;
        if not CancelarCarta then
          ErrorMsg(E, 'Error al guardar los datos.')
        else
          MessageDlg('Ha decidido cancelar el endoso.', mtInformation, [mbOK], 0);
      end;
    end;
  finally
    sSqlContrato.Free;
    sSqlEmpresa.Free;
    sSqlDomicilioLegal.Free;
    sSqlDomicilioPostal.Free;
  end;
end;

procedure TfrmModificacionContrato.tblSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmModificacionContrato.tblNominaClick(Sender: TObject);
begin
  popupNominas.Popup(Mouse.CursorPos.x, Mouse.CursorPos.y);
end;

procedure TfrmModificacionContrato.tblEstablecimientoClick(Sender: TObject);
begin
  with TfrmContratoEstablecimiento.Create(Self) do
  try
    Visible := False;
    if (FFuncion = fsConsultar) then
      DoCargarDatos(FContrato, fsConsultar)
    else
      DoCargarDatos(FContrato);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.tblSRTClick(Sender: TObject);
begin
  with TfrmContratoSRT.Create(Self) do
  try
    if (FFuncion = fsConsultar) then
      DoCargarDatos(FContrato, cmbEM_NOMBRE.Text, FCUIT, FIdFormulario, fsConsultar)
    else
      DoCargarDatos(FContrato, cmbEM_NOMBRE.Text, FCUIT, FIdFormulario);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.tbVendedorClick(Sender: TObject);
begin
  with TfrmContratoVendedor.Create(Self) do
  try
    DoCargarDatos(FContrato);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.tbContactosClick(Sender: TObject);
begin
  with TfrmContratoContacto.Create(Self) do
  try
    DoCargarDatos(FContrato, FIdEmpresa);
    ShowModal;

    // Vuelve a cargar el contrato
    Self.DoCargarDatos(ART_EMPTY_ID, FContrato, fFuncion);
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.tbTarifaClick(Sender: TObject);
var
  frm: TfrmContratoTarifa;
  oldCursor: TCursor;
begin
  OldCursor     := Screen.Cursor;
  Screen.cursor := crHourGlass;
  frm := TfrmContratoTarifa.Create(Self);
  try
    frm.DoCargarDatos(FContrato);
    if EstadoForm = efConsultaContrato then
      frm.tbNuevo.Enabled := False;
    frm.ShowModal;

    // Vuelve a cargar el contrato
    DoCargarDatos(ART_EMPTY_ID, FContrato, fFuncion);
  finally
    frm.Free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmModificacionContrato.tbEndososClick(Sender: TObject);
begin
  if not assigned (frmContratoConsultaEndoso) then
    frmContratoConsultaEndoso := TfrmContratoConsultaEndoso.Create(frmPrincipal);
  frmContratoConsultaEndoso.CargarDatos(FContrato);
  frmContratoConsultaEndoso.Show;
end;

procedure TfrmModificacionContrato.tbCartasClick(Sender: TObject);
begin
  with TfrmConsultaCarta.Create(Self) do
  try
    DoCargaCartas(FIdFormulario);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.tbGestorCuentaClick(Sender: TObject);
begin
  with TfrmGestorCuenta.Create(Self) do
  try
    if (fFuncion = fsConsultar) then
      DoCargarDatos(FContrato, fsConsultar)
    else
      DoCargarDatos(FContrato);
    ShowModal;

    // Vuelve a cargar el contrato
    Self.DoCargarDatos(ART_EMPTY_ID, FContrato, fFuncion);
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.tbEjecutivoCuentaClick(Sender: TObject);
begin
  with TfrmEjecutivoCuenta.Create(Self) do
  try
    if (fFuncion = fsConsultar) then
      DoCargarDatos(FContrato, fsConsultar)
    else
      DoCargarDatos(FContrato);
    ShowModal;

    // Vuelve a cargar el contrato
    Self.DoCargarDatos(ART_EMPTY_ID, FContrato, fFuncion);
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqNombresEmpresas.Close;
  Action := caFree;
  frmModificacionContrato := nil;
  frmPrincipal.mnuModificacionContrato.Enabled := True;
  inherited;

  // Elimino los teléfonos de la tabla temporal..
  BeginTrans;
  try
    fraTelefonoLegal.QuitarTelefonosTemporales;
    fraTelefonoPostal.QuitarTelefonosTemporales;
    CommitTrans;
  except
    Rollback;
  end;
end;

procedure TfrmModificacionContrato.fraCO_MOTIVOBAJAExit(Sender: TObject);
begin
  fraCO_MOTIVOBAJA.FrameExit(Sender);
  if (CO_ESTADO = '1') and (fraCO_ESTADO.Value = '6') then
  begin
    VCLExtra.LockControl(fraEN_MOTIVO_Alta, False);
    if (fraCO_MOTIVOBAJA.Value = '04') or
       (fraCO_MOTIVOBAJA.Value = '05') or
       (fraCO_MOTIVOBAJA.Value = '07') or
       (fraCO_MOTIVOBAJA.Value = '08') then
    begin
      fraEN_MOTIVO_Alta.Value := fraCO_MOTIVOBAJA.Value;
      fraEN_MOTIVO_AltaOnChange(nil);
      LockControl(fraEN_MOTIVO_Alta, True);
    end
    else
      LockControl(fraEN_MOTIVO_Alta, False);
  end;
end;

procedure TfrmModificacionContrato.fraEN_MOTIVO_AltaOnChange(Sender: TObject);
var
  Cond: String;
  sSql: String;
begin
  if fraEN_MOTIVO_Alta.Value = '11' then
  begin
    fraEN_MOTIVO_Alta.Clear;
    InfoHint(fraEN_MOTIVO_Alta.edCodigo, 'No puede elegir este tipo de endoso, debe utilizar el botón para extender la vigencia.', True);
  end;

  sSql :=
    'SELECT tb_especial2' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''MOTEN''' +
      ' AND tb_codigo = :codigo';
  Cond := ValorSqlEx(sSql, [fraEN_MOTIVO_Alta.Value]);

  if AreIn(fraEN_MOTIVO_Alta.cmbDescripcion.Cells[4, fraEN_MOTIVO_Alta.cmbDescripcion.Row], ['Movimiento', 'Movimientos']) then
    cbEN_ENVIOSRT.Enabled := False
  else
    cbEN_ENVIOSRT.Enabled := True;

  cbEN_ENVIOSRT.Checked   := (Copy(Cond, 1, 1) = 'S');
  cbEN_ENVIOCARTA.Checked := (Copy(Cond, 3, 1) = 'S');
  cbEN_NOTASRT.Checked    := (Copy(Cond, 2, 1) = 'S');

  cmbEN_VIGENCIAENDOSO_Alta.Clear;
  cmbEN_VIGENCIAENDOSO_Alta.Visible := (Copy(Cond, 5, 1) = 'S');
  lbVigencia.Visible                := (Copy(Cond, 5, 1) = 'S');
end;

procedure TfrmModificacionContrato.LocalDatosContrato(Qry: TSDQuery);
begin
  with Qry do
  begin
    EM_NOMBRE                  := FieldByName('hm_nombre').AsString;
    EM_CUIT                    := FieldByName('hm_cuit').AsString;
    CO_CONTRATO                := FieldByName('hc_contrato').AsString;
    CO_ESTADO                  := FieldByName('hc_estado').AsString;
    CO_FECHAIMPRESION          := FieldByName('hc_fechaimpresion').AsDateTime;
    CO_RECEPCONTRATO           := FieldByName('hc_recepcontrato').AsDateTime;
    FO_FORMULARIO              := FieldByName('fo_formulario').AsString;
    CO_VIGENCIADESDE           := FieldByName('hc_vigenciadesde').AsDateTime;
    CO_VIGENCIAHASTA           := FieldByName('hc_vigenciahasta').AsDateTime;
    CO_ORIGEN                  := FieldByName('hc_origen').AsString;
    CO_FECHARECEPCION          := FieldByName('hc_fecharecepcion').AsDateTime;
    EM_FEINICACTIV             := FieldByName('hm_feinicactiv').AsDateTime;
    CO_FECHAAFILIACION         := FieldByName('hc_fechaafiliacion').AsDateTime;
    EM_FORMAJ                  := FieldByName('hm_formaj').AsString;
    EM_SECTOR                  := FieldByName('hm_sector').AsString;
    EM_IDGRUPOECONOMICO        := FieldByName('hm_idgrupoeconomico').AsInteger;
    EM_SUSS                    := FieldByName('hm_suss').AsString;
    CO_IDEJECUTIVO             := FieldByName('hc_idejecutivo').AsInteger;
    CO_IDGESTOR                := FieldByName('hc_idgestor').AsInteger;
    CO_MOTIVOALTA              := FieldByName('hc_motivoalta').AsString;
    CO_IDARTANTERIOR           := FieldByName('hc_idartanterior').AsInteger;
    CO_FECHABAJA               := FieldByName('hc_fechabaja').AsDateTime;
    CO_MOTIVOBAJA              := FieldByName('hc_motivobaja').AsString;
    CO_IDARTFUTURA             := FieldByName('hc_idartfutura').AsInteger;
    CO_IDACTIVIDAD             := FieldByName('hc_idactividad').AsInteger;
    CO_IDACTIVIDAD2            := FieldByName('hc_idactividad2').AsInteger;
    CO_IDACTIVIDAD3            := FieldByName('hc_idactividad3').AsInteger;
    CO_NIVEL                   := FieldByName('hc_nivel').AsString;
    CO_TOTEMPLEADOS            := FieldByName('hc_totempleados').AsInteger;
    CO_MASATOTAL               := FieldByName('hc_masatotal').AsCurrency;
    CO_OBSERVACIONES           := FieldByName('hc_observaciones').AsString;
    CO_DIASFRANQUICIA          := FieldByName('hc_diasfranquicia').AsInteger;
    CO_VIGENCIAFRANQUICIA      := FieldByName('hc_vigenciafranquicia').AsDateTime;
    CO_CLAUSULAESPECIAL        := FieldByName('hc_clausulaespecial').AsString;
    CO_VIGENCIACLAUSULA        := FieldByName('hc_vigenciaclausula').AsDateTime;
    CO_IDEMPRESA               := FieldByName('hc_idempresa').AsString;
    CO_IDESTUDIOCONTABLE       := FieldByName('hc_idestudiocontable').AsInteger;
    CO_DIRELECTRONICA          := FieldByName('hc_direlectronica').AsString;
    CO_PAGINAWEB               := FieldByName('hc_paginaweb').AsString;
    CO_RECEPCIONCONTRATO       := FieldByName('hc_recepcioncontrato').AsString;
    CO_MOTIVORECEPCIONCONTRATO := FieldByName('hc_motivorecepcioncontrato').AsString;
    CO_RECEPCONTRATOFIRMADO    := FieldByName('hc_recepcontratofirmado').AsDateTime;
    CO_FECHARECEPCIONANEXO     := FieldByName('hc_fecharecepcionanexo').AsDateTime;
    CO_IDORIGENDATOEMAIL       := FieldByName('hc_idorigendatoemail').AsInteger;
    CO_SINDIRELECTRONICA       := FieldByName('hc_sindirelectronica').AsInteger;
    CO_ADDENDA                 := Nvl(FieldByName('hc_addenda').AsString, 'N');
    CO_ADDENDA_DDJJ            := Nvl(FieldByName('hc_addenda_ddjj').AsString, 'N');
    CO_ADDENDAESPECIAL         := Nvl(FieldByName('hc_addendaespecial').AsString, 'N');
    CO_OBSERVACIONES_ADDENDA   := FieldByName('hc_observaciones_addenda').AsString;
  end;
end;

procedure TfrmModificacionContrato.LocalDatosDomicilioLegal(Qry: TSDQuery);
begin
  with Qry do
  begin
    DC_CALLE_LEGAL            := FieldByName('hd_calle').AsString;
    DC_LOCALIDAD_LEGAL        := FieldByName('hd_localidad').AsString;
    DC_CPOSTAL_LEGAL          := FieldByName('hd_cpostal').AsString;
    DC_PROVINCIA_LEGAL        := FieldByName('provincia').AsString;
    DC_NUMERO_Legal           := FieldByName('hd_numero').AsString;
    DC_PISO_Legal             := FieldByName('hd_piso').AsString;
    DC_DEPARTAMENTO_Legal     := FieldByName('hd_departamento').AsString;
    DC_CPOSTALA_Legal         := FieldByName('hd_cpostala').AsString;
    DC_CODAREATELEFONOS_Legal := FieldByName('hd_codareatelefonos').AsString;
    DC_TELEFONOS_Legal        := FieldByName('hd_telefonos').AsString;
    DC_CODAREAFAX_Legal       := FieldByName('hd_codareafax').AsString;
    DC_FAX_Legal              := FieldByName('hd_fax').AsString;
    DC_OBSERVACIONES_Legal    := FieldByName('hd_observaciones').AsString;
    DC_ID_Legal               := FieldByName('hd_id').AsString;
  end;
end;

procedure TfrmModificacionContrato.LocalDatosDomicilioPostal(Qry: TSDQuery);
begin
  with Qry do
  begin
    DC_CALLE_POSTAL            := FieldByName('hd_calle').AsString;
    DC_LOCALIDAD_POSTAL        := FieldByName('hd_localidad').AsString;
    DC_CPOSTAL_POSTAL          := FieldByName('hd_cpostal').AsString;
    DC_PROVINCIA_POSTAL        := FieldByName('provincia').AsString;
    DC_NUMERO_Postal           := FieldByName('hd_numero').AsString;
    DC_PISO_Postal             := FieldByName('hd_piso').AsString;
    DC_DEPARTAMENTO_Postal     := FieldByName('hd_departamento').AsString;
    DC_CPOSTALA_Postal         := FieldByName('hd_cpostala').AsString;
    DC_CODAREATELEFONOS_Postal := FieldByName('hd_codareatelefonos').AsString;
    DC_TELEFONOS_Postal        := FieldByName('hd_telefonos').AsString;
    DC_CODAREAFAX_Postal       := FieldByName('hd_codareafax').AsString;
    DC_FAX_Postal              := FieldByName('hd_fax').AsString;
    DC_OBSERVACIONES_Postal    := FieldByName('hd_observaciones').AsString;
    DC_ID_Postal               := FieldByName('hd_id').AsString;
  end;
end;

procedure TfrmModificacionContrato.LocalDatosEndoso(Qry: TSDQuery);
begin
  EN_MOTIVO_Alta         := Qry.FieldByName('en_motivo').AsString;
  EN_VIGENCIAENDOSO_Alta := Qry.FieldByName('en_vigenciaendoso').AsDateTime;
end;

{$IFDEF TRON}
procedure TfrmModificacionContrato.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if Operation = opInsert then
    ApplicatioTron.WriteInfo(Self, AComponent);
end;
{$ENDIF}

procedure TfrmModificacionContrato.btnAceptarCambioCuitClick(Sender: TObject);
var
  sMensajeError: String;

  function IsDatosValidosCambioCuit: Boolean;
  begin
    Verificar(edCuitNuevo.Text = '', edCuitNuevo, 'Debe ingresar la nueva C.U.I.T.');
    Verificar(not IsCuit(edCuitNuevo.Text), edCuitNuevo, 'La C.U.I.T. ingresada no es válida.');

    Result := True;
  end;
begin
  if IsDatosValidosCambioCuit then
  begin
    if MsgBox('La operación puede tardar algunos minutos. ¿ Confirma el cambio de la C.U.I.T. ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      if DoCambiarCuitBaseDatos(edCuitActual.Text, edCuitNuevo.Text, sMensajeError) then
      begin
        MsgBox('Cambio de la C.U.I.T. finalizado exitosamente.', MB_OK + MB_ICONINFORMATION);
        fpDialogCambioCuit.ModalResult := mrOk;
      end
      else
      begin
        if sMensajeError <> '' then
          InvalidMsg(edCuitNuevo, sMensajeError)
      end;
    end;
  end;
end;

procedure TfrmModificacionContrato.tbCambiarCuitClick(Sender: TObject);
begin
  if EstadoForm = efSeleccionContrato then
    MsgBox('Debe cargar previamente un contrato.', MB_OK + MB_ICONINFORMATION)
  else
  begin
    fraEN_MOTIVO_Alta.Value := '119';  // CUIT provisoria dada de baja por DGI
    Validar;  // por las dudas que haya modificado algún otro dato

    edCuitActual.Text := edEM_CUIT.Text;
    edCuitNuevo.Clear;

    if fpDialogCambioCuit.ShowModal = mrOk then
    begin
      GuardarContrato(FContrato);
      DoCargarDatos(ART_EMPTY_ID,FContrato, fsModificar);
    end;
  end;
end;

procedure TfrmModificacionContrato.CargarListaEndosos(IDContrato, IDEndoso: TTableId);
var
  iloop: Integer;
  NroContratoAnterior: TTableId;
  sdqDatos: TSDQuery;
  sSql: String;
begin
  sdqDatos := TSDQuery.Create(nil);
  FPermisoModificarSRT := False;
  try
    sdqDatos.DataBaseName := 'dbPrincipal';
    try
      sSql :=
        'SELECT   en_id' +
           ' FROM aen_endoso' +
          ' WHERE en_contrato = :contrato' +
       ' ORDER BY en_contrato, en_endoso, en_movimiento';
      OpenQueryEx(sdqDatos, [IDContrato], sSql, True);

      ListaEndosos.Clear;
      while not sdqDatos.Eof do
      begin
        ListaEndosos.Add(sdqDatos.FieldByName('en_id').AsString);
        sdqDatos.Next;
      end;

      // Actualizo el estado de los botones de la barra de navegacion
      // Ubico a la lista en el endoso correspondiente
      for iloop := 0 to ListaEndosos.Count - 1 do
        if StrToIntDef(ListaEndosos.Strings[iloop], ART_EMPTY_ID) = IDEndoso then
        begin
          tbSiguiente.Enabled := (iloop < ListaEndosos.Count - 1);
          tbUltimo.Enabled    := (iloop < ListaEndosos.Count - 1);
          tbAnterior.Enabled  := (iloop > 0);
          tbPrimero.Enabled   := (iloop > 0);

          if iloop = ListaEndosos.Count - 1 then   // esta parado en el ultimo
          begin
            sSql :=
              'SELECT MAX(a1.co_contrato)' +
               ' FROM aco_contrato a1, aco_contrato a2' +
              ' WHERE a1.co_idempresa = a2.co_idempresa' +
                ' AND a1.co_contrato < a2.co_contrato' +
                ' AND a2.co_contrato = :contrato';
            NroContratoAnterior := ValorSqlIntegerEx(sSql, [IDContrato]);
            StatusAfiliacion(NroContratoAnterior);
            if (EstadoForm = efSeleccionContrato) then
            begin
              EstadoForm := efContratofijo;
              if (CO_ESTADO = '2') then
              begin
                MsgBox('Este contrato no puede ser modificado hasta no recibir la confirmación de la SRT.');
                if not Seguridad.Claves.IsActive('PermisoModificarContratoSinSRT') then
                begin
                  EstadoForm := efConsultaContrato;
                  tbLimpiar.Enabled := true;
                end
                else
                  FPermisoModificarSRT := True;
              end;
            end;
          end;
          Break;
        end;

        // Indico la informacion correcta en el resto de los campos
        edtbDesc.Text     := fraEN_MOTIVO.cmbDescripcion.Text;
        edtbEndoso.Text   := edEN_ENDOSO.Text;
        edtbMov.Text      := edEN_MOVIMIENTO.Text;
        edtbVigencia.Date := cmbEN_VIGENCIAENDOSO.Date;

        lbFechaRecepcionAfiliaciones.Visible := (edtbEndoso.Text = '0') and (edtbMov.Text = '0');
        dcbFechaRecepcionAfiliaciones.Visible := lbFechaRecepcionAfiliaciones.Visible;
        dcbRecepcionFechaFax.Visible := lbFechaRecepcionAfiliaciones.Visible;
        lbFechaRecepcionFax.Visible := lbFechaRecepcionAfiliaciones.Visible;
        lbUsuRevision.Visible := lbFechaRecepcionAfiliaciones.Visible;
        lbFechaRevision.Visible := lbFechaRecepcionAfiliaciones.Visible;
        edUsuarioRevision.Visible := lbFechaRecepcionAfiliaciones.Visible;
        edFechaRevision.Visible := lbFechaRecepcionAfiliaciones.Visible;
        GroupBox6.Visible := lbFechaRecepcionAfiliaciones.Visible;
    except
      ListaEndosos.Clear;
    end;
  finally
    sdqDatos.Free;
  end;
end;

procedure TfrmModificacionContrato.tbUltimoClick(Sender: TObject);
begin
  DoCargarDatos(StrToIntDef(ListaEndosos.Strings[ListaEndosos.Count - 1], ART_EMPTY_ID), ART_EMPTY_ID, FFuncion);
end;

procedure TfrmModificacionContrato.tbPrimeroClick(Sender: TObject);
begin
  DoCargarDatos(StrToIntDef(ListaEndosos.Strings[0], ART_EMPTY_ID), ART_EMPTY_ID, FFuncion);
end;

procedure TfrmModificacionContrato.tbSiguienteClick(Sender: TObject);
var
  iLoop: Integer;
begin
  for iLoop := 0 to ListaEndosos.Count - 1 do
    if StrToIntDef(ListaEndosos.Strings[iLoop], ART_EMPTY_ID) = FIdEndoso then
    begin
      DoCargarDatos(StrToIntDef(ListaEndosos.Strings[iLoop + 1], ART_EMPTY_ID), ART_EMPTY_ID, FFuncion);
      Break;
    end;
end;

procedure TfrmModificacionContrato.tbAnteriorClick(Sender: TObject);
var
  iLoop: Integer;
begin
  for iLoop := 0 to ListaEndosos.Count - 1 do
    if StrToIntDef(ListaEndosos.Strings[iLoop], ART_EMPTY_ID) = FIdEndoso then
    begin
      DoCargarDatos(StrToIntDef(ListaEndosos.Strings[iLoop - 1], ART_EMPTY_ID), ART_EMPTY_ID, FFuncion);
      Break;
    end;
end;

procedure TfrmModificacionContrato.tblImprimirClick(Sender: TObject);
begin
  frmImprimeContrato.Free;
  frmImprimeContrato := TfrmImprimeContrato.Create(nil);

  frmImprimeContrato.Clear;
  frmImprimeContrato.Endosos.Add(IdToStr(FIdEndoso));
  frmImprimeContrato.TipoEndosos.Add(FTipoEndoso);
  frmImprimeContrato.Contratos.Add(IdToStr(FContrato));

  frmImprimeContrato.Visible := False;
  frmImprimeContrato.ShowModal;

  // Vuelve a cargar el contrato
  DoCargarDatos(ART_EMPTY_ID, FContrato, fFuncion);
end;

procedure TfrmModificacionContrato.tblLugarTrabajoClick(Sender: TObject);
begin
  frmCargaLugarDeTrabajo.Free;
  try
    frmCargaLugarDeTrabajo := TfrmCargaLugarDeTrabajo.Create(frmPrincipal);
    frmCargaLugarDeTrabajo.DoCargaIDFormulario(FIdFormulario);
  except
    //
  end;
end;

procedure TfrmModificacionContrato.tbCuentasBancariasClick( Sender: TObject);
begin
  if EstadoForm = efSeleccionContrato then
    MsgBox('Para poder dar de alta cuentas bancarias, debe cargar previamente un contrato.', MB_OK + MB_ICONINFORMATION)
  else
    with TfrmManCCP_CUENTAPAGO.Create(Self) do
    try
      Execute('EM', StrToInt(CO_IDEMPRESA), '');
    finally
      Free;
    end;
end;

procedure TfrmModificacionContrato.cmbEM_NOMBREGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                             var Background: TColor; Highlight: Boolean);
begin
  if sdqNombresEmpresas.FieldByName('ESBAJA').AsString <> '1' then
    AFont.Color := unArt.COL_BAJA;
end;

procedure TfrmModificacionContrato.ChequearEstado(Sender: TObject);
var
  EstadoAnt: String;
begin
  if FContrato <> ART_EMPTY_ID then
  begin
    EstadoAnt := ValorSqlEx('SELECT co_estado FROM aco_contrato WHERE co_contrato = :contrato', [FContrato]);
    if (EstadoAnt <> '') and (EstadoAnt <> fraCO_ESTADO.Value) and (fraCO_ESTADO.Value = '2') then
      if not Seguridad.Claves.IsActive('PermisoSuperUsuarioSinValidar') then
      begin
        fraCO_ESTADO.Value := EstadoAnt;
        InfoHint(fraCO_ESTADO.edCodigo, 'No se puede asignar el estado Pendiente Autorización.', True);
      end;
  end;
  ActualizarColorEstado;
end;

procedure TfrmModificacionContrato.CambioClausulaEspecial(Sender: TObject);
begin
  cmbCO_VIGENCIACLAUSULA.Enabled := fraCO_CLAUSULAESPECIAL.IsSelected;
end;

procedure TfrmModificacionContrato.fraCO_CLAUSULAESPECIALExit(Sender: TObject);
begin
  fraCO_CLAUSULAESPECIAL.FrameExit(Sender);
  CambioClausulaEspecial(Sender);
end;

procedure TfrmModificacionContrato.fraCO_ESTADOExit(Sender: TObject);
begin
  fraCO_ESTADO.FrameExit(Sender);
  ChequearEstado(nil);
end;

procedure TfrmModificacionContrato.tbExtensionVigenciaClick(Sender: TObject);
var
  sSqlContrato: TSQL;
  ProximoPeriodo, Fecha: TDateTime;
  Year, Month, Day: Word;
  iContrato: Integer;

  function DateToPeriodo(FechaActual: TDateTime): String;
  begin
    Result := FormatDateTime('yyyymm', FechaActual);
  end;

begin
  Verificar((fraCO_ESTADO.Value <> '1') and ((fraCO_ESTADO.Value <> '13') and (fraCO_MOTIVOBAJA.Value <> '09')), fraCO_ESTADO.edCodigo, 'No se puede renovar la vigencia si la empresa no está activa.');

  // Se fija que el periodo de vigencia hasta actual no sea superior al proximo periodo
  ProximoPeriodo := AddMonths(Date, 1);
  Verificar(DateToPeriodo(cmbCO_VIGENCIAHASTA.Date) > DateToPeriodo(ProximoPeriodo), cmbCO_VIGENCIAHASTA,
            'La vigencia hasta ('+FormatDateTime('mm-yyyy', cmbCO_VIGENCIAHASTA.Date) +'), debe ser menor o igual al periodo actual mas un mes. Proximo periodo válido ' + FormatDateTime('mm-yyyy', AddMonths(cmbCO_VIGENCIAHASTA.Date,-1))+'.');

  if MsgBox('¿ Realmente desea extender la vigencia de este contrato ?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
  begin
    sSqlContrato := TSQL.Create('aco_contrato');
    try
      // Toma como final el ultimo dia del mes un año mas tarde
      DecodeDate(cmbCO_VIGENCIAHASTA.Date, Year, Month, Day);
      if Month = 12 then
      begin
        Year := Year + 2;
        Month := 1;
      end
      else
      begin
        Year := Year + 1;
        Month := Month + 1;
      end;
      Fecha := EncodeDate(Year, Month, 1);
      Fecha := Fecha - 1; // Le resta un dia para estar en el ultimo dia del mes anterior

      // Genera el registro
      sSqlContrato.Clear;
      sSqlContrato.PrimaryKey.Add('co_contrato',  edCO_CONTRATO.Text, False);
      sSqlContrato.Fields.Add('co_vigenciahasta', Fecha);
      sSqlContrato.SqlType := stUpdate;
      BeginTrans;
      try
        EjecutarSQLST(sSqlContrato.Sql);
        iContrato:=StrToInt(edCO_CONTRATO.Text);

        DoEndosoGrabar(iContrato, Date, '11', 'N', 'N', 'S', frmPrincipal.DBLogin.UserId, False);
        Do_Devengado_ActualizarExtVig(frmPrincipal.DBLogin.UserId, iContrato, True, False);

        CommitTrans;
        DoCargarDatos(ART_EMPTY_ID, FContrato, FFuncion);
        MessageDlg('La operación se realizó con exito.', mtInformation, [mbOK], 0);
      except
        on E: Exception do
        begin
          RollBack;
          ErrorMsg(E, 'Error al guardar los datos.');
        end;
      end;
    finally
      sSqlContrato.Free;
    end;
  end;
end;

procedure TfrmModificacionContrato.StatusAfiliacion(Contrato: TTableId);
begin
  if Contrato = ART_EMPTY_ID then
    lblAfiliacion.Caption := ''
  else
    lblAfiliacion.Caption := 'Empresa reafiliada. El contrato anterior es ' + IntToStr(Contrato) + '.';
end;

procedure TfrmModificacionContrato.ActualizarColorEstado;
begin
  if fraCO_ESTADO.Value = '1' then
    fraCO_ESTADO.Font.Color := clBlack
  else
    fraCO_ESTADO.Font.Color := clRed;
end;

procedure TfrmModificacionContrato.edEM_CUITKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SelectNext (edEM_CUIT, True, True);
end;

function TfrmModificacionContrato.HuboCambioACO: boolean;
var
  iSinDirElectronica: Integer;
  sAddenda: String;
  sAddenda_DDJJ: String;
  sPagoDirecto: String;
  sAddendaEspecial : String;
begin
  iSinDirElectronica := IIF(chkNoTieneEmail.Checked, 1, 0);
  sAddenda           := IIF(cbCO_ADDENDA.Checked, 'S', 'N');
  sAddenda_DDJJ      := IIF(cbCO_ADDENDA_DDJJ.Checked, 'S', 'N');
  sPagoDirecto       := IIF(checkPagoDirecto.Checked, 'S', 'N');
  sAddendaEspecial   := IIF(cbCO_ADDENDAESPECIAL.Checked, 'S', 'N');


  Result := (CO_ESTADO <> fraCO_ESTADO.Value) or
            (CO_FECHAIMPRESION <> cmbCO_FECHAIMPRESION.Date) or
            (CO_RECEPCONTRATO <> cmbCO_RECEPCONTRATO.Date) or
            (CO_VIGENCIADESDE <> cmbCO_VIGENCIADESDE.Date) or
            (CO_VIGENCIAHASTA <> cmbCO_VIGENCIAHASTA.Date) or
            (CO_ORIGEN <> fraCO_ORIGEN.Value) or
            (CO_FECHARECEPCION <> edCO_FECHARECEPCION.Date) or
            (CO_FECHAAFILIACION <> edCO_FECHAAFILIACION.Date) or
            (CO_IDESTUDIOCONTABLE <> fraCO_IDESTUDIOCONTABLE.Value) or
            (CO_MOTIVOALTA <> fraCO_MOTIVOALTA.Value) or
            (CO_IDARTANTERIOR <> fraAR_NOMBRE.Value) or
            (CO_FECHABAJA <> cmbCO_FECHABAJA.Date) or
            (CO_MOTIVOBAJA <> fraCO_MOTIVOBAJA.Value) or
            (CO_IDARTFUTURA <> fraCO_IDARTFUTURA.Value) or
            (CO_IDACTIVIDAD <> fraCIIU.Value) or
            (CO_IDACTIVIDAD2 <> fraCIIU2.Value) or
            (CO_IDACTIVIDAD3 <> fraCIIU3.Value) or
            (CO_NIVEL <> edNIVEL.Text) or
            (CO_TOTEMPLEADOS <> edTOTEMPLEADOS.Value) or
            (CO_MASATOTAL <> edMASATOTAL.Value) or
            (CO_OBSERVACIONES <> edCO_OBSERVACIONES.Text) or
            (CO_DIASFRANQUICIA <> edCO_DIASFRANQUICIA.Value) or
            (CO_VIGENCIAFRANQUICIA <> cmbCO_VIGENCIAFRANQUICIA.Date) or
            (CO_CLAUSULAESPECIAL <> fraCO_CLAUSULAESPECIAL.Value) or
            (CO_VIGENCIACLAUSULA <> cmbCO_VIGENCIACLAUSULA.Date) or
            (CO_DIRELECTRONICA <> edCO_DIRELECTRONICA.Text) or
            (CO_IDORIGENDATOEMAIL <> fraOrigenDatoEmail.Value) or
            (CO_SINDIRELECTRONICA <> iSinDirElectronica) or
            (CO_PAGINAWEB <> edCO_PAGINAWEB.Text) or
            (CO_RECEPCIONCONTRATO <> IntToStr(rgRecepOk.ItemIndex)) or
            ((rgRecepOk.ItemIndex = 0) and (CO_MOTIVORECEPCIONCONTRATO <> cbRecepcionSi.Text)) or
            ((rgRecepOk.ItemIndex = 1) and (CO_MOTIVORECEPCIONCONTRATO <> fraRecepcionNo.Codigo)) or
            (CO_RECEPCONTRATOFIRMADO <> edFechaRecepcionContratoFirmado.Date) or
            (CO_FECHARECEPCIONANEXO <> edFechaRecepcionVentanillaElectronica.Date) or
            (CO_ADDENDA <> sAddenda) or
            (CO_ADDENDA_DDJJ <> sAddenda_DDJJ) or
            (CO_ADDENDAESPECIAL <> sAddendaEspecial)or
            (CO_OBSERVACIONES_ADDENDA <> edComentariosAddenda.Text);
end;

function TfrmModificacionContrato.HuboCambioADC_LEGAL: boolean;
begin
  Result := (DC_CALLE_LEGAL <> fraDOMICILIO_LEGAL.Calle) or
            (DC_LOCALIDAD_LEGAL <> fraDOMICILIO_LEGAL.Localidad) or
            (DC_CPOSTAL_LEGAL <> fraDOMICILIO_LEGAL.CodigoPostal) or
            (DC_PROVINCIA_LEGAL <> fraDOMICILIO_LEGAL.Provincia) or
            (DC_NUMERO_Legal <> fraDOMICILIO_LEGAL.Numero) or
            (DC_PISO_Legal <> fraDOMICILIO_LEGAL.Piso) or
            (DC_DEPARTAMENTO_Legal <> fraDOMICILIO_LEGAL.Departamento) or
            (DC_CPOSTALA_Legal <> fraDOMICILIO_LEGAL.CPA) or
            (fraTelefonoLegal.HasChanges) or
            (DC_CODAREAFAX_Legal <> edDC_CODAREAFAX.Text) or
            (DC_FAX_Legal <> edDC_FAX.Text) or
            (DC_MAIL_Legal <> edDC_MAIL.Text) or
            (DC_OBSERVACIONES_Legal <> edDC_OBSERVACIONESLegal.Text) or
            (DC_ID_Legal <> FIdDomicilioLegal);
end;

function TfrmModificacionContrato.HuboCambioADC_POSTAL: boolean;
begin
  Result := (DC_CALLE_POSTAL <> fraDOMICILIO_POSTAL.Calle) or
            (DC_LOCALIDAD_POSTAL <> fraDOMICILIO_POSTAL.Localidad) or
            (DC_CPOSTAL_POSTAL <> fraDOMICILIO_POSTAL.CodigoPostal) or
            (DC_PROVINCIA_POSTAL <> fraDOMICILIO_POSTAL.Provincia) or
            (DC_NUMERO_Postal <> fraDOMICILIO_POSTAL.Numero) or
            (DC_PISO_Postal <> fraDOMICILIO_POSTAL.Piso) or
            (DC_DEPARTAMENTO_Postal <> fraDOMICILIO_POSTAL.Departamento) or
            (DC_CPOSTALA_Postal <> fraDOMICILIO_POSTAL.CPA) or
            (fraTelefonoPostal.HasChanges) or
            (DC_CODAREAFAX_Postal <> edDC_CODAREAFAX_POST.Text) or
            (DC_FAX_Postal <> edDC_FAX_POST.Text) or
            (DC_MAIL_Postal <> edDC_MAIL_POST.Text) or
            (DC_OBSERVACIONES_Postal <> edDC_OBSERVACIONESPostal.Text) or
            (DC_ID_Postal <> FIdDomicilioPostal);
end;

function TfrmModificacionContrato.HuboCambioAEM: boolean;
begin
  Result := (EM_NOMBRE <> cmbEM_NOMBRE.Text) or
            (EM_FEINICACTIV <> edEM_FEINICACTIV.Date) or
            (EM_FORMAJ <> fraEM_FORMAJ.Value) or
            (EM_SECTOR <> fraEM_SECTOR.Value) or
            (EM_IDGRUPOECONOMICO <> fraEM_IDGRUPOECONOMICO.Value) or
            (EM_SUSS <> fraEM_SUSS.Value);
end;

function TfrmModificacionContrato.HuboCambio: boolean;
begin
  Result := HuboCambioACO or HuboCambioAEM or HuboCambioADC_LEGAL or HuboCambioADC_POSTAL;
end;

procedure TfrmModificacionContrato.tbModificarEndosoClick(Sender: TObject);
begin
  Verificar(not Seguridad.Claves.IsActive('PermisoModificarEndoso'), nil, 'No está habilitado para utilizar esta opción.');
  EstadoForm := efModificaEndoso;
  LockControls([fraDOMICILIO_POSTAL, fraTelefonoPostal, edDC_CODAREAFAX_POST, edDC_FAX_POST, edDC_MAIL_POST,
                edDC_OBSERVACIONESPostal ], False);
end;

procedure TfrmModificacionContrato.tbTraspasoIngresoClick(Sender: TObject);
begin
  with TfrmConsultaTraspasoIngreso.Create(Self) do
  try
    DoCargar(FIdFormulario);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.tbGestorAumentoClick(Sender: TObject);
begin
  with TfrmGestorAumento.Create(Self) do
  try
    if (fFuncion = fsConsultar) then
      DoCargarDatos(FContrato, fsConsultar)
    else
      DoCargarDatos(FContrato);
    ShowModal;

    // Vuelve a cargar el contrato
    Self.DoCargarDatos(ART_EMPTY_ID, FContrato, fFuncion);
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.btnAceptarModFecSRTClick(Sender: TObject);
begin
  Verificar(cmbEnvioSRT.IsEmpty and (not cmbRecepcionSRT.IsEmpty), cmbRecepcionSRT, 'Debe seleccionar una fecha de envío si pretende asentar la fecha de recepción.');
  Verificar((not cmbRecepcionSRT.IsEmpty) and (cmbRecepcionSRT.Date < cmbEnvioSRT.Date), cmbRecepcionSRT, 'La fecha de recepción no puede ser anterior a la fecha de envío (' + DateToStr(cmbEnvioSRT.Date) + ').');

  fpModificaFechasSRT.ModalResult := mrOk;
end;

procedure TfrmModificacionContrato.btnAceptarPCPClick(Sender: TObject);
begin
  fpTarifaPCP.ModalResult := MrOk;
end;

procedure TfrmModificacionContrato.tbFechaSRTClick(Sender: TObject);
var
  sSql: String;
begin
  cmbEnvioSRT.Date := cmbEN_FENVIOSTR.Date;
  cmbRecepcionSRT.Date := cmbEN_FRECEPCIONSTR.Date;

  if fpModificaFechasSRT.ShowModal = mrOk then
  begin
    sSql :=
      'UPDATE aen_endoso' +
        ' SET en_fenviosrt = :enviosrt,' +
            ' en_frecepcionsrt = :recepcionsrt' +
      ' WHERE en_id = :id';
    EjecutarSqlEx(sSql, [TDateTimeEx.Create(cmbEnvioSRT.Date), TDateTimeEx.Create(cmbRecepcionSRT.Date), FIdEndoso]);

    if checkLimpiarRechazo.Checked then
    begin
      sSql :=
        'UPDATE aen_endoso' +
          ' SET en_tipoenviosrt = NULL,' +
              ' en_codrechazosrt = NULL,' +
              ' en_codobservacionsrt = NULL' +
        ' WHERE en_id = :id';
      EjecutarSqlEx(sSql, [FIdEndoso]);
    end;

    if edtbEndoso.Text <> '0' then
    begin
      sSql :=
        'UPDATE acc_controlcn' +
          ' SET cc_envio = 1,' +
              ' cc_fechaenvio = :fecha' +
        ' WHERE cc_contrato = :contrato' +
          ' AND cc_endoso = :endoso';
      EjecutarSqlEx(sSql, [TDateTimeEx.Create(cmbEnvioSRT.Date), FContrato, edtbEndoso.Text]);
    end;

    if (cmbEnvioSRT.Date = 0) and (cmbRecepcionSRT.Date = 0) then
    begin
      sSql :=
        'UPDATE acc_controlcn' +
          ' SET cc_envio = 0,' +
              ' cc_fechaenvio = NULL' +
        ' WHERE cc_contrato = :contrato' +
          ' AND cc_endoso = :endoso';
      EjecutarSqlEx(sSql, [FContrato, edtbEndoso.Text]);
    end;

    cmbEN_FENVIOSTR.Date := cmbEnvioSRT.Date;
    cmbEN_FRECEPCIONSTR.Date := cmbRecepcionSRT.Date;
    MsgBox('La operación se realizó con éxito.');
  end;
end;

procedure TfrmModificacionContrato.tbDelegacionClick(Sender: TObject);
begin
  Verificar(Contrato = ART_EMPTY_ID, edCO_CONTRATO, 'Debe seleccionar un contrato.');

  with TfrmContratoDelegacion.Create(Self) do
  begin
    Contrato := Self.Contrato;
    ShowModal;
  end;
end;

procedure TfrmModificacionContrato.tbPreventorClick(Sender: TObject);
begin
  Verificar(Contrato = ART_EMPTY_ID, edCO_CONTRATO, 'Debe seleccionar un contrato.');

  with TfrmContratoPreventor.Create(Self) do
  begin
    Contrato := Self.Contrato;
    ShowModal;
  end;
end;

procedure TfrmModificacionContrato.FormShow(Sender: TObject);
begin
// Uso este evento en vez del create por un posible bug de Delphi al destruir formularios..
  fraTelefonoLegal.Initialize('TO_CONTRATO', True, False, 'TO', 'ATO_TELEFONOCONTRATO', 'L');
  fraTelefonoPostal.Initialize('TO_CONTRATO', True, False, 'TO', 'ATO_TELEFONOCONTRATO', 'P');
end;

procedure TfrmModificacionContrato.CargarCombosTelefonos(const aContrato, aEndosoId: Integer);
var
  bEsUltimoEndoso: Boolean;
  iEndosoTel: Integer;
  sSql: String;
begin
  try
    bEsUltimoEndoso := (StrToIntDef(ListaEndosos.Strings[ListaEndosos.Count - 1], ART_EMPTY_ID) = aEndosoId);
  except
    bEsUltimoEndoso := True;
  end;

  if bEsUltimoEndoso then
  begin
    fraTelefonoLegal.Initialize('TO_CONTRATO', True, False, 'TO', 'ATO_TELEFONOCONTRATO', 'L');
    fraTelefonoLegal.FillCombo(True, aContrato);
    fraTelefonoPostal.Initialize('TO_CONTRATO', True, False, 'TO', 'ATO_TELEFONOCONTRATO', 'P');
    fraTelefonoPostal.FillCombo(True, aContrato);
  end
  else
  begin
    // Legal..
    sSql :=
      'SELECT MAX(en_id)' +
       ' FROM aen_endoso, ahl_historicotelefono' +
      ' WHERE hl_idendoso = en_id' +
        ' AND en_contrato = :contrato' +
        ' AND hl_tipo = ''L''' +
        ' AND en_id <= :id';
    iEndosoTel := ValorSqlIntegerEx(sSql, [aContrato, aEndosoId], -1);
    fraTelefonoLegal.Initialize('HL_IDENDOSO', True, True, 'HL', 'AHL_HISTORICOTELEFONO', 'L');
    fraTelefonoLegal.FillCombo(True, iEndosoTel);

    // Postal..
    sSql :=
      'SELECT MAX(en_id)' +
       ' FROM aen_endoso, ahl_historicotelefono' +
      ' WHERE hl_idendoso = en_id' +
        ' AND en_contrato = :contrato' +
        ' AND hl_tipo = ''P''' +
        ' AND en_id <= :id';
    iEndosoTel := ValorSqlIntegerEx(sSql, [aContrato, aEndosoId], -1);
    fraTelefonoPostal.Initialize('HL_IDENDOSO', True, True, 'HL', 'AHL_HISTORICOTELEFONO', 'P');
    fraTelefonoPostal.FillCombo(True, iEndosoTel);
  end;
end;

procedure TfrmModificacionContrato.tbRecepcionCartaClick(Sender: TObject);
begin
  fpRecepcionCarta.ShowModal;
end;

procedure TfrmModificacionContrato.ClearDatosFormRecepcion;
begin
  rgRecepOk.ItemIndex := -1;
  cbRecepcionSi.ItemIndex := -1;
  cbRecepcionSi.Visible := False;
  fraRecepcionNo.Clear;
  fraRecepcionNo.Visible := False;
  dcbFechaRecepcion.Clear;
  dcbFechaImpresion.Clear;
  edFechaRecepcionContratoFirmado.Clear;
  edFechaRecepcionVentanillaElectronica.Clear;
end;

procedure TfrmModificacionContrato.rgRecepOkClick(Sender: TObject);
begin
  cbRecepcionSi.ItemIndex := -1;
  fraRecepcionNo.Clear;

  cbRecepcionSi.Visible := (rgRecepOk.ItemIndex = 0);
  fraRecepcionNo.Visible := (rgRecepOk.ItemIndex = 1);
end;

procedure TfrmModificacionContrato.btnCambiarOrigenClick(Sender: TObject);
begin
  btnGuardarOrigen.Enabled := True;
  fraCO_ORIGEN.Tag := IIF(fraCO_ORIGEN.ReadOnly, 0, 1);
  LockControls([fraCO_ORIGEN], False);
  fraCO_ORIGEN.SetFocus;
end;

procedure TfrmModificacionContrato.btnCancelarClick(Sender: TObject);
begin
  if CO_RECEPCIONCONTRATO = 'S' then
  begin
    rgRecepOk.ItemIndex := 0;
    cbRecepcionSi.ItemIndex := StrToIntDef(CO_MOTIVORECEPCIONCONTRATO, -1);
  end
  else if CO_RECEPCIONCONTRATO = 'N' then
  begin
    rgRecepOk.ItemIndex := 1;
    fraRecepcionNo.Codigo := CO_MOTIVORECEPCIONCONTRATO;
  end
  else
  begin
    rgRecepOk.ItemIndex := -1;
    cbRecepcionSi.ItemIndex := -1;
    fraRecepcionNo.Clear;
  end;
  dcbFechaRecepcion.Date := cmbCO_RECEPCONTRATO.Date;

  fpRecepcionCarta.Close;
end;

procedure TfrmModificacionContrato.btnCancelarPCPClick(Sender: TObject);
begin
  fpTarifaPCP.ModalResult := MrCancel;
end;

procedure TfrmModificacionContrato.btnRecepcionAceptarClick(Sender: TObject);
begin
  //Se pasaron estas 3 validaciones aca arriba, ya que al no tener permisos igualmente se pueden modificar las fechas de
  //recepcion contrato firmado y recepcion anexo firmado.

  Verificar((edFechaRecepcionContratoFirmado.Date > 0) and (edFechaRecepcionContratoFirmado.Date < dcbFechaRecepcion.Date), edFechaRecepcionContratoFirmado, 'La fecha de recepción del contrato firmado no puede ser inferior a la fecha de recepción.');
  Verificar((edFechaRecepcionVentanillaElectronica.Date > 0) and (edFechaRecepcionVentanillaElectronica.Date < dcbFechaRecepcion.Date), edFechaRecepcionVentanillaElectronica, 'La fecha de recepción del anexo no puede ser inferior a la fecha de recepción.');
  //tk 50995 explicado por grossi
  Verificar((edFechaRecepcionContratoFirmado.Date > 0) and (edFechaRecepcionContratoFirmado.Date <= dcbFechaImpresion.Date), edFechaRecepcionContratoFirmado, 'La fecha de recepción del contrato firmado no puede ser inferior a la fecha de impresión.');
  //pedido de grossi tk 50995
  Verificar((dcbFechaRecepcion.Date > 0) and (dcbFechaRecepcion.Date <= dcbFechaImpresion.Date), dcbFechaRecepcion, ' La Fecha de Recepción no puede ser inferior a la Fecha de Impresión.');

  if not rgRecepOk.Enabled then   // Si eso es True es porque se está guardando la fecha de recepción del contrato..
  begin
    Verificar(edFechaRecepcionContratoFirmado.IsEmpty, edFechaRecepcionContratoFirmado, 'Debe indicar la Fecha de Recepción del Contrato Firmado.');

    UpdateFechaRecepcionContratoFirmado;
    ActualizarCartas;
    ActualizarRecepcionVentanillaElectronica;
  end
  else
  begin
    Verificar((rgRecepOk.ItemIndex < 0), rgRecepOk, 'Debe indicar si se recepcionó o no la carta.');
    Verificar(dcbFechaRecepcion.IsEmpty, dcbFechaRecepcion, 'Debe indicar la Fecha de Recepción.');
    Verificar(dcbFechaRecepcion.Date > DBDate, dcbFechaRecepcion, 'La Fecha de Recepción no puede ser posterior al día de hoy.');
    if rgRecepOk.ItemIndex = 0 then
      Verificar((cbRecepcionSi.ItemIndex < 0), cbRecepcionSi, 'Debe indicar el Código de Recepción.')
    else
      Verificar(fraRecepcionNo.IsEmpty, fraRecepcionNo, 'Debe indicar el Código de Recepción.');

    cmbCO_RECEPCONTRATO.Date := dcbFechaRecepcion.Date;
    UpdateFechaRecepcionContratoFirmado;
    if EstadoForm = efModificaEndoso then
      GuardarEndoso
    else
    begin
      // Genero un nuevo endoso..
      fraEN_MOTIVO_Alta.Value := '401';
      GuardarContrato(FContrato);
    end;
    ActualizarCartas;
    ActualizarRecepcionVentanillaElectronica;

    DoCargarDatos(ART_EMPTY_ID, FContrato, fsModificar);
  end;
  edCO_CONTRATOExit(nil);
  fpRecepcionCarta.Close;
end;

procedure TfrmModificacionContrato.fpRecepcionCartaShow(Sender: TObject);
  function GetFechaRecepcionVentanillaElectronica(const aIdEndoso: Integer): TDateTime;
  var
    sSql: String;
  begin
    sSql :=
      'SELECT ca_fecharecepcion' +
       ' FROM cca_carta' +
      ' WHERE ca_idendoso = :idendoso' +
        ' AND ca_idtextocarta = :idtextocarta';
    Result := ValorSqlDateTimeEx(sSql, [aIdEndoso, GetIdTextoAnexoRes365]);
  end;

var
  bLockControls: Boolean;
  sSql: String;
begin
  fraRecepcionNo.Clear; //me dijo grossi que no se limpiaba

  {$region 'fraRecepcionNO.ExtraCondition'}
  //pedido en ticket 68517
  // En la recepción de contratos están incorrectos los códigos de no recepción.
  // Tienen que corresponderse con el correo de envío de contrato, se adjuntan imágenes para mayor entender.
  fraRecepcionNo.ExtraCondition := ' AND tb_clave = ''CODRE'' AND tb_especial1 = (SELECT tb_especial2 ' +
                                                                                 ' FROM cca_carta, art.ctb_tablas ' +
                                                                                 '  WHERE ca_id = ' +
                                                                                 ' (SELECT MAX (ca_id) ' +
                                                                                 '     FROM cca_carta, aen_endoso ' +
                                                                                 '    WHERE en_id = ca_idendoso ' +
                                                                                 '    AND en_contrato = ' + SqlValue(FContrato) +
                                                                                 '    AND ca_idtextocarta IN (1046, 909, 783, 477)' +
                                                                                 '    AND ca_fechaimpresion IS NOT NULL)' +
                                                                                 '    AND ca_correo = tb_codigo' +
                                                                                 '    AND tb_codigo <> ''0''' +
                                                                                 '    AND tb_fechabaja IS NULL ' +
                                                                                 '    AND tb_clave = ''CORRE'') ';
  {$endregion}

  sSql :=
    'SELECT *' +
     ' FROM ahc_historicocontrato' +
    ' WHERE hc_contrato = :contrato1' +
      ' AND hc_recepcioncontrato IS NOT NULL' +
      ' AND hc_id = (SELECT MAX(hc_id)' +
                     ' FROM ahc_historicocontrato LEFT JOIN aen_endoso ON(en_idhistoricocontrato = hc_id)' +
                    ' WHERE hc_contrato = :contrato2' +
                      ' AND hc_recepcioncontrato IS NOT NULL)';

  with GetQueryEx(sSql, [edCO_CONTRATO.Text, edCO_CONTRATO.Text]) do
  try
    edFechaRecepcionContratoFirmado.Date := FieldByName('hc_recepcontratofirmado').AsDateTime;
    edFechaRecepcionVentanillaElectronica.Date :=  FieldByName('hc_fecharecepcionanexo').AsDateTime;

    bLockControls := ((not FieldByName('hc_recepcontrato').IsNull)) and (EstadoForm <> efModificaEndoso) and
                      (not Seguridad.Claves.IsActive('PermisoModificarContratoRecepcionado'));

    LockControls([dcbFechaRecepcion, cbRecepcionSi, fraRecepcionNo], bLockControls);

    LockControls([edFechaRecepcionContratoFirmado, btnRecepcionAceptar, btnCancelar],
                (edFechaRecepcionContratoFirmado.Date > 0) and bLockControls);

    LockControls([edFechaRecepcionVentanillaElectronica, btnRecepcionAceptar, btnCancelar],
                (edFechaRecepcionVentanillaElectronica.Date > 0) and bLockControls);

    rgRecepOk.Enabled := cbRecepcionSi.Enabled;

    if FieldByName('hc_recepcioncontrato').AsString = 'S' then
    begin
      rgRecepOk.ItemIndex := 0;
      cbRecepcionSi.ItemIndex := StrToIntDef(FieldByName('hc_motivorecepcioncontrato').AsString, -1);
    end
    else if FieldByName('hc_recepcioncontrato').AsString = 'N' then
    begin
      rgRecepOk.ItemIndex := 1;
      fraRecepcionNo.Codigo := FieldByName('hc_motivorecepcioncontrato').AsString;
    end
    else
      rgRecepOk.ItemIndex := -1;
    dcbFechaRecepcion.Date := FieldByName('hc_recepcontrato').AsDateTime;
    dcbFechaImpresion.Date := cmbCO_FECHAIMPRESION.Date;
  finally
    Free;
  end;

  btnCerrar.Visible := not btnRecepcionAceptar.Enabled;
end;

procedure TfrmModificacionContrato.cmbCO_RECEPCONTRATOExit(Sender: TObject);
begin
  dcbFechaRecepcion.Date := cmbCO_RECEPCONTRATO.Date;
end;

procedure TfrmModificacionContrato.ActualizarCartas;
var
  iCartaId: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT   ca_id' +
       ' FROM aen_endoso, cca_carta' +
      ' WHERE ca_idendoso = en_id' +
        ' AND ca_idendoso IS NOT NULL' +
        ' AND ca_fechabaja IS NULL' +
        ' AND ca_idtextocarta = :idtextocarta' +
        ' AND en_contrato = :contrato' +
   ' ORDER BY en_id DESC';                    //cambiado por ticket 66950
  iCartaId := ValorSqlIntegerEx(sSql, [IIF(FTipoRegimen <> 2, GetIdTextoCartaBienvenida, '1046'), FContrato], -1);

  sSql :=
    'UPDATE cca_carta' +
      ' SET ca_fecharecepcion = :fecharecepcion,' +
          ' ca_recepcionok = :recepcionok,' +
          ' ca_codrecepcion = :codrecepcion,' +
          ' ca_usurecepcion = :usuario' +
    ' WHERE ca_id = :id';
  EjecutarSqlEx(sSql, [TDateTimeEx.Create(dcbFechaRecepcion.Date), IIF((rgRecepOk.ItemIndex = 0), 'S', 'N'),
                       IIF((rgRecepOk.ItemIndex = 0), 'NULL', fraRecepcionNo.Codigo), Sesion.UserID, iCartaId]);
end;

procedure TfrmModificacionContrato.mnuNominaIndividualClick(Sender: TObject);
begin
  if CO_FECHABAJA = 0 then
    with TfrmContratoTrabajador.Create(Self) do
    try
      if (FFuncion = fsConsultar) then
        DoCargarDatos(FContrato, fsConsultar)
      else
        DoCargarDatos(FContrato);
      Show;
    except
      Free;
    end
  else
    InfoHint(nil, 'La empresa se encuentra dada de baja.');
end;

procedure TfrmModificacionContrato.mnuNominaMasivaClick(Sender: TObject);
begin
  if CO_FECHABAJA = 0 then
  begin
    FreeAndNil(frmCargaNominaManual);
    frmCargaNominaManual := TfrmCargaNominaManual.Create(Self);
    with frmCargaNominaManual do
    try
      fraEmpresa.Contrato := FContrato;
      CambiaEmpresa(nil);
      LockControl(fraEmpresa);
      btnActualizarClick(nil);
      Show;
    except
      Free;
    end;
  end
  else
    InfoHint(nil, 'La empresa se encuentra dada de baja.');
end;

procedure TfrmModificacionContrato.DoAutoEndoso(const aContrato, aArtFuturaId: Integer; const aFechaBaja: TDate;
                                                const aEstado, aMotivo, aMotivoEndoso: String);
begin
// Carga el contrato, modifica los datos que sean necesarios y genera un nuevo endoso..

  DoCargarDatos(ART_EMPTY_ID, aContrato, fsModificar);

  // Cambio los valores..
  fraCO_ESTADO.Value := aEstado;
  cmbCO_FECHABAJA.Date := aFechaBaja;
  fraCO_MOTIVOBAJA.Value := aMotivo;
  fraCO_IDARTFUTURA.Value := aArtFuturaId;
  fraEN_MOTIVO_Alta.Value := aMotivoEndoso;
  EstadoForm              := efContratoFijo; //Sin esto si tienen el form de Modificacion de Contrato abierto establece otro tipo de endoso. Tk 60592

  // Guardo el endoso..
  Validar;
  GuardarContrato(FContrato, False);
end;

procedure TfrmModificacionContrato.JvApplicationHotKeyHotKey(Sender: TObject);
begin
  if not edCO_CONTRATO.IsEmpty then
    DoCargarImagenesDigitalizadasAfi(Self, edCO_CONTRATO.Value);
end;

procedure TfrmModificacionContrato.UpdateFechaRecepcionContratoFirmado;
var
  sSql: String;
begin
  BeginTrans;

  try
    sSql :=
      'UPDATE aco_contrato' +
        ' SET co_recepcontratofirmado = :recepcioncontrato,' +
            ' co_fecharecepcionanexo = :recepcionanexo' +
      ' WHERE co_contrato = :contrato';
    EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(edFechaRecepcionContratoFirmado.Date),
                           TDateTimeEx.Create(edFechaRecepcionVentanillaElectronica.Date), edCO_CONTRATO.Value]);

    sSql :=
      'UPDATE ahc_historicocontrato' +
        ' SET hc_recepcontratofirmado = :recepcioncontrato,' +
            ' hc_fecharecepcionanexo = :recepcionanexo' +
      ' WHERE hc_id = (SELECT MAX(en_idhistoricocontrato)' +
                       ' FROM aen_endoso' +
                      ' WHERE en_contrato = :contrato)';
    EjecutarSqlSTEx(sSql, [TDateTimeEx.Create(edFechaRecepcionContratoFirmado.Date),
                           TDateTimeEx.Create(edFechaRecepcionVentanillaElectronica.Date), edCO_CONTRATO.Value]);
    CommitTrans;
  except
    Rollback;
  end;
end;

procedure TfrmModificacionContrato.cbRecepcionSiChange(Sender: TObject);
begin
  if cbRecepcionSi.Visible then
  begin
    if cbRecepcionSi.ItemIndex = 0 then
      edFechaRecepcionContratoFirmado.Date := dcbFechaRecepcion.Date
    else
      edFechaRecepcionContratoFirmado.Clear;
  end;
end;

procedure TfrmModificacionContrato.edNumeroFormRectificacionDatosExit(Sender: TObject);
begin
  if edNumeroFormRectificacionDatos.Value = 0 then
    edNumeroFormRectificacionDatos.Clear;
end;
{
function TfrmModificacionContrato.GetNombreOriginal(aNombre: String): String;
var
  iPos: Integer;
begin
  iPos := Pos(' (LEGAL)', aNombre);
  if iPos > 0 then
    Delete(aNombre, iPos, 8);
  Result := aNombre;
end;
}
procedure TfrmModificacionContrato.fpModificaFechasSRTBeforeShow(Sender: TObject);
begin
  checkLimpiarRechazo.Checked := False;
end;

procedure TfrmModificacionContrato.lbDesmarcarEnvioSRTMouseEnter(Sender: TObject);
begin
  if lbDesmarcarEnvioSRT.Enabled then
    lbDesmarcarEnvioSRT.Font.Style := [fsUnderline];
end;

procedure TfrmModificacionContrato.lbDesmarcarEnvioSRTMouseLeave(Sender: TObject);
begin
  lbDesmarcarEnvioSRT.Font.Style := [];
end;

procedure TfrmModificacionContrato.lbDesmarcarEnvioSRTClick(Sender: TObject);
var
  sSql: String;
begin
  if MsgAsk('Está a punto de desmarcar un envío a la SRT.'#13#10#13#10'¿ Confirma la operación ?') then
  begin
    BeginTrans;
    try
      sSql :=
        'UPDATE aen_endoso' +
          ' SET en_enviosrt = ''N''' +
        ' WHERE en_id = :id';
      EjecutarSqlSTEx(sSql, [FIdEndoso]);

      sSql :=
        'DELETE FROM art.acc_controlcn' +
             ' WHERE cc_contrato = :contrato' +
               ' AND cc_endoso = :endoso';
      EjecutarSqlSTEx(sSql, [FContrato, edtbEndoso.Text]);

      cbEN_ENVIOSRT_C.Checked := False;
      ModificarAparienciaDesmarcarEnvioSRT;

      CommitTrans;
    except
      on E: Exception do
      begin
        Rollback;
        ErrorMsg(E, 'Ha ocurrido un error.');
      end;
    end;
  end;
end;

procedure TfrmModificacionContrato.ModificarAparienciaDesmarcarEnvioSRT;
begin
  lbDesmarcarEnvioSRT.Enabled := Seguridad.Claves.IsActive('PermisoSuperUsuarioSinValidar') and cbEN_ENVIOSRT_C.Checked;
end;

procedure TfrmModificacionContrato.chkFirma1Click(Sender: TObject);
begin
//tk 65656
{Se solicita que cuando se realice la carga de documentación en la ruta Afiliaciones-Adm. de Solic.-Carga de Solic. al tildar la primer firma del documento PEP la segunda firma se tilde automáticamente.
también cuando de incorpora documentación (Afiliaciones-Adm. de Contratos-Modificación de Contratos)}
  if chkFirma1.Checked then
    chkFirma2.Checked := True;
end;

procedure TfrmModificacionContrato.chkNoTieneEmailClick(Sender: TObject);
begin
  if edNumeroFormRectificacionDatos.Value > 0 then
  begin
    fraOrigenDatoEmail.Enabled := False;
    fraOrigenDatoEmail.Value := 1;
  end;

  edCO_DIRELECTRONICA.Enabled := not chkNoTieneEmail.Checked;
  if chkNoTieneEmail.Checked then
    edCO_DIRELECTRONICA.Clear;
end;

procedure TfrmModificacionContrato.edNumeroFormRectificacionDatosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  chkNoTieneEmail.Enabled := not tbUltimo.Enabled;
  fraOrigenDatoEmail.Enabled := chkNoTieneEmail.Enabled;
  if not chkNoTieneEmail.Enabled then
    fraOrigenDatoEmail.Value := 1;
end;

procedure TfrmModificacionContrato.ActualizarRecepcionVentanillaElectronica;
var
  sSql: String;
begin
  sSql :=
    'SELECT ca_id' +
     ' FROM aen_endoso, cca_carta' +
    ' WHERE ca_idendoso = en_id' +
      ' AND ca_idendoso IS NOT NULL' +
      ' AND ca_fechabaja IS NULL' +
      ' AND ca_idtextocarta = :idtextocarta' +
      ' AND en_contrato = :contrato' +
      ' AND ca_fecharecepcion IS NULL';
  with GetQueryEx(sSql, [GetIdTextoAnexoRes365, FContrato]) do
  try
    while not Eof do
    begin
      sSql :=
        'UPDATE cca_carta' +
          ' SET ca_fecharecepcion = :fecharecepcion,' +
              ' ca_recepcionok = :recepcionok,' +
              ' ca_codrecepcion = :codrecepcion,' +
              ' ca_usurecepcion = :usuario' +
        ' WHERE ca_id = :id';
      EjecutarSqlEx(sSql, [TDateTimeEx.Create(edFechaRecepcionVentanillaElectronica.Date),
                           IIF((rgRecepOk.ItemIndex = 0), 'S', 'N'),
                           IIF((rgRecepOk.ItemIndex = 0), 'NULL', fraRecepcionNo.Codigo), Sesion.UserID,
                           FieldByName('ca_id').AsInteger]);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.CalcularCostosPCP;
begin
  edAlicuotaMenosDe12.Value := edValorMenosDe12.Value * edCantTrabMenosDe12.Value;
  edAlicuotaDe12a16.Value   := edValorDesde12a16.Value * edCantTrabDe12a16.Value;
  edAlicuotaMasDe16.Value   := edValorMasDe16.Value * edCantTrabMasDe16.Value;

  edAlicuota.Value := edAlicuotaMenosDe12.Value + edAlicuotaDe12a16.Value + edAlicuotaMasDe16.Value;
end;

procedure TfrmModificacionContrato.CambiaMotivoBaja(Sender: TObject);
begin
  lbCO_IDARTFUTURA.Enabled := (fraCO_MOTIVOBAJA.Value = '07');
  fraCO_IDARTFUTURA.Enabled := lbCO_IDARTFUTURA.Enabled;
  if not fraCO_IDARTFUTURA.Enabled then
    fraCO_IDARTFUTURA.Clear;
end;

procedure TfrmModificacionContrato.btnCerrar2Click(Sender: TObject);
begin
  fpDocumentacion.Close;
end;

procedure TfrmModificacionContrato.fpDocumentacionBeforeShow(Sender: TObject);
begin
  with sdqDocumentacion do
  begin
    Close;
    ParamByName('contrato').AsInteger := edCO_CONTRATO.Value;
    Open;
    Last;
  end;
end;

procedure TfrmModificacionContrato.sdqDocumentacionAfterScroll(DataSet: TDataSet);
begin
  CargarDocumentacion;
end;

procedure TfrmModificacionContrato.CargarDocumentacion;
begin
  with sdqDocumentacion do
  begin
    chkContratoFirmado.Checked := (FieldByName('hc_contratofirmado').AsString = 'T');

    // COTIZACIÓN..
    chkCotizacionCotizacion.Checked := (Pos('C', FieldByName('hc_cotizacion').AsString) > 0);
    chkCotizacionTitular.Checked    := (Pos('T', FieldByName('hc_cotizacion').AsString) > 0);
    chkCotizacionVendedor.Checked   := (Pos('V', FieldByName('hc_cotizacion').AsString) > 0);

    // DATOS MODIFICACIÓN..
    edUsuario.Text := FieldByName('se_nombre').AsString;
    edFecha.Date   := FieldByName('en_fechaalta').AsDateTime;

    edEndoso.Text     := FieldByName('en_endoso').AsString;
    edMovimiento.Text := FieldByName('en_movimiento').AsString;

    tbPrimero2.Enabled   := (RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});
    tbAnterior2.Enabled  := (RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});
    tbSiguiente2.Enabled := (RecNo < (RecordCount {$IFDEF VER150}- 1{$ENDIF}));
    tbUltimo2.Enabled    := (RecNo < (RecordCount {$IFDEF VER150}- 1{$ENDIF}));

    VCLExtra.LockControls([{gbPersoneriaFirmante} gbPresentoRgrl, gbCotizacion, btnAceptar], (RecordCount > 0) and (RecNo <> (RecordCount {$IFDEF VER150}- 1{$ENDIF})));
  end;
end;

procedure TfrmModificacionContrato.tbPrimero2Click(Sender: TObject);
begin
  sdqDocumentacion.First;
end;

procedure TfrmModificacionContrato.tbAnterior2Click(Sender: TObject);
begin
  sdqDocumentacion.Prior;
end;

procedure TfrmModificacionContrato.tbSiguiente2Click(Sender: TObject);
begin
  sdqDocumentacion.Next;
end;

procedure TfrmModificacionContrato.tbUltimo2Click(Sender: TObject);
begin
  sdqDocumentacion.Last;
end;

procedure TfrmModificacionContrato.btnAceptarClick(Sender: TObject);
var
  iIdEndoso: Integer;
  sSql: String;
begin
  if not MsgAsk('Esta acción generará un nuevo movimiento. ¿ Desea continuar ?') then
    Exit;

  //ActualizarDocumentacionFaltante;

  sSql :=
    'UPDATE aco_contrato' +
      ' SET co_cotizacion = :cotizacion,' +
          ' co_contratofirmado = :contratofirmado' +
    ' WHERE co_contrato = :contrato';

  BeginTrans;
  try
    EjecutarSqlSTEx(sSql, [CotizacionStr,
                           IIF(chkContratoFirmado.Checked, 'T', 'F'),
                           edCO_CONTRATO.Value]);

    iIdEndoso := DoEndosoGrabar(edCO_CONTRATO.Value, DBDateTime, '505', 'N', 'N', 'S', frmPrincipal.DBLogin.UserId, False);
    GuardarDatosDocumentacion(iIdEndoso);

    CommitTrans;
    fpDocumentacion.Close;

    DoCargarDatos(ART_EMPTY_ID, FContrato, FFuncion);
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;
end;

procedure TfrmModificacionContrato.tbDocumentacionClick(Sender: TObject);
begin
  fpDocumentacion.ShowModal;
end;

procedure TfrmModificacionContrato.tbVisualizadorDocumentacionDigitalizadaClick(Sender: TObject);
begin
  if not edCO_CONTRATO.IsEmpty then
    DoCargarImagenesDigitalizadasAfi(Self, edCO_CONTRATO.Value);
end;

procedure TfrmModificacionContrato.tblRiesgoPCPClick(Sender: TObject);
var
  frmPCP : TfrmPCP;
begin
  frmPCP := TfrmPCP.Create(Self);
  with frmPCP do
  try
    LoadData(FIdFormulario);
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.fraDOMICILIO_POSTALbtnBuscarClick(Sender: TObject);
begin
  fraDOMICILIO_POSTAL.btnBuscarClick(Sender);
end;

procedure TfrmModificacionContrato.btnRevisionLegajoClick(Sender: TObject);
var
  iIdEndoso: Integer;
  sSql: String;
begin
  if MsgAsk('Esta acción generará un nuevo movimiento. ¿ Desea continuar ?') then
  begin
    //ActualizarDocumentacionFaltante;

    sSql :=
      'UPDATE aco_contrato' +
        ' SET co_cotizacion = :cotizacion,' +
            ' co_contratofirmado = :contratofirmado' +
      ' WHERE co_contrato = :contrato';

    BeginTrans;
    try
      EjecutarSqlSTEx(sSql, [CotizacionStr,
                             IIF(chkContratoFirmado.Checked, 'T', 'F'),
                             edCO_CONTRATO.Value]);

      iIdEndoso := DoEndosoGrabar(edCO_CONTRATO.Value, DBDateTime, '506', 'N', 'N', 'S', frmPrincipal.DBLogin.UserId, False);
      GuardarDatosDocumentacion(iIdEndoso);
      CommitTrans;

      DoCargarDatos(ART_EMPTY_ID, FContrato, FFuncion);

      MsgBox('Movimiento generado correctamente.');
    except
      on E: Exception do
      begin
        Rollback;
        MsgBox(E.Message);
      end;
    end;
  end;
end;

procedure TfrmModificacionContrato.btnEditarClick(Sender: TObject);
begin
  if FTipoRegimen = 2 then
  begin
    if fpTarifaPCP.ShowModal = MrOk then
    begin
      GuardarTarifaPCP;
      edTotEmpleados.Value := edCantTrabMenosDe12.Value + edCantTrabDe12a16.Value + edCantTrabMasDe16.Value;
      edMASATOTAL.Value := 0;
      btnGuardarClick(Sender);
    end;
  end
  else
  begin
    btnGuardar.Enabled := True;
    edTOTEMPLEADOS.Tag := IIF(edTOTEMPLEADOS.ReadOnly, 0, 1);
    LockControls([edTOTEMPLEADOS, edMASATOTAL], False);
    edTOTEMPLEADOS.SetFocus;
  end;
end;

procedure TfrmModificacionContrato.btnGuardarClick(Sender: TObject);
var
  sSql: String;
begin
  // Valido que los campos tengan algún valor..
  Verificar((edTOTEMPLEADOS.Value < 1) and (FTipoRegimen <> 2), edTOTEMPLEADOS, 'La cantidad de empleados tiene que ser mayor a 0.');

  Verificar((edMASATOTAL.Value <= 0) and (FTipoRegimen <> 2), edMASATOTAL, 'La Masa Salarial debe ser mayor a cero.');
  Verificar((edMASATOTAL.Value > 0) and (FTipoRegimen = 2), edMASATOTAL, 'La Masa Salarial debe ser cero para el régimen especial');

  //Verificar((edMASATOTAL.Value < 1), edMASATOTAL, 'La masa salarial tiene que ser mayor a 0.');


  // Guardo los datos..
  BeginTrans;
  try
    sSql :=
      'UPDATE aco_contrato' +
        ' SET co_totempleados = :totempleados,' +
            ' co_masatotal = :masatotal' +
      ' WHERE co_contrato = :contrato';
    EjecutarSqlSTEx(sSql, [edTOTEMPLEADOS.Value, edMASATOTAL.Value, edCO_CONTRATO.Value]);

    sSql :=
      'UPDATE ahc_historicocontrato' +
        ' SET hc_totempleados = :totempleados,' +
            ' hc_masatotal = :masatotal' +
      ' WHERE hc_contrato = :contrato';
    EjecutarSqlSTEx(sSql, [edTOTEMPLEADOS.Value, edMASATOTAL.Value, edCO_CONTRATO.Value]);

    EjecutarStoreSTEx('art.afiliacion.do_devengarporcambiosolafi(:contrato);', [edCO_CONTRATO.Value]);

    CommitTrans;

    ShowMessage('Los datos se guardaron exitosamente.');
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;

  // Deshabilito los controles..
  btnGuardar.Enabled := False;
  LockControls([edTOTEMPLEADOS, edMASATOTAL], IIF((edTOTEMPLEADOS.Tag = 1), False, True));
end;

procedure TfrmModificacionContrato.btnGuardarOrigenClick(Sender: TObject);
var
  sSql : String;
begin
  Verificar(edCO_CONTRATO.IsEmpty, edCO_CONTRATO, 'El contrato no puede estar vacío');
  Verificar(fraCO_ORIGEN.IsEmpty, fraCO_ORIGEN, 'El orígen no puede quedar vacío');

  BeginTrans;
  try
    sSql :=
      'UPDATE aco_contrato' +
        ' SET co_origen = :orig' +
      ' WHERE co_contrato = :contrato';
    EjecutarSqlSTEx(sSql, [fraCO_ORIGEN.Value, edCO_CONTRATO.Value]);

    sSql :=
      'UPDATE ahc_historicocontrato' +
        ' SET hc_origen = :orig' +
      ' WHERE hc_contrato = :contrato';
    EjecutarSqlSTEx(sSql, [fraCO_ORIGEN.Value, edCO_CONTRATO.Value]);

   // EjecutarStoreSTEx('art.afiliacion.do_devengarporcambiosolafi(:contrato);', [edCO_CONTRATO.Value]);

    CommitTrans;

    ShowMessage('Los datos se guardaron exitosamente.');
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;

  btnGuardarOrigen.Enabled := False;
  LockControls([fraCO_ORIGEN], IIF((fraCO_ORIGEN.Tag = 1), False, True));
end;

function TfrmModificacionContrato.CotizacionStr: String;
var
  sCotizacion: String;
begin
  sCotizacion := '';
  if chkCotizacionCotizacion.Checked then
    sCotizacion := sCotizacion + 'C,';
  if chkCotizacionTitular.Checked then
    sCotizacion := sCotizacion + 'T,';
  if chkCotizacionVendedor.Checked then
    sCotizacion := sCotizacion + 'V,';
  Result := sCotizacion;
end;

function TfrmModificacionContrato.VerificarDocumentacionFaltante(const aFormaJuridica: String; const aCaracterFirma,
                                                                 aIdDocumentoAfi: Integer; const aPresento,
                                                                 aFirmaTitular, aFirmaVendedor: String): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT afiliacion.documentofaltante(:formaj, :idcaracterfirma, :id, :presente, :firmatitular, :firmavendedor, :espcp)' +
     ' FROM DUAL';
  Result := ValorSqlEx(sSql, [aFormaJuridica, aCaracterFirma, aIdDocumentoAfi, aPresento, aFirmaTitular, aFirmaVendedor, IIF(FTipoRegimen = 2, 'S', 'N')]);
end;

procedure TfrmModificacionContrato.ActualizarDocumentacionFaltante(const aComponentName: String);
var
  aCheck: TCheckBox;
  iCaracter: Integer;
  iIdDocumentacion: Integer;
  iLoop: Integer;
  sFirmaTitular: String;
  sFirmaVendedor: String;
  sFormaJ: String;
  sPresento: String;
begin
  //Verificar que esten todos los datos correctos
  Verificar(fraCaracter.IsEmpty, fraCaracter, 'Es necesario el carácter del firmante');
  Verificar(fraEM_FORMAJ.IsEmpty,fraEM_FORMAJ,'Es necesaria la forma jurídica');


  for iLoop := 0 to ComponentCount - 1 do
  begin
    sPresento      := '';
    sFirmaTitular  := '';
    sFirmaVendedor := '';

    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, Length(aComponentName) +2) = '_'+aComponentName+'_') then
    begin
      aCheck := TCheckBox(Components[iLoop]);
      if aCheck <> nil then
        sPresento := IIF(aCheck.Checked, 'S', 'N');

      aCheck := TCheckBox(FindComponent(aComponentName+ '_firmatitular_' + IntToStr(Components[iLoop].Tag)));
      if aCheck <> nil then
        sFirmaTitular := IIF(aCheck.Checked, 'S', 'N');

      aCheck := TCheckBox(FindComponent(aComponentName+ '_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
      if aCheck <> nil then
        sFirmaVendedor := IIF(aCheck.Checked, 'S', 'N');

      aCheck := TCheckBox(FindComponent(aComponentName+ '_faltante_' + IntToStr(Components[iLoop].Tag)));
      if (aCheck <> nil) and (not fraEM_FORMAJ.IsEmpty) and (not fraCaracter.IsEmpty) then
      begin
        iIdDocumentacion := Components[iLoop].Tag;
        sFormaJ          := fraEM_FORMAJ.Value;
        iCaracter        := fraCaracter.Value;

        aCheck.Checked := IIF(VerificarDocumentacionFaltante(sFormaJ, iCaracter, iIdDocumentacion, sPresento,
                                                             sFirmaTitular, sFirmaVendedor) = 'S', True, False);
      end;
    end;
  end;
end;

procedure TfrmModificacionContrato.VerificarDocumentacionFaltanteFila(const aTag: Integer; const bFirmante: Boolean);
var
  aCheckFaltante: TCheckBox;
  aCheckPresento: TCheckBox;
  aCheckTitular: TCheckBox;
  aCheckVendedor: TCheckBox;
  iCaracter: Integer;
  iIdDocumentacion: Integer;
  sFirmaTitular: String;
  sFirmaVendedor: String;
  sFormaJ: String;
  sPresento: String;
begin
  if bFirmante then
  begin
    aCheckPresento := TCheckBox(FindComponent('_checkfirmante_' + IntToStr(aTag)));
    aCheckTitular  := TCheckBox(FindComponent('checkfirmante_firmatitular_' + IntToStr(aTag)));
    aCheckVendedor := TCheckBox(FindComponent('checkfirmante_firmavendedor_' + IntToStr(aTag)));
    aCheckFaltante := TCheckBox(FindComponent('checkfirmante_faltante_' + IntToStr(aTag)));
  end
  else
  begin
    aCheckPresento := TCheckBox(FindComponent('_check_' + IntToStr(aTag)));
    aCheckTitular  := TCheckBox(FindComponent('check_firmatitular_' + IntToStr(aTag)));
    aCheckVendedor := TCheckBox(FindComponent('check_firmavendedor_' + IntToStr(aTag)));
    aCheckFaltante := TCheckBox(FindComponent('check_faltante_' + IntToStr(aTag)));
  end;


  if (aCheckPresento <> nil) and (aCheckTitular <> nil) and (aCheckVendedor <> nil) and (aCheckFaltante <> nil) then
  begin
    sPresento      := IIF(aCheckPresento.Checked, 'S', 'N');
    sFirmaTitular  := IIF(aCheckTitular.Checked, 'S', 'N');
    sFirmaVendedor := IIF(aCheckVendedor.Checked, 'S', 'N');

    if not ((fraEM_FORMAJ.IsEmpty) or (fraCaracter.IsEmpty)) and bFirmante then
    begin
      iIdDocumentacion := aTag;
      sFormaJ := fraEM_FORMAJ.Value;
      iCaracter := fraCaracter.Value;

      aCheckFaltante.Checked:= IIF(VerificarDocumentacionFaltante(sFormaJ, iCaracter, iIdDocumentacion, sPresento,
                                                                  sFirmaTitular, sFirmaVendedor) = 'S', True, False);
    end;
  end;
end;

procedure TfrmModificacionContrato.tbRefreshClick(Sender: TObject);
begin
  if edCO_CONTRATO.Text <> '' then
  begin
    btnBuscarContacto.Caption := 'Buscar';
    sdqDatosContacto.Close;
    sdqDatosContacto.SQL.Text := LoadSQLDatosContacto;

    sdqDatosContacto.ParamByName('co_contrato').AsInteger := StrToInt(edCO_CONTRATO.Text);
    sdqDatosContacto.Open;
    CargarDatosFirmante;
  end;
end;

procedure TfrmModificacionContrato.CargarDatosFirmante;
begin
  fraContacto.fraTelefonos.Clear;
  with sdqDatosContacto do
  begin
    FNombreContacto := FieldByName('ct_contacto').AsString;
    fraContacto.Contacto := FieldByName('ct_contacto').AsString;
    fraContacto.Cargo    := FieldByName('ct_cargo').AsString;

    if not fraEM_FORMAJ.IsEmpty then
      fraCaracter.ExtraCondition := ' AND cf_id IN (SELECT df_caracterfirma FROM adf_documentacionfalta WHERE df_formajuridica = ' + fraEM_FORMAJ.Value + ')';

    if not FieldByName('ct_idcaracterfirma').IsNull then
      fraCaracter.Codigo := FieldByName('ct_idcaracterfirma').AsString
    else
      fraCaracter.Codigo := '0';

    fraContacto.fraTelefonos.Initialize(False, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');
    fraContacto.fraTelefonos.FillCombo(True, FieldByName('CT_ID').AsInteger);

    fraContacto.Email       := FieldByName('ct_direlectronica').AsString;
    fraTipoDocumento.Codigo := FieldByName('ct_tipodocumento').AsString;
    edNumeroDocumento.Text  := FieldByName('ct_numerodocumento').AsString;

    if not FieldByName('ct_sexo').IsNull then
      cboxSexo.ItemIndex := IIF(FieldByName('ct_sexo').AsString = 'M', 0, 1)  //0M 1F
    else
      cboxSexo.ItemIndex := -1;

    fraTipoFirmante.Codigo := FieldByName('ct_tipofirma').AsString;

    CargarContratoFirmado(edCO_Contrato.Value);

    //chkFirmante.Checked     := IIF(FieldByName('ct_firmante').AsString = 'S', True, False);
  end;
end;

procedure TfrmModificacionContrato.dbGridContactosCellClick(Column: TColumn);
begin
  CargarContacto;
end;

procedure TfrmModificacionContrato.sdqDatosContactoAfterScroll(DataSet: TDataSet);
begin
  FIdContactoSeleccionado := -1;
  FAgregar := False;
  FInformeNosis := '';
  FAntInformeNosis := '';
  lbWorldSys.Caption := '';
  FRevisionPep := '';
  FExposicion := '';
  FExposicionNum := '';
  FComentariosFirmante := '';
  FNombreContacto := '';
  CargarContacto;
end;

procedure TfrmModificacionContrato.CrearComponentesDocumentacionFirmante;
  procedure CrearCheckBox(const aCaption, aName: String; const aLeft, aTag, aTop, aWidth: Integer;
                          const aParent: TGroupBox; const aVisible: Boolean; const aOnClick: TNotifyEvent);
  begin
    with TCheckBox.Create(Self) do
    begin
      Caption := aCaption;
      Left    := aLeft;
      Name    := aName;
      Parent  := aParent;
      Tag     := aTag;
      Top     := aTop;
      Width   := aWidth;
      Visible := aVisible;
      //Anchors := [akTop];
      OnClick := aOnClick;
    end;
  end;

var
  iTop: Integer;
  sSql: String;
begin
  // Agrego la personería firmante..
  sSql :=
    'SELECT df_descripcion, df_id, df_firmatitular, df_firmavendedor, df_ctrl_faltante' +
     ' FROM adf_documentoafi' +
    ' WHERE df_tipodocumento = ''P''' +
      ' AND df_fechabaja IS NULL' +
 ' ORDER BY df_orden';
  with GetQuery(sSql) do
  try
    iTop := 42;
    while not Eof do
    begin
      CrearCheckBox(FieldByName('df_descripcion').AsString, '_checkfirmante_' + FieldByName('df_id').AsString, 10, FieldByName('df_id').AsInteger, iTop, 240, gbFirmaPersoneriaFirmante, True, ClickFirmaPresentoFirmante);
      CrearCheckBox(FieldByName('df_descripcion').AsString, '_antcheckfirmante_'+ FieldByName('df_id').AsString,10, FieldByName('df_id').AsInteger, iTop, 240, gbFirmaPersoneriaFirmante, False, nil);

      if FieldByName('df_firmatitular').AsString = 'S' then
      begin
        CrearCheckBox('', 'checkfirmante_firmatitular_' + FieldByName('df_id').AsString, 175, FieldByName('df_id').AsInteger, iTop, 16, gbFirmaPersoneriaFirmante, True, ClickFirmaTitularFirmante);
        CrearCheckBox('', 'antcheckfirmante_firmatitular_' + FieldByName('df_id').AsString, 175, FieldByName('df_id').AsInteger, iTop, 16, gbFirmaPersoneriaFirmante, False, nil);
      end;
      if FieldByName('df_firmavendedor').AsString = 'S' then
      begin
        CrearCheckBox('', 'checkfirmante_firmavendedor_' + FieldByName('df_id').AsString, 258, FieldByName('df_id').AsInteger, iTop, 16, gbFirmaPersoneriaFirmante, True, ClickFirmaVendedorFirmante);
        CrearCheckBox('', 'antcheckfirmante_firmavendedor_' + FieldByName('df_id').AsString, 258, FieldByName('df_id').AsInteger, iTop, 16, gbFirmaPersoneriaFirmante, False, nil);
      end;

      if FieldByName('df_ctrl_faltante').AsString = 'S' then
      begin
        CrearCheckBox('', 'checkfirmante_faltante_' + FieldByName('df_id').AsString, 344, FieldByName('df_id').AsInteger, iTop, 16, gbFirmaPersoneriaFirmante, True, nil);
        CrearCheckBox('', 'antcheckfirmante_faltante_' + FieldByName('df_id').AsString, 344, FieldByName('df_id').AsInteger, iTop, 16, gbFirmaPersoneriaFirmante, False, nil);
      end;

      Inc(iTop, 15);
      Next;
    end;
  finally
    Free;
  end;

  gbFirmaPersoneriaFirmante.Height := iTop + 4;

  //Formularios y Anexos
  sSql :=
    'SELECT df_descripcion, df_id, df_firmatitular, df_firmavendedor, df_ctrl_faltante' +
     ' FROM adf_documentoafi' +
    ' WHERE df_tipodocumento = ''F''' +
      ' AND df_fechabaja IS NULL' +
 ' ORDER BY df_orden';

  with GetQuery(sSql) do
  try
    iTop := 15;
    while not Eof do
    begin
      CrearCheckBox(FieldByName('df_descripcion').AsString, '_checkfirmante_' + FieldByName('df_id').AsString, 10, FieldByName('df_id').AsInteger, iTop, 240, gbFormulariosAnexosFirmante, True, ClickFirmaPresentoFirmante);
      CrearCheckBox(FieldByName('df_descripcion').AsString, '_antcheckfirmante_'+ FieldByName('df_id').AsString,10, FieldByName('df_id').AsInteger, iTop, 240, gbFormulariosAnexosFirmante, False, nil);

      if FieldByName('df_firmatitular').AsString = 'S' then
      begin
        CrearCheckBox('', 'checkfirmante_firmatitular_' + FieldByName('df_id').AsString, 175, FieldByName('df_id').AsInteger, iTop, 16, gbFormulariosAnexosFirmante, True, ClickFirmaTitularFirmante);
        CrearCheckBox('', 'antcheckfirmante_firmatitular_' + FieldByName('df_id').AsString, 175, FieldByName('df_id').AsInteger, iTop, 16, gbFormulariosAnexosFirmante, False, nil);
      end;

      if FieldByName('df_firmavendedor').AsString = 'S' then
      begin
        CrearCheckBox('', 'checkfirmante_firmavendedor_' + FieldByName('df_id').AsString, 258, FieldByName('df_id').AsInteger, iTop, 16, gbFormulariosAnexosFirmante, True, ClickFirmaVendedorFirmante);
        CrearCheckBox('', 'antcheckfirmante_firmavendedor_' + FieldByName('df_id').AsString, 258, FieldByName('df_id').AsInteger, iTop, 16, gbFormulariosAnexosFirmante, False, nil);
      end;

      if FieldByName('df_ctrl_faltante').AsString = 'S' then
      begin
        CrearCheckBox('', 'checkfirmante_faltante_'+ FieldByName('df_id').AsString, 344, FieldByName('df_id').AsInteger, iTop, 16, gbFormulariosAnexosFirmante, True, nil);
        CrearCheckBox('', 'antcheckfirmante_faltante_' + FieldByName('df_id').AsString, 344, FieldByName('df_id').AsInteger, iTop, 16, gbFormulariosAnexosFirmante, False, nil);
      end;

      Inc(iTop, 15);
      Next;
    end;

   rbRefreshDocFirmante.Top := iTop + 2 ;
   gbFormulariosAnexosFirmante.Height := iTop + rbRefreshDocFirmante.Height + 5;

   iTop := gbFirmaPersoneriaFirmante.Top + gbFirmaPersoneriaFirmante.Height;
   gbFormulariosAnexosFirmante.Top := iTop;

   iTop := gbFormulariosAnexosFirmante.Top + gbFormulariosAnexosFirmante.Height;
   gbPep.Top := iTop;

   iTop := iTop + gbPep.Height;

   gbInformeComercial.Top := iTop;

   iTop := iTop + gbInformeComercial.Height;

   gbContrato.Top := iTop;
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.ClickFirmaPresentoFirmante(Sender: TObject);
var
  aCheck: TCheckBox;
begin
  if not TCheckBox(Sender).Checked then
  begin
    aCheck := TCheckBox(FindComponent('checkfirmante_firmatitular_' + IntToStr(TCheckBox(Sender).Tag)));
    if aCheck <> nil then
      aCheck.Checked := False;
  end;
  VerificarDocumentacionFaltanteFila(TCheckBox(Sender).Tag, True);
end;

procedure TfrmModificacionContrato.ClickFirmaTitularFirmante(Sender: TObject);
var
  aCheck: TCheckBox;
begin
  if TCheckBox(Sender).Checked then
  begin
    aCheck := TCheckBox(FindComponent('_checkfirmante_' + IntToStr(TCheckBox(Sender).Tag)));
    if not aCheck.Checked then
    begin
      TCheckBox(Sender).Checked := False;
      InfoHint(aCheck, 'Antes de tildar si el documento fue firmado por el titular/apoderado debe indicar la existencia del documento.');
    end;
  end;
  VerificarDocumentacionFaltanteFila(TCheckBox(Sender).Tag, True);
end;

procedure TfrmModificacionContrato.LockContactoFirmante(const aBoolean: Boolean);
var
  aCheck: TCheckBox;
  iLoop: Integer;
begin
  {if FAgregar then}
    btnBuscarContacto.Enabled := not aBoolean ;
  {else
    btnBuscarContacto.Enabled := False; }


  LockControls([fraContacto, fraCaracter, fraTipoDocumento, cboxSexo, fraTipoFirmante, edNumeroDocumento, edComentarios,
                chkPep, btnRevisionPep, chkFirma1, chkFirma2, cboxEsPep, btnInformeComercial,
                rbRefreshDocFirmante], aBoolean);

  for iLoop := 0 to ComponentCount - 1 do
    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 15) = '_checkfirmante_') then
    begin
      aCheck := TCheckBox(Components[iLoop]);
      aCheck.Enabled := not aBoolean;

      aCheck := TCheckBox(FindComponent('checkfirmante_firmatitular_' + IntToStr(Components[iLoop].Tag)));
      if aCheck<> nil then
        aCheck.Enabled := not aBoolean;

      aCheck := TCheckBox(FindComponent('checkfirmante_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
      if aCheck <> nil then
        aCheck.Enabled := not aBoolean;

      aCheck := TCheckBox(FindComponent('checkfirmante_faltante_' + IntToStr(Components[iLoop].Tag)));
      if aCheck <> nil then
        aCheck.Enabled := not aBoolean;
    end;
end;

procedure TfrmModificacionContrato.tbModifClick(Sender: TObject);
begin
  FidContactoSeleccionado := -1;
  if (edCO_CONTRATO.Text <> '') and (not sdqDatosContacto.IsEmpty) then
  begin
    CargarContacto; //ir al ultimo suceso antes de editar
    FAgregar := False;
    LockContactoFirmante(False);
    tbGuarda.Enabled := True;
    tbCancel.Enabled := True;
    SwitchToolBtnFirmante(False);
    edComentarios.Clear; //para que no se acumulen comentarios.
    fraContacto.SetFocus;
  end;
end;

procedure TfrmModificacionContrato.tbNuevoFirmanteClick(Sender: TObject);
begin
  if edCO_CONTRATO.Text <> '' then
  begin
    FidContactoSeleccionado := -1;
    FAgregar := True;
    LockContactoFirmante(False);
    fraContacto.Clear;
    fraCaracter.Clear;
    FInformeNosis := '';
    FAntInformeNosis := '';
    FRevisionPep := '';
    FExposicion := '';
    FExposicionNum := '';
    FComentariosFirmante := '';
    fraTipoDocumento.Clear;
    edNumeroDocumento.Clear;
    edComentarios.Clear;
    fraTipoFirmante.Clear;
    cboxSexo.ItemIndex := -1;
    ClearPep;
    edRevisionPep.Clear;
    edExp.Clear;
    edExpNum.Clear;
    edExposicion.Clear;
    FCuota := 0;
    FPeriodo := '';
    FNombreContacto := '';
    edRevisionPepComentario.Clear;
    ClearDocumentacion;
    SwitchToolBtnFirmante(False);
  end;
end;

procedure TfrmModificacionContrato.tbGuardaClick(Sender: TObject);
begin
  Verificar((fraContacto.Contacto = ''), fraContacto.FindChildControl('edContacto'), 'El nombre no puede quedar en blanco.');
  Verificar((fraContacto.Cargo = ''), fraContacto.FindChildControl('fraCargo'), 'Debe seleccionar el cargo.');
  Verificar(fraTipoFirmante.IsEmpty, fraTipoFirmante, 'Seleccione el tipo de firmante.');
  Verificar(edNumeroDocumento.Text = '', edNumeroDocumento, 'El número de documento no puede quedar en blanco.');
  Verificar(DocumentoRepetido(edNumeroDocumento.Text), edNumeroDocumento, 'Número de Documento Duplicado.');
  Verificar(fraCaracter.IsEmpty, fraCaracter, 'El Carácter del Firmante está vacío');

  if fpGuardarFirmante.ShowModal = MrOk then
  begin
    BeginTrans(True);
    GuardarEndosoRevision; //Genera un nuevo FIdEndoso segun la opcion;
    DoCargarDatos(ART_EMPTY_ID, FContrato, FFuncion);

   { if FIdContactoSeleccionado<> -1 then
      GuardarFirmante
    else
      GuardarSuceso(GuardarFirmante, FIdEndoso);} //Guardo primero el contacto y luego su pep con su id si es que es uno nuevo

    //GuardarFirmante;
    GuardarSuceso(GuardarFirmante, FIdEndoso, False);
    CargarSucesos;
    sdqDatosContacto.Refresh;
  end
  else
    CargarContacto;

  LockContactoFirmante(True);
  SwitchToolBtnFirmante(True);
end;

procedure TfrmModificacionContrato.tbCancelClick(Sender: TObject);
begin
  FAgregar := False;
  LockContactoFirmante(True);
  SwitchToolBtnFirmante(True);
  ClearPep;
  tbRefresh.Click;
end;

procedure TfrmModificacionContrato.SwitchToolBtnFirmante(const aBoolean: Boolean);
begin
  tbGuarda.Enabled        := not aBoolean;
  tbCancel.Enabled        := not aBoolean;
  tbElim.Enabled          := aBoolean;
  tbModif.Enabled         := aBoolean;
  tbNuevoFirmante.Enabled := aBoolean;
end;

function TfrmModificacionContrato.GuardarFirmante: Integer;
var
  iContactoId: Integer;
  sSqlTrans: TSql;
begin
  iContactoId := 0;

  sSqlTrans := TSQL.Create('act_contacto');
  try
    if (FAgregar) and (FIdContactoSeleccionado = -1) then
    begin
      iContactoId := GetSecNextVal('SEQ_ACT_ID');

      //sSqlTrans.PrimaryKey.Add('ct_id', 'SEQ_ACT_ID.NEXTVAL', false);
      sSqlTrans.Fields.Add('ct_fechaalta', SQL_ACTUALDATE, False);
      sSqlTrans.Fields.Add('ct_usualta',   Sesion.UserId);
      sSqlTrans.Fields.Add('ct_areacarga', Sesion.Sector);
      sSqlTrans.SqlType := stInsert;
    end
    else
    begin
      if FIdContactoSeleccionado <> -1 then
        iContactoId := FIdContactoSeleccionado
      else
        iContactoId := sdqDatosContacto.FieldByName('CT_ID').AsInteger;

      sSqlTrans.Fields.Add('ct_fechamodif', SQL_ACTUALDATE, False);
      sSqlTrans.Fields.Add('ct_usumodif',   Sesion.UserId);
      sSqlTrans.SqlType := stUpdate;
    end;

    sSqlTrans.PrimaryKey.Add('ct_id',          iContactoId, False);
    sSqlTrans.Fields.Add('ct_area',            fraContacto.Area);
    sSqlTrans.Fields.Add('ct_cargo',           fraContacto.Cargo);
    sSqlTrans.Fields.Add('ct_codareafax',      fraContacto.AreaFax);
    sSqlTrans.Fields.Add('ct_contacto',        fraContacto.Contacto);
    sSqlTrans.Fields.Add('ct_direlectronica',  fraContacto.Email);
    sSqlTrans.Fields.Add('ct_fax',             fraContacto.Fax);
    sSqlTrans.Fields.Add('ct_idempresa',       FIdEmpresa, False);
    sSqlTrans.Fields.Add('ct_numerodocumento', edNumeroDocumento.Text);
    sSqlTrans.Fields.Add('ct_remitentecarta',  String(IIF(fraContacto.RemitenteCarta, 'S', 'N')));
    sSqlTrans.Fields.Add('ct_tipodocumento',   fraTipoDocumento.Value);
    sSqlTrans.Fields.Add('ct_idcaracterfirma', fraCaracter.Codigo);

    if cboxSexo.ItemIndex <> -1 then
      sSqlTrans.Fields.Add('ct_sexo', String(IIF(cboxSexo.ItemIndex = 0, 'M','F')));

    sSqlTrans.Fields.Add('ct_tipofirma', fraTipoFirmante.Value);


    //tk 45293
    //if fraTipoFirmante.Value = '1' then
    //  sSqlTrans.Fields.Add('ct_firmante', 'S')
    //else
    //  sSqlTrans.Fields.Add('ct_firmante', 'N');

    //En esta pantalla siempre son firmantes ahora no importa el tipo.
    sSqlTrans.Fields.Add('ct_firmante', 'S');


    EjecutarSQLST(sSqlTrans.Sql);

    if true{FAgregar} then
    begin
      fraContacto.fraTelefonos.CopiarTempATelefonos(iContactoId);
     { if not fraContacto.fraTelefonos.AutoCommit then
        CommitTrans; }
    end;
  finally
    sSqlTrans.Free;
    fraContacto.fraTelefonos.QuitarTelefonosTemporales;
    Result := iContactoId;
  end;
end;

procedure TfrmModificacionContrato.CargarDocumentacionFirmante(const aIdRelaDocumentacion: Integer);
  procedure LimpiarCheckBoxsFirmante(aParentObject: TObject);
  var
    iLoop: Integer;
  begin
    for iLoop := 0 to ComponentCount - 1 do
      if (Components[iLoop] is TCheckBox) and (TControl(Components[iLoop]).Parent = aParentObject) then
        TCheckBox(Components[iLoop]).Checked := False;
  end;

var
  aCheck: TCheckBox;
  aQuery: TSDQuery;
  sSql: String;
begin
  LimpiarCheckBoxsFirmante(gbFirmaPersoneriaFirmante);
  LimpiarCheckBoxsFirmante(gbFormulariosAnexosFirmante);

  // Cargo los datos dinámicos..
  sSql :=
    'SELECT ado.do_id, ado.do_firmatitular, ado.do_firmavendedor, ado.do_iddocumentoafi, ado.do_presente, ado.do_faltante' +
     ' FROM ado_documentacion ado' +
' LEFT JOIN adf_documentoafi adf ON ado.do_iddocumentoafi = adf.df_id' +
    ' WHERE ado.do_idreladocumentacion = :idreladocumentacion';
     // ' AND adf.df_tipodocumento = ''P''';

  aQuery := GetQueryEx(sSql, [aIdRelaDocumentacion]);
  try
    while not aQuery.Eof do
    begin
      aCheck := TCheckBox(FindComponent('_checkfirmante_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_presente').AsString = 'S');
      //ant
      aCheck := TCheckBox(FindComponent('_antcheckfirmante_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_presente').AsString = 'S');


      aCheck := TCheckBox(FindComponent('checkfirmante_firmatitular_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_firmatitular').AsString = 'S');
      //ant
      aCheck := TCheckBox(FindComponent('antcheckfirmante_firmatitular_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_firmatitular').AsString = 'S');


      aCheck := TCheckBox(FindComponent('checkfirmante_firmavendedor_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_firmavendedor').AsString = 'S');
      //ant
      aCheck := TCheckBox(FindComponent('antcheckfirmante_firmavendedor_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_firmavendedor').AsString = 'S');


      aCheck := TCheckBox(FindComponent('checkfirmante_faltante_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_faltante').AsString = 'S');
      //ant
      aCheck := TCheckBox(FindComponent('antcheckfirmante_faltante_' + aQuery.FieldByName('do_iddocumentoafi').AsString));
      if aCheck <> nil then
        aCheck.Checked := (aQuery.FieldByName('do_faltante').AsString = 'S');

      //aCheck.Checked := (afiliacion.get_docfaltante(do_id,contacto);
      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmModificacionContrato.CargarSucesos;
var
  sSql: String;
begin
  if not sdqDatosContacto.IsEmpty then
  begin
    sSql :=
      'SELECT   sf_idreladocumentacion, sf_idrelapersonaexpuesta, sf_idrelainformefirmante, sf_resultado, sf_suceso,' +
              ' sf_idendoso, COALESCE(sf_usubaja, sf_usumodif, sf_usualta) usua_modif,' +
              ' COALESCE(sf_fechabaja, sf_fechamodif, sf_fechaalta) fecha_modif, sf_idcontacto, sf_observaciones, sf_riesgo,' +
              ' sf_riesgovalor' +
         ' FROM asf_sucesofirmante' +
        ' WHERE sf_idcontacto = :idcontacto and sf_idformulario = :formulario' +
     ' ORDER BY sf_suceso DESC';

        //'WHERE pe_idendoso = :idendoso AND pe_idcontacto = :idcontacto ' +
    sdqSucesos.Close;
    sdqSucesos.SQL.Clear;
    sdqSucesos.SQL.Add(sSql);
    //sdqPep.ParamByName('idendoso').AsInteger := sdqDocumentacion.FieldByName('en_id').AsInteger;
    sdqSucesos.ParamByName('idcontacto').AsInteger := sdqDatosContacto.FieldByName('ct_id').AsInteger;
    sdqSucesos.ParamByName('formulario').AsInteger := FIdFormulario;
    sdqSucesos.Open;
  end;
end;

procedure TfrmModificacionContrato.sdqSucesosAfterScroll(DataSet: TDataSet);
begin
  with sdqSucesos do
    if not IsEmpty then
    begin
      edSuceso.Text          := FieldByName('sf_suceso').AsString;
      edUsuarioFirmante.Text := FieldByName('usua_modif').AsString;
      edFechaFirmante.Date   := FieldByName('fecha_modif').AsDateTime;

      tbPrimerSuceso.Enabled    := (RecNo < (RecordCount {$IFDEF VER150}- 1{$ENDIF}));
      tbAnteriorSuceso.Enabled  := (RecNo < (RecordCount {$IFDEF VER150}- 1{$ENDIF}));
      tbProximoSuceso.Enabled   := (RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});
      tbUltimoSuceso.Enabled    := (RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF});

      CargarInformeComercial;
    end;
end;

procedure TfrmModificacionContrato.tbAnteriorSucesoClick(Sender: TObject);
begin
  Verificar(sdqSucesos.IsEmpty, dbGridContactos, 'No hay datos.');
  sdqSucesos.Next;
  RefreshAfterScroll;
end;

procedure TfrmModificacionContrato.tbProximoSucesoClick(Sender: TObject);
begin
  Verificar(sdqSucesos.IsEmpty, dbGridContactos, 'No hay datos.');
  sdqSucesos.Prior;
  RefreshAfterScroll;
end;

procedure TfrmModificacionContrato.tbUltimoSucesoClick(Sender: TObject);
begin
  Verificar(sdqSucesos.IsEmpty, dbGridContactos, 'No hay datos.');
  sdqSucesos.First;
  RefreshAfterScroll;
end;

procedure TfrmModificacionContrato.tbPrimerSucesoClick(Sender: TObject);
begin
  Verificar(sdqSucesos.IsEmpty, dbGridContactos, 'No hay datos.');
  sdqSucesos.Last;
  RefreshAfterScroll;
end;

procedure TfrmModificacionContrato.tsFirmanteEnter(Sender: TObject);
begin
  tbReactivar.Enabled := False;
  CargarSucesos;
  edSuceso.Clear;
  FInformeNosis := '';
  FAntInformeNosis := '';
  FRevisionPep := '';
  FExposicion := '';
  FExposicionNum := '';
  FNombreContacto := '';
  FComentariosFirmante := '';
  ClearPep;
  ClearDocumentacion;
  edRevisionPep.Clear;
  edExp.Clear;
  edExpNum.Clear;
  edExposicion.Clear;
  edRevisionPepComentario.Clear;
  FCuota := 0;
  FPeriodo := '';
  tbRefresh.Click;

  if sdqDatosContacto.IsEmpty then
  begin
    tbElim.Enabled := False;
    btnVisualizar.Enabled := False;
  end
  else
  begin
    tbElim.Enabled := True;
    btnVisualizar.Enabled := True;
  end;
end;

procedure TfrmModificacionContrato.GuardarSuceso(const aIdContacto, aIdEndoso: Integer;const aEsReemplazado: Boolean);
var
  iDocumentacion: Integer;
  iRelaInformeFirmante: Integer;
  iRelaPersonaExpuesta: Integer;
  iSuceso: Integer;
  sSql: String;
begin
  try
    if HuboCambioPep then
      begin
        sSql := 'SELECT art.seq_asf_idrelapersonaexpuesta.NEXTVAL FROM DUAL';
        iRelaPersonaExpuesta := ValorSqlIntegerEx(sSql, []);
        GuardarPep(aIdContacto, aIdEndoso, iRelaPersonaExpuesta);
      end
      else
        if FAgregar then
          iRelaPersonaExpuesta := 0
        else
          iRelaPersonaExpuesta := sdqSucesos.FieldByName('sf_idrelapersonaexpuesta').AsInteger;

    if HuboCambioDocumentacion then
      begin
        sSql := 'SELECT art.seq_asf_idreladocumentacion.NEXTVAL FROM DUAL';
        iDocumentacion := ValorSqlIntegerEx(sSql, []);
        GuardarDatosDocumentacionFirmante(FIdEndoso, iDocumentacion, aIdContacto);
      end
      else
        if FAgregar then
          iDocumentacion := 0
        else
          iDocumentacion := sdqSucesos.FieldByName('sf_idreladocumentacion').AsInteger;

    //if Modificadoinformefirmante
    if HuboCambioInformeNosis then
    begin
      sSql := 'SELECT NVL(MAX(if_idrelainformefirmante), -1) + 1 res FROM aif_informefirmante';
      iRelaInformeFirmante := ValorSqlIntegerEx(sSql, []);
      GuardarDatosInformeNosis(iRelaInformeFirmante, aIdContacto, FBusqueda);
    end
    else
      if FAgregar then   //si no hubo cambios y es agregar guardar 0
        iRelaInformeFirmante := 0
      else          //sino si agarrar del query el numero de antes
        iRelaInformeFirmante := sdqSucesos.FieldByName('sf_idrelainformefirmante').AsInteger;

    //Selecciono el numero de suceso a guardar
    iSuceso := GetProximoSuceso(aIdContacto, FIdFormulario);

    if HuboCambioDocumentacion or HuboCambioPep or HuboCambioInformeNosis or FAgregar then
    begin
      sSql :=
        'INSERT INTO asf_sucesofirmante' +
                  ' (sf_idformulario, sf_idcontacto, sf_suceso, sf_idendoso, sf_observaciones, sf_resultado, sf_usualta, sf_fechaalta,' +
                   ' sf_fecha, sf_idreladocumentacion, sf_idrelapersonaexpuesta, sf_idrelainformefirmante, sf_riesgo, sf_riesgovalor)' +
           ' VALUES (:idformulario, :idcontacto, :suceso, :idendoso, :observaciones, :resultado, :usualta, SYSDATE, SYSDATE,' +
                     SqlInt(iDocumentacion, True) + ', ' + SqlInt(iRelaPersonaExpuesta, True) + ', ' +
                     SqlInt(iRelaInformeFirmante, True) + ', :riesgo, :riesgoval)';
      EjecutarSqlSTEx(sSql, [FIdFormulario, aIdContacto, iSuceso, aIdEndoso, FComentariosFirmante, FRevisionPep, Sesion.UserID, FExposicion, FExposicionNum]);
    end;

    //Si Cambia el resultado de RevisionPEP hacer otro Suceso. (dijo EVila)
    if (FRevisionPep <> edRevisionPep.Text) or (FComentariosFirmante <> edComentarios.Text) or (FExposicion <> edExp.Text) or (FExposicionNum <> edExpNum.Text) then
    begin
      iSuceso := GetProximoSuceso(aIdContacto, FIdFormulario);
      sSql :=
        'INSERT INTO asf_sucesofirmante' +
                  ' (sf_idformulario, sf_idcontacto, sf_suceso, sf_idendoso, sf_observaciones, sf_resultado, sf_usualta, sf_fechaalta,' +
                   ' sf_fecha, sf_idreladocumentacion, sf_idrelapersonaexpuesta, sf_idrelainformefirmante,' +
                   ' sf_periodo, sf_prima_anual, sf_riesgo, sf_riesgovalor)' +
           ' VALUES (:idformulario, :idcontacto, :suceso, :idendoso, :observaciones, :resultado, :usualta, SYSDATE, SYSDATE,' +
                     SqlInt(iDocumentacion, True) + ', ' + SqlInt(iRelaPersonaExpuesta, True) + ', ' +
                     SqlInt(iRelaInformeFirmante, True) + ',:periodo, :primaanual, :riesgo, :riesgovalor)';
      EjecutarSqlSTEx(sSql, [FIdFormulario, aIdContacto, iSuceso, aIdEndoso, edComentarios.Text, edRevisionPep.Text,
                             Sesion.UserID, FPeriodo, FCuota, edExp.Text, edExpNum.Text]);
    end;

    if aEsReemplazado then
    begin
      iSuceso := GetProximoSuceso(aIdContacto, FIdFormulario);
      //si lo reemplazan guardar en comentarios cual tenia antes
      edComentarios.Text := edComentarios.Text + ' <- ' + DateToStr(Date) +' Se reemplazó firmante. Anterior: ' + FNombreContacto+ ' ->';
      sSql :=
        'INSERT INTO asf_sucesofirmante' +
                  ' (sf_idformulario, sf_idcontacto, sf_suceso, sf_idendoso, sf_observaciones, sf_resultado, sf_usualta, sf_fechaalta,' +
                   ' sf_fecha, sf_idreladocumentacion, sf_idrelapersonaexpuesta, sf_idrelainformefirmante,' +
                   ' sf_periodo, sf_prima_anual, sf_suceso_contactomigra, sf_riesgo, sf_riesgovalor)' +
           ' VALUES (:idformulario, :idcontacto, :suceso, :idendoso, :observaciones, :resultado, :usualta, SYSDATE, SYSDATE,' +
                     SqlInt(iDocumentacion, True) + ', ' + SqlInt(iRelaPersonaExpuesta, True) + ', ' +
                     SqlInt(iRelaInformeFirmante, True) + ',:periodo, :primaanual, :sucesoreemplazo, :riesgo, :riesgonum)';
      EjecutarSqlSTEx(sSql, [FIdFormulario, aIdContacto, iSuceso, aIdEndoso, edComentarios.Text, edRevisionPep.Text, Sesion.UserID, FPeriodo, FCuota, iSuceso, edExp.Text, edExpNum.Text]);
    end;


    //En caso de que cambien el nombre del firmante, guardar en observaciones el anterior.
    if (fraContacto.Contacto <> FNombreContacto) and (FNombreContacto <> '') then
    begin
      iSuceso := GetProximoSuceso(aIdContacto, FIdFormulario);

      FComentariosFirmante := ' <- ' + DateToStr(Date) +' Se reemplazó firmante. Anterior: ' + FNombreContacto+ ' ->';
      edComentarios.Text := FComentariosFirmante;
      sSql :=
        'INSERT INTO asf_sucesofirmante' +
                  ' (sf_idformulario, sf_idcontacto, sf_suceso, sf_idendoso, sf_observaciones, sf_resultado, sf_usualta, sf_fechaalta,' +
                   ' sf_fecha, sf_idreladocumentacion, sf_idrelapersonaexpuesta, sf_idrelainformefirmante, sf_riesgo, sf_riesgovalor)' +
           ' VALUES (:idformulario, :idcontacto, :suceso, :idendoso, :observaciones, :resultado, :usualta, SYSDATE, SYSDATE,' +
                     SqlInt(iDocumentacion, True) + ', ' + SqlInt(iRelaPersonaExpuesta, True) + ', ' +
                     SqlInt(iRelaInformeFirmante, True) + ', :riesgo, :riesgonum)';
      EjecutarSqlSTEx(sSql, [FIdFormulario, aIdContacto, iSuceso, aIdEndoso, FComentariosFirmante, FRevisionPep, Sesion.UserID, FExposicion, FExposicionNum]);
    end;

    //*** Tarea SIC
    if (btnBuscarContacto.Caption <> 'Reemplazar') {and
       (ValorSqlEx('SELECT art.afiliacion.falta_doc_contrato(:id) FROM DUAL', [FContrato]) <> 'Contrato con más de un firmante')} then //Esto previene que se ejecute una tarea sic cuando estan reemplazando
      DoTareaSic(FIDFormulario);  //el contacto de migracion.
    //else
    //  MsgBox('Existen 2 Firmantes de Contrato para este contrato.');

    CommitTrans(True);
  except
    Rollback(True);
    ShowMessage('Error SQL al guardar datos');
  end;
  FAgregar := False;
end;

procedure TfrmModificacionContrato.ClearPep;
begin
  edSuceso.Text := '';
  edInformeFecha.Clear;
  chkPep.Checked := False;
  chkFirma1.Checked := False;
  chkFirma2.Checked := False;
  cboxEsPep.ItemIndex := 2;  //en blanco
  FPep := False;
  FEsPep := 2; //en blanco
  FFirma1 := False;
  FFirma2 := False;
  edUsuarioFirmante.Text := '';
  edFechaFirmante.Text := '';

  tbPrimerSuceso.Enabled   := False;
  tbAnteriorSuceso.Enabled := False;
  tbProximoSuceso.Enabled  := False;
  tbUltimoSuceso.Enabled   := False;
end;

procedure TfrmModificacionContrato.GuardarDatosDocumentacionFirmante(const aIdEndoso, aIdRelaDocumentacion,
                                                                     aIdContacto: Integer);
var
  aCheck: TCheckBox;
  aSql: TSQL;
  iIdFormulario: Integer;
  iLoop: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT hc_idformulario' +
     ' FROM ahc_historicocontrato, aen_endoso' +
    ' WHERE hc_id = en_idhistoricocontrato' +
      ' AND en_id = :idendoso';
  iIdFormulario := ValorSqlIntegerEx(sSql, [aIdEndoso]);

  for iLoop := 0 to ComponentCount - 1 do
  begin
    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 15) = '_checkfirmante_') then
    begin
      aSql := TSQL.Create('ado_documentacion');
      try
        aSql.SqlType := stInsert;
        aSql.PrimaryKey.Add('do_id', 0);
        aSql.Fields.Add('do_fechaalta',           SQL_DATETIME, False);
        aSql.Fields.Add('do_iddocumentoafi',      Components[iLoop].Tag);
        aSql.Fields.Add('do_idendoso',            aIdEndoso);
        aSql.Fields.Add('do_idformulario',        iIdFormulario);
        aSql.Fields.Add('do_usualta',             Sesion.UserID);
        aSql.Fields.Add('do_idreladocumentacion', aIdRelaDocumentacion);
        aSql.Fields.Add('do_idcontacto',          aIdContacto);

        aCheck := TCheckBox(Components[iLoop]);
        aSql.Fields.Add('do_presente', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('checkfirmante_firmatitular_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_firmatitular', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('checkfirmante_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_firmavendedor', String(IIF(aCheck.Checked, 'S', 'N')));

        aCheck := TCheckBox(FindComponent('checkfirmante_faltante_' + IntToStr(Components[iLoop].Tag)));
        if aCheck <> nil then
          aSql.Fields.Add('do_faltante', String(IIF(aCheck.Checked, 'S', 'N')));

        EjecutarSqlST(aSql.Sql);
      finally
        aSql.Free;
      end;
    end;
  end;
end;

procedure TfrmModificacionContrato.CargarContacto;
begin
  LockContactoFirmante(True);
  SwitchToolBtnFirmante(True);
  ClearDocumentacion;
  ClearPep;

  if not sdqDatosContacto.IsEmpty then
  begin
    if sdqDatosContacto.FieldByName('ct_fechabaja').IsNull then
    begin
      tbReactivar.Enabled := False;
      tbModif.Enabled := True;
      tbElim.Enabled := True;
      if AnsiContainsStr (sdqDatosContacto.FieldByName('ct_contacto').AsString, 'CONTACTO MIGRACION') then
        btnBuscarContacto.Caption := 'Reemplazar'
      else
        btnBuscarContacto.Caption := 'Buscar';
    end
    else
    begin
      tbReactivar.Enabled := True;
      tbModif.Enabled := False;
      tbElim.Enabled := False;
    end;

    CargarDatosFirmante;
    CargarSucesos;
    RefreshAfterScroll;
  end;
end;

procedure TfrmModificacionContrato.tbElimClick(Sender: TObject);
begin
  Verificar(edCO_CONTRATO.Text = '', dbGridContactos, 'No hay contrato seleccionado');
  //Verificar(sdqSucesos.IsEmpty, dbGridContactos, 'No hay contacto seleccionado.');
  Verificar(sdqDatosContacto.IsEmpty, dbGridContactos, 'No hay contacto seleccionado.');
  Verificar(GetCantidadFirmatesContrato(FContrato) < 2, tbElim, 'Antes de eliminar el único firmante del contrato, debe seleccionar otro');

  if not MsgAsk(sdqDatosContacto.FieldByName('CT_CONTACTO').AsString + #13#10 + '¿ Desea eliminar el contacto seleccionado ?') then
    Abort;

  SetBajaContacto(sdqDatosContacto.FieldByName('ct_id').AsInteger);

  GuardarSucesoBajaReactivar(sdqDatosContacto.FieldByName('ct_id').AsInteger, FIdEndoso, False);

  LockContactoFirmante(True);
  SwitchToolBtnFirmante(True);
  tbRefresh.Click;
end;

procedure TfrmModificacionContrato.btnInformeComercialClick(Sender: TObject);
var
  aMs: TStringStream;
  sSql: String;
begin
  if FAgregar then
  begin
    FAntInformeNosis := '';
    Verificar((cboxSexo.ItemIndex = -1), cboxSexo, 'No hay sexo definido para ejecutar esta acción.');
    Verificar((edNumeroDocumento.Text = ''), edNumeroDocumento, 'Debe cargar el numero de documento.');
    RecuperarInformeNosis(edNumeroDocumento.Text, IIF((cboxSexo.ItemIndex = 0), 'M', 'F'));
  end
  else
  begin
    //Guardo el Informe como esta Ahora
    sSql :=
      'SELECT if_resultado AS resultado' +
       ' FROM aif_informefirmante' +
      ' WHERE if_idrelainformefirmante = ' + SqlInt(sdqSucesos.FieldByName('sf_idrelainformefirmante').AsInteger);

    aMs := TStringStream.Create('');
    try
      BlobSql(sSql, aMs);
      FAntInformeNosis := aMs.DataString;
    finally
      aMs.Free;
    end;

    Verificar((cboxSexo.ItemIndex = -1), cboxSexo, 'No hay sexo definido para ejecutar esta acción.');
    Verificar((edNumeroDocumento.Text = ''), edNumeroDocumento, 'Debe cargar el numero de documento.');

    RecuperarInformeNosis(edNumeroDocumento.Text, IIF((cboxSexo.ItemIndex = 0), 'M', 'F'));
   end;
end;

procedure TfrmModificacionContrato.CargarPep(const aIdRelaPersonaExpuesta: Integer);
var
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT pe_idcontacto, pe_presente, pe_firma1, pe_firma2, pe_expuesta' +
     ' FROM ape_personaexpuesta' +
    ' WHERE pe_idrelapersonaexpuesta = :relapersonaexpuesta';
  aQuery := GetQueryEx(sSql, [sdqSucesos.FieldByName('sf_idrelapersonaexpuesta').AsInteger]);
  try
    if not aQuery.Eof then
    begin
      chkPep.Checked    := IIF(aQuery.FieldByName('pe_presente').AsString = 'S', True, False);
      chkFirma1.Checked := IIF(aQuery.FieldByName('pe_firma1').AsString = 'S', True, False);
      chkFirma2.Checked := IIF(aQuery.FieldByName('pe_firma2').AsString = 'S', True, False);

      if aQuery.FieldByName('pe_expuesta').IsNull then
        cboxEsPep.ItemIndex := 2;
      if aQuery.FieldByName('pe_expuesta').AsString = 'B' then
        cboxEsPep.ItemIndex := 2;
      if aQuery.FieldByName('pe_expuesta').AsString = 'N' then
        cboxEsPep.ItemIndex := 0;
      if aQuery.FieldByName('pe_expuesta').AsString = 'S' then
        cboxEsPep.ItemIndex := 1;
    end
    else
    begin
      chkPep.Checked      := False;
      chkFirma1.Checked   := False;
      chkFirma2.Checked   := False;
      cboxEsPep.ItemIndex := -1;
    end;
  finally
    aQuery.Free;
  end;

  FPep    := chkPep.Checked;
  FFirma1 := chkFirma1.Checked;
  FFirma2 := chkFirma2.Checked;
  FEsPep  := cboxEsPep.ItemIndex;
end;

procedure TfrmModificacionContrato.GuardarPep(const aIdContacto, aIdEndoso, aIdRelaPersonaExpuesta: Integer);
var
  sExpuesta: String;
  sFirma1: String;
  sFirma2: String;
  sPresente: String;
  sSql: String;
begin
  sPresente := IIF(chkPep.Checked, 'S', 'N');
  sFirma1   := IIF(chkFirma1.Checked, 'S', 'N');
  sFirma2   := IIF(chkFirma2.Checked, 'S', 'N');

  case cboxEsPep.ItemIndex of
    -1: sExpuesta := '';
     0: sExpuesta := 'N';
     1: sExpuesta := 'S';
     2: sExpuesta := 'B';
  end;

  sSql :=
    'INSERT INTO ape_personaexpuesta' +
              ' (pe_idformulario, pe_idcontacto, pe_contrato, pe_idendoso, pe_presente, pe_firma1, pe_firma2,' +
               ' pe_expuesta, pe_usualta, pe_idrelapersonaexpuesta, pe_fechaalta)' +
       ' VALUES (:idformulario, :idcontacto, :contrato, :idendoso, :presente, :firma1, :firma2, :expuesta, :usualta,' +
               ' :idrelapersonaexpuesta, SYSDATE)';
  EjecutarSqlSTEx(sSql, [FIdFormulario, aIdContacto, StrToInt(edCO_CONTRATO.Text), aIdEndoso, sPresente, sFirma1,
                         sFirma2, sExpuesta, Sesion.UserID, aIdRelaPersonaExpuesta]);
end;

function TfrmModificacionContrato.HuboCambioDocumentacion: Boolean;
 function VerificarSiHayCambio(aCheck, aAntCheck: TCheckbox): Boolean;
 begin
   if (aCheck <> nil) and (aAntCheck <> nil) then
   begin
     if aCheck.Checked <> aAntCheck.Checked then
       Result := True
     else
       Result := False;
   end
   else
     Result := False;
 end;
var
  aCheck: TCheckBox;
  aAntCheck: TCheckBox;
  bParcial: Boolean; //resultado parcial
  iLoop: Integer;
begin
  bParcial := False;

  for iLoop := 0 to ComponentCount - 1 do
  begin
    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 15) = '_checkfirmante_') then
    begin
      aCheck := TCheckBox(Components[iLoop]);
      aAntCheck := TCheckBox(FindComponent('_antcheckfirmante_' + IntToStr(Components[iLoop].Tag)));
      if VerificarSiHayCambio(aCheck, aAntCheck) then
      begin
        bParcial := True;
        Break;
      end;

      aCheck := TCheckBox(FindComponent('checkfirmante_firmatitular_' + IntToStr(Components[iLoop].Tag)));
      aAntCheck := TCheckBox(FindComponent('antcheckfirmante_firmatitular_' + IntToStr(Components[iLoop].Tag)));
      if VerificarSiHayCambio(aCheck, aAntCheck) then
      begin
        bParcial := True;
        Break;
      end;

      aCheck := TCheckBox(FindComponent('checkfirmante_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
      aAntCheck := TCheckBox(FindComponent('antcheckfirmante_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
      if VerificarSiHayCambio(aCheck, aAntCheck) then
      begin
        bParcial := True;
        Break;
      end;

      aCheck := TCheckBox(FindComponent('checkfirmante_faltante_' + IntToStr(Components[iLoop].Tag)));
      aAntCheck := TCheckBox(FindComponent('antcheckfirmante_faltante_' + IntToStr(Components[iLoop].Tag)));
      if VerificarSiHayCambio(aCheck, aAntCheck) then
      begin
        bParcial := True;
        Break;
      end;
    end;
  end;
  Result := bParcial;
end;

function TfrmModificacionContrato.HuboCambioPep: Boolean;
begin
  Result := (chkPep.Checked <> FPep) or
            (chkFirma1.Checked <> FFirma1) or
            (chkFirma2.Checked <> FFirma2) or
            (cboxEsPep.ItemIndex <> FEsPep);
end;

procedure TfrmModificacionContrato.btnRevisionPepClick(Sender: TObject);
var
  aQuery: TSDQuery;
  sEsPep: String;
  sSql: String;
begin
  if not FAgregar then
  begin
    if (cboxEsPep.ItemIndex = -1) or (cboxEsPep.ItemIndex = 0) or (cboxEsPep.ItemIndex = 2) then
      sEsPep := 'N';
    if cboxEsPep.ItemIndex = 1 then
      sEsPep := 'S';

    sSql := 'SELECT pep.controlpep.ctrl_pep(:ncontrato, :idcontacto) FROM DUAL';
    edRevisionPep.Text := ValorSqlEx(sSql, [StrToInt(edCO_CONTRATO.Text), sdqDatosContacto.FieldByName('ct_id').AsInteger]);

    with sdspExposicion do
    begin
      ParamByName('n_contrato').AsInteger  := StrToInt(edCO_CONTRATO.Text);
      ParamByName('id_contacto').AsInteger  := sdqDatosContacto.FieldByName('ct_id').AsInteger;
      //ParamByName('s_es_pep').AsString := // Esto va NULL

      ExecProc;

      if ParamByName('s_exposicion').AsString = 'B' then
        edExposicion.Text := 'Riesgo ' + ParamByName('n_valor').AsString + ' - Bajo';
      if ParamByName('s_exposicion').AsString = 'M' then
        edExposicion.Text := 'Riesgo ' + ParamByName('n_valor').AsString + ' - Medio';
      if ParamByName('s_exposicion').AsString = 'A' then
        edExposicion.Text := 'Riesgo ' + ParamByName('n_valor').AsString + ' - Alto';

      edExp.Text := Trim(ParamByName('s_exposicion').AsString);
      edExpNum.Text := ParamByName('n_valor').AsString;
    end;

    {sSql := 'SELECT zrc.rc_periodo AS periodo,' +
                    ' CASE' +
                      ' WHEN SUBSTR(zrc.rc_periodo, 5, 2) IN(''06'', ''12'') THEN ROUND(zrc.rc_devengadocuota / 1.5, 2)' +
                    ' ELSE zrc.rc_devengadocuota' +
                    ' END AS cuota' +
                ' FROM cob.zrc_resumencobranza zrc' +
              ' WHERE rc_id = (SELECT MAX(z.rc_id)' +
                              ' FROM cob.zrc_resumencobranza z' +
                              ' WHERE z.rc_periodo > TO_CHAR(ADD_MONTHS(SYSDATE, -13), ''YYYYMM'')' +
                              ' AND z.rc_periodo < TO_CHAR(SYSDATE, ''YYYYMM'')' +
                              ' AND z.rc_contrato = :contrato)';}
    sSql  := 'SELECT zrc.rc_periodo AS periodo, ' +
             '        CASE ' +
             '          WHEN SUBSTR(zrc.rc_periodo, 5, 2) IN(''06'', ''12'') THEN ROUND(zrc.rc_devengadocuota / 1.5, 2) ' +
             '        ELSE zrc.rc_devengadocuota ' +
             '        END AS cuota ' +
             '      FROM cob.zrc_resumencobranza zrc ' +
             '    WHERE zrc.rc_contrato = :contrato ' +
             '    AND zrc.rc_periodo = (SELECT MAX(z.rc_periodo) ' +
             '                                   FROM cob.zrc_resumencobranza z ' +
             '                                  WHERE z.rc_periodo > TO_CHAR(ADD_MONTHS(SYSDATE, -13), ''YYYYMM'') ' +
             '                                    AND z.rc_periodo < TO_CHAR(SYSDATE, ''YYYYMM'') ' +
             '                                    AND z.rc_contrato = zrc.rc_contrato)' ;


    aQuery := GetQueryEx(sSql, [StrToInt(edCO_CONTRATO.Text)]);
    try
      if not aQuery.Eof then
      begin
        FPeriodo := aQuery.FieldByName('periodo').AsString;
        FCuota   := aQuery.FieldByName('cuota').AsFloat;
      end;
    finally
      aQuery.Free;
    end;

    if edRevisionPep.Text <> '' then
    begin
      sSql := 'SELECT tr_descripcion FROM pep.ptr_tablaresultado WHERE tr_resultado =:resultado';
      edRevisionPepComentario.Text := ValorSqlEx(sSql, [edRevisionPep.Text])
    end
    else
      edRevisionPepComentario.Clear;
  end
  else
  begin
    edRevisionPep.Clear;
    edExposicion.Clear;
    edExp.Clear;
    edExpNum.Clear;
    edRevisionPepComentario.Clear
  end;
end;

procedure TfrmModificacionContrato.ClickFirmaVendedorFirmante(Sender: TObject);
begin
  VerificarDocumentacionFaltanteFila(TCheckBox(Sender).Tag, True);
end;

function TfrmModificacionContrato.DocumentoRepetido(const aDocumento: String): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM act_contacto' +
    ' WHERE ct_idempresa = (SELECT co_idempresa' +
                            ' FROM aco_contrato' +
                           ' WHERE co_contrato = :contrato)' +
                             ' AND ct_fechabaja IS NULL' +
                             ' AND ct_numerodocumento = :numerodocumento';
  if not FAgregar then
    sSql := sSql + ' AND ct_id <> ' + SqlValue(sdqDatosContacto.FieldByName('ct_id').AsInteger);
  if FidContactoSeleccionado <> -1 then
    sSql := sSql + ' AND ct_id <> ' + SqlValue(FidContactoSeleccionado);

  Result := ExisteSqlEx(sSql, [edCO_CONTRATO.Value, aDocumento]);
end;

procedure TfrmModificacionContrato.ClearDocumentacion;
var
  aCheck: TCheckBox;
  aAntCheck: TCheckBox;
  iLoop: Integer;
begin
  for iLoop := 0 to ComponentCount - 1 do
    if (Components[iLoop] is TCheckBox) and (Copy(Components[iLoop].Name, 1, 15) = '_checkfirmante_') then
    begin
      aCheck := TCheckBox(Components[iLoop]);
      aCheck.Checked := False;
      aAntCheck := TCheckBox(FindComponent('_antcheckfirmante_' + IntToStr(Components[iLoop].Tag)));
      aAntCheck.Checked := False;

      aCheck := TCheckBox(FindComponent('checkfirmante_firmatitular_' + IntToStr(Components[iLoop].Tag)));
      aAntCheck := TCheckBox(FindComponent('antcheckfirmante_firmatitular_' + IntToStr(Components[iLoop].Tag)));
      if (aCheck <> nil) and (aAntCheck <> nil) then
      begin
        aCheck.Checked := False;
        aAntCheck.Checked := False;
      end;

      aCheck := TCheckBox(FindComponent('checkfirmante_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
      aAntCheck := TCheckBox(FindComponent('antcheckfirmante_firmavendedor_' + IntToStr(Components[iLoop].Tag)));
      if (aCheck <> nil) and (aAntCheck <> nil) then
      begin
        aCheck.Checked := False;
        aAntCheck.Checked := False;
      end;

      aCheck := TCheckBox(FindComponent('checkfirmante_faltante_' + IntToStr(Components[iLoop].Tag)));
      aAntCheck := TCheckBox(FindComponent('antcheckfirmante_faltante_' + IntToStr(Components[iLoop].Tag)));
      if (aCheck <> nil) and (aAntCheck <> nil) then
      begin
        aCheck.Checked := False;
        aAntCheck.Checked := False;
      end;
    end;
end;

procedure TfrmModificacionContrato.RefreshAfterScroll;
var
  sSql: String;
begin
  if not sdqSucesos.IsEmpty then
  begin
    CargarPep(sdqSucesos.FieldByName('sf_idrelapersonaexpuesta').AsInteger);
    CargarDocumentacionFirmante(sdqSucesos.FieldByName('sf_idreladocumentacion').AsInteger);
    edRevisionPep.Text := sdqSucesos.FieldByName('sf_resultado').AsString;
    FRevisionPep := sdqSucesos.FieldByName('sf_resultado').AsString;

    FExposicion := Trim(sdqSucesos.FieldByName('sf_riesgo').AsString);
    FExposicionNum := sdqSucesos.FieldByName('sf_riesgovalor').AsString;

    edExposicion.Clear;
    if Trim(sdqSucesos.FieldByName('sf_riesgo').AsString) = 'B' then
      edExposicion.Text := 'Riesgo ' + sdqSucesos.FieldByName('sf_riesgovalor').AsString + ' - Bajo';
    if Trim(sdqSucesos.FieldByName('sf_riesgo').AsString) = 'M' then
      edExposicion.Text := 'Riesgo ' + sdqSucesos.FieldByName('sf_riesgovalor').AsString + ' - Medio';
    if Trim(sdqSucesos.FieldByName('sf_riesgo').AsString) = 'A' then
      edExposicion.Text := 'Riesgo ' + sdqSucesos.FieldByName('sf_riesgovalor').AsString + ' - Alto';

    edExp.Text := Trim(sdqSucesos.FieldByName('sf_riesgo').AsString);
    edExpNum.Text := sdqSucesos.FieldByName('sf_riesgovalor').AsString;

    FComentariosFirmante := sdqSucesos.FieldByName('sf_observaciones').AsString;
    edComentarios.Text := sdqSucesos.FieldByName('sf_observaciones').AsString;
    
    if edRevisionPep.Text <> '' then
    begin
      sSql := 'SELECT tr_descripcion FROM pep.ptr_tablaresultado WHERE tr_resultado =:resultado';
      edRevisionPepComentario.Text := ValorSqlEx(sSql, [edRevisionPep.Text]);
    end
    else
      edRevisionPepComentario.Clear;
  end;
end;

procedure TfrmModificacionContrato.btnAceptarFirmanteClick(Sender: TObject);
begin
  fpGuardarFirmante.ModalResult := MrOk;
end;

procedure TfrmModificacionContrato.btnCerrarFirmanteClick(Sender: TObject);
begin
  fpGuardarFirmante.Close;
end;

function TfrmModificacionContrato.HuboCambioInformeNosis: Boolean;
begin
  Result := (FInformeNosis <> FAntInformeNosis);
end;

procedure TfrmModificacionContrato.GuardarDatosInformeNosis(const aidRela, aIdContacto: Integer; const sBusqueda: String);
var
  aMs: TStringStream;
  sSql: String;
begin
  // No se debería guardar si no hay búsqueda..
  if sBusqueda = '' then
    Exit;

  aMs := TStringStream.Create(FInformeNosis);
  aMs.Seek(0, soFromBeginning);
  try
    try
     // BeginTrans(True);
      sSql :=
        'INSERT INTO aif_informefirmante' +
                   ' (if_idrelainformefirmante, if_idcontacto, if_busqueda, if_fecha)' +
            ' VALUES (:aidrela, :aidcontacto, :busqueda, SYSDATE)';
      EjecutarSqlSTEx(sSql,[aIdRela, aIdContacto, sBusqueda]);

      sSql :=
        'UPDATE aif_informefirmante' +
          ' SET if_resultado = :nosisresultado' +
        ' WHERE if_idrelainformefirmante = ' + SqlInt(aidRela);
      SaveBlob(sSql, aMs);
      //CommitTrans(True);
    finally
      aMs.Free;
    end;
  except
    Rollback(True);
  end;
end;

procedure TfrmModificacionContrato.CargarInformeComercial;
var
  aQuery: TSDQuery;
  sSql: String;
begin
  edInformeFecha.Clear;

  sSql :=
    'SELECT MAX(if_fecha) AS fecha' +
     ' FROM aif_informefirmante' +
    ' WHERE if_idcontacto = :id';
  aQuery := GetQueryEx(sSql, [sdqDatosContacto.FieldByName('ct_id').AsInteger]);
  try
    if not aQuery.Eof then
      edInformeFecha.Text := aQuery.FieldByName('fecha').AsString;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmModificacionContrato.btnVisualizarClick(Sender: TObject);
var
  aMs: TStringStream;
  sInforme: String;
  sSql: String;
begin
  if (FInformeNosis = '') and (not FAgregar) then
  begin
    Verificar(sdqSucesos.IsEmpty, btnInformeComercial, 'Sin informe cargado.');
    Verificar((sdqSucesos.FieldByName('sf_idrelainformefirmante').AsInteger = 0), btnInformeComercial, 'Sin Informe cargado.');
    aMs := TStringStream.Create('');
    try
      sSql :=
        'SELECT if_resultado AS resultado' +
         ' FROM aif_informefirmante' +
        ' WHERE if_idrelainformefirmante = ' + SqlInt(sdqSucesos.FieldByName('sf_idrelainformefirmante').AsInteger) +
          ' AND if_idcontacto =' + SqlInt(sdqSucesos.FieldByName('sf_idcontacto').AsInteger);
      BlobSql(sSql, aMs);

      if aMs.DataString <> '' then
        sInforme := aMs.DataString
    finally
      aMs.Free;
    end;
  end;

  with TfrmImportInformeComercial.Create(Self) do
  try
    if FInformeNosis = '' then
      sInHtml := sInforme   //Si tiene asignado algo a sInHtml pasa solo a modo visualizar.
    else
      sInHtml := FInformeNosis;
    ShowModal;
  finally
    btnVisualizar.Enabled := True;
    Free;
  end;
end;

procedure TfrmModificacionContrato.GuardarEndosoRevision;
begin
  if rbRevisionLegajo.Checked then
    GenerarMovimiento('506');

  if rbRevisionIncorporaDoc.Checked then
    GenerarMovimiento('505');

  if rbRevisionDDJJ.Checked then
    GenerarMovimiento('507');

  if rbRevisionNada.Checked then
  begin
      //Supuestamente aca no hay que hacer nada
  end;
end;

procedure TfrmModificacionContrato.GenerarMovimiento(const aNumeroMovimiento: String);
var
  sSql: String;
begin
  if MsgAsk('Esta acción generará un nuevo movimiento. ¿ Desea continuar ?') then
  try
    //ActualizarDocumentacionFaltante;
    BeginTrans(True);

    sSql :=
      'UPDATE aco_contrato' +
        ' SET co_cotizacion = :cotizacion,' +
            ' co_contratofirmado = :contratofirmado' +
      ' WHERE co_contrato = :contrato';
    EjecutarSqlSTEx(sSql,  [CotizacionStr,
                            IIF(chkContratoFirmado.Checked, 'T', 'F'),
                            edCO_CONTRATO.Value]);

    DoEndosoGrabar(edCO_CONTRATO.Value, DBDateTime, aNumeroMovimiento, 'N', 'N', 'S', frmPrincipal.DBLogin.UserId, False);

    //GuardarDatosDocumentacionFirmante(iIdEndoso);
    //CommitTrans;

    DoCargarDatos(ART_EMPTY_ID, FContrato, FFuncion);

    MsgBox('Movimiento generado correctamente.');
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;
end;

procedure TfrmModificacionContrato.RecuperarInformeNosis(const aDni, aSexo: String);
var
  aQuery: TSDQuery;
  bSeguir: Boolean;
  sPass: String;
  sSql: String;
  sUser: String;
begin
  bSeguir := True;
  sSql :=
    'SELECT op_usuario, op_pass, op_id' +
     ' FROM pep.pop_opcionesinformes' +
    ' WHERE op_fechabaja IS NULL';
  aQuery := GetQuery(sSql);
  try
    while (not aQuery.Eof) and (bSeguir) do
    begin
      sUser := aQuery.FieldByName('op_usuario').AsString;
      sPass := aQuery.FieldByName('op_pass').AsString;

      with TfrmImportInformeComercial.Create(Self) do
      try
        if Get_CuilValido(aDni, aSexo, sCuil) then
        begin
          FBusqueda := sCuil;
          FUser := sUser;
          FPass := sPass;
          FIdCuenta := aQuery.FieldByName('op_id').AsInteger;
          ShowModal;
          bSeguir := not FLogIn;
        end;
        
        FInformeNosis := sResultHTML;
        if sResultHTML <> '' then
          btnVisualizar.Enabled := True;
      finally
        Free;
      end;
      aQuery.Next;
    end;
  finally
    aQuery.Free;
  end;
end;

procedure TfrmModificacionContrato.fpGuardarFirmanteShow(Sender: TObject);
begin
  rbRevisionDDJJ.Enabled := chkPep.Checked; //No permitir revision pep si no esta tildado.
  rbRevisionLegajo.Checked := True;
  rbRevisionIncorporaDoc.Checked := False;
  rbRevisionNada.Checked := False;
  rbRevisionNada.Enabled := not HuboCambioDocumentacion;   //Si hay cambio en documentacion

  btnAceptarFirmante.SetFocus;
end;

function TfrmModificacionContrato.EsRojo(const aConsultaActiva: TSDquery; const aFieldBaja: String): Boolean;
begin
  Result := (aFieldBaja <> '') and (aConsultaActiva.Active) and (not aConsultaActiva.FieldByName(aFieldBaja).IsNull);
end;

procedure TfrmModificacionContrato.dbGridContactosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                                var Background: TColor; Highlight: Boolean);
begin
  if EsRojo(((Sender as TArtDbGrid).DataSource.DataSet) as TSDQuery, 'CT_FECHABAJA') then
    AFont.Color := clRed;
end;

procedure TfrmModificacionContrato.tbReactivarClick(Sender: TObject);
var
  sSql: String;
begin
  if not MsgAsk(sdqDatosContacto.FieldByName('ct_contacto').AsString + #13#10 + '¿ Desea reactivar el contacto seleccionado ?') then
    Abort;

  sSql :=
    'UPDATE act_contacto' +
      ' SET ct_fechabaja = NULL,' +
          ' ct_usubaja = NULL,' +
          ' ct_usumodif = :usumodif,' +
          ' ct_fechamodif = SYSDATE' +
    ' WHERE ct_id = :id';
  EjecutarSqlEx(sSql, [Sesion.UserID, sdqDatosContacto.FieldByName('ct_id').AsInteger]);

  GuardarSucesoBajaReactivar(sdqDatosContacto.FieldByName('ct_id').AsInteger, FIdEndoso, True);

 // LockContactoFirmante(True);
 // SwitchToolBtnFirmante(True);
  tbRefresh.Click;
end;

procedure TfrmModificacionContrato.rbRefreshDocFirmanteClick(Sender: TObject);
begin
  ActualizarDocumentacionFaltante('checkfirmante');
end;

procedure TfrmModificacionContrato.BuscarEnWorldSys(const aDni: String);
var
  sSql: String;
begin
  sSql :=
    'SELECT wo_fechalote, wo_denominacion' +
     ' FROM pep.pwo_worldsys' +
    ' WHERE wo_nrodocumento = :nrodocumento';
  with GetQueryEx(sSql, [aDni]) do
  try
    if not Eof then
      lbWorldSys.Caption := 'DNI encontrado: '+ FieldByName('wo_denominacion').AsString
                          //'. Lote: '+ aQuery.FieldByName('wo_fechalote').AsString  //Pidio EVila que no muestre el Lote
    else
      lbWorldSys.Caption := 'DNI no encontrado';
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.btnWorldSysClick(Sender: TObject);
begin
  Verificar((edNumeroDocumento.Text = ''), edNumeroDocumento, 'Ingresar DNI para buscar en WorldSys.');
  BuscarEnWorldSys(edNumeroDocumento.Text);
end;

procedure TfrmModificacionContrato.btnBuscarContactoClick(Sender: TObject);
begin
  with TfrmContratoBuscarContacto.Create(Self) do
  try
    CargarListaContacto(edCO_CONTRATO.Value);
    if ShowModal = mrOk then
    begin
      FidContactoSeleccionado := FDatosContacto.Id;
      if btnBuscarContacto.Caption <> 'Reemplazar' then
      begin
        fraContacto.ContactoId  := FDatosContacto.Id;
        fraTipoDocumento.Codigo := FDatosContacto.Documento.Tipo;
        edNumeroDocumento.Text  := FDatosContacto.Documento.Numero;
        fraCaracter.Codigo      := FDatosContacto.CaracterFirma;
        fraTipoFirmante.Codigo  := FDatosContacto.TipoFirma;

        if FDatosContacto.Sexo <> '' then
        begin
          if FDatosContacto.Sexo = 'M' then
            cboxSexo.ItemIndex := 0
          else
            cboxSexo.ItemIndex := 1
        end
        else
          cboxSexo.ItemIndex := -1;
      end
      else
        if MsgBox('Se va reemplazar CONTACTO DE MIGRACION por ' + FDatosContacto.Nombre + #13#10 +
                 'Esto puede tomar unos instantes ¿ Confirma el cambio ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
          ReemplazarContacto(sdqDatosContacto.FieldByName('ct_id').AsInteger, FDatosContacto.Id);
    end
    else
      Self.FidContactoSeleccionado := -1;
  finally
    Free;
    tsFirmante.SetFocus;
  end;
end;

procedure TfrmModificacionContrato.GuardarSucesoBajaReactivar(const aIdContacto, aIdEndoso: Integer; const Reactivar: Boolean);
var
  iDocumentacion: Integer;
  iRelaInformeFirmante: Integer;
  iRelaPersonaExpuesta: Integer;
  iSuceso: Integer;
  sSql: String;
begin
  iSuceso := GetProximoSuceso(aIdContacto, FIdFormulario);

  if iSuceso = 1 then  //por si el tipo todavia no tiene sucesos.
  begin
    iRelaPersonaExpuesta := 0;
    iDocumentacion := 0;
    iRelaInformeFirmante := 0;
  end
  else
  begin
    iRelaPersonaExpuesta := sdqSucesos.FieldByName('sf_idrelapersonaexpuesta').AsInteger;
    iDocumentacion       := sdqSucesos.FieldByName('sf_idreladocumentacion').AsInteger;
    iRelaInformeFirmante := sdqSucesos.FieldByName('sf_idrelainformefirmante').AsInteger;
  end;

  if Reactivar = False then  //Si esta dando la baja hago esto. Si lo esta reactivando
  begin                      //con el boton verde de la flechita hago lo otro
    sSql :=
      'INSERT INTO asf_sucesofirmante' +
                ' (sf_idformulario, sf_idcontacto, sf_suceso, sf_idendoso, sf_observaciones, sf_resultado, sf_usubaja, sf_fechabaja,' +
                 ' sf_fecha, sf_idreladocumentacion, sf_idrelapersonaexpuesta, sf_idrelainformefirmante, sf_usualta,' +
                 ' sf_fechaalta, sf_riesgo, sf_riesgovalor)' +
         ' VALUES (:idformulario, :idcontacto, :suceso, :idendoso, :observaciones, :resultado, :usubaja, SYSDATE, SYSDATE,' +
                   SqlInt(iDocumentacion, True) + ', ' + SqlInt(iRelaPersonaExpuesta, True) + ', ' +
                   SqlInt(iRelaInformeFirmante, True) + ', :usualta, SYSDATE, :riesgo, :riesgonum)';
    EjecutarSqlEx(sSql, [FIdFormulario, aIdContacto, iSuceso, aIdEndoso, FComentariosFirmante, FRevisionPep, Sesion.UserID, Sesion.UserID,
                          edExp.Text, edExpNum.Text]);
  end
  else
  begin
    sSql :=
      'INSERT INTO asf_sucesofirmante' +
                ' (sf_idformulario, sf_idcontacto, sf_suceso, sf_idendoso, sf_observaciones, sf_resultado, sf_usualta, sf_fechaalta,' +
                 ' sf_fecha, sf_idreladocumentacion, sf_idrelapersonaexpuesta, sf_idrelainformefirmante, sf_riesgo, sf_riesgovalor)' +
         ' VALUES (:idformulario, :idcontacto, :suceso, :idendoso, :observaciones, :resultado, :usualta, SYSDATE, SYSDATE, ' +
                   SqlInt(iDocumentacion, True) + ', ' + SqlInt(iRelaPersonaExpuesta, True) + ', ' +
                   SqlInt(iRelaInformeFirmante, True) + ', :riesgo, :riesgonum)';
    EjecutarSqlEx(sSql, [FIdFormulario, aIdContacto, iSuceso, aIdEndoso, FComentariosFirmante, FRevisionPep, Sesion.UserID,
                         edExp.Text, edExpNum.Text]);
  end;
end;

procedure TfrmModificacionContrato.GuardarTarifaPCP;
var
  aSql: TSQL;
  sSql : String;
  idAlicuota, I : Integer;
begin

 { sSql := 'SELECT ap_id ' +
          '  FROM afi.aap_alicuotas_pcp ' +
          ' WHERE ap_contrato :id';


  if not ExisteSQLEx(sSql, [FContrato]) then
  begin
   ///
  end;   }


  sSql :=
      'SELECT ap_id' +
      '  FROM afi.aap_alicuotas_pcp' +
      ' WHERE ap_contrato = :id' +
      '  AND  ap_idparametro_pcp =(SELECT pp_id ' +
                                    '  FROM afi.app_parametro_pcp ' +
                                    ' WHERE pp_renglon = :param)';
  BeginTrans;
  aSql := TSQL.Create('afi.aap_alicuotas_pcp');
  try
    try
      for I := 1 to 3 do
      begin
        idAlicuota := ValorSqlIntegerEx(sSql, [FContrato, I], -1);

        aSql.Clear;
        if idAlicuota = -1 then
        begin
          aSql.SqlType := stInsert;
          aSql.Fields.Add('ap_usualta',   Sesion.UserID);
          aSql.Fields.Add('ap_fechaalta', SQL_DATETIME, False);
          aSql.Fields.Add('ap_idsolicitud', FIdFormulario * -1);
        end
        else
        begin
          aSql.SqlType := stUpdate;
          aSql.PrimaryKey.Add('ap_id',         idAlicuota);
          aSql.Fields.Add('ap_fechamodif', SQL_DATETIME, False);
          aSql.Fields.Add('ap_usumodif',   Sesion.UserID);
        end;
        aSql.Fields.Add('ap_idformulario',   FIdFormulario);
        aSql.Fields.Add('ap_idparametro_pcp',    GetIdRenglonPCP(I));
        aSql.Fields.Add('ap_contrato',    FContrato);
        case I of
          1:
          begin
            aSql.Fields.Add('ap_alicuota',    edAlicuotaMenosDe12.Value);
            aSql.Fields.Add('ap_canttrabajador',    edCantTrabMenosDe12.Value);
          end;
          2:
          begin
            aSql.Fields.Add('ap_alicuota',    edAlicuotaDe12a16.Value);
            aSql.Fields.Add('ap_canttrabajador',    edCantTrabDe12a16.Value);
          end;
          3:
          begin
            aSql.Fields.Add('ap_alicuota',    edAlicuotaMasDe16.Value);
            aSql.Fields.Add('ap_canttrabajador',    edCantTrabMasDe16.Value);
          end;
        end;
        EjecutarSqlST(aSql.Sql);
      end;
      CommitTrans;
    except
      Rollback;
    end;
  finally
    aSql.Free;
  end;
end;

function TfrmModificacionContrato.GetProximoSuceso(aIdContacto, aIdFormulario: Integer): Integer;
var
  sSql: String;
begin
  sSql :=                                 //Selecciono el numero de suceso a guardar
    'SELECT NVL(MAX(sf_suceso), 0) + 1' +
     ' FROM asf_sucesofirmante' +
    ' WHERE sf_idcontacto = :idcontacto' +
      ' AND sf_idformulario = :idformulario';
  Result := ValorSqlIntegerEx(sSql, [aIdContacto, FIdFormulario]);
end;

procedure TfrmModificacionContrato.tbEliminarSucesosClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(edCO_CONTRATO.Text = '', dbGridContactos, 'No hay contrato seleccionado.');
  Verificar(sdqDatosContacto.IsEmpty, dbGridContactos, 'No hay contacto seleccionado.');
  if not MsgAsk(sdqDatosContacto.FieldByName('CT_CONTACTO').AsString + #13#10 +
                '¿ Desea eliminar el contacto, los sucesos y todos sus datos relacionados ?') then
    Abort;

  BeginTrans; //FIdFormulario

  try
    sSql :=
      'SELECT sf_idreladocumentacion, sf_idrelapersonaexpuesta, sf_idrelainformefirmante' +
       ' FROM asf_sucesofirmante' +
      ' WHERE sf_idcontacto = :contacto' +
        ' AND sf_idformulario = :formulario';
    with GetQueryEx(sSql, [sdqDatosContacto.FieldByName('ct_id').AsInteger, FIdFormulario]) do
    try
      while not Eof do
      begin
        if not FieldByName('sf_idrelapersonaexpuesta').IsNull then
          EliminarPep(FieldByName('sf_idrelapersonaexpuesta').AsInteger);

        if not FieldByName('sf_idreladocumentacion').IsNull then
          EliminarDocumentacion(FieldByName('sf_idreladocumentacion').AsInteger);

        if not FieldByName('sf_idrelainformefirmante').IsNull then
          EliminarInformeComercial(FieldByName('sf_idrelainformefirmante').AsInteger);

        Next;
      end;
    finally
      Free;
    end;

    EliminarSucesoFirmante(sdqDatosContacto.FieldByName('ct_id').AsInteger, FIdFormulario);

    //SetBajaContacto(sdqDatosContacto.FieldByName('ct_id').AsInteger);
    EliminarContacto(sdqDatosContacto.FieldByName('ct_id').AsInteger);  //Cambio pedido por EVila

    CommitTrans;
  except
    RollBack;
  end;

  tbRefresh.Click;
end;

procedure TfrmModificacionContrato.EliminarPep(const aId: Integer);
var
  sSql: String;
begin
  if aId <> 0 then
  begin
    sSql :=
      'DELETE FROM ape_personaexpuesta' +
           ' WHERE pe_idrelapersonaexpuesta = :idrelapersonaexpuesta';
    EjecutarSqlSTEx(sSql, [aId]);
  end;
end;

procedure TfrmModificacionContrato.EliminarDocumentacion(const aId: Integer);
var
  sSql: String;
begin
  if aId <> 0 then
  begin
    sSql :=
      'DELETE FROM ado_documentacion' +
           ' WHERE do_idreladocumentacion = :idreladocumentacion';
    EjecutarSqlSTEx(sSql, [aId]);
  end;
end;

procedure TfrmModificacionContrato.EliminarInformeComercial(const aId: Integer);
var
  sSql: String;
begin
  if aId <> 0 then
  begin
    sSql :=
      'DELETE FROM aif_informefirmante' +
           ' WHERE if_idrelainformefirmante = :idrelainformefirmante';
    EjecutarSqlSTEx(sSql, [aId]);
  end;
end;

procedure TfrmModificacionContrato.EliminarSucesoFirmante(const aIdContacto, aIdFormulario: Integer);
var
  sSql: String;
begin
  sSql :=
    'DELETE FROM asf_sucesofirmante' +
         ' WHERE sf_idcontacto = :idcontacto' +
           ' AND sf_idformulario = :idformulario';
  EjecutarSqlSTEx(sSql, [aIdContacto, aIdFormulario]);
end;

procedure TfrmModificacionContrato.SetBajaContacto(const aIdContacto: Integer);
var
  sSql: String;
begin
  sSql :=
    'UPDATE act_contacto' +
      ' SET ct_fechabaja = SYSDATE,' +
          ' ct_usubaja = :usubaja' +
    ' WHERE ct_id = :id';
  EjecutarSqlSTEx(sSql, [Sesion.UserID, sdqDatosContacto.FieldByName('ct_id').AsInteger]);
end;

procedure TfrmModificacionContrato.EliminarContacto(const aIdContacto: Integer);
var
  sSql: String;
begin
  sSql :=
    'DELETE FROM act_contacto' +
         ' WHERE ct_id = :id';
  EjecutarSqlSTEx(sSql, [aIdContacto]);
end;

function TfrmModificacionContrato.LoadSQLDatosContacto: String;
var
  sSql: String;
begin
  sSql :=
    'SELECT carea.tb_descripcion area, cargo.tb_descripcion cargo, ct_area, ct_areacarga, ct_cargo, ct_codareafax,' +
          ' ct_contacto, ct_direlectronica, ct_idcaracterfirma, firma.cf_caracter, ct_fax, ct_fechabaja, ct_firmante,' +
          ' ct_id, ct_idempresa, ct_numerodocumento, ct_remitentecarta, ct_tipodocumento,' +
          ' TRUNC(ct_fechaalta) fechaalta, TRUNC(ct_fechamodif) fechamodif,' +
          ' DECODE(ct_firmante, ''S'', ''Sí'', ''No'') firmante,' +
          ' DECODE(ct_remitentecarta, ''S'', ''Si'', ''No'') remitentecarta,' +
          ' CASE ' +
            ' WHEN(ct_sexo = ''M'') THEN ''Masculino''' +
            ' WHEN(ct_sexo = ''F'') THEN ''Femenino''' +
          ' END sexo, tfirm.tb_descripcion tipofirma,' +
          ' art.afi.get_telefonos(''ATN_TELEFONOCONTACTO'', ct_id) telefonos, tdoc.tb_descripcion tipodocumento,' +
          ' use1.se_nombre usualta, use2.se_nombre usumodif, ct_sexo, ct_tipofirma, sf_fecha AS ultproc,' +
          ' sf_resultado AS resultado,' +
          ' CASE '+
            ' WHEN (SELECT MAX(pe_expuesta)' +
                    ' FROM art.ape_personaexpuesta' +
                   ' WHERE pe_idrelapersonaexpuesta = sf_idrelapersonaexpuesta) = ''S'' THEN ''Si''' +
          ' ELSE ''No''' +
          ' END espep' +
     ' FROM aco_contrato' +
     ' JOIN act_contacto ON ct_idempresa = co_idempresa AND (ct_firmante = ''S'' OR ct_tipofirma IS NOT NULL)' +
     ' LEFT JOIN art.ctb_tablas cargo ON cargo.tb_codigo = ct_cargo AND cargo.tb_clave = ''CARGO''' +
     ' LEFT JOIN art.ctb_tablas carea ON carea.tb_codigo = ct_area AND carea.tb_clave = ''CAREA''' +
     ' LEFT JOIN art.ctb_tablas tdoc ON tdoc.tb_codigo = ct_tipodocumento AND tdoc.tb_clave = ''TDOC''' +
     ' LEFT JOIN art.use_usuarios use2 ON use2.se_usuario = ct_usumodif' +
     ' LEFT JOIN art.acf_caracterfirma firma ON firma.cf_id = ct_idcaracterfirma' +
     ' LEFT JOIN art.ctb_tablas tfirm ON tfirm.tb_codigo = ct_tipofirma AND tfirm.tb_clave = ''TFIRM''' +
     ' LEFT JOIN art.use_usuarios use1 ON use1.se_usuario = ct_usualta' +
     ' LEFT JOIN art.asf_sucesofirmante a ON a.sf_idformulario = co_idformulario and sf_idcontacto = ct_id' +
           ' AND a.sf_id = pep.firmante.get_ult_suceso(co_contrato, a.sf_idcontacto)' +
    ' WHERE co_contrato = :co_contrato';

  if not chkVerBajas.Checked then
    sSql := sSql + ' AND ct_fechabaja IS NULL';

  Result := sSql;
end;

procedure TfrmModificacionContrato.chkVerBajasClick(Sender: TObject);
begin
  tbRefresh.Click;
end;

procedure TfrmModificacionContrato.CargarContratoFirmado(const aContrato: Integer);
var
  sSql: String;
begin
  sSql :=                                 //Selecciono el numero de suceso a guardar
    'SELECT co_contratofirmado' +
     ' FROM aco_contrato' +
    ' WHERE co_contrato = :contrato';
  chkContratoFirmadoPep.Checked := (ValorSqlEx(sSql, [aContrato]) = 'T');
end;

procedure TfrmModificacionContrato.tbGuardarEstadoContratoClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar((edCO_CONTRATO.Text = ''), nil, 'No hay contrato seleccionado.');

  if not MsgAsk('Esta acción generará un nuevo movimiento. ¿ Desea continuar ?') then
    Exit;

  //ActualizarDocumentacionFaltante;

  sSql :=
    'UPDATE aco_contrato' +
      ' SET co_contratofirmado = :contratofirmado' +
    ' WHERE co_contrato = :contrato';

  BeginTrans;
  try
    EjecutarSqlSTEx(sSql, [IIF(chkContratoFirmadoPep.Checked, 'T', 'F'), edCO_CONTRATO.Value]);
    DoEndosoGrabar(edCO_CONTRATO.Value, DBDateTime, '505', 'N', 'N', 'S', frmPrincipal.DBLogin.UserId, False);
    DoCargarDatos(ART_EMPTY_ID, FContrato, FFuncion);

    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;
end;

procedure TfrmModificacionContrato.DoAgregarLinea(const aLinea, aContrato, aEndoso, aDescripcion, aMotivo, aVigencia, aErrores: String);
begin
 if GridSrt.RowCount = 2 then
  begin
    GridSrt.Cells[0,0] := 'Línea';
    GridSrt.Cells[1,0] := 'Contrato';
    GridSrt.Cells[2,0] := 'Endoso';
    GridSrt.Cells[3,0] := 'Descripción';
    GridSrt.Cells[4,0] := 'Motivo';
    GridSrt.Cells[5,0] := 'Vigéncia';
    GridSrt.Cells[6,0] := 'Errores';
    GridSrt.RowCount := 2;
    GridSrt.FixedRows := 1;
  end;

  GridSrt.Cells[0, GridSrt.RowCount-1] := aLinea;
  GridSrt.Cells[1, GridSrt.RowCount-1] := aContrato;
  GridSrt.Cells[2, GridSrt.RowCount-1] := aEndoso;
  GridSrt.Cells[3, GridSrt.RowCount-1] := aDescripcion;
  GridSrt.Cells[4, GridSrt.RowCount-1] := aMotivo;
  GridSrt.Cells[5, GridSrt.RowCount-1] := aVigencia;
  GridSrt.Cells[6, GridSrt.RowCount-1] := aErrores;
  GridSrt.RowCount := GridSrt.RowCount + 1;
end;

procedure TfrmModificacionContrato.tbImprimirErroresClick(Sender: TObject);
begin
  GridSrt.Print;
end;

procedure TfrmModificacionContrato.tbExcelClick(Sender: TObject);
begin
  ProcesarExcel;
end;

procedure TfrmModificacionContrato.ProcesarExcel;
var
  iLCid: Integer;
  iLoop: Integer;
begin
  iLCid := GetUserDefaultLCID;
  ExcelApp.Connect;
  ExcelApp.Visible[0] := True;
  ExcelApp.DisplayAlerts[ILCId] := True;
  ExcelApp.Workbooks.Add(xlWBATWorksheet,ILCid);
  ExcelWB.ConnectTo(ExcelApp.ActiveWorkbook);
  ExcelWS.ConnectTo(ExcelApp.ActiveSheet as _Worksheet);

  for iLoop := 0 to GridSrt.RowCount -1 do
  begin
    ExcelWS.Range['A' + IntToStr(iLoop +1), 'A' + IntToStr(iLoop +1)].Value := GridSrt.Cells[0,iLoop];
    ExcelWS.Range['B' + IntToStr(iLoop +1), 'B' + IntToStr(iLoop +1)].Value := GridSrt.Cells[1,iLoop];
    ExcelWS.Range['C' + IntToStr(iLoop +1), 'C' + IntToStr(iLoop +1)].Value := GridSrt.Cells[2,iLoop];
    ExcelWS.Range['D' + IntToStr(iLoop +1), 'D' + IntToStr(iLoop +1)].Value := GridSrt.Cells[3,iLoop];
    ExcelWS.Range['E' + IntToStr(iLoop +1), 'E' + IntToStr(iLoop +1)].Value := GridSrt.Cells[4,iLoop];
    ExcelWS.Range['F' + IntToStr(iLoop +1), 'F' + IntToStr(iLoop +1)].Value := GridSrt.Cells[5,iLoop];
    ExcelWS.Range['G' + IntToStr(iLoop +1), 'G' + IntToStr(iLoop +1)].Value := GridSrt.Cells[6,iLoop];
  end;

  ExcelApp.Quit;
  ExcelApp.Disconnect;
  ExcelWS.Disconnect;
  ExcelWB.Disconnect;
end;

procedure TfrmModificacionContrato.btnAceptarErroresClick(Sender: TObject);
begin
  fpErroresEndoso.Close;
end;

procedure TfrmModificacionContrato.fpErroresEndosoBeforeShow(Sender: TObject);
begin
  if GridSrt.Cells[0, 1] = '' then
  begin
    fpErroresEndoso.Close;
    MsgBox('El proceso ha finalizado exitosamente.');
  end
  else
    MsgBox('Se han producido errores.');
end;

function TfrmModificacionContrato.MotivoAltaEndosoParaRectificacionDomicilioOk: Boolean;
begin
   Result := (fraEN_MOTIVO_Alta.Value = '01.2') or (fraEN_MOTIVO_Alta.Value = '13.1') or
             (fraEN_MOTIVO_Alta.Value = '13.4') or (fraEN_MOTIVO_Alta.Value = '320') or
             (fraEN_MOTIVO_Alta.Value = '321') or (fraEN_MOTIVO_Alta.Codigo = '323');
end;

procedure TfrmModificacionContrato.ReemplazarContacto(const aIdContactoOrigen, aIdContactoDestino: TTableId);
//Cambio pedido por EVILA /Diseño GGROSSI 04/09/2012
var
  sSql: String;
begin
  Verificar(aIdContactoOrigen = aIdContactoDestino, dbGridContactos, 'No se puede reemplazar un contacto por sí mismo.');

  sSql :=
    'SELECT 1' +
     ' FROM afi.act_contacto' +
    ' WHERE ct_id = :destino' +
      ' AND ct_fechabaja IS NOT NULL';
  if ExisteSqlEx(sSql, [aIdContactoDestino]) then
    if not (MessageDlg('El contacto seleccionado esta dado de baja y se reactivará. ¿ Desea continuar ?', mtWarning, [mbYes, mbNo], 0) in [mrYes]) then
      Abort;


  GuardarSuceso(aIdContactoOrigen, FIdEndoso, True); //guardo suceso al contacto que voy a reemplazar.

  BeginTrans;
  try
    sSql :=
      'DELETE FROM pep.pab_pepaltabaja' +
           ' WHERE ab_idcontacto = :destino';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino]);

    sSql :=
      'UPDATE pep.pab_pepaltabaja' +
        ' SET ab_idcontacto = :destino' +
      ' WHERE ab_idcontacto = :origen';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino, aIdContactoOrigen]);

    sSql :=
      'DELETE FROM art.asf_sucesofirmante' +
           ' WHERE sf_idcontacto = :destino';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino]);

    sSql :=
      'UPDATE art.asf_sucesofirmante' +
        ' SET sf_idcontacto = :destino' +
      ' WHERE sf_idcontacto = :origen';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino, aIdContactoOrigen]);

    sSql :=
      'DELETE FROM art.aif_informefirmante' +
           ' WHERE if_idcontacto = :destino';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino]);

    sSql :=
      'UPDATE art.aif_informefirmante' +
        ' SET if_idcontacto = :destino' +
      ' WHERE if_idcontacto = :origen';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino, aIdContactoOrigen]);

    sSql :=
      'DELETE FROM art.ape_personaexpuesta' +
           ' WHERE pe_idcontacto = :destino';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino]);

    sSql :=
      'UPDATE art.ape_personaexpuesta' +
        ' SET pe_idcontacto = :destino' +
      ' WHERE pe_idcontacto = :origen';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino, aIdContactoOrigen]);

    sSql :=
      'DELETE FROM art.ado_documentacion' +
           ' WHERE do_idcontacto = :destino';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino]);

    sSql :=
      'UPDATE agenda.aae_agendaevento' +
        ' SET ae_idcontacto = :destino' +
      ' WHERE ae_idcontacto = :origen';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino, aIdContactoOrigen]);

    sSql :=
      'UPDATE agenda.aat_agendatarea' +
        ' SET at_idcontacto = :destino' +
      ' WHERE at_idcontacto = :origen';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino, aIdContactoOrigen]);

    sSql :=
      'UPDATE art.ado_documentacion' +
        ' SET do_idcontacto = :destino' +
      ' WHERE do_idcontacto = :origen';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino, aIdContactoOrigen]);

    sSql :=
      'UPDATE emi.idg_detallesubloteengestion' +
        ' SET dg_idcontacto = :destino' +
      ' WHERE dg_idcontacto = :origen';
    EjecutarSqlSTEx(sSql, [aIdContactoDestino, aIdContactoOrigen]);

    sSql :=
      'UPDATE afi.act_contacto ' +
        ' SET ct_firmante = ''S'',' +
            ' ct_usumodif = :user,' +
            ' ct_fechamodif = SYSDATE,' +
            ' ct_fechabaja = NULL,' +
            ' ct_usubaja = NULL' +
      ' WHERE ct_id = :destino';
    EjecutarSqlSTEx(sSql, [Sesion.UserID, aIdContactoDestino]);

    sSql :=
      'DELETE FROM afi.act_contacto' +
           ' WHERE ct_id = :origen';
    EjecutarSqlSTEx(sSql, [aIdContactoOrigen]);
    
    CommitTrans;
    MsgBox('Reemplazo realizado correctamente.');
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;
  tbRefreshClick(nil);
end;

procedure TfrmModificacionContrato.edNumeroDocumentoExit(Sender: TObject);
var
  sSql: String;
begin
  if (DocumentoRepetido(edNumeroDocumento.Text)) and
     (not FAgregar) and
     (sdqDatosContacto.FieldByName('ct_contacto').AsString = 'CONTACTO MIGRACION') then
  begin
    sSql :=
      'SELECT ct_id, ct_contacto' +
       ' FROM act_contacto' +
      ' WHERE ct_idempresa = (SELECT co_idempresa' +
                              ' FROM aco_contrato' +
                             ' WHERE co_contrato = :contrato)' +
                               ' AND ct_fechabaja IS NULL' +
                               ' AND ct_numerodocumento = :numerodocumento';
    if not FAgregar then
      sSql := sSql + ' AND ct_id <> ' + SqlValue(sdqDatosContacto.FieldByName('ct_id').AsInteger);
    if FidContactoSeleccionado <> -1 then
      sSql := sSql + ' AND ct_id <> ' + SqlValue(FidContactoSeleccionado);

    with GetQueryEx(sSql, [edCO_CONTRATO.Text, edNumeroDocumento.Text]) do
      if not Eof then
      begin
        if MsgAsk(FieldByName('ct_contacto').AsString + #13#10 + 'Encontrado. ¿ Realmente desea reemplazar el contacto de migración por este ?') then
          ReemplazarContacto(sdqDatosContacto.FieldByName('ct_id').AsInteger, FieldByName('ct_id').AsInteger);
      end;
    tbRefreshClick(nil);
  end;
end;

procedure TfrmModificacionContrato.mnuImprimirRenovacionAutomaticaClick(Sender: TObject);
begin
  ImprimirUltimaRenovacionAutomatica(FContrato);
end;

procedure TfrmModificacionContrato.mnuMailRenovacionAutomaticaClick(Sender: TObject);
begin
  ImprimirUltimaRenovacionAutomatica(FContrato, True);
end;

procedure TfrmModificacionContrato.tbImprimirUltimaRenovacionClick(Sender: TObject);
begin
  tbImprimirUltimaRenovacion.CheckMenuDropdown;
end;

function TfrmModificacionContrato.GetCantidadFirmatesContrato(const aContrato: TTableId): Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT COUNT (ct_id) cantidad' +
     ' FROM aco_contrato aco LEFT JOIN aem_empresa aem ON aco.co_idempresa = aem.em_id' +
' LEFT JOIN act_contacto act ON aem.em_id = act.ct_idempresa' +
    ' WHERE (ct_firmante = ''S'' OR ct_tipofirma IS NOT NULL)' +
      ' AND act.ct_fechabaja IS NULL' +
      ' AND aco.co_contrato = :contrato';
  Result := ValorSqlIntegerEx(sSql, [aContrato]);
end;

procedure TfrmModificacionContrato.cbCO_ADDENDAESPECIALClick(Sender: TObject);
begin
  edComentariosAddenda.Visible := cbCO_ADDENDAESPECIAL.Checked;
  lbComentariosAddenda.Visible := cbCO_ADDENDAESPECIAL.Checked;
end;

procedure TfrmModificacionContrato.DoTareaSic(aIdFormulario: Integer);
var
  i, nIdTarea: Integer;
  sDocumentacion: String;
  sContacto: String;
  sSql: String;
begin
  if not ExisteSqlEx('SELECT 1 FROM agenda.aat_agendatarea WHERE at_idtipoevento IN (:tipo1, :tipo2) AND at_estado = :estado AND at_idformulario = :idformulario', [SIC_RECEP_FALTANTE, SIC_RECEP_FALTANTE_CONTRATO, 1, aIdFormulario]) then
  begin
    if (MessageDlg('¿ Desea gestionar la tarea a través del SIC ?', mtConfirmation, [mbYes, mbNo], 0) in [mrYes]) then
    begin
      if fpTareaSIC.ShowModal = MrOk then
      begin
        nIdTarea := ValorSqlIntegerEx('SELECT at_id FROM agenda.aat_agendatarea WHERE at_idtipoevento IN(:tipo1, :tipo2) AND at_estado = :estado AND at_idformulario = :idformulario', [SIC_DOCU_FALTANTE, SIC_DOCU_FALTANTE_CONTRATO, 1, aIdFormulario]);

        for i := 0 to GridDocFaltante.RowCount - 1 do
          if (GridDocFaltante.IsChecked(0, i)) and (GridDocFaltante.FontStyles[1, i] <> [fsStrikeOut]) then
            sDocumentacion := sDocumentacion + GridDocFaltante.Cells[1, i] + ', ';

        //if (sDocumentacion > '') or (GetCantidadDocFaltante(FContrato) > 0) then //cerrar tarea si no falta mas documentacion
        if (sDocumentacion > '') then
        begin
          if Pos('<Contacto:', edObservacionSic.Text) = 0 then //Si detecto que borraron los datos del contacto los agrego
            sContacto := ' <Contacto: ' + fraContacto.Contacto +' Cargo: '+ TfraStaticCTB_TABLAS(fraContacto.FindChildControl('fraCargo')).cmbDescripcion.Text +' DNI: '+ edNumeroDocumento.Text+ '>';

          sDocumentacion := LeftStr(sDocumentacion, Length(sDocumentacion) - 2);

          if nIdTarea > 0 then
          begin
            if FTextoSic <> 'Todavía falta la siguiente documentación: ' + sDocumentacion + CRLF + iif(Trim(edObservacionSIC.Text) > '', 'Observación: ' + edObservacionSIC.Text, '') then
            begin
              sSql :=
                'INSERT INTO agenda.aot_observaciontarea' +
                         ' (ot_id, ot_observaciones, ot_idagendatarea, ot_fechaalta, ot_usualta)' +
                    ' VALUES (agenda.seq_aot_id.NEXTVAL, :observaciones, :idagendatarea, SYSDATE, :usualta)';
              EjecutarSqlSTEx(sSql, ['Todavía falta la siguiente documentación: ' + sDocumentacion + CRLF + iif(Trim(edObservacionSIC.Text) > '', 'Observación: ' +
                                   edObservacionSIC.Text, '') + sContacto, nIdTarea, Sesion.UserID])
            end
            else
              ShowMessage('No se detectaron cambios para el SIC.');
          end
          else
          begin
            if FTextoSic <> 'Documentación faltante: ' + sDocumentacion + CRLF + IIF(Trim(edObservacionSIC.Text) > '', 'Observación: ' + edObservacionSIC.Text, '') then
            begin
              sSql :=
                'DECLARE' +
                ' idtarea NUMBER(8);' +
              ' BEGIN' +
                ' art.agenda_pkg.do_insertartarea(:idtipoevento, :idmotivoingreso, SYSDATE, idtarea, NULL, :asignaauto, :enviamail, :usuario, :descripcion, NULL, NULL, :contrato);' +
                ' UPDATE agenda.aat_agendatarea' +
                  ' SET at_idformulario = :idformulario,' +
                      ' at_contrato = :contrato2,' +
                      ' at_idvendedor = :vend,' +
                      ' at_identidad = :ent' +
                  ' WHERE at_id = idtarea;' +
                ' art.agenda_pkg.do_asignartareaautomaticamente(idtarea, ''S'');' +
              ' END;';
              EjecutarSQLSTEx(sSql, [SIC_DOCU_FALTANTE_CONTRATO, SIC_MOTIVO_INGRESO, 'N', 'N', Sesion.UserID, 'Documentación faltante: ' + sDocumentacion + CRLF +
                                   IIF(Trim(edObservacionSIC.Text) > '', 'Observación: ' + edObservacionSIC.Text, '') + sContacto, FContrato, aIdFormulario, FContrato,
                                   GetUltIdVendedor(FContrato), GetUltIdEntidad(FContrato)])
            end
            else
              MessageDlg('No se detectaron cambios para el SIC.', mtInformation, [mbOK], 0);
          end
        end
        else
        begin
          CerrarTareaSiExiste(aIdFormulario, 357);
          CerrarTareaSiExiste(aIdFormulario, 355);
          CerrarTareaSiExiste(aIdFormulario, 354);
          if nIdTarea > 0 then
          begin
            sSql :=
              'BEGIN' +
              ' art.agenda_pkg.do_agendartarea(:idtarea, SYSDATE, :idusuario, :respuesta, NULL);' +
              ' END;';
            EjecutarSqlSTEx(sSql, [nIdTarea, Sesion.ID, 'Se recepcionó toda la documentación que faltaba.']);
            MessageDlg('La tarea del SIC ha sido cerrada', mtInformation, [mbOK], 0);
          end
          else
            MessageDlg('No hay nada que guardar en el SIC.', mtInformation, [mbOK], 0);
        end
      end
      else
        MessageDlg('Tarea del SIC cancelada.', mtInformation, [mbOK], 0);
    end
    else
      MessageDlg('No se guardará tarea en el SIC.', mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmModificacionContrato.fpTareaSICShow(Sender: TObject);
var
  aDocumentos, aDocumentosActualesSic: TStringList;
  aDocumentosFaltantes: TStringList;
begin
  ClearFpSIC;

  aDocumentos            := TStringList.Create;
  aDocumentosActualesSic := TStringList.Create;
  aDocumentosFaltantes   := TStringList.Create;

  LoadDocumentos(aDocumentos, aDocumentosActualesSic);  //cargo la Documentacion enviada al SIC (orignal tarea y ahora obser)
  LoadDocumentosFaltantes(FContrato, aDocumentosFaltantes); // cargo los que faltan ahora en AFI
  CompareAndFillDocumentosFaltantes(aDocumentos, aDocumentosActualesSic, aDocumentosFaltantes); //comparo y lleno la lista

  aDocumentosFaltantes.Free;
  aDocumentos.Free;
  aDocumentosActualesSic.Free;
end;

procedure TfrmModificacionContrato.fpTarifaPCPShow(Sender: TObject);
begin
  CargarDatosTarifaPCP(FContrato);
end;

procedure TfrmModificacionContrato.ClearFpSic;
begin
  GridDocFaltante.Clear;
  GridDocFaltante.RowCount := 0;
  GridDocFaltante.DefaultRowHeight := 16;
  GridDocFaltante.ColWidths[0] := 20;
  edObservacionSIC.Clear;
end;

procedure TfrmModificacionContrato.LoadDocumentosFaltantes(const aIdContrato: TTableId; var aDocs: TStringList);
var
  sSql: String;
  sTexto, sDoc: String;
begin
  sSql := 'SELECT art.afiliacion.falta_doc_contrato(:id) FROM DUAL';
  sTexto := ValorSqlEx(sSql, [aIdContrato]);
  if Pos(', ', sTexto) = 1 then
    sTexto := Copy(sTexto, 2, Length(sTexto) - 2); // a veces me viene con un ', ' al principio

  while (sTexto <> '') or (Pos(',', sTexto)<> 0) do
  begin
    if (Pos(',', sTexto) = 0) and (sTexto <> '') then
      sDoc := sTexto
    else
      sDoc := Copy(sTexto, 0, Pos(',', sTexto) + 1);

    sTexto := AnsiReplaceStr(sTexto,sDoc, '');
    sDoc := AnsiReplaceStr(sDoc, ',', '');
    aDocs.Add(Trim(sDoc));
  end;
end;

procedure TfrmModificacionContrato.LoadDocumentos(var aDocs, aDocsActuales: TStringList);
var
  sSql, sTextoAux, sFaltantesOrig: String;
  iTarea: TTAbleId;
begin
  iTarea := 0;

  //DocFaltante Original
  sSQL := 'SELECT at_id, at_descripcion FROM agenda.aat_agendatarea WHERE at_idtipoevento IN(:tipo1, :tipo2) AND at_estado = :estado AND at_idformulario = :idformulario';
  with GetQueryEx(sSql, [SIC_DOCU_FALTANTE, SIC_DOCU_FALTANTE_CONTRATO, 1, FIdFormulario]) do
  try
    if not IsEmpty then
    begin
      iTarea := FieldByName('at_id').AsInteger;
      FTextoSIC := FieldByName('at_descripcion').AsString;
      sTextoAux := FieldByName('at_descripcion').AsString;

      sFaltantesOrig := GetDocumentacion(sTextoAux, 'Documentación faltante: ');

      edObservacionSic.Text := ParceObservacion(sTextoAux);

      while (sFaltantesOrig <> '') or (Pos(',', sFaltantesOrig) <> 0) do //Busco la documentacion faltante
        if (Pos(',', sFaltantesOrig) = 0) and (sFaltantesOrig <> '') then //puede ser que quede una coma por algun lado
        begin
          aDocs.Add(Trim(sFaltantesOrig));
          sFaltantesOrig := '';
        end
        else
        begin
          sTextoAux := Copy(sFaltantesOrig,0,Pos(',', sFaltantesOrig) - 1 );
          aDocs.Add(Trim(sTextoAux));
          sFaltantesOrig := AnsiReplaceStr(sFaltantesOrig, sTextoAux + ',', '');
        end;
    end;
  finally
    Free;
  end;

  //Ultimo Comentario
  sTextoAux := '';
  sFaltantesOrig := '';
  sSql := 'SELECT ot_observaciones FROM agenda.aot_observaciontarea WHERE ot_idagendatarea = :idagendatarea ORDER BY ot_id DESC';
  with GetQueryEx(sSql, [iTarea]) do
  try
    if not IsEmpty then
      while not Eof do
      begin
        sTextoAux := FieldByName('ot_observaciones').AsString;
        FTextoSIC := FieldByName('ot_observaciones').AsString;
        sFaltantesOrig := GetDocumentacion(sTextoAux, 'Todavía falta la siguiente documentación: ');
        edObservacionSic.Text := ParceObservacion(sTextoAux);
        if Trim(sFaltantesOrig) > '' then
          Break;

        Next;
      end;

    while (sFaltantesOrig <> '') or (Pos(',', sFaltantesOrig) <> 0) do //Busco la documentacion faltante
    begin
      if (Pos(',',sFaltantesOrig) = 0) and (sFaltantesOrig <> '') then //puede ser que quede una coma por algun lado
        sTextoAux := sFaltantesOrig
      else
        sTextoAux := Copy(sFaltantesOrig,0,Pos(',', sFaltantesOrig) + 1);

      sFaltantesOrig := AnsiReplaceStr(sFaltantesOrig, sTextoAux, '');
      sTextoAux := AnsiReplaceStr(sTextoAux, ',', '');
      aDocsActuales.Add(Trim(sTextoAux));
    end;
  finally
    Free;
  end;
end;

procedure TfrmModificacionContrato.CompareAndFillDocumentosFaltantes(const aDocs, aDocsActualesSic, aDocumentosFaltantes: TStringList);
var
  iLoop: Integer;
  aPoint: TPoint;
  SearchPoint: TPoint;
begin
  aPoint := Classes.Point(-1, -1);
    //edObservacionSic.Text := aDocs.Text + '/ '+ aDocumentosFaltantes.Text;

  if aDocsActualesSic.Count > 0 then   //agrego los documentos del ultimo evento en el otro stringlist
    //agregar los docs orignales faltantes
    for iLoop := 0 to aDocsActualesSic.Count -1 do
      if aDocs.IndexOf(aDocsActualesSic[iLoop]) = -1 then
        aDocs.Add(aDocsActualesSic[iLoop]);

  if aDocs.Count > 0 then
    //agregar los docs orignales faltantes
    for iLoop := 0 to aDocs.Count -1 do
      AddText(aDocs[iLoop], aDocumentosFaltantes.IndexOf(aDocs[iLoop]) = -1, True);

  if aDocumentosFaltantes.Count > 0 then  //agregar docs faltantes actuales
    for iLoop := 0 to aDocumentosFaltantes.Count - 1 do
    begin
      SearchPoint := GridDocFaltante.Find(aPoint, aDocumentosFaltantes[iLoop], []);
      if (SearchPoint.X = -1) or (SearchPoint.Y = -1) then //si no esta en doc faltante original agregar
        AddText(aDocumentosFaltantes[iLoop], False, False)
      else  //Como ya los agrego a la grilla arriba tengo que tacharlo
      begin
        GridDocFaltante.FontStyles[SearchPoint.X, SearchPoint.Y] := [];
        GridDocFaltante.SetCheckBoxState(SearchPoint.X, SearchPoint.Y, False);
      end
    end;

  GridDocFaltante.RowCount := GridDocFaltante.RowCount -1;

  if (aDocsActualesSic.Count = 0) and (aDocs.Count = 0) then //Si es la primera vez check todos
    SicListCheckState(True);
end;

function TfrmModificacionContrato.GetDocumentacion(const aTexto, aTipo: String): String;
var
  sResultado: String;
begin
  if InStr(aTexto, aTipo) > 0 then
  begin
    sResultado := Copy(aTexto, Pos(aTipo, aTexto), Length(aTexto) - Pos(aTipo, aTexto) + 1);
    sResultado := AnsiReplaceStr(sResultado, aTipo , '');
    sResultado := AnsiReplaceStr(sResultado, CRLF, ''); //quito el enter
  end;
  if InStr(sResultado, 'Observación:',0) > 0  then
    sResultado := Copy(sResultado, 0, Pos('Observación: ',sResultado) - 1);
  if InStr(sResultado, ' <Contacto:', 0)  > 0 then      //Quito los datos del contacto si es que no habia observacion
    sResultado := Copy(sResultado, 0, Pos(' <Contacto: ', sResultado) - 1);
  Result := sResultado;
end;

function TfrmModificacionContrato.GetIdRenglonPCP(
  const aRenglon: Integer): Integer;
var
  sSql : String;
begin
  sSql := 'SELECT pp_id ' +
          '  FROM afi.app_parametro_pcp ' +
          ' WHERE pp_renglon = :renglon ';

  Result := ValorSqlIntegerEx(sSql, [aRenglon], -1);
end;

function TfrmModificacionContrato.ParceObservacion(const aTexto: String): String;
var
 sResultado: String;
begin
  if InStr(aTexto, 'Observación: ') > 0 then
  begin
    sResultado := Copy(aTexto, Pos('Observación: ', aTexto), Length(aTexto) - Pos('Observación: ', aTexto) + 1);
    sResultado := AnsiReplaceStr(sResultado, 'Observación: ', '');
    //sResultado := AnsiReplaceStr(sResultado, CRLF, ''); //quito el enter
  end;

  if (sResultado = '') and (InStr(aTexto, ' <Contacto:') > 0) then  //Si no hay observacion ver si hay algun dato de contacto
    sResultado := Copy(aTexto, Pos(' <Contacto:', aTexto), Length(aTexto) - Pos(' <Contacto:', aTexto) + 1);

  Result := sResultado;
end;

procedure TfrmModificacionContrato.AddText(const aText: String; const StrikedOut, Checked: Boolean);
begin
  GridDocFaltante.Cells[1, GridDocFaltante.RowCount - 1] := aText;
  GridDocFaltante.AddCheckBox(0, GridDocFaltante.RowCount - 1, Checked, False);
  if StrikedOut then
    GridDocFaltante.FontStyles[1, GridDocFaltante.RowCount - 1] := [fsStrikeOut];
  GridDocFaltante.AddRow;
end;

procedure TfrmModificacionContrato.SicListCheckState(aChecked: Boolean);
var
  iLoop: Integer;
begin
  for iLoop := 0 to GridDocFaltante.RowCount - 1 do
    GridDocFaltante.SetCheckBoxState(0, iLoop, aChecked);
end;

procedure TfrmModificacionContrato.btnAceptarSICClick(Sender: TObject);
begin
  fpTareaSIC.ModalResult := MrOk;
end;

procedure TfrmModificacionContrato.btnCancelarSICClick(Sender: TObject);
begin
  fpTareaSIC.ModalResult := MrCancel;
end;

procedure TfrmModificacionContrato.tbCheckSicClick(Sender: TObject);
begin
  SicListCheckState(True);
end;

procedure TfrmModificacionContrato.tbUncheckSicClick(Sender: TObject);
begin
  SicListCheckState(False);
end;

procedure TfrmModificacionContrato.tbSalirSicClick(Sender: TObject);
begin
  fpTareaSIC.ModalResult := MrCancel;
end;

function TfrmModificacionContrato.GetUltIdVendedor(const aContrato: TTableId): Integer;
var
  sSql: String;
  iMaxVcId: Integer;
begin
  sSql := 'SELECT MAX(vc_id) FROM avc_vendedorcontrato WHERE vc_contrato = :contrato';
  iMaxVcId := ValorSqlEx(sSql, [aContrato]); //ultimo vendedor contrato

  sSql :=
    'SELECT ev_idvendedor' +
     ' FROM xev_entidadvendedor' +
    ' WHERE ev_id = (SELECT vc_identidadvend' +
                     ' FROM avc_vendedorcontrato' +
                    ' WHERE vc_id = :maxvc)';

  Result := ValorSqlEx(sSql, [iMaxVcId]); //resultado idvendedor
end;

function TfrmModificacionContrato.GetUltIdEntidad(const aContrato: TTableId): Integer;
var
  sSql: String;
  iMaxVcId: Integer;
begin
  sSql := 'SELECT MAX(vc_id) FROM avc_vendedorcontrato WHERE vc_contrato = :contrato';
  iMaxVcId := ValorSqlEx(sSql, [aContrato]); //ultimo vendedor contrato

  sSql :=
    'SELECT ev_identidad' +
     ' FROM xev_entidadvendedor' +
    ' WHERE ev_id = (SELECT vc_identidadvend' +
                     ' FROM avc_vendedorcontrato' +
                    ' WHERE vc_id = :maxvc)';

  Result := ValorSqlEx(sSql, [iMaxVcId]); //resultado idvendedor
end;

procedure TfrmModificacionContrato.CerrarTareaSiExiste(
  const aIdFormulario, aTarea: integer);
var
  sSql : String;
  nIdTarea : Integer;
begin
  nIdTarea := ValorSqlIntegerEx('SELECT at_id FROM agenda.aat_agendatarea' +
                                '  WHERE at_idtipoevento = :idtipoevento ' +
                                '   AND at_estado = :estado ' +
                                '   AND at_idformulario = :idformulario',
                                [aTarea{SIC_RECEP_FALTANTE_CONTRATO}, 1, aIdFormulario]);
  if nIdTarea > 0 then
  begin
    sSql :=
            'BEGIN' +
             ' art.agenda_pkg.do_agendartarea(:idtarea, SYSDATE, :idusuario, :respuesta, NULL);' +
            ' END;';
    EjecutarSqlSTEx(sSql, [nIdTarea, Sesion.ID, 'Se recepcionó toda la documentación que faltaba.']);
    ShowMessage('Se cerrará la tarea Recepción de documentación faltante de contratos nuevos');
  end;
end;

{function TfrmModificacionContrato.GetCantidadDocFaltante(
  const aContrato: Integer): Integer;
var
  sSql: String;
begin
  sSql := 'SELECT' +
          '   (LENGTH(art.afiliacion.falta_doc_contrato(co_contrato, ''S'')) - ' +
          '    LENGTH(REPLACE(art.afiliacion.falta_doc_contrato(co_contrato, ''S''), '',''))) / LENGTH('','') TOTAL_DOC' +
          '  FROM aco_contrato' +
          ' WHERE co_estado = 1' +
          '  AND co_contrato = :contrato';

  Result := ValorSqlIntegerEx(sSql, [aContrato], 0);
end;  }

function TfrmModificacionContrato.IsDomicilioIgual: boolean;
var
  EsIgual : boolean;
begin
  EsIgual := False;
  if fraDOMICILIO_POSTAL.CodigoPostal    = fraDOMICILIO_LEGAL.CodigoPostal then
  if fraDOMICILIO_POSTAL.Calle           = fraDOMICILIO_LEGAL.Calle then
  if fraDOMICILIO_POSTAL.Localidad       = fraDOMICILIO_LEGAL.Localidad then
  if fraDOMICILIO_POSTAL.Provincia       = fraDOMICILIO_LEGAL.Provincia then
  if fraDOMICILIO_POSTAL.Numero          = fraDOMICILIO_LEGAL.Numero then
  if fraDOMICILIO_POSTAL.Piso            = fraDOMICILIO_LEGAL.Piso then
  if fraDOMICILIO_POSTAL.Departamento    = fraDOMICILIO_LEGAL.Departamento then
  if fraDOMICILIO_POSTAL.CPA             = fraDOMICILIO_LEGAL.CPA then
    EsIgual := True;   //Si llega este punto vamos a considerar que son iguales
  Result := EsIgual;
end;

procedure TfrmModificacionContrato.CopiarDomicilio;
begin
  fraDOMICILIO_LEGAL.CodigoPostal  := fraDOMICILIO_POSTAL.CodigoPostal;
  fraDOMICILIO_LEGAL.Calle         := fraDOMICILIO_POSTAL.Calle;
  fraDOMICILIO_LEGAL.Localidad     := fraDOMICILIO_POSTAL.Localidad;
  fraDOMICILIO_LEGAL.Provincia     := fraDOMICILIO_POSTAL.Provincia;
  fraDOMICILIO_LEGAL.Numero        := fraDOMICILIO_POSTAL.Numero;
  fraDOMICILIO_LEGAL.Piso          := fraDOMICILIO_POSTAL.Piso;
  fraDOMICILIO_LEGAL.Departamento  := fraDOMICILIO_POSTAL.Departamento;
  fraDOMICILIO_LEGAL.CPA           := fraDOMICILIO_POSTAL.CPA;
end;

procedure TfrmModificacionContrato.btnCopiarDomicilioClick(
  Sender: TObject);
begin
  //Agregar un botón con la función de transcribir los datos del domicilio legal para el postal.
  //(esto lo necesitamos para cuando el domicilio que valide el Cliente sea el Legal y el postal
  //tk 55833
  CopiarDomicilio;
end;

procedure TfrmModificacionContrato.FormMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
var                       //tk 58439 No se...los monitores que estan entrando tienen menos resolucion que una tablet...
  code: Cardinal;
  i: Integer;
  msg: Cardinal;
  n: Integer;
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
  if PgContrato.ActivePageIndex = 4 then
  begin
    for i:= 1 to n do
      ScrollBox1.Perform(msg, code, 0);
    ScrollBox1.Perform(msg, SB_ENDSCROLL, 0);
  end;
end;

function TfrmModificacionContrato.IsDomicilioIgualSQL: boolean;
begin
  Result := (DC_CALLE_LEGAL = DC_CALLE_POSTAL) and
            (DC_LOCALIDAD_LEGAL = DC_LOCALIDAD_POSTAL) and
            (DC_CPOSTAL_LEGAL = DC_CPOSTAL_POSTAL) and
            (DC_PROVINCIA_LEGAL = DC_PROVINCIA_POSTAL) and
            (DC_NUMERO_Legal = DC_NUMERO_POSTAL) and
            (DC_PISO_Legal = DC_PISO_POSTAL) and
            (DC_DEPARTAMENTO_Legal = DC_DEPARTAMENTO_POSTAL) and
            (DC_CPOSTALA_Legal = DC_CPOSTALA_POSTAL) and
            (DC_CODAREAFAX_Legal = DC_CODAREAFAX_POSTAL) and
            (DC_FAX_Legal = DC_FAX_POSTAL) and
            (DC_MAIL_Legal = DC_MAIL_POSTAL) and
            (DC_OBSERVACIONES_Legal = DC_OBSERVACIONES_POSTAL);
end;

procedure TfrmModificacionContrato.fraEN_MOTIVO_AltaExit(Sender: TObject);
begin
  fraEN_MOTIVO_Alta.FrameExit(Sender);
  if (fraEN_MOTIVO_Alta.Codigo = '323') and (IsDomicilioIgualSQL) then
    MsgBox('El domicilio Constituido y Postal son iguales, no podrá guardar los datos con éste tipo de endoso');
end;

end.



