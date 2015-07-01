unit unFraSTA_TIPOACCIDENTE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComboEditor, ComboGrid, StdCtrls,
  Mask, PatternEdit, unFraStaticCodDesc, unPropiedadesFrame;

type
  TfraSTA_TIPOACCIDENTE = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraSTA_TIPOACCIDENTE: TfraSTA_TIPOACCIDENTE;

implementation

uses
  AnsiSql;
  
{$R *.dfm}

constructor TfraSTA_TIPOACCIDENTE.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'SIN.STA_TIPOACCIDENTE';
  FieldID     := 'TA_CODIGO';
  FieldCodigo := 'TA_DESCRIPCIONABREV';
  FieldDesc   := 'TA_DESCRIPCION';
  FieldBaja   := SQL_NULL;
  OrderBy     := 'TA_CODIGO';  
end;

end.
