unit unCashFlow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion;

type
  TfrmCashFlow = class(TfrmCustomConsulta)
    ShortCutControl1: TShortCutControl;
    gbFecha: TGroupBox;
    Label1: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    gbBanco: TGroupBox;
    fraBanco: TfraStaticCodigoDescripcion;
    gbCuetna: TGroupBox;
    fraCuentaBancaria: TfraStaticCodigoDescripcion;
    tbSalir2: TToolButton;
    tbSumatoria: TToolButton;
    ToolButton2: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure OnfraBancoChange(Sender: TObject);
    procedure OnfraCuentaBancariaChange(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbSumatoriaClick(Sender: TObject);
  private
    procedure CalcTotales;
  public
  protected
    procedure RefreshData; override;
  end;

const
  MAXCOLS = 5;
  CAMPOS_SUMA: Array [0..MAXCOLS] of String = ('SALDO_INICIAL', 'CREDITO', 'DEBITO', 'TRANSFERENCIAS', 'INVERSIONES', 'SALDO_FINAL');
  
var
  frmCashFlow: TfrmCashFlow;
  TotalConsulta: Array of Extended;

implementation

uses
  unDmPrincipal, AnsiSql, CustomDlgs, General, SqlFuncs, DbFuncs, StrFuncs;

  {$R *.dfm}

procedure TfrmCashFlow.FormCreate(Sender: TObject);
begin
  inherited;

  with fraBanco do
    begin
      ShowBajas      := True;
      TableName      := 'ZBA_BANCO';
      FieldID        := 'BA_ID';
      FieldCodigo    := 'BA_CODIGO';
      FieldDesc      := 'BA_NOMBRE';
      FieldBaja      := 'BA_FECHABAJA';
      OnChange       := OnfraBancoChange;
      ExtraCondition := ' AND EXISTS(SELECT 1 FROM ZCB_CUENTABANCARIA WHERE BA_ID = CB_IDBANCO)';
    end;

  with fraCuentaBancaria do
    begin
      ShowBajas   := True;
      TableName   := 'ZCB_CUENTABANCARIA';
      FieldID     := 'CB_ID';
      FieldCodigo := 'CB_ID';
      FieldDesc   := 'CB_NUMERO';
      FieldBaja   := 'CB_FECHABAJA';
      DynamicCols := True;
      ExtraFields := ', CB_IDBANCO "ID Banco"';
      VisibleExtraFields[0] := False;
      OnChange    := OnfraCuentaBancariaChange;
    end;

  SetLength(TotalConsulta, MAXCOLS + 1);
end;

procedure TfrmCashFlow.OnfraBancoChange(Sender: TObject);
begin
  if fraBanco.IsSelected then
    fraCuentaBancaria.ExtraCondition := ' AND CB_IDBANCO = ' + SqlValue(fraBanco.Value)
end;

procedure TfrmCashFlow.OnfraCuentaBancariaChange(Sender: TObject);
begin
  if not fraBanco.IsSelected and fraCuentaBancaria.IsSelected then
    fraBanco.Value := StrToInt(fraCuentaBancaria.cmbDescripcion.Cells[4, fraCuentaBancaria.cmbDescripcion.Row]);
end;

procedure TfrmCashFlow.tbLimpiarClick(Sender: TObject);
begin
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  fraBanco.Clear;
  fraCuentaBancaria.Clear;

  inherited;
end;

procedure TfrmCashFlow.RefreshData;
var
  sSql, sWhere: String;
begin
  sSql := 'SELECT BANCO, CUENTA, FECHA, SALDO_INICIAL, CREDITO_EXT - TRANSF_INGRESO - INV_INGRESO CREDITO, ' +
                 'DEBITO_EXT - TRANSF_EGRESO - INV_EGRESO DEBITO, TRANSF_INGRESO - TRANSF_EGRESO TRANSFERENCIAS, ' +
                 'INV_INGRESO - INV_EGRESO INVERSIONES, SALDO_INICIAL + CREDITO_EXT - DEBITO_EXT SALDO_FINAL, IDBANCO, IDCUENTA ' +
            'FROM (SELECT BA_ID IDBANCO, BA_NOMBRE BANCO, CB_ID IDCUENTA, CB_NUMERO CUENTA, EB_FECHAMOVIMIENTO FECHA, ' +
                         'SUM(CASE WHEN EB_DEBITOCREDITO = ''C'' THEN EB_IMPORTE ELSE 0 END) CREDITO_EXT, ' +
                         'SUM(CASE WHEN EB_DEBITOCREDITO = ''D'' THEN EB_IMPORTE ELSE 0 END) AS DEBITO_EXT, ' +
                         'ART.TESORERIA.GET_SALDOINICIALEXTRACTO(CB_ID, EB_FECHAMOVIMIENTO) SALDO_INICIAL, ' +
                         'ART.TESORERIA.GET_MONTOTRANSFINGRESO(CB_ID, EB_FECHAMOVIMIENTO) TRANSF_INGRESO, ' +
                         'ART.TESORERIA.GET_MONTOTRANSFEGRESO(CB_ID, EB_FECHAMOVIMIENTO) TRANSF_EGRESO, ' +
                         'ART.TESORERIA.GET_MONTOINVERSIONINGRESO(CB_ID, EB_FECHAMOVIMIENTO) INV_INGRESO, ' +
                         'ART.TESORERIA.GET_MONTOINVERSIONEGRESO(CB_ID, EB_FECHAMOVIMIENTO) INV_EGRESO ' +
                    'FROM ZBA_BANCO, ZCB_CUENTABANCARIA, OEB_EXTRACTOBANCO ' +
                   'WHERE BA_ID = CB_IDBANCO ' +
                     'AND CB_ID = EB_IDCUENTABANCARIA ' +
                     'AND EB_FECHABAJA IS NULL ' +
                   'GROUP BY BA_ID, CB_ID, BA_NOMBRE, CB_NUMERO, EB_FECHAMOVIMIENTO ' +
                   'UNION ALL ' +
                  'SELECT BA_ID IDBANCO, BA_NOMBRE BANCO, CB_ID IDCUENTA, CB_NUMERO CUENTA, FECHA, 0 CREDITO_EXT, 0 DEBITO_EXT, ' +
                         'ART.TESORERIA.GET_SALDOINICIALEXTRACTO(CB_ID, FECHA) SALDO_INICIAL, 0 TRANSF_INGRESO, 0 TRANSF_EGRESO, ' +
                         '0 INV_INGRESO, 0 INV_EGRESO ' +
                    'FROM (SELECT TRUNC(ADD_MONTHS(SYSDATE, -12), ''YY'') - 1 + LEVEL AS FECHA ' +
                            'FROM DUAL ' +
                         'CONNECT BY LEVEL <= (SELECT TRUNC(ADD_MONTHS(SYSDATE, 24), ''YY'') - TRUNC(ADD_MONTHS(SYSDATE, -12), ''YY'') ' +
                                                'FROM DUAL)), ' +
                         'ZBA_BANCO, ZCB_CUENTABANCARIA ' +
                   'WHERE BA_ID = CB_IDBANCO ' +
                     'AND CB_FECHABAJA IS NULL ' +
                     'AND NOT EXISTS(SELECT 1 ' +
                                      'FROM OEB_EXTRACTOBANCO ' +
                                     'WHERE FECHA = EB_FECHAMOVIMIENTO ' +
                                       'AND CB_ID = EB_IDCUENTABANCARIA)) ' +
           'WHERE 1 = 1 ';

  sWhere := sWhere + SqlBetweenDateTime(' AND FECHA', edFechaDesde.Date, edFechaHasta.Date);

  if fraBanco.IsSelected then
    sWhere := sWhere + ' AND IDBANCO = ' + SqlValue(fraBanco.Value);

  if fraCuentaBancaria.IsSelected then
    sWhere := sWhere + ' AND IDCUENTA = ' + SqlValue(fraCuentaBancaria.Value);

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;

  CalcTotales;
end;

procedure TfrmCashFlow.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName('SALDO_INICIAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SALDO_INICIAL')).Currency := True;

  if sdqConsulta.FieldByName('CREDITO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('CREDITO')).Currency := True;

  if sdqConsulta.FieldByName('DEBITO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('DEBITO')).Currency := True;

  if sdqConsulta.FieldByName('TRANSFERENCIAS') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('TRANSFERENCIAS')).Currency := True;

  if sdqConsulta.FieldByName('INVERSIONES') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('INVERSIONES')).Currency := True;

  if sdqConsulta.FieldByName('SALDO_FINAL') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('SALDO_FINAL')).Currency := True;
end;

procedure TfrmCashFlow.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
  inherited;

  AlignFooter := afRight;
  iPos := ArrayPos(Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$')
end;

procedure TfrmCashFlow.CalcTotales;
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
        ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;

procedure TfrmCashFlow.tbSumatoriaClick(Sender: TObject);
begin
  CalcTotales;
end;

end.

