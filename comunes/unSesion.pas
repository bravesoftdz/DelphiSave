unit unSesion;

interface

uses
  unART, ARTDBLogin;

type
  TSesion = class
  private
    DBLogin: TDBLogin;
    FLoaded: boolean;
  public
    Usuario, Perfil, Sector, LoginName, UserID, UserMail, Interno, SectorDesc: string;
    Delegacion: {$IFDEF ART2}TTableId{$ELSE}string{$ENDIF};
    ID: integer;
    constructor Create;
    property Loaded: boolean read FLoaded write FLoaded;
  end;

  function Sesion: TSesion;

implementation

uses
  unDmPrincipal, SysUtils;

var
  objSesion: TSesion;

function Sesion: TSesion;
begin
  if not Assigned(objSesion) then
    objSesion := TSesion.Create
  else
    if Assigned(objSesion) and not objSesion.Loaded then
    begin
      objSesion.Free;
      objSesion := TSesion.Create;
    end;

  Result := objSesion;
end;

{ TSesion }

constructor TSesion.Create;
begin
  FLoaded := False;
  try
    dbLogin := TDBLogin.Create(nil);
    with dbLogin do
    begin
      AutoEjecutar        := True;
      AutoExecute         := False;
      CheckDateFormat     := True;
      CheckMultipleLogins := False;
      CheckServerDate     := True;
      CheckVersion        := True;
      DataBaseName        := dmPrincipal.sdbPrincipal;
      LockUserName        := False;
      Name                := 'DBLogin';
      Shake               := True;
      UseNetworkUser      := True;
      Execute;
    end;

    Usuario    := DBLogin.Usuario;
    Perfil     := DBLogin.Perfil;
    Sector     := DBLogin.Sector;
    LoginName  := DBLogin.LoginName;
    Delegacion := DBLogin.Delegacion;
    UserID     := DBLogin.UserID;
    UserMail   := DBLogin.UserMail;
    ID         := DBLogin.ID;
    Interno    := Trim(ValorSQLEx('SELECT SE_INTERNO FROM USE_USUARIOS WHERE SE_USUARIO = :V1', [DBLogin.UserID]));//DBLogin.Interno; {a futuro...}
    SectorDesc := Trim(ValorSQLEx('SELECT SC_DESCRIPCION FROM USC_SECTORES WHERE SC_CODIGO = :V1', [DBLogin.Sector]));//DBLogin.SectorDesc; {a futuro...}
  except
  end;
  
  FLoaded := True;
end;

initialization
finalization
  objSesion.Free; 
end.
