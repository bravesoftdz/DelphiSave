
{********************************************************}
{                                                        }
{    Frame CTB_TABLAS                                    }
{    Frame heredado de TfraCodigoDescripcion que busca   }
{    registros de la tabla CTB_TABLAS.                   }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha: 01/2002                                      }
{                                                        }
{********************************************************}

unit unfraCtbTablas;

interface

uses
  {$IFDEF VER180} rxToolEdit, {$ELSE} ToolEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ArtComboBox, unArt, RxToolEdit;

type
//  TCtbClave = string[5]; //array[0..4] of Char;
  TfraCtbTablas = class(TfraCodigoDescripcion)
  private
    FClave: TCtbClave;
    FEspecial1: String;
    FEspecial2: String;
    procedure SetClave(const Value: TCtbClave);
    procedure SetEspecial1(const Value: String);
    procedure SetEspecial2(const Value: String);
    function GetEspecial1: String;
    function GetEspecial2: String;
  protected
    function GetValue: TCtbCodigo; reintroduce;
    procedure SetValue(const Value: TCtbCodigo); reintroduce;

    function GetIsEmpty: boolean; override;
    function GetSqlWhere  : String; override;

    {Oculta las Propiedades}
    property  TableName;
    property  FieldID;
    property  FieldCodigo;
    property  FieldDesc;
    property  FieldBaja;
    property  ExtraFields;
  public
    constructor Create(AOwner: TComponent); override;
    function IsBaja : Boolean; override;

    { Para Compatibilidad con la Versión Anterior }
    procedure Limpiar;
    {$IFNDEF ART2}
    procedure Cargar( ACodigo : String );
    {$ENDIF}
  published
    property Clave      : TCtbClave      read FClave       write SetClave;
    property Value      : TCtbCodigo     read GetValue     write SetValue;
    property Especial1  : String         read GetEspecial1 write SetEspecial1;
    property Especial2  : String         read GetEspecial2 write SetEspecial2;
  end;
{
var
  fraCtbTablas: TfraCtbTablas;
}
implementation

{$R *.DFM}

uses unDmPrincipal, General, AnsiSql;


{------------------------------------------------------------------------------}
{ TfraCtbTablasX }
{------------------------------------------------------------------------------}
constructor TfraCtbTablas.Create(AOwner: TComponent);
begin
  inherited;
  FTableName   := 'CTB_TABLAS';
  FFieldID     := 'TB_CODIGO';
  FFieldCodigo := 'TB_CODIGO';
  FFieldDesc   := 'TB_DESCRIPCION';
  {$IFDEF ART2}
  FFieldBaja   := 'TB_FECHABAJA';
  {$ELSE}
  FFieldBaja   := 'TB_BAJA';
  {$ENDIF}
  FExtraFields := ', TB_CLAVE, TB_ESPECIAL1, TB_ESPECIAL2 ';
end;
{------------------------------------------------------------------------------}
function TfraCtbTablas.GetSqlWhere: String;
begin
   Result := ' AND TB_CODIGO <> ''0'' ' +
             {$IFDEF ART2}
             IIF(FShowBajas   , '', ' AND TB_FECHABAJA IS NULL ') +
             {$ELSE}
             IIF(FShowBajas   , '', ' AND TB_BAJA <> ''S'' ') +
             {$ENDIF}
             IIF(FClave =  '' , '', ' AND TB_CLAVE = ' + SqlString(FClave, True) + ' ' ) +
             IIF(FEspecial1 =  '' , '', ' AND TB_ESPECIAL1 = ' + SqlString(FEspecial1, True) + ' ' ) +
             IIF(FEspecial2 =  '' , '', ' AND TB_ESPECIAL2 = ' + SqlString(FEspecial2, True) + ' ' );
end;
{------------------------------------------------------------------------------}
procedure TfraCtbTablas.SetClave(const Value: TCtbClave);
begin
  if FClave <> Value Then begin
     FClave := Value;
     if sdqDatos.Active and (sdqDatos.FieldByName('TB_CLAVE').AsString <> FClave) Then
        Clear;
  end;
end;
{------------------------------------------------------------------------------}
function TfraCtbTablas.IsBaja: Boolean;
begin
  {$IFDEF ART2}
  Result := inherited IsBaja;
  {$ELSE}
  if sdqDatos.Active and (not sdqDatos.IsEmpty) and Assigned(sdqDatos.FindField(CD_ALIAS_BAJA)) then
    Result := sdqDatos.FieldByName(CD_ALIAS_BAJA).AsString = 'S'
  else
    Result := False;
  {$ENDIF}
end;
{------------------------------------------------------------------------------}
{$IFNDEF ART2}
procedure TfraCtbTablas.Cargar(ACodigo: String);
begin
  Value := ACodigo;
end;
{$ENDIF}
{------------------------------------------------------------------------------}
procedure TfraCtbTablas.Limpiar;
begin
  Clear;
end;
{------------------------------------------------------------------------------}
function TfraCtbTablas.GetValue: TCtbCodigo;
begin
   FrameExit( Nil ); // Valida que todo este completo
   if sdqDatos.Active Then
      Result := sdqDatos.FieldByName(CD_ALIAS_ID).AsString
   else
      Result := '';
end;
{------------------------------------------------------------------------------}
procedure TfraCtbTablas.SetValue(const Value: TCtbCodigo);
Var sSql : String;
begin
   sSql := GetSql + GetSqlWhere + ' AND ' + FTableName + '.' + FFieldID + ' = ' + SqlValue( Value );

   if OpenQuery(sdqDatos, sSql, True) Then
      LoadValues;
end;
{------------------------------------------------------------------------------}
function TfraCtbTablas.GetIsEmpty: boolean;
begin
  Result := GetValue = '';
end;
{------------------------------------------------------------------------------}
procedure TfraCtbTablas.SetEspecial1(const Value: String);
begin
  if FEspecial1 <> Value Then begin
    FEspecial1 := Value;
    if sdqDatos.Active and (sdqDatos.FieldByName('TB_ESPECIAL1').AsString <> Value) Then
      Clear;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfraCtbTablas.SetEspecial2(const Value: String);
begin
  if FEspecial2 <> Value Then begin
    FEspecial2 := Value;
    if sdqDatos.Active and (sdqDatos.FieldByName('TB_ESPECIAL2').AsString <> Value) Then
      Clear;
  end;
end;
{------------------------------------------------------------------------------}
function TfraCtbTablas.GetEspecial1: String;
begin
  if (sdqDatos.Active) and (not sdqDatos.IsEmpty) then
    Result := sdqDatos.FieldByName('TB_ESPECIAL1').AsString
  else
    Result := FEspecial1;
end;
{------------------------------------------------------------------------------}
function TfraCtbTablas.GetEspecial2: String;
begin
  if (sdqDatos.Active) and (not sdqDatos.IsEmpty) then
    Result := sdqDatos.FieldByName('TB_ESPECIAL2').AsString
  else
    Result := FEspecial2;
end;
{------------------------------------------------------------------------------}
end.
