unit unImpoExpoUtils;

interface

uses
  SDEngine, AnsiSql, Db, unDmPrincipal, Sysutils;

function ReeplaceComboParams(const aProcesoId: Integer; const aSql, aValue: String): String;

procedure CheckQuery(const aProcesoId: Integer; aQuery: TSDQuery; aSql: StringSql = ''; aAsSelect: Boolean = True;
                     aParams: TParams = nil);

implementation

procedure CheckQuery(const aProcesoId: Integer; aQuery: TSDQuery; aSql: StringSql = ''; aAsSelect: Boolean = True;
                     aParams: TParams = nil);
begin
  aQuery.Sql.Text := ReeplaceComboParams(aProcesoId, aQuery.Sql.Text, '1');
  aSql := ReeplaceComboParams(aProcesoId, aSql, '1');

  CheckAndOpenQuery(aQuery, aSql, aAsSelect, aParams);
end;

function ReeplaceComboParams(const aProcesoId: Integer; const aSql, aValue: String): String;
var
  sSql: String;
begin
  Result := aSql;

  sSql :=
    'SELECT pp_codigo' +
     ' FROM ipp_procesoparametro' +
    ' WHERE pp_idproceso = :proceso' +
      ' AND pp_tipo = ''O''';
  with GetQueryEx(sSql, [aProcesoId]) do
  try
    while not Eof do
    begin
      Result := StringReplace(Result, ':' + FieldByName('pp_codigo').AsString, aValue, [rfReplaceAll, rfIgnoreCase]);
      Next;
    end;
  finally
    Free;
  end;
end;

end.
