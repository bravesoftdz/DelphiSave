unit unRPTEmpresasSinVendedor;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine;

type
  TqrEmpresasSinVendedor = class(TQuickRep)
    sdqConsulta: TSDQuery;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr2: TQRExpr;
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRLabel5Print(sender: TObject; var Value: String);
  private
  public
    function Prepare(Id_EntidadVendedor : string) : boolean;
  end;

implementation
Uses unPrincipal, unDmPrincipal;
{$R *.DFM}

function TqrEmpresasSinVendedor.Prepare(Id_EntidadVendedor : string) : boolean;
var
  sSql : string;
begin
  sSql := 'SELECT CO_CONTRATO, EM_CUIT, EM_NOMBRE ' +
          ' FROM AEM_EMPRESA, ACO_CONTRATO, AVC_VENDEDORCONTRATO ' +
          ' WHERE CO_CONTRATO = VC_CONTRATO ' +
          ' AND CO_IDEMPRESA = EM_ID ' +
          ' AND VC_IDENTIDADVEND = ' + Id_EntidadVendedor;
          
  OpenQuery ( sdqConsulta , sSql, True );
  Result := not sdqConsulta.Eof;
end;

procedure TqrEmpresasSinVendedor.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  Value := 'Página Nro: ' + Value;
end;

procedure TqrEmpresasSinVendedor.QRLabel5Print(sender: TObject;
  var Value: String);
begin
  Value := frmPrincipal.DBLogin.UserID;
end;

end.
