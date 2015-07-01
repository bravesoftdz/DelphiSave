unit unRptNotaBaja;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrNotaBaja = class(TQuickRep)
    TitleBand1: TQRBand;
    qriLogoART: TQRImage;
    qrlFecha: TQRLabel;
    QRLabel5: TQRLabel;
    qrlComisionMedica: TQRLabel;
    QRLabel1: TQRLabel;
    qrlDamnificado: TQRLabel;
    qrlSiniestro: TQRLabel;
    QRLabel2: TQRLabel;
    QRMemoNota: TQRMemo;
    qrlFirmante: TQRLabel;
    qrlFirmanteCaracter: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qrNotaBaja: TqrNotaBaja;

implementation

{$R *.DFM}

procedure TqrNotaBaja.QuickRepBeforePrint(Sender: TCustomQuickRep;var PrintReport: Boolean);
begin
  PrinterSettings.Copies := 2;
end;

end.
