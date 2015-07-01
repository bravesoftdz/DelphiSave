unit unfraDelegacion;

interface

uses
  {$IFDEF VER180} rxPlacemnt, rxToolEdit, rxCurrEdit, {$ELSE} Placemnt, ToolEdit, CurrEdit, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ArtComboBox, RxToolEdit;

type
  TfraDelegacion = class(TfraCodigoDescripcion)
  private
    FOnLine: Boolean;
    procedure SetOnLine(const Value: Boolean);
  protected
    property  FieldID;
    property  FieldCodigo;
    property  FieldDesc;
    property  FieldBaja;
    property  ExtraFields;
    property  ExtraCondition;
    function GetSqlWhere : String; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property OnLine : Boolean read FOnLine write SetOnLine default True;
  end;

var
  fraDelegacion: TfraDelegacion;

implementation

uses
  AnsiSql;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraDelegacion }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraDelegacion.Create(AOwner: TComponent);
begin
  inherited;
  FOnLine       := True;
  CaseSensitive := False;
  FTableName    := 'DEL_DELEGACION';
  FFieldID      := 'EL_ID';
  FFieldCodigo  := 'EL_ID';
  FFieldDesc    := 'EL_NOMBRE';
  FFieldBaja    := 'EL_FECHABAJA';
  FExtraFields  := ', EL_LOCALIDAD, EL_SISTEMA, ' +
                   'UTILES.Armar_Domicilio(EL_CALLE, EL_NUMERO, EL_PISO, EL_DEPARTAMENTO) DIRECCION, ' +
                   'UTILES.Armar_Telefono(EL_CODAREATELEFONOS, NULL, EL_TELEFONOS) TELEFONO ';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraDelegacion.GetSqlWhere: String;
begin
  Result := inherited GetSqlWhere;
  if FOnLine Then
     Result := Result + ' AND EL_SISTEMA = ''S'' ';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraDelegacion.SetOnLine(const Value: Boolean);
begin
  if FOnLine <> Value Then begin
     FOnLine := Value;
     if sdqDatos.Active and ( sdqDatos.FieldByName('EL_SISTEMA').AsString <> SqlBoolean( Value, False ) ) then
        Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
