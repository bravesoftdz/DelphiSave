unit unDirUtils;

interface

uses
  SysUtils, Windows, FileCtrl, Registry;

function GetNewTempPath: TFileName; overload;
function GetNewTempPath(ABaseDir: String): TFileName; overload;
function GetProgramFilesDir: TFileName;
function GetRegistryData(RootKey: HKEY; Key, Value: String): Variant;
function GetSystemDir: TFileName;
function GetTempDir: TFileName;
function GetWindowsDir: TFileName;

procedure CreateDirectoryIfNotExist(Directory: String);
procedure ForzarCrearDirectorio(Directory: String);

const
  MAX_PATH = 100;

implementation

function GetWindowsDir: TFileName;
var
  WinDir: Array[0..MAX_PATH - 1] of Char;
begin
  SetString(Result, WinDir, GetWindowsDirectory(WinDir, MAX_PATH));
  if Result = '' then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function GetSystemDir: TFileName;
var
  SysDir: Array[0..MAX_PATH - 1] of Char;
begin
  SetString(Result, SysDir, GetSystemDirectory(SysDir, MAX_PATH));
  if Result = '' then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function GetProgramFilesDir: TFileName;
begin
  Result := GetRegistryData(HKEY_LOCAL_MACHINE, '\Software\Microsoft\Windows\CurrentVersion', 'ProgramFilesDir');
end;

function GetNewTempPath(ABaseDir: String): TFileName;
var
  NomDirTemp: String;
begin
  repeat
    NomDirTemp := IncludeTrailingBackslash(ABaseDir) + 'TMP' + IntToStr(Random(99999));
  until not DirectoryExists(NomDirTemp);

  CreateDirectory(PChar(NomDirTemp), nil);
  Result := NomDirTemp;
end;

function GetNewTempPath: TFileName;
var
  NomDirTemp: String;
begin
  repeat
    NomDirTemp := IncludeTrailingBackslash(GetTempDir) + 'TMP' + IntToStr(Random(99999));
  until not DirectoryExists(NomDirTemp);

  CreateDirectory(PChar(NomDirTemp), nil);

  Result := NomDirTemp;
end;

function GetTempDir: TFileName;
var
  TmpDir: Array [0..MAX_PATH - 1] of Char;
begin
  try
    SetString(Result, TmpDir, GetTempPath(MAX_PATH, TmpDir));
    if not DirectoryExists(Result) then
      if not CreateDirectory(PChar(Result), nil) then
      begin
        Result := IncludeTrailingBackslash(GetWindowsDir) + 'TEMP';
        if not DirectoryExists(Result) then
          if not CreateDirectory(Pointer(Result), nil) then
          begin
            Result := ExtractFileDrive(Result) + '\TEMP';
            if not DirectoryExists(Result) then
              if not CreateDirectory(Pointer(Result), nil) then
              begin
                Result := ExtractFileDrive(Result) + '\TMP';
                if not DirectoryExists(Result) then
                  if not CreateDirectory(Pointer(Result), nil) then
                    raise Exception.Create(SysErrorMessage(GetLastError));
              end;
          end;
      end;
  except
    Result := '';
    raise;
  end;
end;

function GetRegistryData(RootKey: HKEY; Key, Value: String): Variant;
var
  DataSize: Integer;
  Len: Integer;
  Reg: TRegistry;
  RegDataType: TRegDataType;
  s: String;
label cantread;
begin
  Reg := nil;
  try
    Reg := TRegistry.Create(KEY_QUERY_VALUE);
    Reg.RootKey := RootKey;
    if Reg.OpenKeyReadOnly(Key) then
    begin
      try
        RegDataType := Reg.GetDataType(Value);
        if (RegDataType = rdString) or (RegDataType = rdExpandString) then
          Result := Reg.ReadString(Value)
        else if RegDataType = rdInteger then
          Result := Reg.ReadInteger(Value)
        else if RegDataType = rdBinary then
        begin
          DataSize := Reg.GetDataSize(Value);
          if DataSize = -1 then
            goto cantread;
          SetLength(s, DataSize);
          Len := Reg.ReadBinaryData(Value, PChar(s)^, DataSize);
          if Len <> DataSize then
            goto cantread;
          Result := s;
        end
        else
          cantread:
        raise Exception.Create(SysErrorMessage(ERROR_CANTREAD));
      except
        s := '';
        Reg.CloseKey;
        raise;
      end;
      Reg.CloseKey;
    end
    else
      raise Exception.Create(SysErrorMessage(GetLastError));
  except
    Reg.Free;
    raise;
  end;
  Reg.Free;
end;

procedure CreateDirectoryIfNotExist(Directory: String);
begin
  if not DirectoryExists(Directory) then
    if not CreateDirectory(PChar(Directory), nil) then
      raise Exception.Create('Error al crear el directorio ' + Directory + '.' + SysErrorMessage(GetLastError));
end;

procedure ForzarCrearDirectorio(Directory: String);
begin
  if not DirectoryExists(Directory) then
    if not (ForceDirectories(Directory)) then
      raise Exception.Create('Error al crear el directorio ' + Directory);
end;

end.
