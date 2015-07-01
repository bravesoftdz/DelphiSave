unit unRptInfoPLA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls;

type
  TfrmRptInfoPLA = class(TForm)
    rptInfoPLA: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    qrlFecha: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape12: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape5: TQRShape;
    QRLabel21: TQRLabel;
    lblCantFilt: TQRLabel;
    lblMontoFilt: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    lblCantTotal: TQRLabel;
    lblMontoTotal: TQRLabel;
    lblPorcCant: TQRLabel;
    lblPorcMonto: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    lblCEst: TQRLabel;
    lblMEst: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    procedure Imprimir(dFDesde: TDate; dFHasta: TDate; cMonto: Currency);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRptInfoPLA: TfrmRptInfoPLA;

implementation

{$R *.dfm}

uses unDmPrincipal, strfuncs;


procedure TfrmRptInfoPLA.Imprimir(dFDesde: TDate; dFHasta: TDate; cMonto: Currency);
var sSqlTotal, sSqlFilt: String;
    iCantTotal, iCantFilt: integer;
    cMontoTotal, cMontoFilt: Currency;
begin
  //qrlFecha.Caption := ValorSql('select trunc(SYSDATE) from dual');
  qrlFecha.Caption := DateToStr(dFHasta);
  sSqlTotal := 'SELECT SUM(monto) mo, SUM(cant) ca' +
               '  FROM ( SELECT ca_clave cuit, ca_descripcion descripcion, SUM(art.amebpba.get_montopagado(vo_volante)) monto, COUNT(DISTINCT ca_clave) cant' +
               '           FROM art.svo_volantes, art.cpr_prestador' +
               '          WHERE ca_identificador = vo_prestador' +
                     '      AND vo_fechapago BETWEEN TO_DATE(:fdesde, ''dd/mm/yyyy'') AND TO_DATE(:fhasta, ''dd/mm/yyyy'')' +
                     ' GROUP BY ca_clave, ca_descripcion ' +
                       ' HAVING SUM(art.amebpba.get_montopagado(vo_volante)) > 0) ';
  with GetQueryEx(sSqlTotal, [datetostr(dFDesde), datetostr(dFHasta)]) do
  begin
    iCantTotal := FieldByName('ca').AsInteger;
    cMontoTotal := FieldByName('mo').AsCurrency;
  end;

  sSqlFilt := 'SELECT SUM(monto) mo, SUM(cant) ca' +
              '  FROM ( SELECT ca_clave cuit, ca_descripcion descripcion, SUM(art.amebpba.get_montopagado(vo_volante)) monto, COUNT(DISTINCT ca_clave) cant' +
              '           FROM art.svo_volantes, art.cpr_prestador' +
              '          WHERE ca_identificador = vo_prestador' +
                    '      AND vo_fechapago BETWEEN TO_DATE(:fdesde, ''dd/mm/yyyy'') AND TO_DATE(:fhasta, ''dd/mm/yyyy'')' +
                    ' GROUP BY ca_clave, ca_descripcion ' +
                     '  HAVING SUM(art.amebpba.get_montopagado(vo_volante)) >= :monto)';

  with GetQueryEx(sSqlFilt, [datetostr(dFDesde), datetostr(dFHasta), cMonto]) do
  begin
    iCantFilt := FieldByName('ca').AsInteger;
    cMontoFilt := FieldByName('mo').AsCurrency;
  end;

  lblCantTotal.Caption := IntToStr(iCantTotal);
  lblMontoTotal.Caption := Get_AjusteDecimales(CurrToStr(cMontoTotal), '$');

  lblCantFilt.Caption := IntToStr(iCantFilt);
  lblMontoFilt.Caption := Get_AjusteDecimales(CurrToStr(cMontoFilt), '$');

  if iCantTotal > 0 then
  begin
    lblPorcCant.Caption := Get_AjusteDecimales(FloatToStr(iCantFilt / iCantTotal * 100), '%', 2, False, False, 'D');
    lblPorcMonto.Caption := Get_AjusteDecimales(FloatToStr(cMontoFilt / cMontoTotal * 100), '%', 2, False, False, 'D');
  end;

  rptInfoPLA.Preview;
end;

end.
