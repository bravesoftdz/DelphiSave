unit unEstadisticas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, unFraCodDesc, Series, TeEngine, TeeProcs, Chart, DbChart, JvExExtCtrls,
  JvNavigationPane, QRTEE, QuickRpt, QRCtrls, RxGIF, RxToolEdit, RxPlacemnt;

type
  TArrayOfString = array of String;
  TfrmEstadisticas = class(TfrmCustomConsulta)
    rgTIPO: TRadioGroup;
    sdqSTAT0: TSDQuery;
    sdqSTAT1: TSDQuery;
    sdqSTAT2: TSDQuery;
    sdqSTAT4: TSDQuery;
    sdqSTAT3: TSDQuery;
    sdqSTAT0SE_NOMBRE: TStringField;
    sdqSTAT0CANTIDAD: TFloatField;
    sdqSTAT1GERENCIA: TStringField;
    sdqSTAT1CANTIDAD: TFloatField;
    sdqSTAT2GERENCIA: TStringField;
    sdqSTAT2CANTIDAD_DE_PEDIDOS: TFloatField;
    sdqSTAT2CANTIDAD_DE_USUARIOS: TFloatField;
    sdqSTAT2PROMEDIO_POR_USUARIO: TFloatField;
    sdqSTAT3TICKET: TFloatField;
    sdqSTAT3SOLICITANTE: TStringField;
    sdqSTAT3CARGA: TStringField;
    rgFecha: TGroupBox;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ShortCutControlHijo: TShortCutControl;
    fraSectores: TfraCodDesc;
    Label3: TLabel;
    sdqSTAT4ES_DESCRIPCION: TStringField;
    sdqSTAT4CANTIDAD: TFloatField;
    sdqSTAT5: TSDQuery;
    sdqSTAT5CA_DESCRIPCION: TStringField;
    sdqSTAT5CANTIDAD: TFloatField;
    chkRechazados: TCheckBox;
    chkAnulados: TCheckBox;
    chkComputos: TCheckBox;
    sdqSTAT6: TSDQuery;
    sdqSTAT6ANTICUACION: TStringField;
    sdqSTAT6CANTIDAD: TFloatField;
    sdqSTAT7: TSDQuery;
    sdqSTAT7DIASRESOLUCION: TFloatField;
    sdqSTAT7CANTIDAD: TFloatField;
    dbChartGrafico: TDBChart;
    Series1: TPieSeries;
    SplitterVert: TJvOutlookSplitter;
    Series2: TPieSeries;
    Series3: TPieSeries;
    Series4: TPointSeries;
    Series5: TPieSeries;
    Series6: TPieSeries;
    Series7: TLineSeries;
    Series8: TBarSeries;
    tbImprimirGrafico: TToolButton;
    ScrollBoxReporte: TScrollBox;
    qrReporte: TQuickRep;
    PageHeaderBand1: TQRBand;
    qriLogoART: TQRImage;
    QRLabel1: TQRLabel;
    qrTitleBand: TQRBand;
    qrTitulo: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    ChildBand1: TQRChildBand;
    qrdbText1: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    qrlColumna1: TQRLabel;
    qrlColumna2: TQRLabel;
    qrdbText2: TQRDBText;
    qrdbText3: TQRDBText;
    qrlColumna3: TQRLabel;
    qrlColumna4: TQRLabel;
    qrdbText4: TQRDBText;
    qrlColumna0: TQRLabel;
    qrdbText0: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel4: TQRLabel;
    sdqSTAT8: TSDQuery;
    sdqSTAT8SE_NOMBRE: TStringField;
    sdqSTAT8CANTIDAD: TFloatField;
    Series9: TPieSeries;
    fraUsuarios: TfraCodDesc;
    Label26: TLabel;
    sdqSTAT9: TSDQuery;
    sdqSTAT9NOMBRE: TStringField;
    sdqSTAT9INDICE: TFloatField;
    Series10: THorizBarSeries;
    sdqSTAT10: TSDQuery;
    sdqSTAT10MOTIVO: TStringField;
    sdqSTAT10CANTIDAD: TFloatField;
    sdqSTAT11: TSDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    Series11: TPieSeries;
    Series12: TPieSeries;
    Series13: THorizBarSeries;
    sdqSTAT12: TSDQuery;
    sdqSTAT12PERIODO: TStringField;
    sdqSTAT12CANTIDAD: TFloatField;
    sdqSTAT13: TSDQuery;
    StringField3: TStringField;
    FloatField2: TFloatField;
    Series14: TPieSeries;
    chkUsuariosPocaParticipacion: TCheckBox;
    procedure rgTIPOClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbImprimirGraficoClick(Sender: TObject);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure ControlFiltroUsuario(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
  private
    aColumnas, aValores: TArrayOfString;
    aSqlAnt: String;
    FIdSistemaTicket: Integer;
    FUsuariosExtraCondition: String;

    function SinOrderBy(ASQL: String): String;

    procedure CloseQuerys(sdqTEMP: TSDQuery);
  public
    qrChartGrafico: TQRChart;
    qrDBChartGrafico: TQRDBChart;
  
    procedure RefreshData; override;
  end;

var
  frmEstadisticas: TfrmEstadisticas;

implementation

uses
  unDmPrincipal, VCLExtra, CustomDlgs, unArt, General, unSesion, unGrids, Strfuncs, unVisualizador, AnsiSql, StrUtils,
  unSistemas;

{$R *.dfm}

{ TfrmEstadisticas }

procedure TfrmEstadisticas.CloseQuerys(sdqTEMP: TSDQuery);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i].InheritsFrom(TSDQuery) and (Components[i] <> sdqTEMP) then
      TSDQuery(Components[i]).Close;
end;

function TfrmEstadisticas.SinOrderBy(ASQL: String): String;
begin
  Result := Copy(ASQL, 0, Pos('ORDER BY', UpperCase(ASQL)) - 1);
end;

procedure TfrmEstadisticas.RefreshData;
var
  sdqTEMP: TSDQuery;
  i: Integer;
  sSql: String;
begin
  Verificar(rgTIPO.ItemIndex = -1, rgTIPO, 'Debe seleccionar un tipo de estadística.');
  if Assigned(FindComponent('sdqSTAT' + IntToStr(rgTIPO.ItemIndex))) and (FindComponent('sdqSTAT' + IntToStr(rgTIPO.ItemIndex)) is TDataSet) then
  begin
    sdqTEMP := TSDQuery(FindComponent('sdqSTAT' + IntToStr(rgTIPO.ItemIndex)));
    CloseQuerys(sdqTEMP);

    for i := 0 to dbChartGrafico.SeriesList.Count-1 do
      dbChartGrafico.SeriesList[i].Active := False;

    dbChartGrafico.SeriesList[rgTIPO.ItemIndex].Active := True;

    if (rgTIPO.ItemIndex = 9) and (aSqlAnt <> '') then
      sdqTEMP.Sql.Text := aSqlAnt;

    for i := 0 to sdqTEMP.ParamCount - 1 do
    begin
      if UpperCase(sdqTEMP.Params[i].Name) = 'FECHADESDE' then
      begin
        if not edFechaDesde.IsEmpty then
          sdqTEMP.ParamByName('FECHADESDE').AsDateTime := edFechaDesde.Date
        else
          sdqTEMP.ParamByName('FECHADESDE').AsDateTime := ART_MINFECHA;
      end;

      if UpperCase(sdqTEMP.Params[i].Name) = 'FECHAHASTA' then
      begin
        if not edFechaHasta.IsEmpty then
          sdqTEMP.ParamByName('FECHAHASTA').AsDateTime := edFechaHasta.Date
        else
          sdqTEMP.ParamByName('FECHAHASTA').AsDateTime := ART_MAXFECHA;
      end;

      if UpperCase(sdqTEMP.Params[i].Name) = 'SECTOR' then
      begin
        if fraSectores.IsSelected then
          sdqTEMP.ParamByName('SECTOR').AsInteger := StrToIntDef(fraSectores.Id, 0)
        else
          sdqTEMP.ParamByName('SECTOR').AsInteger := 0;
      end;

      if UpperCase(sdqTEMP.Params[i].Name) = 'USUARIO' then
      begin
        if fraUsuarios.IsSelected then
          sdqTEMP.ParamByName('USUARIO').AsInteger := StrToIntDef(fraUsuarios.Id, 0)
        else
          sdqTEMP.ParamByName('USUARIO').AsInteger := 0;
      end;

      if UpperCase(sdqTEMP.Params[i].Name) = 'ANULADO' then
      begin
        if chkAnulados.Checked then
          sdqTEMP.ParamByName('ANULADO').AsInteger := 6
        else
          sdqTEMP.ParamByName('ANULADO').AsInteger := 0;
      end;

      if UpperCase(sdqTEMP.Params[i].Name) = 'RECHAZADO' then
      begin
        if chkRechazados.Checked then
          sdqTEMP.ParamByName('RECHAZADO').AsInteger := 8
        else
          sdqTEMP.ParamByName('RECHAZADO').AsInteger := 0;
      end;

      if UpperCase(sdqTEMP.Params[i].Name) = 'COMPUTOS' then
      begin
        if chkComputos.Checked then
          sdqTEMP.ParamByName('COMPUTOS').AsString := 'COMPUTOS'
        else
          sdqTEMP.ParamByName('COMPUTOS').AsString := EmptyStr;
      end;

      if UpperCase(sdqTEMP.Params[i].Name) = 'POCAPARTICIPACION' then
      begin
        if chkUsuariosPocaParticipacion.Checked then
          sdqTEMP.ParamByName('POCAPARTICIPACION').AsInteger := 1
        else
          sdqTEMP.ParamByName('POCAPARTICIPACION').AsInteger := 0;
      end;
    end;

    if rgTIPO.ItemIndex = 9 then
      begin
        sSql := Get_ConsultaSinParametros(sdqTEMP.SQL.Text, sdqTEMP.Params);
        EjecutarStoreEx('ART.VARIOS.GET_MEDIAALFAPODADA(:Consulta, :PorcAlfa);', [sSql, 10]);

        aSqlAnt := sdqTEMP.Sql.Text;

        sSql := 'SELECT AF_ROTULO nombre, ROUND(AF_VALOR, 3) indice ' +
                  'FROM TAF_MEDIAALFAPODADA_FINAL ' +
                 'ORDER BY 2 DESC';
        sdqTEMP.Sql.Text := sSql;
      end;

    dsConsulta.DataSet := sdqTEMP;
    sdqConsulta := sdqTEMP;
    ExportDialog.DataSet := sdqTEMP;

    if SortDialog.OrderBy > '' then
      sdqConsulta.SQL.Text := SinOrderBy(sdqConsulta.SQL.Text) + ' ' + SortDialog.OrderBy;

    inherited;

    if not sdqTEMP.IsEmpty then
    begin
      sdqTEMP.FetchAll;
      sdqTEMP.First;
      Grid.Width := GetColumnWidths(Grid, True) - 7;
    end;

    tbImprimirGrafico.Enabled := not sdqTEMP.IsEmpty and not((sdqTEMP = sdqSTAT3) or (sdqTEMP = sdqSTAT6));
    dbChartGrafico.Visible := not sdqTEMP.IsEmpty and not((sdqTEMP = sdqSTAT3) or (sdqTEMP = sdqSTAT6));

    SetLength(aColumnas, 0);
    SetLength(aValores, 0);
    Grid.FooterBand := False;

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
end;

procedure TfrmEstadisticas.rgTIPOClick(Sender: TObject);
begin
  inherited;
  sdqConsulta.Close;
  SortDialog.SortFields.Clear;
  RefreshData;
end;

procedure TfrmEstadisticas.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edFechaDesde.Clear;
  edFechaHasta.Clear;      
  fraSectores.Codigo := ValorSQLEx('SELECT SE_IDSECTOR FROM ART.USE_USUARIOS WHERE SE_USUARIO = :USUARIO', [Sesion.UserID]);
  chkAnulados.Checked := True;
  chkRechazados.Checked := True;
  chkComputos.Checked := False;
  chkUsuariosPocaParticipacion.Checked := True;
end;

procedure TfrmEstadisticas.FormCreate(Sender: TObject);
begin
  inherited;
  FIdSistemaTicket := GetIdSistemaTicket();
  aSqlAnt := '';
  tbLimpiar.Click;
  tbImprimirGrafico.Left := tbImprimir.Left;
  tbSalir.Enabled := True;
  qrReporte.PreviewWidth := Screen.Width - 40;
  qrReporte.PreviewHeight := Screen.Height - 100;

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

  FUsuariosExtraCondition := 'AND se_idsector IN (SELECT sector2.se_id ' +
                                                   'FROM computos.cse_sector sector2, computos.cts_ticketsector, computos.cse_sector sector, computos.csu_sectorusuario, ' +
                                                        'art.use_usuarios users ' +
                                                  'WHERE users.se_usuario = ' + SQLValue(Sesion.UserID) + ' ' +
                                                    'AND art.agenda_pkg.is_sectordependiente(su_idsector, users.se_idsector) = ''S'' ' +
                                                    'AND art.agenda_pkg.is_sectordependiente(su_idsector, sector.se_id) = ''S'' ' +
                                                    'AND art.agenda_pkg.is_sectordependiente(ts_idsector, sector2.se_id) = ''S'' ' +
                                                    'AND ts_idsistematicket = ' + SqlValue(FIdSistemaTicket) + ')';

  fraSectores.Propiedades.ExtraCondition := 'AND se_nivel = 4 ' +
                                            'AND se_id IN (SELECT sector2.se_id ' +
                                                            'FROM computos.cse_sector sector2, computos.cts_ticketsector, computos.cse_sector sector, computos.csu_sectorusuario, ' +
                                                                 'art.use_usuarios users ' +
                                                           'WHERE users.se_usuario = ' + SQLValue(Sesion.UserID) + ' ' +
                                                             'AND art.agenda_pkg.is_sectordependiente(su_idsector, users.se_idsector) = ''S'' ' +
                                                             'AND art.agenda_pkg.is_sectordependiente(su_idsector, sector.se_id) = ''S'' ' +
                                                             'AND art.agenda_pkg.is_sectordependiente(ts_idsector, sector2.se_id) = ''S'' ' +
                                                             'AND ts_idsistematicket = ' + SqlValue(FIdSistemaTicket) + ')';
end;

procedure TfrmEstadisticas.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  inherited;
  if IsEmptyString(Value) and (Pos('CANTIDAD', UpperCase(Column)) > 0) then
    Value := aValores[ArrayPos(UpperCase(Column), aColumnas)];
end;

procedure TfrmEstadisticas.tbImprimirGraficoClick(Sender: TObject);
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

procedure TfrmEstadisticas.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value := ' Impreso por ' + Sesion.Usuario;
end;

procedure TfrmEstadisticas.QRLabel3Print(sender: TObject; var Value: String);
begin
  Value := 'Impreso el ' + DateToStr(DBDate) + ' ';
end;

procedure TfrmEstadisticas.QRLabel4Print(sender: TObject; var Value: String);
begin
  inherited;
  if fraSectores.IsSelected then
    Value := 'Sector: ' + fraSectores.Descripcion
  else
    Value := 'Sector: Gerencia de Sistemas';

  Value := Value + CRLF;

  if fraUsuarios.IsSelected then
    Value := Value + 'Usuario asignado a la resolución: ' + fraUsuarios.Descripcion
  else
    Value := Value + 'Usuario asignado a la resolución: Todos';

  Value := Value + CRLF;

  if edFechaDesde.IsEmpty and edFechaHasta.IsEmpty then
    Value := Value + 'Sin rango de fechas a modo de filtro'
  else begin
    if not edFechaDesde.IsEmpty then
      Value := Value + 'Desde el ' + DateToStr(edFechaDesde.Date);

    if not edFechaHasta.IsEmpty then
      Value := Value + ' Hasta el ' + DateToStr(edFechaHasta.Date);
  end;
end;

procedure TfrmEstadisticas.ControlFiltroUsuario(Sender: TObject);
var
  nIdUsuario: Integer;
begin
  nIdUsuario := fraUsuarios.Value;
  with fraUsuarios.Propiedades do
  begin
    ExtraCondition := FUsuariosExtraCondition +
                      ' AND ((se_fechabaja is null) or (se_fechabaja > art.actualdate - 365)) ' +
                      ' AND se_usuariogenerico = ''N'' ';

    if fraSectores.IsSelected then
      ExtraCondition := ExtraCondition + ' AND SE_IDSECTOR = ' + SQLValue(fraSectores.Codigo)
    else
      ExtraCondition := ExtraCondition + ' AND SE_ID IN (SELECT USUARIOS.SE_ID ' +
                                                         ' FROM ART.USE_USUARIOS USUARIOS ' +
                                                        ' WHERE USUARIOS.SE_IDSECTOR IN (SELECT SECTOR.SE_ID ' +
                                                                                         ' FROM COMPUTOS.CSE_SECTOR SECTOR, COMPUTOS.CSU_SECTORUSUARIO ' +
                                                                                        ' WHERE SU_IDSECTOR = SECTOR.SE_ID)) ' +
                                         ' AND SE_IDSECTOR > 0 ';
  end;

  if nIdUsuario > 0 then
    fraUsuarios.Value := nIdUsuario;

  if fraSectores.IsSelected and fraUsuarios.IsSelected
  and (fraSectores.Codigo <> fraUsuarios.sdqDatos.FieldByName('SE_IDSECTOR').AsString) then
    fraUsuarios.Clear;

  if Assigned(Sender) then
    fraUsuarios.cmbDescripcionDropDown(Sender);
end;

procedure TfrmEstadisticas.tbOrdenarClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

end.
