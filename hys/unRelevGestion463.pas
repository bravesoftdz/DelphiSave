unit unRelevGestion463;

interface

uses AnsiSql, unDmPrincipal, unPrincipal, DateUtils, DB, unSesion, unConstFet, Classes,
     SDEngine, unRptResolucion463, unExportPDF,CustomDlgs, Forms;

  //function do_GenerarPlanilla_old(contrato : Integer; vigencia : String): Boolean;
  function do_GenerarPlanilla(contrato : Integer; vigencia : String) : Boolean;
  function do_generar_rpt_463(aContrato, aEstablecimiento: Integer; aVigencia: WideString): WideString; stdcall; external 'HYS_LIB.dll';

implementation

uses SysUtils, StrFuncs, unMoldeEnvioMail, unComunesFet, Windows,
     unEsperaSimple;

(*
function do_GenerarPlanilla_old(contrato : Integer; vigencia : String): Boolean;
var
  fechaautorizacion,fechaGestion, fechaEnvioMail : TDateTime;
  cuerpo, pathQrp,pathDestino, mailContrato, usuGestion, cumplimiento, estado, pathOld, idEstableci : String;
  idEmail, idrelev :Integer;
  vigenciaold : String;
begin
  sdqRelev := GetQuery('SELECT 1 FROM DUAL');

  sdqRelev.SQL.Clear;
  sdqRelev.SQL.Add(' SELECT rl_contrato, rl_estableci, ' + SqlValue(vigencia)  + ' rl_vigencia, TO_CHAR(rl_fechavigencia, ''YYYY'') vigenciaold ' +
           ' FROM hys.hrl_relevriesgolaboral ' +
           ' WHERE (TO_CHAR(rl_fechavigencia, ''YYYY'') <> rl_vigencia ' +
           ' OR rl_fechavigencia IS NULL) ' +
           ' AND RL_FECHABAJA IS NULL ' +
           ' AND rl_procedencia = ''E'' ' +
           ' AND rl_contrato = :contrato ');

  sdqRelev.ParamByName('contrato').AsInteger  := contrato;
  sdqRelev.Open;

  BeginTrans;

  with sdqRelev do
  try
    while not Eof do
    begin
{
      with TrptResolucion463.Create(nil) do
      try
        Load(FieldByName('rl_contrato').AsInteger,
             FieldByName('rl_estableci').AsInteger,
             FieldByName('rl_vigencia').AsString);
        pathQrp := Path;
      finally
        Free;
      end;
}
      pathOld := ArmarPathRelev463(FieldByName('rl_contrato').AsString,FieldByName('vigenciaold').AsString,
                               FieldByName('rl_estableci').AsInteger);


      idEstableci := ValorSql(
        ' SELECT es_id '+
        '   FROM afi.aes_establecimiento '+
        '  WHERE es_contrato = '+ SqlValue(FieldByName('rl_contrato').AsInteger)+
        '    AND es_nroestableci = '+ SqlValue(FieldByName('rl_estableci').AsInteger));

      pathOld := pathOld + FieldByName('rl_contrato').AsString+'_'+idEstableci+'_'+FieldByName('vigenciaold').AsString+'.pdf';
      EjecutarSqlSTEx( ' update hys.hrl_relevriesgolaboral ' +
                       ' set rl_vigencia = ' + SqlValue(vigencia) + ', ' +
                       '     rl_fechavigencia = add_months(rl_fechavigencia, -12) ' +
                       ' where rl_contrato = :contrato ' +
                       ' and rl_vigencia = :vigenciaold ', [contrato, vigencia]);

      EjecutarSqlST(
        ' UPDATE hys.hrg_relevgestion '+
        '    SET rg_vigencia =  ' + SqlValue(vigencia)  +
        '  WHERE rg_contrato = '+SqlValue(contrato)+
        '    AND rg_vigencia = '+SqlValue(vigencia));

      EjecutarSqlST(
        ' UPDATE hys.hcr_cumplimientorelev '+
        '    SET cr_vigencia =  ' + SqlValue(vigencia)  +
        '  WHERE cr_contrato = '+SqlValue(contrato)+
        '    AND cr_vigencia = '+SqlValue(FieldByName('vigenciaold').AsString));

      pathDestino := ArmarPathRelev463(FieldByName('rl_contrato').AsString,FieldByName('rl_vigencia').AsString,
                               FieldByName('rl_estableci').AsInteger);

      pathDestino := pathDestino + FieldByName('rl_contrato').AsString+'_'+idEstableci+'_'+ vigencia +'.pdf';

      RenameFile(pathOld, pathDestino);

//      if not FileToPDFSvr(pathQrp,pathDestino) then
//        raise Exception.Create('Error al generar el PDF');
      Next;
    end;
    CommitTrans;
    Result := True;
  finally
    Close;
  end;
end;
*)
(****************************************************************************************)
function do_GenerarPlanilla(contrato : Integer; vigencia : String): Boolean;
var
  fechaautorizacion, fechaGestion {, fechaEnvioMail} : TDateTime;
  pathQrp, cuerpo, pathDestino, mailContrato, usuGestion, cumplimiento, estado : String;
  idEmail, idrelev :Integer;
  sdqRelev: TSDQuery;
begin
  fechaautorizacion := ValorSqlDateTime(
    ' SELECT MAX (cr_fechaautorizacion) '+
    '   FROM hys.hcr_cumplimientorelev '+
    '  WHERE cr_vigencia = '+SqlValue(vigencia)+
    '    AND cr_contrato = '+SqlValue(contrato));
  sdqRelev := GetQuery('SELECT 1 FROM DUAL');
  sdqRelev.Close;
  if fechaautorizacion = 0 then
  begin
    sdqRelev.SQL.Clear;
    sdqRelev.SQL.Add(
      ' SELECT DISTINCT rl_contrato, rl_estableci, rl_vigencia '+
      '            FROM hys.hrl_relevriesgolaboral '+
      '           WHERE rl_contrato = :contrato '+
      '             AND rl_vigencia = :vigencia '+
      '             AND rl_fechabaja IS NULL');
  end
  else
  begin
    sdqRelev.SQL.Clear;
    sdqRelev.SQL.Add(
      ' SELECT DISTINCT rl_contrato, rl_estableci, rl_vigencia '+
      '            FROM hys.hfr_formulariorelev, hys.hrl_relevriesgolaboral '+
      '           WHERE rl_id = fr_idrelevriesgolaboral '+
      '             AND rl_contrato = :contrato '+
      '             AND rl_vigencia = :vigencia '+
      '             AND NVL (fr_fechamodif, fr_fechaalta) >= :fecha '+
      '             AND rl_fechabaja IS NULL '+
      ' UNION '+
      ' SELECT DISTINCT rl_contrato, rl_estableci, rl_vigencia '+
      '            FROM hys.hrl_relevriesgolaboral '+
      '           WHERE rl_contrato = :contrato '+
      '             AND rl_vigencia = :vigencia '+
      '             AND (   NVL (rl_fechamodif, rl_fechaalta) >= :fecha '+
      '                  OR rl_fechabaja >= :fecha '+
      '                 ) '+
      '             AND rl_fechabaja IS NULL '+
      ' UNION '+
      ' SELECT DISTINCT rl_contrato, rl_estableci, rl_vigencia '+
      '            FROM hys.hrg_relevgremialista, hys.hrl_relevriesgolaboral '+
      '           WHERE rl_id = rg_idrelevriesgolaboral '+
      '             AND rl_contrato = :contrato '+
      '             AND rl_vigencia = :vigencia '+
      '             AND (   NVL (rg_fechamodif, rg_fechaalta) >= :fecha '+
      '                  OR rg_fechabaja >= :fecha '+
      '                 ) '+
      '             AND rl_fechabaja IS NULL '+
      ' UNION '+
      ' SELECT DISTINCT rl_contrato, rl_estableci, rl_vigencia '+
      '            FROM hys.hrc_relevcontratista, hys.hrl_relevriesgolaboral '+
      '           WHERE rl_id = rc_idrelevriesgolaboral '+
      '             AND rl_contrato = :contrato '+
      '             AND rl_vigencia = :vigencia '+
      '             AND (   NVL (rc_fechamodif, rc_fechaalta) >= :fecha '+
      '                  OR rc_fechabaja >= :fecha '+
      '                 ) '+
      '             AND rl_fechabaja IS NULL '+
      ' UNION '+
      ' SELECT DISTINCT rl_contrato, rl_estableci, rl_vigencia '+
      '            FROM hys.hrr_responsablerelev, hys.hrl_relevriesgolaboral '+
      '           WHERE rl_id = rr_idrelevriesgolaboral '+
      '             AND rl_contrato = :contrato '+
      '             AND rl_vigencia = :vigencia '+
      '             AND (   NVL (rr_fechamodif, rr_fechaalta) >= :fecha '+
      '                  OR rr_fechabaja >= :fecha '+
      '                 ) '+
      '             AND rl_fechabaja IS NULL ');
    sdqRelev.ParamByName('fecha').AsDateTime := fechaautorizacion;
  end;
  sdqRelev.ParamByName('contrato').AsInteger  := contrato;
  sdqRelev.ParamByName('vigencia').AsString  := vigencia;
  sdqRelev.Open;

  with sdqRelev do
  try
    while not sdqRelev.Eof do
    begin
      pathQrp := do_generar_rpt_463(FieldByName('rl_contrato').AsInteger, FieldByName('rl_estableci').AsInteger, FieldByName('rl_vigencia').AsString);
      (*
      with TrptResolucion463.Create(nil) do
      try
        Load(FieldByName('rl_contrato').AsInteger,
             FieldByName('rl_estableci').AsInteger,
             FieldByName('rl_vigencia').AsString);
        pathQrp := Path;
      finally
        Free;
      end;
      *)
      pathDestino := ArmarPathRelev463(FieldByName('rl_contrato').AsString,FieldByName('rl_vigencia').AsString,
                                       FieldByName('rl_estableci').AsInteger);

      if not FileToPDFSvr(pathQrp, pathDestino, '', false) then
        raise Exception.Create('Error al generar el PDF');
      Next;
    end;
  finally
    FreeAndNil(sdqRelev);
  end;
  
  mailContrato := ValorSql(
    ' SELECT co_direlectronica '+
    '   FROM afi.aco_contrato '+
    '  WHERE co_contrato = '+SqlValue(contrato));
  if mailContrato <> '' then
  begin
    //armar funcion de mails
    estado := 'AE';
    fechaGestion := DBDateTime;
    usuGestion := Sesion.UserID;
    //fechaEnvioMail := fechaGestion;
    cuerpo := '';
    idEmail := 0;
    //idEmail := EnviarMailBDWithResults(mailContrato,'Provincia ART - Recepcion de Relevamiento de Riesgos Laborales',
    //                                   [],cuerpo).MensajeId;
  end
  else
  begin
    estado := 'PG';
    fechagestion := 0;
    usuGestion := '';
    //fechaEnvioMail := 0;
    idEmail := 0;
  end;
  BeginTrans();
  try
    EjecutarSqlST(
      ' UPDATE hys.hrg_relevgestion '+
      '    SET rg_fechabaja = SYSDATE, '+
      '        rg_usubaja = '+SqlValue(Sesion.UserID)+
      '  WHERE rg_contrato = '+SqlValue(contrato)+
      '    AND rg_vigencia = '+SqlValue(vigencia)+
      '    AND rg_fechabaja IS NULL '+
      '    AND rg_estado in (''PG'', ''AE'')');


    EjecutarStoreSTEx('hys.do_procesarcumplimiento(:contrato, :vigencia, :tipocarga, NULL, :autoriza);', [contrato, vigencia, 'R', 'S']);

    cumplimiento := ValorSql(
      ' SELECT art.hys.get_cumplimientorelevvig ('+SqlValue(contrato)+', SYSDATE,'+SqlValue(vigencia)+')'+
      '   FROM DUAL');

    idrelev := GetSecNextVal('hys.seq_hrg_relev_id');

    EjecutarSqlST(
      ' INSERT INTO hys.hrg_relevgestion '+
      '        (rg_id, rg_contrato, rg_vigencia, '+
      '         rg_fechagestion, rg_usugestion, rg_idemail, '+
      '         rg_cumplimiento, rg_fechaalta, rg_usualta, rg_estado '+
      '        ) '+
      ' VALUES ('+SqlValue(idrelev)+','+SqlValue(contrato)+','+SqlValue(vigencia)+', '+
               SqlDateTime(fechagestion)+','+ SqlValue(usugestion)+','+
               SqlInt(idEmail,True)+','+SqlValue(cumplimiento)+', SYSDATE,'+SqlValue(Sesion.UserID)+','+
               SqlValue(estado)+')');
    //if ae =
    EjecutarStoreSTEx('art.intraweb.do_notificarriesgolaboral(:usuario,:contrato,:idrelevgestion,:esreenvio);',
                      [Sesion.UserID,contrato,idrelev,'N']);
    CommitTrans();
    Result := True;
  except
    on E: exception do begin
      Rollback();
      Result := False;
      ErrorMsg( E );
    end;
  end;
end;

end.
