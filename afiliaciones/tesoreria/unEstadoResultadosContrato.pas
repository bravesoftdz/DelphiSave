unit unEstadoResultadosContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Menus, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  PeriodoPicker, unArtDbFrame, unFraEmpresa, Mask, ToolEdit, CurrEdit;

type
  TfrmEstadoResultadosContrato = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbSumatoria: TToolButton;
    mnuImprimir: TPopupMenu;
    mnuImprimirResultados: TMenuItem;
    mnuImprimirReporte: TMenuItem;
    gbSector: TGroupBox;
    fraEM_SECTOR: TfraStaticCTB_TABLAS;
    gbPeriodos: TGroupBox;
    Label19: TLabel;
    Label18: TLabel;
    edRC_PERIODODesde: TPeriodoPicker;
    edRC_PERIODOHasta: TPeriodoPicker;
    gbEstado: TGroupBox;
    fraCO_ESTADO: TfraStaticCTB_TABLAS;
    gbEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    Label1: TLabel;
    edRI_PERIODO: TPeriodoPicker;
    Label2: TLabel;
    edRI_PRIMA: TCurrencyEdit;
    Label3: TLabel;
    edRI_RVARDONEG: TCurrencyEdit;
    Label4: TLabel;
    edRI_RVADESVSIN: TCurrencyEdit;
    Label5: TLabel;
    edRI_SINPAGADOS: TCurrencyEdit;
    Label6: TLabel;
    edRI_SPL: TCurrencyEdit;
    Label7: TLabel;
    edRI_IBNER: TCurrencyEdit;
    Label8: TLabel;
    edRI_IBNR: TCurrencyEdit;
    Label9: TLabel;
    edRI_PROVSINNOREP: TCurrencyEdit;
    Label10: TLabel;
    edRI_RVAEVCATASTR: TCurrencyEdit;
    Label11: TLabel;
    edRI_GSPROD: TCurrencyEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edRI_SUELDOS: TCurrencyEdit;
    edRI_HONDIR: TCurrencyEdit;
    edRI_HONPROF: TCurrencyEdit;
    edRI_PUBLICIDAD: TCurrencyEdit;
    edRI_ITC: TCurrencyEdit;
    edRI_OTROSGSEXPL: TCurrencyEdit;
    edRI_RECGSGPBA: TCurrencyEdit;
    edRI_OTROSINGRESOS: TCurrencyEdit;
    edRI_HYS: TCurrencyEdit;
    edRI_OTROSEGRESOS: TCurrencyEdit;
    procedure tbRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbLimpiarClick(Sender: TObject);
    procedure mnuImprimirReporteClick(Sender: TObject);
  private
    procedure CalcTotales;
    function GetSqlFiltro: String;
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
  end;

const
  MAXCOLS = 38;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = (
              'PRIMA_DIRECTA', 'PRIMA_DIRECTA_REASEGURO', 'SINIESTROS_PAGADOS', 'REASEGURO_SINIESTROS_PAGADOS', 'RESERVA_ILT', 'REASEGURO_RESERVA_ILT', 'RES_PRESTACIONES_EN_ESPECIE', 'REASEGURO_RES_PRESTAC_ESPECIE', 'SINIESTROS_PROCESO_LIQUIDACION',
              'REASEGURO_SIN_PROCESO_LIQUIDAC', 'IBNER', 'REASEGURO_IBNER', 'IBNR', 'REASEGURO_IBNR', 'GASTOS_PRODUCCION_DIRECTOS', 'PRIMAS_INDIRECTAS', 'RESERVA_POR_RESULTADO_NEGATIVO', 'RESERVA_DESV_SINIESTROS', 'SINIESTROS_PAGADOS_INDIRECTOS',
              'SIN_PROCESO_LIQUIDAC_INDIRECT', 'IBNER_INDIRECTOS', 'IBNR_INDIRECTOS', 'PROVIS_SIN_NO_SUFIC_REPORTADOS', 'RESERVA_EVENTOS_CATASTROFICOS', 'GASTOS_PRODUCCION_INDIRECTOS', 'SUELDOS_Y_CARGAS_SOCIALES', 'HONORARIOS_DIRECTORES_SINDICOS',
              'HONORARIOS_PROFESIONALES', 'PUBLICIDAD_Y_PROPAGANDA', 'IMPUESTOS_TASAS_CONTRIBUCIONES', 'OTROS_GASTOS_EXPLOTACION', 'RECUPERO_GASTOS_GPBA', 'OTROS_INGRESOS', 'HYS_Y_PREVENCION', 'OTROS_EGRESOS', 'AMORTIZACION', 'RECUPERO', 'INTERESES_COBRADOS',
              'PREVIS_INCOBR_DEUDORES_PREMIO');

var
  frmEstadoResultadosContrato: TfrmEstadoResultadosContrato;
  TotalConsulta: Array of Extended;

implementation

uses
  DbFuncs, CustomDlgs, General, Strfuncs, AnsiSql, SqlFuncs, unSesion, unDmPrincipal,
  unArt, unEspera, unRptEstadoResultados, Periodo;

{$R *.dfm}

procedure TfrmEstadoResultadosContrato.tbRefrescarClick(Sender: TObject);
var
  sWhere, sSql, sGroupBy: String;
begin
  sSql := 'SELECT RC_CONTRATO CONTRATO, ' +
                 'RC_PERIODO PERIODO, ' +
                 'SECT.TB_DESCRIPCION SECTOR, ' +
                 'EST.TB_DESCRIPCION ESTADO, ' +
                 'SUM(RC_DIR_PRIMA) PRIMA_DIRECTA, ' +
                 'SUM(RC_DIR_PRIMA_RE) PRIMA_DIRECTA_REASEGURO, ' +
                 'SUM(RC_DIR_SINPAGADOS) SINIESTROS_PAGADOS, ' +
                 'SUM(RC_DIR_SINPAGADOS_RE) REASEGURO_SINIESTROS_PAGADOS, ' +
                 'SUM(RC_DIR_RVAILT) RESERVA_ILT, ' +
                 'SUM(RC_DIR_RVAILT_RE) REASEGURO_RESERVA_ILT, ' +
                 'SUM(RC_DIR_RVAPESP) RES_PRESTACIONES_EN_ESPECIE, ' +
                 'SUM(RC_DIR_RVAPESP_RE) REASEGURO_RES_PRESTAC_ESPECIE, ' +
                 'SUM(RC_DIR_SPL) SINIESTROS_PROCESO_LIQUIDACION, ' +
                 'SUM(RC_DIR_SPL_RE) REASEGURO_SIN_PROCESO_LIQUIDAC, ' +
                 'SUM(RC_DIR_IBNER) IBNER, ' +
                 'SUM(RC_DIR_IBNER_RE) REASEGURO_IBNER, ' +
                 'SUM(RC_DIR_IBNR) IBNR, ' +
                 'SUM(RC_DIR_IBNR_RE) REASEGURO_IBNR, ' +
                 'SUM(RC_DIR_GSPROD) GASTOS_PRODUCCION_DIRECTOS, ' +
                 'SUM(RC_IND_PRIMA) PRIMAS_INDIRECTAS, ' +
                 'SUM(RC_IND_RVARDONEG) RESERVA_POR_RESULTADO_NEGATIVO, ' +
                 'SUM(RC_IND_RVADESVSIN) RESERVA_DESV_SINIESTROS, ' +
                 'SUM(RC_IND_SINPAGADOS) SINIESTROS_PAGADOS_INDIRECTOS, ' +
                 'SUM(RC_IND_SPL) SIN_PROCESO_LIQUIDAC_INDIRECT, ' +
                 'SUM(RC_IND_IBNER) IBNER_INDIRECTOS, ' +
                 'SUM(RC_IND_IBNR) IBNR_INDIRECTOS, ' +
                 'SUM(RC_IND_PROVSINNOREP) PROVIS_SIN_NO_SUFIC_REPORTADOS, ' +
                 'SUM(RC_IND_RVAEVCATASTR) RESERVA_EVENTOS_CATASTROFICOS, ' +
                 'SUM(RC_IND_GSPROD) GASTOS_PRODUCCION_INDIRECTOS, ' +
                 'SUM(RC_IND_SUELDOS) SUELDOS_Y_CARGAS_SOCIALES, ' +
                 'SUM(RC_IND_HONDIR) HONORARIOS_DIRECTORES_SINDICOS, ' +
                 'SUM(RC_IND_HONPROF) HONORARIOS_PROFESIONALES, ' +
                 'SUM(RC_IND_PUBLICIDAD) PUBLICIDAD_Y_PROPAGANDA, ' +
                 'SUM(RC_IND_ITC) IMPUESTOS_TASAS_CONTRIBUCIONES, ' +
                 'SUM(RC_IND_OTROSGSEXPL) OTROS_GASTOS_EXPLOTACION, ' +
                 'SUM(RC_IND_RECGSGPBA) RECUPERO_GASTOS_GPBA, ' +
                 'SUM(RC_IND_OTROSINGRESOS) OTROS_INGRESOS, ' +
                 'SUM(RC_IND_HYS) HYS_Y_PREVENCION, ' +
                 'SUM(RC_IND_OTROSEGRESOS) OTROS_EGRESOS, ' +
                 'SUM(RC_AMORTIZACION) AMORTIZACION, ' +
                 'SUM(RC_RECUPERO) RECUPERO, ' +
                 'SUM(RC_INTSCOBRADOS) INTERESES_COBRADOS, ' +
                 'SUM(RC_PREVINCOBR) PREVIS_INCOBR_DEUDORES_PREMIO ' +
            'FROM CTB_TABLAS EST, CTB_TABLAS SECT, AEM_EMPRESA, ACO_CONTRATO, ORC_RESULTADOCONTRATO ' +
           'WHERE RC_CONTRATO = CO_CONTRATO ' +
             'AND EM_ID = CO_IDEMPRESA ' +
             'AND CO_ESTADO = EST.TB_CODIGO ' +
             'AND EST.TB_CLAVE = ''AFEST'' ' +
             'AND EM_SECTOR = SECT.TB_CODIGO ' +
             'AND SECT.TB_CLAVE = ''SECT'' ';

  sGroupBy := 'GROUP BY RC_CONTRATO, RC_PERIODO, SECT.TB_DESCRIPCION, EST.TB_DESCRIPCION';

  sWhere := GetSqlFiltro();

  sdqConsulta.SQL.Text := sSql + sWhere + sGroupBy + SortDialog.OrderBy;

  inherited;
  CalcTotales;
end;

procedure TfrmEstadoResultadosContrato.FormCreate(Sender: TObject);
begin
  inherited;

  fraEmpresa.ShowBajas := True;
  
  with fraEM_SECTOR do
    begin
      Clave     := 'SECT';
      ShowBajas := True;
    end;

  with fraCO_ESTADO do
    begin
      Clave     := 'AFEST';
      ShowBajas := True;
    end;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmEstadoResultadosContrato.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;

procedure TfrmEstadoResultadosContrato.CalcTotales;
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
        ErrorMsg(E, 'Error al Calcular los Subtotales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmEstadoResultadosContrato.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmEstadoResultadosContrato.mnuImprimirResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick( nil );
end;

procedure TfrmEstadoResultadosContrato.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmEstadoResultadosContrato.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  i: Integer;
begin
  inherited;

  for i := 0  to MAXCOLS do
    TFloatField(sdqConsulta.FieldByName(CAMPOS_SUMA[i])).Currency := True;
end;

procedure TfrmEstadoResultadosContrato.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresa.Clear;
  fraEM_SECTOR.Clear;
  fraCO_ESTADO.Clear;
  edRC_PERIODODesde.Clear;
  edRC_PERIODOHasta.Clear;
end;

function TfrmEstadoResultadosContrato.DoABM: Boolean;
var
  sSql: String;
begin
  Begintrans;
  try
    with Sql do
      begin
        Clear;

        TableName := 'ORI_RUBROINDIRECTO';

        PrimaryKey.Add('RI_ID',         GetSecNextVal('SEQ_ORI_ID'));
        Fields.Add('RI_PERIODO',        edRI_PERIODO.Periodo.Valor);

        Fields.Add('RI_PRIMA',          edRI_PRIMA.Value, dtNumber);
        Fields.Add('RI_RVARDONEG',      edRI_RVARDONEG.Value, dtNumber);
        Fields.Add('RI_RVADESVSIN',     edRI_RVADESVSIN.Value, dtNumber);
        Fields.Add('RI_SINPAGADOS',     edRI_SINPAGADOS.Value, dtNumber);
        Fields.Add('RI_SPL',            edRI_SPL.Value, dtNumber);
        Fields.Add('RI_IBNER',          edRI_IBNER.Value, dtNumber);
        Fields.Add('RI_IBNR',           edRI_IBNR.Value, dtNumber);
        Fields.Add('RI_PROVSINNOREP',   edRI_PROVSINNOREP.Value, dtNumber);
        Fields.Add('RI_RVAEVCATASTR',   edRI_RVAEVCATASTR.Value, dtNumber);
        Fields.Add('RI_GSPROD',         edRI_GSPROD.Value, dtNumber);
        Fields.Add('RI_SUELDOS',        edRI_SUELDOS.Value, dtNumber);
        Fields.Add('RI_HONDIR',         edRI_HONDIR.Value, dtNumber);
        Fields.Add('RI_HONPROF',        edRI_HONPROF.Value, dtNumber);
        Fields.Add('RI_PUBLICIDAD',     edRI_PUBLICIDAD.Value, dtNumber);
        Fields.Add('RI_ITC',            edRI_ITC.Value, dtNumber);
        Fields.Add('RI_OTROSGSEXPL',    edRI_OTROSGSEXPL.Value, dtNumber);
        Fields.Add('RI_RECGSGPBA',      edRI_RECGSGPBA.Value, dtNumber);
        Fields.Add('RI_OTROSINGRESOS',  edRI_OTROSINGRESOS.Value, dtNumber);
        Fields.Add('RI_HYS',            edRI_HYS.Value, dtNumber);
        Fields.Add('RI_OTROSEGRESOS',   edRI_OTROSEGRESOS.Value, dtNumber);

        Fields.Add('RI_FECHAALTA', exDateTime);
        Fields.Add('RI_USUALTA',   Sesion.UserID);

        SqlType := stInsert;
      end;

    Result := inherited DoABM;

    if Result then
      begin
        IniciarEspera('Generando Estado de Resultados por Contrato...');
        try
          sSql := 'CONT.DO_ESTADORESULTADOCONTRATO(:Periodo);';
          EjecutarStoreSTEx(sSql, [edRI_PERIODO.Periodo.Valor]);
        finally
          DetenerEspera;
        end;
      end;

    CommitTrans;
  except
    on E: Exception do
      begin
        RollBack;
        raise Exception.Create(E.Message + CRLF + 'Error al insertar el periodo.');
      end;
  end;
end;

function TfrmEstadoResultadosContrato.Validar: Boolean;
var
  sSql: String;
begin
  Verificar(edRI_PERIODO.Periodo.Valor = '', edRI_PERIODO, 'El período es obligatorio.');

  Verificar(edRI_PERIODO.Periodo.Valor > GetPeriodo(DBDate(), fpAnioMes), edRI_PERIODO, 'El período no puede ser superior al mes actual.');
  Verificar(edRI_PERIODO.Periodo.Valor < GetPeriodo(ART_MINFECHA, fpAnioMes), edRI_PERIODO, 'El período no puede ser inferior al mes de inicio de la ART.');

  sSql := 'SELECT 1 ' +
            'FROM ORI_RUBROINDIRECTO ' +
           'WHERE RI_PERIODO = :Periodo';
  Verificar(ExisteSqlEx(sSql, [edRI_PERIODO.Periodo.Valor]), edRI_PERIODO, 'El período seleccionado ya fue generado.');

  Result := True;
end;

procedure TfrmEstadoResultadosContrato.ClearControls;
begin
  inherited;
end;

procedure TfrmEstadoResultadosContrato.mnuImprimirReporteClick(Sender: TObject);
begin
  DoImprimirEstadoResultados(GetSqlFiltro());
end;

function TfrmEstadoResultadosContrato.GetSqlFiltro: String;
var
  sWhere: String;
begin
  sWhere := SqlBetween(' AND RC_PERIODO', edRC_PERIODODesde.Periodo.Valor, edRC_PERIODOHasta.Periodo.Valor);

  if fraEmpresa.IsSelected then
    sWhere := sWhere + ' AND RC_CONTRATO = ' + SqlValue(fraEmpresa.Contrato);

  if fraEM_SECTOR.IsSelected then
    sWhere := sWhere + ' AND EM_SECTOR = ' + SqlValue(fraEM_SECTOR.Codigo);

  if fraCO_ESTADO.IsSelected then
    sWhere := sWhere + ' AND CO_ESTADO = ' + SqlValue(fraCO_ESTADO.Codigo);

  Result := sWhere;  
end;

end.

