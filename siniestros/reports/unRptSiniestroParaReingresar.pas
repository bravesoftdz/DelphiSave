unit unRptSiniestroParaReingresar;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrSiniestroParaReingresar = class(TQuickRep)
    QRBand1: TQRBand;
    qriLogo: TQRImage;
    qrlTitComMed: TQRLabel;
    QRShape1: TQRShape;
    QRShape13: TQRShape;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    qrlNroSiniestro: TQRLabel;
    qrlPedido: TQRLabel;
    qrlFechaEntrega: TQRLabel;
    qrlSectorRecepcion: TQRLabel;
  private

  public

  end;

var
  qrSiniestroParaReingresar: TqrSiniestroParaReingresar;

implementation

{$R *.DFM}



end.
