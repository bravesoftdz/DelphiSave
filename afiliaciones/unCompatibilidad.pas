unit unCompatibilidad;

{ by NWK, 10/04/03 }
{ Functiones/Procedimientos por compatibilidad versión anterior de la base de datos/sistema }

interface

function DoCambiarCuilBaseDatos(aCuilViejo, aCuilNuevo: String; var aMensajeError: String): Boolean;
function DoCambiarCuitBaseDatos(aCuitViejo, aCuitNuevo: String; var aMensajeError: String): Boolean;
procedure DoCambioMasivoCuilBaseDatos(aTabla, aCampoCuilVie, aCampoCuilNue: String);
procedure DoCambioMasivoCuilBaseDatos2;

implementation

uses
  unDmPrincipal, AnsiSql, Cuit, unPrincipal, SqlFuncs, StrFuncs, SysUtils, unArt, unAfiliaciones, Dialogs, CustomDlgs,
  unComunes, unSesion, Windows;

{ Sincroniza todos los registros de la tabla de movimientos con la tabla de resumen de cobranzas, para el cuit dado }
procedure DoSincronizar_ZCT_Cotizaciones(aCuit: String; aConTransaccion: Boolean);
var
  sSql: String;
begin
  sSql := 'art.cobranza.actualizar_zrc_empresa(:cuit);';

  if aConTransaccion then
    EjecutarStoreEx(sSql, [SacarGuiones(aCuit)])
  else
    EjecutarStoreSTEx(sSql, [SacarGuiones(aCuit)]);
end;

{ Sincroniza todos los registros de la tabla de movimientos con la tabla contable de resumen de cobranzas, para el cuit dado }
procedure DoSincronizar_ORC_ResumenCobranza(aCuit: String; aConTransaccion: Boolean);
var
  sSql: String;
begin
  sSql := 'art.cobranza.actualizar_osc_empresa(:cuit);';

  if aConTransaccion then
    EjecutarStoreEx(sSql, [SacarGuiones(aCuit)])
  else
    EjecutarStoreSTEx(sSql, [SacarGuiones(aCuit)]);
end;

{ Cambia el valor de un campo por su nuevo valor, en todas las tablas de la base de datos donde éste sea usado }
function DoCampoCambiarValorBaseDatos(aCampo, aViejo, aNuevo: String): Boolean;
var
  IdTrabajadorNuevo: TTableId;
  IdTrabajadorViejo: TTableId;
  sObservacionesAudit: String;
  sOpcionAudit: String;
  sSql: String;
  sSql2: String;
  sSqlIdTrabajador: String;

  procedure DoCambiarValor(aSqlTablas, aCampoViejo, aCampoNuevo: String);
  var
    sColumna: String;
    sOwner: String;
    sSql2: String;
    sTabla: String;
  begin
    with GetQuery(aSqlTablas) do
    try
      while not Eof do
      begin
        try
          sOwner := FieldByName('dueno').AsString;
          sTabla := FieldByName('tabla').AsString;
          sColumna := FieldByName('columna').AsString;

          sSql2 := 'SELECT 1 ' +
                     'FROM ' + sOwner + '.' + sTabla + ' ' +
                    'WHERE ' + sColumna + '=' +  aCampoViejo;

          if ExisteSql(sSql2) then
          begin
            sSql2 := 'UPDATE ' + sOwner + '.' + sTabla + ' ' +
                        'SET ' + sColumna + '=' + aCampoNuevo + ' ' +
                      'WHERE ' + sColumna + '=' + aCampoViejo;

            EjecutarSqlST(sSql2);
          end;
        except
          //
        end;

        Next;
      end;
    finally
      Free;
    end;
  end;
begin
  try
    BeginTrans;

    aCampo := UpperCase(aCampo);

    sSql :=
      'SELECT DISTINCT all_tables.owner dueno, all_tab_columns.table_name tabla, column_name columna' +
                ' FROM all_tab_columns, all_tables' +
               ' WHERE all_tab_columns.table_name = all_tables.table_name' +
                 ' AND (   all_tab_columns.owner LIKE ''AR%''' +
                      ' OR all_tab_columns.owner IN(''COMUNES'', ''AFI'', ''EMI'', ''HYS'', ''LEGALES'', ''ACTUARIAL'', ''COB''))' +
                 ' AND all_tables.owner = all_tab_columns.owner' +
                 ' AND column_name LIKE ''%' + aCampo + '%''' +
                 ' AND all_tab_columns.data_length >= 11' +
                 ' AND NOT(column_name LIKE ''%TMP_%'')' +
                 ' AND NOT(all_tab_columns.table_name LIKE ''%TMP%'')' +
                 ' AND NOT(all_tab_columns.table_name LIKE ''%AUXILIAR%'')' +
                 ' AND all_tab_columns.table_name NOT IN(''TRABAJADORES'', ''DATOSLABORALES'', ''HISTOLABORAL'')';

    if aCampo = 'CUIL' then
    begin
      IdTrabajadorNuevo := GetIdTrabajadorPorCuil(aNuevo);
      if (IdTrabajadorNuevo > 0) then   // el nuevo trabajador ya existe
      begin
        IdTrabajadorViejo := GetIdTrabajadorPorCuil(aViejo);

        sSqlIdTrabajador :=
          'SELECT DISTINCT all_tables.owner dueno, all_tab_columns.table_name tabla, column_name columna' +
                    ' FROM all_tab_columns, all_tables' +
                   ' WHERE all_tab_columns.table_name = all_tables.table_name' +
                     ' AND (all_tab_columns.owner NOT IN(''BAPRO'', ''DBSNMP'', ''DSCVER'', ''EDU'', ''EUL'', ''FABIANA'',' +
                                                       ' ''FFI'', ''GAB'', ''GESTION'', ''HEC'', ''JOU'', ''JUL'',' +
                                                       ' ''LPA'', ''LMZ'', ''LAU'', ''NEL'', ''NWK'', ''PAU'',' +
                                                       ' ''PRUEBA'', ''PZA'', ''SGA'', ''SQL'', ''SQLNTDATA'', ''SYNCHRO'',' +
                                                       ' ''SYS'', ''SYSTEM'', ''VIDEO31'', ''ACTU''))' +
                     ' AND all_tables.owner = all_tab_columns.owner' +
                     ' AND column_name LIKE ''%IDTRABAJADOR%''' +
                     ' AND NOT(column_name LIKE ''%TMP_%'')' +
                     ' AND NOT(all_tab_columns.table_name LIKE ''%TMP%'')' +
                     ' AND NOT(all_tab_columns.table_name LIKE ''%AUXILIAR%'')';

        DoCambiarValor(sSqlIdTrabajador, SqlValue(IdTrabajadorViejo), SqlValue(IdTrabajadorNuevo));

        try
          // todas las FK a la tabla CRL_RELACIONLABORAL deben estar definidas ON DELETE CASCADE
          sSql2 :=
            'DELETE FROM crl_relacionlaboral' +
                 ' WHERE rl_idtrabajador = :idtrabajador';
          EjecutarSqlSTEx(sSql2, [IdTrabajadorViejo]);

          sSql2 :=
            'UPDATE ctj_trabajador a' +
              ' SET (tj_sexo, tj_fnacimiento, tj_estadocivil, tj_lateralidaddominante, tj_calle, tj_numero, tj_piso, tj_departamento,' +
                   ' tj_cpostal, tj_cpostala, tj_localidad, tj_provincia, tj_codareatelefono, tj_telefono, tj_nombre) =' +
                    ' (SELECT NVL(a.tj_sexo, b.tj_sexo), NVL(a.tj_fnacimiento, b.tj_fnacimiento), NVL(a.tj_estadocivil, b.tj_estadocivil),' +
                            ' NVL(a.tj_lateralidaddominante, b.tj_lateralidaddominante), NVL(a.tj_calle, b.tj_calle),' +
                            ' utiles.iif_char(b.tj_calle, NULL, a.tj_numero, b.tj_numero),' +
                            ' utiles.iif_char(b.tj_calle, NULL, a.tj_piso, b.tj_piso),' +
                            ' utiles.iif_char(b.tj_calle, NULL, a.tj_departamento, b.tj_departamento),' +
                            ' utiles.iif_char(b.tj_calle, NULL, a.tj_cpostal, b.tj_cpostal),' +
                            ' utiles.iif_char(b.tj_calle, NULL, a.tj_cpostala, b.tj_cpostala),' +
                            ' utiles.iif_char(b.tj_calle, NULL, a.tj_localidad, b.tj_localidad),' +
                            ' utiles.iif_char(b.tj_calle, NULL, a.tj_provincia, b.tj_provincia),' +
                            ' utiles.iif_char(b.tj_calle, NULL, a.tj_codareatelefono, b.tj_codareatelefono),' +
                            ' utiles.iif_char(b.tj_calle, NULL, a.tj_telefono, b.tj_telefono),' +
                            ' UPPER(utiles.iif_char(UPPER(a.tj_nombre), ''-ALTA-'', NVL(b.tj_nombre, a.tj_nombre), a.tj_nombre))' +
                       ' FROM ctj_trabajador b' +
                      ' WHERE b.tj_cuil = :cuil1)' +
            ' WHERE tj_cuil = :cuil2';
          EjecutarSqlSTEx(sSql2, [aViejo, aNuevo]);

          // Va el segundo parámetro en -1 cuando no se modifican datos de un contrato en particular..
          sSql2 := 'BEGIN art.afiliacion.act_endosotrabajador(:cuil, :usuario); END;';
          EjecutarSqlSTEx(sSql2, [aNuevo, Sesion.UserID]);

          sSql2 := 'DELETE FROM ctj_trabajador WHERE tj_cuil = :cuil';
          EjecutarSqlSTEx(sSql2, [aViejo]);
        except
          on E: Exception do
            ErrorMsg(E, 'Informe a sistemas del error producido.' + CRLF + sSql2);
        end;
      end;
    end
    else if aCampo = 'CUIT' then
      sSql := sSql + 'AND all_tables.table_name NOT IN (''ZMO_MOVIMIENTO'', ''ZRC_RESUMENCOBRANZA'', ''OSC_SALDOCONTABLE'', ''ZNR_NOMREC'', ''ZRN_RESNOM'', ''ZRA_RECLAMOAFIP'')';

    DoCambiarValor(sSql, SqlValue(aViejo), SqlValue(aNuevo));

    if aCampo = 'CUIT' then
    begin
      sSql2 := 'nomina.do_cambiocuitnomina(:cuit1, :cuit2);';
      EjecutarStoreSTEx(sSql2, [aViejo, aNuevo]);

      sSql2 := 'afiliacion.do_cambiocuit(:cuit1, :cuit2, :usuario);';
      EjecutarStoreSTEx(sSql2, [aViejo, aNuevo, Sesion.UserId]);
    end
    else if aCampo = 'CUIL' then
    begin
      sSql2 := 'emi.nominas.do_reprocesarddjjpcpcuil(:cuit1);';
      EjecutarStoreSTEx(sSql2, [aViejo]);
    end;

    sObservacionesAudit := aViejo + ' por ' + aNuevo;
    sOpcionAudit        := 'MODIFICACION DE CAMPOS';

    if aCampo = 'CUIT' then
    begin
      DoSincronizar_ZCT_Cotizaciones(aNuevo, False);
      DoSincronizar_ORC_ResumenCobranza(aNuevo, False);

      DoInsertarRegAuditLog(sOpcionAudit, 'MODIFICACION CUIT', sObservacionesAudit, False)
    end
    else if aCampo = 'CUIL' then
      DoInsertarRegAuditLog(sOpcionAudit, 'MODIFICACION CUIL', sObservacionesAudit, False);

    CommitTrans;

    Result := True;
  except
    on E: Exception do
    begin
      Rollback;
      raise Exception.Create(E.Message + CRLF + 'Error al intentar realizar el cambio');
    end;
  end;
end;

{ Cambia el Cuil Viejo por el Cuil Nuevo en todas las tablas de la base de datos donde éste sea usado }
function DoCambiarCuilBaseDatos(aCuilViejo, aCuilNuevo: String; var aMensajeError: String): Boolean;
var
  sCuilNuevoSinGuiones: String;
  sCuilViejoSinGuiones: String;
begin
  Result := False;

  sCuilViejoSinGuiones := SacarGuiones(aCuilViejo);
  sCuilNuevoSinGuiones := SacarGuiones(aCuilNuevo);

  if sCuilViejoSinGuiones = sCuilNuevoSinGuiones then
    aMensajeError := 'El CUIL actual es igual al nuevo.'
  //else if IsCuilExistenteEnEmpresa( sCuilNuevoSinGuiones ) then
  //  sMensajeError := 'El CUIL nuevo ya existe como CUIT.'
  else
    Result := DoCampoCambiarValorBaseDatos('CUIL', sCuilViejoSinGuiones, sCuilNuevoSinGuiones);
end;

{ Cambia el Cuit Viejo por el Cuit Nuevo en todas las tablas de la base de datos donde éste sea usado }
function DoCambiarCuitBaseDatos(aCuitViejo, aCuitNuevo: String; var aMensajeError: String): Boolean;
var
  sCuitNuevoSinGuiones: String;
  sCuitViejoSinGuiones: String;
  sSql: String;
begin
  Result := False;

  sCuitViejoSinGuiones := SacarGuiones(aCuitViejo);
  sCuitNuevoSinGuiones := SacarGuiones(aCuitNuevo);

  if sCuitViejoSinGuiones = sCuitNuevoSinGuiones then
    aMensajeError := 'El CUIT actual es igual al nuevo.'
  else
  begin
    sSql :=
      'SELECT 1' +
       ' FROM aem_empresa' +
      ' WHERE em_cuit = :cuit';

    if ExisteSqlEx(sSql, [sCuitNuevoSinGuiones]) then
      aMensajeError := 'El CUIT nuevo ya existe.'
    else
      Result := DoCampoCambiarValorBaseDatos('CUIT', sCuitViejoSinGuiones, sCuitNuevoSinGuiones);
  end;
end;

procedure DoCambioMasivoCuilBaseDatos(aTabla, aCampoCuilVie, aCampoCuilNue: String);
var
  bError: Boolean;
  sMensajeError: String;
  sSql: String;
begin
  if MsgBox('La operación puede tardar algunos minutos. ¿ Confirma el cambio masivo de CUIL ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    bError := False;

    sSql :=
      'SELECT ' + aCampoCuilVie + ', ' + aCampoCuilNue +
       ' FROM ' + aTabla +
   ' ORDER BY ' + aCampoCuilVie;

    with GetQuery(sSql) do
    try
      while not Eof do
      begin
        if DoCambiarCuilBaseDatos(FieldByName(aCampoCuilVie).AsString, FieldByName(aCampoCuilNue).AsString, sMensajeError) then
          Next
        else
        begin
          bError := True;

          if sMensajeError = '' then
            MsgBox('CUIL: ' + FieldByName(aCampoCuilVie).AsString, MB_ICONERROR)
          else
            MsgBox(sMensajeError + ' CUIL: ' + FieldByName(aCampoCuilVie).AsString, MB_ICONERROR);

          Break;
        end;
      end;
    finally
      Free;
    end;

    if not bError then
      MsgBox('La operación ha finalizado correctamente.', MB_ICONINFORMATION);
  end;
end;

procedure DoCambioMasivoCuilBaseDatos2;
var
  sMensajeError: String;
  sSql: String;
begin
  // ver tk 6784
  sSql :=
    'SELECT   *' +
       ' FROM nel.tk6784' +
      ' WHERE error IS NULL' +
   ' ORDER BY id';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      if DoCambiarCuilBaseDatos(FieldByName('viejocuil').AsString, FieldByName('nuevocuil').AsString, sMensajeError) then
      begin
        sSql :=
          'UPDATE nel.tk6784' +
            ' SET error = ''OK''' +
          ' WHERE ID = :id';
        EjecutarSqlEx(sSql, [FieldByName('id').AsInteger]);
      end
      else
      begin
        if sMensajeError <> '' then
        begin
          sSql :=
            'UPDATE nel.tk6784' +
              ' SET error = :error' +
            ' WHERE ID = :id';
          EjecutarSqlEx(sSql, [sMensajeError, FieldByName('id').AsInteger]);
        end;
      end;

      Next;
    end;
  finally
    Free;
  end;

  MsgBox('La operación ha finalizado correctamente.', MB_ICONINFORMATION);
end;

end.
