unit unConfidencial;  { by NWK, 27/03/03 }

interface

uses
  Forms, ExtCtrls;

  function GetTituloPantallaConfidencial(sTituloActual: String; bObtenerTituloOriginal: Boolean): String;

  procedure HabilitarTituloConfidencial(form: TForm; TimerConfidencial: TTimer; sCuit: String);


implementation

uses
  StrFuncs, AnsiSql, Cuit, unDMPrincipal;

const
  cTituloConfidencial: String = '  ** C O N F I D E N C I A L **';

{ Devuelve el título que hay que ponerle a la pantalla que contiene información confidencial en cada ciclo del timer }
function GetTituloPantallaConfidencial(sTituloActual: String; bObtenerTituloOriginal: Boolean): String;
var
  bConTituloConfidencial: Boolean;
  iLongTituloConfidencial: Integer;  
begin
  iLongTituloConfidencial := Length(cTituloConfidencial);
  bConTituloConfidencial  := (StrRight(sTituloActual, iLongTituloConfidencial) = cTituloConfidencial);

  if bConTituloConfidencial or bObtenerTituloOriginal then
  begin
    if bConTituloConfidencial then
      Result := Copy(sTituloActual, 1, Length(sTituloActual) - iLongTituloConfidencial)
    else
      Result := sTituloActual;
  end
  else
    Result := sTituloActual + cTituloConfidencial;
end;

{ Habilita/deshabilita el timer de la pantalla que contiene información confidencial }
procedure HabilitarTituloConfidencial(form: TForm; TimerConfidencial: TTimer; sCuit: String);
var
  bHabilitar: Boolean;
  sSql: String;  
begin
  sSql :=
    'SELECT AFILIACION.IsEmpresaConfidencial(' + SqlValue(SacarGuiones(sCuit)) + ')' +
     ' FROM DUAL';

  bHabilitar := (ValorSql(sSql) = 'S');

  if bHabilitar then
  begin
    TimerConfidencial.Interval := 1000;
    TimerConfidencial.Enabled  := True;
  end
  else
  begin
    TimerConfidencial.Enabled := False;
    form.Caption              := GetTituloPantallaConfidencial(form.Caption, True);
  end;
end;

end.
