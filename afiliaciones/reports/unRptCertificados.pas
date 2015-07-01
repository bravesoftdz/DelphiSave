unit unRptCertificados;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, SDEngine, Db,
  unART, SvcMgr;

const
  IDReport: TTableID = 2;

type
  TRecDeuda = record
    DeudaNominal: Real;
    DeudaTotal: Real;
    Interes: Real;
    Periodo: String;
  end;

type
  TrptCertificados = class(TQuickRep)
    sdqCert: TSDQuery;
    sdqConsulta: TSDQuery;
    sdspGetDeudaCertificado: TSDStoredProc;
    qrbTitulo: TQRBand;
    qrlTitulo: TQRLabel;
    qrlNroCertificado: TQRLabel;
    qrlNroCert: TQRLabel;
    qrlEstado: TQRLabel;
    qriLogo: TQRImage;
    qrlBuenosAiresHeader: TQRLabel;
    qrgroupHeader: TQRGroup;
    QRShape6: TQRShape;
    QRShape18: TQRShape;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel19: TQRLabel;
    qrdbFAfiliacion: TQRDBText;
    qrdbHasta: TQRDBText;
    qrdbDesde: TQRDBText;
    qrdbContrato: TQRDBText;
    qrdbCuit: TQRDBText;
    QRLabel6: TQRLabel;
    qrdbRazon: TQRDBText;
    qrdbCodigo: TQRDBText;
    qrdbDescripcion: TQRDBText;
    QRLabel21: TQRLabel;
    qrdNIVEL: TQRDBText;
    qrsCuit: TQRShape;
    QRLabel2: TQRLabel;
    qrdbCalle: TQRDBText;
    qrdbTelefono: TQRDBText;
    qrdbFax: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    dbtCodigo2: TQRDBText;
    dbtDetalle2: TQRDBText;
    dbtCodigo3: TQRDBText;
    dbtDetalle3: TQRDBText;
    QRShape5: TQRShape;
    bClausula: TQRChildBand;
    qrmClausula: TQRMemo;
    qrbTipo: TQRBand;
    QRLabel1: TQRLabel;
    qrlPeriodos: TQRLabel;
    qrlImporte: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRShape25: TQRShape;
    qrSubTipo: TQRSubDetail;
    qrdbPeriodo: TQRDBText;
    qrdbImporte: TQRDBText;
    qrlBlanco: TQRLabel;
    qrdIntereses: TQRDBText;
    qrdTotal: TQRDBText;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    qrdConcurso: TQRDBText;
    QRShape36: TQRShape;
    qrSummary: TQRBand;
    QRLabel8: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape34: TQRShape;
    QRExpr1: TQRLabel;
    QRExpr2: TQRLabel;
    QRExpr3: TQRLabel;
    QRShape9: TQRShape;
    QRShape37: TQRShape;
    QRShape35: TQRShape;
    QRBand1: TQRBand;
    qrmCondiciones: TQRLabel;
    qrmFechaDDJJ: TQRLabel;
    ChildBand2: TQRChildBand;
    QRMemo2: TQRMemo;
    QRIFirma: TQRDBImage;
    QrmFirma: TQRDBText;
    QrmCargo: TQRDBText;
    QRShape7: TQRShape;
    qrUsuario: TQRLabel;
    qrbDatos: TQRBand;
    bMostrarValidezCertEnViaje: TQRChildBand;
    childCertificadoViaje: TQRChildBand;
    lbLeyendaCertificadoCobertura: TQRLabel;
    QRLabel15: TQRLabel;
    QRMemo1: TQRMemo;
    QRChildBand1: TQRChildBand;
    QRChildBand2: TQRChildBand;
    QRNombre: TQRMemo;
    qrDNI: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRChildBand3: TQRChildBand;
    qrClausula2: TQRMemo;
    procedure qrlBlancoPrint(Sender: TObject; var Value: String);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure AjustaDecimales(Sender: TObject; var Value: String);
    procedure qrdbImportePrint(Sender: TObject; var Value: String);
    procedure QRExpr1Print(Sender: TObject; var Value: String);
    procedure QRExpr2Print(Sender: TObject; var Value: String);
    procedure QRExpr3Print(Sender: TObject; var Value: String);
    procedure qrdInteresesPrint(Sender: TObject; var Value: String);
    procedure qrdTotalPrint(Sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrmFechaDDJJPrint(Sender: TObject; var Value: String);
  private
    FCalleTercero: String;
    FCodigoPostalTercero: String;
    FContrato: Integer;
    FDepartamentoTercero: String;
    FDeudaRec: TRecDeuda;
    FFechaDDJJ: String;
    FLocalidadTercero: String;
    FMostrarDeuda: Boolean;
    FNumeroTercero: String;
    FNroCertificado: Integer;
    FPisoTercero: String;
    FProvinciaTercero: String;
    FRazonTercero: String;
    FSumaImporte: Currency;
    FSumaIntereses: Currency;
    FSumaTotal: Currency;

    function Get_ClausulaStr(aTipoClausula, aTipoVigencia: String; aNotificar: Boolean; const aDeuda, aTraspaso: Boolean;
                             const aContrato: Integer; const aFechaImpresion: TDateTime;
                             const aNumeroCertificado: Integer; const aDDJJAdeudadas: String;
                             const aMostrarDDJJFaltantes: Boolean): String;
    function GetDeuda(const aContrato: Integer; const aFecha: TDateTime): TRecDeuda;
    function GetTextoDeclaracionesJuradasAdeudadas(const aPeriodosDeuda: String): String;

    procedure CargarQuery(aTipoClausula: String; aContrato: Integer; aReImpresion: Boolean);
    procedure MostrarFirma(aValor: Boolean);
    procedure PreparaDeuda(aTipoClausula: String; aContrato: Integer; aDeuda, aIntereses, aReImpresion: Boolean);
    procedure SetCalleTercero(const Value: String);
    procedure SetCodigoPostal(const Value: String);
    procedure SetDepartamentoTercero(const Value: String);
    procedure SetLocalidadTercero(const Value: String);
    procedure SetNumeroTercero(const Value: String);
    procedure SetPisoTercero(const Value: String);
    procedure SetProvinciaTercero(const Value: String);
    procedure SetRazonTercero(const Value: String);
  public
    procedure PrepararReporte(aNroCertificado, aContrato: Integer; aTipoClausula, aTipoVigencia: String;
                              aDeuda, aIntereses, aFirma, aReimpresion, aNotificar: Boolean; aNombreArchivo: String;
                              const aTraspaso, aMostrarValidez: Boolean; const aDDJJAdeudadas: String;
                              const aMostrarDDJJFaltantes: Boolean; const aImprimir: Boolean = False);

    property CalleTercero: String                         write SetCalleTercero;
    property CodigoPostalTercero: String                  write SetCodigoPostal;
    property Contrato: Integer           read FContrato   write FContrato;
    property DepartamentoTercero: String                  write SetDepartamentoTercero;
    property FechaDDJJ: String           read FFechaDDJJ;
    property LocalidadTercero: String                     write SetLocalidadTercero;
    property NumeroTercero: String                        write SetNumeroTercero;
    property PisoTercero: String                          write SetPisoTercero;
    property ProvinciaTercero: String                     write SetProvinciaTercero;
    property RazonTercero: String                         write SetRazonTercero;
  end;

var
  ClausulaCorte: Integer;
  ContadorCorte: Integer;
  Flag: Boolean;
  rptCertificados: TrptCertificados;

implementation

uses
  AnsiSql, unDmPrincipal, General, unExportPDF, StrFuncs, CustomDlgs, SqlFuncs, DateTimeFuncs, unVisualizador, unSesion;

{$R *.DFM}

function TrptCertificados.Get_ClausulaStr(aTipoClausula, aTipoVigencia: String; aNotificar: Boolean; const aDeuda,
                                          aTraspaso: Boolean; const aContrato: Integer; const aFechaImpresion: TDateTime;
                                          const aNumeroCertificado: Integer; const aDDJJAdeudadas: String;
                                          const aMostrarDDJJFaltantes: Boolean): String;
var
  sClausulaStr: String;
  sSql: String;
  iCount : Integer;
begin
  if aTipoClausula = 'C' then
  begin
    sClausulaStr := 'Se deja constancia por la presente que la empresa de referencia se encuentra asegurada en ' +
                    'Provincia Aseguradora de Riesgos del Trabajo S.A. de acuerdo con lo normado por la Ley 24.557 de ' +
                    'Riesgos de Trabajo y sus disposiciones reglamentarias. ';

    if (aMostrarDDJJFaltantes) and (aDDJJAdeudadas <> '') then
      sClausulaStr := sClausulaStr + GetTextoDeclaracionesJuradasAdeudadas(aDDJJAdeudadas);

    if aDeuda then
    begin
      sClausulaStr := sClausulaStr + #13 + #13 + Format(
        'Su empresa posee al %s un saldo deudor ' +
        'total que asciende a la suma de $%s compuesto por $%s de deuda nominal y $%s en concepto de ' +
        'intereses. Provincia ART está en condiciones de aplicar lo establecido en el Art. 28 punto 4 de la Ley ' +
        '24.557 y sus reglamentaciones.',
        [
          FormatDateTime('dd/mm/yyyy', aFechaImpresion),
          FormatFloat('#,##0.00', FDeudaRec.DeudaTotal),
          FormatFloat('#,##0.00', FDeudaRec.DeudaNominal),
          FormatFloat('#,##0.00', FDeudaRec.Interes)
        ]);

      sClausulaStr := sClausulaStr + #13 + #13 +
        'Se extiende el presente certificado a efectos de ser presentado ante quien corresponda.';
    end
    else
      sClausulaStr := sClausulaStr + #13 + #13 +
        'Se extiende el presente certificado a efectos de ser presentado ante quien corresponda.';

    if aTraspaso then
      sClausulaStr := sClausulaStr + #13 + #13 +
        'El presente certificado tiene validez hasta el último día del mes en el que su empresa solicitó el traspaso ' +
        'de aseguradora conforme la Resolución SRT 41/1997.'
    else
      sClausulaStr := sClausulaStr + #13 + #13 +
        'El presente certificado tiene validez de 30 días corridos a partir de la fecha de emisión. En ningún caso ' +
        'Provincia ART S.A. será responsable de las consecuencias del uso del certificado una vez vencido el plazo ' +
        'de validez.';

    sClausulaStr := sClausulaStr + #13 + #13 +
      'Recuerde revisar periódicamente las comunicaciones que le remite la Aseguradora a través del sistema de ' +
      'Ventanilla Electrónica de la SRT. Tenga en cuenta que tanto la suscripción a este servicio como el acceso, se ' +
      'efectúa con su clave fiscal de AFIP. En www.srt.gov.ar podrá encontrar los Manuales que indican cómo adherirse ' +
      'a esta vía de comunicación, así como el modo de utilización de la misma.';

// Texto para impresiones especiales..
//Meter unos radioitems para que se muestre o no el texto de abajo...
//ClausulaStr := ClausulaStr + 'El presente no implica reconocimiento ni desconocimiento del estado de deuda y se expide solo a pedido del requiriente.';

  end
  else if aTipoClausula = 'X' then
  begin

    QRChildBand1.Height := 28;
    QRChildBand2.Height := 29;
    QRChildBand3.Height := 28;
    sSql :=
      'SELECT cx_destino, cx_fechasalida, cx_fecharegreso, tj_nombre, tj_documento,' +
      'art.afiliacion.get_paises_certificado(cx_id) paises' +
       ' FROM acx_certxtrabenviaje' +
  ' LEFT JOIN acc_certificadocobertura ON(cc_id = cx_idcertificado)' +
  ' LEFT JOIN mtv_trabajadorenviaje ON(tv_idcertxtrab = cx_id)' +
  ' LEFT JOIN ctj_trabajador ON(tj_cuil = tv_cuil)' +
      ' WHERE cc_nrocertificado = :nrocertificado';

    with GetQueryEx(sSql, [aNumeroCertificado]) do
    try
      sClausulaStr :=
        'Se deja constancia por la presente que la empresa de referencia se encuentra asegurada en ' +
        'Provincia Aseguradora del Riesgo del Trabajo S.A. de acuerdo con lo normado por la ley 24.557 y ' +
        'sus disposiciones reglamentarias.';

      if aMostrarDDJJFaltantes then
        sClausulaStr := sClausulaStr + GetTextoDeclaracionesJuradasAdeudadas(aDDJJAdeudadas);

      sClausulaStr := sClausulaStr + #13#13 + 'Los siguientes, son los trabajdores informados por la empresa afiliada que' +
                                              ' realizarán tareas / comisiones en el exterior:' + #13;

      iCount := 0;
      while not eof do
      begin
        inc(iCount);
        qrNombre.Lines.Text := qrNombre.Lines.Text + ' '+FieldByName('tj_nombre').AsString + #13;
        qrDNI.Lines.Text := qrDNI.Lines.Text + ' ' + FieldByName('tj_documento').AsString + #13;
        Next;
      end;
      if iCount = 2 then   //por alguna extraña razon cuando son 2 personas la grilla se dibuja mal..
      begin
        qrNombre.Lines.Text := qrNombre.Lines.Text + #13;
        qrDNI.Lines.Text := qrDNI.Lines.Text + #13;
      end;

      qrClausula2.Lines.Text := qrClausula2.Lines.Text + 'Destino: ' + FieldByName('cx_destino').AsString + #13;
      if not FieldByName('paises').IsNull then  //Si no tiene pais cargado no muestro esta linea porque queda re mal
        qrClausula2.Lines.Text := qrClausula2.Lines.Text + 'Países: ' +  FieldByName('paises').AsString + #13;
      qrClausula2.Lines.Text := qrClausula2.Lines.Text + 'Desde: ' + FieldByName('cx_fechasalida').AsString + '       ' +
                                     'Hasta: ' + FieldByName('cx_fecharegreso').AsString + ' (*)';
    finally
      Free;
    end;
  end
  else
  begin
    // Clausula Especial/Particular
    sClausulaStr := sClausulaStr +
      'Por la presente Provincia Aseguradora de Riesgos del Trabajo S.A., renuncia en forma expresa a reclamar o ' +
      'iniciar toda acción de repetición o de regreso contra ' + FRazonTercero + ', sus funcionarios, empleados u ' +
      'obreros, sea con fundamento en el art. 39, ap. 5, de la Ley Nº 24.557, sea en cualquier otra norma jurídica, ' +
      'con motivo de las prestaciones en especie o dinerarias que se vea obligada a abonar, contratar u otorgar al ' +
      'personal dependiente o ex dependiente de ' + sdqConsulta.FieldByName('nombre').AsString + ', amparados por la ' +
      'cobertura del Contrato de Afiliación Nº ' + sdqConsulta.FieldByName('contrato').AsString + ', por acciones del ' +
      'trabajo o enfermedades profesionales, ocurridos o contraídas por el hecho o en ocasión ';

    // Clausula Especial
    if aTipoClausula = 'E' then
      sClausulaStr := sClausulaStr +
        'del trabajo.' + #13 + 'Esta "Cláusula de no repetición" cesará en sus efectos si el empresario comitente a ' +
        'favor de quien se emite, no cumple estrictamente con las medidas de prevención e higiene y seguridad en el ' +
        'trabajo, o de cualquier manera infringe la Ley Nº 19.587; su Decreto Reglamentario Nº 351/79 y las ' +
        'normativas que sobre el particular ha dictado la Superintendencia de Riesgos del Trabajo; las Provincias y ' +
        'la Ciudad Autónoma de la Ciudad de Buenos Aires en el ámbito de su competencia. ' + #13;

    // Clausula particular
    if aTipoClausula = 'P' then
      sClausulaStr := sClausulaStr +
        'del trabajo, en la medida que el empresario comitente a favor de quien se emite la presente cumpla con la ' +
        'calificación en el tercer nivel según lo estipulado por el artículo segundo inciso c) del Decreto 170/96 o ' +
        'las obligaciones legales en materia de higiene y seguridad.' + #13;

    // continuacion del parrafo.
    if aNotificar then
    begin
      sClausulaStr := sClausulaStr +
        'PROVINCIA A.R.T. S.A. se obliga a comunicar a ' + FRazonTercero + ', en forma fehaciente, los incumplimientos ' +
        'en que incurra el asegurado, especialmente la falta de pago en término dentro de los diez días de ' +
        'verificado. El Asegurado declara como domicilio de ' + FRazonTercero + ' para realizar las comunicaciones ' +
        'en: ' + Uppercase(FCalleTercero);

      if Trim(FNumeroTercero) <> '' then
        sClausulaStr := sClausulaStr + ' Nro. ' + Uppercase(FNumeroTercero);
      if Trim(FPisoTercero) <> '' then
        sClausulaStr := sClausulaStr + ' Piso: ' + Uppercase(FPisoTercero);
      if Trim(FDepartamentoTercero) <> '' then
        sClausulaStr := sClausulaStr + ' Dpto: ' + Uppercase(FDepartamentoTercero);
      if Trim(FCodigoPostalTercero) <> '' then
        sClausulaStr := sClausulaStr + ' (' + FCodigoPostalTercero + ') ';
      if Trim(FLocalidadTercero) <> '' then
        sClausulaStr := sClausulaStr + ' ' + Uppercase(FLocalidadTercero);
      if Trim(FProvinciaTercero) <> '' then
        sClausulaStr := sClausulaStr + ' ' + Uppercase(FProvinciaTercero);
      sClausulaStr := sClausulaStr + '.' + #13;
    end;

    sClausulaStr := sClausulaStr +
      'Fuera de las causales que expresamente prevee la normativa vigente, el contrato de afiliación no podrá ser ' +
      'modificado o enmendado sin previa notificación fehaciente a ' + FRazonTercero + ', en un plazo no inferior a ' +
      'quince(15) días corridos.' + #13 + #13 +
      'Se deja constancia por la presente que la empresa de referencia se encuentra asegurada en Provincia A.R.T.';

    if aMostrarDDJJFaltantes then
      sClausulaStr := sClausulaStr + GetTextoDeclaracionesJuradasAdeudadas(aDDJJAdeudadas);

    if aTipoVigencia = '30' then    // A los 30 días
     sClausulaStr := sClausulaStr + #13#13 + 'El presente certificado tiene una validez de 30 días corridos a partir de la fecha de emisión. En ningún caso Provincia ART S.A. será responsable de las consecuencias del uso del certificado una vez vencido el plazo de validez.'
    else if aTipoVigencia = 'FM' then   // A fin de mes
     sClausulaStr := sClausulaStr + #13#13 + 'El presente certificado tiene validez hasta el ' + DateTimeToStr(GetLastDayOfMonth(DBDateTime())) + '. En ningún caso Provincia ART S.A. será responsable de las consecuencias del uso del certificado una vez vencido el plazo de validez.';
  end;

  Result := sClausulaStr;
end;

function TrptCertificados.GetDeuda(const aContrato: Integer; const aFecha: TDateTime): TRecDeuda;
begin
  with sdspGetDeudaCertificado do
  begin
    ParamByName('dtfecha').AsDateTime :=  aFecha;
    ParamByName('ncontrato').AsInteger := aContrato;

    ExecProc;

    with Result do
    begin
      DeudaNominal := ParamByName('ndeudanominal').AsFloat;
      DeudaTotal := ParamByName('ndeudatotal').AsFloat;
      Interes := ParamByName('ninteres').AsFloat;
      Periodo := ParamByName('speriodo').AsString;
    end;
  end;
end;

function TrptCertificados.GetTextoDeclaracionesJuradasAdeudadas(const aPeriodosDeuda: String): String;
begin
  Result := '';

  with TStringList.Create do
  try
    CommaText := aPeriodosDeuda;
    if Count > 0 then
    begin
      if Count = 1 then
        Result := #13#13 + Format('La empresa adeuda %d Declaración Jurada de Personal', [Count])
      else if Count > 1 then
        Result := #13#13 + Format('La empresa adeuda %d Declaraciones Juradas de Personal', [Count]);
      Result := Result + ', por ese motivo le solicitamos que se contacte por e-mail a la siguiente dirección: emision@provart.com.ar.';
    end;
  finally
    Free;
  end;
end;


// Procedimientos: Los dos Reportes(Impresion y Reimpresion) se hacen sobre el mismo QuickReport, asi que se habilitan
// para Impresion y para Reimpresion ciertos controles
procedure TrptCertificados.CargarQuery(aTipoClausula: String; aContrato: Integer; aReImpresion: Boolean);
var
  iIdFirma: Integer;
  sCampos: String;
  sCondiciones: String;
  sSql: String;
  sTablas: String;
begin
  sdqConsulta.Close;

  if aReImpresion then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM acc_certificadocobertura, aen_endoso' +
      ' WHERE cc_idendoso = en_id' +
        ' AND cc_nrocertificado = :nrocertificado';
    if ExisteSqlEx(sSql, [FNroCertificado]) then
    begin
      sCampos :=
        'SELECT art.varios.get_faxparaenvio(hd_fax) fax, hd_mail correo, hm_nombre nombre,' +
              ' cuit_ponerguiones(hm_cuit) cuit, en_contrato contrato, ca1.ac_codigo codactividad,' +
              ' ca1.ac_descripcion descactividad, ca2.ac_codigo codactividad2, ca2.ac_descripcion descactividad2,' +
              ' ca3.ac_codigo codactividad3, ca3.ac_descripcion descactividad3, hd_calle calle, hd_numero dc_numero,' +
              ' hd_piso dc_piso, hd_departamento dc_departamento, hd_localidad localidad, hd_cpostal dc_cpostal,' +
              ' hd_cpostala dc_cpostala, hd_telefonos dc_telefonos, hd_fax dc_fax, hc_estado co_estado,' +
              ' UPPER(consultas.get_descripciones(''AFEST'', hm_cuit)) desc_estado,' +
              ' TO_CHAR(hc_fechaafiliacion, ''dd/mm/yyyy'') fafilia,' +
              ' TO_CHAR(hc_vigenciadesde, ''dd/mm/yyyy'') vigendesde,' +
              ' TO_CHAR(hc_vigenciahasta, ''dd/mm/yyyy'') vigenhasta, prov.pv_descripcion desc_provincia,' +
              ' art.utiles.armar_domicilio(hd_calle, hd_numero, hd_piso, hd_departamento, NULL)' +
              ' || art.utiles.armar_localidad(hd_cpostal, hd_cpostala, hd_localidad, hd_provincia) loccprov,' +
              ' hc_nivel co_nivel, cc_estado, cc_fechaimpresion, cc_nrocertificado, cc_intereses, cc_tipodeuda,' +
              ' cc_idfirma, cc_deuda deuda, cc_fechaddjj fechaddjj, cc_criteriovencimiento, cc_usuimpresion, cc_notif,' +
              ' fi_firma firma, fi_firmante firmante, fi_caracter caracter';

      sTablas :=
        ' FROM acc_certificadocobertura, aen_endoso, ahd_historicodomicilio, ahm_historicoempresa,' +
             ' ahc_historicocontrato, cac_actividad ca1, cac_actividad ca2, cac_actividad ca3, cpv_provincias prov,' +
             ' cfi_firma fi';

      sCondiciones :=
        ' WHERE cc_idendoso = en_id' +
          ' AND en_idhistoricodomicilio = hd_id(+)' +
          ' AND en_idhistoricoempresa = hm_id(+)' +
          ' AND en_idhistoricocontrato = hc_id(+)' +
          ' AND cc_idactividad1 = ca1.ac_id(+)' +
          ' AND cc_idactividad2 = ca2.ac_id(+)' +
          ' AND cc_idactividad3 = ca3.ac_id(+)' +
          ' AND cc_idfirma = fi_id(+)' +
          ' AND cc_nrocertificado = ' + SqlNumber(FNroCertificado);
    end
    else
    begin
      sCampos :=
        'SELECT art.varios.get_faxparaenvio(dc_fax) fax, co_direlectronica correo, em_nombre nombre,' +
              ' cuit_ponerguiones(em_cuit) cuit, co_contrato contrato, ca1.ac_codigo codactividad,' +
              ' ca1.ac_descripcion descactividad, ca2.ac_codigo codactividad2, ca2.ac_descripcion descactividad2,' +
              ' ca3.ac_codigo codactividad3, ca3.ac_descripcion descactividad3, dc_calle calle, dc_numero, dc_piso,' +
              ' dc_departamento, dc_localidad localidad, dc_cpostal, dc_cpostala, dc_telefonos, dc_fax, co_estado,' +
              ' UPPER(consultas.get_descripciones(''AFEST'', em_cuit)) desc_estado,' +
              ' TO_CHAR(co_fechaafiliacion, ''dd/mm/yyyy'') fafilia,' +
              ' TO_CHAR(co_vigenciadesde, ''dd/mm/yyyy'') vigendesde,' +
              ' TO_CHAR(co_vigenciahasta, ''dd/mm/yyyy'') vigenhasta, prov.pv_descripcion desc_provincia,' +
              ' art.utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento, NULL)' +
              ' || art.utiles.armar_localidad(dc_cpostal, dc_cpostala, dc_localidad, dc_provincia) loccprov,' +
              ' co_nivel, cc_estado, cc_fechaimpresion, cc_nrocertificado, cc_intereses, cc_tipodeuda, cc_idfirma,' +
              ' cc_deuda deuda, cc_fechaddjj fechaddjj, cc_criteriovencimiento, cc_usuimpresion, cc_notif,' +
              ' fi_firma firma, fi_firmante firmante, fi_caracter caracter';

      sTablas :=
        ' FROM acc_certificadocobertura, cac_actividad ca1, cac_actividad ca2, cac_actividad ca3, aem_empresa, ' +
             ' aco_contrato, adc_domiciliocontrato, cpv_provincias prov, cfi_firma fi';

      sCondiciones :=
        ' WHERE dc_provincia = prov.pv_codigo (+)' +
          ' AND ca1.ac_id(+) = cc_idactividad1' +
          ' AND ca2.ac_id(+) = cc_idactividad2' +
          ' AND ca3.ac_id(+) = cc_idactividad3' +
          ' AND co_idempresa = em_id' +
          ' AND co_contrato = cc_contrato' +
          ' AND dc_tipo = ''L''' +
          ' AND dc_contrato = cc_contrato' +
          ' AND fi_id (+) = cc_idfirma' +
          ' AND cc_nrocertificado = ' + SqlNumber(FNroCertificado);
    end;
    sSql := sCampos + sTablas + sCondiciones;
  end
  else
  begin
    sSql :=
      'SELECT tb_especial1' +
       ' FROM ctb_tablas' +
      ' WHERE tb_clave = ''FI_RE''' +
        ' AND tb_codigo = ''1''';
    iIdFirma := ValorSqlInteger(sSql);

    sSql :=
      'SELECT art.varios.get_faxparaenvio(dc_fax) fax, co_direlectronica correo, em_nombre nombre,' +
            ' cuit_ponerguiones(em_cuit) cuit, co_contrato contrato, ca1.ac_codigo codactividad,' +
            ' ca1.ac_descripcion descactividad, ca2.ac_codigo codactividad2, ca2.ac_descripcion descactividad2,' +
            ' ca3.ac_codigo codactividad3, ca3.ac_descripcion descactividad3, dc_calle calle, dc_numero, dc_piso,' +
            ' dc_departamento, dc_localidad localidad, dc_cpostal, dc_cpostala, dc_telefonos, dc_fax, co_estado,' +
            ' UPPER(consultas.get_descripciones(''AFEST'', em_cuit)) desc_estado,' +
            ' TO_CHAR(co_fechaafiliacion, ''dd/mm/yyyy'') fafilia,' +
            ' TO_CHAR(co_vigenciadesde, ''dd/mm/yyyy'') vigendesde,' +
            ' TO_CHAR(co_vigenciahasta, ''dd/mm/yyyy'') vigenhasta, pv_descripcion desc_provincia,' +
            ' art.utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento, NULL)' +
            ' || art.utiles.armar_localidad(dc_cpostal, dc_cpostala, dc_localidad, dc_provincia) loccprov,' +
            ' nomina.get_ultperiodonomina fechaddjj, co_nivel, fi_firma firma, fi_firmante firmante,' +
            ' fi_caracter caracter' +
       ' FROM aem_empresa, cac_actividad ca1, cac_actividad ca2, cac_actividad ca3, aco_contrato,' +
            ' adc_domiciliocontrato, cpv_provincias prov, cfi_firma fi, acc_certificadocobertura' +
      ' WHERE dc_provincia = prov.pv_codigo(+)' +
        ' AND ca1.ac_id(+) = cc_idactividad1' +
        ' AND ca2.ac_id(+) = cc_idactividad2' +
        ' AND ca3.ac_id(+) = cc_idactividad3' +
        ' AND dc_tipo = ''L''' +
        ' AND co_contrato = dc_contrato' +
        ' AND co_idempresa = em_id' +
        ' AND co_contrato = cc_contrato' +
        ' AND cc_nrocertificado = ' + SqlValue(FNroCertificado) +
        ' AND fi_id(+) = ' + SqlValue(iIdFirma) +
        ' AND co_contrato = ' + SqlValue(aContrato);
  end;

  OpenQuery(sdqConsulta, sSql, True);
end;

procedure TrptCertificados.MostrarFirma(aValor: Boolean);
begin
  qrmFirma.Enabled := aValor;
  qrmFirma.Visible := aValor;
  qriFirma.Enabled := aValor;
  qriFirma.Visible := aValor;
  qrmCargo.Enabled := aValor;
  qrmCargo.Visible := aValor;
end;

procedure TrptCertificados.PreparaDeuda(aTipoClausula: String; aContrato: Integer; aDeuda, aIntereses, aReImpresion: Boolean);
var
  iCantidad: Integer;
begin
//-----[ Si No tiene deuda no imprime los encabezados ]---------------------
(*  if Deuda then
  begin
    if not Reimpresion then
    begin
      sSql := 'SELECT PERIODOADEUDADO, IMPORTE, Round(TASA / 100 * IMPORTE, 2) INTERESES, Round((1 + TASA / 100) * IMPORTE, 2) TOTAL, CONCURSOS' +
              '  FROM (                ' +
              'SELECT PERIODO_PONERBARRA(RC_PERIODO) PERIODOADEUDADO, '''' CONCURSOS, ' +
              '   UTILES.IIF_COMPARA(''<='', RC_PERIODO, EM_ULTIMOMESCONCURSO, 0, DEUDA.GET_TASAACUMULADA(DEUDA.GET_VENCIMIENTOCUOTA(SUBSTR(EM_CUIT, 11, 1), RC_PERIODO), ACTUALDATE)) TASA, ' +  // si el periodo está concursado la tasa es 0
              '   (RC_DEVENGADOCUOTA + RC_DEVENGADOFONDO) - (RC_PAGOCUOTA + RC_PAGOFONDO + rc_RecuperoCuota + rc_RecuperoFondo) IMPORTE ' +
              ' FROM AEM_EMPRESA, ACO_CONTRATO, ZRC_RESUMENCOBRANZA ' +
              '  WHERE RC_PERIODO <= DEUDA.ULTIMOPERIODODEVENGADO' +
              '     AND ART.DEUDA.PERIODOENREFINANCIACION(RC_CONTRATO, RC_PERIODO) = ''N''' +
              '     AND CO_IDEMPRESA = EM_ID'+
              '     AND CO_CONTRATO = RC_CONTRATO' +
              '     AND RC_CONTRATO = ' + AContrato +
              '     AND rc_ImporteReclamado = 0 '  +
              '     AND Deuda.Is_ChequeRechazado(rc_Contrato, rc_Periodo) = ''N'' '+
              '     AND rc_Periodo > Greatest(Nvl(EM_ULTIMOMESCONCURSO, ''199601''), Nvl(EM_ULTIMOMESQUIEBRA, ''199601'')) ' +
              ' ) WHERE IMPORTE > 0';
    end
    else
    begin
      sSql := 'SELECT PERIODO_PONERBARRA(CD_PERIODO) PERIODOADEUDADO, CD_IMPORTE IMPORTE, CD_INTERESES INTERESES, CD_IMPORTE + CD_INTERESES TOTAL, DECODE(CD_SITUACION, ''C'', ''Concurso'', NULL) CONCURSOS' +
              '  FROM ACD_CERTIFICADODEUDA, ACC_CERTIFICADOCOBERTURA ' +
              ' WHERE CD_IDCERTIFICADO = CC_ID ' +
              '   AND CC_NROCERTIFICADO = ' + SqlValue(FNroCertificado);
    end;
  end;
*)

// No se muestra mas el detalle..
// by AAL 26/04/06..
//  OpenQuery (sdqCert, sSql, True);

  iCantidad := sdqCert.RecordCount;
  if not sdqCert.Eof then
  begin
    FMostrarDeuda           := True;
    qrbTipo.Height         := 28;
    qrSubTipo.Height       := 20;
    qrbTipo.Enabled        := True;
    qrSubTipo.Enabled      := True;
    qrSummary.Enabled      := True;
    qrlPeriodos.Enabled    := True;
    qrlImporte.Enabled     := True;
    qrdbPeriodo.Enabled    := True;
    qrdbImporte.Enabled    := True;

    qrmFechaDDJJ.Visible   := True;
    qrmFechaDDJJ.Enabled   := True;
    qrmCondiciones.Visible := True;
    qrmCondiciones.Enabled := True;
    if not aIntereses then
    begin
      qrLabel18.Visible    := False;
      qrLabel18.Enabled    := False;
      qrdIntereses.Visible := False;
      qrdIntereses.Enabled := False;
      QRExpr2.Visible      := False;
      QRExpr2.Enabled      := False;
      QRExpr3.Visible      := False;
      QRExpr3.Enabled      := False;
      qrShape25.Visible    := False;
      qrShape25.Enabled    := False;
      qrShape26.Visible    := False;
      qrShape26.Enabled    := False;
      qrShape23.Visible    := False;
      qrShape23.Enabled    := False;
      qrShape10.Visible    := False;
      qrShape10.Enabled    := False;
      qrShape9.Visible     := False;
      qrShape9.Enabled     := False;
      qrShape24.Visible    := False;
      qrShape24.Enabled    := False;
      qrLabel20.Visible    := False;
      qrLabel20.Enabled    := False;
      qrdTotal.Visible     := False;
      qrdTotal.Enabled     := False;
      qrShape31.Width      := 412;
      qrShape32.Width      := 412;
      qrShape33.Width      := 412;
      qrShape35.Width      := 412;
    end;

    // EJV (26/08/2002 Fin)
    if aTipoClausula = 'C'  then
    begin
      if (iCantidad > 13) and  (iCantidad < 16) then
        Flag := True
      else
        Flag := False;
      ClausulaCorte := 0;
    end
    else if aTipoClausula = 'E' then
    begin
      if (iCantidad > 10) and (iCantidad < 15) then
        Flag := True
      else
        Flag := False;
      ClausulaCorte := 1;
    end
    else if aTipoClausula = 'P' then
    begin
      if (iCantidad > 3) and (iCantidad < 6) then
        Flag := True
      else
        Flag := False;
      ClausulaCorte := 2;
    end;
  end
  else
  begin
    FMostrarDeuda          := False;
    qrbTipo.Height         := 0;
    qrSubTipo.Height       := 0;
    qrSummary.Height       := 0;
    qrSummary.Enabled      := False;
    qrbTipo.Enabled        := False;
    qrSubTipo.Enabled      := False;
    qrlPeriodos.Enabled    := False;
    qrlImporte.Enabled     := False;
    qrdbPeriodo.Enabled    := False;
    qrdbImporte.Enabled    := False;

    qrmFechaDDJJ.Visible   := False;
    qrmFechaDDJJ.Enabled   := False;
    qrmCondiciones.Visible := False;
    qrmCondiciones.Enabled := False;
  end;
end;

procedure TrptCertificados.PrepararReporte(aNroCertificado, aContrato: Integer; aTipoClausula, aTipoVigencia: String;
                                           aDeuda, aIntereses, aFirma, aReimpresion, aNotificar: Boolean;
                                           aNombreArchivo: String; const aTraspaso, aMostrarValidez: Boolean;
                                           const aDDJJAdeudadas: String; const aMostrarDDJJFaltantes: Boolean;
                                           const aImprimir: Boolean = False);
var
  sEstado: String;
  sSql: String;
begin
  IdReport := IdReport;

  sdqConsulta.Close;
  FNroCertificado := aNroCertificado;
  Contrato := aContrato;

  QRChildBand1.Height := 0;  //solo se usan en certificados por viaje
  QRChildBand2.Height := 0;
  QRChildBand3.Height := 0;

  if aReimpresion then
  begin
    CargarQuery(aTipoClausula, 0, True);

    FDeudaRec := GetDeuda(aContrato, sdqConsulta.FieldByName('cc_fechaimpresion').AsDateTime);
    aDeuda     := (sdqConsulta.FieldByName('cc_tipodeuda').AsString = 'M') and (sdqConsulta.FieldByName('deuda').AsCurrency > 5);
    aIntereses := (sdqConsulta.FieldByName('cc_intereses').AsString = 'M');

    PreparaDeuda(aTipoClausula, aContrato, aDeuda, aIntereses, True);

    MostrarFirma(sdqConsulta.FieldByName('cc_idfirma').AsInteger <> 0);

    // si el estado es 2, debe poner la leyenda en el reporte ------
    FFechaDDJJ := sdqConsulta.FieldByName('fechaddjj').AsString;
    if sdqConsulta.FieldByName('cc_estado').AsString = '2' then
      qrlEstado.Caption := 'EMPRESA PENDIENTE DE AUTORIZAR POR SRT'
    else
      qrlEstado.Caption := ' ';

    qrmClausula.Lines.Text := Get_ClausulaStr(aTipoClausula, aTipoVigencia, aNotificar, aDeuda, aTraspaso, aContrato,
                                              sdqConsulta.FieldByName('cc_fechaimpresion').AsDateTime, aNroCertificado,
                                              aDDJJAdeudadas, aMostrarDDJJFaltantes);

    qrlBuenosAiresHeader.Caption := 'Buenos Aires ' + FormatDateTime('dd/mm/yyyy',
                                     sdqConsulta.FieldByName('cc_fechaimpresion').AsDateTime);
  end
  else
  begin
    FDeudaRec := GetDeuda(aContrato, DBDate);

    // Solo imprime deudas superiores a $5
    aDeuda := (aDeuda) and (FDeudaRec.DeudaTotal > 5);

    PreparaDeuda(aTipoClausula, aContrato, aDeuda, aIntereses, False);
    MostrarFirma(aFirma);

    //Carga el Query
    CargarQuery(aTipoClausula, aContrato, False);

    sEstado    := sdqConsulta.FieldByName('co_estado').AsString;
    FFechaDDJJ := sdqConsulta.FieldByName('fechaddjj').AsString;

    if sEstado = '2' then
      qrlEstado.Caption := 'EMPRESA ' + sdqConsulta.FieldByName('desc_estado').AsString
    else
      qrlEstado.Caption := ' ';

    sSql :=
      'SELECT pv_descripcion' +
       ' FROM cpv_provincias' +
      ' WHERE pv_codigo = :codigo';
    FProvinciaTercero := ValorSqlEx(sSql, [FProvinciaTercero]);

    qrmClausula.Lines.Text := Get_ClausulaStr(aTipoClausula, aTipoVigencia, aNotificar, aDeuda, aTraspaso,
                                              aContrato, DBDate, aNroCertificado, aDDJJAdeudadas,
                                              aMostrarDDJJFaltantes);

    qrlBuenosAiresHeader.Caption  := 'Buenos Aires ' + DateToStr(DBDate);
  end;

  qrlNroCert.Caption := IntToStr(FNroCertificado);
  qriLogo.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_2009_BYN_CHICO');
  qrUsuario.Caption := Sesion.Usuario;
  bMostrarValidezCertEnViaje.Enabled := (aTipoClausula = 'X') and (aMostrarValidez);
  childCertificadoViaje.Enabled := (aTipoClausula = 'X');    // Se muestra solo para los certificados de viaje..

  if aContrato = 130760 then
    lbLeyendaCertificadoCobertura.Caption := Format(lbLeyendaCertificadoCobertura.Caption, ['6009.2620'])
  else
   // lbLeyendaCertificadoCobertura.Caption := Format(lbLeyendaCertificadoCobertura.Caption, ['4819.6433']);
   lbLeyendaCertificadoCobertura.Caption := Format(lbLeyendaCertificadoCobertura.Caption, ['3753-5599']);
  if aImprimir then
    Print
  else if aNombreArchivo <> '' then
  try
    FileToPDFSvr(Self, ExtractFileDir(aNombreArchivo), aNombreArchivo, {$IFDEF SERVICE}False{$ELSE}True{$ENDIF});
  finally
    //
  end
  else
    Visualizar(rptCertificados,
               GetValores(' - Contrato ' + IntToStr(aContrato), sdqConsulta.FieldByName('correo').AsString, Contrato),
               GetValoresFax('AFI',
                             IntToStr(aContrato),
                             ''{TipoDoc},
                             'E'{TipoDest},
                             sdqConsulta.FieldByName('fax').AsString{Telefono},
                             sdqConsulta.FieldByName('nombre').AsString{Nombre},
                             aContrato{IdDest}),
               [oAlwaysShowDialog, oAutoFirma, oForceDB, oForceShowModal, oExportDOCNotAllowed, oExportXLSNotAllowed]);
end;

procedure TrptCertificados.qrlBlancoPrint(Sender: TObject; var Value: String);
begin
// Blanco es un Label en el reporte que contiene blanco, para imprimir.
  if Flag then
    if ClausulaCorte = 0 then
    begin
      ContadorCorte := ContadorCorte + 1;
      if ContadorCorte = 36 then
        rptCertificados.NewPage;
    end
    else if ClausulaCorte = 1 then
    begin
      ContadorCorte := ContadorCorte + 1;
      if ContadorCorte = 30 then
        rptCertificados.NewPage;
    end
    else if ClausulaCorte = 2 then
    begin
      ContadorCorte := ContadorCorte + 1;
      if ContadorCorte = 11 then
        rptCertificados.NewPage;
    end;
end;

procedure TrptCertificados.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  if Sender.PageNumber > 1 then
    qrbTipo.Height := 0
  else if FMostrarDeuda then
    qrbTipo.Height := 28;
end;

procedure TrptCertificados.AjustaDecimales(Sender: TObject; var Value: String);
begin
  if (Value = '0') or (Value = '') then
    Value := '$ 0,00'
  else
    Value := Get_AjusteDecimales(Value, '$');
end;

procedure TrptCertificados.qrdbImportePrint(Sender: TObject; var Value: String);
begin
  FSumaImporte := FSumaImporte + sdqCert.FieldByName('importe').AsFloat;
  AjustaDecimales(Sender, Value);
end;

procedure TrptCertificados.QRExpr1Print(Sender: TObject; var Value: String);
begin
  Value := ToStr(FSumaImporte, 2, False, False, '$');
end;

procedure TrptCertificados.QRExpr2Print(Sender: TObject; var Value: String);
begin
  Value := ToStr(FSumaIntereses, 2, False, False, '$');
end;

procedure TrptCertificados.QRExpr3Print(Sender: TObject; var Value: String);
begin
  Value := ToStr(FSumaTotal, 2, False, False, '$');
end;

procedure TrptCertificados.qrdInteresesPrint(Sender: TObject; var Value: String);
begin
  FSumaIntereses := FSumaIntereses + sdqCert.FieldByName('intereses').AsFloat;
  AjustaDecimales(Sender, Value);
end;

procedure TrptCertificados.qrdTotalPrint(Sender: TObject; var Value: String);
begin
  FSumaTotal := FSumaTotal + sdqCert.FieldByName('total').AsFloat;
  AjustaDecimales(Sender, Value);
end;

procedure TrptCertificados.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  FSumaImporte   := 0;
  FSumaIntereses := 0;
  FSumaTotal     := 0;
end;

procedure TrptCertificados.qrmFechaDDJJPrint(Sender: TObject; var Value: String);
begin
  Value := 'De acuerdo a la última DDJJ del ' + Copy(FFechaDDJJ, 5, 2) + '/' + Copy(FFechaDDJJ, 1, 4);
end;

procedure TrptCertificados.SetCalleTercero(const Value: String);
begin
  FCalleTercero := Value;
end;

procedure TrptCertificados.SetCodigoPostal(const Value: String);
begin
  FCodigoPostalTercero := Value;
end;

procedure TrptCertificados.SetDepartamentoTercero(const Value: String);
begin
  FDepartamentoTercero := Value;
end;

procedure TrptCertificados.SetLocalidadTercero(const Value: String);
begin
  FLocalidadTercero := Value;
end;

procedure TrptCertificados.SetNumeroTercero(const Value: String);
begin
  FNumeroTercero := Value;
end;

procedure TrptCertificados.SetPisoTercero(const Value: String);
begin
  FPisoTercero := Value;
end;

procedure TrptCertificados.SetProvinciaTercero(const Value: String);
begin
  FProvinciaTercero := Value;
end;

procedure TrptCertificados.SetRazonTercero(const Value: String);
begin
  FRazonTercero := Value;
end;

end.
