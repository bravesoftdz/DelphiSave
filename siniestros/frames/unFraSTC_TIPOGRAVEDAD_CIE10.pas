unit unFraSTC_TIPOGRAVEDAD_CIE10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodigoDescripcion, ComboEditor, ComboGrid, StdCtrls,
  Mask, PatternEdit, unFraStaticCodDesc, unPropiedadesFrame;

type
  TfraSTC_TIPOGRAVEDAD_CIE10 = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraSTC_TIPOGRAVEDAD_CIE10: TfraSTC_TIPOGRAVEDAD_CIE10;

implementation

uses
  AnsiSql;

{$R *.dfm}

constructor TfraSTC_TIPOGRAVEDAD_CIE10.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'SIN.STC_TIPOGRAVEDAD_CIE10';
  FieldID     := 'TC_CODIGO';
  FieldCodigo := 'TC_CODIGO';
  FieldDesc   := 'TC_DESCRIPCION';
  FieldBaja   := SQL_NULL;
  OrderBy     := 'TC_CODIGO';  
end;

end.
