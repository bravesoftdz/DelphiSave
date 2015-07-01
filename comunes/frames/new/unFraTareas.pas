unit unFraTareas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraCodigoDescripcion, Db, SDEngine, PatternEdit, StdCtrls, Mask, unArt,
  ToolEdit, ArtComboBox;

type
  TTipoTareas = (ttDiarias, ttNoDiarias, ttTodas);
  TfraTareas = class(TfraCodigoDescripcion)
  private
    FIdSistemaProyecto: TTableId;
    FTipoTarea: TTipoTareas;
    function  GetIDSistemaProyecto: TTableId;
    procedure SetIDSistemaProyecto(const Value: TTableId);
  protected
    function GetSql: String; override;
    function GetSqlWhere: String; override;
    function GetSqlGroupBy: String; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
  published
    property IDSistemaProyecto : TTableId    read GetIDSistemaProyecto write SetIDSistemaProyecto;
    property TipoTarea         : TTipoTareas read FTipoTarea           write FTipoTarea;
  end;

var
  fraTareas: TfraTareas;

implementation

uses
  unDmPrincipal, AnsiSql, SQLFuncs;

{$R *.DFM}

{ TfraTareas }

function TfraTareas.GetIDSistemaProyecto: TTableId;
begin
  if IsSelected then
    Result := sdqDatos.FieldByName('RS_IDSISTEMAPROYECTO').AsInteger
  else
    Result := FIdSistemaProyecto;
end;

procedure TfraTareas.SetIDSistemaProyecto(const Value: TTableId);
var
  Field : TField;
begin
  if FIDSistemaProyecto <> Value then
  begin
    FIDSistemaProyecto := Value;
    if (Value <> ART_EMPTY_ID) and IsSelected and sdqDatos.Active then
    begin
      Field := sdqDatos.Fields.FindField('RS_IDSISTEMAPROYECTO');
      if Assigned(Field) then
      begin
        if (Field.AsInteger <> FIDSistemaProyecto) then
        begin
          Clear;
          FIDSistemaProyecto := Value;
        end;
      end
      else
        if not ExisteSql('SELECT 1 FROM CRS_RELATAREASISTEMA ' +
                         ' WHERE RS_IDTAREA = ' + SqlInt(GetValue) +
                         '   AND RS_FECHABAJA IS NULL' +
                         '   AND RS_IDSISTEMAPROYECTO = ' + SqlInt(FIDSistemaProyecto))
        then Clear;
    end;
  end;
end;

procedure TfraTareas.Clear;
begin
  FIDSistemaProyecto := ART_EMPTY_ID;
  inherited;
end;

function TfraTareas.GetSql: String;
var
  sSql, sCadena: string;
begin
  if FSql = '' then begin
    if FIDSistemaProyecto <> ART_EMPTY_ID then
    begin
      sSql := 'SELECT TA_ID AS ' + CD_ALIAS_ID + ', ' +
                     'TA_CODIGO AS ' + CD_ALIAS_CODIGO + ', ' +
                     'TA_DESCRIPCION AS ' + CD_ALIAS_DESC + ', ' +
                     'TA_FECHABAJA AS ' + CD_ALIAS_BAJA;
      if FExtraFields > '' then
        sSQL := sSQL + ', ' + FExtraFields;

      sSQL := sSQL + ' FROM CRS_RELATAREASISTEMA, CTA_TAREA ' +
                    ' WHERE TA_ID = RS_IDTAREA (+) ' +
                       'AND RS_IDSISTEMAPROYECTO = ' + SqlInt(FIDSistemaProyecto) + ExtraCondition;
    end
    else begin
      if (edCodigo.Text > '') and (edCodigo = Screen.ActiveControl) then
        sCadena := ' AND TA_CODIGO like ''' + edCodigo.Text + '%'''
      else if (cmbDescripcion.Text > '') then
        sCadena := ' AND TA_DESCRIPCION like ''' + cmbDescripcion.Text + '%'''
      else
       sCadena := '';

      ExtraCondition := ExtraCondition + sCadena;

      sSql := inherited GetSql;
      SqlAddJoin(sSQL, 'CRS_RELATAREASISTEMA', 'TA_ID', 'RS_IDTAREA', jtOuter);

      ExtraCondition := Copy(ExtraCondition, 1, Length(ExtraCondition) - Length(sCadena));
    end;
  end else
    sSql := FSql;

  Result := sSql;
end;

constructor TfraTareas.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'CTA_TAREA';
  FieldCodigo := 'TA_CODIGO';
  FieldID     := 'TA_ID';
  FieldDesc   := 'TA_DESCRIPCION';
  FieldBaja   := 'TA_FECHABAJA';

  TipoTarea := ttTodas;
end;

function TfraTareas.GetSqlGroupBy: String;
begin
  Result := ' GROUP BY TA_ID, TA_CODIGO, TA_DESCRIPCION, TA_FECHABAJA ';
end;

function TfraTareas.GetSqlWhere: String;
var
  sLetra: string;
begin
  Result := inherited GetSQLWhere;

  case TipoTarea of
    ttDiarias:
      sLetra := 'S';
    ttNoDiarias:
      sLetra := 'N';    
    ttTodas:
      sLetra := ''
    else
      sLetra := '';    
  end;

  if sLetra > '' then
    Result := Result + ' AND (TA_DIARIA = ' + SQLValue(sLetra) + ' OR TA_DIARIA IS NULL) ';
end;

end.
