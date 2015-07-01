unit unFraDomicilioGIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraDomicilio, DB, SDEngine, StdCtrls, PatternEdit, IntEdit,
  Mask, ToolEdit, ArtComboBox, AdvGlowButton, FormPanel, unArtFrame,
  unFraNavegadorWEB, ExtCtrls, unFraGIS_APIv3, unGIS, RxToolEdit;

type
  TfraDomicilioGIS = class(TfraDomicilio)
    btnBuscarGIS: TAdvGlowButton;
    btnMapaGIS: TAdvGlowButton;
    fpGIS: TFormPanel;
    btnCerrar: TAdvGlowButton;
    btnBuscarEnMapa: TAdvGlowButton;
    TimerCuelgue: TTimer;
    procedure cmbCalleChange(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnMapaGISClick(Sender: TObject);
    procedure fpGISShow(Sender: TObject);
    procedure btnBuscarEnMapaClick(Sender: TObject);
    procedure TimerCuelgueTimer(Sender: TObject);
    procedure edNumeroChange(Sender: TObject);
  private
    fraGISDomicilio: TfraGIS_APIv3;
    FIdPrestador, FIdEstablecimiento: Integer;
    FCUIT, FTipoGeoCodificacion: String;
    FAddress: TAddress;
    FMostrarCaracterRaro, FMostrarMensajeGIS: Boolean;
    function  GetCoordenadas: TLatLongPoint;
    function  GetIdPrestador: Integer;
    procedure SetIdPrestador(const Value: Integer);
    function  GetGeocodificado: Boolean;
    function  GetCUIT: String;
    procedure SetCUIT(const Value: String);
    function GetLocalAddress: TAddress;
    function GetIdEstablecimiento: Integer;
    procedure SetIdEstablecimiento(const Value: Integer);
  protected
    procedure Change; override;
    procedure SetLocked(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function  CalculateDistanceTo(AddressTo: TAddress): Extended;
    procedure Cargar(sCalle, sCodPostal, sLocalidad, sNumero, sPiso, sDepto, Int_Str_Prov, aCpa: String;
                     iLatitud: Extended = 0; iLongitud: Extended = 0; bChange: Boolean = True);
    procedure Clear; override;
    function  GeoCodificar(AValidation: Boolean; ATipo: String = 'O' {Otro}): Boolean; overload;

    property  Address           : TAddress      read GetLocalAddress;
    property  Coordenadas       : TLatLongPoint read GetCoordenadas;
  	property  CUIT              : String        read GetCUIT write SetCUIT;
    property  GeoCodificado     : Boolean       read GetGeocodificado;
    property  MostrarMensajeGIS : Boolean       read FMostrarMensajeGIS write FMostrarMensajeGIS;
    property  IdEstablecimiento : Integer       read GetIdEstablecimiento write SetIdEstablecimiento;
    property  IdPrestador       : Integer       read GetIdPrestador write SetIdPrestador;
  end;
{
var
  fraDomicilioGIS: TfraDomicilioGIS;
}
implementation

uses
  CustomDlgs, VCLExtra, Math, unDmPrincipal, unEspera;

{$R *.dfm}

procedure TfraDomicilioGIS.cmbCalleChange(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if not Locked and MostrarMensajeGIS then
    for i := 0 to Length(CADENAS_CALLE) - 1 do
      if Pos(CADENAS_CALLE[i], UpperCase(cmbCalle.Text)) > 0 then
      begin
        if FMostrarCaracterRaro then
        begin
          FMostrarCaracterRaro := False;
          InfoHint(cmbCalle, 'Se ha detectado un caracter no convencional en la calle del domicilio.', False, 'Información del GIS', blnInfo, 3, False);
          Break;
        end;
      end;

  FAddress.Point := GetLatLngPoint(0, 0);
end;

procedure TfraDomicilioGIS.btnCerrarClick(Sender: TObject);
begin
  inherited;
  fpGIS.Close;
end;

procedure TfraDomicilioGIS.btnBuscarClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfraDomicilioGIS.btnMapaGISClick(Sender: TObject);
begin
  inherited;
  Verificar(IsEmpty, btnMapaGIS, 'Debe seleccionar un domicilio para acceder al uso del mapa de referencia.');
  Verificar(Trim(Localidad) = '', cmbLocalidad, 'Verifique la localidad del domicilio seleccionado.');  
  fraGISDomicilio.Parent := fpGIS;
  fpGIS.ShowModal;
end;

procedure TfraDomicilioGIS.SetLocked(const Value: Boolean);
begin
  inherited;
  btnBuscarGIS.Enabled := not Value;
  btnMapaGIS.Enabled := True;
end;

procedure TfraDomicilioGIS.fpGISShow(Sender: TObject);
begin
  inherited;
  IniciarEspera;
  TimerCuelgue.Enabled := True;
  try
    fraGISDomicilio.ShowAddress(Address);
  finally
    DetenerEspera;
    TimerCuelgue.Enabled := False;    
  end;
end;

function TfraDomicilioGIS.GetCoordenadas: TLatLongPoint;
begin
  Result := FAddress.Point;
end;

procedure TfraDomicilioGIS.Cargar(sCalle, sCodPostal, sLocalidad, sNumero, sPiso, sDepto, Int_Str_Prov, aCpa: String;
                                  iLatitud, iLongitud: Extended; bChange: Boolean);
begin
  FMostrarCaracterRaro := True;
  inherited Cargar(sCalle, sCodPostal, sLocalidad, sNumero, sPiso, sDepto, Int_Str_Prov, aCpa, bChange);
  FAddress := GetAddress(sCalle, StrToIntDef(Trim(sNumero), 0), StrToIntDef(sCodPostal, 0), sLocalidad, Provincia, Int_Str_Prov);
  FAddress.Point := GetLatLngPoint(iLatitud, iLongitud);
end;

function TfraDomicilioGIS.GetIdEstablecimiento: Integer;
begin
  Result := FIdEstablecimiento;
end;

function TfraDomicilioGIS.GetIdPrestador: Integer;
begin
  Result := FIdPrestador;
end;

procedure TfraDomicilioGIS.SetIdEstablecimiento(const Value: Integer);
var
	sSql: String;
begin
  if Value <> FIdEstablecimiento then
  begin
    sSql := 'SELECT ES_CALLE CALLE, ES_NUMERO NUMERO, ES_PISO PISO, ES_DEPARTAMENTO DEPARTAMENTO,' +
                  ' ES_CPOSTAL CODIGOPOSTAL, ES_CPOSTALA CPA, ES_LOCALIDAD LOCALIDAD, PV_DESCRIPCION PROVINCIA ' +
             ' FROM AES_ESTABLECIMIENTO, CPV_PROVINCIAS' +
            ' WHERE ES_ID = :IdEstablecimiento' +
              ' AND PV_CODIGO = ES_PROVINCIA';

    with GetQueryEx(sSql, [Value]) do
    try
      Open;
      if not Eof then
      begin
        FIdEstablecimiento := Value;
        Cargar(FieldByName('CALLE').AsString, FieldByName('CODIGOPOSTAL').AsString, FieldByName('LOCALIDAD').AsString,
               FieldByName('NUMERO').AsString, FieldByName('PISO').AsString, FieldByName('DEPARTAMENTO').AsString,
               FieldByName('PROVINCIA').AsString, FieldByName('CPA').AsString, 0, 0, False);

        FTipoGeoCodificacion := 'S'; //Establecimiento
        Change;
      end else
        Clear;
    finally
      Free;
    end;
  end;
end;

procedure TfraDomicilioGIS.SetIdPrestador(const Value: Integer);
var
  sSQL: String;
begin
  FIdPrestador := Value;
  sSQL := 'SELECT ca_calle, ca_numero, ca_pisocalle, ca_departamento, ca_codpostal, ca_localidad, ' +
                ' ca_codpostala, ca_provincia, ca_lat, ca_lng ' +
           ' FROM cpr_prestador' +
          ' WHERE ca_identificador = :PRESTADOR';
  with GetQueryEx(sSQL, [Value]) do
  try
    Cargar(FieldByName('CA_CALLE').Text, FieldByName('CA_CODPOSTAL').Text, FieldByName('CA_LOCALIDAD').Text,
           FieldByName('CA_NUMERO').Text, FieldByName('CA_PISOCALLE').Text, FieldByName('CA_DEPARTAMENTO').Text,
           FieldByName('CA_PROVINCIA').Text, FieldByName('CA_CODPOSTALA').Text,
           FieldByName('CA_LAT').AsFloat, FieldByName('CA_LNG').AsFloat, False);

    FTipoGeoCodificacion := 'P'; //Prestador
    Change;
  finally
    FIdPrestador := Value;
    Free;
  end;
end;

procedure TfraDomicilioGIS.Change;
begin
  FAddress.Clear;
  inherited;
end;

function TfraDomicilioGIS.GetGeocodificado: Boolean;
begin
  Result := Address.IsGeoCoded; {Salvo que estemos parados en el origen de coordenadas... imposible}
end;

procedure TfraDomicilioGIS.Clear;
begin
  inherited;
  Address.Clear;
  FIdPrestador := 0;
  FIdEstablecimiento := 0;
  FCUIT := '';
  FTipoGeoCodificacion := 'O'; //Otros
  FMostrarCaracterRaro := True;
end;

procedure TfraDomicilioGIS.btnBuscarEnMapaClick(Sender: TObject);
begin
  inherited;
//  fraGISDomicilio.ShowSearchControls;
end;

function TfraDomicilioGIS.GetCUIT: String;
begin
  Result := FCUIT;
end;

procedure TfraDomicilioGIS.SetCuit(const Value: String);
var
	sSql: String;
begin
  if Value <> FCUIT then
  begin
    sSql := 'SELECT MP_CALLE_POST CALLE, MP_NUMERO_POST NUMERO, MP_PISO_POST PISO, MP_DEPARTAMENTO_POST DEPARTAMENTO,' +
                  ' MP_CPOSTAL_POST CODIGOPOSTAL, MP_CPOSTALA_POST CPA, MP_LOCALIDAD_POST LOCALIDAD, PV_DESCRIPCION PROVINCIA ' +
             ' FROM CMP_EMPRESAS, CPV_PROVINCIAS' +
            ' WHERE MP_CUIT = :CUIT' +
              ' AND PV_CODIGO = MP_PROVINCIA_POST';

    with GetQueryEx(sSql, [Value]) do
    try
      Open;
      if not Eof then
      begin
        FCUIT := Value;
        Cargar(FieldByName('CALLE').AsString, FieldByName('CODIGOPOSTAL').AsString, FieldByName('LOCALIDAD').AsString,
               FieldByName('NUMERO').AsString, FieldByName('PISO').AsString, FieldByName('DEPARTAMENTO').AsString,
               FieldByName('PROVINCIA').AsString, FieldByName('CPA').AsString, 0, 0, False);

        FTipoGeoCodificacion := 'E'; //Empresa
        Change;
      end else
        Clear;
    finally
      Free;
    end;
  end;
end;

procedure TfraDomicilioGIS.TimerCuelgueTimer(Sender: TObject);
begin
  DetenerEspera;
  Address.Point := GetLatLngPoint(0, 0);
  InfoHint(Self, 'El proceso de georeferenciación no se pudo llevar a cabo correctamente en un tiempo prudencial. Intente nuevamente en un instante.', True);
end;

function TfraDomicilioGIS.CalculateDistanceTo(AddressTo: TAddress): Extended;
begin
  Verificar(IsEmpty, cmbLocalidad, 'Debe seleccionar un domicilio válido.');

  if not GeoCodificado then
    GeoCodificar(True);

  if Self.GeoCodificado then
  begin
    fraGISDomicilio.TraceRoute(Self.Address, AddressTo, nil);

    while fraGISDomicilio.Processing do
    begin
      Sleep(50);
      Application.ProcessMessages;
    end;

    Result := fraGISDomicilio.GISInfo.TotalDistance;
  end else
    Result := -1;
end;

function TfraDomicilioGIS.GeoCodificar(AValidation: Boolean; ATipo: String = 'O'): Boolean;
begin
  if ATipo = '' then
    ATipo := '0';

  FTipoGeoCodificacion := ATipo;

  if IsSelected then
  begin
    try
      FAddress.Point := GeoCodeAddress(Address, ATipo);
      Result := (FAddress.Point.Latitude <> 0) and (FAddress.Point.Longitude <> 0);
    except
      Result := False;
      FAddress.Point := GetLatLngPoint(0, 0);
    end
  end else
  begin
    Result := False;
    FAddress.Point := GetLatLngPoint(0, 0);
  end;
end;

constructor TfraDomicilioGIS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAddress := TAddress.Create;
  FMostrarMensajeGIS := True;
  FMostrarCaracterRaro := True;
  fraGISDomicilio := TfraGIS_APIv3.CreateWithoutNavigation(Self);
  fraGISDomicilio.Parent := fpGIS;
  fraGISDomicilio.Align := alClient;
end;

destructor TfraDomicilioGIS.Destroy;
begin
  FreeAndNil(fraGISDomicilio);
  FreeAndNil(FAddress);
  inherited;
end;

function TfraDomicilioGIS.GetLocalAddress: TAddress;
begin
  //if FAddress.IsEmpty then //Lo ideal sería dejar este IF pero cuando cambia la calle o el número veo que NO SE EJECUTA ACTUALMENTE el método CHANGE

  if not IsEmpty then
    FAddress := GetAddress(Calle, StrToIntDef(Trim(Numero), 0), StrToIntDef(CodigoPostal, 0), Localidad, Provincia, IntToStr(Prov), True, FTipoGeoCodificacion)
  else
    FAddress.Clear;
    
  Result := FAddress;
end;

procedure TfraDomicilioGIS.edNumeroChange(Sender: TObject);
begin
  inherited;
  FAddress.Point := GetLatLngPoint(0, 0);
end;

end.
