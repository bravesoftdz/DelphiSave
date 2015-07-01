unit unRptComunes;

{*******************************************
   rutinas comunes para los reportes
            DFG - 12/08/2011
 *******************************************}

interface

uses math, undmprincipal, ansisql, general, strfuncs, unsesion,
  uncomunes, unvisualizador, Graphics, Classes, SysUtils, unPrincipal;

  function LugarImpresion(idautorizacion: integer; sUsuario: String = ''): String;
  function GetFechaAprobacion(idautorizacion: integer): TDateTime;
  procedure DoActualizarImpresionAutorizacion(idAutorizacion: Integer; Accion: TResultados = []);
  function DomicilioDelegacion(APicture: TPicture; Siniestro: Integer = 0; IdExpediente: Integer = 0): String;
  function GetRelaciones(IdAutorizacion: integer) :String;
  function GetCantSesiones(idAutorizacion: integer): Integer;

implementation


function LugarImpresion(idautorizacion: integer; sUsuario: String = ''): String;
begin
  if sUsuario = '' then
    sUsuario := ValorSQLEx('SELECT au_usuapro' +
                            ' FROM sau_autorizaciones' +
                           ' WHERE au_id = :idauto ', [idautorizacion]);

  if (sUsuario <> '') then
    Result := ValorSqlEx('SELECT IIF_CHAR(lg_localidad, :V1, INITCAP(:V2), INITCAP(lg_localidad))' +
                          ' FROM dlg_delegaciones, usc_sectores, use_usuarios' +
                         ' WHERE se_sector = sc_codigo' +
                           ' AND lg_codigo = sc_delegacion' +
                           ' AND se_usuario = :Usuario', ['CAPITAL FEDERAL', 'BUENOS AIRES', sUsuario])
  else
    Result := 'Buenos Aires';
end;


function GetFechaAprobacion(idautorizacion: integer): TDateTime;
begin
  Result := ValorSQLDateTimeEx('SELECT au_fechapro' +
                                ' FROM sau_autorizaciones' +
                               ' WHERE au_id = :idauto ', [idautorizacion]);
end;


procedure DoActualizarImpresionAutorizacion(idAutorizacion: Integer; Accion: TResultados = []);
var
  sSql, estado: String;
  bEsFechaImprNula, bEsFechaMailNula, EsFechaMailAnulNula: boolean;
begin
  sSql := ' SELECT au_fechaimpresion, au_fechamail, AU_FECHAENVIOANUL, au_estado ' +
            ' FROM art.sau_autorizaciones ' +
           ' WHERE au_id = :idautorizacion ';

  with GetQueryEx(sSql, [idAutorizacion]) do
    try
      bEsFechaImprNula := (FieldByName('AU_FECHAIMPRESION').IsNull);
      bEsFechaMailNula := (FieldByName('AU_FECHAMAIL').IsNull);
      EsFechaMailAnulNula := (FieldByName('AU_FECHAENVIOANUL').IsNull);
      estado := FieldByName('AU_ESTADO').AsString;
    finally
      Free;
    end;

  if estado = 'U' then     //aprobación anulada
  begin                                                        //DGASTAL 21/07/2011
    if (rMail in Accion) and EsFechaMailAnulNula then
    begin
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET AU_FECHAENVIOANUL = sysdate, AU_USUENVIOANUL = :usuario ' +
        ' WHERE au_id = :idautorizacion ';
      EjecutarSqlEX(sSql, [Sesion.UserID, idAutorizacion]);
    end;
  end
  else
  begin
    if (rImpresora in Accion) and bEsFechaImprNula then
    begin
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET au_fechaimpresion = trunc(sysdate) ' +
        ' WHERE au_id = :idauto ';
      EjecutarSqlEx(sSql, [idautorizacion]);
    end;

    if (rMail in Accion) and bEsFechaMailNula then
    begin
      sSql :=
        'UPDATE sau_autorizaciones' +
          ' SET au_fechamail = trunc(sysdate) ' +
        ' WHERE au_id = :idautorizacion ';
      EjecutarSqlEx(sSql, [idAutorizacion]);
    end;
  end;

end;


function DomicilioDelegacion(APicture: TPicture; Siniestro: Integer = 0; IdExpediente: Integer = 0): String;
var
  sqlResults: TStringList;
  sSql: String;
begin
  sSql :=
    'SELECT lg_logo, initcap(utiles.armar_domicilio(lg_calle, lg_numero, lg_piso, lg_departamento) || '' '' ||' +
          ' utiles.armar_localidad(lg_cpostal, '''', lg_localidad, lg_provincia)) direccion,' +
          ' utiles.armar_telefono(lg_codareatelefono, null, lg_telefono) telefono,' +
          ' IIF_CHAR(lg_localidad, ''CAPITAL FEDERAL'', ''Buenos Aires'', InitCap(lg_localidad)), ' + SQL_ACTUALDATE +
     ' FROM dlg_delegaciones, usc_sectores' +
    ' WHERE sc_delegacion = lg_codigo' +
      ' AND sc_codigo = ''' + Sesion.Sector + '''';
  sqlResults := ValoresColSql(sSql);
  try
    if SqlResults[0] = 'M' then
      APicture.Assign(frmPrincipal.imgLogoMutual.Picture)
    else begin
      if (IdExpediente <> 0) then
      begin
        if Is_SiniestroDeGobernacion(IdExpediente) then
          APicture.Assign(frmPrincipal.imgLogoGob.Picture)
        else
          APicture.Assign(frmPrincipal.imgLogo.Picture);
      end
      else if (Siniestro <> 0) then
      begin
        if Is_SiniestroGobernacion(Siniestro) then
          APicture.Assign(frmPrincipal.imgLogoGob.Picture)
        else
          APicture.Assign(frmPrincipal.imgLogo.Picture);
      end;
    end;

    Result := sqlResults[1] + #13 + #10 + sqlResults[2];
  finally
    sqlResults.Free;
  end;
end;

function GetRelaciones(IdAutorizacion: integer) :String;
var
  sSql, sTmp :String;
begin
  sTmp := '';
  sSql := 'SELECT on_capitulo, on_codigo, on_descripcion ' +
           ' FROM art.son_nomenclador, art.ppa_prestacionesxautorizacion ' +
          ' WHERE on_id = pa_idnomenclador ' +
            ' AND pa_fechabaja IS NULL ' +
            ' AND on_fechabaja IS NULL ' +
            ' AND pa_principal = ''N'' ' + 
            ' AND pa_idautorizacion = :IdAut ';
  with GetQueryEx(sSql, [IdAutorizacion]) do
  try
    while not Eof do
    begin
      sTmp := sTmp + FieldByName('on_capitulo').AsString + ' ' +
                     FieldByName('on_codigo').AsString + ' ' +
                     FieldByName('on_descripcion').AsString + chr(13);
      Next;
    end;
  finally
    Free;
  end;
  Result := sTmp;
end;


function GetCantSesiones(idAutorizacion: integer): Integer;
var
  CantSesiones: Integer; ssql, cantidad, prestador, nomenclador,
  capitulo, codigo, fecha: string;
begin
  ssql := 'SELECT nvl(au_identifapro, au_identifprestador) prestador, au_pres_nomenclador, ' +
                ' au_pres_capitulo, au_pres_codigo, au_fechapro, NVL (au_cantapro, au_cantidad) cantidad ' +
           ' FROM art.sau_autorizaciones ' +
          ' WHERE au_id = :idautorizacion ';

  with GetQueryEx(ssql, [idAutorizacion]) do
  begin
    cantidad := fieldbyname('cantidad').AsString;
    prestador := fieldbyname('prestador').AsString;
    nomenclador := fieldbyname('au_pres_nomenclador').AsString;
    capitulo := fieldbyname('au_pres_capitulo').AsString;
    codigo := fieldbyname('au_pres_codigo').AsString;
    fecha := fieldbyname('au_fechapro').AsString;
  end;

  if nomenclador = '' then   // by NWK, 27/11/03, para la cant. de sesiones tomar la parte entera por exceso
    CantSesiones := Ceil(StrToFloat(cantidad))
  else
  begin
    if ValorSqlEx(' SELECT COUNT(*) ' +
                    ' FROM svp_valorprestador ' +
                    'WHERE VP_PRESTADOR(+) = :prest AND VP_NOMENCLADOR(+) = :nomen ' +
                     ' AND VP_CAPITULO(+) = :cap AND VP_CODIGO(+) = :cod AND VP_NOMENCLADOR = ''1'' ' +
                     ' AND VP_CAPITULO <> ''PP'' AND vp_fechabaja IS NULL ', [prestador, nomenclador, capitulo, codigo]) > 0 then
      CantSesiones := Ceil(StrToFloat(cantidad) * ValorSqlIntegerEx('SELECT VP_SESIONES ' +
                                                                    ' FROM SVP_VALORPRESTADOR ' +
                                                                   ' WHERE VP_PRESTADOR(+) = :prest AND VP_NOMENCLADOR(+) = :nomen ' +
                                                                     ' AND VP_CAPITULO(+) = :cap and vp_codigo(+) = :cod ' +
                                                                     ' AND NVL(:fechaapro, SYSDATE) BETWEEN VP_VIGENCIADESDE ' +
                                                                     ' AND NVL(GREATEST(VP_FECHAMODIF,VP_VIGENCIAHASTA), SYSDATE) ' +
                                                                     ' AND vp_fechabaja IS NULL ' +
                                                                ' ORDER BY VP_VIGENCIAHASTA DESC', [prestador, nomenclador, capitulo, codigo, fecha]))
    else
      CantSesiones := Ceil(StrToFloat(cantidad) * ValorSqlIntegerEx('SELECT ON_SESIONES ' +
                                                                    ' FROM SON_NOMENCLADOR ' +
                                                                   ' WHERE ON_NOMENCLADOR(+) = :nomen AND ON_CAPITULO(+) = :cap ' +
                                                                     ' AND ON_CODIGO(+) = :cod', [nomenclador, capitulo, codigo]));
  end;
  
  if CantSesiones = 0 then
    CantSesiones := strtoint(cantidad);

  Result := CantSesiones;
end;


end.
