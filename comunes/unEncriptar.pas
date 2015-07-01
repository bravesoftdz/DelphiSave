unit unEncriptar;

interface

    Function DesEncriptarLiteral(Valor: String): String;
    Function EncriptarLiteral(Valor: String): String;


implementation

uses
 SysUtils, Math, Numeros;

Const
  INI_CHARS = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

Function DesEncriptarLiteral(Valor: String): String;
Var i         : Integer ;
    Buffer    : String;
    Largo     : Integer;
    Resultado : String;
begin
    Resultado := '';
    if Valor <> '' Then begin
        Buffer := '';
        for i := 1 to Length(Valor) + 1 do begin
            If isPair(Ord(Valor[i]) - i) Then
               Buffer := Buffer + '0'
            else
               Buffer := Buffer + '1';
        end; // For

        Largo  := Round(Length(Buffer) /2);
        Buffer := Copy (Buffer, Largo + 1, Largo) + Copy (Buffer, 1, Largo);

        for i := 1 to Round(Length(Valor) / 8)  do
            Resultado := Resultado +  Chr(BinToDec(Copy(Buffer, (i * 8)-7, 8)) );
    end;
    Result := Resultado;
end;

Function EncriptarLiteral(Valor: String): String;
Var
   Resultado : String;
   i         : Integer;
   sBin      : String;
   bBit      : Byte ;
Begin
     Randomize;
     For i := 1 to Length(Valor) do  //Cadena de Bits
         sBin := sBin + DecToBin( Ord(Valor[i]) );

     i := Round(Length(sBin) /2);
     sBin := Copy (sBin, i +1 , i) + Copy (sBin, 1, i);

     for i := 1 to Length(sBin) do begin
        bBit := Random(25) + 65 ;
        if isPair( StrToInt(sBin[i]) + 2 + i ) Then begin
           if not isPair(bBit) Then
              bBit := bBit + 1;
        end else
           if isPair(bBit) Then
              bBit := bBit + 1 ;
        Resultado := Resultado + Chr(bBit);
    end; // For
    Result := Resultado;
end;
end.

