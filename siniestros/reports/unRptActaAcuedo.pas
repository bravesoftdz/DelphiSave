unit unRptActaAcuedo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
    StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;


type
  TqrActaAcuerdo = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    qrlFechaListado: TQRLabel;
    qrlCad1: TQRLabel;
    qrlCad6: TQRLabel;
    qrlCad3: TQRLabel;
    qrlCad4: TQRLabel;
    qrlCad5: TQRLabel;
    QRLabel4: TQRLabel;
    qrlFSin: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlAT: TQRLabel;
    qrlAI: TQRLabel;
    qrlEP: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    qrlDiagnostico: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape3: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape4: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape5: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    qrlAseguradora: TQRLabel;
    QRShape6: TQRShape;
    QRLabel57: TQRLabel;
    QRShape7: TQRShape;
    QRLabel58: TQRLabel;
    QRShape8: TQRShape;
    QRShape22: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape21: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    qrlCad2: TQRLabel;
    qriLogo: TQRImage;
  private

  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  qrActaAcuerdo: TqrActaAcuerdo;

implementation

{$R *.DFM}

constructor TqrActaAcuerdo.Create(AOwner: TComponent);
begin
  inherited;
end;


end.
