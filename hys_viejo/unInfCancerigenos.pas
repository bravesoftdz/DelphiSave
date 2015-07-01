{-----------------------------------------------------------------------------
 Unit Name: unInfCancerigenos
 Author:    racastro
 Date:      25-Jun-2007
 Purpose:   Informe de Cancerígenos - Nueva versión
 History:
-----------------------------------------------------------------------------}

unit unInfCancerigenos;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomPanelABM, Mask, PatternEdit, IntEdit, StdCtrls, ExtCtrls,
  ComCtrls, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl, ToolWin,
  ToolEdit, DateComboBox, unArtFrame, unFraStaticCodigoDescripcion, SqlFuncs,
  unFraStaticCTB_TABLAS, Grids, DBGrids, RXDBCtrl, unfraEstablecimiento,
  unArtDbFrame, unFraEmpresa, FormPanel, unFraTrabajador, ExComboBox,
  unFraCAV_ACTIVIDAD, DBTables, Buttons, ComboEditor, DBComboGrid, DateUtils,
  GroupCheckBox, unArtDBAwareFrame, unFraCodigoDescripcion, unFraActividad,
  DBCtrls, ArtComboBox, ArtDBGrid, unfraEstablecimientoDomic, unFraCodDesc,
  unFraDomicilio, EditNew, CurrEdit, unFraTrabajadorAMP, SortDlg,
  QueryToFile, ExportDialog, RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmInfCancerigenos = class(TfrmCustomPanelABM)
    PageControl: TPageControl;
    tsDatosGenerales: TTabSheet;
    tsTrabajadores: TTabSheet;
    tsProveedores: TTabSheet;
    Label11: TLabel;
    edNumeroInforme: TIntEdit;
    tsSustancias: TTabSheet;
    CoolBar2: TCoolBar;
    tbTrabajadores: TToolBar;
    tbPCTNuevo: TToolButton;
    tbPCTEliminar: TToolButton;
    dbgPCT_CANCERTRABAJADOR: TARTDBGrid;
    fpTrabajadores: TFormPanel;
    Bevel1: TBevel;
    btnTrabAceptar: TButton;
    btnTrabCancelar: TButton;
    lbTrabCUIL: TLabel;
    fraCT_DOCUMENTOTIPO: TfraStaticCTB_TABLAS;
    Label8: TLabel;
    edCT_EDAD: TIntEdit;
    Label26: TLabel;
    Label27: TLabel;
    edCT_ANTIGUEDAD: TIntEdit;
    cmbCT_UNIDAD: TComboBox;
    Label30: TLabel;
    edCT_CATEGORIA: TEdit;
    sdqPCT_CANCERTRABAJADOR: TSDQuery;
    dsPCT_CANCERTRABAJADOR: TDataSource;
    tbPCTModificar: TToolButton;
    btnBuscarInforme: TSpeedButton;
    CoolBar4: TCoolBar;
    tbProvCompradores: TToolBar;
    tbPCPNuevo: TToolButton;
    tbPCPModificar: TToolButton;
    tbPCPEliminar: TToolButton;
    dbgPCP_CANCERPROVEEDOR: TARTDBGrid;
    Splitter2: TSplitter;
    sdqPCP_CANCERPROVEEDOR: TSDQuery;
    dsPCP_CANCERPROVEEDOR: TDataSource;
    fpPCP_CANCERPROVEEDOR: TFormPanel;
    Bevel6: TBevel;
    Label32: TLabel;
    Label38: TLabel;
    btnPCPAceptar: TButton;
    btnPCPCancelar: TButton;
    edCP_NOMBRE: TEdit;
    edCP_PARTIDO: TEdit;
    edCP_CUIT: TMaskEdit;
    Label31: TLabel;
    Label41: TLabel;
    edCP_TELEFONO: TEdit;
    Label42: TLabel;
    cmbCP_INDICADOR: TComboBox;
    sdqPCD_CANCERPRODUCTOS: TSDQuery;
    dsPCD_CANCERPRODUCTOS: TDataSource;
    fpPCD_CANCERPRODUCTOS: TFormPanel;
    Bevel7: TBevel;
    bntPCDAceptar: TButton;
    bntPCDCancelar: TButton;
    CoolBar6: TCoolBar;
    tbSustancias: TToolBar;
    tbPCSNuevo: TToolButton;
    tbPCSModificar: TToolButton;
    tbPCSEliminar: TToolButton;
    dbgPCS_CANCERSUSTANCIA: TARTDBGrid;
    sdqPCS_CANCERSUSTANCIA: TSDQuery;
    dsPCS_CANCERSUSTANCIA: TDataSource;
    fpPCS_CANCERSUSTANCIA: TFormPanel;
    Bevel8: TBevel;
    btnPCSAceptar: TButton;
    btnPCSCancelar: TButton;
    Label47: TLabel;
    fraCS_CODIGO: TfraCodigoDescripcion;
    chkCS_INFORMACION: TCheckBox;
    chkCS_CAPACITACION: TCheckBox;
    Bevel9: TBevel;
    Label46: TLabel;
    edCS_ESTUDIOS: TMemo;
    Label48: TLabel;
    edCS_MEDIDAS: TMemo;
    Bevel10: TBevel;
    tsProductosSector: TTabSheet;
    sdqPCX_CANCERSUSTTRAB: TSDQuery;
    dsPCX_CANCERSUSTTRAB: TDataSource;
    CoolBar8: TCoolBar;
    tbProdSector: TToolBar;
    tbPCXNuevo: TToolButton;
    tbPCXModificar: TToolButton;
    tbPCXEliminar: TToolButton;
    dbgPCX_CANCERSUSTTRAB: TARTDBGrid;
    fpPCU_CANCERUSOSUSTANCIAS: TFormPanel;
    Bevel14: TBevel;
    btnPCUAceptar: TButton;
    btnPCUCancelar: TButton;
    Bevel15: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    edCU_OTROS_MODOS_EMPLEO: TMemo;
    Label82: TLabel;
    Label83: TLabel;
    edAutoCO_ANTIGUEDAD: TIntEdit;
    cmbAutoCO_UNIDAD: TComboBox;
    btnPCPTomarDatos: TSpeedButton;
    ScrollBox: TScrollBox;
    Label24: TLabel;
    gbInforme: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    lbInfExportado: TLabel;
    edCI_ID: TEdit;
    edCI_FECHA: TDateComboBox;
    gbResponsable: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edCI_RESP_CUILCUIT: TMaskEdit;
    edCI_RESP_NOMBRE: TEdit;
    fraCI_RESP_TIPODOCUMENTO: TfraStaticCTB_TABLAS;
    fraCI_REPRESENTACION: TfraStaticCTB_TABLAS;
    gbPersonal: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel3: TBevel;
    edCI_PERS_ADMINISTRACION: TIntEdit;
    edCI_PERS_PRODUCCION: TIntEdit;
    edCI_PERS_TOTAL: TIntEdit;
    gbEmpresa: TGroupBox;
    Label98: TLabel;
    fraCE_CUIT: TfraEmpresa;
    CUIT: TLabel;
    fraEstablecimiento: TfraEstablecimientoDomic;
    sdqEmpresa: TSDQuery;
    Label53: TLabel;
    Bevel13: TBevel;
    lbCX_TRAB_PERMANENTE: TLabel;
    edCX_TRAB_PERMANENTE: TIntEdit;
    lbCX_TRAB_NOPERMANENTE1: TLabel;
    edCX_TRAB_NOPERMANENTE1: TIntEdit;
    lbCX_TRAB_NOPERMANENTE2: TLabel;
    edCX_TRAB_NOPERMANENTE2: TIntEdit;
    CoolBar5: TCoolBar;
    ToolBar5: TToolBar;
    tbPCDNuevo: TToolButton;
    tbPCDModificar: TToolButton;
    tbPCDEliminar: TToolButton;
    dbgPCD_CANCERPRODUCTOS: TArtDBGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label13: TLabel;
    Label14: TLabel;
    grbEstAmb: TGroupBox;
    grbEstBio: TGroupBox;
    chkEstAmbCC_DETERMINACIONES: TCheckBox;
    Label91: TLabel;
    cmbEstAmbCC_FRECUENCIA: TExComboBox;
    chkEstBioCC_DETERMINACIONES: TCheckBox;
    Label94: TLabel;
    cmbEstBioCC_FRECUENCIA: TExComboBox;
    grbExamenes: TGroupBox;
    chkCS_EXAMEN_PREOCUPACIONAL: TCheckBox;
    chkCS_EXAMEN_PERIODICO: TCheckBox;
    chkCS_EXAMEN_EGRESO: TCheckBox;
    Label16: TLabel;
    fraSectores: TfraCodigoDescripcion;
    edNombreComercial: TEdit;
    GroupBox7: TGroupBox;
    chkMatPrima: TCheckBox;
    chkProdFinal: TCheckBox;
    chkAlmacenamiento: TCheckBox;
    chkOtros: TCheckBox;
    Label17: TLabel;
    fraUsos: TfraCodigoDescripcion;
    Bevel2: TBevel;
    fraSectoresTrab: TfraCodDesc;
    Bevel4: TBevel;
    fraDomicilio: TfraDomicilio;
    Label78: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label80: TLabel;
    Label74: TLabel;
    lbCPostalA: TLabel;
    edCPA: TEdit;
    edCiuu: TEdit;
    Label18: TLabel;
    Label56: TLabel;       
    cmbCU_UNIDAD: TComboBox;
    fraProdSector: TfraCodDesc;
    Label15: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    edNombreCom: TEdit;
    sbManTrab: TSpeedButton;
    sbManUsos: TSpeedButton;
    sbMantSectores: TSpeedButton;
    edCU_CANTIDAD: TRxCalcEdit;
    lblRelacion: TLabel;
    tsDenuncias: TTabSheet;
    tbDenuncias: TToolButton;
    rgTipoIntervencion: TRadioGroup;
    dbgDenuncias: TArtDBGrid;
    tbDen: TToolBar;
    tbDenNuevo: TToolButton;
    tbDenModificar: TToolButton;
    tbDenEliminar: TToolButton;
    sdqDenuncias: TSDQuery;
    dsDenuncias: TDataSource;
    fpDenuncia: TFormPanel;
    Bevel5: TBevel;
    btnAceptarDen: TButton;
    btnCancelarDen: TButton;
    fraMotivos: TfraCodigoDescripcion;
    Label21: TLabel;
    fraSustanciasDen: TfraCodDesc;
    Label22: TLabel;
    sbMantIncumplimientos: TSpeedButton;
    edFechaDenuncia: TDateComboBox;
    Label20: TLabel;
    fraTrabajador: TfraTrabajadorAMP;
    fraProductos: TfraCodDesc;
    redOtrosModos: TRichEdit;
    rgTipoInforme: TRadioGroup;
    lblMsgBaja: TLabel;
    chbDenunciarPersonal: TCheckBox;
    chbDenunciarResponsable: TCheckBox;
    chbDenunciarEmpresa: TCheckBox;
    gbOtrasDenuncias: TGroupBox;
    memObsDen1: TMemo;
    memObsDen2: TMemo;
    memObsDen3: TMemo;
    memObsDen4: TMemo;
    memObsDen5: TMemo;
    chbDenunciarServMedLab: TCheckBox;
    chbDenunciarServHyS: TCheckBox;
    memObsDenuncia: TMemo;
    Label23: TLabel;
    fpMotivoBajaDenuncia: TFormPanel;
    Bevel11: TBevel;
    Button1: TButton;
    Button2: TButton;
    memMotivoBaja: TMemo;
    tbTrabajadoresUltRelev: TToolButton;
    tbTablaPer: TToolButton;
    Label25: TLabel;
    Label28: TLabel;
    tbOrdenar: TToolButton;
    tbExportar: TToolButton;
    SortDialog: TSortDialog;
    ExportDialog: TExportDialog;
    fpMotivoBaja: TFormPanel;
    Bevel12: TBevel;
    btnAceptarMotivoBaja: TButton;
    btnCancelarMotivoBaja: TButton;
    chbSinInformar: TCheckBox;
    tbExcluirCancerigenos: TToolButton;
    edFechaRecepcion: TDateComboBox;
    Label29: TLabel;
    tbReplicar: TToolButton;
    procedure edNumeroInformeKeyPress(Sender: TObject; var Key: Char);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure LimpiarDatosTrabajador;
    procedure tbPCTNuevoClick(Sender: TObject);
    procedure tbPCTModificarClick(Sender: TObject);
    procedure tbPCTEliminarClick(Sender: TObject);
    procedure btnTrabAceptarClick(Sender: TObject);
    procedure dbgPCT_CANCERTRABAJADORGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure tbPCPNuevoClick(Sender: TObject);
    procedure tbPCPModificarClick(Sender: TObject);
    procedure tbPCPEliminarClick(Sender: TObject);
    procedure btnPCPAceptarClick(Sender: TObject);
    procedure tbPCDNuevoClick(Sender: TObject);
    procedure tbPCDModificarClick(Sender: TObject);
    procedure tbPCDEliminarClick(Sender: TObject);
    procedure bntPCDAceptarClick(Sender: TObject);
    procedure dbgPCT_CANCERTRABAJADORDblClick(Sender: TObject);
    procedure dbgPCP_CANCERPROVEEDORGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure dbgPCP_CANCERPROVEEDORDblClick(Sender: TObject);
    procedure dbgPCD_CANCERPRODUCTOSGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgPCD_CANCERPRODUCTOSDblClick(Sender: TObject);
    procedure tbPCSNuevoClick(Sender: TObject);
    procedure tbPCSModificarClick(Sender: TObject);
    procedure tbPCSEliminarClick(Sender: TObject);
    procedure btnPCSAceptarClick(Sender: TObject);
    procedure dbgPCS_CANCERSUSTANCIAGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure dbgPCS_CANCERSUSTANCIADblClick(Sender: TObject);
    procedure tbPCXNuevoClick(Sender: TObject);
    procedure tbPCXModificarClick(Sender: TObject);
    procedure tbPCXEliminarClick(Sender: TObject);
    procedure dbgPCX_CANCERSUSTTRABDblClick(Sender: TObject);
    procedure dbgPCX_CANCERSUSTTRABGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure btnPCUAceptarClick(Sender: TObject);
    procedure btnBuscarInformeClick(Sender: TObject);
    procedure edNumeroInformeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCI_PERS_ADMINISTRACIONChange(Sender: TObject);
    procedure ShortCutNuevo(Sender: TObject);
    procedure ShortCutModificar(Sender: TObject);
    procedure ShortCutEliminar(Sender: TObject);
    procedure btnPCTTomarDatosClick(Sender: TObject);
    procedure edCT_CUILKeyPress(Sender: TObject; var Key: Char);
    procedure chkEstAmbCC_DETERMINACIONESClick(Sender: TObject);
    procedure chkEstBioCC_DETERMINACIONESClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure btnPCPTomarDatosClick(Sender: TObject);
    procedure chkEstAmbCC_DETERMINACIONESExit(Sender: TObject);
    procedure chkEstBioCC_DETERMINACIONESExit(Sender: TObject);
    procedure fraEstablecimientoExit(Sender: TObject);
    procedure sbManTrabClick(Sender: TObject);
    procedure fraDomiciliobtnBuscarClick(Sender: TObject);
    procedure sbManUsosClick(Sender: TObject);
    procedure sbMantSectoresClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure tbDenunciasClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure dbgDenunciasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbDenNuevoClick(Sender: TObject);
    procedure tbDenModificarClick(Sender: TObject);
    procedure sbMantIncumplimientosClick(Sender: TObject);
    procedure btnAceptarDenClick(Sender: TObject);
    procedure tbDenEliminarClick(Sender: TObject);
    procedure fraTrabajadormskCUILChange(Sender: TObject);
    procedure fraTrabajadormskCUILKeyPress(Sender: TObject; var Key: Char);
    procedure fraProdSectorcmbDescripcionChange(Sender: TObject);
    procedure sdqPCX_CANCERSUSTTRABAfterScroll(DataSet: TDataSet);
    procedure tbModificarClick(Sender: TObject);
    procedure chbDenunciarResponsableClick(Sender: TObject);
    procedure chbDenunciarPersonalClick(Sender: TObject);
    procedure chbDenunciarServMedLabClick(Sender: TObject);
    procedure chbDenunciarEmpresaClick(Sender: TObject);
    procedure chbDenunciarServHySClick(Sender: TObject);
    procedure fpDenunciaShow(Sender: TObject);
    procedure fpMotivoBajaDenunciaShow(Sender: TObject);
    procedure tbTablaPerClick(Sender: TObject);
    procedure tbTrabajadoresUltRelevClick(Sender: TObject);
    procedure fraEstablecimientoedCodigoKeyPress(Sender: TObject;
      var Key: Char);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbExcluirCancerigenosClick(Sender: TObject);
    procedure tbReplicarClick(Sender: TObject);
    procedure cbNoPresentacionAnexo415Click(Sender: TObject);
//    procedure cbNoAlcanzadoResolucionClick(Sender: TObject);
  private
    ModoABMTablas: TModoABM;
    FDenuncia,
    FDataModified: Boolean;
    FProdAnt: Integer;
    FTipoAnterior,
    FSectorAnt: Integer;
    FUsoAnt : Integer;
    FIdDenuncia : Integer;
    procedure VerificarAsociacionDeProductos;
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnfraProductosChange(Sender: TObject);
    procedure OnfraEstablecimientoChange(Sender: TObject);
    procedure SetCE_ID(AId: integer);
    procedure DoDarDeBaja(ADataSet: TDataSet; APrefijo, ATabla: string);
    procedure DoButtonClick(AButtonName: string);
  protected
    procedure ClearControls(ClearPK : Boolean = False); override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  public
  end;

implementation

uses
  unPrincipal, AnsiSql, CustomDlgs, unDmPrincipal, Cuit, StrFuncs,
  DBFuncs, General, VclExtra, unDlgBusInforme, ValFuncs, unArt, ArtFuncs,
  DateTimeFuncs, unContratoTrabajador, unManUsosProductos,
  unManSectores, unManIncumplimientos, unMoldeEnvioMail, unTablaPeriodica,
  unExcluirCancerigenos, unSesion;

const
  PAGE_DATOSGENERALES   = 0;
  PAGE_SUSTANCIAS       = 1;
  PAGE_SUSTANCIA_SECTOR = 2;
  PAGE_TRABAJADORES     = 3;
  PAGE_PROVEEDORES      = 4;
  PAGE_DENUNCIAS        = 5;

  UNIDAD_TIEMPO: array[0..2] of string = ('D', 'M', 'A');
  TIPO_PCP: array[0..1] of string = ('C', 'P');
  TIPO_PCC: array[0..1] of string = ('A', 'B');
  UNIDAD_PCU: array[0..5] of string = ('G', 'K', 'T', 'L', 'C', 'M');
  FRECUENCIA_PCC: array[0..3] of string = ('1', '2', '3', '4');

{$R *.DFM}

// Empecemos de nuevo

{-----------------------------------------------------------------------------
  Procedure:   FSFormCreate
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Al crear el formulario
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.FSFormCreate(Sender: TObject);
begin
  inherited;

  FDenuncia := false;
  tbDenuncias.Left := tbEliminar.Left -1;
  tbTablaPer.Left := tbEliminar.Left -1;
  tbExcluirCancerigenos.Left := tbEliminar.Left -1;
  tbReplicar.Left := tbEliminar.Left -1;
  PageControl.ActivePageIndex := PAGE_DATOSGENERALES;
  lblMsgBaja.Caption := '';

  ShortCutControl.ShortCuts[0].OnShortCutPress := ShortCutNuevo;
  ShortCutControl.ShortCuts[1].OnShortCutPress := ShortCutModificar;
  ShortCutControl.ShortCuts[2].OnShortCutPress := ShortCutEliminar;

  UnTouch := TList.Create;
  UnTouch.Add( edCI_ID );
  UnTouch.Add( edCI_PERS_TOTAL );

  fraCI_RESP_TIPODOCUMENTO.Clave := 'TDOCN';

  fraCI_REPRESENTACION.Clave      := 'TREPR';
  fraCI_REPRESENTACION.AutoFilter := True;
  fraCT_DOCUMENTOTIPO.Clave       := 'TDOCN';

  fraCE_CUIT.OnChange       := OnEmpresaChange;
  fraCE_CUIT.ShowBajas      := True;
  fraCE_CUIT.ExtraCondition := '     AND co_contrato = '+
                               ' (SELECT MAX (b.co_contrato) '+
                               '    FROM aco_contrato b '+
                               '   WHERE b.co_idempresa = em_id '+
                               '     AND NOT EXISTS (SELECT 1 '+
                               '    FROM art.abc_bajadecontrato '+
                               '   WHERE b.co_contrato = bc_contrato)) ';

  fraEstablecimiento.ShowBajas := True;
  rgTipoIntervencion.Visible := False;

  with fraCS_CODIGO do
  begin
    TableName      := 'PRG_RIESGOS';
    FieldID        := 'RG_ID';
    FieldCodigo    := 'rg_esop || rg_sufijoesop';
    FieldDesc      := 'RG_DESCRIPCION';
    FieldBaja      := 'RG_FECHABAJA';
    ExtraCondition := ' AND RG_CANCERIGENO = ''S'' ';
    ExtraFields    := ', RG_CODIGO ';
    IDType         := ctInteger;
  end;

  with fraSectores do
  begin
    TableName      := 'hys.pce_cansector';
    FieldID        := 'ce_id';
    FieldCodigo    := 'ce_id';
    FieldDesc      := 'ce_descripcion';
    FieldBaja      := 'ce_fechabaja';
    IDType         := ctInteger;
  end;

  with fraUsos do
  begin
    TableName      := 'hys.pcu_canusoproducto';
    FieldID        := 'cu_id';
    FieldCodigo    := 'cu_id';
    FieldDesc      := 'cu_descripcion';
    FieldBaja      := 'cu_fechabaja';
    IDType         := ctInteger;
  end;

  with fraMotivos do
  begin
    TableName      := 'hys.pcn_canincumplimientos';
    FieldID        := 'cn_id';
    FieldCodigo    := 'cn_id';
    FieldDesc      := 'cn_descripcion';
    FieldBaja      := 'cn_fechabaja';
    IDType         := ctInteger;
  end;

  fraEstablecimiento.OnChange := OnfraEstablecimientoChange;
end;
{-----------------------------------------------------------------------------
  Procedure:   FSFormClose
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject; var Action: TCloseAction
  Result:      None
  Description: Al cerrar el formulario
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FDataModified Then
  begin
    Action := caNone;
    case MsgBox('¿Desea guardar los cambios?', MB_ICONQUESTION + MB_YESNOCANCEL) of
      IDYES: if not DoABM Then
               Exit;
      IDCANCEL: Exit;
    end;
  end;

  inherited;

  frmPrincipal.mnuInformeCancerigenos.Enabled := True;
end;
{-----------------------------------------------------------------------------
  Procedure:   PageControlChange
  Author:      racastro
  Date:        04-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Cambio de Tab
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.PageControlChange(Sender: TObject);
begin
  sdqPCS_CANCERSUSTANCIA.Active := True;
  sdqPCP_CANCERPROVEEDOR.Active := True;
  sdqPCD_CANCERPRODUCTOS.Active := True;
  sdqPCX_CANCERSUSTTRAB.Active  := True;
  sdqPCT_CANCERTRABAJADOR.Active:= True;
  redOtrosModos.Lines.Clear;
  sdqDenuncias.Active:= True;

  case PageControl.ActivePageIndex of
    PAGE_SUSTANCIAS      : dbgPCS_CANCERSUSTANCIA.SetFocus;
    PAGE_SUSTANCIA_SECTOR: dbgPCX_CANCERSUSTTRAB.SetFocus;
    PAGE_TRABAJADORES    : dbgPCT_CANCERTRABAJADOR.SetFocus;
    PAGE_PROVEEDORES     : dbgPCP_CANCERPROVEEDOR.SetFocus;
    PAGE_DENUNCIAS       : dbgDenuncias.SetFocus;
  end;

  with fraSectoresTrab do
  begin
    ShowBajas := true;
    Clear;
    Propiedades.SQL:= 'SELECT DISTINCT ce_id as id, ce_id as codigo, ce_descripcion as descripcion, ce_fechabaja as baja ' +
                      '           FROM hys.pce_cansector, hys.pps_canproductosector ' +
                      '          WHERE ce_id = ps_idsector ' +
                      '            AND ps_idcaninforme = ' + SqlValue (edNumeroInforme.Value);
    IDType         := ctInteger;
  end;

  with fraProdSector do
  begin
    ShowBajas := true;
    Clear;
    Propiedades.SQL:= 'SELECT NVL(cd_id, 999) AS ID, NVL(cd_id,999) AS codigo, ' +
                      '       rg_descripcion || '' - '' || cd_nombre_comercial AS descripcion, ' +
                      '       cd_fechabaja AS baja, cd_nombre_comercial, rg_id ' +
                      '  FROM hys.pcs_cansubstancia, hys.pcd_canproductos, art.prg_riesgos ' +
                      ' WHERE rg_id = cs_idsubstancia ' +
                      '   AND cd_idsubstancia(+) = cs_idsubstancia ' +
                      '   AND cs_idcaninforme = ' + SqlValue (edNumeroInforme.Value);

    IDType         := ctInteger;
  end;

  with fraSustanciasDen do
  begin
    ShowBajas := true;
    Clear;
    Propiedades.SQL:= 'SELECT rg_id AS ID, rg_id AS codigo, rg_descripcion AS descripcion, ' +
                      '       cs_fechabaja AS baja ' +
                      '  FROM hys.pcs_cansubstancia, art.prg_riesgos ' +
                      ' WHERE rg_id = cs_idsubstancia ' +
                      '   AND cs_idcaninforme = ' + SqlValue (edNumeroInforme.Value);
    IDType         := ctInteger;
  end;

  with fraProductos do
  begin
    ShowBajas := true;
    Clear;
(* reemplazado 06/08/08
    Propiedades.SQL:= 'SELECT NVL(cd_id, 999) AS ID, NVL(cd_id,999) AS codigo, ' +
                      '       rg_descripcion || '' - '' || cd_nombre_comercial AS descripcion, ' +
                      '       cd_fechabaja AS baja, cd_nombre_comercial, rg_id ' +
                      '  FROM hys.pcs_cansubstancia, hys.pcd_canproductos, art.prg_riesgos ' +
                      ' WHERE rg_id = cs_idsubstancia ' +
                      '   AND cd_idsubstancia(+) = cs_idsubstancia ' +
                      '   AND cs_idcaninforme = ' + SqlValue (edNumeroInforme.Value);
*)
    Propiedades.SQL:= 'SELECT   cd_id AS ID, cd_id AS codigo, ' +
                      '         rg_descripcion || '' - '' || cd_nombre_comercial AS descripcion, ' +
                      '         cd_fechabaja AS baja, cd_nombre_comercial, rg_id ' +
                      '    FROM hys.pcs_cansubstancia, hys.pcd_canproductos, art.prg_riesgos ' +
                      '   WHERE rg_id = cs_idsubstancia ' +
                      '     AND cd_idsubstancia = cs_idsubstancia ' +
                      '     AND cs_idcaninforme =  ' + SqlValue (edNumeroInforme.Value) +
                      '     AND NOT EXISTS(SELECT 1 ' +
                      '                      FROM hys.pps_canproductosector ' +
                      '                     WHERE ps_fechabaja IS NULL ' +
                      '                       AND ps_idcaninforme = cs_idcaninforme) ' +
                      'UNION ' +
                      'SELECT   cd_id AS ID, cd_id AS codigo, ' +
                      '         rg_descripcion || '' - '' || cd_nombre_comercial ' +
                      '         || '' - '' || cu_descripcion AS descripcion, ' +
                      '         cd_fechabaja AS baja, cd_nombre_comercial, rg_id ' +
                      '    FROM art.prg_riesgos, hys.pcu_canusoproducto, hys.pcd_canproductos, ' +
                      '         hys.pps_canproductosector ' +
                      '   WHERE rg_id = cd_idsubstancia ' +
                      '     AND cu_id = ps_iduso ' +
                      '     AND cd_id = ps_idproducto ' +
                      '     AND ps_idcaninforme = ' + SqlValue (edNumeroInforme.Value) +
                      '     AND ps_fechabaja IS NULL '+
                      'UNION '+
                      'SELECT cd_id AS ID, cd_id AS codigo, rg_descripcion || '' - '' || cd_nombre_comercial || '' - '' || cu_descripcion AS descripcion, '+
                      '       cd_fechabaja AS baja, cd_nombre_comercial, rg_id '+
                      '  FROM hys.pcr_canprovprod, hys.pcu_canusoproducto, hys.pcd_canproductos, hys.pps_canproductosector, art.prg_riesgos, '+
                      '       hys.pcp_canproveedor '+
                      ' WHERE cd_id = cd_idproducto '+
                      '   AND rg_id = cd_idsubstancia '+
                      '   AND cu_id = ps_iduso '+
                      '   AND ps_idcaninforme = cp_idcaninforme '+
                      '   AND cd_idproveedor = cp_id '+
                      '   AND cp_idcaninforme = ' + SqlValue (edNumeroInforme.Value) +
                      '   AND ps_fechabaja IS NULL ';

    IDType         := ctInteger;
    OnChange       := OnfraProductosChange;
  end;

  fraTrabajador.Contrato := fraCE_CUIT.Contrato;
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimiento.CUIT := fraCE_CUIT.CUIT;
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.OnfraProductosChange(Sender: TObject);
begin
  edNombreCom.Text := fraProductos.sdqDatos.FieldByName('cd_nombre_comercial').AsString // fraProductos.Descripcion;
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.OnfraEstablecimientoChange(Sender: TObject);
begin
  if fraEstablecimiento.IsSelected then
  begin
    edCPA.Text := fraEstablecimiento.CPostalA;
    edCiuu.Text := fraEstablecimiento.Actividad;
  end;
end;
{-----------------------------------------------------------------------------
  Procedure:   DoDarDeBaja
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   ADataSet: TDataSet; APrefijo, ATabla: string;
  Result:      None
  Description: Baja genérica
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.DoDarDeBaja(ADataSet: TDataSet; APrefijo, ATabla: string);
var
  sSql : String;
begin
  if ADataSet.IsEmpty then
    Exit
  else // Permite modificar datos de la baja si es la tabla de trabajadores
    if (APrefijo <> 'CT') and (not ADataSet.FieldByName(APrefijo + '_FECHABAJA').IsNull) then
      Exit;

  if APrefijo <> 'CR' then
  begin
    if ExisteSql ('SELECT 1 FROM ' + ATabla +
                  ' WHERE ' + APrefijo + '_ID = ' + SqlValue(ADataSet.FieldByName(APrefijo + '_ID').AsInteger) +
                  '   AND ' + APrefijo + '_FECHAEXPORT IS NOT NULL') then
    begin
      MsgBox('El registro ha sido informado a la SRT. No puede darse de baja.', MB_ICONERROR + MB_Ok);
      Exit
    end
  end
  else
    if ExisteSql ('SELECT 1 FROM hys.pcp_canproveedor' +
                  ' WHERE CP_ID = ' + SqlValue(ADataSet.FieldByName('CP_ID').AsInteger) +
                  '   AND CP_FECHAEXPORT IS NOT NULL') then
    begin
      MsgBox('El registro ha sido informado a la SRT. No puede darse de baja.', MB_ICONERROR + MB_Ok);
      Exit;
    end;

  if MsgAsk('¿Desea dar de baja el registro seleccionado?') then
  begin
    BeginTrans;
    try
      sSql := 'UPDATE ' + ATabla +
              '   SET ' + APrefijo + '_fechabaja = SYSDATE, ' +
              // Para la tabla de trabajadores, define el tipo de baja
              iif (APrefijo = 'CT',
                   iif(chbSinInformar.Checked,
                       ' ct_bajanoinformado = ''S'', ',
                       ' ct_bajanoinformado = NULL, '),
                   '') +
              '       ' + APrefijo + '_usubaja = ' + SqlValue(frmPrincipal.DBLogin.UserID) +
              ' WHERE ' + APrefijo + '_id = ' + SqlValue(ADataSet.FieldByName(APrefijo + '_id').AsInteger);


      EjecutarSqlST (sSql);
      CommitTrans;

      ADataSet.Refresh
    except
      on E: Exception do begin
        ErrorMsg(E, 'Error al dar de baja el registro');
        Rollback;
      end;
    end
  end;
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.ShortCutNuevo(Sender: TObject);
begin
  if ModoABM = maNone Then
    tbNuevoClick(Nil)
  else
    DoButtonClick('Nuevo');
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.ShortCutModificar(Sender: TObject);
begin
  if ModoABM = maNone then
    tbModificarClick(nil)
  else
    DoButtonClick('Modificar');
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.ShortCutEliminar(Sender: TObject);
begin
  if ModoABM = maNone then
    tbEliminarClick(nil)
  else
    DoButtonClick('Eliminar');
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.DoButtonClick(AButtonName: string);
var
  AComponent: TComponent;
begin
  if ActiveControl is TDBGrid then
  begin
    AButtonName := 'tb' + Copy(ActiveControl.Name,4, 3) + AButtonName;
    AComponent := FindComponent(AButtonName);
    if Assigned(AComponent) and (AComponent is TToolButton) Then
      TToolButton(AComponent).OnClick(Self);
  end;
end;
{-----------------------------------------------------------------------------}
// Tratamiento del Nº de informe
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.edNumeroInformeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (Shift = [ssAlt]) Then
    btnBuscarInformeClick(Nil);
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.edNumeroInformeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    PageControl.ActivePageIndex := PAGE_DATOSGENERALES;
    PKChange(edNumeroInforme.Value <> 0);

    VerificarAsociacionDeProductos;
  end;
end;
{-----------------------------------------------------------------------------
  Procedure:   btnBuscarInformeClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Búsqueda del informe
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.btnBuscarInformeClick(Sender: TObject);
var
  iIdInforme: Integer;
begin
  iIdInforme := GetIdInformeCancerigenos;
  if iIdInforme = -1 Then
    edNumeroInforme.Clear
  else
    edNumeroInforme.Value := iIdInforme;

  with sdqConsulta do
  begin
    Close;
    ParamByName ('ci_id').Value := edNumeroInforme.Value;
    Open
  end;

  PKChange(edNumeroInforme.Value <> 0);
end;
{-----------------------------------------------------------------------------
  Procedure:   SetCE_ID
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   AId: integer
  Result:      None
  Description: Establezco índice para las tablas
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.SetCE_ID(AId: integer);
  procedure SetID(ADataSet: TSDQuery);
  begin
    ADataSet.Close;
    ADataSet.ParamByName('CI_ID').AsInteger := AId;
  end;
begin
  SetID(sdqConsulta);
  SetId(sdqPCS_CANCERSUSTANCIA);
  SetID(sdqPCP_CANCERPROVEEDOR);
  SetId(sdqPCX_CANCERSUSTTRAB);
  SetID(sdqPCT_CANCERTRABAJADOR);
  SetID(sdqDenuncias);
end;
{-----------------------------------------------------------------------------
  Procedure:   ClearControls
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   ClearPK: Boolean
  Result:      None
  Description: Limpio Datos Informe
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.ClearControls(ClearPK: Boolean);
begin
  gbResponsable.Visible := not FDenuncia;
  gbPersonal.Visible := not FDenuncia;
  gbOtrasDenuncias.Visible := not FDenuncia;
  tsDenuncias.TabVisible := not FDenuncia;
  tsProductosSector.TabVisible := not FDenuncia;
  tsProveedores.TabVisible := not FDenuncia;
  tsSustancias.TabVisible := not FDenuncia;
  tsTrabajadores.TabVisible := not FDenuncia;
  rgTipoIntervencion.Visible := FDenuncia;

  FDataModified := False;
  edNumeroInforme.Clear;
  fraCE_CUIT.Clear;
  fraEstablecimiento.Clear;
  edCI_ID.Clear;
  edCI_FECHA.Clear;
  edFechaRecepcion.Clear;
  edCI_PERS_ADMINISTRACION.Clear;
  edCI_PERS_PRODUCCION.Clear;
  edCI_PERS_TOTAL.Clear;
  edCI_RESP_CUILCUIT.Clear;
  edCI_RESP_NOMBRE.Clear;
  fraCI_RESP_TIPODOCUMENTO.Clear;
  fraCI_REPRESENTACION.Clear;
  rgTipoInforme.ItemIndex := -1;
  rgTipoIntervencion.ItemIndex := 0;
  SetCE_ID(0);
  PageControl.ActivePageIndex := PAGE_DATOSGENERALES;
  edCPA.Clear;
  edCiuu.Clear;

  //cbNoAlcanzadoResolucion.Checked := False;
  //cbNoPresentacionAnexo415.Checked := False;

  chbDenunciarEmpresa.Checked := false;
  chbDenunciarResponsable.Checked := false;
  chbDenunciarPersonal.Checked := false;
  chbDenunciarServMedLab.Checked := false;
  chbDenunciarServHyS.Checked := false;

  memObsDen1.Clear;
  memObsDen2.Clear;
  memObsDen3.Clear;
  memObsDen4.Clear;
  memObsDen5.Clear;

  ActiveControl := edNumeroInforme;

  inherited;
end;
{-----------------------------------------------------------------------------
  Procedure:   LoadControls
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   None
  Result:      None
  Description: Leo Datos Informe
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.LoadControls;
begin
  SetCE_ID(edNumeroInforme.Value);

  with sdqConsulta do
  begin
    Open;

    if IsEmpty Then
    begin
      FDenuncia := false;
      ClearControls(True)
    end
    else begin
      FDenuncia := FieldByName('CI_ID').AsInteger >= 900000;

      FDataModified := False;
      fraCE_CUIT.CUIT := FieldByName('em_cuit').AsString;
      fraEstablecimiento.Cargar(FieldByName('em_cuit').AsString,
                                FieldByName('es_nroestableci').AsString);
      edCI_ID.Text                   := FieldByName('CI_ID').AsString;
      edCI_FECHA.Date                := FieldByName('CI_FECHA').AsDateTime;
      edFechaRecepcion.Date          := FieldByName('CI_FECHARECEPCION').AsDateTime;
      edCI_RESP_CUILCUIT.Text        := FieldByName('CI_RESP_CUILCUIT').AsString;
      edCI_RESP_NOMBRE.Text          := FieldByName('CI_RESP_NOMBRE').AsString;
      fraCI_RESP_TIPODOCUMENTO.Value := FieldByName('CI_RESP_TIPODOCUMENTO').AsString;
      fraCI_REPRESENTACION.Value     := FieldByName('CI_REPRESENTACION').AsString;
      edCI_PERS_ADMINISTRACION.Value := FieldByName('CI_PERS_ADMINISTRACION').AsInteger;
      edCI_PERS_PRODUCCION.Value     := FieldByName('CI_PERS_PRODUCCION').AsInteger;
      edCI_PERS_TOTAL.Value          := edCI_PERS_ADMINISTRACION.Value + edCI_PERS_PRODUCCION.Value;
      rgTipoInforme.ItemIndex        := FieldByName('CI_TIPOINFORME').AsInteger;
      FTipoAnterior                  := rgTipoInforme.ItemIndex;
      rgTipoIntervencion.ItemIndex   := FieldByName('CI_TIPOINTERVENCION').AsInteger;
      edCPA.Text                     := fraEstablecimiento.CPostalA;
      edCiuu.Text                    := fraEstablecimiento.Actividad;

      //cbNoAlcanzadoResolucion.Checked  := FieldByName('CI_NOALCANZADORESOLUCION').AsString = 'S';
      //cbNoPresentacionAnexo415.Checked := FieldByName('CI_NOPRESENTACIONAN415').AsString = 'S';

      chbDenunciarEmpresa.Checked := ExisteSqlEx('SELECT 1 ' +
                                                 '  FROM hys.pcd_caninformedenuncia ' +
                                                 ' WHERE cd_idcaninforme = :ci_id ' +
                                                 '   AND cd_fechabaja IS NULL ' +
                                                 '   AND cd_idmotivo = 2', [edNumeroInforme.Value]);
      chbDenunciarResponsable.Checked := ExisteSqlEx('SELECT 1 ' +
                                                     '  FROM hys.pcd_caninformedenuncia ' +
                                                     ' WHERE cd_idcaninforme = :ci_id ' +
                                                     '   AND cd_fechabaja IS NULL ' +
                                                     '   AND cd_idmotivo = 3', [edNumeroInforme.Value]);
      chbDenunciarPersonal.Checked := ExisteSqlEx('SELECT 1 ' +
                                                  '  FROM hys.pcd_caninformedenuncia ' +
                                                  ' WHERE cd_idcaninforme = :ci_id ' +
                                                  '   AND cd_fechabaja IS NULL ' +
                                                  '   AND cd_idmotivo = 4', [edNumeroInforme.Value]);
      chbDenunciarServMedLab.Checked := ExisteSqlEx('SELECT 1 ' +
                                                    '  FROM hys.pcd_caninformedenuncia ' +
                                                    ' WHERE cd_idcaninforme = :ci_id ' +
                                                    '   AND cd_fechabaja IS NULL ' +
                                                    '   AND cd_idmotivo = 6', [edNumeroInforme.Value]);
      chbDenunciarServHyS.Checked := ExisteSqlEx('SELECT 1 ' +
                                                 '  FROM hys.pcd_caninformedenuncia ' +
                                                 ' WHERE cd_idcaninforme = :ci_id ' +
                                                 '   AND cd_fechabaja IS NULL ' +
                                                 '   AND cd_idmotivo = 5', [edNumeroInforme.Value]);

      chbDenunciarEmpresa.OnClick(nil);
      chbDenunciarResponsable.OnClick(nil);
      chbDenunciarPersonal.OnClick(nil);
      chbDenunciarServMedLab.OnClick(nil);
      chbDenunciarServHyS.OnClick(nil);

      gbResponsable.Visible := not FDenuncia;
      gbPersonal.Visible := not FDenuncia;
      gbOtrasDenuncias.Visible := not FDenuncia;
      tsDenuncias.TabVisible := not FDenuncia;
      tsProductosSector.TabVisible := not FDenuncia;
      tsProveedores.TabVisible := not FDenuncia;
      tsSustancias.TabVisible := not FDenuncia;
      tsTrabajadores.TabVisible := not FDenuncia;
      rgTipoIntervencion.Visible := FDenuncia;

      if FieldByName('CI_USUEXPORT').IsNull Then
        lbInfExportado.Caption := 'No Exportado'
      else
        lbInfExportado.Caption := Format('Exportado por %s el %s', [FieldByName('CI_USUEXPORT').AsString,
                                                                    FieldByName('CI_FECHAEXPORT').AsString]);
      inherited;
    end;
  end;

  PageControl.ActivePageIndex := PAGE_DATOSGENERALES;

  if sdqConsulta.Active then
    lblMsgBaja.Caption := iif(sdqConsulta.FieldByName('ci_fechabaja').IsNull, '', 'El informe/denuncia está dado de baja')
  else
    lblMsgBaja.Caption := ''
end;
{-----------------------------------------------------------------------------
  Procedure:   Validar
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   None
  Result:      Boolean
  Description: Valido Datos Informe
-----------------------------------------------------------------------------}
function TfrmInfCancerigenos.Validar: Boolean;
begin
  PageControl.ActivePageIndex := 0;

  // Datos de la empresa
  VerificarMultiple (['Datos de Informe/Denuncia',
                      fraCE_CUIT,
                      not fraCE_CUIT.IsEmpty,
                      'Debe seleccionar la Empresa',

                      fraEstablecimiento,
                      fraEstablecimiento.Value <> 0,
                      'Debe ingresar el Establecimiento']);

  // Datos Informe/Denuncia
  Verificar(edFechaRecepcion.IsEmpty, edFechaRecepcion, 'Debe ingresar la fecha de Recepción');
  Verificar(edFechaRecepcion.Date > Today, edFechaRecepcion, 'La fecha no puede ser superior a la actual');
  VerificarMultiple (['Datos de Informe/Denuncia',
                      edCI_FECHA,
                      not edCI_FECHA.IsEmpty,
                      'Debe ingresar la fecha del informe/denuncia',

                      edCI_FECHA,
                      edCI_FECHA.Date <= Today,
                      'La fecha no puede ser superior a la actual',

                      rgTipoInforme,
                      rgTipoInforme.ItemIndex <> -1,
                      'Debe ingresar el tipo de informe']);

  if FDenuncia then
    VerificarMultiple (['Datos de Informe/Denuncia',
                        edCI_FECHA,
                        ((ModoABM = maAlta) and
                         not ExisteSql ('SELECT 1 ' +
                                        '  FROM hys.pci_caninforme ' +
                                        ' WHERE EXTRACT(YEAR FROM ci_fecha) = EXTRACT(YEAR FROM ' + SqlDateTime(edCI_FECHA.Date) + ')' +
                                        '   AND ci_id >= 900000 ' +
                                        '   AND ci_idestableci = ' + SqlValue(fraEstablecimiento.sdqDatosST_ID.AsString)))
                        or
                        ((ModoABM = maModificacion) and
                         not ExisteSql ('SELECT 1 ' +
                                        '  FROM hys.pci_caninforme ' +
                                        ' WHERE EXTRACT(YEAR FROM ci_fecha) = EXTRACT(YEAR FROM ' + SqlDateTime(edCI_FECHA.Date) + ')' +
                                        '   AND ci_id >= 900000 ' +
                                        '   AND ci_idestableci = ' + SqlValue(fraEstablecimiento.sdqDatosST_ID.AsString) +
                                        '   AND ci_id <> ' + SqlValue (edNumeroInforme.Text))),
                        'Ya existe una denuncia para el CUIT/Establecimiento en el año de la fecha indicada'])
  else begin
    // Datos Informe
{    VerificarMultiple (['Datos de Informe/Denuncia',
                        edCI_FECHA,
                        ((ModoABM = maAlta) and
                         not ExisteSql ('SELECT 1 ' +
                                        '  FROM hys.pci_caninforme ' +
                                        ' WHERE EXTRACT(YEAR FROM ci_fecha) = EXTRACT(YEAR FROM ' + SqlDateTime(edCI_FECHA.Date) + ')' +
                                        '   AND ci_id < 900000 ' +
                                        '   AND ci_idestableci = ' + SqlValue(fraEstablecimiento.sdqDatosST_ID.AsString)))
                        or
                        ((ModoABM = maModificacion) and
                         not ExisteSql ('SELECT 1 ' +
                                        '  FROM hys.pci_caninforme ' +
                                        ' WHERE EXTRACT(YEAR FROM ci_fecha) = EXTRACT(YEAR FROM ' + SqlDateTime(edCI_FECHA.Date) + ')' +
                                        '   AND ci_id < 900000 ' +
                                        '   AND ci_idestableci = ' + SqlValue(fraEstablecimiento.sdqDatosST_ID.AsString) +
                                        '   AND ci_id <> ' + SqlValue (edNumeroInforme.Text))),
                        'Ya existe un informe para el CUIT/Establecimiento en el año de la fecha indicada']);
}
    // Datos Responsable
    VerificarMultiple (['Datos de Informe/Denuncia',
//                                  edCI_RESP_CUILCUIT,
//                                  not IsEmptyString(edCI_RESP_CUILCUIT.Text),
//                                  'Debe ingresar el CUIL/CUIT del Responsable',

                        edCI_RESP_CUILCUIT,
                        IsEmptyString(edCI_RESP_CUILCUIT.Text) or
                        ((not IsEmptyString(edCI_RESP_CUILCUIT.Text)) and
                         IsCuil(edCI_RESP_CUILCUIT.Text)),
                        'El CUIL/CUIT es inválido'

//                                  edCI_RESP_NOMBRE,
//                                  (not IsEmptyString(edCI_RESP_NOMBRE.Text)) and (Pos(' ', edCI_RESP_NOMBRE.Text) <> 0),
//                                  'Debe ingresar el Apellido y Nombre del Responsable',

//                                  fraCI_RESP_TIPODOCUMENTO,
//                                  not fraCI_RESP_TIPODOCUMENTO.IsEmpty,
//                                  'Debe ingresar el Tipo de Documento',

//                                  fraCI_REPRESENTACION,
//                                  not fraCI_REPRESENTACION.IsEmpty,
//                                  'Debe seleccionar el Tipo de Representación'
                       ]);

    VerificarMultiple (['Datos de Informe/Denuncia',
                        chbDenunciarResponsable,
                        //cbNoAlcanzadoResolucion.Checked or
                        chbDenunciarResponsable.Checked or
                        ((not chbDenunciarResponsable.Checked) and
                         (not IsEmptyString(edCI_RESP_CUILCUIT.Text)) and
                         (not IsEmptyString(edCI_RESP_NOMBRE.Text)) and
                         ( not fraCI_RESP_TIPODOCUMENTO.IsEmpty) and
                         (not fraCI_REPRESENTACION.IsEmpty) and
                         not ExisteSQL('SELECT 1 ' +
                                       '  FROM hys.pcd_caninformedenuncia ' +
                                       ' WHERE cd_idcaninforme = ' + SqlValue (edNumeroInforme.Value) +
                                       '   AND cd_fechabaja IS NULL ' +
                                       '   AND cd_idmotivo = ''3''')),
                        'Debe notificar la falta de datos',

                        chbDenunciarPersonal,
                        //cbNoAlcanzadoResolucion.Checked or
                        chbDenunciarPersonal.Checked or
                        ((not chbDenunciarPersonal.Checked) and
                         (edCI_PERS_ADMINISTRACION.Value + edCI_PERS_PRODUCCION.Value > 0) and
                         not ExisteSQL('SELECT 1 ' +
                                       '  FROM hys.pcd_caninformedenuncia ' +
                                       ' WHERE cd_idcaninforme = ' + SqlValue (edNumeroInforme.Value) +
                                       '   AND cd_fechabaja IS NULL ' +
                                       '   AND cd_idmotivo = ''4''')),
                        'Debe notificar la falta de datos']);
  end;

  if IsEmptyString(edCPA.Text) or (Length(edCPA.Text) <> 8) then
  begin
    PageControl.ActivePage := tsDatosGenerales;
    ScrollBox.VertScrollBar.Position := 0;
  end;
  Verificar(IsEmptyString(edCPA.Text) or (Length(edCPA.Text) <> 8),edCPA,  'Debe ingresar CPA válido');

  Result := true
end;
{-----------------------------------------------------------------------------
  Procedure:   DoABM
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   None
  Result:      Boolean
  Description: Ejecuto ABM Datos Informe
-----------------------------------------------------------------------------}
function TfrmInfCancerigenos.DoABM: Boolean;
var
  FAsunto,
  FBody,
  FListaMail,
  sSql: String;
begin
  BeginTrans;
  Try
    if ModoABM = maBaja then
      sSql := 'UPDATE hys.pci_caninforme ' +
              '   SET ci_fechabaja = SYSDATE, ' +
              '       ci_usubaja = ' + SqlValue(frmPrincipal.DBLogin.UserID) +
              ' WHERE ci_id = ' + SqlValue(edNumeroInforme.Value)
    else
      if ModoABM = maAlta then
      begin
        if FDenuncia then
            edNumeroInforme.Value := GetSecNextVal('HYS.SEQ_PDE_ID')
          else
            edNumeroInforme.Value := GetSecNextVal('HYS.SEQ_PCI_ID');
        edCI_ID.Text := edNumeroInforme.Text;

        sSql := 'INSERT INTO hys.pci_caninforme ' +
                '            (ci_id, ci_fecha, ci_fecharecepcion, ci_resp_cuilcuit, ci_resp_nombre, ' +
                '             ci_resp_tipodocumento, ci_representacion, ' +
                '             ci_pers_administracion, ci_pers_produccion, ci_idestableci, ' +
                '             ci_fechaalta, ci_usualta, ci_tipointervencion, ci_tipoinforme) ' +
                '     VALUES ( ' +
                              SqlValue(edNumeroInforme.Value) + ', ' +
                              SqlValue(edCI_FECHA.Date) + ', ' +
                              SqlValue(edFechaRecepcion.Date) + ', ' +

                              SqlValue(edCI_RESP_CUILCUIT.Text) + ', ' +
                              SqlValue(edCI_RESP_NOMBRE.Text) + ', ' +
                              SqlValue(fraCI_RESP_TIPODOCUMENTO.Value) + ', ' +
                              SqlValue(fraCI_REPRESENTACION.Value) + ', ' +

                              SqlValue(edCI_PERS_ADMINISTRACION.Value) + ', ' +
                              SqlValue(edCI_PERS_PRODUCCION.Value) + ', ' +

                              SqlValue(fraEstablecimiento.sdqDatosST_ID.AsString) + ', ' +
                '             SYSDATE, ' +
                              SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                              SqlValue(rgTipoIntervencion.ItemIndex) + ',' +
                              SqlValue(rgTipoInforme.ItemIndex) +
                               ')';


        if (not FDenuncia) then
        begin
          // Si no es original mando e-mail al preventor para que lo solicite
          if rgTipoInforme.ItemIndex > 0 then
          begin
            FAsunto := 'Solicitud de AII de la Res.405/02 Original';
            FBody := 'Sr./Sra.Preventor, la Empresa ' + fraCE_CUIT.CUIT + ' - ' + fraCE_CUIT.RazonSocial +
                     ', Estab. ' + fraEstablecimiento.edCodigo.Text + ', ' +
                     ValorSqlEx('SELECT art.utiles.armar_domicilio(es_calle, es_numero, es_piso, ' +
                                '                                  es_departamento, NULL) ' +
                                '       || art.utiles.armar_localidad(es_cpostal, NULL, es_localidad, ' +
                                '                                     es_provincia) ' +
                                '  FROM afi.aes_establecimiento ' +
                                ' WHERE es_id = :es_id ',
                                [fraEstablecimiento.IdEstablecimiento]) +
                     ' no ha presentado a la fecha el AII de la Res.415/02 en copia o fax.' + #13 +
                     'Favor de visitarla y asentar en CV la solicitud del original';

            FListaMail := ValorSQL ('SELECT DISTINCT it_email ' +
                                    '           FROM hys.hep_estabporpreventor, art.pit_firmantes ' +
                                    '          WHERE it_codigo = ep_itcodigo ' +
                                    '            AND ep_fechabaja IS NULL ' +
                                    '            AND ROWNUM = 1 ' +
                                    '            AND ep_cuit = ' + SqlValue(fraCE_CUIT.CUIT) +
                                    '            AND ep_estableci = ' + SqlValue(fraEstablecimiento.edCodigo.Text));
            if not IsEmptyString(FListaMail) then
              EnviarMailBD(FListaMail, FAsunto, [], FBody, nil, 0, tcDefault, false)
            else
              MsgBox('No puede solicitarse Original de Informe al preventor por ' +
                     'no disponerse de su e-mail.', MB_ICONWARNING + MB_Ok);
          end;

          EjecutarSqlST('INSERT INTO hys.hee_eventoempresa ' +
                        '            (ee_id, ee_cuit, ee_establecimiento, ' +
                        '             ee_tipo, ' +
                        '             ee_operativo, ' +
                        '             ee_idtipoevento, ee_observacion, ee_muestracuit, ee_fechaevento, ' +
                        '             ee_fechaalta, ee_usualta, ' +
                        '             ee_idpreventor) ' +
                        '     VALUES (hys.seq_hee_id.NEXTVAL, ' + SqlValue(fraCE_CUIT.CUIT) + ', ' +
                                      SqlValue(fraEstablecimiento.edCodigo.Text) + ', ' +
                        '             art.hys.get_tipo_empresa(' + SqlValue(fraCE_CUIT.CUIT) + ', ' + SqlValue(fraEstablecimiento.edCodigo.Text) + ', SYSDATE), ' +
                        '             art.hys.get_operativovigente_empresa(' + SqlValue(fraCE_CUIT.CUIT) + ', SYSDATE), ' +
                                      iif(rgTipoInforme.ItemIndex = 0, SqlInteger(9), SqlInteger(8)) + ', NULL, ''N'', ' +
                                      SqlDate(edCI_FECHA.Date)+ ', ' +
                        '             SYSDATE, ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                        '             (SELECT it_id ' +
                        '                FROM pit_firmantes ' +
                        '               WHERE it_codigo = art.hys.get_preventor_estab(' + SqlValue(fraCE_CUIT.CUIT) + ', ' + SqlValue(fraEstablecimiento.edCodigo.Text) + ', SYSDATE))) ')
        end
      end
      else begin
        sSql := 'UPDATE hys.pci_caninforme ' +
                '   SET ci_fecha = ' + SqlValue(edCI_FECHA.Date) + ', ' +
                '       ci_fecharecepcion = ' + SqlValue(edFechaRecepcion.Date) + ', ' +
                '       ci_resp_cuilcuit = ' + SqlValue(edCI_RESP_CUILCUIT.Text) + ', ' +
                '       ci_resp_nombre = ' + SqlValue(edCI_RESP_NOMBRE.Text) + ', ' +
                '       ci_resp_tipodocumento = ' + SqlValue(fraCI_RESP_TIPODOCUMENTO.Value) + ', ' +
                '       ci_representacion = ' + SqlValue(fraCI_REPRESENTACION.Value) + ', ' +
                '       ci_pers_administracion = ' + SqlValue(edCI_PERS_ADMINISTRACION.Value) + ', ' +
                '       ci_pers_produccion = ' + SqlValue(edCI_PERS_PRODUCCION.Value) + ', ' +
                '       ci_fechamodif = SYSDATE, ' +
                '       ci_idestableci = ' + SqlValue(fraEstablecimiento.sdqDatosST_ID.AsString) + ', ' +
                '       ci_usumodif = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                '       ci_fechabaja = NULL, ' +
                '       ci_usubaja = NULL, ' +
                '       ci_tipointervencion = ' + SqlValue (rgTipoIntervencion.ItemIndex) + ', ' +
                '       ci_tipoinforme = ' + SqlValue (rgTipoInforme.ItemIndex) +
                ' WHERE ci_id = ' + SqlValue(edNumeroInforme.Value);

        // Se genera evento en caso que se modifique el tipo de informe, 9 si es original, 8 en caso contrario
        if rgTipoInforme.ItemIndex <> FTipoAnterior then
          EjecutarSqlST('INSERT INTO hys.hee_eventoempresa ' +
                        '            (ee_id, ee_cuit, ee_establecimiento, ' +
                        '             ee_tipo, ' +
                        '             ee_operativo, ' +
                        '             ee_idtipoevento, ee_observacion, ee_muestracuit, ee_fechaevento, ' +
                        '             ee_fechaalta, ee_usualta, ' +
                        '             ee_idpreventor) ' +
                        '     VALUES (hys.seq_hee_id.NEXTVAL, ' + SqlValue(fraCE_CUIT.CUIT) + ', ' +
                                      SqlValue(fraEstablecimiento.edCodigo.Text) + ', ' +
                        '             art.hys.get_tipo_empresa(' + SqlValue(fraCE_CUIT.CUIT) + ', ' + SqlValue(fraEstablecimiento.edCodigo.Text) + ', SYSDATE), ' +
                        '             art.hys.get_operativovigente_empresa(' + SqlValue(fraCE_CUIT.CUIT) + ', SYSDATE), ' +
                                      iif(rgTipoInforme.ItemIndex = 0, SqlInteger(9), SqlInteger(8)) + ', NULL, ''N'', ' +
                                      SqlDate(edCI_FECHA.Date)+ ', ' +
                        '             SYSDATE, ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                        '             (SELECT it_id ' +
                        '                FROM pit_firmantes ' +
                        '               WHERE it_codigo = art.hys.get_preventor_estab(' + SqlValue(fraCE_CUIT.CUIT) + ', ' + SqlValue(fraEstablecimiento.edCodigo.Text) + ', SYSDATE))) ')
      end;

    EjecutarSqlST (sSql);

    // Genera denuncias
    if chbDenunciarEmpresa.Checked then
    begin
      if ExisteSqlEx('SELECT 1 ' +
                     '  FROM hys.pcd_caninformedenuncia ' +
                     ' WHERE cd_idcaninforme = :ci_id ' +
                     '   AND cd_fechabaja IS NULL ' +
                     '   AND cd_idmotivo = 2', [edNumeroInforme.Value]) then
        EjecutarSqlST('UPDATE hys.pcd_caninformedenuncia ' +
                      '   SET cd_observacion = ' + SqlValue(memObsDen1.Text) +
                      ' WHERE cd_id = ' + SqlValue(edNumeroInforme.Value) +
                      '   AND cd_fechabaja IS NULL ' +
                      '   AND cd_idmotivo = 2')
      else
        EjecutarSqlST('INSERT INTO hys.pcd_caninformedenuncia ' +
                      '            (cd_idcaninforme, cd_fecha, cd_idmotivo, ' +
                      '             cd_idsustancia, cd_fechaalta, cd_usualta, cd_id, ' +
                      '             cd_observacion) ' +
                      '     VALUES (' +
                                    SqlValue (edNumeroInforme.Value) + ', ' +
                                    'art.actualdate, ''2'', NULL, SYSDATE, ' +
                                    SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                                    'hys.seq_pid_id.NEXTVAL, ' + SqlValue(memObsDen1.Text) + ')')
    end;

    if chbDenunciarResponsable.Checked then
    begin
      if ExisteSqlEx('SELECT 1 ' +
                     '  FROM hys.pcd_caninformedenuncia ' +
                     ' WHERE cd_idcaninforme = :ci_id ' +
                     '   AND cd_fechabaja IS NULL ' +
                     '   AND cd_idmotivo = 3', [edNumeroInforme.Value]) then
        EjecutarSqlST('UPDATE hys.pcd_caninformedenuncia ' +
                      '   SET cd_observacion = ' + SqlValue(memObsDen2.Text) +
                      ' WHERE cd_idcaninforme = ' + SqlValue(edNumeroInforme.Value) +
                      '   AND cd_fechabaja IS NULL ' +
                      '   AND cd_idmotivo = 3')
      else
        EjecutarSqlST('INSERT INTO hys.pcd_caninformedenuncia ' +
                      '            (cd_idcaninforme, cd_fecha, cd_idmotivo, ' +
                      '             cd_idsustancia, cd_fechaalta, cd_usualta, cd_id, ' +
                      '             cd_observacion) ' +
                      '     VALUES (' +
                                    SqlValue (edNumeroInforme.Value) + ', ' +
                                    'art.actualdate, ''3'', NULL, SYSDATE, ' +
                                    SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                                    'hys.seq_pid_id.NEXTVAL, ' + SqlValue(memObsDen2.Text) + ')')
    end;

    if chbDenunciarPersonal.Checked then
    begin
      if ExisteSqlEx('SELECT 1 ' +
                     '  FROM hys.pcd_caninformedenuncia ' +
                     ' WHERE cd_idcaninforme = :ci_id ' +
                     '   AND cd_fechabaja IS NULL ' +
                     '   AND cd_idmotivo = 4', [edNumeroInforme.Value]) then
        EjecutarSqlST('UPDATE hys.pcd_caninformedenuncia ' +
                      '   SET cd_observacion = ' + SqlValue(memObsDen3.Text) +
                      ' WHERE cd_idcaninforme = ' + SqlValue(edNumeroInforme.Value) +
                      '   AND cd_fechabaja IS NULL ' +
                      '   AND cd_idmotivo = 4')
      else
        EjecutarSqlST('INSERT INTO hys.pcd_caninformedenuncia ' +
                      '            (cd_idcaninforme, cd_fecha, cd_idmotivo, ' +
                      '             cd_idsustancia, cd_fechaalta, cd_usualta, cd_id, ' +
                      '             cd_observacion) ' +
                      '     VALUES (' +
                                    SqlValue (edNumeroInforme.Value) + ', ' +
                                    'art.actualdate, ''4'', NULL, SYSDATE, ' +
                                    SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                                    'hys.seq_pid_id.NEXTVAL, ' + SqlValue(memObsDen3.Text) + ')')
    end;

    if chbDenunciarServMedLab.Checked then
    begin
      if ExisteSqlEx('SELECT 1 ' +
                     '  FROM hys.pcd_caninformedenuncia ' +
                     ' WHERE cd_idcaninforme = :ci_id ' +
                     '   AND cd_fechabaja IS NULL ' +
                     '   AND cd_fechabaja IS NULL ' +
                     '   AND cd_idmotivo = 6', [edNumeroInforme.Value]) then
        EjecutarSqlST('UPDATE hys.pcd_caninformedenuncia ' +
                      '   SET cd_observacion = ' + SqlValue(memObsDen4.Text) +
                      ' WHERE cd_idcaninforme = ' + SqlValue(edNumeroInforme.Value) +
                      '   AND cd_idmotivo = 6')
      else
        EjecutarSqlST('INSERT INTO hys.pcd_caninformedenuncia ' +
                      '            (cd_idcaninforme, cd_fecha, cd_idmotivo, ' +
                      '             cd_idsustancia, cd_fechaalta, cd_usualta, cd_id, ' +
                      '             cd_observacion) ' +
                      '     VALUES (' +
                                    SqlValue (edNumeroInforme.Value) + ', ' +
                                    'art.actualdate, ''6'', NULL, SYSDATE, ' +
                                    SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                                    'hys.seq_pid_id.NEXTVAL, ' + SqlValue(memObsDen4.Text) + ')')
    end;

    if chbDenunciarServHyS.Checked then
    begin
      if ExisteSqlEx('SELECT 1 ' +
                     '  FROM hys.pcd_caninformedenuncia ' +
                     ' WHERE cd_idcaninforme = :ci_id ' +
                     '   AND cd_fechabaja IS NULL ' +
                     '   AND cd_idmotivo = 5', [edNumeroInforme.Value]) then
        EjecutarSqlST('UPDATE hys.pcd_caninformedenuncia ' +
                      '   SET cd_observacion = ' + SqlValue(memObsDen5.Text) +
                      ' WHERE cd_idcaninforme = ' + SqlValue(edNumeroInforme.Value) +
                      '   AND cd_fechabaja IS NULL ' +
                      '   AND cd_idmotivo = 5')
      else
        EjecutarSqlST('INSERT INTO hys.pcd_caninformedenuncia ' +
                      '            (cd_idcaninforme, cd_fecha, cd_idmotivo, ' +
                      '             cd_idsustancia, cd_fechaalta, cd_usualta, cd_id, ' +
                      '             cd_observacion) ' +
                      '     VALUES (' +
                                    SqlValue (edNumeroInforme.Value) + ', ' +
                                    'art.actualdate, ''5'', NULL, SYSDATE, ' +
                                    SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                                    'hys.seq_pid_id.NEXTVAL, ' + SqlValue(memObsDen5.Text) + ')')
    end;

    CommitTrans;

    if sdqDenuncias.Active then
      sdqDenuncias.Refresh;

    SetCE_ID(edNumeroInforme.Value);
    Result := True;
    FDataModified := False;

    MsgBox('Los datos han sido grabados.', MB_ICONINFORMATION + MB_OK);
  except
    on E: Exception do
    begin
      RollBack;
      Result := False;
      ErrorMsg(E, 'Error al guardar los datos del informe');
    end;
  end;
end;
{-----------------------------------------------------------------------------
  Procedure:   edCI_PERS_ADMINISTRACIONChange
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Recalcula la cantidad de total personal
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.edCI_PERS_ADMINISTRACIONChange(Sender: TObject);
begin
  edCI_PERS_TOTAL.Value := edCI_PERS_ADMINISTRACION.Value + edCI_PERS_PRODUCCION.Value;
end;

{-----------------------------------------------------------------------------
 Sustancias
-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------
  Procedure:   tbPCSNuevoClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Alta Sustancia
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCSNuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Agregar sustancias',
                      btnAplicar,
                      not edNumeroInforme.IsEmpty,
                      'No puede darse de alta una Sustancia si aún no registró el informe (Aplicar)']);

  fraCS_CODIGO.Clear;
  chkCS_INFORMACION.Checked := False;
  chkCS_CAPACITACION.Checked := False;
  edCS_ESTUDIOS.Clear;
  edCS_MEDIDAS.Clear;
  chkCS_EXAMEN_PREOCUPACIONAL.Checked := False;
  chkCS_EXAMEN_PERIODICO.Checked := False;
  chkCS_EXAMEN_EGRESO.Checked := False;
  chkEstAmbCC_DETERMINACIONES.Checked := False;
  cmbEstAmbCC_FRECUENCIA.ItemIndex := -1;
  chkEstBioCC_DETERMINACIONES.Checked := False;
  cmbEstBioCC_FRECUENCIA.ItemIndex := -1;

  ModoABMTablas := maAlta;
  fpPCS_CANCERSUSTANCIA.ShowModal;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCSModificarClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Modificación Sustancia
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCSModificarClick(Sender: TObject);
begin
  if sdqPCS_CANCERSUSTANCIA.IsEmpty then
    Exit;

  with sdqPCS_CANCERSUSTANCIA do
  begin
    fraCS_CODIGO.Value                  := FieldByName('cs_idsubstancia').AsInteger;
    chkCS_INFORMACION.Checked           := FieldByName('cs_informacion').AsString = SQL_TRUE;
    chkCS_CAPACITACION.Checked          := FieldByName('cs_capacitacion').AsString = SQL_TRUE;
    edCS_ESTUDIOS.Text                  := FieldByName('cs_estudios').AsString;
    edCS_MEDIDAS.Text                   := FieldByName('cs_medidas').AsString;
    chkCS_EXAMEN_PREOCUPACIONAL.Checked := FieldByName('cs_examen_preocupacional').AsString = SQL_TRUE;
    chkCS_EXAMEN_PERIODICO.Checked      := FieldByName('cs_examen_periodico').AsString = SQL_TRUE;
    chkCS_EXAMEN_EGRESO.Checked         := FieldByName('cs_examen_egreso').AsString = SQL_TRUE;
    chkEstAmbCC_DETERMINACIONES.Checked := FieldByName('cs_detamb').AsString = SQL_TRUE;;
    cmbEstAmbCC_FRECUENCIA.Value        := FieldByName('cs_frecamb').AsString;
    chkEstBioCC_DETERMINACIONES.Checked := FieldByName('cs_detbio').AsString = SQL_TRUE;;
    cmbEstBioCC_FRECUENCIA.Value        := FieldByName('cs_frecbio').AsString;

    chkEstAmbCC_DETERMINACIONESClick(Sender);
    chkEstBioCC_DETERMINACIONESClick(Sender);

    ModoABMTablas := maModificacion;

    fpPCS_CANCERSUSTANCIA.ShowModal;
  end
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCSEliminarClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Baja Sustancia
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCSEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCS_CANCERSUSTANCIA, 'CS', 'hys.pcs_cansubstancia');
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCS_CANCERSUSTANCIADblClick(Sender: TObject);
begin
  if tbSustancias.Enabled and tbPCSModificar.Enabled Then
    tbPCSModificarClick(Nil);
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCS_CANCERSUSTANCIAGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCS_CANCERSUSTANCIA.FieldByName('CS_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{-----------------------------------------------------------------------------
  Procedure:   btnPCSAceptarClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Grabo datos de Substancia
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.btnPCSAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  VerificarMultiple (['Sustancias',
                      fraCS_CODIGO,
                      not fraCS_CODIGO.IsEmpty,
                      'Debe seleccionar la Sustancia',
                      fraCS_CODIGO,
                      (ModoABMTablas <> maAlta) or
                      ((ModoABMTablas = maAlta) and
                       (not ExisteSQL('SELECT 1 ' +
                                      '  FROM hys.pcs_cansubstancia pcs ' +
                                      ' WHERE cs_idcaninforme = ' + SqlValue (edNumeroInforme.Value) +
                                      '   AND cs_idsubstancia = ' + SqlValue (fraCS_CODIGO.Value)))),
                      'Ya se ha cargado anteriormente la sustancia seleccionada para el presente informe',

                      edCS_ESTUDIOS,
                      not IsEmptyString(edCS_ESTUDIOS.Text),
                      'Debe describir los Estudios',

                      edCS_MEDIDAS,
                      not IsEmptyString(edCS_MEDIDAS.Text),
                      'Debe describir las Medidas',

                      cmbEstAmbCC_FRECUENCIA,
                      (not chkEstAmbCC_DETERMINACIONES.Checked) or
                      (chkEstAmbCC_DETERMINACIONES.Checked and (cmbEstAmbCC_FRECUENCIA.ItemIndex <> -1)),
                      'Debe seleccionar la Frecuencia si ha Efectuado Determinaciones en Estudios Ambientales Específicos',

                      cmbEstBioCC_FRECUENCIA,
                      (not chkEstBioCC_DETERMINACIONES.Checked) or
                      (chkEstBioCC_DETERMINACIONES.Checked and (cmbEstBioCC_FRECUENCIA.ItemIndex <> -1)),
                      'Debe seleccionar la Frecuencia si ha Efectuado Determinaciones en Estudios Biológicos Específicos'
                     ]);

  BeginTrans;
  try
    if ModoABMTablas = maAlta Then
      sSql := 'INSERT INTO hys.pcs_cansubstancia ' +
              '            (cs_id, cs_idcaninforme, ' +
              '             cs_idsubstancia, cs_informacion, cs_capacitacion, ' +
              '             cs_estudios, cs_medidas, cs_examen_preocupacional, ' +
              '             cs_examen_periodico, cs_examen_egreso, cs_detamb, ' +
              '             cs_frecamb, cs_detbio, cs_frecbio, cs_fechaalta, ' +
              '             cs_usualta) ' +
              '     VALUES (hys.seq_pcs_id.NEXTVAL, ' +
                            SqlValue(edNumeroInforme.Value) + ', ' +
                            SqlValue(fraCS_CODIGO.Value) + ', ' +
                            SqlValue(SqlBoolean(chkCS_INFORMACION.Checked, False)) + ', ' +
                            SqlValue(SqlBoolean(chkCS_CAPACITACION.Checked, False)) + ', ' +
                            SqlValue(edCS_ESTUDIOS.Text) + ', ' +
                            SqlValue(edCS_MEDIDAS.Text) + ', ' +
                            SqlValue(SqlBoolean(chkCS_EXAMEN_PREOCUPACIONAL.Checked, False)) + ', ' +
                            SqlValue(SqlBoolean(chkCS_EXAMEN_PERIODICO.Checked, False)) + ', ' +
                            SqlValue(SqlBoolean(chkCS_EXAMEN_EGRESO.Checked, False)) + ', ' +
                            SqlValue(SqlBoolean(chkEstAmbCC_DETERMINACIONES.Checked, False)) + ', ' +
                            SqlValue(String(iif(chkEstAmbCC_DETERMINACIONES.Checked, FRECUENCIA_PCC[cmbEstAmbCC_FRECUENCIA.ItemIndex], ''))) + ', ' +
                            SqlValue(SqlBoolean(chkEstBioCC_DETERMINACIONES.Checked, False)) + ', ' +
                            SqlValue(String(iif(chkEstBioCC_DETERMINACIONES.Checked, FRECUENCIA_PCC[cmbEstBioCC_FRECUENCIA.ItemIndex], ''))) + ', ' +
              '             SYSDATE, ' +
                            SqlValue(frmPrincipal.DBLogin.UserID) + ')'

    else
      sSql := 'UPDATE hys.pcs_cansubstancia ' +
              '   SET cs_idsubstancia = ' + SqlValue(fraCS_CODIGO.Value) + ', ' +
              '       cs_informacion = ' + SqlValue(SqlBoolean(chkCS_INFORMACION.Checked, False)) + ', ' +
              '       cs_capacitacion = ' + SqlValue(SqlBoolean(chkCS_CAPACITACION.Checked, False)) + ', ' +
              '       cs_estudios = ' + SqlValue(edCS_ESTUDIOS.Text) + ', ' +
              '       cs_medidas = ' + SqlValue(edCS_MEDIDAS.Text) + ', ' +
              '       cs_examen_preocupacional = ' + SqlValue(SqlBoolean(chkCS_EXAMEN_PREOCUPACIONAL.Checked, False)) + ', ' +
              '       cs_examen_periodico = ' + SqlValue(SqlBoolean(chkCS_EXAMEN_PERIODICO.Checked, False)) + ', ' +
              '       cs_examen_egreso = ' + SqlValue(SqlBoolean(chkCS_EXAMEN_EGRESO.Checked, False)) + ', ' +
              '       cs_detamb = ' + SqlValue(SqlBoolean(chkEstAmbCC_DETERMINACIONES.Checked, False)) + ', ' +
              '       cs_frecamb = ' + iif(chkEstAmbCC_DETERMINACIONES.Checked, SqlValue(FRECUENCIA_PCC[cmbEstAmbCC_FRECUENCIA.ItemIndex]), 'NULL') + ', ' +
              '       cs_detbio = ' + SqlValue(SqlBoolean(chkEstBioCC_DETERMINACIONES.Checked, False)) + ', ' +
              '       cs_frecbio = ' + iif(chkEstBioCC_DETERMINACIONES.Checked, SqlValue(FRECUENCIA_PCC[cmbEstBioCC_FRECUENCIA.ItemIndex]), 'NULL') + ', ' +
              '       cs_fechamodif = SYSDATE, ' +
              '       cs_usumodif = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
              '       cs_fechabaja = NULL, ' +
              '       cs_usubaja = NULL ' +
              ' WHERE cs_id = ' + SqlValue(sdqPCS_CANCERSUSTANCIA.FieldByName('cs_id').AsString);

    EjecutarSqlST (sSql);
    CommitTrans;

    fpPCS_CANCERSUSTANCIA.ModalResult := mrOk;
    sdqPCS_CANCERSUSTANCIA.Refresh
  except
    on E: Exception do begin
      ErrorMsg(E, 'Error al guardar datos de la sustancia');
      Rollback;
    end;
  end;
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.chkEstAmbCC_DETERMINACIONESClick(
  Sender: TObject);
begin
  if chkEstAmbCC_DETERMINACIONES.Checked then
    cmbEstAmbCC_FRECUENCIA.Enabled := true
  else begin
    cmbEstAmbCC_FRECUENCIA.ItemIndex := -1;
    cmbEstAmbCC_FRECUENCIA.Enabled := false;
  end
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.chkEstAmbCC_DETERMINACIONESExit(
  Sender: TObject);
begin
  inherited;
  if cmbEstAmbCC_FRECUENCIA.Enabled then
    cmbEstAmbCC_FRECUENCIA.SetFocus
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.chkEstBioCC_DETERMINACIONESClick(
  Sender: TObject);
begin
  if chkEstBioCC_DETERMINACIONES.Checked then
    cmbEstBioCC_FRECUENCIA.Enabled := true
  else begin
    cmbEstBioCC_FRECUENCIA.ItemIndex := -1;
    cmbEstBioCC_FRECUENCIA.Enabled := false;
  end
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.chkEstBioCC_DETERMINACIONESExit(
  Sender: TObject);
begin
  inherited;
  if cmbEstBioCC_FRECUENCIA.Enabled then
    cmbEstBioCC_FRECUENCIA.SetFocus
end;

{-----------------------------------------------------------------------------
 Proveedores/Compradores
-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------
  Procedure:   tbPCPNuevoClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Alta de Proveedor/Comprador
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCPNuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Agregar Proveedor/Comprador',
                      btnAplicar,
                      not edNumeroInforme.IsEmpty,
                      'No puede darse de alta un Proveedor/Comprador si aún no registró el informe (Aplicar)']);
  if IsEmptyString(edCPA.Text) or (Length(edCPA.Text) <> 8) then
  begin
    PageControl.ActivePage := tsDatosGenerales;
    ScrollBox.VertScrollBar.Position := 0;
  end;
  Verificar(IsEmptyString(edCPA.Text) or (Length(edCPA.Text) <> 8),edCPA,  'Debe ingresar CPA válido');

  edCP_CUIT.Clear;
  cmbCP_INDICADOR.ItemIndex := -1;
  edCP_NOMBRE.Clear;
  fraDomicilio.Clear;
  edCP_PARTIDO.Clear;
  edCP_TELEFONO.Clear;

  ModoABMTablas := maAlta;

  fpPCP_CANCERPROVEEDOR.ShowModal;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCPModificarClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Modificacion de Proveedor/Comprador
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCPModificarClick(Sender: TObject);
begin
  if sdqPCP_CANCERPROVEEDOR.IsEmpty then
    Exit;

  with sdqPCP_CANCERPROVEEDOR do
  begin
    edCP_CUIT.Text            := FieldByName('CP_CUIT').AsString;
    cmbCP_INDICADOR.ItemIndex := ArrayPos(FieldByName('CP_INDICADOR').AsString, TIPO_PCP);
    edCP_NOMBRE.Text          := FieldByName('CP_NOMBRE').AsString;

    fraDomicilio.Cargar(FieldByName('CP_CALLE').AsString,
                        FieldByName('CP_CPOSTAL').AsString,
                        FieldByName('CP_LOCALIDAD').AsString,
                        FieldByName('CP_NUMERO').AsString,
                        FieldByName('CP_PISO').AsString,
                        FieldByName('CP_DEPARTAMENTO').AsString,
                        FieldByName('CP_PROVINCIA').AsString,
                        FieldByName('CP_CPOSTALA').AsString);
    edCP_PARTIDO.Text         := FieldByName('CP_PARTIDO').AsString;
    edCP_TELEFONO.Text        := FieldByName('CP_TELEFONO').AsString;

    ModoABMTablas := maModificacion;
    fpPCP_CANCERPROVEEDOR.ShowModal;
  end;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCPEliminarClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Baja de Proveedor/Comprador
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCPEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCP_CANCERPROVEEDOR, 'CP', 'hys.pcp_canproveedor');
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCP_CANCERPROVEEDORDblClick(Sender: TObject);
begin
  if tbSustancias.Enabled and tbPCPModificar.Enabled Then
    tbPCPModificarClick(Nil);
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCP_CANCERPROVEEDORGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCP_CANCERPROVEEDOR.FieldByName('CP_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCD_CANCERPRODUCTOSDblClick(Sender: TObject);
begin
  if tbPCDModificar.Enabled Then
    tbPCDModificarClick(Nil);
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCD_CANCERPRODUCTOSGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCD_CANCERPRODUCTOS.FieldByName('CR_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{-----------------------------------------------------------------------------
  Procedure:   btnPCPTomarDatosClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Toma datos del Proveedor/Comprador
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.btnPCPTomarDatosClick(Sender: TObject);
var
  sSql: string;
begin
  sSql := 'SELECT cp_cuit, cp_nombre, cp_calle, cp_numero, cp_piso, cp_departamento, ' +
          '       cp_localidad, cp_partido, cp_provincia, cp_cpostala, cp_telefono, ' +
          '       cp_indicador, cp_fechamodif, cp_usumodif, cp_cpostal ' +
          '  FROM hys.pcp_canproveedor ' +
          ' WHERE cp_cuit = :cp_cuit ';

  with GetQueryEx(sSql, [edCP_CUIT.Text]) do
  try
    if not IsEmpty then
    begin
      cmbCP_INDICADOR.ItemIndex   := ArrayPos(FieldByName('cp_indicador').AsString, TIPO_PCP);
      edCP_NOMBRE.Text            := FieldByName('cp_nombre').AsString;
      fraDomicilio.Cargar(FieldByName('CP_CALLE').AsString,
                          FieldByName('CP_CPOSTAL').AsString,
                          FieldByName('CP_LOCALIDAD').AsString,
                          FieldByName('CP_NUMERO').AsString,
                          FieldByName('CP_PISO').AsString,
                          FieldByName('CP_DEPARTAMENTO').AsString,
                          FieldByName('CP_PROVINCIA').AsString,
                          FieldByName('CP_CPOSTALA').AsString);
      edCP_PARTIDO.Text           := FieldByName('cp_partido').AsString;
      edCP_TELEFONO.Text          := FieldByName('cp_telefono').AsString;
    end;
  finally
    Free;
  end;
end;
{-----------------------------------------------------------------------------
  Procedure:   btnPCPAceptarClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Grabo datos de Proveedor/Comprador
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.btnPCPAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  VerificarMultiple (['Proveedor/Comprador',
                      edCP_CUIT,
                      not IsEmptyString(edCP_CUIT.Text),
                      'Debe ingresar el CUIT del Proveedor/Comprador',

                      edCP_CUIT,
                      IsCUIT(edCP_CUIT.Text),
                      'Debe ingresar un CUIT válido',

                      edCP_CUIT,
                      (ModoABMTablas <> maAlta) or
                      ((ModoABMTablas = maAlta) and
                       (not ExisteSQL('SELECT 1 ' +
                                      '  FROM  hys.pcp_canproveedor ' +
                                      ' WHERE cp_cuit = ' + SqlValue (edCP_CUIT.Text) +
                                      '   AND cp_idcaninforme = ' + SqlValue (edNumeroInforme.Value)))),
                      'Ya existe un Proveedor o Comprador con el CUIT ingresado para el presente informe',

                       cmbCP_INDICADOR,
                       cmbCP_INDICADOR.ItemIndex <> -1,
                       'Debe seleccionar el Tipo (Proveedor/Comprador)',

                       edCP_NOMBRE,
                       not IsEmptyString(edCP_NOMBRE.Text),
                       'Debe ingresar Nombre del Proveedor/Comprador',

                       fraDomicilio,
                       fraDomicilio.IsValid,
                       'Debe ingresar un domicilio válido']);
  Verificar(fraDomicilio.CPA = '', fraDomicilio, 'Debe completar el CPA.');

  if fraDomicilio.Prov = 0 then
    MsgBox('Los datos del Proveedor/Comprador no serán exportados a la SRT ' +
           'por faltar el dato asociado a la Provincia', MB_ICONWARNING + MB_OK);

  BeginTrans;
  try
    if ModoABMTablas = maAlta Then
      sSql := 'INSERT INTO hys.pcp_canproveedor ' +
              '            (cp_id, cp_idcaninforme, cp_cuit, cp_nombre, ' +
              '             cp_calle, cp_numero, cp_piso, cp_departamento, cp_localidad, ' +
              '             cp_partido, cp_provincia, cp_cpostal, cp_cpostala, cp_telefono, ' +
              '             cp_indicador, cp_fechaalta, cp_usualta) ' +
              '     VALUES (hys.seq_pcp_id.NEXTVAL, ' +
                            SqlValue(edNumeroInforme.Value) + ', ' +
                            SqlValue(edCP_CUIT.Text) + ', ' +
                            SqlValue(edCP_NOMBRE.Text) + ', ' +
                            SqlValue(fraDomicilio.Calle) + ', ' +
                            SqlValue(fraDomicilio.Numero) + ', ' +
                            SqlValue(fraDomicilio.Piso) + ', ' +
                            SqlValue(fraDomicilio.Departamento) + ', ' +
                            SqlValue(fraDomicilio.Localidad) + ', ' +
                            SqlValue(edCP_PARTIDO.Text) + ', ' +
                            SqlValue(fraDomicilio.Prov) + ', ' +
                            SqlValue(fraDomicilio.CodigoPostal) + ', ' +
                            SqlValue(fraDomicilio.CPA) + ', ' +
                            SqlValue(edCP_TELEFONO.Text) + ', ' +
                            SqlValue(TIPO_PCP[cmbCP_INDICADOR.ItemIndex]) + ', ' +
              '             SYSDATE, ' +
                            SqlValue(frmPrincipal.DBLogin.UserID) + ')'
    else
      sSql := 'UPDATE hys.pcp_canproveedor ' +
              '   SET cp_cuit = ' + SqlValue(edCP_CUIT.Text) + ', ' +
              '       cp_nombre = ' + SqlValue(edCP_NOMBRE.Text) + ', ' +
              '       cp_calle = ' + SqlValue(fraDomicilio.Calle) + ', ' +
              '       cp_numero = ' + SqlValue(fraDomicilio.Numero) + ', ' +
              '       cp_piso = ' + SqlValue(fraDomicilio.Piso) + ', ' +
              '       cp_departamento = ' + SqlValue(fraDomicilio.Departamento) + ', ' +
              '       cp_localidad = ' + SqlValue(fraDomicilio.Localidad) + ', ' +
              '       cp_partido = ' + SqlValue(edCP_PARTIDO.Text) + ', ' +
              '       cp_provincia = ' + SqlValue(fraDomicilio.Prov) + ', ' +
              '       cp_cpostal = ' + SqlValue(fraDomicilio.CodigoPostal) + ', ' +
              '       cp_cpostala = ' + SqlValue(fraDomicilio.CPA) + ', ' +
              '       cp_telefono = ' + SqlValue(edCP_TELEFONO.Text) + ', ' +
              '       cp_indicador = ' + SqlValue(TIPO_PCP[cmbCP_INDICADOR.ItemIndex]) + ', ' +
              '       cp_fechamodif = SYSDATE, ' +
              '       cp_usumodif = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
              '       cp_fechabaja = NULL, ' +
              '       cp_usubaja = NULL ' +
              ' WHERE cp_id = ' + SqlValue(sdqPCP_CANCERPROVEEDOR.FieldByName('cp_id').AsString);

    EjecutarSqlST (sSql);
    CommitTrans;

    VerificarAsociacionDeProductos;

    fpPCP_CANCERPROVEEDOR.ModalResult := mrOk;
    sdqPCP_CANCERPROVEEDOR.Refresh
  except
    on E: Exception do begin
      ErrorMsg(E, 'Error al guardar datos del Proveedor/Comprador');
      Rollback;
    end;
  end;
end;

{-----------------------------------------------------------------------------
 Productos de Proveedores/Compradores
-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------
  Procedure:   tbPCDNuevoClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Alta de producto
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCDNuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Agregar Producto',
                      btnAplicar,
                      not edNumeroInforme.IsEmpty,
                      'No puede darse de alta un Producto si aún no registró el informe (Aplicar)',
                      dbgPCP_CANCERPROVEEDOR,
                      sdqPCP_CANCERPROVEEDOR.Active and (not sdqPCP_CANCERPROVEEDOR.IsEmpty),
                      'Debe seleccionar un Proveedor/Comprador para dar de alta un producto']);

  fraProductos.Clear;
  edNombreCom.Clear;

  ModoABMTablas := maAlta;
  fpPCD_CANCERPRODUCTOS.ShowModal;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCDModificarClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Modificación de productos
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCDModificarClick(Sender: TObject);
begin
  if sdqPCD_CANCERPRODUCTOS.IsEmpty then
    Exit;

  with sdqPCD_CANCERPRODUCTOS do
  begin
    fraProductos.Codigo := FieldByName('cd_idproducto').AsString;
    OnfraProductosChange(Sender);

    ModoABMTablas := maModificacion;
    fpPCD_CANCERPRODUCTOS.ShowModal;
  end;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCDEliminarClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Baja de producto
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCDEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCD_CANCERPRODUCTOS, 'CR', 'hys.pcr_canprovprod');
end;

{-----------------------------------------------------------------------------
  Procedure: VerificarAsociacionDeProductos
  Author:    racastro
  Date:      06-Ago-2008
  Arguments: None
  Result:    None
  Purpose:   Verifica que todos los productos tienen un proveedor asociado
-----------------------------------------------------------------------------}

procedure TfrmInfCancerigenos.VerificarAsociacionDeProductos;
var
  tslProductos: TStringList;
begin
  tslProductos := ValoresSqlEx ('SELECT DISTINCT cd_nombre_comercial ' +
                                '           FROM hys.pcd_canproductos, hys.pps_canproductosector, ' +
                                '                hys.pcp_canproveedor pcp1 ' +
                                '          WHERE cd_id = ps_idproducto ' +
                                '            AND NOT EXISTS( ' +
                                '                  SELECT 1 ' +
                                '                    FROM hys.pcr_canprovprod ' +
                                '                   WHERE cd_idproveedor IN( ' +
                                '                             SELECT pcp2.cp_id ' +
                                '                               FROM hys.pcp_canproveedor pcp2 ' +
                                '                              WHERE pcp2.cp_idcaninforme = pcp1.cp_idcaninforme) ' +
                                '                     AND cd_idproducto = ps_idproducto) ' +
                                '            AND ps_idcaninforme = cp_idcaninforme ' +
                                '            AND ps_fechabaja IS NULL ' +
                                '            AND cp_idcaninforme = :pidinforme ',
                                [edNumeroInforme.Value]);

  if Trim(tslProductos.Text) <> '' then
    MsgBox('Falta asociar a un Proveedor/Comprador los siguientes productos ' +
           'declarados en Productos por Sector, ' + #13 +
           'y por tanto no serán exportados a la SRT: ' + #13 + tslProductos.Text,
           MB_ICONWARNING + MB_OK);
end;

{-----------------------------------------------------------------------------
  Procedure:   bntPCDAceptarClick
  Author:      racastro
  Date:        03-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Grabo datos de producto
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.bntPCDAceptarClick(Sender: TObject);
var
  FIDProvComp: integer;
  sSql: String;
begin
  VerificarMultiple (['Producto del Proveedor/Comprador',
                      fraProductos,
                      fraProductos.IsSelected,
                      'Debe indicar el producto',

                      fraProductos,
                      not ExisteSQL('SELECT 1 ' +
                                    '  FROM hys.pcr_canprovprod ' +
                                    ' WHERE cd_idproveedor = ' + SqlValue (sdqPCP_CANCERPROVEEDOR.FieldByName('cp_id').AsInteger) +
                                    '   AND cr_fechabaja is null '+
                                    '   AND cd_idproducto =' + SqlValue(fraProductos.Value)),
                      'El producto ya existe para el Proveedor/Comprador']);

  BeginTrans;
  try
    FIDProvComp := sdqPCP_CANCERPROVEEDOR.FieldByName('cp_id').AsInteger;

    if ModoABMTablas = maAlta then
    begin
      sSql := 'INSERT INTO hys.pcr_canprovprod ' +
              '            (cr_id, cd_idproveedor, cd_idproducto) ' +
              '     VALUES (hys.seq_pcr_id.NEXTVAL, ' +
                            SqlValue(FIDProvComp) + ', ' +
                            SqlValue(fraProductos.Value) + ')'
    end
    else begin
      sSql:=  'UPDATE hys.pcr_canprovprod ' +
              '   SET cd_idproducto = ' + SqlValue(fraProductos.Value) +
              '       cr_fechabaja = NULL '+
              '       cr_usubaja = NULL '+
              ' WHERE cr_id = ' + SqlValue(sdqPCD_CANCERPRODUCTOS.FieldByName('cr_id').AsInteger)
    end;

    EjecutarSqlST (sSql);

    CommitTrans;

    VerificarAsociacionDeProductos;

    fpPCD_CANCERPRODUCTOS.ModalResult := mrOk;
    sdqPCD_CANCERPRODUCTOS.Refresh
  except
    on E: Exception do begin
      ErrorMsg(E, 'Error al guardar datos del Producto');
      Rollback;
    end;
  end;
end;

{-----------------------------------------------------------------------------
 Productos por Sector
-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------
  Procedure:   tbPCXNuevoClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Alta de Producto por Sector
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCXNuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Agregar Producto en Sector',
                      btnAplicar,
                      not edNumeroInforme.IsEmpty,
                      'No puede darse de alta a un Producto en Sector si aún no registró el informe (Aplicar)']);

  fraProdSector.Clear;
  edNombreComercial.Clear;
  fraUsos.Clear;
  chkMatPrima.Checked := False;
  chkProdFinal.Checked := False;
  chkAlmacenamiento.Checked := False;
  chkOtros.Checked := False;
  edCU_OTROS_MODOS_EMPLEO.Clear;
  fraSectores.Clear;
  edCX_TRAB_PERMANENTE.Clear;
  edCX_TRAB_NOPERMANENTE1.Clear;
  edCX_TRAB_NOPERMANENTE2.Clear;
  edCU_CANTIDAD.Clear;
  cmbCU_UNIDAD.ItemIndex := -1;
  FProdAnt  := -1;
  FSectorAnt:= -1;
  FUsoAnt   := -1;

  ModoABMTablas := maAlta;

  fpPCU_CANCERUSOSUSTANCIAS.ShowModal;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCXModificarClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Modificación de Producto por Sector
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCXModificarClick(Sender: TObject);
begin
  if sdqPCX_CANCERSUSTTRAB.IsEmpty then
    Exit;

  with sdqPCX_CANCERSUSTTRAB do
  begin
    fraProdSector.Codigo          := FieldByName('ps_idproducto').AsString;
    FProdAnt                      := FieldByName('ps_idproducto').AsInteger;
    edNombreComercial.Text        := FieldByName('cd_nombre_comercial').AsString;
    fraUsos.Value                 := FieldByName('ps_iduso').AsInteger;
    FUsoAnt                       := FieldByName('ps_iduso').AsInteger;
    chkMatPrima.Checked           := FieldByName('ps_matprima').AsString = SQL_TRUE;
    chkProdFinal.Checked          := FieldByName('ps_prodfinal').AsString = SQL_TRUE;
    chkAlmacenamiento.Checked     := FieldByName('ps_almacen').AsString = SQL_TRUE;
    chkOtros.Checked              := FieldByName('ps_otros').AsString = SQL_TRUE;
    edCU_OTROS_MODOS_EMPLEO.Text  := AdjustLineBreaks (FieldByName('pd_modosempleo').AsString);
    fraSectores.Value             := FieldByName('ps_idsector').AsInteger;
    FSectorAnt                    := FieldByName('ps_idsector').AsInteger;
    edCX_TRAB_PERMANENTE.Value    := FieldByName('ps_trabpermanente').AsInteger;
    edCX_TRAB_NOPERMANENTE1.Value := FieldByName('ps_trabnopermanente1').AsInteger;
    edCX_TRAB_NOPERMANENTE2.Value := FieldByName('ps_trabnopermanente2').AsInteger;
    cmbCU_UNIDAD.ItemIndex        := ArrayPos(FieldByName('ps_unidad').AsString, UNIDAD_PCU);
    edCU_CANTIDAD.Text            := FieldByName('ps_cantidad').AsString;

    ModoABMTablas := maModificacion;

    fpPCU_CANCERUSOSUSTANCIAS.ShowModal;
  end;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCXEliminarClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Baja de Producto por Sector
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCXEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCX_CANCERSUSTTRAB, 'PS', 'hys.pps_canproductosector');
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCX_CANCERSUSTTRABDblClick(Sender: TObject);
begin
  if tbSustancias.Enabled and tbPCXModificar.Enabled Then
    tbPCXModificarClick(Nil);
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCX_CANCERSUSTTRABGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCX_CANCERSUSTTRAB.FieldByName('ps_fechabaja').IsNull Then
    AFont.Color := clRed;
end;
{-----------------------------------------------------------------------------
  Procedure:   btnPCUAceptarClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Graba datos de Producto por Sector
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.btnPCUAceptarClick(Sender: TObject);
var
  FIDProducto,
  FIDProductoSector: Integer;
  sSql: String;
begin
  if  ExisteSQL('SELECT 1 ' +
                '  FROM hys.pps_canproductosector ' +
                ' WHERE ps_idcaninforme = ' + SqlValue (edNumeroInforme.Value) +
                '   AND ps_idproducto = ' + SqlInteger (fraProdSector.sdqDatos.FieldByName('rg_id').AsString) +
                '   AND ps_idsector = ' + SqlValue (fraSectores.Value) +
                '   AND ps_iduso = ' + SqlValue (fraUsos.Value)) then;

  VerificarMultiple (['Productos por Sector',
                      fraProdSector,
                      not fraProdSector.IsEmpty,
                      'Debe seleccionar un Producto',

                      edNombreComercial,
                      not IsEmptyString(edNombreComercial.Text),
                      'Debe ingresar el Nombre Comercial del Producto',

                      fraUsos,
                      not fraUsos.IsEmpty,
                      'Debe ingresar el Uso',

                      fraUsos,
                      (ModoABMTablas = maModificacion) or
                      ((ModoABMTablas = maAlta) and
                       (not ExisteSQL('SELECT 1 ' +
                                      '  FROM hys.pps_canproductosector ' +
                                      ' WHERE ps_idcaninforme = ' + SqlValue (edNumeroInforme.Value) +
                                      '   AND ps_idproducto = ' + SqlInteger (fraProdSector.Value) +
                                      '   AND ps_idsector = ' + SqlValue (fraSectores.Value) +
                                      '   AND ps_iduso = ' + SqlValue (fraUsos.Value)))),
                      'Ya se ha agregado anteriormente el producto con el mismo uso y sector.',

                      fraUsos,
                      (ModoABMTablas = maAlta) or
                      ((ModoABMTablas = maModificacion) and
                       (((fraProdSector.Value = FProdAnt) and (fraSectores.Value = FSectorAnt) and (fraUsos.Value = FUsoAnt)) or
                        (((fraProdSector.Value <> FProdAnt) or (fraSectores.Value <> FSectorAnt) or (fraUsos.Value <> FUsoAnt)) and
                         (not ExisteSQL('SELECT 1 ' +
                                        '  FROM hys.pps_canproductosector ' +
                                        ' WHERE ps_idcaninforme = ' + SqlValue (edNumeroInforme.Value) +
                                        '   AND ps_idproducto = ' + SqlInteger (fraProdSector.Value) +
                                        '   AND ps_idsector = ' + SqlValue (fraSectores.Value) +
                                        '   AND ps_iduso = ' + SqlValue (fraUsos.Value)))))),
                      'Ya se ha agregado anteriormente el producto con el mismo uso y sector.',

                      edCU_OTROS_MODOS_EMPLEO,
                      (not chkOtros.Checked) or
                      ((chkOtros.Checked) and (Trim(edCU_OTROS_MODOS_EMPLEO.Text) <> '')),
                      'Debe especificar los otros modos de empleo',

                      fraSectores,
                      not fraSectores.IsEmpty,
                      'Debe ingresar el Sector',

                      edCX_TRAB_PERMANENTE,
                      not IsEmptyString(edCX_TRAB_PERMANENTE.Text),
                      'Debe ingresar la ' + lbCX_TRAB_PERMANENTE.Caption,

                      edCX_TRAB_NOPERMANENTE1,
                      not IsEmptyString(edCX_TRAB_NOPERMANENTE1.Text),
                      'Debe ingresar la ' + lbCX_TRAB_NOPERMANENTE1.Caption,

                      edCX_TRAB_NOPERMANENTE2,
                      not IsEmptyString(edCX_TRAB_NOPERMANENTE2.Text),
                      'Debe ingresar la ' + lbCX_TRAB_NOPERMANENTE2.Caption,

                      edCU_CANTIDAD,
                      edCU_CANTIDAD.Value > 0,
                      'Debe ingresar la Cantidad del producto Utilizada',

                      cmbCU_UNIDAD,
                      cmbCU_UNIDAD.ItemIndex <> -1,
                      'Debe ingresar la Unidad de Medida']);

  BeginTrans;
  try
    // Inserto el producto si no existe en hys.pcd_canproductos
    if not ExisteSQl ('SELECT 1 ' +
                      '  FROM hys.pcd_canproductos ' +
                      ' WHERE cd_idsubstancia = ' + SqlValue(fraProdSector.sdqDatos.FieldByName('rg_id').AsString) +
                      '   AND UPPER(cd_nombre_comercial) = ' + SqlValue(edNombreComercial.Text)) then
    begin
      FIDProductoSector := GetSecNextVal('hys.seq_pcd_id');
      sSql := 'INSERT INTO hys.pcd_canproductos ' +
              '            (cd_id, cd_nombre_comercial, cd_idsubstancia, cd_fechaalta, ' +
              '             cd_usualta) ' +
              '     VALUES ( ' +
                            SqlValue(FIDProductoSector) + ', ' +
                            SqlValue(edNombreComercial.Text) + ', ' +
                            SqlValue(fraProdSector.sdqDatos.FieldByName('rg_id').AsString) + ', ' +
                            'SYSDATE, ' +
                            SqlValue(frmPrincipal.DBLogin.UserID) + ')';
      EjecutarSqlST (sSql);
    end
    else
      FIDProductoSector := fraProdSector.Value;

    if ModoABMTablas = maAlta then
    begin
      FIDProducto := GetSecNextVal('HYS.seq_pps_id');

      sSql := 'INSERT INTO hys.pps_canproductosector ' +
              '            (ps_id, ps_idcaninforme, ps_idproducto, ps_idsector, ps_iduso, ' +
              '             ps_matprima, ps_prodfinal, ps_almacen, ps_otros, pd_modosempleo, ' +
              '             ps_trabpermanente, ps_trabnopermanente1, ps_trabnopermanente2, ' +
              '             ps_unidad, ps_cantidad, ps_fechaalta, ps_usualta) ' +
              '     VALUES (' + SqlValue(FIDProducto) + ', ' +
                                SqlValue(edNumeroInforme.Value) + ', ' +
                                SqlValue(FIDProductoSector) + ', ' +
                                SqlValue(fraSectores.Value) + ', ' +
                                SqlValue(fraUsos.Value) + ', ' +
                                SqlValue(SqlBoolean(chkMatPrima.Checked, False)) + ', ' +
                                SqlValue(SqlBoolean(chkProdFinal.Checked, False)) + ', ' +
                                SqlValue(SqlBoolean(chkAlmacenamiento.Checked, False)) + ', ' +
                                SqlValue(SqlBoolean(chkOtros.Checked, False)) + ', ' +
                                SqlValue(edCU_OTROS_MODOS_EMPLEO.Text) + ', ' +
                                SqlValue(edCX_TRAB_PERMANENTE.Value) + ', ' +
                                SqlValue(edCX_TRAB_NOPERMANENTE1.Value) + ', ' +
                                SqlValue(edCX_TRAB_NOPERMANENTE2.Value) + ', ' +
                                SqlValue(UNIDAD_PCU[cmbCU_UNIDAD.ItemIndex]) + ', ' +
                                SqlValue(edCU_CANTIDAD.Value) + ', ' +
              '                 SYSDATE, ' +
                                SqlValue(frmPrincipal.DBLogin.UserID) + ')'
    end
    else begin
      FIDProducto := sdqPCX_CANCERSUSTTRAB.FieldByName('ps_id').AsInteger;

      sSql := 'UPDATE hys.pps_canproductosector ' +
              '   SET ps_idproducto = ' + SqlValue(FIDProductoSector) + ', ' +
              '       ps_idsector = ' + SqlValue(fraSectores.Value) + ', ' +
              '       ps_iduso = ' + SqlValue(fraUsos.Value) + ', ' +
              '       ps_matprima = ' + SqlValue(SqlBoolean(chkMatPrima.Checked, False)) + ', ' +
              '       ps_prodfinal = ' + SqlValue(SqlBoolean(chkProdFinal.Checked, False)) + ', ' +
              '       ps_almacen = ' + SqlValue(SqlBoolean(chkAlmacenamiento.Checked, False)) + ', ' +
              '       ps_otros = ' + SqlValue(SqlBoolean(chkOtros.Checked, False)) + ', ' +
              '       pd_modosempleo = ' + SqlValue(edCU_OTROS_MODOS_EMPLEO.Text) + ', ' +
              '       ps_trabpermanente = ' + SqlValue(edCX_TRAB_PERMANENTE.Value) + ', ' +
              '       ps_trabnopermanente1 = ' + SqlValue(edCX_TRAB_NOPERMANENTE1.Value) + ', ' +
              '       ps_trabnopermanente2 = ' + SqlValue(edCX_TRAB_NOPERMANENTE2.Value) + ', ' +
              '       ps_unidad = ' + SqlValue(UNIDAD_PCU[cmbCU_UNIDAD.ItemIndex]) + ', ' +
              '       ps_cantidad = ' + SqlValue(edCU_CANTIDAD.Value) + ', ' +
              '       ps_fechamodif = SYSDATE, ' +
              '       ps_usumodif = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
              '       ps_fechabaja = NULL, ' +
              '       ps_usubaja = NULL ' +
              ' WHERE ps_id = ' + SqlValue(FIDProducto)

    end;

    EjecutarSqlST (sSql);
    CommitTrans;

    fpPCU_CANCERUSOSUSTANCIAS.ModalResult := mrOk;
    sdqPCX_CANCERSUSTTRAB.Refresh;
    sdqPCX_CANCERSUSTTRABAfterScroll(sdqPCX_CANCERSUSTTRAB);
  except
    on E: Exception do begin
      ErrorMsg(E, 'Error al guardar datos del Producto');
      Rollback;
    end;
  end;
end;

{-----------------------------------------------------------------------------
 Trabajadores
-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------
  Procedure:   tbPCTNuevoClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Alta de trabajador
-----------------------------------------------------------------------------}

procedure TfrmInfCancerigenos.LimpiarDatosTrabajador;
begin
  fraTrabajador.Clear;
  fraSectoresTrab.Clear;
  fraCT_DOCUMENTOTIPO.Clear;
  edCT_EDAD.Clear;
  edCT_ANTIGUEDAD.Clear;
  cmbCT_UNIDAD.ItemIndex := -1;
  edCT_CATEGORIA.Clear;
  edAutoCO_ANTIGUEDAD.Clear;
  cmbAutoCO_UNIDAD.ItemIndex := -1;
  lblRelacion.Caption := '';
end;

procedure TfrmInfCancerigenos.tbPCTNuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Agregar Trabajador',
                      btnAplicar,
                      not edNumeroInforme.IsEmpty,
                      'No puede darse de alta un Trabajador si aún no registró el informe (Aplicar)']);

  LimpiarDatosTrabajador;
  ModoABMTablas := maAlta;

  fpTrabajadores.ShowModal;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCTModificarClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Modificación de trabajador
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCTModificarClick(Sender: TObject);
begin
  if sdqPCT_CANCERTRABAJADOR.IsEmpty then
    Exit;

  with sdqPCT_CANCERTRABAJADOR do
  begin
    fraTrabajador.Value       := FieldByName('ct_idtrabajador').AsInteger;
    fraSectoresTrab.Value     := FieldByName('ct_idsector').AsInteger;
    fraCT_DOCUMENTOTIPO.Value := FieldByName('ct_documentotipo').AsString;
    edCT_EDAD.Value           := FieldByName('ct_edad').AsInteger;
    edCT_ANTIGUEDAD.Value     := FieldByName('ct_antiguedadempresa').AsInteger;
    cmbCT_UNIDAD.ItemIndex    := ArrayPos(FieldByName('ct_unidadempresa').AsString, UNIDAD_TIEMPO);
    edCT_CATEGORIA.Text       := FieldByName('ct_categoria').AsString;
    edAutoCO_ANTIGUEDAD.Value := FieldByName('ct_antiguedadsector').AsInteger;
    cmbAutoCO_UNIDAD.ItemIndex:= ArrayPos(FieldByName('ct_unidadsector').AsString, UNIDAD_TIEMPO);

    ModoABMTablas := maModificacion;

    fpTrabajadores.ShowModal;
  end;
end;
{-----------------------------------------------------------------------------
  Procedure:   tbPCTEliminarClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Baja de trabajador
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbPCTEliminarClick(Sender: TObject);
begin
  chbSinInformar.Checked := false;
  fpMotivoBaja.ShowModal;

  DoDarDeBaja(sdqPCT_CANCERTRABAJADOR, 'CT', 'hys.pct_cantrabajador');
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCT_CANCERTRABAJADORDblClick(Sender: TObject);
begin
  if tbSustancias.Enabled and tbPCTModificar.Enabled Then
    tbPCTModificarClick(Nil);
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.dbgPCT_CANCERTRABAJADORGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCT_CANCERTRABAJADOR.FieldByName('CT_FECHABAJA').IsNull Then
    AFont.Color := clRed
  else
    if sdqPCT_CANCERTRABAJADOR.FieldByName('CT_CONERROR').AsString = 'S' Then
    begin
      Background := clYellow;
      AFont.Color := clBlack;

      if Highlight then
      begin
        Background := clBlack;
        AFont.Color := clYellow;
      end
    end
    else
      if sdqPCT_CANCERTRABAJADOR.FieldByName('CT_IMPORTADORELEV').AsString = 'S' Then
      begin
        Background := clMoneyGreen;
        AFont.Color := clBlack;

        if Highlight then
        begin
          Background := clBlack;
          AFont.Color := clLime;
        end
      end;
end;
{-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.edCT_CUILKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnPCTTomarDatosClick(Sender);
end;
{-----------------------------------------------------------------------------
  Procedure:   btnPCTTomarDatosClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Toma datos del trabajador en base al CUIL
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.btnPCTTomarDatosClick(Sender: TObject);
var
  sSql: string;
  nCantidad: integer;
  TipoFecha: TTipoFecha;
begin
  sSql := 'SELECT tj_id, tj_nombre, tj_fnacimiento, tj_cuil, ' +
          '       NVL(rl_categoria, ''SIN CATEGORIA'') rl_categoria, rl_fechaingreso, ' +
          '       NVL2(rl_id, '''', ''SIN RELACION LABORAL ACTIVA'') rl_activa, rl_sector ' +
          '  FROM comunes.ctj_trabajador ctj, comunes.crl_relacionlaboral ' +
          ' WHERE tj_id = rl_idtrabajador(+) ' +
          '   AND rl_contrato = ' + SqlValue(fraCE_CUIT.Contrato) +
          iif(Length (Trim(fraTrabajador.mskCUIL.Text)) = 11,
              '   AND tj_cuil = :cuil ',
              '   AND tj_documento = :cuil ') +
          'UNION ' +
          'SELECT tj_id, tj_nombre, tj_fnacimiento, tj_cuil, ' +
          '       NVL(hl_categoria, ''SIN CATEGORIA'') hl_categoria, hl_fechaingreso, ' +
          '       ''SIN RELACION LABORAL ACTIVA'' hl_activa, hl_sector ' +
          '  FROM comunes.ctj_trabajador ctj, comunes.chl_historicolaboral ' +
          ' WHERE tj_id = hl_idtrabajador ' +
          '   AND hl_contrato = ' + SqlValue(fraCE_CUIT.Contrato) +
          iif(Length (Trim(fraTrabajador.mskCUIL.Text)) = 11,
              '   AND tj_cuil = :cuil ',
              '   AND tj_documento = :cuil ');

  with GetQueryEx(sSql, [fraTrabajador.mskCUIL.Text]) do
    try
      if IsEmpty then
      begin
        if Trim(fraTrabajador.mskCUIL.Text) <> '' then
          MsgBox('El trabajador no existe', MB_ICONERROR + MB_OK);
        LimpiarDatosTrabajador;
        abort;
      end;

      fraTrabajador.Value := FieldByName('tj_id').AsInteger;

      if fraTrabajador.Value > 0 then
      begin
        lblRelacion.Caption := FieldByName('rl_activa').AsString;

        Get_DiferenciaFechas(Now, FieldByName('rl_fechaingreso').AsDateTime, nCantidad, TipoFecha);
        edCT_CATEGORIA.Text       := FieldByName('rl_categoria').AsString;
        fraSectoresTrab.Value := ValorSqlInteger ('SELECT ce_id ' +
                                                  '  FROM hys.pce_cansector ' +
                                                  ' WHERE UPPER(ce_descripcion) = UPPER(' + SqlValue (FieldByName('rl_sector').AsString) + ')');

        edCT_ANTIGUEDAD.Value     := nCantidad;
        edAutoCO_ANTIGUEDAD.Value := edCT_ANTIGUEDAD.Value;

        fraCT_DOCUMENTOTIPO.Value := '99';

        if not FieldByName('tj_fnacimiento').IsNull then
          edCT_EDAD.Value := GetAge(FieldByName('tj_fnacimiento').AsDateTime);

        case TipoFecha of
          tfDias  : cmbCT_UNIDAD.ItemIndex := 0;
          tfMeses : cmbCT_UNIDAD.ItemIndex := 1;
          tfAnios : cmbCT_UNIDAD.ItemIndex := 2;
        end;

        cmbAutoCO_UNIDAD.ItemIndex := cmbCT_UNIDAD.ItemIndex
      end
      else
      begin
        MsgBox(Format('El trabajador existe pero no tiene ' + #13 +
                      'relación laboral asociada al contrato %d', [fraCE_CUIT.Contrato]),
                      MB_ICONERROR + MB_OK);
        LimpiarDatosTrabajador;
      end
    finally
      Free;
    end;
end;
{-----------------------------------------------------------------------------
  Procedure:   btnTrabAceptarClick
  Author:      racastro
  Date:        05-Jul-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Graba datos de trabajador
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.btnTrabAceptarClick(Sender: TObject);
var
  EnRelev: Boolean;
  sSql: String;
  AntEmpresa,
  AntSector,
  FIDCanTrab: Integer;
begin
  AntEmpresa := 0;
  if (edCT_ANTIGUEDAD.Value <> 0) and (cmbCT_UNIDAD.ItemIndex <> -1) then
    AntEmpresa := edCT_ANTIGUEDAD.Value * iif (cmbCT_UNIDAD.ItemIndex = 0,
                                               1,
                                               iif (cmbCT_UNIDAD.ItemIndex = 1, 30, 360)
                                              );
  AntSector := 0;
  if (edAutoCO_ANTIGUEDAD.Value <> 0) and (cmbAutoCO_UNIDAD.ItemIndex <> -1) then
    AntSector  := edAutoCO_ANTIGUEDAD.Value * iif (cmbAutoCO_UNIDAD.ItemIndex = 0,
                                                   1,
                                                   iif (cmbAutoCO_UNIDAD.ItemIndex = 1, 30, 360)
                                                  );
  VerificarMultiple (['Agregar Trabajador',
                      fraTrabajador,
                      not fraTrabajador.IsEmpty,
                      'Debe ingresar el Trabajador.',

                      fraTrabajador,
                      (ModoABMTablas <> maAlta) or
                      ((ModoABMTablas = maAlta) and
                       (not ExisteSQL('SELECT 1 ' +
                                      '  FROM hys.pct_cantrabajador ' +
                                      ' WHERE ct_idcaninforme = ' + SqlValue (edNumeroInforme.Value) +
//                                      '   AND ct_idsector = ' + SqlValue (fraSectoresTrab.Value) +
                                      '   AND ct_idtrabajador = ' + SqlValue (fraTrabajador.Value)))),
                      'Ya existe el trabajador en el informe.',

                      fraCT_DOCUMENTOTIPO,
                      not fraCT_DOCUMENTOTIPO.IsEmpty,
                      'Debe seleccionar el Tipo de Documento.',

                      edCT_EDAD,
                      edCT_EDAD.Value > 6,
                      'Debe ingresar una Edad Válida.',

                      edCT_ANTIGUEDAD,
                      edCT_ANTIGUEDAD.Value <> 0,
                      'Debe ingresar la Antigüedad en la Empresa.',

                      cmbCT_UNIDAD,
                      cmbCT_UNIDAD.ItemIndex <> -1,
                      'Debe seleccionar la Unidad de Tiempo de la Antigüedad en la Empresa.',

                      edCT_CATEGORIA,
                      not IsEmptyString(edCT_CATEGORIA.Text),
                      'Debe ingresar la Categoría del Trabajador.',

                      fraSectoresTrab,
                      not fraSectoresTrab.IsEmpty,
                      'Debe ingresar el Sector de trabajo.',

                      edAutoCO_ANTIGUEDAD,
                      edAutoCO_ANTIGUEDAD.Value <> 0,
                      'Debe ingresar la Antigüedad en el Sector.',

                      cmbAutoCO_UNIDAD,
                      cmbAutoCO_UNIDAD.ItemIndex <> -1,
                      'Debe seleccionar la Unidad de Tiempo de la Antigüedad en el Sector.',

                      edAutoCO_ANTIGUEDAD,
                      AntSector <= AntEmpresa,
                      'La antigüedad en el sector debe ser menor que la antigüedad en la empresa.']);

  EnRelev := ExisteSqlEx ('SELECT 1 ' +
                          '  FROM art.prt_riestrab ' +
                          ' WHERE rt_cuit = :pcuit ' +
                          '   AND rt_estableci = :pestableci ' +
                          '   AND rt_cuil = :pcuil ' +
                          '   AND rt_fecha = (SELECT MAX(cn_fecharelevamiento) ' +
                          '                     FROM hys.hcn_cabeceranomina ' +
                          '                    WHERE cn_cuit = rt_cuit ' +
                          '                      AND cn_estableci = rt_estableci ' +
                          '                      AND EXTRACT(YEAR FROM cn_fecharelevamiento) = EXTRACT(YEAR FROM TO_DATE(:pfecha, ''dd/mm/yyyy'')) - 1) ',
                          [fraCE_CUIT.CUIT,
                           fraEstablecimiento.edCodigo.Value,
                           fraTrabajador.mskCUIL.Text,
                           edCI_FECHA.Text]);

  BeginTrans;
  try
    if ModoABMTablas = maAlta then
    begin
      FIDCanTrab := GetSecNextVal('HYS.seq_pct_id');

      sSql := 'INSERT INTO hys.pct_cantrabajador ' +
              '            (ct_id, ct_idcaninforme, ct_idtrabajador, ct_documentotipo, ' +
              '             ct_edad, ct_antiguedadsector, ct_unidadsector, ' +
              '             ct_antiguedadempresa, ct_unidadempresa, ct_categoria, ' +
              '             ct_idsector, ct_importadorelev, ct_fechaalta, ct_usualta) ' +
              '     VALUES (' + SqlValue(FIDCanTrab) + ', ' +
                                SqlValue(edNumeroInforme.Value) + ', ' +
                                SqlValue(fraTrabajador.Value) + ', ' +
                                SqlValue(fraCT_DOCUMENTOTIPO.Value) + ', ' +
                                SqlValue(edCT_EDAD.Value) + ', ' +
                                SqlValue(edAutoCO_ANTIGUEDAD.Value) + ', ' +
                                SqlValue(UNIDAD_TIEMPO[cmbAutoCO_UNIDAD.ItemIndex]) + ', ' +
                                SqlValue(edCT_ANTIGUEDAD.Value) + ', ' +
                                SqlValue(UNIDAD_TIEMPO[cmbCT_UNIDAD.ItemIndex]) + ', ' +
                                SqlValue(edCT_CATEGORIA.Text) + ', ' +
                                SqlValue(fraSectoresTrab.Value) + ', ' +
                                SqlValue(String(iif (EnRelev, 'S', 'N'))) + ', ' +
                                'SYSDATE, ' +
                                SqlValue(frmPrincipal.DBLogin.UserID) + ')';
    end
    else begin
      FIDCanTrab := sdqPCT_CANCERTRABAJADOR.FieldByName('ct_id').AsInteger;

      sSql := 'UPDATE hys.pct_cantrabajador ' +
              '   SET ct_idtrabajador = ' + SqlValue(fraTrabajador.Value) + ', ' +
              '       ct_documentotipo = ' + SqlValue(fraCT_DOCUMENTOTIPO.Value) + ', ' +
              '       ct_edad = ' + SqlValue(edCT_EDAD.Value) + ', ' +
              '       ct_antiguedadsector = ' + SqlValue(edAutoCO_ANTIGUEDAD.Value) + ', ' +
              '       ct_unidadsector = ' + SqlValue(UNIDAD_TIEMPO[cmbAutoCO_UNIDAD.ItemIndex]) + ', ' +
              '       ct_antiguedadempresa = ' + SqlValue(edCT_ANTIGUEDAD.Value) + ', ' +
              '       ct_unidadempresa = ' + SqlValue(UNIDAD_TIEMPO[cmbCT_UNIDAD.ItemIndex]) + ', ' +
              '       ct_categoria = ' + SqlValue(edCT_CATEGORIA.Text) + ', ' +
              '       ct_idsector = ' + SqlValue(fraSectoresTrab.Value) + ', ' +
              '       ct_importadorelev = ' + SqlValue(String(iif (EnRelev, 'S', 'N'))) + ', ' +
              '       ct_fechamodif = SYSDATE, ' +
              '       ct_usumodif = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
              '       ct_bajanoinformado = NULL, ' +
              '       ct_fechabaja = NULL, ' +
              '       ct_usubaja = NULL ' +
              ' WHERE ct_id = ' + SqlValue(FIDCanTrab)
    end;

    EjecutarSqlST (sSql);
    CommitTrans;

    fpTrabajadores.ModalResult := mrOk;
    sdqPCT_CANCERTRABAJADOR.Refresh
  except
    on E: Exception do begin
      ErrorMsg(E, 'Error al guardar datos del Producto');
      Rollback;
    end;
  end;
end;

procedure TfrmInfCancerigenos.fraEstablecimientoExit(Sender: TObject);
begin
  inherited;
  fraEstablecimiento.FrameExit(Sender);
end;

procedure TfrmInfCancerigenos.sbManTrabClick(Sender: TObject);
begin
  if fraTrabajador.IsSelected then
    DoContratoTrabajador(fraTrabajador.Value, fraTrabajador.IdRelacionLaboral)
  else
    DoContratoTrabajador(0, 0);
end;

procedure TfrmInfCancerigenos.fraDomiciliobtnBuscarClick(Sender: TObject);
begin
  inherited;
  fraDomicilio.btnBuscarClick(Sender);

end;

procedure TfrmInfCancerigenos.sbManUsosClick(Sender: TObject);
begin
  Abrir(TfrmManUsosProductos, frmManUsosProductos, tmvModal, nil);
end;

procedure TfrmInfCancerigenos.sbMantSectoresClick(Sender: TObject);
begin
  Abrir(TfrmManSectores, frmManSectores, tmvModal, nil);
end;

procedure TfrmInfCancerigenos.btnAceptarClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePageIndex := PAGE_DATOSGENERALES;
  PageControlChange(Sender);
end;

procedure TfrmInfCancerigenos.btnAplicarClick(Sender: TObject);
begin
  inherited;

  tbModificar.Enabled := true;
  ModoABM := maModificacion;
end;

procedure TfrmInfCancerigenos.tbLimpiarClick(Sender: TObject);
begin
  FDenuncia := false;
  edNumeroInforme.Clear;
  PageControl.ActivePageIndex := PAGE_DATOSGENERALES;
  PKChange(edNumeroInforme.Value <> 0);

  inherited;
end;

procedure TfrmInfCancerigenos.tbNuevoClick(Sender: TObject);
begin
  FDenuncia := false;
  inherited;
end;

{-----------------------------------------------------------------------------
  Denuncias
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbDenunciasClick(Sender: TObject);
begin
  FDenuncia := True;
  inherited tbNuevoClick(Sender);
end;

procedure TfrmInfCancerigenos.dbgDenunciasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqdENUNCIAS.FieldByName('CD_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;

{-----------------------------------------------------------------------------
  Procedure:   tbDenNuevoClick
  Author:      racastro
  Date:        13-Ago-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Alta denuncia
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbDenNuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Agregar denuncia',
                      btnAplicar,
                      not edNumeroInforme.IsEmpty,
                      'No puede darse de alta una Denuncia si aún no registró el informe (Aplicar)']);

  FIdDenuncia := 0;
  edFechaDenuncia.Clear;
  fraMotivos.Clear;
  fraSustanciasDen.Clear;
  memObsDenuncia.Clear;

  ModoABMTablas := maAlta;
  fpDenuncia.ShowModal;
end;

{-----------------------------------------------------------------------------
  Procedure:   tbDenModificarClick
  Author:      racastro
  Date:        13-Ago-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Modifica denuncia
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbDenModificarClick(Sender: TObject);
begin
  if sdqDenuncias.IsEmpty or (not sdqDenuncias.FieldByName('cd_fechabaja').IsNull) then
    Exit;

  FIdDenuncia := sdqDenuncias.FieldByName('cd_id').AsInteger;
  edFechaDenuncia.Date := sdqDenuncias.FieldByName('cd_fecha').AsDateTime;
  fraMotivos.Value := sdqDenuncias.FieldByName('cd_idmotivo').AsInteger;
  fraSustanciasDen.Value := sdqDenuncias.FieldByName('cd_idsustancia').AsInteger;
  memObsDenuncia.Text := AdjustLineBreaks (sdqDenuncias.FieldByName('cd_observacion').AsString);

  ModoABMTablas := maModificacion;
  fpDenuncia.ShowModal;
end;

{-----------------------------------------------------------------------------
  Procedure:   sbMantIncumplimientosClick
  Author:      racastro
  Date:        14-Ago-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Mantenimiento de Incumplimientos
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.sbMantIncumplimientosClick(Sender: TObject);
begin
  Abrir(TfrmManIncumplimientos, frmManIncumplimientos, tmvModal, nil);
end;

{-----------------------------------------------------------------------------
  Procedure:   btnAceptarDenClick
  Author:      racastro
  Date:        14-Ago-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Regista datos de la denuncia asociada al informe
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.btnAceptarDenClick(Sender: TObject);
var
  sSql : String;
begin
  VerificarMultiple (['Denuncias asociadas al informe',
                      edFechaDenuncia,
                      not edFechaDenuncia.IsEmpty,
                      'Debe indicar la fecha de la denuncia',

                      edFechaDenuncia,
                      edFechaDenuncia.Date <= Today,
                      'La fecha de la denuncia debe ser anterior o igual a la actual',

                      fraMotivos,
                      fraMotivos.IsSelected,
                      'Debe indicar el motivo',

                      fraMotivos,
                      ((ModoABMTablas <> maAlta) and
                       (not ExisteSQL('SELECT 1 ' +
                                     '  FROM hys.pcd_caninformedenuncia ' +
                                     ' WHERE cd_id <> ' + SqlValue(FIdDenuncia) +
                                     '   AND cd_idcaninforme = ' + SqlValue (edCI_ID.Text) +
                                     '   AND cd_fecha = ' + SqlDate(edFechaDenuncia.Date) +
                                     '   AND cd_idmotivo = ' + SqlValue(fraMotivos.Value) +
                                     '   AND cd_idsustancia ' + iif (fraSustanciasDen.IsEmpty, 'IS NULL', '= ' + SqlValue (fraSustanciasDen.Value)))))
                      or
                      ((ModoABMTablas = maAlta) and
                       (not ExisteSQL('SELECT 1 ' +
                                     '  FROM hys.pcd_caninformedenuncia ' +
                                     ' WHERE cd_idcaninforme = ' + SqlValue (edCI_ID.Text) +
                                     '   AND cd_fecha = ' + SqlDate(edFechaDenuncia.Date) +
                                     '   AND cd_idmotivo = ' + SqlValue(fraMotivos.Value) +
                                     '   AND cd_fechabaja IS NULL ' +
                                     '   AND cd_idsustancia ' + iif (fraSustanciasDen.IsEmpty, 'IS NULL', '= ' + SqlValue (fraSustanciasDen.Value))))),
                      'Ya existe una denuncia similar para este informe']);
  BeginTrans;
  try
    if ModoABMTablas = maAlta then
    begin
      sSql := 'INSERT INTO hys.pcd_caninformedenuncia ' +
              '            (cd_idcaninforme, cd_fecha, cd_idmotivo, ' +
              '             cd_idsustancia, cd_fechaalta, cd_usualta, cd_id, cd_observacion) ' +
              '     VALUES (' +
                            SqlValue (edCI_ID.Text) + ', ' +
                            SqlDate (edFechaDenuncia.Date) + ', ' +
                            SqlValue (fraMotivos.Value) + ', ' +
                            iif (fraSustanciasDen.IsSelected, SqlValue (fraSustanciasDen.Value), SQL_NULL) + ', ' +
                            'SYSDATE, ' +
                            SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
                            'hys.seq_pid_id.NEXTVAL, ' + SqlValue (memObsDenuncia.Text) + ')'
    end
    else begin
      sSql:=  'UPDATE hys.pcd_caninformedenuncia ' +
              '   SET cd_observacion = ' + SqlValue(memObsDenuncia.Text) +','+
              '       cd_idsustancia = ' + SqlInt(fraSustanciasDen.Value,True) +','+
              '       cd_fecha = ' + SqlDate (edFechaDenuncia.Date) +','+
              '       cd_idmotivo = ' + SqlValue(fraMotivos.Value) +
              ' WHERE cd_id = ' + SqlValue(sdqDenuncias.FieldByName('cd_id').AsInteger)
    end;

    EjecutarSqlST (sSql);

    CommitTrans;

    fpDenuncia.ModalResult := mrOk;
    sdqDenuncias.Refresh;

    // Actualizo los checkbox de denuncias en Datos Generales
    case fraMotivos.Value of
      2: begin
        chbDenunciarEmpresa.Checked := true;
        memObsDen1.Text := memObsDenuncia.Text
      end;
      3: begin
        chbDenunciarResponsable.Checked := true;
        memObsDen2.Text := memObsDenuncia.Text
      end;
      4: begin
        chbDenunciarPersonal.Checked := true;
        memObsDen3.Text := memObsDenuncia.Text
      end;
      6: begin
        chbDenunciarServMedLab.Checked := true;
        memObsDen4.Text := memObsDenuncia.Text
      end;
      5: begin
        chbDenunciarServHyS.Checked := true;
        memObsDen5.Text := memObsDenuncia.Text
      end;
    end
  except
    on E: Exception do begin
      ErrorMsg(E, 'Error al guardar datos de la Denuncia');
      Rollback;
    end;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure:   tbDenEliminarClick
  Author:      racastro
  Date:        14-Ago-2007
  Arguments:   Sender: TObject
  Result:      None
  Description: Baja de Denuncia del informe
-----------------------------------------------------------------------------}
procedure TfrmInfCancerigenos.tbDenEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  if sdqDenuncias.IsEmpty or (not sdqDenuncias.FieldByName('CD_FECHABAJA').IsNull) then
    Exit;

  {if ExisteSql ('SELECT 1 FROM hys.pcd_caninformedenuncia ' +
                ' WHERE cd_id = ' + SqlValue(sdqDenuncias.FieldByName('cd_id').AsInteger) +
                '   AND cd_fechaexport IS NOT NULL') then
  begin
    MsgBox('El registro ha sido informado a la SRT. No puede darse de baja.', MB_ICONERROR + MB_Ok);
    Exit
  end;
  }
  if MsgAsk('¿Desea dar de baja el registro seleccionado?') then
  begin
    fpMotivoBajaDenuncia.ShowModal;

    BeginTrans;
    try
      sSql := 'UPDATE hys.pcd_caninformedenuncia ' +
              '   SET cd_fechabaja = SYSDATE, ' +
              '       cd_usubaja = ' + SqlValue(frmPrincipal.DBLogin.UserID) + ', ' +
              '       cd_motivobaja = ' + SqlValue(memMotivoBaja.Text) +
              ' WHERE cd_id = ' + SqlValue(sdqDenuncias.FieldByName('cd_id').AsInteger);

      EjecutarSqlST (sSql);
      CommitTrans;

      case sdqDenuncias.FieldByName('cd_idmotivo').AsInteger of
        2: begin
          chbDenunciarEmpresa.Checked := false;
          memObsDen1.Clear
        end;
        3: begin
          chbDenunciarResponsable.Checked := false;
          memObsDen2.Clear
        end;
        4: begin
          chbDenunciarPersonal.Checked := false;
          memObsDen3.Clear
        end;
        6: begin
          chbDenunciarServMedLab.Checked := false;
          memObsDen4.Clear
        end;
        5: begin
          chbDenunciarServHyS.Checked := false;
          memObsDen5.Clear
        end;
      end;

      sdqDenuncias.Refresh
    except
      on E: Exception do begin
        ErrorMsg(E, 'Error al dar de baja el registro');
        Rollback;
      end;
    end
  end;
end;

procedure TfrmInfCancerigenos.fraTrabajadormskCUILChange(Sender: TObject);
begin
  if Length (Trim(fraTrabajador.mskCUIL.Text)) = 11 then
    btnPCTTomarDatosClick(Sender);
end;

procedure TfrmInfCancerigenos.fraTrabajadormskCUILKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnPCTTomarDatosClick(Sender);
end;

procedure TfrmInfCancerigenos.fraProdSectorcmbDescripcionChange(
  Sender: TObject);
begin
  edNombreComercial.Text := fraProdSector.sdqDatos.FieldByName('cd_nombre_comercial').AsString
end;

procedure TfrmInfCancerigenos.sdqPCX_CANCERSUSTTRABAfterScroll(
  DataSet: TDataSet);
begin
  redOtrosModos.Lines.Clear;
  redOtrosModos.Lines.Add(DataSet.FieldByName('pd_modosempleo').AsString);
end;

procedure TfrmInfCancerigenos.tbModificarClick(Sender: TObject);
begin
  inherited;

  if not sdqConsulta.Active then
    sdqConsulta.Active := true;

  btnAplicar.Enabled := sdqConsulta.FieldByName('ci_fechabaja').IsNull;
  btnAceptar.Enabled := btnAplicar.Enabled;
  tbSustancias.Enabled := btnAplicar.Enabled;
  tbProdSector.Enabled := btnAplicar.Enabled;
  tbTrabajadores.Enabled := btnAplicar.Enabled;
  tbProvCompradores.Enabled := btnAplicar.Enabled;
  tbDen.Enabled := btnAplicar.Enabled;

  FTipoAnterior := rgTipoInforme.ItemIndex;
end;

{procedure TfrmInfCancerigenos.cbNoAlcanzadoResolucionClick(Sender: TObject);
begin
  inherited;
  if cbNoAlcanzadoResolucion.Checked then
  begin
    edCI_FECHA.Date := ValorSqlDateTime('SELECT art.actualdate FROM DUAL');
    edFechaRecepcion.Date := edCI_FECHA.Date;
    rgTipoInforme.ItemIndex := 0;
    vclExtra.LockControls(ScrollBox,True);
    ScrollBox.Enabled := True;
    vclExtra.LockControls([cbNoAlcanzadoResolucion,fraCE_CUIT,fraestablecimiento],false);
  end
  else
  begin
    edCI_FECHA.Date := 0;
    edFechaRecepcion.Date := 0;
    rgTipoInforme.ItemIndex := -1;
    vclExtra.LockControls(ScrollBox,False);
    vclExtra.LockControls(edCI_PERS_TOTAL,True);
  end;

end;
}
procedure TfrmInfCancerigenos.cbNoPresentacionAnexo415Click(Sender: TObject);
var
  sTexto : String;
begin
  sTexto := 'No se realiza presentación de Anexo de Res. SRT. 415/02';
  chbDenunciarEmpresa.Checked := True;
  memObsDen1.Text := sTexto;
  rgTipoInforme.ItemIndex := 0;
  edCI_FECHA.Date := ValorSqlDateTime('SELECT art.actualdate FROM DUAL');
  edFechaRecepcion.Date := edCI_FECHA.Date;
  chbDenunciarResponsable.Checked := True;
  memObsDen2.Text := sTexto;
  chbDenunciarPersonal.Checked := True;
  memObsDen3.Text := sTexto;
  chbDenunciarServMedLab.Checked := True;
  memObsDen4.Text := sTexto;
  chbDenunciarServHyS.Checked := True;
  memObsDen5.Text := sTexto;
end;

procedure TfrmInfCancerigenos.chbDenunciarEmpresaClick(Sender: TObject);
begin
  memObsDen1.Enabled := chbDenunciarEmpresa.Checked;
  if memObsDen1.Enabled then
  begin
    memObsDen1.Text  := AdjustLineBreaks (ValorSqlEx('SELECT NVL(cd_observacion, '''') ' +
                                                     '  FROM hys.pcd_caninformedenuncia ' +
                                                     ' WHERE cd_idcaninforme = :ci_id ' +
                                                     '   AND cd_fechabaja IS NULL ' +
                                                     '   AND cd_idmotivo = 2', [edNumeroInforme.Value]));
    if PageControl.Enabled then
      ActiveControl := memObsDen1;
  end
end;

procedure TfrmInfCancerigenos.chbDenunciarResponsableClick(
  Sender: TObject);
begin
  memObsDen2.Enabled := chbDenunciarResponsable.Checked;
  if memObsDen2.Enabled then
  begin
    memObsDen2.Text  := AdjustLineBreaks (ValorSqlEx('SELECT NVL(cd_observacion, '''') ' +
                                                     '  FROM hys.pcd_caninformedenuncia ' +
                                                     ' WHERE cd_idcaninforme = :ci_id ' +
                                                     '   AND cd_fechabaja IS NULL ' +
                                                     '   AND cd_idmotivo = 3', [edNumeroInforme.Value]));
    if PageControl.Enabled then
      ActiveControl := memObsDen2;
  end
end;

procedure TfrmInfCancerigenos.chbDenunciarPersonalClick(Sender: TObject);
begin
  memObsDen3.Enabled := chbDenunciarPersonal.Checked;
  if memObsDen3.Enabled then
  begin
    memObsDen3.Text  := AdjustLineBreaks (ValorSqlEx('SELECT NVL(cd_observacion, '''') ' +
                                                     '  FROM hys.pcd_caninformedenuncia ' +
                                                     ' WHERE cd_idcaninforme = :ci_id ' +
                                                     '   AND cd_fechabaja IS NULL ' +
                                                     '   AND cd_idmotivo = 4', [edNumeroInforme.Value]));
    if PageControl.Enabled then
      ActiveControl := memObsDen3;
  end
end;

procedure TfrmInfCancerigenos.chbDenunciarServMedLabClick(Sender: TObject);
begin
  memObsDen4.Enabled := chbDenunciarServMedLab.Checked;
  if memObsDen4.Enabled then
  begin
    memObsDen4.Text  := AdjustLineBreaks (ValorSqlEx('SELECT NVL(cd_observacion, '''') ' +
                                                     '  FROM hys.pcd_caninformedenuncia ' +
                                                     ' WHERE cd_idcaninforme = :ci_id ' +
                                                     '   AND cd_fechabaja IS NULL ' +
                                                     '   AND cd_idmotivo = 6', [edNumeroInforme.Value]));
    if PageControl.Enabled then
      ActiveControl := memObsDen4;
  end
end;

procedure TfrmInfCancerigenos.chbDenunciarServHySClick(Sender: TObject);
begin
  memObsDen5.Enabled := chbDenunciarServHyS.Checked;
  if memObsDen5.Enabled then
  begin
    memObsDen5.Text  := AdjustLineBreaks (ValorSqlEx('SELECT NVL(cd_observacion, '''') ' +
                                                     '  FROM hys.pcd_caninformedenuncia ' +
                                                     ' WHERE cd_idcaninforme = :ci_id ' +
                                                     '   AND cd_fechabaja IS NULL ' +
                                                     '   AND cd_idmotivo = 5', [edNumeroInforme.Value]));
    if PageControl.Enabled then
      ActiveControl := memObsDen5;
  end
end;

procedure TfrmInfCancerigenos.fpDenunciaShow(Sender: TObject);
begin
  if not sdqDenuncias.FieldByName('CD_FECHAEXPORT').IsNull then
  begin
    edFechaDenuncia.Enabled := ModoABMTablas = maAlta;
    fraMotivos.Enabled      := ModoABMTablas = maAlta;
    fraSustanciasDen.Enabled:= ModoABMTablas = maAlta;
  end
  else
  begin
    edFechaDenuncia.Enabled := True;
    fraMotivos.Enabled      := True;
    fraSustanciasDen.Enabled:= True;
  end;
  inherited;
end;

procedure TfrmInfCancerigenos.fpMotivoBajaDenunciaShow(Sender: TObject);
begin
  memMotivoBaja.Clear
end;

procedure TfrmInfCancerigenos.tbTablaPerClick(Sender: TObject);
begin
  Abrir(TfrmTablaPeriodica, frmTablaPeriodica, tmvMDIChild, nil);
end;

procedure TfrmInfCancerigenos.tbTrabajadoresUltRelevClick(Sender: TObject);
var
  sSql: String;
begin
  if MsgBox('Este proceso importa los trabajadores del último relevamiento realizado el año ' +
            'previo al de la fecha del informe.' + #13 + '¿Desea continuar?',
            MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  BeginTrans;
  try
    sSql := 'INSERT INTO hys.pct_cantrabajador ' +
            '            (ct_id, ct_idcaninforme, ct_idtrabajador, ct_documentotipo, ' +
            '             ct_edad, ct_antiguedadsector, ct_antiguedadempresa, ' +
            '             ct_unidadsector, ct_unidadempresa, ct_categoria, ct_fechaalta, ' +
            '             ct_usualta, ct_idsector, ct_importadorelev) ' +
            '  SELECT hys.seq_pct_id.NEXTVAL, :pidcaninforme, rs_idtrabajador, 99, ' +
            '         NVL(TRUNC(MONTHS_BETWEEN(SYSDATE, tj_fnacimiento) / 12), 0), ' +
            '         CASE ' +
            '           WHEN TRUNC(MONTHS_BETWEEN(art.actualdate, rs_fechaingreso)) < 12 THEN DECODE ' +
            '                                                                                  (TRUNC ' +
            '                                                                                     (MONTHS_BETWEEN ' +
            '                                                                                        (art.actualdate, ' +
            '                                                                                         rs_fechaingreso)), ' +
            '                                                                                   0, art.actualdate ' +
            '                                                                                    - rs_fechaingreso, ' +
            '                                                                                   TRUNC ' +
            '                                                                                     (MONTHS_BETWEEN ' +
            '                                                                                        (art.actualdate, ' +
            '                                                                                         rs_fechaingreso))) ' +
            '           ELSE TRUNC(MONTHS_BETWEEN(art.actualdate, rs_fechaingreso) / 12) ' +
            '         END, ' +
            '         CASE ' +
            '           WHEN TRUNC(MONTHS_BETWEEN(art.actualdate, rs_fechaingreso)) < 12 THEN DECODE ' +
            '                                                                                  (TRUNC ' +
            '                                                                                     (MONTHS_BETWEEN ' +
            '                                                                                        (art.actualdate, ' +
            '                                                                                         rs_fechaingreso)), ' +
            '                                                                                   0, art.actualdate ' +
            '                                                                                    - rs_fechaingreso, ' +
            '                                                                                   TRUNC ' +
            '                                                                                     (MONTHS_BETWEEN ' +
            '                                                                                        (art.actualdate, ' +
            '                                                                                         rs_fechaingreso))) ' +
            '           ELSE TRUNC(MONTHS_BETWEEN(art.actualdate, rs_fechaingreso) / 12) ' +
            '         END, ' +
            '         CASE ' +
            '           WHEN TRUNC(MONTHS_BETWEEN(art.actualdate, rs_fechaingreso)) < 12 THEN DECODE ' +
            '                                                                                  (TRUNC ' +
            '                                                                                     (MONTHS_BETWEEN ' +
            '                                                                                        (art.actualdate, ' +
            '                                                                                         rs_fechaingreso)), ' +
            '                                                                                   0, ''D'', ' +
            '                                                                                   ''M'') ' +
            '           ELSE ''A'' ' +
            '         END, ' +
            '         CASE ' +
            '           WHEN TRUNC(MONTHS_BETWEEN(art.actualdate, rs_fechaingreso)) < 12 THEN DECODE ' +
            '                                                                                  (TRUNC ' +
            '                                                                                     (MONTHS_BETWEEN ' +
            '                                                                                        (art.actualdate, ' +
            '                                                                                         rs_fechaingreso)), ' +
            '                                                                                   0, ''D'', ' +
            '                                                                                   ''M'') ' +
            '           ELSE ''A'' ' +
            '         END, ' +

            '       (SELECT NVL(rl_categoria, ' +
            '                   (SELECT NVL(hl_categoria, ''00'') ' +
            '                      FROM comunes.ctj_trabajador ctj, ' +
            '                           comunes.chl_historicolaboral ' +
            '                     WHERE tj_id = hl_idtrabajador ' +
            '                       AND tj_id = rs_idtrabajador ' +
            '                       AND hl_contrato = rs_contrato ' +
            '                       AND ROWNUM = 1)) ' +
            '          FROM comunes.ctj_trabajador ctj, comunes.crl_relacionlaboral ' +
            '         WHERE tj_id = rl_idtrabajador(+) ' +
            '           AND tj_id = rs_idtrabajador ' +
            '           AND rl_contrato = rs_contrato ' +
            '           AND ROWNUM = 1), ' +

            '         SYSDATE, :pusuario, ' +
            '         NVL((SELECT DISTINCT ce_id ' +
            '                         FROM hys.pce_cansector ' +
            '                        WHERE UPPER(ce_descripcion) = UPPER(rs_sector)), 85), ' +
            '         ''S'' ' +
            '    FROM (SELECT DISTINCT rs_idtrabajador, rs_sector, rs_fechaingreso, rs_contrato ' +
            '              FROM hys.v_trabajadores_con_riesgo ' +
            '             WHERE rs_cuit = :pcuit ' +
            '               AND rs_estableci = :pestableci ' +
            '               AND rs_riesgo IN (SELECT rg_codigo ' +
            '                                 FROM prg_riesgos ' +
            '                                 WHERE rg_cancerigeno = ''S''' +
            '                                 AND rg_fechabaja IS NULL ' +
            '                                ) ' +
            '               AND NOT EXISTS(SELECT 1 ' +
            '                                FROM hys.pct_cantrabajador ' +
            '                               WHERE ct_idtrabajador = rs_idtrabajador ' +
            '                                 AND ct_idcaninforme = :pidcaninforme) ' +
            '               AND rs_fecha = (SELECT MAX(cn_fecharelevamiento) ' +
            '                                 FROM hys.hcn_cabeceranomina ' +
            '                                WHERE cn_cuit = rs_cuit ' +
            '                                  AND cn_estableci = rs_estableci ' +
            '                                  AND EXTRACT(YEAR FROM cn_fecharelevamiento) = EXTRACT(YEAR FROM TO_DATE(:pfecha, ''dd/mm/yyyy'')) - 1)), ' +
            '         comunes.ctj_trabajador ' +
            '   WHERE tj_id = rs_idtrabajador';

    EjecutarSqlSTEx (sSql,
                     [edNumeroInforme.Value,
                      frmPrincipal.DBLogin.UserID,
                      fraCE_CUIT.CUIT,
                      fraEstablecimiento.edCodigo.Value,
                      edNumeroInforme.Value,
                      edCI_FECHA.Text]);
    CommitTrans;

    sdqPCT_CANCERTRABAJADOR.Refresh
  except
    on E: Exception do begin
      ErrorMsg(E, 'Error al importar desde último Relev. Expuestos');
      Rollback;
    end;
  end
end;

procedure TfrmInfCancerigenos.fraEstablecimientoedCodigoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if fraCE_CUIT.IsSelected then
  begin
    fraEstablecimiento.CUIT := fraCE_CUIT.mskCUIT.Text;
    fraEstablecimiento.edCodigoKeyPress(Sender, Key);
  end;
end;

procedure TfrmInfCancerigenos.tbOrdenarClick(Sender: TObject);
begin
  LoadDynamicSortFields(SortDialog.SortFields, dbgPCT_CANCERTRABAJADOR.Columns );
  SortDialog.Execute ;
end;

procedure TfrmInfCancerigenos.tbExportarClick(Sender: TObject);
Var
  AutoCols : Boolean;
begin
  if sdqPCT_CANCERTRABAJADOR.Active and (not sdqPCT_CANCERTRABAJADOR.IsEmpty) then begin
     tbExportar.Enabled := False;
     Try
       AutoCols := ExportDialog.Fields.Count = 0;
       try
         if AutoCols Then
           ExportDialog.Fields.Assign( dbgPCT_CANCERTRABAJADOR.Columns );

         ExportDialog.Execute ;
       finally
         if AutoCols Then
            ExportDialog.Fields.Clear ;
       end;
     Finally
       tbExportar.Enabled := True;
     End;
  end;
end;

procedure TfrmInfCancerigenos.tbExcluirCancerigenosClick(Sender: TObject);
begin
  Abrir(TfrmExcluirCancerigenos,frmExcluirCancerigenos,tmvMDIChild,nil);
end;

procedure TfrmInfCancerigenos.tbReplicarClick(Sender: TObject);
var
  NumInforme, IdProveedor : Integer;
  sSql : String;
begin
  inherited;
  if not edNumeroInforme.IsEmpty and sdqConsulta.Active and (sdqConsulta.FieldByName('CI_ID').AsInteger > 0) then
  begin
    if FDenuncia then
      NumInforme := GetSecNextVal('HYS.SEQ_PDE_ID')
    else
      NumInforme := GetSecNextVal('HYS.SEQ_PCI_ID');

    sSql := 'INSERT INTO hys.pci_caninforme ' +
            '            (ci_id, ci_fecha, ci_fecharecepcion, ci_resp_cuilcuit, ci_resp_nombre, ' +
            '             ci_resp_tipodocumento, ci_representacion, ' +
            '             ci_pers_administracion, ci_pers_produccion, ci_idestableci, ' +
            '             ci_fechaalta, ci_usualta, ci_tipointervencion, ci_tipoinforme) ' +
            '      SELECT '+SqlValue(numInforme)+', ci_fecha, ci_fecharecepcion, ci_resp_cuilcuit, '+
            '             ci_resp_nombre, ci_resp_tipodocumento, ci_representacion, '+
            '             ci_pers_administracion, ci_pers_produccion, ci_idestableci,SYSDATE, '+
            SqlValue(Sesion.UserID)+',ci_tipointervencion, ci_tipoinforme '+
            '        FROM hys.pci_caninforme '+
            '       WHERE ci_id = '+SqlValue(sdqConsulta.FieldByName('CI_ID').AsInteger);

    EjecutarSqlST(sSql);

    sSql :=
      'INSERT INTO hys.pcs_cansubstancia '+
      '            (cs_id, cs_idcaninforme, cs_idsubstancia, cs_informacion, '+
      '             cs_capacitacion, cs_estudios, cs_medidas, cs_examen_preocupacional, '+
      '             cs_examen_periodico, cs_examen_egreso, cs_detamb, cs_frecamb, cs_detbio, '+
      '             cs_frecbio, cs_fechaalta, cs_usualta) '+
      '      SELECT hys.seq_pcs_id.NEXTVAL, '+SqlValue(numInforme)+', cs_idsubstancia, '+
      '             cs_informacion, cs_capacitacion, cs_estudios, cs_medidas, '+
      '             cs_examen_preocupacional, cs_examen_periodico, cs_examen_egreso, '+
      '             cs_detamb, cs_frecamb, cs_detbio, cs_frecbio, SYSDATE, '+SqlValue(Sesion.UserID)+
      '        FROM hys.pcs_cansubstancia '+
      '       WHERE cs_idcaninforme = '+SqlValue(sdqConsulta.FieldByName('CI_ID').AsInteger);

    EjecutarSqlST(sSql);

    sSql :=
      'INSERT INTO hys.pps_canproductosector '+
      '            (ps_id, ps_idcaninforme, ps_idproducto, ps_idsector, ps_iduso, '+
      '             ps_matprima, ps_prodfinal, ps_almacen, ps_otros, pd_modosempleo, '+
      '             ps_trabpermanente, ps_trabnopermanente1, ps_trabnopermanente2, '+
      '             ps_unidad, ps_cantidad, ps_fechaalta, ps_usualta) '+
      '      SELECT hys.seq_pps_id.NEXTVAL, '+SqlValue(numInforme)+', ps_idproducto, '+
      '             ps_idsector, ps_iduso, ps_matprima, ps_prodfinal, ps_almacen, '+
      '             ps_otros, pd_modosempleo, ps_trabpermanente, ps_trabnopermanente1, '+
      '             ps_trabnopermanente2, ps_unidad, ps_cantidad, SYSDATE, '+SqlValue(Sesion.UserID)+
      '        FROM hys.pps_canproductosector '+
      '       WHERE ps_idcaninforme = '+SqlValue(sdqConsulta.FieldByName('CI_ID').AsInteger);

    EjecutarSqlST(sSql);

    with GetQuery(
        '      SELECT cp_id, cp_idcaninforme, cp_cuit, cp_nombre, '+
        '             cp_calle, cp_numero, cp_piso, cp_departamento, cp_localidad, cp_partido, '+
        '             cp_provincia, cp_cpostal, cp_cpostala, cp_telefono, cp_indicador '+
        '        FROM hys.pcp_canproveedor '+
        '       WHERE cp_idcaninforme = '+SqlValue(sdqConsulta.FieldByName('CI_ID').AsInteger)) do
    try
      while not Eof do
      begin
        IdProveedor := GetSecNextVal('hys.seq_pcp_id');
        sSql :=
          'INSERT INTO hys.pcp_canproveedor '+
          '            (cp_id, cp_idcaninforme, cp_cuit, cp_nombre, cp_calle, cp_numero, '+
          '             cp_piso, cp_departamento, cp_localidad, cp_partido, cp_provincia, '+
          '             cp_cpostal, cp_cpostala, cp_telefono, cp_indicador, cp_fechaalta, cp_usualta) '+
          '      VALUES('+SqlValue(IdProveedor)+','+SqlValue(numInforme)+','+SqlValue(FieldByName('cp_cuit').AsString)+','+
          SqlValue(FieldByName('cp_nombre').AsString)+','+SqlValue(FieldByName('cp_calle').AsString)+','+
          SqlValue(FieldByName('cp_numero').AsString)+','+SqlValue(FieldByName('cp_piso').AsString)+','+
          SqlValue(FieldByName('cp_departamento').AsString)+','+SqlValue(FieldByName('cp_localidad').AsString)+','+
          SqlValue(FieldByName('cp_partido').AsString)+','+SqlValue(FieldByName('cp_provincia').AsString)+','+
          SqlValue(FieldByName('cp_cpostal').AsString)+','+SqlValue(FieldByName('cp_cpostala').AsString)+','+
          SqlValue(FieldByName('cp_telefono').AsString)+','+SqlValue(FieldByName('cp_indicador').AsString)+',sysdate,'+
          SqlValue(Sesion.UserID)+')';
        EjecutarSqlST(sSql);

        sSql :=
          'INSERT INTO hys.pcr_canprovprod ' +
          '            (cr_id, cd_idproveedor, cd_idproducto) ' +
          '     SELECT hys.seq_pcr_id.NEXTVAL,'+ SqlValue(IdProveedor)+ ',cd_idproducto ' +
          '       FROM hys.pcr_canprovprod '+
          '      WHERE cd_idproveedor = '+SqlValue(FieldByName('cp_id').AsString);
        EjecutarSqlST(sSql);
        Next;
      end;
    finally
      Free;
    end;

    sSql :=
      'INSERT INTO hys.pcd_caninformedenuncia '+
      '            (cd_id, cd_idcaninforme, cd_fecha, cd_idmotivo, cd_idsustancia, '+
      '             cd_fechaalta, cd_usualta, cd_observacion) '+
      '     SELECT hys.seq_pid_id.NEXTVAL, '+SqlValue(numInforme)+', cd_fecha, cd_idmotivo,'+
      '            cd_idsustancia, SYSDATE, '+SqlValue(Sesion.UserID)+', cd_observacion '+
      '       FROM hys.pcd_caninformedenuncia '+
      '      WHERE cd_idcaninforme = '+SqlValue(sdqConsulta.FieldByName('CI_ID').AsInteger);


    EjecutarSql(sSql);

    MsgBox('El informe replicado es el :'+IntToStr(NumInforme), MB_ICONINFORMATION + MB_OK);
  end;
end;

end.




