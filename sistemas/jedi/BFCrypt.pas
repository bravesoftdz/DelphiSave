{
NOTES:
------------------------------------------------------------------------------
Revised:  2006/01/22 BY: THu (JEDI-VCS) Reason: removed compiler warnings
                         and removed unused code and comments
Revised:  0000/00/00 BY: ******* Reason: ******
------------------------------------------------------------------------------
}
unit BFCrypt;

interface

uses
  Classes;

function  Base64Encode(Value : String) : String;
function  Base64Decode(Value : String) : String;
function BlowFishEncode(AOwner : TComponent; const AKey, InFile,
  OutFile : String) : Boolean;
function BlowFishDecode(AOwner : TComponent; const AKey, InFile,
  OutFile : String) : Boolean;

implementation

uses
  Windows, Cryptcon, Blowunit;

// Base64 code is by Tom Bradford of Beachdog Software
const
  Base64Table =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

function Base64Encode(Value : String) : String;
var AIn   : array[1..3] of Byte;
    AOut  : array[1..4] of Byte;
    AWork : array[1..3] of Byte;
    I : Integer;
    O : LongInt;
begin
   Result := '';
   I := 1;
   O := Length(Value);
   case Length(Value) mod 3 of
      1 : Value := Value + #0 + #0;
      2 : Value := Value + #0;
   end;
   while I < Length(Value) do
      begin
         AIn[1] := Byte(Value[I]);
         AIn[2] := Byte(Value[I+1]);
         AIn[3] := Byte(Value[I+2]);

         AOut[1] := Byte(AIn[1] shr 2);
         AWork[1] := Byte(AIn[1] shl 4);
         AWork[2] := Byte(AWork[1] and $30);
         AWork[3] := Byte(AIn[2] shr 4);
         AOut[2] := Byte(AWork[2] or AWork[3]);
         AWork[1] := Byte(AIn[2] shl 2);
         AWork[2] := Byte(AWork[1] and $3C);
         AWork[3] := Byte(AIn[3] shr 6);
         AOut[3] := Byte(AWork[2] Or AWork[3]);
         AOut[4] := Byte(AIn[3] and $3F);

         Inc(I, 3);
         Result := Result + Base64Table[AOut[1]+1] +
                            Base64Table[AOut[2]+1] +
                            Base64Table[AOut[3]+1] +
                            Base64Table[AOut[4]+1];
      end;
   if O mod 3 > 0 then Result[Length(Result)] := '=';
   if O mod 3 = 1 then Result[Length(Result)-1] := '=';
end;

function Base64Decode(Value : String) : String;
var AIn   : array[1..4] of Byte;
    AOut  : array[1..3] of Byte;
    AWork : array[1..3] of Byte;
    I : Integer;
    C : Integer;
begin
   Result := '';
   I := 1;
   while I < Length(Value) do
   begin
      C := 3;
      FillChar(AWork, SizeOf(AWork), #0);
      FillChar(AOut, SizeOf(AWork), #0);
      AIn[1] := Byte(Pos(Value[I],Base64Table)-1);
      AIn[2] := Byte(Pos(Value[I+1],Base64Table)-1);
      AIn[3] := Byte(Pos(Value[I+2],Base64Table)-1);
      AIn[4] := Byte(Pos(Value[I+3],Base64Table)-1);
      if Value[I+3]='=' then
      begin
         C := 2;
         AIn[4] := 0;
         if Value[I+2]='=' then
         begin
            C := 1;
            AIn[3] := 0;
         end;
      end;
      AWork[2] := Byte(AIn[1] shl 2);
      AWork[3] := Byte(AIn[2] shr 4);
      AOut[1] := Byte(AWork[2] or AWork[3]);
      AWork[2] := Byte(AIn[2] shl 4);
      AWork[3] := Byte(AIn[3] shr 2);
      AOut[2] := Byte(AWork[2] or AWork[3]);
      AWork[2] := Byte(AIn[3] shl 6);
      AOut[3] := Byte(AWork[2] or AIn[4]);
      Result := Result + Char(AOut[1]);
      if C > 1 then
         Result := Result + Char(AOut[2]);
      if C > 2 then
         Result := Result + Char(AOut[3]);
      Inc(I, 4);
   end;
end;

function BlowFishEncode(AOwner : TComponent; const AKey, InFile,
  OutFile : String) : Boolean;
begin
  try
    with TBlowFish.Create(AOwner) do
    begin
      try
        InputFilePath := InFile;
        OutPutFilePath := OutFile;
        CipherMode := ECBMode;
        Key := AKey;
        EncipherData(false);
      finally
        Free;
      end;
    end;
    Windows.Beep(1000, 50);
    Result := true;
  except
    Result := false;
  end;
end;

function BlowFishDecode(AOwner : TComponent; const AKey, InFile,
  OutFile : String) : Boolean;
begin
  try
    with TBlowFish.Create(AOwner) do
    begin
      try
        InputFilePath := InFile;
        OutPutFilePath := OutFile;
        CipherMode := ECBMode;
        Key := AKey;
        DecipherData(false);
      finally
        Free;
      end;
    end;
    Windows.Beep(1000, 50);
    Result := true;
  except
    Result := false;
  end;
end;


end.
