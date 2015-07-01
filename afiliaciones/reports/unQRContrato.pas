unit unQRContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, SDEngine, Qrctrls, QuickRpt, ExtCtrls,
  unQRLabelEx;

type
  TQRContrato = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    ChildBand5: TQRChildBand;
    ChBandAlicuota_B: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    ChBandAlicuota1_B: TQRChildBand;
    QRLabel13: TQRLabel;
    ChBandAlicuota2_B: TQRChildBand;
    QRLabel14: TQRLabel;
    ChBandAlicuota3_B: TQRChildBand;
    QRLabel15: TQRLabel;
    ChBandAlicuota4_B: TQRChildBand;
    QRLabel16: TQRLabel;
    ChBandAlicuota6_B: TQRChildBand;
    QRLabel19: TQRLabel;
    QRSubTotal: TQRLabel;
    ChBandAlicuota5_B: TQRChildBand;
    QRLabel17: TQRLabel;
    QRPesosSSN: TQRLabel;
    ChBandAlicuotaFinal_B: TQRChildBand;
    QRLabel20: TQRLabel;
    ChBandAlicuotaFinal1_B: TQRChildBand;
    QRLabel21: TQRLabel;
    QRFinalPesos: TQRLabel;
    ChBandAlicuotaFinal2_B: TQRChildBand;
    QRLabel22: TQRLabel;
    QRImage1: TQRImage;
    QRLabel31: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    Raya2: TQRShape;
    Raya3: TQRShape;
    Raya1: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape38: TQRShape;
    QRShape37: TQRShape;
    QRShape25: TQRShape;
    QRShape22: TQRShape;
    QRShape19: TQRShape;
    QRShape16: TQRShape;
    QRShape13: TQRShape;
    QRShape8: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ChBandAlicuota_AV: TQRChildBand;
    QRLabel36: TQRLabel;
    ChBandAlicuota1_A: TQRChildBand;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape42: TQRShape;
    QRLabel44: TQRLabel;
    QRMemo1: TQRMemo;
    ChBandAlicuota1_V: TQRChildBand;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape43: TQRShape;
    QRMemo2: TQRMemo;
    ChBandAlicuota7_B: TQRChildBand;
    QRLabel18: TQRLabel;
    QRShape29: TQRShape;
    QRShape28: TQRShape;
    ChBandAlicuotaFinal3_B: TQRChildBand;
    QRLabel26: TQRLabel;
    ChildBand18: TQRChildBand;
    ChildBand19: TQRChildBand;
    QRLabel32: TQRLabel;
    qrAdicionales: TQRLabel;
    QRLabel33: TQRLabel;
    ChildBand20: TQRChildBand;
    QRLSuscripcion: TQRLabel;
    QRLeyenda: TQRLabel;
    ChBandAlicuotaFinal3_D: TQRChildBand;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRChildBand1: TQRChildBand;
    ChBandAlicuotaFinal_AVD: TQRChildBand;
    QRLabel54: TQRLabel;
    ChBandAlicuotaFinal1_AVD: TQRChildBand;
    QRLabel49: TQRLabel;
    QRSumafija4: TQRLabel;
    QRShape27: TQRShape;
    ChBandAlicuotaFinal2_AVD: TQRChildBand;
    QRLabel53: TQRLabel;
    QRShape36: TQRShape;
    QRSumaFija3: TQRLabel;
    QRPorcVar3: TQRLabel;
    QRRebHS3: TQRLabel;
    QRFinalPorc: TQRLabel;
    QRSumaFija: TQRLabel;
    QRPorcVar: TQRLabel;
    QRRebVol: TQRLabel;
    QRRebHS: TQRLabel;
    QRCargoAdmin: TQRLabel;
    QRSumaFija2: TQRLabel;
    QRPorcVar2: TQRLabel;
    QRRebVol2: TQRLabel;
    QRRebHS2: TQRLabel;
    QRCargoAdmin2: TQRLabel;
    QRPorcVar4: TQRLabel;
    QRPORC_HIPOACUSIA: TQRLabel;
    qrTipoImpresion: TQRLabel;
    QRLabelEx4: TQRLabelEx;
    QRLabelEx1: TQRLabelEx;
    QRLabelEx2: TQRLabelEx;
    QRLabelEx3: TQRLabelEx;
    QRShape30: TQRShape;
    QRShape33: TQRShape;
    ChBandLeyenda_D: TQRChildBand;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    qrCUIT: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLocalidadPostal: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRShape39: TQRShape;
    QRLabel4: TQRLabel;
    QRShape44: TQRShape;
    QRLabel5: TQRLabel;
    QRShape45: TQRShape;
    QRLabel34: TQRLabel;
    QRShape46: TQRShape;
    QRDBText12: TQRDBText;
    QRLocalidadLegal: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel52: TQRLabel;
    QRShape47: TQRShape;
    QRShape11: TQRShape;
    QRDBText13: TQRDBText;
    QRLabel35: TQRLabel;
    QRShape48: TQRShape;
    QRDBText27: TQRDBText;
    QRShape12: TQRShape;
    QRLabel57: TQRLabel;
    QRSubtotalPorc: TQRLabel;
    QRPorcSSN: TQRLabel;
    qrAporteSSN: TQRLabel;
    QRRebVol3: TQRLabel;
    QRRebVolVar3: TQRLabel;
    QRRebHSVar3: TQRLabel;
    QRLLeyendaDescrDescRec: TQRLabel;
    qriLogoNom: TQRImage;
    qrlCodigoART: TQRLabel;
    sdqQuery: TSDQuery;
    procedure qrCUITPrint(Sender: TObject; var Value: String);
    procedure QRLSuscripcionPrint(Sender: TObject; var Value: String);
    procedure QRCallePostalPrint(Sender: TObject; var Value: String);
    procedure ImprimeMonto(Sender: TObject; var Value: String);
    procedure ImprimeMonto2(Sender: TObject; var Value: String);
    procedure ImprimeMonto3(Sender: TObject; var Value: String);
    procedure ImprimeMonto23(Sender: TObject; var Value: String);
    procedure AjustaDecimales(Sender: TObject; var Value: String);
    procedure CargarControles(aTipoContrato, aLeyenda: String);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FAporteSRT: Extended;
    FEndoso: String;
    FHipoAcusia: Extended;
    FImprimeMembrete: Boolean;
    FTipoContrato: String;

    function Get_DescripcionPorcRecargoDescuento(aDescripcion: String; aValor: Double; aFormato, aTipoRecargoRebaja: String): String;
    function Get_DescripcionPorcRecargosYDescuentos(aTipoContr: String; aPorcDescVolumen, aPorcDescNivel: Double): String;

    procedure ImprimeMontoDec(aSender: TObject; var aValue: String; aCantDec: Integer);
  public
    procedure Preparar(aTipoContrato, aLeyenda: String; aCantCopias: Integer; aImprimir: Boolean = False;
                       const aNombreArchivo: String = '');

    property AporteSRT: Extended      read FAporteSRT       write FAporteSRT;
    property Endoso: String           read FEndoso          write FEndoso;
    property HipoAcusia: Extended     read FHipoAcusia      write FHipoAcusia;
    property ImprimeMembrete: Boolean read FImprimeMembrete write FImprimeMembrete;
  end;

var
  QRContrato: TQRContrato;

implementation

uses
  unDmPrincipal, unAfiliaciones, AnsiSql, unArt, StrFuncs, Printers, General, unExportPDF;

const
  SQL_IMPCONTRATO =
    'SELECT hc_contrato contrato, hc_vigenciadesde vig_desde, hc_vigenciahasta vig_hasta, ac_codigo cod_actividad,' +
          ' ac.ac_descripcion actividad, fo_formulario nro_formulario, hc_nivel nivel, hm_nombre nombre, hm_cuit cuit,' +
          ' hc_id, hc_fechaimpresion,' +
          ' utiles.armar_domicilio(domp.hd_calle, domp.hd_numero, domp.hd_piso, domp.hd_departamento) hd_domiciliopostal,' +
          ' art.utiles.armar_localidad(domp.hd_cpostal, domp.hd_cpostala, domp.hd_localidad, '''') localidad_p,' +
          ' cpvp.pv_descripcion provincia_p,' +
          ' utiles.armar_domicilio(doml.hd_calle, doml.hd_numero, doml.hd_piso, doml.hd_departamento) hd_domiciliolegal,' +
          ' art.utiles.armar_localidad(doml.hd_cpostal, doml.hd_cpostala, doml.hd_localidad, '''') localidad_l,' +
          ' cpvl.pv_descripcion provincia_l, tar.tb_descripcion AS tipo_tarifa, ht_sumafijatarifa, ht_porcmasatarifa, ht_sumafija,' +
          ' ht_porcmasa, ht_porcdescvolumen, ht_porcdescnivel, ht_cargoadmin, ht_alicuotapesos' +
     ' FROM aen_endoso, ahc_historicocontrato, ctb_tablas mot, cac_actividad ac, afo_formulario, ahm_historicoempresa,' +
          ' aht_historicotarifario, ctb_tablas tar, ahd_historicodomicilio domp, ahd_historicodomicilio doml,' +
          ' cpv_provincias cpvl, cpv_provincias cpvp' +
    ' WHERE en_idhistoricocontrato = hc_id' +
      ' AND en_idhistoricoempresa = hm_id' +
      ' AND en_idhistoricotarifa = ht_id' +
      ' AND en_motivo = mot.tb_codigo' +
      ' AND mot.tb_clave = ''MOTEN''' +
      ' AND hc_idactividad = ac.ac_id' +
      ' AND hc_idformulario = fo_id' +
      ' AND ht_tipodetarifa = tar.tb_codigo(+)' +
      ' AND tar.tb_clave(+) = ''TARIF''' +
      ' AND domp.hd_id = en_idhistoricodomiciliopostal' +
      ' AND cpvp.pv_codigo(+) = domp.hd_provincia' +
      ' AND doml.hd_id = en_idhistoricodomicilio' +
      ' AND cpvl.pv_codigo(+) = doml.hd_provincia';

{$R *.DFM}

procedure TQRContrato.qrCUITPrint(Sender: TObject; var Value: String);
begin
  inherited;

  Value := Copy(Value, 1, 2) + '-' + Copy(Value, 3, 8) + '-' + Copy(Value, 11, 1);
end;

procedure TQRContrato.QRLSuscripcionPrint(Sender: TObject; var Value: String);
begin
  inherited;

  Value := Value + Get_DomicilioLegalART(sdqQuery.FieldByName('vig_desde').AsDateTime) + ', a los ' +
           FormatDateTime('d "días del mes de" mmmm "de" yyyy"."', sdqQuery.FieldByName('vig_desde').AsDateTime);
end;

procedure TQRContrato.QRCallePostalPrint(Sender: TObject; var Value: String);
begin
  inherited;

  Value := Trim(Value);
end;

procedure TQRContrato.Preparar(aTipoContrato, aLeyenda: String; aCantCopias: Integer; aImprimir: Boolean = False;
                               const aNombreArchivo: String = '');
var
  sSql: String;
begin
  FTipoContrato := aTipoContrato;

  if aTipoContrato = 'A' then
  begin
    ChBandAlicuota_B.Height := 0;
    ChBandAlicuota1_B.Height := 0;
    ChBandAlicuota2_B.Height := 0;
    ChBandAlicuota3_B.Height := 0;
    ChBandAlicuota4_B.Height := 0;
    ChBandAlicuota5_B.Height := 0;
    ChBandAlicuota6_B.Height := 0;
    ChBandAlicuota7_B.Height := 0;
    ChBandAlicuotaFinal_B.Height := 0;
    ChBandAlicuotaFinal1_B.Height := 0;
    ChBandAlicuotaFinal2_B.Height := 0;
    ChBandAlicuotaFinal3_B.Height := 0;
    ChBandAlicuotaFinal3_D.Height := 0;
    ChBandAlicuota1_V.Height := 0;
    ChBandLeyenda_D.Height   := 0;
  end
  else if aTipoContrato = 'B' then
  begin
    ChBandAlicuota_AV.Height := 0;
    ChBandAlicuota1_A.Height := 0;
    ChBandAlicuota1_V.Height := 0;
    ChBandAlicuotaFinal3_D.Height   := 0;
    ChBandAlicuotaFinal_AVD.Height  := 0;
    ChBandAlicuotaFinal1_AVD.Height := 0;
    ChBandAlicuotaFinal2_AVD.Height := 0;
    ChBandLeyenda_D.Height := 0;
  end
  else if aTipoContrato = 'C' then
  begin
    //Este está en otra unidad
    MessageDlg('Debe llamar al unqrContrato2!!!', mtError, [mbOK], 0);
  end
  else if aTipoContrato = 'D' then
  begin
    ChBandAlicuota_B.Height := 0;
    ChBandAlicuota1_B.Height := 0;
    ChBandAlicuota2_B.Height := 0;
    ChBandAlicuota3_B.Height := 0;
    ChBandAlicuota4_B.Height := 0;
    ChBandAlicuota5_B.Height := 0;
    ChBandAlicuota6_B.Height := 0;
    ChBandAlicuota7_B.Height := 0;
    ChBandAlicuotaFinal_B.Height := 0;
    ChBandAlicuotaFinal1_B.Height := 0;
    ChBandAlicuotaFinal2_B.Height := 0;
    ChBandAlicuotaFinal3_B.Height := 0;
    ChBandAlicuota_AV.Height := 0;
    ChBandAlicuota1_A.Height := 0;
    ChBandAlicuota1_V.Height := 0;
    //Se agrega la a la leyenda "Anexo A"
    qrAdicionales.Caption := 'Anexo A, Anexo II, Anexo III, y el/los Formularios de Autoevaluación suscripto/s como declaración jurada del empleador.'
  end
  else if aTipoContrato = 'V' then
  begin
    ChBandAlicuota_B.Height := 0;
    ChBandAlicuota1_B.Height := 0;
    ChBandAlicuota2_B.Height := 0;
    ChBandAlicuota3_B.Height := 0;
    ChBandAlicuota4_B.Height := 0;
    ChBandAlicuota5_B.Height := 0;
    ChBandAlicuota6_B.Height := 0;
    ChBandAlicuota7_B.Height := 0;
    ChBandAlicuotaFinal_B.Height := 0;
    ChBandAlicuotaFinal1_B.Height := 0;
    ChBandAlicuotaFinal2_B.Height := 0;
    ChBandAlicuotaFinal3_B.Height := 0;
    ChBandAlicuotaFinal3_D.Height := 0;
    ChBandAlicuota1_A.Height := 0;
    ChBandLeyenda_D.Height   := 0;
  end;

  sSql :=
    'SELECT tb_especial1' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''PARAM''' +
      ' AND tb_codigo = ''HIPOACUSIA''';
  FHipoAcusia := ValorSqlExtended(sSql, 0);

  sSql :=
    'SELECT tb_especial1' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''PARAM''' +
      ' AND tb_codigo = ''APORTESRT''';
  FAporteSRT := ValorSqlExtended(sSql, 0);

  sSql := SQL_IMPCONTRATO + ' AND en_id = :id';
  OpenQueryEx(sdqQuery, [FEndoso], sSql, True);
  CargarControles(aTipoContrato, aLeyenda);

  PrinterSettings.Copies := aCantCopias;
  PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;

  // Agregado para que salga bien la carga de impresión masiva de contratos en la impresora LaserJet 4050 de Afiliaciones..
  if IsWinXP then
  begin
    PrinterSettings.UseCustomBinCode := True;
    PrinterSettings.CustomBinCode := 261;
  end;

  {FIXME: Sacar esto porque se agrego solo por un problema de falta de formularios con logo.
          Sacar del formulario de reporte qriLogoNom y qrlCodigoART
  }
  qriLogoNom.Picture.Bitmap.LoadFromResourceName(hInstance, RES_EMP_LOGO_BN);

  if aNombreArchivo <> '' then
    FileToPDFSvr(QRContrato, ExtractFileDir(aNombreArchivo), aNombreArchivo, True)
  else if aImprimir then
    Print
  else
    PreviewModal;
end;

procedure TQRContrato.ImprimeMonto(Sender: TObject; var Value: String);
begin
  ImprimeMontoDec(Sender, Value, 4);
end;

procedure TQRContrato.ImprimeMonto23(Sender: TObject; var Value: String);
begin
  if (FTipoContrato = 'A') or (FTipoContrato = 'V') then
    ImprimeMontoDec(Sender, Value, 2)
  else if (FTipoContrato = 'D') then
    ImprimeMontoDec(Sender, Value, 3);
end;

procedure TQRContrato.ImprimeMonto2(Sender: TObject; var Value: String);
begin
  ImprimeMontoDec(Sender, Value, 2);
end;

procedure TQRContrato.ImprimeMonto3(Sender: TObject; var Value: String);
begin
  ImprimeMontoDec(Sender, Value, 3);
end;

procedure TQRContrato.ImprimeMontoDec(aSender: TObject; var aValue: String; aCantDec: Integer);
begin
  if (aValue = '0') or (aValue = '') then
    aValue := ' '
  else
    aValue := '% ' + CurrToStrF(StrToCurr(aValue), ffNumber, aCantDec);
end;

procedure TQRContrato.AjustaDecimales(Sender: TObject; var Value: String);
begin
  if (Value = '0') or (Value = '') then
    Value := ' '
  else
    Value := CurrToStrF(StrToCurr(Value), ffcurrency, 2);
end;

procedure TQRContrato.CargarControles(aTipoContrato, aLeyenda: String);
var
  dCargoAdmin: Double;
  dPorcDescNivel: Double;
  dPorcDescVol: Double;
  dPorcMasa: Double;
  dPorcMasaTarifa: Double;
//  dSumaFija: Double;
  dSumaFijaTarifa: Double;
  dVarSubtotal: Double;
  sSql: String;
begin
  with sdqQuery do
  begin
    dCargoAdmin     := FieldByName('ht_cargoadmin').AsFloat;
    dPorcDescNivel  := FieldByName('ht_porcdescnivel').AsFloat;
    dPorcDescVol    := FieldByName('ht_porcdescvolumen').AsFloat;
    dPorcMasa       := FieldByName('ht_porcmasa').AsFloat;
    dPorcMasaTarifa := FieldByName('ht_porcmasatarifa').AsFloat;
//    dSumaFija       := FieldByName('ht_sumafija').AsFloat;
    dSumaFijaTarifa := FieldByName('ht_sumafijatarifa').AsFloat;

    QRSumaFija.Caption     := FloatToStr(dSumaFijaTarifa);
    QRSumaFija2.Caption    := FloatToStr(dSumaFijaTarifa);
    QRSumaFija3.Caption    := FloatToStr(dSumaFijaTarifa);

    QRPorcVar.Caption      := FloatToStr(dPorcMasaTarifa);
    QRPorcVar2.Caption     := FloatToStr(dPorcMasaTarifa);
    QRPorcVar3.Caption     := FloatToStr(dPorcMasaTarifa);

    QRRebVol.Caption       := FloatToStr(dPorcDescVol);
    QRRebVol2.Caption      := FloatToStr(dPorcDescVol);
    QRRebVol3.Caption      := FloatToStr(dPorcDescVol);
    QRRebVolVar3.Caption   := FloatToStr(-dPorcDescVol / 100 * dPorcMasaTarifa);

    QRRebHS.Caption        := FloatToStr(dPorcDescNivel);
    QRRebHS2.Caption       := FloatToStr(dPorcDescNivel);
    QRRebHS3.Caption       := FloatToStr(dPorcDescNivel);
    QRRebHSVar3.Caption    := FloatToStr(-dPorcDescNivel / 100 * dPorcMasaTarifa);

    QRCargoAdmin.Caption   := FloatToStr(dCargoAdmin);
    QRCargoAdmin2.Caption  := FloatToStr(dCargoAdmin);

    dVarSubtotal           := dPorcMasaTarifa + (-dPorcDescVol / 100 * dPorcMasaTarifa) + (-dPorcDescNivel / 100 * dPorcMasaTarifa);

    qrAporteSSN.Caption    := FloatToStr(FAporteSRT);
    QRPesosSSN.Caption     := FloatToStr(FAporteSRT / 100 * dSumaFijaTarifa);
    QRPorcSSN.Caption      := FloatToStr(FAporteSRT / 100 * dVarSubtotal);

    QRSubtotalPorc.Caption := FloatToStr(dVarSubtotal + (FAporteSRT / 100 * dVarSubtotal));
    QRSubTotal.Caption     := FloatToStr(dSumaFijaTarifa + (FAporteSRT / 100 * dSumaFijaTarifa));

    QRFinalPorc.Caption    := QRSubtotalPorc.Caption;
    QRPorcVar4.Caption     := FloatToStr(dPorcMasa);

    if aTipoContrato = 'B' then
    begin
      QRSumaFija4.Caption  := ' ';
      QRFinalPesos.Caption := FloatToStr(FieldByName('ht_alicuotapesos').AsCurrency);
    end
    else
    begin
      QRFinalPesos.Caption := ' ';
      QRSumaFija4.Caption  := FloatToStr(FieldByName('ht_alicuotapesos').AsCurrency);
    end;

    sSql :=
      'SELECT afiliacion.get_impresion(:contrato)' +
       ' FROM DUAL';
    qrTipoImpresion.Caption := ValorSqlEx(sSql, [FieldByName('contrato').AsInteger]);

    QRLLeyendaDescrDescRec.Caption := Get_DescripcionPorcRecargosYDescuentos(aTipoContrato, dPorcDescVol, dPorcDescNivel);
    if QRLLeyendaDescrDescRec.Caption = '' then
      ChBandLeyenda_D.Height := 0;

    QRLeyenda.Caption := aLeyenda;
  end;
end;

// devuelve la descripción del porcentaje por recargo o descuento de la tarifa indicada
function TQRContrato.Get_DescripcionPorcRecargoDescuento(aDescripcion: String; aValor: Double; aFormato,
                                                         aTipoRecargoRebaja: String): String;
var
  sDescripcionPorcRecargoDescuento: String;
begin
  if aValor <> 0 then
  begin
    sDescripcionPorcRecargoDescuento := aDescripcion + ': ';

    if aTipoRecargoRebaja = '%' then
      sDescripcionPorcRecargoDescuento := sDescripcionPorcRecargoDescuento + Format('%' + aFormato + 'f', [aValor]) + ' ' + aTipoRecargoRebaja
    else if aTipoRecargoRebaja = '$' then
      sDescripcionPorcRecargoDescuento := sDescripcionPorcRecargoDescuento + aTipoRecargoRebaja + ' ' + Format('%' + aFormato + 'f', [aValor]);

    sDescripcionPorcRecargoDescuento := sDescripcionPorcRecargoDescuento + ', ';
  end
  else
    sDescripcionPorcRecargoDescuento := '';

  Result := sDescripcionPorcRecargoDescuento;
end;

// devuelve la descripción de los porcentajes por recargo y descuento de la tarifa
function TQRContrato.Get_DescripcionPorcRecargosYDescuentos(aTipoContr: String; aPorcDescVolumen, aPorcDescNivel: Double): String;
var
  sDescripcionPorcRecargosYDescuentos: String;
begin
  // no se están teniendo en cuenta los recargos/rebajas por siniestralidad
  sDescripcionPorcRecargosYDescuentos := '';

  if aTipoContr = 'D' then
  begin
    sDescripcionPorcRecargosYDescuentos := sDescripcionPorcRecargosYDescuentos + Get_DescripcionPorcRecargoDescuento('Rebaja por Volumen Masa Salarial', aPorcDescVolumen, '3.2', '%');
    sDescripcionPorcRecargosYDescuentos := sDescripcionPorcRecargosYDescuentos + Get_DescripcionPorcRecargoDescuento('Rebaja Higiene y Seguridad', aPorcDescNivel, '3.2', '%');

    if sDescripcionPorcRecargosYDescuentos <> '' then
      sDescripcionPorcRecargosYDescuentos := 'Las tarifas anteriormente expresadas incluyen: ' + StrLeft(sDescripcionPorcRecargosYDescuentos, Length(sDescripcionPorcRecargosYDescuentos) - 2) + '.';
  end;

  Result := sDescripcionPorcRecargosYDescuentos;
end;

procedure TQRContrato.TitleBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  qriLogoNom.Enabled   := ImprimeMembrete;
  qrlCodigoART.Enabled := ImprimeMembrete;
end;

end.
