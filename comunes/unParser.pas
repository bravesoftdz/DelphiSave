unit unParser;

{------------------------------------------------------------------------------------------
 Nombre Unidad  : unParser
 Objectivo      : Encapsula el uso de un parseador. Permite enviarle parametros
                  y recibir resultado en stringlists.

 Observaciones  : La version mas nueva de la clase facilitaria algunas cosas pero
                  no la pude probar con delphi 5.

 Versiones      : 08-10-2004 Conrado. Versión Inicial.
-------------------------------------------------------------------------------------------}

interface

uses
  SysUtils, Classes, unImpoExpo, SDEngine, Cuit,
  ifps3, ifpidelphi, ifpidll2, ifpidll2runtime, ifps3debug, ifpscomp, ifps3lib_std,
  ifpiclass, ifpiclassruntime, ifpiir_std, ifpii_std, ifpiir_stdctrls, ifpii_stdctrls,
  ifpidelphiruntime, ifps3utl, ifps3lib_stdr, ifps3common,

  ifpiir_forms,
  ifpii_forms,
  ifpii_graphics,
  ifpii_controls,
  ifpii_classes,
  ifpiir_graphics,
  ifpiir_controls,
  ifpiir_classes,

  DB, DBTables;

type
    TScriptParser = Class(TObject)
    private
       FSourceCode              : String;                        //Codigo Fuente a ejecutar
       FCompilerOutput          : String;                        //Cadena de Compilacion
       FDebugOutput             : String;                        //Cadena de Debugeo
       FCompilerOutputResult    : TStringList;                   //Mensajes del Compilador
       FInputParameter          : TStringList;                   //Parametros importados al parseador
       FClassImporter           : TIFPSRuntimeClassImporter;     //Imporador de clases.
       FFields                  : TStringList;                      //Campos cuando se valida contra una db.
       procedure   Outputtxt(OutPut : TStringList; const s: string);
       procedure   OutputMsgs(Compiler : TIFPSPascalCompiler ;  OutPut : TStringList);
       procedure   SetQuery(const Value: TQuery);
       function    GetQuery() : TQuery;
       procedure   SetSourceCode(const Value: String);
       procedure   SetInputParameter(const Value: TStringList);
       function    GetProgramOutput() : TStringlist;
       function    GetProgramOutputResult() : TStringList;
       procedure   DbPreparser;

       { Devuelve un valor string para una consulta a la base de datos }
       //function ParserWriteln(Caller: TIFPSExec; p: PIFProcRec; Global, Stack: TIfList): Boolean;
    public
       constructor Create;
       destructor  Destroy; override;
       procedure   GetFieldList(dataset: TSDQuery);
       function    ParserCompile : boolean;                                                     //Compilador
       function    ParserRun : boolean;                                                         //Ejecutor
       property    Query : TQuery read GetQuery write SetQuery;                                 //Objeto auxiliar para consultas a base de dato.
       property    SourceCode : String read FSourceCode write SetSourceCode;                    //Código Fuente
       property    CompilerOutputResult : TStringList read FCompilerOutputResult;
       property    InputParameter : TStringList read FInputParameter write SetInputParameter;   //Parámetros de entrada del Programa
       property    ProgramOutput  : TStringList  read GetProgramOutput;                         //Mensajes del Programa
       property    ProgramOutputResult : TStringList  read GetProgramOutputResult;              //Resultados de la ejecución.
       property    Fields : TStringList read FFields write FFields;
    end;


implementation


var
   Dataset : TQuery;
   AProgramOutput : TStringList;
   AProgramOutputResult: TStringList;               //Resultado de la ejecución.
                                                    // Es como el Result := (script) conciderando
                                                    // a todo el script enviado en FSourceCode como una función.

{---- INICIO FUNCIONES DE PARSEADOR ------------------------------------------------------------------}

{---- INICIO FUNCIONES ADICIONALES  ------------------------------------------------------------------}
function ParserWriteln(Caller: TIFPSExec; p: PIFProcRec; Global, Stack: TIfList): Boolean;
var
  PStart: Cardinal;
begin
  if Global = nil then begin result := false; exit; end;
  PStart := Stack.Count - 1;
  AProgramOutput.Add(LGetStr(Stack, PStart));
  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParserRaiseError(Caller: TIFPSExec; p: PIFProcRec; Global, Stack: TIfList): Boolean;
var
  PStart: Cardinal;
begin
  if Global = nil then begin result := false; exit; end;
  PStart := Stack.Count - 1;
  AProgramOutputResult.Add(LGetStr(Stack, PStart));
  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetQueryIntValue(SQL : String) : integer;
var
 resultado : integer;
begin
      resultado := -1;
      if Assigned(Dataset) and Dataset.Active then begin
       Dataset.SQL.Text := SQL;
       Dataset.ExecSQL;
       if (Dataset.RecordCount > 0) and (Dataset.Fields[0].DataType in [ftSmallint, ftInteger, ftWord]) then
          resultado := Dataset.Fields[0].AsInteger;
      end;
      result := resultado;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetQueryStringValue(SQL : String) : string;
var
 resultado : string;
begin
      resultado := '';
      if Assigned(Dataset) and Dataset.Active then begin
         Dataset.SQL.Text := SQL;
         Dataset.ExecSQL;
         if (Dataset.RecordCount > 0)  then
            resultado := Dataset.Fields[0].asstring;
      end;
      result := resultado;
end;
{----------------------------------------------------------------------------------------------------------------------}
function CompareDates(InDate1, InDate2 : String) : integer;
var
 Date1, Date2 : Tdatetime;
begin
    result := -2;
    try
         Date1 := StrToDateTime(Trim(InDate1));
         Date2 := StrToDateTime(Trim(InDate2));
         if Date1 > Date2      then result := 1
         else if Date1 = Date2 then result := 0
         else if Date1 < Date2 then result := -1;
    except
        result := -2;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetNow : string;
begin
    result := DateTimeToStr( Now );
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetDaysBetween(InDate1, InDate2 : String) : integer;
var
 Date1, Date2 : Tdatetime;
begin
    try
         Date1 := StrToDateTime(Trim(InDate1));
         Date2 := StrToDateTime(Trim(InDate2));

         if InDate1 > InDate2 then
              result := trunc(Date1 - Date2)
         else result := trunc(Date2 - Date1);
    except
         result := -2;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetMonthsBetween(InDate1, InDate2 : String) : integer;
var
 Date1, Date2 : Tdatetime;
 Day1, Month1, Year1 : Word;
 Day2, Month2, Year2 : Word;
begin
    try
         Date1 := StrToDateTime(Trim(InDate1));
         Date2 := StrToDateTime(Trim(InDate2));

         DecodeDate(Date1, Year1, Month1, Day1);
         DecodeDate(Date2, Year2, Month2, Day2);

         if InDate1 > InDate2 then
              result := (Year1 - Year2) * 12 + Month1 - Month2
         else
              result := (Year2 - Year1) * 12 + Month2 - Month1;
    except
         result := -2;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetYearsBetween(InDate1, InDate2 : String) : integer;
var
 Date1, Date2 : Tdatetime;
 Day1, Month1, Year1 : Word;
 Day2, Month2, Year2 : Word;
begin
    try
         Date1 := StrToDateTime(Trim(InDate1));
         Date2 := StrToDateTime(Trim(InDate2));
         DecodeDate(Date1, Year1, Month1, Day1);
         DecodeDate(Date2, Year2, Month2, Day2);

         if InDate1 > InDate2 then result := Year1 - Year2
         else result := Year2 - Year1;
    except
         result := -2;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function Trimm(s : String) : string;
begin
    result := Trim(s);
end;
{----------------------------------------------------------------------------------------------------------------------}
function IsValidCuit(Cuit : String) : boolean;
begin
    result := IsCuit(Cuit);
end;
{----------------------------------------------------------------------------------------------------------------------}
function IsValidCuil(Cuil : String) : boolean;
begin
    result := IsCuil(Cuil);
end;
{----------------------------------------------------------------------------------------------------------------------}
function GetLength(s : String) : integer;
begin
    result := length(s);
end;



{---- FIN FUNCIONES ADICIONALES  ---------------------------------------------------------------------}


function ParserOnUses(Sender: TIFPSPascalCompiler; const Name: string): Boolean;
var
  cl: TIFPSCompileTimeClassesImporter;
begin
  if Name = 'SYSTEM' then
  begin
    TIFPSPascalCompiler(Sender).AddFunction('procedure Writeln(s: string);');
    TIFPSPascalCompiler(Sender).AddFunction('procedure RaiseError(s: string);');


    RegisterDelphiFunctionC(Sender, 'function GetQueryStringValue(SQL : String) : string;');
    RegisterDelphiFunctionC(Sender, 'function GetQueryIntValue(SQL : String) : integer;');
    RegisterDelphiFunctionC(Sender, 'function CompareDates(InDate1, InDate2 : String) : integer;');
    RegisterDelphiFunctionC(Sender, 'function GetNow : string;');
    RegisterDelphiFunctionC(Sender, 'function GetDaysBetween(InDate1, InDate2 : String) : integer;');
    RegisterDelphiFunctionC(Sender, 'function GetMonthsBetween(InDate1, InDate2 : String) : integer;');
    RegisterDelphiFunctionC(Sender, 'function GetYearsBetween(InDate1, InDate2 : String) : integer;');
    RegisterDelphiFunctionC(Sender, 'function Trimm(s : String) : string;');
    RegisterDelphiFunctionC(Sender, 'function IsValidCuil(Cuil : String) : boolean;');
    RegisterDelphiFunctionC(Sender, 'function IsValidCuit(Cuit : String) : boolean;');
    RegisterDelphiFunctionC(Sender, 'function GetLength(s : String) : integer;');

    Sender.AddConstantN('NaN', 'extended')^.Value.Value := transExtendedtoStr(0.0 / 0.0);
    Sender.AddConstantN('Infinity', 'extended')^.Value.Value := transExtendedtoStr(1.0 / 0.0);
    Sender.AddConstantN('NegInfinity', 'extended')^.Value.Value := transExtendedtoStr(- 1.0 / 0.0);

    cl := TIFPSCompileTimeClassesImporter.Create(Sender, True);
    SIRegister_Std(Cl);
    SIRegister_Classes(Cl);
    SIRegister_Graphics(Cl);
    SIRegister_Controls(Cl);
    SIRegister_stdctrls(Cl);
    SIRegister_Forms(Cl);

    AddImportedClassVariable(Sender, 'Parameters', 'TStringList');

    RegisterStandardLibrary_C(Sender);
    Result := True;
  end
  else
  begin
    TIFPSPascalCompiler(Sender).MakeError('', ecUnknownIdentifier, '');
    Result := False;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function ParserExportCheck(Sender: TIFPSPascalCompiler; Proc: PIFPSProcedure; const ProcDecl: string): Boolean;
begin
  Result := TRue;
end;

{---- FIN FUNCIONES DE PARSEADOR ------------------------------------------------------------------}


constructor TScriptParser.Create;
begin
  FClassImporter := TIFPSRuntimeClassImporter.Create;
  FCompilerOutputResult := TStringList.Create;
  FInputParameter := TStringList.Create;
  FFields := TStringList.Create;

  RIRegister_Std(FClassImporter);
  RIRegister_Classes(FClassImporter);
  RIRegister_Graphics(FClassImporter);
  RIRegister_Controls(FClassImporter);
  RIRegister_stdctrls(FClassImporter);
  RIRegister_Forms(FClassImporter);
end;

destructor TScriptParser.Destroy;
begin
  FClassImporter.Free;
  FCompilerOutputResult.Free;
  FInputParameter.Free;
  FFields.Free;
end;


function TScriptParser.ParserCompile : boolean;
var
  Compiler: TIFPSPascalCompiler;
begin
  FCompilerOutputResult.Text := '';

  DbPreparser;
  Compiler := TIFPSPascalCompiler.Create;

  try
      Compiler.OnExportCheck := @ParserExportCheck;
      Compiler.OnUses := @ParserOnUses ;
      Compiler.OnExternalProc := DllExternalProc;
      if Compiler.Compile(FSourceCode) then begin
            Outputtxt(FCompilerOutputResult,'Compilación Exitosa.');
            OutputMsgs(Compiler, FCompilerOutputResult);

            if not Compiler.GetOutput(FCompilerOutput) then
            begin
              Compiler.Free;
              Outputtxt(FCompilerOutputResult, '[Error] : No se pudo obtener info del compilador');
              result := false;
            end;
            Compiler.GetDebugOutput(FDebugOutput);
            result := True;

      end else begin
            Outputtxt(FCompilerOutputResult,'Error de Compilación');
            OutputMsgs(Compiler, FCompilerOutputResult);
            result := false;
      end;
  finally
       Compiler.free;
  end;
end;


{----------------------------------------------------------------------------------------------------------------------}

function TScriptParser.ParserRun : boolean;
var
    Runner :  TIFPSDebugExec;
begin
    Runner := TIFPSDebugExec.Create;

    ProgramOutput.Clear;
    ProgramOutputResult.Clear;

    result := false;

    try
      RegisterDLLRuntime(Runner);
      RegisterClassLibraryRuntime(Runner, FClassImporter);

{      if sender <> nil then  Runner.OnRunLine := RunLine;}

      Runner.RegisterFunctionName('WRITELN', ParserWriteln, nil, nil);
      Runner.RegisterFunctionName('RAISEERROR', ParserRaiseError, nil, nil);

      RegisterDelphiFunctionR(Runner, @GetQueryIntValue , 'GETQUERYINTVALUE', cdRegister);
      RegisterDelphiFunctionR(Runner, @GetQueryStringValue , 'GETQUERYSTRINGVALUE', cdRegister);
      RegisterDelphiFunctionR(Runner, @CompareDates , 'COMPAREDATES', cdRegister);
      RegisterDelphiFunctionR(Runner, @GetNow , 'GETNOW', cdRegister);
      RegisterDelphiFunctionR(Runner, @GetDaysBetween, 'GETDAYSBETWEEN', cdRegister);
      RegisterDelphiFunctionR(Runner, @GetMonthsBetween, 'GETMONTHSBETWEEN', cdRegister);
      RegisterDelphiFunctionR(Runner, @GetYearsBetween, 'GETYEARSBETWEEN', cdRegister);
      RegisterDelphiFunctionR(Runner, @Trimm, 'TRIMM', cdRegister);
      RegisterDelphiFunctionR(Runner, @IsValidCuil, 'ISVALIDCUIL', cdRegister);
      RegisterDelphiFunctionR(Runner, @IsValidCuit, 'ISVALIDCUIT', cdRegister);
      RegisterDelphiFunctionR(Runner, @GetLength, 'GETLENGTH', cdRegister);

      RegisterStandardLibrary_R(Runner);

      if not Runner.LoadData(FCompilerOutput) then begin
        Outputtxt(ProgramOutput, '[Error] : No puede leerse los datos: '+TIFErrorToString(Runner.ExceptionCode, Runner.ExceptionString));
        exit;
      end;
      Runner.LoadDebugData(FDebugOutput);

      SetVariantToClass(Runner.GetVarNo(Runner.GetVar('PARAMETERS')), FInputParameter);

      Runner.RunScript;
      if Runner.ExceptionCode <> erNoError then
        Outputtxt(ProgramOutput, '[Runtime Error] : ' + TIFErrorToString(Runner.ExceptionCode, Runner.ExceptionString) +
          ' in ' + IntToStr(Runner.ExceptionProcNo) + ' at ' + IntToSTr(Runner.ExceptionPos))
      else begin
        OutputTxt(ProgramOutput, 'Ejecutado Exitosamente');
        result := true;
      end;

    finally
      Runner.Free;
    end;
end;



{----------------------------------------------------------------------------------------------------------------------}

procedure TScriptParser.Outputtxt(OutPut : TStringList; const s: string);
begin
    OutPut.add(s);
end;

{----------------------------------------------------------------------------------------------------------------------}

procedure TScriptParser.OutputMsgs(Compiler : TIFPSPascalCompiler ;  OutPut : TStringList);
var l: Longint;
begin
    for l := 0 to Compiler.MsgCount - 1 do
      OutputTxt(OutPut, IFPSMessageToString(Compiler.Msg[l]));
end;

{----------------------------------------------------------------------------------------------------------------------}


procedure TScriptParser.SetQuery(const Value: TQuery);
begin
  Dataset := Value;
end;

function TScriptParser.GetQuery: TQuery;
begin
  Result := Dataset;
end;



procedure TScriptParser.SetSourceCode(const Value: String);
begin
  FSourceCode := Value;
end;

procedure TScriptParser.SetInputParameter(const Value: TStringList);
begin
  FInputParameter := Value;
end;

function TScriptParser.GetProgramOutput() : TStringList;
begin
    Result := AProgramOutput;
end;


function TScriptParser.GetProgramOutputResult: TStringList;
begin
   Result := AProgramOutputResult;
end;



procedure TScriptParser.DbPreparser;
var
 i : integer;
begin
  if ( Assigned(FFields) ) then
    for i := 0 to FFields.Count - 1 do
       FSourceCode := StringReplace(FSourceCode, FFields[i],
                                    format('Parameters.strings[%d]',[i]), [rfIgnoreCase,rfReplaceAll] );

end;


procedure TScriptParser.GetFieldList(dataset : TSDQuery);
begin
      FFields.Clear;
      dataset.First;
      while not dataset.Eof do begin
          FFields.Add(':' + FIELD_PARAM + dataset.FieldByName('AC_NOMBRE').AsString);
          dataset.Next;
      end;
end;



initialization
  AProgramOutput        := TStringList.Create;
  AProgramOutputResult  := TStringList.Create;
finalization
  FreeAndNil(AProgramOutput);
  FreeAndNil(AProgramOutputResult);
end.


