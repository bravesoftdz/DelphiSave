unit unDmMonitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, strFuncs, syncobjs, Db, SDEngine,
  QueryToFile, FileReader, DBFileReader, Login, artDbLogin, PatternEdit, TimerLst, comctrls, RxRichEd, FileCtrl,
  unAlertaTypes;

type
  TdmMonitor = class(TDataModule)
    sdqExportacion: TSDQuery;
    sdqConsultas: TSDQuery;
    sdqProgramacion: TSDQuery;
    DBFileReader: TDBFileReader;
    QueryToFile: TQueryToFile;
    DBLoginMonitor: TDBLogin;
    TimerList: TRxTimerList;
    RefreshTimers: TRxTimerEvent;
    procedure RefreshTimersTimer(Sender: TObject);
    function CalcularIntervalo(TipoProgramacion: String; Valor: Integer; TipoFrecuencia: String; Frecuencia, Desde,
    													 Hasta: Integer): Integer;
    procedure DataModuleCreate(Sender: TObject);
  private
    FLoading  : Boolean;
    FAlertas  : TListView;
    cs        : TcriticalSection;
    FLogEvento: TRxRichEdit;

    function ActualizarAlerta(AIdAlerta: Integer): Integer;
    function DescribirProgramacion(TipoProgramacion: String; Valor: Integer; TipoFrecuencia: String;
    															 FrecuenciaDesc: String; Frecuencia, Desde, Hasta: Integer): String;
    function ObtenerDestinosAlerta(AIdAlerta: Integer): TStringList;

    procedure AlertasTimersTimer(Sender: TObject);
    procedure EjecutarAlerta(AIdAlerta: Integer);
    procedure EnviarArchivosEnDirectorio(APath: String; ADestino: String);
    procedure InitAlertas;
    procedure ProcesarAccionesAlerta(AIdAlerta: Integer);
    procedure SendFiles(AIdAlerta: Integer; APath: String);
    procedure SetAlertas(const Value: TListView);
    procedure SetearProgramacionActualizada(AIdAlerta: Integer);
    procedure SetearProgramacionAlterada(AIdAlerta: Integer);
    procedure SetLogEvento(const Value: TRxRichEdit);
  public
    function ExpoFiles(AIdProceso: Integer): String;

    procedure ReloadProcesses;

    property Alertas: TListView read FAlertas write SetAlertas;
    property LogEvento: TRxRichEdit read FLogEvento write SetLogEvento;
  end;

var
  dmMonitor: TdmMonitor;

implementation

uses
  unDmPrincipal, unExpoImpoUtils, AnsiSql, General, unDirUtils;

{$R *.DFM}

{ TdmMonitor }


procedure TdmMonitor.SetAlertas(const Value: TListView);
begin
  FAlertas := Value;
end;

procedure TdmMonitor.SetLogEvento(const Value: TRxRichEdit);
begin
  FLogEvento := Value;
end;

procedure TDmMonitor.InitAlertas;
var
  i: Integer;
begin
  for i := TimerList.Events.Count - 1 downto 1 do
  begin
    TRxTimerEvent(TimerList.Events.items[i]).Free;
    TimerList.Events.Delete(i);
  end;
end;

procedure TDmMonitor.SetearProgramacionActualizada(AIdAlerta : integer);
var
  sSql: String;
begin
  sSql :=
  	'UPDATE cal_alerta' +
    	' SET al_programacionalterada = ''N''' +
    ' WHERE al_id = ' + SqlInteger(AIdAlerta, False);
  EjecutarSql(sSql);
end;

procedure TDmMonitor.ProcesarAccionesAlerta(AIdAlerta: Integer);
var
	sSql: String;
  sPath: String;
begin
	sSql :=
  	'SELECT *' +
     ' FROM can_accion, caa_alertaaccion' +
    ' WHERE aa_idaccion = an_id' +
    	' AND aa_idalerta = ' + SqlInteger(AIdAlerta, True) +
 ' ORDER BY aa_orden';

  with GetQuery(sSql) do
  try
    try
      if RecordCount > 0 then
      begin
        if FieldByName('an_tipoaccion').AsString = 'IE' then
        begin
          sPath := dmMonitor.ExpoFiles(FieldByName('an_idproceso').AsInteger);
          if Trim(sPath) <> '' then
            sendFiles(AIdAlerta, sPath);
        end;
      end;
		except
      on E: Exception do
      begin
        FLogEvento.Lines.Add('Error Procesando Alerta Nº' + IntToStr(AIdAlerta));
        FLogEvento.Lines.Add('Descripción: ' + E.Message);
      end;
    end;
  finally
    Free;
  end;
end;

procedure TDmMonitor.SetearProgramacionAlterada(AIdAlerta: Integer);
var
  sSql: String;
begin
  FLogEvento.Lines.Add('Actalizando Programación Alerta Nº' + IntToStr(AIdAlerta));
  sSql :=
  	'UPDATE cal_alerta' +
    	' SET al_programacionalterada = ''S''' +
    ' WHERE al_id = ' + SqlInteger(AIdAlerta, False);
  EjecutarSql(sSql);
end;

function TdmMonitor.ActualizarAlerta(AIdAlerta: Integer): Integer;
var
  Intervalo: Integer;
  ProximaEjecucion: TDateTime;
  sSql: String;
begin
  Intervalo := 0;
  sSql :=
		'SELECT cal_alerta.*, cpg_alertaprogramacion.*,' +
    			' DECODE(pg_unidadfrecuencia, ''H'', ''Hora'', ''M'', ''Minuto'', ''S'', ''Segundo'') pg_unidadfrecuenciadescripcta' +
     ' FROM cal_alerta, cpg_alertaprogramacion' +
    ' WHERE al_id = pg_idalerta' +
    	' AND al_fechabaja IS NULL' +
      ' AND al_id = ' + SqlInteger(AIdAlerta, True);
  with GetQuery(sSql) do
  try
		if RecordCount > 0 then
    begin
    	Intervalo := CalcularIntervalo(FieldByName('pg_tipoprogramacion').AsString, FieldByName('pg_valor').AsInteger,
      															 FieldByName('pg_tipofrecuencia').AsString, FieldByName('pg_frecuencia').AsInteger,
                                     FieldByName('pg_frecuenciadesde').AsInteger,
                                     FieldByName('pg_frecuenciahasta').AsInteger);
			ProximaEjecucion := (Intervalo / 1000 / 60 / 60 / 24) + Now;
      sSql :=
      	'UPDATE cpg_alertaprogramacion' +
        	' SET pg_proximaejecucion = ' + SqlDateTime(ProximaEjecucion) +
        ' WHERE pg_idalerta = '  +   SqlString(FieldByName('pg_idalerta').AsString, False) +
        	' AND pg_orden = '  + SqlString(FieldByName('pg_orden').AsString, False);
			EjecutarSql(sSql);
    end;
		Result := Intervalo;
  finally
		Free;
  end;
end;

function TdmMonitor.DescribirProgramacion(TipoProgramacion: String; Valor: Integer; TipoFrecuencia: String;
																					FrecuenciaDesc: String; Frecuencia, Desde, Hasta: Integer): String;
begin
  Result := '';

  if TipoProgramacion = 'D' then //Programacion Diaria
  begin
    Result := 'Cada ' + IntToStr(Valor) + ' días';
    if TipoFrecuencia = 'U' then
      Result := Result + ' una vez a las ' + TimeToStr((Frecuencia) / 60 / 60 / 24)
    else
    begin
      Result := Result + ' cada ' + IntToStr(Valor) + ' ' + FrecuenciaDesc + '.';
      Result := Result + ' Desde: ' + TimeToStr((Desde)  / 60 / 60 / 24)
                       + ' Hasta: ' + TimeToStr((Hasta) / 60 / 60 / 24);
		end;
	end
  else
    if TipoProgramacion = 'S' then //Programacion Semanal
    begin

    end else if TipoProgramacion = 'M' then //Programacion Mensual
    begin
    
    end;
end;

procedure TdmMonitor.ReloadProcesses;
var
  cant: Integer;
  Event: TRxTimerEvent;
  Intervalo: Integer;
  ListItem: TListItem;
  DescProgramacion: String;
  IdAlerta: Integer;
  sSql: String;
begin
	sSql :=
		'SELECT COUNT(*)' +
     ' FROM cal_alerta' +
    ' WHERE al_fechabaja is null' +
    	' AND al_programacionalterada = ''S''';
  cant := ValorSqlInteger(sSql, 0);

  if (cant > 0) or FLoading then
  try
  	cs.Enter;

    InitAlertas;
    Alertas.Items.Clear;
    sdqProgramacion.Open;
    while not sdqProgramacion.Eof do
    begin
      IdAlerta       := sdqProgramacion.FieldByName('al_id').AsInteger;
      Intervalo      := ActualizarAlerta(IdAlerta);
      Event          := TRxTimerEvent.Create(Self);
      Event.Name     := sdqProgramacion.FieldByName('al_codigo').AsString + sdqProgramacion.FieldByName('pg_orden').AsString;
      Event.OnTimer  := AlertasTimersTimer;
      Event.Interval := Intervalo;
      Event.Tag      := IdAlerta;
      Event.Enabled  := sdqProgramacion.FieldByName('al_activo').AsString = 'S';

      TimerList.Events.Add(Event);
      DescProgramacion := DescribirProgramacion(sdqProgramacion.FieldByName('pg_tipoprogramacion').AsString,
                                                sdqProgramacion.FieldByName('pg_valor').AsInteger,
                                                sdqProgramacion.FieldByName('pg_tipofrecuencia').AsString,
                                                sdqProgramacion.FieldByName('pg_unidadfrecuenciadescripcta').AsString,
                                                sdqProgramacion.FieldByName('pg_frecuencia').AsInteger,
                                                sdqProgramacion.FieldByName('pg_frecuenciadesde').AsInteger,
                                                sdqProgramacion.FieldByName('pg_frecuenciahasta').AsInteger);

      ListItem := Alertas.Items.Add;
      ListItem.Caption := sdqProgramacion.FieldByName('al_codigo').AsString;
      ListItem.SubItems.Add(sdqProgramacion.FieldByName('pg_orden').AsString);
      ListItem.SubItems.Add(sdqProgramacion.FieldByName('al_descripcion').AsString);
      ListItem.SubItems.Add(DescProgramacion);
      ListItem.SubItems.Add(DateTimeToStr((Intervalo / 1000 / 60 / 60 / 24) + Now));
      ListItem.SubItems.Add(sdqProgramacion.FieldByName('al_usuario').AsString);
      ListItem.Data := Event;

      if Event.Enabled then
      	ListItem.ImageIndex := 0
      else
      	ListItem.ImageIndex := 1;

      SetearProgramacionActualizada(IdAlerta);
      sdqProgramacion.Next;
    end;
	finally
  	sdqProgramacion.Close;
    FLoading := False;
    cs.Leave;
  end;
end;

function TdmMonitor.CalcularIntervalo(TipoProgramacion: String; Valor: Integer; TipoFrecuencia: String; Frecuencia,
																			Desde, Hasta: Integer): Integer;
var
  IntervaloEnMS: Double;
  HoraActualEnMS: Double;
  HorasDiasATranscurrir: Double;
  FrecuenciaEnMS: Double;
begin
  IntervaloEnMS := 0;
  HorasDiasATRanscurrir := 0;

  if TipoProgramacion = 'D' then //Programacion Diaria
  begin
    if Valor > 0 then
      HorasDiasATranscurrir := (Valor  - 1) * 24 * 60 * 60 * 1000;
      
    HoraActualEnMS := Time * 24 * 60 * 60 * 1000;
    FrecuenciaEnMS := Frecuencia * 1000;

    if TipoFrecuencia = 'U' then
    begin // Occurs once at
      if HoraActualEnMS < FrecuenciaEnMS then
        IntervaloEnMS := (FrecuenciaEnMS - HoraActualEnMS)
      else
        IntervaloEnMS := (VeinticuatroEnMS - HoraActualEnMS + FrecuenciaEnMS);
    end
    else
    begin // Occurs every

    end;

    IntervaloEnMS := IntervaloEnMS + HorasDiasATRanscurrir;
  end
  else
    if TipoProgramacion = 'S' then
    begin //Programacion Semanal

    end
    else
      if TipoProgramacion = 'M' then
      begin //Programacion Mensual

      end;

  Result := Trunc(IntervaloEnMS);
end;

procedure TdmMonitor.DataModuleCreate(Sender: TObject);
begin
  FLoading := True;
  cs := TcriticalSection.Create;
end;

procedure TdmMonitor.EjecutarAlerta(AIdAlerta: Integer);
begin
  try
    FLogEvento.Lines.Add('Ejecutando Alerta Nº' + IntToStr(AIdAlerta));
  finally
    ProcesarAccionesAlerta(AIdAlerta);
    SetearProgramacionAlterada(AIdAlerta);
  end;
end;

procedure TdmMonitor.AlertasTimersTimer(Sender: TObject);
var
  e: TRxTimerEvent;
begin
  if sender is TRxTimerEvent then
  begin
    e := sender as TRxTimerEvent;
    e.Enabled := False;
    EjecutarAlerta(e.Tag);
  end;
end;

procedure TdmMonitor.RefreshTimersTimer(Sender: TObject);
begin
  ReloadProcesses;
end;

procedure TdmMonitor.SendFiles(AIdAlerta: Integer; APath: String);
var
  destino: TStringList;
  i: Integer;
begin
  destino := ObtenerDestinosAlerta(AIdAlerta);
  try
    for i := 0 to destino.Count - 1 do
      EnviarArchivosEnDirectorio(APath, destino[i]);
  finally
    destino.Free;
  end;
end;

function TdmMonitor.ExpoFiles(AIdProceso: Integer): String;
var
  sProcessCode: String;
  sFileMode: String;
  sEstado: String;
  sPath: String;
  sObservacion: String;
  Login: TLoginData;
resourcestring
  ERROR_TIPOADJUNTO = 'No se puede determinar el tipo de archivo adjunto.';
begin
  sPath := GetNewTempPath;
  sFileMode := 'W';

  with dmPrincipal do
  begin
    with TImpoExpoUtility.create do
    try
      try
        Login.LoginName := DBLoginMonitor.LoginName;
        Login.WindowsComputerName := DBLoginMonitor.WindowsComputerName;
        Login.WindowsUser := DBLoginMonitor.WindowsUser;

        sProcessCode := ValorSqlEx('SELECT pr_codigo' +
                                    ' FROM ipr_proceso' +
                                   ' WHERE pr_id = :id', [AIdProceso]);
        InitParametros(inttostr(AIdProceso), sProcessCode , sPath, sPath, '', sFileMode, Login, '');

    {               for i := 0 to ParamsCount - 1 do begin
                       if params[i].Name = PARAM_IDPRESTADOR then params[i].Text := inttostr( AidPrestador );
                        if params[i].Name = PARAM_IDMAIL then params[i].Text := inttostr( AIdMail );
                        if params[i].Name = PARAM_IDARCHIVO then params[i].Text := inttostr( iId );
                    end;    }
				if Procesar then
          sEstado := 'O'
        else
          sEstado := 'E';

        sObservacion := ProcessMessages;
      finally
        Free;
      end;
    except
      on E : Exception do
        raise exception.create('Error al ejecutar el proceso ' + sProcessCode + '. ' + E.Message);
    end;
  end;

  Result := sPath;
end;

procedure TdmMonitor.EnviarArchivosEnDirectorio(APath: String; ADestino: String);
var
  sr: TSearchRec;
begin
  if FindFirst(IncludeTrailingBackslash(APath) + '*.*', faArchive , sr) = 0 then
  begin
//          EnviarMail(ADestino,'', IncludeTrailingBackslash( APath ) + sr.Name, '', false, true);
    while FindNext(sr) = 0 do
//            EnviarMail(ADestino,'',sr.Name,'', false, true);
      FindClose(sr);
  end;
end;

function TdmMonitor.ObtenerDestinosAlerta(AIdAlerta: Integer): TStringList;
var
  sSql: String;
begin
  Result := TStringList.Create;
  sSql :=
  	'SELECT NVL(au_email, ie_mail) ie_mail' +
     ' FROM cau_alertausuario cau, comunes.v_cie_usuario_int_ext cie' +
    ' WHERE cau.au_idusuario = cie.ie_usuario(+)' +
    	' AND cau.au_idalerta = ' + SqlInteger(AIdAlerta, True);
  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      Result.Add(FieldByName('IE_MAIL').AsString);
      Next;
    end;
  finally
    Free;
  end;
end;

end.
