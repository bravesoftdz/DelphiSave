unit unServicio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs, ExtCtrls, Login, artDbLogin, SDEngine,
  JvScheduledEvents, SqlFuncs, IdIntercept, IdLogBase, IdLogFile, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, System.ZIP, IdMessageClient, IdSMTPBase, IdSMTP, idMessage;

type
  TRegistroWorldSys = Record
    sFechaLote            : String;
    sTipoDoc              : String;
    sNroDocumento         : String;
    sNroCuit              : String;
    sDenominacion         : String;
    sDireccion            : String;
    sFechaNacimiento      : String;
    sFuente               : String;
    sPep                  : String;
    sTipoRelacion         : String;
    sCuitRelacion         : String;
    sDenominacionRelacion : String;
    sFechaNovedad         : String;
    end;

  TfrmServicioActualizacionWorldsys = class(TService)
    DBLogin: TDBLogin;
    IdFTP1: TIdFTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdLogFile1: TIdLogFile;
    IdSMTP1: TIdSMTP;
    JvScheduledEvents1: TJvScheduledEvents;
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure JvScheduledEvents1Events0Execute(
      Sender: TJvEventCollectionItem; const IsSnoozeEvent: Boolean);
  private
    FTP_ADDRESS : String;
    FTEMP_DIR : String;
    FUSUARIO : String;
    FPASSWORD: String;
    FMAILERROR : String;
    FPORT : String;
    xf : TZIPFile;
    procedure ProcesarWorldsys;
    procedure DescargarArchivo;
    procedure ProcessTextFile(const aTxtFile: String);
    procedure ProcessTextLine(Const aTextLine: String);
    procedure InsertarDB(Const aRegistro: TRegistroWorldSys);
    procedure EnviarEmail(const MailTo, MailFrom, Body, Asunto: String);

    function GetFechaLoteFromTextLine(Const aTextLine: String): String;
    function GetTipoDocFromTextLine(Const aTextLine: String): String;
    function GetNumeroDocFromTextLine(Const aTextLine: String): String;
    function GetCUITFromTextLine(Const aTextLine: String): String;
    function GetDenominacionFromTextLine(Const aTextLine: String): String;
    function GetDireccionFromTextLine(Const aTextLine: String): String;
    function GetFechaNacimientoFromTextLine(Const aTextLine: String): String;
    function GetPepFromTextLine(Const aTextLine: String): String;
    function GetTipoRelacionFromTextLine(Const aTextLine: String): String;
    function GetCUITRelacionFromTextLine(Const aTextLine: String): String;
    function GetDenominacionRelacionFromTextLine(Const aTextLine: String): String;
    function GetFechaNovedadFromTextLine(Const aTextLine: String): String;
  public
    function GetServiceController: TServiceController; override;
  end;

var
  frmServicioActualizacionWorldsys: TfrmServicioActualizacionWorldsys;

implementation

uses
  unDmPrincipal, AnsiSql, Registry, unEnvioMail, unMoldeEnvioMail, unCustomDataModule, Numeros;

const
  DESCRIPCION_DEL_SERVICIO = 'de Actualizacion Worldsys.';

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  frmServicioActualizacionWorldsys.Controller(CtrlCode);
end;

procedure TfrmServicioActualizacionWorldsys.DescargarArchivo;
begin
  idFtp1.Username := FUSUARIO;
  idFtp1.Password := FPASSWORD;
  idFtp1.Port     := StrToInt(FPORT);
  idFtp1.Host     := FTP_ADDRESS;
  idFtp1.Passive  := True;

  try
    idFtp1.Disconnect;
    LogMessage('Conectando a WORLDSYS . ', EVENTLOG_INFORMATION_TYPE, 0, 0);
    idFtp1.Connect;
    LogMessage('Conexión: ON-LINE. ', EVENTLOG_INFORMATION_TYPE, 0, 0);
  except
    on E: Exception do
    begin
      LogMessage('Conexión: Falló. ' + E.Message, EVENTLOG_ERROR_TYPE, 0, 0);
      EnviarEmail(FMAILERROR , 'avisoautomatico@provart.com.ar', 'Conexión: Falló '+ e.ClassName+ ' ' + e.Message, 'WorldSys');
    end;
  end;

  try
    DeleteFile(FTEMP_DIR + '\PART.zip');
    if idFtp1.Connected then
    begin
      LogMessage('Descargando PART.zip . ', EVENTLOG_INFORMATION_TYPE, 0, 0);
      idFtp1.Get('PART.zip', FTEMP_DIR + '\PART.zip', True, False);
      LogMessage('Descarga Finalizada.', EVENTLOG_INFORMATION_TYPE, 0, 0);
    end;
  except
    //LevantarError
    on E: Exception do
    begin
      LogMessage('La descarga del FTP ha fallado. ', EVENTLOG_ERROR_TYPE, 0, 0);
      EnviarEmail(FMAILERROR, 'avisoautomatico@provart.com.ar', 'La descarga del FTP ha fallado. '+ e.ClassName+ ' ' + e.Message, 'WorldSys');
    end;
  end;
  idFtp1.Disconnect;

  idLogFile1.Active := False;

  try
    DeleteFile(FTEMP_DIR + '\PART_02.txt');
    if FileExists(FTEMP_DIR + '\PART.zip') then
    begin
      try
        LogMessage('Descomprimiendo archivo .ZIP. ', EVENTLOG_INFORMATION_TYPE, 0, 0);
        xf := TZIPFile.Create();
        xf.Open(FTEMP_DIR + '\PART.zip', zmRead);
        xf.ExtractAll(FTEMP_DIR+ '\');
        xf.Close;
      finally
        xf.Free;
      end;
    end
    else
      LogMessage('El archivo Zip no existe. ', EVENTLOG_INFORMATION_TYPE, 0, 0);
  except
    on E: Exception do
    begin
      LogMessage('Error en la descrompresión. '+ e.ClassName+ ' ' + e.Message, EVENTLOG_ERROR_TYPE, 0, 0);
      EnviarEmail(FMAILERROR, 'avisoautomatico@provart.com.ar', 'Error en la descrompresión. '+ e.ClassName+ ' ' + e.Message, 'WorldSys');
    end;
  end;

  try
    if FileExists(FTEMP_DIR + '\PART_02.txt') then
    begin
      LogMessage('Procesando archivo Part_02.txt. ', EVENTLOG_INFORMATION_TYPE, 0, 0);
      ProcessTextFile(FTEMP_DIR + '\PART_02.txt')
    end
    else
    begin
       LogMessage('El archivo Part_02.txt no existe. ', EVENTLOG_ERROR_TYPE, 0, 0);
    end;
  except
    on e: Exception do
    begin
      Rollback;
      LogMessage('Error al procesar. Se hizo Rollback '+ e.ClassName+ ' ' + e.Message, EVENTLOG_ERROR_TYPE, 0, 0);
      EnviarEmail(FMAILERROR, 'avisoautomatico@provart.com.ar', 'Error al procesar. Se hizo Rollback '+ e.ClassName+ ' ' + e.Message, 'WorldSys');
    end;//LevantarError;
  end;

//ShowMessage('Actualizacion Completa');

end;

procedure TfrmServicioActualizacionWorldsys.EnviarEmail(const MailTo,
  MailFrom, Body, Asunto: String);
var
  mail: TIdMessage;
begin
  mail := TIdMessage.Create(nil);

  mail.From.Address := MailFrom;
  mail.Recipients.EMailAddresses := MailTo;
  mail.Body.Text := Body;
  mail.Subject := Asunto;
  try
    try
     idSmtp1.Connect;
     idSmtp1.Send(mail) ;
   except on E:Exception do
     LogMessage('Error al enviar email '+ e.ClassName+ ' ' + e.Message, EVENTLOG_ERROR_TYPE, 0, 0);
   end;
 finally
   if idSmtp1.Connected then
     idSmtp1.Disconnect;
   mail.Free;
 end;
end;

function TfrmServicioActualizacionWorldsys.GetCUITFromTextLine(
  const aTextLine: String): String;
begin
  Result := Trim(Copy(aTextLine, 21, 11));
end;

function TfrmServicioActualizacionWorldsys.GetCUITRelacionFromTextLine(
  const aTextLine: String): String;
begin
  Result := Trim(Copy(aTextLine, 1222, 11));
end;

function TfrmServicioActualizacionWorldsys.GetDenominacionFromTextLine(
  const aTextLine: String): String;
begin
   Result := StringReplace(Trim(Copy(aTextLine, 32, 255)), '¥', 'Ñ',[rfReplaceAll]);
end;

function TfrmServicioActualizacionWorldsys.GetDenominacionRelacionFromTextLine(
  const aTextLine: String): String;
begin
 Result := Trim(Copy(aTextLine, 1233, 255));
end;

function TfrmServicioActualizacionWorldsys.GetDireccionFromTextLine(
  const aTextLine: String): String;
begin
  Result := Trim(Copy(aTextLine, 285, 255));
end;

function TfrmServicioActualizacionWorldsys.GetFechaLoteFromTextLine(
  const aTextLine: String): String;
begin
  Result := Copy(aTextLine, 1, 10);
end;

function TfrmServicioActualizacionWorldsys.GetFechaNacimientoFromTextLine(
  const aTextLine: String): String;
begin
  Result := Trim(Copy(aTextLine, 787, 11));
end;

function TfrmServicioActualizacionWorldsys.GetFechaNovedadFromTextLine(
  const aTextLine: String): String;
begin
  Result := Trim(Copy(aTextLine, 1487, 24));
end;

function TfrmServicioActualizacionWorldsys.GetNumeroDocFromTextLine(
  const aTextLine: String): String;
begin
  Result := Trim(Copy(aTextLine, 13, 8));
end;

function TfrmServicioActualizacionWorldsys.GetPepFromTextLine(
  const aTextLine: String): String;
begin
  Result := Trim(Copy(aTextLine, 1216, 2));
end;

function TfrmServicioActualizacionWorldsys.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

function TfrmServicioActualizacionWorldsys.GetTipoDocFromTextLine(
  const aTextLine: String): String;
begin
  Result := Trim(Copy(aTextLine, 11, 2));
end;

function TfrmServicioActualizacionWorldsys.GetTipoRelacionFromTextLine(
  const aTextLine: String): String;
begin
  Result := Trim(Copy(aTextLine, 1219, 3));
end;

procedure TfrmServicioActualizacionWorldsys.InsertarDB(
  const aRegistro: TRegistroWorldSys);
var
  sSql: String;
begin
  sSql := 'INSERT INTO pep.pwo_worldsys' +
        '(wo_tipodoc, wo_nrodocumento, ' +
         'wo_cuit, wo_denominacion, wo_direccion, wo_pep, ' +
         'wo_tiporelacion, wo_cuit_relac, wo_denominacion_relac';
  if aRegistro.sFechaLote <> '' then
       sSql := sSql + ', wo_fechalote';
  if aRegistro.sFechaNacimiento <> '' then
       sSql := sSql + ', wo_fechadenacimiento';
  if aRegistro.sFechaNovedad <> '' then
       sSql := sSql + ', wo_fechanovedad';

  sSql := sSql + ') VALUES ' +
                 '(:tipodoc, :nrodoc, ' +
                 ':cuit, :denominacion, :direccion, :pep, ' +
                 ':tiporelacion, :cuitrela, :denominacionrela';

  if aRegistro.sFechaLote <> '' then
    sSql := sSql + ', '+ SqlDate(StrToDateTime(aRegistro.sFechaLote));
  if aRegistro.sFechaNacimiento <> '' then
    sSql := sSql + ', '+ SqlDate(StrToDateTime(aRegistro.sFechaNacimiento));
  if aRegistro.sFechaNovedad <> '' then
    sSql := sSql + ', '+ SqlDateTime(StrToDateTime(aRegistro.sFechaNovedad));
  sSql := sSql +')';



  EjecutarSqlSTEx(sSql, [
                        aRegistro.sTipoDoc, aRegistro.sNroDocumento,
                        aRegistro.sNroCuit, aRegistro.sDenominacion, aRegistro.sDireccion, aRegistro.sPep,
                        aRegistro.sTipoRelacion, aRegistro.sCuitRelacion, aRegistro.sDenominacionRelacion
                        ]);
end;

procedure TfrmServicioActualizacionWorldsys.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  LogMessage('Instalando el servicio ' + DESCRIPCION_DEL_SERVICIO, EVENTLOG_INFORMATION_TYPE, 0, 0);

  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, False) then
      begin
        Reg.WriteString('Description', 'Servicio ' + DESCRIPCION_DEL_SERVICIO);
        Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmServicioActualizacionWorldsys.ServiceExecute(Sender: TService);
begin
 // LogMessage('Ejecutando Evento del Servicio ', EVENTLOG_INFORMATION_TYPE, 0, 0);
  ProcesarWorldsys;
  while not Terminated do
  begin
    Sleep(100); //evitar todo el uso de procesador El evento lo lanza el JvScheduledEvents1
    ServiceThread.ProcessRequests(False);
  end;
end;

procedure TfrmServicioActualizacionWorldsys.ServiceStart(Sender: TService; var Started: Boolean);
begin
  LogMessage('Inicio del servicio ' + DESCRIPCION_DEL_SERVICIO, EVENTLOG_INFORMATION_TYPE, 0, 0);
  DBLogin.CustomUserName := 'CVONWERNICH';
  DBLogin.Execute;
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  Started := True;
end;

procedure TfrmServicioActualizacionWorldsys.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  LogMessage('Fin del servicio ' + DESCRIPCION_DEL_SERVICIO, EVENTLOG_INFORMATION_TYPE, 0, 0);
end;

procedure TfrmServicioActualizacionWorldsys.JvScheduledEvents1Events0Execute(
  Sender: TJvEventCollectionItem; const IsSnoozeEvent: Boolean);
begin
  LogMessage('Ejecutando Evento del Servicio ', EVENTLOG_INFORMATION_TYPE, 0, 0);
  if dmPrincipal.VerificaConexion(frmServicioActualizacionWorldsys) then
    ProcesarWorldsys
  else
    LogMessage('DB No conectada ', EVENTLOG_ERROR_TYPE, 0, 0);
end;

procedure TfrmServicioActualizacionWorldsys.ProcesarWorldsys;
var
  sSql : String;
  aQuery: TSDQuery;
begin
  sSql := 'SELECT pa_usuario, pa_port, pa_pass, pa_url, pa_dirtemp, pa_mailerror FROM pep.ppa_paramftp';
  aQuery := GetQuery(sSql,[]);
  with aQuery do
  try
    if not Eof then
    begin
      FTP_ADDRESS := FieldByName('pa_url').AsString;
      FTEMP_DIR   := FieldByName('pa_dirtemp').AsString;
      FPASSWORD   := FieldByName('pa_pass').AsString;
      FUSUARIO    := FieldByName('pa_usuario').AsString;
      FPORT       := FieldByName('pa_port').AsString;
      FMAILERROR  := FieldByName('pa_mailerror').AsString;
    end;
  finally
    Free;
  end;
  LogMessage('Intentando Descargar Archivo: ' + FTP_ADDRESS + ':' + FPORT  , EVENTLOG_INFORMATION_TYPE, 0, 0);
  DescargarArchivo;
end;

procedure TfrmServicioActualizacionWorldsys.ProcessTextFile(
  const aTxtFile: String);
var
   Count, I : Integer;
   Lineas : TStringList;
begin
  Lineas := TStringList.Create;
  BeginTrans;
  try
    Lineas.LoadFromFile(aTxtFile);
    LogMessage('Borrando tabla pep.pwo_worldsys. ', EVENTLOG_INFORMATION_TYPE, 0, 0);
    EjecutarSqlSTEx('Delete from pep.pwo_worldsys', []);
    LogMessage('Procesando Lineas de '+ aTxtFile +'. ', EVENTLOG_INFORMATION_TYPE, 0, 0);
    Count := 0;
    LogMessage('Total de Lineas ' + IntToStr(Lineas.Count) +'. ', EVENTLOG_INFORMATION_TYPE, 0, 0);
    for I := 0 to Lineas.Count -1 do
    begin
      Inc(Count);
      if Count mod 1000 = 0 then
        LogMessage('Procesando Linea '+ IntToStr(Count) +'. ', EVENTLOG_INFORMATION_TYPE, 0, 0);
      ProcessTextLine(Lineas[I]);
    end;
    LogMessage('Lineas procesadas correctamente ' + IntToStr(Count), EVENTLOG_SUCCESS, 0, 0);
    CommitTrans;
  finally
    Lineas.Free;
  end;
end;

procedure TfrmServicioActualizacionWorldsys.ProcessTextLine(
  const aTextLine: String);
var
  Registro : TRegistroWorldSys;
begin
  //LogMessage('Procesando Reg. '+ Registro.sFechaLote, EVENTLOG_INFORMATION_TYPE, 0, 0);
  Registro.sFechaLote            := GetFechaLoteFromTextLine(aTextLine);
  Registro.sTipoDoc              := GetTipoDocFromTextLine(aTextLine);
  Registro.sNroDocumento         := GetNumeroDocFromTextLine(aTextLine);
  Registro.sNroCuit              := GetCUITFromTextLine(aTextLine);
  Registro.sDenominacion         := GetDenominacionFromTextLine(aTextLine);
  Registro.sDireccion            := GetDireccionFromTextLine(aTextLine);
  Registro.sFechaNacimiento      := GetFechaNacimientoFromTextLine(aTextLine);
  Registro.sPep                  := GetPepFromTextLine(aTextLine);
  Registro.sTipoRelacion         := GetTipoRelacionFromTextLine(aTextLine);
  Registro.sCuitRelacion         := GetCUITRelacionFromTextLine(aTextLine);
  Registro.sDenominacionRelacion := GetDenominacionRelacionFromTextLine(aTextLine);
  Registro.sFechaNovedad         := GetFechaNovedadFromTextLine(aTextLine);


  {Memo1.Lines.Add(Registro.sFechaLote+ ' '+
                  Registro.sTipoDoc+' '+
                  Registro.sNroDocumento+' '+
                  Registro.sNroCuit+' '+
                  Registro.sDenominacion+' '+
                  Registro.sDireccion+' '+
                  Registro.sFechaNacimiento+' '+
                  Registro.sPep+' '+
                  Registro.sTipoRelacion+' '+
                  Registro.sCuitRelacion+' '+
                  Registro.sDenominacionRelacion+' '+
                  Registro.sFechaNovedad);}
  InsertarDB(Registro);
end;

end.
