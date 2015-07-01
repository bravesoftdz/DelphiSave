unit unFraTipoAtencion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraStaticCodDesc, unPropiedadesFrame, ComboEditor, ComboGrid,
  StdCtrls, Mask, PatternEdit;

type
  TfraTipoAtencion = class(TfraStaticCodDesc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  AnsiSql;

{$R *.dfm}

constructor TfraTipoAtencion.Create(AOwner: TComponent);
begin
  inherited;
{
  TableName      := 'CTB_TABLAS';
  FieldID        := 'TB_CODIGO';
  FieldCodigo    := 'TB_CODIGO';
  FieldDesc      := 'TB_DESCRIPCION';
  FieldBaja      := 'TB_FECHABAJA';
  ExtraCondition := ' AND TB_CODIGO <> ''0'' AND TB_BAJA <> ''S'' AND TB_CLAVE = ''TRATA'' ';
  OrderBy        := 'TB_CODIGO';
}
  TableName      := 'SIN.STD_TIPODEATENCION';
  FieldID        := 'TD_ID';
  FieldCodigo    := 'TD_CODIGO';
  FieldDesc      := 'TD_DESCRIPCION';
  FieldBaja      := SQL_NULL;
  OrderBy        := 'TD_CODIGO';
end;

end.
