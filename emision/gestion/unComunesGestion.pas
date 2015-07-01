unit unComunesGestion;

interface

uses
  unDmPrincipal, unCustomDataModule, unComunes, ValEdit, SysUtils, unAlarmas, SDEngine, Classes, Controls, Windows;

type
  TInfoExtraSalida = record
    SalidaReporte: TSalidaReport;
    Copias: integer;
    PathPdf: String;
    SoloUnPdf: boolean;
    GeneroPdf: boolean;
  end;

procedure ProcesarSalidaGestion(aContrato: integer; aNroGestion:integer; aIdGestionble: integer; aSalida: integer;
                                aMailNotificacion: String; var InfoImpresion: TInfoExtraSalida; aIdContacto: integer;
                                var aGenerarEventoMasivo: Boolean; var idevento: Integer);
procedure GuardarParametros(aNroGestion: integer; aParamList: TValueListEditor);
function ExisteSalida(aidgestionable: integer; aidmodonotif: integer): boolean;
function RegistrarResultadoGestion(aNroGestion, aIdDetalleGestion,
  aIdResultado, aIdEstado, aSalida: Integer; aMailNotificacion: String; aDiasaincrementar: integer; aObservacion: String):integer;
function ExisteGestionFinalizada(aNroGestion: integer): boolean;
procedure do_replicarlotegestion(aIdlote, aIdGestionble, contrato : integer;  aUsuarioGestion : String);
function get_tipocontacto(aIdModoNotificacion: integer): string;
function get_desctipocontacto(aIdModoNotificacion: integer): String;
procedure getinfoevento(aIdGestionable:integer; var aIdEvento: integer; var aIdTarea: integer; var aIdMotivo: integer; var aObs: string);
procedure VerificarGestionesPendientes;
procedure GenerarSituacionFacturacion(aContrato, aIdEmpresa: integer; aCuit: String; aIdSolicitanteSitFac, aIdMinutaReunion, aSalida: integer);
procedure do_eliminarlote(aidlote: integer; aidmotivobaja: integer = 0);
procedure do_procesardatossolicitante(aContrato, aIdTipoFormulario, aIdSolicitanteSitFac, aIdMinutaReunion: integer);


implementation

uses
  unConstEmision, unFuncionesEmision, unRptCartaDocumento, unRptCartaDocHeader, General, AnsiSql, unSesion, Forms,
  unRptSituacionFacturacion, unOpcionesImpresion, unfrmObservacion, CustomDlgs, unRptRNSMultiPeriodo, Math,
  unSIC, SqlFuncs, Dialogs;

procedure ProcesarSalidaGestion(aContrato: integer; aNroGestion:integer; aIdGestionble: integer;
                                aSalida: integer; aMailNotificacion: String; var InfoImpresion: TInfoExtraSalida;
                                aIdContacto: integer; var aGenerarEventoMasivo: Boolean; var idevento: Integer);
var
  idCarta, idtarea, idtipoevento, idtipotarea, idmotivoingreso: integer;
  tiposalida, Obs, desctiposalida: String;
begin
  if ExisteGestionFinalizada(aNroGestion) then
  begin

    tiposalida := get_tipocontacto(aSalida);
    desctiposalida := get_desctipocontacto(aSalida);

    if (tiposalida = TIPO_CONTACTO_FAX) or (tiposalida = TIPO_CONTACTO_CORREO) or (tiposalida = TIPO_CONTACTO_PERSONAL) then
    begin
      idCarta := do_generarcarta(aContrato, aNroGestion, aIdGestionble, aSalida);
      DoImprimirCarta(idCarta, taEmision, InfoImpresion.SalidaReporte, tmNone, InfoImpresion.Copias, false, true, false, true, true, true);
    end;

    if (tiposalida = TIPO_CONTACTO_MAIL) then
    begin
      do_generarmailgestion(aContrato, aNroGestion, aIdGestionble, aMailNotificacion);
    end;

    if (tiposalida = TIPO_CONTACTO_VENTANILLA) then
    begin
      if (not InfoImpresion.SoloUnPdf) or (InfoImpresion.SoloUnPdf and (not InfoImpresion.GeneroPdf)) then
      begin
        Screen.ActiveForm.FormStyle := fsNormal;
        idCarta := do_generarcarta(aContrato, aNroGestion, aIdGestionble, aSalida);
        DoImprimirCarta(idCarta, taEmision, srPdf, tmNone, InfoImpresion.Copias, false, true, false, true, true, true,
                        false, false, false, false, false, false, false, '', false, false, IncludeTrailingBackslash(InfoImpresion.PathPdf) + IntToStr(aIdGestionble) + '_' + IntToStr(aContrato) + '.pdf');
        InfoImpresion.GeneroPdf := true;
        SysUtils.DeleteFile(IncludeTrailingBackslash(InfoImpresion.PathPdf) + IntToStr(aIdGestionble) + '_' + IntToStr(aContrato) + '.qrp');
        Screen.ActiveForm.FormStyle := fsMDIChild;
      end;
    end;

    getinfoevento(aIdGestionble, idtipoevento, idtipotarea, idmotivoingreso, Obs);

    if AreIn(tiposalida, ['M', 'C', 'V']) then
    begin
      if idtipoevento > 0 then
      begin
        if aGenerarEventoMasivo then
        begin
          do_insertarevento(idtipoevento, idmotivoingreso, 0, idevento, Sesion.UserID, 'Evento masivo de gestión de Emisión. (' + desctiposalida + ')', 0);
          aGenerarEventoMasivo := False;
        end;

        do_insertartarea(idtipotarea, idmotivoingreso, 0, idtarea, 0, 'N', 'N', Sesion.UserID, Obs + ' Nro. Gestión: ' + IntToStr(aNroGestion) + '(' + desctiposalida + ')', idevento, 0, aContrato);
        AsignarDatoContacto(idtarea, tsTarea, aIdContacto, False);
        do_asignartarea(Sesion.ID, Sesion.UserMail, idtarea, False, False);
        do_agendartarea(idtarea, DBDateTime, Sesion.ID, Obs + ' Nro. Gestión: ' + IntToStr(aNroGestion) + '(' + desctiposalida + ')', 0);
      end;
    end else
    begin
      (* Tkt 26256
      if idtipotarea > 0 then
      begin
        do_insertartarea(idtipotarea, idmotivoingreso, 0, idtarea, 0, 'N', 'N', Sesion.UserID, Obs + ' Nro. Gestión: ' + IntToStr(aNroGestion), idevento, 0, aContrato);
        AsignarDatoContacto(idtarea, tsTarea, aIdContacto, False);
        do_asignartarea(Sesion.ID, Sesion.UserMail, idtarea, False, False);
      end;
      *)
    end;

    //do_ insertarsegevento(aContrato, 0, idevento, 'EMI', idmotivo, Sesion.LoginName, 'S', '', 0, 'N', '', 'N', Obs + ' Nro. Gestión: ' + IntToStr(aNroGestion), aIdContacto);
  end;
end;

procedure GuardarParametros(aNroGestion: integer; aParamList: TValueListEditor);
var
  i: integer;
begin
  for i:=0 to aParamList.Strings.Count-1 do
    do_guardarparametrogestion(aNroGestion, trim(Copy(aParamList.Strings[i], 1, Pos('=', aParamList.Strings[i])-2)),
                               trim(Copy(aParamList.Strings[i],
                                    Pos('=', aParamList.Strings[i])+1,
                                    Length(aParamList.Strings[i])-Pos('=', aParamList.Strings[i])+1)))
end;

function ExisteSalida(aidgestionable: integer; aidmodonotif: integer): boolean;
begin
  if (aidmodonotif = CONTACTO_TELEFONICO) or (aidmodonotif = CONTACTO_PERSONAL) then
    result := true
  else
    result := ExisteSqlEx(' SELECT 1 ' +
                          '  FROM emi.igs_gestionablesalida ' +
                          ' WHERE gs_fechabaja IS NULL ' +
                          '   AND gs_idgestionable = :idgestionable ' +
                          '   AND gs_idmodonotificacion = :idmodonotif', [aidgestionable, aidmodonotif]);
end;

function RegistrarResultadoGestion(aNroGestion, aIdDetalleGestion,
  aIdResultado, aIdEstado, aSalida: Integer; aMailNotificacion: String; aDiasaincrementar: integer; aObservacion: String):integer;
var
  NroGestion: integer;
begin
    if aNroGestion = 0 then
      NroGestion := GetSecNextVal('emi.seq_idg_gestion')
    else
      NroGestion := aNroGestion;
      
    EjecutarSqlSTEx(' UPDATE emi.idg_detallesubloteengestion ' +
                   '  SET dg_idresultadogestion = :idresultado, ' +
                   '      dg_idestadogestion = :idestado, ' +
                   '      dg_observacion = :observacion, ' +
                   '      dg_fechagestion = SYSDATE, ' +
                   '      dg_usuariogestion = :usugestion, ' +
                   '      dg_fechamodif = SYSDATE, ' +
                   '      dg_salidagestion = :salida, ' +
                   '      dg_mailnotificacion = :mailnotif, ' +
                          iif(adiasaincrementar <> 0,
                              ' dg_fechaagendado = art.actualdate + ' + SqlValue(adiasaincrementar) + ', dg_numerogestion = null, ',
                              ' dg_numerogestion = ' + SqlValue(NroGestion) +  ', ')  +
                   '      dg_usumodif = :usumodif ' +
                   ' WHERE dg_id = :iddetalle ', [aIdResultado, aIdEstado, aObservacion,
                                                  Sesion.LoginName, aSalida, aMailNotificacion,
                                                  Sesion.LoginName, aIdDetalleGestion]);
    result := NroGestion;

end;

function ExisteGestionFinalizada(aNroGestion: integer): boolean;
begin
  result := ExisteSqlEx(' SELECT 1 ' +
                        ' FROM emi.idg_detallesubloteengestion ' +
                        ' WHERE dg_numerogestion = :nrogestion ' +
                        '   AND dg_idresultadogestion = :idresultado', [aNroGestion ,GESTION_FINALIZADA]);
end;

procedure do_replicarlotegestion(aIdlote, aIdGestionble, contrato : integer; aUsuarioGestion: String);
begin
  EjecutarStoreEx('emi.gestion.do_replicarlotegestion(:aIdlote, :aIdGestionble, :contrato, :aIdUsuarioGestion);', [aIdlote, aIdGestionble, contrato, aUsuarioGestion]);
end;

function get_tipocontacto(aIdModoNotificacion: integer): String;
begin
  result := ValorSqlEx('SELECT mn_codigo FROM comunes.cmn_modonotificacion WHERE mn_id = :ID', [aIdModoNotificacion]);
end;

function get_desctipocontacto(aIdModoNotificacion: integer): String;
begin
  result := ValorSqlEx('SELECT mn_descripcion FROM comunes.cmn_modonotificacion WHERE mn_id = :ID', [aIdModoNotificacion]);
end;


procedure getinfoevento(aIdGestionable:integer; var aIdEvento: integer; var aIdTarea: integer; var aIdMotivo: integer; var aObs: string);
var
  sSql: String;
begin
  sSql := 'SELECT GE_MOTIVO, GE_EVENTO, GE_TAREA, GE_REFERENCIA, GE_TEXTO ' +
            'FROM EMI.IGE_GESTIONABLE ' +
           'WHERE GE_ID = ' + SqlValue( aIdGestionable );

  with GetQuery( sSql ) do
  try
    if not IsEmpty then
    begin
      aIdEvento := FieldByName('GE_EVENTO').AsInteger;
      aIdTarea  := FieldByName('GE_TAREA').AsInteger;
      aIdMotivo := FieldByName('GE_MOTIVO').AsInteger;
      aObs := FieldByName('GE_TEXTO').AsString + ' (' + FieldByName('GE_REFERENCIA').AsString + '). ';
    end;
  finally
    free;
  end;
end;

procedure VerificarGestionesPendientes;
var
  cantgestiones: integer;
begin
  cantgestiones := ValorSqlIntegerEx(' SELECT COUNT(DISTINCT ge_id || ds_contrato) ' +
                                     '  FROM emi.ige_gestionable, emi.idg_detallesubloteengestion, ' +
                                     '       emi.ids_detallesublote, art.use_usuarios, emi.isl_sublote, ' +
                                     '        emi.ilo_lote ' +
                                     '  WHERE sl_idlote = lo_id ' +
                                     '    AND se_id = sl_idusuariogestion ' +
                                     '    AND ds_idsublote = sl_id ' +
                                     '    AND dg_iddetallesublote = ds_id ' +
                                     '    AND ge_id = dg_idgestionable ' +
                                     '    AND sl_fechabaja IS NULL ' +
                                     '    AND ds_fechabaja IS NULL ' +
                                     '    AND dg_fechabaja IS NULL ' +
                                     '    AND lo_idestado = 1 ' +
                                     '    AND dg_idestadogestion IN(1) ' +
                                     '    AND ge_tipo = ''I''' +
                                     '    AND sl_idusuariogestion = :idusuario', [Sesion.ID]);
  if cantgestiones > 0 then
    unAlarmas.MostrarAlarma('Gestiones', Format('Ud. tiene %d gestiones pendientes', [cantgestiones]));
end;

procedure do_procesardatossolicitante(aContrato, aIdTipoFormulario, aIdSolicitanteSitFac, aIdMinutaReunion: integer);
var
  strList: TStringList;
  cerrarNota: boolean;
  idmotivosic: integer;
  idtareasic: integer;
  idtareaacerrar: integer;
  idrespuestasic: integer;
  respuestasic: String;
  solicitaarchivosic: boolean;
  aIdNotaContratoPeriodo: integer;
  aIdNota: integer;
  idtarea: integer;
  filePath: String;
  {
  IdUsuarioAsesor: integer;
  MailAsesor: String;
  }
begin
  strList := ValoresColSql(' SELECT ss_cerrarnota, ss_idmotivosic, ss_idtareasic, ss_idtareaacerrar, ss_idrespuestasic, ss_respuestasic, ' +
                           '       ss_solicitaarchivosic ' +
                           '  FROM emi.iss_solicitantesitfac ' +
                           ' WHERE ss_id = ' + SqlValue(aIdSolicitanteSitFac));
  try
    cerrarNota:= strList[0] = 'S';
    idmotivosic:= StrToIntDef(strList[1], 0);
    idtareasic:=  StrToIntDef(strList[2], 0);
    idtareaacerrar:= StrToIntDef(strList[3], 0);
    idrespuestasic:= StrToIntDef(strList[4], 0);
    respuestasic:= strList[5];
    solicitaarchivosic:= strList[6] = 'S';
  finally
    strList.free
  end;

  aIdNotaContratoPeriodo := ValorSqlIntegerEx(' SELECT MAX(np_id) ' +
                                              '  FROM emi.inp_notacontratoperiodo, emi.ino_nota ' +
                                              ' WHERE no_id = np_idnota ' +
                                              '  AND np_fechabaja is null ' +
                                              '  AND no_idestadonota = 1 ' + //Borrador
                                              '  AND np_idtipoformulario = :idformulario ' +
                                              '  AND no_contrato = :contrato', [aIdTipoFormulario, aContrato]);
  EjecutarSqlSTEx(' UPDATE emi.inp_notacontratoperiodo ' +
                  ' SET np_idminuta = ' + SqlInt(aIdMinutaReunion, true) + ' , ' +
                  '     np_idsolicitante = :idsolicitante ' +
                  iif(cerrarNota, ', np_fechapresentacion = art.actualdate ', '') +
                  ' WHERE np_id = :id ', [aIdSolicitanteSitFac, aIdNotaContratoPeriodo]
                  );

  if cerrarNota then
  begin
      aIdNota := ValorSqlIntegerEx(' SELECT MAX(np_idnota) ' +
                                   '  FROM emi.inp_notacontratoperiodo ' +
                                   ' WHERE np_id = :id ', [aIdNotaContratoPeriodo]);
    do_aplicarnota(aIdNota, false);
  end;

  {
  strList := ValoresColSql('SELECT se_id, se_mail ' +
                           ' FROM art.use_usuarios, emi.ias_asesoremision, afi.aco_contrato ' +
                           ' WHERE co_contrato = ' + SqlValue(aContrato) +
                           '   AND co_idasesoremision = as_id ' +
                           '   AND se_usuario = as_usuario ' +
                           '   AND as_fechabaja IS NULL ');
  try
    IdUsuarioAsesor := StrToIntDef(strList[0], 0);;
    MailAsesor := strList[1];
  finally
    strList.free;
  end;
  }

  if (idtareaacerrar > 0) then
  begin
    idtarea := ValorSqlIntegerEx(' SELECT MAX(at_id) ' +
                                 '  FROM agenda.aat_agendatarea ' +
                                 ' WHERE at_contrato = :contrato ' +
                                 '  AND at_estado = 1 ' +
                                 '  AND at_fechabaja is null ' +
                                 '  AND at_idtipoevento = :idtipoevento ', [aContrato, idtareaacerrar]);
    if (idtarea > 0) and ((respuestasic <> '') or (idrespuestasic > 0)) then
      do_agendartarea(idtarea, DBDateTime, Sesion.ID, respuestasic, idrespuestasic);
  end;

  if (idtareasic > 0) then
  begin
    do_insertartarea(idtareasic, idmotivosic, 0, idtarea, 0, 'S', 'S', Sesion.UserID, '', 0, 0, aContrato);
    //do_asignartarea(IdUsuarioAsesor, MailAsesor, idtarea, False, False);

    if solicitaarchivosic then
    begin
      with TOpenDialog.Create(dmPrincipal) do
      try
        Title := 'Seleccione la documentación a adjuntar en el evento';
        while not Execute do
          Title := 'Debe seleccionar la documentación a adjuntar en el evento';
        filePath := FileName;
      finally
        free;
      end;
      do_insertaradjuntotarea(idtarea, filePath, Sesion.LoginName);
    end;

    if (idtarea > 0) and (idtareaacerrar = 0) and ((respuestasic <> '') or (idrespuestasic > 0)) then
      do_agendartarea(idtarea, DBDateTime, Sesion.ID, respuestasic, idrespuestasic);
  end;

end;

procedure GenerarSituacionFacturacion(aContrato, aIdEmpresa: integer; aCuit: String; aIdSolicitanteSitFac, aIdMinutaReunion, aSalida: integer);
var
  sSql: String;
  qryDetalle: TSDQuery;
  qryTextos: TSDQuery;
  canttopean, cantnotopean: integer;
  strList: TStringList;
  sPeriodos: String;
  sAsesor: String;
  sTexto: String;
  sTextoDocEntregada: String;
  cantExtraSuss, cantModoPres: integer;
  idCarta: integer;
  idGestionable: integer;
  InfoExtraSalida: TInfoExtraSalida;
  bCancelo: boolean;
  HayNotasDDJJs: boolean;
  i:integer;
begin
  bCancelo := false;
  EjecutarSql('DELETE FROM emi.iel_empresaslote');
//  EjecutarSqlEx('DELETE FROM emi.iel_empresaslote WHERE el_contrato = :contrato', [aContrato]);

  EjecutarSqlSTEx('INSERT INTO emi.iel_empresaslote(el_contrato, el_idempresa, el_cuit) ' +
                'VALUES(:contrato, :idempresa, :cuit)', [aContrato, aIdEmpresa, aCuit]);

  sSql := 'SELECT ge_id, ge_sitfacturacion, ge_tipodetallegestion ' +
          'FROM emi.ige_gestionable ' +
          'WHERE ge_fechabaja IS NULL ' +
          '  AND ge_sitfacturacion IS NOT NULL ' +
          'ORDER BY 1 ';

  qryDetalle := GetQuery('SELECT 1 FROM DUAL');
  EjecutarSqlEx('DELETE FROM emi.isf_situacionfacturacion WHERE sf_contrato = :contrato', [aContrato]);
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      qryDetalle.Close;
      qryDetalle.SQL.Clear;

      BlobSql('SELECT REPLACE(ge_sqlagestionar, ''emi.gestion.get_fechaultgestion('' || ge_id || '')'', ''TO_DATE(''''01/01/1980'''', ''''DD/MM/YYYY'''')'') ' +
              ' FROM emi.ige_gestionable  ' +
              ' WHERE ge_id = ' + SqlInt(FieldByName('ge_id').AsInteger), qryDetalle.SQL);
      qryDetalle.Open;
      while not qryDetalle.Eof do
      begin
        if (FieldByName('ge_tipodetallegestion').AsString = 'P') then
          EjecutarSqlEx('INSERT INTO emi.isf_situacionfacturacion (sf_contrato, sf_idempresa, sf_cuit, sf_periodo, sf_idgestionable) ' +
                        'VALUES (:contrato, :cuit, :idempresa, :periodo, :idgestionable) ',
                        [aContrato, aIdEmpresa, aCuit, qryDetalle.Fields[1].AsString, FieldByName('ge_id').AsInteger]);

        if (FieldByName('ge_tipodetallegestion').AsString = 'C') then
          EjecutarSqlEx('INSERT INTO emi.isf_situacionfacturacion (sf_contrato, sf_idempresa, sf_cuit, sf_periodo, sf_idgestionable, sf_cuil) ' +
                        'VALUES (:contrato, :cuit, :idempresa, :periodo, :idgestionable, :cuil) ',
                        [aContrato, aIdEmpresa, aCuit, qryDetalle.Fields[1].AsString, FieldByName('ge_id').AsInteger, qryDetalle.Fields[2].AsString]);
        qryDetalle.Next;
      end;
      Next;
    end;

    //Agrego lotes ya generados y pendientes de DDJJ AFIP y Notas
    EjecutarSqlEx(' INSERT INTO emi.isf_situacionfacturacion ' +
                  '            (sf_contrato, sf_idempresa, sf_cuit, sf_periodo, sf_idgestionable) ' +
                  ' SELECT ds_contrato, :idempresa, :cuit, dg_periodo, dg_idgestionable ' +
                  '   FROM emi.idg_detallesubloteengestion idg1, emi.ids_detallesublote ids1, emi.isl_sublote, emi.ilo_lote ilo1 ' +
                  '  WHERE lo_id = sl_idlote ' +
                  '    AND sl_id = ds_idsublote ' +
                  '    AND ds_id = dg_iddetallesublote ' +
                  '    AND dg_tipodetallegestion IN(''D'', ''N'') ' +
                  '    AND lo_fechabaja IS NULL ' +
                  '    AND sl_fechabaja IS NULL ' +
                  '    AND ds_fechabaja IS NULL ' +
                  '    AND dg_fechabaja IS NULL ' +
                  '    AND ds_contrato = :contrato ' +
                  '    AND NOT EXISTS(SELECT 1 ' +
                  '                     FROM emi.idg_detallesubloteengestion idg, emi.ids_detallesublote ids, emi.isl_sublote isl, emi.ilo_lote ilo ' +
                  '                    WHERE ilo.lo_id = isl.sl_idlote ' +
                  '                      AND isl.sl_id = ids.ds_idsublote ' +
                  '                      AND ids.ds_id = idg.dg_iddetallesublote ' +
                  '                      AND idg.dg_tipodetallegestion = idg1.dg_tipodetallegestion ' +
                  '                      AND ilo.lo_fechabaja IS NULL ' +
                  '                      AND isl.sl_fechabaja IS NULL ' +
                  '                      AND ids.ds_fechabaja IS NULL ' +
                  '                      AND idg.dg_fechabaja IS NULL ' +
                  '                      AND ids.ds_contrato = ids1.ds_contrato ' +
                  '                      AND ilo.lo_id > ilo1.lo_id) ' +
                  '    AND (   EXISTS(SELECT 1 ' +
                  '                     FROM emi.ino_nota, emi.inp_notacontratoperiodo, cob.zrc_resumencobranza ' +
                  '                    WHERE np_iddetallesublotegestion = dg_id ' +
                  '                      AND no_contrato = rc_contrato ' +
                  '                      AND np_periodo = rc_periodo ' +
                  '                      AND rc_contrato = ds_contrato ' +
                  '                      AND rc_gestionableampliado IN(''I'', ''D'')) ' +
                  '         OR EXISTS(SELECT 1 ' +
                  '                     FROM emi.idj_ddjj, cob.zrc_resumencobranza ' +
                  '                    WHERE dj_iddetallesublotegestion = dg_id ' +
                  '                      AND dj_contrato = rc_contrato ' +
                  '                      AND dj_periodo = rc_periodo ' +
                  '                      AND rc_gestionableampliado IN(''I'', ''D'')))', [aIdEmpresa, aCuit, aContrato]);

    if (aSalida = SALIDA_IMPRESORA) then
    begin
      HayNotasDDJJs := ValorSqlIntegerEx('SELECT COUNT(DISTINCT ge_tipodetallegestion) ' +
                                         '  FROM emi.ige_gestionable, emi.isf_situacionfacturacion ' +
                                         ' WHERE ge_id = sf_idgestionable ' +
                                         '   AND ge_tipodetallegestion IN(''D'', ''N'') ' +
                                         '   AND sf_contrato = :contrato', [aContrato]) > 1;

      if ExisteSqlEx('SELECT 1 FROM emi.isf_situacionfacturacion WHERE sf_contrato = :contrato', [aContrato]) then
      begin
        EjecutarSqlEx('UPDATE emi.isf_situacionfacturacion ' +
                      ' SET sf_modopresentacion = emi.utiles.get_modopresentacion(sf_idempresa, sf_periodo), ' +
                      '     sf_topea = decode(emi.utiles.get_topeaempresaminimo(sf_cuit, sf_periodo), ''N'', ''N'', ''S'') ' +
                      ' WHERE sf_contrato = :contrato ', [aContrato]);

        canttopean := ValorSqlIntegerEx('SELECT COUNT(*) FROM emi.isf_situacionfacturacion WHERE sf_contrato = :contrato AND sf_topea = :topea', [aContrato, 'S']);
        cantnotopean := ValorSqlIntegerEx('SELECT COUNT(*) FROM emi.isf_situacionfacturacion WHERE sf_contrato = :contrato AND sf_topea = :topea', [aContrato, 'N']);

        cantExtraSuss := ValorSqlIntegerEx('SELECT COUNT(*) FROM emi.isf_situacionfacturacion WHERE sf_contrato = :contrato AND sf_modopresentacion = :modo', [aContrato, 2]);
        cantModoPres := ValorSqlIntegerEx('SELECT COUNT(DISTINCT sf_modopresentacion) FROM emi.isf_situacionfacturacion WHERE sf_contrato = :contrato', [aContrato]);

        if (((canttopean > 0) and (cantnotopean = 0)) or ((canttopean = 0) and (cantnotopean > 0))) and (cantModoPres = 1) then
        begin

          with TfrmObservacion.Create(nil) do
          try
            Caption := 'Resumen de la documentación entregada';
            Validar := false;
            if ShowModal <> mrOk then exit;
            sTextoDocEntregada := '';
            for i:=0 to ObsTString.Count-1 do
            begin
              if (sTextoDocEntregada <> '') then
                sTextoDocEntregada := sTextoDocEntregada + '\par ';
              sTextoDocEntregada := sTextoDocEntregada + ObsTString[i];
            end;
          finally
            free;
          end;

          strList:= TStringList.Create;
          qryTextos := GetQueryEx('SELECT DISTINCT sf_idgestionable, ge_tipodetallegestion ' +
                                  'FROM emi.ige_gestionable, emi.isf_situacionfacturacion ' +
                                  'WHERE ge_id = sf_idgestionable AND sf_contrato = :contrato ' +
                                  'ORDER by sf_idgestionable', [aContrato]);
          try
            while not qryTextos.Eof do
            begin

              if strList.Count > 0 then
              begin
                strList.Add('\par');
                strList.Add('\par');
              end;

              sPeriodos := '';
              sTexto := ValorSqlEx('SELECT ge_textositfacturacion FROM emi.ige_gestionable WHERE ge_id = :idgestionable', [qryTextos.fieldbyname('sf_idgestionable').AsInteger]);
              if (Pos('<<PERIODOS_RECLAMO>>', uppercase(sTexto)) > 0) then
              begin
                sPeriodos := ValorSqlEx('SELECT emi.gestion.get_periodositemsitfac(:contrato, :idgestionable) FROM DUAL', [aContrato, qryTextos.fieldbyname('sf_idgestionable').AsInteger]);
                sTexto := StringReplace(sTexto, '<<PERIODOS_RECLAMO>>', '\b '+ sPeriodos + '\b0', [rfIgnoreCase, rfReplaceAll]);
              end;

              if (Pos('<<PERIODOS_CUILES_RECLAMO>>', uppercase(sTexto)) > 0) then
              begin
                sPeriodos := ValorSqlEx('SELECT emi.gestion.get_periodoscuilesitemsitfac(:contrato, :idgestionable) FROM DUAL', [aContrato, qryTextos.fieldbyname('sf_idgestionable').AsInteger]);
                sTexto := StringReplace(sTexto, '<<PERIODOS_CUILES_RECLAMO>>', sPeriodos, [rfIgnoreCase, rfReplaceAll]);
              end;

              if (Pos('<<PERIODOS_CUILES_RECLAMO>>', uppercase(sTexto)) > 0) then
              begin
                sPeriodos := ValorSqlEx('SELECT emi.gestion.get_periodoscuilesitemsitfac(:contrato, :idgestionable) FROM DUAL', [aContrato, qryTextos.fieldbyname('sf_idgestionable').AsInteger]);
                sTexto := StringReplace(sTexto, '<<PERIODOS_CUILES_RECLAMO>>', sPeriodos, [rfIgnoreCase, rfReplaceAll]);
              end;

              if (Pos('<<TEXTO_NOTAS>>', uppercase(sTexto)) > 0) then
              begin
                sPeriodos := ValorSqlEx('SELECT emi.gestion.get_textogestionnotassitfac(:contrato) FROM DUAL', [aContrato]);
                sTexto := StringReplace(sTexto, '<<TEXTO_NOTAS>>', sPeriodos, [rfIgnoreCase, rfReplaceAll]);
                if HayNotasDDJJs then
                  sTexto := StringReplace(sTexto, ':', '(*)', [rfIgnoreCase]);
              end;

              if (Pos('<<TEXTO_DDJJ>>', uppercase(sTexto)) > 0) then
              begin
                sPeriodos := ValorSqlEx('SELECT emi.gestion.get_textogestionddjjsitfac(:contrato) FROM DUAL', [aContrato]);
                sTexto := StringReplace(sTexto, '<<TEXTO_DDJJ>>', sPeriodos, [rfIgnoreCase, rfReplaceAll]);
                if HayNotasDDJJs then
                begin
                  sTexto := StringReplace(sTexto, ':', '(*)', [rfIgnoreCase]);
                  sTexto := sTexto + '\par\par (*)En caso de poseer periodos duplicados en los detalles anteriores por favor verifique qué datos debe rectificar.';
                end;

              end;

              sAsesor := '';
              if (Pos('<<ASESOR>>', uppercase(sTexto)) > 0) then
              begin
                sAsesor := ValorSqlEx('SELECT as_nombre ' +
                                     ' FROM emi.ias_asesoremision, afi.aco_contrato ' +
                                     ' WHERE co_contrato = :contrato ' +
                                     '   AND co_idasesoremision = as_id ' +
                                     '   AND as_fechabaja IS NULL ', [aContrato]);
                sTexto := StringReplace(sTexto, '<<ASESOR>>', '\b ' + sAsesor + '\b0', [rfIgnoreCase, rfReplaceAll]);
              end;
              strList.Add(sTexto);
  (*
              if strList.Count > 0 then
              begin
                strList.Add('\par');
                strList.Add('\par');
              end;
  *)
              qryTextos.Next;
            end;

            if (canttopean > 0) then
              idGestionable := GESTION_SITUACION_FAC_CT
            else
              idGestionable := GESTION_SITUACION_FAC_ST;

            with TfrmOpcionesImpresion.Create(nil) do
            try
              if (ShowModal = mrOk) then
              begin
                InfoExtraSalida.Copias := Copias;
                InfoExtraSalida.SalidaReporte := SalidaReporte;
              end
              else
                bCancelo := true;
            finally
              free;
            end;
            if not bCancelo then
            begin
              BeginTrans;
              try
                idCarta := do_generarcarta(aContrato, 0, idGestionable, CONTACTO_CORREO);
                DoImprimirCartaSitFacturacion(idCarta, strList, sTextoDocEntregada, taEmision, InfoExtraSalida.SalidaReporte, tmNone, InfoExtraSalida.Copias,
                                              false, false, false, true, false, true);
                do_generarnota(AContrato, TF_FormSitFacturacion);
                do_procesardatossolicitante(AContrato, TF_FormSitFacturacion, aIdSolicitanteSitFac, aIdMinutaReunion);
                CommitTrans;
              except
                on E: Exception do
                begin
                  Rollback;
                  ErrorMsg(E, 'Error al generar la situación de facturación.');
                end;
              end;
            end;
          finally
            qryTextos.free;
          end;
          if cantExtraSuss > 0 then
          begin
            with TqrRNSMultiPeriodo.Create(nil) do
              Preparar(aContrato, (canttopean > 0), InfoExtraSalida.SalidaReporte = srPrint);
          end;
        end
        //Genera lote con los items gestionables
        //por tener distintos modos de presentacion
        else begin
          do_procesarlotesitfac(aContrato, iif((canttopean > 0), 'C', 'S'));
          MsgBox('Con motivo de realizar la gestión de casos complejos de forma específica, no se genera la situación de facturación automáticamente,' + #13#10 +
                 'cuando la empresa presenta diversas formas de presentación de las DDJJ. Se generará una gestión por tal motivo.', MB_ICONINFORMATION, 'Situación de facturación');
        end;
      end;
    end; //fin aSalida = SALIDA_IMPRESORA
  finally
    free;
  end;
end;

procedure do_eliminarlote(aidlote: integer; aidmotivobaja: integer);
begin
  EjecutarStoreEx('emi.gestion.do_eliminarlote(:aIdlote, ' + SqlInt(aidmotivobaja, true)  + ');', [aIdlote]);
end;


end.
