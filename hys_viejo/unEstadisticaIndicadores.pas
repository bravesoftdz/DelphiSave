unit unEstadisticaIndicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraCodDesc, StdCtrls, Mask, ToolEdit, DateComboBox, Series, TeEngine,
  QRTEE, QuickRpt, QRCtrls, TeeProcs, Chart, DbChart, JvExExtCtrls,
  JvNavigationPane, PeriodoPicker, FormPanel;

type
  TArrayOfString = array of String;
  TfrmEstadisticasIndicadores = class(TfrmCustomConsulta)
    SplitterVert: TJvOutlookSplitter;
    sdqSTAT0: TSDQuery;
    sdqSTAT1: TSDQuery;
    sdqSTAT2: TSDQuery;
    sdqSTAT4: TSDQuery;
    sdqSTAT3: TSDQuery;
    dbChartGrafico: TDBChart;
    ScrollBoxReporte: TScrollBox;
    qrReporte: TQuickRep;
    PageHeaderBand1: TQRBand;
    qriLogoART: TQRImage;
    QRLabel1: TQRLabel;
    qrTitleBand: TQRBand;
    qrTitulo: TQRLabel;
    DetailBand1: TQRBand;
    qrdbText1: TQRDBText;
    qrdbText2: TQRDBText;
    qrdbText3: TQRDBText;
    qrdbText4: TQRDBText;
    qrdbText0: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    ChildBand1: TQRChildBand;
    qrChartGrafico: TQRChart;
    qrDBChartGrafico: TQRDBChart;
    ColumnHeaderBand1: TQRBand;
    qrlColumna1: TQRLabel;
    qrlColumna2: TQRLabel;
    qrlColumna3: TQRLabel;
    qrlColumna4: TQRLabel;
    qrlColumna0: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel4: TQRLabel;
    Series1: TPieSeries;
    Panel1: TPanel;
    rgTIPO: TRadioGroup;
    tbImprimirGrafico: TToolButton;
    edMes: TPeriodoPicker;
    Label5: TLabel;
    ShortCutControl1: TShortCutControl;
    sdqGrafico: TSDQuery;
    sdqSTAT0Preventor: TStringField;
    sdqSTAT0FueradeTermino: TFloatField;
    sdqSTAT0TotalTareas: TFloatField;
    sdqGraficoDESCRIPCION: TStringField;
    sdqGraficoCANTIDAD: TFloatField;
    chkSinPreventor: TCheckBox;
    fraPreventorFiltro: TfraCodigoDescripcion;
    Label1: TLabel;
    cbNoTercerizado: TCheckBox;
    cbTercerizado: TCheckBox;
    edMesHasta: TPeriodoPicker;
    Label2: TLabel;
    sdqSTAT5: TSDQuery;
    sdqSTAT1Coordinador: TStringField;
    sdqSTAT1FueradeTermino: TFloatField;
    sdqSTAT1TotalTareas: TFloatField;
    sdqSTAT1PorcentajedeVerificacin: TFloatField;
    sdqSTAT2TOTAL: TStringField;
    sdqSTAT2FueradeTermino: TFloatField;
    sdqSTAT2TotalTareas: TFloatField;
    sdqSTAT2PorcentajeVerificacin: TFloatField;
    sdqSTAT4Preventor: TStringField;
    sdqSTAT4PorcentajeCumplimiento: TFloatField;
    sdqGraficoBarra: TSDQuery;
    Series2: TBarSeries;
    sdqGraficoBarraDESCRIPCION: TStringField;
    sdqGraficoBarraEJEX: TFloatField;
    sdqGraficoBarraCANTIDAD: TFloatField;
    sdqSTAT0PorcentajeVerificacin: TFloatField;
    sdqSTAT6: TSDQuery;
    sdqSTAT7: TSDQuery;
    sdqSTAT3Preventor: TStringField;
    sdqSTAT3Menor3Das: TFloatField;
    sdqSTAT3Menor5Das: TFloatField;
    sdqSTAT3Mayor5Das: TFloatField;
    sdqSTAT3Total: TFloatField;
    Label3: TLabel;
    fraCoordinadorFiltro: TfraCodigoDescripcion;
    tbAyuda: TToolButton;
    FormPanel1: TFormPanel;
    fpAyudaIndicadores: TFormPanel;
    btnAceptarAyuda: TButton;
    edAyuda: TMemo;
    btnCancelarrAyuda: TButton;
    tbModificarAyuda: TToolButton;
    sdqSTAT5Preventor: TStringField;
    sdqSTAT5CantVisitasPrioritarias: TFloatField;
    sdqSTAT5CantVisitadoPrioritarias: TFloatField;
    sdqSTAT5PorcPrioritarias: TFloatField;
    sdqSTAT5CantVisitasCompensatorias: TFloatField;
    sdqSTAT5CantVisitadoCompensatorias: TFloatField;
    sdqSTAT5PorcCompensatorias: TFloatField;
    sdqSTAT5CantVisitasNoProgramada: TFloatField;
    sdqSTAT5CantVisitadoNoProgramadas: TFloatField;
    sdqSTAT5PorcNoProgramadas: TFloatField;
    sdqSTAT5CantVisitasCompenManual: TFloatField;
    sdqSTAT5CantVisitadoCompenManual: TFloatField;
    sdqSTAT5PorcCompensatoriasManual: TFloatField;
    sdqSTAT5CantVisitasms13Meses: TFloatField;
    sdqSTAT5CantVisitadomsde13Meses: TFloatField;
    sdqSTAT5Porcmsde13Meses: TFloatField;
    procedure tbOrdenarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqSTAT0AfterScroll(DataSet: TDataSet);
    procedure sdqSTAT1AfterScroll(DataSet: TDataSet);
    procedure sdqSTAT2AfterScroll(DataSet: TDataSet);
    procedure sdqSTAT3AfterScroll(DataSet: TDataSet);
    procedure sdqSTAT4AfterScroll(DataSet: TDataSet);
    procedure sdqSTAT5AfterScroll(DataSet: TDataSet);
    procedure sdqSTAT6AfterScroll(DataSet: TDataSet);
    procedure sdqSTAT7AfterScroll(DataSet: TDataSet);
    procedure rgTIPOClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
    procedure dbChartGraficoProcessRecord(Sender: TCustomDBChart;
      DataSet: TDataSet);
    procedure tbAyudaClick(Sender: TObject);
    procedure btnAceptarAyudaClick(Sender: TObject);
    procedure tbModificarAyudaClick(Sender: TObject);
  private
    { Private declarations }
    aSqlAnt: String;
    sWhere : String;
    procedure CargarGrafico(sSql: String);
    procedure CargarGraficoBarra(sSql: String);
  public
    { Public declarations }
    procedure RefreshData; override;
  end;

var
  frmEstadisticasIndicadores: TfrmEstadisticasIndicadores;

implementation

uses
  unDmPrincipal, VCLExtra, CustomDlgs, unArt, General, unSesion, unGrids, Strfuncs, unVisualizador, AnsiSql, StrUtils,
  DateUtils, unDetalleIndicadores;
{$R *.dfm}

procedure TfrmEstadisticasIndicadores.CargarGrafico(sSql : String);
begin
  sdqGrafico.SQL.Text := sSql;
  if sdqGraficoBarra.Active then
    sdqGraficoBarra.Close;

  dbChartGrafico.SeriesList[1].Active := False;
  dbChartGrafico.SeriesList[0].Active := True;

  sdqGrafico.Open;
  dbChartGrafico.Visible := not sdqGrafico.IsEmpty;
end;

procedure TfrmEstadisticasIndicadores.CargarGraficoBarra(sSql : String);
begin
  sdqGraficoBarra.SQL.Text := sSql;
  if sdqGrafico.Active then
    sdqGrafico.Close;

  dbChartGrafico.SeriesList[0].Active := False;
  dbChartGrafico.SeriesList[1].Active := True;

  sdqGraficoBarra.Open;
  dbChartGrafico.Visible := not sdqGraficoBarra.IsEmpty;
end;


procedure TfrmEstadisticasIndicadores.RefreshData;
var
  sWhereInterno, sWhereInternoUnion : String;
  i: integer;
begin
  Verificar(rgTIPO.ItemIndex = -1, rgTIPO, 'Debe seleccionar un tipo de estadística.');
  sWhere := '';
  case rgTIPO.ItemIndex of
    0:
    begin
      Verificar(edMes.Text <= '201308', edMes, 'Este indicador no está disponible para período anteriores al 201308.');
      if chkSinPreventor.Checked then
      begin
        sWhere := sWhere + ' AND it_id(+) = ps_idpreventor ';
//                       ' AND it_fechabaja(+) IS NULL ';
      end
      else begin
        sWhere := sWhere + '  AND it_id = ps_idpreventor ' +
                       '  AND it_fechabaja IS NULL ';
      end;
      if (edMes.Text <> '') and (edMes.Text = edMesHasta.Text) then
        sWhere := sWhere + ' AND pv_mes = ' + SqlValue(edMes.Text)
      else
      begin
        if edMes.Text <> '' then
          sWhere := sWhere + ' AND pv_mes >= ' + SqlValue(edMes.Text);
        if edMesHasta.Text <> '' then
          sWhere := sWhere + ' AND pv_mes <= ' + SqlValue(edMesHasta.Text);
      end;

      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_id = ' + SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value);

      sdqConsulta.SQL.Text := sdqSTAT0.SQL.Text + sWhere + ' GROUP BY ps_idpreventor, it_nombre ';
      sdqConsulta.AfterScroll := sdqSTAT0AfterScroll;
    end;
    1:
    begin
      Verificar(edMes.Text <= '201308', edMes, 'Este indicador no está disponible para período anteriores al 201308.');
      if chkSinPreventor.Checked then
      begin
        sWhere := sWhere + ' AND prev.it_id(+) = ps_idpreventor ';
//                       ' AND prev.it_fechabaja(+) IS NULL ';
      end
      else begin
        sWhere := sWhere + '  AND prev.it_id = ps_idpreventor   ' +
                       '  AND prev.it_fechabaja IS NULL ';
      end;
      if (edMes.Text <> '') and (edMes.Text = edMesHasta.Text) then
        sWhere := sWhere + ' AND pv_mes = ' + SqlValue(edMes.Text)
      else
      begin
        if edMes.Text <> '' then
          sWhere := sWhere + ' AND pv_mes >= ' + SqlValue(edMes.Text);
        if edMesHasta.Text <> '' then
          sWhere := sWhere + ' AND pv_mes <= ' + SqlValue(edMesHasta.Text);
      end;

      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND prev.it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND prev.it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND prev.it_id = ' + SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value);
      sdqConsulta.SQL.Text := sdqSTAT1.SQL.Text + sWhere + ' GROUP BY cor.it_id, cor.it_nombre ';
      sdqConsulta.AfterScroll := sdqSTAT1AfterScroll;
    end;
    2:
    begin
      Verificar(edMes.Text <= '201308', edMes, 'Este indicador no está disponible para período anteriores al 201308.');
      if (edMes.Text <> '') and (edMes.Text = edMesHasta.Text) then
        sWhere := sWhere + ' AND pv_mes = ' + SqlValue(edMes.Text)
      else
      begin
        if edMes.Text <> '' then
          sWhere := sWhere + ' AND pv_mes >= ' + SqlValue(edMes.Text);
        if edMesHasta.Text <> '' then
          sWhere := sWhere + ' AND pv_mes <= ' + SqlValue(edMesHasta.Text);
      end;
      sdqConsulta.SQL.Text := sdqSTAT2.SQL.Text + sWhere;
      sdqConsulta.AfterScroll := sdqSTAT2AfterScroll;
    end;
    3:
    begin
      Verificar(edMes.Text = '', edMes, 'Debe Completar el Mes.');
      Verificar(edMesHasta.Text = '', edMesHasta, 'Debe Completar el Mes Hasta.');
      if chkSinPreventor.Checked then
      begin
        sWhereInterno := ' AND it_codigo(+) = itpreventor ';
      end
      else begin
        sWhereInterno := ' AND it_codigo = itpreventor ' +
                         ' AND it_fechabaja IS NULL ';
      end;
      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_id = ' + SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_idsupervisor = ' + SqlValue(fraCoordinadorFiltro.Value);

      sdqConsulta.SQL.Text := sdqSTAT3.SQL.Text + sWhere + sWhereInterno + 'GROUP BY it_codigo, it_nombre ';
      sdqConsulta.ParamByName('mes').AsString :=  edMes.Text;
      sdqConsulta.ParamByName('meshasta').AsString :=  edMesHasta.Text;
      sdqConsulta.AfterScroll := sdqSTAT3AfterScroll;
    end;
    4:
    begin
      Verificar(edMes.Text <= '201308', edMes, 'Este indicador no está disponible para período anteriores al 201308.');
      Verificar(edMes.Text = '', edMes,'Debe Completar el Mes Desde.');
      Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');
      EjecutarStore('art.hys.do_Cumplimientoprioridad('+SqlValue(edMes.Text)+','+SqlValue(edMesHasta.Text)+');');
      if chkSinPreventor.Checked then
      begin
        sWhereInterno := ' AND it_id(+) = cp_idpreventor ';
//        sWhere := sWhere + ' AND it_fechabaja(+) IS NULL ';
      end
      else begin
        sWhereInterno := '  AND it_id = cp_idpreventor   ';
        sWhere := sWhere + '  AND it_fechabaja IS NULL ';
      end;
      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND IT_TERCERIZADO = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND IT_TERCERIZADO = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_ID = '+SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);
      sdqConsulta.SQL.Text := sdqSTAT4.SQL.Text+sWhereInterno+ sWhere;
      sdqConsulta.AfterScroll := sdqSTAT4AfterScroll;
    end;
    5:
    begin
      Verificar(edMes.Text <= '201308', edMes, 'Este indicador no está disponible para período anteriores al 201308.');
      Verificar(edMes.Text = '', edMes,'Debe Completar el Mes Desde.');
      Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');
      EjecutarStore('art.hys.do_Cumplimientoprioridad('+SqlValue(edMes.Text)+','+SqlValue(edMesHasta.Text)+');');
      if chkSinPreventor.Checked then
      begin
        sWhereInterno := ' AND it_id(+) = cp_idpreventor ';
//        sWhere := sWhere + ' AND it_fechabaja(+) IS NULL ';
      end
      else begin
        sWhereInterno := '  AND it_id = cp_idpreventor   ';
        sWhere := sWhere + '  AND it_fechabaja IS NULL ';
      end;
      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND IT_TERCERIZADO = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND IT_TERCERIZADO = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_ID = '+SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);
      sdqConsulta.SQL.Text := sdqSTAT5.SQL.Text +sWhereInterno+ sWhere;
      sdqConsulta.AfterScroll := sdqSTAT5AfterScroll;
    end;
    6:
    begin
      Verificar(edMes.Text = '', edMes,'Debe Completar el Mes Desde.');
      Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');
      EjecutarStore('art.hys.do_procesargradocumplimiento(TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') , LAST_DAY(TO_DATE('+ SqlValue(edMesHasta.Text)+', ''YYYYMM'')));');
      EjecutarStore('art.hys.do_procesargradoincumplimiento(TO_DATE('+SqlValue(edMes.Text)+', ''YYYYMM'') , LAST_DAY(TO_DATE('+ SqlValue(edMesHasta.Text)+', ''YYYYMM'')));');

      if chkSinPreventor.Checked then
      begin
        sWhereInterno := ' AND it_codigo(+) = gc_codigopreventor ';
        sWhereInternoUnion := ' AND pit2.it_codigo(+) = ip_itcodigo ';
      end
      else begin
        sWhereInterno := '  AND it_codigo = gc_codigopreventor   ';
        sWhereInternoUnion := '  AND it_codigo = ip_itcodigo   ';
        sWhere := sWhere + '  AND it_fechabaja IS NULL ';
      end;
      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_id = '+SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);
      sdqConsulta.SQL.Text := sdqSTAT6.SQL.Text +sWhereInterno+ sWhere;

      sdqConsulta.SQL.Text := sdqConsulta.SQL.Text +
        ' UNION ALL ' +
        ' SELECT it_id, it_nombre "Preventor", art.hys.get_nombre_preventor_coord(ip_itcodigo) "Coordinador Actual", ' +
        '        ip_medicion "Medición", ''Plan'' "Tipo Medición", 0 "Cumplidas", ' +
        '        COUNT(*) "Total", 0 "Grado Cumplimiento" ' +
        '  FROM hys.hip_incumplimientosplan hip, art.pit_firmantes pit2 ' +
        ' WHERE 1=1 ' + sWhere +
        '   AND NOT EXISTS ( ' + sdqConsulta.SQL.Text +
        '                        AND ip_itcodigo = gc_codigopreventor ' +
        '                        AND ip_medicion = gc_medicion) ' +
        sWhereInternoUnion + sWhere +
        ' GROUP BY it_id, it_nombre, ip_itcodigo, ip_medicion ';

      if (SortDialog.OrderBy = '') then
        sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' ORDER BY 1, 4';

      sdqConsulta.AfterScroll := sdqSTAT6AfterScroll;
    end;
    7:
    begin
      Verificar(edMes.Text = '', edMes,'Debe Completar el Mes.');
      Verificar(edMesHasta.Text = '', edMesHasta,'Debe Completar el Mes Hasta.');
      if chkSinPreventor.Checked then
      begin
        sWhereInterno := ' AND it_codigo(+) = itpreventor ';
      end
      else begin
        sWhereInterno := ' AND it_codigo = itpreventor ' +
                         ' AND it_fechabaja IS NULL ';
      end;
      if not(cbTercerizado.Checked and cbNoTercerizado.Checked) then
      begin
        if (cbTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 1' ;

        if (cbNoTercerizado.Checked) then
          sWhere := sWhere + ' AND it_tercerizado = 0';
      end;
      if fraPreventorFiltro.IsSelected then
        sWhere := sWhere + ' AND it_id = '+SqlValue(fraPreventorFiltro.Value);
      if fraCoordinadorFiltro.IsSelected then
        sWhere := sWhere + ' AND IT_IDSUPERVISOR = '+SqlValue(fraCoordinadorFiltro.Value);

      sdqConsulta.SQL.Text := sdqSTAT7.SQL.Text + sWhere + sWhereInterno + 'GROUP BY it_codigo, it_nombre, tipomedicion';

      sdqConsulta.ParamByName('mes').AsString :=  edMes.Text;
      sdqConsulta.ParamByName('meshasta').AsString :=  edMesHasta.Text;

      if (SortDialog.OrderBy = '') then
        sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + ' ORDER BY 1, 3';

      sdqConsulta.AfterScroll := sdqSTAT7AfterScroll;
    end;
  end;
  dbChartGrafico.Visible := false;
  if (SortDialog.OrderBy <> '') then
    sdqConsulta.SQL.Text := sdqConsulta.SQL.Text + SortDialog.OrderBy;

  inherited;
  SplitterVert.Left := 0;
  for i:=0 to Grid.Columns.Count-1 do
    if SplitterVert.Left < 800 then
      SplitterVert.Left := SplitterVert.Left + Grid.Columns[i].Width;
  Grid.Width := SplitterVert.Left + 40;
end;

procedure TfrmEstadisticasIndicadores.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edMes.Clear;
  edMesHasta.Clear;
  fraPreventorFiltro.Clear;
  fraCoordinadorFiltro.Clear;
  chkSinPreventor.Checked := False;
  cbNoTercerizado.Checked := False;
  cbTercerizado.Checked := False;
  rgTIPO.ItemIndex := -1;
end;

procedure TfrmEstadisticasIndicadores.tbOrdenarClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmEstadisticasIndicadores.FormCreate(Sender: TObject);
begin
  inherited;
  aSqlAnt := '';
  tbLimpiar.Click;
  tbImprimirGrafico.Left := tbImprimir.Left;
  tbAyuda.Left := tbSalir.Left - 1;
  tbModificarAyuda.Left := tbSalir.Left - 1;
  tbSalir.Enabled := True;
  qrReporte.PreviewWidth := Screen.Width - 40;
  qrReporte.PreviewHeight := Screen.Height - 100;
  with fraPreventorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  with fraCoordinadorFiltro do
  begin
    TableName := 'ART.PIT_FIRMANTES';
    FieldDesc := 'IT_NOMBRE';
    FieldID := 'IT_ID';
    FieldCodigo := 'IT_CODIGO';
    FieldBaja := 'IT_FECHABAJA';
    CaseSensitive := false;
    ShowBajas := true;
    ExtraCondition := ' AND IT_IDROLPREVENTOR >= 5 '; 
  end;
  edMes.Text := ValorSql('SELECT to_char(art.actualdate,''YYYYMM'') FROM DUAL ');
  edMesHasta.Text := edMes.Text;
end;


procedure TfrmEstadisticasIndicadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if sdqGrafico.Active then
    sdqGrafico.Close;
end;

procedure TfrmEstadisticasIndicadores.sdqSTAT0AfterScroll(
  DataSet: TDataSet);
var
  sSql : String;
  porFueraTermino, porNoRealizados, porProximasAVencer: Real;
begin
  dbChartGrafico.Title.Text.Text := sdqConsulta.FieldByName('Preventor').AsString;

  porFueraTermino    := (sdqConsulta.FieldByName('Fuera de Término').AsFloat*100)/sdqConsulta.FieldByName('Total Tareas').AsFloat;
  porNoRealizados    := (sdqConsulta.FieldByName('No Realizadas Vencidas').AsFloat*100)/sdqConsulta.FieldByName('Total Tareas').AsFloat;
  porProximasAVencer := (sdqConsulta.FieldByName('Próximas a Vencer').AsFloat*100)/sdqConsulta.FieldByName('Total Tareas').AsFloat;
  sSql :=
    ' SELECT ''No Realizadas Vencidas'' || chr(13) descripcion, '+SqlNumber(porNoRealizados)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''En Término'' || chr(13) descripcion, '+SqlNumber(sdqConsulta.FieldByName('Porcentaje Verificación').AsFloat)+   ' AS cantidad FROM DUAL' +
    ' UNION ALL '+
    ' SELECT ''Fuera de Término'' || chr(13) descripcion, '+SqlNumber(porFueraTermino)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Próximas a Vencer'' || chr(13) descripcion, '+SqlNumber(porProximasAVencer)+   ' AS cantidad FROM DUAL';
  CargarGrafico(sSql);
end;

procedure TfrmEstadisticasIndicadores.sdqSTAT1AfterScroll(
  DataSet: TDataSet);
var
  sSql : String;
  porFueraTermino, porNoRealizados, porProximasAVencer : Real;
begin
  dbChartGrafico.Title.Text.Text := sdqConsulta.FieldByName('Coordinador').AsString;

  porFueraTermino := (sdqConsulta.FieldByName('Fuera de Término').AsFloat*100)/sdqConsulta.FieldByName('Total Tareas').AsFloat;
  porNoRealizados := (sdqConsulta.FieldByName('No Realizadas Vencidas').AsFloat*100)/sdqConsulta.FieldByName('Total Tareas').AsFloat;
  porProximasAVencer := (sdqConsulta.FieldByName('Próximas a Vencer').AsFloat*100)/sdqConsulta.FieldByName('Total Tareas').AsFloat;
  sSql :=
    ' SELECT ''No Realizadas Vencidas'' || chr(13) descripcion, '+SqlNumber(porNoRealizados)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''En Término'' || chr(13) descripcion, '+SqlNumber(sdqConsulta.FieldByName('Porcentaje Verificación').AsFloat)+   ' AS cantidad FROM DUAL' +
    ' UNION ALL '+
    ' SELECT ''Fuera de Término'' || chr(13) descripcion, '+SqlNumber(porFueraTermino)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Próximas a Vencer'' || chr(13) descripcion, '+SqlNumber(porProximasAVencer)+   ' AS cantidad FROM DUAL';
  CargarGrafico(sSql);
end;

procedure TfrmEstadisticasIndicadores.sdqSTAT2AfterScroll(
  DataSet: TDataSet);
var
  sSql : String;
  porFueraTermino, porNoRealizados, porProximasAVencer: Real;
begin
  dbChartGrafico.Title.Text.Text := 'Total';

  porFueraTermino := (sdqConsulta.FieldByName('Fuera de Término').AsFloat*100)/sdqConsulta.FieldByName('Total Tareas').AsFloat;
  porNoRealizados := (sdqConsulta.FieldByName('No Realizadas Vencidas').AsFloat*100)/sdqConsulta.FieldByName('Total Tareas').AsFloat;
  porProximasAVencer := (sdqConsulta.FieldByName('Próximas a Vencer').AsFloat*100)/sdqConsulta.FieldByName('Total Tareas').AsFloat;
  sSql :=
    ' SELECT ''No Realizadas Vencidas'' || chr(13) descripcion, '+SqlNumber(porNoRealizados)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''En Término'' || chr(13) descripcion, '+SqlNumber(sdqConsulta.FieldByName('Porcentaje Verificación').AsFloat)+   ' AS cantidad FROM DUAL' +
    ' UNION ALL '+
    ' SELECT ''Fuera de Término'' || chr(13) descripcion, '+SqlNumber(porFueraTermino)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Próximas a Vencer'' || chr(13) descripcion, '+SqlNumber(porProximasAVencer)+   ' AS cantidad FROM DUAL';
  CargarGrafico(sSql);
end;

procedure TfrmEstadisticasIndicadores.sdqSTAT3AfterScroll(
  DataSet: TDataSet);
var
  sSql : String;
  por3Dias, porMenor5Dias, porMayor5Dias : Real;
begin
  dbChartGrafico.Title.Text.Text := sdqConsulta.FieldByName('Preventor').AsString;
  por3Dias := (sdqConsulta.FieldByName('Menor 3 Días').AsFloat*100)/sdqConsulta.FieldByName('Total').AsFloat;
  porMenor5Dias := (sdqConsulta.FieldByName('Menor 5 Días').AsFloat*100)/sdqConsulta.FieldByName('Total').AsFloat;
  porMayor5Dias := (sdqConsulta.FieldByName('Mayor 5 Días').AsFloat*100)/sdqConsulta.FieldByName('Total').AsFloat;
  sSql :=
    ' SELECT ''Mayor 5 Días'' || chr(13) descripcion, '+SqlNumber(porMayor5Dias)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Menor 3 Días'' || chr(13) descripcion, '+SqlNumber(por3Dias)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Menor 5 Días'' || chr(13) descripcion, '+SqlNumber(porMenor5Dias)+   ' AS cantidad FROM DUAL';
  CargarGrafico(sSql);
end;

procedure TfrmEstadisticasIndicadores.sdqSTAT4AfterScroll(
  DataSet: TDataSet);
var
  sSql : String;
begin
  dbChartGrafico.Title.Text.Text := sdqConsulta.FieldByName('Preventor').AsString;
  sSql :=
    ' SELECT ''Porcentaje Incumplimiento'' || chr(13) descripcion, '+SqlNumber(100-sdqConsulta.FieldByName('Porcentaje Cumplimiento').AsFloat)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Porcentaje Cumplimiento'' || chr(13) descripcion, '+SqlNumber(sdqConsulta.FieldByName('Porcentaje Cumplimiento').AsFloat)+   ' AS cantidad FROM DUAL';
  CargarGrafico(sSql);
end;

procedure TfrmEstadisticasIndicadores.sdqSTAT5AfterScroll(
  DataSet: TDataSet);
var
  sSql : String;
begin
  dbChartGrafico.Title.Text.Text := sdqConsulta.FieldByName('Preventor').AsString;
  sSql :=
    ' SELECT ''Prioritarias'' || chr(13)'+
    ' descripcion, 1 as ejeX,'+SqlNumber(sdqConsulta.FieldByName('Porc. Prioritarias').AsFloat)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Compensatorias'' || chr(13)'+
    ' descripcion, 2 as ejeX,'+SqlNumber(sdqConsulta.FieldByName('Porc. Compensatorias').AsFloat)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''No Programada'' || chr(13)'+
    ' descripcion, 3 as ejeX,'+SqlNumber(sdqConsulta.FieldByName('Porc. No Programadas').AsFloat)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Compensatoria Manual'' || chr(13)'+
    ' descripcion, 4 as ejeX,'+SqlNumber(sdqConsulta.FieldByName('Porc. Compensatorias Manual').AsFloat)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Más de 13 Meses'' || chr(13)'+
    ' descripcion, 5 as ejeX,'+SqlNumber(sdqConsulta.FieldByName('Porc. más de 13 Meses').AsFloat)+   ' AS cantidad FROM DUAL';
(*
    ' UNION ALL '+
    ' SELECT ''Prioridad 6'' || chr(13)'+
    ' descripcion, 6 as ejeX,'+SqlNumber(sdqConsulta.FieldByName('Porcentaje Prioridad 6').AsFloat)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Prioridad 7'' || chr(13)'+
    ' descripcion, 7 as ejeX,'+SqlNumber(sdqConsulta.FieldByName('Porcentaje Prioridad 7').AsFloat)+   ' AS cantidad FROM DUAL';
*)

  CargarGraficoBarra(sSql);
end;

procedure TfrmEstadisticasIndicadores.sdqSTAT6AfterScroll(
  DataSet: TDataSet);
var
  sSql : String;
begin
  dbChartGrafico.Title.Text.Text := sdqConsulta.FieldByName('Preventor').AsString + ' - ' + sdqConsulta.FieldByName('Medición').AsString + ' ('  + sdqConsulta.FieldByName('Tipo Medición').AsString + ')';

  sSql :=
    ' SELECT   ''Incumplidas'' || chr(13) AS descripcion, '+
    SqlNumber(100-sdqConsulta.FieldByName('Grado Cumplimiento').AsFloat)+' AS cantidad '+
    '     FROM DUAL ' +
    ' UNION ALL '+
    ' SELECT   ''Cumplidas'' || chr(13) AS descripcion, '+
    SqlNumber(sdqConsulta.FieldByName('Grado Cumplimiento').AsFloat)+' AS cantidad '+
    '     FROM DUAL ';
  CargarGrafico(sSql);
end;

procedure TfrmEstadisticasIndicadores.sdqSTAT7AfterScroll(
  DataSet: TDataSet);
var
  sSql : String;
  por3Dias, porMenor5Dias, porMayor5Dias : Real;
begin
  dbChartGrafico.Title.Text.Text := sdqConsulta.FieldByName('Preventor').AsString + ' - ' + sdqConsulta.FieldByName('Tipo Medición').AsString;
  por3Dias := (sdqConsulta.FieldByName('Menor 3 Días').AsFloat*100)/sdqConsulta.FieldByName('Total').AsFloat;
  porMenor5Dias := (sdqConsulta.FieldByName('Menor 5 Días').AsFloat*100)/sdqConsulta.FieldByName('Total').AsFloat;
  porMayor5Dias := (sdqConsulta.FieldByName('Mayor 5 Días').AsFloat*100)/sdqConsulta.FieldByName('Total').AsFloat;
  sSql :=
    ' SELECT ''Mayor 5 Días'' || chr(13) descripcion, '+SqlNumber(porMayor5Dias)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Menor 3 Días'' || chr(13) descripcion, '+SqlNumber(por3Dias)+   ' AS cantidad FROM DUAL'+
    ' UNION ALL '+
    ' SELECT ''Menor 5 Días'' || chr(13) descripcion, '+SqlNumber(porMenor5Dias)+   ' AS cantidad FROM DUAL';
  CargarGrafico(sSql);
end;

procedure TfrmEstadisticasIndicadores.rgTIPOClick(Sender: TObject);
begin
  inherited;

  SortDialog.SortFields.Clear;

  case rgTIPO.ItemIndex of
    0:
    begin
      vclExtra.LockControls([chkSinPreventor,edMes,edMesHasta,cbTercerizado,cbNoTercerizado, fraPreventorFiltro],False);
    end;
    1:
    begin
      vclExtra.LockControls([chkSinPreventor,edMes,edMesHasta,cbTercerizado,cbNoTercerizado, fraPreventorFiltro],False);
    end;
    2:
    begin
      vclExtra.LockControls([edMes,edMesHasta],False);
      vclExtra.LockControls([chkSinPreventor,cbTercerizado,cbNoTercerizado, fraPreventorFiltro],True);
      chkSinPreventor.Checked := False;
      cbTercerizado.Checked := False;
      cbNoTercerizado.Checked := False;
      fraPreventorFiltro.Clear;
    end;
    3:
    begin
      vclExtra.LockControls([chkSinPreventor,cbTercerizado,cbNoTercerizado, fraPreventorFiltro],False);
      chkSinPreventor.Checked := False;
      cbTercerizado.Checked := False;
      cbNoTercerizado.Checked := False;
      fraPreventorFiltro.Clear;
    end;
    4:
    begin
      vclExtra.LockControls([edMes,edMesHasta,chkSinPreventor,cbTercerizado,cbNoTercerizado, fraPreventorFiltro],False);
    end;
    5:
    begin
      vclExtra.LockControls([edMes,edMesHasta,chkSinPreventor,cbTercerizado,cbNoTercerizado, fraPreventorFiltro],False);
    end;
    6:
    begin
      vclExtra.LockControls([edMes,edMesHasta,chkSinPreventor,cbTercerizado,cbNoTercerizado, fraPreventorFiltro],False);
    end;
    7:
    begin
      vclExtra.LockControls([chkSinPreventor,cbTercerizado,cbNoTercerizado, fraPreventorFiltro],False);
      chkSinPreventor.Checked := False;
      cbTercerizado.Checked := False;
      cbNoTercerizado.Checked := False;
      fraPreventorFiltro.Clear;
    end;
  end;
end;

procedure TfrmEstadisticasIndicadores.sdqConsultaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  case rgTIPO.ItemIndex of
     0:
    begin
      TFloatField(sdqConsulta.FieldByName('Porcentaje Verificación')).DisplayFormat := '0.00%;- 0.00%';
      sdqConsulta.FieldByName('ID Preventor').Visible := False;
    end;
    1:
    begin
      TFloatField(sdqConsulta.FieldByName('Porcentaje Verificación')).DisplayFormat := '0.00%;- 0.00%';
      sdqConsulta.FieldByName('ID Coordinador').Visible := False;
    end;
    2:
    begin
      TFloatField(sdqConsulta.FieldByName('Porcentaje Verificación')).DisplayFormat := '0.00%;- 0.00%';
      //sdqConsulta.FieldByName('se_usuario').Visible := False;
    end;
    3:
    begin
      sdqConsulta.FieldByName('it_codigo').Visible := False;
    end;
    4:
    begin
      TFloatField(sdqConsulta.FieldByName('Porcentaje Cumplimiento')).DisplayFormat := '0.00%;- 0.00%';
      sdqConsulta.FieldByName('it_id').Visible := False;
    end;
    5:
    begin
      TFloatField(sdqConsulta.FieldByName('Porc. Prioritarias')).DisplayFormat := '0.00%;- 0.00%';
      TFloatField(sdqConsulta.FieldByName('Porc. Compensatorias')).DisplayFormat := '0.00%;- 0.00%';
      TFloatField(sdqConsulta.FieldByName('Porc. No Programadas')).DisplayFormat := '0.00%;- 0.00%';
      TFloatField(sdqConsulta.FieldByName('Porc. Compensatorias Manual')).DisplayFormat := '0.00%;- 0.00%';
      TFloatField(sdqConsulta.FieldByName('Porc. más de 13 Meses')).DisplayFormat := '0.00%;- 0.00%';
//      TFloatField(sdqConsulta.FieldByName('Porcentaje Prioridad 6')).DisplayFormat := '0.00%;- 0.00%';
//      TFloatField(sdqConsulta.FieldByName('Porcentaje Prioridad 7')).DisplayFormat := '0.00%;- 0.00%';
      sdqConsulta.FieldByName('it_id').Visible := False;
    end;
    6:
    begin
      TFloatField(sdqConsulta.FieldByName('Grado Cumplimiento')).DisplayFormat := '0.00%;- 0.00%';
      sdqConsulta.FieldByName('it_id').Visible := False;
    end;
    7:
    begin
      sdqConsulta.FieldByName('it_codigo').Visible := False;
    end;
  end;
end;

procedure TfrmEstadisticasIndicadores.GridDblClick(Sender: TObject);
var
  titleAdd: String;
begin
  inherited;
  titleAdd := '';
  if  rgTIPO.ItemIndex = 6 then
    titleAdd := ' (Incumplidos)';

  with TfrmDetalleIndicadores.Create(nil) do
  try

    Caption := Caption + ' - ' + rgTIPO.Items[rgTIPO.ItemIndex] + titleAdd;
    CargarFiltros(self.fraPreventorFiltro.Value, self.fraCoordinadorFiltro.Value, self.chkSinPreventor.Checked,
                  self.cbNoTercerizado.Checked, self.cbTercerizado.Checked, self.edMes.Text, self.edMesHasta.Text);
    case rgTIPO.ItemIndex of
      0:
      begin
        fraPreventorFiltro.Value := Self.sdqConsulta.FieldByName('ID Preventor').AsInteger;
      end;
      1:
      begin
        fraCoordinadorFiltro.Value := Self.sdqConsulta.FieldByName('ID Coordinador').AsInteger;
      end;
      3, 7:
      begin
        fraPreventorFiltro.Codigo := Self.sdqConsulta.FieldByName('it_codigo').AsString;
      end;
      4,5:
      begin
        fraPreventorFiltro.Value := Self.sdqConsulta.FieldByName('it_id').AsInteger;
      end;
      6:
      begin
        fraPreventorFiltro.Value := Self.sdqConsulta.FieldByName('it_id').AsInteger;
      end;
    end;
    edMes.Tag := 0;
    CargarDatos(rgTIPO.ItemIndex);
    Visible := false;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmEstadisticasIndicadores.dbChartGraficoProcessRecord(
  Sender: TCustomDBChart; DataSet: TDataSet);
begin
  {if DataSet.RecNo = 1 then
    Series1.AddXY( PiePen.Color :=
  else
    Series1.PiePen.Color := clPurple;


  //AddXY(15, 50, '44444', clBlack);}
end;

procedure TfrmEstadisticasIndicadores.tbAyudaClick(Sender: TObject);
begin
  inherited;
  edAyuda.Clear;
  edAyuda.Lines.Add(ValorSql('SELECT AY_VALOR FROM HYS.HAY_AYUDATAREA WHERE AY_ID = '+SqlValue(rgTIPO.ItemIndex +1)));
  btnAceptarAyuda.Visible := False;
  edAyuda.ReadOnly := True;
  fpAyudaIndicadores.ShowModal;
end;

procedure TfrmEstadisticasIndicadores.btnAceptarAyudaClick(
  Sender: TObject);
begin
  inherited;
  BeginTrans(True);
  SaveBlob('SELECT AY_VALOR ' +
           '  FROM HYS.HAY_AYUDATAREA ' +
           ' WHERE AY_ID = ' + SqlValue(rgTIPO.ItemIndex +1),
           ' UPDATE HYS.HAY_AYUDATAREA ' +
           '   SET AY_VALOR = :AY_VALOR ' +
           ' WHERE AY_ID = ' + SqlValue(rgTIPO.ItemIndex +1),
           'AY_VALOR', edAyuda.Lines);
  CommitTrans(True);
  fpAyudaIndicadores.ModalResult := mrOk;
end;

procedure TfrmEstadisticasIndicadores.tbModificarAyudaClick(
  Sender: TObject);
begin
  inherited;
  edAyuda.Clear;
  edAyuda.Lines.Add(ValorSql('SELECT AY_VALOR FROM HYS.HAY_AYUDATAREA WHERE AY_ID = '+SqlValue(rgTIPO.ItemIndex +1)));
  btnAceptarAyuda.Visible := True;
  edAyuda.ReadOnly := False;
  fpAyudaIndicadores.ShowModal;
end;

end.
