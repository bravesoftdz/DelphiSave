unit unfraEntidadVendedorAGENDA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtDbFrame, DB, SDEngine, unfraVendedores, unAgenda,
  unfraVendedoresCUIT, unfraVendedorAGENDA, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraEntidadCUIT, unfraEntidadAGENDA, ExtCtrls,
  StdCtrls, unART;

type
  TfraEntidadVendedorAGENDA = class(TArtDbFrame, IModuloAgenda)
    fraEntidadAGENDA: TfraEntidadAGENDA;
    fraVendedorAGENDA: TfraVendedorAGENDA;
    pnlTop: TPanel;
    lbBancosInstitoriosProductoresBrokers: TLabel;
  private
    FIsRequired: Boolean;
    function GetIdEntidad: Integer;
    function GetIdVendedor: Integer;
    function  GetIsRequired: Boolean;
    function GetParamName: String;
    function  GetVisible: Boolean;
    procedure OnEntidadChange(Sender: TObject);
    procedure OnVendedorChange(Sender: TObject);
    procedure SetIdEntidad(const Value: Integer);
    procedure SetIdVendedor(const Value: Integer);
    procedure SetIsRequired(const Value: Boolean);
    function GetIdEntidadVendedor: TTableID;
  protected
    function GetValue: TTableID; override;
    function GetSqlOrderBy: string; override;
    function GetSqlWhere: string; override;
    function IsBaja: Boolean; override;
    procedure LoadValues(DoChanges: Boolean = False); override;
    procedure SetValue(const Value: TTableId); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    function  Validate: Boolean;
    property  IdEntidad         : Integer read GetIdEntidad  write SetIdEntidad;
    property  IdVendedor        : Integer read GetIdVendedor write SetIdVendedor;
    property  IsRequired        : Boolean  read GetIsRequired write SetIsRequired;
    property  ParamName         : String   read GetParamName;
  published
    property  IdEntidadVendedor : TTableID read GetIdEntidadVendedor;
  end;
{
var
  fraEntidadVendedorAGENDA: TfraEntidadVendedorAGENDA;
}
implementation

{$R *.dfm}

function TfraEntidadVendedorAGENDA.GetIdEntidad: Integer;
begin
  Result := StrToIntDef(fraEntidadAGENDA.Id, 0);
end;

function TfraEntidadVendedorAGENDA.GetIdVendedor: Integer;
begin
  Result := StrToIntDef(fraVendedorAGENDA.Id, 0);
end;

function TfraEntidadVendedorAGENDA.GetIsRequired: Boolean;
begin
  Result := Visible and FIsRequired and (fraEntidadAGENDA as IModuloAgenda).IsRequired or (fraVendedorAGENDA as IModuloAgenda).IsRequired;
end;

function TfraEntidadVendedorAGENDA.GetParamName: String;
begin
  Result := 'IDENTIDADVENDEDOR';
end;

function TfraEntidadVendedorAGENDA.GetSqlOrderBy: string;
begin
  Result := '';
end;

function TfraEntidadVendedorAGENDA.GetSqlWhere: string;
begin
  Result := '';
end;

function TfraEntidadVendedorAGENDA.GetVisible: Boolean;
begin
  Result := Visible;
end;

function TfraEntidadVendedorAGENDA.IsBaja: Boolean;
begin
  Result := fraEntidadAGENDA.IsBaja or fraVendedorAGENDA.IsBaja;
end;

procedure TfraEntidadVendedorAGENDA.LoadValues(DoChanges: Boolean);
begin
  inherited;
end;

procedure TfraEntidadVendedorAGENDA.OnEntidadChange(Sender: TObject);
begin
  if fraEntidadAGENDA.IsSelected and (StrToIntDef(fraEntidadAGENDA.Id, 0) <> fraVendedorAGENDA.Entidad) then
    fraVendedorAGENDA.Entidad := {$IFDEF ART2}fraEntidadAGENDA.Value{$ELSE}StrToIntDef(fraEntidadAGENDA.Id, 0){$ENDIF};
end;

procedure TfraEntidadVendedorAGENDA.OnVendedorChange(Sender: TObject);
begin
  if fraVendedorAGENDA.IsSelected and (fraVendedorAGENDA.Entidad <> StrToIntDef(fraEntidadAGENDA.ID, 0)) then
    fraEntidadAGENDA.Value := {$IFDEF ART2}fraVendedorAGENDA.Entidad{$ELSE}IntToStr(fraVendedorAGENDA.Entidad){$ENDIF};
end;

procedure TfraEntidadVendedorAGENDA.SetIdEntidad(const Value: Integer);
begin
  fraEntidadAGENDA.Value := {$IFDEF ART2}Value{$ELSE}IntToStr(Value){$ENDIF};
  OnEntidadChange(nil);
end;

procedure TfraEntidadVendedorAGENDA.SetIdVendedor(const Value: Integer);
begin
  fraVendedorAGENDA.Value := Value;
end;

procedure TfraEntidadVendedorAGENDA.SetIsRequired(const Value: Boolean);
begin
  FIsRequired := Value;
  if Value then
    lbBancosInstitoriosProductoresBrokers.Caption := 'Banco, Institorio, Productor o Broker (*)'
  else
    lbBancosInstitoriosProductoresBrokers.Caption := 'Banco, Institorio, Productor o Broker';
end;

procedure TfraEntidadVendedorAGENDA.SetValue(const Value: TTableId);
begin
  inherited SetValue(Value);
end;

{ TfraEntidadVendedorAGENDA }

constructor TfraEntidadVendedorAGENDA.Create(AOwner: TComponent);
begin
  inherited;
  fraEntidadAGENDA.OnChange := OnEntidadChange;
  fraVendedorAGENDA.OnChange := OnVendedorChange;
end;

procedure TfraEntidadVendedorAGENDA.Clear;
begin
  inherited;
  fraEntidadAGENDA.Clear;
  fraVendedorAGENDA.Clear;
end;

function TfraEntidadVendedorAGENDA.Validate: Boolean;
begin
  fraEntidadAGENDA.Validate;
  fraVendedorAGENDA.Validate;
  Result := True;
end;

function TfraEntidadVendedorAGENDA.GetIdEntidadVendedor: TTableID;
begin
  Result := Value;
end;

function TfraEntidadVendedorAGENDA.GetValue: TTableID;
begin
  if fraVendedorAGENDA.sdqDatos.Active and not fraVendedorAGENDA.sdqDatos.IsEmpty then
    Result := fraVendedorAGENDA.sdqDatos.FieldByName('EV_ID').AsInteger
  else
    Result := ART_EMPTY_ID;
end;

end.
