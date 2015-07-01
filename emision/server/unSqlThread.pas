unit unSqlThread;
interface

uses
  Classes, SysUtils, SDEngine;

type
  TSqlThread = class(TThread)
  private
    { Private declarations }
    FRecordCount: Integer;
    FSql        : String;
    FDatabase   : TSDDatabase;
    FQuery      : TSDQuery;
    FConnected  : Boolean;
    procedure OnLogin(Database: TSDDatabase; LoginParams: TStrings);
    procedure SetSql(const Value: string);
  protected
    procedure Execute; override;
  public
    constructor Create(ADatabase : TSDDatabase);
    destructor Destroy; override;
    property Sql: string write SetSql;
    property RecordCount: Integer read FRecordCount write FRecordCount;
    property Database: TSDDatabase read FDatabase;
  end;

  TQueryThread = class(TThread)
  private
    { Private declarations }
    FQuery: TSDQuery;
  protected
    procedure Execute; override;
  public
    constructor Create(AQuery: TSDQuery);
  end;

implementation



{ TSqlThread }
constructor TSqlThread.Create(ADatabase : TSDDatabase);
var
  i: Integer;
  Nombre : String;
begin
  Inherited Create(True);
  FDatabase := TSDDatabase.Create(nil);
  FDatabase.RemoteDatabase	:= ADatabase.RemoteDatabase;
  FDatabase.ServerType		  := ADatabase.ServerType;
  FDatabase.LoginPrompt		  := False;

  FreeOnTerminate := False;

  FQuery	:= TSDQuery.Create(nil);
  for i:=0 to Session.DatabaseCount-1 do
    if Session.Databases[i] = FDatabase then
    begin
      repeat
        Randomize;
        Nombre := 'DB'+ IntToStr(Trunc(Random(999999)));
      until (Session.FindDatabase(nombre) = nil);

      FDatabase.DatabaseName   := Nombre;
      FDatabase.OnLogin := OnLogin;
      Break;
    end;
  FQuery.DatabaseName := FDatabase.DatabaseName;
end;
{------------------------------------------------------------------------------}
destructor TSqlThread.Destroy;
begin
  FQuery.Free;
  FDatabase.Free;
  Inherited;
end;
{------------------------------------------------------------------------------}
procedure TSqlThread.OnLogin(Database: TSDDatabase; LoginParams: TStrings);
begin
  FConnected := true;
end;
{------------------------------------------------------------------------------}
procedure TSqlThread.Execute;
var
  i: Integer;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add(FSql);

  FQuery.Prepare;
  FDatabase.StartTransaction;
  try
    FQuery.ExecSQL;
    FDatabase.Commit;
  except;
    FDatabase.Rollback;
  end;
  FQuery.Disconnect;

  Terminate;
end;
{------------------------------------------------------------------------------}
procedure TSqlThread.SetSql(const Value: string);
begin
  FSql := Value;
end;
{------------------------------------------------------------------------------}


{ TQueryThread }

constructor TQueryThread.Create(AQuery: TSDQuery);
begin
  FQuery := AQuery;
  FreeOnTerminate := True;
  inherited Create(False);
end;
{------------------------------------------------------------------------------}
procedure TQueryThread.Execute;
begin
  if FQuery.Active then
    FQuery.Close;
  FQuery.Open;
end;
{------------------------------------------------------------------------------}

end.
