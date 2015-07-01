unit unRptNomina;
{
 INFORMACION DE LA UNIDAD
 ULTIMA MODIFICACION: 28-11-2003
}
interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptNomina = class(TQuickRep)
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
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrdNombreEmpresa: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
  private

  public

  end;

var
  rptNomina: TrptNomina;

implementation

{$R *.DFM}

end.
