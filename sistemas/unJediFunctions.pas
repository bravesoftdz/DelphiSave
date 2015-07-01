unit unJediFunctions;

interface

uses
	SysUtils;
  
type
	TMWFieldType = (mwString, mwBlob);

function _StrToFloat(Value: String): Double;
function _StrToInt(Value: String): Integer;

implementation

function _StrToFloat(Value: String): Double;
var
  I: Integer;
begin
  Result := 0;
   if Value = '' then
    Exit;
  for I := 1 to Length(Value) do
    if not (Value[I] in ['0'..'9', '+', '-']) then
    begin
      Delete(Value, I, 1);
      Insert(DecimalSeparator, Value, I);
      Break;
    end;
  try
    Result := StrToFloat(Value);
  except
    Result := 0;
  end;
end;

function _StrToInt(Value: String): Integer;
var
  IntValue, Err: Integer;
begin
  Val(Value, IntValue, Err);
  if Err = 0 then
    Result := IntValue
  else
    Result := 0;
end;

end.
