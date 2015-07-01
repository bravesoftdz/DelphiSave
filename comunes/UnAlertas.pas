unit unAlertas;

interface

uses
	Classes, Contnrs, Controls, math, DateUtils, DateTimeFuncs, IArtMail, SDEngine, AnsiSql, artDbLogin, Graphics, RxMemDS,
  DB, General, unLogs, ComCtrls, syncobjs, RxRichEd, extctrls, unDirUtils, unAlertaTypes, unImpoExpoTypes, windows,
  unComunesMail, SDOra, unART;

type
	//Forward Declarations
	TAlertas    = class;
	TAlerta     = class;
	TDestinos   = class;
	TDestino    = class;
	TAcciones   = class;
	TAccion     = class;
	TEventos    = class;
	TEvento     = class;
	TCampos     = class;
	TCampo      = class;
	TParametros = class;
	TParametro  = class;
	TProgramacion = class;
	TPrograma   = class;

{
  TMailer = class(TJclEmail)
    procedure SendMail(Destinatarios : TDestinos; Adjuntos : TStrings; Motivo,Cuerpo : string;
                           Html,Dialogo : boolean);
  end;
}

	TAlerta = class
	private
		FAcciones: TAcciones;
		FActivo: Boolean;
    FAnexa: Boolean;
		FCodigo: ShortString;
		FDescripcion: ShortString;
		FDestinos: TDestinos;
    FEjecutarInmediatamente: Boolean;
		FId: integer;
//		FMailer   : TMailer;
    FMensaje: String;
    FMotivoMensaje: String;
		FOwner: TAlertas;
    FParametros: TParametros;
		FProgramacion: TProgramacion;
		FPropietario: String;
    FPropietarioMail: String;
		FProximaEjecucion: TDateTime;
		FRecargar: Boolean;
		FTrigger: TTimer;

		function GetEventLog: TLogs;

		procedure ActualizarAlerta;
		procedure ActualizarProximaEjecucion(Intervalo: Int64);
		procedure AlertaTimer(Sender: TObject);
    procedure DesetearEjecutarInmediatamente(AIdAlerta: Integer);
		procedure EjecutarAlerta;
		procedure ProcesarAccionesAlerta(AIdAlerta: Integer);
    {$HINTS OFF}
    procedure ProcesarMensajeAlerta;
    {$HINTS ON}
		procedure SetearProgramacionActualizada(AIdAlerta: Integer);
//    procedure SetMailer(const Value: TMailer);
    procedure SetMensaje(const Value: String);
    procedure SetMotivoMensaje(const Value: String);
		procedure SetOwner(const Value: TAlertas);
		procedure SetProgramacion(const Value: TProgramacion);
		procedure SetProximaEjecucion(const Value: TDateTime);
	public
		property Activo: Boolean read FActivo;
    property Anexa: Boolean read FAnexa write FAnexa;
		property Codigo: ShortString read FCodigo;
		property Descripcion: ShortString read FDescripcion;
		property Destinos: TDestinos read FDestinos;
		property Id: Integer read FId;
    property LogEvent: TLogs read GetEventLog;
//    property Mailer : TMailer read FMailer write SetMailer;    
    property Mensaje: String read FMensaje write SetMensaje;
    property MotivoMensaje: String read FMotivoMensaje write SetMotivoMensaje;
		property Owner: TAlertas read FOwner write SetOwner;
    property Parametros: TParametros read FParametros;
		property Programacion: TProgramacion read FProgramacion write SetProgramacion;
    property Propietario: String read FPropietario;
    property PropietarioMail: String read FPropietarioMail;
		property ProximaEjecucion: TDateTime read FProximaEjecucion write SetProximaEjecucion;
		property Recargar: Boolean  read FRecargar;
  public
    constructor Create(AOwner: TAlertas; AIdAlerta: Integer);
    destructor  Destroy; override;
	end;

	TAlertas = class(TObjectList)
	private
		FCs 			: TCriticalSection;
		FLoading 	: Boolean;
    FLogEvent : TLogs;    
		FLogin 		: TDBLogin;
		FOnRefresh: TNotifyEvent;
    FOnService: Boolean;
    FOwner    : TComponent;
		FTrigger 	: TTimer;

		function GetAlertas(Index: Integer): TAlerta;
    function VerificaConexion: Boolean;

    procedure FreeAlertaById(AId: Integer);
//		procedure InitAlertas;
		procedure RefreshTimersTimer(Sender: TObject);
		procedure ReloadProcesses;
   	procedure SetearProgramacionError(AIdAlerta: Integer);
		procedure SetLogin(const Value: TDBLogin);
		procedure SetOnRefresh(const Value: TNotifyEvent);
	public
		constructor Create(AOwner: TComponent);
    destructor Destroy; override;

		property Alertas[Index: Integer]: TAlerta read GetAlertas;
		property LogEvent: TLogs read FLogEvent;
		property Login: TDBLogin read FLogin write SetLogin;
		property OnRefresh: TNotifyEvent read FOnRefresh write SetOnRefresh;
    property OnService: Boolean read FOnService  write FOnService;
    property Refresh: TTimer read FTrigger write FTrigger;
	end;

	TDestino = class
		FCorreo: String;
		FId: Integer;
    FNombreLargo: String;
		FUsuario: String;
  public
    constructor Create(AId: Integer; const AUsuario, ACorreo, ANombre: String);
    destructor Destroy; override;

    property Correo: String read FCorreo write FCorreo;
    property Id: Integer read FId write FId;
    property NombreLargo: String read FNombreLargo write FNombreLargo;
    property Usuario: String read FUsuario write FUsuario;    
	end;

	TDestinos = class(TObjectList)
		 FAlerta : TAlerta;
	private
		function GetDestino(Index: Integer): TDestino;
	public
		 constructor Create(AAlerta: TAlerta);

		 property Destino[Index: Integer]: TDestino read GetDestino;
	end;

	TAccion = class
  	FOwner: TAcciones;
		FId: Integer;
		FDescripcion: String;
		FSql: String;
		FLog: Boolean;
		FTipoAccion: String;
		FParametros: TParametros;
		FEventos: TEventos;
		FCampos: TCampos;
		FProceso: Integer;
    FRegistrosSuspendeAccion: Integer;
    FMotivoMensaje: String;
    FAnexa: Boolean;
	private
    FDirectorioExportacion: String;
    FDirectorioImportacion: String;
    FDirectorioImportacionProcesada: String;
    FAdjuntaArchivoImpoExpo: Boolean;
    FListaDestinatariosPorAccion: TStrings;

		function ExpoFiles(AIdProceso: Integer): String;
    function GetAlerta: TAlerta;
		function GetFuenteDatos: TSDQuery;

		procedure SendFiles(APath: String);
		procedure EnviarArchivosEnDirectorio(const APath, ADestino: String);
		procedure Procesar;
    procedure ProcesarEventos(AMomento: TMomentoAccion; ACampos: TFields);
    procedure SetMotivoMensaje(const Value: String);
    procedure ProcesarMensajeAccion(AMailDestino: String = '');
    procedure ProcesarMensajeImpoExpo;
	public
		constructor Create(AOwner: TAcciones);
    destructor Destroy; override;
    
		procedure AddLogMessage(ADebugLevel: TDebugLevelType; const AMessage: String);
		procedure Ejecutar;

    property Owner: TAcciones read FOwner;
    property Alerta: TAlerta read GetAlerta;

		property Id: Integer read FId write FId;
    property Descripcion: String read FDescripcion write FDescripcion;
    property Sql: String read FSql write FSql;
    property Log: Boolean read FLog write FLog;
    property TipoAccion: String read FTipoAccion write FTipoAccion;
    property Parametros: TParametros read FParametros write FParametros;
    property Eventos: TEventos read FEventos write FEventos;
    property Campos: TCampos read FCampos write FCampos;
    property Proceso: Integer read FProceso write FProceso;
    property RegistrosSuspendeAccion: Integer read FRegistrosSuspendeAccion write FRegistrosSuspendeAccion;
    property MotivoMensaje: String read FMotivoMensaje write SetMotivoMensaje;
    property AdjuntaArchivoImpoExpo: Boolean read FAdjuntaArchivoImpoExpo write FAdjuntaArchivoImpoExpo;
    property DirectorioExportacion: String read FDirectorioExportacion write FDirectorioExportacion;
    property DirectorioImportacion: String read FDirectorioImportacion write FDirectorioImportacion;
    property DirectorioImportacionProcesada: String read FDirectorioImportacionProcesada write FDirectorioImportacionProcesada;
    property ListaDestinatariosPorAccion: TStrings read FListaDestinatariosPorAccion write FListaDestinatariosPorAccion;

    property Anexa: Boolean read FAnexa write FAnexa;
	end;

	TAcciones = class(TObjectList)
		 FAlerta: TAlerta;
	private
		function GetAccion(Index: Integer): TAccion;
	 public
   	constructor Create(AAlerta: TAlerta);

		procedure Ejecutar;

		property Alerta: TAlerta read FAlerta;
		property Acciones[Index: Integer]: TAccion read GetAccion;
	end;

	TEventos = class(TObjectList)
 	  FAccion: TAccion;
  private
    function GetEvento(Index: Integer): TEvento;
	public
 	  constructor Create(AAccion: TAccion);

    property Eventos[Index: Integer]: TEvento read GetEvento;
    property Accion: TAccion read FAccion;
	end;

	TEvento = class
		FOwner       : TEventos;
		FOrden       : integer;
		FMomento     : TMomentoAccion;
		FAccionError : String;
		FTipoAccion  : String;
		FSql         : String;
		FScript      : String;
    FMensaje     : String;
    FDestinatario: String; //Campo de la FD que contiene el destinatario
		FParametros  : Boolean; //si usa los parámetros asignados.
  private
    FFields      : TFields;
    FQuery       : TSDQuery;
{$IFDEF SCRIPTING}
    procedure ProcesarScript;
{$ENDIF}

    function ArmarMensaje(AFields: TFields): String;
    function GetParametrosAlerta: TParametros;
    function GetParametrosEvento: TParametros;
    function GetMensajeAlerta: WideString;
    
    procedure ProcesarSQL;
    procedure ProcesarMensaje;
    procedure ArmarConsulta(AQuery: TSDQuery; AFields: TFields);
    procedure Preparar;
    procedure SetAccionError(const Value: String);
    procedure SetMensaje(const Value: String);
    procedure SetMomento(const Value: TMomentoAccion);
    procedure SetOrden(const Value: Integer);
    procedure SetOwner(const Value: TEventos);
    procedure SetParametros(const Value: Boolean);
    procedure SetScript(const Value: String);
    procedure SetSql(const Value: String);
    procedure SetTipoAccion(const Value: String);
    procedure SetMensajeAlerta(const Value: WideString);
    procedure SetearDestinatario(var Mensaje: String; const Destinatario: String);
    procedure SetDestinatario(const Value: String);
    procedure ReemplazarParametros(var SQL: String);

	public
		constructor Create(AOwner: TEventos);

    procedure Procesar(ACampos: TFields);
    
    property ParametrosAlerta: TParametros read GetParametrosAlerta;
    property MensajeAlerta: WideString read GetMensajeAlerta write SetMensajeAlerta;
    property ParametrosEvento: TParametros read GetParametrosEvento;

		property Owner       : TEventos read FOwner write SetOwner;
		property Orden       : Integer read FOrden write SetOrden;
		property Momento     : TMomentoAccion read FMomento write SetMomento;
		property AccionError : String read FAccionError write SetAccionError;
		property TipoAccion  : String read FTipoAccion write SetTipoAccion;
		property Sql         : String read FSql write SetSql;
		property Script      : String read FScript write SetScript;
    property Mensaje     : String read FMensaje write SetMensaje;
    property Destinatario: String read FDestinatario write SetDestinatario; //Campo de la FD que contiene el destinatario
		property Parametros  : Boolean read FParametros write SetParametros; //si usa los parámetros asignados.
	end;

	TParametro = class
		FId: Integer;
		FCodigo: String;
		FDescripcion: String;
		FOrden: Integer;
		FTipo: String;
		FValor: String;
		FDefault: String;
    FOrigen: String;
  private
    procedure ObtenerOrigenParamametro;
  public
    constructor Create(ACodigo, ADescripcion, ATipo, AValor, ADefault, AOrigen: String);
	end;

	TParametros = class(TObjectList)
		FOwner: TObject;
  private
    function GetParametros(Index: Integer): TParametro;

    procedure SetParametros(Index: Integer; const Value: TParametro);
  public
		constructor Create(AOwner: TObject);

    property Parametros[Index: Integer]: TParametro read GetParametros write SetParametros;
	end;

	TCampo = class
		FId: Integer;
		FOrden: Integer;
		FNombre: String;
		FAncho: String;
		FTitulo: String;
	end;

	TCampos = class(TObjectList)
		FAccion: TAccion;
	public
		constructor Create(AAccion: TAccion);
	end;

	TProgramacion = Class(TObjectList)
		FAlerta: TAlerta;

		function GetProgramacionDescripta: String;
	private
		function GetProgramacion(Index: Integer): TPrograma;

		procedure SetProgramacion(Index: Integer; const Value: TPrograma);
	public
		constructor Create(AAlerta: TAlerta);

		function CalcularProximoIntervaloProgramado: Integer;

		property Alerta: TAlerta read FAlerta;
		property ProgramacionDescripta: String read GetProgramacionDescripta;
		property Programacion[Index: Integer]: TPrograma read GetProgramacion write SetProgramacion;
	end;

	TPrograma = Class
    FOwner: TProgramacion;
    FOrden: integer;
    FTipoProgramacion: String;
    FValor: Integer;
    FTipoFrencuencia: String;
    FDescFrecuencia: String;
    FUnidadDeFrecuencia: String;
    FFrecuencia: Integer;
    FFrecuenciaDesde: Integer;
    FFrecuenciaHasta: Integer;
    FProximaEjecucion: TDateTime;
	private
    class function CalcularMultiplicadorFrecuencia(TipoUnidadFrecuencia: String): Cardinal;
    class function GetProximoDiaProgramado(DiasProgramados: Integer; HoraProgramacionMS: Int64): Int64;
    class function GetProximaHoraProgramada(TipoFrecuencia: String; Frecuencia, Desde, Hasta: Integer;
    																				UnidadFrecuencia: String = 'M'): Int64;

		function GetDescripcionProgramacion: String;
		function CalcularProximaEjecucion: Int64;

		procedure ActualizarProximaEjecucion(Intervalo: Int64);
	public
		constructor Create(AOwner: TProgramacion);

		class function CalcularIntervalo(TipoProgramacion: String; Valor: Integer; TipoFrecuencia: String; Frecuencia, Desde,
    																 Hasta: Integer; UnidadFrecuencia: String = 'M'): Int64;

		property DescripcionProgramacion: String read GetDescripcionProgramacion;
	end;

const
	MILLISECONDASECOND     = 1000;
 	MILLISECONDSINANMINITE = 60 * MILLISECONDASECOND;
 	MILLISECONDSINANHOUR   = 60 * MILLISECONDSINANMINITE;
 	MILLISECONDSINADAY     = 24 * MILLISECONDSINANHOUR;
 	MILLISECONDSINAWEEK    =  7 * MILLISECONDSINADAY;

DefaultProfile = 'AvisosAutomaticos';

function ConcatenarHTML(const HTMLOriginal, HTMLAgregar: WideString): WideString;
function ConcatenarRTF(const RTFOriginal, RTFAgregar: WideString): WideString;
function ObtenerPosicionFinalRTF(const Pattern, RTFText: WideString; Offset: Integer): Integer;
function ObtenerPosicionAnclaRTF(const RTFText: WideString): Integer;
function QuitarUltimoPagrafo(const RTFText: WideString): WideString;
procedure EjecutarInmediatamente(IDAlerta: TTableID);

implementation

uses
	unDmPrincipal, SysUtils, unExpoImpoUtils, StrUtils, unEnvioMail, unMoldeEnvioMail, Internet;

var
  CSection: TCriticalSection;

{ TAlerta }

procedure EjecutarInmediatamente(IDAlerta: TTableID);
var
  sSql : string;
begin
	sSql := 'update cal_alerta ' +
            ' set al_proximaejecucion = ' +  SqlDateTime(MaxDateTime) + ', ' +
                ' al_ejecutardeinmediato = :inmediato, ' +
                ' al_programacionalterada = :alterada ' +
			    ' where al_id = :IdAlerta';
	EjecutarSqlEx(sSql, ['S', 'S', IDAlerta]);
end;

constructor TAlerta.Create(AOwner: TAlertas; AIdAlerta: Integer);
var
  //MensajeInactivo: String;
	Query: TSDQuery;
begin
	FOwner := AOwner;
  FParametros := TParametros.Create(Self);

	//Recuperta valores alerta
	Query := GetQuery('SELECT use.se_mail, cal_alerta.*' +
  									 ' FROM art.use_usuarios use, cal_alerta' +
                    ' WHERE al_id = ' + SqlInteger(AIdAlerta, True) +
                      ' AND al_usuario = se_usuario ' +
	                    ' AND al_fechabaja is null ');
	with Query do
	try
  	if RecordCount > 0 then
    begin
    	FId                 		:= FieldByName('al_id').AsInteger;
			FCodigo             		:= FieldByName('al_codigo').AsString;
			FDescripcion        		:= FieldByName('al_descripcion').AsString;
			FRecargar           		:= FieldByName('al_programacionalterada').AsBoolean;
			FActivo             		:= FieldByName('al_activo').AsString = SQL_TRUE;
			FProximaEjecucion   		:= FieldByName('al_proximaejecucion').AsDateTime;
			FPropietario 						:= FieldByName('al_usuario').AsString;
      FPropietarioMail        := FieldByName('se_mail').AsString;
      FMotivoMensaje      		:= FieldByName('al_motivomensaje').AsString;
      FAnexa              		:= FieldByName('al_anexa').AsString = SQL_TRUE;
			FDestinos           		:= TDestinos.Create(Self);
			FAcciones           		:= TAcciones.Create(Self);
			FProgramacion       		:= TProgramacion.Create(Self);
			FTrigger            		:= TTimer.Create(nil);
      FEjecutarInmediatamente := FieldByName('al_ejecutardeinmediato').AsString = SQL_TRUE;

//      AlertaTimer(Self);

// REACTIVAR ES PARA PRUEBA Pablo
      if  FActivo then
      begin
        FTrigger.OnTimer := AlertaTimer;
        if FEjecutarInmediatamente then
        begin
          FEjecutarInmediatamente := False;
          DesetearEjecutarInmediatamente(FId);
          AlertaTimer(self);
        end;
      end
      else
      begin
        if dmPrincipal.Debug then
          LogEvent.AddLogMessage(dlInformation, CRLF + 'El Alerta Nro. : ' + InttoStr(FID) + '- ' + FDescripcion + ', se encuentra desactivada.');
{
        MensajeInactivo := Format(MENSAJEDESACTIVADO, [FDescripcion]);
        IArtMail.EnviarMail(PropietarioMail, DefaultProfile,
        										'El Alerta Nro. : ' + InttoStr(FID) + ' se encuentra desactivada.', nil, MensajeInactivo,
                            taSMTP, DefaultProfile, False, False, True);
}                            
      end;

			FTrigger.Name := FieldByName('al_codigo').AsString;
			ActualizarAlerta;
		end
    else
    	raise Exception.create('Error al cargar alerta. Nro.' + Inttostr(AIdAlerta));
  finally
    Query.Free;
  end;
  
  FMensaje := '';
end;

destructor TAlerta.Destroy;
begin
  FTrigger.Enabled := False;
  FParametros.Free;
  FTrigger.Free;
  FDestinos.Free;
  FAcciones.Free;
  FProgramacion.Free;

  inherited;
end;

procedure TAlerta.EjecutarAlerta;
begin
	try
    BeginTrans(True);
    try
      ProcesarAccionesAlerta(FId);
      CommitTrans(True);
    except
      RollBack(True);
      Raise;
    end;
	finally
		ActualizarAlerta;
	end;
end;

procedure TAlerta.DesetearEjecutarInmediatamente(AIdAlerta: Integer);
var
  sSql: String;
begin
	sSql :=
  	'UPDATE cal_alerta' +
    	' SET al_ejecutardeinmediato = ''N''' +
    ' WHERE al_id = ' + SqlValue(AIdAlerta);
	EjecutarSql(sSql);
end;

{procedure TAlerta.SetearProgramacionAlterada(AIdAlerta : integer);
var
 sSql : string;
begin
	sSql := 'update cal_alerta ' +
								'set  al_programacionalterada = ''S'' ' +
								' where al_id = '  + SqlInteger(AIdAlerta, False);
	EjecutarSql(sSql);
end;
}

procedure TAlerta.AlertaTimer(Sender: TObject);
begin
  if FOwner.OnService then
  	CSection.Enter;

	try
    if dmPrincipal.Debug then
  		LogEvent.AddLogMessage(dlInformation, CRLF + 'Inicio Alerta: ' + Descripcion);
		FTrigger.Enabled := False;
    try
  		EjecutarAlerta;
      if dmPrincipal.Debug then
  	  	LogEvent.AddLogMessage(dlInformation, CRLF + 'Ejecución Correcta Alerta: ' + Descripcion);
    except
    	on E: Exception do
      begin
      	LogEvent.AddLogMessage(dlError, CRLF + 'Error al procesar la alerta. El error produjo el siguiente mensaje de error.' +
        																E.Message + CRLF + '. Enviando mensaje notificando a ' + Self.Propietario);
        EnviarMail(Self.PropietarioMail, DefaultProfile,'Error Alerta: ' +  FDescripcion , nil,
        					 Format(MENSAJEERROR, [FDescripcion + ' (' + FCodigo + ')', E.Message, Self.Propietario]), taSMTP, DefaultProfile,
                   False, False, True);
      end;
    end;
	finally
    if dmPrincipal.Debug then
  		LogEvent.AddLogMessage(dlInformation, CRLF + 'Fin Alerta: ' + Descripcion);
		FTrigger.Enabled := True;
		Owner.OnRefresh(Self);
    CSection.Leave;
	end;
end;

procedure TAlerta.ProcesarAccionesAlerta(AIdAlerta: Integer);
begin
	FAcciones.Ejecutar;
//  ProcesarMensajeAlerta;
// Se comenta la línea de arriba para que no envie emails duplicados..
end;

{$HINTS OFF}
procedure TAlerta.ProcesarMensajeAlerta;
var
	i: Integer;
 	Motivo: String;
begin
	try
  	if FMensaje <> '' then
    begin
    	if MotivoMensaje <> '' then
      	Motivo := MotivoMensaje
      else
      	Motivo := 'Alerta ' +  FDescripcion;

      for i := 0 to FDestinos.Count - 1 do
        SendByMailServer(FDestinos.Destino[i].FCorreo, DefaultProfile, Motivo, '', FMensaje,
                         False, False, True, '');
    end;
  finally
  	FMensaje := '';
  end;
end;
{$HINTS ON}

procedure TAlerta.ActualizarProximaEjecucion(Intervalo: Int64);
var
	ProximaEjecucion: TDateTime;
	sSql: String;
  year, month, day, hour, min, sec, msec: Word;
begin
	ProximaEjecucion := (Intervalo / 1000 / 60 / 60 / 24) + DBDateTime;
  DecodeDateTime(ProximaEjecucion, year, month, day, hour, min, sec, msec);
  ProximaEjecucion := EncodeDateTime(year, month, day, hour, min, 0, 0);
	sSql :=
  	'UPDATE cal_alerta' +
    	' SET al_proximaejecucion = :fechahora' +
    ' WHERE al_id = :id';
	EjecutarSqlEx(sSql, [TDateTimeEx.Create(ProximaEjecucion), FId]);

	FProximaEjecucion := ProximaEjecucion;
	SetearProgramacionActualizada(FId);
end;

procedure TAlerta.ActualizarAlerta;
begin
	try
  	FTrigger.Enabled := False;
		FTrigger.Interval := FProgramacion.CalcularProximoIntervaloProgramado;
    if dmPrincipal.Debug then
      LogEvent.AddLogMessage(dlInformation, CRLF + 'El Alerta N° ' + InttoStr(FID) + '- ' + FDescripcion + CRLF +
    	  																		'Próxima Ejecución:' +
                                            DateTimeToStr((FTrigger.Interval / 1000 / 60 / 60 / 24) + DBDateTime));
		ActualizarProximaEjecucion(FTrigger.Interval);
	finally
    FTrigger.Interval := FTrigger.Interval + 65000; (*Le sumo 65000 milisegundos para que el timer no corra antes de la fecha de prox. ejecucion*)
		FTrigger.Enabled := True;
	end;
end;

procedure TAlerta.SetearProgramacionActualizada(AIdAlerta: Integer);
var
	sSql: String;
begin
{
  if dmPrincipal.Debug then
    LogEvent.AddLogMessage(dlInformation, CRLF + 'Seteando Programación alterada.');
}    
	sSql :=
  	'UPDATE cal_alerta' +
    	' SET al_programacionalterada = ''N''' +
    ' WHERE al_id = ' + SqlInteger(AIdAlerta, False);
	EjecutarSql(sSql);
end;

procedure TAlerta.SetOwner(const Value: TAlertas);
begin
	FOwner := Value;
end;

procedure TAlerta.SetProximaEjecucion(const Value: TDateTime);
begin
	FProximaEjecucion := Value;
end;

procedure TAlerta.SetProgramacion(const Value: TProgramacion);
begin
	FProgramacion := Value;
end;

procedure TAlerta.SetMensaje(const Value: String);
begin
  FMensaje := Value;
end;

function TAlerta.GetEventLog: TLogs;
begin
	Result := Owner.LogEvent
end;

procedure TAlertas.FreeAlertaById(AId: Integer);
var
	i: Integer;
begin
	for i := 0 to Self.Count - 1 do
  	if Alertas[i].Id = AId then
    begin
     Alertas[i].Free;
     Self.Delete(i);
     Exit;
    end;
end;

procedure TAlerta.SetMotivoMensaje(const Value: String);
begin
	FMotivoMensaje := Trim(Value);
end;

{ TAccion }
procedure TAccion.Ejecutar;
var
  sPath: String;
begin
	if FTipoAccion = TA_IE then
  begin
  	sPath := ExpoFiles(FProceso);
		if FAdjuntaArchivoImpoExpo and (Trim(sPath) <> '') then
    	SendFiles(sPath)
    else
    	ProcesarMensajeImpoExpo;
	end
  else if FTipoAccion = TA_FD then
    Procesar;
end;

// Procesar Acciones tipo FD.
procedure TAccion.Procesar;
var
	sdqQuery: TSDQuery;
  sDestinatarioActual: String;
  bAnexaPorDestino, bCambioDestinatario, bSalir: Boolean;
  //objDestino: TDestino;
  //i: Integer;
begin
	sdqQuery := GetFuenteDatos;
  try
  	if sdqQuery.IsEmpty then
    	Exit;

    bAnexaPorDestino := (ListaDestinatariosPorAccion.Count > 0) and Anexa;
    bCambioDestinatario := True;

    (*
    for i := 0 to ListaDestinatariosPorAccion.Count - 1 do
    begin
      objDestino := TDestino.Create(0, '', ListaDestinatariosPorAccion[i], '');
      Alerta.Destinos.Add(objDestino);
    end;
    *)
    
    if not bAnexaPorDestino then
      ProcesarEventos(mDatasetBefore, nil);

    while not sdqQuery.Eof do
    begin
      if bAnexaPorDestino and Assigned(sdqQuery.FindField(Eventos.Eventos[0].Destinatario)) then
      begin
        bCambioDestinatario := sdqQuery.FieldByName(Eventos.Eventos[0].Destinatario).AsString <> sDestinatarioActual;
        sDestinatarioActual := sdqQuery.FieldByName(Eventos.Eventos[0].Destinatario).AsString;
      end;

      if bAnexaPorDestino and bCambioDestinatario then
        ProcesarEventos(mDatasetBefore, nil);

    	if sdqQuery.RecordCount <= FRegistrosSuspendeAccion then
      	ProcesarEventos(mRecordAfter, sdqQuery.Fields)
      else
      	raise Exception.Create(CRLF + 'Cantidad de registros excedida. Se ignora la acción: ' + FDescripcion +
        											 ' para el alerta ' + FOwner.Alerta.Descripcion);

      sdqQuery.Next;

      if bAnexaPorDestino and Assigned(sdqQuery.FindField(Eventos.Eventos[0].Destinatario)) then
      begin
        bCambioDestinatario := (sdqQuery.FieldByName(Eventos.Eventos[0].Destinatario).AsString <> sDestinatarioActual) or sdqQuery.Eof;
        bSalir := sdqQuery.Eof;
        
        if bCambioDestinatario then
        begin
          sdqQuery.Prior;
          ProcesarEventos(mDatasetAfter, nil);
          sdqQuery.Next;
          ProcesarMensajeAccion(sDestinatarioActual);
          if bSalir then
            Break;
        end;
      end;
    end;

    if not bAnexaPorDestino then
      ProcesarEventos(mDatasetAfter, nil);

    if FAnexa and not bAnexaPorDestino then
    	ProcesarMensajeAccion;

    Alerta.LogEvent.AddLogMessage(dlInformation, CRLF + 'Fin del proceso de la acción: ' + Descripcion +
                                                 CRLF + 'Anexa por destino: ' + iif(bAnexaPorDestino, 'SI', 'NO') +
                                                 CRLF + 'Anexa: ' + iif(FAnexa, 'SI', 'NO') +
                                                 CRLF + 'Lista de destinatarios por acción: ' + ListaDestinatariosPorAccion.CommaText +
                                                 iif(Trim(Alerta.Mensaje) > '',
                                                     CRLF + 'Mensaje supuestamente enviado: ' + Alerta.Mensaje,
                                                     CRLF + 'Mensaje NO enviado (estaba vacío) ') );
  finally
  	sdqQuery.Close;
    sdqQuery.Free;
  end;
end;

procedure TAccion.ProcesarMensajeAccion(AMailDestino: String = '');
var
	i: Integer;
 	Motivo: String;
begin
	try
  	with Owner.Alerta do
    begin
      if (Mensaje <> '') and Self.FAnexa then
      begin
        if MotivoMensaje <> '' then
        	Motivo := Self.FMotivoMensaje
        else
        	Motivo := 'Alerta ' +  Descripcion + ' - ' + Self.Descripcion;

        if IsHTML(Mensaje) then
          Mensaje := ConcatenarHTML(Mensaje, '<!-- ALERTA=' + Codigo  + ' -->'); 

        if AMailDestino > '' then
          SendByMailServer(AMailDestino, DefaultProfile, Motivo, '', Mensaje,
                           False, False, True, '')
        else
          for i := 0 to Destinos.Count - 1 do
            SendByMailServer(FDestinos.Destino[i].FCorreo, DefaultProfile, Motivo, '', Mensaje,
                             False, False, True, '');
      end;
    end;
  finally
  	Owner.Alerta.Mensaje := '';
  end;
end;

procedure TAccion.SendFiles(APath: String);
var
	i: Integer;
begin
	for i := 0 to FOwner.Alerta.Destinos.Count - 1 do
  	EnviarArchivosEnDirectorio(APath, FOwner.Alerta.Destinos.Destino[i].FCorreo);
end;

function TAccion.ExpoFiles(AIdProceso: Integer): String;
var
	Login: TLoginData;
  qry: TSDQuery;
	sFileMode: String;
	sPathExport: String;
	sPathImport: String;  
	sProcessCode: String;
begin
  if FAdjuntaArchivoImpoExpo then
  	sPathExport := GetNewTempPath
  else
  begin
  	sPathExport := FDirectorioExportacion;
  	sPathImport := FDirectorioImportacion;
  end;

	with dmPrincipal do
  begin
		with TImpoExpoUtility.create do
		try
			try
				with FOwner.Alerta.Owner.Login do
        begin
        	Login.LoginName           := LoginName;
					Login.WindowsComputerName := WindowsComputerName;
					Login.WindowsUser         := WindowsUser;
				end;

        qry := GetQuery(
        	'SELECT pr_codigo, pr_modolectura' +
           ' FROM ipr_proceso' +
          ' WHERE pr_id = ' + SqlValue(AIdProceso));
        try
	        sProcessCode := qry.FieldByName('pr_codigo').AsString;
  	      sFileMode := qry.FieldByName('pr_modolectura').AsString;
				finally
        	qry.Free;
        end;

				InitParametros(IntToStr(AIdProceso), sProcessCode , sPathExport, sPathImport, '', sFileMode,  Login,
        							 FDirectorioImportacionProcesada);
				{
				for i := 0 to ParamsCount - 1 do begin
					 if params[i].Name = PARAM_IDPRESTADOR then params[i].Text := inttostr( AidPrestador );
						if params[i].Name = PARAM_IDMAIL then params[i].Text := inttostr( AIdMail );
						if params[i].Name = PARAM_IDARCHIVO then params[i].Text := inttostr( iId );
				end;
				}
				if not Procesar then
        	raise Exception.Create(ProcessMessages);
			finally
      	Free;
			end;
		except
    	on E: Exception do
      	raise exception.create('Error al ejecutar el proceso ' + sProcessCode + '. ' + E.Message);
		end;
	end;

	Result := sPathExport;
end;

procedure TAccion.EnviarArchivosEnDirectorio(const APath, ADestino: String);
var
	Motivo: String;
 	sr: TSearchRec;
// 	sl: TStringList;
  vAdjuntos: TArrayOfAttach;
  iPosic: integer;
begin
//FIXME ... completar para Mapi.
//	sl := TStringList.Create;
//  try
    if FindFirst(IncludeTrailingBackslash(APath) + '*.*', faArchive, sr) = 0 then
    begin
//      sl.Add(IncludeTrailingBackslash(APath) + sr.Name);
  		while FindNext(sr) = 0 do
      begin
//      	sl.Add(IncludeTrailingBackslash(APath) + sr.Name);
        iPosic := Length(vAdjuntos)+1;
        SetLength(vAdjuntos, iPosic);
        vAdjuntos[iPosic-1] := GetAttach(IncludeTrailingBackslash(APath) + sr.Name, -1);
      end;
     	FindClose(sr);
   	end;

    if MotivoMensaje <> '' then
    	Motivo := MotivoMensaje
    else
    	Motivo := 'Alerta ' +  FDescripcion;

    ProcesarEventos(mDatasetBefore, nil);
    ProcesarEventos(mDatasetAfter, nil);

//    EnviarMail(ADestino, DefaultProfile, Motivo, sl, Alerta.Mensaje, taExtendedMAPI, DefaultProfile, False, False, True);
    EnviarMailDB(ADestino, Motivo, [oBodyIsRTF], Alerta.Mensaje, vAdjuntos);
    BeginTrans(true);
//  finally
//  	sl.Free;
//  end;
end;

constructor TAccion.Create(AOwner: TAcciones);
begin
	FOwner := AOwner;
  FListaDestinatariosPorAccion := TStringList.Create;
  TStringList(FListaDestinatariosPorAccion).Duplicates := dupIgnore;
end;

procedure TAccion.AddLogMessage(ADebugLevel: TDebugLevelType; const	AMessage: String);
begin
	FOwner.Alerta.LogEvent.AddLogMessage(ADebugLevel, AMessage);
end;

function TAccion.GetFuenteDatos: TSDQuery;
var
  i: Integer;
begin
  Result := nil;

	if Trim(FSql) = '' then
  	raise Exception.Create('La Fuente de datos no contiene una consulta.');

  i := 0;

  while i < 3 do
    try
      Inc(i);
      Result := GetQuery(FSql);
      i := 4;
	  except
		  on E: Exception do
        if i = 2 then
          raise Exception.Create('La fuente de dato para la acción ' + FDescripcion	+
                                 ' de la alerta ' +  FOwner.Alerta.Descripcion + CRLF +
                                 'contiene errores.' + CRLF + ' ' + E.Message +
                                 CRLF + ' Sql: ' + FSql);
  	end;
end;

procedure TAccion.ProcesarEventos(AMomento: TMomentoAccion; ACampos: TFields);
var
	i: Integer;
begin
	for i := 0 to FEventos.Count - 1 do
  	if FEventos.Eventos[i].FMomento = AMomento then
    	FEventos.Eventos[i].Procesar(ACampos);
end;

function TAccion.GetAlerta: TAlerta;
begin
	Result := FOwner.Alerta;
end;

procedure TAccion.SetMotivoMensaje(const Value: String);
begin
	FMotivoMensaje := Trim(Value);
end;

procedure TAccion.ProcesarMensajeImpoExpo;
begin
  ProcesarEventos(mDatasetBefore, nil);
  ProcesarEventos(mDatasetAfter, nil);
  if FAnexa then
  	ProcesarMensajeAccion;
end;

destructor TAccion.Destroy;
begin
  FListaDestinatariosPorAccion.Free;
  inherited;
end;

{ TAcciones }
constructor TAcciones.Create(AAlerta: TAlerta);
var
	accion: TAccion;
	sSql: String;
begin
	//Recuperta valores destinos de correo.
	inherited Create;

	FAlerta :=  AAlerta;
	sSql :=
  	'SELECT *' +
     ' FROM can_accion, caa_alertaaccion' +
    ' WHERE aa_idaccion = an_id' +
    	' AND aa_idalerta = ' + SqlInteger(FAlerta.Id, True) +
      ' AND an_fechabaja IS NULL' +
      ' AND aa_fechabaja IS NULL' +
 ' ORDER BY aa_orden';

	with GetQuery(sSql) do
  try
		while not Eof do
    begin
    	accion := TAccion.Create(self);

    	with accion do
      begin
        Id 															:= FieldByName('an_id').AsInteger;
        Campos 													:= TCampos.Create(accion);
        Eventos 												:= TEventos.Create(accion);
        Parametros 											:= TParametros.Create(accion);
        TipoAccion 											:= FieldByName('an_tipoaccion').AsString;
        Descripcion 										:= FieldByName('an_descripcion').AsString;
        Log 														:= (FieldByName('an_log_errores').AsString = 'S');
        Proceso 												:= FieldByName('an_idproceso').AsInteger;
        MotivoMensaje 									:= FieldByName('an_motivomensaje').AsString;
        FAnexa        									:= FieldByName('an_anexa').AsString = SQL_TRUE;
        Sql 														:= FieldByName('an_sql').AsString;
        RegistrosSuspendeAccion 				:= FieldByName('AN_REGISTROSSUSPENDEACCION').AsInteger;
        FAdjuntaArchivoImpoExpo 				:= FieldByName('AN_ADJUNTAARCHIVOIMPOEXPO').AsString = 'S';
        FDirectorioExportacion 					:= FieldByName('AN_DIRECTORIOEXPORT').AsString;
        FDirectorioImportacion 					:= FieldByName('AN_DIRECTORIOIMPORT').AsString;
        FDirectorioImportacionProcesada := FieldByName('AN_DIRIMPORTPROCESADA').AsString;
      end;
			Add(accion);

			Next;
		end;
  finally
  	Free;
  end;
end;

procedure TAcciones.Ejecutar;
var
	i: integer;
begin
	for i := 0 to Count - 1 do
  	TAccion(Items[i]).Ejecutar;
end;

function TAcciones.GetAccion(Index: Integer): TAccion;
begin
	if (Index > -1) and (Index < Count) then
  	Result := TAccion(Self.Items[Index])
	else
  	raise Exception.create('Accediendo a un índice de acción fuera de intervalo.');
end;


{ TDestinos }
constructor TDestinos.Create(AAlerta: TAlerta);
var
 	destino: TDestino;
	sSql: String;
begin
	inherited Create;

 	FAlerta := AAlerta;

  //Recuperta valores destinos de correo.
	sSql :=
    'SELECT au_id, DECODE(au_email, NULL, ie_usuario, ''usuario'') ie_usuario, NVL(au_email, ie_mail) ie_mail,' +
          ' DECODE(au_email, NULL, ie_nombre, ''nombre'') ie_nombre' +
     ' FROM comunes.cau_alertausuario, comunes.v_cie_usuario_int_ext' +
    ' WHERE au_idusuario = ie_usuario(+)' +
    	' AND au_idalerta = ' + SqlInteger(AAlerta.Id, True);
 	with GetQuery(sSql) do
  try
   	while not Eof do
    begin
    	Destino := TDestino.Create(FieldByName('au_id').AsInteger, FieldByName('ie_usuario').AsString,
      													 FieldByName('ie_mail').AsString, FieldByName('ie_nombre').AsString);
      Add(destino);
      Next;
   	end;
  finally
  	Free;
  end;
end;

function TDestinos.GetDestino(Index: Integer): TDestino;
begin
	Result := TDestino(Items[Index]);
end;

{ TEventos }
constructor TEventos.Create(AAccion: TAccion);
var
	Evento: TEvento;
  sMensaje: TStringList;
	sSql: String;
begin
	inherited Create;
	//Recuperta valores destinos de correo.

	FAccion := AAccion;
	sSql :=
  	'SELECT *' +
     ' FROM cae_accionevento' +
    ' WHERE ae_idaccion = :id ' +
     	' AND ae_fechabaja IS NULL';
	with GetQueryEx(sSql, [FAccion.FId]) do
  try
		while not Eof do
    begin
			Evento := TEvento.Create(Self);
 	  	with evento do
      begin
      	FOrden := FieldByName('ae_orden').AsInteger;

        case ArrayPos(FieldByName('ae_momento').AsString , TEA_MOMENTOS, 0) of
        	0: FMomento := mDatasetBefore;
          1: FMomento := mRecordAfter;
          2: FMomento := mDatasetAfter;
        end;

				AccionError := FieldByName('ae_accionerror').AsString;
				TipoAccion  := FieldByName('ae_tipoaccion').AsString;
				Sql         := FieldByName('ae_sql').AsString;
				Script      := FieldByName('ae_script').AsString;
				Parametros  := (FieldByName('ae_usarparametros').AsString = 'S');
//        Mensaje     := FieldByName('ae_mensaje').AsString;

        sMensaje := TStringList.Create;
        try
          BlobSql('SELECT AE_MENSAJE' +
 					  			 ' FROM CAE_ACCIONEVENTO' +
									' WHERE AE_IDACCION = ' + SqlValue(FieldByName('AE_IDACCION').AsInteger) +
					 					' AND AE_ORDEN = ' + SqlValue(FieldByName('AE_ORDEN').AsInteger), sMensaje);
          Mensaje := sMensaje.Text;
          {
          if dmPrincipal.Debug then
            Accion.Alerta.LogEvent.AddLogMessage(dlInformation, CRLF + 'Cuerpo del mensaje sin procesar: ' + CRLF + Mensaje);
          }  
        finally
          sMensaje.Free;
        end;
        Destinatario := FieldByName('ae_campodestinatario').AsString;

        if Trim(Destinatario) > '' then
          Owner.Accion.ListaDestinatariosPorAccion.Add(Destinatario);
			end;

			Add(Evento);
			Next;
		end;
  finally
		Free;
  end;
end;

function TEventos.GetEvento(Index: Integer): TEvento;
begin
	if (Index > -1) and (Index < Count) then
  	Result := TEvento(Self.Items[Index])
	else
  	raise Exception.create('Accediendo a un índice de evento fuera de intervalo.');
end;


{ TParametro }
constructor TParametros.Create(AOwner: TObject);
var
	sSql: String;
	Parametro: TParametro;
  Login: TDBLogin;
begin
	inherited Create;

	FOwner := AOwner;

  if (AOwner is TAccion) then
  begin
    //En los parámetros de alertas agrego los parámetros de sistema.
		Add(TParametro.Create(PARAM_EV_RECNUMBER, PARAM_EV_RECNUMBER, '', '0', '0',''));
    Add(TParametro.Create(PARAM_EV_RECPROC, PARAM_EV_RECPROC, '', '0', '0',''));
    Add(TParametro.Create(PARAM_EV_ERRRORCOUNT, PARAM_EV_ERRRORCOUNT, '', '0', '0',''));

    sSql :=
    	'SELECT at_codigo, at_descripcion, at_tipo, at_default, at_origen' +
       ' FROM cat_accionparametro' +
      ' WHERE at_idaccion = ' + SqlInteger(TAccion(FOwner).Id, True) +
      	' AND at_fechabaja is null';
  end
  else
  begin
    Login := TAlerta(FOwner).FOwner.Login;

    //En los parámetros de alertas agrego los parámetros de sistema.
    Add(TParametro.Create(PARAM_USER, PARAM_USER, '', Login.LoginName, Login.LoginName, ''));
    Add(TParametro.Create(PARAM_WINUSER, PARAM_WINUSER, '', Login.WindowsUser, Login.WindowsUser, ''));
    Add(TParametro.Create(PARAM_WINPC, PARAM_WINPC, '', Login.WindowsComputerName, Login.WindowsComputerName, ''));
    Add(TParametro.Create(PARAM_HTML_CSS, PARAM_HTML_CSS, '', URL_HTML_CSS, URL_HTML_CSS, ''));    
    Add(TParametro.Create(PARAM_STARTTIME, PARAM_STARTTIME, '', DateTimeToStr(DBDateTime), DateTimeToStr(DBDateTime), ''));

    if FOwner is TAlerta then
    	Add(TParametro.Create('', PARAM_PROCESS, '', (FOwner as TAlerta).FDescripcion, (FOwner as TAlerta).FDescripcion, ''));

    sSql :=
    	'SELECT ap_codigo, ap_descripcion, ap_tipo, ap_default, ap_origen' +
       ' FROM cap_alertaparametro' +
      ' WHERE ap_idalerta = ' + SqlInteger(TAlerta(FOwner).Id, True) +
      	' AND ap_fechabaja is null ';
  end;

  with GetQuery(sSql) do
  try
  	while not Eof do
    begin
    	Parametro := TParametro.Create(Fields[0].AsString, Fields[1].AsString, Fields[2].AsString, Fields[3].AsString,
      															 Fields[3].AsString, Fields[4].AsString);
    	Add(Parametro);
    	Next;
  	end;
  finally
		Free;
  end;
end;


{ TParametro }

constructor TParametro.Create(ACodigo, ADescripcion, ATipo, AValor, ADefault, AOrigen: String);
begin
  FCodigo       := ACodigo;
  FDescripcion  := ADescripcion;
  FTipo         := ATipo;
  FValor        := AValor;
  FDefault      := ADefault;
  FOrigen       := AOrigen;
  if Trim( FOrigen ) <> '' then
  	ObtenerOrigenParamametro;
end;

procedure TParametro.ObtenerOrigenParamametro;
begin
	try
  	if Trim(FOrigen) = '' then
    	Exit;

		with GetQuery(FOrigen) do
  	try
	  	if RecordCount > 0 then
    		FValor := Fields[0].AsString;
  	finally
			Free;
  	end;
  except
  	raise Exception.Create('Error al obtener el valor del parámetro ' + FDescripcion + ' usando la consulta ' + CRLF +
    												FOrigen);
  end;
end;


{ TCampos }
constructor TCampos.Create(AAccion: TAccion);
var
	Campo: TCampo;
	sSql: String;
begin
	inherited Create;
  
	FAccion := AAccion;

	//Recuperta valores destinos de correo.
	sSql :=
  	'SELECT *' +
     ' FROM cac_accioncampo' +
    ' WHERE ac_idaccion = ' + SqlInteger(FAccion.Id, True);

	with GetQuery(sSql) do
  try
		while not Eof do
    begin
			Campo := TCampo.Create;
			with Campo do
      begin
      	FOrden  := FieldByName('ac_orden').AsInteger;
				FNombre := FieldByName('ac_nombre').AsString;
				FAncho  := FieldByName('ac_ancho').AsString;
				FTitulo := FieldByName('ac_titulo').AsString;
			end;
			Add(Campo);
			Next;
		end;
  finally
		Free;
  end;
end;


{ TAlertas }

constructor TAlertas.Create(AOwner: TComponent);
begin
	inherited Create;
  
	try
    FOwner := AOwner;
		FLoading := True;

		FLogEvent := TLogs.Create(FOwner);
		FLogin    := TDBLogin.Create(nil);
		FCs       := TCriticalSection.Create;
    CSection  := TCriticalSection.Create;

		FTrigger := TTimer.Create(nil);
    FTrigger.Interval := 10000;
		FTrigger.OnTimer := RefreshTimersTimer;
		FTrigger.Enabled := true;
	except
		on E : Exception do
    	raise Exception.Create('Error Creando Alertas. ' + E.Message);
	end;
end;

destructor TAlertas.Destroy;
begin
   FLogEvent.Free;
   FLogin.Free;
   FCs.Free;
   CSection.Free;
   FTrigger.Enabled := False;
   FTrigger.Free;
   
   inherited;
end;

procedure TAlertas.RefreshTimersTimer(Sender: TObject);
begin
	FTrigger.Enabled := False;
	try
  	try
    	if VerificaConexion then
      	ReloadProcesses;
		except
    	on E: Exception do
      	LogEvent.AddLogMessage(dlError, CRLF + 'Verificando conexion y ejecutando el proceso.' + CRLF + E.Message);
				//raise Exception.Create('Verificando conexion y ejecutando el proceso.');
		end;
	finally
  	FTrigger.Enabled := True;
	end;
end;

// retorna True si existe la conexion
// retorna False si falló la conexión
function TAlertas.VerificaConexion: Boolean;
var
  bExiste: Boolean;
begin
  Result := True;
  try
    bExiste := ExisteSql('SELECT 1 FROM dual');
    if not bExiste then
    	Result := False;
  except
    on E: ESDOraError do
    begin
    	LogEvent.AddLogMessage(dlError, CRLF + 'Error al verificar la conexión: ' + E.Message);
      if  dmPrincipal.ReconectarBD then
      begin
        Result := True;
        LogEvent.AddLogMessage(dlInformation, CRLF + 'Reconectado con éxito.');
      end
      else
      	Result := False;
    end;
  end;
end;

procedure TAlertas.ReloadProcesses;
var
	cant: Integer;
 	alerta: TAlerta;
 	sWhere: String;
begin
	try
		FCs.Enter;

    sWhere := ' WHERE se_usuario = al_usuario and al_fechabaja IS NULL ';
    if Count > 0 then
    	sWhere := sWhere + '   AND al_programacionalterada = ''S''';

    //Pablo para probar
//    sWhere := sWhere + ' and al_id = 12 ';

		cant := ValorSqlInteger('SELECT COUNT(*) FROM art.use_usuarios, comunes.cal_alerta ' + sWhere, 0);
		if (cant > 0) or FLoading  then
    begin
    	LogEvent.AddLogMessage(dlInformation, CRLF + 'Inicio Recarga Alertas.');

			with GetQuery('SELECT al_id, al_descripcion, AL_USUARIO, AL_DESCRIPCION, se_mail FROM art.use_usuarios, comunes.cal_alerta ' + sWhere) do
			try
      	while not Eof do
        try
        	LogEvent.AddLogMessage(dlInformation, CRLF + 'Recargando Alertas -> N° ' + FieldByName('al_id').AsString + CRLF + FieldByName('al_descripcion').AsString);

          FreeAlertaById(FieldByName('al_id').AsInteger);

          Alerta := TAlerta.Create(Self, FieldByName('al_id').AsInteger);
          Add(Alerta);
          Next;
        except
        	on E: Exception do
          begin
          	LogEvent.AddLogMessage(dlError, CRLF + 'Error en la Recarga de Alertas. ' + CRLF + 'Alerta: ' +
            																FieldByName('al_id').AsString +  ' - ' +
                                            FieldByName('al_descripcion').AsString + ' - Error: ' + E.Message);

            SetearProgramacionError(FieldByName('al_id').AsInteger);
            EnviarMail(FieldByName('se_mail').AsString, DefaultProfile,
            					 'El Alerta Nro. :  ' + FieldByName('al_id').AsString + ', al intentar recargar.', nil,
                       Format(MENSAJEERROR, [FieldByName('al_descripcion').AsString, e.Message,
                       FieldByName('al_usuario').AsString]), taSMTP, DefaultProfile, False, False, True);
          end;
    		end;
			finally
      	LogEvent.AddLogMessage(dlInformation, CRLF + 'Fin Recarga Alertas. Se cargaron ' + InttoStr(RecordCount));
				OnRefresh(Self);
        Free;
				FLoading := False;
			end;
		end;
	finally
		FCs.Leave;
	end;
end;

procedure TAlertas.SetearProgramacionError(AIdAlerta: Integer);
var
 sSql: String;
begin
	LogEvent.AddLogMessage(dlInformation, CRLF + 'Seteando Programación con Error.');
	sSql :=
  	'UPDATE cal_alerta' +
    	' SET al_programacionalterada = ''X''' +
    ' WHERE al_id = '  + SqlInteger(AIdAlerta, False);
	EjecutarSql(sSql);
end;

{procedure TAlertas.InitAlertas;
var
 i : integer;
begin

end;}

procedure TAlertas.SetLogin(const Value: TDBLogin);
begin
	FLogin := Value;
end;

procedure TAlertas.SetOnRefresh(const Value: TNotifyEvent);
begin
	FOnRefresh := Value;
end;

function TAlertas.GetAlertas(Index: Integer): TAlerta;
begin
	if (Index > -1) and (Count > Index) then
  	Result := TAlerta(Self.Items[index])
  else
  	raise Exception.Create('Accediendo a un índice de alerta fuera de intervalo.');
end;

{ TEvento }
function TParametros.GetParametros(Index: Integer): TParametro;
begin
	if (Index > -1) and (Count > Index) then
  	Result := TParametro(Self.Items[index])
  else
  	raise Exception.Create('Accediendo a un índice de parámetro fuera de intervalo.');
end;

procedure TParametros.SetParametros(Index: Integer; const Value: TParametro);
begin

end;

constructor TEvento.Create(AOwner: TEventos);
begin
	FOwner := AOwner;
  FQuery := TSDQuery.create(nil);

  SetDatabaseToQuery(FQuery);
end;

procedure TEvento.Preparar;
begin
  if Trim(FSql) = '' then
  	Exit;

  FQuery.Close;
  try
  	FQuery.Params.Clear;
    ReemplazarParametros(FSql);

    FQuery.SQL.Add(FSql);
    FQuery.Prepare;
  except
  	raise Exception.Create('Error: La consulta contiene errores de sintaxis.');
  end;
end;

procedure TEvento.ReemplazarParametros(var Sql : string);
begin
  Sql := StringReplace(Sql, ACTION_PARAM, 'p' , [rfReplaceAll, rfIgnoreCase]);
  Sql := StringReplace(Sql, FIELD_PARAM, 'f' , [rfReplaceAll, rfIgnoreCase]);
end;

function TEvento.GetParametrosAlerta: TParametros;
begin
	if Assigned(FOwner.Accion.Owner.Alerta.Parametros) then
  	Result := FOwner.Accion.Owner.Alerta.Parametros
	else
  	raise Exception.Create('Error: Parámetros de Alerta No Asignados.');
end;

function TEvento.GetParametrosEvento: TParametros;
begin
  if Assigned(FOwner.Accion.Parametros) then
  	Result := FOwner.Accion.Parametros
  else
  	raise Exception.Create('Error: Parámetros de Acción No Asignados.');
end;

procedure TEvento.Procesar(ACampos: TFields);
begin
  try
    FFields := ACampos;
    ProcesarSql;
    {$IFDEF SCRIPTING}
    ProcesarScript;
    {$ENDIF}
    ProcesarMensaje;
  except
  	on E: Exception do
    begin
    	if FAccionError = 'C' then  //Cancelar e informar. Raiseo una exception que va a ser atrapada mas arriba.
      	raise Exception.Create('Error al procesar el evento. Se generó el siguiente mensaje de error:' + E.Message)
			else if FAccionError = 'P' then //Informa y continua. Envio un mensaje al propietario con el Problema.
      	EnviarMail(Owner.Accion.Owner.Alerta.PropietarioMail, DefaultProfile,
        					'Error Alerta: ' + Owner.Accion.Owner.Alerta.FDescripcion, nil, Format(MENSAJEERROR,
                  [Owner.Accion.Owner.Alerta.FDescripcion, 'Error al procesar el evento en la Acción: ' +
                  Owner.Accion.Descripcion + CRLF + 'Se generó el siguiente mensaje de error:' + E.Message,
                  Owner.Accion.Owner.Alerta.Propietario]), taSMTP, DefaultProfile, False, False, True);
		end;
	end;
end;

procedure TEvento.ProcesarMensaje;
var
	i: Integer;
 	sMensaje, sMotivo: String;
begin
  if Owner.Accion.MotivoMensaje <> '' then
  	sMotivo := Owner.Accion.MotivoMensaje
  else
  	sMotivo := 'Alerta ' + FOwner.Accion.Owner.Alerta.Descripcion;

  sMensaje := ArmarMensaje(FFields);

  if Owner.Accion.Anexa or Owner.Accion.Alerta.Anexa then
  begin
    if IsHTML(MensajeAlerta) or IsHTML(sMensaje) then
    begin
      if dmPrincipal.Debug then
        Owner.Accion.Alerta.LogEvent.AddLogMessage(dlInformation, CRLF + 'Mensaje en formato HTML: ' + CRLF + sMensaje);

      MensajeAlerta := ConcatenarHTML(MensajeAlerta, sMensaje)
    end else
    begin
      if Length(Trim(MensajeAlerta)) > 0 then
        MensajeAlerta := ConcatenarRTF(MensajeAlerta, QuitarUltimoPagrafo(sMensaje))
      else
        MensajeAlerta := QuitarUltimoPagrafo(sMensaje);
    end;

    if dmPrincipal.Debug then
      Owner.Accion.Alerta.LogEvent.AddLogMessage(dlInformation, CRLF + 'Preparando el siguiente mensaje: ' + CRLF + sMensaje);
  end
  else
  begin
    for i := 0 to FOwner.Accion.Owner.Alerta.Destinos.Count - 1 do
    begin
    	SetearDestinatario(sMensaje, FOwner.Accion.Owner.Alerta.Destinos.Destino[i].NombreLargo);
      SendByMailServer(FOwner.Accion.Owner.Alerta.Destinos.Destino[i].FCorreo, DefaultProfile, sMotivo, '', sMensaje,
      								 False, False, True, '');
    end;
    if (Trim(Destinatario) <> '') then
    begin
      SetearDestinatario(sMensaje, Destinatario);
      SendByMailServer(FFields.FieldByName(Destinatario).AsString, DefaultProfile, sMotivo, '', sMensaje, False, False,
      								 True, '');
    end;

    if dmPrincipal.Debug then
      Owner.Accion.Alerta.LogEvent.AddLogMessage(dlInformation, CRLF + 'Cuerpo del mensaje recientemente enviado: ' + CRLF + sMensaje);
  end;
end;

procedure TEvento.SetearDestinatario(var Mensaje: String; const Destinatario: String);
begin
  Mensaje := StringReplace(Mensaje, ':' + ACTION_PARAM + PARAM_EV_DESTUSER, Destinatario, [rfReplaceAll, rfIgnoreCase]);
end;

{$IFDEF SCRIPTING}
procedure TEvento.ProcesarScript;
begin
//
end;
{$ENDIF}

procedure TEvento.ProcesarSQL;
begin
	try
 		if Trim(FSql) = '' then
  		Exit;

		ArmarConsulta(FQuery, FFields);
    FQuery.ExecSQL;
	finally
  	FQuery.Close;
	end;
end;

procedure TEvento.SetAccionError(const Value: String);
begin
	FAccionError := Value;
end;

procedure TEvento.SetMensaje(const Value: String);
begin
  FMensaje := Value;
end;

procedure TEvento.SetMomento(const Value: TMomentoAccion);
begin
  FMomento := Value;
end;

procedure TEvento.SetOrden(const Value: Integer);
begin
  FOrden := Value;
end;

procedure TEvento.SetOwner(const Value: TEventos);
begin
  FOwner := Value;
end;

procedure TEvento.SetParametros(const Value: Boolean);
begin
  FParametros := Value;
end;

procedure TEvento.SetScript(const Value: String);
begin
  FScript := Value;
end;

procedure TEvento.SetSql(const Value: String);
begin
  FSql := Value;
  Preparar;
end;

procedure TEvento.SetTipoAccion(const Value: String);
begin
  FTipoAccion := Value;
end;

function TEvento.ArmarMensaje(AFields: TFields): String;
var
	i: Integer;
  sMensaje: String;
  Parametro: String;
  Valor: String;
begin
  sMensaje := FMensaje;
  for i := 0 to ParametrosAlerta.Count - 1 do
  begin
  	Parametro := ParametrosAlerta.Parametros[i].FCodigo;
    Valor     := ParametrosAlerta.Parametros[i].FValor;
    sMensaje 	:= StringReplace(sMensaje, '<:' + ACTION_PARAM + Parametro + '>', Valor, [rfReplaceAll, rfIgnoreCase]);
  end;

  //Cargo los parametros de Acción
  for i := 0 to ParametrosEvento.Count - 1 do
  begin
  	Parametro := ParametrosEvento.Parametros[i].FCodigo;
    Valor     := ParametrosEvento.Parametros[i].FValor;
    sMensaje 	:= StringReplace(sMensaje, '<:' + ACTION_PARAM + Parametro + '>', Valor, [rfReplaceAll, rfIgnoreCase]);
  end;

  //Cargo los parametros de campo
  if Assigned(Afields) then
  	for i := 0 to Afields.Count - 1 do
      sMensaje := StringReplace(sMensaje, '<:' + FIELD_PARAM + Afields.Fields[i].FieldName  + '>',
      												 Afields.Fields[i].AsString, [rfReplaceAll, rfIgnoreCase]);

  Result := sMensaje;
  if dmPrincipal.Debug then
    Owner.Accion.Alerta.LogEvent.AddLogMessage(dlInformation, CRLF + 'Mensaje procesado: ' + CRLF + sMensaje);
end;

procedure TEvento.ArmarConsulta(AQuery: TSDQuery; AFields: TFields);
var
  i: Integer;
  Param: TParam;
  Parametro: String;
  s: String;
  Valor: String;
begin
  AQuery.Close;
  AQuery.Prepare;

  //ClearParamsError
  i:=AQuery.Params.Count-1;
  while i >=0 do
  begin
    if (AQuery.Params[i].Name = '') or (AQuery.Params[i].Name[1] = '=') then
      AQuery.Params.Delete(i);
    Dec(i);
  end;

  //Cargo los parametros de Alerta
  for i := 0 to ParametrosAlerta.Count - 1 do
  begin
    Parametro := ParametrosAlerta.Parametros[i].FCodigo;
    Valor     := ParametrosAlerta.Parametros[i].FValor;
    Param 		:= AQuery.Params.FindParam('p' + Parametro);
    if Assigned(Param) then
    	Param.Value := Valor;
  end;

  //Cargo los parametros de Acción
  for i := 0 to ParametrosEvento.Count - 1 do
  begin
    Parametro := ParametrosEvento.Parametros[i].FCodigo;
    Valor     := ParametrosEvento.Parametros[i].FValor;
    Param 		:= AQuery.Params.FindParam('p' +  Parametro);
    if Assigned(Param) then
    	Param.Value := Valor;
  end;

	for i := 0 to AQuery.Params.Count - 1 do
  	s := '| ' + AQuery.Params.Items[i].Name + ' ' + AQuery.Params.Items[i].DisplayName;

  //Cargo los parametros de campo
	if Assigned(Afields) then
  	for i := 0 to Afields.Count - 1 do
  	begin
    	Param := AQuery.Params.FindParam('f' + Afields.Fields[i].FieldName);
    	if assigned(Param) then
      	Param.Value := Afields.Fields[i].Value;
  	end;
end;

function TEvento.GetMensajeAlerta: WideString;
begin
	Result := FOwner.Accion.Owner.Alerta.Mensaje;
end;

procedure TEvento.SetMensajeAlerta(const Value: WideString);
begin
	FOwner.Accion.Owner.Alerta.Mensaje := Value;
end;

procedure TEvento.SetDestinatario(const Value: String);
begin
	FDestinatario := Value;
end;
                                             
{ TProgramacion }
function TProgramacion.CalcularProximoIntervaloProgramado: Integer;
var
	aux: Integer;
	i: Integer;
  ProximoIntervalo: Integer;
begin
	ProximoIntervalo := High(Integer);
	for i := 0 to Count - 1 do
  begin
  	aux := TPrograma(items[i]).CalcularProximaEjecucion;
		if aux < ProximoIntervalo then
    	ProximoIntervalo := aux;
	end;

	Result := ProximoIntervalo;
end;

constructor TProgramacion.Create(AAlerta: TAlerta);
var
	programa: Tprograma;
	sSql: String;  
begin
	inherited Create;

	FAlerta := AAlerta;
  
	//Recuperta valores destinos de correo.
	sSql :=
  	'SELECT *' +
     ' FROM cpg_alertaprogramacion' +
    ' WHERE pg_idalerta = ' + SqlInteger(FAlerta.Id , True) +
    	' AND pg_fechabaja is null';

  with GetQuery(sSql) do
  try
	  while not Eof do
    begin
    	programa := TPrograma.Create(Self);
		  with programa do
      begin
      	FOrden              := FieldByName('pg_orden').AsInteger;
			  FTipoProgramacion   := FieldByName('pg_tipoprogramacion').AsString;
			  FValor              := FieldByName('pg_valor').AsInteger;
			  FTipoFrencuencia    := FieldByName('pg_tipofrecuencia').AsString;
			  FFrecuencia         := FieldByName('pg_frecuencia').AsInteger;
			  FFrecuenciaDesde    := FieldByName('pg_frecuenciaDesde').AsInteger;
			  FFrecuenciaHasta    := FieldByName('pg_frecuenciaHasta').AsInteger;
			  FProximaEjecucion   := FieldByName('pg_proximaejecucion').AsDateTime;
			  FUnidadDeFrecuencia := FieldByName('pg_unidadfrecuencia').asString;
		  end;
		  Add(programa);
		  Next;
  	end;
  finally
		Free;
  end;
end;

function TProgramacion.GetProgramacion(Index: Integer): TPrograma;
begin
	if (Index > -1) and (Index < Count) then
  	Result := TPrograma(Self.Items[Index])
	else
  	raise Exception.Create('Accediendo a un índice de programación fuera de intervalo.');
end;

function TProgramacion.GetProgramacionDescripta: String;
begin

end;

procedure TProgramacion.SetProgramacion(Index: Integer; const Value: TPrograma);
begin

end;


{ TPrograma }
function TPrograma.GetDescripcionProgramacion: String;
begin
	Result := '';
  
	if FTipoProgramacion = 'D' then		//Programacion Diaria
  begin
  	Result := 'Cada ' + IntToStr(FValor) + ' días';
		if FTipoFrencuencia = 'U' then
    	Result := Result + ' una vez a las ' + TimeToStr((FFrecuencia) / 60 / 60 / 24)
		else
    begin
    	Result := Result + ' cada ' + IntToStr(FValor) + ' ' + FDescFrecuencia + '.';
      Result := Result + ' Desde: ' + TimeToStr((FFrecuenciaDesde)  / 60 / 60 / 24) +
      									 ' Hasta: ' + TimeToStr((FFrecuenciaHasta) / 60 / 60 / 24);
		end;
	end
  else if FTipoFrencuencia = 'S' then		//Programacion Semanal
  begin
	end
  else
  if FTipoFrencuencia = 'M' then		//Programacion Mensual
  begin
	end;
end;

{  Calcula la cantidad de milisegundos que deben transcurrir para la proxima ejecución
}
class function TPrograma.CalcularIntervalo(TipoProgramacion: String; Valor: Integer; TipoFrecuencia: String; Frecuencia,
																					 Desde, Hasta: Integer; UnidadFrecuencia: String = 'M'): Int64;
var
  HorasDiasATranscurrir: Int64;
  IntervaloEnMS: Int64;
  HoraEnMS: Integer;
begin
	HoraEnMS := GetProximaHoraProgramada(TipoFrecuencia, Frecuencia, Desde, Hasta, UnidadFrecuencia);
  HorasDiasATranscurrir := 0;
  IntervaloEnMS := High(Integer);

	if TipoProgramacion = 'D' then		//Programacion Diaria
  begin
		if Valor > 0 then
    	HorasDiasATranscurrir := (Valor  - 1) * 24 * 60 * 60 * 1000;
    IntervaloEnMS := HoraEnMS + HorasDiasATranscurrir;
	end
  else if TipoProgramacion = 'S' then //Programacion Semanal
  begin
    HoraEnMS := Frecuencia * 1000;
    IntervaloEnMS := GetProximoDiaProgramado(Valor, HoraEnMS);
	end
  else if TipoProgramacion = 'M' then //Programacion Mensual
  begin

	end;
	Result := IntervaloEnMS;
end;

class function TPrograma.GetProximaHoraProgramada(TipoFrecuencia: String; Frecuencia, Desde, Hasta: Integer;
																									UnidadFrecuencia: String = 'M'): Int64;
var
  IntervaloEnMS: Int64;
  HoraActualEnMS: Int64;
  FrecuenciaEnMS: Int64;
  DesdeEnMs: Int64;
  HastaEnMs: Int64;
  MultiplicadorFrecuenciaMS: Int64;
  Iteracion: Int64;
begin
  HoraActualEnMS := TimeToMiliseconds(TimeOf(DbDateTime));
	FrecuenciaEnMS := Frecuencia * 1000;
  DesdeEnMs      := Desde * 1000;
  HastaEnMs      := Hasta * 1000;

  IntervaloEnMS := High(Integer);

	if TipoFrecuencia = TF_UNICA then //Occurs once at
  begin
		if HoraActualEnMS < FrecuenciaEnMS then
    	IntervaloEnMS := (FrecuenciaEnMS   - HoraActualEnMS)
		else
    	IntervaloEnMS := (VeinticuatroEnMS - HoraActualEnMS + FrecuenciaEnMS);
	end
  else
  begin
    // Occurs every
    // Calculo el coeficiente que representa el tipo de frecuencia Hora, Minuto, Segundo.
    MultiplicadorFrecuenciaMS := CalcularMultiplicadorFrecuencia(UnidadFrecuencia);
    if HoraActualEnMS < DesdeEnMs then
    	IntervaloEnMS := (DesdeEnMs   - HoraActualEnMS)
    else
    if HoraActualEnMS > HastaEnMs then
    	IntervaloEnMS := (VeinticuatroEnMS - HoraActualEnMS + DesdeEnMs)
    else
    if (HoraActualEnMS >= DesdeEnMs) and (HoraActualEnMS <= HastaEnMs) then
    begin
      Iteracion := Trunc((HoraActualEnMS - DesdeEnMs) / (Frecuencia * MultiplicadorFrecuenciaMS)) + 1;
      IntervaloEnMS := (Iteracion * (Frecuencia * MultiplicadorFrecuenciaMS) + DesdeEnMs) - HoraActualEnMS;
    end;
	end;

  Result := IntervaloEnMS;
end;

class function TPrograma.CalcularMultiplicadorFrecuencia(TipoUnidadFrecuencia: String): Cardinal;
begin
	case ArrayPos(TipoUnidadFrecuencia, TTipoUnidadFrecuencia) of
  	0:	Result := 60 * 60 * 1000;
  	1: 	Result := 60 * 1000;
  	2: 	Result := 1000;
  else
  	Result := 0;
  end;
end;

class function TPrograma.GetProximoDiaProgramado(DiasProgramados: Integer; HoraProgramacionMS: Int64): Int64;
var
  DiaActual: Int64;
  DiaSemana: Int64;
  DiaAnalisis: Int64;
  Dia: Integer;
  DiaProximaProgramacion: Int64;
  DiaCalculado: Int64;
begin
  DiaProximaProgramacion := High(Integer);
  DiaCalculado := High(Integer);
  DiaSemana := DayOfTheWeek(DBDate);
  DiaActual := 1 shl (DiaSemana - 1);

	for Dia := 1 to 7 do
  begin
  	DiaAnalisis := 1 shl (Dia - 1);

   	//Está programado para ese día conciderado?
   	if (DiasProgramados and DiaAnalisis) = DiaAnalisis then
   	begin
   		if (DiaAnalisis < DiaActual) then
    		DiaCalculado := (7 - DiaSemana + Dia) * MILLISECONDSINADAY + (HoraProgramacionMS - TimeToMiliseconds(TimeOf(DbDateTime)))
    	else if DiaAnalisis = DiaActual then   {El dia es actual pero la hora no está cumplida por lo que tengo que ejecutar hoy.}
    	begin
    		if TimeToMiliseconds(TimeOf(DbDateTime)) < HoraProgramacionMS then
      		DiaCalculado := HoraProgramacionMS - TimeToMiliseconds(TimeOf(DbDateTime))
	      else
  	    	DiaCalculado := MILLISECONDSINAWEEK +  HoraProgramacionMS - TimeToMiliseconds(TimeOf(DbDateTime));
    	end
	    else if DiaAnalisis > DiaActual then
  	  	DiaCalculado := (Dia - DiaSemana) * MILLISECONDSINADAY + (HoraProgramacionMS - TimeToMiliseconds(TimeOf(DbDateTime)));

	    if DiaProximaProgramacion > DiaCalculado then
  	  	DiaProximaProgramacion := DiaCalculado;
  	end;
	end;
  
  if DiaProximaProgramacion < High(Integer) then
    Result := DiaProximaProgramacion
  else
  	Result := Low(Integer);
end;

function TPrograma.CalcularProximaEjecucion : Int64;
var
	Intervalo: Int64;
	sSql: String;
begin
	Intervalo := 0;

	sSql :=
  	'SELECT cal_alerta.*, cpg_alertaprogramacion.*,' +
    			' DECODE(pg_unidadfrecuencia, ''H'', ''Hora'', ''M'', ''Minuto'', ''S'', ''Segundo'') pg_unidadfrecuenciadescripcta' +
     ' FROM cal_alerta, cpg_alertaprogramacion' +
    ' WHERE al_id = pg_idalerta  AND al_fechabaja IS NULL' +
    	' AND al_id = ' +  SqlInteger(FOwner.Alerta.Id, True) +
      ' AND pg_fechabaja IS NULL';

	with GetQuery(sSql) do
  try
  	if RecordCount > 0 then
    	Intervalo := CalcularIntervalo(FieldByName('pg_tipoprogramacion').AsString, FieldByName('pg_valor').AsInteger,
      															 FieldByName('pg_tipofrecuencia').AsString, FieldByName('pg_frecuencia').AsInteger,
                                     FieldByName('pg_frecuenciadesde').AsInteger,
                                     FieldByName('pg_frecuenciahasta').AsInteger,
                                     FieldByName('pg_unidadfrecuencia').AsString);

  	//Setea el campo proximaejecucion como referencia.
	  ActualizarProximaEjecucion(Intervalo);
		Result := Intervalo;
	finally
		Free;
  end;
end;

procedure TPrograma.ActualizarProximaEjecucion(Intervalo: Int64);
var
	ProximaEjecucion: TDateTime;
	sSql: String;
  year, month, day, hour, min, sec, msec: Word;
begin
	ProximaEjecucion := (Intervalo / 1000 / 60 / 60 / 24) + DBDateTime;
  DecodeDateTime(ProximaEjecucion, year, month, day, hour, min, sec, msec);
  ProximaEjecucion := EncodeDateTime(year, month, day, hour, min, 0, 0);

	sSql :=
  	'UPDATE cpg_alertaprogramacion' +
    	' SET pg_proximaejecucion = :fechahora' +
    ' WHERE pg_idalerta = :id' +
    	' AND pg_orden = :orden';
	EjecutarSqlEx(sSql, [TDateTimeEx.Create(ProximaEjecucion), FOwner.Alerta.Id, Forden]);
	FProximaEjecucion := ProximaEjecucion;
end;

constructor TPrograma.create(AOwner: TProgramacion);
begin
	FOwner := AOwner;
end;

constructor TDestino.Create(AId: Integer; const AUsuario, ACorreo, ANombre: String);
begin
  FId := AId;
  FUsuario := AUsuario;
  FCorreo := ACorreo;
  FNombreLargo := ANombre;
end;

destructor TDestino.Destroy;
begin
  inherited;
end;

function ConcatenarHTML(const HTMLOriginal, HTMLAgregar: WideString): WideString;
begin
  Result := HTMLOriginal + HTMLAgregar; {Faltaría implementar la unión de códigos HTML completos}
end;

function ConcatenarRTF(const RTFOriginal, RTFAgregar: WideString): WideString;
var
  PosicionAncla: Integer;
  PosicionFin: Integer;
  Origen: WideString;
begin
	PosicionAncla := ObtenerPosicionAnclaRTF(RTFAgregar);
  PosicionFin   := ObtenerPosicionFinalRTF('}', RTFAgregar, PosicionAncla);
  if (PosicionAncla > 0) and (PosicionFin > 0) then
  	Origen := Copy(RTFAgregar, PosicionAncla, (PosicionFin - PosicionAncla));

  PosicionAncla := ObtenerPosicionAnclaRTF(RTFOriginal);
  PosicionFin   := ObtenerPosicionFinalRTF('}', RTFOriginal, PosicionAncla);

  Result := Copy(RTFOriginal, 0, PosicionFin - 1) + Origen + '}';
end;

function ObtenerPosicionAnclaRTF(const RTFText: WideString): Integer;
begin
	Result := PosEx('\viewkind4', RTFText, 0);
end;

function ObtenerPosicionFinalRTF(const Pattern, RTFText: WideString; Offset: Integer): Integer;
var
  i: Integer;
begin
	Result := 0;

  i := Offset;

  while i < Length(RTFText)  do
  begin
  	i := PosEx(Pattern, RTFText, i + 1);
   	if i > 0 then
    	Result := i
    else
    	Break;
  end;
end;

function QuitarUltimoPagrafo(const RTFText: WideString): WideString;
var
  posicion: Integer;
begin
  posicion := ObtenerPosicionFinalRTF('\row', RTFText, ObtenerPosicionAnclaRTF(RTFText));
  Result := copy(RTFText, 0, posicion + 4) + '}';
end;

end.
