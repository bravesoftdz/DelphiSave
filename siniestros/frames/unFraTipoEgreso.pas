unit unFraTipoEgreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraTipoEgreso = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  AnsiSql;

{$R *.dfm}

constructor TfraTipoEgreso.Create(AOwner: TComponent);
begin
  inherited;
{
  TableName      := 'CTB_TABLAS';
  FieldID        := 'TB_CODIGO';
  FieldCodigo    := 'TB_CODIGO';
  FieldDesc      := 'TB_DESCRIPCION';
  FieldBaja      := 'TB_FECHABAJA';
  ExtraCondition := ' AND TB_CODIGO <> ''0'' AND TB_BAJA <> ''S'' AND TB_CLAVE = ''TEGRE'' ';
  OrderBy        := 'TB_CODIGO';
}
  TableName      := 'SIN.STE_TIPOEGRESO';
  FieldID        := 'TE_ID';
  FieldCodigo    := 'TE_CODIGO';
  FieldDesc      := 'TE_DESCRIPCION';
  FieldBaja      := 'TE_FECHABAJA';
  OrderBy        := 'TE_CODIGO';
end;

end.
