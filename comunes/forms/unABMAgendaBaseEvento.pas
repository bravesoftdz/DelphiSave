unit unABMAgendaBaseEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unABMAgendaBase, AdvGlowButton, ComCtrls, unfraContacto, StdCtrls, unFraEmpresa,
  unFraCodDesc, Mask, ToolEdit, DateComboBox, ExtCtrls, JvExExtCtrls, unFraDomicilio,
  unArtDbFrame, unFraTrabajador, unArtFrame, unArtDBAwareFrame, JvTFManager,
  unFraCodigoDescripcion, unFraEstablecimiento, ImgList, AdvOfficePager,
  AdvOfficePagerStylers, XPMenu, Placemnt, AdvToolBar, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, AdvToolBarStylers, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ShortCutControl, DB, SDEngine, FormPanel, JvExDBGrids, JvDBGrid,
  unfraCPR_PRESTADOR, unfraContactoAgenda, unFraTrabajadorSiniestro,
  unfraEmpresaAGENDA, unfraTrabajadorAGENDA, unfraEntidadVendedorAGENDA,
  unfraTrabajadorSiniestroAGENDA, unfraPrestadorAGENDA,
  unfraDomicilioEmpresaAGENDA, unfraEstablecimientoAGENDA, unInterfaces,
  unfraDomicilioEstablecimientoAGENDA, unAgenda, unfraNumAutoAGENDA,
  unfraContactoLibreAGENDA, unFraDomicilioGIS, unfraDomicilioAGENDA,
  ArtDBGrid, unFraUsuarioConJerarquias, DBCtrls, JvExMask, JvToolEdit,
  AdvOfficeButtons, AdvSmoothSlider, unfraProspectosAGENDA, CheckLst,
  ARTCheckListBox, Login, artDbLogin, artSeguridad, AdvCardList,
  DBAdvCardList, JvExComCtrls, JvComponent, JvDBTreeView, JvNavigationPane,
  JvPanel, unFraEmpresaAfi, unfraEmpresaSolicitudAGENDA,
  unfraDatoFechaAGENDA, JvComponentBase, RxPlacemnt, JvExtComponent, RxToolEdit;

type
  TfrmABMAgendaBaseEvento = class(TfrmABMAgendaBase)
    AdvOfficeStatusBarTareas: TAdvOfficeStatusBar;
    btnAgregarTarea: TAdvGlowButton;
    btnDesVincularTarea: TAdvGlowButton;
    btnEliminarTarea: TAdvGlowButton;
    btnModificarTarea: TAdvGlowButton;
    btnVincularTarea: TAdvGlowButton;
    DBAdvCardListTareasAsociadas: TDBAdvCardList;
    dsTareasAsociadas: TDataSource;
    dsUsuariosNotificados: TDataSource;
    edDetalleTarea: TDBMemo;
    GridTareasAsociadas: TArtDBGrid;
    GridUsuariosNotificados: TJvDBGrid;
    ImageListSeguimiento: TImageList;
    JvDBTreeViewUsuarios: TJvDBTreeView;
    jvtlkspltrH: TJvOutlookSplitter;
    jvtlkspltrV: TJvOutlookSplitter;
    pnlBottom: TPanel;
    sdqTareasAsociadas: TSDQuery;
    sdqUsuariosNotificados: TSDQuery;
    sdqUsuariosNotificadosACCION: TStringField;
    sdqUsuariosNotificadosFECHA: TDateTimeField;
    sdqUsuariosNotificadosFLOAT_ICON: TFloatField;
    sdqUsuariosNotificadosICONO: TIntegerField;
    sdqUsuariosNotificadosID: TFloatField;
    sdqUsuariosNotificadosMASTER_FIELD: TFloatField;
    sdqUsuariosNotificadosSE_NOMBRE: TStringField;
    sdqUsuariosNotificadosTIPO: TFloatField;
    ShortCutControl: TShortCutControl;
    tsTareaAsociada: TTabSheet;
    tsTareasAsociadas: TAdvPage;
    pgSeguimiento: TAdvPage;
    tsSeguimiento: TTabSheet;
    sdqSeguimiento: TSDQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    IntegerField1: TIntegerField;
    dsSeguimiento: TDataSource;
    tvSeguimiento: TJvDBTreeView;
    jvtlkspltrSeguimiento: TJvOutlookSplitter;
    dbgUsuarios: TJvDBGrid;
    procedure AdvToolBarPagerChange(Sender: TObject);
    procedure AdvToolBarPagerChanging(Sender: TObject; FromPage, ToPage: Integer; var AllowChange: Boolean);
    procedure btnAgregarTareaClick(Sender: TObject);
    procedure btnAnalizarPosibleTareaClick(Sender: TObject);
    procedure btnDesVincularTareaClick(Sender: TObject);
    procedure btnEliminarObservacionClick(Sender: TObject);
    procedure btnEliminarTareaClick(Sender: TObject);
    procedure btnModificarTareaClick(Sender: TObject);
    procedure btnVincularTareaClick(Sender: TObject);
    procedure DBAdvCardListTareasAsociadasCardDblClick(Sender: TObject; Card: TAdvCard);
    procedure edFechaEventoChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure fpSpeechBeforeShow(Sender: TObject);
    procedure fraProcesoPropiedadesChange(Sender: TObject);
    procedure GridTareasAsociadasDblClick(Sender: TObject);
    procedure GridTareasAsociadasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure OnChangeMotivoIngreso(Sender: TObject); override;
    procedure OnChangeTipo(Sender: TObject); override;
    procedure PageControlEventosChange(Sender: TObject);
    procedure sdqTareasAsociadasAfterOpen(DataSet: TDataSet);
    procedure sdqTareasAsociadasAfterScroll(DataSet: TDataSet);
    procedure sdqUsuariosNotificadosCalcFields(DataSet: TDataSet);
  private
    FContacto, FTelefono, FCorreoElectronico: String;
    function GetTipoEvento: String;
  protected
    procedure AprobarRechazar(ATipo: String; AEstado: Integer); override;
    function GetApptObject: TApptBase; override;
    procedure Guardar(CanClose: Boolean = True); override;
    procedure InternalSetModoAutorizacion; override;
    procedure LoadApptIntoComponents(objAppt: TApptBase; bSoloDatos: Boolean = False); override;
    procedure LockDataObjects(ALockControls: Boolean = True); override;
    procedure LockTareasAsociadas(ABlock: Boolean = True);
    procedure RecuperarResolucion; override;
    procedure SaveComponentsToAppt(objAppt: TApptBase); override;
    procedure SetModoABM(const Value: TModoABM); override;
    procedure SetModoCallCenter(Value: Boolean); override;
  public
    procedure AltaEvento(AFechaDesde: TDateTime = 0; AHoraDesde: TDateTime = 0;
                         AFechaHasta: TDateTime = 0; AHoraHasta: TDateTime = 0);
    class procedure AssignRecordToAppt(objAppt: TJvTFAppt; objConsulta: TSDQuery); override;
    procedure LoadFromAppt(objAppt: TJvTFAppt); override;
    procedure LoadFromQuery(objQuery: TSDQuery; bModoCallCenter: Boolean = False; bAutorizacion: Boolean = False); override;
    procedure RecuperarInsatisfaccion; override;
    procedure RegisterNotes(AContacto, ATelefono, ACorreoElectronico: String);
    function Save: Boolean; override;
    procedure SaveApptToDataBase; override;
    function Validar(PermiteCerrar: Boolean = True; GeneraTarea: Boolean = False): Boolean; override;
    property Contacto: String read FContacto;
    property CorreoElectronico: String read FCorreoElectronico;
    property Telefono: String read FTelefono;
  end;

var
  frmABMAgendaBaseEvento: TfrmABMAgendaBaseEvento;

implementation

uses
  VCLExtra, unDmPrincipal, CustomDlgs, General, unSesion, unABMAgendaBaseTarea, JvTrayIcon,
  unSeleccionTareas, unArt, StrFuncs, Numeros, unPrincipal, unSIC, CommCtrl;

{$R *.dfm}

procedure TfrmABMAgendaBaseEvento.AdvToolBarPagerChange(Sender: TObject);
begin
  inherited;
  if AdvToolBarPager.ActivePage = tsTareasAsociadas then
    PageControlEventos.ActivePage := tsTareaAsociada
  else if AdvToolBarPager.ActivePage = pgSeguimiento then
    PageControlEventos.ActivePage := tsSeguimiento;
end;

procedure TfrmABMAgendaBaseEvento.AdvToolBarPagerChanging(Sender: TObject; FromPage, ToPage: Integer; var AllowChange: Boolean);
begin
  inherited;
  {
  if (ModoABM = abmAlta) and (ToPage = tsTareaAsociada.PageIndex) then
  begin
    FSaveWithoutClosing := True;
    LockTareasAsociadas(False);
  end;
  if (ToPage <> tsTareaAsociada.PageIndex) then
    FSaveWithoutClosing := False;
  }
  if (ToPage = tsSeguimiento.PageIndex) then
  begin
    OpenQueryEx(sdqSeguimiento, [TApptEvento(ApptObject).IdTareaOrigen]);
    tvSeguimiento.Perform(TVM_SETITEMHEIGHT, 20, 0);
    tvSeguimiento.FullExpand;
  end;
end;

procedure TfrmABMAgendaBaseEvento.btnAgregarTareaClick(Sender: TObject);
var
  bGuardar: Boolean;
begin
  bGuardar := False;
  if (ModoABM = abmAlta) then
  begin
    if MsgAsk('Para continuar dando de alta una tarea debe almacenar el actual evento.' + CRLF + '¿Desea hacerlo ahora?') then
      bGuardar := True
    else
      Abort;
  end else
    bGuardar := True;

  if bGuardar then
  begin
    FinishAppt := False;
    SaveWithoutClosing := True;
    EventoAlmacenadoPeroEnModoAlta := True;

    if Validar(False, True) then
    begin
      Guardar(False);
      LoadApptIntoComponents(ApptObject);
      LockDataObjects;
      LockObservaciones(False);
      LockAdjuntos(False);
      FSaveWithoutClosing := False;
    end else
      Abort;
  end;

  Abrir(TfrmABMAgendaBaseTarea, frmABMAgendaBaseTarea, tmvNormal, nil);
  with frmABMAgendaBaseTarea do
  begin
    HideAllBalloons;
    ModoCallCenter := Self.ModoCallCenter;
    AssignEventAppt(Self.ApptObject);
    ModoABM := abmAlta;
    AltaTarea;
    Visible := False;
    LoadBasicData(Self.fraProceso.Codigo, Self.fraMotivoIngreso.Codigo, Self.IDAgendaEvento);
    if ShowModal = mrOk then
    begin
      OpenQueryEx(sdqTareasAsociadas, [Sesion.ID, IDAgendaEvento]);
      Self.btnCancelar.Enabled := not sdqTareasAsociadas.IsEmpty;
    end else
    begin
      EjecutarSqlEx('UPDATE agenda.aae_agendaevento ' +
                       'SET ae_estado = :estado ' +
                     'WHERE ae_appid = :appid', [ESTADO_EVENTO_PENDIENTE, FIDAppt]);
      Self.ApptObject.Estado := ESTADO_EVENTO_PENDIENTE;
      LoadApptIntoComponents(Self.ApptObject);
      LockDataObjects(False);
      LockObservaciones(False);
      LockAdjuntos(False);
      Self.btnCancelar.Enabled := False;
      Self.AdvToolBarPager.CaptionButtons := Self.AdvToolBarPager.CaptionButtons - [cbClose];
    end;
  end;

  btnCerrar.Enabled := sdqTareasAsociadas.IsEmpty and (ApptObject.Estado <> ESTADO_EVENTO_TERMINADO);
end;

procedure TfrmABMAgendaBaseEvento.btnAnalizarPosibleTareaClick(Sender: TObject);
begin
  inherited;
  fpSpeech.ModalResult := mrOk;
  AdvToolBarPager.ActivePage := tsTareasAsociadas;
end;

procedure TfrmABMAgendaBaseEvento.btnDesVincularTareaClick(Sender: TObject);
begin
  inherited;
  if sdqTareasAsociadas.Active and (not sdqTareasAsociadas.IsEmpty) then
  begin
    if MsgBox('¿Está seguro que desea eliminar la asociación de la tarea?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      EjecutarSqlEx('UPDATE agenda.aat_agendatarea ' +
                       'SET at_idagendaevento = null ' +
                     'WHERE at_id = :id', [sdqTareasAsociadas.FieldByName('TE_ID').AsString]);
      sdqTareasAsociadas.Refresh;
    end;
  end;
end;

procedure TfrmABMAgendaBaseEvento.btnEliminarObservacionClick(Sender: TObject);
var
  sPrefijo: String;
begin
  if not sdqConsulta.IsEmpty then
  begin
    sPrefijo := sdqConsulta.FieldByName('prefijo').AsString;

    if MsgBox('¿Desea dar de baja la observación?', MB_ICONQUESTION + MB_YESNO, 'Baja Observación') = IDYES then
      EjecutarSqlEx('UPDATE ' + sdqConsulta.FieldByName('tabla').AsString + ' ' +
                       'SET ' + sPrefijo + 'usubaja = :usuario, '
                              + sPrefijo + 'fechabaja = SYSDATE ' +
                     'WHERE ' + sPrefijo + 'usubaja IS NULL ' +
                       'AND ' + sPrefijo + 'id = :id', [Sesion.UserID, sdqConsulta.FieldByName('id').AsInteger]);
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmABMAgendaBaseEvento.btnEliminarTareaClick(Sender: TObject);
begin
  if sdqTareasAsociadas.Active and (not sdqTareasAsociadas.IsEmpty) then
  begin
    if MsgBox('¿Está seguro que desea eliminar la tarea?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      EliminarTarea(sdqTareasAsociadas.FieldByName('AT_ID').AsInteger);
      sdqTareasAsociadas.Refresh;
    end;
  end;
end;

procedure TfrmABMAgendaBaseEvento.btnModificarTareaClick(Sender: TObject);
begin
  if sdqTareasAsociadas.Active and (not sdqTareasAsociadas.IsEmpty) then
  begin
    Abrir(TfrmABMAgendaBaseTarea, frmABMAgendaBaseTarea, tmvNormal, nil);
    with frmABMAgendaBaseTarea do
    try
      HideAllBalloons;
      ModoCallCenter := Self.ModoCallCenter;
      ModoABM := abmModificacion;
      LoadFromQuery(sdqTareasAsociadas);

      Visible := False;
      if ShowModal = mrOk then
        OpenQuery(sdqTareasAsociadas);
    finally
      frmABMAgendaBaseTarea.Free;
    end;
  end;
end;

procedure TfrmABMAgendaBaseEvento.btnVincularTareaClick(Sender: TObject);
begin
  Abrir(TfrmSeleccionTareas, frmSeleccionTareas, tmvHidden, nil);
  with frmSeleccionTareas do
  begin
    HideAllBalloons;
    Load(IDAgendaEvento, fraXX_CONTRATO.Contrato, fraEstablecimientoAgenda.NroEstablecimiento, fraTrabajadorAgenda.Value);
    btnRefrescarClick(nil);
    if ShowModal = mrOk then
      OpenQuery(sdqTareasAsociadas);
  end;
  VCLExtra.DynColWidthsByData(GridTareasAsociadas);
end;

procedure TfrmABMAgendaBaseEvento.DBAdvCardListTareasAsociadasCardDblClick(Sender: TObject; Card: TAdvCard);
begin
  inherited;
  btnModificarTarea.Click;
end;

procedure TfrmABMAgendaBaseEvento.edFechaEventoChange(Sender: TObject);
begin
  inherited;
    if (ModoABM = abmAlta) and ModoCallCenter then
    edFechaFin.Date := edFechaEvento.Date;
end;

procedure TfrmABMAgendaBaseEvento.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (cbClose in Self.AdvToolBarPager.CaptionButtons) or (not(fraRespuesta.IsEmpty and IsEmptyString(edResultado.Text))) or (not sdqTareasAsociadas.IsEmpty);
  inherited;
end;

procedure TfrmABMAgendaBaseEvento.FormCreate(Sender: TObject);
begin
  tsSeguimiento.TabVisible := False;
  pgSeguimiento.TabVisible := False;

  EventoAlmacenadoPeroEnModoAlta := False;

  FObservaciones_Tabla := 'agenda.aoe_observacionevento';
  FObservaciones_Prefijo := 'oe_';
  FObservaciones_ForeignKey := 'idagendaevento';

  FAdjuntos_Tabla := 'agenda.aje_adjuntoevento';
  FAdjuntos_Prefijo := 'je_';
  FAdjuntos_ForeignKey := 'idagendaevento';

  inherited;
  VCLExtra.LockControls([edDetalleTarea], True);
  VCLExtra.LockControls([fraMotivoIngreso, edFechaEvento, teHoraDesde], Sesion.Sector = 'CALLCENT');
  tsTareasAsociadas.PageIndex := 1;
  if IDAgendaEvento > 0 then
    OpenQueryEx(sdqTareasAsociadas, [Sesion.ID, IDAgendaEvento])
  else
    sdqTareasAsociadas.Close;
end;

procedure TfrmABMAgendaBaseEvento.fpSpeechBeforeShow(Sender: TObject);
begin
  inherited;
  btnAnalizarPosibleTarea.Enabled := tsTareasAsociadas.TabVisible and (ModoABM = abmAlta);
end;

function TfrmABMAgendaBaseEvento.GetTipoEvento: String;
begin
  if TApptEvento(ApptObject).IdTareaOrigen > 0 then
    Result := ' AND te_tipoevento = ''T'' '
  else
    Result := ' AND te_tipoevento = ''E'' ';
end;

procedure TfrmABMAgendaBaseEvento.fraProcesoPropiedadesChange(Sender: TObject);
begin
  inherited;
  fraTipo.Propiedades.ExtraCondition := fraTipo.Propiedades.ExtraCondition + GetTipoEvento;
  if (ModoABM = abmAlta) then
  try
    fraContactoLibreAGENDA.LoadData(FContacto, Telefono, CorreoElectronico);
  except
  end;
end;

procedure TfrmABMAgendaBaseEvento.GridTareasAsociadasDblClick(Sender: TObject);
begin
  btnModificarTareaClick(nil);
end;

procedure TfrmABMAgendaBaseEvento.GridTareasAsociadasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (Field.DataSet.FieldByName('AT_FECHABAJA').IsNull) then
  begin
    AFont.Color := IIF(Highlight, clBtnFace, clRed);
    AFont.Style := AFont.Style + [fsStrikeOut];
  end;
end;

procedure TfrmABMAgendaBaseEvento.OnChangeMotivoIngreso(Sender: TObject);
var
  sCodigo: String;
begin
  inherited;
  if fraMotivoIngreso.IsSelected then
  begin
    if fraTipo.IsSelected then
      sCodigo := fraTipo.Codigo;

    fraTipo.Propiedades.ExtraCondition := fraTipo.Propiedades.ExtraCondition + GetTipoEvento;

    if (Trim(sCodigo) > '') and (fraTipo.Codigo <> sCodigo) then
      fraTipo.Codigo := sCodigo;
  end;
end;

procedure TfrmABMAgendaBaseEvento.OnChangeTipo(Sender: TObject);
begin
  inherited;
  if (ModoABM = abmAlta) then
  try
    fraContactoLibreAGENDA.LoadData(FContacto, Telefono, CorreoElectronico);
  except
  end;
  tsTareasAsociadas.TabVisible := fraTipo.IsSelected and ((fraTipo.sdqDatos.FieldByName('TIENE_TAREAS').AsInteger > 0) or (ApptObject.Estado = ESTADO_EVENTO_TERMINADO));
end;

procedure TfrmABMAgendaBaseEvento.PageControlEventosChange(Sender: TObject);
begin
  inherited;
  if AdvToolBarPager.ActivePageIndex <> PageControlEventos.ActivePageIndex then
    AdvToolBarPager.ActivePageIndex := PageControlEventos.ActivePageIndex;
end;

procedure TfrmABMAgendaBaseEvento.sdqTareasAsociadasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if Assigned(sdqTareasAsociadas.FindField('at_fechavencimiento')) then
    TDateTimeField(sdqTareasAsociadas.FindField('at_fechavencimiento')).DisplayFormat := 'dd/mm/yyyy hh:nn"hs"';

  if sdqTareasAsociadas.IsEmpty then
  begin
    tsTareasAsociadas.ImageIndex := 2;
    sdqUsuariosNotificados.Close;
  end else
  begin
    edDetalleTarea.Visible := sdqTareasAsociadas.RecordCount > 10;
    DBAdvCardListTareasAsociadas.CardTemplate.Items.GetItemByName('DBAdvCardTemplateItemDETALLE').Visible := not edDetalleTarea.Visible;

    GridTareasAsociadas.Visible := edDetalleTarea.Visible;
    DBAdvCardListTareasAsociadas.Visible := not GridTareasAsociadas.Visible;

    if DBAdvCardListTareasAsociadas.Visible then
      DBAdvCardListTareasAsociadas.ColumnWidth := Trunc((GridTareasAsociadas.Width - 12) / sdqTareasAsociadas.RecordCount);

    if GridTareasAsociadas.Visible then
      VCLExtra.DynColWidthsByData(GridTareasAsociadas);

    OpenQueryEx(sdqUsuariosNotificados, [sdqTareasAsociadas.FieldByName('AT_ID').AsInteger]);
    tsTareasAsociadas.ImageIndex := 1;
  end;
end;

procedure TfrmABMAgendaBaseEvento.sdqTareasAsociadasAfterScroll(DataSet: TDataSet);
begin
  OpenQueryEx(sdqUsuariosNotificados, [sdqTareasAsociadas.FieldByName('AT_ID').AsInteger]);
  JvDBTreeViewUsuarios.Perform(TVM_SETITEMHEIGHT, 20, 0);
  JvDBTreeViewUsuarios.FullExpand;
end;

procedure TfrmABMAgendaBaseEvento.sdqUsuariosNotificadosCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    if Active and not IsEmpty then
      FieldByName('ICONO').AsInteger := FieldByName('FLOAT_ICON').AsInteger;
end;

procedure TfrmABMAgendaBaseEvento.AprobarRechazar(ATipo: String; AEstado: Integer);
begin
  EjecutarSqlEx('UPDATE agenda.asa_solicitudautorizacion ' +
                   'SET sa_usucumplimiento = :usuario, ' +
                       'sa_fechacumplimiento = SYSDATE, ' +
                       'sa_tipocumplimiento = :tipo1 ' +
                 'WHERE sa_id = (SELECT sa_id ' +
                                  'FROM agenda.asa_solicitudautorizacion, agenda.aae_agendaevento ' +
                                 'WHERE ae_id = sa_idevento ' +
                                   'AND sa_tipo = :tipo2 ' +
                                   'AND ae_appid = :appid) ', [Sesion.UserID, ATipo, 'E', FIDAppt]);
  EjecutarSqlEx('UPDATE agenda.aae_agendaevento ' +
                   'SET ae_estado = :estado ' +
                 'WHERE ae_appid = :appid', [AEstado, FIDAppt]);
  inherited;
end;

function TfrmABMAgendaBaseEvento.GetApptObject: TApptBase;
begin
  if not Assigned(FApptObject) then
    FApptObject := TApptEvento.Create(ScheduleObject, '');

  Result := inherited GetApptObject;
end;

procedure TfrmABMAgendaBaseEvento.Guardar(CanClose: Boolean = True);
begin
  if (CanClose and FinishAppt) or ((CanClose and
                                    (ModoABM = abmAlta) and
                                     ModoCallCenter and
                                    (edFechaEvento.Date = DBDate) and
                                    (GetDecimales(teHoraDesde.Time) <= GetDecimales(DBDateTime)) and
                                     sdqTareasAsociadas.IsEmpty)) then
    FinishAppt := True
  else
    FinishAppt := False;

  if Save and not CanClose then
  begin
    ApptObject.ScheduleManager.AlwaysPost := True;
    ApptObject.SetStartEnd(ApptObject.FechaDesde, ApptObject.FechaDesde, ApptObject.FechaHasta, ApptObject.FechaHasta);
  end;
end;

procedure TfrmABMAgendaBaseEvento.InternalSetModoAutorizacion;
var
  sSQL, sHabilitado: String;
begin
  inherited;
  sSQL := 'SELECT :valor ' +
            'FROM agenda.asa_solicitudautorizacion, agenda.aae_agendaevento ' +
           'WHERE sa_tipo = :valor2 ' +
             'AND sa_idevento = ae_id ' +
             'AND ae_appid = :id ' +
             'AND sa_tipocumplimiento IS NULL';
  sHabilitado := ValorSqlEx(sSQL, ['S', 'E', FIDAppt]);
  btnRechazar.Enabled := sHabilitado = 'S';
  btnAprobar.Enabled := sHabilitado = 'S';
  LockDataObjects;
end;

procedure TfrmABMAgendaBaseEvento.LoadApptIntoComponents(objAppt: TApptBase; bSoloDatos: Boolean);
var
  i: Integer;
begin
  if Assigned(objAppt) then
  with objAppt do
  try
    pnlDato32.Visible := FechaVencimiento > 0;
    pnlDato32.Top := pnlDato29.Top + 1;
    edFechaVencimiento.Date := FechaVencimiento;
    edHoraVencimiento.Time := FechaVencimiento - Trunc(FechaVencimiento);
    inherited LoadApptIntoComponents(objAppt, bSoloDatos);

    IDAgendaEvento := IdTabla;

    if TApptEvento(objAppt).IdTareaOrigen > 0 then
      VCLExtra.LockControls([fraProceso, fraTipo, fraMotivoIngreso, edFechaVencimiento, edHoraVencimiento], True);

    {
    IDAgendaEvento := ValorSqlIntegerEx('SELECT ae_id FROM agenda.aae_agendaevento WHERE ae_appid = :id', [FIDAppt], -1);
    IdTabla := IDAgendaEvento;
    }
    if (Estado = ESTADO_EVENTO_TERMINADO) and (IdTabla > 0) then
    begin
      VCLExtra.LockControls([AdvOfficeStatusBarTareas], not EventoAlmacenadoPeroEnModoAlta);

      for i := 0 to tsRespuesta.ControlCount - 1 do
        if tsRespuesta.Controls[i] is TWinControl then
          VCLExtra.LockControls([TWinControl(tsRespuesta.Controls[i])], True);
    end else
    begin
      VCLExtra.LockControls([AdvOfficeStatusBarTareas], False);
    end;
  except
    on E: Exception do
      InfoHint(btnAceptar, 'Ocurrió un error al recuperar los datos de este evento.');
  end;
end;

procedure TfrmABMAgendaBaseEvento.LockDataObjects(ALockControls: Boolean = True);
begin
  inherited;
end;

procedure TfrmABMAgendaBaseEvento.LockTareasAsociadas(ABlock: Boolean = True);
begin
  btnAgregarTarea.Enabled := not ABlock;
  btnModificarTarea.Enabled := not ABlock;
  btnEliminarTarea.Enabled := not ABlock;
end;

procedure TfrmABMAgendaBaseEvento.RecuperarResolucion;
var
  sSQL: String;
begin
  with ApptObject do
  begin
    if IdTabla <> ART_EMPTY_ID then
    begin
      sSQL := 'SELECT ra_idrespuesta, ra_observacion, ra_id, se_nombre, ra_fechaalta ' +
                'FROM art.use_usuarios, agenda.ara_respuestaagendaevento ' +
               'WHERE ra_idagendaevento = :V1 ' +
                 'AND NVL(ra_usumodif, ra_usualta) = se_usuario';
      with ApptObject, GetQueryEx(sSQL, [IdTabla]) do
      try
        if not IsEmpty then
        begin
          tsRespuestas.ImageIndex := 1;
          IDRespuesta := FieldByName('ra_idrespuesta').AsInteger;
          ObservacionRespuesta := FieldByName('ra_observacion').AsString;
          IDRespuestaAgenda := FieldByName('ra_id').AsInteger;
          edUsuRespuesta.Text := FieldByName('se_nombre').AsString;
          edFechaRespuesta.Date := FieldByName('ra_fechaalta').AsDateTime;
        end else
        begin
          tsRespuestas.ImageIndex := 2;
          pnlRespuesta.Visible := False;
        end;
      finally
        Free;
      end;
    end else
    begin
      tsRespuestas.ImageIndex := 2;
      pnlRespuesta.Visible := False;
    end;

    fraRespuesta.Codigo := IntToStr(IDRespuesta);
    edResultado.Text := ObservacionRespuesta;
  end;
end;

procedure TfrmABMAgendaBaseEvento.SaveComponentsToAppt(objAppt: TApptBase);
begin
  inherited SaveComponentsToAppt(objAppt);
  if Assigned(ApptObject) then
  with ApptObject as TApptEvento do
  begin
    FechaVencimiento := Trunc(edFechaVencimiento.Date) + edHoraVencimiento.Time - Trunc(edHoraVencimiento.Time);
    IDUsuario := StrToInt(fraUsuarioAsignado.Id);

    if FinishAppt or ((edFechaEvento.Date + GetDecimales(teHoraDesde.Time)) < DBDateTime) then
      Estado := ESTADO_EVENTO_TERMINADO
    else
      if (ModoABM = abmAlta) and (IDUsuario <> Sesion.ID) then
        Estado := ESTADO_EVENTO_PENDIENTEAUTORIZACION
      else
        Estado := ESTADO_EVENTO_PENDIENTE;
  end;
end;

procedure TfrmABMAgendaBaseEvento.SetModoABM(const Value: TModoABM);
begin
  inherited;
  if ModoABM = abmAlta then
  begin
    AdvToolBarPager.Caption.Caption := 'Nuevo evento';
    with ApptObject do
    begin
      TipoRepeticion := 1;
      fraUsuarioAsignado.ModoUsuario := muDependientes;
      IdUsuario := Sesion.ID;
    end;
    pnlDato27.Visible := fraUsuarioAsignado.TieneUsuariosACargo and (ApptObject.IDUsuario <> Sesion.ID);
    //LockAdjuntos; dejo que carguen adjunto ante el alta de eventos
    LockObservaciones;
    //LockTareasAsociadas;
  end else
  if ModoABM = abmModificacion then
    AdvToolBarPager.Caption.Caption := 'Modificación de evento';
end;

procedure TfrmABMAgendaBaseEvento.SetModoCallCenter(Value: Boolean);
begin
  inherited;
  if Value then
  begin
    btnVincularTarea.Visible := False;
    btnDesVincularTarea.Visible := False;
  end;
end;

procedure TfrmABMAgendaBaseEvento.AltaEvento(AFechaDesde: TDateTime = 0; AHoraDesde: TDateTime = 0;
                                             AFechaHasta: TDateTime = 0; AHoraHasta: TDateTime = 0);
begin
  with ApptObject do
  begin
    if ModoABM = abmAlta then
    begin
      BeginUpdate;
      SetStartEnd(NVL(AFechaDesde, DBDate), AHoraDesde, NVL(AFechaHasta, DBDate), AHoraHasta);
    end;
  end;
  LoadFromAppt(ApptObject);

  if (Sesion.Sector = 'CALLCENT') and fraMotivoIngreso.IsEmpty then
  begin
    fraMotivoIngreso.Codigo := '1';
//    VCLExtra.LockControls([fraMotivoIngreso], True);
  end;

  if Assigned(ApptObject) and (TApptEvento(ApptObject).IdTareaOrigen > 0) then
  begin
    OpenQueryEx(sdqConsulta, [IDAgendaEvento, 'S', IDAgendaEvento, 'S', TApptEvento(ApptObject).IdTareaOrigen]);
    OpenQueryEx(sdqAdjuntos, [IDAgendaEvento, 'S', IDAgendaEvento, 'S', TApptEvento(ApptObject).IdTareaOrigen]);
    pgSeguimiento.TabVisible := True;
  end else
  begin
    pgSeguimiento.TabVisible := False;
  end;
end;

class procedure TfrmABMAgendaBaseEvento.AssignRecordToAppt(objAppt: TJvTFAppt; objConsulta: TSDQuery);
begin
  with objConsulta, TApptEvento(objAppt) do
  begin
    BeginUpdate;
    IdTabla                   := FieldByName('ae_id').AsInteger;
    AlarmEnabled              := FieldByName('ae_fechaleido').IsNull;
    FechaLeido                := FieldByName('ae_fechaleido').AsDateTime;
    IDUsuario                 := FieldByName('ae_idusuario').AsInteger;
    TipoEvento                := FieldByName('ae_idtipoevento').AsInteger;
    MotivoIngreso             := FieldByName('ae_idmotivoingreso').AsInteger;
    TodoElDia                 := FieldByName('ae_todoeldia').AsString = 'S';
    TipoRepeticion            := FieldByName('ae_idtiporepeticion').AsInteger;
    Contrato                  := FieldByName('ae_contrato').AsInteger;
    Estado                    := FieldByName('ae_estado').AsInteger;
    Descripcion               := FieldByName('ae_descripcion').AsString;
    FechaAlta                 := FieldByName('ae_fechaalta').AsDateTime;

    if Assigned(FindField('insatisfaccion')) then
      Insatisfaccion          := FieldByName('insatisfaccion').AsString = 'S'
    else
      Insatisfaccion          := FieldByName('ae_insatisfaccion').AsString = 'S';

    if (not FieldByName('ae_domiciliocontrato').IsNull) and (FieldByName('ae_domiciliocontrato').AsString > '') then
      UbicacionContrato       := FieldByName('ae_domiciliocontrato').AsString[1];

    Trabajador                := FieldByName('ae_idtrabajador').AsInteger;
    NroEstableci              := FieldByName('ae_nroestableci').AsInteger;
    ReqUbicacionEstab         := FieldByName('ae_requiereubicacionestab').AsString = 'S';
    Calle                     := FieldByName('ae_calle').AsString;
    Numero                    := FieldByName('ae_numero').AsString;
    Piso                      := FieldByName('ae_piso').AsString;
    Departamento              := FieldByName('ae_departamento').AsString;
    CPostal                   := FieldByName('ae_cpostal').AsString;
    CPostala                  := FieldByName('ae_cpostala').AsString;
    Localidad                 := FieldByName('ae_localidad').AsString;
    Provincia                 := FieldByName('ae_provincia').AsString;
    Telefono                  := FieldByName('ae_numerotelefono').AsString;
    Contacto                  := FieldByName('ae_contacto').AsString;
    CorreoElectronico         := FieldByName('ae_correoelectronico').AsString;
    FechaHoraAlarma           := FieldByName('ae_fechahoraalarma').AsDateTime;
    FechaVencimiento          := FieldByName('ae_fechavencimiento').AsDateTime;
    IDContacto                := FieldByName('ae_idcontacto').AsInteger;
    IdPrestador               := FieldByName('ae_idprestador').AsInteger;
    IdExpediente              := FieldByName('ae_idexpediente').AsInteger;
    Siniestro                 := FieldByName('ex_siniestro').AsInteger;
    Orden                     := FieldByName('ex_orden').AsInteger;
    Recaida                   := FieldByName('ex_recaida').AsInteger;
    NumAuto                   := FieldByName('ae_numauto').AsInteger;
    DatoFecha                 := FieldByName('ae_datofecha').AsDateTime;
    IdEntidad                 := FieldByName('ae_identidad').AsInteger;
    IdVendedor                := FieldByName('ae_idvendedor').AsInteger;
    CUIT                      := FieldByName('ae_cuit').AsString;
    RazonSocial               := FieldByName('ae_razonsocial').AsString;
    Actividad                 := FieldByName('ae_ciiu').AsString;
    Trabajadores              := FieldByName('ae_canttrabajadores').AsInteger;
    MasaSalarial              := FieldByName('ae_masasalarial').AsFloat;
    IdFormulario              := FieldByName('idformulario').AsInteger;
    Description               := FieldByName('desc1').AsString + FieldByName('descripcion').AsString;

    SetStartEnd(FieldByName('ae_fechahorainicio').AsDateTime,
                FieldByName('ae_fechahorainicio').AsDateTime,
                FieldByName('ae_fechahorafin').AsDateTime,
                FieldByName('ae_fechahorafin').AsDateTime);
  end;
end;

procedure TfrmABMAgendaBaseEvento.LoadFromAppt(objAppt: TJvTFAppt);
var
  sSQL: String;
begin
  Application.ProcessMessages;
  if not(objAppt is TApptEvento) then
    raise Exception.Create('El objeto no es del tipo esperado.');

  with objAppt as TApptEvento do
  begin
    InvisibilizarPaneles;
    //AcomodarTamanio;
    FIDMotivoIngreso := MotivoIngreso;
    FIDTipoEvento := TipoEvento;
    FIDAppt := objAppt.Id;

    if Assigned(objAppt) then
    begin
      LoadApptIntoComponents(TApptBase(objAppt));

      if objAppt.Color = clGreen then
      begin
        LockDataObjects;
        pnlDato27.Visible := True;
      end;
      //else
      //  pnUsuarioAsig.Visible := False;
    end;
    FIDMotivoIngreso := StrToIntDef(fraMotivoIngreso.ID, 0);
    FIDTipoEvento := StrToIntDef(fraTipo.ID, 0);

    if IDAgendaEvento > 0 then
    begin
      try
        OpenQueryEx(sdqConsulta, [IDAgendaEvento, 'N', IDAgendaEvento, 'N', 0]);
      except
      end;
      OpenQueryEx(sdqAdjuntos, [IDAgendaEvento, 'N', IDAgendaEvento, 'N', 0]);
      OpenQueryEx(sdqTareasAsociadas, [Sesion.ID, IDAgendaEvento]);
      btnCerrar.Enabled := sdqTareasAsociadas.IsEmpty and (ApptObject.Estado <> ESTADO_EVENTO_TERMINADO);
      if (not Leido) and (IDUsuario = Sesion.ID) then
      begin
        sSQL := 'UPDATE agenda.aae_agendaevento ' +
                   'SET ae_fechaleido = SYSDATE ' +
                 'WHERE ae_fechaleido IS NULL ' +
                   'AND ae_appid = :V1';
        EjecutarSqlEx(sSQL, [ApptObject.Id]);
      end;
    end else
    begin
      IDAgendaEvento := ValorSqlIntegerEx('SELECT ae_id FROM agenda.aae_agendaevento WHERE ae_appid = :id', [FIDAppt], -1);
      sdqConsulta.Close;
      sdqAdjuntos.Close;
      sdqTareasAsociadas.Close;
      sdqConsultaAfterOpen(nil);
      sdqAdjuntosAfterOpen(nil);
      sdqTareasAsociadasAfterOpen(nil);
    end;

    SetExtraCondition;
    if (IDAgendaEvento > 0) and (IdTareaOrigen = 0) then
      IdTareaOrigen := ValorSqlIntegerEx('SELECT at_id FROM agenda.aat_agendatarea WHERE at_ideventotarea = :id', [IDAgendaEvento], -1);

    if TApptEvento(ApptObject).IdTareaOrigen > 0 then
      pgSeguimiento.TabVisible := True;
  end;
end;

procedure TfrmABMAgendaBaseEvento.LoadFromQuery(objQuery: TSDQuery; bModoCallCenter: Boolean = False; bAutorizacion: Boolean = False);
begin
  if (not Assigned(FApptObject)) and objQuery.Active and (not objQuery.IsEmpty) then
    FApptObject := TApptEvento.Create(ScheduleObject, objQuery.FieldByName('ae_appid').AsString);

  inherited;
  ModoCallCenter := bModoCallCenter;
end;

procedure TfrmABMAgendaBaseEvento.RecuperarInsatisfaccion;
begin
  inherited;
end;

procedure TfrmABMAgendaBaseEvento.RegisterNotes(AContacto, ATelefono, ACorreoElectronico: String);
begin
  FContacto := AContacto;
  FTelefono := ATelefono;
  FCorreoElectronico := ACorreoElectronico;
end;

function TfrmABMAgendaBaseEvento.Save: Boolean;
var
  bResultado: Boolean;
begin
  bResultado := True;
  with (ApptObject as TApptEvento) do
  begin
    if Assigned(ApptObject) then
    try
      BeginUpdate;
      try
        try
          bResultado := inherited Save;
        except
          on E: Exception do
            MsgBox(E.Message);
        end;

        if Self.ModoABM = abmAlta then
        begin
          Persistent := False;
          if (fraRepite.Codigo <> '1') then
            InitializeRepetition;
        end;
      finally
        ApptObject.EndUpdate;  // this causes the appt to be posted
                               // (y el objeto hace el insert/update en la base y hace commit)
        ApptObject.Refresh;
      end;
    finally
      if not SaveWithoutClosing then
        //ApptObject := nil
      else
        ModoABM := abmModificacion;
    end else
      bResultado := False;
  end;

  if not SaveWithoutClosing then
    ModalResult := mrOk
  else
    SaveWithoutClosing := False;

  Result := bResultado;
end;

procedure TfrmABMAgendaBaseEvento.SaveApptToDataBase;
begin
  Verificar(ModoABM = abmNone, btnAceptar, 'No se definió el modo en que se abrió la pantalla.');
  TApptEvento(ApptObject).SaveApptToDataBase(FinishAppt, ModoABM);
  Application.ProcessMessages;
  if ModoABM = abmAlta then
    {$IFNDEF AGENDA_SIC}
    MostrarAlarma('Notificación | SIC', CRLF + 'Nuevo evento -> ' + IntToStr(ApptObject.IdTabla) +
                  CRLF + fraTipo.Descripcion + CRLF, 120000);
    {$ELSE}
    frmPrincipal.tiIconoBarraEstado.BalloonHint('Notificación | SIC',
                                                'Nuevo evento -> ' + IntToStr(ApptObject.IdTabla) + CRLF + fraTipo.Descripcion,
                                                 btInfo, 120000, True);
    {$ENDIF}
  Application.ProcessMessages;
end;

function TfrmABMAgendaBaseEvento.Validar(PermiteCerrar: Boolean = True; GeneraTarea: Boolean = False): Boolean;
var
  bRequiereRespuesta, bRequiereRespuestaTabulada: Boolean;
  sMensaje, sMensaje1: String;
begin
  try
    inherited Validar;
    Verificar(edFechaEvento.Date = 0, edFechaEvento,'Debe especificar una fecha para el evento.');
    Verificar(edFechaFin.Date = 0, edFechaFin,'Debe especificar una fecha de fin del evento.');
    Verificar(edFechaEvento.Date > edFechaFin.Date, edFechaEvento, 'La fecha de comienzo no puede ser mayor a la fecha de fin.');
    Verificar(teHoraDesde.Time = 0,teHoraDesde, 'Debe especificar una hora de inicio del evento.');
    Verificar(teHoraHasta.Time = 0,teHoraHasta, 'Debe especificar una hora de fin del evento.');
    Verificar((edFechaEvento.Date = edFechaFin.Date) and (teHoraDesde.Time >= teHoraHasta.Time), teHoraDesde, 'El horario de finalización del evento no puede ser anterior al del inicio del mismo.');
    Verificar(edFechaAlarma.IsEmpty and (Frac(teHoraAlarma.Time) <> 0), edFechaAlarma, 'Debe seleccionar la fecha de la alarma.');

    if TApptEvento(ApptObject).IdTareaOrigen > 0 then
      sMensaje1 := 'Esta tarea'
    else
      sMensaje1 := 'Este evento';

    if EventoCalendarizado then
    begin
      if not MsgAsk('Ud. ha indicado que ' + LowerCase(sMensaje1) + ' se realizará el día ' + FormatDateTime('dd ''de'' mmmm ''de'' yyyy', edFechaEvento.Date) + ' a las ' + FormatDateTime('hh:nn '' hs.''', teHoraDesde.Time) +
                    CRLF + CRLF + '¿Desea agendar este acontecimiento a futuro, en la fecha y hora indicados?') then
      begin
        if MsgAsk('¿Desea indicar que ' + LowerCase(sMensaje1) + ' ya ha sido realizad' + StrRight(sMensaje1, 1) + '?') then
        begin
          edFechaFin.Date := DBDate + (edFechaFin.Date - edFechaEvento.Date);
          teHoraHasta.Time := DBDateTime + (GetDecimales(teHoraHasta.Time) - GetDecimales(teHoraDesde.Time));
          edFechaEvento.Date := DBDate;
          teHoraDesde.Time := GetDecimales(DBDateTime);
        end else
          Abort;
      end;
    end;

    if (not EventoCalendarizado) and (not GeneraTarea) then
    begin
      bRequiereRespuesta := RequiereRespuesta(StrToIntDef(fraTipo.Id, 0));
      bRequiereRespuestaTabulada := RequiereRespuestaTabulada(StrToIntDef(fraTipo.Id, 0));

      if sdqTareasAsociadas.IsEmpty then
      begin
        if (ModoABM = abmAlta) or (EventoAlmacenadoPeroEnModoAlta and (edFechaEvento.Date = DBDate) and (GetDecimales(teHoraDesde.Time) <= GetDecimales(DBDateTime))) then
          sMensaje := 'está siendo'
        else if (ModoABM = abmModificacion) and (fraRespuesta.IsEmpty and IsEmptyString(edResultado.Lines.Text)) and
           (ApptObject.StartDateTime < DBDateTime) then
          sMensaje := 'fue'
        else
          sMensaje := 'ha sido';

        if (fraRespuesta.IsEmpty and IsEmptyString(edResultado.Lines.Text)) and bRequiereRespuesta then
        begin
          AdvToolBarPager.ActivePage := tsRespuestas;
          InfoHint(fraRespuesta, sMensaje1 + ' requiere respuesta y ' + sMensaje + ' dad' + StrRight(sMensaje1, 1) + ' de alta como un hito, que es un acontecimiento que ya ocurrió.' + CRLF + CRLF +
                                 'Debe tener una respuesta seleccionada para poder cerrar ' + LowerCase(sMensaje1) +
                                 IIF(bRequiereRespuestaTabulada, '', ' o bien escribir la respuesta en las observaciones') + IIF(TApptEvento(ApptObject).IdTareaOrigen > 0, '', ', salvo que este evento genere una tarea') + '.', True);
        end;

        if fraRespuesta.IsEmpty and bRequiereRespuestaTabulada then
        begin
          AdvToolBarPager.ActivePage := tsRespuestas;
          InfoHint(fraRespuesta, sMensaje1 + ' requiere respuesta y ' + sMensaje + ' dado de alta como un hito, que es un acontecimiento que ya ocurrió.' + CRLF + CRLF +
                                 'Debe tener una respuesta seleccionada para poder cerrar ' + LowerCase(sMensaje1) + IIF(TApptEvento(ApptObject).IdTareaOrigen > 0, '', ', salvo que este evento genere una tarea') + '.', True);
        end;
      end;

      if (bRequiereRespuesta and fraRespuesta.IsEmpty and IsEmptyString(edResultado.Lines.Text)) or (fraRespuesta.IsEmpty and bRequiereRespuestaTabulada) then
        FinishAppt := False
      else
        FinishAppt := True;

      if (ModoABM = abmModificacion) and EventoCalendarizado then
      begin
        if FinishAppt then
        begin
          AdvToolBarPager.ActivePage := tsRespuestas;
          if MsgAsk('El evento está agendado para el ' + FormatDateTime('dd "de" mmmm "de" yyyy "a las" hh:nn', ApptObject.StartDateTime) +
                    ', sin embargo ' + iif(bRequiereRespuesta, 'ya tiene una respuesta', ' no requiere una respuesta') + '.' + CRLF + CRLF + '¿Desea cerrarlo ahora?') then
            FinishAppt := True
          else
            FinishAppt := False;
        end;
      end;
    end;

    Result := True;
  finally
    PageControlEventosChange(nil);
    ShowAllBalloons;
  end;
end;

initialization
  RegisterClasses([TfraEstablecimiento, TfraEstablecimientoAGENDA]);

end.
