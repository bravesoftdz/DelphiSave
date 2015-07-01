{$I-,N+}
unit XLFile;

interface

uses SysUtils, Graphics;

Const
  {LenData}
  LEN_BOF_BIFF5    = 6;
  LEN_EOF_BIFF5    = 0;
  LEN_DIM_BIFF5    = 10;
  LEN_RECORDHEADER = 4;

  {Tipos de Records para el BIFFn}
  RT5_CELL_EMPTY  = 1;
  RT5_CELL_INT    = 2;                       // Celdas con valores Enteros
  RT5_CELL_DOUBLE = 3;                       // Celdas con valores Double
  RT5_CELL_LABEL  = 4;                       // Celdas con valores String
  RT5_CELL_BOOL   = 5;                       // Celdas con valores Boolean

  {Document types}
  DOCTYPE_XLS = $0010;
  DOCTYPE_XLC = $0020;
  DOCTYPE_XLM = $0040;
  DOCTYPE_XLW = $0100;

  MAX_DIM     = 65535;


  FORMATCOUNT = $1F;
  FORMAT = $1E;

Type
//  LabelString = array[0..2048] of Char;
  LabelString = string[255];
  rgbAttrib   =  Array[0..2] Of Byte;
  TCellCoord  = Word;

  TCellFormat = (cfGeneral, cfInteger, cfFloat1, cfFloat2, cfFloat3,
                 cfCurrency1, cfCurrency2, cfCurrency3,
                 cfCurrency4, cfPercent1, cfPercent2, cfCientific1,
                 cfDDMMYYYY, cfDDMMMYY, cfDDMMM, cfMMMYY,
                 cfHMMampm,cfHMMSSampm, cfHMM, aFormatHMMSS,
                 cfDDMMYYYYHMM, cfCientific2, cfMMSS, cfTo);

  TCellAttribute  = (caHidden, caLocked, caShaded,
                     caBottomBorder, caTopBorder, caRightBorder, caLeftBorder,
                     caFont1, caFont2, caFont3, caFont4,
                     caLeft, caCenter, caRight, caFill);

  TCellAttributes = set of TCellAttribute;

  TCellType       = (ctBlank, ctInteger, ctDouble, ctLabel, ctBoolean);
//  TCellType      = (ctString, ctInteger, ctDouble, ctBoolean, ctNull);

  TXLFile = object
  private
  protected
     ExcelFile : File;
     procedure Internal_WriteBOF;
     procedure Internal_WriteEOF;
     procedure WriteFormats;
     procedure WriteRecordHeader(ALen, AType : Integer);
     procedure SetAttributes(ARow, ACol: TCellCoord; AAttributes : TCellAttributes = []; AFormat: TCellFormat = cfGeneral);
     function GetRgbAttrib(AAttributes : TCellAttributes; AFormat: TCellFormat): rgbAttrib;
  public
     procedure SetDimensions(AFirstRow : Word = 1; ALastRow : Word = MAX_DIM; AFirstCol : Word = 1; ALastCol : Word = MAX_DIM);
     procedure WriteCell(ARow, ACol: TCellCoord; AData: Variant; ACellType : TCellType ; AAttributes : TCellAttributes = []; ACellFormat: TCellFormat = cfGeneral); overload;
     procedure WriteCell(ARow, ACol: TCellCoord; AData: LabelString; AAttributes : TCellAttributes = []; ACellFormat: TCellFormat = cfGeneral); overload;
     procedure WriteCell(ARow, ACol: TCellCoord; AData: Word; AAttributes : TCellAttributes = []; ACellFormat: TCellFormat = cfGeneral); overload;
     procedure WriteCell(ARow, ACol: TCellCoord; AData: Double;  AAttributes : TCellAttributes = []; ACellFormat: TCellFormat = cfGeneral); overload;
     procedure WriteCell(ARow, ACol: TCellCoord; AData: Boolean; AAttributes : TCellAttributes = []; ACellFormat: TCellFormat = cfGeneral); overload;
     procedure ClearCell(ARow, ACol: TCellCoord; AAttributes : TCellAttributes = []);
     procedure SetColWidth(AFirstCol, ALastCol: Byte; AWidth: Word); overload;
     procedure SetColWidth(ACol: Byte; AWidth: Word); overload;
     procedure WriteCellNote(ARow, ACol: TCellCoord; AText: LabelString);
     procedure WriteFont(AHeight: Word; AFontStyle : TFontStyles; AFontName : LabelString); overload;
     procedure WriteFont(AFont : TFont); overload;
     procedure SetRowAttributes(ARow, FirstDefCol, ALastDefCol : TCellCoord; ARowHeight : Word; ADefAttibutes : Boolean = True; AAttributes : TCellAttributes = []; AFormat: TCellFormat = cfGeneral; AOffset : Word = 0);
     procedure SetDefaultRowHeight(AHeight : Word);

     constructor Create(AFileName : TFileName);
     destructor Destroy;
  end;


implementation

{$IFDEF VER140}
Uses
  Variants;
{$ENDIF}
{$IFDEF VER150}
Uses
  Variants;
{$ENDIF}

{----------------------------------------------------------------------------------------------------------------------}
{ TXLFile }
{----------------------------------------------------------------------------------------------------------------------}
constructor TXLFile.Create(AFileName: TFileName);
begin
  Assign( ExcelFile, AFileName);
  Rewrite( ExcelFile, 1 );
  Internal_WriteBOF;
  WriteFormats;
end;
{----------------------------------------------------------------------------------------------------------------------}
destructor TXLFile.Destroy;
begin
  Internal_WriteEOF;
  Close(ExcelFile);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.Internal_WriteBOF;
var
  aBuf : array[0..1] of Word;
begin
  aBuf[0] := 2;
  aBuf[1] := 10;
  WriteRecordHeader(4, 9);
  BlockWrite(Excelfile, aBuf, SizeOf(aBuf));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.Internal_WriteEOF;
begin
  WriteRecordHeader(0, $000a);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.SetDimensions(AFirstRow : Word = 1; ALastRow : Word = MAX_DIM; AFirstCol : Word = 1; ALastCol : Word = MAX_DIM);
var aBuf : array[0..3] of word;
begin
  aBuf[0] := AFirstRow ;
  aBuf[1] := ALastRow  ;
  aBuf[2] := AFirstCol ;
  aBuf[3] := ALastCol ;
  WriteRecordHeader( 8, $0000);
  Blockwrite(Excelfile, aBuf, SizeOf(aBuf));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteRecordHeader(ALen, AType : Integer);
var
  aBuf : array[0..1] of Word;
begin
  aBuf[0] := AType;  // Define el Tipo de Registro que Guarda
  aBuf[1] := ALen;   // Define el Largo del Registro
  BlockWrite(Excelfile, aBuf, LEN_RECORDHEADER);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TXLFile.GetRgbAttrib(AAttributes: TCellAttributes; AFormat: TCellFormat): rgbAttrib;
begin
   Result[0] := 0;
//   Result[1] := 0;
   Result[1] := Integer(AFormat);
   Result[2] := 0;

{
   if caDate in AAttributes then
      Result[0] := Result[0] + 2;

   if caDateTime in AAttributes then
      Result[0] := Result[0] + 1 + 2;

   if caTime in AAttributes then //byte 0 bit 6:
      Result[0] := Result[0] + 69;              }



   if caFont1 in AAttributes then
//      Result[1] := Result[1]
   else if caFont2 in AAttributes then
      Result[1] := Result[1] + 64
   else if caFont3 in AAttributes then
      Result[1] := Result[1] + 128
   else if caFont4 in AAttributes then
      Result[1] := Result[1] + 192;


   if caShaded in AAttributes then //byte 2 bit 7:
      Result[2] := Result[2] + 128;

   if caBottomBorder in AAttributes then //byte 2 bit 6
      Result[2] := Result[2] + 64 ;

   if caTopBorder in AAttributes then //byte 2 bit 5
      Result[2] := Result[2] + 32;

   if caRightBorder in AAttributes then //byte 2 bit 4
      Result[2] := Result[2] + 16;

   if caLeftBorder in AAttributes then //byte 2 bit 3
      Result[2] := Result[2] + 8;

   if caLeft in AAttributes then //byte 2 bit 1
      Result[2] := Result[2] + 1
   else if caCenter in AAttributes then //byte 2 bit 1
      Result[2] := Result[2] + 2
   else if caRight in AAttributes then //byte 2, bit 0 dan bit 1
      Result[2] := Result[2] + 3;

   if caFill in AAttributes then //byte 2, bit 0
       Result[2] := Result[2] + 4;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.SetAttributes(ARow, ACol: TCellCoord; AAttributes: TCellAttributes; AFormat: TCellFormat);
Var
  aBuf       : array[0..1] of TCellCoord;
  AAttribute : rgbAttrib;
begin
  aBuf[0]    := ARow;
  aBuf[1]    := ACol;
  AAttribute := GetRgbAttrib(AAttributes, AFormat);
  Blockwrite(Excelfile, aBuf, SizeOf(aBuf));
  BlockWrite(Excelfile, AAttribute, SizeOf(AAttribute));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.ClearCell(ARow, ACol: TCellCoord; AAttributes: TCellAttributes);
begin
     WriteRecordHeader( 7, RT5_CELL_EMPTY);
     SetAttributes(ARow, ACol, AAttributes);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteCell(ARow, ACol: TCellCoord; AData: Variant; ACellType: TCellType; AAttributes: TCellAttributes; ACellFormat: TCellFormat);
begin
     if VarIsNull(AData) Then
        ACellType := ctBlank;

     Case ACellType of
          ctBlank:    ClearCell(ARow, ACol, AAttributes);
          ctInteger:  WriteCell(ARow, ACol, Integer(AData), AAttributes, ACellFormat);
          ctDouble:   WriteCell(ARow, ACol, Double (AData), AAttributes, ACellFormat);
          ctLabel:    WriteCell(ARow, ACol, String (AData), AAttributes, ACellFormat);
          ctBoolean:  WriteCell(ARow, ACol, Boolean(AData), AAttributes, ACellFormat);
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteCell(ARow, ACol : TCellCoord; AData: Word; AAttributes: TCellAttributes; ACellFormat: TCellFormat);
begin
     WriteRecordHeader( 9, RT5_CELL_INT);
     SetAttributes(ARow, ACol, AAttributes, ACellFormat);
     BlockWrite(Excelfile, AData, 2);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteCell(ARow, ACol: TCellCoord; AData: LabelString; AAttributes: TCellAttributes; ACellFormat: TCellFormat);
Var
   ALen  : Byte;
//   AByte : Byte;
begin
   ALen := Length(AData);
   WriteRecordHeader( ALen + 8 , RT5_CELL_LABEL);
   SetAttributes(ARow, ACol, AAttributes, ACellFormat);
   BlockWrite(Excelfile, ALen, SizeOf(ALen));
//   BlockWrite(Excelfile, Pointer(AData)^, ALen);
   BlockWrite(Excelfile, Pointer(String(AData))^, ALen);
end;
{----------------------------------------------------------------------------------------------------------------------}
{
procedure TXLFile.WriteCell(ARow, ACol: TCellCoord; AData: String; AAttributes: TCellAttributes; ACellFormat: TCellFormat);
Var
   ALen  : Integer;
   AByte : Byte;
begin
   ALen := Length(AData);
   WriteRecordHeader( ALen + 8 , RT5_CELL_LABEL);
   SetAttributes(ARow, ACol, AAttributes);
   AByte := Length(AData); //ALen;
   BlockWrite(Excelfile, AByte, SizeOf(AByte));
   BlockWrite(Excelfile, Pointer(AData)^, ALen);
end;
}
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteCell(ARow, ACol: TCellCoord; AData: Boolean; AAttributes: TCellAttributes; ACellFormat: TCellFormat);
Var
   ABoolResult : Byte;
begin
    WriteRecordHeader( 9, RT5_CELL_BOOL );
    SetAttributes(ARow, ACol, AAttributes, ACellFormat);
    if AData then
       ABoolResult := 1
    else
       ABoolResult := 0;
    BlockWrite(Excelfile, ABoolResult, SizeOf(ABoolResult));
    ABoolResult := 0;
    BlockWrite(Excelfile, ABoolResult, SizeOf(ABoolResult));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteCell(ARow, ACol: TCellCoord; AData: Double; AAttributes: TCellAttributes; ACellFormat: TCellFormat);
begin
     WriteRecordHeader(15, RT5_CELL_DOUBLE);
     SetAttributes(ARow, ACol, AAttributes, ACellFormat);
     BlockWrite(Excelfile, AData, 8);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.SetColWidth(AFirstCol, ALastCol : Byte; AWidth: Word); // 256 puntos por Caracter
var
  aBuf : array[0..1] of Byte;
begin
  aBuf[0]    := AFirstCol;
  aBuf[1]    := ALastCol;
  WriteRecordHeader(4, $0024);
  BlockWrite(Excelfile, aBuf, 2);
  BlockWrite(Excelfile, Word(AWidth), 2);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.SetColWidth(ACol : Byte; AWidth: Word);
begin
  SetColWidth(ACol, ACol, AWidth);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteCellNote(ARow, ACol: TCellCoord; AText: LabelString);
Var
   aBuf : array[0..2] of Word;
begin
   aBuf[0] := ARow;
   aBuf[1] := ACol;
   aBuf[2] := Length(AText);

   WriteRecordHeader( aBuf[2] + 6 , 28);
   BlockWrite(Excelfile, aBuf, 6);
   BlockWrite(Excelfile, Pointer(String(AText))^, aBuf[2]);
//   BlockWrite(Excelfile, Pointer(AText)^, aBuf[2]);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteFont(AHeight: Word; AFontStyle: TFontStyles; AFontName: LabelString);
Var
   ALen   : Byte;
   AStyle : Array[0..1] Of Byte;
begin
   ALen := Length(AFontName);
   WriteRecordHeader( ALen + 5 , $0031 ); // 49
   BlockWrite(Excelfile, AHeight, 2);  // Guarda el Alto

   // Segun la documentación, es el segundo byte el que guarda el estilo
   // pero en la práctica es alreves
   AStyle[0] := 0;
   AStyle[1] := 0;
   if fsBold in AFontStyle Then
      AStyle[0] := AStyle[0] + 1;

   if fsItalic in AFontStyle Then
      AStyle[0] := AStyle[0] + 2;

   if fsUnderline in AFontStyle Then
      AStyle[0] := AStyle[0] + 4;

   if fsStrikeOut in AFontStyle Then
      AStyle[0] := AStyle[0] + 8;

   BlockWrite(Excelfile, AStyle, SizeOf(AStyle));  // Guarda el Estilo

   BlockWrite(Excelfile, ALen, 1);
   BlockWrite(Excelfile, Pointer(String(AFontName))^, ALen); // Guada el Nombre de la Fuente
{
// ** PRUEBA ** // Los archivos de excel, despues de la fuente guardan este registro
   WriteRecordHeader( 2 , $0045 );
   ALen := $FF;
   BlockWrite(Excelfile, ALen, 1);
   ALen := $7F;
   BlockWrite(Excelfile, ALen, 1);
}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteFont(AFont: TFont);
begin
     WriteFont(AFont.Size * 20, AFont.Style, AFont.Name);
end;
{----------------------------------------------------------------------------------------------------------------------}
{
procedure TXLFile.SetRowAttributes(ARow, FirstDefCol, ALastDefCol, ARowHeight: Word; ADefAttibutes: Boolean; AAttributes: TCellAttributes; AOffset: Word);
Var
   aBuf  : Array[0..4] Of Word;
   aByte : Byte;
   AAttribute : rgbAttrib;
begin
   WriteRecordHeader( 16, $0008 );
   aBuf[0] := ARow;
   aBuf[1] := FirstDefCol;
   aBuf[2] := ALastDefCol + 1;
   aBuf[3] := ARowHeight;
   aBuf[4] := 0;
   BlockWrite(Excelfile, aBuf, 10);

   if ADefAttibutes then
     aByte := 1
   else
     aByte := 0;

   AAttribute := GetRgbAttrib(AAttributes);

   BlockWrite(Excelfile, aByte, SizeOf(aByte));
   BlockWrite(Excelfile, AOffset, SizeOf(AOffset));
   BlockWrite(Excelfile, AAttribute, SizeOf(AAttribute));
end;
}
procedure TXLFile.SetRowAttributes(ARow, FirstDefCol, ALastDefCol : TCellCoord; ARowHeight: Word; ADefAttibutes: Boolean; AAttributes: TCellAttributes; AFormat: TCellFormat; AOffset: Word);
Var
   aBuf  : Array[0..4] Of Word;
   aByte : Byte;
   AAttribute : rgbAttrib;
begin
   WriteRecordHeader( 13, $0008 );
   aBuf[0] := ARow;
   aBuf[1] := FirstDefCol;
   aBuf[2] := ALastDefCol + 1;
   aBuf[3] := ARowHeight;
   aBuf[4] := 0;
   BlockWrite(Excelfile, aBuf, 10);

   if ADefAttibutes then
     aByte := 1
   else
     aByte := 0;

   AAttribute := GetRgbAttrib(AAttributes, AFormat);

   BlockWrite(Excelfile, aByte, SizeOf(aByte));
   BlockWrite(Excelfile, AOffset, SizeOf(AOffset));
//   BlockWrite(Excelfile, AAttribute, SizeOf(AAttribute));
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.SetDefaultRowHeight(AHeight: Word);
begin
   WriteRecordHeader( 2, $0025 );
   BlockWrite(Excelfile, AHeight, 2);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TXLFile.WriteFormats;
var
  i: Integer;
  wCount: Word;
  pBuff: LabelString;
  iLen: Byte;
const
  DEFAULT_FORMATS: array[0..23] of String = ( 'General', '0', '0.00', '#,##0', '#,##0.00', '#,##0\ "$";\-#,##0\ "$"',
                                              '#,##0\ "$";[Red]\-#,##0\ "$"', '#,##0.00\ "$";\-#,##0.00\ "$"',
                                              '#,##0.00\ "$";[Red]\-#,##0.00\ "$"', '0%', '0.00%', '0.00E+00',
                                              'dd/mm/yyyy', 'dd\-mmm\-yy', 'dd\-mmm', 'mmm\-yy', 'h:mm\ a.m./p.m.',
                                              'h:mm:ss\ a.m./p.m.', 'h:mm', 'h:mm:ss', 'dd/mm/yyyy\ h:mm', '##0.0E+0',
                                              'mm:ss', '@');
begin
  wCount := 21;
  WriteRecordHeader(2, FORMATCOUNT);
  BlockWrite(Excelfile, wCount, 2);

  for i := 0 to High(DEFAULT_FORMATS) do
  begin
    iLen := Length(DEFAULT_FORMATS[i]);
    pBuff := DEFAULT_FORMATS[i];
    WriteRecordHeader(iLen+1, FORMAT);
    BlockWrite(Excelfile, iLen, 1);
    BlockWrite(Excelfile, Pointer(String(pBuff))^, iLen);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
