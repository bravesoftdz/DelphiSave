unit unrptliq53;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,unDmprincipal;

type
  TRpt531 = class(TQuickRep)
    dsConsulta1: TDataSource;
    sdqConsulta1: TSDQuery;
    dsConsulta3: TDataSource;
    sdqConsulta3: TSDQuery;
    dsConsulta4: TDataSource;
    sdqConsulta4: TSDQuery;
    SDQHeader: TSDQuery;
    DSHeader: TDataSource;
    QRBCabecera: TQRBand;
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
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRBTitulos1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
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
    QRFooter2: TQRBand;
    QRShape8: TQRShape;
    QRLabel20: TQRLabel;
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
    QRBand1: TQRBand;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel40: TQRLabel;
    QRSubDetail4: TQRSubDetail;
    QRDBText22: TQRDBText;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel30: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRSubDetail5: TQRSubDetail;
    QRDBText34: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    lblTotalRemun: TQRLabel;
    QRFooter3: TQRBand;
    QRShape17: TQRShape;
    TotDias: TQRLabel;
    TotEmpresa: TQRLabel;
    TotMOPRE: TQRLabel;
    lblBeneficiario: TQRLabel;
    QRShape24: TQRShape;
    QRLabel22: TQRLabel;
    qrlConcepto: TQRLabel;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRDBText15: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText30: TQRDBText;
    TotDGI: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText31: TQRDBText;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    qriLogo: TQRImage;
    QRShape12: TQRShape;
    QRLabel24: TQRLabel;
    QRDBText16: TQRDBText;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape13: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape18: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    LblBDiaria: TQRLabel;
    LblBMensual: TQRLabel;
    qrlPeriodo: TQRLabel;
    QRShape34: TQRShape;
    QRDBText25: TQRDBText;
    qrsHijos: TQRShape;
    QRShape28: TQRShape;
    QRLabel11: TQRLabel;
    QRShape30: TQRShape;
    QRShape37: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText9: TQRDBText;
    qrlUsuario: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText26: TQRDBText;
    procedure QRBTitulos2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRFooter2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRFooter1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure sdqConsulta3AfterScroll(DataSet: TDataSet);
    procedure sdqConsulta1AfterScroll(DataSet: TDataSet);
    procedure SDQHeaderAfterScroll(DataSet: TDataSet);
  private
    DTotdias, DTotDGI, DTotMOPRE, DTotEmpresa, TotalRemun: Double;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq, iGrupoFamiliar: Integer);
  end;

var
  Rpt531: TRpt531;

implementation

uses
  DateUtil, AnsiSql, uncomunes, General, CustomDlgs;

{$R *.DFM}

procedure TRpt531.QRBTitulos2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  TotalRemun  := 0;
  DTotDGI     := 0;
  DTotDias    := 0;
  DTotMOPRE   := 0;
  DTotEmpresa := 0;
end;

procedure TRpt531.QRSubDetail2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalRemun := TotalRemun + sdqConsulta3.fieldbyname('imporperi').asfloat;
end;

procedure TRpt531.QRFooter2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lblTotalRemun.Caption := format('%8.2f', [TotalRemun]);
end;

procedure TRpt531.QRSubDetail1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  DTotdias    := DTotdias + sdqConsulta1.fieldbyname('rs_diasper').asfloat;
  DTotDGI     := DTotDGI + sdqConsulta1.fieldbyname('nr_remimss').asfloat;
  DTotMOPRE   := DTotMOPRE + sdqConsulta1.fieldbyname('rs_impoampo').asfloat;
  DTotEmpresa := DTotEmpresa + sdqConsulta1.fieldbyname('rs_impomes').asfloat;
end;

procedure TRpt531.QRFooter1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Totdias.caption    := floattostr(DTotdias);
  TotDGI.caption     := format('%8.2f', [DTotDGI]);
  TotMOPRE.caption   := format('%8.2f', [DTotMOPRE]);
  TotEmpresa.caption := format('%8.2f', [DTotEmpresa]);
end;

constructor TRpt531.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TRpt531.qrlPeriodoPrint(sender: TObject; var Value: String);
var
  iDias, iMeses, iAnios: Word;
  sMesesTexto: String;
begin
  DateDiff(sdqHeader.FieldByName('le_fechades').AsDateTime,
           sdqHeader.FieldByName('le_fechahas').AsDateTime + 1, iDias, iMeses, iAnios);

  sMesesTexto := '';

  if iAnios = 1 then
    sMesesTexto := sMesesTexto + IntToStr( iAnios ) + ' Año '
  else if iAnios > 1 then
    sMesesTexto := sMesesTexto + IntToStr( iAnios ) + ' Años ';

  if iMeses = 1 then
    sMesesTexto := sMesesTexto + IntToStr( iMeses ) + ' Mes '
  else if iMeses > 1 then
    sMesesTexto := sMesesTexto + IntToStr( iMeses ) + ' Meses ';

  if iDias = 1 then
    sMesesTexto := sMesesTexto + IntToStr( iDias ) + ' Día'
  else if iDias > 1 then
    sMesesTexto := sMesesTexto + IntToStr( iDias ) + ' Días';

  Value := sMesesTexto;
end;

procedure TRpt531.sdqConsulta3AfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta3.FieldByName('imporperi') is TFloatField then
    TFloatField(sdqConsulta3.FieldByName('imporperi')).Currency := True;
end;

procedure TRpt531.sdqConsulta1AfterScroll(DataSet: TDataSet);
begin
  if sdqConsulta1.FieldByName('rs_impoampo') is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('rs_impoampo')).Currency := True;

  if sdqConsulta1.FieldByName('rs_impomes') is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('rs_impomes')).Currency := True;

  if sdqConsulta1.FieldByName('nr_remimss') is TFloatField then
    TFloatField(sdqConsulta1.FieldByName('nr_remimss')).Currency := True;
end;

procedure TRpt531.SDQHeaderAfterScroll(DataSet: TDataSet);
begin
  if sdqHeader.FieldByName('le_imporperi') is TFloatField then
    TFloatField(sdqHeader.FieldByName('le_imporperi')).Currency := True;
end;

procedure TRpt531.DoImprimir(iSiniestro, iOrden,iRecaida, iNLiq, iGrupoFamiliar: Integer);
var
  ImpB:double;
  sSql, sCuit, sCuil: String;
  bEsSinGobernacion :Boolean;
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

  ImpB := ValorSqlEx('SELECT cb_ibasediaria ' +
                      ' FROM secb_cbaseexpsin ' +
                     ' WHERE cb_siniestro = :Sin ' +
                       ' AND cb_orden = :Ord', [iSiniestro, iOrden]);
  LblBDiaria.Caption  := format('%8.2f', [ImpB]);
  LblBMensual.Caption := format('%8.2f', [ImpB * 30.4]);


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

  sdqConsulta1.Close;                     // Arreglo por sesiones multiples
  sdqConsulta1.SQL.Text := 'SELECT rs_persala, rs_diasper, rs_impomes, rs_impoampo, NVL(nr_remimss, 0) AS nr_remimss ' +
                            ' FROM art.sers_recisalasin, znr_nomrec ' +
                           ' WHERE rs_siniestro = ' + SqlInt(iSiniestro) +
                             ' AND rs_orden = ' + SqlInt(iOrden) +
                             ' AND (   rs_impomes > 0 ' +
                                  ' OR rs_diasper > 0 ' +
                                  ' OR rs_impoampo > 0) ' +
                             ' AND nr_cuil(+) = ' + SqlValue(sCuil) +
                             ' AND nr_cuit(+) = ' + SqlValue(sCuit) +
                             ' AND nr_period(+) = rs_persala ' +
                        ' ORDER BY rs_persala ';

  sdqConsulta1.Open;


  if MsgAsk('¿Desea imprimir el historial de Anticipos Liquidados?') then
  begin
   { sdqConsulta3.ParamByName('pSiniestro').Value      := iSiniestro;
    sdqConsulta3.ParamByName('pOrden').Value          := iOrden;
    sdqConsulta3.ParamByName('pNumliqui').Value       := iNLiq;
    sdqConsulta3.ParamByName('pGrupoFamiliar').Value  := iGrupoFamiliar;
    sdqConsulta3.Open; }

    sdqConsulta3.Close;                                                          // Arreglo por sesiones multiples
    sdqConsulta3.SQL.Text := ' SELECT le_numliqui, MIN(le_imporperi) imporperi ' +
                               ' FROM seb_beneficiarios, sbl_beneficiarioliquidacion, sle_liquiempsin ' +
                              ' WHERE le_siniestro = ' + SqlInt(iSiniestro) +
                                ' AND le_orden = ' + SqlInt(iOrden) +
                                ' AND le_numliqui < ' + SqlInt(iNLiq) +
                                ' AND NVL(le_estado, '' '') NOT IN(''A'', ''X'') ' +
                                ' AND le_conpago = ''53'' ' +
                                ' AND le_imporperi > 0 ' +
                                ' AND le_siniestro = bl_siniestro ' +
                                ' AND le_orden = bl_orden ' +
                                ' AND le_recaida = bl_recaida ' +
                                ' AND le_numliqui = bl_numliq ' +
                                ' AND le_siniestro = eb_siniestro ' +
                                ' AND le_orden = eb_orden ' +
                                ' AND le_recaida = eb_recaida ' +
                                ' AND eb_codigo = bl_beneficiario ' +
                                ' AND eb_grupofamiliar = ' + SqlInt(iGrupoFamiliar) +
                           ' GROUP BY le_numliqui ';
    sdqConsulta3.Open;

  end;

  {sdqConsulta4.ParamByName('pSiniestro').Value  := iSiniestro;
  sdqConsulta4.ParamByName('pOrden').Value      := iOrden;
  sdqConsulta4.Open;    }

  sdqConsulta4.Close;
  sdqConsulta4.SQL.Text := ' SELECT ju_nombre ju ' +
                             ' FROM art.sju_jubilacion, art.secb_cbaseexpsin ' +
                            ' WHERE cb_siniestro = ' + SqlInt(iSiniestro) +
                              ' AND cb_orden = ' + SqlInt(iOrden) +
                              ' AND cb_afjp = ju_codigo(+) ';
  sdqConsulta4.Open;


 { sdqHeader.ParamByName('pSiniestro').Value     := iSiniestro;
  sdqHeader.ParamByName('pOrden').Value         := iOrden;
  sdqHeader.ParamByName('pRecaida').Value       := iRecaida;
  sdqHeader.ParamByName('pNLiq').Value          := iNLiq;
  sdqHeader.Open;    }

  sdqHeader.Close;
  sdqHeader.SQL.Text := ' SELECT le_siniestro, le_orden, le_recaida, le_numliqui, le_fproceso, ex_contrato, em_nombre, tj_nombre, ex_altamedica, ' +
                               ' le_fechades, le_fechahas, tj_fnacimiento, le_formula, le_imporperi, le_comentario, le_chequenombre, le_usualta, ' +
                               ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida, ''-'') siniestro, art.utiles.armar_cuit(ex_cuil) cuil, ' +
                               ' art.utiles.armar_cuit(ex_cuit) cuit, TO_CHAR(ex_fechaaccidente, ''DD/MM/YYYY'') || '' '' || ex_horaaccidente fhacc, ' +
                               ' ''*'' || LPAD(ex_siniestro, 8, 0) || LPAD(ex_orden, 2, 0) || LPAD(ex_recaida, 2, 0) || LPAD(le_numliqui, 3, 0) || ''*'' cbarra, ' +
                               ' LPAD(ex_siniestro, 8, 0) || LPAD(ex_orden, 2, 0) || LPAD(ex_recaida, 2, 0) || LPAD(le_numliqui, 3, 0) cbarradet, ' +
                               ' NVL(le_recibos, art.liq.get_dirbeneficiarioliq(ex_siniestro, ex_orden, ex_recaida, le_numliqui)) direccion, ' +
                               ' tb_descripcion || '' '' || ba_nombrecorto formapago, le_enviofondos, ' +
                               ' art.liq.get_edad(ex_siniestro, ex_orden, ex_recaida) edad, ta_descripcion tipoaccidente ' +
                          ' FROM sex_expedientes, ctj_trabajador, aem_empresa, sle_liquiempsin, ' +
                               ' ctb_tablas, zba_banco, sin.sta_tipoaccidente ' +
                         ' WHERE le_siniestro = ' + SqlInt(iSiniestro) +
                           ' AND le_orden = ' + SqlInt(iOrden) +
                           ' AND le_recaida = ' + SqlInt(iRecaida) +
                           ' AND le_numliqui = ' + SqlInt(iNLiq) +
                           ' AND le_siniestro = ex_siniestro ' +
                           ' AND le_orden = ex_orden ' +
                           ' AND le_recaida = ex_recaida ' +
                           ' AND ex_cuit = em_cuit ' +
                           ' AND ex_cuil = tj_cuil ' +
                           ' AND tb_clave(+) = ''COBRO'' ' +
                           ' AND tb_codigo(+) = le_metodopago ' +
                           ' AND le_idbanco = ba_id(+) ' +
                           ' AND ex_tipo = ta_codigo ';
  sdqHeader.Open;


 { sdqDetail.ParamByName('pSiniestro').Value     := iSiniestro;
  sdqDetail.ParamByName('pOrden').Value         := iOrden;
  sdqDetail.ParamByName('pRecaida').Value       := iRecaida;
  sdqDetail.ParamByName('pNLiq').Value          := iNLiq;
  sdqDetail.Open;   }

  sdqDetail.Close;
  sdqDetail.SQL.Text := ' SELECT eb_nombre, eb_documento, eb_fechanacimiento, eb_porcentaje, eb_grupofamiliar, ' +
                               ' tb_descripcion, eb_porcentaje * 100 ebporcentaje, eb_codigo ' +
                          ' FROM sbl_beneficiarioliquidacion, seb_beneficiarios, ctb_tablas ' +
                         ' WHERE bl_siniestro = ' + SqlInt(iSiniestro) +
                           ' AND bl_orden = ' + SqlInt(iOrden) +
                           ' AND bl_recaida = ' + SqlInt(iRecaida) +
                           ' AND bl_numliq = ' + SqlInt(iNLiq) +
                           ' AND eb_siniestro = bl_siniestro ' +
                           ' AND eb_orden = bl_orden ' +
                           ' AND eb_recaida = bl_recaida ' +
                           ' AND eb_codigo = bl_beneficiario ' +
                           ' AND tb_clave = ''PAREN'' ' +
                           ' AND tb_codigo = eb_caracter ';
  sdqDetail.Open;

  lblBeneficiario.Caption := ValorSqlEx('SELECT liq.get_dninombrebeneficiario(:Sin, :Ord, :Rec, :Cod) ' +
                                         ' FROM dual', [iSiniestro, iOrden, iRecaida,
                                                        SDQDetail.FieldByName('eb_codigo').AsInteger]);

  qrlUsuario.Caption      := IIF(SDQHeader.FieldByName('le_usualta').AsString = 'AUTOMATICO',
                                 SDQHeader.FieldByName('le_usualta').AsString,
                                 ValorSqlEx('SELECT se_nombre FROM use_usuarios ' +
                                            ' WHERE se_usuario = :Usu', [SDQHeader.FieldByName('le_usualta').AsString]));

  Print;
end;

end.
