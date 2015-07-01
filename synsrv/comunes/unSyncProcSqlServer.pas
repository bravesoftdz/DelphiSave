unit unSyncProcSqlServer;

interface

uses SysUtils, DB, ADODB, SyncSrvIntf, DBClient, AnsiSql, unSyncProc;

function ObtenerClavePrimariaSql(conn: TADOConnection; NombreTabla: string): string;
function GetNextValue(conn: TADOConnection;TablaSync: TTablaSync): integer;
function GenerarSentenciaActualizacionSQL(cdsNovedades: TClientDataSet; NombreTabla: string; PrimaryKey: string = ''; TieneIdOracle: boolean = false): string;
function ArmarSelect(TablaSync: TTablaSync): string;
function AgregarLockSql(Tipo: char): string;
procedure ArmarArrayCampos(conn: TADOConnection; TablaSync: TTablaSync);
function GetParam(conn: TADOConnection; const Clave : string) : variant;

Const
 ARCHIVO_LOG_WEBSERVICE = 'ARCHIVO_LOG_WEBSERVICE';

implementation


function ObtenerClavePrimariaSql(conn: TADOConnection; NombreTabla: string): string;
var
  Qry: TADOQuery;
begin
  Qry := TADOQuery.Create(nil);
  Result := '';
  try
    Qry.Connection := conn;
    Qry.SQL.Add('use ' + Trim(ExtraerBase(NombreTabla)));
    Qry.ExecSQL;
    Qry.SQL.Clear;
    Qry.SQL.Add('sp_pkeys ' + Trim(EliminarBase(NombreTabla)));
    Qry.Open;
    if Qry.RecordCount = 0 then raise Exception.Create('Error al obtener la clave primaria de la tabla' + Trim(NombreTabla));
    while not Qry.Eof do begin
      if Result <> '' then Result := Result + ';';
      result := result + Qry.FieldByName('COLUMN_NAME').AsString;
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

function ArmarSelect(TablaSync: TTablaSync): string;
var
  i: integer;
begin
  Result := ' ';
  if Length(TablaSync.CamposOracle) > 0 then begin
    for i:=0 to Length(TablaSync.CamposOracle)-1 do
      Result := Result + TablaSync.CamposSqlServer[i] + ' as ' + TablaSync.CamposOracle[i] + ',';
    Delete(Result, length(Result), 1);
    if TablaSync.Tipo = TABLA_TIPO_AMBAS then Result := Result + ', ID_ORACLE';
    Result := Result + ' ';
  end
  else Result := ' * ';
end;

function AgregarLockSql(Tipo: char): string;
begin
    result := '';
//    if Tipo = TABLA_TIPO_AMBAS then Result := ' WITH (HOLDLOCK)';
    if Tipo = TABLA_TIPO_AMBAS then Result := ' WITH (ROWLOCK)';
end;

function GetNextValue(conn: TADOConnection; TablaSync: TTablaSync): integer;
var
  Qry: TADOQuery;
begin
  Qry := TADOQuery.Create(nil);
  Qry.Connection := conn;
  Result := -1;
  try
    Qry.SQL.Add('DECLARE @Result INT; EXEC @Result = SEQ_NEXT_VAL ''' + Trim(TablaSync.Secuencia) + '''; SELECT @Result;');
    Qry.Open;
    if Qry.RecordCount = 0 then raise Exception.Create('Error al obtener la secuencia ' + Trim(TablaSync.Secuencia) + ' de la tabla ' + trim(TablaSync.NombreTablaSqlServer));
    result := Qry.Fields[0].AsInteger;
  finally
    if Assigned(Qry) then Qry.Free;
  end;
end;

function GenerarSentenciaActualizacionSQL(cdsNovedades: TClientDataSet; NombreTabla: string; PrimaryKey: string; TieneIdOracle: boolean): string;
var
  j: integer;
  SQL, SQLValues, ValorPk: string;
begin
    SQL:= '';
    SQLValues := '';

      for j :=0 to cdsNovedades.FieldCount - 1 do begin

        if (cdsNovedades.Fields[j].DisplayName = PrimaryKey) then ValorPk := SqlInt(cdsNovedades.Fields[j].AsInteger);

        if SQL = '' then SQL := 'INSERT INTO ' + NombreTabla + '(' + cdsNovedades.Fields[j].DisplayName
        else SQL := SQL + ', ' + cdsNovedades.Fields[j].DisplayName;

          case cdsNovedades.Fields[j].DataType of
            ftSmallint, ftInteger, ftLargeint, ftWord: begin
              if SQLValues = '' then  SQLValues := 'VALUES('
              else SQLValues := SQLValues + ', ';
              SQLValues := SQLValues + SqlInt(cdsNovedades.Fields[j].AsInteger);
            end;
            ftString, ftWideString: begin
              if SQLValues = '' then  SQLValues := 'VALUES('
              else SQLValues := SQLValues + ', ';
              SQLValues := SQLValues + EliminarCaracteresEspeciales(SqlString(cdsNovedades.Fields[j].AsString, true, true));
            end;
            ftBoolean: begin
              if SQLValues = '' then  SQLValues := 'VALUES('
              else SQLValues := SQLValues + ', ';
              SQLValues := SQLValues + SqlBoolean(cdsNovedades.Fields[j].AsBoolean);
            end;
            ftDate: begin
              if SQLValues = '' then  SQLValues := 'VALUES('
              else SQLValues := SQLValues + ', ';
              SQLValues := SQLValues + SqlDate(cdsNovedades.Fields[j].AsDateTime);
            end;
            ftDateTime: begin
              if SQLValues = '' then  SQLValues := 'VALUES('
              else SQLValues := SQLValues + ', ';
              SQLValues := SQLValues + SqlDateTime(cdsNovedades.Fields[j].AsDateTime);
            end;
            ftTime: begin
              if SQLValues = '' then  SQLValues := 'VALUES('
              else SQLValues := SQLValues + ', ';
              SQLValues := SQLValues + SqlTime(cdsNovedades.Fields[j].AsDateTime);
            end;
            ftFloat: begin
              if SQLValues = '' then  SQLValues := 'VALUES('
              else SQLValues := SQLValues + ', ';
              SQLValues := SQLValues + SqlNumber(cdsNovedades.Fields[j].AsFloat);
            end;
            ftBlob, ftOraBlob: begin
              if SQLValues = '' then  SQLValues := 'VALUES('
              else SQLValues := SQLValues + ', ';
              SQLValues := SQLValues + ':' + cdsNovedades.Fields[j].DisplayName;
            end;
          end;
      end;
      if TieneIdOracle then begin
        SQL := SQL + ',ID_ORACLE';
        SQLValues := SQLValues + ',' + ValorPk;
      end;
      result := SQL + ') ' + SQLValues + ')'
end;

procedure ArmarArrayCampos(conn: TADOConnection; TablaSync: TTablaSync);
var
 qry: TADOQuery;
 SQL: string;
 i: integer;
 CamposOracle, CamposSqlServer: TStringArray;
begin
  qry:= TADOQuery.Create(nil);
  try
    qry.Connection := conn;
    SQL := 'SELECT SINCRONIZACION..LCT_CAMPOTABLASINCRONIZACION.ct_campooracle, SINCRONIZACION..LCT_CAMPOTABLASINCRONIZACION.ct_camposqlserver ' +
           ' FROM SINCRONIZACION..LCT_CAMPOTABLASINCRONIZACION,  SINCRONIZACION..LTS_TABLASINCRONIZACION ' +
           ' WHERE SINCRONIZACION..LCT_CAMPOTABLASINCRONIZACION.ct_idtablasincronizacion = SINCRONIZACION..LTS_TABLASINCRONIZACION.ts_id ' +
           ' AND SINCRONIZACION..LTS_TABLASINCRONIZACION.ts_tabla = '''  + Trim(TablaSync.NombreTablaSqlServer)  + '''';
    qry.SQL.Add(SQL);
    qry.Open;
    SetLength(CamposOracle, qry.RecordCount);
    SetLength(CamposSqlServer, qry.RecordCount);
    i:= 0;
    if qry.RecordCount > 0 then begin
      while not qry.Eof do begin
        CamposOracle[i] := qry.fieldbyname('ct_campooracle').AsString;
        CamposSqlServer[i] := qry.fieldbyname('ct_camposqlserver').AsString;
        i:= i + 1;
        qry.next;
      end;
    end;
    TablaSync.CamposOracle := CamposOracle;
    TablaSync.CamposSqlServer := CamposSqlServer;
  finally
    qry.Close;
    qry.Free;
  end;
end;

function GetParam(conn: TADOConnection; const Clave : string) : variant;
var
  Qry: TADOQuery;
begin
  Qry := TADOQuery.Create(nil);
  Result := -1;
  try
    Qry.Connection := conn;
    Qry.SQL.Add('select pa_valor from sincronizacion..spa_parametro where pa_clave =  ''' + trim(Clave) + '''');
    Qry.Open;
    result := Qry.Fields[0].Value;
    if Result = '' then raise Exception.Create('El parámetro ' + trim(clave) + 'no está definido.');
  finally
    Qry.Free;
  end;
end;

end.
