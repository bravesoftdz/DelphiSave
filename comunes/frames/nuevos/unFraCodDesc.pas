unit unFraCodDesc;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ArtComboBox, unPropiedadesFrame, RxToolEdit;

type
  TfraCodDesc = class(TfraCodigoDescripcion)
    Propiedades: TPropiedadesFrame;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure PropiedadesDBAwareChange(Sender: TObject);
  private
    procedure AssignProperties;
    function GetFullLikeComparison: Boolean;
  protected
    procedure Change; override;
    function GetExtraCondition: String; override;
    function GetExtraFields: String; override;
    function GetFieldBaja: String; override;
    function GetFieldCodigo: String; override;
    function GetFieldDesc: String; override;
    function GetFieldID: String; override;
    function GetIsEmpty: boolean; override;
    function GetOrderBy: String; override;
    function GetShowBajas: Boolean; override;
    function GetSql: String; override;
    function GetTableName: string; override;
    procedure SetShowBajas(const Value: Boolean); override;
    procedure SetSql(const Value: String);
    {Oculto todas estas propiedades para que se use el componente TPropiedadesFrame}
    property DataField;
    property DataSource;
    property ExtraCondition     : String       read GetExtraCondition     write FExtraCondition;
    property ExtraFields        : String       read GetExtraFields        write FExtraFields;
    property FieldBaja          : String       read GetFieldBaja          write FFieldBaja;
    property FieldCodigo        : String       read GetFieldCodigo        write FFieldCodigo;
    property FieldDesc          : String       read GetFieldDesc          write FFieldDesc;
    property FieldID            : String       read GetFieldID            write FFieldID;
    property FullLikeComparison : Boolean      read GetFullLikeComparison write FFullLikeComparison;
    property OrderBy            : String       read GetOrderBy            write FOrderBy;
    property ShowBajas          : Boolean      read GetShowBajas          write SetShowBajas;
    property Sql                : String       read GetSql                write SetSql;
    property TableName          : String       read GetTableName          write FTableName;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddExtraCondition(ACondition: string);
    procedure AfterConstruction; override;
  end;

var
  fraCodDesc: TfraCodDesc;

implementation

{$R *.DFM}

uses
  General, SQLFuncs;
  
procedure TfraCodDesc.cmbDescripcionDropDown(Sender: TObject);
begin
  AssignProperties;
  inherited;
end;

procedure TfraCodDesc.PropiedadesDBAwareChange(Sender: TObject);
begin
  inherited;
  DataSource := Propiedades.DataSource;
  if Assigned(Propiedades.DataField) then
    DataField := Propiedades.DataField.FieldName;
end;

procedure TfraCodDesc.AssignProperties;
var
  sTexto1, sTexto2: string;
begin
  sTexto1 := edCodigo.Text;
  sTexto2 := cmbDescripcion.Text;

  FCaseSensitive := Propiedades.CaseSensitive;
  FFullLikeComparison := Propiedades.FullLikeComparison;
  FShowBajas := Propiedades.ShowBajas;
  FTableName := Propiedades.TableName;
  FFieldID := Propiedades.FieldID;
  FFieldCodigo := Propiedades.FieldCodigo;
  FFieldDesc := Propiedades.FieldDesc;
  FFieldBaja := iif(Propiedades.FieldBaja > '', Propiedades.FieldBaja, FFieldBaja);
  FExtraFields := Propiedades.ExtraFields;
  FExtraCondition := Propiedades.ExtraCondition;
  FOrderBy := Propiedades.OrderBy;
  FCodigoType := unFraCodigoDescripcion.TCodigoType(Propiedades.CodigoType);

  edCodigo.Text := sTexto1;
  cmbDescripcion.Text := sTexto2;
end;

function TfraCodDesc.GetFullLikeComparison: Boolean;
begin
  if Propiedades.FullLikeComparison <> FFullLikeComparison then
    Result := Propiedades.FullLikeComparison
  else
    Result := FFullLikeComparison;
end;

procedure TfraCodDesc.Change;
begin
  if Assigned(Propiedades.OnChange) then
    Propiedades.OnChange(Self);

  inherited;
end;

function TfraCodDesc.GetExtraCondition: String;
begin
  if Propiedades.ExtraCondition > '' then
    Result := Propiedades.ExtraCondition
  else
    Result := FExtraCondition;
end;

function TfraCodDesc.GetExtraFields: String;
begin
  if Propiedades.ExtraFields > '' then
    Result := Propiedades.ExtraFields
  else
    Result := FExtraFields;
end;

function TfraCodDesc.GetFieldBaja: String;
begin
  if Propiedades.FieldBaja > '' then
    Result := Propiedades.FieldBaja
  else
    Result := FFieldBaja;
end;

function TfraCodDesc.GetFieldCodigo: String;
begin
  if Propiedades.FieldCodigo > '' then
    Result := Propiedades.FieldCodigo
  else
    Result := FFieldCodigo;
end;

function TfraCodDesc.GetFieldDesc: String;
begin
  if Propiedades.FieldDesc > '' then
    Result := Propiedades.FieldDesc
  else
    Result := FFieldDesc;
end;

function TfraCodDesc.GetFieldID: String;
begin
  if Propiedades.FieldID > '' then
    Result := Propiedades.FieldID
  else
    Result := FFieldID;
end;

function TfraCodDesc.GetIsEmpty: boolean;
begin
  if Propiedades.IdType = ctString then
    Result := GetAsString = ''
  else
    {$IFDEF ART2}
    Result := GetValue = 0;
    {$ELSE}
    Result := GetValue = '';
    {$ENDIF}
end;

function TfraCodDesc.GetOrderBy: String;
begin
  if Propiedades.OrderBy > '' then
    Result := Propiedades.OrderBy
  else
    Result := FOrderBy;
end;

function TfraCodDesc.GetShowBajas: Boolean;
begin
  Result := Propiedades.ShowBajas;
end;

function TfraCodDesc.GetSql: String;
begin
  if Propiedades.Sql > '' then
    Result := Propiedades.Sql
  else if Propiedades.TableName > '' then
  begin
    Result := 'SELECT ' + Propiedades.FieldId +     ' AS ' + CD_ALIAS_ID + ', ' +
                          Propiedades.FieldCodigo + ' AS ' + CD_ALIAS_CODIGO + ', ' + { Antes tenía un TO_CHAR }
                          Propiedades.FieldDesc +   ' AS ' + CD_ALIAS_DESC + ', ' +
                          Propiedades.FieldBaja +   ' AS ' + CD_ALIAS_BAJA + ' ' +
                          Propiedades.ExtraFields +
               ' FROM ' + Propiedades.TableName +
              ' WHERE 1 = 1 ' + Propiedades.ExtraCondition
  end else
    Result := inherited GetSql;
end;

function TfraCodDesc.GetTableName: String;
begin
  if Propiedades.TableName > '' then
    Result := Propiedades.TableName
  else
    Result := inherited GetTableName;
end;

procedure TfraCodDesc.SetShowBajas(const Value: Boolean);
begin
  inherited;
  Propiedades.ShowBajas := Value;
end;

procedure TfraCodDesc.SetSql(const Value: String);
begin
  if FSql <> Value then
  begin
    FSql := Value;
    Clear;
  end;
end;

constructor TfraCodDesc.Create(AOwner: TComponent);
begin
  inherited;
  AssignProperties;
  cmbDescripcion.Text := '';
end;

procedure TfraCodDesc.AddExtraCondition(ACondition: string);
var
  sCadena: string;
begin
  // A Revisar !!
  sCadena := Propiedades.ExtraCondition;
  AddCondition(sCadena, ACondition);
  Propiedades.ExtraCondition := sCadena;
end;

procedure TfraCodDesc.AfterConstruction;
begin
  inherited;
  DataSource := Propiedades.DataSource;
  if Assigned(Propiedades.DataField) then
    DataField := Propiedades.DataField.FieldName;
  AssignProperties;
  cmbDescripcion.Text := '';  
end;

end.
