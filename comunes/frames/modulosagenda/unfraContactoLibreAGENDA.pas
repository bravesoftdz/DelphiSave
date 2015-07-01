unit unfraContactoLibreAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtDbFrame, StdCtrls, DB, SDEngine, unAgenda, Mask,
  PatternEdit, ComCtrls, ToolWin;

type
  TfraContactoLibreAGENDA = class(TArtDbFrame, IModuloAgenda)
    edTelefonoContacto: TPatternEdit;
    lbContacto: TLabel;
    lbCorreoElectronico: TLabel;
    lbDescripcion: TLabel;
    lbTelefono: TLabel;
    tbContacto: TToolButton;
    ToolBarContacto: TToolBar;
    procedure edCorreoElectronicoChange(Sender: TObject);
    procedure edCorreoElectronicoExit(Sender: TObject);
    procedure tbContactoClick(Sender: TObject);
 private
    edCorreoElectronico: TEdit;
    edNombreContacto: TEdit;
    FContrato: Integer;
    FIsRequired: Boolean;
    function GetCorreoElectronico: String;
    function GetIsRequired: Boolean;
    function GetNombre: String;
    function GetParamName: String;
    function GetTelefono: String;
    function GetVisible: Boolean;
    procedure SetContrato(const Value: Integer);
    procedure SetIsRequired(const Value: Boolean);
 public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure LoadData(AContacto, ATelefono, ACorreoElectronico: String);
    function Validate: Boolean;
    property Contrato: Integer read FContrato write SetContrato;
    property CorreoElectronico: String read GetCorreoElectronico;
    property Nombre: String read GetNombre;
    property ParamName: String read GetParamName;
    property Telefono: String read GetTelefono;
  end;

var
  fraContactoLibreAGENDA: TfraContactoLibreAGENDA;

implementation

uses CustomDlgs, Internet, unContratoContacto, unfraContacto;

{$R *.dfm}

procedure TfraContactoLibreAGENDA.edCorreoElectronicoChange(Sender: TObject);
begin
  inherited;
  if not IsEMail(edCorreoElectronico.Text) then
    edCorreoElectronico.Font.Color := clMaroon
  else
    edCorreoElectronico.Font.Color := clTeal;
end;

procedure TfraContactoLibreAGENDA.edCorreoElectronicoExit(Sender: TObject);
begin
  inherited;
//  Verificar(not IsEMail(edCorreoElectronico.Text), edCorreoElectronico, 'La dirección de correo electrónico ingresada no es válida.'); 
end;

procedure TfraContactoLibreAGENDA.tbContactoClick(Sender: TObject);
var
  nContrato: Integer;
begin
  nContrato := Contrato;

  Verificar(nContrato <= 0, Self, 'Debe seleccionar una empresa.');
  with TfrmContratoContacto.Create(Self) do
  try
    {$IFNDEF MSACCESS}
    AutoCommit := False;
    {$ENDIF}
    DoCargar(nContrato, Self.Nombre, Self.Telefono, Self.CorreoElectronico);
    VerSeleccion;
    if ShowModal = mrOk then
    begin
      edNombreContacto.Text := fraContacto.Contacto;
      edCorreoElectronico.Text := fraContacto.Email;
    end;
  finally
    Free;
  end;
end;

function TfraContactoLibreAGENDA.GetCorreoElectronico: String;
begin
  Result := Trim(edCorreoElectronico.Text);
end;

function TfraContactoLibreAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraContactoLibreAGENDA.GetNombre: String;
begin
  Result := Trim(edNombreContacto.Text);
end;

function TfraContactoLibreAGENDA.GetParamName: String;
begin
  Result := 'IDCONTACTO'; 
end;

function TfraContactoLibreAGENDA.GetTelefono: String;
begin
  Result := Trim(edTelefonoContacto.Text);
end;

function TfraContactoLibreAGENDA.GetVisible: Boolean;
begin
  Result := Self.Visible; 
end;

procedure TfraContactoLibreAGENDA.SetContrato(const Value: Integer);
begin
  FContrato := Value;
  tbContacto.Visible := Value > 0;    
end;

procedure TfraContactoLibreAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbContacto.Caption := 'Contacto (*)'
  else
    lbContacto.Caption := 'Contacto';
end;

constructor TfraContactoLibreAGENDA.Create(AOwner: TComponent);
begin
  inherited;
  edNombreContacto := TEdit(Self.FindComponent('edNombreContacto'));
  edTelefonoContacto := TPatternEdit(Self.FindComponent('edTelefonoContacto'));
  edCorreoElectronico := TEdit(Self.FindComponent('edCorreoElectronico'));
  sdqDatos := TSDQuery(Self.FindComponent('sdqDatos'));
end;

procedure TfraContactoLibreAGENDA.Clear;
begin
  edNombreContacto.Clear;
  edTelefonoContacto.Clear;
  edCorreoElectronico.Clear;
  edCorreoElectronico.Font.Color := clBlack;  
end;

procedure TfraContactoLibreAGENDA.LoadData(AContacto, ATelefono, ACorreoElectronico: String);
begin
  edNombreContacto.Text := AContacto;
  edTelefonoContacto.Text := ATelefono;
  edCorreoElectronico.Text := ACorreoElectronico;
end;

function TfraContactoLibreAGENDA.Validate: Boolean;
begin
  Verificar(Nombre = '', edNombreContacto, 'Debe indicar el nombre del contacto.');
  Verificar((Telefono = '') and (CorreoElectronico = ''), edTelefonoContacto, 'Debe indicar al menos un dato de contacto.');
  Verificar((Trim(edCorreoElectronico.Text) > '') and not IsEMail(edCorreoElectronico.Text), edCorreoElectronico, 'La dirección de correo electrónico ingresada no es válida.'); 
  Result := True;
end;

initialization
  RegisterClasses([TEdit, TPatternEdit, TSDQuery]);
end.
