unit unRptDDJJSinPresentar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnRptMoldeCarta, DB, SDEngine, QRCtrls, QuickRpt, ExtCtrls;

type
  TqrDDJJSinPresentar = class(TqrMoldeCarta)
    qrbDetail: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrbColumnHeader: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    sdqDetalle: TSDQuery;
    ChildBand4: TQRChildBand;
    ChildBand5: TQRChildBand;
    ChildBand6: TQRChildBand;
    ChildBand7: TQRChildBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    ChildBand8: TQRChildBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    qrbSumario: TQRBand;
    QRLabel16: TQRLabel;
    qrlTitulo: TQRLabel;
    qrlInstrucciones: TQRMemo;
    procedure qrbPageHeaderAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure qrbSumarioBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private
    FValor: Boolean;
  end;

var
  qrDDJJSinPresentar: TqrDDJJSinPresentar;

implementation

{$R *.dfm}

procedure TqrDDJJSinPresentar.qrbPageHeaderAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if BandPrinted and FValor then
  begin
    if qrbPageHeader.Height = 72 then
    begin
      qrbPageHeader.Height := 512;
      qrlTitulo.Enabled := True;
      qrlInstrucciones.Enabled := True;
      qrbSummary.Enabled := True;
      ChildBand4.Enabled := True;
      ChildBand5.Enabled := True;
      ChildBand6.Enabled := True;
      ChildBand7.Enabled := True;
      ChildBand8.Enabled := True;
    end else
    begin
      qrbPageHeader.Height := 72;
      qrlTitulo.Enabled := False;
      qrlInstrucciones.Enabled := False;
      qrbSummary.Enabled := False;
      ChildBand4.Enabled := False;
      ChildBand5.Enabled := False;
      ChildBand6.Enabled := False;
      ChildBand7.Enabled := False;
      ChildBand8.Enabled := False;
    end;
  end;
end;

procedure TqrDDJJSinPresentar.qrbSumarioBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if PrintBand then
  begin
    FValor := True;
    qrbPageHeaderAfterPrint(Sender, True);
    qrbColumnHeader.Enabled := False;
    qrbDetail.Enabled := False;
    PrintBand := False;
    NewPage;
  end;
end;

procedure TqrDDJJSinPresentar.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  qrbColumnHeader.Enabled := True;
  qrbDetail.Enabled := True;
  qrbSummary.Enabled := True;
  ChildBand4.Enabled := True;
  ChildBand5.Enabled := True;
  ChildBand6.Enabled := True;
  ChildBand7.Enabled := True;
  ChildBand8.Enabled := True;
  FValor := False;
end;

end.
