unit unFraStaticCTB_TABLAS;

interface

uses
  {$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unFraStaticCodigoDescripcion, ComboEditor, ComboGrid, StdCtrls,
  Mask, PatternEdit, Db, unArt;

type
  //TCtbClave = string;
  TCtbCodigo = string;
  TfraStaticCTB_TABLAS = class(TfraStaticCodigoDescripcion)
    procedure cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer;
             AFont: TFont; var AAlignment: TAlignment;  var Background: TColor;
             Highlight: Boolean);
  private
    FEspecial1: String;
    FEspecial2: String;
    FClave: TCtbClave;
    {$IFDEF ART2}
    function GetValue: TCtbCodigo;
    procedure SetValue(const Value: TCtbCodigo); reintroduce;
    {$ENDIF}
    procedure SetClave(const Value: TCtbClave);
    procedure SetEspecial1(const Value: String);
    procedure SetEspecial2(const Value: String);
    function GetEspecial1: String;
    function GetEspecial2: String;
  protected
    FColClave,
    FColEspecial1,
    FColEspecial2: Integer;
    function GetIsEmpty: boolean; override;
    function GetSqlWhere  : String; override;
    procedure LoadRow(ADataSet : TDataSet; ARow : Integer); override;
    function GetStaticColCount: Integer; override;
    {$IFDEF ART2}
    procedure SetKeyValue(Value: Variant); override; { Para que sea DBAware }
    function GetKeyValue: Variant; override; { Para que sea DBAware }
    {$ENDIF}

    {Oculta las Propiedades}
    property  TableName;
    property  FieldID;
    property  FieldCodigo;
    property  FieldDesc;
    property  FieldBaja;
    property  ExtraFields;
  public
    constructor Create(AOwner: TComponent); override;
    function IsBaja : Boolean; override;
    {$IFDEF ART2}
    property Value      : TCtbCodigo     read GetValue     write SetValue;
    {$ENDIF}
    property ColClave    : Integer read FColClave;
    property ColEspecial1: Integer read FColEspecial1;
    property ColEspecial2: Integer read FColEspecial2;
  published
    property Clave      : TCtbClave      read FClave       write SetClave;
    property Especial1  : String         read GetEspecial1   write SetEspecial1;
    property Especial2  : String         read GetEspecial2   write SetEspecial2;
  end;

{const
  COL_CLAVE     = unFraStaticCodigoDescripcion.COL_BAJA + 1;
  COL_ESPECIAL1 = unFraStaticCodigoDescripcion.COL_BAJA + 2;
  COL_ESPECIAL2 = unFraStaticCodigoDescripcion.COL_BAJA + 3;
}
implementation

{$R *.DFM}

uses
  General, AnsiSql, unFraCodigoDescripcion;

{----------------------------------------------------------------------------------------------------------------------}
{ TfraStaticCTB_TABLAS }
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraStaticCTB_TABLAS.Create(AOwner: TComponent);
begin
  inherited;
  TableName   := 'CTB_TABLAS';
  FieldID     := 'TB_CODIGO';
  FieldCodigo := 'TB_CODIGO';
  FieldDesc   := 'TB_DESCRIPCION';
  {$IFDEF ART2}
  FieldBaja   := 'TB_FECHABAJA';
  {$ELSE}
  FieldBaja   := 'TB_BAJA';
  {$ENDIF}
  ExtraFields := ', TB_CLAVE, TB_ESPECIAL1, TB_ESPECIAL2 ';

  DynamicCols := False;

  FColClave     := FColBaja + 1;
  FColEspecial1 := FColBaja + 2;
  FColEspecial2 := FColBaja + 3;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraStaticCTB_TABLAS.GetIsEmpty: boolean;
begin
  if cmbDescripcion.RowCount = 1 Then
    Result := True
  else
    Result := Value = '';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraStaticCTB_TABLAS.GetSqlWhere: String;
begin
  Result := ' AND TB_CODIGO <> ''0'' ' +
            {$IFDEF ART2}
            IIF(FShowBajas       , '', ' AND TB_FECHABAJA IS NULL ') +
            {$ELSE}
            IIF(FShowBajas       , '', ' AND TB_BAJA <> ''S'' ') +
            {$ENDIF}
            IIF(FClave     =  '' , '', ' AND TB_CLAVE = ' + SqlString(FClave, True) + ' ' ) +
            IIF(FEspecial1 =  '' , '', ' AND TB_ESPECIAL1 = ' + SqlString(FEspecial1, True) + ' ' ) +
            IIF(FEspecial2 =  '' , '', ' AND TB_ESPECIAL2 = ' + SqlString(FEspecial2, True) + ' ' );             
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraStaticCTB_TABLAS.IsBaja: Boolean;
begin
  {$IFDEF ART2}
  Result := inherited IsBaja;
  {$ELSE}
  Result := cmbDescripcion.Cells[FColBaja, cmbDescripcion.Row] = 'S';
  {$ENDIF}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraStaticCTB_TABLAS.LoadRow(ADataSet: TDataSet; ARow: Integer);
begin
  inherited;
  cmbDescripcion.Cells[FColClave,     ARow] := ADataSet.FieldByName( 'TB_CLAVE' ).AsString;
  cmbDescripcion.Cells[FColEspecial1, ARow] := ADataSet.FieldByName( 'TB_ESPECIAL1' ).AsString;
  cmbDescripcion.Cells[FColEspecial2, ARow] := ADataSet.FieldByName( 'TB_ESPECIAL2' ).AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraStaticCTB_TABLAS.SetClave(const Value: TCtbClave);
begin
  if FClave <> Value Then begin
    FClave := Value;
    if (cmbDescripcion.Row > -1) and (cmbDescripcion.Cells[FColClave, cmbDescripcion.Row] <> FClave) Then
      Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraStaticCTB_TABLAS.SetEspecial1(const Value: String);
begin
  if FEspecial1 <> Value Then begin
    FEspecial1 := Value;
    if (cmbDescripcion.Row > -1) and (cmbDescripcion.Cells[ FColEspecial1, cmbDescripcion.Row ] <> FEspecial1) Then
      Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraStaticCTB_TABLAS.SetEspecial2(const Value: String);
begin
  if FEspecial2 <> Value Then begin
    FEspecial2 := Value;
    if (cmbDescripcion.Row > -1) and (cmbDescripcion.Cells[ FColEspecial2, cmbDescripcion.Row ] <> FEspecial2) Then
      Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
{$IFDEF ART2}
function TfraStaticCTB_TABLAS.GetValue: TCtbCodigo;
begin
  FrameExit( nil );
  if cmbDescripcion.Row > FFixedRows-1 Then
    Result := cmbDescripcion.Cells[FColId, cmbDescripcion.Row ]
  else
    Result := '';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraStaticCTB_TABLAS.SetValue(const Value: TCtbCodigo);
var
  iRow : Integer;
begin
  if Value = '' Then
    Clear
  else begin
    CheckData;
    iRow := cmbDescripcion.FindRow( FFixedRows, [FColId], [Value] );

    if iRow > FFixedRows-1 Then begin
      cmbDescripcion.Row := iRow;
      LoadValues( False );
    end else
      Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraStaticCTB_TABLAS.GetKeyValue: Variant;
begin
  Result := GetValue;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraStaticCTB_TABLAS.SetKeyValue(Value: Variant);
begin
  if VarIsNull(Value) Then
    Clear
  else
    SetValue(Value);
end;
{$ENDIF}
{----------------------------------------------------------------------------------------------------------------------}
function TfraStaticCTB_TABLAS.GetStaticColCount: Integer;
begin
  Result := FColEspecial2 + 1;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraStaticCTB_TABLAS.cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment;  var Background: TColor; Highlight: Boolean);
begin
  if (ARow > 0) and (cmbDescripcion.Cells[FColBaja, ARow] = 'S') Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraStaticCTB_TABLAS.GetEspecial1: String;
begin
  Result := cmbDescripcion.Cells[FColEspecial1, cmbDescripcion.Row];
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraStaticCTB_TABLAS.GetEspecial2: String;
begin
  Result := cmbDescripcion.Cells[FColEspecial2, cmbDescripcion.Row];
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
