unit unRptCartaDocHeader;

interface

uses
  {$IFNDEF VER130}RTLConsts, {$ENDIF}
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, SDEngine,
  unArt, ArtQReports, unCustomDataModule, RxGIF, QrAngLbl,
  ImagingComponents, qrpctrls;

const
  CORRE_ARGENTINO   = '01';
  CORRE_BONAERENSE  = '02';
  CORRE_ANDREANI    = '03';
  CORRE_FULLEXPRESS = '04';
  CORRE_ROWING      = '05';
  CORRE_SEPRIT      = '06';
  CORRE_VENTANILLA  = '10';
  CORRE_LAPOSTAL    = '07';

  SALIDA_CARTADOCUMENTO        = 'C';
  SALIDA_CARTACOMERCIAL        = 'CC';
  SALIDA_TELEGRAMA             = 'T';
  SALIDA_VENTANILLAELECTRONICA = 'VE';

  REMPROVINCIACORREO    = 'BUENOS AIRES';
  REMLOCALIDADCORREO    = 'MONTE GRANDE';
  REMCPOSTALCORREO      = 'B1842ZAC';
  REMDOMICILIOCORREO    = 'Devolver a CTP BUE Sector Carta Documento (%s)';

  CAD_PRESTDIN          = 'Prestaciones Dinerarias';
  CAD_INCAPACIDADES     = 'Incapacidades';

  AREACARTA_PRESDIN     = '80';
  AREACARTA_INCAP       = '35';

type
  TTipoModulo       = (taAfiliaciones, taAreaMedica, taAreaMedlab, taCobranzas, taDinerarias, taEmision, taIncapacidades,
                       taLegales, taNone, taRecalificacion, taSiniestros);
  TTipoDestinatario = (tdAmbos, tdArt, tdComisionMedica, tdEmpresa, tdOtros, tdTrabajador);
  TCorreo           = (tcAndreani, tcArgentino, tcBonaerense, tcFullExpress, tcNone, tcOCA, tcRowing, tcSeprit, tcVentanilla);
  TTipoEmpresa      = (teDeudora, teEndoso, teFormulario);
  TTipoSalida       = (tsCartaComercial, tsCartaDocumento, tsTelegrama, tsVentanillaElectronica);

  TDomicilio = record
    Calle: String;
    CPostal: String;
    CPostalA: String;
    Departamento: String;
    Localidad: String;
    Numero: String;
    Piso: String;
    Provincia: String;
  end;

  TrptCartaDocHeader = class(TQuickRep)
    qrbPageHeader: TQRBand;
    qrbSummary: TQRBand;
    qrlRemNombre: TArtQRLabel;
    qrlRemDomicilio: TArtQRLabel;
    qrlRemCPostal: TArtQRLabel;
    qrlRemLocalidad: TArtQRLabel;
    qrlRemProvincia: TArtQRLabel;
    qrlDestProvincia: TArtQRLabel;
    qrlDestLocalidad: TArtQRLabel;
    qrlDestCPostal: TArtQRLabel;
    qrlDestDomicilio: TArtQRLabel;
    qrlDestNombre: TArtQRLabel;
    qrlRemProvincia1: TArtQRLabel;
    qrlRemLocalidad1: TArtQRLabel;
    qrlRemCPostal1: TArtQRLabel;
    qrlRemDomicilio1: TArtQRLabel;
    qrlRemNombre1: TArtQRLabel;
    qrlDestNombre1: TArtQRLabel;
    qrlDestDomicilio1: TArtQRLabel;
    qrlDestCPostal1: TArtQRLabel;
    qrlDestLocalidad1: TArtQRLabel;
    qrlDestProvincia1: TArtQRLabel;
    qrlNumero: TArtQRLabel;
    qrlNumero1: TArtQRLabel;
    qrlBarras2: TArtQRLabel;
    qrlBarras1: TArtQRLabel;
    qrlContrato: TQRLabel;
    qrbPageFooter: TQRBand;
    qrlFirmante: TArtQRLabel;
    qrlDocumento: TArtQRLabel;
    qrlCaracter: TArtQRLabel;
    qrlSector: TQRLabel;
    QRAngledLabel1: TQRAngledLabel;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledLabel4: TQRAngledLabel;
    QRAngledLabel5: TQRAngledLabel;
    QRAngledLabel6: TQRAngledLabel;
    QRAngledLabel7: TQRAngledLabel;
    QRAngledLabel8: TQRAngledLabel;
    QRAngledLabel9: TQRAngledLabel;
    QRAngledLabel10: TQRAngledLabel;
    QRAngledLabel11: TQRAngledLabel;
    QRImage1: TQRImage;
    QRAngledLabel12: TQRAngledLabel;
    QRImage2: TQRImage;
    qrlDestDomicilio_Abajo: TArtQRLabel;
    qrlDestNombre_Abajo: TArtQRLabel;
    qrlDestNombre1_Abajo: TArtQRLabel;
    qrlDestDomicilio1_Abajo: TArtQRLabel;
    qrbPageHeader2: TQRChildBand;
    qrLogo: TQRImage;
    qriFirma: TQRImage;
    qrlRegistroCodFirma: TQRLabel;
    qrlDelegacion: TQRLabel;
    qrlOrden: TQRLabel;
    qrlOrdenPie: TQRLabel;
    qrlLeyendaAcuse: TQRLabel;
    qrmInfoPie: TQRRichText;
    qrlDelegacionPie: TQRLabel;
    QRPSFranqueo1A: TQRPShape;
    QRLFranqueo5A: TQRLabel;
    QRPSFranqueo3A: TQRPShape;
    QRLFranqueo4A: TQRLabel;
    QRPSFranqueo2A: TQRPShape;
    QRPSFranqueo1B: TQRPShape;
    QRLFranqueo5B: TQRLabel;
    QRPSFranqueo3B: TQRPShape;
    QRLFranqueo4B: TQRLabel;
    QRPSFranqueo2B: TQRPShape;
    QRALFranqueo6A: TQRAngledLabel;
    QRALFranqueo6B: TQRAngledLabel;
    procedure qrlBarrasPrint(Sender: TObject; var Value: String);
    procedure qrbPageHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrbPageFooterBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrlDestDomicilioPrint(Sender: TObject; var Value: String);
    procedure qrlDestNombrePrint(Sender: TObject; var Value: String);
    procedure qrlDestDomicilio1Print(Sender: TObject; var Value: String);
    procedure qrlDestNombre1Print(Sender: TObject; var Value: String);
    procedure qrbPageHeader2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrbSummaryAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);
  private
    FCorreo: TCorreo;
    FDestinatarioId: TTableID;
    FDestinatarioTipo: TTipoDestinatario;
    FEsDomicilioPostal: Boolean;
    FEsSinGobernacion: Boolean;
    FForzarFirmantePie: Boolean;
    FImprimirCodFirma: Boolean;
    FImprimirDelegOrden: Boolean;
    FImprimirDNI: Boolean;
    FImprimirFirma: Boolean;
    FImprimirFirmaSoloAlFinal: Boolean;
    FImprimirLeyendaAcuse: Boolean;
    FImprimirSoloOrden: Boolean;
    FNumImpresion: Integer;
    FMostrarLogo: Boolean;
    FRemitenteCorreo: Boolean;
    FRemitenteId: TTableId;
    FSummaryImpreso: Boolean;
    FTextoDestinatario: String;
    FTipoModulo: TTipoModulo;
    FTipoSalida: TTipoSalida;
    FTransactionMode: TTransactionMode;
    FCodigoRemitente: String;
    FImprimirFirmanteOrig: Boolean;
    FVentanilla: Boolean;
    FEsPuestaDisposicion: Boolean;

    function Get_DatosRemitenteDelegacion(Id: TTableId; var Domicilio, Localidad, CPostal, Provincia: String): Boolean;
    function Is_RemitenteEspecialCorreoArgentino: Boolean;

    procedure ArrangeControls_DatosFirmanteCartaComercial;
    procedure ArrangeControls_FirmaCartaComercial;
    procedure Do_CargarContrato(IdCarta: TTableID);
    procedure Do_CargarRegistro_CodFirma(IdCarta: TTableID; aImprimirCodFirma: Boolean; aIdFirma: TTableID);
    procedure SetIdCarta(const Value: TTableID);
    procedure SetIdFirma(const Value: TTableID);
    procedure SetImprimirFirma(const Value: Boolean);
    procedure SetImprimirLeyendaAcuse(const Value: Boolean);
    procedure SetMostrarLogo(const Value: Boolean);
    procedure SetRemitenteId(const Value: TTableId);
    procedure SetTextoDestinatario(const Value: String);
    procedure SetTipoModulo(const Value: TTipoModulo);
    procedure Do_MostrarFranqueoAPagar;
    function Is_MostrarFranqueoAPagar: Boolean;
  protected
    FIdCarta: TTableID;
    FIdFirma: TTableID;
    FTipoEmpresa: TTipoEmpresa;

    procedure AjusteLargo(Componente1, Componente2: TARTQrLabel; var aValue: String);
    procedure SetCorreo(const Value: TCorreo);
    procedure SetDestinatario(IdEndoso, IdFormulario, IdDeudora, IdTrabajador, IdArt, IdOtros, IdComisionMedica: TTableId;
                              sTextoDestinatario: String = '');
    procedure SetDestinatarioId(const Value: TTableID);
    procedure SetFirmaVisible(AVisible: Boolean);
    procedure SetImprimirDelegOrden(aImprimir: Boolean);
    procedure SetTipoDestinatario(const Value: TTipoDestinatario);
    procedure SetRemitenteActual;
  protected { Métodos para sobreescribir }
    FDomicilio: TDomicilio;
    FFirmaPos: TPoint;

    procedure SetInfoPie(CodTextoCartaInfoPie: String); virtual;
    procedure ArrangeControls; virtual;
    procedure ArrangeControls_Andreani; virtual;
    procedure ArrangeControls_Argentino; virtual;
    procedure ArrangeControls_Bonaerense; virtual;
    procedure ArrangeControls_FullExpress; virtual;
    procedure ArrangeControls_Oca; virtual;
    procedure ArrangeControls_Rowing; virtual;
    procedure ArrangeControlsFranqueoAPagar_Argentino; virtual;
    procedure CopyControlsFranqueoAPagar(DesplazamientoVert, DesplazamientoHoriz: Integer); virtual;

    procedure AjustarLabel(aLabel: TArtQRLabel; const aFontSize, aHeight, aTop: Integer);
    procedure ClearFirma; virtual;
    procedure DoActualizarDatosImpresionCartaDocumento(aIdCarta: TTableId);
    procedure LoadFirma; virtual;
    procedure LoadValues; virtual;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Clear; virtual;
    procedure Clear_Destinatario;
    procedure Clear_Remitente;
    procedure LoadDestinatario; virtual;
    procedure LoadRemitente; virtual;
    procedure ReplicarDestinatario;
    procedure ReplicarRemitente;
    procedure ReplicarTodo;
    procedure SaveToFile(AFileName: TFileName);
  published
    property CodigoRemitente         : String            read FCodigoRemitente           write FCodigoRemitente;
    property Correo                  : TCorreo           read FCorreo                    write SetCorreo                 default tcArgentino;
    property DestinatarioId          : TTableId          read FDestinatarioId            write SetDestinatarioId         default ART_EMPTY_ID;
    property DestinatarioTipo        : TTipoDestinatario read FDestinatarioTipo          write SetTipoDestinatario       default tdEmpresa;
    property EsDomicilioPostal       : Boolean           read FEsDomicilioPostal         write FEsDomicilioPostal        default False;
    property EsSinGobernacion        : Boolean           read FEsSinGobernacion          write FEsSinGobernacion         default False;
    property ForzarFirmantePie       : Boolean           read FForzarFirmantePie         write FForzarFirmantePie        default False;
    property IdCarta                 : TTableID          read FIdCarta                   write SetIdCarta                default ART_EMPTY_ID;
    property IdFirma                 : TTableID          read FIdFirma                   write SetIdFirma                default ART_EMPTY_ID;
    property ImprimirCodFirma        : Boolean           read FImprimirCodFirma          write FImprimirCodFirma         default False;
    property ImprimirDelegOrden      : Boolean           read FImprimirDelegOrden        write SetImprimirDelegOrden     default False;
    property ImprimirDNI             : Boolean           read FImprimirDNI               write FImprimirDNI              default True;
    property ImprimirFirma           : Boolean           read FImprimirFirma             write SetImprimirFirma          default True;
    property ImprimirFirmaSoloAlFinal: Boolean           read FImprimirFirmaSoloAlFinal  write FImprimirFirmaSoloAlFinal default False;
    property ImprimirLeyendaAcuse    : Boolean           read FImprimirLeyendaAcuse      write SetImprimirLeyendaAcuse   default False;
    property ImprimirSoloOrden       : Boolean           read FImprimirSoloOrden         write FImprimirSoloOrden        default False;
    property Modulo                  : TTipoModulo       read FTipoModulo                write SetTipoModulo             default taAfiliaciones;
    property MostrarLogo             : Boolean           read FMostrarLogo               write SetMostrarLogo            default False;
    property RemitenteCorreo         : Boolean           read FRemitenteCorreo           write FRemitenteCorreo          default False;
    property RemitenteId             : TTableId          read FRemitenteId               write SetRemitenteId            default ART_EMPTY_ID;
    property TextoDestinatario       : String            read FTextoDestinatario         write SetTextoDestinatario;
    property TipoSalida              : TTipoSalida       read FTipoSalida                write FTipoSalida               default tsCartaDocumento;
    property TransactionMode         : TTransactionMode  read FTransactionMode           write FTransactionMode          default tmNone;
    property ImprimirFirmanteOrig    : Boolean           read FImprimirFirmanteOrig      write FImprimirFirmanteOrig     default False;
    property Ventanilla              : Boolean           read FVentanilla                write FVentanilla               default False;
    property EsPuestaDisposicion     : Boolean           read FEsPuestaDisposicion       write FEsPuestaDisposicion      default False;
  end;

function GetNroCartaDocCompleto(iNroCartaDoc: Integer; Modulo: TTipoModulo): String;
function GetNroCartaDocReducido(Modulo: TTipoModulo): Integer;
function GetSecuenciaCartaDoc(Modulo: TTipoModulo): String;
function GetTipoModulo(Modulo: String): TTipoModulo;
function StrToCorreo(const Value: String): TCorreo;
function StrToTipoDestinatario(const Value: String): TTipoDestinatario;
function StrToTipoSalida(const Value: String): TTipoSalida;
function TipoDestinatarioToName(ATipo: TTipoDestinatario; ATipoEmpresa: TTipoEmpresa = teEndoso): String;

procedure DoActualizarEndosoReimpresion(IdCarta: TTableId; TransactionMode: TTransactionMode = tmNone);

implementation

uses
  unDmPrincipal, AnsiSql, Consts, SqlFuncs, strFuncs, unExportPDF, QRPrntr, unSesion, General, unComunes;

resourcestring
  SErrInvalidTipoCorreo = 'El tipo de correo ''%s'' no es un tipo válido';
  SErrDestinatarioLoad  = 'Error al cargar el destinatario.' + #13#10 +
                          'Es posible que no exista un/a %s con el código %d o que el domicilio esté incompleto';

{$R *.DFM}

function GetNroCartaDocReducido(Modulo: TTipoModulo): Integer;
var
  NroCartaDoc: String;
  sSecuencia: String;
begin
  sSecuencia := GetSecuenciaCartaDoc(Modulo);
  NroCartaDoc := ValorSql('SELECT ' + sSecuencia + '.NEXTVAL FROM DUAL') ;  // lo tuve que hacer así sino hay problemas con la secuencia de cobranzas que es un nro. muy grande

  if Modulo = taCobranzas then
    NroCartaDoc := StrMid(NroCartaDoc, 7);   // la secuencia de cobranzas ya viene con el 377904 ...

  Result := StrToInt(NroCartaDoc);
end;

function GetTipoModulo(Modulo: String): TTipoModulo;
var
  TipoModulo: TTipoModulo;
begin
  if Modulo = AREA_AFI then
    TipoModulo := taAfiliaciones
  else if Modulo = AREA_COB then
    TipoModulo := taCobranzas
  else if Modulo = AREA_DIN then
    TipoModulo := taDinerarias
  else if Modulo = AREA_EMI then
    TipoModulo := taEmision
  else if Modulo = AREA_INC then
    TipoModulo := taIncapacidades
  else if Modulo = AREA_LEG then
    TipoModulo := taLegales
  else if (Modulo = AREA_MED) or (Modulo = AREA_RECA) then
    TipoModulo := taAreaMedica
  else if Modulo = AREA_MLB then
    TipoModulo := taAreaMedlab
  else if Modulo = AREA_SIN then
    TipoModulo := taSiniestros
  else
    TipoModulo := taNone;

  Result := TipoModulo;
end;

function GetNroCartaDocCompleto(iNroCartaDoc: Integer; Modulo: TTipoModulo): String;
var
  sPrefijo: String;
begin
  case Modulo of
    taAfiliaciones:   sPrefijo := AREA_AFI;
    taAreaMedica:     sPrefijo := AREA_MED;
    taAreaMedlab:     sPrefijo := AREA_MLB;
    taCobranzas:      sPrefijo := AREA_COB;
    taDinerarias:     sPrefijo := AREA_DIN;
    taEmision:        sPrefijo := AREA_EMI;
    taIncapacidades:  sPrefijo := AREA_INC;
    taLegales:        sPrefijo := AREA_LEG;
    taRecalificacion: sPrefijo := AREA_RECA;
    taSiniestros:     sPrefijo := AREA_SIN;
  end;

  if Modulo = taCobranzas  then
    Result := cPrefijoNroCartaDocART + sPrefijo + Trim(IntToStr(iNroCartaDoc))      // esto queda asi porque la secuencia de cobranzas ya pone los 0 que correspondan
  else
    Result := cPrefijoNroCartaDocART + sPrefijo + Lpad(iNroCartaDoc, '0', 7);
end;

function GetSecuenciaCartaDoc(Modulo: TTipoModulo): String;
var
  sSecuencia: String;
begin
  case Modulo of
    taAfiliaciones:   sSecuencia := 'NROCARTADOC_AFILIACIONES';
    taAreaMedica:     sSecuencia := 'NROCARTADOC_MEDICA';
    taAreaMedlab:     sSecuencia := 'NROCARTADOC_MEDLABORAL';
    taCobranzas:      sSecuencia := 'SEQ_CARTASDOC';
    taDinerarias:     sSecuencia := 'NROCARTADOC_DINERARIAS';
    taEmision:        sSecuencia := 'NROCARTADOC_EMISION';
    taIncapacidades:  sSecuencia := 'NROCARTADOC_INCAPACIDADES';
    taLegales:        sSecuencia := 'NROCARTADOC_LEGAL';
    taRecalificacion: sSecuencia := 'NROCARTADOC_MEDICA';
    taSiniestros:     sSecuencia := 'NROCARTADOC_LEGALES';  // originalmente area legales
  end;
  Result := sSecuencia;
end;

{ Actualiza los datos de la carta documento que fue impresa (NKW) }
procedure TrptCartaDocHeader.DoActualizarDatosImpresionCartaDocumento(aIdCarta: TTableId);
begin
  with TSql.Create('CCA_CARTA') do
  try
    PrimaryKey.Add('CA_ID',                     aIdCarta);
    Fields.AddExpression('CA_USUIMPRESION',     'NVL(CA_USUIMPRESION, ' + SqlValue(Sesion.UserID) + ')');
    Fields.AddExpression('CA_FECHAIMPRESION',   'NVL(CA_FECHAIMPRESION, SYSDATE)');
    Fields.AddExpression('CA_USUREIMPRESION',   'DECODE(CA_USUIMPRESION, NULL, NULL, ' + SqlValue(Sesion.UserID) + ')');
    Fields.AddExpression('CA_FECHAREIMPRESION', 'DECODE(CA_USUIMPRESION, NULL, NULL, SYSDATE)');

    Fields.Add('CA_CALLE',        Copy(FDomicilio.Calle, 1, 60));
    Fields.Add('CA_CPOSTAL',      Copy(FDomicilio.CPostal, 1, 5));
    Fields.Add('CA_CPOSTALA',     Copy(FDomicilio.CPostalA, 1, 8));
    Fields.Add('CA_DEPARTAMENTO', Copy(FDomicilio.Departamento, 1, 20));
    Fields.Add('CA_LOCALIDAD',    Copy(FDomicilio.Localidad, 1, 60));
    Fields.Add('CA_NUMERO',       Copy(FDomicilio.Numero, 1, 20));
    Fields.Add('CA_PISO',         Copy(FDomicilio.Piso, 1, 20));
    Fields.Add('CA_PROVINCIA',    Copy(FDomicilio.Provincia, 1, 2));
    SqlType := stUpdate;

    EjecutarSqlSt(Sql, TransactionMode);
  finally
    Free;
  end;
end;

function StrToCorreo(const Value: String): TCorreo;
begin
  if Value = CORRE_ARGENTINO then
    Result := tcArgentino

  else if Value = CORRE_BONAERENSE then
    Result := tcBonaerense

  else if Value = CORRE_ANDREANI then
    Result := tcAndreani

  else if Value = CORRE_FULLEXPRESS then
    Result := tcFullExpress

  else if Value = CORRE_ROWING Then
    Result := tcRowing

  else if Value = CORRE_SEPRIT Then
    Result := tcSeprit

  else if Value = CORRE_VENTANILLA Then
    Result := tcVentanilla

  else if Value = CORRE_LAPOSTAL then
    Result := tcSeprit

  // 28.4.8 - Si es vacío dejo el correo argentino por defecto porque a partir de este momento se permiten guardar
  //          cartas sin correo asociado..    
  else if Value = '' then
    Result := tcArgentino

  else
    raise Exception.CreateFmt(SErrInvalidTipoCorreo, [Value]);
end;

function StrToTipoDestinatario(const Value: String): TTipoDestinatario;
begin
  if Value = DESTI_EMPRESA then
    Result := tdEmpresa

  else if Value = DESTI_TRABAJADOR then
    Result := tdTrabajador

  else if Value = DESTI_ART then
    Result := tdArt

  else if Value = DESTI_OTROS then
    Result := tdOtros

  else if Value = DESTI_COMISMEDICA then
    Result := tdComisionMedica

  else
    raise Exception.Create('El tipo de destinatario "' + Value + '" no es un tipo válido');
end;

function StrToTipoSalida(const Value: String): TTipoSalida;
begin
  if Value = SALIDA_CARTADOCUMENTO then
    Result := tsCartaDocumento

  else if Value = SALIDA_CARTACOMERCIAL then
    Result := tsCartaComercial

  else if Value = SALIDA_TELEGRAMA then
    Result := tsTelegrama

  else if Value = SALIDA_VENTANILLAELECTRONICA then
    Result := tsVentanillaElectronica

  else
    raise Exception.Create('El tipo de salida "' + Value + '" no es un tipo válido');
end;

function TipoDestinatarioToName(ATipo: TTipoDestinatario; ATipoEmpresa: TTipoEmpresa = teEndoso): String;
begin
  case ATipo of
    tdEmpresa:
      if ATipoEmpresa = teEndoso then
        Result := 'Endoso'
      else if ATipoEmpresa = teDeudora then
        Result := 'Deudora'
      else
        Result := 'Formulario';
    tdTrabajador:
      Result := 'Trabajador';
    tdArt:
      Result := 'ART';
    tdOtros:
      Result := 'Otros';
    tdComisionMedica:
      Result := 'ComisionMedica';
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
{ TrptCartaDocHeader }
{----------------------------------------------------------------------------------------------------------------------}
constructor TrptCartaDocHeader.Create(AOwner: TComponent);
begin
  inherited;

  EsSinGobernacion      := False;
  FCorreo               := tcNone;
  FDestinatarioId       := ART_EMPTY_ID;
  FDestinatarioTipo     := tdEmpresa;
  FForzarFirmantePie    := False;
  FIdCarta              := ART_EMPTY_ID;
  FIdFirma              := ART_EMPTY_ID;
  FImprimirCodFirma     := False;
  FImprimirLeyendaAcuse := False;
  FImprimirSoloOrden    := False;
  FMostrarLogo          := False;
  FNumImpresion         := 0;
  FRemitenteCorreo      := False;
  FRemitenteId          := ART_EMPTY_ID;
  FSummaryImpreso       := False;
  FTextoDestinatario    := '';
  FTipoSalida           := tsCartaDocumento;
  ImprimirDelegOrden    := False;
  ImprimirDNI           := True;
  ImprimirFirma         := True;

  ArrangeControls;
  SetFirmaVisible(False);
end;

procedure TrptCartaDocHeader.SetTipoDestinatario(const Value: TTipoDestinatario);
begin
  if FDestinatarioTipo <> Value then
  begin
    FDestinatarioTipo := Value;
    Clear_Destinatario;
  end;
end;

procedure TrptCartaDocHeader.ReplicarDestinatario;
begin
  qrlDestProvincia1.Caption := qrlDestProvincia.Caption;

  qrlDestLocalidad1.Caption := qrlDestLocalidad.Caption;
  AjustarLabel(qrlDestLocalidad1, 6, 22, 0);

  qrlDestCPostal1.Caption   := qrlDestCPostal.Caption;
  qrlDestDomicilio1.Caption := qrlDestDomicilio.Caption;
  qrlDestNombre1.Caption    := qrlDestNombre.Caption;

  qrlDestDomicilio1_Abajo.Caption := qrlDestDomicilio.Caption;
  qrlDestNombre1_Abajo.Caption    := qrlDestNombre.Caption;
end;

procedure TrptCartaDocHeader.ReplicarRemitente;
var
  CPostal: String;
  Domicilio: String;
  Localidad: String;
  Provincia: String;
begin
  if Is_RemitenteEspecialCorreoArgentino then
  begin
    Get_DatosRemitenteDelegacion(FRemitenteId, Domicilio, Localidad, CPostal, Provincia);
    qrlRemProvincia1.Caption := Provincia;
    qrlRemLocalidad1.Caption := Localidad;
    qrlRemCPostal1.Caption   := CPostal;
    qrlRemDomicilio1.Caption := Domicilio;
  end
  else
  begin
    qrlRemProvincia1.Caption := qrlRemProvincia.Caption;
    qrlRemLocalidad1.Caption := qrlRemLocalidad.Caption;
    qrlRemCPostal1.Caption   := qrlRemCPostal.Caption;
    qrlRemDomicilio1.Caption := qrlRemDomicilio.Caption;
  end;

  qrlRemNombre1.Caption      := qrlRemNombre.Caption;
end;

procedure TrptCartaDocHeader.ReplicarTodo;
begin
  qrlNumero1.Caption := qrlNumero.Caption;
  ReplicarRemitente;
  ReplicarDestinatario;
end;

procedure TrptCartaDocHeader.Clear_Destinatario;
begin
  qrlDestProvincia.Caption := '';
  qrlDestLocalidad.Caption := '';
  qrlDestCPostal.Caption   := '';
  qrlDestDomicilio.Caption := '';
  qrlDestNombre.Caption    := '';

  qrlDestDomicilio_Abajo.Caption := '';
  qrlDestNombre_Abajo.Caption    := '';

  ReplicarDestinatario;
end;

procedure TrptCartaDocHeader.Clear_Remitente;
begin
  qrlRemProvincia.Caption := '';
  qrlRemLocalidad.Caption := '';
  qrlRemCPostal.Caption   := '';
  qrlRemDomicilio.Caption := '';
  qrlRemNombre.Caption    := '';
  ReplicarRemitente;
end;

procedure TrptCartaDocHeader.Clear;
begin
  qrlNumero.Caption  := '';
  qrlNumero1.Caption := '';
  Clear_Remitente;
  Clear_Destinatario;
end;

procedure TrptCartaDocHeader.qrlBarrasPrint(Sender: TObject; var Value: String);
begin
  Value := '*' + qrlNumero.Caption + '*';
end;

procedure TrptCartaDocHeader.LoadDestinatario;
var
  sdqConsulta: TSDQuery;
  Sql: String;
begin
  if FDestinatarioId = ART_EMPTY_ID then
    Clear_Destinatario
  else
  begin
    case FDestinatarioTipo of
      tdEmpresa:
        if FTipoEmpresa = teEndoso then
          Sql :=                                 // En Sql se agrega "utiles.get_textolimpio" en campo "Domicilio" por TK 22563
            'SELECT hd_calle calle, hd_cpostal codpostal,' +
                  ' NVL(iif_char(hd_cpostala, ''99999999'', NULL, hd_cpostala), hd_cpostal) cpostal,' +
                  ' hd_cpostala cpostala, hd_departamento departamento,' +
                  ' utiles.get_textolimpio(utiles.armar_domicilio(hd_calle, hd_numero, hd_piso, hd_departamento)) domicilio,' +
                  ' hd_provincia idprovincia, hd_localidad localidad, hm_nombre nombre, hd_numero numero,' +
                  ' hd_piso piso, pv_descripcion provincia' +
             ' FROM aen_endoso, ahm_historicoempresa, ahd_historicodomicilio, cpv_provincias' +
            ' WHERE hm_id = en_idhistoricoempresa' +
            IIF(EsDomicilioPostal,
              ' AND hd_id = en_idhistoricodomiciliopostal',
              ' AND hd_id = en_idhistoricodomicilio') +
              ' AND hd_provincia = pv_codigo(+)' +
              ' AND en_id = ' + SqlInt(FDestinatarioId)
        else if FTipoEmpresa = teDeudora then
          Sql :=
            'SELECT ed_calle calle, ed_cpostal codpostal,' +
                  ' NVL(iif_char(ed_cpostala, ''99999999'', NULL, ed_cpostala), ed_cpostal) cpostal,' +
                  ' ed_cpostala cpostala, ed_departamento departamento,' +
                  ' utiles.get_textolimpio(utiles.armar_domicilio(ed_calle, ed_numero, ed_piso, ed_departamento)) domicilio,' +
                  ' ed_provincia idprovincia, ed_localidad localidad, ed_nombre nombre, ed_numero numero,' +
                  ' ed_piso piso, pv_descripcion provincia' +
             ' FROM red_empdeudora, cpv_provincias' +
            ' WHERE ed_provincia = pv_codigo(+)' +
              ' AND ed_id = ' + SqlInt(FDestinatarioId)
        else
          Sql :=
            'SELECT sa_calle calle, sa_cpostal codpostal,' +
                  ' NVL(iif_char(sa_cpostala, ''99999999'', NULL, sa_cpostala), sa_cpostal) cpostal,' +
                  ' sa_cpostala cpostala, sa_departamento departamento,' +
                  ' utiles.get_textolimpio(utiles.armar_domicilio(sa_calle, sa_numero, sa_piso, sa_departamento)) domicilio,' +
                  ' sa_provincia idprovincia, sa_localidad localidad, sa_nombre nombre, sa_numero numero,' +
                  ' sa_piso piso, pv_descripcion provincia' +
             ' FROM asa_solicitudafiliacion, cpv_provincias' +
            ' WHERE sa_provincia = pv_codigo(+)' +
              ' AND sa_idformulario = ' + SqlInt(FDestinatarioId);
      tdTrabajador:
      begin
        if EsPuestaDisposicion then
          if ValorSqlEx('select dinerarias.get_cartatipoconcepto(:idcarta, ''M'', ''N'') from dual', [FIdCarta]) = 'S' then   //Tiene mortales
            Sql :=
              'SELECT pd_calle calle, pd_cpostal codpostal, NVL(iif_char(pd_codpostala, ''99999999'', NULL, pd_codpostala),' +
              '       pd_cpostal) cpostal, pd_codpostala cpostala, pd_departamento departamento,' +
              '       utiles.get_textolimpio(utiles.armar_domicilio(pd_calle, pd_numero, pd_piso, pd_departamento, Null, Null))' +
              '       domicilio, pd_provincia idprovincia, pd_localidad localidad, eb_nombre nombre, pd_numero numero, pd_piso' +
              '       piso, pv_descripcion provincia' +
              '  FROM art.seb_beneficiarios a, art.sbl_beneficiarioliquidacion, art.sle_liquiempsin,' +
              '       SIN.spd_puestadisposicion, cpv_provincias, SIN.scp_casospuestadisp' +
              ' WHERE eb_siniestro = bl_siniestro' +
              '   AND eb_orden = bl_orden' +
              '   AND eb_recaida = bl_recaida' +
              '   AND eb_codigo = bl_beneficiario' +
              '   AND le_siniestro = bl_siniestro' +
              '   AND le_orden = bl_orden' +
              '   AND le_recaida = bl_recaida' +
              '   AND le_numliqui = bl_numliq' +
              '   AND le_idexpediente = cp_idexpediente' +
              '   AND le_numliqui = cp_numliqui' +
              '   AND pd_idexpediente = le_idexpediente' +
              '   AND pd_fechabaja IS NULL' +
              '   AND pd_provincia = pv_codigo(+)' +
              '   AND cp_idcarta = ' + SqlInt(FIdCarta) +
              '   AND eb_codigo = (SELECT b.eb_codigo' +
              '                      FROM art.seb_beneficiarios b, art.sbl_beneficiarioliquidacion d' +
              '                     WHERE b.eb_siniestro = d.bl_siniestro' +
              '                       AND b.eb_orden = d.bl_orden' +
              '                       AND b.eb_recaida = d.bl_recaida' +
              '                       AND b.eb_codigo = d.bl_beneficiario' +
              '                       AND d.bl_siniestro = le_siniestro' +
              '                       AND d.bl_orden = le_orden' +
              '                       AND d.bl_recaida = le_recaida' +
              '                       AND d.bl_numliq = le_numliqui' +
              '                       AND ( (NVL(b.eb_benefprincipal, NVL(b.eb_replegal, ''N'')) = ''S'')' +
              '                                   OR (b.eb_fechanacimiento = (SELECT MIN(c.eb_fechanacimiento)' +
              '                                                                 FROM art.seb_beneficiarios c, art.sbl_beneficiarioliquidacion e' +
              '                                                                WHERE c.eb_siniestro = e.bl_siniestro' +
              '                                                                  AND c.eb_orden = e.bl_orden' +
              '                                                                  AND c.eb_recaida = e.bl_recaida' +
              '                                                                  AND c.eb_codigo = e.bl_beneficiario' +
              '                                                                  AND e.bl_siniestro = le_siniestro' +
              '                                                                  AND e.bl_orden = le_orden' +
              '                                                                  AND e.bl_recaida = le_recaida' +
              '                                                                  AND e.bl_numliq = le_numliqui))) ' +
              '                       AND ROWNUM = 1)'

          else
            Sql :=
            'SELECT pd_calle calle, pd_cpostal codpostal,' +
                  ' NVL(iif_char(pd_codpostala, ''99999999'', NULL, pd_codpostala), pd_cpostal) cpostal,' +
                  ' pd_codpostala cpostala, pd_departamento departamento,' +
                  ' utiles.get_textolimpio(utiles.armar_domicilio(pd_calle, pd_numero, pd_piso, pd_departamento, Null, Null)) domicilio,' +
                  ' pd_provincia idprovincia, pd_localidad localidad, tj_nombre nombre, pd_numero numero, pd_piso piso,' +
                  ' pv_descripcion provincia' +
             ' FROM cca_carta, cpv_provincias, sin.spd_puestadisposicion, ctj_trabajador ' +
            ' WHERE pd_provincia = pv_codigo(+)' +
              ' AND pd_idexpediente = ca_idexpediente ' +
              ' AND pd_fechabaja IS NULL ' +
              ' AND ca_idtrabajador = tj_id ' +
              ' AND ca_id = ' + SqlInt(FIdCarta)

        else
          Sql :=
          'SELECT tj_calle calle, tj_cpostal codpostal,' +
                ' NVL(iif_char(tj_cpostala, ''99999999'', NULL, tj_cpostala), tj_cpostal) cpostal,' +
                ' tj_cpostala cpostala, tj_departamento departamento,' +
                ' utiles.get_textolimpio(utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento, Null, tj_edificio)) domicilio,' +
                ' tj_provincia idprovincia, tj_localidad localidad, tj_nombre nombre, tj_numero numero, tj_piso piso,' +
                ' pv_descripcion provincia' +
           ' FROM ctj_trabajador, cpv_provincias' +
          ' WHERE tj_provincia = pv_codigo(+)' +
            ' AND tj_id = ' + SqlInt(FDestinatarioId);
      end;
      tdArt:
        Sql :=
          'SELECT ar_calle calle, ar_cpostal codpostal,' +
                ' NVL(iif_char(ar_cpostala, ''99999999'', NULL, ar_cpostala), ar_cpostal) cpostal,' +
                ' ar_cpostala cpostala, ar_departamento departamento,' +
                ' utiles.get_textolimpio(utiles.armar_domicilio(ar_calle, ar_numero, ar_piso, ar_departamento)) domicilio,' +
                ' ar_provincia idprovincia, ar_localidad localidad, ar_nombre nombre, ar_numero numero, ar_piso piso,' +
                ' pv_descripcion provincia' +
           ' FROM aar_art, cpv_provincias' +
          ' WHERE ar_provincia = pv_codigo(+)' +
            ' AND ar_id = ' + SqlInt(FDestinatarioId);
      tdOtros:
        Sql :=
          'SELECT dc_calle calle, dc_cpostal codpostal,' +
                ' NVL(iif_char(dc_cpostala, ''99999999'', NULL, dc_cpostala), dc_cpostal) cpostal,' +
                ' dc_cpostala cpostala, dc_departamento departamento,' +
                ' utiles.get_textolimpio(utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento)) domicilio,' +
                ' dc_provincia idprovincia, dc_localidad localidad, dc_nombre nombre, dc_numero numero, dc_piso piso,' +
                ' pv_descripcion provincia' +
           ' FROM cdc_destinatariocarta, cpv_provincias' +
          ' WHERE dc_provincia = pv_codigo(+)' +
            ' AND dc_id = ' + SqlInt(FDestinatarioId);
      tdComisionMedica:
        Sql :=
          'SELECT cm_calle calle, cm_cpostal codpostal, cm_cpostal cpostal, cm_cpostal cpostala, NULL departamento,' +
                ' utiles.get_textolimpio(utiles.armar_domicilio(cm_calle, cm_numero, cm_piso, NULL)) domicilio, cm_provincia idprovincia,' +
                ' cm_localidad localidad, cm_descripcion nombre, cm_numero numero, cm_piso piso,' +
                ' pv_descripcion provincia' +
           ' FROM SIN.scm_comisionmedica, cpv_provincias' +
          ' WHERE cm_provincia = pv_codigo(+)' +
            ' AND cm_id = ' + SqlInt(FDestinatarioId);
    end;

    sdqConsulta := GetQuery(Sql);
    try
      if sdqConsulta.IsEmpty then
      begin
        Clear_Destinatario;
        raise Exception.CreateFmt(SErrDestinatarioLoad, [TipoDestinatarioToName(FDestinatarioTipo, FTipoEmpresa), FDestinatarioId]);
      end
      else
        with sdqConsulta do
        begin
          FDomicilio.Calle        := FieldByName('CALLE').AsString;
          FDomicilio.CPostal      := FieldByName('CODPOSTAL').AsString;
          FDomicilio.CPostalA     := FieldByName('CPOSTALA').AsString;
          FDomicilio.Departamento := FieldByName('DEPARTAMENTO').AsString;
          FDomicilio.Localidad    := FieldByName('LOCALIDAD').AsString;
          FDomicilio.Numero       := FieldByName('NUMERO').AsString;
          FDomicilio.Piso         := FieldByName('PISO').AsString;
          FDomicilio.Provincia    := FieldByName('IDPROVINCIA').AsString;

          if (FTextoDestinatario = '') then
            qrlDestNombre.Caption  := FieldByName('NOMBRE').AsString
          else
            qrlDestNombre.Caption  := FTextoDestinatario + ' ' + FieldByName('NOMBRE').AsString;
          qrlDestDomicilio.Caption := FieldByName('DOMICILIO').AsString;
          qrlDestCPostal.Caption   := FieldByName('CPOSTAL').AsString;
          qrlDestProvincia.Caption := FieldByName('PROVINCIA').AsString;
          
          qrlDestLocalidad.Caption := FieldByName('LOCALIDAD').AsString;
          AjustarLabel(qrlDestLocalidad, 6, 22, 0);

          ReplicarDestinatario;
        end;
    finally
      sdqConsulta.Free;
    end;
  end;
end;

procedure TrptCartaDocHeader.LoadRemitente;
var
  bHayDatos: Boolean;
  CPostal: String;
  Domicilio: String;
  Localidad: String;
  Provincia: String;
begin
  if FRemitenteId = ART_EMPTY_ID then
    Clear_Remitente
  else
  begin
    if Is_RemitenteEspecialCorreoArgentino then
    begin
      if EsSinGobernacion then
        qrlRemNombre.Caption  := ART_NOMBRE_GOB
      else
        qrlRemNombre.Caption  := TXT_EMP_RSOCIAL;

      qrlRemDomicilio.Caption := Format(REMDOMICILIOCORREO, [CodigoRemitente]);
      qrlRemCPostal.Caption   := REMCPOSTALCORREO;
      qrlRemProvincia.Caption := REMPROVINCIACORREO;
      qrlRemLocalidad.Caption := REMLOCALIDADCORREO;

      ReplicarRemitente;
    end
    else
    begin
      bHayDatos := Get_DatosRemitenteDelegacion(FRemitenteId, Domicilio, Localidad, CPostal, Provincia);

      if bHayDatos then
      begin
        if EsSinGobernacion then
          qrlRemNombre.Caption  := ART_NOMBRE_GOB
        else
          qrlRemNombre.Caption  := TXT_EMP_RSOCIAL;
        qrlRemDomicilio.Caption := Domicilio;
        qrlRemCPostal.Caption   := CPostal;
        qrlRemProvincia.Caption := Provincia;
        qrlRemLocalidad.Caption := Localidad;

        ReplicarRemitente;
      end
      else
        Clear_Remitente
    end;
  end;
end;

procedure TrptCartaDocHeader.SetCorreo(const Value: TCorreo);
begin
  if (FCorreo <> Value) or (csLoading in ComponentState) then
  begin
    FCorreo := Value;
    
    ArrangeControls;
  end;
end;

procedure TrptCartaDocHeader.ArrangeControls;
begin
  case FTipoSalida of
    tsCartaDocumento:
    begin
      Page.PaperSize := Legal;
      PrinterSettings.PaperSize := Legal;
      Page.Length := 355.6;

      case FCorreo of
        tcArgentino:   ArrangeControls_Argentino;
        tcAndreani:    ArrangeControls_Andreani;
        tcOCA:         ArrangeControls_Oca;
        tcBonaerense:  ArrangeControls_Bonaerense;
        tcFullExpress: ArrangeControls_FullExpress;
        tcRowing:      ArrangeControls_Rowing;
        tcSeprit:      ArrangeControls_Rowing;
        tcVentanilla:  ArrangeControls_Argentino;
        // Momentaneamente Seprit queda como Rowing...tal vez en algun momento habría que cambiarlo..
        tcNone:        ;
      else
        raise Exception.Create(SInvalidPropertyValue);
      end;
    end;

    tsCartaComercial, tsVentanillaElectronica:
    begin
      Page.PaperSize := Letter;
      PrinterSettings.PaperSize := Letter;

      with Page do
      begin
        Length := 279;
        TopMargin := IIF(MostrarLogo, 10, 30);
        BottomMargin := 15;
        LeftMargin := 15;
//        RightMargin := 15;  Lo comento por las dudas que falle para otros reportes...
      end;
    end;
  end;

  Do_MostrarFranqueoAPagar;
end;

procedure TrptCartaDocHeader.SetDestinatarioId(const Value: TTableID);
begin
  if FDestinatarioId <> Value then
  begin
    FDestinatarioId := Value;
    LoadDestinatario;
  end;
end;

procedure TrptCartaDocHeader.SetDestinatario(IdEndoso, IdFormulario, IdDeudora, IdTrabajador, IdArt, IdOtros,
                                             IdComisionMedica: TTableId; sTextoDestinatario: String = '');
begin
  case FDestinatarioTipo of
    tdEmpresa:
      if IdEndoso <> ART_EMPTY_ID then
      begin
        FTipoEmpresa := teEndoso;
        SetDestinatarioId(IdEndoso);
      end
      else if IdDeudora <> ART_EMPTY_ID then
      begin
        FTipoEmpresa := teDeudora;
        SetDestinatarioId(IdDeudora);
      end
      else
      begin
        FTipoEmpresa := teFormulario;
        SetDestinatarioId(IdFormulario)
      end;
    tdTrabajador:
      begin
        TextoDestinatario := sTextoDestinatario; //el texto es solo para el trabajador
        SetDestinatarioId(IdTrabajador);
      end;
    tdArt: SetDestinatarioId(IdArt);
    tdOtros: SetDestinatarioId(IdOtros);
    tdComisionMedica: SetDestinatarioId(IdComisionMedica);
  end;
end;

procedure TrptCartaDocHeader.SetRemitenteId(const Value: TTableId);
begin
  if FRemitenteId <> Value then
  begin
    FRemitenteId := Value;
    LoadRemitente;
  end;
end;

procedure TrptCartaDocHeader.SetRemitenteActual;
begin
  {$IFDEF ART2}
  SetRemitenteId(Sesion.Delegacion);
  {$ELSE}
  SetRemitenteId(StrToInt(Sesion.Delegacion));
  {$ENDIF}
end;

procedure TrptCartaDocHeader.SetIdCarta(const Value: TTableID);
begin
  if FIdCarta <> Value then
  begin
    FIdCarta := Value;

    if FIdCarta = ART_EMPTY_ID then
      Clear
    else
    try
      LoadValues;
      Do_CargarContrato(FIdCarta);
      Do_CargarRegistro_CodFirma(FIdCarta, FImprimirCodFirma, FIdFirma);
    except
      FIdCarta := ART_EMPTY_ID;
      raise;
    end;
  end;
end;

procedure TrptCartaDocHeader.LoadValues;
var
  sdqDatos: TSDQuery;
  sSql: String;
begin
  sSql :='SELECT ca_nrocartadoc, ' +
              ' nvl(ca_idendosoreimpresion, ca_idendoso) idendoso, ' +
              ' ca_idformulario, ca_idempdeudora, nvl(ca_correoreimpresion, ca_correo) correo, ' +
              ' ca_idtrabajador, ca_idart, ca_idfirmareimpresion, ca_idfirma, ca_iddelegacion, ' +
              ' ca_tiposalida, ht_destinatario tc_destinatario, ht_textodestinatario tc_textodestinatario, ' +
              ' ca_iddestinatariocarta, ca_idcomisionmedica' +
         ' FROM cca_carta, comunes.cht_historicotextocarta' +
        ' WHERE ca_idhistoricotextocarta = ht_id' +
          ' AND ca_id = :IdCarta';

  sdqDatos := GetQueryEx(sSql, [FIdCarta]);
  try
    { Los datos del Formato de la Carta }
    TipoSalida := StrToTipoSalida(sdqDatos.FieldByName('CA_TIPOSALIDA').AsString);
    Correo     := StrToCorreo(sdqDatos.FieldByName('CORREO').AsString);

    { Los datos del Header }
    qrlNumero.Caption := sdqDatos.FieldByName('CA_NROCARTADOC').AsString;
    DestinatarioTipo  := StrToTipoDestinatario(sdqDatos.FieldByName('TC_DESTINATARIO').AsString);
    SetDestinatario(sdqDatos.FieldByName('IDENDOSO').AsInteger,
                    sdqDatos.FieldByName('CA_IDFORMULARIO').AsInteger,
                    sdqDatos.FieldByName('CA_IDEMPDEUDORA').AsInteger,
                    sdqDatos.FieldByName('CA_IDTRABAJADOR').AsInteger,
                    sdqDatos.FieldByName('CA_IDART').AsInteger,
                    sdqDatos.FieldByName('CA_IDDESTINATARIOCARTA').AsInteger,
                    sdqDatos.FieldByName('CA_IDCOMISIONMEDICA').AsInteger,
                    sdqDatos.FieldByName('TC_TEXTODESTINATARIO').AsString);

    SetRemitenteActual;

    ReplicarTodo;

    { Datos del Firmante }
    IdFirma := IIF(ImprimirFirmanteOrig, sdqDatos.FieldByName('ca_idfirma').AsInteger,
                                         IIF(sdqDatos.FieldByName('ca_idfirmareimpresion').IsNull,
                                             sdqDatos.FieldByName('ca_idfirma').AsInteger,
                                             sdqDatos.FieldByName('ca_idfirmareimpresion').AsInteger));
  finally
    sdqDatos.Free;
  end;
end;

procedure TrptCartaDocHeader.SetIdFirma(const Value: TTableID);
begin
  if FIdFirma <> Value then
  begin
    FIdFirma := Value;

    if FIdFirma = ART_EMPTY_ID then
      ClearFirma
    else
      LoadFirma;
  end;
end;

procedure TrptCartaDocHeader.LoadFirma;
var
  bEsCartaComercial, bAvalada: Boolean;
  sSql: String;
  fStream: TStream;
begin
  sSql := 'SELECT fi_firmante, fi_documento, fi_caracter, fi_firma, fi_margeninferior, ' +
                ' fi_firmatodas ' +
           ' FROM cfi_firma ' +
          ' WHERE fi_id = :idfirma';
  with GetQueryEx(sSql, [FIdFirma]) do
  try
    if IsEmpty then
      ClearFirma
    else begin
      bEsCartaComercial := (FTipoSalida = tsCartaComercial) or (FTipoSalida = tsVentanillaElectronica);
      SetFirmaVisible(True);

      qrlFirmante.Caption   := FieldByName('fi_firmante').AsString;
      qrlDocumento.Caption  := FieldByName('fi_documento').AsString;
      qrlCaracter.Caption   := FieldByName('fi_caracter').AsString;

      if ImprimirFirma then
      begin
        if bEsCartaComercial then
          ArrangeControls_FirmaCartaComercial;

        bAvalada := (ValorSqlIntegerEx('SELECT ca_idavaldigital ' +
                                        ' FROM cca_carta ' +
                                       ' WHERE ca_id = :idcarta', [FIdCarta]) = FIdFirma);

        if (FieldByName('fi_firmatodas').AsString = 'S') or bAvalada then
        begin
          fStream := CreateBlobStream(FieldByName('fi_firma'), bmReadWrite);
          try
            qriFirma.Picture.Bitmap.LoadFromStream(fStream);
          finally
            fStream.Free;
          end;
        end;
//          qriFirma.Picture.Assign(FieldByName('fi_firma'));

        { Ubica la Firma según FFirmaPos : TPoint ------------------------------- }
        qriFirma.Left := FFirmaPos.x - (qriFirma.Width div 2);
        qriFirma.Top  := FFirmaPos.y +  FieldByName('fi_margeninferior').AsInteger - qriFirma.Height;
      end;

      if bEsCartaComercial then
        ArrangeControls_DatosFirmanteCartaComercial;
    end;
  finally
    Free;
  end;
end;

procedure TrptCartaDocHeader.ClearFirma;
begin
  qrlFirmante.Caption  := ' ';
  qrlDocumento.Caption := ' ';
  qrlCaracter.Caption  := ' ';

  SetFirmaVisible(False);
end;

procedure TrptCartaDocHeader.SetFirmaVisible(AVisible: Boolean);
begin
  qrlFirmante.Visible   := AVisible;
  qrlDocumento.Visible  := AVisible and ImprimirDNI;
  qrlCaracter.Visible   := AVisible;
  qriFirma.Visible      := AVisible and ImprimirFirma;
  qrbPageFooter.Enabled := AVisible;
end;

procedure TrptCartaDocHeader.qrbPageHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  sSql: String;
begin
  PrintBand := (FTipoSalida = tsCartaDocumento);

  if PrintBand then
  begin
    sSql :=
      'SELECT ca_nrocartadoc ' +
       ' FROM cca_carta' +
      ' WHERE ca_id = :idcarta';
    qrlNumero.Caption  := ValorSqlEx(sSql, [IdCarta]);
    qrlNumero1.Caption := qrlNumero.Caption;

    QRALFranqueo6A.Enabled := Is_MostrarFranqueoAPagar() and (Accion = aPrint);  // Solo muestro los TQRAngledLabel del FAP al imprimir, porque en el preview se ven mal...
    QRALFranqueo6B.Enabled := QRALFranqueo6A.Enabled;
  end;
end;

procedure TrptCartaDocHeader.SaveToFile(AFileName: TFileName);
begin
  //este codigo hay que cambiarlo para que se sobreescriba en todas las clases que
  //descienden de esta
  ExportarPDF(Self, AFileName);
end;

procedure TrptCartaDocHeader.ArrangeControls_Bonaerense;
begin
  with Page do
  begin
    BottomMargin := 35;
    LeftMargin := 15;
  end;

  with qrbPageHeader do
  begin
    Left             := 19;
    Top              := 15;
    Width            := 778;
    Height           := 442;
  end;

  with qrlRemNombre do
  begin
    Left             := 36;
    Top              := 106;
    Width            := 349;
    Height           := 17;
    Alignment        := taLeftJustify;
    FontSize         := 10;
  end;

  with qrlRemDomicilio do
  begin
    Left             := 36;
    Top              := 134;
    Width            := 349;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlRemCPostal do
  begin
    Left             := 36;
    Top              := 160;
    Width            := 89;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlRemLocalidad do
  begin
    Left             := 136;
    Top              := 160;
    Width            := 145;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlRemProvincia do
  begin
    Left             := 308;
    Top              := 160;
    Width            := 77;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlDestProvincia do
  begin
    Left             := 660;
    Top              := 160;
    Width            := 82;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlDestLocalidad do
  begin
    Left             := 491;
    Top              := 160;
    Width            := 146;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlDestCPostal do
  begin
    Left             := 400;
    Top              := 160;
    Width            := 85;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlDestDomicilio do
  begin
    Left             := 400;
    Top              := 134;
    Width            := 313;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlDestNombre do
  begin
    Left             := 400;
    Top              := 106;
    Width            := 277;
    Height           := 17;
    Alignment        := taLeftJustify;
    Transparent      := False;
    WordWrap         := True;
    FontSize         := 10;
  end;

  with qrlRemProvincia1 do
  begin
    Left             := 308;
    Top              := 420;
    Width            := 77;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlRemLocalidad1 do
  begin
    Left             := 136;
    Top              := 420;
    Width            := 149;
    Height           := 17;
    Alignment        := taLeftJustify;
    Font.Charset     := DEFAULT_CHARSET;
    Font.Color       := clWindowText;
    Font.Height      := -12;
    Font.Name        := 'Verdana';
    Font.Style       := [];
    FontSize         := 9;
  end;

  with qrlRemCPostal1 do
  begin
    Left              := 40;
    Top               := 420;
    Width             := 89;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 9;
  end;

  with qrlRemDomicilio1 do
  begin
    Left              := 40;
    Top               := 393;
    Width             := 349;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 9;
  end;

  with qrlRemNombre1 do
  begin
    Left              := 40;
    Top               := 364;
    Width             := 349;
    Height            := 17;
    Alignment         := taLeftJustify;
    FontSize          := 10;
  end;

  with qrlDestNombre1 do
  begin
    Left              := 400;
    Top               := 364;
    Width             := 277;
    Height            := 17;
    Alignment         := taLeftJustify;
    FontSize          := 10;
  end;

  with qrlDestDomicilio1 do
  begin
    Left              := 400;
    Top               := 393;
    Width             := 313;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 9;
  end;

  with qrlDestCPostal1 do
  begin
    Left              := 400;
    Top               := 420;
    Width             := 85;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 9;
  end;

  with qrlDestLocalidad1 do
  begin
    Left              := 491;
    Top               := 420;
    Width             := 150;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 9;
  end;

  with qrlDestProvincia1 do
  begin
    Left              := 660;
    Top               := 420;
    Width             := 82;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 9;
  end;

  with qrlNumero do
  begin
    Left              := 396;
    Top               := 8;
    Width             := 89;
    Height            := 15;
    Alignment         := taCenter;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -11;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlNumero1 do
  begin
    Left              := 40;
    Top               := 284;
    Width             := 89;
    Height            := 15;
    Alignment         := taCenter;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -11;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlBarras2 do
  begin
    Left              := 132;
    Top               := 276;
    Width             := 257;
    Height            := 31;
    Alignment         := taCenter;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := 30;
    Font.Name         := '3 of 9 Barcode';
    Font.Style        := [];
    OnPrint           := qrlBarrasPrint;
    FontSize          := -23;
  end;

  with qrlBarras1 do
  begin
    Left              := 488;
    Top               := 4;
    Width             := 257;
    Height            := 31;
    Alignment         := taCenter;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := 30;
    Font.Name         := '3 of 9 Barcode';
    Font.Style        := [];
    OnPrint           := qrlBarrasPrint;
    FontSize          := -23;
  end;

  with qrlContrato do
  begin
    Left := 76;
    Top := 4;
  end;

  qrlRegistroCodFirma.Enabled := False;

{  FFirmaPos.x := 662;
  FFirmaPos.y := 1265;
  With qrlFirmante do begin
    Left               := 520;
    Top                := 1102;
    Width              := 245;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
  With qrlDocumento do begin
    Left               := 520;
    Top                := 1122;
    Width              := 245;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
  With qrlCaracter do begin
    Left               := 520;
    Top                := 1142;
    Width              := 245;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;}

  qrbPageFooter.Height := 90;

  FFirmaPos.x := 0 + (230 div 2);
  FFirmaPos.y := 10 + 50;
  with qrlFirmante do
  begin
    Left               := 0;
    Top                := 60;
    Width              := 230;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlDocumento do
  begin
    Left               := 515;
    Top                := 60;
    Width              := 181;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
  with qrlCaracter do
  begin
    Left               := 240;
    Top                := 60;
    Width              := 243;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
end;

procedure TrptCartaDocHeader.ArrangeControls_Andreani;
  procedure SetDefault(ALabel: TQRLabel);
  begin
    with ALabel do
    begin
      Font.Charset := DEFAULT_CHARSET;
      Font.Color   := clWindowText;
      Font.Height  := -12;
      Font.Name    := 'Verdana';
      Font.Style   := [];
      FontSize     := 8;
    end;
  end;

begin
  with Page do
  begin
    BottomMargin := 35;
    LeftMargin := 15;
  end;

  with qrbPageHeader do
  begin
    Left              := 19;
    Top               := 19;
    Width             := 778;
    Height            := 494;
  end;

  with qrlRemNombre do
  begin
    Left              := 0;
    Top               := 88;
    Width             := 213;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemNombre);
  end;

  with qrlRemDomicilio do
  begin
    Left              := 0;
    Top               := 128;
    Width             := 213;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemDomicilio);
  end;

  with qrlRemCPostal do
  begin
    Left              := 0;
    Top               := 172;
    Width             := 61;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemCPostal);
  end;

  with qrlRemLocalidad do
  begin
    Left              := 80;
    Top               := 172;
    Width             := 157;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemLocalidad);
  end;

  with qrlRemProvincia do
  begin
    Left              := 240;
    Top               := 172;
    Width             := 153;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemProvincia);
  end;

  with qrlDestProvincia do
  begin
    Left              := 644;
    Top               := 172;
    Width             := 117;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlDestProvincia);
  end;

  with qrlDestLocalidad do
  begin
    Left              := 468;
    Top               := 172;
    Width             := 137;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlDestLocalidad);
  end;

  with qrlDestCPostal do
  begin
    Left              := 396;
    Top               := 172;
    Width             := 57;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlDestCPostal);
  end;

  with qrlDestDomicilio do
  begin
    Left              := 396;
    Top               := 128;
    Width             := 215;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlDestDomicilio);
  end;

  with qrlDestNombre do
  begin
    Left              := 396;
    Top               := 88;
    Width             := 215;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlDestNombre);
  end;

  with qrlRemProvincia1 do
  begin
    Left              := 164;
    Top               := 472;
    Width             := 85;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemProvincia1);
  end;

  with qrlRemLocalidad1 do
  begin
    Left              := 60;
    Top               := 472;
    Width             := 85;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemLocalidad1);
  end;

  with qrlRemCPostal1 do
  begin
    Left              := 0;
    Top               := 472;
    Width             := 49;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemCPostal1);
  end;

  with qrlRemDomicilio1 do
  begin
    Left              := 0;
    Top               := 428;
    Width             := 221;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemDomicilio1);
  end;

  with qrlRemNombre1 do
  begin
    Left              := 0;
    Top               := 388;
    Width             := 221;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlRemNombre1);
  end;

  with qrlDestNombre1 do
  begin
    Left              := 487;
    Top               := 388;
    Width             := 287;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlDestNombre1);
  end;

  with qrlDestDomicilio1 do
  begin
    Left              := 486;
    Top               := 428;
    Width             := 288;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlDestDomicilio1);
  end;

  with qrlDestCPostal1 do
  begin
    Left              := 485;
    Top               := 472;
    Width             := 45;
    Height            := 17;
    Alignment         := taLeftJustify;
    SetDefault(qrlDestCPostal1);
  end;

  with qrlDestLocalidad1 do
  begin
    Left               := 536;
    Top                := 472;
    Width              := 121;
    Height             := 17;
    Alignment          := taLeftJustify;
    SetDefault(qrlDestLocalidad1);
  end;

  with qrlDestProvincia1 do
  begin
    Left               := 662;
    Top                := 472;
    Width              := 112;
    Height             := 17;
    Alignment          := taLeftJustify;
    SetDefault(qrlDestProvincia1);
  end;

  with qrlNumero do
  begin
    Left               := 388;
    Top                := 8;
    Width              := 225;
    Height             := 23;
    Alignment          := taCenter;
    Font.Charset       := DEFAULT_CHARSET;
    Font.Color         := clWindowText;
    Font.Height        := -19;
    Font.Name          := 'Verdana';
    Font.Style         := [fsBold];
    FontSize           := 14;
  end;

  with qrlNumero1 do
  begin
    Left               := 388;
    Top                := 316;
    Width              := 225;
    Height             := 23;
    Alignment          := taCenter;
    Font.Charset       := DEFAULT_CHARSET;
    Font.Color         := clWindowText;
    Font.Height        := -19;
    Font.Name          := 'Verdana';
    Font.Style         := [fsBold];
    FontSize           := 14;
  end;

  with qrlBarras2 do
  begin
    Visible := False;
  end;

  with qrlBarras1 do
  begin
    Visible := False;
  end;

  with qrlContrato do
  begin
    Left := 76;
    Top := 4;
  end;

  qrlRegistroCodFirma.Enabled := False;

{  FFirmaPos.x := 27 + (243 div 2);
  FFirmaPos.y := 1164;
  With qrlFirmante do begin
    Left               := 27;
    Top                := 1165;
    Width              := 243;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
  With qrlDocumento do begin
    Left               := 553;
    Top                := 1165;
    Width              := 181;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
  With qrlCaracter do begin
    Left               := 279;
    Top                := 1165;
    Width              := 243;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;}

  qrbPageFooter.Height := 90;

  FFirmaPos.x := 0 + (230 div 2);
  FFirmaPos.y := 10 + 50;

  with qrlFirmante do
  begin
    Left               := 0;
    Top                := 60;
    Width              := 230;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlDocumento do
  begin
    Left               := 515;
    Top                := 60;
    Width              := 181;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlCaracter do
  begin
    Left               := 240;
    Top                := 60;
    Width              := 243;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
end;

procedure TrptCartaDocHeader.ArrangeControls_FullExpress;
begin
  with Page do
  begin
    BottomMargin := 35;
    LeftMargin := 15;
  end;

  with qrbPageHeader do
  begin
    Left              := 19;
    Top               := 19;
    Width             := 721;
//    Height            := 388;
    Height            := 450;
  end;

  with qrlRemNombre do
  begin
    Left              := 56;
    Top               := 132;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlRemDomicilio do
  begin
    Left              := 56;
    Top               := 150;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlRemCPostal do
  begin
    Left              := 56;
    Top               := 168;
    Width             := 60;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlRemLocalidad do
  begin
    Left              := 118;
    Top               := 168;
    Width             := 191;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlRemProvincia do
  begin
    Left              := 56;
    Top               := 186;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestNombre do
  begin
    Left              := 416;
    Top               := 132;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestDomicilio do
  begin
    Left              := 416;
    Top               := 150;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestCPostal do
  begin
    Left              := 416;
    Top               := 168;
    Width             := 60;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestLocalidad do
  begin
    Left              := 478;
    Top               := 168;
    Width             := 191;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestProvincia do
  begin
    Left              := 416;
    Top               := 186;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlRemNombre1 do
  begin
    Left              := 56;
    Top               := 368;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlRemDomicilio1 do
  begin
    Left              := 56;
    Top               := 386;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlRemCPostal1 do
  begin
    Left              := 56;
    Top               := 404;
    Width             := 60;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlRemLocalidad1 do
  begin
    Left              := 118;
    Top               := 404;
    Width             := 191;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlRemProvincia1 do
  begin
    Left              := 56;
    Top               := 422;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestNombre1 do
  begin
    Left              := 416;
    Top               := 368;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestDomicilio1 do
  begin
    Left              := 416;
    Top               := 386;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestCPostal1 do
  begin
    Left              := 416;
    Top               := 404;
    Width             := 60;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestLocalidad1 do
  begin
    Left              := 478;
    Top               := 404;
    Width             := 191;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlDestProvincia1 do
  begin
    Left              := 416;
    Top               := 422;
    Width             := 253;
    Height            := 17;
    Alignment         := taLeftJustify;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := -12;
    Font.Name         := 'Verdana';
    Font.Style        := [];
    FontSize          := 8;
  end;

  with qrlNumero do
  begin
    Left               := 467;
    Top                := 44;
    Width              := 301;
    Height             := 49;
    Alignment          := taCenter;
    Font.Charset       := DEFAULT_CHARSET;
    Font.Color         := clWindowText;
    Font.Height        := -19;
    Font.Name          := 'Verdana';
    Font.Style         := [fsBold];
    FontSize           := 14;
  end;

  with qrlBarras1 do
  begin
    Left              := 467;
    Top               := 92;
    Width             := 301;
    Height            := 17;
    Alignment         := taCenter;
    Font.Charset      := DEFAULT_CHARSET;
    Font.Color        := clWindowText;
    Font.Height       := 30;
    Font.Name         := '3 of 9 Barcode';
    Font.Style        := [];
    OnPrint           := qrlBarrasPrint;
    FontSize          := -23;
  end;

  with qrlNumero1 do
  begin
    Left               := 467;
    Top                := 320;
    Width              := 301;
    Height             := 17;
    Alignment          := taCenter;
    Font.Charset       := DEFAULT_CHARSET;
    Font.Color         := clWindowText;
    Font.Height        := -19;
    Font.Name          := 'Verdana';
    Font.Style         := [fsBold];
    FontSize           := 14;
  end;

  with qrlBarras2 do
    Visible := False;

  with qrlContrato do
  begin
    Left := 76;
    Top := 4;
  end;

  qrlRegistroCodFirma.Enabled := False;

  qrbPageFooter.Height := 90;

  FFirmaPos.x := 0 + (230 div 2);
  FFirmaPos.y := 10 + 50;

  with qrlFirmante do
  begin
    Left               := 0;
    Top                := 60;
    Width              := 230;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlDocumento do
  begin
    Left               := 515;
    Top                := 60;
    Width              := 181;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlCaracter do
  begin
    Left               := 240;
    Top                := 60;
    Width              := 243;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
end;

procedure TrptCartaDocHeader.ArrangeControls_Argentino;
  procedure SetDefault(ALabel: TQRLabel);
  begin
    with ALabel do
    begin
      Font.Charset := DEFAULT_CHARSET;
      Font.Color   := clWindowText;
      Font.Height  := -12;
      Font.Name    := 'Arial Narrow';
      Font.Style   := [];
      FontSize     := 8;
    end;
  end;

begin
  with Page do
  begin
    BottomMargin := 35;
    LeftMargin := 15;
  end;

  with qrbPageHeader do
  begin
    Left := 19;
    Top := 15;
    Width := 778;
    Height := 574;
  end;

  with qrlRemNombre do
  begin
    Left := 39;
    Top := 127;
    Width := 305;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemNombre);
  end;
  with qrlRemDomicilio do
  begin
    Left := 39;
    Top := 163;
    Width := 305;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemDomicilio);
  end;
  with qrlRemCPostal do
  begin
    Left := 39;
    Top := 197;
    Width := 70;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemCPostal);
  end;
  with qrlRemLocalidad do
  begin
    Left      := 152;
    Top       := 197;
    Width     := 136;
    Height    := 14;
    Alignment := taLeftJustify;
    AutoSize  := False;
    SetDefault(qrlRemLocalidad);
  end;
  with qrlRemProvincia do
  begin
    Left := 269;
    Top := 197;
    Width := 90;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemProvincia);
    Font.Size := 7;
  end;
  with qrlDestProvincia do
  begin
    Left := 580;
    Top := 197;
    Width := 100;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestProvincia);
    Font.Size := 6;
  end;
  with qrlDestLocalidad do
  begin
    Left := 460;
    Top := 197;
    Width := 114;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestLocalidad);
    Font.Size  := 7;
  end;
  with qrlDestCPostal do
  begin
    Left := 356;
    Top := 197;
    Width := 70;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestCPostal);
  end;
  with qrlDestDomicilio do
  begin
    Left := 408;
    Top := 158;
    Width := 320;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestDomicilio);
  end;
  with qrlDestDomicilio_Abajo do
  begin
    Left := 356;
    Top := 170;
    Width := 320;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestDomicilio_Abajo);
  end;
  with qrlDestNombre do
  begin
    Left := 356;
    Top := 127;
    Width := 320;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    //AutoStretch := True;
    SetDefault(qrlDestNombre);
  end;
  with qrlDestNombre_Abajo do
  begin
    Left := 356;
    Top := 139;
    Width := 320;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    //AutoStretch := True;
    SetDefault(qrlDestNombre_Abajo);
  end;

  with qrlRemProvincia1 do
  begin
    Left := 269;
    Top := 554;
    Width := 90;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemProvincia1);
    Font.Size := 6;
  end;
  with qrlRemLocalidad1 do
  begin
    Left := 152;
    Top := 554;
    Width := 136;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemLocalidad1);
  end;
  with qrlRemCPostal1 do
  begin
    Left := 39;
    Top := 554;
    Width := 70;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemCPostal1);
  end;
  with qrlRemDomicilio1 do
  begin
    Left := 39;
    Top := 528;
    Width := 305;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemDomicilio1);
  end;
  with qrlRemNombre1 do
  begin
    Left := 39;
    Top := 482;
    Width := 305;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemNombre1);
  end;

  with qrlDestNombre1 do
  begin
    Left := 356;
    Top := 482;
    Width := 320;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    //AutoStretch := True;
    SetDefault(qrlDestNombre1);
  end;
  with qrlDestNombre1_Abajo do
  begin
    Left := 356;
    Top := 494;
    Width := 320;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    //AutoStretch := True;
    SetDefault(qrlDestNombre1_Abajo);
  end;
  with qrlDestDomicilio1 do
  begin
    Left := 408;
    Top := 517;
    Width := 320;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestDomicilio1);
  end;
  with qrlDestDomicilio1_Abajo do
  begin
    Left := 356;
    Top := 529;
    Width := 305;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestDomicilio1_Abajo);
  end;
  with qrlDestCPostal1 do
  begin
    Left := 356;
    Top := 554;
    Width := 70;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestCPostal1);
  end;
  with qrlDestLocalidad1 do
  begin
    Left := 460;
    Top := 554;
    Width := 114;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestLocalidad1);
    Font.Size  := 6;
  end;
  with qrlDestProvincia1 do
  begin
    Left := 580;
    Top := 554;
    Width := 100;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestProvincia1);
    Font.Size := 6;
  end;

  with qrlNumero do
  begin
    Left := 39;
    Top := 250;
    Width := 220;
    Height := 15;
    Alignment := taCenter;
    AutoSize := False;
    SetDefault(qrlNumero);
    Font.Style   := [fsBold];
  end;
  with qrlNumero1 do
  begin
    Left := 150;
    Top := 380;
    Width := 230;
    Height := 15;
    Alignment := taCenter;
    AutoSize := False;
    SetDefault(qrlNumero1);
    Font.Style   := [fsBold];
  end;
  with qrlDelegacion do
  begin
    Left := 230;
    Top := 37;
    Width := 200;                                        
    Height := 17;
    Alignment := taCenter;
    AutoSize := False;
    SetDefault(qrlDelegacion);
    Font.Style   := [fsBold];
  end;
  with qrlOrden do
  begin
    Left := 230;
    Top := 20;
    Width := 110;
    Height := 17;
    Alignment := taCenter;
    AutoSize := False;
    SetDefault(qrlOrden);
  end;
  with qrlLeyendaAcuse do
  begin
    Left := qrlOrden.Left + qrlOrden.Width + 10;
    Top := qrlOrden.Top;
    Width := 490;
    Height := 17;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlLeyendaAcuse);
  end;
  with qrlBarras2 do
  begin
    Left := 39;
    Top := 225;
    Width := 220;
    Font.Height := -25;
    Font.Size := 19;
    Alignment := taCenter;
    Height := 17;
    Visible := True;
  end;
  with qrlBarras1 do
  begin
    Left := 50;
    Top := 200;
    Width := 240;
    Font.Height := -25;
    Font.Size := 19;
    Alignment := taCenter;
    Height := 17;
    Visible := False;
  end;

  with qrlContrato do
  begin
    Left := 200;
    Top := 30;
  end;

  with qrlRegistroCodFirma do
  begin
    Enabled := True;
    Left    := qrlContrato.Left;
    Top     := qrlContrato.Top + 20;
  end;

  with qrlSector do
  begin
    Left := qrlContrato.Left;
    Top  := qrlContrato.Top - 20;
  end;

  qrbPageFooter.Height := 90;

  FFirmaPos.x := 0 + (230 div 2);
  FFirmaPos.y := 10 + 75;

  with qrlFirmante do
  begin
    Left               := 0;
    Top                := 75;
    Width              := 230;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlDocumento do
  begin
    Left               := 515;
    Top                := 75;
    Width              := 181;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlCaracter do
  begin
    Left               := 200;
    Top                := 75;
    Width              := 350;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlOrdenPie do
  begin
    Left               := 200;
    Top                := 120;
    Width              := 110;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
    SetDefault(qrlOrdenPie);
  end;

  with qrlDelegacionPie do
  begin
    Left               := 10;
    Top                := 120;
    Width              := 190;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
    SetDefault(qrlDelegacionPie);
    Font.Style   := [fsBold];
  end;

end;

procedure TrptCartaDocHeader.ArrangeControls_Oca;
begin
  //
end;

procedure TrptCartaDocHeader.ArrangeControls_Rowing;
  procedure SetDefault(ALabel: TQRLabel);
  begin
    with ALabel do
    begin
      Font.Charset := DEFAULT_CHARSET;
      Font.Color   := clWindowText;
      Font.Height  := -12;
      Font.Name    := 'Verdana';
      Font.Style   := [];
      FontSize     := 8;
    end;
  end;

begin
  with Page do
  begin
    BottomMargin := 30;
    LeftMargin := 5;
  end;

  with qrbPageHeader do
  begin
    Left := 19;
    Top := 15;
    Width := 778;
    Height := 574;
  end;

  with qrlRemNombre do
  begin
    Left := 76;
    Top := 134;
    Width := 305;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemNombre);
  end;

  with qrlRemDomicilio do
  begin
    Left := 76;
    Top := 168;
    Width := 305;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemDomicilio);
  end;

  with qrlRemCPostal do
  begin
    Left := 76;
    Top := 201;
    Width := 93;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemCPostal);
  end;

  with qrlRemLocalidad do
  begin
    Left := 175;
    Top := 201;
    Width := 126;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemLocalidad);
  end;

  with qrlRemProvincia do
  begin
    Left := 306;
    Top := 201;
    Width := 73;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemProvincia);
  end;

  with qrlDestProvincia do
  begin
    Left := 621;
    Top := 201;
    Width := 77;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestProvincia);
  end;

  with qrlDestLocalidad do
  begin
    Left := 495;
    Top := 201;
    Width := 119;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestLocalidad);
  end;

  with qrlDestCPostal do
  begin
    Left := 394;
    Top := 201;
    Width := 93;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestCPostal);
  end;

  with qrlDestDomicilio do
  begin
    Left := 394;
    Top := 168;
    Width := 278;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestDomicilio);
  end;

  with qrlDestNombre do
  begin
    Left := 394;
    Top := 134;
    Width := 278;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestNombre);
  end;

  with qrlRemProvincia1 do
  begin
    Left := 306;
    Top := 553;
    Width := 73;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemProvincia1);
  end;

  with qrlRemLocalidad1 do
  begin
    Left := 175;
    Top := 553;
    Width := 126;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemLocalidad1);
  end;

  with qrlRemCPostal1 do
  begin
    Left := 76;
    Top := 553;
    Width := 93;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemCPostal1);
  end;

  with qrlRemDomicilio1 do
  begin
    Left := 76;
    Top := 523;
    Width := 305;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemDomicilio1);
  end;

  with qrlRemNombre1 do
  begin
    Left := 76;
    Top := 488;
    Width := 305;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlRemNombre1);
  end;

  with qrlDestNombre1 do
  begin
    Left := 394;
    Top := 488;
    Width := 278;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestNombre1);
  end;

  with qrlDestDomicilio1 do
  begin
    Left := 394;
    Top := 523;
    Width := 278;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestDomicilio1);
  end;

  with qrlDestCPostal1 do
  begin
    Left := 394;
    Top := 553;
    Width := 93;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestCPostal1);
  end;

  with qrlDestLocalidad1 do
  begin
    Left := 495;
    Top := 553;
    Width := 119;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestLocalidad1);
  end;

  with qrlDestProvincia1 do
  begin
    Left := 621;
    Top := 553;
    Width := 77;
    Height := 14;
    Alignment := taLeftJustify;
    AutoSize := False;
    SetDefault(qrlDestProvincia1);
  end;

  with qrlNumero do
  begin
    Left := 396;
    Top := 338;
    Width := 273;
    Height := 15;
    Alignment := taCenter;
    AutoSize := False;
    SetDefault(qrlNumero);
  end;

  with qrlNumero1 do
  begin
    Left := 396;
    Top := 403;
    Width := 280;
    Height := 15;
    Alignment := taCenter;
    AutoSize := False;
    SetDefault(qrlNumero1);
  end;

  with qrlBarras2 do
  begin
    Left := 396;
    Top := 379;
    Width := 280;
    Height := 25;
    Visible := False;
  end;

  with qrlBarras1 do
  begin
    Left := 76;
    Top := 338;
    Width := 305;
    Height := 31;
    Visible := False;
  end;

  with qrlContrato do
  begin
    Left := 76;
    Top := 4;
  end;

  qrlRegistroCodFirma.Enabled := False;

{  FFirmaPos.x := 27 + (243 div 2);
  FFirmaPos.y := 1164 + 50;
  With qrlFirmante do begin
    Left               := 27;
    Top                := 1165 + 50;
    Width              := 243;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
  With qrlDocumento do begin
    Left               := 553;
    Top                := 1165 + 50;
    Width              := 181;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
  With qrlCaracter do begin
    Left               := 279;
    Top                := 1165 + 50;
    Width              := 243;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;}

  qrbPageFooter.Height := 90;

  FFirmaPos.x := 40 + (230 div 2);
  FFirmaPos.y := 10 + 50;

  with qrlFirmante do
  begin
    Left               := 40;
    Top                := 60;
    Width              := 230;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlDocumento do
  begin
    Left               := 555;
    Top                := 60;
    Width              := 181;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlCaracter do
  begin
    Left               := 280;
    Top                := 60;
    Width              := 243;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;
end;

procedure TrptCartaDocHeader.Do_CargarContrato(IdCarta: TTableID);
var
  NroContrato: Integer;
  sSql: String;
begin
  // el nro. de contrato solo sale en las cartas doc. de afiliaciones y de cobranzas y de Emision
  sSql := 'SELECT EN_CONTRATO ' +
            'FROM AEN_ENDOSO, CAT_AREATEXTO, CCA_CARTA ' +
           'WHERE CA_IDAREATEXTO=AT_ID ' +
             'AND NVL(CA_IDENDOSOREIMPRESION, CA_IDENDOSO) = EN_ID ' +
             'AND AT_AREA IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_COB) + ', ' + SqlValue(AREA_EMI) + ') ' +
             'AND CA_ID=' + SqlValue(IdCarta);

  NroContrato := ValorSqlInteger(sSql);

  if NroContrato > 0 then
    qrlContrato.Caption := 'Contrato: ' + IntToStr(NroContrato)
  else
    qrlContrato.Caption := '';
end;

procedure TrptCartaDocHeader.Do_CargarRegistro_CodFirma(IdCarta: TTableID; aImprimirCodFirma: Boolean; aIdFirma: TTableID);
var
  sRegistroCodFirma: String;
  sSql: String;
begin
  if aImprimirCodFirma then
    sRegistroCodFirma := Trim(IntToStr(aIdFirma))
  else
  begin
    if (Modulo = taDinerarias) then
      sRegistroCodFirma := IntToStr(IdFirma)
    else begin
      // el registro firma solo sale en las 4 cartas doc. de cobranzas, y que sean de Correo Argentino (wf 3852)
      sSql := 'SELECT FI_CODREGISTROFIRMA' +
               ' FROM CFI_FIRMA, CAT_AREATEXTO, CCA_CARTA' +
              ' WHERE CA_IDAREATEXTO = AT_ID' +
                ' AND CA_IDFIRMA = FI_ID' +
                ' AND AT_AREA = ' + SqlValue(AREA_COB) +
                ' AND AT_MODULO IN (' + SqlValue(MODULO_INTIMACION) + ', ' +
                                        SqlValue(MODULO_RESCISION) + ', ' +
                                        SqlValue(MODULO_ANULACIONRESCISION) + ', ' +
                                        SqlValue(MODULO_COMPENSACIONDEUDA) + ', ' +
                                        SqlValue(MODULO_COMPENSACIONDEUDASININTIMAC) + ')' +
            ' AND CA_ID = ' + SqlValue(IdCarta) +
            ' AND FI_CODREGISTROFIRMA IS NOT NULL';
        sRegistroCodFirma := ValorSql(sSql);
    end;
  end;

  if sRegistroCodFirma <> '' then
    qrlRegistroCodFirma.Caption := 'Cód. Firma: ' + sRegistroCodFirma
  else
    qrlRegistroCodFirma.Caption := '';
end;

procedure DoActualizarEndosoReimpresion(IdCarta: TTableId; TransactionMode: TTransactionMode = tmNone);
var
  iContrato: Integer;
  sSql: String;
begin
  sSql := 'SELECT EN_CONTRATO ' +
            'FROM AEN_ENDOSO, CCA_CARTA ' +
           'WHERE CA_IDENDOSO = EN_ID ' +
             'AND CA_ID=' + SqlValue(IdCarta);
  iContrato := ValorSqlInteger(sSql);

  sSql := 'UPDATE CCA_CARTA ' +
             'SET CA_IDENDOSOREIMPRESION = AFILIACION.GET_ULTIDENDOSO(' + SqlValue(iContrato) + ') ' +
           'WHERE CA_ID = ' + SqlValue(IdCarta);
  EjecutarSqlST(sSql, TransactionMode);
end;

function TrptCartaDocHeader.Is_RemitenteEspecialCorreoArgentino: Boolean;
begin
  Result := (FRemitenteCorreo and (FCorreo = tcArgentino) and
            {$IFDEF ART2}
            (Sesion.Delegacion = ID_DLG_CENTRAL))
            {$ELSE}
            (StrToInt(Sesion.Delegacion) = ID_DLG_CENTRAL))
            {$ENDIF}
            ;
end;

function TrptCartaDocHeader.Get_DatosRemitenteDelegacion(Id: TTableId; var Domicilio, Localidad, CPostal, Provincia: String): Boolean;
var
  bHayDatos: Boolean;
  sdqConsulta: TSDQuery;
  Sql: String;
begin
  Sql :=
    'SELECT ART.UTILES.ARMAR_DOMICILIO(EL_CALLE, EL_NUMERO, EL_PISO, EL_DEPARTAMENTO, NULL) DOMICILIO,' +
          ' EL_LOCALIDAD LOCALIDAD, NVL(EL_CPOSTALA, EL_CPOSTAL) CPOSTAL, PV_DESCRIPCION PROVINCIA' +
     ' FROM CPV_PROVINCIAS, DEL_DELEGACION' +
    ' WHERE EL_PROVINCIA = PV_CODIGO(+)' +
      ' AND EL_ID = ' + SqlInt(Id);

  sdqConsulta := GetQuery(Sql);
  try
    bHayDatos := not sdqConsulta.IsEmpty;

    if bHayDatos then
      with sdqConsulta do
      begin
        Domicilio := FieldByName('DOMICILIO').AsString;
        Localidad := FieldByName('LOCALIDAD').AsString;
        CPostal   := FieldByName('CPOSTAL').AsString;
        Provincia := FieldByName('PROVINCIA').AsString;
      end
    else
    begin
      Domicilio := '';
      Localidad := '';
      CPostal   := '';
      Provincia := '';
    end;
  finally
    sdqConsulta.Free;
  end;

  Result := bHayDatos;
end;

procedure TrptCartaDocHeader.qrbPageFooterBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if FImprimirFirmaSoloAlFinal then
    PrintBand := FSummaryImpreso
  else
    PrintBand := (TipoSalida = tsCartaDocumento) or (TipoSalida = tsCartaComercial) or
                 (TipoSalida = tsVentanillaElectronica) or ForzarFirmantePie;
end;

procedure TrptCartaDocHeader.SetTipoModulo(const Value: TTipoModulo);
begin
  FTipoModulo := Value;

  qrlSector.Enabled := True;

  case Modulo of
    taAfiliaciones:
      qrlSector.Caption := 'AFILIACIONES';
    taAreaMedica:
      qrlSector.Caption := 'AREA MEDICA';
    taAreaMedlab:
      qrlSector.Caption := 'AREA MEDICINA LABORAL';
    taCobranzas:
      qrlSector.Caption := 'COBRANZAS';
    taEmision:
      qrlSector.Caption := 'EMISION';
    taLegales:
      qrlSector.Caption := 'AREA LEGALES';
    taRecalificacion:
      qrlSector.Caption := 'AREA RECALIFICACION';
    else
      qrlSector.Caption := '';
  end;
end;

procedure TrptCartaDocHeader.SetImprimirFirma(const Value: Boolean);
begin
  if FImprimirFirma <> Value then
  begin
    FImprimirFirma := Value;
    qriFirma.Enabled := Value;
  end;
end;

procedure TrptCartaDocHeader.SetTextoDestinatario(const Value: String);
begin
  if FTextoDestinatario <> Value then
    FTextoDestinatario := Value;
end;

procedure TrptCartaDocHeader.AjusteLargo(Componente1, Componente2: TARTQrLabel; var aValue: String);
var
  iPos: Integer;
begin
  if FNumImpresion <= 1 then
  begin
    Componente2.Caption := '';
    if Length(Componente1.Caption) > 45 then
    begin
      for iPos := 45 downto 0 do
        if Componente1.Caption[iPos] = ' ' then
        begin
          Componente2.Caption := Trim(Copy(Componente1.Caption, iPos + 1, MAXINT));
          Componente1.Caption := Trim(Copy(Componente1.Caption, 1, iPos - 1));
          Break;
        end;
      aValue := Componente1.Caption;
    end;
  end;
end;

procedure TrptCartaDocHeader.qrlDestDomicilioPrint(Sender: TObject; var Value: String);
begin
  AjusteLargo(qrlDestDomicilio, qrlDestDomicilio_Abajo, Value);
end;

procedure TrptCartaDocHeader.qrlDestNombrePrint(Sender: TObject; var Value: String);
begin
  AjusteLargo(qrlDestNombre, qrlDestNombre_Abajo, Value);
end;

procedure TrptCartaDocHeader.qrlDestDomicilio1Print(Sender: TObject; var Value: String);
begin
  AjusteLargo(qrlDestDomicilio1, qrlDestDomicilio1_Abajo, Value);
end;

procedure TrptCartaDocHeader.qrlDestNombre1Print(Sender: TObject; var Value: String);
begin
  AjusteLargo(qrlDestNombre1, qrlDestNombre1_Abajo, Value);
end;

procedure TrptCartaDocHeader.ArrangeControls_DatosFirmanteCartaComercial;
begin
  with qrlFirmante do
  begin
    Left               := 0;
    Top                := IIF(ImprimirFirma, qriFirma.Top + qriFirma.Height, 0) + 2;
    Width              := 230;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlCaracter do
  begin
    Left               := 0;
    Top                := qrlFirmante.Top + qrlFirmante.Height;
    Width              := 230;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  with qrlDocumento do
  begin
    Left               := 0;
    Top                := qrlCaracter.Top + qrlCaracter.Height;
    Width              := 230;
    Height             := 17;
    Alignment          := taCenter;
    AutoSize           := False;
  end;

  qrbPageFooter.Height := qrlDocumento.Top + qrlDocumento.Height + 20;
end;

procedure TrptCartaDocHeader.ArrangeControls_FirmaCartaComercial;
begin
  if ImprimirFirma then
  begin
    FFirmaPos.x := 0 + (230 div 2);
    FFirmaPos.y := 10 + 50;
  end;
end;

procedure TrptCartaDocHeader.qrbPageHeader2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (TipoSalida <> tsCartaDocumento) and MostrarLogo;

// El logo debe ir hacía la derecha ahora..
//  qrLogo.Left := (qrbPageHeader2.Width - qrLogo.Width) div 2;
  qrLogo.Left := qrbPageHeader2.Width - qrLogo.Width;
end;

procedure TrptCartaDocHeader.SetMostrarLogo(const Value: Boolean);
begin
  if FMostrarLogo <> Value then
  begin
    FMostrarLogo := Value;
    qrLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');

    with qrbPageHeader2 do
    begin
      Left   := 19;
      Top    := 15;
      Width  := 778;

// Se saca el espacio de abajo porque el mismo está puesto en la imagen..
//      Height := qrLogo.Top + qrLogo.Height + 20;
      Height := qrLogo.Top + qrLogo.Height;
    end;

// El logo debe ir hacía la derecha ahora..
//    qrLogo.Left := (qrbPageHeader2.Width - qrLogo.Width) div 2;
    qrLogo.Left := qrbPageHeader2.Width - qrLogo.Width;
  end;
end;

procedure TrptCartaDocHeader.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  iNroCartaDoc: Integer;
  sNroCartaDoc, sSql, sVentanilla: String;
begin
  if ((FTipoSalida = tsCartaDocumento) and (Self.Accion = aPrint)) or // Si es una carta documento y se mandó a imprimir..
     FVentanilla then //si sale por ventanilla, tambien se debe generar el pdf..
  begin
    sSql := 'SELECT 1' +
             ' FROM cca_carta' +
            ' WHERE ca_id = :idcarta ' +
              ' AND ca_nrocartadoc IS NULL' +
              ' AND ca_fechaimpresion IS NULL';
    if ExisteSqlEx(sSql, [IdCarta]) then   // Si no tiene número de carta documento y no fue impresa todavía..
    begin
      iNroCartaDoc := GetNroCartaDocReducido(Modulo);
      if iNroCartaDoc > 0 then
      begin
        sVentanilla  := IIF(Ventanilla, ', ca_ventanilla = ''S'', ca_incluirenremito = ''N'' ', '');
        sNroCartaDoc := GetNroCartaDocCompleto(iNroCartaDoc, Modulo);
        sSql := 'UPDATE cca_carta' +
                  ' SET ca_nrocartadoc = DECODE(CA_TIPOSALIDA, ' + SqlValue(SALIDA_CARTADOCUMENTO) + ', ' +
                                                                   SqlValue(sNroCartaDoc) + ', CA_NROCARTADOC)' +
                        sVentanilla +
               ' WHERE ca_id = ' + SqlValue(IdCarta);
        EjecutarSqlSt(sSql, TransactionMode);
      end;
    end;
  end;
  FSummaryImpreso := False;
  Inc(FNumImpresion);
end;

procedure TrptCartaDocHeader.qrbSummaryAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  FSummaryImpreso := True;
end;

procedure TrptCartaDocHeader.SetImprimirDelegOrden(aImprimir :Boolean);
var
//  bImprUsuario: String;
  sdqConsulta: TSDQuery;
  sSql, sAreaCarta: String;
  codgp: integer;
begin
  codgp := 0;
  if aImprimir then
  begin
    sSql := 'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ex_delegacion,' +
                  ' gp_nombre || decode(ex_gestor, null, null, '' - '' || ex_gestor) gp_nombre, ca_idtextocarta,' +  // Lu TK 1985 agrego el ca_idtextocarta
                  ' ca_idhistoricotextocarta' +
             ' FROM sex_expedientes, cca_carta, mgp_gtrabajo' +
            ' WHERE ex_id = ca_idexpediente' +
              ' AND ex_gtrabajo = gp_codigo' +
              ' AND ca_id = :idcarta ';
    sdqConsulta := GetQueryEx(sSql, [FIdCarta]);
    try
      sSql := 'SELECT at_area' +             // TK 27274
               ' FROM cat_areatexto, cta_textoarea, comunes.cht_historicotextocarta, cca_carta' +
              ' WHERE at_id = ta_idareatexto' +
                ' AND ta_idtextocarta = ht_idtextocarta' +
                ' AND ht_id = ca_idhistoricotextocarta' +
                ' AND ca_id = :idcarta ' +
                ' AND ta_fechabaja is null ';  // TK 20297, agregue esto porque traia las dadas de baja.

      sAreaCarta := ValorSqlEx(sSql, [FIdCarta]);

      if sAreaCarta = AREACARTA_PRESDIN then        // 80 = Prestaciones Dinerarias
        qrlDelegacion.Caption := CAD_PRESTDIN
      else if sAreaCarta = AREACARTA_INCAP then     // 35 = Eventos de Incapacidad TK 27274
        qrlDelegacion.Caption := CAD_INCAPACIDADES
      else
      begin
        qrlDelegacion.Caption := sdqConsulta.FieldByName('GP_NOMBRE').AsString;

        ssql := ' select ca_marcagrupomixto, EX_SINMIXSEROL, EX_SINMIXODONT ' +
                  ' from cca_carta, sex_expedientes ' +
                 ' where ca_id = :idcarta and ex_id = ca_idexpediente ';

        with GetQueryEx(ssql, [SqlInt(FIdCarta)]) do
        Try
          if FieldByName('ca_marcagrupomixto').AsString = 'S' then
          begin
            if FieldByName('EX_SINMIXSEROL').AsString = 'S' then
              codgp := 6
            else
              if FieldByName('EX_SINMIXODONT').AsString = 'S' then
                codgp := 88;
            ssql := ' select gp_nombre from ART.mgp_gtrabajo ' +
                     ' where gp_codigo = :cod ';
            qrlDelegacion.Caption := ValorSqlEx(ssql, [codgp]);
          end;
        finally
          free;
        end;

      end;

      if (Sesion.Sector = 'PRESDIN') then
        qrlDelegacionPie.Caption := ' '
      else
        qrlDelegacionPie.Caption := sdqConsulta.FieldByName('GP_NOMBRE').AsString;     // Lu TK 1985 por ticket de Ariel de Luca de Prestaciones dinerarias

      qrlOrden.Caption          := sdqConsulta.FieldByName('SINIESTRO').AsString + ' ' +
                                   IIF(sdqConsulta.FieldByName('EX_DELEGACION').IsNull,'',
                                   'DEL' + sdqConsulta.FieldByName('EX_DELEGACION').AsString);  // Lu TK 5591, pongo aca la delegacion y no en otro QRLabel porque asi me queda centrado y se aprobecha mas el espacio por el codigo de barras de al lado.
      qrlOrdenPie.Caption       := sdqConsulta.FieldByName('SINIESTRO').AsString;
    finally
      sdqConsulta.Free;
    end;
  end;
  qrlDelegacion.Enabled     := aImprimir and not FImprimirSoloOrden;
  qrlDelegacionPie.Enabled  := aImprimir and not FImprimirSoloOrden;
  qrlOrden.Enabled          := aImprimir;
  qrlOrdenPie.Enabled       := aImprimir and not FImprimirSoloOrden;
end;

procedure TrptCartaDocHeader.AjustarLabel(aLabel: TArtQRLabel; const aFontSize, aHeight, aTop: Integer);
begin
  if Canvas.TextWidth(aLabel.Caption) > aLabel.Width then
    with aLabel do
    begin
      Font.Size := afontSize;
      Height := aHeight;
      Top := Top - aTop;
    end;
end;

procedure TrptCartaDocHeader.SetImprimirLeyendaAcuse(const Value: Boolean);
var
  sSql :String;
begin
  if FImprimirLeyendaAcuse <> Value then
  begin
    FImprimirLeyendaAcuse   := Value;
    qrlLeyendaAcuse.Enabled := Value;

    if FImprimirLeyendaAcuse then
    begin
      sSql := 'SELECT ht_leyendaacuse leyendaacuse' +
               ' FROM comunes.cht_historicotextocarta, cca_carta' +
              ' WHERE ca_idhistoricotextocarta = ht_id' +
                ' AND ca_id = :IdCarta';
      with GetQueryEx(sSql, [FIdCarta]) do
      try
        if FieldByName('LEYENDAACUSE').IsNull then
          qrlLeyendaAcuse.Enabled := False
        else
          qrlLeyendaAcuse.Caption := FieldByName('LEYENDAACUSE').AsString;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TrptCartaDocHeader.SetInfoPie(CodTextoCartaInfoPie: String);
var
  sSql: String;
begin
  sSql := 'SELECT tc_texto texto' +
           ' FROM ctc_textocarta' +
          ' WHERE tc_codigo = ' + SqlValue(CodTextoCartaInfoPie);

  {$IFDEF SHEINO}
  BlobSql(sSql, qrmInfoPie.Lines)
  {$ELSE}
  with GetQuery(sSql) do
  try
    qrmInfoPie.Lines.Assign(FieldByName('TEXTO'))
  finally
    Free;
  end;
  {$ENDIF}

  qrmInfoPie.Enabled := (CodTextoCartaInfoPie <> '');
end;

procedure TrptCartaDocHeader.QuickRepAfterPrint(Sender: TObject);
begin
  DoActualizarDatosImpresionCartaDocumento(IdCarta);
end;

function TrptCartaDocHeader.Is_MostrarFranqueoAPagar: Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT TRUNC(CA_FECHAALTA) ' +
            'FROM CCA_CARTA ' +
           'WHERE CA_ID = :IdCarta';

  Result := ((Correo = tcArgentino) and (TipoSalida = tsCartaDocumento) and
             (ValorSqlDateTimeEx(sSql, [IdCarta]) >= StrToDate('10/04/2015')));
end;

procedure TrptCartaDocHeader.Do_MostrarFranqueoAPagar;
var
  bMostrar: Boolean;
begin
  bMostrar := Is_MostrarFranqueoAPagar();

  QRPSFranqueo1A.Enabled := bMostrar;
  QRPSFranqueo2A.Enabled := bMostrar;
  QRPSFranqueo3A.Enabled := bMostrar;
  QRLFranqueo4A.Enabled  := bMostrar;
  QRLFranqueo5A.Enabled  := bMostrar;
  QRALFranqueo6A.Enabled := bMostrar;

  QRPSFranqueo1B.Enabled := bMostrar;
  QRPSFranqueo2B.Enabled := bMostrar;
  QRPSFranqueo3B.Enabled := bMostrar;
  QRLFranqueo4B.Enabled  := bMostrar;
  QRLFranqueo5B.Enabled  := bMostrar;
  QRALFranqueo6B.Enabled := bMostrar;

  if bMostrar then
    case Correo of
      tcArgentino: ArrangeControlsFranqueoAPagar_Argentino;
    end;
end;

procedure TrptCartaDocHeader.CopyControlsFranqueoAPagar(DesplazamientoVert, DesplazamientoHoriz: Integer);
begin
  with QRPSFranqueo1B do
    begin
      Left   := QRPSFranqueo1A.Left + DesplazamientoHoriz;
      Top    := QRPSFranqueo1A.Top + DesplazamientoVert;
      Width  := QRPSFranqueo1A.Width;
      Height := QRPSFranqueo1A.Height;
    end;

  with QRPSFranqueo2B do
    begin
      Left   := QRPSFranqueo2A.Left + DesplazamientoHoriz;
      Top    := QRPSFranqueo2A.Top + DesplazamientoVert;
      Width  := QRPSFranqueo2A.Width;
      Height := QRPSFranqueo2A.Height;
    end;

  with QRPSFranqueo3B do
    begin
      Left   := QRPSFranqueo3A.Left + DesplazamientoHoriz;
      Top    := QRPSFranqueo3A.Top + DesplazamientoVert;
      Width  := QRPSFranqueo3A.Width;
      Height := QRPSFranqueo3A.Height;
    end;

  with QRLFranqueo4B do
    begin
      Caption := QRLFranqueo4A.Caption;
      Left    := QRLFranqueo4A.Left + DesplazamientoHoriz;
      Top     := QRLFranqueo4A.Top + DesplazamientoVert;
      Width   := QRLFranqueo4A.Width;
      Height  := QRLFranqueo4A.Height;
    end;

  with QRLFranqueo5B do
    begin
      Caption := QRLFranqueo5A.Caption;
      Left    := QRLFranqueo5A.Left + DesplazamientoHoriz;
      Top     := QRLFranqueo5A.Top + DesplazamientoVert;
      Width   := QRLFranqueo5A.Width;
      Height  := QRLFranqueo5A.Height;
    end;

  with QRALFranqueo6B do
    begin
      Caption  := QRALFranqueo6A.Caption;
      Left     := QRALFranqueo6A.Left + DesplazamientoHoriz;
      Top      := QRALFranqueo6A.Top + DesplazamientoVert;
      Width    := QRALFranqueo6A.Width;
      Height   := QRALFranqueo6A.Height;
    end;
end;

procedure TrptCartaDocHeader.ArrangeControlsFranqueoAPagar_Argentino;
const
  CORREO         = 'CORASA';
  CODIGOCLIENTE  = '12658';
  DESPLAZ_VERT   =  359;
  DESPLAZ_HORIZ  =  0;
begin
  with QRPSFranqueo1A do
    begin
      Left   := 556;
      Top    := 23;
      Width  := 114;
      Height := 41;
    end;

  with QRPSFranqueo2A do
    begin
      Left   := 574;
      Top    := 39;
      Width  := 96;
      Height := 11;
    end;

  with QRPSFranqueo3A do
    begin
      Left   := 572;
      Top    := 23;
      Width  := 4;
      Height := 41;
    end;

  with QRLFranqueo4A do
    begin
      Caption := CODIGOCLIENTE;
      Left    := 577;
      Top     := 49;
      Width   := 92;
      Height  := 11;
    end;

  with QRLFranqueo5A do
    begin
      Left   := 577;
      Top    := 28;
      Width  := 92;
      Height := 11;
    end;

  with QRALFranqueo6A do
    begin
      Caption     := CORREO;
      Left        := 559;
      Top         := 4;
      Width       := 40;       // el width y height del TQRAngledLabel tienen que ser mucho más grandes que lo necesario porque sinó salen mal en la impresión...tienen un problema al imprimirse
      Height      := 130;
      Transparent := True;
    end;

  CopyControlsFranqueoAPagar(DESPLAZ_VERT, DESPLAZ_HORIZ);
end;

end.


