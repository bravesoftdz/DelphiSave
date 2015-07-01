unit unImportInformeComercial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, IdCookieManager,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ShellAPI, CustomDlgs, AdvMemo, OleCtrls, SHDocVw,
  ActiveX, ComCtrls, AdvProgr, ExtCtrls, FormPanel, DB, SDEngine, idCookie;

// 379697 Afiliacion06
// 379696 Afilia03
// 332409 Afiliacion05

type
  TRegLogin = Record
               aFecha: TDateTime;
               aSesionId: String;
             end;

  TfrmImportInformeComercial = class(TForm)
    IdHTTP2: TIdHTTP;
    IdHTTP1: TIdHTTP;
    IdCookieManager1: TIdCookieManager;
    btnConsultar: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    gboxResultados: TGroupBox;
    WebBrowser1: TWebBrowser;
    lbCuil: TLabel;
    btnCerrar: TButton;
    fpBuscando: TFormPanel;
    pgBuscando: TAdvProgress;
    Label2: TLabel;
    Timer1: TTimer;
    procedure btnConsultarClick(Sender: TObject);
    procedure IdHTTP1Redirect(Sender: TObject; var dest: String; var NumRedirect: Integer; var Handled: Boolean;
                              var VMethod: TIdHTTPMethod);
    procedure FormShow(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure fpBuscandoShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure fpBuscandoClose(Sender: TObject; var Action: TCloseAction);
  private
    function URLDecode(const S: String): String;
    function GetLastLogin(const aIdSesion: Integer) : TRegLogIn;
    function GetTicket(const aResponse: String): String;
    function GetServer(const aResponse: String): String;
    function GetIdAleatorio(const aResponse: String): String; //aResponse tiene que ser el menu principal de nosis el de consulta
  //  function ExtractText(const Str: string; const Delim1, Delim2: string): TStringList;

    procedure GuardarUltimoAcceso(const aUser: String);
    procedure Consultar;
    procedure Continuar;
    procedure ParcearResultados(const aResultado: String);
    procedure Salir;
    procedure WebBrowserLoadHTML(aWebBrowser: TWebBrowser; aHTML: String);

  public
    FLogin: Boolean;
    FIdCuenta: Integer;
    FPass: String;
    FUser: String;
    sCUIL: String;
    sInHtml: String;
    sResultHtml: String;
    sServer: String;
    sSesionId: String;
    sIdAleatorio: String;
    sTicket : String;
    Url: String;
  end;

var
  frmImportInformeComercial: TfrmImportInformeComercial;

implementation

uses
  unDmPrincipal, unArt, unSesion;

{$R *.dfm}

procedure TfrmImportInformeComercial.btnConsultarClick(Sender: TObject);
begin
  fpBuscando.Show;
  Timer1.Enabled := True;
  Label2.Caption := 'Buscando...';
  Application.ProcessMessages;
  Consultar;
  btnConsultar.Enabled := True;
  Application.ProcessMessages;
end;

procedure TfrmImportInformeComercial.Continuar;  //este proceso obtiene los resultados finales
var
  lParamList: TStringList;
  sIdAleatorio: String;
  sConsulta: String;
  sConsultaD1: String;
  sConsultaD2: String;
  sConsultaD3: String;
  sConsultaD4: String;
  sConsultaD5: String;
  sConsultaD6: String;
  sConsultaD7: String;
  sConsultaD8: String;
  sConsultaD9: String;
  sTitulares: String;
begin
  fpBuscando.Show;
  Timer1.Enabled := True;

  Label2.Caption := 'Procesando...';                      //Usar encoding
  idHttp2.HTTPOptions := [hoForceEncodeParams];

  //Buscar el titular del cuil
  lParamList := TStringList.Create;
  lParamList.Add('Doc=' + sCuil);
  lParamList.Add('NombreServicio=SAC.Consulta');
  sConsulta := idHttp1.Post('http://' + sServer + '.nosis.com.ar/TraerTitularesAJAX.asp', lParamList);
  //ver que pasa cuando aparecen 2 titulares.  Segun codigo dice que viene "||"
  {if sConsulta = 'MENSNo se encontraron resultados' then
  begin
    ShowMEssage('No se encontraron resultados');
    Salir;
    Exit;
  end; }
  Application.ProcessMessages;
  Delete(sConsulta, 1, 18);
  sTitulares := sConsulta;
  Memo1.Lines.Add('Titulares encontrados:' + sTitulares);

  //Armar la consulta con el doc y el cuil obtenidos en la anterior
  //Ej: txtNroDoc=30708841788&txtRazon=Power+Marine+SRL&txtMaxRecords=500
  lParamList.Clear;
  lParamList.Add('txtNroDoc=' + sCuil);
  lParamList.Add('txtRazon=' + StringReplace(sTitulares, ' ', '+', [rfReplaceAll]));
  lParamList.Add('txtMaxRecords=500'); //max records en el codigo fuente de la pagina esta asi.
  sConsulta := idHttp2.Post('http://' + sServer + '.nosis.com.ar/Result.asp', lParamList);
  Application.ProcessMessages;

  //Visitar Index para actualizar grilla de resultados (si no visitas no anda)
  //Aprobechar y copiar el IDAleatorio
  sConsulta := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Index.asp');
  Memo1.Lines.add('>>>>>>>>Index.asp: >>>>>>>>> '+ sConsulta);
  Memo1.Clear;
  sIdAleatorio := GetIdAleatorio(sConsulta);
  Application.ProcessMessages;

  sConsulta := '';
  //Visitar paginas de resultados.
 // sConsulta := idHttp2.Get('http://' + sServer + '.nosis.com.ar/body.asp?id=D1,D2,D3,D4,D5,D6,&IG=false&sImprime=SI&HayMasDatos=No&IdAleatorio=' + sIdAleatorio);
  sConsultaD1 := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Body.asp?id=D1&IdAleatorio=' + sIdAleatorio);
  if Pos('Intente nuevamente por favor', sConsultaD1) = 0 then
    sConsulta := sConsulta + sConsultaD1;
  Application.ProcessMessages;

  sConsultaD2 := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Body.asp?id=D2&IdAleatorio=' + sIdAleatorio);
  if Pos('Intente nuevamente por favor', sConsultaD2) = 0 then
    sConsulta := sConsulta + sConsultaD2;
  Application.ProcessMessages;

  sConsultaD3 := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Body.asp?id=D3&IdAleatorio=' + sIdAleatorio);
  if Pos('Intente nuevamente por favor', sConsultaD3) = 0 then
    sConsulta := sConsulta + sConsultaD3;
  Application.ProcessMessages;

  sConsultaD4 := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Body.asp?id=D4&IdAleatorio=' + sIdAleatorio);
  if Pos('Intente nuevamente por favor', sConsultaD4) = 0 then
    sConsulta := sConsulta + sConsultaD4;
  Application.ProcessMessages;

  sConsultaD5 := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Body.asp?id=D5&IdAleatorio=' + sIdAleatorio);
  if Pos('Intente nuevamente por favor', sConsultaD5) = 0 then
    sConsulta := sConsulta + sConsultaD5;
  Application.ProcessMessages;

  sConsultaD6 := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Body.asp?id=D6&IdAleatorio=' + sIdAleatorio);
  if Pos('Intente nuevamente por favor', sConsultaD6) = 0 then
    sConsulta := sConsulta + sConsultaD6;
  Application.ProcessMessages;

  sConsultaD7 := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Body.asp?id=D7&IdAleatorio=' + sIdAleatorio);
  if Pos('Intente nuevamente por favor', sConsultaD7) = 0 then
    sConsulta := sConsulta + sConsultaD7;
  Application.ProcessMessages;

  sConsultaD8 := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Body.asp?id=D8&IdAleatorio=' + sIdAleatorio);
  if Pos('Intente nuevamente por favor', sConsultaD8) = 0 then
    sConsulta := sConsulta + sConsultaD8;
  Application.ProcessMessages;

  sConsultaD9 := idHttp2.Get('http://' + sServer + '.nosis.com.ar/Body.asp?id=D9&IdAleatorio=' + sIdAleatorio);
  if Pos('Intente nuevamente por favor', sConsultaD9) = 0 then
    sConsulta := sConsulta + sConsultaD9;
  Application.ProcessMessages;



  //Cerrar la sesion, sino queda colgada como 10min
  Salir;
  ParcearResultados(sConsulta);
end;

function TfrmImportInformeComercial.URLDecode(const S: String): String;
var
  sTemp: String;
begin
 sTemp := S;
 sTemp := StringReplace(sTemp, '%2F', '/', [rfReplaceAll]);
 sTemp := StringReplace(sTemp, '%3A', ':', [rfReplaceAll]);
 sTemp := StringReplace(sTemp, '%3D', '=', [rfReplaceAll]);
 sTemp := StringReplace(sTemp, '%2E', '.', [rfReplaceAll]);
 sTemp := StringReplace(sTemp, '%3F', '?', [rfReplaceAll]);
 sTemp := StringReplace(sTemp, '%26', '&', [rfReplaceAll]);
 sTemp := StringReplace(sTemp, '%7C', '|', [rfReplaceAll]);
 sTemp := StringReplace(sTemp, '%A1', '¡', [rfReplaceAll]);
 Result := sTemp;
end;

procedure TfrmImportInformeComercial.IdHTTP1Redirect(Sender: TObject; var dest: String; var NumRedirect: Integer;
                                                     var Handled: Boolean; var VMethod: TIdHTTPMethod);
//var
 // sNumCliente: String;
 // sNumTicket: String;
begin
   Memo1.lines.add('>>>****Redireccion: '+ dest);
  //Parcea y obtiene el numero de ticket y user de la direccion Destino
{  sNumCliente := Copy(Dest, Pos('CodigoCliente', Dest) + 16, 6);
  sNumTicket  := Copy(Dest, Pos('Ticket', Dest) + 9, 18);

  //usan 2 servidores, el 10 y el 11, averiguar cual tenemos que usar.
  if (Copy(Dest, Pos('fSac', Dest) + 4, 2) = 'p:') then
    sServer := '10'
  else
    sServer := Copy(Dest, Pos('fSac', Dest) + 4, 2);

  if Pos('incorrecta',Dest) > 0 then
  begin
    FLogIn := False;
    ShowMessage('Contraseña incorrecta. Intente de nuevo.');
    Close;
    Abort;
  end;     }

  //URL: Aca me salto un paso de la validacion y armo directamente la url de la pagina de consulta
  //con su numero de ticket correspondiente. Total ya tengo la cookie guardada
  //Objetivo obtener sessionID.

  //Url := 'http://' + sServer + '.nosis.com.ar/query.asp?CodigoCliente=' + sNumCliente + '&Ticket=' + sNumTicket;
  //Dejar de manejar los redirects.
  //idHttp1.HandleRedirects := False;

  //visito la pagina de consulta.
  Handled := True;
end;

procedure TfrmImportInformeComercial.Salir;
var
  sNosisPrincipal: String;
begin
  //http://sac10.nosis.com.ar/logout.asp
  if FLogIn then
      sNosisPrincipal := idHttp2.Get('GET http://' + sServer + '.nosis.com.ar/logout.asp');
  btnConsultar.Enabled := True;
end;

procedure TfrmImportInformeComercial.FormShow(Sender: TObject);
begin
  if sInHtml<>'' then
  begin
    lbCuil.Caption := 'Visualizando '+ sCuil;
    WebBrowserLoadHTML(WebBrowser1, sInHtml);
  end
  else
  begin
    lbCuil.Caption := 'Buscando '+ sCuil;
    if sCuil <> '' then
      btnConsultar.Visible := True
    else
      lbCuil.Caption := 'Sin datos';
  end;
  EnableMenuItem(GetSystemMenu(handle, False), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
end;

procedure TfrmImportInformeComercial.btnSalirClick(Sender: TObject);
begin
  try
    Salir;
  finally
    FLogIn := True; // si quieren salir que no les abra otra ventana
  end;
end;

procedure TfrmImportInformeComercial.btnContinuarClick(Sender: TObject);
begin
  Continuar;
end;

procedure TfrmImportInformeComercial.ParcearResultados(const aResultado: String);
var
  sHTML: String;
begin
  //remplazar todas las cosas que rompen la pagina cuando esta offline
  //y dan error de scripts.
  fpBuscando.Caption := 'Armando...';
  sHTML := aResultado;
  sHTML := StringReplace(sHTML, '<!--<SCRIPT LANGUAGE=javascript FOR=document EVENT=onkeydown>if (event.keyCode==116) window.parent.frames("Header")' +
                                '.SaleBien=true;if (event.keyCode==115) window.parent.frames("Header").SaleBien=false</SCRIPT>-->', '', [rfReplaceAll]);


  sHTML := StringReplace(sHTML, '</SCRIPT>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '//-->', '', [rfReplaceAll]);

  sHTML := StringReplace(sHTML, '<script type="text/javascript" id="clientEventHandlersJS" language="javascript">', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" language="JavaScript" src="SAC_Js/Valida.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" language="JavaScript" src="SAC_Js/AbrirConsultaSAC.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" language="JavaScript" src="SAC_Js/FuncionesBody.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" language="JavaScript" src="SAC_Js/FuncionesBody_v2.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" language="JavaScript" src="SAC_Js/DeTerceros/jquery.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" language="JavaScript" src="SAC_Js/CO_Funciones.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" src="SAC_Js/comunes.helps.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<link href="SAC_Css/Prefijos_General.css" rel="Stylesheet" />', '', [rfReplaceAll]);

  sHTML := StringReplace(sHTML, '<script type="text/javascript" src="SAC_js/jQuery/jquery-1.7.min.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" src="SAC_Js/comunes.ventanas.js"></script>', '', [rfReplaceAll]);

  sHTML := StringReplace(sHTML, '<link href="SAC_Css/Prefijos_BL.css" rel="Stylesheet" />', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<link href="SAC_Css/Prefijos_CO.css" rel="Stylesheet" />', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<link href="SAC_Css/Prefijos_CI.css" rel="Stylesheet" />', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<link href="SAC_Css/Prefijos_HG.css" rel="Stylesheet" />', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<link href="SAC_Css/Prefijos_RD.css" rel="Stylesheet" />', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" src="SAC_Js/DeTerceros/jquery.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" src="SAC_Js/Valida.js"></script>', '', [rfReplaceAll]);

  sHTML := StringReplace(sHTML, '<script type="text/javascript" src="SAC_Js/AbrirConsultaSAC.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" src="SAC_Js/FuncionesBody.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" src="SAC_Js/CO_Funciones.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<script type="text/javascript" src="SAC_Js/Valida.js"></script>', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '<base target="Body" />', '', [rfReplaceAll]);

  sHTML := StringReplace(sHTML, 'var UCEI = true;', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'var UCOk = ''True'';', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'var wVentanaCI="";', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'var wVentanaDetalle="";', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'var wVentanaMapa="";', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '//Variables generales para ampliación juicio.', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'var bPuedeAmpliar = "";', '', [rfReplaceAll]);

  sHTML := StringReplace(sHTML, 'var STPref = ""', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'var AjusteVentanaPorSO = 0;', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '// Para print', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'function window_onbeforeprint()', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'if (txtTituloCliente.value.length == 0)', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'pTituloCliente.style.display="none";', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'catch(e) {}', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'var AjusteVentanaPorSO = "0";', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'var sCodCliente = "'+FUser+'"', '', [rfReplaceAll]);

  sHTML := StringReplace(sHTML, 'var sNombre = "Anotaciones de : '+FUser+'" + " - " +  "PROVINCIA ASEGURADORA DE RIESGOS DEL TRABAJO SA";', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'if(window.parent.length==3 && window.parent.SetearTiempoInactividad != null)', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'window.parent.SetearTiempoInactividad();', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'if (jQuery("#txtTituloCliente") != "undefined")', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'jQuery("#txtTituloCliente").focus();', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'jQuery("#txtTituloCliente").val(sNombre);', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '$(".link-PDF").on("click", function(e)', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'var parametros = $(this).attr("data-param");', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'AbrirVentanaBalancePDF(parametros);', '', [rfReplaceAll]);

  sHTML := StringReplace(sHTML, '$.ready = function()', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '$("#tblCargando").hide();', '', [rfReplaceAll]);

  sHTML := StringReplace(sHTML, '<script type="text/javascript">', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '//Variables Generales para uso de las funciones espécificas en el template de HM --', '', [rfReplaceAll]);


  sHTML := StringReplace(sHTML, 'Actualizar', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'Refrescar', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'Si desea consultar la información presione aquí, luego presione refrescar.', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, 'Armando la página ...', '', [rfReplaceAll]);
  sHTML := StringReplace(sHTML, '$.', '', [rfReplaceAll]);

 // sAux := ExtractText(sHtml,'var AjusteVentanaPorSO', '(parametros);');
  //sHTML := StringReplace(sHTML, sAux, '', [rfReplaceAll]);

  sResultHTML := sHTML;
  Memo1.Lines.Add('***Resultados 1 ***' + sHTML);
  WebBrowserLoadHTML(WebBrowser1, sResultHTML);
  fpBuscando.Hide;
  Timer1.Enabled := False;
end;

procedure TfrmImportInformeComercial.WebBrowserLoadHTML(aWebBrowser: TWebBrowser; aHTML: String);
var
  ListaString: TStringList;
  Ms: TMemoryStream;
begin
  aWebBrowser.Navigate('about:blank') ;  //cargar algo para generar el ReadyState. Sino da Access Violation
  while aWebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;  //Procesar mensajes hasta que termine de cargar aboutblank

  if Assigned(aWebBrowser.Document) then //cargar el doc html
  begin
    ListaString := TStringList.Create;
    try
      Ms := TMemoryStream.Create;
      try
        ListaString.Text := aHTML;
        ListaString.SaveToStream(Ms);
        Ms.Seek(0, 0);
        (aWebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(Ms));
      finally
        Ms.Free;
      end;
    finally
      ListaString.Free;
    end;
  end;
end;

procedure TfrmImportInformeComercial.Consultar;
var
  lParamConsulta: TStringList;
  //lParamList: TStringList;
  sConsulta: String;
  sHTAConsulta: String;
  sMenuNosis: String;
  sNosisPrincipal: String;
  RegLogIn : TRegLogIn;
begin
  if (FUser = '') or (FPass = '') then
    Abort;

  //IdHTTP que no haga codificacion automatica de URL. (HttpOptions [hoForceEncodeParams])
  //Si reconoce que no es un navegador web valido onda firefox, IE, o alguno de esos, te cierra la conexion.

  idHttp1.Request.Host           := 'www.nosis.com.ar';
  idHttp1.Request.UserAgent      := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/20100102 Firefox/5.1';
  idHttp1.Request.Accept         := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
  idHttp1.Request.AcceptLanguage := 'es-es,es;q=0.8,en-us;q=0.5,en;q=0.3';
  idHttp1.Request.AcceptEncoding := 'text/html, */*';
  idHttp1.Request.AcceptCharSet  := 'ISO-8859,utf-8,q=0.7,*;q=0.7';
  idHttp1.ConnectTimeout := 5000;
  idHttp2.ConnectTimeout := 5000;
  idHttp1.ReadTimeout    := 5000;
  idHttp2.ReadTimeout    := 5000;

  //Una vez hecho el Post con todos los datos, hacer un catch al redirect que envia.
  //Ese redirect incluye el nombre de usuario y el numero de ticket asignado.
  //Sigue en evento OnRedirect del IdHttp
  //En el evento OnRedirect tambien se recibe una Cookie.

  //** SI|379696042217070901|http://sac10.nosis.com.ar/query.asp?CodigoCliente=379696&Ticket=379696042217070901|Si
  //http://sac10.nosis.com.ar/body.asp?id=D1,D2,D3,D4,D5,D6,D7,&IG=true&sImprime=SI&HayMasDatos=No&IdAleatorio=IQ995390TV
  //http://sac10.nosis.com.ar/SAC_Accesos/Login.asp?Codigo=379696&Password=afiabril13&TipoAcceso=1
  //Fuser:= '379696';
  //FPass:= 'afiabril13';

  sNosisPrincipal := idHttp1.Get('http://sac10.nosis.com.ar/SAC_Accesos/Login.asp?Codigo='+FUser+'&Password='+FPass+'&TipoAcceso=1');
  Memo1.Lines.Add('<<Login.asp>>'+ sNosisPrincipal+'>>');
  sTicket :=  GetTicket(sNosisPrincipal);
  Memo1.Lines.Add('<<Ticket:'+sTicket+'>>');
  sServer :=  GetServer(sNosisPrincipal);
  Memo1.Lines.Add('<<Server:'+ sServer+'>>');
  sMenuNosis := idHttp1.Get('http://'+ sServer +'.nosis.com.ar/query.asp?CodigoCliente='+FUser+'&Ticket='+sTicket);
  Memo1.Lines.Add('<<query.asp: '+sMenuNosis+'>>');

  if (Pos('Tiene otra sesion iniciada', sMenuNosis) = 0) and (Pos('La Clave debe contener un <b>mínimo de 8 caracteres', sMenuNosis) = 0) then
  begin
    FLogIn := True; //Si hizo el login bien, lo guardo en FLogin para despues hacer logout
    GuardarUltimoAcceso(Sesion.UserID);

    sMenuNosis := idHttp1.Get('http://'+ sServer +'.nosis.com.ar/IndexHeader.htm');
    Memo1.Lines.Add('IndexHeader>>>>' + sMenuNosis + '<<<<<');
    sMenuNosis := idHttp1.Get('http://'+ sServer +'.nosis.com.ar/IndexBlank.asp');
    Memo1.Lines.Add('IndexBlank>>>>' + sMenuNosis + '<<<<<');
    sSesionId := Copy(sMenuNosis, Pos('sessionID = ''', sMenuNosis) + 13, 9);  //agarro el sesion id
    sMenuNosis := idHttp1.Get('http://'+ sServer +'.nosis.com.ar/Index.asp');
    Memo1.lines.add('<<Index.asp: '+sMenuNosis +'>>');
    sIdAleatorio := GetIdAleatorio(sMenuNosis);
    Memo1.Lines.Add('ID ALEATORIO:'+ sIdAleatorio);
    Memo1.Lines.Add('Menu:'+sMenuNosis);
    Memo1.Lines.Add('Sesion:' + sSesionId);
    lParamConsulta := TStringList.Create;
    lParamConsulta.Add('documento=' + sCUIL);
    sConsulta := idHttp2.Post('http://' + sServer + '.nosis.com.ar/SAC_UsoInterno/Consulta_paraFuentesExternas.asp', lParamConsulta);
    Application.ProcessMessages;

    if sConsulta <> 'No' then   //si viene que no en la consulta, es que no se necesita procesar los capchas.
    begin
      lParamConsulta.Clear;                                                                                         //Viene sConsulta pero codificado
      sHTAConsulta := 'http://' + sServer + '.nosis.com.ar/SAC_servHTA_General/Navegador.hta?Nombre=HTA' + sSesionId + '&DATOS=|' + Copy(sConsulta, 6, (Length(sConsulta) - 4));
      Application.ProcessMessages;
      sHTAConsulta := URLDecode(sHTAConsulta);
      fpBuscando.Hide;
      Timer1.Enabled := False;
      ShellExecute(handle, nil, PChar('iexplore.exe'), PChar(sHTAConsulta), nil, SW_SHOWNORMAL);
      Sleep(8000);
      if not MsgAsk('Por favor. Completar las comprobaciones de seguridad. ¿ Desea continuar ?') then
        Salir
      else
        Continuar; //Obtener resultados finales
    end
    else
    begin
      Memo1.Lines.Add('No se detectaron Capchas. Se continua al documento');
      fpBuscando.Hide;
      Timer1.Enabled := False;
      Continuar;  //Obtener resultados finales
    end;
  end
  else
  begin
    FLogIn := False;      //Puede ser que no funcione la clave de acceso.
    if Pos('La Clave debe contener un <b>mínimo de 8 caracteres', sMenuNosis) <> 0 then
    begin
      ShowMessage('Esta cuenta requiere una renovacion de contraseña. Intente de nuevo');
      sNosisPrincipal := idHttp2.Get('GET http://' + sServer + '.nosis.com.ar/CerroExplorer.asp'); // Cuando llega aca, en realidad ya hizo login y hay que cerrar sesion
    end
    else
    begin
      RegLogIn := GetLastLogIn(FIdCuenta);
      ShowMessage('No se pudo validar o existe otra sesion activa. Intente de nuevo'+ CRLF +RegLogIn.aSesionId+ ' ' +
                  DateTimeToStr(RegLogIn.aFecha));
    end;
    Close;
  end;
end;

procedure TfrmImportInformeComercial.btnCerrarClick(Sender: TObject);
begin
  Salir;
  Close;
  FLogIn := True;
end;

procedure TfrmImportInformeComercial.fpBuscandoShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TfrmImportInformeComercial.Timer1Timer(Sender: TObject);
begin
  pgBuscando.StepIt;
  Application.ProcessMessages;
end;

procedure TfrmImportInformeComercial.fpBuscandoClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

procedure TfrmImportInformeComercial.GuardarUltimoAcceso(const aUser: String);
var
  sSql: String;
begin
  sSql :=
    'UPDATE art.ctb_tablas' +
      ' SET tb_usumodif = :user,' +
          ' tb_fechamodif = SYSDATE' +
    ' WHERE tb_clave = ''INFCO''' +
      ' AND tb_codigo = ''0''';
  EjecutarSqlEx(sSql, [aUser]);

  sSql :=
    'UPDATE pep.pop_opcionesinformes' +
      ' SET op_usulogin = :user,' +
          ' op_fechalogin = SYSDATE' +
    ' WHERE op_id = :id';
  EjecutarSqlEx(sSql, [aUser, FIdCuenta]);
end;

function TfrmImportInformeComercial.GetLastLogin(
  const aIdSesion: Integer): TRegLogIn;
var
  aQuery: TSDQuery;
  sSql: String;
begin
  sSql :=
    'SELECT op_fechalogin, op_usulogin' +
     ' FROM pep.pop_opcionesinformes' +
    ' WHERE op_id = :id';
  aQuery := GetQueryEx(sSql, [aIdSesion]);
  try
    if not aQuery.Eof then
    begin
      Result.aFecha    := aQuery.FieldByName('op_fechalogin').AsDateTime;
      Result.aSesionId := aQuery.FieldByName('op_usulogin').AsString;
    end;
  finally
    aQuery.Free;
  end;
end;

function TfrmImportInformeComercial.GetTicket(
  const aResponse: String): String;
begin
//** SI|379696042217070901|http://sac10.nosis.com.ar/query.asp?CodigoCliente=379696&Ticket=379696042217070901|Si
Result := Copy(aResponse, Pos('Ticket=', aResponse) + 7 , 18);
end;

function TfrmImportInformeComercial.GetServer(
  const aResponse: String): String;
begin
  if Pos('sac10', aResponse) > 1 then
    Result := 'sac10';
  if Pos('Sac11', aResponse) > 1 then
    Result := 'sac11';
end;

function TfrmImportInformeComercial.GetIDAleatorio(
  const aResponse: String): String;
begin
 //Result :=  Copy(aResponse, Pos('sIdAleatorio Value=', aResponse) + 20, 10);
  Result :=  Copy(aResponse, Pos('IdConsulta=', aResponse) + 10, 10);
end;

{function TfrmImportInformeComercial.ExtractText(const Str, Delim1,
  Delim2: string): TStringList;
  var
  c,pos1, pos2: integer;
begin
  result:=TStringList.Create;
  c:=1;
  pos1:=1;

  while pos1>0 do
  begin
    pos1 := PosEx(Delim1, Str,c);
    if pos1 > 0 then begin
      pos2 := PosEx(Delim2, Str, pos1+1);
    if pos2 > 0 then
      result.Add(Copy(Str, pos1 + length(delim1), pos2 - (length(delim1) + pos1)));
      c:=pos1+1;
     end;
  end;
end; }

end.
