{$DEFINE SMTP}

unit IArtMail;

interface

uses
  {$IFNDEF SERVICE}
  unMoldeEnvioMail,
  {$ELSE}
  unMail,
  {$ENDIF}
  Classes, SMapi, sx_MAPI;

type
  TOpcionARTMail = (oAlwaysShowDialog, oShowDialogIfEmpty, oDeleteAttach, oForceDB, oCheckRecipient, oMessages);
  TOpcionesARTMail = set of TOpcionARTMail;

  {$IFNDEF SERVICE}
  TTransportAgent = (taSMTP, taMAPI, taExtendedMAPI);
  {$ENDIF}

  TArtMail = class(TObject)
  private
    FSubject: string;
    FFromAddress: string;
    FDisplayName: string;
    FCheckRcpt: boolean;
    FStrings: array[0..4] of TStrings;
    FTransportAgent : TTransportAgent;
    FProfile : string;
    FRtfBody : boolean;
    FIdMail  : integer;
    FShowDialog : Boolean;
    procedure SetStrings(const Index: Integer; const Value: TStrings);
    procedure SetResultadoEnvio(aEMailsDestino: String; const aEnvioOk: Boolean; const aMensajeId: Integer);
  protected
    procedure Validate;
    (*
    function SendByMapi: boolean; overload;
    function SendByMapi(AProfile : String): boolean; overload;
    *)
    function SendByExtendedMapi: boolean;
    function SendBySmtp: boolean;
    function GetDefaultFrom: string;
  public
    function Send: boolean;
    constructor Create; overload;
    constructor Create(TransportAgent : TTransportAgent); overload;
    destructor Destroy; override;

    property Profile           :string           read FProfile     write FProfile;
    property FromAddress       :string           read FFromAddress write FFromAddress;
    property DisplayName       :string           read FDisplayName write FDisplayName;
    property ToAddress         :TStrings index 0 read FStrings[0]  write SetStrings;
    property ToCarbonCopy      :TStrings index 1 read FStrings[1]  write SetStrings;
    property ToBlindCarbonCopy :TStrings index 2 read FStrings[2]  write SetStrings;
    property Body              :TStrings index 3 read FStrings[3]  write SetStrings;
    property Attachments       :TStrings index 4 read FStrings[4]  write SetStrings;
    property ShowDialog        :Boolean          read FShowDialog  write FShowDialog;
    property Subject           :string           read FSubject     write FSubject;
    property CheckRecipient    :boolean          read FCheckRcpt   write FCheckRcpt;
    property TransportAgent    :TTransportAgent read FTransportAgent write FTransportAgent;
    property RtfBody           :boolean         read FRtfBody     write FRtfBody;
    property IdMail            :integer         read FIdMail      write FIdMail;
  end;

  function EnviarMail(sDirecciones: string;
                      sSubject: string = '';
                      sRutaArchivo: string = '';
                      sBody: string = 'Provincia ART';
                      Mensajes: boolean = True;
                      BorrarAttach: boolean = True; bRTFBody :boolean = False): boolean; overload;

  function EnviarMail(sDirecciones: Tstrings;
                    sDireccionOrigen : string;
                    sSubject : string;
                    sRutaArchivos: TStrings;
                    sBody: string = 'Provincia ART';
                    TransportAgent : TTransportAgent = taMAPI;
                    sProfile : string = '';
                    Mensajes: boolean = False;
                    BorrarAttach: boolean = False; bRTFBody :boolean = False;
                    aIdMail: integer = 0; sDisplayName : String = ''): boolean; overload;

  function EnviarMail(sDireccion: string;
                    sDireccionOrigen : string;
                    sSubject : string;
                    sRutaArchivos: TStrings;
                    sBody: string = 'Provincia ART';
                    TransportAgent : TTransportAgent = taMAPI;
                    sProfile : string = '';
                    Mensajes: boolean = False;
                    BorrarAttach: boolean = False; bRtfBody :boolean = False): boolean; overload;

  function EnviarMail(sAddresses, sSubject, sFromAddress: String; Opciones: TOpcionesARTMail; sBody: String; vRutaArchivo: Array of TVarRec; nContrato: Integer = 0;
                      const aConTrans: Boolean = True; const aTipoRegistroAsociado: String = ''; const aIdRegistroAsociado: Integer = -1; const aDireccionRespuesta: String = ''): Boolean; overload;

  {$IFNDEF SERVICE}
  function EnviarMailWithResults(sAddresses, sSubject, sFromAddress: String; Opciones: TOpcionesARTMail; sBody: String; vRutaArchivo: Array of TVarRec; nContrato: Integer = 0): TResultadoEnvio;
  {$ENDIF}
implementation

uses
  Internet, Email, Windows, SysUtils, Consts, General, CustomDlgs, IniFiles, Forms,
  {$IFDEF SMTP}
  IdAttachment, IdEMailAddress, IdAttachmentFile, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection,  IdTCPClient, IdMessageClient, IdSMTP, IdText, IdGlobalProtocols,
  {$ENDIF}
  {$IFNDEF SERVICE}
  unEnvioMail, unSeleccionDestinatarios,
  {$ENDIF}
  RTLConsts, CtrlToRTF, Graphics, SvcMgr, Math,
  unArt, ComCtrls, JvComponent, JvRichEditToHtml, ArchFuncs;
var
  ResultadoEnvio: TResultadoEnvio;

{----------------------------------------------------------------------------------------------------------------------}
{ TArtMail }
{----------------------------------------------------------------------------------------------------------------------}
procedure AssignWithServer(var FromStrings: TStrings; ToStrings: TStrings);
var
  i: Integer;
  AUser,
  AServer: string;
begin
  ToStrings.Clear;
  for i := 0 to FromStrings.Count -1 do
    DecodeEMail( FromStrings[i], AUser, AServer);
end;
{----------------------------------------------------------------------------------------------------------------------}
function SwitchARTMailToEnvioMail(Opciones: TOpcionesARTMail): TOpcionesEnvioMail;
begin
  if oAlwaysShowDialog in Opciones then
    Result := Result + [TOpcionEnvioMail(oAlwaysShowDialog)];
  if oShowDialogIfEmpty in Opciones then
    Result := Result + [TOpcionEnvioMail(oShowDialogIfEmpty)];
  if oDeleteAttach in Opciones then
    Result := Result + [TOpcionEnvioMail(oDeleteAttach)];
end;

constructor TArtMail.Create;
var
  i : Integer;
begin
  inherited;
  for i := Low(FStrings) to High(FStrings) do
    FStrings[i] := TStringList.Create;
  FFromAddress := GetDefaultFrom;
  FCheckRcpt := False;
  FTransportAgent := taMAPI;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TArtMail.Create(TransportAgent : TTransportAgent);
var
  i : Integer;
begin
  inherited Create;
  for i := Low(FStrings) to High(FStrings) do
    FStrings[i] := TStringList.Create;
  FFromAddress := GetDefaultFrom;
  FCheckRcpt := False;
  FTransportAgent := TransportAgent;
end;
{----------------------------------------------------------------------------------------------------------------------}
destructor TArtMail.Destroy;
var
  i : Integer;
begin
  try
    for i := Low(FStrings) to High(FStrings) do
      if Assigned(FStrings[i]) then
        FreeAndNil(FStrings[i]);
  except
  end;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TArtMail.Send: boolean;
begin
  Validate;

  if FTransportAgent = taSMTP then
    Result := SendBySmtp
  else
    Result := SendByExtendedMapi
end;
{----------------------------------------------------------------------------------------------------------------------}
function TArtMail.SendByExtendedMapi: boolean;
var
  Folder: TsxMAPI_Folder;
  Msg : TsxMAPI_Message;
  sxSession : TsxMAPI_Session;
  Attachment : TsxMAPI_Attachment;
  i,j : integer;
  s : TFileStream;
  Font, FontBlanco: TFont;
  sBody, sComentario, sDato, sError, sFileName: string;
  {$IFDEF SERVICE}
  IniFile: TIniFile;
  {$ENDIF}
begin
  result := true;
  sError := '';

  sxSession := TsxMAPI_Session.Create(nil);
  with sxSession do
  begin
    Name := 'sxSession';
    ProfileName := Profile;
    DoMAPIInit := True;
    InService := True;
    {$IFDEF SERVICE}
    IniFile := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Forms.Application.ExeName)) + 'SIART.INI');

    try
      if IniFile.ReadInteger('MailSender', 'GuadarEnviados', 1) = 1 then
        MessageSendFlag := sxsfToSent
      else
        MessageSendFlag := sxsfDelete;
    finally
      IniFile.Free;
    end;
    {$ELSE}
    MessageSendFlag := sxsfDelete;//sxsfToSent; //testing
    {$ENDIF}
    try
      Logon;
    except
    end;
  end;

  Folder  := sxSession.Folder[sxftOutbox];

  Font := TFont.Create;
  Font.Name := 'Tahoma';
  Font.Size := 10;

  FontBlanco := TFont.Create;
  FontBlanco.Name := 'Tahoma';
  FontBlanco.Size := 0;
  FontBlanco.Color := clWhite; // ufa, no anda...  //fucking_mail

  try
    for i := 0 to ToAddress.Count - 1 do
    begin
        Msg := Folder.CreateMessage;
        Msg.Sender := FFromAddress;
        Msg.Subject := FSubject;

        for j := 0 to Attachments.Count - 1 do
        begin
          s := TFileStream.Create(Attachments.Strings[j],fmOpenRead);
          try
            Attachment := Msg.AddAttachment;
            sFileName := ExtractFileName(Attachments.Strings[j]);
            Attachment.LongFileName := sFileName;
            Attachment.FileName :=  sFileName;
            Attachment.LongPath := sFileName;
            Attachment.Name     := sFileName;
            Attachment.Write(s);
            Attachment.Save;
          finally
            s.free;
          end;
        end;

        {$IFDEF SERVICE}
        if IdMail > 0 then
        begin
          sDato := ' ID_MENSAJE_ART=' + IntToStr(IdMail) + ';FROM_ADDRESS_ART=' + StringReplace(FromAddress, ';', '', []) + ';';
          sComentario := RTFComment(sDato);
        end else
        begin
          sDato := '';
          sComentario := '';
        end;
        {$ELSE}
        sDato := '';
        sComentario := '';
        {$ENDIF}

        if RtfBody then
        begin
          sBody := Trim(Body.Text);
          Insert(StringToRTF(sDato, FontBlanco, taLeftJustify), sBody, LastDelimiter('}', sBody) - 1);
          Msg.RTFBody := sBody;
        end else
        begin
          sBody := RTFHeader + {sComentario + no funciona el comentario...shit!}
                   StringToRTF(Trim(Body.Text), Font, taLeftJustify) +
                   RTFFooter;
          Insert(StringToRTF(sDato, FontBlanco, taLeftJustify), sBody, LastDelimiter('}', sBody) - 1);
          Msg.RTFBody := sBody;
        end;

        try
          Msg.Recepient := StringReplace(ToAddress.Strings[i], '%', ' ', [rfReplaceAll]);
          Msg.Send;
        except
          on E: Exception do
          begin
            sError := sError + (CRLF +
                                'Detalle Error: ' + E.Message + CRLF +
                                'Detalle:' + CRLF +
                                '  Origen:  ' + FFromAddress + CRLF +
                                '  Destino: ' + StringReplace(ToAddress.Strings[i], '%', ' ', [rfReplaceAll]) + CRLF +
                                '  Motivo:  ' + FSubject + CRLF +
                                '  Mensaje: ' + Body.Text);
          end;
        end;
        FreeAndNil(Msg);
    end;
  finally
//    FreeAndNil(Msg);
//    FreeAndNil(Folder);
    FreeAndNil(sxSession);
    Font.Free;
    FontBlanco.Free;

    if sError > '' then
      raise Exception.Create(sError);
//    sxSession.Logoff(true);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TArtMail.SendBySmtp: boolean;
{$IFDEF SMTP}
var
  OSmtp: TIdSMTP;
  aMessage : TIdmessage;
  sComentario, sDirectorio, sNombreArchivo: String;
  tslBody: TStrings;
  i: Integer;
  FormAux: TForm;
  RichEditAux: TRichEdit;
begin
  try
    OSmtp := TIdSMTP.Create(nil);
    tslBody := TStringList.Create;
    aMessage := TIdMessage.Create(OSmtp);
    try
      OSmtp.Host := SMTP_HOST;
      OSmtp.Port := 25;
      OSmtp.Username := 'AvisoAutomatico';
      OSmtp.Password := 'pepito';
      OSmtp.AuthType := {$IFDEF VER150}atDefault{$ELSE}satDefault{$ENDIF};
      OSmtp.PipeLine := True;

      with aMessage do
      begin
        ContentType := 'multipart/mixed';

        if DisplayName = '' then
          From.Name := 'Aviso Automático - IntraWEB'
        else
          From.Name := DisplayName;

        if IsEMail(FromAddress) then
          From.Address := FromAddress
        else begin
          if IsEMails(FromAddress) then
            From.Address := GetFirstMail(FromAddress)
          else
            From.Address := 'avisos@provart.com.ar';
        end;

        Subject := Self.Subject;

  //    Recipients.EMailAddresses := ToAddress.DelimitedText;
  //    if ToAddress.Count > 0 then Recipients.FillTStrings(ToAddress);
  //    if ToBlindCarbonCopy.Count > 0 then BccList.FillTStrings(ToBlindCarbonCopy);
  //    if ToCarbonCopy.Count > 0 then CCList.FillTStrings(ToCarbonCopy);

        tslBody := Self.Body;

        if  Pos('{\rtf1\', tslBody.Text) > 0 then
        begin
          FormAux := TForm.Create(nil);

          with FormAux do
          try
            Visible := False;
            RichEditAux := TRichEdit.Create(FormAux);
            Width := 1920;
            Height := 1080;
            with RichEditAux do
            try
              Width := 1920;
              Height := 1080;
              Parent := FormAux;
              Font.Name := 'Tahoma';
              sDirectorio := IncludeTrailingPathDelimiter(TempPath) + 'MailSender\' + FormatDateTime('YYYY\MM\DD', Now);
              ForceDirectories(sDirectorio);
              sNombreArchivo := sDirectorio + '\Temp_RTF_File_' + FormatDateTime('YYYYMMDD_HHNNSS', Now) + '.rtf';
              tslBody.SaveToFile(sNombreArchivo);
              Lines.LoadFromFile(sNombreArchivo);

              with TJvRichEditToHtml.Create(FormAux) do
              try
                ConvertToHtmlStrings(RichEditAux, tslBody);
              finally
                Free;
                try
                  DeleteFile(sNombreArchivo);
                except
                end;
              end;
            finally
              Free;
            end;
          finally
            Free;
          end;
        end;
        
        {$IFDEF SERVICE}
        if IdMail > 0 then
          sComentario := ' <!-- ' + ' ID_MENSAJE_ART=' + IntToStr(IdMail) + CRLF +
                                    ' FROM_ADDRESS_ART=' + StringReplace(FromAddress, ';', '', []) + CRLF +
//                                    ' COMENTARIO=NADAAAAA' + CRLF +
                         ' -->'
        else
          sComentario := '';
        {$ELSE}
        sComentario := '';
        {$ENDIF}

        tslBody.Add(sComentario);
        with TIdText.Create(aMessage.MessageParts) do
        begin
          ContentType := 'text/html';
          Body := tslBody;
        end;
      end;

      for i := 0 to Attachments.Count - 1 do
      begin
        if FileExists(Attachments.Strings[i]) then
          with TIdAttachmentFile.Create(aMessage.MessageParts, Attachments.Strings[i]) do
          begin
            ContentType := GetMimeTypeFromFile(Attachments.Strings[i]);
            //FileName := ExtractFileName(Attachments.Strings[i]);
          end;
      end;
        
      try
        OSmtp.Connect;
        for i := 0 to ToAddress.Count - 1 do
        begin
          aMessage.Recipients.EMailAddresses := StringReplace(ToAddress.Strings[i], '%', ' ', [rfReplaceAll]);

          if DisplayName = '' then
          begin
            if (Pos('provart.com.ar', LowerCase(aMessage.Recipients.EMailAddresses)) > 0) or
               (Pos('@', aMessage.Recipients.EMailAddresses) = 0) then
              aMessage.From.Name := 'ProvART - Aviso Automático'
            else
              aMessage.From.Name := 'Provincia ART';
          end;
          OSmtp.Send(aMessage);
        end;
        Result := True;
      finally
        if OSmtp.Connected then
        try
          OSmtp.Disconnect
        except
        end;
      end;
    finally
      if Assigned(tslBody) then
      begin
        tslBody := nil;
        tslBody.Free;
      end;
      if Assigned(OSmtp) then
        OSmtp.Free;
    end;
  except
    Result := False;
  end;
{$ELSE}
begin
  raise Exception.Create('No tiene permiso para enviar correo electrónico desde esta plataforma.');
{$ENDIF}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TArtMail.SetStrings(const Index: Integer; const Value: TStrings);
begin
  FStrings[Index].Assign(Value);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TArtMail.Validate;
var
  i: Integer;
begin
  if (ToAddress.Text = '') and (ToCarbonCopy.Text = '') and (ToBlindCarbonCopy.Text = '')
      and (Win32Platform = VER_PLATFORM_WIN32_NT) Then //Agregué esta condicion porque ahora si no tiene campo desde le voy a poder mostrar le form.
    raise Exception.Create('No se ha encotrado un destino para enviar el correo electrónico.');

  for i := 0 to Attachments.Count -1 do
    if not FileExists(Attachments[i]) Then
      raise Exception.CreateFmt(SInvalidFileName, [Attachments[i]]);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TArtMail.GetDefaultFrom: string;
begin
  Result := UsuarioDeWindows;
end;
{----------------------------------------------------------------------------------------------------------------------}
{Funciones sueltas}
{----------------------------------------------------------------------------------------------------------------------}
function EnviarMail(sDirecciones: string;
                    sSubject: string = '';
                    sRutaArchivo: string = '';
                    sBody: string = 'Provincia ART';
                    Mensajes: boolean = True;
                    BorrarAttach: boolean = True; bRTFBody :boolean = False): boolean;
begin
  Result := False;
  with TArtMail.Create do
  try
    ToAddress.Text := sDirecciones;

    if sRutaArchivo > '' then
      Attachments.Add(sRutaArchivo);

    if not bRTFBody then
      TransportAgent := taSMTP;

    Body.Text := sBody;
    Subject := sSubject;
    try
      if Send then
      begin
        if Mensajes and (sDirecciones > '') then
          MsgBox('El e-mail ha sido enviado con éxito a los siguientes destinatarios:' + CRLF + sDirecciones);
        Result := True;
      end;
    except
      on E: Exception do
      begin
        if Mensajes then
          ErrorMsg(E, 'Error al enviar e-mail.');
        Result := False;
      end;
    end;
  finally
    Free;
    if BorrarAttach and (sRutaArchivo > '') then
      DeleteFile( sRutaArchivo );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function EnviarMail(sDirecciones: TStrings;
                    sDireccionOrigen : string;
                    sSubject : string;
                    sRutaArchivos: TStrings;
                    sBody: string = 'Provincia ART';
                    TransportAgent : TTransportAgent = taMAPI;
                    sProfile : string = '';
                    Mensajes: boolean = False;
                    BorrarAttach: boolean = False; bRtfBody :boolean = False;
                    aIdMail: integer = 0; sDisplayName : String = ''): boolean;
var
 i : integer;
 objMail: TArtMail;
begin
  Result := False;
  objMail := TArtMail.Create(TransportAgent);

  with objMail do
  try
    Profile := sProfile;

    for i := 0 to sDirecciones.Count - 1 do
    begin
      if Length(Trim(sDirecciones.Strings[i])) > 0 then
        {Si no tiene arroba la dirección, la agrego para enviar}
        if Pos('@', Trim(sDirecciones.Strings[i])) = 0 then
          ToAddress.Add(Trim(sDirecciones.Strings[i]))
        else
          {Si tiene arroba la dirección, verifico que sea un mail válido}
          if IsEMail(Trim(sDirecciones.Strings[i])) then
            ToAddress.Add(Trim(sDirecciones.Strings[i]));
    end;

    if (ToAddress.Count = 0) then
    begin
      if not IsEMail(sDireccionOrigen) then
      begin
        raise Exception.Create('No se encontró ninguna dirección válida para enviar el correo.' + CRLF + 'Direcciones encontradas: ' + Trim(sDirecciones.CommaText))
      end else
      begin
        sSubject := '[Servicio de Mails] Direcciones erróneas: ' + NVL(Trim(sDirecciones.CommaText), '<SIN EMAIL>') + ' | ' + sSubject;
        ToAddress.Add(sDireccionOrigen);
      end;
    end;

    RtfBody := bRTFBody;
    IdMail := aIdMail;

    if sDireccionOrigen <> '' then
      FromAddress := sDireccionOrigen
    else if TransportAgent = taSMTP then
      FromAddress := 'avisos@provart.com.ar';

    if sDisplayName <> '' then DisplayName := sDisplayName;

    if Assigned(sRutaArchivos) and (sRutaArchivos.Count > 0) then
      Attachments := sRutaArchivos;

    Body.Text := sBody;
    Subject := sSubject;
    try
      if Send then
      begin
        if Mensajes and (sDirecciones.Count > 0) then
          MsgBox('El e-mail ha sido enviado con éxito a los siguientes destinatarios:' + CRLF + sDirecciones.CommaText);
        Result := True;
      end;
    except
      on E: Exception do
      begin
        Result := False;
        raise Exception.Create('Error al enviar e-mail. ' + E.Message);
      end;
    end;
  finally
    if Assigned(objMail) then
    try
      objMail.Free;
    except
    end;
    
    if BorrarAttach and (sRutaArchivos.Count > 0) then
      for i := 0 to sRutaArchivos.Count - 1 do DeleteFile( sRutaArchivos.Strings[i] );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function EnviarMail(sDireccion: string;
                    sDireccionOrigen : string;
                    sSubject : string;
                    sRutaArchivos: TStrings;
                    sBody: string = 'Provincia ART';
                    TransportAgent : TTransportAgent = taMAPI;
                    sProfile : string = '';
                    Mensajes: boolean = False;
                    BorrarAttach: boolean = False; bRtfBody :boolean = False): boolean;
var
 strList: TStringList;
begin
  Result := False;
  strList := TStringList.Create;
  with strList do
  try
    Duplicates := dupIgnore;
    CommaText := StringReplace(StringReplace(StringReplace(Trim(sDireccion), ';', ',', [rfReplaceAll]), ' ', ',', [rfReplaceAll]), ',,', ',', [rfReplaceAll]);
    Duplicates := dupIgnore;
    EnviarMail(strList, sDireccionOrigen, sSubject, sRutaArchivos, sBody, TransportAgent, sProfile, Mensajes, BorrarAttach, bRtfBody);
  finally
    Free;
  end;
end;

function EnviarMail(sAddresses, sSubject, sFromAddress: String; Opciones: TOpcionesARTMail; sBody: String; vRutaArchivo: Array of TVarRec; nContrato: Integer = 0;
                    const aConTrans: Boolean = True; const aTipoRegistroAsociado: String = ''; const aIdRegistroAsociado: Integer = -1; const aDireccionRespuesta: String = ''): Boolean;
var
  bPos: Byte;
begin
  Result := False;

  {$IFNDEF SERVICE}
  if (oForceDB in Opciones) then
  begin
    ResultadoEnvio := unEnvioMail.EnviarMailBDWithResults(sAddresses,
                                                          sSubject,
                                                          SwitchARTMailToEnvioMail(Opciones),
                                                          vRutaArchivo,
                                                          sBody,
                                                          nContrato,
                                                          tcDefault,
                                                          aConTrans,
                                                          False,
                                                          2500,
                                                          -1,
                                                          {$IFNDEF SERVICE}
                                                          [tdContactoContrato],
                                                          {$ENDIF}
                                                          aDireccionRespuesta,
                                                          aTipoRegistroAsociado,
                                                          aIdRegistroAsociado);
    Result := ResultadoEnvio.EnvioOk;
  end
  else
  {$ENDIF}
    with TArtMail.Create do
    try
      ToAddress.CommaText := StringReplace(sAddresses, ',,', ',', [rfReplaceAll]);

      for bPos := Low(vRutaArchivo) to High(vRutaArchivo) do
        if (vRutaArchivo[bPos].vPChar > '') and FileExists(vRutaArchivo[bPos].vPChar) then
          Attachments.Add(vRutaArchivo[bPos].vPChar);

      ShowDialog := (oAlwaysShowDialog in Opciones) or ((oShowDialogIfEmpty in Opciones) and (sAddresses = ''));
      CheckRecipient := oCheckRecipient in Opciones;
      Body.Text := sBody;
      Subject := sSubject;
      try
        if Send then
        begin
          if oMessages in Opciones then
            MsgBox('El e-mail ha sido enviado con éxito.');
          SetResultadoEnvio(ToAddress.CommaText, True, 0);
          Result := True;
        end;
      except
        on E: Exception do
        begin
          if oMessages in Opciones then
            ErrorMsg(E, 'Error al envíar e-mail.');
          Result := False;
        end;
      end;
    finally
      Free;
      for bPos := Low(vRutaArchivo) to High(vRutaArchivo) do
        if (oDeleteAttach in Opciones) and (vRutaArchivo[bPos].vPChar > '') and FileExists(vRutaArchivo[bPos].vPChar) then
          DeleteFile(vRutaArchivo[bPos].vPChar);
    end;
end;

procedure TArtMail.SetResultadoEnvio(aEMailsDestino: String; const aEnvioOk: Boolean; const aMensajeId: Integer);
begin
  ResultadoEnvio.EMailsDestino.Text := aEMailsDestino;
  ResultadoEnvio.EnvioOk := aEnvioOk;
  ResultadoEnvio.MensajeId := aMensajeId;
end;

{$IFNDEF SERVICE}
function EnviarMailWithResults(sAddresses, sSubject, sFromAddress: String; Opciones: TOpcionesARTMail; sBody: String; vRutaArchivo: Array of TVarRec; nContrato: Integer = 0): TResultadoEnvio;
begin
  EnviarMail(sAddresses, sSubject, sFromAddress, Opciones, sBody, vRutaArchivo, nContrato);
  Result := ResultadoEnvio;
  ResultadoEnvio.EMailsDestino.Free;
end;
{$ENDIF}
end.
