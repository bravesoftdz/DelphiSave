unit unfraUsuariosExternos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraCodigoDescripcion, Db, SDEngine,
  PatternEdit, StdCtrls, Mask, ToolEdit, ArtComboBox;

type
  TfraUsuariosExternos = class(TfraCodigoDescripcion)
  private
    FPerfil: String;
    FSector: String;

    function GetOrigen: String;

    procedure SetPerfil(const Value: String);
    procedure SetSector(const Value: String);

    {$IFDEF ART2}
    function  GetValue: String; reintroduce; //AGREGUE 'Reintroduce' - By Lefe para evitar mensaje de compilador
    procedure SetValue(const Value: String); reintroduce;
    {$ENDIF}
  protected
    function GetIsEmpty: Boolean; override;
    function GetSqlWhere: String; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Origen: String read GetOrigen;
    property Perfil: String read FPerfil write SetPerfil;
    property Sector: String read FSector write SetSector;
    
   {$IFDEF ART2}
    property Value: String read GetValue write SetValue;
   {$ENDIF}
  end;

var
  fraUsuariosExternos: TfraUsuariosExternos;

implementation

{$R *.DFM}

uses
  AnsiSQL, undmPrincipal;

const
  CD_ALIAS_ORIGEN = 'IE_ORIGEN';

{ TfraUsuariosExternos }
constructor TfraUsuariosExternos.Create(AOwner: TComponent);
begin
  inherited;
  CaseSensitive := False;

  FTableName   := 'V_CIE_USUARIO_INT_EXT';
  FFieldID     := 'IE_USUARIO';
  FFieldCodigo := 'IE_USUARIO';
  FFieldDesc   := 'IE_NOMBRE';
  FFieldBaja   := 'IE_FECHABAJA';
  FExtraFields := ', IE_ORIGEN, IE_SECTOR, IE_PERFIL ';
end;

{$IFDEF ART2}
function TfraUsuariosExternos.GetValue: String;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsString
  else
    Result := '';
end;

procedure TfraUsuariosExternos.SetValue(const Value: String);
var
  sSql: String;
begin
  sSql := GetSql + GetSqlWhere + ' AND ' + FTableName + '.' + FFieldID + ' = ' + SqlValue(Value);

  if OpenQuery(sdqDatos, sSql, True) then
    LoadValues;
end;
{$ENDIF}

procedure TfraUsuariosExternos.SetPerfil(const Value: String);
begin
  if FPerfil <> Value then
  begin
    FPerfil := Value;
    if sdqDatos.Active and (sdqDatos.FieldByName('IE_PERFIL').AsString <> Value) then
      Clear;
  end;
end;

procedure TfraUsuariosExternos.SetSector(const Value: String);
begin
  if FSector <> Value then
  begin
    FSector := Value;
    if sdqDatos.Active and (sdqDatos.FieldByName('IE_SECTOR').AsString <> Value) then
      Clear;
  end;
end;

function TfraUsuariosExternos.GetSqlWhere: String;
begin
  Result := inherited GetSqlWhere;

  if FPerfil <> '' then
    Result := Result + ' AND (IE_PERFIL IS NULL OR IE_PERFIL = ' + SqlValue(FPerfil) + ')';

  if FSector <> '' Then
    Result := Result + ' AND (IE_SECTOR IS NULL OR IE_SECTOR = ' + SqlValue(FSector) + ')';
end;

function TfraUsuariosExternos.GetOrigen: String;
begin
  FrameExit(nil); // Valida que todo este completo
  if sdqDatos.Active then
    Result := sdqDatos.FieldByName(CD_ALIAS_ORIGEN).AsString
  else
    Result := '';
end;

function TfraUsuariosExternos.GetIsEmpty: Boolean;
begin
  Result := (GetValue = '');
end;

end.
