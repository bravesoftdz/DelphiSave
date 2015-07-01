unit unfraCuentaBancariaOLD;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   25-08-2003
 ULTIMA MODIFICACION: 29-09-2003
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, PatternEdit, StdCtrls, Mask, ComboEditor, ComboGrid, unArt, Db;

type

  TfraCuentaBancaria = class(TArtFrame)
    cmbDescripcion: TComboGrid;
    edCodigo: TPatternEdit;
    procedure cmbDescripcionGetCellParams(Sender: TObject; ACol,
      ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor;
      Highlight: Boolean);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionScroll(Sender: TObject; ARow: Integer;
      var CanSelect: Boolean);
    procedure FrameExit(Sender: TObject);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FShowBajas: boolean;
    function GetValue: TTableID;
    procedure SetValue(const Value: TTableID);
    procedure SetShowBajas(const Value: boolean);
  protected
    function GetSql: String; virtual;
    procedure LoadGrid; virtual;
    procedure LoadRow(ADataSet : TDataSet; ARow : Integer); virtual;
    procedure LoadValues( ARow: integer; ModifColor: boolean = False );
    procedure SetColor ( AColor: TColor );
    function GetIsEmpty: boolean; virtual;
    function GetIsSelected: boolean;
    function GetAsString: string;
    function IsBaja ( ARow: integer ): boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    property Value      : TTableID     read GetValue     write SetValue;
    property AsString   : string       read GetAsString;
    property IsSelected : boolean      read GetIsSelected;
    property IsEmpty    : boolean      read GetIsEmpty;
    {By Fede:}
    property ShowBajas  : boolean      read FShowBajas write SetShowBajas;
  end;

Const
  COL_CODIGO: integer = 0;
  COL_CUENTA: integer = 1;
  COL_BAJA: integer = 4;
  FIXED_ROWS = 1;

implementation

{$R *.DFM}
Uses
  unDmPrincipal, SDEngine, General, unCustomDataModule;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfraCuentaBancaria.Create(AOwner: TComponent);
begin
  inherited;
  LoadGrid;
  Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCuentaBancaria.GetSql: String;
begin
  Result := 'SELECT CB_ID, CB_NUMERO, CB_SUCURSAL, BA_NOMBRE, CB_FECHABAJA ' +
              'FROM ZCB_CUENTABANCARIA, ZBA_BANCO ' +
            ' WHERE CB_IDBANCO = BA_ID ';

  if not FShowBajas Then
    Result := Result + 'AND CB_FECHABAJA IS NULL ';
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCuentaBancaria.IsBaja(ARow: integer): boolean;
begin
  Result := (ARow > 0) and (cmbDescripcion.Cells[COL_BAJA, ARow] <> '');
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCuentaBancaria.GetAsString: string;
begin
  Result := IntToStr(GetValue);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCuentaBancaria.GetIsEmpty: boolean;
begin
  if cmbDescripcion.RowCount = FIXED_ROWS Then
    Result := True
  else
    Result := GetValue = 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCuentaBancaria.GetIsSelected: boolean;
begin
  Result := not GetIsEmpty;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfraCuentaBancaria.GetValue: TTableID;
begin
  if cmbDescripcion.Row > (FIXED_ROWS-1) Then
  begin
    if cmbDescripcion.Cells[ COL_CODIGO, cmbDescripcion.Row ] <> '' then
      Result := StrToInt(cmbDescripcion.Cells[ COL_CODIGO, cmbDescripcion.Row ])
    else
      Result := 0;
  end
  else
    Result := 0;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.SetValue(const Value: TTableID);
var
  iRow : Integer;
begin
  if Value = 0 Then
    Clear
  else
  begin
    iRow := cmbDescripcion.FindRow( FIXED_ROWS, [COL_CODIGO], [IntToStr(Value)] );

    if iRow > (FIXED_ROWS-1) Then
    begin
      cmbDescripcion.Row := iRow;
      LoadValues ( iRow, True );
    end
    else
      Clear;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.LoadGrid;
Var
  iRows   : Integer;
  sdqData : TSDQuery;
begin
  sdqData := GetQuery( GetSql, [qoUniDirectional] );
  Try
    cmbDescripcion.ColCount := 4;
    cmbDescripcion.RowCount := FIXED_ROWS;
    iRows                   := FIXED_ROWS;
    while not sdqData.EOF do
    begin
      cmbDescripcion.RowCount := iRows + 1;
      LoadRow( sdqData, iRows );

      Inc( iRows );
      sdqData.Next;
    end;
  finally
    sdqData.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.LoadRow(ADataSet : TDataSet; ARow : Integer);
begin
  cmbDescripcion.Cells[ 0, ARow ] := ADataSet.FieldByName( 'CB_ID' ).AsString;
  cmbDescripcion.Cells[ 1, ARow ] := ADataSet.FieldByName( 'CB_NUMERO' ).AsString;
  cmbDescripcion.Cells[ 2, ARow ] := ADataSet.FieldByName( 'CB_SUCURSAL' ).AsString;
  cmbDescripcion.Cells[ 3, ARow ] := ADataSet.FieldByName( 'BA_NOMBRE' ).AsString;
  cmbDescripcion.Cells[ 4, ARow ] := ADataSet.FieldByName( 'CB_FECHABAJA' ).AsString;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.cmbDescripcionGetCellParams(Sender: TObject;
  ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if IsBaja( ARow ) Then
    AFont.Color := clRed;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.cmbDescripcionCloseUp(Sender: TObject);
begin
  LoadValues( cmbDescripcion.Row, True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.LoadValues( ARow: integer; ModifColor: boolean = False );
begin
  if ARow > (FIXED_ROWS-1) Then
  begin
    edCodigo.Text       := cmbDescripcion.Cells[ COL_CODIGO, ARow ];
    cmbDescripcion.Text := cmbDescripcion.Cells[ COL_CUENTA, ARow ];

    if (IsBaja(cmbDescripcion.Row) and ModifColor) then
      SetColor( clRed )
    else
      SetColor( clBlack );

  end
  else
    Clear;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.cmbDescripcionScroll(Sender: TObject; ARow: Integer; var CanSelect: Boolean);
begin
  edCodigo.Text       := cmbDescripcion.Cells[ COL_CODIGO, ARow ];
  cmbDescripcion.Text := cmbDescripcion.Cells[ COL_CUENTA, ARow ];
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.FrameExit(Sender: TObject);
begin
  if Trim(edCodigo.Text) <> '' then
    SetValue( StrToInt( edCodigo.Text ) )
  else
    Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.Clear;
begin
  cmbDescripcion.Row := 0;
  edCodigo.Text := '';
  cmbDescripcion.Text := '';
  SetColor ( clBlack );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.cmbDescripcionDropDown(Sender: TObject);
begin
  SetColor( clBlack );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if Trim(edCodigo.Text) <> '' then
      SetValue( StrToInt( edCodigo.Text ) )
    else
      Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.edCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbDescripcion.DropDown ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.SetColor ( AColor: TColor );
begin
  edCodigo.Font.Color := AColor;
  cmbDescripcion.Font.Color := AColor;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfraCuentaBancaria.SetShowBajas(const Value: boolean);
begin
  if FShowBajas <> Value Then
  begin
    FShowBajas := Value;
    LoadGrid;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

