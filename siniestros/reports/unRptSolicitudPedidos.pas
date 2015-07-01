unit unRptSolicitudPedidos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrSolicitudPedidos = class(TQuickRep)
    TitleBand1: TQRBand;
    QRShape27: TQRShape;
    QRShape10: TQRShape;
    QRShape3: TQRShape;
    qrlART: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape9: TQRShape;
    qrlNroSiniestro: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape26: TQRShape;
    QRShape1: TQRShape;
    QRLabel61: TQRLabel;
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
    QRShape2: TQRShape;
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
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRShape5: TQRShape;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    QRLabel11: TQRLabel;
    QRShape7: TQRShape;
    QRLabel12: TQRLabel;
    QRShape8: TQRShape;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel1: TQRLabel;
    qriLogoART: TQRImage;
  private

  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  qrSolicitudPedidos: TqrSolicitudPedidos;

implementation

{$R *.DFM}

constructor TqrSolicitudPedidos.Create(AOwner: TComponent);
begin
  inherited;
end;


end.
