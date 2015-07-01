unit unLogs;

interface

uses classes, windows, sysutils, registry, datetimefuncs, forms, SvcMgr;

const
  EVENTLOG_SEQUENTIAL_READ        = $0001;
  EVENTLOG_SEEK_READ              = $0002;
  EVENTLOG_FORWARDS_READ          = $0004;
  EVENTLOG_BACKWARDS_READ         = $0008;

type
  TDebugLevelType = (dlNone, dlError, dlWarning, dlInformation, dlAll);
  TEventLogRecord = packed record
    Length : DWORD;        // Length of full record
    Reserved : DWORD;      // Used by the service
    RecordNumber : DWORD;  // Absolute record number
    TimeGenerated : DWORD; // Seconds since 1-1-1970
    TimeWritten : DWORD;   // Seconds since 1-1-1970
    EventID : DWORD;
    EventType : WORD;
    NumStrings : WORD;
    EventCategory : WORD;
    ReservedFlags : WORD; // For use with paired events (auditing)
    ClosingRecordNumber : DWORD;
    StringOffset : DWORD;
    UserSidLength : DWORD;
    UserSidOffset : DWORD;
    DataLength : DWORD;
    DataOffset : DWORD;
  end;
  PEventLogRecord = ^TEventLogRecord;


  TLogs = class
    FOwner         : TComponent;
    FLog           : TStringList;
    FApplicationLogName : string;
    FDebugLevel    : TDebugLevelType;
    FOnService     : boolean;
    FServer        : string;
    FSource        : string;
    FHandle        : THandle;
    FOffset        : integer;
    FCurrentRecord : pointer;
    FDebug         : boolean;
  private
    function    GetLog: TStringList;
    function    GetEventCount : integer;
    procedure   ReadNext ( ARecNro : integer );
    function    GetEventMessageText: string;
    procedure   SetApplicationLogName(const Value: string);
  public
    Constructor Create(AOwner : TComponent);
    Destructor  Destroy; override;
    property    OnService           : boolean read FOnService write FOnService;
    property    DebugLevel          : TDebugLevelType read FDebugLevel write FDebugLevel;
    property    Log                 : TStringList read GetLog;
    property    ApplicationLogName  : string read FApplicationLogName write SetApplicationLogName;
    procedure   AddLogMessage(ADebugLevel : TDebugLevelType; const AMessage: String; ADebugId : Integer = 0);
    procedure   InitDebug;
  end;


implementation

constructor TLogs.Create(AOwner : TComponent);
begin
  FLog := TStringList.create;
  FOwner := AOwner;

  if AOwner is TService then
       FOnService := false
  else FOnService := true;

end;

destructor TLogs.Destroy;
begin
    FLog.Free;
    inherited;
end;

procedure TLogs.InitDebug;
var
 i : integer;
begin
  FDebug := true;
  if FOnService then begin
    FHandle := OpenEventLog (PChar (FServer), PChar (FSource));
    if FHandle = 0 then  RaiseLastWin32Error;
    GetOldestEventLogRecord (FHandle, DWord(FOffset));
    ReadNext( FOffset );
    for i := 0 to GetEventCount - 1 do begin
      ReadNext(0);
      FLog.Add( DateTimeToStr( UxDateTimeToDateTime( (PEventLogRecord (fCurrentRecord)^.TimeGenerated) )) + ' : ' +   GetEventMessageText);
    end;
  end;
end;

procedure TLogs.AddLogMessage(ADebugLevel : TDebugLevelType; const AMessage: String; ADebugId : Integer = 0);
var
 DebugType : DWord;
begin
	if (FDebugLevel <> dlNone) and (FDebugLevel >= ADebugLevel) then begin
    if FOnService then begin
        case ADebugLevel  of
         dlInformation : DebugType := EVENTLOG_INFORMATION_TYPE;
         dlError       : DebugType := EVENTLOG_ERROR_TYPE;
         dlWarning     : DebugType := EVENTLOG_WARNING_TYPE;
        else DebugType := EVENTLOG_INFORMATION_TYPE;
        end;
        TService(FOwner).LogMessage(AMessage, DebugType, 0, ADebugId);
    end else FLog.Add( DateTimeToStr(Now) + ': ' + AMessage );
  end;
end;



procedure TLogs.ReadNext( ARecNro : integer );
var
  bytesRead, bytesNeeded, flags : DWORD;
  dummy : char;
begin
  flags := EVENTLOG_SEQUENTIAL_READ or EVENTLOG_FORWARDS_READ;

  ReadEventLog (FHandle, flags, ARecNro, @dummy, 0, bytesRead, bytesNeeded);
  if GetLastError = ERROR_INSUFFICIENT_BUFFER then begin
    ReallocMem (FCurrentRecord, bytesNeeded);
    if not ReadEventLog (FHandle, flags, 0, FCurrentRecord, bytesNeeded, bytesRead, bytesNeeded) then  RaiseLastWin32Error;
  end else RaiseLastWin32Error;

  inc(FOffset);
end;

// FIXME: Terminar luego de resolver como levantar interfaz asociada con el servicio.
function TLogs.GetLog: TStringList;
begin
  Result := nil;
  if FOnService then
  begin

  end
  else
  begin

  end;
end;

function TLogs.GetEventMessageText : string;
var
  messagePath : string;
  count, i : Integer;
  p : Pchar;
  args, pArgs : ^PCHAR;
  st : string;

  function FormatMessageFrom (const dllName : string) : boolean;
  var
    dllModule : THandle;
    buffer : PChar;
    fullDLLName : array [0..MAX_PATH] of char;
  begin
    result := False;
    ExpandEnvironmentStrings (PChar (dllName), fullDllName, MAX_PATH);
    dllModule := LoadLibraryEx (fullDLLName, 0, LOAD_LIBRARY_AS_DATAFILE);
    if dllModule <> 0 then
    try
      if FormatMessage (
        FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_HMODULE or FORMAT_MESSAGE_ARGUMENT_ARRAY,
        pointer (dllModule),
        PEventLogRecord (fCurrentRecord)^.EventID,
        0,
        @buffer,
        0,
        args) > 0 then
      begin
        buffer [lstrlen (buffer) - 2] := #0;
        st := buffer;

        result := True
      end
    finally
      FreeLibrary (dllModule)
    end
  end;

begin
  st := '';

  count := PEventLogRecord (fCurrentRecord)^.NumStrings;
  GetMem (args, count * sizeof (PChar));
  try
    pArgs := args;
    p := PEventLogRecord (fCurrentRecord)^.StringOffset + PChar (fCurrentRecord);
    for i := 0 to count - 1 do
    begin
      pArgs^ := p;
      Inc (p, lstrlen (p) + 1);
      Inc (pArgs)
    end;

    with TRegistry.Create do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      OpenKey (Format ('SYSTEM\CurrentControlSet\Services\EventLog\%s\%s', [FApplicationLogName, PChar (FCurrentRecord) + sizeof (TEventLogRecord)]), False);
      messagePath := ReadString ('EventMessageFile');

      repeat
        i := Pos (';', MessagePath);
        if i <> 0 then
        begin
          if FormatMessageFrom (Copy (MessagePath, 1, i)) then
            break;
          MessagePath := Copy (MessagePath, i, MaxInt);
        end
        else
          FormatMessageFrom (MessagePath)
      until i = 0
    end
  finally
    FreeMem (args)
  end;
  result := st
end;


function TLogs.GetEventCount: integer;
begin
  GetNumberOfEventLogRecords (fHandle, Dword(result));
end;

procedure TLogs.SetApplicationLogName(const Value: string);
begin
  FApplicationLogName := Value;
end;


end.
