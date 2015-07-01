unit unIndicadoresGestionTel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, PatternEdit,
  IntEdit, unArtFrame, unArtDBAwareFrame, unFraStaticCodigoDescripcion,
  unFraCodigoDescripcion, RxToolEdit, RxPlacemnt;

type
  TfrmIndicadoresGestionTel = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    gbFecha: TGroupBox;
    Label4: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    gbNroSeleccion: TGroupBox;
    edNroSeleccion: TIntEdit;
    GroupBox1: TGroupBox;
    fraGestorCuenta: TfraStaticCodigoDescripcion;
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    procedure CalcTotales;
  protected
    procedure RefreshData; override;
  public
  end;

const
  MAXCOLS = 5;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('DEUDA_SELECCION', 'DEUDA_ACTUAL', 'CONTRATOS', 'CONTRATOS_REGULARIZADOS', 'PAGOS_PARCIALES', 'SIN_PAGOS');

var
  frmIndicadoresGestionTel: TfrmIndicadoresGestionTel;
  TotalConsulta: Array of Extended;

implementation

{$R *.dfm}

uses
  Strfuncs, DbFuncs, CustomDlgs, General, AnsiSql, unSesion, unArt, VCLExtra,
  unDmPrincipal;

procedure TfrmIndicadoresGestionTel.CalcTotales;
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

procedure TfrmIndicadoresGestionTel.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT IG_FECHA FECHA, IG_IDSELECCIONPLAN SELECCION, GC_NOMBRE GESTOR, IG_DEUDA DEUDA_SELECCION, IG_DEUDAACTUAL DEUDA_ACTUAL, ' +
                 'ROUND((1-IG_DEUDAACTUAL/IG_DEUDA)*100, 2) PORC_DEUDA_REGULARIZADA, IG_CONTRATOS CONTRATOS, ' +
                 'IG_REGULARIZADOS CONTRATOS_REGULARIZADOS, IG_PAGOSPARCIALES PAGOS_PARCIALES, IG_SINPAGOS SIN_PAGOS, ' +
                 'ROUND((IG_REGULARIZADOS/IG_CONTRATOS)*100, 2) PORC_REGULARIZADOS, ' +
                 'ROUND((IG_PAGOSPARCIALES/IG_CONTRATOS)*100, 2) PORC_PAGOS_PARCIALES, ' +
                 'ROUND((IG_SINPAGOS/IG_CONTRATOS)*100, 2) PORC_SIN_PAGOS, IG_IDGESTOR IDGESTOR ' +
            'FROM AGC_GESTORCUENTA, V_ZIG_INDICADORGESTION_TMP ' +
           'WHERE GC_ID = IG_IDGESTOR ' +
           'UNION ALL ' +
          'SELECT IG_FECHA FECHA, IG_IDSELECCIONPLAN SELECCION, GC_NOMBRE GESTOR, IG_DEUDA DEUDA_SELECCION, IG_DEUDAACTUAL DEUDA_ACTUAL, ' +
                 'ROUND((1-IG_DEUDAACTUAL/IG_DEUDA)*100, 2) PORC_DEUDA_REGULARIZADA, IG_CONTRATOS CONTRATOS, ' +
                 'IG_REGULARIZADOS CONTRATOS_REGULARIZADOS, IG_PAGOSPARCIALES PAGOS_PARCIALES, IG_SINPAGOS SIN_PAGOS, ' +
                 'ROUND((IG_REGULARIZADOS/IG_CONTRATOS)*100, 2) PORC_REGULARIZADOS, ' +
                 'ROUND((IG_PAGOSPARCIALES/IG_CONTRATOS)*100, 2) PORC_PAGOS_PARCIALES, ' +
                 'ROUND((IG_SINPAGOS/IG_CONTRATOS)*100, 2) PORC_SIN_PAGOS, IG_IDGESTOR IDGESTOR ' +
            'FROM AGC_GESTORCUENTA, ZIG_INDICADORGESTION ' +
           'WHERE GC_ID = IG_IDGESTOR ';

  sSql := 'SELECT * FROM (' + sSql + ') WHERE 1 = 1 ';

  sWhere := SqlBetweenDateTime(' AND FECHA', edFechaDesde.Date, edFechaHasta.Date);

  if edNroSeleccion.Value > 0 then
    sWhere := sWhere + ' AND SELECCION = ' + SqlValue(edNroSeleccion.Value);

  if fraGestorCuenta.IsSelected then
    sWhere := sWhere + ' AND IDGESTOR = ' + SqlValue(fraGestorCuenta.Value);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  CalcTotales;
end;

procedure TfrmIndicadoresGestionTel.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('DEUDA_SELECCION') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDA_SELECCION')).Currency := True;

  if sdqConsulta.FieldByName('DEUDA_ACTUAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEUDA_ACTUAL')).Currency := True;

  if sdqConsulta.FieldByName( 'PORC_DEUDA_REGULARIZADA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PORC_DEUDA_REGULARIZADA' ) ).DisplayFormat := '% #,##0.00';

  if sdqConsulta.FieldByName( 'PORC_REGULARIZADOS' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PORC_REGULARIZADOS' ) ).DisplayFormat := '% #,##0.00';

  if sdqConsulta.FieldByName( 'PORC_PAGOS_PARCIALES' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PORC_PAGOS_PARCIALES' ) ).DisplayFormat := '% #,##0.00';

  if sdqConsulta.FieldByName( 'PORC_SIN_PAGOS' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PORC_SIN_PAGOS' ) ).DisplayFormat := '% #,##0.00';
end;

procedure TfrmIndicadoresGestionTel.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmIndicadoresGestionTel.FormCreate(Sender: TObject);
var
  sSql: String;
  IDGestorActual: TTableId;
begin
  inherited;

  sSql := 'SELECT GC_ID ' + CD_ALIAS_ID + ', GC_ID ' + CD_ALIAS_CODIGO + ', ' +
                 'GC_NOMBRE ' + CD_ALIAS_DESC + ', GC_FECHABAJA ' + CD_ALIAS_BAJA + ' ' +
            'FROM USE_USUARIOS, AGC_GESTORCUENTA ' +
           'WHERE GC_USUARIO=SE_USUARIO(+) ' +
             'AND SE_SECTOR=''COB'' ';
  fraGestorCuenta.Sql := sSql;

  IDGestorActual := ValorSqlIntegerEx('SELECT NVL(GC_ID, 0) FROM AGC_GESTORCUENTA WHERE GC_USUARIO = :Usuario', [Sesion.UserID]);
  if IDGestorActual <> ART_EMPTY_ID then
    begin
      fraGestorCuenta.Value := IDGestorActual;
      VCLExtra.LockControl(fraGestorCuenta);
    end;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmIndicadoresGestionTel.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    if iPos <= 1 then
      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
    else
      Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '', 0);
end;

procedure TfrmIndicadoresGestionTel.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  edFechaDesde.Clear;
  edFechaHasta.Clear;
  fraGestorCuenta.Clear;
  edNroSeleccion.Value := 0;
end;

procedure TfrmIndicadoresGestionTel.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  with sdqConsulta do
    if ((FieldByName('FECHA').AsDateTime <= StrToDate('30/04/2011')) and (FieldByName('PORC_REGULARIZADOS').AsFloat >= 50)) or
       ((FieldByName('FECHA').AsDateTime >= StrToDate('01/05/2011')) and (FieldByName('FECHA').AsDateTime <= StrToDate('01/05/2013')) and (FieldByName('PORC_REGULARIZADOS').AsFloat >= 55)) or
       ((FieldByName('FECHA').AsDateTime >= StrToDate('02/05/2013')) and (FieldByName('FECHA').AsDateTime <= StrToDate('16/06/2014')) and (FieldByName('PORC_REGULARIZADOS').AsFloat >= 50)) or
       ((FieldByName('FECHA').AsDateTime >= StrToDate('17/06/2014')) and (FieldByName('PORC_REGULARIZADOS').AsFloat >= 55))  then
      AFont.Color := clGreen
end;

end.

