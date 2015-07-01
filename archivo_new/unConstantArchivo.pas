unit unConstantArchivo;

interface

uses
  Graphics, SysUtils;

const
  UBIC_DELEGACION = 0;
  UBIC_LUGAR      = 1;
  UBIC_SECTOR     = 2;
  UBIC_USUARIO    = 3;

  SECTOR_MENTRADAS         = 'MENTRADA';     // Mesa de Entradas
  SECTOR_DOCUMENTACION     = 'LSG';
  SECTOR_GUARDAYDIGITALIZ  : Array [1..1] of String = ('BANK');
  SECTOR_MESAENTRADA       = 'MENTRADA';

  UBICACION_GD = 'G&D';    // by NWK, 31/10/06

  TIPOUBICACION_USUARIO = 'U';
  TIPOUBICACION_LUGAR   = 'L';
  TIPOUBICACION_SECTOR  = 'S';
  TIPOUBICACION_GUARDA  = 'G';

  COLOR_SOLICITADO            : TColor = $00E1FFFF;
  COLOR_PLAZOVENCIDO          : TColor = $006F9BB9;
  COLOR_EXCEDIDOPLAZOENTREGA  : TColor = $00D9BDA6;
  COLOR_CARPETA_EN_RESGUARDO  : Tcolor = clAqua;
  COLORF_OBSERV_GYD_PENDIENTE : TColor = clPurple;

  COLOR_READONLY : TColor = $00EFF0EC;

  ID_CARPETA_HYS            = 1;
  ID_CARPETA_JUICIOPD       = 2;
  ID_CARPETA_AFILIAC        = 3;
  ID_CARPETA_PRESTDIN       = 4;
  ID_CARPETA_CD             = 5;
  ID_CARPETA_RADIOGRSIN     = 6;
  ID_CARPETA_PREST          = 7;
  ID_CARPETA_TESORERIA      = 8;
  ID_CARPETA_CONSTRUCC      = 9;
  ID_CARPETA_ML_GRAL        = 10;
  ID_CARPETA_SUMARIOS       = 11;
  ID_CARPETA_OFICIOS        = 12;
  ID_CARPETA_ML_RX          = 13;
  ID_CARPETA_JUICIOPA       = 14;
  ID_CARPETA_EMISNOTAS      = 15;
  ID_CARPETA_CD_SIN         = 16;
  ID_CARPETA_ML_EGRESOS     = 17;
  ID_CARPETA_PREVENCION     = 19;
  ID_CARPETA_SINIESTRO      = 20;
  ID_CARPETA_CPAGARVIAT     = 21;
  ID_CARPETA_CC_COBR        = 22;
  ID_CARPETA_CAJAS_RRHH     = 23;
  ID_CARPETA_CAJAS_JR       = 24;
  ID_CARPETA_CAJAS_GT       = 25;
  ID_CARPETA_LEGVENDEDOR    = 27;
  ID_CARPETA_VENDEDOR       = 28;
  ID_CARPETA_EXAMENPREOC    = 29;
  ID_CARPETA_EXTRBANC       = 30;
  ID_CARPETA_BALANCE        = 31;
  ID_CARPETA_EMBARGO        = 32;
  ID_CARPETA_CBU            = 33;
  ID_CARPETA_CD_AFI         = 35;
  ID_CARPETA_CAJAS_IE       = 36;
  ID_CARPETA_COMPRAS        = 37;
  ID_CARPETA_INCAPACID      = 38;                
  ID_CARPETA_CD_COB         = 39;
  ID_CARPETA_CD_INCA        = 40;
  ID_CARPETA_CD_HYS         = 41;
  ID_CARPETA_CD_PRDINSIN    = 42;
  ID_CARPETA_CD_LEGSIN      = 43;
  ID_CARPETA_CD_LEGCONTR    = 44;
  ID_CARPETA_CD_LEGJPD      = 45;
  ID_CARPETA_CD_LEGJPA      = 46;
  ID_CARPETA_CD_PRDINCON    = 47;
  ID_CARPETA_MEDIACIONES    = 48;
  ID_CARPETA_CAJAS_CONCACT  = 49;
  ID_CARPETA_CAJAS_CONCPAS  = 50;
  ID_CARPETA_CAJAS_CONCIMP  = 51;
  ID_CARPETA_CAJAS_BCOSINT  = 52;
  ID_CARPETA_TRBANC         = 53;
  ID_CARPETA_CAJAS_COB      = 54;
  ID_CARPETA_CAJAS_CPAG     = 55;
  ID_CARPETA_CAJAS_CPRAS    = 56;
  ID_CARPETA_CAJAS_MENTR    = 57;
  ID_CARPETA_CAJAS_INV      = 58;
  ID_CARPETA_CAJAS_LIQ      = 59;
  ID_CARPETA_CAJAS_CONT     = 60;
  ID_CARPETA_CAJAS_BMENS    = 61;
  ID_CARPETA_CAJAS_BTRIM    = 62;
  ID_CARPETA_CAJAS_ECOB     = 63;
  ID_CARPETA_CAJAS_ASDIAR   = 64;
  ID_CARPETA_CAJAS_EXPER99  = 65;
  ID_CARPETA_CAJAS_BFISARCH = 66;
  ID_CARPETA_EXAMENPREOC_RX = 67;
  ID_CARPETA_ML_NOTIFICAC   = 68;
  ID_CARPETA_CAJAS_TESO_G   = 71;
  ID_CARPETA_LEGPERS_RRHH   = 73;
  ID_CARPETA_CAJAS_EXTRBANC = 74;

  OPCION_DESTINO_DIGITALIZACION = 'D';
  OPCION_DESTINO_GUARDA         = 'G';
  OPCION_DESTINO_DIGITUSUARIO   = 'U';
  OPCION_DESTINO_SINPAPEL       = 'S';

  ESTADOLOTE_USUARIO        = '10';
  ESTADOLOTE_ENTRANSITO     = '20';
  ESTADOLOTE_MESAENTRADA    = '30';
  ESTADOLOTE_DITALIZGUARDA  = '40';
  ESTADOLOTE_ADMINISTRADORA = '50';

  CODDOC_CARTADOC           = 'CDP';   // Carta documento
  CODDOC_ACUSECARTADOC      = 'ACD';   // Acuse Carta Documento
  CODDOC_DEVOLCARTADOC      = 'DCD';   // Devolución Carta Documento
  CODDOC_REIMPCARTADOC      = 'RCD';   // Reimpresión Carta documento
  CODDOC_REIMPACUSECARTADOC = 'RACD';  // Reimpresión de Acuse Carta Documento
  CODDOC_REIMPDEVOLCARTADOC = 'RDCD';  // Reimpresión de Devolución de Carta Documento
  CODDOC_CARTADOC_ML        = 'CDML';  // Carta Documento de Medicina Laboral
  CODDOC_ACUSECARTADOC_ML   = 'ACDML'; // Acuse Carta Documento de Medicina Laboral
  CODDOC_CARTACOM           = 'CC';    // Carta Comercial
  CODDOC_ACUSECARTACOM      = 'ACC';   // Acuse de Carta Comercial
  CODDOC_OPAGOTESO          = 'OPT';   // Orden de Pago Tesorería
  CODDOC_ANULOPAGOTESO      = 'AOPT';  // Anulación Orden de Pago Tesorería
  CODDOC_RECIBOOFICIAL      = 'RCHP';  // Recibo Oficial
  CODDOC_OPAGOFIRMADA       = 'OPF';   // Orden de Pago Firmada
  CODDOC_LEGAJOCOMPLETO     = '101';   // Legajo Completo
  CODDOC_LOTE               = 'LOTE';  // Lote de Envío de Documentación
  CODDOC_CONSTANCIA         = 'CON';   // Constancia (de visita de HyS)
  CODDOC_ACUSECORREOF       = 'ACF';   // Acuses de Correo Firmado
  CODDOC_LIQ                = 'LIQ';   // Papelería de Liquidación
  CODDOC_VOU                = 'VOU';   // Vouchers
  CODDOC_DICTAMEN           = 'DIC';   // Dictámenes
  CODDOC_EXMEDAMP           = 'EAMP';  // Estudios Médicos AMP
  CODDOC_EXEGRML            = 'EEG';   // Exámen de Egreso Medicina Laboral
  CODDOC_ESTMEDRX           = 'ERX';   // Estudios Médicos RX
  CODDOC_ESTMEDRX_LFP       = 'ERXLU'; // Estudios Médicos RX Lumbosacra frente y perfil
  CODDOC_COBRANZAS          = '600';   // Cobranzas
  CODDOC_CONSTVISITACOM     = '400';   // Constancia de Visita Comercial
  CODDOC_ORDENCOMPRA        = 'OC';    // Orden de Compra
  CODDOC_DOCEMISION         = '700';   // Documentación del Sector de Emisión

  CODDOCS_LIQ               = '''' + CODDOC_LIQ + ''', ''' + CODDOC_VOU + '''';   // lista códigos de documentos de liquidaciones, separados por coma

  UBIC_EXTRAVIADA =  '14';  // Carpeta Extraviada
  UBIC_TERCEROS   =  '16';	// Carpeta Entregada a Terceros
  UBIC_ANULADA    =  '17';  // Carpeta Anulada
  UBIC_GyD        =  '18';  // Digitalización y Guarda

  PRIORSECT_ALTA  = '1';    // criticidad de los sectores
  PRIORSECT_MEDIA = '2';
  PRIORSECT_BAJA  = '3';

  TIPOCLAVE_SIN   = 'SIN';  // tipo clave: Siniestros

  SUBCLAVE_CARPETAVIRTUAL = '-1';

  MINROMEDIO = 10000;

  CAJALIQUIDACIONES = 'LIQUIDACIONES';   // al preparar el super-remito, esto corresponde a la descripcion que deben tener las cajas de liquidaciones

  ESTADOCARPETA_SOLICITADA      = '10';
  ESTADOCARPETA_ENTRANSITO_USU  = '20';
  ESTADOCARPETA_PODERUSUARIO    = '30';
  ESTADOCARPETA_TRANSITO_A_GYD  = '40';
  ESTADOCARPETA_PODER_GYD       = '50';
  ESTADOCARPETA_ADMINISTRADORA  = '60';

  CODERROR_SEGUSU_DOCLOTEINEXISTENTE = 'F001';    // El documento del lote no existe en la CajaExpo

  MINSECUENCIATRAZABIL = 100000000;   // nro. a partir del cual se empieza a setear la sec. de trazabilidad, solo para aquellos documentos nuevos dados de alta a partir del día en que inicia el uso de la secuencia para un tipo de archivo dado

  // rpa_parametro
  // 1 Cantidad de Días de Retencíon de Documentación
  PARAMETRO_DIASRETENCION : Integer = 1;
  // 2 Cantidad de Documentos por Lote
  PARAMETRO_CANTIDADDOCUMENTOSLOTE : Integer = 2;
  // 3 Previsualizar Impresión de Lote
  PARAMETRO_PREVISIMPRESIONLOTE : Integer = 3;
  // 4 Previsualizar Impresión de Remito
  PARAMETRO_PREVISIMPRESIONREMITO : Integer = 4;
  // 5 Dirección de Correo p/Solicitudes Externas (Administradora Externa)
  PARAMETRO_CORREO_GUARDAYDIGITALIZACION : Integer = 5;
  // 6 Dirección de Contacto local documentacion (sector ART - Buzón Digitalización)
  PARAMETRO_CORREO_DOCUMENTACION : Integer = 6;

  ANCHO_ETIQUETAS_MM = 29;
var
  // 1	Cantidad de Días de Retencíon de Documentación
  VALOR_PARAMETRO_DIASRETENCION : Integer = 3;
  // 2 Cantidad de Documentos por Lote (casos especiales)
  VALOR_PARAMETRO_CANTIDADDOCUMENTOSLOTE : Integer = 50;
  VALOR_PARAMETRO_CANTIDADDOCUMENTOSLOTE2 : Integer = 100;
  // 3	Previsualizar Impresión de Lote
  VALOR_PARAMETRO_PREVISIMPRESIONLOTE : Boolean = false;
  // 4	Previsualizar Impresión de Remito
  VALOR_PARAMETRO_PREVISIMPRESIONREMITO : Boolean = false;
  // 5	Dirección de Correo p/Solicitudes Externas
  VALOR_PARAMETRO_CORREO_GUARDAYDIGITALIZACION : string = '';
  // 6	Dirección de Contacto local documentacion 
  VALOR_PARAMETRO_CORREO_DOCUMENTACION : string = '';

implementation

end.

