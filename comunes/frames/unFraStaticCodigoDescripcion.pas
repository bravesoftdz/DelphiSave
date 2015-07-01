
{********************************************************}
{                                                        }
{    TfraStaticCodigoDescripcion                         }
{    Frame de búsqueda estático. Este frame se cargará   }
{    de la base de datos en la memoria, creando y        }
{    destruyendo el dataset utilizado, evitando la       }
{    sobrecarga de memoria.                              }
{    Este frame puede ser utilizado directamente o       }
{    por herencia visual.                                }
{                                                        }
{    Autor: Federico Firenze                             }
{                                                        }
{********************************************************}

unit unFraStaticCodigoDescripcion;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, unArtDBAwareFrame, ComboEditor, ComboGrid, StdCtrls,
  PatternEdit, Db, SDEngine, Grids, StaticGrid, Mask, unFraCodigoDescripcion 
  {$IFDEF ART2}, unArt{$ENDIF};

type
  {$IFDEF ART2}
  TValueType = Integer;
  {$ELSE}
  TValueType = string;
  {$ENDIF}

  TFilterEvent = procedure(Sender: TObject; ARow: Integer; var Accept: Boolean) of object;

  TOrdenType  = (otCodigo, otDescripcion, otCustom);
  TConnectTo = (ctPART, ctFinancials); // by PTavasci
  TfraStaticCodigoDescripcion = class(TArtDBAwareFrame)
    edCodigo: TPatternEdit;
    cmbDescripcion: TComboGrid;
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FrameExit(Sender: TObject);
    procedure cmbDescripcionScroll(Sender: TObject; ARow: Integer; var CanSelect: Boolean);
    procedure cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment;  var Background: TColor; Highlight: Boolean);
  private
    FModifyComboColCount: Boolean;
    FExtraTables: String;
    function GetIsSelected: boolean;
    function GetValue: TValueType;
    procedure SetDynamicCols(const Value: Boolean);
   {$IFDEF ART2}
    function GetAsString: string;
   {$ENDIF}
    procedure SetFixedRows(const Value: Integer);
    function GetCodigo: string;
    procedure SetCodigo(const Value: string);
    function GetVisibleExtraFields(Index: integer): boolean;
    procedure SetVisibleExtraFields(Index: integer; const Value: boolean);
    procedure SetOrderBy(const Index: Integer; const Value: string);
    function GetStringValue: string;
    function  GetVariant: Variant;
    procedure SetVariantValue(const Value: Variant);
    procedure SetShowBajas(const Value: Boolean);
    function GetDescripcion: string;
    function GetExtraTables: String;
  protected
    FDynamicCols: Boolean;
    FAutoFilter: Boolean;
    FOnFilterRow: TFilterEvent;
    FVisibleExtraFields: array of boolean;
    FConnectTo: TConnectTo;
    FOrdenType: TOrdenType;
    FIdType: TCodigoType;
    FColorBaja: TColor;
    FOrderBy: string;
    FCaseSensitive: Boolean;
    FDataValue: array[0..7] of string;
    FColCodigo,
    FColDescripcion,
    FColId,
    FColBaja: Integer;
    FFixedRows: Integer;
    FCustomFilter,
    FFilterChange,
    FShowBajas: Boolean;
    ADynamicCols : Array of string;
    FFilterAllData: TMemoryStream;
    FFilterRowCount: Integer;

    procedure SetValue(const Value: TValueType); virtual;
    function GetDataValue(Index: Integer): string; virtual;
    procedure SetDataValue(const Index: Integer; const Value: string);
    procedure Internal_SetCodigo(const Value: string; DoChanges : Boolean = False);
    procedure LoadValues(DoChanges : boolean = False); virtual;
    procedure CheckData; { Verifica si ya se cargaron los datos y sinó, se cargan }
    procedure CheckFind;
    procedure FilterData(APattern: string);
    function IsRowFiltered(ARow: Integer): boolean; virtual;
    function GetSql: string; virtual;
    function GetSqlOrderBy: string; virtual;
    function GetSqlWhere  : string; virtual;
    function GetIsEmpty: boolean; virtual;
    procedure LoadGrid; virtual;
    procedure LoadRow(ADataSet: TDataSet; ARow: Integer); virtual;
    procedure LoadEditors(ARow: Integer); virtual;
    procedure ClearEditors; virtual;
    function GetStaticColCount: Integer; virtual;
    function ClearOnExit : boolean; virtual;
    function CancelExitLoad : boolean; virtual; {Se usa antes del exists, para si se hereda este frame y se agregan controles, chequee los datos }

    procedure SetKeyValue(Value: Variant); override; { Para que sea DBAware }
    function GetKeyValue: Variant; override; { Para que sea DBAware }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClearGrid;
    procedure Clear; override;
    procedure ClearFilter;
    procedure DoFilterChange;
    function FieldValue(AFieldName: string; ARow: Integer = -1) : string;
    function ColValue(ACol: Integer; ARow: Integer = -1) : string;
    function IsBaja: Boolean; virtual;

    property IsSelected      : boolean         read GetIsSelected;
    property IsEmpty         : boolean         read GetIsEmpty;
    property Value           : TValueType      read GetValue         write SetValue;
    property Codigo          : string          read GetCodigo        write SetCodigo;
    property Descripcion     : string          read GetDescripcion;
    property VariantValue    : Variant         read GetVariant;
   {$IFDEF ART2}
    property AsString        : string          read GetAsString;
   {$ENDIF}
    property VisibleExtraFields[Index: integer]: boolean read GetVisibleExtraFields write SetVisibleExtraFields;
    property ColorBaja: TColor read FColorBaja write FColorBaja;
   published
    property ShowBajas       : Boolean         read FShowBajas       write SetShowBajas     default False;
    property Sql             : string  index 0 read GetDataValue     write SetDataValue;
    property TableName       : string  index 1 read GetDataValue     write SetDataValue;
    property FieldID         : string  index 2 read GetDataValue     write SetDataValue;
    property FieldCodigo     : string  index 3 read GetDataValue     write SetDataValue;
    property FieldDesc       : string  index 4 read GetDataValue     write SetDataValue;
    property FieldBaja       : string  index 5 read GetDataValue     write SetDataValue;
    property ExtraCondition  : string  index 6 read GetDataValue     write SetDataValue;
    property ExtraFields     : string  index 7 read GetDataValue     write SetDataValue;
    property OrderBy         : string  index 8 read FOrderBy         write SetOrderBy;
    property DynamicCols     : Boolean         read FDynamicCols     write SetDynamicCols;
    property FixedRows       : Integer         read FFixedRows       write SetFixedRows     default 1;
    property AutoFilter      : Boolean         read FAutoFilter      write FAutoFilter      default False;
    property CaseSensitive   : Boolean         read FCaseSensitive   write FCaseSensitive   default False;
    property OrdenType       : TOrdenType      read FOrdenType       write FOrdenType       default otDescripcion;
    property OnFilterRow     : TFilterEvent    read FOnFilterRow     write FOnFilterRow;
    property CustomFilter    : Boolean         read FCustomFilter    write FCustomFilter;
    property ConnectTo       : TConnectTo      read FConnectTo       write FConnectTo;
    property IdType          : TCodigoType     read FIdType          write FIdType          default ctString;
    property ExtraTables     : String          read GetExtraTables   write FExtraTables;
    property ModifyComboColCount: Boolean      read FModifyComboColCount  write FModifyComboColCount    default True;
  end;

(*
const
  COL_CODIGO      = 0;
  COL_DESCRIPCION = 1;
  COL_ID          = 2;
  COL_BAJA        = 3; {Ojo al cambiar, hay muchos lados que esta considerado como el último campo Ej: COL_PEPE = FColBaja + 1}

  FIXED_ROWS = 1; { Esta constante está porque hay que publicar la propiedad FixedRow del TComboGrid,
                    pero hasta que no se necesite, mejor lo dejamos así }
*)

implementation

uses
{$IFDEF FINANCIALS}
  unDmFinancials,
{$ENDIF}
  unDmPrincipal, General,
  unCustomDataModule, DBConsts, StrFuncs;

{$R *.DFM}


{ TfraStaticCodigoDescripcion }

procedure TfraStaticCodigoDescripcion.Clear;
begin
  cmbDescripcion.Row := 0;
  ClearEditors;
  Font.Color := clWindowText;
end;

constructor TfraStaticCodigoDescripcion.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FColorBaja := clRed;
  FColCodigo := 0;
  FColDescripcion := 1;
  FColId := 2;
  FColBaja := 3;
  FFixedRows := 1;
  FModifyComboColCount := True;
  FExtraTables   := '';

  FFilterAllData := Nil;

  FDynamicCols   := False;
  FAutoFilter    := False;
  FCaseSensitive := False;
  FieldBaja      := 'NULL';
  FOrdenType     := otDescripcion;

  FCustomFilter  := False;
  FFilterChange  := False;

  cmbDescripcion.ListCol := FColDescripcion;

  ConnectTo := ctPART;

 {$IFDEF ART2}
  FIdType        := ctInteger;
 {$ELSE}
  FIdType        := ctString;
 {$ENDIF}
  cmbDescripcion.Text := '';
end;

{$IFDEF ART2}
function TfraStaticCodigoDescripcion.GetAsString: string;
begin
  FrameExit(nil);
  Result := IntToStr(GetValue);
end;
{$ENDIF}

function TfraStaticCodigoDescripcion.GetIsEmpty: boolean;
begin
  if cmbDescripcion.RowCount = FFixedRows then
    Result := True
  else
    {$IFDEF ART2}
    if IDType = ctInteger then
      Result := GetValue = 0
    else
      Result := GetStringValue = ''
    {$ELSE}
    Result := GetValue = '';
    {$ENDIF}
end;

function TfraStaticCodigoDescripcion.GetIsSelected: boolean;
begin
  Result := not GetIsEmpty;
end;

function TfraStaticCodigoDescripcion.GetSql: string;
begin
  if FDataValue[0] = '' then
    Result := 'SELECT ' + FieldId +     ' AS ' + CD_ALIAS_ID + ', ' +
                          FieldCodigo + ' AS ' + CD_ALIAS_CODIGO + ', ' + { Antes tenía un TO_CHAR }
                          FieldDesc +   ' AS ' + CD_ALIAS_DESC + ', ' +
                          FieldBaja +   ' AS ' + CD_ALIAS_BAJA + ' ' +
                          ExtraFields +
                'FROM ' + TableName + ExtraTables +
              ' WHERE 1=1 ' + ExtraCondition
  else
     Result := FDataValue[0];
end;

function TfraStaticCodigoDescripcion.GetSqlOrderBy: string;
var
  sOrden: String;
begin
  {$IFDEF MSACCESS}
    sOrden := '3';
  {$ELSE}
    case FOrdenType of
      otCodigo:
        sOrden := CD_ALIAS_CODIGO;
      otDescripcion:
        sOrden := CD_ALIAS_DESC;
      otCustom:
        sOrden := FOrderBy;
    end;
  {$ENDIF}

   Result := ' ORDER BY ' + sOrden + iif(((Trim(FieldBaja) > '') and
                                          (UpperCase( Trim(FieldBaja) ) <> 'NULL') ),
                                         ', ' + FieldBaja + ' DESC ',
                                         '');
end;

function TfraStaticCodigoDescripcion.GetSqlWhere: string;
begin
  if FShowBajas then
    Result := ''
  else
    Result := ' AND ' + FieldBaja + ' IS NULL';
end;

function TfraStaticCodigoDescripcion.GetValue: TValueType;
begin
  FrameExit(nil);
  if cmbDescripcion.Row > FFixedRows-1 then
    {$IFDEF ART2}
    Result := StrToIntDef( cmbDescripcion.Cells[ FColId, cmbDescripcion.Row ], ART_EMPTY_ID )
    {$ELSE}
    Result := cmbDescripcion.Cells[ FColId, cmbDescripcion.Row ]
    {$ENDIF}
  else
    {$IFDEF ART2}
    Result := ART_EMPTY_ID;
    {$ELSE}
    Result := '';
    {$ENDIF}
end;

function TfraStaticCodigoDescripcion.GetStringValue: string;
begin
  FrameExit(nil);
  if cmbDescripcion.Row > FFixedRows-1 then
    if IDType = ctInteger then
      Result := IntToStr(StrToIntDef( cmbDescripcion.Cells[ FColId, cmbDescripcion.Row ], 0 ))
    else
      Result := cmbDescripcion.Cells[ FColId, cmbDescripcion.Row ]
  else
    if IDType = ctInteger then
      Result := IntToStr(0)
    else
      Result := '';
end;

procedure TfraStaticCodigoDescripcion.LoadGrid;
Var
  i,
  iRows: Integer;
  sdqData: TSDQuery;
  sSQL, OldText, OldCode: string;
  bExisteExtraCondition: Boolean;
begin
  OldText := cmbDescripcion.Text;
  OldCode := edCodigo.Text;
  sdqData := nil;
  bExisteExtraCondition := (Pos(ExtraCondition, GetSql) > 0);
  
  sSQL := GetSql + ' ' + GetSqlWhere + ' ' + Iif(bExisteExtraCondition, '', ExtraCondition + ' ') + GetSqlOrderBy;

  if ConnectTo = ctPART then
    sdqData := dmPrincipal.GetQuery(sSQL, [qoUniDirectional])
{$IFDEF FINANCIALS}
  else if ConnectTo = ctFinancials then
    sdqData := dmFinancials.GetQuery(sSQL, [qoUniDirectional])
{$ENDIF};

  try
    if FDynamicCols then
    begin
      if FModifyComboColCount then
        cmbDescripcion.ColCount := GetStaticColCount;
      SetLength(ADynamicCols, 0);
      for i := 0 to sdqData.Fields.Count-1 do
      begin
        if not AreIn(sdqData.Fields[i].FieldName, [CD_ALIAS_ID, CD_ALIAS_CODIGO, CD_ALIAS_DESC, CD_ALIAS_BAJA]) then
        begin
          if High(ADynamicCols) = -1 then
            SetLength(ADynamicCols, 1)
          else
            SetLength(ADynamicCols, High(ADynamicCols) + 2);

          ADynamicCols[High(ADynamicCols)] := sdqData.Fields[i].FieldName;
          if FModifyComboColCount then
            cmbDescripcion.ColCount := cmbDescripcion.ColCount + 1;
          cmbDescripcion.Cells[i, 0] := sdqData.Fields[i].FieldName;

          if (not FVisibleExtraFields[i - GetStaticColCount]) then
            cmbDescripcion.ColWidths[i] := -1;

          sdqData.Fields[i].Visible := FVisibleExtraFields[i - GetStaticColCount];

          {Revisar el componente combo grid para que tome la visibilidad de los
          campos de la consulta para cuando arma las columnas del grid...PTD}

        end;
      end;
    end;

    cmbDescripcion.RowCount := 2;
    iRows                   := FFixedRows;
    while not sdqData.EOF do
    begin
      cmbDescripcion.RowCount := iRows + 1;
      LoadRow(sdqData, iRows);

      Inc( iRows );
      sdqData.Next;
    end;
  finally
    cmbDescripcion.Text := OldText;
    edCodigo.Text       := OldCode;

    sdqData.Free;
  end;
end;

procedure TfraStaticCodigoDescripcion.LoadRow(ADataSet: TDataSet; ARow: Integer);
var
  i: Integer;
begin
  cmbDescripcion.Cells[FColCodigo,      ARow] := ADataSet.FieldByName(CD_ALIAS_CODIGO).AsString;
  cmbDescripcion.Cells[FColDescripcion, ARow] := ADataSet.FieldByName(CD_ALIAS_DESC).AsString;
  cmbDescripcion.Cells[FColId,          ARow] := ADataSet.FieldByName(CD_ALIAS_ID).AsString;
  cmbDescripcion.Cells[FColBaja,        ARow] := ADataSet.FieldByName(CD_ALIAS_BAJA).AsString;

  if FDynamicCols then
    for i := Low(ADynamicCols) to High(ADynamicCols) do
      cmbDescripcion.Cells[ FColBaja + i + 1,  ARow ] := ADataSet.FieldByName( ADynamicCols[i] ).AsString;
end;

procedure TfraStaticCodigoDescripcion.SetValue(const Value: TValueType);
var
  iRow : Integer;
begin
  ClearFilter;
  CheckData;
  {$IFDEF ART2}
  iRow := cmbDescripcion.FindRow( FFixedRows, [FColId], [IntToStr(Value)] );
  {$ELSE}
  iRow := cmbDescripcion.FindRow( FFixedRows, [FColId], [Value] );
  {$ENDIF}

  if iRow > FFixedRows-1 then
  begin
    cmbDescripcion.Row := iRow;
    LoadValues( False );
  end else
    Clear;
end;

procedure TfraStaticCodigoDescripcion.SetVariantValue(const Value: Variant);
var
  iRow : Integer;
begin
  ClearFilter;
  CheckData;
  iRow := cmbDescripcion.FindRow( FFixedRows, [FColId], [Value] );

  if iRow > FFixedRows-1 then
  begin
    cmbDescripcion.Row := iRow;
    LoadValues( False );
  end else
    Clear;
end;

procedure TfraStaticCodigoDescripcion.cmbDescripcionDropDown(Sender: TObject);
begin
  CheckData;
  CheckFind;

  Font.Color := clWindowText;
end;

procedure TfraStaticCodigoDescripcion.CheckData;
begin
  if (cmbDescripcion.RowCount = FFixedRows) and (not Assigned(FFilterAllData)) then
    LoadGrid;
end;

procedure TfraStaticCodigoDescripcion.cmbDescripcionCloseUp(Sender: TObject);
begin
  if cmbDescripcion.Text = '' then
  begin
    Clear;
    Change;
  end else
    LoadValues( True );
end;

procedure TfraStaticCodigoDescripcion.LoadValues(DoChanges: boolean);
begin
  LoadEditors(cmbDescripcion.Row);

  if IsBaja then
    Font.Color := FColorBaja
  else if Font.Color = FColorBaja then
    Font.Color := clWindowText;
  //Esto lo hago por si se setea otro color en algún frame que herede de este, ej: unfraStaticActividad

  if DoChanges then
  begin
    Change;

    if (edCodigo.Text <> '') then
      DoLostFocus;
  end;
end;

function TfraStaticCodigoDescripcion.IsBaja: Boolean;
begin
  Result := cmbDescripcion.Cells[FColBaja, cmbDescripcion.Row] <> '';
end;

procedure TfraStaticCodigoDescripcion.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbDescripcion.DropDown ;
end;

procedure TfraStaticCodigoDescripcion.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Internal_SetCodigo( edCodigo.Text, True );
end;

procedure TfraStaticCodigoDescripcion.Internal_SetCodigo(const Value: string; DoChanges: Boolean);
Var
 iRow : Integer;
begin
  ClearFilter;
  CheckData;
  iRow := cmbDescripcion.FindRow(FFixedRows, [FColCodigo], [Value]);

  if iRow > -1 then
  begin
    cmbDescripcion.Row := iRow;
    LoadValues( DoChanges );
  end else
  begin
    Clear;
    Change;
  end;
end;

procedure TfraStaticCodigoDescripcion.FrameExit(Sender: TObject);
begin
  if not ExitInProgress then
  begin
    ExitInProgress := True;
    try
      if not ReadOnly then
      begin
        if (edCodigo.Text = '') and (cmbDescripcion.Text = '') and ClearOnExit then
        begin
          Clear;
          UpdateData(nil);
        end else
        begin
          if (cmbDescripcion.Row = -1) or ((edCodigo.Text <> cmbDescripcion.Cells[FColCodigo, cmbDescripcion.Row]) and (edCodigo.Text <> '')) then
            Internal_SetCodigo( edCodigo.Text, True )
          else if (edCodigo.Text = '') and (cmbDescripcion.Text <> '') {and (cmbDescripcion.Row > FFixedRows)} then
            CheckFind
          {else if (cmbDescripcion.Row > FFixedRows) then
          begin
            LoadEditors(cmbDescripcion.Row);
            cmbDescripcion.Text := cmbDescripcion.Cells[FColDescripcion, cmbDescripcion.Row]
          end}
          else if not CancelExitLoad then
          begin
            LoadEditors(cmbDescripcion.Row);
            cmbDescripcion.Text := cmbDescripcion.Cells[FColDescripcion, cmbDescripcion.Row];
          end
        end;
      end;
    finally
      ExitInProgress := False;
    end;
  end;
end;

procedure TfraStaticCodigoDescripcion.cmbDescripcionScroll(Sender: TObject; ARow: Integer; var CanSelect: Boolean);
begin
  if (ARow > FFixedRows-1) then
    //edCodigo.Text := cmbDescripcion.Cells[ FColCodigo, ARow ]
    LoadEditors(ARow)
  else
    ClearEditors;
    //edCodigo.Text := '';
end;

procedure TfraStaticCodigoDescripcion.cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment;  var Background: TColor; Highlight: Boolean);
begin
  if (ARow > 0) and (cmbDescripcion.Cells[FColBaja, ARow] <> '') then
    AFont.Color := FColorBaja;
end;

procedure TfraStaticCodigoDescripcion.SetDynamicCols(const Value: Boolean);
begin
  if FDynamicCols <> Value then
  begin
    FDynamicCols := Value;
    if not Value then
      cmbDescripcion.ColCount := GetStaticColCount;
  end;
end;

procedure TfraStaticCodigoDescripcion.CheckFind;
var
  iRow: Integer;
  bDummy: Boolean;
  sText, sCode,
  sCell: string;
begin
  with cmbDescripcion do
  begin
    sCell := Cells[ListCol, Row];
    sText := Text; { Para que no pierda el texto cuando se carga el combo }
    sCode := edCodigo.Text; {Modificación para que busque y ordene por código}

    if FCustomFilter and FFilterChange and Assigned(FFilterAllData) then
      ClearFilter;

    if (sText = '') and (sCode = '') and (not FCustomFilter) then
      ClearFilter
    else
    begin
      CheckData;
      if (CompareText(Copy(sCell, 0, Length(sText)), sText) <> 0) or ((sCode > '') and (sText = '')) then
      begin
        if (FFilterChange and FCustomFilter) or FAutoFilter or (Pos('%', sText) > 0) then
        begin
          if StrRight(sText, 1) <> '%' then
            sText := sText + '%';

          FilterData(sText)
        end
        else
        begin
          if sText = '' then
            iRow := cmbDescripcion.FindRow(FFixedRows, [FColCodigo], [sCode], [lxCaseInsensitive, lxPartialKey])
          else
            iRow := cmbDescripcion.FindRow(FFixedRows, [FColDescripcion], [sText], [lxCaseInsensitive, lxPartialKey]);

          if iRow > -1 then
            Row := iRow;

          cmbDescripcionScroll( nil, iRow, bDummy );
        end;
      end
      else if FCustomFilter and (FFilterAllData = Nil) then
        FilterData('%')
      else
        LoadEditors(Row);
    end
  end;
end;

function TfraStaticCodigoDescripcion.GetDataValue(Index: Integer): string;
begin
  if Index = 0 then
    Result := GetSql
  else
    Result := FDataValue[Index];
end;

procedure TfraStaticCodigoDescripcion.SetDataValue(const Index: Integer; const Value: string);
var
  tslExtraFields: TStringList;
  i: Integer;
begin
  if FDataValue[Index] <> Value then
  begin
    FDataValue[Index] := Value;
    ClearGrid;
  end;
  // Visibilidad de los ExtraFields
  if (Index = 7) and (Value > '') then
  begin
    tslExtraFields := TStringList.Create;
    Split(Value, ',', tslExtraFields);
    SetLength(FVisibleExtraFields, tslExtraFields.Count);

    for i:=0 to tslExtraFields.Count-1 do
      FVisibleExtraFields[i] := True;

    tslExtraFields.Free;
  end;
end;

procedure TfraStaticCodigoDescripcion.ClearGrid;
var
  iCol : Integer;
begin
  Clear;
  cmbDescripcion.RowCount := FFixedRows;

  { Limpia los datos de la primer fila }
  for iCol := 0 to cmbDescripcion.ColCount-1 do
    cmbDescripcion.Cells[iCol, FFixedRows] := '';
end;

function TfraStaticCodigoDescripcion.FieldValue(AFieldName: string; ARow: Integer): string;
var
  iCol : Integer;
begin
  iCol := ArrayPos( AFieldName, ADynamicCols);
  if iCol = -1 then
    raise Exception.CreateFmt(SFieldNotFound, [AFieldName])
  else
  begin
    if ARow = -1 then
      ARow := cmbDescripcion.Row;

    Result := cmbDescripcion.Cells[iCol+4, ARow];
  end;
end;

function TfraStaticCodigoDescripcion.ColValue(ACol: Integer; ARow: Integer = -1) : string;
begin
  if ARow = -1 then
    ARow := cmbDescripcion.Row;

  Result := cmbDescripcion.Cells[ACol, ARow];
end;

function TfraStaticCodigoDescripcion.GetStaticColCount: Integer;
begin
  Result := FColBaja + 1;
end;

procedure TfraStaticCodigoDescripcion.SetFixedRows(const Value: Integer);
begin
  if FFixedRows <> Value then
  begin
    FFixedRows := Value;
    { Hasta que todos recompilen ArtUtils }
    {
    if cmbDescripcion.RowCount > FFixedRows then
      cmbDescripcion.FixedRows := FFixedRows;
    }
  end;
end;

procedure TfraStaticCodigoDescripcion.ClearEditors;
begin
  edCodigo.Clear ;
  cmbDescripcion.Clear ;
end;

procedure TfraStaticCodigoDescripcion.LoadEditors(ARow: Integer);
begin
  edCodigo.Text       := cmbDescripcion.Cells[FColCodigo, ARow];
  cmbDescripcion.Text := cmbDescripcion.Cells[FColDescripcion, cmbDescripcion.Row]
end;

function TfraStaticCodigoDescripcion.CancelExitLoad: boolean;
begin
  Result := False;
end;

function TfraStaticCodigoDescripcion.ClearOnExit: boolean;
begin
  Result := True;
end;

procedure TfraStaticCodigoDescripcion.FilterData(APattern: string);
var
  iRow: Integer;
begin
  if Assigned(FFilterAllData) then
    ClearFilter;

  FFilterAllData := TMemoryStream.Create;
  cmbDescripcion.SaveToStream(FFilterAllData);
  FFilterRowCount := cmbDescripcion.RowCount;

  for iRow := cmbDescripcion.RowCount-1 downto FFixedRows do
    if CaseSensitive then
      begin
        if (not Like(cmbDescripcion.Cells[FColDescripcion, iRow], APattern)) or IsRowFiltered(iRow) then
          cmbDescripcion.DeleteRow(iRow);
      end
    else
      if (not Like(UpperCase(cmbDescripcion.Cells[FColDescripcion, iRow]), UpperCase(APattern) )) or IsRowFiltered(iRow) then
        cmbDescripcion.DeleteRow(iRow);

  FFilterChange := False;
end;

procedure TfraStaticCodigoDescripcion.ClearFilter;
begin
  if Assigned(FFilterAllData) then
  begin
    cmbDescripcion.RowCount := FFilterRowCount;

    FFilterAllData.Position := 0;
    cmbDescripcion.LoadFromStream(FFilterAllData);

    FreeAndNil(FFilterAllData);
    FFilterRowCount := 0;
  end;
end;

destructor TfraStaticCodigoDescripcion.Destroy;
begin
  if Assigned(FFilterAllData) then
    FFilterAllData.Free;

  inherited;
end;

function TfraStaticCodigoDescripcion.GetKeyValue: Variant;
begin
  FrameExit(nil);
  if IsEmpty then
    Result := Null
  else
    Result := GetVariant;
end;

procedure TfraStaticCodigoDescripcion.SetKeyValue(Value: Variant);
begin
  if VarIsNull(Value) then
    Clear
  else
    SetVariantValue(Value);
end;

function TfraStaticCodigoDescripcion.GetCodigo: string;
begin
  FrameExit(nil);
  Result := edCodigo.Text;  
end;

procedure TfraStaticCodigoDescripcion.SetCodigo(const Value: string);
begin
  Internal_SetCodigo(Value, False);
end;

function TfraStaticCodigoDescripcion.IsRowFiltered(ARow: Integer): boolean;
var
  AAccept: Boolean;
begin
  AAccept := True;
  if Assigned(FOnFilterRow) then
    FOnFilterRow(Self, ARow, AAccept);

  Result := not AAccept;
end;

procedure TfraStaticCodigoDescripcion.DoFilterChange;
var
  BClear: Boolean;
begin
  BClear := (cmbDescripcion.Row = 0) or IsRowFiltered(cmbDescripcion.Row);

  if BClear or (CompareText(cmbDescripcion.Cells[cmbDescripcion.ListCol, cmbDescripcion.Row], cmbDescripcion.Text) <> 0) then
    cmbDescripcion.Text := '';

  FFilterChange := True;
  CheckFind;

  if BClear then
    Clear;
end;

function TfraStaticCodigoDescripcion.GetVisibleExtraFields(Index: integer): boolean;
begin
  Result := FVisibleExtraFields[Index];
end;

procedure TfraStaticCodigoDescripcion.SetVisibleExtraFields(Index: integer; const Value: boolean);
begin
  FVisibleExtraFields[Index] := Value;
end;

procedure TfraStaticCodigoDescripcion.SetOrderBy(const Index: Integer; const Value: string);
begin
  if Value <> FOrderBy then {Modificación para que busque y ordene por código}
    ClearGrid;

  FOrderBy := Value;
  if Value > '' then
    OrdenType := otCustom;
end;

function TfraStaticCodigoDescripcion.GetVariant: Variant;
begin
  FrameExit(nil); // Valida que todo este completo
  if cmbDescripcion.Row > FFixedRows-1 then
  begin
    if IDType = ctInteger then
      Result := GetValue
    else
      Result := GetStringValue;
  end else
    {$IFDEF ART2}
    if IDType = ctInteger then
      Result := ART_EMPTY_ID
    else
      Result := '';
    {$ELSE}
    Result := '';
    {$ENDIF}
end;

procedure TfraStaticCodigoDescripcion.SetShowBajas(const Value: Boolean);
var
  Valor: Variant; 
begin
  if FShowBajas <> Value then
  begin
    FShowBajas := Value;

    if IsEmpty then
      ClearGrid
    else begin
      Valor := Value;
      ClearGrid;
      SetValue(Valor);
    end;
  end;
end;

function TfraStaticCodigoDescripcion.GetDescripcion: string;
begin
  FrameExit(nil);
  if IsEmpty then
    Result := ''
  else
    Result := cmbDescripcion.Text;
end;

function TfraStaticCodigoDescripcion.GetExtraTables: String;
begin
  Result := FExtraTables;
end;

end.
