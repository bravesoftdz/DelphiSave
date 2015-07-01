unit unFraSMD_MODODETECCION;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraSMD_MODODETECCION = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraSMD_MODODETECCION: TfraSMD_MODODETECCION;

implementation

{$R *.dfm}

constructor TfraSMD_MODODETECCION.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'SIN.SMD_MODODETECCION';
  FieldID     := 'MD_ID';
  FieldCodigo := 'MD_CODIGO';
  FieldDesc   := 'MD_DESCRIPCION';
  FieldBaja   := 'NULL';
end;

end.
