unit unExpoImpoUtils;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls,  Dialogs, md5,
  StdCtrls, ConditionParser, Db, SDEngine, ImageListBox,
  PatternEdit, QueryToFile, Placemnt, unDmMonitor, CheckLst,
  ImgList, FormPanel, FilePlano, FileReader, ExpAcciones,
  DBFileReader, SqlFuncs, LogFile, unZipDll, ToolEdit, General,
  DateTimeEditors, unArt, StrFuncs, unParser, unDirUtils;

type
  TParametrosComando = array of variant;

  PPathRecord = ^TPathRecord;
  TPathRecord = record
    Caption   : TLabel;
    Editor    : TFileDirEdit;
    Accion    : TExpFiles;
  end;

  PParamRecord = ^TParamRecord;
  TParamRecord = record
    Caption   : TLabel;
    Editor    : TWinControl;
    ParamName : String;
    FieldType : TFieldType;    // Tipo de Campo     (se usa para crear los parámetros según el tipo de dato)
  end;

  TImpoExpoUtility = class
    procedure QueryToFileBeforeExportRecord(Sender: TObject; var Cancel: Boolean);
    procedure QueryToFileAfterExportRecord(Sender: TObject);
    procedure sdqExportacionBeforeScroll(DataSet: TDataSet);
    procedure DBFileReaderExecuteSql(Sender: TObject; Sql: TCustomSql);
  private
    lstProcesos: TStringList;
    clbExportar: TStringList;
    Acciones        : TExportActions;
    Eventos         : TExportActions;
    EventParams     : TParams;
    ConditionParser : TConditionParser;
    ParamList       : TList;
    TableList       : TList;
    PathList        : TList;
    ReadPath        : String;
    ReadProcessPath : String;

    iTransaction,
    iRecCount       : Integer;

    iErrDetected,                {Cantidad registros detectados por Errores en los Eventos}
    iErrIgnore,                  {Cantidad registros ignorados por Errores en los Eventos}
    iErrSkip        : Integer;   {Cantidad registros salteados por Errores en los Eventos}
    LogFile         : TLogFile;  {Archivo con el Log de Errores}

    bWithErrors       : Boolean;

    TempFiles : TStringList;


    FProcessMessages : String;
    FDirectorioProcesados : String;


    procedure DestroyParametros;


    procedure DoLimpiarAcciones;

    procedure RecuperarValorParametros(ADataSet: TSDQuery; AParams: TParams);

    procedure ArmarConsulta(Query : TSDQuery; Params : TParams; ExportAction : TExportAction);
    procedure ExportarArchivo(ExpFiles : TExpFiles);
    procedure LeerArchivo(ExpFiles : TExpFiles);
    procedure CargarCampos(Archivo : Integer; ACampos : TCollection);
    procedure CargarEventos(ExpFiles: TExpFiles);
    function DispararEventos(Moment : TMoment; ADataLine : String = '') : Boolean;
    procedure DescomprimirArchivo(AFileName, AOutputPath : String);

    procedure DeleteTempFiles;
{$IFDEF SCRIPTING}
    procedure ArmarScript(Parser : TScriptParser; Params : TParams; ExportAction: TExportAction);
{$ENDIF}
{$IFDEF MD5}
    procedure SaveMD5(sFileName, MD5 : string);
    procedure LoadMD5(sFileName : string; var MD5 : string; var position : integer);
    function  CalculateMD5(sFileName : string; Fields : TCollection) : string;
    function  CompareMD5(CalculatedMD5, ExpectedMD5 : string) : boolean;
    function  GetFileTypeMD5(AFileName: string): integer;
{$ENDIF}
    procedure ArmarParametrosPorParametro(sCodigo, sIDPROCESO, sDirectorio: string; Login : TLoginData);
    procedure CargarAccionesPorParametro(sFullFileName, sModoLectura: String; sCodigo : string);
    procedure CargarAccionesSeleccionadasPorParametros(sModoLectura: string);
    procedure DoLimpiarSeleccionArchivosPorParametro(sFullFileName: String; sModoLectura: char; APathImport: string);

    function ProcesarExportacionPorParametro: Boolean;

    procedure sdqExportacionAfterScroll(DataSet: TDataSet);
    class procedure HeaderFileType(AFileName : string; var AFileType : integer; var  AProcessCode, AFileMode : string; var AProcessId : integer);
    class procedure GetProcessValues(AMD5: string; var AFileType : integer; var AProcessCode,  AFileMode: string; var AProcessId: integer);
    procedure ProcesarPorParametros(sIDProceso, sCodigo, sDirectorioExport, sDirectorioImport, sNombreArchivo, sModoLectura : string;
                                    Login : TLoginData; sDirectorioImportProcess: string);
    function GetParam(index : integer): TParam;
    function GetParamCount: integer;
    procedure GuardarArchivoProcesados(sFullFileName, Directory: string);
//    function GetDirectorioProcesados(sFullFileName: string): string;
    function ArmarDirectorio(Path: string): string;
    function ParseDateTime(str: string): string;

  public
    property  Params[Index : integer] : TParam read GetParam;
    property  ParamsCount : integer read GetParamCount;
    property  ProcessMessages : string read FProcessMessages;

    class procedure GetFileType(AFileName: string; var AFileType : integer; var  AProcessCode, AFileMode : string; var AProcessId : integer);
    constructor Create;
    destructor Destroy; override;
    function Procesar : boolean;
    procedure InitParametros(sIDProceso, sCodigo, sDirectorioExport, sDirectorioImport, sNombreArchivo,
                             sModoLectura: string; Login: TLoginData; sDirectorioImportProcess: string);
  end;

  function ZipCallBack(ZCallbackRec: PZCallBackStruct): LongBool; stdcall;

implementation

uses
  CustomDlgs, unDmPrincipal, AnsiSql, Math,
  unImpoExpo, unRtti, unArjDll, ArchFuncs, Numeros, unParams;

Const
  MIN_LEFT      = 130; {Mínima posición izquierda de los Parametros y Archivos}

  IMG_EMPTY     = 0;
  IMG_WAIT      = 1;
  IMG_OK        = 2;
  IMG_ERROR     = 3;
  IMG_SAVE      = 4;
  IMG_PROCEDURE = 5;
  IMG_FUNCTION  = 6;
  IMG_DISABLED  = 7;

  PAGE_DIRECTORIO = 0;
  PAGE_PARAMETROS = 1;
  PAGE_TABLAS     = 2;
  PAGE_ARCHIVOS   = 3;
  PAGE_PROCESOS   = 4;
  PAGE_REPORTE    = 5;
  PAGE_FIN        = 6;

  LOG_EXTENCION   = '.LOG';

  FMT_FECHAHORA   = 'dt';

ResourceString
  TXT_DESCOMPRIMIR = 'Descompresión del Archivo';

{----------------------------------------------------------------------------------------------------------------------}
function ZipCallBack(ZCallbackRec: PZCallBackStruct): LongBool;
begin
  with ZCallbackRec^, TImpoExpoUtility(ZCallbackRec^.Caller) do
  begin
     Case ActionCode of
       1: begin
            TempFiles.Add(IncludeTrailingBackslash(GetCurrentDir) + FileNameOrMsg);
          end;
     end;
  end;
  Result := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TImpoExpoUtility.Create;
begin
   ConditionParser := TConditionParser.Create ;
   ConditionParser.AutoParams := False;

   lstProcesos := TStringList.Create;
   clbExportar := TStringList.Create;

   ParamList       := TList.Create;
   TableList       := TList.Create;
   PathList        := TList.Create;
   Acciones        := TExportActions.Create;
   Eventos         := TExportActions.Create;
   EventParams     := TParams.Create ;
   LogFile         := TLogFile.Create;
   TempFiles       := TStringList.Create;

   dmMonitor.DBFileReader.ExecuteSql := DBFileReaderExecuteSql;
end;
{----------------------------------------------------------------------------------------------------------------------}
destructor TImpoExpoUtility.Destroy;
begin
   DestroyParametros;
   DoLimpiarAcciones;
   DeleteTempFiles;

   ConditionParser.Free;

   ParamList.Free;
   TableList.Free;
   PathList.Free;
   Acciones.Free;
   Eventos.Free;
   EventParams.Free;
   LogFile.Free;
   TempFiles.Free;
end;
{----------------------------------------------------------------------------------------------------------------------}

{--[ Libera Todos los objetos creados para mostrar los parámetros y limpia la lista ]----------------------------------}
procedure TImpoExpoUtility.DestroyParametros;
var
  i: Integer;
begin
  for i := 0 to ParamList.Count - 1 do
    with PParamRecord(ParamList[i])^ do
    begin
      Editor.free;
      Caption.free;
      Dispose(PParamRecord(ParamList[i]))
    end;
  ParamList.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.DoLimpiarAcciones;
begin
   Acciones.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.ArmarConsulta(Query : TSDQuery; Params : TParams; ExportAction: TExportAction);
var
  i: Integer;
  Param: TParam;
begin
  Query.Close ;
  Query.Params.Clear ;
  if ExportAction.ParamCheck then
  begin
    Query.ParamCheck := True;
    Query.Params.Assign(Params);
  end else Query.ParamCheck := False;

  CopySqlClp(ExportAction.Sql);
  Query.SQL.Text := ExportAction.Sql ;

  { Esto es porque cuando se setea el Sql todos los parámetros InputOutput mágicamente pasan a ser Input }
  for i := High(PARAMETROS_FIJOS)-1 to Params.Count -1 do
  begin
    Param := Query.Params.FindParam(Params[i].Name);
    if Assigned(Param) and (Param.ParamType <> Params[i].ParamType) Then
      Param.ParamType := Params[i].ParamType;
  end;

  repeat
    Param := Query.Params.FindParam('=');
    if Assigned(Param) Then
      Query.Params.Delete(Param.Index);
  until not Assigned(Param);

  repeat
    Param := Query.Params.FindParam('');
    if Assigned(Param) Then
      Query.Params.Delete(Param.Index);
  until not Assigned(Param);

end;
{----------------------------------------------------------------------------------------------------------------------}
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.CargarCampos(Archivo : Integer; ACampos : TCollection);
var
  sSql       : String;
  sdqCampos  : TSDQuery;
begin
  ACampos.Clear ;
  sSql       := 'SELECT ac_titulo, ac_nombre, ac_alineacion, ac_fillchar, ac_ancho, ac_condicion ' +
                  'FROM iac_archivocampo ' +
                 'WHERE ac_idarchivo = :Arch ' +
             ' ORDER BY ac_orden';
  sdqCampos  := GetQueryEx(sSql, [Archivo]);
  try
    repeat
       ConditionParser.Condition := Trim(sdqCampos.FieldByName('AC_CONDICION').AsString);
       if (ConditionParser.Condition = '') or ConditionParser.Result then
       begin
         if ACampos is TQTFFields then
           with TQTFField(ACampos.Add) do { Archivos de Escritura }
           begin
                Title       := sdqCampos.FieldByName('AC_TITULO').AsString;
                FixedLength := sdqCampos.FieldByName('AC_ANCHO').AsInteger;
                Case GetChar(sdqCampos.FieldByName('AC_ALINEACION').AsString) of
                     'R': Alignment := taRightJustify;
                     'L': Alignment := taLeftJustify;
                     'C': Alignment := taCenter;
                end;
                FillChar    := GetChar(sdqCampos.FieldByName('AC_FILLCHAR').AsString);
                if FillChar = #0 Then FillChar := ' ';
                DataField   := sdqCampos.FieldByName('AC_NOMBRE').AsString;
           end
         else if ACampos is TDBFileReaderFields Then { Archivos de Lectura }
           with TDBFileReaderField(ACampos.Add) do
           begin
             DataField   := sdqCampos.FieldByName('AC_NOMBRE').AsString;
             Length      := sdqCampos.FieldByName('AC_ANCHO').AsInteger;
             case GetChar(sdqCampos.FieldByName('AC_ALINEACION').AsString) of
               'R': Trim := [ttLeft];
               'L': Trim := [ttRight];
               'C': Trim := [ttLeft, ttRight];
             end;
             EventParams.CreateParam(ftString, FIELD_PARAM + DataField, ptInput); //ptUnknown
           end;
       end;

       sdqCampos.Next;
    until sdqCampos.Eof ;
  finally
    sdqCampos.Free ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}

procedure TImpoExpoUtility.CargarEventos(ExpFiles: TExpFiles);
var
  ExpEvent : TExpEvent;
  i        : Integer;
  Param    : TParam;
  function GetParam(AParamName : String) : TParam;
  begin
    Result := ConditionParser.Params.FindParam(AParamName);
    if not Assigned(Result) Then
      Result := ConditionParser.Params.CreateParam(ftString, AParamName, ptInput);
  end;
begin
    Eventos.Clear ;
    with dmMonitor do
    begin
      sdqConsultas.Close;
      sdqConsultas.Sql.Text := 'SELECT AE_MOMENTO, AE_ACCIONERROR, AE_SQL, AE_USARPARAMETROS ' +
{$IFDEF SCRIPTING}             ', AE_SCRIPT ' + {$ENDIF}
                                 'FROM IAE_ARCHIVOEVENTO ' +
                                'WHERE AE_IDARCHIVO = ' + SqlInt(ExpFiles.FileId) +
                                 ' AND AE_FECHABAJA IS NULL ' +
                                 ' AND AE_TIPOACCION IN (''B'' , ''' + FileModeToChar(ExpFiles.FileMode) + ''') ' +
                                'ORDER BY AE_ORDEN'; //AE_MOMENTO DESC,
      OpenQuery(sdqConsultas);

      while not sdqConsultas.EOF do
      begin
        ExpEvent := TExpEvent.Create;

        Case ArrayPos(sdqConsultas.FieldByName('AE_MOMENTO').AsString, TE_MOMENTOS) of
           0: ExpEvent.Moment := mFileBefore;
           1: ExpEvent.Moment := mFileAfter;
           2: ExpEvent.Moment := mRecordBefore;
           3: ExpEvent.Moment := mRecordAfter;
        end;

        Case ArrayPos(sdqConsultas.FieldByName('AE_ACCIONERROR').AsString, ['C', 'S', 'I', 'M', 'E']) of
           0: ExpEvent.ErrorAction := eaHalt;
           1: ExpEvent.ErrorAction := eaSkipRecord;
           2: ExpEvent.ErrorAction := eaIgnore;
           3: ExpEvent.ErrorAction := eaMessage;
           4: ExpEvent.ErrorAction := eaExploreHoleFile;
        end;

        ExpEvent.Sql        := sdqConsultas.FieldByName('AE_SQL').AsString;
    {$IFDEF SCRIPTING}
        ExpEvent.Script     := sdqConsultas.FieldByName('AE_SCRIPT').AsString;
    {$ENDIF}
        ExpEvent.ParamCheck := sdqConsultas.FieldByName('AE_USARPARAMETROS').AsString = SQL_TRUE;

        Eventos.Add(ExpEvent);

        sdqConsultas.Next ;
      end;
      sdqConsultas.Close;

      { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -}
      GetParam(PARAM_ACTIONMODE).AsString := IIF(ExpFiles.FileMode = fmRead, 'R', 'W');
      GetParam(PARAM_FILENAME  ).AsString := '';

      EventParams.Clear ;
      if Eventos.Count > 0 Then
      begin
         iTransaction := ExpFiles.Transaction;

         { Crea los Parámetros para los Eventos }
         EventParams.Assign(ConditionParser.Params);
//       EventParams.CreateParam(ftString, PARAM_ACTIONMODE, ptUnknown).AsString := IIF(ExpFiles.FileMode = fmRead, 'R', 'W');

         { Crea los parámetros porpios de los eventos }
         EventParams.CreateParam(ftInteger, PARAM_EV_RECNUMBER, ptInput);
         EventParams.CreateParam(ftInteger, PARAM_EV_RECPROC, ptInput);
         EventParams.CreateParam(ftInteger, PARAM_EV_ERRRORCOUNT, ptInput);

         for i := 0 to sdqExportacion.Fields.Count -1 do
         begin
            Param := TParam.Create(EventParams);
            Param.Name     := FIELD_PARAM + sdqExportacion.Fields[I].FieldName ;
            Param.DataType := sdqExportacion.Fields[I].DataType ;
            Param.ParamType := ptInput;

            EventParams.AddParam(Param);
         end;
         //Param := Nil;
      end else
         iTransaction := -1;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TImpoExpoUtility.DispararEventos(Moment : TMoment; ADataLine : String = '') : Boolean;
Var iEv  : Integer;
    sErr : String;
{$IFDEF SCRIPTING}
    Parser : TScriptParser;
{$ENDIF}
begin
 with dmMonitor do begin
   Result := True;
   sErr   := 'Inicio';
   for iEv := 0 to Eventos.Count - 1 do begin
      if TExpEvent(Eventos[iEv]).Moment = Moment Then
        Try

{$IFDEF SCRIPTING}
           if trim(Eventos[iEv].Script) <> '' then begin
               Parser := TScriptParser.Create;
               sErr := 'Armando Script';
               ArmarScript(Parser, EventParams, Eventos[iEv]);

               sErr := 'Compilando Script';
               if Parser.ParserCompile then begin
                   //Carga los parametros de ingreso del script;
                   sErr := 'Ejecutando Script';
                   if Parser.ParserRun then begin
                      if Parser.ProgramOutputResult.count > 0 then begin
                            sErr := Parser.ProgramOutputResult.Text;
                            raise Exception.Create('Se encontraron los siguientes errores:' + CRLF);
                      end;
                   end else raise Exception.Create('Error de ejecución del script de evento');
               end else raise Exception.Create('Error al compilar el script de evento');
           end;
{$ENDIF}


           sErr := 'Armando Consulta';
           ArmarConsulta(sdqConsultas, EventParams, Eventos[iEv]);
           sErr := 'Ejecutando Consulta';
           sdqConsultas.ExecSQL;

           RecuperarValorParametros(sdqConsultas, EventParams);
           RecuperarValorParametros(sdqConsultas, ConditionParser.Params);

           sErr := '';
        Except
           On E: Exception do begin
              if sErr <> '' Then
                 sErr := #13 + sErr;

              Case TExpEvent(Eventos[iEv]).ErrorAction of
                eaIgnore:
                begin
                  if LogFile.FileName <> '' Then
                  begin
                    if ADataLine <> '' Then
                      LogFile.WriteLine(ADataLine);

                    LogFile.WriteLine('#Atención - ' + E.Message + sErr);
                  end;
                  Inc(iErrIgnore);
                end;
                eaHalt:
                begin
                  RollBack(True);
                  Raise Exception.Create('Error al Ejecutar el Evento: ' + #13 +  E.Message + ' ' +  sErr);
                end;
                eaSkipRecord:
                begin
                  if LogFile.FileName <> '' Then
                  begin
                    if ADataLine <> '' Then
                      LogFile.WriteLine(ADataLine);

                    LogFile.WriteLine('#Error - ' + E.Message + sErr);
                  end;
                  Inc(iErrSkip);
                  Result := False;
                  Break;
                end;
                eaMessage:
                begin
                      if MsgBox(E.Message + #13 + #13 + 'Si desea continuar con el proceso, presione Aceptar, de lo contrario Cancelar', MB_OKCANCEL + MB_ICONEXCLAMATION) = IDCANCEL Then
                      begin
                          RollBack(True);
                          Raise;
                      end;
                end;
                eaExploreHoleFile:
                begin
                  if LogFile.FileName <> '' Then
                  begin
                        if LogFile.FileName <> '' Then
                        begin
                          if ADataLine <> '' Then
                            LogFile.WriteLine(ADataLine);

                          LogFile.WriteLine('#Error - ' + E.Message + sErr);
                        end;
                  end;
                  Inc(iErrDetected);
                  Result := False;
                end;
              end;{Case}
           end;
        end;
   end;
 end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.QueryToFileBeforeExportRecord(Sender: TObject; var Cancel: Boolean);
begin
    Cancel := not DispararEventos(mRecordBefore);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.QueryToFileAfterExportRecord(Sender: TObject);
begin
    DispararEventos(mRecordAfter);
    Inc(iRecCount);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.sdqExportacionBeforeScroll(DataSet: TDataSet);
begin
     with dmMonitor do begin
        if (iTransaction > 0) and (((Integer(QueryToFile.RecNo) -1 ) mod iTransaction) = 0) Then
        begin
          CommitTrans(True);
          BeginTrans;
        end
     end;
end;

procedure TImpoExpoUtility.LeerArchivo(ExpFiles: TExpFiles);
var
  iFileCount: Integer; // Numero de Archivo
  sFileName: String;

{$IFDEF MD5}
  iPos: integer;
  sExpectedMD5: String;
{$ENDIF}
begin
  with dmMonitor, ExpFiles do
  begin
    DBFileReader.Sql.TableName := TableName;
    DBFileReader.MaxRows       := MaxRecords;

    if SaveHeaders then
      DBFileReader.HeaderRows := 1
    else
      DBFileReader.HeaderRows := 0;

    if (Separator = #0) and (Quote = #0) then
    begin
      DBFileReader.FileType  := ftFixed;
    end
    else
    begin
      DBFileReader.FileType  := ftSeparated;
      DBFileReader.Separator := Separator;
      DBFileReader.Quote     := Quote;
    end;

    CargarEventos(ExpFiles);
//       if DBFileReader.FileType = ftFixed Then {Carga los campos igual porque ahí arma los parámetros}
    CargarCampos(ExpFiles.FileId, DBFileReader.Fields);

    try
      iRecCount := 0;
      if iTransaction > -1 then
        BeginTrans(True);
      try
        iFileCount   := 1; // Comienza a numerar los archivos desde el 1
        sFileName    := '';
        DispararEventos(mFileBefore);
        repeat
          if ExpFiles.FullFileName <> '' then
          begin
            if iFileCount > 1 then
              Break; {Solo un Archivo}
            sFileName := ExpFiles.FullFileName;
          end
          else
          begin
            if sFileName = ReadPath + Format(ExpFiles.FileName, [iFileCount]) then
              Break; {Solo un Archivo}
            sFileName   := ReadPath + Format(ExpFiles.FileName, [iFileCount]);
          end;
//FIXME -- Tener en cuenta el directorio.
//
//                   sFileName := IncludeTrailingBackslash(edDirectorio.Text) + Format(ExpFiles.FileName, [iFileCount]);

//                   lbArchivo.Caption := Format(ExpFiles.FileName, [iFileCount]);
//                   lbArchivo.Hint    := sFileName;

          if FileExists(sFileName) then
          begin
            if LogErrors then
              LogFile.FileName := sFileName + LOG_EXTENCION
            else
              LogFile.FileName := '';

            iErrDetected := 0;
            iErrIgnore   := 0;
            iErrSkip     := 0;
            bWithErrors  := False;

            if Eventos.Count > 0 then
              EventParams.ParamByName(PARAM_FILENAME).Value := sFileName;



                        //Esto seria preferible modificando QueryToFile y
                        //Sobrecargar SaveFile para que agregue el MD5 desde
                        //ahi .. como no tengo acceso hago esto.
{$IFDEF MD5}
            if FirmaDigital then
            begin
              LoadMD5(sFileName, sExpectedMD5,  iPos);
              if Length(sExpectedMD5) = 0 then
                raise Exception.Create('No se encontro la firma en el archivo.');

              DBFileReader.MaxRows := iPos - 1;
              if not CompareMD5(CalculateMD5(sFileName, DBFileReader.Fields), sExpectedMD5) then
                raise Exception.Create('La firma y los datos no coinciden.');
            end;
{$ENDIF}

            if DBFileReader.ReadFile(sFileName) then
            begin
              if not IsEmptyString(FDirectorioProcesados) then
                GuardarArchivoProcesados(sFileName, FDirectorioProcesados);

              Inc(iFileCount);
{$IFDEF MSACCESS}
              if (bWithErrors) then
                Rollback(True);
{$ENDIF}
              if iTransaction > -1 then
                CommitTrans(True);
//                          // edReporte.Lines.Add(#9 + 'Archivo Leido: ' + sFileName);
            end
            else
              raise Exception.CreateFmt('Error al leer el archivo ''%s''', [sFileName]);
          end;
        until not FileExists(sFileName);

        DispararEventos(mFileAfter);
        RecuperarValorParametros(sdqConsultas, ConditionParser.Params);
        CommitTrans(True);
      except
        if iTransaction > -1 then
          RollBack(True);
        raise;
      end;
    finally
      Eventos.Clear;      {Limpia los eventos para que no los cargue cuando abre un nuevo query}
      EventParams.Clear;
    end;
  end;
end;

procedure TImpoExpoUtility.DBFileReaderExecuteSql(Sender: TObject; Sql: TCustomSql);
Var i : Integer;
{$IFDEF MSACCESS}
    EventResult : boolean;
{$ENDIF}
begin
  with dmMonitor do begin

// Si este se incrementa puede empezar a comitar y no creo que ese sea el
// Objetivo de iTransaction. Esta se carga de AR_TRANSACCION y si es 0 no deberia comitar nunca.
//   Inc(iTransaction);

    { Carga los Valores de los parámetros por Campo }
     if Eventos.Count > 0 Then
     begin
        for i := 0 to Sql.Fields.Count -1 do
        {$IFDEF MSACCESS}
          EventParams.ParamByName(FIELD_PARAM + Sql.Fields[I].FieldName).Value := Trim(Sql.Fields[I].Value);
        {$ELSE}
          EventParams.ParamByName(FIELD_PARAM + Sql.Fields[I].FieldName).Value := Sql.Fields[I].Value;
        {$ENDIF}

        EventParams.ParamByName(PARAM_EV_RECNUMBER).AsInteger   := DBFileReader.RecNo;
        EventParams.ParamByName(PARAM_EV_RECPROC).AsInteger     := iRecCount;
        EventParams.ParamByName(PARAM_EV_ERRRORCOUNT).AsInteger := DBFileReader.RecNo - iRecCount;

        {$IFDEF MSACCESS} EventResult := {$ENDIF} DispararEventos(mRecordBefore, DBFileReader.LastLine);
        {$IFDEF MSACCESS} bWithErrors := bWithErrors or not EventResult;{$ENDIF}

     end;


     Inc(iRecCount);

     if Sql.TableName <> '' Then  begin
        EjecutarSqlST(Sql.InsertSql);


//Esto fue movido fuera del if para que cuente todos los registros #07/10/2004#
//        Inc(iRecCount);
     end;




     if (iTransaction > 0) and (((DBFileReader.RecNo -1) mod iTransaction) = 0) Then begin
             CommitTrans(True);
             BeginTrans;
      end;

     if Eventos.Count > 0 Then EventParams.ParamByName(PARAM_EV_RECPROC).AsInteger := iRecCount;

     {$IFDEF MSACCESS} EventResult := {$ENDIF} DispararEventos(mRecordAfter, DBFileReader.LastLine);
     {$IFDEF MSACCESS} bWithErrors := bWithErrors or not EventResult;{$ENDIF}
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.DescomprimirArchivo(AFileName, AOutputPath: String);
Var
  hArjFile    : LongInt;
  HeaderData  : TARJHeaderData;
  UnZipParms  : TUnZipParms;
  iErrorCount : Integer;
  sFileName   : String;
const
  pthf: Array [Boolean] of Char = (' ', '+'); // path included?
  pwdf: Array [Boolean] of Char = (' ', 'G'); // plain, encrypted
  volf: Array [Boolean] of Char = (' ', 'V'); // continued in the next volume
  extf: Array [Boolean] of Char = (' ', 'X'); // start from prior volume
begin
//   // edReporte.Lines.Add('Descomprimiendo Archivo "' + AFileName + '"');
//   // edReporte.Lines.Add('');
   {*******************************************************************************************************************}
   if UpperCase(ExtractFileExt(AFileName)) = '.ARJ' Then begin
   {*******************************************************************************************************************}
      Try
         // edReporte.Lines.Add('     Archivo     Tam.Orig  Tam.Compr. Porc.    Fecha y Hora      CRC-32  PMGVX');
         // edReporte.Lines.Add('   ------------ ---------- ---------- ----- ------------------- -------- -----');
         iErrorCount := 0;
         AOutputPath := IncludeTrailingBackslash(AOutputPath);
         LoadUnARJ;
         if not IsUnARJLoaded Then
            Raise Exception.Create('Error al inizializar la librería UNARJ.DLL')
         else
            if ARJOpenArchive(PChar(AFileName), hArjFile) = ERROR_OK Then begin
               while ARJReadHeader(hArjFile, HeaderData) = ERROR_OK do begin
                  sFileName := AOutPutPath + ExtractFileName(HeaderData.FileName);
                  if ARJProcessFile(hArjFile, ARJ_EXTRACT, nil, PChar(sFileName)) = ERROR_OK Then begin
//                     // edReporte.Lines.Add('   ' + ExtractFileName(HeaderData.FileName));
(*                      edReporte.Lines.Add('   ' + Format('%-12s %8.2fKB %8.2fKB %1.3f %s %.8x %s%d%s%s%s',
                                                          [
                                                            ExtractFileName(HeaderData.FileName),
                                                            HeaderData.UnpSize/1024,
                                                            HeaderData.PackSize/1024,
                                                            HeaderData.PackSize/HeaderData.UnpSize,
                                                            FormatDateTime('dd-mm-yyyy hh:mm:ss', FileDateToDateTime(HeaderData.FileTime)),
                                                            HeaderData.FileCRC,
                                                            pthf[HeaderData.EntryPos > 0],
                                                            HeaderData.Method,
                                                            pwdf[(HeaderData.Flags and GARBLE_FLAG) <> 0],
                                                            volf[(HeaderData.Flags and VOLUME_FLAG) <> 0],
                                                            extf[(HeaderData.Flags and EXTFILE_FLAG) <> 0]
                                                          ]));
*)
                     TempFiles.Add(sFileName);
                  end else begin
                     // edReporte.Lines.Add('   (!) Error al descomprimir el archivo ' + ExtractFileName(HeaderData.FileName));
                     Inc(iErrorCount);
                  end;
               end;
               if iErrorCount > 0 Then
                  Raise Exception.Create('Se han producido errores al descomprimir el archivo "' + AFileName + '"')
            end;
      finally
         UnloadUnARJ;
      end;
   {*******************************************************************************************************************}
   end else if UpperCase(ExtractFileExt(AFileName)) = '.ZIP' Then begin  {-------------------------------------------}
   {*******************************************************************************************************************}
      SetCurrentDir(AOutputPath);
      LoadUnZip;
      if IsUnZipLoaded Then
        Try
          UnZipParms.up2 := AllocMem(SizeOf(TUnZipParms2));
          Try

            With UnZipParms.up2^ do begin
              Version := UNZIPVERSION;      { Versión de la DLL }
              Caller  := Self;              { No usa el callback }
              fQuiet  := False;              { No usa el callback }
              ZCallbackFunc := ZipCallBack; { No usa el callback }
              Handle        := 0;
              fComments     := False;     { zipfile comments - not supported }
              fConvert      := False;     { ascii/EBCDIC conversion - not supported }

              pZipFileName  := PChar(AFileName);
              fDirectories  := False;
              fOverwrite    := True;
              fSeven := 7;
              fOverwrite := True;
              fArgc         := 0;
            end;
            UnzDllExec(Pointer(UnZipParms.up2));
          finally
            FreeMem(UnZipParms.up2 );
          end;
        finally
          UnLoadUnZip;
        end;
   {*******************************************************************************************************************}
   end else
   {*******************************************************************************************************************}
      Raise Exception.Create('El Tipo de archivo no es soportado por el sistema (' + UpperCase(ExtractFileExt(AFileName)) + ')');

   ReadPath := AOutputPath;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.DeleteTempFiles;
var
  i : Integer;
begin
  for i := 0 to TempFiles.Count -1 do
    Try
      DeleteFile(TempFiles[i]);
    except
      On E: Exception do
        ErrorMsg(E, 'Error al borrar el Archivo "' + TempFiles[i] + '".');
    end;

  TempFiles.Clear;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.RecuperarValorParametros(ADataSet: TSDQuery; AParams: TParams);
var
  i: Integer;
  AParam: TParam;
begin
  for i := 0 to ConditionParser.Params.Count -1 do
  begin
    AParam := ADataSet.Params.FindParam(AParams[i].Name);
    if Assigned(AParam) Then
      AParams[i].Value := AParam.Value;
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}

{$IFDEF SCRIPTING}
procedure TImpoExpoUtility.ArmarScript(Parser : TScriptParser; Params : TParams; ExportAction: TExportAction);
var
  i: Integer;
begin

{$IFDEF SCRIPTING}
   Parser.SourceCode := ExportAction.Script;                                    //Asigno el codigo fuente
{$ENDIF}

   Parser.InputParameter.Clear;
   Parser.Fields.Clear;
   for i := High(PARAMETROS_FIJOS)-1 to Params.Count -1 do begin
     Parser.InputParameter.Add(Params[i].Value);                                //Cargo los parametros de ingreso
     Parser.Fields.Add(':' + Params[i].Name);                                         //Indico el nombre de parametros
                                                                                //para reemplazo en el script.
   end;
end;
{$ENDIF}

{----------------------------------------------------------------------------------------------------------------------}

{$IFDEF MD5}
function TImpoExpoUtility.CalculateMD5(sFileName : string; Fields : TCollection) : string;
var
 sFieldList : String;
 sMD5 : string;
 iPos : integer;
 i : integer;
 sInputFile : TStringList;
begin
  result := '';
  //Firma de la cabecera.
  if Fields is TQTFFields Then
     for i := 0 to TQTFFields(Fields).Count - 1 do   sFieldList := sFieldList + TQTFFields(Fields)[i].DisplayName
  else if Fields is TDBFileReaderFields Then
     for i := 0 to  TDBFileReaderFields(Fields).Count - 1 do   sFieldList := sFieldList + TDBFileReaderFields(Fields)[i].DataField;


  //Si el archivo no tiene la firma.
  LoadMD5(sFileName, sMD5, iPos);
  if Length(sMD5) = 0 then
       result := '§:' + MD5Print(MD5String(sFieldList)) + ':::' + MD5Print(MD5File(sFileName))
  else begin
      sInputFile := TStringList.Create;
      try
        sInputFile.LoadFromFile(sFileName);
        sInputFile.Delete(sInputFile.Count - 1);
        result := '§:' + MD5Print(MD5String(sFieldList)) + ':::' + MD5Print(MD5String(sInputFile.Text));
      finally
         sInputFile.Free;
      end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}

procedure TImpoExpoUtility.SaveMD5(sFileName : string; MD5 : string);
var
 sOutFile : TStringList;
begin

    sOutFile := TStringList.Create;
    try
      sOutFile.LoadFromFile(sFileName);
      sOutFile.Add(MD5);
      sOutFile.SaveToFile(sFileName);
    finally
      sOutFile.free;
    end;
end;


procedure TImpoExpoUtility.LoadMD5(sFileName : string; var MD5 : string; var position : integer);
var
 sInputFile : TStringList;
begin
    sInputFile := TStringList.Create;
    try
      sInputFile.LoadFromFile(sFileName);
      if (pos('§:', sInputFile.Strings[sInputFile.Count - 1]) = 1) and
         (pos(':::', sInputFile.Strings[sInputFile.Count - 1]) > 1)  then begin
         MD5 := sInputFile.Strings[sInputFile.Count - 1];
         position := sInputFile.Count;
      end else begin
        MD5      := '';
        position := -1;
      end;

    finally
      sInputFile.free;
    end;
end;

function TImpoExpoUtility.CompareMD5(CalculatedMD5,  ExpectedMD5: string): boolean;
begin
        result := CalculatedMD5 = ExpectedMD5;
end;


function TImpoExpoUtility.GetFileTypeMD5(AFileName : string) : integer;
var MD5 : string;
    position : integer;
    val : variant;
begin
     result := -1;
     LoadMD5(AFileName, MD5, position);
     if position > -1 then begin
          val := ValorSql('select ar_id from impoexpo.iar_archivo where ar_firmacabecera = ' + MD5,'');
          if val <> '' then begin
                result := val;
          end;
     end;
end;


{$ENDIF}

{----------------------------------------------------------------------------------------------------------------------}
{---- SIN IMPLEMENTAR PARAMETROS --------------------------------------------------------------------------------------}
{----------------------------------------------------------------------------------------------------------------------}

procedure TImpoExpoUtility.ArmarParametrosPorParametro(sCodigo, sIDPROCESO, sDirectorio : string; Login : TLoginData);
var
  sSql: string;
  sdqParametros: TSDQuery;
  ParamRecord: PParamRecord;
  AFieldType: TFieldType;
//  i : integer;
begin
    DestroyParametros;
//FIXME... Averiguar que es esto..
//    ConditionParser.Condition := fraProceso.sdqDatos.FieldByName('PR_PARAMETOSCONDICION').AsString;
    ConditionParser.Params.Clear ;
    { Carga los Parámetros por Defecto }
    ConditionParser.Params.CreateParam(ftString,   PARAM_USER, ptInput).AsString        := Login.LoginName;
    ConditionParser.Params.CreateParam(ftString,   PARAM_WINUSER, ptInput).AsString     := Login.WindowsUser ;
    ConditionParser.Params.CreateParam(ftString,   PARAM_WINPC, ptInput).AsString       := Login.WindowsComputerName;
    ConditionParser.Params.CreateParam(ftString,   PARAM_HTML_CSS, ptInput).AsString    := URL_HTML_CSS;
    ConditionParser.Params.CreateParam(ftDateTime, PARAM_STARTTIME, ptInput).AsDateTime := DBDateTime;
    ConditionParser.Params.CreateParam(ftString,   PARAM_PROCESS, ptInput).AsString     := sCodigo;
    ConditionParser.Params.CreateParam(ftString,   PARAM_OUTPUT_PATH, ptInput).AsString := ArmarDirectorio(sDirectorio);



    sSql := 'SELECT PP_CODIGO, PP_DESCRIPCION, PP_TIPO, ' +
                   'PP_VISIBLE, PP_DEFAULT ' +
              'FROM IPP_PROCESOPARAMETRO ' +
             'WHERE PP_IDPROCESO = ' + SqlValue(sIDPROCESO) +
              ' AND PP_FECHABAJA IS NULL ' +
            ' ORDER BY PP_ORDEN ';

    sdqParametros := GetQuery(sSql);
    Try
//       i := 0;
       while not sdqParametros.EOF do begin
         if sdqParametros.FieldByName('PP_VISIBLE').AsString = 'S' Then
         begin
           New(ParamRecord);
           ParamRecord.ParamName      := sdqParametros.FieldByName('PP_CODIGO').AsString;


           ParamRecord.Caption         := TLabel.Create(nil);
           ParamRecord.Caption.Caption := sdqParametros.FieldByName('PP_DESCRIPCION').AsString;
           ParamRecord.Caption.Left    := 0;
           ParamRecord.Caption.Top     := 0;
           ParamRecord.Caption.Visible := True;

           ParamRecord.Editor    := TPatternEdit.Create(nil);
           ParamRecord.FieldType := ftString;

           ParamRecord.Editor.Visible       := True;
           ParamList.Add(ParamRecord);
           AFieldType := ParamRecord.FieldType;
         end else
           AFieldType := ParamToFieldType(sdqParametros.FieldByName('PP_TIPO').AsString);


         {-----------------------------------------------------------------------------------------------------------}
         { Crea el parámetro en el ConditionParser que despues se va a usar para los Querys -------------------------}
         {-----------------------------------------------------------------------------------------------------------}
         with ConditionParser.Params.CreateParam(AFieldType, sdqParametros.FieldByName('PP_CODIGO').AsString, ptInputOutput) do
         begin
           if sdqParametros.FieldByName('PP_VISIBLE').AsString <> 'S' Then
           begin
             Value := sdqParametros.FieldByName('PP_DEFAULT').Value;
             DataType := AFieldType; { Lo vuelve a asignar porque la propiedad Value lo resetea }
           end;
         end;
         {-----------------------------------------------------------------------------------------------------------}
//         inc(i);

         sdqParametros.Next;
       end;
    Finally
       sdqParametros.Free;
    end;
end;

{----------------------------------------------------------------------------------------------------------------------}
{---- SIN IMPLEMENTAR ACCIONES OPCIONALES -----------------------------------------------------------------------------}
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.CargarAccionesPorParametro(sFullFileName, sModoLectura: String; sCodigo : string);
Var
   ExportAction : TExportAction;
   i : integer;
//    iNewItem     : Integer;
//   iCheckIndex : integer;
   PathRecord   : PPathRecord;

   procedure AddPathRecord(AAccion : TExpFiles; ACaption, AText, AFilter : String);
   begin

      PathRecord := nil;
      New(PathRecord);
      PathRecord^.Caption := nil;
      PathRecord^.Editor := nil;

      PathRecord.Accion               := AAccion;

      PathRecord^.Caption              := TLabel.Create(nil);
      PathRecord^.Caption.Caption      := ACaption;
      PathRecord^.Caption.Left         := 0;
      PathRecord^.Caption.Top          := 0;
      PathRecord^.Caption.Visible      := True;

      if sModoLectura = PML_PATH Then
      begin
        PathRecord^.Editor                            := TDirectoryEdit.Create(nil);
        TDirectoryEdit(PathRecord.Editor).DialogKind := dkWin32;
      end
      else
      begin
        PathRecord^.Editor                            := TFileNameEdit.Create(nil);
        TFileNameEdit(PathRecord.Editor).Filter      := AFilter + '|' + '|Todos los Archivos (*.*)|*.*';
      end;

      PathRecord^.Editor.Top           := 0;
      PathRecord^.Editor.Left          := Max(PathRecord.Caption.Width + 5, MIN_LEFT);
      PathRecord^.Editor.Anchors       := [akLeft, akTop, akRight];
      PathRecord^.Editor.Visible       := True;

      PathRecord^.Editor.Text          := AText;

      PathRecord^.Caption.FocusControl := PathRecord.Editor;

      PathList.Add(PathRecord);
   end;

begin

  with dmMonitor do begin
    TableList.Clear ;
    sdqConsultas.Close ;
    sdqConsultas.Sql.Text := 'SELECT PA_ORDEN, PA_TIPOACCION, PA_RELACION, PA_OPCIONAL, AR_DESCRIPCION AS DESCRIPCION, ' +
                                    'AR_SQL AS SQL, ''S'' AS USARPARAMETROS, ' +
                                    'AR_MAXREGISTROS, AR_ARCHIVONOMBRE, AR_SEPARADOR, AR_CAL_TEXTO, AR_EOL, ' +
                                    'AR_EOF, AR_FILEMUSTEXISTS, AR_RECREARARCHIVO, ' +
                                    'AR_ENCABEZADO, AR_TRANSACTION, PA_TIPOARCHIVO, AR_TABLA, AR_LOG_ERRORES ' +
                                    {$IFDEF MD5}
                                    ', AR_FIRMADIGITAL ' +
                                    {$ENDIF}
                               'FROM IPA_PROCESOACCION, IAR_ARCHIVO ' +
                              'WHERE PA_IDPROCESO = ' + sCodigo + ' ' +
                                'AND PA_RELACION = AR_ID ' +
                                'AND PA_TIPOACCION = ''' + TA_FILE + ''' ' +
                                'AND AR_FECHABAJA IS NULL ' +

                              'UNION ALL ' +

                             'SELECT PA_ORDEN, PA_TIPOACCION, PA_RELACION, PA_OPCIONAL, PS_DESCRIPCION AS DESCRIPCION, PS_SQL AS SQL, PS_USARPARAMETROS AS USARPARAMETROS, ' +
                                    {$IFDEF SQLSERVER}{$ELSE}{$IFDEF MSACCESS}{$ELSE}'TO_NUMBER' + {$ENDIF}{$ENDIF} '(NULL) AS AR_MAXREGISTROS, NULL AS AR_ARCHIVONOMBRE, ' +
                                    'NULL AS AR_SEPARADOR, NULL AS AR_CAL_TEXTO, NULL AS AR_EOL, NULL AS AR_EOF, ' +
                                    'NULL AS AR_FILEMUSTEXISTS, NULL AS AR_RECREARARCHIVO, NULL AS AR_ENCABEZADO, ' +
                                    '0 AS AR_TRANSACTION, PA_TIPOARCHIVO, NULL AS AR_TABLA, NULL AS AR_LOG_ERRORES ' +
                                    {$IFDEF MD5}
                                    ', NULL AS AR_FIRMADIGITAL ' +
                                    {$ENDIF}
                              'FROM IPA_PROCESOACCION, IPS_PROCESOSERVER ' +
                             'WHERE PA_IDPROCESO = ' + sCodigo + ' ' +
                               'AND PA_RELACION = PS_ID ' +
                               'AND PA_TIPOACCION = ''' + TA_PROCESS + ''' ' +
                               'AND PS_FECHABAJA IS NULL ' +
                             'ORDER BY 1';

    OpenQuery(sdqConsultas);

    while not sdqConsultas.EOF do begin
      if sdqConsultas.FieldByName('PA_TIPOACCION').AsString = TA_PROCESS Then begin
         ExportAction := TExpProcess.Create ;
      end else begin { Archivo TA_FILE }
         ExportAction := TExpFiles.Create ;
         With TExpFiles(ExportAction) do begin
            FileId            := sdqConsultas.FieldByName('PA_RELACION').AsInteger;
            MaxRecords        := sdqConsultas.FieldByName('AR_MAXREGISTROS').AsInteger;
            FileName          := sdqConsultas.FieldByName('AR_ARCHIVONOMBRE').AsString;
            Separator         := GetChar(sdqConsultas.FieldByName('AR_SEPARADOR').AsString);
            Quote             := GetChar(sdqConsultas.FieldByName('AR_CAL_TEXTO').AsString);
            EOLChar           := GetChar(sdqConsultas.FieldByName('AR_EOL').AsString);
            EOFChar           := GetChar(sdqConsultas.FieldByName('AR_EOF').AsString);
            FileMustExists    := sdqConsultas.FieldByName('AR_FILEMUSTEXISTS').AsString = 'S';
            RecreateFile      := sdqConsultas.FieldByName('AR_RECREARARCHIVO').AsString = 'S';
            SaveHeaders       := sdqConsultas.FieldByName('AR_ENCABEZADO').AsString     = 'S';
            Transaction       := sdqConsultas.FieldByName('AR_TRANSACTION').AsInteger;
            TableName         := sdqConsultas.FieldByName('AR_TABLA').AsString;
            LogErrors         := sdqConsultas.FieldByName('AR_LOG_ERRORES').AsString    = 'S';
{$IFDEF MD5}
            FirmaDigital      := sdqConsultas.FieldByName('AR_FIRMADIGITAL').AsString   = 'S';
{$ENDIF}
            FileMode          := CharToFileMode(GetChar(sdqConsultas.FieldByName('PA_TIPOARCHIVO').AsString));
         end;
      end;
      ExportAction.Title      := sdqConsultas.FieldByName('DESCRIPCION').AsString;
      ExportAction.Sql        := sdqConsultas.FieldByName('SQL').AsString;
      ExportAction.ParamCheck := sdqConsultas.FieldByName('USARPARAMETROS').AsString = 'S';
      Acciones.Add(ExportAction);

      sdqConsultas.Next;
    end;

    for i := 0 to Acciones.Count - 1 do begin
              if (Acciones[i] is TExpFiles) and (TExpFiles(Acciones[i]).FileMode = fmRead) then
              AddPathRecord(TExpFiles(Acciones[i]),
                             TExpFiles(Acciones[i]).Title,
                             sFullFileName,'');
    end;
    ReadPath := '';
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.CargarAccionesSeleccionadasPorParametros(sModoLectura : string);
var i,
//    iCheckIndex,
    iNewItem : Integer;
begin
    lstProcesos.Clear ;

    if GetChar(sModoLectura) = PML_ZIP Then  lstProcesos.Add(TXT_DESCOMPRIMIR);

    for i := 0 to Acciones.Count -1 do begin
//        iCheckIndex := clbExportar.IndexOfObject(Acciones[i]);
        iNewItem := lstProcesos.Add(Acciones[i].Title);
        lstProcesos.Objects[ iNewItem ] := TImgIndex.Create ;
        With lstProcesos.Objects[ iNewItem ] as TImgIndex do
          UserObject := Acciones[i];
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TImpoExpoUtility.DoLimpiarSeleccionArchivosPorParametro(sFullFileName: String; sModoLectura : char; APathImport: string);
Var
   i : Integer;
begin
   ReadProcessPath := APathImport;
   for i := 0 to PathList.Count -1 do begin
      With PPathRecord(PathList[i])^ do begin
           sFullFileName := StringReplace(sFullFileName, '"','', [rfReplaceAll]);
           if sModoLectura = PML_FILES Then begin
              Accion.FullFileName := sFullFileName;
//Pablo Ver para alertas              Accion.FullFileName := IncludeTrailingBackslash(sFullFileName) + PPathRecord(PathList[i])^.Accion.FileName;
           end else if sModoLectura = PML_ZIP Then begin
              ReadPath := sFullFileName;
           end else begin { PML_PATH }
              ReadPath := IncludeTrailingBackslash(sFullFileName);
           end;
           FreeAndNil(PPathRecord(PathList[i])^.Caption);
           FreeAndNil(PPathRecord(PathList[i])^.Editor);
      end;
      Dispose(PPathRecord(PathList[i]));
   end;
   PathList.Clear;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TImpoExpoUtility.ProcesarExportacionPorParametro : Boolean;
Var i : Integer;
begin
  FProcessMessages := '';
  with dmMonitor do begin
    Try
        sdqExportacion.UniDirectional := False ;
        Result := True;
        FDirectorioProcesados := ArmarDirectorio(ReadProcessPath);
        for i := 0 to lstProcesos.Count - 1 do begin

          With lstProcesos.Objects[i] as TImgIndex do
            Try
                Try
                   if (not Assigned(UserObject)) and (lstProcesos.Strings[i] = TXT_DESCOMPRIMIR) Then
                     DescomprimirArchivo(ReadPath, TempPath)

                   else if (UserObject is TExpFiles) and (TExpFiles(UserObject).FileMode = fmRead) Then
                   begin
                     LeerArchivo(TExpFiles(UserObject));
                     FProcessMessages := FProcessMessages + CRLF + 'Registros Procesados:       ' + IntToStr(iRecCount);

                     if iErrIgnore > 0 Then begin
                         FProcessMessages := FProcessMessages + CRLF + 'Registros con Advertencias: ' + IntToStr(iRecCount);
                         result := false;
                     end;


                     if iErrSkip > 0 Then begin
                         FProcessMessages := FProcessMessages + CRLF + 'Registros no Procesados:    ' + IntToStr(iRecCount);
                         result := false;
                     end;


                     if iErrDetected > 0 Then begin
                         FProcessMessages := FProcessMessages + CRLF + 'Registros con Errores: ' + IntToStr(iErrDetected) + CRLF + 'Nota: Todo el contenido fue descartado';
                         result := false;
                     end;

                   end else
                   begin
                     ArmarConsulta(sdqExportacion, ConditionParser.Params, TExpFiles(UserObject));
                     FProcessMessages := FProcessMessages + CRLF + 'Archivo ' + lstProcesos.Strings[i];

                     if UserObject is TExpFiles Then begin
                        QueryToFile.Fields.Clear ;
                        OpenQuery(sdqExportacion);
                        if not sdqExportacion.IsEmpty Then begin

                           ExportarArchivo(TExpFiles(UserObject));
                           sdqExportacion.Close;
                           FProcessMessages := FProcessMessages + CRLF +  'Registros Procesados:       ' + IntToStr(iRecCount)
                                                                + CRLF +  'Registros con Advertencias: ' + IntToStr(iErrIgnore);
                           if iErrSkip   > 0 Then FProcessMessages := FProcessMessages + CRLF + 'Registros no Procesados:    ' + IntToStr(iErrSkip) ;
                        end else
                        FProcessMessages := FProcessMessages + CRLF + 'No se encontraron registros para procesar.';
                     end else begin
                        Try
                           BeginTrans;
                           sdqExportacion.ExecSQL;
                           RecuperarValorParametros(sdqExportacion, ConditionParser.Params);
                           CommitTrans;
                        Except
                           On E: Exception do begin
                              Rollback(True);
                              Raise;
                           end;
                        end;
                        FProcessMessages := FProcessMessages + CRLF + lstProcesos.Strings[i] + ', terminó satisfactoriamente (' + IntToStr(sdqExportacion.RowsAffected)+ ').';
                     end;
                   end;
                except
                   On E: Exception do begin
                      Result := False;
                      FProcessMessages := FProcessMessages + CRLF +  lstProcesos.Strings[i] + ', Error:' + E.Message;
                      Break;
                   end;
                end;
            finally

            end;
        end; { NEXT I }
    finally
        LogFile.CloseFile;
    end;
  end;

end;

procedure TImpoExpoUtility.ProcesarPorParametros(sIDProceso, sCodigo, sDirectorioExport, sDirectorioImport, sNombreArchivo, sModoLectura : string;
                                                   Login : TLoginData; sDirectorioImportProcess: string);
begin
   ArmarParametrosPorParametro(sCodigo, sIDProceso, sDirectorioExport, Login);
//   CargarAccionesPorParametro(sDirectorio, sModoLectura, sIDProceso);
   CargarAccionesPorParametro(sDirectorioExport, sModoLectura, sIDProceso);
   DoLimpiarSeleccionArchivosPorParametro(sDirectorioImport, GetChar(sModoLectura), sDirectorioImportProcess);
   CargarAccionesSeleccionadasPorParametros(sModoLectura);
end;

procedure TImpoExpoUtility.ExportarArchivo(ExpFiles: TExpFiles);
Var {i,}
//    iFileCount : Integer; // Numero de Archivo
    sFileName  : String;
//    sDirectorioProcesados: string;
begin
    With dmMonitor, ExpFiles do begin
       QueryToFile.MaxRecords   := MaxRecords;
       QueryToFile.SaveHeaders  := SaveHeaders ;
       QueryToFile.Separator    := Separator;
       QueryToFile.Quote        := Quote;
       QueryToFile.EOLChar      := EOLChar;
       QueryToFile.EOFChar      := EOFChar;
       QueryToFile.RecreateFile := RecreateFile;

       CargarEventos(ExpFiles);
       CargarCampos(FileId, QueryToFile.Fields);

       sdqExportacionAfterScroll(sdqExportacion);
       Try
         iRecCount    := 0;
         if iTransaction > -1 Then BeginTrans;
         Try
             DispararEventos(mFileBefore);
             if FileMode = fmWrite Then begin

               repeat

                     sFileName         := IncludeTrailingBackslash(ConditionParser.Params.ParamByName(PARAM_OUTPUT_PATH).AsString) + ExpFiles.FileName;
//                     if IsEmptyString(sDirectorioProcesados) then
//                         sDirectorioProcesados := GetDirectorioProcesados(sFileName);


                     if FileMustExists and FileExists(sFileName) Then
                        Raise Exception.Create('No se ha encontrado el archivo "' + sFileName + '" y este archivo es requerido para generar la exportación');

                     if LogErrors Then
                        LogFile.FileName := sFileName + LOG_EXTENCION
                     else
                        LogFile.FileName := '';

                     iErrIgnore       := 0;
                     iErrSkip         := 0;
                     iErrDetected     := 0;

                     if Eventos.Count > 0 Then
                     begin
                       EventParams.ParamByName(PARAM_FILENAME).Value := sFileName;

                     end;

                     ForzarCrearDirectorio(ConditionParser.Params.ParamByName(PARAM_OUTPUT_PATH).AsString);

                     if QueryToFile.SaveFile(sFileName) Then begin
                        if iTransaction > -1 Then CommitTrans(True);

{$IFDEF MD5}
                        if FirmaDigital then SaveMD5(sFileName, CalculateMD5(sFileName, QueryToFile.Fields));
{$ENDIF}

                     end else raise Exception.Create('Error al generar el archivo "' + sFileName + '".');
//                     GuardarArchivoProcesados(sFileName, sDirectorioProcesados);

               until sdqExportacion.Eof
             end else if FileMode = fmQuery then
               while not sdqExportacion.Eof do begin
                 sdqExportacion.Next ;
                 DispararEventos(mRecordBefore, DBFileReader.LastLine);
                 DispararEventos(mRecordAfter,  DBFileReader.LastLine);
                 if iTransaction > -1 Then CommitTrans(True);
               end;

             DispararEventos(mFileAfter);
         except
             if iTransaction > -1 Then RollBack(True);
             Raise;
         end;
       finally
         Eventos.Clear;      {Limpia los eventos para que no los cargue cuando abre un nuevo query}
         EventParams.Clear ;
       end;
    end;
end;


procedure TImpoExpoUtility.sdqExportacionAfterScroll(DataSet: TDataSet);
Var i : Integer;
begin
    if Eventos.Count > 0 Then
    begin
      for i := 0 to DataSet.Fields.Count -1 do
        EventParams.ParamByName(FIELD_PARAM + DataSet.Fields[I].FieldName).Value := DataSet.Fields[I].Value ;

        EventParams.ParamByName(PARAM_EV_RECNUMBER).AsInteger := DataSet.RecNo;
        EventParams.ParamByName(PARAM_EV_RECPROC).AsInteger   := iRecCount;
        EventParams.ParamByName(PARAM_EV_ERRRORCOUNT).Value   := DataSet.RecNo - iRecCount;
    end;
end;


class procedure TImpoExpoUtility.GetFileType(AFileName : string; var AFileType : integer; var  AProcessCode, AFileMode : string; var AProcessId : integer);
var
    valMD5 : variant;
begin
     valMD5 := -1;
{$IFDEF MD5}
     LoadMD5(AFileName, MD5, position);
     if position > -1 then begin
           GetProcessValues(MD5Print(MD5String(sInputFile.strings[0])), AFileType, AProcessCode, AFileMode, AProcessID);
     end;
{$ENDIF MD5}

   // Si no tiene firma md5 lo calculo por la cabecera que debe venir
   // dentro del archivo en la primera linea.
   if AProcessCode = '' then   HeaderFileType(AFileName, AFileType, AProcessCode, AFileMode, AProcessID);
end;


class procedure TImpoExpoUtility.HeaderFileType(AFileName :string; var AFileType :integer;
                                                var AProcessCode, AFileMode :string; var AProcessId :integer);
var
 sInputFile : TStringList;
 MD5        : string;
 val        : variant;
 Cabecera   : string;
 sExtension : string;
begin
  val := '';
  MD5 := '';
  sInputFile := TStringList.Create;
  try
    sInputFile.LoadFromFile(AFileName);

    //Fixme: esto no va, el archivo enviado ya deberia tener esta cabecera generado por un validador
    //no te voy a "fixear" porque el validador del lado del cliente no existe

    sExtension := UpperCase(ExtractFileExt(AFileName));

    if  (sExtension = '.PMI') then
      Cabecera := 'PROVINCIA PARTE INGRESOS'
    else if (sExtension = '.PEV') then
      Cabecera := 'PROVINCIA PARTE EVOLUTIVO'
    else if (sExtension = '.PME') then
      Cabecera := 'PROVINCIA PARTE EGRESOS'
    else if (sExtension = '.EFP') then
      Cabecera := 'PROVINCIA EVOLUCIONES DIARIAS' //CAMARILLO - 11/07/06
    else if (sExtension = '.DEN') then
      Cabecera := 'PROVINCIA DENUNCIAS DISCO'     //CAMARILLO - 02/02/07
    else if (sExtension = '.DEM') then
      Cabecera := 'PROVINCIA DENUNCIAS MANPOWER'  //CAMARILLO - 10/02/10
    else if (sExtension = '.DEB') then
      Cabecera := 'PROVINCIA DENUNCIAS BAPRO'     //CAMARILLO - 10/02/10
    else Cabecera := '';

    if sInputFile.count > 0 then
    begin
       //Fixme: esto no va, el archivo enviado ya deberia tener esta cabecera generado por un validador
       if (Cabecera = '') then
         GetProcessValues(MD5Print(MD5String(sInputFile.strings[0])), AFileType, AProcessCode, AFileMode, AProcessID)
       else
         GetProcessValues(MD5Print(MD5String(Cabecera)), AFileType, AProcessCode, AFileMode, AProcessID)
    end;
  finally
    sInputFile.free;
  end;
end;

class procedure TImpoExpoUtility.GetProcessValues(AMD5 :string; var AFileType :integer;
                                                  var AProcessCode, AFileMode :string; var AProcessId :integer);
var
 SQL : TSDQuery;
begin
   SQL := TSDQuery.Create(nil);
   try
        SQL := GetQuery('select am_id, am_idproceso, pa_tipoarchivo, pr_codigo ' +
                        'from comunes.cam_tipoarchivomensaje, impoexpo.ipa_procesoaccion, impoexpo.ipr_proceso ' +
                        '  where ' +
                        '     ipa_procesoaccion.pa_idproceso = cam_tipoarchivomensaje.am_idproceso and ' +
                        '     ipa_procesoaccion.pa_relacion =  cam_tipoarchivomensaje.am_idarchivo and ' +
                        '     ipr_proceso.pr_id = cam_tipoarchivomensaje.am_idproceso and ' +
                        '     cam_tipoarchivomensaje.am_firmacabecera = ''' + AMD5 + '''');

        AFileType    := SQL.FieldByName('am_id').AsInteger;
        AProcessCode := SQL.FieldByName('pr_codigo').AsString;
        //FIXME debe calcular el tipo de archivo.
        AFileMode    :=  'F'; // SQL.FieldByName('pr_pa_tipoarchivo').AsString;
        AProcessId   :=  SQL.FieldByName('am_idproceso').AsInteger;

   finally
      Sql.free;
   end;
end;


procedure TImpoExpoUtility.InitParametros(sIDProceso, sCodigo, sDirectorioExport, sDirectorioImport,
                                          sNombreArchivo, sModoLectura : string;
                                          Login :TLoginData; sDirectorioImportProcess: string);
begin
  ProcesarPorParametros(sIDProceso, sCodigo, sDirectorioExport, sDirectorioImport,
                        sNombreArchivo, sModoLectura, Login, sDirectorioImportProcess);
end;


function TImpoExpoUtility.Procesar: boolean;
begin
  result := ProcesarExportacionPorParametro;
end;

function TImpoExpoUtility.GetParam(index : integer): TParam;
begin
  result := nil;
  if (index > -1) and (index < ConditionParser.Params.Count) then
    if Assigned(ConditionParser.Params[index]) then
       result := ConditionParser.Params[index];
end;

function TImpoExpoUtility.GetParamCount: integer;
begin
   result := ConditionParser.Params.count;
end;

procedure TImpoExpoUtility.GuardarArchivoProcesados(sFullFileName, Directory: string);
begin
  ForzarCrearDirectorio(Directory);
  if not RenameFile(sFullFileName, IncludeTrailingBackslash(Directory) + ExtractFileName(sFullFileName)) then
    raise Exception.Create('Error al guardar archivo procesado ' + sFullFileName + ' en ' + Directory);
end;

{function TImpoExpoUtility.GetDirectorioProcesados(sFullFileName: string): string;
begin
  result := IncludeTrailingBackslash(ExtractFilePath(sFullFileName)) +
            'Procesados'  +
            '\' + FormatDateTime('yyyymm', now) + '\' +
            'Dia ' + FormatDateTime('dd', now) + '\' +
            FormatDateTime('hh.nn.ss', now);
end;}

function TImpoExpoUtility.ArmarDirectorio(Path: string): string;
begin
//    %dt Fecha
//    %dt[dd-mm-yyyy]
  if IsEmptyString(Path) then Result := ''
  else begin
    Result := ParseDateTime(Path);
  end;
end;

function TImpoExpoUtility.ParseDateTime(str: string): string;
var
  istart, istop: integer;
  sDateTimeValor: string;
begin
  while (pos('%' + FMT_FECHAHORA, str) > 0) do
  begin
      istart:= pos('%' + FMT_FECHAHORA, str) + length('%' + FMT_FECHAHORA);
      if (istart <= length(str)) and (str[istart] = '[') then
      begin
        istop:= istart;
        while (istop <= length(str)) and (str[istop] <> ']') do
          istop:= istop + 1;
        if istop <= length(str) then
        begin
          sDateTimeValor := formatdatetime(copy(str, (istart+1), istop-istart-1), now);
          str := StringReplace(str, copy(str, istart, istop-istart+1), sDateTimeValor, []);
        end;
      end;
      str := StringReplace(str, '%' + FMT_FECHAHORA, '', []);
  end;
  Result := str;
end;

end.

