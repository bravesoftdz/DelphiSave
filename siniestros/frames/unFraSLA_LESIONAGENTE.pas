unit unFraSLA_LESIONAGENTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraSLA_LESIONAGENTE = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraSLA_LESIONAGENTE: TfraSLA_LESIONAGENTE;

implementation

{$R *.dfm}

{ TfraSLA_LESIONAGENTE }

constructor TfraSLA_LESIONAGENTE.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'SIN.SLA_LESIONAGENTE';
  FieldID     := 'LA_ID';
  FieldCodigo := 'LA_CODIGO';
  FieldDesc   := 'LA_DESCRIPCION';
  FieldBaja   := 'LA_FECHABAJA';
end;

end.
