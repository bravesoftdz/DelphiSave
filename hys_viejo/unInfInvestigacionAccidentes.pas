{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit unInfInvestigacionAccidentes;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, StdCtrls, Mask,
  PatternEdit, IntEdit, Buttons, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl, ComCtrls, ToolWin, ExtCtrls,
  unFraTrabajador, unFraTrabajadorSinGrave, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unFraCodigoDescripcion, ToolEdit, DateComboBox,
  unFraPAE_ACCIDENTEESTABLECIMIENTO, Grids, DBGrids, RXDBCtrl, FormPanel, ExComboBox, unArt, SinEdit, unFraDomicilioTrab,
  unFraEmpresa, CurrEdit, DateTimeEditors, unFraTrabajadorSiniestro_D5,
  RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmInfInvestigacionAccidentes = class(TfrmCustomPanelABM)
    pcDatos: TPageControl;
    tsDatosSiniestro: TTabSheet;
    tsEntrevistas: TTabSheet;
    sduConsulta: TSDUpdateSQL;
    ScrollBox: TScrollBox;
    fraTrabajadorSinGraveBusq: TfraPAE_ACCIDENTEESTABLECIMIENTO;
    tbManTrabajadores: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    lbPrograma: TLabel;
    fraAE_PROGRAMA: TfraStaticCTB_TABLAS;
    fraAE_IDOPERATIVO: TfraStaticCodigoDescripcion;
    Operativo: TLabel;
    edAE_DOTACION: TIntEdit;
    Label7: TLabel;
    Bevel3: TBevel;
    lbObservaciones: TLabel;
    edAE_OBSERVACIONES: TMemo;
    dbgPPE_PERSONAENTREVISTADA: TRxDBGrid;
    CoolBar1: TCoolBar;
    tBarPPE_PERSONAENTREVISTADA: TToolBar;
    tbPPENuevo: TToolButton;
    tbPPEModificar: TToolButton;
    tbPPEEliminar: TToolButton;
    sdqPPE_PERSONAENTREVISTADA: TSDQuery;
    dsPPE_PERSONAENTREVISTADA: TDataSource;
    sduPPE_PERSONAENTREVISTADA: TSDUpdateSQL;
    fpPPE_PERSONAENTREVISTADA: TFormPanel;
    Bevel4: TBevel;
    btPPEAceptar: TButton;
    btnPPECancelar: TButton;
    mskPE_CUIL: TMaskEdit;
    lbCUIL: TLabel;
    edPE_NOMBRE: TPatternEdit;
    Label8: TLabel;
    edPE_CARGO: TPatternEdit;
    Label9: TLabel;
    edPE_FECHA_ENTREVISTA: TDateComboBox;
    Label10: TLabel;
    edPE_TIPO_ENTREVISTA: TExComboBox;
    Label11: TLabel;
    btnTop: TSpeedButton;
    tsCausasMedidasSeguim: TTabSheet;
    sdqPDC_DIAGNOSTICOCAUSA: TSDQuery;
    dsPDC_DIAGNOSTICOCAUSA: TDataSource;
    sduPDC_DIAGNOSTICOCAUSA: TSDUpdateSQL;
    lbNroDenSRT: TLabel;
    edNroDenunciaSRT: TPatternEdit;
    lbSiniestro: TLabel;
    edSiniestro: TSinEdit;
    Bevel6: TBevel;
    Label16: TLabel;
    fraTJ_IDNACIONALIDAD: TfraStaticCodigoDescripcion;
    Label17: TLabel;
    fraTJ_SEXO: TfraStaticCTB_TABLAS;
    Label18: TLabel;
    cmbTJ_FNACIMIENTO: TDateComboBox;
    fraTrabajador: TfraTrabajador;
    Label19: TLabel;
    fraDomicilioTrabaj: TfraDomicilioTrab;
    lbCA: TLabel;
    edTJ_CODAREATELEFONO: TPatternEdit;
    lbTel: TLabel;
    edTJ_TELEFONO: TPatternEdit;
    lbTarea: TLabel;
    edRL_TAREA: TEdit;
    lbActividad: TLabel;
    Label20: TLabel;
    cmbRL_FECHAINGRESO: TDateComboBox;
    Label25: TLabel;
    fraRL_IDMODALIDADCONTRATACION: TfraStaticCodigoDescripcion;
    fraRL_CIUO: TfraStaticCodigoDescripcion;
    Label21: TLabel;
    Bevel7: TBevel;
    fraEmpresa: TfraEmpresa;
    Label22: TLabel;
    Label23: TLabel;
    edDC_CODAREATELEFONOS: TPatternEdit;
    Label24: TLabel;
    edDC_TELEFONOS: TPatternEdit;
    fraDomicilioEmpresa: TfraDomicilioTrab;
    Label26: TLabel;
    fraCO_IDACTIVIDAD: TfraStaticCodigoDescripcion;
    Label27: TLabel;
    fraPE_TIPODOCUMENTO: TfraStaticCTB_TABLAS;
    lbTipoDocumento: TLabel;
    edPE_DOCUMENTO: TIntEdit;
    lbDocumento: TLabel;
    Label1: TLabel;
    Bevel8: TBevel;
    Label28: TLabel;
    fraAE_ZONA: TfraStaticCTB_TABLAS;
    fraAE_NATURALEZA: TfraStaticCTB_TABLAS;
    Label29: TLabel;
    Label30: TLabel;
    fraAE_FORMA: TfraStaticCTB_TABLAS;
    Label31: TLabel;
    fraAE_AGENTE: TfraStaticCTB_TABLAS;
    Label32: TLabel;
    Bevel9: TBevel;
    Label33: TLabel;
    mskAE_CUIT: TMaskEdit;
    Label34: TLabel;
    edAE_EMPRESA: TPatternEdit;
    Label35: TLabel;
    fraAE_IDACTIVIDAD: TfraStaticCodigoDescripcion;
    fraDomicilioAccidenteEstabl: TfraDomicilioTrab;
    Label36: TLabel;
    edCodAreaAccidenteEstabl: TPatternEdit;
    Label37: TLabel;
    edAE_TELEFONOS: TPatternEdit;
    Label38: TLabel;
    fraAE_IDART: TfraStaticCodigoDescripcion;
    Label39: TLabel;
    fraAE_PROGRAMAEMPRESA: TfraStaticCTB_TABLAS;
    Label40: TLabel;
    fraAE_IDOPERATIVOEMPRESA: TfraStaticCodigoDescripcion;
    rgAE_TIPOESTABLECIMIENTO: TRadioGroup;
    Label41: TLabel;
    edAE_DOTACIONESTABLECIMIENTO: TIntEdit;
    Label42: TLabel;
    edAE_NROESTABLECIMIENTO: TIntEdit;
    Label43: TLabel;
    fraAE_LUGARDEOCURRENCIA: TfraStaticCTB_TABLAS;
    Label44: TLabel;
    edAE_FRECEPCIONOBRA: TDateComboBox;
    Label45: TLabel;
    edAE_FINICIOACTIVIDAD: TDateComboBox;
    edAE_SUPERFICIE: TCurrencyEdit;
    Label46: TLabel;
    edAE_PLANTAS: TIntEdit;
    Label47: TLabel;
    fraAE_TIPOOBRA: TfraStaticCTB_TABLAS;
    Label48: TLabel;
    Label49: TLabel;
    fraAE_ACTIVIDADOBRA: TfraStaticCTB_TABLAS;
    Label50: TLabel;
    fraAE_ETAPAOBRA: TfraStaticCTB_TABLAS;
    chkAE_PROGRAMAAPROBADO: TCheckBox;
    Label51: TLabel;
    fraAE_PROGRAMASEGURIDAD: TfraStaticCTB_TABLAS;
    Label52: TLabel;
    edAE_FFINOBRA: TDateComboBox;
    Label53: TLabel;
    edAE_FSUSPOBRA: TDateComboBox;
    Label54: TLabel;
    edAE_FREINICIOOBRA: TDateComboBox;
    Label55: TLabel;
    Bevel10: TBevel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    edEX_FECHAACCIDENTE: TDateComboBox;
    Label59: TLabel;
    chkAE_TURNOROTATIVO: TCheckBox;
    chkAE_HORASEXTRAS: TCheckBox;
    edEX_HORAACCIDENTE: TDateTimePicker;
    edAE_HORARIODESDE: TDateTimePicker;
    edAE_HORARIOHASTA: TDateTimePicker;
    Label60: TLabel;
    edAE_TAREASHABITUALES: TMemo;
    Label61: TLabel;
    edAE_TAREASACCIDENTE: TMemo;
    Label62: TLabel;
    edAE_DESCRIPCIONACCIDENTE: TMemo;
    Label63: TLabel;
    edAE_HECHOSADICIONALES: TMemo;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edAE_TITULO: TPatternEdit;
    Label5: TLabel;
    fraAE_TIPOMATRICULA: TfraStaticCTB_TABLAS;
    Label6: TLabel;
    Label12: TLabel;
    edAE_INSTITUCIONOTORGANTE: TPatternEdit;
    Label13: TLabel;
    edAE_FECHA: TDateComboBox;
    pcCausasMedidasSeguim: TPageControl;
    tsCausas: TTabSheet;
    tsMedidasCorrectivas: TTabSheet;
    CoolBar2: TCoolBar;
    tBarPDC_DIAGNOSTICOCAUSA: TToolBar;
    tbPDCNuevo: TToolButton;
    tbPDCModificar: TToolButton;
    tbPDCEliminar: TToolButton;
    dbgPDC_DIAGNOSTICOCAUSA: TRxDBGrid;
    fpPCD_DIAGNOSTICOCAUSA: TFormPanel;
    Bevel2: TBevel;
    Label14: TLabel;
    btPDCAceptar: TButton;
    btPDCCancelar: TButton;
    edDC_NUMERO: TIntEdit;
    edDC_DESCRIPCION: TMemo;
    sdqPMC_MEDIDACORRECTIVA: TSDQuery;
    dsPMC_MEDIDACORRECTIVA: TDataSource;
    sduPMC_MEDIDACORRECTIVA: TSDUpdateSQL;
    Label66: TLabel;
    Bevel11: TBevel;
    edAE_OTROSDATOS: TMemo;
    Splitter1: TSplitter;
    pcCausasVisitas: TPageControl;
    tsCausaMedidas: TTabSheet;
    CoolBar4: TCoolBar;
    tBarPCM_CAUSAYMEDIDA: TToolBar;
    tbPCMNuevo: TToolButton;
    tbPCMEliminar: TToolButton;
    dbgPCM_CAUSAYMEDIDA: TRxDBGrid;
    tsSeguimientoVisitas: TTabSheet;
    CoolBar5: TCoolBar;
    tBarPSV_SEGUIMIENTOVISITA: TToolBar;
    tbPSVNuevo: TToolButton;
    tbPSVModificar: TToolButton;
    tbPSVEliminar: TToolButton;
    dbgPSV_SEGUIMIENTOVISITA: TRxDBGrid;
    sdqPSV_SEGUIMIENTOVISITA: TSDQuery;
    dsPSV_SEGUIMIENTOVISITA: TDataSource;
    sduPSV_SEGUIMIENTOVISITA: TSDUpdateSQL;
    pnlMedidasCorrectivas: TPanel;
    CoolBar3: TCoolBar;
    tBarPMC_MEDIDACORRECTIVA: TToolBar;
    tbPMCNuevo: TToolButton;
    tbPMCModificar: TToolButton;
    tbPMCEliminar: TToolButton;
    dbgPMC_MEDIDACORRECTIVA: TRxDBGrid;
    fpPMC_MEDIDACORRECTIVA: TFormPanel;
    Bevel5: TBevel;
    Label15: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    btPMCAceptar: TButton;
    btPMCCancelar: TButton;
    edMC_MEDIDA: TIntEdit;
    edMC_DESCRIPCION: TMemo;
    edMC_FECHAEJECUCION: TDateComboBox;
    edMC_FECHAVERIFICACION: TDateComboBox;
    fpPSV_SEGUIMIENTOVISITA: TFormPanel;
    Bevel12: TBevel;
    Label70: TLabel;
    Label71: TLabel;
    btPSVAceptar: TButton;
    btPSVCancelar: TButton;
    edSV_FECHA: TDateComboBox;
    edSV_TIPO: TExComboBox;
    sdqPCM_CAUSAYMEDIDA: TSDQuery;
    dsPCM_CAUSAYMEDIDA: TDataSource;
    sduPCM_CAUSAYMEDIDA: TSDUpdateSQL;
    fpPCM_CAUSAYMEDIDA: TFormPanel;
    Bevel13: TBevel;
    Label67: TLabel;
    Label68: TLabel;
    btPCMAceptar: TButton;
    btPCMCancelar: TButton;
    edMC_MEDIDACAUSA: TIntEdit;
    fraPDC_DIAGNOSTICOCAUSA_ESTABL: TfraStaticCodigoDescripcion;
    tsAccidentesMultiples: TTabSheet;
    dbgPAM_ACCIDENTEMULTIPLE: TRxDBGrid;
    CoolBar6: TCoolBar;
    tBarPAM_ACCIDENTEMULTIPLE: TToolBar;
    tbPAMModificar: TToolButton;
    sdqPAM_ACCIDENTEMULTIPLE: TSDQuery;
    dsPAM_ACCIDENTEMULTIPLE: TDataSource;
    sduPAM_ACCIDENTEMULTIPLE: TSDUpdateSQL;
    fpPAM_ACCIDENTEMULTIPLE: TFormPanel;
    Bevel14: TBevel;
    btPAMAceptar: TButton;
    btPAMCancelar: TButton;
    edAM_DETALLELESION: TMemo;
    edAE_NUMEROMATRICULA: TEdit;
    edTJ_OTRANACIONALIDAD: TEdit;
    SpeedButton1: TSpeedButton;
    fraPreventor: TfraCodigoDescripcion;
    Label69: TLabel;
    edAE_RESPONSABLE: TPatternEdit;
    cbPRAM: TCheckBox;
    tbTraerSiniestrosMultiples: TToolButton;
    KeepConn: TTimer;
    cbNoDeterminada: TCheckBox;
    procedure tbManTrabajadoresClick(Sender: TObject);
    procedure FSFormCreate(Sender: TObject);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPPEAceptarClick(Sender: TObject);
    procedure tbPPENuevoClick(Sender: TObject);
    procedure tbPPEModificarClick(Sender: TObject);
    procedure tbPPEEliminarClick(Sender: TObject);
    procedure pcDatosChange(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnTopClick(Sender: TObject);
    procedure sdqRelacionesAfterOpen(DataSet: TDataSet);
    procedure sdqRelacionesPCMAfterOpen(DataSet: TDataSet);
    procedure tbPDCNuevoClick(Sender: TObject);
    procedure tbPDCModificarClick(Sender: TObject);
    procedure tbPDCEliminarClick(Sender: TObject);
    procedure edSiniestroExit(Sender: TObject);
    procedure edNroDenunciaSRTExit(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fpPCD_DIAGNOSTICOCAUSAEnter(Sender: TObject);
    procedure btPDCAceptarClick(Sender: TObject);
    procedure OnFraPreventorChange(Sender : TObject);
    procedure dbgPPE_PERSONAENTREVISTADAGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                      var Background: TColor; Highlight: Boolean);
    procedure dbgPDC_DIAGNOSTICOCAUSAGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                   Highlight: Boolean);
    procedure fpPMC_MEDIDACORRECTIVAEnter(Sender: TObject);
    procedure tbPMCNuevoClick(Sender: TObject);
    procedure tbPMCModificarClick(Sender: TObject);
    procedure btPMCAceptarClick(Sender: TObject);
    procedure tbPMCEliminarClick(Sender: TObject);
    procedure dbgPMC_MEDIDACORRECTIVAGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                   Highlight: Boolean);
    procedure pcCausasMedidasSeguimChange(Sender: TObject);
    procedure pcCausasVisitasChange(Sender: TObject);
    procedure dbgPSV_SEGUIMIENTOVISITAGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                    Highlight: Boolean);
    procedure tbPSVNuevoClick(Sender: TObject);
    procedure tbPSVModificarClick(Sender: TObject);
    procedure tbPSVEliminarClick(Sender: TObject);
    procedure btPSVAceptarClick(Sender: TObject);
    procedure sdqPMC_MEDIDACORRECTIVAAfterScroll(DataSet: TDataSet);
    procedure tbPCMEliminarClick(Sender: TObject);
    procedure fpPCM_CAUSAYMEDIDAEnter(Sender: TObject);
    procedure tbPCMNuevoClick(Sender: TObject);
    procedure btPCMAceptarClick(Sender: TObject);
    procedure tbPAMModificarClick(Sender: TObject);
    procedure btPAMAceptarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure rgAE_TIPOESTABLECIMIENTOClick(Sender: TObject);
    procedure edNroDenunciaSRTChange(Sender: TObject);
    procedure fraAE_PROGRAMAChange(Sender: TObject);
    procedure fraAE_PROGRAMAEMPRESAChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure fraPreventorcmbDescripcionDropDown(Sender: TObject);
    procedure fraPreventorcmbDescripcionCloseUp(Sender: TObject);
    procedure FSFormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta:
        Integer; MousePos: TPoint; var Handled: Boolean);
    procedure mskAE_CUITExit(Sender: TObject);
    procedure tbTraerSiniestrosMultiplesClick(Sender: TObject);
    procedure KeepConnTimer(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
  private
    AEstablecimiento: Integer;
    FCargo: Boolean;
    FCuit: String;
    ModoABMTablas: TModoABM;
    pbEsMortal: Boolean;
    pIdRelacionLaboral: TTableId;

    function BusquedaValida(var iSiniestro, iOrden, iRecaida: Integer; NroDenunciaSRT: String): Boolean;
    function Is_AccidenteEstablId: Boolean;
    function Is_EstablecimInvestigAccValido(CUIT: String; NroEstableci: Integer): Boolean;

    procedure Do_BuscarDatosDenunciaGrave(iSiniestro, iOrden, iRecaida: Integer; NroDenunciaSRT: String);
    procedure Do_CargarDatosSiniestro(iSiniestro, iOrden, iRecaida: Integer; CargarValoresDefecto,
                                      CargarSoloDatosTrabajador: Boolean);
    procedure Do_DarBajaSeguimientoVisita(IdMedidaCorrectiva: TTableId);
    procedure Do_DeshabilitarDatosSiniestro;
    procedure Do_GuardarDatosHistoricoLaboral(IdTrabajador: TTableId; Contrato: Integer; Tarea, CIUO: String;
                                              FechaIngreso: TDateTime; IdModalidadContratacion: TTableId);
    procedure Do_HabilitarDatosBusquedaDenunciaGrave(Habilitar: Boolean);
    procedure Do_HabilitarDatosRelacionLaboral(HabilitarRelLaboral: Boolean);
    procedure Do_ImprimirInvestigacionAccidente(IdAccidenteEstablecimiento: TTableId);
    procedure Do_InsertarAccidentesMultiples(IdAccidenteEstablecimiento: TTableId; Siniestro, Orden: Integer);
    procedure Do_LimpiarDatosBusquedaDenunciaGrave;
    procedure Do_LimpiarDatosSiniestro;
    procedure HabilitarCUILPersEntrevistada(HabilitarCUIL: Boolean);
    procedure IrPrincipioPantalla;
    procedure OnfraPE_TIPODOCUMENTOChange(Sender: TObject);
    procedure SetID(ADataSet: TSDQuery; AId: TTableId);
//    procedure SetId(APrefijo: string; ADataSet: TDataSet);
    procedure SetIDACCIDENTEESTABLECIMIENTO(AId: TTableId);
    procedure SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(AId: TTableId);
  protected
    function DoABM: Boolean; override;
    function PkViolated(DataSet: TDataSet; FieldNames: Array of String; FieldValues: Array of Variant): Boolean;
    function Validar: Boolean; override;

    procedure ClearControls(ClearPK: Boolean = False); override;
    procedure LoadControls; override;
    procedure PKChange(ASelected: Boolean); override;
    procedure DoDarDeBaja(ADataSet: TSDQuery; APrefijo: String; AAllowDelete: Boolean = True);
  public
    procedure OnfraTrabajadorSinGraveBusqChange(Sender: TObject);
  end;

implementation

uses
  AnsiSql, DBFuncs, unPrincipal, unContratoTrabajador, unDmPrincipal, CustomDlgs, Printers, StrFuncs, CUIT, General,
  VCLExtra, unRtti, unComunes, DateTimeFuncs, unqrInvestigacionAccidente, Numeros, unComunesFet,
  Math;

{$R *.DFM}

const
  PAGE_DATOSGENERALES        = 0;
  PAGE_PERSONASENTREVISTADAS = 1;
  PAGE_CAUSASMEDIDASSEGUIM   = 2;
  PAGE_ACCIDENTESMULTIPLES   = 3;

  PAGE_CAUSAS                = 0;
  PAGE_MEDIDASCORRECTIVAS    = 1;

  PAGE_CAUSAMEDIDAS          = 0;
  PAGE_SEGUIMIENTOVISITAS    = 1;

{----------------------------------------------------------------------------------------------------------------------}
{ TfrmInfInvestigacionAccidentes }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInfInvestigacionAccidentes.OnfraTrabajadorSinGraveBusqChange(Sender: TObject);
begin
  FCargo := false;
  PKChange(fraTrabajadorSinGraveBusq.IsSelected);
end;

procedure TfrmInfInvestigacionAccidentes.PKChange(ASelected: Boolean);
begin
 // tbManTrabajadores.Enabled := ASelected;

  if not ASelected then
  begin
    FCuit := '';
    AEstablecimiento := 0;
  end;

  inherited PKChange(ASelected);
end;

procedure TfrmInfInvestigacionAccidentes.tbManTrabajadoresClick(Sender: TObject);
begin
//  DoContratoTrabajador(fraTrabajador.Value, pIdRelacionLaboral);

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

procedure TfrmInfInvestigacionAccidentes.FSFormCreate(Sender: TObject);
begin
  inherited;

  fraTrabajadorSinGraveBusq.OnChange := OnfraTrabajadorSinGraveBusqChange;

  fraAE_LUGARDEOCURRENCIA.Clave  := 'LUOCU';
  fraAE_PROGRAMA.Clave           := 'PRSEG';
  fraAE_PROGRAMA.OnChange        := fraAE_PROGRAMAChange;
  fraTJ_SEXO.Clave               := 'SEXOS';
  fraAE_ZONA.Clave               := 'ZONA';
  fraAE_NATURALEZA.Clave         := 'NATUR';
  fraAE_FORMA.Clave              := 'FORMA';
  fraAE_PROGRAMAEMPRESA.Clave    := 'PRSEG';
  fraAE_PROGRAMAEMPRESA.OnChange := fraAE_PROGRAMAEMPRESAChange;
  fraAE_TIPOOBRA.Clave           := 'TOBRA';
  fraAE_ACTIVIDADOBRA.Clave      := 'AOBRA';
  fraAE_ETAPAOBRA.Clave          := 'EOBRA';
  fraAE_PROGRAMASEGURIDAD.Clave  := 'PSEGU';
  fraAE_TIPOMATRICULA.Clave      := 'TMATR';

  with fraAE_IDOPERATIVO do
  begin
    TableName   := 'POP_OPERATIVO';
    FieldID     := 'OP_ID';
    FieldCodigo := 'OP_CODIGO';
    FieldDesc   := 'OP_DESCRIPCION';
    ShowBajas   := False;
  end;

  with fraAE_IDOPERATIVOEMPRESA do
  begin
    TableName   := 'POP_OPERATIVO';
    FieldID     := 'OP_ID';
    FieldCodigo := 'OP_CODIGO';
    FieldDesc   := 'OP_DESCRIPCION';
    ShowBajas   := False;
  end;

  with fraAE_AGENTE do
  begin
    Clave          := 'AGENT';
    ExtraCondition := ' AND UTILES.ISNUMBER(TB_CODIGO)=0';  // la codificación nueva son los tb_Codigo no numéricos
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

  with fraAE_IDACTIVIDAD do
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

  with fraAE_IDART do
  begin
    TableName   := 'AAR_ART';
    FieldID     := 'AR_ID';
    FieldCodigo := 'AR_CODIGOSRT';
    FieldDesc   := 'AR_NOMBRE';
    FieldBaja   := 'AR_FECHABAJA';
    ShowBajas   := False;
  end;

  with fraPDC_DIAGNOSTICOCAUSA_ESTABL do
  begin
    TableName   := 'PDC_DIAGNOSTICOCAUSA';
    FieldID     := 'DC_ID';
    FieldCodigo := 'DC_NUMERO';
    FieldDesc   := 'DC_DESCRIPCION';
    FieldBaja   := 'DC_FECHABAJA';
    ShowBajas   := False
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

  Do_LimpiarDatosBusquedaDenunciaGrave;
  Do_DeshabilitarDatosSiniestro;
  Do_HabilitarDatosRelacionLaboral(False);
end;

procedure TfrmInfInvestigacionAccidentes.fraPreventorcmbDescripcionDropDown(Sender: TObject);
begin
  if (Trim(fraPreventor.cmbDescripcion.Text) <> '') and (Trim(fraPreventor.cmbDescripcion.Text)[1] <> '%') then
    fraPreventor.cmbDescripcion.Text := '%' + fraPreventor.cmbDescripcion.Text;
  fraPreventor.cmbDescripcionDropDown(Sender);
  if (Trim(fraPreventor.cmbDescripcion.Text) <> '') and (Trim(fraPreventor.cmbDescripcion.Text)[1] = '%') then
    fraPreventor.cmbDescripcion.Text := Copy(fraPreventor.cmbDescripcion.Text, 2, Length(fraPreventor.cmbDescripcion.Text));

  inherited;
end;

procedure TfrmInfInvestigacionAccidentes.ClearControls(ClearPK: Boolean);
begin
  inherited;

  if ClearPK then
    fraTrabajadorSinGraveBusq.Clear;

  FCuit := '';
  AEstablecimiento := 0;

  Do_LimpiarDatosBusquedaDenunciaGrave;
  Do_HabilitarDatosBusquedaDenunciaGrave(ClearPK and btnCancelar.Enabled);
  Do_LimpiarDatosSiniestro;
  Do_DeshabilitarDatosSiniestro;
  Do_HabilitarDatosRelacionLaboral(False);

  fraAE_PROGRAMA.Clear;
  fraAE_IDOPERATIVO.Clear;
  edAE_DOTACION.Clear;
  fraAE_ZONA.Clear;
  fraAE_NATURALEZA.Clear;
  fraAE_FORMA.Clear;
  fraAE_AGENTE.Clear;
  edAE_EMPRESA.Clear;
  mskAE_CUIT.Clear;
  fraAE_IDACTIVIDAD.Clear;
  fraDomicilioAccidenteEstabl.Clear;
  edCodAreaAccidenteEstabl.Clear;
  edAE_TELEFONOS.Clear;
  fraAE_IDART.Clear;
  fraAE_PROGRAMAEMPRESA.Clear;
  fraAE_IDOPERATIVOEMPRESA.Clear;
  rgAE_TIPOESTABLECIMIENTO.ItemIndex := -1;
  edAE_NROESTABLECIMIENTO.Clear;
  edAE_DOTACIONESTABLECIMIENTO.Clear;
  fraAE_LUGARDEOCURRENCIA.Clear;
  edAE_FRECEPCIONOBRA.Clear;
  edAE_FINICIOACTIVIDAD.Clear;
  edAE_SUPERFICIE.Clear;
  edAE_PLANTAS.Clear;
  fraAE_TIPOOBRA.Clear;
  fraAE_ACTIVIDADOBRA.Clear;
  fraAE_ETAPAOBRA.Clear;
  chkAE_PROGRAMAAPROBADO.Checked := False;
  fraAE_PROGRAMASEGURIDAD.Clear;
  edAE_FFINOBRA.Clear;
  edAE_FSUSPOBRA.Clear;
  edAE_FREINICIOOBRA.Clear;
  edAE_OBSERVACIONES.Clear;
  chkAE_TURNOROTATIVO.Checked := False;
  edAE_HORARIODESDE.Time := StrToTime('00:00:00');
  edAE_HORARIOHASTA.Time := StrToTime('00:00:00');
  chkAE_HORASEXTRAS.Checked := False;
  cbPRAM.Checked := false;
  edAE_TAREASHABITUALES.Clear;
  edAE_TAREASACCIDENTE.Clear;
  edAE_DESCRIPCIONACCIDENTE.Clear;
  edAE_HECHOSADICIONALES.Clear;
  edAE_OTROSDATOS.Clear;
  edAE_TITULO.Clear;
  fraAE_TIPOMATRICULA.Clear;
  edAE_NUMEROMATRICULA.Clear;
  edAE_INSTITUCIONOTORGANTE.Clear;
  edAE_FECHA.Clear;
  fraPreventor.Clear;

  SetIDACCIDENTEESTABLECIMIENTO(0);
  SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(0);

  sdqConsulta.Open;
end;

procedure TfrmInfInvestigacionAccidentes.LoadControls;
var
  sSql : String;
begin
  inherited;

  with sdqConsulta do
  begin
    SetIDACCIDENTEESTABLECIMIENTO(ValorSqlIntegerEx('SELECT AE_ID' +
                                                     ' FROM PAE_ACCIDENTEESTABLECIMIENTO' +
                                                    ' WHERE AE_NRODENUNCIASRT = :P1',
                                                    [fraTrabajadorSinGraveBusq.IdDenunciaSRT]));
    Open;

    Do_CargarDatosSiniestro(fraTrabajadorSinGraveBusq.edSiniestro.Siniestro, fraTrabajadorSinGraveBusq.edSiniestro.Orden,
                            fraTrabajadorSinGraveBusq.edSiniestro.Recaida, False, False);
    Do_HabilitarDatosBusquedaDenunciaGrave(False);

    edSiniestro.Siniestro := fraTrabajadorSinGraveBusq.edSiniestro.Siniestro;
    edSiniestro.Orden     := fraTrabajadorSinGraveBusq.edSiniestro.Orden;
    edSiniestro.Recaida   := fraTrabajadorSinGraveBusq.edSiniestro.Recaida;
    edNroDenunciaSRT.Text := fraTrabajadorSinGraveBusq.edDG_NRODENUNCIASRT.Text;

    fraAE_PROGRAMA.Codigo                    := FieldByName('AE_PROGRAMA').AsString;
    fraAE_IDOPERATIVO.Value                  := FieldByName('AE_IDOPERATIVO').AsInteger;
    edAE_DOTACION.Value                      := FieldByName('AE_DOTACION').AsInteger;
    fraAE_ZONA.Codigo                        := FieldByName('AE_ZONA').AsString;
    fraAE_NATURALEZA.Codigo                  := FieldByName('AE_NATURALEZA').AsString;
    fraAE_FORMA.Codigo                       := FieldByName('AE_FORMA').AsString;
    fraAE_AGENTE.Codigo                      := FieldByName('AE_AGENTE').AsString;
    edAE_EMPRESA.Text                        := FieldByName('AE_EMPRESA').AsString;
    mskAE_CUIT.Text                          := FieldByName('AE_CUIT').AsString;
    fraAE_IDACTIVIDAD.Value                  := FieldByName('AE_IDACTIVIDAD').AsInteger;
    fraDomicilioAccidenteEstabl.CodigoPostal := FieldByName('AE_CPOSTAL').AsString;
    fraDomicilioAccidenteEstabl.Calle        := FieldByName('AE_CALLE').AsString;
    fraDomicilioAccidenteEstabl.Localidad    := FieldByName('AE_LOCALIDAD').AsString;
    fraDomicilioAccidenteEstabl.Provincia    := FieldByName('PROVACCESTABL').AsString;
    fraDomicilioAccidenteEstabl.Numero       := IIF(FieldByName('AE_NUMERO').AsString <> '', FieldByName('AE_NUMERO').AsString, 'S/N');
    fraDomicilioAccidenteEstabl.Piso         := FieldByName('AE_PISO').AsString;
    fraDomicilioAccidenteEstabl.Departamento := FieldByName('AE_DEPARTAMENTO').AsString;
    fraDomicilioAccidenteEstabl.CPA          := FieldByName('AE_CPOSTALA').AsString;
    edAE_TELEFONOS.Text                      := FieldByName('AE_TELEFONOS').AsString;
    fraAE_IDART.Value                        := FieldByName('AE_IDART').AsInteger;
    fraAE_PROGRAMAEMPRESA.Codigo             := FieldByName('AE_PROGRAMAEMPRESA').AsString;
    fraAE_IDOPERATIVOEMPRESA.Value           := FieldByName('AE_IDOPERATIVOEMPRESA').AsInteger;
    rgAE_TIPOESTABLECIMIENTO.ItemIndex       := StrToInt(Decode(FieldByName('AE_TIPOESTABLECIMIENTO').AsString, ['E', 'O', ''], ['0', '1', '0']));
    edAE_NROESTABLECIMIENTO.Text             := Get_StringNullValueNumber(FieldByName('AE_NROESTABLECIMIENTO').AsInteger);
    edAE_DOTACIONESTABLECIMIENTO.Value       := FieldByName('AE_DOTACIONESTABLECIMIENTO').AsInteger;
    fraAE_LUGARDEOCURRENCIA.Codigo           := FieldByName('AE_LUGARDEOCURRENCIA').AsString;
    edAE_FRECEPCIONOBRA.Date                 := FieldByName('AE_FRECEPCIONOBRA').AsDateTime;
    edAE_FINICIOACTIVIDAD.Date               := FieldByName('AE_FINICIOACTIVIDAD').AsDateTime;
    edAE_SUPERFICIE.Text                     := Get_StringNullValueNumber(FieldByName('AE_SUPERFICIE').AsFloat);
    edAE_PLANTAS.Text                        := Get_StringNullValueNumber(FieldByName('AE_PLANTAS').AsInteger);
    fraAE_TIPOOBRA.Codigo                    := FieldByName('AE_TIPOOBRA').AsString;
    fraAE_ACTIVIDADOBRA.Codigo               := FieldByName('AE_ACTIVIDADOBRA').AsString;
    fraAE_ETAPAOBRA.Codigo                   := FieldByName('AE_ETAPAOBRA').AsString;
    chkAE_PROGRAMAAPROBADO.Checked           := (FieldByName('AE_PROGRAMAAPROBADO').AsString = SQL_TRUE);
    fraAE_PROGRAMASEGURIDAD.Codigo           := FieldByName('AE_PROGRAMASEGURIDAD').AsString;
    edAE_FFINOBRA.Date                       := FieldByName('AE_FFINOBRA').AsDateTime;
    edAE_FSUSPOBRA.Date                      := FieldByName('AE_FSUSPOBRA').AsDateTime;
    edAE_FREINICIOOBRA.Date                  := FieldByName('AE_FREINICIOOBRA').AsDateTime;
    edAE_OBSERVACIONES.Text                  := FieldByName('AE_OBSERVACIONES').AsString;
    chkAE_TURNOROTATIVO.Checked              := (FieldByName('AE_TURNOROTATIVO').AsString = SQL_TRUE);
    edAE_HORARIODESDE.Time                   := EncodeTime( StrToInt(copy(FieldByName('AE_HORARIODESDE').AsString,1,2)),
                                                            StrToInt(copy(FieldByName('AE_HORARIODESDE').AsString,4,2)),0,0);
    edAE_HORARIOHASTA.Time                   := EncodeTime(StrToInt(copy(FieldByName('AE_HORARIOHASTA').AsString,1,2)),
                                                           StrToInt(copy(FieldByName('AE_HORARIOHASTA').AsString,4,2)),0,0);
    chkAE_HORASEXTRAS.Checked                := (FieldByName('AE_HORASEXTRAS').AsString = SQL_TRUE);
    cbPRAM.Checked                           := (FieldByName('AE_PRAM').AsString = SQL_TRUE);
    edAE_TAREASHABITUALES.Text               := FieldByName('AE_TAREASHABITUALES').AsString;
    edAE_TAREASACCIDENTE.Text                := FieldByName('AE_TAREASACCIDENTE').AsString;
    edAE_DESCRIPCIONACCIDENTE.Text           := FieldByName('AE_DESCRIPCIONACCIDENTE').AsString;
    edAE_HECHOSADICIONALES.Text              := FieldByName('AE_HECHOSADICIONALES').AsString;
    edAE_OTROSDATOS.Text                     := FieldByName('AE_OTROSDATOS').AsString;
    edAE_RESPONSABLE.Text                    := FieldByName('AE_RESPONSABLE').AsString;
    edAE_TITULO.Text                         := FieldByName('AE_TITULO').AsString;
    fraAE_TIPOMATRICULA.Codigo               := FieldByName('AE_TIPOMATRICULA').AsString;
    edAE_NUMEROMATRICULA.Text                := FieldByName('AE_NUMEROMATRICULA').AsString;
    edAE_INSTITUCIONOTORGANTE.Text           := FieldByName('AE_INSTITUCIONOTORGANTE').AsString;
    edAE_FECHA.Date                          := FieldByName('AE_FECHA').AsDateTime;

    fraPreventor.Value                       := FieldByName('AE_IDIT').AsInteger
  end;
  if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE GA_IDESTADO in (4,5) '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro) +
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
    InfoHint(ScrollBox, 'Esta Investigación de Accidente esta asignada como No Investigar o Cerrado.');
  if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE GA_IDESTABLECIMIENTO is not null and GA_IDESTABLECIMIENTO <> 0 '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
  begin
    edAE_NROESTABLECIMIENTO.Text := ValorSql(
        ' SELECT es_nroestableci '+
        '   FROM hys.hga_gestionaccidente, aes_establecimiento, sex_expedientes '+
        '  WHERE es_id = GA_IDESTABLECIMIENTO '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden));
    vclExtra.LockControl(edAE_NROESTABLECIMIENTO,True);
  end
  else
    vclExtra.LockControl(edAE_NROESTABLECIMIENTO,False);
  if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND ga_idpreventor IS NOT NULL '+
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
  begin
    fraPreventor.Value := ValorSqlInteger(
        ' SELECT ga_idpreventor '+
        '   FROM hys.hga_gestionaccidente,SEX_EXPEDIENTES  '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden));
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
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
  begin
    sSql :=
      ' SELECT ga_calle, ga_numero, ga_piso, ga_departamento, ga_cpostal, ga_cpostala, '+
      '        ga_localidad, ga_provincia '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE ex_id = ga_idexpediente AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro) +
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden);

    with GetQuery(sSql) do
    try
      fraDomicilioAccidenteEstabl.Calle        := FieldByName('ga_calle').AsString;
      if FieldByName('ga_numero').AsString = 'S/N' then
        fraDomicilioAccidenteEstabl.Numero       := '0'
      else
        fraDomicilioAccidenteEstabl.Numero       := FieldByName('ga_numero').AsString;
      fraDomicilioAccidenteEstabl.Piso         := FieldByName('ga_piso').AsString;
      fraDomicilioAccidenteEstabl.Departamento := FieldByName('ga_departamento').AsString;
      fraDomicilioAccidenteEstabl.CodigoPostal := FieldByName('ga_cpostal').AsString;
      fraDomicilioAccidenteEstabl.CPA          := FieldByName('ga_cpostala').AsString;
      fraDomicilioAccidenteEstabl.Localidad    := FieldByName('ga_localidad').AsString;
      fraDomicilioAccidenteEstabl.Prov         := FieldByName('ga_provincia').AsInteger;
      fraDomicilioAccidenteEstabl.Provincia    := ValorSql('SELECT pv_descripcion '+
            '  FROM art.cpv_provincias '+
            ' WHERE pv_codigo = '+SqlValue(FieldByName('ga_provincia').AsInteger));
    finally
      Free;
    end;

    fraDomicilioAccidenteEstabl.Locked := False;
    vclExtra.LockControl(fraDomicilioAccidenteEstabl,True);
  end
  else
    vclExtra.LockControl(fraDomicilioAccidenteEstabl,False);
  if ExisteSql(
    ' SELECT 1 '+
    '   FROM hys.hga_gestionaccidente, sex_expedientes '+
    '  WHERE ex_id = ga_idexpediente AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro) +
    '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
  begin
    vclExtra.LockControl(cbPRAM,true);
    cbPRAM.Checked := ValorSql(
      ' SELECT ''S'' '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE ex_id = ga_idexpediente AND ga_pram = ''S'' '+
      '    AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro) +
      '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) = 'S';
  end
  else
    vclExtra.LockControl(cbPRAM,false);

  pcDatosChange(nil);
end;

function TfrmInfInvestigacionAccidentes.Validar: Boolean;
var
  dHoy: TDateTime;
  sSql: String;
begin
  Result := False;

  dHoy := DBDate;

  sSql :=
    'SELECT 1' +
     ' FROM PAE_ACCIDENTEESTABLECIMIENTO' +
    ' WHERE AE_NRODENUNCIASRT = ' + SqlValue(edNroDenunciaSRT.Text);

  if IsEmptyString(edNroDenunciaSRT.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edNroDenunciaSRT, 'Debe ingresar el nro. de denuncia SRT.')
  end

  else if (ModoABM = maAlta) and ExisteSql(sSql) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edNroDenunciaSRT, 'El nro. de denuncia SRT ya existe.')
  end

  else if (cmbTJ_FNACIMIENTO.IsEmpty) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(cmbTJ_FNACIMIENTO, 'La fecha de nacimiento es obligatoria.')
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

(*Lo saco, no se envia a la srt Preguntas a Mazzei PMarrone
1  else if ValorSql('SELECT NVL(RL_SECTOR, '''') FROM CRL_RELACIONLABORAL WHERE RL_ID = ' + SqlValue(pIdRelacionLaboral) , '') = '' Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraTrabajador.mskCUIL , 'El sector del trabajador es obligatorio, para cambiarlo presione el botón de mantenimiento de trabajadores.')
    end
*)

(*
  else if ValorSql('SELECT NVL(RL_CATEGORIA, '''') FROM CRL_RELACIONLABORAL WHERE RL_ID = ' + SqlValue(pIdRelacionLaboral) , '') = '' Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraTrabajador.mskCUIL , 'La categoría del trabajador es obligatoria, para cambiarlo presione el botón de mantenimiento de trabajadores.')
    end

  else if ValorSql('SELECT NVL(RL_SUELDO, '''') FROM CRL_RELACIONLABORAL WHERE RL_ID = ' + SqlValue(pIdRelacionLaboral) , '') = '' Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraTrabajador.mskCUIL , 'El sueldo del trabajador es obligatorio, para cambiarlo presione el botón de mantenimiento de trabajadores.')
    end
*)
(*
  else if ValorSql('SELECT NVL(RL_ULTIMANOMINA, '''') FROM CRL_RELACIONLABORAL WHERE RL_ID = ' + SqlValue(pIdRelacionLaboral) , '') = '' Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraTrabajador.mskCUIL , 'La última nómina del trabajador es obligatoria, para cambiarlo presione el botón de mantenimiento de trabajadores.')
    end
*)
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

(*
  else if IsEmptyString(fraDomicilioEmpresa.edCPA.Text) Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraDomicilioEmpresa.edCPA, 'El código postal argentino es obligatorio.')
    end
*)

  else if fraAE_PROGRAMA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_PROGRAMA.edCodigo, 'El programa es obligatorio.')
  end
  else if AreIn(fraAE_PROGRAMA.Codigo, ['A', 'T', 'P']) and fraAE_IDOPERATIVO.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_IDOPERATIVO.edCodigo, 'El operativo es obligatorio cuando la empresa es Agro o Testigo o PYME.')
  end

  else if fraCO_IDACTIVIDAD.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraCO_IDACTIVIDAD, 'El CIIU es obligatorio.')
  end

  else if edAE_DOTACION.Value <= 0 then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_DOTACION, 'La dotación debe ser mayor a 0 empleados.')
  end

  else if fraAE_ZONA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_ZONA.edCodigo, 'La zona es obligatoria.')
  end

  else if fraAE_NATURALEZA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_NATURALEZA.edCodigo, 'La naturaleza es obligatoria.')
  end

  else if fraAE_FORMA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_FORMA.edCodigo, 'La forma es obligatoria.')
  end

  else if fraAE_AGENTE.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_AGENTE.edCodigo, 'El agente es obligatorio.')
  end

  else if IsEmptyString(edAE_EMPRESA.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_EMPRESA, 'La razón social es obligatoria.')
  end

  else if IsEmptyString(mskAE_CUIT.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(mskAE_CUIT, 'El CUIT es obligatorio.')
  end

  else if not IsCuit(mskAE_CUIT.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(mskAE_CUIT, 'El CUIT ingresado no es válido.')
  end

  else if fraAE_IDACTIVIDAD.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_IDACTIVIDAD.edCodigo, 'La actividad es obligatoria.')
  end

  else if not fraDomicilioAccidenteEstabl.IsValid then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    Abort
  end

  else if not IsNumber(fraDomicilioAccidenteEstabl.Numero) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraDomicilioAccidenteEstabl, 'El número del domicilio del lugar donde ha ocurrido el accidente debe ser un dato numérico. Cero(0) o un número válido.')
  end

  else if IsEmptyString(fraDomicilioAccidenteEstabl.CPA) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraDomicilioAccidenteEstabl, 'El código postal argentino es obligatorio.')
  end

  else if not ExisteSql('SELECT 1' +
                         ' FROM CPA_CODIGOSPOSTALES' +
                        ' WHERE PA_CPA = ' + SqlValue(fraDomicilioAccidenteEstabl.CPA)) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraDomicilioAccidenteEstabl, 'El código postal argentino no existe.')
  end

  else if IsEmptyString(edAE_TELEFONOS.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_TELEFONOS, 'El teléfono es obligatorio.')
  end

  else if fraAE_IDART.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_IDART.edCodigo, 'La ART del lugar donde ha ocurrido el accidente es un dato obligatorio.')
  end

  else if fraAE_PROGRAMAEMPRESA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_PROGRAMAEMPRESA.cmbDescripcion, 'El programa de la empresa en un dato obligatorio.')
  end

{
  else if fraAE_PROGRAMAEMPRESA.IsEmpty Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraAE_PROGRAMAEMPRESA.edCodigo, 'El programa es obligatorio.')
    end
}
  else if not fraAE_PROGRAMAEMPRESA.IsEmpty and AreIn(fraAE_PROGRAMAEMPRESA.Codigo, ['A', 'T', 'P']) and fraAE_IDOPERATIVOEMPRESA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_IDOPERATIVOEMPRESA.edCodigo, 'El operativo es obligatorio cuando la empresa es Agro o Testigo o PYME.')
  end

  else if rgAE_TIPOESTABLECIMIENTO.ItemIndex = -1 then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(rgAE_TIPOESTABLECIMIENTO, 'El tipo de establecimiento es obligatorio.')
  end

  else if not fraAE_PROGRAMAEMPRESA.IsEmpty and (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 0) and edAE_NROESTABLECIMIENTO.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_NROESTABLECIMIENTO, 'El número de establecimiento es obligatorio cuando se especifica el programa.')
  end

  else if not edAE_NROESTABLECIMIENTO.IsEmpty and not Is_EstablecimInvestigAccValido(fraEmpresa.CUIT, edAE_NROESTABLECIMIENTO.Value) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_NROESTABLECIMIENTO, 'El número de establecimiento es incorrecto.')
  end

  else if edAE_DOTACIONESTABLECIMIENTO.Value <= 0 then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_DOTACIONESTABLECIMIENTO, 'La dotación debe ser mayor a 0 empleados.')
  end

  else if fraAE_LUGARDEOCURRENCIA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_LUGARDEOCURRENCIA.edCodigo, 'El lugar de ocurrencia es obligatorio.')
  end

  else if not edAE_FRECEPCIONOBRA.IsEmpty and (edAE_FRECEPCIONOBRA.Date > dHoy) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_FRECEPCIONOBRA, 'La fecha de recepción de la obra tiene que ser menor o igual a hoy.')
  end

  else if not edAE_FINICIOACTIVIDAD.IsEmpty and (edAE_FINICIOACTIVIDAD.Date > dHoy) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_FINICIOACTIVIDAD, 'La fecha de inicio de la actividad tiene que ser menor o igual a hoy.')
  end

  else if (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 1) and fraAE_ETAPAOBRA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_ETAPAOBRA.edCodigo, 'Si es una obra, la etapa de la misma es obligatoria.')
  end

  else if (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 1) and fraAE_PROGRAMASEGURIDAD.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_PROGRAMASEGURIDAD.edCodigo, 'Si es una obra, el programa de seguridad es obligatorio.')
  end

  else if (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 1) and (fraAE_PROGRAMA.Value <> 'O') and
          (fraAE_PROGRAMA.Value <> 'T') and (fraAE_PROGRAMA.Value <> 'P') then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_PROGRAMA, 'Si es una obra, el programa debe ser construcción.')
  end

  else if (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 1) and (fraAE_PROGRAMAEMPRESA.Value <> 'O') then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_PROGRAMAEMPRESA, 'Si es una obra, el programa debe ser construcción.')
  end

  else if (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 1) and ((not Is_FechaValida(edAE_FFINOBRA.Text)) or (edAE_FFINOBRA.Date = 0)) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_FFINOBRA, 'Si es una obra, la fecha de finalización de la misma es obligatoria.')
  end

  else if TimeToStr(edAE_HORARIODESDE.Time) = '0:00:00' then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_HORARIODESDE, 'El horario desde es obligatorio.')
  end

  else if TimeToStr(edAE_HORARIOHASTA.Time) = '0:00:00' then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_HORARIOHASTA, 'El horario hasta es obligatorio.')
  end

  else if IsEmptyString(edAE_TAREASHABITUALES.Lines.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_TAREASHABITUALES, 'El campo tareas habituales es obligatorio.')
  end

  else if IsEmptyString(edAE_TAREASACCIDENTE.Lines.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_TAREASACCIDENTE, 'El campo tareas al momento del accidente es obligatorio.')
  end

  else if IsEmptyString(edAE_DESCRIPCIONACCIDENTE.Lines.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_DESCRIPCIONACCIDENTE, 'La descripción del accidente es obligatoria.')
  end

  else if IsEmptyString(edAE_HECHOSADICIONALES.Lines.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_HECHOSADICIONALES, 'Los hechos necesarios para que ocurriera el accidente son obligatorios.')
  end

  else if IsEmptyString(fraPreventor.ID) and IsEmptyString(edAE_RESPONSABLE.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraPreventor, 'El preventor es obligatorio.')
  end

  else if IsEmptyString(edAE_TITULO.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_TITULO, 'El título es obligatorio.')
  end

  else if fraAE_TIPOMATRICULA.IsEmpty Then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(fraAE_TIPOMATRICULA.edCodigo, 'El tipo de matrícula es obligatorio.')
  end

  else if IsEmptyString(edAE_NUMEROMATRICULA.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_NUMEROMATRICULA, 'El número de matrícula es obligatorio.')
  end

  else if IsEmptyString(edAE_INSTITUCIONOTORGANTE.Text) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_INSTITUCIONOTORGANTE, 'La institución otorgante es obligatoria.')
  end

  else if edAE_FECHA.IsEmpty then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_FECHA, 'La fecha de investigación es obligatoria.')
  end

  else if edAE_FECHA.Date > dHoy then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_FECHA, 'La fecha de investigación tiene que ser menor o igual a hoy.')
  end

  else if edAE_FECHA.Date < edEX_FECHAACCIDENTE.Date then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edAE_FECHA, 'La fecha de investigación tiene que ser mayor o igual a la fecha de accidente.')
  end

  else if (ValorSQL('SELECT COUNT(*)' +
                     ' FROM HYS.PDC_DIAGNOSTICOCAUSA' +
                    ' WHERE NOT EXISTS (SELECT 1' +
                                        ' FROM HYS.PCM_CAUSAYMEDIDA' +
                                       ' WHERE DC_ID = CM_IDDIAGNOSTICOCAUSA)' +
                      ' AND DC_FECHABAJA IS NULL' +
                      ' AND DC_IDACCIDENTEESTABLECIMIENTO = ' + SqlValue(sdqConsulta.FieldByName('AE_ID').AsInteger), '0') <> '0') then
  begin
    pcDatos.ActivePageIndex := PAGE_CAUSASMEDIDASSEGUIM;
    pcCausasMedidasSeguim.ActivePageIndex := PAGE_CAUSAS;
    InvalidMsg(dbgPDC_DIAGNOSTICOCAUSA, 'Existen causas sin medidas correctivas asociadas.');
  end

  else if (ValorSQL('SELECT COUNT(*)' +
                     ' FROM HYS.PMC_MEDIDACORRECTIVA' +
                    ' WHERE NOT EXISTS (SELECT 1' +
                                        ' FROM HYS.PCM_CAUSAYMEDIDA' +
                                       ' WHERE MC_ID = CM_IDMEDIDACORRECTIVA)' +
                      ' AND MC_FECHABAJA IS NULL' +
                      ' AND MC_IDACCIDENTEESTABLECIMIENTO = ' + SqlValue(sdqConsulta.FieldByName('AE_ID').AsInteger), '0') <> '0') then
  begin
    pcDatos.ActivePageIndex := PAGE_CAUSASMEDIDASSEGUIM;
    pcCausasMedidasSeguim.ActivePageIndex := PAGE_MEDIDASCORRECTIVAS;
    InvalidMsg(dbgPDC_DIAGNOSTICOCAUSA, 'Existen medidas correctivas sin causas asociadas.');
    end
  else
  begin
    if pbEsMortal and not cbPRAM.Checked then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InfoHint(ScrollBox,'El siniestro debería ser seleccionado como PRAM (Programa de Reducción de Accidentes Mortales)');
    end;
    Result := True;
  end;
  Verificar(Trim(fraDomicilioAccidenteEstabl.CodigoPostal) = '',fraDomicilioAccidenteEstabl,'Debe existir el Código Postal.');

end;

procedure TfrmInfInvestigacionAccidentes.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuInfInvestigacionAccidentes.Enabled := True;
  if (btnAceptar.Enabled) and (btnAceptar.Visible)
     and (MsgBox('Se perderan todos los datos que no hayan sido guardados ¿Desea Guardar?',  MB_ICONQUESTION + MB_YESNO, 'Guardar Datos') = IDYES) then
  begin
    btnAceptarClick(nil);
  end
  else
    Rollback(true);
  inherited;
end;

{procedure TfrmInfInvestigacionAccidentes.SetId(APrefijo: string; ADataSet: TDataSet);
var
  AField: TField;
  sPrefijo, sSecuencia: String;
begin
  if not ADataSet.IsEmpty then
    with TDataCycler.Create(ADataSet) do
      try
        sPrefijo   := Copy(APrefijo, 2, 2);
        sSecuencia := 'HYS.SEQ_' + APrefijo + '_ID';
        repeat
          AField := ADataSet.FieldByName(sPrefijo + '_IDACCIDENTEESTABLECIMIENTO');
          if AField.IsNull Then
          begin
            ADataSet.Edit;
            AField.AsInteger := sdqConsulta.FieldByName('AE_ID').AsInteger;
            ADataSet.FieldByName(sPrefijo + '_ID').AsInteger := GetSecNextVal(sSecuencia);
            ADataSet.Post;
          end;
        until not Cycle;
      finally
        Free;
      end;
end;}

function TfrmInfInvestigacionAccidentes.DoABM: Boolean;
var
  pAE_ID: TTableId;
  idExpediente : Integer;
begin
  BeginTrans(true);
  try
    with sdqConsulta do
    begin
      if ModoABM = maAlta Then
      begin
        Insert;
        FieldByName('AE_ID').AsInteger := GetSecNextVal('HYS.SEQ_PAE_ID');
      end
      else
        Edit;

      FieldByName('AE_NRODENUNCIASRT').AsString           := edNroDenunciaSRT.Text;
      FieldByName('AE_PROGRAMA').AsString                 := fraAE_PROGRAMA.Codigo;
      FieldByName('AE_IDOPERATIVO').Value                 := Get_NullValueId(fraAE_IDOPERATIVO.Value);
      FieldByName('AE_DOTACION').AsInteger                := edAE_DOTACION.Value;
      FieldByName('AE_ZONA').AsString                     := fraAE_ZONA.Codigo;
      FieldByName('AE_NATURALEZA').AsString               := fraAE_NATURALEZA.Codigo;
      FieldByName('AE_FORMA').AsString                    := fraAE_FORMA.Codigo;
      FieldByName('AE_AGENTE').AsString                   := fraAE_AGENTE.Codigo;
      FieldByName('AE_EMPRESA').AsString                  := Trim(edAE_EMPRESA.Text);
      FieldByName('AE_CUIT').AsString                     := mskAE_CUIT.Text;
      FieldByName('AE_IDACTIVIDAD').AsInteger             := fraAE_IDACTIVIDAD.Value;
      FieldByName('AE_CPOSTAL').AsString                  := fraDomicilioAccidenteEstabl.CodigoPostal;
      FieldByName('AE_CALLE').AsString                    := fraDomicilioAccidenteEstabl.Calle;
      FieldByName('AE_LOCALIDAD').AsString                := fraDomicilioAccidenteEstabl.Localidad;
      FieldByName('AE_PROVINCIA').AsString                := Get_CodigoProvincia(fraDomicilioAccidenteEstabl.Provincia);
      FieldByName('AE_NUMERO').AsString                   := fraDomicilioAccidenteEstabl.Numero;
      FieldByName('AE_PISO').AsString                     := fraDomicilioAccidenteEstabl.Piso;
      FieldByName('AE_DEPARTAMENTO').AsString             := fraDomicilioAccidenteEstabl.Departamento;
      FieldByName('AE_CPOSTALA').AsString                 := fraDomicilioAccidenteEstabl.CPA;
      FieldByName('AE_TELEFONOS').AsString                := Trim(edCodAreaAccidenteEstabl.Text + ' ' + edAE_TELEFONOS.Text);
      FieldByName('AE_IDART').Value                       := Get_NullValueId(fraAE_IDART.Value);
      FieldByName('AE_PROGRAMAEMPRESA').AsString          := fraAE_PROGRAMAEMPRESA.Codigo;
      FieldByName('AE_IDOPERATIVOEMPRESA').Value          := Get_NullValueId(fraAE_IDOPERATIVOEMPRESA.Value);
      FieldByName('AE_TIPOESTABLECIMIENTO').AsString      := Decode(IntToStr(rgAE_TIPOESTABLECIMIENTO.ItemIndex), ['0', '1'], ['E', 'O']);
      FieldByName('AE_NROESTABLECIMIENTO').Value          := Get_NullValueId(edAE_NROESTABLECIMIENTO.Value);
      FieldByName('AE_DOTACIONESTABLECIMIENTO').AsInteger := edAE_DOTACIONESTABLECIMIENTO.Value;
      FieldByName('AE_LUGARDEOCURRENCIA').AsString        := fraAE_LUGARDEOCURRENCIA.Codigo;
      FieldByName('AE_FRECEPCIONOBRA').Value              := Get_NullValueDate(edAE_FRECEPCIONOBRA.Date);
      FieldByName('AE_FINICIOACTIVIDAD').Value            := Get_NullValueDate(edAE_FINICIOACTIVIDAD.Date);
      FieldByName('AE_SUPERFICIE').Value                  := Get_NullValueNumber(edAE_SUPERFICIE.Value);
      FieldByName('AE_PLANTAS').Value                     := Get_NullValueNumber(edAE_PLANTAS.Value);
      FieldByName('AE_TIPOOBRA').AsString                 := fraAE_TIPOOBRA.Codigo;
      FieldByName('AE_ACTIVIDADOBRA').AsString            := fraAE_ACTIVIDADOBRA.Codigo;
      FieldByName('AE_ETAPAOBRA').AsString                := fraAE_ETAPAOBRA.Codigo;
      FieldByName('AE_PROGRAMAAPROBADO').AsString         := SqlBoolean(chkAE_PROGRAMAAPROBADO.Checked, False);
      FieldByName('AE_PROGRAMASEGURIDAD').AsString        := fraAE_PROGRAMASEGURIDAD.Codigo;
      FieldByName('AE_FFINOBRA').Value                    := Get_NullValueDate(edAE_FFINOBRA.Date);
      FieldByName('AE_FSUSPOBRA').Value                   := Get_NullValueDate(edAE_FSUSPOBRA.Date);
      FieldByName('AE_FREINICIOOBRA').Value               := Get_NullValueDate(edAE_FREINICIOOBRA.Date);
      FieldByName('AE_OBSERVACIONES').AsString            := edAE_OBSERVACIONES.Text;
      FieldByName('AE_TURNOROTATIVO').AsString            := SqlBoolean(chkAE_TURNOROTATIVO.Checked, False);
      FieldByName('AE_HORARIODESDE').AsString             := FormatDateTime('hh:nn',edAE_HORARIODESDE.Time );
      FieldByName('AE_HORARIOHASTA').AsString             := FormatDateTime('hh:nn',edAE_HORARIOHASTA.Time );
      FieldByName('AE_HORASEXTRAS').AsString              := SqlBoolean(chkAE_HORASEXTRAS.Checked, False);
      FieldByName('AE_PRAM').AsString                     := SqlBoolean(cbPRAM.Checked, False);
      FieldByName('AE_TAREASHABITUALES').AsString         := edAE_TAREASHABITUALES.Text;
      FieldByName('AE_TAREASACCIDENTE').AsString          := edAE_TAREASACCIDENTE.Text;
      FieldByName('AE_DESCRIPCIONACCIDENTE').AsString     := edAE_DESCRIPCIONACCIDENTE.Text;
      FieldByName('AE_HECHOSADICIONALES').AsString        := edAE_HECHOSADICIONALES.Text;
      FieldByName('AE_OTROSDATOS').AsString               := edAE_OTROSDATOS.Text;
//      FieldByName('AE_RESPONSABLE').AsString              := edAE_RESPONSABLE.Text;
      FieldByName('AE_TITULO').AsString                   := edAE_TITULO.Text;
      FieldByName('AE_TIPOMATRICULA').AsString            := fraAE_TIPOMATRICULA.Codigo;
      FieldByName('AE_NUMEROMATRICULA').AsString          := edAE_NUMEROMATRICULA.Text;
      FieldByName('AE_INSTITUCIONOTORGANTE').AsString     := edAE_INSTITUCIONOTORGANTE.Text;
      FieldByName('AE_FECHA').AsDateTime                  := edAE_FECHA.Date;
      FieldByName('USUARIO').AsString                     := frmPrincipal.DBLogin.UserID;
      FieldByName('AE_IDIT').AsString                     := fraPreventor.ID;

      idExpediente := ValorSqlInteger(
          ' SELECT ex_id '+
          '   FROM art.sex_expedientes '+
          '  WHERE ex_siniestro = '+SqlValue(edSiniestro.FSiniestro.Text)+
          '    AND ex_orden = '+SqlValue(edSiniestro.FOrden.Text)+
          '    AND ex_recaida = nvl('+SqlInt(edSiniestro.FRecaida.Text)+',0)');
      FieldByName('AE_IDEXPEDIENTE').AsInteger             := idExpediente;

      Post;
      ApplyUpdates;
      //CommitUpdates;

      pAE_ID := sdqConsulta.FieldByName('AE_ID').AsInteger;
      SetID(sdqPAM_ACCIDENTEMULTIPLE, pAE_ID);

      if ModoABM = maAlta then
      begin
        Do_InsertarAccidentesMultiples(pAE_ID, edSiniestro.Siniestro, edSiniestro.Orden);
        SetID(sdqPAM_ACCIDENTEMULTIPLE, pAE_ID);
        sdqPAM_ACCIDENTEMULTIPLE.Open;
        SetIDACCIDENTEESTABLECIMIENTO(pAE_ID);
        sdqConsulta.Open;
      end;

      sdqPAM_ACCIDENTEMULTIPLE.Open;

      if not edRL_TAREA.ReadOnly then   // los campos de la relación laboral están habilitados para la carga porque se trata de un mortal
        Do_GuardarDatosHistoricoLaboral( fraTrabajador.Value, fraEmpresa.edContrato.Value, edRL_TAREA.Text, fraRL_CIUO.Codigo, cmbRL_FECHAINGRESO.Date, fraRL_IDMODALIDADCONTRATACION.Value );

      if ModoABM <> maAlta then
      begin
        with sdqPAM_ACCIDENTEMULTIPLE do
        begin
          DisableControls;
          First;
          try
            while not Eof do
            begin
              if FieldByName('AM_DETALLELESION').AsString = '' then
              begin
                pcDatos.ActivePageIndex := PAGE_ACCIDENTESMULTIPLES;
                InfoHint(dbgPAM_ACCIDENTEMULTIPLE, 'Debe completar los detalles de lesión para todos y cada uno de los accidentados en este accidente múltiple, consulte los datos de Siniestros I.');
                Break;
              end;
              Next;
            end;
          finally
            EnableControls;
          end;

          if (not Eof) then
          begin
            Result := False;
//            sdqConsulta.CancelUpdates;
//            RollBack;
            Exit;
          end;
        end;
      end;
      //CommitTrans(True);
    end;

    try
      if ModoABM = maAlta Then
      begin
        fraTrabajadorSinGraveBusq.IdDenunciaSRT := edNroDenunciaSRT.Text;

        ModoABM := maModificacion;
        tbModificar.Enabled := True;
        tbModificarClick(nil);
        Selected := True;
        IrPrincipioPantalla;
      end
      else
      begin
        ModoABM := maNone;
        tbLimpiarClick(nil);
      end;

      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  except
    on E: Exception do
    begin
      sdqConsulta.CancelUpdates;
      //RollBack(true);
      Result := False;
      ErrorMsg(E, 'Error al guardar los datos.');
    end;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.SetID(ADataSet: TSDQuery; AId: TTableId);
begin
  ADataSet.Close;
  ADataSet.Params[0].AsInteger := AId;
end;

procedure TfrmInfInvestigacionAccidentes.SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(AId: TTableId);
begin
  SetID(sdqPCM_CAUSAYMEDIDA, AId);
  SetID(sdqPSV_SEGUIMIENTOVISITA, AId);
end;

procedure TfrmInfInvestigacionAccidentes.SetIDACCIDENTEESTABLECIMIENTO(AId: TTableId);
begin
  SetID(sdqConsulta, AId);
  SetID(sdqPPE_PERSONAENTREVISTADA, AId);
  SetID(sdqPDC_DIAGNOSTICOCAUSA, AId);
  SetID(sdqPMC_MEDIDACORRECTIVA, AId);
  SetID(sdqPAM_ACCIDENTEMULTIPLE, AId);
end;

procedure TfrmInfInvestigacionAccidentes.btPPEAceptarClick(Sender: TObject);
var
  pAE_ID: TTableId;
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

  else if not mskPE_CUIL.ReadOnly and PkViolated(sdqPPE_PERSONAENTREVISTADA, ['PE_CUIL'], [mskPE_CUIL.Text]) then
    InvalidMsg(mskPE_CUIL, 'Ya se ha cargado un entrevistado con el mismo CUIL.')

  else if PkViolated(sdqPPE_PERSONAENTREVISTADA, ['PE_NOMBRE'], [edPE_NOMBRE.Text]) then
    InvalidMsg(edPE_NOMBRE, 'Ya se ha cargado un entrevistado con el mismo Nombre.')

  else if edPE_FECHA_ENTREVISTA.Date = 0 then
    InvalidMsg(edPE_FECHA_ENTREVISTA, 'Debe ingresar la fecha de la entrevista.')

  else if edPE_FECHA_ENTREVISTA.Date < edAE_FECHA.Date then
    InvalidMsg(edPE_FECHA_ENTREVISTA, 'La fecha de la entrevista no puede ser anterior a la de la investigacion.')

  else if edPE_TIPO_ENTREVISTA.ItemIndex = -1 then
    InvalidMsg(edPE_TIPO_ENTREVISTA, 'Debe seleccionar un tipo de entrevista.')

  else
    with sdqPPE_PERSONAENTREVISTADA do
    begin
//Pablo        BeginTrans;
      try
        pAE_ID := sdqConsulta.FieldByName('AE_ID').AsInteger;

        if ModoABMTablas = maAlta then
        begin
          Insert;

          FieldByName('PE_ID').AsInteger                         := GetSecNextVal('HYS.SEQ_PPE_ID');
          FieldByName('PE_IDACCIDENTEESTABLECIMIENTO').AsInteger := pAE_ID;
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
//Pablo          CommitUpdates;
//Pablo          CommitTrans;

        SetID(sdqPPE_PERSONAENTREVISTADA, pAE_ID);
        sdqPPE_PERSONAENTREVISTADA.Open;

        fpPPE_PERSONAENTREVISTADA.ModalResult := mrOk;
      except
        on E: Exception do
        begin
          CancelUpdates;
//Pablo              RollBack;
          ErrorMsg(E, 'Error al guardar los datos');
        end;
      end;
    end;
end;

procedure TfrmInfInvestigacionAccidentes.tbPPENuevoClick(Sender: TObject);
begin
  if Is_AccidenteEstablId then
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

procedure TfrmInfInvestigacionAccidentes.tbPPEModificarClick(Sender: TObject);
begin
  if (not sdqPPE_PERSONAENTREVISTADA.IsEmpty) and (sdqPPE_PERSONAENTREVISTADA.FieldByName('PE_FECHABAJA').IsNull) then
    with sdqPPE_PERSONAENTREVISTADA do
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

procedure TfrmInfInvestigacionAccidentes.tbPPEEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPPE_PERSONAENTREVISTADA, 'PE');
end;

procedure TfrmInfInvestigacionAccidentes.DoDarDeBaja(ADataSet: TSDQuery; APrefijo: string; AAllowDelete: Boolean);
begin
  if (not ADataSet.IsEmpty) and ADataSet.FieldByName(APrefijo + '_FECHABAJA').IsNull and
      MsgAsk('¿ Desea dar de baja el registro seleccionado ?') then
  begin
    if AAllowDelete and ADataSet.FieldByName(APrefijo + '_FECHAEXPORT').IsNull then
    begin
//Pablo        BeginTrans;
      try
        ADataSet.Edit;
        ADataSet.FieldByName(APrefijo + '_USUBAJA').AsString     := frmPrincipal.DBLogin.UserID;
        ADataSet.FieldByName(APrefijo + '_FECHABAJA').AsDateTime := DBDate;
        ADataSet.Post;

        ADataSet.ApplyUpdates;
//Pablo          ADataSet.CommitUpdates;
//Pablo          CommitTrans;
      except
        on E: Exception do
        begin
          ADataSet.CancelUpdates;
//Pablo              RollBack;
          ErrorMsg(E, 'Error al dar de baja el registro.');
        end;
      end;
    end
    else
      MsgBox('El registro no se puede dar de baja ya que fue informado a la SRT.', MB_ICONERROR);
  end;
end;

function TfrmInfInvestigacionAccidentes.PkViolated(DataSet: TDataSet; FieldNames: Array of String;
                                                   FieldValues: Array of Variant): Boolean;
begin
  Result := (ModoABMTablas = maAlta) and (CountRecords(DataSet, FieldNames, FieldValues, 1) > 0);
end;

procedure TfrmInfInvestigacionAccidentes.pcDatosChange(Sender: TObject);
begin
  case pcDatos.ActivePageIndex of
    PAGE_PERSONASENTREVISTADAS: sdqPPE_PERSONAENTREVISTADA.Active := True;
    PAGE_CAUSASMEDIDASSEGUIM:   pcCausasMedidasSeguimChange(nil);
    PAGE_ACCIDENTESMULTIPLES:   sdqPAM_ACCIDENTEMULTIPLE.Active := True;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.tbModificarClick(Sender: TObject);
begin
  inherited;
//    BeginTrans(true);
  Do_DeshabilitarDatosSiniestro;
  Do_HabilitarDatosRelacionLaboral(pbEsMortal);
  Do_HabilitarDatosBusquedaDenunciaGrave(False);
  rgAE_TIPOESTABLECIMIENTOClick(nil);
  fraAE_PROGRAMAChange(nil);
  fraAE_PROGRAMAEMPRESAChange(nil);
  if ExisteSql(
      ' SELECT 1 '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE GA_IDESTABLECIMIENTO is not null and GA_IDESTABLECIMIENTO <> 0 '+
      '    AND ga_idexpediente = ex_id '+
      '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)+
      '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
    vclExtra.LockControl(edAE_NROESTABLECIMIENTO,True);
  if ExisteSql(
      ' SELECT 1 '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE ex_id = ga_idexpediente '+
      '    AND ga_idpreventor IS NOT NULL '+
      '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)+
      '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
  begin
    fraPreventor.Locked := False;
    vclExtra.LockControl(fraPreventor,True);
  end;
  if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND (ga_calle IS NOT NULL OR ga_cpostal IS NOT NULL OR (ga_provincia <> -1)) '+
        '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
  begin
    fraDomicilioAccidenteEstabl.Locked := False;
    vclExtra.LockControl(fraDomicilioAccidenteEstabl,True);
  end;
  if ExisteSql(
    ' SELECT 1 '+
    '   FROM hys.hga_gestionaccidente, sex_expedientes '+
    '  WHERE ex_id = ga_idexpediente AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro) +
    '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
  begin
    vclExtra.LockControl(cbPRAM,true);
    cbPRAM.Checked := ValorSql(
      ' SELECT ''S'' '+
      '   FROM hys.hga_gestionaccidente, sex_expedientes '+
      '  WHERE ex_id = ga_idexpediente AND ga_pram = ''S'' '+
      '    AND ex_siniestro = '+SqlValue(edSiniestro.Siniestro) +
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) = 'S';
  end
  else
    vclExtra.LockControl(cbPRAM,false);
  btnAplicar.Enabled := False;
end;

procedure TfrmInfInvestigacionAccidentes.btnTopClick(Sender: TObject);
begin
  edSiniestro.SetFocus;
end;

procedure TfrmInfInvestigacionAccidentes.sdqRelacionesAfterOpen(DataSet: TDataSet);
begin
  DataSet.Fields[0].Required := False;
  DataSet.Fields[1].Required := False;
end;

procedure TfrmInfInvestigacionAccidentes.tbPDCNuevoClick(Sender: TObject);
begin
  if Is_AccidenteEstablId then
  begin
    edDC_NUMERO.Clear;
    edDC_DESCRIPCION.Clear;
    cbNoDeterminada.Checked := False;

    ModoABMTablas := maAlta;

    fpPCD_DIAGNOSTICOCAUSA.ShowModal;
  end
  else
    MsgBox('Para poder continuar, debe confirmar los datos cargados previamente, haciendo clic en Aceptar.', MB_ICONERROR);
end;

procedure TfrmInfInvestigacionAccidentes.tbPDCModificarClick(Sender: TObject);
begin
  if (not sdqPDC_DIAGNOSTICOCAUSA.IsEmpty) and (sdqPDC_DIAGNOSTICOCAUSA.FieldByName('DC_FECHABAJA').IsNull) then
    with sdqPDC_DIAGNOSTICOCAUSA do
    begin
      edDC_NUMERO.Value     := FieldByName('DC_NUMERO').AsInteger;
      edDC_DESCRIPCION.Text := FieldByName('DC_DESCRIPCION').AsString;
      cbNoDeterminada.Checked := FieldByName('DC_NODETERMINADA').AsString = 'S';

      ModoABMTablas := maModificacion;

      fpPCD_DIAGNOSTICOCAUSA.ShowModal;
    end;
end;

procedure TfrmInfInvestigacionAccidentes.tbPDCEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPDC_DIAGNOSTICOCAUSA, 'DC');
end;

function TfrmInfInvestigacionAccidentes.BusquedaValida(var iSiniestro, iOrden, iRecaida: Integer; NroDenunciaSRT: String): Boolean;
var
  bConDatos: Boolean;
  sSql: String;
  sSqlWhere: String;
begin
  sSql :=
    'SELECT DG_NRODENUNCIASRT, DG_SINIESTRO, DG_ORDEN, DG_RECAIDA' +
     ' FROM SDG_DENUNCIASGRAVES' +
    ' WHERE 1 = 1';

  if iSiniestro > 0 then
    sSqlWhere :=
      ' AND DG_SINIESTRO = ' + SqlValue(iSiniestro) +
      ' AND DG_ORDEN = ' + SqlValue(iOrden) +
      ' AND DG_RECAIDA = ' + SqlValue(iRecaida)
  else if NroDenunciaSRT <> '' then
    sSqlWhere := ' AND DG_NRODENUNCIASRT = ' + SqlValue(NroDenunciaSRT)
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
        edNroDenunciaSRT.Text := FieldByName('DG_NRODENUNCIASRT').AsString;

        if IsEmptyString(edNroDenunciaSRT.Text) then
          bConDatos := False
        else
        begin
          bConDatos := True;

          iSiniestro := FieldByName('DG_SINIESTRO').AsInteger;
          iOrden     := FieldByName('DG_ORDEN').AsInteger;
          iRecaida   := FieldByName('DG_RECAIDA').AsInteger;

          with edSiniestro do
          begin
            Siniestro := iSiniestro;
            Orden     := iOrden;
            Recaida   := iRecaida;
          end;
        end;
      end;
    finally
      Free;
    end;
  end;

  Result := bConDatos;
end;

procedure TfrmInfInvestigacionAccidentes.edSiniestroExit(Sender: TObject);
begin
  if not edSiniestro.ReadOnly and ((not FCargo) or edSiniestro.Modified) then
    Do_BuscarDatosDenunciaGrave(edSiniestro.Siniestro, edSiniestro.Orden, edSiniestro.Recaida, '');
end;

procedure TfrmInfInvestigacionAccidentes.edNroDenunciaSRTExit(Sender: TObject);
begin
  if not edNroDenunciaSRT.ReadOnly then //and not FCargo then
    Do_BuscarDatosDenunciaGrave(0, 1, 0, edNroDenunciaSRT.Text);
end;

procedure TfrmInfInvestigacionAccidentes.Do_BuscarDatosDenunciaGrave(iSiniestro, iOrden, iRecaida: Integer;
                                                                     NroDenunciaSRT: String);
begin
  NroDenunciaSRT := Trim(NroDenunciaSRT);

  if (iSiniestro > 0) or (NroDenunciaSRT <> '') then
    if BusquedaValida(iSiniestro, iOrden, iRecaida, NroDenunciaSRT) then
    begin
      if not FCargo then
        Do_CargarDatosSiniestro(iSiniestro, iOrden, iRecaida, True, False);
      FCargo := True;
      edSiniestro.Modified := False
    end
    else
    begin
      MsgBox('El siniestro no existe o no tiene cargada una denuncia grave.', MB_ICONERROR);
      Do_LimpiarDatosBusquedaDenunciaGrave;
      Do_LimpiarDatosSiniestro;

      edSiniestro.SetFocus;
    end;
end;

procedure TfrmInfInvestigacionAccidentes.Do_LimpiarDatosBusquedaDenunciaGrave;
begin
  edSiniestro.Clear;
  edNroDenunciaSRT.Clear;
  FCargo := false;

  IrPrincipioPantalla;
end;

procedure TfrmInfInvestigacionAccidentes.Do_HabilitarDatosBusquedaDenunciaGrave(Habilitar: Boolean);
begin
  VCLExtra.LockControl(edSiniestro, not Habilitar);
  VCLExtra.LockControl(edNroDenunciaSRT, not Habilitar);

  with edSiniestro do   // lo hice así porque no me está grisando el control al deshabilitarlo
  begin
    Color   := clWindow;
    TabStop := True;
  end;

  with edNroDenunciaSRT do
  begin
    Color   := clWindow;
    TabStop := True;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.Do_CargarDatosSiniestro(iSiniestro, iOrden, iRecaida: Integer;
                                                                 CargarValoresDefecto, CargarSoloDatosTrabajador: Boolean);
var
  sSql: String;
  sSqlHistorico: String;
begin
  sSql :=
    'SELECT TJ_ID, TJ_FNACIMIENTO, TJ_SEXO, TJ_IDNACIONALIDAD, TJ_CPOSTAL, TJ_OTRANACIONALIDAD, TJ_CALLE,' +
          ' TJ_LOCALIDAD, PRTRAB.PV_DESCRIPCION PROVTRAB, TJ_NUMERO, TJ_PISO, TJ_DEPARTAMENTO, TJ_CPOSTALA,' +
          ' TJ_CODAREATELEFONO, TJ_TELEFONO, RL_TAREA, RL_CIUO, RL_FECHAINGRESO, RL_IDMODALIDADCONTRATACION,' +
          ' CO_CONTRATO, CO_IDACTIVIDAD, DC_CPOSTAL, DC_CALLE, DC_LOCALIDAD, PREMPR.PV_DESCRIPCION PROVEMPR,' +
          ' DC_NUMERO, DC_PISO, DC_DEPARTAMENTO, DC_CPOSTALA, DC_CODAREATELEFONOS, DC_TELEFONOS,' +
          ' NOMINA.GET_EMPLEADOS(CO_CONTRATO, TO_CHAR(EX_FECHAACCIDENTE, ''YYYYMM'')) DOTACION, DG_ZONA ZONA,' +
          ' DG_NATURALEZA NATURALEZA, DG_FORMA FORMA,' +
          ' SRT_SSN.GET_SRTAGENTE(DG_SINIESTRO, DG_ORDEN, DG_RECAIDA, EX_TIPO) AGENTE, UB_NOMBRE EMPRESA,' +
          ' UB_CUITOCURRE CUIT, AFILIACION.GET_IDACTIVIDADEMPRESA(UB_CUITOCURRE) IDACTIVIDAD, UB_CPOSTAL CPOSTAL,' +
          ' UB_CALLE CALLE, UB_LOCALIDAD LOCALIDAD, PRACCESTABL.PV_DESCRIPCION DESCRPROVACCESTABL, UB_NUMERO NUMERO,' +
          ' UB_PISO PISO, UB_DEPARTAMENTO DEPARTAMENTO, UB_CPOSTALA CPOSTALA, UB_CODAREATELEFONOS CODAREATELEFONOS,' +
          ' UB_TELEFONOS TELEFONOS, UB_CODIGOESTABLECIMIENTO CODIGOESTABLECIMIENTO, EX_FECHAACCIDENTE,' +
          ' DECODE(EX_HORAACCIDENTE,''__:__'', NULL,EX_HORAACCIDENTE) EX_HORAACCIDENTE, EX_BREVEDESCRIPCION DESCRIPCIONACCIDENTE, RL_ID, EX_GRAVEDAD, TO_NUMBER(NULL) AS HL_ID' +
     ' FROM ADC_DOMICILIOCONTRATO, AEM_EMPRESA, ACO_CONTRATO, CRL_RELACIONLABORAL, CPV_PROVINCIAS PRACCESTABL,' +
          ' CPV_PROVINCIAS PREMPR, CPV_PROVINCIAS PRTRAB, CTJ_TRABAJADOR, SDG_DENUNCIASGRAVES, SUB_UBICACIONES,' +
          ' SEX_EXPEDIENTES' +
    ' WHERE EX_CUIL = TJ_CUIL' +
      ' AND TJ_PROVINCIA = PRTRAB.PV_CODIGO(+)' +
      ' AND DC_PROVINCIA = PREMPR.PV_CODIGO(+)' +
      ' AND UB_PROVINCIA = PRACCESTABL.PV_CODIGO(+)' +
      ' AND TJ_ID = RL_IDTRABAJADOR(+)' +
      ' AND EX_CUIT = EM_CUIT' +
      ' AND EM_ID = CO_IDEMPRESA' +
      ' AND (RL_CONTRATO IS NULL OR CO_CONTRATO = RL_CONTRATO)' +
      ' AND CO_CONTRATO = AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX_FECHAACCIDENTE)' +
      ' AND CO_CONTRATO = DC_CONTRATO' +
      ' AND DC_TIPO = ''L''' +
      ' AND EX_SINIESTRO = DG_SINIESTRO' +
      ' AND EX_ORDEN = DG_ORDEN' +
      ' AND EX_RECAIDA = DG_RECAIDA' +
      ' AND EX_SINIESTRO = UB_SINIESTRO(+)' +
      ' AND EX_ORDEN = UB_ORDEN(+)' +
      ' AND EX_RECAIDA = UB_RECAIDA(+)' +
      ' AND EX_SINIESTRO = ' + SqlValue(iSiniestro) +
      ' AND EX_ORDEN = ' + SqlValue(iOrden) +
      ' AND EX_RECAIDA = ' + SqlValue(iRecaida) +
    ' UNION ' +
   ' SELECT TJ_ID, TJ_FNACIMIENTO, TJ_SEXO, TJ_IDNACIONALIDAD, TJ_CPOSTAL, TJ_OTRANACIONALIDAD, TJ_CALLE,' +
          ' TJ_LOCALIDAD, PRTRAB.PV_DESCRIPCION PROVTRAB, TJ_NUMERO, TJ_PISO, TJ_DEPARTAMENTO, TJ_CPOSTALA,' +
          ' TJ_CODAREATELEFONO, TJ_TELEFONO, HL_TAREA AS RL_TAREA, HL_CIUO AS RL_CIUO,' +
          ' HL_FECHAINGRESO AS RL_FECHAINGRESO, HL_IDMODALIDADCONTRATACION AS RL_IDMODALIDADCONTRATACION, CO_CONTRATO,' +
          ' CO_IDACTIVIDAD, DC_CPOSTAL, DC_CALLE, DC_LOCALIDAD, PREMPR.PV_DESCRIPCION PROVEMPR, DC_NUMERO, DC_PISO,' +
          ' DC_DEPARTAMENTO, DC_CPOSTALA, DC_CODAREATELEFONOS, DC_TELEFONOS,' +
          ' NOMINA.GET_EMPLEADOS(CO_CONTRATO, TO_CHAR(EX_FECHAACCIDENTE, ''YYYYMM'')) DOTACION, DG_ZONA ZONA,' +
          ' DG_NATURALEZA NATURALEZA, DG_FORMA FORMA,' +
          ' SRT_SSN.GET_SRTAGENTE(DG_SINIESTRO, DG_ORDEN, DG_RECAIDA, EX_TIPO) AGENTE, UB_NOMBRE EMPRESA,' +
          ' UB_CUITOCURRE CUIT, AFILIACION.GET_IDACTIVIDADEMPRESA(UB_CUITOCURRE) IDACTIVIDAD, UB_CPOSTAL CPOSTAL,' +
          ' UB_CALLE CALLE, UB_LOCALIDAD LOCALIDAD, PRACCESTABL.PV_DESCRIPCION DESCRPROVACCESTABL, UB_NUMERO NUMERO,' +
          ' UB_PISO PISO, UB_DEPARTAMENTO DEPARTAMENTO, UB_CPOSTALA CPOSTALA, UB_CODAREATELEFONOS CODAREATELEFONOS,' +
          ' UB_TELEFONOS TELEFONOS, UB_CODIGOESTABLECIMIENTO CODIGOESTABLECIMIENTO, EX_FECHAACCIDENTE,' +
          ' DECODE(EX_HORAACCIDENTE,''__:__'', NULL,EX_HORAACCIDENTE) EX_HORAACCIDENTE, EX_BREVEDESCRIPCION DESCRIPCIONACCIDENTE, TO_NUMBER(NULL) AS RL_ID, EX_GRAVEDAD, HL_ID' +
     ' FROM ADC_DOMICILIOCONTRATO, AEM_EMPRESA, ACO_CONTRATO, CHL_HISTORICOLABORAL, CPV_PROVINCIAS PRACCESTABL,' +
          ' CPV_PROVINCIAS PREMPR, CPV_PROVINCIAS PRTRAB, CTJ_TRABAJADOR, SDG_DENUNCIASGRAVES, SUB_UBICACIONES,' +
          ' SEX_EXPEDIENTES' +
    ' WHERE EX_CUIL = TJ_CUIL' +
      ' AND TJ_PROVINCIA = PRTRAB.PV_CODIGO(+)' +
      ' AND DC_PROVINCIA = PREMPR.PV_CODIGO(+)' +
      ' AND UB_PROVINCIA = PRACCESTABL.PV_CODIGO(+)' +
      ' AND TJ_ID = HL_IDTRABAJADOR(+)' +
      ' AND EX_CUIT = EM_CUIT' +
      ' AND EM_ID = CO_IDEMPRESA' +
      ' AND (HL_CONTRATO IS NULL OR CO_CONTRATO = HL_CONTRATO)' +
      ' AND CO_CONTRATO = AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX_FECHAACCIDENTE)' +
      ' AND CO_CONTRATO = DC_CONTRATO' +
      ' AND DC_TIPO = ''L''' +
      ' AND EX_SINIESTRO = DG_SINIESTRO' +
      ' AND EX_ORDEN = DG_ORDEN' +
      ' AND EX_RECAIDA = DG_RECAIDA' +
      ' AND EX_SINIESTRO = UB_SINIESTRO(+)' +
      ' AND EX_ORDEN = UB_ORDEN(+)' +
      ' AND EX_RECAIDA = UB_RECAIDA(+)' +
      ' AND EX_SINIESTRO = ' + SqlValue(iSiniestro) +
      ' AND EX_ORDEN = ' + SqlValue(iOrden) +
      ' AND EX_RECAIDA = ' + SqlValue(iRecaida) +
 ' ORDER BY RL_ID';

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
          ' WHERE A.HL_ID = (SELECT MIN(B.HL_ID)' +
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
        edEX_FECHAACCIDENTE.Date         := FieldByName('EX_FECHAACCIDENTE').AsDateTime;
        edEX_HORAACCIDENTE.Time          := StrToTime(NVL(FieldByName('EX_HORAACCIDENTE').AsString, '0'));

        fraAE_PROGRAMA.Codigo := ValorSql(
               ' SELECT tb_especial1 '+
          '   FROM art.ctb_tablas '+
          '  WHERE tb_clave = ''TFET'' '+
          '    AND tb_codigo <> ''0'' '+
          '    AND tb_fechabaja IS NULL '+
          '    AND tb_codigo = art.hys.get_tipo_empresa ('+SqlValue(fraEmpresa.CUIT)+', 0)');

        fraAE_IDOPERATIVO.Codigo := ValorSql('select hys.get_operativovigente_empresa(' + SqlValue(fraEmpresa.CUIT) + ') from dual');
        fraAE_PROGRAMAChange(nil);
        if CargarValoresDefecto then
        begin
          edAE_DOTACION.Value                      := FieldByName('DOTACION').AsInteger;
          fraAE_ZONA.Codigo                        := FieldByName('ZONA').AsString;
          fraAE_NATURALEZA.Codigo                  := FieldByName('NATURALEZA').AsString;
          fraAE_FORMA.Codigo                       := FieldByName('FORMA').AsString;
          fraAE_AGENTE.Codigo                      := FieldByName('AGENTE').AsString;
          edAE_EMPRESA.Text                        := FieldByName('EMPRESA').AsString;
          mskAE_CUIT.Text                          := FieldByName('CUIT').AsString;
          fraAE_IDACTIVIDAD.Value                  := FieldByName('IDACTIVIDAD').AsInteger;
          fraDomicilioAccidenteEstabl.CodigoPostal := FieldByName('CPOSTAL').AsString;
          fraDomicilioAccidenteEstabl.Calle        := FieldByName('CALLE').AsString;
          fraDomicilioAccidenteEstabl.Localidad    := FieldByName('LOCALIDAD').AsString;
          fraDomicilioAccidenteEstabl.Provincia    := FieldByName('DESCRPROVACCESTABL').AsString;
          fraDomicilioAccidenteEstabl.Numero       := IIF(FieldByName('NUMERO').AsString <> '', FieldByName('NUMERO').AsString, 'S/N');
          fraDomicilioAccidenteEstabl.Piso         := FieldByName('PISO').AsString;
          fraDomicilioAccidenteEstabl.Departamento := FieldByName('DEPARTAMENTO').AsString;
          fraDomicilioAccidenteEstabl.CPA          := FieldByName('CPOSTALA').AsString;
          edCodAreaAccidenteEstabl.Text            := FieldByName('CODAREATELEFONOS').AsString;
          edAE_TELEFONOS.Text                      := FieldByName('TELEFONOS').AsString;
          edAE_NROESTABLECIMIENTO.Text             := Get_StringNullValueNumber(FieldByName('CODIGOESTABLECIMIENTO').AsInteger);
          edAE_DESCRIPCIONACCIDENTE.Text           := FieldByName('DESCRIPCIONACCIDENTE').AsString;
          fraAE_PROGRAMAEMPRESA.Codigo := ValorSql(
            ' SELECT tb_especial1 '+
            '   FROM art.ctb_tablas '+
            '  WHERE tb_clave = ''TFET'' '+
            '    AND tb_codigo <> ''0'' '+
            '    AND tb_fechabaja IS NULL '+
            '    AND tb_codigo = art.hys.get_tipo_empresa ('+SqlValue(mskAE_CUIT.Text)+', 0)');

          fraAE_IDOPERATIVOEMPRESA.Codigo := ValorSql('select hys.get_operativovigente_empresa(' + SqlValue(mskAE_CUIT.Text) + ') from dual');
          fraAE_PROGRAMAEMPRESAChange(nil);        
        end;
      end;

      Do_HabilitarDatosRelacionLaboral(pbEsMortal or (not FieldByName('HL_ID').IsNull));  // se habilita la carga para los mortales
    end;

    if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE GA_IDESTADO in (4,5) '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+ SqlValue(iSiniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
      InfoHint(ScrollBox, 'Esta Investigación de Accidente esta asignada como No Investigar o Cerrado.');
    if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE GA_IDESTABLECIMIENTO is not null and GA_IDESTABLECIMIENTO <> 0 '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+ SqlValue(iSiniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
    begin
      edAE_NROESTABLECIMIENTO.Text := ValorSql(
        ' SELECT es_nroestableci '+
        '   FROM hys.hga_gestionaccidente, aes_establecimiento, sex_expedientes '+
        '  WHERE es_id = GA_IDESTABLECIMIENTO '+
        '    AND ga_idexpediente = ex_id '+
        '    AND ex_siniestro = '+SqlValue(iSiniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden));
      vclExtra.LockControl(edAE_NROESTABLECIMIENTO,True);
    end
    else
      vclExtra.LockControl(edAE_NROESTABLECIMIENTO,False);

    if ExisteSql(
        ' SELECT 1 '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND ga_idpreventor IS NOT NULL '+
        '    AND ex_siniestro = '+ SqlValue(iSiniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
    begin
      fraPreventor.Value := ValorSqlInteger(
        ' SELECT ga_idpreventor '+
        '   FROM hys.hga_gestionaccidente,SEX_EXPEDIENTES  '+
        '  WHERE ex_id = ga_idexpediente '+
        '    AND ex_siniestro = '+SqlValue(iSiniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden));
      vclExtra.LockControl(fraPreventor,True);
    end
    else
      vclExtra.LockControl(fraPreventor,False);
    if ExisteSql(
          ' SELECT 1 '+
          '   FROM hys.hga_gestionaccidente, sex_expedientes '+
          '  WHERE ex_id = ga_idexpediente '+
          '    AND (ga_calle IS NOT NULL OR ga_cpostal IS NOT NULL OR (ga_provincia <> -1)) '+
          '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)+
          '    AND ex_orden = '+ SqlValue(edSiniestro.Orden)) then
    begin
      sSql :=
        ' SELECT ga_calle, ga_numero, ga_piso, ga_departamento, ga_cpostal, ga_cpostala, '+
        '        ga_localidad, ga_provincia '+
        '   FROM hys.hga_gestionaccidente, sex_expedientes '+
        '  WHERE ex_id = ga_idexpediente AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)+
        '    AND ex_orden = '+ SqlValue(edSiniestro.Orden);

      with GetQuery(sSql) do
      try
        fraDomicilioAccidenteEstabl.Calle        := FieldByName('ga_calle').AsString;
        if FieldByName('ga_numero').AsString = 'S/N' then
          fraDomicilioAccidenteEstabl.Numero       := '0'
        else
          fraDomicilioAccidenteEstabl.Numero       := FieldByName('ga_numero').AsString;
        fraDomicilioAccidenteEstabl.Piso         := FieldByName('ga_piso').AsString;
        fraDomicilioAccidenteEstabl.Departamento := FieldByName('ga_departamento').AsString;
        fraDomicilioAccidenteEstabl.CodigoPostal := FieldByName('ga_cpostal').AsString;
        fraDomicilioAccidenteEstabl.CPA          := FieldByName('ga_cpostala').AsString;
        fraDomicilioAccidenteEstabl.Localidad    := FieldByName('ga_localidad').AsString;
        fraDomicilioAccidenteEstabl.Prov         := FieldByName('ga_provincia').AsInteger;
        fraDomicilioAccidenteEstabl.Provincia    := ValorSql('SELECT pv_descripcion '+
            '  FROM art.cpv_provincias '+
            ' WHERE pv_codigo = '+SqlValue(FieldByName('ga_provincia').AsInteger));
      finally
        Free;
      end;
      vclExtra.LockControl(fraDomicilioAccidenteEstabl,True);
    end
    else
      vclExtra.LockControl(fraDomicilioAccidenteEstabl,False);
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

procedure TfrmInfInvestigacionAccidentes.Do_LimpiarDatosSiniestro;
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
  edDC_CODAREATELEFONOS.Clear;
  edDC_TELEFONOS.Clear;
  fraCO_IDACTIVIDAD.Clear;
  edEX_FECHAACCIDENTE.Clear;
  edEX_HORAACCIDENTE.Time := StrToTime('00:00:00');
end;

procedure TfrmInfInvestigacionAccidentes.Do_DeshabilitarDatosSiniestro();
begin
  VCLExtra.LockControls([cmbTJ_FNACIMIENTO, edTJ_CODAREATELEFONO, edTJ_TELEFONO, fraTrabajador.mskCUIL,
                         fraTrabajador.cmbNombre, fraTJ_SEXO.edCodigo, fraTJ_SEXO.cmbDescripcion,
                         fraTJ_IDNACIONALIDAD.edCodigo, fraTJ_IDNACIONALIDAD.cmbDescripcion, edTJ_OTRANACIONALIDAD,
                         edDC_CODAREATELEFONOS, edDC_TELEFONOS, fraEmpresa.mskCUIT, fraEmpresa.cmbRSocial,
                         fraEmpresa.edContrato, fraCO_IDACTIVIDAD.edCodigo, fraCO_IDACTIVIDAD.cmbDescripcion,
                         edEX_FECHAACCIDENTE, edEX_HORAACCIDENTE], True);
  fraDomicilioTrabaj.Locked := True;
  fraDomicilioEmpresa.Locked := True;
  fraDomicilioAccidenteEstabl.LockProvincia(True);

  fraAE_PROGRAMAChange(nil);
  fraAE_PROGRAMAEMPRESAChange(nil);
end;

procedure TfrmInfInvestigacionAccidentes.Do_HabilitarDatosRelacionLaboral(HabilitarRelLaboral: Boolean);
begin
  VCLExtra.LockControls([edRL_TAREA, cmbRL_FECHAINGRESO, fraRL_CIUO.edCodigo, fraRL_CIUO.cmbDescripcion,
                         fraRL_IDMODALIDADCONTRATACION.edCodigo, fraRL_IDMODALIDADCONTRATACION.cmbDescripcion],
                         not HabilitarRelLaboral);
end;

procedure TfrmInfInvestigacionAccidentes.tbNuevoClick(Sender: TObject);
begin
  inherited;
//  BeginTrans(true);
  if edSiniestro.CanFocus then
    edSiniestro.SetFocus;
  btnAceptar.Enabled := False;
end;

procedure TfrmInfInvestigacionAccidentes.tbLimpiarClick(Sender: TObject);
begin
  FCargo := False;

  inherited;
  
  if edSiniestro.CanFocus then
    edSiniestro.SetFocus;
end;

procedure TfrmInfInvestigacionAccidentes.OnfraPE_TIPODOCUMENTOChange(Sender: TObject);
begin
  HabilitarCUILPersEntrevistada(fraPE_TIPODOCUMENTO.IsEmpty);
end;

procedure TfrmInfInvestigacionAccidentes.HabilitarCUILPersEntrevistada(HabilitarCUIL: Boolean);
begin
  VCLExtra.LockControl(edPE_DOCUMENTO, HabilitarCUIL);
  VCLExtra.LockControl(mskPE_CUIL, not HabilitarCUIL);

  if HabilitarCUIL then
    edPE_DOCUMENTO.Clear
  else
    mskPE_CUIL.Clear;
end;

function TfrmInfInvestigacionAccidentes.Is_EstablecimInvestigAccValido(CUIT: String; NroEstableci: Integer): Boolean;
var
  sSql: String;
begin
  sSql :=
    'SELECT HYS.Is_EstablecimInvestigAccValido(' + SqlValue(CUIT) + ', ' + SqlValue( NroEstableci) + ')' +
     ' FROM DUAL';

  Result := (ValorSql(sSql) = 'S');
end;

procedure TfrmInfInvestigacionAccidentes.btnCancelarClick(Sender: TObject);
begin
  inherited;
  RollBackUpdates;

  FCargo := false;

  sdqPPE_PERSONAENTREVISTADA.Active := False;
  sdqPDC_DIAGNOSTICOCAUSA.Active := False;
  sdqPMC_MEDIDACORRECTIVA.Active := False;
  sdqPAM_ACCIDENTEMULTIPLE.Active := False;
  sdqPCM_CAUSAYMEDIDA.Active := False;
  sdqPSV_SEGUIMIENTOVISITA.Active := False;
  sdqPAM_ACCIDENTEMULTIPLE.Active := False;

  IrPrincipioPantalla;
end;

procedure TfrmInfInvestigacionAccidentes.IrPrincipioPantalla;
begin
  pcDatos.ActivePageIndex               := PAGE_DATOSGENERALES;
  pcCausasMedidasSeguim.ActivePageIndex := PAGE_CAUSAS;
  pcCausasVisitas.ActivePageIndex       := PAGE_CAUSAMEDIDAS;

  ScrollBox.VertScrollBar.Position := 0;
  ScrollBox.HorzScrollBar.Position := 0;

  fraAE_IDOPERATIVO.Locked := false;
  fraAE_PROGRAMAEMPRESA.Locked := false;
  fraPreventor.Locked := false;
  fraDomicilioAccidenteEstabl.Locked := False;
end;

procedure TfrmInfInvestigacionAccidentes.btnAceptarClick(Sender: TObject);
var
  pAE_ID : Integer;
begin
///  DataLoaded := False;
  pAE_ID := sdqConsulta.FieldByName('AE_ID').AsInteger;
  Verificar(not ExisteSql( 'SELECT 1 FROM hys.pdc_diagnosticocausa '+
                           ' WHERE dc_idaccidenteestablecimiento = '+ SqlValue(pAE_ID)+
                           '   AND dc_fechabaja IS NULL'),dbgPDC_DIAGNOSTICOCAUSA,'Debe tener al menos una causa cargada.');
  Verificar(not ExisteSql( 'SELECT 1 FROM hys.pmc_medidacorrectiva '+
                           ' WHERE mc_idaccidenteestablecimiento = '+ SqlValue(pAE_ID)+
                           '   AND mc_fechabaja IS NULL'),dbgPMC_MEDIDACORRECTIVA,'Debe tener al menos una medida cargada.');
  Verificar(not ExisteSql( 'SELECT 1 FROM hys.PPE_PERSONAENTREVISTADA '+
                           ' WHERE pe_idaccidenteestablecimiento = '+ SqlValue(pAE_ID)+
                           '   AND pe_fechabaja IS NULL'),dbgPPE_PERSONAENTREVISTADA,'Debe tener al menos una persona entrevistada cargada.');
  if Validar and DoABM then
  begin
    LockControls;
    if ModoABM = maBaja then
      ClearControls( False )
    else
      DataLoaded := True;

    ModoABM := maNone;
    BeginTrans(true);
    CommitTrans;
    MsgBox('Los datos se guardaron.', MB_ICONINFORMATION);
  end;


//  if DataLoaded then
//    IrPrincipioPantalla;
end;

procedure TfrmInfInvestigacionAccidentes.fpPCD_DIAGNOSTICOCAUSAEnter(Sender: TObject);
begin
  inherited;

  VCLExtra.LockControl(edDC_NUMERO, True);
end;

procedure TfrmInfInvestigacionAccidentes.btPDCAceptarClick(Sender: TObject);
var
  sSql, sTexto: String;
  pAE_ID: TTableId;
  iPDCNumero, idmedida , idcausa: Integer;
begin
  idcausa := 0;
  Verificar(IsEmptyString(edDC_DESCRIPCION.Text), edDC_DESCRIPCION, 'Debe ingresar la descripción de la causa.');

  with sdqPDC_DIAGNOSTICOCAUSA do
  begin
//Pablo    BeginTrans;
    try
      pAE_ID := sdqConsulta.FieldByName('AE_ID').AsInteger;

      if ModoABMTablas = maAlta Then
      begin
        Insert;
        idCausa := GetSecNextVal('HYS.SEQ_PDC_ID');
        FieldByName('DC_ID').AsInteger                         := idcausa;
        FieldByName('DC_IDACCIDENTEESTABLECIMIENTO').AsInteger := pAE_ID;

        sSql :=
          'SELECT NVL(MAX(DC_NUMERO), 0) + 1' +
           ' FROM PDC_DIAGNOSTICOCAUSA' +
          ' WHERE DC_IDACCIDENTEESTABLECIMIENTO = ' + SqlValue(pAE_ID);
        iPDCNumero := ValorSqlInteger(sSql);

        FieldByName('DC_NUMERO').AsInteger                     := iPDCNumero;
      end
      else
        Edit;

      FieldByName('DC_DESCRIPCION').AsString                 := edDC_DESCRIPCION.Text;

      FieldByName('USUARIO').AsString                        := frmPrincipal.DBLogin.UserID;
      FieldByName('DC_USUBAJA').Value                        := Null;
      FieldByName('DC_FECHABAJA').Value                      := Null;

      If cbNoDeterminada.Checked then
          FieldByName('DC_NODETERMINADA').AsString := 'S'
        else
          FieldByName('DC_NODETERMINADA').AsString := 'N';

      Post;
      ApplyUpdates;
      if cbNoDeterminada.Checked and (ModoABMTablas = maAlta) then
      begin
        sSql :=
            'SELECT NVL(MAX(MC_MEDIDA), 0) + 1' +
             ' FROM PMC_MEDIDACORRECTIVA' +
            ' WHERE MC_IDACCIDENTEESTABLECIMIENTO = ' + SqlValue(pAE_ID);
        sTexto := 'No se elabora medida correctiva alguna al no poder determinarse fehacientemente la/s causa/s que dieron origen al siniestro investigado';

        idmedida := GetSecNextVal('HYS.SEQ_PMC_ID');

        EjecutarSqlST( 'INSERT INTO hys.pmc_medidacorrectiva(mc_id, mc_idaccidenteestablecimiento, '+
                       '            mc_medida, mc_fechaejecucion, mc_fechaverificacion, mc_descripcion, '+
                       '            mc_usualta, mc_fechaalta)'+
                       '     VALUES('+SqlValue(idmedida)+','+SqlValue(pAE_ID)+','+
                                    ValorSql(sSql)+','+SqlValue(edAE_FECHA.Date)+','+
                                    SqlValue(edAE_FECHA.Date)+','+SqlValue(sTexto)+','+
                                    SqlValue(frmPrincipal.DBLogin.UserID)+',sysdate) ');

        EjecutarSqlST( 'INSERT INTO HYS.PCM_CAUSAYMEDIDA(CM_ID, CM_IDDIAGNOSTICOCAUSA, '+
                       '            CM_IDMEDIDACORRECTIVA)'+
                       '     VALUES('+SqlValue(GetSecNextVal('HYS.SEQ_PCM_ID'))+','+SqlValue(idcausa)+','+
                                    SqlValue(idmedida)+')');

        EjecutarSqlST( 'INSERT INTO HYS.PSV_SEGUIMIENTOVISITA(SV_ID, SV_IDMEDIDACORRECTIVA, '+
                       '            SV_TIPO, SV_FECHA,SV_USUALTA, SV_FECHAALTA)'+
                       '     VALUES('+SqlValue(GetSecNextVal('HYS.SEQ_PSV_ID'))+','+SqlValue(idmedida)+', ''V'', '+
                                    SqlValue(edAE_FECHA.Date)+','+SqlValue(frmPrincipal.DBLogin.UserID)+',sysdate)');


      end;
//Pablo      CommitUpdates;
//Pablo      CommitTrans;

      SetID(sdqPDC_DIAGNOSTICOCAUSA, pAE_ID);
      sdqPDC_DIAGNOSTICOCAUSA.Open;

      fpPCD_DIAGNOSTICOCAUSA.ModalResult := mrOk;
    except
      on E: Exception do
      begin
        CancelUpdates;
//Pablo          RollBack;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.dbgPPE_PERSONAENTREVISTADAGetCellParams(Sender: TObject; Field: TField;
                                                                                 AFont: TFont; var Background: TColor;
                                                                                 Highlight: Boolean);
begin
  if not sdqPPE_PERSONAENTREVISTADA.FieldByName('PE_USUBAJA').IsNull then
    AFont.Color:= clRed;
end;

procedure TfrmInfInvestigacionAccidentes.dbgPDC_DIAGNOSTICOCAUSAGetCellParams(Sender: TObject; Field: TField;
                                                                              AFont: TFont; var Background: TColor;
                                                                              Highlight: Boolean);
begin
  if not sdqPDC_DIAGNOSTICOCAUSA.FieldByName('DC_USUBAJA').IsNull then
    AFont.Color:= clRed;
end;

function TfrmInfInvestigacionAccidentes.Is_AccidenteEstablId: Boolean;
begin
  Result := not sdqConsulta.FieldByName('AE_ID').IsNull;
end;

procedure TfrmInfInvestigacionAccidentes.fpPMC_MEDIDACORRECTIVAEnter(Sender: TObject);
begin
  inherited;

  VCLExtra.LockControl(edMC_MEDIDA, True);
end;

procedure TfrmInfInvestigacionAccidentes.tbPMCNuevoClick(Sender: TObject);
begin
  if Is_AccidenteEstablId then
  begin
    edMC_MEDIDA.Clear;
    edMC_FECHAEJECUCION.Clear;
    edMC_FECHAVERIFICACION.Clear;
    edMC_DESCRIPCION.Clear;

    ModoABMTablas := maAlta;

    fpPMC_MEDIDACORRECTIVA.ShowModal;
  end
  else
    MsgBox('Para poder continuar, debe confirmar los datos cargados previamente, haciendo clic en Aceptar.', MB_ICONERROR);
end;

procedure TfrmInfInvestigacionAccidentes.tbPMCModificarClick(Sender: TObject);
begin
  if (not sdqPMC_MEDIDACORRECTIVA.IsEmpty) and (sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_FECHABAJA').IsNull) then
    with sdqPMC_MEDIDACORRECTIVA do
    begin
      edMC_MEDIDA.Value           := FieldByName('MC_MEDIDA').AsInteger;
      edMC_FECHAEJECUCION.Date    := FieldByName('MC_FECHAEJECUCION').AsDateTime;
      edMC_FECHAVERIFICACION.Date := FieldByName('MC_FECHAVERIFICACION').AsDateTime;
      edMC_DESCRIPCION.Text       := FieldByName('MC_DESCRIPCION').AsString;

      ModoABMTablas := maModificacion;

      fpPMC_MEDIDACORRECTIVA.ShowModal;
    end;
end;

procedure TfrmInfInvestigacionAccidentes.btPMCAceptarClick(Sender: TObject);
var
  sSql: String;
  pAE_ID: TTableId;
  iPMCMedida: Integer;
begin
  if edMC_FECHAEJECUCION.IsEmpty then
    InvalidMsg(edMC_FECHAEJECUCION, 'Debe ingresar la fecha de ejecución.')

  else if edMC_FECHAEJECUCION.Date < edAE_FECHA.Date then
    InvalidMsg(edMC_FECHAEJECUCION, 'La fecha de ejecución debe ser mayor o igual a la fecha de investigación.')

  else if edMC_FECHAVERIFICACION.IsEmpty then
    InvalidMsg(edMC_FECHAVERIFICACION, 'Debe ingresar la fecha de verificación.')

  else if edMC_FECHAVERIFICACION.Date < edMC_FECHAEJECUCION.Date then
    InvalidMsg(edMC_FECHAVERIFICACION, 'La fecha de verificación debe ser mayor igual a la fecha de ejecución.')

  else if IsEmptyString(edMC_DESCRIPCION.Text) then
    InvalidMsg(edMC_DESCRIPCION, 'Debe ingresar la descripción de la medida correctiva.')

  else
    with sdqPMC_MEDIDACORRECTIVA do
    begin
//Pablo          BeginTrans;
      try
        pAE_ID := sdqConsulta.FieldByName('AE_ID').AsInteger;

        if ModoABMTablas = maAlta then
        begin
          Insert;

          FieldByName('MC_ID').AsInteger                         := GetSecNextVal('HYS.SEQ_PMC_ID');
          FieldByName('MC_IDACCIDENTEESTABLECIMIENTO').AsInteger := pAE_ID;

          sSql :=
            'SELECT NVL(MAX(MC_MEDIDA), 0) + 1' +
             ' FROM PMC_MEDIDACORRECTIVA' +
            ' WHERE MC_IDACCIDENTEESTABLECIMIENTO = ' + SqlValue(pAE_ID);
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
//Pablo            CommitUpdates;
//Pablo            CommitTrans;

        SetID(sdqPMC_MEDIDACORRECTIVA, pAE_ID);
        sdqPMC_MEDIDACORRECTIVA.Open;

        fpPMC_MEDIDACORRECTIVA.ModalResult := mrOk;
      except
        on E: Exception do
        begin
          CancelUpdates;
//Pablo                RollBack;
          ErrorMsg(E, 'Error al guardar los datos.');
        end;
      end;
    end;
end;

procedure TfrmInfInvestigacionAccidentes.tbPMCEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPMC_MEDIDACORRECTIVA, 'MC');
  Do_DarBajaSeguimientoVisita(sdqPMC_MEDIDACORRECTIVA.FieldByName( 'MC_ID' ).AsInteger);
end;

procedure TfrmInfInvestigacionAccidentes.dbgPMC_MEDIDACORRECTIVAGetCellParams(Sender: TObject; Field: TField;
                                                                              AFont: TFont; var Background: TColor;
                                                                              Highlight: Boolean);
begin
  if not sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_USUBAJA').IsNull then
    AFont.Color:= clRed;
end;

procedure TfrmInfInvestigacionAccidentes.pcCausasMedidasSeguimChange(Sender: TObject);
begin
  case pcCausasMedidasSeguim.ActivePageIndex of
    PAGE_CAUSAS:  sdqPDC_DIAGNOSTICOCAUSA.Active := True;
    PAGE_MEDIDASCORRECTIVAS:
    begin
      sdqPMC_MEDIDACORRECTIVA.Active := True;
      pcCausasVisitasChange(nil);
    end;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.pcCausasVisitasChange(Sender: TObject);
begin
  case pcCausasVisitas.ActivePageIndex of
    PAGE_CAUSAMEDIDAS:        sdqPCM_CAUSAYMEDIDA.Active := True;
    PAGE_SEGUIMIENTOVISITAS:  sdqPSV_SEGUIMIENTOVISITA.Active := True;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.dbgPSV_SEGUIMIENTOVISITAGetCellParams(Sender: TObject; Field: TField;
                                                                               AFont: TFont; var Background: TColor;
                                                                               Highlight: Boolean);
begin
  if not sdqPSV_SEGUIMIENTOVISITA.FieldByName('SV_USUBAJA').IsNull then
    AFont.Color:= clRed;
end;

procedure TfrmInfInvestigacionAccidentes.tbPSVNuevoClick(Sender: TObject);
begin
  if Is_AccidenteEstablId then
  begin
    if not sdqPMC_MEDIDACORRECTIVA.IsEmpty then
    begin
      if sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_FECHABAJA').IsNull then
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

procedure TfrmInfInvestigacionAccidentes.tbPSVModificarClick(Sender: TObject);
begin
  if (not sdqPSV_SEGUIMIENTOVISITA.IsEmpty) and (sdqPSV_SEGUIMIENTOVISITA.FieldByName('SV_FECHABAJA').IsNull) then
    with sdqPSV_SEGUIMIENTOVISITA do
    begin
      edSV_TIPO.Value := FieldByName('SV_TIPO').AsString;
      edSV_FECHA.Date := FieldByName('SV_FECHA').AsDateTime;

      VCLExtra.LockControl(edSV_FECHA, True);

      ModoABMTablas := maModificacion;

      fpPSV_SEGUIMIENTOVISITA.ShowModal;
    end;
end;

procedure TfrmInfInvestigacionAccidentes.tbPSVEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPSV_SEGUIMIENTOVISITA, 'SV');
end;

procedure TfrmInfInvestigacionAccidentes.btPSVAceptarClick(Sender: TObject);
var
  bEsAlta: Boolean;
  //pMC_ID: TTableId;
begin
  bEsAlta := (ModoABMTablas = maAlta);

  Verificar(edSV_TIPO.ItemIndex = -1, edSV_TIPO, 'Debe seleccionar un tipo de visita.');
  Verificar(bEsAlta and (edSV_FECHA.Date = 0), edSV_FECHA, 'Debe ingresar la fecha de visita.');
  Verificar(bEsAlta and (edSV_FECHA.Date > DBDate), edSV_FECHA, 'La fecha de visita tiene que ser menor o igual a hoy.');

  if ((edSV_TIPO.Value = 'C') and (not ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITA WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger) + iif(not bEsAlta,  ' AND SV_ID <> ' +  sdqPSV_SEGUIMIENTOVISITA.FieldByName('SV_ID').AsString, '')))) then
  begin
    InvalidMsg(edSV_TIPO, 'La primer visita debe ser "Visita" o "Incumplimiento".');
    Abort;
  end;

  if ((edSV_TIPO.Value = 'V') and (ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITA WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger) + iif(not bEsAlta,  ' AND SV_ID <> ' +  sdqPSV_SEGUIMIENTOVISITA.FieldByName('SV_ID').AsString, '')))) then
  begin
    InvalidMsg(edSV_TIPO, 'La visita debe ser "Cumplimiento" o "Incumplimiento".');
    Abort;
  end;

  if bEsAlta and (ExisteSql('SELECT 1 from HYS.PSV_SEGUIMIENTOVISITA WHERE SV_FECHABAJA IS NULL AND SV_IDMEDIDACORRECTIVA = ' + SqlValue(sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger) + ' AND SV_FECHA = ' + SqlValue(edSV_FECHA.Date))) then
  begin
    InvalidMsg(edSV_FECHA, 'Ya existe una visita con esta fecha.');
    Abort;
  end;

  if bEsAlta and (edSV_FECHA.Date < sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_FECHAEJECUCION').AsDateTime) then
    if not MsgAsk('La fecha de visita es mayor o igual a la fecha de ejecución.' + CRLF + '¿Está seguro que la fecha ingresada es correcta?') then
      Abort;

  guardarSeguimientoAccidente(ModoABMTablas = maAlta, sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger, edSV_TIPO.Value, edSV_FECHA.Date, IIF(ModoABMTablas = maAlta,0,sdqPSV_SEGUIMIENTOVISITA.FieldByName('sv_ID').AsInteger));
  sdqPSV_SEGUIMIENTOVISITA.Refresh;
  fpPSV_SEGUIMIENTOVISITA.ModalResult := mrOk;
end;

procedure TfrmInfInvestigacionAccidentes.sdqPMC_MEDIDACORRECTIVAAfterScroll(DataSet: TDataSet);
begin
  SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger);
  OpenQuery(sdqPCM_CAUSAYMEDIDA);
  OpenQuery(sdqPSV_SEGUIMIENTOVISITA);
end;

procedure TfrmInfInvestigacionAccidentes.Do_DarBajaSeguimientoVisita(IdMedidaCorrectiva: TTableId);
var
  sSql: String;
begin
  sSql :=
    'UPDATE PSV_SEGUIMIENTOVISITA' +
      ' SET SV_USUBAJA = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ',' +
          ' SV_FECHABAJA = ACTUALDATE ' +
    ' WHERE SV_IDMEDIDACORRECTIVA = ' + SqlValue(IdMedidaCorrectiva) +
      ' AND SV_FECHABAJA IS NULL';

  EjecutarSqlST(sSql);

  sdqPSV_SEGUIMIENTOVISITA.Refresh;
end;

procedure TfrmInfInvestigacionAccidentes.tbPCMEliminarClick(Sender: TObject);
begin
  if not sdqPCM_CAUSAYMEDIDA.IsEmpty and MsgAsk('¿ Desea dar de baja el registro seleccionado ?') then
  begin
//Pablo      BeginTrans;
    try
      sdqPCM_CAUSAYMEDIDA.Delete;

      sdqPCM_CAUSAYMEDIDA.ApplyUpdates;
//Pablo        sdqPCM_CAUSAYMEDIDA.CommitUpdates;
//Pablo        CommitTrans;
    except
      on E: Exception do
      begin
        sdqPCM_CAUSAYMEDIDA.CancelUpdates;
//Pablo            RollBack;
        ErrorMsg(E, 'Error al dar de baja el registro.');
      end;
    end;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.fpPCM_CAUSAYMEDIDAEnter(Sender: TObject);
begin
  inherited;

  VCLExtra.LockControl(edMC_MEDIDACAUSA, True);
end;

procedure TfrmInfInvestigacionAccidentes.tbPCMNuevoClick(Sender: TObject);
begin
  if Is_AccidenteEstablId then
  begin
    if not sdqPMC_MEDIDACORRECTIVA.IsEmpty then
    begin
      if sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_FECHABAJA').IsNull then
      begin
        if not sdqPDC_DIAGNOSTICOCAUSA.IsEmpty then
        begin
          edMC_MEDIDACAUSA.Value := sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_MEDIDA').AsInteger;

          with fraPDC_DIAGNOSTICOCAUSA_ESTABL do
          begin
            ClearGrid;
            ExtraCondition := ' AND DC_IDACCIDENTEESTABLECIMIENTO=' + SqlValue( sdqConsulta.FieldByName('AE_ID').AsInteger );
          end;

          ModoABMTablas := maAlta;

          fpPCM_CAUSAYMEDIDA.ShowModal;
        end
        else
          MsgBox('No existen causas dadas de alta.', MB_ICONERROR);
      end
      else
        MsgBox('La medida correctiva seleccionada se encuentra dada de baja.', MB_ICONERROR);
    end
    else
      MsgBox('Para poder dar de alta una causa relacionada con una medida correctiva, debe haber seleccionado previamente alguna medida correctiva.', MB_ICONERROR);
  end
  else
    MsgBox('Para poder continuar, debe confirmar los datos cargados previamente, haciendo clic en Aceptar', MB_ICONERROR);
end;

procedure TfrmInfInvestigacionAccidentes.btPCMAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM PCM_CAUSAYMEDIDA' +
    ' WHERE CM_IDDIAGNOSTICOCAUSA = ' + SqlValue(fraPDC_DIAGNOSTICOCAUSA_ESTABL.Value) +
      ' AND CM_IDMEDIDACORRECTIVA = ' + SqlValue(sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger);

  if fraPDC_DIAGNOSTICOCAUSA_ESTABL.IsEmpty then
    InvalidMsg(fraPDC_DIAGNOSTICOCAUSA_ESTABL.edCodigo, 'Debe ingresar la causa.')

  else if ExisteSql(sSql) then
    InvalidMsg(fraPDC_DIAGNOSTICOCAUSA_ESTABL.edCodigo, 'Esta causa ya ha sido cargada para la medida correctiva.')

  else
    with sdqPCM_CAUSAYMEDIDA do
    begin
//Pablo          BeginTrans;
      try
        if ModoABMTablas = maAlta then
        begin
          Insert;

          FieldByName('CM_ID').AsInteger                 := GetSecNextVal('HYS.SEQ_PCM_ID');
          FieldByName('CM_IDDIAGNOSTICOCAUSA').AsInteger := fraPDC_DIAGNOSTICOCAUSA_ESTABL.Value;
          FieldByName('CM_IDMEDIDACORRECTIVA').AsInteger := sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger;
        end;

        Post;
        ApplyUpdates;
//Pablo            CommitUpdates;
//Pablo            CommitTrans;

        sdqPMC_MEDIDACORRECTIVAAfterScroll(nil);  // sinó, no me actualiza la grilla de Causas
        fpPCM_CAUSAYMEDIDA.ModalResult := mrOk;
      except
        on E: Exception do
        begin
          CancelUpdates;
//Pablo                RollBack;
          ErrorMsg(E, 'Error al guardar los datos');
        end;
      end;
    end;
end;

procedure TfrmInfInvestigacionAccidentes.sdqRelacionesPCMAfterOpen(DataSet: TDataSet);
begin
  DataSet.FieldByName('DC_NUMERO').Required      := False;
  DataSet.FieldByName('DC_DESCRIPCION').Required := False;
end;

procedure TfrmInfInvestigacionAccidentes.Do_InsertarAccidentesMultiples(IdAccidenteEstablecimiento: TTableId; Siniestro,
                                                                        Orden: Integer);
var
  sSql: String;
begin
  sSql :=
    'INSERT INTO PAM_ACCIDENTEMULTIPLE(AM_ID, AM_IDACCIDENTEESTABLECIMIENTO, AM_IDEXPEDIENTE, AM_DETALLELESION,' +
                                     ' AM_FECHAALTA, AM_USUALTA)' +
                              ' SELECT SEQ_PAM_ID.NEXTVAL, ' + SqlValue(IdAccidenteEstablecimiento) + ', EX_ID,' +
                                     ' EX_DIAGNOSTICO, SYSDATE, ' + SqlValue(frmPrincipal.DBLogin.UserID) +
                                ' FROM SEX_EXPEDIENTES' +
                               ' WHERE EX_SINIESTRO = ' + SqlValue(Siniestro) +
                                 ' AND EX_ORDEN <> ' + SqlValue(Orden) +
                                 ' AND EX_RECAIDA = 0 ' +
                                 ' AND NOT EXISTS (SELECT 1 ' +
                                 '                 FROM PAM_ACCIDENTEMULTIPLE ' +
                                 '                 WHERE AM_IDACCIDENTEESTABLECIMIENTO = ' + SqlValue(IdAccidenteEstablecimiento)  +
                                 '                 AND AM_IDEXPEDIENTE = EX_ID) ';

  EjecutarSqlST(sSql);
end;

procedure TfrmInfInvestigacionAccidentes.tbPAMModificarClick(Sender: TObject);
begin
  if not sdqPAM_ACCIDENTEMULTIPLE.IsEmpty Then
    with sdqPAM_ACCIDENTEMULTIPLE do
    begin
      edAM_DETALLELESION.Text := FieldByName('AM_DETALLELESION').AsString;

      ModoABMTablas := maModificacion;

      fpPAM_ACCIDENTEMULTIPLE.ShowModal;
    end;
end;

procedure TfrmInfInvestigacionAccidentes.btPAMAceptarClick(Sender: TObject);
begin
  Verificar(IsEmptyString(edAM_DETALLELESION.Text), edAM_DETALLELESION, 'Debe ingresar el detalle de la lesión.');

  with sdqPAM_ACCIDENTEMULTIPLE do
  begin
//Pablo    BeginTrans;
    try
      if ModoABMTablas = maModificacion Then
        Edit;

      FieldByName('AM_DETALLELESION').AsString := edAM_DETALLELESION.Text;
      FieldByName('USUARIO').AsString          := frmPrincipal.DBLogin.UserID;

      Post;
      ApplyUpdates;
//Pablo      CommitUpdates;
//Pablo      CommitTrans;

      fpPAM_ACCIDENTEMULTIPLE.ModalResult := mrOk;
    except
      on E: Exception do
      begin
        CancelUpdates;
//Pablo          RollBack;
        ErrorMsg(E, 'Error al guardar los datos');
      end;
    end;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.Do_GuardarDatosHistoricoLaboral(IdTrabajador: TTableId; Contrato: Integer;
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
    ' WHERE A.HL_ID IN (SELECT MIN(B.HL_ID)' +
                       ' FROM CHL_HISTORICOLABORAL B' +
                      ' WHERE B.HL_IDTRABAJADOR = ' + SqlValue(IdTrabajador) +
                        ' AND B.HL_CONTRATO = ' + SqlValue(Contrato) + ')';

  EjecutarSqlST(sSql);
end;

procedure TfrmInfInvestigacionAccidentes.tbImprimirClick(Sender: TObject);
var
  pAE_ID: TTableId;
begin
  if not fraTrabajadorSinGraveBusq.IsEmpty then
  begin
    pAE_ID := sdqConsulta.FieldByName('AE_ID').AsInteger;
    Do_ImprimirInvestigacionAccidente(pAE_ID);
  end;
end;

procedure TfrmInfInvestigacionAccidentes.Do_ImprimirInvestigacionAccidente(IdAccidenteEstablecimiento: TTableId);
begin
  if not Assigned(Owner.FindComponent('qrInvestigacionAccidente')) then
    with TfrmqrInvestigacionAccidente.Create(Owner) do
    try
      Do_Imprimir(IdAccidenteEstablecimiento);
    finally
      Free;
    end;
end;

procedure TfrmInfInvestigacionAccidentes.rgAE_TIPOESTABLECIMIENTOClick(Sender: TObject);
var
  bDeshabilitarDatosObra: Boolean;
begin
  bDeshabilitarDatosObra := (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 0);   // establecimiento
  VCLExtra.LockControls([fraAE_ETAPAOBRA.edCodigo, fraAE_ETAPAOBRA.cmbDescripcion, fraAE_PROGRAMASEGURIDAD.edCodigo,
                         fraAE_PROGRAMASEGURIDAD.cmbDescripcion, edAE_FRECEPCIONOBRA, edAE_FINICIOACTIVIDAD,
                         edAE_SUPERFICIE, edAE_PLANTAS, fraAE_TIPOOBRA.edCodigo, fraAE_TIPOOBRA.cmbDescripcion,
                         fraAE_ACTIVIDADOBRA.edCodigo, fraAE_ACTIVIDADOBRA.cmbDescripcion, chkAE_PROGRAMAAPROBADO,
                         edAE_FFINOBRA, edAE_FSUSPOBRA, edAE_FREINICIOOBRA], bDeshabilitarDatosObra );
  if bDeshabilitarDatosObra then
  begin
    fraAE_ETAPAOBRA.Clear;
    fraAE_PROGRAMASEGURIDAD.Clear;
    edAE_FRECEPCIONOBRA.Clear;
    edAE_FINICIOACTIVIDAD.Clear;
    edAE_SUPERFICIE.Clear;
    edAE_PLANTAS.Clear;
    fraAE_TIPOOBRA.Clear;
    fraAE_ACTIVIDADOBRA.Clear;
    chkAE_PROGRAMAAPROBADO.Checked := false;
    edAE_FFINOBRA.Clear;
    edAE_FSUSPOBRA.Clear;
    edAE_FREINICIOOBRA.Clear;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.edNroDenunciaSRTChange(Sender: TObject);
begin
  if not edNroDenunciaSRT.ReadOnly then
    Do_BuscarDatosDenunciaGrave(0, 1, 0, edNroDenunciaSRT.Text);
end;

procedure TfrmInfInvestigacionAccidentes.fraAE_PROGRAMAChange(Sender: TObject);
begin
  fraAE_IDOPERATIVO.Locked := AreIn(fraAE_PROGRAMA.Codigo, ['B']);
  if fraAE_IDOPERATIVO.Locked or (fraAE_PROGRAMA.Codigo = '')then
    fraAE_IDOPERATIVO.Clear;
end;

procedure TfrmInfInvestigacionAccidentes.fraAE_PROGRAMAEMPRESAChange(Sender: TObject);
begin
  fraAE_IDOPERATIVOEMPRESA.Locked := AreIn(fraAE_PROGRAMAEMPRESA.Codigo, ['B']);
  if fraAE_IDOPERATIVOEMPRESA.Locked or (fraAE_PROGRAMAEMPRESA.Codigo = '') then
    fraAE_IDOPERATIVOEMPRESA.Clear;
end;

procedure TfrmInfInvestigacionAccidentes.SpeedButton1Click(Sender: TObject);
begin
  edAE_EMPRESA.Text                        := fraEmpresa.NombreEmpresa;
  mskAE_CUIT.Text                          := fraEmpresa.CUIT;
  fraAE_IDACTIVIDAD.Codigo                 := fraCO_IDACTIVIDAD.Codigo;
  if not ExisteSql(
          ' SELECT 1 '+
          '   FROM hys.hga_gestionaccidente, sex_expedientes '+
          '  WHERE ex_id = ga_idexpediente '+
          '    AND (ga_calle IS NOT NULL OR ga_cpostal IS NOT NULL OR (ga_provincia <> -1)) '+
          '    AND ex_siniestro = '+ SqlValue(edSiniestro.Siniestro)) then
  begin
    fraDomicilioAccidenteEstabl.CodigoPostal := fraDomicilioEmpresa.CodigoPostal;
    fraDomicilioAccidenteEstabl.CPA          := fraDomicilioEmpresa.CPA;
    fraDomicilioAccidenteEstabl.Calle        := fraDomicilioEmpresa.Calle;
    fraDomicilioAccidenteEstabl.Numero       := fraDomicilioEmpresa.Numero;
    fraDomicilioAccidenteEstabl.Piso         := fraDomicilioEmpresa.Piso;
    fraDomicilioAccidenteEstabl.Departamento := fraDomicilioEmpresa.Departamento;
    fraDomicilioAccidenteEstabl.Localidad    := fraDomicilioEmpresa.Localidad;
    fraDomicilioAccidenteEstabl.Provincia    := fraDomicilioEmpresa.Provincia;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.fraPreventorcmbDescripcionCloseUp(Sender: TObject);
begin
  inherited;
  fraPreventor.cmbDescripcionCloseUp(Sender);

  if not (IsEmptyString(fraPreventor.ID) or fraPreventor.sdqDatos.FieldByName('BAJA').IsNull) then
    InvalidMsg(fraPreventor, 'El preventor no debería ser uno dado de baja.');
end;

procedure TfrmInfInvestigacionAccidentes.FSFormMouseWheel(Sender: TObject;
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
end;

procedure TfrmInfInvestigacionAccidentes.OnFraPreventorChange(
  Sender: TObject);
begin
  with GetQuery(' SELECT * '+
                '   FROM art.pit_firmantes '+
                '  WHERE it_id = '+SqlValue(fraPreventor.Value)) do
  begin
    edAE_TITULO.Text := FieldByName('IT_TITULO').AsString;
    fraAE_TIPOMATRICULA.Codigo := FieldByName('IT_TIPO_MATRICULA').AsString;
    edAE_NUMEROMATRICULA.Text := FieldByName('IT_MATRICULA').AsString;
    edAE_INSTITUCIONOTORGANTE.Text := FieldByName('IT_INSTITUCION_OTORGANTE').AsString;
  end;
end;

procedure TfrmInfInvestigacionAccidentes.mskAE_CUITExit(Sender: TObject);
begin
  fraAE_PROGRAMAEMPRESA.Codigo := ValorSql(
    ' SELECT tb_especial1 '+
    '   FROM art.ctb_tablas '+
    '  WHERE tb_clave = ''TFET'' '+
    '    AND tb_codigo <> ''0'' '+
    '    AND tb_fechabaja IS NULL '+
    '    AND tb_codigo = art.hys.get_tipo_empresa ('+SqlValue(mskAE_CUIT.Text)+', 0)');

  fraAE_IDOPERATIVOEMPRESA.Codigo := ValorSql('select hys.get_operativovigente_empresa(' + SqlValue(mskAE_CUIT.Text) + ') from dual');
  fraAE_PROGRAMAEMPRESAChange(nil);
end;

procedure TfrmInfInvestigacionAccidentes.tbTraerSiniestrosMultiplesClick(
  Sender: TObject);
begin
  Do_InsertarAccidentesMultiples(sdqConsulta.FieldByName('AE_ID').AsInteger, edSiniestro.Siniestro, edSiniestro.Orden);
  if sdqPAM_ACCIDENTEMULTIPLE.Active then
    sdqPAM_ACCIDENTEMULTIPLE.Refresh
  else
    sdqPAM_ACCIDENTEMULTIPLE.Open;
end;

procedure TfrmInfInvestigacionAccidentes.KeepConnTimer(Sender: TObject);
begin
  {para evitar la desconexión por inactividad}
  ValorSql('SELECT 1 FROM DUAL');
end;

procedure TfrmInfInvestigacionAccidentes.btnAplicarClick(Sender: TObject);
begin
  if Validar and DoABM then begin
    if ModoABM = maBaja then begin
      ClearControls( False );
    end else begin
          ModoABM    := maModificacion;
          tbModificar.Enabled := FAllowModify;
          tbEliminar.Enabled  := FAllowDelete;
          tbImprimir.Enabled  := FAllowPrint;
          DataLoaded := True;
    end;
    MsgBox('Los datos se guardaron temporalmente.', MB_ICONINFORMATION);
    btnAplicar.Enabled := False;
    btnAceptar.Enabled := True;
  end;

end;



end.
