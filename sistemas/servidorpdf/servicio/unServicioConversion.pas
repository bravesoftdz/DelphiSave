unit unServicioConversion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ExtCtrls, unArt, SyncObjs, unExportPDF;

type
  TConversionThread = class(TThread)
    Id: TTableId;
    FileName, ServerPath: String;
    TipoDestino: TTipoDestino;
  protected
    procedure Execute; override;
  public
    constructor Create(AId: TTableId; AFileName, AServerPath: String; ATipoDestino: TTipoDestino);
  end;

  TPDFConversionThread = class(TConversionThread)
  end;

  TTIFConversionThread = class(TConversionThread)
  end;

  TServicePDF = class(TService)
    TimerConversion: TTimer;
    TimerKillProcess: TTimer;
    TimerServidorActivo: TTimer;
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure TimerServidorActivoTimer(Sender: TObject);
    procedure TimerConversionTimer(Sender: TObject);
    procedure TimerKillProcessTimer(Sender: TObject);
    procedure ServiceBeforeInstall(Sender: TService);
  private
    FIdle: Boolean;
    FThreadsRunning, FMinutos: Integer;
    FPathDestImage, FPathDestPDF: String;
    FCriticalSection: TCriticalSection;
    procedure DeleteScheduledFiles;
    procedure ThreadDone(Sender: TObject);
    procedure KillProcessPDF(AProceso: String);
    procedure ServiceLoadInfo(Sender: TObject);
  public
    function GetServiceController: TServiceController; override;
    function GetNumberOfPrinters: Integer;
    function RotatePrinter: Integer;

    property CriticalSection: TCriticalSection read FCriticalSection;    
  end;

  procedure ScheduleFileToBeDeleted(AFileName: String);

const
  IntervaloVerificaConversion = 1;    // en segundos
  IntervaloServicioActivo     = 30;   // en segundos

  PROCESO_PDF_3 = 'fppdis3a.exe';
  PROCESO_PDF_5 = 'fppdis5.exe';

var
  ServicePDF: TServicePDF;

implementation

uses
  unDmPrincipal, Registry, CustomDlgs, DB, unWinProcess,
  unComunesMail, unImageFunctions, ArchFuncs, unCustomDataModule,
  General, Strfuncs, Math;

{$R *.DFM}

var
  FScheduledFilesToBeDeleted: TStrings;
  FContador: LongInt;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ServicePDF.Controller(CtrlCode);
end;

procedure TServicePDF.ServiceDestroy(Sender: TObject);
begin
  FScheduledFilesToBeDeleted.Free;
  FCriticalSection.Free;
end;

procedure TServicePDF.ServiceCreate(Sender: TObject);
begin
  FScheduledFilesToBeDeleted := TStringList.Create;
  FCriticalSection           := TCriticalSection.Create;

  ServiceLoadInfo(Self);
end;

function TServicePDF.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TServicePDF.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  LogMessage('Instalando el servicio de conversión de archivos', EVENTLOG_INFORMATION_TYPE, 0, 0);

  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, False) then
      begin
        Reg.WriteString('Description', 'Servicio que provee conversión de archivos a través de la base de datos ORACLE.');
        Reg.WriteString('ImagePath', ParamStr(0) + ' /run ' + ParamStr(2) + ' ' + QuotedStr(ParamStr(3)));
        Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
end;

procedure TServicePDF.ServiceExecute(Sender: TService);
begin
  LogMessage('Ejecutando el servicio de conversión de archivos', EVENTLOG_INFORMATION_TYPE, 0, 0);

  while not Terminated do
    ServiceThread.ProcessRequests(True);
end;

function TServicePDF.GetNumberOfPrinters: Integer;
var
  iCant: Integer;
begin
  if Is_ConectadoProduccion() then
    iCant := 5
  else
    iCant := 1;

  Result := iCant;
end;

function TServicePDF.RotatePrinter: Integer;
var
  sNombreImpresora: String;
  iPrinterIndex: Integer;
begin
  FContador        := (FContador + 1) MOD GetNumberOfPrinters();
  sNombreImpresora := Impresora_Servidor_PDF() + IntToStr(FContador);

  if GetPrinterPDF(sNombreImpresora) >= 0 then
    iPrinterIndex := SetPrinterPDF(sNombreImpresora)
  else
    iPrinterIndex := -1;

  if dmPrincipal.Debug then
    LogMessage('Rotando impresora a la ' + sNombreImpresora + ' Indice: ' + IntToStr(iPrinterIndex), EVENTLOG_INFORMATION_TYPE, 0, 0);

  if iPrinterIndex = -1 then
    SetPrinterPDF(Impresora_Servidor_PDF());

  Result := iPrinterIndex;
end;

procedure TServicePDF.ServiceStart(Sender: TService; var Started: Boolean);
begin
  ServiceLoadInfo(Self);
  LogMessage('Iniciando el servicio de conversión de archivos', EVENTLOG_INFORMATION_TYPE, 0, 0);

  if GetPID(PROCESO_PDF_3, 'avisoautomatico') <> 0 then
    Started := KillProcessByPID(GetPID(PROCESO_PDF_3, 'avisoautomatico'));

  if GetPID(PROCESO_PDF_5, 'avisoautomatico') <> 0 then
    Started := KillProcessByPID(GetPID(PROCESO_PDF_5, 'avisoautomatico'));

  if SetPrinterPDF(Impresora_Servidor_PDF()) = -1 then
    begin
      LogMessage('No se ha encontrado la impresora PDF.', EVENTLOG_ERROR_TYPE, 0, 0);
      Started := False;
    end
  else
    begin
      FPathDestPDF   := Get_PathServidorPDF();
      FPathDestImage := Get_PathServidorImagen();

      if not DirectoryExists(FPathDestPDF) then
        begin
          LogMessage('No se ha encontrado el directorio de conversión de archivos a PDF.', EVENTLOG_ERROR_TYPE, 0, 0);
          Started := False;
        end;

      if not DirectoryExists(FPathDestImage) then
        begin
          LogMessage('No se ha encontrado el directorio de conversión de archivos a imágenes.', EVENTLOG_ERROR_TYPE, 0, 0);
          Started := False;
        end;

      if Started then
        begin
          with TimerConversion do
            begin
              Interval := Trunc(IntervaloVerificaConversion * 1000);
              Enabled  := True;
            end;

          DoActualizarServicioActivoServidorPDF;

          with TimerServidorActivo do
            begin
              Interval := IntervaloServicioActivo * 1000;
              Enabled  := True;
            end;
        end
      else
    end;
end;

procedure TServicePDF.TimerServidorActivoTimer(Sender: TObject);
var
  dUltimaConversion: TDateTime;
begin
  Inc(FMinutos);

  if FMinutos = IntervaloServicioActivo then
  begin
    dUltimaConversion := ValorSQLDateTime('SELECT MAX(CO_FECHACONVERSION) FROM COMUNES.CCO_CONVERSIONPDF');
    LogMessage(CRLF + 'Servicio de conversión, reportando su funcionamiento correcto.' + CRLF + 'Última conversión: ' + DateTimeToStr(dUltimaConversion), EVENTLOG_INFORMATION_TYPE, 0, 0);
    FMinutos := 0;
  end;

  DoActualizarServicioActivoServidorPDF;
  DeleteScheduledFiles;
end;

procedure TServicePDF.TimerConversionTimer(Sender: TObject);
var
  sSql, sFileExtension, sPathDestSvr: String;
  iPeso: Integer;
  bDestinoPorDefecto: Boolean;
  TipoDest: TTipoDestino;
  TipoExt: TTipoExtension;
  dSeg, dKb: Double;
begin
  TimerConversion.Enabled := False;
  TimerConversion.Enabled := True;
  Assert(GetCurrentThreadId = MainThreadId);

  if dmPrincipal.Debug then
    LogMessage(CRLF + 'Verificando los archivos pendientes de conversión', EVENTLOG_INFORMATION_TYPE, 0, 0);

  try
    try
      if dmPrincipal.VerificaConexion(Self) then
      begin
        sSql := 'SELECT ID, ARCHIVO, TIPODESTINO ' +
                  'FROM (SELECT CO_ID ID, CO_ARCHIVO ARCHIVO, CO_TIPODESTINO TIPODESTINO ' +
                          'FROM CCO_CONVERSIONPDF ' +
                         'WHERE CO_ESTADO = :Estado ' +
                           'AND CO_ID <> 99999999 ' +
                         'ORDER BY 1)';
        with QuickGetQueryEx(sSql, ['P']) do
        try
          if dmPrincipal.Debug and not IsEmpty then
            LogMessage(Format(CRLF + 'Se encontraron %d archivos pendientes de conversión', [RecordCount]), EVENTLOG_INFORMATION_TYPE, 0, 0);

          while not Eof do
          begin
            sFileExtension     := GetFormatoArchivo(FieldByName('ARCHIVO').AsString);
            TipoExt            := GetTipoExtension(sFileExtension);
            TipoDest           := StrToTipoDestino(FieldByName('TIPODESTINO').AsString);
            bDestinoPorDefecto := (TipoDest = tdDefault);

            if (bDestinoPorDefecto and (TipoExt In [teTif, tePdf])) or (TipoDest = tdTif) then   // la salida es una imagen
            begin
              sPathDestSvr := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(FPathDestImage) + StringReplace(TIF_EXTENSION, '.', '', []));
              with TTIFConversionThread.Create(FieldByName('ID').AsInteger, FieldByName('ARCHIVO').AsString, sPathDestSvr, TipoDest) do
                OnTerminate := ThreadDone
            end
            else if bDestinoPorDefecto or (TipoDest = tdPdf) then    // la salida es un pdf
            begin
              sPathDestSvr := FPathDestPDF;
              with TPDFConversionThread.Create(FieldByName('ID').AsInteger, FieldByName('ARCHIVO').AsString, sPathDestSvr, TipoDest) do
                OnTerminate := ThreadDone;

              iPeso := FileSize(IncludeTrailingPathDelimiter(sPathDestSvr) + FieldByName('ARCHIVO').AsString);
              if (iPeso > (150*1024)) then
              begin
                dKb  := iPeso/1024;
                dSeg := RoundTo(Ln(dKb)-4,-2);

                LogMessage(Format(CRLF + 'Se encontró 1 archivo QRP Id %d que pesa %d Kb, esperando %n segundos.', [FieldByName('ID').AsInteger, Round(dKb), dSeg]), EVENTLOG_WARNING_TYPE, 0, 0);
                Sleep(Trunc(dSeg * 1000));
              end;
            end;

            Next;
          end;
        finally
          Free;
        end;
      end;
    finally
    end;
  except
    on E: Exception do
      LogMessage(CRLF + 'Error al verificar los archivos pendientes de conversión' + CRLF + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
  end;
end;

procedure ScheduleFileToBeDeleted(AFileName: String);
begin
  FScheduledFilesToBeDeleted.Insert(0, AFileName);
end;

procedure TServicePDF.DeleteScheduledFiles;
var
  i: Integer;
  tslAux: TStrings;
begin
  tslAux := TStringList.Create;
  tslAux.Assign(FScheduledFilesToBeDeleted);
  try
    for i := tslAux.Count - 1 downto 0 do
    try
      if FileExists(tslAux[i]) then
        if DeleteFile(tslAux[i]) then
        begin
          FScheduledFilesToBeDeleted.Delete(FScheduledFilesToBeDeleted.IndexOf(tslAux[i]));
          tslAux.Delete(i);
        end else 
          LogMessage(CRLF + 'Error al borrar el archivo ' + tslAux[i] + CRLF + SysErrorMessage(GetLastError()), EVENTLOG_WARNING_TYPE, 0, 0);
    except
      on E: Exception do
        LogMessage(CRLF + 'Error al borrar el archivo ' + tslAux[i], EVENTLOG_WARNING_TYPE, 0, 0);
    end;
  finally
    tslAux.Free;
  end;
end;

procedure TServicePDF.ServiceLoadInfo(Sender : TObject);// new method, not an override
begin
  Name := ParamStr(2);
  DisplayName := ParamStr(3);
end;

procedure TServicePDF.KillProcessPDF(AProceso: String);
begin
  if GetPID(AProceso, 'avisoautomatico') <> 0 then
  begin
    LogMessage(CRLF + 'Eliminando proceso ' + AProceso, EVENTLOG_WARNING_TYPE, 0, 0);
    if KillProcessByPID(GetPID(AProceso, 'avisoautomatico')) then
      LogMessage(CRLF + 'Proceso ' + AProceso + ' eliminado con éxito', EVENTLOG_INFORMATION_TYPE, 0, 0)
    else
      LogMessage(CRLF + 'Proceso ' + AProceso + ' no pudo ser eliminado', EVENTLOG_WARNING_TYPE, 0, 0);
  end;
end;

procedure TServicePDF.TimerKillProcessTimer(Sender: TObject);
begin
  SendByMailServer('pmarrone,ptavasci', 'AvisosAutomaticos', 'Servicio PDF', '', 'El servicio PDF eliminará el proceso de la PDF Factory ya que una impresión se demoró más de 60 segundos.', false);
  KillProcessPDF(PROCESO_PDF_3);
  KillProcessPDF(PROCESO_PDF_5);
end;

procedure TServicePDF.ThreadDone(Sender: TObject);
begin
  Dec(FThreadsRunning);
  if FThreadsRunning = 0 then
  begin
    FIdle := True;
  end;
end;

{ TConversionThread }

constructor TConversionThread.Create(AId: TTableId; AFileName, AServerPath: String; ATipoDestino: TTipoDestino);
begin
  try
    FreeOnTerminate := True;
    Id              := AId;
    FileName        := AFileName;
    ServerPath      := AServerPath;
    TipoDestino     := ATipoDestino;

    BeginTrans(True);
    EjecutarSQLSTEx('UPDATE COMUNES.CCO_CONVERSIONPDF ' +
                       'SET CO_FECHATOMADO = SYSDATE, ' +
                           'CO_ESTADO = :estado, ' +
                           'CO_INDICEIMPRESORA = :indice ' +
                     'WHERE CO_ID = :id', ['T', FContador, AId], tmNone, True);
    CommitTrans(True);
  finally
  end;

  inherited Create(False);
end;

procedure TConversionThread.Execute;
begin
  inherited;
  DoSvrConvertir(Id, FileName, ServerPath, TipoDestino);
  ScheduleFileToBeDeleted(ServerPath + FileName);
end;

procedure TServicePDF.ServiceBeforeInstall(Sender: TService);
begin
  ServiceLoadInfo(Self);
end;

end.

