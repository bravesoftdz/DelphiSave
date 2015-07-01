unit unConvertHtmltoRtf;


interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, menus, extctrls, buttons, clipbrd, StrUtils ;

   // Global or Public procs
   function HTMLtoRTF(var sHTML : string) : string;
   function GetRed(HexString : string) : integer;
   function GetGreen(HexString : string) : integer;
   function GetBlue(HexString : string) : integer;
   function GetIndex(Table : array of string;Code : string) : integer;
   function GetFontSize(sSize : string) : string;
   function IsArrayEmpty(aArray : array of string) : boolean;
   function GetFileContents(sFileName : string) : string;

   function GetTableStructure(sHTML : string;var lPos : longint) : string;
   function GetColCount(sToken : string) : integer;
   function GetRowCount(sToken : string) : integer;
   function ArrayPos(ValBusc: string; Valores: array of string; StartPos: Integer = -1): Integer;

implementation

uses RTLConsts;

const
 x : array [0..12] of string = ('<B>', '</B>', '<I>', '</I>', '<U>', '</U>', '<TR>', '</TR>', '<TD>', '</TD>', '<BR>' , '</P>', '</FONT>');

var
 gsHyperLink : array of string;

function GetTableStructure(sHTML : string;var lPos : longint) : string;
var
    iBorder : integer;
    iCellPadding : integer;
    iCellSpacing : integer;
    iCellWidth : integer;
    iColCount : integer;
    iDummyEnd : integer;
    iDummyStart : integer;
    iRowCount : integer;
    iWidth : integer;
    lEnd : longint;
    lStart : longint;
    sDummy : string;
    sRTFTableStruct : string;
    sToken : string;
Label Completed;
begin 
   lStart := lPos; 
   lEnd := lPos; 
   lStart :=  posEx(('<' ), (sHTML ), (lEnd )); 
   if (lStart = 0 ) then 
      GoTo Completed; 
   lEnd :=  posEx(('>' ), (sHTML ), (lStart )); 
   sToken := uppercase( copy( sHTML , lStart , lEnd-lStart + 1)); 
     //'get the cell properties
     //'CELLSPACING
   iDummyStart :=  posEx(('CELLSPACING' ), (sToken ), (6 ));
   if (iDummyStart<>0 ) then begin
      iDummyEnd :=  posEx(' ', (sToken ), (iDummyStart + length( 'CELLSPACING') + 1 ));
      if (iDummyEnd = 0 ) then
         iDummyEnd :=  posEx(('>' ), (sToken ), (iDummyStart + length( 'CELLSPACING') + 1 ));
      iCellSpacing := StrtoInt(copy( sToken , iDummyStart + length( 'CELLSPACING') + 1 , iDummyEnd-( iDummyStart + length( 'CELLSPACING') + 1)));
   end;
     //'CELLPADDING
   iDummyStart :=  posEx(('CELLPADDING' ), (sToken ), (6 ));
   if (iDummyStart<>0 ) then begin
      iDummyEnd :=  posEx(' ', (sToken ), (iDummyStart + length( 'CELLPADDING') + 1 ));
      if (iDummyEnd = 0 ) then
         iDummyEnd :=  posEx(('>' ), (sToken ), (iDummyStart + length( 'CELLPADDING') + 1 ));
      iCellPadding := StrtoInt(copy( sToken , iDummyStart + length( 'CELLPADDING') + 1 , iDummyEnd-( iDummyStart + length( 'CELLPADDING') + 1)));
   end;
     //'WIDTH
   iDummyStart :=  posEx(('WIDTH' ), (sToken ), (6 ));
   if (iDummyStart<>0 ) then begin
      iDummyEnd :=  posEx(' ', (sToken ), (iDummyStart + length( 'WIDTH') + 1 ));
      if (iDummyEnd = 0 ) then
         iDummyEnd :=  posEx(('>' ), (sToken ), (iDummyStart + length( 'WIDTH') + 1 ));
      iWidth := StrToInt(StringReplace(StringReplace( copy( sToken , iDummyStart + length( 'WIDTH') + 1 , iDummyEnd-( iDummyStart + length( 'WIDTH') + 1)), '"' , '', [rfReplaceAll,rfIgnoreCase] ), '%' , '', [rfReplaceAll,rfIgnoreCase] )  );
   end;
     //'BORDER
   iDummyStart :=  posEx(('BORDER' ), (sToken ), (6 ));
   if (iDummyStart<>0 ) then begin
      iDummyEnd :=  posEx(' ', (sToken ), (iDummyStart + length( 'BORDER') + 1 ));
      if (iDummyEnd = 0 ) then
         iDummyEnd :=  posEx(('>' ), (sToken ), (iDummyStart + length( 'BORDER') + 1 ));
      iBorder := StrToInt(copy( sToken , iDummyStart + length( 'BORDER') + 1 , iDummyEnd-( iDummyStart + length( 'BORDER') + 1)));
   end;
   iDummyEnd :=  posEx(('</TABLE>' ), (sHTML ), (lPos ));
   if (iDummyEnd<>0 ) then
      iDummyEnd := iDummyEnd + length( '</TABLE>');
   sDummy := copy( sHTML , lPos , iDummyEnd-lPos);
     //'Get the row and col count for the table
   iRowCount := GetRowCount( sDummy);
   iColCount := Trunc(GetColCount( sDummy)/ iRowCount);
   sRTFTableStruct := '\trowd\trgaph108\trleft-108';
   sRTFTableStruct := sRTFTableStruct +  '\trbrdrt\brdrs\brdrw'  +  IntToStr(iBorder)  + ' ';
   sRTFTableStruct := sRTFTableStruct + '\trbrdrl\brdrs\brdrw' +  IntToStr(iBorder)    + ' ';
   sRTFTableStruct := sRTFTableStruct + '\trbrdrb\brdrs\brdrw' +  IntToStr(iBorder)    + ' ';
   sRTFTableStruct := sRTFTableStruct + '\trbrdrr\brdrs\brdrw' +  IntToStr(iBorder)    + ' ';
   iCellWidth := 2952;
   iDummyEnd := 0;
   for iDummyStart := 1  to iColCount  do begin
      iDummyEnd := iDummyEnd + iCellWidth;
      sRTFTableStruct := sRTFTableStruct + '\clbrdrt\brdrw15\brdrs\clbrdrl\brdrw15\brdrs\clbrdrb\brdrw15\brdrs\clbrdrr\brdrw15\brdrs';
      sRTFTableStruct := sRTFTableStruct +  '\cellx'  +  format( '%d', [(iDummyEnd )]);
   end;
   sRTFTableStruct := sRTFTableStruct + '\pard';
     //'    Do While sToken <> "</TABLE>"
     //'
     //'        lStart = inStr4(lEnd, sHTML, "<")
     //'        If lStart = 0 Then GoTo Completed
     //'        lEnd = inStr4(lStart, sHTML, ">")
     //'        sToken = UCase(Mid(sHTML, lStart, lEnd - lStart  +  1))
     //'
     //'        '\intbl\f0\fs24 1,1\cell 1,2\cell 1,3\cell\row
     //'        '\intbl 2,1\cell 2,2\cell 2,3\cell\row
     //'        '\intbl 3,1\cell 3,2\cell 3,3\cell\row
     //'
     //'    Loop
   iDummyEnd :=  posEx(('</TABLE>' ), (sHTML ), (lPos )); 
   if (iDummyEnd<>0 ) then
      iDummyEnd := iDummyEnd + length( '</TABLE>');
   lPos := iDummyEnd; 
   GetTableStructure := sRTFTableStruct; 
 Completed: 
end; 
 
function GetColCount(sToken : string) : integer;
var
    iCount : integer;
    iPos : integer;
    lStart : longint;
    sTemp : string;
begin
   lStart := 1;
   iCount := 0; 
   iPos :=  posEx(('<TD>' ), (sToken ), (lStart ));
   while (iPos<>0  ) do begin
      iCount := iCount + 1;
      lStart := iPos + length( '<TD>'); 
      iPos :=  posEx(('<TD>' ), (sToken ), (lStart )); 
   end;
   GetColCount := iCount;
end; 
 
function GetRowCount(sToken : string) : integer;
var
    iCount : integer;
    iPos : integer;
    lStart : longint;
    sTemp : string;
begin
   lStart := 1;
   iCount := 0;
   iPos :=  posEx(('<TR>' ), (sToken ), (lStart ));
   while (iPos<>0  ) do begin
      iCount := iCount + 1;
      lStart := iPos + length( '<TR>');
      iPos :=  posEx(('<TR>' ), (sToken ), (lStart ));
   end; 
   GetRowCount := iCount; 
end; 

function HTMLtoRTF(var sHTML : string) : string;
var
    bFaceFound : boolean;
    bFound : boolean;
    bUseDefaultFace : boolean;
    ColorCombNumber : integer;
    ColorTable : array of string;
    DefaultFace : string;
    FileContents : string;
    FontNumber : integer;
    FontTable : array of string;
    I : integer;
    lCurrentToken : longint;
    lEnd : longint;
    lHyperLink : integer;
    lLen : longint;
    lStart : longint;
    lTEnd : longint;
    lTStart : longint;
    PreviousFontFace : string;
    PreviousFontSize : integer;
    sColorTable : string;
    sFontTable : string;
    sHead : string;
    sImage : string;
    sRTF : string;
    sTemp : string;
    sText : string;
    sToken : string;
    ii : integer;
Label Completed, Error;
begin
   try
      lHyperLink := 0;
      setlength( gsHyperLink, 0   +  1 );
        //'Fix the HTML
      sHTML := StringReplace( sHTML , '<STRONG>' , '<B>', [rfReplaceAll,rfIgnoreCase] );
      sHTML := StringReplace( sHTML , '</STRONG>' , '</B>', [rfReplaceAll,rfIgnoreCase] );
      sHTML := StringReplace( sHTML , '<EM>' , '<I>', [rfReplaceAll,rfIgnoreCase] );
      sHTML := StringReplace( sHTML , '</EM>' , '</I>', [rfReplaceAll,rfIgnoreCase]  );
      sHTML := StringReplace( sHTML , #13#10 , '', [rfReplaceAll,rfIgnoreCase]  );
      sHTML := StringReplace( sHTML , '&nbsp;' , '\~', [rfReplaceAll,rfIgnoreCase]  );
        //'Initialize
      lLen := length( sHTML);
      lStart := 1;
      lEnd := 1;
        //'Add some default fonts
      setlength( FontTable, 1 + 1 );
      FontTable[ 0 ] := 'Times New Roman';
      FontNumber := FontNumber + 1;
      FontTable[ 1 ] := 'MS Sans Serif';
      FontNumber := FontNumber + 1; 
      PreviousFontSize := 24; //'12 'default font size
        //'Add some default color
      setlength( ColorTable, 3   +  1 ); 
      ColorTable[ 0 ] := '000000'; //'Black
      ColorCombNumber := ColorCombNumber + 1; 
      ColorTable[ 1 ] := 'ff0000'; //'Red
      ColorCombNumber := ColorCombNumber + 1;
      ColorTable[ 2 ] := '00ff00'; //'Green
      ColorCombNumber := ColorCombNumber + 1; 
      ColorTable[ 3 ] := '0000ff'; //'Blue
      ColorCombNumber := ColorCombNumber + 1; 
        //'Parse the HTML
      for lCurrentToken := 1  to lLen  do begin
           //'get the tag
         lStart :=  posEx(('<' ), (sHTML ), (lEnd ));
         if (lStart = 0 ) then
            GoTo Completed;
         lEnd :=  posEx(('>' ), (sHTML ), (lStart ));
         sToken := uppercase( copy( sHTML , lStart , lEnd-lStart + 1));
           //'    Debug.Print sToken
           //'Take action

         ii := ArrayPos(sToken, x, 0);
         case ii  of
            0  :
            begin
               sRTF := sRTF + '\b1';
            end;
            1  :
            begin
               sRTF := sRTF + '\b0';
            end;
            2  :
            begin
               sRTF := sRTF + '\I1';
            end;
            3  :
            begin
               sRTF := sRTF + '\I0';
            end;
            4  :
            begin
               sRTF := sRTF + '\ul1';
            end;
            5  :
            begin
               sRTF := sRTF + '\ul0';
            end;
            6  :
            begin
               sRTF := sRTF + '\intbl';
            end;
            7  :
            begin
               sRTF := sRTF + '\row';
            end;
            8  :
            begin
            end;
            9  :
            begin
               sRTF := sRTF + '\cell ';
            end;
            10:
            begin
               sRTF := sRTF + #13#10 + '\par ';
            end;
            11:
            begin
               sRTF := sRTF + #13#10 + '\par ';
            end;

            12  :
            begin
               bUseDefaultFace := True;
               sRTF := sRTF + '\plain\cf1';
            end;
            Else
            begin
               if (uppercase( copy( sToken , 1, 6))= '<TABLE' ) then begin
                  sRTF := sRTF + '\plain';
                  sRTF := sRTF + GetTableStructure( sHTML , lStart);
               end;
            end;
         end;
           //'Set font and color table
           //'Check for fonts
         if (posEx(('FONT' ), (uppercase( sToken)), (1 ))>0) And (copy( sToken , 2 , 1)<>'/' ) then begin
            bUseDefaultFace := False;
            lTStart :=  posEx(('FACE=' ), (uppercase( sToken)), (1 ));
            if (lTStart>0 ) then begin
               bFaceFound := True;
               lTEnd :=  posEx(('"'), (sToken ), (lTStart + length( 'FACE=') + 1 ));
               if (lTEnd = 0 ) then begin
                  lTEnd :=  posEx(' ', (sToken ), (lTStart + length( 'FACE=')));
               end;
               if (lTEnd = 0 ) then begin
                  lTEnd :=  posEx(('>' ), (sToken ), (lTStart + length( 'FACE=')));
               end;
               sTemp := StringReplace( copy( sToken , lTStart + length( 'FACE='), lTEnd-( lTStart + length( 'FACE='))), '"' , '', [rfReplaceAll,rfIgnoreCase] );
               if (sTemp<>'' ) then begin
                  bFaceFound := True;
                    //'Check if it is already in the table
                  if (Not IsArrayEmpty( FontTable)) then begin
                     for I := 0  to High( FontTable) do begin
                        if (sTemp = FontTable[I]) then begin
                           bFound := True;
                           break;
                        end;
                     end;
                  end
                  else begin
                     bFound := False; 
                  end; 
                    //'If not found add it
                  if (bFound = False ) then begin 
                     setlength( FontTable, FontNumber   +  1 ); 
                     FontTable[ FontNumber ] := sTemp;
                     FontNumber := FontNumber + 1;
                     PreviousFontFace := sTemp; 
                     if (DefaultFace = '' ) then
                        DefaultFace := sTemp;
                  end;
                  sRTF := sRTF + '\f' + InttoStr(GetIndex( FontTable , sTemp));
                  sTemp := '';
                  bFound := False; 
               end; 
            end 
            else begin 
               bFaceFound := False; 
            end;
            lTStart :=  posEx(('SIZE=' ), (uppercase( sToken)), (1 ));
            if (lTStart>0 ) then begin 
               lTEnd :=  posEx(' ', (sToken ), (lTStart + length( 'SIZE='))); 
               if (lTEnd = 0 ) then begin 
                  lTEnd :=  posEx(('>' ), (sToken ), (lTStart + length( 'SIZE=')));
               end;
               sTemp := StringReplace( copy( sToken , lTStart + length( 'SIZE='), lTEnd-( lTStart + length( 'SIZE='))), '"' , '', [rfReplaceAll,rfIgnoreCase] );
               if (sTemp<>'' ) then begin
                  sTemp := GetFontSize( sTemp); 
                  PreviousFontSize := StrToInt(sTemp);
                  sTemp := ''; 
               end; 
               bFound := False; 
            end; 
              //'Check for colors
            lTStart :=  posEx(('COLOR=' ), (uppercase( sToken)), (1 ));
            if (lTStart>0 ) then begin
               lTEnd :=  posEx(' ', (sToken ), (lTStart + length( 'COLOR=')));
               if (lTEnd = 0 ) then begin
                  lTEnd :=  posEx(('>' ), (sToken ), (lTStart + length( 'COLOR=')));
               end;
               sTemp := copy( sToken , lTStart + length( 'COLOR='), lTEnd-( lTStart + length( 'COLOR=')));
               sTemp := StringReplace( sTemp , '"' , '', [rfReplaceAll,rfIgnoreCase] );
               sTemp := StringReplace( sTemp , '#' , '', [rfReplaceAll,rfIgnoreCase] );
               if (sTemp<>'' ) then begin
                    //'Check if it is already in the table
                  if (Not IsArrayEmpty(ColorTable)) then begin
                     for I := 0  to High(ColorTable) do begin
                        if (sTemp = ColorTable[I]) then begin
                           bFound := True;
                           break;
                        end; 
                     end; 
                  end 
                  else begin 
                     bFound := False; 
                  end; 
                    //'If not found add it
                  if (bFound = False ) then begin 
                     setlength( ColorTable, ColorCombNumber   +  1 ); 
                     ColorTable[ ColorCombNumber ] := sTemp; 
                     ColorCombNumber := ColorCombNumber + 1; 
                  end; 
                  sRTF := sRTF + '\cf' + InttoStr(GetIndex( ColorTable , sTemp) + 1);
                  sTemp := ''; 
                  bFound := False; 
               end;
            end; 
         end;
           //'Check for back ground colors
           //'<FONT style="BACKGROUND-COLOR: #6495ed">
         lTStart :=  posEx('STYLE="BACKGROUND-COLOR:', uppercase( sToken), 1 );
         if (lTStart>0 ) then begin
            lTEnd :=  posEx(' ', (sToken ), (lTStart + length( 'STYLE="BACKGROUND-COLOR:')));
            if (lTEnd = 0 ) then begin
               lTEnd :=  posEx(('>' ), (sToken ), (lTStart + length( 'STYLE="BACKGROUND-COLOR:')));
            end;
            sTemp := copy( sToken , lTStart + length( 'STYLE="BACKGROUND-COLOR:'), lTEnd-( lTStart + length( 'BACKGROUND-COLOR:')));
            sTemp := StringReplace( sTemp , '"' , '', [rfReplaceAll,rfIgnoreCase] );
            sTemp := StringReplace( sTemp , ' ' , '' , [rfReplaceAll,rfIgnoreCase]);
            sTemp := StringReplace( sTemp , '#' , '' , [rfReplaceAll,rfIgnoreCase]);
            if (sTemp<>'' ) then begin 
                 //'Check if it is already in the table
               if (Not IsArrayEmpty( ColorTable)) then begin 
                  for I := 0  to High( ColorTable) do begin
                     if (sTemp = ColorTable[I]) then begin 
                        bFound := True;
                        break; 
                     end; 
                  end;
               end 
               else begin 
                  bFound := False; 
               end; 
                 //'If not found add it
               if (bFound = False ) then begin 
                  setlength( ColorTable, ColorCombNumber   +  1 ); 
                  ColorTable[ ColorCombNumber ] := sTemp; 
                  ColorCombNumber := ColorCombNumber + 1; 
               end; 
               sRTF := sRTF + '\highlight' + IntToStr(GetIndex( ColorTable , sTemp) + 1);
               sTemp := ''; 
               bFound := False;
            end;
         end; 
           //'Check for back ground colors
           //'AOL specific
           //'<FONT COLOR="#0000ff" BACK="#80ff00">
         lTStart :=  posEx(('BACK=' ), (uppercase( sToken)), (1 )); 
         if (lTStart>0 ) then begin
            lTEnd :=  posEx(' ', (sToken ), (lTStart + length( 'BACK='))); 
            if (lTEnd = 0 ) then begin 
               lTEnd :=  posEx(('>' ), (sToken ), (lTStart + length( 'BACK='))); 
            end; 
            sTemp := copy( sToken , lTStart + length( 'BACK='), lTEnd-( lTStart + length( 'BACK='))); 
            sTemp := StringReplace( sTemp , '"' , '', [rfReplaceAll,rfIgnoreCase] );
            sTemp := StringReplace( sTemp , '' , '', [rfReplaceAll,rfIgnoreCase] );
            sTemp := StringReplace( sTemp , '#' , '', [rfReplaceAll,rfIgnoreCase]);
            if (sTemp<>'' ) then begin
                 //'Check if it is already in the table
               if (Not IsArrayEmpty( ColorTable)) then begin 
                  for I := 0  to High( ColorTable) do begin 
                     if (sTemp = ColorTable[I]) then begin 
                        bFound := True; 
                        break; 
                     end; 
                  end;
               end 
               else begin
                  bFound := False;
               end; 
                 //'If not found add it
               if (bFound = False ) then begin 
                  setlength( ColorTable, ColorCombNumber   +  1 ); 
                  ColorTable[ ColorCombNumber ] := sTemp; 
                  ColorCombNumber := ColorCombNumber + 1; 
               end; 
               sRTF := sRTF + '\highlight' + IntToStr(GetIndex( ColorTable , sTemp) + 1);
               sTemp := ''; 
               bFound := False; 
            end; 
         end; 
           //'Check for back ground colors
           //'<BODY BGCOLOR="#ffffff">
         lTStart :=  posEx(('BGCOLOR=' ), (uppercase( sToken)), (1 )); 
         if (lTStart>0 ) then begin
            lTEnd :=  posEx(' ', (sToken ), (lTStart + length( 'BGCOLOR=')));
            if (lTEnd = 0 ) then begin 
               lTEnd :=  posEx(('>' ), (sToken ), (lTStart + length( 'BGCOLOR='))); 
            end;
            sTemp := copy( sToken , lTStart + length( 'BGCOLOR='), lTEnd-( lTStart + length( 'BGCOLOR=')));
            sTemp := StringReplace( sTemp , '"' , '', [rfReplaceAll,rfIgnoreCase] );
            sTemp := StringReplace( sTemp , ' ' , '', [rfReplaceAll,rfIgnoreCase] );
            sTemp := StringReplace( sTemp , '#' , '', [rfReplaceAll,rfIgnoreCase] );
            if (sTemp<>'' ) then begin
                 //'Check if it is already in the table
               if (Not IsArrayEmpty( ColorTable)) then begin 
                  for I := 0  to High( ColorTable) do begin 
                     if (sTemp = ColorTable[I]) then begin 
                        bFound := True; 
                        break; 
                     end; 
                  end; 
               end 
               else begin 
                  bFound := False; 
               end;
                 //'If not found add it
               if (bFound = False ) then begin 
                  setlength( ColorTable, ColorCombNumber   +  1 );
                  ColorTable[ ColorCombNumber ] := sTemp; 
                  ColorCombNumber := ColorCombNumber + 1; 
               end; 
               sRTF := sRTF + '\highlight' +  InttoStr( GetIndex( ColorTable , sTemp) + 1);
               sTemp := '';
               bFound := False;
            end;
         end;
           //'check for hyperlink
           //'<A href="http://www.microsoft.com">Friendly name</A>
         lTStart :=  posEx(('HREF=' ), (uppercase( sToken)), (1 ));
         if (lTStart>0 ) then begin
            lTEnd :=  posEx((' ' ), (sToken ), (lTStart + length( 'HREF=') + 1 ));
            if (lTEnd>0 ) then begin
               sTemp := copy( sToken , lTStart + length( 'HREF=') + 1 , lTEnd-( lTStart + length( 'HREF=') + 1)); 
               if (sTemp<>'' ) then begin 
                  setlength( gsHyperLink, lHyperLink   +  1 );
                  gsHyperLink[ lHyperLink ] :=  lowercase( sTemp);
                  sRTF := sRTF + '\ul1\cf' + InttoStr( GetIndex( ColorTable , '0000ff') + 1) + '<' + lowercase( sTemp) + '>\ul0';
                  sTemp := '';
                  bFound := False; 
                  lHyperLink := lHyperLink + 1; 
               end;
            end; 
         end; 
           //'    'check for images
           //'    '<IMG align=left alt="" src="file://C:\Documents and Settings\vijayp.CIPLNAGPUR\My Documents\My Pictures\clipart_anim.gif">
           //'    lTStart = inStr4(1, UCase(sToken), "IMG")
           //'    'found a valid image tag
           //'    If lTStart > 0 Then
           //'        sImage = "\pict"
           //'        'Get source
           //'        lTStart = inStr4(1, UCase(sToken), "SRC=")
           //'        If lTStart > 0 Then
           //'            lTEnd = inStr4(lTStart  +  Len("SRC="""""), sToken, """")
           //'            If lTEnd = 0 Then
           //'                'no path specified Error
           //'                GoTo ImageFileError
           //'            End If
           //'        End If
           //'        sTemp = Mid(sToken, lTStart  +  Len("SRC="), lTEnd - (lTStart  +  Len("SRC=")))
           //'        sTemp = Replace(sTemp, """", "")
           //'        If sTemp <> "" Then
           //'            'Get the file contents
           //'            FileContents = GetFileContents(Replace(sTemp, "FILE://", ""))
           //'            'Get the format from file extension
           //'            sImage = sImage & GetFormatFromExtension(sTemp)
           //'        End If
           //'
           //'        'Get Width
           //'        lTStart = inStr4(1, UCase(sToken), "WIDTH=")
           //'        If lTStart > 0 Then
           //'            lTEnd = inStr4(lTStart  +  Len("WIDTH="), sToken, """")
           //'            If lTEnd = 0 Then
           //'                'no width specified
           //'                GoTo CheckHeight
           //'            End If
           //'        Else
           //'            GoTo CheckHeight
           //'        End If
           //'        sTemp = Mid(sToken, lTStart  +  Len("WIDTH="), lTEnd - (lTStart  +  Len("WIDTH=")))
           //'        sTemp = Replace(sTemp, """", "")
           //'        If sTemp <> "" Then
           //'            'got the width
           //'            sImage = sImage & "\picw" & sTemp
           //'            sTemp = ""
           //'        End If
           //'        'Check Height
           //'CheckHeight:
           //'        lTStart = inStr4(1, UCase(sToken), "HEIGHT=")
           //'        If lTStart > 0 Then
           //'            lTEnd = inStr4(lTStart  +  Len("HEIGHT="), sToken, """")
           //'            If lTEnd = 0 Then
           //'                'no HEIGHT specified
           //'                GoTo CheckHeight
           //'            End If
           //'
           //'            sTemp = Mid(sToken, lTStart  +  Len("HEIGHT="), lTEnd - (lTStart  +  Len("HEIGHT=")))
           //'            sTemp = Replace(sTemp, """", "")
           //'            If sTemp <> "" Then
           //'                'got the HEIGHT
           //'                sImage = sImage & "\pich" & sTemp
           //'                sTemp = ""
           //'            End If
           //'        End If
           //'
           //'        'Append to RTF
           //'        sImage = sImage & #13#10 & FileContents
           //'        sRTF = sRTF & sImage & "}"
           //'    End If
           //'
           //'ImageFileError:
           //'Get the text
         lStart :=  posEx(('>' ), (sHTML ), (lEnd ));
         if (lStart = 0 ) then
            GoTo Completed;
         lEnd :=  posEx(('<' ), (sHTML ), (lStart ));
         if (lEnd = 0 ) then
            GoTo Completed;
         sText := trim( copy( sHTML , lStart , lEnd-lStart + 1));
         if (length( sText)>2 ) then begin
            sText := copy( sText , 2 , length( sText)-2);
              //'check out for special characters
            sText := StringReplace( sText , '\' , '\\', [rfReplaceAll, rfIgnoreCase] );
            sText := StringReplace( sText , '{' , '\{', [rfReplaceAll, rfIgnoreCase]  );
            sText := StringReplace( sText , '}' , '\}', [rfReplaceAll, rfIgnoreCase]  );
            if (bFaceFound = False) And (bUseDefaultFace ) then begin
               sTemp := InttoStr(GetIndex( FontTable , DefaultFace)); //'PreviousFontFace)
               if (trunc( StrToFloat(sTemp)) <0 ) then begin
                  sRTF := sRTF + '\f0';
               end
               else begin
                  sRTF := sRTF + '\f' + sTemp;
               end;
               sTemp := '';
            end;
            sRTF := sRTF + '\fs' + IntToStr(PreviousFontSize) + ' ' + sText;
              //'Debug.Print sText
         end;
      end;
  Completed:
        //'Generate Font Table
      sFontTable := '\deff0{\fonttbl';
      if (Not IsArrayEmpty( FontTable)) then begin
         for I := 0  to High( FontTable) do begin
            sFontTable := sFontTable + '{\f' + IntToStr(I) + '\fnil\fcharset0 ' + FontTable[I] + ';}';
         end;
         sFontTable := sFontTable + '}';
      end
      else begin
         sFontTable := sFontTable + '{\f0\froman\fcharset0 Times New Roman;}}';
         setlength( FontTable, 0   +  1 );
         FontTable[ 0 ] := 'Times New Roman';
           //'FontTable(0).SIZE = "18"
      end;
        //'Generate Color Table
      sColorTable := '{\colortbl ;';
      if (Not IsArrayEmpty( ColorTable)) then begin
         for I := 0  to High( ColorTable) do begin
            sColorTable := sColorTable + '\red' + IntToStr( GetRed( ColorTable[I])) + '\green' + IntToStr(GetGreen( ColorTable[I])) + '\blue' + IntToStr(GetBlue( ColorTable[I])) + ';';
         end;
         sColorTable := sColorTable + '}';
      end
      else begin
      end;
        //'Generate head
      sHead := '{\rtf1\ansi' + sFontTable + #13#10 + sColorTable;
      sHead := sHead + #13#10 + '\pard\plain\tx0';
      HTMLtoRTF := sHead + sRTF + '}';
      exit;
   except
      HTMLtoRTF := '';
   end;
end;

function GetRed(HexString : string) : integer;
var
    sTemp : string;
begin
   sTemp := copy( HexString , 1 , 2);

   GetRed :=  strtoint( '$' + sTemp );
end;

function GetGreen(HexString : string) : integer;
var
    sTemp : string;
begin
   sTemp := copy( HexString , 3 , 2);
   GetGreen := strtoint( '$' + sTemp );
end;
 
function GetBlue(HexString : string) : integer;
var
    sTemp : string;
begin
   sTemp := copy( HexString , 5 , 2);
   GetBlue := strtoint( '$' + sTemp );
end;

function GetIndex(Table : array of string;Code : string) : integer;
var
    bFound : boolean;
    I : integer;
begin
     //'Get the index
   if (Not IsArrayEmpty( Table)) then begin
      for I := 0  to High( Table) do begin
         if (Code = Table[I]) then begin
            bFound := True;
            break;
         end; 
      end;
   end 
   else begin 
      bFound := False; 
   end; 
     //'return it
   if (bFound = False ) then begin 
      GetIndex := 0; 
   end 
   else begin 
      GetIndex := I;
   end; 
end;
 
function GetFontSize(sSize : string) : string;
begin 
      case trim(sSize)[1]  of
      '1'  :
      begin 
         GetFontSize := '15'; //'"7.5"
      end; 
      '2'  : 
      begin 
         GetFontSize := '20'; //'"10"
      end; 
      '3'  : 
      begin
         GetFontSize := '24'; //'"12"
      end;
      '4'  : 
      begin 
         GetFontSize := '27'; //'"13.5"
      end; 
      '5'  : 
      begin 
         GetFontSize := '36'; //'"18"
      end; 
      '6'  : 
      begin 
         GetFontSize := '48'; //'"24"
      end; 
      '7'  : 
      begin 
         GetFontSize := '72'; //'"36"
      end; 
      Else
      begin
         GetFontSize := format( '%d', [(Round( strtoint( sSize) ) * 2 )]);
//         GetFontSize := format( '%d', [(Round( strtoint( sSize), 1 ) * 2 )]);
      end;
   end; 
end; 
 
function IsArrayEmpty(aArray : array of string) : boolean;
var
    lngUBound : longint;
begin
   lngUBound := High( aArray);
   if (lngUBound<>0 ) then begin
      IsArrayEmpty := False;
   end
   else begin
      IsArrayEmpty := True;
   end; 
end;
 
function GetFileContents(sFileName : string) : string;
var
    fp : textfile;
    sBuf : string;
begin
   assignfile( fp, sFileName );
   reset( fp );
//   sBuf := StringOfChar(' ', FileLen( sFileName));
   while not Eof(fp) do begin
    readln( fp, sBuf );
    result := result + sBuf;
  end;
   closefile( fp );
end;


function ArrayPos(ValBusc: string; Valores: array of string; StartPos: Integer = -1): Integer;
var
  i: Integer;
begin
  Result := -1;
  if StartPos <= High(Valores) Then
  begin
    if StartPos = -1 Then
      StartPos := Low(Valores);

    for i := StartPos to High(Valores) do
      if Valores[i] = ValBusc Then
      begin
        Result := i;
        Break;
      end;
  end;
end;

end.


