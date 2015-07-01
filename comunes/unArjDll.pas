(*
 *  interface part for UnARJ.DLL v1.0
 *
 *  written by Alexander Sakhatovsky,
 *  sakhatovsky@yandex.ru
 *
 *  Specail thanks to Eugene Roshal (http://www.rarsoft.com/)
 *  for his UNRAR.DLL
 *)

unit UnArjDLL;

interface

uses Windows;

{$I unarj.inc}

(*  Genral use:
 *
 *    if ARJOpenArchive(ArchiveFileName, Archive) then
 *    try
 *       while ARJReadHeader(Archive, HeaderData) = ERROR_OK do
 *       begin
 *         ..
 *         ErrCode := ARJProcessFile(Archive, Mode, nil, PChar(OemToAnsi(FileName)));
 *       end;
 *    finally
 *      ARJCloseArchive(Archive);
 *    end;
 *)

type
  TARJGetDLLVersion   = function: LongInt; stdcall;
  (*
   *  Description:
   *    return current DLL version
   *
   *  Parameters:
   *    none
   *
   *  Return values:
   *    current DLL version
   *
   *)

  TARJOpenArchive     = function (FileName: PChar; var Archive: LongInt): LongInt; stdcall;
  (*
   *  Description:
   *    open ARJ archive
   *
   *  Parameters:
   *    FileName  - Input parameter which should point to a, zero terminated string
   *                containing the archive name.
   *    Archive   - Output parameter containing Archive handle for sucessful call
   *
   *  Return values:
   *    ErrorCode - possible values:
   *      ERROR_OK      - Succes
   *      ERROR_NOT_ARJ - File is not valid RAR archive
   *      ERROR_OPEN    - Can't open file
   *      ERROR_FAIL    - Fail to open file
   *
   *)

  TARJCloseArchive    = function (Archive: LongInt): LongInt; stdcall;
  (*
   *  Description:
   *    close ARJ archive
   *
   *  Parameters:
   *    Archive   - Input parameter containing Archive handle obtained from the
   *                ARJOpenArchive function call
   *
   *  Return values:
   *    ErrorCode - possible values:
   *      ERROR_OK          - Succes
   *      ERROR_WRONG_PARAM - Invalid Archive handle
   *)

  TARJReadHeader      = function (Archive: LongInt; var HeaderData: TARJHeaderData): LongInt; stdcall;
  (*
   *  Description:
   *    read header of file in archive
   *
   *  Parameters:
   *    Archive     - Input parameter containing Archive handle obtained from the
   *                  ARJOpenArchive function call
   *    HeaderData  - It should point to TARJHeaderData structure
   *
   *  Return values:
   *    ErrorCode - possible values:
   *      ERROR_OK    - Succes
   *      ERROR_xx    - see unarj.inc for details
   *)

  TARJProcessFile     = function (Archive: LongInt; Operation: Integer; DestPath, DestName: PChar): LongInt; stdcall;
  (*
   *  Description:
   *    Performs action and moves the current position in the archive to
   *    the next file. Extract/Test/Skip the current file from the archive
   *
   *  Parameters:
   *    Archive     - Input parameter containing Archive handle obtained from the
   *                  ARJOpenArchive function call
   *    Opeartion   - File operation:
   *      ARJ_SKIP    - skip file
   *      ARJ_TEST    - test file
   *      ARJ_EXTRACT - extract file
   *
   *    DestPath    - This parameter should point to a zero terminated string
   *                  containing the destination directory to which to extract
   *                  files to. If DestPath is equal to NULL it means extract
   *                  to the current directory. This parameter has meaning only
   *                  if DestName is NULL.
   *    DestName    - This parameter should point to a string containing the full
   *                  path and name of the file to be extracted or NULL as default.
   *                  If DestName is defined (not NULL) it overrides the original
   *                  file name saved in the archive and DestPath setting.
   *
   *      Both DestPath and DestName must be in OEM encoding. If necessary,
   *      use CharToOem to convert text to OEM before passing to this function.
   *
   *  Return values:
   *    ErrorCode - possible values:
   *      ERROR_OK    - Succes
   *      ERROR_xx    - see unarj.inc for details
   *
   *)

  TARJSetChangeVolume = procedure (ChangeVolumeProc: TChangeVolume); stdcall;
  (*
   *  Description:
   *    setup ChangeVolumeProc
   *
   *  Parameters:
   *    ChangeVolumeProc  - pointer to TChangeVolume proc
   *
   *)

  TARJSetProgress     = procedure (ProgressNotifyProc: TProgressNotify); stdcall;
  (*
   *  Description:
   *    setup ProgressNotifyProc
   *
   *  Parameters:
   *    ProgressNotifyProc  - pointer to TProgressNotify proc
   *
   *)

  // service function
  function  LoadUnARJ(const Path: String = ''): Longword;
  procedure UnloadUnARJ;
  function  IsUnARJLoaded: Boolean;

var
  ARJGetDLLVersion  : TARJGetDLLVersion;
  ARJOpenArchive    : TARJOpenArchive;
  ARJCloseArchive   : TARJCloseArchive;
  ARJReadHeader     : TARJReadHeader;
  ARJProcessFile    : TARJProcessFile;
  ARJSetChangeVolume: TARJSetChangeVolume;
  ARJSetProgress    : TARJSetProgress;

const
  UnARJFileName = 'unarj.dll';

implementation

uses  SysUtils;

var
  UnARJHandle: THandle;

function LoadUnARJ(const Path: String = ''): Longword;
begin
  if Path = '' then
    UnARJHandle := LoadLibrary(PChar(UnARJFileName))
  else
    UnARJHandle := LoadLibrary(PChar(IncludeTrailingBackslash(Path) + UnARJFileName));

  Result := UnARJHandle;

  if IsUnARJLoaded then
  begin
    @ARJGetDLLVersion   := GetProcAddress(UnARJHandle, 'ARJGetDLLVersion');
    @ARJOpenArchive     := GetProcAddress(UnARJHandle, 'ARJOpenArchive');
    @ARJCloseArchive    := GetProcAddress(UnARJHandle, 'ARJCloseArchive');
    @ARJReadHeader      := GetProcAddress(UnARJHandle, 'ARJReadHeader');
    @ARJProcessFile     := GetProcAddress(UnARJHandle, 'ARJProcessFile');
    @ARJSetChangeVolume := GetProcAddress(UnARJHandle, 'ARJSetChangeVolume');
    @ARJSetProgress     := GetProcAddress(UnARJHandle, 'ARJSetProgress');
  end;
end;

procedure UnloadUnARJ;
begin
  if IsUnARJLoaded then
    FreeLibrary(UnARJHandle);
end;

function  IsUnARJLoaded: Boolean;
begin
  Result := (UnARJHandle <> 0);
end;

end.
