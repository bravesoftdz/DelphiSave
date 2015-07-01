unit unRecibosValorPlanPago;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArt, StdCtrls, ToolEdit, DateComboBox,
  Mask, PatternEdit, CurrEdit, Db, SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, Buttons, Placemnt,
  ComCtrls, ToolWin, ShortCutControl, QueryPrint;

type
  TfrmRecibosValorPlanPago = class(TForm)
    edNroCheque: TPatternEdit;
    lblNroCheque: TLabel;
    edFVencimiento: TDateComboBox;
    lblFVencimiento: TLabel;
    edBanco: TEdit;
    lblBanco: TLabel;
    edImporte: TCurrencyEdit;
    lblImporte: TLabel;
    dbgRecibos: TArtDBGrid;
    sdqRecibos: TSDQuery;
    dsRecibos: TDataSource;
    FormStorage1: TFormStorage;
    PrintDialog: TPrintDialog;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbImprimir: TToolButton;
    ToolButton30: TToolButton;
    tbSalir: TToolButton;
    ShortCutControl: TShortCutControl;
    QueryPrint: TQueryPrint;
    procedure sdqRecibosAfterOpen(DataSet: TDataSet);
    procedure tbSalirClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    pbPlanRecupero: Boolean;
  public
    procedure DoCargarRecibosValorPlanPago(IdValor: TTableId);
  end;

implementation

uses
	unDMPrincipal, AnsiSql, unComunes;

{$R *.DFM}

procedure TfrmRecibosValorPlanPago.DoCargarRecibosValorPlanPago(IdValor: TTableId);
var
  sTipoReciboValor, sSql: String;
begin
  sSql := 'SELECT VA_NROCHEQUE NROCHEQUE, VA_VENCIMIENTO VENCIMIENTO, VA_IMPORTE IMPORTE, BA_NOMBRE BANCO ' +
            'FROM ZVA_VALOR, ZBA_BANCO ' +
           'WHERE VA_IDBANCO = BA_ID(+) ' +
             'AND VA_ID = ' + SqlValue(IdValor);

  with GetQuery(sSql) do
    try
      if not IsEmpty then
        begin
          edNroCheque.Text    := FieldByName('NROCHEQUE').AsString;
          edFVencimiento.Date := FieldByName('VENCIMIENTO').AsDateTime;
          edImporte.Value     := FieldByName('IMPORTE').AsCurrency;
          edBanco.Text        := FieldByName('BANCO').AsString;
        end;
    finally
      Free;
    end;

  sTipoReciboValor := GetTipoReciboValor(IdValor);

  if sTipoReciboValor = '03' then        // Recibo-Plan Pago
    begin
      sSql := 'SELECT DISTINCT COBRANZA.GETNRORECIBOCOMPLETO(RV_ID) NRORECIBO, RV_FECHA FECHA, ' +
                     'PP_CONTRATO CONTRATO, EM_NOMBRE RSOCIAL, RV_IMPORTE IMPORTE, PP_ID PLAN, ' +
                     'NULL SINIESTRO ' +
                'FROM RRV_RECIBOVALOR, ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPP_PLANPAGO, ACO_CONTRATO, ' +
                     'AEM_EMPRESA ' +
               'WHERE RV_ID = PV_IDRECIBO ' +
                 'AND PV_IDPLANCUOTA = PC_ID ' +
                 'AND PC_IDPLANPAGO = PP_ID ' +
                 'AND PP_CONTRATO = CO_CONTRATO ' +
                 'AND CO_IDEMPRESA = EM_ID ' +
                 'AND PV_IDVALOR = :pIdValor ' +
            'ORDER BY NRORECIBO';

      pbPlanRecupero := False;
    end
  else if sTipoReciboValor = '07' then   // Recibo-Plan Pago Recupero
    begin
      sSql := 'SELECT DISTINCT COBRANZA.GETNRORECIBOCOMPLETO(RV_ID) NRORECIBO, RV_FECHA FECHA, ' +
                     'CO_CONTRATO CONTRATO, EM_NOMBRE RSOCIAL, XV_IMPORTE IMPORTE, XP_ID PLAN, ' +
                     'UTILES.ARMAR_SINIESTRO(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) SINIESTRO ' +
                'FROM ACO_CONTRATO, AEM_EMPRESA, SEX_EXPEDIENTES, RRV_RECIBOVALOR, ' +
                     'LXV_RECUPEROVALOR, LXC_RECUPEROCUOTA, LXP_RECUPEROPLAN, LRS_RECUPEROSINIESTROS ' +
               'WHERE RV_ID = XV_IDRECIBO ' +
                 'AND XV_IDCUOTA = XC_ID ' +
                 'AND XC_IDPLANPAGO = XP_ID ' +
                 'AND XP_IDRECUPEROSINIESTRO = RS_ID ' +
                 'AND EX_SINIESTRO = RS_SINIESTRO ' +
                 'AND EX_ORDEN = RS_ORDEN ' +
                 'AND EX_RECAIDA = 0 ' +
                 'AND EX_CONTRATO = CO_CONTRATO ' +
                 'AND CO_IDEMPRESA = EM_ID ' +
                 'AND XV_IDVALOR = :pIdValor ' +
            'ORDER BY NRORECIBO';

        pbPlanRecupero := True;
      end
  else
    Exit;

  OpenQueryEx(sdqRecibos, [IdValor], sSql);

  ShowModal;
end;

procedure TfrmRecibosValorPlanPago.sdqRecibosAfterOpen(DataSet: TDataSet);
begin
  if sdqRecibos.FieldByName('IMPORTE') is TFloatField then    // para que me muestre todo con 2 decimales, como está en la base
    TFloatField(sdqRecibos.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmRecibosValorPlanPago.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRecibosValorPlanPago.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.Enabled := False;
  try
  	if (not sdqRecibos.IsEmpty) and PrintDialog.Execute then
      with QueryPrint do
      begin
      	SetGridColumns(dbgRecibos, True, [baDetail, baHeader, baTotal, baSubTotal]);
        Print;
      end;
  finally
    tbImprimir.Enabled := True;
  end;
end;

procedure TfrmRecibosValorPlanPago.FormShow(Sender: TObject);
begin
  dbgRecibos.ColumnByField['SINIESTRO'].Visible := pbPlanRecupero;
end;

end.

