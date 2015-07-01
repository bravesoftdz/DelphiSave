unit unRptCartDocCorreoArgentinoHeader;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtQReports,
  QRTansparentImage, unArt;

type
  TrptCartDocCorreoArgentinoHeader = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrlDestProvincia: TQRLabel;
    qrbSummary: TQRBand;
    qrlExtraInfo: TArtQRLabel;
    qrlRemNombre: TQRLabel;
    qrlRemDomicilio: TQRLabel;
    qrlRemCPostal: TQRLabel;
    qrlRemLocalidad: TQRLabel;
    qrlRemProvincia: TQRLabel;
    qrlDestLocalidad: TQRLabel;
    qrlDestCPostal: TQRLabel;
    qrlDestDomicilio: TQRLabel;
    qrlDestNombre: TQRLabel;
    qrlRemProvincia1: TQRLabel;
    qrlRemLocalidad1: TQRLabel;
    qrlRemCPostal1: TQRLabel;
    qrlRemDomicilio1: TQRLabel;
    qrlRemNombre1: TQRLabel;
    qrlDestNombre1: TQRLabel;
    qrlDestDomicilio1: TQRLabel;
    qrlDestCPostal1: TQRLabel;
    qrlDestProvincia1: TQRLabel;
    PageFooterBand1: TQRBand;
    qriFirma: TQRTansparentImage;
    qrlFirmante: TArtQRLabel;
    qrlDocumento: TArtQRLabel;
    qrlCaracter: TArtQRLabel;
    qrlNumero: TQRLabel;
    qrlBarras1: TQRLabel;
    qrlBarras2: TQRLabel;
    qrlNumero1: TQRLabel;
    qrlDestLocalidad1: TQRLabel;
    qrlContrato: TQRLabel;
    qriMotivoNoEntrega: TQRImage;
    qrCodFirma: TQRLabel;
    qrNroOden: TQRLabel;
    qrlExtraInfoFooter: TQRLabel;
    qrmInfoPie: TQRMemo;
    procedure qrlBarrasPrint(sender: TObject; var Value: String);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure qrlDestLocalidadPrint(sender: TObject; var Value: String);
    procedure qrlRemProvincia1Print(sender: TObject; var Value: String);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FFirmaVisible: Boolean;
    FIdFirmante: TTableId;
    FRemitenteCorreo: Boolean;
    FMostrarInfoPie: Boolean;
    procedure SetIdFirmante(const Value: TTableId);
  protected
    FFirmaPos: TPoint;
    function IsFirmaVisible: boolean; virtual;
    procedure LoadFirma; virtual;
    procedure ClearFirma; virtual;
    procedure SetFirmaVisible( AVisible : Boolean );
  public
    constructor Create(AOwner: TComponent); override;
    procedure Remite_Provincia_ART (bGobernacion :boolean);
    procedure ReplicarRemitente;
    procedure ReplicarDestinatario;
    procedure ReplicarTodo;
    procedure LoadDestinatario(ACuit : String);
  published
    property IdFirmante: TTableId read FIdFirmante write SetIdFirmante;
    property RemitenteCorreo: Boolean read FRemitenteCorreo write FRemitenteCorreo Default False;
    property MostrarInfoPie: Boolean read FMostrarInfoPie write FMostrarInfoPie Default False;
  end;

implementation

uses unPrincipal, unDmPrincipal, AnsiSql, uncomunes;

const
  RemProvinciaCorreo: String = 'BUENOS AIRES';
  RemLocalidadCorreo: String = 'MONTE GRANDE';
  RemCPostalCorreo  : String = 'B1842ZAC';
  RemDomicilioCorreo: String = 'CTP BUE Sector Carta Documento';

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.Remite_Provincia_ART (bGobernacion :boolean);
//var
//  Sql      : String;
 // Consulta : TSDQuery;
begin
  try
  //  Sql := 'SELECT utiles.armar_domicilio( lg_calle, lg_numero, lg_piso, lg_departamento) domicilio, ' +
  //                'nvl(lg_cpostala, lg_cpostal) cpostal,  lg_localidad, pv_descripcion ' +
  //          ' FROM dlg_delegaciones, cpv_provincias ' +
  //         ' WHERE lg_codigo = ' + {$IFDEF ART2}SqlInt{$ELSE}SqlValue{$ENDIF}(frmPrincipal.DBLogin.Delegacion) +
  //           ' AND pv_codigo = lg_provincia';
  //  Consulta := GetQuery(Sql);
    try
      if bGobernacion then
        qrlRemNombre1.Caption    := ART_NOMBRE_GOB
      else
        qrlRemNombre1.Caption    := ART_NOMBRE2;

    {  qrlRemDomicilio1.Caption := Consulta.FieldByName('DOMICILIO').AsString ;
      qrlRemCPostal1.Caption   := Consulta.FieldByName('CPOSTAL').AsString;
      qrlRemProvincia1.Caption := Consulta.FieldByName('PV_DESCRIPCION').AsString;
      qrlRemLocalidad1.Caption := Consulta.FieldByName('LG_LOCALIDAD').AsString;        }

      qrlRemDomicilio1.Caption := 'Devolver a CTP BUE Sector Carta Documento (12658 F53)';     // por ticket 46221
      qrlRemCPostal1.Caption   := REMCPOSTALCORREO;
      qrlRemProvincia1.Caption := REMPROVINCIACORREO;
      qrlRemLocalidad1.Caption := REMLOCALIDADCORREO;

      ReplicarRemitente;
    finally
     // Consulta.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error al cargar el domicilo de Provincia A.R.T.' + #13 + E.Message );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.ReplicarDestinatario;
begin
  qrlDestProvincia1.Caption := qrlDestProvincia.Caption;
  qrlDestLocalidad1.Caption := qrlDestLocalidad.Caption;
  qrlDestCPostal1.Caption   := qrlDestCPostal.Caption;
  qrlDestDomicilio1.Caption := qrlDestDomicilio.Caption;
  qrlDestNombre1.Caption    := qrlDestNombre.Caption;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.ReplicarRemitente;
begin
  if RemitenteCorreo then
  begin
    qrlRemProvincia.Caption := RemProvinciaCorreo;
    qrlRemLocalidad.Caption := RemLocalidadCorreo;
    qrlRemCPostal.Caption   := RemCPostalCorreo;
    qrlRemDomicilio.Caption := RemDomicilioCorreo;
  end
  else begin
    qrlRemProvincia.Caption := qrlRemProvincia1.Caption;
    qrlRemLocalidad.Caption := qrlRemLocalidad1.Caption;
    qrlRemCPostal.Caption   := qrlRemCPostal1.Caption;
    qrlRemDomicilio.Caption := qrlRemDomicilio1.Caption;
  end;
  qrlRemNombre.Caption    := qrlRemNombre1.Caption;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.ReplicarTodo;
begin
  qrlNumero1.Caption := qrlNumero.Caption;
  ReplicarRemitente;
  ReplicarDestinatario;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.qrlBarrasPrint(sender: TObject; var Value: String);
begin
  Value := '*' + qrlNumero.Caption + '*';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.LoadDestinatario(ACuit: String);
Var
   Sql      : String;
   Consulta : TSDQuery;
begin
  try
    Sql := 'SELECT mp_nombre, ' +
                  'utiles.armar_domicilio( mp_calle, mp_numero, mp_piso, mp_departamento) domicilio, ' +
                  'nvl(mp_cpostala, mp_cpostal) cpostal, mp_localidad, pv_descripcion ' +
            ' FROM cmp_empresas, cpv_provincias ' +
           ' WHERE mp_cuit = ''' + ACuit + ''' ' +
             ' AND mp_provincia = pv_codigo';
    Consulta := GetQuery(Sql);

    if Assigned(Consulta) then
    begin
       qrlDestNombre.Caption    := Consulta.FieldByName('MP_NOMBRE').AsString  ;
       qrlDestDomicilio.Caption := Consulta.FieldByName('DOMICILIO').AsString  ;
       qrlDestCPostal.Caption   := Consulta.FieldByName('CPOSTAL').AsString ;
       qrlDestProvincia.Caption := Consulta.FieldByName('PV_DESCRIPCION').AsString ;
       qrlDestLocalidad.Caption := Consulta.FieldByName('MP_LOCALIDAD').AsString ;
       ReplicarDestinatario;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error al cargar el domicilo del Destinatario.' + #13 + E.Message );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.ClearFirma;
begin
  qrlFirmante.Caption  := ' ';
  qrlCaracter.Caption  := ' ';
  qrlDocumento.Caption := ' ';
  qriFirma.Picture := Nil;
  SetFirmaVisible(False);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.LoadFirma;
var
  sSql     : String;
  sdqDatos : TSDQuery;
begin
  sSql := 'SELECT initcap(df_usuario) nombre, df_tiponrodoc, initcap(df_caracter) caracter, df_firma, df_margeninferior ' +
           ' FROM cdf_firmascartasdoc ' +
          ' WHERE df_codfirma = ' + SqlInt(FIdFirmante);
  sdqDatos := GetQuery(sSql);
  Try
    if sdqDatos.IsEmpty then
      ClearFirma
    else begin
      SetFirmaVisible(True);
      qrlFirmante.Caption  := sdqDatos.FieldByName('NOMBRE').AsString;
      qrlCaracter.Caption  := sdqDatos.FieldByName('DF_TIPONRODOC').AsString;
      qrlDocumento.Caption := sdqDatos.FieldByName('CARACTER').AsString;
      qriFirma.Picture.Assign( sdqDatos.FieldByName('DF_FIRMA') );
      { Ubica la Firma según FFirmaPos : TPoint ------------------------------- }
      qriFirma.Left := FFirmaPos.x - (qriFirma.Width  div 2);
      qriFirma.Top  := FFirmaPos.y +  sdqDatos.FieldByName('DF_MARGENINFERIOR').AsInteger - qriFirma.Height
    end;
  finally
    sdqDatos.Free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.SetFirmaVisible(AVisible: Boolean);
begin
  qrlFirmante.Visible  := AVisible;
  qrlDocumento.Visible := AVisible;
  qrlCaracter.Visible  := AVisible;
  qriFirma.Visible     := AVisible;
  FFirmaVisible        := AVisible;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.SetIdFirmante(const Value: TTableId);
begin
  if FIdFirmante <> Value then
  begin
    FIdFirmante := Value;

    if FIdFirmante = ART_EMPTY_ID then
      ClearFirma
    else
      LoadFirma;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptCartDocCorreoArgentinoHeader.Create(AOwner: TComponent);
begin
  inherited;
  FFirmaPos.x       := qriFirma.Left + (qriFirma.Width div 2);
  FFirmaPos.y       := qriFirma.Top + qriFirma.Height;
  FIdFirmante       := ART_EMPTY_ID;
  FFirmaVisible     := True;
  FRemitenteCorreo  := False;
  Page.BottomMargin := 40;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  SetFirmaVisible(IsFirmaVisible);
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptCartDocCorreoArgentinoHeader.IsFirmaVisible: boolean;
begin
  Result := FFirmaVisible;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.qrlDestLocalidadPrint(sender: TObject; var Value: String);
begin
  if Value = 'CAPITAL FEDERAL' Then
    Value := 'CIUDAD DE BS.AS.';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.qrlRemProvincia1Print(sender: TObject; var Value: String);
begin
  if Value = 'CAPITAL FEDERAL' Then
    Value := 'CAP.FED.';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocCorreoArgentinoHeader.PageFooterBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if Not(MostrarInfoPie) then qrmInfoPie.Lines.Text := '';
end;

end.
