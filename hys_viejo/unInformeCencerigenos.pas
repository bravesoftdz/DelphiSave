{
  Informe de Cancerígenos
  By FFirenze - 09/2003
}
unit unInformeCencerigenos;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomPanelABM, Mask, PatternEdit, IntEdit, StdCtrls, ExtCtrls,
  ComCtrls, Db, SDEngine, Placemnt, artSeguridad, ShortCutControl, ToolWin,
  ToolEdit, DateComboBox, unArtFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, Grids, DBGrids, RXDBCtrl, unfraEstablecimiento,
  unArtDbFrame, unFraEmpresa, FormPanel, unFraTrabajador, ExComboBox,
  unFraCAV_ACTIVIDAD, DBTables, Buttons, ComboEditor, DBComboGrid,
  GroupCheckBox, unArtDBAwareFrame, unFraCodigoDescripcion, unFraActividad,
  DBCtrls, ArtComboBox, ArtDBGrid;

type
  TfrmInformeCencerigenos = class(TfrmCustomPanelABM)
    PageControl: TPageControl;
    tsDatosGenerales: TTabSheet;
    tsEstablecimientos: TTabSheet;
    tsTrabajadores: TTabSheet;
    tsProveedores: TTabSheet;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbPCENuevo: TToolButton;
    tbPCEEliminar: TToolButton;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    edCI_ID: TEdit;
    Label10: TLabel;
    edCI_FECHA: TDateComboBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel3: TBevel;
    edCI_PERS_ADMINISTRACION: TIntEdit;
    edCI_PERS_PRODUCCION: TIntEdit;
    edCI_PERS_TOTAL: TIntEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edCI_RESP_CUILCUIT: TMaskEdit;
    edCI_RESP_NOMBRE: TEdit;
    fraCI_RESP_TIPODOCUMENTO: TfraStaticCTB_TABLAS;
    Label7: TLabel;
    fraCI_REPRESENTACION: TfraStaticCTB_TABLAS;
    lbInfExportado: TLabel;
    Label11: TLabel;
    edNumeroInforme: TIntEdit;
    dbgPCE_CANCERESTABLECI: TARTDBGrid;
    sduConsulta: TSDUpdateSQL;
    sdqPCE_CANCERESTABLECI: TSDQuery;
    dsPCE_CANCERESTABLECI: TDataSource;
    sduPCE_CANCERESTABLECI: TSDUpdateSQL;
    tsSustancias: TTabSheet;
    fpEstablecimientos: TFormPanel;
    BevelAbm: TBevel;
    btnEstAceptar: TButton;
    btnEstCancelar: TButton;
    fraCE_CUIT: TfraEmpresa;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbPCTNuevo: TToolButton;
    tbPCTEliminar: TToolButton;
    dbgPCT_CANCERTRABAJADOR: TARTDBGrid;
    fpTrabajadores: TFormPanel;
    Bevel1: TBevel;
    btnTrabAceptar: TButton;
    btnTrabCancelar: TButton;
    Label12: TLabel;
    edCE_NUMEROESTABLECI: TIntEdit;
    Label13: TLabel;
    edCE_NOMBRE: TEdit;
    Label14: TLabel;
    edCE_CALLE: TEdit;
    Bevel4: TBevel;
    Label15: TLabel;
    edCE_NUMERO: TEdit;
    Label16: TLabel;
    edCE_PISO: TEdit;
    Label17: TLabel;
    edCE_DEPARTAMENTO: TEdit;
    Label18: TLabel;
    edCE_LOCALIDAD: TEdit;
    Label19: TLabel;
    edCE_PARTIDO: TEdit;
    cmbCE_PROVINCIA: TExComboBox;
    Label20: TLabel;
    Label21: TLabel;
    edCE_CPOSTALA: TPatternEdit;
    Bevel5: TBevel;
    Label22: TLabel;
    Label23: TLabel;
    tbPCEModificar: TToolButton;
    lbTrabCUIL: TLabel;
    edCT_CUIL: TMaskEdit;
    fraCT_DOCUMENTOTIPO: TfraStaticCTB_TABLAS;
    Label8: TLabel;
    Label25: TLabel;
    edCT_NOMBRE: TEdit;
    edCT_EDAD: TIntEdit;
    Label26: TLabel;
    Label27: TLabel;
    edCT_ANTIGUEDAD: TIntEdit;
    cmbCT_UNIDAD: TComboBox;
    Label30: TLabel;
    edCT_CATEGORIA: TEdit;
    sdqPCT_CANCERTRABAJADOR: TSDQuery;
    dsPCT_CANCERTRABAJADOR: TDataSource;
    sduPCT_CANCERTRABAJADOR: TSDUpdateSQL;
    tbPCTModificar: TToolButton;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    tbPCONuevo: TToolButton;
    tbPCOModificar: TToolButton;
    tbPCOEliminar: TToolButton;
    dbgPCO_CANCERSECTORTRAB: TARTDBGrid;
    Splitter1: TSplitter;
    fpPCO_CANCERSECTORTRAB: TFormPanel;
    Bevel2: TBevel;
    btnSecTrabAceptar: TButton;
    btnSecTrabCancelar: TButton;
    sdqPCO_CANCERSECTORTRAB: TSDQuery;
    dsPCO_CANCERSECTORTRAB: TDataSource;
    sduPCO_CANCERSECTORTRAB: TSDUpdateSQL;
    Label28: TLabel;
    edCO_ANTIGUEDAD: TIntEdit;
    cmbCO_UNIDAD: TComboBox;
    Label29: TLabel;
    btnBuscarInforme: TSpeedButton;
    CoolBar4: TCoolBar;
    ToolBar4: TToolBar;
    tbPCPNuevo: TToolButton;
    tbPCPModificar: TToolButton;
    tbPCPEliminar: TToolButton;
    dbgPCP_CANCERPROVEEDOR: TARTDBGrid;
    CoolBar5: TCoolBar;
    ToolBar5: TToolBar;
    tbPCDNuevo: TToolButton;
    tbPCDModificar: TToolButton;
    tbPCDEliminar: TToolButton;
    Splitter2: TSplitter;
    dbgPCD_CANCERPRODUCTOS: TARTDBGrid;
    sdqPCP_CANCERPROVEEDOR: TSDQuery;
    dsPCP_CANCERPROVEEDOR: TDataSource;
    sduPCP_CANCERPROVEEDOR: TSDUpdateSQL;
    fpPCP_CANCERPROVEEDOR: TFormPanel;
    Bevel6: TBevel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    btnPCPAceptar: TButton;
    btnPCPCancelar: TButton;
    edCP_NOMBRE: TEdit;
    edCP_CALLE: TEdit;
    edCP_NUMERO: TEdit;
    edCP_PISO: TEdit;
    edCP_DEPARTAMENTO: TEdit;
    edCP_LOCALIDAD: TEdit;
    edCP_PARTIDO: TEdit;
    cmbCP_PROVINCIA: TExComboBox;
    edCP_CPOSTALA: TPatternEdit;
    edCP_CUIT: TMaskEdit;
    Label31: TLabel;
    Label41: TLabel;
    edCP_TELEFONO: TEdit;
    Label42: TLabel;
    cmbCP_INDICADOR: TComboBox;
    sdqPCD_CANCERPRODUCTOS: TSDQuery;
    dsPCD_CANCERPRODUCTOS: TDataSource;
    sduPCD_CANCERPRODUCTOS: TSDUpdateSQL;
    fpPCD_CANCERPRODUCTOS: TFormPanel;
    Bevel7: TBevel;
    bntPCDAceptar: TButton;
    bntPCDCancelar: TButton;
    Label44: TLabel;
    Label45: TLabel;
    edCD_NOMBRE_QUIMICO: TEdit;
    edCD_NOMBRE_COMERCIAL: TEdit;
    CoolBar6: TCoolBar;
    ToolBar6: TToolBar;
    tbPCSNuevo: TToolButton;
    tbPCSModificar: TToolButton;
    tbPCSEliminar: TToolButton;
    dbgPCS_CANCERSUSTANCIA: TARTDBGrid;
    Splitter3: TSplitter;
    CoolBar7: TCoolBar;
    ToolBar7: TToolBar;
    tbPCCNuevo: TToolButton;
    tbPCCModificar: TToolButton;
    tbPCCEliminar: TToolButton;
    dbgPCC_CANCERESTUDIO: TARTDBGrid;
    sdqPCS_CANCERSUSTANCIA: TSDQuery;
    dsPCS_CANCERSUSTANCIA: TDataSource;
    sduPCS_CANCERSUSTANCIA: TSDUpdateSQL;
    fpPCS_CANCERSUSTANCIA: TFormPanel;
    Bevel8: TBevel;
    btnPCSAceptar: TButton;
    btnPCSCancelar: TButton;
    Label47: TLabel;
    fraCS_CODIGO: TfraStaticCodigoDescripcion;
    chkCS_INFORMACION: TCheckBox;
    chkCS_CAPACITACION: TCheckBox;
    Bevel9: TBevel;
    Label46: TLabel;
    edCS_ESTUDIOS: TMemo;
    Label48: TLabel;
    edCS_MEDIDAS: TMemo;
    Bevel10: TBevel;
    Label49: TLabel;
    chkCS_EXAMEN_PREOCUPACIONAL: TCheckBox;
    chkCS_EXAMEN_PERIODICO: TCheckBox;
    chkCS_EXAMEN_EGRESO: TCheckBox;
    sdqPCC_CANCERESTUDIO: TSDQuery;
    dsPCC_CANCERESTUDIO: TDataSource;
    sduPCC_CANCERESTUDIO: TSDUpdateSQL;
    fpPCC_CANCERESTUDIO: TFormPanel;
    Bevel11: TBevel;
    btnPCCAceptar: TButton;
    btnPCCCancelar: TButton;
    Label50: TLabel;
    cmbCC_TIPO: TComboBox;
    chkCC_DETERMINACIONES: TCheckBox;
    Label51: TLabel;
    cmbCC_FRECUENCIA: TComboBox;
    tsSustanciasSector: TTabSheet;
    sdqPCX_CANCERSUSTTRAB: TSDQuery;
    dsPCX_CANCERSUSTTRAB: TDataSource;
    sduPCX_CANCERSUSTTRAB: TSDUpdateSQL;
    CoolBar8: TCoolBar;
    ToolBar8: TToolBar;
    tbPCXNuevo: TToolButton;
    tbPCXModificar: TToolButton;
    tbPCXEliminar: TToolButton;
    dbgPCX_CANCERSUSTTRAB: TARTDBGrid;
    Splitter4: TSplitter;
    CoolBar9: TCoolBar;
    ToolBar9: TToolBar;
    tbPCUNuevo: TToolButton;
    tbPCUModificar: TToolButton;
    tbPCUEliminar: TToolButton;
    dbgPCU_CANCERUSOSUSTANCIAS: TARTDBGrid;
    sdqPCU_CANCERUSOSUSTANCIAS: TSDQuery;
    dsPCU_CANCERUSOSUSTANCIAS: TDataSource;
    sduPCU_CANCERUSOSUSTANCIAS: TSDUpdateSQL;
    fpPCX_CANCERSUSTTRAB: TFormPanel;
    Bevel12: TBevel;
    btnPCXAceptar: TButton;
    btnPCXCancelar: TButton;
    Label52: TLabel;
    dbcCX_IDCANCERSUSTANCIA: TDBIncComboGrid;
    Label53: TLabel;
    edCX_IDSECTOR: TEdit;
    Bevel13: TBevel;
    lbCX_TRAB_PERMANENTE: TLabel;
    lbCX_TRAB_NOPERMANENTE1: TLabel;
    lbCX_TRAB_NOPERMANENTE2: TLabel;
    edCX_TRAB_PERMANENTE: TIntEdit;
    edCX_TRAB_NOPERMANENTE1: TIntEdit;
    edCX_TRAB_NOPERMANENTE2: TIntEdit;
    fpPCU_CANCERUSOSUSTANCIAS: TFormPanel;
    Bevel14: TBevel;
    btnPCUAceptar: TButton;
    btnPCUCancelar: TButton;
    dbcCU_IDPRODUCTO: TDBIncComboGrid;
    Label43: TLabel;
    Bevel15: TBevel;
    Label54: TLabel;
    cgCU_MODOS_USO: TCheckGroup;
    Label55: TLabel;
    edCU_OTROS_MODOS_EMPLEO: TMemo;
    Label56: TLabel;
    edCU_CANTIDAD: TIntEdit;
    cmbCU_UNIDAD: TComboBox;
    edCU_USOS: TEdit;
    btnPCETomarDatos: TSpeedButton;
    Label58: TLabel;
    Label57: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    edAutoCO_ANTIGUEDAD: TIntEdit;
    cmbAutoCO_UNIDAD: TComboBox;
    Bevel16: TBevel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Bevel17: TBevel;
    Label89: TLabel;
    Label90: TLabel;
    chkEstAmbCC_DETERMINACIONES: TCheckBox;
    cmbEstAmbCC_FRECUENCIA: TComboBox;
    Label91: TLabel;
    Bevel18: TBevel;
    Label92: TLabel;
    Label93: TLabel;
    chkEstBioCC_DETERMINACIONES: TCheckBox;
    cmbEstBioCC_FRECUENCIA: TComboBox;
    Label94: TLabel;
    Label95: TLabel;
    fraCE_CIIU_Establecimiento: TfraActividad;
    fraCE_CIIU: TfraActividad;
    btnPCTTomarDatos: TSpeedButton;
    sdqSectoresDisponibles: TSDQuery;
    dsSectoresDisponibles: TDataSource;
    edAutoCO_NOMBRE: TDBLookupComboBox;
    edCO_NOMBRE: TDBLookupComboBox;
    btnPCPTomarDatos: TSpeedButton;
    procedure edNumeroInformeKeyPress(Sender: TObject; var Key: Char);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
    procedure FSFormCreate(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure btnEstAceptarClick(Sender: TObject);
    procedure tbPCENuevoClick(Sender: TObject);
    procedure tbPCEEliminarClick(Sender: TObject);
    procedure dbgPCE_CANCERESTABLECIGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure tbPCEModificarClick(Sender: TObject);
    procedure tbPCTNuevoClick(Sender: TObject);
    procedure tbPCTModificarClick(Sender: TObject);
    procedure tbPCTEliminarClick(Sender: TObject);
    procedure btnTrabAceptarClick(Sender: TObject);
    procedure dbgPCT_CANCERTRABAJADORGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure tbPCONuevoClick(Sender: TObject);
    procedure tbPCOModificarClick(Sender: TObject);
    procedure tbPCOEliminarClick(Sender: TObject);
    procedure btnSecTrabAceptarClick(Sender: TObject);
    procedure sdqPCO_CANCERSECTORTRABFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sdqPCT_CANCERTRABAJADORAfterScroll(DataSet: TDataSet);
    procedure dbgPCO_CANCERSECTORTRABGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbPCPNuevoClick(Sender: TObject);
    procedure tbPCPModificarClick(Sender: TObject);
    procedure tbPCPEliminarClick(Sender: TObject);
    procedure btnPCPAceptarClick(Sender: TObject);
    procedure sdqRelacionesAfterOpen(DataSet: TDataSet);
    procedure sdqPCP_CANCERPROVEEDORAfterScroll(DataSet: TDataSet);
    procedure tbPCDNuevoClick(Sender: TObject);
    procedure tbPCDModificarClick(Sender: TObject);
    procedure tbPCDEliminarClick(Sender: TObject);
    procedure sdqPCD_CANCERPRODUCTOSFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure bntPCDAceptarClick(Sender: TObject);
    procedure dbgPCE_CANCERESTABLECIDblClick(Sender: TObject);
    procedure dbgPCT_CANCERTRABAJADORDblClick(Sender: TObject);
    procedure dbgPCO_CANCERSECTORTRABDblClick(Sender: TObject);
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
    procedure tbPCCNuevoClick(Sender: TObject);
    procedure tbPCCModificarClick(Sender: TObject);
    procedure tbPCCEliminarClick(Sender: TObject);
    procedure btnPCCAceptarClick(Sender: TObject);
    procedure dbgPCC_CANCERESTUDIOGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure dbgPCC_CANCERESTUDIODblClick(Sender: TObject);
    procedure sdqPCS_CANCERSUSTANCIAAfterScroll(DataSet: TDataSet);
    procedure sdqPCC_CANCERESTUDIOFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tbPCXNuevoClick(Sender: TObject);
    procedure tbPCXModificarClick(Sender: TObject);
    procedure tbPCXEliminarClick(Sender: TObject);
    procedure btnPCXAceptarClick(Sender: TObject);
    procedure fpPCX_CANCERSUSTTRABBeforeShow(Sender: TObject);
    procedure dbgPCX_CANCERSUSTTRABDblClick(Sender: TObject);
    procedure dbgPCX_CANCERSUSTTRABGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure sdqPCX_CANCERSUSTTRABAfterScroll(DataSet: TDataSet);
    procedure tbPCUNuevoClick(Sender: TObject);
    procedure tbPCUModificarClick(Sender: TObject);
    procedure tbPCUEliminarClick(Sender: TObject);
    procedure btnPCUAceptarClick(Sender: TObject);
    procedure dbgPCU_CANCERUSOSUSTANCIASDblClick(Sender: TObject);
    procedure dbgPCU_CANCERUSOSUSTANCIASGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure fpPCU_CANCERUSOSUSTANCIASBeforeShow(Sender: TObject);
    procedure btnBuscarInformeClick(Sender: TObject);
    procedure edNumeroInformeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sdqPCU_CANCERUSOSUSTANCIASAfterPost(DataSet: TDataSet);
    procedure edCI_PERS_ADMINISTRACIONChange(Sender: TObject);
    procedure btnPCETomarDatosClick(Sender: TObject);
    procedure ShortCutNuevo(Sender: TObject);
    procedure ShortCutModificar(Sender: TObject);
    procedure ShortCutEliminar(Sender: TObject);
    procedure btnPCTTomarDatosClick(Sender: TObject);
    procedure edCT_CUILKeyPress(Sender: TObject; var Key: Char);
    procedure fpTrabajadoresShow(Sender: TObject);
    procedure btnPCPTomarDatosClick(Sender: TObject);
    procedure edCP_CUITKeyPress(Sender: TObject; var Key: Char);
    procedure edCE_NUMEROESTABLECIKeyPress(Sender: TObject; var Key: Char);
  private
    ModoABMTablas: TModoABM;
    FDataModified: Boolean;
    procedure SetCE_ID(AId: integer);
    procedure DoDarDeBaja(ADataSet: TDataSet; APrefijo: string; AAllowDelete: Boolean = True);
    function PkViolated(DataSet : TDataSet; FieldNames: array of string; FieldValues: array of Variant): boolean;
    procedure DoButtonClick(AButtonName: string);
  protected
    procedure ClearControls(ClearPK : Boolean = False); override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
    procedure LockControls(ALocked : Boolean = True); override;
  public
  end;

implementation

uses
  unPrincipal, AnsiSql, CustomDlgs, unDmPrincipal, Cuit, StrFuncs,
  DBFuncs, General, VclExtra, unDlgBusInforme, ValFuncs, unArt, ArtFuncs,
  DateTimeFuncs;

const
  PAGE_ESTABLECIMIENTOS = 0;
  PAGE_DATOSGENERALES   = 1;
  PAGE_SUSTANCIAS       = 2;
  PAGE_PROVEEDORES      = 3;
  PAGE_SUSTANCIA_SECTOR = 4;
  PAGE_TRABAJADORES     = 5;

  UNIDAD_TIEMPO: array[0..2] of string = ('D', 'M', 'A');
  TIPO_PCP: array[0..1] of string = ('C', 'P');
  TIPO_PCC: array[0..1] of string = ('A', 'B');
  FRECUENCIA_PCC: array[0..3] of string = ('1', '2', '3', '4');
  UNIDAD_PCU: array[0..5] of string = ('G', 'K', 'T', 'L', 'C', 'M');

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
{ TfrmInformeCencerigenos }
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnBuscarInformeClick(Sender: TObject);
var
  iIdInforme: Integer;
begin
  iIdInforme := GetIdInformeCancerigenos;
  if iIdInforme = -1 Then
    edNumeroInforme.Clear
  else
    edNumeroInforme.Value := iIdInforme;

  PKChange(edNumeroInforme.Value <> 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.LockControls(ALocked: Boolean);
begin
  inherited;
  PageControl.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.ClearControls(ClearPK: Boolean);
begin
  edCI_ID.Clear;
  edCI_FECHA.Clear;
  edCI_PERS_ADMINISTRACION.Clear;
  edCI_PERS_PRODUCCION.Clear;
  edCI_PERS_TOTAL.Clear;
  edCI_RESP_CUILCUIT.Clear;
  edCI_RESP_NOMBRE.Clear;
  fraCI_RESP_TIPODOCUMENTO.Clear;
  fraCI_REPRESENTACION.Clear;

  SetCE_ID(0);
  sdqConsulta.Open;
  PageControlChange(Nil);

  FDataModified := False;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmInformeCencerigenos.PkViolated(DataSet: TDataSet; FieldNames: array of string; FieldValues: array of Variant): boolean;
begin
  Result := (ModoABMTablas = maAlta) and (CountRecords(DataSet, FieldNames, FieldValues, 1) > 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.sdqPCU_CANCERUSOSUSTANCIASAfterPost(DataSet: TDataSet);
begin
  FDataModified := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmInformeCencerigenos.DoABM: Boolean;
  procedure SetId(AFieldName: string; ADataSet: TDataSet);
  begin
    if not ADataSet.IsEmpty then
      with TDataCycler.Create(ADataSet) do
        try
          repeat
            if ADataSet.FieldByName(AFieldName).IsNull Then
            begin
              ADataSet.Edit;
              ADataSet.FieldByName(AFieldName).AsInteger :=  edNumeroInforme.Value;
              ADataSet.Post;
            end;
          until not Cycle;
        finally
          Free;
        end;
  end;
begin
  BeginTrans;
  Try
    with sdqConsulta do
    begin
      if ModoABM = maAlta Then
      begin
        Insert;
        edNumeroInforme.Value          := GetSecNextVal('HYS.SEQ_PCI_ID');;
        edCI_ID.Text                   := edNumeroInforme.Text;
        FieldByName('CI_ID').AsInteger := edNumeroInforme.Value;
      end
      else
        Edit;

      FieldByName('CI_FECHA').AsDateTime              := edCI_FECHA.Date;
      FieldByName('CI_RESP_CUILCUIT').AsString        := edCI_RESP_CUILCUIT.Text;
      FieldByName('CI_RESP_NOMBRE').AsString          := edCI_RESP_NOMBRE.Text;
      FieldByName('CI_RESP_TIPODOCUMENTO').AsString   := fraCI_RESP_TIPODOCUMENTO.Value;
      FieldByName('CI_REPRESENTACION').AsString       := fraCI_REPRESENTACION.Value;
      FieldByName('CI_PERS_ADMINISTRACION').AsInteger := edCI_PERS_ADMINISTRACION.Value;
      FieldByName('CI_PERS_PRODUCCION').AsInteger     := edCI_PERS_PRODUCCION.Value;
      FieldByName('CI_PERS_TOTAL').AsInteger          := edCI_PERS_TOTAL.Value;
      Post;
      ApplyUpdates;
    end;

    if sdqPCE_CANCERESTABLECI.Active Then
    begin
      SetId('CE_IDCANCERIGENOINFORME', sdqPCE_CANCERESTABLECI);
      sdqPCE_CANCERESTABLECI.ApplyUpdates;
    end;

    if sdqPCT_CANCERTRABAJADOR.Active Then
    begin
      SetId('CT_IDCANCERIGENOINFORME', sdqPCT_CANCERTRABAJADOR);
      sdqPCT_CANCERTRABAJADOR.ApplyUpdates;

      if sdqPCO_CANCERSECTORTRAB.Active Then
      begin
        sdqPCO_CANCERSECTORTRAB.Filtered := False;
        Try
          SetId('CO_IDCANCERIGENOINFORME', sdqPCO_CANCERSECTORTRAB);
          sdqPCO_CANCERSECTORTRAB.ApplyUpdates;
        finally
          sdqPCO_CANCERSECTORTRAB.Filtered := True;
        end;
      end;
    end;

    if sdqPCP_CANCERPROVEEDOR.Active Then
    begin
      SetId('CP_IDCANCERIGENOINFORME', sdqPCP_CANCERPROVEEDOR);
      sdqPCP_CANCERPROVEEDOR.ApplyUpdates;

      if sdqPCD_CANCERPRODUCTOS.Active Then
      begin
        sdqPCD_CANCERPRODUCTOS.Filtered := False;
        Try
          SetId('CD_IDCANCERIGENOINFORME', sdqPCD_CANCERPRODUCTOS);
          sdqPCD_CANCERPRODUCTOS.ApplyUpdates;
        finally
          sdqPCD_CANCERPRODUCTOS.Filtered := True;
        end;
      end;
    end;

    if sdqPCS_CANCERSUSTANCIA.Active Then
    begin
      SetId('CS_IDCANCERIGENOINFORME', sdqPCS_CANCERSUSTANCIA);
      sdqPCS_CANCERSUSTANCIA.ApplyUpdates;

      if sdqPCC_CANCERESTUDIO.Active Then
      begin
        sdqPCC_CANCERESTUDIO.Filtered := False;
        Try
          SetId('CC_IDCANCERIGENOINFORME', sdqPCC_CANCERESTUDIO);
          sdqPCC_CANCERESTUDIO.ApplyUpdates;
        finally
          sdqPCC_CANCERESTUDIO.Filtered := True;
        end;
      end;
    end;

    if sdqPCX_CANCERSUSTTRAB.Active Then
    begin
      SetId('CX_IDCANCERIGENOINFORME', sdqPCX_CANCERSUSTTRAB);
      sdqPCX_CANCERSUSTTRAB.ApplyUpdates;

      if sdqPCU_CANCERUSOSUSTANCIAS.Active Then
      begin
        sdqPCU_CANCERUSOSUSTANCIAS.Filtered := False;
        Try
          SetId('CU_IDCANCERIGENOINFORME', sdqPCU_CANCERUSOSUSTANCIAS);
          sdqPCU_CANCERUSOSUSTANCIAS.ApplyUpdates;
        finally
          sdqPCU_CANCERUSOSUSTANCIAS.Filtered := True;
        end;
      end;
    end;


    CommitTrans;
    Result := True;
    FDataModified := False;
  except
    on E: Exception do
    begin
      RollBack;
      Result := False;
      ErrorMsg(E, 'Error al guardar los datos');
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.DoDarDeBaja(ADataSet: TDataSet; APrefijo: string; AAllowDelete: Boolean = True);
begin
  if (not ADataSet.IsEmpty) and ADataSet.FieldByName(APrefijo + '_FECHABAJA').IsNull and
     MsgAsk('¿Desea dar de baja el registro seleccionado?') Then
  begin
    if AAllowDelete and ADataSet.FieldByName(APrefijo + '_IDCANCERIGENOINFORME').IsNull Then
      ADataSet.Delete
    else
    begin
      ADataSet.Edit;
      ADataSet.FieldByName(APrefijo + '_USUBAJA').AsString     := frmPrincipal.DBLogin.UserID;
      ADataSet.FieldByName(APrefijo + '_FECHABAJA').AsDateTime := DBDateTime;
      ADataSet.Post;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.SetCE_ID(AId: integer);
  procedure SetID(ADataSet: TSDQuery);
  begin
    ADataSet.Close;
    ADataSet.ParamByName('CI_ID').AsInteger := AId;
  end;
begin
  SetID(sdqConsulta);
  SetID(sdqPCE_CANCERESTABLECI);
  SetID(sdqPCT_CANCERTRABAJADOR);
  SetID(sdqPCO_CANCERSECTORTRAB);
  SetID(sdqPCP_CANCERPROVEEDOR);
  SetID(sdqPCD_CANCERPRODUCTOS);
  SetId(sdqPCS_CANCERSUSTANCIA);
  SetId(sdqPCC_CANCERESTUDIO);
  SetId(sdqPCX_CANCERSUSTTRAB);
  SetId(sdqPCU_CANCERUSOSUSTANCIAS);
  SetId(sdqSectoresDisponibles);  
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.LoadControls;
begin
  with sdqConsulta do
  begin
    SetCE_ID(edNumeroInforme.Value);
    Open;
    Try
      if IsEmpty Then
        ClearControls(True)
      else
      begin
        FDataModified := False;
        edCI_ID.Text                   := FieldByName('CI_ID').AsString;
        edCI_FECHA.Date                := FieldByName('CI_FECHA').AsDateTime;
        edCI_RESP_CUILCUIT.Text        := FieldByName('CI_RESP_CUILCUIT').AsString;
        edCI_RESP_NOMBRE.Text          := FieldByName('CI_RESP_NOMBRE').AsString;
        fraCI_RESP_TIPODOCUMENTO.Value := FieldByName('CI_RESP_TIPODOCUMENTO').AsString;
        fraCI_REPRESENTACION.Value     := FieldByName('CI_REPRESENTACION').AsString;
        edCI_PERS_ADMINISTRACION.Value := FieldByName('CI_PERS_ADMINISTRACION').AsInteger;
        edCI_PERS_PRODUCCION.Value     := FieldByName('CI_PERS_PRODUCCION').AsInteger;
        edCI_PERS_TOTAL.Value          := FieldByName('CI_PERS_TOTAL').AsInteger;

        if FieldByName('CI_USUEXPORT').IsNull Then
          lbInfExportado.Caption := 'No Exportado'
        else
          lbInfExportado.Caption := Format('Exportado por %s el %s', [FieldByName('CI_USUEXPORT').AsString,
                                                                      FieldByName('CI_FECHAEXPORT').AsString]);
        inherited;
      end;
    finally
      //Close;
    end;
  end;

  PageControlChange(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmInformeCencerigenos.Validar: Boolean;
  procedure InvMsg(APageIndex: Integer; AControl : TWinControl; AText : String);
  begin
    PageControl.ActivePageIndex := APageIndex;
    InvalidMsg(AControl, AText);
  end;
begin
  Result := False;
  if edCI_FECHA.IsEmpty Then
    InvMsg(PAGE_DATOSGENERALES, edCI_FECHA, 'Debe ingresar la fecha del informe')

  else if edCI_RESP_CUILCUIT.Text = '' Then
    InvMsg(PAGE_DATOSGENERALES, edCI_RESP_CUILCUIT, 'Debe ingresar el CUIL / CUIT del Responsable')

  else if (Length(edCI_RESP_CUILCUIT.Text) > 8) and (not IsCuil(edCI_RESP_CUILCUIT.Text)) Then
    InvMsg(PAGE_DATOSGENERALES, edCI_RESP_CUILCUIT, 'El CUIL / CUIT es inválido')

  else if IsEmptyString(edCI_RESP_NOMBRE.Text) or (Pos(' ', edCI_RESP_NOMBRE.Text) = 0) Then
    InvMsg(PAGE_DATOSGENERALES, edCI_RESP_NOMBRE, 'Debe ingresar el Apellido y Nombre del Responsable')

  else if fraCI_RESP_TIPODOCUMENTO.IsEmpty Then
    InvMsg(PAGE_DATOSGENERALES, fraCI_RESP_TIPODOCUMENTO.edCodigo, 'Debe ingresar el Tipo de Documento')

  else if fraCI_REPRESENTACION.IsEmpty Then
    InvMsg(PAGE_DATOSGENERALES, fraCI_REPRESENTACION.edCodigo, 'Debe seleccionar el Tipo de Representación')

  else if (edCI_PERS_ADMINISTRACION.Value + edCI_PERS_PRODUCCION.Value) <> edCI_PERS_TOTAL.Value Then
    InvMsg(PAGE_DATOSGENERALES, edCI_PERS_TOTAL, 'Las cantidades de personal son inconsistentes')

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.edNumeroInformeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    PageControl.ActivePageIndex := PAGE_ESTABLECIMIENTOS;
    PKChange(edNumeroInforme.Value <> 0);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FDataModified Then
  begin
    Action := caNone;
    case MsgBox('¿Desea guardar los cambios?', MB_ICONQUESTION + MB_YESNOCANCEL) of
      IDYES:
        if not DoABM Then Exit;
      IDCANCEL:
        Exit;
    end;
  end;

  inherited;
  frmPrincipal.mnuInformeCancerigenos.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.FSFormCreate(Sender: TObject);
var
  sSql: string;
begin
  inherited;
  PageControl.ActivePageIndex := PAGE_ESTABLECIMIENTOS;

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


  with fraCS_CODIGO do
  begin
    TableName      := 'PRG_RIESGOS';
    FieldID        := 'RG_CODIGO';
    FieldCodigo    := 'RG_CODIGO';
    FieldDesc      := 'RG_DESCRIPCION';
    FieldBaja      := 'RG_FECHABAJA';
    ExtraCondition := ' AND RG_CANCERIGENO = ''S'' ';
    IDType         := ctString;
  end;

  sSql := 'SELECT PV_CODIGO, PV_DESCRIPCION ' +
            'FROM CPV_PROVINCIAS ' +
           'ORDER BY PV_DESCRIPCION';

  LoadStringsValues(sSql, cmbCE_PROVINCIA.Items);
  LoadStringsValues(sSql, cmbCP_PROVINCIA.Items);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.PageControlChange(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
//    PAGE_DATOSGENERALES:
    PAGE_ESTABLECIMIENTOS:
      sdqPCE_CANCERESTABLECI.Active := True;
    PAGE_TRABAJADORES:
    begin
      sdqPCS_CANCERSUSTANCIA.Active  := True;
      sdqPCX_CANCERSUSTTRAB.Active   := True;
      sdqPCT_CANCERTRABAJADOR.Active := True;
      if not sdqPCX_CANCERSUSTTRAB.IsEmpty then
      begin
        sdqSectoresDisponibles.Active := False;
        sdqSectoresDisponibles.Active := True;
      end;
    end;
    PAGE_PROVEEDORES:
    begin
      sdqPCS_CANCERSUSTANCIA.Active   := True;
      sdqPCP_CANCERPROVEEDOR.Active   := True;
      sdqPCD_CANCERPRODUCTOS.Filtered := True;
    end;
    PAGE_SUSTANCIAS:
      sdqPCS_CANCERSUSTANCIA.Active := True;
    PAGE_SUSTANCIA_SECTOR:
    begin
      sdqPCS_CANCERSUSTANCIA.Active := True;
      sdqPCX_CANCERSUSTTRAB.Active  := True;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.edCI_PERS_ADMINISTRACIONChange(Sender: TObject);
begin
  edCI_PERS_TOTAL.Value := edCI_PERS_ADMINISTRACION.Value + edCI_PERS_PRODUCCION.Value;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.sdqRelacionesAfterOpen(DataSet: TDataSet);
begin
  DataSet.Fields[0].Required := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnEstAceptarClick(Sender: TObject);
begin
  if fraCE_CUIT.IsEmpty Then
    InvalidMsg(fraCE_CUIT.mskCUIT, 'Debe seleccionar la Empresa.')

  else if edCE_NUMEROESTABLECI.Value = 0 Then
    InvalidMsg(edCE_NUMEROESTABLECI, 'Debe ingresar el Número del Establecimiento.')

  else if PkViolated(sdqPCE_CANCERESTABLECI, ['CE_CUIT', 'CE_NUMEROESTABLECI'], [fraCE_CUIT.mskCUIT.Text, edCE_NUMEROESTABLECI.Value]) Then
    InvalidMsg(fraCE_CUIT.mskCUIT, 'Ya existe un registro para la misma empresa con el mismo número de establecimiento.')

  else if IsEmptyString(edCE_NOMBRE.Text) Then
    InvalidMsg(edCE_NOMBRE, 'Debe Nombre del Establecimiento.')

  else if IsEmptyString(edCE_CALLE.Text) Then
    InvalidMsg(edCE_CALLE, 'Debe ingresar Nombre de la Calle o Ruta.')

  else if IsEmptyString(edCE_NUMERO.Text) Then
    InvalidMsg(edCE_NUMERO, 'Debe ingresar Número o Kilómetro.')

  else if IsEmptyString(edCE_LOCALIDAD.Text) Then
    InvalidMsg(edCE_LOCALIDAD, 'Debe ingresar la Localidad.')

  else if cmbCE_PROVINCIA.ItemIndex = -1 Then
    InvalidMsg(cmbCE_PROVINCIA, 'Debe ingresar la Provincia.')

  else if IsEmptyString(edCE_CPOSTALA.Text) Then
    InvalidMsg(edCE_CPOSTALA, 'Debe ingresar el Código Postal Argentino.')

  else if not (IsCPA(edCE_CPOSTALA.Text) or IsCPostal(edCE_CPOSTALA.Text)) Then
    InvalidMsg(edCE_CPOSTALA, 'Debe ingresar el Código Postal Argentino o Código Postal no es válido.')

  else if fraCE_CIIU.IsEmpty Then
    InvalidMsg(fraCE_CIIU.edCodigo, 'Debe ingresar CIIU de la Empresa.')

  else
  with sdqPCE_CANCERESTABLECI do
    begin
      if ModoABMTablas = maAlta Then
        Insert
      else
        Edit;

      FieldByName('CE_CUIT').AsString             := fraCE_CUIT.mskCUIT.Text;
      FieldByName('CE_NUMEROESTABLECI').AsInteger := edCE_NUMEROESTABLECI.Value;
      FieldByName('CE_NOMBRE').AsString           := edCE_NOMBRE.Text;
      FieldByName('CE_CALLE').AsString            := edCE_CALLE.Text;
      FieldByName('CE_NUMERO').AsString           := edCE_NUMERO.Text;
      FieldByName('CE_PISO').AsString             := edCE_PISO.Text;
      FieldByName('CE_DEPARTAMENTO').AsString     := edCE_DEPARTAMENTO.Text;
      FieldByName('CE_LOCALIDAD').AsString        := edCE_LOCALIDAD.Text;
      FieldByName('CE_PARTIDO').AsString          := edCE_PARTIDO.Text;
      FieldByName('CE_PROVINCIA').AsString        := cmbCE_PROVINCIA.Value;
      FieldByName('CE_CPOSTALA').AsString         := edCE_CPOSTALA.Text;
      FieldByName('CE_CIIU').AsString             := fraCE_CIIU.Codigo;
      FieldByName('CE_CIIU_SECUNDARIO').AsString  := fraCE_CIIU_Establecimiento.Codigo;
      FieldByName('USUARIO').AsString             := frmPrincipal.DBLogin.UserID;
      FieldByName('CE_USUBAJA').Value             := Null;
      FieldByName('CE_FECHABAJA').Value           := Null;
      { Solo Campos para Mostrar: }
      FieldByName('EM_NOMBRE').AsString           := fraCE_CUIT.cmbRSocial.Text;
      Post;
      fpEstablecimientos.ModalResult := mrOk;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCENuevoClick(Sender: TObject);
begin
  fraCE_CUIT.Clear;
  edCE_NUMEROESTABLECI.Clear;
  edCE_NOMBRE.Clear;
  edCE_CALLE.Clear;
  edCE_NUMERO.Clear;
  edCE_PISO.Clear;
  edCE_DEPARTAMENTO.Clear;
  edCE_LOCALIDAD.Clear;
  edCE_PARTIDO.Clear;
  cmbCE_PROVINCIA.ItemIndex := -1;
  edCE_CPOSTALA.Clear;
  fraCE_CIIU.Clear;
  fraCE_CIIU_Establecimiento.Clear;

  ModoABMTablas := maAlta;

  {Desbloquea la Primary Key}
  VclExtra.LockControls([fraCE_CUIT, edCE_NUMEROESTABLECI], False);

  fpEstablecimientos.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCEModificarClick(Sender: TObject);
begin
  if (not sdqPCE_CANCERESTABLECI.IsEmpty) Then
    with sdqPCE_CANCERESTABLECI do
    begin
      fraCE_CUIT.CUIT                 := FieldByName('CE_CUIT').AsString;
      edCE_NUMEROESTABLECI.Value      := FieldByName('CE_NUMEROESTABLECI').AsInteger;
      edCE_NOMBRE.Text                := FieldByName('CE_NOMBRE').AsString;
      edCE_CALLE.Text                 := FieldByName('CE_CALLE').AsString;
      edCE_NUMERO.Text                := FieldByName('CE_NUMERO').AsString;
      edCE_PISO.Text                  := FieldByName('CE_PISO').AsString;
      edCE_DEPARTAMENTO.Text          := FieldByName('CE_DEPARTAMENTO').AsString;
      edCE_LOCALIDAD.Text             := FieldByName('CE_LOCALIDAD').AsString;
      edCE_PARTIDO.Text               := FieldByName('CE_PARTIDO').AsString;
      cmbCE_PROVINCIA.Value           := FieldByName('CE_PROVINCIA').AsString;
      edCE_CPOSTALA.Text              := FieldByName('CE_CPOSTALA').AsString;
      fraCE_CIIU.Codigo               := FieldByName('CE_CIIU').AsString;
      fraCE_CIIU_Establecimiento.Code := FieldByName('CE_CIIU_SECUNDARIO').AsString;

      ModoABMTablas := maModificacion;

      {Desbloquea la Primary Key}
      VclExtra.LockControls([fraCE_CUIT, edCE_NUMEROESTABLECI], True);

      fpEstablecimientos.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCE_CANCERESTABLECIGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not sdqPCE_CANCERESTABLECI.FieldByName('CE_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCE_CANCERESTABLECIDblClick(Sender: TObject);
begin
  if tbPCEModificar.Enabled Then
    tbPCEModificarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCEEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCE_CANCERESTABLECI, 'CE');
{  if (not sdqPCE_CANCERESTABLECI.IsEmpty) and
     sdqPCE_CANCERESTABLECI.FieldByName('CE_FECHABAJA').IsNull and
     MsgAsk('¿Desea dar de baja el registro seleccionado?') Then
  begin
    if sdqPCE_CANCERESTABLECI.FieldByName('CE_IDCANCERIGENOINFORME').IsNull Then
      sdqPCE_CANCERESTABLECI.Delete
    else
    begin
      sdqPCE_CANCERESTABLECI.Edit;
      sdqPCE_CANCERESTABLECI.FieldByName('CE_USUBAJA').AsString     := frmPrincipal.DBLogin.UserID;
      sdqPCE_CANCERESTABLECI.FieldByName('CE_FECHABAJA').AsDateTime := DBDateTime;
      sdqPCE_CANCERESTABLECI.Post;
    end;
  end;}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnPCETomarDatosClick(Sender: TObject);
var
  sSql: string;
begin
  sSql := 'SELECT ES_NOMBRE, ES_IDACTIVIDAD, ES_CALLE, ES_NUMERO, ES_PISO, ES_DEPARTAMENTO, ' +
                 'ES_LOCALIDAD, NVL(ES_CPOSTALA, ES_CPOSTAL) CPOSTAL, ES_PROVINCIA, CO_IDACTIVIDAD ' +
            'FROM AFI.ACO_CONTRATO, AFI.AES_ESTABLECIMIENTO ' +
           'WHERE ES_CONTRATO = ART.AFILIACION.GET_CONTRATOVIGENTE(:CUIT , ART.ACTUALDATE) ' +
             'AND ES_NROESTABLECI = :NRO_ESTABLECIMIENTO ' +
             'AND ES_CONTRATO = CO_CONTRATO';
  with GetQueryEx(sSql, [fraCE_CUIT.mskCUIT.Text, edCE_NUMEROESTABLECI.Value]) do
    try
      edCE_NOMBRE.Text                 := FieldByName('ES_NOMBRE').AsString;
      edCE_CALLE.Text                  := FieldByName('ES_CALLE').AsString;
      edCE_NUMERO.Text                 := FieldByName('ES_NUMERO').AsString;
      edCE_PISO.Text                   := FieldByName('ES_PISO').AsString;
      edCE_DEPARTAMENTO.Text           := FieldByName('ES_DEPARTAMENTO').AsString;
      edCE_LOCALIDAD.Text              := FieldByName('ES_LOCALIDAD').AsString;
      edCE_PARTIDO.Text                := '';
      cmbCE_PROVINCIA.Value            := FieldByName('ES_PROVINCIA').AsString;
      edCE_CPOSTALA.Text               := FieldByName('CPOSTAL').AsString;
      fraCE_CIIU.Value                 := FieldByName('CO_IDACTIVIDAD').AsInteger;
      fraCE_CIIU_Establecimiento.Value := FieldByName('ES_IDACTIVIDAD').AsInteger;
    finally
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCTNuevoClick(Sender: TObject);
begin
  edCT_CUIL.Clear;
  edCT_NOMBRE.Clear;
  fraCT_DOCUMENTOTIPO.Clear;
  edCT_EDAD.Clear;
  edCT_ANTIGUEDAD.Clear;
  cmbCT_UNIDAD.ItemIndex := -1;
  edCT_CATEGORIA.Clear;

  edAutoCO_ANTIGUEDAD.Clear;
  cmbAutoCO_UNIDAD.ItemIndex := -1;
  edAutoCO_NOMBRE.KeyValue := null;  

  ModoABMTablas := maAlta;

  {Desbloquea la Primary Key}
  VclExtra.LockControls([edCT_CUIL, edAutoCO_NOMBRE, edAutoCO_ANTIGUEDAD, cmbAutoCO_UNIDAD], False);

  fpTrabajadores.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCTModificarClick(Sender: TObject);
begin
  if (not sdqPCT_CANCERTRABAJADOR.IsEmpty) Then
    with sdqPCT_CANCERTRABAJADOR do
    begin
      edCT_CUIL.Text                 := FieldByName('CT_CUIL').AsString;
      edCT_NOMBRE.Text               := FieldByName('CT_NOMBRE').AsString;
      fraCT_DOCUMENTOTIPO.Value      := FieldByName('CT_DOCUMENTOTIPO').AsString;
      edCT_EDAD.Value                := FieldByName('CT_EDAD').AsInteger;
      edCT_ANTIGUEDAD.Value          := FieldByName('CT_ANTIGUEDAD').AsInteger;
      cmbCT_UNIDAD.ItemIndex         := ArrayPos(FieldByName('CT_UNIDAD').AsString, UNIDAD_TIEMPO);
      edCT_CATEGORIA.Text            := FieldByName('CT_CATEGORIA').AsString;

      edAutoCO_ANTIGUEDAD.Clear;
      cmbAutoCO_UNIDAD.ItemIndex := -1;
      edAutoCO_NOMBRE.KeyValue := null;      

      ModoABMTablas := maModificacion;

      {Bloquea la Primary Key}
      VclExtra.LockControls([edCT_CUIL, edAutoCO_NOMBRE, edAutoCO_ANTIGUEDAD, cmbAutoCO_UNIDAD], True);

      fpTrabajadores.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCTEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCT_CANCERTRABAJADOR, 'CT', not sdqPCO_CANCERSECTORTRAB.FindFirst);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnTrabAceptarClick(Sender: TObject);
var
  bAutoSector: Boolean; { Indica si agrega en forma automática un registro en la tabla sector }
begin
  bAutoSector := (ModoABMTablas = maAlta) and ((not IsEmptyString(edAutoCO_NOMBRE.Text)) or
                                               (edAutoCO_ANTIGUEDAD.Value > 0) or
                                               (cmbAutoCO_UNIDAD.ItemIndex > -1)
                                              );

  if IsEmptyString(edCT_CUIL.Text) Then
    InvalidMsg(edCT_CUIL, 'Debe ingresar el CUIL del Trabajador')

  else if PkViolated(sdqPCT_CANCERTRABAJADOR, ['CT_CUIL'], [edCT_CUIL.Text]) Then
    InvalidMsg(edCT_CUIL, 'Ya existe un registro para la misma empresa con el mismo trabajador.')

  else if IsEmptyString(edCT_NOMBRE.Text) Then
    InvalidMsg(edCT_NOMBRE, 'Debe ingresar el Apellido y Nombre del Trabajador.')

  else if fraCT_DOCUMENTOTIPO.IsEmpty Then
    InvalidMsg(fraCT_DOCUMENTOTIPO.edCodigo, 'Debe seleccionar el Tipo de Documento.')

  else if edCT_EDAD.Value < 7 Then
    InvalidMsg(edCT_EDAD, 'Debe ingresar una Edad Válida.')

  else if edCT_ANTIGUEDAD.Value = 0 Then
    InvalidMsg(edCT_ANTIGUEDAD, 'Debe ingresar la Antigüedad del Trabajador en la Empresa.')

  else if cmbCT_UNIDAD.ItemIndex = -1 Then
    InvalidMsg(cmbCT_UNIDAD, 'Debe seleccionar la Unidad de Tiempo de la Antigüedad.')

  else if IsEmptyString(edCT_CATEGORIA.Text) Then
    InvalidMsg(edCT_CATEGORIA, 'Debe ingresar la Categoría del Trabajador.')

  else if bAutoSector and IsEmptyString(edAutoCO_NOMBRE.Text) Then
    InvalidMsg(edAutoCO_NOMBRE, 'Si selecciona algún dato del sector, debe ingresar el Nombre del Sector.')

  else if bAutoSector and (edAutoCO_ANTIGUEDAD.Value = 0) Then
    InvalidMsg(edAutoCO_ANTIGUEDAD, 'Si selecciona algún dato del sector, debe ingresar la Antigüedad del Trabajador en el Sector.')

  else if bAutoSector and (cmbAutoCO_UNIDAD.ItemIndex = -1) Then
    InvalidMsg(cmbAutoCO_UNIDAD, 'Si selecciona algún dato del sector, debe seleccionar la Unidad de Tiempo de la Antigüedad.')

  else
  begin
    with sdqPCT_CANCERTRABAJADOR do
      begin
        if ModoABMTablas = maAlta Then
          Insert
        else
          Edit;
        {.....}
        FieldByName('CT_CUIL').AsString          := edCT_CUIL.Text;
        FieldByName('CT_NOMBRE').AsString        := edCT_NOMBRE.Text;
        FieldByName('CT_DOCUMENTOTIPO').AsString := fraCT_DOCUMENTOTIPO.Value;
        FieldByName('CT_EDAD').AsInteger         := edCT_EDAD.Value;
        FieldByName('CT_ANTIGUEDAD').AsInteger   := edCT_ANTIGUEDAD.Value;
        FieldByName('CT_UNIDAD').AsString        := UNIDAD_TIEMPO[cmbCT_UNIDAD.ItemIndex];
        FieldByName('CT_CATEGORIA').AsString     := edCT_CATEGORIA.Text;
        FieldByName('USUARIO').AsString          := frmPrincipal.DBLogin.UserID;
        FieldByName('CT_USUBAJA').Value          := Null;
        FieldByName('CT_FECHABAJA').Value        := Null;
        Post;
      end;
    {- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
    if bAutoSector Then
      with sdqPCO_CANCERSECTORTRAB do
      begin
        Insert;
        FieldByName('CO_CUIL').AsString          := edCT_CUIL.Text;
        FieldByName('CO_NOMBRE').AsString        := edAutoCO_NOMBRE.Text;
        FieldByName('CO_ANTIGUEDAD').AsInteger   := edAutoCO_ANTIGUEDAD.Value;
        FieldByName('CO_UNIDAD').AsString        := UNIDAD_TIEMPO[cmbAutoCO_UNIDAD.ItemIndex];
        FieldByName('USUARIO').AsString          := frmPrincipal.DBLogin.UserID;
        FieldByName('CO_USUBAJA').Value          := Null;
        FieldByName('CO_FECHABAJA').Value        := Null;
        Post;
      end;

    fpTrabajadores.ModalResult := mrOk;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCT_CANCERTRABAJADORGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCT_CANCERTRABAJADOR.FieldByName('CT_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCT_CANCERTRABAJADORDblClick(Sender: TObject);
begin
  if tbPCTModificar.Enabled Then
    tbPCTModificarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCONuevoClick(Sender: TObject);
begin
  Verificar(not(sdqPCT_CANCERTRABAJADOR.Active and not sdqPCT_CANCERTRABAJADOR.IsEmpty), nil, 'Debe seleccionar un trabajador para dar de alta la antigüedad en un determinado sector.');

  edCO_NOMBRE.KeyValue := null;
  edCO_ANTIGUEDAD.Clear;
  cmbCO_UNIDAD.ItemIndex := -1;

  ModoABMTablas := maAlta;

  {Desbloquea la Primary Key}
  VclExtra.LockControl(edCO_NOMBRE, False);

  fpPCO_CANCERSECTORTRAB.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCOModificarClick(Sender: TObject);
begin
  if (not sdqPCO_CANCERSECTORTRAB.IsEmpty) Then
    with sdqPCO_CANCERSECTORTRAB do
    begin
      edCO_NOMBRE.KeyValue   := FieldByName('CO_NOMBRE').AsString;
      edCO_ANTIGUEDAD.Value  := FieldByName('CO_ANTIGUEDAD').AsInteger;
      cmbCO_UNIDAD.ItemIndex := ArrayPos(FieldByName('CO_UNIDAD').AsString, UNIDAD_TIEMPO);;
      
      ModoABMTablas := maModificacion;

      {Bloquea la Primary Key}
      VclExtra.LockControl(edCO_NOMBRE, True);

      fpPCO_CANCERSECTORTRAB.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCOEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCO_CANCERSECTORTRAB, 'CO');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnSecTrabAceptarClick(Sender: TObject);
begin
  if IsEmptyString(edCO_NOMBRE.Text) Then
    InvalidMsg(edCO_NOMBRE, 'Debe seleccionar un sector.')

  else if PkViolated(sdqPCO_CANCERSECTORTRAB, ['CO_CUIL', 'CO_NOMBRE'], [sdqPCT_CANCERTRABAJADOR.FieldByName('CT_CUIL').AsString, edCO_NOMBRE.Text]) Then
    InvalidMsg(edCO_NOMBRE, 'Ya existe ese sector para el mismo trabajador.')

  else if edCO_ANTIGUEDAD.Value = 0 Then
    InvalidMsg(edCO_ANTIGUEDAD, 'Debe ingresar la Antigüedad del Trabajador en el Sector')

  else if cmbCO_UNIDAD.ItemIndex = -1 Then
    InvalidMsg(cmbCO_UNIDAD, 'Debe seleccionar la Unidad de Tiempo de la Antigüedad')

  else
  with sdqPCO_CANCERSECTORTRAB do
    begin
      if ModoABMTablas = maAlta Then
      begin
        Insert;
        FieldByName('CO_CUIL').AsString        := sdqPCT_CANCERTRABAJADOR.FieldByName('CT_CUIL').AsString;
        FieldByName('CO_NOMBRE').AsString      := edCO_NOMBRE.Text;
      end
      else
        Edit;

      FieldByName('CO_ANTIGUEDAD').AsInteger   := edCO_ANTIGUEDAD.Value;
      FieldByName('CO_UNIDAD').AsString        := UNIDAD_TIEMPO[cmbCO_UNIDAD.ItemIndex];
      FieldByName('USUARIO').AsString          := frmPrincipal.DBLogin.UserID;
      FieldByName('CO_USUBAJA').Value          := Null;
      FieldByName('CO_FECHABAJA').Value        := Null;
      try
        Post;
        fpPCO_CANCERSECTORTRAB.ModalResult := mrOk;
      except
        Cancel;
      end;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.sdqPCO_CANCERSECTORTRABFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := sdqPCT_CANCERTRABAJADOR.FieldByName('CT_CUIL').AsString = sdqPCO_CANCERSECTORTRAB.FieldByName('CO_CUIL').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.sdqPCT_CANCERTRABAJADORAfterScroll(DataSet: TDataSet);
begin
  sdqPCO_CANCERSECTORTRAB.Active   := True;
  sdqPCO_CANCERSECTORTRAB.Filtered := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCO_CANCERSECTORTRABGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCO_CANCERSECTORTRAB.FieldByName('CO_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCO_CANCERSECTORTRABDblClick(Sender: TObject);
begin
  if tbPCOModificar.Enabled Then
    tbPCOModificarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCPNuevoClick(Sender: TObject);
begin
  edCP_CUIT.Clear;
  cmbCP_INDICADOR.ItemIndex := -1;
  edCP_NOMBRE.Clear;
  edCP_CALLE.Clear;
  edCP_NUMERO.Clear;
  edCP_PISO.Clear;
  edCP_DEPARTAMENTO.Clear;
  edCP_LOCALIDAD.Clear;
  edCP_PARTIDO.Clear;
  cmbCP_PROVINCIA.ItemIndex := -1;
  edCP_CPOSTALA.Clear;
  edCP_TELEFONO.Clear;

  ModoABMTablas := maAlta;

  {Desbloquea la Primary Key}
  VclExtra.LockControl(edCP_CUIT, False);

  fpPCP_CANCERPROVEEDOR.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCPModificarClick(Sender: TObject);
begin
  if (not sdqPCP_CANCERPROVEEDOR.IsEmpty) Then
    with sdqPCP_CANCERPROVEEDOR do
    begin
      edCP_CUIT.Text            := FieldByName('CP_CUIT').AsString;
      cmbCP_INDICADOR.ItemIndex := ArrayPos(FieldByName('CP_INDICADOR').AsString, TIPO_PCP);
      edCP_NOMBRE.Text          := FieldByName('CP_NOMBRE').AsString;
      edCP_CALLE.Text           := FieldByName('CP_CALLE').AsString;
      edCP_NUMERO.Text          := FieldByName('CP_NUMERO').AsString;
      edCP_PISO.Text            := FieldByName('CP_PISO').AsString;
      edCP_DEPARTAMENTO.Text    := FieldByName('CP_DEPARTAMENTO').AsString;
      edCP_LOCALIDAD.Text       := FieldByName('CP_LOCALIDAD').AsString;
      edCP_PARTIDO.Text         := FieldByName('CP_PARTIDO').AsString;
      cmbCP_PROVINCIA.Value     := FieldByName('CP_PROVINCIA').AsString;
      edCP_CPOSTALA.Text        := FieldByName('CP_CPOSTALA').AsString;
      edCP_TELEFONO.Text        := FieldByName('CP_TELEFONO').AsString;

      ModoABMTablas := maModificacion;

      {Bloquea la Primary Key}
      VclExtra.LockControl(edCP_CUIT, True);

      fpPCP_CANCERPROVEEDOR.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCPEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCP_CANCERPROVEEDOR, 'CP', not sdqPCD_CANCERPRODUCTOS.FindFirst);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnPCPAceptarClick(Sender: TObject);
begin
  if IsEmptyString(edCP_CUIT.Text) Then
    InvalidMsg(edCP_CUIT, 'Debe ingresar el CUIT del Proveedor / Comprador')

  else if PkViolated(sdqPCP_CANCERPROVEEDOR, ['CP_CUIT'], [edCP_CUIT.Text]) Then
    InvalidMsg(edCP_CUIT, 'Ya existe un Proveedor / Comprador con el CUIT ingresado')

  else if cmbCP_INDICADOR.ItemIndex = -1 Then
    InvalidMsg(cmbCP_INDICADOR, 'Debe seleccionar el Tipo (Proveedor / Comprador)')

  else if IsEmptyString(edCP_NOMBRE.Text) Then
    InvalidMsg(edCP_NOMBRE, 'Debe Nombre del Proveedor / Comprador')

  else if IsEmptyString(edCP_CALLE.Text) Then
    InvalidMsg(edCP_CALLE, 'Debe ingresar Nombre de la Calle o Ruta')

  else if IsEmptyString(edCP_NUMERO.Text) Then
    InvalidMsg(edCP_NUMERO, 'Debe ingresar Número o Kilómetro')

  else if IsEmptyString(edCP_LOCALIDAD.Text) Then
    InvalidMsg(edCP_LOCALIDAD, 'Debe ingresar la Localidad')

  else if cmbCP_PROVINCIA.ItemIndex = -1 Then
    InvalidMsg(cmbCP_PROVINCIA, 'Debe ingresar la Provincia')

  else if IsEmptyString(edCP_CPOSTALA.Text) Then
    InvalidMsg(edCP_CPOSTALA, 'Debe ingresar el Código Postal Argentino')

  else if not (IsCPA(edCP_CPOSTALA.Text) or IsCPostal(edCP_CPOSTALA.Text)) Then
    InvalidMsg(edCP_CPOSTALA, 'Debe ingresar el Código Postal Argentino o Código Postal no es válido')

  else if IsEmptyString(edCP_TELEFONO.Text) Then
    InvalidMsg(edCP_TELEFONO, 'Debe ingresar el Teléfono')

  else
  with sdqPCP_CANCERPROVEEDOR do
    begin
      if ModoABMTablas = maAlta Then
        Insert
      else
        Edit;

      FieldByName('CP_CUIT').AsString             := edCP_CUIT.Text;
      FieldByName('CP_INDICADOR').AsString        := TIPO_PCP[cmbCP_INDICADOR.ItemIndex];
      FieldByName('CP_NOMBRE').AsString           := edCP_NOMBRE.Text;
      FieldByName('CP_CALLE').AsString            := edCP_CALLE.Text;
      FieldByName('CP_NUMERO').AsString           := edCP_NUMERO.Text;
      FieldByName('CP_PISO').AsString             := edCP_PISO.Text;
      FieldByName('CP_DEPARTAMENTO').AsString     := edCP_DEPARTAMENTO.Text;
      FieldByName('CP_LOCALIDAD').AsString        := edCP_LOCALIDAD.Text;
      FieldByName('CP_PARTIDO').AsString          := edCP_PARTIDO.Text;
      FieldByName('CP_PROVINCIA').AsString        := cmbCP_PROVINCIA.Value;
      FieldByName('CP_CPOSTALA').AsString         := edCP_CPOSTALA.Text;
      FieldByName('CP_TELEFONO').AsString         := edCP_TELEFONO.Text;
      FieldByName('USUARIO').AsString             := frmPrincipal.DBLogin.UserID;
      FieldByName('CP_USUBAJA').Value             := Null;
      FieldByName('CP_FECHABAJA').Value           := Null;

      Post;

      fpPCP_CANCERPROVEEDOR.ModalResult := mrOk;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCP_CANCERPROVEEDORGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCP_CANCERPROVEEDOR.FieldByName('CP_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCP_CANCERPROVEEDORDblClick(Sender: TObject);
begin
  if tbPCPModificar.Enabled Then
    tbPCPModificarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.sdqPCP_CANCERPROVEEDORAfterScroll(DataSet: TDataSet);
begin
  sdqPCD_CANCERPRODUCTOS.Active   := True;
  sdqPCD_CANCERPRODUCTOS.Filtered := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCDNuevoClick(Sender: TObject);
begin
  Verificar(not(sdqPCP_CANCERPROVEEDOR.Active and not sdqPCP_CANCERPROVEEDOR.IsEmpty), nil, 'Debe seleccionar un Proveedor/Comprador para dar de alta una sustancia.');

  edCD_NOMBRE_QUIMICO.Clear;
  edCD_NOMBRE_COMERCIAL.Clear;

  ModoABMTablas := maAlta;

  fpPCD_CANCERPRODUCTOS.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCDModificarClick(Sender: TObject);
begin
  if (not sdqPCD_CANCERPRODUCTOS.IsEmpty) Then
    with sdqPCD_CANCERPRODUCTOS do
    begin
      edCD_NOMBRE_QUIMICO.Text   := FieldByName('CD_NOMBRE_QUIMICO').AsString;
      edCD_NOMBRE_COMERCIAL.Text := FieldByName('CD_NOMBRE_COMERCIAL').AsString;

      ModoABMTablas := maModificacion;

      fpPCD_CANCERPRODUCTOS.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCDEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCD_CANCERPRODUCTOS, 'CD');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.sdqPCD_CANCERPRODUCTOSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (sdqPCP_CANCERPROVEEDOR.FieldByName('CP_CUIT').AsString = sdqPCD_CANCERPRODUCTOS.FieldByName('CD_CUIT').AsString);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.bntPCDAceptarClick(Sender: TObject);
begin
  if IsEmptyString(edCD_NOMBRE_QUIMICO.Text) Then
    InvalidMsg(edCD_NOMBRE_QUIMICO, 'Debe ingresar el Nombre Químico del Producto')

  else if IsEmptyString(edCD_NOMBRE_COMERCIAL.Text) Then
    InvalidMsg(edCD_NOMBRE_COMERCIAL, 'Debe ingresar el Nombre Comercial del Producto')

  else
  with sdqPCD_CANCERPRODUCTOS do
    begin
      if ModoABMTablas = maAlta Then
      begin
        Insert;
        FieldByName('CD_CODIGO').AsInteger        := GetSecNextVal('HYS.SEQ_PCD_CODIGO');
        FieldByName('CD_CUIT').AsString           := sdqPCP_CANCERPROVEEDOR.FieldByName('CP_CUIT').AsString;
      end
      else
        Edit;

      FieldByName('CD_NOMBRE_QUIMICO').AsString   := edCD_NOMBRE_QUIMICO.Text;
      FieldByName('CD_NOMBRE_COMERCIAL').AsString := edCD_NOMBRE_COMERCIAL.Text;
      FieldByName('USUARIO').AsString             := frmPrincipal.DBLogin.UserID;
      FieldByName('CD_USUBAJA').Value             := Null;
      FieldByName('CD_FECHABAJA').Value           := Null;

      Post;

      fpPCD_CANCERPRODUCTOS.ModalResult := mrOk;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCD_CANCERPRODUCTOSGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCD_CANCERPRODUCTOS.FieldByName('CD_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCD_CANCERPRODUCTOSDblClick(Sender: TObject);
begin
  if tbPCDModificar.Enabled Then
    tbPCDModificarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCSNuevoClick(Sender: TObject);
begin
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

  VclExtra.LockControls([fraCS_CODIGO,
                         chkEstAmbCC_DETERMINACIONES, cmbEstAmbCC_FRECUENCIA,
                         chkEstBioCC_DETERMINACIONES, cmbEstBioCC_FRECUENCIA],
                        False);

  fpPCS_CANCERSUSTANCIA.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCSModificarClick(Sender: TObject);
begin
  if (not sdqPCS_CANCERSUSTANCIA.IsEmpty) Then
    with sdqPCS_CANCERSUSTANCIA do
    begin
      fraCS_CODIGO.Codigo                 := FieldByName('CS_CODIGO').AsString;
      chkCS_INFORMACION.Checked           := FieldByName('CS_INFORMACION').AsString = SQL_TRUE;
      chkCS_CAPACITACION.Checked          := FieldByName('CS_CAPACITACION').AsString = SQL_TRUE;
      edCS_ESTUDIOS.Text                  := FieldByName('CS_ESTUDIOS').AsString;
      edCS_MEDIDAS.Text                   := FieldByName('CS_MEDIDAS').AsString;
      chkCS_EXAMEN_PREOCUPACIONAL.Checked := FieldByName('CS_EXAMEN_PREOCUPACIONAL').AsString = SQL_TRUE;
      chkCS_EXAMEN_PERIODICO.Checked      := FieldByName('CS_EXAMEN_PERIODICO').AsString = SQL_TRUE;
      chkCS_EXAMEN_EGRESO.Checked         := FieldByName('CS_EXAMEN_EGRESO').AsString = SQL_TRUE;

      chkEstAmbCC_DETERMINACIONES.Checked := False;
      cmbEstAmbCC_FRECUENCIA.ItemIndex := -1;
      chkEstBioCC_DETERMINACIONES.Checked := False;
      cmbEstBioCC_FRECUENCIA.ItemIndex := -1;

      VclExtra.LockControls([fraCS_CODIGO,
                             chkEstAmbCC_DETERMINACIONES, cmbEstAmbCC_FRECUENCIA,
                             chkEstBioCC_DETERMINACIONES, cmbEstBioCC_FRECUENCIA],
                            True);

      ModoABMTablas := maModificacion;

      fpPCS_CANCERSUSTANCIA.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCSEliminarClick(Sender: TObject);
var
  bAllowDelete: boolean;
begin
  bAllowDelete := (not sdqPCC_CANCERESTUDIO.FindFirst) and (CountRecords(sdqPCX_CANCERSUSTTRAB, ['CX_IDCANCERSUSTANCIA'], [sdqPCS_CANCERSUSTANCIA.FieldByName('CS_CODIGO').Value]) = 0);
  DoDarDeBaja(sdqPCS_CANCERSUSTANCIA, 'CS', bAllowDelete);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnPCSAceptarClick(Sender: TObject);
begin
  if fraCS_CODIGO.IsEmpty Then
    InvalidMsg(fraCS_CODIGO.edCodigo, 'Debe seleccionar la Sustancia')

  else if PkViolated(sdqPCS_CANCERSUSTANCIA, ['CS_CODIGO'], [fraCS_CODIGO.Codigo]) Then
    InvalidMsg(fraCS_CODIGO, 'Ya se ha cargado anteriormente la sustancia seleccionada')

  else if IsEmptyString(edCS_ESTUDIOS.Text) Then
    InvalidMsg(edCS_ESTUDIOS, 'Debe describir los Estudios')

  else if IsEmptyString(edCS_MEDIDAS.Text) Then
    InvalidMsg(edCS_MEDIDAS, 'Debe describir las Medidas')

  else if chkEstAmbCC_DETERMINACIONES.Checked and (cmbEstAmbCC_FRECUENCIA.ItemIndex = -1) Then
    InvalidMsg(cmbEstAmbCC_FRECUENCIA, 'Debe seleccionar la Frecuencia si ha Efectuado Determinaciones en Estudios Ambientales Específicos')

  else if chkEstBioCC_DETERMINACIONES.Checked and (cmbEstBioCC_FRECUENCIA.ItemIndex = -1) Then
    InvalidMsg(cmbEstBioCC_FRECUENCIA, 'Debe seleccionar la Frecuencia si ha Efectuado Determinaciones en Estudios Biológicos Específicos')

  else
  with sdqPCS_CANCERSUSTANCIA do
    begin
      if ModoABMTablas = maAlta Then
        Insert
      else
        Edit;

      FieldByName('CS_CODIGO').AsString                := fraCS_CODIGO.Codigo;
      FieldByName('CS_INFORMACION').AsString           := SqlBoolean(chkCS_INFORMACION.Checked, False);
      FieldByName('CS_CAPACITACION').AsString          := SqlBoolean(chkCS_CAPACITACION.Checked, False);
      FieldByName('CS_ESTUDIOS').AsString              := edCS_ESTUDIOS.Text;
      FieldByName('CS_MEDIDAS').AsString               := edCS_MEDIDAS.Text;
      FieldByName('CS_EXAMEN_PREOCUPACIONAL').AsString := SqlBoolean(chkCS_EXAMEN_PREOCUPACIONAL.Checked, False);
      FieldByName('CS_EXAMEN_PERIODICO').AsString      := SqlBoolean(chkCS_EXAMEN_PERIODICO.Checked, False);
      FieldByName('CS_EXAMEN_EGRESO').AsString         := SqlBoolean(chkCS_EXAMEN_EGRESO.Checked, False);
      FieldByName('USUARIO').AsString                  := frmPrincipal.DBLogin.UserID;
      FieldByName('CS_USUBAJA').Value                  := Null;
      FieldByName('CS_FECHABAJA').Value                := Null;

      { Solo Campos para Mostrar: }
      FieldByName('RG_DESCRIPCION').AsString           := fraCS_CODIGO.cmbDescripcion.Text;

      Post;

      {********************************************************
       **                                                    **
       **      Hay que hacer procedimientos con esto:        **
       **                                                    **
       ********************************************************}

      if ModoABMTablas = maAlta Then
      begin
        { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
        if cmbEstBioCC_FRECUENCIA.ItemIndex > -1 Then
          with sdqPCC_CANCERESTUDIO do
          begin
            Insert;

            FieldByName('CC_IDCANCERSUSTANCIA').AsString := fraCS_CODIGO.Codigo;
            FieldByName('CC_TIPO').AsString              := 'A';
            FieldByName('CC_DETERMINACIONES').AsString   := SqlBoolean(chkEstAmbCC_DETERMINACIONES.Checked, False);
            FieldByName('CC_FRECUENCIA').AsString        := FRECUENCIA_PCC[cmbEstAmbCC_FRECUENCIA.ItemIndex];
            FieldByName('USUARIO').AsString              := frmPrincipal.DBLogin.UserID;
            FieldByName('CC_USUBAJA').Value              := Null;
            FieldByName('CC_FECHABAJA').Value            := Null;

            { Solo Campos para Mostrar: }
            FieldByName('TIPO').AsString                 := cmbCC_TIPO.Items[0];
            FieldByName('FRECUENCIA').AsString           := cmbEstAmbCC_FRECUENCIA.Text;

            Post;
          end;

        { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
        if cmbEstBioCC_FRECUENCIA.ItemIndex > -1 Then
          with sdqPCC_CANCERESTUDIO do
          begin
            Insert;

            FieldByName('CC_IDCANCERSUSTANCIA').AsString := fraCS_CODIGO.Codigo;
            FieldByName('CC_TIPO').AsString              := 'B';
            FieldByName('CC_DETERMINACIONES').AsString   := SqlBoolean(chkEstBioCC_DETERMINACIONES.Checked, False);
            FieldByName('CC_FRECUENCIA').AsString        := FRECUENCIA_PCC[cmbEstBioCC_FRECUENCIA.ItemIndex];
            FieldByName('USUARIO').AsString              := frmPrincipal.DBLogin.UserID;
            FieldByName('CC_USUBAJA').Value              := Null;
            FieldByName('CC_FECHABAJA').Value            := Null;

            { Solo Campos para Mostrar: }
            FieldByName('TIPO').AsString                 := cmbCC_TIPO.Items[1];
            FieldByName('FRECUENCIA').AsString           := cmbEstBioCC_FRECUENCIA.Text;

            Post;
          end;
        { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
      end;


      fpPCS_CANCERSUSTANCIA.ModalResult := mrOk;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCS_CANCERSUSTANCIAGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCS_CANCERSUSTANCIA.FieldByName('CS_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCS_CANCERSUSTANCIADblClick(Sender: TObject);
begin
  if tbPCSModificar.Enabled Then
    tbPCSModificarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.sdqPCS_CANCERSUSTANCIAAfterScroll(DataSet: TDataSet);
begin
  sdqPCC_CANCERESTUDIO.Active   := True;
  sdqPCC_CANCERESTUDIO.Filtered := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCCNuevoClick(Sender: TObject);
begin
  cmbCC_TIPO.ItemIndex := -1;
  chkCC_DETERMINACIONES.Checked := True;
  cmbCC_FRECUENCIA.ItemIndex := -1;

  ModoABMTablas := maAlta;

  fpPCC_CANCERESTUDIO.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCCModificarClick(Sender: TObject);
begin
  if (not sdqPCC_CANCERESTUDIO.IsEmpty) Then
    with sdqPCC_CANCERESTUDIO do
    begin
      cmbCC_TIPO.ItemIndex          := ArrayPos(FieldByName('CC_TIPO').AsString, TIPO_PCC);
      chkCC_DETERMINACIONES.Checked := FieldByName('CC_DETERMINACIONES').AsString = SQL_TRUE;
      cmbCC_FRECUENCIA.ItemIndex    := ArrayPos(FieldByName('CC_FRECUENCIA').AsString, FRECUENCIA_PCC);

      ModoABMTablas := maModificacion;

      fpPCC_CANCERESTUDIO.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCCEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCC_CANCERESTUDIO, 'CC');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnPCCAceptarClick(Sender: TObject);
begin
  if cmbCC_TIPO.ItemIndex = -1 Then
    InvalidMsg(cmbCC_TIPO, 'Debe seleccionar el Tipo')

  else if PkViolated(sdqPCC_CANCERESTUDIO, ['CC_IDCANCERSUSTANCIA', 'CC_TIPO'], [sdqPCS_CANCERSUSTANCIA.FieldByName('CS_CODIGO').AsString, TIPO_PCC[cmbCC_TIPO.ItemIndex]]) Then
    InvalidMsg(cmbCC_TIPO, 'Ya se ha ingresado el Estudio')

  else if cmbCC_FRECUENCIA.ItemIndex = -1 Then
    InvalidMsg(cmbCC_FRECUENCIA, 'Debe seleccionar la Frecuencia')

  else
  with sdqPCC_CANCERESTUDIO do
    begin
      if ModoABMTablas = maAlta Then
        Insert
      else
        Edit;

      FieldByName('CC_IDCANCERSUSTANCIA').AsString := sdqPCS_CANCERSUSTANCIA.FieldByName('CS_CODIGO').AsString;
      FieldByName('CC_TIPO').AsString              := TIPO_PCC[cmbCC_TIPO.ItemIndex];
      FieldByName('CC_DETERMINACIONES').AsString   := SqlBoolean(chkCC_DETERMINACIONES.Checked, False);
      FieldByName('CC_FRECUENCIA').AsString        := FRECUENCIA_PCC[cmbCC_FRECUENCIA.ItemIndex];
      FieldByName('USUARIO').AsString              := frmPrincipal.DBLogin.UserID;
      FieldByName('CC_USUBAJA').Value              := Null;
      FieldByName('CC_FECHABAJA').Value            := Null;

      { Solo Campos para Mostrar: }
      FieldByName('TIPO').AsString                 := cmbCC_TIPO.Text;
      FieldByName('FRECUENCIA').AsString           := cmbCC_FRECUENCIA.Text;

      Post;

      fpPCC_CANCERESTUDIO.ModalResult := mrOk;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCC_CANCERESTUDIOGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCC_CANCERESTUDIO.FieldByName('CC_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCC_CANCERESTUDIODblClick(Sender: TObject);
begin
  if tbPCCModificar.Enabled Then
    tbPCCModificarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.sdqPCC_CANCERESTUDIOFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := sdqPCC_CANCERESTUDIO.FieldByName('CC_IDCANCERSUSTANCIA').AsString = sdqPCS_CANCERSUSTANCIA.FieldByName('CS_CODIGO').AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCXNuevoClick(Sender: TObject);
begin
  Verificar(not(sdqPCD_CANCERPRODUCTOS.Active and not sdqPCD_CANCERPRODUCTOS.IsEmpty), nil, 'Debe seleccionar alguna sustancia para dar de alta datos en esta grilla.');

  dbcCX_IDCANCERSUSTANCIA.KeyValue := Null;
  edCX_IDSECTOR.Clear;
  edCX_TRAB_PERMANENTE.Clear;
  edCX_TRAB_NOPERMANENTE1.Clear;
  edCX_TRAB_NOPERMANENTE2.Clear;

  ModoABMTablas := maAlta;

  {Desbloquea la Primary Key}
  VclExtra.LockControls([dbcCX_IDCANCERSUSTANCIA, edCX_IDSECTOR], False);

  fpPCX_CANCERSUSTTRAB.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCXModificarClick(Sender: TObject);
begin
  if (not sdqPCX_CANCERSUSTTRAB.IsEmpty) Then
    with sdqPCX_CANCERSUSTTRAB do
    begin
      dbcCX_IDCANCERSUSTANCIA.KeyValue := FieldByName('CX_IDCANCERSUSTANCIA').Value;
      edCX_IDSECTOR.Text               := FieldByName('CX_IDSECTOR').AsString;
      edCX_TRAB_PERMANENTE.Value       := FieldByName('CX_TRAB_PERMANENTE').AsInteger;
      edCX_TRAB_NOPERMANENTE1.Value    := FieldByName('CX_TRAB_NOPERMANENTE1').AsInteger;
      edCX_TRAB_NOPERMANENTE2.Value    := FieldByName('CX_TRAB_NOPERMANENTE2').AsInteger;

      ModoABMTablas := maModificacion;

      {Bloquea la Primary Key}
      VclExtra.LockControls([dbcCX_IDCANCERSUSTANCIA, edCX_IDSECTOR], True);

      fpPCX_CANCERSUSTTRAB.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCXEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCX_CANCERSUSTTRAB, 'CX', not sdqPCU_CANCERUSOSUSTANCIAS.FindFirst);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnPCXAceptarClick(Sender: TObject);
begin
  if VarIsNull(dbcCX_IDCANCERSUSTANCIA.KeyValue) Then
    InvalidMsg(dbcCX_IDCANCERSUSTANCIA, 'Debe seleccionar la Sustancia')

  else if IsEmptyString(edCX_IDSECTOR.Text) Then
    InvalidMsg(edCX_IDSECTOR, 'Debe ingresar el Sector')

  else if PkViolated(sdqPCX_CANCERSUSTTRAB, ['CX_IDCANCERSUSTANCIA', 'CX_IDSECTOR'], [dbcCX_IDCANCERSUSTANCIA.KeyValue, edCX_IDSECTOR.Text]) Then
    InvalidMsg(dbcCX_IDCANCERSUSTANCIA, 'Ya se ha ingresado un registro para la misma Sustancia y Sector')

  else if IsEmptyString(edCX_TRAB_PERMANENTE.Text) Then
    InvalidMsg(edCX_TRAB_PERMANENTE, 'Debe ingresar la ' + lbCX_TRAB_PERMANENTE.Caption)

  else if IsEmptyString(edCX_TRAB_NOPERMANENTE1.Text) Then
    InvalidMsg(edCX_TRAB_NOPERMANENTE1, 'Debe ingresar la ' + lbCX_TRAB_NOPERMANENTE1.Caption)

  else if IsEmptyString(edCX_TRAB_NOPERMANENTE2.Text) Then
    InvalidMsg(edCX_TRAB_NOPERMANENTE2, 'Debe ingresar la ' + lbCX_TRAB_NOPERMANENTE2.Caption)

  else
  with sdqPCX_CANCERSUSTTRAB do
    begin
      if ModoABMTablas = maAlta Then
        Insert
      else
        Edit;

      FieldByName('CX_IDCANCERSUSTANCIA').Value      := dbcCX_IDCANCERSUSTANCIA.KeyValue;
      FieldByName('CX_IDSECTOR').AsString            := edCX_IDSECTOR.Text;
      FieldByName('CX_TRAB_PERMANENTE').AsInteger    := edCX_TRAB_PERMANENTE.Value;
      FieldByName('CX_TRAB_NOPERMANENTE1').AsInteger := edCX_TRAB_NOPERMANENTE1.Value;
      FieldByName('CX_TRAB_NOPERMANENTE2').AsInteger := edCX_TRAB_NOPERMANENTE2.Value;
      FieldByName('USUARIO').AsString                := frmPrincipal.DBLogin.UserID;
      FieldByName('CX_USUBAJA').Value                := Null;
      FieldByName('CX_FECHABAJA').Value              := Null;

      { Solo Campos para Mostrar: }
      FieldByName('RG_DESCRIPCION').AsString         := dbcCX_IDCANCERSUSTANCIA.Text;

      Post;

      fpPCX_CANCERSUSTTRAB.ModalResult := mrOk;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.fpPCX_CANCERSUSTTRABBeforeShow(Sender: TObject);
begin
  { Si no pasó anteriormente por la solapita "Sustancias", lo abre ahora }
  sdqPCS_CANCERSUSTANCIA.Active := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCX_CANCERSUSTTRABDblClick(Sender: TObject);
begin
  if tbPCXModificar.Enabled Then
    tbPCXModificarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCX_CANCERSUSTTRABGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCX_CANCERSUSTTRAB.FieldByName('CX_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.sdqPCX_CANCERSUSTTRABAfterScroll(DataSet: TDataSet);
begin
  sdqPCU_CANCERUSOSUSTANCIAS.Active   := True;
  sdqPCU_CANCERUSOSUSTANCIAS.Filtered := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCUNuevoClick(Sender: TObject);
begin
  Verificar(not(sdqPCX_CANCERSUSTTRAB.Active and not sdqPCX_CANCERSUSTTRAB.IsEmpty), nil, 'Debe seleccionar algún sector y sustancia para poder determinar sus usos.');

  dbcCU_IDPRODUCTO.KeyValue := Null;
  edCU_USOS.Clear;
  cgCU_MODOS_USO.Clear;
  edCU_OTROS_MODOS_EMPLEO.Clear;
  cmbCU_UNIDAD.ItemIndex := -1;
  edCU_CANTIDAD.Clear;

  ModoABMTablas := maAlta;

  {Desbloquea la Primary Key}
  VclExtra.LockControls([dbcCU_IDPRODUCTO, edCU_USOS], False);

  fpPCU_CANCERUSOSUSTANCIAS.ShowModal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCUModificarClick(Sender: TObject);
begin
  if (not sdqPCU_CANCERUSOSUSTANCIAS.IsEmpty) Then
    with sdqPCU_CANCERUSOSUSTANCIAS do
    begin
      dbcCU_IDPRODUCTO.KeyValue    := FieldByName('CU_IDPRODUCTO').Value;
      edCU_USOS.Text               := FieldByName('CU_USOS').AsString;
      cgCU_MODOS_USO.Value         := FieldByName('CU_MODOS_USO').AsString;
      edCU_OTROS_MODOS_EMPLEO.Text := FieldByName('CU_OTROS_MODOS_EMPLEO').AsString;
      cmbCU_UNIDAD.ItemIndex       := ArrayPos(FieldByName('CU_UNIDAD').AsString, UNIDAD_PCU);
      edCU_CANTIDAD.Text           := FieldByName('CU_CANTIDAD').AsString;

      ModoABMTablas := maModificacion;

      {Bloquea la Primary Key}
      VclExtra.LockControls([dbcCU_IDPRODUCTO, edCU_USOS], True);

      fpPCU_CANCERUSOSUSTANCIAS.ShowModal;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.tbPCUEliminarClick(Sender: TObject);
begin
  DoDarDeBaja(sdqPCU_CANCERUSOSUSTANCIAS, 'CU');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnPCUAceptarClick(Sender: TObject);
begin
  if VarIsNull(dbcCU_IDPRODUCTO.KeyValue) Then
    InvalidMsg(dbcCU_IDPRODUCTO, 'Debe seleccionar un Producto')

  else if IsEmptyString(edCU_USOS.Text) Then
    InvalidMsg(edCU_USOS, 'Debe ingresar el Uso')

  else if PkViolated(sdqPCU_CANCERUSOSUSTANCIAS, ['CU_IDCANCERSUSTANCIA', 'CU_IDSECTOR', 'CU_IDPRODUCTO', 'CU_USOS'],
                                                 [sdqPCX_CANCERSUSTTRAB.FieldByName('CX_IDCANCERSUSTANCIA').Value,
                                                  sdqPCX_CANCERSUSTTRAB.FieldByName('CX_IDSECTOR').Value,
                                                  dbcCU_IDPRODUCTO.KeyValue,
                                                  edCU_USOS.Text]) Then
    InvalidMsg(dbcCU_IDPRODUCTO, 'Ya se ha agregado anteriormente el mismo producto con el mismo uso.')

  else if IsEmptyString(edCU_OTROS_MODOS_EMPLEO.Text) Then
    InvalidMsg(edCU_OTROS_MODOS_EMPLEO, 'Debe ingresar el Modo de Empleo')

  else if edCU_CANTIDAD.Value = 0 Then
    InvalidMsg(edCU_CANTIDAD, 'Debe ingresar la Cantidad del producto Utilizada')

  else if cmbCU_UNIDAD.ItemIndex = -1 Then
    InvalidMsg(cmbCU_UNIDAD, 'Debe ingresar la Unidad de Medida')

  else
  with sdqPCU_CANCERUSOSUSTANCIAS do
    begin
      if ModoABMTablas = maAlta Then
      begin
        Insert;

        FieldByName('CU_IDCANCERSUSTANCIA').Value := sdqPCX_CANCERSUSTTRAB.FieldByName('CX_IDCANCERSUSTANCIA').Value;
        FieldByName('CU_IDSECTOR').Value          := sdqPCX_CANCERSUSTTRAB.FieldByName('CX_IDSECTOR').Value;
        FieldByName('CU_IDPRODUCTO').Value        := dbcCU_IDPRODUCTO.KeyValue;
        FieldByName('CU_USOS').AsString           := edCU_USOS.Text;
      end
      else
        Edit;

      FieldByName('CU_MODOS_USO').AsString          := cgCU_MODOS_USO.Value;
      FieldByName('CU_OTROS_MODOS_EMPLEO').AsString := edCU_OTROS_MODOS_EMPLEO.Text;
      FieldByName('CU_UNIDAD').AsString             := UNIDAD_PCU[cmbCU_UNIDAD.ItemIndex];
      FieldByName('CU_CANTIDAD').AsString           := edCU_CANTIDAD.Text;
      FieldByName('USUARIO').AsString               := frmPrincipal.DBLogin.UserID;
      FieldByName('CU_USUBAJA').Value               := Null;
      FieldByName('CU_FECHABAJA').Value             := Null;

      { Solo Campos para Mostrar: }
      FieldByName('CD_NOMBRE_QUIMICO').AsString     := sdqPCD_CANCERPRODUCTOS.FieldByName('CD_NOMBRE_QUIMICO').AsString;
      FieldByName('CD_NOMBRE_COMERCIAL').AsString   := sdqPCD_CANCERPRODUCTOS.FieldByName('CD_NOMBRE_COMERCIAL').AsString;
      FieldByName('UNIDAD').AsString                := cmbCU_UNIDAD.Text;

      Post;

      fpPCU_CANCERUSOSUSTANCIAS.ModalResult := mrOk;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCU_CANCERUSOSUSTANCIASDblClick(Sender: TObject);
begin
  if tbPCUModificar.Enabled Then
    tbPCUModificarClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.dbgPCU_CANCERUSOSUSTANCIASGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPCU_CANCERUSOSUSTANCIAS.FieldByName('CU_FECHABAJA').IsNull Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.fpPCU_CANCERUSOSUSTANCIASBeforeShow(Sender: TObject);
begin
  { Si no pasó anteriormente por la solapita "Proveedores / Compradores", lo abre ahora }
  sdqPCD_CANCERPRODUCTOS.Filtered := False;
  sdqPCD_CANCERPRODUCTOS.Active   := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.edNumeroInformeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (Shift = [ssAlt]) Then
    btnBuscarInformeClick(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.ShortCutNuevo(Sender: TObject);
begin
  if ModoABM = maNone Then
    tbNuevoClick(Nil)
  else
    DoButtonClick('Nuevo');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.ShortCutModificar(Sender: TObject);
begin
  if ModoABM = maNone then
    tbModificarClick(nil)
  else
    DoButtonClick('Modificar');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.ShortCutEliminar(Sender: TObject);
begin
  if ModoABM = maNone then
    tbEliminarClick(nil)
  else
    DoButtonClick('Eliminar');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.DoButtonClick(AButtonName: string);
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
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmInformeCencerigenos.btnPCTTomarDatosClick(Sender: TObject);
var
  sSql: string;
  nCantidad: integer;
  TipoFecha: TTipoFecha;
begin
  sSql := 'SELECT TJ_NOMBRE, TJ_FNACIMIENTO, NVL(RL_CATEGORIA, ''SIN CATEGORIA'') RL_CATEGORIA, RL_FECHAINGRESO ' +
            'FROM CRL_RELACIONLABORAL, CTJ_TRABAJADOR ' +
           'WHERE TJ_CUIL = :CUIL ' +
             'AND TJ_ID = RL_IDTRABAJADOR (+)';
  with GetQueryEx(sSql, [edCT_CUIL.Text]) do
    try
      if IsEmpty then
        abort;

      Get_DiferenciaFechas(Now, FieldByName('RL_FECHAINGRESO').AsDateTime, nCantidad, TipoFecha);

      edCT_NOMBRE.Text          := FieldByName('TJ_NOMBRE').AsString;
      edCT_CATEGORIA.Text       := FieldByName('RL_CATEGORIA').AsString;
      edCT_ANTIGUEDAD.Value     := nCantidad;
      fraCT_DOCUMENTOTIPO.Value := '99';

      edCT_EDAD.Value := GetAge(FieldByName('TJ_FNACIMIENTO').AsDateTime);

      case TipoFecha of
        tfDias  : cmbCT_UNIDAD.ItemIndex := 0;
        tfMeses : cmbCT_UNIDAD.ItemIndex := 1;
        tfAnios : cmbCT_UNIDAD.ItemIndex := 2;
      end;

    finally
      Free;
    end;
end;

procedure TfrmInformeCencerigenos.edCT_CUILKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edCT_CUIL.ReadOnly) then
   btnPCTTomarDatosClick(nil);
end;

procedure TfrmInformeCencerigenos.fpTrabajadoresShow(Sender: TObject);
begin
  sdqPCX_CANCERSUSTTRAB.Open;
  if not sdqPCX_CANCERSUSTTRAB.IsEmpty then
  begin
    sdqSectoresDisponibles.Close;
    sdqSectoresDisponibles.Open;
  end;
end;

procedure TfrmInformeCencerigenos.btnPCPTomarDatosClick(Sender: TObject);
var
  sSql: string;
begin
  sSql := 'SELECT CP_CUIT, CP_NOMBRE, CP_CALLE, CP_NUMERO, ' +
                 'CP_PISO, CP_DEPARTAMENTO, CP_LOCALIDAD, CP_PARTIDO, CP_PROVINCIA, ' +
                 'CP_CPOSTALA, CP_TELEFONO, CP_INDICADOR, ' +
                 'CP_FECHAMODIF, CP_USUMODIF ' +
            'FROM HYS.PCP_CANCERPROVEEDOR ' +
           'WHERE CP_CUIT = :CP_CUIT';
  with GetQueryEx(sSql, [edCP_CUIT.Text]) do
  try
    if not IsEmpty then
    begin
      cmbCP_INDICADOR.ItemIndex := ArrayPos(FieldByName('CP_INDICADOR').AsString, TIPO_PCP);
      edCP_NOMBRE.Text          := FieldByName('CP_NOMBRE').AsString;
      edCP_CALLE.Text           := FieldByName('CP_CALLE').AsString;
      edCP_NUMERO.Text          := FieldByName('CP_NUMERO').AsString;
      edCP_PISO.Text            := FieldByName('CP_PISO').AsString;
      edCP_DEPARTAMENTO.Text    := FieldByName('CP_DEPARTAMENTO').AsString;
      edCP_LOCALIDAD.Text       := FieldByName('CP_LOCALIDAD').AsString;
      edCP_PARTIDO.Text         := FieldByName('CP_PARTIDO').AsString;
      cmbCP_PROVINCIA.Value     := FieldByName('CP_PROVINCIA').AsString;
      edCP_CPOSTALA.Text        := FieldByName('CP_CPOSTALA').AsString;
      edCP_TELEFONO.Text        := FieldByName('CP_TELEFONO').AsString;
    end;
  finally
    Free;
  end;
end;

procedure TfrmInformeCencerigenos.edCP_CUITKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edCP_CUIT.ReadOnly) then
   btnPCPTomarDatosClick(nil);
end;

procedure TfrmInformeCencerigenos.edCE_NUMEROESTABLECIKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not edCE_NUMEROESTABLECI.ReadOnly) then
   btnPCETomarDatosClick(nil);
end;

end.

