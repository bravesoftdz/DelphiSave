unit unRptEstablecimiento;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               ?
 FECHA DE CREACION:   ?
 ULTIMA MODIFICACION: 27-11-2003
}
interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptEstablecimiento = class(TQuickRep)
    sdqReporte: TSDQuery;
    QRBand1: TQRBand;
    qrdDetalle: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
  private

  public

  end;

var
  rptEstablecimiento: TrptEstablecimiento;

implementation

{$R *.DFM}

end.
