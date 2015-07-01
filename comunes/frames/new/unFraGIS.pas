unit unFraGIS;

Este ya no se usa!!! Y esto esta puesto asi para que no compile ;-)

{
En su lugar se usará el unFraGIS_APIv3 !!!!!
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraNavegadorWEB, OleCtrls, SHDocVw, mshtml, ExtCtrls, xmldom,
  XMLIntf, msxmldom, XMLDoc, pngextra, JvExExtCtrls, JvComponent, JvPanel,
  StdCtrls, Menus;

const
  URL_ALTERNATIVA = 'http://maps.gaiasoftware.com.ar/index.php?';
  URL_BASE = 'http://maps.provinciart.com.ar:81/index.php?';
  DISTANCIA_MAXIMA = 'distancia_aproximada';

  TEXTO_LATITUD_ORIGEN = 'latitud_origen';
  TEXTO_LONGITUD_ORIGEN = 'longitud_origen';

  TEXTO_LATITUD_DESTINO = 'latitud_destino';
  TEXTO_LONGITUD_DESTINO = 'longitud_destino';

  PORC_DESVIO_GIS = 1.5;

  CADENAS_CALLE: Array[0..12] of String = (' MANZANA ', ' EDIFICIO ', ' BARRIO ', ' EDF ', ' ESQ ', ' ESQ.',
                                           ' ESQ/', ' ESQ:', ' EX ', ' E/', ' ENTRE ', '(', ')');

type
  TControlResultado = class;

  TLatLongPoint = record
    Latitude, Longitude: Extended;
  end;

  TEnumAddressType = (atFrom, atTo);

  TAddress = record
    Address: String;
    AddressType: TEnumAddressType;
    Point: TLatLongPoint;
    Found: Boolean;
  end;

  TGISInfo = record
    Distance: Extended;
    Origin, Destination: TAddress;    
  end;

  TfraGIS = class(TfraNavegadorWEB)
    pnlBusqueda: TJvPanel;
    PNGButton: TPNGButton;
    TimerCuelgue: TTimer;
    procedure wbNavegadorWEBDocumentComplete(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure PNGButtonClick(Sender: TObject);
    procedure TimerCuelgueTimer(Sender: TObject);
  private
    iall: IHTMLElement;
    FIntentos: Integer;
    FAbortar: Boolean;
    FURL: String;
    FTitulo: String;    
    GISInfo: TGISInfo;
    ControlResultado: TControlResultado;
    FShowProgress: Boolean;
    FAlternativeURL: Boolean;
    function GetURL: String;
    function GetDataFound: Boolean;
  public
    constructor Create(AComponent: TComponent); override;
    procedure AfterConstruction; override;
    procedure ClearResults(var AGISInfo: TGISInfo);
    function  CalculateDistance(lat1, lon1, lat2, lon2: Extended): Extended;
    procedure HideSearchControls;
    procedure ShowSearchControls;
    function  SearchAddress(AStreet, ANumber, ACity, AState, AZipCode: String): TGISInfo; overload;
    function  SearchAddress(AStreetFrom,ANumberFrom,ACityFrom,AStateFrom,AZipCodeFrom: String;
                            AStreetTo,ANumberTo,ACityTo,AStateTo,AZipCodeTo: String;
                            AFirstTime: Boolean = True): TGISInfo; overload;
    procedure ExecuteScript(AScript: String; AType: String = 'JavaScript');

    property  AlternativeURL: Boolean read FAlternativeURL write FAlternativeURL;
    property  DataFound: Boolean read GetDataFound;
    property  ShowProgress: Boolean read FShowProgress write FShowProgress;
    property  Titulo: String read FTitulo write FTitulo;
    property  URL: String read GetURL;
  end;

  TControlResultado = class(TThread)
  private
    FDataFound: Boolean;
    FParentFrame: TfraGIS;
    FURL: String;
    function GetDocument: IHTMLDocument2;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean; AParentFrame: TfraGIS); overload;
    
    procedure Buscar;
    procedure Navigate;
    property  DataFound: Boolean read FDataFound write FDataFound;
    property  Document: IHTMLDocument2 read GetDocument;
    property  URL: String read FURL write FURL;
  end;
  
var
  fraGIS: TfraGIS;

implementation

uses
  unEspera, General, Numeros, unDmPrincipal, Strfuncs, Math, unART, DB,
  CustomDlgs, StrUtils;

{$R *.dfm}

{ TfraGIS }

constructor TfraGIS.Create(AComponent: TComponent);
begin
  inherited;
  FAlternativeURL := False;
  Navigate(URL_BASE);
  Titulo := '';
end;

procedure TfraGIS.AfterConstruction;
begin
  inherited;
  if not (csDesigning	in Self.ComponentState) and IsWinXP then
  begin
    PNGButton.ButtonStyle := pbsFlat;
{
    PNGButton.Top := Self.Top + Self.Height - 40;
    PNGButton.Left := 40;
    PNGButton.Align := alClient;
    PNGButton.Anchors := [akLeft, akBottom];
    PNGButton.Width := 36;
    PNGButton.Height := 36;

    PNGButton.Visible := True;
    PNGButton.BringToFront;
}
  end;
end;

procedure TfraGIS.ClearResults(var AGISInfo: TGISInfo);
begin
  with AGISInfo do
  begin
    Distance := 0;

    Origin.Found := False;
    Origin.Point.Latitude := 0;
    Origin.Point.Longitude := 0;

    Destination.Found := False;
    Destination.Point.Latitude := 0;
    Destination.Point.Longitude := 0;
  end;
end;

function TfraGIS.GetDataFound: Boolean;
begin
  if Assigned(ControlResultado) then
    Result := ControlResultado.DataFound
  else
    Result := False;
end;

function TfraGIS.GetURL: String;
begin
  Result := FURL;
end;

function TfraGIS.SearchAddress(AStreet, ANumber, ACity, AState, AZipCode: String): TGISInfo;
begin
  if IsEmptyString(Titulo) then
    Titulo := 'Buscando dirección...';
  Result := SearchAddress(AStreet, ANumber, ACity, AState, AZipCode, '', '', '', '', '', True);
end;

function TfraGIS.SearchAddress(AStreetFrom, ANumberFrom, ACityFrom, AStateFrom, AZipCodeFrom,
                               AStreetTo, ANumberTo, ACityTo, AStateTo, AZipCodeTo: String;
                               AFirstTime: Boolean = True): TGISInfo;
  function ConfigureAdddress(AStreet, ANumber, ACity, AZipCode, AState, ACountry: String): String;
    procedure ProccessCity(var AStreet, ANumber, AZipCode, ACity, AState: String);
    var
      sSQL: String;
    begin
      {Parche para no usar la calle y el nro. en todo el país, salvo CAP. FED.,
       Esto se hace porque no quieren tomarse la molestia de ir manejando la tabla de excepciones}
      if AState <> 'CAPITAL FEDERAL' then
      begin
        if not ExisteSQLEx('SELECT 1 ' +
                             'FROM ART.CCP_CODIGOPOSTAL ' +
                            'WHERE CP_CODIGO = :CODIGO ' +
                              'AND CP_LOCALIDAD = :LOCALIDAD ' +
                              'AND CP_PROVINCIA = (SELECT PV_CODIGO ' +
                                                    'FROM CPV_PROVINCIAS ' +
                                                   'WHERE UPPER(PV_DESCRIPCION) = :PROVINCIA) ' +
                              'AND CP_GBA = ''S'' ', [AZipCode, ACity, AState]) then
        begin
          AStreet := '';
          ANumber := '';
        end;
      end;

      sSQL := 'SELECT * ' +
                'FROM COMUNES.CGI_GIS, ART.CPV_PROVINCIAS ' +
               'WHERE GI_LOCALIDAD = :LOCALIDAD ' +
                 'AND GI_PROVINCIA = PV_CODIGO ' +
                 'AND PV_DESCRIPCION = :PROVINCIA ' +
                 'AND GI_FECHABAJA IS NULL';
      with GetQueryEx(sSQL, [ACity, AState]) do
      try
        if not IsEmpty then
        begin
          if FieldByName('GI_SIN_CALLES').AsString = 'S' then
          begin
            AStreet := '';
            ANumber := '';
          end;

          if not FieldByName('GI_REEMPLAZAR_POR').IsNull then
            ACity := FieldByName('GI_REEMPLAZAR_POR').AsString;

          if (Trim(AStreet) = '') and not FieldByName('GI_DEFAULT').IsNull then
          begin
            AStreet := FieldByName('GI_DEFAULT').AsString;
          end;
        end;
      finally
        Free;
      end;
    end;
  var
    i: Integer;
    sDireccion: String;
  begin
    for i := 0 to Length(CADENAS_CALLE) - 1 do
      if Pos(CADENAS_CALLE[i], UpperCase(AStreet)) > 0 then
        AStreet := Trim(StrLeft(AStreet, InStr(UpperCase(AStreet), CADENAS_CALLE[i])-1));

    AStreet := AnsiReplaceStr(AStreet, Chr(34), ' ');
    ACity := AnsiReplaceStr(ACity, Chr(34), ' ');
    AState := AnsiReplaceStr(AState, Chr(34), ' ');

    ProccessCity(AStreet, ANumber, AZipCode, ACity, AState);
    sDireccion := iif(Trim(AStreet) > '',
                      iif(IsNumber(Copy(Trim(AStreet), 1, 1)),
                          Trim(AStreet) + ' ' + Trim(ANumber),
                          Trim(ANumber) + ' ' + Trim(AStreet)),
                      '');
    Result := sDireccion +
              iif(Trim(ACity) > '', iif(Trim(sDireccion) > '', ', ', '') + Trim(ACity), '') +
              iif(IsEmptyString(Trim(ACity)) or ((Trim(UpperCase(ACity)) = Trim(UpperCase(AState))) and (AState = 'CAPITAL FEDERAL')), '', ', ' + Trim(AState)) +
              iif(Trim(ACity) > '', iif(UpperCase(ACity) <> 'BUENOS AIRES', ', ' + ACountry, ''), '');
  end;
var
  sSQL: String;  
begin
  if IsEmptyString(Titulo) then
    Titulo := 'Calculando distancia...';

  Clear;
  while wbNavegadorWEB.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  if ShowProgress then
    IniciarEspera(Titulo);

  ClearResults(GISInfo);
  Application.ProcessMessages;
  ControlResultado := TControlResultado.Create(True, Self);
  TimerCuelgue.Enabled := True;
  try
    FIntentos := 0;
    FAbortar := False;
    GISInfo.Origin.Address := ConfigureAdddress(AStreetFrom, ANumberFrom, ACityFrom, AZipCodeFrom, AStateFrom, 'Argentina');
    GISInfo.Destination.Address := ConfigureAdddress(AStreetTo, ANumberTo, ACityTo, AZipCodeTo, AStateTo, 'Argentina');

    ControlResultado.URL := iif(FAlternativeURL, URL_ALTERNATIVA, URL_BASE) + 'address_from=' + GISInfo.Origin.Address + '&address_to=' + GISInfo.Destination.Address;
    FURL := ControlResultado.URL;
    Navigate(ControlResultado.URL);
    Application.ProcessMessages;
    ControlResultado.Execute;

    sSQL := 'SELECT co_partido ' +
              'FROM art.cco_partidos_codigospostales ' +
             'WHERE UPPER(co_localidad) like :localidad ' +
               'AND co_codigopostal = :codpostal ' +
               'AND co_provincia = (SELECT pv_codigo ' +
                                     'FROM cpv_provincias ' +
                                    'WHERE UPPER(pv_descripcion) = :provincia) ' +
             'UNION ' +
            'SELECT co_partido ' +
              'FROM art.cco_partidos_codigospostales ' +
             'WHERE :localidad like ''%'' || REPLACE(co_localidad, '' '', ''%'') || ''%'' ' +
               'AND co_codigopostal = :codpostal ' +
               'AND co_provincia = (SELECT pv_codigo ' +
                                     'FROM cpv_provincias ' +
                                    'WHERE UPPER(pv_descripcion) = :provincia)';

    if not FAbortar then
    begin
      if AFirstTime and not GISInfo.Origin.Found then
      begin
        with GetQueryEx(sSQL, [UpperCase('%' + StringReplace(ACityFrom, ' ', '%', [rfReplaceAll]) + '%'), AZipCodeFrom, AStateFrom, ACityFrom]) do
        try
          while not Eof do
          begin
            ACityFrom := FieldByName('CO_PARTIDO').AsString;
            SearchAddress(AStreetFrom, ANumberFrom, ACityFrom, AStateFrom, AZipCodeFrom,
                          AStreetTo, ANumberTo, ACityTo, AStateTo, AZipCodeTo, False);

            if GISInfo.Origin.Found then
              Break
            else
              Next;
          end;
        finally
          Free;
        end;

        if not GISInfo.Origin.Found then
        begin
          AStreetFrom := ValorSQLEx('SELECT GI_DEFAULT ' +
                                      'FROM COMUNES.CGI_GIS, ART.CPV_PROVINCIAS ' +
                                     'WHERE GI_LOCALIDAD = :LOCALIDAD ' +
                                       'AND GI_PROVINCIA = PV_CODIGO ' +
                                       'AND PV_DESCRIPCION = :PROVINCIA ' +
                                       'AND GI_FECHABAJA IS NULL', [ACityFrom, AStateFrom]);
          ANumberFrom := '';
          SearchAddress(AStreetFrom, ANumberFrom, ACityFrom, AStateFrom, AZipCodeFrom,
                        AStreetTo, ANumberTo, ACityTo, AStateTo, AZipCodeTo, False);
        end;
      end;

      if AFirstTime and not GISInfo.Destination.Found then
      begin
        with GetQueryEx(sSQL, [UpperCase('%' + StringReplace(ACityTo, ' ', '%', [rfReplaceAll]) + '%'), AZipCodeTo, AStateTo, ACityTo]) do
        try
          while not Eof do
          begin
            ACityTo := FieldByName('CO_PARTIDO').AsString;
            SearchAddress(AStreetFrom, ANumberFrom, ACityFrom, AStateFrom, AZipCodeFrom,
                          AStreetTo, ANumberTo, ACityTo, AStateTo, AZipCodeTo, False);

            if GISInfo.Destination.Found then
              Break
            else
              Next;
          end;
        finally
          Free;
        end;

        if not GISInfo.Destination.Found then
        begin
          AStreetTo := ValorSQLEx('SELECT GI_DEFAULT ' +
                                    'FROM COMUNES.CGI_GIS, ART.CPV_PROVINCIAS ' +
                                   'WHERE GI_LOCALIDAD = :LOCALIDAD ' +
                                     'AND GI_PROVINCIA = PV_CODIGO ' +
                                     'AND PV_DESCRIPCION = :PROVINCIA ' +
                                     'AND GI_FECHABAJA IS NULL', [ACityTo, AStateTo]);
          ANumberTo := '';
          SearchAddress(AStreetFrom, ANumberFrom, ACityFrom, AStateFrom, AZipCodeFrom,
                        AStreetTo, ANumberTo, ACityTo, AStateTo, AZipCodeTo, False);
        end;
      end;
    end;
  finally
    TimerCuelgue.Enabled := False;  
    Result := GISInfo;
    Application.ProcessMessages;
    Titulo := '';
    if ShowProgress then
      DetenerEspera;
    try
      //ControlResultado.Terminate;  
      //FreeAndNil(ControlResultado);
    except
    end;
  end;
end;

procedure TfraGIS.wbNavegadorWEBDocumentComplete(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
begin
  inherited;
  // Por ahora no hago nada acá...
end;

function TfraGIS.CalculateDistance(lat1, lon1, lat2, lon2: Extended): Extended;
const
  R = 6378; // Radio máximo de la tierra en kilómetros (si la consideramos como una esfera)
var
  dlon, dlat, a, c: Extended;
begin
  lat1 := lat1 * pi/180;
  lon1 := lon1 * pi/180;
  lat2 := lat2 * pi/180;
  lon2 := lon2 * pi/180;

  dlon := lon2 - lon1;
  dlat := lat2 - lat1;
  a := sqr(sin(dlat/2)) + cos(lat1) * cos(lat2) * sqr(sin(dlon/2));
  c := 2 * arcsin(min(1,sqrt(a)));
  Result := RoundTo(R * c, -2);
end;

procedure TfraGIS.ShowSearchControls;
begin
  try
    ExecuteScript('if ((document.getElementById("control") != null) ' +
                  '&&  (document.getElementById("control") != undefined)) ' +
                  'document.getElementById("control").style.display="block";');

    ExecuteScript('if ((document.getElementById("buscar_destino") != null) ' +
                  '&&  (document.getElementById("buscar_destino") != undefined)) ' +
                  'document.getElementById("buscar_destino").style.display="none";');
  except
  end;
end;

{ TControlResultado }

procedure TControlResultado.Buscar;
  function ObtenerValorHTML(ATexto, ATag: String; AFormatoDecimal: TFormatSettings): Extended;
  begin
    if Pos(ATag, ATexto) > 0 then
    begin
      Result := StrToFloatDef(Trim(Copy(ATexto,
                                        Pos(ATag, ATexto) + Length(ATag),
                                        Pos(ATag + '_fin', ATexto) - Pos(ATag, ATexto) - Length(ATag)
                                        )
                                   )
                              , 0, AFormatoDecimal);
    end else
      Result := 0;
  end;
var
  sTexto: String;
  FormatoDecimal: TFormatSettings;
begin
  with FParentFrame do
  begin
    if Assigned(wbNavegadorWEB.Document) then
    begin
      iall := (wbNavegadorWEB.Document as IHTMLDocument2).body;

      if Assigned(iall) then
      begin
        // Si no encuentro la distancia ni un error asumo que se colgó y recién a la 12va vez (3 segundos) intento de nuevo
        // (esto lo hago sólo 5 veces, hasta que FIntentos llega a 60)
        if ((Pos(WideString('Distancia aproximada: '), iall.innerText) = 0) and (Pos(WideString('No se encontró'), iall.innerText) = 0) and (FIntentos <= 60))
        and (Trim(GISInfo.Origin.Address) > '') and (Trim(GISInfo.Destination.Address) > '') then
        begin
          Inc(FIntentos);
          if (FIntentos mod 12) = 0 then
          begin
            Navigate(URL);
          end;
          Exit;
        end;

        if (FIntentos > 60)
        or (Pos(WideString('cannot display the webpage'), iall.innerText) > 0)
        or (Pos(WideString('no puede mostrar la'), iall.innerText) > 0) then
        begin
          if (Pos(WideString('cannot display the webpage'), iall.innerText) > 0)
          or (Pos(WideString('no puede mostrar la'), iall.innerText) > 0)
          then
            MsgBox('Verifique la conexión de su navegador web,' + CRLF + 'consulte con Mesa de Ayuda de Sistemas (int. 2929)');

          FAbortar := True;
          Terminate;
        end;

        while iall.parentElement <> nil do
        begin
          iall := iall.parentElement;
        end;

        sTexto := iall.innerText;

        if IsEmptyString(sTexto) or (Pos('Fin de la búsqueda', sTexto) = 0) then
          Exit;

        FormatoDecimal.DecimalSeparator := '.';
        FormatoDecimal.ThousandSeparator := ',';

        with GISInfo do
        begin
          Distance := ObtenerValorHTML(sTexto, DISTANCIA_MAXIMA, FormatoDecimal);

          {....Ver el tema de obtener las coordenadas sin redondeo, creo...}
          
          Origin.Found := Pos('No se encontró la dirección de Inicio', sTexto) = 0;
          Origin.Point.Latitude := ObtenerValorHTML(sTexto, TEXTO_LATITUD_ORIGEN, FormatoDecimal);
          Origin.Point.Longitude := ObtenerValorHTML(sTexto, TEXTO_LONGITUD_ORIGEN, FormatoDecimal);

          Destination.Found := Pos('No se encontró la dirección de Fin', sTexto) = 0;
          Destination.Point.Latitude := ObtenerValorHTML(sTexto, TEXTO_LATITUD_DESTINO, FormatoDecimal);
          Destination.Point.Longitude := ObtenerValorHTML(sTexto, TEXTO_LONGITUD_DESTINO, FormatoDecimal);

          if Origin.Found and Destination.Found then
          begin
            try
              ExecuteScript('if ((document.getElementById("control") != null) ' +
                            '&&  (document.getElementById("control") != undefined)) ' +
                            'document.getElementById("control").style.display="none";');
            except
            end
          end else
          begin
            if (Destination.Address = '') then
            try
              ExecuteScript('if ((document.getElementById("control") != null) ' +
                            '&&  (document.getElementById("control") != undefined)) ' +
                            'document.getElementById("control").style.display="block";');

              ExecuteScript('if ((document.getElementById("buscar_destino") != null) ' +
                            '&&  (document.getElementById("buscar_destino") != undefined)) ' +
                            'document.getElementById("buscar_destino").style.display="none";');
            except
            end;
          end;

          FDataFound := True;
          iall := nil;
          Terminate;
        end;
      end;
    end;
  end;
end;

constructor TControlResultado.Create(CreateSuspended: Boolean; AParentFrame: TfraGIS);
begin
  inherited Create(CreateSuspended);
  FDataFound := False;
  Priority := tpNormal;
  FreeOnTerminate := True;
  FParentFrame := AParentFrame;
end;

procedure TfraGIS.ExecuteScript(AScript: String; AType: String = 'JavaScript');
var
  HTMLWindow: IHTMLWindow2; // parent window of current HTML document
begin
  if Assigned(wbNavegadorWEB.Document) then
  begin
    HTMLWindow := (wbNavegadorWEB.Document as IHTMLDocument2).parentWindow;
    with HTMLWindow do
    try
      execScript(AScript, AType);
    except
      ShowMessage('Error ejecutando una función de JavaScript.');
    end;
  end;
end;

procedure TControlResultado.Execute;
begin
  inherited;
//  Synchronize(Navigate);
  while not Terminated do
  begin
    Sleep(250);
    Synchronize(Buscar);
    Application.ProcessMessages;
  end;
end;

function TControlResultado.GetDocument: IHTMLDocument2;
begin
  Result := IHTMLDocument2(FParentFrame.wbNavegadorWEB.Document);
end;

procedure TControlResultado.Navigate;
begin
  FParentFrame.Navigate(URL);
end;

procedure TfraGIS.PNGButtonClick(Sender: TObject);
begin
//  ExecuteScript('document.getElementById("control").style.display="block";');
end;

procedure TfraGIS.HideSearchControls;
begin
  try
    ExecuteScript('if ((document.getElementById("control") != null) ' +
                  '&&  (document.getElementById("control") != undefined)) ' +
                  'document.getElementById("control").style.display="none";');
  except
  end;
end;

procedure TfraGIS.TimerCuelgueTimer(Sender: TObject);
begin
{
  TimerCuelgue.Enabled := False;
  try
    ControlResultado.Terminate;
    FreeAndNil(ControlResultado);
  except
  end;
  if ShowProgress then
    DetenerEspera;
  InfoHint(Self, 'El proceso de georeferenciación no se pudo llevar a cabo correctamente en un tiempo prudencial. Intente nuevamente en un instante.', True);
}  
end;

end.
