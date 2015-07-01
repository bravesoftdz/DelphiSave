unit unGestionArmarSelEmpresas;

interface
                     
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  StdCtrls, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Mask, ToolEdit, DateComboBox, PatternEdit, IntEdit,
  CurrEdit, CardinalEdit, Menus, FormPanel, ImgList, ComboEditor, CheckCombo, DBCheckCombo, unfraStaticActividad,
  unfraVendedores, unfraVendedoresCUIT, unfraEntidadCUIT, unFraCodigoDescripcion, unArt, unFraCodDesc,
  RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TfrmGestionArmarSelEmpresas = class(TfrmCustomConsulta)
    ToolButton1: TToolButton;
    Panel2: TPanel;
    edCantContratos: TCardinalEdit;
    Panel1: TPanel;
    edTotalContratos: TCardinalEdit;
    ToolButton2: TToolButton;
    tbCalcularTotal: TToolButton;
    tbAgregarContratos: TToolButton;
    OpenDialog: TOpenDialog;
    PopupMenu1: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    fpAsignarPlan: TFormPanel;
    btnPlanAceptar: TButton;
    btnPlanCancelar: TButton;
    BevelAbm: TBevel;
    lbDescripcion: TLabel;
    edDescripcionPlan: TEdit;
    tvPlanAccion: TTreeView;
    imlIconos: TImageList;
    pgFiltros: TPageControl;
    tsFiltro1: TTabSheet;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    gbSector: TGroupBox;
    fraStaticCTBSector: TfraStaticCTB_TABLAS;
    gbHolding: TGroupBox;
    tsFiltro2: TTabSheet;
    rgSaldroAcreedor: TRadioGroup;
    rgReclamoAFIP: TRadioGroup;
    rgConcurso: TRadioGroup;
    rgRefinanciacion: TRadioGroup;
    rgILT: TRadioGroup;
    rgQuiebra: TRadioGroup;
    gbEstadosEmpresa: TGroupBox;
    cmbEstadoEmpresa: TDBCheckCombo;
    sdqEstadosEmpresa: TSDQuery;
    dsEstadosEmpresa: TDataSource;
    gbMotivosBaja: TGroupBox;
    cmbMotivoBaja: TDBCheckCombo;
    sdqMotivosBaja: TSDQuery;
    dsMotivosBaja: TDataSource;
    gbVigenciaTarifa: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    edVigTarifaDesde: TDateComboBox;
    edVigTarifaHasta: TDateComboBox;
    gbFechaBaja: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edFBajaDesde: TDateComboBox;
    edFBajaHasta: TDateComboBox;
    gbCantPerCuota: TGroupBox;
    Label3: TLabel;
    edCantPerCuotaHasta: TIntEdit;
    edCantPerCuotaDesde: TIntEdit;
    gbDeudaTotal: TGroupBox;
    Label4: TLabel;
    edDeudaTotalDesde: TCurrencyEdit;
    edDeudaTotalHasta: TCurrencyEdit;
    gbDeudaCuota: TGroupBox;
    Label5: TLabel;
    edDeudaCuotaDesde: TCurrencyEdit;
    edDeudaCuotaHasta: TCurrencyEdit;
    gbDeudaCuotaDif: TGroupBox;
    Label7: TLabel;
    edDeudaCuotaDifDesde: TCurrencyEdit;
    edDeudaCuotaDifHasta: TCurrencyEdit;
    gbCapitas: TGroupBox;
    Label1: TLabel;
    edCapitasHasta: TIntEdit;
    edCapitasDesde: TIntEdit;
    gbMayorDevUltAnio: TGroupBox;
    Label8: TLabel;
    edMayorDevUltAnioDesde: TCurrencyEdit;
    edMayorDevUltAnioHasta: TCurrencyEdit;
    gbGestor: TGroupBox;
    fraStaticGestor: TfraStaticCodigoDescripcion;
    gbEjecutivo: TGroupBox;
    fraStaticEjecutivo: TfraStaticCodigoDescripcion;
    gbEstudio: TGroupBox;
    fraStaticEstudio: TfraStaticCodigoDescripcion;
    gbActividad: TGroupBox;
    fraStaticActividad: TfraStaticActividad;
    gbEntidad: TGroupBox;
    fraEntidad: TfraEntidadCUIT;
    gbVendedor: TGroupBox;
    fraVendedor: TfraVendedoresCUIT;
    gbProvincia: TGroupBox;
    fraStaticProvincia: TfraStaticCodigoDescripcion;
    rgSuss: TRadioGroup;
    rgCartaDocumento: TRadioGroup;
    fraStaticCTBHolding: TfraCodDesc;
    rgSaldoAcreedorAjust: TRadioGroup;
    gbDeudaIntereses: TGroupBox;
    Label11: TLabel;
    edInteresesDevDsDesde: TCurrencyEdit;
    edInteresesDevDsHasta: TCurrencyEdit;
    rgSIC: TRadioGroup;
    SaveDialogExport: TSaveDialog;
    gbOrganizador: TGroupBox;
    fraOrganizador: TfraCodDesc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbCalcularTotalClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbAgregarContratosClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure btnPlanAceptarClick(Sender: TObject);
    procedure fpAsignarPlanEnter(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tvPlanAccionAdvancedCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
    procedure tvPlanAccionChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
    procedure fraEntidadExit(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbExportarClick(Sender: TObject);
  private
    pbHayDatosAgregarContratos: Boolean;
    psSqlSELECTBusqueda: String;

    function Do_CrearSeleccion(IdEncabezadoPlan, IdGestor: TTableId; DescripcionPlan: String): TTableId;
    function Do_GrabarPlan: Boolean;
    function Get_CondicionUsuario: String;
    function Get_Filtros: String;
    function Get_InsertTemporal(CondicionAdicional: String; var sSqlSELECT: String): String;
    function Get_TipoAgrupacionPlan(IdEncabPlan: TTableId): String;
    function ValidarPlan: Boolean;
    function ValidarSeleccionPlan: Boolean;
    function GetHint: String;
    procedure CalcularCantTotalReg;
    procedure CalcularFilasSel;
    procedure Do_InsertarContratosSeleccionPlan(NroSeleccion, IdGestor: TTableId);
    procedure Do_MarcarContratosSeleccionados;
    procedure InicializarContadores(ActualizarCantContratos: Boolean);
    procedure LoadTree;
  protected
    procedure EnableButtons(AEnabled: Boolean); override;
  public
  end;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, unComunes, General, CustomDlgs, SqlFuncs, unSesion;

{$R *.DFM}


procedure TfrmGestionArmarSelEmpresas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmPrincipal.mnuGestionArmarSelEmpresas.Enabled := True;
  Action := caFree;
end;

function TfrmGestionArmarSelEmpresas.GetHint: String;
var
  sHint: String;
begin
  if fraEmpresa.IsSelected or pbHayDatosAgregarContratos then
    sHint := ''
  else
    sHint := '/*+ RULE */';

  Result := sHint;  
end;

procedure TfrmGestionArmarSelEmpresas.tbRefrescarClick(Sender: TObject);
var
  sHint, sSql: String;
  sSqlSELECT: String;
begin
  if not pbHayDatosAgregarContratos then
  begin
    Do_LimpiarTablaTemporal('TCG_CONTRATOSSELGESTION', 'CG_USUARIO', Sesion.UserID);

    sSql := Get_InsertTemporal('', sSqlSELECT);
    EjecutarSql(sSql);

    psSqlSELECTBusqueda := sSqlSELECT;
  end;

  sHint := GetHint();

  sSql :=
    'SELECT ' + sHint + ' EM_CUIT CUIT, EM_NOMBRE RAZONSOCIAL, CTBSECTOR.TB_DESCRIPCION CTBSECTORDESCR,' +
          ' EM_FECHAQUIEBRA FECHAQUIEBRA, CO_ULTIMOMESQUIEBRA ULTIMOMESQUIEBRA, CO_CONTRATO CONTRATO,' +
          ' EM_FECHACONCURSO FECHACONCURSO, CO_ULTIMOMESCONCURSO ULTIMOMESCONCURSO, PV_DESCRIPCION DESCRPROVINCIA,' +
          ' CO_ULTIMANOMINA ULTIMANOMINA, ART.AFI.GET_TELEFONOS(''ATO_TELEFONOCONTRATO'', CO_CONTRATO, ''L'') TELEFONOS, CT_CONTACTO CONTACTO,' +
          ' CTBCARGO.TB_DESCRIPCION CTBCARGODESCR, AC_CODIGO CODACTIVIDAD, AC_DESCRIPCION DESCRACTIVIDAD,' +
          ' TC_SUMAFIJA SUMAFIJA, TC_PORCMASA PORCMASA, CCAINTIMACION.CA_NROCARTADOC NROCARTADOC_INTIMACION,' +
          ' TRUNC(CCAINTIMACION.CA_FECHAIMPRESION) FIMPRESIONCARTADOC_INTIMACION,' +
          ' CCAINTIMACION.CA_CODRECEPCION CODRECEPC_INTIMACION,' +
          ' CCAINTIMACION.CA_FECHARECEPCION FRECEPCION_INTIMACION,' +
          ' CTBCODRECEPINTIMACION.TB_DESCRIPCION CTBINTIMACION_CODRECEPC_DESCR,' +
          ' CCARESCISION.CA_NROCARTADOC NROCARTADOC_RESCISION,' +
          ' TRUNC(CCARESCISION.CA_FECHAIMPRESION) FIMPRESIONCARTADOC_RESCISION,' +
          ' CCARESCISION.CA_CODRECEPCION CODRECEPC_RESCISION, CCARESCISION.CA_FECHARECEPCION FRECEPCION_RESCISION,' +
          ' CTBCODRECEPRESCISION.TB_DESCRIPCION CTBRESCISION_CODRECEPC_DESCR,' +
          ' CCACOMERCIAL.CA_NROCARTADOC NROCARTADOC_COMERCIAL,' +
          ' TRUNC(CCACOMERCIAL.CA_FECHAIMPRESION) FIMPRESIONCARTADOC_COMERCIAL,' +
          ' CCACOMERCIAL.CA_CODRECEPCION CODRECEPC_COMERCIAL, CCACOMERCIAL.CA_FECHARECEPCION FRECEPCION_COMERCIAL,' +
          ' CTBCODRECEPCOMERCIAL.TB_DESCRIPCION CTBCOMERCIAL_CODRECEPC_DESCR, ENTIDAD.EN_CODBANCO CODENTIDAD,' +
          ' ENTIDAD.EN_NOMBRE NOMBREENTIDAD, VE_VENDEDOR CODVENDEDOR, VE_NOMBRE NOMBREVENDEDOR,' +
          ' ESTJUR.GC_NOMBRE NOMBREESTJURIDICO, GESTOR.GC_NOMBRE NOMBREGESTOR, AECEJCTA.EC_NOMBRE NOMBREEJECUTIVO,' +
          ' AECEJENT.EC_NOMBRE NOMBREEJECUTIVOENT, GE_DESCRIPCION CTBHOLDINGDESCR, TDC.DC_DEUDATOTAL DEUDATOTAL,' +
          ' COBRANZA.GET_DEUDATOTALNETAANT(TDC.DC_CONTRATO) DEUDATOTALNETA_ANT, NVL(TDC.DC_DEUDACUOTA, 0) DEUDACUOTA,' +
          ' TDC.DC_PERIODOSCUOTA CANTPERIODOSCUOTA, NVL(TDC.DC_SALDOTOTAL, 0) SALDOTOTAL,' +
          ' NVL(TDC.DC_SALDOACREEDOR, 0) SALDOACREEDOR, TDC.DC_MAYORDEVENGADO*2 MAYORDEVENGADO,' +
          ' NVL(TDC.DC_MONTOREFINANCIADO, 0) MONTOREFINANCIADO,' +
          ' TDC.DC_PERIODOSREFINANCIADOS CANTPERIODOSREFINANCIADOS,' +
          ' NVL(TDC.DC_MONTOREFINANCIADOPEND, 0) MONTOREFINANCIADOPENDIENTE, TDC.DC_PROXIMOVENCIMIENTO VENCIMIENTO,' +
          ' NVL(TDC.DC_ILTCOMPENSABLE, 0) MONTOILTCOMPENSABLE, NVL(TDC.DC_SALDOQUIEBRA, 0) MONTOSALDOQUIEBRA,' +
          ' TDC.DC_EMPLEADOS CANTEMPLEADOS, TDC.DC_PRIMERPERDEUDACOMPL PRIMERPERDEUDACOMPL,' +
          ' TDC.DC_PRIMERPERDEUDADIF PRIMERPERDEUDADIF, TDC.DC_VIGENCIATARIFAANTERIOR VIGENCIATARIFAANTERIOR,' +
          ' TDC.DC_MAYORDEVCONEMPLEADOS MAYORDEVCONEMPLEADOS,' +
          ' NVL(TDC.DC_DEUDACUOTADIFERENCIA, 0) DEUDACUOTADIFERENCIA, TDC.DC_RECLAMOAFIP DC_RECLAMOAFIP,' +
          ' NVL(TDC.DC_DEUDACUOTA, 0) + NVL(TDC.DC_DEUDACUOTADIFERENCIA, 0) DEUDATOTEXIGIBLE,' +
          ' NVL(TDC.DC_SALDOCONCURSO, 0) DC_SALDOCONCURSO, TC_VIGENCIATARIFA, CTBESTADO.TB_DESCRIPCION CTBESTADODESCR,' +
          ' CO_FECHABAJA FBAJA, CTBMBAJA.TB_DESCRIPCION CTBMBAJADESCR, CO_VIGENCIADESDE VIGDESDECONTRATO,' +
          ' CO_VIGENCIAHASTA VIGHASTACONTRATO, CO_MOTIVOBAJA, CO_ESTADO, TDC.DC_ULTPERDEUDACOMPL ULTPERDEUDACOMPL,' +
          ' UC_IDSELECCION ULT_IDSELECCION_CONTR, UC_DESCPLAN DESCR_ULT_SELECCION_CONTR, UC_FECHA FECHA_ULT_SELECCION_CONTR,' +
          ' TDC.DC_SDOACREDEVDEFINITIVO, COBRANZA.GET_TOTALVALORESRECH(CO_CONTRATO) TOTALVALORESRECH,' +
          ' TDC.DC_ULTPERSDOACREDEVDEFINITIVO, TDC.DC_TOTSALDOACREEDOR TOT799, DC_ULTPERSALDOACREEDOR ULTPER799,' +
          ' TDC.DC_CANTCONTRATOANT CANTCONTR_ANTERIOR, ENTIDADMANT.EN_CODBANCO CODENTIDAD_MANT,' +
          ' ENTIDADMANT.EN_NOMBRE NOMBREENTIDAD_MANT, ADC.DC_LOCALIDAD LOCALIDAD,' +
          ' CANAL.CA_DESCRIPCION DESCRIPCION_CANAL, CANAL.CA_CODIGO CODIGO_CANAL, AFILIACION.GET_CODREGIMENCONTRATOAFI(CO_CONTRATO) CODREGIMEN,' +
          ' TDC.DC_ULTPERDEUDADIF ULTPERDEUDADIF, TDC.DC_TOTSALDOACREEDORDDJJ TOT799DDJJ, DC_ULTPERSALDOACREEDORDDJJ ULTPER799DDJJ, ' +
          ' AFILIACION.GET_CANTCARTASDOCIMPRESAS(CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_INTIMACION) + ') + ' +
          ' AFILIACION.GET_CANTCARTASDOCIMPRESAS(CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_RESCISION) + ') + ' +
          ' AFILIACION.GET_CANTCARTASDOCIMPRESAS(CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_ESTCTACARTAC) + ') CANTCARTASDOCIMPRESAS, ' +
          ' DEUDA.GET_ULTEMISION(CO_CONTRATO) TOTEMISION, NVL(TDC.DC_SALDOINTERES, 0) SALDOINTERES, ' +
          ' AFILIACION.IS_EMPRESAVIP(CO_CONTRATO) ESVIP, COBRANZA.GET_BASEAMPLIADADESDE(CO_CONTRATO) BASEAMPLDESDE, ' +
          '(SELECT EN_NOMBRE' +
          '   FROM XGO_GRANORGANIZADOR, XEN_ENTIDAD' +
          '  WHERE GO_IDENTORGANIZADOR = EN_ID' +
          '    AND GO_FECHABAJA IS NULL' +
          '    AND GO_FECHAAPROBADO IS NOT NULL' +
          '    AND LEVEL = 1' +
          '  START WITH GO_IDENTIDAD = EV_IDENTIDAD' +
          '  CONNECT BY NOCYCLE PRIOR GO_IDENTORGANIZADOR = GO_IDENTIDAD) ORGANIZADOR' +
     ' FROM CTB_TABLAS CTBESTADO, CTB_TABLAS CTBMBAJA, CTB_TABLAS CTBCARGO, AGE_GRUPOECONOMICO,' +
          ' CTB_TABLAS CTBCODRECEPRESCISION, CTB_TABLAS CTBCODRECEPINTIMACION, CTB_TABLAS CTBCODRECEPCOMERCIAL,' +
          ' CTB_TABLAS CTBSECTOR, AGC_GESTORCUENTA ESTJUR, AGC_GESTORCUENTA GESTOR, AEC_EJECUTIVOCUENTA AECEJCTA,' +
          ' AEC_EJECUTIVOCUENTA AECEJENT, ACA_CANAL CANAL, XVE_VENDEDOR, XEN_ENTIDAD ENTIDAD, XEV_ENTIDADVENDEDOR,' +
          'AVC_VENDEDORCONTRATO, XEN_ENTIDAD ENTIDADMANT, CCA_CARTA CCACOMERCIAL, CCA_CARTA CCARESCISION, CCA_CARTA CCAINTIMACION,' +
          ' ATC_TARIFARIOCONTRATO, CAC_ACTIVIDAD, ACT_CONTACTO, CPV_PROVINCIAS, V_ZUC_ULTACCIONCONTRATO,' +
          ' ADC_DOMICILIOCONTRATO ADC, TDC_DEUDACOBRANZA TDC, AEM_EMPRESA, ACO_CONTRATO, TCG_CONTRATOSSELGESTION' +
    ' WHERE CO_IDEMPRESA = EM_ID' +
      ' AND CTBESTADO.TB_CODIGO = CO_ESTADO' +
      ' AND CTBESTADO.TB_CLAVE = ''AFEST''' +
      ' AND CTBMBAJA.TB_CODIGO(+) = CO_MOTIVOBAJA' +
      ' AND CTBMBAJA.TB_CLAVE(+) = ''MOTIB''' +
      ' AND CTBSECTOR.TB_CODIGO = EM_SECTOR' +
      ' AND CTBSECTOR.TB_CLAVE = ''SECT''' +
      ' AND GE_ID(+) = EM_IDGRUPOECONOMICO' +
      ' AND CTBCARGO.TB_CODIGO(+) = CT_CARGO' +
      ' AND CTBCARGO.TB_CLAVE(+) = ''CARGO''' +
      ' AND ADC.DC_CONTRATO = CO_CONTRATO' +
      ' AND ADC.DC_TIPO = ''L''' +
      ' AND ADC.DC_PROVINCIA = PV_CODIGO' +
      ' AND AFILIACION.GET_IDCONTACTOEMPRESA(EM_CUIT) = CT_ID' +
      ' AND CO_IDACTIVIDAD = AC_ID' +
      ' AND CO_CONTRATO = TC_CONTRATO' +
      ' AND CO_CONTRATO = UC_CONTRATO(+)' +
      ' AND AFILIACION.GET_IDULTIMACARTADOCIMPRESA(CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_INTIMACION) + ') = CCAINTIMACION.CA_ID(+)' +
      ' AND AFILIACION.GET_IDULTIMACARTADOCIMPRESA(CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_RESCISION) + ') = CCARESCISION.CA_ID(+)' +
      ' AND AFILIACION.GET_IDULTIMACARTADOCIMPRESA(CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_ESTCTACARTAC) + ') = CCACOMERCIAL.CA_ID(+)' +
      ' AND CTBCODRECEPINTIMACION.TB_CLAVE(+) = ''CODRE''' +
      ' AND CTBCODRECEPINTIMACION.TB_CODIGO(+) = CCAINTIMACION.CA_CODRECEPCION' +
      ' AND CTBCODRECEPRESCISION.TB_CLAVE(+) = ''CODRE''' +
      ' AND CTBCODRECEPRESCISION.TB_CODIGO(+) = CCARESCISION.CA_CODRECEPCION' +
      ' AND CTBCODRECEPCOMERCIAL.TB_CLAVE(+) = ''CODRE''' +
      ' AND CTBCODRECEPCOMERCIAL.TB_CODIGO(+) = CCACOMERCIAL.CA_CODRECEPCION' +
      ' AND VC_ID(+) = COMISION.GET_ULTIDENTIDADVENDCONTRATO(CO_CONTRATO, SYSDATE, ''N'', ' + SqlValue(FormatDateTime('yyyymm', DBDate)) + ')' +
      ' AND VC_IDENTIDADVEND = EV_ID(+)' +
      ' AND EV_IDVENDEDOR = VE_ID(+)' +
      ' AND EV_IDENTIDAD = ENTIDAD.EN_ID(+)' +
      ' AND VE_IDCANAL = CANAL.CA_ID(+)' +
      ' AND COMISION.GET_IDENTIDADMANTCUENTA(CO_CONTRATO) = ENTIDADMANT.EN_ID(+)' +
      ' AND CO_IDGESTOR = GESTOR.GC_ID(+)' +
      ' AND GESTOR.GC_ESTUDIO(+) = ''N''' +
      ' AND CO_IDESTUDIO = ESTJUR.GC_ID(+)' +
      ' AND ESTJUR.GC_ESTUDIO(+) = ''S''' +
      ' AND CO_IDEJECUTIVO = AECEJCTA.EC_ID(+)' +
      ' AND ENTIDAD.EN_IDEJECUTIVO = AECEJENT.EC_ID(+)' +
      ' AND CO_CONTRATO = TDC.DC_CONTRATO' +
      ' AND CG_CONTRATO = CO_CONTRATO' +
      ' AND CG_USUARIO = ' + SqlValue(Sesion.UserID) + 
            Get_CondicionUsuario();

  sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;

  inherited;

  InicializarContadores(True);
end;

procedure TfrmGestionArmarSelEmpresas.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;

  fraEmpresa.ShowBajas     := True;
  fraStaticCTBSector.Clave := 'SECT';

  sSql :=
    'SELECT GC_ID ' + CD_ALIAS_ID + ', GC_ID ' + CD_ALIAS_CODIGO + ', GC_NOMBRE ' + CD_ALIAS_DESC + ', GC_FECHABAJA ' +
            CD_ALIAS_BAJA +
     ' FROM USE_USUARIOS, AGC_GESTORCUENTA' +
    ' WHERE GC_USUARIO = SE_USUARIO(+)' +
      ' AND SE_SECTOR = ''COB''';
  fraStaticGestor.Sql := sSql;

  sSql :=
    'SELECT GC_ID ' + CD_ALIAS_ID + ', GC_ID ' + CD_ALIAS_CODIGO + ', GC_NOMBRE ' + CD_ALIAS_DESC + ', GC_FECHABAJA ' +
            CD_ALIAS_BAJA +
     ' FROM AGC_GESTORCUENTA' +
    ' WHERE GC_USUARIO IS NULL' +
      ' AND GC_ESTUDIO = ''S''';
  fraStaticEstudio.Sql := sSql;

  with fraStaticEjecutivo do
  begin
    TableName   := 'AEC_EJECUTIVOCUENTA';
    FieldID     := 'EC_ID';
    FieldCodigo := 'EC_ID';
    FieldDesc   := 'EC_NOMBRE';
    FieldBaja   := 'EC_FECHABAJA';
  end;

  with fraStaticProvincia do
  begin
    TableName   := 'CPV_PROVINCIAS';
    FieldID     := 'PV_CODIGO';
    FieldCodigo := 'PV_CODIGO';
    FieldDesc   := 'PV_DESCRIPCION';
  end;

  fraEntidad.ShowBajas  := True;
  fraVendedor.ShowBajas := True;

  tbAgregarContratos.Left    := 108;

  pbHayDatosAgregarContratos := False;
  psSqlSELECTBusqueda        := '';

  OpenQuery(sdqEstadosEmpresa);
  OpenQuery(sdqMotivosBaja);

  pgFiltros.ActivePage := tsFiltro1;
  ActiveControl := fraEmpresa.mskCUIT;

  LoadTree;

  tbExportar.Enabled := Seguridad.Activar(tbExportar);
end;

procedure TfrmGestionArmarSelEmpresas.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('SUMAFIJA') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('SUMAFIJA')).Currency := True;

  if sdqConsulta.FieldByName('PORCMASA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORCMASA')).DisplayFormat := '% 0.0000;-% 0.0000';

  if sdqConsulta.FieldByName('DEUDATOTAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDATOTAL')).Currency := True;

  if sdqConsulta.FieldByName('DEUDACUOTA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDACUOTA')).Currency := True;

  if sdqConsulta.FieldByName('SALDOACREEDOR') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SALDOACREEDOR')).Currency := True;

  if sdqConsulta.FieldByName('MAYORDEVENGADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MAYORDEVENGADO')).Currency := True;

  if sdqConsulta.FieldByName('MONTOREFINANCIADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTOREFINANCIADO')).Currency := True;

  if sdqConsulta.FieldByName('MONTOREFINANCIADOPENDIENTE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTOREFINANCIADOPENDIENTE')).Currency := True;

  if sdqConsulta.FieldByName('MONTOILTCOMPENSABLE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTOILTCOMPENSABLE')).Currency := True;

  if sdqConsulta.FieldByName('MONTOSALDOQUIEBRA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MONTOSALDOQUIEBRA')).Currency := True;

  if sdqConsulta.FieldByName('MAYORDEVCONEMPLEADOS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('MAYORDEVCONEMPLEADOS')).Currency := True;

  if sdqConsulta.FieldByName('DEUDACUOTADIFERENCIA') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDACUOTADIFERENCIA')).Currency := True;

  if sdqConsulta.FieldByName('DC_RECLAMOAFIP') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DC_RECLAMOAFIP')).Currency := True;

  if sdqConsulta.FieldByName('DC_SALDOCONCURSO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DC_SALDOCONCURSO')).Currency := True;

  if sdqConsulta.FieldByName('DEUDATOTEXIGIBLE') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDATOTEXIGIBLE')).Currency := True;

  if sdqConsulta.FieldByName('SALDOTOTAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SALDOTOTAL')).Currency := True;

  if sdqConsulta.FieldByName('DEUDATOTALNETA_ANT') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDATOTALNETA_ANT')).Currency := True;

  if sdqConsulta.FieldByName('DC_SDOACREDEVDEFINITIVO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DC_SDOACREDEVDEFINITIVO')).Currency := True;

  if sdqConsulta.FieldByName('TOTALVALORESRECH') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOTALVALORESRECH')).Currency := True;

  if sdqConsulta.FieldByName('TOT799') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOT799')).Currency := True;

  if sdqConsulta.FieldByName('TOTEMISION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOTEMISION')).Currency := True;

  if sdqConsulta.FieldByName('TOT799DDJJ') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TOT799DDJJ')).Currency := True;

  if sdqConsulta.FieldByName('SALDOINTERES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SALDOINTERES')).Currency := True;
end;

procedure TfrmGestionArmarSelEmpresas.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresa.Clear;
  fraStaticCTBSector.Clear;
  fraStaticCTBHolding.Clear;
  edDeudaTotalDesde.Clear;
  edDeudaTotalHasta.Clear;
  edDeudaCuotaDesde.Clear;
  edDeudaCuotaHasta.Clear;
  edDeudaCuotaDifDesde.Clear;
  edDeudaCuotaDifHasta.Clear;
  edInteresesDevDsDesde.Clear;
  edInteresesDevDsHasta.Clear;
  edVigTarifaDesde.Clear;
  edVigTarifaHasta.Clear;
  edMayorDevUltAnioDesde.Clear;
  edMayorDevUltAnioHasta.Clear;
  edFBajaDesde.Clear;
  edFBajaHasta.Clear;
  cmbEstadoEmpresa.Clear;
  cmbMotivoBaja.Clear;
  fraStaticGestor.Clear;
  fraStaticEstudio.Clear;
  fraStaticEjecutivo.Clear;
  fraStaticActividad.Clear;
  fraStaticProvincia.Clear;
  fraOrganizador.Clear;
  fraEntidad.Clear;
  fraVendedor.Entidad := ART_EMPTY_ID;
  fraVendedor.Clear;
  rgSaldroAcreedor.ItemIndex := 0;
  rgReclamoAFIP.ItemIndex    := 0;
  rgConcurso.ItemIndex       := 0;
  rgQuiebra.ItemIndex        := 0;
  rgILT.ItemIndex            := 0;
  rgSuss.ItemIndex           := 0;
  rgCartaDocumento.ItemIndex := 0;
  rgSIC.ItemIndex            := 0;
  rgRefinanciacion.ItemIndex := 0;
  edCantPerCuotaDesde.Value  := 0;
  edCantPerCuotaHasta.Value  := 0;
  edCapitasDesde.Value       := 0;
  edCapitasHasta.Value       := 0;
  rgSaldoAcreedorAjust.ItemIndex := 0;

  pgFiltros.ActivePage := tsFiltro1;
  fraEmpresa.mskCUIT.SetFocus;

  pbHayDatosAgregarContratos := False;
  psSqlSELECTBusqueda        := '';

  InicializarContadores(True);
end;

procedure TfrmGestionArmarSelEmpresas.InicializarContadores(ActualizarCantContratos: Boolean);
begin
  edCantContratos.Value := 0;
  if ActualizarCantContratos then
    CalcularCantTotalReg;
end;

procedure TfrmGestionArmarSelEmpresas.CalcularFilasSel;
begin
  edCantContratos.Value := grid.SelectedRows.Count;
end;

procedure TfrmGestionArmarSelEmpresas.CalcularCantTotalReg;
begin
  if sdqConsulta.Active and tbCalcularTotal.Down then
    edTotalContratos.Value  := sdqConsulta.RecordCount
  else
    edTotalContratos.Value  := 0;
end;

procedure TfrmGestionArmarSelEmpresas.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularCantTotalReg;
end;

procedure TfrmGestionArmarSelEmpresas.tbOrdenarClick(Sender: TObject);
begin
  inherited;

  InicializarContadores(False);
end;

procedure TfrmGestionArmarSelEmpresas.GridCellClick(Column: TColumn);
begin
  CalcularFilasSel;
end;

procedure TfrmGestionArmarSelEmpresas.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilasSel;
end;

procedure TfrmGestionArmarSelEmpresas.tbAgregarContratosClick(Sender: TObject);
var
  Archivo: TextFile;
  iContrato: Integer;  
  sCondicion: String;
  sSql: String;
  sSqlSELECT: String;
  sUsuario: String;
  Temp: String;
begin
  inherited;

  Do_LimpiarTablaTemporal('TCG_CONTRATOSSELGESTION', 'CG_USUARIO', Sesion.UserID);

  sUsuario := SqlValue(Sesion.UserID);

  OpenDialog.Title      := 'Archivo de contratos';
  OpenDialog.DefaultExt := 'txt';
  OpenDialog.Filter     := 'Archivos de Texto(*.txt)|*.txt';

  if OpenDialog.Execute then
  try
    try
      //sSqlWhere := Get_Filtros();

      AssignFile(Archivo, OpenDialog.FileName);
      Reset(Archivo);

      while (not Eof(Archivo)) do
      begin
        Readln(Archivo, Temp);

        if Trim(temp) <> '' then
        begin
          iContrato := StrToInt(Temp);

          if iContrato <> 0 then //Con esto chequeo que no ingrese cualquier cosa
          begin
            pbHayDatosAgregarContratos := True;

            sCondicion :=
              ' AND CO_CONTRATO = ' + SqlValue(iContrato) +
              ' AND NOT EXISTS (SELECT 1' +
                                ' FROM TCG_CONTRATOSSELGESTION' +
                               ' WHERE CG_USUARIO = ' + sUsuario +
                                 ' AND CG_CONTRATO = ' + SqlValue(iContrato) + ')';

            sSql := Get_InsertTemporal(sCondicion, sSqlSELECT);

            try
              EjecutarSql(sSql);
            except
              Exception.Create('Error al crear la tabla temporal.');;
            end;
          end;
        end;
      end;

      if pbHayDatosAgregarContratos then
        tbRefrescarClick(nil);
    except
      MessageDlg('El archivo no posee un formato válido.', mtError, [mbOK], 0);
    end;
  finally
    CloseFile(Archivo);
  end;
end;

function TfrmGestionArmarSelEmpresas.Get_Filtros: String;
var
  sSqlWhere: String;
begin
  sSqlWhere := SqlBetween(' AND TDC.DC_PERIODOSCUOTA', edCantPerCuotaDesde.Value, edCantPerCuotaHasta.Value) +
               SqlBetween(' AND GREATEST(TDC.DC_DEUDATOTAL - NVL(TDC.DC_SALDOACREEDOR, 0), 0)', edDeudaTotalDesde.Value, edDeudaTotalHasta.Value) +
               SqlBetween(' AND TDC.DC_DEUDACUOTA', edDeudaCuotaDesde.Value, edDeudaCuotaHasta.Value) +
               SqlBetween(' AND TDC.DC_DEUDACUOTADIFERENCIA', edDeudaCuotaDifDesde.Value, edDeudaCuotaDifHasta.Value) +
               SqlBetween(' AND TDC.DC_EMPLEADOS', edCapitasDesde.Value, edCapitasHasta.Value) +
               SqlBetween(' AND TC_VIGENCIATARIFA', edVigTarifaDesde.Date, edVigTarifaHasta.Date) +
               SqlBetween(' AND CO_FECHABAJA', edFBajaDesde.Date, edFBajaHasta.Date) +
               SqlBetween(' AND TDC.DC_MAYORDEVENGADO', edMayorDevUltAnioDesde.Value, edMayorDevUltAnioHasta.Value) +
               SqlBetween(' AND TDC.DC_SALDOINTERES', edInteresesDevDsDesde.Value, edInteresesDevDsHasta.Value);

  case rgSaldroAcreedor.ItemIndex of
    1:   // con
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_SALDOACREEDOR, 0) <> 0 ';
    2:   // sin
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_SALDOACREEDOR, 0) = 0 ';
  end;

  case rgSaldoAcreedorAjust.ItemIndex of
    1:   // con
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_TOTSALDOACREEDOR, 0) <> 0 ';
    2:   // sin
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_TOTSALDOACREEDOR, 0) = 0 ';
  end;

  case rgReclamoAFIP.ItemIndex of
    1:   // con
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_RECLAMOAFIP, 0) <> 0 ';
    2:   // sin
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_RECLAMOAFIP, 0) = 0 ';
  end;

  case rgConcurso.ItemIndex of
    1:   // con
      sSqlWhere := sSqlWhere + ' AND EM_FECHACONCURSO IS NOT NULL ';
    2:   // sin
      sSqlWhere := sSqlWhere + ' AND EM_FECHACONCURSO IS NULL ';
  end;

  case rgQuiebra.ItemIndex of
    1:   // con
      sSqlWhere := sSqlWhere + ' AND EM_FECHAQUIEBRA IS NOT NULL ';
    2:   // sin
      sSqlWhere := sSqlWhere + ' AND EM_FECHAQUIEBRA IS NULL ';
  end;

  case rgILT.ItemIndex of
    1:   // con
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_ILTCOMPENSABLE, 0) <> 0 ';
    2:   // sin
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_ILTCOMPENSABLE, 0) = 0 ';
  end;

  case rgRefinanciacion.ItemIndex of
    1:   // con
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_MONTOREFINANCIADOPEND, 0) <> 0 ';
    2:   // sin
      sSqlWhere := sSqlWhere + ' AND NVL(TDC.DC_MONTOREFINANCIADOPEND, 0) = 0 ';
  end;

  case rgSuss.ItemIndex of
    1:   // SUSS
      sSqlWhere := sSqlWhere + ' AND EM_SUSS = ''1'' ';
    2:   // No SUSS
      sSqlWhere := sSqlWhere + ' AND EM_SUSS = ''2'' ';
    3:   // Mixta
      sSqlWhere := sSqlWhere + ' AND EM_SUSS = ''3'' ';
  end;

  case rgCartaDocumento.ItemIndex of
    1:   // Si
      sSqlWhere := sSqlWhere + ' AND (CCAINTIMACION.CA_NROCARTADOC IS NOT NULL OR CCARESCISION.CA_NROCARTADOC IS NOT NULL OR CCACOMERCIAL.CA_NROCARTADOC IS NOT NULL) ';
    2:   // No
      sSqlWhere := sSqlWhere + ' AND (CCAINTIMACION.CA_NROCARTADOC IS NULL AND CCARESCISION.CA_NROCARTADOC IS NULL AND CCACOMERCIAL.CA_NROCARTADOC IS NULL) ';
  end;

  case rgSIC.ItemIndex of
    0:   // Ver todo
      sSqlWhere := sSqlWhere + ' ';
    1:   // Sólo con gestión de deuda activa
      sSqlWhere := sSqlWhere + ' AND EXISTS (SELECT 1 FROM AGENDA.AAT_AGENDATAREA WHERE AT_CONTRATO = CO_CONTRATO AND AT_ESTADO = 1 AND AT_IDTIPOEVENTO = 314 AND AT_IDEVENTOTAREA IS NULL) ';
  end;

  if cmbEstadoEmpresa.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND CO_ESTADO ' + cmbEstadoEmpresa.InSql;

  if cmbMotivoBaja.Text <> '' then
    sSqlWhere := sSqlWhere + ' AND CO_MOTIVOBAJA ' + cmbMotivoBaja.InSql;

  if not fraEmpresa.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CO_CONTRATO = ' + SqlValue(fraEmpresa.edContrato.Value);

  if not fraStaticCTBSector.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND EM_SECTOR = ' + SqlValue(fraStaticCTBSector.Value);

  if not fraStaticCTBHolding.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND EM_IDGRUPOECONOMICO = ' + SqlValue(fraStaticCTBHolding.Value);

  if not fraStaticGestor.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CO_IDGESTOR = ' + SqlValue(fraStaticGestor.Value);

  if not fraStaticEstudio.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CO_IDESTUDIO = ' + SqlValue(fraStaticEstudio.Value);

  if not fraStaticEjecutivo.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CO_IDEJECUTIVO = ' + SqlValue(fraStaticEjecutivo.Value);

  if not fraStaticActividad.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND CO_IDACTIVIDAD = ' + SqlValue(fraStaticActividad.Value);

  if fraVendedor.IsSelected and not fraEntidad.IsSelected then
    sSqlWhere := sSqlWhere + ' AND EV_IDVENDEDOR = ' + SqlValue(fraVendedor.Value)
  else if fraVendedor.IsSelected then
    sSqlWhere := sSqlWhere + ' AND VC_IDENTIDADVEND = ' + SqlValue(fraVendedor.EntidadVendedor)
  else if fraEntidad.IsSelected then
    sSqlWhere := sSqlWhere + ' AND EV_IDENTIDAD = ' + SqlValue(fraEntidad.Value);

  if not fraStaticProvincia.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND ADC.DC_PROVINCIA = ' + SqlValue(fraStaticProvincia.Value);

  if not fraOrganizador.IsEmpty then
    sSqlWhere := sSqlWhere + ' AND EV_IDENTIDAD IN (SELECT GO_IDENTIDAD' +
                                                    ' FROM XGO_GRANORGANIZADOR' +
                                                   ' WHERE GO_FECHABAJA IS NULL' +
                                                     ' AND GO_FECHAAPROBADO IS NOT NULL' +
                                                     ' AND LEVEL = 1' +
                                              ' START WITH GO_IDENTORGANIZADOR = ' + SqlValue(fraOrganizador.Value) +
                                              ' CONNECT BY NOCYCLE PRIOR GO_IDENTIDAD = GO_IDENTORGANIZADOR)';

  Result := sSqlWhere;
end;

function TfrmGestionArmarSelEmpresas.Get_InsertTemporal(CondicionAdicional: String; var sSqlSELECT: String): String;
var
  sHint, sSqlINSERT: String;
begin
  sHint      := GetHint();
  sSqlINSERT := 'INSERT INTO TCG_CONTRATOSSELGESTION(CG_USUARIO, CG_CONTRATO) ';

  sSqlSELECT :=
   ' SELECT ' + sHint + ' ' + SqlValue(Sesion.UserID) + ', CO_CONTRATO' +
     ' FROM CCA_CARTA CCACOMERCIAL, CCA_CARTA CCARESCISION, CCA_CARTA CCAINTIMACION, XEV_ENTIDADVENDEDOR,' +
          ' AVC_VENDEDORCONTRATO, ATC_TARIFARIOCONTRATO, ADC_DOMICILIOCONTRATO ADC, AEM_EMPRESA, ACO_CONTRATO,' +
          ' TDC_DEUDACOBRANZA TDC' +
    ' WHERE CO_IDEMPRESA = EM_ID' +
      ' AND CO_CONTRATO = TDC.DC_CONTRATO' +
      ' AND CO_CONTRATO = TC_CONTRATO' +
      ' AND CO_CONTRATO = ADC.DC_CONTRATO' +
      ' AND ADC.DC_TIPO = ''L''' +
      ' AND VC_ID(+) = COMISION.GET_ULTIDENTIDADVENDCONTRATO(CO_CONTRATO)' +
      ' AND VC_IDENTIDADVEND = EV_ID(+)' +
      ' AND AFILIACION.GET_IDULTIMACARTADOCIMPRESA(CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_INTIMACION) + ') = CCAINTIMACION.CA_ID(+)' +
      ' AND AFILIACION.GET_IDULTIMACARTADOCIMPRESA(CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_RESCISION) + ') = CCARESCISION.CA_ID(+)' +
      ' AND AFILIACION.GET_IDULTIMACARTADOCIMPRESA(CO_CONTRATO, ' + SqlValue(AREA_COB) + ', ' + SqlValue(MODULO_ESTCTACARTAC) + ') = CCACOMERCIAL.CA_ID(+) ' +
            Get_Filtros() +
            CondicionAdicional;

  Result := sSqlINSERT + sSqlSELECT + Get_CondicionUsuario();
end;

procedure TfrmGestionArmarSelEmpresas.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilasSel;
end;

procedure TfrmGestionArmarSelEmpresas.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  InicializarContadores(True);
end;

procedure TfrmGestionArmarSelEmpresas.QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  if Field.DataField <> 'CANTEMPLEADOS' then
    Value := FormatCurr('$ ###,##0.00', Field.TotalValue);
end;

procedure TfrmGestionArmarSelEmpresas.btnPlanAceptarClick(Sender: TObject);
begin
  if ValidarPlan then
    if Do_GrabarPlan then
      fpAsignarPlan.ModalResult := mrOk;
end;

procedure TfrmGestionArmarSelEmpresas.fpAsignarPlanEnter(Sender: TObject);
begin
  edDescripcionPlan.Clear;
end;

procedure TfrmGestionArmarSelEmpresas.tbNuevoClick(Sender: TObject);
begin
  if ValidarSeleccionPlan then
    if fpAsignarPlan.ShowModal = mrOk then
      tbLimpiarClick(nil);
end;

function TfrmGestionArmarSelEmpresas.ValidarPlan: Boolean;
begin
  Result := False;

  if not Assigned(tvPlanAccion.Selected) then
    InvalidMsg(tvPlanAccion, 'Debe seleccionar un plan de acción.')
  else if Trim(edDescripcionPlan.Text) = '' then
    InvalidMsg(edDescripcionPlan, 'La descripción del plan es obligatoria.')
  else
    Result := True
end;

function TfrmGestionArmarSelEmpresas.ValidarSeleccionPlan: Boolean;
begin
  Result := False;

  if (not sdqConsulta.Active) or sdqConsulta.IsEmpty then
    InvalidMsg(Grid, 'No ha realizado ninguna búsqueda de empresas.')
  else if Grid.SelectedRows.Count = 0 then
    InvalidMsg(Grid, 'No ha seleccionado ninguna empresa de la grilla.')
  else
    Result := True
end;

function TfrmGestionArmarSelEmpresas.Do_GrabarPlan: Boolean;
var
  IdEncabezadoPlan: TTableId;
  IdGestor: TTableId;
  NroSeleccion: TTableId;
  sDescrPlan: String;
  sMensaje: String;
  sSql: String;
  sTipoAgrupacion: String;
begin
  Do_MarcarContratosSeleccionados;

  BeginTrans;
  try
    NroSeleccion     := ART_EMPTY_ID;
    IdEncabezadoPlan := Integer(tvPlanAccion.Selected.Data);
    sTipoAgrupacion  := Get_TipoAgrupacionPlan(IdEncabezadoPlan);

    if sTipoAgrupacion = 'G' then   // selecciones por Gestor
    begin
      sDescrPlan := Trim(edDescripcionPlan.Text) + ' - ';

      sSql :=
        'SELECT GC_ID ID_GESTOR, GC_NOMBRE NOMBRE_GESTOR' +
         ' FROM AGC_GESTORCUENTA, ACO_CONTRATO, TCG_CONTRATOSSELGESTION' +
        ' WHERE CG_USUARIO=' + SqlValue(Sesion.UserID) +
          ' AND CG_SELECCIONADO = ''S''' +
          ' AND CG_CONTRATO = CO_CONTRATO' +
          ' AND CO_IDGESTOR = GC_ID' +
     ' GROUP BY GC_ID, GC_NOMBRE';

      with GetQuery(sSql) do
      try
        while not Eof do
        begin
          IdGestor     := FieldByName('ID_GESTOR').AsInteger;
          NroSeleccion := Do_CrearSeleccion(IdEncabezadoPlan, IdGestor, sDescrPlan + FieldByName('NOMBRE_GESTOR').AsString);

          Do_InsertarContratosSeleccionPlan(NroSeleccion, IdGestor);

          Next;
        end;
      finally
        Free;
      end;
    end
    else
    begin
      IdGestor     := ART_EMPTY_ID;
      NroSeleccion := Do_CrearSeleccion(IdEncabezadoPlan, IdGestor, edDescripcionPlan.Text);

      Do_InsertarContratosSeleccionPlan(NroSeleccion, IdGestor);
    end;

    CommitTrans;

    if sTipoAgrupacion = '' then
      sMensaje := 'Los datos se grabaron correctamente.' + CRLF + 'El nro. de selección asignado es: ' + IntToStr(NroSeleccion) + '.'
    else
      sMensaje := 'Los datos de las distintas selecciones generadas se grabaron correctamente.';
    MsgBox( sMensaje, MB_ICONINFORMATION + MB_OK );

    Result := True;
  except
    on E: Exception do
    begin
      RollBack;
      raise Exception.Create(E.Message + CRLF + 'Error al grabar la selección.');
    end;
  end;
end;

procedure TfrmGestionArmarSelEmpresas.LoadTree;
var
  sSql,
  AAccionPlan: String;
  AParent: TTreeNode;
  AIdEncabezado: Integer;

  function AgregarNodo(AText: String; AImageIndex: Integer): TTreeNode;
  begin
    Result := tvPlanAccion.Items.AddChild(AParent, AText);
    Result.ImageIndex := AImageIndex;
    Result.SelectedIndex := AImageIndex;
    Result.Data := Ptr(AIdEncabezado);
  end;
  
begin
  sSql :=
    'SELECT CP_ID, CP_DESCRIPCION, AC_ID, AC_DESCRIPCION, EE_DESCRIPCION' +
     ' FROM ZCP_ENCABEZADOPLAN, ZPL_ACCIONENCABEZADOPLAN, ZAC_ACCIONPLAN, ZER_ACCIONEVENTOPLAN, ZEE_EVENTOPLAN' +
    ' WHERE PL_IDENCABEZADOPLAN = CP_ID' +
      ' AND PL_IDACCIONPLAN = AC_ID' +
      ' AND ER_IDACCIONPLAN = AC_ID' +
      ' AND ER_IDEVENTOPLAN = EE_ID' +
      ' AND CP_FECHABAJA IS NULL' +
 ' ORDER BY CP_DESCRIPCION, PL_ORDEN, ER_ORDEN';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      AParent := nil;
      AIdEncabezado := FieldByName('CP_ID').AsInteger;
      AParent := AgregarNodo(FieldByName('CP_DESCRIPCION').AsString, 0);

      while (not Eof) and (AIdEncabezado = FieldByName('CP_ID').AsInteger) do
      begin
        AAccionPlan := IntToStr(AIdEncabezado) + FieldByName('AC_ID').AsString;
        AParent := AgregarNodo(FieldByName('AC_DESCRIPCION').AsString, 1);

        while (not Eof) and (AAccionPlan = IntToStr(AIdEncabezado) + FieldByName('AC_ID').AsString) and (AIdEncabezado = FieldByName('CP_ID').AsInteger) do
        begin
          AgregarNodo(FieldByName('EE_DESCRIPCION').AsString, 2);
          Next;
        end;

        AParent := AParent.Parent;
      end;
    end;

    //tvPlanAccion.FullExpand;
    tvPlanAccion.Selected := nil;
  finally
    Free;
  end;
end;

procedure TfrmGestionArmarSelEmpresas.tvPlanAccionAdvancedCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
                                                                         State: TCustomDrawState;
                                                                         Stage: TCustomDrawStage; var PaintImages,
                                                                         DefaultDraw: Boolean);
begin
{  if Node.Data = tvPlanAccion.Selected.Data Then
    begin
      Include(State, cdsSelected);
      DefaultDraw := False;
    end;}
end;

procedure TfrmGestionArmarSelEmpresas.tvPlanAccionChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
  AllowChange := (Node.Parent = nil);
end;

procedure TfrmGestionArmarSelEmpresas.fraEntidadExit(Sender: TObject);
begin
  inherited;

  fraEntidad.FrameExit(Sender);
  fraVendedor.Entidad := fraEntidad.Value;
end;

function TfrmGestionArmarSelEmpresas.Get_CondicionUsuario: String;
begin
  Result := ' AND TDC.DC_USUARIO = ''SISTEMAS''';
end;

function TfrmGestionArmarSelEmpresas.Get_TipoAgrupacionPlan(IdEncabPlan: TTableId): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT CP_TIPOAGRUPACION' +
     ' FROM ZCP_ENCABEZADOPLAN' +
    ' WHERE CP_ID = ' + SqlValue(IdEncabPlan);

  Result := ValorSql(sSql);
end;

procedure TfrmGestionArmarSelEmpresas.Do_MarcarContratosSeleccionados;
var
  i: Integer;
  iContrato: Integer;
  sSql: String;
begin
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[i]));
      iContrato := sdqConsulta.FieldByName('CONTRATO').AsInteger;

      sSql :=
        'UPDATE TCG_CONTRATOSSELGESTION' +
          ' SET CG_SELECCIONADO = ''S''' +
        ' WHERE CG_USUARIO = ' + SqlValue(Sesion.UserID) + 
          ' AND CG_CONTRATO = ' + SqlValue(iContrato);
      EjecutarSql(sSql);
    end;
  except
    on E: Exception do
      raise Exception.Create(E.Message + CRLF + 'Error al actualizar temporal con la selección.');
  end;
end;

function TfrmGestionArmarSelEmpresas.Do_CrearSeleccion(IdEncabezadoPlan, IdGestor: TTableId; DescripcionPlan: String): TTableId;
var
  NroSeleccion: TTableId;
  sCondicionGestor: String;
  Sql: TSql;
  sSql: String;
begin
  sSql :=
    'SELECT NVL(MAX(SE_ID), 0) + 1' +
     ' FROM ZSE_SELECCIONPLAN';
  NroSeleccion := ValorSqlInteger(sSql);

  Sql := TSql.Create('ZSE_SELECCIONPLAN');
  try
    Sql.PrimaryKey.Add('SE_ID',           NroSeleccion);
    Sql.Fields.Add('SE_DESCRIPCION',      DescripcionPlan);
    Sql.Fields.Add('SE_IDENCABEZADOPLAN', IdEncabezadoPlan);
    Sql.Fields.Add('SE_IDGESTORCUENTA',   IdGestor, True);
    Sql.Fields.Add('SE_USUALTA',          Sesion.UserID);
    Sql.Fields.Add('SE_FECHAALTA',        exDate);

    if not pbHayDatosAgregarContratos then
    begin
      if IdGestor = ART_EMPTY_ID then
        sCondicionGestor := ''
      else
        sCondicionGestor := ' AND CO_IDGESTOR=' + SqlValue( IdGestor );  // cuando se agrupan las selecciones por gestor de cuenta

      Sql.Fields.Add('SE_SQLBUSQUEDA',     psSqlSELECTBusqueda + sCondicionGestor);
    end;

    Sql.SqlType := stInsert;
    EjecutarSqlST(Sql.Sql);

    Result := NroSeleccion;
  finally
    Sql.Free;
  end;
end;

procedure TfrmGestionArmarSelEmpresas.Do_InsertarContratosSeleccionPlan(NroSeleccion, IdGestor: TTableId);
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ZCP_ENCABEZADOPLAN, ZSE_SELECCIONPLAN ' +
           'WHERE SE_IDENCABEZADOPLAN = CP_ID ' +
             'AND CP_INDICADOR = ''S'' ' +
             'AND SE_ID = :Seleccion';

  if ExisteSqlEx(sSql, [NroSeleccion]) then
    begin
      sSql := 'INSERT INTO COB.ZIG_INDICADORGESTION( ' +
                          'IG_ID, IG_IDGESTOR, IG_IDSELECCIONPLAN, IG_FECHA, ' +
                          'IG_DEUDA, IG_DEUDAACTUAL, IG_CONTRATOS, IG_REGULARIZADOS, ' +
                          'IG_PAGOSPARCIALES, IG_SINPAGOS, IG_USUALTA, IG_FECHAALTA) ' +
                   'SELECT SEQ_ZIG_ID.NEXTVAL, IG_IDGESTOR, IG_IDSELECCIONPLAN, IG_FECHA, ' +
                          'IG_DEUDA, IG_DEUDAACTUAL, IG_CONTRATOS, IG_REGULARIZADOS, ' +
                          'IG_PAGOSPARCIALES, IG_SINPAGOS, ' + SqlValue( Sesion.UserID ) + ' , SYSDATE ' +
                     'FROM V_ZIG_INDICADORGESTION_TMP ' +
                    'WHERE IG_IDGESTOR = :IdGestor';
      EjecutarSqlSTEx(sSql, [IdGestor])
    end;

  sSql := 'INSERT INTO ZCS_CONTRATOSELECCIONADOPLAN(' +
                      'CS_ID, CS_IDSELECCIONPLAN, CS_CONTRATO, ' +
                      'CS_DEUDACUOTA, CS_PERIODOSCUOTA, CS_SALDOACREEDOR, ' +
                      'CS_MAYORDEVENGADO, CS_MONTOREFINANCIADO, CS_PERIODOSREFINANCIADOS, ' +
                      'CS_MONTOREFINANCIADOPEND, CS_ILTCOMPENSABLE, CS_SALDOQUIEBRA, ' +
                      'CS_PRIMERPERDEUDACOMPL, CS_PRIMERPERDEUDADIF, CS_MAYORDEVCONEMPLEADOS, ' +
                      'CS_DEUDACUOTADIFERENCIA, CS_RECLAMOAFIP, CS_SALDOCONCURSO, ' +
                      'CS_ESTADO, CS_MOTIVOBAJA, CS_TOTSALDOACREEDOR, CS_ULTPERSALDOACREEDOR, ' +
                      'CS_EMPLEADOS, CS_ULTPERDEUDADIF, CS_TOTSALDOACREEDORDDJJ, CS_ULTPERSALDOACREEDORDDJJ) ' +
        'SELECT SEQ_ZCS_ID.NEXTVAL, ' + SqlValue( NroSeleccion ) + ', CG_CONTRATO, ' +
               'TDC.DC_DEUDACUOTA DEUDACUOTA, TDC.DC_PERIODOSCUOTA CANTPERIODOSCUOTA, TDC.DC_SALDOACREEDOR SALDOACREEDOR, ' +
               'TDC.DC_MAYORDEVENGADO MAYORDEVENGADO, TDC.DC_MONTOREFINANCIADO MONTOREFINANCIADO, TDC.DC_PERIODOSREFINANCIADOS CANTPERIODOSREFINANCIADOS, ' +
               'TDC.DC_MONTOREFINANCIADOPEND MONTOREFINANCIADOPENDIENTE, TDC.DC_ILTCOMPENSABLE MONTOILTCOMPENSABLE, TDC.DC_SALDOQUIEBRA MONTOSALDOQUIEBRA, ' +
               'TDC.DC_PRIMERPERDEUDACOMPL PRIMERPERDEUDACOMPL, TDC.DC_PRIMERPERDEUDADIF PRIMERPERDEUDADIF, TDC.DC_MAYORDEVCONEMPLEADOS MAYORDEVCONEMPLEADOS, ' +
               'TDC.DC_DEUDACUOTADIFERENCIA DEUDACUOTADIFERENCIA, TDC.DC_RECLAMOAFIP DC_RECLAMOAFIP, TDC.DC_SALDOCONCURSO DC_SALDOCONCURSO, ' +
               'CO_ESTADO, CO_MOTIVOBAJA, DC_TOTSALDOACREEDOR, DC_ULTPERSALDOACREEDOR, DC_EMPLEADOS, TDC.DC_ULTPERDEUDADIF ULTPERDEUDADIF, ' +
               'DC_TOTSALDOACREEDORDDJJ, DC_ULTPERSALDOACREEDORDDJJ ' +
          'FROM TDC_DEUDACOBRANZA TDC, ACO_CONTRATO, TCG_CONTRATOSSELGESTION ' +
         'WHERE CG_USUARIO=' + SqlValue( Sesion.UserID ) + ' ' +
           'AND CG_SELECCIONADO=''S'' ' +
           'AND CG_CONTRATO=CO_CONTRATO ' +
           Iif(IdGestor = ART_EMPTY_ID, '', 'AND NVL(CO_IDGESTOR, 0)=' + SqlValue( IdGestor ) + ' ') +
           'AND CO_CONTRATO=TDC.DC_CONTRATO ' +
           Get_CondicionUsuario();

  EjecutarSqlST(sSql);
end;

procedure TfrmGestionArmarSelEmpresas.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if sdqConsulta.FieldByName('ESVIP').AsString = 'S' then
    AFont.Color := clPurple;

  if Highlight then
    Background := clTeal
  else
    Background := clInfoBk;
end;

procedure TfrmGestionArmarSelEmpresas.tbExportarClick(Sender: TObject);
var
  bExportacionAutom: Boolean;
begin
  if not sdqConsulta.Active or sdqConsulta.IsEmpty  then
    bExportacionAutom := (MsgBox('¿Desea realizar una exportación automática, utilizando los filtros actualmente indicados?', MB_ICONQUESTION + MB_YESNO) = IDYES)
  else
    bExportacionAutom := False;

  if bExportacionAutom then
    begin
      with SaveDialogExport do
        begin
          Filter     := 'Archivos de Excel|*.xls|Todos los Archivos (*.*)|*.*';
          DefaultExt := 'xls';

          if Execute then
            begin
              tbRefrescar.Click;

              if sdqConsulta.Active and not sdqConsulta.IsEmpty then
                begin
                  tbExportar.Enabled := False;
                  try
                    with ExportDialog do
                      try
                        Fields.Assign(Grid.Columns);

                        OutputFile := ChangeFileExt(FileName, '.' + DefaultExt);                        
                        SaveToFile;
                      finally
                        Fields.Clear;
                      end;
                  finally
                    tbExportar.Enabled := True;
                 end;
              end;
            end;
        end;
    end
  else
    inherited;
end;

procedure TfrmGestionArmarSelEmpresas.EnableButtons(AEnabled: Boolean);
begin
  inherited;
  tbExportar.Enabled := Seguridad.Activar(tbExportar);
end;

end.
