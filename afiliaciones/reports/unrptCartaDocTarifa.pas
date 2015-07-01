unit unrptCartaDocTarifa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unRptCartaDocHeader, QRCtrls, QuickRpt,
  ArtQReports, ExtCtrls, Db, SDEngine, unArt, unCustomDataModule, unAfiliaciones, RxGIF, QrAngLbl;

type
  TrptCartaDocTarifa = class(TrptCartaDocHeader)
    QRBand1: TQRBand;
    QrFecha: TQRLabel;
    qrNroContrato: TQRLabel;
    qrVigencia: TQRLabel;
    qrMotivoEndoso: TQRLabel;
    qrNroEndoso: TQRLabel;
    qrCIIU: TQRLabel;
    qrNivel: TQRLabel;
    QRShape5: TQRShape;
    qrVigEndoso: TQRLabel;
    sdqDatos: TSDQuery;
    qrCh1: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    Raya1: TQRShape;
    Raya2: TQRShape;
    Raya3: TQRShape;
    qrCh2: TQRChildBand;
    QRLabel13: TQRLabel;
    qrSumaFijaTarifa: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    qrCh3: TQRChildBand;
    QRLabel14: TQRLabel;
    qrPorcMasaTarifa: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    qrCh4: TQRChildBand;
    QRLabel15: TQRLabel;
    qrDescVolumen_0: TQRLabel;
    qrDescVolumen_2: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    qrCh5: TQRChildBand;
    QRLabel16: TQRLabel;
    qrDescHYS_0: TQRLabel;
    qrDescHYS_2: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    qrCh6: TQRChildBand;
    QRLabel19: TQRLabel;
    QRSubTotal1: TQRLabel;
    QRSubTotal2: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    qrCh7: TQRChildBand;
    qrTit0: TQRLabel;
    qrDesc0_0: TQRLabel;
    qrDesc0_1: TQRLabel;
    qrDesc0_2: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    qrCh8: TQRChildBand;
    qrTit1: TQRLabel;
    qrDesc1_0: TQRLabel;
    qrDesc1_1: TQRLabel;
    qrDesc1_2: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    qrCh9: TQRChildBand;
    qrTit2: TQRLabel;
    qrDesc2_0: TQRLabel;
    qrDesc2_1: TQRLabel;
    qrDesc2_2: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    qrCh10: TQRChildBand;
    qrTit3: TQRLabel;
    qrDesc3_0: TQRLabel;
    qrDesc3_1: TQRLabel;
    qrDesc3_2: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    qrCh11: TQRChildBand;
    qrTit4: TQRLabel;
    qrDesc4_0: TQRLabel;
    qrDesc4_1: TQRLabel;
    qrDesc4_2: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    qrCh12: TQRChildBand;
    QRLabel17: TQRLabel;
    qrDesc5_0: TQRLabel;
    qrDesc5_1: TQRLabel;
    qrDesc5_2: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    qrCh13: TQRChildBand;
    QRLabel18: TQRLabel;
    qrDesc6_1: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    qrCh14: TQRChildBand;
    QRLabel20: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    qrCh16: TQRChildBand;
    QRLabel22: TQRLabel;
    qrPORCMASA: TArtQRLabel;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    qrCh17: TQRChildBand;
    qrTextoInf: TQRLabel;
    qrLeyenda060: TQRLabel;
    qrRecargosDescuentos: TQRLabel;
    qrCh18: TQRChildBand;
    qrFormatoPie: TQRLabel;
    qrCh15: TQRChildBand;
    QRLabel21: TQRLabel;
    qrALICUOTA: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRChildBand1: TQRChildBand;
    qrFecha1: TQRLabel;
    qrContratoAfi: TQRLabel;
    qrRazonSocial: TQRLabel;
    QRChCIIU: TQRChildBand;
    qrLabelCIIU: TQRLabel;
    qrChCliente2: TQRChildBand;
    qrCliente2: TQRLabel;
    QRCliente1: TQRLabel;
  protected
    function CargarValores: Boolean;
    function FormatDescuento(aDescripcion: String; aValor: Double; aFormato, aTipoRecargoRebaja: String): String;
    function Get_DescuentoRecargoCompleto(aTarifa: RecTarifa): String;

    procedure ArrangeControls_Argentino; override;
    procedure FormatoDesc(aBanda: TQRChildBand; aRecargo, aRebaja: Currency; aTitulo: String; aQrTitulo, aQr0, aQr1,
                          aQr2: TqrLabel; aColumna: Integer);
    procedure LoadValues; override;
    procedure OcultarCuadroTarifario;
//    procedure ArrangeControls_Rowing; override;
  public
    function Preparar(aId: TTableId; aTransactionMode: TTransactionMode): Boolean;
  end;

const
  TEXTO_INCUMPLIMIENTO: String =
    'De acuerdo con la Res. 463/09, 529/09, antes del <VIGENCIAHASTA>, fecha en la que opera la renovación de su ' +
    'contrato de afiliación, Usted debe enviar a su ART el Formulario de Relevamiento de Riesgos Laborales. El ' +
    'incumplimiento de esta obligación le impedirá traspasarse de ART y generará un recargo mensual a su tarifa hasta ' +
    'tanto se subsane la situación. El recargo será de un 50% del monto de las alícuotas previstas*; es decir que en ' +
    'caso de incumplimiento su tarifa será de $<SUMAFIJA> fijos por trabajador y <PORCENTAJEVARIABLE>% ' +
    'variables/remuneración sujeta a aportes con vigencia a partir del <VIGENCIADESDE> (Período AFIP a ' +
    'declarar <PERIODOAFIP>) (incluye $0,60 en concepto de F.F.E.P. Dec. 1278/00).';

  TEXTO_CLIENTE_1: String =
    'Estimado cliente' + #13#10 + #13#10 +
    'Me dirijo a usted para informarle sobre la adecuación de la tarifa en el contrato de afiliación.'+ #13#10 +
    'A partir del <VIGENCIATARIFA> (Período AFIP a declarar <PERIODOAFIP>) la tarifa mensual es ' +
    'la indicada en el siguiente cuadro:';

  TEXTO_CLIENTE_2: String =
    'Por último, a los fines de mantener actualizado su legajo, con la documentación e información reglamentaria exigida ' +
    'por la Superintendencia de Riesgos del Trabajo, y por la normativa vigente le solicito a Ud. que envíe fotocopia ' +
    'del poder, el DNI del firmante y el formulario de Declaración Jurada de Personas Expuestas Políticamente (PEP) ' +
    'el cual puede descargarlo del sitio web www.provinciart.com.ar. Usted puede enviar la documentación sin costo ' +
    'alguno a través de nuestra casilla postal del Correo Argentino -apartado especial Nº4, Suc. Nº1 Avenida de Mayo ' +
    'CP 1084- en un sobre de tamaño máximo 15x23 cm.' +
    #13#10 + #13#10 +
    'Ante cualquier duda o consulta sobre este tema, puede comunicarse con nuestro Centro de Atención al Cliente '+
    '(0800-333-1278, de lunes a viernes de 10 a 18). También puede acercarse a cualquiera de nuestras oficinas comerciales.' +
    #13#10 + #13#10 +
    'Agradeciendo su colaboración, saludo a Ud. muy cordialmente.';

  TEXTO_CLIENTE_1_SIN_MOD_TARIFA: String =
    'Estimado cliente' +
     #13#10 + #13#10 +
    'Me dirijo a usted para informarle sobre el cambio de actividad registrado en el contrato de afiliación.' +
     #13#10 + #13#10 +
    'A partir del <VIGENCIATARIFA>  la actividad registrada es la siguiente:' +
     #13#10 + #13#10 +
    'CIIU:' +
    #13#10 + #13#10;

  TEXTO_INF: String =
    'Cláusula penal por incumplimiento de denuncias del empleador $100.000 (cien mil pesos).';

  TEXTO_SANGRIA: String = '          ';

var
  rptCartaDocTarifa: TrptCartaDocTarifa;
  Tarifa: RecTarifa;

implementation

uses
  unDmPrincipal, AnsiSql, strFuncs, CustomDlgs;

{$R *.DFM}

{ TrptCartaDocTarifa }

function TrptCartaDocTarifa.Preparar(aId: TTableId; aTransactionMode: TTransactionMode): Boolean;
begin
  IdCarta := aId;
  TransactionMode := aTransactionMode;

  {$IFDEF EMISION}
    Modulo := taEmision;
  {$ELSE}
    Modulo := taAfiliaciones;
  {$ENDIF}

  Result := CargarValores;
end;

function TrptCartaDocTarifa.CargarValores: Boolean;
var
  aFechaIncumplimientoDesde: TDateTime;
  //bFormatoModVigTarifa: Boolean;
  ePorcentajeVariableFinal: Extended;
  ePorcentajeVariableIncumplimiento: Extended;
  eSumaFijaFinal: Extended;
  eSumaFijaIncumplimiento: Extended;
  iIdEndoso: Integer;
  iIdEndosoTemp: Integer;
  sCIIU: String;
  sMotivoEndoso: String;
  sSql: String;
begin
  Result := True;

  ////////////////////////////////////////
  //  PARAMETROS DE LA CARTA DOCUMENTO  //
  ////////////////////////////////////////
  sSql :=
    'SELECT ca_nrocartadoc, ca_idendoso, ca_idendosotemp, ca_idformulario, ca_idempdeudora, ca_idtextocarta,' +
          ' ca_textofinal, ht_destinatario destinatario, ca_idtrabajador, ca_idart,' +
          ' NVL(ca_correoreimpresion, ca_correo) correo, ca_tiposalida,' +
          ' NVL(ca_idfirmareimpresion, ca_idfirma) idfirma, ca_iddelegacion, ca_idareatexto, ca_iddestinatariocarta,' +
          ' ca_idcomisionmedica, at_codigoremitente' +
     ' FROM cca_carta, comunes.cht_historicotextocarta, cta_textoarea, cat_areatexto' +
    ' WHERE ca_idhistoricotextocarta = ht_id' +
      ' AND ht_idtextocarta = ta_idtextocarta' +
      ' AND ta_idareatexto = at_id' +
      ' AND ca_id = :id';

  sdqDatos.Close;
  sdqDatos.Sql.Clear;
  OpenqueryEx(sdqDatos, [IdCarta], sSql, True);
  try
    CodigoRemitente := sdqDatos.FieldByName('at_codigoremitente').AsString;

    { Los datos del Formato de la Carta }
    Correo := StrToCorreo(sdqDatos.FieldByName('correo').AsString);

    { Los datos del Header }
    qrlNumero.Caption := sdqDatos.FieldByName('ca_nrocartadoc').AsString;
    DestinatarioTipo  := StrToTipoDestinatario(sdqDatos.FieldByName('destinatario').AsString);

    SetDestinatario(sdqDatos.FieldByName('ca_idendoso').AsInteger,
                    sdqDatos.FieldByName('ca_idformulario').AsInteger,
                    sdqDatos.FieldByName('ca_idempdeudora').AsInteger,
                    sdqDatos.FieldByName('ca_idtrabajador').AsInteger,
                    sdqDatos.FieldByName('ca_idart').AsInteger,
                    sdqDatos.FieldByName('ca_iddestinatariocarta').AsInteger,
                    sdqDatos.FieldByName('ca_idcomisionmedica').AsInteger);

    TipoSalida := StrToTipoSalida(sdqDatos.FieldByName('ca_tiposalida').AsString);
    SetRemitenteActual;
    ReplicarTodo;

    { Datos del Firmante }
    if ImprimirFirma then
      IdFirma := sdqDatos.FieldByName('idfirma').AsInteger
    else
      idFirma := ART_EMPTY_ID;

    //Obtengo el ID del endoso para usarlo despues
    iIdEndoso     := sdqDatos.FieldByName('ca_idendoso').AsInteger;
    iIdEndosoTemp := sdqDatos.FieldByName('ca_idendosotemp').AsInteger;
  except
    on E: Exception do
      raise Exception.Create('Error al obtener los parametros de la carta documento.' + #13#10 + E.Message);
  end;

  /////////////////////////////////
  //  DATOS PROPIOS DEL REPORTE  //
  /////////////////////////////////
  {
  Esta parte del codigo estaba en Visual Basic...esto se guardaba en la CDO en do_formato y do_formatopie

  FormatoAumento = (MotivoEndoso = "02.6")               'aumento de recargo por siniestralidad
  FormatoModVigTarifa = (MotivoEndoso = "02.8" Or MotivoEndoso = "02.9")  'modific. vigencia de la tarifa
  FormatoModTarifaIncidencia = (MotivoEndoso = "02.12")  'Modificación de datos de la tarifa  (Aumento x T.Incidencia)

  Call MakeSQL(Fields, Values, "do_UsuReImpresion    ", Texto_FormatoSQL(UserId))
  Call MakeSQL(Fields, Values, "do_FechaReImpresion  ", Fecha_FormatoSQL(Fec_Act))

  If FormatoAumento Then
    FEncabezado = "TA03"
    FPie = "TA04"
  ElseIf FormatoModVigTarifa Then
    FEncabezado = "TA01"
    FPie = "TA02"
  ElseIf FormatoModTarifaIncidencia Then
    FEncabezado = "TA05"
    FPie = "TA06"
  Else  'el resto de los motivos de endoso salen sin el texto, sólo el cuadro tarifario
    FEncabezado = ""
    FPie = ""
  End If
  FormatoModVigTarifa = (MotivoEndoso = "02.8" Or MotivoEndoso = "02.9")  'modific. vigencia de la tarifa

  }
    //Cargo el cuadro tarifario
    //Obtengo todos los valores de la tarifa
    if (iIdEndosoTemp = ART_EMPTY_ID) then
    begin
      sSql :=
        'SELECT en_contrato contrato, en_fechaalta fechaalta, hc_nivel nivel, hc_vigenciadesde vigenciadesde,' +
              ' hc_vigenciahasta vigenciahasta, en_motivo motivo, tb_descripcion, en_endoso, ca.ac_codigo,' +
              ' ca2.ac_codigo ac_codigo2, ca3.ac_codigo ac_codigo3, ht_vigenciatarifa vigenciaendoso, ht_porcmasa,' +
              ' ca.ac_descripcion ac_descripcion, ca2.ac_descripcion ac_descripcion2,' +
              ' ca3.ac_descripcion ac_descripcion3, ht_incumplido_porcmasa, ht_sumafija, ht_incumplido_sumafija,' +
              ' ht_incumplido_desde' +
         ' FROM aen_endoso, ahc_historicocontrato, aht_historicotarifario, ctb_tablas, cac_actividad ca,' +
              ' cac_actividad ca2, cac_actividad ca3' +
        ' WHERE tb_clave = ''MOTEN''' +
          ' AND tb_codigo = en_motivo' +
          ' AND hc_idactividad = ca.ac_id(+)' +
          ' AND hc_idactividad2 = ca2.ac_id(+)' +
          ' AND hc_idactividad3 = ca3.ac_id(+)' +
          ' AND en_idhistoricocontrato = hc_id' +
          ' AND en_idhistoricotarifa = ht_id' +
          ' AND en_id = :id';

      GetTarifaFromEndoso(iIdEndoso, Tarifa, False);

      sdqDatos.Close;
      sdqDatos.Sql.Clear;
      OpenqueryEx(sdqDatos, [iIdEndoso], sSql, True);
      qrNroEndoso.Caption := 'Nro. Endoso: ' + sdqDatos.FieldByName('en_endoso').AsString;

      aFechaIncumplimientoDesde         := sdqDatos.FieldByName('ht_incumplido_desde').AsDateTime;
      ePorcentajeVariableFinal          := sdqDatos.FieldByName('ht_porcmasa').AsFloat;
      eSumaFijaFinal                    := sdqDatos.FieldByName('ht_sumafija').AsFloat + 0.60;
      ePorcentajeVariableIncumplimiento := sdqDatos.FieldByName('ht_porcmasa').AsFloat + sdqDatos.FieldByName('ht_incumplido_porcmasa').AsFloat;
      eSumaFijaIncumplimiento           := sdqDatos.FieldByName('ht_sumafija').AsFloat + sdqDatos.FieldByName('ht_incumplido_sumafija').AsFloat;
    end
    else
    begin
      ////////////////////////////////////////////////////////////////////
      //  Cargo los labels que son diferentes en caso que sea temporal  //
      ////////////////////////////////////////////////////////////////////
      sSql :=
        'SELECT et_contrato contrato, et_fechaalta fechaalta, tb_descripcion, et_vigenciatarifa vigenciaendoso,' +
              ' ca.ac_codigo, ca2.ac_codigo ac_codigo2, ca3.ac_codigo ac_codigo3, co_nivel nivel, et_motivo motivo,' +
              ' co_vigenciadesde vigenciadesde, co_vigenciahasta vigenciahasta, et_porcmasa, et_incumplido_porcmasa,' +
              ' ca.ac_descripcion ac_descripcion, ca2.ac_descripcion ac_descripcion2,' +
              ' ca3.ac_descripcion ac_descripcion3, et_sumafija, et_incumplido_sumafija, et_incumplido_desde' +
         ' FROM tmp.tet_endosotarifa, ctb_tablas, aco_contrato, cac_actividad ca, cac_actividad ca2, cac_actividad ca3' +
        ' WHERE et_contrato = co_contrato' +
          ' AND et_idactividad = ca.ac_id(+)' +
          ' AND et_idactividad2 = ca2.ac_id(+)' +
          ' AND et_idactividad3 = ca3.ac_id(+)' +
          ' AND et_motivo = tb_codigo' +
          ' AND tb_clave = ''MOTEN''' +
          ' AND et_id = :id';

      GetTarifaFromEndoso(iIdEndosoTemp, Tarifa, True);

      sdqDatos.Close;
      sdqDatos.Sql.Clear;
      OpenqueryEx(sdqDatos, [iIdEndosoTemp], sSql, True);
      qrNroEndoso.Caption    := '';

      aFechaIncumplimientoDesde         := sdqDatos.FieldByName('et_incumplido_desde').AsDateTime;
      ePorcentajeVariableFinal          := sdqDatos.FieldByName('et_porcmasa').AsFloat;
      eSumaFijaFinal                    := sdqDatos.FieldByName('et_sumafija').AsFloat + 0.60;
      ePorcentajeVariableIncumplimiento := sdqDatos.FieldByName('et_porcmasa').AsFloat + sdqDatos.FieldByName('et_incumplido_porcmasa').AsFloat;
      eSumaFijaIncumplimiento           := sdqDatos.FieldByName('et_sumafija').AsFloat + sdqDatos.FieldByName('et_incumplido_sumafija').AsFloat;
    end;

    sMotivoEndoso := sdqDatos.FieldByName('motivo').AsString;
   //** Ahora se usa siempre el mismo texto. Pidio vila 19/02/2013
   // bFormatoModVigTarifa := ((sMotivoEndoso = '02.8') or (sMotivoEndoso = '02.9')); //modific. vigencia de la tarifa

    //Encabezado
    sCIIU := 'CIIU: ' + sdqDatos.FieldByName('ac_codigo').AsString;
    if Trim(sdqDatos.FieldByName('ac_codigo2').AsString) <> '' then
      sCIIU := Format('%s / %s', [sCIIU, sdqDatos.FieldByName('ac_codigo2').AsString]);
    if Trim(sdqDatos.FieldByName('ac_codigo3').AsString) <> '' then
      sCIIU := Format('%s / %s', [sCIIU, sdqDatos.FieldByName('ac_codigo3').AsString]);

    QrFecha.Caption       := 'Buenos Aires, ' + FormatDateTime('dd ''de'' mmmm ''de'' yyyy', sdqDatos.FieldByName('fechaalta').AsDateTime);
    qrNroContrato.Caption := 'Ref. Nro de Contrato: ' + sdqDatos.FieldByName('contrato').AsString;
    qrVigencia.Caption    := 'Vigencia del contrato: ' + sdqDatos.FieldByName('vigenciadesde').AsString + ' al ' + sdqDatos.FieldByName('vigenciahasta').AsString;

    if sMotivoEndoso = '01.11' then
      qrMotivoEndoso.Caption := 'Incorporación de Actividad'
    else if sMotivoEndoso = '01.12' then
      qrMotivoEndoso.Caption := 'Cambio de Actividad'
    else if sMotivoEndoso = '02.1' then
      qrMotivoEndoso.Caption := 'Incorporación de Actividad - Modificación Tarifa'
    else if sMotivoEndoso = '02.5' then
      qrMotivoEndoso.Caption := 'Cambio de Actividad - Modificación Tarifa'
    else
      qrMotivoEndoso.Caption := sdqDatos.FieldByName('tb_descripcion').AsString;

    qrCIIU.Caption         := sCIIU;
    qrNivel.Caption        := 'Nivel de Cumplimiento de Hig. Y Seg.: ' + sdqDatos.FieldByName('nivel').AsString;
    qrVigEndoso.Caption    := 'Fecha de inicio de vigencia del endoso: ' + sdqDatos.FieldByName('vigenciaendoso').AsString;

    //Cambio pedido por Evila
    //***Antes
    {
    qrTextoInf.Caption     := 'Cláusula penal por omisión  de denuncia de siniestro dentro de las 24 hs. hábiles de haber tomado cononimiento 2 MOPRES por cada omisión. ';
    if bFormatoModVigTarifa then
        qrTextoInf.Caption    := qrTextoInf.Caption + #13#10 + 'El costo de los exámenes médicos periódicos (Res. SRT 43/97 y 54/98) se encuentra incluido en el valor de la alícuota.';
    }
    //**Ahora
    qrTextoInf.Caption     := 'Cláusula penal por incumplimiento de denuncias del empleador: $100.000. El costo de los exámenes médicos periódicos (Res. SRT 43/97 y 54/98) se encuentra incluido en el valor de la alícuota.';
    //***


    //sigue con los particulares de este formulario
    if (sdqDatos.FieldByName('vigenciaendoso').AsDateTime<StrToDate('01/03/2003')) then
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
    end
    else
    begin
      //Oculta el cuadro con los detalles de la tarifa
      OcultarCuadroTarifario;

      qrRecargosDescuentos.Caption := Get_DescuentoRecargoCompleto(Tarifa);
      qrFormatoPie.Caption := '';
    end;

    qrALICUOTA.Caption := '$' + Format('%3.2f', [Tarifa.FinalPesos]);
    qrPORCMASA.Caption := '%' + Format('%3.3f', [Tarifa.FinalPorc]);

    if (sMotivoEndoso = '03.01') or (sMotivoEndoso = '03.02') or (sMotivoEndoso = '09.09') then
    begin
      qrALICUOTA.Caption := '$' + Format('%3.2f', [eSumaFijaFinal]);
      qrPORCMASA.Caption := '%' + Format('%3.3f', [ePorcentajeVariableFinal]);

      qrCh18.Frame.DrawBottom := True;
      qrCh18.Frame.DrawLeft := True;
      qrCh18.Frame.DrawRight := True;
      qrCh18.Frame.DrawTop := True;
      qrCh18.Height := 88;

      with sdqDatos do
      begin
        qrFormatoPie.Caption := TEXTO_INCUMPLIMIENTO;
        if FieldByName('vigenciahasta').AsDateTime > DBDate then
          qrFormatoPie.Caption := StringReplace(qrFormatoPie.Caption, '<VIGENCIAHASTA>', FormatDateTime('dd/mm/', FieldByName('vigenciahasta').AsDateTime) + FormatDateTime('yyyy', DBDate), [])
        else
          qrFormatoPie.Caption := StringReplace(qrFormatoPie.Caption, '<VIGENCIAHASTA>', FieldByName('vigenciahasta').AsString, []);
        qrFormatoPie.Caption := StringReplace(qrFormatoPie.Caption, '<SUMAFIJA>', Format('%3.2f', [eSumaFijaIncumplimiento + 0.60]), []);
        qrFormatoPie.Caption := StringReplace(qrFormatoPie.Caption, '<PORCENTAJEVARIABLE>', Format('%3.3f', [ePorcentajeVariableIncumplimiento]), []);
        qrFormatoPie.Caption := StringReplace(qrFormatoPie.Caption, '<VIGENCIADESDE>', FormatDateTime('dd/mm/yyyy', aFechaIncumplimientoDesde), []);
        qrFormatoPie.Caption := StringReplace(qrFormatoPie.Caption, '<PERIODOAFIP>', FormatDateTime('mm/yyyy', IncMonth(aFechaIncumplimientoDesde, -1)), []);

        qrFormatoPie.Height := 80;
      end;
    end;


  //TK 31798 CALLO
  QrFecha1.Caption := '';
  qrChildBand1.Height := 0;
  qrChCliente2.Height := 0;
  qrChCIIU.Height := 0;

  //Si no entra por ninguno de los IFs deberia quedar como se hacia antes.
 if TipoSalida = tsCartaComercial then
  begin
    if (sMotivoEndoso = '02') or (sMotivoEndoso = '02.2') or (sMotivoEndoso = '02.3') then
    begin
      qrRazonSocial.Caption := 'Señores ' + qrlDestNombre.Caption;
      qrContratoAfi.Caption := 'Contrato de Afiliación ' + sdqDatos.FieldByName('contrato').AsString;
      qrFecha1.Caption := FormatDateTime('dd ''de'' mmmm ''de'' yyyy', sdqDatos.FieldByName('fechaalta').AsDateTime);
      qrChildBand1.Height := 130;
      qrCliente1.Caption := TEXTO_CLIENTE_1;
      qrCliente1.Caption := StringReplace(qrCliente1.Caption, '<VIGENCIATARIFA>', sdqDatos.FieldByName('vigenciaendoso').AsString, []);
      qrCliente1.Caption := StringReplace(qrCliente1.Caption, '<PERIODOAFIP>', FormatDateTime('mm/yyyy', IncMonth(sdqDatos.FieldByName('vigenciaendoso').AsDateTime, -1)), []);
      qrCliente2.Caption := TEXTO_CLIENTE_2;
      qrChCliente2.Height := 220;
      qrBand1.Height := 0;
      qrShape5.Height := 0;
      qrVigEndoso.Caption := '';
      qrTextoInf.Caption := TEXTO_INF;
    end;

    if (sMotivoEndoso = '02.1') or (sMotivoEndoso = '02.5') then
    begin
      qrRazonSocial.Caption := 'Señores ' + qrlDestNombre.Caption;
      qrContratoAfi.Caption := 'Contrato de Afiliación ' + sdqDatos.FieldByName('contrato').AsString;
      qrFecha1.Caption := FormatDateTime('dd ''de'' mmmm ''de'' yyyy', sdqDatos.FieldByName('fechaalta').AsDateTime);
      qrChildBand1.Height := 130;
      qrCliente1.Caption := TEXTO_CLIENTE_1;
      qrCliente1.Caption := StringReplace(qrCliente1.Caption, '<VIGENCIATARIFA>', sdqDatos.FieldByName('vigenciaendoso').AsString, []);
      qrCliente1.Caption := StringReplace(qrCliente1.Caption, '<PERIODOAFIP>', FormatDateTime('mm/yyyy', IncMonth(sdqDatos.FieldByName('vigenciaendoso').AsDateTime, -1)), []);
      qrCliente2.Caption := TEXTO_CLIENTE_2;
      qrChCliente2.Height := 220;
      qrBand1.Height := 0;
      qrShape5.Height := 0;
      qrVigEndoso.Caption := '';
      qrTextoInf.Caption := TEXTO_INF;
      qrChCIIU.Height := 21;

      qrLabelCIIU.Caption := 'CIIU: ';
      if not sdqDatos.FieldByName('ac_codigo').IsNull then
        qrLabelCIIU.Caption :=  qrLabelCIIU.Caption + sdqDatos.FieldByName('ac_codigo').AsString;
      if not sdqDatos.FieldByName('ac_codigo2').IsNull then
        qrLabelCIIU.Caption :=   qrLabelCIIU.Caption + ' / ' + sdqDatos.FieldByName('ac_codigo2').AsString;
      if not sdqDatos.FieldByName('ac_codigo3').IsNull then
        qrLabelCIIU.Caption :=   qrLabelCIIU.Caption +' / ' + sdqDatos.FieldByName('ac_codigo3').AsString;
    end;

    if (sMotivoEndoso = '01.11') or (sMotivoEndoso = '01.12') then
    begin
      qrRazonSocial.Caption := 'Señores ' + qrlDestNombre.Caption;
      qrContratoAfi.Caption := 'Contrato de Afiliación ' + sdqDatos.FieldByName('contrato').AsString;
      qrFecha1.Caption := FormatDateTime('dd ''de'' mmmm ''de'' yyyy', sdqDatos.FieldByName('fechaalta').AsDateTime);
      qrChildBand1.Height := 210;

      if not sdqDatos.FieldByName('ac_codigo').IsNull then
        TEXTO_CLIENTE_1_SIN_MOD_TARIFA :=  TEXTO_CLIENTE_1_SIN_MOD_TARIFA + TEXTO_SANGRIA + sdqDatos.FieldByName('ac_codigo').AsString +
                                          ' - ' + sdqDatos.FieldByName('ac_descripcion').AsString;
      if not sdqDatos.FieldByName('ac_codigo2').IsNull then
        TEXTO_CLIENTE_1_SIN_MOD_TARIFA :=   TEXTO_CLIENTE_1_SIN_MOD_TARIFA + #13#10 + TEXTO_SANGRIA + sdqDatos.FieldByName('ac_codigo2').AsString +
                                          ' - ' + sdqDatos.FieldByName('ac_descripcion2').AsString;
      if not sdqDatos.FieldByName('ac_codigo3').IsNull then
        TEXTO_CLIENTE_1_SIN_MOD_TARIFA :=   TEXTO_CLIENTE_1_SIN_MOD_TARIFA + #13#10 + TEXTO_SANGRIA + sdqDatos.FieldByName('ac_codigo3').AsString +
                                          ' - ' + sdqDatos.FieldByName('ac_descripcion3').AsString;

      qrCliente1.Caption := TEXTO_CLIENTE_1_SIN_MOD_TARIFA;
      qrCliente1.Caption := StringReplace(qrCliente1.Caption, '<VIGENCIATARIFA>', sdqDatos.FieldByName('vigenciaendoso').AsString, []);

      qrBand1.Height := 0;
      qrShape5.Height := 0;
      qrCh14.Height := 0;
      qrCh15.Height := 0;
      qrCh16.Height := 0;
      qrCh17.Height := 0;
      qrCliente2.Caption := TEXTO_CLIENTE_2;
      qrChCliente2.Height := 220;
    end;
  end;
  //FIN TK 31798 CALLO

end;

procedure TrptCartaDocTarifa.LoadValues;
begin
 //No hace nada...está para evitar que llame al LoadValues del ancestro
end;

procedure TrptCartaDocTarifa.FormatoDesc(aBanda: TQRChildBand; aRecargo, aRebaja: Currency; aTitulo: String; aQrTitulo,
                                         aQr0, aQr1, aQr2: TqrLabel; aColumna: Integer);
var
  cValor: Currency;
  sTipoRecargo: String;
begin
  if (aRecargo - aRebaja) > 0 then
    sTipoRecargo := 'Recargo '
  else if (aRecargo - aRebaja) < 0 then
    sTipoRecargo := 'Rebaja '
  else
    aBanda.Height := 0;

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

procedure TrptCartaDocTarifa.OcultarCuadroTarifario;
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

function TrptCartaDocTarifa.Get_DescuentoRecargoCompleto(aTarifa: RecTarifa): String;
var
  Cadena: String;
begin
  //
  Cadena := '';
  Cadena := Cadena + FormatDescuento('Rebaja por Volumen Masa Salarial',        aTarifa.RebajaVolumenVal,   '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja Higiene y Seguridad',              aTarifa.RebajaHSVal ,       '3.2', '%');
  Cadena := Cadena + FormatDescuento('Recargo por Siniestralidad % s/variable', aTarifa.RecargoSinVarVal,   '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja por Siniestralidad % s/variable',  aTarifa.RebajaSinVarVal,    '3.2', '%');
  Cadena := Cadena + FormatDescuento('Recargo por Siniestralidad % s/fijo',     aTarifa.RecargoSinSFijoVal, '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja por Siniestralidad % s/fijo',      aTarifa.RebajaSinSFijoVal,  '3.2', '%');
  Cadena := Cadena + FormatDescuento('Recargo por Siniestralidad monto fijo',   aTarifa.RCSMF,              '3.2', '$');
  Cadena := Cadena + FormatDescuento('Rebaja por Siniestralidad monto fijo',    aTarifa.RBSMF,              '3.2', '$');
  Cadena := Cadena + FormatDescuento('Recargo Especial % s/variable',           aTarifa.RecargoEspVal,      '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja Especial % s/variable',            aTarifa.RebajaEspVal,       '3.2', '%');
  Cadena := Cadena + FormatDescuento('Recargo Especial % s/fijo',               aTarifa.RecargoEspSFijoVal, '3.2', '%');
  Cadena := Cadena + FormatDescuento('Rebaja Especial % s/fijo',                aTarifa.RebajaEspSFijoVal,  '3.2', '%');

  if Cadena <> '' then
    Result := 'Las tarifas anteriormente expresadas incluyen: ' + StrLeft(Cadena, Length(Cadena) - 2) + '.';
end;

function TrptCartaDocTarifa.FormatDescuento(aDescripcion: String; aValor: Double; aFormato, aTipoRecargoRebaja: String): String;
var
  sCadena: String;
begin
  if aValor <> 0 then
  begin
    sCadena := aDescripcion + ': ';

    if aTipoRecargoRebaja = '%' then
      sCadena := sCadena + Format('%' + aFormato + 'f', [aValor]) + ' ' + aTipoRecargoRebaja
    else if aTipoRecargoRebaja = '$' then
      sCadena := sCadena + aTipoRecargoRebaja + ' ' + Format('%' + aFormato + 'f', [aValor]);

    sCadena := sCadena + ', ';
  end
  else
    sCadena := '';

  Result := sCadena;
end;

procedure TrptCartaDocTarifa.ArrangeControls_Argentino;
begin
  inherited;

  Page.RightMargin := 15;
end;

end.
