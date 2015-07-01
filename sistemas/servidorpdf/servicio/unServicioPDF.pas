unit unServicioPDF;
CAMBIO DE NOMBRE ESTA UNIT!
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ExtCtrls;

type
  TServicePDF = class(TService)
    tmrVerifPDF: TTimer;
    TimerKillProcess: TTimer;
    tmrServidorActivo: TTimer;
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure tmrServidorActivoTimer(Sender: TObject);
    procedure tmrVerifPDFTimer(Sender: TObject);
    procedure TimerKillProcessTimer(Sender: TObject);
  private
    FMinutos: Integer;
    FPathDestImage, FPathDestPDF: String;
    FScheduledFilesToBeDeleted: TStrings;
    procedure DeleteScheduledFiles;
    procedure ScheduleFileToBeDeleted(AFileName: String);
  public
    function GetServiceController: TServiceController; override;
  end;

Const
  IntervaloVerificacConversion = 2;    // en segundos
  IntervaloServicioActivo      = 30;   // en segundos

var
  ServicePDF: TServicePDF;

implementation

uses
  unDmPrincipal, Registry, unExportPDF, CustomDlgs, unArt, DB, unWinProcess,
  unComunesMail, unImageFunctions, ArchFuncs, Forms;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ServicePDF.Controller(CtrlCode);
end;

procedure TServicePDF.ServiceDestroy(Sender: TObject);
begin
  FScheduledFilesToBeDeleted.Free;
end;

procedure TServicePDF.ServiceCreate(Sender: TObject);
begin
  FScheduledFilesToBeDeleted := TStringList.Create;
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

procedure TServicePDF.ServiceStart(Sender: TService; var Started: Boolean);
begin
  LogMessage('Iniciando el servicio de conversión de archivos', EVENTLOG_INFORMATION_TYPE, 0, 0);

  if GetPID('fppdis3a.exe', 'avisoautomatico') <> 0 then
    Started := KillProcessByPID(GetPID('fppdis3a.exe', 'avisoautomatico'));
  
  if SetPrinterPDF(IMPRESORA_SERVIDOR_PDF) = -1 then
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
          with tmrVerifPDF do
            begin
              Interval := IntervaloVerificacConversion * 1000;
              Enabled  := True;
            end;

          DoActualizarServicioActivoServidorPDF;

          with tmrServidorActivo do
            begin
              Interval := IntervaloServicioActivo * 1000;
              Enabled  := True;
            end;
        end
      else
    end;
end;

procedure TServicePDF.tmrServidorActivoTimer(Sender: TObject);
var
  dUltimaConversion: TDateTime;
begin
  Inc(FMinutos);

  if FMinutos = IntervaloServicioActivo then
  begin
    dUltimaConversion := ValorSQLDateTime('SELECT max(co_fechaconversion) FROM comunes.cco_conversionpdf');
    LogMessage(CRLF + 'Servicio de conversión, reportando su funcionamiento correcto.' + CRLF + 'Última conversión: ' + DateTimeToStr(dUltimaConversion), EVENTLOG_INFORMATION_TYPE, 0, 0);
    FMinutos := 0;
  end;

  DoActualizarServicioActivoServidorPDF;
  DeleteScheduledFiles;
end;

procedure TServicePDF.tmrVerifPDFTimer(Sender: TObject);
var
  sSql, sFileName, sFileExtension, sPathDestSvr: String;
begin
  tmrVerifPDF.Enabled := False;
  tmrVerifPDF.Enabled := True;
  Application.ProcessMessages;
  Assert(GetCurrentThreadId = MainThreadId);
  
  if dmPrincipal.Debug then
    LogMessage(CRLF + 'Verificando los archivos pendientes de conversión', EVENTLOG_INFORMATION_TYPE, 0, 0);

  try
    //tmrVerifPDF.Enabled := False;
    try
      if dmPrincipal.VerificaConexion(Self) then
      begin
        sSql := 'SELECT ID, ARCHIVO ' +
                  'FROM (SELECT CO_ID ID, CO_ARCHIVO ARCHIVO ' +
                          'FROM CCO_CONVERSIONPDF ' +
                         'WHERE CO_ESTADO = :Estado ' +
                           'AND CO_ID <> 99999999 ' +
                         'ORDER BY 1) ' +
                 'WHERE ROWNUM = 1';
        with QuickGetQueryEx(sSql, ['P']) do
        try
          if dmPrincipal.Debug and not IsEmpty then
            LogMessage(Format(CRLF + 'Se encontraron %d archivos pendientes de conversión', [RecordCount]), EVENTLOG_INFORMATION_TYPE, 0, 0);

          while not Eof do
          begin
            EjecutarSQLEx('UPDATE comunes.cco_conversionpdf SET co_estado = :estado WHERE co_id = :id', ['T', FieldByName('ID').AsInteger]);
            if dmPrincipal.sdqConsulta.RowsAffected <> 1 then
              Break;

            sFileName := FieldByName('ARCHIVO').AsString;
            sFileExtension := GetFormatoArchivo(sFileName);

            if sFileExtension = 'PDF' then
              sPathDestSvr := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(FPathDestImage) + StringReplace(TIF_EXTENSION, '.', '', []))
            else
              sPathDestSvr := FPathDestPDF;

            DoSvrConvertir(FieldByName('ID').AsInteger, FieldByName('ARCHIVO').AsString, sPathDestSvr);
            //modificar para múltiples...
            ScheduleFileToBeDeleted(sPathDestSvr + FieldByName('ARCHIVO').AsString);
            Next;
          end;
        finally
          Free;
        end;
      end;
    finally
      //tmrVerifPDF.Enabled := True;
    end;
  except
    on E: Exception do
      LogMessage(CRLF + 'Error al verificar los archivos pendientes de conversión' + CRLF + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
  end;
end;

procedure TServicePDF.ScheduleFileToBeDeleted(AFileName: String);
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

procedure TServicePDF.TimerKillProcessTimer(Sender: TObject);
begin
  SendByMailServer('pmarrone,ptavasci', 'AvisosAutomaticos', 'Servicio PDF', '', 'El servicio PDF eliminará el proceso fppdis3a.exe ya que una impresión se demoró más de 60 segundos.', false);

  LogMessage(CRLF + 'Eliminando proceso fppdis3a.exe', EVENTLOG_WARNING_TYPE, 0, 0);
  if KillProcessByPID(GetPID('fppdis3a.exe', 'avisoautomatico')) then
    LogMessage(CRLF + 'Proceso fppdis3a.exe eliminado con éxito', EVENTLOG_INFORMATION_TYPE, 0, 0)
  else
    LogMessage(CRLF + 'Proceso fppdis3a.exe no pudo ser eliminado', EVENTLOG_WARNING_TYPE, 0, 0);
end;

end.
