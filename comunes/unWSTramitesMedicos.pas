unit unWSTramitesMedicos;

interface

uses unImportCryptoSrt, XMLIntf, XMLDoc, unArt, SDEngine, AnsiSql, SqlFuncs, unSesion, StrUtils, unCustomDataModule,
     IdTCPClient, SysUtils, HTTPUtil;

type
  {
   **Alta del tramite medico.  XML Original SRT

  <tramite>
    <NumeroAccidente>string</NumeroAccidente>
    <CodigoMotivo>int</CodigoMotivo>
    <Contingencia>string</Contingencia>
    <CuitCuilDamnificado>string</CuitCuilDamnificado>
    <FechaNacimiento>string</FechaNacimiento>
    <TipoDocumentoDamnificado>int</TipoDocumentoDamnificado>
    <NroDocumentoDamnificado>string</NroDocumentoDamnificado>
    <DomicilioDelDamnificado>string</DomicilioDelDamnificado>
    <CodPostal>int</CodPostal>
    <CodigoLocalidad>int</CodigoLocalidad>
    <CodigoProvincia>int</CodigoProvincia>
    <Telefono>string</Telefono>
    <Celular>string</Celular>
    <EMail>string</EMail>
    <Relato>string</Relato>
    <ComisionMedica>string</ComisionMedica>
  </tramite>

  ********* Ver Pregunta al foro de la SRT "Datos Invalidos Tramite Medico".
  ********* Ticket 167-1C638D83-0201 en http://soporte.srt.gob.ar/Main/frmTickets.aspx
  }

  TTramiteMedico = record
    NumeroAccidente             : String;  //Número de siniestro declarado en los registros de AT/EP. Sin guiones ni separadores de por medio. Obligatorio
    CodigoMotivo                : integer; //Tipo de trámite médico por el que se presenta el caso SRT.SME_MOTIVOEXPEDIENTE. Obligatorio
    Contingencia                : String;  //Tipo de contingencia del caso (debe coincidir con el declarado en los registros de AT/EP).  "AT" o "EP"
    CuitCuilDamnificado         : String;  //Sin guiones ni signos de puntuación. Obligatorio SUSS
    FechaNacimiento             : TDate;   //Fecha de nacimiento del trabajador  (enviar AAAAMMDD en el XML). Obligatorio
    TipoDocumentoDamnificado    : Integer; //Tipo de Documento del Trabajador SRT.STD_TIPODOCUMENTO. Obligatorio si se consigna el Número de Documento
    NroDocumentoDamnificado     : String;  //Número del documento del trabajador. Solo cuando el trabajador no posea CUIL. //Obligatorio si no se consigna el campo CUIL
    DomicilioDelDamnificado     : String;  //Domicilio de notificación del trabajador. Completar con mayúsculas y espacios en blancos, sin puntos ni guiones. Obligatorio
    CodPostal                   : Integer; //Código postal de notificación del trabajador. Completar según tabla de códigos postales (Que tabla??). Obligatorio
    CodigoLocalidad             : Integer; //Localidad de notificación del trabajador. SRT.SLS_LOCALIDADSRT. Obligatorio
    CodigoProvincia             : Integer; //Provincia de notificación del trabajador. SRT.SPR_PROVINCIASRT. Obligatorio
    Telefono                    : String;  //Teléfono fijo de contacto del trabajador. 1143213500. Obligatorio
    Celular                     : String;  //Teléfono celular de contacto primario del trabajador.  111543213501. Obligatorio
    Email                       : String;  //Dirección de correo electrónico de contacto del trabajador.  alguien@dominio.com.ar. Obligatorio
    Relato                      : String;  //Información adicional del trámite presentado. Texto Libre Obligatorio
    ComisionMedica              : String;  //Comisión Médica en la que se presenta el trámite. SRT.SCM_COMISIONMEDICA. Obligatorio.
  end;

  {
   **Resultado del pedido del Tramite Medico. Formato enviado por SRT.

   <AltaTramiteMedicoResult>
      <CuitCuilDamnificado>string</CuitCuilDamnificado>
      <NombreyApellidoDamnificado>string</NombreyApellidoDamnificado>
      <Domicilio>string</Domicilio>
      <CodigoLocalidad>int</CodigoLocalidad>
      <CodigoProvincia>int</CodigoProvincia>
      <Citacion>dateTime</Citacion>
      <Expediente>string</Expediente>
      <ComisionMedica>string</ComisionMedica>
   </AltaTramiteMedicoResult>
  }

  TTurnoMedico = record
    CuitCuilDamnificado        : String;
    NombreyApellidoDamnificado : String;
    Domicilio                  : String;
    CodigoLocalidad            : integer;
    CodigoProvincia            : integer;
    Citacion                   : TDateTime;
    Expediente                 : String;
    ComisionMedica             : String;
    Error                      : String;
  end;

function AltaTramiteMedico(const aTramite : TTramiteMedico; TransactionMode: TTransactionMode = tmBeginEnd; aUsuarioEnvio : TUsuarioEnvio = ueProvincia): TTurnoMedico;
function CrearXmlTramiteMedico(aTramite: TTramiteMedico) : String;
function CrearTurnoMedicoDeXML(aXML : String): TTurnoMedico;
function ReplaceSpecialCharacters(const aString: String): String;

implementation

uses unComunes, StrFuncs {$IFNDEF VER150},idGlobal{$ENDIF}, XSBuiltIns, unDmPrincipal;

function AltaTramiteMedico(const aTramite : TTramiteMedico; TransactionMode: TTransactionMode = tmBeginEnd; aUsuarioEnvio : TUsuarioEnvio = ueProvincia): TTurnoMedico;
var
  aTcpClient : TIdTcpClient;
  XML, S : String;
  iSize : Integer;
begin
  try
    try
      ConectarServicio(aTcpClient, true, aUsuarioEnvio);
      InsertarLog(aTramite.CuitCuilDamnificado,'','ART','ALTATRAMITEMEDICO', -1, -1, 'U', '', -1, TransactionMode);  //LOG
      XML := CrearXmlTramiteMedico(aTramite);
      aTcpClient.Socket.WriteLn('AltaTramitesMedicos:' + aTramite.NumeroAccidente);
      aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
      S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
      aTCPClient.IOHandler.WriteLn(IntToStr(Length(XML)),TidTextEncoding.UTF8); //size del xml
      aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
      S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta
      if S <> '' then
        aTCPClient.IOHandler.Write(XML, TidTextEncoding.UTF8);
      aTCPClient.IOHandler.CheckForDataOnSource(150000);  //espero alguna respuesta
      S := '';
      S := aTCPClient.IOHandler.ReadLn(TidTextEncoding.UTF8); //leo la respuesta (size)
      if Pos('Error', S) > 0 then
      begin
        S := S + aTCPClient.IOHandler.ReadLn('', 200, -1, TidTextEncoding.UTF8);
        Result.Error := S;
      end
      else
      begin
        iSize := StrToInt(S); //asigno el tamaño del stream a iSize
        aTCPClient.IOHandler.CheckForDataOnSource(150000); //mientras espero otra respuesta (stream)
        S := aTCPClient.IOHandler.ReadString(iSize ,TidTextEncoding.UTF8); //Obtengo el resto del stream }
        S := StrReplace(S, 'Fin de Datos', '');
        Result := CrearTurnoMedicoDeXML(S);
      end;
    except
      On E: Exception do
      begin
        Result.Error := E.Message + ' ' + E.StackTrace;
      end;
    end;
  finally
    aTCPClient.Disconnect;
    aTCPClient.Free;
  end;
end;

function CrearXmlTramiteMedico(aTramite: TTramiteMedico) : String;
var
  LNodeElement, NodeTramite: IXMLNode;
  LDocument: IXMLDocument;
  XML : String;
  sFechaNacimiento : String;
begin
  //DecodeDate(aTramite.FechaNacimiento, aYear, aMonth, aDay);
  sFechaNacimiento := FormatDateTime('DD/MM/YYYY', aTramite.FechaNacimiento);
 // sFechaNacimiento := IntToStr(aYear) + IntToStr(aMonth) + IntToStr(aDay);
  LDocument := TXMLDocument.Create(nil); //creo la interface (se libera cuando queda fuera de scope)
  LDocument.Active := True;
  LDocument.Version:='1.0';
  LDocument.Encoding:='utf-8';
  LDocument.DocumentElement := LDocument.CreateNode('TramiteMedico', ntElement, '');
  LNodeElement := LDocument.DocumentElement;
  LNodeElement.DeclareNamespace('xsi', 'http://www.w3.org/2001/XMLSchema-instance');
  LNodeElement.DeclareNamespace('xsd', 'http://www.w3.org/2001/XMLSchema');
  AgregarNodo(LNodeElement, NodeTramite, 'NumeroAccidente', aTramite.NumeroAccidente, false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'CodigoMotivo', IntToStr(aTramite.CodigoMotivo), false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'Contingencia', aTramite.Contingencia, false, 'http://tempuri.org/', false);
  if aTramite.CuitCuilDamnificado <> '' then
    AgregarNodo(LNodeElement, NodeTramite, 'CuitCuilDamnificado', aTramite.CuitCuilDamnificado, false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'FechaNacimiento', sFechaNacimiento, false, 'http://tempuri.org/', false);
  if aTramite.NroDocumentoDamnificado <> '' then
  begin
    AgregarNodo(LNodeElement, NodeTramite, 'TipoDocumentoDamnificado', IntToStr(aTramite.TipoDocumentoDamnificado), true, 'http://tempuri.org/', false);
    AgregarNodo(LNodeElement, NodeTramite, 'NroDocumentoDamnificado', aTramite.NroDocumentoDamnificado, true, 'http://tempuri.org/', false);
  end;
  AgregarNodo(LNodeElement, NodeTramite, 'CodPostal', IntToStr(aTramite.CodPostal), false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'CodigoLocalidad', IntToStr(aTramite.CodigoLocalidad), false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'CodigoProvincia', IntToStr(aTramite.CodigoProvincia), false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'Telefono', aTramite.Telefono, false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'Celular', aTramite.Celular, false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'EMail', aTramite.Email, false, 'http://tempuri.org/', false);
  aTramite.Relato := ReplaceSpecialCharacters(aTramite.Relato);
  AgregarNodo(LNodeElement, NodeTramite, 'Relato', aTramite.Relato, false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'ComisionMedica', aTramite.ComisionMedica, false, 'http://tempuri.org/', false);
  AgregarNodo(LNodeElement, NodeTramite, 'DomicilioDelDamnificado', aTramite.DomicilioDelDamnificado, false, 'http://tempuri.org/', false);

  LDocument.XML.Text := xmlDoc.FormatXMLData(LDocument.XML.Text);
  LDocument.Active := true;
  LDocument.SaveToXML(XML);
  Result := XML;
end;

function CrearTurnoMedicoDeXML(aXML : String): TTurnoMedico;
var
  LNodeElement: IXMLNode;
  LDocument: IXMLDocument;
begin
  try
    LDocument := TXMLDocument.Create(nil); //creo la interface (se libera cuando queda fuera de scope)
    LDocument.LoadFromXML(aXML); //cargo el stream que me vino desde el servicio
    LNodeElement := LDocument.ChildNodes.FindNode('TurnoMedico'); //busco el primer Nodo
    Result.CuitCuilDamnificado         := LNodeElement.ChildNodes['CuitCuilDamnificado'].Text;
    Result.NombreyApellidoDamnificado  := LNodeElement.ChildNodes['NombreyApellidoDamnificado'].Text;
    Result.CodigoLocalidad             := StrToInt(LNodeElement.ChildNodes['CodigoLocalidad'].Text);
    Result.CodigoProvincia             := StrToInt(LNodeElement.ChildNodes['CodigoProvincia'].Text);
    Result.Domicilio                   := LNodeElement.ChildNodes['Domicilio'].Text;
    Result.Expediente                  := LNodeElement.ChildNodes['Expediente'].Text;
    Result.ComisionMedica              := LNodeElement.ChildNodes['ComisionMedica'].Text;

    Result.Citacion := 0;
    if LNodeElement.ChildNodes['Citacion'].Text <> '' then
    begin
      with TXSDateTime.Create() do
      try
        XSToNative(LNodeElement.ChildNodes['Citacion'].Text);
        Result.Citacion := AsUTCDateTime;  //Es UTC ya que no tiene informacion de Greenwich Mean Time (GMT)
      finally
        Free;
      end;
    end;
  except
    on E : Exception do
    begin
      Result.Error := 'El documento XML tiene errores. ' + E.Message + ' ' + E.StackTrace;
    end;
  end;
end;

function ReplaceSpecialCharacters(const aString: String): String;
var S : String;
begin
   S := aString;
   S := HTMLEscape(S);
   Result := S;
end;

end.
