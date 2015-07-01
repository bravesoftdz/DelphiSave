unit unRptAcuerdoILPPD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, StdCtrls, ExtCtrls;

type
  TfrmRptAcuerdoILPPD = class(TForm)
    ScrollBox1: TScrollBox;
    qrIniLPPD1: TQuickRep;
    Label1: TLabel;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    qrlNroSiniestro: TQRLabel;
    QRLabel66: TQRLabel;
    qrlFechaSiniestro: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlEmpDep: TQRLabel;
    qrlNombreEmpleador: TQRLabel;
    QRLabel6: TQRLabel;
    qrlCuitEmpleador: TQRLabel;
    QRLabel7: TQRLabel;
    qrlDomEmpleador: TQRLabel;
    QRLabel8: TQRLabel;
    qrlLocEmpleador: TQRLabel;
    QRLabel9: TQRLabel;
    qrlProvEmpleador: TQRLabel;
    QRLabel10: TQRLabel;
    qrlCPEmpleador: TQRLabel;
    qrlTelEmpleador: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    qrlNombreTrab: TQRLabel;
    QRLabel14: TQRLabel;
    qrlCuilTrab: TQRLabel;
    QRLabel16: TQRLabel;
    qrlDomTrab: TQRLabel;
    QRLabel19: TQRLabel;
    qrlLocTrab: TQRLabel;
    QRLabel21: TQRLabel;
    qrlProvTrab: TQRLabel;
    QRLabel23: TQRLabel;
    qrlCPTrab: TQRLabel;
    qrlTelTrab: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    qrlTipoDNITrab: TQRLabel;
    qrlNroDNITrab: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    qrlEdadTrab: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    ScrollBox2: TScrollBox;
    Label2: TLabel;
    qrIniLPPD2: TQuickRep;
    QRBand1: TQRBand;
    QRLabel30: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    qrlCuilTrab2: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape2: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
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
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    ScrollBox3: TScrollBox;
    Label3: TLabel;
    qrIniLPPD3: TQuickRep;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    qrlCuilTrab3: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRShape6: TQRShape;
    QRLabel85: TQRLabel;
    QRShape7: TQRShape;
    QRLabel97: TQRLabel;
    QRShape8: TQRShape;
    QRLabel52: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel69: TQRLabel;
    QRShape4: TQRShape;
    qriLogoART: TQRImage;
    qriLogoART2: TQRImage;
    qriLogoART3: TQRImage;
    QRLabel5: TQRLabel;
    qrlFNacim: TQRLabel;
    QRLabel98: TQRLabel;
    qrlDescDenuncia: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    procedure ImprimirHojas;
  end;

var
  frmRptAcuerdoILPPD: TfrmRptAcuerdoILPPD;

implementation

{$R *.DFM}

constructor TfrmRptAcuerdoILPPD.Create(AOwner: TComponent);
begin
  inherited;
end;


procedure TfrmRptAcuerdoILPPD.ImprimirHojas;
begin
  qrIniLPPD1.Print;
  qrIniLPPD2.Print;
  qrIniLPPD3.Print;
end;

end.
