unit UnRptCartaDocPuestaDisp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unRptCartaDocHeader, QuickRpt, QRCtrls, QrAngLbl, ArtQReports,
  ExtCtrls, unArt, unComunes, Printers, unDmPrincipal, unCustomDataModule,
  DB, SDEngine, grimgctrl, customdlgs, unSesion, strfuncs;

type
  TRptCartaDocPuestaDisp = class(TrptCartaDocHeader)
    QRBand1: TQRBand;
    qrmDetalle: TQRMemo;
    sdqSubdetalle: TSDQuery;
    sdqConsulta: TSDQuery;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlNumOrden: TQRLabel;
    qrlEmpresa: TQRLabel;
    qrlTrabajador: TQRLabel;
    qrlDNI: TQRLabel;
    qrlFacci: TQRLabel;
    qrbDetalle: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape3: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel1: TQRLabel;
    qrlTotal: TQRLabel;
    qrmLey: TQRMemo;
    qrmCobro: TQRMemo;
    qrmPagosMens: TQRMemo;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    qrmDocumentacion: TQRMemo;
    qrlLugaryFecha: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoImprimirCartaPuestaDisp(AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                 aTransactionMode: TTransactionMode = tmNone; CantidadCopias: Integer = -1;
                                 Imprimir_Firma: Boolean = True; bEsSinGobernacion: Boolean = False);

var
  RptCartaDocPuestaDisp: TRptCartaDocPuestaDisp; iCantReg: integer;

const {sqlSubdOP = 'SELECT cp_denpago || DECODE(pr_fechahasta, NULL, NULL, '' POR EL PERIODO '' || TO_CHAR(pr_fechadesde,' +
                  '       ''dd/mm/yyyy'') || '' AL '' || TO_CHAR(pr_fechahasta, ''dd/mm/yyyy'')) concepto, SUM(pr_imporpago) importe' +
                  '  FROM SIN.scp_casospuestadisp, SIN.spd_puestadisposicion, art.spr_pagoexpesin, art.scp_conpago' +
                  ' WHERE cp_idexpediente = pr_idexpediente' +
                  '   AND pr_conpago = cp_conpago' +
                  '   AND cp_idexpediente = pd_idexpediente' +
                  '   AND cp_numliqui = pr_numpago' +
                  '   AND cp_tablaliqui = ''SPR''' +
                  '   AND cp_fechabaja IS NULL' +
                  '   AND cp_idcarta = :idcarta' +
                  '   AND pd_fechabaja IS NULL' +
                  '   AND NVL(pr_estado, '' '') IN (''E'', ''P'')' +
                  ' GROUP BY cp_denpago || DECODE(pr_fechahasta, NULL, NULL, '' POR EL PERIODO '' || TO_CHAR(pr_fechadesde,' +
                  '       ''dd/mm/yyyy'') || '' AL '' || TO_CHAR(pr_fechahasta, ''dd/mm/yyyy''))'; }

      sqlSubd = 'SELECT *' +
                '  FROM (SELECT CP_IDCARTA, LE_FECHADES, LE_FECHAHAS, CP_DENPAGO || DECODE(art.dinerarias.is_ajusteilt(le_siniestro, le_orden, le_recaida, le_numliqui), ''S'', '' (AJUSTE)'', '''') ' +
                '               || DECODE(LE_FECHAHAS, NULL, NULL, '' POR EL PERIODO '' || TO_CHAR(LE_FECHADES,' +
                '                ''DD/MM/YYYY'') || '' AL '' || TO_CHAR(LE_FECHAHAS, ''DD/MM/YYYY'')) CONCEPTO, SUM(DECODE(le_tipoliqui, ''I'', le_subtotal, le_imporperi)) IMPORTE, 1 orden ' +
                '          FROM SIN.SCP_CASOSPUESTADISP, SIN.SPD_PUESTADISPOSICION, ART.SLE_LIQUIEMPSIN, ART.SCP_CONPAGO' +
                '         WHERE CP_IDEXPEDIENTE = LE_IDEXPEDIENTE' +
                '           AND LE_CONPAGO = CP_CONPAGO' +
                '           AND CP_IDEXPEDIENTE = PD_IDEXPEDIENTE' +
                '           AND CP_NUMLIQUI = LE_NUMLIQUI' +
                '           AND CP_TABLALIQUI = ''SLE''' +
                '           AND CP_FECHABAJA IS NULL' +
                '           AND PD_FECHABAJA IS NULL' +
                '           AND NVL(DECODE(le_tipoliqui, ''I'', le_subtotal, le_imporperi), 0) > 0 ' +
                '           AND NVL(LE_ESTADO, '' '') IN (''E'', ''P'')' +
                '         GROUP BY CP_IDCARTA, LE_FECHADES, LE_FECHAHAS, CP_DENPAGO || DECODE(art.dinerarias.is_ajusteilt(le_siniestro, le_orden, le_recaida, le_numliqui), ''S'', '' (AJUSTE)'', '''') ' +
                '               || DECODE(LE_FECHAHAS, NULL, NULL, '' POR EL PERIODO '' || TO_CHAR(LE_FECHADES,' +
                '                ''DD/MM/YYYY'') || '' AL '' || TO_CHAR(LE_FECHAHAS, ''DD/MM/YYYY'')) ' +

                       ' UNION ALL  /*subdetalle para compensacion por daños - plan rediseño de liquidaciones*/' +
                       ' SELECT cp_idcarta, le_fechades, le_fechahas, ''COMPENSACION POR DAÑOS'' concepto, SUM(le_montocompdanios) importe, 2 orden ' +
                        '  FROM SIN.scp_casospuestadisp, SIN.spd_puestadisposicion, art.sle_liquiempsin' +
                        ' WHERE cp_idexpediente = le_idexpediente' +
                        '   AND cp_idexpediente = pd_idexpediente' +
                        '   AND cp_numliqui = le_numliqui' +
                        '   AND cp_tablaliqui = ''SLE''' +
                        '   AND cp_fechabaja IS NULL' +
                        '   AND pd_fechabaja IS NULL' +
                        '   AND NVL(le_estado, '' '') IN(''E'', ''P'')' +
                        '   AND NVL(le_montocompdanios, 0) > 0' +
                        ' GROUP BY cp_idcarta, le_fechades, le_fechahas, ''COMPENSACION POR DAÑOS''' +
                       ' UNION ALL  /*subdetalle para pago adicional - plan rediseño de liquidaciones*/' +
                       ' SELECT cp_idcarta, le_fechades, le_fechahas, ''PAGO ADICIONAL'' concepto, SUM(le_montopagoadic) importe, 3 orden ' +
                        '  FROM SIN.scp_casospuestadisp, SIN.spd_puestadisposicion, art.sle_liquiempsin' +
                        ' WHERE cp_idexpediente = le_idexpediente' +
                        '   AND cp_idexpediente = pd_idexpediente' +
                        '   AND cp_numliqui = le_numliqui' +
                        '   AND cp_tablaliqui = ''SLE''' +
                        '   AND cp_fechabaja IS NULL' +
                        '   AND pd_fechabaja IS NULL' +
                        '   AND NVL(le_estado, '' '') IN(''E'', ''P'')' +
                        '   AND NVL(le_montopagoadic, 0) > 0' +
                        ' GROUP BY cp_idcarta, le_fechades, le_fechahas, ''PAGO ADICIONAL''' +
                       ' UNION ALL  /*subdetalle para pago adicional - plan rediseño de liquidaciones*/' +
                       ' SELECT cp_idcarta, le_fechades, le_fechahas, cp_descripcioncompleta concepto, SUM(le_montootrospagos) importe, 4 orden ' +
                        '  FROM SIN.scp_casospuestadisp, SIN.spd_puestadisposicion, art.sle_liquiempsin, art.scp_conpago' +
                        ' WHERE cp_idexpediente = le_idexpediente' +
                        '   AND cp_idexpediente = pd_idexpediente' +
                        '   AND cp_numliqui = le_numliqui' +
                        '   AND le_conceptootrospagos = cp_conpago' +
                        '   AND cp_tablaliqui = ''SLE''' +
                        '   AND cp_fechabaja IS NULL' +
                        '   AND pd_fechabaja IS NULL' +
                        '   AND NVL(le_estado, '' '') IN(''E'', ''P'')' +
                        '   AND NVL(le_montootrospagos, 0) > 0' +
                        ' GROUP BY cp_idcarta, le_fechades, le_fechahas, cp_descripcioncompleta' +

                '        UNION ALL' +
                '        SELECT CP_IDCARTA, PR_FECHADESDE, PR_FECHAHASTA, CP_DENPAGO || DECODE(PR_FECHAHASTA, NULL, NULL, '' POR EL PERIODO '' ||' +
                '               TO_CHAR(PR_FECHADESDE, ''DD/MM/YYYY'') || '' AL '' || TO_CHAR(PR_FECHAHASTA, ''DD/MM/YYYY'')) CONCEPTO,' +
                '               SUM(PR_IMPORPAGO) IMPORTE, 5 orden ' +
                '          FROM SIN.SCP_CASOSPUESTADISP, SIN.SPD_PUESTADISPOSICION, ART.SPR_PAGOEXPESIN, ART.SCP_CONPAGO' +
                '         WHERE CP_IDEXPEDIENTE = PR_IDEXPEDIENTE' +
                '           AND PR_CONPAGO = CP_CONPAGO' +
                '           AND CP_IDEXPEDIENTE = PD_IDEXPEDIENTE' +
                '           AND CP_NUMLIQUI = PR_NUMPAGO' +
                '           AND CP_TABLALIQUI = ''SPR''' +
                '           AND CP_FECHABAJA IS NULL' +
                '           AND PD_FECHABAJA IS NULL' +
                '           AND NVL(PR_ESTADO, '' '') IN (''E'', ''P'')' +
                '         GROUP BY CP_IDCARTA, PR_FECHADESDE, PR_FECHAHASTA, CP_DENPAGO || DECODE(PR_FECHAHASTA, NULL, NULL, '' POR EL PERIODO '' ||' +
                '                  TO_CHAR(PR_FECHADESDE, ''DD/MM/YYYY'') || '' AL '' || TO_CHAR(PR_FECHAHASTA, ''DD/MM/YYYY'')) ' +
                '        ORDER BY LE_FECHADES, LE_FECHAHAS)' +
                ' WHERE CP_IDCARTA = :IDCARTA ' +
                ' ORDER BY orden ';

      {sqlTotalOP =  'SELECT SUM(pr_imporpago) importe' +
                    '  FROM SIN.scp_casospuestadisp, SIN.spd_puestadisposicion, art.spr_pagoexpesin' +
                    ' WHERE cp_idexpediente = pr_idexpediente' +
                    '   AND cp_idexpediente = pd_idexpediente' +
                    '   AND cp_numliqui = pr_numpago' +
                    '   AND cp_tablaliqui = ''SPR''' +
                    '   AND cp_fechabaja IS NULL' +
                    '   AND cp_idcarta = :idcarta' +
                    '   AND pd_fechabaja IS NULL' +
                    '   AND NVL(pr_estado, '' '') IN (''E'', ''P'')'; }

      sqlTotal =  'SELECT SUM(importe)' +
                  '  FROM (' +
                  'SELECT SUM(le_imporperi) importe' +
                  '  FROM SIN.scp_casospuestadisp, SIN.spd_puestadisposicion, art.sle_liquiempsin' +
                  ' WHERE cp_idexpediente = le_idexpediente' +
                  '   AND cp_idexpediente = pd_idexpediente' +
                  '   AND cp_numliqui = le_numliqui' +
                  '   AND cp_tablaliqui = ''SLE''' +
                  '   AND cp_fechabaja IS NULL' +
                  '   AND cp_idcarta = :idcarta' +
                  '   AND pd_fechabaja IS NULL' +
                  '   AND NVL(le_estado, '' '') IN (''E'', ''P'') ' +
                  'UNION ALL ' +
                  'SELECT SUM(pr_imporpago) importe ' +
                  '  FROM SIN.scp_casospuestadisp, SIN.spd_puestadisposicion, art.spr_pagoexpesin' +
                  ' WHERE cp_idexpediente = pr_idexpediente' +
                  '   AND cp_idexpediente = pd_idexpediente' +
                  '   AND cp_numliqui = pr_numpago' +
                  '   AND cp_tablaliqui = ''SPR''' +
                  '   AND cp_fechabaja IS NULL' +
                  '   AND cp_idcarta = :idcarta' +
                  '   AND pd_fechabaja IS NULL' +
                  '   AND NVL(pr_estado, '' '') IN (''E'', ''P'') )';

      sqlLugarPagoOP = 'SELECT CASE WHEN (pr_metodopago = ''DA'') or (pr_metodopago = ''DC'') THEN' +
                        '       ''DICHA PRESTACION DINERARIA SE ENCONTRARA A SU DISPOSICION A PARTIR DEL '' || TO_CHAR (pd_fvencimiento,' +
                        '       ''dd/mm/yyyy'') ||' +
                        '       '' EN LA CUENTA DE CAJA DE AHORRO POR USTED INFORMADA. PARA ELLO DEBERA REMITIRNOS EN FORMA SEMESTRAL (JUNIO Y DICIEMBRE)''' +
                        '       ||' +
                        '       '' EL CERTIFICADO DE SUPERVIVENCIA (EMITIDO POR AUTORIDAD POLICIAL). DE NO CONTAR CON DICHA INFORMACION ESTA ASEGURADORA''' +
                        '       || '' REALIZARA EL MENCIONADO PAGO MENSUAL MEDIANTE GIRO BANCARIO O EN NUESTRAS OFICINAS.'' WHEN (pr_metodopago' +
                        '       = ''TR'') THEN ''A FIN DE PERCIBIR DICHA PRESTACION DINERARIA, DEBERA PRESENTARSE A PARTIR DEL '' || TO_CHAR' +
                        '       (pd_fvencimiento, ''dd/mm/yyyy'') || '' CON SU D.N.I. EN '' || pr_enviofondos || ''%s.'' ELSE' +
                        '       ''A FIN DE PERCIBIR DICHA PRESTACION DINERARIA, DEBERA PRESENTARSE A PARTIR DEL '' || TO_CHAR (pd_fvencimiento,' +
                        '       ''dd/mm/yyyy'') || '' CON SU D.N.I. EN DELEGACION '' || el_nombre || '' - '' || UPPER (art.utiles.armar_domicilio' +
                        '       (el_calle, el_numero, el_piso, el_departamento, el_localidad)) || '' - DE LUNES A VIERNES EN EL HORARIO DE '' ||' +
                        '       NVL (el_horariodesde, ''10:00'') || '' HS. A '' || DECODE(el_id, 840, ''16:30'', NVL (el_horariohasta, ''17:00'')) || ''HS.'' END presentarse' +
                        '  FROM SIN.scp_casospuestadisp a, SIN.spd_puestadisposicion, art.spr_pagoexpesin, art.scp_conpago,' +
                        '       art.del_delegacion, cca_carta' +
                        ' WHERE pr_conpago = cp_conpago' +
                        '   AND cp_idexpediente = pr_idexpediente' +
                        '   AND cp_numliqui = pr_numpago' +
                        '   AND cp_tablaliqui = ''SPR''' +
                        '   AND cp_fechabaja IS NULL' +
                        '   AND cp_idexpediente = pd_idexpediente' +
                        '   AND pd_fechabaja IS NULL' +
                        '   AND cp_id = (SELECT MAX (b.cp_id)' +
                        '                  FROM SIN.scp_casospuestadisp b' +
                        '                 WHERE b.cp_idexpediente = a.cp_idexpediente' +
                        '                   AND b.cp_tablaliqui = a.cp_tablaliqui' +
                        '                   AND b.cp_fechabaja IS NULL ' +
                        '                   AND b.cp_idcarta = ca_id)' +
                        '   AND pr_delegacion = el_id(+)' +
                        '   AND el_fechabaja(+) IS NULL' +
                        '   AND NVL (pr_estado, '' '') IN (''E'', ''P'')' +
                        '   AND ca_id = cp_idcarta ' + 
                        '   AND cp_idcarta = :idcarta';

      sqlLugarPago = 'SELECT CASE WHEN (le_metodopago = ''DA'') or (le_metodopago = ''DC'') THEN' +
                      '       ''DICHA PRESTACION DINERARIA SE ENCONTRARA A SU DISPOSICION A PARTIR DEL '' || TO_CHAR (pd_fvencimiento,' +
                      '       ''dd/mm/yyyy'') ||' +
                      '       '' EN LA CUENTA DE CAJA DE AHORRO POR USTED INFORMADA. PARA ELLO DEBERA REMITIRNOS EN FORMA SEMESTRAL (JUNIO Y DICIEMBRE)''' +
                      '       ||' +
                      '       '' EL CERTIFICADO DE SUPERVIVENCIA (EMITIDO POR AUTORIDAD POLICIAL). DE NO CONTAR CON DICHA INFORMACION ESTA ASEGURADORA''' +
                      '       || '' REALIZARA EL MENCIONADO PAGO MENSUAL MEDIANTE GIRO BANCARIO O EN NUESTRAS OFICINAS.'' WHEN' +
                      '       (le_tipoenviofondos = ''C'')' +
                      '       OR (le_tipoenviofondos = ''D'') THEN' +
                      '       ''A FIN DE PERCIBIR DICHA PRESTACION DINERARIA, DEBERA PRESENTARSE A PARTIR DEL '' || TO_CHAR (pd_fvencimiento,' +
                      '       ''dd/mm/yyyy'') || '' CON SU D.N.I. EN DELEGACION '' || el_nombre || '' - '' || UPPER (art.utiles.armar_domicilio' +
                      '       (el_calle, el_numero, el_piso, el_departamento, el_localidad ) ) || '' - DE LUNES A VIERNES EN EL HORARIO DE ''' +
                      '       || NVL (el_horariodesde, ''10:00'') || '' HS. A '' || DECODE(el_id, 840, ''16:30'', NVL (el_horariohasta, ''17:00'')) || ''HS.'' ELSE' +
                      '       ''A FIN DE PERCIBIR DICHA PRESTACION DINERARIA, DEBERA PRESENTARSE A PARTIR DEL '' || TO_CHAR (pd_fvencimiento,' +
                      '       ''dd/mm/yyyy'') || '' CON SU D.N.I. EN '' || le_enviofondos || ''%s.'' END presentarse' +
                      '  FROM SIN.scp_casospuestadisp a, SIN.spd_puestadisposicion, art.sle_liquiempsin, art.scp_conpago,' +
                      '       art.del_delegacion, cca_carta' +
                      ' WHERE le_conpago = cp_conpago' +
                      '   AND cp_idexpediente = le_idexpediente' +
                      '   AND cp_numliqui = le_numliqui' +
                      '   AND cp_tablaliqui = ''SLE''' +
                      '   AND cp_fechabaja IS NULL' +
                      '   AND cp_idexpediente = pd_idexpediente' +
                      '   AND pd_fechabaja IS NULL' +
                      '   AND cp_id = (SELECT MAX (b.cp_id)' +
                      '                  FROM SIN.scp_casospuestadisp b' +
                      '                 WHERE b.cp_idexpediente = a.cp_idexpediente' +
                      '                   AND b.cp_tablaliqui = a.cp_tablaliqui' +
                      '                   AND b.cp_fechabaja IS NULL ' +
                      '                   AND b.cp_idcarta = ca_id)' +
                      '   AND DECODE (le_tipoenviofondos, ''C'', 840, le_idenviofondos) = el_id(+)' +
                      '   AND el_fechabaja(+) IS NULL' +
                      '   AND NVL (le_estado, '' '') IN (''E'', ''P'')' +
                      '   AND ca_id = cp_idcarta ' +
                      '   AND cp_idcarta = :idcarta ';

      sPagosMens = 'INFORMAMOS QUE LAS SUCESIVAS LIQUIDACIONES DE PAGO MENSUAL, ESTARAN A SU DISPOSICION A PARTIR DEL 4º ' +
                  ' DIA HABIL DEL MES INMEDIATO SIGUIENTE AL PERIODO DEVENGADO, EN EL DOMICILIO CITADO ANTERIORMENTE.';

      sTextoCobroProvincia = ' O CUALQUIER OTRO BANCO DE LA PROVINCIA DE BUENOS AIRES CERCANO A SU DOMICILIO. ' +
                             'DICHO PAGO SE ENCUENTRA A DISPOSICIÓN POR LOS PRÓXIMOS 30 DÍAS';

implementation

uses AnsiSql;



{$R *.dfm}


procedure DoImprimirCartaPuestaDisp(AIdCarta: TTableId; AAction: TSalidaReport = srPrint;
                                 aTransactionMode: TTransactionMode = tmNone; CantidadCopias: Integer = -1;
                                 Imprimir_Firma: Boolean = True;
                                 bEsSinGobernacion: Boolean = False);
var
  NroImpresora: Integer;
  sTablaLiq: String;
begin

  NroImpresora := Printer.PrinterIndex;

  with TRptCartaDocPuestaDisp.Create(nil) do
  try

    EsPuestaDisposicion := True;
    Modulo            := taDinerarias;
    TransactionMode   := aTransactionMode;

    with GetQueryEx('SELECT DISTINCT cp_tablaliqui, ca_idexpediente ' +
                    '  FROM SIN.scp_casospuestadisp, cca_carta ' +
                    ' WHERE ca_id = cp_idcarta' +
                    '   AND ca_id = :idcarta', [AIdCarta]) do
    begin
      sTablaLiq := fieldbyname('cp_tablaliqui').AsString;
      //iIdExpediente := fieldbyname('ca_idexpediente').AsInteger;
    end;

    with GetQueryEx(sdqConsulta.SQL.Text, [Sesion.UserID, AIdCarta]) do
    begin

      sdqSubdetalle.SQL.Text := sqlSubd;
      qrlTotal.Caption := ValorSqlEx(sqlTotal, [AIdCarta]);

      if ValorSqlEx('select dinerarias.get_cartatipoconcepto(:idcarta, ''O'', ''S'') from dual', [AIdCarta]) = 'S' then
        qrmCobro.Lines.Text := ValorSqlEx(sqlLugarPagoOP, [AIdCarta])
      else
        qrmCobro.Lines.Text := ValorSqlEx(sqlLugarPago, [AIdCarta]);

      if Pos('BANCO DE LA PROVINCIA', UpperCase(qrmCobro.Lines.Text)) <> 0 then
        qrmCobro.Lines.Text := Format(qrmCobro.Lines.Text, [sTextoCobroProvincia])
      else
        qrmCobro.Lines.Text := Format(qrmCobro.Lines.Text, ['']);

      {if ((((FieldByName('cp_tipo').AsString = 'P') or (FieldByName('cp_tipo').AsString = 'M')) and (FieldByName('le_fechahas').AsString <> '')) or
         ((FieldByName('cp_tipo').AsString = 'I') and (FieldByName('ex_altamedica').AsString = '') and
          (ValorSqlEx('select dinerarias.is_ajusteilt(:sin, :ord, :rec, :liq) from dual', [FieldByName('ex_siniestro').AsString,
                     FieldByName('ex_orden').AsString, FieldByName('ex_recaida').AsString, FieldByName('le_numliqui').AsString]) = 'N')) and
          (FieldByName('cp_ultimopago').AsString = 'N')) then  }
      if (ValorSqlEx('select dinerarias.get_cartatipoconcepto(:idcarta, ''I'', ''N'') from dual', [AIdCarta]) = 'S') and
         (FieldByName('cp_ultimopago').AsString = 'N') then
        qrmPagosMens.Lines.Text := sPagosMens
      else
        qrmPagosMens.Lines.Clear;

      if (ValorSqlEx('select dinerarias.get_cartatipoconcepto(:idcarta, ''P'', ''N'') from dual', [AIdCarta]) = 'S') and
         (FieldByName('cp_anticipo').AsString = 'S') then
      begin
        qrmDocumentacion.Lines.Text := StringReplace(qrmDocumentacion.Lines.Text, ':FDESDE', FieldByName('recibodesde').AsString, []);
        qrmDocumentacion.Lines.Text := StringReplace(qrmDocumentacion.Lines.Text, ':FHASTA', FieldByName('recibohasta').AsString, []);
      end
      else
        qrmDocumentacion.Lines.Clear;

      if (ValorSqlEx('select dinerarias.get_cartatipoconcepto(:idcarta, ''I'', ''N'') from dual', [AIdCarta]) = 'S') or
         (FieldByName('faccidente').AsDateTime <= StrToDate(FECHA_LEY26773)) then
        qrmLey.Lines.Clear;

      //OpenQueryEx(sdqSubdetalle, [iSiniestro, iOrden, iRecaida, iNumLiq, iSiniestro, iOrden, iRecaida, iNumLiq, AIdCarta]);

      sdqSubdetalle.ParamByName('idcarta').AsInteger := AIdCarta;

      sdqSubdetalle.Open;

      iCantReg := sdqSubdetalle.RecordCount;

      qrmDetalle.Lines.Text := StringReplace(qrmDetalle.Lines.Text, ':fecha', FieldByName('faccidente').AsString, []);
      qrmDetalle.Lines.Text := StringReplace(qrmDetalle.Lines.Text, ':suma', qrlTotal.Caption, []);

      qrlTotal.Caption := '$ ' + Get_AjusteDecimales(qrlTotal.Caption);

      qrlLugaryFecha.Caption := fieldbyname('localidad').AsString + ', ' + fieldbyname('fec_impre').AsString;
      qrlNumOrden.Caption := fieldbyname('sini_comple').AsString;
      qrlEmpresa.Caption := fieldbyname('empresa').AsString;
      qrlTrabajador.Caption := fieldbyname('trabajador').AsString;
      qrlDNI.Caption := fieldbyname('docu').AsString;
      qrlFacci.Caption := fieldbyname('faccidente').AsString;

    end;

    CodigoRemitente := ValorSql( ' SELECT at_codigoremitente ' +        // Lu 12/05/11 (arreglo de EGuerrero) no salia el codigoremitente
                                   ' FROM comunes.cht_historicotextocarta, cca_carta, cat_areatexto ' +
                                  ' WHERE ca_idhistoricotextocarta = ht_id ' +
                                    ' AND ca_idareatexto = at_id ' +
                                    ' AND ca_id = ' + SqlValue(AIdCarta));

    RemitenteCorreo := (CodigoRemitente <>'');
    
    EsSinGobernacion      := bEsSinGobernacion;
    ImprimirFirma         := Imprimir_Firma;
    IdCarta               := AIdCarta;
    ImprimirDelegOrden    := True;
    qrbPageFooter.Height  := 50;

    //Muestro la carta documento
    PrinterSettings.PrinterIndex := NroImpresora;
    if CantidadCopias <> -1 then
      PrinterSettings.Copies := CantidadCopias
    else
      PrinterSettings.Copies := 3;

    if AAction = srPrint then
      Print
    else
      PreviewModal;
  finally
    Printers.Printer.Copies := 1;
    Free;
  end;
end;

procedure TRptCartaDocPuestaDisp.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  qrbPageFooter.Height := 433 + qrbDetalle.Height - (qrbDetalle.Height * iCantReg); // 478
  qrifirma.Top := qrifirma.Top + 303 + qrbDetalle.Height - (qrbDetalle.Height * iCantReg);
  qrlfirmante.Top := qrlfirmante.Top + 399 + qrbDetalle.Height - (qrbDetalle.Height * iCantReg);
  qrldocumento.Top := qrldocumento.Top + 399 + qrbDetalle.Height - (qrbDetalle.Height * iCantReg);
  qrlCaracter.Top := qrlCaracter.Top + 399 + qrbDetalle.Height - (qrbDetalle.Height * iCantReg);
  qrlordenpie.Top := qrlordenpie.Top + 318 + qrbDetalle.Height - (qrbDetalle.Height * iCantReg);
  qrldelegacionpie.Top := qrldelegacionpie.Top + 318 + qrbDetalle.Height - (qrbDetalle.Height * iCantReg);
  qrmInfoPie.Top := qrmInfoPie.Top + 318 + qrbDetalle.Height - (qrbDetalle.Height * iCantReg);

  ReportTitle := 'Carta documento número ' + ValorSqlEx('SELECT ca_nrocartadoc ' +
                                                         ' FROM cca_carta' +
                                                        ' WHERE ca_id = :idcarta', [IdCarta]);

end;

end.
