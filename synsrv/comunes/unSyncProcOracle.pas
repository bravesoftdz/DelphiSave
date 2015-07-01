unit unSyncProcOracle;

interface

uses SDEngine, unDmPrincipal, SysUtils, Classes, Db, DBClient, AnsiSQL, unSyncProc, StrUtils;

type
  TTablaFKSync = class (TObject)
  private
    FTablaRelacionada: string;
    FCampo: string;
  public
    property TablaRelacionada: string read FTablaRelacionada write FTablaRelacionada;
    property Campo: string read FCampo write FCampo;
    constructor Create(unTablaRelacionada, unCampo: string); overload;
  end;

  TListTablasFKSync = class (TObject)
    private
      FListTablas: TList;
    function getcount: integer;
    public
      procedure Add(unTabla: TTablaFKSync);
      function BuscarFk(unCampo: string): string;
      property Count: integer read getcount;
      constructor Create;
      destructor Destroy; override;
  end;

  TTablaSyncNovedades = class(TObject)
  private
    FCdsNovedades: TClientDataSet;
    FListaFk: TListTablasFKSync;
    FPrimaryKey: string;
    FNombreTabla: string;
    FSecuencia: string;
    FTipoObjeto: char;
    FCamposNovedades: string;
  public
    property CdsNovedades: TClientDataSet read FCdsNovedades write FCdsNovedades;
    property ListaFk: TListTablasFKSync read FListaFk write FListaFk;
    property PrimaryKey: string read FPrimaryKey write FPrimaryKey;
    property NombreTabla: string read FNombreTabla write FNombreTabla;
    property Secuencia: string read FSecuencia write FSecuencia;
    property TipoObjeto: char read FTipoObjeto write FTipoObjeto;
    property CamposNovedades: string read FCamposNovedades write FCamposNovedades;
    destructor Destroy; override;
  end;

  TListTablasSyncNovedades = class (TObject)
    private
      FListTablasSync: TList;
      function getcount: integer;
      function getTablaSyncNovedades(index: integer): TTablaSyncNovedades;
    public
      procedure Add(unTabla: TTablaSyncNovedades);
      property Count: integer read getcount;
      property TablaSyncNovedades[index: integer]: TTablaSyncNovedades read getTablaSyncNovedades;
      constructor Create;
      destructor Destroy; override;
      function ObtenerValorRelacionFK(TablaRelacionada: string; ValorSQL: integer): integer;
  end;


function ObtenerFkTabla(NombreTabla: string): TListTablasFKSync;

function ObtenerClavePrimariaOracle(NombreTabla: string): string;
function GetNextValue(Sequence : String): integer;

function GenerarSentenciaActualizacionOracle(posicion:integer; NextValue: Integer = -1; ListTablasSyncNovedades: TListTablasSyncNovedades = nil): string;
function ExisteRegistroOracle(posicion:integer; Valor: integer; ListTablasSyncNovedades: TListTablasSyncNovedades = nil): boolean;
function ArmarSelect(NombreTabla: string): string;
procedure ArmarArrayCampos(TablaSync: TTablaSync);
function AgregarFiltroUpdateNovedades(Campos: string; CdsNovedades: TClientDataSet): string;

implementation

uses ComObj;

function ObtenerClavePrimariaOracle(NombreTabla: string): string;
var
 qry: TSDQuery;
 SQL : string;
begin
  try
    Result := '';
    // Se generó esta tabla ya que buscar en la MetaData es muy lento
    SQL := 'SELECT CT_CAMPOORACLE ' +
    ' FROM LEGALES.LCT_CAMPOTABLASINCRONIZACION, LEGALES.LTS_TABLASINCRONIZACION ' +
    ' WHERE LEGALES.LTS_TABLASINCRONIZACION.ts_id = LEGALES.LCT_CAMPOTABLASINCRONIZACION.ct_idtablasincronizacion ' +
    ' AND LEGALES.LCT_CAMPOTABLASINCRONIZACION.ct_primarykey = ''S''' +
    ' AND LEGALES.LTS_TABLASINCRONIZACION.ts_tabla = ''' + trim(NombreTabla) + '''';
    //    qry := GetQuery('SELECT COLUMN_NAME FROM  ALL_CONS_COLUMNS WHERE TABLE_NAME = ''' + NombreTabla + ''' AND CONSTRAINT_NAME LIKE ''PK%''');
    qry := GetQuery(SQL);
    if qry.RecordCount = 0 then raise Exception.Create('No se encontró la clave primaria de la tabla' + NombreTabla)
    else result := qry.FieldByName('CT_CAMPOORACLE').AsString;
  finally
    if Assigned(qry) then begin
      qry.Close;
      qry.Free;
    end;
  end;
end;

function GetNextValue(Sequence : String): integer;
begin
  result := ValorSqlInteger('SELECT ' + Trim(Sequence) + '.NEXTVAL FROM DUAL', -1);
end;

function ObtenerFkTabla(NombreTabla: string): TListTablasFKSync;
var
 qry: TSDQuery;
 SQL: String;
begin
  Result := nil;
  try
    SQL := 'SELECT REL.ts_tabla, FO_CAMPOFK ' +
    'FROM LEGALES.LFO_FOREIGNTABLASINCRONIZACION FK, LEGALES.LTS_TABLASINCRONIZACION SYNC, LEGALES.LTS_TABLASINCRONIZACION REL ' +
    'WHERE SYNC.ts_id = FK.fo_idtablasincronizacion ' +
    'AND REL.ts_id =  FK.fo_idtablarelacionada ' +
    'AND SYNC.ts_tabla = ''' + NombreTabla + '''';
    qry := GetQuery(SQL);
    if qry.RecordCount > 0 then begin
      Result := TListTablasFKSync.Create;
      while not qry.Eof do begin
        Result.Add(TTablaFKSync.Create(qry.fieldbyname('TS_TABLA').AsString, qry.fieldbyname('FO_CAMPOFK').AsString));
        qry.Next;
      end;
    end;
  finally
    if Assigned(qry) then begin
      qry.Close;
      qry.Free;
    end;
  end;
end;

function AgregarFiltroUpdateNovedades(Campos: string; CdsNovedades: TClientDataSet): string;
var
  PosAnterior: integer;
begin
  PosAnterior := 1;
  result := '';
  while (PosEx(';', Campos, PosAnterior) <> 0) do begin
    if result = '' then begin
      Result := Result + ' AND (' + trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior)) + ' < '  +  SqlDateTime(CdsNovedades.fieldByname(trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior))).AsDateTime);
      Result := Result + ' OR (' + trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior)) + ' IS NULL AND ' + SqlDateTime(CdsNovedades.fieldByname(trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior))).AsDateTime) + ' IS NOT NULL )';
    end
    else begin
      Result := Result + ' OR ' + trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior)) + ' < ' +  SqlDateTime(CdsNovedades.fieldByname(trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior))).AsDateTime);
      Result := Result + ' OR (' + trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior)) + ' IS NULL AND ' + SqlDateTime(CdsNovedades.fieldByname(trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior))).AsDateTime) + ' IS NOT NULL )';
    end;
    PosAnterior := PosEx(';', Campos, PosAnterior)+1;
  end;

  if copy(Campos, PosAnterior, length(Campos)) <> '' then begin
    if Result = '' then begin
      Result := Result + ' OR ' + trim(copy(Campos, PosAnterior, length(Campos))) + ' < '  +  SqlDateTime(CdsNovedades.fieldByname(trim(copy(Campos, PosAnterior, length(Campos)))).AsDateTime);
      Result := Result + ' OR (' + trim(copy(Campos, PosAnterior, length(Campos))) + ' IS NULL AND ' + SqlDateTime(CdsNovedades.fieldByname(trim(copy(Campos, PosAnterior, length(Campos)))).AsDateTime) + ' IS NOT NULL )'
    end
    else begin
      Result := Result + ' OR (' + trim(copy(Campos, PosAnterior, length(Campos))) + ' IS NULL AND ' + SqlDateTime(CdsNovedades.fieldByname(trim(copy(Campos, PosAnterior, length(Campos)))).AsDateTime) + ' IS NOT NULL )';
      Result := Result + ' OR ' + trim(copy(Campos, PosAnterior, length(Campos))) + ' < '  +  SqlDateTime(CdsNovedades.fieldByname(trim(copy(Campos, PosAnterior, length(Campos)))).AsDateTime) + ')';
    end;
  end;

end;

{ TTablaFKSync }

constructor TTablaFKSync.Create(unTablaRelacionada, unCampo: string);
begin
  inherited Create;
  FTablaRelacionada := unTablaRelacionada;
  FCampo := unCampo;
end;

{ TListTablasFKSync }

procedure TListTablasFKSync.Add(unTabla: TTablaFKSync);
begin
  FListTablas.Add(unTabla);
end;

function TListTablasFKSync.BuscarFk(unCampo: string): string;
var
  i: integer;
begin
  i:= 0;
  Result := '';
  while (i <= FListTablas.Count-1) and (TTablaFKSync(FListTablas.Items[i]).Campo <> unCampo) do
    i:= i + 1;
  if (i <= FListTablas.Count-1) then result := TTablaFKSync(FListTablas.Items[i]).TablaRelacionada;
end;

constructor TListTablasFKSync.Create;
begin
  inherited Create;
  FListTablas := TList.Create;
end;

destructor TListTablasFKSync.Destroy;
var
  i: integer;
begin
  for i:=0 to FListTablas.Count -1 do
    TTablaFKSync(FListTablas[i]).Free;
  FListTablas.Clear;
  FListTablas.Free;
  inherited;
end;

function GenerarSentenciaActualizacionOracle(posicion:integer; NextValue: Integer; ListTablasSyncNovedades: TListTablasSyncNovedades): string;
var
  j: integer;
  SQL, SQLValues, TablaRelacionada: string;
  prueba : TFieldType;
begin
    SQL:= '';
    SQLValues := '';

    if NextValue <> -1 then begin //es un Insert
      with ListTablasSyncNovedades.TablaSyncNovedades[posicion] do begin
        for j :=0 to cdsNovedades.FieldCount - 1 do begin

          if (cdsNovedades.Fields[j].DisplayName <> 'ID_ORACLE') then begin

            if SQL = '' then SQL := 'INSERT INTO ' + NombreTabla + '(' + cdsNovedades.Fields[j].DisplayName
            else SQL := SQL + ', ' + cdsNovedades.Fields[j].DisplayName;

            if PrimaryKey = cdsNovedades.Fields[j].DisplayName then begin
                  if SQLValues = '' then  SQLValues := 'VALUES('
                  else SQLValues := SQLValues + ', ';
                  SQLValues := SQLValues + SqlInt(NextValue);
            end
            else begin
              if (ListTablasSyncNovedades.TablaSyncNovedades[posicion].ListaFk <> nil) then begin
                TablaRelacionada := ListaFk.BuscarFk(cdsNovedades.Fields[j].DisplayName);
                if TablaRelacionada <> '' then begin
                  if SQLValues = '' then  SQLValues := 'VALUES('
                  else SQLValues := SQLValues + ', ';
                  SQLValues := SQLValues + SqlInt(ListTablasSyncNovedades.ObtenerValorRelacionFK(TablaRelacionada, cdsNovedades.Fields[j].AsInteger));
                  continue;
                end;
              end;

              case cdsNovedades.Fields[j].DataType of
                ftSmallint, ftInteger, ftLargeint, ftWord: begin
                  if SQLValues = '' then  SQLValues := 'VALUES('
                  else SQLValues := SQLValues + ', ';
                  SQLValues := SQLValues + SqlInt(cdsNovedades.Fields[j].AsInteger, true);
                end;
                ftString, ftWideString: begin
                  if SQLValues = '' then  SQLValues := 'VALUES('
                  else SQLValues := SQLValues + ', ';
                  SQLValues := SQLValues + SqlString(cdsNovedades.Fields[j].AsString, true, true);
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
                ftFloat, ftBCD: begin
                  if SQLValues = '' then  SQLValues := 'VALUES('
                  else SQLValues := SQLValues + ', ';
                  SQLValues := SQLValues + SqlNumber(cdsNovedades.Fields[j].AsFloat);
                end;
                ftBlob: begin
                  if SQLValues = '' then  SQLValues := 'VALUES('
                  else SQLValues := SQLValues + ', ';
                  SQLValues := SQLValues + ':' + cdsNovedades.Fields[j].DisplayName;
                end;
              end;
            end;
          end;
        end;
      end;
      result := SQL + ') ' + SQLValues + ')'
    end
    else begin
      with ListTablasSyncNovedades.TablaSyncNovedades[posicion] do begin
        for j :=0 to cdsNovedades.FieldCount - 1 do begin

          if (cdsNovedades.Fields[j].DisplayName <> 'ID_ORACLE') then begin

            if SQL = '' then SQL := SQL + 'UPDATE ' + NombreTabla + ' SET '
            else SQL := SQL + ', ';

            SQL := SQL + cdsNovedades.Fields[j].DisplayName;

            case cdsNovedades.Fields[j].DataType of
              ftSmallint, ftInteger, ftLargeint, ftWord: begin
                SQL := SQL + ' = ' + SqlInt(cdsNovedades.Fields[j].AsInteger, true);
              end;
              ftString, ftWideString: begin
                SQL := SQL + ' = ' + SqlString(cdsNovedades.Fields[j].AsString, true, true);
              end;
              ftBoolean: begin
                SQL := SQL + ' = ' + SqlBoolean(cdsNovedades.Fields[j].AsBoolean);
              end;
              ftDate: begin
                SQL := SQL + ' = ' + SqlDate(cdsNovedades.Fields[j].AsDateTime);
              end;
              ftDateTime: begin
                SQL := SQL + ' = ' + SqlDateTime(cdsNovedades.Fields[j].AsDateTime);
              end;
              ftTime: begin
                SQL := SQL + ' = ' + SqlTime(cdsNovedades.Fields[j].AsDateTime);
              end;
              ftFloat, ftBCD: begin
                SQL := SQL + ' = ' + SqlNumber(cdsNovedades.Fields[j].AsFloat, true);
              end;
              ftBlob, ftVarBytes, ftBytes: begin
                SQL := SQL + ' = ' + ':' + cdsNovedades.Fields[j].DisplayName;;
              end;
            end;
          end;
        end;
        //FIXME VER SI LA CLAVE PRIMARIA ES COMPUESTA
        result := SQL + ' WHERE ' + PrimaryKey + ' = ' + cdsNovedades.FieldByName(PrimaryKey).AsString;
        //Esto es para que actualice solo si lo que viene del SQL Server es más nuevo
        result := result + ' ' + AgregarFiltroUpdateNovedades(CamposNovedades, CdsNovedades);
      end;
  end;
end;

function ExisteRegistroOracle(posicion:integer; Valor: integer; ListTablasSyncNovedades: TListTablasSyncNovedades = nil): boolean;
var
 qry: TSDQuery;
 SQL: string;
begin
  Result := false;
  try
    SQL := 'SELECT 1 ' +
    ' FROM ' +  ListTablasSyncNovedades.TablaSyncNovedades[posicion].NombreTabla +
    ' WHERE ' +  ListTablasSyncNovedades.TablaSyncNovedades[posicion].PrimaryKey + ' = ' + SqlInt(Valor);
    qry := GetQuery(SQL);
    result := qry.RecordCount > 0;
  finally
    if Assigned(qry) then begin
      qry.Close;
      qry.Free;
    end;
  end;
end;

function ArmarSelect(NombreTabla: string): string;
var
 qry: TSDQuery;
 SQL: string;
begin
  Result := ' ';
  try
    SQL := 'SELECT LEGALES.LCT_CAMPOTABLASINCRONIZACION.ct_campooracle, LEGALES.LCT_CAMPOTABLASINCRONIZACION.ct_camposqlserver ' +
           ' FROM LEGALES.LCT_CAMPOTABLASINCRONIZACION,  LEGALES.LTS_TABLASINCRONIZACION ' +
           ' WHERE LEGALES.LCT_CAMPOTABLASINCRONIZACION.ct_idtablasincronizacion = LEGALES.LTS_TABLASINCRONIZACION.ts_id ' +
           ' AND LEGALES.LTS_TABLASINCRONIZACION.ts_tabla = '''  + Trim(NombreTabla)  + '''';
    qry := GetQuery(SQL);
    if qry.RecordCount > 0 then begin
      while not qry.Eof do begin
        Result := Result + qry.fieldbyname('ct_campooracle').AsString + ' as ' + qry.fieldbyname('ct_camposqlserver').AsString + ',';
        qry.next;
      end;
      Delete(Result, length(Result), 1);
      Result := Result + ' ';
    end
    else Result := ' * ';
  finally
    if Assigned(qry) then begin
      qry.Close;
      qry.Free;
    end;
  end;
end;

procedure ArmarArrayCampos(TablaSync: TTablaSync);
var
 qry: TSDQuery;
 SQL: string;
 i: integer;
 CamposOracle, CamposSqlServer: TStringArray;
begin
  try
    SQL := 'SELECT LEGALES.LCT_CAMPOTABLASINCRONIZACION.ct_campooracle, LEGALES.LCT_CAMPOTABLASINCRONIZACION.ct_camposqlserver ' +
           ' FROM LEGALES.LCT_CAMPOTABLASINCRONIZACION,  LEGALES.LTS_TABLASINCRONIZACION ' +
           ' WHERE LEGALES.LCT_CAMPOTABLASINCRONIZACION.ct_idtablasincronizacion = LEGALES.LTS_TABLASINCRONIZACION.ts_id ' +
           ' AND LEGALES.LTS_TABLASINCRONIZACION.ts_tabla = '''  + Trim(TablaSync.NombreTablaOracle)  + '''';
    qry := GetQuery(SQL);
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
    if Assigned(qry) then begin
      qry.Close;
      qry.Free;
    end;
  end;
end;


function TListTablasFKSync.getcount: integer;
begin
  result := FListTablas.Count;
end;

{ TListTablasSyncNovedades }

procedure TListTablasSyncNovedades.Add(unTabla: TTablaSyncNovedades);
begin
  FListTablasSync.Add(unTabla);
end;

constructor TListTablasSyncNovedades.Create;
begin
  FListTablasSync := TList.Create;
end;

destructor TListTablasSyncNovedades.Destroy;
var
  i: integer;
begin
  for i:=0 to FListTablasSync.Count -1 do
    TTablaSyncNovedades(FListTablasSync[i]).Free;
  FListTablasSync.Clear;
  FListTablasSync.Free;
  inherited;
end;

function TListTablasSyncNovedades.getcount: integer;
begin
  result := FListTablasSync.Count;
end;

function TListTablasSyncNovedades.getTablaSyncNovedades(
  index: integer): TTablaSyncNovedades;
begin

  if index >= FListTablasSync.Count then raise Exception.Create('Indice de tabla de novedades fuera de Rango.');
  result := TTablaSyncNovedades(FListTablasSync[index]);
end;


function TListTablasSyncNovedades.ObtenerValorRelacionFK(
  TablaRelacionada: string; ValorSQL: integer): integer;
var
  i: integer;
begin
  while (i <= FListTablasSync.Count-1) and (TablaRelacionada <> (TTablaSyncNovedades(FListTablasSync.Items[i]).NombreTabla)) do
    i:= i + 1;

  if (i > FListTablasSync.Count-1) then raise Exception.Create('No se encuentra la tabla relacionada.');

  if TablaSyncNovedades[i].CdsNovedades.Locate(TablaSyncNovedades[i].PrimaryKey, ValorSQL,[]) then begin
    Result := TablaSyncNovedades[i].CdsNovedades.FieldByName('ID_ORACLE').AsInteger;
  end
  else Result := ValorSQL;
    //raise Exception.Create('No se encuentra el valor insertado por Oracle de la tabla relacionada.');

end;

{ TTablaSyncNovedades }

destructor TTablaSyncNovedades.Destroy;
begin
  FCdsNovedades.Free;
  ListaFk.Free;
  inherited;
end;

end.
