unit unfraAbogadosLegales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox, RxToolEdit;

type
  TParteActuante = (paPropia, paContraria, paMediacion, paSumariante);
  TfraAbogadosLegales = class(TfraCodigoDescripcion)
  private
    FParte : TParteActuante;
    {$HINTS OFF}
    property  TableName;
    property  FieldID;
    property  FieldCodigo;
    property  FieldDesc;
    property  FieldBaja;
    procedure SetParte(const Value: TParteActuante);

    {$HINTS ON}
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Parte : TParteActuante read FParte write SetParte default paPropia;
  end;


var
  fraAbogadosLegales: TfraAbogadosLegales;

procedure Register;

implementation

Uses AnsiSql;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraAbogadosLegales }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraAbogadosLegales.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  FieldCodigo := 'BO_ID';
  FieldID     := 'BO_ID';
  FieldBaja   := SQL_NULL;
  TableName   := 'LEGALES.LBO_ABOGADO';
  FieldDesc   := 'BO_NOMBRE';

  case FParte of
    paContraria : ExtraCondition := 'AND BO_PARTE=''O'' ';
  else
    ExtraCondition := 'AND BO_PARTE=''P'' ';
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraAbogadosLegales.SetParte(const Value: TParteActuante);
begin
  FParte := Value;

  case FParte of
    paContraria : ExtraCondition := 'AND BO_PARTE=''O'' ';
    paPropia : ExtraCondition := 'AND BO_PARTE=''P'' ';
    paMediacion : ExtraCondition := 'AND BO_PARTE=''M'' ';
    paSumariante : ExtraCondition := 'AND BO_PARTE=''S'' ';
  else

  end;

  Reload;

end;

procedure Register;
begin
    RegisterComponents('Frames', [TfraAbogadosLegales]);
end;

end.
