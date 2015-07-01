unit unFraCCI_CIUO;

interface

uses
  {$IFDEF VER180}
  rxToolEdit,
  {$ELSE}
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, DB, SDEngine, PatternEdit,
  StdCtrls, Mask, ArtComboBox, unFraCodDesc, ComboEditor, ComboGrid;

type
  TfraCCI_CIUO = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraCCI_CIUO: TfraCCI_CIUO;

implementation

uses AnsiSql;

{$R *.dfm}

{ TfraCCI_CIUO }

constructor TfraCCI_CIUO.Create(AOwner: TComponent);
begin
  inherited;
  TableName := 'COMUNES.CCI_CIUO';
  FieldID := 'CI_ID';
  FieldCodigo := 'CI_CODIGO';
  FieldDesc := 'CI_DESCRIPCION';
  FieldBaja := SQL_NULL;
  ExtraCondition := ' AND LENGTH(CI_CODIGO) = 4 ';
end;

end.
