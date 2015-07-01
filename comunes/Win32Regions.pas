unit Win32Regions;

interface

uses
  Windows, Graphics;

function RegionFromBitmap(ABitmap: TBitmap; ARegionColor: TColor; ATolerance: Integer = 0): HRGN;
function BitmapToRegion(ABitmap: TBitmap; ATransparentColor: TColor = clNone; ATolerance: Integer = 0): HRGN;

implementation

const
  ALLOC_UNIT = 100;

function MinByte(B1, B2: byte): byte;
begin
  if B1 < B2 then
    Result := B1
  else
    Result := B2;
end;

function RegionFromBitmap(ABitmap: TBitmap; ARegionColor: TColor; ATolerance: Integer = 0): HRGN;
var
  MemDC, DC: HDC;
  BitmapInfo: TBitmapInfo;
  hbm32, holdBmp, holdMemBmp: HBitmap;
  pbits32 : Pointer;
  bm32 : BITMAP;
  maxRects: DWORD;
  hData: HGLOBAL;
  pData: PRgnData;
  b, HR, HG, HB: Byte; //LR, LG, LB,
  p32: pByte;
  x, x0, y: integer;
  p: pLongInt;
  pr: PRect;
  h: HRGN;
begin
  Result := 0;
  if ABitmap <> nil then
  begin
    { Create a memory DC inside which we will scan the bitmap contents }
    MemDC := CreateCompatibleDC(0);
    if MemDC <> 0 then begin
     { Create a 32 bits depth bitmap and select it into the memory DC }
      with BitmapInfo.bmiHeader do  begin
        biSize          := sizeof(TBitmapInfoHeader);
        biWidth         := ABitmap.Width;
        biHeight        := ABitmap.Height;
        biPlanes        := 1;
        biBitCount      := 32;
        biCompression   := BI_RGB; { (0) uncompressed format }
        biSizeImage     := 0;
        biXPelsPerMeter := 0;
        biYPelsPerMeter := 0;
        biClrUsed       := 0;
        biClrImportant  := 0;
      end;
      hbm32 := CreateDIBSection(MemDC, BitmapInfo, DIB_RGB_COLORS, pbits32,0, 0);
      if hbm32 <> 0 then begin
        holdMemBmp := SelectObject(MemDC, hbm32);
        {
          Get how many bytes per row we have for the bitmap bits
          (rounded up to 32 bits)
        }
        GetObject(hbm32, SizeOf(bm32), @bm32);
        while (bm32.bmWidthBytes mod 4) > 0 do
           inc(bm32.bmWidthBytes);
        DC := CreateCompatibleDC(MemDC);

        { Copy the bitmap into the memory DC }
        holdBmp := SelectObject(DC, ABitmap.Handle);
        BitBlt(MemDC, 0, 0, ABitmap.Width, ABitmap.Height, DC, 0, 0, SRCCOPY);
        {
          For better performances, we will use the ExtCreateRegion() function
          to create the region. This function take a RGNDATA structure on
          entry. We will add rectangles by
          amount of ALLOC_UNIT number in this structure
        }
        maxRects := ALLOC_UNIT;
        hData := GlobalAlloc(GMEM_MOVEABLE, sizeof(TRgnDataHeader) + SizeOf(TRect) * maxRects);
        pData := GlobalLock(hData);
        pData^.rdh.dwSize := SizeOf(TRgnDataHeader);
        pData^.rdh.iType := RDH_RECTANGLES;
        pData^.rdh.nCount := 0;
        pData^.rdh.nRgnSize := 0;
        SetRect(pData^.rdh.rcBound, MaxInt, MaxInt, 0, 0);

        HR := GetRValue(ColorToRGB(ARegionColor));
        HG := GetGValue(ColorToRGB(ARegionColor));
        HB := GetBValue(ColorToRGB(ARegionColor));

        { Add the value of the ATolerance to the "transparent" pixel value }
        if ATolerance <> 0 Then
        begin
          HR := MinByte($FF, HR + ATolerance);
          HG := MinByte($FF, HG + ATolerance);
          HB := MinByte($FF, HB + ATolerance);
        end;

        {Scan each bitmap row from bottom to top, the bitmap is inverted vertically}
        p32 := bm32.bmBits;
        inc(PChar(p32), (bm32.bmHeight - 1) * bm32.bmWidthBytes);
        for y := 0 to ABitmap.Height-1 do begin
          { Scan each bitmap pixel from left to right }
          x := -1;
          while x+1 < ABitmap.Width do begin
            inc(x);
            { Search for a continuous range of "non transparent pixels" }
            x0 := x;
            p := PLongInt(p32);
            inc(PChar(p), x * SizeOf(LongInt));
            while x < ABitmap.Width do begin
              b := GetBValue(p^);                 // Changed from GetRValue(p^)
              if not (b = HR) then
                 break
              else begin
                b := GetGValue(p^);               // Left alone
                if not (b = HG) then
                   Break
                else begin
                  b := GetRValue(p^);             // Changed from GetBValue(p^)
                  if not (b = HB) then
                    break;
                end;
              end;
              inc(PChar(p), SizeOf(LongInt));
              inc(x);
            end;
            if x > x0 then begin
//            if x <= x0 then begin
              { Add the pixels (x0, y) to (x, y+1) as a new rectangle in the region }
              if pData^.rdh.nCount >= maxRects then begin
                GlobalUnlock(hData);
                inc(maxRects, ALLOC_UNIT);
                hData := GlobalReAlloc(hData, SizeOf(TRgnDataHeader) + SizeOf(TRect) * maxRects, GMEM_MOVEABLE);
                pData := GlobalLock(hData);
                Assert(pData <> NIL);
              end;
              pr := @pData^.Buffer[pData^.rdh.nCount * SizeOf(TRect)];
              SetRect(pr^, x0, y, x, y + 1);
              if x0 < pData^.rdh.rcBound.Left then
                pData^.rdh.rcBound.Left := x0;
              if y < pData^.rdh.rcBound.Top then
                pData^.rdh.rcBound.Top := y;
              if x > pData^.rdh.rcBound.Right then
                pData^.rdh.rcBound.Left := x;
              if y + 1 > pData^.rdh.rcBound.Bottom then
                pData^.rdh.rcBound.Bottom := y+1;
              inc(pData^.rdh.nCount);

              { On Windows98, ExtCreateRegion() may fail if the number of rectangles is too large (ie: > 4000). Therefore, we have to create the region by multiple steps              }
              if pData^.rdh.nCount = 2000 then begin
                h := ExtCreateRegion(NIL, SizeOf(TRgnDataHeader) +
                   (SizeOf(TRect) * maxRects), pData^);
                Assert(h <> 0);
                if Result <> 0 then begin
                  CombineRgn(Result, Result, h, RGN_OR);
                  DeleteObject(h);
                end else
                  Result := h;
                pData^.rdh.nCount := 0;
                SetRect(pData^.rdh.rcBound, MaxInt, MaxInt, 0, 0);
              end;
            end;
          end;
          {
            Go to next row (remember, the bitmap is inverted vertically)
            that is why we use DEC!
          }
          Dec(PChar(p32), bm32.bmWidthBytes);
        end;
        { Create or extend the region with the remaining rectangle }
        h := ExtCreateRegion(NIL, SizeOf(TRgnDataHeader) + (SizeOf(TRect) * maxRects), pData^);
        Assert(h <> 0);
        if Result <> 0 then begin
          CombineRgn(Result, Result, h, RGN_OR);
          DeleteObject(h);
        end else
          Result := h;
        { Clean up }
        GlobalFree(hData);
        SelectObject(DC, holdBmp);
        DeleteDC(DC);
        DeleteObject(SelectObject(MemDC, holdMemBmp));
      end;
    end;
    DeleteDC(MemDC);
  end;
end;

function BitmapToRegion( ABitmap: TBitmap; ATransparentColor: TColor = clNone; ATolerance: Integer = 0): HRGN;
var
  MemDC, DC: HDC;
  BitmapInfo: TBitmapInfo;
  hbm32, holdBmp, holdMemBmp: HBitmap;
  pbits32 : Pointer;
  bm32 : BITMAP;
  maxRects: DWORD;
  hData: HGLOBAL;
  pData: PRgnData;
  b, LR, LG, LB, HR, HG, HB: Byte;
  p32: pByte;
  x, x0, y: integer;
  p: pLongInt;
  pr: PRect;
  h: HRGN;
begin
  Result := 0;
  if ABitmap <> nil then
  begin
    { Create a memory DC inside which we will scan the bitmap contents }
    MemDC := CreateCompatibleDC(0);
    if MemDC <> 0 then
    begin
      if ATransparentColor = clNone Then
        ATransparentColor := ABitmap.Canvas.Pixels[0,0];

     { Create a 32 bits depth bitmap and select it into the memory DC }
      with BitmapInfo.bmiHeader do
      begin
        biSize          := sizeof(TBitmapInfoHeader);
        biWidth         := ABitmap.Width;
        biHeight        := ABitmap.Height;
        biPlanes        := 1;
        biBitCount      := 32;
        biCompression   := BI_RGB; { (0) uncompressed format }
        biSizeImage     := 0;
        biXPelsPerMeter := 0;
        biYPelsPerMeter := 0;
        biClrUsed       := 0;
        biClrImportant  := 0;
      end;
      hbm32 := CreateDIBSection(MemDC, BitmapInfo, DIB_RGB_COLORS, pbits32,0, 0);
      if hbm32 <> 0 then
      begin
        holdMemBmp := SelectObject(MemDC, hbm32);
        {
          Get how many bytes per row we have for the bitmap bits
          (rounded up to 32 bits)
        }
        GetObject(hbm32, SizeOf(bm32), @bm32);
        while (bm32.bmWidthBytes mod 4) > 0 do
          inc(bm32.bmWidthBytes);
        DC := CreateCompatibleDC(MemDC);
        { Copy the bitmap into the memory DC }
        holdBmp := SelectObject(DC, ABitmap.Handle);
        BitBlt(MemDC, 0, 0, ABitmap.Width, ABitmap.Height, DC, 0, 0, SRCCOPY);
        {
          For better performances, we will use the ExtCreateRegion() function
          to create the region. This function take a RGNDATA structure on
          entry. We will add rectangles by
          amount of ALLOC_UNIT number in this structure
        }
        maxRects := ALLOC_UNIT;
        hData := GlobalAlloc(GMEM_MOVEABLE, sizeof(TRgnDataHeader) +
           SizeOf(TRect) * maxRects);
        pData := GlobalLock(hData);
        pData^.rdh.dwSize := SizeOf(TRgnDataHeader);
        pData^.rdh.iType := RDH_RECTANGLES;
        pData^.rdh.nCount := 0;
        pData^.rdh.nRgnSize := 0;
        SetRect(pData^.rdh.rcBound, MaxInt, MaxInt, 0, 0);
        { Keep on hand highest and lowest values for the "transparent" pixel }
        LR := GetRValue(ColorToRGB(ATransparentColor));
        LG := GetGValue(ColorToRGB(ATransparentColor));
        LB := GetBValue(ColorToRGB(ATransparentColor));
        { Add the value of the ATolerance to the "transparent" pixel value }
        HR := MinByte($FF, LR + ATolerance);
        HG := MinByte($FF, LG + ATolerance);
        HB := MinByte($FF, LB + ATolerance);
        {
          Scan each bitmap row from bottom to top,
          the bitmap is inverted vertically
        }
        p32 := bm32.bmBits;
        inc(PChar(p32), (bm32.bmHeight - 1) * bm32.bmWidthBytes);
        for y := 0 to ABitmap.Height-1 do
        begin
          { Scan each bitmap pixel from left to right }
          x := -1;
          while x+1 < ABitmap.Width do
          begin
            inc(x);
            { Search for a continuous range of "non transparent pixels" }
            x0 := x;
            p := PLongInt(p32);
            inc(PChar(p), x * SizeOf(LongInt));
            while x < ABitmap.Width do
            begin
              b := GetBValue(p^);                 // Changed from GetRValue(p^)
              if (b >= LR) and (b <= HR) then
              begin
                b := GetGValue(p^);               // Left alone
                if (b >= LG) and (b <= HG) then
                begin
                  b := GetRValue(p^);             // Changed from GetBValue(p^)
                  if (b >= LB) and (b <= hb) then
                    { This pixel is "transparent" }
                    break;
                end;
              end;
              inc(PChar(p), SizeOf(LongInt));
              inc(x);
            end;
            if x > x0 then
            begin
              {
                Add the pixels (x0, y) to (x, y+1) as a new rectangle in
                the region
              }
              if pData^.rdh.nCount >= maxRects then
              begin
                GlobalUnlock(hData);
                inc(maxRects, ALLOC_UNIT);
                hData := GlobalReAlloc(hData, SizeOf(TRgnDataHeader) +
                   SizeOf(TRect) * maxRects, GMEM_MOVEABLE);
                pData := GlobalLock(hData);
                Assert(pData <> NIL);
              end;
              pr := @pData^.Buffer[pData^.rdh.nCount * SizeOf(TRect)];
              SetRect(pr^, x0, y, x, y+1);
              if x0 < pData^.rdh.rcBound.Left then
                pData^.rdh.rcBound.Left := x0;
              if y < pData^.rdh.rcBound.Top then
                pData^.rdh.rcBound.Top := y;
              if x > pData^.rdh.rcBound.Right then
                pData^.rdh.rcBound.Left := x;
              if y+1 > pData^.rdh.rcBound.Bottom then
                pData^.rdh.rcBound.Bottom := y+1;
              inc(pData^.rdh.nCount);
              {
               On Windows98, ExtCreateRegion() may fail if the number of
               rectangles is too large (ie: > 4000). Therefore, we have to
               create the region by multiple steps
              }
              if pData^.rdh.nCount = 2000 then
              begin
                h := ExtCreateRegion(NIL, SizeOf(TRgnDataHeader) +
                   (SizeOf(TRect) * maxRects), pData^);
                Assert(h <> 0);
                if Result <> 0 then
                begin
                  CombineRgn(Result, Result, h, RGN_OR);
                  DeleteObject(h);
                end else
                  Result := h;
                pData^.rdh.nCount := 0;
                SetRect(pData^.rdh.rcBound, MaxInt, MaxInt, 0, 0);
              end;
            end;
          end;
          {
            Go to next row (remember, the bitmap is inverted vertically)
            that is why we use DEC!
          }
          Dec(PChar(p32), bm32.bmWidthBytes);
        end;
        { Create or extend the region with the remaining rectangle }
        h := ExtCreateRegion(NIL, SizeOf(TRgnDataHeader) +
           (SizeOf(TRect) * maxRects), pData^);
        Assert(h <> 0);
        if Result <> 0 then
        begin
          CombineRgn(Result, Result, h, RGN_OR);
          DeleteObject(h);
        end else
          Result := h;
        { Clean up }
        GlobalFree(hData);
        SelectObject(DC, holdBmp);
        DeleteDC(DC);
        DeleteObject(SelectObject(MemDC, holdMemBmp));
      end;
    end;
    DeleteDC(MemDC);
  end;
end;

end.
