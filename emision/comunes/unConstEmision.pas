unit unConstEmision;

interface

uses SysUtils, Graphics;

const
  TIPORELACION : array [0..11] of integer = (1,  // equal
                1,  // >
                1,  // <
                1,  // >=
                1,  // <=
                1,  // <>
                2,  // esté entre los valores
                2,  // no esté entre los valores
                1,  // dentro de la lista
                1,  // no dentro de la lista
                1,  // como
                1); // no sea como

  RELACIONES : array [0..11] of string = ('EQ',  // equal
                'GT',  // >
                'LT',  // <
                'GE',  // >=
                'LE',  // <=
                'NE',  // <>
                'BE',  // esté entre los valores
                'NB',  // no esté entre los valores
                'IN',  // dentro de la lista
                'NI',  // no dentro de la lista
                'LK',  // como
                'NL'); // no sea como

  DESCRIPCIONRELACION : array [0..11] of string = ('=',
                '>',  // >
                '<',  // <
                '>=',  // >=
                '<=',  // <=
                '<>',  // <>
                ' esté entre los valores ',  // esté entre los valores
                ' no esté entre los valores ' ,
                ' dentro de la lista ',
                ' no dentro de la lista ',
                ' como ',
                ' no sea como ');

  TIPO_DATOS    : array[0..8] of String= ('C', 'V', 'N', 'L', 'D', 'DT', 'T', 'P', 'B');


  FIELD_PARAM  = 'FIELD!';
  ACTION_PARAM = 'PARAM!';




  { Campos de las declaraciones juradas}
  CONTRATO          = 'CONTRATO';
  CUIT              = 'CUIT';
  PERIODO           = 'PERIODO';
  TRABAJADORES      = 'TRABAJADORES';
  MASASALARIAL      = 'MASASALARIAL';
  SUSS              = 'SUSS';
  FECHAPRESENTACION = 'FECHAPRESENTACION';
  CUIL              = 'CUIL';
  SALARIO           = 'SALARIO';
  CONDICION         = 'CONDICION';
  SITUACION         = 'SITUACION';
  ACTIVIDAD         = 'ACTIVIDAD';
  MODOCONTRATACION  = 'MODOCONTRATACION';
  ZONA              = 'ZONA';
  OBRASOCIAL        = 'OBRASOCIAL';




  FIELDS_DECLARACION: array[0..6] of string = (CONTRATO, CUIT, PERIODO, TRABAJADORES,
                                               MASASALARIAL, SUSS, FECHAPRESENTACION);
  FIELDS_TRABAJADOR: array[0..12] of string = (CONTRATO, CUIT, PERIODO, CUIL, SALARIO, SUSS, FECHAPRESENTACION, CONDICION,
                                              SITUACION, ACTIVIDAD, MODOCONTRATACION, ZONA, OBRASOCIAL);


const

 //Tipos de Contacto
 TIPO_CONTACTO_TELEFONICO   = 'T'; //'Telefónico',
 TIPO_CONTACTO_MAIL         = 'M'; // 'Mail',
 TIPO_CONTACTO_CORREO       = 'C'; // 'Correo',
 TIPO_CONTACTO_FAX          = 'F'; //'Fax'
 TIPO_CONTACTO_PERSONAL     = 'P'; //'Fax'
 TIPO_CONTACTO_VENTANILLA   = 'V'; //'Ventanilla

 TIPO_DDJJ       = 'D';
 TIPO_TRABAJADOR = 'T';

 ERROR_INSERTANDOCABECERA = 1;
 ERROR_PREPROCESANDOREGISTRO = 2;
 ERROR_ARCHIVOYAPROCESADO = 3;
 ERROR_ARTINVALIDA = 4;
 ERROR_VERIFICACIONCABECER = 5;
 ERROR_CUITSINCONTRATO = 6;
 CODIGOPROVINCIAART = '00051';

 RSHTTPARCHIVOYAPROCESADO = 505 + ERROR_ARCHIVOYAPROCESADO;


//* Estados de proceso en la cabecera */
 PROCESOINICIADO            = 1;
 PROCESANDOCABECERA         = 2;
 CABECERAPROCESADA          = 3;
 PROCESANDODETALLE          = 4;
 DETALLEPROCESADO           = 5;
 PASANDOATEMPORALES         = 6;
 PROCESODETRASPASOCORRECTO  = 7;
 CALCULANDOVARIABLE = 8;
 CALCULANDOESTADOS  = 8;
 VARIABLESCALCULADAS = 10;
 ESTADOSCALCULADOS   = 11;


// Proceso de cálculo de estados y variables de declaraciones juradas
 DDJJNOEXISTEPARACUITPERIODO = 100;
 ERROR_DDJJNOEXISTEPARACUITPERIODO = 'No Existe DDJJ para el Cuit % en el Período %';
 DDJJPREVIAMENTECALCULADASETEO = 101;
 ERROR_DDJJPREVIAMENTECALCULADASETEO = 'Declaración jurada procesada para otro seteo.';

 FORMULARIOSUSS = 1;
 FORMULARIOMONOTRIBUTO = 2;
 FORMULARIOSINPERSONAL = 3;
 FORMULARIOGENERICO = 4;
 FORMULARIOSUSSEXTENDIDO = 6;
 FORMULARIODETERMINATIVA = 7;
 FORMULARIOMIREGISTRO = 8;
 FORMULARIODOMICILIOEXPLOTACION = 9;
 FORMULARIOREGIMENESPECIAL = 10;

 //ESTADOS DE PERIODO
 ESTADO_PERIODO_PENDIENTE = 'P';
 ESTADO_PERIODO_INVALIDO  = 'I';
 ESTADO_PERIODO_VALIDO    = 'V';
 ESTADO_PERIODO_NOAPLICA  = 'N';



 //Valores de ART.AFI para el estado de contratos.
 ESTADO_ACTIVA         =  1;
 ESTADO_NO_ACTIVA      =  2;
 ESTADO_RESCINDIDA     =  3;
 ESTADO_VER_MOTIVOBAJA =  4;

 ESTADO_DEVENGADO_DEVENGABLE    = 0;
 ESTADO_DEV_EST_NOCORRESPONDE   = 1;
 ESTADO_DEV_REAL_NOCORRESPONDE  = 2;
 ESTADO_DEV_DEVENGADO           = 3;

 COLOR_DESHABILIDATO = $00F4ECEC;
 COLOR_DEVENGADO1 = $00E1FFFF;
 COLOR_DEVENGADO2 = $00F4ECEC;
 COLOR_DEVENGADO3 = $000296E6;

 COLOR_SIMULACION_ESTIMADO     = $00E1FFFF;//$00EEFFFF;
 COLOR_SIMULACION_RECALCULO    = $00FFDFDF;
 COLOR_SIMULACION_SINCOBERTURA = $00C1D6FF;

 TIPOAUTORIZACION_RECALCULOVOLUNTAD = 8;


 TF_FORMATO : array [1..7] of integer = (
                1, // SUSS
                2, // Monotributista
                3, // Sin Personal
                4, // Detalle Nomina
                5, // Resumen Nominas
                6, // SUSS Extendido
                7);  //Determinativas

 TF_FORMATO_DESCRIPCION : array [1..7] of string = (
                 'SUSS',
                 'Monotributista',
                 'Sin Personal',
                 'Detalle Nomina',
                 'Resumen Nominas',
                 'SUSS Extendido',
                 'Determinativa');

{
 SQL_EVENTOS : string =  'SELECT SE.SE_ID IDEVENTO, CE.CE_DESCRIPCION EVENTO, SE_SUBEVENTO SUBEVENTO, SE.SE_USUREALIZADO,' +
             '       VARIOS.GET_CANTRELLAMADAS (SE.SE_IDENTIFICADOR) RELLAMADAS, DECODE(IE_CONDERIVACIONTELEF, ''S'', SE.SE_USUREALIZADO, SE.SE_USUALTA) USUREALIZADO,' +
             '       DECODE(IE_CONDERIVACIONTELEF, ''S'', USUREA.SE_NOMBRE, USU.SE_NOMBRE) NOMBREUSUREALIZADO, ' +
             '       SE.SE_FECHA FECHA, SE_SECTORINVOLUCRADO, '+
             '       SE_IDCODIGOINGRESO, SINTER.SC_DESCRIPCION SECTORSOLICITANTE, USU.SE_NOMBRE PERSONALSOLICITANTE,' +
             '       IE.IE_CONDERIVACIONTELEF, IE.IE_DESCRIPCION INGRESO, ME.ME_DESCRIPCION MOTIVO, SINVOL.SC_DESCRIPCION SECTORINTERVINIENTE,' +
             '       PE.PE_DESCRIPCION PRIORIDAD, DECODE(IE_CONDERIVACIONTELEF, ''S'', SE_FECHACOMPROMETIDA, TRUNC(SE_FECHAALTA)) SE_FECHACOMPROMETIDA,' +
             '       DECODE(IE_CONDERIVACIONTELEF, ''S'', TRUNC(SE.SE_FECHAREALIZADO), NVL(TRUNC(SE.SE_FECHAREALIZADO), TRUNC(SE_FECHAALTA)) ) SE_FECHAREALIZADO,' +
             '       REPLACE(SE_OBSERVACIONREALIZADO, CHR (13) || CHR (10), '' '') RESPUESTA,' +
             '       REPLACE(SE.SE_OBSERVACION, CHR (13) || CHR (10), '' '') OBSERVACIONES, SE.SE_CUILEVENTO CUIL,' +
             '       SI.SI_DESCRIPCION SITUACIONEMPRESA, SE.SE_USUALTA USUALTA,' +
             '       SE.SE_EVENTOINTERRUMPIDO INTERRUMPIDO, SE.SE_EMAILPROSPECTO EMAILPROSPECTO,' +
             '       SE.SE_GENERAL GENERAL, SE.SE_IDSOLICITUDCOTIZACION IDSOLICITUDCOTIZACION,' +
             '       SE.SE_CUITPROSPECTO CUITPROSPECTO, SE_RAZONSOCIALPROSPECTO RAZONSOCIALPROSPECTO,' +
             '       SE.SE_IDPRESTADOREVENTO IDPRESTADOREVENTO,' +
             '       SE.SE_IDPROVEEDOREVENTO IDPROVEEDOREVENTO, SE.SE_IDENTIDAD IDENTIDAD,' +
             '       SE.SE_IDENTIFICADOR IDENTIFICADOREVENTO, SE_IDCODIGOEVENTO, SE_SECTORINTERVINIENTE, ' +
             '       SE_USUARIOINTERVINIENTE, SE_CONTACTO, SE_FECHAALTA, SE_IDCONTACTO, SE_CONTRATO, ' +
             '       SE_IDMOTIVOEVENTO, SE_USUARIODERIVACIONTELEF, SE_PRIORIDAD, SE_OBSERVACION, ' +
             '       SE.SE_CARGO SE_CARGO, ACTUALDATE HORAACTUAL , SE.SE_IDRESPUESTA, '  +
             '       NO_BIBLIORATO,  NO_SECUENCIA, NO_IDLOTEDDJJ ' +
             '  FROM CPE_PRIORIDADEVENTO PE, CSI_SITUACIONEMPRESA SI, CME_MOTIVOEVENTO ME,' +
             '       CSE _ SEGUIMIENTO EVENTO SE, USC_SECTORES SINTER, USC_SECTORES SINVOL,' +
             '       CCE_CODIGOEVENTO CE, CIE_INGRESOEVENTO IE, USE_USUARIOS USU,' +
             '       USE_USUARIOS USUREA, EMI.INO_NOTA INO ' +
             ' WHERE SE.SE_IDCODIGOEVENTO = CE.CE_ID(+)' +
             '   AND SE.SE_SECTORINVOLUCRADO = SINVOL.SC_CODIGO(+)' +
             '   AND SE.SE_IDMOTIVOEVENTO = ME.ME_ID(+)' +
             '   AND SE.SE_USUARIOINTERVINIENTE = USU.SE_USUARIO' +
             '   AND SE.SE_IDCODIGOINGRESO = IE.IE_ID(+)' +
             '   AND SE.SE_SECTORINTERVINIENTE = SINTER.SC_CODIGO' +
             '   AND SE.SE_PRIORIDAD = PE.PE_ID(+)'              +
             '   AND SE.SE_IDSITUACIONEMPRESA = SI.SI_ID(+)'     +
             '   AND SE.SE_USUREALIZADO = USUREA.SE_USUARIO(+)'  +
             '   AND SE_IDENTIFICADOR = INO.NO_IDEVENTO(+) ';
}
//Indica como se debe simular la ddjj
  SIMULACION_ACCION_ALTA = 'A'; //Nueva
  SIMULACION_ACCION_MODIF = 'M'; //Modificacion (Existe y se aplica a la simulacion)
  SIMULACION_ACCION_RECHAZO = 'R';

//Tipo de Formularios de Nominas
  TF_931 = 1;
  TF_165 = 2;
  TF_170 = 3;
  TF_900 = 5;
  TF_926 = 18;
  TF_905 = 6;
  TF_929 = 7;
  TF_569 = 33;
  TF_593 = 82;
  TF_Nota = 15;
  TF_924 = 20;
  TF_902 = 28;
  TF_RPMonotributistasSolamente = 21;
  TF_RPNoSussOriginal = 46;
  TF_RPNoSussOriginalCopia = 47;
  TF_AnexoIIExcepciones = 31;
  TF_921 = 52;
  TF_Pagos = 19;
  TF_InfMixta931_170 = 34;
  TF_TicketPresentacion = 35;
  TF_ResumComplement924_902 = 42;
  TF_ConstanciaMonotributista = 84;
  TF_ConstInscripEmpleador = 53;
  TF_DocumentacionEscuelas = 86;
  TF_DocumentacionGestion = 36;
  TF_AdicionarResumen = 87;
  TF_AdicionarDetalle = 90;
  TF_FormWebDetalleRNS = 91;
  TF_FormSitFacturacion = 92;
  TF_RG3279 = 94;

  TF_Nominativa_Afip = 80;
  TF_Determinativa_Afip = 81;
  TF_Monotributo_Afip = 77;
  TF_Mi_Registro_Afip = 85;

  //ESTADOS DE LOS FORMULARIOS DE LAS NOTAS
  ESTADO_FORMULARIO_PENDIENTE = 1;
  ESTADO_FORMULARIO_REPETIDO = 2;
  ESTADO_FORMULARIO_NO_PROCESADO = 3;
  ESTADO_FORMULARIO_AUTORIZACION = 4;
  ESTADO_FORMULARIO_FUERA_COBERTURA = 5;
  ESTADO_FORMULARIO_PROCESADO = 6;
  ESTADO_FORMULARIO_EXISTE_DDJJ = 7;

  //Estado de las notas
  ESTADO_NOTA_BORRADOR = 1;
  ESTADO_NOTA_APLICADA = 2;
  ESTADO_NOTA_PEND_AUTORIZA = 3;
  ESTADO_NOTA_BAJA = 4;
  ESTADO_NOTA_PEND_SIMULACION = 5;
  ESTADO_NOTA_AGENDADA = 6;

  //INSCRIPCION
  INSCRIPCION_MONOTRIBUTISTA = 1;
  INSCRIPCION_INDETERMINADO = 2;
  INSCRIPCION_SUSS = 3;

//TIPOS DE DEVENGADOS

  TIPO_DEVENGADO_ESTIMADO = 'E';
  TIPO_DEVENGADO_REAL = 'R';

//Observaciones
  sin_ticket_ni_ddjj_poster = 1018;
  sin_ticket_existe_ddjj_poster = 1019;
  sin_const_monotri_ni_ddjj_post =  1021;
  no_es_monotri_ni_ddjj_post = 1022;
  sin_const_monotri_exist_dj_pos = 1023;
  no_es_monotri_existe_ddjj_post = 1024;
  sin_resumen_ni_ddjj_poster = 1031;
  sin_resumen_existe_ddjj_poste = 1032;
  sin_resumen_comp_ni_ddjj_post = 1056;
  trab_sin_ticket_ni_ddjj_poster = 1057;
  trab_sin_ticket_exist_ddjj_pos = 1058;
  dif_nros_verif_ni_ddjj_poster = 1030;
  dif_nros_verif_exist_ddjj_post = 1069;
  generica_existe_ddjj_posterior = 1070;
  obs_form_texto_libre = 1072;
  sin_formulario_solicitado_c14 = 1049;
  sin_solicitud_anterior = 1050;
  obs_esperando_rns = 1087;
  sin_ticket_rg3279 = 1100;
  sin_cabecera_rg3279 = 1101;
  dif_codigo_control = 1102;

//ITA_TIPOAUTORIZACION
  aut_recalculo_periodo_new_ddjj = 1;
  aut_recalculo_modificdatoscont = 2;
  aut_recalculo_conciliado = 3;
  aut_periodo_concurso_quiebra = 4;
  aut_periodo_empresa_rescindida = 5;
  aut_periodo_empresa_plan_pago = 6;
  aut_periodo_recalculo = 7;
  aut_periodo_recalculo_dif_nom = 9;
  aut_cambio_tarifa = 10;
  aut_cambio_vigencia = 11;
  aut_baja_empresa = 12;
  aut_analisis_manual = 13;

  PROCESING_FILE = 'PROCESING_FILE';

  MODO_PRESENTACION_AFIP   = 1;
  MODO_PRESENTACION_NOSUSS = 2;
  MODO_PRESENTACION_MIXTO  = 3;


//IEL_ESTADOLOTE
  LOTE_EN_CURSO = 1;
  LOTE_AGENDADO = 2;
  LOTE_SIN_VIGENCIA = 3;
  LOTE_GENERANDOSE = 4;
  LOTE_TERMINADO = 5;

//DG_IDESTADOGESTION
  GESTION_PENDIENTE  = 1;
  GESTION_FINALIZADA = 2;
  GESTION_AGENDADA   = 3;

//Tipo de Detalle de Gestion
  DETALLE_POR_PERIODO = 'P';
  DETALLE_POR_DDJJ = 'D';
  DETALLE_POR_NOTA = 'N';
  DETALLE_POR_CUILES = 'C';

//Tipo de los estados de la gestion
  TIPO_GESTION_PENDIENTE  = 'P';
  TIPO_GESTION_FINALIZADA = 'F';


  CONTACTO_TELEFONICO = 1;
  CONTACTO_FAX        = 2;
  CONTACTO_MAIL       = 3;
  CONTACTO_CORREO     = 4;
  CONTACTO_PERSONAL   = 5;
  CONTACTO_VENTANILLA = 6;

//Estados de Tareas
  ESTADO_TAREA_PENDIENTE = 1;
  ESTADO_TAREA_FINALIZADA = 2;
  ESTADO_TAREA_ERROR = 3;

//Tareas a realizar por el servicio
  TAREA_GENERAR_RNS = 1;
  TAREA_REGENERAR_DDJJ_BASE_AMPLIADA = 2;

//Items gestionables
  GESTION_SITUACION_FAC_ST = 19;
  GESTION_SITUACION_FAC_CT = 20;

//Salidas de la Situacion de facturacion
  SALIDA_PANTALLA  = 0;
  SALIDA_IMPRESORA = 1;

implementation

end.
