{
  NUNCA modificar este fuente desde RedPres!!!

  El tema de la herencia, al ser de otro frame con mas campos,
  haría que falle en cualquier otra aplicación "moderna"... 
}

unit unfraEstablecimientoAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraEstablecimiento, DB, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox, unAgenda, unART, IntEdit;

type
  TfraEstablecimientoAGENDA = class(TfraEstablecimiento, IModuloAgenda)
  private
    lbEstablecimiento: TLabel;
    FfraDomicilioEstablecimiento: TfraDomicilioEstablecimiento;
    FIsRequired: Boolean;
    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;
    procedure OnEstablecimientoChange(Sender: TObject);
    procedure SetIsRequired(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    function Validate: Boolean;
    {Vínculos con otros frames}
    property FrameDomicilioEstablecimiento: TfraDomicilioEstablecimiento read FfraDomicilioEstablecimiento write FfraDomicilioEstablecimiento;
    property ParamName: String read GetParamName;
  published
    property IdEstablecimiento: TTableID read GetValue;
  end;

var
  fraEstablecimientoAGENDA: TfraEstablecimientoAGENDA;

implementation

uses unFraCodigoDescripcion, CustomDlgs;

{$R *.dfm}

function TfraEstablecimientoAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraEstablecimientoAGENDA.GetParamName: String;
begin
  Result := 'IDESTABLECIMIENTO';
end;

function TfraEstablecimientoAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraEstablecimientoAGENDA.OnEstablecimientoChange(Sender: TObject);
begin
  if Assigned(FfraDomicilioEstablecimiento) then
    FfraDomicilioEstablecimiento.Clear;
end;

procedure TfraEstablecimientoAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbEstablecimiento.Caption := 'Establecimiento (*)'
  else
    lbEstablecimiento.Caption := 'Establecimiento';
end;

constructor TfraEstablecimientoAGENDA.Create(AOwner: TComponent);
begin
  inherited;
  lbEstablecimiento := TLabel.Create(Self);
  with lbEstablecimiento do
  begin
    Parent := Self;
    Caption := 'Establecimiento';
    Font.Style := [fsBold];
    Font.Name := 'Tahoma';
    Left := 8;
    Top := 8;
  end;

  AutoScroll := False;
  edCodigo.Left := 80;
  edCodigo.Top  := 28;
  cmbDescripcion.Left := edCodigo.Left + edCodigo.Width + 4;
  cmbDescripcion.Top  := 28;
  cmbDescripcion.Width := Self.Width - cmbDescripcion.Left - 8;
  Anchors := [akLeft, akTop, akRight];
  {$IFNDEF ART2}
  edCPostal.Visible := False;
  edDomicilio.Visible := False;
  edLocalidad.Visible := False;
  edProvincia.Visible := False;
  lbLocalidad.Visible := False;
  lbCPostal.Visible   := False;
  lbEstableci.Visible := False;
  lbDomicilio.Visible := False;
  lbCPostal.Visible   := False;
  lbProvincia.Visible := False;
  {$ENDIF}
  OnChange := OnEstablecimientoChange;
end;

procedure TfraEstablecimientoAGENDA.Clear;
begin
  inherited;
  if Assigned(FfraDomicilioEstablecimiento) then
    FfraDomicilioEstablecimiento.Clear;
end;

function TfraEstablecimientoAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, edCodigo, 'Debe seleccionar un establecimiento.');
  Result := True;
end;

end.
