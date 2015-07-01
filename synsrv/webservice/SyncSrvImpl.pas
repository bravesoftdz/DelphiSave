{ Invokable implementation File for TSyncSrv which implements ISyncSrv }
// NO UTILIZAR BLOB UTILIZAR CLOB Y GUARDARLOS TIPO PROCEDURE DE PL
 unit SyncSrvImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, SyncSrvIntf, DBClient, DB, ADODB, unSyncProc, unSyncProcSqlServer, unSyncSrv, Classes,
 Provider, WebBroker, IniFiles, unDmPrincipal, XMLDoc, XMLIntf, windows;

type

  { TSyncSrv }
  TSyncSrv = class(TInvokableClass, ISyncSrv)
  private

  public
    function ObtenerListaJuiciosEnTramite(pag, idusuario :Integer; caratula,nrocarpeta, nombreabo, nroexpediente, tipoJuicio :String): WideString; stdcall;
    function ObtenerListaJuiciosEnTramiteParteActora(pag:Integer; nombre, caratula,nrocarpeta, nombreabo, nroexpediente, tipoJuicio :String): WideString; stdcall;
    function ObtenerConcursosyQuiebras(pag:Integer; NroOrden, cmbRSocial, Cuil, estudio:String): WideString;stdcall;
    function ObtenerDatosDeJuicio(nrojuicio, idestudio, usuarioweb: String): WideString;stdcall;
    function ObtenerDatosCYQ(nroorden: String): WideString;stdcall;
    function ObtenerEventosCYQ(pag: integer;nroorden: String): WideString;stdcall;
    function ObtenerAcuerdos(pag :integer;nroorden, filtro: String): WideString;stdcall;
    function ObtenerAcuerdosMod(nroorden: String): WideString;stdcall;
    function ObtenerEmpresa(Cuil : String): WideString; stdcall;
    function ObtenerMontosCYQ(nroorden: String): WideString;stdcall;
    function ObtenerEstado(codigo :String):WideString;stdcall;
    function VerificarConexion: boolean;
    function ObtenerDemandas(nrojuicio: String): WideString;stdcall;
    function ObtenerReclamos(nrojuicio: String): WideString;stdcall;
    function ObtenerImporte(pj_idjuicioentramite, instancia:String; pag: integer):WideString;stdcall;
    function ObtenerImportesABM(ir_id: String): WideString;stdcall;
    function ObtenerLiquidacionFinal(nrojuicio: String): WideString;stdcall;
    function ExisteLiquidacion(nrojuicio: String): WideString;stdcall;
    function ObtenerInstancias(pj_idjuicioentramite:String): WideString;stdcall;
    function ObtenerInstanciaParaSentencia(pj_idjuicioentramite:String):WideString;stdcall;
    function ObtenerMasDatosJuicios(nrojuicio: String): WideString;stdcall;
    function ObtenerSentencia(nrojuicio: String): WideString;stdcall;
    function ObtenerPeritajes(nrojuicio: String;pag:Integer): WideString;stdcall;
    function ObtenerMedidaCautelarABM(MC_ID: String): WideString;stdcall;
    function ObtenerPeritajesABM(pj_id: String): WideString;stdcall;
    function ObtenerMedidasCautelares(pag: integer; nrojuicio: String): WideString;stdcall;
    function ObtenerEventos(pag: integer; nrojuicio: String): WideString;stdcall;
    function ObtenerTipoResultadoSentencia(seleccionado : integer): WideString;stdcall;
    function ObtenerTipoResultadoSentenciaActora(seleccionado : integer): WideString;stdcall;
    function ObtenerResultado(nrojuicio: String): WideString;stdcall;
    function ObtenerReclamoABM(Id_Reclamo: String): WideString;stdcall;
    function ObtenerParam(clave: String): WideString;stdcall;
    function ObtenerSiniestros(pag :integer; origendemanda: String):WideString;stdcall;
    function ObtenerEventosABM(et_id: String): WideString;stdcall;
    function ObtenerEventosCYQABM(nroorden, nroevento: String): WideString;stdcall;
    function ObtenerAcuerdosABM(nroorden, nropago: String): WideString;stdcall;
    function UploadsEventosABM(et_id: String): WideString;stdcall;
    function ObtenerInstanciaSeleccionada(idjurisdiccion, idfuero, idjuzgado : integer) : WideString;stdcall;
    function ObtenerInstanciaaCambiar(nrojuicio : string) : WideString;stdcall;
    function ObtenerFechadeNotificacion(nrojuicio : string) : WideString;stdcall;
    function ObtenerInstanciaModificar(nroinstancia : integer): WideString;stdcall;
    function ObtenerEstadoMediacion(NroJuicio : string): WideString;stdcall;
    function ObtenerNivelUsuario(txtUsuario,txtCont : string): WideString;stdcall;
    function ObtenerAplicaciones(idUsuario: string): WideString;stdcall;
    function ObtenerDatosUsuario(nrousuario : string): WideString;stdcall;
    function ObtenerValidacionFechaAcuerdo(fechavenc, nroorden : string): WideString;stdcall;
    function ObtenerValidacionFechaAcuerdoModif(fechavenc, nroorden, nropago: string): WideString;stdcall;
    function ObtenerValidacionFechaCuotas(fechavenc,cantcuotas,tiempo, nroorden: string): WideString;stdcall;
    function ObtenerChequesDisponible(Abogado: String; pag: Integer): WideString;stdcall;
    function ObtenerChequeDetalle(idCheque: String; pag: Integer): WideString;stdcall;
    function ObtenerChequeCantidad(Abogado: String): WideString;stdcall;
    function ObtenerMontoDemandadoObligatorio( idreclamo: String): WideString; stdcall;
    function ObtenerEsFederal(idjuicio: String): WideString;stdcall;
    function ObtenerIncapacidadVisible(idjuicio: String): WideString;stdcall;
    function ObtenerPeritosNombre(Nombre, tipoPericia : String): WideString;stdcall;
    function ObtenerPeritosApellido(Apellido, tipoPericia : String): WideString;stdcall;
    function ObtenerAnioValidoExpediente(anioExpediente: String): WideString;stdcall;
    function CargarDesignaciones() :WideString;stdcall;
    function CargarRSocial(texto : string) :WideString;stdcall;
    function CargarJurisdiccion( idjurisdiccion : Integer) :WideString;stdcall;
    function CargarTipoFiltro() :WideString;stdcall;
    function CargarTipo(concurso : Boolean; value : String) :WideString;stdcall;
    function CargarMotivo() :WideString;stdcall;
    function CargarFuero(jurisdiccion: integer; idfuero: Integer) :WideString;stdcall;
    function CargarFueroCYQ() :WideString;stdcall;
    function CargarJurisdiccionCYQ() :WideString;stdcall;
    function CargarJuzgado(jurisdiccion,fuero: integer; idJuzgado: Integer) :WideString;stdcall;
    function CargarSecretaria(juzgado: integer; idSecretaria: Integer) :WideString;stdcall;
    function CargarPeritos(peritodesignacion,filtro: string) :WideString;stdcall;
    function CargarMedidasCautelares(seleccionado : Integer) :WideString;stdcall;
    function CargarEventos(seleccionado : Integer) :WideString;stdcall;
    function CargarEventosActora(seleccionado : Integer) :WideString;stdcall;
    function CargarEventosCYQ() :WideString;stdcall;
    function CargarTipoPericia() : WideString;stdcall;
    function CargarEstado(seleccionado : Integer) :WideString;stdcall;
    function CargarEstadoParteActora(seleccionado : Integer) :WideString;stdcall;
    function CargarTipoJuicio(seleccionado : Integer) :WideString;stdcall;
    function CrearXmlTabla(param2,tabla,direccion,consulta :string; pag :integer = 0): WideString;
    function CrearXml1(param,consulta : string):WideString;
    function CrearXml2(param,param2,consulta :string):WideString;
    function ValidarModificacionReclamo(id_reclamo, instancia :string ):integer;stdcall;
    function ValidarModificacionimporte(id_importe :string ):integer;stdcall;
    procedure InsertarPeritoNuevo(nombre, apellido, cuil, tipoperito,parteoficio, usuario, direccion : string);stdcall;
    procedure InsertarImporteNuevo(nrojuicio, usuario, txtimporte,aplicado,detalle,detalleweb,instancia : string);stdcall;
    procedure InsertarEventoNuevo(txtfecha :TDateTime; txtfechavencimiento, txtobservaciones ,nrojuicio, usuario, cmbEventos :String);stdcall;
    procedure InsertarEventoCYQNuevo(txtfecha :TDateTime; txtobservaciones , usuario, cmbEventos,nroorden :String);stdcall;
    procedure InsertarAcuerdoNuevo(txtfechavenc :TDateTime; txtmonto, txtfechapago, txtobservaciones, usuario,nroorden, txtFechaExtincion, cmbTipo : string);stdcall;
    procedure InsertarCuotas(txtfecha1 :TDateTime; cantcuota, tiempo, txtmonto, usuario, nroorden, cmbTipo : string);stdcall;
    procedure InsertarEventoArchivo( listarchivoagregado, nombrearchivo, idevento, usuario:String);stdcall;
    procedure InsertarMedidaCautelar(cmbMedida, txtImporte, txtObservacion, nrojuicio, usuario :String);stdcall;
    procedure InsertarPeritajeNuevo(txtFechaAsignacion, txtFechaPericia, txtFVencImpug, cmbPericia, txtResultados, nrojuicio, usuario, incapacidadDemanda, incapacidadPeritoMedico, ibmArt, ibmPericial, impugnacion,idperito :String);stdcall;
    procedure InsertarLiquidacionFinal( FImporteCapital, FImporteIntereses, FTasasDeJusticias, FEmbargos, FOtros, txtobservaciones, usuario, nrojuicio : string);stdcall;
    procedure UpdateConcursoyquiebras(txtsindico, txtdireccion, txtlocaclidad, txtfuero, txttelefono, txtjurisdiccion, txtjuzgado, txtsecretaria, fechaconcurso, fechaquiebra, fechaart32, fechaart200, fverificacioncredito, usuario, nroorden, montoprivilegio, montoquirografario : string);stdcall;
    procedure UpdateMedidaCautelarABM(cmbMedida, txtImporte, txtObservacion, mcid, usuario :String);stdcall;
    procedure UpdateClaveUsuario(nrousuario,clave: string);stdcall;
    procedure UpdateImportes(ir_id, usuario : string);stdcall;
    procedure UpdateImporteABM(ir_id,txtimporte, detalle, usuario ,aplicado: string);stdcall;
    function UpdatePeritajes(pj_id, usuario: string): Boolean;stdcall;
    procedure UpdatePeritajesABM(txtFechaAsignacion, txtFechaPericia, txtFVencImpug, cmbPericia, txtResultados, pj_id, usuario, incapacidadDemanda, incapacidadPeritoMedico, ibmArt, ibmPericial, impugnacion,idperito :String);stdcall;
    procedure UpdateMedidasCautelares(mc_id, usuario : string);stdcall;
    function  UpdateEventos(et_id, usuario : string): Boolean;stdcall;
    procedure UpdateEventosCYQ(nroorden, nroevento, usuario : string);stdcall;
    procedure UpdateAcuerdos(nroorden, nropago, usuario : string);stdcall;
    procedure UpdateLiquidacionFinal( FImporteCapital, FImporteIntereses, FTasasDeJusticias, FEmbargos, FOtros, txtobservaciones, usuario, lf_id : string);stdcall;
    procedure UpdateEventosABM(txtfecha :TDateTime; txtfechavencimiento, et_id, txtobservaciones , usuario, cmbEventos  : string);stdcall;
    procedure UpdateEventosCYQABM(txtfecha :TDateTime; txtobservaciones, usuario, cmbEventos, nroorden,nroevento : string);stdcall;
    procedure UpdateAcuerdosABM(txtfechavenc :TDateTime; txtmonto, txtfechapago, txtobservaciones, usuario,nroorden,nropago, txtFechaExtincion, cmbtipo : string);stdcall;
    procedure UpdateEventosArchivos(ea_id, usuario, id_evento  : string);stdcall;
    procedure UpdateEstado(jt_id, cmbEstado,usuario : string);stdcall;
    procedure UpdateResultado(jt_id, resultado, cmbEstado,usuario : string); stdcall;
    procedure UpdateReclamos(rt_id, nrojuicio, usuario, montosentencia, porcentajesentencia : string);stdcall;
    procedure UpdateSentencia(txtfechasentencia, txtfecharecep :TDateTime ; jt_sentencia , cmbsentencia,  usuario, jt_id, txtimportehonorarios, txtimporteintereses, txtimportetasajusticia,instancia,txtMontoCondena, txtPorcentajeIncapacidad :string);stdcall;
    procedure UpdateSentenciaParteActora(txtfechasentencia :TDateTime ; jt_sentencia , cmbsentencia,  usuario, jt_id, txtimportehonorarios, txtimporteintereses, txtimportetasajusticia, txtImporteCapital, instancia :string);stdcall;
    procedure UpdateInstanciaAbmMod(JuicioEnTramite, Jurisdiccion, Fuero, Juzgado, Secretaria, Instancia, NroExpediente, AnioExpediente, Motivo, Detalle, LoginName, nroInstancia,EstadoMediacion : string; FechaIngreso :TDateTime);stdcall;
    procedure UpdateInstanciaJuicio(JuicioEnTramite, Jurisdiccion, Fuero, Juzgado, Secretaria, Instancia, NroExpediente, AnioExpediente, LoginName, nroInstancia,EstadoMediacion : string);stdcall;
    procedure UpdateInstanciaABMAlta(JuicioEnTramite, Jurisdiccion, Fuero, Juzgado, Secretaria, Instancia, NroExpediente, AnioExpediente, Motivo, Detalle, LoginName, EstadoMediacion : string; FechaIngreso :TDateTime);stdcall;
    procedure UpdateMasDatosJuicios(txtDomicilio, txtTelefonos, txtFax, txtEmail, usuario, idjuicio : string);stdcall;
    function sumaHonorarios(nrojuicio,instancia: String): WideString;stdcall;
    function sumaIntereses(nrojuicio,instancia: String): WideString;stdcall;
    function sumaTasas(nrojuicio,instancia: String): WideString;stdcall;
    function sumaCapital(nrojuicio,instancia: String): WideString;stdcall;
    function sumaSentencia(nrojuicio,instancia: String):WideString;stdcall;
    function ObtenerGastosTasasDeJusticia(nrojuicio: String): WideString;stdcall;
    function ObtenerGastosEmbargos(nrojuicio: String): WideString;stdcall;
    function ObtenerGastosOtros(nrojuicio: String): WideString;stdcall;
    function ObtenerNroCarpeta(idJuicio : String): WideString;stdcall;
    function ObtenerListadoTabla(bActivos, bTerminados : Boolean; nomusuario : String): WideString; stdcall;
    procedure CerrarConexion;
    procedure LogMessage(Message: String; EventType: DWord; Category: Word; ID: DWord);
 end;

implementation

uses Math, SysUtils, StrUtils, unDmConnection, SDEngine, SqlOracle,
  Numeros, Strfuncs, unDebug, General;

{ TSyncSrv }

function TSyncSrv.ObtenerDatosDeJuicio(nrojuicio,idestudio, usuarioweb: String): WideString;
var
  strqry, sXml: WideString;
  nro :Integer;
begin
  //LogMessage('ObtenerDatosDeJuicio - Inicio.',EVENTLOG_INFORMATION_TYPE,0,0);
  nro:= StrToInt(nrojuicio);
  strqry:= (
    ' SELECT ju_descripcion, fu_descripcion, jz_descripcion, jz_idinstancia, sc_descripcion, '+
    '        in_descripcion, ej_descripcion, bo_nombre, jt_caratula, jt_idfuero, '+
    '        jt_idjuzgado, jt_idsecretaria, jt_deminterruptiva, jt_idjurisdiccion, '+
    '        jt_idabogado, jt_idestado, jt_fechainijuicio, jt_registracion, '+
    '        jt_idtipo, jt_fechafinjuicio, jt_resultado, nvl2(jt_nroexpediente,jt_nroexpediente || ''/''|| jt_anioexpediente,'''') jt_expediente,jt_nroexpediente, '+
    '        jt_anioexpediente, '+
    '        jt_fechaasign, jt_fechanotificacionjuicio, jt_descripcion, '+
    '        jt_fechaalta, jt_usualta, jt_fechamodif, jt_usumodif, jt_fechabaja, '+
    '        jt_usubaja, jt_fechainijuicio, jt_id, jt_bloqueado, '+
    '        tj_descripcion AS tipojuicio, jt_numerocarpeta, jt_fechaingresoraj, '+
    '        jt_condiciondenoseguro, jt_numeroordenraj, ej_id, '+
    '           NVL (jt_demandante, '''') '+
    '        || ''C/'' '+
    '        || NVL (jt_demandado, '''') '+
    '        || '' '' '+
    '        || jt_caratula AS descripcaratula, '+
    '        (SELECT MAX (ij_id) '+
    '           FROM legales.lij_instanciajuicioentramite '+
    '          WHERE ij_idjuicioentramite = jt_id) ij_id '+
    '   FROM legales.ljz_juzgado, '+
    '        legales.lju_jurisdiccion, '+
    '        legales.lin_instancia, '+
    '        legales.lfu_fuero, '+
    '        legales.lsc_secretaria, '+
    '        legales.ljt_juicioentramite, '+
    '        legales.lej_estadojuicio, '+
    '        legales.lbo_abogado, '+
    '        legales.ltj_tipojuicio '+
    '  WHERE jz_idfuero = fu_id '+
    '    AND jz_idjurisdiccion = ju_id '+
    '    AND jz_idinstancia = in_id '+
    '    AND jz_id = sc_idjuzgado '+
    '    AND ju_id = jt_idjurisdiccion '+
    '    AND fu_id = jt_idfuero '+
    '    AND sc_id = jt_idsecretaria '+
    '    AND jt_idestado = ej_id '+
    '    AND jt_idabogado = bo_id '+
    '    AND tj_id = jt_idtipo '+
    '    AND jt_fechabaja IS NULL '+
    '    AND (art.weblegales.pertencealestudio (jt_idabogado, '+SqlNumber (idestudio)+','+
             SqlValue(usuarioweb)+' ) = ''S'' )'+
    '    AND (jt_estadomediacion LIKE ''%J%'' OR jt_estadomediacion LIKE ''%A%'') '+
    '    AND jt_id = '+ SqlInt(nro) );

  sXml:= CrearXml1('LJT_JUICIOENTRAMITE',strqry);
  result:= sXml;
  //LogMessage('ObtenerDatosDeJuicio - Finalizo.',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerDatosCYQ(nroorden: String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerDatosCYQ - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT LCQ.CQ_NROORDEN, LCQ.CQ_CUIT, CMP.MP_NOMBRE, LCQ.CQ_DEUDANOMINAL, '+
    '        LCQ.CQ_DEUDATOTAL, LCQ.CQ_FECHAVERIFICACIONCREDITO, '+
    '        LCQ.CQ_DEUDAVERIFICADA, LCQ.CQ_FECHACONCURSO as FECHACONCURSO, '+
    '        LCQ.CQ_FECHAQUIEBRA as FECHAQUIEBRA, CQ_FECHAASIGN, CQ_FECHAVTOART32, '+
    '        CQ_FECHAVTOART200, '+
    '        CQ_FECHATOMACONCONCURSO, CQ_FECHATOMACONQUIEBRA, LCQ.CQ_MONTOPRIVILEGIO, '+
    '        LCQ.CQ_MONTOQUIROG, LCQ.CQ_SINDICO, '+
    '        LCQ.CQ_DIRECCIONSIND, LCQ.CQ_LOCALIDADSIND, LCQ.CQ_TELEFONOSIND, '+
    '        LCQ.CQ_JUZGADO, LCQ.CQ_SECRETARIA, '+
    '        LCQ.CQ_FUERO, FUE.TB_DESCRIPCION FUE_DESCRIPCION, LCQ.CQ_JURISDICCION, '+
    '        ju_descripcion JUR_DESCRIPCION, '+
    '        LCQ.CQ_ABOGADO, bo_nombre, LCQ.CQ_MONTOHOMOLOG, '+
    '        LCQ.CQ_ESTADO, LCQ.CQ_AUTORIZACION, LCQ.CQ_ULTPERCONCURSO, '+
    '        LCQ.CQ_ULTPERQUIEBRA, LCQ.CQ_LEGAJO '+
    '   FROM ART.CTB_TABLAS FUE, LEGALES.LJU_JURISDICCION, ART.CMP_EMPRESAS CMP, '+
    '        LEGALES.LBO_ABOGADO LBO, ART.LCQ_CONCYQUIEBRA LCQ '+
    '  WHERE LCQ.CQ_FUERO = FUE.TB_CODIGO (+) '+
    '    AND LCQ.CQ_JURISDICCION = ju_id(+) '+
    '    AND LCQ.CQ_CUIT = CMP.MP_CUIT '+
    '    AND LCQ.CQ_ABOGADO = LBO.BO_ID (+) '+
    '    AND FUE.TB_CLAVE (+) = ''FUERO'' '+
    '    AND LCQ.CQ_NROORDEN = '+ SqlValue(nroorden) );

  sXml:= CrearXml1('DATOSCYQ',strqry);
  result:= sXml;
  //LogMessage('ObtenerDatosCYQ - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerEventosCYQ(pag :integer;nroorden: String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerEventosCYQ - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT ce_nroorden, ce_nroevento, tb_descripcion, ce_fecha, ce_observaciones, ce_codevento '+
    '   FROM ctb_tablas, lce_eventocyq '+
    '  WHERE tb_codigo = ce_codevento '+
    '    AND tb_clave = ''EVCYQ'' '+
    '    AND ce_nroorden = '+ SqlValue(nroorden)+
    '    AND ce_nroevento > 0 ');

  sXml:=CrearXmlTabla('EVENTOSCYQ','dtsEventosCYQ', 'http://www.changeme.now/dtsEventosCYQ.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerEventosCYQ - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerAcuerdos(pag :integer;nroorden, filtro: String): WideString;
var
  qry :TSDQuery;
  sSQL, sXml: WideString;
  i, y, x:integer;
  format : TFormatSettings;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerAcuerdos - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    sSQL:=      ' SELECT ca_nroorden, ca_nropago, ca_monto, ca_fechavenc, ca_fechapago,  '+
                '        ca_observaciones, tb_descripcion, ca_fechaextincion '+
                '   FROM lca_acuerdocyq, CTB_TABLAS'+
                '  WHERE ca_nroorden = '+SqlValue(nroorden)+
                '    AND ca_nropago > 0 '+
                '    AND TB_CODIGO(+) = CA_TIPO '+
                '    AND TB_CLAVE(+) = ''TACYQ''';
    if(filtro <> '') then
      sSQL:= sSQL + ' AND CA_TIPO = '+ SqlValue(filtro);

    //LogMessage('ObtenerAcuerdos - Query - '+sSQL,EVENTLOG_INFORMATION_TYPE,0,0);
    qry:=dmConn.GetQuery(sSQL);
    //LogMessage('ObtenerAcuerdos - Despues GetQuery ',EVENTLOG_INFORMATION_TYPE,0,0);

    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';
    sXml := '';

    x:=0;
    sXml := sXml + '<'+'dtsAcuerdos'+' xmlns="'+'http://www.changeme.now/dtsAcuerdos.xsd'+'">';
    if pag<>0 then
    begin
      y:=0;
      while not qry.Eof and (y<pag*9) do
      begin
        qry.Next;
        y:=y+1;
      end;
    end;
    while not qry.Eof and (x<9) do
    begin
      sXml := sXml+ '<'+'ACUERDOS'+'>';
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
        if (qry.Fields[i].DataType = ftFloat) and (qry.Fields[i].FieldName='CA_MONTO')then
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
        else
        begin
          auxString := qry.Fields[i].AsString;
          ReplaceString(auxString,'&','&amp;');
          ReplaceString(auxString,'<','&lt;');
          ReplaceString(auxString,'>','&gt;');
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
        end;
      end;
      qry.Next;
      sXml := sXml+ '</'+'ACUERDOS'+'>';
      x:=x+1;
    end;
    sXml := sXml + '</'+'dtsAcuerdos'+'>';
    //LogMessage('ObtenerAcuerdos - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;
    //LogMessage('ObtenerAcuerdos - Desconecto ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ObtenerAcuerdosMod(nroorden: String): WideString;
var
  qry :TSDQuery;
  sXml: WideString;
  i, x:integer;
  format : TFormatSettings;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerAcuerdosMod - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.Getquery(
     '   SELECT TB_DESCRIPCION TIPO_ACUERDO, '+
	   '          COUNT(*) CUOTAS, SUM(DECODE(CA_FECHAPAGO,NULL,1,0)) CUOTAS_PENDIENTES, '+
	   '          SUM(CA_MONTO) MONTO_TOTAL, SUM(DECODE(CA_FECHAPAGO,NULL,CA_MONTO,0)) MONTO_PENDIENTE '+
     '     FROM CTB_TABLAS, LCA_ACUERDOCYQ '+
     '    WHERE TB_CODIGO(+) = CA_TIPO '+
     '      AND TB_CLAVE(+) = ''TACYQ'' '+
     '      AND CA_NROORDEN = '+SqlValue(nroorden) +
     '      AND CA_NROPAGO > 0 '+
     ' GROUP BY TB_DESCRIPCION ');

    //LogMessage('ObtenerAcuerdosMod - Query - '+qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';
    sXml := '';

    x:=0;
    sXml := sXml + '<'+'dtsAcuerdosmod'+' xmlns="'+'http://www.changeme.now/dtsAcuerdosmod.xsd'+'">';
    while not qry.Eof and (x<9) do
    begin
      sXml := sXml+ '<'+'ACUERDOS'+'>';
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
        if (qry.Fields[i].DataType = ftFloat) and (qry.Fields[i].FieldName='CA_MONTO')then
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
        else
        begin
          auxString := qry.Fields[i].AsString;
          ReplaceString(auxString,'&','&amp;');
          ReplaceString(auxString,'<','&lt;');
          ReplaceString(auxString,'>','&gt;');
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
        end;
      end;
      qry.Next;
      sXml := sXml+ '</'+'ACUERDOS'+'>';
      x:=x+1;
    end;
    sXml := sXml + '</'+'dtsAcuerdosmod'+'>';
    //LogMessage('ObtenerAcuerdosMod - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;
    //LogMessage('ObtenerAcuerdosMod - Desconecto ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ObtenerEmpresa(Cuil :String):WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerEmpresa - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    '  SELECT  em_id AS ID, em_cuit AS CUIT, em_nombre AS NOMBRE, '+
    '          co_contrato AS CONTRATO, '+
    '          art.afiliacion.check_cobertura (co_contrato) AS CHECKCOBERTURA, '+
    '          DECODE '+
    '                (art.afiliacion.check_cobertura (co_contrato), '+
    '                 1, 1, '+
    '                 2 '+
    '                ) AS ORDENESTADO, '+
    '          co_fechabaja AS FECHA_BAJA, em_fechaconcurso, em_fechaquiebra '+
    '     FROM aem_empresa, aco_contrato '+
    '    WHERE em_id = co_idempresa AND em_cuit = '+ SqlValue(cuil)+
    ' ORDER BY ordenestado, CONTRATO DESC, NOMBRE ');

  sXml:= CrearXml1('EMPRESA',strqry);
  result:= sXml;
  //LogMessage('ObtenerEmpresa - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerEstado(codigo :String):WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerEstado - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT tb_codigo AS ID, tb_codigo AS codigo, tb_descripcion AS descripcion, '+
    '        tb_fechabaja AS baja, tb_clave, tb_especial1, tb_especial2 '+
    '   FROM ctb_tablas '+
    '  WHERE tb_codigo <> ''0'' '+
    '    AND tb_fechabaja IS NULL '+
    '    AND tb_clave = ''ESTCQ'' '+
    '    AND ctb_tablas.tb_codigo = '+SqlValue(codigo));

  sXml:= CrearXml1('ESTADO',strqry);
  result:= sXml;
  //LogMessage('ObtenerEstado - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerDemandas(nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
  nro: Integer;
begin
  //LogMessage('ObtenerDemandas - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  nro:= StrToInt(nrojuicio);
  strqry:=(
    ' SELECT lod_origendemanda.od_id, lod_origendemanda.od_idreclamante, '+
    '        lre_reclamante.re_descripcion, od_idjuicioentramite, '+
    '        legales.get_descripcionorigendemanda (lod_origendemanda.od_id) AS descripciondemanda, '+
    '        NVL ((SELECT COUNT (*) '+
    '                FROM legales.v_lds_siniestrojuicioentramite '+
    '               WHERE ds_idorigendemanda = od_id), 0 ) AS tienesiniestros '+
    '   FROM legales.lod_origendemanda, legales.lre_reclamante '+
    '  WHERE lre_reclamante.re_id = lod_origendemanda.od_idreclamante '+
    '    AND lod_origendemanda.od_fechabaja IS NULL '+
    '    AND od_idjuicioentramite = ' + SqlInt(nro) );

  sXml:=CrearXmlTabla('ORIGENDEMANDA','dstDemanda', 'http://www.changeme.now/dstDemanda.xsd',strqry);
  result:= sXml;
  //LogMessage('ObtenerDemandas - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerSiniestros(pag :integer; origendemanda: String):WideString;
var
  strqry, sXml: WideString;
  od: Integer;
begin
  //LogMessage('ObtenerSiniestros - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  od:= StrToInt(origendemanda);
  strqry:=(
    ' SELECT sj_idorigendemanda, ex_siniestro, ex_orden, ex_recaida, ex_siniestrored, mp_contrato, '+
    '        mp_cuit, mp_nombre, tj_cuil, tj_nombre, ex_diagnostico, '+
    '        ex_fechaaccidente, ex_bajamedica, ex_fecharecaida, ex_altamedica, '+
    '        tb_descripcion, sj_fechaalta, sj_fechamodif, sj_fechabaja, liq.get_importeliquidadoilt(ex_siniestro,ex_orden,ex_recaida) as importeliquidado '+
    '   FROM art.ctb_tablas, '+
    '        art.ctj_trabajadores, '+
    '        art.cmp_empresas, '+
    '        art.sex_expedientes, '+
    '        legales.lsj_siniestrosjuicioentramite '+
    '  WHERE NVL (ex_tipo, ''1'') = tb_codigo(+) '+
    '    AND tb_clave = ''STIPO'' '+
    '    AND mp_cuit = ex_cuit '+
    '    AND tj_cuil = ex_cuil '+
    '    AND ex_siniestro = sj_siniestro '+
    '    AND ex_recaida = sj_recaida '+
    '    AND ex_orden = sj_orden '+
    '    AND sj_idorigendemanda = '+ SqlInt(od));

  sXml:=CrearXmlTabla('SINIESTROS','dtsSiniestros', 'http://www.changeme.now/dtsSiniestros.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerSiniestros - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerReclamos(nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
  nro: Integer;
begin
  //LogMessage('ObtenerReclamos - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  nro:= StrToInt(nrojuicio);
  strqry:= (
    ' SELECT lrc_reclamo.rc_descripcion, lrt_reclamojuicioentramite.rt_id, '+
    '        lrt_reclamojuicioentramite.rt_idjuicioentramite, '+
    '        lrt_reclamojuicioentramite.rt_idreclamo, '+
    '        lrt_reclamojuicioentramite.rt_montodemandado, '+
    '        lrt_reclamojuicioentramite.rt_montosentencia, '+
    '        lrt_reclamojuicioentramite.rt_porcentajesentencia, '+
    '        lrt_reclamojuicioentramite.RT_IMPORTENOMINAL, '+
    '        lrt_reclamojuicioentramite.RT_INTERESES, '+
    '        lrt_reclamojuicioentramite.rt_porcentajeincapacidad '+
    '   FROM legales.lrt_reclamojuicioentramite, legales.lrc_reclamo '+
    '  WHERE lrc_reclamo.rc_id = lrt_reclamojuicioentramite.rt_idreclamo '+
    '    AND lrt_reclamojuicioentramite.rt_fechabaja IS NULL '+
    '    AND rt_idjuicioentramite = '+ SqlInt(nro) );

  sXml:=CrearXmlTabla('ORIGENRECLAMO','dstReclamo', 'http://www.changeme.now/dstReclamo.xsd',strqry);
  result:= sXml;
  //LogMessage('ObtenerReclamos - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerMedidasCautelares(pag : integer; nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
  nro: Integer;
begin
  //LogMessage('ObtenerMedidasCautelares - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  nro:= StrToInt(nrojuicio);
  strqry:= (
    ' SELECT ltm.tm_descripcion AS medidas, lmc.mc_importe, lmc.mc_observaciones, '+
    '        lmc.mc_idtipomedida, lmc.mc_idjuicioentramite, lmc.mc_id '+
    '   FROM legales.lmc_medidascautelares lmc, legales.ltm_tipomedidas ltm '+
    '  WHERE lmc.mc_idtipomedida = ltm.tm_id '+
    '    AND lmc.mc_fechabaja IS NULL '+
    '   AND lmc.mc_idjuicioentramite = '+SqlInt(nro));

  sXml:=CrearXmlTabla('MEDIDASCAUTELARES','dtsMedidasCautelares', 'http://www.changeme.now/dtsMedidasCautelares.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerMedidasCautelares - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerEventos(pag : integer; nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
  nro: Integer;
begin
  //LogMessage('ObtenerEventos - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  nro:= StrToInt(nrojuicio);
  strqry:= (
    '   SELECT ev.te_descripcion AS evento, ejt.et_fechaevento, '+
    '          ejt.et_fechavencimiento, ejt.et_observaciones, '+
    '          ejt.et_idjuicioentramite, ejt.et_id '+
    '     FROM legales.let_eventojuicioentramite ejt, legales.lte_tipoevento ev '+
    '    WHERE ejt.et_idtipoevento = ev.te_id '+
    '      AND ejt.et_fechabaja IS NULL '+
    '      AND te_visibleweb = ''S'' '+
    '      AND ejt.et_idjuicioentramite = ' + SqlInt(nro)+
    ' ORDER BY et_fechaevento DESC');

  sXml:=CrearXmlTabla('EVENTOS','dtsEventos', 'http://www.changeme.now/dtsEventos.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerEventos - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerEventosABM(et_id: String): WideString;
var
  strqry, sXml: WideString;
  etid: Integer;
begin
  //LogMessage('ObtenerEventosABM - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  etid:= StrToInt(et_id);
  strqry:= (
    ' SELECT et_fechavencimiento, et_fechaevento, et_idtipoevento, et_observaciones, '+
    '        et_idjuicioentramite,et_usualta '+
    '   FROM legales.let_eventojuicioentramite '+
    '  WHERE et_id = '+SqlInt(etid));

  sXml := CrearXml1('EVENTOS',strqry);
  result:= sXml;
  //LogMessage('ObtenerEventosABM - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerEventosCYQABM(nroorden, nroevento: String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerEventosCYQABM - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT ce_codevento, ce_fecha, ce_observaciones '+
    '   FROM lce_eventocyq '+
    '  WHERE ce_nroorden = '+SqlValue(nroorden)+
    '    AND ce_nroevento = '+ SqlValue(nroevento));

  sXml := CrearXml1('EVENTOSCYQ',strqry);
  result:= sXml;
  //LogMessage('ObtenerEventosCYQABM - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerAcuerdosABM(nroorden, nropago: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  i: Integer;
  format : TFormatSettings;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerAcuerdosABM - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery(
      ' SELECT ca_monto, ca_fechavenc, ca_fechapago, ca_observaciones, ca_tipo,  '+
      '        ca_fechaextincion '+
      '   FROM lca_acuerdocyq '+
      '  WHERE ca_nroorden = '+SqlValue(nroorden)+
      '    AND ca_nropago = '+SqlValue(nropago));

    //LogMessage('ObtenerAcuerdosABM - Query - '+qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    sXml := sXml + '<'+'ACUERDOS'+'>';
    while not qry.Eof do
    begin
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
        if (qry.Fields[i].DataType = ftFloat) and (qry.Fields[i].FieldName='CA_MONTO')then
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
        else
        begin
          auxString := qry.Fields[i].AsString;
          ReplaceString(auxString,'&','&amp;');
          ReplaceString(auxString,'<','&lt;');
          ReplaceString(auxString,'>','&gt;');
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
        end;
      end;
      qry.Next;
    end;
    sXml := sXml + '</'+'ACUERDOS'+'>';
    //LogMessage('ObtenerAcuerdosABM - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;
    //LogMessage('ObtenerAcuerdosABM - Desconecto ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.UploadsEventosABM(et_id: String): WideString;
var
  strqry, sXml: WideString;
  etid: Integer;
begin
  //LogMessage('UploadsEventosABM - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  etid:= StrToInt(et_id);
  strqry:= (
    ' SELECT ea_descripcion, ea_id '+
    '   FROM legales.lea_eventoarchivoasociado '+
    '  WHERE ea_ideventojuicioentramite = '+SqlInt(etid)+
    '    AND ea_fechabaja IS NULL ');

  sXml := '';
  sXml := CrearXml2('EVENTOS','EVENTO',strqry);
  result:= sXml;
  //LogMessage('UploadsEventosABM - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerPeritajes(nrojuicio: String;pag:Integer): WideString;
var
  strqry, sXml: WideString;
  pj_idjuicioentramite: Integer;
begin
  //LogMessage('ObtenerPeritajes - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  pj_idjuicioentramite:= StrToInt(nrojuicio);
  strqry:= (
    ' SELECT ltp.tp_descripcion AS tipopericia, '+
    '        lpj.pj_fechanotificacion AS fechanotificacion, '+
    '        lpj.pj_fechaperitaje AS fechapericia, '+
    '        lpj.pj_fechavencimpugnacion AS fvencimpugnacion, '+
    '        lpj.pj_impugnacion AS impugnacion, lpj.pj_id, lpj.pj_idjuicioentramite '+
    '   FROM legales.lpj_peritajejuicio lpj, legales.ltp_tipopericia ltp '+
    '  WHERE lpj.pj_idtipopericia = ltp.tp_id(+) '+
    '    AND lpj.pj_fechabaja IS NULL '+
    '    AND lpj.pj_idjuicioentramite = '+ SqlInt(pj_idjuicioentramite) );

  sXml := '';
  sXml:=CrearXmlTabla('PERITAJES','dtsPeritajes', 'http://www.changeme.now/dtsPeritajes.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerPeritajes - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerPeritajesABM(pj_id: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  idperitaje, i : Integer;
  format : TFormatSettings;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerPeritajesABM - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    idperitaje:= StrToInt(pj_id);
    qry:= dmConn.GetQuery(
      ' SELECT PJ_ID, PJ_FECHAPERITAJE, PJ_IDJUICIOENTRAMITE, PJ_RESULTADOPERITAJE, PJ_FECHANOTIFICACION, '+
      '        PJ_IDTIPOPERICIA, PJ_FECHAVENCIMPUGNACION, PJ_INCAPACIDADDEMANDA, PJ_USUALTA, '+
      '        PJ_INCAPACIDADPERITOMEDICO, PJ_IBMART, PJ_IBMPERICIAL, PJ_IMPUGNACION, '+
      '        DECODE (pj_impugnacion, ''S'', 0, ''N'', 1, -1) AS IMPUGNACION, PJ_IDPERITO, '+
      '        PE_NOMBRE, pe_nombreindividual, pe_apellido '+
      '   FROM legales.lpj_peritajejuicio,legales.lpe_perito '+
      '  WHERE pj_idperito = pe_id(+) '+
      '    AND pj_id = '+ SqlInt(idperitaje));

    //LogMessage('ObtenerPeritajesABM - Query - '+qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);  
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';

    result:= sXml;
    sXml := sXml + '<PERITAJES>';
    while not qry.Eof do
    begin
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
          if (qry.Fields[i].DataType = ftFloat) and not ((qry.Fields[i].FieldName = 'PJ_IDJUICIOENTRAMITE')or (qry.Fields[i].FieldName = 'IMPUGNACION')or
              (qry.Fields[i].FieldName = 'PJ_ID') or (qry.Fields[i].FieldName = 'PJ_IDTIPOPERICIA') or
              (qry.Fields[i].FieldName = 'PJ_IDPERITO')) then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
          else
          begin
            auxString := qry.Fields[i].AsString;
            ReplaceString(auxString,'&','&amp;');
            ReplaceString(auxString,'<','&lt;');
            ReplaceString(auxString,'>','&gt;');
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
          end;
      end;
      qry.Next;
    end;
    sXml := sXml + '</PERITAJES>';
    //LogMessage('ObtenerPeritajesABM - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;
    //LogMessage('ObtenerPeritajesABM - Desconecto ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ObtenerMedidaCautelarABM(MC_ID: String): WideString;
var
  strqry, sXml: WideString;
  idMedida: Integer;
begin
  //LogMessage('ObtenerMedidaCautelarABM - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  idMedida:= StrToInt(MC_ID);
  strqry:= (
    ' SELECT MC_IDTIPOMEDIDA, MC_IMPORTE, MC_OBSERVACIONES, '+
    '        MC_IDJUICIOENTRAMITE '+
    '   FROM legales.LMC_MEDIDASCAUTELARES '+
    '  WHERE MC_ID = '+ SqlInt(idMedida));
  sXml := '';
  sXml:= CrearXml1('MEDIDACAUTELAR',strqry);
  result := sXml;
  //LogMessage('ObtenerMedidaCautelarABM - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerGastosTasasDeJusticia(nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerGastosTasasDeJusticia - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT nvl(sum(gj_importe),0) as gj_importe '+
    '   FROM legales.lir_importesreguladosjuicio, '+
    '        legales.lgj_gastosjuicio, '+
    '        legales.ltg_tipogasto '+
    '  WHERE ir_id = gj_idimportesjuicio '+
    '    AND ir_aplicacion = ''G'' '+
    '    AND tg_id = gj_idtipogasto '+
    '    AND GJ_IDTIPOGASTO = 1 '+
    '    AND ir_idjuicioentramite = '+ SqlValue(nrojuicio));
  sXml := '';
  sXml:= CrearXml1('GASTOTASADEJUSTICIA',strqry);
  result := sXml;
  //LogMessage('ObtenerGastosTasasDeJusticia - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerGastosEmbargos(nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerGastosEmbargos - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT nvl(sum(gj_importe),0) as gj_importe '+
    '   FROM legales.lir_importesreguladosjuicio, '+
    '        legales.lgj_gastosjuicio, '+
    '        legales.ltg_tipogasto '+
    '  WHERE ir_id = gj_idimportesjuicio '+
    '    AND ir_aplicacion = ''G'' '+
    '    AND tg_id = gj_idtipogasto '+
    '    AND GJ_IDTIPOGASTO = 4 '+
    '    AND ir_idjuicioentramite = '+ SqlValue(nrojuicio));
  sXml := '';
  sXml:= CrearXml1('GASTOEMBARGO',strqry);
  result := sXml;
  //LogMessage('ObtenerGastosEmbargos - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerGastosOtros(nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerGastosOtros - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT nvl(sum(gj_importe),0) as gj_importe '+
    '   FROM legales.lir_importesreguladosjuicio, '+
    '        legales.lgj_gastosjuicio, '+
    '        legales.ltg_tipogasto '+
    '  WHERE ir_id = gj_idimportesjuicio '+
    '    AND ir_aplicacion = ''G'' '+
    '    AND tg_id = gj_idtipogasto '+
    '    AND GJ_IDTIPOGASTO not in (1,4) '+
    '    AND ir_idjuicioentramite = '+ SqlValue(nrojuicio));
  sXml := '';
  sXml:= CrearXml1('GASTOOTROS',strqry);
  result := sXml;
  //LogMessage('ObtenerGastosOtros - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerLiquidacionFinal(nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerLiquidacionFinal - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT lf_id, lf_capital, lf_intereses, lf_tasasdejusticia, lf_embargos, '+
    '        lf_otros, lf_observaciones '+
    '   FROM legales.llf_liquidacionfinal '+
    '  WHERE lf_idjuicioentramite = '+SqlValue(nrojuicio));

  sXml := '';
  sXml:= CrearXml1('LIQUIDACIONFINAL',strqry);
  result := sXml;
  //LogMessage('ObtenerLiquidacionFinal - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ExisteLiquidacion(nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ExisteLiquidacion - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT 1 as existe '+
    '   FROM legales.ljt_juicioentramite '+
    '  WHERE jt_id = '+SqlValue(nrojuicio)+
    '    AND jt_fechasentencia IS NOT NULL');

  sXml := '';
  sXml:= CrearXml1('EXISTELIQUIDACION',strqry);
  result := sXml;
  //LogMessage('ExisteLiquidacion - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerImportesABM(ir_id: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  idimporte, i: Integer;
  format : TFormatSettings;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerImportesABM - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    idimporte:= StrToInt(ir_id);
    qry:= dmConn.GetQuery(
      ' SELECT ir_importesentencia, ir_aplicacion, ir_detalleweb, ir_idjuicioentramite '+
      '   FROM legales.lir_importesreguladosjuicio '+
      '  WHERE ir_id = '+ SqlInt(idimporte));

    //LogMessage('ObtenerImportesABM - Query - '+qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);  
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    sXml := sXml + '<'+'IMPORTES'+'>';
    while not qry.Eof do
    begin
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
        if (qry.Fields[i].DataType = ftFloat)and not (qry.Fields[i].FieldName = 'IR_IDJUICIOENTRAMITE') then
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
        else
        begin
          auxString := qry.Fields[i].AsString;
          ReplaceString(auxString,'&','&amp;');
          ReplaceString(auxString,'<','&lt;');
          ReplaceString(auxString,'>','&gt;');
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
        end;
      end;
      qry.Next;
    end;
    sXml := sXml + '</'+'IMPORTES'+'>';
    //LogMessage('ObtenerImportesABM - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;
    //LogMessage('ObtenerImportesABM - Desconecto ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ObtenerSentencia(nrojuicio: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  nro, i: Integer;
  format : TFormatSettings;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerSentencia - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    nro:= StrToInt(nrojuicio);
    qry:= dmConn.GetQuery(
      ' SELECT jtr.jt_id, jt_idtiporesultadosentencia, jtr.jt_fechasentencia,jt_fecharecepsentencia, '+
      '        jtr.jt_importedemandado, jt_importecapital, jt_importetasajusticia, '+
      '        jtr.jt_importesentencia, jtr.jt_importehonorarios, jt_detallesentencia, '+
      '        jt_interesessentencia,JT_MONTOCONDENA,JT_PORCENTAJEINCAPACIDAD '+
      '   FROM legales.ljt_juicioentramite jtr '+
      '  WHERE jtr.jt_fechabaja IS NULL AND jtr.jt_id = '+ SqlInt(nro) );

    //LogMessage('ObtenerSentencia - Query - '+qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    sXml := sXml + '<'+'SENTENCIA'+'>';
    while not qry.Eof do
    begin
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
        if (qry.Fields[i].DataType = ftFloat) and not (qry.Fields[i].FieldName='JT_IDTIPORESULTADOSENTENCIA')then
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
        else
        begin
          auxString := qry.Fields[i].AsString;
          ReplaceString(auxString,'&','&amp;');
          ReplaceString(auxString,'<','&lt;');
          ReplaceString(auxString,'>','&gt;');
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
        end;
      end;
      qry.Next;
    end;
    sXml := sXml + '</'+'SENTENCIA'+'>';
    //LogMessage('ObtenerSentencia - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;;
    //LogMessage('ObtenerSentencia - Desconecto ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ObtenerMontosCYQ(nroorden: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  i: Integer;
  format : TFormatSettings;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerMontosCYQ - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery(
      ' SELECT LCQ.CQ_NROORDEN, LCQ.CQ_CUIT, CMP.MP_NOMBRE, LCQ.CQ_DEUDANOMINAL, LCQ.CQ_DEUDATOTAL, '+
      '        LCQ.CQ_DEUDAVERIFICADA, NVL(LCQ.CQ_FECHACONCURSO, MP_FECHACONCURSO) FECHACONCURSO, '+
      '        NVL(LCQ.CQ_FECHAQUIEBRA, MP_FECHAQUIEBRA) FECHAQUIEBRA, CQ_FECHAASIGN, CQ_FECHAVTOART32, CQ_FECHAVTOART200, '+
      '        CQ_FECHATOMACONCONCURSO, CQ_FECHATOMACONQUIEBRA, LCQ.CQ_MONTOPRIVILEGIO, LCQ.CQ_MONTOQUIROG, LCQ.CQ_SINDICO, '+
      '        LCQ.CQ_DIRECCIONSIND, LCQ.CQ_LOCALIDADSIND, LCQ.CQ_TELEFONOSIND, LCQ.CQ_JUZGADO, LCQ.CQ_SECRETARIA, '+
      '        LCQ.CQ_FUERO, FUE.TB_DESCRIPCION FUE_DESCRIPCION, LCQ.CQ_JURISDICCION, JUR.TB_DESCRIPCION JUR_DESCRIPCION, '+
      '        LCQ.CQ_ABOGADO, bo_nombre, LCQ.CQ_MONTOHOMOLOG, LCQ.CQ_ESTADO, LCQ.CQ_AUTORIZACION, LCQ.CQ_ULTPERCONCURSO, '+
      '        LCQ.CQ_ULTPERQUIEBRA, LCQ.CQ_LEGAJO '+
      '   FROM ART.CTB_TABLAS FUE, ART.CTB_TABLAS JUR, ART.CMP_EMPRESAS CMP, LEGALES.LBO_ABOGADO LBO, ART.LCQ_CONCYQUIEBRA LCQ '+
      '  WHERE LCQ.CQ_FUERO = FUE.TB_CODIGO (+) '+
      '    AND LCQ.CQ_JURISDICCION = JUR.TB_CODIGO (+) '+
      '    AND LCQ.CQ_CUIT = CMP.MP_CUIT '+
      '    AND LCQ.CQ_ABOGADO = LBO.BO_ID (+) '+
      '    AND FUE.TB_CLAVE (+) = ''FUERO'' '+
      '    AND JUR.TB_CLAVE (+) = ''JURIS'' '+
      '    AND LCQ.CQ_NROORDEN = '+ SqlValue(nroorden) );
    //LogMessage('ObtenerMontosCYQ - Query - '+qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    sXml := sXml + '<'+'DATOSCYQ'+'>';
    while not qry.Eof do
    begin
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
          if (qry.Fields[i].DataType = ftFloat) and not (qry.Fields[i].FieldName = 'RT_IDJUICIOENTRAMITE') then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
          else
          begin
            auxString := qry.Fields[i].AsString;
            ReplaceString(auxString,'&','&amp;');
            ReplaceString(auxString,'<','&lt;');
            ReplaceString(auxString,'>','&gt;');
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
          end;
      end;
      qry.Next;
    end;
    sXml := sXml + '</'+'DATOSCYQ'+'>';
    //LogMessage('ObtenerMontosCYQ - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;
    //LogMessage('ObtenerMontosCYQ - Desconecto ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;


function TSyncSrv.ObtenerReclamoABM(Id_Reclamo: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  nro,i: Integer;
  format : TFormatSettings;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerReclamoABM - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    nro:= StrToInt(Id_Reclamo);
    qry:= dmConn.GetQuery(
      ' SELECT rc_descripcion, rt_montodemandado, rt_montosentencia, '+
      '        rt_porcentajesentencia, rt_idjuicioentramite '+
      '   FROM legales.lrt_reclamojuicioentramite rjt, legales.lrc_reclamo r '+
      '  WHERE rjt.rt_idreclamo = r.rc_id AND rjt.rt_id = '+ SqlInt(nro) );
    //LogMessage('ObtenerReclamoABM - Query - '+qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    sXml := sXml + '<'+'RECLAMO'+'>';
    while not qry.Eof do
    begin
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
          if (qry.Fields[i].DataType = ftFloat) and not (qry.Fields[i].FieldName = 'RT_IDJUICIOENTRAMITE') then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
          else
          begin
            auxString := qry.Fields[i].AsString;
            ReplaceString(auxString,'&','&amp;');
            ReplaceString(auxString,'<','&lt;');
            ReplaceString(auxString,'>','&gt;');
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
          end;
      end;
      qry.Next;
    end;
    sXml := sXml + '</'+'RECLAMO'+'>';
    //LogMessage('ObtenerReclamoABM - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;
    //LogMessage('ObtenerReclamoABM - Desconectado ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ObtenerTipoResultadoSentencia(seleccionado : integer): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerTipoResultadoSentencia - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT tr_id, tr_descripcion, tr_etapa '+
    '   FROM legales.ltr_tiporesultadosentencia '+
    '  WHERE tr_etapa LIKE ''%J%'' ' );
  strqry := strqry + ' AND ( ' ;
  if(seleccionado <> -1) then
    strqry := strqry + ' tr_id = '+SqlInt(seleccionado)+ ' or ';
  strqry := strqry + ' tr_fechabaja is null) ';

  sXml := '';
  sXml:= CrearXml2('TIPOSENTENCIA','SENTENCIA',strqry);
  result := sXml;
  //LogMessage('ObtenerTipoResultadoSentencia - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerTipoResultadoSentenciaActora(seleccionado : integer): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerTipoResultadoSentenciaActora - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT tr_id, tr_descripcion, tr_etapa '+
    '   FROM legales.ltr_tiporesultadosentencia '+
    '  WHERE tr_etapa LIKE ''%A%'' ' );
  strqry := strqry + ' AND ( ' ;
  if(seleccionado <> -1) then
    strqry := strqry + ' tr_id = '+SqlInt(seleccionado)+ ' or ';
  strqry := strqry + ' tr_fechabaja is null) ';

  sXml := '';
  sXml:= CrearXml2('TIPOSENTENCIA','SENTENCIA',strqry);
  result := sXml;
  //LogMessage('ObtenerTipoResultadoSentenciaActora - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerMasDatosJuicios(nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
  pj_idjuicioentramite: Integer;
begin
  //LogMessage('ObtenerMasDatosJuicios - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  pj_idjuicioentramite:= StrToInt(nrojuicio);
  strqry:= (
    ' SELECT ljz_juzgado.jz_descripcion, lju_jurisdiccion.ju_descripcion, '+
    '        ljz_juzgado.jz_direccion, ljz_juzgado.jz_telefono, '+
    '        lfu_fuero.fu_descripcion, lsc_secretaria.sc_descripcion, '+
    '        ljz_juzgado.jz_fax, ljz_juzgado.jz_email'+
    '   FROM legales.ljt_juicioentramite a, '+
    '        legales.lju_jurisdiccion, '+
    '        legales.ljz_juzgado, '+
    '        legales.lfu_fuero, '+
    '        legales.lsc_secretaria '+
    '  WHERE lju_jurisdiccion.ju_id = a.jt_idjurisdiccion '+
    '    AND ljz_juzgado.jz_id = a.jt_idjuzgado '+
    '    AND lfu_fuero.fu_id = a.jt_idfuero '+
    '    AND lsc_secretaria.sc_id = a.jt_idsecretaria '+
    '    AND a.jt_id = '+ SqlInt(pj_idjuicioentramite) );
  sXml := '';
  sXml := CrearXml1('MASDATOSJUICIOS',strqry);
  result := sXml;
  //LogMessage('ObtenerMasDatosJuicios - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerInstancias(pj_idjuicioentramite:String):WideString;
var
  strqry, sXml: WideString;
  aux_idjuicioentramite: Integer;
begin
  //LogMessage('ObtenerInstancias - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  aux_idjuicioentramite:= StrToInt(pj_idjuicioentramite);
  strqry:= (
    ' SELECT   lju_jurisdiccion.ju_descripcion, lfu_fuero.fu_descripcion, '+
    '          ljz_juzgado.jz_descripcion, lsc_secretaria.sc_descripcion, '+
    '          lin_instancia.in_descripcion, lmc_motivocambiojuzgado.mc_descripcion, '+
    '          a.ij_id, a.ij_idjuicioentramite, a.ij_orden, a.ij_idjurisdiccion, '+
    '          a.ij_idfuero, a.ij_idjuzgado, a.ij_idsecretaria, a.ij_idinstancia, '+
    '          nvl2(ij_nroexpediente,ij_nroexpediente || ''/''|| ij_anioexpediente,'''') ij_expediente, a.ij_fechatraspaso, a.ij_fecharecepsentencia, '+
    '          a.ij_idmotivocambiojuzgado, a.ij_observaciones, a.ij_fechasentencia, '+
    '          a.ij_idtiporesultadosentencia, '+
    '          NVL '+
    '           ((SELECT SUM (ir_importesentencia) '+
    '               FROM legales.lir_importesreguladosjuicio '+
    '              WHERE ir_idjuicioentramite = a.ij_idjuicioentramite '+
    '                AND ir_idinstancia = a.ij_id '+
    '           AND ir_aplicacion = ''H'' '+
    '           AND ir_fechabaja IS NULL), '+
    '            0 '+
    '            ) ij_importehonorarios, '+
    '          NVL ((SELECT SUM (ir_importesentencia) '+
    '                  FROM legales.lir_importesreguladosjuicio '+
    '                 WHERE ir_idjuicioentramite = a.ij_idjuicioentramite '+
    '                   AND ir_idinstancia = a.ij_id '+
    '                   AND ir_fechabaja IS NULL), '+
    '               0 '+
    '               ) ij_importesentencia, '+
    '          NVL '+
    '           ((SELECT SUM (ir_importesentencia) '+
    '               FROM legales.lir_importesreguladosjuicio '+
    '              WHERE ir_idjuicioentramite = a.ij_idjuicioentramite '+
    '                AND ir_idinstancia = a.ij_id '+
    '                AND ir_aplicacion = ''I'' '+
    '                AND ir_fechabaja IS NULL), '+
    '            0 '+
    '            ) ij_interesessentencia, '+
    '          NVL ((SELECT SUM (ir_importesentencia) '+
    '                  FROM legales.lir_importesreguladosjuicio '+
    '                 WHERE ir_idjuicioentramite = a.ij_idjuicioentramite '+
    '                   AND ir_idinstancia = a.ij_id '+
    '                   AND ir_aplicacion = ''C'' '+
    '                   AND ir_fechabaja IS NULL), '+
    '            0 '+
    '            ) ij_importecapital, '+
    '          NVL '+
    '           ((SELECT SUM (ir_importesentencia) '+
    '               FROM legales.lir_importesreguladosjuicio '+
    '              WHERE ir_idjuicioentramite = a.ij_idjuicioentramite '+
    '                AND ir_idinstancia = a.ij_id '+
    '                AND ir_aplicacion = ''T'' '+
    '                AND ir_fechabaja IS NULL), '+
    '            0 '+
    '            ) ij_importetasajusticia, '+
    '          lmc_motivocambiojuzgado.mc_relacionnuevojuzgado, '+
    '          weblegales.get_tiposentencia '+
    '                        (a.ij_idtiporesultadosentencia) '+
    '                                                       AS tiposentencia '+
    '     FROM legales.lij_instanciajuicioentramite a, '+
    '          legales.lmc_motivocambiojuzgado, '+
    '          legales.lju_jurisdiccion, '+
    '          legales.ljz_juzgado, '+
    '          legales.lfu_fuero, '+
    '          legales.lin_instancia, '+
    '          legales.lsc_secretaria '+
    '    WHERE lmc_motivocambiojuzgado.mc_id = a.ij_idmotivocambiojuzgado '+
    '      AND lju_jurisdiccion.ju_id = a.ij_idjurisdiccion '+
    '      AND ljz_juzgado.jz_id = a.ij_idjuzgado '+
    '      AND lfu_fuero.fu_id = a.ij_idfuero '+
    '      AND lin_instancia.in_id = a.ij_idinstancia '+
    '      AND lsc_secretaria.sc_id = a.ij_idsecretaria '+
    '      AND a.ij_idjuicioentramite = '+SqlInt(aux_idjuicioentramite)+
    ' ORDER BY ij_id DESC ');

  sXml := '';
  sXml := CrearXmlTabla('INSTANCIAS','dtsInstancias','http://www.changeme.now/dtsInstancias.xsd',strqry);
  result:= sXml;
  //LogMessage('ObtenerInstancias - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerImporte(pj_idjuicioentramite, instancia:String; pag: integer):WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerImporte - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT ir_id, ir_importe, ir_detalle, ir_idjuicioentramite, ir_detalleweb, '+
    '        DECODE (ir_aplicacion,     '+
    '                ''H'', ''Honorarios'', '+
    '                ''I'', ''Intereses'',  '+
    '                ''T'', ''Tasas''   '+
    '               ) ir_aplicacion,    '+
    '        ir_importesentencia, ir_nropago '+
    '   FROM legales.lir_importesreguladosjuicio irj '+
    '  WHERE irj.ir_idjuicioentramite = '+SqlValue(pj_idjuicioentramite)+
    '    AND irj.ir_idinstancia = '+ SqlValue(instancia)+
    '    AND irj.ir_fechabaja IS NULL '+
    '    AND not ir_aplicacion = ''C'' '+
    '    AND not ir_aplicacion = ''S'' '+
    '    AND irj.ir_carga = ''W'' ');
  sXml := '';
  sXml:=CrearXmlTabla('IMPORTES','dtsImportes', 'http://www.changeme.now/dtsImportes.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerImporte - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerInstanciaParaSentencia(pj_idjuicioentramite:String):WideString;
var
  strqry, sXml: WideString;
  aux_idjuicioentramite: Integer;
begin
  //LogMessage('ObtenerInstanciaParaSentencia - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  aux_idjuicioentramite:= StrToInt(pj_idjuicioentramite);
  strqry:= (
    '   SELECT   ij_id, art.weblegales.get_tiposentencia(ij_idtiporesultadosentencia) AS tiposentencia '+
    '     FROM legales.lij_instanciajuicioentramite '+
    '    WHERE ij_idjuicioentramite = '+SqlValue(aux_idjuicioentramite)+
    ' ORDER BY ij_id DESC ' );
  sXml := '';
  sXml := CrearXml2('INSTANCIAS','INSTANCIA',strqry);
  result:= sXml;
  //LogMessage('ObtenerInstanciaParaSentencia - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerListaJuiciosEnTramite(pag, idusuario :Integer; caratula,nrocarpeta, nombreabo, nroexpediente, tipoJuicio :String): WideString;
var
  strqry, sXml: WideString;
  aux: Integer;
begin
  //LogMessage('ObtenerListaJuiciosEnTramite - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT jt_id, DECODE(jt_idestado, 2, ''T'', '''') estado, '+
    '        NVL2(jt_nroexpediente, jt_nroexpediente || ''/'' || jt_anioexpediente, '''') jt_expediente, jt_numerocarpeta, '+
    '        NVL(jt_demandante, '''') || '' C/ '' || NVL(jt_demandado, '''') || '' '' || jt_caratula AS descripcaratula '+
    '   FROM legales.ljt_juicioentramite, legales.lnu_nivelusuario '+
    '  WHERE (   jt_idabogado = nu_idabogado '+
    '         OR nu_usuariogenerico = ''S'') '+
    '    AND jt_fechabaja IS NULL '+
    '    AND nu_id = '+SqlValue(idusuario)+
    '    AND jt_estadomediacion = ''J'' '+
    '    AND NVL(jt_bloqueado, ''N'') = ''N'' ';

  if NroCarpeta <> '' then
  begin
    aux:=StrToInt(NroCarpeta);
    strqry:=strqry + ' AND jt_numerocarpeta = '+ SqlInt(aux);
  end;
  if Caratula <> ''  then
    strqry:=strqry +  ' AND NVL(jt_demandante, '''') || '' C/ '' || NVL(jt_demandado, '''') ' +
           ' || '' '' || jt_caratula LIKE  '''' || ''%'' || UPPER('+ SqlValue(caratula) +') || ''%'' ';
  if nroexpediente <> ''  then
    strqry:=strqry +  ' AND JT_EXPEDIENTE = '+SqlValue(nroexpediente) ;
  if tipoJuicio <> ''then
    strqry:=strqry +  ' AND JT_IDTIPO = '+SqlValue(tipoJuicio) ;

  strqry:=strqry +  ' ORDER BY jt_numerocarpeta ';

  sXml := '';
  sXml := CrearXmlTabla('LJT_JUICIOENTRAMITE','dtsJuicios','http://www.changeme.now/dtsJuicios.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerListaJuiciosEnTramite - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerListaJuiciosEnTramiteParteActora(pag:Integer; nombre, caratula,nrocarpeta, nombreabo, nroexpediente, tipoJuicio :String): WideString;
var
  strqry, sXml: WideString;
  aux: Integer;
begin
  //LogMessage('ObtenerListaJuiciosEnTramiteParteActora - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT ljt_juicioentramite.jt_id, ljt_juicioentramite.jt_idjurisdiccion, lju_jurisdiccion.ju_descripcion, ' +
    '            ljt_juicioentramite.jt_idfuero, lfu_fuero.fu_descripcion, ljt_juicioentramite.jt_idjuzgado, ljz_juzgado.jz_descripcion, ' +
    '            ljt_juicioentramite.jt_idsecretaria, lsc_secretaria.sc_descripcion, ljz_juzgado.jz_idinstancia, ' +
    '            lin_instancia.in_descripcion, ljt_juicioentramite.jt_idestado, lej_estadojuicio.ej_descripcion, ' +
    '            ljt_juicioentramite.jt_idabogado, lbo_abogado.bo_nombre, ljt_juicioentramite.jt_caratula, ' +
    '            ljt_juicioentramite.jt_fechainijuicio, ljt_juicioentramite.jt_registracion, ljt_juicioentramite.jt_idtipo, ' +
    '            ljt_juicioentramite.jt_fechafinjuicio, ljt_juicioentramite.jt_resultado, ljt_juicioentramite.jt_expediente, ' +
    '            ljt_juicioentramite.jt_fechaasign, ljt_juicioentramite.jt_descripcion, ljt_juicioentramite.jt_fechaalta, ' +
    '            ljt_juicioentramite.jt_usualta, ljt_juicioentramite.jt_fechamodif, ljt_juicioentramite.jt_usumodif, ' +
    '            ljt_juicioentramite.jt_fechabaja, ljt_juicioentramite.jt_usubaja, ljt_juicioentramite.jt_numerocarpeta, ' +
    '            ljt_juicioentramite.jt_estadomediacion, ' +
    '            NVL(ljt_juicioentramite.jt_demandante, '''') || '' C/ '' || NVL(ljt_juicioentramite.jt_demandado, '''') ' +
    '            || '' '' || ljt_juicioentramite.jt_caratula AS descripcaratula, ' +
    '            ljt_juicioentramite.jt_demandante, ljt_juicioentramite.jt_demandado, jt_fechanotificacionjuicio ' +
    '   FROM legales.ljz_juzgado, legales.lju_jurisdiccion, legales.lin_instancia, '+
    '        legales.lfu_fuero, legales.lsc_secretaria, legales.ljt_juicioentramite, '+
    '        legales.lej_estadojuicio, legales.lbo_abogado, legales.lnu_nivelusuario '+
    '  WHERE ljt_juicioentramite.jt_fechabaja IS NULL '+
    '    AND jz_idjurisdiccion = ju_id '+
    '    AND jz_idinstancia = in_id '+
    '    AND jz_idfuero = fu_id '+
    '    AND jz_id = sc_idjuzgado '+
    '    AND jt_idestado = ej_id '+
    '    AND ju_id = jt_idjurisdiccion '+
    '    AND jt_idabogado = bo_id '+
    '    AND fu_id = jt_idfuero '+
    '    AND sc_id = jt_idsecretaria '+
    '    AND (jt_idabogado = nu_idabogado OR nu_usuariogenerico = ''S'') '+
    '    AND upper(NU_USUARIO) = '+SqlValue(UpperCase(nombreabo))+
    '    AND jt_estadomediacion like  ''%A%'' ';
  if NroCarpeta <> '' then
  begin
    aux:=StrToInt(NroCarpeta);
    strqry:=strqry + ' AND ljt_juicioentramite.jt_numerocarpeta = '+ SqlInt(aux);
  end;
  if Caratula <> ''  then
    strqry:=strqry +  ' AND NVL(ljt_juicioentramite.jt_demandante, '''') || '' C/ '' || NVL(ljt_juicioentramite.jt_demandado, '''') ' +
           ' || '' '' || ljt_juicioentramite.jt_caratula LIKE  '''' || ''%'' || UPPER('+ SqlValue(caratula) +') || ''%'' ';
  if nroexpediente <> ''  then
    strqry:=strqry +  ' AND JT_EXPEDIENTE = '+SqlValue(nroexpediente) ;
  if tipoJuicio <> ''then
    strqry:=strqry +  ' AND JT_IDTIPO = '+SqlValue(tipoJuicio) ;

  strqry:=strqry +  ' ORDER BY jt_id ';

  sXml := '';
  sXml := CrearXmlTabla('LJT_JUICIOENTRAMITE','dtsJuicios','http://www.changeme.now/dtsJuicios.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerListaJuiciosEnTramiteParteActora - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerConcursosyQuiebras(pag:Integer; NroOrden, cmbRSocial, Cuil, estudio:String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerConcursosyQuiebras - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT CQ_NROORDEN, CQ_CUIT,EM_NOMBRE, CQ_FECHACONCURSO, CQ_FECHAQUIEBRA '+
    '   FROM AFI.AEM_EMPRESA, ART.LCQ_CONCYQUIEBRA, legales.lbo_abogado '+
    '  WHERE EM_CUIT = CQ_CUIT '+
    '    AND cq_abogado = bo_id '+
    '    AND bo_idestudiojuridico = '+ SqlValue(estudio);
  if NroOrden <> '' then
  begin
    strqry:=strqry + ' AND CQ_NROORDEN = '+ SqlValue(NroOrden);
  end;
  if cmbRSocial <> ''  then
    strqry:=strqry +  ' AND EM_CUIT=' + SqlValue(cmbRSocial);
  if Cuil <> ''  then
    strqry:=strqry +  ' AND CQ_CUIT=' + SqlValue(Cuil);

  sXml := '';
  sXml := CrearXmlTabla('CONCURSO','dtsConcursoyQuiebras','http://www.changeme.now/dtsConcursosyQuiebras.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerConcursosyQuiebras - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerResultado(nrojuicio: String): WideString;
var
  strqry, sXml: WideString;
  nro: Integer;
begin
  //LogMessage('ObtenerResultado - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  nro:= StrToInt(nrojuicio);
  strqry:= (
    ' SELECT jt_resultado '+
    '   FROM legales.ljt_juicioentramite '+
    '  WHERE jt_id = '+ SqlInt(nro) );
  sXml := '';
  sXml := CrearXml1('RESULTADO',strqry);
  result := sXml;
  //LogMessage('ObtenerResultado - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerParam(clave: String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerParam - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT pa_valor '+
    '   FROM legales.lpa_parametro '+
    '  WHERE pa_clave = '+SqlValue(clave) );

  sXml := '';
  sXml := CrearXml1('PARAM',strqry);
  result := sXml;
  //LogMessage('ObtenerParam - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerInstanciaSeleccionada(idjurisdiccion, idfuero, idjuzgado : integer) : WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerInstanciaSeleccionada - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    '   SELECT jz_id AS ID, jz_id AS codigo, jz_descripcion AS descripcion, '+
    '          jz_fechabaja AS baja, jz_idinstancia, in_descripcion, jz_direccion '+
    '     FROM legales.ljz_juzgado, legales.lin_instancia '+
    '    WHERE 1 = 1 '+
    '      AND jz_idjurisdiccion = '+SqlInt(idjurisdiccion)+
    '      AND jz_idfuero = '+ SqlInt(idfuero)+
    '      AND (in_id = jz_idinstancia) '+
    '      AND jz_id = '+ SqlInt(idjuzgado)+
    ' ORDER BY descripcion ');

  sXml := '';
  sXml := CrearXml2('INSTANCIAS','INSTANCIA',strqry);
  result := sXml;
  //LogMessage('ObtenerInstanciaSeleccionada - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerInstanciaaCambiar(nrojuicio : String): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerInstanciaaCambiar - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT jz_idinstancia '+
    '   FROM legales.ljt_juicioentramite, '+
    '        legales.lfu_fuero, '+
    '        legales.ljz_juzgado, '+
    '        legales.lin_instancia '+
    '  WHERE ( (ljt_juicioentramite.jt_idfuero = lfu_fuero.fu_id(+)) '+
    '    AND (ljt_juicioentramite.jt_idjuzgado = ljz_juzgado.jz_id(+)) '+
    '    AND (lin_instancia.in_id(+) = ljz_juzgado.jz_idinstancia) '+
    '        ) '+
    '    AND ljt_juicioentramite.jt_id = '+SqlValue(nrojuicio));

  sXml := '';
  sXml := CrearXml2('INSTANCIAS','INSTANCIA',strqry);
  result := sXml;
  //LogMessage('ObtenerInstanciaaCambiar - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerFechadeNotificacion( nrojuicio : string) : WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerFechadeNotificacion - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT jt_fechanotificacionjuicio '+
    '   FROM legales.ljt_juicioentramite '+
    '  WHERE jt_id = '+SqlValue(nrojuicio));

  sXml := '';
  sXml := CrearXml1('FECHA',strqry);
  result := sXml;
  //LogMessage('ObtenerFechadeNotificacion - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerInstanciaModificar(nroinstancia : integer): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerInstanciaModificar - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT ij_idjurisdiccion, ju_descripcion, ij_idfuero, fu_descripcion, '+
    '        ij_idjuzgado, jz_descripcion, ij_idsecretaria, sc_descripcion, '+
    '        ij_idmotivocambiojuzgado, mc_descripcion, ij_fechatraspaso, ij_observaciones, '+
    '        ij_nroexpediente,ij_anioexpediente, in_descripcion '+
    '   FROM legales.lij_instanciajuicioentramite, '+
    '        legales.lin_instancia, '+
    '        legales.lfu_fuero, '+
    '        legales.ljz_juzgado, '+
    '        legales.lju_jurisdiccion, '+
    '        legales.lmc_motivocambiojuzgado, '+
    '        legales.lsc_secretaria '+
    '  WHERE in_id = ij_idinstancia '+
    '    AND ij_idfuero = fu_id '+
    '    AND ij_idjuzgado = jz_id '+
    '    AND ij_idjurisdiccion = ju_id '+
    '    AND ij_idsecretaria = sc_id '+
    '    AND ij_idmotivocambiojuzgado = mc_id '+
    '    AND ij_id = '+ SqlInt(nroinstancia));

  sXml := '';
  sXml := CrearXml2('INSTANCIAS','INSTANCIA',strqry);
  result := sXml;
  //LogMessage('ObtenerInstanciaModificar - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerEstadoMediacion(NroJuicio : string): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerEstadoMediacion - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT jt_estadomediacion '+
    '   FROM legales.ljt_juicioentramite '+
    '  WHERE jt_id= '+SqlValue(NroJuicio));

  sXml := '';
  sXml := CrearXml2('ESTADOS','ESTADO',strqry);
  result := sXml;
  //LogMessage('ObtenerEstadoMediacion - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerNivelUsuario(txtUsuario,txtCont : string): WideString;
var
  strqry, sXml: WideString;
begin
  LogMessage('ObtenerNivelUsuario - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  try
      strqry:= (
      ' SELECT nu_id, bo_idestudiojuridico, nu_forzarclave, nu_usuario, ej_nombreestudio, BO_NOMBRE'+
      '   FROM legales.lnu_nivelusuario, legales.lbo_abogado, legales.lej_estudiojuridico '+
      '  WHERE nu_usuario = upper('+SqlValue(txtUsuario)+')'+
      '    AND nu_claveweb = '+SqlValue(txtCont) +
      '    AND nu_idabogado = bo_id '+
      '    AND bo_idestudiojuridico = ej_id');

    sXml := '';
    sXml:= CrearXml1('USUARIO',strqry);
    result := sXml;
    LogMessage('ObtenerNivelUsuario - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  except
    on E: Exception do
    begin
      LogMessage('ObtenerNivelUsuario - Excepcion - '+e.message,EVENTLOG_ERROR_TYPE,0,0);
      raise Exception.Create('Error: ' + e.message);
    end;
  end;
end;

function TSyncSrv.ObtenerAplicaciones(idUsuario: string): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerAplicaciones - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT um_idmenuweb '+
    '   FROM legales.lum_usuariomenu '+
    '  WHERE um_idusuario = '+SqlValue(idUsuario));

  sXml := '';
  sXml:= CrearXml2('APLICACIONES', 'APLICACION',strqry);
  result := sXml;
  //LogMessage('ObtenerAplicaciones - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerDatosUsuario(nrousuario : string): WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('ObtenerDatosUsuario - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT nu_usuario, nu_claveweb, nu_forzarclave '+
    '   FROM legales.lnu_nivelusuario '+
    '  WHERE nu_usuario ='+ SqlValue(nrousuario));

  sXml := '';
  sXml := CrearXml1('USUARIO',strqry);
  result := sXml;
  //LogMessage('ObtenerDatosUsuario - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerValidacionFechaAcuerdo(fechavenc, nroorden : string): WideString;
var
  strqry, sXml: WideString;
  format :TFormatSettings;
begin
  //LogMessage('ObtenerValidacionFechaAcuerdo - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  format.DateSeparator := '/';
  format.ShortDateFormat := 'd/m/y';

  strqry:= (
    ' SELECT distinct ca_nroorden '+
    '   FROM lca_acuerdocyq '+
    '  WHERE ca_nroorden = '+ SqlValue(nroorden)+
    '    AND '+SqlDate(strtodatedef(fechavenc,0,format))+' IN (SELECT ca_fechavenc '+
    '                                     FROM lca_acuerdocyq '+
    '                                    WHERE ca_nroorden = '+ SqlValue(nroorden)+
    '                                      AND ca_nropago >0 )');

  sXml := '';
  sXml := CrearXml1('ACUERDO',strqry);
  result := sXml;
  //LogMessage('ObtenerValidacionFechaAcuerdo - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerValidacionFechaAcuerdoModif(fechavenc, nroorden, nropago: string): WideString;
var
  strqry, sXml: WideString;
  format :TFormatSettings;
begin
  //LogMessage('ObtenerValidacionFechaAcuerdoModif - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  format.DateSeparator := '/';
  format.ShortDateFormat := 'd/m/y';

  strqry:= (
    ' SELECT distinct ca_nroorden '+
    '   FROM lca_acuerdocyq '+
    '  WHERE ca_nroorden = '+ SqlValue(nroorden)+
    '    AND '+SqlDate(strtodatedef(fechavenc,0,format))+' IN (SELECT ca_fechavenc '+
    '                                     FROM lca_acuerdocyq '+
    '                                    WHERE ca_nroorden = '+ SqlValue(nroorden)+
    '                                      AND ca_nropago >0 '+
    '                                      AND ca_nropago <>'+SqlValue(nropago)+')');

  sXml := '';
  sXml := CrearXml1('ACUERDO',strqry);
  result := sXml;
  //LogMessage('ObtenerValidacionFechaAcuerdoModif - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerValidacionFechaCuotas(fechavenc,cantcuotas,tiempo, nroorden: string): WideString;
var
  strqry, sXml: WideString;
  format :TFormatSettings;
begin
  //LogMessage('ObtenerValidacionFechaCuotas - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  format.DateSeparator := '/';
  format.ShortDateFormat := 'd/m/y';

  strqry:= (
    ' SELECT art.legales.do_validar_cuotas('+
             SqlDate(strtodatedef(fechavenc,0,format))+', '+
             SqlValue(cantcuotas)+', '+
             SqlValue(tiempo)+', '+
             SqlValue(nroorden)+') valor'+
    '   FROM dual ');

  sXml := '';
  sXml := CrearXml1('CUOTA',strqry);
  result := sXml;
  //LogMessage('ObtenerValidacionFechaCuotas - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarDesignaciones() :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarDesignaciones - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT tb_codigo, tb_descripcion '+
    '   FROM art.ctb_tablas '+
    '  WHERE tb_clave = ''PARTO'' '+
    '  ORDER BY tb_descripcion ');

  sXml := '';
  sXml := CrearXml2('DESIGNACIONES','DESIGNACION',strqry);
  result := sXml;
  //LogMessage('CargarDesignaciones - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarRSocial(texto : string ) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarRSocial - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT EM_CUIT, EM_NOMBRE '+
    '   FROM AFI.AEM_EMPRESA '+
    '  WHERE EM_NOMBRE like upper(''%'+texto+'%'')'+
    ' ORDER BY EM_NOMBRE');

  sXml := '';
  sXml := CrearXml2('RASOCIAL','RSOCIAL',strqry);
  result := sXml;
  //LogMessage('CargarRSocial - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarJurisdiccion(idjurisdiccion : Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarJurisdiccion - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    '   SELECT ju_id, ju_descripcion, ju_fechabaja '+
    '     FROM legales.lju_jurisdiccion '+
    '    WHERE ju_fechabaja is null OR ju_id = '+ SqlValue(idjurisdiccion)+
    ' ORDER BY ju_descripcion '
  );

  sXml := '';
  sXml := CrearXml2('JURISDICCIONES','JURISDICCION',strqry);
  result := sXml;
  //LogMessage('CargarJurisdiccion - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarTipoFiltro() :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarTipoFiltro - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    'SELECT tb_codigo, tb_descripcion '+
    '  FROM ctb_tablas '+
    ' WHERE tb_fechabaja IS NULL '+
    '   AND tb_clave = ''TACYQ'' '+
    '   AND (tb_especial1 = ''Q'' OR tb_especial1 = ''C'') '+
    ' ORDER BY tb_descripcion ');

  sXml := '';
  sXml := CrearXml2('TIPOS','TIPO',strqry);
  result := sXml;
  //LogMessage('CargarTipoFiltro - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarTipo(concurso : Boolean; value : String) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarTipo - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    'SELECT tb_codigo, tb_descripcion '+
    '  FROM ctb_tablas '+
    ' WHERE tb_fechabaja IS NULL '+
    '   AND tb_clave = ''TACYQ'' ');

  if concurso then
    strqry := strqry + '   AND( tb_especial1 = ''C'' '
  else
    strqry := strqry + '   AND( tb_especial1 = ''Q'' ';
  if (value <> '') then
    strqry := strqry + '   OR tb_codigo = ' +SqlValue(value) +' ) '
  else
    strqry := strqry + ' ) ';

  strqry := strqry + ' ORDER BY tb_descripcion ';
  sXml := '';
  sXml := CrearXml2('TIPOS','TIPO',strqry);
  result := sXml;
  //LogMessage('CargarTipo - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarMotivo() :WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  i: Integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('CargarMotivo - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery(
      ' SELECT mc_id, mc_descripcion, mc_relacionnuevojuzgado '+
      '   FROM legales.lmc_motivocambiojuzgado '+
      '  WHERE mc_fechabaja IS NULL AND mc_id > 1 AND mc_etapa LIKE ''%J%'' '+
      ' ORDER BY mc_descripcion ');

    //LogMessage('CargarMotivo - Query ' + qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);

    sXml := '';
    sXml := sXml + '<MOTIVOS>';
    while not qry.Eof do
    begin
      sXml := sXml+ '<MOTIVO>';
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+qry.Fields[i].AsString+'</'+qry.Fields[i].FieldName+'>';
      end;
      qry.Next;
      sXml := sXml+ '</MOTIVO>';
    end;
    sXml := sXml + '</MOTIVOS>';
    //LogMessage('CargarMotivo - Finalizo ' + qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;
    //LogMessage('CargarMotivo - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.CargarFuero(jurisdiccion: integer; idfuero: Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarFuero - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT fu_id, fu_descripcion, fu_fechabaja '+
    '   FROM legales.lfu_fuero '+
    '   WHERE (fu_fechabaja IS NULL OR fu_id = '+SqlValue(idfuero)+')'+
    '     AND fu_id IN (SELECT jz_idfuero '+
    '                     FROM legales.ljz_juzgado '+
    '                    WHERE jz_idjurisdiccion = '+ SqlValue(jurisdiccion)+')'+
    ' ORDER BY fu_descripcion';

  //LogMessage('CargarFuero - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('FUEROS','FUERO',strqry);
  result := sXml;
  //LogMessage('CargarFuero - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarFueroCYQ() :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarFueroCYQ - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT tb_codigo, tb_descripcion '+
    '   FROM ctb_tablas '+
    '  WHERE tb_especial1 IS NOT NULL '+
    '    AND tb_codigo <> ''0'' '+
    '    AND tb_fechabaja IS NULL '+
    '    AND tb_clave = ''FUERO'' '+
    'ORDER BY tb_descripcion ' );
  //LogMessage('CargarFueroCYQ - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('FUEROS','FUERO',strqry);
  result := sXml;
  //LogMessage('CargarFueroCYQ - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarJurisdiccionCYQ() :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarJurisdiccionCYQ - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT tb_codigo, tb_descripcion'+
    '   FROM ctb_tablas '+
    '  WHERE tb_codigo <> ''0'' AND tb_fechabaja IS NULL AND tb_clave = ''JURIS'' '+
    ' ORDER BY tb_descripcion');
  //LogMessage('CargarJurisdiccionCYQ - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('JURISDICCIONES','JURISDICCION',strqry);
  result := sXml;
  //LogMessage('CargarJurisdiccionCYQ - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarJuzgado(jurisdiccion,fuero: integer; idJuzgado: Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarJuzgado - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT jz_id, jz_descripcion '+
    '   FROM legales.ljz_juzgado '+
    '  WHERE (jz_fechabaja IS NULL OR jz_id = '+SqlValue(idJuzgado)+' )'+
    '    AND jz_idjurisdiccion = '+ SqlValue(jurisdiccion)+
    '    AND jz_idfuero = '+ SqlValue(fuero)+
    ' ORDER BY jz_descripcion';
  //LogMessage('CargarJuzgado - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('JUZGADOS','JUZGADO',strqry);
  result := sXml;
  //LogMessage('CargarJuzgado - Finalizado',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarSecretaria(juzgado: integer; idSecretaria: Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarSecretaria - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT sc_id, sc_descripcion '+
    '   FROM legales.lsc_secretaria '+
    '  WHERE (sc_fechabaja IS NULL OR sc_id = '+SqlValue(idSecretaria)+')'+
    '    AND sc_idjuzgado = '+ SqlValue(juzgado)+
    ' ORDER BY sc_descripcion ';
  //LogMessage('CargarSecretaria - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('SECRETARIAS','SECRETARIA',strqry);
  result := sXml;
  //LogMessage('CargarSecretaria - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarEstado(seleccionado : Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarEstado - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT ej_id, ej_descripcion '+
    '   FROM legales.lej_estadojuicio '+
    '  WHERE ej_etapa LIKE ''%J%'' '+
    '    AND EJ_ACTIVOWEB = ''S'' ');
  strqry := strqry+ ' AND ( ';
  if(seleccionado <> -1) then
      strqry := strqry + 'ej_id = '+SqlInt(seleccionado)+' OR ';
  strqry:= strqry + 'ej_fechabaja IS NULL) ';
  strqry := strqry + ' ORDER BY ej_descripcion ';
  //LogMessage('CargarEstado - Query - ' + strqry, EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('ESTADOS','ESTADO',strqry);
  Result := sXml;
  //LogMessage('CargarEstado - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarEstadoParteActora(seleccionado : Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarEstadoParteActora - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT ej_id, ej_descripcion '+
    '   FROM legales.lej_estadojuicio '+
    '  WHERE ej_etapa LIKE ''%A%'' '+
    '    AND EJ_ACTIVOWEB = ''S'' ');
  strqry := strqry+ ' AND ( ';
  if(seleccionado <> -1) then
      strqry := strqry + 'ej_id = '+SqlInt(seleccionado)+' OR ';
  strqry:= strqry + 'ej_fechabaja IS NULL) ';
  strqry := strqry + ' ORDER BY ej_descripcion ';
  //LogMessage('CargarEstadoParteActora - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('ESTADOS','ESTADO',strqry);
  Result := sXml;
  //LogMessage('CargarEstadoParteActora - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarPeritos(peritodesignacion,filtro: string) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarPeritos - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT pe_id, pe_nombre '+
    '   FROM legales.lpe_perito ';
  if(peritodesignacion <> '') then
    strqry:= strqry + ' WHERE PE_PARTEOFICIO = '+ SqlValue(peritodesignacion);
  if(filtro <>'') then
    strqry:= strqry + ' AND PE_NOMBRE like upper(''%'+filtro+'%'')';
  strqry:=strqry + ' ORDER BY pe_nombre ';
  //LogMessage('CargarPeritos - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('PERITOS','PERITO',strqry);
  Result := sXml;
  //LogMessage('CargarPeritos - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarMedidasCautelares(seleccionado : Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarMedidasCautelares - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT TM_ID, TM_DESCRIPCION '+
    '   FROM legales.LTM_TIPOMEDIDAS ');
  strqry := strqry+ ' WHERE ( ';
  if(seleccionado <> -1) then
      strqry := strqry + 'TM_ID = '+SqlInt(seleccionado)+' OR ';
  strqry:= strqry + 'TM_FECHABAJA IS NULL) ';
  strqry:= strqry + ' ORDER BY TM_DESCRIPCION ';
  //LogMessage('CargarMedidasCautelares - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  sXml := '';
  sXml := CrearXml2('MEDIDASCAUTELARES','MEDIDACAUTELAR',strqry);
  Result :=sXml;
  //LogMessage('CargarMedidasCautelares - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarEventos(seleccionado : Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarEventos - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT te_id, te_descripcion '+
    '   FROM legales.lte_tipoevento ');
  strqry := strqry+ ' WHERE ( ';
  if(seleccionado <> -1) then
      strqry := strqry + 'te_id = '+SqlInt(seleccionado)+' OR ';
  strqry:= strqry + ' te_fechabaja IS NULL) ';
  strqry:= strqry + ' AND ( te_id = '+SqlInt(seleccionado)+'OR te_visibleweb = ''S'') ';
  strqry:= strqry + ' AND TE_ETAPA like ''%J%'' AND TE_ID <> 1 ';
  strqry := strqry + ' ORDER BY te_descripcion ';
  //LogMessage('CargarEventos - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  sXml := '';
  sXml := CrearXml2('EVENTOS','EVENTO',strqry);
  Result :=sXml;
  //LogMessage('CargarEventos - Finalizar',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarEventosActora(seleccionado : Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarEventosActora - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT te_id, te_descripcion '+
    '   FROM legales.lte_tipoevento ');
  strqry := strqry+ ' WHERE ( ';
  if(seleccionado <> -1) then
      strqry := strqry + 'te_id = '+SqlInt(seleccionado)+' OR ';
  strqry:= strqry + 'te_fechabaja IS NULL)  ';
  strqry:= strqry + ' AND TE_ETAPA like ''%A%'' AND TE_ID <> 1';
  strqry := strqry + ' ORDER BY te_descripcion ';
  //LogMessage('CargarEventosActora - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('EVENTOS','EVENTO',strqry);
  Result :=sXml;
  //LogMessage('CargarEventosActora - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarTipoJuicio(seleccionado : Integer) :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarTipoJuicio - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    ' SELECT tj_id, tj_descripcion '+
    '   FROM legales.ltj_tipojuicio ');
  strqry := strqry+ ' WHERE ( ';
  if(seleccionado <> -1) then
      strqry := strqry + 'tj_id = '+SqlInt(seleccionado)+' OR ';
  strqry:= strqry + 'tj_fechabaja IS NULL) ';
  strqry:= strqry + ' ORDER BY tj_descripcion ';
  //LogMessage('CargarTipoJuicio - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('JUICIOS','JUICIO',strqry);
  Result :=sXml;
  //LogMessage('CargarTipoJuicio - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarTipoPericia: WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarTipoPericia - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    '   SELECT tp_id, tp_descripcion '+
    '     FROM legales.ltp_tipopericia '+
    '    WHERE tp_fechabaja IS NULL '+
    ' ORDER BY tp_descripcion ');
  //LogMessage('CargarTipoPericia - Query - ' + strqry, EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('TIPOSPERICIAS','TIPOPERICIA',strqry);
  Result :=sXml;
  //LogMessage('CargarTipoPericia - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CargarEventosCYQ() :WideString;
var
  strqry, sXml: WideString;
begin
  //LogMessage('CargarEventosCYQ - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:= (
    '   SELECT tb_codigo, tb_descripcion '+
    '     FROM ctb_tablas '+
    '    WHERE tb_codigo <> ''0'' AND tb_fechabaja IS NULL AND tb_clave = ''EVCYQ'' '+
    ' ORDER BY tb_descripcion ');
  //LogMessage('CargarEventosCYQ - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

  sXml := '';
  sXml := CrearXml2('EVENTOSCYQ','EVENTOCYQ',strqry);
  Result :=sXml;
  //LogMessage('CargarEventosCYQ - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.CrearXml1(param,consulta :string): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  i: Integer;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('CrearXml1 - Inicio - ' + consulta,EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  qry:=dmConn.GetQuery(consulta);
  //LogMessage('CrearXml1 - Query - ' + consulta,EVENTLOG_INFORMATION_TYPE,0,0);
  sXml := '';
  try
    sXml := sXml + '<'+param+'>';
    while not qry.Eof do
    begin
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
        begin
          auxString := qry.Fields[i].AsString;
          ReplaceString(auxString,'&','&amp;');
          ReplaceString(auxString,'<','&lt;');
          ReplaceString(auxString,'>','&gt;');
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
        end;
      end;
      qry.Next;
    end;
    sXml := sXml + '</'+param+'>';
    //LogMessage('CrearXml1 - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.free;
    //LogMessage('CrearXml1 - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.CrearXmlTabla(param2,tabla,direccion,consulta :string; pag :integer = 0): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  i, y, x: Integer;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('CrearXmlTabla - Inicio - ' + consulta,EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  qry:=dmConn.GetQuery(consulta);
  //LogMessage('CrearXmlTabla - Query - ' + consulta,EVENTLOG_INFORMATION_TYPE,0,0);
  sXml := '';
  x:=0;
  try
    sXml := sXml + '<'+tabla+' xmlns="'+direccion+'">';
    if pag<>0 then
    begin
    y:=0;
      while not qry.Eof and (y<pag*9) do
      begin
        qry.Next;
        y:=y+1;
      end;
    end;
    while not qry.Eof and (x<9) do
    begin
      sXml := sXml+ '<'+param2+'>';
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
        begin
          auxString := qry.Fields[i].AsString;
          ReplaceString(auxString,'&','&amp;');
          ReplaceString(auxString,'<','&lt;');
          ReplaceString(auxString,'>','&gt;');
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
        end;
      end;
      qry.Next;
      sXml := sXml+ '</'+param2+'>';
      x:=x+1;
    end;
    sXml := sXml + '</'+tabla+'>';
   //LogMessage('CrearXmlTabla - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.Free;
    //LogMessage('CrearXmlTabla - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.CrearXml2(param, param2, consulta:string): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  i: Integer;
  auxString : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('CrearXml2 - Inicio - ' + consulta,EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);

  qry:=dmConn.GetQuery(consulta);
  //LogMessage('CrearXml2 - Query - ' + consulta,EVENTLOG_INFORMATION_TYPE,0,0);
  sXml := '';
  try
    sXml := sXml + '<'+param+'>';
    while not qry.Eof do
    begin
      sXml := sXml+ '<'+param2+'>';
      for i:=0 to qry.Fields.Count - 1 do
      begin
        if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
          if  not (qry.Fields[i].AsString = '')   then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
        else
        begin
          auxString := qry.Fields[i].AsString;
          ReplaceString(auxString,'&','&amp;');
          ReplaceString(auxString,'<','&lt;');
          ReplaceString(auxString,'>','&gt;');
          sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+auxString+'</'+qry.Fields[i].FieldName+'>';
        end;
      end;
      qry.Next;
      sXml := sXml+ '</'+param2+'>';
    end;
    sXml := sXml + '</'+param+'>';
    //LogMessage('CrearXml2 - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    qry.free;
    result:= sXml;
    dmConn.Free;
    //LogMessage('CrearXml2 - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ValidarModificacionReclamo(id_reclamo, instancia :string ): integer;
var
 NroPago: integer;
 dmConn: TdmPrincipal;
begin
  //LogMessage('ValidarModificacionReclamo - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    NroPago := dmConn.ValorSqlInteger('SELECT ir_nropago FROM legales.lir_importesreguladosjuicio ' +
                               'WHERE ir_idreclamojuicioentramite = ' +
                                      SqlValue(id_reclamo) +
                               '  AND ir_idinstancia = ' + SqlValue(instancia));
    result:= NroPago;
    //LogMessage('ValidarModificacionReclamo - Finalizo - ' + instancia,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('ValidarModificacionReclamo - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ValidarModificacionimporte(id_importe :string ):integer;
var
 NroPago: integer;
 dmConn: TdmPrincipal;
begin
  //LogMessage('ValidarModificacionimporte - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    NroPago := dmConn.ValorSqlInteger(' SELECT ir_nropago '+
                               '   FROM legales.lir_importesreguladosjuicio irj '+
                               '  WHERE ir_id = ' + SqlValue(id_importe));
    result:= NroPago;
    //LogMessage('ValidarModificacionimporte - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('ValidarModificacionimporte - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateSentencia(txtfechasentencia,txtfecharecep :TDateTime ; jt_sentencia, cmbsentencia,  usuario, jt_id, txtimportehonorarios, txtimporteintereses, txtimportetasajusticia,instancia,txtMontoCondena, txtPorcentajeIncapacidad :string);
var
  id, idsentencia :integer;
  //importehonorarios, importeintereses, importetasajusticia : extended;
  importeCondena, porcentajeIncapacidad : Extended;
  sSQL: String;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateSentencia - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(jt_id);
    idsentencia := StrToInt(cmbsentencia);
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    importeCondena := StrToFloatDef(txtMontoCondena, 0, format);
    porcentajeIncapacidad := StrToFloatDef(txtPorcentajeIncapacidad, 0, format);

    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';

    try
      sSQL :=
      ' DECLARE '+
      '   detallesentencia varchar2(32767); '+
      ' BEGIN '+
      '   detallesentencia := :dts; '+
      ' UPDATE legales.ljt_juicioentramite '+
         ' SET jt_idtiporesultadosentencia = '+ SqlInt(idsentencia)+', '+
             ' jt_fechasentencia = '+SqlDate(txtfechasentencia)+', '+
             ' jt_detallesentencia = detallesentencia,'+
             ' JT_MONTOCONDENA = '+ SqlNumber(importeCondena) +', '+
             ' JT_PORCENTAJEINCAPACIDAD = '+ SqlNumber(porcentajeIncapacidad) +', '+
             ' jt_usumodif = '+SqlValue(usuario)+', '+
             ' jt_fechamodif = SYSDATE ,'+
             ' jt_fecharecepsentencia = '+ SqlDate(txtfecharecep)+
       ' WHERE jt_id = '+ SqlInt(id)+';'+
       ' END;' ;
      //LogMessage('UpdateSentencia - Query - ' + sSQL,EVENTLOG_INFORMATION_TYPE,0,0);
      dmConn.EjecutarSqlEx(sSQL,[jt_sentencia]);
      //LogMessage('UpdateSentencia - Corrio - ' + sSQL,EVENTLOG_INFORMATION_TYPE,0,0);

      sSQL :=
      ' DECLARE '+
      '    detallesentencia VARCHAR2(32767); '+
      ' BEGIN '+
      '   detallesentencia := :dts; '+
      ' UPDATE legales.lij_instanciajuicioentramite '+
         ' SET ij_idtiporesultadosentencia = '+ SqlInt(idsentencia)+', '+
             ' ij_fechasentencia = '+SqlDate(txtfechasentencia)+', '+
             ' ij_MONTOCONDENA = '+ SqlNumber(importeCondena) +', '+
             ' ij_PORCENTAJEINCAPACIDAD = '+ SqlNumber(porcentajeIncapacidad) +', '+
             ' ij_usumodif = '+SqlValue(usuario)+', '+
             ' ij_fechamodif = SYSDATE ,'+
             ' ij_detallesentencia = detallesentencia, '+
             ' ij_fecharecepsentencia = '+ SqlDate(txtfecharecep)+
       ' WHERE ij_idjuicioentramite = '+ SqlInt(id)+
       '   AND ij_id = '+SqlValue(instancia)+';'+
       ' END;';

      //LogMessage('UpdateSentencia - Query - ' + sSQL,EVENTLOG_INFORMATION_TYPE,0,0);
      dmConn.EjecutarSqlEx(sSQL,[jt_sentencia]);
      //LogMessage('UpdateSentencia - Corrio - ' + sSQL,EVENTLOG_INFORMATION_TYPE,0,0);
      //LogMessage('UpdateSentencia - Finalizado',EVENTLOG_INFORMATION_TYPE,0,0);
    except
      on e: Exception do
      begin
        LogMessage('UpdateSentencia - Error - ' + e.Message,EVENTLOG_ERROR_TYPE,0,0);
        raise Exception.Create('Error! ' + e.message);
      end;
    end;
  finally
    begin
      dmConn.Free;
      //LogMessage('UpdateSentencia - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
    end;
  end;
end;

procedure TSyncSrv.UpdateSentenciaParteActora(txtfechasentencia :TDateTime ; jt_sentencia, cmbsentencia,  usuario, jt_id, txtimportehonorarios, txtimporteintereses, txtimportetasajusticia,txtImporteCapital,instancia :string);
var
  id, idsentencia :integer;
  importehonorarios, importeintereses, importetasajusticia, importeCapital: extended;
  sSQL: String;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateSentenciaParteActora - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(jt_id);
    idsentencia := StrToInt(cmbsentencia);

    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    importehonorarios := StrToFloatDef(txtimportehonorarios, 0, format);
    importeintereses := StrToFloatDef(txtimporteintereses, 0, format);
    importetasajusticia := StrToFloatDef(txtimportetasajusticia, 0, format);
    importeCapital := StrToFloatDef(txtImporteCapital, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';

    try
      sSQL :=
              ' DECLARE '+
              '   detallesentencia VARCHAR2(32767); '+
              ' BEGIN '+
              ' detallesentencia := :dts; '+
              ' UPDATE legales.ljt_juicioentramite '+
                 ' SET jt_idtiporesultadosentencia = '+ SqlInt(idsentencia)+', '+
                     ' jt_fechasentencia = '+SqlDate(txtfechasentencia)+', '+
                     ' jt_importecapital = '+ SqlNumber(importeCapital) +', '+
                     ' jt_importehonorarios = '+ SqlNumber(importehonorarios) +', '+
                     ' jt_interesessentencia = '+ SqlNumber(importeintereses) +', '+
                     ' jt_importetasajusticia = '+ SqlNumber(importetasajusticia) +', '+
                     ' jt_importesentencia = '+ SqlNumber(importetasajusticia)+
                                            ' + ' + SqlNumber(importeCapital) + ' + '+
                                            SqlNumber(importehonorarios)+ ' + ' +
                                            SqlNumber(importeintereses)+', '+
                     ' jt_usumodif = '+SqlValue(usuario)+', '+
                     ' jt_detallesentencia = detallesentencia,'+
                     ' jt_fechamodif = SYSDATE '+
               ' WHERE jt_id = '+ SqlInt(id)+'; END;';
      //LogMessage('UpdateSentenciaParteActora - Query - ' + sSQL,EVENTLOG_INFORMATION_TYPE,0,0);
      dmConn.EjecutarSqlEx(sSQL,[jt_sentencia]);
      //LogMessage('UpdateSentenciaParteActora - Corrio - ' + sSQL,EVENTLOG_INFORMATION_TYPE,0,0);

      sSQL :=
              ' DECLARE '+
              '   detallesentencia VARCHAR2(32767); '+
              ' BEGIN '+
              '   detallesentencia := :dts; '+
              ' UPDATE legales.lij_instanciajuicioentramite '+
                 ' SET ij_idtiporesultadosentencia = '+ SqlInt(idsentencia)+', '+
                     ' ij_fechasentencia = '+SqlDate(txtfechasentencia)+', '+
                     ' IJ_IMPORTECAPITAL = '+ SqlNumber(importeCapital) +', '+
                     ' ij_importehonorarios = '+ SqlNumber(importehonorarios) +', '+
                     ' ij_interesessentencia = '+ SqlNumber(importeintereses) +', '+
                     ' IJ_IMPORTETASAJUSTICIA = '+ SqlNumber(importetasajusticia) +', '+
                     ' ij_importesentencia = '+ SqlNumber(importetasajusticia)+
                                              ' + ' + SqlNumber(importeCapital) + ' + '+
                                              SqlNumber(importehonorarios)+ ' + ' +
                                              SqlNumber(importeintereses)+', '+
                     ' ij_usumodif = '+SqlValue(usuario)+', '+
                     ' ij_detallesentencia = detallesentencia, '+
                     ' ij_fechamodif = SYSDATE '+
               ' WHERE ij_idjuicioentramite = '+ SqlInt(id)+
               '   AND ij_id = '+SqlValue(instancia)+'; END;';
      //LogMessage('UpdateSentenciaParteActora - Query - ' + sSQL,EVENTLOG_INFORMATION_TYPE,0,0);
      dmConn.EjecutarSqlEx(sSQL,[jt_sentencia]);
      //LogMessage('UpdateSentenciaParteActora - Corrio - ' + sSQL,EVENTLOG_INFORMATION_TYPE,0,0);
      //LogMessage('UpdateSentenciaParteActora - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
    except
    on e: Exception do
      begin
        LogMessage('UpdateSentenciaParteActora - Error - ' + e.Message, EVENTLOG_ERROR_TYPE,0,0);
        raise Exception.Create('Error! ' + e.message);
      end;
    end;
  finally
    begin
      dmConn.Free;
      //LogMessage('UpdateSentenciaParteActora - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
    end;
  end;
end;

procedure TSyncSrv.UpdateInstanciaAbmMod(JuicioEnTramite, Jurisdiccion, Fuero, Juzgado, Secretaria, Instancia, NroExpediente, AnioExpediente, Motivo, Detalle, LoginName, nroInstancia,EstadoMediacion : string; FechaIngreso :TDateTime);
var
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateInstanciaAbmMod - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    dmConn.EjecutarSql(
      ' UPDATE legales.lij_instanciajuicioentramite' +
      '    SET ij_nroexpediente = ' + SqlValue(NroExpediente) + ',' +
      '        ij_anioexpediente = ' + SqlValue(AnioExpediente) + ',' +
      '        ij_fechatraspaso = ' + SqlDate(FechaIngreso) + ',' +
      '        ij_usumodif = ' + SqlValue(LoginName) + ',' +
      '        ij_idjurisdiccion =  ' + SqlValue(Jurisdiccion) + ',' +
      '        ij_idfuero = ' + SqlValue(Fuero) + ',' +
      '        ij_idjuzgado = ' + SqlValue(Juzgado) + ',' +
      '        ij_idsecretaria = ' + SqlValue(Secretaria) + ',' +
      '        ij_observaciones = ' + SqlValue(Detalle) +  ' , ' +
      '        ij_idmotivocambiojuzgado = ' + SqlValue(Motivo) + ', ' +
      '        ij_idinstancia = ' + SqlValue(Instancia) + ', ' +
      '        ij_fechamodif = sysdate' +
      '  WHERE ij_id = ' + SqlValue(nroInstancia));
    //LogMessage('UpdateInstanciaAbmMod - Query',EVENTLOG_INFORMATION_TYPE,0,0);

    dmConn.EjecutarSql(
      ' UPDATE legales.ljt_juicioentramite ' +
      '    SET jt_idjurisdiccion =  ' + SqlValue(Jurisdiccion)  + ', ' +
      '        jt_idfuero = '  + SqlValue(Fuero)  + ', ' +
      '        jt_idjuzgado = ' + SqlValue(Juzgado) + ', ' +
      '        jt_idsecretaria = ' + SqlValue(Secretaria) + ', ' +
      '        jt_nroexpediente = ' + SqlValue(NroExpediente) + ', ' +
      '        jt_anioexpediente = ' + SqlValue(AnioExpediente) + ', ' +
      '        jt_fechaingreso = ' + SqlDate(FechaIngreso) + ', ' +
      '        jt_usumodif = ' + SqlValue(LoginName) + ', ' +
      '        jt_estadomediacion = '+ SqlValue(EstadoMediacion) + ', ' +
      '        jt_fechamodif = Sysdate ' +
      '  WHERE jt_id = ' + SqlValue(JuicioEnTramite));
    //LogMessage('UpdateInstanciaAbmMod - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateInstanciaAbmMod - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateInstanciaJuicio(JuicioEnTramite, Jurisdiccion, Fuero, Juzgado,
          Secretaria, Instancia, NroExpediente, AnioExpediente, LoginName, nroInstancia,EstadoMediacion : string);
var
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateInstanciaJuicio - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    dmConn.EjecutarSql(
      ' UPDATE legales.lij_instanciajuicioentramite' +
      '    SET ij_nroexpediente = ' + SqlValue(NroExpediente) + ',' +
      '        ij_anioexpediente = ' +SqlValue(AnioExpediente) + ',' +
      '        ij_usumodif = ' + SqlValue(LoginName) + ',' +
      '        ij_idjurisdiccion =  ' + SqlValue(Jurisdiccion) + ',' +
      '        ij_idfuero = ' + SqlValue(Fuero) + ',' +
      '        ij_idjuzgado = ' + SqlValue(Juzgado) + ',' +
      '        ij_idsecretaria = ' + SqlValue(Secretaria) + ',' +
      '        ij_idinstancia = ' + SqlValue(Instancia) + ', ' +
      '        ij_fechamodif = sysdate' +
      '  WHERE ij_idinstancia = ' + SqlValue(Instancia)+
      '    AND ij_idjuicioentramite = '+SqlValue(JuicioEnTramite));
    //LogMessage('UpdateInstanciaJuicio - Query',EVENTLOG_INFORMATION_TYPE,0,0);

   dmConn.EjecutarSql(
      ' UPDATE legales.ljt_juicioentramite ' +
      '    SET jt_idjurisdiccion =  ' + SqlValue(Jurisdiccion)  + ', ' +
      '        jt_idfuero = '  + SqlValue(Fuero)  + ', ' +
      '        jt_idjuzgado = ' + SqlValue(Juzgado) + ', ' +
      '        jt_idsecretaria = ' + SqlValue(Secretaria) + ', ' +
      '        jt_nroexpediente = ' + SqlValue(NroExpediente) + ', ' +
      '        jt_anioexpediente = ' + SqlValue(AnioExpediente) + ', ' +
      '        jt_usumodif = ' + SqlValue(LoginName) + ', ' +
      '        jt_estadomediacion = '+ SqlValue(EstadoMediacion) + ', ' +
      '        jt_fechamodif = Sysdate ' +
      '  WHERE jt_id = ' + SqlValue(JuicioEnTramite));
    //LogMessage('UpdateInstanciaJuicio - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateInstanciaJuicio - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateInstanciaABMAlta(JuicioEnTramite, Jurisdiccion, Fuero, Juzgado, Secretaria, Instancia, NroExpediente, AnioExpediente, Motivo, Detalle, LoginName, EstadoMediacion : string; FechaIngreso :TDateTime);
var
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateInstanciaABMAlta - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    dmConn.EjecutarSql(
      ' INSERT INTO legales.lij_instanciajuicioentramite (          ' +
      '               ij_id, ij_idjuicioentramite, ij_idjurisdiccion,  ' +
      '               ij_idfuero, ij_idjuzgado, ij_idsecretaria, ij_idinstancia, ' +
      '               ij_nroexpediente, ij_anioexpediente, ij_fechatraspaso, ' +
      '               ij_idmotivocambiojuzgado, ij_observaciones, ij_usualta,    ' +
      '               ij_fechaalta)  ' +
      '      VALUES (LEGALES.SEQ_LIJ_ID.NEXTVAL, ' +
                     SqlValue(JuicioEnTramite) + ', ' +
                     SqlValue(Jurisdiccion)  + ', ' +
                     SqlValue(Fuero)  + ', ' +
                     SqlValue(Juzgado) + ', ' +
                     SqlValue(Secretaria) + ', ' +
                     SqlValue(Instancia) + ', ' +
                     SqlValue(NroExpediente) + ', ' +
                     SqlValue(AnioExpediente) + ', ' +
                     SqlDate(FechaIngreso) + ', ' +
                     SqlValue(Motivo) + ', ' +
                     SqlValue(Detalle) +  ' , ' +
                     SqlValue(LoginName) + ' ,Sysdate ' + ')');
    //LogMessage('UpdateInstanciaABMAlta - Query',EVENTLOG_INFORMATION_TYPE,0,0);

    dmConn.EjecutarSql(
      ' UPDATE legales.ljt_juicioentramite ljt ' +
      '    SET jt_importesentencia = NULL, ' +
      '        jt_importecapital = NULL, ' +
      '        jt_importetasajusticia = NULL, ' +
      '        jt_importehonorarios = NULL, ' +
      '        jt_idtiporesultadosentencia = NULL, ' +
      '        jt_fechasentencia = NULL, ' +
      '        jt_fecharecepsentencia = NULL, '+
      '        jt_detallesentencia = NULL, ' +
      '        jt_interesesSentencia = NULL ' +
      '  WHERE ljt.jt_id = ' + SqlValue(JuicioEnTramite));
    //LogMessage('UpdateInstanciaABMAlta - Query1',EVENTLOG_INFORMATION_TYPE,0,0);

    dmConn.EjecutarSql(
      ' UPDATE legales.lrt_reclamojuicioentramite ' +
      '    SET rt_montosentencia = NULL, ' +
      '        rt_porcentajesentencia = NULL, ' +
      '        rt_usumodif = ' + SqlValue(LoginName) + ', ' +
      '        rt_fechamodif = SysDate ' +
      '  WHERE rt_idjuicioentramite = ' + SqlValue(JuicioEnTramite));
    //LogMessage('UpdateInstanciaABMAlta - Query2',EVENTLOG_INFORMATION_TYPE,0,0);

    dmConn.EjecutarSql(
      ' UPDATE legales.ljt_juicioentramite ' +
      '    SET jt_idjurisdiccion =  ' + SqlValue(Jurisdiccion)  + ', ' +
      '        jt_idfuero = '  + SqlValue(Fuero)  + ', ' +
      '        jt_idjuzgado = ' + SqlValue(Juzgado) + ', ' +
      '        jt_idsecretaria = ' + SqlValue(Secretaria) + ', ' +
      '        JT_NROEXPEDIENTE = ' + SqlValue(NroExpediente) + ', ' +
      '        JT_ANIOEXPEDIENTE = ' + SqlValue(AnioExpediente) + ', ' +
      '        jt_fechaingreso = ' + SqlDate(FechaIngreso) + ', ' +
      '        jt_usumodif = ' + SqlValue(LoginName) + ', ' +
      '        jt_estadomediacion = '+ SqlValue(EstadoMediacion) + ', ' +
      '        jt_fechamodif = Sysdate ' +
      '  WHERE jt_id = ' + SqlValue(JuicioEnTramite));
    //LogMessage('UpdateInstanciaABMAlta - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateInstanciaABMAlta - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateMasDatosJuicios(txtDomicilio, txtTelefonos,
  txtFax, txtEmail, usuario,
  idjuicio: string);
var
  idJuzgado : Integer;
  strqry : Widestring;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateMasDatosJuicios - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    idJuzgado := dmConn.ValorSql( ' SELECT jt_idjuzgado FROM legales.ljt_juicioentramite '+
                           '  WHERE jt_id = '+SqlValue(idjuicio));
    //LogMessage('UpdateMasDatosJuicios - Query Juzgado',EVENTLOG_INFORMATION_TYPE,0,0);
    strqry:=
      ' UPDATE legales.ljz_juzgado '+
      '    SET jz_usumodif = '+SqlValue(usuario)+','+
      '        jz_fechamodif = SYSDATE, '+
      '        jz_direccion = '+SqlValue(txtDomicilio)+', '+
      '        jz_telefono = '+SqlValue(txtTelefonos)+', '+
      '        jz_fax = '+SqlValue(txtFax)+', '+
      '        jz_email = '+SqlValue(txtEmail)+
      '  WHERE jz_id = '+SqlValue(idJuzgado);
    //LogMessage('UpdateMasDatosJuicios - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('UpdateMasDatosJuicios - Finalizo - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateMasDatosJuicios - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateClaveUsuario(nrousuario,clave: string);
var
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateClaveUsuario - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    dmConn.EjecutarSql(
      ' UPDATE legales.lnu_nivelusuario '+
      '    SET nu_claveweb = '+SqlValue(clave)+', '+
      '        nu_forzarclave = ''N'' '+
      '  WHERE nu_id = '+ SqlValue(nrousuario) );
    //LogMessage('UpdateClaveUsuario - Finalizo - '  + nrousuario,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateClaveUsuario - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;


function TSyncSrv.UpdatePeritajes(pj_id, usuario : string):Boolean;
var
  id : integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdatePeritajes - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(pj_id);
    if dmConn.ExisteSql(
      ' SELECT 1 '+
      '   FROM legales.lpj_peritajejuicio '+
      '  WHERE pj_fechabaja IS NULL '+
      '    AND pj_id = '+Sqlint(id)+
      '    AND pj_usualta = '+SqlValue(usuario)) then
    begin
      dmConn.EjecutarSql(
        ' UPDATE legales.lpj_peritajejuicio '+
        '    SET pj_fechabaja = SYSDATE, '+
        '        pj_usubaja = ' +  SqlValue(usuario) +
        '  WHERE pj_fechabaja IS NULL AND pj_id = ' + SqlInt(id) );
      Result := True;
    end
    else
      Result := False;
    //LogMessage('Desconecto - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //result := True;
    //LogMessage('Desconecto - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateImportes(ir_id, usuario : string);
var
  id:integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateImportes - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(ir_id);
    dmConn.EjecutarSql(
      ' UPDATE legales.lir_importesreguladosjuicio '+
      '    SET ir_fechabaja = SYSDATE, '+
      '        ir_usubaja = '+SqlValue(usuario) +
      '  WHERE ir_fechabaja IS NULL AND ir_id = ' + SqlInt(id));
  //LogMessage('UpdateImportes - Finalizo - ' + ir_id,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateImportes - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateImporteABM(ir_id,txtimporte, detalle, usuario ,aplicado: string);
var
  id:integer;
  importe : extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateImporteABM - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(ir_id);
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    importe:= StrToFloatDef(txtimporte, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';

    dmConn.EjecutarSql(
      ' UPDATE legales.lir_importesreguladosjuicio '+
      '    SET ir_importesentencia = '+SqlNumber(importe) +','+
      '        ir_detalleweb = '+SqlValue(detalle) +','+
      '        ir_usumodif = '+SqlValue(usuario) +','+
      '        ir_fechamodif = SYSDATE, '+
      '        ir_aplicacion = '+ SqlValue(aplicado)+
      '  WHERE ir_id = '+SqlInt(id));
    //LogMessage('UpdateImporteABM - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateImporteABM - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.InsertarEventoNuevo(txtfecha :TDateTime; txtfechavencimiento, txtobservaciones ,nrojuicio, usuario, cmbEventos :String);
var
  idtipoevento, nro_juicio, eventoid : integer;
  strqry : String;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarEventoNuevo - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    try
      eventoid:= dmConn.GetSecNextVal('legales.seq_let_id');
      format.DateSeparator := '/';
      format.ShortDateFormat := 'd/m/y';
      nro_juicio := StrToInt(nrojuicio);
      idtipoevento := StrToInt(cmbEventos);
      ReplaceString(txtobservaciones,'<','');
      ReplaceString(txtobservaciones,'>','');
      strqry:=
        'DECLARE '+
        '  observacion varchar2(32767); '+
        ' BEGIN '+
        ' observacion := :obs; '+
        ' INSERT INTO legales.let_eventojuicioentramite '+
        '             (et_id, et_fechaevento, et_fechavencimiento, '+
        '              et_idjuicioentramite, et_fechaalta, et_usualta, et_fechamodif, '+
        '              et_usumodif, et_fechabaja, et_usubaja, et_idtipoevento, et_observaciones '+
        '             ) '+
        ' VALUES ( '+ SqlInt(eventoid)+','+ SqlDate(txtfecha) +',';


      if txtfechavencimiento <>'' then
        strqry:= strqry+ SqlDate(strtodatedef(txtfechavencimiento,0,format)) +','
      else
        strqry := strqry + 'NULL , ';
      strqry:= strqry+ SqlInt(nro_juicio)+',SYSDATE,'+ SqlValue(usuario) +', NULL, '+
               ' NULL, NULL, NULL,'+ SqlInt(idtipoevento)+',observacion'+
               ' ); '+
      'END; ';

      //LogMessage('InsertarEventoNuevo - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
      dmConn.EjecutarSqlEx(strqry,[txtobservaciones]);
      //LogMessage('InsertarEventoNuevo - Ejecuto - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);

    except
      on e: Exception do
      begin
        LogMessage('InsertarEventoNuevo - Error - ' + e.message,EVENTLOG_ERROR_TYPE,0,0);
        raise Exception.Create('Error! ' + e.message);
      end;
    end;
    //LogMessage('InsertarEventoNuevo - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarEventoNuevo - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.InsertarEventoCYQNuevo(txtfecha :TDateTime; txtobservaciones , usuario, cmbEventos,nroorden :String);
var
  qry: TSDQuery;
  nroevento, strqry : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarEventoCYQNuevo - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery(
      ' SELECT iif_compara (''<='', '+
      '                     NVL (MAX (ce_nroevento), 0), '+
      '                     0, '+
      '                     1, '+
      '                     NVL (MAX (ce_nroevento), 0) + 1 '+
      '                    ) '+
      '   FROM lce_eventocyq '+
      '  WHERE ce_nroorden = '+SqlValue(nroorden));
    nroevento:= qry.Fields[0].AsString;
    //LogMessage('InsertarEventoCYQNuevo - Query - ' + qry.SQL.Text, EVENTLOG_INFORMATION_TYPE,0,0);

    strqry:=
      ' INSERT INTO lce_eventocyq '+
      '        (ce_nroorden, ce_nroevento, ce_usualta, ce_fechaalta, '+
      '         ce_codevento, ce_fecha, ce_observaciones '+
      '        ) '+
      ' VALUES ('+SqlValue(nroorden)+','+SqlValue(nroevento)+', '+SqlValue(usuario)+', SYSDATE, '+
              SqlValue(cmbEventos)+', '+SqlDate(txtfecha)+', '+SqlValue(txtobservaciones)+
      '      ) ';

    //LogMessage('InsertarEventoCYQNuevo - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('InsertarEventoCYQNuevo - Finalizo - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarEventoCYQNuevo - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.InsertarAcuerdoNuevo(txtfechavenc :TDateTime; txtmonto, txtfechapago, txtobservaciones, usuario,nroorden, txtFechaExtincion, cmbTipo : string);
var
  qry: TSDQuery;
  nropago, strqry : String;
  monto :Extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarAcuerdoNuevo - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    monto:= StrToFloatDef(txtmonto, 0, format);
    format.DateSeparator := '/';
    format.ShortDateFormat := 'd/m/y';
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';
    qry:= dmConn.GetQuery(
      ' SELECT IIF_Compara( ''<='', NVL(Max(CA_NROPAGO), 0), 0, 1, NVL(Max(CA_NROPAGO), 0) + 1) FROM LCA_ACUERDOCYQ WHERE CA_NROORDEN = '+SqlValue(nroorden));
      nropago:= qry.Fields[0].AsString;
    //LogMessage('InsertarAcuerdoNuevo - Query - ' + qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);

    strqry:=
      'INSERT INTO LCA_ACUERDOCYQ '+
      '           (CA_NROORDEN, CA_NROPAGO, CA_USUALTA, '+
      '            CA_FECHAALTA, CA_FECHAPAGO, CA_FECHAVENC, CA_MONTO, '+
      '            CA_OBSERVACIONES, CA_FECHAEXTINCION, CA_TIPO) '+
      ' VALUES ('+SqlValue(nroorden)+','+SqlValue(nropago)+', '+SqlValue(usuario)+', SYSDATE, ';
    if txtfechapago <>'' then
      strqry:= strqry+SqlDate(strtodatedef(txtfechapago,0,format)) +','
    else
      strqry := strqry +' NULL , ';
      strqry := strqry +SqlDate(txtfechavenc)+', '+SqlNumber(monto)+', '+SqlValue(txtobservaciones)+', ';
    if txtFechaExtincion <>'' then
      strqry:= strqry + SqlDate(strtodatedef(txtFechaExtincion,0,format)) +','
    else
      strqry := strqry +' NULL ,';
    strqry := strqry + SqlValue(cmbTipo)+')';
    //LogMessage('InsertarAcuerdoNuevo - Query - ' + strqry, EVENTLOG_INFORMATION_TYPE,0,0);

    dmConn.EjecutarSql(strqry);
    //LogMessage('InsertarAcuerdoNuevo - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarAcuerdoNuevo - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.InsertarCuotas(txtfecha1 :TDateTime; cantcuota, tiempo, txtmonto, usuario, nroorden, cmbTipo : string);
var
  monto :Extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarCuotas - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    monto:= StrToFloatDef(txtmonto, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';
    dmConn.EjecutarSql(
     'Begin ART.LEGALES.Do_PlanCyQ ( '+SqlDate(txtfecha1)+', '+ SqlValue(cantcuota)+', '+
      SqlValue(tiempo)+', '+ SqlNumber(monto)+', '+
      SqlValue(nroorden)+', '+SqlValue(usuario)+', '+SqlValue(cmbTipo)+'); End; ');
    //LogMessage('InsertarCuotas - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarCuotas - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;


procedure TSyncSrv.InsertarEventoArchivo( listarchivoagregado, nombrearchivo, idevento, usuario:String);
var
  eventoid : integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarEventoArchivo - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    eventoid:= StrToInt(idevento);
    dmConn.EjecutarSql(
      ' INSERT INTO legales.lea_eventoarchivoasociado '+
      '             (ea_id, ea_descripcion, ea_patharchivo, '+
      '              ea_ideventojuicioentramite, ea_usualta, ea_fechaalta '+
      '             ) '+
      '      VALUES ( legales.seq_lea_id.NEXTVAL, '+ SqlValue(listarchivoagregado)+', '+ SqlValue(nombrearchivo)+', '+
                      SqlInt(eventoid)+', '+SqlValue(Usuario)+', SYSDATE )');
    //LogMessage('InsertarEventoArchivo - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarEventoArchivo - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.InsertarPeritajeNuevo(txtFechaAsignacion, txtFechaPericia,
                    txtFVencImpug, cmbPericia, txtResultados, nrojuicio, usuario,
                    incapacidadDemanda, incapacidadPeritoMedico, ibmArt, ibmPericial, impugnacion,idperito :String);
var
  nro_juicio, peritajeid : integer;
  montodemanda, montomedico, montoart, montopericial : Extended;
  strqry : String;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarPeritajeNuevo - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    peritajeid:= dmConn.GetSecNextVal('legales.seq_lpj_id');
    nro_juicio := StrToInt(nrojuicio);
    format.DateSeparator := '/';
    format.ShortDateFormat := 'd/m/y';
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    montodemanda:= StrToFloatDef(incapacidadDemanda, 0, format);
    montomedico := StrToFloatDef(incapacidadPeritoMedico, 0, format);
    montoart := StrToFloatDef(ibmArt, 0, format);
    montopericial := StrToFloatDef(ibmPericial, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';

    strqry :=
      ' INSERT INTO legales.lpj_peritajejuicio '+
      '             (pj_id, PJ_IDPERITO,pj_fechanotificacion, pj_fechaperitaje, pj_fechavencimpugnacion, '+
      '              pj_resultadoperitaje, pj_fechaalta, pj_usualta, pj_idjuicioentramite, '+
      '              pj_idtipopericia, pj_incapacidaddemanda, pj_incapacidadperitomedico, pj_ibmart, '+
      '              pj_ibmpericial, pj_impugnacion '+
      '             ) '+
      '      VALUES ( '+
                    SqlInt(peritajeid)+','+SqlValue(idperito)+',';
      if txtFechaAsignacion <>'' then
        strqry := strqry + SqlDate(strtodatedef(txtFechaAsignacion,0,format)) + ','
      else
        strqry := strqry + 'NULL,';
      if txtFechapericia <>'' then
        strqry := strqry + SqlDate(strtodatedef(txtFechaPericia,0,format)) + ','
      else
        strqry := strqry + 'NULL,';
      if txtFVencImpug <>'' then
        strqry := strqry + SqlDate(strtodatedef(txtFVencImpug,0,format)) + ','
      else
        strqry := strqry + 'NULL,';


        strqry := strqry + SqlValue(txtResultados) +  ',' +
                 ' SYSDATE, '+ SqlValue(usuario) + ' , '+
                  SqlInt(nro_juicio) +  ',' +
                  SqlValue(cmbPericia) +  ',' +
                  SqlValue(montodemanda)+ ','+
                  SqlValue(montomedico)+ ','+
                  SqlValue(montoart)+ ','+
                  SqlValue(montopericial)+ ','+
                  SqlValue(impugnacion)+ ' ) '  ;
    //LogMessage('InsertarPeritajeNuevo - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('InsertarPeritajeNuevo - Finalizo - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarPeritajeNuevo - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.InsertarMedidaCautelar(cmbMedida, txtImporte, txtObservacion, nrojuicio, usuario :String);
var
  strqry : String;
  mcid : Integer;
  importe : extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarMedidaCautelar - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    mcid := dmConn.GetSecNextVal('LEGALES.SEQ_LMC_ID');
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    importe:= StrToFloatDef(txtImporte, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';

    strqry :=
      ' INSERT INTO legales.lmc_medidascautelares '+
      '             (mc_id, mc_idtipomedida, mc_importe, mc_observaciones, '+
      '              mc_usualta, mc_fechaalta, mc_idjuicioentramite '+
      '             ) '+
      '      VALUES ( '+
                    SqlValue(mcid)+','+
                    SqlValue(cmbMedida)+ ',' +
                    SqlValue(importe)+ ',' +
                    SqlValue(txtObservacion)+ ',' +
                    SqlValue(usuario)+ ',sysdate,' +
                    SqlValue(nrojuicio)+' ) '  ;
    //LogMessage('InsertarMedidaCautelar - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('InsertarMedidaCautelar - Finalizo - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarMedidaCautelar - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateMedidaCautelarABM(cmbMedida, txtImporte, txtObservacion, mcid, usuario :String);
var
  strqry: WideString;
  importe : extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateMedidaCautelarABM - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    importe:= StrToFloatDef(txtImporte, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';

    strqry :=
      ' UPDATE legales.lmc_medidascautelares '+
      '    SET mc_idtipomedida = '+ SqlValue(cmbMedida)+' , '+
      '        mc_importe = '+ SqlValue(importe) +' , '+
      '        mc_observaciones = '+ SqlValue(txtObservacion) +  ',' +
      '        mc_fechamodif = SYSDATE, '+
      '        mc_usumodif = '+ SqlValue(usuario) + ' , '+
      '        mc_fechabaja = NULL, '+
      '        mc_usubaja = NULL '+
      '  WHERE mc_id = ' + SqlValue(mcid) ;
    //LogMessage('UpdateMedidaCautelarABM - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('UpdateMedidaCautelarABM - Finalizo - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateMedidaCautelarABM - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdatePeritajesABM(txtFechaAsignacion, txtFechaPericia,
                    txtFVencImpug, cmbPericia, txtResultados, pj_id, usuario,
                    incapacidadDemanda, incapacidadPeritoMedico, ibmArt, ibmPericial, impugnacion, idperito :String);
var
  id :Integer;
  strqry: WideString;
  montodemanda, montomedico, montoart, montopericial : Extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdatePeritajesABM - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(pj_id);
    format.DateSeparator := '/';
    format.ShortDateFormat := 'd/m/y';
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    montodemanda:= StrToFloatDef(incapacidadDemanda, 0, format);
    montomedico := StrToFloatDef(incapacidadPeritoMedico, 0, format);
    montoart := StrToFloatDef(ibmArt, 0, format);
    montopericial := StrToFloatDef(ibmPericial, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';


    strqry :=
      ' UPDATE legales.lpj_peritajejuicio '+
      '    SET ';

      if txtFechaAsignacion <>'' then
        strqry:= strqry+ ' pj_fechanotificacion ='+SqlDate(strtodatedef(txtFechaAsignacion,0,format)) +','
      else
        strqry := strqry +' pj_fechanotificacion = NULL , ';

      if txtFechapericia <>'' then
        strqry:= strqry+ ' pj_fechaperitaje ='+SqlDate(strtodatedef(txtfechapericia,0,format)) +','
      else
        strqry := strqry +' pj_fechaperitaje = NULL , ';

      if txtFVencImpug <>'' then
        strqry:= strqry+ ' pj_fechavencimpugnacion ='+SqlDate(strtodatedef(txtFVencImpug,0,format)) +','
      else
        strqry := strqry +' pj_fechavencimpugnacion = NULL , ';

      strqry := strqry + ' pj_resultadoperitaje = '+ SqlValue(txtResultados) +  ',' +
              ' pj_fechamodif = SYSDATE, '+
              ' pj_usumodif = '+ SqlValue(usuario) + ' , '+
              ' pj_fechabaja = NULL, '+
              ' pj_usubaja = NULL, '+
              ' pj_idperito = '+SqlValue(idperito)+','+
              ' pj_idtipopericia = '+ SqlValue(cmbPericia) +  ',' +
              ' pj_incapacidaddemanda = '+ SqlValue(montodemanda) +  ',' +
              ' pj_incapacidadperitomedico = '+ SqlValue(montomedico) +  ',' +
              ' pj_ibmart = '+ SqlValue(montoart) +  ',' +
              ' pj_ibmpericial = '+SqlValue(montopericial) +  ',' +
              ' pj_impugnacion = '+SqlValue(impugnacion)+ ','+
              ' pj_completaestudio = ''N'' '+
       '  WHERE pj_id = ' + SqlInt(id) ;
    //LogMessage('UpdatePeritajesABM - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('UpdatePeritajesABM - Finalizo - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdatePeritajesABM - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.InsertarPeritoNuevo(nombre, apellido, cuil, tipoperito,parteoficio, usuario, direccion : string);
var
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarPeritoNuevo - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    dmConn.EjecutarSql(
      ' INSERT INTO legales.lpe_perito '+
      '             (pe_id, pe_nombre, pe_cuitcuil, pe_idtipoperito, '+
      '              pe_parteoficio, pe_usualta, pe_fechaalta,pe_direccion,  '+
      '              PE_NOMBREINDIVIDUAL, PE_APELLIDO ) '+
      '      VALUES (legales.seq_lpe_id.NEXTVAL, upper('+ SqlValue(apellido+' '+nombre)+'),'+ SqlString(cuil,False,True)+','+ SqlValue(tipoperito)+','+
                    SqlValue(parteoficio)+','+ SqlValue(usuario)+', SYSDATE,'+SqlValue(direccion)+','+
                    'upper('+SqlValue(nombre)+'),upper('+SqlValue(apellido)+')'+
      '             )');
    //LogMessage('InsertarPeritoNuevo - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarPeritoNuevo - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;



procedure TSyncSrv.InsertarImporteNuevo(nrojuicio, usuario, txtimporte,aplicado, detalle, detalleweb,instancia : string);
var
  nro:integer;
  importe : extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarImporteNuevo - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    nro:= StrToInt(nrojuicio);
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    importe:= StrToFloatDef(txtimporte, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';
    dmConn.EjecutarSql(
      'INSERT INTO legales.lir_importesreguladosjuicio (' +
      '              ir_id, ir_idjuicioentramite, ir_importe, ir_detalle, ' +
      '              ir_aplicacion, ir_usualta, ir_fechaalta, ir_usumodif, ' +
      '              ir_fechamodif, ir_usubaja, ir_fechabaja, ir_idinstancia, ' +
      '              ir_nropago, ir_idreclamojuicioentramite, ir_importesinret, ' +
      '              ir_importesentencia,ir_carga,ir_detalleweb) ' +
      '     VALUES (legales.seq_lir_id.NEXTVAL, ' +
                    SqlInt(nro) + ', 0,' +
                    SqlValue(detalle) + ', ' +
                    SqlValue(aplicado) + ', ' +
                    SqlValue(usuario) + ', SYSDATE, NULL, NULL, NULL, NULL, ' +
                    SqlValue(instancia) + ', NULL, ' +
      '             NULL, ' +
      '             NULL, ' +
                    SqlNumber(importe) +',''W'','+SqlValue(detalleweb)+ ')');
    //LogMessage('InsertarImporteNuevo - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarImporteNuevo - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;


procedure TSyncSrv.UpdateReclamos(rt_id, nrojuicio, usuario, montosentencia, porcentajesentencia : string);
var
  nro,rtid:integer;
  monto,porcentaje : extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateReclamos - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    nro:= StrToInt(nrojuicio);
    rtid:=StrtoInt(rt_id);
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    monto:= StrToFloatDef(montosentencia, 0, format);
    porcentaje := StrToFloatDef(porcentajesentencia, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';
    dmConn.EjecutarSql(
      ' UPDATE legales.lrt_reclamojuicioentramite '+
      '    SET rt_montosentencia = '+ SqlNumber(monto)+','+
      '        rt_porcentajesentencia = '+ SqlNumber(porcentaje)+','+
      '        rt_fechamodif = SYSDATE, '+
      '        rt_usumodif = '+  SqlValue(usuario) +
      '  WHERE rt_id = ' + SqlInt(rtid) );
    //LogMessage('UpdateReclamos - Query',EVENTLOG_INFORMATION_TYPE,0,0);

    if dmConn.ValorSqlInteger(
      'SELECT 1 FROM legales.lir_importesreguladosjuicio ' +
      ' WHERE ir_idreclamojuicioentramite = ' + SqlInt(rtid) +
      '   AND ir_idinstancia in' + '(SELECT ij_id '+
      '                                FROM legales.ljz_juzgado INNER JOIN legales.lin_instancia ON ljz_juzgado.jz_idinstancia = '+
      '                                     lin_instancia.in_id '+
      '                          INNER JOIN legales.ljt_juicioentramite ON ljt_juicioentramite.jt_idjuzgado = '+
      '                                     ljz_juzgado.jz_id '+
      '                          INNER JOIN legales.lij_instanciajuicioentramite ON lij_instanciajuicioentramite.ij_idjuicioentramite = '+
      '                                     ljt_juicioentramite.jt_id '+
      '                                 AND ljz_juzgado.jz_id =  ij_idjuzgado '+
      '                               WHERE ljt_juicioentramite.jt_id = '+ SqlInt(nro)+')'
                        ) = 1 then
    begin
      dmConn.EjecutarSql(
      ' UPDATE legales.lir_importesreguladosjuicio ' +
      '    SET ir_importesinret = NULL, ' +
      '        ir_importesentencia = '+ SqlNumber(monto) + ', ' +
      '        ir_usumodif = ' + SqlValue(usuario) + ', ' +
      '        ir_fechamodif = SYSDATE, ' +
      '        ir_carga = ''W'' '+
      '  WHERE ir_idreclamojuicioentramite = ' + SqlInt(rtid) +
      '    AND ir_idinstancia = ' + '(SELECT ij_id '+
      '                                 FROM legales.ljz_juzgado INNER JOIN legales.lin_instancia ON ljz_juzgado.jz_idinstancia = '+
      '                                      lin_instancia.in_id '+
      '                           INNER JOIN legales.ljt_juicioentramite ON ljt_juicioentramite.jt_idjuzgado = '+
      '                                      ljz_juzgado.jz_id '+
      '                           INNER JOIN legales.lij_instanciajuicioentramite ON lij_instanciajuicioentramite.ij_idjuicioentramite = '+
      '                                      ljt_juicioentramite.jt_id '+
      '                                  AND ljz_juzgado.jz_id = '+
      '                                      ij_idjuzgado '+
      '                                WHERE ljt_juicioentramite.jt_id = '+ SqlInt(nro)+')');
      //LogMessage('UpdateReclamos - Query1',EVENTLOG_INFORMATION_TYPE,0,0);
    end
    else
      dmConn.EjecutarSql('INSERT INTO legales.lir_importesreguladosjuicio (' +
                    'ir_id, ir_idjuicioentramite, ir_importe, ir_detalle, ' +
                    'ir_aplicacion, ir_usualta, ir_fechaalta, ir_usumodif, ' +
                    'ir_fechamodif, ir_usubaja, ir_fechabaja, ir_idinstancia, ' +
                    'ir_nropago, ir_idreclamojuicioentramite, ir_importesinret, ' +
                    'ir_importesentencia,ir_carga) ' +
                    'VALUES (legales.seq_lir_id.NEXTVAL, ' +
                    SqlInt(nro) + ', 0,' +
                    SqlValue('Sentencia a Reclamo ' +
                             String(dmConn.ValorSql('SELECT od_nombre from legales.lod_origendemanda ' +
                                             ' WHERE od_idjuicioentramite = ' + SqlInt(nro) +
                                             '   AND od_id =   (SELECT od_id  '+
                                                               '  FROM legales.lod_origendemanda '+
                                                               ' WHERE od_idjuicioentramite = ' + SqlInt(nro) + ')' +
                                             '   AND od_fechabaja IS NULL', ''))
                            ) + ', ' +
                    SqlValue('C') + ', ' +
                    SqlValue(usuario) + ', SYSDATE, NULL, NULL, NULL, NULL, ' +
                    '(SELECT ij_id '+
                          ' FROM legales.ljz_juzgado INNER JOIN legales.lin_instancia ON ljz_juzgado.jz_idinstancia = '+
                                                                                         ' lin_instancia.in_id '+
                               ' INNER JOIN legales.ljt_juicioentramite ON ljt_juicioentramite.jt_idjuzgado = '+
                                                                           ' ljz_juzgado.jz_id '+
                               ' INNER JOIN legales.lij_instanciajuicioentramite ON lij_instanciajuicioentramite.ij_idjuicioentramite = '+
                                                                                    ' ljt_juicioentramite.jt_id '+
                                                                             ' AND ljz_juzgado.jz_id = '+
                                                                                    ' ij_idjuzgado '+
                         ' WHERE ljt_juicioentramite.jt_id = '+ SqlInt(nro)+')' + ', NULL, ' +
                    SqlInt(rtid) + ', ' +
                     'NULL, ' +
                    SqlNumber(monto) +',''W'''+ ')');
    //LogMessage('UpdateReclamos - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateReclamos - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateMedidasCautelares(mc_id, usuario : string);
var
  id:integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateMedidasCautelares - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(mc_id);
    dmConn.EjecutarSql(
      ' UPDATE legales.lmc_medidascautelares '+
      '    SET MC_FECHABAJA = SYSDATE, '+
      '        MC_USUBAJA = '+  SqlValue(usuario) +
      '  WHERE MC_FECHABAJA IS NULL AND MC_ID = ' + SqlInt(id) );
    //LogMessage('UpdateMedidasCautelares - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateMedidasCautelares - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.UpdateEventos(et_id, usuario : string):Boolean;
var
  id:integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateEventos - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(et_id);
    if dmConn.ExisteSql(
      ' SELECT 1 '+
      '   FROM legales.let_eventojuicioentramite '+
      '  WHERE et_fechabaja IS NULL '+
      '    AND et_id = '+Sqlint(id)+
      '    AND et_usualta = '+SqlValue(usuario)) then
    begin
      dmConn.EjecutarSql(
      ' UPDATE legales.let_eventojuicioentramite '+
      '    SET et_fechabaja = SYSDATE, '+
      '        et_usubaja = '+  SqlValue(usuario) +
      '  WHERE et_fechabaja IS NULL AND et_id = ' + SqlInt(id) );
      Result := True;
    end
    else
      Result := False;
    //LogMessage('UpdateEventos - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateEventos - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateEventosCYQ(nroorden, nroevento, usuario : string);
var
  qry: TSDQuery;
  nro_evento : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateEventosCYQ - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery(
      'SELECT IIF_Compara( ''>'', NVL(Min( CE_NROEVENTO ), 0), 0, -1, NVL(Min( CE_NROEVENTO ), 0)-1 ) FROM LCE_EVENTOCYQ WHERE '+
      '        CE_NROORDEN = '+SqlValue(nroorden));
    nro_evento:= qry.Fields[0].AsString;
    //LogMessage('UpdateEventosCYQ - Query - ' + qry.SQL.Text, EVENTLOG_INFORMATION_TYPE,0,0);

    dmConn.EjecutarSql(
      ' UPDATE lce_eventocyq '+
      '    SET ce_nroevento = '+SqlValue(nro_evento)+', '+
      '        ce_usumodif = '+SqlValue(usuario)+', '+
      '        ce_fechamodif = SYSDATE '+
      '  WHERE ce_nroorden = '+SqlValue(nroorden)+
      '    AND ce_nroevento = '+SqlValue(nroevento));
    //LogMessage('UpdateEventosCYQ - Query',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateEventosCYQ - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateAcuerdos(nroorden, nropago, usuario : string);
var
  qry: TSDQuery;
  nro_pago : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateAcuerdos - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery(
      ' SELECT IIF_Compara( ''>'', NVL(Min(CA_NROPAGO), 0), 0, -1, NVL(Min(CA_NROPAGO), 0) - 1) FROM LCA_ACUERDOCYQ WHERE CA_NROORDEN = '+SqlValue(nroorden));
    nro_pago:= qry.Fields[0].AsString;
    //LogMessage('UpdateAcuerdos - Query - ' + qry.SQL.Text, EVENTLOG_INFORMATION_TYPE,0,0);

    dmConn.EjecutarSql(
      ' UPDATE lca_acuerdocyq '+
      '    SET ca_nropago = '+SqlValue(nro_pago)+', '+
      '        ca_usumodif = '+SqlValue(usuario)+', '+
      '        ca_fechamodif = SYSDATE '+
      '  WHERE ca_nroorden = '+SqlValue(nroorden)+
      '    AND ca_nropago = '+SqlValue(nropago));
    //LogMessage('UpdateAcuerdos - Query', EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateAcuerdos - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateEventosABM(txtfecha :TDateTime; txtfechavencimiento, et_id, txtobservaciones , usuario, cmbEventos  : string);
var
  id,idtipoevento:integer;
  strqry : Widestring;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateEventosABM - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    try
      id:=StrtoInt(et_id);
      idtipoevento := StrToInt(cmbEventos);
      format.DateSeparator := '/';
      format.ShortDateFormat := 'd/m/y';
      ReplaceString(txtobservaciones,'<','');
      ReplaceString(txtobservaciones,'>','');
      strqry:=
        ' DECLARE '+
        '   observaciones varchar2(32767); '+
        ' BEGIN '+
        ' observaciones := :obs; '+
        ' UPDATE legales.let_eventojuicioentramite '+
        '    SET et_fechaevento = '+ SqlDate(txtfecha) +',';

      if txtfechavencimiento <>'' then
        strqry:= strqry+ ' et_fechavencimiento ='+SqlDate(strtodatedef(txtfechavencimiento,0,format)) +','
      else
        strqry := strqry +' et_fechavencimiento = NULL , ';
      strqry := strqry +
        '        et_fechamodif = SYSDATE, '+
        '        et_usumodif ='+ SqlValue(usuario) +', '+
        '        et_fechabaja = NULL, '+
        '        et_usubaja = NULL, '+
        '        et_observaciones = observaciones,'+
        '        et_idtipoevento = '+ SqlInt(idtipoevento)+
        '  WHERE et_id = '+ SqlInt(id)+';'+
        ' END;';

      //LogMessage('UpdateEventosABM - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
      dmConn.EjecutarSqlEx(strqry,[txtobservaciones]);
      //LogMessage('UpdateEventosABM - Corrio - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);



    except
      on e: Exception do
      begin
        LogMessage('UpdateEventosABM - Error - ' + E.Message,EVENTLOG_ERROR_TYPE,0,0);
        raise Exception.Create('Error! ' + e.message);
      end;
    end;
  finally
    //tslAux.Free;
    dmConn.Free;
    //LogMessage('UpdateEventosABM - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateEventosCYQABM(txtfecha :TDateTime; txtobservaciones, usuario, cmbEventos, nroorden,nroevento : string);
var
  strqry : Widestring;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateEventosCYQABM - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    strqry:=
      ' UPDATE lce_eventocyq '+
      '    SET ce_usumodif = '+SqlValue(usuario)+', '+
      '        ce_fechamodif = SYSDATE, '+
      '        ce_codevento = '+SqlValue(cmbEventos)+', '+
      '        ce_fecha = '+SqlDate(txtfecha)+', '+
      '        ce_observaciones = '+SqlValue(txtobservaciones)+
      '  WHERE ce_nroorden = '+SqlValue(nroorden)+
      '    AND ce_nroevento = '+ SqlValue(nroevento);
    //LogMessage('UpdateEventosCYQABM - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('UpdateEventosCYQABM - Finalizo - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateEventosCYQABM - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateLiquidacionFinal( FImporteCapital, FImporteIntereses, FTasasDeJusticias, FEmbargos, FOtros, txtobservaciones, usuario, lf_id : string);
var
  strqry : Widestring;
  ImporteCapital, ImporteIntereses, TasasDeJusticias,Embargos, Otros : Extended;
  format : TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateLiquidacionFinal - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  format.DecimalSeparator := ',';
  format.ThousandSeparator := '.';
  ImporteCapital   := StrToFloatDef(FImporteCapital, 0, format);
  ImporteIntereses := StrToFloatDef(FImporteIntereses, 0, format);
  TasasDeJusticias := StrToFloatDef(FTasasDeJusticias, 0, format);
  Embargos         := StrToFloatDef(FEmbargos, 0, format);
  Otros            := StrToFloatDef(FOtros, 0, format);
  format.DecimalSeparator := '.';
  format.ThousandSeparator := ',';

  dmConn := TdmPrincipal.Create(nil);
  try
    strqry:=
      ' UPDATE legales.llf_liquidacionfinal '+
      '    SET lf_usumodif = '+SqlValue(usuario)+', '+
      '        lf_fechamodif = SYSDATE, '+
      '        LF_CAPITAL = '+SqlValue(ImporteCapital)+', '+
      '        LF_INTERESES = '+SqlValue(ImporteIntereses)+', '+
      '        LF_TASASDEJUSTICIA = '+SqlValue(TasasDeJusticias)+', '+
      '        LF_EMBARGOS = '+SqlValue(Embargos)+', '+
      '        LF_OTROS = '+SqlValue(Otros)+', '+
      '        LF_OBSERVACIONES = '+SqlValue(txtobservaciones)+
      '  WHERE LF_ID = '+SqlValue(lf_id);

    //LogMessage('UpdateLiquidacionFinal - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('UpdateLiquidacionFinal - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateLiquidacionFinal - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.InsertarLiquidacionFinal( FImporteCapital, FImporteIntereses, FTasasDeJusticias, FEmbargos, FOtros, txtobservaciones, usuario, nrojuicio : string);
var
  ImporteCapital, ImporteIntereses, TasasDeJusticias,Embargos, Otros : Extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('InsertarLiquidacionFinal - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    ImporteCapital   := StrToFloatDef(FImporteCapital, 0, format);
    ImporteIntereses := StrToFloatDef(FImporteIntereses, 0, format);
    TasasDeJusticias := StrToFloatDef(FTasasDeJusticias, 0, format);
    Embargos         := StrToFloatDef(FEmbargos, 0, format);
    Otros            := StrToFloatDef(FOtros, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';
    dmConn.EjecutarSql(
      'INSERT INTO LEGALES.LLF_LIQUIDACIONFINAL (' +
      '              LF_ID, LF_IDJUICIOENTRAMITE, LF_CAPITAL, LF_INTERESES, ' +
      '              LF_TASASDEJUSTICIA, LF_EMBARGOS, LF_OTROS, LF_OBSERVACIONES, ' +
      '              LF_USUALTA, LF_FECHAALTA' +
      '             ) ' +
      '     VALUES (LEGALES.SEQ_LLI_ID.NEXTVAL, ' +
                    SqlValue(nrojuicio) + ',' +
                    SqlValue(ImporteCapital) + ',' +
                    SqlValue(ImporteIntereses) + ',' +
                    SqlValue(TasasDeJusticias) + ',' +
                    SqlValue(Embargos) + ',' +
                    SqlValue(Otros) + ',' +
                    SqlValue(txtobservaciones) + ',' +
                    SqlValue(usuario) + ',sysdate' +
                    ')');
    //LogMessage('InsertarLiquidacionFinal - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('InsertarLiquidacionFinal - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateAcuerdosABM(txtfechavenc :TDateTime; txtmonto, txtfechapago, txtobservaciones, usuario,nroorden,nropago,txtFechaExtincion, cmbtipo : string);
var
  strqry : Widestring;
  format :TFormatSettings;
  monto: extended;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateAcuerdosABM - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    monto:= StrToFloatDef(txtmonto, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';
    format.DateSeparator := '/';
    format.ShortDateFormat := 'd/m/y';

    strqry:=
      ' UPDATE lca_acuerdocyq '+
      '    SET ca_usumodif = '+SqlValue(usuario)+', '+
      '        ca_fechamodif = SYSDATE, ';
    if txtfechapago <>'' then
      strqry:= strqry+ ' ca_fechapago ='+SqlDate(strtodatedef(txtfechapago,0,format)) +','
    else
      strqry := strqry +' ca_fechapago = NULL , ';
    strqry := strqry +'        ca_fechavenc = '+SqlDate(txtfechavenc)+', '+
      '        ca_monto = '+SqlNumber(monto)+', ';
    if txtFechaExtincion <>'' then
      strqry:= strqry+ ' CA_FECHAEXTINCION ='+SqlDate(strtodatedef(txtFechaExtincion,0,format)) +','
    else
      strqry := strqry +' CA_FECHAEXTINCION = NULL , ';

    strqry := strqry +
      '        CA_TIPO = '+SqlValue(cmbtipo) + ', '+
      '        ca_observaciones = '+SqlValue(txtobservaciones) +
      '  WHERE ca_nroorden = '+SqlValue(nroorden)+
      '    AND ca_nropago = '+SqlValue(nropago);
    //LogMessage('UpdateAcuerdosABM - Query - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('UpdateAcuerdosABM - Finalizo - ' + strqry,EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateAcuerdosABM - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateConcursoyquiebras(txtsindico, txtdireccion, txtlocaclidad, txtfuero, txttelefono, txtjurisdiccion, txtjuzgado, txtsecretaria, fechaconcurso, fechaquiebra, fechaart32, fechaart200, fverificacioncredito, usuario, nroorden, montoprivilegio, montoquirografario: string);
var
  strqry : Widestring;
  importe_privilegio, importe_quiro : extended;
  format :TFormatSettings;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateConcursoyquiebras - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    format.DateSeparator := '/';
    format.ShortDateFormat := 'd/m/y';
    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    importe_privilegio:= StrToFloatDef(montoprivilegio, 0, format);
    importe_quiro := StrToFloatDef(montoquirografario, 0, format);
    format.DecimalSeparator := '.';
    format.ThousandSeparator := ',';

    strqry:=
      ' UPDATE art.lcq_concyquiebra '+
      '    SET cq_sindico = '+ SqlValue(txtsindico)  +', '+
      '        cq_direccionsind = '+ SqlValue(txtdireccion)  +', '+
      '        cq_localidadsind = '+ SqlValue(txtlocaclidad)  +', '+
      '        cq_telefonosind = '+ SqlValue(txttelefono)  +', '+
      '        cq_fuero = '+ SqlValue(txtfuero)  +', '+
      '        cq_jurisdiccion = '+ SqlValue(txtjurisdiccion)  +', '+
      '        cq_juzgado = '+ SqlValue(txtjuzgado)  +', '+
      '        cq_montoprivilegio = '+ SqlNumber(importe_privilegio)+', '+
      '        cq_montoquirog = '+ SqlNumber(importe_quiro)+', '+
      '        cq_secretaria = '+ SqlValue(txtsecretaria)  +', ';
    if fechaconcurso <>'' then
      strqry:= strqry+ ' cq_fechaconcurso ='+SqlDate(strtodatedef(fechaconcurso,0,format)) +','
    else
      strqry := strqry +' cq_fechaconcurso = NULL , ';
    if fechaquiebra <>'' then
      strqry:= strqry+ ' cq_fechaquiebra ='+SqlDate(strtodatedef(fechaquiebra,0,format)) +','
    else
      strqry := strqry +' cq_fechaquiebra = NULL , ';
    if fechaart32 <>'' then
      strqry:= strqry+ ' cq_fechavtoart32 ='+SqlDate(strtodatedef(fechaart32,0,format)) +','
    else
      strqry := strqry +' cq_fechavtoart32 = NULL , ';
    if fechaart200 <>'' then
      strqry:= strqry+ ' cq_fechavtoart200 ='+SqlDate(strtodatedef(fechaart200,0,format)) +','
    else
      strqry := strqry +' cq_fechavtoart200 = NULL , ';
    if fverificacioncredito <>'' then
      strqry:= strqry+ ' cq_fechaverificacioncredito ='+SqlDate(strtodatedef(fverificacioncredito,0,format)) +','
    else
      strqry := strqry +' cq_fechaverificacioncredito = NULL , ';
    strqry := strqry + '        cq_usumodif = '+SqlValue(usuario)+', '+
      '        cq_fechamodif = SYSDATE '+
      '  WHERE cq_nroorden = '+SqlValue(nroorden);
    //LogMessage('UpdateConcursoyquiebras - Query - ' + strqry, EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(strqry);
    //LogMessage('UpdateConcursoyquiebras - Finalizo - ' + strqry, EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateConcursoyquiebras - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateEventosArchivos(ea_id, usuario, id_evento  : string);
var
  eaid,idevento:integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateEventosArchivos - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    eaid:= StrToInt(ea_id);
    idevento := StrToInt(id_evento);
    dmConn.EjecutarSql(
      ' UPDATE legales.lea_eventoarchivoasociado '+
      '    SET ea_usubaja = '+ SqlValue(usuario) +', '+
      '        ea_fechabaja = SYSDATE '+
      '  WHERE ea_id = '+SqlInt(eaid)+' AND ea_ideventojuicioentramite = '+ SqlInt(idevento));
    //LogMessage('UpdateEventosArchivos - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateEventosArchivos - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateEstado(jt_id, cmbEstado,usuario : string);
var
  id, idEstado:integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateEstado - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(jt_id);
    idEstado := StrToInt(cmbEstado);

    dmConn.EjecutarSql( Format('BEGIN'#13#10' %s '#13#10'END;', ['art.Legales.Set_CambioEstado( ' +
                    SqlInt(id) +  ', ' +
                    SqlInt(idestado) +  ', ' +
                    SqlDate(dmConn.DBDateTime) +  ', ' +
                    SqlValue(usuario) +  '); ']) );
    //LogMessage('UpdateEstado - Store',EVENTLOG_INFORMATION_TYPE,0,0);
    dmConn.EjecutarSql(
      ' UPDATE legales.ljt_juicioentramite '+
      '    SET jt_fechamodif = SYSDATE, '+
      '        jt_idestado = '+SqlInt(idEstado) +
      '  WHERE jt_id = '+ SqlInt(id) );
    //LogMessage('UpdateEstado - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateEstado - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

procedure TSyncSrv.UpdateResultado(jt_id, resultado, cmbEstado,usuario : string);
var
  id, idEstado:integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('UpdateResultado - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    id:=StrtoInt(jt_id);
    idEstado := StrToInt(cmbEstado);
    dmConn.EjecutarSql( Format('BEGIN'#13#10' %s '#13#10'END;', ['art.Legales.Set_CambioEstado( ' +
                    SqlInt(id) +  ', ' +
                    SqlInt(idestado) +  ', ' +
                    SqlDate(dmConn.DBDateTime) +  ', ' +
                    SqlValue(usuario) +  '); ']) );

    //LogMessage('UpdateResultado - Store',EVENTLOG_INFORMATION_TYPE,0,0);

    dmConn.EjecutarSql(
      ' UPDATE legales.ljt_juicioentramite '+
      '    SET jt_resultado = '+  SqlValue(resultado) + ','+
      '        jt_fechamodif = SYSDATE, '+
      '        jt_idestado = '+SqlInt(idEstado) +
      '  WHERE jt_id = '+ SqlInt(id) );

    //LogMessage('UpdateResultado - Query',EVENTLOG_INFORMATION_TYPE,0,0);

    dmConn.EjecutarSql(
      ' INSERT INTO legales.lhr_historicoresprobable '+
      '             (hr_id, hr_resultado, hr_usualta, hr_fechaalta, '+
      '              hr_idjuicioentramite '+
      '             ) '+
      '      VALUES (legales.seq_lhp_id.NEXTVAL,'+ SqlValue(resultado) + ','+  SqlValue(usuario)+ ', SYSDATE,'+
                    SqlInt(id)+')');
    //LogMessage('UpdateResultado - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('UpdateResultado - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.sumaHonorarios(nrojuicio,instancia: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  format : TFormatSettings;
  i :integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('sumaHonorarios - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery(
      ' SELECT SUM (ir_importesentencia) as ir_importesentencia'+
      '   FROM legales.lir_importesreguladosjuicio '+
      '  WHERE ir_idjuicioentramite = '+SqlValue(nrojuicio)+'AND ir_idinstancia='+SqlValue(instancia)+' AND ir_aplicacion = ''H'' '+
      '    AND ir_fechabaja IS NULL '      );
    //LogMessage('sumaHonorarios - Query - ' + qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);

    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    try
      sXml := sXml + '<'+'HONORARIOS'+'>';
      while not qry.Eof do
      begin
        for i:=0 to qry.Fields.Count - 1 do
        begin
          if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
            if  not (qry.Fields[i].AsString = '')   then
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
            else
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
          else
            if (qry.Fields[i].DataType = ftFloat)then
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
            else
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+qry.Fields[i].AsString+'</'+qry.Fields[i].FieldName+'>';
        end;
        qry.Next;
      end;
      sXml := sXml + '</'+'HONORARIOS'+'>';
    finally
      qry.free;
      result:= sXml;
    end;
    //LogMessage('sumaHonorarios - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('sumaHonorarios - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.sumaIntereses(nrojuicio,instancia: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  format : TFormatSettings;
  i :integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('sumaIntereses - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery(
      ' SELECT SUM (ir_importesentencia) as ir_importesentencia'+
      '   FROM legales.lir_importesreguladosjuicio '+
      '  WHERE ir_idjuicioentramite = '+SqlValue(nrojuicio)+'AND ir_idinstancia='+SqlValue(instancia)+' AND ir_aplicacion = ''I'' '+
      '    AND ir_fechabaja IS NULL ' );
    //LogMessage('sumaIntereses - Query - ' + qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);

    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    try
      sXml := sXml + '<'+'INTERESES'+'>';
      while not qry.Eof do
      begin
        for i:=0 to qry.Fields.Count - 1 do
        begin
          if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
            if  not (qry.Fields[i].AsString = '')   then
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
            else
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
          else
            if (qry.Fields[i].DataType = ftFloat)then
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
            else
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+qry.Fields[i].AsString+'</'+qry.Fields[i].FieldName+'>';
        end;
        qry.Next;
      end;
      sXml := sXml + '</'+'INTERESES'+'>';
    finally
      qry.free;
      result:= sXml;
    end;
    //LogMessage('sumaIntereses - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('sumaIntereses - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.sumaTasas(nrojuicio,instancia: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  format : TFormatSettings;
  i :integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('sumaTasas - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:=dmConn.GetQuery (
      ' SELECT SUM (ir_importesentencia) as ir_importesentencia'+
      '   FROM legales.lir_importesreguladosjuicio '+
      '  WHERE ir_idjuicioentramite = '+SqlValue(nrojuicio)+'AND ir_idinstancia='+SqlValue(instancia)+' AND ir_aplicacion = ''T'' '+
      '    AND ir_fechabaja IS NULL ');
    //LogMessage('sumaTasas - Query - ' + qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);

    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    try
      sXml := sXml + '<'+'TASAS'+'>';
      while not qry.Eof do
      begin
        for i:=0 to qry.Fields.Count - 1 do
        begin
          if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
            if  not (qry.Fields[i].AsString = '')   then
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
            else
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
          else
            if (qry.Fields[i].DataType = ftFloat)then
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
            else
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+qry.Fields[i].AsString+'</'+qry.Fields[i].FieldName+'>';
        end;
        qry.Next;
      end;
      sXml := sXml + '</'+'TASAS'+'>';
    finally
      qry.free;
      result:= sXml;
    end;
    //LogMessage('sumaTasas - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('sumaTasas - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.sumaCapital(nrojuicio,instancia: String): WideString;
var
  qry: TSDQuery;
  sXml: WideString;
  format : TFormatSettings;
  i :integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('sumaCapital - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery (
      ' SELECT SUM (ir_importesentencia) as ir_importesentencia'+
      '   FROM legales.lir_importesreguladosjuicio '+
      '  WHERE ir_idjuicioentramite = '+SqlValue(nrojuicio)+'AND ir_idinstancia='+SqlValue(instancia)+' AND ir_aplicacion = ''C'' '+
      '    AND ir_fechabaja IS NULL '
      );
    //LogMessage('sumaCapital - Query - ' + qry.SQL.Text,EVENTLOG_INFORMATION_TYPE,0,0);

    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    try
      sXml := sXml + '<'+'CAPITAL'+'>';
      while not qry.Eof do
      begin
        for i:=0 to qry.Fields.Count - 1 do
        begin
          if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
            if  not (qry.Fields[i].AsString = '')   then
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
            else
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
          else
          if (qry.Fields[i].DataType = ftFloat)then
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
          else
            sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+qry.Fields[i].AsString+'</'+qry.Fields[i].FieldName+'>';
        end;
        qry.Next;
      end;
      sXml := sXml + '</'+'CAPITAL'+'>';
    finally
      qry.free;
      result:= sXml;
    end;
    //LogMessage('sumaCapital - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('sumaCapital - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.sumaSentencia(nrojuicio,instancia: String):WideString;stdcall;
var
  qry: TSDQuery;
  sXml: WideString;
  format : TFormatSettings;
  i :integer;
  dmConn: TdmPrincipal;
begin
  //LogMessage('sumaSentencia - Inicio',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery (
      ' SELECT SUM (ir_importesentencia) as ir_importesentencia'+
      '   FROM legales.lir_importesreguladosjuicio '+
      '  WHERE ir_idjuicioentramite = '+SqlValue(nrojuicio)+'AND ir_idinstancia='+SqlValue(instancia)+
      '    AND ir_fechabaja IS NULL ' );
    //LogMessage('sumaSentencia - Query - ' + qry.SQL.Text, EVENTLOG_INFORMATION_TYPE,0,0);

    format.DecimalSeparator := ',';
    format.ThousandSeparator := '.';
    sXml := '';
    try
      sXml := sXml + '<'+'SENTENCIA'+'>';
      while not qry.Eof do
      begin
        for i:=0 to qry.Fields.Count - 1 do
        begin
          if ((qry.Fields[i].DataType = ftDate) or (qry.Fields[i].DataType = ftDateTime)) then
            if  not (qry.Fields[i].AsString = '')   then
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.0000000-03:00', qry.Fields[i].AsDateTime)+'</'+qry.Fields[i].FieldName+'>'
            else
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+''+'</'+qry.Fields[i].FieldName+'>'
          else
            if (qry.Fields[i].DataType = ftFloat)then
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+FormatFloat('0.00', qry.Fields[i].AsFloat,format)+'</'+qry.Fields[i].FieldName+'>'
            else
              sXml :=sXml +'<'+qry.Fields[i].FieldName+'>'+qry.Fields[i].AsString+'</'+qry.Fields[i].FieldName+'>';
        end;
        qry.Next;
      end;
      sXml := sXml + '</'+'SENTENCIA'+'>';
    finally
      qry.free;
      result:= sXml;
    end;
    //LogMessage('sumaSentencia - Finalizo',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('sumaSentencia - Desconecto',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ObtenerChequesDisponible(Abogado: String;pag:Integer): WideString;
var
  strqry,sXml: WideString;
  idAbogado : Integer;
  generico : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerChequesDisponible - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    idAbogado := dmConn.ValorSql(' SELECT NU_IDABOGADO '+
                          '   FROM legales.lnu_nivelusuario '+
                          '  WHERE nu_usuario = UPPER('+SqlValue(Abogado)+')');
    generico :=  dmConn.ValorSql(' SELECT nu_usuariogenerico '+
                          '   FROM legales.lnu_nivelusuario '+
                          '  WHERE nu_usuario = UPPER('+SqlValue(Abogado)+')');

    //LogMessage('ObtenerChequesDisponible - Despues de los valor SQL ',EVENTLOG_INFORMATION_TYPE,0,0);

    strqry:=
      ' SELECT   ce_fechacheque fecha, ce_numero cheque, ce_monto importe, '+
      '          ce_beneficiario beneficiario, ce_id,  ce_ordenpago ordenpago '+
      '     FROM rce_chequeemitido '+
      '    WHERE ce_id IN(SELECT pl_idchequeemitido '+
      '                     FROM legales.ljt_juicioentramite, legales.lpl_pagolegal '+
      '                    WHERE jt_id = pl_idjuicioentramite '+
      '                      AND (jt_idabogado = '+SqlValue(idAbogado)+
      '                      OR ''S'' = '+SqlValue(generico) +')'+
      '                   UNION '+
      '                   SELECT pm_idchequeemitido '+
      '                     FROM legales.lme_mediacion, legales.lpm_pagomediacion '+
      '                    WHERE me_id = pm_idmediacion '+
      '                      AND (me_idabogado = '+SqlValue(idAbogado)+
      '                      OR ''S'' = '+SqlValue(generico) +')' +')'+
      '      AND ce_estado = ''01'' '+
      '      AND ce_situacion IN(''01'', ''14'',''19'') ' +
      '      AND ce_cuenta IS NULL ' +
      '      AND ce_debitado = ''N''' +
      ' ORDER BY 1, 2 ';

    sXml := '';
    sXml:=CrearXmlTabla('RCE_CHEQUEEMITIDO','dtsChequesDisponibles', 'http://www.changeme.now/dtsChequesDisponibles.xsd',strqry,pag);
    result:= sXml;
    //LogMessage('ObtenerChequesDisponible - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('ObtenerChequesDisponible - Desconecto ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ObtenerChequeDetalle(idCheque: String;pag:Integer): WideString;
var
  strqry,sXml: WideString;
begin
  //LogMessage('ObtenerChequeDetalle - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT ''JUICIO'' tipo, jt_numerocarpeta numero, cp_denpago conpago, '+
    '        jt_demandante demandante, jt_demandado demandado, '+
    '        NVL(pl_importepago, 0) + NVL(pl_importeconretencion, 0) importe '+
    '   FROM art.scp_conpago, legales.lbo_abogado, legales.ljt_juicioentramite, '+
    '        legales.lpl_pagolegal '+
    '  WHERE jt_id = pl_idjuicioentramite '+
    '    AND bo_id = jt_idabogado '+
    '    AND pl_conpago = cp_conpago '+
    '    AND pl_idchequeemitido = '+SqlValue(idCheque)+
    ' UNION '+
    ' SELECT ''MEDIACIÓN'' tipo, me_numerofolio numero, cp_denpago conpago, '+
    '        me_demandante demandante, me_demandado demandado, '+
    '        NVL(pm_importepago, 0) + NVL(pm_importeconretencion, 0) importe '+
    '   FROM art.scp_conpago, legales.lbo_abogado, legales.lme_mediacion, '+
    '        legales.lpm_pagomediacion '+
    '  WHERE me_id = pm_idmediacion '+
    '    AND bo_id = me_idabogado '+
    '    AND pm_conpago = cp_conpago '+
    '    AND pm_idchequeemitido = '+SqlValue(idCheque);

  sXml := '';
  sXml:=CrearXmlTabla('DETALLECHEQUE','dtsDetalleCheque', 'http://www.changeme.now/dtsDetalleCheque.xsd',strqry,pag);
  result:= sXml;
  //LogMessage('ObtenerChequeDetalle - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerChequeCantidad(Abogado: String): WideString;
var
  strqry,sXml: WideString;
  idAbogado : Integer;
  generico : String;
  dmConn: TdmPrincipal;
begin
  //LogMessage('ObtenerChequeCantidad - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  dmConn := TdmPrincipal.Create(nil);
  try
    idAbogado := dmConn.ValorSql(' SELECT NU_IDABOGADO '+
                          '   FROM legales.lnu_nivelusuario '+
                          '  WHERE nu_usuario = UPPER('+SqlValue(Abogado)+')');
    generico :=  dmConn.ValorSql(' SELECT nu_usuariogenerico '+
                          '   FROM legales.lnu_nivelusuario '+
                          '  WHERE nu_usuario = UPPER('+SqlValue(Abogado)+')');
    //LogMessage('ObtenerChequeCantidad - Despues de los valor Sql ',EVENTLOG_INFORMATION_TYPE,0,0);

    strqry:=
      ' SELECT /*+RULE*/ COUNT(*) cantcheque '+
      '   FROM rce_chequeemitido '+
      '  WHERE ce_id IN(SELECT pl_idchequeemitido '+
      '                   FROM legales.ljt_juicioentramite, legales.lpl_pagolegal '+
      '                  WHERE jt_id = pl_idjuicioentramite '+
      '                     AND (jt_idabogado = '+SqlValue(idAbogado)+
      '                      OR ''S'' = '+SqlValue(generico) +')'+
      '                 UNION '+
      '                 SELECT pm_idchequeemitido '+
      '                   FROM legales.lme_mediacion, legales.lpm_pagomediacion '+
      '                  WHERE me_id = pm_idmediacion '+
      '                     AND (me_idabogado = '+SqlValue(idAbogado)+
      '                      OR ''S'' = '+SqlValue(generico) +')' +')'+
      '    AND ce_estado = ''01'' ' +
      '    AND ce_cuenta IS NULL ' +
      '    AND ce_debitado = ''N''' +
      '    AND ce_situacion IN(''01'', ''14'',''19'') ';

    sXml := '';
    sXml:=CrearXml1('CHEQUECANTIDAD',strqry);
    result:= sXml;
    //LogMessage('ObtenerChequeCantidad - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
  finally
    dmConn.Free;
    //LogMessage('ObtenerChequeCantidad - Desconecto ',EVENTLOG_INFORMATION_TYPE,0,0);
  end;
end;

function TSyncSrv.ObtenerMontoDemandadoObligatorio(idreclamo : String): WideString;
var
  strqry,sXml: WideString;
begin
  //LogMessage('ObtenerMontoDemandadoObligatorio - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT NVL(tr_requiereimporte, ''N'') requiereimporte'+
    '   FROM legales.ltr_tiporesultadosentencia '+
    '  WHERE tr_id = '+SqlValue(idreclamo);

  sXml := '';
  sXml:=CrearXml1('OBLIGATORIO',strqry);
  result:= sXml;
  //LogMessage('ObtenerMontoDemandadoObligatorio - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerEsFederal(idjuicio: String): WideString;
var
  strqry,sXml: WideString;
begin
  //LogMessage('ObtenerEsFederal - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT jt_federal FEDERAL'+
    '   FROM legales.ljt_juicioentramite '+
    '  WHERE jt_id = '+SqlValue(idjuicio);

  sXml := '';
  sXml:=CrearXml1('ESFEDERAL',strqry);
  result:= sXml;
  //LogMessage('ObtenerEsFederal - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerIncapacidadVisible(idjuicio : String): WideString;
var
  strqry,sXml: WideString;
begin
  //LogMessage('ObtenerIncapacidadVisible - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' select nvl((SELECT DISTINCT ''S'' '+
    '   FROM legales.lrc_reclamo, legales.lrt_reclamojuicioentramite '+
    '  WHERE rc_reclamaincapacidad = ''S'' '+
    '    AND rt_idreclamo = rc_id '+
    '    AND rt_idjuicioentramite = '+SqlValue(idjuicio) +'), ''N'')visible FROM DUAL';

  sXml := '';
  sXml:=CrearXml1('INCAPACIDAD',strqry);
  result:= sXml;
  //LogMessage('ObtenerIncapacidadVisible - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerAnioValidoExpediente(anioExpediente : String): WideString;
var
  strqry,sXml: WideString;
begin
  //LogMessage('ObtenerAnioValidoExpediente - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    ' SELECT nvl((SELECT ''S'' valido '+
    '   FROM DUAL '+
    '  WHERE TO_CHAR(art.actualdate, ''YY'') >= '+SqlValue(anioExpediente)+
    '     OR '+SqlValue(anioExpediente)+' > 96),''N'') VALIDO FROM DUAL ';

  sXml := '';
  sXml:=CrearXml1('VALIDO',strqry);
  result:= sXml;
  //LogMessage('ObtenerAnioValidoExpediente - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerPeritosNombre(Nombre, tipoPericia : String): WideString;
var
  strqry,sXml: WideString;
begin
  //LogMessage('ObtenerPeritos - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    '   SELECT pe_nombreindividual || '' '' || pe_apellido nombre, pe_id ID '+
    '     FROM legales.lpe_perito '+
    '    WHERE UPPER(pe_nombreindividual) LIKE UPPER(''%'+Nombre+'%'') '+
    '      AND pe_fechabaja IS NULL ';

  if tipoPericia <> '' then
    strqry := strqry + ' AND pe_idtipoperito = '+ SqlValue(tipoPericia);

  strqry := strqry +' ORDER BY 1 ';
  

  sXml := CrearXml2('PERITOS','PERITO',strqry);
  Result := sXml;
  //LogMessage('ObtenerPeritos - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.ObtenerPeritosApellido(Apellido, tipoPericia : String): WideString;
var
  strqry,sXml: WideString;
begin
  //LogMessage('ObtenerPeritos - Inicio ',EVENTLOG_INFORMATION_TYPE,0,0);
  strqry:=
    '   SELECT pe_nombreindividual || '' '' || pe_apellido nombre, pe_id ID '+
    '     FROM legales.lpe_perito '+
    '    WHERE UPPER(PE_APELLIDO) LIKE UPPER(''%'+Apellido+'%'') '+
    '      AND pe_fechabaja IS NULL ';
  if tipoPericia <> '' then
    strqry := strqry + ' AND pe_idtipoperito = '+ SqlValue(tipoPericia);

  strqry := strqry +' ORDER BY 1 ';

  sXml := CrearXml2('PERITOS','PERITO',strqry);
  Result := sXml;
  //LogMessage('ObtenerPeritos - Finalizo ',EVENTLOG_INFORMATION_TYPE,0,0);
end;

function TSyncSrv.VerificarConexion: boolean;
//var
//  i: integer;
//  s: string;
begin
  result := true;

(*  try
    s:='1';
    dmPrincipal := TdmPrincipal.Create(nil);
    s:=s+'4';
//    i:= ValorSqlInteger('SELECT 1 FROM DUAL');
    result := dmPrincipal.sdbPrincipal.Connected;
  except
    on E: Exception do
    begin
      s := s+e.Message;
      raise Exception.Create('Error de Conexión! ' + e.message + ' >> ' + s);
      result :=false;
    end;
  end;
*)
end;

procedure TSyncSrv.CerrarConexion;
begin
//  if Assigned(dmPrincipal) then
//    FreeAndNil(dmPrincipal);
end;


procedure TSyncSrv.LogMessage(Message: String; EventType: DWord;
  Category: Word; ID: DWord);
var
  P: Pointer;
//  USID: TUserSID;
  FEventLog : LongWord;
begin
  P := PChar(Message);
  FEventLog := windows.RegisterEventSource(nil, PChar('Synsrv')); // <- blows up here
  if FEventLog = 0 then
  begin
    Raise exception.Create('Event logging error: ' + SysErrorMessage(getLastError));
  end;
//  USID := GetCurrentUserSid();
//  try
  if not ReportEvent(FEventLog, EventType, Category, ID, nil, 1, 0, @P, nil) then
    raiseLastOSError;
  //finally
  //  FreeAndNil(USID);
//  end;
end;

function TSyncSrv.ObtenerNroCarpeta(idJuicio : String): WideString;
var
  strqry,sXml: WideString;
begin
  strqry:=
    ' SELECT jt_numerocarpeta, NVL(jt_demandante, '''') || '' C/ '' || NVL( '+
    '        jt_demandado, '''') || '' '' || jt_caratula AS descripcaratula, ej_descripcion '+
    '   FROM legales.ljt_juicioentramite, legales.lej_estadojuicio '+
    '  WHERE jt_id = '+sqlvalue(idJuicio)+
    '    AND jt_idestado = ej_id ';

  sXml := '';
  sXml:=CrearXml1('JUICIO',strqry);
  result:= sXml;
end;

function TSyncSrv.ObtenerListadoTabla(bActivos, bTerminados : Boolean; nomusuario : String): WideString;
var
  strqry,salida: WideString;
  qry: TSDQuery;
  dmConn: TdmPrincipal;
  cant :Integer;
begin
  strqry:=
            ' SELECT ''<td>'' || nvl(TO_CHAR(jt_numerocarpeta), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(jt_fechanotificacionjuicio), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(ej_descripcion), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(jt_demandante), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(jt_demandado), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(jt_nroexpediente), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(jt_anioexpediente), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(ju_descripcion), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(fu_descripcion), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(jz_descripcion), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(sc_descripcion), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(jt_fechafinjuicio), ''&nbsp;'') || ''</td>'' || '+
            '        ''<td>'' || nvl(TO_CHAR(bo_nombreindividual), ''&nbsp;'') || '' '' || nvl(TO_CHAR(bo_apellido), ''&nbsp;'') || ''</td>'' campos '+
            '   FROM legales.ljt_juicioentramite, legales.lej_estadojuicio, legales.lju_jurisdiccion, legales.lfu_fuero, '+
            '        legales.ljz_juzgado, legales.lsc_secretaria, legales.lbo_abogado, legales.lnu_nivelusuario '+
            '  WHERE jt_idestado = ej_id '+
            '    AND jt_idjurisdiccion = ju_id '+
            '    AND (jt_idabogado = nu_idabogado OR nu_usuariogenerico = ''S'') '+
            '    AND jt_idfuero = fu_id '+
            '    AND jt_idjuzgado = jz_id '+
            '    AND jt_idsecretaria = sc_id '+
            '    AND jt_idabogado = bo_id '+
            '    AND jt_idestado <> 3 '+
            '    AND jt_estadomediacion = ''J'' '+
            '    AND ROWNUM <= 2400 '+
            '    AND nu_usuario = '+SqlValue(nomusuario);
  if not (bActivos and bTerminados) then
  begin
    if bTerminados then
      strqry := strqry +' AND jt_idestado = 2';
    if bActivos then
      strqry := strqry +' AND jt_idestado <> 2';
  end;
   strqry := strqry +' ORDER BY jt_numerocarpeta';


  dmConn := TdmPrincipal.Create(nil);
  try
    qry:= dmConn.GetQuery(strqry);
    cant := qry.RecordCount;
    salida := '';
    try
      while not qry.Eof do
      begin
        salida := salida +'<tr>'+qry.FieldByName('campos').AsString+'</tr>';
        qry.Next;
      end;
    finally
      qry.free;
    end;
  finally
    dmConn.Free;
  end;



  salida :=
    //' <html> <head> '+
    //' <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/> '+
    //' <title>Listado Juicios</title> '+
    //'   <link href="Estilos/legales.css" type="text/css" rel="stylesheet"/>'+
    //'   <link href="Estilos/formularios.css" type="text/css" rel="stylesheet"/>  '+
    //'   <link href="Estilos/textos.css" type="text/css" rel="stylesheet"/>  '+
    //' </head> '+
    //' <body> '+
    //'   <table cellspacing="0" cellpadding="0" width="90%" align="center" class="body_border"> '+
    //'   <tr> '+
    //'     <td> '+
    //'       <table cellspacing="0" cellpadding="0" width="100%" align="center" class="body_border"> '+
    //'       <tr> '+
    //'         <td height="70" colspan="12"> '+
    //'           <img src="imagenes/logo_provart_fondo_blanco.jpg" align="right" width="213" height="52"/> '+
    //'         </td> '+
    //'       </tr> '+
    //'       </table> '+
    //'     </td> '+
    //'   </tr> '+
    //'   <tr> '+
    //'     <td> '+
    '       <table cellpadding=''3'' > '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    '       <tr height= ''200px''> <td >&nbsp; </td> </tr> '+
    IIF(cant = 2400,'<tr> <td style= ''color:red''>Este Listado esta acotado a 2400 registros </td> </tr> ','')+
    '       </table> '+
    '       <font size=''1px''>'+
    '       <table cellpadding=''3'' border=''1'' style=''text-align:center''> '+
    '       <tr> '+
    '         <td style=''font-weight:bold''>JD Nº</td> '+
    '         <td style=''font-weight:bold''>Fecha Notificación</td> '+
    '         <td style=''font-weight:bold''>Estado</td> '+
    '         <td style=''font-weight:bold''>Demandante</td> '+
    '         <td style=''font-weight:bold''>Demandado</td> '+
    '         <td style=''font-weight:bold''>Epdte Nº</td> '+
    '         <td style=''font-weight:bold''>Año Nº</td> '+
    '         <td style=''font-weight:bold''>Jurisdicción</td> '+
    '         <td style=''font-weight:bold''>Fuero</td> '+
    '         <td style=''font-weight:bold''>Juzgado Nº</td> '+
    '         <td style=''font-weight:bold''>Secretaría</td> '+
    '         <td style=''font-weight:bold''>Fecha Fin</td> '+
    '         <td style=''font-weight:bold''>Estudio</td> '+

    '       </tr> '+Salida+
    '       </table> '+
    '       </font>';
    //'     </td> '+
    //'   </tr> '+
    //'   </table> ';
    //' </body> '+
    //' </html> ';

  result:= salida;
end;


initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TSyncSrv);

end.
