unit unRptNotaRectificatoria;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrNotaRectificatoria = class(TQuickRep)
    TitleBand1: TQRBand;
    qriLogoART: TQRImage;
    qrlFecha: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    qrlComisionMedica: TQRLabel;
    QRLabel1: TQRLabel;
    qrlDaminificado: TQRLabel;
    QRLabel6: TQRLabel;
    qrlExpediente: TQRLabel;
    QRLabel7: TQRLabel;
    qrlDireccion: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlFirma: TQRMemo;
    qrMemoTexto: TQRMemo;
  private

  public

  end;

var
  qrNotaRectificatoria: TqrNotaRectificatoria;

implementation

{$R *.DFM}

end.
