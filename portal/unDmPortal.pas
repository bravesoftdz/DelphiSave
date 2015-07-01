unit unDmPortal;

interface

uses
  Windows, Controls, Forms, SysUtils, Classes, JvDataEmbedded, ArtDatabase, ParamFuncs, unDirUtils, IniFiles, CustomDlgs;

type
  TdmPortal = class(TDataModule)
  private
    function GetSettingsFileName: String;
  public
    function SetIniSettings(ASection: String; SDDatabase: TArtDatabase): Boolean;
  end;

var
  dmPortal: TdmPortal;

implementation

uses
  unCustomDataModule;

{$R *.dfm}

function TdmPortal.SetIniSettings(ASection: String; SDDatabase: TArtDatabase): Boolean;
var
  IniFile: TIniFile;
//  IniFilePath : string;
  sDbSection: String;
begin
  Result        := False;
  Screen.Cursor := crHourGlass;

  IniFile := TIniFile.Create(GetSettingsFileName);
  try
    with SDDatabase do
    begin
      RemoteDataBase := IniFile.ReadString('Base de Datos', ASection, 'PART');
      sDbSection := 'DataBase.' + RemoteDataBase;

      PasswordFile := IniFile.FileName;
      Close;
      Params.Clear;

      SDDatabase.LoginPrompt := Pos('login', LowerCase(CommandLine)) > 0;

       try
        Open;
        Result := Connected;
       except
        on E: Exception do
        begin
          Screen.Cursor := crDefault;
          ErrorMsg(E, 'Error al establecer la Conexión con el Servidor de Datos "' + RemoteDataBase + '".');
          Application.Terminate;
        end;
      end;
    end;
  finally
    IniFile.Free;
    Screen.Cursor := crDefault;
//    DeleteIniFile(IniFilePath);
  end;
end;

function TdmPortal.GetSettingsFileName: String;
begin
  Result := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0))) + 'SIART.INI';
  if not FileExists(Result) then
    Result := 'SIART.INI';
end;

end.
