unit unEstadisticasAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, Series, TeEngine, TeeProcs, Chart, DbChart, JvExExtCtrls,
  JvNavigationPane, QRTEE, QuickRpt, QRCtrls, RxGIF, AdvGroupBox, AdvOfficeButtons, unFraTitulo, AdvToolBar,
  JvExControls, JvComponent, JvSpeedButton, Buttons, AdvToolBarStylers,
  CheckLst, ARTCheckListBox, unfraDelegacion, BubbleCh, RxToolEdit, RxPlacemnt;

type
  TArrayOfString = array of String;
  TfrmEstadisticasAGENDA = class(TfrmCustomConsulta)
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    chkAnulados: TAdvOfficeCheckBox;
    chkComputos: TAdvOfficeCheckBox;
    chkRechazados: TAdvOfficeCheckBox;
    chkUsuariosPocaParticipacion: TAdvOfficeCheckBox;
    ColumnHeaderBand1: TQRBand;
    dbChartGrafico: TDBChart;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qrdbText0: TQRDBText;
    qrdbText1: TQRDBText;
    qrdbText2: TQRDBText;
    qrdbText3: TQRDBText;
    qrdbText4: TQRDBText;
    qriLogoART: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlColumna0: TQRLabel;
    qrlColumna1: TQRLabel;
    qrlColumna2: TQRLabel;
    qrlColumna3: TQRLabel;
    qrlColumna4: TQRLabel;
    qrReporte: TQuickRep;
    qrTitleBand: TQRBand;
    qrTitulo: TQRLabel;
    ScrollBoxReporte: TScrollBox;
    sdqSTAT11: TSDQuery;
    sdqSTAT11CANTIDAD: TFloatField;
    sdqSTAT11SE_NOMBRE: TStringField;
    sdqSTAT12: TSDQuery;
    sdqSTAT1: TSDQuery;
    sdqSTAT1CANTIDAD: TFloatField;
    sdqSTAT1EVENTO: TStringField;
    sdqSTAT2: TSDQuery;
    sdqSTAT2CANTIDAD: TFloatField;
    sdqSTAT2TAREA: TStringField;
    sdqSTAT16: TSDQuery;
    sdqSTAT16CANTIDAD: TFloatField;
    sdqSTAT16PERIODO: TStringField;
    sdqSTAT12CANTIDAD: TFloatField;
    sdqSTAT12GERENCIA: TStringField;
    sdqSTAT99: TSDQuery;
    sdqSTAT99AT_ID: TFloatField;
    sdqSTAT99DESTINO: TStringField;
    sdqSTAT99ORIGEN: TStringField;
    sdqSTAT5: TSDQuery;
    sdqSTAT5CANTIDAD: TFloatField;
    sdqSTAT3: TSDQuery;
    sdqSTAT3CANTIDAD: TFloatField;
    sdqSTAT15: TSDQuery;
    sdqSTAT15ANTICUACION: TStringField;
    sdqSTAT15CANTIDAD: TFloatField;
    Series1: TPieSeries;
    Series10: THorizBarSeries;
    Series11: TPieSeries;
    Series12: TPieSeries;
    Series13: THorizBarSeries;
    Series14: TPieSeries;
    Series2: TPieSeries;
    Series3: TPieSeries;
    Series4: TPointSeries;
    Series5: TPieSeries;
    Series6: TPieSeries;
    Series7: TLineSeries;
    Series8: TBarSeries;
    Series9: TPieSeries;
    ShortCutControlHijo: TShortCutControl;
    SplitterVert: TJvOutlookSplitter;
    tbImprimirGrafico: TToolButton;
    sdqSTAT5ESTADO: TStringField;
    sdqSTAT3EMPRESA: TStringField;
    sdqSTAT17: TSDQuery;
    sdqSTAT17RESPUESTA: TStringField;
    sdqSTAT17CANTIDAD: TFloatField;
    Series15: TPieSeries;
    AdvToolBarPager: TAdvToolBarPager;
    AdvPageFiltros: TAdvPage;
    AdvPageOpciones: TAdvPage;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    pnlFiltrosAtCliente: TPanel;
    Panel1: TPanel;
    rgInsatisfaccion: TAdvOfficeRadioGroup;
    rgAutomaticos: TAdvOfficeRadioGroup;
    rgVerEventos: TAdvOfficeRadioGroup;
    rgVerTareas: TAdvOfficeRadioGroup;
    rgTIPO: TAdvOfficeRadioGroup;
    Label19: TLabel;
    Label24: TLabel;
    Label29: TLabel;
    fraProceso: TfraCodDesc;
    fraAE_IDTIPOEVENTO: TfraCodDesc;
    fraAT_IDTIPOEVENTO: TfraCodDesc;
    Label3: TLabel;
    Label26: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnClearJefatura: TJvSpeedButton;
    btnClearGerencia: TJvSpeedButton;
    btnClearSector: TJvSpeedButton;
    btnClearUsuario: TJvSpeedButton;
    fraSectores: TfraCodDesc;
    fraUsuarios: TfraCodDesc;
    fraJefaturas: TfraCodDesc;
    fraGerencias: TfraCodDesc;
    Label20: TLabel;
    fraMI_ID: TfraCodDesc;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    btnImplementacionEvento: TJvSpeedButton;
    Label6: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    btnImplementacionTarea: TJvSpeedButton;
    Label9: TLabel;
    edFechaDesdeTarea: TDateComboBox;
    edFechaHastaTarea: TDateComboBox;
    sdqSTAT14: TSDQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    sdqSTAT13: TSDQuery;
    FloatField5: TFloatField;
    Series16: TPieSeries;
    sdqSTAT13SECTOR: TStringField;
    pgMasFiltros: TAdvPage;
    pnl1: TPanel;
    rgTIPOAvanzado: TAdvOfficeRadioGroup;
    rgVerRellamadas: TAdvOfficeRadioGroup;
    rgGestionInterna: TAdvOfficeRadioGroup;
    pgOtrosSectores: TAdvPage;
    pnlFiltrosSectores: TPanel;
    rgSML: TAdvOfficeRadioGroup;
    rgColoniaSuiza: TAdvOfficeRadioGroup;
    rgCallCenter: TAdvOfficeRadioGroup;
    rgDelegaciones: TAdvOfficeRadioGroup;
    rgVerEmpresasVIP: TAdvOfficeRadioGroup;
    rgTipoClienteInvisible: TAdvOfficeRadioGroup;
    rgVisualizar: TAdvOfficeRadioGroup;
    rgDadosDeBaja: TAdvOfficeRadioGroup;
    rgTipoCliente: TAdvOfficeRadioGroup;
    clbTipoCliente: TARTCheckListBox;
    rgEmpresa: TAdvOfficeRadioGroup;
    Label10: TLabel;
    fraFiltroDelegacion: TfraDelegacion;
    sdqSTAT6: TSDQuery;
    StringField2: TStringField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    Series17: TPieSeries;
    sdqSTAT4: TSDQuery;
    FloatField6: TFloatField;
    sdqSTAT4PRESTADOR: TStringField;
    Series18: TPieSeries;
    Series19: TBubbleSeries;
    sdqSTAT7: TSDQuery;
    Series20: TPieSeries;
    sdqSTAT7CANAL: TStringField;
    sdqSTAT7CANTIDAD: TFloatField;
    sdqSTAT8: TSDQuery;
    Series21: TPieSeries;
    procedure Actualizar(Sender: TObject);
    procedure btnClearGerenciaClick(Sender: TObject);
    procedure btnClearJefaturaClick(Sender: TObject);
    procedure btnClearSectorClick(Sender: TObject);
    procedure btnClearUsuarioClick(Sender: TObject);
    procedure btnImplementacionEventoClick(Sender: TObject);
    procedure btnImplementacionTareaClick(Sender: TObject);
    procedure ControlFiltros(Sender: TObject);
    procedure ControlFiltroUsuario(Sender: TObject);
    procedure ControlTipoEstadistica(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure rgTIPOClick(Sender: TObject);
    procedure SeguridadAfterExecute(Sender: TObject);
    procedure tbImprimirGraficoClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
  private
    aColumnas, aValores: TArrayOfString;
    procedure ClearFrameFilter(Frame: TArtDBAwareFrame; Button: TJvSpeedButton);
    procedure CloseQuerys(sdqTEMP: TSDQuery);
  public
    qrChartGrafico: TQRChart;
    qrDBChartGrafico: TQRDBChart;
  
    procedure RefreshData; override;
  end;

var
  frmEstadisticasAGENDA: TfrmEstadisticasAGENDA;

implementation

uses
  unDmPrincipal, VCLExtra, CustomDlgs, unArt, General, unSesion, unGrids, Strfuncs, unVisualizador, AnsiSql, StrUtils,
  SqlFuncs, unCustomForm, unPrincipal, DateTimeFuncs, SDOra;

{$R *.dfm}

procedure TfrmEstadisticasAGENDA.Actualizar(Sender: TObject);
begin
  inherited;
  sdqConsulta.Close;
  SortDialog.SortFields.Clear;
  //RefreshData;
end;

procedure TfrmEstadisticasAGENDA.btnClearGerenciaClick(Sender: TObject);
begin
  ClearFrameFilter(fraGerencias, btnClearGerencia);
end;

procedure TfrmEstadisticasAGENDA.btnClearJefaturaClick(Sender: TObject);
begin
  ClearFrameFilter(fraJefaturas, btnClearJefatura);
end;

procedure TfrmEstadisticasAGENDA.btnClearSectorClick(Sender: TObject);
begin
  ClearFrameFilter(fraSectores, btnClearSector);
end;

procedure TfrmEstadisticasAGENDA.btnClearUsuarioClick(Sender: TObject);
begin
  ClearFrameFilter(fraUsuarios, btnClearUsuario);
end;

procedure TfrmEstadisticasAGENDA.btnImplementacionEventoClick(Sender: TObject);
begin
  edFechaDesde.Date := StrToDate('24/01/2011');
end;

procedure TfrmEstadisticasAGENDA.btnImplementacionTareaClick(Sender: TObject);
begin
  edFechaDesdeTarea.Date := StrToDate('24/01/2011');
end;

procedure TfrmEstadisticasAGENDA.ControlFiltros(Sender: TObject);
begin
  with fraJefaturas, fraJefaturas.Propiedades do
  begin
    ExtraCondition := ' AND se_nivel = 3 ';

    if fraGerencias.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTORPADRE = ' + SQLValue(fraGerencias.Codigo)
{
    else
      ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT DISTINCT JEF.SE_IDSECTORPADRE ' +
                                                         ' FROM COMPUTOS.CSE_SECTOR JEF, ART.USE_USUARIOS USUARIOS, AGENDA.AAE_AGENDAEVENTO ' +
                                                        ' WHERE USUARIOS.SE_ID = AE_IDUSUARIO ' +
                                                          ' AND USUARIOS.SE_IDSECTOR = JEF.SE_ID) ';
}                                                          
  end;

  with fraSectores, fraSectores.Propiedades do
  begin
    ExtraCondition := ' AND se_nivel = 4 ';

    if fraJefaturas.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTORPADRE = ' + SQLValue(fraJefaturas.Codigo)
    else if fraGerencias.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTORPADRE IN (SELECT JEF.SE_ID ' +
                                                                     'FROM COMPUTOS.CSE_SECTOR JEF ' +
                                                                    'WHERE JEF.SE_IDSECTORPADRE = ' + SQLValue(fraGerencias.Codigo) + ') '
    else
      ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT DISTINCT USUARIOS.SE_IDSECTOR ' +
                                                         ' FROM ART.USE_USUARIOS USUARIOS, AGENDA.AAE_AGENDAEVENTO ' +
                                                        ' WHERE USUARIOS.SE_ID = AE_IDUSUARIO) ';
  end;

  with fraUsuarios, fraUsuarios.Propiedades do
  begin
    ExtraCondition := ' AND ((se_fechabaja is null) or (se_fechabaja > art.actualdate - 365)) ' +
                      ' AND se_usuariogenerico = ''N'' ';

    if fraSectores.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTOR = ' + SQLValue(fraSectores.Codigo)
    else
      ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT DISTINCT USUARIOS.SE_ID ' +
                                                         ' FROM ART.USE_USUARIOS USUARIOS, AGENDA.AAE_AGENDAEVENTO ' +
                                                        ' WHERE USUARIOS.SE_ID = AE_IDUSUARIO) ' +
                                         ' AND ((SE_IDSECTOR > 0) OR (SE_SECTOR = ''CALLCENT'')) ' +
                                         iif(rgCallCenter.ItemIndex = 1, ' AND SE_SECTOR = ''CALLCENT'' ', '');
  end;

  btnClearGerencia.Enabled := not fraGerencias.Locked and fraGerencias.IsSelected;
  btnClearJefatura.Enabled := not fraJefaturas.Locked and fraJefaturas.IsSelected;
  btnClearSector.Enabled   := not fraSectores.Locked and fraSectores.IsSelected;
  btnClearUsuario.Enabled  := not fraUsuarios.Locked and fraUsuarios.IsSelected;

  if Assigned(Sender) and (TControl(Sender).Parent is TFraCodDesc) then
    TFraCodDesc(TControl(Sender).Parent).cmbDescripcionDropDown(Sender);
end;

procedure TfrmEstadisticasAGENDA.ControlFiltroUsuario(Sender: TObject);
begin
  if fraSectores.IsSelected and fraUsuarios.IsSelected
  and (fraSectores.Codigo <> fraUsuarios.sdqDatos.FieldByName('SE_IDSECTOR').AsString) then
    fraUsuarios.Clear;

  ControlFiltros(Sender);
end;

procedure TfrmEstadisticasAGENDA.FormCreate(Sender: TObject);
var
  iNivelSector: Integer;
begin
  HideTitleBar;
  AdvToolBarPager.ActivePageIndex := 0;
  fraFiltroDelegacion.OnLine := False;

  if Sesion.IdSectorIntranet = 0 then
    iNivelSector := 1
  else
    iNivelSector := ValorSQLEx('SELECT se_nivelresolutivo ' +
                                 'FROM computos.cse_sector ' +
                                'WHERE se_id = :id', [Sesion.IdSectorIntranet]);

  VCLExtra.LockControls([fraGerencias], not (AreIn(Sesion.Sector, ['COMPUTOS', 'GERGEN', 'CALIDAD', 'CONTGEST', 'AUDIT']) or frmPrincipal.Seguridad.Claves.IsActive('Administrador')));
  VCLExtra.LockControls([fraJefaturas], fraGerencias.Locked and (iNivelSector < 3)
                                                            {and (not Sesion.TieneGenteACargo)});
  VCLExtra.LockControls([fraSectores], (fraGerencias.Locked or fraJefaturas.Locked) and (iNivelSector < 2) and (not Sesion.TieneGenteACargo));
  VCLExtra.LockControls([fraUsuarios], (fraGerencias.Locked or fraJefaturas.Locked or fraSectores.Locked) and (iNivelSector <= 1) and (not Sesion.TieneGenteACargo));

  FormStyle := fsNormal;
  inherited;
  tbLimpiar.Click;
  tbImprimirGrafico.Left := tbImprimir.Left;
  tbSalir.Enabled := True;
  qrReporte.PreviewWidth := Screen.Width - 40;
  qrReporte.PreviewHeight := Screen.Height - 100;

  if Sesion.Sector = 'CALLCENT' then
    rgCallCenter.ItemIndex := 1;

  edFechaDesde.Date := FirstLastDayOfMonth(FirstLastDayOfMonth(DBDate)-1);
  edFechaDesdeTarea.Date := FirstLastDayOfMonth(FirstLastDayOfMonth(DBDate)-1);

  VCLExtra.LockControls([rgCallCenter], Sesion.Sector = 'CALLCENT');
  VCLExtra.LockControls([fraSectores], fraSectores.Locked or (Sesion.Sector = 'CALLCENT'));

  qrChartGrafico := TQRChart.Create(ChildBand1);
  with qrChartGrafico do
  begin
    Parent := ChildBand1;
    Left := 12;
    Top := 8;
    Width := 717;
    Height := 365;
    Frame.Color := clBlack;
    Frame.DrawTop := False;
    Frame.DrawBottom := False;
    Frame.DrawLeft := False;
    Frame.DrawRight := False;
//    Size.Values := (965.729166666666800000, 31.750000000000000000, 21.166666666666670000, 1897.062500000000000000);

    qrDBChartGrafico := TQRDBChart.Create(qrChartGrafico);
    with qrDBChartGrafico do
    begin
      Parent := TWinControl(qrChartGrafico);
      Left := -1;
      Top := -1;
      Width := 1;
      Height := 1;
      Name := TeeGetUniqueName(qrReporte, 'QRDBChart');
      Title.Text.Clear;
      Title.Text.Add(qrDBChartGrafico.ClassName);
      BackWall.Brush.Color := clWhite;
      BackWall.Brush.Style := bsClear;
      Title.Font.Charset := ANSI_CHARSET;
      Title.Font.Color := clBlue;
      Title.Font.Height := -11;
      Title.Font.Name := 'Calibri';
      Title.Font.Style := [];
      Title.Text.Text := 'TQRChart';
      LeftAxis.LabelsFont.Charset := ANSI_CHARSET;
      LeftAxis.LabelsFont.Color := clBlack;
      LeftAxis.LabelsFont.Height := -11;
      LeftAxis.LabelsFont.Name := 'Calibri';
      LeftAxis.LabelsFont.Style := [];
      LeftAxis.Title.Font.Charset := ANSI_CHARSET;
      LeftAxis.Title.Font.Color := clBlack;
      LeftAxis.Title.Font.Height := -11;
      LeftAxis.Title.Font.Name := 'Calibri';
      LeftAxis.Title.Font.Style := [];
      Legend.Font.Charset := ANSI_CHARSET;
      Legend.Font.Color := clBlack;
      Legend.Font.Height := -11;
      Legend.Font.Name := 'Calibri';
      Legend.Font.Style := [];
    end;
  end;
end;

procedure TfrmEstadisticasAGENDA.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  inherited;
  if IsEmptyString(Value) and (Pos('CANTIDAD', UpperCase(Column)) > 0) then
    Value := aValores[ArrayPos(UpperCase(Column), aColumnas)];
end;

procedure TfrmEstadisticasAGENDA.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value := ' Impreso por ' + Sesion.Usuario;
end;

procedure TfrmEstadisticasAGENDA.QRLabel3Print(sender: TObject; var Value: String);
begin
  Value := 'Impreso el ' + DateToStr(DBDate) + ' ';
end;

procedure TfrmEstadisticasAGENDA.QRLabel4Print(sender: TObject; var Value: String);
begin
  Value := '';
  
  if fraGerencias.IsSelected then
    Value := Value + 'Gerencias: ' + fraGerencias.Descripcion
  else
    Value := Value + 'Gerencias: Todas las gerencias';

  Value := Value + CRLF;

  if fraJefaturas.IsSelected then
    Value := Value + 'Jefatura: ' + fraJefaturas.Descripcion
  else
    Value := Value + 'Jefatura: Todas las jefaturas';

  Value := Value + CRLF;

  if fraSectores.IsSelected then
    Value := Value + 'Sector: ' + fraSectores.Descripcion
  else
    Value := Value + 'Sector: Todos los sectores';

  Value := Value + CRLF;

  if fraUsuarios.IsSelected then
    Value := Value + 'Usuario: ' + fraUsuarios.Descripcion
  else
    Value := Value + 'Usuario: Todos';

  Value := Value + CRLF;

  if fraProceso.IsSelected then
    Value := Value + 'Proceso: ' + fraProceso.Descripcion + CRLF;
  if fraMI_ID.IsSelected then
    Value := Value + 'Canal: ' + fraMI_ID.Descripcion + CRLF;
  if fraAE_IDTIPOEVENTO.IsSelected then
    Value := Value + 'Motivo de Evento: ' + fraAE_IDTIPOEVENTO.Descripcion + CRLF;
  if fraAT_IDTIPOEVENTO.IsSelected then
    Value := Value + 'Motivo de Tarea: ' + fraAT_IDTIPOEVENTO.Descripcion + CRLF;

  if edFechaDesde.IsEmpty and edFechaHasta.IsEmpty then
    Value := Value + 'Sin rango de fechas a modo de filtro (Eventos)'
  else begin
    if not edFechaDesde.IsEmpty then
      Value := Value + 'Eventos desde el ' + DateToStr(edFechaDesde.Date);

    if not edFechaHasta.IsEmpty then
      Value := Value + 'Eventos hasta el ' + DateTimeToStr(StrToDateTime(edFechaHasta.Text + ' 23:59:59'));
  end;

  Value := Value + CRLF;
  
  if edFechaDesdeTarea.IsEmpty and edFechaHastaTarea.IsEmpty then
    Value := Value + 'Sin rango de fechas a modo de filtro (Tareas)'
  else begin
    if not edFechaDesdeTarea.IsEmpty then
      Value := Value + 'Tareas desde el ' + DateToStr(edFechaDesdeTarea.Date);

    if not edFechaHastaTarea.IsEmpty then
      Value := Value + 'Tareas hasta el ' + DateTimeToStr(StrToDateTime(edFechaHastaTarea.Text + ' 23:59:59'));
  end;
end;

procedure TfrmEstadisticasAGENDA.tbImprimirGraficoClick(Sender: TObject);
var
  i: Integer;
begin
  RefreshData;
  ScrollBoxReporte.Visible := False;
  qrReporte.DataSet := Grid.DataSource.DataSet;
  qrReporte.ReportTitle := 'Estadísticas ';

  if Assigned(qrChartGrafico.Chart) then
    qrChartGrafico.Chart.FreeAllSeries;

  qrChartGrafico.Chart.Assign(dbChartGrafico);

  for i := 0 to dbChartGrafico.SeriesCount - 1 do
    CloneChartSeries(dbChartGrafico[i]).ParentChart := qrChartGrafico.Chart;

  for i := 0 to Grid.Columns.Count - 1 do
  begin
    TQRLabel(Self.FindComponent('qrlColumna' + IntToStr(i))).Caption := Grid.Columns[i].Title.Caption;
    TQRDBText(Self.FindComponent('qrdbText' + IntToStr(i))).DataField := Grid.Columns[i].FieldName;
    TQRDBText(Self.FindComponent('qrdbText' + IntToStr(i))).DataSet := Grid.DataSource.DataSet;
  end;

  for i := 4 downto Grid.Columns.Count do
  begin
    TQRLabel(Self.FindComponent('qrlColumna' + IntToStr(i))).Caption := '';
    TQRDBText(Self.FindComponent('qrdbText' + IntToStr(i))).DataField := '';
  end;

  qrReporte.Preview;
//  Visualizar(qrReporte, GetValores(rgTIPO.Items[rgTIPO.ItemIndex]), [oForceShowModal, oForceDB, oAlwaysShowDialog]);
  ScrollBoxReporte.Visible := False;
end;

procedure TfrmEstadisticasAGENDA.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  edFechaDesdeTarea.Clear;
  edFechaHastaTarea.Clear;

  if fraGerencias.Locked then
  begin
    fraUsuarios.Value := Sesion.Id;
    fraSectores.Value := Sesion.IdSectorIntranet;
    fraJefaturas.Codigo := ValorSQLEx('SELECT se_idsectorpadre FROM computos.cse_sector WHERE se_id = :id', [Sesion.IdSectorIntranet]);
    fraGerencias.Codigo := ValorSQLEx('SELECT jef.se_idsectorpadre FROM computos.cse_sector jef, computos.cse_sector sec WHERE sec.se_id = :id AND sec.se_idsectorpadre = jef.se_id', [Sesion.IdSectorIntranet]);
  end;

  fraProceso.Clear;
  fraMI_ID.Clear;
  fraAE_IDTIPOEVENTO.Clear;
  fraAT_IDTIPOEVENTO.Clear;  
  chkAnulados.Checked := True;
  chkRechazados.Checked := True;
  chkComputos.Checked := False;
  chkUsuariosPocaParticipacion.Checked := True;
  rgTipo.ItemIndex := 0;
  rgTIPOAvanzado.ItemIndex := 0;
  rgVisualizar.ItemIndex := 0;
  rgInsatisfaccion.ItemIndex := 0;
  rgCallCenter.ItemIndex := 0;
  rgDadosDeBaja.ItemIndex := 1;
  rgGestionInterna.ItemIndex := 0;
  rgAutomaticos.ItemIndex := 0;
  rgVerEmpresasVIP.ItemIndex := 0;
  rgSML.ItemIndex := 0;
  rgColoniaSuiza.ItemIndex := 0;
  rgDelegaciones.ItemIndex := 0;
  fraFiltroDelegacion.Clear;  
  clbTipoCliente.CheckAll;
  ControlFiltros(nil);  
end;

procedure TfrmEstadisticasAGENDA.tbOrdenarClick(Sender: TObject);
begin
  SortDialog.SortFields.Clear;
  inherited;
  RefreshData;
end;

procedure TfrmEstadisticasAGENDA.ClearFrameFilter(Frame: TArtDBAwareFrame; Button: TJvSpeedButton);
begin
  Frame.Clear;
  Button.Enabled := False;
  ControlFiltros(nil);
  //RefreshData;
end;

procedure TfrmEstadisticasAGENDA.CloseQuerys(sdqTEMP: TSDQuery);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i].InheritsFrom(TSDQuery) and (Components[i] <> sdqTEMP) then
      TSDQuery(Components[i]).Close;
end;

procedure TfrmEstadisticasAGENDA.ControlTipoEstadistica(Sender: TObject);
begin
  inherited;
  if (Sender = rgTIPO) and (rgTIPO.ItemIndex > 0) then
  begin
    rgTIPOAvanzado.ItemIndex := 0;
  end else
  if (Sender = rgTIPOAvanzado) and (rgTIPOAvanzado.ItemIndex > 0) then
  begin
    rgTIPO.ItemIndex := 0;
  end;
end;

procedure TfrmEstadisticasAGENDA.FSFormShow(Sender: TObject);
begin
  inherited;
  if (Screen.Width >= 1024) and (Self.Width < 800) then
    Self.Width := 960;
  if (Screen.Height >= 768) and (Self.Height < 600) then
    Self.Height := 720;  
end;

procedure TfrmEstadisticasAGENDA.RefreshData;
const
  PARAM_TAG = 'borrame';
var
  sdqTEMP: TSDQuery;
  i: Integer;
  {sSql,} sAux, sPrefijoAux, sMensaje: String;
  nIndiceStat: Integer;
  PrevCursor: TCursor;
  
  procedure ReemplazoValorParametro(AParametro: String; AValor: Integer; AReemplazar: Boolean);
  begin
    with sdqTEMP do
      if UpperCase(Params[i].Name) = AParametro then
      begin
        if AReemplazar then
          ParamByName(AParametro).AsInteger := AValor
        else
          ParamByName(AParametro).AsInteger := 0;
      end;
  end;

  procedure ReemplazoValorParametroFecha(AParametro: String; ADateComboBox: TDateComboBox);
  var
    bHasta: Boolean;  
  begin
    if UpperCase(sdqTEMP.Params[i].Name) = AParametro then
    begin
      bHasta := Pos('HASTA', UpperCase(AParametro)) > 0;
      if not ADateComboBox.IsEmpty then
        sdqTEMP.ParamByName(AParametro).AsDateTime := iif(bHasta, Trunc(ADateComboBox.Date) + 23/24 + 59/60/24 + 59/60/60/24, Trunc(ADateComboBox.Date))
      else
        sdqTEMP.ParamByName(AParametro).AsDateTime := iif(bHasta, ART_MAXFECHA, ART_MINFECHA);
    end;
  end;
  
  procedure EliminarCondicionParametro(AParametro, ACondicion: String);
  begin
    {Saco la condición si se usó el filtro alguna vez}
    sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text,
                                      '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + ACondicion + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/',
                                      '--%' + AParametro + '%', [rfReplaceAll]);
    {Saco la condición si no se usó el filtro la última vez}
    sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text,
                                      '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + ''{Acá no pongo nada} + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/',
                                      '--%' + AParametro + '%', [rfReplaceAll]);
  end;

  procedure ReemplazoParametrosFijos(AParametro, ACondicion: String; AFrame: TfraCodigoDescripcion; ARadioGroup: TAdvOfficeRadioGroup = nil; AReemplazarIgual: Boolean = False);
  begin
    if Pos(AParametro + '%', sdqTEMP.Sql.Text) > 0 then
    begin
      {Si se pasó por parámetro un frame}
      if Assigned(AFrame) then
      begin
        EliminarCondicionParametro(AParametro, ACondicion);
        (*
        {Saco la condición si se usó el filtro alguna vez}
        sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text,
                                          '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + ACondicion + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/',
                                          '--%' + AParametro + '%', [rfReplaceAll]);
        {Saco la condición si no se usó el filtro la última vez}
        sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text,
                                          '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + ''{Acá no pongo nada} + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/',
                                          '--%' + AParametro + '%', [rfReplaceAll]);
        *)
        {Si está seleccionado el frame}
        if AFrame.IsSelected or AReemplazarIgual then
          {Agrego la línea con el parámetro}
          sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text, '--%' + AParametro + '%', '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + ACondicion + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/', [rfReplaceAll])
        else
          {Agrego la línea sin el parámetro}
          sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text, '--%' + AParametro + '%', '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + '' + {Acá no pongo nada} ' /*' + PARAM_TAG + ' < ' + AParametro + '*/', [rfReplaceAll]);
      end else

      {Si no se pasó por parámetro un frame, y es un RadioGroup}
      if Assigned(ARadioGroup) then
      begin
        {Saco la condición si se usó el filtro alguna vez}
        while Pos('/*' + PARAM_TAG + ' > ' + AParametro + '%*/', sdqTEMP.Sql.Text) > 0 do
          sdqTEMP.Sql.Text := Copy(sdqTEMP.Sql.Text,
                                   0,
                                   Pos('/*' + PARAM_TAG + ' > ' + AParametro + '%*/', sdqTEMP.Sql.Text) - 1) +

                              '--%' + AParametro + '%' +
                              
                              Copy(sdqTEMP.Sql.Text,
                                   Pos('/*' + PARAM_TAG + ' < ' + AParametro + '*/', sdqTEMP.Sql.Text) +
                                   Length('/*' + PARAM_TAG + ' < ' + AParametro + '*/'),
                                   MAXINT);

        {Saco la condición si no se usó el filtro la última vez}
        sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text,
                                          '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + ''{Acá no pongo nada} + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/',
                                          '--%' + AParametro + '%', [rfReplaceAll]);

        {Si está seleccionado el ítem cero del RadioGroup}
        if ARadioGroup.ItemIndex = 0 then
          {Agrego la línea sin el parámetro}
          sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text, '--%' + AParametro + '%', '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + '' {Acá no pongo nada} + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/', [rfReplaceAll])
        else
          {Agrego la línea con el parámetro}
          sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text, '--%' + AParametro + '%', '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + ACondicion + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/', [rfReplaceAll]);
      end;

      {Si no se pasó por parámetro un Frame ni por un RadioGroup, reemplazo TODO}
      if not Assigned(ARadioGroup) and not Assigned(AFrame) then
      begin
        {Saco la condición si se usó el filtro alguna vez}
        while Pos('/*' + PARAM_TAG + ' > ' + AParametro + '%*/', sdqTEMP.Sql.Text) > 0 do
          sdqTEMP.Sql.Text := Copy(sdqTEMP.Sql.Text,
                                   0,
                                   Pos('/*' + PARAM_TAG + ' > ' + AParametro + '%*/', sdqTEMP.Sql.Text) - 1) +

                              '--%' + AParametro + '%' +
                              
                              Copy(sdqTEMP.Sql.Text,
                                   Pos('/*' + PARAM_TAG + ' < ' + AParametro + '*/', sdqTEMP.Sql.Text) +
                                   Length('/*' + PARAM_TAG + ' < ' + AParametro + '*/'),
                                   MAXINT);

        {Saco la condición si no se usó el filtro la última vez}
        sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text,
                                          '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + ''{Acá no pongo nada} + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/',
                                          '--%' + AParametro + '%', [rfReplaceAll]);

        {Si está seleccionado el ítem cero del RadioGroup}
(*
        if ARadioGroup.ItemIndex = 0 then
          {Agrego la línea sin el parámetro}
          sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text, '--%' + AParametro + '%', '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + '' {Acá no pongo nada} + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/', [rfReplaceAll])
        else
*)
          {Agrego la línea con el parámetro}
          sdqTEMP.Sql.Text := StringReplace(sdqTEMP.Sql.Text, '--%' + AParametro + '%', '/*' + PARAM_TAG + ' > ' + AParametro + '%*/ ' + ACondicion + ' /*' + PARAM_TAG + ' < ' + AParametro + '*/', [rfReplaceAll]);
      end;      
    end;
  end;
begin
  if rgTipo.ItemIndex > 0 then
    nIndiceStat := rgTIPO.ItemIndex
  else
    if rgTIPOAvanzado.ItemIndex > 0 then
      nIndiceStat := 10 + rgTIPOAvanzado.ItemIndex
    else
      nIndiceStat := 0;

  Verificar(not (nIndiceStat > 0), rgTIPO, 'Debe seleccionar un tipo de estadística.');

  if Assigned(FindComponent('sdqSTAT' + IntToStr(nIndiceStat))) and (FindComponent('sdqSTAT' + IntToStr(nIndiceStat)) is TDataSet) then
  begin
    sdqTEMP := TSDQuery(FindComponent('sdqSTAT' + IntToStr(nIndiceStat)));
    CloseQuerys(sdqTEMP);

    for i := 0 to dbChartGrafico.SeriesList.Count-1 do
      dbChartGrafico.SeriesList[i].Active := False;

    dbChartGrafico.SeriesList[nIndiceStat].Active := True;
    ReemplazoParametrosFijos('sector', 'AND sec.se_id = :sector', fraSectores);
    ReemplazoParametrosFijos('jefatura', 'AND sec.se_idsectorpadre = :jefatura', fraJefaturas);
    ReemplazoParametrosFijos('gerencia', 'AND EXISTS(SELECT 1 FROM computos.cse_sector jef WHERE sec.se_idsectorpadre = jef.se_id AND jef.se_idsectorpadre = :gerencia)', fraGerencias);
    ReemplazoParametrosFijos('usuario_tarea', 'AND NVL(at_idusuario, st_idusuario) = :usuario', fraUsuarios);
    ReemplazoParametrosFijos('usuario_evento', 'AND ae_idusuario = :usuario', fraUsuarios);
    ReemplazoParametrosFijos('proceso_evento', 'AND EXISTS(SELECT 1 FROM agenda.ate_tipoevento WHERE te_id = ae_idtipoevento AND te_idproceso = :proceso)', fraProceso);
    ReemplazoParametrosFijos('proceso_tarea', 'AND EXISTS(SELECT 1 FROM agenda.ate_tipoevento WHERE te_id = at_idtipoevento AND te_idproceso = :proceso)', fraProceso);
    ReemplazoParametrosFijos('canal_evento', 'AND ae_idmotivoingreso = :canal', fraMI_ID);
    ReemplazoParametrosFijos('canal_tarea', 'AND at_idmotivoingreso = :canal', fraMI_ID);
    ReemplazoParametrosFijos('tipo_evento', 'AND ae_idtipoevento = :tipo_evento', fraAE_IDTIPOEVENTO);
    ReemplazoParametrosFijos('tipo_tarea', 'AND at_idtipoevento = :tipo_tarea', fraAT_IDTIPOEVENTO);

    if fraUsuarios.IsSelected then
    begin
      EliminarCondicionParametro('filtro_por_usuario', 'AND 1 = 2');
      ReemplazoParametrosFijos('filtro_por_usuario', 'AND 1 = 1', fraUsuarios, nil, True);
    end else
    begin
      EliminarCondicionParametro('filtro_por_usuario', 'AND 1 = 1');
      ReemplazoParametrosFijos('filtro_por_usuario', 'AND 1 = 2', fraUsuarios, nil, True);
    end;
    
    case rgDadosDeBaja.ItemIndex of
      1: sAux := 'AND ae_fechabaja IS NULL';
      2: sAux := 'AND ae_fechabaja IS NOT NULL';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('fecha_baja_evento', sAux, nil, rgDadosDeBaja);

    case rgDadosDeBaja.ItemIndex of
      1: sAux := 'AND at_fechabaja IS NULL';
      2: sAux := 'AND at_fechabaja IS NOT NULL';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('fecha_baja_tarea', sAux, nil, rgDadosDeBaja);

    if rgTIPO.ItemIndex = 14 then
      sPrefijoAux := 'sol.';
      
    case rgCallCenter.ItemIndex of
      1: sAux := 'AND UPPER(' + sPrefijoAux + 'se_sector) = ''CALLCENT'' ';
      2: sAux := 'AND UPPER(' + sPrefijoAux + 'se_sector) <> ''CALLCENT'' ';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('call_center', sAux, nil, rgCallCenter);

    case rgVerEventos.ItemIndex of
      1: sAux := 'AND NOT EXISTS(SELECT 1 FROM agenda.aat_agendatarea WHERE at_idagendaevento = ae_id) AND NOT EXISTS(SELECT 1 FROM agenda.aat_agendatarea WHERE at_ideventotarea = ae_id)';
      2: sAux := 'AND EXISTS(SELECT 1 FROM agenda.aat_agendatarea WHERE at_idagendaevento = ae_id)';
      3: sAux := 'AND EXISTS(SELECT 1 FROM agenda.aat_agendatarea WHERE at_ideventotarea = ae_id)';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('ver_eventos', sAux, nil, rgVerEventos);
    
    case rgVerTareas.ItemIndex of
      1: sAux := 'AND at_idagendaevento IS NULL';
      2: sAux := 'AND at_idagendaevento IS NOT NULL AND EXISTS(SELECT 1 FROM agenda.aae_agendaevento WHERE ae_id = at_idagendaevento AND ae_fechaalta BETWEEN :fechadesde AND :fechahasta)';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('ver_tareas', sAux, nil, rgVerTareas);

    {********** EMPRESAS VIP **********}
    case rgVerEmpresasVIP.ItemIndex of
      1: sAux := 'AND art.afiliacion.is_empresavip(%s) = ''N''';
      2: sAux := 'AND art.afiliacion.is_empresavip(%s) = ''S''';
      else sAux := '';
    end;
    
    ReemplazoParametrosFijos('vip_evento', Format(sAux, ['ae_contrato']), nil, rgVerEmpresasVIP);
    ReemplazoParametrosFijos('vip_tarea', Format(sAux, ['at_contrato']), nil, rgVerEmpresasVIP);
                
    {********** TIPO DE CLIENTE **********}
    if (clbTipoCliente.CheckCount > 0) and (clbTipoCliente.CheckCount < clbTipoCliente.Count) then
      sAux := ' AND EXISTS(SELECT 1 FROM aem_empresa, aco_contrato WHERE co_contrato = %s AND co_idempresa = em_id ' + clbTipoCliente.InSQL_StringValues('em_sector', False) + ')'
    else
      sAux := '';

    ReemplazoParametrosFijos('tipo_cliente_evento', Format(sAux, ['ae_contrato']), nil);
    ReemplazoParametrosFijos('tipo_cliente_tarea', Format(sAux, ['at_contrato']), nil);

    {********** EMPRESA **********
    case rgEmpresa.ItemIndex of
      1: sAux := 'AND %s IS NULL ';
      2: sAux := 'AND %s IS NOT NULL ';
      else sAux := '';
    end;

    ReemplazoParametrosFijos('empresa_evento', Format(sAux, ['ae_contrato']), nil);
    ReemplazoParametrosFijos('empresa_tarea', Format(sAux, ['at_contrato']), nil);
    }

    {********** GESTIÓN INTERNA **********}    
    case rgGestionInterna.ItemIndex of
      1: sAux := 'AND %s <> 11 ';
      2: sAux := 'AND %s = 11 ';
      else sAux := '';
    end;

    ReemplazoParametrosFijos('gestion_interna_evento', Format(sAux, ['ae_idmotivoingreso']), nil);
    ReemplazoParametrosFijos('gestion_interna_tarea', Format(sAux, ['at_idmotivoingreso']), nil);

    {********** COLONIA SUIZA **********}    
    case rgColoniaSuiza.ItemIndex of
      1: sAux := 'AND se_sector <> ''CSUIZA'' ';
      2: sAux := 'AND se_sector = ''CSUIZA'' ';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('colonia', sAux, nil);

    {********** DELEGACIONES **********}
    case rgDelegaciones.ItemIndex of
      1: sAux := 'AND se_delegacion = ''840'' ';
      2: sAux := 'AND se_delegacion <> ''840'' ';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('delegaciones', sAux, nil);

    {*********** DELEGACIÓN ***********}
    if fraFiltroDelegacion.IsSelected then
      ReemplazoParametrosFijos('delegacion', 'AND se_delegacion = ' + SQLValue(fraFiltroDelegacion.Codigo) + ' ', nil)
    else
      ReemplazoParametrosFijos('delegacion', ' ', nil);

    {********** SML **********}
    case rgSML.ItemIndex of
      1: sAux := 'AND se_sector <> ''SML'' ';
      2: sAux := 'AND se_sector = ''SML'' ';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('sml', sAux, nil);

    {RELLAMADAS}
    case rgVerRellamadas.ItemIndex of
      1, 2: sAux := 'AND ' + iif(rgVerRellamadas.ItemIndex = 1, 'NOT', '') +
                       ' EXISTS(SELECT 1 ' + {Obs. en el propio evento}
                                 'FROM agenda.aoe_observacionevento ' +
                                'WHERE oe_idagendaevento = ae_id ' +
                                  'AND oe_idmotivoingreso IS NOT NULL ' +
                            'UNION ALL ' +
                               'SELECT 1 ' + {Obs. en la tarea generada}
                                 'FROM agenda.aot_observaciontarea, agenda.aat_agendatarea ' +
                                'WHERE ot_idagendatarea = at_id ' +
                                  'AND at_idagendaevento = ae_id ' +
                                  'AND ot_idmotivoingreso IS NOT NULL ' +
                            'UNION ALL ' +
                               'SELECT 1 ' + {Obs. en la tarea proveniente, siendo éste el evento de cierre}
                                 'FROM agenda.aot_observaciontarea, agenda.aat_agendatarea ' +
                                'WHERE ot_idagendatarea = at_id ' +
                                  'AND at_ideventotarea = ae_id ' +
                                  'AND ot_idmotivoingreso IS NOT NULL)';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('rellamada_evento', sAux, nil, rgVerRellamadas);

    case rgVerRellamadas.ItemIndex of
      1, 2: sAux := 'AND ' + iif(rgVerRellamadas.ItemIndex = 1, 'NOT', '') +
                       ' EXISTS(SELECT 1 ' + {Obs. en la propia tarea}
                                 'FROM agenda.aot_observaciontarea ' +
                                'WHERE ot_idagendatarea = at_id ' +
                                  'AND ot_idmotivoingreso IS NOT NULL ' +
                            'UNION ALL ' +
                               'SELECT 1 ' + {Obs. en el evento generador}
                                 'FROM agenda.aoe_observacionevento ' +
                                'WHERE oe_idagendaevento = at_idagendaevento ' +
                                  'AND oe_idmotivoingreso IS NOT NULL ' +
                            'UNION ALL ' +
                               'SELECT 1 ' + {Obs. en el evento de cierre}
                                 'FROM agenda.aoe_observacionevento ' +
                                'WHERE oe_idagendaevento = at_ideventotarea ' +
                                  'AND oe_idmotivoingreso IS NOT NULL)';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('rellamada_tarea', sAux, nil, rgVerRellamadas);

    ReemplazoParametrosFijos('automatico_evento',
                ' AND ' + iif(rgAutomaticos.ItemIndex = 1, 'NOT', '') +
                '     EXISTS(SELECT 1 ' +
                '              FROM art.use_usuarios, agenda.aat_agendatarea ' +
                '             WHERE at_ideventotarea = ae_id ' +
                '               AND ae_idusuario = se_id ' +
                '               AND NVL(ae_usuterminado, ae_usualta) = se_usuario ' +
                '               AND CASE ' +
                '                     WHEN at_idagendaevento IS NULL THEN CASE ' +
                '                                                          WHEN TRUNC(ae_fechaalta) - TRUNC(at_fechaalta) < 1 / 24 / 60 THEN 1 ' +
                '                                                          ELSE 0 ' +
                '                                                         END ' +
                '                     ELSE (SELECT 1 ' +
                '                             FROM DUAL ' +
                '                            WHERE EXISTS( ' +
                '                                    SELECT 1 ' +
                '                                      FROM agenda.aae_agendaevento orig, ' +
                '                                           agenda.ats_tipoeventosector ' +
                '                                     WHERE orig.ae_estado = 5 ' +
                '                                       AND ts_idtipoevento = orig.ae_idtipoevento ' +
                '                                       AND (   (ts_tipooperacion = ''A'') ' +
                '                                            OR (    TRUNC(orig.ae_fechaalta) - TRUNC(at_fechaalta) = 0 ' +
                '                                                AND TRUNC(aae.ae_fechaalta) - TRUNC(at_fechaalta) = 0)) ' +
                '                                       AND orig.ae_usualta = NVL(aae.ae_usuterminado, aae.ae_usualta) ' +
                '                                       AND at_idagendaevento = orig.ae_id ' +
                '                                       AND NVL(aae.ae_usuterminado, aae.ae_usualta) = se_usuario ' +
                '                                       AND se_usuario = at_usualta)) ' +
                '                   END = 1) ' +
                ' AND NOT EXISTS (SELECT 1 ' +
                '                   FROM agenda.aae_agendaevento otro ' +
                '                  WHERE otro.ae_fechaalta = aae.ae_fechaalta ' +
                '                    AND otro.ae_usualta = aae.ae_usualta ' +
                '                    AND otro.ae_id <> aae.ae_id) ', nil, rgAutomaticos);

    ReemplazoParametrosFijos('automatico_tarea',
                ' AND ' + iif(rgAutomaticos.ItemIndex = 1, 'NOT', '') +
                '     EXISTS(SELECT 1 ' +
                '              FROM art.use_usuarios, agenda.aae_agendaevento aae ' +
                '             WHERE at_ideventotarea = ae_id ' +
                '               AND ae_idusuario = se_id ' +
                '               AND NVL(ae_usuterminado, ae_usualta) = se_usuario ' +
                '               AND CASE ' +
                '                     WHEN at_idagendaevento IS NULL THEN CASE ' +
                '                                                          WHEN TRUNC(ae_fechaalta) - TRUNC(at_fechaalta) < 1 / 24 / 60 THEN 1 ' +
                '                                                          ELSE 0 ' +
                '                                                         END ' +
                '                     ELSE (SELECT 1 ' +
                '                             FROM DUAL ' +
                '                            WHERE EXISTS( ' +
                '                                    SELECT 1 ' +
                '                                      FROM agenda.aae_agendaevento orig, ' +
                '                                           agenda.ats_tipoeventosector ' +
                '                                     WHERE orig.ae_estado = 5 ' +
                '                                       AND ts_idtipoevento = orig.ae_idtipoevento ' +
                '                                       AND (   (ts_tipooperacion = ''A'') ' +
                '                                            OR (    TRUNC(orig.ae_fechaalta) - TRUNC(at_fechaalta) = 0 ' +
                '                                                AND TRUNC(aae.ae_fechaalta) - TRUNC(at_fechaalta) = 0)) ' +
                '                                       AND orig.ae_usualta = NVL(aae.ae_usuterminado, aae.ae_usualta) ' +
                '                                       AND at_idagendaevento = orig.ae_id ' +
                '                                       AND NVL(aae.ae_usuterminado, aae.ae_usualta) = se_usuario ' +
                '                                       AND se_usuario = at_usualta)) ' +
                '                   END = 1) ', nil, rgAutomaticos);

    case rgInsatisfaccion.ItemIndex of
      1, 2: sAux := 'AND ' + SQLString(iif(rgInsatisfaccion.ItemIndex = 1, 'S', 'N'), True) +
                         ' = CASE ' +
                            '  WHEN NVL(ae_insatisfaccion, ''N'') = ''S'' ' +
                            '   AND EXISTS(SELECT 1 ' +
                            '                FROM agenda.ain_insatisfaccion ' +
                            '               WHERE in_idagendaevento = ae_id) ' +
                            '   AND NOT EXISTS(SELECT 1 ' +
                            '                    FROM agenda.aat_agendatarea ' +
                            '                   WHERE at_idagendaevento = ae_id ' +
                            '                     AND at_fechabaja IS NULL ' +
                            '                     AND at_ideventotarea IS NOT NULL) THEN ''S'' ' +
                            '  ELSE ''N'' ' +
                            'END';
      else sAux := '';
    end;
    ReemplazoParametrosFijos('insatisfaccion_evento', sAux, nil, rgInsatisfaccion);

    if fraAE_IDTIPOEVENTO.IsSelected then
      ReemplazoParametrosFijos('tipo_evento2', 'AND EXISTS(SELECT 1 FROM agenda.aae_agendaevento WHERE ae_id = at_idagendaevento AND ae_idtipoevento = ' + SQLValue(fraAE_IDTIPOEVENTO.Value) + ')', nil)
    else
      ReemplazoParametrosFijos('tipo_evento2', '', nil);  

    for i := 0 to sdqTEMP.ParamCount - 1 do
    begin
      ReemplazoValorParametroFecha('FECHADESDE', edFechaDesde);
      ReemplazoValorParametroFecha('FECHAHASTA', edFechaHasta);
      ReemplazoValorParametroFecha('FECHADESDE_TAREA', edFechaDesdeTarea);
      ReemplazoValorParametroFecha('FECHAHASTA_TAREA', edFechaHastaTarea);

      ReemplazoValorParametro('GERENCIA', fraGerencias.Value, fraGerencias.IsSelected);
      ReemplazoValorParametro('JEFATURA', fraJefaturas.Value, fraJefaturas.IsSelected);
      ReemplazoValorParametro('SECTOR', fraSectores.Value, fraSectores.IsSelected);
      ReemplazoValorParametro('USUARIO', fraUsuarios.Value, fraUsuarios.IsSelected);
      ReemplazoValorParametro('PROCESO', fraProceso.Value, fraProceso.IsSelected);
      ReemplazoValorParametro('CANAL', fraMI_ID.Value, fraMI_ID.IsSelected);
      ReemplazoValorParametro('TIPO_EVENTO', fraAE_IDTIPOEVENTO.Value, fraAE_IDTIPOEVENTO.IsSelected);
      ReemplazoValorParametro('TIPO_TAREA', fraAT_IDTIPOEVENTO.Value, fraAT_IDTIPOEVENTO.IsSelected);

      if UpperCase(sdqTEMP.Params[i].Name) = 'FILA' then
        sdqTEMP.ParamByName('FILA').AsInteger := rgVisualizar.ItemIndex * 10;

      if UpperCase(sdqTEMP.Params[i].Name) = 'INSATISFACCION' then
        sdqTEMP.ParamByName('INSATISFACCION').AsInteger := rgInsatisfaccion.ItemIndex;
    end;

    dsConsulta.DataSet := sdqTEMP;
    sdqConsulta := sdqTEMP;
    ExportDialog.DataSet := sdqTEMP;
                                      
    if SortDialog.OrderBy > '' then
      sdqConsulta.SQL.Text := RemoveOrderBy(sdqConsulta.SQL.Text) + ' ' + SortDialog.OrderBy;

    PrevCursor := Screen.Cursor;
    try
      Screen.Cursor := crSQLWait;
      try
        sMensaje := 'Ocurrió un error inesperado al ejecutar la consulta!' + CRLF + 'Utilice la información a continuación para comprender el error o contactar a Sistemas.';
        OpenQuery(sdqConsulta);
        sMensaje := '';
      except
        on E: ESDOraError do
          if (sdqTEMP = sdqSTAT6) and AreIn(IntToStr(ESDOraError(E).ErrorCode), ['6502', '6512', '22813']) then
            sMensaje := 'Esta estadística (Tareas por Estado -con detalle-) tiene un límite en la cantidad de tareas que puede mostrar al agrupar por estado.' + CRLF + CRLF +
                        'Puede emplear la estadística inmediata superior que no contiene el detalle de las tareas o bien utilice otra combinación de filtros (por ejemplo un rango de fechas mas breve) para acotar la búsqueda.'
          else
            sMensaje := sMensaje + CRLF + CRLF + E.Message + CRLF + CRLF + 'En particular, el error en ESTA ESTADÍSTICA pudo haber sido causa de un límite excedido. Antes de dar aviso pruebe la estadística inmediata superior que no contiene el detalle de las tareas. ' + 'No es posible obtener el detalle de una cantidad de tareas tan grande por esta vía.';
        on E: Exception do
        begin
          if sdqTEMP = sdqSTAT6 then
            sMensaje := sMensaje + CRLF + CRLF + E.Message + CRLF + CRLF + 'En particular, el error en ESTA ESTADÍSTICA pudo haber sido causa de un límite excedido. Antes de dar aviso pruebe la estadística inmediata superior que no contiene el detalle de las tareas. ' + 'No es posible obtener el detalle de una cantidad de tareas tan grande por esta vía.';
        end;
      end;
    finally
      Screen.Cursor := PrevCursor;
      Grid.FooterBand := False;      
      CheckButtons;
      if not IsEmptyString(sMensaje) then
        InvalidHint(tbRefrescar, sMensaje, 'Error al consultar la estadística', blnError, 120);
    end;

    if not sdqTEMP.IsEmpty then
    begin
      sdqTEMP.FetchAll;
      sdqTEMP.First;

      if sdqTEMP = sdqSTAT6 then
        Grid.ColumnByField['TAREAS'].Width := 100;

      Grid.Width := GetColumnWidths(Grid, True) - 7;

      SetLength(aColumnas, 0);
      SetLength(aValores, 0);

      for i := 0 to sdqTEMP.FieldCount - 1 do
      begin
        if (Pos('CANTIDAD', UpperCase(sdqTEMP.Fields[i].FieldName)) > 0) then
        begin
          SetLength(aColumnas, Length(aColumnas) + 1);
          SetLength(aValores, Length(aValores) + 1);
          aColumnas[Length(aColumnas) - 1] := UpperCase(sdqTEMP.Fields[i].FieldName);
          aValores[Length(aValores) - 1] := FloatToStr(ObtenerSuma(Grid, sdqTEMP.Fields[i].FieldName));
          Grid.FooterBand := True;
        end;
      end;
    end;

    Grid.ShowSearchButton := (not sdqTEMP.IsEmpty) and (sdqTEMP.RecordCount > 20);

    tbImprimirGrafico.Enabled := not sdqTEMP.IsEmpty and not((sdqTEMP = sdqSTAT15) {or (sdqTEMP = sdqSTAT16)});
    dbChartGrafico.Visible := not sdqTEMP.IsEmpty and not((sdqTEMP = sdqSTAT15) {or (sdqTEMP = sdqSTAT16)});
  end;

  ControlFiltros(nil);  
end;

procedure TfrmEstadisticasAGENDA.rgTIPOClick(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([rgVerTareas], not ((rgTIPO.ItemIndex in [1,4]) or (rgTIPOAvanzado.ItemIndex in [1,4])));
  VCLExtra.LockControls([rgVerEventos], not rgVerTareas.Enabled);
  Actualizar(Sender);
end;

procedure TfrmEstadisticasAGENDA.SeguridadAfterExecute(Sender: TObject);
begin
  inherited;
  if Seguridad.Claves.IsActive('PuedeFiltrarGerencia') then
    VCLExtra.LockControls([fraGerencias], False);

  if Seguridad.Claves.IsActive('PuedeFiltrarJefatura') then
    VCLExtra.LockControls([fraJefaturas], False);

  if Seguridad.Claves.IsActive('PuedeFiltrarSector') then
    VCLExtra.LockControls([fraSectores], False);

  if Seguridad.Claves.IsActive('PuedeFiltrarGerencia') or Seguridad.Claves.IsActive('PuedeFiltrarJefatura') or Seguridad.Claves.IsActive('PuedeFiltrarSector') then
    VCLExtra.LockControls([fraUsuarios], False);
end;

end.
