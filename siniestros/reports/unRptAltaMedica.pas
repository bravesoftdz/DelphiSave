unit unRptAltaMedica;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, unComunes;

type
  TqrAltaMedica = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel55: TQRLabel;
    QRShape6: TQRShape;
    QRLabel59: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel60: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlTrabajador: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    qrlNombreTrab: TQRLabel;
    QRLabel64: TQRLabel;
    qrlCuilTrab: TQRLabel;
    qrlDomicilioTrab: TQRLabel;
    QRLabel65: TQRLabel;
    qrlLocalidadTrab: TQRLabel;
    qrlProvinciaTrab: TQRLabel;
    QRLabel66: TQRLabel;
    qrlCPTrab: TQRLabel;
    QRLabel67: TQRLabel;
    qrlTelTrab: TQRLabel;
    QRShape9: TQRShape;
    qrlEmpDep: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    qrlNombreEmp: TQRLabel;
    QRLabel72: TQRLabel;
    qrlCuitEmp: TQRLabel;
    qrlDomicilioEmp: TQRLabel;
    QRLabel75: TQRLabel;
    qrlLocalidadEmp: TQRLabel;
    qrlProvinciaEmp: TQRLabel;
    QRLabel78: TQRLabel;
    qrlCPEmp: TQRLabel;
    QRLabel80: TQRLabel;
    qrlTelEmp: TQRLabel;
    QRLabel71: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel81: TQRLabel;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape3: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    qrlDiaAcc: TQRLabel;
    qrlMesAccid: TQRLabel;
    qrlAnioAccid: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape4: TQRShape;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel5: TQRLabel;
    QRShape42: TQRShape;
    qriLogo: TQRImage;
  private

  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  qrAltaMedica: TqrAltaMedica;

implementation

{$R *.DFM}

constructor TqrAltaMedica.Create(AOwner: TComponent);
begin
  inherited;
end;

end.
