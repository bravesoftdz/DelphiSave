unit unfraCtbTablasX;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox;

type
  TfraCtbTablasX = class(TfraCodigoDescripcion)
  private
    FClave: String;
    procedure SetClave(const Value: String);
  protected
    function IsBaja : Boolean; override;
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

    { Para Compatibilidad con la Versión Anterior }
    procedure Limpiar;
    procedure Cargar( ACodigo : String );
  published
    Property  Clave      : String       read FClave       write SetClave;
  end;

var
  fraCtbTablasX: TfraCtbTablasX;

implementation

{$R *.DFM}

uses unDmPrincipal, General, SqlOracle;


{ TfraCtbTablasX }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraCtbTablasX.Create(AOwner: TComponent);
begin
  inherited;
  FTableName   := 'CTB_TABLAS';
  FFieldID     := 'TB_CODIGO';
  FFieldCodigo := 'TB_CODIGO';
  FFieldDesc   := 'TB_DESCRIPCION';
  FFieldBaja   := 'TB_BAJA';
  FExtraFields := ', TB_CLAVE, TB_ESPECIAL1 ';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCtbTablasX.GetSqlWhere: String;
begin
   Result := IIF(FShowBajas   , '', ' AND TB_BAJA <> ''S'' ') +
             IIF(FClave =  '' , '', ' AND TB_CLAVE = ' + SqlString(FClave, True) + ' ' );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablasX.SetClave(const Value: String);
begin
  if FClave <> Value Then begin
     FClave := Value;
     if sdqDatos.Active and (sdqDatos.FieldByName('TB_CLAVE').AsString <> FClave) Then
        Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCtbTablasX.IsBaja: Boolean;
begin
  Result := sdqDatos.FieldByName(CD_ALIAS_BAJA).AsString = 'S';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablasX.Cargar(ACodigo: String);
begin
  Value := ACodigo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCtbTablasX.Limpiar;
begin
  Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
