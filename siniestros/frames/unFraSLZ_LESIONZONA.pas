unit unFraSLZ_LESIONZONA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraSLZ_LESIONZONA = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraSLZ_LESIONZONA: TfraSLZ_LESIONZONA;

implementation

{$R *.dfm}

{ TfraSLZ_LESIONZONA }

constructor TfraSLZ_LESIONZONA.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'SIN.SLZ_LESIONZONA';
  FieldID     := 'LZ_ID';
  FieldCodigo := 'LZ_CODIGO';
  FieldDesc   := 'LZ_DESCRIPCION';
  FieldBaja   := 'LZ_FECHABAJA';
end;

end.
