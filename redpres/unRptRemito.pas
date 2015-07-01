unit unRptRemito;

interface

uses
	Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrRemito = class(TQuickRep)
    QRBand1: TQRBand;
    lbNumeroRemito: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qriLogo: TQRImage;
    procedure QRDBText8Print(Sender: TObject; var Value: String);
  private
  public
  end;

var
  qrRemito: TqrRemito;

implementation

uses
	unDmPrincipal, unDocumentacion, CUIT;

{$R *.DFM}

procedure TqrRemito.QRDBText8Print(Sender: TObject; var Value: String);
begin
	Value := PonerGuiones(Value);
end;

end.
