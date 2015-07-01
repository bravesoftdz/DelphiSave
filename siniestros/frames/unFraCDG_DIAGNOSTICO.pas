unit unFraCDG_DIAGNOSTICO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraCDG_DIAGNOSTICO = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraCDG_DIAGNOSTICO: TfraCDG_DIAGNOSTICO;

implementation

{$R *.dfm}

constructor TfraCDG_DIAGNOSTICO.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'CDG_DIAGNOSTICO';
  FieldID     := 'DG_ID';
  FieldCodigo := 'DG_CODIGO';
  FieldDesc   := 'DG_DESCRIPCION';
  FieldBaja   := 'DG_FECHABAJA';
  OrderBy     := 'DG_CODIGO';
  ShowBajas   := True;
end;

end.
