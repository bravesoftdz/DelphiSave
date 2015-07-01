unit unRPTComisionesConsulta;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   10-02-2003
 ULTIMA MODIFICACION: 22-10-2003
}

{ *** ATENCION: Los reportes que tienen zoom en 100 dejarlos así, porque sinó
                exporta mal los pdf ***
  qrComisionesPorVendedor
  qrPagosPorEntidad
  qrPagosPorVendedor
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, QuickRpt, ExtCtrls, Qrctrls,
  jpeg;

type
  TOrdenReport = (toCodigo, toDescripcion);

  TfrmRPTComisionesConsulta = class(TForm)
    qrComisionesPorVendedor: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    sdqHeader: TSDQuery;
    sdqBody: TSDQuery;
    qrPagosPorVendedor: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrCertificadoObraSocial: TQuickRep;
    qrbPageHeaderOS: TQRBand;
    qrlblNroRetencion: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel29: TQRLabel;
    qrlblCUIT: TQRLabel;
    qrlblTel: TQRLabel;
    qrlblCPostal: TQRLabel;
    qrlblDireccion: TQRLabel;
    qrlblNombre: TQRLabel;
    qrbPageFooterOS: TQRBand;
    QRDBText29: TQRDBText;
    qrdbNombre: TQRDBText;
    QRLabel37: TQRLabel;
    qrdbFirma: TQRDBImage;
    qrCertificadoIngresosBrutosBsAs: TQuickRep;
    QRBand5: TQRBand;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    qrlblCuit2: TQRLabel;
    qrlblTel2: TQRLabel;
    qrlblCPostal2: TQRLabel;
    qrlblDireccion2: TQRLabel;
    qrlblNombre2: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel61: TQRLabel;
    QRBand6: TQRBand;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    qrlblFecha: TQRLabel;
    qrCertificadoIngresosBrutosResto: TQuickRep;
    QRBand7: TQRBand;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qrlblCuit3: TQRLabel;
    qrlblTel3: TQRLabel;
    qrlblCPostal3: TQRLabel;
    qrlblDireccion3: TQRLabel;
    qrlblNombre3: TQRLabel;
    QRLabel78: TQRLabel;
    qrlblConvenio3: TQRLabel;
    QRLabel80: TQRLabel;
    QRDBText44: TQRDBText;
    QRShape9: TQRShape;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRLabel73: TQRLabel;
    qrCertificadoIngresosBrutosSalta: TQuickRep;
    QRBand9: TQRBand;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    qrlblCUIT4: TQRLabel;
    QRDBText64: TQRDBText;
    QRBand10: TQRBand;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel96: TQRLabel;
    QRDBImage3: TQRDBImage;
    QRShape12: TQRShape;
    QRLabel40: TQRLabel;
    qrlblNombre4: TQRLabel;
    QRLabel99: TQRLabel;
    QRDBText55: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel82: TQRLabel;
    qrlblDireccion4: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel68: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRLabel69: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText52: TQRDBText;
    QRDBImage2: TQRDBImage;
    QRLabel77: TQRLabel;
    QRDBText46: TQRDBText;
    QRDBText45: TQRDBText;
    qrCertificadoIngresosBrutosCordoba: TQuickRep;
    QRBand8: TQRBand;
    QRLabel109: TQRLabel;
    qrlblCUIT1: TQRLabel;
    QRShape15: TQRShape;
    QRLabel118: TQRLabel;
    qrlblNombre1: TQRLabel;
    QRLabel120: TQRLabel;
    qrlblDireccion1: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel111: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel116: TQRLabel;
    QRShape18: TQRShape;
    QRLabel106: TQRLabel;
    QRLabel108: TQRLabel;
    QRShape20: TQRShape;
    QRLabel127: TQRLabel;
    QRShape21: TQRShape;
    QRShape17: TQRShape;
    QRLabel126: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel123: TQRLabel;
    QRLabel60: TQRLabel;
    qrComisionesPorEntidad: TQuickRep;
    QRBand11: TQRBand;
    QRBand12: TQRBand;
    qrLogo1: TQRImage;
    GrupoVendedor: TQRGroup;
    qrPagosPorEntidad: TQuickRep;
    qrbPageHeaderPagosPorEntidad: TQRBand;
    QRShape31: TQRShape;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel153: TQRLabel;
    QRDBText88: TQRDBText;
    QRShape32: TQRShape;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRDBText89: TQRDBText;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel163: TQRLabel;
    qrbDetailPagosPorEntidad: TQRBand;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    QRDBText96: TQRDBText;
    qrbSummaryPagosPorEntidad: TQRBand;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRLabel164: TQRLabel;
    QRExpr18: TQRExpr;
    qrbPageFooterPagosPorEntidad: TQRBand;
    QRExpr19: TQRExpr;
    qrlblUsuario3: TQRLabel;
    qrlPaginaPagosPorEntidad: TQRLabel;
    qreNroPaginaPagosPorEntidad: TQRExpr;
    qrbGroupPagosPorEntidad: TQRGroup;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRLabel152: TQRLabel;
    QRDBText90: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel148: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand19: TQRBand;
    QRExpr21: TQRExpr;
    qrlblUsuario2: TQRLabel;
    QRLabel167: TQRLabel;
    QRExpr22: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel25: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    sdqFirma: TSDQuery;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape4: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel147: TQRLabel;
    qrLogo4: TQRImage;
    QRBand4: TQRBand;
    QRExpr9: TQRExpr;
    qrlblUsuario4: TQRLabel;
    QRLabel146: TQRLabel;
    QRExpr10: TQRExpr;
    QRBand14: TQRBand;
    QRExpr4: TQRExpr;
    qrlblUsuario1: TQRLabel;
    QRLabel145: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel168: TQRLabel;
    QRShape1: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRShape29: TQRShape;
    QRLabel74: TQRLabel;
    QRLabel133: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText65: TQRDBText;
    QRLabel137: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;     
    QRShape30: TQRShape;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRLabel142: TQRLabel;
    QRDBText83: TQRDBText;
    qrbGroupFooterPagosPorEntidad: TQRBand;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr23: TQRExpr;
    QRLabel143: TQRLabel;
    QRBand15: TQRBand;
    QRExpr20: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRLabel144: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel141: TQRLabel;
    QRDBText85: TQRDBText;
    QRDBText99: TQRDBText;
    QRDBText84: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr26: TQRExpr;
    QRLabel169: TQRLabel;
    QRDBText100: TQRDBText;
    QRLabel170: TQRLabel;
    QRDBText101: TQRDBText;
    QRExpr27: TQRExpr;
    qrbDetailOS: TQRBand;
    QRDBText79: TQRDBText;
    QRLabel132: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText25: TQRDBText;
    QRSubDetail8: TQRBand;
    QRLabel44: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel100: TQRLabel;
    QRLabel102: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel87: TQRLabel;
    QRDBText60: TQRDBText;
    qrbDetailCORDOBA: TQRBand;
    QRShape28: TQRShape;
    QRShape26: TQRShape;
    QRShape24: TQRShape;
    QRShape23: TQRShape;
    QRShape22: TQRShape;
    QRShape19: TQRShape;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel101: TQRLabel;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRLabel104: TQRLabel;
    QRDBText70: TQRDBText;
    QRLabel105: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel107: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel103: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRShape16: TQRShape;
    QRLabel122: TQRLabel;
    lblExpedida: TQRLabel;
    lblFechaDDJJ: TQRLabel;
    QRDBText76: TQRDBText;
    QRDBImage4: TQRDBImage;
    QRDBText75: TQRDBText;
    QRLabel110: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel134: TQRDBText;
    qrlblNroComprobante2: TQRDBText;
    qrlblNroComprobante: TQRDBText;
    qrlblNroComprobante3: TQRDBText;
    QRLabel28: TQRLabel;
    qrbDetailBSAS: TQRBand;
    QRLabel62: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText38: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel42: TQRLabel;
    QRShape10: TQRShape;
    qrDomicilio: TQRDBText;
    qrCPostal: TQRDBText;
    qrbChildDetailBSAS: TQRChildBand;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel38: TQRLabel;
    QRShape11: TQRShape;
    QRLabel48: TQRLabel;
    QRDBText48: TQRDBText;
    QRShape33: TQRShape;
    QRDBText102: TQRDBText;
    QRDBText103: TQRDBText;
    QRDBText104: TQRDBText;
    QRDBText105: TQRDBText;
    QRDBText106: TQRDBText;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRDBText107: TQRDBText;
    qrCertificadoIngresosBrutosCAPFED: TQuickRep;
    qrbPageFooterCAPFED: TQRBand;
    QRDBText108: TQRDBText;
    QRDBText109: TQRDBText;
    QRLabel177: TQRLabel;
    QRDBImage5: TQRDBImage;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    qrbPageHeaderCAPFED: TQRBand;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    qrlblCUIT5: TQRLabel;
    qrlblTel5: TQRLabel;
    qrlblCPostal5: TQRLabel;
    qrlblDireccion5: TQRLabel;
    qrlblNombre5: TQRLabel;
    QRLabel191: TQRLabel;
    QRLabel192: TQRLabel;
    QRLabel193: TQRLabel;
    QRLabel194: TQRLabel;
    QRShape38: TQRShape;
    QRDBText110: TQRDBText;
    qrbDatosSujetoCAPFED: TQRBand;
    QRLabel196: TQRLabel;
    QRLabel197: TQRLabel;
    QRLabel198: TQRLabel;
    QRDBText112: TQRDBText;
    QRDBText113: TQRDBText;
    QRDBText114: TQRDBText;
    QRDBText115: TQRDBText;
    QRLabel200: TQRLabel;
    QRDBText116: TQRDBText;
    QRDBText117: TQRDBText;
    qrbDatosOperacionCAPFED: TQRChildBand;
    QRLabel201: TQRLabel;
    QRLabel203: TQRLabel;
    QRDBText118: TQRDBText;
    QRDBText120: TQRDBText;
    QRShape40: TQRShape;
    QRLabel205: TQRLabel;
    QRDBText121: TQRDBText;
    QRLabel184: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel185: TQRLabel;
    QRLabel186: TQRLabel;
    QRLabel187: TQRLabel;
    QRLabel188: TQRLabel;
    qrbEspacio1CAPFED: TQRChildBand;
    qrbEspacio2CAPFED: TQRChildBand;
    QRLabel189: TQRLabel;
    QRLabel190: TQRLabel;
    QRLabel199: TQRMemo;
    QRLabel183: TQRLabel;
    QRLabel195: TQRLabel;
    QRLabel204: TQRLabel;
    QRLabel206: TQRLabel;
    QRLabel207: TQRLabel;
    QRLabel208: TQRLabel;
    QRLabel209: TQRLabel;
    QRLabel210: TQRLabel;
    QRLabel211: TQRLabel;
    QRDBText123: TQRDBText;
    QRLabel212: TQRLabel;
    QRDBText124: TQRDBText;
    QRDBText125: TQRDBText;
    QRShape39: TQRShape;
    QRLabel213: TQRLabel;
    QRDBText126: TQRDBText;
    QRLabel202: TQRLabel;
    QRLabel214: TQRLabel;
    QRLabel215: TQRLabel;
    QRLabel216: TQRLabel;
    QRLabel217: TQRLabel;
    QRDBText122: TQRDBText;
    QRLabel219: TQRLabel;
    QRLabel220: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRImage1: TQRImage;
    QRDBText119: TQRDBText;
    QRDBText111: TQRLabel;
    qrbSubTotalSegunMODO_LIQ_Vendedor: TQRChildBand;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRLabel221: TQRLabel;
    QRExpr33: TQRExpr;
    QRGroup1: TQRGroup;
    qrbSubtotalSegunEN_MODOLIQ: TQRBand;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRLabel222: TQRLabel;
    QRExpr36: TQRExpr;
    QRGroup2: TQRGroup;
    qrbSubtotalEN_MODOLIQ: TQRBand;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRLabel218: TQRLabel;
    QRExpr30: TQRExpr;
    QRLabel223: TQRLabel;
    QRDBText127: TQRDBText;
    QRExpr37: TQRExpr;
    QRLabel224: TQRLabel;
    QRDBText128: TQRDBText;
    QRShape3: TQRShape;
    QRShape42: TQRShape;
    qrLogo3: TQRImage;
    QRShape41: TQRShape;
    QRShape43: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText129: TQRDBText;
    QRLabel225: TQRLabel;
    QRDBText130: TQRDBText;
    QRLabel226: TQRLabel;
    QRDBText131: TQRDBText;
    QRLabel227: TQRLabel;
    QRDBText132: TQRDBText;
    imgLogo: TQRImage;
    QRLabel228: TQRLabel;
    QRDBText133: TQRDBText;
    QRLabel229: TQRLabel;
    QRLabel230: TQRLabel;
    QRLabel231: TQRLabel;
    QRLabel232: TQRLabel;
    QRLabel233: TQRLabel;
    QRLabel234: TQRLabel;
    QRLabel235: TQRLabel;
    QRLabel236: TQRLabel;
    QRLabel237: TQRLabel;
    QRLabel238: TQRLabel;
    QRLabel239: TQRLabel;
    QRLabel240: TQRLabel;
    QRDBText134: TQRDBText;
    procedure FormatCuit(sender: TObject; var Value: String);
    procedure qrlblFechaPrint(sender: TObject; var Value: String);
    procedure AlicuotaPrint(sender: TObject; var Value: String);
    procedure ConvertirACurrency(sender: TObject; var Value: String);
    procedure lblFechaDDJJPrint(sender: TObject; var Value: String);
    procedure FormatFecha(sender: TObject; var Value: String);
    procedure PrintYear(sender: TObject; var Value: String);
    procedure FormatGuion(sender: TObject; var Value: String);
    procedure qrDomicilioPrint(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure VerificoSaltoDePagina(sender: TObject; var Value: String);
    procedure FormatNroComprobante(sender: TObject; var Value: String);
    procedure FormatNroComprobanteCAPFED(sender: TObject; var Value: String);
    procedure qrPagosPorVendedorBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrbSubtotalSegunEN_MODOLIQBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbPageHeaderPagosPorEntidadBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FNombreReport : String;
    FLiquidacion  : String;
    FIdFirma      : String;
    FOrdenReport: TOrdenReport;
    FSaltoPagina: Boolean;
    FMasivo: boolean;
    FMantCuenta: Boolean;

    procedure SetIdFirma(const Value: String);
    procedure SetSaltoPagina(const Value: Boolean);
    procedure CargarRetencionIB(SqlIB, CodDGI: String);
  protected
    bTodaviaNoImprimio: boolean;
    nCantidadSubtotales: byte;
  public
    function Prepare: Boolean;

    procedure PreviewRetencionIB(bPreview: Boolean);

    property NombreReport : String read FNombreReport write FNombreReport;
    property Liquidacion  : String read FLiquidacion  write FLiquidacion;
    property IdFirma      : String read FIdFirma      write SetIdFirma;

    property OrdenReport  : TOrdenReport read FOrdenReport write FOrdenReport;
    property SaltoPagina  : Boolean      read FSaltoPagina write SetSaltoPagina;
    property Masivo       : Boolean      read FMasivo      write FMasivo;
    property MantCuenta   : Boolean      read FMantCuenta  write FMantCuenta;
  end;

implementation

{$R *.DFM}

uses
  unDmPrincipal, unPrincipal, unART, StrFuncs, General, unSesion, AnsiSql, unExportPDF,
  SqlFuncs;

const
  { TODO -oFFirenze -cMejora : Si esta Constante solo se va a usar en un procedimiento, declarala en el procedimiento
  RTA : ver unComisionConsulta}
  CONSULTA_FIRMA : string = 'SELECT FI_ID, FI_FIRMA, FI_FIRMANTE, FI_CARACTER ' +
                             ' FROM CFI_FIRMA ' +
                            ' WHERE FI_FECHABAJA IS NULL ' +
                              ' AND FI_ID =:FI_ID ';
  DGI_RESTO      : array [0..3] of string = (DGI_SALTA, DGI_BUENOS_AIRES, DGI_CORDOBA, DGI_CAPITAL_FEDERAL);


function TfrmRPTComisionesConsulta.Prepare: boolean;
var
  sSQL : string;
  Year, Month, Day: Word;
begin
  if NombreReport = 'qrPagosPorVendedor' then
  begin
    imgLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_2009_BYN_CHICO');
    qrlblUsuario2.Caption := Sesion.Usuario;

    QRLabel148.Caption := 'DETALLE DE PAGOS';

    //Cargo el SQL a ejecutar
    sSQL := 'SELECT LC_ID, en_id "Cod. Entidad", en_nombre "Nombre Entidad", NVL(en_codbanco,''-'') "Cod. Sucursal",' +
                  ' lc_fechaliq "Fecha", comision.get_nrofactura(lc_id) nrofactura  ' +
             ' FROM XEN_ENTIDAD, XLC_LIQCOMISION ' +
           '  WHERE LC_IDENTIDAD = EN_ID  ' +
              ' AND LC_IDENTIDAD IS NOT NULL  ' +
              ' AND LC_ESTADO <> ''C'' ' +
              ' AND LC_ID = :LC_ID ' +

        ' UNION ALL' +

           ' SELECT LC_ID, en_id "Cod. Entidad", en_nombre "Nombre Entidad", NVL(en_codbanco,''-'') "Cod. Sucursal", ' +
                  ' lc_fechaliq "Fecha", comision.get_nrofactura(lc_id) nrofactura  ' +
             ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION ' +
            ' WHERE LC_IDENTIDADVENDEDOR = EV_ID  ' +
              ' AND EV_IDVENDEDOR = VE_ID  ' +
              ' AND EV_IDENTIDAD = EN_ID  ' +
              ' AND LC_IDENTIDADVENDEDOR IS NOT NULL  ' +
              ' AND LC_ESTADO <> ''C'' ' +
              ' AND LC_ID = :LC_ID ';

    sdqHeader.Sql.Clear;
    SdqHeader.Sql.Add(sSQL);
    sdqHeader.ParamByName('LC_ID').AsString := Liquidacion;
    OpenQuery(sdqHeader);

    //Cargo el SQL a ejecutar
    sSQL := 'SELECT VE_VENDEDOR, VE_NOMBRE "Nombre Vendedor", CO_CONTRATO "Contrato", EM_NOMBRE' +
                  ' "Razón Social", PC_PERIODO "Período", PC_COBRADO "Total Cobrado", PC_COBRADONETO' +
                  ' "Cobrado Neto de Impuestos", PC_COMISION "Comisión", EN_MODOLIQ, CO_DESCRIPCION Concepto' +
             ' FROM XCO_CONCEPTO, XEN_ENTIDAD, XVE_VENDEDOR, AEM_EMPRESA, ACO_CONTRATO, AVC_VENDEDORCONTRATO, XEV_ENTIDADVENDEDOR, XPC_PAGOCOMISION' +
            ' WHERE VC_IDENTIDADVEND = EV_ID(+)' +
              ' AND EV_IDVENDEDOR = VE_ID(+)' +
              ' AND PC_IDVENDCONTRATO = VC_ID(+)' +
              ' AND VC_CONTRATO = CO_CONTRATO(+)' +
              ' AND EV_IDENTIDAD = EN_ID(+)' +
              ' AND CO_IDEMPRESA = EM_ID(+)' +
              ' AND PC_IDLIQCOMISION = :PC_IDLIQCOMISION' +
              ' AND PC_IDCONCEPTO = CO_ID' +
            ' ORDER BY ';

    case OrdenReport of
      toCodigo:
        sSQL := sSQL + '1, 3, 5';
      toDescripcion:
        sSQL := sSQL + '2, 3, 5';
    end;

    qrPagosPorVendedor.ReportTitle := 'Detalle Pagos Vend. - ' + Liquidacion;

    sdqBody.Sql.Clear;
    sdqBody.Sql.Add(sSQL);
    sdqBody.ParamByName('pc_idliqcomision').AsString := Liquidacion;
    OpenQuery(sdqBody);
    Result := not sdqBody.Eof;
  end
  else if NombreReport = 'qrPagosPorEntidad' then
  begin
    qrLogo3.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_2009_BYN_CHICO' );
    qrlblUsuario3.Caption := Sesion.Usuario;

    QRLabel149.Caption := 'DETALLE DE PAGOS ';
    if MantCuenta then
      QRLabel149.Caption := QRLabel149.Caption + 'MANTENIMIENTO'
    else
      QRLabel149.Caption := QRLabel149.Caption + 'COMISION';

    //Cargo el SQL a ejecutar
    sSQL := 'SELECT en_id "Cod. Entidad", en_nombre "Nombre Entidad", NVL(en_codbanco,''-'') "Cod. Sucursal", ' +
                   'lc_fechaliq "Fecha", LC_ID, comision.get_nrofactura(lc_id) nrofactura ' +
             ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION ' +
           '  WHERE LC_IDENTIDADVENDEDOR = EV_ID  ' +
             '  AND EV_IDVENDEDOR = VE_ID  ' +
             '  AND EV_IDENTIDAD = EN_ID  ' +
             '  AND LC_IDENTIDADVENDEDOR IS NOT NULL  ' +
              ' AND LC_ESTADO <> ''C'' ' +
             '  AND LC_ID = :LC_ID ';

    sdqHeader.Sql.Clear;
    SdqHeader.Sql.Add(sSQL);
    sdqHeader.ParamByName('LC_ID').AsString := Liquidacion;
    OpenQuery(sdqHeader);

    //Cargo el SQL a ejecutar
    sSQL := 'SELECT ve_vendedor, ve_nombre "Nombre Vendedor", co_contrato "Contrato", em_nombre' +
                  ' "Razón Social", pc_periodo "Período", pc_cobrado "Total Cobrado", pc_cobradoneto ' +
                  ' "Cobrado Neto de Impuestos", pc_comision "Comisión", LC_ID, co_descripcion "Concepto" ' +
             ' FROM XCO_CONCEPTO, XVE_VENDEDOR, AEM_EMPRESA, ACO_CONTRATO, AVC_VENDEDORCONTRATO, XEV_ENTIDADVENDEDOR, XPC_PAGOCOMISION, XLC_LIQCOMISION' +
            ' WHERE VC_IDENTIDADVEND = EV_ID(+)' +
              ' AND EV_IDVENDEDOR = VE_ID(+)' +
              ' AND PC_IDVENDCONTRATO = VC_ID(+)' +
              ' AND VC_CONTRATO = CO_CONTRATO(+)' +
              ' AND CO_IDEMPRESA = EM_ID(+)' +
              ' AND LC_ESTADO <> ''C'' ' +
              ' AND PC_IDLIQCOMISION = LC_ID' +
              ' AND PC_IDCONCEPTO = CO_ID ' +
//              ' AND '''' || VC_IDCONCEPTO ' + Iif(MantCuenta, '=', '<>') + ' 2' +   // 2: Mantenimiento
              ' AND (EV_IDENTIDAD, LC_IDCIERREPAGO) = ( SELECT EN_ID, LC_IDCIERREPAGO' +
                                                        ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
                                                       ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
                                                         ' AND EV_IDVENDEDOR = VE_ID' +
                                                         ' AND EV_IDENTIDAD = EN_ID' +
                                                         ' AND LC_ESTADO <> ''C'' ' +
                                                         ' AND LC_ID = :PC_IDLIQCOMISION )' +
            ' ORDER BY ';

    case OrdenReport of
      toCodigo:
        sSQL := sSQL + '1, 3, 5';
      toDescripcion:
        sSQL := sSQL + '2, 3, 5';
    end;

    qrPagosPorEntidad.ReportTitle := 'Detalle Pagos Ent. - ' + Liquidacion;

    sdqBody.Sql.Clear;
    sdqBody.Sql.Add(sSQL );
    sdqBody.ParamByName('pc_idliqcomision').AsString := Liquidacion;
    OpenQuery(sdqBody);
    Result := not sdqBody.Eof;
  end
  else if NombreReport = 'qrComisionesPorVendedor' then
  begin
    qrLogo1.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
    qrlblUsuario1.Caption := Sesion.Usuario;

    //Cargo el SQL a ejecutar
    sSQL := 'SELECT LC_ID, en_id "Cod. Entidad", en_nombre "Nombre Entidad", NVL(en_codbanco,''-'') "Cod. Sucursal",' +
                  ' lc_fechaliq "Fecha",' +
                  ' LC_COMISION, LC_IVA, LC_OBRASOCIAL, LC_INGBRUTOS, LC_COMISIONNETA, LC_GANANCIAS, LC_RETIVA, comision.get_nrofactura(lc_id) nrofactura ' +
             ' FROM XEN_ENTIDAD, XLC_LIQCOMISION' +
            ' WHERE LC_IDENTIDAD = EN_ID' +
              ' AND LC_IDENTIDAD IS NOT NULL' +
              ' AND LC_ESTADO <> ''C'' ' +
              ' AND LC_ID = :LC_ID' +

            ' UNION ALL' +

           ' SELECT LC_ID, en_id "Cod. Entidad", en_nombre "Nombre Entidad", NVL(en_codbanco,''-'') "Cod. Sucursal",' +
                  ' lc_fechaliq "Fecha",' +
                  ' LC_COMISION, LC_IVA, LC_OBRASOCIAL, LC_INGBRUTOS, LC_COMISIONNETA, LC_GANANCIAS, LC_RETIVA, comision.get_nrofactura(lc_id) nrofactura ' +
             ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
            ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
              ' AND EV_IDVENDEDOR = VE_ID' +
              ' AND EV_IDENTIDAD = EN_ID' +
              ' AND LC_IDENTIDADVENDEDOR IS NOT NULL' +
              ' AND LC_ESTADO <> ''C'' ' +
              ' AND LC_ID = :LC_ID';

    OpenQueryEx(sdqHeader, [Liquidacion, Liquidacion], sSQL);

    //Cargo el SQL a ejecutar
    sSQL :='SELECT VE_VENDEDOR, VE_NOMBRE "Nombre Vendedor", SUM(PC_COBRADO) "Total Cobrado",' +
                 ' SUM(PC_COBRADONETO) "Cobrado Neto de Impuestos", SUM(PC_COMISION) "Comisión", EN_MODOLIQ' +
            ' FROM XEN_ENTIDAD, XVE_VENDEDOR, AVC_VENDEDORCONTRATO, XEV_ENTIDADVENDEDOR, XPC_PAGOCOMISION' +
           ' WHERE VC_IDENTIDADVEND = EV_ID ' +
             ' AND EV_IDVENDEDOR = VE_ID' +
             ' AND PC_IDLIQCOMISION = :PC_IDLIQCOMISION' +
             ' AND PC_IDVENDCONTRATO = VC_ID' +
             ' AND EV_IDENTIDAD = EN_ID' +
           ' GROUP BY VE_VENDEDOR, VE_NOMBRE, EN_MODOLIQ' +
           ' ORDER BY ';

    case OrdenReport of
      toCodigo:
        sSQL := sSQL + '1';
      toDescripcion:
        sSQL := sSQL + '2';
    end;

    qrComisionesPorVendedor.ReportTitle := 'Comis. por Vend. - ' + Liquidacion;

    OpenQueryEx(sdqBody, [Liquidacion], sSQL);
    Result := not sdqBody.Eof;
  end
  else if NombreReport = 'qrComisionesPorEntidad' then
  begin
    qrLogo4.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_ART' );
    qrLogo4.Update;
    qrlblUsuario4.Caption := Sesion.Usuario;

    //Cargo el SQL a ejecutar
    sSQL := 'SELECT EN_ID "COD. ENTIDAD", EN_NOMBRE "NOMBRE ENTIDAD", NVL(EN_CODBANCO, ''-'') "COD. SUCURSAL", ' +
            '       LC_FECHALIQ "FECHA", LC_ID, comision.get_nrofactura(lc_id) nrofactura ' +
            '  FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
            ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
            '   AND EV_IDVENDEDOR = VE_ID' +
            '   AND EV_IDENTIDAD = EN_ID' +
              ' AND LC_ESTADO <> ''C'' ' +
            '   AND LC_ID = :LC_ID ';

    OpenQueryEx(sdqHeader, [Liquidacion], sSQL);

    //Cargo el SQL a ejecutar
    sSQL := 'SELECT TO_NUMBER(Replace(Replace(VE_Vendedor,''.''),''-'')) as ORDEN,' +
                  ' LC_ID, VE_VENDEDOR, VE_NOMBRE "NOMBRE VENDEDOR",' +
                  ' COMISION.Get_MontoTotalCobrado(LC_ID) "TOTAL COBRADO", LC_COBRADONETO "COBRADO NETO DE IMPUESTOS", LC_COMISION "COMISIÓN",' +
                  ' LC_IVA, LC_OBRASOCIAL, LC_INGBRUTOS, LC_COMISIONNETA, LC_GANANCIAS, LC_RETIVA ' +
             ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
            ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
              ' AND EV_IDVENDEDOR = VE_ID' +
              ' AND EV_IDENTIDAD = EN_ID' +
              ' AND LC_ESTADO <> ''C'' ' +
              ' AND LC_COMISION <> 0 ' +
              ' AND (EN_ID, LC_IDCIERREPAGO) = ( SELECT EN_ID, LC_IDCIERREPAGO' +
                                                 ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
                                                ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
                                                  ' AND EV_IDVENDEDOR = VE_ID' +
                                                  ' AND EV_IDENTIDAD = EN_ID' +
                                                  ' AND LC_ESTADO <> ''C'' ' +
                                                  ' AND LC_ID = :LC_ID)' +
            ' ORDER BY ';

    case OrdenReport of
      toCodigo:
        sSQL := sSQL + '1';
      toDescripcion:
        sSQL := sSQL + '4';
    end;

    qrComisionesPorEntidad.ReportTitle := 'Comis. por Ent. - ' + Liquidacion;

    OpenQueryEx(sdqBody, [Liquidacion], sSQL);
    Result := not sdqBody.Eof;
  end
  else if (NombreReport = 'qrCertificadoObraSocial') then
  begin
    //Genera el encabezado
    qrlblNombre.Caption := TXT_EMP_NOMBRE_LARGO;
    qrlblDireccion.Caption := TXT_EMP_DOMICILIO;
    qrlblCpostal.Caption := TXT_EMP_CPOSTAL;
    qrlblTel.Caption := TXT_EMP_TELEFONO;
    qrlblCUIT.Caption := TXT_EMP_CUITCONFORMATO;
    qrlblNroRetencion.Caption := TXT_EMP_AGENTE_RETENCION_OS;

    sSQL := 'SELECT NULL VE_VENDEDOR, NULL VE_NOMBRE, lc_fechaliq "Fecha de Retención", comision.get_baseimponible(lc_id, lc_fechaliq, ''OS'') "Monto Imponible", lc_obrasocial "Retención", ' +
                   'en_nombre "Nombre Entidad", en_cuit "CUIT", en_numosocial "NOS", LC_ID, comision.get_nrofactura(lc_id) nrofactura  ' +
             ' FROM XEN_ENTIDAD, XLC_LIQCOMISION ' +
            ' WHERE LC_IDENTIDAD = EN_ID  ' +
              ' AND LC_IDENTIDAD IS NOT NULL  ' +
              ' AND LC_OBRASOCIAL <> 0 ' +
              ' AND LC_ESTADO <> ''C'' ' +
              string(iif(not Masivo,
              ' AND LC_ID = :ID ',
              ' AND (EN_ID, LC_IDCIERREPAGO) = ( SELECT EN_ID, LC_IDCIERREPAGO' +
                                                 ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
                                                ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
                                                  ' AND EV_IDVENDEDOR = VE_ID' +
                                                  ' AND EV_IDENTIDAD = EN_ID' +
                                                  ' AND LC_ESTADO <> ''C'' ' +
                                                  ' AND LC_ID = :ID )'));
            sSQL := sSQL + ' UNION ALL ' +


            'SELECT VE_VENDEDOR, VE_NOMBRE, lc_fechaliq "Fecha de Retención", comision.get_baseimponible(lc_id, lc_fechaliq, ''OS'') "Monto Imponible", lc_obrasocial "Retención", ' +
                   've_nombre "Nombre Entidad", ve_cuit "CUIT", ve_numosocial "NOS", LC_ID, comision.get_nrofactura(lc_id) nrofactura ' +
             ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION ' +
            ' WHERE LC_IDENTIDADVENDEDOR = EV_ID  ' +
              ' AND EV_IDVENDEDOR = VE_ID  ' +
              ' AND EV_IDENTIDAD = EN_ID  ' +
              ' AND LC_IDENTIDADVENDEDOR IS NOT NULL  ' +
              ' AND LC_OBRASOCIAL <> 0 ' +
              ' AND LC_ESTADO <> ''C'' ' +
              string(iif(not Masivo,
              ' AND LC_ID = :ID',
              ' AND (EV_IDENTIDAD, LC_IDCIERREPAGO) = ( SELECT EN_ID, LC_IDCIERREPAGO' +
                                                        ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
                                                       ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
                                                         ' AND EV_IDVENDEDOR = VE_ID' +
                                                         ' AND EV_IDENTIDAD = EN_ID' +
                                                         ' AND LC_ESTADO <> ''C'' ' +
                                                         ' AND LC_ID = :ID)'));
            sSQL := sSQL + ' ORDER BY ';

    case OrdenReport of
      toCodigo:
        sSQL := sSQL + '1';
      toDescripcion:
        sSQL := sSQL + '2';
    end;

    qrCertificadoObraSocial.ReportTitle := 'Certif. Ret. OS - ' + Liquidacion;
    OpenQueryEx(sdqHeader, [Liquidacion, Liquidacion], sSQL);

    Result := not sdqHeader.Eof;
  end
  else if (NombreReport = 'qrCertificadoIngresosBrutos') or (NombreReport = 'qrCertificadoIngresosBrutosEntidad') then
  begin
    sSQL := 'SELECT NULL VE_VENDEDOR, NULL VE_NOMBRE, TRUNC(LC_FECHALIQ) "Fecha de Retención", TRUNC(LC_FECHALIQ) "Fecha Actual", pv_descripcion "Provincia", lc_fechaAprobado, nvl(il_comprobante, 0) NroComprobante, ' +
                   'il_neto "Monto Imponible", il_retencion "Retención", en_nombre "Nombre Entidad", lc_facturanro, ' +
                   'en_cuit "CUIT", en_numingbrutos "NIB", pv_codigodgi, ib_inscripcion "Agente Retención", ART.COMISION.GET_TASAIB(IL_PROVINCIA, ''01'', EN_ID, NULL)*100 "Alícuota", il_fecha, ' +
                   'ART.UTILES.ARMAR_DOMICILIO(EN_CALLE,EN_NUMERO,EN_PISO,EN_DEPARTAMENTO,NULL) Domicilio, ' +
                   'EN_CPOSTAL CPostal, LC_ID, COMISION.Get_MontoTotalCobrado(LC_ID), DECODE(EN_CONVENIO, ''S'', ''Convenio Multilateral'', ''Local'') as CONVENIO, comision.get_nrofactura(lc_id) nrofactura ' +
             ' FROM XEN_ENTIDAD, CPV_PROVINCIAS, XIL_IBLIQUIDACION, OIB_INGRESOSBRUTOS, XLC_LIQCOMISION ' +
            ' WHERE LC_IDENTIDAD = EN_ID  ' +
              ' AND IB_PROVINCIA = PV_CODIGO ' +
              ' AND IB_CONCEPTO = ''01'' ' +
              ' AND IL_IDLIQUIDACION = LC_ID ' +
              ' AND PV_CODIGO = IL_PROVINCIA ' +
              ' AND IL_RETENCION <> 0 ' +
              ' AND LC_ESTADO <> ''C'' ' +
              string(iif(NombreReport = 'qrCertificadoIngresosBrutos',
              ' AND LC_ID = :ID ',
              ' AND (EN_ID, LC_IDCIERREPAGO) = ( SELECT EN_ID, LC_IDCIERREPAGO' +
                                                 ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
                                                ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
                                                  ' AND EV_IDVENDEDOR = VE_ID' +
                                                  ' AND EV_IDENTIDAD = EN_ID' +
                                                  ' AND LC_ESTADO <> ''C'' ' +
                                                  ' AND LC_ID = :ID )'));
            sSQL := sSQL + ' UNION ALL ' +

            'SELECT VE_VENDEDOR, VE_NOMBRE, TRUNC(LC_FECHALIQ) "Fecha de Retención", TRUNC(LC_FECHALIQ) "Fecha Actual", pv_descripcion "Provincia", lc_fechaAprobado, nvl(il_comprobante, 0) NroComprobante, ' +
                   'il_neto "Monto Imponible", il_retencion "Retención", ve_nombre "Nombre Entidad", lc_facturanro, ' +
                   've_cuit "CUIT", ve_numingbrutos "NIB", pv_codigodgi, ib_inscripcion "Agente Retención", ART.COMISION.GET_TASAIB(IL_PROVINCIA, ''01'', NULL, EV_ID)*100 "Alícuota", il_fecha, ' +
                   'ART.UTILES.ARMAR_DOMICILIO(VE_CALLE,VE_NUMERO,VE_PISO,VE_DEPARTAMENTO,NULL) Domicilio, ' +
                   'VE_CPOSTAL CPostal, LC_ID, COMISION.Get_MontoTotalCobrado(LC_ID), DECODE(VE_CONVENIO, ''S'', ''Convenio Multilateral'', ''Local'') as CONVENIO, comision.get_nrofactura(lc_id) nrofactura ' +
             ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XIL_IBLIQUIDACION, CPV_PROVINCIAS, OIB_INGRESOSBRUTOS, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION ' +
            ' WHERE LC_IDENTIDADVENDEDOR = EV_ID  ' +
              ' AND IB_PROVINCIA = PV_CODIGO ' +
              ' AND IB_CONCEPTO = ''01'' ' +
              ' AND EV_IDVENDEDOR = VE_ID  ' +
              ' AND EV_IDENTIDAD = EN_ID  ' +
              ' AND IL_IDLIQUIDACION = LC_ID  ' +
              ' AND PV_CODIGO = IL_PROVINCIA    ' +
              ' AND IL_RETENCION <> 0 ' +
              ' AND LC_ESTADO <> ''C'' ' +
              string(iif(NombreReport = 'qrCertificadoIngresosBrutos',
              ' AND LC_ID = :ID',
              ' AND (EV_IDENTIDAD, LC_IDCIERREPAGO) = ( SELECT EN_ID, LC_IDCIERREPAGO' +
                                                        ' FROM XVE_VENDEDOR, XEN_ENTIDAD, XEV_ENTIDADVENDEDOR, XLC_LIQCOMISION' +
                                                       ' WHERE LC_IDENTIDADVENDEDOR = EV_ID' +
                                                         ' AND EV_IDVENDEDOR = VE_ID' +
                                                         ' AND EV_IDENTIDAD = EN_ID' +
                                                         ' AND LC_ESTADO <> ''C'' ' +
                                                         ' AND LC_ID = :ID)'));
            sSQL := sSQL + ' ORDER BY ';

    case OrdenReport of
      toCodigo:
        sSQL := sSQL + '1';
      toDescripcion:
        sSQL := sSQL + '2';
    end;

    OpenQueryEx(sdqHeader, [Liquidacion, Liquidacion], sSQL, True);

    Result := not sdqHeader.Eof;

    //Genera el encabezado para BsAs
    qrCertificadoIngresosBrutosBsAs.ReportTitle := 'Certif. Ret. IB - ' + Liquidacion;
    qrlblNombre2.Caption := TXT_EMP_NOMBRE_LARGO;
    qrlblDireccion2.Caption := TXT_EMP_DOMICILIO;
    qrlblCpostal2.Caption := TXT_EMP_CPOSTAL;
    qrlblTel2.Caption := TXT_EMP_TELEFONO;
    qrlblCUIT2.Caption := TXT_EMP_CUITCONFORMATO;

    //Genera el encabezado para CAPFED
    qrCertificadoIngresosBrutosCAPFED.ReportTitle := 'Certif. Ret. IB - ' + Liquidacion;
    qrlblNombre5.Caption := TXT_EMP_NOMBRE_LARGO;
    qrlblDireccion5.Caption := TXT_EMP_DOMICILIO;
    qrlblCpostal5.Caption := TXT_EMP_CPOSTAL;
    qrlblTel5.Caption := TXT_EMP_TELEFONO;
    qrlblCUIT5.Caption := TXT_EMP_CUITCONFORMATO;

    //Genera el encabezado para Cordoba
    qrCertificadoIngresosBrutosCordoba.ReportTitle := 'Certif. Ret. IB - ' + Liquidacion;
    qrlblNombre1.Caption := TXT_EMP_NOMBRE_LARGO;
    qrlblDireccion1.Caption := TXT_EMP_DOMICILIO;
    qrlblCUIT1.Caption := TXT_EMP_CUITCONFORMATO;
    DecodeDate(sdqHeader.FieldByName('Fecha de Retención').AsDateTime, Year, Month, Day);
    lblExpedida.Caption := 'EXPEDIDA EN BUENOS AIRES A LOS ' + IntToStr(Day) + ' DIAS DEL MES DE ' +
                           UCase(FormatDateTime('mmmm', sdqHeader.FieldByName('Fecha de Retención').AsDateTime)) + ' DE ' + IntToStr(Year);

    //Genera el encabezado para Salta
    qrCertificadoIngresosBrutosSalta.ReportTitle := 'Certif. Ret. IB - ' + Liquidacion;
    qrlblNombre4.Caption := TXT_EMP_NOMBRE_LARGO;
    qrlblDireccion4.Caption := TXT_EMP_DOMICILIO + '(' + TXT_EMP_CPOSTAL + ')';
    qrlblCUIT4.Caption := TXT_EMP_CUITCONFORMATO;

    //Genera el encabezado para el resto
    qrCertificadoIngresosBrutosResto.ReportTitle := 'Certif. Ret. IB - ' + Liquidacion;
    qrlblNombre3.Caption := TXT_EMP_NOMBRE_LARGO;
    qrlblDireccion3.Caption := TXT_EMP_DOMICILIO;
    qrlblCpostal3.Caption := TXT_EMP_CPOSTAL;
    qrlblTel3.Caption := TXT_EMP_TELEFONO;
    qrlblCUIT3.Caption := TXT_EMP_CUITCONFORMATO;
    qrlblConvenio3.Caption := '901-183258-4';
  end
  else begin
    raise Exception.Create ('No se eligió el reporte a mostrar.');
  end
end;

procedure TfrmRPTComisionesConsulta.FormatCuit(sender: TObject; var Value: String);
var
  Cadena : string;
  iloop : integer;
begin
  //Le agrega los guiones correspondientes a la CUIT
  if length(Value)=11 then
  begin
    for iLoop := 1 to 11 do
    begin
      if ((iLoop = 2) or (iLoop = 10)) then
        Cadena := Cadena + Value[iLoop] + '-'
      else
        Cadena := Cadena + Value[iLoop];
    end;
    Value := Cadena;
  end;
end;

procedure TfrmRPTComisionesConsulta.qrlblFechaPrint(sender: TObject; var Value: String);
begin
  Value := 'Buenos Aires, ' + FormatDateTime('d "de" mmmm "de" yyyy', sdqHeader.FieldByName('Fecha de Retención').AsDateTime)
end;

procedure TfrmRPTComisionesConsulta.ConvertirACurrency(sender: TObject; var Value: String);
begin
  Value := CurrToStrF(StrToCurr(Value), ffCurrency, 2);
end;

procedure TfrmRPTComisionesConsulta.PreviewRetencionIB(bPreview: boolean);
var
  sSqlOriginal: String;
begin
  if (sdqHeader.Active and (not sdqHeader.Eof)) then
  begin
    sSqlOriginal := sdqHeader.SQL.Text;

    CargarRetencionIB(sSqlOriginal, DGI_CAPITAL_FEDERAL);
    if not sdqHeader.Eof then
      if bPreview then
        qrCertificadoIngresosBrutosCAPFED.Preview
      else
        begin
          qrCertificadoIngresosBrutosCAPFED.Print;
          Sleep(1000);
        end;

    CargarRetencionIB(sSqlOriginal, DGI_BUENOS_AIRES);
    if not sdqHeader.Eof then
      if bPreview then
        qrCertificadoIngresosBrutosBsAs.Preview
      else
        begin
          qrCertificadoIngresosBrutosBsAs.Print;
          Sleep(1000);
        end;

    CargarRetencionIB(sSqlOriginal, DGI_CORDOBA);
    if not sdqHeader.Eof then
      if bPreview then
        qrCertificadoIngresosBrutosCordoba.Preview
      else
        begin
          qrCertificadoIngresosBrutosCordoba.Print;
          Sleep(1000);
        end;

    CargarRetencionIB(sSqlOriginal, DGI_SALTA);
    if not sdqHeader.Eof then
      if bPreview then
        qrCertificadoIngresosBrutosSalta.Preview
      else
        begin
          qrCertificadoIngresosBrutosSalta.Print;
          Sleep(1000);
        end;

    //Resto del Pais
    CargarRetencionIB(sSqlOriginal, '');
    if not sdqHeader.Eof then
      if bPreview then
        qrCertificadoIngresosBrutosResto.Preview
      else
        begin
          qrCertificadoIngresosBrutosResto.Print;
          Sleep(1000);
        end;
  end;
end;

procedure TfrmRPTComisionesConsulta.AlicuotaPrint(sender: TObject; var Value: String);
begin
  Value := Value + ' %';
end;

procedure TfrmRPTComisionesConsulta.lblFechaDDJJPrint(sender: TObject; var Value: String);
var
  Fecha: TDateTime;
  Year, Month, Day, Quincena: Word;
begin
  Fecha := sdqHeader.FieldbyName('IL_FECHA').AsDateTime;
  DecodeDate(Fecha, Year, Month, Day);
   //Calcula el numero de quincena
  Quincena := Month * 2;
  if Day > 15 then
    Quincena := Quincena +1;
  //Actualiza el valor
  Value := IntToStr(Quincena) + ' DE ' + IntToStr(Year);
end;

procedure TfrmRPTComisionesConsulta.FormatFecha(sender: TObject; var Value: String);
begin
  Value := DateToStr(sdqHeader.FieldbyName('IL_FECHA').AsDateTime);
end;

procedure TfrmRPTComisionesConsulta.PrintYear(sender: TObject; var Value: String);
var
  Fecha: TDateTime;
  Year, Month, Day: Word;
begin
  Fecha := sdqHeader.FieldbyName('IL_FECHA').AsDateTime;
  DecodeDate(Fecha, Year, Month, Day);
   //Calcula el numero de quincena
  Value := strRight(IntToStr(Year),2);
end;

procedure TfrmRPTComisionesConsulta.FormatGuion(sender: TObject; var Value: String);
var
  Cadena : string;
  iLoop  : integer;
begin
  //Le agrega el guion al campo
  if length(Value)=12 then
  begin
    for iLoop := 1 to 12 do
    begin
      if (iLoop = 4) then
        Cadena := Cadena + Value[iLoop] + '-'
      else
        Cadena := Cadena + Value[iLoop];
    end;
    Value := Cadena;
  end;
end;

procedure TfrmRPTComisionesConsulta.qrDomicilioPrint(sender: TObject; var Value: String);
begin
  Value := 'Domicilio: ' + Value;
end;

procedure TfrmRPTComisionesConsulta.FormCreate(Sender: TObject);
begin
  OrdenReport := toCodigo;
end;

procedure TfrmRPTComisionesConsulta.SetIdFirma(const Value: string);
begin
  FIdFirma := Value;

  sdqFirma.SQL.Clear;
  sdqFirma.SQL.Add(CONSULTA_FIRMA);
  sdqFirma.ParamByName('FI_ID').AsString := FIdFirma;
  OpenQuery(sdqFirma);
end;

procedure TfrmRPTComisionesConsulta.SetSaltoPagina(const Value: boolean);
begin
  FSaltoPagina := Value;
  qrbGroupFooterPagosPorEntidad.Enabled := Value;
  qrbGroupPagosPorEntidad.ForceNewPage  := Value;
  qreNroPaginaPagosPorEntidad.Enabled   := Value;
  qrlPaginaPagosPorEntidad.Enabled      := Value;
  qrbSummaryPagosPorEntidad.Enabled     := not Value;

  if not Value then
    qrlPaginaPagosPorEntidad.Caption := '';
end;

procedure TfrmRPTComisionesConsulta.VerificoSaltoDePagina(Sender: TObject; var Value: String);
begin
  if SaltoPagina then
    Value := '';
end;

procedure TfrmRPTComisionesConsulta.FormatNroComprobante(Sender: TObject; var Value: String);
begin
  Value := NumberLength(StrToInt(Value), 12);
  FormatGuion(Sender, Value);
end;

procedure TfrmRPTComisionesConsulta.FormatNroComprobanteCAPFED(Sender: TObject; var Value: String);
begin
  Value := NumberLength(sdqHeader.FieldByName('NroComprobante').AsInteger, 10);
  Value := Copy(Value, 0, 4) + '-' + '2005' + '-' + Copy(Value, 5, MAXINT);
end;

procedure TfrmRPTComisionesConsulta.qrPagosPorVendedorBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  bTodaviaNoImprimio := True;
  nCantidadSubtotales := 0;
end;

procedure TfrmRPTComisionesConsulta.qrbSubtotalSegunEN_MODOLIQBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if sdqBody.FieldByName('EN_MODOLIQ').AsString = '04' then
  begin
    if not sdqBody.Eof then
      sdqBody.Next;
    if ( (((sdqBody.FieldByName('VE_VENDEDOR').AsString > '1') and bTodaviaNoImprimio)
       or  (sdqBody.RecNo {$IFDEF VER150}+ 1{$ENDIF} = sdqBody.RecordCount) or sdqBody.Eof)
       and (nCantidadSubtotales < 2) ) then
      PrintBand := True
    else
      PrintBand := False;
    if sdqBody.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF} then
      sdqBody.Prior;
  end else
    PrintBand := sdqBody.RecNo {$IFDEF VER150}+ 1{$ENDIF} = sdqBody.RecordCount;

  if PrintBand then
  begin
    bTodaviaNoImprimio := False;
    Inc(nCantidadSubtotales);
  end;
end;

procedure TfrmRPTComisionesConsulta.PageHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if IsExportingPDF then
    begin
      QRShape3.Enabled  := False;
      QRShape42.Enabled := True;
      
      QRLabel4.Color  := clWhite;
      QRLabel3.Color  := clWhite;
      QRLabel2.Color  := clWhite;
      QRLabel11.Color := clWhite;
    end
  else
    begin
      QRShape3.Enabled  := True;
      QRShape42.Enabled := False;

      QRLabel4.Color  := $00D4D4D4;
      QRLabel3.Color  := $00D4D4D4;
      QRLabel2.Color  := $00D4D4D4;
      QRLabel11.Color := $00D4D4D4;
    end;
end;

procedure TfrmRPTComisionesConsulta.qrbPageHeaderPagosPorEntidadBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if IsExportingPDF then
    begin
      QRShape31.Enabled := False;
      QRShape41.Enabled := True;

      QRLabel159.Color  := clWhite;
      QRLabel150.Color  := clWhite;
      QRLabel151.Color  := clWhite;
      QRLabel153.Color  := clWhite;
    end
  else
    begin
      QRShape31.Enabled := True;
      QRShape41.Enabled := False;

      QRLabel159.Color  := $00D4D4D4;
      QRLabel150.Color  := $00D4D4D4;
      QRLabel151.Color  := $00D4D4D4;
      QRLabel153.Color  := $00D4D4D4;
    end;
end;

procedure TfrmRPTComisionesConsulta.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if IsExportingPDF then
    begin
      QRShape2.Enabled  := False;
      QRShape43.Enabled := True;

      QRLabel17.Color  := clWhite;
      QRLabel16.Color  := clWhite;
      QRLabel15.Color  := clWhite;
      QRLabel27.Color  := clWhite;
    end
  else
    begin
      QRShape2.Enabled  := True;
      QRShape43.Enabled := False;

      QRLabel17.Color  := $00D4D4D4;
      QRLabel16.Color  := $00D4D4D4;
      QRLabel15.Color  := $00D4D4D4;
      QRLabel27.Color  := $00D4D4D4;
    end;
end;

procedure TfrmRPTComisionesConsulta.CargarRetencionIB(SqlIB, CodDGI: String);
var
  sFiltro: String;
  iLoop: Integer;
begin
  if CodDGI = '' then
    begin
      sFiltro := '';
      for iLoop := 0 to High(DGI_RESTO) do
        sFiltro := sFiltro + ' AND pv_codigodgi <> ' + SqlValue(DGI_RESTO[iloop]);

      sFiltro := '(' + StrRight(sFiltro, Length(sFiltro)-5) + ')';
    end
  else
    sFiltro := 'pv_codigodgi = ' + SqlValue(CodDGI);

  AddCondition_UNION(SqlIB, sFiltro);
  sdqHeader.Close;
  OpenQueryEx(sdqHeader, [Liquidacion, Liquidacion], SqlIB);
end;

end.

