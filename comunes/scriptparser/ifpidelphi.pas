{Delphi function importer (compiletime)}
unit ifpidelphi;
{
  Innerfuse Pascal Script Call unit
  You may not copy a part of this unit, only use it as whole, with
  Innerfuse Pascal Script Script Engine.
}
{$I ifps3_def.inc}
interface
uses
  ifps3utl, ifps3common, ifpscomp;


{ Register a normal Delphi function at runtime. Decl should be the exact declaration of the
  function. But since the const keyword is not support yet, you should leave that out.}
function RegisterDelphiFunctionC(SE: TIFPSPascalCompiler; const Decl: string): Boolean;
function RegisterDelphiFunctionC2(SE: TIFPSPascalCompiler; const Decl: string): PIFPSRegProc;

implementation

function RegisterDelphiFunctionC(SE: TIFPSPascalCompiler; const Decl: string): Boolean;
begin
  Result := RegisterDelphiFunctionC2(SE, Decl) <> nil;
end;
function RegisterDelphiFunctionC2(SE: TIFPSPascalCompiler; const Decl: string): PIFPSRegProc;
var
  p: PIFPSRegProc;
  s: string;
begin
  p := Se.AddFunction(Decl);
  if p = nil then begin Result := nil; exit; end;
  s := p^.Decl;
  if GRFW(s) = '-1' then
  begin
    p^.ImportDecl := p^.ImportDecl + #0;
  end else
    p^.ImportDecl := p^.ImportDecl + #1;
  while length(s) > 0 do
  begin
    if s[1] = '!' then
      p^.ImportDecl := p^.ImportDecl + #1
    else
      p^.ImportDecl := p^.ImportDecl + #0;
    grfw(s);
    grfw(s);
  end;
  p^.FExportName := True;
  Result := p;
end;

end.

