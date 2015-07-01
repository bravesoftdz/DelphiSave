{********************************************************}
{                                                        }
{    Frame de Búsqueda de Usuarios  (USE_USUARIOS)       }
{    Permite buscar usuarios en la base de datos,        }
{    filtrándolo o no previamente por Sector o Perfil    }
{                                                        }
{    Autor: Federico Firenze                             }
{                                                        }
{********************************************************}

unit unFraUsuario;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraCodigoDescripcion, Db, SDEngine,
  PatternEdit, StdCtrls, Mask, ArtComboBox, RxToolEdit;

type
  TValueType = String;

  TfraUsuarios = class(TfraCodigoDescripcion)
  private
    FMostrarGenericos: Boolean;
    FPerfil: String;
    FSector: String;
    FBajasParciales: Boolean;

    procedure SetMostrarGenericos(const Value: Boolean);
    procedure SetPerfil(const Value: String);
    procedure SetSector(const Value: String);
    procedure SetBajasParciales(const Value: Boolean);
  protected
   {$IFDEF ART2}
    function  GetValue: TValueType; reintroduce; //AGREGUE 'Reintroduce' - By Lefe para evitar mensaje de compilador
    procedure SetValue(const Value: TValueType); reintroduce;
   {$ELSE}
    function GetValue: TValueType; override;
    procedure SetValue(const Value: TValueType); override;
   {$ENDIF}
    function GetIsEmpty: Boolean; override;
    function GetSqlWhere: String; override;

    {Oculta las Propiedades}
    property TableName;
    property FieldID;
    property FieldCodigo;
    property FieldDesc;
    property FieldBaja;
    property ExtraFields;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BajasParciales: Boolean   read FBajasParciales   write SetBajasParciales;
    property MostrarGenericos: Boolean read FMostrarGenericos write SetMostrarGenericos;
    property Perfil: String            read FPerfil           write SetPerfil;
    property Sector: String            read FSector           write SetSector;
    property Value : TValueType        read GetValue          write SetValue;
  end;

implementation

uses
  AnsiSql, unDmPrincipal, General;

{$R *.DFM}


{ TfraUsuarios }

constructor TfraUsuarios.Create(AOwner: TComponent);
begin
  inherited;
  
  CodigoType    := ctString;
  IdType        := ctString;
  CaseSensitive := False;

  FTableName    := 'USE_USUARIOS';
  FFieldID      := 'SE_USUARIO';
  FFieldCodigo  := 'SE_USUARIO';
  FFieldDesc    := 'SE_NOMBRE';
  FFieldBaja    := 'SE_FECHABAJA';
  FExtraFields  := ', SE_PERFIL, SE_SECTOR, SE_ID, SE_DELEGACION ';

  FMostrarGenericos := False;
  FBajasParciales := False;
end;

function TfraUsuarios.GetSqlWhere: String;
begin
  Result := inherited GetSqlWhere;

  if not FMostrarGenericos then
    Result := Result + ' AND SE_USUARIOGENERICO = ''N''';

  if FPerfil <> '' then
    Result := Result + ' AND SE_PERFIL = ' + SqlValue(FPerfil);

  if FSector <> '' then
    Result := Result + ' AND SE_SECTOR = ' + SqlValue(FSector);
end;
{$IFDEF ART2}
function TfraUsuarios.GetValue: TValueType;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsString
  else
    Result := '';
end;

procedure TfraUsuarios.SetValue(const Value: TValueType);
var
  sSql: String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ' + FTableName + '.' + FFieldID + ' = ' + SqlValue(Value);

  if OpenQuery(sdqDatos, sSql, True) then
    LoadValues;
end;
{$ELSE}
function TfraUsuarios.GetValue: TValueType;
begin
  Result := inherited GetValue;
end;

procedure TfraUsuarios.SetValue(const Value: TValueType);
begin
  inherited SetValue(Value);
end;
{$ENDIF}
procedure TfraUsuarios.SetPerfil(const Value: String);
begin
  if FPerfil <> Value then
  begin
    FPerfil := Value;
    if sdqDatos.Active and (sdqDatos.FieldByName('SE_PERFIL').AsString <> Value) then
      Clear;
  end;
end;

procedure TfraUsuarios.SetSector(const Value: String);
begin
  if FSector <> Value then
  begin
    FSector := Value;
    if sdqDatos.Active and (sdqDatos.FieldByName('SE_SECTOR').AsString <> Value) then
      Clear;
  end;
end;

function TfraUsuarios.GetIsEmpty: Boolean;
begin
  Result := GetValue = '';
end;

procedure TfraUsuarios.SetMostrarGenericos(const Value: Boolean);
begin
  if FMostrarGenericos <> Value then
  begin
    FMostrarGenericos := Value;
    if sdqDatos.Active and (sdqDatos.FieldByName('SE_USUARIOGENERICO').AsString <> IIF(Value, 'S', 'N')) then
      Clear;
  end;
end;

procedure TfraUsuarios.SetBajasParciales(const Value: Boolean);
begin
  FBajasParciales := Value;
  if Value then
  begin
    FShowBajas := True;
    FExtraCondition := FExtraCondition + ' AND ((SE_FECHABAJA IS NULL) OR (SE_FECHABAJA > ART.ACTUALDATE - 30)) ';
  end;
end;

end.
