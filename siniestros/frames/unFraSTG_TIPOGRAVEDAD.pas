unit unFraSTG_TIPOGRAVEDAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraSTG_TIPOGRAVEDAD = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fraSTG_TIPOGRAVEDAD: TfraSTG_TIPOGRAVEDAD;

implementation

uses
  AnsiSql;

{$R *.dfm}

constructor TfraSTG_TIPOGRAVEDAD.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'SIN.STG_TIPOGRAVEDAD';
  FieldID     := 'TG_CODIGO';
  FieldCodigo := 'TG_CODIGO';
  FieldDesc   := 'TG_DESCRIPCION';
  FieldBaja   := SQL_NULL;
  OrderBy     := 'TG_CODIGO';  
end;

end.
