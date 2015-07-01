unit unRptResumen;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine;

type
  TrptResumen = class(TQuickRep)
    qrHeader: TQRBand;
    qrTitle: TQRBand;
    qrTituloColumnas: TQRBand;
    qrDetailBand: TQRBand;
    sdqReporte: TSDQuery;
    sdqLiquidaciones: TSDQuery;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    qrlEmpDep: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText24: TQRDBText;
    ChildBand5: TQRChildBand;
    qrPrestador: TQRChildBand;
    qrIncapacidades: TQRChildBand;
    QRLabel26: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText35: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText39: TQRDBText;
    qrlCie10: TQRLabel;
    qrdbDiagnosticooms: TQRDBText;
    qrlDias: TQRLabel;
    qrdbDiasLeve: TQRDBText;
    qrdbDiasModerado: TQRDBText;
    qrdbDiasGrave: TQRDBText;
    qrlIncapacidad: TQRLabel;
    qrdbIncapLeve: TQRDBText;
    qrdbIncapModerado: TQRDBText;
    qrdbIncapGrave: TQRDBText;
    qrdbDescripcion: TQRDBText;
    qrDocumentacion: TQRChildBand;
    QRLabel43: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel52: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRLabel60: TQRLabel;
    QRDBText65: TQRDBText;
    QRLabel62: TQRLabel;
    qrCobranzas: TQRChildBand;
    QRLabel61: TQRLabel;
    QRLabel63: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText66: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText67: TQRDBText;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    qrFooter: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRDBText77: TQRDBText;
    sdqLiquidacionesTIPO: TStringField;
    sdqLiquidacionesNUMLIQUI: TFloatField;
    sdqLiquidacionesDESCRIPCION: TStringField;
    sdqLiquidacionesDESCRIPCION_EXTRA: TStringField;
    sdqLiquidacionesIMPORTE: TFloatField;
    sdqLiquidacionesDESDE: TDateTimeField;
    sdqLiquidacionesHASTA: TDateTimeField;
    sdqLiquidacionesPROCESO: TDateTimeField;
    sdqLiquidacionesEMISION: TDateTimeField;
    sdqLiquidacionesAPROBADO: TDateTimeField;
    QRLabel77: TQRLabel;
    QRDBText78: TQRDBText;
    QRLabel78: TQRLabel;
    QRDBText79: TQRDBText;
    QRLabel79: TQRLabel;
    QRDBText80: TQRDBText;
    QRLabel66: TQRLabel;
    qrSummary: TQRBand;
    QRExpr2: TQRExpr;
    qrExtraDetail: TQRChildBand;
    QRDBText76: TQRDBText;
    ChildBand8: TQRChildBand;
    QRLabel80: TQRLabel;
    QRDBText81: TQRDBText;
    QRLabel81: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText82: TQRDBText;
    sdqReporteOCURRENCIAS: TFloatField;
    sdqReporteMEDIACIONES: TStringField;
    sdqReporteHAY_MULTIPLES: TStringField;
    sdqReporteHAY_RECAIDAS: TStringField;
    sdqReporteES_PLURIEMPLEO: TStringField;
    sdqReporteHOY: TDateTimeField;
    sdqReporteESTADO: TStringField;
    sdqReporteTIPO: TStringField;
    sdqReporteGRAVEDAD: TStringField;
    sdqReporteEX_FECHAACCIDENTE: TDateTimeField;
    sdqReporteEX_HORAACCIDENTE: TStringField;
    sdqReporteEX_BAJAMEDICA: TDateTimeField;
    sdqReporteSINIESTRO: TStringField;
    sdqReporteEX_CUIT: TStringField;
    sdqReporteEX_CUIL: TStringField;
    sdqReporteEX_BREVEDESCRIPCION: TStringField;
    sdqReporteEX_OBSERVACIONES: TStringField;
    sdqReporteJUICIO: TStringField;
    sdqReporteCAUSAFIN: TStringField;
    sdqReporteEMPRESA_DOMICILIO: TStringField;
    sdqReporteEMPRESA_NOMBRE: TStringField;
    sdqReporteEMPRESA_TELEFONOS: TStringField;
    sdqReporteEMPRESA_LOCALIDAD: TStringField;
    sdqReporteEMPRESA_CPOSTAL: TStringField;
    sdqReporteEMPRESA_PROVINCIA: TStringField;
    sdqReporteTRABAJADOR_DOMICILIO: TStringField;
    sdqReporteTJ_NOMBRE: TStringField;
    sdqReporteTJ_LOCALIDAD: TStringField;
    sdqReporteTJ_CPOSTAL: TStringField;
    sdqReporteTRABAJADOR_PROVINCIA: TStringField;
    sdqReporteDENUNCIA_DOMICILIO: TStringField;
    sdqReporteDENUNCIA_NOMBRE: TStringField;
    sdqReporteDENUNCIA_CPOSTAL: TStringField;
    sdqReporteDENUNCIA_CPOSTALA: TStringField;
    sdqReporteDENUNCIA_LOCALIDAD: TStringField;
    sdqReporteDENUNCIA_TELEFONOS: TStringField;
    sdqReporteDENUNCIA_PROVINCIA: TStringField;
    sdqReportePRESTADOR_DOMICILIO: TStringField;
    sdqReportePRESTADOR_NOMBRE: TStringField;
    sdqReportePRESTADOR_TELEFONO: TStringField;
    sdqReportePI_DIASBAJAPREVISTOS: TFloatField;
    sdqReportePI_DIAGNOSTICO: TStringField;
    sdqReporteEX_IDDIAGNOSTICO: TFloatField;
    sdqReportePE_DIASBAJATOTALES: TFloatField;
    sdqReportePE_DIAGNOSTICO: TStringField;
    sdqReporteEX_ALTAMEDICA: TDateTimeField;
    sdqReporteFORMA: TStringField;
    sdqReporteAGENTE: TStringField;
    sdqReporteNATURALEZA: TStringField;
    sdqReporteZONA: TStringField;
    sdqReporteEX_BREVEDESCRIPCION_1: TStringField;
    sdqReporteEX_OBSERVACIONES_1: TStringField;
    sdqReporteEX_DIAGNOSTICOOMS: TStringField;
    sdqReporteEX_PRESTADOR: TFloatField;
    sdqReportePA_FECHACONTROL: TDateTimeField;
    sdqReporteCALIDADAUDITORIA: TStringField;
    sdqReportePA_MEDICO: TStringField;
    sdqReporteEX_PLURIEMPLEO: TStringField;
    sdqReporteDG_DESCRIPCION: TStringField;
    sdqReporteDG_INCAPACIDADLEVE: TFloatField;
    sdqReporteDG_INCAPACIDADMODERADO: TFloatField;
    sdqReporteDG_INCAPACIDADGRAVE: TFloatField;
    sdqReporteDG_DIASLEVE: TFloatField;
    sdqReporteDG_DIASMODERADO: TFloatField;
    sdqReporteDG_DIASGRAVE: TFloatField;
    sdqReporteDIASBAJA: TFloatField;
    sdqReporteEXISTEINCAPACIDAD: TStringField;
    sdqReporteGRADO: TStringField;
    sdqReporteCARACTER: TStringField;
    sdqReporteGRANINVALIDEZ: TStringField;
    sdqReporteHOMOLOGADO: TStringField;
    sdqReporteFECHAHOMOLOGADO: TDateTimeField;
    sdqReporteSI_PORCPROVI: TFloatField;
    sdqReporteSI_PORCDEF: TFloatField;
    sdqReportePRESUPINCAP: TStringField;
    sdqReporteCUOTAPROMEDIO: TFloatField;
    sdqReporteDEUDA: TFloatField;
    sdqReporteDEUDAADMITIDA: TFloatField;
    sdqReporteDOC_EXPEDIENTE: TStringField;
    sdqReporteDOC_DENUNCIA: TStringField;
    sdqReporteDOC_INGRESO: TStringField;
    sdqReporteDOC_EGRESO: TStringField;
    sdqReporteDOC_OTROS: TStringField;
    sdqReporteDOC_DENUNCIAGRAVE: TStringField;
    sdqReporteDOC_EVOLUTIVO: TStringField;
    sdqReporteTELEFONO: TStringField;
    QRLabel40: TQRLabel;
    QRDBText40: TQRDBText;
    sdqLiquidacionesORIGEN: TStringField;
    QRLabel41: TQRLabel;
    QRDBText41: TQRDBText;
    sdqReporteEX_FECHARECEPCION: TDateTimeField;
    procedure qrLiquidacionesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrExtraDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrPrestadorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrIncapacidadesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDocumentacionBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrCobranzasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  public
    FVieneDeReca: boolean;
    procedure Imprimir(ASiniestroCompleto: String; IdExpediente, ASiniestro: integer; bVisualizar: boolean = True);
    Property VieneDeReca: Boolean  read FVieneDeReca  write FVieneDeReca default False;
  end;

implementation

uses
  unVisualizador, unDmPrincipal, unComunes;

{$R *.DFM}

{ TrptResumen }

procedure TrptResumen.Imprimir(ASiniestroCompleto: String; IdExpediente, ASiniestro: integer; bVisualizar: boolean = True);
begin
  sdqReporte.Params[0].AsInteger := IdExpediente;
  OpenQuery(sdqReporte);
  sdqLiquidaciones.Params[0].AsInteger := IdExpediente;
  OpenQuery(sdqLiquidaciones);

  if Is_SiniestroDeGobernacion(IdExpediente) then
    qrlEmpDep.Caption := 'Dependencia'
  else
    qrlEmpDep.Caption := 'Empleador';

  if bVisualizar then
    Visualizar(Self, GetValores(' - ' + ASiniestroCompleto, '', 0, ASiniestro), [oAutoFirma, oForceDB, oForceShowModal, oAlwaysShowDialog]);
end;

procedure TrptResumen.qrLiquidacionesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (not sdqLiquidaciones.IsEmpty and (sdqLiquidaciones.RecordCount > 0)) and not VieneDeReca;
end;

procedure TrptResumen.qrExtraDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (not sdqLiquidaciones.FieldByName('DESCRIPCION_EXTRA').IsNull) and not VieneDeReca;
end;

procedure TrptResumen.qrPrestadorBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not VieneDeReca;
end;

procedure TrptResumen.qrIncapacidadesBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not VieneDeReca;
end;

procedure TrptResumen.qrDocumentacionBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not VieneDeReca;
end;

procedure TrptResumen.qrCobranzasBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := not VieneDeReca;
end;

procedure TrptResumen.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var bHabilita: boolean;
begin
  bHabilita := not VieneDeReca;

  qrlCie10.Enabled            := bHabilita;
  qrdbDiagnosticooms.Enabled  := bHabilita;
  qrdbDescripcion.Enabled     := bHabilita;
  qrlDias.Enabled             := bHabilita;
  qrdbDiasLeve.Enabled        := bHabilita;
  qrdbDiasModerado.Enabled    := bHabilita;
  qrdbDiasGrave.Enabled       := bHabilita;
  qrlIncapacidad.Enabled      := bHabilita;
  qrdbIncapLeve.Enabled       := bHabilita;
  qrdbIncapModerado.Enabled   := bHabilita;
  qrdbIncapGrave.Enabled      := bHabilita;
end;

end.
