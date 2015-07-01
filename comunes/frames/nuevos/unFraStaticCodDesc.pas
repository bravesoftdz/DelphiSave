unit unFraStaticCodDesc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodigoDescripcion, ComboEditor, ComboGrid, StdCtrls,
  Mask, PatternEdit, unPropiedadesFrame, unFraCodigoDescripcion;

type
  TfraStaticCodDesc = class(TfraStaticCodigoDescripcion)
    Propiedades: TPropiedadesFrame;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure PropiedadesDBAwareChange(Sender: TObject);
  private
    procedure AssignProperties;
  protected
    property DataField;
    property DataSource;
    procedure Change; override;    
  public
    constructor Create(AOwner: TComponent); override;
    procedure   AfterConstruction; override;
  end;

var
  fraStaticCodDesc: TfraStaticCodDesc;

implementation

uses
  General, unArtDBAwareFrame, DB;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfraStaticCodDesc.AfterConstruction;
begin
  inherited;
  DataSource := Propiedades.DataSource;
  if Assigned(Propiedades.DataField) then
    DataField := Propiedades.DataField.FieldName;
  AssignProperties;
end;
{------------------------------------------------------------------------------}
procedure TfraStaticCodDesc.cmbDescripcionDropDown(Sender: TObject);
begin
  {Modificación para que busque y ordene por código}
  
  if Trim(edCodigo.Text) > EmptyStr then
    Propiedades.OrderBy := Propiedades.FieldCodigo
  else
    Propiedades.OrderBy := Propiedades.FieldDesc;

  AssignProperties;
  inherited;
end;
{------------------------------------------------------------------------------}
constructor TfraStaticCodDesc.Create(AOwner: TComponent);
begin
  inherited;
  AssignProperties;
  cmbDescripcion.Text := '';  
end;
{------------------------------------------------------------------------------}
procedure TfraStaticCodDesc.PropiedadesDBAwareChange(Sender: TObject);
begin
  inherited;
  DataSource := Propiedades.DataSource;
  if Assigned(Propiedades.DataField) then
    DataField := Propiedades.DataField.FieldName;
end;
{------------------------------------------------------------------------------}
procedure TfraStaticCodDesc.AssignProperties;
var
  sTexto1, sTexto2: string;
begin
  sTexto1 := edCodigo.Text;
  sTexto2 := cmbDescripcion.Text;

  FCaseSensitive := Propiedades.CaseSensitive;
  FShowBajas     := Propiedades.ShowBajas;
  FDataValue[1]  := Propiedades.TableName;
  FDataValue[2]  := Propiedades.FieldID;
  FDataValue[3]  := Propiedades.FieldCodigo;
  FDataValue[4]  := Propiedades.FieldDesc;
  FDataValue[5]  := iif(Propiedades.FieldBaja > '', Propiedades.FieldBaja, FDataValue[5]);
  FDataValue[6]  := Propiedades.ExtraCondition;
  FDataValue[7]  := Propiedades.ExtraFields;
  OrderBy        := Propiedades.OrderBy;

  edCodigo.Text := sTexto1;
  cmbDescripcion.Text := sTexto2;
end;
{------------------------------------------------------------------------------}
procedure TfraStaticCodDesc.Change;
begin
  if Assigned(Propiedades.OnChange) then
    Propiedades.OnChange(Self);

  inherited;
end;
{------------------------------------------------------------------------------}
end.
