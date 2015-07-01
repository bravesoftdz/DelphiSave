unit unRptTrasladosPlataforma;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, SDEngine, unVisualizador, unComunes, unrptComunes;

type
  TrptTrasladosPlataforma = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    qriLogo: TQRImage;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    sdqTraslados: TSDQuery;
    dsTraslados: TDataSource;
    DetailBand1: TQRBand;
    QRShape13: TQRShape;
    QRShape16: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlNombrePasaj: TQRLabel;
    qrlDNIPasaj: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape9: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRLabel14: TQRLabel;
    qrlSolicita: TQRLabel;
    qrlFechaAprob: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape14: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel15: TQRLabel;
    qrdbNombreAcomp: TQRDBText;
    qrdbDNIAcomp: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrlTramo2Desde: TQRLabel;
    qrlTramo2Hasta: TQRLabel;
    qrlSiniestro: TQRLabel;
    qrlAnulado: TQRLabel;
    qrlTelPasaj: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    qrlDomicilio: TQRLabel;
    QRLabel18: TQRLabel;
    qrlFNac: TQRLabel;
    QRLabel19: TQRLabel;
    qrlEmpresa: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);

  private
    FDni: string;
  public
    constructor Create(AOwner: TComponent); override;
    function Imprimir(idautorizacion: integer): TResultados;
    property Dni      : String  read FDni      write FDni;
  end;

var
  rptTrasladosPlataforma: TrptTrasladosPlataforma;

implementation

uses
  unDmPrincipal, AnsiSql, SinEdit, unsesion, strfuncs;

{$R *.DFM}

{-------------------------------------------------------------------------------}
constructor TrptTrasladosPlataforma.Create(AOwner: TComponent);
begin
  inherited;
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_ART');
end;
{-------------------------------------------------------------------------------}
function TrptTrasladosPlataforma.Imprimir(idautorizacion: integer): TResultados;
var MailPlataf :String; Anulada: boolean;
begin

  sdqTraslados.ParamByName('idautorizacion').AsInteger := idautorizacion;
  OpenQuery(sdqTraslados);

  if (sdqTraslados.FieldByName('AU_ESTADO').AsString = 'U') or (sdqTraslados.FieldByName('AU_ESTADO').AsString = 'N') or
     (sdqTraslados.FieldByName('AU_ESTADO').AsString = 'V') then
    Anulada := true
  else
    Anulada := false;

  If Anulada then
  begin
    qrlAnulado.Caption     := 'AUTORIZACIÓN ANULADA';
    qrlAnulado.Font.Color  := clRed;
    qrlAnulado.enabled := true;
  end;

  qrlDNIPasaj.Caption     := sdqTraslados.FieldByName('tj_documento').AsString;
  qrlNombrePasaj.Caption  := sdqTraslados.FieldByName('tj_nombre').AsString;
  qrlTelPasaj.Caption     := sdqTraslados.FieldByName('Telefono').AsString;
  qrlSiniestro.Caption    := sdqTraslados.FieldByName('siniestrocomp').AsString;
  qrlFNac.Caption         := sdqTraslados.FieldByName('tj_fnacimiento').AsString;
  qrlEmpresa.Caption      := InitCap(sdqTraslados.fieldbyname('em_nombre').AsString);
  qrlDomicilio.Caption    := sdqTraslados.FieldByName('domicilio').AsString;

  with GetQueryEx('SELECT ca_direlectronica, ca_descripcion ' +
                   ' FROM cpr_prestador, sau_autorizaciones ' +
                  ' WHERE ca_identificador = nvl(au_identifapro, au_identifprestador) ' +
                    ' AND au_id = :idauto', [idautorizacion]) do
  begin
    MailPlataf := fieldbyname('ca_direlectronica').asstring;
    ReportTitle := 'Traslados ' + fieldbyname('ca_descripcion').asstring;  
  end;

  if (sdqTraslados.FieldByName('au_fechapro').AsDateTime > 0) then
    qrlFechaAprob.Caption := sdqTraslados.FieldByName('au_fechapro').AsString
  else
    qrlFechaAprob.Caption := '';

  if Is_SiniestroDeGobernacion(sdqTraslados.FieldByName('ex_id').AsInteger) then
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

  if sdqTraslados.FieldByName('AU_USUAPRO').AsString = '' then
    qrlSolicita.Caption := Sesion.Usuario
  else
    qrlSolicita.Caption := ValorSqlEX('SELECT se_nombre FROM use_usuarios WHERE se_usuario = :usuario ', [sdqTraslados.FieldByName('AU_USUAPRO').AsString]);

  Result := Visualizar(Self, GetValores(' - Siniestro: ' + sdqTraslados.FieldByName('siniestrocomp').AsString + ' - ' + sdqTraslados.FieldByName('tj_nombre').AsString + ' - DNI ' + sdqTraslados.FieldByName('tj_documento').AsString, MailPlataf),
                      [oAlwaysShowDialog, oForceDB, oForceShowModal]);   // Lu agregue el nombre del trabajador TK 1106

  DoActualizarImpresionAutorizacion(sdqTraslados.fieldbyname('au_id').AsInteger, Result);
  //Application.ProcessMessages;
end;
{-------------------------------------------------------------------------------}
procedure TrptTrasladosPlataforma.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if sdqTraslados.FieldByName('TR_FECHARETORNO').IsNull then
  begin
    qrlTramo2Desde.Caption := '';
    qrlTramo2Hasta.Caption := '';
  end
  else begin
    qrlTramo2Desde.Caption := sdqTraslados.FieldByName('AU_HLOCALIDAD').AsString;
    qrlTramo2Hasta.Caption := sdqTraslados.FieldByName('AU_DLOCALIDAD').AsString;
  end;
end;

{-------------------------------------------------------------------------------}
end.
