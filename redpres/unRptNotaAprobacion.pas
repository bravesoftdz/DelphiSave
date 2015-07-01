unit unRptNotaAprobacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unRptMoldeCarta, Db, SDEngine, QRCtrls, QuickRpt, ExtCtrls, unVisualizador, unComunes, unrptcomunes;

type
  TrptNotaAprobacion = class(TqrMoldeCarta)
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
    sdqNotaAprobacion: TSDQuery;
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
    function PasarCantidadAHoras(cant: string): string;
  public
    constructor Create(AOwner: TComponent); override;
    property  Codigo:    string read GetCodigo    write SetCodigo;
    property  Area:      string read GetArea      write SetArea;
    property  Prestador: string read GetPrestador write SetPrestador;
    property  Domicilio: string read GetDomicilio write SetDomicilio;
    property  Referente: string read GetReferente write SetReferente;
    property  GTrabajo:  string read FGTrabajo    write SetGTrabajo;
    property  Delegacion:string read FDelegacion  write SetDelegacion;
    procedure Imprimir(idautorizacion: integer; sAgregado: string = '');
    {function  Ejecutar(Opciones: TOpcionesVisualizador = [];
                       Sector: String = ''; Clave: String = ''; TipoDoc: String = '';
                       TipoDest: String = ''; Telefono: String = ''; RazonSocial: String = '';
                       IdDest: Integer = 0; iSiniestro: Integer = 0; esAnulacion: boolean = false): TResultados; virtual;


    procedure DoActualizarImpresionAutorizacion(iSiniestro, iOrden, iRecaida, iNumeroAutorizacion: Integer;
                                                         Accion: TResultados = []);
    function GetRelaciones(IdAuto: integer) :String;
    function LugarImpresion(sUsuario: String = ''): String;
    function GetFechaAprobacion: TDateTime;}
    property MuestraSaludo: boolean read GetMuestraSaludo write SetMuestraSaludo;
  end;

var
  rptNotaAprobacion: TrptNotaAprobacion;
  Siniestro, iIdExpediente: integer;

implementation

uses
  unDmPrincipal, Internet, unSesion, Math, strfuncs, unart, general, ansisql, strutils;

{$R *.DFM}

constructor TrptNotaAprobacion.Create(AOwner: TComponent);
begin
  inherited;
  //Valores por Default
  Codigo        := 'AUR';
  Area          := 'AMED';
  MuestraSaludo := False;
  Siniestro     := 0;
end;

procedure TrptNotaAprobacion.Imprimir(idautorizacion: integer; sAgregado: string = '');
var usuarioaprob, nrodoc, firmante, vReferente, vRelaciones, sTmp, sAsunto: string; Anulada, ImpAproTras: boolean;
    Resultado: TResultados;
begin

  sdqNotaAprobacion.ParamByName('idautorizacion').AsInteger := idautorizacion;
  OpenQuery(sdqNotaAprobacion);

  sAsunto := '';
  if (sdqNotaAprobacion.FieldByName('AU_ESTADO').AsString = 'U') or (sdqNotaAprobacion.FieldByName('AU_ESTADO').AsString = 'N') or
     (sdqNotaAprobacion.FieldByName('AU_ESTADO').AsString = 'V') then
  begin
    Anulada := true;
    sAsunto := 'ANULACIÓN DE AUTORIZACIÓN';
  end
  else
  begin
    Anulada := false;
    sAsunto := 'Nota de Aprobación';
  end;

  Siniestro     := sdqNotaAprobacion.FieldByName('au_siniestro').AsInteger;

  iIdExpediente := sdqNotaAprobacion.FieldByName('au_idexpediente').AsInteger;

  ShowLogoGBP  := False;
  ShowLogoART  := True;
  ShowDatosART := False;

  Fecha := GetFechaAprobacion(idautorizacion);
  Lugar := LugarImpresion(idautorizacion);
  EMail := sdqNotaAprobacion.fieldbyname('ca_direlectronica').AsString;
  Name  := ClassName + '_NotaDeAprobacion';

  If Anulada then
  begin
    qrlAnulado.Caption     := 'AUTORIZACIÓN ANULADA';
    qrlAnulado.Font.Color  := clRed;
    qrlAnulado.enabled := true;
  end;


  //ReportTitle := 'Nota de Aprobación - Siniestro ' + sdqNotaAprobacion.fieldbyname('siniestrocomp').AsString + ' - ' +
                 //sdqNotaAprobacion.fieldbyname('tj_nombre').AsString + ' - DNI ' + sdqNotaAprobacion.fieldbyname('tj_documento').AsString;   // Lu TK 5303 se agrego esto al asunto del mail.

  Prestador := InitCap(sdqNotaAprobacion.fieldbyname('ca_descripcion').AsString) + ' (' + sdqNotaAprobacion.fieldbyname('ca_identificador').AsString + ')';
  Domicilio := InitCap(InitCap(sdqNotaAprobacion.fieldbyname('ca_domicilio').AsString)) + CRLF +
               '(' + InitCap(sdqNotaAprobacion.fieldbyname('ca_codpostal').AsString) + ') - ' + InitCap(sdqNotaAprobacion.fieldbyname('ca_localidad').AsString) + CRLF +
               InitCap(sdqNotaAprobacion.fieldbyname('pv_descripcion').AsString) +
               IIF(sdqNotaAprobacion.fieldbyname('ap_ca_telefono').AsString <> '', CRLF + 'Tel: ' + sdqNotaAprobacion.fieldbyname('ap_ca_telefono').AsString, '');
               IIF(sdqNotaAprobacion.fieldbyname('ca_fax').AsString <> '', CRLF + 'Fax: ' + sdqNotaAprobacion.fieldbyname('ca_fax').AsString, '');

  vReferente := 'Damnificado: ' + InitCap(sdqNotaAprobacion.fieldbyname('tj_nombre').AsString) + CRLF + '';

  //camarillo - 09/05/2006 - domicilio y telefono del paciente para las aut. de medicamentos y ortopedia
  //if (sdqNotaAprobacion.fieldbyname('PR_FORMULARIO').AsString = 'M') or //medicamento
  //   (sdqNotaAprobacion.fieldbyname('PR_FORMULARIO').AsString = 'P') then //ortopedia
  //begin
  vReferente := vReferente + 'Dirección: ' + InitCap(sdqNotaAprobacion.fieldbyname('domiciliopaciente').AsString) + CRLF +
                             'Localidad: ' + InitCap(sdqNotaAprobacion.fieldbyname('localidadpaciente').AsString) + CRLF;
 // end;
  vReferente := vReferente + 'D.N.I.: ' + sdqNotaAprobacion.fieldbyname('TJ_documento').AsString + CRLF +
                              IIF(not(sdqNotaAprobacion.fieldbyname('TELEFONO').IsNull),
                             'Teléfono: ' + sdqNotaAprobacion.fieldbyname('TELEFONO').AsString + CRLF + '','') +    //ticket 48050
                             'F. Nacimiento: ' + sdqNotaAprobacion.fieldbyname('tj_fnacimiento').AsString + CRLF +
                             'Empresa: ' + sdqNotaAprobacion.fieldbyname('em_nombre').AsString + CRLF +
                             'Fecha de Ocurrencia: ' + sdqNotaAprobacion.fieldbyname('ex_fechaaccidente').AsString  + CRLF +
                             'Denuncia Nº:' + sdqNotaAprobacion.fieldbyname('siniestrocomp').AsString + CRLF +
                             'Autorización Nº: ' + sdqNotaAprobacion.fieldbyname('au_numauto').AsString + CRLF +
                             'Fecha de Solicitud: ' + sdqNotaAprobacion.fieldbyname('au_fechasoli').AsString;
  Referente := vReferente;

  with qrmDetalle do
  begin

    sTmp := sdqNotaAprobacion.fieldbyname('cantidad').AsString;
    if sdqNotaAprobacion.FieldByName('prestacion').AsString = '449101' then    //ESPERA EN REMIS - DFG 91111
      sTmp := sdqNotaAprobacion.fieldbyname('au_tiempoespera').AsString
    else
    begin
      if StrTofloat(sTmp) <= 1 then
        sTmp := ''
      else
        sTmp := sTmp + ' ';
    end;

    ImpAproTras := (ExisteSqlEX('SELECT au_tdesde' +
                         ' FROM sau_autorizaciones' +
                        ' WHERE au_id = :idauto ', [idautorizacion])) and (sdqNotaAprobacion.fieldbyname('PR_FORMULARIO').AsString = 'T');


    if (sdqNotaAprobacion.fieldbyname('PR_FORMULARIO').AsString = 'A') or ImpAproTras then
    begin
      Lines.Add('Por medio de la presente, nos comunicamos con Uds. a fin de informarles que se autoriza: ' + sTmp + ' ' +
                 sdqNotaAprobacion.fieldbyname('pr_descripcion').asstring + ' - ' +
                 sdqNotaAprobacion.fieldbyname('detalle').asstring + ' ');

      if (sdqNotaAprobacion.fieldbyname('AU_PRESSOL').Value <> sdqNotaAprobacion.fieldbyname('AU_PRESAPRO').Value)
      or ((sdqNotaAprobacion.fieldbyname('AU_PRESSOL').Value = sdqNotaAprobacion.fieldbyname('AU_PRESAPRO').Value)
      and  (sdqNotaAprobacion.fieldbyname('au_cantidad').Value <> sdqNotaAprobacion.fieldbyname('au_cantapro').Value)) then
        Lines.Add(sAgregado);

      if (TRIM(sdqNotaAprobacion.fieldbyname('au_turno').AsString) <> '/  /') then   // Lo cambie porque con el ".date <> 0" en algunos casos no andaba
        Lines.Add ('Turno para el día ' + sdqNotaAprobacion.fieldbyname('au_turno').AsString);

      if (sdqNotaAprobacion.fieldbyname('au_turnohora').AsString <> '  :  ') then
        Lines.Add (' a las ' + sdqNotaAprobacion.fieldbyname('au_turnohora').AsString  + 'Hs. ');

      Lines.Add('');
      Lines.Add('');

      if sdqNotaAprobacion.fieldbyname('ex_diagnostico').AsString <> '' then
        Lines.Add('Diagnóstico: ' + sdqNotaAprobacion.fieldbyname('ex_diagnostico').AsString);
    end
    else
      if sdqNotaAprobacion.fieldbyname('PR_FORMULARIO').AsString = 'S' then
      begin
        Lines.Add('Por medio de la presente, nos comunicamos con Uds. a fin de informarles que se autoriza: ' + sTmp + ' ' +
        Nvl(sdqNotaAprobacion.fieldbyname('detalle').asstring, sdqNotaAprobacion.fieldbyname('au_observacionesimpresion').asstring));

        Lines.Add('La presente autorización se genera en el área de Control de Accidentes Biológicos. ' +
                  'La misma deberá ser acompañada de los resultados de laboratorio correspondiente con la ' +
                  'firma y sello del profesional que realiza los mismos en un plazo no mayor a 48hs.');
        Lines.Add('El pago de la facturación quedará sujeto al envío de los informes correspondientes ' +
                  'en tiempo y forma los que deberán ser remitidos al número 4338-4700 int. 4717.');
        Lines.Add('');
        Lines.Add('');
      end
      else
        if sdqNotaAprobacion.fieldbyname('pr_formulario').asstring = 'M' then
        begin
          Lines.Add('Por medio de la presente, solicitamos a Uds. la provisión de los medicamentos según receta adjunta, ' +
                    'con cargo a esta Red Prestacional.');

          Lines.Add(sdqNotaAprobacion.fieldbyname('detalle').asstring);
        end;

    if ((not sdqNotaAprobacion.fieldbyname('au_pres_nomenclador').IsNull) and
        (not sdqNotaAprobacion.fieldbyname('au_pres_capitulo').IsNull) and
        (not sdqNotaAprobacion.fieldbyname('au_pres_codigo').IsNull)) then
    begin
      Lines.Add('');
      Lines.Add('Prestación Modulada/Nomenclada:' + sdqNotaAprobacion.fieldbyname('au_pres_nomenclador').asstring + ' - ' +
                                                    sdqNotaAprobacion.fieldbyname('au_pres_capitulo').asstring + ' - ' +
                                                    sdqNotaAprobacion.fieldbyname('au_pres_codigo').asstring + ' ' +
                ValorSql('SELECT on_descripcion FROM son_nomenclador ' +
                         ' WHERE on_nomenclador = ' + SqlValue(sdqNotaAprobacion.fieldbyname('au_pres_nomenclador').asstring) +
                           ' AND on_capitulo = ' + SqlValue(sdqNotaAprobacion.fieldbyname('au_pres_capitulo').asstring) +
                           ' AND on_codigo = ' + SqlValue(sdqNotaAprobacion.fieldbyname('au_pres_codigo').asstring) )  +
                  IIF((sdqNotaAprobacion.fieldbyname('au_pres_capitulo').asstring = 'PP'), ' - Valor: ' + sdqNotaAprobacion.fieldbyname('importe').asstring , ''));    // TK 22180
    end
    else if sdqNotaAprobacion.fieldbyname('on_codigo').asstring <> '' then
    begin
      Lines.Add('Prestación Modulada/Nomenclada:' + sdqNotaAprobacion.fieldbyname('on_nomenclador').asstring + ' - ' +
                                                    sdqNotaAprobacion.fieldbyname('on_capitulo').asstring + ' - ' +
                                                    sdqNotaAprobacion.fieldbyname('on_codigo').asstring + ' ' +
                                                    sdqNotaAprobacion.fieldbyname('on_descripcion').asstring +
                IIF((sdqNotaAprobacion.fieldbyname('on_capitulo').asstring = 'PP'), ' - Valor: ' + sdqNotaAprobacion.fieldbyname('importe').asstring, ''));   // TK 22180
    end;

    vRelaciones := GetRelaciones(idautorizacion);
    if not IsEmptyString(vRelaciones) then
    begin
      Lines.Add('Prestación/es relacionada/s: ');
      Lines.Add (vRelaciones);
    end;

    Lines.Add ('');

    //Si fue una DERIVACION se le agrega el Prestador Solicitante tambien.
    if sdqNotaAprobacion.fieldbyname('au_identifprestador').asstring <> sdqNotaAprobacion.fieldbyname('au_identifapro').asstring then
    begin
      Lines.Add('Prestador Solicitante:');
      Lines.Add(sdqNotaAprobacion.fieldbyname('pressol').asstring);
      Lines.Add(sdqNotaAprobacion.fieldbyname('domsol').asstring);
      Lines.Add('(' + sdqNotaAprobacion.fieldbyname('cpsol').asstring + ')-' + sdqNotaAprobacion.fieldbyname('locsol').asstring);
      Lines.Add(InitCap(sdqNotaAprobacion.fieldbyname('provsol').asstring));
      Lines.Add(sdqNotaAprobacion.fieldbyname('telsol').asstring);
    end;

    Lines.Add('');
    Lines.Add('');
    Lines.Add('');
    Lines.Add('');

    Lines.Add('Prestación sujeta a Auditoría Posterior');
    Lines.Add('');
    Lines.Add('');

    Lines.Add('Observaciones: ' + sdqNotaAprobacion.fieldbyname('au_observacionesimpresion').asstring);
    Lines.Add('');

    firmante := ValorSqlEx('SELECT INITCAP(fi_firmante) ' +
                                      ' FROM cfi_firma ' +
                                     ' WHERE fi_id = :IdFirma ', [sdqNotaAprobacion.FieldByName('AU_AVAL').AsInteger]);
    NroDoc := ValorSqlEx('SELECT UPPER(fi_documento) ' +
                                              ' FROM cfi_firma ' +
                                             ' WHERE fi_id = :IdFirma', [sdqNotaAprobacion.FieldByName('AU_AVAL').AsInteger]);

    if sdqNotaAprobacion.FieldByName('AU_USUAPRO').AsString = '' then
      usuarioaprob := Sesion.Usuario
    else
      usuarioaprob := ValorSqlEX('SELECT se_nombre FROM use_usuarios WHERE se_usuario = :usuario ', [sdqNotaAprobacion.FieldByName('AU_USUAPRO').AsString]);

    //---[Aval, Nro.Documento, Caracter y Usuario de aprobación]-------------
    Lines.Add('Aval: ' + firmante + ' - ' + nrodoc);
    Lines.Add('');
    Lines.Add('');
    Lines.Add('Gestionó: ' + InitCap(usuarioaprob));

    qrlGTrabajo.Caption   := sdqNotaAprobacion.fieldbyname('gp_nombre').asstring;
    qrlDelegacion.Caption := sdqNotaAprobacion.fieldbyname('lg_nombre').asstring;

  end;

  Resultado := Visualizar(self, GetValores(sAsunto + ' - ' + sdqNotaAprobacion.fieldbyname('siniestrocomp').AsString + ' - ' + LeftStr(sdqNotaAprobacion.FieldByName('tj_nombre').AsString, 25) + ' - DNI ' + sdqNotaAprobacion.FieldByName('tj_documento').AsString, sdqNotaAprobacion.FieldByName('ca_direlectronica').AsString),
                          GetValoresFax('AMED', sdqNotaAprobacion.fieldbyname('siniestrocomp').AsString, 'F' {TipoDoc}, 'P' {TipoDest},
                          sdqNotaAprobacion.FieldByName('ca_fax').AsString {Telefono}, sdqNotaAprobacion.FieldByName('ca_descripcion').AsString {Nombre},
                          sdqNotaAprobacion.FieldByName('ca_identificador').AsInteger {IdDest}), [oAlwaysShowDialog, oForceDB, oForceShowModal]);

  DoActualizarImpresionAutorizacion(sdqNotaAprobacion.fieldbyname('au_id').AsInteger, Resultado);

end;


function TrptNotaAprobacion.GetArea: string;
begin
  Result := sdqHeader.ParamByName('Area').AsString;
end;

function TrptNotaAprobacion.GetCodigo: string;
begin
  Result := qrlCodigo.Caption;
end;

function TrptNotaAprobacion.GetDomicilio: string;
begin
  Result := qrmDomicilio.Lines.Text;
end;

function TrptNotaAprobacion.GetMuestraSaludo: boolean;
begin
  Result := qrlSaludoFinal.Enabled;
end;

function TrptNotaAprobacion.GetPrestador: string;
begin
  Result := qrlPrestador.Caption;
end;

function TrptNotaAprobacion.GetReferente: string;
begin
  Result := qrmReferente.Lines.Text;
end;

procedure TrptNotaAprobacion.qrbPageHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  // Logo de la gobernacion o de ART
  if Is_SiniestroDeGobernacion(iIdExpediente) then
    qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB')
  else
    qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
end;

procedure TrptNotaAprobacion.SetArea(const Value: string);
begin
  sdqHeader.ParamByName('Area').AsString := Value;
end;

procedure TrptNotaAprobacion.SetCodigo(const Value: string);
begin
  qrlCodigo.Caption := Value;
end;

procedure TrptNotaAprobacion.SetDomicilio(const Value: string);
begin
  qrmDomicilio.Lines.Text := Value;
end;

procedure TrptNotaAprobacion.SetMuestraSaludo(const Value: boolean);
begin
  qrlSaludoFinal.Enabled := Value;
end;

procedure TrptNotaAprobacion.SetPrestador(const Value: string);
begin
  qrlPrestador.Caption := Value;
end;

procedure TrptNotaAprobacion.SetReferente(const Value: string);
begin
  qrmReferente.Lines.Text := Value;
end;

procedure TrptNotaAprobacion.SetGTrabajo(const Value: string);
begin
  qrlGTrabajo.Caption := Value;
end;

procedure TrptNotaAprobacion.SetDelegacion(const Value: string);
begin
  qrlDelegacion.Caption := Value;
end;

function TrptNotaAprobacion.PasarCantidadAHoras(cant: string): string;
begin
  PasarCantidadAHoras := floattostr(int(strtofloat(cant))) +  ' hora(s) ' + floattostr(round(frac(strtofloat(cant)) * 60)) + ' minuto(s) ';
end;


end.
