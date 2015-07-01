unit unFraTipoTratamiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraTipoTratamiento = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  AnsiSql;

{$R *.dfm}

constructor TfraTipoTratamiento.Create(AOwner: TComponent);
begin
  inherited;
{
  TableName      := 'CTB_TABLAS';
  FieldID        := 'TB_CODIGO';
  FieldCodigo    := 'TB_CODIGO';
  FieldDesc      := 'TB_DESCRIPCION';
  FieldBaja      := 'TB_FECHABAJA';
  ExtraCondition := ' AND TB_CODIGO <> ''0'' AND TB_BAJA <> ''S'' AND TB_CLAVE = ''CTRAT'' ';
  OrderBy        := 'TB_CODIGO';
}
  TableName      := 'SIN.STT_TIPOTRATAMIENTO';
  FieldID        := 'TT_ID';
  FieldCodigo    := 'TT_CODIGO';
  FieldDesc      := 'TT_DESCRIPCION';
  FieldBaja      := SQL_NULL;
  OrderBy        := 'TT_CODIGO';
end;

end.
