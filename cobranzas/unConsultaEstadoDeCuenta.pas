unit unConsultaEstadoDeCuenta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtFrame, unArtDbFrame, unFraEmpresa, Mask,
  ToolEdit, DateComboBox, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS, unfraLocalidad, unfraVendedores,
  unFraEntidades, PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, Menus, CardinalEdit, unArtDBAwareFrame,
  unFraCodigoDescripcion, DBCtrls, FormPanel, unFraCodDesc, RxToolEdit,
  RxPlacemnt;

type
  TfrmConsultaEstadoDeCuenta = class(TfrmCustomConsulta)
    gbEmpresa: TGroupBox;
    Label1: TLabel;
    tbVerEstado: TToolButton;
    gbVigencia: TGroupBox;
    cmbCO_VIGENCIADESDE: TDateComboBox;
    cmbCO_VIGENCIAHASTA: TDateComboBox;
    Label2: TLabel;
    Label3: TLabel;
    gbBaja: TGroupBox;
    cmbCO_FECHABAJADesde: TDateComboBox;
    Label4: TLabel;
    fraCO_MOTIVOBAJA: TfraStaticCTB_TABLAS;
    Label5: TLabel;
    gbHolding: TGroupBox;
    gbPeriodos: TGroupBox;
    rbTodosPeriodos: TRadioButton;
    rbDeudaPeriodos: TRadioButton;
    rbSaldoPeriodos: TRadioButton;
    gbDomicilio: TGroupBox;
    fraLocalidad: TfraLocalidad;
    gbLegales: TGroupBox;
    chkConcurso: TCheckBox;
    chkQuiebra: TCheckBox;
    gbEntVend: TGroupBox;
    Label6: TLabel;
    fraEntidades: TfraEntidades;
    Label7: TLabel;
    fraVendedores: TfraVendedores;
    gbSector: TGroupBox;
    fraEM_SECT: TfraStaticCTB_TABLAS;
    gbGestor: TGroupBox;
    fraGestorCuenta: TfraStaticCodigoDescripcion;
    gbEjecutivo: TGroupBox;
    fraEjecutivo: TfraStaticCodigoDescripcion;
    gbEstado: TGroupBox;
    cmbCO_ESTADO: TCheckCombo;
    mnuImpresion: TPopupMenu;
    mnuImprimirReporte: TMenuItem;
    Panel2: TPanel;
    edCantContratos: TCardinalEdit;
    Panel1: TPanel;
    edTotalContratos: TCardinalEdit;
    ToolButton1: TToolButton;
    tbCalcularTotal: TToolButton;
    ToolButton2: TToolButton;
    tbAgregarContratos: TToolButton;
    fraEM_ID: TfraEmpresa;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    Label8: TLabel;
    cmbCO_FECHABAJAHasta: TDateComboBox;
    tb441Web: TToolButton;
    fpPeriodosDisponibles: TFormPanel;
    Label9: TLabel;
    dblcbPeriodo: TDBLookupComboBox;
    btnGenerar: TButton;
    dsPeriodo: TDataSource;
    sdqPeriodo: TSDQuery;
    gbEstudio: TGroupBox;
    fraStaticEstudio: TfraStaticCodigoDescripcion;
    gbDelegacion: TGroupBox;
    fraDelegacion: TfraCodDesc;
    fraHOLDING: TfraCodDesc;
    fpAprobarEmisionCertificado: TFormPanel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    Bevel1: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edFechaCertificadoCobertura: TDateComboBox;
    rgPermite: TRadioGroup;
    memoObservaciones: TMemo;
    tbLibreDeuda: TToolButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbVerEstadoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridDblClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure mnuImprimirReporteClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbCalcularTotalClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbAgregarContratosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure tb441WebClick(Sender: TObject);
    procedure fpPeriodosDisponiblesKeyPress(Sender: TObject; var Key: Char);
    procedure btnGenerarClick(Sender: TObject);
    procedure tbLibreDeudaClick(Sender: TObject);
  private
    psContratos: String;

    function EncodeInt(const iInt: Int64): String;
    function ValidarLibreDeudaGrilla: Boolean;

    procedure CalcularCantTotalReg;
    procedure CalcularFilasSel;
    procedure CambiaEntidad(Sender: TObject);
    procedure CambiaVendedor(Sender: TObject);
    procedure CargarComboEstado;
    procedure InicializarContadores(ActualizarCantContratos: Boolean);
  public
    function EncodeContrato(Contrato: Int64): String;
  end;

var
  frmConsultaEstadoDeCuenta: TfrmConsultaEstadoDeCuenta;

implementation

{$R *.DFM}

uses
  unPrincipal, unDmPrincipal, unAdminEstadoDeCuenta, AnsiSql, unImpresionEstadoDeCuenta, General, unComunes, ShellAPI,
  CustomDlgs, VCLExtra, SqlFuncs, unSesion, unEstadoCuenta, unCobranzas, StrFuncs;

procedure TfrmConsultaEstadoDeCuenta.tbRefrescarClick(Sender: TObject);
var
  bPorEntidadVend: Boolean;
  iLoop: Integer;
  sSql: String;
  sWhere: String;
begin
  bPorEntidadVend := ((not fraEntidades.IsEmpty) or (not fraVendedores.IsEmpty));

  sSql :=
    'SELECT ' + IIF(bPorEntidadVend, 'DISTINCT', '') + ' AEM.EM_NOMBRE, ACO.CO_CONTRATO, AEM.EM_CUIT,' +
              ' ADC.DC_TELEFONOS || ADC.DC_FAX DC_TELEFONOS, CAC.AC_CODIGO, CAC.AC_DESCRIPCION,' +
              ' AFILIACION.MSG_COBERTURAACTIVO(ACO.CO_CONTRATO) AS ESTADO, ACO.CO_VIGENCIADESDE, ACO.CO_VIGENCIAHASTA,' +
              ' ACO.CO_FECHABAJA, BAJ.TB_DESCRIPCION AS MOTIVO_BAJA, AGC.GC_NOMBRE, AEC.EC_NOMBRE,' +
              ' GE_DESCRIPCION AS HOLDING, LEGALES.GET_FECHACONCURSO(AEM.EM_CUIT) AS CONCURSO,' +
              ' LEGALES.GET_FECHAQUIEBRA(AEM.EM_CUIT) AS QUIEBRA,' +
              ' ART.UTILES.ARMAR_DOMICILIO(DC_CALLE, DC_NUMERO, DC_PISO, DC_DEPARTAMENTO, NULL) AS DOM_POSTAL,' +
              ' ART.UTILES.ARMAR_LOCALIDAD(DC_CPOSTAL, NULL, DC_LOCALIDAD, DC_PROVINCIA) AS LOC_POSTAL,' +
              ' DEUDA.GET_TOTALPAGOS(ACO.CO_CONTRATO) AS PAGOS,' +
              ' DEUDA.GET_TOTALDEVENGADOS(ACO.CO_CONTRATO) AS DEVENGADOS,' +
              ' DEUDA.GET_TOTALDEUDA(ACO.CO_CONTRATO) AS DEUDA_TOTAL, NVL(EST.GC_NOMBRE, ''SIN ESTUDIO'') ESTUDIO,' +
              ' ACO.CO_ESTADO, ACO.CO_MOTIVOBAJA,AFILIACION.IS_EMPRESAVIP(ACO.CO_CONTRATO) ESVIP' +
         ' FROM AEM_EMPRESA AEM, ACO_CONTRATO ACO, ADC_DOMICILIOCONTRATO ADC, CAC_ACTIVIDAD CAC, CTB_TABLAS BAJ,' +
              ' AGC_GESTORCUENTA EST, AGC_GESTORCUENTA AGC, AEC_EJECUTIVOCUENTA AEC, AGE_GRUPOECONOMICO';

  if bPorEntidadVend then
    sSql := sSql + ', XEV_ENTIDADVENDEDOR XEV, AVC_VENDEDORCONTRATO AVC';

  sSql := sSql +
    ' WHERE AEM.EM_ID	= ACO.CO_IDEMPRESA' +
      ' AND ACO.CO_CONTRATO         = ADC.DC_CONTRATO' +
      ' AND ADC.DC_TIPO 	          = ''L''' +
      ' AND ACO.CO_IDACTIVIDAD      = CAC.AC_ID' +
      ' AND BAJ.TB_CLAVE(+)         = ''MOTIB''' +
      ' AND ACO.CO_MOTIVOBAJA       = BAJ.TB_CODIGO(+)' +
      ' AND ACO.CO_IDESTUDIO        = EST.GC_ID(+)' +
      ' AND ACO.CO_IDGESTOR         = AGC.GC_ID(+)' +
      ' AND ACO.CO_IDEJECUTIVO      = AEC.EC_ID(+)' +
      ' AND AEM.EM_IDGRUPOECONOMICO = GE_ID(+)';

  sWhere := '';
  if fraEM_ID.IsSelected then
    sWhere := sWhere + ' AND AEM.EM_CUIT = ' + SqlValue(fraEM_ID.mskCUIT.Text);

  if not cmbCO_VIGENCIADESDE.IsEmpty then
    sWhere := sWhere + ' AND ACO.CO_VIGENCIADESDE = ' + SqlValue(cmbCO_VIGENCIADESDE.Date);

  if not cmbCO_VIGENCIAHASTA.IsEmpty then
    sWhere := sWhere + ' AND ACO.CO_VIGENCIAHASTA = ' + SqlValue(cmbCO_VIGENCIAHASTA.Date);

  sWhere := sWhere + SqlBetween(' AND CO_FECHABAJA', cmbCO_FECHABAJADesde.Date, cmbCO_FECHABAJAHasta.Date);

  if not fraCO_MOTIVOBAJA.IsEmpty then
    sWhere := sWhere + ' AND ACO.CO_MOTIVOBAJA = ' + SqlValue(fraCO_MOTIVOBAJA.Value);

  if not fraHOLDING.IsEmpty then
    sWhere := sWhere + ' AND AEM.EM_IDGRUPOECONOMICO = ' + SqlValue(fraHOLDING.Value);

  if fraLocalidad.IsSelected then
    sWhere := sWhere + fraLocalidad.GetWhere;

  if rbDeudaPeriodos.Checked then
    sWhere := sWhere + ' AND DEUDA.GET_TOTALDEUDA(ACO.CO_CONTRATO) > 0';

  if rbSaldoPeriodos.Checked then
    sWhere := sWhere + ' AND DEUDA.GET_TOTALDEUDA(ACO.CO_CONTRATO) < 0';

  if chkConcurso.Checked then
    sWhere := sWhere + ' AND LEGALES.GET_FECHACONCURSO(AEM.EM_CUIT) IS NOT NULL';

  if chkQuiebra.Checked then
    sWhere := sWhere + ' AND LEGALES.GET_FECHAQUIEBRA(AEM.EM_CUIT) IS NOT NULL';

  if fraEM_SECT.IsSelected then
    sWhere := sWhere + ' AND EM_SECTOR = ' +  SqlValue(fraEM_SECT.Value);

  if bPorEntidadVend then
  begin
    sWhere := sWhere +
      ' AND ACO.CO_CONTRATO = AVC.VC_CONTRATO' +
      ' AND AVC.VC_IDENTIDADVEND = XEV.EV_ID' +
      ' AND AVC.VC_FECHABAJA IS NULL' +
      ' AND AVC.VC_ID = COMISION.GET_ULTIDENTIDADVENDCONTRATO(ACO.CO_CONTRATO)';

    if not fraEntidades.IsEmpty then
      sWhere := sWhere + ' AND XEV.EV_IDENTIDAD = ' + IntToStr(fraEntidades.Value);

    if not fraVendedores.IsEmpty then
      sWhere := sWhere + ' AND XEV.EV_IDVENDEDOR = ' + IntToStr(fraVendedores.Value);
  end;

  if not fraGestorCuenta.IsEmpty then
    sWhere := sWhere + ' AND ACO.CO_IDGESTOR = ' + IntToStr(fraGestorCuenta.Value);

  if not fraEjecutivo.IsEmpty then
    sWhere := sWhere + ' AND ACO.CO_IDEJECUTIVO = ' + IntToStr(fraEjecutivo.Value);

  if not fraStaticEstudio.IsEmpty then
    sWhere := sWhere + ' AND ACO.CO_IDESTUDIO = ' + SqlValue(fraStaticEstudio.Value);

  if cmbCO_ESTADO.Text <> '' then
  begin
    sWhere := sWhere + ' AND ACO.CO_ESTADO IN (';
    for iLoop := 0 to cmbCO_ESTADO.Items.Count - 1 do
      if cmbCO_ESTADO.Checked[iloop] then
        sWhere := sWhere + (cmbCO_ESTADO.Items.Objects[iLoop] as TCadena).Cadena + ',';
    sWhere := Copy(sWhere, 1, Length(sWhere) - 1) + ')';
  end;

  if not fraDelegacion.IsEmpty then
    sWhere := sWhere +
      ' AND EXISTS(SELECT 1' +
                   ' FROM adc_delegacioncontrato' +
                  ' WHERE dc_contrato = co_contrato' +
                    ' AND dc_iddelegacion = ' + SqlValue(fraDelegacion.Value) +
                    ' AND dc_fecha_hasta IS NULL)';

  sWhere := sWhere + IIF(psContratos = '', '', ' AND CO_CONTRATO IN (' + psContratos + ')');

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;

  InicializarContadores(True);

  if sdqConsulta.IsEmpty then
    MessageDlg('No existen datos para esta selección.', mtWarning, [mbOK], 0);
end;

procedure TfrmConsultaEstadoDeCuenta.FormCreate(Sender: TObject);
var
  sSql: String;
begin
  inherited;
  
  tbLibreDeuda.Left       := 77;
  tbAgregarContratos.Left := 54;
  tbVerEstado.Left        := 31;

  fraCO_MOTIVOBAJA.Clave := 'MOTIB';
  fraEM_SECT.Clave       := 'SECT';
  fraLocalidad.FieldCPostal    := 'ADC.DC_CPOSTAL';
  fraLocalidad.FieldLocalidad  := 'ADC.DC_LOCALIDAD';
  fraLocalidad.FieldProvincia  := 'ADC.DC_PROVINCIA';

  fraGestorCuenta.TableName   := 'AGC_GESTORCUENTA';
  fraGestorCuenta.FieldID     := 'GC_ID';
  fraGestorCuenta.FieldCodigo := 'GC_ID';
  fraGestorCuenta.FieldDesc   := 'GC_NOMBRE';
  fraGestorCuenta.FieldBaja   := 'GC_FECHABAJA';

  fraEjecutivo.TableName      := 'AEC_EJECUTIVOCUENTA';
  fraEjecutivo.FieldID        := 'EC_ID';
  fraEjecutivo.FieldCodigo    := 'EC_ID';
  fraEjecutivo.FieldDesc      := 'EC_NOMBRE';
  fraEjecutivo.FieldBaja      := 'EC_FECHABAJA';

  sSql :=
    'SELECT GC_ID ' + CD_ALIAS_ID + ',' +
          ' GC_ID ' + CD_ALIAS_CODIGO + ',' +
          ' GC_NOMBRE ' + CD_ALIAS_DESC + ',' +
          ' GC_FECHABAJA ' + CD_ALIAS_BAJA +
     ' FROM AGC_GESTORCUENTA' +
    ' WHERE GC_USUARIO IS NULL' +
      ' AND GC_ESTUDIO = ''S''';
  fraStaticEstudio.Sql := sSql;

  CargarComboEstado;

  fraEM_ID.ShowBajas   := True;
  fraEM_ID.UltContrato := True;
  frmPrincipal.mnuEstadodeCuenta.Enabled := True;

  psContratos := '';
  fraEntidades.OnChange := CambiaEntidad;
  fraVendedores.OnChange := CambiaVendedor;
end;

procedure TfrmConsultaEstadoDeCuenta.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEM_ID.Clear;
  cmbCO_VIGENCIADESDE.Clear;
  cmbCO_VIGENCIAHASTA.Clear;
  fraHOLDING.Clear;
  fraLocalidad.Clear;
  fraEntidades.Clear;
  fraVendedores.Clear;
  fraEM_SECT.Clear;
  cmbCO_FECHABAJADesde.Clear;
  cmbCO_FECHABAJAHasta.Clear;
  fraCO_MOTIVOBAJA.Clear;
  rbTodosPeriodos.Checked := True;
  chkConcurso.Checked := False;
  chkQuiebra.Checked := False;
  fraGestorCuenta.Clear;
  fraEjecutivo.Clear;
  cmbCO_ESTADO.Clear;
  fraStaticEstudio.Clear;
  psContratos := '';
  fraDelegacion.Clear;
  InicializarContadores(True);
end;

procedure TfrmConsultaEstadoDeCuenta.tbVerEstadoClick(Sender: TObject);
begin
  if not sdqConsulta.Active or sdqConsulta.IsEmpty then
    raise Exception.Create('Debe elegir un registro.');

  frmAdminEstadoDeCuenta.Free;
  frmAdminEstadoDeCuenta := TfrmAdminEstadoDeCuenta.Create(Application.MainForm);
  frmAdminEstadoDeCuenta.CargarCabecera(sdqConsulta.FieldByName('CO_CONTRATO').AsString);
end;

procedure TfrmConsultaEstadoDeCuenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  
  Action := caFree;
  frmConsultaEstadoDeCuenta := nil;
  frmPrincipal.mnuEstadodeCuenta.Enabled := True;
end;

procedure TfrmConsultaEstadoDeCuenta.GridDblClick(Sender: TObject);
begin
  tbVerEstadoClick (nil);
end;

procedure TfrmConsultaEstadoDeCuenta.CargarComboEstado;
var
  ID: TCadena;
  sdqCombo: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT TB_CODIGO, TB_DESCRIPCION' +
     ' FROM CTB_TABLAS' +
    ' WHERE TB_CLAVE = ''AFEST''';
  sdqCombo := GetQuery(sSql);
  try
    cmbCO_ESTADO.Items.Clear;
    while not sdqCombo.Eof do
    begin
      ID := TCadena.Create();
      ID.Cadena := sdqCombo.FieldByName('TB_CODIGO').AsString;
      cmbCO_ESTADO.Items.AddObject(ID.Cadena + ' - ' + sdqCombo.FieldByName('TB_DESCRIPCION').AsString, ID);
      sdqCombo.Next;
    end;
  finally
    sdqCombo.Free;
  end;
end;

procedure TfrmConsultaEstadoDeCuenta.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if sdqConsulta.FieldByName('CO_FECHABAJA').AsString <> '' then
    AFont.Color := clRed
  else if sdqConsulta.FieldByName('ESVIP').AsString = 'S' then
    AFont.Color := clPurple;

  if Highlight then
    Background := clTeal
  else
    Background := clInfoBk;
end;

procedure TfrmConsultaEstadoDeCuenta.mnuImprimirReporteClick(Sender: TObject);
var
  iLoop: Integer;
  RegistroAnterior: TBookmark;
begin
  inherited;

  if Grid.SelectedRows.Count = 0 then
    raise Exception.Create('Debe elegir al menos un registro');

  with TfrmImpresionEstadodeCuenta.Create(Self) do
  try
    sdqConsulta.DisableControls;

    //loopea entre los registros de la grilla seleccionados
    RegistroAnterior := sdqConsulta.GetBookmark;
    for iLoop:= 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[iLoop]));
      Contratos.Add(sdqConsulta.FieldByName('CO_CONTRATO').AsString);
    end;

    sdqConsulta.GotoBookmark(RegistroAnterior);
    sdqConsulta.FreeBookmark(RegistroAnterior);

    ShowModal;
  finally
    sdqConsulta.EnableControls;
  end;
end;

procedure TfrmConsultaEstadoDeCuenta.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropDown;
end;

procedure TfrmConsultaEstadoDeCuenta.tbCalcularTotalClick(Sender: TObject);
begin
  CalcularCantTotalReg;
end;

procedure TfrmConsultaEstadoDeCuenta.InicializarContadores(ActualizarCantContratos: Boolean);
begin
  edCantContratos.Value := 0;
  if ActualizarCantContratos then
    CalcularCantTotalReg;
end;

procedure TfrmConsultaEstadoDeCuenta.CalcularFilasSel;
begin
  edCantContratos.Value := grid.SelectedRows.Count;
end;

procedure TfrmConsultaEstadoDeCuenta.CalcularCantTotalReg;
begin
  if sdqConsulta.Active and tbCalcularTotal.Down then
    edTotalContratos.Value  := sdqConsulta.RecordCount
  else
    edTotalContratos.Value  := 0;
end;

procedure TfrmConsultaEstadoDeCuenta.tbOrdenarClick(Sender: TObject);
begin
  inherited;

  InicializarContadores(False);
end;

procedure TfrmConsultaEstadoDeCuenta.GridCellClick(Column: TColumn);
begin
  CalcularFilasSel;
end;

procedure TfrmConsultaEstadoDeCuenta.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  CalcularFilasSel;
end;

procedure TfrmConsultaEstadoDeCuenta.tbAgregarContratosClick( Sender: TObject);
begin
  psContratos := GetListaContratosArchivo();
  if psContratos <> '' then
    tbRefrescarClick(nil);
end;

procedure TfrmConsultaEstadoDeCuenta.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnSelectAll;
end;

procedure TfrmConsultaEstadoDeCuenta.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmConsultaEstadoDeCuenta.CambiaEntidad(Sender: TObject);
begin
  fraVendedores.Entidad := fraEntidades.Value;
end;

procedure TfrmConsultaEstadoDeCuenta.CambiaVendedor(Sender: TObject);
begin
  fraEntidades.Vendedor := fraVendedores.Value;
end;

procedure TfrmConsultaEstadoDeCuenta.tb441WebClick(Sender: TObject);
begin
  if (not sdqConsulta.Active) or (sdqConsulta.IsEmpty) then
    raise Exception.Create('Debe elegir un registro.');

  with sdqPeriodo do
  try
    SQL.Text :=
      'BEGIN ' +
      '  ART.WEB.GET_PERIODOCTACTE(:Contrato, :Periodo); ' +
      ' END;';

    Params[0].DataType := ftInteger;
    Params[0].Name := 'Contrato';
    Params[0].ParamType := ptInput;

    Params[1].DataType := ftCursor;
    Params[1].Name := 'Periodo';
    Params[1].ParamType := ptOutput;

    ParamByName('Contrato').AsInteger := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
    Open;

    fpPeriodosDisponibles.ShowModal;
  finally
    Close;
    SQL.Clear;
  end;
end;

function TfrmConsultaEstadoDeCuenta.EncodeInt(const iInt: Int64): String;
var
  iVal: Int64;
  sOut: String;
begin
  iVal := iInt;
  sOut := '';

  while iVal > 26 do
  begin
    sOut := Chr(StrToInt64(IntToStr(iVal mod 26)) + 64) + sOut;
    iVal := Trunc(iVal / 26);
  end;

  if iVal > 0 then
    sOut := Chr(iVal + 64) + sOut;

  Result := sOut;
end;

function TfrmConsultaEstadoDeCuenta.EncodeContrato(Contrato: Int64): String;
var
  iLoop: Integer;
  iSum: Int64;
  sCont: String;
begin
  iSum := 0;
  Contrato := Contrato * Contrato;
  sCont := EncodeInt(Contrato);

  for iLoop := 1 to Length(sCont) do
    iSum := iSum + Ord(sCont[iLoop]);

  sCont := sCont + '|' + EncodeInt(iSum);

  Result := sCont;
end;

procedure TfrmConsultaEstadoDeCuenta.fpPeriodosDisponiblesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    fpPeriodosDisponibles.Close;
end;

procedure TfrmConsultaEstadoDeCuenta.btnGenerarClick(Sender: TObject);
var
  sUrl: String;
begin
  Verificar((dblcbPeriodo.Text = ''), dblcbPeriodo, 'Por favor, elija un período.');

  sUrl := Format('http://www.provinciart.com.ar/EstadoSituacion.aspx?con=%d&cod=%s&per=%s', [
    sdqConsulta.FieldByName('CO_CONTRATO').AsInteger,
    EncodeContrato(sdqConsulta.FieldByName('CO_CONTRATO').AsInteger),
    sdqPeriodo.FieldByName('Periodo').AsString
  ]);

  ShellExecute(Application.Handle, 'open', PChar(sUrl), '', '', SW_SHOWNORMAL);
end;

procedure TfrmConsultaEstadoDeCuenta.tbLibreDeudaClick(Sender: TObject);
begin
  if ValidarLibreDeudaGrilla then
    DoImprimirLibreDeuda(sdqConsulta.FieldByName('CO_CONTRATO').AsInteger);
end;

function TfrmConsultaEstadoDeCuenta.ValidarLibreDeudaGrilla: Boolean;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe elegir un registro.');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Debe elegir solo un registro.');

  Result := True;
end;

end.
