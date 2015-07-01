unit unFraMultiSeleccion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, CheckLst, ARTCheckListBox, ExtCtrls, ComCtrls, ToolWin;

type
  TfraMultiSeleccion = class(TFrame)
    pnlFilterPanel: TPanel;
    lstMultiSeleccion: TARTCheckListBox;
    edSearch: TEdit;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    tbOrdenar: TToolButton;
    ToolButton6: TToolButton;
    tbVerSeleccionados: TToolButton;
    imgSearch: TImage;
    pnlCaption: TPanel;
    ToolButton1: TToolButton;
    procedure edSearchEnter(Sender: TObject);
    procedure edSearchExit(Sender: TObject);
    procedure edSearchChange(Sender: TObject);
    procedure lstMultiSeleccionClickCheck(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbVerSeleccionadosClick(Sender: TObject);
  private
    FExtraCondition: String;
    FExtraFields: String;
    FExtraTables: String;
    FFieldBaja: String;
    FFieldCodigo: String;
    FFieldDesc: String;
    FFieldID: String;
    FSql: String;
    FOrderBy: String;
    FOrderByDesc: boolean;
    FTableName: String;
    FShowBajas: Boolean;
    FGroupBy: String;
    FCheckedList: TStringList;
    function GetSqlGroupBy: String;
    function GetSqlOrderBy: String;
    function GetSqlWhere: String;
    function GetSqlWhereSearch: String;
    function GetSql: String;
    function GetOrderBy: String;
    function GetShowBajas: Boolean;
    function GetTableName: String;
    procedure SetShowBajas(const Value: Boolean);
    procedure SetSql(const Value: String);
    function GetExtraCondition: String;
    function GetExtraFields: String;
    function GetExtraTables: String;
    function GetFieldBaja: String;
    function GetFieldCodigo: String;
    function GetFieldDesc: String;
    function GetFieldID: String;
    function GetShowFilterPanel: Boolean;
    procedure SetFilterPanel(const Value: Boolean);
    procedure SaveChecked;
    procedure CheckedSelected;
    function GetValuesChecked: TStrings;
    function GetCaption: String;
    procedure SetCaption(const Value: String);
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
    function InSQL_IntegerValues(const AField: string; bIncludeNULL: boolean = true): string;
    function InSQL_StringValues(const AField: string; bIncludeNULL: boolean = true): string;
    function CheckCount: integer;
  published
    property ExtraCondition     : String       read GetExtraCondition   write FExtraCondition;
    property ExtraFields        : String       read GetExtraFields      write FExtraFields;
    property ExtraTables        : String       read GetExtraTables      write FExtraTables;
    property FieldBaja          : String       read GetFieldBaja        write FFieldBaja;
    property FieldCodigo        : String       read GetFieldCodigo      write FFieldCodigo;
    property FieldDesc          : String       read GetFieldDesc        write FFieldDesc;
    property FieldID            : String       read GetFieldID          write FFieldID;
    property OrderBy            : String       read GetOrderBy          write FOrderBy;
    property ShowBajas          : Boolean      read GetShowBajas        write SetShowBajas       default False;
    property Sql                : String       read GetSql              write SetSql;
    property TableName          : String       read GetTableName        write FTableName;
    property ShowFilterPanel    : Boolean      read GetShowFilterPanel  write SetFilterPanel     default False;
    property ValuesChecked      : TStrings     read GetValuesChecked;
    property Caption            : String       read GetCaption          write SetCaption;
    procedure Refresh;
  end;

const
  CD_ALIAS_ID     : String = 'ID';
  CD_ALIAS_DESC   : String = 'DESCRIPCION';
  CD_ALIAS_BAJA   : String = 'BAJA';
  CAPTION_BUSCAR  : String = 'Buscar...';
  ITEM_SELECCIONAR_TODO : String = '(Seleccionar todo)';

implementation

uses
  General, StrFuncs;

{$R *.dfm}

function TfraMultiSeleccion.GetExtraCondition: String;
begin
  Result := FExtraCondition;
end;

function TfraMultiSeleccion.GetExtraFields: String;
begin
  Result := FExtraFields;
end;

function TfraMultiSeleccion.GetExtraTables: String;
begin
  Result := FExtraTables;
end;

function TfraMultiSeleccion.GetFieldBaja: String;
begin
  Result := FFieldBaja;
end;

function TfraMultiSeleccion.GetFieldCodigo: String;
begin
  Result := FFieldCodigo;
end;

function TfraMultiSeleccion.GetFieldDesc: String;
begin
  Result := FFieldDesc;
end;

function TfraMultiSeleccion.GetFieldID: String;
begin
  Result := FFieldID;
end;

function TfraMultiSeleccion.GetOrderBy: String;
begin
  Result := FOrderBy;
end;

function TfraMultiSeleccion.GetShowBajas: Boolean;
begin
  Result := FShowBajas;
end;

function TfraMultiSeleccion.GetShowFilterPanel: Boolean;
begin
  Result := pnlFilterPanel.Visible;
end;

function TfraMultiSeleccion.GetSql: String;
begin
  if FSql = '' then
    Result := 'SELECT ' + FieldDesc +   ' AS ' + CD_ALIAS_DESC + ', ' +
                          FieldId +     ' AS ' + CD_ALIAS_ID + ', ' +
                          FieldBaja +   ' AS ' + CD_ALIAS_BAJA + ' ' +
                          ExtraFields +
                'FROM ' + TableName + ExtraTables +
              ' WHERE 1=1 ' + ExtraCondition
  else
     Result := FSql;
end;
function TfraMultiSeleccion.GetSqlGroupBy: String;
begin
  if FGroupBy <> '' then
    Result := ' GROUP BY ' + FGroupBy
  else
    Result := '';
end;

function TfraMultiSeleccion.GetSqlOrderBy: String;
begin
  Result := ' ORDER BY ';
  if FOrderBy <> '' then
    Result := Result + FOrderBy + iif(FOrderByDesc, ' DESC ', '')
  else
    Result := Result + CD_ALIAS_DESC + iif(FOrderByDesc, ' DESC ', '') +
              iif(((Trim(FieldBaja) > '') and
                   (UpperCase( Trim(FieldBaja) ) <> 'NULL') ),
                  ', ' + FieldBaja + ' DESC ',
                  '');
end;

function TfraMultiSeleccion.GetSqlWhere: String;
begin
  if ShowBajas then
    Result := ''
  else
    Result := ' AND ' + FieldBaja + ' IS NULL';
end;

function TfraMultiSeleccion.GetTableName: String;
begin
  Result := FTableName;
end;

procedure TfraMultiSeleccion.Refresh;
begin
  lstMultiSeleccion.SQL := GetSql +
                           GetSqlWhere +
                           GetSqlWhereSearch +
                           iif(tbVerSeleccionados.Down, InSQL_IntegerValues(FFieldID, false), '') +
                           GetSqlGroupBy +
                           GetSqlOrderBy;

  if lstMultiSeleccion.Items.IndexOf(ITEM_SELECCIONAR_TODO) < 0 then
  begin
    lstMultiSeleccion.Items.Insert(0, ITEM_SELECCIONAR_TODO);
    lstMultiSeleccion.Values.Insert(0, '0');
  end;
  CheckedSelected;
end;

procedure TfraMultiSeleccion.SetFilterPanel(const Value: Boolean);
begin
  pnlFilterPanel.Visible := Value;
end;

procedure TfraMultiSeleccion.SetShowBajas(const Value: Boolean);
begin
  FShowBajas := Value;
end;

procedure TfraMultiSeleccion.SetSql(const Value: String);
begin
  if FSql <> Value then
  begin
    FSql := Value;
    lstMultiSeleccion.Clear;
  end;
end;

function TfraMultiSeleccion.GetSqlWhereSearch: String;
begin
  if (edSearch.Text = CAPTION_BUSCAR) or (edSearch.Text = '') then
    Result := ''
  else
    Result := ' AND UPPER(' + FieldDesc + ') LIKE ''%' + UpperCase(edSearch.Text) + '%''';
end;

procedure TfraMultiSeleccion.edSearchEnter(Sender: TObject);
begin
  if edSearch.Text = CAPTION_BUSCAR then
    edSearch.Clear;
end;

procedure TfraMultiSeleccion.edSearchExit(Sender: TObject);
begin
  if edSearch.Text = '' then
    edSearch.Text := CAPTION_BUSCAR
end;

procedure TfraMultiSeleccion.edSearchChange(Sender: TObject);
begin
  Refresh;
end;

procedure TfraMultiSeleccion.lstMultiSeleccionClickCheck(Sender: TObject);
var
  i: integer;
begin
  if (lstMultiSeleccion.Items[lstMultiSeleccion.ItemIndex] = ITEM_SELECCIONAR_TODO) then
    for i:= 1 to lstMultiSeleccion.Count-1 do
      lstMultiSeleccion.Checked[i] := lstMultiSeleccion.Checked[lstMultiSeleccion.ItemIndex];
  if not lstMultiSeleccion.Checked[lstMultiSeleccion.ItemIndex] and (lstMultiSeleccion.Items[0] = ITEM_SELECCIONAR_TODO) then
    lstMultiSeleccion.Checked[0] := false;
  SaveChecked;
end;

procedure TfraMultiSeleccion.SaveChecked;
var
  i: integer;
  iStart: integer;
begin
  if (lstMultiSeleccion.Items[lstMultiSeleccion.ItemIndex] = ITEM_SELECCIONAR_TODO) then
    iStart := 1
  else
    iStart := 0;
  for i:= iStart to lstMultiSeleccion.Count -1 do
    if lstMultiSeleccion.Checked[i] then
    begin
      if FCheckedList.IndexOf(lstMultiSeleccion.Values[i]) < 0 then
        FCheckedList.Add(lstMultiSeleccion.Values[i]);
      end
    else begin
      if FCheckedList.IndexOf(lstMultiSeleccion.Values[i]) >= 0 then
        FCheckedList.Delete(FCheckedList.IndexOf(lstMultiSeleccion.Values[i]));
    end;
end;

constructor TfraMultiSeleccion.Create(AComponent: TComponent);
begin
  inherited;
  FCheckedList:= TStringList.Create;
end;

destructor TfraMultiSeleccion.Destroy;
begin
  FreeAndNil(FCheckedList);
  inherited;
end;

procedure TfraMultiSeleccion.CheckedSelected;
var
  i: integer;
begin
  for i:=0 to FCheckedList.Count-1 do
    lstMultiSeleccion.Check(FCheckedList[i]);
end;

function TfraMultiSeleccion.InSQL_IntegerValues(const AField: string;
  bIncludeNULL: boolean): string;
var
  i: integer;
begin
  for i := 0 to FCheckedList.Count - 1 do
    Result := Result + FCheckedList.Strings[i] + ',';

  if Result > '' then
  begin
    Result := StrLeft(Result, Length(Result) - 1);
    Result := ' AND ' + AField + ' IN (' + Result + iif(bIncludeNULL, ',NULL', '') + ') ';
  end;
end;

function TfraMultiSeleccion.InSQL_StringValues(const AField: string;
  bIncludeNULL: boolean): string;
var
  i: integer;
begin
  for i := 0 to FCheckedList.Count - 1 do
    Result := Result + QuotedStr(FCheckedList.Strings[i]) + ',';

  if Result > '' then
  begin
    Result := StrLeft(Result, Length(Result) - 1);
    Result := ' AND ' + AField + ' IN (' + Result + iif(bIncludeNULL, ',NULL', '') + ') ';
  end;
end;

function TfraMultiSeleccion.CheckCount: integer;
begin
  Result := FCheckedList.Count;
end;

function TfraMultiSeleccion.GetValuesChecked: TStrings;
begin
  Result := FCheckedList;
end;

procedure TfraMultiSeleccion.tbOrdenarClick(Sender: TObject);
begin
  FOrderByDesc := not FOrderByDesc;
  Refresh;  
end;

procedure TfraMultiSeleccion.tbVerSeleccionadosClick(Sender: TObject);
begin
  Refresh;
end;

function TfraMultiSeleccion.GetCaption: String;
begin
  Result := pnlCaption.Caption;
end;

procedure TfraMultiSeleccion.SetCaption(const Value: String);
begin
  pnlCaption.Caption := Value;
end;

end.
