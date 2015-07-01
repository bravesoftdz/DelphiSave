unit unObjEmision;

interface

uses
  Classes;

type

  TContacto = class
  private
    FIdTextoReferencia: integer;
    FTipoContacto: String;
  public
    constructor Create(aTipoContacto: String; aIdTextoReferencia: Integer);
    property IdTextoReferencia: integer read FIdTextoReferencia write FIdTextoReferencia;
    property TipoContacto: String read FTipoContacto write FTipoContacto;
  end;

  TGestor = class
  private
    FId: integer;
    FUsuario: String;
    FSector: String;
  public
    constructor Create(aUsuario: String; aSector: String);
    property Id: integer read FId write FId;
    property Usuario: String read FUsuario write FUsuario;
    property Sector: String read FSector write FSector;
  end;


implementation

constructor TContacto.Create(aTipoContacto: String; aIdTextoReferencia: Integer);
begin
  FIdTextoReferencia := aIdTextoReferencia;
  FTipoContacto := aTipoContacto;
end;

{ TGestor }

constructor TGestor.Create(aUsuario, aSector: String);
begin
  FUsuario := aUsuario;
  FSector := aSector;
end;

end.
