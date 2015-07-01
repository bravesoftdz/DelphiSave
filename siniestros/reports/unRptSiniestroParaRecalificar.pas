unit unRptSiniestroParaRecalificar;     // TK 18591

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrSiniestroParaRecalificar = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogoART: TQRImage;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlUsuario: TQRLabel;
    QRLabel3: TQRLabel;
    qrlHoy: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlFecha: TQRLabel;
    qrlSiniestro: TQRLabel;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
  private

  public

  end;

var
  qrSiniestroParaRecalificar: TqrSiniestroParaRecalificar;

implementation

{$R *.DFM}

end.
