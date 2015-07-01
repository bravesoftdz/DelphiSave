unit unRptPedInfo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptPedInfo = class(TQuickRep)
    QRBand1: TQRBand;
    qrlBandDetail: TQRBand;
    QRBand3: TQRBand;
    qriLogo: TQRImage;
    qrmDireccion: TQRMemo;
    qrlFecha: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel4: TQRLabel;
    qrlFirmante: TQRLabel;
    qrlCargo: TQRLabel;
    sdqDatos: TSDQuery;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRLabel18: TQRLabel;
    qrlUsuario: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlDomicilio: TQRLabel;
    qrlLocalidad: TQRLabel;
    qrlNombre: TQRLabel;
    qrlProvincia: TQRLabel;
    qrlTelefono: TQRLabel;
    qrlFax: TQRLabel;
    qrlCodPostal: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel16: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  rptPedInfo: TrptPedInfo;

implementation

uses unDmPrincipal, unPrincipal, unComunes;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptPedInfo.QuickRepBeforePrint(Sender: TCustomQuickRep;  var PrintReport: Boolean);
begin
  qriLogo.Picture.Assign( frmPrincipal.imgLogo.Picture );
end;

{----------------------------------------------------------------------------------------------------------------------}
end.
