unit unRptRechPr;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TrptCartaRech = class(TQuickRep)
    QRBand1: TQRBand;                                                                
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    sdqRPT: TSDQuery;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    TxtCuerpo: TQRMemo;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlDiagnostico: TQRLabel;
    QRLabel10: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qrdbDiagnostico: TQRDBText;
    QRDBText11: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRShape1: TQRShape;
    LblUsr: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    sdqFirma: TSDQuery;
    QRDBText2: TQRDBText;
    qrlDescripcionCarta: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrlFechaImpresion: TQRLabel;
    qrlTipoEgreso: TQRLabel;
    qrdbTipoEgreso: TQRDBText;
    procedure GroupFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);
  private
  public
    bImpreso: Boolean;
  end;

var
  rptCartaRech: TrptCartaRech;

implementation

uses
  unCartaRechPr, unPrincipal;

{$R *.DFM}

procedure TrptCartaRech.GroupFooterBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  LblUsr.Caption := 'Usuario: ' + frmprincipal.DBLogin.Usuario;
end;

procedure TrptCartaRech.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qriLogo.Picture.Assign(frmPrincipal.imgLogo.Picture);
end;

procedure TrptCartaRech.QuickRepAfterPrint(Sender: TObject);
begin
   bImpreso := True;
end;

end.
