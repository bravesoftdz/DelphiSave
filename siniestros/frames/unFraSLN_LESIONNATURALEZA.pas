unit unFraSLN_LESIONNATURALEZA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraSLN_LESIONNATURALEZA = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraSLN_LESIONNATURALEZA: TfraSLN_LESIONNATURALEZA;

implementation

{$R *.dfm}

{ TfraSLN_LESIONNATURALEZA }

constructor TfraSLN_LESIONNATURALEZA.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'SIN.SLN_LESIONNATURALEZA';
  FieldID     := 'LN_ID';
  FieldCodigo := 'LN_CODIGO';
  FieldDesc   := 'LN_DESCRIPCION';
  FieldBaja   := 'LN_FECHABAJA';
end;

end.
