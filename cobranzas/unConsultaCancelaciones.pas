unit unConsultaCancelaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox, CurrEdit;

type
  TfrmConsultaCancelaciones = class(TfrmCustomConsulta)
    GroupBox1: TGroupBox;
    fraEmpresa: TfraEmpresa;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edFechaBajaDesde: TDateComboBox;
    edFechaBajaHasta: TDateComboBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    edFechaUltimoPagoDesde: TDateComboBox;
    edFechaUltimoPagoHasta: TDateComboBox;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edSaldoDesde: TCurrencyEdit;
    edSaldoHasta: TCurrencyEdit;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edTotal799Desde: TCurrencyEdit;
    edTotal799Hasta: TCurrencyEdit;
    GroupBox6: TGroupBox;
    checkSinCancelar: TCheckBox;
    GroupBox7: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edFechaCanceladoDesde: TDateComboBox;
    edFechaCanceladoHasta: TDateComboBox;
    ShortCutControlHijo: TShortCutControl;
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbMaxRegistrosClick(Sender: TObject);
  private
    ListaCalculada, ValorCalculado: TStrings;
  protected
    procedure ClearData; override;
  public
  end;

var
  frmConsultaCancelaciones: TfrmConsultaCancelaciones;

implementation

{$R *.DFM}

uses
  AnsiSql, unGrids, Numeros, Strfuncs, General, unEspera;

procedure TfrmConsultaCancelaciones.ClearData;
begin
  fraEmpresa.Clear;
  edFechaBajaDesde.Clear;
  edFechaBajaHasta.Clear;
  edFechaUltimoPagoDesde.Clear;
  edFechaUltimoPagoHasta.Clear;
  edSaldoDesde.Clear;
  edSaldoHasta.Clear;
  edTotal799Desde.Clear;
  edTotal799Hasta.Clear;
  checkSinCancelar.Checked := False;
  edFechaCanceladoDesde.Clear;
  edFechaCanceladoHasta.Clear;

  inherited;
end;

procedure TfrmConsultaCancelaciones.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sWhere := '';
  sSql :=
    'SELECT EM_CUIT CUIT, EM_NOMBRE NOMBRE, RM_CONTRATO CONTRATO, TRUNC(RM_FECHABAJA) FECHA_BAJA, RM_SALDO SALDO,' +
          ' RM_PERIODOS PERIODOS, TRUNC(RM_FECHAULTPAGO) FECHA_ULT_PAGO,' +
          ' DECODE(RM_TIPOPAGO, ''1'', ''DGI'', ''2'', ''Manual'', ''4'', ''Automático'', ''5'', ''Automático'') TIPO_PAGO,' +
          ' RM_TOTAL799 TOTAL_799, TRUNC(RM_FECHACANCELADO) FECHA_CANCELADO,' +
          ' RM_CONCURSO CONCURSO, RM_RECLAMOAFIP RECLAMOAFIP, RM_PRESCRIPTO PRESCRIPTO, ' +
          ' (SELECT SUM(RC_MONTOREFINANCIADO) FROM ZRC_RESUMENCOBRANZA WHERE RC_CONTRATO = CO_CONTRATO) MONTO_REFINANCIADO ' +
     ' FROM AEM_EMPRESA, ACO_CONTRATO, ZRM_REGISTROMOROSO' +
    ' WHERE EM_ID = CO_IDEMPRESA' +
      ' AND RM_CONTRATO = CO_CONTRATO';

  if not fraEmpresa.IsEmpty then
    sWhere := sWhere + ' AND RM_CONTRATO = ' + SqlValue(fraEmpresa.Contrato);

  if not edFechaBajaDesde.IsEmpty then
    sWhere := sWhere + ' AND RM_FECHABAJA >= ' + SqlValue(edFechaBajaDesde.Date);

  if not edFechaBajaHasta.IsEmpty then
    sWhere := sWhere + ' AND RM_FECHABAJA <= ' + SqlValue(edFechaBajaHasta.Date);

  if not edFechaUltimoPagoDesde.IsEmpty then
    sWhere := sWhere + ' AND RM_FECHAULTPAGO >= ' + SqlValue(edFechaUltimoPagoDesde.Date);

  if not edFechaUltimoPagoHasta.IsEmpty then
    sWhere := sWhere + ' AND RM_FECHAULTPAGO <= ' + SqlValue(edFechaUltimoPagoHasta.Date);

  if edSaldoDesde.Value > 0 then
    sWhere := sWhere + ' AND RM_SALDO >= ' + SqlValue(edSaldoDesde.Value);

  if edSaldoHasta.Value > 0 then
    sWhere := sWhere + ' AND RM_SALDO <= ' + SqlValue(edSaldoHasta.Value);

  if edTotal799Desde.Value > 0 then
    sWhere := sWhere + ' AND RM_TOTAL799 >= ' + SqlValue(edTotal799Desde.Value);

  if edTotal799Hasta.Value > 0 then
    sWhere := sWhere + ' AND RM_TOTAL799 <= ' + SqlValue(edTotal799Hasta.Value);

  if checkSinCancelar.Checked then
    sWhere := sWhere + ' AND RM_FECHACANCELADO IS NULL';
    
  if not edFechaCanceladoDesde.IsEmpty then
    sWhere := sWhere + ' AND RM_FECHACANCELADO >= ' + SqlValue(edFechaCanceladoDesde.Date);

  if not edFechaCanceladoHasta.IsEmpty then
    sWhere := sWhere + ' AND RM_FECHACANCELADO <= ' + SqlValue(edFechaCanceladoHasta.Date);

  ListaCalculada.Clear;
  ValorCalculado.Clear;
  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmConsultaCancelaciones.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TFloatField(sdqConsulta.FieldByName('SALDO')).DisplayFormat               := '#,##0.00';
  TFloatField(sdqConsulta.FieldByName('TOTAL_799')).DisplayFormat           := '#,##0.00';
  TFloatField(sdqConsulta.FieldByName('CONCURSO')).DisplayFormat            := '#,##0.00';
  TFloatField(sdqConsulta.FieldByName('RECLAMOAFIP')).DisplayFormat         := '#,##0.00';
  TFloatField(sdqConsulta.FieldByName('PRESCRIPTO')).DisplayFormat          := '#,##0.00';
  TFloatField(sdqConsulta.FieldByName('MONTO_REFINANCIADO')).DisplayFormat  := '#,##0.00';
end;

procedure TfrmConsultaCancelaciones.FormCreate(Sender: TObject);
begin
  inherited;
  ListaCalculada := TStringList.Create;
  ValorCalculado := TStringList.Create;
  fraEmpresa.ShowBajas := True;
end;

procedure TfrmConsultaCancelaciones.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
begin
  inherited;
  if sdqConsulta.Active and not sdqConsulta.IsEmpty then
    begin
      AlignFooter := afRight;

      if AreIn(Column, ['SALDO', 'TOTAL_799', 'CONCURSO', 'RECLAMOAFIP', 'PRESCRIPTO', 'MONTO_REFINANCIADO']) then
        if (ListaCalculada.IndexOf(Column) = -1) then
        begin
          Screen.Cursor := crHourGlass;
          try
            ListaCalculada.Add(Column);
            ValorCalculado.Add(CurrToStr(ObtenerSuma(Grid, Column)));
            Value :=  Get_AjusteDecimales(ValorCalculado[ListaCalculada.IndexOf(Column)], '$');
          finally
            Screen.Cursor := crDefault;
          end;
        end else
          Value := Get_AjusteDecimales(ValorCalculado[ListaCalculada.IndexOf(Column)], '$');
    end;
end;

procedure TfrmConsultaCancelaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaCalculada.Free;
  ValorCalculado.Free;
  inherited;
end;

procedure TfrmConsultaCancelaciones.tbMaxRegistrosClick(Sender: TObject);
begin
  Grid.FooterBand := tbMaxRegistros.Down;
end;

end.


