unit unfraImportUART;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, xmldom, XMLIntf,
  msxmldom, XMLDoc, ComCtrls;

type
  TRec = record
    AbogadosActora: Integer;
    ActuacionArt: String;
    ArtRevaluacion: String;
    CararcterArt: Integer;
    Caratula: String;
    CodigoArt: String;
    Contingencia1: String;
    Contingencia2: String;
    Contingencia3: String;
    CuilTrabajador: String;
    CuitEmpresa: String;
    Diagnostico: String;
    DepartamentoJudicial: Integer;
    EnfermedadReclamada1: String;
    EnfermedadReclamada2: String;
    EnfermedadReclamada3: String;
    EnfermedadReclamada4: String;
    FechaAccidente: TDate;
    FechaNotificacion: TDate;
    FechaProceso: TDate;
    JuzgadoTribunal: String;
    Mediacion: String;
    MedicosActora: Integer;
    Monto1ra: Real;
    Monto2da: Real;
    MontoReclamado: Real;
    NumeroExpediente: String;
    NumeroExpedienteCMOHV: String;
    NumeroSiniestro: String;
    ObjetoArt1: Integer;
    ObjetoArt2: Integer;
    ObjetoArt3: Integer;
    ObjetoArt4: Integer;
    ObjetoArt5: Integer;
    PeritosOficial: Integer;
    PorcentajeIncapacidad1ra: Real;
    PorcentajeIncapacidad2da: Real;
    PorcentajeIncapacidadArt: Real;
    PorcentajeIncapacidadPerito: Real;
    PresentaronCertificadosMedicos: String;
    PresentaronEstudiosMedicos: String;
    Provincia: String;
    ReclamaIncapacidad: String;
    Sentencia1ra: Real;
    Sentencia2da: Real;
    SentenciaCorteProvincial: String;
    SentenciaCorteSuprema: String;
    TipoOperacion: String;
    VinculoLaboral: String;
    ZonaCuerpo: String;
  end;

type
  TfraImportUART = class(TFrame)
    edResultados: TRichEdit;
    xmlDocument: TXMLDocument;
  private
  protected
    FBusqueda: String;
    FPassword: String;
    FPorEmpleado: Boolean;
    FPorEmpresa: Boolean;
    FSoapRequest: String;
    FSoapResponse: String;
    FUser: String;

    function CrearXML(aUser, aPassword, aBusqueda: String; aTipoBusqueda: Integer): String;
    function GetRazonSocial(const aCuit: String): String;
    function ProcesarCaracterArt(const aLinea: String): String;
    function ProcesarCArt(const aLinea: String): String;
    function ProcesarContingencia(const aLinea: String): String;
    function ProcesarDptoJudicial(const aLinea: String): String;
    function ProcesarEnfermedad(const aLinea: String): String;
    function ProcesarFecha(const aLinea: String): String;
    function ProcesarObjeto(const aLinea: String): String;
    function ProcesarProvincia(const aLinea: String): String;
    function ProcesarSentencia(const aLinea: String): String;

    procedure EliminarDatosAnteriores(const aCuit: String);
    procedure GoSearchUART;
    procedure GuardarDatosEnDisco(const aNodoJuicio: IXMLNode);
    procedure ProcesarDatos;

  public
    procedure ProcesarRichEdit;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure BuscarPorEmpresa(const aCuit: String);
  published
    property Busqueda    : String read FBusqueda      write FBusqueda;
    property Password    : String read FPassword      write FPassword;
    property SoapRequest : String read FSoapRequest;
    property SoapResponse: String read FSoapResponse;
    property User        : String read FUser          write FUser;
  end;

implementation

uses
  unDmPrincipal, CustomDlgs, Strfuncs, AnsiSql, SqlFuncs, unSesion, General;

{$R *.dfm}

function TfraImportUART.CrearXML(aUser, aPassword, aBusqueda: String; aTipoBusqueda: Integer): String;
//aTipoBusqueda viene a ser, cual envelope xml usar
//esta asi y no con un boolean (ej. FPorEmpleado) por si en algun momento,
//se les ocurre agregar a los de la uart, algun otro webservice ademas de estos 2
//en ese caso habria que solo poner un "Case Of"
begin
  if aTipoBusqueda = 0 then
    Result:=
      '<?xml version="1.0" encoding="utf-8"?>' + #13#10 +
      '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://www.uart.org.ar/">' + #13#10 +
      '  <soap:Body>' + #13#10 +
      '    <tns:ObtenerJuiciosPorEmpresa>' + #13#10 +
      '      <tns:usuario>' + aUser +' </tns:usuario>' + #13#10 +
      '      <tns:constrase' + #195#177 + 'a>' + aPassword + '</tns:constrase' + #195#177 + 'a>' + #13#10 +   //ñ = #195#177 en xml
      '      <tns:cuit>' + aBusqueda + '</tns:cuit>' + #13#10 +                                               //no reemplazarla en clave
      '    </tns:ObtenerJuiciosPorEmpresa>' + #13#10 +
      '  </soap:Body>' + #13#10 +
      '</soap:Envelope>'
  else
    Result:=
      '<?xml version="1.0" encoding="utf-8"?>' + #13#10 +
      '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://www.uart.org.ar/">' + #13#10 +
      '  <soap:Body>' + #13#10 +
      '    <tns:ObtenerJuiciosPorEmpleado>' + #13#10 +
      '      <tns:usuario>' + aUser + '</tns:usuario>' + #13#10 +
      '      <tns:constrase' + #195#177 + 'a>' + aPassword + '</tns:constrase' + #195#177 + 'a>' + #13#10 +
      '      <tns:cuil>' + aBusqueda + '</tns:cuil>' + #13#10 +
      '    </tns:ObtenerJuiciosPorEmpleado>' + #13#10 +
      '  </soap:Body>' + #13#10 +
      '</soap:Envelope>';
end;

constructor TfraImportUART.Create(AOwner: TComponent);
begin
  inherited;

  FBusqueda := '';
  FPassword := 'ff123456';
  FPorEmpleado := False;
  FPorEmpresa := True;
  FUser := 'ffirenze@provart.com.ar';
end;

procedure TfraImportUART.GoSearchUART;
var
  idHttp1: TidHTTP;
  iTipo: Integer;
  XMLEnvelope: TStringStream;
begin
  idHTTP1 := TidHTTP.Create(nil);
  
  if FPorEmpleado then
  begin
    iTipo := 1;  //CustomHeader HTTP segun requiere la UART para ver a cual SOA debe ir
    IdHttp1.Request.CustomHeaders.Add('SOAPAction: "http://www.uart.org.ar/ObtenerJuiciosPorEmpleado"');
  end
  else
  begin
    iTipo := 0;
    IdHttp1.Request.CustomHeaders.Add('SOAPAction: "http://www.uart.org.ar/ObtenerJuiciosPorEmpresa"');
  end;
  //Delphi misteriosamente cambia la codificacion, cuando se usa un string, asi que mando en bin el envelope XML

  XMLEnvelope := TStringStream.Create(CrearXML(FUser, FPassword, FBusqueda, iTipo));

  FSoapRequest := XMLEnvelope.DataString;

                //Tipo de contenido a enviar (sin esto no anda)
  IdHTTP1.Request.ContentType := 'text/xml; charset=utf-8';

  FSoapResponse := idHttp1.Post('http://186.182.220.51/ws/wsjuicios.asmx', XMLEnvelope);

  Idhttp1.Free;
  XMLEnvelope.Free;
end;

procedure TfraImportUART.GuardarDatosEnDisco(const aNodoJuicio: IXMLNode);
begin
  with TSql.Create('comunes.cju_juiciosuart') do
  try
    SqlType := stInsert;
    PrimaryKey.Add('ju_id', -1, False);

    Fields.Add('ju_abogadosactora',              StrToIntDef(aNodoJuicio.ChildNodes.FindNode('AbogadoActora').Text, 0), True);
    Fields.Add('ju_actuacionart',                Copy(aNodoJuicio.ChildNodes.FindNode('ActuacionArt').Text, 1, 1));
    Fields.Add('ju_artrevaluacion',              Copy(aNodoJuicio.ChildNodes.FindNode('ArtReviso').Text, 1, 1));
    Fields.Add('ju_caracterart',                 StrToIntDef(aNodoJuicio.ChildNodes.FindNode('CararcterArt').Text, 0), True);
    Fields.Add('ju_caratula',                    Copy(aNodoJuicio.ChildNodes.FindNode('Caratula').Text, 1, 1024));
    Fields.Add('ju_codigoart',                   Copy(aNodoJuicio.ChildNodes.FindNode('cart').Text, 1, 5));
    Fields.Add('ju_contingencia1',               Copy(aNodoJuicio.ChildNodes.FindNode('Contingencia1').Text, 1, 10));
    Fields.Add('ju_contingencia2',               Copy(aNodoJuicio.ChildNodes.FindNode('Contingencia2').Text, 1, 10));
    Fields.Add('ju_contingencia3',               Copy(aNodoJuicio.ChildNodes.FindNode('Contingencia3').Text, 1, 10));
    Fields.Add('ju_cuiltrabajador',              aNodoJuicio.ChildNodes.FindNode('CuilTrabajador').Text);
    Fields.Add('ju_cuitempresa',                 aNodoJuicio.ChildNodes.FindNode('CuitEmpresa').Text);
    Fields.Add('ju_departamentojudicial',        StrToIntDef(aNodoJuicio.ChildNodes.FindNode('DptoJudicial').Text, 0), True);
    Fields.Add('ju_diagnostico',                 Copy(aNodoJuicio.ChildNodes.FindNode('Diagnostico').Text, 1, 5));
    Fields.Add('ju_enfermedadreclamada1',        Copy(aNodoJuicio.ChildNodes.FindNode('EnfermedadReclamada1').Text, 1, 2));
    Fields.Add('ju_enfermedadreclamada2',        Copy(aNodoJuicio.ChildNodes.FindNode('EnfermedadReclamada2').Text, 1, 2));
    Fields.Add('ju_enfermedadreclamada3',        Copy(aNodoJuicio.ChildNodes.FindNode('EnfermedadReclamada3').Text, 1, 2));
    Fields.Add('ju_enfermedadreclamada4',        Copy(aNodoJuicio.ChildNodes.FindNode('EnfermedadReclamada4').Text, 1, 2));
    Fields.Add('ju_fechaaccidente',              StrToDateDef(ProcesarFecha(aNodoJuicio.ChildNodes.FindNode('FAccidente').Text), 0));
    Fields.Add('ju_fechaalta',                   'SYSDATE', False);
    Fields.Add('ju_fechanotificacion',           StrToDateDef(ProcesarFecha(aNodoJuicio.ChildNodes.FindNode('FechaNotificacion').Text), 0));
    Fields.Add('ju_juzgadotribunal',             Copy(aNodoJuicio.ChildNodes.FindNode('JuzgTrib').Text, 1, 10));
    Fields.Add('ju_medicosactora',               StrToIntDef(aNodoJuicio.ChildNodes.FindNode('MedicoActora').Text, 0), True);
    Fields.Add('ju_monto1ra',                    StrToFloatDef(StringReplace(aNodoJuicio.ChildNodes.FindNode('Monto1ra').Text, '.', ',', []), 0), 2, True);
    Fields.Add('ju_monto2da',                    StrToFloatDef(StringReplace(aNodoJuicio.ChildNodes.FindNode('Monto2da').Text, '.', ',', []), 0), 2, True);
    Fields.Add('ju_montoreclamado',              StrToFloatDef(StringReplace(aNodoJuicio.ChildNodes.FindNode('MontoReclamado').Text, '.', ',', []), 0), 2, True);
    Fields.Add('ju_numeroexpediente',            aNodoJuicio.ChildNodes.FindNode('NroExpediente').Text);
    Fields.Add('ju_numeroexpedientecmohv',       aNodoJuicio.ChildNodes.FindNode('NroExpedienteCMOHV').Text);
    Fields.Add('ju_numerosiniestro',             Copy(aNodoJuicio.ChildNodes.FindNode('NroSiniestro').Text, 1, 24));
    Fields.Add('ju_objetoart1',                  StrToIntDef(aNodoJuicio.ChildNodes.FindNode('ObjetoArt1').Text, 0), True);
    Fields.Add('ju_objetoart2',                  StrToIntDef(aNodoJuicio.ChildNodes.FindNode('ObjetoArt2').Text, 0), True);
    Fields.Add('ju_objetoart3',                  StrToIntDef(aNodoJuicio.ChildNodes.FindNode('ObjetoArt3').Text, 0), True);
    Fields.Add('ju_objetoart4',                  StrToIntDef(aNodoJuicio.ChildNodes.FindNode('ObjetoArt4').Text, 0), True);
    Fields.Add('ju_objetoart5',                  StrToIntDef(aNodoJuicio.ChildNodes.FindNode('ObjetoArt5').Text, 0), True);
    Fields.Add('ju_peritosoficiales',            StrToIntDef(aNodoJuicio.ChildNodes.FindNode('PeritoOficial').Text, 0), True);
    Fields.Add('ju_porcincapacidad1rasentencia', StrToFloatDef(StringReplace(aNodoJuicio.ChildNodes.FindNode('PorcentajeIncapacidad1ra').Text, '.', ',', []), 0), 2, True);
    Fields.Add('ju_porcincapacidad2dasentencia', StrToFloatDef(StringReplace(aNodoJuicio.ChildNodes.FindNode('PorcentajeIncapacidad2da').Text, '.', ',', []), 0), 2, True);
    Fields.Add('ju_porcincapacidadart',          StrToFloatDef(StringReplace(aNodoJuicio.ChildNodes.FindNode('PorcentajeIncapacidadArt').Text, '.', ',', []), 0), 2, True);
    Fields.Add('ju_porcincapacidadperito',       StrToFloatDef(StringReplace(aNodoJuicio.ChildNodes.FindNode('PorcentajeIncapacidadPerito').Text, '.', ',', []), 0), 2, True);
    Fields.Add('ju_presentaroncm',               Copy(aNodoJuicio.ChildNodes.FindNode('PresentaronCM').Text, 1, 1));
    Fields.Add('ju_presentaronem',               Copy(aNodoJuicio.ChildNodes.FindNode('PresentaronEM').Text, 1, 1));
    Fields.Add('ju_provincia',                   Copy(aNodoJuicio.ChildNodes.FindNode('cProvincia').Text, 1, 2));
    Fields.Add('ju_reclamaincapacidad',          Copy(aNodoJuicio.ChildNodes.FindNode('Incapacidad').Text, 1, 1));
    Fields.Add('ju_seclomediacion',              Copy(aNodoJuicio.ChildNodes.FindNode('SecloMediacion').Text, 1, 1));
    Fields.Add('ju_sentencia1ra',                StrToFloatDef(StringReplace(aNodoJuicio.ChildNodes.FindNode('Sentencia1ra').Text, '.', ',', []), 0), 2, True);
    Fields.Add('ju_sentencia2da',                StrToFloatDef(StringReplace(aNodoJuicio.ChildNodes.FindNode('Sentencia2da').Text, '.', ',', []), 0), 2, True);
    Fields.Add('ju_sentenciacorteprovincial',    Copy(aNodoJuicio.ChildNodes.FindNode('SentenciaCorteProv').Text, 1, 1024));
    Fields.Add('ju_sentenciacortesuprema',       Copy(aNodoJuicio.ChildNodes.FindNode('SentenciaCorteSuprema').Text, 1, 1024));
    Fields.Add('ju_tipooperacion',               Copy(aNodoJuicio.ChildNodes.FindNode('TipoOperacion').Text, 1, 1));
    Fields.Add('ju_usualta',                     Sesion.UserID);
    Fields.Add('ju_vinculolaboral',              Copy(aNodoJuicio.ChildNodes.FindNode('VinculoLaboral').Text, 1, 1));
    Fields.Add('ju_zonacuerpo',                  Copy(aNodoJuicio.ChildNodes.FindNode('ZonaCuerpo').Text, 1, 3));

    if aNodoJuicio.ChildNodes.FindNode('Profesional') <> nil then
      Fields.Add('ju_fechaproceso', StrToDateDef(ProcesarFecha(aNodoJuicio.ChildNodes.FindNode('Profesional').ChildNodes.FindNode('fproceso').Text), 0));

    EjecutarSqlST(Sql);
  finally
    Free;
  end;
end;

procedure TfraImportUART.ProcesarDatos;
var
  aNodoJuicio: IXMLNode;
  aNodoTmp: IXMLNode;
begin
  BeginTrans;
  try
    EliminarDatosAnteriores(FBusqueda);

    xmlDocument.LoadFromXML(FSoapResponse);

    // Obtengo el nodo "DetalleJuiciosEmpresas" (el primero)..
    aNodoTmp := xmlDocument.DocumentElement.ChildNodes.First.ChildNodes.First.ChildNodes.First.ChildNodes.First;

    if aNodoTmp.ChildNodes.Count > 0 then   // Si tiene algún detalle de algún juicio..
    begin
      aNodoJuicio := aNodoTmp.ChildNodes.First;

      // Loopeo por los nodos "Juicio"..
      while aNodoJuicio <> nil do
      begin
        GuardarDatosEnDisco(aNodoJuicio);

        try
          aNodoJuicio := aNodoJuicio.NextSibling;
        except
          aNodoJuicio := nil;
        end;
      end;
    end;

    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;
      MsgBox(E.Message);
    end;
  end;
end;

procedure TfraImportUART.ProcesarRichEdit;
var
  iLoop: Integer;
  iProximaPos: Integer;
  sAux: String;
  sLinea: String;
  sTextoRestante: String;
begin
  edResultados.Lines.Clear;

  edResultados.SelAttributes.Size := 15;
  edResultados.SelAttributes.Style := [fsBold, fsUnderline];
  edResultados.Lines.Add('Resultados para:' + FBusqueda + ' - ' + GetRazonSocial(FBusqueda));

  sTextoRestante := FSoapResponse;
  iLoop := 1;
  while (Length(sTextoRestante) > 1) and (iLoop < 70000) do
  begin
    iProximaPos := Pos('>', sTextoRestante);
    sLinea := Copy(sTextoRestante, 1, iProximaPos);
    Delete(sTextoRestante, 1, iProximaPos);

    if Pos('<Juicio>', sLinea) <> 0 then
    begin
      edResultados.Lines.Add('');
      edResultados.SelAttributes.Size := 13;
      edResultados.SelAttributes.Style := [fsBold, fsUnderline];
      edResultados.Lines.Add('Juicio');
    end;

    if Pos('</cart>', sLinea) <> 0 then
    begin
      edResultados.SelAttributes.Size := 10;
      edResultados.Lines.Add(#13#10 + ProcesarCArt(sLinea));
    end;

    if Pos('</NroExpediente', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Expediente: '+ Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if (Pos(']]>', sLinea) <> 0) and (sLinea <> '<![CDATA[]]>') then
    begin
      edResultados.Lines.Add(#13#10 + 'Carátula: '+ Copy(sLinea, 10, Pos(']]>', sLinea) - 10));
    end;

    if Pos('</CararcterArt', sLinea) <> 0 then
    begin
      sAux := ProcesarCaracterArt(sLinea);
      if sAux <> '' then
        edResultados.Lines.Add(#13#10 + sAux);
    end;

    if Pos('</FechaNotificacion', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Fecha de Notificación: ' + ProcesarFecha(sLinea));
    end;

    if Pos('</DptoJudicial', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Depto. Judicial: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ProcesarDptoJudicial(sLinea));
    end;

    if Pos('</JuzgTrib', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Juzgado/Tribunal: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</CuitEmpresa', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'CUIT de Empresa: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</CuilTrabajador', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'CUIL de Trabajador: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</NroSiniestro', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Nro. de Siniestro: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</FAccidente', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Fecha de Accidente: ' + ProcesarFecha(sLinea));
    end;

    if Pos('</NroExpedienteCMOHV', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Nro. Expediente CMOHV: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</MontoReclamado', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Monto Reclamado: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</PresentaronEM', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Presentaron Estudios Médicos: ' + IIF(Copy(sLinea, 1, Pos('</', sLinea) - 1) = 'S', 'Si', 'No'));
    end;

    if Pos('</PresentaronCM', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Presentaron Certificados Médicos: ' + IIF(Copy(sLinea, 1, Pos('</', sLinea) - 1) = 'S', 'Si', 'No'));
    end;

    if Pos('</AbogadoActora', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Abogado Actora: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</MedicoActora', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Médico Actora: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</PeritoOficial', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Perito Oficial: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</Incapacidad', sLinea) <> 0 then
    begin
       edResultados.Lines.Add(#13#10 + 'Reclama Incapacidad: ' + IIF(Copy(sLinea, 1, Pos('</', sLinea) - 1) = 'S', 'Si', 'No'));
    end;

    if Pos('</PorcentajeIncapacidadPerito', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + '% Incapacidad Perito: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</PorcentajeIncapacidadArt', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + '% Incapacidad ART: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</ArtReviso', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'ART Revaluación del siniestro: ' + IIF(Copy(sLinea, 1, Pos('</', sLinea) - 1) = 'S', 'Si', 'No'));
    end;

    if Pos('</ActuacionArt', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Actuación ART: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</VinculoLaboral', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Vinculo Laboral: ' + IIF(Copy(sLinea, 1, Pos('</', sLinea) - 1) = 'S', 'Si', 'No'));
    end;

    if Pos('</SecloMediacion', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Mediacion: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</SentenciaCorteProv', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Sentencia Corte Provincial: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</SentenciaCorteSuprema', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Sentencia Corte Suprema: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</Sentencia1ra', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Sentencia 1ra: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ProcesarSentencia(sLinea));
    end;

    if Pos('</Monto1ra', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Monto 1ra: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</PorcentajeIncapacidad1ra', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + '% Incapacidad 1ra: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</Sentencia2da', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Sentencia 2da: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ProcesarSentencia(sLinea));
    end;

    if Pos('</Monto2da', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Monto 2da: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</PorcentajeIncapacidad2da', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + '% Incapacidad 2da: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</Contingencia1', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Contingencia 1: ' + ProcesarContingencia(sLinea));
    end;

    if Pos('</Contingencia2', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Contingencia 2: ' + ProcesarContingencia(sLinea));
    end;

    if Pos('</Contingencia3', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Contingencia 3: ' + ProcesarContingencia(sLinea));
    end;

    if Pos('</EnfermedadReclamada1', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Enfermedad Reclamada 1: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ' ' + ProcesarEnfermedad(sLinea));
    end;

    if Pos('</EnfermedadReclamada2', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Enfermedad Reclamada 2: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ' ' + ProcesarEnfermedad(sLinea));
    end;

    if Pos('</EnfermedadReclamada3', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Enfermedad Reclamada 3: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ' ' + ProcesarEnfermedad(sLinea));
    end;

    if Pos('</EnfermedadReclamada4', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Enfermedad Reclamada 4: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ' ' + ProcesarEnfermedad(sLinea));
    end;

    if Pos('</ObjetoArt1', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Objeto ART 1: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ' ' + ProcesarObjeto(sLinea));
    end;

    if Pos('</ObjetoArt2', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Objeto ART 2: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ' ' + ProcesarObjeto(sLinea));
    end;

    if Pos('</ObjetoArt3', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Objeto ART 3: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ' ' + ProcesarObjeto(sLinea));
    end;

    if Pos('</ObjetoArt4', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Objeto ART 4: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ' ' + ProcesarObjeto(sLinea));
    end;

    if Pos('</ObjetoArt5', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Objeto ART 5: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1) + ' ' + ProcesarObjeto(sLinea));
    end;

    if Pos('</TipoOperacion', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Tipo de Operación: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</cProvincia', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Provincia: ' + ProcesarProvincia(sLinea));
    end;

    if Pos('</ZonaCuerpo', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Zona del Cuerpo: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</Diagnostico', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'Diagnostico: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    if Pos('</fproceso', sLinea) <> 0 then
    begin
      edResultados.Lines.Add(#13#10 + 'F. Proceso: ' + Copy(sLinea, 1, Pos('</', sLinea) - 1));
    end;

    Inc(iLoop);
  end;
end;

procedure TfraImportUART.BuscarPorEmpresa(const aCuit: String);
begin
  Self.User     := FUser;
  Self.Password := FPassword;
  Self.Busqueda := aCuit;
//Usuario ffirenze@provart.com.ar, clave ff123456
//User('ssaire');
//Password('sebita01');
//Busqueda('30999068878');
//SetBusqEmpresa(True);

  if (Self.User <> '') and (Self.Password <> '') and (Self.Busqueda <> '') then
  try
    Screen.Cursor := crHourGlass;

    GoSearchUART;
    ProcesarDatos;
//    ProcesarRichEdit;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfraImportUART.ProcesarCArt(const aLinea: String): String;
var
  sCodigoArt: String;
  sSql: String;
begin
  sCodigoArt := Copy(aLinea, 1, Pos('</', aLinea) - 1);

  if sCodigoArt <> '' then
  begin
    sSql :=
      'SELECT ar_nombre' +
       ' FROM afi.aar_art' +
      ' WHERE ar_codigosrt = :codigosrt';
    Result := 'ART: ' + ValorSqlEx(sSql, [sCodigoArt]);
  end;
end;

function TfraImportUART.ProcesarCaracterArt(const aLinea: String): String;
var
  sCarSrt: String;
  sSql: String;
begin
  Result := '';

  sCarSrt := Copy(aLinea, 1, Pos('</', aLinea) -1);

  if (sCarSrt <> '') and (sCarSrt <> '0') then
  begin
    sSql :=
      'SELECT ci_descripcion' +
       ' FROM legales.lci_caracterintervencion' +
      ' WHERE ci_codigosrt = :codigosrt';
    Result := 'Carácter Art: ' + ValorSqlEx(sSql, [sCarSrt]);
  end;
end;

function TfraImportUART.ProcesarDptoJudicial(const aLinea: String): String;
var
  iDeptoJudicial: Integer;
  sDeptoJudicial: String;
  sSql: String;
begin
  Result := '';

  sDeptoJudicial := Copy(aLinea, 1, Pos('</', aLinea) - 1);
  iDeptoJudicial := StrToIntDef(sDeptoJudicial, -1);

  if (iDeptoJudicial <> -1) then
  begin
    sSql :=
      'SELECT ju_descripcion jurisdiccion, jz_descripcion juzgado, fu_descripcion fuero, sc_descripcion secretaria' +
       ' FROM legales.lsc_secretaria, legales.ljz_juzgado, legales.lfu_fuero, legales.lju_jurisdiccion' +
      ' WHERE LPAD(sc_codigosrt, 4, 0) = :depto' +
        ' AND sc_idjuzgado = jz_id' +
        ' AND jz_idfuero = fu_id' +
        ' AND jz_idjurisdiccion = ju_id';
    with GetQueryEx(sSql, [iDeptoJudicial]) do
    try
      while not Eof do
      begin
        Result := Result + #13#10 +
          'JURISDICCIÓN: ' + FieldByName('jurisdiccion').AsString +
          '.- JUZGADO: ' + FieldByName('juzgado').AsString +
          '.- FUERO: ' +  FieldByName('fuero').AsString +
          '.- SECRETARIA: ' + FieldByName('secretaria').AsString + ' ';
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

function TfraImportUART.ProcesarSentencia(const aLinea: String): String;
var
  iSentencia: Integer;
  sSentencia: String;
  sSql: String;
begin
  Result := '';

  sSentencia := Copy(aLinea, 1, Pos('</', aLinea) - 1);
  iSentencia := StrToIntDef(sSentencia, -1);

  if (iSentencia <> -1) then
  begin
    sSql :=
      'SELECT tr_descripcion' +
       ' FROM legales.ltr_tiporesultadosentencia' +
      ' WHERE tr_codigosrt = :codigosrt';
    with GetQueryEx(sSql, [iSentencia]) do
    try
      while not Eof do
      begin
        Result := Result + #13#10 + FieldByName('tr_descripcion').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

function TfraImportUART.ProcesarContingencia(const aLinea: String): String;
var
  sCont: String;
  sSql: String;
begin
  Result := '';

  sCont := Copy(aLinea, 1, Pos('</', aLinea) - 1);

  if (sCont <> '') and (sCont <> '0') then
  begin
    sSql :=
      'SELECT tb_descripcion' +
       ' FROM art.ctb_tablas' +
      ' WHERE tb_clave = ''STIPO''' +
        ' AND tb_codigo = DECODE(:cont, ''T'', 1, ''I'', 2, ''P'', 3)';
    Result := ValorSqlEx(sSql, [sCont]);
  end;
end;

function TfraImportUART.ProcesarEnfermedad(const aLinea: String): String;
var
  sEnf: String;
  sSql: String;
begin
  Result := '';

  sEnf := Copy(aLinea, 1, Pos('</', aLinea) - 1);

  if (sEnf <> '') and (sEnf <> '0') then
  begin
    sSql :=
      'SELECT dg_descripcion' +
       ' FROM art.cdg_diagnostico' +
      ' WHERE dg_codigosrt = :codigosrt' +
        ' AND ROWNUM < 2';
    Result := ValorSqlEx(sSql, [sEnf]);
  end;
end;

function TfraImportUART.ProcesarObjeto(const aLinea: String): String;
var
  iObjeto: Integer;
  sObjeto: String;
  sSql: String;
begin
  Result := '';

  sObjeto := Copy(aLinea, 1, Pos('</', aLinea) - 1);
  iObjeto := StrToIntDef(sObjeto, -1);

  if (iObjeto <> -1) then
  begin
    sSql :=
      'SELECT rc_descripcion' +
       ' FROM legales.lrc_reclamo' +
      ' WHERE rc_codigosrt = :codigosrt';
    with GetQueryEx(sSql, [iObjeto]) do
    try
      while not Eof do
      begin
        Result := Result + #13#10 + FieldByName('rc_descripcion').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

function TfraImportUART.ProcesarProvincia(const aLinea: String): String;
var
  sProv: String;
  sSql: String;
begin
  Result := '';

  sProv := Copy(aLinea, 1, Pos('</', aLinea) - 1);

  if (sProv <> '') and (sProv <> '0') then
  begin
    sSql :=
      'SELECT pv_descripcion' +
       ' FROM art.cpv_provincias' +
      ' WHERE pv_codigodgi = :codigodgi' +
        ' AND ROWNUM < 2';
    Result := ValorSqlEx(sSql, [sProv]);
  end;
end;

function TfraImportUART.GetRazonSocial(const aCuit: String): String;
var
  sSql: String;
begin
  Result := '';

  if (aCuit <> '') then
  begin
    sSql :=
      'SELECT em_nombre' +
       ' FROM afi.aem_empresa' +
      ' WHERE em_cuit = :cuit';
    Result := ValorSqlEx(sSql, [aCuit]);
  end;
end;

function TfraImportUART.ProcesarFecha(const aLinea: String): String;
//2005-10-07 00:00:00
begin
  Result := Copy(aLinea, 9, 2) + '/' + Copy(aLinea, 6, 2) + '/' + Copy(aLinea, 1, 4);
end;

destructor TfraImportUART.Destroy;
begin
  inherited;
end;

procedure TfraImportUART.EliminarDatosAnteriores(const aCuit: String);
var
  sSql: String;
begin
  sSql :=
    'DELETE FROM comunes.cju_juiciosuart' +
         ' WHERE ju_cuitempresa = :cuitempresa';
  EjecutarSqlSTEx(sSql, [aCuit]);
end;

end.
