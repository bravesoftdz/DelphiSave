unit unfraVendedorAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unfraVendedoresCUIT, DB, SDEngine, Mask, PatternEdit, StdCtrls,
  ToolEdit, ArtComboBox, unAgenda, RxToolEdit;

type
  TfraVendedorAGENDA = class(TfraVendedoresCUIT, IModuloAgenda)
    lbVendedor: TLabel;
  private
    FIsRequired: Boolean;
    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;
    procedure SetIsRequired(const Value: Boolean);
  public
    function Validate: Boolean;
    property ParamName: String read GetParamName;    
  end;

var
  fraVendedorAGENDA: TfraVendedorAGENDA;

implementation

uses CustomDlgs;

{$R *.dfm}

function TfraVendedorAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraVendedorAGENDA.GetParamName: String;
begin
  Result := 'IDVENDEDOR';
end;

function TfraVendedorAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraVendedorAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbVendedor.Caption := 'Vendedor (*)'
  else
    lbVendedor.Caption := 'Vendedor';
end;

function TfraVendedorAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, cmbDescripcion, 'Debe seleccionar un vendedor.');
  Result := True;
end;

end.
