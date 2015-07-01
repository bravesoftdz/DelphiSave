unit unFraGrupoTrabajo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraCodigoDescripcion, DB, SDEngine, PatternEdit, StdCtrls,
  Mask, ToolEdit, ArtComboBox, RxToolEdit;

type
  TfraGrupoTrabajo = class(TfraCodigoDescripcion)
    cmbGestor: TArtComboBox;
    lblGestor: TLabel;
    sdqGestor: TSDQuery;
    dsGestor: TDataSource;
  private
    FVerGestor: Boolean;
    procedure SetVerGestor(const Value: Boolean);
  protected
    property  FieldID;
    property  FieldCodigo;
    property  FieldDesc;
    property  FieldBaja;
    function GetSqlWhere : String; override;
    procedure LoadValues( DoChanges : boolean = False); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure AfterConstruction; override;
  published
    property VerGestor :Boolean       read FVerGestor         write SetVerGestor default True;
    property ExtraFields;
  end;

var
  fraGrupoTrabajo: TfraGrupoTrabajo;

implementation

uses
  AnsiSql;

{$R *.dfm}

{-------------------------------------------------------------------------------}
{ TfraGrupoTrabajo }
{-------------------------------------------------------------------------------}
constructor TfraGrupoTrabajo.Create(AOwner: TComponent);
begin
  inherited;
  FVerGestor    := True;
  CaseSensitive := False;
  FTableName    := 'MGP_GTRABAJO';
  FFieldID      := 'GP_CODIGO';
  FFieldCodigo  := 'GP_CODIGO';
  FFieldDesc    := 'GP_NOMBRE';
  FFieldBaja    := 'GP_FBAJA';
  FExtraFields  := ', GP_DESCRIPCION, GP_GESTIONADO ';
end;
{-------------------------------------------------------------------------------}
function TfraGrupoTrabajo.GetSqlWhere: String;
begin
  Result := inherited GetSqlWhere;
end;
{-------------------------------------------------------------------------------}
procedure TfraGrupoTrabajo.SetVerGestor(const Value: Boolean);
begin
  if FVerGestor <> Value then
  begin
     FVerGestor         := Value;
     lblGestor.Visible  := Value;
     cmbGestor.Visible  := Value;
     if not FVerGestor then
      cmbDescripcion.Width := cmbDescripcion.Width + lblGestor.Width + cmbGestor.Width + 5;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfraGrupoTrabajo.Clear;
begin
  inherited;
  cmbGestor.Clear;
  sdqGestor.Close;
end;
{-------------------------------------------------------------------------------}
procedure TfraGrupoTrabajo.LoadValues(DoChanges: boolean);
begin
  inherited;
  cmbGestor.Clear;
  sdqGestor.Close;
  if sdqDatos.Active and not(sdqDatos.IsEmpty) and VerGestor and
     (sdqDatos.FieldByName('GP_GESTIONADO').AsString = 'S') then
  begin
    sdqGestor.ParamByName('GRUPO').AsString := ID;
    sdqGestor.Open;
    cmbGestor.SetFocus;
  end;
end;
{-------------------------------------------------------------------------------}
procedure TfraGrupoTrabajo.AfterConstruction;
begin
  inherited;
  cmbGestor.DataSource := dsGestor;
end;
{-------------------------------------------------------------------------------}
end.
