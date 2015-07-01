unit unfraCuentaBancariaRemesa;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   31-10-2003
 ULTIMA MODIFICACION: 03-11-2003
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unArtFrame, ComboEditor, ComboGrid, StdCtrls, Mask, PatternEdit,
  unArt, Db;

type
  TfraCuentaBancariaRemesa = class(TArtFrame)
    edCodigo: TPatternEdit;
    cmbDescripcion: TComboGrid;
    procedure cmbDescripcionGetCellParams(Sender: TObject; ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
    procedure cmbDescripcionDropDown(Sender: TObject);
    procedure cmbDescripcionCloseUp(Sender: TObject);
    procedure cmbDescripcionScroll(Sender: TObject; ARow: Integer; var CanSelect: Boolean);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FrameExit(Sender: TObject);
  private
    fRangoDeposito: integer;
    fFechaDeposito : TDateTime;
    fMostrarRemesasSinImputar: Boolean;
    FShowBajas: boolean;
    function GetValue: TTableID;
    procedure SetValue(const Value: TTableID);
    procedure SetFechaDeposito(const Value: TDateTime);
    procedure SetRangoDeposito(const Value: integer);
    procedure SetShowBajas(const Value: boolean);
    function GetMontoSinImputar: Extended;
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
    procedure Actualizar;
    property Value                   : TTableID     read GetValue                  write SetValue;
    property AsString                : string       read GetAsString;
    property IsSelected              : boolean      read GetIsSelected;
    property IsEmpty                 : boolean      read GetIsEmpty;
    property FechaDeposito           : TDateTime    read fFechaDeposito            write SetFechaDeposito;
    property RangoDeposito           : integer      read fRangoDeposito            write SetRangoDeposito;
    property MostrarRemesasSinImputar: Boolean      read fMostrarRemesasSinImputar write fMostrarRemesasSinImputar;
    property MontoSinImputar         : Extended     read GetMontoSinImputar;
    property ShowBajas               : boolean      read FShowBajas write SetShowBajas;
  end;

Const
  COL_CODIGO          : integer = 0;
  COL_CODIGOBANCO     : integer = 1;
  COL_NOMBREBANCO     : integer = 2;
  COL_CUENTA          : integer = 3;
  COL_MONTOSINIMPUTAR : integer = 4;
  COL_FECHAIMPUTACION : integer = 5;
  COL_BAJA            : integer = 6;

  FIXED_ROWS = 1;

implementation

{$R *.DFM}
Uses
  unDmPrincipal, SDEngine, General, unCustomDataModule, AnsiSql;

constructor TfraCuentaBancariaRemesa.Create(AOwner: TComponent);
begin
  inherited;
  fFechaDeposito            := 0;
  fRangoDeposito            := 7;
  fMostrarRemesasSinImputar := True;
  LoadGrid;
  Clear;
end;

function TfraCuentaBancariaRemesa.GetSql: String;
var
  sSql: string;
begin
  sSql := 'SELECT RM_ID, BA_CODIGO, BA_NOMBRE, CB_NUMERO, RM_MONTOSINIMPUTAR, RM_FECHA, CB_FECHABAJA ' +
            'FROM RRM_REMESA, ZCB_CUENTABANCARIA, ZBA_BANCO ' +
           'WHERE RM_IDCUENTABANCARIA = CB_ID ' +
             'AND CB_IDBANCO = BA_ID ' +
             'AND RM_FECHABAJA IS NULL ';

  if fMostrarRemesasSinImputar then
    sSql := sSql + 'AND RM_MONTOSINIMPUTAR > 0 ';

  if FechaDeposito <> 0 then
    sSql := sSql + 'AND RM_FECHA BETWEEN TO_DATE(''' + DateToStr(FechaDeposito) + ''',''dd/mm/yyyy'') AND TO_DATE(''' + DateToStr(FechaDeposito + RangoDeposito) + ''',''dd/mm/yyyy'') ';

  if not FShowBajas Then
    sSql := sSql + 'AND CB_FECHABAJA IS NULL ';

  Result := sSql + 'ORDER BY RM_FECHA DESC, RM_MONTOSINIMPUTAR ';
end;

function TfraCuentaBancariaRemesa.IsBaja ( ARow: integer ): boolean;
begin
  Result := (ARow > 0) and (cmbDescripcion.Cells[COL_BAJA, ARow] <> '');
end;

function TfraCuentaBancariaRemesa.GetAsString: string;
begin
  Result := IntToStr(GetValue);
end;

function TfraCuentaBancariaRemesa.GetIsEmpty: boolean;
begin
  if cmbDescripcion.RowCount = FIXED_ROWS Then
    Result := True
  else
    Result := GetValue = 0;
end;

function TfraCuentaBancariaRemesa.GetIsSelected: boolean;
begin
  Result := not GetIsEmpty;
end;

function TfraCuentaBancariaRemesa.GetValue: TTableID;
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

procedure TfraCuentaBancariaRemesa.SetValue(const Value: TTableID);
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

procedure TfraCuentaBancariaRemesa.LoadGrid;
Var
  iRows   : Integer;
  sdqData : TSDQuery;
begin
  sdqData := GetQuery( GetSql, [qoUniDirectional] );
  Try
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

procedure TfraCuentaBancariaRemesa.LoadRow(ADataSet : TDataSet; ARow : Integer);
begin
  cmbDescripcion.Cells[ COL_CODIGO, ARow ]          := ADataSet.FieldByName( 'RM_ID' ).AsString;
  cmbDescripcion.Cells[ COL_CODIGOBANCO, ARow ]     := ADataSet.FieldByName( 'BA_CODIGO' ).AsString;
  cmbDescripcion.Cells[ COL_NOMBREBANCO, ARow ]     := ADataSet.FieldByName( 'BA_NOMBRE' ).AsString;
  cmbDescripcion.Cells[ COL_CUENTA, ARow ]          := ADataSet.FieldByName( 'CB_NUMERO' ).AsString;
  cmbDescripcion.Cells[ COL_MONTOSINIMPUTAR, ARow ] := Trim(Format('%12.2f', [ADataSet.FieldByName( 'RM_MONTOSINIMPUTAR' ).AsFloat]));
  cmbDescripcion.Cells[ COL_FECHAIMPUTACION, ARow ] := ADataSet.FieldByName( 'RM_FECHA' ).AsString;
  cmbDescripcion.Cells[ COL_BAJA, ARow ]            := ADataSet.FieldByName( 'CB_FECHABAJA' ).AsString;
end;

procedure TfraCuentaBancariaRemesa.cmbDescripcionGetCellParams(Sender: TObject;
  ACol, ARow: Integer; AFont: TFont; var AAlignment: TAlignment; var Background: TColor; Highlight: Boolean);
begin
  if IsBaja( ARow ) Then
    AFont.Color := clRed;
end;

procedure TfraCuentaBancariaRemesa.cmbDescripcionCloseUp(Sender: TObject);
begin
  if cmbDescripcion.Text = '' then
    Clear
  else
    LoadValues( cmbDescripcion.Row, True );
end;

procedure TfraCuentaBancariaRemesa.LoadValues( ARow: integer; ModifColor: boolean = False );
begin
  if ARow > (FIXED_ROWS-1) Then
  begin
    edCodigo.Text       := cmbDescripcion.Cells[ COL_CODIGO, ARow ];
    cmbDescripcion.Text := cmbDescripcion.Cells[ COL_CUENTA, ARow ];

    if (IsBaja(cmbDescripcion.Row) and ModifColor) then
      SetColor( clRed )
    else
      SetColor( clBlack );

    Change;
  end
  else
    Clear;

end;

procedure TfraCuentaBancariaRemesa.cmbDescripcionScroll(Sender: TObject; ARow: Integer; var CanSelect: Boolean);
begin
  if ARow > FIXED_ROWS-1 Then
  begin
    edCodigo.Text       := cmbDescripcion.Cells[ COL_CODIGO, ARow ];
    cmbDescripcion.Text := cmbDescripcion.Cells[ COL_CUENTA, ARow ];
    Change;    
  end
  else
  begin
    edCodigo.Text       := '';
    cmbDescripcion.Text := '';
  end
end;

procedure TfraCuentaBancariaRemesa.FrameExit(Sender: TObject);
begin
  if Trim(edCodigo.Text) <> '' then
    SetValue( StrToInt( edCodigo.Text ) )
  else
    Clear;
end;

procedure TfraCuentaBancariaRemesa.Clear;
begin
  cmbDescripcion.Row := 0;
  edCodigo.Text := '';
  cmbDescripcion.Text := '';
  SetColor ( clBlack );
end;

procedure TfraCuentaBancariaRemesa.cmbDescripcionDropDown(Sender: TObject);
begin
  SetColor( clBlack );
end;

procedure TfraCuentaBancariaRemesa.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if Trim(edCodigo.Text) <> '' then
      SetValue( StrToInt( edCodigo.Text ) )
    else
      Clear;
end;

procedure TfraCuentaBancariaRemesa.edCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and (ssAlt in Shift) then
    cmbDescripcion.DropDown ;
end;

procedure TfraCuentaBancariaRemesa.SetColor ( AColor: TColor );
begin
  edCodigo.Font.Color := AColor;
  cmbDescripcion.Font.Color := AColor;
end;

procedure TfraCuentaBancariaRemesa.Actualizar;
begin
  cmbDescripcion.RowCount := 0;
  LoadGrid;
  Clear;
end;

procedure TfraCuentaBancariaRemesa.SetFechaDeposito(const Value: TDateTime);
begin
  if fFechaDeposito <> Value then
    begin
      fFechaDeposito := Value;
      Actualizar;
    end;
end;

procedure TfraCuentaBancariaRemesa.SetRangoDeposito(const Value: integer);
begin
  if fRangoDeposito <> Value then
  begin
    fRangoDeposito := Value;
    Actualizar;
  end;
end;

procedure TfraCuentaBancariaRemesa.SetShowBajas(const Value: boolean);
begin
  if FShowBajas <> Value Then
  begin
    FShowBajas := Value;
    LoadGrid;
  end;
end;

function TfraCuentaBancariaRemesa.GetMontoSinImputar: Extended;
begin
  if IsSelected then
    Result := StrToFloat(cmbDescripcion.Cells[ COL_MONTOSINIMPUTAR, cmbDescripcion.Row ])
  else
    Result := 0;
end;

end.
