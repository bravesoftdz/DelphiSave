unit unGestionArrancarAccion;
 
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  ToolEdit, DateComboBox, StdCtrls, Mask, PatternEdit, IntEdit, unArt,
  Buttons, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, JvProgressBar,
  JvExControls, JvComponent, JvgProgress, Menus, CardinalEdit, RxToolEdit,
  RxPlacemnt;

type
  TfrmGestionArrancarAccion = class(TfrmCustomConsulta)
    PageControl: TPageControl;
    tsSelecciones: TTabSheet;
    tsPlanAccion: TTabSheet;
    tsEmpresas: TTabSheet;
    gbNroSeleccion: TGroupBox;
    edNroSeleccion: TIntEdit;
    gbFechaAlta: TGroupBox;
    Label1: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    GridEmpresa: TArtDBGrid;
    dsEmpresa: TDataSource;
    sdqEmpresa: TSDQuery;
    SortDialogEmpresa: TSortDialog;
    QueryPrintEmpresa: TQueryPrint;
    gbAccion: TGroupBox;
    GridAccion: TArtDBGrid;
    sdqAccion: TSDQuery;
    dsAccion: TDataSource;
    gbEvento: TGroupBox;
    GridEvento: TArtDBGrid;
    dsEvento: TDataSource;
    sdqEvento: TSDQuery;
    btnArrancarAccion: TBitBtn;
    sbProcesoAccion: TStatusBar;
    btnSaltearAccion: TBitBtn;
    rgEmpresas: TRadioGroup;
    gbEmpresa: TGroupBox;
    fraEmpresaSeleccion: TfraEmpresa;
    gbPlan: TGroupBox;
    fraPlan: TfraStaticCodigoDescripcion;
    JvgPrgrssBusquedaContr: TJvgProgress;
    chkVerificarCondicInicContratos: TCheckBox;
    gbGestorCuenta: TGroupBox;
    fraGestorCuenta: TfraStaticCodigoDescripcion;
    tbAgenda: TToolButton;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    pnlColores: TPanel;
    pnlColor2: TPanel;
    pnlColor1: TPanel;
    pmuImpresion: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirEstadoCuenta: TMenuItem;
    PanelFiltro: TPanel;
    chkFiltrarContrato: TCheckBox;
    mnuEmisionEstadodeCuenta: TMenuItem;
    ExportDialog2: TExportDialog;
    sdqConsulta2: TSDQuery;
    pmuGridEmpresas: TPopupMenu;
    mnuVerEventos: TMenuItem;
    mnuVerTareaAsociada: TMenuItem;
    tbTarea: TToolButton;
    pnlTotalRegistros: TPanel;
    edTotalRegistros: TCardinalEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure CheckButtons; override;
    procedure Enable_Buttons(AEnabled1, AEnabled2, AEnabled3: Boolean);
    procedure Do_InicializarVariables;
    procedure tbEliminarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqAccionAfterScroll(DataSet: TDataSet);
    procedure btnArrancarAccionClick(Sender: TObject);
    procedure btnSaltearAccionClick(Sender: TObject);
    procedure rgEmpresasClick(Sender: TObject);
    procedure sdqEmpresaAfterScroll(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridEmpresaPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirEstadoCuentaClick(Sender: TObject);
    procedure pmuImpresionPopup(Sender: TObject);
    procedure chkFiltrarContratoClick(Sender: TObject);
    procedure fraEmpresaSeleccionOnChange(Sender: TObject);
    procedure mnuEmisionEstadodeCuentaClick(Sender: TObject);
    procedure VerEventosSIC(Sender: TObject);
    procedure VerTareaAsociada(Sender: TObject);
    procedure GridEmpresaGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
  private
    pUltIdSeleccion, pUltIdSeleccion_PlanAcc, pUltIdAccion: TTableId;
    pUltEmpresa, pUltContrato: Integer;
    pUltFiltroContrato: Boolean;
    function Do_ArmarSqlContratos(IdSeleccion: TTableId): String;
    procedure Do_EliminarSeleccion(IdSeleccion: TTableId);
    procedure Do_EliminarEmpresaSeleccion(IdSeleccion: TTableId; Contrato: Integer);
    function Validar_EliminarSeleccion: Boolean;
    function Validar_EliminarEmpresaSeleccion: Boolean;
    function Existen_AccionesEjecutadas(IdSeleccion: TTableId): Boolean;
    procedure Do_CargarEventosAccion(IdAccion: TTableId);
    function Validar_ArrancarAccion(EsArrancarAccion: Boolean): Boolean;
    function Existen_EmpresasSeleccion(IdSeleccion: TTableId): Boolean;
    function Validar_AccionesGrilla(EsArrancarAccion: Boolean): Boolean;
    procedure Do_GrabarSeleccionAccion(IdSeleccion, IdAccion: TTableId; AccionEjecutada: String);
    procedure Do_GrabarUltAccionEjecutada(IdSeleccion, IdAccion: TTableId);
    procedure Do_CargarEmpresasSeleccion(IdSeleccion, IdAccion: TTableId; Contrato: Integer; FiltrarContrato: Boolean; SqlWhere: String);
    function Empresas_Seleccionar(IdSeleccion: TTableId): Boolean;
    procedure EstadoCuentaYRescision_Imprimir(IdSeleccion, IdAccion: TTableId; Parametros: String);
    procedure AnulacionRescision_Imprimir(IdSeleccion, IdAccion: TTableId);
    procedure Intimacion_Imprimir(IdSeleccion, IdAccion: TTableId; Parametros: String);
    procedure EstadoCuentaYCartaComercial_Imprimir(IdSeleccion, IdAccion: TTableId; Parametros: String);
    procedure Mail_Enviar(Parametros: String);
    function ImprimirCartaDocConFirma: Boolean;
    function ValidarCondicionesBusquedaContrato(Contrato: Integer; SqlBusqueda: String): Boolean;
    function IsPrimeraAccionPlan(IdSeleccion, IdAccion: TTableId): Boolean;
    procedure SetearBusquedaContratos(IdSeleccion: TTableId; VerificarCondicInicContratos: Boolean);
    function Is_ExcluirEmpresasPlan(IdSeleccion: TTableId): String;
    function Is_ExcluirContratoSeleccion(Excluir: String; Contrato: Integer): Boolean;
    procedure CalcTotalesEmpresas;
    function Is_ExisteArchivoEstCuentaFilaActual(var NombreArchivo: String): Boolean;
    procedure Do_InsRegSelecContrAccionPlan(IdSeleccion, IdAccion: TTableId; Contrato: Integer);
    procedure Do_InsRegSelecAccionPlan(IdSeleccion, IdAccion: TTableId);
    procedure DoMostrarMensajeFinVE;
    function SetTipoSalidaCarta: Boolean;
    function GetTipoSalidaCarta: String;
    function IsPermitirSaltearAccion(IdAccion: TTableId): Boolean;
  public
  end;

var
  TotalConsultaEmpr : array of extended;

const
  PAGINA_SELECCIONES = 0;
  PAGINA_PLANACCION  = 1;
  PAGINA_EMPRESAS    = 2;

  MAXCOLS = 20;
  CAMPOS_SUMA : array [0..MAXCOLS] of string = ('DEUDATOTAL', 'DEUDATOTAL_ACTUAL', 'DIFERENCIA', 'MONTOREFIN_ACTUAL', 'DEVANULADO_ACTUAL', 'RECLAFIP_ACTUAL', 'PAGOSINGR_ACTUAL', 'DEUDA_CUOTA_COMPL', 'SALDO_ACREEDOR', 'MAYOR_DEV', 'MONTO_REF', 'MONTO_REF_PEND', 'ILT_COMP', 'SDO_QUIEBRA', 'MAYOR_DEV_EMPL', 'DEUDA_DIF', 'REC_AFIP', 'SDO_CONCURSO', 'TOT799', 'TOTINTERESES_INT', 'TOTINTERESES_COM');

implementation

Uses
  unPrincipal, AnsiSql, unDmPrincipal, unComunes, General, CustomDlgs, SqlFuncs,
  unSeleccionarEmpresasAccion, unRptCartaDocumento, unRptCartaDocHeader, DbFuncs,
  unCustomDataModule, unQRF817, unCobranzas, unImpresionEstadoDeCuenta, Strfuncs,
  unImpoExpoWizard, VCLExtra, unEnvioMail, ArchFuncs, unMoldeEnvioMail, unEstadoCuenta,
  unEmpresasRescindidas, unEmpresasBajaTraspaso, unAgendaVistaEmpresa, unABMAgendaBaseTarea,
  unInterfaces;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  frmPrincipal.mnuGestionArrancarAccion.Enabled := True;
  Action := caFree;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.tbRefrescarClick(Sender: TObject);
var
  sSqlWhere, sSql: String;
  bPorSolapaEmpresas: Boolean;
begin
  bPorSolapaEmpresas := (PageControl.ActivePageIndex = PAGINA_EMPRESAS);

  sSqlWhere := SqlBetween( ' AND SE_FECHAALTA', edFechaAltaDesde.Date, edFechaAltaHasta.Date );

  if not bPorSolapaEmpresas and not fraEmpresaSeleccion.IsEmpty then   // cuando busca por Solapa Empresas, entonces el filtro se aplica en Do_CargarEmpresasSeleccion...
    sSqlWhere := sSqlWhere + ' AND EXISTS (SELECT 1 ' +
                                            'FROM ZCS_CONTRATOSELECCIONADOPLAN ' +
                                           'WHERE CS_IDSELECCIONPLAN=SE_ID ' +
                                             'AND CS_CONTRATO=' + SqlValue( fraEmpresaSeleccion.edContrato.Value ) + ')';

  if edNroSeleccion.Value > 0 then
    sSqlWhere := sSqlWhere + ' AND SE_ID=' + SqlValue( edNroSeleccion.Value );

  if fraPlan.IsSelected then
    sSqlWhere := sSqlWhere + ' AND CP_ID=' + SqlValue( fraPlan.Value );

  if fraGestorCuenta.IsSelected then
    sSqlWhere := sSqlWhere + ' AND SE_IDGESTORCUENTA=' + SqlValue( fraGestorCuenta.Value );

  if bPorSolapaEmpresas then
    begin
      Verificar( rgEmpresas.ItemIndex = 1, rgEmpresas, 'Estando en la solapa Empresas solo puede filtrar Por Selección' );

      Do_CargarEmpresasSeleccion( 0, 0, fraEmpresaSeleccion.Contrato, True, sSqlWhere );
    end
  else
    begin
      sSql := 'SELECT SE_ID IDSELEC, SE_FECHAALTA FECHAALTASELEC, CP_DESCRIPCION DESCRENCABEZADOPLAN, ' +
                     'DEUDA.GET_FECHAPROXIMAACCION(SE_ID) FECHAPROXACCION, GC_NOMBRE NOMBRE_GESTOR, ' +
                     'AC_DESCRIPCION DESCRULTACCION, SE_FECHAULTACCION FECHAULTACCION, ' +
                     'SE_DESCRIPCION DESCRSELECCION, SE_FECHABAJA FECHABAJA, CP_ID IDZCP ' +
                'FROM AGC_GESTORCUENTA, ZCP_ENCABEZADOPLAN, ZAC_ACCIONPLAN, ZSE_SELECCIONPLAN ' +
               'WHERE SE_IDENCABEZADOPLAN=CP_ID ' +
                 'AND SE_IDULTACCIONPLAN=AC_ID(+) ' +
                 'AND SE_IDGESTORCUENTA=GC_ID(+) ';

      sdqConsulta.SQL.Text := sSql + sSqlWhere + SortDialog.OrderBy;
      OpenQuery( sdqConsulta );

      PageControl.ActivePageIndex := PAGINA_SELECCIONES;
    end;

  Do_InicializarVariables;
  CheckButtons;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.FormCreate(Sender: TObject);
var
  IDGestor: TTableId;
  bEsGestor: Boolean;
begin
  inherited;
  
  Do_InicializarVariables;

  grid.Parent := tsSelecciones;
  PageControl.ActivePageIndex := PAGINA_SELECCIONES;

  SetLength(TotalConsultaEmpr, MAXCOLS + 1);

  LoadDynamicSortFields( SortDialog.SortFields, Grid.Columns );
  LoadDynamicSortFields( SortDialogEmpresa.SortFields, GridEmpresa.Columns );

  with fraEmpresaSeleccion do
    begin
      ShowBajas := True;
      OnChange  := fraEmpresaSeleccionOnChange;
    end;

  IDGestor  := ValorSqlInteger( 'SELECT GC_ID FROM AGC_GESTORCUENTA WHERE GC_USUARIO = ' + SqlValue( frmPrincipal.DBLogin.UserID ), ART_EMPTY_ID );
  bEsGestor := (IDGestor <> ART_EMPTY_ID);

  with fraPlan do
    begin
      TableName      := 'ZCP_ENCABEZADOPLAN';
      FieldID        := 'CP_ID';
      FieldCodigo    := 'CP_ID';
      FieldDesc      := 'CP_DESCRIPCION';
      FieldBaja      := 'CP_FECHABAJA';
      ExtraCondition := Iif( bEsGestor, ' AND CP_TIPOAGRUPACION = ''G''', '' );
      ShowBajas      := True;
    end;

  with fraGestorCuenta do
    begin
      TableName   := 'AGC_GESTORCUENTA';
      FieldID     := 'GC_ID';
      FieldCodigo := 'GC_ID';
      FieldDesc   := 'GC_NOMBRE';
      FieldBaja   := 'GC_FECHABAJA';
      ShowBajas   := True;
    end;

  if bEsGestor then
    fraGestorCuenta.Value := IDGestor;

  VCLExtra.LockControls( fraGestorCuenta, bEsGestor );
  CheckButtons;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.tbOrdenarClick(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
    PAGINA_SELECCIONES:
      begin
        LoadDynamicSortFields( SortDialog.SortFields, Grid.Columns );
        SortDialog.Execute;
      end;

    PAGINA_EMPRESAS:
      begin
        LoadDynamicSortFields( SortDialogEmpresa.SortFields, GridEmpresa.Columns );
        SortDialogEmpresa.Execute;
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.tbLimpiarClick(Sender: TObject);
begin
  fraEmpresaSeleccion.Clear;
  edNroSeleccion.Value := 0;
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  fraPlan.Clear;
  edTotalRegistros.Clear;
  chkFiltrarContrato.Checked := False;
  
  if not fraGestorCuenta.ReadOnly then
    fraGestorCuenta.Clear;

  sdqConsulta.Close;
  sdqEmpresa.Close;
  sdqAccion.Close;
  sdqEvento.Close;

  PageControl.ActivePageIndex := PAGINA_SELECCIONES;
  Do_InicializarVariables;

  CheckButtons;

  rgEmpresas.ItemIndex := 0;   // Por Selección

  fraEmpresaSeleccion.mskCUIT.SetFocus;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Do_CargarEmpresasSeleccion(IdSeleccion, IdAccion: TTableId; Contrato: Integer; FiltrarContrato: Boolean; SqlWhere: String);
var
  sSqlSELECT, sSqlFROM, sSqlWHERE, sSql: String;
begin
  // Por Selección
  sSqlSELECT := 'SELECT CUIT, RAZONSOCIAL, CONTRATO, FECHABAJA, DEUDATOTAL, CANTPERIODOS, ' +
                       'DEUDATOTAL_ACTUAL, (DEUDATOTAL - DEUDATOTAL_ACTUAL) DIFERENCIA, ' +
                       'MONTOREFIN_ACTUAL, DEVANULADO_ACTUAL, RECLAFIP_ACTUAL, PAGOSINGR_ACTUAL, ' +
                       'CUOTASCOMPL_ACTUAL, PROCESARCONTRATO, DEUDA_CUOTA_COMPL, PER_CUOTA_COMPL, ' +
                       'SALDO_ACREEDOR, MAYOR_DEV, MONTO_REF, PER_REF, MONTO_REF_PEND, ILT_COMP, ' +
                       'SDO_QUIEBRA, PRIMER_PER_DEU_COMPL, PRIMER_PER_DEU_DIF, MAYOR_DEV_EMPL, ' +
                       'DEUDA_DIF, REC_AFIP, SDO_CONCURSO, ESTADO, MOT_BAJA, TELEFONOS, DOMICILIO, ' +
                       'DC_CALLE, DC_NUMERO, DC_PISO, DC_DEPARTAMENTO, DC_CPOSTAL, DC_LOCALIDAD, ' +
                       'PV_DESCRIPCION, EMAIL, NROCARTADOC_INT, FECHARECEPCION_INT, DESCRRECEP_INT, ' +
                       'NROCARTADOC_COM, FIMPRESIONCARTADOC_COM, DESCRRECEP_COM, FRECEPCION_COME, ' +
                       'INTERESES_COBRADOS, NOMBREGESTOR, NOMBREEJECUTIVO, TOT799, ULTPER799, CANTEMPLEADOS, ' +
                       'CODENTIDAD_MANT, NOMBREENTIDAD_MANT, NOMBREENTIDAD, NOMBREVENDEDOR, DESCRIPCION_CANAL, ' +
                       'DESCRSECTOR, IDSELEC, DESCRSELECCION, DESCRENCABEZADOPLAN, TOTINTERESES_COM, TOTINTERESES_INT, ' +
                       'TOTINTERESES_MORA, AFILIACION.IS_EMPRESAVIP(CONTRATO) ESVIP, CA_VENTANILLA_INT, ' +
                       'DESCR_VENTANILLA_INT, ULTESTADOCARTAVENTANILLA_INT, ULTFESTADOCARTAVENTANILLA_INT, ' +
                       'DESCR_TIPOSALIDA_INT, FECHABAJACONTR, FENVIOSRT ' +

                  'FROM (' +
                'SELECT EM_CUIT CUIT, EM_NOMBRE RAZONSOCIAL, CO_CONTRATO CONTRATO, ' +
                       'CS_FECHABAJA FECHABAJA, CS_PROCESARCONTRATO PROCESARCONTRATO, ' +
                       'DEUDA.GET_DEUDATOTALSELECCONTRATO(CS_IDSELECCIONPLAN, CO_CONTRATO) DEUDATOTAL, ' +
                       'DEUDA.GET_CANTPERSELECCIONCONTRATO(CS_IDSELECCIONPLAN, CO_CONTRATO) CANTPERIODOS, ' +
                       'DEUDA.GET_DEUDATOTALACTSELECCONTRATO(CS_IDSELECCIONPLAN, CO_CONTRATO) DEUDATOTAL_ACTUAL, ' +
                       'DEUDA.GET_MONTOREFINACTSELECCONTRATO(CS_IDSELECCIONPLAN, CO_CONTRATO) MONTOREFIN_ACTUAL, ' +
                       'DEUDA.GET_DEVANULADOACTSELECCONTRATO(CS_IDSELECCIONPLAN, CO_CONTRATO) DEVANULADO_ACTUAL, ' +
                       'DEUDA.GET_RECLAFIPACTSELECCONTRATO(CS_IDSELECCIONPLAN, CO_CONTRATO) RECLAFIP_ACTUAL, ' +
                       'DEUDA.GET_PAGOSINGRACTSELECCONTRATO(CS_IDSELECCIONPLAN, CO_CONTRATO) PAGOSINGR_ACTUAL, ' +
                       'DEUDA.GET_CUOTASCOMPLSELECCONTRATO(CS_IDSELECCIONPLAN, CO_CONTRATO) CUOTASCOMPL_ACTUAL, ' +
                       'NVL(CS_DEUDACUOTA, 0) DEUDA_CUOTA_COMPL, NVL(CS_PERIODOSCUOTA, 0) PER_CUOTA_COMPL, NVL(CS_SALDOACREEDOR, 0) SALDO_ACREEDOR, ' +
                       'NVL(CS_MAYORDEVENGADO, 0)*2 MAYOR_DEV, NVL(CS_MONTOREFINANCIADO, 0) MONTO_REF, NVL(CS_PERIODOSREFINANCIADOS, 0) PER_REF, ' +
                       'NVL(CS_MONTOREFINANCIADOPEND, 0) MONTO_REF_PEND, NVL(CS_ILTCOMPENSABLE, 0) ILT_COMP, NVL(CS_SALDOQUIEBRA, 0) SDO_QUIEBRA, ' +
                       'CS_PRIMERPERDEUDACOMPL PRIMER_PER_DEU_COMPL, CS_PRIMERPERDEUDADIF PRIMER_PER_DEU_DIF, ' +
                       'NVL(CS_MAYORDEVCONEMPLEADOS, 0) MAYOR_DEV_EMPL, NVL(CS_DEUDACUOTADIFERENCIA, 0) DEUDA_DIF, ' +
                       'NVL(CS_RECLAMOAFIP, 0) REC_AFIP, NVL(CS_SALDOCONCURSO, 0) SDO_CONCURSO, EST.TB_DESCRIPCION ESTADO, ' +
                       'BAJA.TB_DESCRIPCION MOT_BAJA, UTILES.ARMAR_TELEFONO(DC_CODAREATELEFONOS, NULL, DC_TELEFONOS) TELEFONOS, ' +
                       'NVL(DC_DOMICILIO, ART.UTILES.ARMAR_DOMICILIO(DC_CALLE,DC_NUMERO,DC_PISO,DC_DEPARTAMENTO,NULL)) DOMICILIO, ' +
                       'DC_CALLE, DC_NUMERO, DC_PISO, DC_DEPARTAMENTO, DC_CPOSTAL, DC_LOCALIDAD, PV_DESCRIPCION, CO_DIRELECTRONICA EMAIL, ' +
                       'CARTAINT.CA_NROCARTADOC NROCARTADOC_INT, CARTAINT.CA_FECHARECEPCION FECHARECEPCION_INT, RECEPINT.TB_DESCRIPCION DESCRRECEP_INT, ' +
                       'CARTACOM.CA_NROCARTADOC NROCARTADOC_COM, TRUNC(CARTACOM.CA_FECHAIMPRESION) FIMPRESIONCARTADOC_COM, ' +
                       'RECEPCOM.TB_DESCRIPCION DESCRRECEP_COM, CARTACOM.CA_FECHARECEPCION FRECEPCION_COME, ' +
                       'COBRANZA.GET_TOTALINTERESES(CO_CONTRATO, SE_FECHAALTA) INTERESES_COBRADOS, GC_NOMBRE NOMBREGESTOR, EC_NOMBRE NOMBREEJECUTIVO, ' +
                       'COBRANZA.GET_IMPORTECODIGOMOVIMSALDOACR(CO_CONTRATO, NULL) TOT799, ' +
                       '(SELECT MAX(MO_PERIODO) ' +
                         'FROM ZCM_CODIGOMOVIMIENTO, ZMO_MOVIMIENTO ' +
                        'WHERE MO_IDCODIGOMOVIMIENTO = CM_ID ' +
                          'AND CM_ESAJUSTESALDOACREEDOR = ''S'' ' +
                          'AND CO_CONTRATO = MO_CONTRATOPRINCIPAL ' +
                        'GROUP BY MO_CONTRATOPRINCIPAL ' +
                       'HAVING SUM(MO_IMPORTE) <> 0) ULTPER799, ' +
                       'CS_EMPLEADOS CANTEMPLEADOS, ENTIDADMANT.EN_CODBANCO CODENTIDAD_MANT, ' +
                       'ENTIDADMANT.EN_NOMBRE NOMBREENTIDAD_MANT, ENTIDAD.EN_NOMBRE NOMBREENTIDAD, VE_NOMBRE NOMBREVENDEDOR, CANAL.CA_DESCRIPCION DESCRIPCION_CANAL, ' +
                       'SECTOR.TB_DESCRIPCION DESCRSECTOR, SE_ID IDSELEC, SE_DESCRIPCION DESCRSELECCION, CP_DESCRIPCION DESCRENCABEZADOPLAN, ' +
                       'DEUDA.GET_TOTINTERESES_REGDEUDAPLAN(CARTACOM.CA_ID) TOTINTERESES_COM, DEUDA.GET_TOTINTERESES_REGDEUDAPLAN(CARTAINT.CA_ID) TOTINTERESES_INT, ' +
                       'COBRANZA.GETDIFSALDOINTERESES(CO_CONTRATO, NULL) TOTINTERESES_MORA, NVL(CARTAINT.CA_VENTANILLA, ''N'') CA_VENTANILLA_INT, ' +
                       'DECODE(NVL(CARTAINT.CA_VENTANILLA, ''N''), ''S'', ''Sí'', ''N'', ''No'', ''P'', ''Pendiente Envío'', ''E'', ''Enviada'') DESCR_VENTANILLA_INT, ' +
                       'SRT.UTILES.GET_ULTESTADOCARTAVENTANILLA(CARTAINT.CA_ID) ULTESTADOCARTAVENTANILLA_INT, ' +
                       'SRT.UTILES.GET_ULTFESTADOCARTAVENTANILLA(CARTAINT.CA_ID) ULTFESTADOCARTAVENTANILLA_INT, SALIDA_INT.TB_DESCRIPCION DESCR_TIPOSALIDA_INT, ' +
                       'CO_FECHABAJA FECHABAJACONTR, ' +
                       '(SELECT MAX(TRUNC(EN_FENVIOSRT)) ' +
                          'FROM AEN_ENDOSO ' +
                         'WHERE EN_CONTRATO = CO_CONTRATO) FENVIOSRT ';

  sSqlFROM  := 'FROM ACA_CANAL CANAL, XVE_VENDEDOR, XEN_ENTIDAD ENTIDAD, XEV_ENTIDADVENDEDOR, AVC_VENDEDORCONTRATO, ' +
                    'XEN_ENTIDAD ENTIDADMANT, AEC_EJECUTIVOCUENTA, AGC_GESTORCUENTA, CCA_CARTA CARTACOM, CCA_CARTA CARTAINT, CPV_PROVINCIAS, CTB_TABLAS RECEPCOM, ' +
                    'CTB_TABLAS SALIDA_INT, CTB_TABLAS SECTOR, CTB_TABLAS RECEPINT, CTB_TABLAS EST, CTB_TABLAS BAJA, ADC_DOMICILIOCONTRATO, ACO_CONTRATO, AEM_EMPRESA, ' +
                    'ZCP_ENCABEZADOPLAN, ZSE_SELECCIONPLAN, ZCS_CONTRATOSELECCIONADOPLAN ';

  sSqlWHERE := 'WHERE CO_IDEMPRESA=EM_ID ' +
                 'AND CS_CONTRATO=CO_CONTRATO ' +
                 'AND CS_IDSELECCIONPLAN=SE_ID ' +
                 'AND DC_CONTRATO=CO_CONTRATO ' +
                 'AND DC_PROVINCIA=PV_CODIGO ' +
                 'AND DC_TIPO=''L'' ' +
                 'AND EST.TB_CLAVE=''AFEST'' ' +
                 'AND EST.TB_CODIGO=''''||CO_ESTADO ' +
                 'AND SECTOR.TB_CLAVE=''SECT'' ' +
                 'AND SECTOR.TB_CODIGO=''''||EM_SECTOR ' +
                 'AND BAJA.TB_CLAVE(+)=''MOTIB'' ' +
                 'AND BAJA.TB_CODIGO(+)=CS_MOTIVOBAJA ' +
                 'AND SALIDA_INT.TB_CLAVE(+)=''TSCDO'' ' +
                 'AND SALIDA_INT.TB_CODIGO(+)=CARTAINT.CA_TIPOSALIDA ' +
                 'AND CARTAINT.CA_NROCARTADOC(+)=VARIOS.GET_ULTCARTADOCUMENTO(EM_CUIT, ' + SqlValue( AREA_COB ) + ', ' + SqlValue( MODULO_INTIMACION ) + ') ' +
                 'AND RECEPINT.TB_CLAVE(+)=''CODRE'' ' +
                 'AND RECEPINT.TB_CODIGO(+)=CARTAINT.CA_CODRECEPCION ' +
                 'AND CARTACOM.CA_NROCARTADOC(+)=VARIOS.GET_ULTCARTADOCUMENTO(EM_CUIT, ' + SqlValue( AREA_COB ) + ', ' + SqlValue( MODULO_ESTCTACARTAC ) + ') '+
                 'AND RECEPCOM.TB_CLAVE(+)=''CODRE'' ' +
                 'AND RECEPCOM.TB_CODIGO(+)=CARTACOM.CA_CODRECEPCION ' +
                 'AND CO_IDGESTOR=GC_ID(+) ' +
                 'AND CO_IDEJECUTIVO=EC_ID(+) ' +
                 'AND COMISION.GET_IDENTIDADMANTCUENTA(CO_CONTRATO)=ENTIDADMANT.EN_ID(+) ' +
                 'AND VC_ID(+)=COMISION.GET_ULTIDENTIDADVENDCONTRATO(CO_CONTRATO) ' +
                 'AND VC_IDENTIDADVEND=EV_ID(+) ' +
                 'AND EV_IDVENDEDOR=VE_ID(+) ' +
                 'AND EV_IDENTIDAD=ENTIDAD.EN_ID(+) ' +
                 'AND VE_IDCANAL=CANAL.CA_ID(+) ' +
                 'AND SE_IDENCABEZADOPLAN=CP_ID ';

  if IdSeleccion <> 0 then
    sSqlWHERE := sSqlWHERE + 'AND CS_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ';

  if FiltrarContrato and (Contrato <> 0) then
    sSqlWHERE := sSqlWHERE + 'AND CS_CONTRATO=' + SqlValue( Contrato ) + ' ';

  case rgEmpresas.ItemIndex of
    1: begin  // Por Acción
         sSqlFROM  := sSqlFROM + ', ZSC_SELECCIONCONTRACCIONPLAN ';
         sSqlWHERE := sSqlWHERE + 'AND SC_CONTRATO=CO_CONTRATO ' +
                                  'AND SC_IDSELECCIONPLAN=CS_IDSELECCIONPLAN ' +
                                  'AND SC_IDACCIONPLAN=' + SqlValue( IdAccion );
       end;
  end;

  if SqlWhere <> '' then
   sSqlWHERE := sSqlWHERE + SqlWhere;

  sSqlWHERE := sSqlWHERE + ')';

  sSql := sSqlSELECT + sSqlFROM + sSqlWHERE;

  sdqEmpresa.SQL.Text := sSql + SortDialogEmpresa.OrderBy;
  OpenQuery( sdqEmpresa );

  CalcTotalesEmpresas;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.PageControlChange(Sender: TObject);
var
  IdSeleccion, IdAccion, IdZCP: TTableId;
  sSql: String;
  bHuboCambios: Boolean;
begin
  case PageControl.ActivePageIndex of
    PAGINA_SELECCIONES:
      begin
        DBGrid     := Grid;
        DBPrint    := QueryPrint;
        DataSource := dsConsulta;
      end;

    PAGINA_PLANACCION:
      begin
        if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
          begin
            IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;

            if (pUltIdSeleccion_PlanAcc <> IdSeleccion) and (IdSeleccion <> ART_EMPTY_ID) then
              begin
                pUltIdSeleccion_PlanAcc := IdSeleccion;
                IdZCP := sdqConsulta.FieldByName( 'IDZCP' ).AsInteger;

                sSql := 'SELECT AC_ID IDZAC, AC_DESCRIPCION DESCRACCION, ES_FECHAALTA FECHAEJECACCION, ' +
                               'ES_ACCIONEJECUTADA ACCIONEJECUTADA, PL_INTERVALO INTERVALOACCION ' +
                          'FROM ZPL_ACCIONENCABEZADOPLAN, ZAC_ACCIONPLAN, ZES_SELECCIONACCIONPLAN ' +
                         'WHERE PL_IDACCIONPLAN=AC_ID ' +
                           'AND ES_IDACCIONPLAN(+)=AC_ID ' +
                           'AND ES_IDSELECCIONPLAN(+)=' + SqlValue( IdSeleccion ) + ' ' +
                           'AND PL_IDENCABEZADOPLAN=' + SqlValue( IdZCP ) + ' ' +
                      'ORDER BY PL_ORDEN';

                sdqAccion.SQL.Text := sSql;
                OpenQuery( sdqAccion  );
              end;
          end
        else
          begin
            sdqAccion.Close;
            sdqEvento.Close;
          end;
      end;

    PAGINA_EMPRESAS:
      begin
        DBGrid     := GridEmpresa;
        DBPrint    := QueryPrintEmpresa;
        DataSource := dsEmpresa;

        if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and sdqAccion.Active and (not sdqAccion.IsEmpty) then
          begin
            IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;
            IdAccion    := sdqAccion.FieldByName( 'IDZAC' ).AsInteger;

            bHuboCambios := ( ((pUltIdSeleccion <> IdSeleccion) and (IdSeleccion <> ART_EMPTY_ID)) or (pUltEmpresa <> rgEmpresas.ItemIndex) or (pUltIdAccion <> IdAccion) );

            if bHuboCambios or (pUltFiltroContrato <> chkFiltrarContrato.Checked) or (pUltContrato <> fraEmpresaSeleccion.Contrato) then
              begin
                if bHuboCambios or not ((chkFiltrarContrato.Checked and (fraEmpresaSeleccion.Contrato = 0)) or (not chkFiltrarContrato.Checked and (pUltContrato <> fraEmpresaSeleccion.Contrato))) then
                  Do_CargarEmpresasSeleccion( IdSeleccion, IdAccion, fraEmpresaSeleccion.Contrato, chkFiltrarContrato.Checked, '' );

                pUltIdSeleccion    := IdSeleccion;
                pUltIdAccion       := IdAccion;
                pUltEmpresa        := rgEmpresas.ItemIndex;
                pUltFiltroContrato := chkFiltrarContrato.Checked;
                pUltContrato       := fraEmpresaSeleccion.Contrato;

              end;
          end
        else
          sdqEmpresa.Close;
      end;
  end;

  CheckButtons;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.CheckButtons;
var
  bActivar: Boolean;
begin
  case PageControl.ActivePageIndex of
    PAGINA_SELECCIONES:
      begin
        bActivar := sdqConsulta.Active and (not sdqConsulta.IsEmpty);
        Enable_Buttons( False, True, bActivar );
        rgEmpresas.Visible := False;
      end;

    PAGINA_PLANACCION:
      begin
        Enable_Buttons( False, False, False );
        rgEmpresas.Visible := False;
      end;

    PAGINA_EMPRESAS:
      begin
        bActivar := sdqEmpresa.Active and (not sdqEmpresa.IsEmpty);
        Enable_Buttons( bActivar, True, bActivar );
        rgEmpresas.Visible := True;
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Enable_Buttons(AEnabled1, AEnabled2, AEnabled3: Boolean);
begin
  tbImprimir.Enabled  := AEnabled1;
  tbExportar.Enabled  := AEnabled1;
  tbAgenda.Enabled    := AEnabled1;
  tbSumatoria.Enabled := AEnabled1;

  tbOrdenar.Enabled   := AEnabled2;

  tbEliminar.Enabled  := AEnabled3;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Do_InicializarVariables;
begin
  pUltIdSeleccion         := ART_EMPTY_ID;
  pUltIdSeleccion_PlanAcc := ART_EMPTY_ID;
  pUltIdAccion            := ART_EMPTY_ID;

  pUltEmpresa             := -1;
  pUltFiltroContrato      := False;
  pUltContrato            := 0
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.tbEliminarClick(Sender: TObject);
var
  IdSeleccion: TTableId;
  Contrato: Integer;
begin
  case PageControl.ActivePageIndex of
    PAGINA_SELECCIONES:
      begin
        IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;

        if Validar_EliminarSeleccion then
          if MsgBox( '¿Confirma la baja de la selección?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
            Do_EliminarSeleccion( IdSeleccion );
      end;

    PAGINA_EMPRESAS:
      begin
        IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;
        Contrato    := sdqEmpresa.FieldByName( 'CONTRATO' ).AsInteger;

        if Validar_EliminarEmpresaSeleccion then
          if MsgBox( '¿Confirma la baja de la empresa de la selección?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
            Do_EliminarEmpresaSeleccion( IdSeleccion, Contrato );
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Do_EliminarSeleccion(IdSeleccion: TTableId);
var
  sSql: String;
begin
  sSql := 'UPDATE ZSE_SELECCIONPLAN ' +
             'SET SE_USUBAJA=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ', ' +
                 'SE_FECHABAJA=ACTUALDATE ' +
           'WHERE SE_ID=' + SqlValue( IdSeleccion );
  EjecutarSql( sSql );

  sdqConsulta.Refresh;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Do_EliminarEmpresaSeleccion(IdSeleccion: TTableId; Contrato: Integer);
var
  sSql: String;
begin
  sSql := 'UPDATE ZCS_CONTRATOSELECCIONADOPLAN ' +
             'SET CS_USUBAJA=' + SqlValue( frmPrincipal.DBLogin.UserID ) + ', ' +
                 'CS_FECHABAJA=ACTUALDATE ' +
           'WHERE CS_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
             'AND CS_CONTRATO=' + SqlValue( Contrato );
  EjecutarSql( sSql );

  sdqEmpresa.Refresh;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqConsulta.FieldByName( 'FECHABAJA' ).IsNull then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Validar_EliminarSeleccion: Boolean;
var
  IdSeleccion: TTableId;
begin
  Result := False;

  IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;

  if not sdqConsulta.FieldByName( 'FECHABAJA' ).IsNull then
    MsgBox( 'La selección ya se encuentra dada de baja', MB_OK + MB_ICONERROR )

  else if Existen_AccionesEjecutadas( IdSeleccion ) then
    MsgBox( 'La selección ya tiene acciones ejecutadas', MB_OK + MB_ICONERROR )

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Existen_AccionesEjecutadas(IdSeleccion: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ZES_SELECCIONACCIONPLAN ' +
           'WHERE ES_IDSELECCIONPLAN=' + SqlValue( IdSeleccion );

  Result := ExisteSql( sSql );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Validar_EliminarEmpresaSeleccion: Boolean;
var
  IdSeleccion: TTableId;
begin
  Result := False;

  IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;

  if not sdqEmpresa.FieldByName( 'FECHABAJA' ).IsNull then
    MsgBox( 'La empresa ya se encuentra dada de baja de la selección', MB_OK + MB_ICONERROR )

  else if Existen_AccionesEjecutadas( IdSeleccion ) then
    MsgBox( 'La selección ya tiene acciones ejecutadas', MB_OK + MB_ICONERROR )

  else
    Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Do_CargarEventosAccion(IdAccion: TTableId);
var
  sSql: String;
begin
  sSql := 'SELECT EE_DESCRIPCION DESCREVENTO, TI_DESCRIPCION DESCRTIPOINSTRUCCION ' +
            'FROM ZTI_TIPOINSTRUCCIONEVENTOPLAN, ZEE_EVENTOPLAN, ZER_ACCIONEVENTOPLAN ' +
           'WHERE EE_IDTIPOINSTRUCCIONEVENTOPLAN=TI_ID ' +
             'AND ER_IDEVENTOPLAN=EE_ID ' +
             'AND ER_IDACCIONPLAN=' + SqlValue( IdAccion ) + ' ' +
        'ORDER BY ER_ORDEN';

  sdqEvento.SQL.Text := sSql;
  OpenQuery( sdqEvento );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.sdqAccionAfterScroll(DataSet: TDataSet);
var
  IdAccion: TTableId;
begin
  if sdqAccion.Active and (not sdqAccion.IsEmpty) then
    begin
      IdAccion := sdqAccion.FieldByName( 'IDZAC' ).AsInteger;

      Do_CargarEventosAccion( IdAccion );
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Validar_AccionesGrilla(EsArrancarAccion: Boolean): Boolean;
var
  RegistroAnterior: TBookMark;
  IdAccion: TTableId;
  bExisteNoEjecutada: Boolean;
begin
  bExisteNoEjecutada := False;
  IdAccion           := sdqAccion.FieldByName( 'IDZAC' ).AsInteger;

  RegistroAnterior := sdqAccion.GetBookmark;
  try
    sdqAccion.First;
    while (not sdqAccion.Eof) and (sdqAccion.FieldByName( 'IDZAC' ).AsInteger <> IdAccion) do
      begin
        if sdqAccion.FieldByName( 'FECHAEJECACCION' ).IsNull then  // alguna de las acciones anteriores a la que se quiere disparar no fue ejecutada
          begin
            bExisteNoEjecutada := True;
            break;
          end;

        sdqAccion.Next;
      end;
  finally
    sdqAccion.GotoBookmark( RegistroAnterior );
  end;

  if bExisteNoEjecutada then
    begin
      MsgBox( 'La acción no puede arrancarse/saltearse ya que faltan ejecutar acciones anteriores', MB_OK + MB_ICONERROR );
      Result := False;
    end
  else
    begin
      if not EsArrancarAccion and not IsPermitirSaltearAccion(IdAccion) then
        begin
          MsgBox( 'Esta acción no puede saltearse', MB_OK + MB_ICONERROR );
          Result := False;
        end
      else
        Result := True;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Validar_ArrancarAccion(EsArrancarAccion: Boolean): Boolean;
var
  IdSeleccion: TTableId;
begin
  Result := False;

  if (not sdqConsulta.Active) or sdqConsulta.IsEmpty then
    begin
      MsgBox( 'Debe elegir alguna selección', MB_OK + MB_ICONERROR );
      exit;
    end;

  if not sdqConsulta.FieldByName( 'FECHABAJA' ).IsNull then
    begin
      MsgBox( 'La selección se encuentra dada de baja', MB_OK + MB_ICONERROR );
      exit;
    end;

  if (not sdqAccion.Active) or sdqAccion.IsEmpty then
    begin
      MsgBox( 'Debe seleccionar alguna acción', MB_OK + MB_ICONERROR );
      exit;
    end;

  if not sdqAccion.FieldByName( 'FECHAEJECACCION' ).IsNull then
    begin
      if sdqAccion.FieldByName( 'ACCIONEJECUTADA' ).AsString = 'S' then
        MsgBox( 'La acción seleccionada ya fue ejecutada', MB_OK + MB_ICONERROR )
      else
        MsgBox( 'La acción seleccionada ya fue salteada', MB_OK + MB_ICONERROR );
      exit;
    end;

  IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;
  if not Existen_EmpresasSeleccion( IdSeleccion ) then
    begin
      MsgBox( 'La selección no tiene empresas que no estén dadas de baja', MB_OK + MB_ICONERROR );
      exit;
    end;

  if not Validar_AccionesGrilla(EsArrancarAccion) then
    exit;

  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Do_GrabarUltAccionEjecutada(IdSeleccion, IdAccion: TTableId);
var
  Sql: TSql;
begin
  sbProcesoAccion.SimpleText := 'Actualizando la información en la selección';

  Sql := TSql.Create( 'ZSE_SELECCIONPLAN' );
  try
    Sql.PrimaryKey.Add( 'SE_ID',          IdSeleccion, dtNumber );
    Sql.Fields.Add( 'SE_IDULTACCIONPLAN', IdAccion, dtNumber );
    Sql.Fields.Add( 'SE_FECHAULTACCION',  exDate );

    Sql.SqlType := stUpdate;

    EjecutarSqlST( Sql.Sql );
  finally
    Sql.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Do_GrabarSeleccionAccion(IdSeleccion, IdAccion: TTableId; AccionEjecutada: String);
var
  Sql: TSql;
begin
  sbProcesoAccion.SimpleText := 'Grabando la acción ejecutada';

  Sql := TSql.Create( 'ZES_SELECCIONACCIONPLAN' );
  try
    Sql.PrimaryKey.Add( 'ES_ID',          GetSecNextVal( 'SEQ_ZES_ID' ), dtNumber );
    Sql.Fields.Add( 'ES_IDSELECCIONPLAN', IdSeleccion, dtNumber );
    Sql.Fields.Add( 'ES_IDACCIONPLAN',    IdAccion, dtNumber );
    Sql.Fields.Add( 'ES_ACCIONEJECUTADA', AccionEjecutada );
    Sql.Fields.Add( 'ES_FECHAALTA',       exDate );
    Sql.Fields.Add( 'ES_USUALTA',         frmPrincipal.DBLogin.UserID );

    Sql.SqlType := stInsert;

    EjecutarSqlST( Sql.Sql );
  finally
    Sql.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.btnSaltearAccionClick(Sender: TObject);
var
  IdSeleccion, IdAccion: TTableId;
begin
  if Validar_ArrancarAccion(False) then
    if MsgBox( '¿Confirma saltearse la acción?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
      begin
        BeginTrans;
        try
          IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;
          IdAccion    := sdqAccion.FieldByName( 'IDZAC' ).AsInteger;

          // genero relación entre selección y acción ejecutada
          Do_GrabarSeleccionAccion( IdSeleccion, IdAccion, 'N' );

          // actualizo en la selección la última acción ejecutada
          Do_GrabarUltAccionEjecutada( IdSeleccion, IdAccion );

          sbProcesoAccion.SimpleText := '';

          CommitTrans;
          MsgBox( 'La acción ha sido salteada correctamente', MB_OK + MB_ICONINFORMATION );
          sdqAccion.Refresh;
        except
          on E: Exception do
            begin
              ErrorMsg( E, 'Error al saltear la acción' );
              RollBack;
            end;
        end;
      end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.btnArrancarAccionClick(Sender: TObject);
var
  sSql, sParametros, sIntruccion: String;
  IdSeleccion, IdAccion: TTableId;
  bEventoOk: Boolean;
begin
  if Validar_ArrancarAccion(True) then
    begin
      bEventoOk := False;

      IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;
      IdAccion    := sdqAccion.FieldByName( 'IDZAC' ).AsInteger;

      if IsPrimeraAccionPlan( IdSeleccion, IdAccion ) then
        SetearBusquedaContratos( IdSeleccion, chkVerificarCondicInicContratos.Checked );

      BeginTrans;
      try
        // ejecuto los eventos de la acción seleccionada
        sSql := 'SELECT EE_DESCRIPCION, EE_IDTIPOINSTRUCCIONEVENTOPLAN, EE_INSTRUCCION, REPLACE(EE_PARAMETROS,''´'','''''''') PARAMETROS ' +
                  'FROM ZEE_EVENTOPLAN, ZER_ACCIONEVENTOPLAN ' +
                 'WHERE ER_IDEVENTOPLAN=EE_ID ' +
                   'AND ER_IDACCIONPLAN=' + SqlValue( IdAccion ) + ' ' +
              'ORDER BY ER_ORDEN';

        with GetQuery( sSql ) do
          begin
            try
              while not EOF do
                begin
                  bEventoOk := True;

                  sbProcesoAccion.SimpleText := 'Ejecutando el evento ' + FieldByName( 'EE_DESCRIPCION' ).AsString;

                  sIntruccion := UpperCase( FieldByName( 'EE_INSTRUCCION' ).AsString );
                  sParametros := FieldByName( 'PARAMETROS' ).AsString;

                  case FieldByName( 'EE_IDTIPOINSTRUCCIONEVENTOPLAN' ).AsInteger of
                    0: begin    // Proceso Oracle
                         sSql := sIntruccion + '(' + SqlValue( IdSeleccion ) + ', ' + SqlValue( IdAccion ) + ', ' + SqlValue( frmPrincipal.DBLogin.UserID ) +  IIf(sParametros = '', '', ', ' + sParametros) + ');';

                         EjecutarStoreST( sSql );
                       end;

                    //  1:    Sin implementar - Programa Externo

                    2: begin    // Programa Interno
                         if sIntruccion = 'INTIMACION_IMPRIMIR' then
                           Intimacion_Imprimir( IdSeleccion, IdAccion, sParametros )

                         else if sIntruccion = 'ESTADOCUENTAYRESCISION_IMPRIMIR' then
                           EstadoCuentaYRescision_Imprimir( IdSeleccion, IdAccion, sParametros )

                         else if sIntruccion = 'ANULACIONRESCISION_IMPRIMIR' then
                           AnulacionRescision_Imprimir( IdSeleccion, IdAccion )

                         else if sIntruccion = 'EMPRESAS_SELECCIONAR' then
                           bEventoOk := Empresas_Seleccionar( IdSeleccion )

                         else if sIntruccion = 'ESTADOCUENTAYCARTACOMERCIAL_IMPRIMIR' then
                           EstadoCuentaYCartaComercial_Imprimir( IdSeleccion, IdAccion, sParametros )

                         else if sIntruccion = 'MAIL_ENVIAR' then
                           Mail_Enviar( sParametros )

                         else if sIntruccion = 'SETTIPOSALIDACARTA' then
                           bEventoOk := SetTipoSalidaCarta();
                       end;
                  end;

                  if not bEventoOk then
                    Break;

                  Next;
                end;
            finally
              free;
            end;
          end;

        // genero relación entre selección y acción ejecutada
        Do_GrabarSeleccionAccion( IdSeleccion, IdAccion, 'S' );

        // actualizo en la selección la última acción ejecutada
        Do_GrabarUltAccionEjecutada( IdSeleccion, IdAccion );

        sbProcesoAccion.SimpleText := '';

        CommitTrans(True);

        if bEventoOk then
          MsgBox( 'La acción ha sido ejecutada correctamente', MB_OK + MB_ICONINFORMATION );

        sdqAccion.Refresh;
        sdqConsulta.Refresh;
      except
        on E: Exception do
          begin
            ErrorMsg( E, 'Error al ejecutar la acción' );
            sbProcesoAccion.SimpleText := '';
            RollBack(True);
          end;
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Existen_EmpresasSeleccion(IdSeleccion: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ZCS_CONTRATOSELECCIONADOPLAN ' +
           'WHERE CS_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
             'AND CS_FECHABAJA IS NULL';

  Result := ExisteSql( sSql );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.rgEmpresasClick(Sender: TObject);
begin
  PageControlChange( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.sdqEmpresaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if sdqEmpresa.FieldByName( 'DEUDATOTAL' ) is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
     TFloatField( sdqEmpresa.FieldByName( 'DEUDATOTAL' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'DEUDATOTAL_ACTUAL' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'DEUDATOTAL_ACTUAL' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'DIFERENCIA' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'DIFERENCIA' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'MONTOREFIN_ACTUAL' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'MONTOREFIN_ACTUAL' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'DEVANULADO_ACTUAL' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'DEVANULADO_ACTUAL' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'RECLAFIP_ACTUAL' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'RECLAFIP_ACTUAL' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'PAGOSINGR_ACTUAL' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'PAGOSINGR_ACTUAL' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'DEUDA_CUOTA_COMPL' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'DEUDA_CUOTA_COMPL' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'SALDO_ACREEDOR' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'SALDO_ACREEDOR' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'MAYOR_DEV' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'MAYOR_DEV' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'MONTO_REF' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'MONTO_REF' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'MONTO_REF_PEND' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'MONTO_REF_PEND' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'ILT_COMP' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'ILT_COMP' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'SDO_QUIEBRA' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'SDO_QUIEBRA' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'MAYOR_DEV_EMPL' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'MAYOR_DEV_EMPL' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'DEUDA_DIF' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'DEUDA_DIF' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'REC_AFIP' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'REC_AFIP' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'SDO_CONCURSO' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'SDO_CONCURSO' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'INTERESES_COBRADOS' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'INTERESES_COBRADOS' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'TOT799' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'TOT799' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'TOTINTERESES_INT' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'TOTINTERESES_INT' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'TOTINTERESES_COM' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'TOTINTERESES_COM' ) ).Currency := True;

  if sdqEmpresa.FieldByName( 'TOTINTERESES_MORA' ) is TFloatField then
     TFloatField( sdqEmpresa.FieldByName( 'TOTINTERESES_MORA' ) ).Currency := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Do_InsRegSelecContrAccionPlan(IdSeleccion, IdAccion: TTableId; Contrato: Integer);
var
  sSql: String;
  iDummy: Integer;
begin
  iDummy := 0;
  sSql   := 'DEUDA.DO_INSREGSELECCONTRACCIONPLAN(:IdSeleccion, :Contrato, :IdAccion, :iDummy);';

  EjecutarStoreSTEx( sSql, [IdSeleccion, Contrato, IdAccion, iDummy] );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Do_ArmarSqlContratos(IdSeleccion: TTableId): String;
var
  IdUltAccion: TTableId;
  sSql: String;
begin
  IdUltAccion := Get_IdUltAccionEjecutada( IdSeleccion );

  if IdUltAccion = ART_EMPTY_ID then
    sSql := 'SELECT CS_CONTRATO CONTRATO ' +
              'FROM ZCS_CONTRATOSELECCIONADOPLAN ' +
             'WHERE CS_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
               'AND CS_FECHABAJA IS NULL ' +
               'AND CS_PROCESARCONTRATO=''S'' '
  else
    sSql := 'SELECT SC_CONTRATO CONTRATO ' +
              'FROM ZSC_SELECCIONCONTRACCIONPLAN ' +
             'WHERE SC_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
               'AND SC_IDACCIONPLAN=' + SqlValue( IdUltAccion ) + ' ';

  Result := sSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Empresas_Seleccionar(IdSeleccion: TTableId): Boolean;
begin
  with TfrmSeleccionarEmpresasAccion.Create( Self ) do
    try
      Seleccion := IdSeleccion;
      Result    := Do_CargarDatos;
    finally
      Free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.EstadoCuentaYRescision_Imprimir(IdSeleccion, IdAccion: TTableId; Parametros: String);
var
  sSql: String;
  bImprimirFirma: Boolean;
  sMensaje, sTipoEstCta, sTipoResumen: String;
  bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra: Boolean;
  bVentanillaElectr, bImprimir, bConPreview: Boolean;
  bParImprimir, bParGenerarPDF, bParPDFMostrarMensError: Boolean;
begin
  Get_Parametros_EstadoCuentaCartaComercial(Parametros, sTipoEstCta, sTipoResumen, bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra, bConPreview);

  bVentanillaElectr := (GetTipoSalidaCarta() = 'VE');

  sSql := 'SELECT MIN(CA_NROCARTADOC) || '' al '' || MAX(CA_NROCARTADOC) RANGOCARTASDOC, ' +
                 'COUNT(*) CANTCARTASDOC ' +
            'FROM CCA_CARTA, ZCS_CONTRATOSELECCIONADOPLAN, ZSC_SELECCIONCONTRACCIONPLAN ' +
           'WHERE CS_IDSELECCIONPLAN=SC_IDSELECCIONPLAN ' +
             'AND CS_CONTRATO=SC_CONTRATO ' +
             'AND CS_IDCARTARESCISION=CA_ID ' +
             'AND CS_PROCESARCONTRATO=''S'' ' +
             'AND SC_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
             'AND SC_IDACCIONPLAN=' + SqlValue( IdAccion );

  with GetQuery( sSql ) do
    try
      if FieldByName( 'CANTCARTASDOC' ).AsInteger = 0 then
        MsgBox( 'No se ha generado ninguna Carta de Rescisión', MB_OK + MB_ICONEXCLAMATION )
      else
        begin
          if bVentanillaElectr then
            begin
              sMensaje                := 'enviarlas por Ventanilla Electrónica';
              bParImprimir            := False;
              bParGenerarPDF          := True;
              bParPDFMostrarMensError := False;
            end
          else
            begin
              sMensaje                := 'imprimirlas';
              bParImprimir            := True;
              bParGenerarPDF          := False;
              bParPDFMostrarMensError := True;
            end;

          CommitAndBeginTrans(True);
          
          bImprimir      := (MsgBox( 'Se han generado las Cartas de Rescisión y sus Estados de Cuenta (' + FieldByName( 'RANGOCARTASDOC' ).AsString + ').' + CRLF + '¿ Quiere ' + sMensaje + ' ahora (' + FieldByName( 'CANTCARTASDOC').AsString + ' carta/s) ?', MB_YESNO + MB_ICONQUESTION ) = ID_YES);
          bImprimirFirma := bImprimir and ImprimirCartaDocConFirma;

          sSql := 'SELECT SC_ID, SC_CONTRATO, CA_ID ' +
                    'FROM CCA_CARTA, ZCS_CONTRATOSELECCIONADOPLAN, ZSC_SELECCIONCONTRACCIONPLAN ' +
                   'WHERE CS_IDSELECCIONPLAN=SC_IDSELECCIONPLAN ' +
                     'AND CS_CONTRATO=SC_CONTRATO ' +
                     'AND CS_IDCARTARESCISION=CA_ID ' +
                     'AND CS_PROCESARCONTRATO=''S'' ' +
                     'AND SC_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
                     'AND SC_IDACCIONPLAN=' + SqlValue( IdAccion ) + ' ' +
                'ORDER BY CA_NROCARTADOC';
          with GetQuery( sSql ) do
            try
              while not Eof do
                begin
                  if bImprimir then
                    MostrarCartaDocumentoCob( FieldByName( 'CA_ID' ).AsInteger, tmNone, bParImprimir, 3, False, False, True, bImprimirFirma, False, bParGenerarPDF, bParPDFMostrarMensError );

                  Generar_EstadoCuenta( sTipoEstCta, sTipoResumen, bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra, bConPreview, FieldByName( 'SC_CONTRATO' ).AsInteger, False, True, FieldByName( 'SC_ID' ).AsInteger, taRescision );

                  if bImprimir then
                    CommitAndBeginTrans(True);

                  Next;
                end;

              if bVentanillaElectr then
                DoMostrarMensajeFinVE;
            finally
              free;
            end;
        end;
    finally
      free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.AnulacionRescision_Imprimir(IdSeleccion, IdAccion: TTableId);
var
  sMensaje, sSql: String;
  bVentanillaElectr, bImprimirFirma: Boolean;
  bParImprimir, bParGenerarPDF, bParPDFMostrarMensError: Boolean;
begin
  sSql := 'SELECT MIN(CA_NROCARTADOC) || '' al '' || MAX(CA_NROCARTADOC) RANGOCARTASDOC, ' +
                 'COUNT(*) CANTCARTASDOC ' +
            'FROM CCA_CARTA, ZCS_CONTRATOSELECCIONADOPLAN, ZSC_SELECCIONCONTRACCIONPLAN ' +
           'WHERE CS_IDSELECCIONPLAN=SC_IDSELECCIONPLAN ' +
             'AND CS_CONTRATO=SC_CONTRATO ' +
             'AND CS_IDCARTAANULRESCISION=CA_ID ' +
             'AND CS_PROCESARCONTRATO=''S'' ' +
             'AND SC_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
             'AND SC_IDACCIONPLAN=' + SqlValue( IdAccion );

  with GetQuery( sSql ) do
    try
      bVentanillaElectr := (GetTipoSalidaCarta() = 'VE');

      if bVentanillaElectr then
        begin
          sMensaje                := 'enviarlas por Ventanilla Electrónica';
          bParImprimir            := False;
          bParGenerarPDF          := True;
          bParPDFMostrarMensError := False;
        end
      else
        begin
          sMensaje                := 'imprimirlas';
          bParImprimir            := True;
          bParGenerarPDF          := False;
          bParPDFMostrarMensError := True;
        end;

      if FieldByName( 'CANTCARTASDOC' ).AsInteger = 0 then
        MsgBox( 'No se ha generado ninguna Carta de Anulación de Rescisión', MB_OK + MB_ICONEXCLAMATION )
      else
        begin
          CommitAndBeginTrans(True);

          if MsgBox( 'Se han generado las Cartas de Anulación de Rescisión (' + FieldByName( 'RANGOCARTASDOC' ).AsString + ').' + CRLF + '¿ Quiere ' + sMensaje + ' ahora (' + FieldByName( 'CANTCARTASDOC').AsString + ' carta/s) ?', MB_YESNO + MB_ICONQUESTION ) = ID_YES then
            begin
              bImprimirFirma := ImprimirCartaDocConFirma;

              sSql := 'SELECT CA_ID ' +
                        'FROM CCA_CARTA, ZCS_CONTRATOSELECCIONADOPLAN, ZSC_SELECCIONCONTRACCIONPLAN ' +
                       'WHERE CS_IDSELECCIONPLAN=SC_IDSELECCIONPLAN ' +
                         'AND CS_CONTRATO=SC_CONTRATO ' +
                         'AND CS_IDCARTAANULRESCISION=CA_ID ' +
                         'AND CS_PROCESARCONTRATO=''S'' ' +
                         'AND SC_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
                         'AND SC_IDACCIONPLAN=' + SqlValue( IdAccion ) + ' ' +
                    'ORDER BY CA_NROCARTADOC';
              with GetQuery( sSql ) do
                try
                  while not Eof do
                    begin
                      MostrarCartaDocumentoCob( FieldByName( 'CA_ID' ).AsInteger, tmNone, bParImprimir, 3, False, False, True, bImprimirFirma, True, bParGenerarPDF, bParPDFMostrarMensError );

                      CommitAndBeginTrans(True);
                      Next;
                    end;

                  if bVentanillaElectr then
                    DoMostrarMensajeFinVE;
                finally
                  free;
                end;
            end;
        end;
    finally
      free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Intimacion_Imprimir(IdSeleccion, IdAccion: TTableId; Parametros: String);
var
  lParametros: TStringList;
  bVentanillaElectr, bImprimirFirma, bIncluir817, bEsBorrador: Boolean;
  bParImprimir, bParGenerarPDF, bParPDFMostrarMensError: Boolean;
  iCantCopias: Integer;
  sMensaje, sSql: String;
begin
  bIncluir817 := False;
  bEsBorrador := False;

  if Parametros <> '' then
    begin
      lParametros := TStringList.Create;
      try
        lParametros.CommaText := Parametros;

        bIncluir817 := (lParametros.Count >= 1 ) and (lParametros.Strings[0] = 'S');
        bEsBorrador := (lParametros.Count >= 2 ) and (lParametros.Strings[1] = 'S');
      finally
        lParametros.Free;
      end;
    end;

  if bEsBorrador then  // no se está usando
    iCantCopias := 1
  else
    iCantCopias := 3;

  sSql := 'SELECT MIN(CA_NROCARTADOC) || '' al '' || MAX(CA_NROCARTADOC) RANGOCARTASDOC, ' +
                 'COUNT(*) CANTCARTASDOC ' +
            'FROM CCA_CARTA, ZCS_CONTRATOSELECCIONADOPLAN, ZSC_SELECCIONCONTRACCIONPLAN ' +
           'WHERE CS_IDSELECCIONPLAN=SC_IDSELECCIONPLAN ' +
             'AND CS_CONTRATO=SC_CONTRATO ' +
             'AND CS_IDCARTAINTIMACION=CA_ID ' +
             'AND CS_PROCESARCONTRATO=''S'' ' +
             'AND SC_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
             'AND SC_IDACCIONPLAN=' + SqlValue( IdAccion );

  with GetQuery( sSql ) do
    try
      bVentanillaElectr := (GetTipoSalidaCarta() = 'VE');

      if bVentanillaElectr then
        begin
          sMensaje                := 'enviarlas por Ventanilla Electrónica';
          bParImprimir            := False;
          bParGenerarPDF          := True;
          bParPDFMostrarMensError := False;
        end
      else
        begin
          sMensaje                := 'imprimirlas';
          bParImprimir            := True;
          bParGenerarPDF          := False;
          bParPDFMostrarMensError := True;
        end;

      if FieldByName( 'CANTCARTASDOC' ).AsInteger = 0 then
        MsgBox( 'No se ha generado ninguna Carta de Intimación', MB_OK + MB_ICONEXCLAMATION )
      else
        begin
          CommitAndBeginTrans(True);

          if MsgBox( 'Se han generado las Cartas de Intimación (' + FieldByName( 'RANGOCARTASDOC' ).AsString + ').' + CRLF + '¿ Quiere ' + sMensaje + ' ahora (' + FieldByName( 'CANTCARTASDOC').AsString + ' carta/s) ?', MB_YESNO + MB_ICONQUESTION ) = ID_YES then
            begin
              bImprimirFirma := ImprimirCartaDocConFirma;

              sSql := 'SELECT CA_ID ' +
                        'FROM CCA_CARTA, ZCS_CONTRATOSELECCIONADOPLAN, ZSC_SELECCIONCONTRACCIONPLAN ' +
                       'WHERE CS_IDSELECCIONPLAN=SC_IDSELECCIONPLAN ' +
                         'AND CS_CONTRATO=SC_CONTRATO ' +
                         'AND CS_IDCARTAINTIMACION=CA_ID ' +
                         'AND CS_PROCESARCONTRATO=''S'' ' +
                         'AND SC_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
                         'AND SC_IDACCIONPLAN=' + SqlValue( IdAccion ) + ' ' +
                    'ORDER BY CA_NROCARTADOC';
              with GetQuery( sSql ) do
                try
                  while not Eof do
                    begin
                      MostrarCartaDocumentoCob( FieldByName( 'CA_ID' ).AsInteger, tmNone, bParImprimir, iCantCopias, False, bIncluir817, True, bImprimirFirma, True, bParGenerarPDF, bParPDFMostrarMensError );

                      CommitAndBeginTrans(True);
                      Next;
                    end;

                  if bVentanillaElectr then
                    DoMostrarMensajeFinVE;
                finally
                  free;
                end;
            end;
        end;
    finally
      free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.ImprimirCartaDocConFirma: Boolean;
begin
  ImprimirCartaDocConFirma := (SelectDlg('Impresión de Cartas', ['Con Firma', 'Sin Firma'], 1, []) = 0);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.EstadoCuentaYCartaComercial_Imprimir(IdSeleccion, IdAccion: TTableId; Parametros: String);
var
  sSql, sTipoEstCta, sTipoResumen: String;
  bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra: Boolean;
  bImprimir, bConPreview: Boolean;
begin
  Get_Parametros_EstadoCuentaCartaComercial(Parametros, sTipoEstCta, sTipoResumen, bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra, bConPreview);

  sSql := 'SELECT MIN(CA_NROCARTADOC) || '' al '' || MAX(CA_NROCARTADOC) RANGOCARTASDOC, ' +
                 'COUNT(*) CANTCARTASDOC ' +
            'FROM CCA_CARTA, ZCS_CONTRATOSELECCIONADOPLAN, ZSC_SELECCIONCONTRACCIONPLAN ' +
           'WHERE CS_IDSELECCIONPLAN=SC_IDSELECCIONPLAN ' +
             'AND CS_CONTRATO=SC_CONTRATO ' +
             'AND CS_IDCARTACOMESTADOCTA=CA_ID ' +
             'AND CS_PROCESARCONTRATO=''S'' ' +
             'AND SC_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
             'AND SC_IDACCIONPLAN=' + SqlValue( IdAccion );

  with GetQuery( sSql ) do
    try
      if FieldByName( 'CANTCARTASDOC' ).AsInteger = 0 then
        MsgBox( 'No se ha generado ninguna Carta Comercial de Estado de Cuenta', MB_OK + MB_ICONEXCLAMATION )
      else
        begin
          bImprimir := ( MsgBox( 'Se han generado las Cartas Comerciales y sus Estados de Cuenta (' + FieldByName( 'RANGOCARTASDOC' ).AsString + ').' + CRLF + '¿ Quiere imprimirlas ahora (' + FieldByName( 'CANTCARTASDOC').AsString + ' carta/s) ?', MB_YESNO + MB_ICONQUESTION ) = ID_YES );

          sSql := 'SELECT SC_ID, SC_CONTRATO, CA_ID ' +
                    'FROM CCA_CARTA, ZCS_CONTRATOSELECCIONADOPLAN, ZSC_SELECCIONCONTRACCIONPLAN ' +
                   'WHERE CS_IDSELECCIONPLAN=SC_IDSELECCIONPLAN ' +
                     'AND CS_CONTRATO=SC_CONTRATO ' +
                     'AND CS_IDCARTACOMESTADOCTA=CA_ID ' +
                     'AND CS_PROCESARCONTRATO=''S'' ' +
                     'AND SC_IDSELECCIONPLAN=' + SqlValue( IdSeleccion ) + ' ' +
                     'AND SC_IDACCIONPLAN=' + SqlValue( IdAccion ) + ' ' +
                'ORDER BY SC_CONTRATO';
          with GetQuery( sSql ) do
            try
              while not Eof do
                begin
                  if bImprimir then
                    MostrarCartaDocumentoCob( FieldByName( 'CA_ID' ).AsInteger, tmNone, True, 1, False, False, False, True, False );

                  Generar_EstadoCuenta( sTipoEstCta, sTipoResumen, bConAmortizacion, bSinConcQuiebra, bSinReclamoAFIP, bConIntConcQuiebra, bConPreview, FieldByName( 'SC_CONTRATO' ).AsInteger, bImprimir, True, FieldByName( 'SC_ID' ).AsInteger );

                  Next;
                end;
            finally
              free;
            end;
        end;
    finally
      free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Mail_Enviar(Parametros: String);
var
  lParametros: TStringList;
  sUbicArchivo, sCodAsunto, sAsunto, sCodMensaje: String;
  sSql, sSqlListaContratos, sMensaje, sDirecciones: String;
//  sSql: String;
  IdAccion, IdSeleccion: TTableId;
begin
  // envía un solo mail genérico, es decir, NO envía un mail por cada contrato de la selección
  // sino un único mail para todo el lote de contratos

  IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;
  IdAccion    := sdqAccion.FieldByName( 'IDZAC' ).AsInteger;
  sSqlListaContratos := '';

  lParametros := TStringList.Create;
  try
    lParametros.CommaText := Parametros;

    sCodAsunto  := lParametros.Strings[0];
    sCodMensaje := lParametros.Strings[1];
  finally
    lParametros.Free;
  end;

  if sCodAsunto = 'A001' then
    sAsunto := 'Derivación de Contratos';

  if sCodMensaje = 'M001' then
    sMensaje := 'Derivamos a ustedes, según la acción de referencia, contratos rescindidos ' +
                'por falta de pago, los cuales solicitamos se asignen a Estudios Jurídicos ' +
                'para su gestión extrajudicial, y la carga de los mismos por nro. de contrato ' +
                'al sistema.' + CRLF +
                'La impresión de los estados de cuenta deberá ser por Resumen, sumatoria saldo ' +
                'deudor, intereses con fecha a determinar, deuda extrajudicial (No incluir Conc/Quiebra, ' +
                'no incluir reclamos AFIP, no incluir Períodos Prescriptos).' + CRLF +
                'Muchas Gracias'
  else if sCodMensaje = 'M002' then
    sMensaje := 'Derivamos a ustedes, según la acción de referencia, contratos dados de baja ' +
                'por traspaso a otra Aseguradora, los cuales solicitamos se asignen a Estudios Jurídicos ' +
                'para su gestión extrajudicial, y la carga de los mismos por nro. de contrato ' +
                'al sistema.' + CRLF +
                'La impresión de los estados de cuenta deberá ser por Resumen, sumatoria saldo ' +
                'deudor, intereses con fecha a determinar, deuda extrajudicial (No incluir Conc/Quiebra, ' +
                'no incluir reclamos AFIP, no incluir Períodos Prescriptos).' + CRLF +
                'Muchas Gracias';

  sDirecciones := Get_DireccionesEnvioMail('MAIL_LEGAL');
  sUbicArchivo := TempPath + 'Contratos.xls';

  if sCodAsunto = 'A001' then
    begin   // se carga excel con los datos de la grilla de Empresas Rescindidas / de Baja por Traspaso
      sSql := Do_ArmarSqlContratos (IdSeleccion);

      with GetQuery (sSql) do
        try
          if not IsEmpty then
          begin
            if sCodMensaje = 'M001' then   // Empresas Rescindidas
              OpenQuery (sdqConsulta2, Get_SqlEmpresasRescidadasListaContratos (sSql))
            else                           // Empresas de Baja por Traspaso
              OpenQuery (sdqConsulta2, Get_SqlEmpresasBajaTraspasoListaContratos (sSql));

            if not sdqConsulta2.IsEmpty then
              sSqlListaContratos := 'hay datos';

            ExportDialog2.ExportFileType := etExcelFile;
            ExportDialog2.OutputFile     := sUbicArchivo;
            ExportDialog2.SaveToFile;
          end
        finally
          free
        end;
    end
  else
    begin   // se carga excel con los datos de la solapa Empresas
      PageControl.ActivePageIndex := PAGINA_EMPRESAS;
      PageControlChange( nil );

      if sdqEmpresa.Active and (not sdqEmpresa.IsEmpty) then
        begin
          sSqlListaContratos := 'hay datos';

          ExportDialog.ExportFileType := etExcelFile;
          ExportDialog.OutputFile     := sUbicArchivo;
          ExportDialog.SaveToFile;
        end
      else
        MsgBox( 'No se han encontrado contratos', MB_OK + MB_ICONERROR );

      PageControl.ActivePageIndex := PAGINA_PLANACCION;
      PageControlChange( nil );
    end;

  if (sDirecciones <> '') and (sMensaje <> '') and (sSqlListaContratos <>'' ) then
  begin
    EnviarMailBD( sDirecciones, sAsunto, [oDeleteAttach, oAutoFirma], sMensaje, GetAttachments(sUbicArchivo, 6), 0, tcDefault, False );
    Do_InsRegSelecAccionPlan( IdSeleccion, IdAccion );
  end else
    MsgBox( 'No se ha enviado el mail porque no se encontraron datos.', MB_OK + MB_ICONHAND );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.ValidarCondicionesBusquedaContrato(Contrato: Integer; SqlBusqueda: String): Boolean;
var
  sSql: String;
begin
  sSql := 'COBRANZA.DO_CARGARDEUDACOBRANZA(:CargaMasiva, :Usuario, :Contrato);';
  EjecutarStoreSTEx( sSql, ['N', frmPrincipal.DBLogin.UserID, Contrato] );

  sSql := SqlBusqueda + ' ' +
          'AND TDC.DC_USUARIO=:Usuario ' +
          'AND TDC.DC_CONTRATO=:Contrato';
  Result := ExisteSqlEx( sSql, [frmPrincipal.DBLogin.UserID, Contrato] );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.IsPrimeraAccionPlan(IdSeleccion, IdAccion: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ZPL_ACCIONENCABEZADOPLAN, ZCP_ENCABEZADOPLAN, ZSE_SELECCIONPLAN ' +
           'WHERE SE_IDENCABEZADOPLAN=CP_ID ' +
             'AND CP_ID=PL_IDENCABEZADOPLAN ' +
             'AND SE_ID=:IdSeleccion ' +
             'AND PL_IDACCIONPLAN=:IdAccion ' +
             'AND PL_ORDEN=1';

  Result := ExisteSqlEx(sSql, [IdSeleccion, IdAccion]);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.SetearBusquedaContratos(IdSeleccion: TTableId; VerificarCondicInicContratos: Boolean);
var
  sSql, sSqlBusqueda, sExcluirEmpresasPlan: String;
  Contrato, iCantReg: Integer;
  bProcesarContrato, bVerificarCondInic, bExcluirContrato: Boolean;
begin
  sSql := 'SELECT SE_SQLBUSQUEDA ' +
            'FROM ZSE_SELECCIONPLAN ' +
           'WHERE SE_ID=:IdSeleccion';
  sSqlBusqueda := ValorSqlEx( sSql, [IdSeleccion] );

  bVerificarCondInic   := (VerificarCondicInicContratos and (Trim( sSqlBusqueda ) <> ''));
  sExcluirEmpresasPlan := Is_ExcluirEmpresasPlan( IdSeleccion );

  sSql := 'SELECT CS_CONTRATO CONTRATO, CS_ID ID ' +
            'FROM ZCS_CONTRATOSELECCIONADOPLAN ' +
           'WHERE CS_IDSELECCIONPLAN=:IdSeleccion ' +
        'ORDER BY CS_CONTRATO';

  with GetQueryEx( sSql, [IdSeleccion] ) do
    try
      BeginTrans;
      try
        iCantReg := RecordCount;

        JvgPrgrssBusquedaContr.Percent := 0;
        JvgPrgrssBusquedaContr.Visible := True;
        Application.ProcessMessages;

        while not EOF do
          begin
            Contrato := FieldByName( 'CONTRATO' ).AsInteger;
            sbProcesoAccion.SimpleText := 'Verificando procesamiento del contrato: ' + IntToStr( Contrato );

            bExcluirContrato := Is_ExcluirContratoSeleccion( sExcluirEmpresasPlan, Contrato );

            if bExcluirContrato then
              bProcesarContrato := False
            else if bVerificarCondInic then
              bProcesarContrato := ValidarCondicionesBusquedaContrato( Contrato, sSqlBusqueda )
            else
              bProcesarContrato := True;

            sSql := 'UPDATE ZCS_CONTRATOSELECCIONADOPLAN ' +
                       'SET CS_PROCESARCONTRATO=' + SqlBoolean( bProcesarContrato ) + ' ' +
                     'WHERE CS_ID=' + SqlValue( FieldByName( 'ID' ).AsInteger );
            EjecutarSqlST( sSql );

            JvgPrgrssBusquedaContr.Percent := Round( (RecNo {$IFDEF VER150}+ 1{$ENDIF}) / iCantReg * 100 );
            Application.ProcessMessages;

            Next;
          end;

        JvgPrgrssBusquedaContr.Percent := 100;
        Application.ProcessMessages;

        CommitTrans;
      except
        on E: Exception do
          begin
            ErrorMsg( E, 'Error al setear los contratos de búsqueda' );
            RollBack;
            Abort;
          end;
      end;
    finally
      free;
      JvgPrgrssBusquedaContr.Visible := False;
      Application.ProcessMessages;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Is_ExcluirEmpresasPlan(IdSeleccion: TTableId): String;
var
  sSql: String;
begin
  sSql := 'DEUDA.IS_EXCLUIREMPRESASPLAN(:Seleccion)';

  Result := ObtenerValorEx( sSql, [IdSeleccion] );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Is_ExcluirContratoSeleccion(Excluir: String; Contrato: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'DEUDA.IS_EXCLUIRCONTRATOSELECCION(:Excluir, :Contrato)';

  Result := (ObtenerValorEx( sSql, [Excluir, Contrato] ) = 'S');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotalesEmpresas;
  pnlTotalRegistros.Visible := tbSumatoria.Down;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.CalcTotalesEmpresas;
var
  PrevCursor : TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Try
      GridEmpresa.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active Then
      begin
        SumFields( sdqEmpresa, CAMPOS_SUMA, TotalConsultaEmpr );
      end;
    except
      on E: Exception do ErrorMsg(E, 'Error al calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;

  if sdqEmpresa.Active and (not sdqEmpresa.IsEmpty) then
    edTotalRegistros.Value := sdqEmpresa.RecordCount
  else
    edTotalRegistros.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.GridEmpresaPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos : integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsultaEmpr[iPos]), '$');
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.mnuImprimirResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.mnuImprimirEstadoCuentaClick(Sender: TObject);
var
  sNombreArchivo: String;
begin
  if Is_ExisteArchivoEstCuentaFilaActual( sNombreArchivo ) then
    Do_ImprimirArchivoEstCuenta( sNombreArchivo );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.Is_ExisteArchivoEstCuentaFilaActual(var NombreArchivo: String): Boolean;
var
  IdSeleccion, IdAccion: TTableId;
  Contrato: Integer;
  bExiste: Boolean;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and sdqAccion.Active and (not sdqAccion.IsEmpty) and (not sdqEmpresa.IsEmpty) then
    begin
      IdSeleccion := sdqConsulta.FieldByName( 'IDSELEC' ).AsInteger;
      IdAccion    := sdqAccion.FieldByName( 'IDZAC' ).AsInteger;
      Contrato    := sdqEmpresa.FieldByName( 'CONTRATO' ).AsInteger;

      bExiste := Is_ExisteArchivoEstCuenta( IdSeleccion, IdAccion, Contrato, NombreArchivo );
    end
  else
    bExiste := False;

  Result := bExiste;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.pmuImpresionPopup(Sender: TObject);
var
  sNombreArchivo: String;
begin
  mnuImprimirEstadoCuenta.Visible := Is_ExisteArchivoEstCuentaFilaActual( sNombreArchivo );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.chkFiltrarContratoClick(Sender: TObject);
begin
  PageControlChange( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.fraEmpresaSeleccionOnChange(Sender: TObject);
begin
  PageControlChange( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.mnuEmisionEstadodeCuentaClick(Sender: TObject);
var
  sContrato: String;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) and sdqAccion.Active and (not sdqAccion.IsEmpty) and (not sdqEmpresa.IsEmpty) then
    begin
      sContrato := sdqEmpresa.FieldByName( 'CONTRATO' ).AsString;

      with TfrmImpresionEstadodeCuenta.Create( Self ) do
        begin
          Contratos.Add( sContrato );

          if IsPerfilConsulta then
            cbIntereses.Checked := True;

          ShowModal;
        end;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.Do_InsRegSelecAccionPlan(IdSeleccion, IdAccion: TTableId);
var
  sSql: String;
  iContrato: Integer;
begin
  sSql := Do_ArmarSqlContratos( IdSeleccion );

  with GetQuery( sSql ) do
    try
      while not EOF do
        begin
          iContrato := FieldByName( 'CONTRATO' ).AsInteger;
          Do_InsRegSelecContrAccionPlan( IdSeleccion, IdAccion, iContrato );

          Next;
        end;
    finally
      free;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.VerEventosSIC(Sender: TObject);
begin
  Verificar(sdqEmpresa.IsEmpty, nil, 'Debe seleccionar una empresa.');

  with TfrmAgendaVistaEmpresa.Create(Self) do
  try
    Visible := False;
    DoMostrarEventosAgenda(sdqEmpresa.FieldByName('CONTRATO').AsInteger);
    if fraVistaEventosPorEmpresa.sdqEventos.IsEmpty then
      InfoHint(tbAgenda, 'La empresa ' + fraAE_CONTRATO.RazonSocial + ' no registra ningún evento en el SIC')
    else
      ShowModal;
  finally
    Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.VerTareaAsociada(Sender: TObject);
const
  MOTIVO_GESTION_DEUDA = 314;
var
  sSQL: String;
  sdqTarea: TSDQuery;
begin
  Verificar(sdqEmpresa.IsEmpty, nil, 'Debe seleccionar una empresa.');
  sSQL := 'SELECT aat.*, ex_siniestro, ex_orden, ex_recaida ' +
          '  FROM agenda.aat_agendatarea aat, art.sex_expedientes ' +
          ' WHERE at_idexpediente = ex_id(+) ' +
          '   AND at_contrato = :contrato ' +
          '   AND at_estado = 1 ' +
          '   AND at_idtipoevento = :idmotivoevento';
  sdqTarea := GetQueryEx(sSQL, [sdqEmpresa.FieldByName('CONTRATO').AsInteger, MOTIVO_GESTION_DEUDA]);
  with sdqTarea do
  try
    if Active and (not IsEmpty) then
    begin
      Abrir(TfrmABMAgendaBaseTarea, frmABMAgendaBaseTarea, tmvNormal, nil);
      with frmABMAgendaBaseTarea do
      try
        HideAllBalloons;
        ModoABM := abmModificacion;
        LoadFromQuery(sdqTarea);

        Visible := False;
        ShowModal;
      finally
        frmABMAgendaBaseTarea.Free;
      end;
    end else
      InfoHint(nil, 'La empresa ' + sdqEmpresa.FieldByName('RAZONSOCIAL').AsString + ' no posee una tarea de gestión telefónica de deuda en estado pendiente.');
  finally
    Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.GridEmpresaGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
var
  Diferencia: Currency;
begin
  if not sdqEmpresa.FieldByName( 'FECHABAJA' ).IsNull then
    AFont.Color := clRed
  else if sdqEmpresa.FieldByName('ESVIP').AsString = 'S' then
    AFont.Color := clPurple;

  Diferencia := sdqEmpresa.FieldByName( 'DIFERENCIA' ).AsFloat;

  if Diferencia > 0 then
    Background := pnlColor1.Color   // verde
  else if Diferencia < 0 then
    Background := pnlColor2.Color   // rojo
  else
    Background := clWindow;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmGestionArrancarAccion.DoMostrarMensajeFinVE;
begin
  Delay(3000);
  Application.ProcessMessages;
  MsgBox('El proceso de envío por Ventanilla Electrónica ha finalizado.' + CRLF + 'Por favor, revise desde la pantalla de Administración de Cartas Documento si todas las cartas han sido enviadas correctamente.' + CRLF +
         'Tenga en cuenta que las cartas no enviadas por algún error no tienen fecha de impresión, en cuyo caso puede buscarlas por fecha de alta.', MB_ICONINFORMATION);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.SetTipoSalidaCarta: Boolean;
var
  iTipoSalida: Integer;
  sTipoSalida, sSql: String;
  bSalir, bSeleccionado: Boolean;
begin
  repeat
    iTipoSalida := SelectDlg('Tipo de Salida', ['Ventanilla Electrónica', 'Carta Documento'], 0, [soAllowCancel]);

    if iTipoSalida >= 0 then
      bSalir := True
    else
      bSalir := (MsgBox('Al cancelar el evento, no se ejecutarán los eventos siguientes de la acción. ¿ Confirma ?', MB_OKCANCEL + MB_ICONQUESTION ) = IDOK);
  until bSalir;

  bSeleccionado := (iTipoSalida >= 0);

  if bSeleccionado then
    begin
      case iTipoSalida of
        0: sTipoSalida := 'VE';
        1: sTipoSalida := 'C';
      end;

      sSql := 'ART.DEUDA.SETTIPOSALIDACARTA(:TipoSalida);';
      EjecutarStoreSTEx(sSql, [sTipoSalida]);
    end;

  Result := bSeleccionado;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.GetTipoSalidaCarta: String;
var
  sSql: String;
begin
  sSql := 'ART.DEUDA.GETTIPOSALIDACARTA';

  Result := ObtenerValor(sSql);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmGestionArrancarAccion.IsPermitirSaltearAccion(IdAccion: TTableId): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1 ' +
            'FROM ZEE_EVENTOPLAN, ZER_ACCIONEVENTOPLAN, ZAC_ACCIONPLAN ' +
           'WHERE TRIM(UPPER(EE_INSTRUCCION)) = ''DEUDA.GENERAR_GESTION_SIC'' ' +   // pusimos esto porque es necesario que siempre se llame a deuda.do_insregdeudaplan en la llamada a Deuda.Generar_Gestion_SIC
             'AND ER_IDEVENTOPLAN = EE_ID ' +
             'AND ER_IDACCIONPLAN = AC_ID ' +
             'AND EE_FECHABAJA IS NULL ' +
             'AND ER_FECHABAJA IS NULL ' +
             'AND AC_FECHABAJA IS NULL ' +
             'AND AC_ID = :Accion';

  Result := not ExisteSqlEx(sSql, [IdAccion]);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

