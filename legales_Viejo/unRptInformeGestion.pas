unit unRptInformeGestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, SDEngine, StdCtrls, FormPanel;

type
  TrptInformeGestion = class(TForm)
    rptEventos: TQuickRep;
    Q: TQRBand;
    qrbDetalle: TQRBand;
    qrdNroEvento: TQRDBText;
    qrdDecripcionEvento: TQRDBText;
    qrdObservaciones: TQRDBText;
    qrlCUIT: TQRLabel;
    qrlCUIL: TQRLabel;
    qrlNombreEmpresa: TQRLabel;
    qrlContrato: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlNombreTrabajador: TQRLabel;
    qrlJuzgado: TQRLabel;
    qrlMontoDemandado: TQRLabel;
    qrlReservaCapital: TQRLabel;
    qrlEstado: TQRLabel;
    qrlJurisdiccion: TQRLabel;
    qrlPorIncapacidadDemanda: TQRLabel;
    qrlReservaHonorarios: TQRLabel;
    qrlTotalReserva: TQRLabel;
    qrlTTPagos: TQRLabel;
    qrlTTEmbargo: TQRLabel;
    QRShape1: TQRShape;
    qrlNroJuicio: TQRLabel;
    qrlCaratula: TQRLabel;
    qrlExpediente: TQRLabel;
    qrlEstudioJuridico: TQRLabel;
    QRLabel3: TQRLabel;
    qrlFechaNotificacion: TQRLabel;
    qrlFechaFin: TQRLabel;
    qrlFechaAccidente: TQRLabel;
    qrlEdad: TQRLabel;
    qrlGravedad: TQRLabel;
    qrlTipoSiniestro: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    sdqEvento: TSDQuery;
    QRShape2: TQRShape;
    fpSeleccionArchivos: TFormPanel;
    bvSeparadorBotonesEventos: TBevel;
    btnAccAceptar: TButton;
    btnAccCancelar: TButton;
    cbEventosJuicios: TCheckBox;
    cbTareasJuicios: TCheckBox;
    cbPericiasJuicios: TCheckBox;
    cbPagosJuicios: TCheckBox;
    cbEmbargosJuicios: TCheckBox;
    cbSentenciaJuicios: TCheckBox;
    cbAdminstraciondeSiniestros: TCheckBox;
    cbAdministraciondeIncapacidades: TCheckBox;
    cbAdministraciondeliquidacionesSolapaILPILT: TCheckBox;
    cbResumen: TCheckBox;
    qrDetalleChecks: TQRLabel;
    ChildBand1: TQRChildBand;
    QRShape3: TQRShape;
    cbMediacion: TQRChildBand;
    qrlRSPL: TQRLabel;
    SummaryBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    procedure btnAccAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FIDJuicio : Integer;
    procedure Load(sSQL : String);
    function ArmarQuery:String;
    { Private declarations }
  public
    { Public declarations }
    procedure MostrarPantalla(idjuicio: Integer);
  end;

var
  rptInformeGestion: TrptInformeGestion;

implementation
uses
  unDmPrincipal, AnsiSql, unVisualizador, unVisorPDF, ArchFuncs, unExportPDF, CustomDlgs,
    printers, winspool;

{$R *.dfm}

procedure TrptInformeGestion.MostrarPantalla(idjuicio : Integer);
Begin
  FIDJuicio := idjuicio;
  fpSeleccionArchivos.ShowModal;
end;


procedure TrptInformeGestion.Load(sSQL : String);
var
  Path : String;
begin
  with GetQuery(
    'SELECT jt_demandante || '' C/'' || jt_demandado || CHR(10) || jt_caratula caratula, ex_cuit, ex_cuil, tj_nombre, '+
    '       ex_fechaaccidente, jt_numerocarpeta, em_nombre, '+
    '       jt_nroexpediente || ''/'' || jt_anioexpediente expediente, abo.bo_apellido || '' '' || abo.bo_nombreindividual abogado, '+
    '       TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, tj_fnacimiento) / 12)) edad, tsin.tb_descripcion tiposiniestro, '+
    '       grav.tb_descripcion gravedad, jt_fechaingreso, aboact.bo_apellido || '' '' || aboact.bo_nombreindividual abogadoactor, '+
    '       rc_descripcion reclamo, co_contrato, ex_siniestro || ''/'' || ex_orden || ''/'' || ex_recaida siniestro, '+
    '       jz_descripcion juzgado, ju_descripcion jurisdiccion, fu_descripcion fuero, sc_descripcion secretaria, '+
    '       LTRIM(TO_CHAR(jt_importedemandado, ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) jt_importedemandado, '+
    '       rt_porcentajeincapacidad, '+
    '       LTRIM(art.legales.get_montototalretenido(jt_id))   tembargo, '+
    '       LTRIM(TO_CHAR(jt_importereserva , ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) reservacapital, '+
    '       LTRIM(TO_CHAR(jt_importereservahonorarios , ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) reservahonorarios, '+
    '       LTRIM(TO_CHAR(jt_importereserva + jt_importereservahonorarios  , ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) totalreserva, '+
    '       LTRIM(TO_CHAR(art.legales.get_importepagosjucio(jt_id) , ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' ''))  totalpagos, '+
    '       ej_descripcion estado, jt_fechafinjuicio, '+
    '       '' GPBA: '' || DECODE(jt_gpba, 1, ''Si'', ''No'') || ''           GPBA MALA PRAXIS: '' '+
    '       || DECODE(jt_gpbamalapraxis, ''N'', ''No'', ''Si'') || ''             FEDERAL: '' || DECODE(jt_federal, 1, ''Si'', ''No'') '+
    '       || ''              JNS: '' || DECODE(jt_juicionosiniestro, 1, ''Si'', ''No'') || ''              A RECUPERAR: '' '+
    '       || DECODE(jt_arecuperar, ''N'', ''No'', ''Si'') DetalleChecks, '+

    '       LTRIM(TO_CHAR(((SELECT NVL(SUM(rp_res_art), 0) reserva '+
    '                  FROM actuarial.urp_reservaincapacidad '+
    '                 WHERE rp_siniestro = ex_siniestro '+
    '                   AND rp_orden = ex_orden '+
    '                   AND rp_periodo = (SELECT MAX(b.rp_periodo) '+
    '                                       FROM actuarial.urp_reservaincapacidad b)) '+
    '       +     ' +
    '       (SELECT NVL(SUM(rm_res_art), 0) '+
    '                  FROM actuarial.urm_reservamortal '+
    '                 WHERE rm_siniestro = ex_siniestro '+
    '                   AND rm_orden = ex_orden '+
    '                   AND rm_periodo = (SELECT MAX(b.rm_periodo) '+
    '                                       FROM actuarial.urm_reservamortal b))), ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' ''))  RSPL ' +
(*
    '       (SELECT LTRIM(TO_CHAR(nvl(SUM(rp_total),0) , ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) '+
    '       FROM actuarial.urp_reservaincapacidad WHERE rp_siniestro = ex_siniestro '+
    '       AND rp_orden = ex_orden AND rp_periodo = (SELECT MAX(b.rp_periodo) '+
    '       FROM actuarial.urp_reservaincapacidad b)) RSPL '+
*)



    '  FROM legales.ljt_juicioentramite, legales.lod_origendemanda, legales.lsj_siniestrosjuicioentramite, art.sex_expedientes, '+
    '       comunes.ctj_trabajador, art.ctb_tablas tsin, art.ctb_tablas grav, legales.lbo_abogado aboact, legales.lbo_abogado abo, '+
    '       legales.lrt_reclamojuicioentramite, legales.lrc_reclamo, afi.aem_empresa, afi.aco_contrato, legales.ljz_juzgado, '+
    '       legales.lju_jurisdiccion, legales.lfu_fuero, legales.lsc_secretaria, legales.lej_estadojuicio '+
    ' WHERE od_idjuicioentramite = jt_id '+
    '   AND sj_idorigendemanda(+) = od_id '+
    '   AND sj_fechabaja IS NULL '+
    '   AND od_fechabaja IS NULL '+
    '   AND rt_fechabaja IS NULL '+
    '   AND jt_idestado = ej_id '+
    '   AND sj_idsiniestro = ex_id(+) '+
    '   AND jt_idabogado = abo.bo_id '+
    '   AND jt_id = '+SqlValue(Fidjuicio)+
    '   AND jt_estadomediacion = ''J'' '+
    '   AND ex_cuil = tj_cuil(+) '+
    '   AND tsin.tb_clave(+) = ''STIPO'' '+
    '   AND tsin.tb_codigo(+) = ex_tipo '+
    '   AND grav.tb_clave(+) = ''SGRAV'' '+
    '   AND grav.tb_codigo(+) = ex_gravedad '+
    '   AND od_idabogado = aboact.bo_id(+) '+
    '   AND jt_id = rt_idjuicioentramite(+) '+
    '   AND rt_idreclamo = rc_id(+) '+
    '   AND ex_cuit = em_cuit(+) '+
    '   AND co_contrato(+) = art.get_vultcontrato(em_cuit) '+
    '   AND jt_idjuzgado = jz_id '+
    '   AND jt_idjurisdiccion = ju_id '+
    '   AND jt_idfuero = fu_id '+
    '   AND jt_idsecretaria = sc_id ') do
  try
    qrlCaratula.Caption              := FieldByName('caratula').AsString;
    qrlNroJuicio.Caption             := 'JD N°: '+FieldByName('jt_numerocarpeta').AsString;
    qrlExpediente.Caption            := 'Expdte: '+FieldByName('expediente').AsString;
    qrlEstudioJuridico.Caption       := 'EEJJ: '+FieldByName('abogado').AsString;
    qrlCUIT.Caption                  := 'CUIT: '+FieldByName('ex_cuit').AsString;
    qrlNombreEmpresa.Caption         := FieldByName('em_nombre').AsString;
    qrlContrato.Caption              := 'Contrato: '+FieldByName('co_contrato').AsString;
    qrlCUIL.Caption                  := 'CUIL: '+FieldByName('ex_cuil').AsString;
    qrlNombreTrabajador.Caption      := FieldByName('tj_nombre').AsString;
    qrlSiniestro.Caption             := 'Siniestro: '+FieldByName('siniestro').AsString;
    qrlJuzgado.Caption               := FieldByName('fuero').AsString + ' N°'+FieldByName('juzgado').AsString;
    qrlJurisdiccion.Caption          := 'Jurisdicción: '+FieldByName('jurisdiccion').AsString;
    qrlMontoDemandado.Caption        := 'Monto Demanda: '+FieldByName('jt_importedemandado').AsString;
    qrlPorIncapacidadDemanda.Caption := 'Incapacidad Demanda:'+FieldByName('rt_porcentajeincapacidad').AsString+'%';
    qrlTTEmbargo.Caption             := 'TT Embargo: $'+FieldByName('tembargo').AsString;
    qrlReservaCapital.Caption        := 'RC: '+FieldByName('reservacapital').AsString;
    qrlReservaHonorarios.Caption     := 'RH: '+FieldByName('reservahonorarios').AsString;
    qrlTotalReserva.Caption          := 'Total Reserva: '+FieldByName('totalreserva').AsString;
    qrlTTPagos.Caption               := 'TT Pagos: '+FieldByName('totalpagos').AsString;
    //qrlReservaSPL.Caption := FieldByName('ex_cuit').AsString;
    qrlEstado.Caption                := 'Estado: '+FieldByName('estado').AsString;
    qrlFechaNotificacion.Caption     := 'F.Notificación:'+FieldByName('jt_fechaingreso').AsString;
    qrlFechaFin.Caption              := 'F.Fin: '+FieldByName('jt_fechafinjuicio').AsString;
    qrlFechaAccidente.Caption        := 'F.Accidente: '+FieldByName('ex_fechaaccidente').AsString;
    qrlGravedad.Caption              := 'Gravedad: '+FieldByName('gravedad').AsString;
    qrlTipoSiniestro.Caption         := 'Tipo Siniestro: '+FieldByName('tiposiniestro').AsString;
    qrlEdad.Caption                  := 'Edad: '+FieldByName('edad').AsString;
    qrDetalleChecks.Caption          := FieldByName('DetalleChecks').AsString;
    qrlRSPL.Caption                  := 'RSPL: '+FieldByName('RSPL').AsString;

  finally
    free;
  end;
  sdqEvento.SQL.Text := sSQL;

  sdqEvento.Open;
 // sdqTareas.ParamByName('idjuicio').AsInteger := idjuicio;
 // sdqTareas.Open;

  rptEventos.Prepare;
  Path := TempPath+'INFGES'+IntToStr(Fidjuicio)+'.qrp';
  rptEventos.PrinterSettings.Duplex := True;
  rptEventos.QRPrinter.Save(Path);
  rptEventos.QRPrinter.Free;
  if not FileToPDFSvr(Path,TempPath) then
    raise Exception.Create('Error al generar el PDF');
  AbrirPDF(ChangeFileExt(Path, '.pdf'));
end;


procedure TrptInformeGestion.btnAccAceptarClick(Sender: TObject);
var
  sSQL : String;
begin
  sSQL := ArmarQuery;
  Load(sSQL);
  fpSeleccionArchivos.ModalResult := mrOk;
end;

function TrptInformeGestion.ArmarQuery:String;
var
  sSQL : String;
begin
  sSQL := '';
  Verificar(not(cbEventosJuicios.Checked or cbTareasJuicios.Checked or cbPericiasJuicios.Checked or
            cbPagosJuicios.Checked or cbEmbargosJuicios.Checked or cbSentenciaJuicios.Checked or
            cbAdministraciondeliquidacionesSolapaILPILT.Checked or cbAdministraciondeIncapacidades.Checked or
            cbAdminstraciondeSiniestros.Checked),fpSeleccionArchivos,'Debe seleccionar aunque sea un dato para que salga en el reporte.');

  if not cbResumen.Checked then
    qrdObservaciones.AutoStretch := True
  else
    qrdObservaciones.AutoStretch := False;

  sSQL := 'SELECT jt_fechanotificacionjuicio AS fecha, rc_descripcion AS descripcion, TO_CLOB('''') AS observacion '+
          '  FROM legales.ljt_juicioentramite, legales.lrt_reclamojuicioentramite, legales.lrc_reclamo '+
          ' WHERE rt_idjuicioentramite = jt_id '+
          '   AND rt_idreclamo = rc_id '+
          '   AND jt_id = '+SqlValue(FIDJuicio)+
          ' UNION ALL '+
          'SELECT jt_fechanotificacionjuicio AS fecha, ''ABOGADO ACTOR'' AS descripcion, '+
          '       TO_CLOB(bo_apellido || '' '' || bo_nombreindividual) AS observacion '+
          '  FROM legales.ljt_juicioentramite, legales.lod_origendemanda, legales.lbo_abogado '+
          ' WHERE od_idjuicioentramite = jt_id '+
          '   AND od_idabogado = bo_id '+
          '   AND jt_id = '+SqlValue(FIDJuicio)+
          ' UNION ALL '+
          'SELECT me_fechainicio fecha, ''MEDIACIÓN'' AS descripcion, '+
          '       TO_CLOB(''Nro Mediacion: '' || me_numerofolio || '' - Importes Monto Reclamado: '' '+
          '       || LTRIM(TO_CHAR(me_montoreclamado, ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) '+
          '       || '' - F.Primera Audiencia: '' || (SELECT TO_CHAR(max(em_fecha), ''DD/MM/YYYY'') '+
          '                                           FROM legales.lem_eventomediacion '+
          '                                          WHERE em_idmediacion = me_id '+
          '                                            AND em_idtipoevento = 601 '+
          '                                             AND em_fechabaja is null ) || '' - Pagos Total pagado: '' '+
          '       || LTRIM(TO_CHAR(NVL(art.legales.get_importepagosmediacion(me_id), 0), ''L999G999G990D00'', '+
          '                      ''NLS_NUMERIC_CHARACTERS = '''',.'''' ''))) observacion '+
          '  FROM legales.lme_mediacion '+
          ' WHERE me_idexpediente IN(SELECT sj_idsiniestro '+
          '                            FROM legales.lod_origendemanda, legales.lsj_siniestrosjuicioentramite '+
          '                           WHERE od_idjuicioentramite = '+SqlValue(FIDJuicio)+
          '                             AND sj_idorigendemanda = od_id) ';

  if cbEventosJuicios.Checked then
  begin
    if sSQL <> '' then
      sSQL := sSQL + ' UNION ALL';

    sSQL := sSQL +
            ' SELECT et_fechaevento fecha, te_descripcion descripcion, '+
            '        ''    ''||REPLACE(REPLACE(et_observaciones, CHR(10), '' ''), CHR(13), '' '') || CHR(13) || '+
            '        NVL2(et_respuesta, ''RESPUESTA: '' || et_respuesta, '''') AS observacion '+
            '   FROM legales.let_eventojuicioentramite, legales.lte_tipoevento '+
            '  WHERE et_idjuicioentramite = '+SqlValue(FIDJuicio)+
            '    AND et_idtipoevento = te_id  '+
            '    AND et_fechabaja IS NULL ';

  end;
  if cbTareasJuicios.Checked then
  begin
    if sSQL <> '' then
      sSQL := sSQL + ' UNION ALL';

    sSQL := sSQL +
            ' SELECT TRUNC(ja_fechainicio) fecha, ''TAREA'' descripcion, '+
            '        TO_CLOB(''    ''||tt_descripcion || '' - '' || th_descripcion || '' - '' || ja_descripcionevento) observacion '+
            '   FROM legales.lja_juicioentramiteagenda, legales.ltt_tipotarea, legales.lth_tipohecho '+
            '  WHERE ja_idnrojuicio = '+SqlValue(FIDJuicio) +
            '    AND ja_idtipotarea = tt_id '+
            '    AND ja_idhecho = th_id '+
            '    AND ja_fechabaja IS NULL ';

  end;
  if cbPericiasJuicios.Checked then
  begin
    if sSQL <> '' then
      sSQL := sSQL + ' UNION ALL';

    sSQL := sSQL +
            ' SELECT pj_fechanotificacion fecha, ''PERICIA '' || tp_descripcion descripcion, '+
            '        CASE '+
            '        WHEN pj_idtipopericia = 3 THEN TO_CLOB(''    Perito: '' '+
            '                                               || (SELECT pe_nombreindividual || '' '' || pe_apellido '+
            '                                                     FROM legales.lpe_perito '+
            '                                                    WHERE pe_id = pj_idperito) || '' - F venc Impug:'' '+
            '                                               || TO_CHAR(pj_fechavencimpugnacion, ''DD/MM/YYYY'') '+
            '                                               || '' - F Pericia:'' || TO_CHAR(pj_fechaperitaje, ''DD/MM/YYYY'') '+
            '                                               || '' - Resultado: '' || pj_resultadoperitaje || '' - IBM ART: '' '+
            '                                               || LTRIM(TO_CHAR(pj_ibmart, ''L999G999G990D00'', '+
            '                                                                ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) '+
            '                                               || '' - IBM Pericial: '' '+
            '                                               || LTRIM(TO_CHAR(pj_ibmpericial, ''L999G999G990D00'', '+
            '                                                                ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) '+
            '                                               || '' - Impugnación: '' '+
            '                                               || DECODE(pj_impugnacion, ''S'', ''SI'', ''N'', ''NO'')) '+
            '        WHEN pj_idtipopericia IN(1, 2) THEN TO_CLOB(''    Perito: '' '+
            '                                                    || (SELECT pe_nombreindividual || '' '' || pe_apellido '+
            '                                                          FROM legales.lpe_perito '+
            '                                                         WHERE pe_id = pj_idperito) || '' - F venc Impug:'' '+
            '                                                    || TO_CHAR(pj_fechavencimpugnacion, ''DD/MM/YYYY'') '+
            '                                                    || '' - F Pericia:'' || TO_CHAR(pj_fechaperitaje, ''DD/MM/YYYY'') '+
            '                                                    || '' - Resultado: '' || pj_resultadoperitaje '+
            '                                                    || '' Inc Demandada: '' || pj_incapacidaddemanda '+
            '                                                    || '' Incapacidad Perito Médico: '' '+
            '                                                    || pj_incapacidadperitomedico || ''% - Impugnación: '' '+
            '                                                    || DECODE(pj_impugnacion, ''S'', ''SI'', ''N'', ''NO'') '+
            '                                                    || '' - Aplica Baremo: '' '+
            '                                                    || DECODE(pj_baremo, ''S'', ''SI'', ''N'', ''NO'')) '+
            '        ELSE TO_CLOB(''    Perito: '' || (SELECT pe_nombreindividual || '' '' || pe_apellido '+
            '                                          FROM legales.lpe_perito '+
            '                                         WHERE pe_id = pj_idperito) || '' - F venc Impug:'' '+
            '                     || TO_CHAR(pj_fechavencimpugnacion, ''DD/MM/YYYY'') || '' - F Pericia:'' '+
            '                     || TO_CHAR(pj_fechaperitaje, ''DD/MM/YYYY'') || '' - Resultado: '' || pj_resultadoperitaje '+
            '                     || '' - Impugnación: '' || DECODE(pj_impugnacion, ''S'', ''SI'', ''N'', ''NO'')) '+
            '      END observacion '+
            ' FROM legales.lpj_peritajejuicio, legales.ltp_tipopericia '+
            'WHERE pj_idjuicioentramite = '+SqlValue(FIDJuicio)+
            '  AND pj_idtipopericia = tp_id '+
            '   AND pj_fechabaja IS NULL ';

  end;
  if cbPagosJuicios.Checked then
  begin
    if sSQL <> '' then
      sSQL := sSQL + ' UNION ALL';

    sSQL := sSQL +
            ' SELECT TRUNC(pl_fechapago) fecha, cp_denpago descripcion, '+
            '        TO_CLOB(''   '' || ''Importe: '' '+
            '        || LTRIM(TO_CHAR(pl_importepago, ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) '+
            '        || '' - Importe con Retención: '' '+
            '        || LTRIM(TO_CHAR(pl_importeconretencion, ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) '+
            '        || ''- Orden de Pago N°: '' || ce_ordenpago || ''- Fecha cheque: '' || ce_fechacheque '+
            '        || '' - Banco Provincia: '' || (SELECT ba_nombre '+
            '                                          FROM zcb_cuentabancaria, zba_banco '+
            '                                         WHERE ce_idcuentabancaria = cb_id '+
            '                                           AND cb_idbanco = ba_id) '+
            '        || ''- Debitado: '' || NVL(ce_debitado, ''N'')) observacion '+
            '   FROM legales.lpl_pagolegal, art.scp_conpago, rce_chequeemitido '+
            '  WHERE pl_idjuicioentramite = '+SqlValue(FIDJuicio)+
            '    AND pl_conpago = cp_conpago '+
            '    AND pl_idchequeemitido = ce_id(+) '+
            '    AND pl_estado NOT IN(''X'') ';
  end;
  if cbEmbargosJuicios.Checked then
  begin
    if sSQL <> '' then
      sSQL := sSQL + ' UNION ALL';

    sSQL := sSQL +
            ' SELECT em_fecha fecha, ''EMBARGO'' descripcion, '+
            '        TO_CLOB(''    ''||ba_nombre || '' - Importe: '' '+
            '                || LTRIM(TO_CHAR(em_importe, ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' '')) || ''- TIPO: '' '+
            '                || DECODE(em_tipo, ''I'', ''Inversiones'', ''O'', ''Otros Rubros'', ''B'', ''Bancos'')|| '' - Debitado: '' '+
            '   || NVL2(em_idextracto, ''S'', ''N'')) observacion '+
            '   FROM legales.lem_embargo, cob.zcb_cuentabancaria, cob.zba_banco '+
            '  WHERE em_idjuicio = '+SqlValue(FIDJuicio)+
            '    AND em_idcuentabancaria = cb_id(+) '+
            '    AND cb_idbanco = ba_id(+) ';
  end;
  if cbSentenciaJuicios.Checked then
  begin
    if sSQL <> '' then
      sSQL := sSQL + ' UNION ALL';

    sSQL := sSQL +
            ' SELECT jt_fechasentencia fecha, TR_DESCRIPCION descripcion , TO_CLOB(''    ''||jt_detallesentencia) observacion'+
            '   FROM legales.ljt_juicioentramite, legales.ltr_tiporesultadosentencia '+
            '  WHERE jt_id = '+SqlValue(FIDJuicio)+
            '    AND JT_IDTIPORESULTADOSENTENCIA = tr_id ';
  end;
  if cbAdministraciondeliquidacionesSolapaILPILT.Checked then
  begin
    if sSQL <> '' then
      sSQL := sSQL + ' UNION ALL';

    sSQL := sSQL +
            ' SELECT le_faprobado fecha, ''PAGOS SINIESTROS'' descripcion, '+
            '        TO_CLOB(cp_titpago || '' - Importe:'' || '+
            '        LTRIM(TO_CHAR(le_imporperi, ''L999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''',.'''' ''))) '+
            '        || '' - Num Cheque: '' || ce_numero observacion'+
            '   FROM art.scp_conpago, art.sle_liquiempsin, legales.ljt_juicioentramite, legales.lod_origendemanda, '+
            '        legales.lsj_siniestrosjuicioentramite, art.sex_expedientes, rce_chequeemitido '+
            '  WHERE le_conpago = cp_conpago '+
            '    AND le_estado IN(''E'', ''P'') '+
            '    AND le_imporperi >= 0 '+
            '    AND jt_id = '+SqlValue(FIDJuicio)+
            '    AND od_idjuicioentramite = jt_id '+
            '    AND od_id = sj_idorigendemanda '+
            '    AND sj_idsiniestro = ex_id '+
            '    AND le_siniestro = ex_siniestro '+
            '    AND le_orden = ex_orden '+
            '    AND le_recaida = ex_recaida '+
            '    AND le_idchequeemitido = ce_id(+)';
  end;
  if cbAdministraciondeIncapacidades.Checked then
  begin
    if sSQL <> '' then
      sSQL := sSQL + ' UNION ALL';

    sSQL := sSQL +
            ' SELECT ev_fecha fecha, ''DICTAMEN'' descripcion,'+
            '        TO_CLOB(ei_descripcion || '' - Grado: '' || DECODE(ev_grado, ''P'', ''Parcial'', ''T'', ''Total'') || '' - Caracter: '' '+
            '        || DECODE(ev_caracter, ''P'', ''Provisorio'', ''D'', ''Definitivo'') || '' - Porcentaje Inc: '' || ev_porcincapacidad) as observacion'+
            '   FROM SIN.sti_tipoeventoinca, SIN.sei_eventoincapacidad, art.sev_eventosdetramite, legales.ljt_juicioentramite, '+
            '        legales.lod_origendemanda, legales.lsj_siniestrosjuicioentramite, art.sex_expedientes '+
            '  WHERE ev_codigo = ei_codigo '+
            '    AND ei_tipoevento = ti_id '+
            '    AND ti_codigo IN(''D'', ''H'') '+
            '    AND ev_evento > 0 '+
            '    AND jt_id = '+SqlValue(FIDJuicio)+
            '    AND od_idjuicioentramite = jt_id '+
            '    AND od_id = sj_idorigendemanda '+
            '    AND sj_idsiniestro = ex_id '+
            '    AND ev_siniestro = ex_siniestro '+
            '    AND ev_orden = ex_orden '+
            '    AND ev_recaida = ex_recaida ';
  end;
  if cbAdminstraciondeSiniestros.Checked then
  begin
    if sSQL <> '' then
      sSQL := sSQL + ' UNION ALL';

    sSQL := sSQL +
            ' SELECT de_fecharecepcion fecha, ''DENUNCIA'' descripcion, TO_CLOB('''') observacion '+
            '   FROM SIN.sde_denuncia, legales.ljt_juicioentramite, legales.lod_origendemanda, legales.lsj_siniestrosjuicioentramite, '+
            '        art.sex_expedientes '+
            '  WHERE de_idexpediente = ex_id '+
            '    AND jt_id = '+SqlValue(FIDJuicio)+
            '    AND od_idjuicioentramite = jt_id '+
            '    AND od_id = sj_idorigendemanda '+
            '    AND sj_idsiniestro = ex_id ';
  end;
  sSQL := sSQL + ' ORDER BY 1 ';
  Result := sSQL;
end;


procedure TrptInformeGestion.FormCreate(Sender: TObject);
begin
  cbResumen.Checked := False;
  cbEventosJuicios.Checked                            := True;
  cbTareasJuicios.Checked                             := True;
  cbPericiasJuicios.Checked                           := True;
  cbPagosJuicios.Checked                              := True;
  cbEmbargosJuicios.Checked                           := True;
  cbSentenciaJuicios.Checked                          := True;
  cbAdministraciondeliquidacionesSolapaILPILT.Checked := True;
  cbAdministraciondeIncapacidades.Checked             := True;
  cbAdminstraciondeSiniestros.Checked                 := True;
  inherited;
end;

end.
