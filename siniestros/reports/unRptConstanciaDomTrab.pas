unit unRptConstanciaDomTrab;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrConstanciaDomTrab = class(TQuickRep)
    TitleBand1: TQRBand;
    qriLogoART: TQRImage;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlTrabajador: TQRLabel;
    QRLabel3: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlLocalidad: TQRLabel;
  private

  public

  end;

var
  qrConstanciaDomTrab: TqrConstanciaDomTrab;

implementation

{$R *.DFM}

end.
