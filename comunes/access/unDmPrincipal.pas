unit unDmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomDataModule, Db, SDEngine, ArtDatabase, AnsiSQL, LogFile, unART;

type
  TdmPrincipal = class(TdmCustomDataModule)
  protected
    function ConfigureDataBase: Boolean; override;
  public
    property  LogFile: TLogFile read ALogFile;
  end;

  procedure ApplyUpdates(const DataSets: array of TSDDataSet);

  procedure ArrayColSql(ASql: string; var AResults: array of String);

  procedure ArraySql(ASql: string; var AResults: array of String);

  procedure BeginTrans( CheckTrans : Boolean = False );

  procedure BlobSql( ASql : StringSql; AStream  : TStream ); overload;

  procedure BlobSql( ASql : StringSql; AStrings : TStrings ); overload;

  procedure CheckAndOpenQuery(AQuery : TSDQuery; ASql : String = ''; AsSelect : Boolean = True; AParams: TParams = Nil); { Abre el Query sin registros a modo Checkeo de Sintaxis }

  procedure CommitTrans( CheckTrans : Boolean = False );

  { Acá se definen todas las funciones, para que puedan ser utilizadas sin pertenecer al DataModule }

  { CopySqlClp copia al portapapeles el texto pasado como parámetro solo cuando la aplicación ha sido ejecutada con el
    parámetro /CLP }
  procedure CopySqlClp( Text : string);

  { DBDate retorna la Fecha de la base de datos }
  function DBDate : TDate;

  { DBDateTime retorna la Hora y Fecha de la base de datos }
  function DBDateTime : TDateTime;

  function DBTime : TTime;

  procedure DoAplicarUpdates(Query: TSDQuery);

  { Devuelve todos valores de los campos del primer registro en un Array dinámico }
  procedure DynArrayColSql(ASql: string; var AResults: TDynStringArray);

  { Devuelve todos los valores del primer campo del query en un array dinámico }
  procedure DynArraySql(ASql: string; var AResults: TDynStringArray; MaxReg : Integer = -1);

  { Devuelve TODO el set de resultados de la consulta en un Array Dinámico de dos dimensiones }
  procedure DynMatrixSql(ASql: string; var AResults: TDynStringMatrix; MaxReg : Integer = -1);

  procedure EjecutarSql( ASql : String );

  procedure EjecutarSqlEx(ASql: StringSql; AValues: array of TVarRec);

  procedure EjecutarSqlST( ASql : String; TransactionMode : TTransactionMode = tmNone );

  { Ejecuta la consulta pasada como parámetro sin manejar transacciones, acepta parámetros }
  procedure EjecutarSqlSTEx(ASql: StringSql; AValues: array of TVarRec; TransactionMode: TTransactionMode = tmNone);

  procedure EjecutarStore( ASql : StringSql );

  procedure EjecutarStoreEx(ASql: StringSql; AValues: array of TVarRec);

  { Ejecuta el store procedure pasado como parámetro sin manejar transacciones }
  procedure EjecutarStoreST( ASql : StringSql );

  procedure EjecutarStoreSTEx(ASql: StringSql; AValues: array of TVarRec);

  { ExisteSql retorna True si el query pasado como parámetro devuelve al menos un registro }
  function ExisteSql( ASql :string) : Boolean;

  function ExisteSqlEx(ASql : StringSql; AValues: array of TVarRec) : Boolean;

//  function GetDecodeFromSql(Value, Sql : String; DefaultValue : String = SQL_NULL; DefIsValue : Boolean = False) : String;
//  function GetDecodeFromCTB(Value, TB_CLAVE : String; DefaultValue : String = SQL_NULL; DefIsValue : Boolean = False) : String;

  function GetDecodeFromCTB(AValue : String; AClave : TCtbClave; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : string;

  function GetDecodeFromSql(AValue, ASql : StringSql; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : String;

  function GetMemoData( AQuery, AField: string; stm: TMemoryStream ): boolean;

  { GetQuery crea y retorna un TSDQuery conectado a la base de datos y ejecutando el Sql pasado como parámetro }
  function GetQuery( Sql : String ) : TSDQuery;

  function GetQueryEx(ASql: StringSql; AValues: array of TVarRec; AOptions: TQueryOptions = []): TSDQuery;

  function GetSecCurrVal(ASequence : String) : Integer;

  function GetSecNextVal(ASequence : String) : Integer;

  function Get_Servidor: String;

  { Devuelve el valor numérico de la primer columna del primer registro del Query, incrementado segun el parámetro N }
  function IncSql(Sql : String; N : Integer = 1) : Integer;

  function  InTransaction :Boolean;

  function Is_ConectadoProduccion: Boolean;

  procedure LoadStrings( ASql : string; const AStrings : TStrings; AClearOld : boolean = True );

  procedure LoadStringsValues( ASql : StringSql; const AStrings : TStrings; AClearOld : boolean = True );

  function ObtenerValor(ASql : StringSql; ADefault: String = ''): Variant;

  function ObtenerValorEx( ASql: StringSql; AValues: array of TVarRec; ADefault: String = '' ): Variant;

  { OpenQuery Abre el query, con el sql pasado o con el sql que tenga definido el query }
  function OpenQuery(AQuery : TSDQuery; ASql : String = ''; ACompareSql : Boolean = False; AReposition : Boolean = False) : Boolean;

  function OpenQueryEx(AQuery: TSDQuery; AValues: array of TVarRec; ASql: StringSql = ''; ACompareSql: Boolean = False; AReposition: Boolean = False): Boolean;

  function QuickGetQuery(ASql: StringSql; AOptions: TQueryOptions = [] ) : TSDQuery;

  function QuickGetQueryEx(ASql: StringSql; AValues: array of TVarRec; AOptions: TQueryOptions = []): TSDQuery;

  function RefreshAndLocate(AQuery : TSDQuery; AFields : array of string; AValues : array of variant; Options : TLocateOptions = [] ) : Boolean;

  function RefreshAndRelocate(AQuery : TSDQuery; AFields : array of string; Options : TLocateOptions = [] ) : Boolean;

  procedure Rollback( CheckTrans : Boolean = False );

  procedure RollBackUpdates;

  procedure SaveBlob(AUpdateSql : string; AStream: TStream; TransactionMode : TTransactionMode = tmNone ); overload;

  procedure SaveBlob(AUpdateSql : string; ALines: TStrings; TransactionMode : TTransactionMode = tmNone ); overload;

  procedure SaveBlob(ASql, AUpdateSql: StringSql; AFieldName: string; AStream: TStream); overload;

  procedure SaveBlob(ASql, AUpdateSql: StringSql; AFieldName: string; ALines: TStrings); overload;

  { SetDatabaseToQuery le asigna al Query la conección a la base de datos }
  procedure SetDatabaseToQuery( var Query : TSDQuery );

  function ValoresColSQL( ASql : string ): TStringList;

  function ValoresSql( ASql : string) : TStringList;

  function ValoresSqlEx( ASql : StringSql; AValues: array of TVarRec ) : TStringList;

  { ValorSql Devuelve el valor del primer campo del primer registro del query pasado, en el caso de que el query no retorne
    ningún registro, retorna el valor pasado como default }
  function ValorSql( ASql : string; ADefault : String = '') : Variant;

  function ValorSqlDateTime( ASql : string; ADefault : TDateTime = 0) : TDateTime;

  function ValorSqlDateTimeEx(ASql: StringSql; AValues: array of TVarRec; ADefault : Integer = 0): TDateTime;

  function ValorSqlEx(ASql: StringSql; AValues: array of TVarRec; ADefault : String = ''): Variant;

  function ValorSqlExtended( ASql : string; ADefault : Extended = 0) : Extended;

  function ValorSqlExtendedEx( ASql : StringSql; AValues: array of TVarRec; ADefault : Extended = 0) : Extended;

  function ValorSqlInteger( ASql : string; ADefault : Integer = 0) : Integer;

  function ValorSqlIntegerEx(ASql: StringSql; AValues: array of TVarRec; ADefault : Integer = 0): Integer;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.DFM}

uses
  CustomDlgs, ODBC, IniFiles;

Const
  EJEC_STOREPROCEDURE = 'BEGIN'#13#10' %s '#13#10'END;';
  EJEC_FUNCTION = 'SELECT %s '#13#10'FROM DUAL';

procedure AddToLog(sCadena: string);
begin
  if Assigned(dmPrincipal.LogFile) then
  begin
    dmPrincipal.LogFile.WriteLine('---[' + DateTimeToStr(Now) + ']' + StringOfChar('-', 70));
    dmPrincipal.LogFile.WriteLine(sCadena);
  end;
end;

procedure ApplyUpdates(const DataSets: array of TSDDataSet);
begin
  dmPrincipal.ApplyUpdates( DataSets );
end;

procedure ArrayColSql(ASql: string; var AResults: array of String);
begin
  dmPrincipal.ArrayColSql( ASql, AResults );
end;

procedure ArraySql(ASql: string; var AResults: array of String);
begin
  dmPrincipal.ArraySql( ASql, AResults );
end;

procedure BeginTrans( CheckTrans : Boolean = False );
begin
  dmPrincipal.BeginTrans( CheckTrans );
end;

procedure BlobSql( ASql : StringSql; AStream  : TStream ); overload;
begin
  dmPrincipal.BlobSql( ASql, AStream );
end;

procedure BlobSql( ASql : StringSql; AStrings : TStrings ); overload;
begin
  dmPrincipal.BlobSql( ASql, AStrings );
end;

procedure CheckAndOpenQuery(AQuery : TSDQuery; ASql : String = ''; AsSelect : Boolean = True; AParams: TParams = Nil); { Abre el Query sin registros a modo Checkeo de Sintaxis }
begin
  if AsSelect Then
    OpenQuery( AQuery, ASql)
  else
    raise Exception.Create( 'La compatibilidad con Microsoft Access no soporta el procedimiento CheckAndOpenQuery en modo Not Select');
end;

procedure CommitTrans( CheckTrans : Boolean = False );
begin
  dmPrincipal.CommitTrans( CheckTrans );
end;

procedure CopySqlClp( Text : string);
begin
  dmPrincipal.CopySqlClp( Text );
end;

function DBDate : TDate;
begin
  Result := dmPrincipal.DBDate;
end;

function DBDateTime : TDateTime;
begin
  Result := dmPrincipal.DBDateTime;
end;

function DBTime : TTime;
begin
  Result := dmPrincipal.DBTime;
end;

procedure DoAplicarUpdates(Query: TSDQuery);
begin
  dmPrincipal.DoAplicarUpdates(Query);
end;

procedure DynArrayColSql(ASql: string; var AResults: TDynStringArray);
begin
  dmPrincipal.DynArrayColSql( ASql, AResults );
end;

procedure DynArraySql(ASql: string; var AResults: TDynStringArray; MaxReg : Integer = -1);
begin
  dmPrincipal.DynArraySql( ASql, AResults, MaxReg );
end;

procedure DynMatrixSql(ASql: string; var AResults: TDynStringMatrix; MaxReg : Integer = -1);
begin
  dmPrincipal.DynMatrixSql( ASql, AResults, MaxReg );
end;

procedure EjecutarSql( ASql : String );
begin
  dmPrincipal.EjecutarSql( ASql );
end;

procedure EjecutarSqlEx(ASql: StringSql; AValues: array of TVarRec);
begin
  dmPrincipal.EjecutarSqlEx(ASql, AValues);
end;

procedure EjecutarSqlST( ASql : String; TransactionMode : TTransactionMode = tmNone );
begin
  dmPrincipal.EjecutarSqlST( ASql, TransactionMode );
end;

procedure EjecutarSqlSTEx(ASql: StringSql; AValues: array of TVarRec; TransactionMode: TTransactionMode = tmNone);
begin
  dmPrincipal.EjecutarSqlSTEx(ASql, AValues, TransactionMode);
end;

procedure EjecutarStore( ASql : StringSql );
begin
  EjecutarSql( Format(EJEC_STOREPROCEDURE, [ASql]) );
end;

procedure EjecutarStoreEx(ASql: StringSql; AValues: array of TVarRec);
begin
  EjecutarSqlEx(Format(EJEC_STOREPROCEDURE, [ASql]), AValues);
end;

procedure EjecutarStoreST( ASql : StringSql );
begin
  EjecutarSqlST(Format(EJEC_STOREPROCEDURE, [ASql]) );
end;

procedure EjecutarStoreSTEx(ASql: StringSql; AValues: array of TVarRec);
begin
  EjecutarSqlSTEx(Format(EJEC_STOREPROCEDURE, [ASql]), AValues);
end;

function ExisteSql( ASql :string) : Boolean;
begin
  Result := dmPrincipal.ExisteSql( ASql );
end;

function ExisteSqlEx(ASql : StringSql; AValues: array of TVarRec) : Boolean;
begin
  Result := dmPrincipal.ExisteSqlEx( ASql, AValues );
end;

function GetDecodeFromCTB(AValue : String; AClave : TCtbClave; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : string;
var
  sSql : String;
begin
   sSql := 'SELECT TB_CODIGO, TB_DESCRIPCION ' +
             'FROM CTB_TABLAS ' +
            'WHERE TB_CODIGO <> ''0'' ' +
              'AND TB_BAJA <> ''S'' ' +
              'AND TB_CLAVE = ''' + AClave + ''' ' ;
   Result := GetDecodeFromSql( AValue, sSql, ADefaultValue, ADefIsValue );
end;

function GetDecodeFromSql(AValue, ASql : StringSql; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : String;
begin
  Result := dmPrincipal.GetDecodeFromSql(AValue, ASql, ADefaultValue, ADefIsValue);
end;

function GetMemoData( AQuery, AField: string; stm: TMemoryStream ): boolean;
begin
  Result := dmPrincipal.GetMemoData( AQuery, AField, Stm );
end;

function GetQuery( Sql : String ) : TSDQuery;
begin
  Result := dmPrincipal.GetQuery( Sql );
end;

function GetQueryEx(ASql: StringSql; AValues: array of TVarRec; AOptions: TQueryOptions = []): TSDQuery;
begin
  Result := dmPrincipal.GetQueryEx( ASql, AValues, AOptions );
end;

function GetSecCurrVal(ASequence : String) : Integer;
begin
  Result := dmPrincipal.GetSecCurrVal( ASequence );
end;

function GetSecNextVal(ASequence : String) : Integer;
begin
  Result := dmPrincipal.GetSecNextVal( ASequence );
end;

function Get_Servidor: String;
begin
  Result := dmPrincipal.Get_Servidor;
end;

function IncSql(Sql : String; N : Integer = 1) : Integer;
begin
  Result := dmPrincipal.IncSql( Sql, N );
end;

function InTransaction :Boolean;
begin
  Result := dmPrincipal.sdbPrincipal.InTransaction;
end;

function Is_ConectadoProduccion: Boolean;
begin
  Result := dmPrincipal.Is_ConectadoProduccion;
end;

procedure LoadStrings( ASql : string; const AStrings : TStrings; AClearOld : boolean = True );
begin
  dmPrincipal.LoadStrings( ASql, AStrings, AClearOld );
end;

procedure LoadStringsValues( ASql : StringSql; const AStrings : TStrings; AClearOld : boolean = True );
begin
  dmPrincipal.LoadStringsValues( ASql, AStrings, AClearOld );
end;

function ObtenerValor(ASql : StringSql; ADefault: String = ''): Variant;
begin
  Result := ValorSql( Format(EJEC_FUNCTION, [ASql]), ADefault );
end;

function ObtenerValorEx( ASql: StringSql; AValues: array of TVarRec; ADefault: String = '' ): Variant;
begin
  Result := ValorSqlEx(Format(EJEC_FUNCTION, [ASql]), AValues, ADefault);
end;

function OpenQuery(AQuery : TSDQuery; ASql : String = ''; ACompareSql : Boolean = False; AReposition : Boolean = False) : Boolean;
begin
  Result := dmPrincipal.OpenQuery( AQuery, ASql, ACompareSql, AReposition );
end;

function OpenQueryEx(AQuery: TSDQuery; AValues: array of TVarRec; ASql: StringSql = ''; ACompareSql: Boolean = False; AReposition: Boolean = False): Boolean;
begin
  Result := dmPrincipal.OpenQueryEx( AQuery, AValues, ASql, ACompareSql, AReposition );
end;

function QuickGetQuery(ASql: StringSql; AOptions: TQueryOptions = [] ) : TSDQuery;
begin
  Result := dmPrincipal.QuickGetQuery( ASql, AOptions );
end;

function QuickGetQueryEx(ASql: StringSql; AValues: array of TVarRec; AOptions: TQueryOptions = []): TSDQuery;
begin
  Result := dmPrincipal.QuickGetQueryEx( ASql, AValues, AOptions );
end;

function RefreshAndLocate(AQuery : TSDQuery; AFields : array of string; AValues : array of variant; Options : TLocateOptions = [] ) : Boolean;
begin
  Result := dmPrincipal.RefreshAndLocate( AQuery, AFields, AValues, Options  );
end;

function RefreshAndRelocate(AQuery : TSDQuery; AFields : array of string; Options : TLocateOptions = [] ) : Boolean;
begin
  Result := dmPrincipal.RefreshAndRelocate( AQuery, AFields, Options );
end;

procedure Rollback( CheckTrans : Boolean = False );
begin
  dmPrincipal.Rollback( CheckTrans );
end;

procedure RollBackUpdates;
begin
  BeginTrans(true);
  Rollback;
end;

procedure SaveBlob(AUpdateSql : string; AStream: TStream; TransactionMode : TTransactionMode = tmNone ); overload;
var
 ParamCheckAnterior : Boolean;
begin
  ParamCheckAnterior := dmPrincipal.sdqConsulta.ParamCheck;
  try
    dmPrincipal.sdqConsulta.ParamCheck := true;
    if TransactionMode in [tmBegin, tmBeginEnd] Then dmPrincipal.sdbPrincipal.StartTransaction;

    with dmPrincipal.sdqConsulta do
    begin
      SQL.Text := AUpdateSql;
      if (ParamCount > 1) or (ParamCount = 0) then
        raise Exception.Create('Cantidad de parámetros incorrectos.');
      Params[0].LoadFromStream(AStream, ftBlob);
      ExecSQL;
    end;
    if TransactionMode in [tmEnd, tmBeginEnd] Then   dmPrincipal.sdbPrincipal.Commit ;
  finally
     dmPrincipal.sdqConsulta.ParamCheck := ParamCheckAnterior;
  end;
end;

procedure SaveBlob(AUpdateSql : string; ALines: TStrings; TransactionMode : TTransactionMode = tmNone ); overload;
var
  AStream: TMemoryStream;
begin
  AStream := TMemoryStream.Create;
  try
    ALines.SaveToStream(AStream);
    SaveBlob(AUpdateSql, AStream, TransactionMode);
  finally
    AStream.Free;
  end;
end;

procedure SaveBlob(ASql, AUpdateSql: StringSql; AFieldName: string; AStream: TStream); overload;
begin
  dmPrincipal.SaveBlob(ASql, AUpdateSql, AFieldName, AStream);
end;

procedure SaveBlob(ASql, AUpdateSql: StringSql; AFieldName: string; ALines: TStrings); overload;
begin
  dmPrincipal.SaveBlob(ASql, AUpdateSql, AFieldName, ALines);
end;

procedure SetDatabaseToQuery( var Query : TSDQuery );
begin
  dmPrincipal.SetDatabaseToQuery( Query );
end;

function ValoresColSQL( ASql : string ): TStringList;
begin
  Result := dmPrincipal.ValoresColSQL( ASql );
end;

function ValoresSql( ASql : string) : TStringList;
begin
  Result := dmPrincipal.ValoresSql( ASql );
end;

function ValoresSqlEx( ASql : StringSql; AValues: array of TVarRec ) : TStringList;
begin
  Result := dmPrincipal.ValoresSqlEx( ASql, AValues );
end;

function ValorSql( ASql : string; ADefault : String = '') : Variant;
begin
  Result := dmPrincipal.ValorSql( ASql, ADefault );
end;

function ValorSqlDateTime( ASql : string; ADefault : TDateTime = 0) : TDateTime;
begin
  Result := dmPrincipal.ValorSqlDateTime( ASql, ADefault );
end;

function ValorSqlDateTimeEx(ASql: StringSql; AValues: array of TVarRec; ADefault : Integer = 0): TDateTime;
begin
  Result := dmPrincipal.ValorSqlDateTimeEx(ASql, AValues, ADefault);
end;

function ValorSqlEx(ASql: StringSql; AValues: array of TVarRec; ADefault : String = ''): Variant;
begin
  Result := dmPrincipal.ValorSqlEx(ASql, AValues, ADefault);
end;

function ValorSqlExtended( ASql : string; ADefault : Extended = 0) : Extended;
begin
  Result := dmPrincipal.ValorSqlExtended( ASql, ADefault ) ;
end;

function ValorSqlExtendedEx( ASql : StringSql; AValues: array of TVarRec; ADefault : Extended = 0) : Extended;
begin
  Result := dmPrincipal.ValorSqlExtendedEx( ASql, AValues, ADefault ) ;
end;

function ValorSqlInteger( ASql : string; ADefault : Integer = 0) : Integer;
begin
  Result := dmPrincipal.ValorSqlInteger( ASql, ADefault );
end;

function ValorSqlIntegerEx(ASql: StringSql; AValues: array of TVarRec; ADefault : Integer = 0): Integer;
begin
  Result := dmPrincipal.ValorSqlIntegerEx(ASql, AValues, ADefault);
end;

{ TdmPrincipal }

ResourceString
  INI_SECTION  = 'DataBase.';
  INI_USER     = 'User';
  INI_PASSWORD = 'Password';

function TdmPrincipal.ConfigureDataBase: Boolean;
var
  sRutaBaseMDB, sAliasODBC: string;
begin
  sdbPrincipal.PasswordFile := GetSettingsFileName;
  {$IFNDEF MSACCESS}
  Raise Exception.Create( 'El sistema ha sido diseñado para funcionar únicamente con bases de datos Access' );
  {$ENDIF}

  with TIniFile.Create(sdbPrincipal.PasswordFile) do
  try
    {Configura de prepo el DSN del ODBC}
    sRutaBaseMDB := Get_IdentificadorINI('Base de Datos', 'Ruta_MDB', '\\NTNAS1\CEM\CEM_NEW.MDB');
    sAliasODBC := Get_IdentificadorINI('Base de Datos', 'ODBC_ACCESS', 'CEM');
    SQLConfigDataSource(0, ODBC_ADD_DSN, PChar('Microsoft Access Driver (*.mdb)'),                          
                        PChar( 'Access;DSN=' + sAliasODBC + ';Description=;DBQ=' + sRutaBaseMDB + ';UID=;PWD=;;"') );
    Result := SetIniSettings( 'ODBC_ACCESS', sdbPrincipal );
  finally
    Free;
  end;
end;

end.
