unit unRPT_CH_REEMPLAZADOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, ExtCtrls, QuickRpt, Qrctrls,
  unQRLabelEx;

type
  TfrmRPT_CH_REEMPLAZADOS = class(TForm)
    qrpChequesRechazados: TQuickRep;
    sdqChequesRechazados: TSDQuery;
    dsChequesRechazados: TDataSource;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    QRSysData3: TQRSysData;
    qrbDatalle: TQRBand;
    qrdOP: TQRDBText;
    qrdFechaCheque: TQRDBText;
    qrdFechaEstado: TQRDBText;
    qrdMonto: TQRDBText;
    qrdBeneficiario: TQRDBText;
    qrdCheque: TQRDBText;
    qrlFiltro: TQRLabel;
    sumTotales: TQRBand;
    qrTotalAnulados: TQRLabel;
    qrTotalEmitidos: TQRLabel;
    QRLabelEx27: TQRLabelEx;
    QRLabelEx30: TQRLabelEx;
    QRLabelEx29: TQRLabelEx;
    QRLabelEx28: TQRLabelEx;
    QRLabelEx31: TQRLabelEx;
    QRLabelEx32: TQRLabelEx;
    QRLabelEx33: TQRLabelEx;
    QRLabelEx34: TQRLabelEx;
    QRLabelEx35: TQRLabelEx;
    QRLabelEx36: TQRLabelEx;
    procedure qrbDatalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrpChequesRechazadosBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure sumTotalesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    rTotalAnulados, rTotalEmitidos: Currency;
  end;

var
  frmRPT_CH_REEMPLAZADOS: TfrmRPT_CH_REEMPLAZADOS;

implementation

{$R *.DFM}

{ TfrmRPT_CH_REEMPLAZADOS }

procedure TfrmRPT_CH_REEMPLAZADOS.qrbDatalleBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (sdqChequesRechazados.FieldByName('CORTE').asString = '1') then
  begin
    qrbDatalle.Color     := clSilver;
    qrdCheque.Color      := clSilver;
    qrdOP.Color          := clSilver;
    qrdFechaCheque.Color := clSilver;
    qrdFechaEstado.Color := clSilver;
    qrdMonto.Color       := clSilver;
    qrdBeneficiario.Color:= clSilver;
    rTotalAnulados := rTotalAnulados + sdqChequesRechazados.FieldByName('CE_MONTO').AsCurrency;
  end
  else
  begin
    qrbDatalle.Color     := clWhite;
    qrbDatalle.Color     := clWhite;
    qrdCheque.Color      := clWhite;
    qrdOP.Color          := clWhite;
    qrdFechaCheque.Color := clWhite;
    qrdFechaEstado.Color := clWhite;
    qrdMonto.Color       := clWhite;
    qrdBeneficiario.Color:= clWhite;
    rTotalEmitidos := rTotalEmitidos + sdqChequesRechazados.FieldByName('CE_MONTO').AsCurrency;
  end;
end;
procedure TfrmRPT_CH_REEMPLAZADOS.qrpChequesRechazadosBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rTotalEmitidos := 0;
  rTotalAnulados := 0;
end;

procedure TfrmRPT_CH_REEMPLAZADOS.sumTotalesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrTotalEmitidos.Caption := 'TOTAL CHEQUES EMITIDOS  $ ' + FormatFloat('#,##0.00', rTotalEmitidos);
  qrTotalAnulados.Caption := 'TOTAL CHEQUES ANULADOS  $ ' + FormatFloat('#,##0.00', rTotalAnulados);
end;

end.
