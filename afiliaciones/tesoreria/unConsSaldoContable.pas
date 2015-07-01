unit unConsSaldoContable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, StdCtrls, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin,
  ExtCtrls, Mask, ToolEdit, DateComboBox;

type
  TfrmConsSaldoContable = class(TfrmCustomConsulta)
    fraCuentaBancaria: TfraStaticCodigoDescripcion;
    fraBanco: TfraStaticCodigoDescripcion;
    lbBanco: TLabel;
    lbCuenta: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    pnlArriba: TPanel;
    lbSaldoInicial: TLabel;
    pnlTotales: TPanel;
    lbSaldoFinal: TLabel;
    procedure tbRefrescarClick(Sender: TObject); {$IFDEF REFRESH} override; {$ENDIF}
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  public
  end;

var
  frmConsSaldoContable: TfrmConsSaldoContable;

implementation

uses
  CustomDlgs, AnsiSql, unPrincipal, unDmPrincipal, DateTimeFuncs, unGrids, General;

{$R *.DFM}

procedure TfrmConsSaldoContable.tbRefrescarClick(Sender: TObject);
var
  sSql: string;
  dMaxFecha: TDateTime;
  fSaldoInicial: Extended;
  SqlResults: TStringList;
begin
  Verificar(fraBanco.IsEmpty, fraBanco.edCodigo, 'Debe seleccionar un Banco.');
  Verificar(fraCuentaBancaria.IsEmpty, fraCuentaBancaria.edCodigo, 'Debe seleccionar una Cuenta Bancaria.');
  Verificar(edFechaDesde.IsEmpty, edFechaDesde, 'Debe seleccionar una fecha inicial.');

  sSql := 'SELECT SC_ID, SC_NOMBREBANCO, SC_NUMEROCUENTA, SC_TIPOCOMP, SC_NROCOMP, ' +
                 'SC_FECHA, SC_BENEFICIARIO, SC_ORDENPAGO, SC_DEBITO, SC_CREDITO, SC_CONCILIADO, ' +
                 'SC_IDCUENTABANCARIA , SC_MONTO ' +
            'FROM V_OSC_SALDOCONTABLEBANCO ' +
           'WHERE SC_IDBANCO = ' + SqlValue(fraBanco.Value) +
            ' AND SC_IDCUENTABANCARIA = ' + SqlValue(fraCuentaBancaria.Value);

  sSql := sSql + SqlBetweenDateTime (' AND SC_FECHA', edFechaDesde.Date, edFechaHasta.Date);

  sdqConsulta.Sql.Text := sSql + ' ' + SortDialog.OrderBy;
  inherited;

  sSql := 'SELECT MAX(SC_FECHA), NVL(SUM(SC_MONTO), 0) ' +
            'FROM V_OSC_SALDOCONTABLEBANCO ' +
           'WHERE SC_IDCUENTABANCARIA = ' + SqlValue(fraCuentaBancaria.Value) + ' ' +
             'AND SC_FECHA < ' + SqlValue(edFechaDesde.Date);

  SqlResults := ValoresColSql(sSql);
  try
    if SqlResults[0] = '' then
      dMaxFecha := 0
    else
      dMaxFecha := StrToDate(SqlResults[0]);

    fSaldoInicial := 0;

    if dMaxFecha = 0 then
    begin
      lbSaldoInicial.Caption := Format('El saldo al %s es de %m.', [FormatDateTime('dd/mm/yyyy', edFechaDesde.Date - 1), fSaldoInicial]);
      lbSaldoFinal.Caption   := Format('El saldo final es de %m.', [ObtenerSuma(Grid, 'SC_MONTO')]);
    end else
    begin
      fSaldoInicial := StrToFloat(SqlResults[1]);

      lbSaldoInicial.Caption := Format('El saldo al %s es de %m.', [FormatDateTime('dd/mm/yyyy', dMaxFecha), fSaldoInicial]);
      lbSaldoFinal.Caption   := Format('El saldo final es de %m.', [fSaldoInicial + ObtenerSuma(Grid, 'SC_MONTO')]);
    end;
  finally
    SqlResults.Free;
  end;
end;

procedure TfrmConsSaldoContable.tbLimpiarClick(Sender: TObject);
begin
  fraBanco.Clear;
  fraCuentaBancaria.Clear;

  lbSaldoInicial.Caption := '';
  lbSaldoFinal.Caption := '';
  inherited;
end;

procedure TfrmConsSaldoContable.FormCreate(Sender: TObject);
begin
  inherited;
  lbSaldoInicial.Caption := '';
  lbSaldoFinal.Caption := '';

  with fraBanco do
  begin
    ShowBajas   := True;
    TableName   := 'ZBA_BANCO';
    FieldID     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    FieldBaja   := 'BA_FECHABAJA';

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
    ExtraCondition        := ' AND CB_CONCILIACION = ''S''';
  end;
end;

procedure TfrmConsSaldoContable.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    FieldByName('SC_ID').DisplayLabel               := 'Código';
    FieldByName('SC_NOMBREBANCO').DisplayLabel      := 'Nombre del Banco';
    FieldByName('SC_NUMEROCUENTA').DisplayLabel     := 'Nº Cuenta';
    FieldByName('SC_TIPOCOMP').DisplayLabel         := 'Tipo Comprobante';
    FieldByName('SC_NROCOMP').DisplayLabel          := 'Nº Comprobante';
    FieldByName('SC_FECHA').DisplayLabel            := 'Fecha';
    FieldByName('SC_BENEFICIARIO').DisplayLabel     := 'Beneficiario';
    FieldByName('SC_ORDENPAGO').DisplayLabel        := 'Orden Pago';
    FieldByName('SC_DEBITO').DisplayLabel           := 'Débito';
    FieldByName('SC_CREDITO').DisplayLabel          := 'Crédito';
    FieldByName('SC_CONCILIADO').DisplayLabel       := 'Conciliado';
    FieldByName('SC_IDCUENTABANCARIA').DisplayLabel := 'Cuenta Bancaria';
    FieldByName('SC_MONTO').DisplayLabel            := 'Monto';

    TFloatField(FieldByName('SC_DEBITO')).Currency  := True;
    TFloatField(FieldByName('SC_CREDITO')).Currency := True;
    TFloatField(FieldByName('SC_MONTO')).Currency   := True;
  end;
end;

end.
