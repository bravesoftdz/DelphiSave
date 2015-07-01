unit unRptTicket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnRptMoldeCarta, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls,
  RxGIF, QRTansparentImage, grimgctrl, jpeg, ImagingComponents;

type
  TqrTicket = class(TqrMoldeCarta)
    qrbDetail: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    qrbDetailHijo: TQRChildBand;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    qrbObservaciones: TQRChildBand;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    qrlbUsuario: TQRLabel;
    qrlbHoy: TQRLabel;
    QRLabel19: TQRLabel;
    QRImage1: TQRImage;
    QRLabel17: TQRLabel;
    QRDBText16: TQRDBText;
    procedure qrlbUsuarioPrint(sender: TObject; var Value: String);
    procedure qrlbHoyPrint(sender: TObject; var Value: String);
  end;

var
  qrTicket: TqrTicket;

implementation

uses
  unSesion, unDmPrincipal;

{$R *.dfm}

procedure TqrTicket.qrlbUsuarioPrint(sender: TObject; var Value: String);
begin
  Value := Sesion.Usuario;
end;

procedure TqrTicket.qrlbHoyPrint(sender: TObject; var Value: String);
begin
  Value := DateToStr(DBDateTime);
end;

end.
