unit unQRCotizador;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, Printers, QrPrntr;

type
  TqrCotizador = class(TQuickRep)
    bPanel1: TQRBand;
    bPanel2: TQRChildBand;
    bPanel3_1: TQRChildBand;
    bPanel3_2: TQRChildBand;
    bPanel3_3: TQRChildBand;
    bPanel3_4: TQRChildBand;
    bPanel3_5: TQRChildBand;
    bPanel3_6: TQRChildBand;
    bPanel3_7: TQRChildBand;
    bPanel3_8: TQRChildBand;
    bPanel4: TQRChildBand;
    bPanel5: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qyDatos: TSDQuery;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape5: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRMemo4: TQRMemo;
    QRShape6: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRLabel50: TQRLabel;
    QRShape7: TQRShape;
    QRMemo5: TQRMemo;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    QRDBText96: TQRDBText;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    QRDBText101: TQRDBText;
    QRDBText102: TQRDBText;
    QRDBText103: TQRDBText;
    QRDBText104: TQRDBText;
    QRDBText105: TQRDBText;
    QRDBText106: TQRDBText;
    QRDBText107: TQRDBText;
    QRDBText108: TQRDBText;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText109: TQRDBText;
    QRDBText110: TQRDBText;
    QRDBText111: TQRDBText;
    QRDBText112: TQRDBText;
    QRDBText113: TQRDBText;
    QRDBText114: TQRDBText;
    QRDBText115: TQRDBText;
    QRDBText116: TQRDBText;
    QRDBText117: TQRDBText;
    QRDBText118: TQRDBText;
    QRDBText119: TQRDBText;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRDBText120: TQRDBText;
    QRDBText121: TQRDBText;
    QRDBText122: TQRDBText;
    QRDBText123: TQRDBText;
    QRDBText124: TQRDBText;
    QRDBText125: TQRDBText;
    QRDBText126: TQRDBText;
    QRDBText127: TQRDBText;
    QRShape8: TQRShape;
    QRMemo2: TQRMemo;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText128: TQRDBText;
    QRDBText129: TQRDBText;
    QRDBText130: TQRDBText;
    QRDBText131: TQRDBText;
    QRDBText132: TQRDBText;
    QRDBText133: TQRDBText;
    QRDBText134: TQRDBText;
    QRDBText135: TQRDBText;
    QRDBText136: TQRDBText;
    QRDBText137: TQRDBText;
    QRDBText138: TQRDBText;
    QRDBText139: TQRDBText;
    QRDBText140: TQRDBText;
    QRDBText141: TQRDBText;
    QRDBText142: TQRDBText;
    QRDBText143: TQRDBText;
    QRDBText144: TQRDBText;
    QRDBText145: TQRDBText;
    QRDBText146: TQRDBText;
    QRDBText147: TQRDBText;
    QRDBText148: TQRDBText;
    QRDBText149: TQRDBText;
    QRDBText150: TQRDBText;
    QRDBText151: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRDBText152: TQRDBText;
    QRDBText153: TQRDBText;
    QRDBText154: TQRDBText;
    QRDBText155: TQRDBText;
    QRDBText156: TQRDBText;
    QRDBText157: TQRDBText;
    QRDBText158: TQRDBText;
    QRDBText159: TQRDBText;
    QRDBText160: TQRDBText;
    QRDBText161: TQRDBText;
    QRDBText162: TQRDBText;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText163: TQRDBText;
    QRDBText164: TQRDBText;
    QRDBText165: TQRDBText;
    QRDBText166: TQRDBText;
    QRDBText167: TQRDBText;
    QRDBText168: TQRDBText;
    QRDBText169: TQRDBText;
    QRDBText170: TQRDBText;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRDBText171: TQRDBText;
    QRDBText172: TQRDBText;
    QRDBText173: TQRDBText;
    QRDBText174: TQRDBText;
    QRDBText175: TQRDBText;
    QRDBText176: TQRDBText;
    QRDBText177: TQRDBText;
    QRDBText178: TQRDBText;
    QRShape9: TQRShape;
    QRMemo6: TQRMemo;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRDBText179: TQRDBText;
    QRDBText180: TQRDBText;
    QRDBText181: TQRDBText;
    QRDBText182: TQRDBText;
    QRDBText183: TQRDBText;
    QRDBText184: TQRDBText;
    QRDBText185: TQRDBText;
    QRDBText186: TQRDBText;
    QRDBText187: TQRDBText;
    QRDBText188: TQRDBText;
    QRDBText189: TQRDBText;
    QRDBText190: TQRDBText;
    QRDBText191: TQRDBText;
    QRDBText192: TQRDBText;
    QRDBText193: TQRDBText;
    QRDBText194: TQRDBText;
    QRDBText195: TQRDBText;
    QRDBText196: TQRDBText;
    QRDBText197: TQRDBText;
    QRDBText198: TQRDBText;
    QRDBText199: TQRDBText;
    QRDBText200: TQRDBText;
    QRDBText201: TQRDBText;
    QRDBText202: TQRDBText;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    CZ_INCAP66100ILTVALORCARTERA: TQRDBText;
    QRDBText204: TQRDBText;
    QRDBText205: TQRDBText;
    QRDBText206: TQRDBText;
    QRDBText207: TQRDBText;
    QRDBText208: TQRDBText;
    QRDBText209: TQRDBText;
    QRDBText210: TQRDBText;
    QRDBText211: TQRDBText;
    QRDBText212: TQRDBText;
    QRDBText213: TQRDBText;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRDBText214: TQRDBText;
    QRDBText215: TQRDBText;
    QRDBText216: TQRDBText;
    QRDBText217: TQRDBText;
    QRDBText218: TQRDBText;
    QRDBText219: TQRDBText;
    QRDBText220: TQRDBText;
    QRDBText221: TQRDBText;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRDBText222: TQRDBText;
    QRDBText223: TQRDBText;
    QRDBText224: TQRDBText;
    QRDBText225: TQRDBText;
    QRDBText226: TQRDBText;
    QRDBText227: TQRDBText;
    QRDBText228: TQRDBText;
    QRDBText229: TQRDBText;
    QRShape10: TQRShape;
    QRMemo7: TQRMemo;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRDBText230: TQRDBText;
    QRDBText231: TQRDBText;
    QRDBText232: TQRDBText;
    QRDBText233: TQRDBText;
    QRDBText234: TQRDBText;
    QRDBText235: TQRDBText;
    QRDBText236: TQRDBText;
    QRDBText237: TQRDBText;
    QRDBText238: TQRDBText;
    QRDBText239: TQRDBText;
    QRDBText240: TQRDBText;
    QRDBText241: TQRDBText;
    QRDBText242: TQRDBText;
    QRDBText243: TQRDBText;
    QRDBText244: TQRDBText;
    QRDBText245: TQRDBText;
    QRDBText246: TQRDBText;
    QRDBText247: TQRDBText;
    QRDBText248: TQRDBText;
    QRDBText249: TQRDBText;
    QRDBText250: TQRDBText;
    QRDBText251: TQRDBText;
    QRDBText252: TQRDBText;
    QRDBText253: TQRDBText;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRDBText254: TQRDBText;
    QRDBText255: TQRDBText;
    QRDBText256: TQRDBText;
    QRDBText257: TQRDBText;
    QRDBText258: TQRDBText;
    QRDBText259: TQRDBText;
    QRDBText260: TQRDBText;
    QRDBText261: TQRDBText;
    QRDBText262: TQRDBText;
    QRDBText263: TQRDBText;
    QRDBText264: TQRDBText;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRDBText265: TQRDBText;
    QRDBText266: TQRDBText;
    QRDBText267: TQRDBText;
    QRDBText268: TQRDBText;
    QRDBText269: TQRDBText;
    QRDBText270: TQRDBText;
    QRDBText271: TQRDBText;
    QRDBText272: TQRDBText;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRDBText273: TQRDBText;
    QRDBText274: TQRDBText;
    QRDBText275: TQRDBText;
    QRDBText276: TQRDBText;
    QRDBText277: TQRDBText;
    QRDBText278: TQRDBText;
    QRDBText279: TQRDBText;
    QRDBText280: TQRDBText;
    QRShape11: TQRShape;
    QRMemo8: TQRMemo;
    edJuiciosRecargoTitulo: TQRLabel;
    edJuiciosRecargoCol1: TQRDBText;
    edJuiciosRecargoCol2: TQRDBText;
    edJuiciosRecargoCol3: TQRDBText;
    edJuiciosRecargoCol4: TQRDBText;
    edJuiciosRecargoCol5: TQRDBText;
    edJuiciosRecargoCol6: TQRDBText;
    edJuiciosRecargoCol7: TQRDBText;
    edJuiciosRecargoCol8: TQRDBText;
    QRDBText313: TQRDBText;
    QRDBText314: TQRDBText;
    QRDBText315: TQRDBText;
    QRLabel109: TQRLabel;
    QRLabel108: TQRLabel;
    QRDBText316: TQRDBText;
    QRLabel110: TQRLabel;
    QRDBText317: TQRDBText;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRDBText318: TQRDBText;
    QRDBText319: TQRDBText;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRDBText320: TQRDBText;
    QRDBText321: TQRDBText;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRDBText322: TQRDBText;
    QRDBText323: TQRDBText;
    QRDBText324: TQRDBText;
    QRDBText325: TQRDBText;
    QRDBText326: TQRDBText;
    QRLabel117: TQRLabel;
    QRDBText327: TQRDBText;
    QRDBText328: TQRDBText;
    QRDBText329: TQRDBText;
    QRLabel118: TQRLabel;
    QRDBText330: TQRDBText;
    QRDBText331: TQRDBText;
    QRDBText332: TQRDBText;
    QRLabel119: TQRLabel;
    QRDBText333: TQRDBText;
    QRDBText334: TQRDBText;
    QRDBText335: TQRDBText;
    QRLabel120: TQRLabel;
    QRDBText336: TQRDBText;
    QRDBText337: TQRDBText;
    QRDBText338: TQRDBText;
    QRLabel121: TQRLabel;
    QRDBText339: TQRDBText;
    QRDBText340: TQRDBText;
    QRDBText341: TQRDBText;
    QRLabel122: TQRLabel;
    QRDBText342: TQRDBText;
    QRDBText343: TQRDBText;
    QRDBText344: TQRDBText;
    QRLabel123: TQRLabel;
    QRDBText345: TQRDBText;
    QRDBText346: TQRDBText;
    QRDBText347: TQRDBText;
    QRLabel124: TQRLabel;
    QRDBText348: TQRDBText;
    QRDBText349: TQRDBText;
    QRDBText350: TQRDBText;
    QRLabel125: TQRLabel;
    QRDBText351: TQRDBText;
    QRDBText352: TQRDBText;
    QRDBText353: TQRDBText;
    QRLabel126: TQRLabel;
    QRDBText354: TQRDBText;
    QRDBText355: TQRDBText;
    QRDBText356: TQRDBText;
    QRLabel127: TQRLabel;
    QRDBText357: TQRDBText;
    QRDBText358: TQRDBText;
    QRDBText359: TQRDBText;
    QRLabel128: TQRLabel;
    QRDBText360: TQRDBText;
    QRDBText361: TQRDBText;
    QRDBText362: TQRDBText;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    lbInfComAnoProp: TQRLabel;
    lbInfComAnoTotal: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    bPanel6_1: TQRStringsBand;
    QRMemo10: TQRMemo;
    QRShape15: TQRShape;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel155: TQRLabel;
    QRShape16: TQRShape;
    lbAlternativasFrecuencia: TQRLabel;
    lbAlternativasComision: TQRLabel;
    lbAlternativasVariables: TQRLabel;
    lbAlternativasUtilidad: TQRLabel;
    lbAlternativasTotalErogaciones: TQRLabel;
    lbAlternativasPesosCapita: TQRLabel;
    lbAlternativasPesos: TQRLabel;
    lbAlternativasPorcentaje: TQRLabel;
    lbAlternativasVariable: TQRLabel;
    lbAlternativasCotizada: TQRLabel;
    bPanel6_2: TQRStringsBand;
    QRShape17: TQRShape;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRDBText369: TQRDBText;
    QRDBText370: TQRDBText;
    QRDBText371: TQRDBText;
    QRDBText372: TQRDBText;
    QRDBText373: TQRDBText;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel171: TQRLabel;
    QRDBText374: TQRDBText;
    QRDBText409: TQRDBText;
    QRLabel175: TQRLabel;
    QRDBText410: TQRDBText;
    QRLabel176: TQRLabel;
    QRDBText411: TQRDBText;
    QRLabel177: TQRLabel;
    QRMemo13: TQRMemo;
    bPanel7: TQRStringsBand;
    QRShape18: TQRShape;
    QRLabel181: TQRLabel;
    QRDBText415: TQRDBText;
    lbInfComAno1: TQRLabel;
    lbInfComAno2: TQRLabel;
    lbInfComAno3: TQRLabel;
    lbInfComAno4: TQRLabel;
    lbInfComAno5: TQRLabel;
    lbInfComAno6: TQRLabel;
    lbInfComAcc1: TQRLabel;
    lbInfComAcc2: TQRLabel;
    lbInfComAcc3: TQRLabel;
    lbInfComAcc4: TQRLabel;
    lbInfComAcc5: TQRLabel;
    lbInfComAcc6: TQRLabel;
    lbInfComAccTotal: TQRLabel;
    lbInfCom0501: TQRLabel;
    lbInfCom0502: TQRLabel;
    lbInfCom0503: TQRLabel;
    lbInfCom0504: TQRLabel;
    lbInfCom0505: TQRLabel;
    lbInfCom0506: TQRLabel;
    lbInfCom050Total: TQRLabel;
    lbInfCom050Prop: TQRLabel;
    lbInfCom50661: TQRLabel;
    lbInfCom50662: TQRLabel;
    lbInfCom50663: TQRLabel;
    lbInfCom50664: TQRLabel;
    lbInfCom50665: TQRLabel;
    lbInfCom50666: TQRLabel;
    lbInfCom5066Total: TQRLabel;
    lbInfCom5066Prop: TQRLabel;
    lbInfCom661001: TQRLabel;
    lbInfCom661002: TQRLabel;
    lbInfCom661003: TQRLabel;
    lbInfCom661004: TQRLabel;
    lbInfCom661005: TQRLabel;
    lbInfCom661006: TQRLabel;
    lbInfCom66100Total: TQRLabel;
    lbInfCom66100Prop: TQRLabel;
    lbInfComDiasComp1: TQRLabel;
    lbInfComDiasComp2: TQRLabel;
    lbInfComDiasComp3: TQRLabel;
    lbInfComDiasComp4: TQRLabel;
    lbInfComDiasComp5: TQRLabel;
    lbInfComDiasComp6: TQRLabel;
    lbInfComDiasCompTotal: TQRLabel;
    lbInfComDiasSRT1: TQRLabel;
    lbInfComDiasSRT2: TQRLabel;
    lbInfComDiasSRT3: TQRLabel;
    lbInfComDiasSRT4: TQRLabel;
    lbInfComDiasSRT5: TQRLabel;
    lbInfComDiasSRT6: TQRLabel;
    lbInfComDiasSRTTotal: TQRLabel;
    lbInfComIncidencia1: TQRLabel;
    lbInfComIncidencia2: TQRLabel;
    lbInfComIncidencia3: TQRLabel;
    lbInfComIncidencia4: TQRLabel;
    lbInfComIncidencia5: TQRLabel;
    lbInfComIncidencia6: TQRLabel;
    lbInfComIncidenciaProp: TQRLabel;
    lbInfComCapitas1: TQRLabel;
    lbInfComCapitas2: TQRLabel;
    lbInfComCapitas3: TQRLabel;
    lbInfComCapitas4: TQRLabel;
    lbInfComCapitas5: TQRLabel;
    lbInfComCapitas6: TQRLabel;
    lbInfComCapitasTotal: TQRLabel;
    lbInfComPeriodos1: TQRLabel;
    lbInfComPeriodos2: TQRLabel;
    lbInfComPeriodos3: TQRLabel;
    lbInfComPeriodos4: TQRLabel;
    lbInfComPeriodos5: TQRLabel;
    lbInfComPeriodos6: TQRLabel;
    lbInfComPeriodosTotal: TQRLabel;
    QRLabel142: TQRLabel;
    lbInfComMortales1: TQRLabel;
    lbInfComMortales2: TQRLabel;
    lbInfComMortales3: TQRLabel;
    lbInfComMortales4: TQRLabel;
    lbInfComMortales5: TQRLabel;
    lbInfComMortales6: TQRLabel;
    lbInfComMortalesTotal: TQRLabel;
    lbInfComMortalesProp: TQRLabel;
    QRShape20: TQRShape;
    QRLabel143: TQRLabel;
    QRDBText203: TQRDBText;
    QRLabel154: TQRLabel;
    QRDBText363: TQRDBText;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    lbTSSNSumaFija: TQRLabel;
    lbTSSNPorcVariable: TQRLabel;
    lbTSSNPrimaFinalXCapita: TQRLabel;
    lbTSSNPrimaAnual: TQRLabel;
    QRStringsBand1: TQRStringsBand;
    QRLabel163: TQRLabel;
    QRDBText377: TQRDBText;
    lbSumaFija: TQRLabel;
    lbPorcVariable: TQRLabel;
    lbPrimaFinal: TQRLabel;
    lbPrimaAnual: TQRLabel;
    memoErrorGetCotizacion: TQRMemo;
    bHistorico: TQRStringsBand;
    lbHistoricoFechaTitulo: TQRLabel;
    lbHistoricoFecha: TQRLabel;
    lbHistoricoUsu: TQRLabel;
    lbHistoricoTotEmpPesos: TQRLabel;
    lbHistoricoTotEmpPorcentaje: TQRLabel;
    lbHistoricoAlicuotaFija: TQRLabel;
    lbHistoricoAlicuotaVariable: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel104: TQRDBText;
    QRDBText281: TQRDBText;
    QRLabel173: TQRLabel;
    QRDBText282: TQRDBText;
    QRLabel174: TQRLabel;
    lbAlternativasPesosCapitaSinSac: TQRLabel;
    QRLabel182: TQRLabel;
    QRDBText283: TQRDBText;
    QRLabel183: TQRLabel;
    QRDBText284: TQRDBText;
    QRLabel184: TQRLabel;
    QRDBText285: TQRDBText;
    QRLabel185: TQRLabel;
    QRDBText286: TQRDBText;
    bExcepcionRecotizacion: TQRStringsBand;
    bTituloModificaciones: TQRStringsBand;
    QRLabel161: TQRLabel;
    QRDBText376: TQRDBText;
    QRLabel162: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    lbTipo: TQRLabel;
    QRLabel178: TQRLabel;
    lbUsuarioExcepcionRecotizacion: TQRLabel;
    QRLabel179: TQRLabel;
    lbMotivoExcepcionRecotizacion: TQRLabel;
    edJuiciosDemPromedioTitulo: TQRLabel;
    edJuiciosDemPromedioCol1: TQRDBText;
    edJuiciosDemPromedioCol2: TQRDBText;
    edJuiciosDemPromedioCol3: TQRDBText;
    edJuiciosDemPromedioCol4: TQRDBText;
    edJuiciosDemPromedioCol5: TQRDBText;
    edJuiciosDemPromedioCol6: TQRDBText;
    edJuiciosDemPromedioCol7: TQRDBText;
    edJuiciosDemPromedioCol8: TQRDBText;
    edJuiciosSiniestrosEsperadosCol1: TQRDBText;
    edJuiciosSiniestrosEsperadosCol2: TQRDBText;
    edJuiciosSiniestrosEsperadosCol3: TQRDBText;
    edJuiciosSiniestrosEsperadosCol4: TQRDBText;
    edJuiciosSiniestrosEsperadosCol5: TQRDBText;
    edJuiciosSiniestrosEsperadosCol6: TQRDBText;
    edJuiciosSiniestrosEsperadosCol7: TQRDBText;
    edJuiciosSiniestrosEsperadosCol8: TQRDBText;
    edJuiciosFrecuenciaCol1: TQRDBText;
    edJuiciosFrecuenciaCol2: TQRDBText;
    edJuiciosFrecuenciaCol3: TQRDBText;
    edJuiciosFrecuenciaCol4: TQRDBText;
    edJuiciosFrecuenciaCol5: TQRDBText;
    edJuiciosFrecuenciaCol6: TQRDBText;
    edJuiciosFrecuenciaCol7: TQRDBText;
    edJuiciosFrecuenciaCol8: TQRDBText;
    edJuiciosFrecuenciaTitulo: TQRLabel;
    edJuiciosSiniestrosEsperadosTitulo: TQRLabel;
    edJuiciosFrecuenciaTitulo2: TQRLabel;
    edJuiciosSiniestrosEsperadosTitulo2: TQRLabel;
    edJuiciosDemPromedioTitulo2: TQRLabel;
    shError3: TQRShape;
    QRLabel107: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel186: TQRLabel;
    QRLabel187: TQRLabel;
    QRLabel188: TQRLabel;
    QRLabel189: TQRLabel;
    QRLabel190: TQRLabel;
    QRLabel191: TQRLabel;
    QRLabel192: TQRLabel;
    QRLabel193: TQRLabel;
    QRLabel194: TQRLabel;
    QRLabel195: TQRLabel;
    QRLabel196: TQRLabel;
    QRLabel197: TQRLabel;
    QRLabel198: TQRLabel;
    QRLabel199: TQRLabel;
    QRLabel200: TQRLabel;
    QRLabel201: TQRLabel;
    QRDBText287: TQRDBText;
    QRDBText288: TQRDBText;
    procedure QRDBText2Print(Sender: TObject; var Value: String);
    procedure bPanel6_1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormatImporte(Sender: TObject; var Value: String);
    procedure FormatPorcentaje2D(Sender: TObject; var Value: String);
    procedure FormatPorcentaje3D(Sender: TObject; var Value: String);
    procedure FormatValorSinDecimales(Sender: TObject; var Value: String);
    procedure FormatImporteSinDecimales(Sender: TObject; var Value: String);
    procedure FormatValor1D(Sender: TObject; var Value: String);
    procedure bHistoricoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText121Print(Sender: TObject; var Value: String);
    procedure QRDBText172Print(Sender: TObject; var Value: String);
    procedure QRDBText223Print(Sender: TObject; var Value: String);
    procedure QRDBText286Print(Sender: TObject; var Value: String);
    procedure bExcepcionRecotizacionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRDBText19Print(Sender: TObject; var Value: String);
  private
    FCotizacionId: Integer;
    FGuardarImpresion: Boolean;

    function GetEstadoUltimaArt: String;
    function GetUltimaArt: String;

    procedure CalcularInformacionComplementaria;
  public
    procedure Mostrar(const aCotizacionId: Integer; const aModal, aGuardarImpresion: Boolean);

    property GuardarImpresion: Boolean write FGuardarImpresion;
  end;

var
  qrCotizador: TqrCotizador;

implementation

uses
  unPrincipal, AnsiSql, unDmPrincipal, CUIT, General, unCotizacion, unSesion, Math;

{$R *.DFM}

function TqrCotizador.GetEstadoUltimaArt: String;
var
  sSql: String;
begin
  sSql :=
  ' SELECT tb_descripcion' +
   ' FROM (SELECT   tb_descripcion' +
             ' FROM tss_solicitudsrt, ctb_tablas' +
            ' WHERE ss_operacion = tb_codigo' +
              ' AND ss_idcotizacion = :idcotizacion' +
              ' AND tb_clave = ''COPER''' +
         ' ORDER BY ss_vigenciadesde DESC)';
  Result := ValorSqlEx(sSql, [FCotizacionId]);
end;

function TqrCotizador.GetUltimaArt: String;
var
  sSql: String;
begin
  sSql :=
  ' SELECT ar_nombre' +
    ' FROM (SELECT   ar_nombre' +
              ' FROM tss_solicitudsrt, aar_art' +
             ' WHERE ss_idart = ar_id' +
               ' AND ss_idcotizacion = :idcotizacion' +
          ' ORDER BY ss_vigenciadesde DESC)';
  Result := ValorSqlEx(sSql, [FCotizacionId]);
end;


procedure TqrCotizador.CalcularInformacionComplementaria;
  function GetFloatValue(aComponent: TComponent): Real;
  begin
    Result := 0;

    if aComponent.ClassType = TQRLabel then
      Result := ToFloat(StringReplace(TQRLabel(aComponent).Caption, '%', '', [rfReplaceAll]));
  end;

  function GetIntValue(aComponent: TComponent): Integer;
  begin
    Result := 0;

    if aComponent.ClassType = TQRLabel then
      Result := StrToIntDef(TQRLabel(aComponent).Caption, 0);
  end;

var
  a, b, c: Integer;
  iCantAccidentes: Integer;
  iCantPeriodosMayorACero: Integer;
  iInfComAccTotal: Integer;
  iInfCom050Total: Integer;
  iInfCom5066Total: Integer;
  iInfCom66100Total: Integer;
  iInfComDiasSRTTotal: Integer;
  iInfComCapitasTotal: Integer;
  iInfComMortalesTotal: Integer;
  iInfComPeriodosTotal: Integer;
  iLoop: Integer;
  rInfComDiasCompTotal: Real;
  rProp050: Real;
  rProp5066: Real;
  rProp66100: Real;
  rPropMortales: Real;
  rPropTotal: Real;
  rPropTotalAnos: Integer;
begin
// Hace cálculos en el grupo de Información Complementaria..

  iCantPeriodosMayorACero := 0;
  iInfComAccTotal := 0;
  iInfCom050Total := 0;
  iInfCom5066Total := 0;
  iInfCom66100Total := 0;
  rInfComDiasCompTotal := 0;
  iInfComDiasSRTTotal := 0;
  iInfComCapitasTotal := 0;
  iInfComMortalesTotal := 0;
  iInfComPeriodosTotal := 0;
  rProp050 := 0;
  rProp5066 := 0;
  rProp66100 := 0;
  rPropMortales := 0;
  rPropTotal := 0;
  rPropTotalAnos := 0;

  for iLoop := 1 to CANT_ANOS_INFO_COMPLEMENTARIA do
  begin
    // Calculo total..
    iInfComAccTotal      := iInfComAccTotal + GetIntValue(FindComponent('lbInfComAcc' + IntToStr(iLoop)));
    iInfCom050Total      := iInfCom050Total + GetIntValue(FindComponent('lbInfCom050' + IntToStr(iLoop)));
    iInfCom5066Total     := iInfCom5066Total + GetIntValue(FindComponent('lbInfCom5066' + IntToStr(iLoop)));
    iInfCom66100Total    := iInfCom66100Total + GetIntValue(FindComponent('lbInfCom66100' + IntToStr(iLoop)));
    iInfComMortalesTotal := iInfComMortalesTotal + GetIntValue(FindComponent('lbInfComMortales' + IntToStr(iLoop)));
    rInfComDiasCompTotal := rInfComDiasCompTotal + GetFloatValue(FindComponent('lbInfComDiasComp' + IntToStr(iLoop)));
    iInfComDiasSRTTotal  := iInfComDiasSRTTotal + GetIntValue(FindComponent('lbInfComDiasSRT' + IntToStr(iLoop)));
    iInfComCapitasTotal  := iInfComCapitasTotal + GetIntValue(FindComponent('lbInfComCapitas' + IntToStr(iLoop)));
    iInfComPeriodosTotal := iInfComPeriodosTotal + GetIntValue(FindComponent('lbInfComPeriodos' + IntToStr(iLoop)));


    // Calculo incidencia.
    a := GetIntValue(FindComponent('lbInfComAcc' + IntToStr(iLoop)));
    b := IIF((GetIntValue(FindComponent('lbInfComCapitas' + IntToStr(iLoop))) > 0), GetIntValue(FindComponent('lbInfComCapitas' + IntToStr(iLoop))), 1);
    c := IIF((GetIntValue(FindComponent('lbInfComPeriodos' + IntToStr(iLoop))) > 0), GetIntValue(FindComponent('lbInfComPeriodos' + IntToStr(iLoop))), 1);

    TQRLabel(FindComponent('lbInfComIncidencia' + IntToStr(iLoop))).Caption := FormatFloat('0.00%', a / b / c * 12 * 100);


    // Calculo proporción..
    if StrToIntDef(TQRLabel(FindComponent('lbInfComPeriodos' + IntToStr(iLoop))).Caption, 0) > 0 then
    begin
      Inc(iCantPeriodosMayorACero);
      iCantAccidentes := GetIntValue(FindComponent('lbInfComAcc' + IntToStr(iLoop)));
      if iCantAccidentes > 0 then
      begin
        rProp050 := rProp050 + (100 *
          GetIntValue(FindComponent('lbInfCom050' + IntToStr(iLoop))) / iCantAccidentes);

        rProp5066 := rProp5066 + (100 *
          GetIntValue(FindComponent('lbInfCom5066' + IntToStr(iLoop))) / iCantAccidentes);

        rProp66100 := rProp66100 + (100 *
          GetIntValue(FindComponent('lbInfCom66100' + IntToStr(iLoop))) / iCantAccidentes);

        rPropMortales := rPropMortales + (100 *
          GetIntValue(FindComponent('lbInfComMortales' + IntToStr(iLoop))) / iCantAccidentes);
      end;

      rPropTotal := rPropTotal + GetFloatValue(FindComponent('lbInfComIncidencia' + IntToStr(iLoop)));
      if GetFloatValue(FindComponent('lbInfComPeriodos' + IntToStr(iLoop))) > 0 then
        rPropTotalAnos := rPropTotalAnos + 1;
    end;
  end;

  // Se ignora lo sumado arriba y se calcul asi ahora..
  with qyDatos do
    rInfComDiasCompTotal :=
      (FieldByName('cz_iltprestvalorsuscriptor').AsFloat * FieldByName('cz_iltfrecvalorsuscriptor').AsFloat / 100) +
      (FieldByName('cz_incap050iltvalorsuscripto').AsFloat * FieldByName('cz_incap050frecvalorsuscriptor').AsFloat / 100) +
      (FieldByName('cz_incap5066iltvalorsuscriptor').AsFloat * FieldByName('cz_incap5066frecvalorsuscript').AsFloat / 100) +
      (FieldByName('cz_incap66100iltvalorsuscripto').AsFloat * FieldByName('cz_incap66100frecvalorsuscript').AsFloat / 100);

  // Total..
  lbInfComAccTotal.Caption      := IntToStr(iInfComAccTotal);
  lbInfCom050Total.Caption      := IntToStr(iInfCom050Total);
  lbInfCom5066Total.Caption     := IntToStr(iInfCom5066Total);
  lbInfCom66100Total.Caption    := IntToStr(iInfCom66100Total);
  lbInfComMortalesTotal.Caption := IntToStr(iInfComMortalesTotal);
  lbInfComDiasCompTotal.Caption := FormatFloat('0', rInfComDiasCompTotal);
  lbInfComDiasSRTTotal.Caption  := IntToStr(Trunc(iInfComDiasSRTTotal / 6));
  lbInfComCapitasTotal.Caption  := IntToStr(iInfComCapitasTotal);
  lbInfComPeriodosTotal.Caption := IntToStr(iInfComPeriodosTotal);


  // Proporción..
  if iCantPeriodosMayorACero = 0 then
  begin
    lbInfCom050Prop.Caption := FormatFloat('0.00%', 0);
    lbInfCom5066Prop.Caption := FormatFloat('0.00%', 0);
    lbInfCom66100Prop.Caption := FormatFloat('0.00%', 0);
    lbInfComMortalesProp.Caption := FormatFloat('0.00%', 0);
  end
  else
  begin
    lbInfCom050Prop.Caption := FormatFloat('0.00%', (rProp050 / iCantPeriodosMayorACero));
    lbInfCom5066Prop.Caption := FormatFloat('0.00%', (rProp5066 / iCantPeriodosMayorACero));
    lbInfCom66100Prop.Caption := FormatFloat('0.00%', (rProp66100 / iCantPeriodosMayorACero));
    lbInfComMortalesProp.Caption := FormatFloat('0.00%', (rPropMortales / iCantPeriodosMayorACero));
  end;

  if rPropTotalAnos = 0 then
    lbInfComIncidenciaProp.Caption := '0.00%'
  else
    lbInfComIncidenciaProp.Caption := FormatFloat('0.00%', (rPropTotal / rPropTotalAnos));
end;

procedure TqrCotizador.Mostrar(const aCotizacionId: Integer; const aModal, aGuardarImpresion: Boolean);
  procedure ClearFieldsInfCom(const aCountColumnas: Integer; const aControles: Array of String);
  var
    aComponent: TComponent;
    iLoop: Integer;
  begin
    for iLoop := Low(aControles) to High(aControles) do
    begin
      aComponent := FindComponent(aControles[iLoop] + IntToStr(aCountColumnas));

      if aControles[iLoop] = 'lbInfComAno' then
        TQRLabel(aComponent).Caption := IntToStr(StrToIntDef(TQRLabel(FindComponent(aControles[iLoop] + IntToStr(aCountColumnas - 1))).Caption, -1) + 1)
      else
      begin
        if aComponent.ClassType = TQRLabel then
          TQRLabel(aComponent).Caption := '0';
      end;
    end;
  end;

  procedure FillFields(const aCountColumnas: Integer; const aControles: Array of String; const aFields: TFields);
  var
    aComponent: TComponent;
    iLoop: Integer;
  begin
    for iLoop := Low(aControles) to High(aControles) do
    begin
      aComponent := FindComponent(aControles[iLoop] + IntToStr(aCountColumnas));

      if aControles[iLoop] = 'lbInfComIncidencia' then
        TQRLabel(aComponent).Caption := FormatFloat('0.00%', aFields[iLoop].AsFloat)
      else
      begin
        if aComponent.ClassType = TQRLabel then
          TQRLabel(aComponent).Caption := IntToStr(aFields[iLoop].AsInteger);
      end;
    end;
  end;

  procedure FillFieldsDetalleILP(const aCountColumnas, aIdCotizacion, aAnio: Integer);
  var
    sSql : String;
    aComponent: TComponent;
  begin
     //ILP 0-50
    sSql :=
      'SELECT COUNT(*) cantidad' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_anio = :anio' +
        ' AND di_porcentaje < 50' +
        ' AND di_muerte = ''N''';
    with GetQueryEx(sSql, [aCotizacionId, aAnio]) do
    try
      begin
        aComponent := Self.FindComponent('lbInfCom050' + IntToStr(aCountColumnas));
        TQRLabel(aComponent).Caption := FieldByName('cantidad').AsString;
      end;
    finally
      Free;
    end;

    //ILP 50-66
    sSql :=
      'SELECT COUNT(*) cantidad' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_anio = :anio' +
        ' AND di_porcentaje BETWEEN 50 AND 65.99' +
        ' AND di_muerte = ''N''';
    with GetQueryEx(sSql, [aCotizacionId, aAnio]) do
    try
      begin
        aComponent := Self.FindComponent('lbInfCom5066' + IntToStr(aCountColumnas));
        TQRLabel(aComponent).Caption := FieldByName('cantidad').AsString;
      end;
    finally
      Free;
    end;

    //ILP 66-100
    sSql :=
      'SELECT COUNT(*) cantidad' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_anio = :anio' +
        ' AND di_porcentaje BETWEEN 66 AND 100' +
        ' AND di_muerte = ''N''';
    with GetQueryEx(sSql, [aCotizacionId, aAnio]) do
    try
      begin
        aComponent := Self.FindComponent('lbInfCom66100' + IntToStr(aCountColumnas));
        TQRLabel(aComponent).Caption := FieldByName('cantidad').AsString;
      end;
    finally
      Free;
    end;

   //ILP Mortales
    sSql :=
      'SELECT COUNT(*) cantidad' +
       ' FROM adi_detalleilp' +
      ' WHERE di_idcotizacion = :idcotizacion' +
        ' AND di_anio = :anio' +
        ' AND di_muerte IN (''I'', ''S'')';
    with GetQueryEx(sSql, [aCotizacionId, aAnio]) do
    try
      begin
        aComponent := Self.FindComponent('lbInfComMortales' + IntToStr(aCountColumnas));
        TQRLabel(aComponent).Caption := FieldByName('cantidad').AsString;
      end;
    finally
      Free;
    end;
  end;

var
  cPorcSSN: Currency;
  cTarSSN: Currency;
  iCountColumnas: Integer;
  iLoop: Integer;
  sSql: String;
begin
  qrCotizador.Page.Orientation := poPortrait; //tk 41745, a veces Julia pareciera que cambia la orientacion y/o tipo de papel.
  qrCotizador.Page.PaperSize := Legal;

  FCotizacionId     := aCotizacionId;
  FGuardarImpresion := aGuardarImpresion;

  // General..
  qyDatos.SQL.Text :=
    'SELECT acz.*, co_razonsocial, co_cuit, co_fechaconfecciono, co_idactividad, co_nrocotizacion, sc_canttrabajador, sc_masasalarial, sc_porccomision, co_nivel,' +
          ' co_fechaconfecciono, co_canttrabajador, co_masasalarial, (SELECT TRUNC(SUM(cs_cantidadtrabajador) / COUNT(cs_cantidadtrabajador))' +
                                                                      ' FROM acs_cotizacionsiniestro' +
                                                                     ' WHERE cs_idcotizacion = acz.cz_idcotizacion' +
                                                                       ' AND cs_cantidadtrabajador > 0) capitasafip,' +
          ' DECODE(NVL(co_canttrabajador, 0), 0, 0, co_masasalarial / co_canttrabajador) sueldopromedio, cac1.ac_id codigoactividad1,' +
          ' cac1.ac_codigo || '' - '' || cac1.ac_descripcion ciiu, cac2.ac_codigo || '' - '' || cac2.ac_descripcion ciiu3,' +
          ' cac3.ac_codigo || '' - '' || cac3.ac_descripcion ciiu1, cac4.ac_codigo || '' - '' || cac4.ac_descripcion ciiu4,' +
          ' cac5.ac_codigo || '' - '' || cac5.ac_descripcion ciiu5, fidel.tb_descripcion fidel, stbcr.tb_descripcion stbcr, ca_descripcion canal, en_nombre entidad,' +
          ' :ultimaart ultimaart, :estadoactual estadoactual, cz_especiesesptotalempresa, cz_especiesespcapitafija, zogeo.zg_descripcion zonageografica,' +
          ' sect.tb_descripcion sector, sino.tb_descripcion ponderadores, NVL(cz_iltesptotalempresa, 0) + NVL(cz_iltpresttotalempresa, 0) ilttotalempresa,' +
          ' NVL(cz_incap050esptotalempresa, 0) + NVL(cz_incap050ilttotalempresa, 0) + NVL(cz_incap050incaptotalempresa, 0) incap050totalempresa,' +
          ' NVL(cz_incap050iltcapitavariable, 0) + NVL(cz_incap050incapcapitavariable, 0) incap050capitavariable,' +
          ' NVL(cz_incap5066esptotalempresa, 0) + NVL(cz_incap5066ilttotalempresa, 0) + NVL(cz_incap5066adictotalempresa, 0) + NVL(cz_incap5066incaptotalempresa, 0) incap5066totalempresa,' +
          ' NVL(cz_incap5066espcapitafija, 0) + NVL(cz_incap5066adiccapitafija, 0) incap5066capitafija,' +
          ' NVL(cz_incap5066iltcapitavariable, 0) + NVL(cz_incap5066incapcapitavar, 0) incap5066capitavariable,' +
          ' NVL(cz_incap66100esptotalempresa, 0) + NVL(cz_incap66100ilttotalempresa, 0) + NVL(cz_incap66100adictotalempresa, 0) + NVL(cz_incap66100incaptotalempresa, 0) incap66100totalempresa,' +
          ' NVL(cz_incap66100espcapitafija, 0) + NVL(cz_incap66100adiccapitafija, 0) incap66100capitafija,' +
          ' NVL(cz_incap66100iltcapitavariable, 0) + NVL(cz_incap66100incapcapitavar, 0) incap66100capitavariable,' +
          ' NVL(cz_muerteesptotalempresa, 0) + NVL(cz_muerteilttotalempresa, 0) + NVL(cz_muerteadictotalempresa, 0) + NVL(cz_muerteincaptotalempresa, 0) muertetotalempresa,' +
          ' NVL(cz_muerteespcapitafija, 0) + NVL(cz_muerteadiccapitafija, 0) muertecapitafija,' +
          ' NVL(cz_muerteiltcapitavar, 0) + NVL(cz_muerteincapcapitavariable, 0) muertecapitavariable,' +
          ' NVL(cz_juiciosdempromtotalempresa, 0) + NVL(cz_juiciosrectotalempresa, 0) juiciostotalempresa,' +
          ' NVL(cz_juiciosdempromcapitavar, 0) + NVL(cz_juiciosreccapitavariable, 0) juicioscapitavariable, ar_nombre, tr_detalle tarifarioriesgo,' +
          ' afiliacion.get_tarifassnfijo(cac1.ac_id, co_nivel, co_fechaconfecciono) + 0.6 tarifabase, 42.45 cz_tarifariotarifamaximafijo,' +
          ' 23.80 cz_tarifariotarifaminimafijo, co_primaprommercado, co_primaporcsalario,' +
          ' (SELECT NVL(SUM(di_porcentaje) / COUNT(di_porcentaje), 0)' +
             ' FROM adi_detalleilp' +
            ' WHERE di_idcotizacion = :idcotizacion' +
              ' AND di_porcentaje BETWEEN 0 AND 50) cz_incap050incapvalorcuit,' +
          ' (SELECT NVL(SUM(di_porcentaje) / COUNT(di_porcentaje), 0)' +
             ' FROM adi_detalleilp' +
            ' WHERE di_idcotizacion = :idcotizacion' +
              ' AND di_porcentaje BETWEEN 50.01 AND 66) cz_incap5066incapvalorcuit,' +
          ' (SELECT NVL(SUM(di_porcentaje) / COUNT(di_porcentaje), 0)' +
             ' FROM adi_detalleilp' +
            ' WHERE di_idcotizacion = :idcotizacion' +
              ' AND di_porcentaje BETWEEN 66.01 AND 100) cz_incap66100incapvalorcuit, sc_observaciones, atc2006.tc_sumafija,' +
          ' atc2006.tc_porcmasa, (sc_masasalarial / sc_canttrabajador * atc2006.tc_porcmasa / 100) + atc2006.tc_sumafija tc_costofinal,' +
                  ' /*art.cotizacion.get_valor_online_costo_anual(co_idactividad, co_masasalarial, co_canttrabajador)*/' +
                  ' (atc2006.tc_sumafija * 12 * sc_canttrabajador) + (atc2006.tc_porcmasa / 100 * 13) * sc_masasalarial costoanual, sc_idactividad,' +
                  ' cz_competenciacostofijo competenciacostofijo, co_fechaconfecciono, co_usuarioconfecciono,' +
                  ' DECODE(atc.tc_usutecnica, NULL, DECODE(atc.tc_usucomite, NULL, DECODE(atc.tc_usucomercial, NULL, atc.tc_usuoperaciones))) usuautorizo,' +
                  ' co_observaciones || ''/-'' || ROUND(cz_acpo) || ''-/'' co_observaciones, TRUNC(sc_fechasolicitud) sc_fechasolicitud, sc_usuariosolicitud,' +
                  ' cp_localidadcap, pn_detalle, sc_usuariorevision, cotre.tb_descripcion cotre,' +
                  ' sc_usuarioexcepcion, cotex.tb_descripcion cotex,' +
                  ' DECODE(NVL(cz_juiciosrectotalempresa, 0), 0, cz_juiciosdempromvalorcartera, cz_juiciosrecvalorcartera) juicioscol1,' +
                  ' DECODE(NVL(cz_juiciosrectotalempresa, 0), 0, NULL, cz_juiciosrecfactorriesgo) juicioscol4,' +
                  ' DECODE(NVL(cz_juiciosrectotalempresa, 0), 0, cz_juiciosdempromtotalempresa, cz_juiciosrectotalempresa) juicioscol6,' +
                  ' DECODE(NVL(cz_juiciosrectotalempresa, 0), 0, NULL, cz_juiciosreccapitafija) juicioscol7,' +
                  ' DECODE(NVL(cz_juiciosrectotalempresa, 0), 0, cz_juiciosdempromcapitavar, cz_juiciosreccapitavariable) juicioscol8,' +
                  ' TRUNC(co_fechaconfecciono) fechaconfecciono' +
     ' FROM acz_cotizador acz, aco_cotizacion, asc_solicitudcotizacion, cac_actividad cac1, cac_actividad cac2, cac_actividad cac3, cac_actividad cac4,' +
          ' cac_actividad cac5, ctb_tablas fidel, ctb_tablas stbcr, afi.aca_canal, com.xen_entidad, afi.azg_zonasgeograficas zogeo, ctb_tablas sect, ctb_tablas sino,' +
          ' aar_art, atc_tarifacobrar atc, afi.atc_tarifacomercial2006 atc2006, adt_datotarifador, art.ccp_codigopostal, afi.apn_probabilidadcierrenegocio,' +
          ' ctb_tablas cotre, ctb_tablas cotex, afi.atr_tiporiesgociiu' +
    ' WHERE cz_idcotizacion = co_id' +
      ' AND cz_idcotizacion = sc_idcotizacion' +
      ' AND co_idactividad = cac1.ac_id' +
      ' AND SUBSTR(cac1.ac_relacion, 1, 3) = cac2.ac_codigo(+)' +
      ' AND SUBSTR(art.hys.get_codactividadrevdos(cac1.ac_id), 1, 1) = cac3.ac_codigo(+)' +
      ' AND sc_idactividad2 = cac4.ac_id(+)' +
      ' AND sc_idactividad3 = cac5.ac_id(+)' +
      ' AND fidel.tb_codigo = co_idfidelitas' +
      ' AND fidel.tb_clave = ''FIDEL''' +
      ' AND stbcr.tb_codigo(+) = co_statusbcra' +
      ' AND stbcr.tb_clave(+) = ''STBCR''' +
      ' AND sc_canal = ca_id' +
      ' AND sc_identidad = en_id' +
      ' AND zogeo.zg_id(+) = cz_idzonageografica' +
      ' AND sect.tb_codigo(+) = cz_sector' +
      ' AND sect.tb_clave(+) = ''SECT''' +
      ' AND sino.tb_codigo(+) = cz_ponderadores' +
      ' AND sino.tb_clave(+) = ''SI/NO''' +
      ' AND ar_id(+) = cz_idartanterior' +
      ' AND atc.tc_id = (SELECT MAX(tc_id)' +
                         ' FROM atc_tarifacobrar' +
                        ' WHERE tc_idcotizacion = cz_idcotizacion)' +
      ' AND atc2006.tc_id = (SELECT MAX(tc_id)' +
                             ' FROM afi.atc_tarifacomercial2006' +
                            ' WHERE tc_idactividad = co_idactividad)' +
      ' AND co_idactividad = dt_idactividad(+)' +
      ' AND cz_idlocalidad = cp_id(+)' +
      ' AND cz_idprobabilidadcierre = pn_id(+)' +
      ' AND cotre.tb_codigo(+) = sc_codmotivorevision' +
      ' AND cotre.tb_clave(+) = ''COTRE''' +
      ' AND cotex.tb_codigo(+) = sc_codmotivoexcepcion' +
      ' AND cotex.tb_clave(+) = ''COTEX''' +
      ' AND cac1.ac_idtiporiesgo = tr_id(+)' +
      ' AND cz_idcotizacion = :idcotizacion';
  OpenQueryEx(qyDatos, [GetUltimaArt, GetEstadoUltimaArt, aCotizacionId]);

  //Comentarios agregados por tk 39627

  //if qyDatos.FieldByName('cz_juiciosrectotalempresa').AsFloat = 0 then
  //begin
  //bPanel3_8.Height := bPanel3_8.Height - 12;
  edJuiciosRecargoTitulo.Enabled := False;

  for iLoop := 1 to 8 do
    TQRDBText(FindComponent('edJuiciosRecargoCol' + IntToStr(iLoop))).Enabled := False;


  //end;
  {else
  begin
    bPanel3_8.Height := bPanel3_8.Height - 36;
    edJuiciosRecargoTitulo.Top := edJuiciosRecargoTitulo.Top - 36;

    edJuiciosFrecuenciaTitulo.Enabled := False;
    edJuiciosFrecuenciaTitulo2.Enabled := False;
    edJuiciosSiniestrosEsperadosTitulo.Enabled := False;
    edJuiciosSiniestrosEsperadosTitulo2.Enabled := False;
    edJuiciosDemPromedioTitulo.Enabled := False;
    edJuiciosDemPromedioTitulo2.Enabled := False;

    for iLoop := 1 to 8 do
    begin
      TQRDBText(FindComponent('edJuiciosRecargoCol' + IntToStr(iLoop))).Top := TQRDBText(FindComponent('edJuiciosRecargoCol' + IntToStr(iLoop))).Top - 36;
      TQRDBText(FindComponent('edJuiciosFrecuenciaCol' + IntToStr(iLoop))).Enabled          := False;
      TQRDBText(FindComponent('edJuiciosSiniestrosEsperadosCol' + IntToStr(iLoop))).Enabled := False;
      TQRDBText(FindComponent('edJuiciosDemPromedioCol' + IntToStr(iLoop))).Enabled         := False;
    end; }
 // end;


  memoErrorGetCotizacion.Enabled := not (qyDatos.FieldByName('cz_ttnumeroerror').AsInteger in [0, 3, 9]);
  shError3.Enabled := (qyDatos.FieldByName('cz_ttnumeroerror').AsInteger in [3, 9]);

  if qyDatos.FieldByName('cz_ttnumeroerror').AsInteger = 9 then
  begin
    shError3.Brush.Color := clGreen;
    shError3.Brush.Style := bsVertical;
  end
  else    // Sino es solo 3 por ahora..
  begin
    shError3.Brush.Color := clRed;
    shError3.Brush.Style := bsHorizontal;
  end;

  if qyDatos.FieldByName('cz_ttnumeroerror').AsInteger in [0, 3, 9] then
  begin
    lbPrimaAnual.Caption   := FormatFloat('$ #,##0.00', qyDatos.FieldByName('cz_ttprimaanual').AsFloat);
    lbPrimaFinal.Caption   := FormatFloat('$ #,##0.00', qyDatos.FieldByName('cz_ttprimafinalxcapita').AsFloat);
    lbSumaFija.Caption     := FormatFloat('$ #,##0.00', qyDatos.FieldByName('cz_ttsumafija').AsFloat);
    lbPorcVariable.Caption := FormatFloat('#,##0.000%', RoundTo(qyDatos.FieldByName('cz_ttporcentajevariable').AsFloat, -3));
  end
  else
    memoErrorGetCotizacion.Lines.Text := Format('%d - %s', [qyDatos.FieldByName('cz_ttnumeroerror').AsInteger, qyDatos.FieldByName('cz_tterror').AsString]);


  TarifaSSN('1', qyDatos.FieldByName('co_idactividad').AsInteger, qyDatos.FieldByName('co_fechaconfecciono').AsDateTime, cTarSSN, cPorcSSN);

  lbTSSNSumaFija.Caption          := FormatFloat('$ #,##0.00', cTarSSN);
  lbTSSNPorcVariable.Caption      := FormatFloat('#,##0.000%', cPorcSSN);
  lbTSSNPrimaFinalXCapita.Caption := FormatFloat('$ #,##0.00', (qyDatos.FieldByName('co_masasalarial').AsFloat / qyDatos.FieldByName('co_canttrabajador').AsInteger) *(cPorcSSN / 100) + cTarSSN);
  lbTSSNPrimaAnual.Caption        := FormatFloat('$ #,##0', (cTarSSN * 12 * qyDatos.FieldByName('co_canttrabajador').AsInteger) + (cPorcSSN / 100 * 13) * qyDatos.FieldByName('co_masasalarial').AsFloat);
                                    

  // Información complementaria..
  sSql :=
    'SELECT   cs_anio, cs_cantsiniestro, cs_cantipp50, cs_cantipp5066, cs_cantincapacidadtotal, cs_cantmuerte, cs_diascomputados,' +
            ' TRUNC(cs_cantdiasbajaart / DECODE(cs_cantsiniestro, 0, 10000, cs_cantsiniestro), 4) diassrt,' +
            ' (cs_cantsiniestro / utiles.iif_compara(''>'', cs_cantidadtrabajador, 0, cs_cantidadtrabajador, 1)' +
             ' / DECODE(cs_periodocubierto, 0, 1, cs_periodocubierto) * 12 * 100) incidencia,' +
            ' cs_cantidadtrabajador, cs_periodocubierto' +
       ' FROM acs_cotizacionsiniestro' +
      ' WHERE cs_idcotizacion = :idcotizacion' +
        ' AND cs_anio BETWEEN(TO_CHAR(art.actualdate, ''yyyy'') - 5) AND TO_CHAR(art.actualdate, ''yyyy'')' +
   ' ORDER BY cs_anio';
 
  with GetQueryEx(sSql, [aCotizacionId]) do
  try
    iCountColumnas := 1;
    while not Eof do
    begin
      FillFields(iCountColumnas, ['lbInfComAno', 'lbInfComAcc', 'lbInfCom050', 'lbInfCom5066', 'lbInfCom66100',
                 'lbInfComMortales', 'lbInfComDiasComp', 'lbInfComDiasSRT', 'lbInfComIncidencia', 'lbInfComCapitas',
                 'lbInfComPeriodos'],
                 Fields);

      //TK 37693  agarra los valores de adi_detalleilp (si no anda sacar la linea)
      FillFieldsDetalleILP(iCountColumnas, aCotizacionId, FieldByName('cs_anio').AsInteger);
      //*****

      Next;
      Inc(iCountColumnas);
    end;

    while iCountColumnas < 7 do
    begin
      ClearFieldsInfCom(iCountColumnas, ['lbInfComAno', 'lbInfComAcc', 'lbInfCom050', 'lbInfCom5066', 'lbInfCom66100',
                        'lbInfComMortales', 'lbInfComDiasComp', 'lbInfComDiasSRT', 'lbInfComIncidencia',
                        'lbInfComCapitas', 'lbInfComPeriodos']);
      Inc(iCountColumnas);
    end;
  finally
    Free;
  end;
  CalcularInformacionComplementaria;


  // Alternativas de cotización..
  bPanel6_1.Items.Clear;
  sSql :=
    'SELECT   ac_id' +
       ' FROM aac_alternativascotizacion' +
      ' WHERE ac_idcotizacion = :idcotizacion' +
        ' AND ac_fechabaja IS NULL' +
   ' ORDER BY ac_numero';
  with GetQueryEx(sSql, [aCotizacionId]) do
  try
    while not Eof do
    begin
      bPanel6_1.Items.Add(FieldByName('ac_id').AsString);
      Next;
    end;
  finally
    Free;
  end;

  // Histórico de movimientos..
  bHistorico.Items.Clear;
  sSql :=
    'SELECT   ho_id' +
       ' FROM afi.aho_historicocotizador' +
      ' WHERE ho_idcotizador = :idcotizacion' +
   ' ORDER BY ho_id DESC';
  with GetQueryEx(sSql, [qyDatos.FieldByName('cz_id').AsInteger]) do
  try
    while not Eof do
    begin
      bHistorico.Items.Add(FieldByName('ho_id').AsString);
      Next;
    end;
  finally
    Free;
  end;

  if aModal then
    PreviewModal
  else
    Preview;
end;

procedure TqrCotizador.QRDBText2Print(Sender: TObject; var Value: String);
begin
  Value := PonerGuiones(Value);
end;

procedure TqrCotizador.bPanel6_1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  sSql: String;
begin
  sSql :=
    'SELECT   *' +
       ' FROM aac_alternativascotizacion' +
      ' WHERE ac_id = :id' +
        ' AND ac_fechabaja IS NULL' +
   ' ORDER BY ac_numero';

  with GetQueryEx(sSql, [bPanel6_1.Item]) do
  try
    lbAlternativasFrecuencia.Caption 			  := FieldByName('ac_frecuencia').AsString;
    lbAlternativasComision.Caption 				  := FieldByName('ac_comision').AsString;
    lbAlternativasVariables.Caption 			  := FieldByName('ac_gsvariables').AsString;
    lbAlternativasUtilidad.Caption 				  := FieldByName('ac_utilidad').AsString;
    lbAlternativasTotalErogaciones.Caption  := FieldByName('ac_totalerogaciones').AsString;
    lbAlternativasPesosCapita.Caption 		  := FieldByName('ac_pesosporcapita').AsString;
    lbAlternativasPesos.Caption 					  := FieldByName('ac_pesos').AsString;
    lbAlternativasPorcentaje.Caption 			  := FieldByName('ac_porcentaje').AsString;
    lbAlternativasVariable.Caption 				  := FieldByName('ac_variable').AsString;
    lbAlternativasPesosCapitaSinSac.Caption := FieldByName('ac_pesosporcapitasinsac').AsString;
    lbAlternativasCotizada.Caption 				  := IIF((FieldByName('ac_cotizada').AsString = 'T'), ' X ', '');
  finally
    Free;
  end;
end;

procedure TqrCotizador.FormatImporte(Sender: TObject; var Value: String);
begin
  try
    Value := FormatFloat('$ #,##0.00', StrToFloat(Value));
  except
    // Lo dejo como está..
  end;
end;

procedure TqrCotizador.FormatPorcentaje2D(Sender: TObject; var Value: String);
begin
  try
    Value := FormatFloat('##0.00%', StrToFloat(Value));
  except
    // Lo dejo como está..
  end;
end;

procedure TqrCotizador.FormatPorcentaje3D(Sender: TObject; var Value: String);
begin
  try
    Value := FormatFloat('##0.000%', StrToFloat(Value));
  except
    // Lo dejo como está..
  end;
end;

procedure TqrCotizador.FormatValorSinDecimales(Sender: TObject; var Value: String);
begin
  try
    Value := FormatFloat('#,##0', StrToFloat(Value));
  except
    // Lo dejo como está..
  end;
end;

procedure TqrCotizador.FormatImporteSinDecimales(Sender: TObject; var Value: String);
begin
  try
    Value := FormatFloat('$ #,##0', StrToFloat(Value));
  except
    // Lo dejo como está..
  end;
end;

procedure TqrCotizador.FormatValor1D(Sender: TObject; var Value: String);
begin
  try
    Value := FormatFloat('#,##0.0', StrToFloat(Value));
  except
    // Lo dejo como está..
  end;
end;

procedure TqrCotizador.bHistoricoBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  function GetTipoOperacion(const aTipoOperacion: String): String;
  begin
    if aTipoOperacion = 'A' then
      Result := 'Alta'
    else if aTipoOperacion = 'C' then
      Result := 'Clonación'
    else if aTipoOperacion = 'M' then
      Result := 'Modificación';
  end;

var
  sSql: String;
begin
  sSql :=
    'SELECT ho_fechaalta, ho_usualta, ho_enpesostotalempresa, ho_alicuotacapitafija, ho_alicuotacapitavariable,' +
          ' ho_tasavariabletotalempresa, ho_tipooperacion' +
     ' FROM afi.aho_historicocotizador' +
    ' WHERE ho_id = :id';

  with GetQueryEx(sSql, [bHistorico.Item]) do
  try
    if not IsEmpty then
    begin
      lbHistoricoFechaTitulo.Caption      := GetTipoOperacion(FieldByName('ho_tipooperacion').AsString);
      lbHistoricoFecha.Caption            := FormatDateTime('dd/mm/yyyy', FieldByName('ho_fechaalta').AsDateTime);
      lbHistoricoUsu.Caption              := FieldByName('ho_usualta').AsString;
      lbHistoricoTotEmpPesos.Caption      := FormatFloat('$ #,##0.00', FieldByName('ho_enpesostotalempresa').AsFloat);
      lbHistoricoTotEmpPorcentaje.Caption := FormatFloat('##0.000%', FieldByName('ho_tasavariabletotalempresa').AsFloat);
      lbHistoricoAlicuotaFija.Caption     := FormatFloat('$ #,##0.00', FieldByName('ho_alicuotacapitafija').AsFloat);
      lbHistoricoAlicuotaVariable.Caption := FormatFloat('##0.000%', FieldByName('ho_alicuotacapitavariable').AsFloat);
    end;
  finally
    Free;
  end;
end;

procedure TqrCotizador.QRDBText121Print(Sender: TObject; var Value: String);
var
  eValor: Extended;
  sSql: String;
begin
  sSql :=
    'SELECT SUM(di_porcentaje) / COUNT(di_porcentaje)' +
     ' FROM adi_detalleilp' +
    ' WHERE di_idcotizacion = :idcotizacion' +
      ' AND di_muerte = ''N''' +
      ' AND di_porcentaje BETWEEN 0 AND 50';
  eValor := ValorSqlExtendedEx(sSql, [FCotizacionId], qyDatos.FieldByName('cz_incap050incapvalorcartera').AsFloat);
  if eValor = 0 then
    eValor := qyDatos.FieldByName('cz_incap050incapvalorcartera').AsFloat;
  Value := FormatFloat('##0.000%', eValor);
end;

procedure TqrCotizador.QRDBText172Print(Sender: TObject; var Value: String);
var
  eValor: Extended;
  sSql: String;
begin
  sSql :=
    'SELECT SUM(di_porcentaje) / COUNT(di_porcentaje)' +
     ' FROM adi_detalleilp' +
    ' WHERE di_idcotizacion = :idcotizacion' +
      ' AND di_muerte = ''N''' +
      ' AND di_porcentaje BETWEEN 50.01 AND 66';
  eValor := ValorSqlExtendedEx(sSql, [FCotizacionId], qyDatos.FieldByName('cz_incap5066incapvalorcartera').AsFloat);
  if eValor = 0 then
    eValor := qyDatos.FieldByName('cz_incap5066incapvalorcartera').AsFloat;
  Value := FormatFloat('##0.000%', eValor);
end;

procedure TqrCotizador.QRDBText223Print(Sender: TObject; var Value: String);
var
  eValor: Extended;
  sSql: String;
begin
  sSql :=
    'SELECT SUM(di_porcentaje) / COUNT(di_porcentaje)' +
     ' FROM adi_detalleilp' +
    ' WHERE di_idcotizacion = :idcotizacion' +
      ' AND di_muerte = ''N''' +
      ' AND di_porcentaje BETWEEN 66.01 AND 100';
  eValor := ValorSqlExtendedEx(sSql, [FCotizacionId], qyDatos.FieldByName('cz_incap66100incapvalorcartera').AsFloat);
  if eValor = 0 then
    eValor := qyDatos.FieldByName('cz_incap66100incapvalorcartera').AsFloat;
  Value := FormatFloat('##0.000%', eValor);
end;

procedure TqrCotizador.QRDBText286Print(Sender: TObject; var Value: String);
begin
  with qyDatos do
    Value := IIF((FieldByName('cz_empresatestigo').AsString = 'GB'), 'Grupo Básico',
             IIF((FieldByName('cz_empresatestigo').AsString = 'EP'), 'Pyme 01/09',
             IIF((FieldByName('cz_empresatestigo').AsString = 'ET'), 'Resol. 559/09', ' ')));
end;

procedure TqrCotizador.bExcepcionRecotizacionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lbTipo.Caption := '';

  with qyDatos do
  begin
    if not FieldByName('sc_usuariorevision').IsNull then
    begin
      lbTipo.Caption := 'Recotización';
      lbUsuarioExcepcionRecotizacion.Caption := FieldByName('sc_usuariorevision').AsString;
      lbMotivoExcepcionRecotizacion.Caption := FieldByName('cotre').AsString;
    end;
    if not FieldByName('sc_usuarioexcepcion').IsNull then
    begin
      lbTipo.Caption := 'Excepción';
      lbUsuarioExcepcionRecotizacion.Caption := FieldByName('sc_usuarioexcepcion').AsString;
      lbMotivoExcepcionRecotizacion.Caption := FieldByName('cotex').AsString;
    end;
  end;

  PrintBand := (lbTipo.Caption <> '');
end;

procedure TqrCotizador.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  sSql: String;
begin
  if FGuardarImpresion then
  begin
    sSql :=
      'UPDATE acz_cotizador' +
        ' SET cz_fechaimpresion = SYSDATE,' +
            ' cz_usuimpresion = :usuimpresion' +
      ' WHERE cz_idcotizacion = :id';
    EjecutarSqlEx(sSql, [Sesion.UserID, FCotizacionId]);
  end;
end;

procedure TqrCotizador.QRDBText19Print(Sender: TObject; var Value: String);
begin
  Value := FormatFloat('##0.00%', IIF((StrToFloatDef(Value, 0) > GetComisionPiso), GetComisionPiso, StrToFloatDef(Value, 0)));
end;

end.
