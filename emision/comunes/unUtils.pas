{-----------------------------------------------------------------------------
 Unidad:    unUtils
 Autor:     CChiappero
 Fecha:     19-Sep-2005
 Prósito:
 Historia:
-----------------------------------------------------------------------------}
unit unUtils;

interface


uses Controls, Classes, StdCtrls, SysUtils, ArtDBGrid, unConstEmision, Variants,
     Windows, Forms;

type
  EExceptionDDJJ = class(Exception)
    Code : Integer;
    ErrorMessage : String;
    OriginalMessage : String;
  public
    constructor Create(const Msg, OrgMsg : string; ACode: Integer);
  end;


  TLineaCabecera = record
      TipoRegistro : string;
      CodRegistro : string;
      CodArchivo  : string;
      SubcodigoArch : String;
      FechaProceso : TDate;
      HoraProceso  : String;
      FormatoFormulario : Integer;
      ContieneTrabajadores : boolean;
      EmpleadosOriginal: integer;
      EmpleadosRectificativa: integer;
  end;

  TLineaSinPersonal = record
     Cuit     : string;
     Periodo  : string;
     CodRect  : string;
     FechaPresentacion : TDateTime;
     CodArt   : String;
  end;

  TLineaMiRegistro = record
     Cuit: string;
     Cuil: string;
     ApellidoNombre: string;
     FechaIni: TDateTime;
     FechaFin: TDateTime;
     ClaveAlta: String;
     FechaClaveAlta: TDateTime;
     Separador1: String;
     HoraClaveAlta: String;
     ClaveBaja: String;
     FechaClaveBaja: TDateTime;
     Separador2: String;
     HoraClaveBaja: String;
     ModContratacion: String;
     TrabajadorAgro: String;
     InfoSistJubil: String;
     CodSitBaja: String;
     CodART: String;
     FechaMov: TDateTime;
     HoraMov: String;
     CodigoMov: String;
     RemunBruta: Currency;
     ModLiquidacion: integer;
     Sucursal: integer;
     Actividad: String;
     Puesto: String;
     FechaTelegRenun: TDateTime;
     UsuFuturo1   : String;
     UsuFuturo2   : String;
     MarcaRectificacion : integer;
     FormAgropecuario : String;
     CCT : String;
     CatProfesional : String;
     TipoServ : String;
  end;

  TLineaDomicilioDeExplotasion = record
    Cuit : String;
    CodMovimiento : String;
    TipoExterno : String;
    Calle : String;
    NumeroPuerta : String;
    Torre : String;
    Bloque : String;
    Piso : String;
    Departamento : String;
    CodigoPostal : String;
    Localidad : String;
    Provincia :String;
    Sucursal : String;
    Actividad : String;
    FechaHoraMovimiento : TDateTime;
    HoraMovimiento : String;
  end;

  TLineaDeterminativa = record
     Cuit     : string;
     Periodo  : string;
     NumeroObligacion: String;
     SecuenciaObligacion: integer;
     Banco: String;
     FechaPresentacion : TDateTime;
     CodRect  : string;
     Alicuota: Currency;
     CuotaFija: Currency;
     PagoTotal: Currency;
     CodArt   : String;
     PersonalTemporario: string;
     Version : string;
     CantidadEmpleados : integer;
     Masa : Currency;
  end;

  TLineaNominativa = record
     Cuit     : string;
     Periodo  : string;
     CodRect  : string;
     FecPres  : string;
     FechaPresentacion : TDateTime;
     FecProc  : string;
     FechaProceso : TDateTime;
     Cuil     : String;
     CodArt   : String;
     CodSit   : String;
     CodCon   : String;
     ActivDes : String;
     ModCont  : String;
     Zona     : String;
     Remuneracion  : Currency;
     CodOSoc  : String;
     SecDJ    : String;
     SecNom   : String;
     UsoFut   : String;
     Version  : String;
     Release  : String;
     NumeroObligacion: String;
     SecuenciaObligacion: integer;
     Banco: String;
     PorcentajeReduccion: Currency;
     RemuneracionTotal: Currency;
     AdicionalTareaRiesgo: Currency;
     AporteObligatorioSS: Currency;
     AporteVoluntarioSS: Currency;
     CodigoSiniestro: String;
     SituacionCuil_1: String;
     FechaSituacionCuil_1: TDateTime;
     SituacionCuil_2: String;
     FechaSituacionCuil_2: TDateTime;
     SituacionCuil_3: String;
     FechaSituacionCuil_3: TDateTime;
     Sueldo: Currency;
     Sac: Currency;
     Horasextra: Currency;
     ZonaDesFavorable: Currency;
     Vacaciones: Currency;
     DiasLaborales: integer;
     Adicionales: Currency;
     Premios: Currency;
     CptoNoRemunerativos: Currency;
  end;

  PHWND = ^HWND;

var
  hSemaphore: THandle;
  FCantidadInstancias: integer;


//Devuelve el itemindex para el ID de la tabla
function  GetIndexComboById(ACombo : TComboBox; AId : Integer) : Integer;
//Devuelve el Id de la tabla del itemindex del combo.
function  GetIdComboByIndex(ACombo : TComboBox) : Integer;
//Posiciona el ItemIndex del combo en el elemento con AId.
procedure SetItemIndexComboById(ACombo : TComboBox; AId : Integer);



function ParseoCabeceraArchivo(Const Linea: string) : TLineaCabecera;
//function ParsearLinea(const ATipoFormulario : integer; const ALinea : String) : TLineaParseada;
procedure CargarCombo(ACombo : TComboBox; ASql : String);
procedure SeleccionDesdeHasta(AGrilla : TArtDBGrid; ACampo : string; var APeriodoDesde, APeriodoHasta : String);
function GetFechaParseada(aFecha: string; Delimiter: boolean = true): TDateTime;
function GetCodigoArchivo(aLinea: string): String;
function GetAgendarDefault(aIdFormulario: string): string;
function EncodeContrato(Contrato: Int64): String;
function EncodeInt(const iInt: Int64): String;

function ParsearLineaSUSS(ALinea : String) : TLineaNominativa ;
function ParsearLineaSUSSExtendido(ALinea : String) : TLineaNominativa;
function ParsearLineaSinPersonal(ALinea : String) : TLineaSinPersonal;
function ParsearLineaDeterminativa(ALinea : String) : TLineaDeterminativa;
function ParsearLineaMonotributo(ALinea : String) : TLineaNominativa;
function ParsearMiRegistro(ALinea : String) : TLineaMiRegistro;
function ParsearDomicilioDeExplotasion(ALinea : String) : TLineaDomicilioDeExplotasion;

function ProcesandoArchivo: Boolean;
procedure LiberarProcesando;
function GetInstances: integer;

implementation

uses AnsiSql, SqlFuncs, StrFuncs, unDirUtils, unDmPrincipal,
  unCustomDataModule, DB, SDEngine, VCLExtra;

{-----------------------------------------------------------------------------
  Procedimiento: GetIdComboByIndex
  Autor:         cchiappero
  Fecha:         19-Sep-2005
  Argumentos:    ACombo : TComboBox
  Resultado:     Integer
                 Devuelve el Id guardado en el combo para el elemento
                 seleccionado.
-----------------------------------------------------------------------------}
function  GetIdComboByIndex(ACombo : TComboBox) : Integer;
begin
  if ACombo.ItemIndex > -1 then
    result := Integer(ACombo.Items.Objects[ACombo.ItemIndex])
  else result := -1;
end;

{-----------------------------------------------------------------------------
  Procedimiento: CargarCombo
  Usuario:       CChiappero
  Fecha:         19-Sep-2005
  Argumentos:    ACombo : TComboBox; ASql : String
                 ASql es una consulta donde campo ID entero y DESCRIPCION string
  Resultado:     None
  Descripción:
-----------------------------------------------------------------------------}
procedure CargarCombo(ACombo : TComboBox; ASql : String);
var
  Q : TSDQuery;
begin
  Q := GetQuery(ASql);
  try
    ACombo.Clear;
    while not Q.Eof do
    begin
      ACombo.AddItem(Q.FieldByName('DESCRIPCION').AsString, TObject(Q.FieldByName('ID').AsInteger));
      Q.Next;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetIndexComboById(ACombo : TComboBox; AId : Integer) : integer;
var
 i : integer;
begin
  Result := -1;
  for i := 0 to ACombo.Items.Count - 1 do
   if Assigned(ACombo.Items.Objects[i]) and (Integer(ACombo.Items.Objects[i]) = AId) then
   begin
       Result := i;
       break;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure SetItemIndexComboById(ACombo : TComboBox; AId : Integer);
var
 i : integer;
begin
  Acombo.ItemIndex := -1;
  for i := 0 to ACombo.Items.Count - 1 do
   if Assigned(ACombo.Items.Objects[i]) and (Integer(ACombo.Items.Objects[i]) = AId) then
   begin
       Acombo.ItemIndex := i;
       break;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParseoCabeceraSUSS(const Linea: string) : TLineaCabecera;
var
  FecProc : string;
begin
  try
    result.CodArchivo := Trim(copy(linea, 3, 10));
    result.CodRegistro   := Trim(copy(linea, 1,  2));
    result.SubcodigoArch := Trim(copy(linea, 13, 5));
    FecProc              := Trim(copy(linea, 23, 8));
    result.FechaProceso := EncodeDate(StrToInt(copy(FecProc, 1,4)), StrToInt(copy(FecProc, 5,2)), StrToInt(copy(FecProc, 7,2)));
    result.HoraProceso     := Trim(copy(linea, 31, 6));
  except
    raise exception.Create('Error en el formato de la cabecera de archivo SUSS.');
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParseoCabeceraSUSSExtendido(const Linea: string) : TLineaCabecera;
var
  FecProc : string;
begin
  try
    result.CodRegistro  := Trim(copy(linea, 1, 2));
    result.CodArchivo := Trim(copy(linea, 11, 13));
    result.SubcodigoArch := Trim(copy(linea, 3, 8));
    FecProc              := Trim(copy(linea, 24, 10));
    result.FechaProceso := EncodeDate(StrToInt(copy(FecProc, 1,4)), StrToInt(copy(FecProc, 6,2)), StrToInt(copy(FecProc, 9,2)));
  except
    raise exception.Create('Error en el formato de la cabecera de archivo SUSS Extendido.');
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParseoCabeceraMiRegistro(const Linea: string) : TLineaCabecera;
var
  FecProc : string;
begin
  try
    result.CodRegistro  := Trim(copy(linea, 1, 2));
    result.CodArchivo := Trim(copy(linea, 3, 10));
    result.SubcodigoArch := Trim(copy(linea, 13, 6));
    FecProc              := Trim(copy(linea, 23, 8));
    result.FechaProceso := EncodeDate(StrToInt(copy(FecProc, 1,4)), StrToInt(copy(FecProc, 5,2)), StrToInt(copy(FecProc, 7,2)));
    result.HoraProceso     := Trim(copy(linea, 31, 6));
  except
    raise exception.Create('Error en el formato de la cabecera de Mi Registro.');
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParseoCabeceraDomicilioExplotacion(const Linea: string) : TLineaCabecera;
{
var
  FecProc : string;
}  
begin
  try
    result.CodRegistro := Trim(copy(linea, 1, 1));
    result.CodArchivo := Trim(copy(linea, 8, 2));
    result.SubcodigoArch := Trim(copy(linea, 2, 6))+'51';
    result.FechaProceso := EncodeDate(StrToInt(copy(linea, 10,4)), StrToInt(copy(linea, 14,2)), StrToInt(copy(linea, 16,2)));
    result.HoraProceso     := Trim(copy(linea, 18, 6));
  except
    raise exception.Create('Error en el formato de la cabecera Domicilio de Explotación.');
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParseoCabeceraDeterminativa(Linea: string) : TLineaCabecera;
var
  FecProc : string;
begin
  try
    result.CodRegistro   := Trim(copy(linea, 1,  2));
    result.CodArchivo    := Trim(copy(linea, 11, 13));
    result.SubcodigoArch := Trim(copy(linea, 3, 8));
    FecProc              := Trim(copy(linea, 24, 10));
    result.FechaProceso := EncodeDate(StrToInt(copy(FecProc, 1,4)), StrToInt(copy(FecProc, 6,2)), StrToInt(copy(FecProc, 9,2)));
  except
    raise exception.Create('Error en el formato de la cabecera de archivo DETERMINATIVAS.');
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
function ParseoCabeceraMonotributo(Linea: string) : TLineaCabecera;
var
  FecProc : string;
begin
  try
    result.CodRegistro   := Trim(copy(linea, 1,  2));
    result.CodArchivo    := Trim(copy(linea, 3, 10));
    result.SubcodigoArch := Trim(copy(linea, 13, 5));
    FecProc              := Trim(copy(linea, 23, 10));
    result.FechaProceso  := EncodeDate(StrToInt(copy(FecProc, 1,4)), StrToInt(copy(FecProc, 6,2)), StrToInt(copy(FecProc, 9,2)));
    result.HoraProceso   := Trim(copy(linea, 31, 6));
  except
    raise exception.Create('Error en el formato de la cabecera de archivo Monotributista.');
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParseoCabeceraSinPersonal(Linea: string) : TLineaCabecera;
var
  FecProc : string;
begin
  try
    result.CodRegistro   := Trim(copy(linea, 1,  2));
    result.CodArchivo    := Trim(copy(linea, 3, 10));
    result.SubcodigoArch := Trim(copy(linea, 13, 5));
    FecProc              := Trim(copy(linea, 23, 10));
    result.FechaProceso := EncodeDate(StrToInt(copy(FecProc, 1,4)), StrToInt(copy(FecProc, 6,2)), StrToInt(copy(FecProc, 9,2)));
    result.HoraProceso     := Trim(copy(linea, 33, 10));
  except
    raise exception.Create('Error en el formato de la cabecera de archivo SIN PERSONAL.');
  end;
end;

function ParseoCabeceraArchivo(const Linea: string) : TLineaCabecera;
var
  TipoFormulario : string;
begin
  TipoFormulario := GetCodigoArchivo(linea);
  result.FormatoFormulario     := ValorSql('select tf_formato from emi.itf_tipoformulario where tf_id = ' + TipoFormulario, '0');
  result.ContieneTrabajadores  := ValorSql('select tf_trabajadores from emi.itf_tipoformulario where tf_id = ' + TipoFormulario, 'S') = 'S';

  if result.FormatoFormulario = FORMULARIOSUSS then
       result := ParseoCabeceraSUSS(Linea)
  else if  result.FormatoFormulario = FORMULARIOMONOTRIBUTO then
       result := ParseoCabeceraMonotributo(Linea)
  else if result.FormatoFormulario = FORMULARIOSINPERSONAL then
       result := ParseoCabeceraSinPersonal(Linea)
  else if result.FormatoFormulario = FORMULARIOSUSSEXTENDIDO then
       result := ParseoCabeceraSUSSExtendido(Linea)
  else if result.FormatoFormulario = FORMULARIODETERMINATIVA then
       result := ParseoCabeceraDeterminativa(Linea)
  else if result.FormatoFormulario = FORMULARIOMIREGISTRO then
       result := ParseoCabeceraMiRegistro(Linea)
  else if result.FormatoFormulario = FORMULARIODOMICILIOEXPLOTACION then
       result := ParseoCabeceraDomicilioExplotacion(Linea)
end;
{----------------------------------------------------------------------------------------------------------------------}
// Implementación simple de Período 2000 para priorizar la performance..
// Ojo porque no chequea nada.
function Periodo2000(APeriodo : string) : string;
begin
  if (Copy(APeriodo,1,2) > '50') then
    result := '19' + APeriodo
  else
    result := '20' + APeriodo;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParsearLineaSUSS(ALinea : String) : TLineaNominativa ;
var
 remu : string;
begin
  with result do
  begin
    Cuit     := Trim(copy(Alinea, 1,  11));
    Periodo  := periodo2000(Trim(copy(Alinea, 12,  4)));
    CodRect  := Trim(copy(Alinea, 16,  2));
    Cuil     := Trim(copy(Alinea, 28,  11));
    CodArt   := Trim(copy(Alinea, 39,  5));
    CodSit   := Trim(copy(Alinea, 44,  2));
    CodCon   := Trim(copy(Alinea, 46,  1));
    ActivDes := Trim(copy(Alinea, 47,  2));
    ModCont  := Trim(copy(Alinea, 49,  2));
    Zona     := Trim(copy(Alinea, 52,  2));
    FechaPresentacion := GetFechaParseada(Trim(copy(Alinea, 18,  10)));

    remu := Trim(copy(Alinea, 54,  11));
    if (remu <> '') then
      Remuneracion  :=  StrToFloat(remu) / 100
    else
      Remuneracion  := 0;

    CodOSoc  := Trim(copy(Alinea, 65,  6));
    SecDJ    := Trim(copy(Alinea, 71,  3));
    SecNom   := Trim(copy(Alinea, 74,  6));
    UsoFut   := Trim(copy(Alinea, 81,  81));
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParsearLineaMonotributo(ALinea : String) : TLineaNominativa;
var
 remu : string;
begin
  with result do
  begin
    Cuit     := Trim(copy(Alinea, 1,  11));
    Periodo  := Trim(copy(Alinea, 12,  6));
    Cuil     := Trim(copy(Alinea, 18, 11));
    CodCon   := Trim(copy(Alinea, 29,  1));
    ModCont  := Trim(copy(Alinea, 30,  1));
    CodArt   := Trim(copy(Alinea, 35, 5));
    CodOSoc  := Trim(copy(Alinea, 40, 6));

    remu := Trim(copy(Alinea, 46, 8));
    if (remu <> '') then
     Remuneracion  :=  StrToFloat(remu) / 100
    else
     Remuneracion  := 0;

    FechaPresentacion := GetFechaParseada(Trim(copy(Alinea, 62, 10)));

    Version  := Trim(copy(Alinea, 72, 2));
    CodRect  := Trim(copy(Alinea, 74, 2));
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParsearLineaSUSSExtendido(ALinea : String) : TLineaNominativa;
var
 remu : string;
begin
  with result do
  begin
(* Version Anterior
    Cuit     := Trim(copy(Alinea, 1,  11));
    Periodo  := periodo2000(Trim(copy(Alinea, 12,  4)));
    NumeroObligacion := Trim(copy(Alinea, 16,  12));
    SecuenciaObligacion := StrToIntDef(Trim(copy(Alinea, 28,  3)), 0);
    Banco := Trim(copy(Alinea, 31,  3));
    CodRect  := Trim(copy(Alinea, 37,  1));


    FechaPresentacion := GetFechaParseada(Trim(copy(Alinea, 38,  10)));

    Cuil     := Trim(copy(Alinea, 48,  11));
    ModCont  := Trim(copy(Alinea, 73,  3));
    Zona     := Trim(copy(Alinea, 78,  2));
    ActivDes := Trim(copy(Alinea, 80,  2));

    PorcentajeReduccion := StrToCurrDef(Trim(copy(Alinea, 82, 4)), 0) / 100;
    RemuneracionTotal := StrToCurrDef(Trim(copy(Alinea, 86, 8)), 0) / 100;

    //Corresponde REMIMPO (Remuneracion Imponible)
    remu := Trim(copy(Alinea, 94,  8));
    if (remu <> '') then
     Remuneracion  :=  StrToFloat(remu) / 100
    else
     Remuneracion  := 0;

    AdicionalTareaRiesgo := StrToCurrDef(Trim(copy(Alinea, 102, 4)), 0) / 100;
    AporteObligatorioSS  := StrToCurrDef(Trim(copy(Alinea, 106, 8)), 0) / 100;
    AporteVoluntarioSS   := StrToCurrDef(Trim(copy(Alinea, 114, 8)), 0) /100;
    CodArt   := Trim(copy(Alinea, 122,  5));
    FechaProceso := GetFechaParseada(Trim(copy(Alinea, 178,  10)));
    CodCon  := Trim(copy(Alinea, 188,  2));
    Version := Trim(copy(Alinea, 201,  2));
    CodigoSiniestro := Trim(copy(Alinea, 227,  2));
    CodSit   := Trim(copy(Alinea, 229,  2));
    SituacionCuil_1 := Trim(copy(Alinea, 231,  2));
    FechaSituacionCuil_1 := GetFechaParseada(Periodo + Trim(copy(Alinea, 233,  2)), false);
    SituacionCuil_2 := Trim(copy(Alinea, 235,  2));
    FechaSituacionCuil_2 := GetFechaParseada(Periodo + Trim(copy(Alinea, 237,  2)), false);
    SituacionCuil_3 := Trim(copy(Alinea, 239,  2));
    FechaSituacionCuil_3 := GetFechaParseada(Periodo + Trim(copy(Alinea, 241,  2)), false);
    Sueldo := StrToCurrDef(Trim(copy(Alinea, 243,  8)), 0) / 100;
    Sac := StrToCurrDef(Trim(copy(Alinea, 251,  8)), 0) / 100;
    Horasextra := StrToCurrDef(Trim(copy(Alinea, 259,  8)), 0) / 100;
    ZonaDesfavorable := StrToCurrDef(Trim(copy(Alinea, 267,  8)), 0) / 100;
    Vacaciones := StrToCurrDef(Trim(copy(Alinea, 275,  8)), 0) / 100;
    DiasLaborales := StrToIntDef(Trim(copy(Alinea, 283,  2)), 0);
*)
    (* Nueva Version *)
    Cuit     := Trim(copy(Alinea, 1,  11));
    Periodo  := periodo2000(Trim(copy(Alinea, 12,  4)));
    NumeroObligacion := Trim(copy(Alinea, 16,  12));
    SecuenciaObligacion := StrToIntDef(Trim(copy(Alinea, 28,  3)), 0);
    Banco := Trim(copy(Alinea, 31,  3));
    CodRect  := Trim(copy(Alinea, 37,  1));


    FechaPresentacion := GetFechaParseada(Trim(copy(Alinea, 38,  10)));

    Cuil     := Trim(copy(Alinea, 48,  11));
    ModCont  := Trim(copy(Alinea, 73,  3));
    Zona     := Trim(copy(Alinea, 78,  2));
    ActivDes := Trim(copy(Alinea, 80,  3));
    ActivDes := LPad(ActivDes, '0', 3);

    PorcentajeReduccion := StrToCurrDef(Trim(copy(Alinea, 83, 4)), 0) / 100;
    RemuneracionTotal := StrToCurrDef(Trim(copy(Alinea, 87, 11)), 0) / 100;

    //Corresponde REMIMPO (Remuneracion Imponible)
    remu := Trim(copy(Alinea, 98,  11));
    if (remu <> '') then
     Remuneracion  :=  StrToFloat(remu) / 100
    else
     Remuneracion  := 0;

    AdicionalTareaRiesgo := StrToCurrDef(Trim(copy(Alinea, 109, 4)), 0) / 100;
    AporteObligatorioSS  := StrToCurrDef(Trim(copy(Alinea, 113, 8)), 0) / 100;
    AporteVoluntarioSS   := StrToCurrDef(Trim(copy(Alinea, 121, 8)), 0) /100;
    CodArt   := Trim(copy(Alinea, 129,  5));
    FechaProceso := GetFechaParseada(Trim(copy(Alinea, 185,  10)));
    CodCon  := Trim(copy(Alinea, 195,  2));
    Version := Trim(copy(Alinea, 208,  2));
    CodigoSiniestro := Trim(copy(Alinea, 234,  2));
    CodSit   := Trim(copy(Alinea, 236,  2));
    SituacionCuil_1 := Trim(copy(Alinea, 238,  2));
    FechaSituacionCuil_1 := GetFechaParseada(Periodo + Trim(copy(Alinea, 240,  2)), false);
    SituacionCuil_2 := Trim(copy(Alinea, 242,  2));
    FechaSituacionCuil_2 := GetFechaParseada(Periodo + Trim(copy(Alinea, 244,  2)), false);
    SituacionCuil_3 := Trim(copy(Alinea, 246,  2));
    FechaSituacionCuil_3 := GetFechaParseada(Periodo + Trim(copy(Alinea, 248,  2)), false);
    Sueldo := StrToCurrDef(Trim(copy(Alinea, 250,  11)), 0) / 100;
    Sac := StrToCurrDef(Trim(copy(Alinea, 261, 11)), 0) / 100;
    Horasextra := StrToCurrDef(Trim(copy(Alinea, 272, 11)), 0) / 100;
    ZonaDesfavorable := StrToCurrDef(Trim(copy(Alinea, 283,  11)), 0) / 100;
    Vacaciones := StrToCurrDef(Trim(copy(Alinea, 294, 11)), 0) / 100;
    DiasLaborales := StrToIntDef(Trim(copy(Alinea, 305, 2)), 0);
    Release := Trim(copy(Alinea, 307,  2));
    Adicionales := StrToCurrDef(Trim(copy(Alinea, 309, 11)), 0) / 100;
    Premios := StrToCurrDef(Trim(copy(Alinea, 320, 11)), 0) / 100;
    CptoNoRemunerativos := StrToCurrDef(Trim(copy(Alinea, 331, 11)), 0) / 100;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParsearMiRegistro(ALinea : String) : TLineaMiRegistro;
begin
  with result do
  begin
    Cuit := Trim(copy(Alinea, 1,  11));
    Cuil := Trim(copy(Alinea, 12, 11));
    ApellidoNombre:= Trim(copy(Alinea, 23, 55));

    if (Trim(copy(Alinea, 78,  10)) = '9999-12-31') or (Trim(copy(Alinea, 78,  10)) = '0001-01-01') then
      FechaIni := 0
    else
      FechaIni:= GetFechaParseada(Trim(copy(Alinea, 78,  10)));

    if (Trim(copy(Alinea, 88,  10)) = '9999-12-31') or (Trim(copy(Alinea, 88,  10)) = '0001-01-01') then
      FechaFin := 0
    else
      FechaFin:= GetFechaParseada(Trim(copy(Alinea, 88,  10)));

    ClaveAlta:= Trim(copy(Alinea, 104, 20));

    if (Trim(copy(Alinea, 124,  10)) = '9999-12-31') or (Trim(copy(Alinea, 124,  10)) = '0001-01-01') then
      FechaClaveAlta := 0
    else
      FechaClaveAlta:= GetFechaParseada(Trim(copy(Alinea, 124, 10)));

    Separador1:= Trim(copy(Alinea, 134, 1));
    HoraClaveAlta:= Trim(copy(Alinea, 135, 5));
    ClaveBaja:= Trim(copy(Alinea, 140, 20));

    if (Trim(copy(Alinea, 160,  10)) = '9999-12-31') or (Trim(copy(Alinea, 160,  10)) = '0001-01-01') then
      FechaClaveBaja := 0
    else
      FechaClaveBaja:= GetFechaParseada(Trim(copy(Alinea, 160, 10)));

    Separador2:= Trim(copy(Alinea, 170, 1));
    HoraClaveBaja:= Trim(copy(Alinea, 171, 5));
    ModContratacion:= Trim(copy(Alinea, 176, 3));
    TrabajadorAgro:= Trim(copy(Alinea, 179, 2));
    InfoSistJubil:= Trim(copy(Alinea, 181, 2));
    CodSitBaja:= Trim(copy(Alinea, 183, 2));
    CodART:= Trim(copy(Alinea, 185, 5));

    if (Trim(copy(Alinea, 190,  10)) = '9999-12-31') or (Trim(copy(Alinea, 190,  10)) = '0001-01-01') then
      FechaMov := 0
    else
      FechaMov:= GetFechaParseada(Trim(copy(Alinea, 190, 10)));

    HoraMov:= Trim(copy(Alinea, 201, 8));
    CodigoMov:= Trim(copy(Alinea, 209, 2));
    RemunBruta := StrToCurrDef(Trim(StringReplace(copy(Alinea , 211,  11), ',', '.', [])), 0);
    ModLiquidacion:= StrToIntDef(Trim(copy(Alinea, 222, 1)), 0);
    Sucursal:= StrToIntDef(Trim(copy(Alinea, 223, 5)), 0);
    Actividad:= Trim(copy(Alinea, 228, 6));
    Puesto:= Trim(copy(Alinea, 234, 4));

    if (Trim(copy(Alinea, 238,  10)) = '9999-12-31') or (Trim(copy(Alinea, 238,  10)) = '0001-01-01') then
      FechaTelegRenun := 0
    else
      FechaTelegRenun:= GetFechaParseada(Trim(copy(Alinea, 238, 10)));

    UsuFuturo1:= Trim(copy(Alinea, 98, 6));
    UsuFuturo2:= Trim(copy(Alinea, 248, 4));
    MarcaRectificacion :=  StrToIntDef(Trim(copy(Alinea, 252, 1)), -1);
    UsuFuturo2:= Trim(copy(Alinea, 248, 4));
    FormAgropecuario := Trim(copy(Alinea, 253, 10));
    TipoServ := Trim(copy(Alinea, 263, 3));
    CatProfesional := Trim(copy(Alinea, 266, 6));
    CCT := Trim(copy(Alinea, 272, 10));
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParsearDomicilioDeExplotasion(ALinea : String) : TLineaDomicilioDeExplotasion;
begin
  with result do
  begin
    Cuit := Trim(copy(Alinea, 1,  11));
    CodMovimiento := Trim(copy(Alinea, 12, 2));
    TipoExterno := Trim(copy(Alinea, 14, 1));
    Calle := Trim(copy(Alinea, 15, 60));
    NumeroPuerta := Trim(copy(Alinea, 75, 6));
    Torre := Trim(copy(Alinea, 81, 5));
    Bloque := Trim(copy(Alinea, 86, 5));
    Piso := Trim(copy(Alinea, 91, 5));
    Departamento := Trim(copy(Alinea, 96, 5));
    CodigoPostal := Trim(copy(Alinea, 101, 8));
    Localidad := Trim(copy(Alinea, 109, 60));
    Provincia := Trim(copy(Alinea, 169, 2));
    Sucursal := Trim(copy(Alinea, 171, 5));
    Actividad := Trim(copy(Alinea, 176, 6));
    if (Trim(copy(Alinea, 182,  10)) = '9999-12-31') or (Trim(copy(Alinea, 182,  10)) = '0001-01-01') then
      FechaHoraMovimiento := 0
    else
      FechaHoraMovimiento:= GetFechaParseada(Trim(copy(Alinea, 182,  10)));
    HoraMovimiento := Trim(copy(Alinea, 193, 8));
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}

function ParsearLineaDeterminativa(ALinea : String) : TLineaDeterminativa;
begin
  with result do
  begin
    Cuit     := Trim(copy(Alinea, 1,  11));
    Periodo  := periodo2000(Trim(copy(Alinea, 12,  4)));
    NumeroObligacion := Trim(copy(Alinea, 16,  2));
    SecuenciaObligacion := StrToIntDef(Trim(copy(Alinea, 28,  3)), 0);
    Banco := Trim(copy(Alinea, 31,  3));
    FechaPresentacion := GetFechaParseada(Trim(copy(Alinea, 37,  10)));
    CodRect  := Trim(copy(Alinea, 47,  1));
    Alicuota := StrToCurrDef(Trim(copy(Alinea, 48,  5)), 0) / 1000;
    CuotaFija := StrToCurrDef(Trim(copy(Alinea, 53,  5)), 0) / 100;
    PagoTotal := StrToCurrDef(Trim(copy(Alinea, 58,  14)), 0) / 100;
    CodArt := Trim(copy(Alinea, 72,  5));
    PersonalTemporario := Trim(copy(Alinea, 170,  1));
    Version := Trim(copy(Alinea, 261,  2));
    CantidadEmpleados :=  StrtoIntDef(Trim(copy(Alinea, 308,  7)), 0);
    Masa := StrToCurrDef(Trim(copy(Alinea, 315,  17)), 0) / 100;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParsearLineaSinPersonal(ALinea : String) : TLineaSinPersonal;
begin
  with result do
  begin
    Cuit     := Trim(copy(Alinea, 1,  11));
    Periodo  := Trim(copy(Alinea, 12,  6));
    FechaPresentacion := GetFechaParseada(Trim(copy(Alinea, 18,  10)));
    CodArt   := CODIGOPROVINCIAART;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
(*
function ParsearLinea(const ATipoFormulario : integer; const ALinea : String) : TLineaParseada;
begin
  if ATipoFormulario = FORMULARIOSUSS then
    result := ParsearLineaSUSS(ALinea)
  else if ATipoFormulario = FORMULARIOMONOTRIBUTO then
    result := ParsearLineaMonotributo(ALinea)
  else if ATipoFormulario = FORMULARIOSINPERSONAL then
    result := ParsearLineaSinPersonal(ALinea)
  else if ATipoFormulario = FORMULARIOSUSSEXTENDIDO then
    result := ParsearLineaSUSSExtendido(ALinea)
  else if ATipoFormulario = FORMULARIODETERMINATIVA then
    result := ParsearLineaDeterminativa(ALinea);
end;
*)
{----------------------------------------------------------------------------------------------------------------------}
{ EExceptionDDJJ }
constructor EExceptionDDJJ.Create(const Msg, OrgMsg : string; ACode: Integer);
begin
  inherited Create(Msg);
  ErrorMessage := Msg;
  OriginalMessage := OrgMsg;
  Code := ACode;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure SeleccionDesdeHasta(AGrilla : TArtDBGrid; ACampo : string; var APeriodoDesde, APeriodoHasta : String);
var
 dataset : TDataset;
 i : integer;
begin
  dataset := AGrilla.DataSource.DataSet;
  APeriodoDesde := '999999';
  APeriodoHasta := '';

  with dataset do
  begin
    if AGrilla.SelectedRows.Count > 0 then
    begin
      for i := 0 to AGrilla.SelectedRows.Count - 1 do
      begin
        GotoBookmark(pointer(AGrilla.SelectedRows.Items[i]));
        if FieldByName(ACampo).AsString < APeriodoDesde then
          APeriodoDesde := FieldByName(ACampo).AsString;

        if FieldByName(ACampo).AsString > APeriodoHasta then
          APeriodoHasta := FieldByName(ACampo).AsString;
      end;
    end else
    begin
        if RecordCount > 0 then
        begin
          APeriodoDesde := FieldByName(ACampo).AsString;
          APeriodoHasta := FieldByName(ACampo).AsString;
        end;
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetFechaParseada(aFecha: string; Delimiter: boolean): TDateTime;
begin
  try
    if Delimiter then
      result := EncodeDate(StrtoInt(copy(aFecha,1,4)),
                           StrtoInt(copy(aFecha,6,2)),
                           StrtoInt(copy(aFecha,9,2)))
    else
      result := EncodeDate(StrtoInt(copy(aFecha,1,4)),
                           StrtoInt(copy(aFecha,5,2)),
                           StrtoInt(copy(aFecha,7,2)));
  except
    result := 0;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetCodigoArchivo(aLinea: string): String;
begin
    result := Trim(copy(aLinea, 3, 10));
    result := ValorSql('select tf_id from emi.itf_tipoformulario where tf_header like ''%' + result + '%'' ', '0');

    if result = '0' then
    begin
      result := Trim(copy(aLinea, 11, 13));
      result := ValorSql('select tf_id from emi.itf_tipoformulario where tf_header like ''%' + result + '%'' ', '0');
    end;

    if result = '0' then
    begin
      result := Trim(copy(aLinea, 1, 1))+Trim(copy(aLinea, 8, 2));
      result := ValorSql('select tf_id from emi.itf_tipoformulario where tf_header like ''%' + result + '%'' ', '0');
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetAgendarDefault(aIdFormulario: string): string;
begin
  result := ValorSql('select tf_agendar from emi.itf_tipoformulario where tf_id = ' + SqlValue(aIdFormulario), 'N');
end;
{----------------------------------------------------------------------------------------------------------------------}
function EncodeInt(const iInt: Int64): String;
var
  iVal: Int64;
  sOut: String;
begin
  iVal := iInt;
  sOut := '';

  while iVal > 26 do
  begin
    sOut := Chr(StrToInt64(IntToStr(iVal mod 26)) + 64) + sOut;
    iVal := Trunc(iVal / 26);
  end;

  if iVal > 0 then
    sOut := Chr(iVal + 64) + sOut;

  Result := sOut;
end;
{----------------------------------------------------------------------------------------------------------------------}
function EncodeContrato(Contrato: Int64): String;
var
  iLoop: Integer;
  iSum: Int64;
  sCont: String;
begin
  iSum := 0;
  Contrato := Contrato * Contrato;
  sCont := EncodeInt(Contrato);

  for iLoop := 1 to Length(sCont) do
    iSum := iSum + Ord(sCont[iLoop]);

  sCont := sCont + '|' + EncodeInt(iSum);

  Result := sCont;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ProcesandoArchivo: Boolean;
var
  Buffer: Array[0..MAX_PATH] of Char;
begin
  hSemaphore := CreateSemaphore(nil, 0, 1, StrPCopy(Buffer, PROCESING_FILE));
  Result:=(hSemaphore = 0) or (GetLastError = ERROR_ALREADY_EXISTS);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure LiberarProcesando;
begin
  if hSemaphore <> 0 then
  begin
    CloseHandle(hSemaphore);
    hSemaphore := 0;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetInstances: integer;
  function AddAllInstances(handle: THandle; List: TStringList): boolean; stdcall;
  begin
    List.Add(IntToStr(Handle)) ;
    result := true;
  end;
var
  instances : TStringList;
  sHandle : string;
  instanceHandle : THandle;
  i: integer;
  Buffer: Array[0..255] of Char;
  WindowText: String;
begin
  instances := TStringList.Create;
  try
    EnumWindows(@AddAllInstances, LParam(instances)) ;
    for i:=0 to instances.Count-1 do
    begin
      sHandle := instances[i];
      instanceHandle := StrToInt(sHandle) ;

    GetWindowText(instanceHandle, Buffer, 255);
    WindowText := StrPas(Buffer);
    if copy(WindowText, 1, 10) = Application.Title + ' - ' then
        inc(FCantidadInstancias);
    end;
  finally
    result := FCantidadInstancias;
    instances.Free;
  end;
end;
end.
