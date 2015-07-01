{ Martín Lefevbre }

unit unStaticGridA;

interface
Uses
  Windows, Classes, Graphics, StaticGrid, Grids;

Type
  TStaticGridA = class (TStaticGrid)
  private
    fAlignList: TStringList;
    DrawBitmap: TBitmap;
    UserCount: Integer;
    procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer; const Text: string; Alignment: TAlignment);
    function GetAlignRow(indice: integer): TAlignment;
    procedure SetAlignRow(indice: integer; const Value: TAlignment);
    function AlignToStr(Value: TAlignment): string;
    function StrToAlign(Value: string): TAlignment;
  protected
    procedure DrawCell(ACol, ARow: Integer; Rect: TRect; State: TGridDrawState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property AlignRow[indice: integer]: TAlignment read GetAlignRow write SetAlignRow;
  end;

procedure Register;

implementation
uses
  Math;
{ TStaticGridA }

procedure Register;
begin
  RegisterComponents('pruebas', [TStaticGrid]);
end;

constructor TStaticGridA.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fAlignList := TStringList.Create;
end;

destructor TStaticGridA.Destroy;
begin
  fAlignList.Free;
  inherited Destroy;
end;

function TStaticGridA.GetAlignRow(indice: integer): TAlignment;
var
  Valor: TAlignment;
begin
  try
    Valor := StrToAlign(fAlignList[indice]);
  except
    Valor := taLeftJustify;
  end;
  Result := Valor;
end;
      
procedure TStaticGridA.DrawCell(ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  WriteText(Canvas, CellRect(ACol, ARow), 2, 2, Cells[ACol,ARow], AlignRow[ARow]);
end;

procedure TStaticGridA.SetAlignRow(indice: integer; const Value: TAlignment);
begin
  fAlignList[indice] := AlignToStr(Value);
end;

procedure TStaticGridA.WriteText(ACanvas: TCanvas; ARect: TRect; DX,
  DY: Integer; const Text: string; Alignment: TAlignment);
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );
  RTL: array [Boolean] of Integer = (0, DT_RTLREADING);
var
  B, R: TRect;
  Hold, Left: Integer;
  I: TColorRef;
begin
  I := ColorToRGB(ACanvas.Brush.Color);
  if GetNearestColor(ACanvas.Handle, I) = I then
  begin                       { Use ExtTextOut for solid colors }
    case Alignment of
      taLeftJustify:
        Left := ARect.Left + DX;
      taRightJustify:
        Left := ARect.Right - ACanvas.TextWidth(Text) - 3;
    else { taCenter }
      Left := ARect.Left + (ARect.Right - ARect.Left) shr 1
        - (ACanvas.TextWidth(Text) shr 1);
    end;
    ACanvas.TextRect(ARect, Left, ARect.Top + DY, Text);
  end
  else begin                  { Use FillRect and Drawtext for dithered colors }
    DrawBitmap.Canvas.Lock;
    try
      with DrawBitmap, ARect do { Use offscreen bitmap to eliminate flicker and }
      begin                     { brush origin tics in painting / scrolling.    }
        Width := Max(Width, Right - Left);
        Height := Max(Height, Bottom - Top);
        R := Rect(DX, DY, Right - Left - 1, Bottom - Top - 1);
        B := Rect(0, 0, Right - Left, Bottom - Top);
      end;
      with DrawBitmap.Canvas do
      begin
        Font := ACanvas.Font;
        Font.Color := ACanvas.Font.Color;
        Brush := ACanvas.Brush;
        Brush.Style := bsSolid;
        FillRect(B);
        SetBkMode(Handle, TRANSPARENT);
        DrawText(Handle, PChar(Text), Length(Text), R,
          AlignFlags[Alignment]);
      end;
      ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B);
    finally
      DrawBitmap.Canvas.Unlock;
    end;
  end;
end;

function TStaticGridA.AlignToStr(Value: TAlignment): string;
begin
  if Value = taCenter then
    Result := 'centro'
  else if Value = taRightJustify then
    Result := 'der'
  else //taLeftJustify
    Result := 'izq';

end;

function TStaticGridA.StrToAlign(Value: string): TAlignment;
begin
  if Value = 'centro' then
    Result := taCenter
  else if Value = 'der' then
    Result := taRightJustify
  else //'izq'
    Result := taLeftJustify;
end;

end.
