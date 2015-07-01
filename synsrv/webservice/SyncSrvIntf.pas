{ Invokable interface ISyncSrv }

unit SyncSrvIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, Classes, SysUtils;

type

  { Invokable interfaces must derive from IInvokable }
  ISyncSrv = interface(IInvokable)
  ['{53493B2C-6454-4F2A-B8D2-9FB2C63610D8}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
    function ObtenerListaJuiciosEnTramite(pag, idusuario :Integer; caratula,nrocarpeta, nombreabo, nroexpediente, tipoJuicio :String): WideString; stdcall;
    function ObtenerListaJuiciosEnTramiteParteActora(pag:Integer; nombre, caratula,nrocarpeta, nombreabo, nroexpediente, tipoJuicio :String): WideString; stdcall;
    function ObtenerConcursosyQuiebras(pag:Integer; NroOrden, cmbRSocial, Cuil, estudio:String): WideString;stdcall;
    function ObtenerDatosDeJuicio(nrojuicio, idestudio, usuarioweb: String): WideString;stdcall;
    function ObtenerDatosCYQ(nroorden: String): WideString;stdcall;
    function ObtenerEventosCYQ(pag :integer ;nroorden: String): WideString;stdcall;
    function ObtenerAcuerdos(pag :integer;nroorden, filtro: String): WideString;stdcall;
    function ObtenerAcuerdosMod(nroorden: String): WideString;stdcall;
    function ObtenerEmpresa(Cuil : String): WideString; stdcall;
    function ObtenerMontosCYQ(nroorden: String): WideString;stdcall;
    function ObtenerEstado(codigo :String):WideString;stdcall;
    function ObtenerDemandas(nrojuicio: String): WideString;stdcall;
    function ObtenerReclamos(nrojuicio: String): WideString;stdcall;
    function ObtenerImporte(pj_idjuicioentramite, instancia:String; pag: integer):WideString;stdcall;
    function ObtenerImportesABM(ir_id: String): WideString;stdcall;
    function ObtenerLiquidacionFinal(nrojuicio: String): WideString;stdcall;
    function ExisteLiquidacion(nrojuicio: String): WideString;stdcall;
    function ObtenerInstancias(pj_idjuicioentramite:String) :WideString;stdcall;
    function ObtenerInstanciaParaSentencia(pj_idjuicioentramite:String):WideString;stdcall;
    function ObtenerMasDatosJuicios(nrojuicio: String): WideString;stdcall;
    function ObtenerPeritajes(nrojuicio: String;pag:Integer): WideString;stdcall;
    function ObtenerMedidaCautelarABM(MC_ID: String): WideString;stdcall;
    function ObtenerPeritajesABM(pj_id: String): WideString;stdcall;
    function ObtenerMedidasCautelares(pag: integer; nrojuicio: String): WideString;stdcall;
    function ObtenerEventos(pag: integer; nrojuicio: String): WideString;stdcall;
    function ObtenerSentencia(nrojuicio: String): WideString;stdcall;
    function ObtenerTipoResultadoSentencia(seleccionado : Integer): WideString;stdcall;
    function ObtenerTipoResultadoSentenciaActora(seleccionado : integer): WideString;stdcall;    
    function ObtenerResultado(nrojuicio: String): WideString;stdcall;
    function ObtenerReclamoABM(Id_Reclamo: String): WideString;stdcall;
    function ObtenerParam(clave: String): WideString;stdcall;
    function ObtenerSiniestros(pag :integer; origendemanda: String):WideString;stdcall;
    function ObtenerEventosABM(et_id: String): WideString;stdcall;
    function ObtenerEventosCYQABM(nroorden, nroevento: String): WideString;stdcall;
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
    function CargarJurisdiccion(idjurisdiccion : Integer) :WideString;stdcall;
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
    function UpdateEventos(et_id, usuario : string): Boolean;stdcall;
    procedure UpdateEventosCYQ(nroorden, nroevento, usuario : string);stdcall;
    function ObtenerAcuerdosABM(nroorden, nropago: String): WideString;stdcall;
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
    procedure UpdateMasDatosJuicios(txtDomicilio, txtTelefonos, txtFax, txtEmail, usuario, idjuicio : string);stdcall;    function sumaHonorarios(nrojuicio,instancia: String): WideString;stdcall;
    function sumaIntereses(nrojuicio,instancia: String): WideString;stdcall;
    function sumaTasas(nrojuicio,instancia: String): WideString;stdcall;
    function sumaCapital(nrojuicio,instancia: String): WideString;stdcall;
    function sumaSentencia(nrojuicio,instancia: String):WideString;stdcall;
    function ObtenerGastosTasasDeJusticia(nrojuicio: String): WideString;stdcall;
    function ObtenerGastosEmbargos(nrojuicio: String): WideString;stdcall;
    function ObtenerGastosOtros(nrojuicio: String): WideString;stdcall;
    function ObtenerNroCarpeta(idJuicio : String): WideString;stdcall;
    function ObtenerListadoTabla(bActivos, bTerminados : Boolean; nomusuario : String): WideString; stdcall;
  end;

implementation


initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(ISyncSrv));
//  RemClassRegistry.RegisterXSInfo(TypeInfo(TStringArray), 'urn:SyncSrvIntf', 'TStringArray');
//  RemClassRegistry.RegisterXSClass(TTablaSync, 'urn:SyncSrvIntf', 'TTablaSync');
//  RemClassRegistry.RegisterXSInfo(TypeInfo(TTablasListSync), 'urn:SyncSrvIntf', 'TTablasListSync');

  end.
