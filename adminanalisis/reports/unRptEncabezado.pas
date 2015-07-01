unit unRptEncabezado;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptEncabezado = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    sdqConsulta: TSDQuery;
    qrdbRazonSocial: TQRDBText;
    qrlCuit: TQRLabel;
    qrdbCuit: TQRDBText;
    QRLabel3: TQRLabel;
    qrdbContrato: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrdbApellidoNombre: TQRDBText;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    qrdbCUIL: TQRDBText;
  private

  public

  end;

var
  rptEncabezado: TrptEncabezado;

implementation

{$R *.DFM}

end.
