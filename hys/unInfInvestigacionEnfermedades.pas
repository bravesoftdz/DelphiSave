unit unInfInvestigacionEnfermedades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomPanelABM, ExtCtrls, StdCtrls, ExComboBox, FormPanel,
  Grids, DBGrids, RXDBCtrl, unFraCodigoDescripcion, ComCtrls, CurrEdit,
  Mask, unFraEmpresa, unFraDomicilioTrab, ToolEdit, DateComboBox, SinEdit,
  PatternEdit, IntEdit, unFraStaticCodigoDescripcion, unArt,
  unFraStaticCTB_TABLAS, Buttons, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraTrabajador, unFraTrabajadorSiniestro_D5,
  unFraTrabajadorSinGrave, SDEngine, DB, Placemnt, artSeguridad,
  ShortCutControl, ToolWin, unFraTrabajadorSiniestro, unqrInvestigacionEnfermedad,
  BaseGrid, AdvGrid, DBAdvGrid, frmctrllink, AdvMemo, EditBtn, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, ArtComboBox, ArtDBGrid, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmInfInvestigacionEnfermedades = class(TfrmCustomPanelABM)
    sdqPMC_MEDIDACORRECTIVAENF: TSDQuery;
    Bevel1: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel9: TBevel;
    btnPPECancelar: TButton;
    btnTop: TSpeedButton;
    btPMCAceptar: TButton;
    btPMCCancelar: TButton;
    btPPEAceptar: TButton;
    btPSVAceptar: TButton;
    btPSVCancelar: TButton;
    cbPRAM: TCheckBox;
    chkEE_HORASEXTRAS: TCheckBox;
    chkEE_PROGRAMAAPROBADO: TCheckBox;
    chkEE_TURNOROTATIVO: TCheckBox;
    cmbRL_FECHAINGRESO: TDateComboBox;
    cmbTJ_FNACIMIENTO: TDateComboBox;
    CoolBar1: TCoolBar;
    CoolBar3: TCoolBar;
    CoolBar5: TCoolBar;
    dbgPMC_MEDIDACORRECTIVA: TRxDBGrid;
    dbgPPE_PERSONAENTREVISTADA: TRxDBGrid;
    dbgPSV_SEGUIMIENTOVISITA: TRxDBGrid;
    dsPMC_MEDIDACORRECTIVAENF: TDataSource;
    dsPSV_SEGUIMIENTOVISITAENF: TDataSource;
    edCodAreaEnfermedadEstab: TPatternEdit;
    edDC_CODAREATELEFONOS: TPatternEdit;
    edDC_TELEFONOS: TPatternEdit;
    edEE_DESCRIPCIONENFERMEDAD: TMemo;
    edEE_DOTACION: TIntEdit;
    edEE_DOTACIONESTABLECIMIENTO: TIntEdit;
    edEE_EMPRESA: TPatternEdit;
    edEE_FECHA: TDateComboBox;
    edEE_FFINOBRA: TDateComboBox;
    edEE_FINICIOACTIVIDAD: TDateComboBox;
    edEE_FRECEPCIONOBRA: TDateComboBox;
    edEE_FREINICIOOBRA: TDateComboBox;
    edEE_FSUSPOBRA: TDateComboBox;
    edEE_HECHOSADICIONALES: TMemo;
    edEE_HORARIODESDE: TDateTimePicker;
    edEE_HORARIOHASTA: TDateTimePicker;
    edEE_INSTITUCIONOTORGANTE: TPatternEdit;
    edEE_NROESTABLECIMIENTO: TIntEdit;
    edEE_NUMEROMATRICULA: TEdit;
    edEE_OBSERVACIONES: TMemo;
    edEE_OTROSDATOS: TMemo;
    edEE_PLANTAS: TIntEdit;
    edEE_RESPONSABLE: TPatternEdit;
    edEE_SUPERFICIE: TCurrencyEdit;
    edEE_TAREASENFERMEDAD: TMemo;
    edEE_TAREASHABITUALES: TMemo;
    edEE_TELEFONOS: TPatternEdit;
    edEE_TITULO: TPatternEdit;
    edEX_FECHAENFERMEDAD: TDateComboBox;
    edMC_DESCRIPCION: TMemo;
    edMC_FECHAEJECUCION: TDateComboBox;
    edMC_FECHAVERIFICACION: TDateComboBox;
    edMC_MEDIDA: TIntEdit;
    edPE_CARGO: TPatternEdit;
    edPE_DOCUMENTO: TIntEdit;
    edPE_FECHA_ENTREVISTA: TDateComboBox;
    edPE_NOMBRE: TPatternEdit;
    edPE_TIPO_ENTREVISTA: TExComboBox;
    edRL_TAREA: TEdit;
    edSiniestro: TSinEdit;
    edSV_FECHA: TDateComboBox;
    edSV_TIPO: TExComboBox;
    edTJ_CODAREATELEFONO: TPatternEdit;
    edTJ_OTRANACIONALIDAD: TEdit;
    edTJ_TELEFONO: TPatternEdit;
    fpPMC_MEDIDACORRECTIVA: TFormPanel;
    fpPPE_PERSONAENTREVISTADA: TFormPanel;
    fpPSV_SEGUIMIENTOVISITA: TFormPanel;
    fraCO_IDACTIVIDAD: TfraStaticCodigoDescripcion;
    fraDomicilioEnfermedadEstabl: TfraDomicilioTrab;
    fraDomicilioEmpresa: TfraDomicilioTrab;
    fraDomicilioTrabaj: TfraDomicilioTrab;
    fraEE_ACTIVIDADOBRA: TfraStaticCTB_TABLAS;
    fraEE_ETAPAOBRA: TfraStaticCTB_TABLAS;
    fraEE_IDACTIVIDAD: TfraStaticCodigoDescripcion;
    fraEE_IDART: TfraStaticCodigoDescripcion;
    fraEE_IDOPERATIVO: TfraStaticCodigoDescripcion;
    fraEE_IDOPERATIVOEMPRESA: TfraStaticCodigoDescripcion;
    fraEE_LUGARDEOCURRENCIA: TfraStaticCTB_TABLAS;
    fraEE_PROGRAMA: TfraStaticCTB_TABLAS;
    fraEE_PROGRAMAEMPRESA: TfraStaticCTB_TABLAS;
    fraEE_PROGRAMASEGURIDAD: TfraStaticCTB_TABLAS;
    fraEE_TIPOMATRICULA: TfraStaticCTB_TABLAS;
    fraEE_TIPOOBRA: TfraStaticCTB_TABLAS;
    fraEmpresa: TfraEmpresa;
    fraPE_TIPODOCUMENTO: TfraStaticCTB_TABLAS;
    fraPreventor: TfraCodigoDescripcion;
    fraRL_CIUO: TfraStaticCodigoDescripcion;
    fraRL_IDMODALIDADCONTRATACION: TfraStaticCodigoDescripcion;
    fraTJ_IDNACIONALIDAD: TfraStaticCodigoDescripcion;
    fraTJ_SEXO: TfraStaticCTB_TABLAS;
    fraTrabajador: TfraTrabajador;
    fraTrabajadorSinGraveBusq: TfraTrabajadorSiniestro_D5;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
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
    Label3: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbActividad: TLabel;
    lbCA: TLabel;
    lbCUIL: TLabel;
    lbDocumento: TLabel;
    lbObservaciones: TLabel;
    lbPrograma: TLabel;
    lbSiniestro: TLabel;
    lbTarea: TLabel;
    lbTel: TLabel;
    lbTipoDocumento: TLabel;
    mskEE_CUIT: TMaskEdit;
    mskPE_CUIL: TMaskEdit;
    Operativo: TLabel;
    pcMedidasSeguim: TPageControl;
    pcCausasVisitas: TPageControl;
    pcDatos: TPageControl;
    pnlMedidasCorrectivas: TPanel;
    rgEE_TIPOESTABLECIMIENTO: TRadioGroup;
    ScrollBox: TScrollBox;
    sdqPPE_PERSONAENTREVISTADAENF: TSDQuery;
    sdqPSV_SEGUIMIENTOVISITAENF: TSDQuery;
    sduConsulta: TSDUpdateSQL;
    sduPMC_MEDIDACORRECTIVAENF: TSDUpdateSQL;
    sduPSV_SEGUIMIENTOVISITAENF: TSDUpdateSQL;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    tBarPMC_MEDIDACORRECTIVA: TToolBar;
    tBarPPE_PERSONAENTREVISTADA: TToolBar;
    tBarPSV_SEGUIMIENTOVISITA: TToolBar;
    tbManTrabajadores: TToolButton;
    tbPMCEliminar: TToolButton;
    tbPMCModificar: TToolButton;
    tbPMCNuevo: TToolButton;
    tbPPEEliminar: TToolButton;
    tbPPEModificar: TToolButton;
    tbPPENuevo: TToolButton;
    tbPSVEliminar: TToolButton;
    tbPSVModificar: TToolButton;
    tbPSVNuevo: TToolButton;
    tsMedidasSeguim: TTabSheet;
    tsDatosSiniestro: TTabSheet;
    tsEntrevistas: TTabSheet;
    tsMedidasCorrectivas: TTabSheet;
    tsSeguimientoVisitas: TTabSheet;
    lbCUIT: TLabel;
    tsDatosAgentes: TTabSheet;
    frmPanelESOP: TFormPanel;
    lbESOP: TLabel;
    fraESOP: TfraCodigoDescripcion;
    Panel1: TPanel;
    btnESOPAceptar: TButton;
    btnESOPCancel: TButton;
    Panel2: TPanel;
    scbDatosAgente: TScrollBox;
    lbPresenciaAgente: TLabel;
    lbFrecuencia: TLabel;
    lbDuracion: TLabel;
    lbMedAmbientales: TLabel;
    lbVacunacion: TLabel;
    lbLimiteLegal: TLabel;
    lbEPPAdecuados: TLabel;
    lbEstErgonom: TLabel;
    lbNivelConcent: TLabel;
    lbCapacitacion: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    edMemPresAgente: TMemo;
    edMemDuraExpo: TMemo;
    edMemMedAmb: TMemo;
    edMemNivConcent: TMemo;
    edMemSuperaLimite: TMemo;
    edMemEPP: TMemo;
    edMemCapacit: TMemo;
    edMemEstErgo: TMemo;
    edMemVacunacion: TMemo;
    edMemFrecExpo: TMemo;
    cmbFrecuencia: TComboBox;
    cmbNivelesConce: TComboBox;
    Panel3: TPanel;
    rbtPresenciaAgenteSI: TRadioButton;
    rbtPresenciaAgenteNO: TRadioButton;
    Panel6: TPanel;
    rbtMedAmbSI: TRadioButton;
    rbtMedAmbNO: TRadioButton;
    Panel7: TPanel;
    rbtSuperaLimiteSI: TRadioButton;
    rbtSuperaLimiteNO: TRadioButton;
    Panel8: TPanel;
    rbtEPPSI: TRadioButton;
    rbtEPPNO: TRadioButton;
    Panel9: TPanel;
    rbtCapacitSI: TRadioButton;
    rbtCapacitNO: TRadioButton;
    Panel10: TPanel;
    rbtEstErgoSI: TRadioButton;
    rbtEstErgoNO: TRadioButton;
    Panel11: TPanel;
    rbtVacunaSI: TRadioButton;
    rbtVacunaNO: TRadioButton;
    CoolBar6: TCoolBar;
    tBarAgentesDetect: TToolBar;
    tbAltaESOP: TToolButton;
    tbModESOP: TToolButton;
    tbBajaESOP: TToolButton;
    tsDatosAdicionales: TTabSheet;
    scbDatosAdicionales: TScrollBox;
    grpBoxDatosSector: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    chkPisoMad: TCheckBox;
    chkPisoHormi: TCheckBox;
    chkPisoTierra: TCheckBox;
    chkPisoOtros: TCheckBox;
    chkParedMad: TCheckBox;
    chkParedHormi: TCheckBox;
    chkParedChapa: TCheckBox;
    chkParedOtros: TCheckBox;
    chkTechoMad: TCheckBox;
    chkTechoTing: TCheckBox;
    chkTechoLoza: TCheckBox;
    chkTechoOtros: TCheckBox;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    chkVentNat: TCheckBox;
    chkVentExtrac: TCheckBox;
    chkVentInyec: TCheckBox;
    chkVentOtros: TCheckBox;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    chkLocRend: TCheckBox;
    chkLocCab: TCheckBox;
    chkLocCamp: TCheckBox;
    chkLocOtros: TCheckBox;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    chkRuidoPaneles: TCheckBox;
    chkRuidoAisAcust: TCheckBox;
    chkIlumArtif: TCheckBox;
    chkIlumNat: TCheckBox;
    Shape7: TShape;
    grpBoxAntecedentes: TGroupBox;
    Label84: TLabel;
    Label79: TLabel;
    Label114: TLabel;
    edAntecedObs: TMemo;
    grpDiagnostico: TGroupBox;
    Panel4: TPanel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    grpServiciosProf: TGroupBox;
    Label91: TLabel;
    Label92: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    chkMedTrabTipoInt: TCheckBox;
    chkMedTrabTipoExt: TCheckBox;
    chkHigSegTipoInt: TCheckBox;
    chkHigSegTipoExt: TCheckBox;
    Panel5: TPanel;
    rbtPlanEscritoSI: TRadioButton;
    rbtPlanEscritoNO: TRadioButton;
    rbtPlanEscritoNC: TRadioButton;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Panel12: TPanel;
    rbtMapasRiesgoSI: TRadioButton;
    rbtMapasRiesgoNO: TRadioButton;
    rbtMapasRiesgoNC: TRadioButton;
    Panel13: TPanel;
    rbtMedRuidoSI: TRadioButton;
    rbtMedRuidoNO: TRadioButton;
    rbtMedRuidoNC: TRadioButton;
    Panel14: TPanel;
    rbtEstluminacionSI: TRadioButton;
    rbtEstluminacionNO: TRadioButton;
    rbtEstluminacionNC: TRadioButton;
    Panel15: TPanel;
    rbtMedCargaTermSI: TRadioButton;
    rbtMedCargaTermNO: TRadioButton;
    rbtMedCargaTermNC: TRadioButton;
    Panel16: TPanel;
    rbtNormasEstabSI: TRadioButton;
    rbtNormasEstabNO: TRadioButton;
    rbtNormasEstabNC: TRadioButton;
    Panel17: TPanel;
    rbtMedContracSI: TRadioButton;
    rbtMedContracNO: TRadioButton;
    rbtMedContracNC: TRadioButton;
    Panel18: TPanel;
    rbtProdPeligrosoSI: TRadioButton;
    rbtProdPeligrosoNO: TRadioButton;
    rbtProdPeligrosoNC: TRadioButton;
    Panel19: TPanel;
    rbtPlanAccionSI: TRadioButton;
    rbtPlanAccionNO: TRadioButton;
    rbtPlanAccionNC: TRadioButton;
    Panel20: TPanel;
    rbtMedImplementSI: TRadioButton;
    rbtMedImplementNO: TRadioButton;
    rbtMedImplementNC: TRadioButton;
    Panel21: TPanel;
    rbtMedTrabajoSI: TRadioButton;
    rbtMedTrabajoNO: TRadioButton;
    Panel22: TPanel;
    rbtHigieneSegurSI: TRadioButton;
    rbtHigieneSegurNO: TRadioButton;
    Panel23: TPanel;
    rbtRiesgosAnteSI: TRadioButton;
    rbtRiesgosAnteNO: TRadioButton;
    Panel24: TPanel;
    rbtTrabInsalubSI: TRadioButton;
    rbtTrabInsalubNO: TRadioButton;
    edMedTrabResp: TEdit;
    edHigieSegurResp: TEdit;
    edMedTrabRespMatri: TEdit;
    edHigSegRespMatri: TEdit;
    edMemos: TcxMemo;
    sdqPED_ENFERMEDADDATAADICIONAL: TSDQuery;
    dsPED_ENFERMEDADDATAADICIONAL: TDataSource;
    sdqPAD_AGENTESDETECTADOS: TSDQuery;
    dsPAD_AGENTESDETECTADOS: TDataSource;
    grdDatosAgentes: TArtDBGrid;
    sduPAD_AGENTESDETECTADOS: TSDUpdateSQL;
    fraESOPAsociado: TfraCodigoDescripcion;
    Label122: TLabel;
    edDuraExpo: TIntEdit;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    KeepConn: TTimer;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnESOPAceptarClick(Sender: TObject);
    procedure btnESOPCancelClick(Sender: TObject);
    procedure btnTopClick(Sender: TObject);
    procedure btPMCAceptarClick(Sender: TObject);
    procedure btPPEAceptarClick(Sender: TObject);
    procedure btPSVAceptarClick(Sender: TObject);
    procedure dbgPMC_MEDIDACORRECTIVADblClick(Sender: TObject);
    procedure dbgPMC_MEDIDACORRECTIVAGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                   Highlight: Boolean);
    procedure dbgPPE_PERSONAENTREVISTADAGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                      var Background: TColor; Highlight: Boolean);
    procedure dbgPSV_SEGUIMIENTOVISITADblClick(Sender: TObject);
    procedure dbgPSV_SEGUIMIENTOVISITAGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                    Highlight: Boolean);
    procedure edMemosExit(Sender: TObject);
    procedure edMemosKeyPress(Sender: TObject; var Key: Char);
    procedure edMemPresAgenteDblClick(Sender: TObject);
    procedure edSiniestroExit(Sender: TObject);
    procedure fpPMC_MEDIDACORRECTIVAEnter(Sender: TObject);
    procedure fraEE_PROGRAMAChange(Sender: TObject);
    procedure fraEE_PROGRAMAEMPRESAChange(Sender: TObject);
    procedure fraPreventorcmbDescripcionCloseUp(Sender: TObject);
    procedure fraPreventorcmbDescripcionDropDown(Sender: TObject);
    procedure fraTrabajadorExit(Sender: TObject);
    procedure fraTrabajadorSinGraveBusqedSiniestroSelect(Sender: TObject);
    procedure frmPanelESOPKeyPress(Sender: TObject; var Key: Char);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure FSFormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta:
        Integer; MousePos: TPoint; var Handled: Boolean);
    procedure grdDatosAgentesDblClick(Sender: TObject);
    procedure grdDatosAgentesGetCellParams(Sender: TObject; Field: TField; AFont:
        TFont; var Background: TColor; Highlight: Boolean);
    procedure KeepConnTimer(Sender: TObject);
    procedure mskEE_CUITExit(Sender: TObject);
    procedure OnFraPreventorChange(Sender : TObject);
    procedure pcMedidasSeguimChange(Sender: TObject);
    procedure pcCausasVisitasChange(Sender: TObject);
    procedure pcDatosChange(Sender: TObject);
    procedure rgEE_TIPOESTABLECIMIENTOClick(Sender: TObject);
    procedure scbDatosAgenteClick(Sender: TObject);
    procedure sdqPMC_MEDIDACORRECTIVAAfterScroll(DataSet: TDataSet);
    procedure sdqPMC_MEDIDACORRECTIVAENFAfterOpen(DataSet: TDataSet);
    procedure sdqPMC_MEDIDACORRECTIVAENFAfterScroll(DataSet: TDataSet);
    procedure sdqPPE_PERSONAENTREVISTADAENFAfterOpen(DataSet: TDataSet);
    procedure sdqPSV_SEGUIMIENTOVISITAENFAfterOpen(DataSet: TDataSet);
    procedure sdqRelacionesAfterOpen(DataSet: TDataSet);
    procedure sdqRelacionesPCMAfterOpen(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tbAltaESOPClick(Sender: TObject);
    procedure tbBajaESOPClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbManTrabajadoresClick(Sender: TObject);
    procedure tbModESOPClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbPMCEliminarClick(Sender: TObject);
    procedure tbPMCModificarClick(Sender: TObject);
    procedure tbPMCNuevoClick(Sender: TObject);
    procedure tbPPEEliminarClick(Sender: TObject);
    procedure tbPPEModificarClick(Sender: TObject);
    procedure tbPPENuevoClick(Sender: TObject);
    procedure tbPSVEliminarClick(Sender: TObject);
    procedure tbPSVModificarClick(Sender: TObject);
    procedure tbPSVNuevoClick(Sender: TObject);
  private
    AEstablecimiento: Integer;
    FCargo: Boolean;
    FCuit: String;
    ModoABMTablas: TModoABM;
    FModoABMESOP: TModoABM;
    pbEsMortal: Boolean;
    pIdRelacionLaboral: TTableId;
    function BusquedaValida(var iSiniestro, iOrden, iRecaida: Integer): Boolean;
    procedure Do_BuscarDatosEnfermedad(iSiniestro, iOrden, iRecaida: Integer);
    procedure Do_DarBajaSeguimientoVisita(IdMedidaCorrectiva: TTableId);
    procedure Do_DeshabilitarDatosSiniestro;
    procedure Do_GuardarDatosHistoricoLaboral(IdTrabajador: TTableId; Contrato: Integer; Tarea, CIUO: String;
                                              FechaIngreso: TDateTime; IdModalidadContratacion: TTableId);
    procedure Do_HabilitarDatosBusquedaDenunciaGrave(Habilitar: Boolean);
    procedure Do_HabilitarDatosRelacionLaboral(HabilitarRelLaboral: Boolean);
    procedure Do_ImprimirInvestigacionEnfermedad(IdEnfermedadEstablecimiento:
        TTableId);
    procedure Do_LimpiarDatosSiniestro;
    procedure HabilitarCUILPersEntrevistada(HabilitarCUIL: Boolean);
    procedure IrPrincipioPantalla;
    function Is_EnfermedadEstablId: Boolean;
    function Is_EstablecimInvestigAccValido(CUIT: String; NroEstableci: Integer): Boolean;
    procedure OnfraPE_TIPODOCUMENTOChange(Sender: TObject);
    procedure SetID(ADataSet: TSDQuery; AId: TTableId);
    procedure SetIDENFERMEDADESTABLECIMIENTO(AId: TTableId);
    procedure SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(AId: TTableId);
  protected
    procedure ClearControls(ClearPK: Boolean = False); override;
    function DoABM: Boolean; override;
    procedure DoDarDeBaja(ADataSet: TSDQuery; APrefijo: String; AAllowDelete: Boolean = True);
    procedure Do_CargarDatosSiniestro(iSiniestro, iOrden, iRecaida: Integer; CargarValoresDefecto,
                                      CargarSoloDatosTrabajador: Boolean);
    procedure LoadControls; override;
    procedure PKChange(ASelected: Boolean); override;
    function PkViolated(DataSet: TDataSet; FieldNames: Array of String; FieldValues: Array of Variant): Boolean;
    function Validar: Boolean; override;
  public
    procedure CargarDatosAdicionales;
    procedure CargarDatosAgentes;
    procedure EditarMemos(edComponente: TEdit);
    procedure GuardarChks;
    procedure GuardarDatosAdicionales;
    procedure LimpiarDatosA;
    procedure LimpiarDatosAgentes;
    procedure OnfraTrabajadorSinGraveBusqChange(Sender: TObject);
    function VerificarDatosAdicionales: Boolean;
    function VerificarDatosAgente: Boolean;
  end;

const
  ERROR_AL_GUARDAR_DATOS = 'Error al guardar los datos.';

var
  frmInfInvestigacionEnfermedades: TfrmInfInvestigacionEnfermedades;


implementation
uses
  AnsiSql, DBFuncs, unPrincipal, unContratoTrabajador, unDmPrincipal, CustomDlgs, Printers,
  StrFuncs, CUIT, General, VCLExtra, unRtti, unComunes, DateTimeFuncs, Numeros,  Math, DateUtils,
  StrUtils, unComunesFet;

{$R *.DFM}

const
  PAGE_DATOSGENERALES         = 0;
  PAGE_PERSONASENTREVISTADAS  = 1;
  PAGE_MEDIDASSEGUIM          = 2;
  PAGE_DATOSAGENTES           = 3;
  PAGE_DATOSADICIONALES       = 4;

  PAGE_MEDIDASCORRECTIVAS     = 0;

  PAGE_CAUSAMEDIDAS           = 0;
  PAGE_SEGUIMIENTOVISITAS     = 1;

procedure TfrmInfInvestigacionEnfermedades.btnAceptarClick(Sender: TObject);
begin
  if not sdqConsulta.Active then
    sdqConsulta.Active := True;
  inherited;
  tbModificar.Enabled := True;
  tbNuevo.Enabled := True;
end;

procedure TfrmInfInvestigacionEnfermedades.btnCancelarClick(Sender: TObject);
begin
  inherited;
  RollBackUpdates;
  sdqPAD_AGENTESDETECTADOS.Active       := False;
  sdqPPE_PERSONAENTREVISTADAENF.Active  := False;
  sdqPMC_MEDIDACORRECTIVAENF.Active     := False;
  sdqPSV_SEGUIMIENTOVISITAENF.Active    := False;
  pcDatos.ActivePageIndex := 0;
  if (not edSiniestro.IsEmpty) then
    tbImprimir.Enabled := True;
  fraTrabajadorSinGraveBusq.edSiniestro.SetFocus;
end;

procedure TfrmInfInvestigacionEnfermedades.btnESOPAceptarClick(Sender: TObject);
begin
  if VerificarDatosAgente then
  begin
    try
      with sdqPAD_AGENTESDETECTADOS do
      begin
        if not sdqPAD_AGENTESDETECTADOS.Active then
            sdqPAD_AGENTESDETECTADOS.Active := True;
        if FModoABMESOP = maAlta then
        begin
          Insert;
          FieldByName('AD_ID').AsInteger         := GetSecNextVal('HYS.SEQ_PAD_ID');
          FieldByName('AD_FECHAALTA').AsDateTime := DBDateTime;
          FieldByName('AD_USUALTA').AsString     := frmPrincipal.DBLogin.UserId;
        end else
        begin
          Edit;
          FieldByName('AD_FECHAMODIF').AsDateTime := DBDateTime;
          FieldByName('AD_USUMODIF').AsString     := frmPrincipal.DBLogin.UserId;
        end;

        FieldByName('AD_PRGID').AsInteger             := fraESOP.Value;
        FieldByName('AD_ESOP').AsString               := fraESOP.Codigo;
        FieldByName('AD_DESCRIPCION').AsString        := fraESOP.Descripcion;

        FieldByName('AD_PRESENCIAAGENTE').AsString    :=
            IIF(rbtPresenciaAgenteSI.Checked, 'S', iif(rbtPresenciaAgenteNO.Checked, 'N', ''));

        FieldByName('AD_FRECUENCIAEXPO').AsString     := cmbFrecuencia.Text;
        FieldByName('AD_DURACIONEXPO').AsInteger      := edDuraExpo.Value;

        FieldByName('AD_MEDICIONESAMB').AsString      :=
            IIF(rbtMedAmbSI.Checked, 'S', iif(rbtMedAmbNO.Checked, 'N', ''));

        FieldByName('AD_NIVELCONCENTRACION').AsString := cmbNivelesConce.Text;

        FieldByName('AD_SUPERALIMITE').AsString       :=
            IIF(rbtSuperaLimiteSI.Checked, 'S', iif(rbtSuperaLimiteNO.Checked, 'N', ''));

        FieldByName('AD_EPPADECUADOS').AsString       :=
            IIF(rbtEPPSI.Checked, 'S', iif(rbtEPPNO.Checked, 'N', ''));

        FieldByName('AD_CAPACITATRAB').AsString       :=
            IIF(rbtCapacitSI.Checked, 'S', iif(rbtCapacitNO.Checked, 'N', ''));

        FieldByName('AD_ESTUDIOSERG').AsString        :=
            IIF(rbtEstErgoSI.Checked, 'S', iif(rbtEstErgoNO.Checked, 'N', ''));

        FieldByName('AD_VACUNACION').AsString         :=
            IIF(rbtVacunaSI.Checked, 'S', iif(rbtVacunaNO.Checked, 'N', ''));

        FieldByName('AD_OBSPRESENCIAAGENTE').AsString := edMemPresAgente.Text;
        FieldByName('AD_OBSFRECUENCIA').AsString      := edMemFrecExpo.Text;
        FieldByName('AD_OBSDURAEXPO').AsString        := edMemDuraExpo.Text;
        FieldByName('AD_OBSMEDAMB').AsString          := edMemMedAmb.Text;
        FieldByName('AD_OBSNIVCONCENT').AsString      := edMemNivConcent.Text;
        FieldByName('AD_OBSLIMITELEGAL').AsString     := edMemSuperaLimite.Text;
        FieldByName('AD_OBSEPP').AsString             := edMemEPP.Text;
        FieldByName('AD_OBSCAPACIT').AsString         := edMemCapacit.Text;
        FieldByName('AD_OBSESTERGO').AsString         := edMemEstErgo.Text;
        FieldByName('AD_OBSVACU').AsString            := edMemVacunacion.Text;
        FieldByName('AD_EXPEDIENTE').AsInteger        := edSiniestro.Siniestro;
        FieldByName('AD_ESOPASOCIADO').AsString       := fraESOPAsociado.Codigo;
        FieldByName('AD_ESOPASOCIADODESC').AsString   := fraESOPAsociado.Descripcion;
        Post;
        ApplyUpdates;
        CommitUpdates;
        frmPanelESOP.ModalResult := mrOK;
      end;
    except
      on E: Exception do
      begin
        sdqPAD_AGENTESDETECTADOS.CancelUpdates;
        ErrorMsg(E, ERROR_AL_GUARDAR_DATOS);
      end;
    end;
  end;

end;

procedure TfrmInfInvestigacionEnfermedades.btnESOPCancelClick(Sender: TObject);
begin
  fraESOP.Clear;
  frmPanelESOP.ModalResult := mrCancel;
end;

procedure TfrmInfInvestigacionEnfermedades.btnTopClick(Sender: TObject);
begin
  edSiniestro.SetFocus;
end;

procedure TfrmInfInvestigacionEnfermedades.btPMCAceptarClick(Sender: TObject);
var
  sSql: String;
  pEE_ID: TTableId;
  iPMCMedida: Integer;
begin
  if edMC_FECHAEJECUCION.IsEmpty then
    InvalidMsg(edMC_FECHAEJECUCION, 'Debe ingresar la fecha de ejecución.')

  else if edMC_FECHAEJECUCION.Date < edEE_FECHA.Date then
    InvalidMsg(edMC_FECHAEJECUCION,
        'La fecha de ejecución debe ser mayor o igual a la fecha de investigación.')

  else if edMC_FECHAVERIFICACION.IsEmpty then
    InvalidMsg(edMC_FECHAVERIFICACION, 'Debe ingresar la fecha de verificación.')

  else if edMC_FECHAVERIFICACION.Date < edMC_FECHAEJECUCION.Date then
    InvalidMsg(edMC_FECHAVERIFICACION,
        'La fecha de verificación debe ser mayor igual a la fecha de ejecución.')

  else if IsEmptyString(edMC_DESCRIPCION.Text) then
    InvalidMsg(edMC_DESCRIPCION, 'Debe ingresar la descripción de la medida correctiva.')

  else
    with sdqPMC_MEDIDACORRECTIVAENF do
    begin
      try
        if not sdqPMC_MEDIDACORRECTIVAENF.Active then
          sdqPMC_MEDIDACORRECTIVAENF.Active := True;

        pEE_ID := sdqConsulta.FieldByName('EE_ID').AsInteger;

        if ModoABMTablas = maAlta then
        begin
          Insert;

          FieldByName('MC_ID').AsInteger                          := GetSecNextVal('HYS.SEQ_PMC_ID');
          FieldByName('MC_IDENFERMEDADESTABLECIMIENTO').AsInteger := pEE_ID;

          sSql :=
            'SELECT NVL(MAX(MC_MEDIDA), 0) + 1' +
             ' FROM HYS.PMC_MEDIDACORRECTIVAENF' +
            ' WHERE MC_IDENFERMEDADESTABLECIMIENTO = ' + SqlValue(pEE_ID);
          iPMCMedida := ValorSqlInteger(sSql);

          FieldByName('MC_MEDIDA').AsInteger                     := iPMCMedida;
        end
        else
          Edit;

        FieldByName('MC_DESCRIPCION').AsString                 := edMC_DESCRIPCION.Text;
        FieldByName('MC_FECHAEJECUCION').AsDateTime            := edMC_FECHAEJECUCION.Date;
        FieldByName('MC_FECHAVERIFICACION').AsDateTime         := edMC_FECHAVERIFICACION.Date;
        FieldByName('USUARIO').AsString                        := frmPrincipal.DBLogin.UserID;
        FieldByName('MC_USUBAJA').Value                        := Null;
        FieldByName('MC_FECHABAJA').Value                      := Null;

        Post;
        ApplyUpdates;

        SetID(sdqPMC_MEDIDACORRECTIVAENF, pEE_ID);
        sdqPMC_MEDIDACORRECTIVAENF.Open;

        fpPMC_MEDIDACORRECTIVA.ModalResult := mrOk;
      except
        on E: Exception do
        begin
          CancelUpdates;
          ErrorMsg(E, ERROR_AL_GUARDAR_DATOS);
        end;
      end;
    end;
end;

procedure TfrmInfInvestigacionEnfermedades.btPPEAceptarClick(Sender: TObject);
var
  pEE_ID: TTableId;
begin
  if fraPE_TIPODOCUMENTO.IsEmpty and (not edPE_DOCUMENTO.ReadOnly) then  // solo por problemas con el fraSTATIC_CTBTABLAS, que no dispara el OnChange si se limpia pasando con Tab y no con Enter
    InvalidMsg(fraPE_TIPODOCUMENTO.edCodigo, 'Si el Tipo de Documento está vacío, debe ingresar un CUIL.')

  else if not mskPE_CUIL.ReadOnly and IsEmptyString(mskPE_CUIL.Text) then
    InvalidMsg(mskPE_CUIL, 'Debe ingresar el CUIL del entrevistado.')

  else if not mskPE_CUIL.ReadOnly and (not IsCuil(mskPE_CUIL.Text)) then
    InvalidMsg(mskPE_CUIL, 'El CUIL ingresado no es válido.')

  else if not edPE_DOCUMENTO.ReadOnly and edPE_DOCUMENTO.IsEmpty then
    InvalidMsg(edPE_DOCUMENTO, 'Debe ingresar el Documento del entrevistado.')

  else if not edPE_DOCUMENTO.ReadOnly and (edPE_DOCUMENTO.Value <= 0) then
    InvalidMsg(edPE_DOCUMENTO, 'El Documento ingresado no es válido.')

  else if IsEmptyString(edPE_NOMBRE.Text) then
    InvalidMsg(edPE_NOMBRE, 'Debe ingresar el Nombre del Entrevistado.')

  else if IsEmptyString(edPE_CARGO.Text) then
    InvalidMsg(edPE_CARGO, 'Debe ingresar el Cargo en la Empresa del Entrevistado.')

  else if not mskPE_CUIL.ReadOnly and PkViolated(sdqPPE_PERSONAENTREVISTADAENF, ['PE_CUIL'], [mskPE_CUIL.Text]) then
    InvalidMsg(mskPE_CUIL, 'Ya se ha cargado un entrevistado con el mismo CUIL.')

  else if PkViolated(sdqPPE_PERSONAENTREVISTADAENF, ['PE_NOMBRE'], [edPE_NOMBRE.Text]) then
    InvalidMsg(edPE_NOMBRE, 'Ya se ha cargado un entrevistado con el mismo Nombre.')

  else if edPE_FECHA_ENTREVISTA.Date = 0 then
    InvalidMsg(edPE_FECHA_ENTREVISTA, 'Debe ingresar la fecha de la entrevista.')

  else if edPE_FECHA_ENTREVISTA.Date < edEE_FECHA.Date then
    InvalidMsg(edPE_FECHA_ENTREVISTA, 'La fecha de la entrevista no puede ser anterior a la de la investigacion.')

  else if edPE_TIPO_ENTREVISTA.ItemIndex = -1 then
    InvalidMsg(edPE_TIPO_ENTREVISTA, 'Debe seleccionar un tipo de entrevista.')

  else
    with sdqPPE_PERSONAENTREVISTADAENF do
    begin
      try
        pEE_ID := sdqConsulta.FieldByName('EE_ID').AsInteger;

        if ModoABMTablas = maAlta then
        begin
          Insert;

          FieldByName('PE_ID').AsInteger                         := GetSecNextVal('HYS.SEQ_PPE_ID');
          FieldByName('PE_IDENFERMEDADESTABLECIMIENTO').AsInteger := pEE_ID;
        end
        else
          Edit;

        FieldByName('PE_TIPODOCUMENTO').AsString      := fraPE_TIPODOCUMENTO.Codigo;
        FieldByName('PE_CUIL').AsString               := mskPE_CUIL.Text;
        FieldByName('PE_DOCUMENTO').Value             := iif(edPE_DOCUMENTO.Value=0, Null, edPE_DOCUMENTO.Value);
        FieldByName('PE_NOMBRE').AsString             := edPE_NOMBRE.Text;
        FieldByName('PE_CARGO').AsString              := edPE_CARGO.Text;
        FieldByName('PE_FECHA_ENTREVISTA').AsDateTime := edPE_FECHA_ENTREVISTA.Date;
        FieldByName('PE_TIPO_ENTREVISTA').AsString    := edPE_TIPO_ENTREVISTA.Value;
        FieldByName('USUARIO').AsString               := frmPrincipal.DBLogin.UserID;
        FieldByName('PE_USUBAJA').Value               := Null;
        FieldByName('PE_FECHABAJA').Value             := Null;

        // solo para mostrar
        FieldByName('TIPO_ENTREVISTA').AsString       := edPE_TIPO_ENTREVISTA.GetItemText( edPE_TIPO_ENTREVISTA.ItemIndex );
        FieldByName('DESCRTIPODOCUMENTO').AsString    := fraPE_TIPODOCUMENTO.cmbDescripcion.Text;

        Post;
        ApplyUpdates;

        SetID(sdqPPE_PERSONAENTREVISTADAENF, pEE_ID);
        sdqPPE_PERSONAENTREVISTADAENF.Open;

        fpPPE_PERSONAENTREVISTADA.ModalResult := mrOk;
      except
        on E: Exception do
        begin
          CancelUpdates;
          ErrorMsg(E, 'Error al guardar los datos');
        end;
      end;
    end;
end;

procedure TfrmInfInvestigacionEnfermedades.btPSVAceptarClick(Sender: TObject);
var
  bEsAlta: Boolean;
begin
  bEsAlta := (ModoABMTablas = maAlta);

  Verificar(edSV_TIPO.ItemIndex = -1, edSV_TIPO, 'Debe seleccionar un tipo de visita.');
  Verificar(bEsAlta and (edSV_FECHA.Date = 0), edSV_FECHA, 'Debe ingresar la fecha de visita.');
  Verificar(bEsAlta and (edSV_FECHA.Date > DBDate), edSV_FECHA, 'La fecha de visita tiene que ser menor o igual a hoy.');

  if ((edSV_TIPO.Value = 'C') and (not ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITAENF WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_ID').AsInteger) + iif(not bEsAlta,  ' AND SV_ID <> ' +  sdqPSV_SEGUIMIENTOVISITAENF.FieldByName('SV_ID').AsString, '')))) then
  begin
    InvalidMsg(edSV_TIPO, 'La primer visita debe ser "Visita" o "Incumplimiento".');
    Abort;
  end;

  if ((edSV_TIPO.Value = 'V') and (ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITAENF WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_ID').AsInteger) + iif(not bEsAlta,  ' AND SV_ID <> ' +  sdqPSV_SEGUIMIENTOVISITAENF.FieldByName('SV_ID').AsString, '')))) then
  begin
    InvalidMsg(edSV_TIPO, 'La visita debe ser "Cumplimiento" o "Incumplimiento".');
    Abort;
  end;

  if bEsAlta and (ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITAENF WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_ID').AsInteger) + ' AND SV_FECHA = ' + SqlValue(edSV_FECHA.Date))) then
  begin
    InvalidMsg(edSV_FECHA, 'Ya existe una visita con esta fecha.');
    Abort;
  end;

  if bEsAlta and (edSV_FECHA.Date < sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_FECHAEJECUCION').AsDateTime) then
    if not MsgAsk('La fecha de visita es mayor o igual a la fecha de ejecución.' + CRLF + '¿Está seguro que la fecha ingresada es correcta?') then
      Abort;

  guardarSeguimientoEnfermedad(ModoABMTablas = maAlta, sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_ID').AsInteger, edSV_TIPO.Value, edSV_FECHA.Date, IIF(ModoABMTablas = maAlta,0,sdqPSV_SEGUIMIENTOVISITAENF.FieldByName('sv_ID').AsInteger));
  sdqPSV_SEGUIMIENTOVISITAENF.Refresh;
  fpPSV_SEGUIMIENTOVISITA.ModalResult := mrOk;

end;

function TfrmInfInvestigacionEnfermedades.BusquedaValida(var iSiniestro,
    iOrden, iRecaida: Integer): Boolean;
var
  bConDatos: Boolean;
  sSql: String;
  sSqlWhere: String;
begin
  sSQL := 'SELECT  ex_siniestro, '
        + '        ex_orden, '
        + '        ex_recaida '
        + '  FROM  sex_expedientes '
        + ' WHERE  1 = 1 '
        ;


  if iSiniestro > 0 then
    sSqlWhere :=
      ' AND EX_SINIESTRO = ' + SqlValue(iSiniestro) +
      ' AND EX_ORDEN = ' + SqlValue(iOrden) +
      ' AND EX_RECAIDA = ' + SqlValue(iRecaida) +
      ' AND EX_TIPO = 3 '
  else
    sSqlWhere := '';

  if sSqlWhere = '' then
    bConDatos := False
  else
  begin
    sSql := sSql + sSqlWhere;

    with GetQuery(sSql) do
    try
      if IsEmpty then
        bConDatos := False
      else
      begin
        bConDatos := True;
        iSiniestro := FieldByName('EX_SINIESTRO').AsInteger;
        iOrden     := FieldByName('EX_ORDEN').AsInteger;
        iRecaida   := FieldByName('EX_RECAIDA').AsInteger;

        with edSiniestro do
        begin
          Siniestro := iSiniestro;
          Orden     := iOrden;
          Recaida   := iRecaida;
        end;
      end;
    finally
      Free;
    end;
  end;

  Result := bConDatos;
end;

procedure TfrmInfInvestigacionEnfermedades.ClearControls(ClearPK: Boolean);
begin
  inherited;

  FCuit := '';
  AEstablecimiento := 0;

  Do_HabilitarDatosBusquedaDenunciaGrave(ClearPK and btnCancelar.Enabled);
  Do_LimpiarDatosSiniestro;
  Do_DeshabilitarDatosSiniestro;
  Do_HabilitarDatosRelacionLaboral(False);

  fraEE_PROGRAMA.Clear;
  fraEE_IDOPERATIVO.Clear;
  edEE_DOTACION.Clear;
  edEE_EMPRESA.Clear;
  mskEE_CUIT.Clear;
  fraEE_IDACTIVIDAD.Clear;
  edCodAreaEnfermedadEstab.Clear;
  edEE_TELEFONOS.Clear;
  fraEE_IDART.Clear;
  fraEE_PROGRAMAEMPRESA.Clear;
  fraEE_IDOPERATIVOEMPRESA.Clear;
  rgEE_TIPOESTABLECIMIENTO.ItemIndex := -1;
  edEE_NROESTABLECIMIENTO.Clear;
  edEE_DOTACIONESTABLECIMIENTO.Clear;
  fraEE_LUGARDEOCURRENCIA.Clear;
  edEE_FRECEPCIONOBRA.Clear;
  edEE_FINICIOACTIVIDAD.Clear;
  edEE_SUPERFICIE.Clear;
  edEE_PLANTAS.Clear;
  fraEE_TIPOOBRA.Clear;
  fraEE_ACTIVIDADOBRA.Clear;
  fraEE_ETAPAOBRA.Clear;
  chkEE_PROGRAMAAPROBADO.Checked := False;
  fraEE_PROGRAMASEGURIDAD.Clear;
  edEE_FFINOBRA.Clear;
  edEE_FSUSPOBRA.Clear;
  edEE_FREINICIOOBRA.Clear;
  edEE_OBSERVACIONES.Clear;
  chkEE_TURNOROTATIVO.Checked := False;
  edEE_HORARIODESDE.Time := StrToTime('00:00:00');
  edEE_HORARIOHASTA.Time := StrToTime('00:00:00');
  chkEE_HORASEXTRAS.Checked := False;
  cbPRAM.Checked := false;
  edEE_TAREASHABITUALES.Clear;
  edEE_TAREASENFERMEDAD.Clear;
  edEE_DESCRIPCIONENFERMEDAD.Clear;
  edEE_HECHOSADICIONALES.Clear;
  edEE_OTROSDATOS.Clear;
  edEE_TITULO.Clear;
  fraEE_TIPOMATRICULA.Clear;
  edEE_NUMEROMATRICULA.Clear;
  edEE_INSTITUCIONOTORGANTE.Clear;
  edEE_FECHA.Clear;
  fraPreventor.Clear;

  SetIDENFERMEDADESTABLECIMIENTO(0);
  SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(0);

  sdqConsulta.Open;
end;

procedure TfrmInfInvestigacionEnfermedades.dbgPMC_MEDIDACORRECTIVADblClick(
    Sender: TObject);
begin
  if (not sdqPMC_MEDIDACORRECTIVAENF.IsEmpty)
      and (sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_FECHABAJA').IsNull) then
    with sdqPMC_MEDIDACORRECTIVAENF do
    begin
      edMC_MEDIDA.Value           := FieldByName('MC_MEDIDA').AsInteger;
      edMC_FECHAEJECUCION.Date    := FieldByName('MC_FECHAEJECUCION').AsDateTime;
      edMC_FECHAVERIFICACION.Date := FieldByName('MC_FECHAVERIFICACION').AsDateTime;
      edMC_DESCRIPCION.Text       := FieldByName('MC_DESCRIPCION').AsString;
      ModoABMTablas := maModificacion;
      fpPMC_MEDIDACORRECTIVA.ShowModal;
    end;
end;

procedure TfrmInfInvestigacionEnfermedades.dbgPMC_MEDIDACORRECTIVAGetCellParams(Sender: TObject; Field: TField;
                                                                              AFont: TFont; var Background: TColor;
                                                                              Highlight: Boolean);
begin
  if not sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_USUBAJA').IsNull then
    AFont.Color:= clRed;
end;

procedure TfrmInfInvestigacionEnfermedades.dbgPPE_PERSONAENTREVISTADAGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPPE_PERSONAENTREVISTADAENF.FieldByName('PE_USUBAJA').IsNull then
    AFont.Color:= clRed;
end;

procedure TfrmInfInvestigacionEnfermedades.dbgPSV_SEGUIMIENTOVISITADblClick(
    Sender: TObject);
begin
  if (not sdqPSV_SEGUIMIENTOVISITAENF.IsEmpty) and (sdqPSV_SEGUIMIENTOVISITAENF.FieldByName('SV_FECHABAJA').IsNull) then
    with sdqPSV_SEGUIMIENTOVISITAENF do
    begin
      edSV_TIPO.Value := FieldByName('SV_TIPO').AsString;
      edSV_FECHA.Date := FieldByName('SV_FECHA').AsDateTime;

      VCLExtra.LockControl(edSV_FECHA, True);

      ModoABMTablas := maModificacion;

      fpPSV_SEGUIMIENTOVISITA.ShowModal;
    end;

end;

procedure TfrmInfInvestigacionEnfermedades.dbgPSV_SEGUIMIENTOVISITAGetCellParams(Sender: TObject; Field: TField;
                                                                               AFont: TFont; var Background: TColor;
                                                                               Highlight: Boolean);
begin
  if not sdqPSV_SEGUIMIENTOVISITAENF.FieldByName('SV_USUBAJA').IsNull then
    AFont.Color:= clRed;
end;

function TfrmInfInvestigacionEnfermedades.DoABM: Boolean;
var
  idExpediente : Integer;
begin
  BeginTrans(true);
  try
    with sdqConsulta do
    begin
      if ModoABM = maAlta Then
      begin
        Insert;
        FieldByName('EE_ID').AsInteger := GetSecNextVal('HYS.SEQ_PEE_ID');
      end
      else
        Edit;

      FieldByName('EE_PROGRAMA').AsString                 := fraEE_PROGRAMA.Codigo;
      FieldByName('EE_IDOPERATIVO').Value                 := Get_NullValueId(fraEE_IDOPERATIVO.Value);
      FieldByName('EE_DOTACION').AsInteger                := edEE_DOTACION.Value;
      FieldByName('EE_EMPRESA').AsString                  := Trim(edEE_EMPRESA.Text);
      FieldByName('EE_CUIT').AsString                     := mskEE_CUIT.Text;
      FieldByName('EE_IDACTIVIDAD').AsInteger             := fraEE_IDACTIVIDAD.Value;
      FieldByName('EE_CPOSTAL').AsString                  := fraDomicilioEnfermedadEstabl.CodigoPostal;
      FieldByName('EE_CALLE').AsString                    := fraDomicilioEnfermedadEstabl.Calle;
      FieldByName('EE_LOCALIDAD').AsString                := fraDomicilioEnfermedadEstabl.Localidad;
      FieldByName('EE_PROVINCIA').AsString                := Get_CodigoProvincia(fraDomicilioEnfermedadEstabl.Provincia);
      FieldByName('EE_NUMERO').AsString                   := fraDomicilioEnfermedadEstabl.Numero;
      FieldByName('EE_PISO').AsString                     := fraDomicilioEnfermedadEstabl.Piso;
      FieldByName('EE_DEPARTAMENTO').AsString             := fraDomicilioEnfermedadEstabl.Departamento;
      FieldByName('EE_CPOSTALA').AsString                 := fraDomicilioEnfermedadEstabl.CPA;
      FieldByName('EE_TELEFONOS').AsString                := Trim(edCodAreaEnfermedadEstab.Text + ' ' + edEE_TELEFONOS.Text);
      FieldByName('EE_IDART').Value                       := Get_NullValueId(fraEE_IDART.Value);
      FieldByName('EE_PROGRAMAEMPRESA').AsString          := fraEE_PROGRAMAEMPRESA.Codigo;
      FieldByName('EE_IDOPERATIVOEMPRESA').Value          := Get_NullValueId(fraEE_IDOPERATIVOEMPRESA.Value);
      FieldByName('EE_TIPOESTABLECIMIENTO').AsString      := Decode(IntToStr(rgEE_TIPOESTABLECIMIENTO.ItemIndex), ['0', '1'], ['E', 'O']);
      FieldByName('EE_NROESTABLECIMIENTO').Value          := Get_NullValueId(edEE_NROESTABLECIMIENTO.Value);
      FieldByName('EE_DOTACIONESTABLECIMIENTO').AsInteger := edEE_DOTACIONESTABLECIMIENTO.Value;
      FieldByName('EE_LUGARDEOCURRENCIA').AsString        := fraEE_LUGARDEOCURRENCIA.Codigo;
      FieldByName('EE_FRECEPCIONOBRA').Value              := Get_NullValueDate(edEE_FRECEPCIONOBRA.Date);
      FieldByName('EE_FINICIOACTIVIDAD').Value            := Get_NullValueDate(edEE_FINICIOACTIVIDAD.Date);
      FieldByName('EE_SUPERFICIE').Value                  := Get_NullValueNumber(edEE_SUPERFICIE.Value);
      FieldByName('EE_PLANTAS').Value                     := Get_NullValueNumber(edEE_PLANTAS.Value);
      FieldByName('EE_TIPOOBRA').AsString                 := fraEE_TIPOOBRA.Codigo;
      FieldByName('EE_ACTIVIDADOBRA').AsString            := fraEE_ACTIVIDADOBRA.Codigo;
      FieldByName('EE_ETAPAOBRA').AsString                := fraEE_ETAPAOBRA.Codigo;
      FieldByName('EE_PROGRAMAAPROBADO').AsString         := SqlBoolean(chkEE_PROGRAMAAPROBADO.Checked, False);
      FieldByName('EE_PROGRAMASEGURIDAD').AsString        := fraEE_PROGRAMASEGURIDAD.Codigo;
      FieldByName('EE_FFINOBRA').Value                    := Get_NullValueDate(edEE_FFINOBRA.Date);
      FieldByName('EE_FSUSPOBRA').Value                   := Get_NullValueDate(edEE_FSUSPOBRA.Date);
      FieldByName('EE_FREINICIOOBRA').Value               := Get_NullValueDate(edEE_FREINICIOOBRA.Date);
      FieldByName('EE_OBSERVACIONES').AsString            := edEE_OBSERVACIONES.Text;
      FieldByName('EE_TURNOROTATIVO').AsString            := SqlBoolean(chkEE_TURNOROTATIVO.Checked, False);
      FieldByName('EE_HORARIODESDE').AsString             := TimeToString(edEE_HORARIODESDE.Time, True, thMinutos);
      FieldByName('EE_HORARIOHASTA').AsString             := TimeToString(edEE_HORARIOHASTA.Time, True, thMinutos);
      FieldByName('EE_HORASEXTRAS').AsString              := SqlBoolean(chkEE_HORASEXTRAS.Checked, False);
      FieldByName('EE_PRAM').AsString                     := SqlBoolean(cbPRAM.Checked, False);
      FieldByName('EE_TAREASHABITUALES').AsString         := edEE_TAREASHABITUALES.Text;
      FieldByName('EE_TAREASENFERMEDAD').AsString         := edEE_TAREASENFERMEDAD.Text;
      FieldByName('EE_DESCRIPCIONENFERMEDAD').AsString    := edEE_DESCRIPCIONENFERMEDAD.Text;
      FieldByName('EE_HECHOSADICIONALES').AsString        := edEE_HECHOSADICIONALES.Text;
      FieldByName('EE_OTROSDATOS').AsString               := edEE_OTROSDATOS.Text;
      FieldByName('EE_RESPONSABLE').AsString              := edEE_RESPONSABLE.Text;
      FieldByName('EE_TITULO').AsString                   := edEE_TITULO.Text;
      FieldByName('EE_TIPOMATRICULA').AsString            := fraEE_TIPOMATRICULA.Codigo;
      FieldByName('EE_NUMEROMATRICULA').AsString          := edEE_NUMEROMATRICULA.Text;
      FieldByName('EE_INSTITUCIONOTORGANTE').AsString     := edEE_INSTITUCIONOTORGANTE.Text;
      FieldByName('EE_FECHA').Value                       := Get_NullValueDate(edEE_FECHA.Date);
      FieldByName('USUARIO').AsString                     := frmPrincipal.DBLogin.UserID;
      FieldByName('EE_IDIT').AsString                     := fraPreventor.ID;


      idExpediente := ValorSqlInteger(
          ' SELECT ex_id '+
          '   FROM art.sex_expedientes '+
          '  WHERE ex_siniestro = '+SqlValue(edSiniestro.FSiniestro.Text)+
          '    AND ex_orden = '+SqlValue(edSiniestro.FOrden.Text)+
          '    AND ex_recaida = 0');

      FieldByName('EE_IDEXPEDIENTE').AsInteger             := idExpediente;

      Post;
      ApplyUpdates;
      CommitUpdates;

      if not edRL_TAREA.ReadOnly then   // los campos de la relación laboral están habilitados para la carga porque se trata de un mortal
        Do_GuardarDatosHistoricoLaboral( fraTrabajador.Value, fraEmpresa.edContrato.Value, edRL_TAREA.Text, fraRL_CIUO.Codigo, cmbRL_FECHAINGRESO.Date, fraRL_IDMODALIDADCONTRATACION.Value );

      GuardarDatosAdicionales;
      CommitTrans(True);
    end;
    MsgBox('Los datos se guardaron exitosamente.', MB_ICONINFORMATION);

    try
      if ModoABM = maAlta Then
      begin
        ModoABM := maModificacion;
        tbModificar.Enabled := True;
        tbModificarClick(nil);
        Selected := True;
      end
      else
      begin
        ModoABM := maNone;

      end;

      Result := True;
      IrPrincipioPantalla;
    except
      on E: Exception do
      begin
        Result := False;
        ErrorMsg(E, ERROR_AL_GUARDAR_DATOS);
      end;
    end;
  except
    on E: Exception do
    begin
      sdqConsulta.CancelUpdates;
      RollBack(true);
      Result := False;
      ErrorMsg(E, ERROR_AL_GUARDAR_DATOS);
    end;
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.DoDarDeBaja(ADataSet: TSDQuery; APrefijo: string; AAllowDelete: Boolean);
begin
  if (not ADataSet.IsEmpty) and ADataSet.FieldByName(APrefijo + '_FECHABAJA').IsNull and
      MsgAsk('¿ Desea dar de baja el registro seleccionado ?') then
  begin
    if AAllowDelete and ADataSet.FieldByName(APrefijo + '_FECHAEXPORT').IsNull then
    begin                                              
      try
        ADataSet.Edit;
        ADataSet.FieldByName(APrefijo + '_USUBAJA').AsString     := frmPrincipal.DBLogin.UserID;
        ADataSet.FieldByName(APrefijo + '_FECHABAJA').AsDateTime := DBDate;
        ADataSet.Post;

        ADataSet.ApplyUpdates;
      except
        on E: Exception do
        begin
          ADataSet.CancelUpdates;
          ErrorMsg(E, 'Error al dar de baja el registro.');
        end;
      end;
    end
    else
      MsgBox('El registro no se puede dar de baja ya que fue informado a la SRT.', MB_ICONERROR);
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.Do_BuscarDatosEnfermedad(iSiniestro,
    iOrden, iRecaida: Integer);
begin
  if BusquedaValida(iSiniestro, iOrden, iRecaida) then
  begin
    Do_CargarDatosSiniestro(iSiniestro, iOrden, iRecaida, True, False);
    FCargo := True;
    edSiniestro.Modified := False;
    ModoABMTablas := maModificacion;
    tbImprimir.Enabled := True;
  end else
  begin
    if not edSiniestro.IsEmpty then
      MessageBox(0, 'El siniestro ingresado no existe o no es del tipo enfermedad.', 'Atención',
          MB_ICONINFORMATION or MB_OK);

    LimpiarDatosA;          
    LockControls;
    btnCancelar.Enabled := True;
    btnCancelar.SetFocus;
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.Do_CargarDatosSiniestro(iSiniestro, iOrden, iRecaida: Integer;
                                                                 CargarValoresDefecto, CargarSoloDatosTrabajador: Boolean);
var
  sSql: String;
  sSqlHistorico: String;
begin
  sSql :=     'SELECT  slz.lz_codigo zona, '
            + '        sln.ln_codigo naturaleza, '
            + '        slf.lf_codigo forma, '
            + '        tj_id, '
            + '        tj_fnacimiento, '
            + '        tj_sexo, '
            + '        tj_idnacionalidad, '
            + '        tj_cpostal, '
            + '        tj_otranacionalidad, '
            + '        tj_calle, '
            + '        tj_localidad, '
            + '        prtrab.pv_descripcion provtrab, '
            + '        tj_numero, '
            + '        tj_piso, '
            + '        tj_departamento, '
            + '        tj_cpostala, '
            + '        tj_codareatelefono, '
            + '        tj_telefono, '
            + '        rl_tarea, '
            + '        rl_ciuo, '
            + '        rl_fechaingreso, '
            + '        rl_idmodalidadcontratacion, '
            + '        co_contrato, '
            + '        co_idactividad, '
            + '        dc_cpostal, '
            + '        dc_calle, '
            + '        dc_localidad, '
            + '        prempr.pv_descripcion provempr, '
            + '        dc_numero, '
            + '        dc_piso, '
            + '        dc_departamento, '
            + '        dc_cpostala, '
            + '        dc_codareatelefonos, '
            + '        dc_telefonos, '
            + '        nomina.get_empleados ( '
            + '                              co_contrato, '
            + '                              TO_CHAR ( '
            + '                                       ex_fechaaccidente, '
            + '                                       ''YYYYMM'' '
            + '                                      ) '
            + '                             ) '
            + '           dotacion, '
            + '        srt.get_agentematerial (ex_id) agente, '
            + '        ub_nombre empresa, '
            + '        ub_cuitocurre cuit, '
            + '        afiliacion.get_idactividadempresa (ub_cuitocurre) idactividad, '
            + '        ub_cpostal cpostal, '
            + '        ub_calle calle, '
            + '        ub_localidad localidad, '
            + '        praccestabl.pv_descripcion descrprovaccestabl, '
            + '        ub_numero numero, '
            + '        ub_piso piso, '
            + '        ub_departamento departamento, '
            + '        ub_cpostala cpostala, '
            + '        ub_codareatelefonos codareatelefonos, '
            + '        ub_telefonos telefonos, '
            + '        ub_codigoestablecimiento codigoestablecimiento, '
            + '        ex_fechaaccidente, '
            + '        ex_brevedescripcion descripcionenfermedad, '
            + '        rl_id, '
            + '        ex_gravedad, '
            + '        TO_NUMBER (NULL) AS hl_id '
            + '  FROM  adc_domiciliocontrato, '
            + '        aem_empresa, '
            + '        aco_contrato, '
            + '        crl_relacionlaboral, '
            + '        cpv_provincias praccestabl, '
            + '        cpv_provincias prempr, '
            + '        cpv_provincias prtrab, '
            + '        ctj_trabajador, '
            + '        sub_ubicaciones, '
            + '        sex_expedientes, '
            + '        SIN.slz_lesionzona slz, '
            + '        SIN.sln_lesionnaturaleza sln, '
            + '        SIN.slf_lesionforma slf '
            + ' WHERE  ex_cuil = tj_cuil '
            + '    AND tj_provincia = prtrab.pv_codigo(+) '
            + '    AND dc_provincia = prempr.pv_codigo(+) '
            + '    AND ub_provincia = praccestabl.pv_codigo(+) '
            + '    AND tj_id = rl_idtrabajador(+) '
            + '    AND ex_cuit = em_cuit '
            + '    AND em_id = co_idempresa '
            + '    AND (rl_contrato IS NULL '
            + '      OR co_contrato = rl_contrato) '
            + '    AND co_contrato = afiliacion.get_contratovigente ( '
            + '                                                      ex_cuit, '
            + '                                                      ex_fechaaccidente '
            + '                                                     ) '
            + '    AND co_contrato = dc_contrato '
            + '    AND dc_tipo = ''L'' '
            + '    AND ex_siniestro = ex_siniestro '
            + '    AND ex_orden = ex_orden '
            + '    AND ex_recaida = ex_recaida '
            + '    AND ex_siniestro = ub_siniestro(+) '
            + '    AND ex_orden = ub_orden(+) '
            + '    AND ex_recaida = ub_recaida(+) '
            + '    AND ex_siniestro =  ' + SqlValue(iSiniestro)
            + '    AND ex_orden = ' + SqlValue(iOrden)
            + '    AND ex_recaida = ' + SqlValue(iRecaida)
            + '    AND ex_idzona = slz.lz_id(+) '
            + '    AND ex_idnaturaleza = sln.ln_id(+) '
            + '    AND ex_idforma = slf.lf_id(+)     '
            + 'UNION '
            + 'SELECT  slz.lz_codigo zona, '
            + '        sln.ln_codigo naturaleza, '
            + '        slf.lf_codigo forma, '
            + '        tj_id, '
            + '        tj_fnacimiento, '
            + '        tj_sexo, '
            + '        tj_idnacionalidad, '
            + '        tj_cpostal, '
            + '        tj_otranacionalidad, '
            + '        tj_calle, '
            + '        tj_localidad, '
            + '        prtrab.pv_descripcion provtrab, '
            + '        tj_numero, '
            + '        tj_piso, '
            + '        tj_departamento, '
            + '        tj_cpostala, '
            + '        tj_codareatelefono, '
            + '        tj_telefono, '
            + '        hl_tarea AS rl_tarea, '
            + '        hl_ciuo AS rl_ciuo, '
            + '        hl_fechaingreso AS rl_fechaingreso, '
            + '        hl_idmodalidadcontratacion AS rl_idmodalidadcontratacion, '
            + '        co_contrato, '
            + '        co_idactividad, '
            + '        dc_cpostal, '
            + '        dc_calle, '
            + '        dc_localidad, '
            + '        prempr.pv_descripcion provempr, '
            + '        dc_numero, '
            + '        dc_piso, '
            + '        dc_departamento, '
            + '        dc_cpostala, '
            + '        dc_codareatelefonos, '
            + '        dc_telefonos, '
            + '        nomina.get_empleados ( '
            + '                              co_contrato, '
            + '                              TO_CHAR ( '
            + '                                       ex_fechaaccidente, '
            + '                                       ''YYYYMM'' '
            + '                                      ) '
            + '                             ) '
            + '           dotacion, '
            + '        srt.get_agentematerial (ex_id) agente, '
            + '        ub_nombre empresa, '
            + '        ub_cuitocurre cuit, '
            + '        afiliacion.get_idactividadempresa (ub_cuitocurre) idactividad, '
            + '        ub_cpostal cpostal, '
            + '        ub_calle calle, '
            + '        ub_localidad localidad, '
            + '        praccestabl.pv_descripcion descrprovaccestabl, '
            + '        ub_numero numero, '
            + '        ub_piso piso, '
            + '        ub_departamento departamento, '
            + '        ub_cpostala cpostala, '
            + '        ub_codareatelefonos codareatelefonos, '
            + '        ub_telefonos telefonos, '
            + '        ub_codigoestablecimiento codigoestablecimiento, '
            + '        ex_fechaaccidente, '
            + '        ex_brevedescripcion descripcionenfermedad, '
            + '        TO_NUMBER (NULL) AS rl_id, '
            + '        ex_gravedad, '
            + '        hl_id '
            + '  FROM  adc_domiciliocontrato, '
            + '        aem_empresa, '
            + '        aco_contrato, '
            + '        chl_historicolaboral, '
            + '        cpv_provincias praccestabl, '
            + '        cpv_provincias prempr, '
            + '        cpv_provincias prtrab, '
            + '        ctj_trabajador, '
            + '        sub_ubicaciones, '
            + '        sex_expedientes, '
            + '        SIN.slz_lesionzona slz, '
            + '        SIN.sln_lesionnaturaleza sln, '
            + '        SIN.slf_lesionforma slf '
            + ' WHERE  ex_cuil = tj_cuil '
            + '    AND tj_provincia = prtrab.pv_codigo(+) '
            + '    AND dc_provincia = prempr.pv_codigo(+) '
            + '    AND ub_provincia = praccestabl.pv_codigo(+) '
            + '    AND tj_id = hl_idtrabajador(+) '
            + '    AND ex_cuit = em_cuit '
            + '    AND em_id = co_idempresa '
            + '    AND (hl_contrato IS NULL '
            + '      OR co_contrato = hl_contrato) '
            + '    AND co_contrato = afiliacion.get_contratovigente ( '
            + '                                                      ex_cuit, '
            + '                                                      ex_fechaaccidente '
            + '                                                     ) '
            + '    AND co_contrato = dc_contrato '
            + '    AND dc_tipo = ''L'' '
            + '    AND ex_siniestro = ex_siniestro '
            + '    AND ex_orden = ex_orden '
            + '    AND ex_recaida = ex_recaida '
            + '    AND ex_siniestro = ub_siniestro(+) '
            + '    AND ex_orden = ub_orden(+) '
            + '    AND ex_recaida = ub_recaida(+) '
            + '    AND ex_siniestro =  ' + SqlValue(iSiniestro)
            + '    AND ex_orden = ' + SqlValue(iOrden)
            + '    AND ex_recaida = ' + SqlValue(iRecaida)
            + '    AND ex_idzona = slz.lz_id(+) '
            + '    AND ex_idnaturaleza = sln.ln_id(+) '
            + '    AND ex_idforma = slf.lf_id(+)     '
            + 'ORDER BY  rl_id '
            ;

  with GetQuery(sSql) do
  try
    if IsEmpty then
      Do_LimpiarDatosSiniestro
    else
    begin
      pbEsMortal                      := (FieldByName('EX_GRAVEDAD').AsString = '5');
      pIdRelacionLaboral              := NVL(FieldByName('RL_ID').AsInteger, ART_EMPTY_ID);
      fraTrabajador.Value             := FieldByName('TJ_ID').AsInteger;
      cmbTJ_FNACIMIENTO.Date          := FieldByName('TJ_FNACIMIENTO').AsDateTime;
      fraTJ_SEXO.Value                := FieldByName('TJ_SEXO').AsString;
      fraTJ_IDNACIONALIDAD.Value      := FieldByName('TJ_IDNACIONALIDAD').AsInteger;
      edTJ_OTRANACIONALIDAD.Text      := FieldByName('TJ_OTRANACIONALIDAD').AsString;
      fraDomicilioTrabaj.CodigoPostal := FieldByName('TJ_CPOSTAL').AsString;
      fraDomicilioTrabaj.Calle        := FieldByName('TJ_CALLE').AsString;
      fraDomicilioTrabaj.Localidad    := FieldByName('TJ_LOCALIDAD').AsString;
      fraDomicilioTrabaj.Provincia    := FieldByName('PROVTRAB').AsString;
      fraDomicilioTrabaj.Numero       := IIF(FieldByName('TJ_NUMERO').AsString <> '', FieldByName('TJ_NUMERO').AsString, 'S/N');
      fraDomicilioTrabaj.Piso         := FieldByName('TJ_PISO').AsString;
      fraDomicilioTrabaj.Departamento := FieldByName('TJ_DEPARTAMENTO').AsString;
      fraDomicilioTrabaj.CPA          := FieldByName('TJ_CPOSTALA').AsString;
      edTJ_CODAREATELEFONO.Text       := FieldByName('TJ_CODAREATELEFONO').AsString;
      edTJ_TELEFONO.Text              := FieldByName('TJ_TELEFONO').AsString;

      if pbEsMortal then
      begin
        sSqlHistorico :=
          'SELECT A.HL_TAREA, A.HL_CIUO, A.HL_FECHAINGRESO, A.HL_IDMODALIDADCONTRATACION' +
           ' FROM CHL_HISTORICOLABORAL A' +
          ' WHERE A.HL_ID = (SELECT MAX(B.HL_ID)' +
                             ' FROM CHL_HISTORICOLABORAL B' +
                            ' WHERE B.HL_IDTRABAJADOR = ' + SqlValue(FieldByName('TJ_ID').AsInteger) +
                              ' AND B.HL_CONTRATO = ' + SqlValue(FieldByName('CO_CONTRATO').AsInteger) + ')';

        with GetQuery(sSqlHistorico) do
        try
          if IsEmpty then
          begin
            edRL_TAREA.Clear;
            fraRL_CIUO.Clear;
            cmbRL_FECHAINGRESO.Clear;
            fraRL_IDMODALIDADCONTRATACION.Clear;
          end
          else
          begin
            edRL_TAREA.Text                     := FieldByName('HL_TAREA').AsString;
            fraRL_CIUO.Codigo                   := FieldByName('HL_CIUO').AsString;
            cmbRL_FECHAINGRESO.Date             := FieldByName('HL_FECHAINGRESO').AsDateTime;
            fraRL_IDMODALIDADCONTRATACION.Value := FieldByName('HL_IDMODALIDADCONTRATACION').AsInteger;
          end;
        finally
          Free;
        end;
      end
      else
      begin
        edRL_TAREA.Text                     := FieldByName('RL_TAREA').AsString;
        fraRL_CIUO.Codigo                   := FieldByName('RL_CIUO').AsString;
        cmbRL_FECHAINGRESO.Date             := FieldByName('RL_FECHAINGRESO').AsDateTime;
        fraRL_IDMODALIDADCONTRATACION.Value := FieldByName('RL_IDMODALIDADCONTRATACION').AsInteger;
      end;

      if not CargarSoloDatosTrabajador then
      begin
        fraEmpresa.Contrato              := FieldByName('CO_CONTRATO').AsInteger;
        fraDomicilioEmpresa.CodigoPostal := FieldByName('DC_CPOSTAL').AsString;
        fraDomicilioEmpresa.Calle        := FieldByName('DC_CALLE').AsString;
        fraDomicilioEmpresa.Localidad    := FieldByName('DC_LOCALIDAD').AsString;
        fraDomicilioEmpresa.Provincia    := FieldByName('PROVEMPR').AsString;
        fraDomicilioEmpresa.Numero       := IIF(FieldByName('DC_NUMERO').AsString <> '', FieldByName('DC_NUMERO').AsString, 'S/N');
        fraDomicilioEmpresa.Piso         := FieldByName('DC_PISO').AsString;
        fraDomicilioEmpresa.Departamento := FieldByName('DC_DEPARTAMENTO').AsString;
        fraDomicilioEmpresa.CPA          := FieldByName('DC_CPOSTALA').AsString;
        edDC_CODAREATELEFONOS.Text       := FieldByName('DC_CODAREATELEFONOS').AsString;
        edDC_TELEFONOS.Text              := FieldByName('DC_TELEFONOS').AsString;
        fraCO_IDACTIVIDAD.Value          := FieldByName('CO_IDACTIVIDAD').AsInteger;
        edEX_FECHAENFERMEDAD.Date        := FieldByName('EX_FECHAACCIDENTE').AsDateTime;

        fraEE_PROGRAMA.Codigo :=
            ValorSql(
                ' SELECT tb_especial1 '+
                '   FROM art.ctb_tablas '+
                '  WHERE tb_clave = ''TFET'' '+
                '    AND tb_codigo <> ''0'' '+
                '    AND tb_fechabaja IS NULL '+
                '    AND tb_codigo = art.hys.get_tipo_empresa ('+SqlValue(fraEmpresa.CUIT)+', 0)'
            );

        fraEE_IDOPERATIVO.Codigo := ValorSql('select hys.get_operativovigente_empresa(' + SqlValue(fraEmpresa.CUIT) + ') from dual');
        fraEE_PROGRAMAChange(nil);
        if CargarValoresDefecto then
        begin
          edEE_DOTACION.Value                      := FieldByName('DOTACION').AsInteger;
          edEE_EMPRESA.Text                        := FieldByName('EMPRESA').AsString;
          mskEE_CUIT.Text                          := FieldByName('CUIT').AsString;
          fraEE_IDACTIVIDAD.Value                  := FieldByName('IDACTIVIDAD').AsInteger;
          fraDomicilioEnfermedadEstabl.CodigoPostal := FieldByName('CPOSTAL').AsString;
          fraDomicilioEnfermedadEstabl.Calle        := FieldByName('CALLE').AsString;
          fraDomicilioEnfermedadEstabl.Localidad    := FieldByName('LOCALIDAD').AsString;
          fraDomicilioEnfermedadEstabl.Provincia    := FieldByName('DESCRPROVACCESTABL').AsString;
          fraDomicilioEnfermedadEstabl.Numero       := IIF(FieldByName('NUMERO').AsString <> '', FieldByName('NUMERO').AsString, 'S/N');
          fraDomicilioEnfermedadEstabl.Piso         := FieldByName('PISO').AsString;
          fraDomicilioEnfermedadEstabl.Departamento := FieldByName('DEPARTAMENTO').AsString;
          fraDomicilioEnfermedadEstabl.CPA          := FieldByName('CPOSTALA').AsString;
          edCodAreaEnfermedadEstab.Text            := FieldByName('CODAREATELEFONOS').AsString;
          edEE_TELEFONOS.Text                      := FieldByName('TELEFONOS').AsString;
          edEE_NROESTABLECIMIENTO.Text             := Get_StringNullValueNumber(FieldByName('CODIGOESTABLECIMIENTO').AsInteger);
          edEE_DESCRIPCIONENFERMEDAD.Text          := FieldByName('DESCRIPCIONENFERMEDAD').AsString;
          fraEE_PROGRAMAEMPRESA.Codigo := ValorSql(
            ' SELECT tb_especial1 '+
            '   FROM art.ctb_tablas '+
            '  WHERE tb_clave = ''TFET'' '+
            '    AND tb_codigo <> ''0'' '+
            '    AND tb_fechabaja IS NULL '+
            '    AND tb_codigo = art.hys.get_tipo_empresa ('+SqlValue(mskEE_CUIT.Text)+', 0)');

          fraEE_IDOPERATIVOEMPRESA.Codigo := ValorSql('select hys.get_operativovigente_empresa(' + SqlValue(mskEE_CUIT.Text) + ') from dual');
          fraEE_PROGRAMAEMPRESAChange(nil);
        end;
      end;

      Do_HabilitarDatosRelacionLaboral(pbEsMortal or (not FieldByName('HL_ID').IsNull));  // se habilita la carga para los mortales
      tbModificar.Enabled := True;
    end;

    if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE GA_IDESTADO in (4,5) '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+ SqlValue(iSiniestro)) then
      InfoHint(ScrollBox, 'Esta Investigación de Enfermedad esta asignada como No Investigar o Cerrado.');

    if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE GA_IDESTABLECIMIENTO is not null and GA_IDESTABLECIMIENTO <> 0 '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+ SqlValue(iSiniestro)) then
    begin
      edEE_NROESTABLECIMIENTO.Text := ValorSql(
        ' SELECT es_nroestableci '+
        '   FROM hys.hga_gestionaccidente, aes_establecimiento, sex_expedientes '+
        '  WHERE es_id = GA_IDESTABLECIMIENTO '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+SqlValue(iSiniestro));
      vclExtra.LockControl(edEE_NROESTABLECIMIENTO,True);
    end
    else
      vclExtra.LockControl(edEE_NROESTABLECIMIENTO,False);

    if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND ga_idpreventor IS NOT NULL '+
        '    AND ex_siniestro = '+ SqlValue(iSiniestro)) then
    begin
      fraPreventor.Value := ValorSqlInteger(
        ' SELECT ga_idpreventor '+
        '   FROM hys.hga_gestionaccidente, SEX_EXPEDIENTES  '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND ex_siniestro = '+SqlValue(iSiniestro));
      vclExtra.LockControl(fraPreventor,True);
      OnFraPreventorChange(nil);
    end
    else
      vclExtra.LockControl(fraPreventor,False);

    if ExisteSql(
          ' SELECT 1 '+
          '   FROM hys.hga_gestionaccidente, sex_expedientes '+
          '  WHERE ex_id = ga_idexpediente '+
          '    AND (ga_calle IS NOT NULL OR ga_cpostal IS NOT NULL OR (ga_provincia <> -1)) '+
          '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
    begin
      sSql :=
        ' SELECT ga_calle, ga_numero, ga_piso, ga_departamento, ga_cpostal, ga_cpostala, '+
        '        ga_localidad, ga_provincia '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro);

      with GetQuery(sSql) do
      try
        fraDomicilioEnfermedadEstabl.Calle := FieldByName('ga_calle').AsString;
        if FieldByName('ga_numero').AsString = 'S/N' then
          fraDomicilioEnfermedadEstabl.Numero := '0'
        else
          fraDomicilioEnfermedadEstabl.Numero     := FieldByName('ga_numero').AsString;
          
        fraDomicilioEnfermedadEstabl.Piso         := FieldByName('ga_piso').AsString;
        fraDomicilioEnfermedadEstabl.Departamento := FieldByName('ga_departamento').AsString;
        fraDomicilioEnfermedadEstabl.CodigoPostal := FieldByName('ga_cpostal').AsString;
        fraDomicilioEnfermedadEstabl.CPA          := FieldByName('ga_cpostala').AsString;
        fraDomicilioEnfermedadEstabl.Localidad    := FieldByName('ga_localidad').AsString;
        fraDomicilioEnfermedadEstabl.Prov         := FieldByName('ga_provincia').AsInteger;
        fraDomicilioEnfermedadEstabl.Provincia    := ValorSql('SELECT pv_descripcion '+
            '  FROM art.cpv_provincias '+
            ' WHERE pv_codigo = '+SqlValue(FieldByName('ga_provincia').AsInteger));
      finally
        Free;
      end;
      vclExtra.LockControl(fraDomicilioEnfermedadEstabl,True);
    end;

    if ExisteSql(
      ' SELECT 1 '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE ex_id = ga_idexpediente AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro) ) then
    begin
      vclExtra.LockControl(cbPRAM,true);
      cbPRAM.Checked := ValorSql(
        ' SELECT ''S'' '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente AND ga_pram = ''S'' '+
        '    AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro)) = 'S';
    end
    else
      vclExtra.LockControl(cbPRAM,false);

  finally
    Free;
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.Do_DarBajaSeguimientoVisita(IdMedidaCorrectiva: TTableId);
var
  sSql: String;
begin
  sSql :=
    'UPDATE HYS.PSV_SEGUIMIENTOVISITAENF' +
      ' SET SV_USUBAJA = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ',' +
          ' SV_FECHABAJA = ACTUALDATE ' +
    ' WHERE SV_IDMEDIDACORRECTIVA = ' + SqlValue(IdMedidaCorrectiva) +
      ' AND SV_FECHABAJA IS NULL';

  EjecutarSqlST(sSql);

  if not sdqPSV_SEGUIMIENTOVISITAENF.Active then
    sdqPSV_SEGUIMIENTOVISITAENF.Active := True;

  sdqPSV_SEGUIMIENTOVISITAENF.Refresh;
end;

procedure TfrmInfInvestigacionEnfermedades.Do_DeshabilitarDatosSiniestro;
begin
  VCLExtra.LockControls([cmbTJ_FNACIMIENTO, edTJ_CODAREATELEFONO, edTJ_TELEFONO, fraTrabajador.mskCUIL,
                         fraTrabajador.cmbNombre, fraTJ_SEXO.edCodigo, fraTJ_SEXO.cmbDescripcion,
                         fraTJ_IDNACIONALIDAD.edCodigo, fraTJ_IDNACIONALIDAD.cmbDescripcion, edTJ_OTRANACIONALIDAD,
                         edDC_CODAREATELEFONOS, edDC_TELEFONOS, fraEmpresa.mskCUIT, fraEmpresa.cmbRSocial,
                         fraEmpresa.edContrato, fraCO_IDACTIVIDAD.edCodigo, fraCO_IDACTIVIDAD.cmbDescripcion,
                         edEX_FECHAENFERMEDAD], True);
  fraDomicilioTrabaj.Locked := True;
  fraDomicilioEmpresa.Locked := True;
  fraDomicilioEnfermedadEstabl.LockProvincia(True);

  fraEE_PROGRAMAChange(nil);
  fraEE_PROGRAMAEMPRESAChange(nil);
end;

procedure TfrmInfInvestigacionEnfermedades.Do_GuardarDatosHistoricoLaboral(IdTrabajador: TTableId; Contrato: Integer;
                                                                         Tarea, CIUO: String; FechaIngreso: TDateTime;
                                                                         IdModalidadContratacion: TTableId);
var
  sSql: String;
begin
  sSql :=
    'UPDATE CHL_HISTORICOLABORAL A' +
      ' SET A.HL_TAREA = ' + SqlValue(Tarea) + ',' +
          ' A.HL_CIUO = ' + SqlValue(CIUO) + ',' +
          ' A.HL_FECHAINGRESO = ' + SqlValue(FechaIngreso) + ',' +
          ' A.HL_IDMODALIDADCONTRATACION = ' + SqlValue(IdModalidadContratacion) +
    ' WHERE A.HL_ID = (SELECT MAX(B.HL_ID)' +
                       ' FROM CHL_HISTORICOLABORAL B' +
                      ' WHERE B.HL_IDTRABAJADOR = ' + SqlValue(IdTrabajador) +
                        ' AND B.HL_CONTRATO = ' + SqlValue(Contrato) + ')';

  EjecutarSqlST(sSql);
end;

procedure TfrmInfInvestigacionEnfermedades.Do_HabilitarDatosBusquedaDenunciaGrave(Habilitar: Boolean);
begin
  VCLExtra.LockControl(edSiniestro, not Habilitar);
  with edSiniestro do   // lo hice así porque no me está grisando el control al deshabilitarlo
  begin
    Color   := clWindow;
    TabStop := True;
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.Do_HabilitarDatosRelacionLaboral(HabilitarRelLaboral: Boolean);
begin
  VCLExtra.LockControls([edRL_TAREA, cmbRL_FECHAINGRESO, fraRL_CIUO.edCodigo, fraRL_CIUO.cmbDescripcion,
                         fraRL_IDMODALIDADCONTRATACION.edCodigo, fraRL_IDMODALIDADCONTRATACION.cmbDescripcion],
                         not HabilitarRelLaboral);
end;

procedure TfrmInfInvestigacionEnfermedades.Do_ImprimirInvestigacionEnfermedad(
    IdEnfermedadEstablecimiento: TTableId);
begin
  if not Assigned(Owner.FindComponent('qrInvestigacionEnfermedad')) then
    with TfrmqrInvestigacionEnfermedad.Create(Owner) do
    try
      SEXID := edSiniestro.Siniestro;
      Do_Imprimir(IdEnfermedadEstablecimiento);
    finally
      Free;
    end;
end;

procedure TfrmInfInvestigacionEnfermedades.Do_LimpiarDatosSiniestro;
begin
  pIdRelacionLaboral := ART_EMPTY_ID;
  pbEsMortal         := False;
  FCargo := false;

  fraTrabajador.Clear;
  cmbTJ_FNACIMIENTO.Clear;
  fraTJ_SEXO.Clear;
  fraTJ_IDNACIONALIDAD.Clear;
  edTJ_OTRANACIONALIDAD.Clear;
  fraDomicilioTrabaj.Clear;
  edTJ_CODAREATELEFONO.Clear;
  edTJ_TELEFONO.Clear;
  edRL_TAREA.Clear;
  fraRL_CIUO.Clear;
  cmbRL_FECHAINGRESO.Clear;
  fraRL_IDMODALIDADCONTRATACION.Clear;
  fraEmpresa.Clear;
  fraDomicilioEmpresa.Clear;
  fraDomicilioEnfermedadEstabl.Clear;
  edDC_CODAREATELEFONOS.Clear;
  edDC_TELEFONOS.Clear;
  fraCO_IDACTIVIDAD.Clear;
  edEX_FECHAENFERMEDAD.Clear;
  edSiniestro.Clear;
end;

procedure TfrmInfInvestigacionEnfermedades.edSiniestroExit(Sender: TObject);
begin
  if not edSiniestro.ReadOnly and ((not FCargo) or edSiniestro.Modified) then
    Do_BuscarDatosEnfermedad(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida);
end;

procedure TfrmInfInvestigacionEnfermedades.fpPMC_MEDIDACORRECTIVAEnter(Sender: TObject);
begin
  VCLExtra.LockControl(edMC_MEDIDA, True);
end;

procedure TfrmInfInvestigacionEnfermedades.fraEE_PROGRAMAChange(Sender: TObject);
begin
  fraEE_IDOPERATIVO.Locked := AreIn(fraEE_PROGRAMA.Codigo, ['B']);
  if fraEE_IDOPERATIVO.Locked or (fraEE_PROGRAMA.Codigo = '')then
    fraEE_IDOPERATIVO.Clear;
end;

procedure TfrmInfInvestigacionEnfermedades.fraEE_PROGRAMAEMPRESAChange(Sender: TObject);
begin
  fraEE_IDOPERATIVOEMPRESA.Locked := AreIn(fraEE_PROGRAMAEMPRESA.Codigo, ['B']);
  if fraEE_IDOPERATIVOEMPRESA.Locked or (fraEE_PROGRAMAEMPRESA.Codigo = '') then
    fraEE_IDOPERATIVOEMPRESA.Clear;
end;

procedure TfrmInfInvestigacionEnfermedades.fraPreventorcmbDescripcionCloseUp(Sender: TObject);
begin
  fraPreventor.cmbDescripcionCloseUp(Sender);

  if not (IsEmptyString(fraPreventor.ID) or fraPreventor.sdqDatos.FieldByName('BAJA').IsNull) then
    InvalidMsg(fraPreventor, 'El preventor no debería ser uno dado de baja.');
end;

procedure TfrmInfInvestigacionEnfermedades.fraPreventorcmbDescripcionDropDown(Sender: TObject);
begin
  if (Trim(fraPreventor.cmbDescripcion.Text) <> '') and (Trim(fraPreventor.cmbDescripcion.Text)[1] <> '%') then
    fraPreventor.cmbDescripcion.Text := '%' + fraPreventor.cmbDescripcion.Text;
  fraPreventor.cmbDescripcionDropDown(Sender);
  if (Trim(fraPreventor.cmbDescripcion.Text) <> '') and (Trim(fraPreventor.cmbDescripcion.Text)[1] = '%') then
    fraPreventor.cmbDescripcion.Text := Copy(fraPreventor.cmbDescripcion.Text, 2, Length(fraPreventor.cmbDescripcion.Text));
end;

procedure TfrmInfInvestigacionEnfermedades.fraTrabajadorExit(Sender: TObject);
begin
  fraTrabajador.FrameExit(Sender);
end;

procedure TfrmInfInvestigacionEnfermedades.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuInfInvestigacionEnfermedades.Enabled := True;
  inherited;
end;

procedure TfrmInfInvestigacionEnfermedades.FSFormCreate(Sender: TObject);
begin
  ScrollBox.VertScrollBar.Position := 0;
  pcDatos.ActivePage := tsDatosSiniestro;
  fraTrabajadorSinGraveBusq.OnChange := OnfraTrabajadorSinGraveBusqChange;

  with fraESOP do
  begin
    TableName   := 'ART.PRG_RIESGOS';
    FieldID     := 'RG_ID';
    FieldCodigo := 'RG_ESOP';
    FieldDesc   := 'RG_DESCRIPCION';
  end;

  with fraESOPAsociado do
  begin
    TableName   := 'ART.PRG_RIESGOS';
    FieldID     := 'RG_ID';
    FieldCodigo := 'RG_ESOP';
    FieldDesc   := 'RG_DESCRIPCION';
  end;

  fraEE_LUGARDEOCURRENCIA.Clave  := 'LUOCU';
  fraEE_PROGRAMA.Clave           := 'PRSEG';
  fraEE_PROGRAMA.OnChange        := fraEE_PROGRAMAChange;
  fraTJ_SEXO.Clave               := 'SEXOS';
  fraEE_PROGRAMAEMPRESA.Clave    := 'PRSEG';
  fraEE_PROGRAMAEMPRESA.OnChange := fraEE_PROGRAMAEMPRESAChange;
  fraEE_TIPOOBRA.Clave           := 'TOBRA';
  fraEE_ACTIVIDADOBRA.Clave      := 'AOBRA';
  fraEE_ETAPAOBRA.Clave          := 'EOBRA';
  fraEE_PROGRAMASEGURIDAD.Clave  := 'PSEGU';
  fraEE_TIPOMATRICULA.Clave      := 'TMATR';

  with fraEE_IDOPERATIVO do
  begin
    TableName   := 'POP_OPERATIVO';
    FieldID     := 'OP_ID';
    FieldCodigo := 'OP_CODIGO';
    FieldDesc   := 'OP_DESCRIPCION';
    ShowBajas   := False;
  end;

  with fraEE_IDOPERATIVOEMPRESA do
  begin
    TableName   := 'POP_OPERATIVO';
    FieldID     := 'OP_ID';
    FieldCodigo := 'OP_CODIGO';
    FieldDesc   := 'OP_DESCRIPCION';
    ShowBajas   := False;
  end;

  with fraTJ_IDNACIONALIDAD do
  begin
    TableName   := 'CNA_NACIONALIDAD';
    FieldID     := 'NA_ID';
    FieldCodigo := 'NA_ID';
    FieldDesc   := 'NA_DESCRIPCION';
    FieldBaja   := 'NA_FECHABAJA';
  end;

  with fraRL_CIUO do
  begin
    TableName      := 'CCI_CIUO';
    FieldID        := 'CI_CODIGO';
    FieldCodigo    := 'CI_CODIGO';
    FieldDesc      := 'CI_DESCRIPCION';
    ExtraCondition := ' AND LENGTH(CI_CODIGO) = 4'
  end;

  with fraRL_IDMODALIDADCONTRATACION do
  begin
    TableName   := 'CMC_MODALIDADCONTRATACION';
    FieldID     := 'MC_ID';
    FieldCodigo := 'MC_CODIGO';
    FieldDesc   := 'MC_DESCRIPCION';
    FieldBaja   := 'MC_FECHABAJA';
    ShowBajas   := True;
  end;

  with fraCO_IDACTIVIDAD do
  begin
    TableName   := 'CAC_ACTIVIDAD';
    FieldID     := 'AC_ID';
    FieldCodigo := 'AC_CODIGO';
    FieldDesc   := 'AC_DESCRIPCION';
  end;

  with fraEE_IDACTIVIDAD do
  begin
    TableName      := 'CAC_ACTIVIDAD';
    FieldID        := 'AC_ID';
    FieldCodigo    := 'AC_CODIGO';
    FieldDesc      := 'AC_DESCRIPCION';
    ExtraCondition := ' AND LENGTH(AC_CODIGO) = 6'
  end;

  fraEmpresa.ShowBajas := True;

  with fraPE_TIPODOCUMENTO do
  begin
    Clave    := 'TDOCN';
    OnChange := OnfraPE_TIPODOCUMENTOChange;
  end;

  with fraEE_IDART do
  begin
    TableName   := 'AAR_ART';
    FieldID     := 'AR_ID';
    FieldCodigo := 'AR_CODIGOSRT';
    FieldDesc   := 'AR_NOMBRE';
    FieldBaja   := 'AR_FECHABAJA';
    ShowBajas   := False;
  end;

  with fraPreventor do
  begin
    TableName      := 'ART.PIT_FIRMANTES';
    FieldDesc      := 'IT_NOMBRE';
    FieldID        := 'IT_ID';
    FieldCodigo    := 'IT_CODIGO';
    FieldBaja      := 'IT_FECHABAJA';
    CaseSensitive  := False;
    ShowBajas      := True;
    ExtraCondition := ' AND NOT (UPPER(it_nombre) LIKE ''%ALTA%'')';
    OnChange       := OnFraPreventorChange;
  end;

  OnfraPE_TIPODOCUMENTOChange(nil);
  Do_DeshabilitarDatosSiniestro;
  Do_HabilitarDatosRelacionLaboral(False);
  LockControls(True);

  tbSalir.Left := ToolBar.Buttons[ToolBar.ButtonCount-1].Left +1;
end;

procedure TfrmInfInvestigacionEnfermedades.FSFormMouseWheel(Sender: TObject;
    Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled:
    Boolean);
var
  code: Cardinal;
begin
 if WheelDelta > 0 then
    code := SB_LINEUP
  else
    code := SB_LINEDOWN;

  ScrollBox.Perform(WM_VSCROLL, CODE, 0);
  scbDatosAdicionales.Perform(WM_VSCROLL, CODE, 0)
end;

procedure TfrmInfInvestigacionEnfermedades.HabilitarCUILPersEntrevistada(HabilitarCUIL: Boolean);
begin
  VCLExtra.LockControl(edPE_DOCUMENTO, HabilitarCUIL);
  VCLExtra.LockControl(mskPE_CUIL, not HabilitarCUIL);

  if HabilitarCUIL then
    edPE_DOCUMENTO.Clear
  else
    mskPE_CUIL.Clear;
end;

procedure TfrmInfInvestigacionEnfermedades.IrPrincipioPantalla;
begin
  pcDatos.ActivePageIndex               := PAGE_DATOSGENERALES;
  pcCausasVisitas.ActivePageIndex       := PAGE_CAUSAMEDIDAS;

  ScrollBox.VertScrollBar.Position := 0;
  ScrollBox.HorzScrollBar.Position := 0;

  fraEE_IDOPERATIVO.Locked := false;
  fraEE_PROGRAMAEMPRESA.Locked := false;
  fraPreventor.Locked := false;
end;

function TfrmInfInvestigacionEnfermedades.Is_EnfermedadEstablId: Boolean;
begin
  Result := not sdqConsulta.FieldByName('EE_ID').IsNull;
end;

function TfrmInfInvestigacionEnfermedades.Is_EstablecimInvestigAccValido(CUIT: String; NroEstableci: Integer): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT HYS.Is_EstablecimInvestigAccValido(' + SqlValue(CUIT) + ', ' + SqlValue( NroEstableci) + ')' +
     ' FROM DUAL';

  Result := (ValorSql(sSql) = 'S');
end;

procedure TfrmInfInvestigacionEnfermedades.LoadControls;
var
  sSql : String;
begin
  with sdqConsulta do
  begin
    SetIDENFERMEDADESTABLECIMIENTO(
        ValorSqlIntegerEx(
              'SELECT  ee_id '
            + '  FROM  pee_enfermedadestablecimiento '
            + ' WHERE  ee_idexpediente = (SELECT  ex_id '
            + '                             FROM  art.sex_expedientes '
            + '                            WHERE  ex_siniestro = :1 '
            + '                              AND  ex_orden = :2 '
            + '                              AND  ex_recaida = :3) '
            + '   AND  ee_fechabaja IS NULL ',
            [ fraTrabajadorSinGraveBusq.edSiniestro.Siniestro,
              fraTrabajadorSinGraveBusq.edSiniestro.Orden,
              0 {hardcode a 0, hablado con pmarrone 31/03/10}
            ]
        )
    );

    Open;
    Do_CargarDatosSiniestro(fraTrabajadorSinGraveBusq.edSiniestro.Siniestro, fraTrabajadorSinGraveBusq.edSiniestro.Orden,
                            fraTrabajadorSinGraveBusq.edSiniestro.Recaida, False, False);
    Do_HabilitarDatosBusquedaDenunciaGrave(False);

    edSiniestro.Siniestro := fraTrabajadorSinGraveBusq.edSiniestro.Siniestro;
    edSiniestro.Orden     := fraTrabajadorSinGraveBusq.edSiniestro.Orden;
    edSiniestro.Recaida   := fraTrabajadorSinGraveBusq.edSiniestro.Recaida;

    sdqPAD_AGENTESDETECTADOS.ParamByName('sexid').AsInteger := edSiniestro.Siniestro;
    sdqPAD_AGENTESDETECTADOS.Open;
    if not sdqPAD_AGENTESDETECTADOS.IsEmpty then
      CargarDatosAgentes;

    sdqPED_ENFERMEDADDATAADICIONAL.ParamByName('sexid').AsInteger := edSiniestro.Siniestro;
    sdqPED_ENFERMEDADDATAADICIONAL.Open;
    if not sdqPED_ENFERMEDADDATAADICIONAL.IsEmpty then
      CargarDatosAdicionales;

    fraEE_PROGRAMA.Codigo                    := FieldByName('EE_PROGRAMA').AsString;
    fraEE_IDOPERATIVO.Value                  := FieldByName('EE_IDOPERATIVO').AsInteger;
    edEE_DOTACION.Value                      := FieldByName('EE_DOTACION').AsInteger;
    edEE_EMPRESA.Text                        := FieldByName('EE_EMPRESA').AsString;
    mskEE_CUIT.Text                          := FieldByName('EE_CUIT').AsString;
    fraEE_IDACTIVIDAD.Value                  := FieldByName('EE_IDACTIVIDAD').AsInteger;
    fraDomicilioEnfermedadEstabl.CodigoPostal := FieldByName('EE_CPOSTAL').AsString;
    fraDomicilioEnfermedadEstabl.Calle        := FieldByName('EE_CALLE').AsString;
    fraDomicilioEnfermedadEstabl.Localidad    := FieldByName('EE_LOCALIDAD').AsString;
    fraDomicilioEnfermedadEstabl.Provincia    := FieldByName('PROVACCESTABL').AsString;
    fraDomicilioEnfermedadEstabl.Numero       := IIF(FieldByName('EE_NUMERO').AsString <> '', FieldByName('EE_NUMERO').AsString, 'S/N');
    fraDomicilioEnfermedadEstabl.Piso         := FieldByName('EE_PISO').AsString;
    fraDomicilioEnfermedadEstabl.Departamento := FieldByName('EE_DEPARTAMENTO').AsString;
    fraDomicilioEnfermedadEstabl.CPA          := FieldByName('EE_CPOSTALA').AsString;
    edEE_TELEFONOS.Text                      := FieldByName('EE_TELEFONOS').AsString;
    fraEE_IDART.Value                        := FieldByName('EE_IDART').AsInteger;
    fraEE_PROGRAMAEMPRESA.Codigo             := FieldByName('EE_PROGRAMAEMPRESA').AsString;
    fraEE_IDOPERATIVOEMPRESA.Value           := FieldByName('EE_IDOPERATIVOEMPRESA').AsInteger;
    rgEE_TIPOESTABLECIMIENTO.ItemIndex       := StrToInt(Decode(FieldByName('EE_TIPOESTABLECIMIENTO').AsString, ['E', 'O', ''], ['0', '1', '0']));
    edEE_NROESTABLECIMIENTO.Text             := Get_StringNullValueNumber(FieldByName('EE_NROESTABLECIMIENTO').AsInteger);
    edEE_DOTACIONESTABLECIMIENTO.Value       := FieldByName('EE_DOTACIONESTABLECIMIENTO').AsInteger;
    fraEE_LUGARDEOCURRENCIA.Codigo           := FieldByName('EE_LUGARDEOCURRENCIA').AsString;
    edEE_FRECEPCIONOBRA.Date                 := FieldByName('EE_FRECEPCIONOBRA').AsDateTime;
    edEE_FINICIOACTIVIDAD.Date               := FieldByName('EE_FINICIOACTIVIDAD').AsDateTime;
    edEE_SUPERFICIE.Text                     := Get_StringNullValueNumber(FieldByName('EE_SUPERFICIE').AsFloat);
    edEE_PLANTAS.Text                        := Get_StringNullValueNumber(FieldByName('EE_PLANTAS').AsInteger);
    fraEE_TIPOOBRA.Codigo                    := FieldByName('EE_TIPOOBRA').AsString;
    fraEE_ACTIVIDADOBRA.Codigo               := FieldByName('EE_ACTIVIDADOBRA').AsString;
    fraEE_ETAPAOBRA.Codigo                   := FieldByName('EE_ETAPAOBRA').AsString;
    chkEE_PROGRAMAAPROBADO.Checked           := (FieldByName('EE_PROGRAMAAPROBADO').AsString = SQL_TRUE);
    fraEE_PROGRAMASEGURIDAD.Codigo           := FieldByName('EE_PROGRAMASEGURIDAD').AsString;
    edEE_FFINOBRA.Date                       := FieldByName('EE_FFINOBRA').AsDateTime;
    edEE_FSUSPOBRA.Date                      := FieldByName('EE_FSUSPOBRA').AsDateTime;
    edEE_FREINICIOOBRA.Date                  := FieldByName('EE_FREINICIOOBRA').AsDateTime;
    edEE_OBSERVACIONES.Text                  := FieldByName('EE_OBSERVACIONES').AsString;
    chkEE_TURNOROTATIVO.Checked              := (FieldByName('EE_TURNOROTATIVO').AsString = SQL_TRUE);
    if Trim(FieldByName('EE_HORARIODESDE').AsString) > '' then
      edEE_HORARIODESDE.Time                 := StrToTime(FieldByName('EE_HORARIODESDE').AsString);
    if Trim(FieldByName('EE_HORARIOHASTA').AsString) > '' then
      edEE_HORARIOHASTA.Time                 := StrToTime(FieldByName('EE_HORARIOHASTA').AsString);
    chkEE_HORASEXTRAS.Checked                := (FieldByName('EE_HORASEXTRAS').AsString = SQL_TRUE);
    cbPRAM.Checked                           := (FieldByName('EE_PRAM').AsString = SQL_TRUE);
    edEE_TAREASHABITUALES.Text               := FieldByName('EE_TAREASHABITUALES').AsString;
    edEE_TAREASENFERMEDAD.Text               := FieldByName('EE_TAREASENFERMEDAD').AsString;
    edEE_DESCRIPCIONENFERMEDAD.Text          := FieldByName('EE_DESCRIPCIONENFERMEDAD').AsString;
    edEE_HECHOSADICIONALES.Text              := FieldByName('EE_HECHOSADICIONALES').AsString;
    edEE_OTROSDATOS.Text                     := FieldByName('EE_OTROSDATOS').AsString;
    edEE_RESPONSABLE.Text                    := FieldByName('EE_RESPONSABLE').AsString;
    edEE_TITULO.Text                         := FieldByName('EE_TITULO').AsString;
    fraEE_TIPOMATRICULA.Codigo               := FieldByName('EE_TIPOMATRICULA').AsString;
    edEE_NUMEROMATRICULA.Text                := FieldByName('EE_NUMEROMATRICULA').AsString;
    edEE_INSTITUCIONOTORGANTE.Text           := FieldByName('EE_INSTITUCIONOTORGANTE').AsString;
    edEE_FECHA.Date                          := FieldByName('EE_FECHA').AsDateTime;
    fraPreventor.Value                       := FieldByName('EE_IDIT').AsInteger
  end;

  if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE GA_IDESTADO in (4,5) '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
    InfoHint(ScrollBox, 'Esta Investigación de Enfermedad esta asignada como No Investigar o Cerrado.');

  if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE GA_IDESTABLECIMIENTO is not null and GA_IDESTABLECIMIENTO <> 0 '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
  begin
    edEE_NROESTABLECIMIENTO.Text := ValorSql(
        ' SELECT es_nroestableci '+
        '   FROM hys.hga_gestionaccidente, aes_establecimiento, sex_expedientes '+
        '  WHERE es_id = GA_IDESTABLECIMIENTO '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro));
    vclExtra.LockControl(edEE_NROESTABLECIMIENTO,True);
  end
  else
    vclExtra.LockControl(edEE_NROESTABLECIMIENTO,True);

  if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND ga_idpreventor IS NOT NULL '+
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
  begin
    fraPreventor.Value := ValorSqlInteger(
        ' SELECT ga_idpreventor '+
        '   FROM hys.hga_gestionaccidente,SEX_EXPEDIENTES  '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro));
    fraPreventor.Locked := false;
    vclExtra.LockControl(fraPreventor,True);
    OnFraPreventorChange(nil);
  end
  else
    vclExtra.LockControl(fraPreventor,False);

  if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND (ga_calle IS NOT NULL OR ga_cpostal IS NOT NULL OR (ga_provincia <> -1)) '+
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
  begin
    sSql :=
      ' SELECT ga_calle, ga_numero, ga_piso, ga_departamento, ga_cpostal, ga_cpostala, '+
      '        ga_localidad, ga_provincia '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE ex_id = ga_idexpediente AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro);

    with GetQuery(sSql) do
    try
      fraDomicilioEnfermedadEstabl.Calle := FieldByName('ga_calle').AsString;
      if FieldByName('ga_numero').AsString = 'S/N' then
        fraDomicilioEnfermedadEstabl.Numero := '0'
      else
        fraDomicilioEnfermedadEstabl.Numero     := FieldByName('ga_numero').AsString;

      fraDomicilioEnfermedadEstabl.Piso         := FieldByName('ga_piso').AsString;
      fraDomicilioEnfermedadEstabl.Departamento := FieldByName('ga_departamento').AsString;
      fraDomicilioEnfermedadEstabl.CodigoPostal := FieldByName('ga_cpostal').AsString;
      fraDomicilioEnfermedadEstabl.CPA          := FieldByName('ga_cpostala').AsString;
      fraDomicilioEnfermedadEstabl.Localidad    := FieldByName('ga_localidad').AsString;
      fraDomicilioEnfermedadEstabl.Prov         := FieldByName('ga_provincia').AsInteger;
      fraDomicilioEnfermedadEstabl.Provincia    := ValorSql('SELECT pv_descripcion '+
            '  FROM art.cpv_provincias '+
            ' WHERE pv_codigo = '+SqlValue(FieldByName('ga_provincia').AsInteger));
    finally
      Free;
    end;

    fraDomicilioEnfermedadEstabl.Locked := False;
    vclExtra.LockControl(fraDomicilioEnfermedadEstabl,True);
  end;

  if ExisteSql(
    ' SELECT 1 '+
    '   FROM hys.hga_gestionaccidente, sex_expedientes '+
    '  WHERE ex_id = ga_idexpediente AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro) ) then
  begin
    vclExtra.LockControl(cbPRAM,true);
    cbPRAM.Checked := ValorSql(
      ' SELECT ''S'' '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE ex_id = ga_idexpediente AND ga_pram = ''S'' '+
      '    AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro)) = 'S';
  end
  else
    vclExtra.LockControl(cbPRAM,false);

  pcDatosChange(nil);
  tbImprimir.Enabled := True;
end;

procedure TfrmInfInvestigacionEnfermedades.mskEE_CUITExit(Sender: TObject);
begin
  fraEE_PROGRAMAEMPRESA.Codigo := ValorSql(
    ' SELECT tb_especial1 '+
    '   FROM art.ctb_tablas '+
    '  WHERE tb_clave = ''TFET'' '+
    '    AND tb_codigo <> ''0'' '+
    '    AND tb_fechabaja IS NULL '+
    '    AND tb_codigo = art.hys.get_tipo_empresa ('+SqlValue(mskEE_CUIT.Text)+', 0)');

  fraEE_IDOPERATIVOEMPRESA.Codigo := ValorSql('select hys.get_operativovigente_empresa(' + SqlValue(mskEE_CUIT.Text) + ') from dual');
  fraEE_PROGRAMAEMPRESAChange(nil);
end;

procedure TfrmInfInvestigacionEnfermedades.OnfraPE_TIPODOCUMENTOChange(Sender: TObject);
begin
  HabilitarCUILPersEntrevistada(fraPE_TIPODOCUMENTO.IsEmpty);
end;

procedure TfrmInfInvestigacionEnfermedades.OnFraPreventorChange(
  Sender: TObject);
begin
  with GetQuery(' SELECT * '+
                '   FROM art.pit_firmantes '+
                '  WHERE it_id = '+SqlValue(fraPreventor.Value)) do
  begin
    edEE_TITULO.Text := FieldByName('IT_TITULO').AsString;
    fraEE_TIPOMATRICULA.Codigo := FieldByName('IT_TIPO_MATRICULA').AsString;
    edEE_NUMEROMATRICULA.Text := FieldByName('IT_MATRICULA').AsString;
    edEE_INSTITUCIONOTORGANTE.Text := FieldByName('IT_INSTITUCION_OTORGANTE').AsString;
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.OnfraTrabajadorSinGraveBusqChange(Sender: TObject);
var
  SQL: string;
begin
  FCargo := false;
  SQL := 'SELECT  1 '
       + '  FROM  pee_enfermedadestablecimiento pee, '
       + '        sex_expedientes sex '
       + ' WHERE  pee.ee_idexpediente = sex.ex_id AND sex.ex_id = :id_sex '
       ;
  PKChange(ExisteSqlEx(SQL, [fraTrabajadorSinGraveBusq.IdSiniestro]));
end;

procedure TfrmInfInvestigacionEnfermedades.pcMedidasSeguimChange(Sender: TObject);
begin
  case pcMedidasSeguim.ActivePageIndex of
    PAGE_MEDIDASCORRECTIVAS:
    begin
      sdqPMC_MEDIDACORRECTIVAENF.Active := True;
      pcCausasVisitasChange(nil);
    end;
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.pcCausasVisitasChange(Sender: TObject);
begin
  case pcCausasVisitas.ActivePageIndex of
    PAGE_SEGUIMIENTOVISITAS:  sdqPSV_SEGUIMIENTOVISITAENF.Active := True;
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.pcDatosChange(Sender: TObject);
begin
  case pcDatos.ActivePageIndex of
    PAGE_PERSONASENTREVISTADAS: sdqPPE_PERSONAENTREVISTADAENF.Active := True;
    PAGE_MEDIDASSEGUIM:   pcMedidasSeguimChange(nil);
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.PKChange(ASelected: Boolean);
begin
 // tbManTrabajadores.Enabled := ASelected;

  if not ASelected then
  begin
    FCuit := '';
    AEstablecimiento := 0;
  end;

  inherited PKChange(ASelected);
end;

function TfrmInfInvestigacionEnfermedades.PkViolated(DataSet: TDataSet; FieldNames: Array of String;
                                                   FieldValues: Array of Variant): Boolean;
begin
  Result := (ModoABMTablas = maAlta) and (CountRecords(DataSet, FieldNames, FieldValues, 1) > 0);
end;

procedure TfrmInfInvestigacionEnfermedades.rgEE_TIPOESTABLECIMIENTOClick(Sender: TObject);
var
  bDeshabilitarDatosObra: Boolean;
begin
  bDeshabilitarDatosObra := (rgEE_TIPOESTABLECIMIENTO.ItemIndex = 0);   // establecimiento
  VCLExtra.LockControls([fraEE_ETAPAOBRA.edCodigo, fraEE_ETAPAOBRA.cmbDescripcion, fraEE_PROGRAMASEGURIDAD.edCodigo,
                         fraEE_PROGRAMASEGURIDAD.cmbDescripcion, edEE_FRECEPCIONOBRA, edEE_FINICIOACTIVIDAD,
                         edEE_SUPERFICIE, edEE_PLANTAS, fraEE_TIPOOBRA.edCodigo, fraEE_TIPOOBRA.cmbDescripcion,
                         fraEE_ACTIVIDADOBRA.edCodigo, fraEE_ACTIVIDADOBRA.cmbDescripcion, chkEE_PROGRAMAAPROBADO,
                         edEE_FFINOBRA, edEE_FSUSPOBRA, edEE_FREINICIOOBRA], bDeshabilitarDatosObra );
end;


procedure TfrmInfInvestigacionEnfermedades.sdqPMC_MEDIDACORRECTIVAAfterScroll(DataSet: TDataSet);
begin
  SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_ID').AsInteger);
  OpenQuery(sdqPSV_SEGUIMIENTOVISITAENF);
end;

procedure TfrmInfInvestigacionEnfermedades.sdqPMC_MEDIDACORRECTIVAENFAfterOpen(
    DataSet: TDataSet);
begin
  DataSet.Fields[0].Required := False;
  DataSet.Fields[1].Required := False;
end;

procedure
    TfrmInfInvestigacionEnfermedades.sdqPMC_MEDIDACORRECTIVAENFAfterScroll(
    DataSet: TDataSet);
begin
  SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_ID').AsInteger);
  OpenQuery(sdqPSV_SEGUIMIENTOVISITAENF);
end;

procedure
    TfrmInfInvestigacionEnfermedades.sdqPPE_PERSONAENTREVISTADAENFAfterOpen(
    DataSet: TDataSet);
begin
  DataSet.Fields[0].Required := False;
  DataSet.Fields[1].Required := False;
end;

procedure
    TfrmInfInvestigacionEnfermedades.sdqPSV_SEGUIMIENTOVISITAENFAfterOpen(
    DataSet: TDataSet);
begin
  DataSet.Fields[0].Required := False;
  DataSet.Fields[1].Required := False;
end;

procedure TfrmInfInvestigacionEnfermedades.sdqRelacionesAfterOpen(DataSet: TDataSet);
begin
  DataSet.Fields[0].Required := False;
  DataSet.Fields[1].Required := False;
end;

procedure TfrmInfInvestigacionEnfermedades.sdqRelacionesPCMAfterOpen(DataSet: TDataSet);
begin
  DataSet.FieldByName('DC_NUMERO').Required      := False;
  DataSet.FieldByName('DC_DESCRIPCION').Required := False;
end;

procedure TfrmInfInvestigacionEnfermedades.SetID(ADataSet: TSDQuery; AId: TTableId);
begin
  ADataSet.Close;
  ADataSet.Params[0].AsInteger := AId;
end;

procedure TfrmInfInvestigacionEnfermedades.SetIDENFERMEDADESTABLECIMIENTO(AId: TTableId);
begin
  SetID(sdqConsulta, AId);
  SetID(sdqPPE_PERSONAENTREVISTADAENF, AId);
  SetID(sdqPMC_MEDIDACORRECTIVAENF, AId);
end;

procedure TfrmInfInvestigacionEnfermedades.SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(AId: TTableId);
begin
  SetID(sdqPSV_SEGUIMIENTOVISITAENF, AId);
end;


procedure TfrmInfInvestigacionEnfermedades.SpeedButton1Click(Sender: TObject);
begin
  edEE_EMPRESA.Text                        := fraEmpresa.NombreEmpresa;
  mskEE_CUIT.Text                          := fraEmpresa.CUIT;
  fraEE_IDACTIVIDAD.Codigo                 := fraCO_IDACTIVIDAD.Codigo;
  if not ExisteSql(
          ' SELECT 1 '+
          '   FROM hys.hga_gestionaccidente, sex_expedientes '+
          '  WHERE ex_id = ga_idexpediente '+
          '    AND (ga_calle IS NOT NULL OR ga_cpostal IS NOT NULL OR (ga_provincia <> -1)) '+
          '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
  begin
    fraDomicilioEnfermedadEstabl.CodigoPostal := fraDomicilioEmpresa.CodigoPostal;
    fraDomicilioEnfermedadEstabl.CPA          := fraDomicilioEmpresa.CPA;
    fraDomicilioEnfermedadEstabl.Calle        := fraDomicilioEmpresa.Calle;
    fraDomicilioEnfermedadEstabl.Numero       := fraDomicilioEmpresa.Numero;
    fraDomicilioEnfermedadEstabl.Piso         := fraDomicilioEmpresa.Piso;
    fraDomicilioEnfermedadEstabl.Departamento := fraDomicilioEmpresa.Departamento;
    fraDomicilioEnfermedadEstabl.Localidad    := fraDomicilioEmpresa.Localidad;
    fraDomicilioEnfermedadEstabl.Provincia    := fraDomicilioEmpresa.Provincia;
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.tbAltaESOPClick(Sender: TObject);
begin
  FModoABMESOP := maAlta;
  LimpiarDatosA;
  frmPanelESOP.ShowModal;
end;

procedure TfrmInfInvestigacionEnfermedades.tbImprimirClick(Sender: TObject);
var
  pEE_ID: TTableId;
begin
  if not fraTrabajadorSinGraveBusq.IsEmpty then
  begin
    pEE_ID := sdqConsulta.FieldByName('EE_ID').AsInteger;
    Do_ImprimirInvestigacionEnfermedad(pEE_ID);
  end;
end;

procedure TfrmInfInvestigacionEnfermedades.tbLimpiarClick(Sender: TObject);
begin
  FCargo := False;
  inherited;

  sdqPAD_AGENTESDETECTADOS.Active := False;
  sdqPED_ENFERMEDADDATAADICIONAL.Close;
  DatosFormularioClear(scbDatosAdicionales);

  fraTrabajadorSinGraveBusq.Clear;
  edSiniestro.Clear;
  if edSiniestro.CanFocus then
    edSiniestro.SetFocus;
end;

procedure TfrmInfInvestigacionEnfermedades.tbManTrabajadoresClick(Sender: TObject);
begin

  with TfrmContratoTrabajador.Create(nil) do
  try
    PermitirFecIngresoVacia := False;
    ValidateType := [vtHYS];
    CargarDatosTrabajador(fraTrabajador.Value, pIdRelacionLaboral);
    ShowModal;
  finally
    Free;
  end;

  if edSiniestro.Siniestro <> 0 then
    Do_CargarDatosSiniestro(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, False, True);
end;

procedure TfrmInfInvestigacionEnfermedades.tbModESOPClick(Sender: TObject);
begin
  FModoABMESOP := maModificacion;
  LimpiarDatosAgentes;
  CargarDatosAgentes;
  frmPanelESOP.ShowModal;
end;

procedure TfrmInfInvestigacionEnfermedades.tbModificarClick(Sender: TObject);
begin
  inherited;
  pcDatos.Enabled := True;
  Do_DeshabilitarDatosSiniestro;
  Do_HabilitarDatosRelacionLaboral(pbEsMortal);
  Do_HabilitarDatosBusquedaDenunciaGrave(False);
  rgEE_TIPOESTABLECIMIENTOClick(nil);
  fraEE_PROGRAMAChange(nil);
  fraEE_PROGRAMAEMPRESAChange(nil);
  if ExisteSql(
      ' SELECT 1 '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE GA_IDESTABLECIMIENTO is not null and GA_IDESTABLECIMIENTO <> 0 '+
      '    AND ga_idexpediente = ex_id '+
      '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
    vclExtra.LockControl(edEE_NROESTABLECIMIENTO,True);
  if ExisteSql(
      ' SELECT 1 '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE ex_id = ga_idexpediente '+
      '    AND ga_idpreventor IS NOT NULL '+
      '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
  begin
    fraPreventor.Locked := False;
    vclExtra.LockControl(fraPreventor,True);
  end;
  if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND (ga_calle IS NOT NULL OR ga_cpostal IS NOT NULL OR (ga_provincia <> -1)) '+
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
  begin
    fraDomicilioEnfermedadEstabl.Locked := False;
    vclExtra.LockControl(fraDomicilioEnfermedadEstabl,True);
  end;
  if ExisteSql(
    ' SELECT 1 '+
    '   FROM hys.hga_gestionaccidente, sex_expedientes '+
    '  WHERE ex_id = ga_idexpediente AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro) ) then
  begin
    vclExtra.LockControl(cbPRAM,true);
    cbPRAM.Checked := ValorSql(
      ' SELECT ''S'' '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE ex_id = ga_idexpediente AND ga_pram = ''S'' '+
      '    AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro)) = 'S';
  end
  else
    vclExtra.LockControl(cbPRAM,false);

end;

procedure TfrmInfInvestigacionEnfermedades.tbNuevoClick(Sender: TObject);
begin
  Verificar(ExisteSql(
    ' SELECT 1 '+
    '   FROM pee_enfermedadestablecimiento '+
    '  WHERE ee_idexpediente = (SELECT ex_id '+
    '                             FROM art.sex_expedientes '+
    '                            WHERE ex_siniestro = '+SqlValue(edSiniestro.Siniestro)+
    '                              AND ex_orden = '+SqlValue(edSiniestro.Orden)+
    '                              AND ex_recaida = 0)'+
    '    AND ee_fechabaja IS NULL'),tbNuevo,'Ya existe el siniestro cargado');
  inherited;
  {defaults}
  fraEE_IDART.Codigo := '00051';
  rgEE_TIPOESTABLECIMIENTO.ItemIndex := 0;
  {limpia los datos anteriores}
  Do_LimpiarDatosSiniestro;
  {limpia los datos de Agentes y Adicionales}
  LimpiarDatosA;
end;

procedure TfrmInfInvestigacionEnfermedades.tbPMCEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPMC_MEDIDACORRECTIVAENF, 'MC');
  Do_DarBajaSeguimientoVisita(sdqPMC_MEDIDACORRECTIVAENF.FieldByName( 'MC_ID' ).AsInteger);
end;

procedure TfrmInfInvestigacionEnfermedades.tbPMCModificarClick(Sender: TObject);
begin
  if (not sdqPMC_MEDIDACORRECTIVAENF.IsEmpty)
      and (sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_FECHABAJA').IsNull) then
    with sdqPMC_MEDIDACORRECTIVAENF do
    begin
      edMC_MEDIDA.Value           := FieldByName('MC_MEDIDA').AsInteger;
      edMC_FECHAEJECUCION.Date    := FieldByName('MC_FECHAEJECUCION').AsDateTime;
      edMC_FECHAVERIFICACION.Date := FieldByName('MC_FECHAVERIFICACION').AsDateTime;
      edMC_DESCRIPCION.Text       := FieldByName('MC_DESCRIPCION').AsString;

      ModoABMTablas := maModificacion;

      fpPMC_MEDIDACORRECTIVA.ShowModal;
    end;
end;

procedure TfrmInfInvestigacionEnfermedades.tbPMCNuevoClick(Sender: TObject);
begin
  if Is_EnfermedadEstablId then
  begin
    edMC_MEDIDA.Clear;
    edMC_FECHAEJECUCION.Clear;
    edMC_FECHAVERIFICACION.Clear;
    edMC_DESCRIPCION.Clear;
    ModoABMTablas := maAlta;
    fpPMC_MEDIDACORRECTIVA.ShowModal;
  end
  else
    MsgBox('Para poder continuar, debe confirmar los datos cargados previamente, ' +
        'haciendo clic en Aceptar.', MB_ICONERROR);
end;

procedure TfrmInfInvestigacionEnfermedades.tbPPEEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPPE_PERSONAENTREVISTADAENF, 'PE');
end;

procedure TfrmInfInvestigacionEnfermedades.tbPPEModificarClick(Sender: TObject);
begin
  if (not sdqPPE_PERSONAENTREVISTADAENF.IsEmpty) and (sdqPPE_PERSONAENTREVISTADAENF.FieldByName('PE_FECHABAJA').IsNull) then
    with sdqPPE_PERSONAENTREVISTADAENF do
    begin
      fraPE_TIPODOCUMENTO.Codigo := FieldByName('PE_TIPODOCUMENTO').AsString;
      OnfraPE_TIPODOCUMENTOChange(nil);

      mskPE_CUIL.Text            := FieldByName('PE_CUIL').AsString;
      edPE_DOCUMENTO.Text        := FieldByName('PE_DOCUMENTO').AsString;
      edPE_NOMBRE.Text           := FieldByName('PE_NOMBRE').AsString;
      edPE_CARGO.Text            := FieldByName('PE_CARGO').AsString;
      edPE_FECHA_ENTREVISTA.Date := FieldByName('PE_FECHA_ENTREVISTA').AsDateTime;
      edPE_TIPO_ENTREVISTA.Value := FieldByName('PE_TIPO_ENTREVISTA').AsString;

      ModoABMTablas := maModificacion;

      VCLExtra.LockControls([fraPE_TIPODOCUMENTO, edPE_DOCUMENTO, mskPE_CUIL], True);

      fpPPE_PERSONAENTREVISTADA.ShowModal;
    end;
end;

procedure TfrmInfInvestigacionEnfermedades.tbPPENuevoClick(Sender: TObject);
begin
  if Is_EnfermedadEstablId then
  begin
    fraPE_TIPODOCUMENTO.Clear;
    OnfraPE_TIPODOCUMENTOChange(nil);

    mskPE_CUIL.Clear;
    edPE_DOCUMENTO.Clear;
    edPE_NOMBRE.Clear;
    edPE_CARGO.Clear;
    edPE_FECHA_ENTREVISTA.Clear;
    edPE_TIPO_ENTREVISTA.ItemIndex := -1;

    ModoABMTablas := maAlta;

    VCLExtra.LockControls([fraPE_TIPODOCUMENTO, edPE_DOCUMENTO, mskPE_CUIL], False);

    fpPPE_PERSONAENTREVISTADA.ShowModal;
  end
  else
    MsgBox('Para poder continuar, debe confirmar los datos cargados previamente, haciendo clic en Aceptar.', MB_ICONERROR);
end;

procedure TfrmInfInvestigacionEnfermedades.tbPSVEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPSV_SEGUIMIENTOVISITAENF, 'SV');
end;

procedure TfrmInfInvestigacionEnfermedades.tbPSVModificarClick(Sender: TObject);
begin
  if (not sdqPSV_SEGUIMIENTOVISITAENF.IsEmpty) and (sdqPSV_SEGUIMIENTOVISITAENF.FieldByName('SV_FECHABAJA').IsNull) then
    with sdqPSV_SEGUIMIENTOVISITAENF do
    begin
      edSV_TIPO.Value := FieldByName('SV_TIPO').AsString;
      edSV_FECHA.Date := FieldByName('SV_FECHA').AsDateTime;

      VCLExtra.LockControl(edSV_FECHA, True);

      ModoABMTablas := maModificacion;

      fpPSV_SEGUIMIENTOVISITA.ShowModal;
    end;
end;

procedure TfrmInfInvestigacionEnfermedades.tbPSVNuevoClick(Sender: TObject);
begin
  if Is_EnfermedadEstablId then
  begin
    if not sdqPMC_MEDIDACORRECTIVAENF.IsEmpty then
    begin
      if sdqPMC_MEDIDACORRECTIVAENF.FieldByName('MC_FECHABAJA').IsNull then
      begin
        edSV_TIPO.ItemIndex := -1;
        edSV_FECHA.Clear;

        VCLExtra.LockControl(edSV_FECHA, False);

        ModoABMTablas := maAlta;

        fpPSV_SEGUIMIENTOVISITA.ShowModal;
      end
      else
        MsgBox('La medida correctiva seleccionada se encuentra dada de baja.', MB_ICONERROR);
    end
    else
      MsgBox('Para poder dar de alta una visita, debe haber seleccionado previamente alguna medida correctiva.', MB_ICONERROR);
  end
  else
    MsgBox('Para poder continuar, debe confirmar los datos cargados previamente, haciendo clic en Aceptar.', MB_ICONERROR);
end;

function TfrmInfInvestigacionEnfermedades.Validar: Boolean;
var
  dHoy: TDateTime;
  sSql: String;
begin
  Result := False;

  dHoy := DBDate;

  sSql :=
    'SELECT 1' +
     ' FROM hys.pee_enfermedadestablecimiento, art.sex_expedientes' +
    ' WHERE ex_id = ee_idexpediente '+
    '   AND ex_siniestro = ' + SqlValue(edSiniestro.Siniestro)+
    '   AND ex_orden = ' + SqlValue(edSiniestro.Orden);

  if (cmbTJ_FNACIMIENTO.IsEmpty) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(cmbTJ_FNACIMIENTO, 'La fecha de nacimiento es obligatoria.')
  end

  else if (ModoABM = maAlta) and ExisteSql(sSql) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edSiniestro, 'El nro. de siniestro ya existe.')
  end

  else if (fraTJ_SEXO.IsEmpty) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraTJ_SEXO, 'El sexo es obligatorio.')
  end

  else if (fraDomicilioTrabaj.IsEmpty) or (not fraDomicilioTrabaj.IsValid) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraDomicilioTrabaj, 'El domicilio del trabajador debe ser válido.')
  end

  else if IsEmptyString(fraDomicilioTrabaj.CPA) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraDomicilioTrabaj, 'El código postal argentino es obligatorio.')
  end

  else if ValorSql('SELECT NVL(TJ_ESTADOCIVIL, '''')' +
                    ' FROM CTJ_TRABAJADOR' +
                   ' WHERE TJ_CUIL = ' + SqlValue(fraTrabajador.CUIL), '') = '' then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraTrabajador.mskCUIL , 'El estado civil del trabajador es obligatorio, para cambiarlo presione el botón de mantenimiento de trabajadores.')
  end

  else if not ExisteSql('SELECT 1' +
                         ' FROM CPA_CODIGOSPOSTALES' +
                        ' WHERE PA_CPA = ' + SqlValue(fraDomicilioTrabaj.CPA)) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraDomicilioTrabaj, 'El código postal argentino no existe.')
  end

  else if ((fraTJ_IDNACIONALIDAD.IsEmpty) or ((fraTJ_IDNACIONALIDAD.Codigo = '7') and IsEmptyString(edTJ_OTRANACIONALIDAD.Text))) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraTJ_IDNACIONALIDAD.edCodigo, 'Debe indicar la nacionalidad del trabajador.')
  end

  else if IsEmptyString(edRL_TAREA.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edRL_TAREA, 'La ocupación del trabajador es obligatoria.')
  end

  else if fraRL_CIUO.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraRL_CIUO.edCodigo, 'El CIUO del trabajador es obligatorio.')
  end

  else if cmbRL_FECHAINGRESO.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(cmbRL_FECHAINGRESO, 'La fecha de ingreso del trabajador a la empresa es obligatoria.')
  end

  else if fraRL_IDMODALIDADCONTRATACION.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraRL_IDMODALIDADCONTRATACION.edCodigo, 'El tipo de contrato del trabajador es obligatorio.')
  end

  else if fraEmpresa.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEmpresa, 'La Empresa es obligatoria.')
  end

  else if (fraDomicilioEmpresa.IsEmpty) or (not fraDomicilioEmpresa.IsValid) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEmpresa, 'El domicilio de la empresa debe ser válido.')
  end

  else if fraEE_PROGRAMA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_PROGRAMA.edCodigo, 'El programa es obligatorio.')
  end
  else if AreIn(fraEE_PROGRAMA.Codigo, ['A', 'T', 'P']) and fraEE_IDOPERATIVO.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_IDOPERATIVO.edCodigo, 'El operativo es obligatorio cuando la empresa es Agro o Testigo o PYME.')
  end

  else if fraCO_IDACTIVIDAD.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraCO_IDACTIVIDAD, 'El CIIU es obligatorio.')
  end

  else if edEE_DOTACION.Value <= 0 then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_DOTACION, 'La dotación debe ser mayor a 0 empleados.')
  end

  else if IsEmptyString(edEE_EMPRESA.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_EMPRESA, 'La razón social es obligatoria.')
  end

  else if IsEmptyString(mskEE_CUIT.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(mskEE_CUIT, 'El CUIT es obligatorio.')
  end

  else if not IsCuit(mskEE_CUIT.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(mskEE_CUIT, 'El CUIT ingresado no es válido.')
  end

  else if fraEE_IDACTIVIDAD.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_IDACTIVIDAD.edCodigo, 'La actividad es obligatoria.')
  end

  else if not fraDomicilioEnfermedadEstabl.IsValid then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    Abort
  end

  else if not IsNumber(fraDomicilioEnfermedadEstabl.Numero) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraDomicilioEnfermedadEstabl, 'El número del domicilio del lugar donde se ha contraido la enfermedad debe ser un dato numérico. Cero(0) o un número válido.')
  end

  else if IsEmptyString(fraDomicilioEnfermedadEstabl.CPA) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraDomicilioEnfermedadEstabl, 'El código postal argentino es obligatorio.')
  end

  else if not ExisteSql('SELECT 1' +
                         ' FROM CPA_CODIGOSPOSTALES' +
                        ' WHERE PA_CPA = ' + SqlValue(fraDomicilioEnfermedadEstabl.CPA)) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraDomicilioEnfermedadEstabl, 'El código postal argentino no existe.')
  end

  else if IsEmptyString(edEE_TELEFONOS.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_TELEFONOS, 'El teléfono es obligatorio.')
  end

  else if fraEE_IDART.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_IDART.edCodigo, 'La ART del lugar donde se ha contraído es un dato obligatorio.')
  end

  else if fraEE_PROGRAMAEMPRESA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_PROGRAMAEMPRESA.cmbDescripcion, 'El programa de la empresa en un dato obligatorio.')
  end

  else if not fraEE_PROGRAMAEMPRESA.IsEmpty and AreIn(fraEE_PROGRAMAEMPRESA.Codigo, ['A', 'T', 'P']) and fraEE_IDOPERATIVOEMPRESA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_IDOPERATIVOEMPRESA.edCodigo, 'El operativo es obligatorio cuando la empresa es Agro o Testigo o PYME.')
  end

  else if rgEE_TIPOESTABLECIMIENTO.ItemIndex = -1 then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(rgEE_TIPOESTABLECIMIENTO, 'El tipo de establecimiento es obligatorio.')
  end

  else if not fraEE_PROGRAMAEMPRESA.IsEmpty and (rgEE_TIPOESTABLECIMIENTO.ItemIndex = 0) and edEE_NROESTABLECIMIENTO.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_NROESTABLECIMIENTO, 'El número de establecimiento es obligatorio cuando se especifica el programa.')
  end

  else if not edEE_NROESTABLECIMIENTO.IsEmpty and not Is_EstablecimInvestigAccValido(fraEmpresa.CUIT, edEE_NROESTABLECIMIENTO.Value) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_NROESTABLECIMIENTO, 'El número de establecimiento es incorrecto.')
  end

  else if edEE_DOTACIONESTABLECIMIENTO.Value <= 0 then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_DOTACIONESTABLECIMIENTO, 'La dotación debe ser mayor a 0 empleados.')
  end

  else if fraEE_LUGARDEOCURRENCIA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_LUGARDEOCURRENCIA.edCodigo, 'El lugar de ocurrencia es obligatorio.')
  end

  else if not edEE_FRECEPCIONOBRA.IsEmpty and (edEE_FRECEPCIONOBRA.Date > dHoy) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_FRECEPCIONOBRA, 'La fecha de recepción de la obra tiene que ser menor o igual a hoy.')
  end

  else if not edEE_FINICIOACTIVIDAD.IsEmpty and (edEE_FINICIOACTIVIDAD.Date > dHoy) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_FINICIOACTIVIDAD, 'La fecha de inicio de la actividad tiene que ser menor o igual a hoy.')
  end

  else if (rgEE_TIPOESTABLECIMIENTO.ItemIndex = 1) and fraEE_ETAPAOBRA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_ETAPAOBRA.edCodigo, 'Si es una obra, la etapa de la misma es obligatoria.')
  end

  else if (rgEE_TIPOESTABLECIMIENTO.ItemIndex = 1) and fraEE_PROGRAMASEGURIDAD.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_PROGRAMASEGURIDAD.edCodigo, 'Si es una obra, el programa de seguridad es obligatorio.')
  end

  else if (rgEE_TIPOESTABLECIMIENTO.ItemIndex = 1) and (fraEE_PROGRAMA.Value <> 'O') and
          (fraEE_PROGRAMA.Value <> 'T') and (fraEE_PROGRAMA.Value <> 'P') then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_PROGRAMA, 'Si es una obra, el programa debe ser construcción.')
  end

  else if (rgEE_TIPOESTABLECIMIENTO.ItemIndex = 1) and not Is_FechaValida(edEE_FFINOBRA.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_FFINOBRA, 'Si es una obra, la fecha de finalización de la misma es obligatoria.')
  end

  else if TimeToStr(edEE_HORARIODESDE.Time) = '0:00:00' then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_HORARIODESDE, 'El horario desde es obligatorio.')
  end

  else if TimeToStr(edEE_HORARIOHASTA.Time) = '0:00:00' then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_HORARIOHASTA, 'El horario hasta es obligatorio.')
  end

  else if IsEmptyString(edEE_TAREASHABITUALES.Lines.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_TAREASHABITUALES, 'El campo tareas habituales es obligatorio.')
  end

  else if IsEmptyString(edEE_TAREASENFERMEDAD.Lines.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_TAREASENFERMEDAD, 'El campo tareas al momento de contraer la enfermedad es obligatorio.')
  end

  else if IsEmptyString(edEE_DESCRIPCIONENFERMEDAD.Lines.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_DESCRIPCIONENFERMEDAD, 'La descripción de la enfermedad es obligatoria.')
  end

  else if IsEmptyString(edEE_HECHOSADICIONALES.Lines.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_HECHOSADICIONALES, 'Los hechos necesarios para que se contrajera la enfermedad son obligatorios.')
  end

  else if IsEmptyString(fraPreventor.ID) and IsEmptyString(edEE_RESPONSABLE.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraPreventor, 'El preventor es obligatorio.')
  end

  else if IsEmptyString(edEE_TITULO.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_TITULO, 'El título es obligatorio.')
  end

  else if fraEE_TIPOMATRICULA.IsEmpty Then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraEE_TIPOMATRICULA.edCodigo, 'El tipo de matrícula es obligatorio.')
  end

  else if IsEmptyString(edEE_NUMEROMATRICULA.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_NUMEROMATRICULA, 'El número de matrícula es obligatorio.')
  end

  else if IsEmptyString(edEE_INSTITUCIONOTORGANTE.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_INSTITUCIONOTORGANTE, 'La institución otorgante es obligatoria.')
  end

  else if edEE_FECHA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_FECHA, 'La fecha de investigación es obligatoria.')
  end

  else if edEE_FECHA.Date > dHoy then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_FECHA, 'La fecha de investigación tiene que ser menor o igual a hoy.')
  end

  else if edEE_FECHA.Date < edEX_FECHAENFERMEDAD.Date then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edEE_FECHA, 'La fecha de investigación tiene que ser mayor o igual a la fecha en al que se contrajo la enfermedad.')
  end

  else if pbEsMortal and not cbPRAM.Checked then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InfoHint(ScrollBox,'El siniestro debería ser seleccionado como PRAM (Programa de Reducción de Enfermedades Mortales)');
  end
  else
    Result := True;

  Verificar(fraDomicilioEnfermedadEstabl.CodigoPostal = '',fraDomicilioEnfermedadEstabl,'Debe existir el Código Postal.');
end;

function TfrmInfInvestigacionEnfermedades.VerificarDatosAgente: Boolean;
begin
  Result :=
      (Verificar((not fraESOP.IsSelected), fraESOP, 'Debe completar el dato ESOP'))
      AND
      (Verificar((not rbtPresenciaAgenteSI.Checked) and (not rbtPresenciaAgenteNO.Checked),
        rbtPresenciaAgenteSI, 'Debe selecciionar una de las dos opciones'))
      ;
end;

procedure TfrmInfInvestigacionEnfermedades.EditarMemos(edComponente: TEdit);
begin
  edMemos.Visible := True;
  edMemos.SetFocus;
  edMemos.ImeName := edComponente.Name; {shhhh!... ;->}
  edMemos.Text := edComponente.Text;
end;

procedure TfrmInfInvestigacionEnfermedades.edMemosExit(Sender: TObject);
begin
  edMemos.Visible := False;
  TEdit(FindComponent(edMemos.ImeName)).Text := edMemos.Text;
  TEdit(FindComponent(edMemos.ImeName)).SetFocus;
end;

procedure TfrmInfInvestigacionEnfermedades.edMemosKeyPress(Sender: TObject; var
    Key: Char);
begin
  if Key = #27 then edMemos.OnExit(Sender);
end;

procedure TfrmInfInvestigacionEnfermedades.edMemPresAgenteDblClick(Sender:
    TObject);
begin
  edMemos.Top  := TEdit(Sender).Top;
  edMemos.Left := TEdit(Sender).BoundsRect.Left - edMemos.Width;
  EditarMemos(TEdit(Sender));
end;

procedure TfrmInfInvestigacionEnfermedades.frmPanelESOPKeyPress(Sender:
    TObject; var Key: Char);
begin
  if (Key = #27) and (not edMemos.Visible) then btnESOPCancelClick(Sender);
end;

procedure TfrmInfInvestigacionEnfermedades.grdDatosAgentesGetCellParams(Sender:
    TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight:
    Boolean);
begin
  if not sdqPAD_AGENTESDETECTADOS.FieldByName('AD_FECHABAJA').IsNull then
      AFont.Color := clRed;

end;

procedure TfrmInfInvestigacionEnfermedades.scbDatosAgenteClick(Sender: TObject);
begin
  if edMemos.Visible then
    edMemos.OnExit(Sender);
end;

procedure TfrmInfInvestigacionEnfermedades.tbBajaESOPClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPAD_AGENTESDETECTADOS, 'AD');
end;

procedure TfrmInfInvestigacionEnfermedades.LimpiarDatosAgentes;
var
  i, j: Word;
begin
  for i := 0 to scbDatosAgente.ControlCount -1 do
  begin
    if (scbDatosAgente.Controls[i].ClassType = TRadioButton) then
      (scbDatosAgente.Controls[i] as TRadioButton).Checked := False;

    if (scbDatosAgente.Controls[i].ClassType = TComboBox) then
      (scbDatosAgente.Controls[i] as TComboBox).Text := '';

    if (scbDatosAgente.Controls[i].ClassType = TMemo) then
      (scbDatosAgente.Controls[i] as TMemo).Lines[0] := '';

    if (scbDatosAgente.Controls[i].ClassType = TPanel) then
      for j := 0 to (scbDatosAgente.Controls[i] as TPanel).ControlCount -1 do
        ((scbDatosAgente.Controls[i] as TPanel).Controls[j] as TRadioButton).Checked := False;

    if (scbDatosAgente.Controls[i].ClassType = TDateTimePicker) then
      (scbDatosAgente.Controls[i] as TDateTimePicker).Time := 0;

  end;
end;

procedure TfrmInfInvestigacionEnfermedades.GuardarDatosAdicionales;
begin
  GuardarChks;
end;

procedure TfrmInfInvestigacionEnfermedades.GuardarChks;
var
  idVal: integer;
  bkm: TBookMark;
begin
  if VerificarDatosAdicionales then
  begin
    bkm := sdqPED_ENFERMEDADDATAADICIONAL.GetBookmark;
    try
      EjecutarSqlSTEx('DELETE FROM hys.ped_enfermedaddataadicional WHERE ed_expediente = :sexid',
          [edSiniestro.Siniestro]);

      idVal := GetSecNextVal('HYS.SEQ_PED_ID');
      EjecutarSqlSTEx(
              'INSERT INTO hys.ped_enfermedaddataadicional ( '
            + '                                       ed_id, '
            + '                                       ed_pisomad, '
            + '                                       ed_pisohormi, '
            + '                                       ed_pisotierra, '
            + '                                       ed_pisootros, '
            + '                                       ed_paredmad, '
            + '                                       ed_paredhormi, '
            + '                                       ed_paredchapa, '
            + '                                       ed_paredotros, '
            + '                                       ed_techomad, '
            + '                                       ed_techoting, '
            + '                                       ed_techoloza, '
            + '                                       ed_techootros, '
            + '                                       ed_ventnat, '
            + '                                       ed_ventextrac, '
            + '                                       ed_ventinyec, '
            + '                                       ed_ventotros, '
            + '                                       ed_locrend, '
            + '                                       ed_loccab, '
            + '                                       ed_loccamp, '
            + '                                       ed_locotros, '
            + '                                       ed_ilumnat, '
            + '                                       ed_ilumartif, '
            + '                                       ed_ruidoaisacust, '
            + '                                       ed_ruidopaneles, '
            + '                                       ed_riesgosant, '
            + '                                       ed_trabinsalub, '
            + '                                       ed_planescrito, '
            + '                                       ed_mapariesgo, '
            + '                                       ed_medruido, '
            + '                                       ed_ilumnplanta, '
            + '                                       ed_medcargaterm, '
            + '                                       ed_normasestab, '
            + '                                       ed_medcontrac, '
            + '                                       ed_prodpeligroso, '
            + '                                       ed_planaccion, '
            + '                                       ed_medimplement, '
            + '                                       ed_medtrabajo, '
            + '                                       ed_higienesegur, '
            + '                                       ed_medtrabresp, '
            + '                                       ed_higiesegurresp, '
            + '                                       ed_medtrabrespmattri, '
            + '                                       ed_higregrespmatri, '
            + '                                       ed_medtrabtipoint, '
            + '                                       ed_medtrabtipoext, '
            + '                                       ed_higsegtipoint, '
            + '                                       ed_higsegtipoext, '
            + '                                       ed_antecedobs, '
            + '                                       ed_expediente '
            + '                                      ) '
            + '   VALUES  ( '
            + '            :ed_id, '
            + '            :ed_pisomad, '
            + '            :ed_pisohormi, '
            + '            :ed_pisotierra, '
            + '            :ed_pisootros, '
            + '            :ed_paredmad, '
            + '            :ed_paredhormi, '
            + '            :ed_paredchapa, '
            + '            :ed_paredotros, '
            + '            :ed_techomad, '
            + '            :ed_techoting, '
            + '            :ed_techoloza, '
            + '            :ed_techootros, '
            + '            :ed_ventnat, '
            + '            :ed_ventextrac, '
            + '            :ed_ventinyec, '
            + '            :ed_ventotros, '
            + '            :ed_locrend, '
            + '            :ed_loccab, '
            + '            :ed_loccamp, '
            + '            :ed_locotros, '
            + '            :ed_ilumnat, '
            + '            :ed_ilumartif, '
            + '            :ed_ruidoaisacust, '
            + '            :ed_ruidopaneles, '
            + '            :ed_riesgosant, '
            + '            :ed_trabinsalub, '
            + '            :ed_planescrito, '
            + '            :ed_mapariesgo, '
            + '            :ed_medruido, '
            + '            :ed_ilumnplanta, '
            + '            :ed_medcargaterm, '
            + '            :ed_normasestab, '
            + '            :ed_medcontrac, '
            + '            :ed_prodpeligroso, '
            + '            :ed_planaccion, '
            + '            :ed_medimplement, '
            + '            :ed_medtrabajo, '
            + '            :ed_higienesegur, '
            + '            :ed_medtrabresp, '
            + '            :ed_higiesegurresp, '
            + '            :ed_medtrabrespmattri, '
            + '            :ed_higregrespmatri, '
            + '            :ec_medtrabtipoint, '
            + '            :ed_medtrabtipoext, '
            + '            :ed_higsegtipoint, '
            + '            :ed_higsegtipoext, '
            + '            :ed_antecedobs, '
            + '            :ed_idsex '
            + '           ) ',
            [ idVal,
              IIF(chkPisoMad.Checked, 'S', '' ),
              IIF(chkPisoHormi.Checked, 'S', '' ),
              IIF(chkPisoTierra.Checked, 'S', '' ),
              IIF(chkPisoOtros.Checked, 'S', '' ),
              IIF(chkParedMad.Checked, 'S', '' ),
              IIF(chkParedHormi.Checked, 'S', '' ),
              IIF(chkParedChapa.Checked, 'S', '' ),
              IIF(chkParedOtros.Checked, 'S', '' ),
              IIF(chkTechoMad.Checked, 'S', '' ),
              IIF(chkTechoTing.Checked, 'S', '' ),
              IIF(chkTechoLoza.Checked, 'S', '' ),
              IIF(chkTechoOtros.Checked, 'S', '' ),
              IIF(chkVentNat.Checked, 'S', '' ),
              IIF(chkVentExtrac.Checked, 'S', '' ),
              IIF(chkVentInyec.Checked, 'S', '' ),
              IIF(chkVentOtros.Checked, 'S', '' ),
              IIF(chkLocRend.Checked, 'S', '' ),
              IIF(chkLocCab.Checked, 'S', '' ),
              IIF(chkLocCamp.Checked, 'S', '' ),
              IIF(chkLocOtros.Checked, 'S', '' ),
              IIF(chkIlumNat.Checked, 'S', '' ),
              IIF(chkIlumArtif.Checked, 'S', '' ),
              IIF(chkRuidoAisAcust.Checked, 'S', '' ),
              IIF(chkRuidoPaneles.Checked, 'S', '' ),
              IIF(rbtRiesgosAnteSI.Checked, 'S', iif(rbtRiesgosAnteNO.Checked, 'N', '') ),
              IIF(rbtTrabInsalubSI.Checked, 'S', iif(rbtTrabInsalubNO.Checked, 'N', '') ),
              IIF(rbtPlanEscritoSI.Checked, 'S',
                  iif(rbtPlanEscritoNO.Checked, 'N', iif(rbtPlanEscritoNC.Checked, 'X', '') ) ),
              IIF(rbtMapasRiesgoSI.Checked, 'S',
                  iif(rbtMapasRiesgoNO.Checked, 'N', iif(rbtMapasRiesgoNC.Checked, 'X', '') ) ),
              IIF(rbtMedRuidoSI.Checked, 'S',
                  iif(rbtMedRuidoNO.Checked, 'N', iif(rbtMedRuidoNC.Checked, 'X', '') ) ),
              IIF(rbtEstluminacionSI.Checked, 'S',
                  iif(rbtEstluminacionNO.Checked, 'N', iif(rbtEstluminacionNC.Checked, 'X', '') ) ),
              IIF(rbtMedCargaTermSI.Checked, 'S',
                  iif(rbtMedCargaTermNO.Checked, 'N', iif(rbtMedCargaTermNC.Checked, 'X', '') ) ),
              IIF(rbtNormasEstabSI.Checked, 'S',
                  iif(rbtNormasEstabNO.Checked, 'N', iif(rbtNormasEstabNC.Checked, 'X', '') ) ),
              IIF(rbtMedContracSI.Checked, 'S',
                  iif(rbtMedContracNO.Checked, 'N', iif(rbtMedContracNC.Checked, 'X', '') ) ),
              IIF(rbtProdPeligrosoSI.Checked, 'S',
                  iif(rbtProdPeligrosoNO.Checked, 'N', iif(rbtProdPeligrosoNC.Checked, 'X', '') ) ),
              IIF(rbtPlanAccionSI.Checked, 'S',
                  iif(rbtPlanAccionNO.Checked, 'N', iif(rbtPlanAccionNC.Checked, 'X', '') ) ),
              IIF(rbtMedImplementSI.Checked, 'S',
                  iif(rbtMedImplementNO.Checked, 'N', iif(rbtMedImplementNC.Checked, 'X', '') ) ),
              IIF(rbtMedTrabajoSI.Checked, 'S', iif(rbtMedTrabajoNO.Checked, 'N', '') ),
              IIF(rbtHigieneSegurSI .Checked, 'S', iif(rbtHigieneSegurNO.Checked, 'N', '') ),
              edMedTrabResp.Text,
              edHigieSegurResp.Text,
              edMedTrabRespMatri.Text,
              edHigSegRespMatri.Text,
              IIF(chkMedTrabTipoInt.Checked, 'S', '' ),
              IIF(chkMedTrabTipoExt.Checked, 'S', '' ),
              IIF(chkHigSegTipoInt.Checked, 'S', '' ),
              IIF(chkHigSegTipoExt.Checked, 'S', '' ),
              edAntecedObs.Lines,
              edSiniestro.Siniestro
            ]
      );
      sdqPED_ENFERMEDADDATAADICIONAL.Close;
      sdqPED_ENFERMEDADDATAADICIONAL.Open;
      sdqPED_ENFERMEDADDATAADICIONAL.GotoBookmark(bkm);
      sdqPED_ENFERMEDADDATAADICIONAL.FreeBookMark(bkm);
    except
      on E: Exception do
      begin
        ErrorMsg(E, ERROR_AL_GUARDAR_DATOS);
        sdqPED_ENFERMEDADDATAADICIONAL.FreeBookMark(bkm);
      end;
    end;
  end;
end;

function TfrmInfInvestigacionEnfermedades.VerificarDatosAdicionales: Boolean;
begin
  Result := True;
  // TODO -cMM: no se especificaron aún validaciones para estos datos
end;

procedure TfrmInfInvestigacionEnfermedades.CargarDatosAdicionales;
begin
  with sdqPED_ENFERMEDADDATAADICIONAL do
  begin
    Active := True;
    chkPisoMad.Checked        := IIF(FieldByName('ED_PISOMAD').AsString = 'S', True, False);
    chkPisoHormi.Checked      := IIF(FieldByName('ED_PISOHORMI').AsString = 'S', True, False);
    chkPisoTierra.Checked     := IIF(FieldByName('ED_PISOTIERRA').AsString = 'S', True, False);
    chkPisoOtros.Checked      := IIF(FieldByName('ED_PISOOTROS').AsString = 'S', True, False);
    chkParedMad.Checked       := IIF(FieldByName('ED_PAREDMAD').AsString = 'S', True, False);
    chkParedHormi.Checked     := IIF(FieldByName('ED_PAREDHORMI').AsString = 'S', True, False);
    chkParedChapa.Checked     := IIF(FieldByName('ED_PAREDCHAPA').AsString = 'S', True, False);
    chkParedOtros.Checked     := IIF(FieldByName('ED_PAREDOTROS').AsString = 'S', True, False);
    chkTechoMad.Checked       := IIF(FieldByName('ED_TECHOMAD').AsString = 'S', True, False);
    chkTechoTing.Checked      := IIF(FieldByName('ED_TECHOTING').AsString = 'S', True, False);
    chkTechoLoza.Checked      := IIF(FieldByName('ED_TECHOLOZA').AsString = 'S', True, False);
    chkTechoOtros.Checked     := IIF(FieldByName('ED_TECHOOTROS').AsString = 'S', True, False);
    chkVentNat.Checked        := IIF(FieldByName('ED_VENTNAT').AsString = 'S', True, False);
    chkVentExtrac.Checked     := IIF(FieldByName('ED_VENTEXTRAC').AsString = 'S', True, False);
    chkVentInyec.Checked      := IIF(FieldByName('ED_VENTINYEC').AsString = 'S', True, False);
    chkVentOtros.Checked      := IIF(FieldByName('ED_VENTOTROS').AsString = 'S', True, False);
    chkLocRend.Checked        := IIF(FieldByName('ED_LOCREND').AsString = 'S', True, False);
    chkLocCab.Checked         := IIF(FieldByName('ED_LOCCAB').AsString = 'S', True, False);
    chkLocCamp.Checked        := IIF(FieldByName('ED_LOCCAMP').AsString = 'S', True, False);
    chkLocOtros.Checked       := IIF(FieldByName('ED_LOCOTROS').AsString = 'S', True, False);
    chkIlumNat.Checked        := IIF(FieldByName('ED_ILUMNAT').AsString = 'S', True, False);
    chkIlumArtif.Checked      := IIF(FieldByName('ED_ILUMARTIF').AsString = 'S', True, False);
    chkRuidoAisAcust.Checked  := IIF(FieldByName('ED_RUIDOAISACUST').AsString = 'S', True, False);
    chkRuidoPaneles.Checked   := IIF(FieldByName('ED_RUIDOPANELES').AsString = 'S', True, False);
    rbtRiesgosAnteSI.Checked  := IIF(FieldByName('ED_RIESGOSANT').AsString = 'S', True, False);
    rbtRiesgosAnteNO.Checked  := IIF(FieldByName('ED_RIESGOSANT').AsString = 'N', True, False);
    rbtTrabInsalubSI.Checked  := IIF(FieldByName('ED_TRABINSALUB').AsString = 'S', True, False);
    rbtTrabInsalubNO.Checked  := IIF(FieldByName('ED_TRABINSALUB').AsString = 'N', True, False);
    edAntecedObs.Lines[0]     := FieldByName('ED_ANTECEDOBS').AsString;
    rbtPlanEscritoSI.Checked  := IIF(FieldByName('ED_PLANESCRITO').AsString = 'S', True, False);
    rbtPlanEscritoNO.Checked  := IIF(FieldByName('ED_PLANESCRITO').AsString = 'N', True, False);
    rbtPlanEscritoNC.Checked  := IIF(FieldByName('ED_PLANESCRITO').AsString = 'X', True, False);
    rbtMapasRiesgoSI.Checked  := IIF(FieldByName('ED_MAPARIESGO').AsString = 'S', True, False);
    rbtMapasRiesgoNO.Checked  := IIF(FieldByName('ED_MAPARIESGO').AsString = 'N', True, False);
    rbtMapasRiesgoNC.Checked  := IIF(FieldByName('ED_MAPARIESGO').AsString = 'X', True, False);
    rbtMedRuidoSI.Checked     := IIF(FieldByName('ED_MEDRUIDO').AsString = 'S', True, False);
    rbtMedRuidoNO.Checked     := IIF(FieldByName('ED_MEDRUIDO').AsString = 'N', True, False);
    rbtMedRuidoNC.Checked     := IIF(FieldByName('ED_MEDRUIDO').AsString = 'X', True, False);
    rbtEstluminacionSI.Checked:= IIF(FieldByName('ED_ILUMNPLANTA').AsString = 'S', True, False);
    rbtEstluminacionNO.Checked:= IIF(FieldByName('ED_ILUMNPLANTA').AsString = 'N', True, False);
    rbtEstluminacionNC.Checked:= IIF(FieldByName('ED_ILUMNPLANTA').AsString = 'X', True, False);
    rbtMedCargaTermSI.Checked := IIF(FieldByName('ED_MEDCARGATERM').AsString = 'S', True, False);
    rbtMedCargaTermNO.Checked := IIF(FieldByName('ED_MEDCARGATERM').AsString = 'N', True, False);
    rbtMedCargaTermNC.Checked := IIF(FieldByName('ED_MEDCARGATERM').AsString = 'X', True, False);
    rbtNormasEstabSI.Checked  := IIF(FieldByName('ED_NORMASESTAB').AsString = 'S', True, False);
    rbtNormasEstabNO.Checked  := IIF(FieldByName('ED_NORMASESTAB').AsString = 'N', True, False);
    rbtNormasEstabNC.Checked  := IIF(FieldByName('ED_NORMASESTAB').AsString = 'X', True, False);
    rbtMedContracSI.Checked   := IIF(FieldByName('ED_MEDCONTRAC').AsString = 'S', True, False);
    rbtMedContracNO.Checked   := IIF(FieldByName('ED_MEDCONTRAC').AsString = 'N', True, False);
    rbtMedContracNC.Checked   := IIF(FieldByName('ED_MEDCONTRAC').AsString = 'X', True, False);
    rbtProdPeligrosoSI.Checked:= IIF(FieldByName('ED_PRODPELIGROSO').AsString = 'S', True, False);
    rbtProdPeligrosoNO.Checked:= IIF(FieldByName('ED_PRODPELIGROSO').AsString = 'N', True, False);
    rbtProdPeligrosoNC.Checked:= IIF(FieldByName('ED_PRODPELIGROSO').AsString = 'X', True, False);
    rbtPlanAccionSI.Checked   := IIF(FieldByName('ED_PLANACCION').AsString = 'S', True, False);
    rbtPlanAccionNO.Checked   := IIF(FieldByName('ED_PLANACCION').AsString = 'N', True, False);
    rbtPlanAccionNC.Checked   := IIF(FieldByName('ED_PLANACCION').AsString = 'X', True, False);
    rbtMedImplementSI.Checked := IIF(FieldByName('ED_MEDIMPLEMENT').AsString = 'S', True, False);
    rbtMedImplementNO.Checked := IIF(FieldByName('ED_MEDIMPLEMENT').AsString = 'N', True, False);
    rbtMedImplementNC.Checked := IIF(FieldByName('ED_MEDIMPLEMENT').AsString = 'X', True, False);
    rbtMedTrabajoSI.Checked   := IIF(FieldByName('ED_MEDTRABAJO').AsString = 'S', True, False);
    rbtMedTrabajoNO.Checked   := IIF(FieldByName('ED_MEDTRABAJO').AsString = 'N', True, False);
    rbtHigieneSegurSI.Checked := IIF(FieldByName('ED_HIGIENESEGUR').AsString = 'S', True, False);
    rbtHigieneSegurNO.Checked := IIF(FieldByName('ED_HIGIENESEGUR').AsString = 'N', True, False);
    edMedTrabResp.Text        := FieldByName('ED_MEDTRABRESP').AsString;
    edMedTrabRespMatri.Text   := FieldByName('ED_MEDTRABRESPMATTRI').AsString;
    edHigieSegurResp.Text     := FieldByName('ED_HIGIESEGURRESP').AsString;
    edHigSegRespMatri.Text    := FieldByName('ED_HIGREGRESPMATRI').AsString;
    chkMedTrabTipoInt.Checked := IIF(FieldByName('ED_MEDTRABTIPOINT').AsString = 'S', True, False);
    chkMedTrabTipoExt.Checked := IIF(FieldByName('ED_MEDTRABTIPOEXT').AsString = 'S', True, False);
    chkHigSegTipoInt.Checked  := IIF(FieldByName('ED_HIGSEGTIPOINT').AsString = 'S', True, False);
    chkHigSegTipoExt.Checked  := IIF(FieldByName('ED_HIGSEGTIPOEXT').AsString = 'S', True, False);
  end;

end;

procedure TfrmInfInvestigacionEnfermedades.CargarDatosAgentes;
begin
  with sdqPAD_AGENTESDETECTADOS do
  begin
    Active := True;
    fraESOP.Value              := FieldByName('AD_PRGID').AsInteger;
    fraESOP.Codigo             := FieldByName('AD_ESOP').AsString;
    fraESOP.cmbDescripcion.Text:= FieldByName('AD_DESCRIPCION').AsString;
    cmbNivelesConce.ItemIndex  := cmbNivelesConce.Items.IndexOf(FieldByName('AD_NIVELCONCENTRACION').AsString);
    cmbFrecuencia.ItemIndex    := cmbFrecuencia.Items.IndexOf(FieldByName('AD_FRECUENCIAEXPO').AsString);
    edDuraExpo.Value           := FieldByName('AD_DURACIONEXPO').AsInteger;
    edMemPresAgente.Text       := FieldByName('AD_OBSPRESENCIAAGENTE').AsString;
    edMemFrecExpo.Text         := FieldByName('AD_OBSFRECUENCIA').AsString;
    edMemDuraExpo.Text         := FieldByName('AD_OBSDURAEXPO').AsString;
    edMemMedAmb.Text           := FieldByName('AD_OBSMEDAMB').AsString;
    edMemNivConcent.Text       := FieldByName('AD_OBSNIVCONCENT').AsString;
    edMemSuperaLimite.Text     := FieldByName('AD_OBSLIMITELEGAL').AsString;
    edMemEPP.Text              := FieldByName('AD_OBSEPP').AsString;
    edMemCapacit.Text          := FieldByName('AD_OBSCAPACIT').AsString;
    edMemEstErgo.Text          := FieldByName('AD_OBSESTERGO').AsString;
    edMemVacunacion.Text       := FieldByName('AD_OBSVACU').AsString;
    edSiniestro.Siniestro      := FieldByName('AD_EXPEDIENTE').AsInteger;
    fraESOPAsociado.Codigo     := FieldByName('AD_ESOPASOCIADO').AsString;
    fraESOPAsociado.cmbDescripcion.Text := FieldByName('AD_ESOPASOCIADODESC').AsString;

    if FieldByName('AD_PRESENCIAAGENTE').AsString = 'S' then
      rbtPresenciaAgenteSI.Checked := True
    else if FieldByName('AD_PRESENCIAAGENTE').AsString = 'N' then
      rbtPresenciaAgenteNO.Checked := True
    else begin
      rbtPresenciaAgenteSI.Checked := False;
      rbtPresenciaAgenteNO.Checked := False;
    end;

    if FieldByName('AD_MEDICIONESAMB').AsString = 'S' then
      rbtMedAmbSI.Checked := True
    else if FieldByName('AD_MEDICIONESAMB').AsString = 'N' then
      rbtMedAmbNO.Checked := True
    else begin
      rbtMedAmbSI.Checked := False;
      rbtMedAmbNO.Checked := False;
    end;

    if FieldByName('AD_SUPERALIMITE').AsString = 'S' then
      rbtSuperaLimiteSI.Checked := True
    else if FieldByName('AD_MEDICIONESAMB').AsString = 'N' then
      rbtSuperaLimiteNO.Checked := True
    else begin
      rbtSuperaLimiteSI.Checked := False;
      rbtSuperaLimiteNO.Checked := False;
    end;

    if FieldByName('AD_EPPADECUADOS').AsString = 'S'then
      rbtEPPSI.Checked := True
    else if FieldByName('AD_MEDICIONESAMB').AsString = 'N' then
      rbtEPPNO.Checked := True
    else begin
      rbtEPPSI.Checked := False;
      rbtEPPNO.Checked := False;
    end;

    if FieldByName('AD_CAPACITATRAB').AsString = 'S' then
      rbtCapacitSI.Checked := True
    else if FieldByName('AD_MEDICIONESAMB').AsString = 'N' then
      rbtCapacitNO.Checked := True
    else begin
      rbtCapacitSI.Checked := False;
      rbtCapacitNO.Checked := False;
    end;

    if FieldByName('AD_ESTUDIOSERG').AsString = 'S' then
      rbtEstErgoSI.Checked := True
    else if FieldByName('AD_MEDICIONESAMB').AsString = 'N' then
      rbtEstErgoNO.Checked := True
    else begin
      rbtEstErgoSI.Checked := False;
      rbtEstErgoNO.Checked := False;
    end;

    if FieldByName('AD_VACUNACION').AsString = 'S' then
      rbtVacunaSI.Checked := True
    else if FieldByName('AD_MEDICIONESAMB').AsString = 'N' then
      rbtVacunaNO.Checked := True
    else begin
      rbtVacunaSI.Checked := False;
      rbtVacunaNO.Checked := False;
    end;

  end;
end;

procedure
    TfrmInfInvestigacionEnfermedades.fraTrabajadorSinGraveBusqedSiniestroSelect(
    Sender: TObject);
begin
  inherited;
  LimpiarDatosA;
  fraTrabajadorSinGraveBusq.edSiniestroSelect(Sender);
end;

procedure TfrmInfInvestigacionEnfermedades.grdDatosAgentesDblClick(Sender:
    TObject);
begin
  tbModESOP.Click;
end;

procedure TfrmInfInvestigacionEnfermedades.KeepConnTimer(Sender: TObject);
begin
  {para evitar la desconexión por inactividad}
  ValorSql('SELECT 1 FROM DUAL');
end;

procedure TfrmInfInvestigacionEnfermedades.LimpiarDatosA;
begin
  sdqPAD_AGENTESDETECTADOS.Close;
  sdqPED_ENFERMEDADDATAADICIONAL.Close;
  LimpiarDatosAgentes;
  DatosFormularioClear(scbDatosAdicionales);
end;

end.
