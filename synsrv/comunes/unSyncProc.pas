unit unSyncProc;

interface

uses SysUtils, AnsiSql, Db, DBClient, Classes;

const
  //Tipo I: Input (va del SqlServer al Oracle)
  //Tipo O: Input (va del Oracle al SqlServer)
  //Tipo A: Input/Output (va en ambos sentidos)
  TABLA_TIPO_AMBAS   = 'A';
  TABLA_TIPO_INPUT   = 'I';
  TABLA_TIPO_OUTPUT  = 'O';

type

  TStringArray = array of string;

  TTablaSync = class (TObject)
  private
    FNombreTablaOracle: string;
    FNombreTablaSqlServer: string;
    FCampos: string;
    FSecuencia: string;
    FTipo: Char;
    FTipoObjeto: char;
    FCamposOracle: TStringArray;
    FCamposSqlServer: TStringArray;

  published
    property NombreTablaOracle: string read FNombreTablaOracle write FNombreTablaOracle;
    property NombreTablaSqlServer: string read FNombreTablaSqlServer write FNombreTablaSqlServer;
    property Campos: string read FCampos write FCampos;
    property Secuencia: string read FSecuencia write FSecuencia;
    property Tipo: Char read FTipo write FTipo;
    property TipoObjeto: Char read FTipoObjeto write FTipoObjeto;
    property CamposOracle: TStringArray read FCamposOracle write FCamposOracle;
    property CamposSqlServer: TStringArray read FCamposSqlServer write FCamposSqlServer;
  end;

  TTablasListSync = array of TTablaSync;

function ObtenerXmlData(sXml: widestring; NombreTabla: string): widestring;
function AgregarFiltro(Campos: string; FechaUltimaSincronizacion:TDateTime): string;
function AgregarFiltroPk(Campos: string; cds: TClientDataSet): string;
function EliminarCaracteresEspeciales(s:string): string;
function EliminarSchema(NombreTabla: string): string;
function EliminarBase(NombreTabla: string): string;
function ExtraerBase(NombreTabla: string): string;

implementation

uses StrUtils;

function ObtenerXmlData(sXml: widestring; NombreTabla: string): widestring;
var
  icomienzo, ifin: longint;
begin
  result := '';
  icomienzo := Pos('<' + trim(NombreTabla) + '>', sXml);
  ifin := Pos('</' + trim(NombreTabla) + '>', sXml);
  if (icomienzo <> 0) and (ifin <> 0) then begin
    Result := copy(sXml, icomienzo + length(trim(NombreTabla)) + 2, ifin - length(trim(NombreTabla)) - icomienzo - 2);
    if result = '' then exit;
  end;
end;


function AgregarFiltro(Campos: string; FechaUltimaSincronizacion:TDateTime): string;
var
  PosAnterior: integer;
begin
  PosAnterior := 1;
  result := '';
  while (PosEx(';', Campos, PosAnterior) <> 0) do begin
    if result = '' then
      Result := Result + ' AND (' + trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior)) + ' >= '  +  SqlDateTime(FechaUltimaSincronizacion)
    else Result := Result + ' OR ' + trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior)) + ' >= '  +  SqlDateTime(FechaUltimaSincronizacion);
    PosAnterior := PosEx(';', Campos, PosAnterior)+1;
  end;

  if copy(Campos, PosAnterior, length(Campos)) <> '' then begin
    if Result = '' then
      Result := Result + ' OR ' + trim(copy(Campos, PosAnterior, length(Campos))) + ' >= '  +  SqlDateTime(FechaUltimaSincronizacion)
    else
      Result := Result + ' OR ' + trim(copy(Campos, PosAnterior, length(Campos))) + ' >= '  +  SqlDateTime(FechaUltimaSincronizacion) + ')';
  end;

end;

function AgregarFiltroPk(Campos: string; cds: TClientDataSet): string;
var
  PosAnterior: integer;
  Pk: string;
begin
  PosAnterior := 1;
  result := '';
  while (PosEx(';', Campos, PosAnterior) <> 0) do begin
    Pk := trim(copy(Campos, PosAnterior, PosEx(';', Campos, PosAnterior) - PosAnterior));
    Result := Result + ' AND ' + Pk + ' = '  +  SqlInt(cds.FieldByName(pk).AsInteger);
    PosAnterior := PosEx(';', Campos, PosAnterior)+1;
  end;

  if copy(Campos, PosAnterior, length(Campos)) <> '' then
    Result := Result + ' AND ' + trim(copy(Campos, PosAnterior, length(Campos))) + ' = '  +  SqlInt(cds.FieldByName(trim(copy(Campos, PosAnterior, length(Campos)))).AsInteger);

end;

function EliminarCaracteresEspeciales(s:string): string;
const
  Caracter: array [1..3] of Char = ('`', '´', '"');
var
  i: integer;
begin
  Result := s;
  for i:=Low(Caracter) to High(Caracter) do
    result := StringReplace(result, Caracter[i], '', [rfReplaceAll, rfIgnoreCase]);
end;

function EliminarSchema(NombreTabla: string): string;
begin
  if trim(NombreTabla) <> '' then begin
    if pos('.', NombreTabla) <> 0 then
      result := copy(NombreTabla, pos('.', NombreTabla) + 1, length(NombreTabla) - pos('.', NombreTabla))
    else
      result := NombreTabla;
  end;
end;

function EliminarBase(NombreTabla: string): string;
begin
  if trim(NombreTabla) <> '' then begin
    if pos('..', NombreTabla) <> 0 then
      result := copy(NombreTabla, pos('..', NombreTabla) + 2, length(NombreTabla) - pos('..', NombreTabla))
    else
      result := NombreTabla;
  end;
end;

function ExtraerBase(NombreTabla: string): string;
begin
  if trim(NombreTabla) <> '' then begin
    if pos('.', NombreTabla) <> 0 then
      result := copy(NombreTabla, 1, pos('.', NombreTabla)-1)
    else
      result := '';
  end;
end;


end.
