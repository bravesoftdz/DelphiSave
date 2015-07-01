unit unABMPRAM;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, SqlFuncs, unDmPrincipal, ExComboBox, AnsiSql, CustomDlgs,
  unFraCodigoDescripcion, CurrEdit, Mask, unFraEmpresa, unFraDomicilioTrab,
  unArtDbFrame, unFraTrabajador, ToolEdit, DateComboBox, SinEdit, General,
  IntEdit, unArtFrame, unArtDBAwareFrame, VCLExtra, unComunes, rxStrUtils,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Buttons, JvExMask,
  JvToolEdit, JvMaskEdit, unfraEstablecimientoDomic, unFraDomicilio, Strfuncs,
  DateTimeFuncs, RxMemDS, CUIT, unArt, DbFuncs, CheckLst, ARTCheckListBox,
  RXCtrls, unFraEstablecimiento, PatternEdit;

type
  TfrmABMPRAM = class(TfrmCustomGridABM)
    sdqPSV_SEGUIMIENTOVISITA: TSDQuery;
    dsPSV_SEGUIMIENTOVISITA: TDataSource;
    sduPSV_SEGUIMIENTOVISITA: TSDUpdateSQL;
    sdqPCM_CAUSAYMEDIDA: TSDQuery;
    dsPCM_CAUSAYMEDIDA: TDataSource;
    sdqPPE_PERSONAENTREVISTADA: TSDQuery;
    dsPPE_PERSONAENTREVISTADA: TDataSource;
    sduPPE_PERSONAENTREVISTADA: TSDUpdateSQL;
    sduPDC_DIAGNOSTICOCAUSA: TSDUpdateSQL;
    dsPDC_DIAGNOSTICOCAUSA: TDataSource;
    sdqPDC_DIAGNOSTICOCAUSA: TSDQuery;
    sdqPMC_MEDIDACORRECTIVA: TSDQuery;
    dsPMC_MEDIDACORRECTIVA: TDataSource;
    sduPMC_MEDIDACORRECTIVA: TSDUpdateSQL;
    pcDatos: TPageControl;
    tsDatosSiniestro: TTabSheet;
    ScrollBox: TScrollBox;
    lbPrograma: TLabel;
    Operativo: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    lbObservaciones: TLabel;
    btnTop: TSpeedButton;
    Label21: TLabel;
    Bevel7: TBevel;
    Label22: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label48: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Bevel10: TBevel;
    Label58: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label66: TLabel;
    Bevel11: TBevel;
    fraAE_PROGRAMA: TfraStaticCTB_TABLAS;
    fraAE_IDOPERATIVO: TfraStaticCodigoDescripcion;
    edAE_DOTACION: TIntEdit;
    edAE_OBSERVACIONES: TMemo;
    fraEmpresa: TfraEmpresa;
    edAE_TELEFONOS: TPatternEdit;
    fraAE_IDACTIVIDAD: TfraStaticCodigoDescripcion;
    rgAE_TIPOESTABLECIMIENTO: TRadioGroup;
    edAE_DOTACIONESTABLECIMIENTO: TIntEdit;
    fraAE_LUGARDEOCURRENCIA: TfraStaticCTB_TABLAS;
    edAE_FRECEPCIONOBRA: TDateComboBox;
    edAE_FINICIOACTIVIDAD: TDateComboBox;
    edAE_SUPERFICIE: TCurrencyEdit;
    edAE_PLANTAS: TIntEdit;
    fraAE_TIPOOBRA: TfraStaticCTB_TABLAS;
    fraAE_ACTIVIDADOBRA: TfraStaticCTB_TABLAS;
    fraAE_ETAPAOBRA: TfraStaticCTB_TABLAS;
    chkAE_PROGRAMAAPROBADO: TCheckBox;
    fraAE_PROGRAMASEGURIDAD: TfraStaticCTB_TABLAS;
    edAE_FFINOBRA: TDateComboBox;
    edAE_FSUSPOBRA: TDateComboBox;
    edAE_FREINICIOOBRA: TDateComboBox;
    edAE_FECHAACCIDENTE: TDateComboBox;
    edAE_TAREASHABITUALES: TMemo;
    edAE_TAREASACCIDENTE: TMemo;
    edAE_DESCRIPCIONACCIDENTE: TMemo;
    edAE_HECHOSADICIONALES: TMemo;
    edAE_OTROSDATOS: TMemo;
    fraPreventor: TfraCodigoDescripcion;
    tsEntrevistas: TTabSheet;
    dbgPPE_PERSONAENTREVISTADA: TRxDBGrid;
    fpPPE_PERSONAENTREVISTADA: TFormPanel;
    Bevel4: TBevel;
    lbCUIL: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbTipoDocumento: TLabel;
    lbDocumento: TLabel;
    btPPEAceptar: TButton;
    btnPPECancelar: TButton;
    mskPE_CUIL: TMaskEdit;
    edPE_NOMBRE: TPatternEdit;
    edPE_CARGO: TPatternEdit;
    edPE_FECHA_ENTREVISTA: TDateComboBox;
    edPE_TIPO_ENTREVISTA: TExComboBox;
    fraPE_TIPODOCUMENTO: TfraStaticCTB_TABLAS;
    edPE_DOCUMENTO: TIntEdit;
    tsCausasMedidasSeguim: TTabSheet;
    pcCausasMedidasSeguim: TPageControl;
    tsCausas: TTabSheet;
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
    tsMedidasCorrectivas: TTabSheet;
    Splitter1: TSplitter;
    pcVisitasSeguimiento: TPageControl;
    tsSeguimientoVisitas: TTabSheet;
    CoolBar5: TCoolBar;
    tBarPSV_SEGUIMIENTOVISITA: TToolBar;
    tbPSVNuevo: TToolButton;
    tbPSVModificar: TToolButton;
    tbPSVEliminar: TToolButton;
    dbgPSV_SEGUIMIENTOVISITA: TRxDBGrid;
    fpPSV_SEGUIMIENTOVISITA: TFormPanel;
    Bevel12: TBevel;
    Label70: TLabel;
    Label71: TLabel;
    btPSVAceptar: TButton;
    btPSVCancelar: TButton;
    edSV_FECHA: TDateComboBox;
    edSV_TIPO: TExComboBox;
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
    btPMCAceptar: TButton;
    btPMCCancelar: TButton;
    edMC_MEDIDA: TIntEdit;
    edMC_DESCRIPCION: TMemo;
    Label72: TLabel;
    fpTrabajador: TFormPanel;
    Label19: TLabel;
    mskCUIL: TMaskEdit;
    ed_NOMBRETRABAJADOR: TEdit;
    Label1: TLabel;
    Bevel6: TBevel;
    btnAceptarDT: TButton;
    btnCancelarDT: TButton;
    fraEstablecimientoAcc: TfraEstablecimientoDomic;
    Label4: TLabel;
    Label5: TLabel;
    Bevel8: TBevel;
    dbgTrabajadores: TRxDBGrid;
    btnTop2: TSpeedButton;
    btnTop3: TSpeedButton;
    lbCPostalA: TLabel;
    Label6: TLabel;
    edCiuu: TEdit;
    edCPA: TEdit;
    CoolBar1: TCoolBar;
    tBarPPE_PERSONAENTREVISTADA: TToolBar;
    tbPPENuevo: TToolButton;
    tbPPEModificar: TToolButton;
    tbPPEEliminar: TToolButton;
    CoolBar6: TCoolBar;
    ToolBar1: TToolBar;
    tbAgregarTrab: TToolButton;
    tbModifTrab: TToolButton;
    tbBorrarTrab: TToolButton;
    fraDomicilioEmpresa: TfraDomicilio;
    memTrabajadores: TRxMemoryData;
    dsTrabajadores: TDataSource;
    sdqTrabajadores: TSDQuery;
    sdqVisitas: TSDQuery;
    dsVisitas: TDataSource;
    tsVisitas: TTabSheet;
    fpVisita: TFormPanel;
    Bevel9: TBevel;
    btnAceptarVisita: TButton;
    Button1: TButton;
    tbVisitaAsoc: TToolBar;
    ToolButton1: TToolButton;
    btnLimpiarVisita: TToolButton;
    pnlDatos: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    fraPreventorVisita: TfraCodigoDescripcion;
    edObservacion: TMemo;
    edFechaVisita: TDateEdit;
    panObservaciones: TPanel;
    Label18: TLabel;
    redObservaciones: TRichEdit;
    tbarVisitas: TToolBar;
    btnRefrescarVisitas: TToolButton;
    ToolButton2: TToolButton;
    btnNuevaVisita: TToolButton;
    btnModifVisita: TToolButton;
    btnDeleteVisita: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton7: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    dbgVisitas: TRxDBGrid;
    sdqMotivosAsociados: TSDQuery;
    SortDialog2: TSortDialog;
    sdqDomicEmpresa: TSDQuery;
    fraEmpresaBusq: TfraEmpresa;
    Label23: TLabel;
    Bevel14: TBevel;
    Label64: TLabel;
    edMC_FECHAEJECUCION: TDateComboBox;
    Label65: TLabel;
    edMC_FECHAVERIFICACION: TDateComboBox;
    Label28: TLabel;
    ArtDBGrid1: TArtDBGrid;
    qryCausas: TSDQuery;
    Label29: TLabel;
    fraEstablecimientoBusq: TfraEstablecimiento;
    fraEstabVisita: TfraEstablecimiento;
    Label20: TLabel;
    fraEstabSeguimiento: TfraEstablecimiento;
    edNota: TMaskEdit;
    fraEstabSV: TfraEstablecimiento;
    tbBuscar: TToolButton;
    ToolButton14: TToolButton;
    fraEstabVisitaFiltro: TfraEstablecimiento;
    ToolButton15: TToolButton;
    tsNoVisitados: TTabSheet;
    sdqNoVisitados: TSDQuery;
    dsNoVisitados: TDataSource;
    RxDBGrid1: TRxDBGrid;
    Label30: TLabel;
    ToolButton16: TToolButton;
    cbCausas: TRxCheckListBox;
    Causas: TLabel;
    btnAplicar: TButton;
    tbInferencia: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure rgAE_TIPOESTABLECIMIENTOClick(Sender: TObject);
    procedure btnTopClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
    procedure tbAgregarTrabClick(Sender: TObject);
    procedure tbModifTrabClick(Sender: TObject);
    procedure tbBorrarTrabClick(Sender: TObject);
    procedure btnAceptarDTClick(Sender: TObject);
    procedure dbgTrabajadoresGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbPPENuevoClick(Sender: TObject);
    procedure tbPPEModificarClick(Sender: TObject);
    procedure tbPPEEliminarClick(Sender: TObject);
    procedure dbgPPE_PERSONAENTREVISTADAGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure btPPEAceptarClick(Sender: TObject);
    procedure pcDatosChange(Sender: TObject);
    procedure sdqPPE_PERSONAENTREVISTADAAfterOpen(DataSet: TDataSet);
    procedure tbPMCNuevoClick(Sender: TObject);
    procedure tbPDCNuevoClick(Sender: TObject);
    procedure tbPDCModificarClick(Sender: TObject);
    procedure tbPDCEliminarClick(Sender: TObject);
    procedure btPDCAceptarClick(Sender: TObject);
    procedure tbPMCModificarClick(Sender: TObject);
    procedure tbPMCEliminarClick(Sender: TObject);
    procedure btPMCAceptarClick(Sender: TObject);
    procedure tbPSVNuevoClick(Sender: TObject);
    procedure tbPSVModificarClick(Sender: TObject);
    procedure tbPSVEliminarClick(Sender: TObject);
    procedure btPSVAceptarClick(Sender: TObject);
    procedure sdqPSV_SEGUIMIENTOVISITAAfterOpen(DataSet: TDataSet);
    procedure sdqPMC_MEDIDACORRECTIVAAfterScroll(DataSet: TDataSet);
    procedure pcCausasMedidasSeguimChange(Sender: TObject);
    procedure dbgPDC_DIAGNOSTICOCAUSAGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure dbgPMC_MEDIDACORRECTIVAGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure dbgPSV_SEGUIMIENTOVISITAGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure btnRefrescarVisitasClick(Sender: TObject);
    procedure btnNuevaVisitaClick(Sender: TObject);
    procedure btnModifVisitaClick(Sender: TObject);
    procedure btnDeleteVisitaClick(Sender: TObject);
    procedure CargarCausas (IDMedida: Integer);
    procedure btnLimpiarVisitaClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure btnAceptarVisitaClick(Sender: TObject);
    procedure sdqVisitasAfterScroll(DataSet: TDataSet);
    procedure tbNuevoClick(Sender: TObject);
    procedure fraEstablecimientoAcccmbDescripcionDropDown(Sender: TObject);
    procedure dbgVisitasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure fraPreventorcmbDescripcionDropDown(Sender: TObject);
    procedure fraPreventorVisitacmbDescripcionDropDown(Sender: TObject);
    procedure edNotaExit(Sender: TObject);
    procedure tbBuscarClick(Sender: TObject);
    procedure tbInferenciaClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btPSVCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FIDAcc: Integer;
    ModoABMTrabajador: TModoABM;
    ModoABMTablas: TModoABM;
    FModoVisita: TModoABM;
    FIdVisitaAsociada : Integer;
    procedure OnEmpresaChange(Sender: TObject);
    procedure OnEmpresaBusqChange(Sender: TObject);
    procedure OnfraEstablecimientoAccChange(Sender: TObject);
    procedure fraAE_PROGRAMAChange(Sender: TObject);
    procedure OnfraPE_TIPODOCUMENTOChange(Sender: TObject);
    procedure HabilitarCUILPersEntrevistada(HabilitarCUIL: Boolean);
    procedure GrabarDatosTrabajador;
    function SinTrabajadoresActivos: Boolean;
    function Is_AccidenteEstablId: Boolean;
    procedure SetID(ADataSet: TSDQuery; AId: TTableId);
    procedure Do_DarBajaSeguimientoVisita(IdMedidaCorrectiva: TTableId);
    procedure SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(AId: TTableId);
//    function HayChequeados (cbItems: TRxCheckListBox): Boolean;
    function GetVisitaCorrecta(aTipoVisita: String; aMedida: integer; aFecha: TDate; aIDVisita: integer): String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
    procedure DoDarDeBaja(ADataSet: TSDQuery; APrefijo: string; AAllowDelete: Boolean = True);
    function PkViolated(DataSet : TDataSet; FieldNames: array of string; FieldValues: array of Variant): boolean;
  public
    { Public declarations }
  end;

var
  frmABMPRAM: TfrmABMPRAM;

implementation

uses unPrincipal, unConsVisitasRealizadas;

{$R *.DFM}

const
  PAGE_DATOSGENERALES        = 0;
  PAGE_VISITAS               = 1;
  PAGE_PERSONASENTREVISTADAS = 2;
  PAGE_CAUSASMEDIDASSEGUIM   = 3;

  PAGE_CAUSAS                = 0;
  PAGE_MEDIDASCORRECTIVAS    = 1;

  PAGE_CAUSAMEDIDAS          = 0;
  PAGE_SEGUIMIENTOVISITAS    = 1;

procedure TfrmABMPRAM.OnEmpresaChange(Sender: TObject);
begin
  fraEstablecimientoAcc.CUIT := fraEmpresa.mskCUIT.Text;

  if fraEmpresa.Contrato > 0 then
  begin
    fraEstabVisita.Contrato := fraEmpresa.Contrato ;
    fraEstabVisita.ShowBajas := true;

    fraEstabVisitaFiltro.Contrato := fraEmpresa.Contrato ;
    fraEstabVisitaFiltro.ShowBajas := true;

    fraEstabSeguimiento.Contrato := fraEmpresa.Contrato;
    fraEstabSeguimiento.ShowBajas := true;

    fraEstabSV.Contrato := fraEmpresa.Contrato;
    fraEstabSV.ShowBajas := true;

    with sdqDomicEmpresa do
    begin
      ParamByName ('pcontrato').Value := fraEmpresa.Contrato;
      Open;

      fraDomicilioEmpresa.CodigoPostal := FieldByName('CPOSTAL').AsString;
      fraDomicilioEmpresa.Calle        := FieldByName('CALLE').AsString;
      fraDomicilioEmpresa.Localidad    := FieldByName('LOCALIDAD').AsString;
      fraDomicilioEmpresa.Provincia    := FieldByName('PROVINCIA').AsString;
      fraDomicilioEmpresa.Numero       := IIF(FieldByName('NUMERO').AsString <> '', FieldByName('NUMERO').AsString, 'S/N');
      fraDomicilioEmpresa.Piso         := FieldByName('PISO').AsString;
      fraDomicilioEmpresa.Departamento := FieldByName('DEPARTAMENTO').AsString;
      fraDomicilioEmpresa.CPA          := FieldByName('CPOSTALA').AsString;
    end;

    sdqDomicEmpresa.Close;

    fraAE_IDACTIVIDAD.Value:= ValorSql ('SELECT ac_id ' +
                                        '  FROM aco_contrato ' +
                                        '       INNER JOIN cac_actividad ON ac_id = co_idactividad ' +
                                        ' WHERE co_contrato =  ' + SqlValue(fraEmpresa.Contrato));

    if FIDAcc > 0 then
      btnRefrescarVisitasClick(Sender)
  end;
end;

procedure TfrmABMPRAM.OnfraEstablecimientoAccChange(Sender: TObject);
begin
  if fraEstablecimientoAcc.IsSelected then
  begin
    edCPA.Text := fraEstablecimientoAcc.CPostalA;
    edCiuu.Text := ValorSql('select substr(art.hys.get_codactividadrevdos(ac_id, ac_revision),1,1) ' +
                            '  from comunes.cac_actividad ' +
                            ' where ac_codigo = ' + SqlValue(fraEstablecimientoAcc.Actividad));
  end;
end;

procedure TfrmABMPRAM.fraEstablecimientoAcccmbDescripcionDropDown(
  Sender: TObject);
begin
  fraEstablecimientoAcc.cmbDescripcionDropDown(Sender);
end;

procedure TfrmABMPRAM.OnEmpresaBusqChange(Sender: TObject);
begin
  fraEstablecimientoBusq.Contrato := fraEmpresaBusq.Contrato ;
end;

{* Datos del siniestro *******************************************************}

procedure TfrmABMPRAM.fraAE_PROGRAMAChange(Sender: TObject);
begin
   fraAE_IDOPERATIVO.Locked := AreIn( fraAE_PROGRAMA.Codigo, ['B'] );
   if fraAE_IDOPERATIVO.Locked then fraAE_IDOPERATIVO.Clear;
end;

procedure TfrmABMPRAM.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.Close;

  // Aplicar Filtros
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(
    'SELECT ae_id, ae_notasp, ae_programa, ae_idoperativo, ae_dotacion, ae_cuit, ' +
    '       ae_programaempresa, ae_tipoestablecimiento, ae_nroestablecimiento, ' +
    '       ae_dotacionestablecimiento, ae_lugardeocurrencia, ae_frecepcionobra, ' +
    '       ae_finicioactividad, ae_superficie, ae_plantas, ae_tipoobra, ' +
    '       ae_actividadobra, ae_etapaobra, ae_programaaprobado, co_contrato ae_contrato,' +
    '       ae_programaseguridad, ae_ffinobra, ae_fsuspobra, ae_freinicioobra, ' +
    '       ae_observaciones, ae_fechaaccidente, ae_tareashabituales, ' +
    '       ae_tareasaccidente, ae_descripcionaccidente, ae_hechosadicionales, ' +
    '       ae_fechaalta, ae_usualta, ae_fechamodif, ae_usumodif, ae_fechabaja, ' +
    '       ae_usubaja, ae_otrosdatos, ae_idit, em_nombre empresa, es_nombre establecimiento ' +
    '  FROM hys.pae_pramaccidenteestab ' +
    '       INNER JOIN aco_contrato ON co_contrato = art.afiliacion.get_contratovigente (ae_cuit, SYSDATE) ' +
    '       INNER JOIN aem_empresa ON em_id = co_idempresa ' +
    '       INNER JOIN aes_establecimiento ON es_contrato = co_contrato ' +
    '                                         AND es_nroestableci = ae_nroestablecimiento ' +
    ' WHERE em_cuit = ae_cuit '
  );

  if fraEmpresaBusq.IsSelected then
    sdqConsulta.SQL.Add('   AND ae_cuit = ' + SqlValue(fraEmpresaBusq.mskCUIT.Text));

  if fraEstablecimientoBusq.IsSelected then
    sdqConsulta.SQL.Add('   AND ae_nroestablecimiento = ' + SqlValue(fraEstablecimientoBusq.Codigo));

  sdqConsulta.Open
end;

procedure TfrmABMPRAM.sdqPSV_SEGUIMIENTOVISITAAfterOpen(DataSet: TDataSet);
begin
  DataSet.Fields[0].Required := False;
  DataSet.Fields[1].Required := False;
end;

procedure TfrmABMPRAM.sdqPMC_MEDIDACORRECTIVAAfterScroll(
  DataSet: TDataSet);
begin
  SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger);
  OpenQuery( sdqPCM_CAUSAYMEDIDA );
  tbBuscarClick(nil);
end;

procedure TfrmABMPRAM.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ae_fechabaja';
  Sql.TableName := 'hys.pae_pramaccidenteestab';

  fraEmpresaBusq.OnChange  := OnEmpresaBusqChange;
  fraEmpresaBusq.ShowBajas := True;
  fraEmpresaBusq.ExtraCondition := '     AND co_contrato = '+
                                   ' (SELECT MAX (b.co_contrato) '+
                                   '    FROM aco_contrato b '+
                                   '   WHERE b.co_idempresa = em_id '+
                                   '     AND NOT EXISTS (SELECT 1 '+
                                   '    FROM art.abc_bajadecontrato '+
                                   '   WHERE b.co_contrato = bc_contrato)) ';

  //' and art.afiliacion.Get_ContratoVigente(' + fraEmpresaBusq.FieldCUIT + ', SYSDATE) = ' + fraEmpresaBusq.FieldContrato ;

  fraEmpresa.OnChange  := OnEmpresaChange;
  fraEmpresa.ShowBajas := true;
  fraEmpresa.ExtraCondition := '     AND co_contrato = '+
                               ' (SELECT MAX (b.co_contrato) '+
                               '    FROM aco_contrato b '+
                               '   WHERE b.co_idempresa = em_id '+
                               '     AND NOT EXISTS (SELECT 1 '+
                               '    FROM art.abc_bajadecontrato '+
                               '   WHERE b.co_contrato = bc_contrato)) ';

  fraAE_LUGARDEOCURRENCIA.Clave   := 'LUOCU';
  fraAE_PROGRAMA.Clave            := 'PRSEG';
  fraAE_PROGRAMA.OnChange         := fraAE_PROGRAMAChange;
  fraAE_TIPOOBRA.Clave            := 'TOBRA';
  fraAE_ACTIVIDADOBRA.Clave       := 'AOBRA';
  fraAE_ETAPAOBRA.Clave           := 'EOBRA';
  fraAE_PROGRAMASEGURIDAD.Clave   := 'PSEGU';

  with fraAE_IDOPERATIVO do
  begin
    TableName   := 'POP_OPERATIVO';
    FieldID     := 'OP_ID';
    FieldCodigo := 'OP_CODIGO';
    FieldDesc   := 'OP_DESCRIPCION';
    ShowBajas   := False;
  end;

  with fraAE_IDACTIVIDAD do
    begin
      TableName   := 'CAC_ACTIVIDAD';
      FieldID     := 'AC_ID';
      FieldCodigo := 'AC_CODIGO';
      FieldDesc   := 'AC_DESCRIPCION';
    end;

  fraEstablecimientoBusq.ShowBajas := true;
  fraEstablecimientoAcc.ShowBajas := false;

  with fraPE_TIPODOCUMENTO do
    begin
      Clave    := 'TDOCN';
      OnChange := OnfraPE_TIPODOCUMENTOChange;
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
    ExtraCondition := ' AND NOT (UPPER(it_nombre) LIKE ''%ALTA%'')';
  end;

  with fraPreventorVisita do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ExtraCondition := ' AND NOT (UPPER(it_nombre) LIKE ''%ALTA%'')';
  end;

  fraEstablecimientoAcc.OnChange := OnfraEstablecimientoAccChange;
  tbLimpiarClick(Sender);
end;

procedure TfrmABMPRAM.OnfraPE_TIPODOCUMENTOChange(Sender: TObject);
begin
  HabilitarCUILPersEntrevistada( fraPE_TIPODOCUMENTO.IsEmpty );
end;

procedure TfrmABMPRAM.HabilitarCUILPersEntrevistada(HabilitarCUIL: Boolean);
begin
  VCLExtra.LockControl( edPE_DOCUMENTO, HabilitarCUIL );
  VCLExtra.LockControl( mskPE_CUIL, not HabilitarCUIL );

  if HabilitarCUIL then
    edPE_DOCUMENTO.Clear
  else
    mskPE_CUIL.Clear;
end;

procedure TfrmABMPRAM.ClearControls;
begin
  edNota.Clear;
  fraAE_PROGRAMA.Clear;
  fraAE_IDOPERATIVO.Clear;
  edAE_DOTACION.Clear;
  fraEmpresa.Clear;
  fraDomicilioEmpresa.Clear;
  edAE_TELEFONOS.Clear;
  rgAE_TIPOESTABLECIMIENTO.ItemIndex := -1;
  fraEstablecimientoAcc.Clear;
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
  edAE_TAREASHABITUALES.Clear;
  edAE_TAREASACCIDENTE.Clear;
  edAE_DESCRIPCIONACCIDENTE.Clear;
  edAE_HECHOSADICIONALES.Clear;
  edAE_OTROSDATOS.Clear;
  edAE_FECHAACCIDENTE.Clear;
  fraPreventor.Clear;
  fraAE_IDACTIVIDAD.Clear;

  SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(FIDAcc);
  SetID(sdqPPE_PERSONAENTREVISTADA, FIDAcc);
  SetID(sdqPDC_DIAGNOSTICOCAUSA, FIDAcc);
  SetID(sdqPMC_MEDIDACORRECTIVA, FIDAcc);
  sdqVisitas.Close;
end;

procedure TfrmABMPRAM.SetIDMEDIDACORRECTIVA_CAUSAS_VISITAS(AId: TTableId);
begin
  SetID(sdqPCM_CAUSAYMEDIDA, AId);
  SetID(sdqPSV_SEGUIMIENTOVISITA, AId);
end;

function TfrmABMPRAM.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja Then
  begin
    FIDAcc := FIDAcc;

    Sql.PrimaryKey.Add('ae_id', FIDAcc);
    Sql.Fields.Add('ae_usubaja', frmPrincipal.DBLogin.UserID);
    Sql.Fields.Add('ae_fechabaja', exDateTime);
    Sql.SqlType := stUpdate;
  end else
  begin
    if ModoABM = maAlta Then
    begin
      FIDAcc := GetSecNextVal('HYS.seq_hae_pram_id');

      Sql.PrimaryKey.Add('ae_id', FIDAcc);
      Sql.Fields.Add('ae_usualta', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('ae_fechaalta', exDateTime);
    end
    else
    begin
      FIDAcc := FIDAcc;

      Sql.PrimaryKey.Add('ae_id', FIDAcc);
      Sql.Fields.Add('ae_usumodif', frmPrincipal.DBLogin.UserID);
      Sql.Fields.Add('ae_fechamodif', exDateTime);
      Sql.Fields.Add('ae_usubaja', exNull);
      Sql.Fields.Add('ae_fechabaja', exNull);
    end;

    Sql.Fields.Add('ae_notasp', Trim(ReplaceStr(edNota.Text, ' ', '')));
    Sql.Fields.Add('ae_programa', fraAE_PROGRAMA.Codigo);
    if fraAE_IDOPERATIVO.IsSelected then
      Sql.Fields.Add('ae_idoperativo', fraAE_IDOPERATIVO.Value)
    else
      Sql.Fields.Add('ae_idoperativo', exNull);
    Sql.Fields.Add('ae_dotacion', edAE_DOTACION.Value);
    Sql.Fields.Add('ae_cuit', fraEmpresa.mskCUIT.Text);
    Sql.Fields.Add('ae_programaempresa', fraAE_PROGRAMA.Codigo);
    Sql.Fields.Add('ae_tipoestablecimiento', Decode(IntToStr(rgAE_TIPOESTABLECIMIENTO.ItemIndex), ['0', '1'], ['E', 'O']));
    Sql.Fields.Add('ae_nroestablecimiento', fraEstablecimientoAcc.Value);
    Sql.Fields.Add('ae_dotacionestablecimiento', edAE_DOTACIONESTABLECIMIENTO.Value);
    Sql.Fields.Add('ae_lugardeocurrencia', fraAE_LUGARDEOCURRENCIA.Codigo);
    Sql.Fields.Add('ae_frecepcionobra', edAE_FRECEPCIONOBRA.Date);
    Sql.Fields.Add('ae_finicioactividad', edAE_FINICIOACTIVIDAD.Date);
    Sql.Fields.Add('ae_superficie', edAE_SUPERFICIE.Value);
    Sql.Fields.Add('ae_plantas', edAE_PLANTAS.Value);
    Sql.Fields.Add('ae_tipoobra', fraAE_TIPOOBRA.Codigo);
    Sql.Fields.Add('ae_actividadobra', fraAE_ACTIVIDADOBRA.Codigo);
    Sql.Fields.Add('ae_etapaobra', fraAE_ETAPAOBRA.Codigo);
    Sql.Fields.Add('ae_programaaprobado', SqlBoolean(chkAE_PROGRAMAAPROBADO.Checked, False));
    Sql.Fields.Add('ae_programaseguridad', fraAE_PROGRAMASEGURIDAD.Codigo);
    Sql.Fields.Add('ae_ffinobra', edAE_FFINOBRA.Date);
    Sql.Fields.Add('ae_fsuspobra', edAE_FSUSPOBRA.Date);
    Sql.Fields.Add('ae_freinicioobra', edAE_FREINICIOOBRA.Date);
    Sql.Fields.Add('ae_observaciones', edAE_OBSERVACIONES.Text);
    Sql.Fields.Add('ae_fechaaccidente', edAE_FECHAACCIDENTE.Date);
    Sql.Fields.Add('ae_tareashabituales', edAE_TAREASHABITUALES.Text);
    Sql.Fields.Add('ae_tareasaccidente', edAE_TAREASACCIDENTE.Text);
    Sql.Fields.Add('ae_descripcionaccidente', edAE_DESCRIPCIONACCIDENTE.Text);
    Sql.Fields.Add('ae_hechosadicionales', edAE_HECHOSADICIONALES.Text);
    Sql.Fields.Add('ae_otrosdatos', edAE_OTROSDATOS.Text);
    Sql.Fields.Add('ae_idit', fraPreventor.Value);
  end;

  Result := inherited DoABM;

  if Result then
  begin
    BeginTrans;

    try
      with memTrabajadores do
      begin
        DisableControls;
        First;
        while not EoF do
        begin
          if FieldByName('BAJA').AsString = 'S' then
            EjecutarSqlST('DELETE FROM hys.ppt_pramtrabajador ' +
                          '      WHERE pt_idpramaccidenteestab = ' + SqlValue (FIDAcc) +
                          '        AND pt_cuil = ' + SqlValue (FieldByName('CUIL').AsString))
          else
            if ExisteSQL ('SELECT 1 FROM hys.ppt_pramtrabajador ' +
                          ' WHERE pt_idpramaccidenteestab = ' + SqlValue (FIDAcc) +
                          '   AND pt_cuil = ' + SqlValue (FieldByName('CUIL').AsString)) then
              EjecutarSqlST('UPDATE hys.ppt_pramtrabajador ' +
                            '   SET pt_nombre = ' + SqlValue(FieldByName('NOMBRE').AsString) +
                            ' WHERE pt_idpramaccidenteestab = ' + SqlValue (FIDAcc) +
                            '   AND pt_cuil = ' + SqlValue (FieldByName('CUIL').AsString))
            else
              EjecutarSqlST('INSERT INTO hys.ppt_pramtrabajador ' +
                            '     VALUES (' + SqlValue(FIDAcc) + ', ' +
                                              SqlValue(FieldByName('CUIL').AsString) + ', ' +
                                              SqlValue(FieldByName('NOMBRE').AsString) + ')');
          Next
        end;
        EnableControls;
      end;

      CommitTrans;
      Result := True;
    except
      on E: Exception do
      begin
        Rollback;

        Result := False;
        ErrorMsg(E);
      end;
    end
  end;
end;

procedure TfrmABMPRAM.LoadControls;
begin
  with sdqConsulta do
  begin
    FIDAcc                                := FieldByName('AE_ID').AsInteger;
    edNota.Text                           := FieldByName('AE_NOTASP').AsString;
    fraAE_PROGRAMA.Codigo                 := FieldByName('AE_PROGRAMA').AsString;
    fraAE_IDOPERATIVO.Value               := FieldByName('AE_IDOPERATIVO').AsInteger;
    edAE_DOTACION.Value                   := FieldByName('AE_DOTACION').AsInteger;
    fraEmpresa.Contrato                   := FieldByName('AE_CONTRATO').AsInteger;
    rgAE_TIPOESTABLECIMIENTO.ItemIndex    := StrToInt(Decode(FieldByName('AE_TIPOESTABLECIMIENTO').AsString, ['E', 'O', ''], ['0', '1', '0']));
    fraEstablecimientoAcc.Cargar(FieldByName('AE_CUIT').AsString, FieldByName('AE_NROESTABLECIMIENTO').AsInteger);
    edAE_DOTACIONESTABLECIMIENTO.Value    := FieldByName('AE_DOTACIONESTABLECIMIENTO').AsInteger;
    fraAE_LUGARDEOCURRENCIA.Codigo        := FieldByName('AE_LUGARDEOCURRENCIA').AsString;
    edAE_FRECEPCIONOBRA.Date              := FieldByName('AE_FRECEPCIONOBRA').AsDateTime;
    edAE_FINICIOACTIVIDAD.Date            := FieldByName('AE_FINICIOACTIVIDAD').AsDateTime;
    edAE_SUPERFICIE.Text                  := Get_StringNullValueNumber(FieldByName('AE_SUPERFICIE').AsFloat);
    edAE_PLANTAS.Text                     := Get_StringNullValueNumber(FieldByName('AE_PLANTAS').AsInteger);
    fraAE_TIPOOBRA.Codigo                 := FieldByName('AE_TIPOOBRA').AsString;
    fraAE_ACTIVIDADOBRA.Codigo            := FieldByName('AE_ACTIVIDADOBRA').AsString;
    fraAE_ETAPAOBRA.Codigo                := FieldByName('AE_ETAPAOBRA').AsString;
    chkAE_PROGRAMAAPROBADO.Checked        := (FieldByName('AE_PROGRAMAAPROBADO').AsString = SQL_TRUE);
    fraAE_PROGRAMASEGURIDAD.Codigo        := FieldByName('AE_PROGRAMASEGURIDAD').AsString;
    edAE_FFINOBRA.Date                    := FieldByName('AE_FFINOBRA').AsDateTime;
    edAE_FSUSPOBRA.Date                   := FieldByName('AE_FSUSPOBRA').AsDateTime;
    edAE_FREINICIOOBRA.Date               := FieldByName('AE_FREINICIOOBRA').AsDateTime;
    edAE_OBSERVACIONES.Text               := FieldByName('AE_OBSERVACIONES').AsString;
    edAE_TAREASHABITUALES.Text            := FieldByName('AE_TAREASHABITUALES').AsString;
    edAE_TAREASACCIDENTE.Text             := FieldByName('AE_TAREASACCIDENTE').AsString;
    edAE_DESCRIPCIONACCIDENTE.Text        := FieldByName('AE_DESCRIPCIONACCIDENTE').AsString;
    edAE_HECHOSADICIONALES.Text           := FieldByName('AE_HECHOSADICIONALES').AsString;
    edAE_OTROSDATOS.Text                  := FieldByName('AE_OTROSDATOS').AsString;
    edAE_FECHAACCIDENTE.Date              := FieldByName('AE_FECHAACCIDENTE').AsDateTime;
    fraPreventor.Value                    := FieldByName('AE_IDIT').AsInteger
  end;

  OnEmpresaChange(nil);

  // Leer los trabajadores
  memTrabajadores.EmptyTable;
  memTrabajadores.Open;

  with sdqTrabajadores do
  begin
    ParamByName('ID').Value := FIDAcc;
    Open;

    while not EoF do
    begin
      memTrabajadores.AppendRecord([FieldByName('CUIL').AsString,
                                    FieldByName('NOMBRE').AsString,
                                    'N']);
      Next
    end
  end;
  sdqTrabajadores.Close;

  btnAplicar.Enabled := false;
  case pcDatos.ActivePageIndex of
    PAGE_PERSONASENTREVISTADAS: sdqPPE_PERSONAENTREVISTADA.Active := True;
    PAGE_CAUSASMEDIDASSEGUIM: pcCausasMedidasSeguimChange( Nil );
  end
end;

procedure TfrmABMPRAM.pcCausasMedidasSeguimChange(Sender: TObject);
begin
  case pcCausasMedidasSeguim.ActivePageIndex of
    PAGE_CAUSAS: sdqPDC_DIAGNOSTICOCAUSA.Active := True;
    PAGE_MEDIDASCORRECTIVAS:
    begin
      sdqPMC_MEDIDACORRECTIVA.Active := True;
    end;
  end;
end;

function TfrmABMPRAM.SinTrabajadoresActivos: Boolean;
var
  Bajas: integer;
begin
  Bajas := 0;

  with memTrabajadores do
  begin
    DisableControls;
    First;
    While not EoF do
    begin
      if FieldByName('BAJA').AsString = 'S' then
        Inc (Bajas);

      Next
    end;
    EnableControls;

    Result := RecordCount = Bajas
  end
end;

function TfrmABMPRAM.Validar: Boolean;
var
  dHoy: TDateTime;
  sSql: String;
begin
  Result := False;
  dHoy := DBDate;

  sSql := 'SELECT 1 ' +
          '  FROM hys.pae_pramaccidenteestab ' +
          ' WHERE ae_notasp = ' + SqlValue(edNota.Text);

  if IsEmptyString(ReplaceStr (ReplaceStr(edNota.Text, '/', ''), ' ', '')) then
  begin
    pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
    InvalidMsg(edNota, 'Debe ingresar el nro. de Nota S.P.')
  end

  else if (ModoABM = maAlta) and ExisteSql(sSql) Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(edNota, 'El nro. de Nota S.P. ya existe.')
    end

  else if not fraEmpresa.IsSelected Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraEmpresa, 'Debe seleccionarse la Empresa Asociada.')
    end

  else if fraAE_PROGRAMA.IsEmpty Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraAE_PROGRAMA.edCodigo, 'El programa es obligatorio.')
    end

  else if AreIn( fraAE_PROGRAMA.Codigo, ['A', 'T', 'P'] ) and fraAE_IDOPERATIVO.IsEmpty Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraAE_IDOPERATIVO.edCodigo, 'El operativo es obligatorio cuando la empresa es Agro o Testigo o PYME.')
    end

  else if fraAE_IDACTIVIDAD.IsEmpty then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraAE_IDACTIVIDAD, 'El CIIU es obligatorio.')
    end

  else if edAE_DOTACION.Value <= 0 then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(edAE_DOTACION, 'La dotación debe ser mayor a 0 empleados.')
    end

  else if fraAE_IDACTIVIDAD.IsEmpty Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraAE_IDACTIVIDAD.edCodigo, 'La actividad es obligatoria.')
    end

  else if not fraEstablecimientoAcc.IsSelected Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraEstablecimientoAcc.edCodigo, 'Debe seleccionarse un Establecimiento.')
    end

  else if fraAE_PROGRAMA.IsEmpty Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraAE_PROGRAMA.cmbDescripcion, 'El programa de la empresa en un dato obligatorio.')
   end
  else if not fraAE_PROGRAMA.IsEmpty and AreIn( fraAE_PROGRAMA.Codigo, ['A', 'T', 'P'] ) and fraAE_IDOPERATIVO.IsEmpty Then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraAE_IDOPERATIVO.edCodigo, 'El operativo es obligatorio cuando la empresa es Agro o Testigo o PYME.')
    end

  else if edAE_DOTACIONESTABLECIMIENTO.Value <= 0 then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(edAE_DOTACIONESTABLECIMIENTO, 'La dotación debe ser mayor a 0 empleados.')
    end

  else if memTrabajadores.IsEmpty or SinTrabajadoresActivos then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(dbgTrabajadores, 'Debe haber al menos un trabajador accidentado y no dado de baja.')
    end

  else if rgAE_TIPOESTABLECIMIENTO.ItemIndex = -1 then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(rgAE_TIPOESTABLECIMIENTO, 'El tipo de establecimiento es obligatorio.')
    end

  else if fraAE_LUGARDEOCURRENCIA.IsEmpty Then
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

  else if (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 1) and (fraAE_PROGRAMA.Value <> 'O') and (fraAE_PROGRAMA.Value <> 'T')
       and (fraAE_PROGRAMA.Value <> 'P') then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraAE_PROGRAMA, 'Si es una obra, el programa debe ser construcción.')
    end

  else if (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 1) and not Is_FechaValida(edAE_FFINOBRA.Text) then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(edAE_FFINOBRA, 'Si es una obra, la fecha de finalización de la misma es obligatoria.')
    end

  else if edAE_FECHAACCIDENTE.IsEmpty then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(edAE_FECHAACCIDENTE, 'La fecha del accidente es obligatoria.')
    end

  else if edAE_FECHAACCIDENTE.Date > dHoy then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(edAE_FECHAACCIDENTE, 'La fecha del accidente tiene que ser menor o igual a hoy.')
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

  else if not fraPreventor.IsSelected then
    begin
      pcDatos.ActivePageIndex := PAGE_DATOSGENERALES;
      InvalidMsg(fraPreventor, 'El preventor es obligatorio.')
    end

  else if (ValorSQL(' SELECT COUNT(*) FROM hys.pdc_pramdiagnosticocausa ' +
                   ' WHERE NOT EXISTS (SELECT 1 FROM hys.pcm_pramcausaymedida WHERE DC_ID = CM_IDDIAGNOSTICOCAUSA) ' +
                   ' AND DC_FECHABAJA IS NULL AND DC_IDACCIDENTEESTABLECIMIENTO = ' + SqlValue(FIDAcc), '0') <> '0') then
        begin
            pcDatos.ActivePageIndex := PAGE_CAUSASMEDIDASSEGUIM;
            pcCausasMedidasSeguim.ActivePageIndex := PAGE_CAUSAS;
            InvalidMsg(dbgPDC_DIAGNOSTICOCAUSA, 'Existen causas sin medidas correctivas asociadas.');
        end
  else if (ValorSQL(' SELECT COUNT(*) FROM hys.pmc_prammedidacorrectiva ' +
                   ' WHERE NOT EXISTS (SELECT 1 FROM hys.pcm_pramcausaymedida WHERE MC_ID = CM_IDMEDIDACORRECTIVA) ' +
                   ' AND MC_FECHABAJA IS NULL AND MC_IDACCIDENTEESTABLECIMIENTO = ' + SqlValue(FIDAcc), '0') <> '0') then
        begin
            pcDatos.ActivePageIndex := PAGE_CAUSASMEDIDASSEGUIM;
            pcCausasMedidasSeguim.ActivePageIndex := PAGE_MEDIDASCORRECTIVAS;
            InvalidMsg(dbgPDC_DIAGNOSTICOCAUSA, 'Existen medidas correctivas sin causas asociadas.');
        end
  else Result := True;
end;

procedure TfrmABMPRAM.tbLimpiarClick(Sender: TObject);
begin
  fraEstablecimientoBusq.Clear;
  fraEmpresaBusq.Clear;

  inherited;
end;

procedure TfrmABMPRAM.rgAE_TIPOESTABLECIMIENTOClick(Sender: TObject);
var
  bDeshabilitarDatosObra: Boolean;
begin
  bDeshabilitarDatosObra := (rgAE_TIPOESTABLECIMIENTO.ItemIndex = 0);   // establecimiento
  VCLExtra.LockControls( [fraAE_ETAPAOBRA.edCodigo, fraAE_ETAPAOBRA.cmbDescripcion,
                          fraAE_PROGRAMASEGURIDAD.edCodigo, fraAE_PROGRAMASEGURIDAD.cmbDescripcion,
                          edAE_FRECEPCIONOBRA, edAE_FINICIOACTIVIDAD, edAE_SUPERFICIE,
                          edAE_PLANTAS, fraAE_TIPOOBRA.edCodigo, fraAE_TIPOOBRA.cmbDescripcion,
                          fraAE_ACTIVIDADOBRA.edCodigo, fraAE_ACTIVIDADOBRA.cmbDescripcion,
                          chkAE_PROGRAMAAPROBADO, edAE_FFINOBRA, edAE_FSUSPOBRA, edAE_FREINICIOOBRA],
                          bDeshabilitarDatosObra );
end;

procedure TfrmABMPRAM.btnTopClick(Sender: TObject);
begin
  edNota.SetFocus;
end;

procedure TfrmABMPRAM.fpAbmShow(Sender: TObject);
begin
  inherited;

  pcDatos.ActivePageIndex := 0;
  pcCausasMedidasSeguim.ActivePageIndex := 0;
  pcVisitasSeguimiento.ActivePageIndex := 0;

  btnTopClick(Sender);

  if ModoABM <> maAlta Then
  begin
    SetID(sdqPPE_PERSONAENTREVISTADA, FIDAcc);
    SetID(sdqPDC_DIAGNOSTICOCAUSA, FIDAcc);
    SetID(sdqPMC_MEDIDACORRECTIVA, FIDAcc);
  end;

  OnfraPE_TIPODOCUMENTOChange( nil );
end;

procedure TfrmABMPRAM.tbAgregarTrabClick(Sender: TObject);
begin
  ModoABMTrabajador := maAlta;

  mskCUIL.Clear;
  mskCUIL.Enabled := true;
  ed_NOMBRETRABAJADOR.Clear;

  fpTrabajador.ShowModal
end;

procedure TfrmABMPRAM.tbModifTrabClick(Sender: TObject);
begin
  if memTrabajadores.IsEmpty then
    Exit;

  ModoABMTrabajador := maModificacion;

  mskCUIL.Text := memTrabajadores.FieldByName('CUIL').AsString;
  mskCUIL.Enabled := false;
  ed_NOMBRETRABAJADOR.Text := memTrabajadores.FieldByName('NOMBRE').AsString;

  fpTrabajador.ShowModal
end;

procedure TfrmABMPRAM.tbBorrarTrabClick(Sender: TObject);
begin
  if memTrabajadores.IsEmpty then
    Exit;

  ModoABMTrabajador := maBaja;

  GrabarDatosTrabajador
end;

procedure TfrmABMPRAM.btnAceptarDTClick(Sender: TObject);
begin
  VerificarMultiple (['Trabajador accidentado',
                      mskCUIL,
                      IsCuit(mskCUIL.Text),
                      'El CUIL ingresado no es válido.',
                      ed_NOMBRETRABAJADOR,
                      not IsEmptyString(ed_NOMBRETRABAJADOR.Text),
                      'Debe ingresar el nombre del trabajador.'
                     ]);
  GrabarDatosTrabajador;

  fpTrabajador.ModalResult := mrOk;
end;

procedure TfrmABMPRAM.GrabarDatosTrabajador;
begin
  if ModoABMTrabajador = maBaja Then
  begin
    memTrabajadores.Edit;
    memTrabajadores.FieldByName ('BAJA').AsString := 'S';
    memTrabajadores.Post;
  end else
  begin
    if ModoABMTrabajador = maAlta Then
    begin
      memTrabajadores.AppendRecord([mskCUIL.Text, ed_NOMBRETRABAJADOR.Text, 'N'])
    end
    else begin
      memTrabajadores.Edit;
      memTrabajadores.FieldByName ('NOMBRE').AsString := ed_NOMBRETRABAJADOR.Text;
      memTrabajadores.FieldByName ('BAJA').AsString := 'N';
      memTrabajadores.Post;
    end;
  end
end;

procedure TfrmABMPRAM.dbgTrabajadoresGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if memTrabajadores.FieldByName('BAJA').AsString = 'S' Then
    AFont.Color := clRed;
end;

procedure TfrmABMPRAM.pcDatosChange(Sender: TObject);
begin
  case pcDatos.ActivePageIndex of
    PAGE_PERSONASENTREVISTADAS: sdqPPE_PERSONAENTREVISTADA.Active := True;
    PAGE_CAUSASMEDIDASSEGUIM: pcCausasMedidasSeguimChange( Nil );
  end;
end;

{* Personas entrevistadas/testigos *******************************************}

procedure TfrmABMPRAM.tbPPENuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Alta de Personas Entrevistadas',
                      fraEmpresa,
                      fraEmpresa.IsSelected,
                      'Debe ingresar la Empresa Asociada.',
                      btnAplicar,
                      Is_AccidenteEstablId,
                      'Para poder continuar, debe confirmar los datos cargados previamente, haciendo click en Aplicar.'
                     ]);

  fraPE_TIPODOCUMENTO.Clear;
  OnfraPE_TIPODOCUMENTOChange( nil );

  mskPE_CUIL.Clear;
  edPE_DOCUMENTO.Clear;
  edPE_NOMBRE.Clear;
  edPE_CARGO.Clear;
  edPE_FECHA_ENTREVISTA.Clear;
  edPE_TIPO_ENTREVISTA.ItemIndex := -1;

  ModoABMTablas := maAlta;

  VCLExtra.LockControls([fraPE_TIPODOCUMENTO, edPE_DOCUMENTO, mskPE_CUIL], False);

  fpPPE_PERSONAENTREVISTADA.ShowModal;
end;

procedure TfrmABMPRAM.tbPPEModificarClick(Sender: TObject);
begin
  if sdqPPE_PERSONAENTREVISTADA.IsEmpty or (not sdqPPE_PERSONAENTREVISTADA.FieldByName('PE_FECHABAJA').IsNull) then
    Exit;

  with sdqPPE_PERSONAENTREVISTADA do
  begin
    fraPE_TIPODOCUMENTO.Codigo := FieldByName('PE_TIPODOCUMENTO').AsString;
    OnfraPE_TIPODOCUMENTOChange( nil );

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

procedure TfrmABMPRAM.tbPPEEliminarClick(Sender: TObject);
begin
  if sdqPPE_PERSONAENTREVISTADA.IsEmpty or (not sdqPPE_PERSONAENTREVISTADA.FieldByName('PE_FECHABAJA').IsNull) then
    Exit;

  DoDarDeBaja(sdqPPE_PERSONAENTREVISTADA, 'PE');
end;

procedure TfrmABMPRAM.DoDarDeBaja(ADataSet: TSDQuery; APrefijo: string; AAllowDelete: Boolean);
begin
  if (not ADataSet.IsEmpty) and ADataSet.FieldByName(APrefijo + '_FECHABAJA').IsNull and
     MsgAsk('¿Desea dar de baja el registro seleccionado?') Then
  begin
    if AAllowDelete and ADataSet.FieldByName(APrefijo + '_FECHAEXPORT').IsNull Then
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

procedure TfrmABMPRAM.dbgPPE_PERSONAENTREVISTADAGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not sdqPPE_PERSONAENTREVISTADA.FieldByName('PE_FECHABAJA').IsNull then
    AFont.Color:= clRed;
end;

procedure TfrmABMPRAM.btPPEAceptarClick(Sender: TObject);
begin
  if fraPE_TIPODOCUMENTO.IsEmpty and (not edPE_DOCUMENTO.ReadOnly) and IsEmptyString(mskPE_CUIL.Text) then  // solo por problemas con el fraSTATIC_CTBTABLAS, que no dispara el OnChange si se limpia pasando con Tab y no con Enter
    InvalidMsg(fraPE_TIPODOCUMENTO.edCodigo, 'Si el Tipo de Documento está vacío, debe ingresar un CUIL.')

  else if not mskPE_CUIL.ReadOnly and IsEmptyString(mskPE_CUIL.Text) Then
    InvalidMsg(mskPE_CUIL, 'Debe ingresar el CUIL del entrevistado.')

  else if not mskPE_CUIL.ReadOnly and (not IsCuil(mskPE_CUIL.Text)) Then
    InvalidMsg(mskPE_CUIL, 'El CUIL ingresado no es válido.')

  else if not edPE_DOCUMENTO.ReadOnly and edPE_DOCUMENTO.IsEmpty Then
    InvalidMsg(edPE_DOCUMENTO, 'Debe ingresar el Documento del entrevistado.')

  else if not edPE_DOCUMENTO.ReadOnly and (edPE_DOCUMENTO.Value <= 0) Then
    InvalidMsg(edPE_DOCUMENTO, 'El Documento ingresado no es válido.')

  else if IsEmptyString(edPE_NOMBRE.Text) Then
    InvalidMsg(edPE_NOMBRE, 'Debe ingresar el Nombre del Entrevistado.')

  else if IsEmptyString(edPE_CARGO.Text) Then
    InvalidMsg(edPE_CARGO, 'Debe ingresar el Cargo en la Empresa del Entrevistado.')

  else if not mskPE_CUIL.ReadOnly and PkViolated(sdqPPE_PERSONAENTREVISTADA, ['PE_CUIL'], [mskPE_CUIL.Text]) Then
    InvalidMsg(mskPE_CUIL, 'Ya se ha cargado un entrevistado con el mismo CUIL.')

  else if PkViolated(sdqPPE_PERSONAENTREVISTADA, ['PE_NOMBRE'], [edPE_NOMBRE.Text]) Then
    InvalidMsg(edPE_NOMBRE, 'Ya se ha cargado un entrevistado con el mismo Nombre.')

  else if edPE_FECHA_ENTREVISTA.Date = 0 Then
    InvalidMsg(edPE_FECHA_ENTREVISTA, 'Debe ingresar la fecha de la entrevista.')

  else if edPE_FECHA_ENTREVISTA.Date < edAE_FECHAACCIDENTE.Date Then
    InvalidMsg(edPE_FECHA_ENTREVISTA, 'La fecha de la entrevista no puede ser anterior a la del accidente.')

  else if edPE_TIPO_ENTREVISTA.ItemIndex = -1 Then
    InvalidMsg(edPE_TIPO_ENTREVISTA, 'Debe seleccionar un tipo de entrevista.')

  else
    with sdqPPE_PERSONAENTREVISTADA do
      begin
        try
          if ModoABMTablas = maAlta Then
            begin
              Insert;

              FieldByName('PE_ID').AsInteger                         := GetSecNextVal('HYS.SEQ_PPE_PRAM_ID');
              FieldByName('PE_IDACCIDENTEESTABLECIMIENTO').AsInteger := FIDAcc;
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

          SetID(sdqPPE_PERSONAENTREVISTADA, FIDAcc);
          sdqPPE_PERSONAENTREVISTADA.Open;

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

function TfrmABMPRAM.Is_AccidenteEstablId: Boolean;
begin
  Result := FIDAcc <> 0;
end;

function TfrmABMPRAM.PkViolated(DataSet: TDataSet; FieldNames: array of string; FieldValues: array of Variant): boolean;
begin
  Result := (ModoABMTablas = maAlta) and (CountRecords(DataSet, FieldNames, FieldValues, 1) > 0);
end;

procedure TfrmABMPRAM.SetID(ADataSet: TSDQuery; AId: TTableId);
begin
  ADataSet.Close;
  ADataSet.Params[0].AsInteger := AId;
end;

procedure TfrmABMPRAM.sdqPPE_PERSONAENTREVISTADAAfterOpen(
  DataSet: TDataSet);
begin
end;

{* Causas/Medidas/Seguimientos ***********************************************}

procedure TfrmABMPRAM.tbPDCNuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Alta de Causas',
                      fraEmpresa,
                      fraEmpresa.IsSelected,
                      'Debe ingresar la Empresa Asociada.',
                      btnAplicar,
                      Is_AccidenteEstablId,
                      'Para poder continuar, debe confirmar los datos cargados previamente, haciendo click en Aplicar.'
                     ]);

  edDC_NUMERO.Clear;
  edDC_DESCRIPCION.Clear;

  ModoABMTablas := maAlta;

  fpPCD_DIAGNOSTICOCAUSA.ShowModal;
end;

procedure TfrmABMPRAM.tbPDCModificarClick(Sender: TObject);
begin
  if sdqPDC_DIAGNOSTICOCAUSA.IsEmpty OR (not sdqPDC_DIAGNOSTICOCAUSA.FieldByName('DC_FECHABAJA').IsNull) then
    Exit;

  with sdqPDC_DIAGNOSTICOCAUSA do
  begin
    edDC_NUMERO.Value     := FieldByName('DC_NUMERO').AsInteger;
    edDC_DESCRIPCION.Text := FieldByName('DC_DESCRIPCION').AsString;

    ModoABMTablas := maModificacion;

    fpPCD_DIAGNOSTICOCAUSA.ShowModal;
  end;
end;

procedure TfrmABMPRAM.tbPDCEliminarClick(Sender: TObject);
begin
  if sdqPDC_DIAGNOSTICOCAUSA.IsEmpty then
    Exit;

  DoDarDeBaja(sdqPDC_DIAGNOSTICOCAUSA, 'DC');
  EjecutarSql('DELETE FROM hys.pcm_pramcausaymedida ' +
              ' WHERE cm_iddiagnosticocausa = ' + SqlInt(sdqPDC_DIAGNOSTICOCAUSA.FieldByName('dc_id').AsInteger));
  if sdqPMC_MEDIDACORRECTIVA.Active then
    sdqPMC_MEDIDACORRECTIVA.First
end;

procedure TfrmABMPRAM.btPDCAceptarClick(Sender: TObject);
var
  sSql: String;
  iPDCNumero: Integer;
begin
  Verificar(IsEmptyString(edDC_DESCRIPCION.Text), edDC_DESCRIPCION, 'Debe ingresar la descripción de la causa.');

  with sdqPDC_DIAGNOSTICOCAUSA do
  begin
    try
      if ModoABMTablas = maAlta Then
        begin
          Insert;

          FieldByName('DC_ID').AsInteger                         := GetSecNextVal('HYS.SEQ_PDC_PRAM_ID');
          FieldByName('DC_IDACCIDENTEESTABLECIMIENTO').AsInteger := FIDAcc;

          sSql := 'SELECT NVL(MAX(DC_NUMERO), 0)+1 ' +
                    'FROM HYS.PDC_PRAMDIAGNOSTICOCAUSA ' +
                   'WHERE DC_IDACCIDENTEESTABLECIMIENTO=' + SqlValue(FIDAcc);
          iPDCNumero := ValorSqlInteger(sSql);

          FieldByName('DC_NUMERO').AsInteger                     := iPDCNumero;
        end
      else
        Edit;

      FieldByName('DC_DESCRIPCION').AsString                 := edDC_DESCRIPCION.Text;
      FieldByName('USUARIO').AsString                        := frmPrincipal.DBLogin.UserID;
      FieldByName('DC_USUBAJA').Value                        := Null;
      FieldByName('DC_FECHABAJA').Value                      := Null;

      Post;
      ApplyUpdates;

      SetID(sdqPDC_DIAGNOSTICOCAUSA, FIDAcc);
      sdqPDC_DIAGNOSTICOCAUSA.Open;

      fpPCD_DIAGNOSTICOCAUSA.ModalResult := mrOk;
    except
      on E: Exception do
        begin
          CancelUpdates;
          ErrorMsg(E, 'Error al guardar los datos.');
        end;
    end;
  end;
end;

procedure TfrmABMPRAM.tbPMCNuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Alta de Medidas',
                      fraEmpresa,
                      fraEmpresa.IsSelected,
                      'Debe ingresar la Empresa Asociada.',
                      btnAplicar,
                      Is_AccidenteEstablId,
                      'Para poder continuar, debe confirmar los datos cargados previamente, haciendo click en Aplicar.'
                     ]);

  edMC_MEDIDA.Clear;
  edMC_FECHAEJECUCION.Clear;
  edMC_FECHAVERIFICACION.Clear;
  edMC_DESCRIPCION.Clear;

  ModoABMTablas := maAlta;
  CargarCausas (0);

  btPMCAceptar.Caption := 'Agregar';
  fpPMC_MEDIDACORRECTIVA.ShowModal;
end;

procedure TfrmABMPRAM.tbPMCModificarClick(Sender: TObject);
begin
  if sdqPMC_MEDIDACORRECTIVA.IsEmpty or (not sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_FECHABAJA').IsNull)then
    Exit;

  with sdqPMC_MEDIDACORRECTIVA do
  begin
    edMC_MEDIDA.Value           := FieldByName('MC_MEDIDA').AsInteger;
    edMC_FECHAEJECUCION.Date    := FieldByName('MC_FECHAEJECUCION').AsDateTime;
    edMC_FECHAVERIFICACION.Date := FieldByName('MC_FECHAVERIFICACION').AsDateTime;
    edMC_DESCRIPCION.Text       := FieldByName('MC_DESCRIPCION').AsString;

    ModoABMTablas := maModificacion;

    btPMCAceptar.Caption := 'Modificar';
    CargarCausas (FieldByName('MC_ID').AsInteger);
    
    fpPMC_MEDIDACORRECTIVA.ShowModal;
  end;
end;

procedure TfrmABMPRAM.tbPMCEliminarClick(Sender: TObject);
begin
  if sdqPMC_MEDIDACORRECTIVA.IsEmpty or (not sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_FECHABAJA').IsNull)then
    Exit;

  DoDarDeBaja(sdqPMC_MEDIDACORRECTIVA, 'MC');
  Do_DarBajaSeguimientoVisita( sdqPMC_MEDIDACORRECTIVA.FieldByName( 'MC_ID' ).AsInteger );
  EjecutarSql('DELETE FROM hys.pcm_pramcausaymedida ' +
              ' WHERE cm_idmedidacorrectiva = ' + SqlInt( sdqPMC_MEDIDACORRECTIVA.FieldByName( 'MC_ID' ).AsInteger));
  sdqPMC_MEDIDACORRECTIVA.Refresh
end;

procedure TfrmABMPRAM.btPMCAceptarClick(Sender: TObject);
var
  sSql: String;
  pMC_ID: TTableId;
  i,
  iPMCMedida: Integer;

  procedure GenerarSQLAlta (IDCausa: Integer);
  begin
    sSql := 'INSERT INTO hys.pcm_pramcausaymedida (cm_id, cm_iddiagnosticocausa, cm_idmedidacorrectiva) ' +
            '     VALUES (hys.seq_pcm_pram_id.NEXTVAL, ' + SqlInt(IDCausa) + ', ' + SqlInt(pMC_ID) + ') '
  end;

  procedure GenerarSQLBaja (IDCausa: Integer);
  begin
    sSql := 'DELETE FROM hys.pcm_pramcausaymedida ' +
            ' WHERE cm_iddiagnosticocausa = ' + SqlValue(IDCausa) + ' ' +
            '   AND cm_idmedidacorrectiva = ' + SqlInt(pMC_ID)
  end;

  function VerifyChecked: boolean;
  var
    i: integer;
  begin
    i := 0;
    while (i <= cbCausas.Items.Count-1) and (not cbCausas.Checked[i]) do
      inc(i);

    result := i <= cbCausas.Items.Count-1
  end;

begin
  VerificarMultiple (['Registro de medidas correctivas',
                      cbCausas,
                      VerifyChecked,
                      'Debe especificar al menos una causa',
                      edMC_FECHAEJECUCION,
                      not edMC_FECHAEJECUCION.IsEmpty,
                      'Debe ingresar la fecha de ejecución.',
                      edMC_FECHAEJECUCION,
                      edMC_FECHAEJECUCION.Date >= edAE_FECHAACCIDENTE.Date,
                      'La fecha de ejecución debe ser mayor o igual a la fecha del accidente.',
                      edMC_FECHAVERIFICACION,
                      not edMC_FECHAVERIFICACION.IsEmpty,
                      'Debe ingresar la fecha de verificación.',
                      edMC_FECHAVERIFICACION,
                      edMC_FECHAVERIFICACION.Date >= edMC_FECHAEJECUCION.Date,
                      'La fecha de verificación debe ser mayor igual a la fecha de ejecución.',
                      edMC_DESCRIPCION,
                      not IsEmptyString(edMC_DESCRIPCION.Text),
                      'Debe ingresar la descripción de la medida correctiva.']);

  with sdqPMC_MEDIDACORRECTIVA do
  begin
    try

      if ModoABMTablas = maAlta Then
      begin
        pMC_ID := GetSecNextVal('HYS.SEQ_PMC_PRAM_ID');
        Insert;

        FieldByName('MC_ID').AsInteger                         := pMC_ID;
        FieldByName('MC_IDACCIDENTEESTABLECIMIENTO').AsInteger := FIDAcc;

        sSql := 'SELECT NVL(MAX(MC_MEDIDA), 0)+1 ' +
                  'FROM HYS.PMC_PRAMMEDIDACORRECTIVA ' +
                 'WHERE MC_IDACCIDENTEESTABLECIMIENTO=' + SqlValue(FIDAcc);
        iPMCMedida := ValorSqlInteger(sSql);

        FieldByName('MC_MEDIDA').AsInteger                     := iPMCMedida;
      end
      else begin
        pMC_ID := FieldByName('MC_ID').AsInteger;
        Edit;
      end;

      FieldByName('MC_DESCRIPCION').AsString                 := edMC_DESCRIPCION.Text;
      FieldByName('MC_FECHAEJECUCION').AsDateTime            := edMC_FECHAEJECUCION.Date;
      FieldByName('MC_FECHAVERIFICACION').AsDateTime         := edMC_FECHAVERIFICACION.Date;
      FieldByName('USUARIO').AsString                        := frmPrincipal.DBLogin.UserID;
      FieldByName('MC_USUBAJA').Value                        := Null;
      FieldByName('MC_FECHABAJA').Value                      := Null;

      Post;
      ApplyUpdates;

      SetID(sdqPMC_MEDIDACORRECTIVA, FIDAcc);
      sdqPMC_MEDIDACORRECTIVA.Open;

      // Analiza cada item del la lista de causas y procesa en consecuencia
      for i := 0 to cbCausas.Items.Count-1 do
      begin
        sSql := '';

        if (btPMCAceptar.Caption = 'Agregar') and cbCausas.Checked[i] then
          GenerarSQLAlta (Integer(cbCausas.Items.Objects[i])) // Alta
        else begin // Modificación
          // Analiza estado actual
          if cbCausas.Checked[i] then
          begin
            // Actualmente Seleccionado - Analiza estado previo
            if Integer(cbCausas.Items.Objects[i]) < 10000 then
              GenerarSQLAlta (Integer(cbCausas.Items.Objects[i])) // Previamente NO Seleccionado - Alta
          end
          else begin
            // Actualmente NO Seleccionado - Analiza estado previo
            if Integer(cbCausas.Items.Objects[i]) > 10000 then
              GenerarSQLBaja (Integer(cbCausas.Items.Objects[i])-10000) // Previamente Seleccionado - Baja
          end;
        end;

        if sSql <> '' then
          try
            EjecutarSqlST (sSql);
          except
            on E: Exception do ErrorMsg( E );
          end;
      end;

      fpPMC_MEDIDACORRECTIVA.ModalResult := mrOk;
      sdqPCM_CAUSAYMEDIDA.Refresh
    except
      on E: Exception do
      begin
        CancelUpdates;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end;
  end;
end;

procedure TfrmABMPRAM.Do_DarBajaSeguimientoVisita(IdMedidaCorrectiva: TTableId);
var
  sSql: String;
begin
  sSql := 'UPDATE HYS.PSV_PRAMSEGUIMIENTOVISITA ' +
             'SET SV_USUBAJA =' + SqlValue( frmPrincipal.DBLogin.UserID ) + ', ' +
                 'SV_FECHABAJA=ACTUALDATE ' +
           'WHERE SV_IDMEDIDACORRECTIVA=' + SqlValue( IdMedidaCorrectiva ) + ' ' +
             'AND SV_FECHABAJA IS NULL';

  EjecutarSqlST( sSql );

  sdqPSV_SEGUIMIENTOVISITA.Refresh;
end;

procedure TfrmABMPRAM.tbPSVNuevoClick(Sender: TObject);
begin
  VerificarMultiple (['Alta de Seguimiento',
                      fraEmpresa,
                      fraEmpresa.IsSelected,
                      'Debe ingresar la Empresa Asociada.',
                      btnAplicar,
                      Is_AccidenteEstablId,
                      'Para poder continuar, debe confirmar los datos cargados previamente, haciendo click en Aplicar.',
                      dbgPMC_MEDIDACORRECTIVA,
                      dbgPMC_MEDIDACORRECTIVA.SelectedRows.Count > 0,
                      'Debe seleccionar al menos una medida correctiva.'
                     ]);

  if not sdqPMC_MEDIDACORRECTIVA.IsEmpty then
  begin
    if sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_FECHABAJA').IsNull then
    begin
      edSV_TIPO.ItemIndex := -1;
      edSV_FECHA.Clear;

      VCLExtra.LockControl( edSV_FECHA, False );

      ModoABMTablas := maAlta;
      fraEstabSeguimiento.Clear;
      fraEstabSeguimiento.ReadOnly := false;
      CargarCausas (0);

      fpPSV_SEGUIMIENTOVISITA.ShowModal;
    end else
      MsgBox('La medida correctiva seleccionada se encuentra dada de baja.', MB_ICONERROR);
  end
end;

procedure TfrmABMPRAM.tbPSVModificarClick(Sender: TObject);
begin
  if sdqPSV_SEGUIMIENTOVISITA.IsEmpty or (not sdqPSV_SEGUIMIENTOVISITA.FieldByName('SV_FECHABAJA').IsNull) then
    Exit;

  VerificarMultiple (['Modificación de seguimiento',
                      dbgPSV_SEGUIMIENTOVISITA,
                      sdqPSV_SEGUIMIENTOVISITA.FieldByName('SV_INFERIDA').AsString = 'N',
                      'Seguimiento inferido, no puede ser modificado.',
                      dbgPMC_MEDIDACORRECTIVA,
                      dbgPMC_MEDIDACORRECTIVA.SelectedRows.Count > 0,
                      'Debe seleccionar al menos una medida correctiva.'
                     ]);

  fraEstabSeguimiento.ReadOnly := true;

  with sdqPSV_SEGUIMIENTOVISITA do
  begin
    edSV_TIPO.Value := iif(FieldByName('SV_TIPO').AsString = 'I', 'I', 'C');
    edSV_FECHA.Date := FieldByName('SV_FECHA').AsDateTime;

    fraEstabSeguimiento.Codigo := FieldByName('SV_ESTABLECI').AsString;

    VCLExtra.LockControl( edSV_FECHA, True );

    ModoABMTablas := maModificacion;

    fpPSV_SEGUIMIENTOVISITA.ShowModal;
  end;
end;

procedure TfrmABMPRAM.tbPSVEliminarClick(Sender: TObject);
begin
  if sdqPSV_SEGUIMIENTOVISITA.IsEmpty or (not sdqPSV_SEGUIMIENTOVISITA.FieldByName('SV_FECHABAJA').IsNull) then
    Exit;

  DoDarDeBaja(sdqPSV_SEGUIMIENTOVISITA, 'SV');
end;

procedure TfrmABMPRAM.btPSVAceptarClick(Sender: TObject);
var
  pMC_ID: TTableId;
  bEsAlta: Boolean;
  VisTipo : Char;
  i: integer;
begin
  bEsAlta := (ModoABMTablas = maAlta);

  Verificar(edSV_TIPO.ItemIndex = -1, edSV_TIPO, 'Debe seleccionar un tipo de visita.');
  Verificar(bEsAlta and (edSV_FECHA.Date = 0), edSV_FECHA, 'Debe ingresar la fecha de visita.');
  Verificar(bEsAlta and (edSV_FECHA.Date > DBDate), edSV_FECHA, 'La fecha de visita tiene que ser menor o igual a hoy.');
  Verificar(not fraEstabSeguimiento.IsSelected, fraEstabSeguimiento, 'Debe seleccionar un Establecimiento.');
  Verificar(not ExisteSql ('SELECT 1 ' +
                           '  FROM art.prv_resvisitas ' +
                           ' WHERE rv_cuit = ' + SqlValue (fraEmpresa.mskCUIT.Text) +
                           '   AND rv_estableci = ' + SqlValue (fraEstabSeguimiento.Codigo) +
                           '   AND rv_fecha = ' +  SqlValue (edSV_FECHA.Date)), edSV_FECHA,
            'No existe visita para la fecha indicada.');

  if bEsAlta and (ExisteSql('SELECT 1 FROM hys.psv_pramseguimientovisita ' +
                            ' WHERE sv_fechabaja IS NULL ' +
                            '   AND sv_estableci = ' + SqlValue(fraEstabSeguimiento.Codigo) +
                            '   AND sv_idmedidacorrectiva = ' + SqlValue(sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger) + ' AND SV_FECHA = ' + SqlValue(edSV_FECHA.Date))) then
  begin
    InvalidMsg(edSV_FECHA, 'Ya existe una visita con esta fecha y establecimiento.');
    Abort;
  end;

  if bEsAlta and (edSV_FECHA.Date < sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_FECHAEJECUCION').AsDateTime) then
    if not MsgAsk('La fecha de visita es mayor o igual a la fecha de ejecución.' + CRLF +
                  '¿Está seguro que la fecha ingresada es correcta?') then
      Abort;

  try
    try
      for i := 0 to dbgPMC_MEDIDACORRECTIVA.SelectedRows.Count -1 do
      with sdqPSV_SEGUIMIENTOVISITA do
      begin
        sdqPMC_MEDIDACORRECTIVA.GotoBookmark( Pointer(dbgPMC_MEDIDACORRECTIVA.SelectedRows.Items[i]) );

        pMC_ID := sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger;
        VisTipo := GetVisitaCorrecta(edSV_TIPO.Value[1],
                                     pMC_ID,
                                     edSV_FECHA.Date,
                                     iif (ModoABMTablas = maAlta, 0, FieldByName('SV_ID').AsInteger))[1];

        if ModoABMTablas = maAlta Then
          begin
            Insert;

            FieldByName('SV_ID').AsInteger                 := GetSecNextVal('HYS.SEQ_PSV_PRAM_ID');
            FieldByName('SV_IDMEDIDACORRECTIVA').AsInteger := pMC_ID;
            FieldByName('SV_INFERIDA').AsString            := 'N';
          end
        else
          Edit;

        FieldByName('SV_TIPO').AsString      := VisTipo;
        FieldByName('SV_FECHA').AsDateTime   := edSV_FECHA.Date;
        FieldByName('SV_ESTABLECI').AsString := fraEstabSeguimiento.Codigo;
        FieldByName('USUARIO').AsString      := frmPrincipal.DBLogin.UserID;
        FieldByName('SV_USUBAJA').Value      := Null;
        FieldByName('SV_FECHABAJA').Value    := Null;

        // solo para mostrar
        FieldByName('TIPO_VISITA').AsString := VisTipo;
        FieldByName('es_nombre').AsString := '';

        Post;
        ApplyUpdates;
      end;
    except
      on E: Exception do
      begin
        sdqPSV_SEGUIMIENTOVISITA.CancelUpdates;
        ErrorMsg(E, 'Error al guardar los datos.');
      end;
    end
  finally
    dbgPMC_MEDIDACORRECTIVA.UnselectAll;
    btnAplicarClick(Sender);
    tbBuscarClick(Sender);

    fpPSV_SEGUIMIENTOVISITA.ModalResult := mrOk;
  end;
end;

procedure TfrmABMPRAM.dbgPDC_DIAGNOSTICOCAUSAGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPDC_DIAGNOSTICOCAUSA.FieldByName('DC_FECHABAJA').IsNull then
    AFont.Color:= clRed;
end;

procedure TfrmABMPRAM.dbgPMC_MEDIDACORRECTIVAGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_FECHABAJA').IsNull then
    AFont.Color:= clRed;
end;

procedure TfrmABMPRAM.dbgPSV_SEGUIMIENTOVISITAGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not sdqPSV_SEGUIMIENTOVISITA.FieldByName('SV_FECHABAJA').IsNull then
    AFont.Color:= clRed
  else
    if sdqPSV_SEGUIMIENTOVISITA.FieldByName('SV_INFERIDA').AsString = 'S' THEN
      AFont.Color:= clBlue
end;

{* Visitas *******************************************************************}

procedure TfrmABMPRAM.btnRefrescarVisitasClick(Sender: TObject);
begin
  sdqVisitas.SQL.Clear;
  sdqVisitas.SQL.Add ('SELECT rv1.rv_id, rv1.rv_tipo, rv1.rv_estableci, rv1.rv_operativo, ' +
                      '       rv1.rv_fecha, rv1.rv_firmante, it_nombre, rv1.rv_fechabaja, ' +
                      '       rv1.rv_prestador, ej_descripcion, rv1.rv_descripcion, rv1.rv_horariodesde, ' +
                      '       rv1.rv_horariohasta, rv1.rv_duracionpermanencia, rv1.rv_idvisitaasociada' +
                      '  FROM art.mej_empprest, art.pit_firmantes, art.prv_resvisitas rv1, ' +
                      '       hys.hep_estabporpreventor, art.prv_resvisitas rv2 ' +
                      ' WHERE it_codigo(+) = rv1.rv_firmante ' +
                      '   AND ej_codigo(+) = rv1.rv_prestador ' +
                      '   AND ep_cuit(+) = rv1.rv_cuit ' +
                      '   AND ep_estableci(+) = rv1.rv_estableci ' +
                      '   AND rv2.rv_id(+) = rv1.rv_idvisitaasociada ' +
                      '   AND rv1.rv_cuit = ' + SqlValue (fraEmpresa.mskCUIT.Text));
  if fraEstabVisitaFiltro.IsSelected then
    sdqVisitas.SQL.Add ('   AND rv1.rv_estableci = ' + SqlValue (fraEstabVisitaFiltro.Codigo));
  sdqVisitas.SQL.Add ('ORDER BY rv1.rv_fecha');

  sdqVisitas.Open;
end;

procedure TfrmABMPRAM.btnNuevaVisitaClick(Sender: TObject);
begin
  VerificarMultiple (['Alta de Visitas',
                      fraEmpresa,
                      fraEmpresa.IsSelected,
                      'Debe ingresar la Empresa Asociada.',
                      btnAplicar,
                      Is_AccidenteEstablId,
                      'Para poder continuar, debe confirmar los datos cargados previamente, haciendo click en Aplicar.'
                     ]);

  // Inicializar
  FModoVisita := maAlta;
  btnLimpiarVisitaClick(Sender);

  fraEstabVisita.Clear;
  fraPreventorVisita.Value := fraPreventor.Value;

  fpVisita.ShowModal
end;

procedure TfrmABMPRAM.btnModifVisitaClick(Sender: TObject);
begin
  if sdqVisitas.IsEmpty then
    Exit;

  // Inicializar
  FModoVisita := maModificacion;
  btnLimpiarVisitaClick(Sender);

  // Cargar los datos
  edFechaVisita.Date          := sdqVisitas.FieldByName ('rv_fecha').AsDateTime;
  FIdVisitaAsociada           := sdqVisitas.FieldByName ('rv_idvisitaasociada').AsInteger;
  fraPreventorVisita.Codigo   := sdqVisitas.FieldByName ('rv_firmante').AsString;
  fraEstabVisita.Codigo       := sdqVisitas.FieldByName ('rv_estableci').AsString;

  edObservacion.Lines.Text := sdqVisitas.FieldByName ('rv_descripcion').AsString;

  pnlDatos.Enabled := FIdVisitaAsociada = 0;

  fraPreventorVisita.ShowBajas := true;

  fpVisita.ShowModal;
end;

procedure TfrmABMPRAM.btnDeleteVisitaClick(Sender: TObject);
var
  Sql : TSql;
begin
  if sdqVisitas.IsEmpty or (not sdqVisitas.FieldByName ('rv_fechabaja').IsNull) then
    Exit;

  if MsgBox('¿Desea eliminar el registro seleccionado?', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  FModoVisita := maBaja;

  Sql := TSql.Create('art.prv_resvisitas');
  try
    Sql.PrimaryKey.Add('rv_id', sdqVisitas.FieldByName('rv_id').AsInteger);
    Sql.Fields.Add('rv_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('rv_usubaja', frmPrincipal.DBLogin.LoginName );

    EjecutarSqlST (Sql.UpdateSql);

    EjecutarSqlST(
      'UPDATE hys.hvm_visitamotivo ' +
      '   SET vm_usubaja = ' + SqlValue (frmPrincipal.DBLogin.LoginName) + ', ' +
      '       vm_fechabaja = SYSDATE ' +
      ' WHERE vm_idvisita = ' + SqlValue (sdqVisitas.FieldByName('rv_id').AsInteger)
    );

    sdqVisitas.Refresh;
  finally
    Sql.Free;
  end;

  Sql := TSql.Create('art.prv_resvisitas');
  try
    Sql.PrimaryKey.Add('rv_id', sdqVisitas.FieldByName('rv_id').AsInteger);
    Sql.Fields.Add('rv_fechabaja', SQL_DATETIME, False);
    Sql.Fields.Add('rv_usubaja', frmPrincipal.DBLogin.LoginName );

    EjecutarSqlST (Sql.UpdateSql);

    sdqVisitas.Refresh;
  finally
    Sql.Free;
  end;
end;

procedure TfrmABMPRAM.CargarCausas (IDMedida: Integer);
begin
  with qryCausas do
  begin
    cbCausas.Items.Clear;

    ParamByName('pidmc').Value := IDMedida;
    ParamByName('pidacc').Value := FIDAcc;

    Open;
    while not EoF do
    begin
      cbCausas.Items.AddObject(FieldByName('dc_descripcion').AsString, TObject(FieldByName('checked').AsInteger));
      cbCausas.Checked [cbCausas.Items.Count-1] := FieldByName ('checked').AsInteger > 10000;

      Next
    end;

    Close
  end
end;

procedure TfrmABMPRAM.btnLimpiarVisitaClick(Sender: TObject);
begin
  pnlDatos.Enabled  := True;
  FIdVisitaAsociada := 0;
  edFechaVisita.Clear;
  fraEstabVisita.Clear;
  fraEstabVisitaFiltro.Clear;
  fraPreventorVisita.Clear;
  edObservacion.Lines.Clear;
end;

{function TfrmABMPRAM.HayChequeados (cbItems: TRxCheckListBox): Boolean;
var
  i: Integer;
begin
  Result := false;
  if cbItems.CheckKind <> ckRadioButtons then
    for i := 0 to cbItems.Items.Count - 1 do
      if cbItems.Checked[i] then begin
        Result := true;
        Exit;
      end;
end;}

procedure TfrmABMPRAM.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.Execute
end;

procedure TfrmABMPRAM.ToolButton10Click(Sender: TObject);
begin
  SortDialog2.Execute
end;

procedure TfrmABMPRAM.btnAceptarVisitaClick(Sender: TObject);
const
  IDPRAM = 50;
var
  Sql : TSql;
  FIdVisita: integer;
  Tipo,
  CUIT,
  Estab: String;
begin
  VerificarMultiple (['Registro de Visita',
                      fraEstabVisita,
                      fraEstabVisita.IsSelected,
                      'Debe indicarse el Establecimiento al que se realizó la visita.']);

  CUIT := fraEmpresa.mskCUIT.Text;
  Estab:= fraEstabVisita.Codigo;
  Tipo := ValorSQL ('SELECT art.hys.get_tipo_empresa (' + SqlValue (CUIT) + ', ' +
                                                          SqlValue (Estab) +
                                                      ', SYSDATE) FROM DUAL');
  VerificarMultiple (['Registro de Visita',
                      edFechaVisita,
                      IsValidDate (edFechaVisita.Text, 'DD/MM/YYYY'),
                      'La fecha no es válida.',
                      edFechaVisita,
                      edFechaVisita.Date <= DBDate,
                      'La fecha no puede ser superior a la fecha actual.',
                      edFechaVisita,

                      ((FModoVisita = maAlta) and
                       (not ExisteSQL('SELECT 1 ' +
                                     '  FROM art.prv_resvisitas ' +
                                     ' WHERE rv_cuit = ' + SqlValue (CUIT) +
                                     '   AND rv_estableci = ' + SqlValue (Estab) +
                                     '   AND rv_firmante = ' + SqlValue (fraPreventorVisita.Codigo) +
                                     '   AND rv_fecha = ' +  SqlValue (edFechaVisita.Date)
                                    ))
                      )
                      or
                      ((FModoVisita <> maAlta) and
                       (not ExisteSQL('SELECT 1 ' +
                                      '  FROM art.prv_resvisitas ' +
                                      ' WHERE rv_cuit = ' + SqlValue (CUIT) +
                                      '   AND rv_estableci = ' + SqlValue (Estab) +
                                      '   AND rv_fecha = ' +  SqlValue (edFechaVisita.Date) +
                                     '    AND rv_firmante = ' + SqlValue (fraPreventorVisita.Codigo) +
                                      '   AND rv_id <> ' +  SqlValue (sdqVisitas.FieldByName('rv_id').AsInteger)
                                    ))
                      ),
                      'Ya existe una visita en la fecha indicada para este preventor.',
                      fraPreventorVisita,
                      fraPreventorVisita.IsSelected,
                      'Debe indicarse el preventor que realizó la visita.']
                     );

  Sql := TSql.Create('art.prv_resvisitas');
  try
    if FModoVisita = maAlta then
    begin
      Sql.SqlType := stInsert;

      FIdVisita := GetSecNextVal('ART.SEQ_PRV_ID');

      Sql.PrimaryKey.Add ('rv_id', FIdVisita);
      Sql.Fields.Add('rv_cuit', CUIT);
      Sql.Fields.Add('rv_tipo', Tipo);
      Sql.Fields.Add('rv_operativo', String(ValorSql ('SELECT art.hys.get_operativovigente_empresa(' +
                                                      SqlValue (CUIT) + ', SYSDATE) FROM DUAL')));
      Sql.Fields.Add('rv_prestador', '0001');
      Sql.Fields.Add('rv_indicevisita', 0);
      Sql.Fields.Add('rv_fechaalta', SQL_DATETIME, False);
      Sql.Fields.Add('rv_usualta', frmPrincipal.DBLogin.LoginName);
    end
    else begin
      Sql.SqlType := stUpdate;

      FIdVisita := sdqVisitas.FieldByName('rv_id').AsInteger;

      Sql.PrimaryKey.Add ('rv_id', FIdVisita);
      Sql.Fields.Add('rv_fechamodif', SQL_DATETIME, False);
      Sql.Fields.Add('rv_usumodif', frmPrincipal.DBLogin.LoginName);

      Sql.Fields.Add('rv_fechabaja', ExNull);
      Sql.Fields.Add('rv_usubaja', ExNull);
    end;

    Sql.Fields.Add('rv_estableci', Estab);
    Sql.Fields.Add('rv_fecha', edFechaVisita.Date);
    Sql.Fields.Add('rv_firmante', fraPreventorVisita.Codigo);
    Sql.Fields.Add('rv_descripcion', trim(edObservacion.Lines.Text));
    if FIdVisitaAsociada > 0 then
      Sql.Fields.Add('rv_idvisitaasociada', FIdVisitaAsociada);

    if not ExisteSql ('SELECT 1 ' +
                      '  FROM ppm_planmej ' +
                      ' WHERE pm_cuit =  ' + SqlValue(CUIT) +
                      '   AND pm_estableci = ' + SqlValue(Estab)) then
      EjecutarSqlST('INSERT INTO ppm_planmej ' +
                    '            (pm_cuit, pm_estableci, pm_usalta, pm_fecalta ' +
                    '            ) ' +
                    '     VALUES (' + SqlValue(CUIT) + ', ' +
                                      SqlValue(Estab) + ', ' +
                                      SqlValue(frmPrincipal.DBLogin.LoginName) + ', SYSDATE ' +
                    '            )');
    EjecutarSqlST (Sql.Sql);

    if not ExisteSQL ('SELECT 1 ' +
                      '  FROM hys.hvm_visitamotivo ' +
                      ' WHERE vm_idvisita = ' + SqlValue(FIDVisita) +
                      '   AND vm_idmotivo = ' + SqlValue(IDPRAM)) then
      EjecutarSqlST(
        'INSERT INTO hys.hvm_visitamotivo ' +
        '            (vm_idvisita, vm_idmotivo, vm_usualta, vm_fechaalta, vm_id) ' +
        '     VALUES (' + SqlValue(FIDVisita) + ', ' +
                          SqlValue(IDPRAM) + ', ' +
                          SqlValue(frmPrincipal.DBLogin.LoginName) + ', ' +
                          'SYSDATE, HYS.SEQ_HVM_ID.NEXTVAL)');

    sdqVisitas.Refresh;
    sdqVisitasAfterScroll(sdqVisitas);

    fpVisita.ModalResult := mrOk;
  finally
    Sql.Free;
  end;
end;

procedure TfrmABMPRAM.sdqVisitasAfterScroll(DataSet: TDataSet);
begin
  redObservaciones.Lines.Clear;
  redObservaciones.Lines.Add(Trim(DataSet.FieldByName('rv_descripcion').AsString));
end;

procedure TfrmABMPRAM.tbNuevoClick(Sender: TObject);
begin
  memTrabajadores.EmptyTable;
  memTrabajadores.Open;

  FIDAcc := 0;
  btnAplicar.Enabled := true;

  inherited;
end;

procedure TfrmABMPRAM.dbgVisitasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqVisitas.FieldByName('rv_fechabaja').IsNull then
    AFont.Color:= clRed;
end;

function TfrmABMPRAM.GetVisitaCorrecta(aTipoVisita: String; aMedida: integer; aFecha: TDate; aIDVisita: integer): String;
var
  ResultVisitaAnt: String;
begin
  ResultVisitaAnt := ValorSql('SELECT sv_tipo ' +
                              '  FROM hys.psv_pramseguimientovisita ' +
                              ' WHERE sv_idmedidacorrectiva = ' + SqlValue(aMedida) +
                              '   AND sv_estableci = ' + SqlValue (fraEstabSeguimiento.Codigo) +
                              iif (aIDVisita = 0, '', '   AND sv_id <> ' + SqlValue (aIDVisita)) +
                              '   AND sv_fechabaja IS NULL ' +
                              '   AND sv_fecha = (SELECT MAX(sv_fecha)  ' +
                              '                     FROM hys.psv_pramseguimientovisita  ' +
                              '                    WHERE sv_estableci = ' + SqlValue (fraEstabSeguimiento.Codigo) +
                                                     iif (aIDVisita = 0, '', '   AND sv_id <> ' + SqlValue (aIDVisita)) +
                              '                      AND sv_idmedidacorrectiva = ' + SqlValue(aMedida) +
                              '                      AND sv_fecha <> ' + SqlDate(aFecha) +
                              '                      AND sv_fechabaja IS NULL)');

  if (aTipoVisita = 'C') then
  begin
    if (ResultVisitaAnt = 'V') or (ResultVisitaAnt = 'C') or (ResultVisitaAnt = '') then
      // SI VIENE UN CUMPLIMIENTO Y LA VISITA ANTERIOR ES UN INCUMPLIMIENTO O NO EXISTE,
      // SE INSERTA UN CUMPLIMIENTO
      Result := 'V'
    else
      // SINO SIGNINICA QUE EL ANTERIOR ES UN INCUMPLIMIENTO o CUMPLIMIENTO TARDIO
      // y SE INSERTA EL CUMPLIMIENTO TARDIO
      Result := 'C';
  end
  else
    //SI VIENE UN INCUMPLIMIENTO SE INSERTA DIRECTAMENTE
    Result := aTipoVisita;
end;

procedure TfrmABMPRAM.fraPreventorcmbDescripcionDropDown(Sender: TObject);
begin
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] <> '%') then
      fraPreventor.cmbDescripcion.Text := '%' + fraPreventor.cmbDescripcion.Text;
  fraPreventor.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventor.cmbDescripcion.Text) <> '') and
     (trim(fraPreventor.cmbDescripcion.Text)[1] = '%') then
      fraPreventor.cmbDescripcion.Text := copy(fraPreventor.cmbDescripcion.Text, 2,
                                               length(fraPreventor.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmABMPRAM.fraPreventorVisitacmbDescripcionDropDown(
  Sender: TObject);
begin
  if (trim(fraPreventorVisita.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorVisita.cmbDescripcion.Text)[1] <> '%') then
      fraPreventorVisita.cmbDescripcion.Text := '%' + fraPreventorVisita.cmbDescripcion.Text;
  fraPreventorVisita.cmbDescripcionDropDown(Sender);
  if (trim(fraPreventorVisita.cmbDescripcion.Text) <> '') and
     (trim(fraPreventorVisita.cmbDescripcion.Text)[1] = '%') then
      fraPreventorVisita.cmbDescripcion.Text := copy(fraPreventorVisita.cmbDescripcion.Text, 2,
                                               length(fraPreventorVisita.cmbDescripcion.Text));
  inherited;
end;

procedure TfrmABMPRAM.edNotaExit(Sender: TObject);
begin
  edNota.Text := Trim(ReplaceStr(edNota.Text, ' ', ''));
  edNota.Update;
end;

procedure TfrmABMPRAM.tbBuscarClick(Sender: TObject);
begin
  sdqPSV_SEGUIMIENTOVISITA.Close;

  // Aplicar Filtros
  sdqPSV_SEGUIMIENTOVISITA.SQL.Clear;
  sdqPSV_SEGUIMIENTOVISITA.SQL.Add(
    'SELECT   sv_id, sv_idmedidacorrectiva, sv_tipo, sv_estableci, ' +
    '         DECODE(sv_tipo, ' +
    '                ''V'', ''Visita'', ' +
    '                ''C'', ''Cumplimiento'', ' +
    '                ''I'', ''Incumplimiento'') tipo_visita, ' +
    '         sv_fecha, sv_usualta usuario, sv_usubaja, sv_fechabaja, ' +
    '         sv_fechaexport, es_nombre, sv_inferida ' +
    '    FROM hys.psv_pramseguimientovisita, afi.aes_establecimiento ' +
    '   WHERE sv_idmedidacorrectiva = :ID ' +
    '     AND es_nroestableci = sv_estableci ' +
    '     AND es_contrato = ' + SqlValue (fraEmpresa.Contrato));
  if fraEstabSV.IsSelected then
    sdqPSV_SEGUIMIENTOVISITA.SQL.Add('   AND sv_estableci = ' + SqlValue(fraEstabSV.Codigo));
  sdqPSV_SEGUIMIENTOVISITA.SQL.Add('ORDER BY sv_estableci, sv_id ');

  SetID(sdqPSV_SEGUIMIENTOVISITA, sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger);
  OpenQuery( sdqPSV_SEGUIMIENTOVISITA );

  sdqNoVisitados.Close;
  sdqNoVisitados.SQL.Clear;
  sdqNoVisitados.SQL.Add(
    'SELECT aes.es_nroestableci, aes.es_nombre ' +
    '  FROM afi.aes_establecimiento aes ' +
    ' WHERE es_nroestableci NOT IN(SELECT sv.sv_estableci ' +
    '                                FROM hys.psv_pramseguimientovisita sv, afi.aes_establecimiento es ' +
    '                               WHERE es.es_nroestableci = sv.sv_estableci ' +
    '                                 AND sv.sv_fechabaja IS NULL ' +
    '                                 AND sv.sv_inferida = ''N'' ' +
    '                                 AND es.es_fechabaja IS NULL ' +
    '                                 AND es.es_contrato = ' + SqlValue (fraEmpresa.Contrato) +
    '                                 AND sv.sv_idmedidacorrectiva = :ID) ' +
    '   AND aes.es_fechabaja IS NULL ' +
    '   AND aes.es_contrato = ' + SqlValue (fraEmpresa.Contrato));

  SetID(sdqNoVisitados, sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger);
  OpenQuery( sdqNoVisitados );
end;

//   fraEstabSV.Codigo := DataSet.FieldByName('SV_ESTABLECI').AsString;

procedure TfrmABMPRAM.tbInferenciaClick(Sender: TObject);
var
  IDMedida: Integer;
  Inferencia: String;
begin
  IDMedida := sdqPMC_MEDIDACORRECTIVA.FieldByName('MC_ID').AsInteger;
  Inferencia := ValorSql ('SELECT   NVL(CASE ' +
                          '               WHEN SUM(DECODE(sv_tipo, ''I'', 1, 0)) ' +
                          '                    / COUNT(DECODE(sv_tipo, ''C'', 1, ''V'', 1, ''I'', 1)) ' +
                          '                    * 100 > 70 THEN ''I'' ' +
                          '             ELSE ' +
                          '               CASE ' +
                          '                 WHEN SUM(DECODE(sv_tipo, ''C'', 1, ''V'', 1, 0)) ' +
                          '                      / COUNT(DECODE(sv_tipo, ''C'', 1, ''V'', 1, ''I'', 1)) ' +
                          '                      * 100 > 70 THEN ''C'' ' +
                          '               ELSE ''X'' ' +
                          '               END ' +
                          '             END, ''X'') inferencia ' +
                          '    FROM hys.psv_pramseguimientovisita psv ' +
                          '   WHERE psv.sv_fechabaja IS NULL ' +
                          '     AND psv.sv_inferida = ''N'' ' +
                          '     AND psv.sv_fecha = (SELECT MAX(sv.sv_fecha) ' +
                          '                           FROM hys.psv_pramseguimientovisita sv ' +
                          '                          WHERE sv.sv_fechabaja IS NULL ' +
                          '                            AND sv.sv_estableci = psv.sv_estableci ' +
                          '                            AND sv.sv_inferida = ''N'' ' +
                          '                            AND sv.sv_idmedidacorrectiva = psv.sv_idmedidacorrectiva) ' +
                          '     AND sv_idmedidacorrectiva = ' + SqlValue (IDMedida));

  if Inferencia <> 'X' then
  begin
    with sdqNoVisitados do
    begin
      DisableControls;
      First;

      while not EoF do begin
        if not ExisteSql('SELECT 1 FROM hys.psv_pramseguimientovisita ' +
                         ' WHERE sv_fechabaja IS NULL ' +
                         '   AND sv_estableci = ' + SqlValue(FieldByName('es_nroestableci').AsInteger) +
                         '   AND sv_idmedidacorrectiva = ' + SqlValue(IDMedida) +
                         '   AND sv_fecha = ' + SqlValue(DBDate)) then
        begin
          with sdqPSV_SEGUIMIENTOVISITA do
          begin
            try
              ModoABMTablas := maAlta;
              Insert;

              FieldByName('SV_ID').AsInteger                 := GetSecNextVal('HYS.SEQ_PSV_PRAM_ID');
              FieldByName('SV_IDMEDIDACORRECTIVA').AsInteger := IDMedida;
              FieldByName('SV_TIPO').AsString                := Inferencia;
              FieldByName('SV_FECHA').AsDateTime             := DBDate;
              FieldByName('SV_ESTABLECI').AsInteger          := sdqNoVisitados.FieldByName('es_nroestableci').AsInteger;
              FieldByName('USUARIO').AsString                := frmPrincipal.DBLogin.UserID;
              FieldByName('SV_USUBAJA').Value                := Null;
              FieldByName('SV_FECHABAJA').Value              := Null;
              FieldByName('SV_INFERIDA').Value               := 'S';

              // solo para mostrar
              FieldByName('TIPO_VISITA').AsString := Inferencia;
              FieldByName('es_nombre').AsString   := '';

              Post;
              ApplyUpdates;
            except
              on E: Exception do
                begin
                  CancelUpdates;
                  ErrorMsg(E, 'Error al guardar los datos.');
                end
            end
          end
        end;

        Next
      end;

      EnableControls;
    end;

    pcVisitasSeguimiento.ActivePageIndex := 0;
    tbBuscarClick(Sender)
  end
end;

procedure TfrmABMPRAM.btnAplicarClick(Sender: TObject);
begin
  if Validar then
  begin
    DoABM;
    btnAplicar.Enabled := false;
    ModoABM := maModificacion;
    sdqConsulta.Refresh;
    btnRefrescarVisitasClick(Sender);
  end
end;

procedure TfrmABMPRAM.btPSVCancelarClick(Sender: TObject);
begin
  dbgPMC_MEDIDACORRECTIVA.UnselectAll;
end;

end.







