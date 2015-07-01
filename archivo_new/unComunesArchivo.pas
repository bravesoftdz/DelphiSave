unit unComunesArchivo;

interface

uses
  unArt;

function VerificarClaveExiste(AIdTipoArchivo: Integer; AClave: String; var Id: TTableId): Boolean;
function GetIdArchivo(AIdTipoArchivo: Integer; AClave: String): TTableId;

implementation

uses
  unDmPrincipal;

{------------------------------------------------------------------------------}
function VerificarClaveExiste(AIdTipoArchivo: Integer; AClave: String; var Id: TTableId): Boolean;
begin
  Id := GetIdArchivo(AIdTipoArchivo, AClave);
  Result := (Id <> ART_EMPTY_ID);
end;
{------------------------------------------------------------------------------}
function GetIdArchivo(AIdTipoArchivo: Integer; AClave: String): TTableId;
var
  sSql: String;
begin
  sSql := 'SELECT AR_ID ' +
            'FROM RAR_ARCHIVO ' +
           'WHERE AR_TIPO = :Tipo ' +
             'AND AR_CLAVE = :Clave';

  Result := ValorSqlIntegerEx(sSql, [AIdTipoArchivo, AClave], ART_EMPTY_ID);
end;
{------------------------------------------------------------------------------}
end.

