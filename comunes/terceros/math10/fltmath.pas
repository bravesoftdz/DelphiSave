unit FltMath;

interface
  { Some floating point math stuff.
    Some of Delphi's float-string conversion routines confuse NaN
    and Infinity. This unit defines replacements that get it right.
    There are also some assembler routines for accessing the
    floating point control word.

    Feel free to use and modify this code as you see fit, even in
    commercial products, provided you retain the proper credit:

    Copyright © 1995 Tempest Software.
  }

  uses Classes, SysUtils, DsgnIntf;

  { These are difficult to set as constants, so set them when the program starts }
  const
    Nan: Extended = 0.0;
    Infinity: Extended = 0.0;
    Epsilon: Extended = 1e-17; { epsilon for approximate comparisons }
    sNan = 4240;            { string resource for 'NaN' }
    sInf = 4241;            { string resource for 'Infinity' }

  type
    TRoundMode = (rmNearest, rmDown, rnUp, rmTruncate);
    TFpuException = (exInvalidOp, exDenormalized, exZeroDivide,
                     exOverflow, exUnderflow, exPrecision);
    TPrecisionMode = (pmSingle, pmReserved, pmDouble, pmExtended);
    TExceptionMask = set of TFpuException;

  function GetRoundMode: TRoundMode;
  function SetRoundMode(RoundMode: TRoundMode): TRoundMode;
  function GetPrecisionMode: TPrecisionMode;
  function SetPrecisionMode(Precision: TPrecisionMode): TPrecisionMode;
  function GetControlWord: Word;
  procedure SetControlWord(Ctl: Word);
  function GetExceptionMask: TExceptionMask;
  function SetExceptionMask(Mask: TExceptionMask): TExceptionMask;
  procedure ClearExceptions;

  function IsInfinity(Value: Extended): Boolean;
  function IsNan(Value: Extended): Boolean;

  { Approximate comparison }
  function FltLE(A, B: Extended): Boolean;
  function FltLT(A, B: Extended): Boolean;
  function FltGE(A, B: Extended): Boolean;
  function FltGT(A, B: Extended): Boolean;
  function FltEQ(A, B: Extended): Boolean;
  function FltNE(A, B: Extended): Boolean;

  { Return some useful constants. The inline instructions are very
    fast if there is a coprocessor. }
  function Log210: Extended; inline($D9/$E9); { Log2(10) }
  function Log2E: Extended; inline($D9/$EA);  { Log2(E) }
  function Pi: Extended; inline($D9/$EB);     { Pi }
  function Log2: Extended; inline($D9/$EC);   { Log10(2) }
  function Ln2: Extended; inline($D9/$ED);    { LogE(2) }

  { Log, base 10 of X }
  function Log10(X: Extended): Extended;

  { Like SysUtils.StrToFloat, but recognizes Nan and Infinity. }
  function StrToFloat(const Str: string): Extended;

  { Like SysUtils functions, but prints Nan and Infinity correctly. }
  function FloatToStrF(Value: Extended; Format: TFLoatFormat;
                       Precision, Digits: Integer): string;
  function FloatToStr(Value: Extended): string;
  function FloatToText(Buffer: PChar; Value: Extended; Format: TFloatFormat;
                       Precision, Digits: Integer): Integer;

  { New floating point property editor that handles NaN and Infinity correctly }
  type
    TBetterFloatProperty = class(TFloatProperty)
    public
      function GetValue: string; override;
      procedure SetValue(const Value: string); override;
    end;

  procedure Register;

implementation

{$R FltMath.res}

{ Make it a little easier to extract exponent & significand from an Extended number }
type
  TExtended = record
    case Boolean of
    True: (
      Mantissa: array[0..1] of LongInt; { MSB of [1] is the normalized 1 bit }
      Exponent: Word; { MSB is the sign bit }
    );
    False:
      (Value: Extended);
  end;

{ Return whether Value is an Infinity (positive or negative). }
function IsInfinity(Value: Extended): Boolean;
var
  Ext: TExtended absolute Value;
begin
  if (Ext.Exponent and $7FFF) <> $7FFF then
    Result := False
  else
    Result := (Ext.Mantissa[1] = $80000000) and (Ext.Mantissa[0] = 0)
end;

{ Return whether Value is Not-a-Number. Note that signalling
  NaNs do not raise an exception in this case, but just return True. }
function IsNan(Value: Extended): Boolean;
var
  Ext: TExtended absolute Value;
begin
  if (Ext.Exponent and $7FFF) <> $7FFF then
    Result := False
  else
    Result := (Ext.Mantissa[1] <> $80000000) or (Ext.Mantissa[0] <> 0)
end;

{ Approximate comparison, from Knuth, Seminumerical Algorithms, 2nd ed.,
  Addison-Wesley, 1981, pp. 217-20. }
function FltLT(A, B: Extended): Boolean;
var
  ExtA: TExtended absolute A;
  ExtB: TExtended absolute B;
  ExpA, ExpB: Word;
  Exp: TExtended;
begin
  ExpA := ExtA.Exponent and $7FFF;
  ExpB := ExtB.Exponent and $7FFF;
  if (ExpA = $7FFF) and ((ExtA.Mantissa[1] <> $80000000) or (ExtA.Mantissa[0] <> 0)) then
    { A is NaN }
    Result := False
  else if (ExpB = $7FFF) and ((ExtB.Mantissa[1] <> $80000000) or (ExtB.Mantissa[0] <> 0)) then
    { B is NaN }
    Result := False
  else if (ExpA = $7FFF) or (ExpB = $7FFF) then
    { A or B is infinity. Use the builtin comparison, which will
      property account for signed infinities, comparing infinity with
      infinity, or comparing infinity with a finite value. }
    Result := A < B
  else
  begin
    { We are comparing two finite values, so take the difference and
      compare that against the scaled Epsilon. }
    Exp.Value := 1.0;
    if ExpA < ExpB then
      Exp.Exponent := ExpB
    else
      Exp.Exponent := ExpA;
    Result := (B-A) > (Epsilon * Exp.Value);
  end;
end;

function FltGT(A, B: Extended): Boolean;
var
  ExtA: TExtended absolute A;
  ExtB: TExtended absolute B;
  ExpA, ExpB: Word;
  Exp: TExtended;
begin
  ExpA := ExtA.Exponent and $7FFF;
  ExpB := ExtB.Exponent and $7FFF;
  if (ExpA = $7FFF) and ((ExtA.Mantissa[1] <> $80000000) or (ExtA.Mantissa[0] <> 0)) then
    { A is NaN }
    Result := False
  else if (ExpB = $7FFF) and ((ExtB.Mantissa[1] <> $80000000) or (ExtB.Mantissa[0] <> 0)) then
    { B is NaN }
    Result := False
  else if (ExpA = $7FFF) or (ExpB = $7FFF) then
    { A or B is infinity. Use the builtin comparison, which will
      property account for signed infinities, comparing infinity with
      infinity, or comparing infinity with a finite value. }
    Result := A > B
  else
  begin
    { We are comparing two finite values, so take the difference and
      compare that against the scaled Epsilon. }
    Exp.Value := 1.0;
    if ExpA > ExpB then
      Exp.Exponent := ExpB
    else
      Exp.Exponent := ExpA;
    Result := (A-B) > (Epsilon * Exp.Value);
  end;
end;

function FltEQ(A, B: Extended): Boolean;
var
  ExtA: TExtended absolute A;
  ExtB: TExtended absolute B;
  ExpA, ExpB: Word;
  Exp: TExtended;
begin
  ExpA := ExtA.Exponent and $7FFF;
  ExpB := ExtB.Exponent and $7FFF;
  if (ExpA = $7FFF) and ((ExtA.Mantissa[1] <> $80000000) or (ExtA.Mantissa[0] <> 0)) then
    { A is NaN }
    Result := False
  else if (ExpB = $7FFF) and ((ExtB.Mantissa[1] <> $80000000) or (ExtB.Mantissa[0] <> 0)) then
    { B is NaN }
    Result := False
  else if (ExpA = $7FFF) or (ExpB = $7FFF) then
    { A or B is infinity. Use the builtin comparison, which will
      property account for signed infinities, comparing infinity with
      infinity, or comparing infinity with a finite value. }
    Result := A = B
  else
  begin
    { We are comparing two finite values, so take the difference and
      compare that against the scaled Epsilon. }
    Exp.Value := 1.0;
    if ExpA < ExpB then
      Exp.Exponent := ExpB
    else
      Exp.Exponent := ExpA;
    Result := Abs(A-B) <= (Epsilon * Exp.Value);
  end;
end;

function FltLE(A, B: Extended): Boolean;
begin
  Result := FltLT(A, B) or FltEQ(A, B);
end;

function FltGE(A, B: Extended): Boolean;
begin
  Result := FltGT(A, B) or FltEQ(A, B);
end;

function FltNE(A, B: Extended): Boolean;
begin
  Result := FltLT(A, B) or FltGT(A, B);
end;

{ Convert a string to a floating point value, correctly recognizing
  Nan and Infinity. }
function StrToFloat(const Str: string): Extended;
begin
  if CompareText(Str, LoadStr(sNan)) = 0 then
    Result := NaN
  else if CompareText(Str, LoadStr(sInf)) = 0 then
    Result := Infinity
  else if (Length(Str) > 1) and (Str[1] = '-') and
          (CompareText(Copy(Str, 2, 255), LoadStr(sInf)) = 0) then
    Result := -Infinity
  else
    Result := SysUtils.StrToFloat(Str)
end;

{ Like SysUtils functions, but prints Nan and Infinity correctly. }
function FloatToStr(Value: Extended): string;
begin
  Result[0] := Chr(FloatToText(@Result[1], Value, ffGeneral, 15, 0));
end;

function FloatToStrF(Value: Extended; Format: TFloatFormat;
                     Precision, Digits: Integer): string;
begin
  Result[0] := Chr(FloatToText(@Result[1], Value, Format, Precision, Digits));
end;

function FloatToText(Buffer: PChar; Value: Extended; Format: TFloatFormat;
                     Precision, Digits: Integer): Integer;
begin
  if IsNan(Value) then
    Result := StrLen(StrPCopy(Buffer, LoadStr(sNan)))
  else if IsInfinity(Value) then
  begin
    if Value < 0 then
    begin
      Buffer[0] := '-';
      Inc(Buffer);
      Result := 1;
    end
    else
      Result := 0;
    Result := Result + StrLen(StrPCopy(Buffer, LoadStr(sInf)));
  end
  else
    Result := SysUtils.FloatToText(Buffer, Value, Format, Precision, Digits);
end;

{ Return the FPU control word }
function GetControlWord: Word; assembler;
var
  Ctl: Word;
asm
  fstcw Ctl
  mov ax, Ctl
end;

{ Set the FPU control word }
procedure SetControlWord(Ctl: Word); assembler;
asm
  fwait
  fldcw Ctl
end;

{ Return the current rounding mode }
function GetRoundMode: TRoundMode;
begin
  Result := TRoundMode((GetControlWord shr 10) and 3);
end;

{ Set the rounding mode and return the old mode }
function SetRoundMode(RoundMode: TRoundMode): TRoundMode;
var
  CtlWord: Word;
begin
  CtlWord := GetControlWord;
  SetControlWord( (CtlWord and $F3FF) or (Ord(RoundMode) shl 10) );
  Result := TRoundMode((CtlWord shr 10) and 3);
end;

{ Return the current precision control mode }
function GetPrecisionMode: TPrecisionMode;
begin
  Result := TPrecisionMode((GetControlWord shr 8) and 3);
end;

function SetPrecisionMode(Precision: TPrecisionMode): TPrecisionMode;
var
  CtlWord: Word;
begin
  CtlWord := GetControlWord;
  SetControlWord( (CtlWord and $FCFF) or (Ord(Precision) shl 8) );
  Result := TPrecisionMode((CtlWord shr 8) and 3);
end;

{ Return the exception mask from the control word.
  Any element set in the mask prevents the FPU from raising that
  kind of exception. Instead, it returns its best attempt at a value,
  often Nan or an infinity. The value depends on the operation and
  the current rounding mode. }
function GetExceptionMask: TExceptionMask;
begin
  Byte(Result) := GetControlWord and $3F;
end;

{ Set a new exception mask and return the old one }
function SetExceptionMask(Mask: TExceptionMask): TExceptionMask;
var
  CtlWord: Word;
begin
  CtlWord := GetControlWord;
  SetControlWord( (CtlWord and $FFC0) or Byte(Mask) );
  Byte(Result) := CtlWord and $3F;
end;

{ Clear any pending exception bits in the status word }
procedure ClearExceptions; assembler;
asm
  fclex
end;

{ Compute a common (base 10) logarithm. If X is near 1.0, then we
  use the FYL2XP1 instruction instead of FYL2X. "Near" means between
  1.0 and 1+Sqrt(2)/2. We use an approximation for Sqrt(2)/2, so we
  don't have to compute it. The exact value isn't important, since
  FYL2X works fine for values near the transition. }
const
  HalfSqrt2p1:Extended = 1.7071;
function Log10(X: Extended): Extended; assembler;
asm
  fldlg2          { push Log2 }
  fld X           { push X }
  fld1            { push 1.0 }
  fcomp ST(1)     { if (X < 1.0) }
  jl @@1          {    goto @@1 }
  fld HalfSqrt2p1 { push 1.707 }
  fcomp ST(1)     { if (X > 1.707) }
  jg @@1          {    goto @@1 }
  fld1            { X is small, so subtract 1.0 }
  fsub            { X := X - 1.0 }
  fyl2xp1         { Log10(2) * Log2(X+1) }
  retf
@@1:              { X is not near 1.0 }
  fyl2x           { Log10(2) * Log2(X) }
end;

{ Floating point property editor that uses the new conversion routines }
function TBetterFloatProperty.GetValue: string;
begin
  Result := FloatToStr(GetFloatValue)
end;

procedure TBetterFloatProperty.SetValue(const Value: string);
begin
  SetFloatValue(StrToFloat(Value));
end;

{ Register the new property editor for all floating point types }
procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(Extended), TComponent, '', TBetterFloatProperty);
  RegisterPropertyEditor(TypeInfo(Double),   TComponent, '', TBetterFloatProperty);
  RegisterPropertyEditor(TypeInfo(Single),   TComponent, '', TBetterFloatProperty);
end;

initialization
  { Initialize NaN and Infinity to appropriate bit masks }
  with TExtended(Nan) do
  begin
    Mantissa[0] := $FFFFFFFF;
    Mantissa[1] := $FFFFFFFF;
    Exponent := $7FFF;
  end;
  with TExtended(Infinity) do
  begin
    Mantissa[0] := 0;
    Mantissa[1] := $80000000;
    Exponent := $7FFF;
  end;
end.
