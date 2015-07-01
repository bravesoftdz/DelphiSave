unit unRemesasAFIP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, PatternEdit, ComboEditor,
  CheckCombo, DBCheckCombo, IntEdit, CardinalEdit;

type
  TfrmRemesasAFIP = class(TfrmCustomConsulta)
    gbFecha: TGroupBox;
    Label4: TLabel;
    cmbFechaDesde: TDateComboBox;
    cmbFechaHasta: TDateComboBox;
    grbSector: TGroupBox;
    dbcheckCuentaBancaria: TDBCheckCombo;
    sdqCuentaBancaria: TSDQuery;
    dsCuentaBancaria: TDataSource;
    GroupBox1: TGroupBox;
    ieNumeroRemesa: TIntEdit;
    tbTotalesRegGrilla: TToolButton;
    ToolButton1: TToolButton;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbTotalesRegGrillaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor;
                              var AlignFooter: TAlingFooter);
  private
    procedure CalcTotales;
  protected
    procedure RefreshData; override;
  public
  end;

const
  MAXCOLS = 8;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('RA_DEPOSITOCUOTA', 'RA_FONDORESERVA', 'RA_DESCUENTO', 'RA_REVERSIONNETA',
                                               'RA_REVERSIONBRUTA', 'RA_SALDOTRANSFERIDO', 'IMPUTADO', 'NO_IMPUTADO', 'DEBCRED_IMPUTADOS');

var
  frmRemesasAFIP: TfrmRemesasAFIP;

implementation

uses
  AnsiSql, DbFuncs, CustomDlgs, General, Strfuncs;

var
  TotalConsulta: Array of Extended;

{$R *.DFM}

procedure TfrmRemesasAFIP.RefreshData;
var
  sWhere: String;
begin
  sWhere := '';

  if not cmbFechaDesde.IsEmpty then
    sWhere := ' and RA_FECHA >= ' + SqlValue(cmbFechaDesde.Date);

  if not cmbFechaHasta.IsEmpty then
    sWhere := sWhere + ' and RA_FECHA <= ' + SqlValue(cmbFechaHasta.Date);

  if dbcheckCuentaBancaria.Text <> '' then
    sWhere := sWhere + ' and RM_IDCUENTABANCARIA ' + dbcheckCuentaBancaria.InSql;

  if not ieNumeroRemesa.IsEmpty then
    sWhere := sWhere + ' and RM_ID = ' + SqlValue(ieNumeroRemesa.Value);

  sdqConsulta.SQL.Text :=
    'SELECT RA_IDREMESA, RA_FECHA, RA_DEPOSITOCUOTA, RA_ALICUOTA, RA_FONDORESERVA, RA_DESCUENTO, RA_REVERSIONNETA, ' +
           'RA_REVERSIONBRUTA, RA_SALDOTRANSFERIDO, RA_SALDOTRANSFERIDO - NVL (RA_NOIMPUTADO, 0) IMPUTADO, ' +
           'NVL (RA_NOIMPUTADO, 0) NO_IMPUTADO, ' +
           '(SELECT MIN(MP_FECHAIMPUTACION) ' +
              'FROM ZMP_MOVIMIENTOPENDIENTEAFIP ' +
             'WHERE MP_IDREMESA = RA_IDREMESA) FECHA_IMPUTACION_POSTERIOR, ' +
           '(SELECT SUM(MO_IMPORTE) ' +
              'FROM ZCM_CODIGOMOVIMIENTO, ZMO_MOVIMIENTO ' +
             'WHERE CM_ID = MO_IDCODIGOMOVIMIENTO ' +
               'AND CM_OPERACION IN (''C'', ''R'') ' +
               'AND MO_IDREMESA = RA_IDREMESA) DEBCRED_IMPUTADOS ' +
      'FROM RRM_REMESA, ZRA_RECAUDACIONAFIP ' +
     'WHERE RM_ID = RA_IDREMESA ' + sWhere;

  inherited;
end;

procedure TfrmRemesasAFIP.FormCreate(Sender: TObject);
begin
  sdqCuentaBancaria.Open;

  inherited;

  with QueryPrint do
  begin
    SetGridColumns(Grid, True, [baDetail, baHeader, baTotal, baSubTotal]);

    with FieldByName['RA_DEPOSITOCUOTA'] do
    begin
      TotalType   := ttAutoSum;
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 600;
    end;

    with FieldByName['RA_FONDORESERVA'] do
    begin
      TotalType   := ttAutoSum;
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 500;
    end;

    with FieldByName['RA_DESCUENTO'] do
    begin
      TotalType   := ttAutoSum;
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 800;
    end;

    with FieldByName['RA_REVERSIONNETA'] do
    begin
      TotalType   := ttAutoSum;
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 500;
    end;

    with FieldByName['RA_REVERSIONBRUTA'] do
    begin
      TotalType   := ttAutoSum;
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 500;
    end;

    with FieldByName['RA_SALDOTRANSFERIDO'] do
    begin
      TotalType   := ttAutoSum;
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 600;
    end;

    with FieldByName['IMPUTADO'] do
    begin
      TotalType   := ttAutoSum;
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 600;
    end;

    with FieldByName['NO_IMPUTADO'] do
    begin
      TotalType   := ttAutoSum;
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 600;
    end;

    with FieldByName['RA_IDREMESA'] do
    begin
      Width := 280;
    end;

    with FieldByName['RA_FECHA'] do
    begin
      Alignment := taCenter;
      Width     := 400;
    end;

    with FieldByName['RA_ALICUOTA'] do
    begin
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 320;
    end;

    with FieldByName['FECHA_IMPUTACION_POSTERIOR'] do
    begin
      Alignment := taCenter;
      Width     := 1000;
    end;

    with FieldByName['DEBCRED_IMPUTADOS'] do
    begin
      TotalType   := ttAutoSum;
      Alignment   := taRightJustify;
      FormatFloat := '$ #,##0.00';
      Width       := 1000;
    end;
  end;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmRemesasAFIP.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  cmbFechaDesde.Clear;
  cmbFechaHasta.Clear;
  dbcheckCuentaBancaria.Clear;
  ieNumeroRemesa.Clear;
end;

procedure TfrmRemesasAFIP.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(sdqConsulta.FieldByName('RA_DEPOSITOCUOTA')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('RA_ALICUOTA')).DisplayFormat := '0.00 %';
  TFloatField(sdqConsulta.FieldByName('RA_FONDORESERVA')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('RA_DESCUENTO')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('RA_REVERSIONNETA')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('RA_REVERSIONBRUTA')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('RA_SALDOTRANSFERIDO')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('IMPUTADO')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('NO_IMPUTADO')).Currency := True;
  TFloatField(sdqConsulta.FieldByName('DEBCRED_IMPUTADOS')).Currency := True;
end;

procedure TfrmRemesasAFIP.tbTotalesRegGrillaClick(Sender: TObject);
begin
  CalcTotales;
end;

procedure TfrmRemesasAFIP.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbTotalesRegGrilla.Down;
      if tbTotalesRegGrilla.Down and sdqConsulta.Active then
        SumFields(sdqConsulta, CAMPOS_SUMA, TotalConsulta);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al Calcular los totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmRemesasAFIP.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor,
                                          FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;
  
  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]));
end;

end.
