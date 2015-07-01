unit unRptCartDocRowingHeader;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine, ArtQReports,
  QRTansparentImage, unArt;

type
  TrptCartDocRowingHeader = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrlRemNombre: TQRLabel;
    qrlRemDomicilio: TQRLabel;
    qrlRemCPostal: TQRLabel;
    qrlRemLocalidad: TQRLabel;
    qrlRemProvincia: TQRLabel;
    qrlDestProvincia: TQRLabel;
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
    qrlDestLocalidad1: TQRLabel;
    qrlDestProvincia1: TQRLabel;
    qrlNumero: TQRLabel;
    qrlNumero1: TQRLabel;
    qrbSummary: TQRBand;
    qrlBarras2: TQRLabel;
    qrlBarras1: TQRLabel;
    qriFirma: TQRTansparentImage;
    qrlFirmante: TArtQRLabel;
    qrlDocumento: TArtQRLabel;
    qrlCaracter: TArtQRLabel;
    qrlExtraInfo: TArtQRLabel;
    procedure qrlBarrasPrint(sender: TObject; var Value: String);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure qrlDestLocalidadPrint(sender: TObject; var Value: String);
    procedure qrlRemProvincia1Print(sender: TObject; var Value: String);
  private
    FFirmaVisible: Boolean;
    FIdFirmante: TTableId;
    procedure SetIdFirmante(const Value: TTableId);
  protected
    FFirmaPos: TPoint;
    function IsFirmaVisible: boolean; virtual;
    procedure LoadFirma; virtual;
    procedure ClearFirma; virtual;
    procedure SetFirmaVisible( AVisible : Boolean );
  public
    constructor Create(AOwner: TComponent); override;
    procedure Remite_Provincia_ART;
    procedure ReplicarRemitente;
    procedure ReplicarDestinatario;
    procedure ReplicarTodo;
    procedure LoadDestinatario(ACuit : String);
  published
    property IdFirmante: TTableId  read FIdFirmante write SetIdFirmante;
  end;
{
var
  rptCartDocBonHeader: TrptCartDocBonHeader;
}
implementation

uses unPrincipal, unDmPrincipal, AnsiSql;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.Remite_Provincia_ART;
var
  Sql      : String;
  Consulta : TSDQuery;
begin
  Try
    Sql := 'SELECT UTILES.ARMAR_DOMICILIO( LG_CALLE, LG_NUMERO, LG_PISO, LG_DEPARTAMENTO) DOMICILIO, ' +
                  'LG_CPOSTAL,  LG_LOCALIDAD, PV_DESCRIPCION ' +
             'FROM DLG_DELEGACIONES, CPV_PROVINCIAS ' +
            'WHERE LG_CODIGO = ''' + frmPrincipal.DBLogin.Delegacion + ''' ' +
              'AND PV_CODIGO = LG_PROVINCIA';
    Consulta := GetQuery( Sql );
    Try
      qrlRemNombre.Caption    := 'Provincia A.R.T.' ;
      qrlRemDomicilio.Caption := Consulta.FieldByName('DOMICILIO').AsString  ;
      qrlRemCPostal.Caption   := Consulta.FieldByName('LG_CPOSTAL').AsString ;
      qrlRemProvincia.Caption := Consulta.FieldByName('PV_DESCRIPCION').AsString ;
      qrlRemLocalidad.Caption := Consulta.FieldByName('LG_LOCALIDAD').AsString ;

      ReplicarRemitente;
    finally
      Consulta.Free;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error al cargar el domicilo de Provincia A.R.T.' + #13 + E.Message );
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.ReplicarDestinatario;
begin
  qrlDestProvincia1.Caption := qrlDestProvincia.Caption ;
  qrlDestLocalidad1.Caption := qrlDestLocalidad.Caption ;
  qrlDestCPostal1.Caption   := qrlDestCPostal.Caption ;
  qrlDestDomicilio1.Caption := qrlDestDomicilio.Caption ;
  qrlDestNombre1.Caption    := qrlDestNombre.Caption ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.ReplicarRemitente;
begin
  qrlRemProvincia1.Caption := qrlRemProvincia.Caption ;
  qrlRemLocalidad1.Caption := qrlRemLocalidad.Caption ;
  qrlRemCPostal1.Caption   := qrlRemCPostal.Caption ;
  qrlRemDomicilio1.Caption := qrlRemDomicilio.Caption ;
  qrlRemNombre1.Caption    := qrlRemNombre.Caption ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.ReplicarTodo;
begin
    qrlNumero1.Caption := qrlNumero.Caption;
    ReplicarRemitente;
    ReplicarDestinatario;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.qrlBarrasPrint(sender: TObject; var Value: String);
begin
     Value := '*' + qrlNumero.Caption + '*';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.LoadDestinatario(ACuit: String);
Var
   Sql      : String;
   Consulta : TSDQuery;
begin
  Try
    Sql := 'SELECT MP_NOMBRE, ' +
                  'UTILES.ARMAR_DOMICILIO( MP_CALLE, MP_NUMERO, MP_PISO, MP_DEPARTAMENTO) DOMICILIO, ' +
                  'MP_CPOSTAL,  MP_LOCALIDAD, PV_DESCRIPCION ' +
             'FROM CMP_EMPRESAS, CPV_PROVINCIAS ' +
            'WHERE MP_CUIT = ''' + ACuit + ''' ' +
              'AND MP_PROVINCIA = PV_CODIGO';
    Consulta := GetQuery( Sql );

    if Assigned( Consulta ) Then
    begin
       qrlDestNombre.Caption    := Consulta.FieldByName('MP_NOMBRE').AsString  ;
       qrlDestDomicilio.Caption := Consulta.FieldByName('DOMICILIO').AsString  ;
       qrlDestCPostal.Caption   := Consulta.FieldByName('MP_CPOSTAL').AsString ;
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
procedure TrptCartDocRowingHeader.ClearFirma;
begin
  qrlFirmante.Caption  := ' ';
  qrlCaracter.Caption  := ' ';
  qrlDocumento.Caption := ' ';
  qriFirma.Picture := Nil;
  SetFirmaVisible(False);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.LoadFirma;
var
  sSql     : String;
  sdqDatos : TSDQuery;
begin
  sSql := 'SELECT INITCAP(DF_USUARIO) NOMBRE, DF_TIPONRODOC, INITCAP(DF_CARACTER) CARACTER, DF_FIRMA, DF_MARGENINFERIOR ' +
            'FROM CDF_FIRMASCARTASDOC ' +
           'WHERE DF_CODFIRMA = ' + SqlInt( FIdFirmante );
  sdqDatos := GetQuery( sSql );
  Try
    if sdqDatos.IsEmpty Then
      ClearFirma
    else begin
      SetFirmaVisible( True );

      qrlFirmante.Caption  := sdqDatos.FieldByName('NOMBRE').AsString;
      qrlCaracter.Caption  := sdqDatos.FieldByName('DF_TIPONRODOC').AsString;
      qrlDocumento.Caption := sdqDatos.FieldByName('CARACTER').AsString;
      qriFirma.Picture.Assign( sdqDatos.FieldByName('DF_FIRMA') );

      { Ubica la Firma según FFirmaPos : TPoint ------------------------------- }
      qriFirma.Left := FFirmaPos.x - (qriFirma.Width  div 2);
      qriFirma.Top  := FFirmaPos.y +  sdqDatos.FieldByName('DF_MARGENINFERIOR').AsInteger - qriFirma.Height
    end;
  finally
    sdqDatos.Free ;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.SetFirmaVisible(AVisible: Boolean);
begin
  qrlFirmante.Visible  := AVisible;
  qrlDocumento.Visible := AVisible;
  qrlCaracter.Visible  := AVisible;
  qriFirma.Visible     := AVisible;
  FFirmaVisible        := AVisible;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.SetIdFirmante(const Value: TTableId);
begin
  if FIdFirmante <> Value then
  begin
    FIdFirmante := Value;

    if FIdFirmante = ART_EMPTY_ID Then
      ClearFirma
    else
      LoadFirma;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptCartDocRowingHeader.Create(AOwner: TComponent);
begin
  inherited;
  FFirmaPos.x := qriFirma.Left + (qriFirma.Width div 2);
  FFirmaPos.y := qriFirma.Top + qriFirma.Height;

  FIdFirmante    := ART_EMPTY_ID;
  FFirmaVisible := True;
//  SetFirmaVisible( False );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  SetFirmaVisible( IsFirmaVisible );
end;
{----------------------------------------------------------------------------------------------------------------------}
function TrptCartDocRowingHeader.IsFirmaVisible: boolean;
begin
  Result := FFirmaVisible;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.qrlDestLocalidadPrint(sender: TObject; var Value: String);
begin
  if Value = 'CAPITAL FEDERAL' Then
    Value := 'CIUDAD AUTONOMA DE BS.AS.';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TrptCartDocRowingHeader.qrlRemProvincia1Print(sender: TObject;
  var Value: String);
begin
  if Value = 'CAPITAL FEDERAL' Then
    Value := 'CAP.FED.';
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
