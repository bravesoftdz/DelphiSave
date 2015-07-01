unit unRptAsignacionComision;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls,
  Forms, QuickRpt, QRCtrls, unArt, DB, SDEngine;

type
  TqrAsignacionComision = class(TQuickRep)
    tbInfo: TQRBand;
    imgLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    qrlTitulo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    sdqDatos: TSDQuery;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel35: TQRLabel;
    procedure FormatMonto(sender: TObject; var Value: String);
    procedure FormatPorc(sender: TObject; var Value: String);
    procedure FormatPorcExt(sender: TObject; var Value: String);
  private
  public
  end;

  procedure DoImprimirAsignacionComision(Id: TTableId);

implementation

uses
  unDmPrincipal, Strfuncs;

{$R *.DFM}

procedure DoImprimirAsignacionComision(Id: TTableId);
var
  sSql: String;
begin
  sSql := 'SELECT DECODE(PV_TIPO, ''I'', ''Pasaje Individual'', ''C'', ''Pasaje Cartera'', ''N'', ''Nuevo Concepto'') TIPO, ' +
                 'EM_NOMBRE, UTILES.ARMAR_CUIT(EM_CUIT) CUIT, CO_CONTRATO, AC_CODIGO, AC_DESCRIPCION, ' +
                 'CO_VIGENCIADESDE, PV_CAPITAS, PV_MASASALARIAL, PV_SUMAFIJA, PV_PORCMASA, ' +
                 'PV_VIGENCIATARIFA, PV_PRIMA, PV_DEUDA, ' +
                 'ACA_ANT.CA_CODIGO || '' - '' || ACA_ANT.CA_DESCRIPCION CANAL_ANT, ' +
                 'XEN_ANT.EN_CODBANCO || '' - '' || XEN_ANT.EN_NOMBRE ENTIDAD_ANT, ' +
                 'XVE_ANT.VE_VENDEDOR || '' - '' || XVE_ANT.VE_NOMBRE VENDEDOR_ANT, ' +
                 'VC_PORCCOMISION COMISION_ANT, ' +
                 'ACA_NVO.CA_CODIGO || '' - '' || ACA_NVO.CA_DESCRIPCION CANAL_NVO, ' +
                 'XEN_NVO.EN_CODBANCO || '' - '' || XEN_NVO.EN_NOMBRE ENTIDAD_NVO, ' +
                 'XVE_NVO.VE_VENDEDOR || '' - '' || XVE_NVO.VE_NOMBRE VENDEDOR_NVO, ' +
                 'PV_PORCCOMISION COMISION_NVO, ' +
                 'CO_DESCRIPCION DESCRCONCEPTO, UTILES.PERIODO_PONERBARRA(PV_VIGENCIADESDE) VIGENCIADESDE, ' +
                 'UTILES.PERIODO_PONERBARRA(PV_VIGENCIAHASTA) VIGENCIAHASTA, PV_OBSERVACIONES ' +
            'FROM XCO_CONCEPTO, XVE_VENDEDOR XVE_ANT, XEN_ENTIDAD XEN_ANT, XEV_ENTIDADVENDEDOR XEV_ANT, ACA_CANAL ACA_ANT, ' +
                 'XVE_VENDEDOR XVE_NVO, XEN_ENTIDAD XEN_NVO, XEV_ENTIDADVENDEDOR XEV_NVO, ACA_CANAL ACA_NVO, ' +
                 'AVC_VENDEDORCONTRATO, CAC_ACTIVIDAD, AEM_EMPRESA, ACO_CONTRATO, XPV_PASAJEVENDEDOR ' +
           'WHERE PV_ID = :Id ' +
             'AND CO_CONTRATO(+) = PV_CONTRATO ' +
             'AND EM_ID(+) = CO_IDEMPRESA ' +
             'AND AC_ID(+) = CO_IDACTIVIDAD ' +
             'AND VC_ID(+) = PV_IDVENDEDORCONTRATO ' +
             'AND XEV_ANT.EV_ID(+) = PV_IDENTVEND ' +
             'AND XEN_ANT.EN_ID(+) = XEV_ANT.EV_IDENTIDAD ' +
             'AND XVE_ANT.VE_ID(+) = XEV_ANT.EV_IDVENDEDOR ' +
             'AND ACA_ANT.CA_ID(+) = XEN_ANT.EN_IDCANAL ' +
             'AND XEV_NVO.EV_ID = PV_IDNUEVOENTVEND ' +
             'AND XEN_NVO.EN_ID = XEV_NVO.EV_IDENTIDAD ' +
             'AND XVE_NVO.VE_ID = XEV_NVO.EV_IDVENDEDOR ' +
             'AND ACA_NVO.CA_ID = XEN_NVO.EN_IDCANAL ' +
             'AND PV_IDCONCEPTO = CO_ID(+)';

   with TqrAsignacionComision.Create(nil) do
     try
       OpenQueryEx(sdqDatos, [Id], sSql);

       with sdqDatos do
         begin
           imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
           qrlTitulo.Caption := 'ASIGNACION DE COMISION - ' + FieldByName('TIPO').AsString;

           Print;
         end;
     finally
       Free;
     end;
end;

procedure TqrAsignacionComision.FormatMonto(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '$');
end;

procedure TqrAsignacionComision.FormatPorc(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '%');
end;

procedure TqrAsignacionComision.FormatPorcExt(sender: TObject; var Value: String);
begin
  Value := Get_AjusteDecimales(Value, '%', 4);
end;

end.

