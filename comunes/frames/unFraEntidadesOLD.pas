unit unFraEntidadesOLD;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   12-12-2003
 ULTIMA MODIFICACION: 12-12-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox, unArt;

type
  TfraEntidades = class(TfraCodigoDescripcion)
  private
    FVendedor: TTableId;
    procedure SetVendedor(const AValue: TTableId);
  protected
    function GetSql: String; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Vendedor : TTableId  read FVendedor write SetVendedor;
  end;

var
  fraEntidades: TfraEntidades;

implementation

uses unDmPrincipal, AnsiSql;

{$R *.DFM}

{-----------------------------------------------------------------------------}
{ TfraEntidades }
{-----------------------------------------------------------------------------}
constructor TfraEntidades.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'CET_ENTIDADES';
  FieldID     := 'ET_CANAL2';
  FieldCodigo := 'ET_CANAL2';
  FieldDesc   := 'ET_NOMBRE';
  FieldBaja   := 'ET_FBAJA';
end;
{-----------------------------------------------------------------------------}
function TfraEntidades.GetSql: String;
begin
  if FSql = '' Then begin
    if FVendedor <> ART_EMPTY_ID Then
      Result := 'SELECT ET_CANAL2 AS ' + CD_ALIAS_ID + ', ' +
                       'ET_CANAL2 AS ' + CD_ALIAS_CODIGO + ', ' + { Antes tenía un TO_CHAR }
                       'ET_NOMBRE AS ' + CD_ALIAS_DESC + ', ' +
                       'ET_FBAJA AS ' + CD_ALIAS_BAJA + ', ' +
                       'VD_CANAL2 ' + FExtraFields +
                ' FROM CVD_VENDEDORES, CET_ENTIDADES ' +
               ' WHERE ET_CANAL2 = VD_CANAL3 ' +
                  'AND VD_CANAL2 = ' + SqlInt(FVendedor) +
               ExtraCondition
    else
      Result := inherited GetSql;
  end else
     Result := FSql;
end;
{-----------------------------------------------------------------------------}
procedure TfraEntidades.SetVendedor(const AValue: TTableId);
Var
  AField : TField;
begin
  if FVendedor <> AValue then begin
    FVendedor := AValue;
    if (AValue <> ART_EMPTY_ID) and IsSelected and sdqDatos.Active then begin
      AField := sdqDatos.Fields.FindField('VD_CANAL2');
      if Assigned(AField) Then
      begin
        if(AField.AsInteger <> FVendedor) Then
          Clear;
      end
      else
        Clear;
    end;
  end;
end;
{-----------------------------------------------------------------------------}
end.
