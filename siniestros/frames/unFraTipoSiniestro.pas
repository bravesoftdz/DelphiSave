unit unFraTipoSiniestro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraCodigoDescripcion, unFraStaticCodDesc, unPropiedadesFrame,
  ComboEditor, ComboGrid, StdCtrls, Mask, PatternEdit;

type
  TfraTipoSiniestro = class(TfraStaticCodDesc)
  private
    function GetEnfermedadProfesional: boolean;
  public
    constructor Create(AOwner: TComponent); override;
    property EsEnfermedadProfesional: boolean read GetEnfermedadProfesional;
  end;
{
var
  fraTipoSiniestro: TfraTipoSiniestro;
}
implementation

{$R *.dfm}

constructor TfraTipoSiniestro.Create(AOwner: TComponent);
begin
  inherited;
  IDType         := unFraCodigoDescripcion.TCodigoType(ctString);
  TableName      := 'SIN.STA_TIPOACCIDENTE';
  FieldID        := 'TA_ID';
  FieldCodigo    := 'TA_CODIGO';
  FieldDesc      := 'TA_DESCRIPCION';
  FieldBaja      := 'NULL';
  ExtraCondition := ' ';
  OrderBy        := 'TA_CODIGO';  

{
  TableName      := 'CTB_TABLAS';
  FieldID        := 'TB_CODIGO';
  FieldCodigo    := 'TB_CODIGO';
  FieldDesc      := 'TB_DESCRIPCION';
  FieldBaja      := 'TB_FECHABAJA';
  ExtraCondition := ' AND TB_CODIGO <> ''0'' AND TB_BAJA <> ''S'' AND TB_CLAVE = ''STIPO'' ';
  OrderBy        := 'TB_CODIGO';
}    
end;

function TfraTipoSiniestro.GetEnfermedadProfesional: boolean;
begin
  Result := IsSelected and (Codigo = '3'); 
end;

end.
