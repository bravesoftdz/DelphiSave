unit urRptCartaDocumento;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrpCartaDocumento = class(TQuickRep)
    qrmRemitente1: TQRMemo;                         
    QRBand1: TQRBand;
    qrmDestinatario1: TQRMemo;
    qrmDestinatario2: TQRMemo;
    qrmRemitente2: TQRMemo;
    qrrTexto: TQRRichText;
    qrlCodBarras: TQRLabel;
    qrlNumCarta1: TQRLabel;
    qrlNumCarta2: TQRLabel;
  private

  public

  end;

var
  qrpCartaDocumento: TqrpCartaDocumento;

implementation

{$R *.DFM}

end.
