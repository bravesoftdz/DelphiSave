unit unRptRemitoExpedientes;     // por TK 7558

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrRemitoExpedientes = class(TQuickRep)
    BandTitulo: TQRBand;
    qriLogoART: TQRImage;
    qrlFecha: TQRLabel;
    QRMemo1: TQRMemo;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    sdqRemitoExpedientes: TSDQuery;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    qrlDestinatario: TQRLabel;
    QRLabel4: TQRLabel;
    qrlUsuarioFirma: TQRLabel;
    qrlSectorUsuario: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
  private

  public

  end;

var
  qrRemitoExpedientes: TqrRemitoExpedientes;

implementation

{$R *.DFM}

end.
