unit unResMontosSaldos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TrptResMontosSaldos = class(TQuickRep)
    QRBand1: TQRBand;
    qrmDireccion: TQRMemo;
    QRLabel5: TQRLabel;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrlCant1: TQRLabel;
    qrlCant2: TQRLabel;
    qrlCant3: TQRLabel;
    qrlCant4: TQRLabel;
    qrlCant5: TQRLabel;
    qrlCant7: TQRLabel;
    qrlCant8: TQRLabel;
    qrlCant9: TQRLabel;
    qrlCant10: TQRLabel;
    qrlCant11: TQRLabel;
    QRBand2: TQRBand;
    QRLabel18: TQRLabel;
    qrlUsuario: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    qrlPrestRSocial: TQRLabel;
    QRLabel15: TQRLabel;
    qrlPrestID: TQRLabel;
    QRLabel17: TQRLabel;
    qrlPrestCUIT: TQRLabel;
    qrlTot1: TQRLabel;
    qrlTot2: TQRLabel;
    qrlTot3: TQRLabel;
    qrlTot4: TQRLabel;
    qrlTot5: TQRLabel;
    qrlTot6: TQRLabel;
    qrlTot7: TQRLabel;
    qrlTot8: TQRLabel;
    qrlTot9: TQRLabel;
    qrlTot10: TQRLabel;
    qrlTot11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
  public
    procedure SetValue(Index, ACant : Integer;  ATot : Currency);
  end;

implementation

uses unPrincipal, unArt;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TrptResMontosSaldos.SetValue(Index, ACant: Integer; ATot: Currency);
var
  qrlLabel: TQRLabel;
begin
  qrlLabel := FindComponent('qrlCant' + IntToStr(Index)) as TQRLabel;
  if Assigned (qrlLabel) then
    qrlLabel.Caption := IntToStr(ACant);

  qrlLabel := FindComponent('qrlTot' + IntToStr(Index)) as TQRLabel;
  if Assigned (qrlLabel) then
    qrlLabel.Caption := FormatFloat('$ 0.00', ATot);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptResMontosSaldos.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qriLogo.Picture.Assign( frmPrincipal.imgLogo.Picture );
  
  qrmDireccion.Lines.Text := TXT_EMP_DOMICILIO + #13#10 + TXT_EMP_TELEFONO;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

