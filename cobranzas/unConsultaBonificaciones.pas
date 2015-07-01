unit unConsultaBonificaciones;

interface
             
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  StdCtrls, Mask, ToolEdit, DateComboBox, Menus, RxToolEdit, RxPlacemnt;

type
  TfrmConsultaBonificaciones = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    gbVencimiento: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    pgGrillas: TPageControl;
    tsCapital: TTabSheet;
    tsPlanesPago: TTabSheet;
    GridPlanesPago: TArtDBGrid;
    sdqPlanesPago: TSDQuery;
    dsPlanesPago: TDataSource;
    SortDialogPlanesPago: TSortDialog;
    mnuImprimir: TPopupMenu;
    mnuImprimirReporte: TMenuItem;
    mnuImprimirResultados: TMenuItem;
    gbDirectorio: TGroupBox;
    chkDirectorio: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure sdqPlanesPagoAfterOpen(DataSet: TDataSet);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure pgGrillasChange(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure mnuImprimirReporteClick(Sender: TObject);
  private
    procedure DoSetearGrillaActual;
    function GetMontoAcumulado: Extended;
  public
  protected
    procedure RefreshData; override;
    procedure ClearData; override;
  end;

var
  frmConsultaBonificaciones: TfrmConsultaBonificaciones;

const
  PAGECAPITAL    = 0;    // tsCapital
  PAGEPLANESPAGO = 1;    // tsPlanesPago

implementation

uses
  unDmPrincipal, AnsiSql, unSesion, unArt, CustomDlgs, StrFuncs, unRptBonificacionesCuota,
  unRptPlanesPago;

{$R *.dfm}

procedure TfrmConsultaBonificaciones.ClearData;
begin
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  chkDirectorio.Checked := False;

  sdqConsulta.SQL.Text   := '';
  sdqPlanesPago.SQL.Text := '';
  sdqPlanesPago.Close;

  pgGrillas.ActivePageIndex := PAGECAPITAL;

  DoSetearGrillaActual;

  inherited;
end;

procedure TfrmConsultaBonificaciones.RefreshData;
var
  sConsulta, sSql, sSql2, sWhere: String;
  SortDialogAct: TSortDialog;
  dDescInteres, dDescCuota: Double;
  SqlResults: TStringList;
begin
  DoSetearGrillaActual;
  SortDialogAct := nil;

  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe indicar la fecha desde.');
  Verificar(edFechaHasta.IsEmpty, edFechaHasta, 'Debe indicar la fecha hasta.');

  case pgGrillas.ActivePageIndex of
    PAGECAPITAL:
      begin
        SortDialogAct := SortDialog;

        sSql := 'SELECT FECHA, CONTRATO, CUIT, DENOMINACION, ESTADO, PERIODO, CUOTA_EMITIDA, IMPORTE_BONIFICACION, CUOTA_PROMEDIO_ANUAL, CODREG, ' +
                       'BONIFICACION_ACUMULADA, TRUNC(BONIFICACION_ACUMULADA / CUOTA_PROMEDIO_ANUAL * 100) PORC_BONIFICADO, OBS, AUTORIZADO, AUTORIZA ' +
                  'FROM (SELECT EB_IDEMPRESA EMPRESA_TOT, ' +
                               'SUM(EB_FIJOCUOTA*(ART.UTILES.PERIODOS_CONTARCANTIDAD(EB_PERIODOVIGENCIADESDE, EB_PERIODOVIGENCIAHASTA) + 1)) BONIFICACION_ACUMULADA ' +
                          'FROM EMI.IEB_EMPRESABONIFICACION ' +
                         'WHERE EB_FECHABAJA IS NULL ' +
                           'AND EB_TIPOBONIFICACION = ''F'' ' +
                           'AND EB_FIJOCUOTA > 0 ' +
                           'AND TRUNC(EB_FECHAALTA) BETWEEN TO_DATE(''01/01/'' || TO_CHAR(' + SqlValue(edFechaHasta.Date) + ', ''YYYY''), ''DD/MM/YYYY'') AND ' + SqlValue(edFechaHasta.Date) + ' ' +
                         'GROUP BY EB_IDEMPRESA), ' +
                     '(SELECT EM_ID EMPRESA_DET, RC_CONTRATOPRINCIPAL CONTRATO, EM_CUIT CUIT, EM_NOMBRE DENOMINACION, RC_PERIODO PERIODO, ' +
                             'ART.DISCOVERER.GET_DESCRIPCIONCODIGO(CO_ESTADO, ''AFEST'') ESTADO, TRUNC(EB_FECHAALTA) FECHA, ' +
                             'ART.DEUDA.GET_CUOTAPROMEDIO(RC_CONTRATO, EB_PERIODOVIGENCIAHASTA, ''N'') CUOTA_PROMEDIO_ANUAL, ' +
                             'RC_DEVENGADOCUOTA + (CASE WHEN EB_FECHAAUTORIZA IS NOT NULL THEN EB_FIJOCUOTA ' +
                                                  'ELSE 0 END) CUOTA_EMITIDA, EB_FIJOCUOTA IMPORTE_BONIFICACION, EB_OBSERVACIONES OBS, ' +
                             'DECODE(EB_FECHAAUTORIZA, NULL, ''NO'', ''SI'') AUTORIZADO, RC_CODTIPOREGIMEN CODREG, ' +
                             'SE_NOMBRE || '' ('' || ART.DISCOVERER.GET_DESCRIPCIONCODIGO(SE_CARGO, ''USCAR'') || '')'' AUTORIZA ' +
                        'FROM ART.USE_USUARIOS, EMI.IEB_EMPRESABONIFICACION, AEM_EMPRESA, ACO_CONTRATO_EXT, ZRC_RESUMENCOBRANZA_EXT ' +
                       'WHERE EM_ID = EB_IDEMPRESA ' +
                         'AND EM_ID = CO_IDEMPRESA ' +
                         'AND CO_CONTRATO = RC_CONTRATO ' +
                         'AND EB_USUAUTORIZA = SE_USUARIO ' +
                         'AND RC_PERIODO BETWEEN EB_PERIODOVIGENCIADESDE AND EB_PERIODOVIGENCIAHASTA ' +
                         'AND EB_FECHABAJA IS NULL ' +
                         'AND EB_TIPOBONIFICACION = ''F'' ' +
                         'AND EB_FIJOCUOTA > 0 ' +
                         'AND ART.DEUDA.GET_CUOTAPROMEDIO(RC_CONTRATO, EB_PERIODOVIGENCIAHASTA, ''N'') > 0 ' +
                         'AND EB_IDTIPOREGIMEN = CO_IDTIPOREGIMEN_ORIG) ' +
                 'WHERE EMPRESA_DET = EMPRESA_TOT';

        sWhere := SqlBetweenDateTime(' AND FECHA', edFechaDesde.Date, edFechaHasta.Date);

        if chkDirectorio.Checked then
          sWhere := sWhere + ' AND BONIFICACION_ACUMULADA > ' + SqlNumber(GetMontoAcumulado());
      end;

    PAGEPLANESPAGO:
      begin
        SortDialogAct := SortDialogPlanesPago;

        sSql := 'SELECT CO_CONTRATO CONTRATO, EM_CUIT CUIT, EM_NOMBRE DENOMINACION, PP_ID PLAN_PAGO, PP_FECHAAPROBADO FECHA_APROBADO, ' +
                       'ART.DISCOVERER.GET_DESCRIPCIONCODIGO(CO_ESTADO, ''AFEST'') ESTADO, AP_MONTODEUDA DEUDA_CUOTA_NOMINAL, INT_MORA, INT_FIN, ' +
                       'INT_MORA * (AP_QUITAINTMORAFINANC + AP_QUITAINTMORACONT) / 100 DESC_INT_MORA, AP_QUITAINTFINANC DESC_INT_FIN, ' +
                       'PP_OBSERVACIONES OBS, CUOTAS, CODREG, ' +
                       'SE_NOMBRE || '' ('' || ART.DISCOVERER.GET_DESCRIPCIONCODIGO(SE_CARGO, ''USCAR'') || '')'' AUTORIZA ' +
                  'FROM (SELECT PD_IDPLANPAGO, PD_CODTIPOREGIMEN CODREG, SUM(PD_INTERESMORA) INT_MORA ' +
                          'FROM ZPD_PLANDEUDA ' +
                         'GROUP BY PD_IDPLANPAGO, PD_CODTIPOREGIMEN), ' +
                       '(SELECT PC_IDPLANPAGO, SUM(PC_INTERESFINANC) INT_FIN, COUNT(*) - 1 CUOTAS ' +
                          'FROM ZPC_PLANCUOTA ' +
                         'GROUP BY PC_IDPLANPAGO), ' +
                       'ART.USE_USUARIOS, ZAP_AUTORIZACIONPLAN, ZPP_PLANPAGO, ACO_CONTRATO, AEM_EMPRESA ' +
                 'WHERE PP_ID = AP_IDPLAN ' +
                   'AND PP_ID = PD_IDPLANPAGO ' +
                   'AND PP_ID = PC_IDPLANPAGO ' +
                   'AND EM_ID = CO_IDEMPRESA ' +
                   'AND CO_CONTRATO = PP_CONTRATO ' +
                   'AND PP_USUAPROBADO = SE_USUARIO';

        sWhere := SqlBetweenDateTime(' AND PP_FECHAAPROBADO', edFechaDesde.Date, edFechaHasta.Date);

        if chkDirectorio.Checked then
          begin
            sSql2 := 'SELECT NVL(CC_MONTODEUDA, 0) DESC_CUOTA, NVL(CC_MONTOINTERES, 0) DESC_INTERES ' +
                       'FROM ZCC_CONTROLCOBRANZA ' +
                      'WHERE CC_FECHABAJA IS NULL ' +
                        'AND CC_IDNIVELAUTORIZA = (SELECT MAX(NA_ID) ' +
                                                    'FROM ZNA_NIVELAUTORIZACION)';

            SqlResults := ValoresColSql(sSql2);
            try
              dDescCuota   := StrToFloat(SqlResults[0]);
              dDescInteres := StrToFloat(SqlResults[1]);
            finally
              SqlResults.Free;
            end;

            sWhere := sWhere + ' AND (AP_MONTODEUDA >= ' + SqlNumber(dDescCuota) + ' OR (INT_MORA * (AP_QUITAINTMORAFINANC + AP_QUITAINTMORACONT) / 100) >= ' + SqlNumber(dDescInteres) + ')';
          end;
      end;
  end;

  sConsulta := sSql + sWhere + SortDialogAct.OrderBy;
  if Trim(sConsulta) <> Trim(ReplaceEnter(TSDQuery(DataSource.Dataset).Sql.Text)) then
    begin
      TSDQuery(DataSource.Dataset).Sql.Text := sConsulta;
      inherited;
    end;
end;

procedure TfrmConsultaBonificaciones.FormCreate(Sender: TObject);
begin
  Grid.Parent          := tsCapital;
  pgGrillas.ActivePage := tsCapital;

  SortDialog.UseFieldIndex           := False;
  SortDialogPlanesPago.UseFieldIndex := False;

  SortDialogPlanesPago.DataSet := sdqPlanesPago;

  inherited;

  unArt.LoadDynamicSortFields(SortDialog.SortFields, Grid.Columns);
  unArt.LoadDynamicSortFields(SortDialogPlanesPago.SortFields, GridPlanesPago.Columns);
end;


procedure TfrmConsultaBonificaciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('CUOTA_EMITIDA') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('CUOTA_EMITIDA')).Currency := True;

  if sdqConsulta.FieldByName('IMPORTE_BONIFICACION') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('IMPORTE_BONIFICACION')).Currency := True;

  if sdqConsulta.FieldByName('CUOTA_PROMEDIO_ANUAL') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('CUOTA_PROMEDIO_ANUAL')).Currency := True;

  if sdqConsulta.FieldByName('BONIFICACION_ACUMULADA') is TFloatField then
    TFloatField( sdqConsulta.FieldByName('BONIFICACION_ACUMULADA')).Currency := True;

  if sdqConsulta.FieldByName('PORC_BONIFICADO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('PORC_BONIFICADO')).DisplayFormat := '% 0;-% 0';

  inherited;
end;

procedure TfrmConsultaBonificaciones.sdqPlanesPagoAfterOpen(DataSet: TDataSet);
begin
  if sdqPlanesPago.FieldByName('DEUDA_CUOTA_NOMINAL') is TFloatField then
    TFloatField( sdqPlanesPago.FieldByName('DEUDA_CUOTA_NOMINAL')).Currency := True;

  if sdqPlanesPago.FieldByName('INT_MORA') is TFloatField then
    TFloatField( sdqPlanesPago.FieldByName('INT_MORA')).Currency := True;

  if sdqPlanesPago.FieldByName('INT_FIN') is TFloatField then
    TFloatField( sdqPlanesPago.FieldByName('INT_FIN')).Currency := True;

  if sdqPlanesPago.FieldByName('DESC_INT_MORA') is TFloatField then
    TFloatField( sdqPlanesPago.FieldByName('DESC_INT_MORA')).Currency := True;

  if sdqPlanesPago.FieldByName('DESC_INT_FIN') is TFloatField then
    TFloatField(sdqPlanesPago.FieldByName('DESC_INT_FIN')).DisplayFormat := '% 0.00;-% 0.00';

  inherited;
end;

procedure TfrmConsultaBonificaciones.tbOrdenarClick(Sender: TObject);
begin
  case pgGrillas.ActivePageIndex of
    PAGECAPITAL:
      SortDialog.Execute;

    PAGEPLANESPAGO:
      SortDialogPlanesPago.Execute;
  end;

  RefreshData;
end;

procedure TfrmConsultaBonificaciones.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmConsultaBonificaciones.DoSetearGrillaActual;
begin
  case pgGrillas.ActivePageIndex of
    PAGECAPITAL:
      begin
        DBGrid     := Grid;
        DataSource := dsConsulta;

        if Assigned(sdqConsulta.AfterOpen) then
          sdqConsulta.AfterOpen := sdqConsultaAfterOpen;
      end;

    PAGEPLANESPAGO:
      begin
        DBGrid     := GridPlanesPago;
        DataSource := dsPlanesPago;
      end;
  end;
end;

procedure TfrmConsultaBonificaciones.pgGrillasChange(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmConsultaBonificaciones.mnuImprimirResultadosClick(Sender: TObject);
var
  sTitulo: String;
begin
  case pgGrillas.ActivePageIndex of
    PAGECAPITAL:
      sTitulo := 'Capital';

    PAGEPLANESPAGO:
      sTitulo := 'Planes de Pago';
  end;

  DBPrint.Title.Text := sTitulo;
  PrintResults;
end;

procedure TfrmConsultaBonificaciones.mnuImprimirReporteClick(Sender: TObject);
begin
  case pgGrillas.ActivePageIndex of
    PAGECAPITAL:
      Do_ImprimirBonificacionesCuota(edFechaDesde.Date, edFechaHasta.Date, GetMontoAcumulado());

    PAGEPLANESPAGO:
      Do_ImprimirPlanesPago(edFechaDesde.Date, edFechaHasta.Date, sdqPlanesPago.SQL.Text);
  end;
end;

function TfrmConsultaBonificaciones.GetMontoAcumulado: Extended;
var
  sSql: String;
begin
  sSql := 'SELECT CB_MONTOHASTA ' +
            'FROM ZCB_CONTROLBONIFICACION ' +
           'WHERE CB_FECHABAJA IS NULL ' +
             'AND CB_IDNIVELAUTORIZA = (SELECT MAX(NA_ID) ' +
                                         'FROM ZNA_NIVELAUTORIZACION)';
  Result := ValorSqlExtended(sSql);
end;

end.

