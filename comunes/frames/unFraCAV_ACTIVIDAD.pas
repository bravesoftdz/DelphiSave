unit unFraCAV_ACTIVIDAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraStaticCodigoDescripcion, ComboEditor, ComboGrid, StdCtrls, Mask,
  PatternEdit;

type
  TfraCAV_ACTIVIDAD = class(TfraStaticCodigoDescripcion)
  private
  protected
    function GetSqlWhere: string; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  AnsiSql;

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
{ TfraCAV_ACTIVIDAD }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraCAV_ACTIVIDAD.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'CAV_ACTIVIDAD';
  FieldID     := 'AV_CODIGO';
  FieldCodigo := 'AV_CODIGO';
  FieldDesc   := 'AV_DESCRIPCION';
  FieldBaja   := SQL_NULL;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCAV_ACTIVIDAD.GetSqlWhere: string;
begin
  Result := inherited GetSqlWhere +
            ' AND LENGTH(AV_CODIGO) = 6 ';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
