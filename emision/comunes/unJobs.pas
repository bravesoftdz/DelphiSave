unit unJobs;

interface

type
  TJob = class(TObject)
  private
    //identificador de job
    FJob  : Integer;
    FWhat  : string;
    FNext_Date : TDateTime;
    FInterval  : string;
    FSubmited : boolean;

    function  ValidaAtributos(): Boolean ;
    procedure SetJob(const Value: Integer);
    procedure SetNext_Date(const Value: TDateTime);
    procedure SetWhat(const Value: string);
    procedure SetInterval(NewVal: string = '');
    //create escondido para evitar que se cree un job sin submit
    function GetSubmited: boolean;
  public
    // retorna el id de job
    function  Submit(): integer; overload;
    //True si tuvo exito
    function Remove(): Boolean;
    procedure Refresh();
    procedure Run;
    procedure Change();
    constructor Create(); overload;
    // constructor para leer un job existente en BD con el id.
    constructor Create(Job : integer); overload;
    constructor Create(What: string; Next_Date: TDateTime; Interval: string = ''); overload;
  	property Job        : Integer   read FJob       write SetJob;
  	property ID         : Integer   read FJob       write SetJob;
    property What       : string    read FWhat      write SetWhat;
    property Next_Date  : TDateTime read FNext_Date write SetNext_Date;
    property Interval   : string    read FInterval  write SetInterval;
    property IsSubmited : boolean   read GetSubmited;
  end;

function  Job_Submit(what : string; next_date : TDateTime; interval : string = '') : integer;
procedure Job_Remove(job : integer);
procedure Job_What(job : integer; what : string);
procedure Job_Interval(job : integer; interval : string = '');
procedure Job_NextDate(job : integer; next_date : TDateTime);
procedure Job_Change(job : integer; what : string; next_date : TDateTime; interval : string = '');
procedure Job_Run(job : integer);

implementation

uses
  Classes, unDmPrincipal, SqlFuncs, AnsiSql, DbFuncs, SDEngine, DB,
  Math, SysUtils;

{ TJob }


procedure TJob.Change;
var
  sSql : string;
begin
  sSql := 'BEGIN   ' +
          '  SYS.DBMS_JOB.CHANGE ' +
          '  (                 ' +
          '    job        =>   ' + SqlValue(self.job) + ' , '+
          '              what           => ''' + self.What + ''' ,   ' +
          '              next_date      => ' + SqlDateTime(self.Next_Date) + ', ' +
          '              INTERVAL       => '+ SqlString(Self.Interval, true, true) +
          '             );' +
          '  COMMIT; ' +
          'END;';
  EjecutarSql(sSql);

end;

constructor TJob.Create(What: string; Next_Date: TDateTime; Interval: string);
begin
  self.What      := What;
  self.FSubmited := False;

  If ValidaAtributos then
  begin
    self.Next_Date := Next_Date;
    self.Interval  := Interval;
    Submit();
  end;
end;


constructor TJob.Create;
begin
  inherited Create;
  self.FSubmited := False;
//  raise Exception.CreateFmt('La clase %s solo puede ser creada con parametros.', [ClassName]);
end;

constructor TJob.Create(Job: integer);
begin
  Self.Job := Job;
  Refresh;
end;

function TJob.GetSubmited: boolean;
begin
  Result := FSubmited;
end;

procedure TJob.Refresh;
var
 Q : TSDQuery;
begin
  Q := GetQuery('SELECT WHAT, LOG_USER, PRIV_USER, SCHEMA_USER, LAST_DATE, THIS_DATE, THIS_SEC, NEXT_DATE, NEXT_SEC,' +
                '       TOTAL_TIME, BROKEN, INTERVAL, FAILURES, NLS_ENV, INSTANCE' +
                '  FROM DBA_JOBS WHERE JOB = ' + SqlValue(Self.FJob));

  try
    if Q.RecordCount > 0 then
    begin
      FWhat := Q.FieldByName('WHAT').AsString;


    end;


  finally
    Q.Free;
  end;
end;

function TJob.Remove: Boolean;
var
 sSql : string;
begin
  try
    if IsSubmited then
    begin
      sSql := 'BEGIN ' +
              '  SYS.DBMS_JOB.remove (job => ' + SqlValue(Self.Job) + '); ' +
              '  COMMIT; ' +
              'END;';
      EjecutarSql(sSql);
    end;
    Result := True;
  except
    Result := false;
  end;
end;

procedure TJob.Run;
var
 sSql : string;
begin
  sSql := 'BEGIN   ' +
          '  SYS.DBMS_JOB.RUN ' +
          '  (                 ' +
          '    job        =>   ' + SqlValue(self.job) +
          '             );' +
          '  COMMIT; ' +
          'END;';
  EjecutarSql(sSql);
end;

procedure TJob.SetInterval(NewVal: string = '');
//var
// sSql : string;
begin
  if (FInterval <> NewVal) then FInterval := NewVal;
{  sSql := 'BEGIN ' +
          ' SYS.DBMS_JOB.INTERVAL (job => ' + SqlValue(self.Job ) +
          ', INTERVAL => ' + SqlString(self.Interval, true, true) +  ');' +
          '  COMMIT; ' +
          'END;';
  EjecutarSql(sSql);}
end;

procedure TJob.SetJob(const Value: Integer);
begin
  FJob := Value;
  FSubmited := True;
end;

procedure TJob.SetNext_Date(const Value: TDateTime);
begin
  if (FNext_Date <> Value) then FNext_Date := Value;
end;

procedure TJob.SetWhat(const Value: string);
begin
  if (FWhat <> Value) then FWhat := Value;
end;

function TJob.Submit(): integer;
var
 sSql : string;
begin
  Result:= -1;

  if ValidaAtributos then
  begin
  //FIXME resultado erroneo -1


    sSql := 'DECLARE ' +
            'BEGIN  ' +
            '  SYS.DBMS_JOB.submit (job            => :job, ' +
            '              what           => ''' + self.What + ''' ,   ' +
            '              next_date      => ' + SqlDateTime(self.Next_Date) + ', ' +
            '              INTERVAL       => '+ SqlString(Self.Interval, true, true) + ', ' +
            '              no_parse       => false ' +
            '             );' +
            '  COMMIT; ' +
            'END;';

    with TSDQuery.Create(nil) do
    try
      DatabaseName := 'dbPrincipal';
      SQL.Text := sSql;
      Params[0].DataType := ftInteger;
      Params[0].ParamType := ptOutput;
      ExecSQL;
      if ParamCount > 0 then
      begin
        result   := ParamByName('job').AsInteger;
        Self.Job := ParamByName('job').AsInteger;
        FSubmited:= True;
      end;
    finally
      free;
    end;
  end;
end;

function TJob.ValidaAtributos: Boolean;
begin
  Result := True;

  if (Self.What = '') then
    Result := False;
end;


function Job_Submit(what : string; next_date : TDateTime; interval : string = '') : integer;
var
 sSql : string;
begin

//FIXME resultado erroneo -1
  Result:= -1;

  sSql := 'DECLARE ' +
          'BEGIN  ' +
          '  SYS.DBMS_JOB.submit (job            => :job, ' +
          '              what           => ''commit;'' ,   ' +
          '              next_date      => ' + SqlDate(next_date) + ', ' +
          '              INTERVAL       => '+ SqlString(interval, true, true) + ', ' +
          '              no_parse       => false ' +
          '             );' +
          '  COMMIT; ' +
          'END;';

  with TSDQuery.Create(nil) do
  try
    SQL.Text := sSql;
    ExecSQL;
    if ParamCount > 0 then
    result := ParamByName('job').AsInteger;
  finally
    free;
  end;
end;

procedure Job_Change(job : integer; what : string; next_date : TDateTime; interval : string = '');
var
  sSql : string;
begin
  sSql := 'BEGIN   ' +
          '  SYS.DBMS_JOB.CHANGE ' +
          '  (                 ' +
          '    job        =>   ' + SqlValue(job) +
          '   ,what       =>   ' + SqlValue(what) +
          '   ,next_date  =>   ' + SqlDate(next_date) +
          '   ,interval   => ' +  ');' + SqlValue(interval) +
          '  COMMIT; ' +
          'END;';
  EjecutarSql(sSql);
end;


procedure Job_Run(job : integer);
var
 sSql : string;
begin
  sSql := 'BEGIN   ' +
          '  SYS.DBMS_JOB.RUN ' +
          '  (                 ' +
          '    job        =>   ' + SqlValue(job) +
          '             );' +
          '  COMMIT; ' +
          'END;';
  EjecutarSql(sSql);
end;


procedure Job_Remove(job : integer);
var
 sSql : string;
begin
  sSql := 'BEGIN ' +
          '  SYS.DBMS_JOB.remove (job => ' + SqlValue(job) + '); ' +
          '  COMMIT; ' +
          'END;';
  EjecutarSql(sSql);
end;

procedure Job_What(job : integer; what : string);
var
 sSql : string;
begin
  sSql := 'BEGIN ' +
          ' SYS.DBMS_JOB.what (job => ' + SqlValue(job ) +
          ', what => ' + SqlValue(what) +  ');' +
          '  COMMIT; ' +
          'END;';
  EjecutarSql(sSql);
END;

procedure Job_Interval(job : integer; interval : string = '');
var
 sSql : string;
begin
  sSql := 'BEGIN ' +
          ' SYS.DBMS_JOB.INTERVAL (job => ' + SqlValue(job ) +
          ', INTERVAL => ' + SqlString(interval, true, true) +  ');' +
          '  COMMIT; ' +
          'END;';
  EjecutarSql(sSql);
end;

procedure Job_NextDate(job : integer; next_date : TDateTime);
var
 sSql : string;
begin
  sSql := 'BEGIN ' +
          '  SYS.DBMS_JOB.next_date (job => ' + SqlValue(job) +
               ', next_date => ' + SqlDate(next_date) + '); '+
          '  COMMIT; ' +
          'END;';
  EjecutarSql(sSql);
end;



end.


