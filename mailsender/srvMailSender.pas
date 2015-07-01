unit srvMailSender;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ShlObj, AnsiSql, DB, SDEngine, ExtCtrls, sx_MAPI, SDOra, JvComponent,
  JvAppEvent;

const
  CANT_A_REVISAR: Integer = 60;
  UN_SEGUNDO: Cardinal = 1000;

  RESPUESTA_AUTOMATICA = '{\rtf1\ansi\ansicpg1252\deff0\deflang11274{\fonttbl{\f0\fswiss\fprq2\fcharset0 Tahoma;}{\f1\fswiss\fcharset0 Arial;}}' +
                         '{\*\generator Msftedit 5.41.15.1507;}\viewkind4\uc1\pard\f0\fs20 Este buz\''f3n est\''e1 configurado para no recibir correo.\par' +
                         ' Por favor cumun\''edquese telef\''f3nicamente con Atenci\''f3n al Cliente al 0-800-333-1278 o bien por correo a info@provart.com.ar.\f1\par' +
                         '}';
                         
type
  TMailSender = class(TService)
    DispararEnvio: TTimer;
    VerificarRecepcion: TTimer;
    ChequeoHabitual: TTimer;
    AppEvents: TJvAppEvents;
    procedure DispararEnvioTimer(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceCreate(Sender: TObject);
    procedure VerificarRecepcionTimer(Sender: TObject);
    procedure ChequeoHabitualTimer(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
    procedure AppEventsException(Sender: TObject; E: Exception);
  private
    dTiempo: TDateTime;
    bEjecutando: boolean;
    Folder: TsxMAPI_Folder;
    FolderDeleted: TsxMAPI_Folder;
    sxSession : TsxMAPI_Session;
    sPathAdjuntos : String;
    procedure DispararMensajes;
    //Obtiene el path para guardar los adjuntos. retorna False si hubo un error o el path es vacio
    function SetPathAdjuntos(): boolean;
    function BuzonFrecuente(var AMailAddress: string): boolean;
    procedure MarcarConError(IdMensaje: Integer; Mensaje: String);
  public
    function GetServiceController: TServiceController; override;
  end;

var
  MailSender: TMailSender;

implementation

uses
  IArtMail, unDmPrincipal, ArchFuncs, unCustomDataModule, WinShell, StrUtils,
  {** XE2 - Acoplamiento ** unMoldeEnvioMail, }
  CtrlToRTF, unART, Registry, Forms, Math, General, StrFuncs, unMail;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  MailSender.Controller(CtrlCode);
end;

function TMailSender.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TMailSender.DispararEnvioTimer(Sender: TObject);
begin
  try
    bEjecutando := True;
    DispararEnvio.Enabled := False;
    try
      if dmPrincipal.VerificaConexion(Self) then
        DispararMensajes;
    except
      on E: Exception do begin
        LogMessage('Error al Disparar Envio : ' + E.Message, EVENTLOG_ERROR_TYPE, 1, 100);
      end;
    end;
  finally
    bEjecutando := False;
    DispararEnvio.Enabled := True;
  end;
end;

procedure TMailSender.ServiceStart(Sender: TService; var Started: Boolean);
begin
  if SetPathAdjuntos() = False
  then begin
    Started := False;  // No inicia el servicio
    LogMessage('Finalizando servicio - Error : Path para almacenar archivos adjuntos de los mails automaticos no configurado.', EVENTLOG_ERROR_TYPE, 0, 30);
  end;

  LogMessage('Iniciando Servicio de Envio de Correo', EVENTLOG_INFORMATION_TYPE, 0, 10);
end;

procedure TMailSender.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  LogMessage('Finalizando Servicio de Envio de Correo', EVENTLOG_INFORMATION_TYPE, 0, 31);
end;

procedure TMailSender.DispararMensajes;
var
  sDirecciones : TStringList;
  sPathTemporal : string;
  Stream : TFileStream;
  Protocolo : TTransportAgent;
  Attachments : TStringList;
  FileName, DestFileName, sDireccionOrigen : string;
  Ext : string;
  sdqCorreosPendientes : TSDQuery;
  sdqAdjuntosPendientes : TSDQuery;
  sSQL, sTipoCuerpo, sCuerpo: string;
  i, nIdMensaje : integer;
  sBody: TStringList;
begin
  LogMessage('Inicio - Verificando Mensajes a Enviar (cada ' + IntToStr(Round(DispararEnvio.Interval/UN_SEGUNDO)) + ' segundos)', EVENTLOG_INFORMATION_TYPE, 1, 101);
  sPathTemporal := TempPath;
  DispararEnvio.Enabled := False;

  try
    sDirecciones := TStringList.Create;
    Attachments  := TStringList.Create;
    sBody := TStringList.Create;

    sSQL := 'SELECT * FROM (SELECT EE_ID, EE_DIRECCIONESDESTINO, EE_MOTIVO, EE_CUERPO, ' +
                   'EE_FECHAMENSAJE, EE_FECHAENVIO, EE_DIRECCIONORIGEN, ' +
                   'EE_TIPOCUERPO, EE_IDORIGENGENERACION, CO_EMAIL, CO_DISPLAYNAME ' +
             ' FROM COMUNES.CEE_EMAILAENVIAR, COMUNES.CCO_CUENTAORIGEN ' +
             'WHERE EE_FECHAENVIO IS NULL ' +
               'AND EE_FECHAMENSAJE < SYSDATE ' +
               'AND EE_ESTADO = :ESTADO ' +
               'AND EE_IDCUENTAORIGEN = CO_ID(+) '+
               ' ' +
//               'AND EE_FECHAMENSAJE > trunc(SYSDATE) ' +
//               'AND EE_DIRECCIONESDESTINO like ''ptavasci@%'' ' +     //Comentario para Prueba //testing
          'ORDER BY EE_ID) WHERE ROWNUM <= :CANTIDAD';

    sdqCorreosPendientes := GetQueryEx(sSQL, ['N', CANT_A_REVISAR]);

    with sdqCorreosPendientes do
    try
      dTiempo := Now;

      if Active and not IsEmpty then
        nIdMensaje := FieldByName('EE_ID').AsInteger
      else
        nIdMensaje := ART_EMPTY_ID;
        
      while not Eof do
      begin
        BeginTrans(True);
        try
          sDirecciones.CommaText := StringReplace(StringReplace(FieldByName('EE_DIRECCIONESDESTINO').AsString, ';', ',', [rfReplaceAll]), '%', ',', [rfReplaceAll]);
          sTipoCuerpo := FieldByName('EE_TIPOCUERPO').AsString;
          nIdMensaje := FieldByName('EE_ID').AsInteger;

          sSQL := 'SELECT ea_id, ea_nombreadjunto, ea_idemailaenviar, ea_link, ea_path, ea_idformulario, ' +
                        ' CASE ' +
                           'WHEN ea_cuerpoadjunto IS NULL THEN ''S'' ' +
                           'ELSE ''N'' ' +
                         'END as CUERPO_NULO ' +
                    'FROM COMUNES.CEA_EMAILADJUNTO ' +
                   'WHERE EA_IDEMAILAENVIAR = :ID';
          sdqAdjuntosPendientes := GetQueryEx(sSQL, [nIdMensaje]);
          try
            Attachments.Clear;
            while not sdqAdjuntosPendientes.eof do
            begin
              if sdqAdjuntosPendientes.FieldByName('EA_LINK').AsString = 'N' then
              begin
                FileName := IncludeTrailingPathDelimiter(sPathTemporal) + ExtractFileName(sdqAdjuntosPendientes.FieldByName('EA_NOMBREADJUNTO').AsString);

                if sdqAdjuntosPendientes.FieldByName('CUERPO_NULO').AsString = 'S' then
                begin
                  CopyFile(PChar(sdqAdjuntosPendientes.FieldByName('EA_PATH').AsString), PChar(FileName), False);
                end else
                begin
                  Stream := TFileStream.Create(FileName, fmCreate);
                  try
                    BlobSql('SELECT EA_CUERPOADJUNTO ' +
                              'FROM COMUNES.CEA_EMAILADJUNTO ' +
                             'WHERE EA_ID = ' + sdqAdjuntosPendientes.FieldByName('EA_ID').AsString, Stream);
                  finally
                    Stream.Free;
                  end;
                end;
                Attachments.Add(FileName);

                Ext := ExtractFileExt(FileName);
                ForceDirectories(IncludeTrailingPathDelimiter(sPathAdjuntos) + FormatDateTime('YYYYMMDD', sdqCorreosPendientes.FieldByName('EE_FECHAMENSAJE').AsDateTime) + '\');
                DestFileName := IncludeTrailingPathDelimiter(sPathAdjuntos) + FormatDateTime('YYYYMMDD', sdqCorreosPendientes.FieldByName('EE_FECHAMENSAJE').AsDateTime) + '\' + sdqAdjuntosPendientes.FieldByName('EA_ID').AsString + Ext;

                // No borra el adjunto de la base si no lo puede copiar.
                if CopyFile(PAnsiChar(FileName), PAnsiChar(DestFileName), True) then
                begin
                  // Vacío el campo del adjunto en primera instancia...
                  EjecutarSqlSTEx( 'UPDATE COMUNES.CEA_EMAILADJUNTO ' +
                                      'SET EA_PATH = :DEST_FILENAME, ' +
                                          'EA_CUERPOADJUNTO = EMPTY_BLOB() ' +
                                    'WHERE EA_ID = :ID', [DestFileName, sdqAdjuntosPendientes.FieldByName('EA_ID').AsInteger]);

                  // ...para luego nulear el campo del adjunto por completo...
                  EjecutarSqlSTEx( 'UPDATE COMUNES.CEA_EMAILADJUNTO ' +
                                      'SET EA_CUERPOADJUNTO = NULL ' +
                                    'WHERE EA_ID = :ID', [sdqAdjuntosPendientes.FieldByName('EA_ID').AsInteger]);
                end;
              end else begin
                Attachments.Add( CreateShellLink(sdqAdjuntosPendientes.FieldByName('EA_PATH').AsString , sPathTemporal, sdqAdjuntosPendientes.FieldByName('EA_NOMBREADJUNTO').AsString) );
              end;
              sdqAdjuntosPendientes.Next;
            end;
            sdqAdjuntosPendientes.Close;
          finally
            sdqAdjuntosPendientes.Free;
          end;

          {---- Cuerpo del mensaje ----}
          if FieldByName('EE_CUERPO').IsNull then
          begin
            sBody.Clear;
            BlobSql('SELECT EE_CUERPOEX ' +
                      'FROM COMUNES.CEE_EMAILAENVIAR ' +
                     'WHERE EE_ID = ' + SqlValue(nIdMensaje), sBody);
            sCuerpo := sBody.Text;
          end
          else sCuerpo := FieldByName('EE_CUERPO').AsString;

          {---- Protocolo ----}
          if FieldByName('CO_EMAIL').AsString <> '' then
            Protocolo := taSMTP
          else if sTipoCuerpo = 'R' then
            Protocolo := taExtendedMAPI
          else if sTipoCuerpo = 'T' then
          begin
            Protocolo := taSMTP;
            sCuerpo := '<HTML><BODY><TEXTO_PLANO>' + StringReplace(StringReplace(StringReplace(StringReplace(sCuerpo, CRLF, '<BR>', [rfReplaceAll]),
                                                                                                                      #10#13, '<BR>', [rfReplaceAll]),
                                                                                                                      #13, '<BR>', [rfReplaceAll]),
                                                                                                                      #10, '<BR>', [rfReplaceAll]) + '</BODY></HTML>'
          end else if sTipoCuerpo = 'H' then
            Protocolo := taSMTP
          else
            Protocolo := taExtendedMAPI;

          {---- Cuentas de mail alternativas ----}
          if IsEmptyString(FieldByName('CO_EMAIL').AsString) then
            if (not IsEmptyString(FieldByName('EE_DIRECCIONORIGEN').AsString))
            and (Pos('AUTOMATICO', UpperCase(FieldByName('EE_DIRECCIONORIGEN').AsString)) = 0) then
            begin
              if Pos('@', FieldByName('EE_DIRECCIONORIGEN').AsString) = 0 then
                sDireccionOrigen := LowerCase(FieldByName('EE_DIRECCIONORIGEN').AsString) + '@provart.com.ar'
              else
                sDireccionOrigen := LowerCase(FieldByName('EE_DIRECCIONORIGEN').AsString);
            end else
              sDireccionOrigen := 'avisos@provart.com.ar'
          else
            sDireccionOrigen := FieldByName('CO_EMAIL').AsString;

          try
            //LogMessage('Enviando mail en formato ' + sTipoCuerpo + ' Id: ' + IntToStr(nIdMensaje), EVENTLOG_INFORMATION_TYPE, 1, 104);
            EnviarMail(sDirecciones, sDireccionOrigen,
                       FieldByName('EE_MOTIVO').AsString, Attachments,
                       sCuerpo, Protocolo,
                       'AvisosAutomaticos', False, False, sTipoCuerpo = 'R', nIdMensaje, FieldByName('CO_DISPLAYNAME').AsString );
            //LogMessage('Mail enviado ' + sTipoCuerpo + ' Id: ' + IntToStr(nIdMensaje), EVENTLOG_INFORMATION_TYPE, 1, 104);
          except
            on E: Exception do
            begin
              LogMessage(CRLF + 'El mensaje no pudo ser entregado a ' + Trim(sDirecciones.CommaText) + '.' + CRLF + E.Message, EVENTLOG_WARNING_TYPE, 1, 102);
              if Pos('MAPI not initialized', E.Message) = 0 then
                MarcarConError(nIdMensaje, E.Message)
              else
                Rollback(True);
            end;
          end;

          try
            if Assigned(Attachments) and (Attachments.Count > 0) then
               for i := 0 to Attachments.Count - 1 do
                 try
                   DeleteFile(Attachments.Strings[i]);
                 except
                 end;
          except
          end;

          EjecutarSqlSTEx('UPDATE CEE_EMAILAENVIAR ' +
                             'SET EE_FECHAENVIO = SYSDATE ' +
                           'WHERE EE_ID = :ID', [nIdMensaje]);
        except
          on E: Exception do
          begin
            LogMessage(CRLF + 'Error al procesar mensaje: ' + CRLF + E.Message, EVENTLOG_ERROR_TYPE, 1, 103);
            MarcarConError(nIdMensaje, E.Message);
          end;
        end;
        CommitTrans(True);
        Next;
      end;

      if RecordCount < CANT_A_REVISAR then
        DispararEnvio.Interval := Min(DispararEnvio.Interval + (5 * UN_SEGUNDO), 60 * 4 * UN_SEGUNDO {4 minutos}) //Reviso cada vez cada mas cantidad de tiempo mientras no haya muchos mails pendientes de enviar...
      else
        DispararEnvio.Interval := 5 * UN_SEGUNDO; //Reviso cada 5 segundos cuando hay muchos para enviar...

      LogMessage('Fin del chequeo, procesados ' + IntToStr(RecordCount), EVENTLOG_INFORMATION_TYPE, 1, 105);
      Close;
    finally
      CommitTrans(True);
      sdqCorreosPendientes.Close;
      sdqCorreosPendientes.Free;
      sDirecciones.Free;
      Attachments.Free;
      sBody.Free;
      DispararEnvio.Enabled := True;
    end;
  except
    on E: Exception do begin
      Rollback(True);
      LogMessage('Error al procesar mensaje: ' + E.Message, EVENTLOG_ERROR_TYPE, 1, 105);
      DispararEnvio.Enabled := True;
    end;
  end;
//  LogMessage('Fin Verificando Mensajes a Enviar.', EVENTLOG_INFORMATION_TYPE, 0, 0);
end;

procedure TMailSender.MarcarConError(IdMensaje: Integer; Mensaje: String);
begin
{
  try
    EjecutarSqlSTEx('UPDATE CEE_EMAILAENVIAR ' +
                       'SET EE_ESTADO = :ESTADO, ' +
                           'EE_CUERPO = NVL(EE_CUERPO, :ERROR) ' +
                     'WHERE EE_ID = :Id', ['X', 'Mensaje con error' + CRLF + Mensaje, IdMensaje]);
  except
    on E: Exception do
    begin
      EjecutarSqlSTEx('UPDATE CEE_EMAILAENVIAR ' +
                         'SET EE_ESTADO = :ESTADO ' +
                       'WHERE EE_ID = :Id', ['X', IdMensaje]);
    end;
  end;
}
  EjecutarSqlSTEx('UPDATE CEE_EMAILAENVIAR ' +
                     'SET EE_ESTADO = :ESTADO ' +
                   'WHERE EE_ID = :Id', ['X', IdMensaje]);
end;

procedure TMailSender.ServiceCreate(Sender: TObject);
begin
  bEjecutando := False;
  DispararEnvio.Enabled := True;

  //Sleep(10000);
  sxSession := TsxMAPI_Session.Create(nil);
  with sxSession do
  begin
    Name := 'sxSessionEnvioAutomatico';
    ProfileName := 'AvisosAutomaticos';
    DoMAPIInit := True;
    InService := True;
    MessageSendFlag := sxsfDelete;//sxsfToSent; //testing
    Logon;
  end;

  Folder := sxSession.Folder[sxftInBox];
  FolderDeleted := sxSession.Folder[sxftDeleted];  //testing
end;

procedure TMailSender.VerificarRecepcionTimer(Sender: TObject);
var
  i, iPos, iCantidadInicial: integer;
  sDireccion, sDato, sCuerpo, sCuerpoAux: string;
//  Attachments : TStringList;
  Font: TFont;
  bRTFBody: boolean;
begin
  if not Assigned(Folder) or not dmPrincipal.Is_ConectadoProduccion then
    Exit;

  if not DispararEnvio.Enabled then
  begin
    LogMessage('Espero 2 segundos a que termine de enviar los mensajes para empezar a procesar la bandeja de entrada (' + IntToStr(Folder.MsgCount) + ' mensajes)', EVENTLOG_WARNING_TYPE, 2, 200);
    VerificarRecepcion.Interval := UN_SEGUNDO * 2;
    Abort;
  end;

  VerificarRecepcion.Enabled := False;
  DispararEnvio.Enabled := False;
  Folder.RefreshContents;

  LogMessage('Iniciando el chequeo de la bandeja de entrada (' + IntToStr(Folder.MsgCount) + ' mensajes)', EVENTLOG_INFORMATION_TYPE, 2, 201);
  try
    i := Folder.MsgCount;
    iCantidadInicial := Folder.MsgCount;

    try
      with Folder do
      begin
        while (MsgCount > 0) and (i > 0) and ((iCantidadInicial - i) < 50) do
        begin
          try
            Dec(i);
            LogMessage(CRLF + 'Procesando mensaje ' + IntToStr(iCantidadInicial - i) + ' de la bandeja de entrada proveniente de ' + Msg[i].Sender + ' , con fecha ' + DateToStr(Folder.Msg[i].SentTime) + ' , con el siguiente asunto:' + CRLF + CRLF + Msg[i].Subject, EVENTLOG_INFORMATION_TYPE, 2, 202);
            //Folder.Msg[i].Sender; //Quien lo mandó
            //Folder.Msg[i].Subject; //Asunto
            //Folder.Msg[i].SentTime; //Fecha de envío del mensaje

            if Pos('NO ENTREGABLE: ', UpperCase(Msg[i].Subject)) > 0 then
              Continue;

            try
              bRTFBody := False;

              try
                sCuerpo := Msg[i].Body;
              except
                on E: Exception do
                  LogMessage(CRLF + 'Procesando mensaje ' + IntToStr(iCantidadInicial - i) + ' de la bandeja de entrada proveniente de ' + Msg[i].Sender + ' con el siguiente asunto:' + CRLF + CRLF + Msg[i].Subject + CRLF + CRLF + 'Error: ' + E.Message, EVENTLOG_ERROR_TYPE, 2, 203);
              end;

              iPos := Pos('FROM_ADDRESS_ART=', sCuerpo);

              if iPos > 0 then
              begin
                iPos := iPos + Length('FROM_ADDRESS_ART=');
                sDireccion := Copy(sCuerpo, iPos, PosEx(';', sCuerpo, iPos) - iPos);
              end;

              {Agrego el encabezado del mail que voy a mandar...}
              Font := TFont.Create;
              Font.Name := 'Tahoma';
              Font.Size := 10;

              if (sDireccion > '') and ExisteSQLEx('SELECT 1 FROM USE_USUARIOS WHERE SE_MAIL = :V1', [StringReplace(sDireccion, ' ', '%', [rfReplaceAll])]) then
              begin
                if bRTFBody then
                begin
                  sDato := ' ' + Msg[i].Sender + ' respondió: ' + CRLF + ' ';
                  Insert(StringToRTF(sDato, Font, taLeftJustify), sCuerpo, Pos('{{', sCuerpo) + 2);
                end else
                  sCuerpo := Msg[i].Sender + ' respondió: ' + CRLF + sCuerpo;

                //LogMessage(CRLF + 'Procesando mensaje ' + IntToStr(i) + ' de la bandeja de entrada proveniente de ' + Msg[i].Sender + ' con el siguiente asunto:' + CRLF + CRLF + Msg[i].Subject + CRLF + CRLF + Msg[i].Body, EVENTLOG_INFORMATION_TYPE, 2, 2022);

{               ** XE2 - Acoplamiento **
                EnviarMailBD(sDireccion, Msg[i].Sender + ' respondió: ' + Msg[i].Subject, [],
                             sCuerpo, nil, 0, tcDefault, False)
}
                EnviarMail(sDireccion, '', Msg[i].Sender + ' respondió: ' + Msg[i].Subject, sCuerpo, False);
              end else
              begin
                sDireccion := StringReplace(Msg[i].SenderAddress, '/O=GERENCIAR,PROY.,Y,ADM./OU=JEDI/CN=RECIPIENTS/CN=', '', [rfReplaceAll, rfIgnoreCase]);
                sDireccion := StringReplace(Msg[i].SenderAddress, '/O=GERENCIAR,PROY.,Y,ADM./OU=PROVART/CN=RECIPIENTS/CN=', '', [rfReplaceAll, rfIgnoreCase]);

                if  (Pos('RESPUESTA AUTOM', UpperCase(Msg[i].Subject)) = 0)
                and (Pos('NOREPLY', UpperCase(Msg[i].Subject)) = 0)
                and (Pos('NO ENTREGABLE:', UpperCase(Msg[i].Subject)) = 0)                
                and (Pos('MAILER', UpperCase(Msg[i].Subject)) = 0) then
                begin
                  if not BuzonFrecuente(sDireccion) then
                  begin
                    if bRTFBody then
                    begin
                      sDato := RESPUESTA_AUTOMATICA + CRLF;
                      Insert(StringToRTF(sDato, Font, taLeftJustify), sCuerpo, Pos('{{', sCuerpo) + 2);
                    end else
                    begin
                      sCuerpoAux := RESPUESTA_AUTOMATICA;
                      Insert(StringToRTF(CRLF + sCuerpo, Font, taLeftJustify), sCuerpoAux, LastDelimiter('}', sCuerpoAux) - 1);
                      sCuerpo := sCuerpoAux;
                    end;

                    { ** XE2 - Acoplamiento **
                    EnviarMailBD(sDireccion, '[Buzón automático] ' + Msg[i].Subject,
                                 [], sCuerpo, nil, 0, tcDefault, False);
                    }
                    EnviarMail(sDireccion, '', '[Buzón automático] ' + Msg[i].Subject, sCuerpo, False);
                  end;
                end;
              end;
            except
              on E: Exception do
              begin
                if Pos('COULD NOT GET PROPERTIES', UpperCase(E.Message)) = 0 then
                  try
                    DeleteMessage(Msg[i]);
                  except
                  end
                else begin
                  LogMessage(CRLF + 'Error al procesar la bandeja de entrada de Avisos Automáticos. ' + Msg[i].SenderAddress + CRLF + E.Message, EVENTLOG_ERROR_TYPE, 2, 203);
                  raise;
                end;
              end;
            end;
          finally
            //LogMessage(CRLF + 'Procesando mensaje ' + IntToStr(i) + ' de la bandeja de entrada proveniente de ' + Msg[i].Sender + ' con el siguiente asunto:' + CRLF + CRLF + Msg[i].Subject + CRLF + CRLF + 'BORRANDO MAIL', EVENTLOG_INFORMATION_TYPE, 2, 208);
            DeleteMessage(Msg[i]);
            Folder.RefreshContents;
          end;
        end;
      end;
    finally
      CommitTrans(True);
      DispararEnvio.Enabled := True;
      VerificarRecepcion.Interval := UN_SEGUNDO * 60 * 5; // 5 minutos
      VerificarRecepcion.Enabled := True;
      LogMessage('Fin el chequeo de la bandeja de entrada, ' + IntToStr(iCantidadInicial - i) + ' mensajes procesados.', EVENTLOG_INFORMATION_TYPE, 2, 204);
    end;
  except
    on E: Exception do
    begin
      if Pos('COULD NOT GET PROPERTIES', UpperCase(E.Message)) = 0 then
        LogMessage(CRLF + 'Error al procesar la bandeja de entrada de Avisos Automáticos. ' + CRLF + E.Message, EVENTLOG_ERROR_TYPE, 2, 205);
    end;
  end;
end;

function TMailSender.BuzonFrecuente(var AMailAddress: string): boolean;
begin
  AMailAddress := LowerCase(AMailAddress);

  if ExisteSQLEx('SELECT 1 FROM COMUNES.CBF_BUZONFRECUENTE WHERE BF_CORREO = :V1', [AMailAddress]) then
    EjecutarSQLSTEx('UPDATE COMUNES.CBF_BUZONFRECUENTE SET BF_CANTIDAD = BF_CANTIDAD + 1 WHERE BF_CORREO = :V1', [AMailAddress])
  else
    EjecutarSQLSTEx('INSERT INTO COMUNES.CBF_BUZONFRECUENTE VALUES (:V1, 1)', [AMailAddress]);

  Result := ValorSQLIntegerEx('SELECT BF_CANTIDAD FROM COMUNES.CBF_BUZONFRECUENTE WHERE BF_CORREO = :V1', [AMailAddress]) > 25;
end;

// retorna False si hubo un error o el path es vacio
function TMailSender.SetPathAdjuntos: boolean;
var
  sSql : String;
begin
  try
    Result := True;
    sSql   := 'SELECT TB_ESPECIAL1'+
               ' FROM CTB_TABLAS '+
               'WHERE TB_CLAVE = :clave '+
               '  AND TB_CODIGO = :codigo ';

    sPathAdjuntos := ValorSqlEx(sSql, ['PATHS', '001']);
    if sPathAdjuntos = '' then
      Result := False;
  except
    on E: Exception do begin
      LogMessage('Error al obtener Path para almacenar archivos adjuntos de los mails automáticos no configurado.', EVENTLOG_ERROR_TYPE, 0, 50);
      Result := False;
    end;
  end;
end;

procedure TMailSender.ChequeoHabitualTimer(Sender: TObject);
var
  tslKeepAlive: TStringList;
  sFile: String;
  bExito: Boolean;
begin
//  LogMessage('Chequeo habitual.', EVENTLOG_INFORMATION_TYPE, 0, 0);
  sFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'KeepAlive.txt';
  tslKeepAlive := TStringList.Create;
  try
    try
{
      if FileExists(sFile) then
        DeleteFile(sFile)
      else
        LogMessage('No se encontró el archivo de control KeepAlive.', EVENTLOG_WARNING_TYPE, 0, 0);
}
      if not dmPrincipal.sdbPrincipal.Connected then
        dmPrincipal.VerificaConexion(Self);

      bExito := False;  
      tslKeepAlive.Add(DateTimeToStr(dTiempo));
      repeat
        try
          tslKeepAlive.SaveToFile(sFile);
          bExito := True;
        except
          ;
        end;
      until bExito;

      if (not DispararEnvio.Enabled) and (not VerificarRecepcion.Enabled) and (not bEjecutando) then
        DispararEnvio.Enabled := True;
    except
      on E:Exception do
      begin
        LogMessage('Error en el chequeo habitual' + CRLF + E.Message, EVENTLOG_ERROR_TYPE, 4, 400);
      end;
    end;
  finally
    tslKeepAlive.Free;
  end;
end;

procedure TMailSender.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'Servicio que provee envío automático de correos electrónicos a través de la base de datos ORACLE.');
      Reg.CloseKey;
    end;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\Eventlog\Application\' + Name, false) then
    begin
      Reg.WriteString('EventMessageFile', 'C:\Servicios\SrvMailSender\MailSenderMessages.dll');
      Reg.WriteInteger('TypesSupported', 7);
      Reg.WriteInteger('CategoryCount', 4);
      Reg.WriteString('CategoryMessageFile', 'C:\Servicios\SrvMailSender\MailSenderMessages.dll');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TMailSender.AppEventsException(Sender: TObject; E: Exception);
begin
  if Pos('COULD NOT GET PROPERTIES', UpperCase(E.Message)) = 0 then
    LogMessage(CRLF + 'Error general de la aplicación. ' + CRLF + E.Message, EVENTLOG_ERROR_TYPE, 0, 50);
end;

end.

