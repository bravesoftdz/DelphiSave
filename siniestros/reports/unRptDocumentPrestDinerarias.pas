unit unRptDocumentPrestDinerarias;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrDocumentPrestDinerarias = class(TQuickRep)
    TitleBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    qrlSiniestro: TQRLabel;
    qriLogoART: TQRImage;
  private

  public

  end;

var
  qrDocumentPrestDinerarias: TqrDocumentPrestDinerarias;

implementation

{$R *.DFM}

end.
