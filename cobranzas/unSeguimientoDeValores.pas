unit unSeguimientoDeValores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDbFrame, unFraEmpresa,
  unfraEmpresaDeudora, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, Mask, PatternEdit, IntEdit, ToolEdit,
  DateComboBox, FormPanel, unArtDBAwareFrame, CurrEdit, RxCurrEdit, RxToolEdit,
  RxPlacemnt;

type
  TfrmSeguimientoDeValores = class(TfrmCustomConsulta)
    gbEmpresa: TGroupBox;
    Bevel1: TBevel;
    rbEmpNormal: TRadioButton;
    rbEstudio: TRadioButton;
    fraEmpresaDeudora: TfraEmpresaDeudora;
    gbTipoValor: TGroupBox;
    gbEstado: TGroupBox;
    fraVA_ESTADO: TfraStaticCTB_TABLAS;
    gbOpciones: TGroupBox;
    Label2: TLabel;
    edVA_NROCHEQUE: TIntEdit;
    sdqEventos: TSDQuery;
    dsEventos: TDataSource;
    tbReemplazo: TToolButton;
    fpEventoNuevo: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Bevel2: TBevel;
    GroupBox1: TGroupBox;
    fraEC_EVENTO: TfraStaticCTB_TABLAS;
    edEC_OBSERVACIONES: TMemo;
    Label5: TLabel;
    cmbEC_FECHA: TDateComboBox;
    tbSeparador: TToolButton;
    tbVerReemplazados: TToolButton;
    Panel1: TPanel;
    GridEventos: TArtDBGrid;
    Splitter2: TSplitter;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton9: TToolButton;
    tbModificar2: TToolButton;
    tbEliminar2: TToolButton;
    ToolButton13: TToolButton;
    Label4: TLabel;
    tbSeparador2: TToolButton;
    Label6: TLabel;
    fraVA_IDBANCO: TfraStaticCodigoDescripcion;
    fraVA_TIPO: TfraStaticCodigoDescripcion;
    gbFechaRechazo: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    cmbVA_FECHARECHAZODesde: TDateComboBox;
    cmbVA_FECHARECHAZOHasta: TDateComboBox;
    gbGestor: TGroupBox;
    fraGestorCuenta: TfraStaticCodigoDescripcion;
    gbFechaVencimiento: TGroupBox;
    Label3: TLabel;
    Label9: TLabel;
    cmbVA_VENCIMIENTODesde: TDateComboBox;
    cmbVA_VENCIMIENTOHasta: TDateComboBox;
    gbImporte: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edVA_IMPORTEDesde: TCurrencyEdit;
    edVA_IMPORTEHasta: TCurrencyEdit;
    gbPlan: TGroupBox;
    Label1: TLabel;
    edPP_ID: TIntEdit;
    rgSector: TRadioGroup;
    GroupBox2: TGroupBox;
    fraEC_IDGESTOR: TfraStaticCodigoDescripcion;
    gbFechaDerivLeg: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    cmbFechaDerivLegDesde: TDateComboBox;
    cmbFechaDerivLegHasta: TDateComboBox;
    gbEstudioDerivacion: TGroupBox;
    fraEstudioDerivacion: TfraStaticCodigoDescripcion;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    cmbVA_FECHAALTADesde: TDateComboBox;
    cmbVA_FECHAALTAHasta: TDateComboBox;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    cmbVA_FECHARECHAZOEXTRACTODesde: TDateComboBox;
    cmbVA_FECHARECHAZOEXTRACTOHasta: TDateComboBox;
    tbMostrarRecibosPlanPago: TToolButton;
    fraEstudio: TfraStaticCodigoDescripcion;
    tbSumatoria: TToolButton;
    ToolButton1: TToolButton;
    tbSalir2: TToolButton;
    gbBoletaDep: TGroupBox;
    Label18: TLabel;
    edBD_NUMERO: TIntEdit;
    procedure FiltroEmpresa(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
    procedure tbReemplazoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbVerReemplazadosClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridEventosDblClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure fpEventoNuevoShow(Sender: TObject);
    procedure tbMostrarRecibosPlanPagoClick(Sender: TObject);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbEliminar2Click(Sender: TObject);
  private
    fModoAbm: String;  
    ListaValores: TStringList;

    function DoABM: boolean;
    function GeneraCartaEvento(IDEvento: String): String;
    function IsRegistrosRecibosPlanPagoValidos: Boolean;
    function Validar: boolean;

    procedure ActualizoGrillaEventos;
    procedure CalcTotales;
    procedure CargarValores;
    procedure fraEC_EVENTOOnChange(Sender: TObject);
    procedure MostrarAdic;
    procedure Validar_Derivacion(Codigo: String);
  protected
    procedure EnableButtons(AEnabled: Boolean); override;
  public
  end;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('VA_IMPORTE');

var
  frmSeguimientoDeValores: TfrmSeguimientoDeValores;
  TotalConsulta: Array of Extended;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, SqlFuncs, VCLExtra, CustomDlgs, unAdminReemplazoValores, unVerReemplazos,
  unGeneracionCartasEventos, unComunes, unRecibosValorPlanPago, DbFuncs, General, Strfuncs;

{$R *.DFM}

procedure TfrmSeguimientoDeValores.ActualizoGrillaEventos;
var
  sSql: String;
begin
  if (not sdqConsulta.Active) or (sdqConsulta.Eof) or (Grid.SelectedRows.Count > 1) or
     (not Grid.SelectedRows.CurrentRowSelected) then
  begin
    sdqEventos.Close;
    VCLExtra.LockControls(GridEventos, True);
  end
  else
  begin
    VCLExtra.LockControls(GridEventos, False);
    sSql :=
      'SELECT EC_ID, EVE.TB_DESCRIPCION EVENTO, EC_EVENTO, EC_FECHA, EC_FECHABAJA, EC_OBSERVACIONES, GC_NOMBRE,' +
            ' EC_IDGESTOR' +
       ' FROM AGC_GESTORCUENTA, ZEC_EVENTOCHEQUE, CTB_TABLAS EVE' +
      ' WHERE EC_EVENTO = TB_CODIGO' +
        ' AND TB_CLAVE = ''EVCHE''' +
        ' AND EC_IDGESTOR = GC_ID (+)' +
        ' AND EC_IDVALOR = ' + sdqConsulta.FieldByName('VA_ID').AsString;
    sdqEventos.SQL.Clear;
    OpenQuery(sdqEventos, sSql);
  end;
end;

procedure TfrmSeguimientoDeValores.FiltroEmpresa(Sender: TObject);
var
  bMostrarGestor: Boolean;
begin
  bMostrarGestor := (Sender = rbEstudio);

  fraEstudio.Visible        := bMostrarGestor;
  fraEmpresaDeudora.Visible := not bMostrarGestor;
end;

procedure TfrmSeguimientoDeValores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  
  Action := caFree;
  frmSeguimientoDeValores := nil;
  frmPrincipal.mnuSeguimientodeValores.Enabled := True;
  ListaValores.Free;
  ListaValores := nil;
end;

procedure TfrmSeguimientoDeValores.FormCreate(Sender: TObject);
begin
  inherited;
  frmPrincipal.mnuSeguimientodeValores.Enabled := False;

  fraEmpresaDeudora.IsDeudora := False;

  with fraVA_TIPO do
  begin
    TableName   := 'OTV_TIPOVALOR';
    FieldId     := 'TV_ID';
    FieldCodigo := 'TV_CODIGO';
    FieldDesc   := 'TV_DESCRIPCION';
    FieldBaja   := 'TV_USUBAJA';
    ShowBajas   := True;
  end;

  with fraGestorCuenta do
  begin
    TableName   := 'AGC_GESTORCUENTA';
    FieldID     := 'GC_ID';
    FieldCodigo := 'GC_ID';
    FieldDesc   := 'GC_NOMBRE';
    FieldBaja   := 'GC_FECHABAJA';
  end;

  with fraEstudioDerivacion do
  begin
    TableName      := 'AGC_GESTORCUENTA';
    FieldID        := 'GC_ID';
    FieldCodigo    := 'GC_ID';
    FieldDesc      := 'GC_NOMBRE';
    FieldBaja      := 'GC_FECHABAJA';
    ExtraCondition := 'AND GC_ESTUDIO = ''S''';
    ShowBajas      := True;
  end;

  with fraEC_IDGESTOR do
  begin
    TableName   := 'AGC_GESTORCUENTA';
    FieldID     := 'GC_ID';
    FieldCodigo := 'GC_ID';
    FieldDesc   := 'GC_NOMBRE';
    FieldBaja   := 'GC_FECHABAJA';
  end;

  with fraEstudio do
  begin
    TableName      := 'AGC_GESTORCUENTA';
    FieldID        := 'GC_ID';
    FieldCodigo    := 'GC_ID';
    FieldDesc      := 'GC_NOMBRE';
    FieldBaja      := 'GC_FECHABAJA';
    ExtraCondition := 'AND GC_ESTUDIO = ''S''';
    ShowBajas      := True;
  end;

  fraVA_ESTADO.Clave := 'ESVAL';
  fraEmpresaDeudora.ShowBajas := True;

  fraEC_EVENTO.OnChange := fraEC_EVENTOOnChange;

  Grid.Anchors := [akLeft,akTop,akRight,akBottom];

  tbMostrarRecibosPlanPago.Left := 31;
  tbVerReemplazados.Left        := 31;
  tbSeparador.Left              := 31;
  tbReemplazo.Left              := 31;
  tbSeparador2.Left             := 31;

  //panel evento nuevo
  fraEC_EVENTO.Clave := 'EVCHE';
  ListaValores := TStringList.Create;
  fModoAbm := '';
  ActualizoGrillaEventos;

  With fraVA_IDBANCO do
  begin
    TableName   := 'ZBA_BANCO';
    FieldId     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    ShowBajas   := False;
  end;

  SetLength(TotalConsulta, MAXCOLS + 1);

  FiltroEmpresa(nil);
end;

procedure TfrmSeguimientoDeValores.tbRefrescarClick(Sender: TObject);
var
  sOuterIdGestor: String;
  sSql: String;
  sSql1: String;
  sSql2: String;
  sWhere: String;
begin
  if fraGestorCuenta.IsSelected then
  begin
//    sWhere := sWhere + ' AND COBRANZA.GET_IDGESTORPLANVALOR(VA_ID) = ' + SqlValue(fraGestorCuenta.Value);
    sWhere := sWhere + ' AND GEST_PLAN.GC_ID = ' + SqlValue(fraGestorCuenta.Value);
    sOuterIdGestor := ' ';
  end
  else
    sOuterIdGestor := ' (+) ';

  sSql1 :=
    'SELECT VA_IDCONTRATO CONTRATO, TIP.TV_DESCRIPCION TIPO_VALOR, EST.TB_DESCRIPCION ESTADO, BA_CODIGO, BA_NOMBRE,' +
          ' VA_ID, VA_NROCHEQUE, NVL(VA_VENCIMIENTO, VA_FECHAALTA) VENCIMIENTO, VA_FECHARECHAZO, VA_IMPORTE,' +
          ' VA_ESTADO, EM_CUIT CUIT, EM_NOMBRE RAZON_SOCIAL, COBRANZA.GET_ULTIMOEVENTO(VA_ID) ULTIMO_EVENTO,' +
          ' DECODE(GEST_PLAN.GC_ESTUDIO, ''N'', GEST_PLAN.GC_NOMBRE, NULL) GESTOR,' +
          ' DECODE(GEST_PLAN.GC_ESTUDIO, ''S'', GEST_PLAN.GC_NOMBRE, NULL) ESTUDIO,' +
          ' LEGALES.GET_FECHACONCURSO(EM_CUIT) CONCURSO, LEGALES.GET_FECHAQUIEBRA(EM_CUIT) QUIEBRA,' +
          ' COBRANZA.GET_FECHAEVENTOVALOR(VA_ID, ''05'') FDERIV_EVENTOLEGALES,' +
          ' COBRANZA.GET_FECHAEVENTOVALOR(VA_ID, ''06'') FDERIV_EVENTOESTUDIO,' +
          ' GEST_ESTUDIO_DERIV.GC_NOMBRE ESTUDIO_DERIV, VA_FECHARECHAZOEXTRACTO FRECHAZO_EXTRACTO,' +
          ' COBRANZA.GET_PLANPAGO(VA_ID, VA_IDCONTRATO) PLANDEPAGO, TIP.TV_CODIGO TIPOVALOR, VA_IDGESTORCUENTA,' +
          ' VA_IDRECIBO, MOTRECH.TB_DESCRIPCION MOTRECHAZO, ESTCONTR.TB_DESCRIPCION ESTCONTRATO, BD_NUMERO BOLETADEP' +
     ' FROM RBD_BOLETADEPOSITO, AGC_GESTORCUENTA GEST_PLAN, AGC_GESTORCUENTA GEST_ESTUDIO_DERIV, USE_USUARIOS,' +
          ' OTV_TIPOVALOR TIP, CTB_TABLAS ESTCONTR, CTB_TABLAS MOTRECH, CTB_TABLAS EST, ZBA_BANCO, ZVA_VALOR,' +
          ' AEM_EMPRESA, ACO_CONTRATO' +
    ' WHERE VA_IDTIPOVALOR = TIP.TV_ID (+)' +
      ' AND VA_IDBANCO = BA_ID (+)' +
      ' AND VA_ESTADO = EST.TB_CODIGO (+)' +
      ' AND EST.TB_CLAVE (+)= ''ESVAL''' +
      ' AND CO_ESTADO = ESTCONTR.TB_CODIGO(+)' +
      ' AND ''AFEST'' = ESTCONTR.TB_CLAVE(+)' +
      ' AND VA_MOTIVORECHAZO = MOTRECH.TB_CODIGO(+)' +
      ' AND ''MRECH'' = MOTRECH.TB_CLAVE(+)' +
      ' AND VA_IDCONTRATO = CO_CONTRATO' +
      ' AND CO_IDEMPRESA = EM_ID' +
      ' AND VA_USUALTA = SE_USUARIO' +
      ' AND VA_IDBOLETADEP = BD_ID(+)' +
      ' AND COBRANZA.GET_IDESTUDIOEVENTOVALOR(VA_ID) = GEST_ESTUDIO_DERIV.GC_ID (+)' +
      ' AND COBRANZA.GET_IDGESTORPLANVALOR(VA_ID) = GEST_PLAN.GC_ID' + sOuterIdGestor;

  if not edPP_ID.IsEmpty then
    sSql1 := sSql1 +
      ' AND EXISTS (SELECT 1' +
                    ' FROM ZPV_PLANVALOR, ZPC_PLANCUOTA' +
                   ' WHERE PV_IDPLANCUOTA = PC_ID' +
                     ' AND PV_IDVALOR = VA_ID' +
                     ' AND PC_IDPLANPAGO = ' + SqlValue(edPP_ID.Value) + ')';

  sSql2 :=
    'SELECT TO_NUMBER (NULL) CONTRATO, TIP.TV_DESCRIPCION TIPO_VALOR, EST.TB_DESCRIPCION ESTADO, BA_CODIGO, BA_NOMBRE,' +
          ' VA_ID, VA_NROCHEQUE, NVL(VA_VENCIMIENTO, VA_FECHAALTA) VENCIMIENTO, VA_FECHARECHAZO, VA_IMPORTE,' +
          ' VA_ESTADO, GEST_PLAN.GC_CUIT CUIT, GEST_PLAN.GC_NOMBRE RAZON_SOCIAL,' +
          ' COBRANZA.GET_ULTIMOEVENTO(VA_ID) ULTIMO_EVENTO, NULL GESTOR, GEST_PLAN.GC_NOMBRE ESTUDIO,' +
          ' TO_DATE(NULL) CONCURSO, TO_DATE(NULL) QUIEBRA,' +
          ' COBRANZA.GET_FECHAEVENTOVALOR(VA_ID, ''05'') FDERIV_EVENTOLEGALES,' +
          ' COBRANZA.GET_FECHAEVENTOVALOR(VA_ID, ''06'') FDERIV_EVENTOESTUDIO,' +
          ' GEST_ESTUDIO_DERIV.GC_NOMBRE ESTUDIO_DERIV, VA_FECHARECHAZOEXTRACTO FRECHAZO_EXTRACTO,' +
          ' COBRANZA.GET_PLANPAGO(VA_ID, VA_IDCONTRATO) PLANDEPAGO, TIP.TV_CODIGO TIPOVALOR, VA_IDGESTORCUENTA,' +
          ' VA_IDRECIBO, MOTRECH.TB_DESCRIPCION MOTRECHAZO, NULL ESTCONTRATO, BD_NUMERO BOLETADEP' +
     ' FROM RBD_BOLETADEPOSITO, AGC_GESTORCUENTA GEST_PLAN, AGC_GESTORCUENTA GEST_ESTUDIO_DERIV, USE_USUARIOS,' +
          ' OTV_TIPOVALOR TIP, CTB_TABLAS MOTRECH, CTB_TABLAS EST, ZBA_BANCO, ZVA_VALOR' +
    ' WHERE VA_IDTIPOVALOR = TIP.TV_ID(+)' +
      ' AND VA_IDBANCO = BA_ID(+)' +
      ' AND VA_ESTADO = EST.TB_CODIGO(+)' +
      ' AND EST.TB_CLAVE(+) = ''ESVAL''' +
      ' AND VA_MOTIVORECHAZO = MOTRECH.TB_CODIGO(+)' +
      ' AND ''MRECH'' = MOTRECH.TB_CLAVE(+)' +
      ' AND VA_IDGESTORCUENTA = GEST_PLAN.GC_ID' +
      ' AND VA_USUALTA = SE_USUARIO' +
      ' AND VA_IDBOLETADEP = BD_ID(+)' +
      ' AND COBRANZA.GET_IDESTUDIOEVENTOVALOR (VA_ID) = GEST_ESTUDIO_DERIV.GC_ID(+)';

  sWhere := sWhere +
    SqlBetween(' AND VA_FECHARECHAZO', cmbVA_FECHARECHAZODesde.Date, cmbVA_FECHARECHAZOHasta.Date) +
    SqlBetween(' AND NVL(VA_VENCIMIENTO, VA_FECHAALTA)', cmbVA_VENCIMIENTODesde.Date, cmbVA_VENCIMIENTOHasta.Date) +
    SqlBetween(' AND VA_FECHAALTA', cmbVA_FECHAALTADesde.Date, cmbVA_FECHAALTAHasta.Date) +
    SqlBetween(' AND COBRANZA.GET_FECHAEVENTOVALOR(VA_ID, ''05'')', cmbFechaDerivLegDesde.Date, cmbFechaDerivLegHasta.Date) +
    SqlBetween(' AND VA_IMPORTE', edVA_IMPORTEDesde.Value, edVA_IMPORTEHasta.Value) +
    SqlBetween(' AND VA_FECHARECHAZOEXTRACTO', cmbVA_FECHARECHAZOEXTRACTODesde.Date, cmbVA_FECHARECHAZOEXTRACTOHasta.Date);

  if fraVA_TIPO.IsSelected then
    sWhere := sWhere + ' AND VA_IDTIPOVALOR = ' + SqlValue(fraVA_TIPO.Value);

  if fraVA_ESTADO.IsSelected then
    sWhere := sWhere + ' AND VA_ESTADO = ' + SqlValue(fraVA_ESTADO.Value);

  if not edVA_NROCHEQUE.IsEmpty then
    sWhere := sWhere + ' AND VA_NROCHEQUE = ' + SqlValue(edVA_NROCHEQUE.Text);

  if fraVA_IDBANCO.IsSelected then
    sWhere := sWhere + ' AND VA_IDBANCO = ' + SqlValue(fraVA_IDBANCO.Value);

  if fraEstudioDerivacion.IsSelected then
    sWhere := sWhere + ' AND COBRANZA.GET_IDESTUDIOEVENTOVALOR(VA_ID) = ' + SqlValue(fraEstudioDerivacion.Value);

  case rgSector.ItemIndex of
    0: sWhere := sWhere + ' AND (GEST_PLAN.GC_ESTUDIO = ''S'' OR (GEST_PLAN.GC_ESTUDIO IS NULL AND SE_SECTOR = ''LEGAL''))';   // legales
    1: sWhere := sWhere + ' AND (GEST_PLAN.GC_ESTUDIO = ''N'' OR (GEST_PLAN.GC_ESTUDIO IS NULL AND SE_SECTOR = ''COB''))';     // cobranzas
  end;

  if not edBD_NUMERO.IsEmpty then
    sWhere := sWhere + ' AND BD_NUMERO = ' + SqlValue(edBD_NUMERO.Value);

  if fraEmpresaDeudora.IsSelected or fraEstudio.IsSelected then
  begin
    if rbEmpNormal.Checked then
    begin
      sWhere := sWhere + ' AND CO_CONTRATO = ' + SqlValue(fraEmpresaDeudora.Contrato);
      sSql := sSql1 + sWhere;
    end
    else
    begin
      Verificar(not edPP_ID.IsEmpty, edPP_ID, 'Los filtros no son consistentes.');

      sWhere := sWhere + ' AND GEST_PLAN.GC_ID = ' + SqlValue(fraEstudio.Value);
      sSql := sSql2 + sWhere;
    end;
  end
  else
  begin
    if not edPP_ID.IsEmpty then
      sSql := sSql1 + sWhere
    else
      sSql := sSql1 + sWhere + ' UNION ALL ' + sSql2 + sWhere;
  end;

  sSql := sSql + SortDialog.OrderBy;
  
  //Cargo la grilla
  OpenQuery(sdqConsulta, sSql);
  CheckButtons;
end;

procedure TfrmSeguimientoDeValores.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                     var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if sdqConsulta.FieldByName('VA_ESTADO').AsString = '03' then
    AFont.Color := clRed;
end;

procedure TfrmSeguimientoDeValores.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ActualizoGrillaEventos;

  if (not sdqConsulta.Active) or (sdqConsulta.Bof) or (sdqConsulta.Eof) or (Grid.SelectedRows.Count > 1) then
    tbEliminar.Enabled := False
  else
    with DataSet do
      tbEliminar.Enabled := (not FieldByName('VA_IDGESTORCUENTA').IsNull) and (FieldByName('VA_IDRECIBO').IsNull);
end;

procedure TfrmSeguimientoDeValores.GridDblClick(Sender: TObject);
begin
  tbVerReemplazadosClick(nil);
end;

procedure TfrmSeguimientoDeValores.tbReemplazoClick(Sender: TObject);
var
  bEsTeso: Boolean;
  bValor: Boolean;
  Cuit: String;
  CuitActual: String;
  iloop: Integer;  
  RV_ID: String;
  RV_IDActual: String;
  Valor: String;
begin
  Verificar(Grid.SelectedRows.Count < 1, nil, 'Debe elegir al menos un registro.');

  //Me fijo si el usuario actual es de tesoreria o no
  bEsTeso := (ValorSql('SELECT 1' +
                        ' FROM USE_USUARIOS' +
                       ' WHERE SE_USUARIO = ''' + frmPrincipal.DBLogin.UserID + '''' +
                         ' AND ((SE_SECTOR = ''TESO'') OR (SE_SECTOR = ''COMPUTOS''))' +
                         ' AND SE_FECHABAJA IS NULL ','') = '1');
  //Compruebo los registros y los agrego si estan ok
  sdqConsulta.DisableControls;
  try
    ListaValores.Clear;
    RV_ID := '';
    RV_IDActual := '';
    Cuit := '';
    CuitActual := '';

    for iloop:= 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iloop]));

      Verificar((sdqConsulta.FieldByName('CONTRATO').AsString = '') and not bEsTeso, nil, 'No está autorizado para reemplazar valores de Tesorería.');
      Verificar((sdqConsulta.FieldByName('TIPOVALOR').AsString = 'EFE'), nil, 'No se puede reemplazar un valor que sea efectivo.');

      //Chequeo que el registro no haya sido reemplazado y si lo fue que no haya reemplazantes diferentes
      // entre los distintos valores
      Valor := sdqConsulta.FieldByName('VA_ID').AsString;

      bValor := ExisteSql('SELECT 1' +
                           ' FROM RRV_RECIBOVALOR, ZPV_PLANVALOR, ZVA_VALOR' +
                          ' WHERE VA_ESTADO = ''05''' +
                            ' AND VA_ID = ' + Valor +
                            ' AND PV_IDRECIBO = RV_ID' +
                            ' AND VA_ID = PV_IDVALOR');
      Verificar(bValor, nil, 'Alguno de los valores seleccionados ya ha sido reemplazado y tiene impreso su recibo.');

      Verificar(not sdqConsulta.FieldByName('BOLETADEP').IsNull and sdqConsulta.FieldByName('VA_FECHARECHAZO').IsNull, nil, 'Alguno de los valores seleccionados ya tiene boleta de depósito.');

      RV_IDActual := ValorSql('SELECT RD_IDREEMPLAZOVALOR' +
                               ' FROM ZRD_REEMPLAZODETALLE' +
                              ' WHERE RD_TIPO = ''R'' ' +
                                ' AND RD_IDVALOR = ' + Valor);
      if (RV_IDActual <> RV_ID) and (iloop <> 0) then
      begin
        if RV_IDActual = '' then
          InfoHint(nil, 'Algunos valores ya han sido reemplazados.', True)
        else
          InfoHint(nil, 'Algunos valores poseen reemplazantes distintos.', True);
      end
      else
        RV_ID := RV_IDActual;

      //Chequeo que no haya valores correspondientes a distintos contratos
      CuitActual := sdqConsulta.FieldByName('CUIT').AsString;
      Verificar((CuitActual <> Cuit) and (iloop <> 0), nil, 'Los valores deben poseer el mismo CUIT.');

      Cuit := CuitActual;

      ListaValores.Add(Valor);
    end;
  finally
    sdqConsulta.EnableControls;
  end;

  frmAdminReemplazoValores.Free;
  frmAdminReemplazoValores := TfrmAdminReemplazoValores.Create(Self);
  frmAdminReemplazoValores.Preparar(ListaValores, RV_ID);
end;

procedure TfrmSeguimientoDeValores.btnCancelarClick(Sender: TObject);
begin
  inherited;
  fpEventoNuevo.ModalResult := mrCancel;
end;

procedure TfrmSeguimientoDeValores.btnAceptarClick(Sender: TObject);
begin
  if Validar and DoAbm then
    fpEventoNuevo.ModalResult := mrOk;
end;

function TfrmSeguimientoDeValores.DoABM: Boolean;
var
  IDCarta: String;
  IDEvento: String;
  iloop: Integer;
  SqlEvento: TSql;
begin
  Result := True;
  SqlEvento := TSql.Create('ZEC_EVENTOCHEQUE');
  BeginTrans;
  try
    try
      if fModoAbm = 'alta' then
      begin
        SqlEvento.SqlType := stInsert;

        for iloop := 0 to ListaValores.Count - 1 do
        begin
          SqlEvento.Clear;
          SqlEvento.TableName := 'ZEC_EVENTOCHEQUE';

          IDEvento := ValorSql('SELECT SEQ_ZEC_ID.NEXTVAL FROM DUAL');

          SqlEvento.PrimaryKey.Add('EC_ID',        IDEvento, False);
          SqlEvento.Fields.Add('EC_EVENTO',        fraEC_EVENTO.Value);
          SqlEvento.Fields.Add('EC_FECHA',         cmbEC_FECHA.Date);
          SqlEvento.Fields.Add('EC_IDGESTOR',      fraEC_IDGESTOR.Value);
          SqlEvento.Fields.Add('EC_OBSERVACIONES', edEC_OBSERVACIONES.Lines.Text);
          SqlEvento.Fields.Add('EC_USUALTA',       frmPrincipal.DBLogin.UserID);
          SqlEvento.Fields.Add('EC_FECHAALTA',     'ACTUALDATE', False);
          SqlEvento.Fields.Add('EC_IDVALOR',       ListaValores.Strings[iloop], False);
          EjecutarSqlST(SqlEvento.Sql);

          IDCarta := GeneraCartaEvento (IDEvento);
          if IDCarta <> '' then
            EjecutarSqlST('UPDATE ZEC_EVENTOCHEQUE' +
                            ' SET EC_IDCARTA = ' + IDCarta +
                          ' WHERE EC_ID = ' + IDEvento);
        end;
      end
      else if fModoAbm = 'modif' then
      begin
        SqlEvento.SqlType := stUpdate;
        SqlEvento.Clear;
        SqlEvento.TableName := 'ZEC_EVENTOCHEQUE';

        SqlEvento.PrimaryKey.Add('EC_ID',        sdqEventos.FieldByName('EC_ID').AsString, False);
        SqlEvento.Fields.Add('EC_IDGESTOR',      fraEC_IDGESTOR.Value);
        SqlEvento.Fields.Add('EC_OBSERVACIONES', edEC_OBSERVACIONES.Lines.Text);
        SqlEvento.Fields.Add('EC_USUMODIF',      frmPrincipal.DBLogin.UserID);
        SqlEvento.Fields.Add('EC_FECHAMODIF',    'ACTUALDATE', False);
        EjecutarSqlST(SqlEvento.Sql);
      end
      else if fModoAbm = 'baja' then
      begin
        SqlEvento.SqlType := stUpdate;
        SqlEvento.Clear;
        SqlEvento.TableName := 'ZEC_EVENTOCHEQUE';

        SqlEvento.PrimaryKey.Add('EC_ID',    sdqEventos.FieldByName('EC_ID').AsString, False);
        SqlEvento.Fields.Add('EC_USUBAJA',   frmPrincipal.DBLogin.UserID);
        SqlEvento.Fields.Add('EC_FECHABAJA', 'ACTUALDATE', False);
        EjecutarSqlST(SqlEvento.Sql);
      end;

      CommitTrans;
      MessageDlg('La operación se ha realizado con éxito.', mtInformation, [mbOK], 0);
    except
      on E:Exception do
      begin
        Result := False;
        RollBack;
        MessageDlg(E.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally
    SqlEvento.Free;
  end;
end;

function TfrmSeguimientoDeValores.Validar: Boolean;
begin
  Verificar(cmbEC_FECHA.IsEmpty, cmbEC_FECHA, 'La fecha de alta del evento es obligatoria.');
  Verificar(fraEC_EVENTO.IsEmpty, fraEC_EVENTO.edCodigo, 'El evento es obligatorio.');
  Verificar((fraEC_EVENTO.Codigo = '06') and fraEC_IDGESTOR.IsEmpty, fraEC_IDGESTOR.edCodigo, 'El estudio es obligatorio.'); // Derivación a Estudio
  Validar_Derivacion('05');  // Derivación a Legales
  Validar_Derivacion('06');  // Derivación a Estudio
  
  Result := True;
end;

procedure TfrmSeguimientoDeValores.tbNuevoClick(Sender: TObject);
begin
  cmbEC_FECHA.Clear;
  fraEC_EVENTO.Clear;
  edEC_OBSERVACIONES.Clear;
  fraEC_IDGESTOR.Clear;
  VCLExtra.LockControls([cmbEC_FECHA, fraEC_EVENTO], False);
  Verificar(Grid.SelectedRows.Count < 1, nil, 'Debe elegir al menos un registro.');

  CargarValores;
  fModoAbm := 'alta';

  fpEventoNuevo.ActiveControl := cmbEC_FECHA;

  if fpEventoNuevo.ShowModal = mrOk then
    ActualizoGrillaEventos;
end;

procedure TfrmSeguimientoDeValores.tbModificarClick(Sender: TObject);
begin
  Verificar((not sdqEventos.Active) or (sdqEventos.Eof), nil, 'Debe elegir al menos un registro.');
  Verificar(not sdqEventos.FieldByName('EC_FECHABAJA').IsNull, nil, 'El evento ha sido dado de baja.');

  fModoAbm := 'modif';
  cmbEC_FECHA.Date              := sdqEventos.FieldByName('EC_FECHA').AsDateTime;
  fraEC_EVENTO.Value            := sdqEventos.FieldByName('EC_EVENTO').AsString;
  edEC_OBSERVACIONES.Lines.Text := sdqEventos.FieldByName('EC_OBSERVACIONES').AsString;
  fraEC_IDGESTOR.Value          := sdqEventos.FieldByName('EC_IDGESTOR').AsInteger;

  VCLExtra.LockControls([cmbEC_FECHA, fraEC_EVENTO], True);

  fpEventoNuevo.ActiveControl := edEC_OBSERVACIONES;

  if fpEventoNuevo.ShowModal = mrOk then
    ActualizoGrillaEventos;
end;

procedure TfrmSeguimientoDeValores.tbEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM ZPV_PLANVALOR' +
    ' WHERE PV_IDVALOR = ' + sdqConsulta.FieldByName('VA_ID').AsString;

  if ValorSqlInteger(sSql) > 0 then
  begin
    MessageDlg('' + #13 + #10 + 'El valor no debe estar asociado a ningún plan de pago.', mtWarning, [mbOK], 0);
    Exit;
  end;

  sSql := 'DELETE FROM ZVA_VALOR WHERE VA_ID = ' + sdqConsulta.FieldByName('VA_ID').AsString;
  EjecutarSql(sSql);
  tbRefrescarClick(nil);
end;

procedure TfrmSeguimientoDeValores.GridEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                            var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqEventos.FieldByName('EC_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmSeguimientoDeValores.MostrarAdic;
begin
  frmVerReemplazos.Free;
  frmVerReemplazos := TfrmVerReemplazos.Create(Self);
  frmVerReemplazos.Preparar(sdqConsulta.FieldByName('VA_ID').AsInteger);
end;

procedure TfrmSeguimientoDeValores.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  rbEmpNormal.Checked := True;
  fraEmpresaDeudora.Clear;
  fraVA_TIPO.Clear;
  fraVA_ESTADO.Clear;
  edPP_ID.Clear;
  edVA_NROCHEQUE.Clear;
  cmbVA_FECHARECHAZODesde.Clear;
  cmbVA_FECHARECHAZOHasta.Clear;
  cmbVA_VENCIMIENTODesde.Clear;
  cmbVA_VENCIMIENTOHasta.Clear;
  cmbFechaDerivLegDesde.Clear;
  cmbFechaDerivLegHasta.Clear;
  cmbVA_FECHAALTADesde.Clear;
  cmbVA_FECHAALTAHasta.Clear;
  cmbVA_FECHARECHAZOEXTRACTODesde.Clear;
  cmbVA_FECHARECHAZOEXTRACTOHasta.Clear;
  fraVA_IDBANCO.Clear;
  fraGestorCuenta.Clear;
  fraEstudio.Clear;
  edVA_IMPORTEDesde.Clear;
  edVA_IMPORTEHasta.Clear;
  fraEstudioDerivacion.Clear;
  edBD_NUMERO.Clear;
  rgSector.ItemIndex := 2;   // todos

  ActualizoGrillaEventos;

  fraEmpresaDeudora.mskCUIT.SetFocus;
end;

procedure TfrmSeguimientoDeValores.tbVerReemplazadosClick(Sender: TObject);
begin
  //Consulta de valores rechazados y reemplazados
  Verificar((not sdqConsulta.Active) or (sdqConsulta.Eof), nil, 'Debe elegir al menos un registro.');
  Verificar((sdqConsulta.FieldByName('TIPOVALOR').AsString = 'EFE'), nil, 'El valor no puede ser efectivo.');
  Verificar((sdqConsulta.FieldByName('VA_ESTADO').AsString <> '07') and (sdqConsulta.FieldByName('VA_ESTADO').AsString <> '05'), nil, 'El estado debe ser reemplazado o reemplazado parcial.');
  
  MostrarAdic;
end;

procedure TfrmSeguimientoDeValores.CargarValores;
var
  iloop: Integer;
begin
  sdqConsulta.DisableControls;
  try
    ListaValores.Clear;
    for iloop := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(Pointer(Grid.SelectedRows.Items[iloop]));
      ListaValores.Add(sdqConsulta.FieldByName('VA_ID').AsString);
    end;
  finally
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmSeguimientoDeValores.GridCellClick(Column: TColumn);
begin
  inherited;
  ActualizoGrillaEventos;
end;

procedure TfrmSeguimientoDeValores.GridEventosDblClick(Sender: TObject);
begin
  inherited;
  tbModificarClick(nil);
end;

procedure TfrmSeguimientoDeValores.EnableButtons(AEnabled: Boolean);
begin
  inherited;
  tbModificar2.Enabled  := AEnabled;
  tbEliminar2.Enabled   := AEnabled;
end;

function TfrmSeguimientoDeValores.GeneraCartaEvento(IDEvento: String): String;
var
  TextoArea: String;
  AIDCarta: String;
begin
//Decide si corresponde una carta o no

  TextoArea := ValorSql('SELECT TB_ESPECIAL1' +
                         ' FROM CTB_TABLAS' +
                        ' WHERE TB_CLAVE = ''EVCHE''' +
                          ' AND TB_CODIGO = ' + fraEC_EVENTO.Value);
  if TextoArea <> '' then
  begin
    frmGeneracionCartasEventos := TfrmGeneracionCartasEventos.Create(Self);
    try
      frmGeneracionCartasEventos.Evento    := IDEvento;
      frmGeneracionCartasEventos.TextoArea := TextoArea;
      frmGeneracionCartasEventos.Preparar;
      frmGeneracionCartasEventos.Mostrar;
      AIDCarta := IntToStr(frmGeneracionCartasEventos.IDCarta);
    finally
      frmGeneracionCartasEventos.Free;
      frmGeneracionCartasEventos := nil;
    end;
  end
  else
    AIDCarta := '';

  Result := AIDCarta;
end;

procedure TfrmSeguimientoDeValores.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('VA_IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('VA_IMPORTE')).Currency := True;
end;

procedure TfrmSeguimientoDeValores.Validar_Derivacion(Codigo: String);
var
  iloop: Integer;
  sSql: String;
begin
  if (fModoAbm = 'alta') and (fraEC_EVENTO.Codigo = Codigo) then
    for iloop:= 0 to ListaValores.Count-1 do
    begin
      sSql :=
        'SELECT 1' +
         ' FROM ZEC_EVENTOCHEQUE' +
        ' WHERE EC_EVENTO = ' + SqlValue(Codigo) +
          ' AND EC_IDVALOR = ' + SqlValue(StrToInt(ListaValores.Strings[iloop])) +
          ' AND EC_FECHABAJA IS NULL';

      if ExisteSql(sSql) then
        InfoHint(nil, 'Ya existe un valor con un evento activo de este tipo.', True);
    end;
end;

procedure TfrmSeguimientoDeValores.fraEC_EVENTOOnChange(Sender: TObject);
var
  bEsDerivacionEstudio: Boolean;
begin
  bEsDerivacionEstudio := (fraEC_EVENTO.Codigo = '06');  // Derivación a Estudio

  VclExtra.LockControl(fraEC_IDGESTOR, not bEsDerivacionEstudio);

  if not bEsDerivacionEstudio then
    fraEC_IDGESTOR.Clear;
end;

procedure TfrmSeguimientoDeValores.fpEventoNuevoShow(Sender: TObject);
begin
  fraEC_EVENTOOnChange(nil);
end;

procedure TfrmSeguimientoDeValores.tbMostrarRecibosPlanPagoClick(Sender: TObject);
begin
  if IsRegistrosRecibosPlanPagoValidos then
    with TfrmRecibosValorPlanPago.Create(Self) do
    try
      DoCargarRecibosValorPlanPago(sdqConsulta.FieldByName('VA_ID').AsInteger);
    finally
      Free;
    end;
end;

function TfrmSeguimientoDeValores.IsRegistrosRecibosPlanPagoValidos: Boolean;
begin
  Result := False;

  if Grid.SelectedRows.Count <> 1 then
    InvalidMsg(Grid, 'Debe seleccionar una fila de la grilla.')

  else if GetTipoReciboValor(sdqConsulta.FieldByName('VA_ID').AsInteger) <> '03' then   // Recibo-Plan Pago'
    InvalidMsg(Grid, 'El recibo debe ser de un plan de pago.')

  else
    Result := True;
end;

procedure TfrmSeguimientoDeValores.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmSeguimientoDeValores.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmSeguimientoDeValores.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                                   FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmSeguimientoDeValores.tbEliminar2Click(Sender: TObject);
begin
  Verificar((not sdqEventos.Active) or (sdqEventos.Eof), nil, 'Debe elegir al menos un registro.');
  Verificar(not sdqEventos.FieldByName('EC_FECHABAJA').IsNull, nil, 'El evento ha sido dado de baja.');

  if (MsgBox('¿ Está usted seguro de querer dar de baja el evento ?', MB_YESNO, 'Confirmación') = mrYes) then
  begin
    fModoAbm := 'baja';
    if DoAbm then
      ActualizoGrillaEventos;
  end;
end;

end.
