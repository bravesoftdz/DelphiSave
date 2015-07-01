unit unqrInvestigacionEnfermedad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unArt, ArtQReports, StdCtrls,
  DBCtrls, qrcb_run;

type
  TfrmqrInvestigacionEnfermedad = class(TForm)
    chkMedTrabTipoInt: TQRCheckBox;
    chkMedTrabTipoExt: TQRCheckBox;
    chkHigSegTipoInt: TQRCheckBox;
    chkHigSegTipoExt: TQRCheckBox;
    chkHigieneSegurSI: TQRCheckBox;
    chkHigieneSegurNO: TQRCheckBox;
    chkMedTrabajoSI: TQRCheckBox;
    chkMedTrabajoNO: TQRCheckBox;
    chkMapasRiesgoSI: TQRCheckBox;
    chkMapasRiesgoNO: TQRCheckBox;
    chkMapasRiesgoNC: TQRCheckBox;
    chkMedRuidoSI: TQRCheckBox;
    chkMedRuidoNO: TQRCheckBox;
    chkMedRuidoNC: TQRCheckBox;
    chkEstluminacionSI: TQRCheckBox;
    chkEstluminacionNO: TQRCheckBox;
    chkEstluminacionNC: TQRCheckBox;
    chkMedCargaTermSI: TQRCheckBox;
    chkMedCargaTermNO: TQRCheckBox;
    chkMedCargaTermNC: TQRCheckBox;
    chkNormasEstabSI: TQRCheckBox;
    chkNormasEstabNO: TQRCheckBox;
    chkNormasEstabNC: TQRCheckBox;
    chkMedContracSI: TQRCheckBox;
    chkMedContracNO: TQRCheckBox;
    chkMedContracNC: TQRCheckBox;
    chkProdPeligrosoSI: TQRCheckBox;
    chkProdPeligrosoNO: TQRCheckBox;
    chkProdPeligrosoNC: TQRCheckBox;
    chkPlanAccionSI: TQRCheckBox;
    chkPlanAccionNO: TQRCheckBox;
    chkPlanAccionNC: TQRCheckBox;
    chkMedImplementSI: TQRCheckBox;
    chkMedImplementNO: TQRCheckBox;
    chkMedImplementNC: TQRCheckBox;
    chkPlanEscritoSI: TQRCheckBox;
    chkPlanEscritoNO: TQRCheckBox;
    chkPlanEscritoNC: TQRCheckBox;
    qEE_HORASEXTRAS: TQRLabel;
    qEE_TURNOROTATIVO: TQRLabel;
    qEE_PROGRAMAAPROBADO: TQRLabel;
    qEE_TIPOESTABLECIMIENTO: TQRLabel;
    qshEE_PROGRAMAAPROBADO2: TQRShape;
    qshEE_TIPOESTABLECIMIENTO: TQRShape;
    qshEE_TURNOROTATIVO2: TQRShape;
    qshEE_HORASEXTRAS2: TQRShape;
    Hoja1: TQuickRep;
    BandaDetalleH1: TQRBand;
    QRShape40: TQRShape;
    QRLabel63: TQRLabel;
    QRShape1: TQRShape;
    qriLogo: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape18: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel31: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRShape23: TQRShape;
    QRLabel32: TQRLabel;
    QRDBText19: TQRDBText;
    QRShape24: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText21: TQRDBText;
    QRShape26: TQRShape;
    QRDBText22: TQRDBText;
    QRLabel35: TQRLabel;
    QRShape27: TQRShape;
    QRLabel36: TQRLabel;
    QRShape28: TQRShape;
    QRLabel37: TQRLabel;
    QRShape36: TQRShape;
    QRLabel51: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText32: TQRDBText;
    QRShape37: TQRShape;
    QRLabel56: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel57: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel58: TQRLabel;
    QRDBText35: TQRDBText;
    QRShape38: TQRShape;
    QRLabel59: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel60: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel61: TQRLabel;
    QRShape39: TQRShape;
    QRDBText39: TQRDBText;
    QRLabel62: TQRLabel;
    QRShape41: TQRShape;
    QRLabel64: TQRLabel;
    QRDBText40: TQRDBText;
    QRShape43: TQRShape;
    QRLabel65: TQRLabel;
    QRDBText41: TQRDBText;
    QRShape44: TQRShape;
    QRLabel67: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel66: TQRLabel;
    QRDBText42: TQRDBText;
    QRShape45: TQRShape;
    QRLabel68: TQRLabel;
    QRShape49: TQRShape;
    QRLabel69: TQRLabel;
    QRDBText44: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText45: TQRDBText;
    Hoja2: TQuickRep;
    BandaDetalleH2: TQRBand;
    QRShape29: TQRShape;
    QRLabel38: TQRLabel;
    sdqEnfermedadEstablecimiento: TSDQuery;
    QRShape25: TQRShape;
    QRLabel71: TQRLabel;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRLabel72: TQRLabel;
    QRShape50: TQRShape;
    QRLabel73: TQRLabel;
    QRDBText48: TQRDBText;
    QRShape51: TQRShape;
    QRDBText49: TQRDBText;
    QRLabel74: TQRLabel;
    QRShape31: TQRShape;
    QRDBText50: TQRDBText;
    QRLabel40: TQRLabel;
    QRShape52: TQRShape;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRShape53: TQRShape;
    QRShape58: TQRShape;
    QRDBText51: TQRDBText;
    QRLabel77: TQRLabel;
    QRShape59: TQRShape;
    QRLabel78: TQRLabel;
    QRDBText52: TQRDBText;
    QRShape60: TQRShape;
    QRLabel79: TQRLabel;
    QRDBText53: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText23: TQRLabel;
    QRDBText37: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel45: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText67: TQRDBText;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRDBText69: TQRDBText;
    QRShape65: TQRShape;
    QRLabel84: TQRLabel;
    sdqTestigos: TSDQuery;
    CompositeReport: TQRCompositeReport;
    BandaTestigos: TQRLoopBand;
    Hoja3: TQuickRep;
    QRLabel39: TQRLabel;
    QRDBText78: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRLabel43: TQRLabel;
    Titulo39: TQRBand;
    qrLabelHuboTestigos: TQRLabel;
    Hoja4: TQuickRep;
    BandaImplementacion: TQRLoopBand;
    QRDBText74: TQRDBText;
    sdqMedidas: TSDQuery;
    sdqImplementacion: TSDQuery;
    QRDBText72: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText84: TQRDBText;
    QRShape33: TQRShape;
    QRShape61: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape72: TQRShape;
    QRDBText85: TQRDBText;
    QRLabel100: TQRLabel;
    QRDBText86: TQRDBText;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    Hoja5: TQuickRep;
    Hoja6: TQuickRep;
    Titulo45: TQRBand;
    QRShape115: TQRShape;
    QRLabel108: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRShape117: TQRShape;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRLabel117: TQRLabel;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText103: TQRDBText;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    QRShape133: TQRShape;
    QRLabel118: TQRLabel;
    BandaEntrevistados: TQRLoopBand;
    QRLabel119: TQRLabel;
    QRDBText91: TQRDBText;
    QRLabel120: TQRLabel;
    QRDBText92: TQRDBText;
    QRLabel121: TQRLabel;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRLabel122: TQRLabel;
    BandaDetalleH6: TQRBand;
    QRLabel114: TQRLabel;
    QRShape116: TQRShape;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRDBText96: TQRDBText;
    QRDBText101: TQRDBText;
    QRLabel112: TQRLabel;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    BandaSumario30: TQRBand;
    QRDBText54: TQRDBText;
    QRLabel80: TQRLabel;
    QRLabel90: TQRLabel;
    QRDBText83: TQRDBText;
    Sumario38: TQRBand;
    QRDBText82: TQRDBText;
    QRLabel85: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRShape34: TQRShape;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRDBText65: TQRDBText;
    sdqDatosLaborales: TSDQuery;
    QRLabel135: TQRLabel;
    QRDBText102: TQRDBText;
    QRLabel138: TQRLabel;
    Hoja9: TQuickRep;
    QRBand2: TQRBand;
    QRShape46: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel139: TQRLabel;
    QRShape141: TQRShape;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    sdqDatosAdicionales: TSDQuery;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel163: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel185: TQRLabel;
    QRLabel186: TQRLabel;
    QRLabel187: TQRLabel;
    QRLabel188: TQRLabel;
    QRLabel189: TQRLabel;
    QRLabel190: TQRLabel;
    QRLabel191: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel192: TQRLabel;
    QRLabel193: TQRLabel;
    QRLabel194: TQRLabel;
    QRLabel195: TQRLabel;
    chkPisoOtros: TQRCheckBox;
    chkPisoTierra: TQRCheckBox;
    chkPisoHormi: TQRCheckBox;
    chkPisoMad: TQRCheckBox;
    chkParedOtros: TQRCheckBox;
    chkParedChapa: TQRCheckBox;
    chkParedHormi: TQRCheckBox;
    chkParedMad: TQRCheckBox;
    chkTechoOtros: TQRCheckBox;
    chkTechoLoza: TQRCheckBox;
    chkTechoTing: TQRCheckBox;
    chkTechoMad: TQRCheckBox;
    chkVentOtros: TQRCheckBox;
    chkVentInyect: TQRCheckBox;
    chkVentExtrac: TQRCheckBox;
    chkVentNat: TQRCheckBox;
    chkLocOtros: TQRCheckBox;
    chkLocCamp: TQRCheckBox;
    chkLocCab: TQRCheckBox;
    chkLocRend: TQRCheckBox;
    chkRuidoPaneles: TQRCheckBox;
    chkRuidoAisAcust: TQRCheckBox;
    chkIlumArtif: TQRCheckBox;
    chkIlumNat: TQRCheckBox;
    chkRiesgosAnteSI: TQRCheckBox;
    chkTrabInsalubSI: TQRCheckBox;
    chkRiesgosAnteNO: TQRCheckBox;
    chkTrabInsalubNO: TQRCheckBox;
    QRLabel196: TQRLabel;
    QRLabel197: TQRLabel;
    QRLabel198: TQRLabel;
    QRLabel199: TQRLabel;
    QRLabel200: TQRLabel;
    QRLabel201: TQRLabel;
    QRLabel202: TQRLabel;
    QRLabel203: TQRLabel;
    lbMedTrabResp: TQRLabel;
    lbHigieSegurResp: TQRLabel;
    QRLabel206: TQRLabel;
    QRLabel207: TQRLabel;
    QRLabel208: TQRLabel;
    QRLabel209: TQRLabel;
    lbMedTrabRespMatri: TQRLabel;
    lbHigSegRespMatri: TQRLabel;
    lbAntecedObs: TQRLabel;
    Hoja8: TQuickRep;
    QRLabel205: TQRLabel;
    sdqAgentesDetectados: TSDQuery;
    QRBand4: TQRBand;
    QRLabel223: TQRLabel;
    chkPresenciaAgenteSI: TQRCheckBox;
    chkPresenciaAgenteNO: TQRCheckBox;
    lbObsPresenciaAgente: TQRDBText;
    QRLabel227: TQRLabel;
    lbObsFrecuencia: TQRDBText;
    lbFrecuencia: TQRLabel;
    QRLabel229: TQRLabel;
    lbObsDuraExpo: TQRDBText;
    lbDuracion: TQRLabel;
    QRLabel231: TQRLabel;
    chkMedAmbSI: TQRCheckBox;
    chkMedAmbNO: TQRCheckBox;
    lbObsMedAmb: TQRDBText;
    QRLabel232: TQRLabel;
    lbObsNivConcent: TQRDBText;
    lbNivConcec: TQRLabel;
    QRLabel234: TQRLabel;
    chkSuperaLimiteSI: TQRCheckBox;
    chkSuperaLimiteNO: TQRCheckBox;
    lbObsLimiteLegal: TQRDBText;
    QRLabel235: TQRLabel;
    chkEPPSI: TQRCheckBox;
    chkEPPNO: TQRCheckBox;
    lbObsEPP: TQRDBText;
    QRLabel236: TQRLabel;
    chkCapacitSI: TQRCheckBox;
    chkCapacitNO: TQRCheckBox;
    lbObsCapacit: TQRDBText;
    QRLabel237: TQRLabel;
    chkEstErgoSI: TQRCheckBox;
    chkEstErgoNO: TQRCheckBox;
    lbObsEstErgo: TQRDBText;
    QRLabel238: TQRLabel;
    chkVacuSI: TQRCheckBox;
    chkVacuNO: TQRCheckBox;
    lbObsVacu: TQRDBText;
    QRLabel239: TQRLabel;
    QRLabel240: TQRLabel;
    QRLabel241: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel210: TQRLabel;
    QRLabel222: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText68: TQRDBText;
    QRLabel204: TQRLabel;
    QRLabel211: TQRLabel;
    QRDBText70: TQRDBText;
    QRDBText90: TQRDBText;
    QRLabel212: TQRLabel;
    Hoja7: TQuickRep;
    Titulo46: TQRBand;
    QRShape119: TQRShape;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel126: TQRLabel;
    QRShape122: TQRShape;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRShape118: TQRShape;
    QRShape123: TQRShape;
    QRLabel113: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRShape120: TQRShape;
    QRLabel130: TQRLabel;
    QRShape134: TQRShape;
    QRLabel131: TQRLabel;
    QRShape135: TQRShape;
    QRLabel132: TQRLabel;
    BandaDetalleH5: TQRBand;
    QRShape112: TQRShape;
    QRLabel109: TQRLabel;
    QRDBText95: TQRDBText;
    Titulo41: TQRBand;
    QRShape42: TQRShape;
    QRLabel88: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    BandaMedidas: TQRLoopBand;
    QRShape89: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    DC_NUMERO: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    ArtQRDBText1: TArtQRDBText;
    QRBand1: TQRBand;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel86: TQRLabel;
    QRShape32: TQRShape;
    QRShape35: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    procedure Hoja1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure BandaDetalleH1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CompositeReportAddReports(Sender: TObject);
    procedure BandaTestigosAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure Hoja2BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrLabelHuboTestigosPrint(sender: TObject; var Value: String);
    procedure BandaMedidasAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure BandaImplementacionAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Hoja4BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure Hoja6BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText46Print(sender: TObject; var Value: String);
  private
    FSEXID: integer;
  public
    property SEXID: integer read FSEXID write FSEXID;
    procedure CargaAgentesDetectados;
    procedure CargarDatosAdicionales;
    procedure ExportPDF(IdEnfermedadEstablecimiento: TTableId; pPath: String);
    procedure Do_Imprimir(IdEnfermedadEstablecimiento: TTableId; pPath : String = '');
  end;

var
  frmqrInvestigacionEnfermedad: TfrmqrInvestigacionEnfermedad;

implementation

uses unDmPrincipal, General, ArchFuncs, unExportPDF;

{$R *.DFM}

procedure TfrmqrInvestigacionEnfermedad.Hoja1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if sdqEnfermedadEstablecimiento.RecordCount <> 1 then
      ShowMessage(
          'Error en la consulta ejecutada. La consulta devolvió ' +
          IntToStr(sdqEnfermedadEstablecimiento.RecordCount) +
          ' registros.' +  #13#10 +
          'Verifique que no falte cargar algún dato o consulte con sistemas.'
      );
end;

procedure TfrmqrInvestigacionEnfermedad.BandaDetalleH1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  with sdqEnfermedadEstablecimiento do
  begin
    if   FieldByName('EE_TIPOESTABLECIMIENTO').AsString = 'O' then
    begin
      qEE_TIPOESTABLECIMIENTO.Left := qshEE_TIPOESTABLECIMIENTO.Left + 2;

      if FieldByName('EE_PROGRAMAAPROBADO').AsString = 'N' then
          qEE_PROGRAMAAPROBADO.Left := qshEE_PROGRAMAAPROBADO2.Left + 2
      else
        if not(FieldByName('EE_PROGRAMAAPROBADO').AsString = 'S') then
            qEE_PROGRAMAAPROBADO.Enabled := False;
    end
    else
      qEE_PROGRAMAAPROBADO.Enabled := False;

    if  (FieldByName('EE_TURNOROTATIVO').AsString = 'N') then
      qEE_TURNOROTATIVO.Left := qshEE_TURNOROTATIVO2.Left + 2;

    if (FieldByName('EE_HORASEXTRAS').AsString = 'N') then
        qEE_HORASEXTRAS.Left := qshEE_HORASEXTRAS2.Left + 2;

  end;
end;

procedure TfrmqrInvestigacionEnfermedad.Do_Imprimir(
    IdEnfermedadEstablecimiento: TTableId; pPath : String = '');
begin
  qriLogo.Picture.Bitmap.LoadFromResourceName( hInstance, 'LOGO_ART' );
  qriLogo.AutoSize := False;
  qriLogo.Stretch := True;                                           
  qriLogo.Update;

  sdqTestigos.ParamByName( 'ID' ).AsInteger                   := IdEnfermedadEstablecimiento;
  sdqEnfermedadEstablecimiento.ParamByName( 'ID' ).AsInteger  := IdEnfermedadEstablecimiento;
  OpenQuery( sdqEnfermedadEstablecimiento );

  sdqDatosLaborales.ParamByName( 'Id_Trabajador' ).AsInteger     := sdqEnfermedadEstablecimiento.FieldByName('TJ_ID').AsInteger;
  sdqDatosLaborales.ParamByName( 'Contrato' ).AsInteger          := sdqEnfermedadEstablecimiento.FieldByName('CO_CONTRATO').AsInteger;
  sdqDatosLaborales.ParamByName( 'FechaEnfermedad').AsDateTime   := sdqEnfermedadEstablecimiento.FieldByName('EX_FECHAACCIDENTE').AsDateTime;

//  if sdqEnfermedadEstablecimiento.FieldByName('DG_ANTIGUEDADPUESTO').IsNull then
    sdqDatosLaborales.ParamByName( 'AntiguedadPuesto' ).AsString := ''; //**--
//  else
//    sdqDatosLaborales.ParamByName( 'AntiguedadPuesto' ).AsDateTime := sdqEnfermedadEstablecimiento.FieldByName('DG_ANTIGUEDADPUESTO').AsDateTime;

  OpenQuery( sdqDatosLaborales );

  sdqMedidas.ParamByName( 'ID' ).AsInteger := IdEnfermedadEstablecimiento;
  OpenQuery( sdqMedidas );

  sdqImplementacion.ParamByName( 'ID' ).AsInteger := IdEnfermedadEstablecimiento;
  OpenQuery( sdqImplementacion );

  sdqAgentesDetectados.ParamByName('sexid').AsInteger := FSEXID;
  OpenQuery( sdqAgentesDetectados );

  sdqDatosAdicionales.ParamByName('sexid').AsInteger := FSEXID;
  OpenQuery( sdqDatosAdicionales );
  CargarDatosAdicionales;

  BandaMedidas.PrintCount := sdqMedidas.RecordCount;
  if BandaMedidas.PrintCount = 0 then
    BandaMedidas.PrintCount := 1;

  BandaImplementacion.PrintCount := sdqImplementacion.RecordCount;
  if BandaImplementacion.PrintCount = 0 then
    BandaImplementacion.PrintCount := 1;

  // Para la BandaEntrevistados ver el evento BandaTestigosAfterPrint...
  if pPath = '' then
    CompositeReport.Preview
  else
  begin
    CompositeReport.Prepare;
    CompositeReport.QRPrinter.Title := pPath;
    CompositeReport.QRPrinter.Print;
    CompositeReport.QRPrinter.Free;
    CompositeReport.QRPrinter.Cleanup;
  end;
end;

procedure TfrmqrInvestigacionEnfermedad.FormCreate(Sender: TObject);
var
  i: byte;
begin
  for i := 0 to ComponentCount-1
  do if  (Components[i].ClassType = TQRDBText)
     and (not Assigned(TQRDBText(Components[i]).DataSet))
     then TQRDBText(Components[i]).DataSet := sdqEnfermedadEstablecimiento;

end;

procedure TfrmqrInvestigacionEnfermedad.CompositeReportAddReports(Sender: TObject);
begin
  CompositeReport.Reports.Add( Hoja1 );
  CompositeReport.Reports.Add( Hoja2 );
  CompositeReport.Reports.Add( Hoja3 );
  CompositeReport.Reports.Add( Hoja4 );
  CompositeReport.Reports.Add( Hoja5 );
  CompositeReport.Reports.Add( Hoja6 );

  if not sdqAgentesDetectados.IsEmpty then
    CompositeReport.Reports.Add( Hoja8 );
  if not sdqDatosAdicionales.IsEmpty then
    CompositeReport.Reports.Add( Hoja9 );

  CompositeReport.Reports.Add( Hoja7 );
  
end;

procedure TfrmqrInvestigacionEnfermedad.BandaTestigosAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if   not sdqTestigos.Eof
  then sdqTestigos.Next;
end;

procedure TfrmqrInvestigacionEnfermedad.Hoja2BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if   sdqTestigos.Active
  then sdqTestigos.Close;

  sdqTestigos.ParamByName( 'TIPO' ).AsString := 'T';

  OpenQuery( sdqTestigos );

  BandaTestigos.PrintCount := sdqTestigos.RecordCount;

  if   BandaTestigos.PrintCount = 0
  then BandaTestigos.PrintCount := 1;
end;

procedure TfrmqrInvestigacionEnfermedad.qrLabelHuboTestigosPrint(Sender: TObject; var Value: String);
begin
  if BandaTestigos.PrintCount > 0 then Value := '';
end;

procedure TfrmqrInvestigacionEnfermedad.BandaMedidasAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if   not sdqMedidas.Eof
  then sdqMedidas.Next;
end;

procedure TfrmqrInvestigacionEnfermedad.BandaImplementacionAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if   not sdqImplementacion.Eof
  then sdqImplementacion.Next;
end;

procedure TfrmqrInvestigacionEnfermedad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sdqEnfermedadEstablecimiento.Close;
  sdqTestigos.Close;
  sdqMedidas.Close;
  sdqImplementacion.Close;
end;

procedure TfrmqrInvestigacionEnfermedad.Hoja4BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if sdqMedidas.Active then
    sdqMedidas.First;

  if sdqImplementacion.Active then
    sdqImplementacion.First;
end;

procedure TfrmqrInvestigacionEnfermedad.Hoja6BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  sdqTestigos.Close;
  sdqTestigos.ParamByName( 'TIPO' ).AsString := 'E';
  OpenQuery( sdqTestigos );

  BandaEntrevistados.PrintCount := sdqTestigos.RecordCount;

  if   BandaEntrevistados.PrintCount = 0
  then BandaEntrevistados.PrintCount := 1;
end;

procedure TfrmqrInvestigacionEnfermedad.QRDBText46Print(Sender: TObject; var Value: String);
begin
  Value := FormatFloat('#,##0.00', StrToFloatDef(Value, 0)) + ' m²';
end;

procedure TfrmqrInvestigacionEnfermedad.CargarDatosAdicionales;
begin
  with sdqDatosAdicionales do
  begin
    {DATOS DEL SECTOR/PUESTO QUE SE ESTUDIA}
    chkPisoMad.Checked      := FieldByName('ED_PISOMAD').AsString = 'S';
    chkPisoHormi.Checked    := FieldByName('ED_PISOHORMI').AsString = 'S';
    chkPisoTierra.Checked   := FieldByName('ED_PISOTIERRA').AsString = 'S';
    chkPisoOtros.Checked    := FieldByName('ED_PISOOTROS').AsString = 'S';
    chkParedMad.Checked     := FieldByName('ED_PAREDMAD').AsString = 'S';
    chkParedHormi.Checked   := FieldByName('ED_PAREDHORMI').AsString = 'S';
    chkParedChapa.Checked   := FieldByName('ED_PAREDCHAPA').AsString = 'S';
    chkParedOtros.Checked   := FieldByName('ED_PAREDOTROS').AsString = 'S';
    chkTechoMad.Checked     := FieldByName('ED_TECHOMAD').AsString = 'S';
    chkTechoTing.Checked    := FieldByName('ED_TECHOTING').AsString = 'S';
    chkTechoLoza.Checked    := FieldByName('ED_TECHOLOZA').AsString = 'S';
    chkTechoOtros.Checked   := FieldByName('ED_TECHOOTROS').AsString = 'S';
    chkVentNat.Checked      := FieldByName('ED_VENTNAT').AsString = 'S';
    chkVentExtrac.Checked   := FieldByName('ED_VENTEXTRAC').AsString = 'S';
    chkVentInyect.Checked   := FieldByName('ED_VENTINYEC').AsString = 'S';
    chkVentOtros.Checked    := FieldByName('ED_VENTOTROS').AsString = 'S';
    chkLocRend.Checked      := FieldByName('ED_LOCREND').AsString = 'S';
    chkLocCab.Checked       := FieldByName('ED_LOCCAB').AsString = 'S';
    chkLocCamp.Checked      := FieldByName('ED_LOCCAMP').AsString = 'S';
    chkLocOtros.Checked     := FieldByName('ED_LOCOTROS').AsString = 'S';
    chkIlumNat.Checked      := FieldByName('ED_ILUMNAT').AsString = 'S';
    chkIlumArtif.Checked    := FieldByName('ED_ILUMARTIF').AsString = 'S';
    chkRuidoAisAcust.Checked:= FieldByName('ED_RUIDOAISACUST').AsString = 'S';
    chkRuidoPaneles.Checked := FieldByName('ED_RUIDOPANELES').AsString = 'S';

    {ANTECEDENTES}
    if FieldByName('ED_RIESGOSANT').AsString = 'S' then
      chkRiesgosAnteSI.Checked := True
    else
      if FieldByName('ED_RIESGOSANT').AsString = 'N' then
        chkRiesgosAnteSI.Checked := False;

    if FieldByName('ED_TRABINSALUB').AsString = 'S' then
      chkTrabInsalubSI.Checked := True
    else
      if FieldByName('ED_TRABINSALUB').AsString = 'N' then
        chkTrabInsalubSI.Checked := False;

    lbAntecedObs.Caption := FieldByName('ED_ANTECEDOBS').AsString;

    {DIAGNOSTICO DE SEGURIDAD E HIGIENE DE LA EMPRESA}
    chkPlanEscritoSI.Checked  := IIF(FieldByName('ED_PLANESCRITO').AsString = 'S', True, False);
    chkPlanEscritoNO.Checked  := IIF(FieldByName('ED_PLANESCRITO').AsString = 'N', True, False);
    chkPlanEscritoNC.Checked  := IIF(FieldByName('ED_PLANESCRITO').AsString = 'X', True, False);
    chkMapasRiesgoSI.Checked  := IIF(FieldByName('ED_MAPARIESGO').AsString = 'S', True, False);
    chkMapasRiesgoNO.Checked  := IIF(FieldByName('ED_MAPARIESGO').AsString = 'N', True, False);
    chkMapasRiesgoNC.Checked  := IIF(FieldByName('ED_MAPARIESGO').AsString = 'X', True, False);
    chkMedRuidoSI.Checked     := IIF(FieldByName('ED_MEDRUIDO').AsString = 'S', True, False);
    chkMedRuidoNO.Checked     := IIF(FieldByName('ED_MEDRUIDO').AsString = 'N', True, False);
    chkMedRuidoNC.Checked     := IIF(FieldByName('ED_MEDRUIDO').AsString = 'X', True, False);
    chkEstluminacionSI.Checked:= IIF(FieldByName('ED_ILUMNPLANTA').AsString = 'S', True, False);
    chkEstluminacionNO.Checked:= IIF(FieldByName('ED_ILUMNPLANTA').AsString = 'N', True, False);
    chkEstluminacionNC.Checked:= IIF(FieldByName('ED_ILUMNPLANTA').AsString = 'X', True, False);
    chkMedCargaTermSI.Checked := IIF(FieldByName('ED_MEDCARGATERM').AsString = 'S', True, False);
    chkMedCargaTermNO.Checked := IIF(FieldByName('ED_MEDCARGATERM').AsString = 'N', True, False);
    chkMedCargaTermNC.Checked := IIF(FieldByName('ED_MEDCARGATERM').AsString = 'X', True, False);
    chkNormasEstabSI.Checked  := IIF(FieldByName('ED_NORMASESTAB').AsString = 'S', True, False);
    chkNormasEstabNO.Checked  := IIF(FieldByName('ED_NORMASESTAB').AsString = 'N', True, False);
    chkNormasEstabNC.Checked  := IIF(FieldByName('ED_NORMASESTAB').AsString = 'X', True, False);
    chkMedContracSI.Checked   := IIF(FieldByName('ED_MEDCONTRAC').AsString = 'S', True, False);
    chkMedContracNO.Checked   := IIF(FieldByName('ED_MEDCONTRAC').AsString = 'N', True, False);
    chkMedContracNC.Checked   := IIF(FieldByName('ED_MEDCONTRAC').AsString = 'X', True, False);
    chkProdPeligrosoSI.Checked:= IIF(FieldByName('ED_PRODPELIGROSO').AsString = 'S', True, False);
    chkProdPeligrosoNO.Checked:= IIF(FieldByName('ED_PRODPELIGROSO').AsString = 'N', True, False);
    chkProdPeligrosoNC.Checked:= IIF(FieldByName('ED_PRODPELIGROSO').AsString = 'X', True, False);
    chkPlanAccionSI.Checked   := IIF(FieldByName('ED_PLANACCION').AsString = 'S', True, False);
    chkPlanAccionNO.Checked   := IIF(FieldByName('ED_PLANACCION').AsString = 'N', True, False);
    chkPlanAccionNC.Checked   := IIF(FieldByName('ED_PLANACCION').AsString = 'X', True, False);
    chkMedImplementSI.Checked := IIF(FieldByName('ED_MEDIMPLEMENT').AsString = 'S', True, False);
    chkMedImplementNO.Checked := IIF(FieldByName('ED_MEDIMPLEMENT').AsString = 'N', True, False);
    chkMedImplementNC.Checked := IIF(FieldByName('ED_MEDIMPLEMENT').AsString = 'X', True, False);

    {SERIVCIOS PROFESIONALES}
    chkMedTrabajoSI.Checked    := IIF(FieldByName('ED_MEDTRABAJO').AsString = 'S', True, False);
    chkMedTrabajoNO.Checked    := IIF(FieldByName('ED_MEDTRABAJO').AsString = 'N', True, False);
    chkHigieneSegurSI.Checked  := IIF(FieldByName('ED_HIGIENESEGUR').AsString = 'S', True, False);
    chkHigieneSegurNO.Checked  := IIF(FieldByName('ED_HIGIENESEGUR').AsString = 'N', True, False);
    lbMedTrabResp.Caption      := FieldByName('ED_MEDTRABRESP').AsString;
    lbHigieSegurResp.Caption   := FieldByName('ED_HIGIESEGURRESP').AsString;
    lbMedTrabRespMatri.Caption := FieldByName('ED_MEDTRABRESPMATTRI').AsString;
    lbHigSegRespMatri.Caption  := FieldByName('ED_HIGREGRESPMATRI').AsString;
    chkMedTrabTipoInt.Checked  := IIF(FieldByName('ED_MEDTRABTIPOINT').AsString = 'S', True, False);
    chkMedTrabTipoExt.Checked  := IIF(FieldByName('ED_MEDTRABTIPOEXT').AsString = 'S', True, False);
    chkHigSegTipoInt.Checked   := IIF(FieldByName('ED_HIGSEGTIPOINT').AsString = 'S', True, False);
    chkHigSegTipoExt.Checked   := IIF(FieldByName('ED_HIGSEGTIPOEXT').AsString = 'S', True, False);
  end;
end;

procedure TfrmqrInvestigacionEnfermedad.CargaAgentesDetectados;
begin
  with sdqAgentesDetectados do
  begin
    chkPresenciaAgenteSI.Checked := FieldByName('AD_PRESENCIAAGENTE').AsString = 'S';
    chkPresenciaAgenteNO.Checked := FieldByName('AD_PRESENCIAAGENTE').AsString = 'N';
    lbFrecuencia.Caption         := FieldByName('AD_FRECUENCIAEXPO').AsString;
    lbDuracion.Caption           := FieldByName('AD_DURACIONEXPO').AsString;
    chkMedAmbSI.Checked          := FieldByName('AD_MEDICIONESAMB').AsString = 'S';
    chkMedAmbNO.Checked          := FieldByName('AD_MEDICIONESAMB').AsString = 'N';
    lbNivConcec.Caption          := FieldByName('AD_NIVELCONCENTRACION').AsString;
    chkSuperaLimiteSI.Checked    := FieldByName('AD_SUPERALIMITE').AsString = 'S';
    chkSuperaLimiteNO.Checked    := FieldByName('AD_SUPERALIMITE').AsString = 'N';
    chkEPPSI.Checked             := FieldByName('AD_EPPADECUADOS').AsString = 'S';
    chkEPPNO.Checked             := FieldByName('AD_EPPADECUADOS').AsString = 'N';
    chkCapacitSI.Checked         := FieldByName('AD_CAPACITATRAB').AsString = 'S';
    chkCapacitNO.Checked         := FieldByName('AD_CAPACITATRAB').AsString = 'N';
    chkEstErgoSI.Checked         := FieldByName('AD_ESTUDIOSERG').AsString = 'S';
    chkEstErgoNO.Checked         := FieldByName('AD_ESTUDIOSERG').AsString = 'N';
    chkVacuSI.Checked            := FieldByName('AD_VACUNACION').AsString = 'S';
    chkVacuNO.Checked            := FieldByName('AD_VACUNACION').AsString = 'N';
  end;
end;

procedure TfrmqrInvestigacionEnfermedad.QRBand4BeforePrint(Sender:
    TQRCustomBand; var PrintBand: Boolean);
begin
  CargaAgentesDetectados;
end;

procedure TfrmqrInvestigacionEnfermedad.ExportPDF(
  IdEnfermedadEstablecimiento: TTableId; pPath: String);
begin
  Do_Imprimir(IdEnfermedadEstablecimiento,pPath);
end;

end.
