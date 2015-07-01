unit BaseDeDatos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, SDEngine, DBTables;

type
  TTransactionMode = (tmNone, tmBegin, tmEnd, tmRollBack);

  TDM_BaseDeDatos = class(TDataModule)
    BaseDeDatos: TSDDatabase;
    SDQ_ValorSql: TSDQuery;
    Sql_Ejecutar: TSDUpdateSQL;
    UpdateSQL1: TUpdateSQL;
    SDQuery: TSDQuery;
  private
  public
    Perfil: string;
    Usuario: string;
    TablaComentarios: string;
    procedure QrySql(Sql: string);
    procedure CloseQrySql;
  end;

function ValorSql(Cadena: string): variant;
function ValoresSql(Cadena: string): TStringList;
procedure EjecutarSql(Cadena: string; QryPrc: boolean = false);
function EjecutarSqlST(Cadena: string;
  TransactionMode: TTransactionMode = tmNone): boolean;

var
  DM_BaseDeDatos: TDM_BaseDeDatos;

implementation

uses Registros;

{$R *.DFM}

//----------------------------------------------------------------------------//

function ValorSql(Cadena: string): variant;
begin
//    DM_BaseDeDatos.Sdq_ValorSql.Close;
  DM_BaseDeDatos.Sdq_ValorSql.SQL.Clear;
  DM_BaseDeDatos.Sdq_ValorSql.SQL.Add(Cadena);
  DM_BaseDeDatos.Sdq_ValorSql.Open;
  Result := DM_BaseDeDatos.Sdq_ValorSql.Fields[0].AsString;
  DM_BaseDeDatos.Sdq_ValorSql.Close;
end;
//----------------------------------------------------------------------------//

procedure EjecutarSql(Cadena: string; QryPrc: boolean = false);
begin
  DM_BaseDeDatos.BaseDeDatos.StartTransaction;
  try
    if QryPrc = true then
    begin
      DM_BaseDeDatos.Sdq_ValorSql.Close;
      DM_BaseDeDatos.Sdq_ValorSql.SQL.Clear;
      DM_BaseDeDatos.Sdq_ValorSql.SQL.Add(Cadena);
      DM_BaseDeDatos.Sdq_ValorSql.ExecSQL;
      DM_BaseDeDatos.BaseDeDatos.Commit;
    end
    else if (Pos('UPDATE', UpperCase(Cadena)) > 0) then
    begin
      DM_BaseDeDatos.Sql_Ejecutar.ModifySQL.Clear;
      DM_BaseDeDatos.Sql_Ejecutar.ModifySQL.Add(Cadena);
      DM_BaseDeDatos.Sql_Ejecutar.ExecSQL(ukModify);
      DM_BaseDeDatos.BaseDeDatos.Commit;
    end
    else if (Pos('INSERT', UpperCase(Cadena)) > 0) then
    begin
      DM_BaseDeDatos.Sql_Ejecutar.InsertSQL.Clear;
      DM_BaseDeDatos.Sql_Ejecutar.InsertSQL.Add(Cadena);
      DM_BaseDeDatos.Sql_Ejecutar.ExecSQL(ukInsert);
      DM_BaseDeDatos.BaseDeDatos.Commit;
      DM_BaseDeDatos.Sql_Ejecutar.InsertSQL.Clear;
    end
    else if (Pos('DELETE', UpperCase(Cadena)) > 0) then
    begin
      DM_BaseDeDatos.Sql_Ejecutar.DeleteSQL.Clear;
      DM_BaseDeDatos.Sql_Ejecutar.DeleteSQL.Add(Cadena);
      DM_BaseDeDatos.Sql_Ejecutar.ExecSQL(ukDelete);
      DM_BaseDeDatos.BaseDeDatos.Commit;
      DM_BaseDeDatos.Sql_Ejecutar.DeleteSQL.Clear;
    end;
  except
    DM_BaseDeDatos.BaseDeDatos.Rollback;
    raise;
  end;
  Cadena := Cadena + '';  //Para el Debug

end;
//----------------------------------------------------------------------------//
function EjecutarSqlST(Cadena: string; TransactionMode: TTransactionMode = tmNone): boolean;
begin
  Result := False;

  if TransactionMode = tmRollBack then
    DM_BaseDeDatos.BaseDeDatos.RollBack
  else
    with DM_BaseDeDatos do
    begin
      if TransactionMode = tmBegin then
        BaseDeDatos.StartTransaction;

      Screen.Cursor := crHourGlass;
      try
        if Cadena <> '' then
        begin
          Sdq_ValorSql.Close;
          Sdq_ValorSql.SQL.Clear;
          Sdq_ValorSql.SQL.Add(Cadena);
          Sdq_ValorSql.Params.Clear;
          Sdq_ValorSql.ExecSQL;
        end;
        Result := true;
        if TransactionMode = tmEnd then
          BaseDeDatos.Commit;
      except
        on E: Exception do
        begin
          Screen.Cursor := crDefault;
          raise;
        end;
      end;
      Screen.Cursor := crDefault;
    end; // With
end;
//----------------------------------------------------------------------------//
procedure TDM_BaseDeDatos.QrySql(Sql: string);
begin
  SDQuery.Active := false;
  SDQuery.Sql.Clear;
  SDQuery.Sql.Text := Sql;
  SDQuery.Open;
end;

//----------------------------------------------------------------------------//
procedure TDM_BaseDeDatos.CloseQrySql;
begin
  SDQuery.Close;
end;
//----------------------------------------------------------------------------//
function ValoresSql(Cadena: string): TStringList;
begin
  Result := TStringList.Create;
  with DM_BaseDeDatos.Sdq_ValorSql do
  begin
    SQL.Clear;
    SQL.Add(Cadena);
    Open;
    while not EOF do
    begin
      Result.Add(Fields[0].AsString);
      Next;
    end;
    Close;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}

end.
