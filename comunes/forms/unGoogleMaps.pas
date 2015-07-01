unit unGoogleMaps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ImgList, XPMenu, Placemnt, unArtFrame, SHDocVw,
  unFraNavegadorWEB, ExtCtrls, StdCtrls, DB, SDEngine, mshtml, 
  AdvGlowButton, unFraDomicilio, unFraDomicilioGIS, AdvToolBar,
  AdvToolBarStylers, unFraGIS_APIv3;

type
  TfrmGoogleMaps = class(TfrmCustomForm)
    TimerTraslados: TTimer;
    MemoLog: TMemo;
    sdqTraslados: TSDQuery;
    Button1: TButton;
    AdvToolBarPager: TAdvToolBarPager;
    pagDireccion: TAdvPage;
    pagRecorrido: TAdvPage;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    Panel1: TPanel;
    fraDireccion: TfraDomicilioGIS;
    btnBuscar: TAdvGlowButton;
    pnlDirecciones: TPanel;
    fraDireccionHasta: TfraDomicilioGIS;
    fraDireccionDesde: TfraDomicilioGIS;
    btnCalcular: TAdvGlowButton;
    sdqDirecciones: TSDQuery;
    TimerDirecciones: TTimer;
    sdqDistancias: TSDQuery;
    TimerDistancias: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TimerTrasladosTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AdvToolBarPagerChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure TimerDireccionesTimer(Sender: TObject);
    procedure TimerDistanciasTimer(Sender: TObject);
  private
    fraGoogleMaps: TfraGIS_APIv3;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  frmGoogleMaps: TfrmGoogleMaps;

implementation

uses
  unDmPrincipal, General, CustomDlgs, unGIS;

var
  MouseHook: HHook;
  
{$R *.dfm}

procedure FreeMemory;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);
end;

function MouseProc(nCode: Integer; wParam: wParam; lParam: lParam): LResult; stdcall;
var
  classbuf: array[0..255] of Char;
const
  ie = 'Internet Explorer_Server';
begin
  Result := 0;
  
  case nCode < 0 of         
    True:
      Result := CallNextHookEx(MouseHook, nCode, wParam, lParam) ;
    False:
      case wParam of
      WM_RBUTTONDOWN, WM_RBUTTONUP:
      begin
        GetClassName(PMOUSEHOOKSTRUCT(lParam)^.HWND, classbuf, SizeOf(classbuf)) ;
        if lstrcmp(@classbuf[0], @ie[1]) = 0 then
          Result := HC_SKIP
        else
          Result := CallNextHookEx(MouseHook, nCode, wParam, lParam) ;
      end
      else
      begin
        Result := CallNextHookEx(MouseHook, nCode, wParam, lParam) ;
      end;
    end; //case wParam
  end; //case nCode
end; (*MouseProc*)

procedure TfrmGoogleMaps.FormCreate(Sender: TObject);
//var sArchivo: String;
begin
  inherited;
//  MouseHook := SetWindowsHookEx(WH_MOUSE, MouseProc, 0, GetCurrentThreadId());
  AdvToolBarPager.ActivePageIndex := 0;
  AdvToolBarPagerChange(nil);
//  InputQuery('Archivo', 'Elija el nro de archivo', sArchivo);
//  OpenQueryEx(sdqTraslados, [sArchivo]);
//  OpenQuery(sdqDirecciones);
//  OpenQuery(sdqDistancias);
  fraGoogleMaps := TfraGIS_APIv3.CreateWithoutNavigation(Self);
  fraGoogleMaps.Parent := Self;
  fraGoogleMaps.Align := alClient;

  {
  fraGoogleMaps.ShowProgress := True;
  fraGoogleMaps.HideSearchControls;
  }
end;

procedure TfrmGoogleMaps.TimerTrasladosTimer(Sender: TObject);
var
  sSQL: String;
  Resultado: TGISInfo;
  dTiempoInicial: TDateTime;
begin
  TimerTraslados.Enabled := False;
  inherited;
  with sdqTraslados do
  while not Eof do
  begin
    dTiempoInicial := Now;
    Application.ProcessMessages;
    //fraGoogleMaps.Titulo := Format('Calculando distancia... (%d de %d)', [RecNo {$IFDEF VER150}+ 1{$ENDIF}, RecordCount]);
    //fraGoogleMaps.AlternativeURL := not fraGoogleMaps.AlternativeURL;
    //Resultado := fraGoogleMaps.SearchAddress(FieldByName('CALLE_DESDE').AsString, FieldByName('NUMERO_DESDE').AsString, FieldByName('LOCALIDAD_DESDE').AsString, FieldByName('PROVINCIA_DESDE').AsString, FieldByName('CPOSTAL_DESDE').AsString,
    //                                         FieldByName('CALLE_HASTA').AsString, FieldByName('NUMERO_HASTA').AsString, FieldByName('LOCALIDAD_HASTA').AsString, FieldByName('PROVINCIA_HASTA').AsString, FieldByName('CPOSTAL_HASTA').AsString);

    fraGoogleMaps.TraceRoute(GetAddress(FieldByName('CALLE_DESDE').AsString, FieldByName('NUMERO_DESDE').AsInteger, FieldByName('CPOSTAL_DESDE').AsInteger,
                                        FieldByName('LOCALIDAD_DESDE').AsString, FieldByName('PROVINCIA_DESDE').AsString, FieldByName('PROVINCIA_DESDE').AsString, True),
                             GetAddress(FieldByName('CALLE_HASTA').AsString, FieldByName('NUMERO_HASTA').AsInteger, FieldByName('CPOSTAL_HASTA').AsInteger,
                                        FieldByName('LOCALIDAD_HASTA').AsString, FieldByName('PROVINCIA_HASTA').AsString, FieldByName('PROVINCIA_HASTA').AsString, True),
                             nil);
    Resultado := fraGoogleMaps.GISInfo;
{
    while not fraGoogleMaps.DataFound do
    begin
      Sleep(500);
    end;
}
//    MemoLog.Lines.Add(fraGoogleMaps.URL);
    MemoLog.Lines.Add('Distancia: ' + FloatToStr(Resultado.TotalDistance) + ' km. ' +
                      'Tiempo:' + FloatToStr((Now - dTiempoInicial)*24*60*60));

    with sdqTraslados do
    begin
      sSQL := 'UPDATE PABLO.PROCESO_TRASLADOS_GIS ' +
                 'SET GOOGLE_D = :V1, ' +
                     'GOOGLE_H = :V2, ' +
                     'LAT_D = :V3, ' +
                     'LNG_D = :V4, ' +
                     'LAT_H = :V5, ' +
                     'LNG_H = :V6, ' +
                     'DISTANCIA = :V7 ' +
               'WHERE ROWID = :ID';

      EjecutarSqlEx(sSQL, [String(iif(Resultado.Origin.Found, 'S', 'N')),
                           String(iif(Resultado.Destination.Found, 'S', 'N')),
                           Resultado.Origin.Point.Latitude,
                           Resultado.Origin.Point.Longitude,
                           Resultado.Destination.Point.Latitude,
                           Resultado.Destination.Point.Longitude,
                           Resultado.TotalDistance,
                           FieldByName('ROWID').AsString]);

      MemoLog.Lines.Add(Format(iif(not Resultado.Origin.Found, 'Dirección de origen NO encontrada (%s) %f %f',
                                                               'Dirección de origen encontrada (%s) Latitud %f Longitud %f'),
                               [Resultado.Origin.Address, Resultado.Origin.Point.Latitude, Resultado.Origin.Point.Longitude]));
      MemoLog.Lines.Add(Format(iif(not Resultado.Destination.Found, 'Dirección de destino NO encontrada (%s) %f %f',
                                                                    'Dirección de destino encontrada (%s) Latitud %f Longitud %f'),
                               [Resultado.Destination.Address, Resultado.Destination.Point.Latitude, Resultado.Destination.Point.Longitude]));
      MemoLog.Lines.Add('Distancia máxima posible ' + FloatToStr(Resultado.TotalDistance) + ' km.');
      MemoLog.Lines.Add(Format('Calculando distancia... (%d de %d)', [RecNo {$IFDEF VER150}+ 1{$ENDIF}, RecordCount]));
      MemoLog.Lines.Add('');

      Next;
      FreeMemory;
    end;
  end;
end;

procedure TfrmGoogleMaps.FormDestroy(Sender: TObject);
begin
  inherited;
  if MouseHook <> 0 then
    UnHookWindowsHookEx(MouseHook);
end;

procedure TfrmGoogleMaps.Button1Click(Sender: TObject);
begin
  //fraGoogleMaps.ExecuteScript('createMapMarker("31.05173494","-122.03160858", "Marcador de prueba");');
end;

procedure TfrmGoogleMaps.AdvToolBarPagerChange(Sender: TObject);
begin
  inherited;
  if AdvToolBarPager.ActivePageIndex = 0 then
    AdvToolBarPager.Height := 137
  else
    AdvToolBarPager.Height := 193;  
end;

procedure TfrmGoogleMaps.btnBuscarClick(Sender: TObject);
begin
  Verificar(fraDireccion.IsEmpty, fraDireccion, 'Debe completar la dirección que desea ubicar.');
  fraGoogleMaps.ShowAddress(fraDireccion.Address);
end;

procedure TfrmGoogleMaps.btnCalcularClick(Sender: TObject);
begin
  Verificar(fraDireccionDesde.IsEmpty, fraDireccionDesde, 'Debe completar la dirección de origen.');
  Verificar(fraDireccionHasta.IsEmpty, fraDireccionHasta, 'Debe completar la dirección de destino.');
  fraGoogleMaps.TraceRoute(fraDireccionDesde.Address, fraDireccionHasta.Address, nil);
  {
  fraGoogleMaps.SearchAddress(fraDireccionDesde.Calle, fraDireccionDesde.Numero, fraDireccionDesde.Localidad, fraDireccionDesde.Provincia, fraDireccionDesde.CodigoPostal,
                              fraDireccionHasta.Calle, fraDireccionHasta.Numero, fraDireccionHasta.Localidad, fraDireccionHasta.Provincia, fraDireccionHasta.CodigoPostal);
  fraGoogleMaps.HideSearchControls;
  }
end;

procedure TfrmGoogleMaps.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style and not WS_CAPTION;
end;

procedure TfrmGoogleMaps.TimerDireccionesTimer(Sender: TObject);
var
  sSQL: String;
  Resultado: TGISInfo;
  dTiempoInicial: TDateTime;
begin
  TimerDirecciones.Enabled := False;
  inherited;
  with sdqDirecciones do
  while not Eof do
  begin
    dTiempoInicial := Now;
    Application.ProcessMessages;
    //fraGoogleMaps.Titulo := Format('Obteniendo ubicación... (%d de %d)', [RecNo {$IFDEF VER150}+ 1{$ENDIF}, RecordCount]);
    //Resultado := fraGoogleMaps.SearchAddress(FieldByName('CALLE').AsString, FieldByName('NUMERO').AsString, FieldByName('LOCALIDAD').AsString, FieldByName('PROVINCIA').AsString, FieldByName('CPOSTAL').AsString);

    fraGoogleMaps.ShowAddress(GetAddress(FieldByName('CALLE').AsString, FieldByName('NUMERO').AsInteger, FieldByName('CPOSTAL').AsInteger, FieldByName('LOCALIDAD').AsString, FieldByName('PROVINCIA').AsString, FieldByName('PROV').AsString, True, 'O'));
    Resultado := fraGoogleMaps.GISInfo;

    MemoLog.Lines.Add('Tiempo:' + FloatToStr((Now - dTiempoInicial)*24*60*60));
    MemoLog.Lines.Add(Format(iif(not Resultado.Origin.Found, 'Dirección de origen NO encontrada (%s) %f %f',
                                                             'Dirección de origen encontrada (%s) Latitud %f Longitud %f'),
                             [Resultado.Origin.Address, Resultado.Origin.Point.Latitude, Resultado.Origin.Point.Longitude]));
    MemoLog.Lines.Add('');
    Application.ProcessMessages;

    if MsgAsk(Format('¿Está bien la dirección (hay %s domicilios como este)?', [sdqDirecciones.FieldByName('CANTIDAD').AsString])) then
    begin
      with sdqDirecciones do
      begin
        sSQL := 'UPDATE pablo.proceso_traslados_gis ' +
                   'SET google_h = :google, ' +
                       'lat_h = :lat_h, ' +
                       'lng_h = :lng_h ' +
                 'WHERE EXISTS(SELECT 1 ' +
                                'FROM art.sau_autorizaciones ' +
                               'WHERE au_hcalle = :calle ' +
                                 'AND au_hnumero = :numero ' +
                                 'AND au_hcpostal = :cpostal ' +
                                 'AND au_hlocalidad = :localidad ' +
                                 'AND SIN = au_siniestro ' +
                                 'AND ord = au_orden ' +
                                 'AND rec = au_recaida ' +
                                 'AND aut = au_numauto) ' +
                   '--AND lat_h IS NULL';

        EjecutarSqlEx(sSQL, [String(iif(Resultado.Origin.Found, 'S', 'N')),
                             Resultado.Origin.Point.Latitude,
                             Resultado.Origin.Point.Longitude,
                             FieldByName('CALLE').AsString,
                             FieldByName('NUMERO').AsString,
                             FieldByName('CPOSTAL').AsString,
                             FieldByName('LOCALIDAD').AsString]);

        sSQL := 'UPDATE pablo.proceso_traslados_gis ' +
                   'SET google_d = :google, ' +
                       'lat_d = :lat_d, ' +
                       'lng_d = :lng_d ' +
                 'WHERE EXISTS(SELECT 1 ' +
                                'FROM art.sau_autorizaciones ' +
                               'WHERE au_dcalle = :calle ' +
                                 'AND au_dnumero = :numero ' +
                                 'AND au_dcpostal = :cpostal ' +
                                 'AND au_dlocalidad = :localidad ' +
                                 'AND SIN = au_siniestro ' +
                                 'AND ord = au_orden ' +
                                 'AND rec = au_recaida ' +
                                 'AND aut = au_numauto) ' +
                   '--AND lat_d IS NULL';

        EjecutarSqlEx(sSQL, [String(iif(Resultado.Origin.Found, 'S', 'N')),
                             Resultado.Origin.Point.Latitude,
                             Resultado.Origin.Point.Longitude,
                             FieldByName('CALLE').AsString,
                             FieldByName('NUMERO').AsString,
                             FieldByName('CPOSTAL').AsString,
                             FieldByName('LOCALIDAD').AsString]);
      end;
    end;

    Next;
    FreeMemory;
  end;
  sdqDistancias.Open;
  TimerDistancias.Enabled := True;
end;

procedure TfrmGoogleMaps.TimerDistanciasTimer(Sender: TObject);
{
var
  sSQL: String;
  fDistancia: Extended;
}
begin
  inherited;
  with sdqDistancias do
  while not Eof do
  begin
    {
    fDistancia := fraGIS_APIv3.CalculateDistance(FieldByName('LAT_D').AsFloat, FieldByName('LNG_D').AsFloat, FieldByName('LAT_H').AsFloat, FieldByName('LNG_H').AsFloat);

    sSQL := 'UPDATE PABLO.PROCESO_TRASLADOS_GIS ' +
               'SET DISTANCIA = :V7 ' +
             'WHERE ROWID = :ID';

    EjecutarSqlEx(sSQL, [fDistancia, FieldByName('ROWID').AsString]);
    }
    Next;
  end;
end;

initialization
  RegisterClasses([TWebBrowser]);
end.
