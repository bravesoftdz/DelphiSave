unit unFraGIS_APIv3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraWebBrowser, OleCtrls, SHDocVw, DB, SDEngine, unGIS,
  unFraNavegadorWEB, cefvcl, ceflib, ExtCtrls;

type
  TRoute = class(TObject)
  public
    Distance: Extended;
  end;

  TRoutes = class(TList)
  private
    function GetRoute(Index: integer): TRoute;
    procedure SetRoute(Index: integer; const Value: TRoute);
  public
    property Route[Index: integer]: TRoute read GetRoute write SetRoute; default;
  end;

  TWayPoints = class(TList)
  private
    function GetAddress(Index: integer): TAddress;
  public
    property Address[Index: integer]: TAddress read GetAddress; default;
  end;

  TGISInfo = class(TObject)
  private
    FTotalDistance: Extended;
    FRoutes: TRoutes;

    function GetTotalDistance: Extended;
    function GetRoutes(Index: integer): TRoutes;
    function GetWayPoints(Index: integer): TAddress;
  public
    Origin, Destination: TAddress;
    OriginalPoint: TLatLongPoint;
    FWayPoints: TList;
    constructor Create;
    destructor Destroy; override;
    function GetWayPointsURL:String;
    function GetNextSelectionOrder(AIndex: Integer): Integer;
    procedure AddRoute(AIndex: Integer; ADistance: Extended);
    procedure AddWayPoint(AWayPoint: TAddress);
    procedure ClearWayPoints;

    property TotalDistance: Extended read GetTotalDistance;
    property Routes[Index: integer]: TRoutes read GetRoutes;
    property WayPoints[Index: integer]: TAddress read GetWayPoints;
  end;

  TfraGIS_APIv3 = class(TfraWebBrowser)
    TimerTimeOut: TTimer;
    procedure wbNavegadorWEBLoadEnd(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer; out Result: Boolean);
    procedure wbNavegadorWEBConsoleMessage(Sender: TObject; const browser: ICefBrowser; message, source: ustring; line: Integer; out Result: Boolean);
    procedure TimerTimeOutTimer(Sender: TObject);
  protected
    FProcessing: Boolean;
    FOnDragEnd: TNotifyEvent;
  public
    GISInfo: TGISInfo;

    constructor Create(AComponent: TComponent); override;
    constructor CreateWithoutNavigation(AComponent: TComponent);
    destructor Destroy; override;
    procedure Clear; override;

    procedure ClearResults;
    procedure Navigate(AURL: String); override;
    procedure ResetMemoryLeak; override;
    procedure ShowAddress(Address: TAddress);
    procedure TraceRoute(AddressFrom, AddressTo: TAddress; WayPoints: TList);

    property OnDragEnd  : TNotifyEvent read FOnDragEnd    write FOnDragEnd;
    property Processing : Boolean      read FProcessing;
  end;

  function GetWayPointList(AWayPoint: TAddress): TWayPoints;

var
  fraGIS_APIv3: TfraGIS_APIv3;

implementation

uses
  unDmPrincipal, Strfuncs, StrUtils, General, Numeros, unEspera, AnsiSql, unArt,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  unEsperaSimple;

{$R *.dfm}

function GetWayPointList(AWayPoint: TAddress): TWayPoints;
var
  auxList: TWayPoints;
begin
  auxList := TWayPoints.Create;
  auxList.Add(AWayPoint);
  Result := auxList;
end;

function GetStringFromHTML(AStringHTML, AValorBuscado: String): String;
var
  iPosInicial, iPosFinal: Integer;
  sCadenaInicial, sCadenaFinal: String;
begin
  sCadenaInicial := '<' + AValorBuscado + '>';
  sCadenaFinal   := '</' + AValorBuscado + '>';

  iPosInicial := Pos(sCadenaInicial, AStringHTML);
  iPosFinal   := Pos(sCadenaFinal, AStringHTML);

  Result := Trim(Copy(AStringHTML, iPosInicial + Length(sCadenaInicial), iPosFinal - iPosInicial - Length(sCadenaInicial)));
end;

constructor TfraGIS_APIv3.Create(AComponent: TComponent);
begin
  inherited;
  GISInfo := TGISInfo.Create;
  Navigate(URL_BASE);
  FProcessing := False;
end;

constructor TfraGIS_APIv3.CreateWithoutNavigation(AComponent: TComponent);
begin
  inherited Create(AComponent);
  GISInfo := TGISInfo.Create;
  FProcessing := False;
end;

procedure TfraGIS_APIv3.Clear;
begin
  inherited;
  ClearResults;
end;

procedure TfraGIS_APIv3.ClearResults;
begin
  with GISInfo do
  begin
    FTotalDistance := -1;

    Origin.Found := False;
    Origin.Point.Latitude := 0;
    Origin.Point.Longitude := 0;

    OriginalPoint.Latitude := 0;
    OriginalPoint.Longitude := 0;

    if Assigned(Destination) then
    begin
      Destination.Found := False;
      Destination.Point.Latitude := 0;
      Destination.Point.Longitude := 0;
    end;
  end;
end;

procedure TfraGIS_APIv3.TraceRoute(AddressFrom, AddressTo: TAddress; WayPoints: TList);
var
  i: Integer;
  sDestino: String;
begin
  if not AddressFrom.IsGeoCoded then
    AddressFrom.GeoCode();

  if Assigned(AddressTo) and (not AddressTo.IsGeoCoded) then
    AddressTo.GeoCode();

  GISInfo.Origin := AddressFrom;
  GISInfo.Destination := AddressTo;
  GISInfo.OriginalPoint := AddressFrom.Point;

  GISInfo.ClearWayPoints;
  GISInfo.FTotalDistance := -1;

  if Assigned(WayPoints) then
    for i := 0 to WayPoints.Count - 1 do
      GISInfo.AddWayPoint(WayPoints[i]);

  if Assigned(GISInfo.Destination) then
    sDestino := '&address_to=' + GISInfo.Destination.Address + '|' + GetFormatoCoordenadas(GISInfo.Destination.Point.Latitude) +  '|' + GetFormatoCoordenadas(GISInfo.Destination.Point.Longitude)
  else
    sDestino := '';

  TimerTimeOut.Enabled := True;
  FProcessing := True;
  Navigate(URL_BASE + 'address_from=' + GISInfo.Origin.Address + '|' + GetFormatoCoordenadas(GISInfo.Origin.Point.Latitude) +  '|' + GetFormatoCoordenadas(GISInfo.Origin.Point.Longitude) +
                      sDestino + GISInfo.GetWayPointsURL + iif(True{Assigned(GISInfo.Destination)}, '&sin_cuadro_busqueda&sin_instrucciones', '') + '&language=es');
end;

destructor TfraGIS_APIv3.Destroy;
begin
  //FreeAndNil(GISInfo);
  inherited;
end;

procedure TfraGIS_APIv3.ResetMemoryLeak;
begin
  inherited;
  Navigate(URL_BASE);
end;

procedure TfraGIS_APIv3.wbNavegadorWEBLoadEnd(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer; out Result: Boolean);
begin
  inherited;
//  if httpStatusCode = 200 then
//    wbNavegadorWEB.HandleNeeded;
end;

procedure TfraGIS_APIv3.wbNavegadorWEBConsoleMessage(Sender: TObject; const browser: ICefBrowser; message, source: ustring; line: Integer; out Result: Boolean);
var
  iAux: Integer;
  fDistanciaTramo: Extended;
  fsFormatSetting: TFormatSettings;
begin
  Screen.Cursor := crSQLWait; //Lo vuelvo a poner hasta que termine de ejecutarse la parte de JavaScript en AJAX que dibuja el mapa.
  inherited;

  try
    if (GISInfo.FTotalDistance <= 0) and (Pos('<distancia>', message) > 0) then
      GISInfo.FTotalDistance := StrToFloatDef(GetStringFromHTML(message, 'distancia'), 0);

    for iAux := 0 to MAX_TRAMOS do
    begin
      if Pos('tramo' + IntToStr(iAux), message) > 0 then
      begin
        fDistanciaTramo := StrToFloatDef(Trim(StringReplace(StringReplace(GetStringFromHTML(message, 'tramo' + IntToStr(iAux)), ' km', '', []), ' m', '', [])), 0);
        if fDistanciaTramo > 0 then
          GISInfo.AddRoute(iAux, fDistanciaTramo);
      end;
    end;

    if (Pos('RECORRIDO_COMPLETO', message) > 0) or (Pos('Direccion simple:', message) > 0) then
    begin
      Width := Width + 1;
      Width := Width - 1;
      Screen.Cursor := FOldCursor;
      FProcessing := False;
    end;

    fsFormatSetting.DecimalSeparator := '.';
    if (Pos('<CoordenadasDragEndLat>', message) > 0) then
    begin
      GISInfo.Origin.Point.Latitude := StrToFloat(GetStringFromHTML(message, 'CoordenadasDragEndLat'), fsFormatSetting);
      GISInfo.Origin.Point.Longitude := StrToFloat(GetStringFromHTML(message, 'CoordenadasDragEndLng'), fsFormatSetting);
      if Assigned(FOnDragEnd) then
        FOnDragEnd(Self);

      Screen.Cursor := FOldCursor;
      FProcessing := False;
    end;
(*
    if (Pos('<CoordenadasDragEndLng>', message) > 0) then
    begin
      GISInfo.Origin.Point.Longitude := StrToFloat(GetStringFromHTML(message, 'CoordenadasDragEndLng'), fsFormatSetting);
      Screen.Cursor := FOldCursor;
      FProcessing := False;
    end;
*)
  except
  end;
end;

{ TGISInfo }

procedure TGISInfo.AddWayPoint(AWayPoint: TAddress);
begin
  FWayPoints.Add(AWayPoint);
end;

constructor TGISInfo.Create;
begin
  inherited;
  Origin := TAddress.Create;
  Destination := TAddress.Create;
  FWayPoints := TWayPoints.Create;
  FRoutes := TRoutes.Create;
end;

destructor TGISInfo.Destroy;
var
  i: Integer;
begin
  try
    FreeAndNil(Origin);
    //FreeAndNil(Destination); Invalid Pointer Operation???

    for i := 0 to FWayPoints.Count - 1 do
      TAddress(WayPoints[i]).Free;

    FreeAndNil(FWayPoints);
    FreeAndNil(FRoutes);
  finally
    inherited;
  end;
end;

function TGISInfo.GetTotalDistance: Extended;
begin
  Result := FTotalDistance;
end;

function TGISInfo.GetRoutes(Index: integer): TRoutes;
begin
  Result := FRoutes.Items[Index];
end;

function TGISInfo.GetWayPoints(Index: integer): TAddress;
begin
  Result := FWayPoints[Index];
end;

function TGISInfo.GetWayPointsURL: String;
var
  sAux: String;
  i: Integer;
begin
  for i := 0 to FWayPoints.Count - 1 do
  begin
    if not WayPoints[i].IsGeoCoded then
      WayPoints[i].GeoCode();

    sAux := sAux + '&waypoint' + IntToStr(i + 1) + '=' + WayPoints[i].FullAddress + '|' + GetFormatoCoordenadas(WayPoints[i].Point.Latitude) + '|' + GetFormatoCoordenadas(WayPoints[i].Point.Longitude);
  end;

  Result := sAux;
end;

procedure TGISInfo.AddRoute(AIndex: Integer; ADistance: Extended);
var
  i: Integer;
  auxRoute: TRoute;
begin
  if AIndex = 0 then
    for i := FRoutes.Count - 1 downto 0 do
      try
        auxRoute := FRoutes[i];
        FRoutes.Remove(auxRoute);
        FreeAndNil(auxRoute);
      except
      end;

  auxRoute := TRoute.Create;
  auxRoute.Distance := ADistance;
  FRoutes.Insert(AIndex, auxRoute);
end;

function TGISInfo.GetNextSelectionOrder(AIndex: Integer): Integer;
var
  iAux: Integer;
begin
  if Origin.Order = AIndex + 1 then
    Result := Origin.SelectionOrder

  else
    Result := 0;

    for iAux := 0 to FWayPoints.Count - 1 do
    begin
      if WayPoints[iAux].Order = AIndex + 1 then
      begin
        Result := WayPoints[iAux].SelectionOrder;
        Break;
      end;
    end;
end;

procedure TGISInfo.ClearWayPoints;
var
  i: Integer;
  auxWayPoint: TAddress;
begin
  for i := FWayPoints.Count - 1 downto 0 do
    try
      auxWayPoint := FWayPoints[i];
      FWayPoints.Remove(auxWayPoint);
      FreeAndNil(auxWayPoint);
    except
    end;
end;

{ TWayPoints }

function TWayPoints.GetAddress(Index: integer): TAddress;
begin
  Result := Items[Index];
end;

{ TRoutes }

function TRoutes.GetRoute(Index: integer): TRoute;
begin
  Result := Items[Index];
end;

procedure TRoutes.SetRoute(Index: integer; const Value: TRoute);
begin
  Items[Index] := Value;
end;

procedure TfraGIS_APIv3.Navigate(AURL: String);
begin
  inherited;
end;

procedure TfraGIS_APIv3.ShowAddress(Address: TAddress);
begin
  FProcessing := False;
  TimerTimeOut.Enabled := False;
  TraceRoute(Address, nil, nil);
end;

procedure TfraGIS_APIv3.TimerTimeOutTimer(Sender: TObject);
var
  sResultado: String;
  ssURL, ssRespuesta: TStringStream;
begin
  TimerTimeOut.Enabled := False;

  if FProcessing and (GISInfo.FTotalDistance <= 0) then
  begin
    ssURL := TStringStream.Create(URL_GEOCODIFICACION);
    ssRespuesta := TStringStream.Create('');

    IniciarEspera('Verificando la Conexión a Internet...');
    with TIdHTTP.Create(nil) do
    try
      try
        Get(UTF8Encode(ssURL.DataString), ssRespuesta);
        sResultado := UTF8Decode(ssRespuesta.DataString);
      except
        sResultado := '';
      end;
    finally
      DetenerEspera;
      Free;
    end;
  end;

  if not IsEmptyString(sResultado) then
    GISInfo.FTotalDistance := 0;

  FProcessing := False;
end;

end.
