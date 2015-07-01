unit unfraVendedoresOLD;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   12-12-2003
 ULTIMA MODIFICACION: 12-12-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArt, unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask,
  ToolEdit, ArtComboBox;

type
  TfraVendedores = class(TfraCodigoDescripcion)
  private
    FEntidad: TTableId;
    procedure SetEntidad(const AValue: TTableId);
  protected
    function GetSql: String; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Entidad          : TTableId read FEntidad      write SetEntidad;

  end;

implementation

uses unDmPrincipal, AnsiSql;

{$R *.DFM}

{-----------------------------------------------------------------------------}
{ TfraVendedores }
{-----------------------------------------------------------------------------}
constructor TfraVendedores.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'CVD_VENDEDORES';
  FieldID     := 'VD_CANAL2';
  FieldCodigo := 'VD_CANAL2';
  FieldDesc   := 'VD_NOMBRE';
  FieldBaja   := 'VD_FBAJA';
  FindAllOnSameText := False;
end;
{-----------------------------------------------------------------------------}
function TfraVendedores.GetSql: String;
begin
  if FSql = '' Then begin
    if FEntidad <> ART_EMPTY_ID Then
      Result := 'SELECT VD_CANAL2 AS ' + CD_ALIAS_ID + ', ' +
                       'VD_CANAL2 AS ' + CD_ALIAS_CODIGO + ', ' +
                       'VD_NOMBRE AS ' + CD_ALIAS_DESC + ', ' +
                       'VD_FBAJA AS ' + CD_ALIAS_BAJA + ',' +
                       'ET_CANAL2 ' + FExtraFields +
                ' FROM CVD_VENDEDORES, CET_ENTIDADES ' +
               ' WHERE ET_CANAL2 = VD_CANAL3 ' +
                  'AND ET_CANAL2 = ' + SqlInt(FEntidad) +
               ExtraCondition
    else
      Result := inherited GetSql;
  end else
     Result := FSql;
end;
{-----------------------------------------------------------------------------}
procedure TfraVendedores.SetEntidad(const AValue: TTableId);
Var
  AField : TField;
begin
  if FEntidad <> AValue then begin
    FEntidad := AValue;
    if (AValue <> ART_EMPTY_ID) and IsSelected and sdqDatos.Active then begin
      AField := sdqDatos.Fields.FindField('ET_CANAL2');
      if Assigned(AField) Then
      begin
        if(AField.AsInteger <> FEntidad) Then
          Clear;
      end
      else
        Clear;
    end;
  end;
end;
{-----------------------------------------------------------------------------}
end.
