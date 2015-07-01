unit unFraCPA_PAISES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit, unFraCodigoDescripcion;

type
  TfraCPA_PAISES = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraCPA_PAISES: TfraCPA_PAISES;

implementation

{$R *.dfm}

{ TfraCPA_PAISES }

constructor TfraCPA_PAISES.Create(AOwner: TComponent);
begin
  inherited;
  IDType         := unFraCodigoDescripcion.TCodigoType(ctString);
  TableName      := 'CPA_PAISES';
  FieldID        := 'PA_CODIGO';
  FieldCodigo    := 'PA_CODIGO';
  FieldDesc      := 'PA_DESCRIPCION';
  FieldBaja      := 'NULL';
end;

end.
