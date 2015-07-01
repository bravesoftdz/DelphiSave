unit unQREndoso1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unQREndosoBase, QRCtrls, ArtQReports,
  QuickRpt, ExtCtrls, Db, SDEngine, unAfiliaciones, unArt, unDmPrincipal;

type
  RActividad = record
    Ciiu1: String;
    Ciiu2: String;
    Ciiu3: String;
    Descripcion1: String;
    Descripcion2: String;
    Descripcion3: String;
    Usar: Boolean;
  end;

type
  TqrEndoso1 = class(TqrEndosoBase)
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlLugarFecha: TQRLabel;
    ChildBand1: TQRChildBand;
    qrEndosoNro: TQRLabel;
    qrVigenciaEndoso: TQRLabel;
    ChildBand2: TQRChildBand;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    qrMotivo: TQRLabel;
    ChildBand3: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    ChildBand4: TQRChildBand;
    QRDBText4: TQRDBText;
    QRShape2: TQRShape;
    qrCUIT: TQRDBText;
    QRShape4: TQRShape;
    ChildBand5: TQRChildBand;
    ChildBand6: TQRChildBand;
    QRLabel8: TQRLabel;
    ChildBand7: TQRChildBand;
    QRLocalidadPostal: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    ChildBand8: TQRChildBand;
    ChildBand9: TQRChildBand;
    lbDomicilioLegalTitulo: TQRLabel;
    ChildBand10: TQRChildBand;
    QRLocalidadLegal: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    ChildBand11: TQRChildBand;
    ChildBand12: TQRChildBand;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    qrcb13: TQRChildBand;
    QRDBText7: TQRDBText;
    qrshActividadLinea1: TQRShape;
    QRDBText8: TQRDBText;
    qrshActividadLinea2: TQRShape;
    ChildBand15: TQRChildBand;
    ChildBand16: TQRChildBand;
    shNivelHigieneTitulo: TQRShape;
    lbNivelHigieneTitulo: TQRLabel;
    ChildBand14: TQRChildBand;
    qrCh1: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    qrCh2: TQRChildBand;
    QRLabel13: TQRLabel;
    qrCh3: TQRChildBand;
    QRLabel14: TQRLabel;
    qrCh4: TQRChildBand;
    QRLabel15: TQRLabel;
    qrCh5: TQRChildBand;
    QRLabel16: TQRLabel;
    qrCh6: TQRChildBand;
    QRLabel19: TQRLabel;
    QRSubTotal1: TQRLabel;
    QRSubTotal2: TQRLabel;
    qrCh12: TQRChildBand;
    QRLabel17: TQRLabel;
    qrCh13: TQRChildBand;
    QRLabel18: TQRLabel;
    qrCh14: TQRChildBand;
    QRLabel20: TQRLabel;
    qrCh15: TQRChildBand;
    QRLabel21: TQRLabel;
    qrALICUOTA: TQRLabel;
    qrCh16: TQRChildBand;
    QRLabel22: TQRLabel;
    qrPORCMASA: TArtQRLabel;
    qrCh17: TQRChildBand;
    qrTextoInf: TQRLabel;
    qrLeyenda060: TQRLabel;
    qrCh19: TQRChildBand;
    edNivelHigiene: TQRDBText;
    shNivelHigiene: TQRShape;
    qrCuitCodBarra: TQRLabel;
    qrRecargosDescuentos: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    qrCh7: TQRChildBand;
    qrCh8: TQRChildBand;
    qrCh9: TQRChildBand;
    qrCh10: TQRChildBand;
    qrCh11: TQRChildBand;
    qrTit0: TQRLabel;
    qrTit1: TQRLabel;
    qrTit2: TQRLabel;
    qrTit3: TQRLabel;
    qrTit4: TQRLabel;
    qrDesc0_0: TQRLabel;
    qrDesc1_0: TQRLabel;
    qrDesc2_0: TQRLabel;
    qrDesc3_0: TQRLabel;
    qrDesc4_0: TQRLabel;
    qrDesc0_1: TQRLabel;
    qrDesc0_2: TQRLabel;
    qrDesc1_1: TQRLabel;
    qrDesc1_2: TQRLabel;
    qrDesc2_1: TQRLabel;
    qrDesc2_2: TQRLabel;
    qrDesc3_1: TQRLabel;
    qrDesc3_2: TQRLabel;
    qrDesc4_1: TQRLabel;
    qrDesc4_2: TQRLabel;
    qrDesc5_0: TQRLabel;
    qrDesc5_1: TQRLabel;
    qrDesc5_2: TQRLabel;
    qrDesc6_1: TQRLabel;
    qrDescVolumen_0: TQRLabel;
    qrDescVolumen_2: TQRLabel;
    qrDescHYS_0: TQRLabel;
    qrDescHYS_2: TQRLabel;
    qrSumaFijaTarifa: TQRLabel;
    qrPorcMasaTarifa: TQRLabel;
    Raya1: TQRShape;
    Raya2: TQRShape;
    Raya3: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRNombreFirmante: TQRDBText;
    QRCaracterFirmante: TQRDBText;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    Linea1: TQRShape;
    Linea2: TQRShape;
    qriLogoNom: TQRImage;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText14: TQRDBText;
    qrCh20: TQRChildBand;
    qrFormatoPie: TQRLabel;
    procedure qrCUITPrint(Sender: TObject; var Value: String);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrcb13BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure lbDomicilioLegalTituloPrint(Sender: TObject; var Value: String);
    procedure QRDBText7Print(Sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
  private
    FActividades: RActividad;
    FEndosoTemporal: Integer;
    FIdCarta: Integer;
    FMotivoEndoso: String;
    FImprimeFirma: Boolean;
  protected
    function FormatDescuento(Descripcion: String; Valor: Double; Formato, TipoRecargoRebaja: String): String;
    function Get_DescuentoRecargoCompleto(Tarifa: RecTarifa): String;
    function Get_FormatoPie1278(aNroCuit, aNroEndoso: String): String;
    function GetSql: String; override;

    procedure CargarControles; override;
    procedure DoImpresionCarta(const aIdCarta: TTableId; const TransactionMode: TTransactionMode);
    procedure FormatoDesc(var aBanda: TQRChildBand; const aRecargo, aRebaja: Currency; const aTitulo: String; aqrTitulo,
                          aQr0, aQr1, aQr2: TqrLabel; const aColumna: Integer);
    procedure OcultarCuadroTarifario;
  public
    constructor Create(AOwner: TComponent); override;
    procedure PrepararImpresion(const aCartaId: TTableId; const aTransactionMode: TTransactionMode;
                                const aImprimir: Boolean; const aCantidadCopias: Integer = -1;
                                const aPdfFileName: String = ''; const aMostrarEspera: boolean = True);

    property IdCarta: Integer write FIdCarta;
    property ImprimeMembrete;
    property ImprimirFirma : boolean read FImprimeFirma write FImprimeFirma;
  end;

const
  SQLENDOSO: String =
    'SELECT en_id, en_fechaalta, en_vigenciaendoso AS vig_endoso, en_endoso AS nro_endoso, en_movimiento,' +
          ' mot.tb_descripcion AS motivo_endoso, hc_contrato AS contrato, hc_vigenciadesde AS vig_desde,' +
          ' hc_vigenciahasta AS vig_hasta, ac.ac_codigo AS cod_actividad, ac.ac_descripcion AS actividad,' +
          ' ac2.ac_codigo AS cod_actividad2, ac2.ac_descripcion AS actividad2, ac3.ac_codigo AS cod_actividad3,' +
          ' ac3.ac_descripcion AS actividad3, fo_formulario AS nro_formulario, hc_nivel AS nivel, hm_nombre AS nombre,' +
          ' hm_cuit AS cuit,' +
          ' utiles.armar_domicilio(doml.hd_calle, doml.hd_numero, doml.hd_piso, doml.hd_departamento) hd_domiciliolegal,' +
          ' art.utiles.armar_localidad(doml.hd_cpostal, doml.hd_cpostala, doml.hd_localidad, '''') localidad_l,' +
          ' cpvl.pv_descripcion provincia_l, tar.tb_descripcion AS tipo_tarifa,' +
          ' NVL((SELECT fi_firmante FROM cfi_firma WHERE fi_id = NVL (ca_idfirmareimpresion, ca_idfirma)), (SELECT fi_firmante' +
                              ' FROM cfi_firma' +
                             ' WHERE fi_caracter = ''GERENTE TECNICA-ACTUARIAL''' +
                               ' AND fi_fechabaja IS NULL)) nombre_firmante,' +
          ' NVL((SELECT fi_caracter FROM cfi_firma where fi_id = NVL (ca_idfirmareimpresion, ca_idfirma)), (SELECT fi_caracter' +
                              ' FROM cfi_firma' +
                             ' WHERE fi_caracter = ''GERENTE TECNICA-ACTUARIAL''' +
                               ' AND fi_fechabaja IS NULL)) AS caracter_firmante,' +
          ' NVL((SELECT fi_firma FROM cfi_firma where fi_id = NVL (ca_idfirmareimpresion, ca_idfirma)), (SELECT fi_firma' +
                           ' FROM cfi_firma' +
                          ' WHERE fi_caracter = ''GERENTE TECNICA-ACTUARIAL''' +
                            ' AND fi_fechabaja IS NULL)) AS firma,' +
          ' en_motivo, ht_incumplido_sumafija, ht_incumplido_porcmasa, ht_porcmasa, ht_sumafija, ht_incumplido_desde' +
     ' FROM aen_endoso, ahc_historicocontrato, ctb_tablas mot, cac_actividad ac, cac_actividad ac2, cac_actividad ac3,' +
          ' afo_formulario, ahm_historicoempresa, aht_historicotarifario, ctb_tablas tar, cfi_firma, ctb_tablas fir,' +
          ' ahd_historicodomicilio doml, cpv_provincias cpvl, cpv_provincias cpvp,' +
          ' cat_areatexto, cca_carta' +
    ' WHERE en_idhistoricocontrato = hc_id' +
      ' AND en_idhistoricoempresa = hm_id' +
      ' AND en_idhistoricotarifa = ht_id' +
      ' AND doml.hd_id(+) = en_idhistoricodomicilio' +
      ' AND cpvl.pv_codigo(+) = doml.hd_provincia' +
      ' AND en_motivo = mot.tb_codigo(+)' +
      ' AND mot.tb_clave(+) = ''MOTEN''' +
      ' AND hc_idactividad = ac.ac_id(+)' +
      ' AND hc_idactividad2 = ac2.ac_id(+)' +
      ' AND hc_idactividad3 = ac3.ac_id(+)' +
      ' AND hc_idformulario = fo_id' +
      ' AND ht_tipodetarifa = tar.tb_codigo(+)' +
      ' AND tar.tb_clave(+) = ''TARIF''' +
      ' AND fir.tb_clave(+) = ''FI_RE''' +
      ' AND fir.tb_codigo(+) = ''2''' +
      ' AND en_id = ca_idendoso(+)' +
      ' AND fi_id(+) = NVL(ca_idfirmareimpresion, ca_idfirma)' +
     // ' AND fi_codusuario = ht_usuarioautoriza(+)' +
      ' AND ca_idareatexto = at_id(+)' +
      ' %s';

var
  qrEndoso1: TqrEndoso1;
  Tarifa: RecTarifa;

implementation

uses
  AnsiSql, strFuncs, unPrincipal, SqlFuncs, DateUtils, CustomClasses;

{$R *.DFM}

{ TqrEndosoBase1 }

function TqrEndoso1.GetSql: String;
var
  sSql: String;
begin
  FOrderBy := 'ca_id';
  sSql := '';

  if FIdCarta > 0 then
    sSql := ' AND ca_id = ' + IntToStr(FIdCarta);

  if FArea <> '' then
    sSql := sSql + ' AND at_area = ' + QuotedStr(FArea);  //aca estaba un AND at_area(+) se quito por pedido de Grossi y Vila

  Result := Format(SQLENDOSO, [sSql]);
end;

procedure TqrEndoso1.qrCUITPrint(Sender: TObject; var Value: String);
begin
  Value := Copy(Value, 1, 2) + '-' + Copy(Value, 3, 8) + '-' + Copy(Value, 11, 1);
end;

procedure TqrEndoso1.CargarControles;
var
  aFechaVigencia: TDateTime;
  Base: Integer;
  EsDecreto1278: Boolean;
  EsMasivo: Boolean;
  FormatoPie: String;
  NroCuit: String;
  NroEndoso: String;
  SqlResults: TStringList;
  sSql: String;
  TextoFondo: String;
  iValorClausulaPenal : Integer;
begin
  //Carga los controles del formulario padre
  inherited;

  //Obtengo todos los valores de la tarifa
  if (FEndosoTemporal = 0) then
  begin
    GetTarifaFromEndoso(IdEndoso, Tarifa, False);
    qrEndosoNro.Caption := 'Endoso Nº ' + sdqQuery.FieldByName('nro_endoso').AsString;
    qrlLugarFecha.Caption := FormatDateTime('"Buenos Aires, "d "de" mmmm "de" yyyy', sdqQuery.FieldByName('en_fechaalta').AsDateTime);
    qrVigenciaEndoso.Caption := FormatDateTime('"Fecha de inicio de vigencia del endoso: "dd/mm/yyyy', sdqQuery.FieldByName('vig_endoso').AsDateTime) +
                                FormatDateTime('" (Período AFIP a declarar" mm/yyyy)', IncMonth(sdqQuery.FieldByName('vig_endoso').AsDateTime, -1));
    aFechaVigencia := sdqQuery.FieldByName('vig_endoso').AsDateTime;

    sSql :=
      'SELECT en_motivo' +
       ' FROM aen_endoso, ctb_tablas' +
      ' WHERE en_contrato = :contrato' +
        ' AND en_motivo = tb_codigo' +
        ' AND tb_clave = ''MOTEN''' +
        ' AND tb_especial1 = ''1''' +
        ' AND en_endoso = :endoso';

    with GetQueryEx(sSql, [sdqQuery.FieldByName('contrato').AsInteger, sdqQuery.FieldByName('nro_endoso').AsInteger]) do
    try
      if not Eof then
      begin
        FMotivoEndoso := FieldByName('en_motivo').AsString;
        qrMotivo.Caption := 'Motivo: Cambio de Tarifa';

        if FieldByName('en_motivo').AsString = '01.11' then
          qrMotivo.Caption := 'Incorporación de Actividad'
        else if FieldByName('en_motivo').AsString = '01.12' then
          qrMotivo.Caption := 'Cambio de Actividad'
        else if FieldByName('en_motivo').AsString = '02.1' then
          qrMotivo.Caption := 'Incorporación de Actividad - Modificación Tarifa'
        else if FieldByName('en_motivo').AsString = '02.5' then
          qrMotivo.Caption := 'Cambio de Actividad - Modificación Tarifa';
      end
      else
        qrMotivo.Caption := 'Motivo: ' + sdqQuery.FieldByName('motivo_endoso').AsString;
    finally
      Free;
    end;
  end
  else
  begin
    GetTarifaFromEndoso(FEndosoTemporal, Tarifa, True);

    //////////////////////////////////////////////////////////////////
    // Cargo los labels que son diferentes en caso que sea temporal //
    //////////////////////////////////////////////////////////////////
    sSql :=
      'SELECT cac1.ac_codigo ciiu1, cac2.ac_codigo ciiu2, cac3.ac_codigo ciiu3, cac1.ac_descripcion descripcionciiu1,' +
            ' cac2.ac_descripcion descripcionciiu2, cac3.ac_descripcion descripcionciiu3, et_fechaalta,' +
            ' et_vigenciaendoso, et_motivo, et_incumplido_sumafija, et_incumplido_porcmasa, et_incumplido_desde,' +
            ' et_porcmasa, et_sumafija' +
       ' FROM tmp.tet_endosotarifa, cac_actividad cac1, cac_actividad cac2, cac_actividad cac3' +
      ' WHERE et_idactividad = cac1.ac_id(+)' +
        ' AND et_idactividad2 = cac2.ac_id(+)' +
        ' AND et_idactividad3 = cac3.ac_id(+)' +
        ' AND et_id = :id';
    with GetQueryEx(sSql, [FEndosoTemporal]) do
    try
      FActividades.Ciiu1        := FieldByName('ciiu1').AsString;
      FActividades.Ciiu2        := FieldByName('ciiu2').AsString;
      FActividades.Ciiu3        := FieldByName('ciiu3').AsString;
      FActividades.Descripcion1 := FieldByName('descripcionciiu1').AsString;
      FActividades.Descripcion2 := FieldByName('descripcionciiu2').AsString;
      FActividades.Descripcion3 := FieldByName('descripcionciiu3').AsString;
      FActividades.Usar         := True;

      aFechaVigencia := FieldByName('et_vigenciaendoso').AsDateTime;
      FMotivoEndoso  := FieldByName('et_motivo').AsString;

      qrEndosoNro.Caption      := '';
      qrlLugarFecha.Caption    := ' ';
      qrMotivo.Caption         := 'Motivo: Cambio de Tarifa';
      qrVigenciaEndoso.Caption := FormatDateTime('"Fecha de inicio de vigencia del endoso: "dd/mm/yyyy', FieldByName('et_vigenciaendoso').AsDateTime) +
                                  FormatDateTime('" (Período AFIP a declarar" mm/yyyy)', IncMonth(FieldByName('et_vigenciaendoso').AsDateTime, -1));
    finally
      Free;
    end;
  end;

  //sigue con los particulares de este formulario
  case Formato of
    2:
    begin
      //Carga el cuadro tarifario
      qrSumaFijaTarifa.Caption := '$' + Format('%3.2f', [Tarifa.SumaFijaTarifa]);
      qrPorcMasaTarifa.Caption := '%' + Format('%3.3f', [Tarifa.PorcMasaTarifa]);
      qrDescVolumen_0.Caption  := '%' + Format('%3.2f', [Tarifa.RebajaVolumenVal]);
      qrDescVolumen_2.Caption  := '%' + Format('%3.3f', [Tarifa.RebajaVolumenPorc]);
      qrDescHYS_0.Caption      := '%' + Format('%3.2f', [Tarifa.RebajaHSVal]);
      qrDescHYS_2.Caption      := '%' + Format('%3.3f', [Tarifa.RebajaHSPorc]);
      QRSubTotal1.Caption      := '$' + Format('%3.2f', [Tarifa.SubTotalPesos]);
      QRSubTotal2.Caption      := '%' + Format('%3.3f', [Tarifa.SubTotalPorc]);
      //Recargos y rebajas
      FormatoDesc(qrCh7, Tarifa.RecargoSinVarVal, Tarifa.RebajaSinVarVal, 'Siniestralidad % s/variable',
                  qrTit0, qrDesc0_0, qrDesc0_1, qrDesc0_2, 2);

      FormatoDesc(qrCh8, Tarifa.RecargoSinSFijoVal, Tarifa.RebajaSinSFijoVal, 'Siniestralidad % s/fijo',
                  qrTit1, qrDesc1_0, qrDesc1_1, qrDesc1_2, 1);

      FormatoDesc(qrCh9, Tarifa.RCSMF, Tarifa.RBSMF, 'Siniestralidad monto fijo',
                  qrTit2, qrDesc2_0, qrDesc2_1, qrDesc2_2, 1);

      FormatoDesc(qrCh10, Tarifa.RecargoEspVal, Tarifa.RebajaEspVal, 'Especial % s/variable',
                  qrTit3, qrDesc3_0, qrDesc3_1, qrDesc3_2, 2);

      FormatoDesc(qrCh11, Tarifa.RecargoEspSFijoVal, Tarifa.RebajaEspSFijoVal, 'Especial % s/fijo',
                  qrTit4, qrDesc4_0, qrDesc4_1, qrDesc4_2, 1);

      //Aporte SRT/SSN
      qrDesc5_0.Caption := '%' + Format('%3.2f', [Tarifa.AporteSRT]);
      qrDesc5_1.Caption := '$' + Format('%3.2f', [Tarifa.AporteSRTPesos]);
      qrDesc5_2.Caption := '%' + Format('%3.3f', [Tarifa.AporteSRTPorc]);
      //Fondo
      qrDesc6_1.Caption := '$' + Format('%3.2f', [Tarifa.AporteFondo]);

      //Sigo con el pie del formulario
      qrLeyenda060.Caption         := '';
      qrFormatoPie.Caption         := '';
      qrRecargosDescuentos.Caption := '';
      qrTextoInf.Top := 2;
      qrCh17.Height  := 40;
    end;
    3:
    begin
      //Oculta el cuadro con los detalles de la tarifa
      OcultarCuadroTarifario;

      sSql :=
        'SELECT en_motivo, hc_origen' +
         ' FROM aen_endoso, ahc_historicocontrato' +
        ' WHERE en_idhistoricocontrato = hc_id' +
          ' AND en_id = ' + SQLValue(IdEndoso);
      SqlResults := ValoresColSQL(sSql);
      try
        EsDecreto1278 := (SqlResults[0] = '02.14');
        EsMasivo      := (SqlResults[1] = 'T');
      finally
        SqlResults.Free;
      end;

      if EsDecreto1278 Then
      begin
        NroCuit    := sdqQuery.FieldByName('cuit').AsString;
        NroEndoso  := sdqQuery.FieldByName('nro_endoso').AsString;
        FormatoPie := Get_FormatoPie1278 (NroCuit, NroEndoso);

        if FormatoPie = 'DE02' then        //incluye fondo (Decreto 1278/2000 - Pie)
        begin
          TextoFondo := 'Estas tarifas incluyen los $0,60 correspondientes al Fondo Específico ' +
                        'Decreto 590/97 PEN y la nueva tasa fijada por la ' +
                        'Superintendencia de Riesgos del Trabajo (Res. ' +
                        'Conjunta STR-SSN nº39/98 del 3% sobre la prima total). ';
        end
        else if FormatoPie = 'DE03' then     //no incluye fondo (Decreto 1278/2000 - GBA - Pie)
        begin
          TextoFondo := 'Estas tarifas incluyen la tasa fijada por la Superintendencia de Riesgos ' +
                        'del Trabajo  (Res. conjunta SRT-SSN Nº 39/98 del 3% sobre ' +
                        'prima total) y NO INCLUYE la suma de $ 0,60 correspondiente ' +
                        'al Fondo Fiduciario de Enfermedades Profesionales(*) (Dto. ' +
                        '1278/00- el cual reemplaza al Fondo para Fines Específicos Dto. 590/97). ' + #13#10 +
                        '(*) El Fondo  Fiduciario de Enfermedades Profesionales se crea para ' +
                        'hacer frente  al costo de las Prestaciones dinerarias y en especie ' +
                        'derivadas de enfermedades no incluidas en el Listado de Enfermedades ' +
                        'Profesionales pero que, en cada caso concreto, pueden considerarse de ' +
                        'naturaleza profesional según las pautas establecidas en el Dto. 1278/2000 ' +
                        'y al pago de prestaciones dinerarias derivadas de Hipoacusias Bilaterales.';
        end;
      end
      else if EsMasivo then
      begin
        if Tarifa.AporteFondo <> 0 then
        begin
          if Tarifa.AporteSRT <> 0 then
            TextoFondo := 'Estas tarifas incluyen los $0,60 correspondientes al Fondo Específico ' +
                          'Decreto 590/97 PEN y la nueva tasa fijada por la ' +
                          'Superintendencia de Riesgos del Trabajo (Res.' +
                          'Conjunta STR-SSN nº39/98 del 3% sobre la prima total).'
          else
            TextoFondo := 'Estas tarifas incluyen los $0,60 correspondientes al Fondo Específico ' +
                          'Decreto 590/97 PEN. ';
        end
        else
          TextoFondo := '';
      end;
      //Pongo el formato del pie
      qrFormatoPie.Caption := TextoFondo;

      qrLeyenda060.Caption := '';
      qrRecargosDescuentos.Caption := '';
      qrTextoInf.Top := 2;
      qrCh17.Height  := 40;
    end;
    else ///MUY IMPORTANTE, EL 'ELSE' DEBE SER 4
    begin
      //Oculta el cuadro con los detalles de la tarifa
      OcultarCuadroTarifario;

      qrRecargosDescuentos.Caption := Get_DescuentoRecargoCompleto(Tarifa);
      qrFormatoPie.Caption := '';
    end;
  end;

  /////////////////////////////
  //  ESTO ES COMUN A TODOS  //
  /////////////////////////////
//  qrALICUOTA.Caption := '$' + Format('%3.2f', [Tarifa.SubTotal3Pesos - sdqQuery.FieldByName('ht_incumplido_sumafija').AsFloat + 0.6]);
  qrALICUOTA.Caption := '$' + Format('%3.2f', [Tarifa.SubTotal3Pesos + 0.60]);
  qrPORCMASA.Caption := '%' + Format('%3.3f', [Tarifa.SubTotal3Porc]);
  qrCuitCodBarra.Caption := '*' + sdqQuery.FieldByName('cuit').AsString + '*';

  with sdqQuery do
    if (FMotivoEndoso = '03.01') or (FMotivoEndoso = '03.02') or (FMotivoEndoso = '09.09') then
    begin
      ChildBand6.Height := 0;
      ChildBand7.Height := 0;
      edNivelHigiene.Top := edNivelHigiene.Top - 78;
      lbNivelHigieneTitulo.Top := lbNivelHigieneTitulo.Top - 78;
      qrVigenciaEndoso.Caption := FormatDateTime('"Fecha de inicio de vigencia del endoso: " dd/mm/yyyy', aFechaVigencia) +
                                  FormatDateTime('" (Período AFIP a declarar" mm/yyyy)', IncMonth(aFechaVigencia, -1));
      shNivelHigiene.Top := shNivelHigiene.Top - 78;
      shNivelHigieneTitulo.Top := shNivelHigieneTitulo.Top - 78;
    end;


  //Ocultar domicilio Postal / Cambiar "Legal" por constituido / Pidio Grossi/Callo
  edNivelHigiene.Top := edNivelHigiene.Top - 88;
  lbNivelHigieneTitulo.Top := lbNivelHigieneTitulo.Top - 88;
  shNivelHigiene.Top := shNivelHigiene.Top - 88;
  shNivelHigieneTitulo.Top := shNivelHigieneTitulo.Top - 88;

  ChildBand6.Height := 0;
  ChildBand7.Height := 0;
  ChildBand8.Height := 0;

  //Firma
  //Por un error del report, la firma no se puede ubicar en una banda, porque sino
  //la imprime en otra hoja, "con lo cual" hay que calcular el Top que tiene que tener
  Base := qrCh20.Top + qrCh20.Height;
  qrLabel27.Top  := Base + 2;
  qrLabel28.Top  := Base + 2;
  qrLabel31.Top  := Base + 19;
  qrLabel32.Top  := Base + 19;
  Linea2.Top     := Base + 19 + 47;
  Linea1.Top     := Base + 19 + 47 + 18;
  qrl1.Top       := Base + 19 + 53;
  qrl2.Top       := Base + 19 + 53;
  qrl3.Top       := Base + 19 + 53;
  QRDBImage1.Top := Base + 23;
  QRNombreFirmante.Top   := Base + 82;
  QRCaracterFirmante.Top := Base + 98;

  if Not(ImprimirFirma) then
  begin
    QRNombreFirmante.DataField := '';
    QRCaracterFirmante.DataField := '';
    QRDBImage1.DataField := '';
  end;

  sSql := 'SELECT art.afiliacion.get_clausulapenal(NVL(co_fechaimpresion, sysdate)) AS clausula_penal ' +
          ' FROM aco_contrato ' +
          ' WHERE co_contrato =:contrato';

  iValorClausulaPenal := ValorSqlIntegerEx(sSql, [sdqQuery.FieldByName('contrato').AsInteger], 100000);

  qrTextoInf.Caption := Format('Cláusula penal por incumplimiento de denuncias del empleador: %.0m . El costo de los exámenes médicos periódicos (Res. SRT 43/97 y 54/98) se encuentra incluido en el valor de la alícuota.',
                              [iValorClausulaPenal + 0.0]);

end;

function TqrEndoso1.Get_DescuentoRecargoCompleto(Tarifa: RecTarifa): String;
var
  Cadena: String;
begin
  //
  Cadena := '';
  Cadena := Cadena + FormatDescuento('Rebaja por Volumen Masa Salarial',        Tarifa.RebajaVolumenVal,   '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja Higiene y Seguridad',              Tarifa.RebajaHSVal ,       '3.2', '%');
  Cadena := Cadena + FormatDescuento('Recargo por Siniestralidad % s/variable', Tarifa.RecargoSinVarVal,   '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja por Siniestralidad % s/variable',  Tarifa.RebajaSinVarVal,    '3.2', '%');
  Cadena := Cadena + FormatDescuento('Recargo por Siniestralidad % s/fijo',     Tarifa.RecargoSinSFijoVal, '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja por Siniestralidad % s/fijo',      Tarifa.RebajaSinSFijoVal,  '3.2', '%');
  Cadena := Cadena + FormatDescuento('Recargo por Siniestralidad monto fijo',   Tarifa.RCSMF,              '3.2', '$');
  Cadena := Cadena + FormatDescuento('Rebaja por Siniestralidad monto fijo',    Tarifa.RBSMF,              '3.2', '$');
  Cadena := Cadena + FormatDescuento('Recargo Especial % s/variable',           Tarifa.RecargoEspVal,      '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja Especial % s/variable',            Tarifa.RebajaEspVal,       '3.2', '%');
  Cadena := Cadena + FormatDescuento('Recargo Especial % s/fijo',               Tarifa.RecargoEspSFijoVal, '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja Especial % s/fijo',                Tarifa.RebajaEspSFijoVal,  '3.2', '%');

  if Cadena <> '' then
    Result := 'Las tarifas anteriormente expresadas incluyen: ' + StrLeft(Cadena, Length(Cadena) - 2) + '.';
end;

function TqrEndoso1.FormatDescuento(Descripcion: String; Valor: Double; Formato, TipoRecargoRebaja: String): String;
var
  Cadena: String;
begin
  if Valor <> 0 then
  begin
    Cadena := Descripcion + ': ';

    if TipoRecargoRebaja = '%' then
      Cadena := Cadena + Format('%' + Formato + 'f', [Valor]) + ' ' + TipoRecargoRebaja
    else if TipoRecargoRebaja = '$' then
      Cadena := Cadena + TipoRecargoRebaja + ' ' + Format('%' + Formato + 'f', [Valor]);

    Cadena := Cadena + ', ';
  end
  else
    Cadena := '';

  Result := Cadena;
end;

function TqrEndoso1.Get_FormatoPie1278(aNroCuit, aNroEndoso: String): String;
var
  sSql: String;
begin
  sSql :=
    'SELECT do_formatopie' +
     ' FROM cdo_cartasdocumento' +
    ' WHERE do_cuit = :cuit' +
      ' AND do_endoso = :endoso';

  Result := ValorSqlEx(sSql, [aNroCuit, aNroEndoso]);
end;

procedure TqrEndoso1.FormatoDesc(var aBanda: TQRChildBand; const aRecargo, aRebaja: Currency; const aTitulo: String;
                                 aQrTitulo, aQr0, aQr1, aQr2: TqrLabel; const aColumna: Integer);
var
  cValor: Currency;
  sTipoRecargo: String;
begin
  if aRecargo - aRebaja > 0 then
    sTipoRecargo := 'Recargo '
  else if aRecargo - aRebaja < 0 then
    sTipoRecargo := 'Rebaja '
  else
  begin
    try
      aBanda.Height := 0;
    except
      aQr1.Caption := ' ';
      aQr2.Caption := ' ';
    end;
  end;

  aQrTitulo.Caption := sTipoRecargo + aTitulo;

  aQr0.Caption := '%' + Format('%3.2f', [aRecargo + aRebaja]);

  if aColumna = 1 then
  begin
    cValor := Tarifa.SubTotalPesos * (aRecargo - aRebaja) / 100;
    aQr1.Caption := '$' + Format('%3.2f', [cValor]);
    aQr2.Caption := '';
  end
  else
  begin
    cValor := Tarifa.SubTotalPorc * (aRecargo - aRebaja) / 100;
    aQr1.Caption := '';
    aQr2.Caption := '%' + Format('%3.3f', [cValor]);
  end;
end;

procedure TqrEndoso1.OcultarCuadroTarifario;
begin
  qrCh1.Height  := 0;
  qrCh2.Height  := 0;
  qrCh3.Height  := 0;
  qrCh4.Height  := 0;
  qrCh5.Height  := 0;
  qrCh6.Height  := 0;
  qrCh7.Height  := 0;
  qrCh8.Height  := 0;
  qrCh8.Height  := 0;
  qrCh9.Height  := 0;
  qrCh10.Height := 0;
  qrCh11.Height := 0;
  qrCh12.Height := 0;
  qrCh13.Height := 0;
  Raya1.Height  := 0;
  Raya2.Height  := 63;
  Raya3.Height  := 63;
end;

procedure TqrEndoso1.PrepararImpresion(const aCartaId: TTableId; const aTransactionMode: TTransactionMode;
                                       const aImprimir: Boolean; const aCantidadCopias: Integer = -1;
                                       const aPdfFileName: String = ''; const aMostrarEspera: Boolean = True);
var
  SqlResults: TStringList;
  sSql: String;
begin
  FActividades.Usar := False;
  FIdCarta := aCartaId;
  FMotivoEndoso := '';

  qriLogoNom.Picture.Bitmap.LoadFromResourceName(hInstance, RES_EMP_LOGO_BN);


  sSql :=
    'SELECT ca_idendoso, ca_idendosotemp' +
     ' FROM cca_carta' +
    ' WHERE ca_id = ' + SqlValue(aCartaId);

  SqlResults := ValoresColSQL(sSql);
  try
    if SqlResults[0] <> '' then
      IdEndoso := StrToIntDef(SqlResults[0], 0);
    FEndosoTemporal := StrToIntDef(SqlResults[1], 0);
  finally
    SqlResults.Free;
  end;
  DoImpresionCarta(aCartaId, aTransactionMode);

  if aCantidadCopias <> - 1 then
    Preparar(aCantidadCopias, aImprimir, aPdfFileName, aMostrarEspera)
  else
    Preparar(3, aImprimir, aPdfFileName, aMostrarEspera)
end;

procedure TqrEndoso1.DoImpresionCarta(const aIdCarta: TTableId; const TransactionMode: TTransactionMode);
begin
  if aIdCarta < 1 then
    Exit;

  with TSql.Create('cca_carta') do
  try
    PrimaryKey.Add('ca_id',                     aIdCarta);
    Fields.AddExpression('ca_usuimpresion',     'NVL(ca_usuimpresion, ' + SqlValue(frmPrincipal.DBLogin.UserID) + ')');
    Fields.AddExpression('ca_fechaimpresion',   'NVL(ca_fechaimpresion, SYSDATE)');
    Fields.AddExpression('ca_usureimpresion',   'DECODE(ca_usuimpresion, NULL, NULL, ' + SqlValue(frmPrincipal.DBLogin.UserID) + ')');
    Fields.AddExpression('ca_fechareimpresion', 'DECODE(ca_usuimpresion, NULL, NULL, SYSDATE)');
    SqlType := stUpdate;

    EjecutarSqlST(Sql, TransactionMode);
  finally
    Free;
  end;
end;

procedure TqrEndoso1.TitleBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  qriLogoNom.Enabled := ImprimeMembrete;
end;

procedure TqrEndoso1.qrcb13BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  with sdqQuery do
    if (FieldByName('cod_actividad2').AsString <> '') and (FieldByName('cod_actividad3').AsString <> '') then
    begin
      qrcb13.Height := 53;
      qrshActividadLinea1.Height := 53;
      qrshActividadLinea2.Height := 53;
    end
    else if (FieldByName('cod_actividad2').AsString <> '')  then
    begin
      qrcb13.Height := 37;
      qrshActividadLinea1.Height := 37;
      qrshActividadLinea2.Height := 37;
    end
    else
    begin
      qrcb13.Height := 21;
      qrshActividadLinea1.Height := 21;
      qrshActividadLinea2.Height := 21;
    end;
end;

procedure TqrEndoso1.lbDomicilioLegalTituloPrint(Sender: TObject; var Value: String);
begin
  inherited;

  if (FMotivoEndoso = '03.01') or (FMotivoEndoso = '03.02') or (FMotivoEndoso = '09.09') then
    Value := 'Domicilio Constituido';
end;

procedure TqrEndoso1.QRDBText7Print(Sender: TObject; var Value: String);
begin
  if FActividades.Usar then
    Value := FActividades.Ciiu1;
end;

procedure TqrEndoso1.QRDBText5Print(Sender: TObject; var Value: String);
begin
  if FActividades.Usar then
    Value := FActividades.Ciiu2;
end;

procedure TqrEndoso1.QRDBText9Print(Sender: TObject; var Value: String);
begin
  if FActividades.Usar then
    Value := FActividades.Ciiu3;
end;

procedure TqrEndoso1.QRDBText8Print(Sender: TObject; var Value: String);
begin
  if FActividades.Usar then
    Value := FActividades.Descripcion1;
end;

procedure TqrEndoso1.QRDBText6Print(Sender: TObject; var Value: String);
begin
  if FActividades.Usar then
    Value := FActividades.Descripcion2;
end;

procedure TqrEndoso1.QRDBText14Print(Sender: TObject; var Value: String);
begin
  if FActividades.Usar then
    Value := FActividades.Descripcion3;
end;

constructor TqrEndoso1.Create(AOwner: TComponent);
begin
  inherited;
  FImprimeFirma :=  True;
end;

end.
