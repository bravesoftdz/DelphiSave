unit unRptSubDiarioSiniestro;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptSubDiarioSiniestro = class(TQuickRep)
    sdqReporte: TSDQuery;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlProvinciaART: TQRLabel;
    qrlFolio: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    qrbDatalle: TQRBand;
    qrdAfiliado: TQRDBText;
    qrdEstado: TQRDBText;
    qrdPeriodo: TQRDBText;
    qrdCUIT: TQRDBText;
    qrdRazonSocial: TQRDBText;
    qrdPrima: TQRDBText;
    qrdBonicacion: TQRDBText;
    qrdServicioSoc: TQRDBText;
    qrdDsxPremio: TQRDBText;
    qrdFDO_Reserva: TQRDBText;
    qrdHipoacusia: TQRDBText;
    qrdComision: TQRDBText;
    qrdCodProductor: TQRDBText;
    qrdCodOrganizador: TQRDBText;
    qrdJurisdiccion: TQRDBText;
    SummaryBand1: TQRBand;
    qreHipoacusia: TQRExpr;
    qreTotalReserva: TQRExpr;
    qreTotalComision: TQRExpr;
    qrlTotalesdelMes: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrlSaldoAnterior: TQRLabel;
    QRLabel15: TQRLabel;
    qrlSaldoPeriodo: TQRLabel;
    QRLabel16: TQRLabel;
    qrlSaldoActual: TQRLabel;
    procedure qrlSaldoAnteriorPrint(sender: TObject; var Value: String);
    procedure qrlSaldoPeriodoPrint(sender: TObject; var Value: String);
    procedure qrlSaldoActualPrint(sender: TObject; var Value: String);
  private
    fSaldoPeriodo: Currency;
  public
  end;

var
  rptSubDiarioSiniestro: TrptSubDiarioSiniestro;

implementation

uses
  unDmPrincipal, General, strfuncs, unConcBanc;

{$R *.DFM}

procedure TrptSubDiarioSiniestro.qrlSaldoAnteriorPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value);
end;

procedure TrptSubDiarioSiniestro.qrlSaldoPeriodoPrint(sender: TObject; var Value: String);
begin
  fSaldoPeriodo := qreTotalReserva.Value.dblResult+qreHipoacusia.Value.dblResult+qreTotalComision.Value.dblResult;
  Value := Get_AjusteDecimales(FloatToStr(fSaldoPeriodo));
end;

procedure TrptSubDiarioSiniestro.qrlSaldoActualPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(FloatToStr(StrToFloat(qrlSaldoAnterior.Caption)+fSaldoPeriodo));
end;

end.
