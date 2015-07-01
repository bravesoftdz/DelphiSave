unit unFraCentroRegional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unFraStaticCodigoDescripcion, ComboEditor,
  ComboGrid, StdCtrls, Mask, PatternEdit, db, unArt;

type
  TfraCentroRegional = class(TfraStaticCodigoDescripcion)
  private
  protected
    {Oculta las Propiedades}
    property ExtraFields;
    property FieldBaja;    
    property FieldCodigo;
    property FieldDesc;
    property FieldID;
    property TableName;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

{ TfraCentroRegional }

constructor TfraCentroRegional.Create(AOwner: TComponent);
begin
  inherited;
  TableName       := 'ACR_CENTROREGIONAL';
  FieldID         := 'CR_ID';
  FieldCodigo     := 'CR_CODIGO';
  FieldDesc       := 'CR_DESCRIPCION';
  FieldBaja       := 'CR_FECHABAJA';
end;

end.
