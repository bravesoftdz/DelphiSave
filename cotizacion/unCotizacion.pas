unit unCotizacion;

interface

type
  TRecValidacion = record
    Advertencia: Boolean;
    ContinuarCarga: String;
    DescripcionError: String;
    MotivoNoAutoCotizacion: String;
    NumeroError: Integer;
    VerificaTecnica: Boolean;
end;

const
  EC_PEND_COTIZ                    = '00';      // Pendiente de Cotización
  EC_SOLIC_A_REVISAR               = '00.01';   // Solicitud a revisar
  EC_ASIGNADA                      = '01';      // Asignada
  EC_PEND_AUTORIZ                  = '02';      // Pendiente Autorizacion
  EC_CLONADA                       = '02.0';    // Clonada (Esperando Solicitud)
  EC_EN_PREPARACION                = '02.1';    // En preparación
  EC_SUSPENDIDA                    = '02.2';    // Suspendida
//  EC_PEND_AUTO_COMITE              = '02.3';    // Pendiente Autorización Comité
  EC_PEND_AUTO_COBRANZA            = '02.4';    // Pendiente Autorización Cobranzas
  EC_PEND_AUTO                     = '02.5';    // Pendiente Autorización Resp. Canal
  EC_PEND_AUTO_LEGALES             = '02.6';    // Pendiente Autorización Legales..
  EC_AUTORIZADA                    = '03';      // Autorizada
  EC_NOTIF_COMERCIAL               = '04';      // Notificado a Comercial
  EC_CANCELADA                     = '05';      // Cancelada
  EC_CANCELADA_DEUDOR              = '05.1';    // Cancelada - deuda no regularizada
  EC_CANCELADA_NO_AUTORIZADA       = '05.2';    // Cancelada - no autorizada
  EC_NOTIF_CLIENTE                 = '06';      // Notificado al Cliente
  EC_CERRADA_MAL                   = '07';      // Cerrada - no aceptada por el cliente
  EC_CERRADA_BIEN                  = '08';      // Cerrada - solicitud ingresada
  EC_CON_ERRORES                   = '09';      // No cotizable..
  EC_NO_SE_COTIZA                  = '10';      // Cerrada - no se cotiza
  EC_CERRADA_SIN_INFORMACION       = '11';      // Cerrada - información faltante
  EC_CERRADO_AUTOMATICO            = '12';      // Cerrado Automático
  EC_SOLICITUD_AFILIACION_TRAMITE  = '13';      // Solicitud Afiliación en trámite..
  EC_SOLICITUD_RECHAZADA_DEUDA     = '14';      // Solicitud rechazada por deuda en la art actual..
  EC_TRASPASO_TRAMITE              = '15';      // Traspaso en trámite..
  EC_DATOS_FALTANTES               = '16';      // Datos Faltantes
  EC_SOLIC_AFI_ANULADA             = '17';      // Solicitud de Afiliación anulada
  EC_CERRADA_COMERCIALIZADOR       = '18.0';    // Cerrada - cancelada por el comercializador..
  EC_CERRADA_SOLICITA_NUEVA        = '18.1';    // Cerrada - se solicita nueva cotización..
  EC_CERRADA_VENCIDA_SIN_IMPRESION = '18.2';    // Cerrada - cotización vencida sin impresión de solicitud..
  EC_CERRADA_VENCIDA_CON_IMPRESION = '18.3';    // Cerrada - cotización vencida con impresión de solicitud..
  EC_CERRADA_TRASPASO_OBJETADO     = '18.4';    // Cerrada - Traspaso objetado..
  EC_CERRADA_CONTRATO_ART          = '19';      // Cerrada - Contrato con ART..
  EC_TARIFA_APROBADA               = '20';      // Tarifa aprobada..

  URL_STATUS_BCRA = 'http://www.bcra.gov.ar/cenries/cr010000.asp?error=0';

  CANT_ANOS_INFO_COMPLEMENTARIA = 6;
  GASTOS_VARIABLES_ALTERNATIVA_COTIZACION_2 = 10;
  GASTOS_VARIABLES_ALTERNATIVA_COTIZACION_3 = 15;

  // Constantes usadas en el cotizador..estos valores son fijos por ley, asi que cambian cada muerte de obispo..
  BASE_MINIMA_CALCULO = 180000;
  
  INCAP5066ADICVALORCARTERA  = 80000;
  INCAP66100ADICVALORCARTERA = 100000;
  MUERTEADICVALORCARTERA     = 120000;

  OTRAS_EROGACIONES = 12;

  // Ruta donde se guardan los archivos HTML a enviar por e-mail al momento de notificar al cliente una cotización o revisión de precio..
  PATH_FILE_NOTIFICACION_CLIENTE = '\\ntwebart3\www$\Apps\modules\Suscripciones\NotificarAlCliente\';
  PATH_FILE_NOTIFICACION_CLIENTE_PROD = '\\ntwebart1\www$\Apps\modules\Suscripciones\NotificarAlCliente\';

function GetComisionPiso: Extended;
function GetMinimoCompensacion: Extended;

// Devuelve la cantidad máxima de días en que una clonación debe tener datos diferentes a la clonada..
function Get_DICLO: Integer;

// Esta función devuelve la Evolución anual de incidencia y Costo Siniestral (según cálculo estimado en ILP y Mortales)
function Get_EvolucionAnual(const aIdCotizacion, aAno: Integer): Extended;

// Actualiza el estado de un cotización en la ACO_COTIZACION
procedure TarifaComercial(const aIdActividad, aCantTrabajadores: Integer; const aFecha: TDateTime;
                          var aTarComercial: Currency; var aPorcComercial: Extended);
procedure TarifaSSN(aNivel: String; aIdActividad: Integer; aFecha: TDateTime; var aTarSSN: Currency; var aPorcSSN: Currency);
procedure UpdateCO_ESTADO(const aIdCotizacion: Integer; const aEstado: String; const aConTransaccion: Boolean = True);

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSQL, SysUtils, DateTimeFuncs;

function Get_EvolucionAnual(const aIdCotizacion, aAno: Integer): Extended;
var
  sCadena: String;
  sSql: String;
begin
  sSql :=
    'SELECT DECODE(cs_cantidadtrabajador,' +
                 ' 0, DECODE(cs_periodocubierto, 0, 0, 0),' +
                 ' DECODE(cs_periodocubierto, 0, 0, cs_cantsiniestro / cs_cantidadtrabajador / cs_periodocubierto * 12 * 100))' +
     ' FROM acs_cotizacionsiniestro' +
    ' WHERE cs_idcotizacion = :idcotizacion' +
      ' AND cs_anio = :anio';
  sCadena := ValorSqlEx(sSql, [aIdCotizacion, aAno], '0');

  Result := ToFloat(sCadena, 0);
end;

function Get_DICLO: Integer;
var
  sSql: String;
begin
  sSql :=
    'SELECT tb_codigo' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''DICLO''';
  Result := StrToIntDef(ValorSql(sSql), 0);
end;

procedure UpdateCO_ESTADO(const aIdCotizacion: Integer; const aEstado: String; const aConTransaccion: Boolean = True);
var
  sSql: String;
begin
  sSql :=
    'UPDATE aco_cotizacion' +
      ' SET co_estado = :estado' +
    ' WHERE co_id = :id';

  if aConTransaccion then
    EjecutarSqlEx(sSql, [aEstado, aIdCotizacion])
  else
    EjecutarSqlSTEx(sSql, [aEstado, aIdCotizacion]);
end;

procedure TarifaComercial(const aIdActividad, aCantTrabajadores: Integer; const aFecha: TDateTime;
                          var aTarComercial: Currency; var aPorcComercial: Extended);
var
  sSql: String;
begin
  if aIdActividad <> 0 then
  begin
    sSql :=
      'SELECT tc_sumafija, tc_porcmasa' +
       ' FROM afi.atc_tarifacomercial2006' +
      ' WHERE tc_idactividad = :idactividad' +
        ' AND tc_fechadesde <= :fechadesde' +
        ' AND ((tc_fechahasta >= :fechahasta) OR (tc_fechahasta IS NULL))' +
        ' AND tc_trab_desde <= :trab_desde' +
        ' AND tc_trab_hasta >= :trab_hasta' +
        ' AND tc_fechabaja IS NULL';
    with GetQueryEx(sSql, [aIdActividad, TDateTimeEx.Create(aFecha), TDateTimeEx.Create(aFecha), aCantTrabajadores, aCantTrabajadores]) do
    try
      aTarComercial  := FieldByName('tc_sumafija').AsCurrency;
      aPorcComercial := FieldByName('tc_porcmasa').AsCurrency;
    finally
      Free;
    end;
  end
  else
  begin
    aTarComercial  := 0;
    aPorcComercial := 0;
  end;
end;

procedure TarifaSSN(aNivel: String; aIdActividad: Integer; aFecha: TDateTime; var aTarSSN: Currency; var aPorcSSN: Currency);
var
  sSql: String;
begin
  if aIdActividad <> 0 then
  begin
    sSql :=
      'SELECT ts_tarifa1, ts_porce1, ts_tarifa2, ts_porce2, ts_tarifa3, ts_porce3' +
       ' FROM ats_tarifassn' +
      ' WHERE ts_idactividad = :idactividad' +
        ' AND ts_fechadesde <= :fecha' +
        ' AND (   (ts_fechahasta >= :fecha)' +
             ' OR (ts_fechahasta IS NULL))' +
        ' AND ts_fechabaja IS NULL';
    with GetQueryEx(sSql, [aIdActividad, TDateTimeEx.Create(aFecha)]) do
    try
      if aNivel = '1' then
      begin
        aTarSSN  := FieldByName('ts_tarifa1').AsCurrency;
        aPorcSSN := FieldByName('ts_porce1').AsCurrency;
      end
      else if aNivel = '2' then
      begin
        aTarSSN  := FieldByName('ts_tarifa2').AsCurrency;
        aPorcSSN := FieldByName('ts_porce2').AsCurrency;
      end
      else if aNivel = '3' then
      begin
        aTarSSN  := FieldByName('ts_tarifa3').AsCurrency;
        aPorcSSN := FieldByName('ts_porce3').AsCurrency;
      end
      else
      begin
        aTarSSN  := FieldByName('ts_tarifa3').AsCurrency;
        aPorcSSN := FieldByName('ts_porce3').AsCurrency;
      end;
    finally
      Free;
    end;
  end
  else
  begin
    aTarSSN := 0;
    aPorcSSN := 0;
  end;
end;

function GetComisionPiso: Extended;
var
  sSql: String;
begin
  sSql :=
    'SELECT TO_NUMBER(tb_descripcion)' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''COMPI''' +
      ' AND tb_codigo = ''1''';
  Result := ValorSqlExtended(sSql);
end;

function GetMinimoCompensacion: Extended;
var
  sSql: String;
begin
  sSql :=
    'SELECT TO_NUMBER(tb_descripcion)' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''MINCO''' +
      ' AND tb_codigo = ''1''';
  Result := ValorSqlExtended(sSql);
end;

end.
