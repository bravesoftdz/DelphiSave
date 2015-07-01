unit unfraDatoFechaAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtDbFrame, StdCtrls, Mask, ToolEdit, DateComboBox, DB,
  SDEngine, unAgenda;

type
  TfraDatoFecha = class(TArtDbFrame, IModuloAgenda)
    lbFecha: TLabel;
    edDatoFecha: TDateComboBox;
  private
    FIsRequired: Boolean;
    
    function GetIsRequired: Boolean;
    function GetParamName: String;
    function GetVisible: Boolean;
    procedure SetIsRequired(const Value: Boolean);
    function GetDate: TDateTime;
    procedure SetDate(const Value: TDateTime);
  protected
    function GetIsSelected: Boolean; override;
  public
    procedure Clear; override;
    function  Validate: Boolean;

    property ParamName: String read GetParamName;
    property Date: TDateTime read GetDate write SetDate;
  end;

var
  fraDatoFecha: TfraDatoFecha;

implementation

uses CustomDlgs;

{$R *.dfm}

{ TfraDatoFecha }

procedure TfraDatoFecha.Clear;
begin
  edDatoFecha.Clear;
end;

function TfraDatoFecha.GetDate: TDateTime;
begin
  Result := edDatoFecha.Date;
end;

function TfraDatoFecha.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraDatoFecha.GetIsSelected: Boolean;
begin
  Result := not edDatoFecha.IsEmpty;
end;

function TfraDatoFecha.GetParamName: String;
begin
  Result := 'FECHA';
end;

function TfraDatoFecha.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraDatoFecha.SetDate(const Value: TDateTime);
begin
  edDatoFecha.Date := Value;
end;

procedure TfraDatoFecha.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbFecha.Caption := 'Fecha (*)'
  else
    lbFecha.Caption := 'Fecha';
end;

function TfraDatoFecha.Validate: Boolean;
begin
  Verificar(edDatoFecha.IsEmpty, edDatoFecha, 'Debe seleccionar una fecha.');
  Result := True;
end;

end.
