{$IFNDEF CONEXIA}
  {$DEFINE ORACLE}
{$ENDIF}

{********************************************************}
{                                                        }
{    DataModule Principal                                }
{    Esta unit contiene la base de datos principal del   }
{    proyecto, y un extenso juego de funciones para el   }
{    uso de esta.                                        }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  01/07/1998                                  }
{                                                        }
{********************************************************}
unit unDmPrincipal;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  {$IFDEF SERVICE}SvcMgr,  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomDataModule, Db, SDEngine, ArtDatabase, AnsiSql, unArt, DBFuncs,
  SDOra, LogFile, ImgList;

type
  TTransactionMode = unCustomDataModule.TTransactionMode;
  TDynStringArray  = unCustomDataModule.TDynStringArray;
  TDynStringMatrix = unCustomDataModule.TDynStringMatrix;
  TQueryOptions    = unCustomDataModule.TQueryOptions;

  TdmPrincipal = class(TdmCustomDataModule)
    procedure dmCustomDataModuleCreate(Sender: TObject);
  private
    {$IFNDEF PAQUETE}
    {$IFNDEF SERVICE}
    {$IFDEF ORACLE}
    procedure DoVerificarErrores;
    {$ENDIF}
    {$ENDIF}
    {$ENDIF}
  protected
    function ConfigureDataBase: boolean;  override;
  public
    function CheckAndOpenQuery(AQuery: TSDQuery; ASql: StringSql = ''; AsSelect : Boolean = True; AParams: TParams = Nil): Boolean;
    // Metodo publico que reconecta la base de datos.
    function ReconectarBD:Boolean;
    function VerificaConexion({$IFDEF SERVICE}AService: TService{$ENDIF}): Boolean;
    function  CheckView(AVista: string; AOwner: string = 'ART'): boolean;
    function  CheckStoreProc(ANombre: string; AOwner: string = 'ART'; ACompile: boolean = False): boolean;

    property  LogFile: TLogFile read ALogFile;
  end;

  (*
  TDBSql = class(TSql)
  private
  protected
  public
    procedure Execute;
    procedure ExecuteST;
    function Exists: boolean;
    function GetQuery: TSDQuery;
  end;
  *)

  {***************************************************************************************************}
  {* Acá se definen todas las funciones, para que puedan ser utilizadas sin pertenecer al DataModule *}
  {***************************************************************************************************}

  { CopySqlClp copia al portapapeles el texto pasado como parámetro solo cuando la aplicación ha sido ejecutada con el
    parámetro /CLP }
  procedure CopySqlClp( Text : string);

  { SetDatabaseToQuery le asigna al Query la conección a la base de datos }
  procedure SetDatabaseToQuery( var Query : TSDQuery );

  { DBDateTime retorna la Hora y Fecha de la base de datos }
  function DBDateTime : TDateTime;

  { DBDate retorna la Fecha de la base de datos }
  function DBDate : TDateTime;

  { DBTime retorna la Hora de la base de datos }
  function DBTime : TTime;

  { GetQuery crea y retorna un TSDQuery conectado a la base de datos y ejecutando el Sql pasado como parámetro }
  function GetQuery(ASql: StringSql; AOptions: TQueryOptions = []): TSDQuery;
  function GetQueryEx(ASql: StringSql; AValues: array of TVarRec; AOptions: TQueryOptions = []): TSDQuery;

  { QuickGetQuery crea y retorna un TSDQuery conectado a la base de datos y ejecutando el Sql pasado como parámetro, no copia al clipboard ni pone reloj }
  function QuickGetQuery(ASql: StringSql; AOptions: TQueryOptions = []): TSDQuery;
  function QuickGetQueryEx(ASql: StringSql; AValues: array of TVarRec; AOptions: TQueryOptions = []): TSDQuery;

  { OpenQuery Abre el query, con el sql pasado o con el sql que tenga definido el query }
  function OpenQuery(AQuery : TSDQuery; ASql : StringSql = ''; ACompareSql : Boolean = False; AReposition : Boolean = False) : Boolean;
  function OpenQueryEx(AQuery: TSDQuery; AValues: array of TVarRec; ASql: StringSql = ''; ACompareSql: Boolean = False; AReposition: Boolean = False): Boolean;

  { ValorSql Devuelve el valor del primer campo del primer registro del query pasado, en el caso de que el query no retorne
    ningún registro, retorna el valor pasado como default }
  function ValorSql( ASql : StringSql; ADefault : String = ''; ACopySqlToClipboard: Boolean = True) : Variant;
  function ValorSqlEx(ASql: StringSql; AValues: array of TVarRec; ADefault : String = ''; ACopySqlToClipboard: Boolean = True): Variant;
  function ValorSqlInteger( ASql : StringSql; ADefault : Integer = 0) : Integer;
  function ValorSqlIntegerEx(ASql: StringSql; AValues: array of TVarRec; ADefault : Integer = 0): Integer;
  function ValorSqlExtended( ASql : StringSql; ADefault : Extended = 0) : Extended;
  function ValorSqlExtendedEx( ASql : StringSql; AValues: array of TVarRec; ADefault : Extended = 0) : Extended;
  function ValorSqlDateTime( ASql : StringSql; ADefault : TDateTime = 0) : TDateTime;
  function ValorSqlDateTimeEx(ASql: StringSql; AValues: array of TVarRec; ADefault : TDateTime = 0): TDateTime;

  function ValoresSql( ASql : StringSql) : TStringList;
  function ValoresSqlEx( ASql : StringSql; AValues: array of TVarRec ) : TStringList;
  function ValoresColSQL( ASql : StringSql ): TStringList;

  procedure LoadStrings( ASql : StringSql; const AStrings : TStrings; AClearOld : boolean = True );
  procedure LoadStringsValues( ASql : StringSql; const AStrings : TStrings; AClearOld : boolean = True );

  { ExisteçSql retorna True si el query pasado como parámetro devuelve al menos un registro }
  function ExisteSql(ASql : StringSql) : Boolean;

  function ExisteSqlEx(ASql : StringSql; AValues: array of TVarRec) : Boolean;

  { Devuelve el valor numérico de la primer columna del primer registro del Query, incrementado segun el parámetro N }
  function IncSql(Sql : String; N : Integer = 1) : Integer;

  procedure ArraySql(ASql : StringSql; var AResults: array of String);
  procedure ArrayColSql(ASql : StringSql; var AResults: array of String);

  { Devuelve todos los valores del primer campo del query en un array dinámico }
  procedure DynArraySql(ASql : StringSql; var AResults: TDynStringArray; MaxReg : Integer = -1);

  { Devuelve todos valores de los campos del primer registro en un Array dinámico }
  procedure DynArrayColSql(ASql : StringSql; var AResults: TDynStringArray);

  { Devuelve TODO el set de resultados de la consulta en un Array Dinámico de dos dimensiones }
  procedure DynMatrixSql(ASql : StringSql; var AResults: TDynStringMatrix; MaxReg : Integer = -1);

  { Ejecuta la consulta pasada como parámetro en una nueva transacción que es manejada por el procedure }
  procedure EjecutarSql(ASql: StringSql);

  { Ejecuta la consulta pasada como parámetro sin manejar transacciones }
  procedure EjecutarSqlST(ASql: StringSql; TransactionMode: TTransactionMode = tmNone; ThreadSafe: Boolean = False);

  { Ejecuta la consulta pasada como parámetro en una nueva transacción que es manejada por el procedure, acepta parámetros }
  procedure EjecutarSqlEx(ASql: StringSql; AValues: array of TVarRec);

  { Ejecuta la consulta pasada como parámetro sin manejar transacciones, acepta parámetros }
  procedure EjecutarSqlSTEx(ASql: StringSql; AValues: array of TVarRec; TransactionMode: TTransactionMode = tmNone; ThreadSafe: Boolean = False);

  { Ejecuta el store procedure pasado como parámetro en una nueva transacción que es manejada por el procedure }
  procedure EjecutarStore( ASql : StringSql );
  procedure EjecutarStoreEx(ASql: StringSql; AValues: array of TVarRec);

  { Ejecuta el store procedure pasado como parámetro sin manejar transacciones }
  procedure EjecutarStoreST( ASql : StringSql );
  procedure EjecutarStoreSTEx(ASql: StringSql; AValues: array of TVarRec);

  { Ejecuta el store procedure pasado como parámetro en una nueva transacción que es manejada por el procedure }
  function ObtenerValor( ASql : StringSql; ADefault: String = '' ): Variant;
  function ObtenerValorEx(ASql: StringSql; AValues: array of TVarRec; ADefault: String = ''): Variant;

  procedure BlobSql( ASql : StringSql; AStream  : TStream ); overload;
  procedure BlobSql( ASql : StringSql; AStrings : TStrings ); overload;

  procedure SaveBlob(ASql, AUpdateSql: StringSql; AFieldName: string; AStream: TStream); overload;
  procedure SaveBlob(ASql, AUpdateSql: StringSql; AFieldName: string; ALines: TStrings); overload;
  procedure SaveBlob(AUpdateSql : string; AStream: TStream; TransactionMode : TTransactionMode = tmNone ); overload;
  procedure SaveBlob(AUpdateSql : string; ALines: TStrings; TransactionMode : TTransactionMode = tmNone ); overload;

  function RefreshAndLocate( AQuery : TSDQuery; AFields : array of string; AValues : array of variant; Options : TLocateOptions = [] ) : Boolean;
  function RefreshAndRelocate( AQuery : TSDQuery; AFields : array of string; Options : TLocateOptions = [] ) : Boolean;

  function GetDecodeFromSql( AValue, ASql : StringSql; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : string;
  function GetDecodeFromCTB( AValue : String; AClave : TCtbClave; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : string;

  function GetMemoData( AQuery, AField: string; Stm: TMemoryStream ): boolean;

  function GetSecNextVal(ASequence : String) : Integer;
  function GetSecCurrVal(ASequence : String) : Integer;
  function Get_TableDescription(ATableName: String; AOwner: String = ''): String;
  function Get_Servidor: String;
  function Get_PathReportes: String;
  function InTransaction :Boolean;
  function Is_ConectadoProduccion: Boolean;

  procedure BeginTrans( CheckTrans : Boolean = False );
  procedure CommitTrans( CheckTrans : Boolean = False );
  procedure CommitAndBeginTrans( CheckTrans : Boolean = False );
  procedure Rollback( CheckTrans : Boolean = False );
  procedure ApplyUpdates(const DataSets: array of TSDDataSet);
  procedure RollBackUpdates;

  { Abre el Query sin registros a modo Checkeo de Sintaxis }
  function  CheckAndOpenQuery( AQuery : TSDQuery; ASql : StringSql = ''; AsSelect : Boolean = True; AParams: TParams = Nil): Boolean;

  { Comprueba que la vista exista y esté compilada, caso contrario produce un Exception }
  function CheckView( sVista : String; sOwner : String = 'ART' ) : Boolean;

  { Comprueba que el Store Procedure exista y esté compilado, caso contrario produce un Exception }
  function CheckStoreProc( sNombre : String; sOwner : String = 'ART'; bCompile : Boolean = False ) : Boolean;

  function Get_NullValueId(Id: TTableId): Variant;
  function Get_NullValueDate(Fecha: TDateTime): Variant;
  function Get_NullValueNumber(Numero: Double): Variant;

  function Get_StringNullValueNumber(Numero: Double): String;

  procedure SetParamValues(AValues: array of TVarRec; AParams: TParams);

  procedure AddToLog(sCadena: string);

  procedure DoAplicarUpdates(Query: TSDQuery);

  function Get_ConsultaSinParametros(Sql: String; AParams: TParams): String;

  {$IFNDEF PAQUETE}
  function Get_ClientLibraryLoaded: String;
  function Get_OracleClientVersion: String;
  {$ENDIF}

var
  dmPrincipal: TdmPrincipal;

implementation

uses
  SqlFuncs, unDebug, StrFuncs, {$IFNDEF SERVICE}unMoldeEnvioMail,{$ENDIF} unSesion,
  General;

Const
  EJEC_STOREPROCEDURE = 'BEGIN'#13#10' %s '#13#10'END;';
  EJEC_FUNCTION = 'SELECT %s '#13#10'FROM DUAL';

{$R *.DFM}

procedure CopySqlClp( Text : string);
begin
  dmPrincipal.CopySqlClp( Text );
end;

procedure SetDatabaseToQuery( var Query : TSDQuery );
begin
  dmPrincipal.SetDatabaseToQuery( Query );
end;

function DBDateTime : TDateTime;
begin
  Result := dmPrincipal.DBDateTime;
end;

function DBDate : TDateTime;
begin
  Result := dmPrincipal.DBDate;
end;

function DBTime : TTime;
begin
  Result := dmPrincipal.DBTime;
end;

function GetQuery(ASql: StringSql; AOptions: TQueryOptions = []): TSDQuery;
begin
  Result := dmPrincipal.GetQuery(ASql, AOptions);
end;

function GetQueryEx(ASql: StringSql; AValues: array of TVarRec; AOptions: TQueryOptions = []): TSDQuery;
begin
  Result := dmPrincipal.GetQueryEx( ASql, AValues, AOptions );
end;

function OpenQuery(AQuery: TSDQuery; ASql: StringSql = ''; ACompareSql: Boolean = False; AReposition: Boolean = False): Boolean;
begin
  Result := dmPrincipal.OpenQuery(AQuery, ASql, ACompareSql, AReposition );
end;

function OpenQueryEx(AQuery: TSDQuery; AValues: array of TVarRec; ASql: StringSql = ''; ACompareSql: Boolean = False; AReposition: Boolean = False): Boolean;
begin
  Result := dmPrincipal.OpenQueryEx(AQuery, AValues, ASql, ACompareSql, AReposition );
end;

function ValorSql(ASql: StringSql; ADefault: String = ''; ACopySqlToClipboard: Boolean = True): Variant;
begin
  Result := dmPrincipal.ValorSql( ASql, ADefault, ACopySqlToClipboard );
end;

function ValorSqlEx(ASql: StringSql; AValues: array of TVarRec; ADefault : String = ''; ACopySqlToClipboard: Boolean = True): Variant;
begin
  Result := dmPrincipal.ValorSqlEx(ASql, AValues, ADefault, ACopySqlToClipboard);
end;

function ValorSqlInteger(ASql : StringSql; ADefault : Integer = 0) : Integer;
begin
  Result := dmPrincipal.ValorSqlInteger(ASql, ADefault);
end;

function ValorSqlIntegerEx(ASql: StringSql; AValues: array of TVarRec; ADefault : Integer = 0): Integer;
begin
  Result := dmPrincipal.ValorSqlIntegerEx(ASql, AValues, ADefault);
end;

function ValorSqlExtended( ASql : StringSql; ADefault : Extended = 0) : Extended;
begin
  Result := dmPrincipal.ValorSqlExtended( ASql, ADefault ) ;
end;

function ValorSqlExtendedEx( ASql : StringSql; AValues: array of TVarRec; ADefault : Extended = 0) : Extended;
begin
  Result := dmPrincipal.ValorSqlExtendedEx( ASql, AValues, ADefault ) ;
end;

function ValorSqlDateTime( ASql : StringSql; ADefault : TDateTime = 0) : TDateTime;
begin
  Result := dmPrincipal.ValorSqlDateTime( ASql, ADefault );
end;

function ValorSqlDateTimeEx(ASql: StringSql; AValues: array of TVarRec; ADefault : TDateTime = 0): TDateTime;
begin
  Result := dmPrincipal.ValorSqlDateTimeEx(ASql, AValues, ADefault);
end;

function ValoresSql( ASql : StringSql ) : TStringList;
begin
  Result := dmPrincipal.ValoresSql( ASql );
end;

function ValoresSqlEx( ASql : StringSql; AValues: array of TVarRec ) : TStringList;
begin
  Result := dmPrincipal.ValoresSqlEx( ASql, AValues );
end;

function ValoresColSQL( ASql : StringSql ): TStringList;
begin
  Result := dmPrincipal.ValoresColSQL( ASql );
end;

procedure LoadStrings( ASql : StringSql; const AStrings : TStrings; AClearOld : boolean = True );
begin
  dmPrincipal.LoadStrings( ASql, AStrings, AClearOld );
end;

procedure LoadStringsValues( ASql : StringSql; const AStrings : TStrings; AClearOld : boolean = True );
begin
  dmPrincipal.LoadStringsValues( ASql, AStrings, AClearOld );
end;

function ExisteSql(ASql : StringSql) : Boolean;
begin
  Result := dmPrincipal.ExisteSql(ASql);
end;

function ExisteSqlEx(ASql : StringSql; AValues: array of TVarRec) : Boolean;
begin
  Result := dmPrincipal.ExisteSqlEx( ASql, AValues );
end;

function IncSql(Sql : String; N : Integer = 1) : Integer;
begin
  Result := dmPrincipal.IncSql( Sql, N );
end;

procedure ArraySql(ASql : StringSql; var AResults: array of String);
begin
  dmPrincipal.ArraySql( ASql, AResults );
end;

procedure ArrayColSql(ASql : StringSql; var AResults: array of String);
begin
  dmPrincipal.ArrayColSql( ASql, AResults );
end;

procedure DynArraySql(ASql : StringSql; var AResults: TDynStringArray; MaxReg : Integer = -1);
begin
  dmPrincipal.DynArraySql( ASql, AResults, MaxReg );
end;

procedure DynArrayColSql(ASql : StringSql; var AResults: TDynStringArray);
begin
  dmPrincipal.DynArrayColSql( ASql, AResults );
end;

procedure DynMatrixSql(ASql : StringSql; var AResults: TDynStringMatrix; MaxReg : Integer = -1);
begin
  dmPrincipal.DynMatrixSql(ASql, AResults, MaxReg);
end;

procedure EjecutarSql(ASql: StringSql);
begin
  dmPrincipal.EjecutarSql(ASql);
end;

procedure EjecutarSqlST(ASql: StringSql; TransactionMode: TTransactionMode = tmNone; ThreadSafe: Boolean = False);
begin
  dmPrincipal.EjecutarSqlST(ASql, TransactionMode, ThreadSafe);
end;

procedure EjecutarSqlEx(ASql: StringSql; AValues: array of TVarRec);
begin
  dmPrincipal.EjecutarSqlEx(ASql, AValues);
end;

procedure EjecutarSqlSTEx(ASql: StringSql; AValues: array of TVarRec; TransactionMode: TTransactionMode = tmNone; ThreadSafe: Boolean = False);
begin
  dmPrincipal.EjecutarSqlSTEx(ASql, AValues, TransactionMode, ThreadSafe);
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

function ObtenerValor(ASql : StringSql; ADefault: String = ''): Variant;
begin
  Result := ValorSql( Format(EJEC_FUNCTION, [ASql]), ADefault );
end;

function ObtenerValorEx( ASql: StringSql; AValues: array of TVarRec; ADefault: String = '' ): Variant;
begin
  Result := ValorSqlEx(Format(EJEC_FUNCTION, [ASql]), AValues, ADefault);
end;

procedure BlobSql( ASql : StringSql; AStream  : TStream ); overload;
begin
  dmPrincipal.BlobSql( ASql, AStream );
end;

procedure BlobSql( ASql : StringSql; AStrings : TStrings ); overload;
begin
  dmPrincipal.BlobSql( ASql, AStrings );
end;

procedure SaveBlob(ASql, AUpdateSql: StringSql; AFieldName: string; AStream: TStream); overload;
begin
  dmPrincipal.SaveBlob(ASql, AUpdateSql, AFieldName, AStream);
end;

procedure SaveBlob(ASql, AUpdateSql: StringSql; AFieldName: string; ALines: TStrings); overload;
begin
  dmPrincipal.SaveBlob(ASql, AUpdateSql, AFieldName, ALines);
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

function RefreshAndLocate(AQuery : TSDQuery; AFields : array of string; AValues : array of variant; Options : TLocateOptions = [] ) : Boolean;
begin
  Result := dmPrincipal.RefreshAndLocate( AQuery, AFields, AValues, Options  );
end;

function RefreshAndRelocate(AQuery : TSDQuery; AFields : array of string; Options : TLocateOptions = [] ) : Boolean;
begin
  Result := dmPrincipal.RefreshAndRelocate( AQuery, AFields, Options );
end;

function GetDecodeFromSql(AValue, ASql : StringSql; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : String;
begin
  Result := dmPrincipal.GetDecodeFromSql(AValue, ASql, ADefaultValue, ADefIsValue);
end;

function GetDecodeFromCTB(AValue : String; AClave : TCtbClave; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : string;
Var sSql : String;
begin
   sSql := 'SELECT TB_CODIGO, TB_DESCRIPCION ' +
             'FROM CTB_TABLAS ' +
            'WHERE TB_CODIGO <> ''0'' ' +
              'AND TB_BAJA <> ''S'' ' +
              'AND TB_CLAVE = ''' + AClave + ''' ' ;
   Result := GetDecodeFromSql( AValue, sSql, ADefaultValue, ADefIsValue );
end;

function GetMemoData( AQuery, AField: string; stm: TMemoryStream ): boolean;
begin
  Result := dmPrincipal.GetMemoData( AQuery, AField, Stm );
end;

procedure BeginTrans( CheckTrans : Boolean = False );
begin
  dmPrincipal.BeginTrans( CheckTrans );
end;

procedure CommitTrans( CheckTrans : Boolean = False );
begin
  dmPrincipal.CommitTrans( CheckTrans );
end;

procedure CommitAndBeginTrans( CheckTrans : Boolean = False );
begin
  dmPrincipal.CommitTrans( CheckTrans );
  dmPrincipal.BeginTrans( CheckTrans );
end;

procedure Rollback( CheckTrans : Boolean = False );
begin
  dmPrincipal.Rollback( CheckTrans );
end;

procedure ApplyUpdates(const DataSets: array of TSDDataSet);
begin
  dmPrincipal.ApplyUpdates( DataSets );
end;

procedure RollBackUpdates;
begin
  BeginTrans(true);
  Rollback;
end;

function CheckAndOpenQuery( AQuery : TSDQuery; ASql : StringSql = ''; AsSelect : Boolean = True; AParams: TParams = Nil): Boolean;
begin
  Result := dmPrincipal.CheckAndOpenQuery(AQuery, ASql, AsSelect, AParams);
end;

function CheckView(sVista : String; sOwner : String = 'ART') : Boolean;
begin
  Result := dmPrincipal.CheckView(sVista, sOwner);
end;

function CheckStoreProc(sNombre : String; sOwner : String = 'ART'; bCompile : Boolean = False) : Boolean;
begin
  Result := dmPrincipal.CheckStoreProc(sNombre, sOwner, bCompile);
end;

function GetSecNextVal(ASequence : String) : Integer;
begin
  Result := dmPrincipal.GetSecNextVal( ASequence );
end;

function GetSecCurrVal(ASequence : String) : Integer;
begin
  Result := dmPrincipal.GetSecCurrVal( ASequence );
end;

function Get_TableDescription(ATableName: String; AOwner: String = ''): String;
begin
  Result := dmPrincipal.Get_TableDescription(ATableName, AOwner);
end;

function Get_PathReportes: String;
begin
  Result := dmPrincipal.Get_PathReportes;
end;

function Get_Servidor: String;
begin
  Result := dmPrincipal.Get_Servidor;
end;

function Is_ConectadoProduccion: Boolean;
begin
  Result := dmPrincipal.Is_ConectadoProduccion;
end;

{ TdmPrincipal }

function TdmPrincipal.CheckAndOpenQuery(AQuery: TSDQuery; ASql: StringSql; AsSelect: Boolean; AParams: TParams): Boolean;
var
  iClause,
  i: Integer;
  AParam: TParam;
begin
  if ASql = '' Then
    ASql := Trim(AQuery.Sql.Text)
  else
    ASql := Trim(ASql);

  if ASql = '' Then
    raise Exception.Create( 'La sentencia SQL esta vacía' );

  if AsSelect then  { Consultas de Selección }
  begin
    iClause := FindClause( ASql, 'WHERE' );
    if iClause > -1 Then
      ASql := Copy(ASql, 0, iClause + 5) + ' 1=2 AND ' + Copy(ASql, iClause + 6, MaxInt);

  end else
  begin         { UPDATES / INSERTS / DELETES / STORE PROCEDURES }
    iClause := FindClause( ASql, 'BEGIN' );
    if iClause = -1 Then
      ASql := 'BEGIN ' + ASql + '; END;'
    else
      iClause := iClause -1;

    ASql := Copy( ASql, 0, iClause + 6) + ' IF 1=2 THEN ' + Copy(ASql, iClause + 7,  MaxInt );

    iClause := FindLastClause( ASql, 'END', iClause );
    ASql := Copy( ASql, 0, iClause ) + ' END IF; ' + Copy(ASql, iClause,  MaxInt );
  end;

  AQuery.Close;
  try
    AQuery.ParamCheck := True;
    AQuery.SQL.Text   := ASql;
    if AQuery.Params.Count > 0 Then
    begin
      i := 0;
      repeat
        if (AQuery.Params[i].Name = '') or (AQuery.Params[i].Name[1] = '=') Then
          AQuery.Params.Delete(i)

        else
        begin
          if Assigned(AParams) Then
          begin
            AParam := AParams.FindParam(AQuery.Params[i].Name);

            if Assigned(AParam) Then
              AQuery.Params[i].DataType := AParam.DataType;
          end else
          if (AQuery.Params[i].DataType = ftUnknown) Then
            AQuery.Params[i].DataType  := ftString;

          Inc(i);
        end;
      until i >= AQuery.Params.Count;
    end;

    try
      if AsSelect then
      begin
        OpenQuery(AQuery);
        Result := True;
      end else
      begin
        CopySqlClp(ASql);
        AQuery.ExecSQL;
        Result := True;
      end;
    except
      on E: Exception do
      begin
        Result := False;
        Raise;
      end;
    end;
  finally
    AQuery.ParamCheck := False;
  end;
end;

function TdmPrincipal.CheckStoreProc(ANombre, AOwner: string; ACompile: boolean): boolean;
var
  sSql,
  sValue: String;
begin
  sSql := 'SELECT OBJECT_TYPE, STATUS ' +
            'FROM SYS.ALL_OBJECTS ' +
           'WHERE OBJECT_TYPE IN (''FUNCTION'', ''PACKAGE'', ''PACKAGE BODY'', ''PROCEDURE'') ' +
             'AND OBJECT_NAME = ''' + Trim(ANombre) + ''' ' +
             'AND OWNER = ''' + AOwner + ''' ' ;
  with GetQuery(sSql) do
    try
      if IsEmpty Then
        Result := False
      else if (Fields[1].AsString = 'INVALID') then
      begin
        if not ACompile then
           Result := False
        else
          try
             sValue := Fields[0].AsString;
             if sValue = 'PACKAGE BODY' Then sValue := 'PACKAGE';

             EjecutarSql( 'ALTER ' + sValue + ' ' + AOwner + '.' + Trim(ANombre) + ' COMPILE' );
             Result := Not ExisteSql( sSql + ' AND STATUS = ''INVALID'' ');
          except
             Result := False;
          end;
      end else
        Result := True;
    finally
      Free;
    end;

  if (Result = False) Then
    raise Exception.Create( 'El Store Procedure o Package ' + sValue + ' ' + AOwner + '.' + ANombre + ' se encuentra en estado inválido o es inexistente.' );
end;

function TdmPrincipal.CheckView(AVista, AOwner: string): boolean;
Var Sql : String;
begin
  Sql := 'SELECT 1 ' +
           'FROM SYS.ALL_OBJECTS ' +
          'WHERE OWNER = ''' + AOwner + ''' ' +
            'AND OBJECT_TYPE = ''VIEW'' ' +
            'AND OBJECT_NAME = ''' + Trim(AVista) + ''' ' +
            'AND STATUS = ''VALID'' ';
  //------------------------------------------------------------------//
  if Not ExisteSql( Sql ) then
    try
        EjecutarSql('ALTER VIEW "' + AOwner + '"."' + AVista + '" COMPILE ');
        Result := ExisteSql( Sql );
    except // Si la Vista no existe produce un Error
        Result := False;
    end
  else
    Result := True;

  if (Result = False) Then
    raise Exception.Create( 'La Vista ' + AOwner + '.' + AVista + ' se encuentra en estado inválido o es inexistente.' );
end;

function TdmPrincipal.ConfigureDataBase: boolean;
begin
  Result := SetIniSettings( 'DataBase', sdbPrincipal );
end;
(*

{ TDBSql }

procedure TDBSql.Execute;
begin
  BeginTrans;
  try
    ExecuteST;
    CommitTrans;
  except
    RollBack;
    raise;
  end;
end;

procedure TDBSql.ExecuteST;
var
  bOldAsParams,
  bOldParamCheck: Boolean;
begin
  CopySqlClp('/* Sql con Parámetros */'#13#10 + Self.Sql);

  bOldAsParams   := ValueAsParams;
  ValueAsParams  := True;
  bOldParamCheck := dmPrincipal.sdqConsulta.ParamCheck;
  dmPrincipal.sdqConsulta.ParamCheck := True;

  try
    dmPrincipal.sdqConsulta.SQL.Text := Self.Sql;

//    dmPrincipal.sdqConsulta.Prepare;
    try
      AssignToParams(dmPrincipal.sdqConsulta.Params);
      dmPrincipal.sdqConsulta.ExecSQL;
    finally
//      dmPrincipal.sdqConsulta.UnPrepare;
    end;

  finally
    ValueAsParams := bOldAsParams;
    dmPrincipal.sdqConsulta.ParamCheck := bOldParamCheck;
  end;
end;

function TDBSql.Exists: boolean;
begin
  Result := ExisteSql( 'SELECT 1 FROM ' + TableName + ' ' + Where );
end;

function TDBSql.GetQuery: TSDQuery;
var
  bOldAsParams,
  bOldParamCheck: Boolean;
begin
  bOldAsParams   := ValueAsParams;
  ValueAsParams  := True;

  bOldParamCheck := dmPrincipal.sdqConsulta.ParamCheck;
  dmPrincipal.sdqConsulta.ParamCheck := True;

  try
    Result := TSDQuery.Create(Application);
    try
      SetDatabaseToQuery(Result);
      Result.SQL.Text := Self.Sql;

      dmPrincipal.sdqConsulta.Prepare;
      try
        AssignToParams(Result.Params);
        Result.Open ;
      finally
        Result.UnPrepare;
      end;
    except
      FreeAndNil( Result );
      raise;
    end;
  finally
    ValueAsParams := bOldAsParams;
    dmPrincipal.sdqConsulta.ParamCheck := bOldParamCheck;
  end;
end;

*)


function Get_NullValueId(Id: TTableId): Variant;
begin
  if Id = ART_EMPTY_ID then
    Result := Null
  else
    Result := Id;
end;

function Get_NullValueDate(Fecha: TDateTime): Variant;
begin
  if Fecha = 0 then
    Result := Null
  else
    Result := Fecha;
end;

function Get_NullValueNumber(Numero: Double): Variant;
begin
  if Numero = 0 then
    Result := Null
  else
    Result := Numero;
end;

function Get_StringNullValueNumber(Numero: Double): String;
begin
  if Numero = 0 then
    Result := ''
  else
    Result := FloatToStr(Numero);
end;

procedure SetParamValues(AValues: array of TVarRec; AParams: TParams);
begin
  dmPrincipal.SetParamValues(AValues, AParams);
end;

procedure AddToLog(sCadena: string);
begin
  if Assigned(dmPrincipal.LogFile) then
  begin
    dmPrincipal.LogFile.WriteLine('---[' + DateTimeToStr(Now) + ']' + StringOfChar('-', 70));
    dmPrincipal.LogFile.WriteLine(sCadena);
  end;
end;

function TdmPrincipal.ReconectarBD:Boolean;
begin
  Result := ConfigureDataBase;
end;

function QuickGetQuery(ASql: StringSql; AOptions: TQueryOptions = []): TSDQuery;
begin
  Result := dmPrincipal.QuickGetQuery(ASql, AOptions);
end;

function QuickGetQueryEx(ASql: StringSql; AValues: array of TVarRec; AOptions: TQueryOptions = []): TSDQuery;
begin
  Result := dmPrincipal.QuickGetQueryEx( ASql, AValues, AOptions );
end;

function InTransaction :Boolean;
begin
  Result := dmPrincipal.sdbPrincipal.InTransaction;
end;

procedure DoAplicarUpdates(Query: TSDQuery);
begin
  dmPrincipal.DoAplicarUpdates(Query);
end;

function TdmPrincipal.VerificaConexion({$IFDEF SERVICE}AService: TService{$ENDIF}): Boolean;
var
  bExiste : Boolean;
begin
  Result := True;
  try
    bExiste := ExisteSql('SELECT 1 FROM DUAL');
    if not bExiste then Result := False;
  except
    on E: ESDOraError do
    begin
      {$IFDEF SERVICE}
      if Assigned(AService) then
        AService.LogMessage('Error al verificar la conexión: ' + NVL(E.Message, 'No se pudo detectar el error.'), EVENTLOG_ERROR_TYPE, 0, 0);
      {$ELSE}
      unDebug.AddToLog('Error al verificar la conexión: ' + NVL(E.Message, 'No se pudo detectar el error.'), ltError);
      {$ENDIF}
      if   ReconectarBD
      then Result := True
      else Result := False;
    end;
  end;
end;

function Get_ConsultaSinParametros(Sql: String; AParams: TParams): String;
var
  Find, Replace: TStringList;
  i: Integer;
begin
  Find    := TStringList.Create;
  Replace := TStringList.Create;

  try
    for i := 0 to AParams.Count - 1 do
      begin
        Find.Add(':' + AParams[i].Name);
        Replace.Add(ParamToSqlValue(AParams[i]));
      end;

    ReplaceString(Sql, Find, Replace);

    Result := Sql;
  finally
    Find.Free;
    Replace.Free;
  end;
end;

{$IFNDEF PAQUETE}
{$IFNDEF SERVICE}
{$IFDEF ORACLE}
procedure TdmPrincipal.DoVerificarErrores;
var
  sCuerpo: String;
begin
  if not VerificarTerritoryDB() then
    begin
      sCuerpo := 'El territorio del cliente de Oracle del usuario: ' + Sesion.Usuario + ' - PC: ' + Sesion.WindowsComputerName +
                 ' se encuentra mal configurado (variable NLS_LANG), lo que puede generar INCONSISTENCIAS en el trabajo de dicho usuario.' + CRLF +
                 'Se solicita por favor la corrección de dicho problema.' + CRLF +
                 'Muchas Gracias';

      EnviarMailBD(GetMailMesaAyuda(), '[Oracle] ERROR CONFIGURACION CLIENTE ORACLE - ' + Application.Title + ' | ' + Sesion.Usuario,
                   [], sCuerpo, nil, 0, tcDefault, False);

      MessageDlg('El territorio de su cliente de Oracle se encuentra mal configurado (variable NLS_LANG), lo que puede generar INCONSISTENCIAS en su trabajo.' + CRLF +
                 'Consulte en forma URGENTE con la Mesa de Ayuda de IT&&Comunicaciones.', mtError, [mbOK], 0);
    end;
end;
{$ENDIF}
{$ENDIF}
{$ENDIF}

{$IFNDEF PAQUETE}
function Get_ClientLibraryLoaded: String;
begin
  Result := TIOraDatabase(dmPrincipal.sdbPrincipal).GetClientLibraryLoaded; //dmPrincipal.Get_ClientLibraryLoaded;
end;

function Get_OracleClientVersion: String;
begin
  Result := dmPrincipal.Get_OracleClientVersion;
end;
{$ENDIF}

procedure TdmPrincipal.dmCustomDataModuleCreate(Sender: TObject);
begin
  inherited;
  {$IFNDEF PAQUETE}
  {$IFNDEF SERVICE}
  {$IFDEF ORACLE}
  DoVerificarErrores;
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
end;

end.

