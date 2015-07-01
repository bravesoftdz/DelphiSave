unit unComunesLT;

interface

uses
  {$IFDEF SERVICE}
  SvcMgr,
  {$ELSE}
  Forms,
  {$ENDIF}
  XMLDoc, XMLIntf, Variants, unRelevLT, SysUtils, unLogsLT, unStringsLT;

type
  TMetaRelev = class of TRelevamiento;

function IIF(Condicion: Boolean; const ParteVerdadera, ParteFalsa: Variant): Variant;
procedure Generar(clase: TMetaRelev; PathArchivo: string; tarTXT: TTipoArc = tarEntidad);
function LimpiarDato(cadena: string): string;

implementation

uses unDebug;

function IIF(Condicion: Boolean; const ParteVerdadera, ParteFalsa: Variant): Variant;
begin
  if Condicion then
    Result := ParteVerdadera
  else
    Result := ParteFalsa;
end;

procedure Generar(clase: TMetaRelev; PathArchivo: string; tarTXT: TTipoArc = tarEntidad);
var
  Obj: TRelevamiento;
begin
  try
    Obj := clase.Create(nil);
    Obj.PathArchivo := PathArchivo;
    if Obj.ClassType = TRelevTXTs then
      (Obj as TRelevTXTs).TipoArchivoEI := tarTXT;

    Obj.GenerarArchivo;
  finally
    if assigned(Obj) then FreeAndNil(Obj);
  end
end;

function LimpiarDato(cadena: string): string;
begin
  cadena := StringReplace(cadena, #13, '', [rfReplaceAll]);
  cadena := StringReplace(cadena, #09, '', [rfReplaceAll]);
  cadena := StringReplace(cadena, #10, '', [rfReplaceAll]);
  cadena := StringReplace(cadena, '''', '', [rfReplaceAll]);
  Result := Trim(UpperCase(cadena));
end;

end.
