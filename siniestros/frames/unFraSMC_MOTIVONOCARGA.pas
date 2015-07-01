unit unFraSMC_MOTIVONOCARGA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodigoDescripcion, ComboEditor, ComboGrid, StdCtrls,
  Mask, unFraStaticCodDesc, PatternEdit, unPropiedadesFrame;

type
  TfraSMC_MOTIVONOCARGA = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraSMC_MOTIVONOCARGA: TfraSMC_MOTIVONOCARGA;

implementation

{$R *.dfm}

constructor TfraSMC_MOTIVONOCARGA.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'SIN.SMC_MOTIVONOCARGA';
  FieldID     := 'MC_ID';
  FieldCodigo := 'MC_CODIGO';
  FieldDesc   := 'MC_DESCRIPCION';
  FieldBaja   := 'MC_FECHABAJA';
  OrderBy     := 'MC_CODIGO';  
end;

end.
