unit unRptMoldeReporteRTF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unRptMoldeCarta, Db, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unVisualizador;

type
  TqrMoldeReporteRTF = class(TqrMoldeCarta)
    sdqHeader: TSDQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlCodigo: TQRLabel;
    qrlPrestador: TQRLabel;
    qrmDomicilio: TQRMemo;
    qrmReferente: TQRMemo;
    qrbDetalle: TQRBand;
    qrmDetalle: TQRMemo;
    QRLabel30: TQRLabel;
    qrlGTrabajo: TQRLabel;
    qrlDelegacion: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape5: TQRShape;
    qrlAnulado: TQRLabel;
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    FGtrabajo, FDelegacion :String;
    function  GetCodigo: string;
    procedure SetCodigo(const Value: string);
    function  GetArea: string;
    procedure SetArea(const Value: string);
    function GetPrestador: string;
    procedure SetPrestador(const Value: string);
    function GetDomicilio: string;
    procedure SetDomicilio(const Value: string);
    function GetReferente: string;
    procedure SetReferente(const Value: string);
    function GetMuestraSaludo: boolean;
    procedure SetMuestraSaludo(const Value: boolean);
    procedure SetGTrabajo(const Value: string);
    procedure SetDelegacion(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
    property  Codigo:    string read GetCodigo    write SetCodigo;
    property  Area:      string read GetArea      write SetArea;
    property  Prestador: string read GetPrestador write SetPrestador;
    property  Domicilio: string read GetDomicilio write SetDomicilio;
    property  Referente: string read GetReferente write SetReferente;
    property  GTrabajo:  string read FGTrabajo    write SetGTrabajo;
    property  Delegacion:string read FDelegacion  write SetDelegacion;
    function  Ejecutar(Opciones: TOpcionesVisualizador = [];
                       Sector: String = ''; Clave: String = ''; TipoDoc: String = '';
                       TipoDest: String = ''; Telefono: String = ''; RazonSocial: String = '';
                       IdDest: Integer = 0; iSiniestro: Integer = 0; esAnulacion: boolean = false; iIdExpediente: Integer = 0): TResultados; virtual;

    property  MuestraSaludo: boolean read GetMuestraSaludo write SetMuestraSaludo;
  end;

var
  qrMoldeReporteRTF: TqrMoldeReporteRTF;
  Siniestro, IdExpediente: integer;

implementation

uses
  unDmPrincipal, Internet, unSesion, unComunes, Math;

{$R *.DFM}

constructor TqrMoldeReporteRTF.Create(AOwner: TComponent);
begin
  inherited;
  //Valores por Default
  Codigo        := 'AUR';
  Area          := 'AMED';
  MuestraSaludo := False;
  Siniestro     := 0;
end;

function TqrMoldeReporteRTF.Ejecutar(Opciones: TOpcionesVisualizador = [];
                                     Sector: String = ''; Clave: String = ''; TipoDoc: String = '';
                                     TipoDest: String = ''; Telefono: String = ''; RazonSocial: String = '';
                                     IdDest: Integer = 0; iSiniestro: Integer = 0; esAnulacion: boolean = false; iIdExpediente: Integer = 0): TResultados;
begin
  OpenQuery(sdqHeader);
  OpenQuery(sdqDatos);

  ShowLogoGBP  := False;
  ShowLogoART  := True;
  ShowDatosART := False;
  Opciones := Opciones + [oAlwaysShowDialog, oForceDB];
  Siniestro := iSiniestro;
  IdExpediente := iIdExpediente;
  If esAnulacion then
  begin
    qrlAnulado.Caption     := 'AUTORIZACIÓN ANULADA';
    qrlAnulado.Font.Color  := clRed;
    qrlAnulado.enabled := true;
  end;
  try
    Result := Visualizar(Self, GetValores('', EMail),
                         GetValoresFax(Sector, Clave, TipoDoc, TipoDest, Telefono, RazonSocial, IdDest),
                         Opciones);

  finally
    if Screen.ActiveForm.FormStyle <> fsMDIChild then
    begin
      sdqHeader.Close;
      sdqDatos.Close;
    end;
  end;
end;

{procedure TqrMoldeReporteRTF.ActualizarTabla;
var ssql: string;
begin
    sSql :=
      'UPDATE sau_autorizaciones' +
        ' SET AU_FECHAENVIOANUL = sysdate, AU_USUENVIOANUL = :usuario ' +
      ' WHERE au_siniestro = ' + SqlValue(iSiniestro) +
        ' AND au_orden = ' + SqlValue(iOrden) +
        ' AND au_recaida = ' + SqlValue(iRecaida) +
        ' AND au_numauto = ' + SqlValue(iNumeroAutorizacion);
    EjecutarSqlEX(sSql, [Sesion.UserID]);
end;}

function TqrMoldeReporteRTF.GetArea: string;
begin
  Result := sdqHeader.ParamByName('Area').AsString;
end;

function TqrMoldeReporteRTF.GetCodigo: string;
begin
  Result := qrlCodigo.Caption;
end;

function TqrMoldeReporteRTF.GetDomicilio: string;
begin
  Result := qrmDomicilio.Lines.Text;
end;

function TqrMoldeReporteRTF.GetMuestraSaludo: boolean;
begin
  Result := qrlSaludoFinal.Enabled;
end;

function TqrMoldeReporteRTF.GetPrestador: string;
begin
  Result := qrlPrestador.Caption;
end;

function TqrMoldeReporteRTF.GetReferente: string;
begin
  Result := qrmReferente.Lines.Text;
end;

procedure TqrMoldeReporteRTF.qrbPageHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  // Logo de la gobernacion o de ART
  if Is_SiniestroDeGobernacion(IdExpediente) then
    qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
end;

procedure TqrMoldeReporteRTF.SetArea(const Value: string);
begin
  sdqHeader.ParamByName('Area').AsString := Value;
end;

procedure TqrMoldeReporteRTF.SetCodigo(const Value: string);
begin
  qrlCodigo.Caption := Value;
end;

procedure TqrMoldeReporteRTF.SetDomicilio(const Value: string);
begin
  qrmDomicilio.Lines.Text := Value;
end;

procedure TqrMoldeReporteRTF.SetMuestraSaludo(const Value: boolean);
begin
  qrlSaludoFinal.Enabled := Value;
end;

procedure TqrMoldeReporteRTF.SetPrestador(const Value: string);
begin
  qrlPrestador.Caption := Value;
end;

procedure TqrMoldeReporteRTF.SetReferente(const Value: string);
begin
  qrmReferente.Lines.Text := Value;
end;

procedure TqrMoldeReporteRTF.SetGTrabajo(const Value: string);
begin
  qrlGTrabajo.Caption := Value;
end;

procedure TqrMoldeReporteRTF.SetDelegacion(const Value: string);
begin
  qrlDelegacion.Caption := Value;
end;

end.
