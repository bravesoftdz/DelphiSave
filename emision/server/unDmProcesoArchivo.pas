unit unDmProcesoArchivo;

interface


uses
  Windows, SysUtils, Classes, DB, SDEngine, Controls, SvcMgr, unConstEmision, unDmPrincipal, unUtils, SDOra,
  Dialogs;
type
  TProcesador = class
  private
    { Private declarations }
    FTipoFormulario : Integer;
    FContienePersonal : Boolean;
    FRegistros : Integer;

    procedure IncorporarDeclaraciones(AIdCabecera: Integer);
    procedure ProcesarDetalle(AIdCabecera: integer; Linea: string);
    function ProcesarCabecera(Linea: string): integer;
    procedure CalcularDeclaraciones(AIdCabecera : Integer);
    procedure ProcesarDDJJ(NombreArchivo: String); overload;
    // procedure IncorporarResumen(AIdCabecera: Integer);
    // procedure AparearDeclaraciones;
    // procedure CalcularDeclaracion(AIdDeclaracion : Integer);
    procedure VerificarExistenciaErrores(AIdCabecera : Integer);
    // procedure CheckearDevengadoMensual(AIdCabecera : Integer);
  protected
    procedure Execute;
    procedure IniciarTraza;
    procedure InsertarSuss(aLinea: TLineaNominativa; AidCabecera: integer);
    procedure InsertarMonotributo(aLinea: TLineaNominativa; AidCabecera: integer);
    procedure InsertarSinPersonal(aLinea: TLineaSinPersonal; AidCabecera: integer);
    procedure InsertarSussExtendido(aLinea: TLineaNominativa; AidCabecera: integer);
    procedure InsertarDeterminativa(aLinea: TLineaDeterminativa; AIdCabecera : Integer);
    procedure InsertarMiRegistro(aLinea: TLineaMiRegistro; AidCabecera: integer);
    procedure InsertarDomiciliodeExplotacion(aLinea: TLineaDomiciliodeExplotasion; AidCabecera: integer);
    procedure PrepararStoresProcedure;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ProcesarDDJJ(NombreArchivo: String; ATipoFormulario : integer); overload;
  end;

  TDmProcesoArchivos = class(TDataModule)
    sdqTDT: TSDQuery;
    spInsertarSUSS: TSDStoredProc;
    spInsertarSUSSExtendido: TSDStoredProc;
    spInsertarMonotributo: TSDStoredProc;
    spInsertarSinPersonal: TSDStoredProc;
    spInsertarDeterminativa: TSDStoredProc;
    spInsertarMiRegistro: TSDStoredProc;
    spInsertarDomiciliodeExplotacion: TSDStoredProc;
    procedure TimerTimer(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    Procesador : TProcesador;
  public
  end;

var
  DmProcesoArchivos: TDmProcesoArchivos;

implementation

{$R *.dfm}

uses AnsiSql, SqlFuncs, StrFuncs, unDirUtils, {unConstDDJJ,}
  unCustomDataModule, unFuncionesEmision, unDmFormulas, general, Variants,
  StrUtils, unArt;
{----------------------------------------------------------------------------------------------------------------------}
procedure TDmProcesoArchivos.TimerTimer(Sender: TObject);
begin
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TDmProcesoArchivos.DataModuleDestroy(Sender: TObject);
begin
  Procesador.Free;
end;
{----------------------------------------------------------------------------------------------------------------------}
{ TProcesador }
constructor TProcesador.Create;
begin
  FTipoFormulario := -1;
  inherited;

end;
{----------------------------------------------------------------------------------------------------------------------}
destructor TProcesador.Destroy;
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TProcesador.Execute;
var
  sr: TSearchRec;
  FileAttrs: Integer;
  FileName : String;
  BaseDir : String;
begin
    FileAttrs := faAnyFile;
    BaseDir := get_parametrobyclave('BASEDIR');

    if FindFirst(IncludeTrailingBackslash(BaseDir) + '*.*', FileAttrs, sr) = 0 then
    begin
      repeat
        FileName := IncludeTrailingBackslash(BaseDir) +
                    IncludeTrailingBackslash(Sr.Name) +
                    'Novedad.dat';
        if ((sr.Attr and FileAttrs) = faDirectory) and FileExists(FileName) then
        begin
          BeginTrans(true);
          ProcesarDDJJ(FileName);
          CommitTrans(true);
        end
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TProcesador.ProcesarDDJJ(NombreArchivo: String;
  ATipoFormulario: integer);
begin
  try
    FTipoFormulario := ATipoFormulario;
    ProcesarDDJJ(NombreArchivo);
  except
    on E : Exception do
    begin
      {$IFNDEF SERVICE}
      MsgBox(e.Message, MB_ICONERROR, 'Error');
      {$ENDIF}
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TProcesador.ProcesarDDJJ(NombreArchivo : String);
var
  Archivo: TextFile;
  NombreArchivoProceso : String;
  Linea: string;
  IdCabecera : Integer;
  {$IFNDEF SERVICE}Destino,{$ENDIF} SError : String;
  {$IFDEF SERVICE}
  bError: boolean;
  {$ENDIF}
begin
  IdCabecera := ART_EMPTY_ID;

  try
    // Cambio el nombre a .prg para procesarlo.
//Pablo 12/12/2006    do_inittdt;

    DmProcesoArchivos.sdqTDT.Prepare;

    {$IFNDEF SERVICE}
    NombreArchivoProceso := ChangeFileExt(NombreArchivo, '.prg');
    RenameFile(NombreArchivo, NombreArchivoProceso);
    {$ELSE}
    NombreArchivoProceso := NombreArchivo;
    {$ENDIF}

    AssignFile(Archivo, NombreArchivoProceso);
    Reset( Archivo );
    readln( Archivo, Linea );

    BeginTrans(true);

    FRegistros := 0;
    IdCabecera := ProcesarCabecera(Linea);
    PrepararStoresProcedure;
    try
      while (not Eof(Archivo)) do
      begin
        ProcesarDetalle(IdCabecera, Linea);
        readln( Archivo, Linea );
      end;
      do_actualizarcabecera(IdCabecera, FRegistros, 'P'); // Pre-proceso

      IniciarTraza;

      CommitTrans(true);

      BeginTrans(true);
      if (FTipoFormulario = FORMULARIOMIREGISTRO) then
      begin
        do_ProcesarddjjAnalisisManual(IdCabecera);
        do_procesarmisimplifiacionafi(IdCabecera);
      end
      else begin
        //Genera el traspaso del archivo temporal a los de declaraciones
        if FContienePersonal then
          IncorporarDeclaraciones(IdCabecera);
    //      else IncorporarResumen(IdCabecera);
        //Genera el cálculo para todos los períodos que se hayan invalidado producto
        //de la aplicación de las declaraciones incorporadas. Dentro de este procedimiento
        //se verifica si requiere activarla.
        CalcularDeclaraciones(IdCabecera);
      end;

      do_terminarcabecera(IdCabecera);
      CommitTrans(true);
      {$IFDEF SERVICE}
      bError := false;
      {$ENDIF}
    except
      on E: Exception do
      begin
        Rollback(true);
        {$IFDEF SERVICE}
        bError := true;
        {$ENDIF}
        SError := E.Message;
        EjecutarSql('INSERT INTO emi.tce_ddjjcabeceraerrores (ce_id, ce_idddjjcabeceraerrores, ce_iderror, ' +
                    ' ce_detalleerror) ' +
              ' VALUES (emi.seq_tce_id.nextval, ' +
                            SqlNumber(IdCabecera, true) + ' , NULL , ' +
                            SqlValue(E.Message) + ')');


        CloseFile(Archivo);
        {$IFNDEF SERVICE}
        Destino := 'c:\temp\erroneos\' + FormatDateTime('yyyymmddhhmmss', Now) + '-' + ChangeFileExt(ExtractFileName(NombreArchivoProceso),'.err');
        CopyFile(PChar(NombreArchivoProceso), PChar(Destino), true);
        DeleteFile(NombreArchivoProceso);
        {$ENDIF}
      end;
    end;
  finally
    VerificarExistenciaErrores(IdCabecera);
    DmProcesoArchivos.sdqTDT.unprepare;
    do_resumetdt;
    if FileExists(NombreArchivoProceso) then
    begin
      CloseFile(Archivo);
      {$IFNDEF SERVICE}
      Destino := 'c:\temp\procesados\' + FormatDateTime('yyyymmddhhmmss', Now) + '-' + ChangeFileExt(ExtractFileName(NombreArchivoProceso),'.prd');
      CopyFile(PChar(NombreArchivoProceso), PChar(Destino), true);
      DeleteFile(NombreArchivoProceso);
      RmDir(ExtractFileDir(NombreArchivoProceso));
      {$ELSE}
      if not bError then
        DeleteFile(NombreArchivoProceso);
      if (pos('ORA-04068', SError) <> 0) then
        raise Exception.Create('Paquete inválido.');
      {$ENDIF}
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
(*procedure TProcesador.CalcularDeclaracion(AIdDeclaracion : Integer);
var
 Cuit : String;
 Periodo : String;

 Q : TSDQuery;
begin
  Q := GetQuery('select dj_cuit, dj_contrato from emi.idj_ddjj ' +
                ' where dj_id = ' + SqlValue(AIdDeclaracion) +
                ' ORDER BY dj_cuit, dj_periodo');

  with TdmFormula.Create(nil) do
  try
    while not Q.Eof do
    begin
      Cuit := Q.FieldByName('dj_cuit').AsString;
      Periodo := Q.FieldByName('dj_periodo').AsString;
      // Contrato := Q.FieldByName('rp_contrato').AsInteger;

      AplicarFormulas(Cuit, Periodo);
      AplicarReglas(Cuit, Periodo);

      Q.Next;
    end;

  finally
    Q.Free;
    Free;
  end;
end;*)
{----------------------------------------------------------------------------------------------------------------------}
procedure TProcesador.CalcularDeclaraciones(AIdCabecera : Integer);
var
 Q : TSDQuery;
 Registros : Integer;
begin
  do_debug('Iniciando cálculo de variables.', 4);
  Q := GetQuery('SELECT dj_id FROM emi.idj_ddjj idj        ' +
                ' WHERE idj.dj_contrato is not null and idj.dj_idddjjcabeceraimportacion = ' + SqlValue(AIdCabecera) +
                ' ORDER BY dj_contrato, dj_periodo, dj_id desc ');
  Registros := 0;

//--Pablo2007Ver2  BeginTrans(True);
  try
    with TdmFormula.Create(nil) do
    try
      while not Q.Eof do
      begin
        // Verifica la aceptación de la declaración.
        // y devenga
        do_verificardeclaracion(Q.FieldByName('dj_id').AsInteger);
        Q.Next;
      end;
      //Verifica la calidad de la declaración por
      //comparación contra afiliaciones.
// Se hace en activar declaración que se llama en el verificardeclaración mas arriba.
      //AparearDeclaraciones;
//Pablo      CheckearDevengadoMensual(AIdCabecera);
      //Devenga los inválidos
      Do_ProcesarddjjAnalisisManual(AIdCabecera);

//--Pablo2007Ver2   do_devengarinvalidos;

//Pablo Ver2007      CommitTrans;
    except
      on E : Exception do
      begin
        Rollback(true);
        EjecutarSql('INSERT INTO emi.tce_ddjjcabeceraerrores (ce_id, ce_idddjjcabeceraerrores, ce_iderror, ' +
                    ' ce_detalleerror) ' +
                    ' VALUES (emi.seq_tce_id.nextval, ' +
                              SqlNumber(AIdCabecera, true) + ' , NULL , ' +
                              SqlValue(E.Message) + ')');
        raise E;
      end;
    end;
  finally
    do_debug(Format('Fin cálculo de %d registros', [Registros]), 4);
    Q.close;
  end;
end;
{------------------------------------------------------------------------------}
(*procedure TProcesador.CheckearDevengadoMensual(AIdCabecera : Integer);
begin
  do_checkeardevengadomensual(AIdCabecera);
end;*)
{------------------------------------------------------------------------------}
procedure TProcesador.VerificarExistenciaErrores(AIdCabecera : integer);
begin
  do_verificarexistenciaerrores(AIdCabecera);
end;
{----------------------------------------------------------------------------------------------------------------------}
(*procedure TProcesador.AparearDeclaraciones;
begin
  do_aparearinvalidas;
end;*)
{----------------------------------------------------------------------------------------------------------------------}
function TProcesador.ProcesarCabecera(Linea : string) : integer;
var
  LineaCabecera : TLineaCabecera;
begin
  Result := ART_EMPTY_ID;

  LineaCabecera := ParseoCabeceraArchivo(Linea);

  if FTipoFormulario < 0 then
   FTipoFormulario := LineaCabecera.FormatoFormulario;
   FContienePersonal := LineaCabecera.ContieneTrabajadores;
  try
//Pablo Ver2007    BeginTrans(true);
    result := ValorSql('select ci_id from emi.tci_ddjjcabeceraimportacion ' +
                       ' where ci_codigoregistro   = ' + SqlValue(LineaCabecera.CodRegistro) +
                       '   and ci_codigoarchivo    = ' + SqlValue(LineaCabecera.CodArchivo) +
                       '   and ci_subcodigoarchivo = ' + SqlValue(LineaCabecera.SubcodigoArch) +
                       '   and ci_fechaproceso     = ' + SqlValue(LineaCabecera.FechaProceso), '0');

    if result = 0 then
      raise EExceptionDDJJ.Create('No se pudo localizar el registro de cabecera para el archivo.' + #13#10 +
                                  'Cod.Registro: ' + LineaCabecera.CodRegistro +
                                  'Cod.Archivo:  ' + LineaCabecera.CodArchivo  +
                                  'Fecha Proc.:  ' + DateTimeToStr(LineaCabecera.FechaProceso), '', ERROR_ARCHIVOYAPROCESADO);

    if RightStr(trim(LineaCabecera.SubcodigoArch), 2) <> '51' then
      raise EExceptionDDJJ.Create('El archivo no pertenece a esta ART.' + #13#10 +
                                  'Cod.Registro: ' + LineaCabecera.CodRegistro +
                                  'Cod.Archivo:  ' + LineaCabecera.CodArchivo  +
                                  'Fecha Proc.:  ' + DateTimeToStr(LineaCabecera.FechaProceso), '', ERROR_INSERTANDOCABECERA);

  except
    on E: EExceptionDDJJ do begin
      EjecutarSql('INSERT INTO emi.tce_ddjjcabeceraerrores (ce_id, ce_idddjjcabeceraerrores, ce_iderror, ' +
                    ' ce_detalleerror, ce_registroerror, ' +
                    ' ce_codigoarchivo, ce_subcodigoarchivo,  ce_fechaproceso,  ce_horaproceso) ' +
                    ' VALUES (emi.seq_tce_id.nextval, ' +
                            SqlNumber(result, true) + ' , ' +
                            SqlValue(E.Code) + ' , ' +
                            SqlValue(E.Message) + ' , ' +
                            SqlValue('')  + ' , ' +
                            SqlValue(LineaCabecera.CodRegistro) + ' , ' +
                            SqlValue(LineaCabecera.CodArchivo) + ' , ' +
                            SqlValue(LineaCabecera.SubcodigoArch) + ' , ' +
                            SqlValue(LineaCabecera.FechaProceso) + ')');
//Pablo Ver2007      Rollback(true);
      raise EExceptionDDJJ.Create(E.Message, '', E.Code);
    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TProcesador.ProcesarDetalle(AIdCabecera : integer; Linea: string);
var
  Next : Integer;
begin
  try
    if copy(Linea,1,2) = 'HF' then
    begin
      do_actualizarcabecera(AIdCabecera, FRegistros, 'P');
      exit;
    end;

    if copy(Linea,1,15) = 'SIN INFORMACION' then
    begin
      do_actualizarcabecera(AIdCabecera, FRegistros, 'P');
      exit;
    end;

    if copy(Linea,1,2) = 'TF' then exit;

    if (copy(Linea,1,1) = 'H') and (copy(Linea,8,2) = '03') then Exit;

    Inc(FRegistros);

    if FTipoFormulario = FORMULARIOSUSS then
      InsertarSuss(ParsearLineaSUSS(Linea), AIdCabecera)
    else if FTipoFormulario = FORMULARIOMONOTRIBUTO then
      InsertarMonotributo(ParsearLineaMonotributo(Linea), AIdCabecera)
    else if FTipoFormulario = FORMULARIOSINPERSONAL then
      InsertarSinPersonal(ParsearLineaSinPersonal(Linea), AIdCabecera)
    else if FTipoFormulario = FORMULARIOSUSSEXTENDIDO then
      InsertarSussExtendido(ParsearLineaSUSSExtendido(Linea), AIdCabecera)
    else if FTipoFormulario = FORMULARIODETERMINATIVA then
      InsertarDeterminativa(ParsearLineaDeterminativa(Linea), AIdCabecera)
    else if FTipoFormulario = FORMULARIOMIREGISTRO then
      InsertarMiRegistro(ParsearMiRegistro(Linea), AIdCabecera)
    else if FTipoFormulario = FORMULARIODOMICILIOEXPLOTACION then
      InsertarDomiciliodeExplotacion(ParsearDomicilioDeExplotasion(Linea), AIdCabecera);


    if (FRegistros mod 2000) = 0 then
      do_actualizarcabecera(AIdCabecera, FRegistros, 'P');

  except
    On E: Exception do
    begin
      //FIXME...
      Next := GetSecNextVal('emi.seq_tce_id');
      if (E.ClassName = 'EExceptionDDJJ') and (EExceptionDDJJ(E).Code = ERROR_CUITSINCONTRATO) then
      begin
        EjecutarSqlST('INSERT INTO emi.tce_ddjjcabeceraerrores (ce_id, ce_idddjjcabeceraerrores, ce_iderror, ce_detalleerror, ce_registroerror) ' +
                    ' VALUES (' + SqlValue(Next)  + ', ' +
                                  SqlValue(AIdCabecera) + ' , ' +
                                  SqlValue(ERROR_CUITSINCONTRATO) + ' , ' +
                                  SqlValue(E.Message) + ' , ' +
                                  SqlValue(Linea)  + ')');
      end
      else
      begin
        EjecutarSqlST('INSERT INTO emi.tce_ddjjcabeceraerrores (ce_id, ce_idddjjcabeceraerrores, ce_iderror, ce_detalleerror, ce_registroerror) ' +
                    ' VALUES (' + SqlValue(Next)  + ', ' +
                                  SqlValue(AIdCabecera) + ' , ' +
                                  SqlValue(ERROR_PREPROCESANDOREGISTRO) + ' , ' +
                                  SqlValue(E.Message) + ' , ' +
                                  SqlValue(Linea)  + ')');
        raise EExceptionDDJJ.Create('Error al procesar el registro.' + E.Message, '', ERROR_PREPROCESANDOREGISTRO);
      end;

    end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
(*procedure TProcesador.IncorporarResumen(AIdCabecera : Integer);
begin
  do_incorporarresumen(AIdCabecera);
end;*)
{----------------------------------------------------------------------------------------------------------------------}
procedure TProcesador.IncorporarDeclaraciones(AIdCabecera : Integer);
begin
  Do_IncorporarDeclaraciones(AIdCabecera);
end;
{--------------------------------------------------------------------------------}
procedure TProcesador.IniciarTraza;
begin
 do_inicializartraza;
end;
{--------------------------------------------------------------------------------}
procedure TDmProcesoArchivos.DataModuleCreate(Sender: TObject);
begin
  Procesador := TProcesador.Create;
  Procesador.Execute;
end;
{------------------------------------------------------------------------------}
procedure TProcesador.InsertarSuss(aLinea: TLineaNominativa; AidCabecera: integer);
begin
  with DmProcesoArchivos do
  begin
    spInsertarSUSS.Params[0].AsString := aLinea.Cuit;
    spInsertarSUSS.Params[1].AsString := aLinea.Periodo;
    spInsertarSUSS.Params[2].AsString := aLinea.CodRect;
    if (aLinea.FechaPresentacion <> 0) then
      spInsertarSUSS.Params[3].AsDateTime := aLinea.FechaPresentacion
    else
      spInsertarSUSS.Params[3].Value := null;
    spInsertarSUSS.Params[4].AsString := aLinea.Cuil;
    spInsertarSUSS.Params[5].AsString := aLinea.CodArt;
    spInsertarSUSS.Params[6].AsString := aLinea.CodSit;
    spInsertarSUSS.Params[7].AsString := aLinea.CodCon;
    spInsertarSUSS.Params[8].AsString := aLinea.ActivDes;
    spInsertarSUSS.Params[9].AsString := aLinea.ModCont;
    spInsertarSUSS.Params[10].AsString := aLinea.Zona;
    spInsertarSUSS.Params[11].AsFloat := aLinea.Remuneracion;

    spInsertarSUSS.Params[12].AsString := aLinea.CodOSoc;
    spInsertarSUSS.Params[13].AsString := aLinea.SecDJ;
    spInsertarSUSS.Params[14].AsString := aLinea.SecNom;
    spInsertarSUSS.Params[15].AsInteger := AidCabecera;
    spInsertarSUSS.ExecProc;
  end;
end;
{------------------------------------------------------------------------------}
procedure TProcesador.InsertarSussExtendido(aLinea: TLineaNominativa; AidCabecera: integer);
begin
  with DmProcesoArchivos do
  begin
    spInsertarSUSSExtendido.Params[0].AsString := aLinea.Cuit;
    spInsertarSUSSExtendido.Params[1].AsString := aLinea.Periodo;
    spInsertarSUSSExtendido.Params[2].AsString := aLinea.NumeroObligacion;
    spInsertarSUSSExtendido.Params[3].AsInteger := aLinea.SecuenciaObligacion;
    spInsertarSUSSExtendido.Params[4].AsString := aLinea.Banco;
    spInsertarSUSSExtendido.Params[5].AsString := aLinea.CodRect;
    if (aLinea.FechaPresentacion <> 0) then
      spInsertarSUSSExtendido.Params[6].AsDateTime := aLinea.FechaPresentacion
    else
      spInsertarSUSSExtendido.Params[6].Value := null;
    spInsertarSUSSExtendido.Params[7].AsString := aLinea.Cuil;
    spInsertarSUSSExtendido.Params[8].AsString := aLinea.ModCont;
    spInsertarSUSSExtendido.Params[9].AsString := aLinea.Zona;
    spInsertarSUSSExtendido.Params[10].AsString := aLinea.ActivDes;
    spInsertarSUSSExtendido.Params[11].AsFloat := aLinea.PorcentajeReduccion;
    spInsertarSUSSExtendido.Params[12].AsFloat := aLinea.RemuneracionTotal;
    spInsertarSUSSExtendido.Params[13].AsFloat := aLinea.Remuneracion;
    spInsertarSUSSExtendido.Params[14].AsFloat := aLinea.AdicionalTareaRiesgo;
    spInsertarSUSSExtendido.Params[15].AsFloat := aLinea.AporteObligatorioSS;
    spInsertarSUSSExtendido.Params[16].AsFloat := aLinea.AporteVoluntarioSS;
    spInsertarSUSSExtendido.Params[17].AsString := aLinea.CodArt;
    spInsertarSUSSExtendido.Params[18].AsString := aLinea.CodCon;
    spInsertarSUSSExtendido.Params[19].AsString := aLinea.Version;
    spInsertarSUSSExtendido.Params[20].AsString := aLinea.CodigoSiniestro;
    spInsertarSUSSExtendido.Params[21].AsString := aLinea.CodSit;

    spInsertarSUSSExtendido.Params[22].AsString := aLinea.SituacionCuil_1;
    if (aLinea.FechaSituacionCuil_1 <> 0) then
      spInsertarSUSSExtendido.Params[23].AsDateTime := aLinea.FechaSituacionCuil_1
    else
      spInsertarSUSSExtendido.Params[23].Value := null;
    spInsertarSUSSExtendido.Params[24].AsString := aLinea.SituacionCuil_2;
    if (aLinea.FechaSituacionCuil_2 <> 0) then
      spInsertarSUSSExtendido.Params[25].AsDateTime := aLinea.FechaSituacionCuil_2
    else
      spInsertarSUSSExtendido.Params[25].Value := null;
    spInsertarSUSSExtendido.Params[26].AsString := aLinea.SituacionCuil_3;
    if (aLinea.FechaSituacionCuil_3 <> 0) then
      spInsertarSUSSExtendido.Params[27].AsDateTime := aLinea.FechaSituacionCuil_3
    else
      spInsertarSUSSExtendido.Params[27].Value := null;

    spInsertarSUSSExtendido.Params[28].AsFloat := aLinea.Sueldo;
    spInsertarSUSSExtendido.Params[29].AsFloat := aLinea.Sac;
    spInsertarSUSSExtendido.Params[30].AsFloat := aLinea.Horasextra;
    spInsertarSUSSExtendido.Params[31].AsFloat := aLinea.ZonaDesFavorable;
    spInsertarSUSSExtendido.Params[32].AsFloat := aLinea.Vacaciones;
    spInsertarSUSSExtendido.Params[33].AsInteger := aLinea.DiasLaborales;
    spInsertarSUSSExtendido.Params[34].AsString := aLinea.Release;

    spInsertarSUSSExtendido.Params[35].AsFloat := aLinea.Adicionales;
    spInsertarSUSSExtendido.Params[36].AsFloat := aLinea.Premios;
    spInsertarSUSSExtendido.Params[37].AsFloat := aLinea.CptoNoRemunerativos;

    spInsertarSUSSExtendido.Params[38].AsInteger := AidCabecera;

    spInsertarSUSSExtendido.ExecProc;
  end;
end;
{------------------------------------------------------------------------------}
procedure TProcesador.InsertarMonotributo(aLinea: TLineaNominativa; AidCabecera: integer);
begin
  with DmProcesoArchivos do
  begin
    spInsertarMonotributo.Params[0].AsString := aLinea.Cuit;
    spInsertarMonotributo.Params[1].AsString := aLinea.Periodo;
    spInsertarMonotributo.Params[2].AsString := aLinea.Cuil;
    spInsertarMonotributo.Params[3].AsString := aLinea.CodCon;
    spInsertarMonotributo.Params[4].AsString := aLinea.ModCont;
    spInsertarMonotributo.Params[5].AsString := aLinea.CodArt;
    spInsertarMonotributo.Params[6].AsString := aLinea.CodOSoc;
    spInsertarMonotributo.Params[7].AsFloat := aLinea.Remuneracion;
    if (aLinea.FechaPresentacion <> 0) then
      spInsertarMonotributo.Params[8].AsDateTime := aLinea.FechaPresentacion
    else
      spInsertarMonotributo.Params[8].Value := null;
    spInsertarMonotributo.Params[9].AsString := aLinea.Version;
    spInsertarMonotributo.Params[10].AsString := aLinea.CodRect;
    spInsertarMonotributo.Params[11].AsInteger := AidCabecera;

    spInsertarMonotributo.ExecProc;
  end;
end;
{------------------------------------------------------------------------------}
procedure TProcesador.InsertarSinPersonal(aLinea: TLineaSinPersonal; AidCabecera: integer);
begin
  with DmProcesoArchivos do
  begin
    spInsertarSinPersonal.Params[0].AsString := aLinea.Cuit;
    spInsertarSinPersonal.Params[1].AsString := aLinea.Periodo;
    if (aLinea.FechaPresentacion <> 0) then
      spInsertarSinPersonal.Params[2].AsDateTime := aLinea.FechaPresentacion
    else
      spInsertarSinPersonal.Params[2].Value := null;
    spInsertarSinPersonal.Params[3].AsString := aLinea.CodArt;
    spInsertarSinPersonal.Params[4].AsString := aLinea.CodRect;
    spInsertarSinPersonal.Params[5].AsInteger := AidCabecera;

    spInsertarSinPersonal.ExecProc;
  end;
end;
{------------------------------------------------------------------------------}
procedure TProcesador.InsertarDeterminativa(aLinea: TLineaDeterminativa; AIdCabecera : Integer);
begin
  with DmProcesoArchivos do
  begin
    spInsertarDeterminativa.Params[0].AsString := aLinea.Cuit;
    spInsertarDeterminativa.Params[1].AsString := aLinea.Periodo;
    spInsertarDeterminativa.Params[2].AsString := aLinea.NumeroObligacion;
    spInsertarDeterminativa.Params[3].AsInteger := aLinea.SecuenciaObligacion;
    spInsertarDeterminativa.Params[4].AsString := aLinea.Banco;
    if (aLinea.FechaPresentacion <> 0) then
      spInsertarDeterminativa.Params[5].AsDateTime := aLinea.FechaPresentacion
    else
      spInsertarDeterminativa.Params[5].Value := null;
    spInsertarDeterminativa.Params[6].AsString := aLinea.CodRect;
    spInsertarDeterminativa.Params[7].AsFloat := aLinea.Alicuota;
    spInsertarDeterminativa.Params[8].AsFloat := aLinea.CuotaFija;
    spInsertarDeterminativa.Params[9].AsFloat := aLinea.PagoTotal;
    spInsertarDeterminativa.Params[10].AsString := aLinea.CodArt;
    spInsertarDeterminativa.Params[11].AsString := aLinea.PersonalTemporario;
    spInsertarDeterminativa.Params[12].AsString := aLinea.Version;
    spInsertarDeterminativa.Params[13].AsInteger := aLinea.CantidadEmpleados;
    spInsertarDeterminativa.Params[14].AsFloat := aLinea.Masa;
    spInsertarDeterminativa.Params[15].AsFloat := AIdCabecera;

    try
      spInsertarDeterminativa.ExecProc;
    except
      on e: ESDOraError do
      begin
        if e.NativeError = 20001 then
          raise EExceptionDDJJ.Create('El Cuit: ' + aLinea.Cuit + ' para el período: ' + aLinea.Periodo + ' no tiene contrato vigente.', '', ERROR_CUITSINCONTRATO)
        else raise;
      end;
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TProcesador.PrepararStoresProcedure;
begin
  with DmProcesoArchivos do
   begin
    if FTipoFormulario = FORMULARIOSUSS then
      spInsertarSUSS.Prepare
    else if FTipoFormulario = FORMULARIOMONOTRIBUTO then
      spInsertarMonotributo.Prepare
    else if FTipoFormulario = FORMULARIOSINPERSONAL then
      spInsertarSinPersonal.Prepare
    else if FTipoFormulario = FORMULARIOSUSSEXTENDIDO then
      spInsertarSUSSExtendido.Prepare
    else if FTipoFormulario = FORMULARIODETERMINATIVA then
      spInsertarDeterminativa.Prepare
    else if FTipoFormulario = FORMULARIOMIREGISTRO then
      spInsertarMiRegistro.Prepare
    else if FTipoFormulario = FORMULARIODOMICILIOEXPLOTACION then
      spInsertarDomiciliodeExplotacion.Prepare
  end;
end;
{------------------------------------------------------------------------------}
procedure TProcesador.InsertarMiRegistro(aLinea: TLineaMiRegistro;
  AidCabecera: integer);
begin
  with DmProcesoArchivos do
  begin
    spInsertarMiRegistro.Params[0].AsString := aLinea.Cuit;
    spInsertarMiRegistro.Params[1].AsString := aLinea.Cuil;
    spInsertarMiRegistro.Params[2].AsString := aLinea.ApellidoNombre;
    if (aLinea.FechaIni <> 0) then
      spInsertarMiRegistro.Params[3].AsDate := aLinea.FechaIni
    else
      spInsertarMiRegistro.Params[3].Value := null;

    if (aLinea.FechaFin <> 0) then
      spInsertarMiRegistro.Params[4].AsDate := aLinea.FechaFin
    else
      spInsertarMiRegistro.Params[4].Value := null;

    spInsertarMiRegistro.Params[5].AsString := aLinea.ClaveAlta;

    if (aLinea.FechaClaveAlta <> 0) then
      spInsertarMiRegistro.Params[6].AsDate := aLinea.FechaClaveAlta
    else
      spInsertarMiRegistro.Params[6].Value := null;

    spInsertarMiRegistro.Params[7].AsString := aLinea.HoraClaveAlta;
    spInsertarMiRegistro.Params[8].AsString := aLinea.ClaveBaja;

    if (aLinea.FechaClaveBaja <> 0) then
      spInsertarMiRegistro.Params[9].AsDate := aLinea.FechaClaveBaja
    else
      spInsertarMiRegistro.Params[9].Value := null;

    spInsertarMiRegistro.Params[10].AsString := aLinea.HoraClaveBaja;
    spInsertarMiRegistro.Params[11].AsString := aLinea.ModContratacion;
    spInsertarMiRegistro.Params[12].AsString := aLinea.TrabajadorAgro;
    spInsertarMiRegistro.Params[13].AsString := aLinea.InfoSistJubil;
    spInsertarMiRegistro.Params[14].AsString := aLinea.CodSitBaja;

    if (aLinea.FechaMov <> 0) then
      spInsertarMiRegistro.Params[15].AsDate := aLinea.FechaMov
    else
      spInsertarMiRegistro.Params[15].Value := null;

    spInsertarMiRegistro.Params[16].AsString := aLinea.HoraMov;
    spInsertarMiRegistro.Params[17].AsString := aLinea.CodigoMov;
    spInsertarMiRegistro.Params[18].AsFloat := aLinea.RemunBruta;
    spInsertarMiRegistro.Params[19].AsInteger := aLinea.ModLiquidacion;
    spInsertarMiRegistro.Params[20].AsInteger := aLinea.Sucursal;
    spInsertarMiRegistro.Params[21].AsString := aLinea.Actividad;
    spInsertarMiRegistro.Params[22].AsString := aLinea.Puesto;

    if (aLinea.FechaTelegRenun <> 0) then
      spInsertarMiRegistro.Params[23].AsDate := aLinea.FechaTelegRenun
    else
      spInsertarMiRegistro.Params[23].Value := null;

    spInsertarMiRegistro.Params[24].AsString := aLinea.UsuFuturo1;

    spInsertarMiRegistro.Params[25].AsString := aLinea.UsuFuturo2;

    if aLinea.MarcaRectificacion <> -1 then
      spInsertarMiRegistro.Params[26].AsInteger := aLinea.MarcaRectificacion
    else
      spInsertarMiRegistro.Params[26].Value := null;

    spInsertarMiRegistro.Params[27].AsString := aLinea.FormAgropecuario;
    spInsertarMiRegistro.Params[28].AsString := aLinea.CCT;
    spInsertarMiRegistro.Params[29].AsString := aLinea.CatProfesional;
    spInsertarMiRegistro.Params[30].AsString := aLinea.TipoServ;

    spInsertarMiRegistro.Params[31].AsInteger := AidCabecera;

    spInsertarMiRegistro.ExecProc;
  end;
end;
{------------------------------------------------------------------------------}
procedure TProcesador.InsertarDomiciliodeExplotacion(aLinea: TLineaDomiciliodeExplotasion;
  AidCabecera: integer);
begin
  with DmProcesoArchivos do
  begin
    spInsertarDomiciliodeExplotacion.Params[0].AsString := aLinea.Cuit;
    spInsertarDomiciliodeExplotacion.Params[1].AsString := aLinea.CodMovimiento;
    spInsertarDomiciliodeExplotacion.Params[2].AsString := aLinea.TipoExterno;
    spInsertarDomiciliodeExplotacion.Params[3].AsString := aLinea.Calle;
    spInsertarDomiciliodeExplotacion.Params[4].AsString := aLinea.NumeroPuerta;
    spInsertarDomiciliodeExplotacion.Params[5].AsString := aLinea.Torre;
    spInsertarDomiciliodeExplotacion.Params[6].AsString := aLinea.Bloque;
    spInsertarDomiciliodeExplotacion.Params[7].AsString := aLinea.Piso;
    spInsertarDomiciliodeExplotacion.Params[8].AsString := aLinea.Departamento;
    spInsertarDomiciliodeExplotacion.Params[9].AsString := aLinea.CodigoPostal;
    spInsertarDomiciliodeExplotacion.Params[10].AsString := aLinea.Localidad;
    spInsertarDomiciliodeExplotacion.Params[11].AsString := aLinea.Provincia;
    spInsertarDomiciliodeExplotacion.Params[12].AsString := aLinea.Sucursal;
    spInsertarDomiciliodeExplotacion.Params[13].AsString := aLinea.Actividad;
    if (aLinea.FechaHoraMovimiento <> 0) then
      spInsertarDomiciliodeExplotacion.Params[14].AsDate := aLinea.FechaHoraMovimiento
    else
      spInsertarDomiciliodeExplotacion.Params[14].Value := null;
    spInsertarDomiciliodeExplotacion.Params[15].AsString := aLinea.HoraMovimiento;
    spInsertarDomiciliodeExplotacion.Params[16].AsInteger := AidCabecera;
    spInsertarDomiciliodeExplotacion.ExecProc;

  end;
end;

end.







