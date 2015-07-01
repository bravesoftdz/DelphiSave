unit unQRAnalisisFidelitas;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   01-08-03
}

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,
  unAdminCotizacion, unQRLabelEx;

type
  TqrAnalisisFidelitas = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    qrFecha: TQRLabel;
    qrUsuario: TQRLabel;
    QRLabel1: TQRLabelEx;
    qrTextoFidelitas: TQRRichText;
    qrPagina: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrEnc1: TQRLabel;
    qrEnc2: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    procedure qrPaginaPrint(sender: TObject; var Value: String);
  public
    function Preparar(Form: TFrmAdminCotizacion): Boolean;
  end;

implementation

{$R *.DFM}

uses
  unPrincipal, unSesion, unVisualizador;

function TqrAnalisisFidelitas.Preparar(Form: TFrmAdminCotizacion): Boolean;
begin
  Result := True;

  with Form do
  begin
    qrTextoFidelitas.Lines.text := edCO_TEXTOFIDELITAS.Lines.Text;
    qrEnc1.Caption := edCO_RAZONSOCIAL.Text;
    qrEnc2.Caption := edCO_CUIT.EditText;
  end;
  qrFecha.Caption := DateToStr(Now);
  qrUsuario.Caption := Sesion.Usuario;

  //Muestro el report
  Visualizar(Self, GetValores('Fidelitas'), [oAlwaysShowDialog, oAutoFirma, oSinNotaAlPie, oForceDB, oForceShowModal]);
end;

procedure TqrAnalisisFidelitas.qrPaginaPrint(sender: TObject; var Value: String);
begin
  Value := 'Página ' + Value; 
end;

end.
