unit unRptPlantillaRGRL;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,
  ImagingComponents;

type
  TqrPlantillaRGRL = class(TQuickRep)
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    lbTexto: TQRLabel;
  private
  public
    procedure Preparar(const aRazonSocial: String);
  end;

var
  qrPlantillaRGRL: TqrPlantillaRGRL;

implementation

uses
  unVisualizador;

{$R *.DFM}

procedure TqrPlantillaRGRL.Preparar(const aRazonSocial: String);
begin
  lbTexto.Caption := Format('Adjuntamos el Formulario de Rectificación de Datos y Establecimientos, que le permitirá actualizar los datos de %s declarados en Provincia ART.', [aRazonSocial]);

  Visualizar(Self, GetValores(), [TOpcionVisualizador(oAlwaysShowDialog), oForceDB, oForceShowModal], True, '', '', True);
end;

end.
