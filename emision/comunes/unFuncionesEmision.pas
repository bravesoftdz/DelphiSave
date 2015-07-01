unit unFuncionesEmision;

interface

uses
  SysUtils, AnsiSql, unDmPrincipal, SDEngine, unConstEmision, Controls, DBClient,
  General, Windows, Classes, unAlarmas, unSesion, unArt;

function Get_PeriodosComprometidos(ACUIT : string) : integer;
procedure Do_ActualizaNominaSim(contrato : integer; periodo : String;
                                empleados : integer; masasalarial : currency; importescero : integer;
                                formulario : integer; tiponomina : integer; codigorectificativa : String;
                                masadeclarada : currency; empleadosdeclarados : integer;
                                importescerodeclarados : integer; fecharecepcionart : TDate; fechapresentaciondgi : TDate); overload;
procedure Do_ActualizaNominaSim(aIdddjj: integer); overload;
procedure Do_InicializarSimulacion;
function Get_CoberturaCobranza(AContrato: Integer; APeriodo : String) : boolean;
function Get_EstadoContrato(AContrato: Integer) : integer;

function get_primerperiodoexigible(acontrato: integer): string;
function get_ultimoperiodoexigible(acontrato: integer; afechabaja, avigenciadesde: TDateTime): string;

function Get_UltimoPeriodoDevengado(ATipoDevengado : String)  : string;
function get_maximoperiododev: string;

function Get_PeriodoPendienteDevengable : boolean;
procedure Do_GenerarDevengadoMensual(aIdGrupo: integer; aPeriodo: String);
procedure do_generarinfoanalisis(aUsuario: String);

function Get_UltimaPresentacionPeriodo(ACUIT, APeriodo : string) : string; overload;
function Get_UltimaPresentacionPeriodo(AContrato : integer; APeriodo : string) : string; overload;
function get_ultimaiddeclaracion(AContrato : integer; APeriodo : string) : integer; overload;
function get_ultimaiddeclaracion(ACUIT : string; APeriodo : string) : integer; overload;
function Get_IdDeclaracionPotencial(AContrato : integer; APeriodo : string) : integer;

function get_iddeclaracionrestabsim(AContrato : integer; APeriodo : string; aidddjj: integer) : integer;

function get_Idddjjcuil(AContrato: integer; APeriodo: string; AFechaPresentacion: TDateTime;
                        ACuil: String; aidtipoformularioexluido: integer;
                        var idddjj: integer; var idtrabajadorddjj: integer): integer;


function Do_GenerarDevengadoSimulado(AContrato : integer; APeriodo : string; cdsMovimientos : TClientDataSet) : integer;
procedure Do_actualizardevengadosim(AContrato : integer);
procedure Do_generardevengadosim(cdsDevengadoSim : TClientDataSet);
procedure Do_actualizarddjjsim(cdsRecepcionesSim : TClientDataSet);
procedure Do_IncorporarDeclaraciones(AIdCabecera : Integer);
procedure do_setobservacion(AId : Integer; ATipo : string; AResultado : Integer);
procedure do_inicializarobservaciones(AId : Integer; ATipo : string);
procedure do_initsimulaciondevengado;
procedure do_offlinedevengarinvalidos;
procedure do_devengarinvalidos;
procedure do_finalizarproceso(AIdProceso : Integer);
procedure do_actualizarproceso(AIdProceso : Integer);
procedure do_actualizarcabecera(AIdCabecera : Integer; ACantidad : Integer; AAccion : String);
procedure do_terminarcabecera(AIdCabecera : Integer);
procedure do_actualizarestadoverif(AIdDeclaracion : Integer);
function get_generarproceso(ATipo : Integer; AVisible : string; AJob : Integer = 0; AObservaciones : string = '') : integer;
//procedure do_activardeclaraccontrato(AContrato : integer);
procedure do_activardeclaracion(AContrato : integer; APeriodo : string);
procedure do_activardeclaracionsim(AContrato : integer; APeriodo : string);
procedure do_devengarinvalidcontratosim(AContrato : integer);
procedure do_procesarmisimplifiacionafi(AIdCabecera : Integer);
procedure do_procesarpcp(AIdCabecera : Integer);
procedure set_userlogin(ausername: string);
procedure do_marcarperiodosdependientes(contrato: integer; periodo, tipomarca: String);

//procedure do_activardeclaraciones;

function get_seteoactivo : integer;
procedure do_copiarparametro(AIdParametro : integer);
function get_nivelautorizacionusuario(AUsuario : string) : integer;
procedure do_cargarnominasperiodos(AContrato : integer; APeriodo_Desde, APeriodo_Hasta : string);
function do_devengadocontrato(AContrato : integer; APeriodo : string) : integer; overload;
function get_montoajuste(AContrato : Integer; APeriodo : string; AIdCodigoAnular : Integer;
//        AIdCodigoReversion : Integer;
        ASigno : string; AIdCodigoEmparejar : Integer ) : currency;
function IsMaximoPeriodoDevengar_Valido(sPeriodo: String; var sMensaje: String): Boolean;
function Get_DescrPerConciliado(Contrato: Integer; Periodo: String): String;
function Get_FechaDistribucion: TDateTime;
procedure Do_ConfirmarAjuste(AIdAjuste : Integer);
procedure do_incorporarresumen(AIdCabecera : Integer);
function get_existeresumendevengado(AIdGrupo : Integer; APeriodoAReal, APeriodoAEstimado : String) : boolean;
procedure do_generardevengadogrupo(idgrupo : integer);
procedure do_marcargrupo(idgrupo : integer; tipo_marca : string; periodo_desde, periodo_hasta : string);

procedure do_initdebug(ANivel : integer);
procedure do_debug(ALinea : string; ANivel : integer);

function get_parametrobyclave (AClave : string) : string;
procedure do_resumetdt;
procedure do_inittdt;
procedure do_apareardeclaraciones(Acontrato : integer; APeriodo : string);
procedure do_aparearinvalidas;
procedure do_verificarexistenciaerrores(AIdCabecera : Integer);
procedure do_incorporardeclaracionnota (contrato : integer; periodo : String;
      empleados : integer; masasalarial : currency; importescero : integer;
      formulario : integer; tiponomina : integer; codigorectificativa : String; masadeclarada : currency;
      empleadosdeclarados : integer; importescerodeclarados : integer;
      fecharecepcionart : TDate; fechapresentaciondgi : TDate; bibliorato : integer;
      secuencia : integer; idobservacion : integer = 0; observacion : String  = '');
procedure do_incorporardeclaracionsim (contrato : integer; periodo : String;
      empleados : integer; masasalarial : currency; importescero : integer;
      formulario : integer; tiponomina : integer; codigorectificativa : String; masadeclarada : currency;
      empleadosdeclarados : integer; importescerodeclarados : integer;
      fecharecepcionart : TDate; fechapresentaciondgi : TDate);
procedure do_AplicaCambiosNivAu(APeriodo : Integer);
function get_contratovigente (ACUIT : string; APeriodo : string) : integer; overload;
function get_contratovigente (ACUIT : string; APeriodo : string; AIdRegimen: integer) : integer; overload;
function get_cuitempresa (acontrato : integer) : string;
procedure do_derivarautorizacion (idautorizacion : integer; nivel : integer; observacion : string);
procedure do_incorporardeclcabeceranota (idnota : integer;
      contrato : integer; fecharecepcionart : TDate; fechapresentaciondgi : TDate; bibliorato : integer;
      secuencia : integer);
procedure do_incorporardeclperiodonota( idnota : integer; periodo : string;
      empleados : integer; masasalarial : currency; importescero : integer; masadeclarada : currency;
      empleadosdeclarados : integer; importescerodeclarados : integer; formulario : integer;
      tiponomina : integer; codigorectificativa : string; idobservacion : integer = 0;
      observacion : string = ''); overload;
procedure do_incorporardeclperiodonota(
      idnota : integer; contrato : integer; periodo : string; fechapresentaciondgi : TDate;
      empleados : integer; masasalarial : currency; importescero : integer; masadeclarada : currency;
      empleadosdeclarados : integer; importescerodeclarados : integer; formulario : integer;
      tiponomina : integer; codigorectificativa : string; idobservacion : integer = 0;
      observacion : string = ''); overload;
procedure do_aprobarsolicitud (idsolicitud : integer; aprobar : boolean; idmotivo: integer; observaciones : string; agendar: boolean); overload;
procedure do_aprobarsolicitud (idsolicitud : integer; periodo : string; aprobar : boolean; idmotivo: integer; observaciones : string); overload;

procedure do_aprobar_recalculo_periodo(idsolicitud, contrato : integer;  periodo : string; accion : string);

procedure get_tarifavigente(contrato : integer; periodo : string; var porcmasa, sumafija : Real; var fechaendoso, fechavigencia : TDate); overload;
procedure get_tarifavigente(IdEndoso : integer; var porcmasa, sumafija : Real; var fechaendoso, fechavigencia : TDate); overload;
function get_devengadoprevisto (iddeclaracion : integer) : Currency; overload;
function get_devengadoprevisto (contrato : integer; periodo : string) : Currency; overload;
function Get_ValidarPeriodoPresentacionNota(AIdNota : integer; APeriodo : String) : boolean;
procedure do_activarpresentacionesnota(AIdNota : integer);
procedure do_actualizarcodigorect(AContrato : integer; APeriodo : string);
function get_descripcionautorizacion(AIdSolicitudAutorizacion : Integer) : string;
function get_idultimanominaperiodoproximo(Contrato : Integer; var Periodo : String) : integer;
function get_idultimanominaperiodoanterior(Contrato : Integer; var Periodo : String) : integer;
function get_periodoanterior(APeriodo : string; aCantidad: integer = 1) : string;
function get_periodoproximo(APeriodo : string; aCantidad: integer = 1) : string;
//function get_nroevento(AIdentificador : integer) : string;
procedure do_generarautorizacionnota(AIdNota : Integer; AIdTipoAutorizacion : Integer;
   AIdNivelAutorizacion : Integer; AObservacion : string);
procedure do_aprobaranalisis(idanalisis : Integer; estado : string; idmotivo : Integer; observacion : string; usuario: string);
procedure do_verificardeclaracion(AIdDDJJ : Integer); overload;
procedure do_procesarddjjanalisismanual(AIdCabecera : Integer);
procedure do_invalidarpresentacion(AIdDDJJ, aIdMotivo : Integer);
procedure do_desmarcarinconsistencia(AIdDDJJ, aIdMotivo : Integer);
procedure do_invalidarpresentacionsim(AIdDDJJ : Integer);
procedure Do_ActualizaInvalidNomSim(AIdDDJJ : Integer);
procedure do_revalidarpresentacion(AIdDDJJ, aIdMotivo : Integer);
procedure do_inicializartraza;
function get_nivelrequeridorecalculo (contrato : integer; periodo_desde : string;
      periodo_hasta   : string) : integer;
function get_descripcionnivelrequerido(AIdNivelAutorizacion : Integer) : string;
function get_estadoperiodos(AContrato : integer; APeriodo_desde, APeriodo_hasta, AEstado : string) : boolean;
function get_autorizacionrecalculo (contrato : integer; periodo_desde : string;
        periodo_hasta : string) : integer;

procedure do_devengarinvalidcontrato(contrato : integer);
function do_generarautorizacionperiodo (contrato  : integer;
      periodo  : string; cantidad_periodos : integer; nivel : integer;
      tipoautorizacion : integer) : integer; overload;
procedure do_checkeardevengadomensual(AIdCabecera : integer);
procedure do_marcarperiodostarifa(contrato: integer; vigenciatarifa : TDate);

procedure do_asignarlote(aIdLote: integer; aContrato: integer; aPeriodo: string);
procedure do_eliminarpresentacionsim (contrato : integer; periodo : String; fechapresentaciondgi : TDate);

function ExisteFormulario(aIdNota, aIdNotaPeriodo, aIdFormulario: integer; aPeriodoDesde, aPeriodoHasta: string): boolean;
function ExistePeriodo(aIdNota, aIdNotaPeriodo, aIdFormulario: integer; aPeriodoDesde, aPeriodoHasta: string): boolean;

function get_idnotaperiodo165_170sincab(aContrato : Integer; aPeriodo : string): integer;
function get_idnotaper165_170sinconst(aContrato : Integer; aPeriodo : string): integer;
function get_idnotaperiodo924_902sinres(aContrato : Integer; aPeriodo : string): integer;
function get_idnotaperiodosinticket(aContrato : Integer; aPeriodo : string): integer;
function get_idnotaperiododetallerns(aSecuencia : Integer): integer;
function get_idnotaperiodoticket(aContrato : Integer; aPeriodo : string; aIdFormulario: Integer; aNroverificado: string): integer;
function get_idnotaperiodoticketrg3279(aContrato : Integer; aPeriodo : string; aNroverificado: string): integer;
function get_idnotaperiodoformrg3279(aContrato : Integer; aPeriodo : string; aNroverificado: string): integer;
function get_idnotaperiodo170(aContrato : Integer; aPeriodo : string): integer;
function get_idnotaperiodo931(aContrato : Integer; aPeriodo : string): integer;
function get_prioridadautorizperiodo(aidsolicitud : Integer): integer;

function get_idnotaperiodo(aIdNota : Integer; aPeriodo : string): integer;
function get_tipoformulario(aIdNotaPeriodo: integer): integer;

function get_isrescindida(aContrato: integer): boolean;

procedure do_aplicarcaso1(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso2(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso3(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso4(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso5(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso6(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso7(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso8(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso9(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso10(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso11(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso19(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso21(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
procedure do_aplicarcaso24(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);

procedure GuardarInfoBloqueo(IdNota: integer; usuario: string);
function GetInfoBloqueo(IdNota: Integer): String;
function EliminarInfoBloqueo(IdNota: integer): string;

function GetUltimoBlockNota(aCuit: String): String;
function SumarCodigosReversionCuota(acontrato: integer; aperiodo: string): real;
function get_devengadoprevistosim(aContrato: integer; aPeriodo: string; empleados: integer; masa: real): real;
function get_ajustesaldoacreedorsim(aContrato: integer; aPeriodo: string; empleados: integer; masa: real): real;

procedure get_empleadosymasanota(aidnotaperiodo : integer; var empleados : integer; var masa: Real; var periodopresentacion: string);
procedure get_empleadosymasa(aidddjj : integer; var empleados : integer; var masa: Real; var periodopresentacion: string);

function get_importepagado(aContrato: integer; aPeriodo: string): real;
function get_importecodigomovim(aContrato: integer; aPeriodo: string; codigomov: string): real;
function get_importecodmovimsimilares(aContrato: integer; aPeriodo: string; codigomov: string): real;
procedure get_impactocambionominasim(contrato : integer; periodo: String; empleados : integer; masa: Real; var montoactual : real; var montofuturo: Real; var periodos: integer);
function get_contratonosuss(aContrato: integer): boolean;
function get_tipodevengado(aContrato : integer; aPeriodo: String): String;
function get_codigorectificsim(aContrato: integer; aPeriodo: string; fechapres: TDate; codigorectorig: string): integer;
procedure MostrarInfoBaja(Contrato:integer);
procedure MostrarInfoReafiliada(iContrato: Integer);
function get_ultimodevengadogrupo(aidGrupo: integer; aTipo: String) : string;
function get_procesarobservacionnota(aIdNotaContratoPeriodo: Integer; idObservacion: integer = -1; aplica: boolean = false): String;
procedure procesarobservacionesnota(aidNota: integer);

procedure do_procesarlotenota(aidNota: integer);
procedure ProcesarNotaInconsistente(aidNota: integer);
procedure do_procesarlotesitfac(aContrato: integer; atipositfacturacion: String);

procedure InsertarTextoObservacion(aIdObservacionNota: integer; aIdAccion: integer; aSubaccion: String; atexto: TStringList);
procedure InsertarTextoObservacionTextoLibre(aIdNotaContratoPeriodo: integer);
procedure InsertarObservacionGenerica(aIdNotaContratoPeriodo: integer; aTexto: String);
function GetObservacionGenerica(aIdNotaContratoPeriodo: integer):String;

procedure GetObservacionTextoLibre(aIdNotaContratoPeriodo: integer; var aTexto: TStringList);
function IsObservacionTextoLibre(aIdNotaContratoPeriodo: integer):boolean;

function GetEstadoNotaContratoPeriodo(aIdNotaContratoPeriodo: Integer): integer;

function GetValue(sfield: String; qryValores: TSDQuery): string;
procedure do_ActualizarEstadoPeriodos(idautorizacion, contrato: integer);

function Get_CantSiniestrosPeriodo(aContrato: integer; aPeriodo: String): Integer;
procedure do_seteobsformnota(aidnotaperiodo: integer; aobservacion: integer; asimula: boolean);
procedure do_eliminarobsformnotatmp(aidnotaperiodo: integer; asimula: boolean);
procedure do_generarnotagestion(contrato: integer; periodo: String; idaGestion: integer; tipo: String);
procedure do_regenerardeclaracion(idddjj: integer; idobservacion: integer; tiporeproceso: string; reprocesartrab, devengar: boolean; forzar: boolean = false);
procedure do_insertartareacontrato(idtarea: integer; contrato: integer; usuario: string);
function getdescripciontipocumplimiento(atipocumplimiento: String): String;

function get_notas_no_aplicadas(aContrato: integer): integer;
procedure do_informar_notas_no_aplicadas(aContrato: integer);
function PuedeProcesar: boolean;
function FinalizoProceso(aProceso: String; aFecha: TDateTime): boolean;
function RealizoDevengado(aPeriodo: String): boolean;
function get_nivelautrequeridonotasim(idNota: integer; tipoaut: String): integer;
function get_modopresentacion(aIdEmpresa: integer; aPeriodo: String): integer;

procedure do_aplicarnota(aIdNota: integer; autoTransaction: boolean = true);

function do_generarcarta(contrato: integer; nrogestion: integer; idgestionable: integer; idmodonotificacion: integer): integer;
procedure do_guardarparametrogestion(nrogestion: integer; parametro: string; valor: string);
procedure do_generarmailgestion(contrato: integer; nrogestion: integer; idgestionable: integer; MailNotificacion: string);
function get_mailcontrato(aContrato: Integer): String;
function ExisteMailContacto(aContrato: Integer): boolean;
function ExisteMailContactoSeleccionado(idcontacto: Integer): boolean;
procedure do_procesardetallewebrns(atransaccion: integer = -1);
procedure do_procesarNoHacerNadaDDJJAgendada(idDDJJAgendada : Integer);
procedure do_procesarReestablecerDDJJAgendada(idDDJJAgendada : Integer);
procedure do_procesarEliminarDDJJAgendada(idDDJJAgendada : Integer);
procedure DoEnviarMailAceptacionRechazo(Tipo: String; Contrato: Integer; Periodo: String; IdDDJJ, IdMotivoRechazo: TTableId; Observaciones: String);
procedure do_procesarddjjantestermino;
procedure do_generarmasaestimada;
procedure do_procesarpagosantestermino;
procedure do_reprocesarddjjpcp(AContrato: integer; APeriodo: string);

{
procedure do_ insertarsegevento(contrato, idexpediente, codevento: integer; sector: String;
  idingresoevento: integer; usuario, cerrarevento, usuarioderivaciontelef: String;
  diasvencimiento: integer; avisovencido, sectorinterviniente, enviarmail, observaciones: String; idContacto: integer);
}
procedure do_generarnota(contrato, idTipoFormulario: integer);


implementation

uses
  DB;

{---------------------------------------------------------------------------------}
function Get_UltimoPeriodoDevengado(ATipoDevengado : String) : string;
var
 sSql : string;
begin
  if ATipoDevengado = 'R' then
    sSql := 'select art.cobranza.get_ultperiododevengado(''D'',SYSDATE) from dual'
  else sSql := 'select art.cobranza.get_ultperiododevengado(''E'',SYSDATE) from dual';

  result := ValorSql(sSql, '0');
end;
{---------------------------------------------------------------------------------}
function get_maximoperiododev: string;
begin
  result := ValorSql('SELECT emi.utiles.get_maximoperiododev FROM dual');
end;
{---------------------------------------------------------------------------------}
function get_primerperiodoexigible(acontrato: integer): string;
begin
  result := ValorSqlEx('select art.cobranza.get_primerperiodoexigible(:contrato) from dual', [acontrato]);
end;

{---------------------------------------------------------------------------------}
function get_ultimoperiodoexigible(acontrato: integer; afechabaja, avigenciadesde: TDateTime): string;
begin
  result := ValorSql('select art.cobranza.get_ultimoperiodoexigible(' + SqlInt(acontrato)  + ',' + SqlDate(afechabaja) + ',' +  SqlDate(avigenciadesde) + ') from dual');
end;

{---------------------------------------------------------------------------------}
function Get_PeriodoPendienteDevengable : boolean;
begin
  result := ValorSql('select emision.get_periododevengablemensual  from dual', '1') = 0;
end;
{---------------------------------------------------------------------------------}
function Get_PeriodosComprometidos(ACUIT : string) : integer;
begin
  result := ValorSql('select emi.emision.get_periodoscomprometidos(' +
        SqlValue(ACUIT) + ') as PeriodosComprometidos from dual', '0');
end;

{---------------------------------------------------------------------------------}
procedure Do_ActualizaNominaSim(contrato : integer; periodo : String;
                                empleados : integer; masasalarial : currency; importescero : integer;
                                formulario : integer; tiponomina : integer; codigorectificativa : String;
                                masadeclarada : currency; empleadosdeclarados : integer;
                                importescerodeclarados : integer; fecharecepcionart : TDate; fechapresentaciondgi : TDate);
begin

  EjecutarStoreST('emi.simulacion.do_actualizarnominasim( ' +
       'contrato => ' + SqlValue(contrato) + ', ' +
       'periodo => ' + SqlValue(periodo) + ', ' +
       'empleados => ' + SqlValue(empleados) + ', ' +
       'masasalarial => ' + SqlNumber(masasalarial) + ', ' +
       'importescero => ' + SqlValue(importescero) + ', ' +
       'formulario => ' + SqlValue(formulario) + ', ' +
       'tiponomina => ' + SqlValue(tiponomina) + ', ' +
       'codigorectificativa => ' + SqlValue(codigorectificativa) + ', ' +
       'masadeclarada => ' + SqlNumber(masadeclarada) +  ' , ' +
       'empleadosdeclarados => ' + SqlValue(empleadosdeclarados) +  ' , ' +
       'importescerodeclarados => ' + SqlValue(importescerodeclarados) +  ' , ' +
       'fecharecepcionart => ' + SqlDate(fecharecepcionart) +  ' , ' +
       'fechapresentaciondgi => ' + SqlDate(fechapresentaciondgi) +  ');');
end;
{--------------------------------------------------------------------------------}
procedure Do_ActualizaNominaSim(aIdddjj: integer);
begin
  EjecutarStoreST('emi.simulacion.do_actualizarnominasim( ' + SqlNumber(aIdddjj) +  ');');
end;
{--------------------------------------------------------------------------------}
procedure Do_InicializarSimulacion;
begin
  EjecutarStoreST('emi.simulacion.Do_InicializarSimulacion;');
end;
{--------------------------------------------------------------------------------}
function Get_CoberturaCobranza(AContrato: Integer; APeriodo : String) : boolean;
begin
  result := ValorSql('select art.cobranza.check_cobertura_periodocobranz(' +
                                     SqlValue(AContrato) + ',' +
                                     SqlValue(APeriodo) +  ') from dual', '0') = ESTADO_ACTIVA;
end;
{--------------------------------------------------------------------------------}
function Get_EstadoContrato(AContrato: Integer) : integer;
begin
  result := ValorSql('select art.afiliacion.Get_EstadoContrato(' +
                                     SqlValue(AContrato) +  ') from dual', '0');
end;
{--------------------------------------------------------------------------------}
function Get_ValidarPeriodoPresentacionNota(AIdNota : integer; APeriodo : String) : boolean;
var
 sql : string;
begin
    sql := 'select distinct ''N'' from emi.inp_notacontratoperiodo where np_idnota = ' + SqlValue(AIdNota) +
           '   and np_periodo = ' + SqlValue(APeriodo) + 
           '   and rownum <= 1 ';
    result := ValorSql(sql, 'S') = 'S';
end;
{--------------------------------------------------------------------------------}
procedure Do_GenerarDevengadoMensual(aIdGrupo: integer; aPeriodo: String);
begin
  EjecutarStore('emi.emision.Do_GenerarDevengadoMensual(' + SqlValue(aIdGrupo) + ',' + SqlValue(aPeriodo) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_generarinfoanalisis(aUsuario: String);
begin
  EjecutarStoreEx('emi.analisisemision.do_generarinfoanalisis(:usuario);', [aUsuario]);
end;
{--------------------------------------------------------------------------------}
function get_ultimapresentacionperiodo(ACUIT, APeriodo : string) : string;
begin
  result := ValorSql('select emi.utiles.get_ultimadeclaracion(' +
                                     SqlValue(ACuit) + ',' +
                                     SqlValue(APeriodo) +  ') from dual', '');
end;
{--------------------------------------------------------------------------------}
function Get_UltimaPresentacionPeriodo(AContrato : integer; APeriodo : string) : string;
begin
  result := ValorSql('select emi.utiles.get_ultimadeclaracion(' +
                                     SqlValue(AContrato) + ',' +
                                     SqlValue(APeriodo) +  ') from dual', '');
end;
{--------------------------------------------------------------------------------}
function get_ultimaiddeclaracion(AContrato : integer; APeriodo : string) : integer; overload;
begin
  result := ValorSqlInteger('select emi.utiles.get_ultimaiddeclaracion(' +
                                    SqlValue(AContrato) + ',' +
                                    SqlValue(APeriodo) +  ') from dual', ART_EMPTY_ID);
end;
{--------------------------------------------------------------------------------}
function get_ultimaiddeclaracion(ACUIT : string; APeriodo : string) : integer; overload;
begin
  result := ValorSql('select emi.utiles.get_ultimaiddeclaracion(' +
                                     SqlValue(ACUIT) + ',' +
                                     SqlValue(APeriodo) +  ') from dual', '0');
end;

{--------------------------------------------------------------------------------}
function Get_IdDeclaracionPotencial(AContrato : integer; APeriodo : string) : integer;
begin
  result := ValorSqlInteger('select emi.utiles.get_iddeclaracionpotencial(' +
                                     SqlValue(AContrato) + ',' +
                                     SqlValue(APeriodo) +  ') from dual', 0);
end;

function get_iddeclaracionrestabsim(AContrato : integer; APeriodo : string; aidddjj: integer) : integer;
begin
  result := ValorSqlInteger('select emi.simulacion.get_iddeclaracionrestabsim(' +
                                     SqlValue(AContrato) + ',' +
                                     SqlValue(APeriodo) + ',' + SqlValue(aidddjj) +  ') from dual', 0);
end;
{--------------------------------------------------------------------------------}
function get_Idddjjcuil(AContrato: integer; APeriodo: string; AFechaPresentacion: TDateTime;
                        ACuil: String; aidtipoformularioexluido: integer;
                        var idddjj: integer; var idtrabajadorddjj: integer): integer;
begin
  with TSDStoredProc.Create(nil) do
  try
    DatabaseName := 'dbPrincipal';
    StoredProcName := 'emi.utiles.get_idddjjcuil';
    Params.CreateParam(ftInteger, 'contrato', ptInput);
    ParamByName('contrato').Value := AContrato;

    Params.CreateParam(ftString, 'periodo', ptInput);
    ParamByName('periodo').Value := Aperiodo;

    Params.CreateParam(ftDateTime, 'fecpres', ptInput);
    ParamByName('fecpres').Value := AFechaPresentacion;

    Params.CreateParam(ftString, 'cuil', ptInput);
    ParamByName('cuil').Value := ACuil;

    Params.CreateParam(ftInteger, 'idtipoformularioexluido', ptInput);
    ParamByName('idtipoformularioexluido').Value := aidtipoformularioexluido;

    Params.CreateParam(ftInteger, 'idddjj', ptOutput);
    Params.CreateParam(ftInteger, 'idtrabajadorddjj', ptOutput);
    ExecProc;

    idddjj := ParamByName('idddjj').Value;
    idtrabajadorddjj := ParamByName('idtrabajadorddjj').Value;

    result := 0;
  finally
    Free;
  end;
end;

{--------------------------------------------------------------------------------}
function Do_GenerarDevengadoSimulado(AContrato : integer; APeriodo : string; cdsMovimientos : TClientDataSet) : integer;
var
 Q : TSDQuery;
 i : integer;
begin
    Q := TSDQuery.Create(nil);
    try
      EjecutarStoreST('emi.simulacion.do_devengadocontratosimulado(' +
                                       SqlValue(AContrato) + ',' +
                                       SqlValue(APeriodo) +  ');');

      Q := GetQuery('SELECT zmo.mo_id "Nro",                                    ' +
                     '    zcm.cm_codigo "Código",                               ' +
                     '    zcm.cm_descripcion "Movim.",                          ' +
                     '    zmo.mo_fecharecepcion "Fecha Recepción",              ' +
                     '    zmo.mo_fechadist "Fecha Distrib.",                    ' +
                     '    zmo.mo_importe "Importe",                             ' +
                     '    zmo.mo_fechaaprobado "Fecha Aprobado",                ' +
                     '    zmo.mo_origen                                         ' +
                     '  FROM emi.imo_movimientosimulacion zmo, cob.zcm_codigomovimiento zcm  ' +
                     ' WHERE ((zcm.cm_id = zmo.mo_idcodigomovimiento))             ' +
                     '   AND zmo.mo_contrato = ' + SqlValue(AContrato)            +
                     '   AND zmo.mo_periodo = ' + SqlValue(APeriodo) + 'ORDER BY mo_id ');

      cdsMovimientos.Open;
      cdsMovimientos.EmptyDataSet;
      while not Q.Eof do
      begin
        cdsMovimientos.Append;
        for i := 0 to Q.FieldCount - 1 do
          cdsMovimientos.FieldByName(Q.Fields[i].FieldName).Value := Q.Fields[i].Value;
        cdsMovimientos.Post;
        Q.Next;
      end;

      result := 0;
    finally
      Q.Free;
    end;
end;
{--------------------------------------------------------------------------------}
procedure Do_actualizardevengadosim(AContrato : integer);
begin
  EjecutarStoreST('emi.simulacion.do_actualizardevengadosim(' + SqlValue(AContrato) + ');');
end;
{--------------------------------------------------------------------------------}
procedure Do_generardevengadosim(cdsDevengadoSim : TClientDataSet);
begin
  cdsDevengadoSim.First;
  while not cdsDevengadoSim.Eof do
  begin
    EjecutarStoreST('emi.simulacion.do_generardevengadosim(' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_id').AsInteger) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_contrato').AsInteger) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_periodo').AsString) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_idddjj').AsInteger) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_fechacalculo').AsDateTime) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_usuariocalculo').AsString) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_comentariodevengado').AsString) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_idtipodevengado').AsString) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_idproceso').AsInteger) + ' , ' +
                    SqlNumber (cdsDevengadoSim.fieldbyname('ds_devengadocuota').AsFloat) + ' , ' +
                    SqlNumber(cdsDevengadoSim.fieldbyname('ds_devengadofondo').AsFloat) + ' , ' +
                    SqlNumber(cdsDevengadoSim.fieldbyname('ds_devengadointeres').AsFloat) + ' , ' +
                    SqlNumber(cdsDevengadoSim.fieldbyname('ds_devengadootros').AsFloat) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_idprocesodevengado').AsInteger) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_idendoso').AsInteger) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_cuit').AsString) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_movimientodesde').AsInteger) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_movimientohasta').AsInteger) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_clase').AsString) + ' , ' +
                    SqlValue(cdsDevengadoSim.fieldbyname('ds_resultadodevengado').AsString) + ');');

    cdsDevengadoSim.Next;
  end;

end;
{--------------------------------------------------------------------------------}
procedure Do_actualizarddjjsim(cdsRecepcionesSim : TClientDataSet);
begin
  cdsRecepcionesSim.First;
  while not cdsRecepcionesSim.Eof do
  begin
    EjecutarStoreST('emi.simulacion.do_actualizarddjjsim(' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_cuit').AsString) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_periodo').AsString) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_empleados').AsInteger) + ' , ' +
                    SqlNumber(cdsRecepcionesSim.fieldbyname('ds_masasalarial').AsFloat) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_estado').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_suss').AsString) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_contrato').AsInteger) + ' , ' +
                    SqlDate(cdsRecepcionesSim.fieldbyname('ds_fechapresentacion').AsDateTime) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_valoresvariables').AsString) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_valoresestados').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_idseteo').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_codigorectificativa').AsString) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_idorigennomina').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_importescero').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_empleadosmaximos').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_empleadospromedios').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_empleadosminimos').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_idtiponomina').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_idestimacion').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_adeudadas').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_idformulario').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_codigorectificativaoriginal').AsString) + ' , ' +
                    SqlNumber(cdsRecepcionesSim.fieldbyname('ds_masadeclarada').AsFloat) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_empleadosdeclarados').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_importescerodeclarados').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_empleadosdeclaradosnoactivo').AsInteger) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_modocarga').AsString) + ' , ' +
                    SqlValue(cdsRecepcionesSim.fieldbyname('ds_idddjj').AsInteger) + ' , ' +
                    SqlString('S', true) + ');');

    cdsRecepcionesSim.Next;
  end;
end;
{--------------------------------------------------------------------------------}
function do_devengadocontrato(AContrato : integer; APeriodo : string) : integer; overload;
begin
  EjecutarStoreST('emi.emision.do_devengadocontrato(' +
                                     SqlValue(AContrato) + ',' +
                                     SqlValue(APeriodo) +  ');');

  result := 0;
end;
{--------------------------------------------------------------------------------}
procedure Do_IncorporarDeclaraciones(AIdCabecera : Integer);
begin
  EjecutarStoreST('emi.nominas.do_incorporardeclaraciones(' +
                                     SqlValue(AIdCabecera) +  ');');
end;
{--------------------------------------------------------------------------------}



procedure do_inicializarobservaciones(AId : Integer; ATipo : string);
begin
  EjecutarStoreST('emi.utiles.do_inicializarobservacion(' +
                 SqlValue(AId) + ', '       +
                 SqlValue(UpperCase(ATipo)) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_setobservacion(AId : Integer; ATipo : string; AResultado : Integer);
begin
  EjecutarStoreST('emi.utiles.do_setobservacion(' +
                 SqlValue(UpperCase(ATipo)) + ', ' +
                 SqlValue(AId) + ', ' +
                 SqlValue(AResultado) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_devengarinvalidos;
begin
  EjecutarStoreST('emi.emision.do_devengarinvalidos;');
end;
{--------------------------------------------------------------------------------}
procedure do_offlinedevengarinvalidos;
begin
  EjecutarSqlST('DECLARE                                                                                          ' +
                '  IdJob NUMBER;                                                                                  ' +
                'BEGIN                                                                                            ' +
                '  SYS.DBMS_JOB.SUBMIT(     job        => IdJob, what       => ''EMI.EMISION.DO_DEVENGARINVALIDOS(job);'',     ' +
                '                       next_date  => TO_DATE(TO_CHAR(sysdate + 0.0006944, ''DD/MM/YYYY hh24:mi:ss''), ''DD/MM/YYYY hh24:mi:ss''), ' +
                '                       no_parse   => FALSE);                                                     ' +
                'END;                                                                                             ');

end;
{--------------------------------------------------------------------------------}
procedure do_initsimulaciondevengado;
begin
  EjecutarStore('emi.simulacion.do_initsimulaciondevengado;');
end;
{--------------------------------------------------------------------------------}
function get_generarproceso(ATipo : Integer; AVisible : string;
      AJob : Integer = 0; AObservaciones : string = '') : integer;
begin
  result := ValorSql('select emi.utiles.get_generarproceso(' +
                                     SqlValue(ATipo) + ',' +
                                     SqlValue(AVisible) + ',' +
                                     SqlInteger(AJob, true) + ',' +
                                     SqlString(AObservaciones, true, true) +
                                     ') from dual', '0');
end;
{--------------------------------------------------------------------------------}
procedure do_actualizarproceso(AIdProceso : Integer);
begin
  EjecutarStoreST('emi.utiles.do_actualizarproceso(' + SqlValue(AIdProceso) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_finalizarproceso(AIdProceso : Integer);
begin
  EjecutarStoreST('emi.utiles.do_finalizarproceso(' + SqlValue(AIdProceso) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_actualizarcabecera(AIdCabecera : Integer; ACantidad : Integer; AAccion : String);
begin
  EjecutarStoreST('emi.utiles.do_actualizarcabecera(' + SqlValue(AIdCabecera) + ','
                                                      + SqlValue(ACantidad)   + ','
                                                      + SqlValue(AAccion)     + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_terminarcabecera(AIdCabecera : Integer);
begin
  EjecutarStoreST('emi.utiles.do_terminarcabecera(' + SqlValue(AIdCabecera) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_actualizarestadoverif(AIdDeclaracion : Integer);
begin
  EjecutarStoreST('emi.nominas.do_actualizarestadoverif(' + SqlValue(AIdDeclaracion) +  ');');
end;
{--------------------------------------------------------------------------------}
procedure do_activardeclaracion(AContrato : integer; APeriodo : string);
begin
  EjecutarStoreST('emi.nominas.do_activardeclaracion(' +
                                     SqlValue(AContrato) + ',' +
                                     SqlValue(APeriodo) +  ');');
end;
{--------------------------------------------------------------------------------}
procedure do_activardeclaracionsim(AContrato : integer; APeriodo : string);
begin
  EjecutarStoreST('emi.simulacion.do_activardeclaracionsim(' +
                                     SqlValue(AContrato) + ',' +
                                     SqlValue(APeriodo) +  ');');
end;
{--------------------------------------------------------------------------------}
procedure do_procesarpcp(AIdCabecera : Integer);
begin
  EjecutarStoreST('art.nomina.do_procesarpcp(' + SqlValue(AIdCabecera) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_procesarmisimplifiacionafi(AIdCabecera : Integer);
begin
  EjecutarStoreST('art.nomina.do_procesarmisimplifiacionafi(' + SqlValue(AIdCabecera) + ');');
end;
{--------------------------------------------------------------------------------}
procedure set_userlogin(ausername: string);
begin
  EjecutarStoreST('emi.set_userlogin(' +  SqlValue(ausername) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_marcarperiodosdependientes(contrato: integer; periodo, tipomarca: String);
begin
  EjecutarStoreST('emi.utiles.do_marcarperiodosdependientes(' +  SqlValue(contrato) + ', ' +
                                                                 SqlValue(periodo) + ', ' +
                                                                 SqlValue(tipomarca) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_devengarinvalidcontratosim(AContrato : integer);
begin
  EjecutarStoreST('emi.simulacion.do_devengarinvalidcontratosim(' +  SqlValue(AContrato) + ');');
end;

{--------------------------------------------------------------------------------}
(*
procedure do_activardeclaraccontrato(AContrato : integer);
begin
  EjecutarStoreST('emi.nominas.do_activardeclaraccontrato(' +
                                     SqlValue(AContrato) + ');');
end;
*)
{--------------------------------------------------------------------------------}
(*
procedure do_activardeclaraciones;
begin
  EjecutarStoreST('emi.nominas.do_activardeclaraciones;');
end;
*)
{--------------------------------------------------------------------------------}
function get_seteoactivo : integer;
begin
  result := ValorSql('select emi.utiles.get_seteoactivo from dual', '0');
end;

function get_ultimodevengadogrupo(aidGrupo: integer; aTipo: String) : string;
begin
  result := ValorSql('select emi.utiles.get_ultimodevengadogrupo( ' +  SqlValue(aidGrupo) + ',' + SqlValue(aTipo) + ') from dual', '');
end;
{--------------------------------------------------------------------------------}
procedure do_copiarparametro(AIdParametro : integer);
begin
  EjecutarStoreST('emi.utiles.do_copiarparametro(' + SqlValue(AIdParametro) +  ');');
end;
{--------------------------------------------------------------------------------}
function get_nivelautorizacionusuario(AUsuario : string) : integer;
begin
  result := ValorSql('select emi.utiles.get_nivelautorizacionusuario(' + SqlValue(AUsuario) + ') from dual', '0');

end;
{--------------------------------------------------------------------------------}
procedure do_cargarnominasperiodos(AContrato : integer; APeriodo_Desde, APeriodo_Hasta : string);
var
  sSql : string;
begin
  sSql := 'emi.simulacion.do_cargarnominasperiodos('
                          + SqlValue( AContrato ) + ','
                          + SqlValue( APeriodo_Desde ) + ','
                          + SqlValue( APeriodo_Hasta ) + ');';
  EjecutarStoreST( sSql );
end;
{--------------------------------------------------------------------------------}
function get_montoajuste(AContrato : Integer; APeriodo : string; AIdCodigoAnular : Integer;
//        AIdCodigoReversion : Integer;
        ASigno : string; AIdCodigoEmparejar : Integer ) : currency;

begin
  result := ValorSql('select emi.utiles.get_montoajuste(' +
                          SqlValue(AContrato) + ', ' +
                          SqlValue(APeriodo) + ', ' +
                          SqlValue(AIdCodigoAnular) + ', ' +
//                          SqlValue(AIdCodigoReversion) + ', ' +
                          SqlValue(ASigno)  + ', ' +
                          SqlNumber(AIdCodigoEmparejar, True) + ') from dual', '0');
end;
{--------------------------------------------------------------------------------}
function IsMaximoPeriodoDevengar_Valido(sPeriodo: String; var sMensaje: String): Boolean;
begin
  //FIXME
  Result := True;
end;
{--------------------------------------------------------------------------------}
function Get_DescrPerConciliado(Contrato: Integer; Periodo: String): String;
var
  sSql, sDescrPerConciliado: String;
begin
  sSql := 'SELECT RC_MARCACONCILIADO, TB_DESCRIPCION ' +
            'FROM CTB_TABLAS, ZRC_RESUMENCOBRANZA_EXT ' +
           'WHERE RC_CONTRATO=' + SqlValue( Contrato ) + ' ' +
             'AND RC_PERIODO=' + SqlValue( Periodo ) + ' ' +
             'AND TB_CODIGO(+)=RC_MARCACONCILIADO ' +
             'AND TB_CLAVE(+)=''CONCI''';

  with GetQuery( sSql ) do
  try
    if IsEmpty then
      sDescrPerConciliado := ''
    else if FieldByName( 'RC_MARCACONCILIADO' ).AsString = '' then
      sDescrPerConciliado := ''
    else
      sDescrPerConciliado := FieldByName( 'TB_DESCRIPCION' ).AsString
  finally
    free;
  end;
  Result := sDescrPerConciliado;
end;
{--------------------------------------------------------------------------------}
function Get_FechaDistribucion: TDateTime;
var
  sSql: String;
begin
  sSql := 'SELECT COBRANZA.GET_FECHADISTRIBUCION ' +
            'FROM DUAL';

  Result := ValorSqlDateTime( sSql );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure Do_ConfirmarAjuste(AIdAjuste : Integer);
begin
  EjecutarStoreST('emi.utiles.do_confirmarajuste(' + SqlValue(AIdAjuste) + ');');
end;
{--------------------------------------------------------------------------------}
procedure do_incorporarresumen(AIdCabecera : Integer);
begin
  EjecutarStoreST('emi.nominas.do_incorporarresumen(' + SqlValue(AIdCabecera) +  ');');
end;
{--------------------------------------------------------------------------------}
function get_existeresumendevengado(AIdGrupo : Integer; APeriodoAReal, APeriodoAEstimado : String) : boolean;
var
 sSql : string;
begin
  sSql := 'SELECT emi.utiles.get_existeresumendevengado(' + SqlValue(AIdGrupo) + ',' +
                                                             SqlValue(APeriodoAReal) + ',' +
                                                             SqlValue(APeriodoAEstimado) + ',''N'') from dual';
  Result := ValorSql( sSql, 'N') = 'S';
end;
{--------------------------------------------------------------------------------}
procedure do_generardevengadogrupo (idgrupo : integer);
begin
  

  EjecutarStoreST('emi.emision.do_generardevengadogrupo(' + SqlValue(idgrupo) +  ');');
end;
{--------------------------------------------------------------------------------}
procedure do_marcargrupo(idgrupo : integer; tipo_marca : string; periodo_desde, periodo_hasta : string);
begin
  EjecutarStoreST('emi.emision.do_marcargrupo(' +
            SqlValue(idgrupo) + ', ' +
            SqlValue(tipo_marca) + ', ' +
            SqlValue(periodo_desde) + ', ' +
            SqlValue(periodo_hasta) + ');');

end;
{------------------------------------------------------------------------------}
procedure do_initdebug(ANivel : integer);
begin
  EjecutarStoreST('emi.utiles.do_initdebug(' + SqlValue(ANivel) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_debug(ALinea : string; ANivel : integer);
begin
  EjecutarStoreST('emi.utiles.do_debug('
            + SqlValue(ALinea) + ', '
            + SqlValue(ANivel) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_apareardeclaraciones(Acontrato : integer; APeriodo : string);
begin
  EjecutarStoreST('emi.nominas.do_apareardeclaracion(' + SqlValue(AContrato) + ', '
                                                       + SqlValue(APeriodo) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_aparearinvalidas;
begin
  EjecutarStoreST('emi.nominas.do_aparearinvalidas;');
end;
{------------------------------------------------------------------------------}
function get_parametrobyclave (AClave : string) : string;
var
 sSql : string;
begin
  sSql := 'SELECT emi.utiles.get_parametrobyclave(' + SqlValue(AClave) + ') from dual';
  Result := ValorSql( sSql, '');
end;
{------------------------------------------------------------------------------}
procedure do_inittdt;
begin
  try
    EjecutarSqlST('TRUNCATE TABLE tmp.tdt_ddjjtrabajadores DROP STORAGE');
  except
  end;
end;
{------------------------------------------------------------------------------}
procedure do_resumetdt;
//var
// sSql : string;
begin
{  sSql := 'BEGIN ' +
          'CREATE INDEX tmp.ndx_tdt_ddjjtrabajadores ON tmp.tdt_ddjjtrabajadores  ' +
          '(  ' +
          '    dt_cuit                         ASC, ' +
          '    dt_periodo                      ASC, ' +
          '    dt_codrect                      ASC  ' +
          '  )  TABLESPACE  ind PARALLEL (DEGREE 2) NOLOGGING; ' +
          'END;';
}
end;
{------------------------------------------------------------------------------}
procedure do_verificarexistenciaerrores(AIdCabecera : Integer);
begin
  EjecutarStore('emi.utiles.do_verificarexistenciaerrores(' + SqlValue(AIdCabecera) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_AplicaCambiosNivAu(APeriodo : Integer);
begin
  EjecutarStoreST('emi.utiles.do_AplicaCambiosNivAu(' + SqlValue(APeriodo) + ');');
end;
{------------------------------------------------------------------------------}
function get_contratovigente (ACUIT : string; APeriodo : string) : integer;
var
 sSql : string;
begin
  sSql := 'SELECT nvl(afiliacion.get_contratovigente(' + SqlValue(ACUIT) + ', '
                                                       + SqlValue(APeriodo) + '), 0) FROM  dual';
  Result := ValorSqlInteger( sSql);
end;
{------------------------------------------------------------------------------}
function get_contratovigente (ACUIT : string; APeriodo : string; AIdRegimen: integer) : integer;
var
 sSql : string;
begin
  sSql := 'SELECT nvl(afiliacion.get_contratovigente(' + SqlValue(ACUIT) + ', '
                                                       + SqlValue(APeriodo) +  ', '
                                                       + SqlValue(AIdRegimen) + '), 0) FROM  dual';
  Result := ValorSqlInteger( sSql);
end;
{------------------------------------------------------------------------------}
function get_cuitempresa (acontrato : integer) : string;
var
 sSql : string;
begin
  sSql := 'SELECT nvl(afiliacion.get_cuitempresa(' + SqlValue(acontrato) + '), '''') FROM  dual';
  Result := ValorSql( sSql, '');
end;
{------------------------------------------------------------------------------}
procedure do_derivarautorizacion (idautorizacion : integer; nivel : integer;
      observacion : string);
var
 sSql : string;
begin
  sSql := 'emi.emision.do_derivarsolicitud (' + SqlValue(idautorizacion) + ', ' +
                        SqlValue(nivel) + ', ' +
                        SqlValue(observacion) + ');';
  EjecutarStoreST( sSql );
end;
{------------------------------------------------------------------------------}
procedure do_incorporardeclcabeceranota (
      idnota : integer;
      contrato : integer;
      fecharecepcionart : TDate;
      fechapresentaciondgi : TDate;
      bibliorato : integer;
      secuencia : integer);
var
 sSql : string;
begin
  sSql := 'emi.nominas.do_incorporardeclcabeceranota (' +
          '      idnota   => ' + SqlValue(idnota)  + ' , ' +
          '      contrato => ' + SqlValue(contrato)  + ' , ' +
          '      fecharecepcionart => ' + SqlDate(fecharecepcionart)  + ' , ' +
          '      fechapresentaciondgi => ' + SqlDate(fechapresentaciondgi)  + ' , ' +
          '      bibliorato => ' + SqlValue(bibliorato)  + ' , ' +
          '      secuencia => ' + SqlValue(secuencia) +  ');';
  EjecutarStoreST( sSql );
end;
{------------------------------------------------------------------------------}
procedure do_incorporardeclperiodonota( idnota : integer; periodo : string;
      empleados : integer; masasalarial : currency; importescero : integer; masadeclarada : currency;
      empleadosdeclarados : integer; importescerodeclarados : integer; formulario : integer;
      tiponomina : integer; codigorectificativa : string; idobservacion : integer = 0;
      observacion : string = '');
begin
  EjecutarStoreST('emi.nominas.do_incorporardeclperiodonota (' +
       'idnota                 => ' + SqlValue(idnota) + ', ' +
       'periodo                => ' + SqlValue(periodo) + ', ' +
       'empleados              => ' + SqlValue(empleados) + ', ' +
       'masasalarial           => ' + SqlNumber(masasalarial) + ', ' +
       'importescero           => ' + SqlValue(importescero) + ', ' +
       'masadeclarada          => ' + SqlNumber(masadeclarada) +  ' , ' +
       'empleadosdeclarados    => ' + SqlValue(empleadosdeclarados) +  ' , ' +
       'importescerodeclarados => ' + SqlValue(importescerodeclarados) + ' , ' +
       'idobservacion => ' + SqlNumber(idobservacion, True) +  ' , ' +
       'observacion => ' + SqlValue(observacion) + ', ' +
       'formulario => ' + SqlValue(formulario) + ', ' +
       'tiponomina => ' + SqlValue(tiponomina) + ', ' +
       'codigorectificativa => ' + SqlValue(codigorectificativa) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_incorporardeclperiodonota(
      idnota : integer; contrato : integer; periodo : string; fechapresentaciondgi : TDate;
      empleados : integer; masasalarial : currency; importescero : integer; masadeclarada : currency;
      empleadosdeclarados : integer; importescerodeclarados : integer; formulario : integer;
      tiponomina : integer; codigorectificativa : string; idobservacion : integer = 0;
      observacion : string = '');
begin
  EjecutarStoreST('emi.nominas.do_incorporardeclperiodonota (' +
       'idnota                 => ' + SqlValue(idnota) + ', ' +
       'periodo                => ' + SqlValue(periodo) + ', ' +
       'empleados              => ' + SqlValue(empleados) + ', ' +
       'masasalarial           => ' + SqlNumber(masasalarial) + ', ' +
       'importescero           => ' + SqlValue(importescero) + ', ' +
       'masadeclarada          => ' + SqlNumber(masadeclarada) +  ' , ' +
       'empleadosdeclarados    => ' + SqlValue(empleadosdeclarados) +  ' , ' +
       'importescerodeclarados => ' + SqlValue(importescerodeclarados) + ' , ' +
       'idobservacion => ' + SqlNumber(idobservacion, True) +  ' , ' +
       'observacion => ' + SqlValue(observacion) + ', ' + 
       'formulario => ' + SqlValue(formulario) + ', ' +
       'tiponomina => ' + SqlValue(tiponomina) + ', ' +
       'codigorectificativa => ' + SqlValue(codigorectificativa) + ', ' +
       'fechapresentaciondgi => ' + SqlDate(fechapresentaciondgi) +  ' , ' +
       'contrato => ' + SqlValue(contrato) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_incorporardeclaracionnota (
      contrato : integer;
      periodo : String;
      empleados : integer;
      masasalarial : currency;
      importescero : integer;
      formulario : integer;
      tiponomina : integer;
      codigorectificativa : String;
      masadeclarada : currency;
      empleadosdeclarados : integer;
      importescerodeclarados : integer;
      fecharecepcionart : TDate;
      fechapresentaciondgi : TDate;
      bibliorato : integer;
      secuencia : integer;
      idobservacion : integer = 0;
      observacion : String  = '');
begin
  EjecutarStoreST('emi.nominas.do_incorporardeclaracionnota (' +
       'contrato => ' + SqlValue(contrato) + ', ' +
       'periodo => ' + SqlValue(periodo) + ', ' +
       'empleados => ' + SqlValue(empleados) + ', ' +
       'masasalarial => ' + SqlNumber(masasalarial) + ', ' +
       'importescero => ' + SqlValue(importescero) + ', ' +
       'formulario => ' + SqlValue(formulario) + ', ' +
       'tiponomina => ' + SqlValue(tiponomina) + ', ' +
       'codigorectificativa => ' + SqlValue(codigorectificativa) + ', ' +
       'masadeclarada => ' + SqlNumber(masadeclarada) +  ' , ' +
       'empleadosdeclarados => ' + SqlValue(empleadosdeclarados) +  ' , ' +
       'importescerodeclarados => ' + SqlValue(importescerodeclarados) +  ' , ' +
       'fecharecepcionart => ' + SqlDate(fecharecepcionart) +  ' , ' +
       'fechapresentaciondgi => ' + SqlDate(fechapresentaciondgi) +  ' , ' +
       'bibliorato => ' + SqlValue(bibliorato) +  ' , ' +
       'secuencia => ' + SqlValue(secuencia) +  ' , ' +
       'idobservacion => ' + SqlNumber(idobservacion, True) +  ' , ' +
       'observacion => ' + SqlValue(observacion) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_aprobarsolicitud(idsolicitud : integer; aprobar : boolean; idmotivo: integer; observaciones : string; agendar: boolean); overload;
begin
  EjecutarStoreST('emi.emision.do_aprobarsolicitud(' +
              SqlValue(idsolicitud) + ',' +
              SqlBoolean(aprobar) + ',' +
              SqlValue(idmotivo) + ',' +
              SqlValue(observaciones) + ',' +
              SqlBoolean(agendar) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_aprobarsolicitud (idsolicitud : integer; periodo : string; aprobar : boolean; idmotivo: integer; observaciones : string); overload;
begin
  EjecutarStoreST('emi.emision.do_aprobarsolicitud(' +
              SqlValue(idsolicitud) + ',' +
              SqlValue(periodo) + ', ' +
              SqlBoolean(aprobar) + ',' +
              SqlValue(idmotivo) + ',' +
              SqlValue(observaciones) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_aprobar_recalculo_periodo(idsolicitud, contrato : integer;  periodo : string; accion : string);
begin
  EjecutarStoreST('emi.emision.do_aprobar_recalculo_periodo(' +
              SqlValue(idsolicitud) + ',' +
              SqlValue(contrato) + ', ' +
              SqlValue(periodo) + ', ' +
              SqlString(accion, true, true) + ');');
end;
{------------------------------------------------------------------------------}
procedure get_tarifavigente(contrato : integer; periodo : string; var porcmasa, sumafija : Real; var fechaendoso, fechavigencia : TDate);
var
 sSql : string;
 Q : TSDQuery;
begin
  sSql := '  SELECT ht_PorcMasa, ht_SumaFija, ht_VigenciaTarifa, ht_FechaAlta ' +
          '    FROM aht_HistoricoTarifario                                    ' + 
          '   WHERE ht_Id= art.afiliacion.Get_IdMaxEndosoVig(' + SqlValue(Contrato) + ', ' + SqlValue(Periodo) + ')';
  Q := GetQuery(sSql);
  try
    if Q.RecordCount > 0 then
    begin
      porcmasa := Q.FieldByName('ht_PorcMasa').AsFloat;
      sumafija := Q.FieldByName('ht_SumaFija').AsCurrency;
      fechavigencia := Q.FieldByName('ht_VigenciaTarifa').AsDateTime;
      fechaendoso   := Q.FieldByName('ht_FechaAlta').AsDateTime;
    end
    else
    begin
      porcmasa := 0;
      sumafija := 0;
      fechavigencia := 0;
      fechaendoso   := 0;
    end;
  finally
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure get_tarifavigente(IdEndoso : integer; var porcmasa, sumafija : Real; var fechaendoso, fechavigencia : TDate);
var
 sSql : string;
 Q : TSDQuery;
begin
  sSql := '  SELECT ht_PorcMasa, ht_SumaFija, ht_VigenciaTarifa, ht_FechaAlta ' +
          '    FROM aht_HistoricoTarifario                                    ' +
          '   WHERE ht_Id=' + SqlValue(IdEndoso);
  Q := GetQuery(sSql);
  try
    if Q.RecordCount > 0 then
    begin
      porcmasa := Q.FieldByName('ht_PorcMasa').AsFloat;
      sumafija := Q.FieldByName('ht_SumaFija').AsCurrency;
      fechavigencia := Q.FieldByName('ht_VigenciaTarifa').AsDateTime;
      fechaendoso   := Q.FieldByName('ht_FechaAlta').AsDateTime;
    end
    else
    begin
      porcmasa := 0;
      sumafija := 0;
      fechavigencia := 0;
      fechaendoso   := 0;
    end;

  finally
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
function get_devengadoprevisto (contrato : integer; periodo : string) : Currency;
var
 sSql : string;
begin
  sSql := 'SELECT emi.emision.get_devengadoprevisto(' + SqlValue(Contrato) + ', ' + SqlValue(Periodo) + ') from dual';
  Result := ValorSql(sSql, '0');
end;
{------------------------------------------------------------------------------}
function get_devengadoprevisto (iddeclaracion : integer) : Currency;
var
  sSql : string;
begin
  sSql := 'SELECT emi.emision.get_devengadoprevisto(' + SqlValue(iddeclaracion) + ') from dual';
  Result := ValorSql(sSql, '0');
end;
{------------------------------------------------------------------------------}
function get_existebiblioratosecuencia(bibliorato, secuencia : integer) : boolean;
var
  sSql : string;
begin
  sSql := 'select 1 from emi.ino_nota WHERE no_bibliorato = ' + SqlValue(bibliorato) +  ' AND no_secuencia = ' + SqlValue(secuencia);
  Result := ValorSql(sSql, '0');
end;
{------------------------------------------------------------------------------}
procedure do_activarpresentacionesnota(AIdNota : integer);
var
  sSql : string;
begin
  sSql := 'emi.nominas.do_activarpresentacionesnota(' + SqlValue(AIdNota) + ');';
  EjecutarStoreST(sSql);
end;
{------------------------------------------------------------------------------}
procedure do_actualizarcodigorect(AContrato : integer; APeriodo : string);
var
  sSql : string;
begin
  sSql := 'emi.nominas.do_actualizarcodigorect(' + SqlValue(AContrato) + ', '
                                                 + SqlValue(APeriodo) + ');';
  EjecutarStoreST(sSql);
end;
{------------------------------------------------------------------------------}
function get_descripcionautorizacion(AIdSolicitudAutorizacion : Integer) : string;
var
  sSQL : string;
  Q : TSDQuery;
begin
  sSql := 'SELECT ita.ta_descripcion tipo, ' +
       '          ina.na_descripcion nivel,         ' +
       '          isa.sa_fechacumplimiento fecha_cumplimiento,    ' +
       '          isa.sa_tipocumplimiento forma_cumplimienta,     ' +
       '          DECODE (isa.sa_tipocumplimiento,                  ' +
       '                  ''A'', ''Aprobada'',                      ' +
       '                  ''N'', ''No Aprobada'',                   ' +
       '                  ''D'', ''Derivada'',                      ' +
       '                  ''Pendiente''                             ' +
       '                  ) "Estado"                                ' +
       ' FROM emi.isa_solicitudautorizacion isa,                    ' +
       '      afi.aco_contrato_ext aco,                                 ' +
       '      afi.aem_empresa aem,                                  ' +
       '      emi.ina_nivelautorizacion ina,                        ' +
       '      emi.ita_tipoautorizacion ita                          ' +
       ' WHERE (    (aco.co_contrato = isa.sa_contrato)             ' +
        'AND (aem.em_id = aco.co_idempresa)                         ' +
        'AND (ina.na_id = isa.sa_idnivelautorizacion)               ' +
        'AND (ita.ta_id = isa.sa_idtipoautorizacion)) and isa.sa_id = '
    + SqlValue(AIdSolicitudAutorizacion);

    Q := GetQuery(sSql);

    result := '';
    if Q.RecordCount > 0 then
    begin
       result := 'Tipo:     ' + Q.FieldByName('tipo').AsString  + #13#10   +
                 'Nivel:    ' + Q.FieldByName('nivel').AsString  + #13#10  +
                 'Estado:   ' + Q.FieldByName('estado').AsString  + #13#10;

       if not Q.FieldByName('fecha_cumplimiento').IsNull then
       begin
         result := result + 'F.Cump.:   ' + Q.FieldByName('fecha_cumplimiento').AsString + #13#10 +
                            'Resultado: ' + Q.FieldByName('forma_cumplimiento').AsString + #13#10;
       end;
    end;
end;
{------------------------------------------------------------------------------}
function get_idultimanominaperiodoanterior(Contrato : Integer; var Periodo : String) : integer;
var
 periodoanterior : string;
begin
  //Calcula el periodo anterior ---
  periodoanterior := ValorSQL('select periodo_anterior(' + SqlValue(Periodo) + ') from dual', '0');
  //Calcula el período mas proximo en el que se dispone de nómina
  periodo := Get_UltimaPresentacionPeriodo(Contrato, PeriodoAnterior);

  //Calcula el Id de la declaración para el periodo de la nomina existen mas
  //proxima a periodo anterior.
  if periodo <> '' then
    result := get_ultimaiddeclaracion(Contrato, Periodo)
  else result := -1;
end;
{------------------------------------------------------------------------------}
function get_idultimanominaperiodoproximo(Contrato : Integer; var Periodo : String) : integer;
var
 periodoproximo : string;
begin
  //Calcula el periodo anterior ---

  periodoproximo := get_periodoproximo(Periodo);
  //Calcula el período mas proximo en el que se dispone de nómina
  periodo := Get_UltimaPresentacionPeriodo(Contrato, periodoproximo);

  //Calcula el Id de la declaración para el periodo de la nomina existen mas
  //proxima a periodo anterior.
  if periodo <> '' then
    result := get_ultimaiddeclaracion(Contrato, Periodo)
  else result := -1;
end;
{------------------------------------------------------------------------------}
function get_periodoproximo(APeriodo : string; aCantidad: integer = 1) : string;
begin
  result := ValorSQL('select art.utiles.periodo_proximo(' + SqlValue(APeriodo) + ', ' + SqlValue(aCantidad) + ') from dual', '');
end;
{------------------------------------------------------------------------------}
function get_periodoanterior(APeriodo : string; aCantidad: integer = 1) : string;
begin
  result := ValorSQL('select art.utiles.periodo_anterior(' + SqlValue(APeriodo) + ', ' + SqlValue(aCantidad) + ') from dual', '');
end;
{------------------------------------------------------------------------------
function get_nroevento(AIdentificador : integer) : string;
begin
  result := ValorSQL('select se_id || '' - '' || se_subevento from  cse _ seguimiento evento where se_identificador = ' + SqlValue(AIdentificador), '');
end;
{------------------------------------------------------------------------------}
procedure do_generarautorizacionnota(AIdNota : Integer; AIdTipoAutorizacion : Integer; AIdNivelAutorizacion : Integer; AObservacion : string);
begin
  EjecutarStoreST('emi.utiles.do_generarautorizacionnota(' + SqlValue(AIdNota) + ', '
                                                           + SqlValue(AIdTipoAutorizacion) + ', '
                                                           + SqlValue(AIdNivelAutorizacion) + ', '
                                                           + SqlValue(AObservacion) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_aprobaranalisis(idanalisis : Integer; estado : string; idmotivo : Integer; observacion : string; usuario: string);
begin
  EjecutarStoreST('emi.analisisemision.do_aprobaranalisis(' + SqlValue(idanalisis) + ', '
                                                            + SqlValue(estado) + ', '
                                                            + SqlValue(idmotivo) + ', '
                                                            + SqlValue(observacion) + ', '
                                                            + SqlValue(usuario)
                                                            + ');');
end;
{------------------------------------------------------------------------------}
procedure do_verificardeclaracion(AIdDDJJ : Integer);
begin
  EjecutarStoreST('emi.nominas.do_verificardeclaracion(' + SqlValue(AIdDDJJ) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_procesarddjjanalisismanual(AIdCabecera : Integer);
begin
  EjecutarStoreST('emi.nominas.do_procesarddjjanalisismanual(' + SqlValue(AIdCabecera) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_desmarcarinconsistencia(AIdDDJJ, aIdMotivo : Integer);
begin
  EjecutarStoreST('emi.nominas.do_desmarcarinconsistencia (' + SqlValue(AIdDDJJ) + ', ' + SqlValue(aIdMotivo) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_invalidarpresentacion(AIdDDJJ, aIdMotivo : Integer);
begin
  EjecutarStoreST('emi.nominas.do_invalidarpresentacion (' + SqlValue(AIdDDJJ) + ', ' + SqlValue(aIdMotivo) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_revalidarpresentacion(AIdDDJJ, aIdMotivo: Integer);
begin
  EjecutarStoreST('emi.nominas.do_revalidarpresentacion (' + SqlValue(AIdDDJJ) + ', ' + SqlValue(aIdMotivo) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_inicializartraza;
var
 logear : boolean;
const
 TRAZA = 'TRAZA'; //Clave para el nivel de traza.
 TRAZA_ACTIVADA    = 0;
 TRAZA_DESACTIVADA = 9;
begin
  logear := ValorSql('select emi.utiles.get_parametrobyclave(''' +
                              TRAZA + ''') from dual', 'N') = 'S';
  if logear then
   do_initdebug(TRAZA_ACTIVADA)
  else
   do_initdebug(TRAZA_DESACTIVADA);
end;
{------------------------------------------------------------------------------}
function get_nivelrequeridorecalculo (contrato : integer; periodo_desde : string;
      periodo_hasta   : string) : integer;
begin
  result := ValorSQL('select nvl(emi.utiles.get_nivelrequeridorecalculo(' + SqlValue(contrato)  + ', '
                                    + SqlValue(periodo_desde)  + ', '
                                    + SqlValue(periodo_hasta)  + '), -1) from dual', '-1');
end;
{------------------------------------------------------------------------------}
function get_descripcionnivelrequerido(AIdNivelAutorizacion : Integer) : string;
begin
  result := ValorSql('select na_descripcion from emi.ina_nivelautorizacion where na_id = '
          + SqlValue(AIdNivelAutorizacion), '');
end;
{------------------------------------------------------------------------------}
function get_estadoperiodos(AContrato : integer; APeriodo_desde, APeriodo_hasta, AEstado : string) : boolean;
begin
  result := ValorSql('select count(*) from emi.irp_resumenperiodo  '
                   + ' where rp_contrato = ' + SqlValue(Acontrato)
                   + '   and rp_periodo >= ' + SqlValue(APeriodo_desde)
                   + '   and rp_periodo <= ' + SqlValue(APeriodo_hasta)
                   + '   and rp_estado = ' + SqlValue(AEstado), '0') > 0;
end;


function get_autorizacionrecalculo (contrato : integer; periodo_desde : string;
        periodo_hasta : string) : integer;
begin
  with TSDStoredProc.Create(nil) do
  try
    DatabaseName := 'dbPrincipal';
    StoredProcName := 'emi.utiles.get_autorizacionrecalculo';
    Params.CreateParam(ftInteger, 'contrato', ptInput);
    ParamByName('contrato').Value := contrato;

    Params.CreateParam(ftString, 'periododesde', ptInput);
    ParamByName('periododesde').Value := periodo_desde;

    Params.CreateParam(ftString, 'periodohasta', ptInput);
    ParamByName('periodohasta').Value := periodo_hasta;

    Params.CreateParam(ftinteger, 'resultado', ptOutput);
    ExecProc;

    result := ParamByName('resultado').Value;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure do_devengarinvalidcontrato(contrato : integer);
begin
  EjecutarStoreST('emi.emision.do_devengarinvalidcontrato(' + SqlValue(contrato) + ');');
end;
{------------------------------------------------------------------------------}
function do_generarautorizacionperiodo (contrato  : integer;
      periodo  : string; cantidad_periodos : integer; nivel : integer;
      tipoautorizacion : integer) : integer;
begin
  with TSDStoredProc.Create(nil) do
  try
    DatabaseName := 'dbPrincipal';
    StoredProcName := 'emi.utiles.do_generarautorizacionperiodo';
    Params.CreateParam(ftInteger, 'contrato', ptInput);
    ParamByName('contrato').Value := contrato;

    Params.CreateParam(ftString, 'periodo', ptInput);
    ParamByName('periodo').Value := periodo;

    Params.CreateParam(ftInteger, 'cantidad_periodos', ptInput);
    ParamByName('cantidad_periodos').Value := 1;

    Params.CreateParam(ftInteger, 'nivel', ptInput);
    ParamByName('nivel').Value := nivel;

    Params.CreateParam(ftInteger, 'tipoautorizacion', ptInput);
    ParamByName('tipoautorizacion').Value := tipoautorizacion;

    Params.CreateParam(ftinteger, 'resultado', ptOutput);
    ExecProc;

    result := ParamByName('resultado').Value;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure do_checkeardevengadomensual(AIdCabecera : integer);
begin
  EjecutarStoreST('emi.utiles.do_checkdevengadoindividual(' + SqlValue(AIdCabecera) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_marcarperiodostarifa(contrato: integer; vigenciatarifa : TDate);
begin
  EjecutarStoreST('emi.utiles.do_marcarperiodostarifa(' + SqlValue(contrato) + ', ' +
                                                          SqlDate(vigenciatarifa) + ');');
end;
{------------------------------------------------------------------------------}
procedure do_asignarlote(aIdLote: integer; aContrato: integer; aPeriodo: string);
begin
  EjecutarStore('emi.emision.do_asignarlote(' + SqlValue(aIdLote) + ', ' + SqlValue(aContrato) + ', '
                + SqlValue(aPeriodo) + ');');
end;
{------------------------------------------------------------------------------}
//By Pablo
procedure do_incorporardeclaracionsim (contrato : integer; periodo : String;
      empleados : integer; masasalarial : currency; importescero : integer;
      formulario : integer; tiponomina : integer; codigorectificativa : String; masadeclarada : currency;
      empleadosdeclarados : integer; importescerodeclarados : integer;
      fecharecepcionart : TDate; fechapresentaciondgi : TDate);
begin
  EjecutarStoreST('emi.simulacion.do_incorporardeclaracionsim (' +
       'contrato => ' + SqlValue(contrato) + ', ' +
       'periodo => ' + SqlValue(periodo) + ', ' +
       'empleados => ' + SqlValue(empleados) + ', ' +
       'masasalarial => ' + SqlNumber(masasalarial) + ', ' +
       'importescero => ' + SqlValue(importescero) + ', ' +
       'formulario => ' + SqlValue(formulario) + ', ' +
       'tiponomina => ' + SqlValue(tiponomina) + ', ' +
       'codigorectificativa => ' + SqlValue(codigorectificativa) + ', ' +
       'masadeclarada => ' + SqlNumber(masadeclarada) +  ' , ' +
       'empleadosdeclarados => ' + SqlValue(empleadosdeclarados) +  ' , ' +
       'importescerodeclarados => ' + SqlValue(importescerodeclarados) +  ' , ' +
       'fecharecepcionart => ' + SqlDate(fecharecepcionart) +  ' , ' +
       'fechapresentaciondgi => ' + SqlDate(fechapresentaciondgi) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_eliminarpresentacionsim (contrato : integer; periodo : String; fechapresentaciondgi : TDate);
begin
  EjecutarStoreST('emi.simulacion.do_eliminarpresentacionsim (' + SqlValue(contrato) + ', ' +
                                                                  SqlValue(periodo) + ', ' +
                                                                  SqlDate(fechapresentaciondgi) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_invalidarpresentacionsim(AIdDDJJ : Integer);
begin
  EjecutarStoreST('emi.simulacion.do_invalidarpresentacionsim (' + SqlValue(AIdDDJJ) + ');');
end;
{------------------------------------------------------------------------------}
procedure Do_ActualizaInvalidNomSim(AIdDDJJ : Integer);
begin
  EjecutarStoreST('emi.simulacion.do_actualizainvalidnomsim (' + SqlValue(AIdDDJJ) + ');');
end;
{------------------------------------------------------------------------------}
function ExisteFormulario(aIdNota, aIdNotaPeriodo, aIdFormulario: integer; aPeriodoDesde, aPeriodoHasta: string): boolean;
begin
  result := ExisteSql(' SELECT 1 ' +
                      ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                      ' AND NP_PERIODO >= ' + SqlValue(aPeriodoDesde) +
                      ' AND NP_PERIODO <= ' + SqlValue(aPeriodoHasta) +
                      ' AND NP_ID <> ' + SqlValue(aIdNotaPeriodo) +
                      ' AND NP_IDTIPOFORMULARIO <> ' + SqlValue(aIdFormulario) +
                      ' AND NP_FECHABAJA IS NULL ' +
                      ' AND NP_FORMULARIOMIXTO <> ''S''');
end;
{------------------------------------------------------------------------------}
function ExistePeriodo(aIdNota, aIdNotaPeriodo, aIdFormulario: integer; aPeriodoDesde, aPeriodoHasta: string): boolean;
begin
  result := ExisteSql(' SELECT 1 ' +
                      ' FROM EMI.INP_NOTACONTRATOPERIODO ' +
                      ' WHERE NP_IDNOTA = ' + SqlValue(aIdNota) +
                      ' AND NP_PERIODO >= ' + SqlValue(aPeriodoDesde) +
                      ' AND NP_PERIODO <= ' + SqlValue(aPeriodoHasta) +
                      ' AND NP_ID <> ' + SqlValue(aIdNotaPeriodo) +
                      ' AND NP_IDTIPOFORMULARIO = ' + SqlValue(aIdFormulario) +
                      ' AND NP_FORMULARIOMIXTO <> ''S''');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso1(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso1 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso2(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso2 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso3(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso3 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso4(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso4 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso5(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso5 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso6(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso6 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso7(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso7 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso8(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso8 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
function get_idnotaperiodo165_170sincab(aContrato : Integer; aPeriodo : string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiodo165_170sincab('
                      + SqlValue(aContrato) + ', '
                      + SqlValue(aPeriodo) + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_idnotaperiodo924_902sinres(aContrato : Integer; aPeriodo : string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiodo924_902sinres('
                      + SqlValue(aContrato) + ', '
                      + SqlValue(aPeriodo) + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_idnotaperiodosinticket(aContrato : Integer; aPeriodo : string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiodosinticket('
                      + SqlValue(aContrato) + ', '
                      + SqlValue(aPeriodo) + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_idnotaperiododetallerns(aSecuencia : Integer): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiododetallerns('
                      + SqlValue(aSecuencia) + '), -1) from dual');
end;

{------------------------------------------------------------------------------}
function get_idnotaperiodoticket(aContrato : Integer; aPeriodo : string; aIdFormulario: Integer; aNroverificado: string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiodoticket('
                      + SqlValue(aContrato) + ', '
                      + SqlValue(aPeriodo) + ', '
                      + SqlValue(aIdFormulario) + ', '
                      + SqlValue(aNroverificado)
                      + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_idnotaperiodoticketrg3279(aContrato : Integer; aPeriodo : string; aNroverificado: string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiodoticketrg3279('
                      + SqlValue(aContrato) + ', '
                      + SqlValue(aPeriodo) + ', '
                      + SqlValue(aNroverificado)
                      + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_idnotaperiodoformrg3279(aContrato : Integer; aPeriodo : string; aNroverificado: string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiodoformrg3279('
                      + SqlValue(aContrato) + ', '
                      + SqlValue(aPeriodo) + ', '
                      + SqlValue(aNroverificado)
                      + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_prioridadautorizperiodo(aidsolicitud: Integer): integer;
begin
  result := ValorSql('select emi.utiles.get_prioridadautorizperiodo('
                      + SqlValue(aidsolicitud) + ') from dual');
end;
{------------------------------------------------------------------------------}
function get_idnotaper165_170sinconst(aContrato : Integer; aPeriodo : string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaper165_170sinconst('
                      + SqlValue(aContrato) + ', '
                      + SqlValue(aPeriodo) + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_idnotaperiodo170(aContrato : Integer; aPeriodo : string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiodo170('
                      + SqlValue(aContrato) + ', '
                      + SqlValue(aPeriodo) + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_idnotaperiodo931(aContrato : Integer; aPeriodo : string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiodo931('
                      + SqlValue(aContrato) + ', '
                      + SqlValue(aPeriodo) + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_idnotaperiodo(aIdNota : Integer; aPeriodo : string): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_idnotaperiodo('
                      + SqlValue(aIdNota) + ', '
                      + SqlValue(aPeriodo) + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_tipoformulario(aIdNotaPeriodo: integer): integer;
begin
  result := ValorSql('select nvl(emi.notas.get_tipoformulario('
                      + SqlValue(aIdNotaPeriodo) + '), -1) from dual');
end;
{------------------------------------------------------------------------------}
function get_isrescindida(aContrato: integer): boolean;
begin
  result := ValorSql('select emi.utiles.get_isrescindida(' + SqlValue(aContrato) + ') from dual') = 'S';
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso9(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso9 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso10(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso10 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso11(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso11 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso21(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso21 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso24(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso24 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure do_aplicarcaso19(aContrato, aIdNotaPeriodo: integer; aSimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_aplicarcaso19 (' + SqlValue(aContrato) + ', ' +
                                                  SqlValue(aIdNotaPeriodo) + ', ' +
                                                  SqlBoolean(aSimula) +  ');');
end;
{------------------------------------------------------------------------------}
procedure GuardarInfoBloqueo(IdNota: integer; usuario: string);
begin
  EjecutarStoreST('emi.notas.guardarinfobloqueo (' + SqlValue(IdNota) + ', ' +
                                                     SqlValue(usuario) +  ');');
(*
  try
    BeginTrans(true);
    EliminarInfoBloqueo(IdNota);
    EjecutarSqlST('INSERT INTO EMI.INB_NOTABLOQUEADA VALUES (' + SqlValue(IdNota) + ',' +
                 SqlValue(usuario) + ', SYSDATE)');
    CommitTrans(true);
  except
    on E:Exception do begin
      Rollback(true);
      raise Exception.Create('No se pudo actualizar la tabla de bloqueos. ' + #13#10 + E.Message);
    end;
  end;
*)
end;
{------------------------------------------------------------------------------}
function GetInfoBloqueo(IdNota: Integer): String;
begin
	try
  	Result := ValorSql('SELECT NB_USUARIO FROM EMI.INB_NOTABLOQUEADA WHERE NB_IDNOTA = ' + SqlValue(IdNota));
  except
  	on E:Exception do
    	raise Exception.Create('No se pudo consultar la tabla de bloqueos. ' + #13#10 + E.Message);
  end;
end;
{------------------------------------------------------------------------------}
function EliminarInfoBloqueo(IdNota: integer): string;
begin
  EjecutarSqlST('DELETE FROM EMI.INB_NOTABLOQUEADA WHERE NB_IDNOTA = ' + SqlValue(IdNota));
end;
{------------------------------------------------------------------------------}
function GetUltimoBlockNota(aCuit: String): String;
begin
  result := ValorSql('select bn_texto ' +
                     'from emi.ibn_blocknota ' +
                     'where bn_id = (select max(bn_id) ' +
                                    'from emi.ibn_blocknota, afi.aem_empresa, afi.aco_contrato_ext ' +
                                    'where bn_contrato = co_contrato and ' +
                                    'co_idempresa = em_id and ' +
                                    'bn_fechabaja is null and ' +
                                    'em_cuit = ' + SqlValue(aCuit) + ')');
end;
{------------------------------------------------------------------------------}
function SumarCodigosReversionCuota(acontrato: integer; aperiodo: string): real;
begin
  result := ValorSqlExtended('select emi.utiles.sumarcodigosreversioncuota(' +
                                     SqlValue(aContrato) + ',' +
                                     SqlValue(aPeriodo) +  ') from dual', 0);
end;
{------------------------------------------------------------------------------}
function Get_devengadoprevistosim(aContrato: integer; aPeriodo: string; empleados: integer; masa: real): real;
begin
  result := ValorSqlExtended('select emi.simulacion.get_devengadoprevistosim(' +
                                     SqlValue(aContrato) + ',' +
                                     SqlValue(aPeriodo) + ',' +
                                     SqlValue(empleados) + ',' +
                                     SqlNumber(masa) +  ') from dual', 0);
end;
{------------------------------------------------------------------------------}
procedure Get_empleadosymasanota(aidnotaperiodo : integer; var empleados : integer; var masa: Real; var periodopresentacion: string);
begin
  with TSDStoredProc.Create(nil) do
  try
    DatabaseName := 'dbPrincipal';
    StoredProcName := 'emi.notas.get_empleadosymasanota';
    Params.CreateParam(ftInteger, 'idnotaperiodo', ptInput);
    ParamByName('idnotaperiodo').Value := aidnotaperiodo;
    Params.CreateParam(ftInteger, 'empleados', ptOutput);
    Params.CreateParam(ftFloat, 'masasalarial', ptOutput);
    Params.CreateParam(ftString, 'periodopresentacion', ptOutput);
    ExecProc;

    empleados := ParamByName('empleados').Value;
    masa := ParamByName('masasalarial').Value;
    periodopresentacion := ParamByName('periodopresentacion').Value;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure get_empleadosymasa(aidddjj : integer; var empleados : integer; var masa: Real; var periodopresentacion: string);
begin
  with TSDStoredProc.Create(nil) do
  try
    DatabaseName := 'dbPrincipal';
    StoredProcName := 'emi.utiles.get_empleadosymasa';
    Params.CreateParam(ftInteger, 'iddeclaracion', ptInput);
    ParamByName('iddeclaracion').Value := aidddjj;
    Params.CreateParam(ftInteger, 'empleados', ptOutput);
    Params.CreateParam(ftFloat, 'masasalarial', ptOutput);
    Params.CreateParam(ftString, 'periodopresentacion', ptOutput);
    ExecProc;

    empleados := ParamByName('empleados').Value;
    masa := ParamByName('masasalarial').Value;
    periodopresentacion := ParamByName('periodopresentacion').Value;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
function get_importepagado(aContrato: integer; aPeriodo: string): real;
begin
  result := ValorSqlExtended('select emi.emision.get_importepagado(' +
                                     SqlValue(aContrato) + ',' +
                                     SqlValue(aPeriodo) +  ') from dual', 0);
end;
{------------------------------------------------------------------------------}
function get_importecodigomovim(aContrato: integer; aPeriodo: string; codigomov: string): real;
begin
  result := ValorSqlExtended('select art.cobranza.get_importecodigomovim(' +
                                     SqlValue(aContrato) + ',' +
                                     SqlValue(aPeriodo) +  ',' +
                                     SqlValue(codigomov) + ') from dual', 0);
end;
{------------------------------------------------------------------------------}
function get_importecodmovimsimilares(aContrato: integer; aPeriodo: string; codigomov: string): real;
begin
  result := ValorSqlExtended('select emi.utiles.get_importecodmovimsimilares(' +
                                     SqlValue(aContrato) + ',' +
                                     SqlValue(aPeriodo) +  ',' +
                                     SqlValue(codigomov) + ') from dual', 0);
end;
{------------------------------------------------------------------------------}
function get_ajustesaldoacreedorsim(aContrato: integer; aPeriodo: string; empleados: integer; masa: real): real;
begin
  result := ValorSqlExtended('select emi.simulacion.get_ajustesaldoacreedorsim(' +
                                     SqlValue(aContrato) + ',' +
                                     SqlValue(aPeriodo) + ',' +
                                     SqlValue(empleados) + ',' +
                                     SqlNumber(masa) +  ') from dual', 0);
end;
{------------------------------------------------------------------------------}
procedure get_impactocambionominasim(contrato : integer; periodo: string; empleados : integer; masa: Real; var montoactual : real; var montofuturo: Real; var periodos: integer);
begin
  with TSDStoredProc.Create(nil) do
  try
    DatabaseName := 'dbPrincipal';
    StoredProcName := 'emi.simulacion.get_impactocambionominasim';
    Params.CreateParam(ftInteger, 'contrato', ptInput);
    ParamByName('contrato').Value := contrato;

    Params.CreateParam(ftString, 'periodo', ptInput);
    ParamByName('periodo').Value := periodo;

    Params.CreateParam(ftInteger, 'empleados', ptInput);
    ParamByName('empleados').Value := empleados;

    Params.CreateParam(ftFloat, 'masa', ptInput);
    ParamByName('masa').Value := masa;

    Params.CreateParam(ftFloat, 'monto_actual', ptOutput);
    Params.CreateParam(ftFloat, 'monto_futuro', ptOutput);
    Params.CreateParam(ftInteger, 'periodos', ptOutput);
    ExecProc;

    montoactual := ParamByName('monto_actual').Value;
    montofuturo := ParamByName('monto_futuro').Value;
    periodos := ParamByName('periodos').Value;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
function get_contratonosuss(aContrato: integer): boolean;
begin
  result := (ValorSql('select emi.utiles.get_contratonosuss(' +
                                     SqlValue(aContrato) + ') from dual', 'N') = 'S');
end;
{------------------------------------------------------------------------------}
function get_tipodevengado(aContrato : integer; aPeriodo: String): String;
begin
  result := ValorSql('select emi.utiles.get_tipodevengado(' +
                                     SqlValue(aContrato) + ',' +
                                     SqlValue(aPeriodo) +  ') from dual', '');
end;
{------------------------------------------------------------------------------}
function get_codigorectificsim(aContrato: integer; aPeriodo: string; fechapres: TDate; codigorectorig: string): integer;
begin
  result := ValorSqlInteger('select emi.simulacion.get_codigorectificsim(' +
                                     SqlValue(aContrato) + ',' +
                                     SqlValue(aPeriodo) + ',' +
                                     SqlDate(fechapres) + ',' +
                                     SqlValue(codigorectorig) +  ') from dual', 0);
end;
{------------------------------------------------------------------------------}
procedure MostrarInfoBaja(Contrato:integer);
var
  ssql:string;
  fecha:TDateTime;
  Descr,Estado, DescrEstado, Mensaje:string;
begin
  Mensaje := '';
  Descr   := '';
  Estado  := '';
  DescrEstado:='';

  ssql := 'SELECT CO_FECHABAJA MP_FBAJA, CTBMOTIB.TB_DESCRIPCION DESCRIPCION, ' +
                 'CO_ESTADO MP_ESTADO, CTBEST.TB_DESCRIPCION ESTADO ' +
            'FROM CTB_TABLAS CTBMOTIB, CTB_TABLAS CTBEST, ACO_CONTRATO ' +
           'WHERE CO_CONTRATO = :Contrato ' +
             'AND CTBEST.TB_CLAVE = ''AFEST'' ' +
             'AND CO_ESTADO = CTBEST.TB_CODIGO ' +
             'AND CTBMOTIB.TB_CLAVE(+) = ''MOTIB'' ' +
             'AND CO_MOTIVOBAJA = CTBMOTIB.TB_CODIGO(+)';

  with GetQueryEx(ssql, [Contrato]) do
  try
    Descr       := FieldByName('DESCRIPCION' ).AsString;
    fecha       := FieldByName('MP_FBAJA' ).AsDateTime;
    Estado      := FieldByName('MP_ESTADO' ).AsString;
    DescrEstado := FieldByName('ESTADO').AsString;

    if ((Estado = '1') and (Fecha <> 0))  or  // Chequeo si la empresa está activa y tiene fecha de baja
       ((Estado = '1') and (Descr <> '')) or  // Chequeo si la empresa está activa y tiene motivo de baja
       (Estado <> '1') then                   // Chequeo si la empresa está en estado distinto de 1 (ACTIVA)
    begin
      if not Eof then
      begin
        Mensaje := 'Estado: ' + DescrEstado +#13+#10+#13;
        if Fecha <> 0 then
          Mensaje := Mensaje + 'Fecha de baja: ' + DateToStr(Fecha) +#13+#10;
        if Descr <> '' then
          Mensaje := Mensaje + 'Motivo de baja: '+ Descr;
      end;
    end;
  finally
    free;
  end;

  if (Mensaje <> '') then MsgBox(Mensaje, MB_ICONWARNING);
end;
{------------------------------------------------------------------------------}
function get_procesarobservacionnota(aIdNotaContratoPeriodo: Integer; idObservacion: integer = -1; aplica: boolean = false): String;
begin
  with TSDStoredProc.Create(nil) do
  try
    DatabaseName := 'dbPrincipal';
    StoredProcName := 'emi.notas.get_procesarobservacionnota';
    Params.CreateParam(ftInteger, 'aIdNotaContratoPeriodo', ptInput);
    ParamByName('aIdNotaContratoPeriodo').Value := aIdNotaContratoPeriodo;

    Params.CreateParam(ftInteger, 'idObservacion', ptInput);
    if idObservacion <> -1 then
      ParamByName('idObservacion').Value := idObservacion;

    Params.CreateParam(ftString, 'aplica', ptInput);
    if aplica then
      ParamByName('aplica').Value := 'S'
    else
      ParamByName('aplica').Value := 'N';

    Params.CreateParam(ftString, 'resultado', ptOutput);
    ExecProc;

    result := ParamByName('resultado').Value;
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
function GetValue(sfield: String; qryValores: TSDQuery): string;
var
  i: integer;
begin
  i:=0;
  while (i <= qryValores.FieldCount-1) and (qryValores.Fields[i].FieldName <> sfield) do
    inc(i);
  if (i <= qryValores.FieldCount-1) then
  begin
    if (qryValores.Fields[i].DataType = ftDateTime) or (qryValores.Fields[i].DataType = ftDate) then
      result := FormatDateTime('dd/mm/yyyy', qryValores.Fields[i].AsDateTime)
    else
      result := qryValores.Fields[i].AsString;
  end
  else
    result := '';
end;
{------------------------------------------------------------------------------}
procedure MostrarInfoReafiliada(iContrato: Integer);
var
  NroCliente: TTableId;
  sSql: String;
begin
  NroCliente := ValorSqlIntegerEx(
                            'SELECT MIN (A1.CO_CONTRATO) ' +
                              'FROM ACO_CONTRATO A1, ACO_CONTRATO A2 ' +
                             'WHERE A1.CO_IDEMPRESA = A2.CO_IDEMPRESA ' +
                               'AND A1.CO_CONTRATO < A2.CO_CONTRATO ' +
                               'AND A2.CO_CONTRATO = :Contrato', [iContrato]);

  if NroCliente <> ART_EMPTY_ID then
    MsgBox('Esta empresa se encuentra reafiliada.' + CRLF +
           'El Nro.de Cliente es: ' + IntToStr(NroCliente) + '.', MB_ICONINFORMATION + MB_OK)
  else
    begin
      sSql := 'SELECT COUNT(*) ' +
                'FROM ART.ABC_BAJADECONTRATO, ACO_CONTRATO, AEM_EMPRESA ' +
               'WHERE EM_CUIT = ART.AFILIACION.GET_CUITEMPRESA(:Contrato) ' +
                 'AND CO_IDEMPRESA = EM_ID ' +
                 'AND CO_CONTRATO = BC_CONTRATO ' +
                 'AND CO_CONTRATO > :Contrato';

      if ValorSqlIntegerEx(sSql, [iContrato]) > 0 then
        MsgBox('Existen contratos posteriores dados de baja.', MB_ICONINFORMATION + MB_OK);
    end;
end;
{------------------------------------------------------------------------------}
procedure procesarobservacionesnota(aidNota: integer);
begin
  with GetQuery('SELECT NP_ID FROM EMI.INP_NOTACONTRATOPERIODO WHERE NP_IDNOTA = ' + SqlValue(aidNota)) do
  try
    while not Eof do
    begin
      get_procesarobservacionnota(fieldbyname('NP_ID').AsInteger, -1, true);
      Next;
    end;
  finally
    free;
  end;
end;
{------------------------------------------------------------------------------}
procedure do_procesarlotenota(aidNota: integer);
begin
  if ExisteSqlEx(' SELECT 1 ' +
                 '  FROM emi.inp_notacontratoperiodo inp, emi.ipo_notaperiodoobservacion ipo, emi.ing_notagestion ing, emi.ino_nota ino ' +
                 ' WHERE inp.np_idnota = ino.no_id ' +
                 '   AND inp.np_fechabaja IS NULL ' +
                 '   AND ino.no_idestadonota + 0 = 2 ' +
                 '   AND np_fechaalta >= TO_DATE(''21/08/2007'', ''DD/MM/YYYY'') ' +
                 '   AND inp.np_id = ipo.po_idnotacontratoperiodo ' +
                 '   AND ing.ng_idnotaperiodoobs = ipo.po_id ' +
                 '   AND no_id = :idnota ', [aidNota]) then
    EjecutarStoreSTEx('emi.gestion.do_procesarlotenota(:idNota);', [aidNota]);
end;
{------------------------------------------------------------------------------}
procedure ProcesarNotaInconsistente(aidNota: integer);
begin
  EjecutarStoreSTEx('emi.notas.do_procesarnotainconsist(:idNota);', [aidNota]);
end;
{------------------------------------------------------------------------------}
procedure do_procesarlotesitfac(aContrato: integer; atipositfacturacion: String);
begin
  EjecutarStoreEx('emi.gestion.do_procesarlotesitfac(:contrato, :tipositfacturacion);', [aContrato, atipositfacturacion]);
end;
{------------------------------------------------------------------------------}
procedure InsertarTextoObservacion(aIdObservacionNota: integer; aIdAccion: integer; aSubaccion: String; atexto: TStringList);
var
  idng: integer;
begin

  idng := GetSecNextVal('emi.seq_ing_id');

  EjecutarSqlST(' INSERT INTO EMI.ING_NOTAGESTION(ng_id, ng_idnotaperiodoobs, ng_idaccion, ng_subaccion, ' +
                '                                 ng_textoobservacion, ng_idnotaagestion, ng_fechabaja, ' +
                '                                 ng_usubaja) ' +
                ' VALUES(' + SqlValue(idng) + ',' +
                             SqlValue(aIdObservacionNota) + ',' +
                             SqlValue(aIdAccion) + ',' +
                             SqlValue(aSubaccion) + ', NULL, NULL, NULL, NULL)' );

  SaveBlob(  'SELECT NG_TEXTOOBSERVACION ' +
             'FROM EMI.ING_NOTAGESTION ' +
             'WHERE NG_ID = ' + SqlValue(idng),
             'UPDATE EMI.ING_NOTAGESTION ' +
             'SET NG_TEXTOOBSERVACION = :NG_TEXTOOBSERVACION ' +
             'WHERE NG_ID = ' + SqlValue(idng),
             'NG_TEXTOOBSERVACION', atexto);
end;
{------------------------------------------------------------------------------}
procedure InsertarTextoObservacionTextoLibre(aIdNotaContratoPeriodo: integer);
var
  id: integer;
  strList: TStringList;
begin
  id := ValorSqlInteger('select po_id from  emi.ipo_notaperiodoobservacion where po_idnotacontratoperiodo = ' + SqlValue(aIdNotaContratoPeriodo));

  strList:= TStringList.Create;
  try
    GetObservacionTextoLibre(aIdNotaContratoPeriodo, strList);
    InsertarTextoObservacion(id, 10, 'P', strList);
  finally
    strList.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure InsertarObservacionGenerica(aIdNotaContratoPeriodo: integer; aTexto: String);
var
  id: integer;
  strList: TStringList;
begin
  id := GetSecNextVal('emi.seq_ipo_id');
  EjecutarSqlST(' INSERT INTO emi.ipo_notaperiodoobservacion ' +
                ' (po_id, po_idnotacontratoperiodo, po_idobservacion) ' +
                '  VALUES (' + SqlValue(id) + ', ' + SqlValue(aIdNotaContratoPeriodo) + ',' +
                 SqlValue(generica_existe_ddjj_posterior) + ')');

  strList:= TStringList.Create;
  try
    strList.Add(aTexto);
    InsertarTextoObservacion(id, 10, 'P', strList);
  finally
    strList.Free;
  end;
end;
{------------------------------------------------------------------------------}
function GetObservacionGenerica(aIdNotaContratoPeriodo: integer):String;
begin
  with GetQuery('SELECT * FROM EMI.INP_NOTACONTRATOPERIODO WHERE NP_ID = ' + SqlValue(aIdNotaContratoPeriodo)) do
  try
    result := 'La Declaración Jurada presentada con los siguientes datos: Cantidad de Empleados: ' + FieldByName('NP_TOTALEMPLEADOS').AsString
               + ', Masa Salarial: ' + FormatFloat('#,##0.00', FieldByName('NP_TOTALMASASALARIAL').AsFloat)
               + ', de manera Original/Rectificativa, para el periodo ' + FieldByName('NP_PERIODO').AsString + ', es anterior a la Declaración Jurada que tenemos.';
  finally
    Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure GetObservacionTextoLibre(aIdNotaContratoPeriodo: integer; var aTexto: TStringList);
begin
  BlobSql('SELECT NP_TEXTOOBSNOTA FROM EMI.INP_NOTACONTRATOPERIODO WHERE NP_ID = ' + SqlValue(aIdNotaContratoPeriodo), aTexto);
end;
{------------------------------------------------------------------------------}
function IsObservacionTextoLibre(aIdNotaContratoPeriodo: integer):boolean;
begin
  result := ExisteSql('SELECT 1 FROM EMI.IPO_NOTAPERIODOOBSERVACION WHERE PO_IDNOTACONTRATOPERIODO = ' + SqlValue(aIdNotaContratoPeriodo) + ' AND PO_IDOBSERVACION = ' + SqlValue(obs_form_texto_libre));
end;
{------------------------------------------------------------------------------}
function GetEstadoNotaContratoPeriodo(aIdNotaContratoPeriodo: Integer): integer;
begin
  result := ValorSqlInteger('SELECT NP_IDESTADOFORMULARIO FROM EMI.INP_NOTACONTRATOPERIODO WHERE NP_ID = ' + SqlValue(aIdNotaContratoPeriodo));
end;
{------------------------------------------------------------------------------}
procedure do_ActualizarEstadoPeriodos(idautorizacion, contrato: integer);
var
  qry: TSDQuery;
begin

  qry := GetQuery(' SELECT sp_periodo periodo FROM emi.isp_solicitudautorizperiodo ' +
                  ' WHERE sp_idsolicitudautorizacion = ' + SqlValue(idautorizacion) +
                  ' ORDER BY sp_periodo ' );

  try
    //Llamo a esta funcion con null para que reverifique el estado de los periodos
    //eliminados...asi no quedan pendiente e aprobacion
    while not qry.Eof do
    begin
        EjecutarSqlST(' UPDATE emi.irp_resumenperiodo ' +
                      ' SET rp_estado = DECODE(emi.utiles.getautorizpendiente(rp_contrato, rp_periodo), ' +
                      ' ''S'', ''P'', ' +
                      ' ''V'') ' +
                      ' WHERE rp_contrato = ' + SqlValue(contrato)   +
                      ' AND rp_periodo = ' + SqlValue(qry.FieldByName(periodo).AsString));
        qry.Next;
    end;
  finally
    qry.Free;
  end;
end;
{-------------------------------------------------------------------------------}
function Get_CantSiniestrosPeriodo(aContrato: integer; aPeriodo: String): Integer;
var
  sSql: String;
begin
  sSql := 'SELECT COUNT(*) ' +
            'FROM SEX_EXPEDIENTES ' +
           'WHERE AFILIACION.GET_CONTRATOVIGENTE(EX_CUIT, EX_FECHAACCIDENTE)=:iContrato ' +
             'AND EX_CUIT=AFILIACION.GET_CUITEMPRESA(:iContrato)' +
             'AND EX_FECHAACCIDENTE BETWEEN UTILES.PERIODO_PRIMERDIA(:sPeriodo) AND UTILES.PERIODO_ULTIMODIA(:sPeriodo)';

  Result := ValorSqlIntegerEx(sSql, [aContrato, aContrato, aPeriodo, aPeriodo]);
end;
{-------------------------------------------------------------------------------}
procedure do_seteobsformnota(aidnotaperiodo: integer; aobservacion: integer; asimula: boolean);
begin
  EjecutarStoreST('emi.notas.do_seteobsformnota( ' + SqlNumber(aidnotaperiodo) + ', ' + SqlNumber(aobservacion) + ',' +  SqlBoolean(asimula) + ');');
end;
{-------------------------------------------------------------------------------}
procedure do_eliminarobsformnotatmp(aidnotaperiodo: integer; asimula: boolean);
begin
  if asimula then
  begin
    if ExisteSqlEx('SELECT 1 FROM emi.ipt_notaperiodoobstmp WHERE pt_idnotacontratoperiodo = :id', [aidnotaperiodo]) then
      EjecutarSqlSTEx('DELETE FROM emi.ipt_notaperiodoobstmp WHERE pt_idnotacontratoperiodo = :id', [aidnotaperiodo]);
  end
  else begin
    if ExisteSqlEx('SELECT 1 FROM emi.ipo_notaperiodoobservacion WHERE po_idnotacontratoperiodo = :id', [aidnotaperiodo]) then
      EjecutarSqlSTEx('DELETE FROM emi.ipo_notaperiodoobservacion WHERE po_idnotacontratoperiodo = :id', [aidnotaperiodo]);
  end;
end;
{-------------------------------------------------------------------------------}
procedure do_generarnotagestion(contrato: integer; periodo: String; idaGestion: integer; tipo: String);
begin
  EjecutarStore('emi.notas.do_generarnotagestion( ' + SqlNumber(contrato) + ', ' + SqlValue(periodo) + ', ' + SqlNumber(idaGestion) + ', ' + SqlValue(tipo) + ');');
end;

{-------------------------------------------------------------------------------}
procedure do_regenerardeclaracion(idddjj: integer; idobservacion: integer; tiporeproceso: string; reprocesartrab, devengar: boolean; forzar: boolean = false);
begin
  EjecutarStoreST('emi.nominas.do_regenerardeclaracion( ' + SqlNumber(idddjj) + ', ' + SqlNumber(idobservacion) + ', ' + SqlValue(tiporeproceso) + ', ' + iif(reprocesartrab, 'true', 'false') + ', ' + iif(devengar, 'true', 'false') +
                  ', ' + iif(forzar, 'true', 'false') + ');');
end;
{-------------------------------------------------------------------------------}
procedure do_insertartareacontrato(idtarea: integer; contrato: integer; usuario: string);
begin
  EjecutarStoreST('emi.utiles.do_insertartareacontrato( ' + SqlNumber(idtarea) + ', ' + SqlNumber(contrato) + ', ' + SqlValue(usuario) + ');');
end;
{-------------------------------------------------------------------------------}
function getdescripciontipocumplimiento(atipocumplimiento: String): String;
begin
  if (atipocumplimiento = 'A') then
    result := 'Autorizó'
  else begin
    if (atipocumplimiento = 'B') then
      result := 'No Autorizó'
    else begin
      if  (atipocumplimiento = 'N') then
        result := 'Nada'
      else
        result := '';
    end;
  end;

end;
{-------------------------------------------------------------------------------}
function get_notas_no_aplicadas(aContrato: integer): integer;
begin
  result := ValorSqlIntegerEx(' SELECT COUNT(*) ' +
                              ' FROM EMI.INO_NOTA ' +
                              ' WHERE NO_IDESTADONOTA IN (1, 3, 5) AND NO_FECHABAJA IS NULL AND NO_CONTRATO = :contrato', [aContrato]);
end;
{-------------------------------------------------------------------------------}
procedure do_informar_notas_no_aplicadas(aContrato: integer);
begin
  if get_notas_no_aplicadas(aContrato) > 0 then
    MostrarAlarma('Advertencia', 'Existen notas pendientes de aplicar.');
end;

{-------------------------------------------------------------------------------}
function FinalizoProceso(aProceso: String; aFecha: TDateTime): boolean;
begin
  Result := ExisteSql(' SELECT 1 ' +
                      ' FROM art.ctc_tablacontrol ' +
                      ' WHERE tc_proceso = ' + SqlValue(UpperCase(aProceso)) +
                      ' AND trunc(tc_fechafin, ''MM'') = trunc(' + SqlValue(aFecha) + ', ''MM'')');
end;
{-------------------------------------------------------------------------------}
function PuedeProcesar: boolean;
var
  FechaFin: TDateTime;
begin
  FechaFin := ValorSqlDateTime(' SELECT tc_fechafin ' +
                               ' FROM art.ctc_tablacontrol ' +
                               ' WHERE tc_proceso = ''FIN DE MES''');
  result := FechaFin <> 0;

  if result then
    result := DayOfWeek(Date) <> 1;

end;
{-------------------------------------------------------------------------------}
function RealizoDevengado(aPeriodo: String): boolean;
var
  Existe: integer;
begin
  Existe := ValorSqlIntegerEx(' SELECT 1 ' +
                              ' FROM emi.ird_resumendevengado ' +
                              ' WHERE rd_periodo = :periodo', [aPeriodo]);
  result := Existe = 1;
end;
{-------------------------------------------------------------------------------}
function get_nivelautrequeridonotasim(idNota: integer; tipoaut: String): integer;
begin
  result := ValorSqlInteger(' SELECT EMI.SIMULACION.GET_NIVELAUTREQUERIDONOTASIM( ' + SqlValue(idNota) + ', ' + SqlValue(tipoaut) +  ') ' +
                              ' FROM DUAL ', 0);
end;
{-------------------------------------------------------------------------------}
function get_modopresentacion(aIdEmpresa: integer; aPeriodo: String): integer;
begin
  result := ValorSqlInteger(' SELECT EMI.UTILES.GET_MODOPRESENTACION( ' + SqlValue(aIdEmpresa) + ', ' + SqlValue(aPeriodo) +  ') ' +
                              ' FROM DUAL ', 1);
end;
{-------------------------------------------------------------------------------}
procedure do_aplicarnota(aIdNota: integer; autoTransaction: boolean = true);
begin
  if autoTransaction then
    BeginTrans(true);
  try
    EjecutarStoreST( 'emi.notas.do_aplicarnota(' + SqlValue(aIdNota) + ');');
    ProcesarObservacionesNota(aIdNota);
    ProcesarNotaInconsistente(aIdNota);
    do_procesarlotenota(aIdNota);

   if autoTransaction then
     CommitTrans(true);
  except
    on E: Exception do begin
      if autoTransaction then
        Rollback(true);
      raise E;
    end;
  end;
end;
{-------------------------------------------------------------------------------}
function do_generarcarta(contrato: integer; nrogestion: integer; idgestionable: integer;
  idmodonotificacion: integer): integer;
begin
  with TSDStoredProc.Create(nil) do
  try
    DatabaseName := 'dbPrincipal';
    StoredProcName := 'emi.gestion.do_generarcarta';
    Params.CreateParam(ftInteger, 'contrato', ptInput);
    ParamByName('contrato').Value := contrato;

    Params.CreateParam(ftInteger, 'nrogestion', ptInput);
    ParamByName('nrogestion').Value := nrogestion;

    Params.CreateParam(ftInteger, 'idgestionable', ptInput);
    ParamByName('idgestionable').Value := idgestionable;

    Params.CreateParam(ftInteger, 'idmodonotificacion', ptInput);
    ParamByName('idmodonotificacion').Value := idmodonotificacion;

    Params.CreateParam(ftinteger, 'idcarta', ptOutput);
    ExecProc;

    result := ParamByName('idcarta').Value;
  finally
    Free;
  end;
end;
{-------------------------------------------------------------------------------}
procedure do_guardarparametrogestion(nrogestion: integer; parametro: string; valor: string);
begin
  EjecutarStoreST('emi.gestion.do_guardarparametrogestion( ' + SqlNumber(nrogestion) + ', ' + SqlValue(parametro)+ ', ' + SqlValue(valor) + ');');
end;
{-------------------------------------------------------------------------------}
procedure do_generarmailgestion(contrato: integer; nrogestion: integer; idgestionable: integer; MailNotificacion: string);
begin
  EjecutarStoreST('art.intraweb.do_generarmailgestion( ' + SqlValue(Sesion.LoginName) + ', ' + SqlNumber(contrato) + ', ' +
                                                           SqlNumber(nrogestion)+ ', ' + SqlNumber(idgestionable)+ ', ' +
                                                           SqlValue(MailNotificacion) + ',''N'');');
end;
{-------------------------------------------------------------------------------}
function get_mailcontrato(aContrato: Integer): String;
begin
  result := ValorSQLEx('SELECT CO_DIRELECTRONICA FROM ACO_CONTRATO_EXT WHERE CO_CONTRATO = :CONTRATO', [aContrato]);
end;
{-------------------------------------------------------------------------------}
function ExisteMailContacto(aContrato: Integer): boolean;
begin
  result := ExisteSqlEx(' SELECT 1 ' +
                        '  FROM emi.ice_contactosemi, afi.act_contacto, afi.aco_contrato_ext ' +
                        ' WHERE ce_idcontacto = ct_id ' +
                        '   AND co_idempresa = ct_idempresa ' +
                        '   AND co_contrato = :contrato ' +
                        '   AND ce_fechabaja IS NULL ' +
                        '   AND ct_fechabaja IS NULL ' +
                        '   AND ct_direlectronica IS NOT NULL ', [aContrato]);

end;
{-------------------------------------------------------------------------------}
function ExisteMailContactoSeleccionado(idcontacto: Integer): boolean;
begin
  result := ExisteSqlEx(' SELECT 1 ' +
                        '  FROM afi.act_contacto' +
                        ' WHERE ct_id = :idcontacto' +
                        '   AND ct_fechabaja IS NULL ' +
                        '   AND ct_direlectronica IS NOT NULL ', [idcontacto]);

end;
{-------------------------------------------------------------------------------}
procedure do_procesardetallewebrns(atransaccion: integer = -1);
var
  strTrans: String;
begin
  if atransaccion = -1 then
    strTrans := ' NULL '
  else
    strTrans := IntToStr(atransaccion);

  EjecutarStore('emi.notas.do_procesardetallewebrns( ' + strTrans + ' );');
end;
{-------------------------------------------------------------------------------
procedure do_ insertarsegevento(contrato, idexpediente, codevento: integer; sector: String;
  idingresoevento: integer; usuario, cerrarevento, usuarioderivaciontelef: String;
  diasvencimiento: integer; avisovencido, sectorinterviniente, enviarmail, observaciones: String;
  idContacto: integer);
begin
  EjecutarStoreST('art.varios.do_ insertarsegevento(' +  SqlInt(contrato, true) + ', '
                                                     +  SqlInt(idexpediente, true) + ', '
                                                     +  SqlValue(IntToStr(codevento)) + ', '
                                                     +  SqlValue(sector) + ', '
                                                     +  SqlInt(idingresoevento) + ', '
                                                     +  SqlValue(usuario) + ', '
                                                     +  SqlValue(cerrarevento) + ', '
                                                     +  SqlString(usuarioderivaciontelef, false, true) + ', '
                                                     +  SqlValue(diasvencimiento) + ', '
                                                     +  SqlValue(avisovencido) + ', '
                                                     +  SqlString(sectorinterviniente, false, true) + ', '
                                                     +  SqlValue(enviarmail) + ', '
                                                     +  SqlValue(observaciones) + ', '
                                                     +  SqlInt(idContacto, true) + ');' );
end;
{-------------------------------------------------------------------------------}
procedure do_generarnota(contrato, idTipoFormulario: integer);
begin
  EjecutarStoreST('emi.notas.do_generarnota( ' + SqlNumber(contrato) + ', ' + SqlNumber(idTipoFormulario) + ');');
end;
{-------------------------------------------------------------------------------}
procedure do_procesarNoHacerNadaDDJJAgendada(idDDJJAgendada : Integer);
begin
  EjecutarSqlST('UPDATE emi.ida_ddjjagendada '+
                '   SET DA_USUBAJA = '+SqlValue(Sesion.LoginName)+', '+
                '       DA_FECHABAJA = SYSDATE'+
                ' WHERE DA_ID = '+SqlValue(idDDJJAgendada));
end;
{-------------------------------------------------------------------------------}
procedure do_procesarReestablecerDDJJAgendada(idDDJJAgendada : Integer);
var
  rechazada : String;
  contrato, idDDJJ : Integer;
  periodo : String;
  observ: String;
  idObs: integer;
begin
  with GetQuery(' SELECT a.*, b.*, emi.utiles.get_tipoestadoverificado (dj_id) rechazada '+
                '   FROM emi.idj_ddjj a, emi.ida_ddjjagendada b '+
                '  WHERE dj_cuit = da_cuit '+
                '    AND dj_periodo = da_periodo '+
                '    AND dj_codigorectificativa = da_codigorectificativa '+
                '    AND da_id = '+SqlValue(idDDJJAgendada)) do
  begin
    rechazada := FieldByName('Rechazada').AsString;
    idDDJJ := FieldByName('DJ_ID').AsInteger;
    contrato := FieldByName('DJ_CONTRATO').AsInteger;
    periodo := FieldByName('DJ_PERIODO').AsString;
    IdObs := FieldByName('DA_IDOBSERVACION').AsInteger;
    Observ := FieldByName('DA_OBSERVACION').AsString;
  end;
  try
    if (rechazada = 'R') or
       (rechazada = 'M') then
    begin

        EjecutarSqlST(' insert into emi.ida_ddjjaceptacionrech ' +
                      ' values(emi.seq_idc_id.nextval, ' + SqlValue(idDDJJ) + ', ' +
                        SqlValue(IdObs)  +  ', sysdate, ''SISTEMAS'',' +
                        SqlValue(Observ) +' )' );
        do_revalidarpresentacion(idDDJJ, IdObs);


        DoEnviarMailAceptacionRechazo('A', contrato, periodo, idDDJJ, IdObs, Observ);

        EjecutarSqlST('UPDATE emi.ida_ddjjagendada '+
                  '   SET DA_ESTADO = ''T'', '+
                  '       DA_USUMODIF = ''SISTEMAS'', '+
                  '       DA_FECHAMODIF = SYSDATE'+
                  ' WHERE DA_ID = '+SqlValue(idDDJJAgendada));
    end
    else
    begin
      EjecutarSqlST('UPDATE emi.ida_ddjjagendada '+
                  '   SET DA_ESTADO = ''E'', '+
                  '       DA_USUMODIF = ''SISTEMAS'', '+
                  '       DA_FECHAMODIF = SYSDATE'+
                  ' WHERE DA_ID = '+SqlValue(idDDJJAgendada));

    end;
  except
    on E:Exception do begin
      EjecutarSqlST('UPDATE emi.ida_ddjjagendada '+
                  '   SET DA_ESTADO = ''E'', '+
                  '       DA_USUMODIF = ''SISTEMAS'', '+
                  '       DA_FECHAMODIF = SYSDATE, '+
                  '       DA_OBSERVACION = ' + SqlValue(E.Message) +
                  ' WHERE DA_ID = '+SqlValue(idDDJJAgendada));
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure do_procesarEliminarDDJJAgendada(idDDJJAgendada : Integer);
var
  rechazada : String;
  contrato, idDDJJ : Integer;
  periodo : String;
  observ: String;
  idObs: integer;
begin
  with GetQuery(' SELECT a.*, b.*,emi.utiles.get_tipoestadoverificado (dj_id) rechazada '+
                '   FROM emi.idj_ddjj a, emi.ida_ddjjagendada b '+
                '  WHERE dj_cuit = da_cuit '+
                '    AND dj_periodo = da_periodo '+
                '    AND dj_codigorectificativa = da_codigorectificativa '+
                '    AND da_id = '+SqlValue(idDDJJAgendada)) do
  begin
    rechazada := FieldByName('Rechazada').AsString;
    idDDJJ := FieldByName('DJ_ID').AsInteger;
    contrato := FieldByName('DJ_CONTRATO').AsInteger;
    periodo := FieldByName('DJ_PERIODO').AsString;
    IdObs := FieldByName('DA_IDOBSERVACION').AsInteger;
    Observ := FieldByName('DA_OBSERVACION').AsString;
  end;

  try
    if (rechazada = 'A') or
       (rechazada = 'I') then
    begin
      EjecutarSqlST(' INSERT INTO emi.ida_ddjjaceptacionrech ' +
                    ' VALUES(emi.seq_idc_id.nextval, ' + SqlValue(idDDJJ) + ', ' +
                    SqlValue(IdObs)  +  ', sysdate, ''SISTEMAS'',' +
                    SqlValue(Observ) +' )' );
      do_invalidarpresentacion(idDDJJ, idObs);

      DoEnviarMailAceptacionRechazo('R', contrato,
                                    periodo,
                                    idDDJJ,
                                    IdObs, Observ);

      EjecutarSqlST('UPDATE emi.ida_ddjjagendada '+
                '   SET DA_ESTADO = ''T'', '+
                '       DA_USUMODIF = ''SISTEMAS'','+
                '       DA_FECHAMODIF = SYSDATE'+
                ' WHERE DA_ID = '+SqlValue(idDDJJAgendada));
    end
    else
    begin
      EjecutarSqlST('UPDATE emi.ida_ddjjagendada '+
                  '   SET DA_ESTADO = ''E'', '+
                  '       DA_USUMODIF = ''SISTEMAS'','+
                  '       DA_FECHAMODIF = SYSDATE'+
                  ' WHERE DA_ID = '+SqlValue(idDDJJAgendada));
    end;
  except
    on E:Exception do begin
      EjecutarSqlST('UPDATE emi.ida_ddjjagendada '+
                  '   SET DA_ESTADO = ''E'', '+
                  '       DA_USUMODIF = ''SISTEMAS'', '+
                  '       DA_FECHAMODIF = SYSDATE, '+
                  '       DA_OBSERVACION = ' + SqlValue(E.Message) +
                  ' WHERE DA_ID = '+SqlValue(idDDJJAgendada));
    end;
  end;
end;
{-------------------------------------------------------------------------------}
procedure DoEnviarMailAceptacionRechazo(Tipo: String; Contrato: Integer; Periodo: String; IdDDJJ, IdMotivoRechazo: TTableId; Observaciones: String);
var
  sSql: String;
begin
  sSql := 'EMI.UTILES.doenviarmailaceptacionrechazo(:Tipo, :Contrato, :Periodo, :Idddjj, :IdMotivoAceptRechazo, :Observaciones);';
  EjecutarStoreSTEx(sSql, [Tipo, Contrato, Periodo, IdDDJJ, IdMotivoRechazo, Observaciones]);
end;
{-------------------------------------------------------------------------------}
procedure do_procesarddjjantestermino;
begin
  EjecutarStore('emi.nominas.do_procesarddjjantestermino;');
end;
{-------------------------------------------------------------------------------}
procedure do_generarmasaestimada;
begin
  EjecutarStore('emi.nominas.do_generarmasaestimada;');
end;
{-------------------------------------------------------------------------------}
procedure do_procesarpagosantestermino;
begin
  EjecutarStore('emi.emision.do_procesarpagosantestermino;');
end;

{------------------------------------------------------------------------------}
procedure do_reprocesarddjjpcp(AContrato: integer; APeriodo: string);
var
  sSql : string;
begin
  sSql := 'emi.nominas.do_reprocesarddjjpcp(' + SqlValue(AContrato) + ', ' + SqlValue(APeriodo) + ');';
  EjecutarStoreST(sSql);
end;
{-------------------------------------------------------------------------------}
end.

