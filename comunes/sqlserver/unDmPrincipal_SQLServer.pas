{$DEFINE SQLSERVER}

{*********************************************
 *  DataModule Principal                     *
 *                                           *
 *  Autor:  Federico Firenze                 *
 *  Fecha:  01/07/1998                       *
 *********************************************}

unit unDmPrincipal_SQLServer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomDataModule, Db, SDEngine, ArtDatabase, AnsiSql, unArt;

type
  TTransactionMode = unCustomDataModule.TTransactionMode;
  TDynStringArray  = unCustomDataModule.TDynStringArray;
  TDynStringMatrix = unCustomDataModule.TDynStringMatrix;

  TdmPrincipal_SQLServer = class(TdmCustomDataModule)
  protected
    function ConfigureDataBase: boolean; override;
  end;

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

  { DBDate retorna la Hora de la base de datos }
  function DBDate : TDate;

  { GetQuery crea y retorna un TSDQuery conectado a la base de datos y ejecutando el Sql pasado como parámetro }
  function GetQuery( ASql : StringSql ) : TSDQuery;

  { OpenQuery Abre el query, con el sql pasado o con el sql que tenga definido el query }
  function OpenQuery(AQuery : TSDQuery; ASql : StringSql = ''; ACompareSql : Boolean = False; AReposition : Boolean = False) : Boolean;

  { ValorSql Devuelve el valor del primer campo del primer registro del query pasado, en el caso de que el query no retorne
    ningún registro, retorna el valor pasado como default }
  function ValorSql( ASql : StringSql; ADefault : String = '') : Variant;
  function ValorSqlInteger( ASql : StringSql; ADefault : Integer = 0) : Integer;
  function ValorSqlExtended( ASql : StringSql; ADefault : Extended = 0) : Extended;
  function ValorSqlDateTime( ASql : StringSql; ADefault : TDateTime = 0) : TDateTime;

  function ValoresSql( ASql : StringSql) : TStringList;
  function ValoresColSQL( ASql : StringSql ): TStringList;

  procedure LoadStrings( ASql : StringSql; const AStrings : TStrings; AClearOld : boolean = True );

  { ExisteSql retorna True si el query pasado como parámetro devuelve al menos un registro }
  function ExisteSql( ASql : StringSql) : Boolean;

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
  procedure EjecutarSql( ASql : StringSql );

  { Ejecuta la consulta pasada como parámetro sin manejar transacciones }
  procedure EjecutarSqlST( ASql : StringSql; TransactionMode : TTransactionMode = tmNone );

  procedure BlobSql( ASql : StringSql; AStream  : TStream ); overload;
  procedure BlobSql( ASql : StringSql; AStrings : TStrings ); overload;

  function RefreshAndLocate( AQuery : TSDQuery; AFields : array of string; AValues : array of variant; Options : TLocateOptions = [] ) : Boolean;
  function RefreshAndRelocate( AQuery : TSDQuery; AFields : array of string; Options : TLocateOptions = [] ) : Boolean;

  function GetDecodeFromSql( AValue, ASql : StringSql; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : string;

  function GetMemoData( AQuery, AField: string; Stm: TMemoryStream ): boolean;

  function GetSecNextVal(ASequence : String) : Integer;

  procedure BeginTrans( CheckTrans : Boolean = False );
  procedure CommitTrans( CheckTrans : Boolean = False );
  procedure Rollback( CheckTrans : Boolean = False );
  procedure ApplyUpdates(const DataSets: array of TSDDataSet);

  { Abre el Query sin registros a modo Checkeo de Sintaxis }
  //procedure CheckAndOpenQuery( AQuery : TSDQuery; ASql : StringSql = ''; AsSelect : Boolean = True );

var
  dmPrincipal_SQLServer: TdmPrincipal_SQLServer;

implementation

uses
  SqlFuncs;

{$R *.DFM}
{------------------------------------------------------------------------------}
procedure CopySqlClp( Text : string);
begin
  dmPrincipal_SQLServer.CopySqlClp( Text );
end;
{------------------------------------------------------------------------------}
procedure SetDatabaseToQuery( var Query : TSDQuery );
begin
  dmPrincipal_SQLServer.SetDatabaseToQuery( Query );
end;
{------------------------------------------------------------------------------}
function DBDateTime : TDateTime;
begin
  Result := dmPrincipal_SQLServer.DBDateTime;
end;
{------------------------------------------------------------------------------}
function DBDate : TDate;
begin
  Result := dmPrincipal_SQLServer.DBDate;
end;
{------------------------------------------------------------------------------}
function GetQuery( ASql : StringSql ) : TSDQuery;
begin
  Result := dmPrincipal_SQLServer.GetQuery( ASql );
end;
{------------------------------------------------------------------------------}
function OpenQuery(AQuery : TSDQuery; ASql : StringSql = ''; ACompareSql : Boolean = False; AReposition : Boolean = False) : Boolean;
begin
  Result := dmPrincipal_SQLServer.OpenQuery( AQuery, ASql, ACompareSql, AReposition );
end;
{------------------------------------------------------------------------------}
function ValorSql( ASql : StringSql; ADefault : String = '') : Variant;
begin
  Result := dmPrincipal_SQLServer.ValorSql( ASql, ADefault );
end;
{------------------------------------------------------------------------------}
function ValorSqlInteger( ASql : StringSql; ADefault : Integer = 0) : Integer;
begin
  Result := dmPrincipal_SQLServer.ValorSqlInteger( ASql, ADefault );
end;
{------------------------------------------------------------------------------}
function ValorSqlExtended( ASql : StringSql; ADefault : Extended = 0) : Extended;
begin
  Result := dmPrincipal_SQLServer.ValorSqlExtended( ASql, ADefault ) ;
end;
{------------------------------------------------------------------------------}
function ValorSqlDateTime( ASql : StringSql; ADefault : TDateTime = 0) : TDateTime;
begin
  Result := dmPrincipal_SQLServer.ValorSqlDateTime( ASql, ADefault );
end;
{------------------------------------------------------------------------------}
function ValoresSql( ASql : StringSql) : TStringList;
begin
  Result := dmPrincipal_SQLServer.ValoresSql( ASql );
end;
{------------------------------------------------------------------------------}
function ValoresColSQL( ASql : StringSql ): TStringList;
begin
  Result := dmPrincipal_SQLServer.ValoresColSQL( ASql );
end;
{------------------------------------------------------------------------------}
procedure LoadStrings( ASql : StringSql; const AStrings : TStrings; AClearOld : boolean = True );
begin
  dmPrincipal_SQLServer.LoadStrings( ASql, AStrings, AClearOld );
end;
{------------------------------------------------------------------------------}
function ExisteSql( ASql : StringSql) : Boolean;
begin
  Result := dmPrincipal_SQLServer.ExisteSql( ASql );
end;
{------------------------------------------------------------------------------}
function IncSql(Sql : String; N : Integer = 1) : Integer;
begin
  Result := dmPrincipal_SQLServer.IncSql( Sql, N );
end;
{------------------------------------------------------------------------------}
procedure ArraySql(ASql : StringSql; var AResults: array of String);
begin
  dmPrincipal_SQLServer.ArraySql( ASql, AResults );
end;
{------------------------------------------------------------------------------}
procedure ArrayColSql(ASql : StringSql; var AResults: array of String);
begin
  dmPrincipal_SQLServer.ArrayColSql( ASql, AResults );
end;
{------------------------------------------------------------------------------}
procedure DynArraySql(ASql : StringSql; var AResults: TDynStringArray; MaxReg : Integer = -1);
begin
  dmPrincipal_SQLServer.DynArraySql( ASql, AResults, MaxReg );
end;
{------------------------------------------------------------------------------}
procedure DynArrayColSql(ASql : StringSql; var AResults: TDynStringArray);
begin
  dmPrincipal_SQLServer.DynArrayColSql( ASql, AResults );
end;
{------------------------------------------------------------------------------}
procedure DynMatrixSql(ASql : StringSql; var AResults: TDynStringMatrix; MaxReg : Integer = -1);
begin
  dmPrincipal_SQLServer.DynMatrixSql( ASql, AResults, MaxReg );
end;
{------------------------------------------------------------------------------}
procedure EjecutarSql( ASql : StringSql );
begin
  dmPrincipal_SQLServer.EjecutarSql( ASql );
end;
{------------------------------------------------------------------------------}
procedure EjecutarSqlST( ASql : StringSql; TransactionMode : TTransactionMode = tmNone );
begin
  dmPrincipal_SQLServer.EjecutarSqlST( ASql, TransactionMode );
end;
{------------------------------------------------------------------------------}
procedure BlobSql( ASql : StringSql; AStream  : TStream ); overload;
begin
  dmPrincipal_SQLServer.BlobSql( ASql, AStream );
end;
{------------------------------------------------------------------------------}
procedure BlobSql( ASql : StringSql; AStrings : TStrings ); overload;
begin
  dmPrincipal_SQLServer.BlobSql( ASql, AStrings );
end;
{------------------------------------------------------------------------------}
function RefreshAndLocate(AQuery : TSDQuery; AFields : array of string; AValues : array of variant; Options : TLocateOptions = [] ) : Boolean;
begin
  Result := dmPrincipal_SQLServer.RefreshAndLocate( AQuery, AFields, AValues, Options  );
end;
{------------------------------------------------------------------------------}
function RefreshAndRelocate(AQuery : TSDQuery; AFields : array of string; Options : TLocateOptions = [] ) : Boolean;
begin
  Result := dmPrincipal_SQLServer.RefreshAndRelocate( AQuery, AFields, Options );
end;
{------------------------------------------------------------------------------}
function GetDecodeFromSql(AValue, ASql : StringSql; ADefaultValue : String = SQL_NULL; ADefIsValue : Boolean = False) : String;
begin
  Result := dmPrincipal_SQLServer.GetDecodeFromSql(AValue, ASql, ADefaultValue, ADefIsValue);
end;
{------------------------------------------------------------------------------}
function GetMemoData( AQuery, AField: string; stm: TMemoryStream ): boolean;
begin
  Result := dmPrincipal_SQLServer.GetMemoData( AQuery, AField, Stm );
end;
{------------------------------------------------------------------------------}
procedure BeginTrans( CheckTrans : Boolean = False );
begin
  dmPrincipal_SQLServer.BeginTrans( CheckTrans );
end;
{------------------------------------------------------------------------------}
procedure CommitTrans( CheckTrans : Boolean = False );
begin
  dmPrincipal_SQLServer.CommitTrans( CheckTrans );
end;
{------------------------------------------------------------------------------}
procedure Rollback( CheckTrans : Boolean = False );
begin
  dmPrincipal_SQLServer.Rollback( CheckTrans );
end;
{------------------------------------------------------------------------------}
procedure ApplyUpdates(const DataSets: array of TSDDataSet);
begin
  dmPrincipal_SQLServer.ApplyUpdates( DataSets );
end;
{------------------------------------------------------------------------------}
function GetSecNextVal(ASequence : String) : Integer;
begin
  Result := ValorSqlInteger( SqlSimpleQuery( ASequence + SQL_SEQ_NEXTVAL ) );
end;
{------------------------------------------------------------------------------}
{ TdmPrincipal_SQLServer }
{------------------------------------------------------------------------------}
function TdmPrincipal_SQLServer.ConfigureDataBase: boolean;
begin
  Result := SetIniSettings( 'ODBC_SQLSERVER', sdbPrincipal );
end;
{------------------------------------------------------------------------------}
end.
