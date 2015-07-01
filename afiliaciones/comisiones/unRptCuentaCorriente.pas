unit unRptCuentaCorriente;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, unArt,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TqrCuentaCorriente = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    imgLogo: TQRImage;
    QRLabel1: TQRLabel;
    sdqDatos: TSDQuery;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    qrlUsuario: TQRLabel;
    qrlEntidad: TQRLabel;
    QRLabel18: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBDebito: TQRDBText;
    QRDBCredito: TQRDBText;
    QRDBText6: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrlVendedor: TQRLabel;
    SummaryBand1: TQRBand;
    qreTotalDebito: TQRExpr;
    QRLabel12: TQRLabel;
    qreTotalCredito: TQRExpr;
    qrlSaldoFinalDebito: TQRLabel;
    qrlSaldoFinalCredito: TQRLabel;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    ChildBand1: TQRChildBand;
    procedure QRDBDebitoPrint(sender: TObject; var Value: String);
  private
  public
  end;

procedure DoGenerarReporteCuentaCorriente(Sql, Entidad, Vendedor: String; IdVendedor: TTableId; Fecha: TDateTime; SaldoFinal: Currency);

var
  qrCuentaCorriente: TqrCuentaCorriente;

implementation
{$R *.DFM}

uses
  unVisualizador, unDmPrincipal, unSesion, Strfuncs, General;

procedure DoGenerarReporteCuentaCorriente(Sql, Entidad, Vendedor: String; IdVendedor: TTableId; Fecha: TDateTime; SaldoFinal: Currency);
var
  rpt: TqrCuentaCorriente;
  sSql, sDirVendedor: String;
begin
  sSql := 'SELECT VE_DIRELECTRONICA ' +
            'FROM XVE_VENDEDOR ' +
           'WHERE VE_ID = :IdVendedor';
  sDirVendedor := ValorSqlEx(sSql, [IdVendedor]);

  rpt := TqrCuentaCorriente.Create(nil);
  with rpt do
    begin
      imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');

      qrlEntidad.Caption  := Entidad;
      qrlVendedor.Caption := Vendedor;
      qrlUsuario.Caption  := Sesion.UserID;

      qrlSaldoFinalCredito.Caption := FloatToStr(Iif(SaldoFinal > 0, SaldoFinal, 0));
      qrlSaldoFinalDebito.Caption  := FloatToStr(Iif(SaldoFinal < 0, -SaldoFinal, 0));

      OpenQuery(sdqDatos, Sql);

      Visualizar(rpt, GetValores('Cuenta Corriente', sDirVendedor), [oForceShowModal, oForceDB, oAlwaysShowDialog], True, '', '', True);
    end;
end;

procedure TqrCuentaCorriente.QRDBDebitoPrint(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

end.
