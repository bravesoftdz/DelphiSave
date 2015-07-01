unit unfraCodigoDescripcionExt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, unFraCodigoDescripcion, DB, SDEngine, PatternEdit, StdCtrls,
  Mask, ToolEdit, ArtComboBox;

type
  TfraCodigoDescripcionExt = class(TfraCodigoDescripcion)
  private
    { Private declarations }
    FExtraJoinCondition : String;
    FExtraTableNameList : String;
    function GetFields: TFields;
  protected
    function GetSql: String; override;
  public
    function IsBaja: Boolean; override;

    property ExtraJoinCondition : String read FExtraJoinCondition write FExtraJoinCondition;
    property ExtraTableNameList : String read FExtraTableNameList write FExtraTableNameList;
  published
    procedure Limpiar;
    procedure CheckSintax;
    property  Fields : TFields read GetFields;
  end;

var
  fraCodigoDescripcionExt: TfraCodigoDescripcionExt;

implementation

{$R *.dfm}

uses unDmPrincipal;

{----------------------------------------------------------------------------------------------------------------------}
function TfraCodigoDescripcionExt.GetSql: String;
begin
  if FSql = '' Then
  begin
    Result := 'SELECT ' + FFieldId +     ' AS ' + CD_ALIAS_ID + ', ' +
                          FFieldCodigo + ' AS ' + CD_ALIAS_CODIGO + ', ' + { Antes tenía un TO_CHAR }
                          FFieldDesc +   ' AS ' + CD_ALIAS_DESC + ', ' +
                          FFieldBaja +   ' AS ' + CD_ALIAS_BAJA + ' ' +
                          FExtraFields +
                'FROM ' + FTableName;

    if Trim(FExtraTableNameList) <> '' then  Result := Result + ', ' + FExtraTableNameList;
    result := Result + ' WHERE 1=1 ' + FExtraCondition;
    if Trim(FExtraJoinCondition) <> '' then  result := Result + ' and (' + FExtraJoinCondition + ')';

  end
  else
     Result := FSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCodigoDescripcionExt.Limpiar;
begin
  Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCodigoDescripcionExt.IsBaja: Boolean;
begin
  {$IFDEF ART2}
  Result := inherited IsBaja;
  {$ELSE}
  Result := sdqDatos.FieldByName(CD_ALIAS_BAJA).AsString = 'S';
  {$ENDIF}
end;


procedure TfraCodigoDescripcionExt.CheckSintax;
var
  Query : TSDQuery;
begin

  Query := TSDQuery.Create(nil);
  try
      SetDatabaseToQuery(Query);
      Query.SQL.Text := GetSql + GetSqlWhere;
      try
        Query.Prepare;
      except
        raise Exception.Create('Error al configurar el frame para la tabla:' + FTableName);
      end;
  finally
      Query.Free;
  end;

end;

function TfraCodigoDescripcionExt.GetFields: TFields;
begin
    result := sdqDatos.Fields;
end;

end.
