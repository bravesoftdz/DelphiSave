unit unfraEntidadAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unfraEntidadCUIT, DB, SDEngine, Mask, PatternEdit, StdCtrls,
  ToolEdit, ArtComboBox, unAgenda, RxToolEdit;

type
  TfraEntidadAGENDA = class(TfraEntidadCUIT, IModuloAgenda)
    lbEntidad: TLabel;
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
  fraEntidadAGENDA: TfraEntidadAGENDA;

implementation

uses unFraCodigoDescripcion, CustomDlgs;

{$R *.dfm}

function TfraEntidadAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired;
end;

function TfraEntidadAGENDA.GetParamName: String;
begin
  Result := 'IDENTIDAD';
end;

function TfraEntidadAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

procedure TfraEntidadAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbEntidad.Caption := 'Entidad (*)'
  else
    lbEntidad.Caption := 'Entidad';
end;

function TfraEntidadAGENDA.Validate: Boolean;
begin
  Verificar(IsEmpty, cmbDescripcion, 'Debe seleccionar una entidad.');
  Result := True;
end;

end.
