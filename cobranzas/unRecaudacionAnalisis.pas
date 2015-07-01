unit unRecaudacionAnalisis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, ToolEdit, DateComboBox, StdCtrls, Mask, PeriodoPicker,
  RxToolEdit, RxPlacemnt;

type
  TfrmRecaudacionAnalisis = class(TfrmCustomConsulta)
    gbEmpresa: TGroupBox;
    Label1: TLabel;
    mskCUIT: TMaskEdit;
    gbFProceso: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edFProcesoDesde: TDateComboBox;
    edFProcesoHasta: TDateComboBox;
    gbPeriodo: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    edPeriodoDesde: TPeriodoPicker;
    edPeriodoHasta: TPeriodoPicker;
    tbSalir2: TToolButton;
    ToolButton1: TToolButton;
    tbSumatoria: TToolButton;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor;
                              var AlignFooter: TAlingFooter);
    procedure FormCreate(Sender: TObject);
    procedure QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
    procedure QueryPrintReportBegin(Sender: TObject);
  private
    procedure CalcTotales;
  public
  end;

var
  frmRecaudacionAnalisis: TfrmRecaudacionAnalisis;
  TotalConsulta: array of extended;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('IMPORTE');

implementation

{$R *.DFM}

uses
  Periodo, AnsiSql, DbFuncs, CustomDlgs, General;

procedure TfrmRecaudacionAnalisis.tbLimpiarClick(Sender: TObject);
begin
  mskCUIT.Clear;
  edFProcesoDesde.Clear;
  edFProcesoHasta.Clear;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;

  inherited;
end;

procedure TfrmRecaudacionAnalisis.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sSqlWhere: String;
begin
  sSql :=
    'SELECT MP_CODCONC, MP_IMPORTE/100 IMPORTE, MP_INDDBCR, MP_FECPROC, MP_FECREC, MP_CUITCONT,' +
          ' PERIODO2000(MP_PERIODO) PERIODO, MP_ID_TRANSFER, MP_BANCO, MP_SUCURSAL, MP_USUALTA, MP_IDREMESA,' +
          ' MP_FECHAIMPUTACION, RM_FECHA, MP_CUIL' +
     ' FROM RRM_REMESA, ZMP_MOVIMIENTOPENDIENTEAFIP' +
    ' WHERE MP_IDREMESA = RM_ID(+)';

  sSqlWhere := SqlBetween(' AND MP_FECPROC', edFProcesoDesde.Date, edFProcesoHasta.Date) +
               SqlBetween(' AND MP_PERIODO', PeriodoSacarSiglo( edPeriodoDesde.Periodo.Valor), PeriodoSacarSiglo(edPeriodoHasta.Periodo.Valor));

  if mskCUIT.text <> '' then
    sSqlWhere := sSqlWhere + ' AND MP_CUITCONT = ' + SqlValue(mskCUIT.text);

  sdqConsulta.SQL.Text := sSql + sSqlWhere + SortDialog.OrderBy;

  inherited;
  CalcTotales;
end;

procedure TfrmRecaudacionAnalisis.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then  // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmRecaudacionAnalisis.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmRecaudacionAnalisis.CalcTotales;
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

procedure TfrmRecaudacionAnalisis.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                                  FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := '$ ' + FloatToStr(TotalConsulta[iPos]);
end;

procedure TfrmRecaudacionAnalisis.FormCreate(Sender: TObject);
begin
  inherited;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmRecaudacionAnalisis.QueryPrintReportBegin(Sender: TObject);
var
  AField: TPrintField;
begin
  AField := QueryPrint.FieldByName['IMPORTE'];
  if Assigned(AField) then
  begin
    QueryPrint.Fields[0].TotalType := ttCustom;
    AField.TotalType   := ttAutoSum;
    AField.FormatFloat := '$ #,##0.00';
  end;

  inherited;
end;

procedure TfrmRecaudacionAnalisis.QueryPrintGetTotals(Sender: TObject; Field: TPrintField; var Value: String);
begin
  if Field.Index = 0 then
    Value := 'Total:';

  inherited;
end;

end.
