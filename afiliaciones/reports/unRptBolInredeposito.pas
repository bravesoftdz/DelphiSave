unit unRptBolInredeposito;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptBolInredeposito = class(TQuickRep)
    sdqDatos: TSDQuery;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
  private
  public
  end;


implementation

{$R *.DFM}

end.
