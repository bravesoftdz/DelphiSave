unit unUtilsPortal;

interface

uses
  Windows, Graphics, shellapi, Registry, SysUtils, Classes, ArchFuncs;
  
function GetApplicationMessage(APath: string): string;
function GetGeneralMessage: string;
function Get_PathMensajes: string;
procedure ExtractIconFromFile(AIcon: TIcon; AFile: String);

implementation

uses
  SqlFuncs, unDirUtils, IniFiles, CustomDlgs, unDmPrincipal, unCustomDataModule;

function GetErrorMessage(AMensaje: string): string;
var
 fs   : TStringList;
 buff : string;
begin
 fs := TStringList.Create;
 try
  buff := '';
  try
    if FileExists(AMensaje) then begin
        fs.LoadFromFile(AMensaje);
        buff := fs.Text;
    end
    else buff := '';
  except
     //Protejo de problemas de red.
  end;

  result := buff;
 finally
    fs.free;
 end;
end;

function GetGeneralMessage: string;
var
  mensaje : string;
begin
  mensaje := Get_PathMensajes;
  result := GetErrorMessage(IncludeTrailingBackslash(mensaje) + 'mensaje.txt');
end;

function GetApplicationMessage(APath: string): string;
var
 fn : string;
 mensaje : string;
begin
  mensaje := Get_PathMensajes;
  fn := IncludeTrailingBackslash(mensaje) +  ChangeFileExt(ExtractFileName(APath), '.txt');

  result := GetErrorMessage(fn);
end;

procedure ExtractIconFromFile(AIcon: TIcon; AFile: String);
var
  IconIndex : word;
begin
  IconIndex := 0;
  if FileExists(AFile) then
    AIcon.Handle := ExtractAssociatedIcon(hInstance,Pchar(AFile), IconIndex);
end;

function Get_DirectorioMensaje: String;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(GetSettingsFileName);
  try
    Result := IniFile.ReadString('Directorios', 'Mensajes', '\apps$\');
  finally
    IniFile.Free;
  end;
end;

function Get_PathMensajes: string;
begin
  result := '\\' + Get_Servidor + Get_DirectorioMensaje;
end;

end.
