unit unConsultaTareasSeguimientoJuicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, JvExControls, JvComponent,
  JvTFManager, JvTFDays, JvCalendar, StdCtrls, Mask, ToolEdit, DateComboBox, ComCtrls, ToolWin, PatternEdit,
  CardinalEdit, unArtFrame, unFraCodigoDescripcion, ExtCtrls, FormPanel, DB, SDEngine, JvTFAlarm, unConstLegales,
  unDmPrincipal, ImgList, unSesion, unDmLegales, unABMSeguimientoJuiciosParteDemandada, CustomDlgs, AnsiSql, unfraCodigoDescripcionExt,
  unArtDBAwareFrame;

type
  TApptTareas = Class(TJvTFAppt)
  private
    FDescripcionResultado: String;
    FCompletado: Boolean;
    FTipoTarea: Integer;
    FTipoHecho: Integer;
    FIDJuicio: Integer;
  published
    property Completado: Boolean read FCompletado write FCompletado;
    property DescripcionResultado: String read FDescripcionResultado write FDescripcionResultado;
    property IDJuicio: Integer read FIDJuicio write FIDJuicio;
    property TipoHecho: Integer read FTipoHecho write FTipoHecho;
    property TipoTarea: Integer read FTipoTarea write FTipoTarea;
  end;

  TJvTFApptClass = class of TJvTFAppt;

  TfrmConsultaTareasSeguimientoJuicios = class(TForm)
    tbrAgenda: TToolBar;
    tbEditarTarea: TToolButton;
    tbSeparadorTarea: TToolButton;
    tbImprimirTareas: TToolButton;
    tbSeparadorTareas3: TToolButton;
    lblFechaFijadaTarea: TLabel;
    dtcFechaActualVisualizacion: TDateComboBox;
    mcCalendario: TJvMonthCalendar2;
    fpTareas: TFormPanel;
    lblTipoTarea: TLabel;
    bvSeparadorBotonesTareas: TBevel;
    lblFechaProgramacionTarea: TLabel;
    lblDescripcionTarea: TLabel;
    lblHecho: TLabel;
    lblResultadosObtenidosTarea: TLabel;
    imAlarma: TImage;
    lblMinutosAlarmaAntes: TLabel;
    bvSeparadorBotonesAlarmaTareas: TBevel;
    btnAceptarTarea: TButton;
    btnCancelarTarea: TButton;
    dtcFechaProgramacion: TDateComboBox;
    mDescripcionTarea: TMemo;
    mDescripcionResultadoTarea: TMemo;
    fraTareas: TfraCodigoDescripcion;
    fraHechos: TfraCodigoDescripcion;
    chkCompletado: TCheckBox;
    chkAlarmaActivada: TCheckBox;
    udMinutosAviso: TUpDown;
    ceMinutosAviso: TCardinalEdit;
    teHoraDesde: TDateTimePicker;
    teHoraHasta: TDateTimePicker;
    tbTareaNueva: TToolBar;
    tbEdicionTareas: TToolButton;
    Schedule: TJvTFScheduleManager;
    AlarmaEventos: TJvTFAlarm;
    sdqTareas: TSDQuery;
    tbSalir: TToolButton;
    sdqGetApptQuery: TSDQuery;
    ProgramacionDiaria: TJvTFDays;
    iStates: TImageList;
    imCustom: TImageList;
    Label1: TLabel;
    sdqConsultaJuicio: TSDQuery;
    ToolBar1: TToolBar;
    tbIrJuicio: TToolButton;
    sdqJuicioEnTramite: TSDQuery;
    tbDelete: TToolButton;
    sdqUpdApptQuery: TSDUpdateSQL;
    FraJuicios: TfraCodigoDescripcionExt;
    tbNuevo: TToolButton;
    procedure ProgramacionDiariaDateChanged(Sender: TObject);
    procedure ProgramacionDiariaDateChanging(Sender: TObject; var NewDate: TDate);
    procedure mcCalendarioSelChange(Sender: TObject; StartDate, EndDate: TDateTime);
    procedure dtcFechaActualVisualizacionChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure ScheduleLoadBatch(Sender: TObject; BatchName: String; BatchStartDate, BatchEndDate: TDate);
    procedure ScheduleRefreshAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tbEditarTareaClick(Sender: TObject);
    procedure ProgramacionDiariaDblClick(Sender: TObject);
    procedure btnAceptarTareaClick(Sender: TObject);
    procedure btnCancelarTareaClick(Sender: TObject);
    procedure tbIrJuicioClick(Sender: TObject);
    procedure tbDeleteClick(Sender: TObject);
    procedure ScheduleDeleteAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure SchedulePostAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure FraJuicioscmbDescripcionDropDown(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure AltaTarea;
  private
    FAppt: TApptTareas;
    FIdJuicioEnTramite: Integer;
    FModoTarea: TModoEjecucion;

    procedure CargarDatosTareas(Appt: TApptTareas);
    procedure EditarProgramacion(var Appt: TApptTareas);
    procedure GuardarTarea;
    procedure LimpiarCamposTareas;
    procedure VerTarea;
  public
  end;

const
  MINLENGTH = 4;

var
  frmConsultaTareasSeguimientoJuicios: TfrmConsultaTareasSeguimientoJuicios;

implementation

uses
  SDCommon;

{$R *.dfm}

procedure TfrmConsultaTareasSeguimientoJuicios.ProgramacionDiariaDateChanged(Sender: TObject);
begin
  with ProgramacionDiaria.Template do
	  if ActiveTemplate = agtLinear then
  	  dtcFechaProgramacion.Date := LinearStartDate
	  else
  	  dtcFechaProgramacion.Date := CompDate;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.ProgramacionDiariaDateChanging(Sender: TObject; var NewDate: TDate);
begin
	ProgramacionDiaria.ScheduleManager.PostAppts;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.mcCalendarioSelChange(Sender: TObject; StartDate, EndDate: TDateTime);
var
	Y, M, D: Word;
begin
  dtcFechaActualVisualizacion.Date := StartDate;
  with sdqTareas do
  try
  	ParamByName('FechaDesde').AsDate := mcCalendario.DateFirst - 90;
    ParamByName('FechaHasta').AsDate := mcCalendario.DateFirst + 90;

    Open;
    while not Eof do
    begin
    	DecodeDate(FieldByName('ja_fechainicio').AsDateTime, Y, M, D);
      mcCalendario.Bold[Y,M,D] := True;
      Next;
    end;
	finally
  	Close;
  end;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.dtcFechaActualVisualizacionChange(Sender: TObject);
begin
	if dtcFechaActualVisualizacion.IsValid then
  begin
  	ProgramacionDiaria.GotoDate(dtcFechaActualVisualizacion.Date);
    mcCalendario.DateFirst := dtcFechaActualVisualizacion.Date;
  end;
  //  ProgramacionSemanal.DisplayDate := dtcFechaActualVisualizacion.Date;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.FormCreate(Sender: TObject);
begin
  dtcFechaActualVisualizacion.Date := Date;

  with fraJuicios do
  begin
    TableName 	:= 'LEGALES.LJT_JUICIOENTRAMITE';
    FieldID     := 'jt_id';
    FieldCodigo := 'JT_NUMEROCARPETA';
    FieldDesc   := 'JT_DEMANDANTE || '' C/ '' || JT_DEMANDADO || '' '' || JT_CARATULA';
    FieldBaja   := 'jt_fechabaja';
    Showbajas   := True;
  end;

  with fraTareas do
  begin
    TableName   := 'legales.ltt_tipotarea';
    FieldID     := 'tt_id';
    FieldCodigo := 'tt_id';
    FieldDesc   := 'tt_descripcion';
    Showbajas   := True;
  end;

  with fraHechos do
  begin
    TableName   := 'legales.lth_tipohecho';
    FieldID     := 'th_id';
    FieldCodigo := 'th_id';
    FieldDesc   := 'th_descripcion';
    Showbajas   := True;
  end;

  mcCalendarioSelChange(Sender, Date, Date);
end;

procedure TfrmConsultaTareasSeguimientoJuicios.tbSalirClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.ScheduleLoadBatch(Sender: TObject; BatchName: String; BatchStartDate,
																																 BatchEndDate: TDate);
var
  Appt: TApptTareas;
  NewAppt: Boolean;
begin
  with sdqTareas do
  Begin
    ParamByName('FechaDesde').AsDate := BatchStartDate;
    ParamByName('FechaHasta').AsDate := BatchEndDate;

    Open;
    while not Eof do
    begin
      Schedule.RequestAppt(FieldByName('ja_appid').AsString, TjvTFAppt(Appt), NewAppt);

      if NewAppt then
      begin
        // La clase TJvTFAppt y la Clase TJvTFScheduleManager dejan pocas opciones para extender la primera.
        // Si TApptTareas de TJvTFAppt el método de TJvTFScheduleManager RequestAppt devuelve siempre TjvTFAppt en caso
        // de que ser un appoinment nuevo. La unica salida posible fue liberarlo y crearlo como corresponde.
        //
        Appt.Free;
        Appt := TApptTareas.Create(Schedule,'');
        Appt.SetStartEnd(FieldByName('ja_fechainicio').AsDateTime,
                         FieldByName('ja_fechainicio').AsDateTime,
                         FieldByName('ja_fechafin').AsDateTime,
                         FieldByName('ja_fechafin').AsDateTime);

        Appt.Description 					:= FieldByName('JA_DESCRIPCIONEVENTO').AsString;
        Appt.AlarmEnabled 				:= FieldByName('JA_ALARMAACTIVADA').AsString = 'S';
        Appt.AlarmAdvance 				:= FieldByName('JA_ALARMA').AsInteger;
        Appt.Completado 					:= FieldByName('JA_COMPLETADO').AsString = 'S';
        Appt.DescripcionResultado := FieldByName('JA_RESULTADOEVENTO').AsString;
        Appt.TipoTarea 						:= FieldByName('JA_IDTIPOTAREA').AsInteger;
        Appt.TipoHecho 						:= FieldByName('JA_IDHECHO').AsInteger;
        Appt.FIDJuicio 						:= FieldByName('JA_IDNROJUICIO').AsInteger;
        if not FieldByName('ja_appid').IsNull then
        	Appt.FID := FieldByName('ja_appid').AsString;
        Appt.AddSchedule('Tareas');

      end;
      Next;
    end;
    Close;
  end;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.ScheduleRefreshAppt(Sender: TObject; Appt: TJvTFAppt);
begin
  try
    Appt.ClearSchedules;
    with sdqGetApptQuery do
    begin
      ParamByName('appid').AsString := Appt.ID;
      Open;
      if RecordCount = 1 then
      begin
      	Appt.SetStartEnd(FieldByName('ja_fechainicio').AsDateTime,
                         FieldByName('ja_fechainicio').AsDateTime,
                         FieldByName('ja_fechafin').AsDateTime,
                         FieldByName('ja_fechafin').AsDateTime);

        Appt.Description 											 := FieldByName('JA_DESCRIPCIONEVENTO').AsString;
        Appt.AlarmEnabled 										 := FieldByName('JA_ALARMAACTIVADA').AsString = 'S';
        Appt.AlarmAdvance 										 := FieldByName('JA_ALARMA').AsInteger;
        TApptTareas(Appt).Completado 					 := FieldByName('JA_COMPLETADO').AsString = 'S';
        TApptTareas(Appt).DescripcionResultado := FieldByName('JA_RESULTADOEVENTO').AsString;
        TApptTareas(Appt).TipoTarea 					 := FieldByName('JA_IDTIPOTAREA').AsInteger;
        TApptTareas(Appt).TipoHecho 					 := FieldByName('JA_IDHECHO').AsInteger;
        TApptTareas(Appt).FIDJuicio 					 := FieldByName('JA_IDNROJUICIO').AsInteger;
      end;
      Appt.AddSchedule('Tareas');
      Close;
    end;
  finally
  	sdqGetApptQuery.Close;
  end;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.FormShow(Sender: TObject);
begin
  ProgramacionDiaria.Template.ActiveTemplate 	:= agtLinear;
	ProgramacionDiaria.Template.LinearName 			:= 'Tareas';
  ProgramacionDiaria.Template.LinearStartDate := dtcFechaActualVisualizacion.Date;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.Button1Click(Sender: TObject);
begin
  ProgramacionDiaria.GotoDate(dtcFechaActualVisualizacion.Date);
end;

procedure TfrmConsultaTareasSeguimientoJuicios.tbEditarTareaClick(Sender: TObject);
begin
  VerTarea;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.ProgramacionDiariaDblClick(Sender: TObject);
begin
  VerTarea;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.VerTarea;
begin
  if Assigned(ProgramacionDiaria.SelAppt) then
  begin
		Self.FAppt := TApptTareas(ProgramacionDiaria.SelAppt);
    EditarProgramacion(self.FAppt);
    FModoTarea := meModificacion;
    tbIrJuicio.Enabled := True;
    FraJuicios.Locked := True;
    fpTareas.ShowModal;
  end;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.EditarProgramacion(var Appt: TApptTareas);
var
  ApptStartDate: TDate;
  ApptEndDate: TDate;
  ApptStartTime: TTime;
  ApptEndTime: TTime;
begin
  if Assigned(Appt) then
  begin
    dtcFechaProgramacion.Date 			:= Appt.StartDate;
    teHoraDesde.Time 								:= Appt.StartTime;
    teHoraHasta.Time 								:= Appt.EndTime;
    chkAlarmaActivada.Checked 			:= Appt.AlarmEnabled;
    ceMinutosAviso.Text 						:= IntToStr(Appt.AlarmAdvance);
    udMinutosAviso.Position 				:= Appt.AlarmAdvance;
    mDescripcionTarea.Text 					:= Appt.Description;
    mDescripcionResultadoTarea.Text := Appt.DescripcionResultado;
    chkCompletado.Checked 					:= Appt.Completado;
    fraTareas.Codigo 								:= InttoStr(Appt.TipoTarea);
    fraHechos.Codigo 								:= InttoStr(Appt.TipoHecho);
    FIdJuicioEnTramite 							:= Appt.IDJuicio;
	end
  else
  begin
    Appt := TApptTareas.Create(Schedule, '');
    Appt.Persistent := True;
    if ProgramacionDiaria.ValidSelection then
    begin
    	ApptStartDate := ProgramacionDiaria.Cols[ProgramacionDiaria.SelStart.X].SchedDate;
      ApptEndDate := ProgramacionDiaria.Cols[ProgramacionDiaria.SelEnd.X].SchedDate;
      ApptStartTime := ProgramacionDiaria.RowToTime(ProgramacionDiaria.SelStart.Y);
      ApptEndTime := ProgramacionDiaria.RowEndTime(ProgramacionDiaria.SelEnd.Y);
    end
		else
    begin
    	ApptStartDate := Date;
      ApptEndDate 	:= Date;
      ApptStartTime := Time;
      ApptEndTime 	:= ApptStartTime +
                       EncodeTime(0, ProgramacionDiaria.Granularity - 1, 0, 0) +
                       EncodeTime(0, 1, 0, 0);
    end;
    Appt.BeginUpdate;
    Appt.SetStartEnd(ApptStartDate, ApptStartTime, ApptEndDate, ApptEndTime);
    Appt.AlarmEnabled := True;
    Appt.AlarmAdvance := 15;
  end;
  CargarDatosTareas(Appt);
end;

procedure TfrmConsultaTareasSeguimientoJuicios.CargarDatosTareas(Appt: TApptTareas);
begin
  if Assigned(Appt) then
  begin
    dtcFechaProgramacion.Date := Appt.StartDate;

    teHoraDesde.time := appt.StartTime;
    teHoraHasta.Time := appt.EndTime;

    mDescripcionTarea.Text := appt.Description;
    mDescripcionResultadoTarea.Text := appt.DescripcionResultado;

    fraTareas.Codigo := IntToStr(appt.TipoTarea);
    fraHechos.Codigo := IntToStr(appt.TipoHecho);

    chkCompletado.Checked 		:= appt.Completado;
    chkAlarmaActivada.Checked := appt.AlarmEnabled;
    ceMinutosAviso.Value 			:= appt.AlarmAdvance;
    udMinutosAviso.Position 	:= appt.AlarmAdvance;
    FraJuicios.Codigo 				:= ValorSql('SELECT JT_NUMEROCARPETA FROM LEGALES.LJT_JUICIOENTRAMITE WHERE JT_ID = ' + SqlValue(FIdJuicioEnTramite), '');

//    try
//      sdqConsultaJuicio.Params.ParamByName('jt_id').Value := FIdJuicioEnTramite;
//      sdqConsultaJuicio.Open;
//      edNroJuicio.Text := sdqConsultaJuicio.fieldbyname('JT_NUMEROCARPETA').AsString;
//      edDemandante.Text := sdqConsultaJuicio.fieldbyname('jt_demandante').AsString;
//      edDemandado.Text := sdqConsultaJuicio.fieldbyname('jt_demandado').AsString;
//      edCARATULA.Text := sdqConsultaJuicio.fieldbyname('jt_caratula').AsString;
//    finally
//      sdqConsultaJuicio.Close;
//    end;

  end;
end;


procedure TfrmConsultaTareasSeguimientoJuicios.btnAceptarTareaClick(Sender: TObject);
begin
  GuardarTarea;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.btnCancelarTareaClick(Sender: TObject);
begin
  if Assigned(FAppt) and (FModoTarea = meAlta) then
    FAppt.Free;

  FAppt := nil;
  fpTareas.Close;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.tbIrJuicioClick(Sender: TObject);
begin
	with TfrmAdminstracionJuicioParteDemandanda.Create(Self) do
  try
  	sdqJuicioEnTramite.ParamByName('jt_id').AsInteger := FIdJuicioEnTramite;
    try
    	sdqJuicioEnTramite.Open;
//      GuardarInfoBloqueo(FAppt.IDJuicio, 'J', Sesion.LoginName);
      Modificacion(sdqJuicioEnTramite);
      Schedule.RefreshAppts;
      ProgramacionDiaria.Refresh;
      BeginTrans(True);
//      EliminarInfoBloqueo(dmPrincipal, sdqJuicioEnTramite.FieldByName('jt_id').AsInteger, 'J', Sesion.LoginName);
      CommitTrans(True);
    except
    	on E: ESDEngineError do
      begin
      	if E.NativeError = 54 then
        begin
        	Rollback(true);
          MessageDlg('El registro está siendo utilizado por el usuario ' +
//          						GetInfoBloqueo(sdqJuicioEnTramite.FieldByName('jt_id').AsInteger, 'J') + '.' + #13#10 +
                      'Por esa razón no podrá guardar ningún cambio.', mtWarning, [mbOK], 0);
          sdqJuicioEnTramite.ParamByName('jt_id').AsInteger := FAppt.IDJuicio;
          sdqJuicioEnTramite.Open;
          ConsultarJuicio(sdqJuicioEnTramite);
        end;
      end;
    end;
  finally
  	sdqJuicioEnTramite.Close;
    Free;
  end;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.GuardarTarea;
var
  I: Integer;
begin
  VerificarMultiple(['Guardando Tarea',
                      FraJuicios.cmbDescripcion,
                      FraJuicios.IsSelected,
                      'Debe asignar un juicio a la tarea.',
                      dtcFechaProgramacion,
                      dtcFechaProgramacion.Date > 0,
                      'Debe especificar una fecha para la tarea',
//                      dtcFechaProgramacion,
//                      dtcFechaProgramacion.Date >= edFECHANOTIFICACION.Date,
//                      'La Fecha de la tarea no puede ser anterior a la fecha de notificación del juicio.',
                      teHoraDesde, teHoraDesde.Time > 0,
                      'Debe especificar una hora de inicio de la tarea.',
                      teHoraHasta, teHoraHasta.Time > 0,
                      'Debe especificar una hora de fin de la tarea',
                      fraTareas, fraTareas.Codigo <> '',
                      'Debe especificar una tarea.',
                      fraHechos, fraHechos.Codigo <> '',
                      'Debe especificar un hecho',
                      mDescripcionTarea, trim(mDescripcionTarea.Text) <> '',
                      'Debe especificar una descripción para la tarea.']);


  if Assigned(self.FAppt) then
  begin
    with Self do
    begin
    	FAppt.BeginUpdate;
      BeginTrans(True);
      try
      	FAppt.SetStartEnd(dtcFechaProgramacion.Date, teHoraDesde.Time, dtcFechaProgramacion.Date, teHoraHasta.Time);
        FAppt.AlarmEnabled 				 := chkAlarmaActivada.Checked;
        FAppt.AlarmAdvance 				 := ceMinutosAviso.Value;
        FAppt.Description 				 := mDescripcionTarea.Text;
        FAppt.DescripcionResultado := mDescripcionResultadoTarea.Text;

        FAppt.Completado := chkCompletado.Checked;
        FAppt.TipoTarea  := StrToInt(fraTareas.Codigo);
        FAppt.TipoHecho  := StrToInt(fraHechos.Codigo);

        if FModoTarea = meAlta then
        begin
        	if ProgramacionDiaria.ValidSelection then
          	for I := ProgramacionDiaria.SelStart.X to ProgramacionDiaria.SelEnd.X do
            	FAppt.AddSchedule(FraJuicios.ID);
          FAppt.Persistent := False;
        end;
      finally
      	FAppt.EndUpdate;  // this causes the appt to be posted
        FAppt.Refresh;
        CommitTrans(True);
      end;
    end;
  end;
  FAppt := nil;

  fpTareas.close;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.tbDeleteClick(Sender: TObject);
begin
  if Assigned(ProgramacionDiaria.SelAppt) and (MsgBox('¿ Desea dar de baja la tarea actual ?',
  	 MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
    ProgramacionDiaria.SelAppt.Delete;
  end;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.ScheduleDeleteAppt(Sender: TObject; Appt: TJvTFAppt);
var
	sSql: String;
begin
	sSql :=
		'UPDATE legales.lja_juicioentramiteagenda' +
    	' SET ja_fechabaja = SYSDATE' +
      	 ', ja_usualta = ' + SqlValue(Sesion.LoginName) +
  	' WHERE ja_appid = ' + SqlValue(Appt.ID);
  EjecutarSql(sSql);
end;

procedure TfrmConsultaTareasSeguimientoJuicios.SchedulePostAppt(Sender: TObject; Appt: TJvTFAppt);
begin
  try
    BeginTrans(True);
    with sdqGetApptQuery do
    begin
    	ParamByName('appid').AsString := Appt.ID;
      Open;

      if RecordCount > 0 then
      begin
        Edit;
        FieldByName('ja_fechamodif').AsDateTime := DBDateTime;
        FieldByName('ja_usumodif').AsString 		:= Sesion.LoginName;
      end
      else
      begin
        Insert;
        FieldByName('ja_id').AsInteger 				 := GetSecNextVal('LEGALES.SEQ_LJA_ID');
        FieldByName('ja_AppID').AsString 			 := Appt.ID;
        FieldByName('ja_idNroJuicio').AsString := FraJuicios.ID;
        FieldByName('ja_fechaalta').AsDateTime := DBDateTime;
        FieldByName('ja_usualta').AsString 		 := Sesion.LoginName;
      end;

      FieldByName('ja_fechainicio').AsDateTime 		 := Appt.StartDate + Appt.StartTime;
      FieldByName('ja_fechafin').AsDateTime 			 := Appt.EndDate + Appt.EndTime;
      FieldByName('JA_DESCRIPCIONEVENTO').AsString := Appt.Description;

      if Appt.AlarmEnabled then
      	FieldByName('JA_ALARMAACTIVADA').Asstring :=  'S'
      else
      	FieldByName('JA_ALARMAACTIVADA').Asstring :=  'N';

      FieldByName('JA_ALARMA').AsInteger := Appt.AlarmAdvance;

      if TApptTareas(Appt).Completado then
      	FieldByName('JA_COMPLETADO').AsString := 'S'
      else
      	FieldByName('JA_COMPLETADO').AsString := 'N';

      FieldByName('JA_RESULTADOEVENTO').AsString := TApptTareas(Appt).DescripcionResultado;
      FieldByName('JA_IDTIPOTAREA').AsInteger    := TApptTareas(Appt).TipoTarea;
      FieldByName('JA_IDHECHO').AsInteger        := TApptTareas(Appt).TipoHecho;

      Post;
      ApplyUpdates;
    end;
  finally
    sdqGetApptQuery.Close;
    CommitTrans(True);
  end;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.FraJuicioscmbDescripcionDropDown(Sender: TObject);
begin
  with FraJuicios do
  begin
    if (Length(Trim(cmbDescripcion.Text)) < MINLENGTH) then
    begin
      Clear;
      InvalidHint(cmbDescripcion, 'El mínimo a ingresar es ' + inttostr(MINLENGTH) + ' caracteres.' , 'Advertencia', blnWarning);
    end
    else
    begin
      ExtraJoinCondition := ' (JT_CARATULA LIKE ' + SQL_QUOTE + SQL_WILLCARD + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE +
					              ' OR JT_DEMANDANTE LIKE ' + SQL_QUOTE + SQL_WILLCARD + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE +
          					     ' OR JT_DEMANDADO LIKE ' + SQL_QUOTE + SQL_WILLCARD + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE + ') ';

      cmbDescripcionDropDown(Sender);
    end;
  end;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.tbNuevoClick(Sender: TObject);
begin
  AltaTarea;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.AltaTarea;
begin
  LimpiarCamposTareas;
  FModoTarea := meAlta;
  FIdJuicioEnTramite := -1;
  tbIrJuicio.Enabled := False;
  EditarProgramacion(Self.FAppt);
  fpTareas.ShowModal;
end;

procedure TfrmConsultaTareasSeguimientoJuicios.LimpiarCamposTareas;
begin
  FraJuicios.Codigo := '';
  FraJuicios.Locked := False;
  dtcFechaProgramacion.Text := '';
  teHoraDesde.Time := EncodeTime(8,0,0,0);
  teHoraHasta.Time := EncodeTime(8,0,0,0);
  fraTareas.Codigo := '';
  fraHechos.Codigo := '';
  mDescripcionTarea.Text := '';
  mDescripcionResultadoTarea.text := '';
  chkAlarmaActivada.Checked := False;
  ceMinutosAviso.Value := 0;
end;

end.
