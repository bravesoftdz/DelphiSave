unit unRptListadosBAPRO;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   06-03-2003
 ULTIMA MODIFICACION: 25-03-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Db, SDEngine, Qrctrls, unPrincipal, unDmPrincipal;

type
  TfrmRPTListadosBAPRO = class(TForm)
    qrComisionesPorVendedor: TQuickRep;
    sdqConsulta: TSDQuery;
    sdqParametro: TSDQuery;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape3: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRImage1: TQRImage;
    qrDetallePagoPorEntidad: TQuickRep;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel1: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRImage2: TQRImage;
    QRLabel2: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel27: TQRLabel;
    QRDBText21: TQRDBText;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    qrResumenBAPRO: TQuickRep;
    QRBand5: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRBand6: TQRBand;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRBand7: TQRBand;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRImage3: TQRImage;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    qrDetalleBAPRO: TQuickRep;
    QRBand8: TQRBand;
    QRBand9: TQRBand;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel48: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRBand10: TQRBand;
    QRDBText38: TQRDBText;
    QRShape8: TQRShape;
    QRDBText39: TQRDBText;
    QRLabel65: TQRExpr;
    QRLabel66: TQRExpr;
    QRLabel67: TQRExpr;
    QRLabel68: TQRExpr;
    QRLabel49: TQRLabel;
    QRShape7: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRBand11: TQRBand;
    QRLabel63: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRShape9: TQRShape;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRBand12: TQRBand;
    QRLabel62: TQRLabel;
    QRExpr27: TQRExpr;
    QRLabel61: TQRLabel;
    QRExpr28: TQRExpr;
    QRLabel60: TQRLabel;
    QRImage4: TQRImage;
    QRGroup3: TQRGroup;
    QRLabel28: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape5: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRBand13: TQRBand;
    QRLabel39: TQRLabel;
    QRShape6: TQRShape;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr21: TQRExpr;
    procedure FormatHojaNro(sender: TObject; var Value: String);
    procedure FormatCurrency (sender: TObject;  var Value: String);

  private
    procedure PreviewReportes (codigo : string);
  public
    procedure Prepare;
  end;

implementation
{$R *.DFM}

uses
  unArt, unSesion;

procedure TfrmRPTListadosBAPRO.Prepare;
var
  sSql : string;

begin
  sSql := 'SELECT TB_CODIGO ' +
          '  FROM CTB_TABLAS ' +
          ' WHERE TB_CLAVE = ''CBDBF''' +
          '   AND TB_CODIGO <> 0';
  OpenQuery ( sdqParametro, sSql, True );

  While not sdqParametro.Eof do
  begin
    PreviewReportes( sdqParametro.FieldByName('tb_codigo').AsString );
    //Sigue con los campos restantes
    sdqParametro.Next;
  end;
end;

procedure TfrmRPTListadosBAPRO.PreviewReportes (codigo : string);
var
  sSql : string;
begin
{
 Hay 4 tipos de reportes:
 1) Total de Comisiones por vendedor (corte = 01 y entidad = 9000)
 2) Resumen BaPro (corte = 01 y entidad <> 9000)
 3) Detalle BaPro (corte = 01 y entidad <> 9000)
 4) Detalle de Pagos Por Entidad (corte 02 al 06)
}
  if codigo = '01' then
  begin
  // TOTAL DE COMISIONES POR VENDEDOR
    sSQL := 'SELECT NVL(CB_SUCURSAL, EN_CODBANCO) CODORG, EN_NOMBRE, ' +
            '       VE_VENDEDOR CODVEND, SUM(CB_COBRADONETO) COBRADONETO, SUM(CB_COMISION) COMISION, ' +
            '       SUM(CB_OS) RET_OS, SUM(CB_COMISIONNETA) COM_NETA ' +
            '  FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, TCB_COMISIONESBANCO ' +
            ' WHERE EV_ID = CB_IDENTIDADVEND ' +
            '   AND EN_ID = EV_IDENTIDAD ' +
            '   AND VE_ID = EV_IDVENDEDOR ' +
            '   AND CB_USUALTA = ''' + Sesion.UserID + '''' +
            '   AND CB_CORTE = ''01'' ' +
            '   AND EN_ID = 9000 ' +
            '   AND EN_MODOLIQ = ''03''' +
            ' GROUP BY CB_SUCURSAL, EN_CODBANCO, EN_NOMBRE, VE_VENDEDOR';
    OpenQuery ( sdqConsulta, sSQL, True );
    if sdqConsulta.Eof then
       MessageDlg('El reporte "Total de comisiones por vendedor" no posee datos', mtInformation, [mbOK], 0)
    else
    begin
      qrimage1.Picture.Bitmap.LoadFromResourceName( hInstance, RES_EMP_LOGO_BN ); { By Fede }
      qrComisionesPorVendedor.PreviewModal;
    end;

    sSQL := 'SELECT NVL(CB_SUCURSAL, EN_CODBANCO) CODORG, EN_NOMBRE, ' +
            '       VE_VENDEDOR CODVEND, VE_NOMBRE, SUM(CB_COBRADONETO) COBRADONETO, SUM(CB_COMISION) COMISION, ' +
            '       SUM(CB_OS) RET_OS, SUM(CB_COMISIONNETA) COM_NETA ' +
            '  FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, TCB_COMISIONESBANCO ' +
            ' WHERE EV_ID = CB_IDENTIDADVEND ' +
            '   AND EN_ID = EV_IDENTIDAD ' +
            '   AND VE_ID = EV_IDVENDEDOR ' +
            '   AND CB_USUALTA = ''' + Sesion.UserID + '''' +
            '   AND CB_CORTE = ''01'' ' +
            '   AND EN_ID <> 9000 ' +
            '   AND EN_MODOLIQ = ''03''' +
            ' GROUP BY CB_SUCURSAL, EN_CODBANCO, EN_NOMBRE, VE_VENDEDOR, VE_NOMBRE';

    OpenQuery ( sdqConsulta, sSQL, True );
    if sdqConsulta.Eof then
       MessageDlg('El reporte "Resumen Banco Provincia" no posee datos', mtInformation, [mbOK], 0)
    else
    begin
      qrimage3.Picture.Bitmap.LoadFromResourceName( hInstance, RES_EMP_LOGO_BN ); { By Fede }
      qrResumenBAPRO.PreviewModal;
    end;
    sSQL := 'SELECT NVL(CB_SUCURSAL, EN_CODBANCO) CODORG, EN_NOMBRE, CB_NOMBRE RAZON, CB_CUIT CUIT,' +
            '       VE_VENDEDOR CODVEND, VE_NOMBRE, CB_COBRADONETO COBRADONETO, CB_COMISION COMISION, ' +
            '       CB_OS RET_OS, CB_COMISIONNETA COM_NETA ' +
            '  FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, TCB_COMISIONESBANCO ' +
            ' WHERE EV_ID = CB_IDENTIDADVEND ' +
            '   AND EN_ID = EV_IDENTIDAD ' +
            '   AND VE_ID = EV_IDVENDEDOR ' +
            '   AND CB_USUALTA = ''' + Sesion.UserID + '''' +
            '   AND CB_CORTE = ''01'' ' +
            '   AND EN_ID <> 9000 ' +
            '   AND EN_MODOLIQ = ''03''' +
            ' ORDER BY NVL(CB_SUCURSAL, EN_CODBANCO), VE_VENDEDOR, CUIT';

    OpenQuery ( sdqConsulta, sSQL, True );
    if sdqConsulta.Eof then
       MessageDlg('El reporte "Detalle Banco Provincia" no posee datos', mtInformation, [mbOK], 0)
    else
    begin
      qrimage4.Picture.Bitmap.LoadFromResourceName( hInstance, RES_EMP_LOGO_BN ); { By Fede }
      qrDetalleBAPRO.PreviewModal;
    end;
  end
  else
  begin
  // DETALLE DE PAGOS POR ENTIDAD
    sSQL := 'SELECT CB_NOMBRE RAZON , CB_CUIT CUIT, NVL(CB_SUCURSAL, EN_CODBANCO) CODORG, EN_NOMBRE, ' +
            '       CB_COBRADONETO COBRADONETO, CB_COMISION COMISION, ' +
            '       CB_OS RET_OS, CB_COMISIONNETA COM_NETA ' +
            '  FROM XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, TCB_COMISIONESBANCO ' +
            ' WHERE EV_ID = CB_IDENTIDADVEND ' +
            '   AND EN_ID = EV_IDENTIDAD ' +
            '   AND CB_USUALTA = ''' + Sesion.UserID + '''' +
            '   AND CB_CORTE = ''' + codigo + ''' ' +
            '   AND EN_MODOLIQ = ''03''';
    OpenQuery ( sdqConsulta, sSQL, True );
    if sdqConsulta.Eof then
       MessageDlg('El reporte "Detalle de pagos por entidad Corte (' + codigo + ')" no posee datos', mtInformation, [mbOK], 0)
    else
    begin
      qrimage2.Picture.Bitmap.LoadFromResourceName( hInstance, RES_EMP_LOGO_BN ); { By Fede }
      qrDetallePagoPorEntidad.PreviewModal;
    end;
  end;
end;

procedure TfrmRPTListadosBAPRO.FormatHojaNro(sender: TObject; var Value: String);
begin
  Value := 'Hoja ' + Value;
end;

procedure TfrmRPTListadosBAPRO.FormatCurrency (sender: TObject;  var Value: String);
begin
  Value := CurrToStrF(StrToCurr(Value), ffCurrency, 2);
end;

end.
