unit unfraDomicilioAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraDomicilioGIS, ExtCtrls, DB, SDEngine, unArtFrame, FormPanel,
  AdvGlowButton, StdCtrls, PatternEdit, IntEdit, Mask, ToolEdit, ArtComboBox, unAgenda;

type
  TfraDomicilioGISAGENDA = class(TfraDomicilioGIS, IModuloAgenda)
    lbUbicacion: TLabel;
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
  fraDomicilioGISAGENDA: TfraDomicilioGISAGENDA;

implementation

uses CustomDlgs;

{$R *.dfm}

{ TfraDomicilioGISAGENDA }

function TfraDomicilioGISAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraDomicilioGISAGENDA.GetParamName: String;
begin
  Result := 'VALUE';
end;

function TfraDomicilioGISAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraDomicilioGISAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbUbicacion.Caption := 'Ubicación (*)'
  else
    lbUbicacion.Caption := 'Ubicación';
end;

function TfraDomicilioGISAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, cmbCalle, 'Debe seleccionar un domicilio.');
  Result := True;
end;

end.
