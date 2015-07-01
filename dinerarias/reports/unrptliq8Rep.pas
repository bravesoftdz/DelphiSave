unit unrptliq8Rep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,unDmprincipal;

type
  TRpt8Rep = class(TQuickRep)
    dsConsulta1: TDataSource;
    sdqConsulta1: TSDQuery;
    dsConsulta3: TDataSource;
    sdqConsulta3: TSDQuery;
    dsConsulta4: TDataSource;
    sdqConsulta4: TSDQuery;
    SDQHeader: TSDQuery;
    DSHeader: TDataSource;
    QRBCabecera: TQRBand;
    QRBTitulos1: TQRBand;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText14: TQRDBText;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRFooter1: TQRBand;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRBTitulos2: TQRBand;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText17: TQRDBText;
    QRShape7: TQRShape;
    QRFooter2: TQRBand;
    QRShape8: TQRShape;
    QRLabel20: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRBTitulos3: TQRBand;
    QRShape14: TQRShape;
    QRLabel28: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRSubDetail3: TQRSubDetail;
    QRShape19: TQRShape;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRShape20: TQRShape;
    DSDetail: TDataSource;
    SDQDetail: TSDQuery;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRBand3: TQRBand;
    QRSubDetail5: TQRSubDetail;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    lblTotalRemun: TQRLabel;
    QRFooter3: TQRBand;
    QRShape24: TQRShape;
    QRShape6: TQRShape;
    qrlTitulo: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText15: TQRDBText;
    lblTotalRemunActual: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText28: TQRDBText;
    TotMOPRE: TQRLabel;
    TotDGI: TQRLabel;
    TotEmpresa: TQRLabel;
    TotDias: TQRLabel;
    qriLogo: TQRImage;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    qrdbContrato: TQRDBText;
    QRDBText8: TQRDBText;
    qrdbCuit: TQRDBText;
    qrlCuit: TQRLabel;
    qrlEmpDep: TQRLabel;
    qrlContrato: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText4: TQRDBText;
    qrsHijos: TQRShape;
    QRShape28: TQRShape;
    QRLabel12: TQRLabel;
    QRShape30: TQRShape;
    QRShape34: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText24: TQRDBText;
    qrlUsuario: TQRLabel;
    QRShape12: TQRShape;
    QRDBText16: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText29: TQRDBText;
    qrlDetalleCapital: TQRLabel;
    qrlIndemnizacion: TQRLabel;
    qrlDetallePagoAdic: TQRLabel;
    qrlMontoPagoAdic: TQRLabel;
    qrlDetalleCompDanos: TQRLabel;
    qrlMontoCompDanos: TQRLabel;
    QRShape31: TQRShape;
    QRLabel4: TQRLabel;
    qrlTotal: TQRLabel;
    QRDBText22: TQRDBText;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText34: TQRDBText;
    QRShape13: TQRShape;
    QRDBText27: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    LblBDiaria: TQRLabel;
    LblBMensual: TQRLabel;

    procedure QRBTitulos2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooter2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRFooter1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBTitulos1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure sdqConsulta1AfterScroll(DataSet: TDataSet);
    procedure sdqConsulta3AfterScroll(DataSet: TDataSet);
    procedure SDQHeaderAfterScroll(DataSet: TDataSet);
  private
    DTotdias,
    DTotDGI,
    DTotMOPRE,
    DTotEmpresa,
    TotalRemun,
    TotalRemunActual: Double;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar: Integer);
  end;

var
  Rpt8Rep: TRpt8Rep;

implementation

Uses AnsiSql, uncomunes, General, CustomDlgs, strfuncs;

{$R *.DFM}

procedure TRpt8Rep.QRBTitulos2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  TotalRemun       :=0;
  TotalRemunActual :=0;
  DTotDGI          :=0;
  DTotDias         :=0;
  DTotMOPRE        :=0;
  DTotEmpresa      :=0;
end;

procedure TRpt8Rep.QRSubDetail2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalRemun       := TotalRemun + sdqConsulta3.fieldbyname('IMPORTEORIGINAL').asfloat;
  TotalRemunActual := TotalRemunActual + sdqConsulta3.fieldbyname('IMPORTEACTUAL').asfloat;
end;

procedure TRpt8Rep.QRFooter2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
//var ImpB:double;
begin
  {lblTotalRemun.Caption       := format('%8.2f', [TotalRemun]);
  lblTotalRemunActual.Caption := format('%8.2f', [TotalRemunActual]);
  ImpB := ValorSqlEx('SELECT cb_ibasediaria ' +
                      ' FROM secb_cbaseexpsin ' +
                     ' WHERE cb_siniestro = :Sin ' +
                       ' AND cb_orden = :Ord', [SDQHeader.fieldbyname('le_siniestro').AsInteger,
                                                SDQHeader.fieldbyname('le_orden').AsInteger]);
  LblBDiaria.Caption  := format('%8.2f', [ImpB]);
  LblBMensual.Caption := format('%8.2f', [ImpB * 30.4]);  }
end;

procedure TRpt8Rep.QRSubDetail1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  DTotdias      := DTotdias + sdqconsulta1.fieldbyname('RS_DIASPER').asfloat;
  DTotDGI       := DTotDGI + sdqconsulta1.fieldbyname('NR_REMIMSS').asfloat;
  DTotMOPRE     := DTotMOPRE + sdqconsulta1.fieldbyname('RS_IMPOAMPO').asfloat;
  DTotEmpresa   := DTotEmpresa + sdqConsulta1.fieldbyname('RS_IMPOMES').asfloat;
end;

procedure TRpt8Rep.QRFooter1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var ImpB:double;
begin
  Totdias.caption     := FloatToStr(DTotdias);
  TotDGI.caption      := format('%8.2f', [DTotDGI]);
  TotMOPRE.caption    := format('%8.2f', [DTotMOPRE]);
  TotEmpresa.caption  := format('%8.2f', [DTotEmpresa]);

  lblTotalRemun.Caption       := format('%8.2f', [TotalRemun]);
  lblTotalRemunActual.Caption := format('%8.2f', [TotalRemunActual]);
  {ImpB := ValorSqlEx('SELECT cb_ibasediaria ' +
                      ' FROM secb_cbaseexpsin ' +
                     ' WHERE cb_siniestro = :Sin ' +
                       ' AND cb_orden = :Ord', [SDQHeader.fieldbyname('le_siniestro').AsInteger,
                                                SDQHeader.fieldbyname('le_orden').AsInteger]);   }

  ImpB := SDQHeader.FieldByName('le_ibasediaria').AsCurrency;
  LblBDiaria.Caption  := '$' + format('%8.2f', [ImpB]);
  LblBMensual.Caption := '$' + format('%8.2f', [ImpB * 30.4]);

end;

procedure TRpt8Rep.QRBTitulos1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Totdias.caption    := '0';
  TotDGI.caption     := '0';
  TotMOPRE.caption   := '0';
  TotEmpresa.caption := '0';
end;

constructor TRpt8Rep.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TRpt8Rep.sdqConsulta1AfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta1.FieldByName( 'RS_IMPOAMPO' ) is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('RS_IMPOAMPO')).Currency := True;

  if sdqConsulta1.FieldByName( 'RS_IMPOMES' ) is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('RS_IMPOMES')).Currency := True;

  if sdqConsulta1.FieldByName( 'NR_REMIMSS' ) is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('NR_REMIMSS')).Currency := True;
end;

procedure TRpt8Rep.sdqConsulta3AfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta3.FieldByName( 'IMPORTEORIGINAL' ) is TFloatField then
    TFloatField(sdqConsulta3.FieldByName('IMPORTEORIGINAL')).Currency := True;

  if sdqConsulta3.FieldByName( 'IMPORTEACTUAL' ) is TFloatField then
    TFloatField(sdqConsulta3.FieldByName('IMPORTEACTUAL')).Currency := True;
end;

procedure TRpt8Rep.SDQHeaderAfterScroll(DataSet: TDataSet);
begin
  if sdqHeader.FieldByName('le_imporperi') is TFloatField then
    TFloatField(sdqHeader.FieldByName('le_imporperi')).Currency := True;
end;

procedure TRpt8Rep.DoImprimir(iSiniestro, iOrden, iRecaida, iNLiq, iGrupoFamiliar: Integer);
var
  bEsSinGobernacion :Boolean;
  sSql, sCuit, sCuil: String;
  iIdExped: integer;
begin
  iIdExped := Get_IdExpediente(iSiniestro, iOrden, iRecaida);
  bEsSinGobernacion := Is_SiniestroDeGobernacion(iIdExped);
  if bEsSinGobernacion then
  begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
    qrlEmpDep.Caption   := 'DEPENDENCIA GPBA';
    qrlCuit.Width       := 0;
    qrdbCuit.Width      := 0;
    qrlContrato.Width   := 0;
    qrdbContrato.Width  := 0;
  end
  else begin
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
    qrlEmpDep.Caption   := 'EMPRESA';
  end;

  sSql := 'SELECT ex_cuit, ex_cuil ' +
           ' FROM sex_expedientes ' +
          ' WHERE ex_siniestro = :Sin ' +
            ' AND ex_orden = :Ord ' +
            ' AND ex_recaida = :Reca ';
  with GetQueryEx(sSql, [iSiniestro, iOrden, iRecaida]) do
  try
    sCuit := FieldByName('ex_cuit').AsString;
    sCuil := FieldByName('ex_cuil').AsString;
  finally
    Free;
  end;

  sSql := 'SELECT RS_PERSALA, RS_DIASPER, RS_IMPOMES, RS_IMPOAMPO, NVL(NR_REMIMSS, 0) AS NR_REMIMSS' +
          '  FROM ART.SERS_RECISALASIN, ZNR_NOMREC' +
          ' WHERE RS_SINIESTRO = :PSINIESTRO' +
          '   AND RS_ORDEN = :PORDEN' +
          '   AND (RS_IMPOMES > 0' +
          '       OR RS_DIASPER > 0' +
          '       OR RS_IMPOAMPO > 0)' +
          '   AND NR_CUIL(+) = :PCUIL' +
          '   AND NR_CUIT(+) = :PCUIT' +
          '   AND NR_PERIOD(+) = RS_PERSALA' +
          ' ORDER BY RS_PERSALA';

  OpenQueryEx(sdqConsulta1, [iSiniestro, iOrden, sCuit, sCuil], sSql);

  if MsgAsk('¿Desea imprimir el historial de Anticipos Liquidados?') then
  begin
    sdqConsulta3.ParamByName('pSiniestro').Value     := iSiniestro;
    sdqConsulta3.ParamByName('pOrden').Value         := iOrden;
    sdqConsulta3.ParamByName('pNumliqui').Value      := iNLiq;
    sdqConsulta3.ParamByName('pGrupoFamiliar').Value := iGrupoFamiliar;
    sdqConsulta3.Open;
  end;

  sdqConsulta4.ParamByName('pSiniestro').Value    := iSiniestro;
  sdqConsulta4.ParamByName('pOrden').Value        := iOrden;
  sdqConsulta4.Open;

  sdqHeader.ParamByName('pSiniestro').Value       := iSiniestro;
  sdqHeader.ParamByName('pOrden').Value           := iOrden;
  sdqHeader.ParamByName('pRecaida').Value         := iRecaida;
  sdqHeader.ParamByName('pNLiq').Value            := iNLiq;
  sdqHeader.Open;

  sdqDetail.ParamByName('pSiniestro').Value       := iSiniestro;
  sdqDetail.ParamByName('pOrden').Value           := iOrden;
  sdqDetail.ParamByName('pRecaida').Value         := iRecaida;
  sdqDetail.ParamByName('pNLiq').Value            := iNLiq;
  sdqDetail.Open;

  qrlUsuario.Caption := IIF(SDQHeader.FieldByName('le_usualta').AsString = 'AUTOMATICO',
                            SDQHeader.FieldByName('le_usualta').AsString,
                            ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                        ' WHERE se_usuario = :Usu', [SDQHeader.FieldByName('le_usualta').AsString]));

  qrlIndemnizacion.Caption := Get_AjusteDecimales(FloatToStr(SDQHeader.FieldByName('le_subtotal').AsCurrency), '$');
  qrlTotal.Caption := Get_AjusteDecimales(FloatToStr(SDQHeader.FieldByName('le_imporperi').AsCurrency), '$');
  if SDQHeader.FieldByName('le_montopagoadic').AsCurrency <> 0 then
  begin
    qrlDetallePagoAdic.Enabled := True;
    qrlMontoPagoAdic.Enabled := True;
    qrlMontoPagoAdic.Caption := Get_AjusteDecimales(FloatToStr(SDQHeader.FieldByName('le_montopagoadic').AsCurrency), '$');
  end;

  if SDQHeader.FieldByName('le_montocompdanios').AsCurrency <> 0 then
  begin
    qrlDetalleCompDanos.Enabled := True;
    qrlMontoCompDanos.Enabled := True;
    qrlMontoCompDanos.Caption := Get_AjusteDecimales(SDQHeader.FieldByName('le_montocompdanios').AsString, '$');
  end;

  Print;
end;

end.
