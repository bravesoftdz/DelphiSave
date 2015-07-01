unit unLogsLT;

interface

uses
  Classes, SvcMgr, Windows, unDebug;

type
  TLog = class
    public
      class procedure LogMsg(Value: string; IsService: Boolean; TipoMsg: TLogType);
  end;

implementation

uses SysUtils, unComunesLT;

class procedure TLog.LogMsg(Value: string; IsService: Boolean; TipoMsg: TLogType);
begin
  if IsService then
    TService(Application.Components[0]).LogMessage(
        Value, iif(TipoMsg = ltError, EVENTLOG_ERROR_TYPE, EVENTLOG_INFORMATION_TYPE ), 0, 4)
  else begin
    AddToLog(Value, TipoMsg);
  end;
end;

end.
