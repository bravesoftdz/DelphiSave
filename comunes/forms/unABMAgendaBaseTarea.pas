unit unABMAgendaBaseTarea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unABMAgendaBase, AdvOfficeStatusBar, AdvOfficeStatusBarStylers,
  AdvOfficePager, AdvOfficePagerStylers, ImgList, XPMenu, Placemnt,                
  AdvToolBar, AdvGlowButton, ComCtrls, unfraContacto, StdCtrls,
  unFraEmpresa, unFraCodDesc, Mask, ToolEdit, DateComboBox, ExtCtrls,
  JvExExtCtrls, unFraDomicilio, unArtDbFrame,
  unFraTrabajador, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraEstablecimiento,SqlFuncs, unSeleccionMultiple, FormPanel,
  AdvToolBarStylers, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ShortCutControl, DB, SDEngine, JvExDBGrids, JvDBGrid,
  unfraCPR_PRESTADOR, unfraContactoAgenda, unFraTrabajadorSiniestro,
  unfraEmpresaAGENDA, unfraTrabajadorAGENDA, unfraEntidadVendedorAGENDA,
  unfraTrabajadorSiniestroAGENDA, unfraPrestadorAGENDA, unfraDomicilioEmpresaAGENDA,
  unfraEstablecimientoAGENDA, unfraDomicilioEstablecimientoAGENDA,
  unfraNumAutoAGENDA, unAgenda, unInterfaces, unfraContactoLibreAGENDA,
  unFraDomicilioGIS, unfraDomicilioAGENDA, JvTFManager,
  unFraUsuarioConJerarquias, JvExMask, JvToolEdit, AdvOfficeButtons,
  AdvSmoothSlider, unfraProspectosAGENDA, CheckLst, ARTCheckListBox, Login,
  artDbLogin, artSeguridad, JvNavigationPane, JvExComCtrls, JvComponent,
  JvDBTreeView, JvPanel, unFraEmpresaAfi, unfraEmpresaSolicitudAGENDA,
  unfraDatoFechaAGENDA, JvComponentBase, RxPlacemnt, JvExtComponent, RxToolEdit;

type
  TfrmABMAgendaBaseTarea = class(TfrmABMAgendaBase)
    dbgUsuarios: TJvDBGrid;
    dsUsuariosNotificados: TDataSource;
    fpSeleccionUsuarios: TFormPanel;
    fraPrioridad: TfraCodigoDescripcion;
    fraSeleccionUsuarios: TfrmSeleccionUsuarios;
    ImageListSeguimiento: TImageList;
    JvDBTreeViewUsuarios: TJvDBTreeView;
    JvOutlookSplitter: TJvOutlookSplitter;
    Label7: TLabel;
    lbAsignados: TLabel;
    lbPrioridad: TLabel;
    pnlAsignacion: TPanel;
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
    tsUsuarioNotificado: TTabSheet;
    tsUsuariosNotificados: TAdvPage;
    edResultadoNuevo: TMemo;
    pnlAgregoRespuesta: TPanel;
    lbAddObs: TLabel;
    pnlDato34: TPanel;
    chkNotificacionCierre: TCheckBox;
    procedure AdvToolBarPagerChange(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnEliminarObservacionClick(Sender: TObject);
    procedure cbTodoElDiaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraProcesoPropiedadesChange(Sender: TObject);
    procedure lbAsignadosClick(Sender: TObject);
    procedure OnChangeMotivoIngreso(Sender: TObject); override;
    procedure OnChangeTipo(Sender: TObject); override;
    procedure sdqUsuariosNotificadosCalcFields(DataSet: TDataSet);
  private
    FApptEventoOriginante: TApptEvento;
    FModoEvento: Boolean;
    procedure AnalizarAsignadoA;
    function GetIdTarea: Integer;
  protected
    procedure AprobarRechazar(ATipo: String; AEstado: Integer); override;
    function GetApptObject: TApptBase; override;
    procedure Guardar(CanClose: Boolean = True); override;
    procedure InternalLoadExtraQuerys; override;
    procedure InternalSetModoAutorizacion; override;
    procedure LoadApptIntoComponents(objAppt: TApptBase; bSoloDatos: Boolean = False); override;
    procedure LockDataObjects(ALockControls: Boolean = True); override;
    procedure RecuperarInsatisfaccion; override;
    procedure RecuperarResolucion; override;
    procedure SaveComponentsToAppt(objAppt: TApptBase); override;
    procedure SetExtraCondition; override;
    procedure SetModoABM(const Value: TModoABM); override;
  public
    procedure AltaTarea;
    procedure AssignEventAppt(vAppt: TApptBase);
    class procedure AssignRecordToAppt(objAppt: TJvTFAppt; objQuery: TSDQuery); override;
    procedure LoadBasicData(AProceso, AEvento: String; AIdAgendaEvento: Integer);
    procedure LoadFromAppt(objAppt: TJvTFAppt); override;
    procedure LoadFromQuery(objQuery: TSDQuery; bModoCallCenter: Boolean = False; bAutorizacion: Boolean = False); override;
    procedure LockAnswer(ALockControls: Boolean = True); override;
    function Save: Boolean; override;
    function Validar(PermiteCerrar: Boolean = True; GeneraTarea: Boolean = False): Boolean; override;
    property IdTarea: Integer read GetIdTarea;
    property ModoEvento: Boolean read FModoEvento write FModoEvento;
  end;

var
  frmABMAgendaBaseTarea: TfrmABMAgendaBaseTarea;

implementation

uses
  VCLExtra, unDmPrincipal, AnsiSql, CustomDlgs, unSesion, General, unArt, unSIC, Strfuncs, Numeros, CommCtrl;

{$R *.dfm}

procedure TfrmABMAgendaBaseTarea.AdvToolBarPagerChange(Sender: TObject);
begin
  inherited;
  if AdvToolBarPager.ActivePage = tsUsuariosNotificados then
    PageControlEventos.ActivePage := tsUsuarioNotificado;
end;

procedure TfrmABMAgendaBaseTarea.btnCerrarClick(Sender: TObject);
begin
  if {$IFDEF COBRANZAS} True {$ELSE} False {$ENDIF} then
  begin
    //Las tareas no se cierran nunca desde las tareas en sí, salvo desde Cobranzas!
    SaveWithoutClosing := True;

    if Validar then
    try
      Save;
      BeginTrans(True);
      do_agendartarea(IdTarea, DBDate, Sesion.ID, edResultado.Text + iif(Trim(edResultadoNuevo.Text) > '', CRLF + edResultadoNuevo.Text, ''), StrToIntDef(fraRespuesta.Id, 0));
      CommitTrans(True);
      ModalResult := mrOk;
    except
      Rollback(True);
    end;
  end else
    //Las tareas no se cierran nunca desde las tareas en sí, sino desde el evento!
    {if TApptTarea(ApptObject).IdAgendaEvento > 0 then
      inherited
    else
    }
    InfoHint(btnCerrar, 'Las tareas no se pueden cerran sin previamente haber sido convertidas a evento.' + CRLF +
                        'Esto es preciso pues es necesario saber la fecha de realización de este hito.' + CRLF + CRLF +
                        'Para ello arrastre esta tarea sobre la primer solapa del calendario (la que está por día).');
end;

procedure TfrmABMAgendaBaseTarea.btnEliminarObservacionClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    if MsgBox('¿Desea dar de baja la Observación?', MB_ICONQUESTION + MB_YESNO, 'Baja Observación') = IDYES then
      EjecutarSqlEx('UPDATE agenda.aot_observaciontarea ' +
                       'SET ot_usubaja = :usuario, ' +
                           'ot_fechabaja = SYSDATE ' +
                     'WHERE ot_usubaja IS NULL ' +
                       'AND ot_id = :id', [Sesion.UserID, sdqConsulta.FieldByName('ot_id').AsInteger]);
    sdqConsulta.Refresh;
  end;
end;

procedure TfrmABMAgendaBaseTarea.cbTodoElDiaClick(Sender: TObject);
begin
//  inherited;
end;

procedure TfrmABMAgendaBaseTarea.FormCreate(Sender: TObject);
begin
  FObservaciones_Tabla := 'agenda.aot_observaciontarea';
  FObservaciones_Prefijo := 'ot_';
  FObservaciones_ForeignKey := 'idagendatarea';  

  FAdjuntos_Tabla := 'agenda.ajt_adjuntotarea';
  FAdjuntos_Prefijo := 'jt_';
  FAdjuntos_ForeignKey := 'idagendatarea';

  inherited;
  with fraPrioridad do
  begin
    TableName := 'agenda.apr_prioridades';
    FieldDesc := 'pr_descripcion';
    FieldID := 'pr_id';
    FieldCodigo := 'pr_id';
    FieldBaja := 'pr_fechabaja';
    CaseSensitive := false;
    ShowBajas := true;
  end;
  fraSeleccionUsuarios.Clear;
  btnAnalizarPosibleTarea.Enabled := False;
end;

procedure TfrmABMAgendaBaseTarea.fraProcesoPropiedadesChange(Sender: TObject);
begin
  inherited;
  OnChangeMotivoIngreso(Sender);
end;

procedure TfrmABMAgendaBaseTarea.lbAsignadosClick(Sender: TObject);
var
  tslUsuariosAsignados: TStrings;
begin
  with fraSeleccionUsuarios do
  begin
    Load;
    tslUsuariosAsignados := UsuariosAsignados;

    if fpSeleccionUsuarios.ShowModal = mrOk then
      AnalizarAsignadoA
    else
      UsuariosAsignados := tslUsuariosAsignados;
  end;
end;

procedure TfrmABMAgendaBaseTarea.OnChangeMotivoIngreso(Sender: TObject);
var
  sCodigo: String;
begin
  inherited;
  if fraMotivoIngreso.IsSelected then
  begin
    if fraTipo.IsSelected then
      sCodigo := fraTipo.Codigo;

    fraTipo.Propiedades.ExtraCondition := fraTipo.Propiedades.ExtraCondition + ' AND te_tipoevento = ''T'' ';

    if not fraTipo.Locked then
    begin
      if Assigned(FApptEventoOriginante) then
        fraTipo.Propiedades.ExtraCondition := fraTipo.Propiedades.ExtraCondition + ' AND NVL(TE_IDPADRE, 0) IN (0, ' + SQLValue(FApptEventoOriginante.TipoEvento) + ')';
    end;

    if (Trim(sCodigo) > '') and (fraTipo.Codigo <> sCodigo) then
      fraTipo.Codigo := sCodigo;
  end;
end;

procedure TfrmABMAgendaBaseTarea.OnChangeTipo(Sender: TObject);
begin
  inherited;
  if ModoEvento then
    LoadApptIntoComponents(FApptEventoOriginante, True);

  AnalizarAsignadoA;
end;

procedure TfrmABMAgendaBaseTarea.sdqUsuariosNotificadosCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    if Active and not IsEmpty then
      FieldByName('ICONO').AsInteger := FieldByName('FLOAT_ICON').AsInteger;
end;

procedure TfrmABMAgendaBaseTarea.AnalizarAsignadoA;
var
  sTexto: String;
begin
  with fraSeleccionUsuarios do
  begin
    if UsuariosAsignados.Count > 1 then
      sTexto := 'Hay mas de 1 usuario seleccionado'
    else if UsuariosAsignados.Count = 1 then
      sTexto := UsuariosAsignados.Strings[0]
    else
      if fraTipo.IsSelected and fraTipo.sdqDatos.Active and (not fraTipo.sdqDatos.IsEmpty)
      and Assigned(fraTipo.sdqDatos.FindField('destinatario')) and (not fraTipo.sdqDatos.FieldByName('destinatario').IsNull) then
        sTexto := 'No hay seleccionados (asignación automática -> ' + fraTipo.sdqDatos.FieldByName('destinatario').AsString + ')'
      else
        sTexto := 'No hay seleccionados (asignación automática)';
  end;

  lbAsignados.Caption := sTexto;
end;

function TfrmABMAgendaBaseTarea.GetIdTarea: Integer;
begin
  if Assigned(ApptObject) then
    Result := ApptObject.IdTabla
  else
    Result := 0;
end;

procedure TfrmABMAgendaBaseTarea.AprobarRechazar(ATipo: String; AEstado: Integer);
begin
  EjecutarSqlEx('UPDATE agenda.asa_solicitudautorizacion ' +
                   'SET sa_usucumplimiento = :usuario, ' +
                       'sa_fechacumplimiento = SYSDATE, ' +
                       'sa_tipocumplimiento = :tipo1 ' +
                 'WHERE sa_tipo = :tipo2 ' +
                   'AND sa_idevento = :id) ', [Sesion.UserID, ATipo, 'T', IdTarea]);
  EjecutarSqlEx('UPDATE agenda.AAT_AGENDATAREA ' +
                   'SET AT_ESTADO = :estado ' +
                 'WHERE te_id = :id', [AEstado, IdTarea]);
  inherited;
end;

function TfrmABMAgendaBaseTarea.GetApptObject: TApptBase;
begin
  if not Assigned(FApptObject) then
    FApptObject := TApptTarea.Create(ScheduleObject, '');

  Result := inherited GetApptObject;
end;

procedure TfrmABMAgendaBaseTarea.Guardar(CanClose: Boolean = True);
begin
  Save;
end;

procedure TfrmABMAgendaBaseTarea.InternalLoadExtraQuerys;
begin
  OpenQueryEx(sdqConsulta, [IdTarea]);
  OpenQueryEx(sdqAdjuntos, [IdTarea]);
  OpenQueryEx(sdqUsuariosNotificados, [IdTarea]);
  dbgUsuarios.AutoSizeColumns := False;
  VCLExtra.DynColWidthsByData(dbgUsuarios);
  dbgUsuarios.AutoSizeColumns := True;
  JvDBTreeViewUsuarios.Perform(TVM_SETITEMHEIGHT, 20, 0);
  JvDBTreeViewUsuarios.FullExpand;
end;

procedure TfrmABMAgendaBaseTarea.InternalSetModoAutorizacion;
var
  sSQL, sHabilitado: String;
begin
  inherited;
  sSQL := 'SELECT :valor ' +
            'FROM agenda.asa_solicitudautorizacion ' +
           'WHERE sa_tipo = :valor2 ' +
             'AND sa_idevento = :id ' +
             'AND sa_tipocumplimiento IS NULL';
  sHabilitado := ValorSqlEx(sSQL, ['S', 'T', IdTarea]);
  btnRechazar.Enabled := sHabilitado = 'S';
  btnAprobar.Enabled := sHabilitado = 'S';
  LockDataObjects;
end;

procedure TfrmABMAgendaBaseTarea.LoadApptIntoComponents(objAppt: TApptBase; bSoloDatos: Boolean);
begin
  inherited LoadApptIntoComponents(objAppt, bSoloDatos);

  if Assigned(objAppt) and (objAppt is TApptTarea) then
  with objAppt as TApptTarea do
  begin
    fraPrioridad.Codigo := IntToStr(Prioridad);
    chkNotificacionCierre.Checked := NotificarAlCierre;
    if ModoABM = abmAlta then
      chkNotificacionCierre.Caption := 'Deseo recibir una notificación cuando se resuelva esta tarea'
    else begin
      if NotificarAlCierre then
      begin
        pnlDato34.Visible := True;      
        if Estado = ESTADO_TAREA_AGENDADA then
          chkNotificacionCierre.Caption := UsuarioAlta + ' recibió una notificación cuando se resolvió esta tarea'
        else
          chkNotificacionCierre.Caption := NVL(UsuarioAlta, 'Ud.') + ' será notificado al resolver esta tarea';
      end else
        pnlDato34.Visible := False;
    end;
    AcomodarTamanio;

    TApptTarea(ApptObject).Estado := ESTADO_EVENTO_PENDIENTE;
    if not bSolodatos then
      TApptTarea(ApptObject).IdEventoOriginante := objAppt.IdTabla;
  end;
end;

procedure TfrmABMAgendaBaseTarea.LockDataObjects(ALockControls: Boolean = True);
begin
  inherited;
  VCLExtra.LockControls([fraPrioridad], ALockControls);
end;

procedure TfrmABMAgendaBaseTarea.RecuperarInsatisfaccion;
begin
  inherited;
end;

procedure TfrmABMAgendaBaseTarea.RecuperarResolucion;
var
  sSQL: String;
begin
  sSQL := 'SELECT DECODE(at_estado, ' + IntToStr(ESTADO_TAREA_AGENDADA) + ', ra_idrespuesta, rt_idrespuesta) as idrespuesta, ' +
                 'DECODE(at_estado, ' + IntToStr(ESTADO_TAREA_AGENDADA) + ', ra_observacion, rt_observacion) as observacion, ' +
                 'DECODE(at_estado, ' + IntToStr(ESTADO_TAREA_AGENDADA) + ', ra_fechaalta, rt_fechaalta) as fechaalta, ' +
                 'rt_id as id, se_nombre ' +
            'FROM art.use_usuarios, agenda.aat_agendatarea, agenda.ara_respuestaagendaevento, agenda.art_respuestaagendatarea ' +
           'WHERE at_id = rt_idagendatarea(+) ' +
             'AND DECODE(at_estado, 5, NVL(ra_usumodif, ra_usualta), NVL(rt_usumodif, rt_usualta)) = se_usuario ' +
             'AND at_ideventotarea = ra_idagendaevento(+) ' +
             'AND at_id = :V1';
  with ApptObject, GetQueryEx(sSQL, [IdTabla]) do
  try
    if not IsEmpty then
    begin
      if Estado = ESTADO_TAREA_AGENDADA then
        tsRespuestas.ImageIndex := 1
      else
        tsRespuestas.ImageIndex := 3;
        
      IDRespuesta := FieldByName('idrespuesta').AsInteger;
      fraRespuesta.Codigo := FieldByName('idrespuesta').AsString;
      edResultado.Text := FieldByName('observacion').AsString;
      ObservacionRespuesta := FieldByName('observacion').AsString;
      IDRespuestaAgenda := FieldByName('id').AsInteger;
      edUsuRespuesta.Text := FieldByName('se_nombre').AsString;
      edFechaRespuesta.Date := FieldByName('fechaalta').AsDateTime;
    end else
    begin
      tsRespuestas.ImageIndex := 2;
      pnlRespuesta.Visible := False;
    end;

    if (Estado = ESTADO_TAREA_AGENDADA) or (Trim(edResultado.Text) = '') then
    begin
      edResultado.Height := tsRespuesta.Height - btnColocarRtaSugerida.Height - 88;
      lbAddObs.Visible := False;
      edResultadoNuevo.Visible := False;
      edResultado.ReadOnly := False;
    end else
    begin
      edResultado.Height := lbAddObs.Top - edResultado.Top - 7;
      lbAddObs.Visible := True;
      edResultadoNuevo.Visible := True;
      edResultado.ReadOnly := True;
    end;
  finally
    Free;
  end;
end;

procedure TfrmABMAgendaBaseTarea.SaveComponentsToAppt(objAppt: TApptBase);
begin
  inherited SaveComponentsToAppt(objAppt);
  objAppt.ObservacionRespuesta := edResultado.Text + iif(Trim(edResultadoNuevo.Text) > '', CRLF + edResultadoNuevo.Text, '');
  TApptTarea(objAppt).NotificarAlCierre := chkNotificacionCierre.Checked;
end;

procedure TfrmABMAgendaBaseTarea.SetExtraCondition;
begin
  if Assigned(FApptEventoOriginante) then
    try
      fraMotivoIngreso.Propiedades.ExtraCondition := iif((Sesion.Sector = 'CALLCENT') and (ModoABM = abmAlta), ' AND mi_id <> 11 ', '') +
                                                     Format(FCondicionEvento,
                                                     [SqlString(iif(ModoABM = abmAlta, 'S', 'N'), True),
                                                      SqlString(iif(fraProceso.IsSelected,
                                                                    fraProceso.Id,
                                                                    'te_idproceso')),
                                                      IntToStr(FApptEventoOriginante.TipoEvento)]
                                                     ) + IntToStr(FIDMotivoIngreso) + '))';
    except
    end
  else
    inherited;
end;

procedure TfrmABMAgendaBaseTarea.SetModoABM(const Value: TModoABM);
begin
  inherited;
  if ModoABM = abmAlta then
    AdvToolBarPager.Caption.Caption := 'Nueva tarea'
  else if ModoABM = abmModificacion then
    AdvToolBarPager.Caption.Caption := 'Modificación de tarea';

  pnlDato34.Visible := ModoABM = abmAlta;
  pnlDato34.Enabled := ModoABM = abmAlta;
end;

procedure TfrmABMAgendaBaseTarea.AltaTarea;
begin
  try
    pnlDato27.Visible := False;
    lbAsignados.Enabled := True;
    InvisibilizarPaneles;
    AcomodarTamanio;
    VCLExtra.LockControls(fraTipo,True);
    SetExtraCondition;
    fraRepite.Codigo := '1';
    fraPrioridad.Codigo := '2';
  except
  end;
end;

procedure TfrmABMAgendaBaseTarea.AssignEventAppt(vAppt: TApptBase);
begin
  ModoEvento := True;
  FApptEventoOriginante := TApptEvento(vAppt);
end;

class procedure TfrmABMAgendaBaseTarea.AssignRecordToAppt(objAppt: TJvTFAppt; objQuery: TSDQuery);
begin
  with objAppt as TApptTarea, objQuery do
  if not IsEmpty then
  try
    IdTabla           := FieldByName('at_id').AsInteger;
    Estado            := FieldByName('at_estado').AsInteger;
    IDUsuario         := FieldByName('at_idusuario').AsInteger;
    FechaVencimiento  := FieldByName('at_fechavencimiento').AsDateTime;
    TipoEvento        := FieldByName('at_idtipoevento').AsInteger;
    MotivoIngreso     := FieldByName('at_idmotivoingreso').AsInteger;    
    TodoElDia         := FieldByName('at_todoeldia').AsString = 'S';
    TipoRepeticion    := FieldByName('at_idtiporepeticion').AsInteger;
    Contrato          := FieldByName('at_contrato').AsInteger;
    Trabajador        := FieldByName('at_idtrabajador').AsInteger;
    NroEstableci      := FieldByName('at_nroestableci').AsInteger;
    ReqUbicacionEstab := FieldByName('at_requiereubicacionestab').AsString = 'S';
    IDContacto        := FieldByName('at_idcontacto').AsInteger;
    FechaAlta         := FieldByName('at_fechaalta').AsDateTime;
    UsuAlta           := FieldByName('at_usualta').AsString;

    if Assigned(FindField('insatisfaccion')) then
      Insatisfaccion  := FieldByName('insatisfaccion').AsString = 'S'
    else
      Insatisfaccion  := FieldByName('at_insatisfaccion').AsString = 'S';

    if (not FieldByName('AT_DOMICILIOCONTRATO').IsNull) and (FieldByName('AT_DOMICILIOCONTRATO').AsString > '') then
      UbicacionContrato := FieldByName('AT_DOMICILIOCONTRATO').AsString[1];

    Calle             := FieldByName('at_calle').AsString;
    Numero            := FieldByName('at_numero').AsString;
    Piso              := FieldByName('at_piso').AsString;
    Departamento      := FieldByName('at_departamento').AsString;
    CPostal           := FieldByName('at_cpostal').AsString;
    CPostala          := FieldByName('at_cpostala').AsString;
    Localidad         := FieldByName('at_localidad').AsString;
    Provincia         := FieldByName('at_provincia').AsString;
    Telefono          := FieldByName('at_numerotelefono').AsString;
    Descripcion       := FieldByName('at_descripcion').AsString;
    Contacto          := FieldByName('AT_CONTACTO').AsString;
    CorreoElectronico := FieldByName('AT_CORREOELECTRONICO').AsString;

    Prioridad         := FieldByName('AT_PRIORIDAD').AsInteger;
    Leido             := FieldByName('AT_LEIDO').AsString = 'S';

    IdPrestador       := FieldByName('AT_IDPRESTADOR').AsInteger;
    IdExpediente      := FieldByName('AT_IDEXPEDIENTE').AsInteger;
    Siniestro         := FieldByName('ex_siniestro').AsInteger;
    Orden             := FieldByName('ex_orden').AsInteger;
    Recaida           := FieldByName('ex_recaida').AsInteger;
    NumAuto           := FieldByName('AT_NUMAUTO').AsInteger;
    DatoFecha         := FieldByName('AT_DATOFECHA').AsDateTime;
    IdEntidad         := FieldByName('AT_IDENTIDAD').AsInteger;
    IdVendedor        := FieldByName('AT_IDVENDEDOR').AsInteger;
    IdFormulario      := FieldByName('AT_IDFORMULARIO').AsInteger;

    CUIT              := FieldByName('AT_CUIT').AsString;
    RazonSocial       := FieldByName('AT_RAZONSOCIAL').AsString;
    Actividad         := FieldByName('AT_CIIU').AsString;
    Trabajadores      := FieldByName('AT_CANTTRABAJADORES').AsInteger;
    MasaSalarial      := FieldByName('AT_MASASALARIAL').AsFloat;
    NotificarAlCierre := FieldByName('AT_NOTIFICARALCIERRE').AsString = 'S';
    NotificarAlCierreProx := FieldByName('AT_NOTIFICARCIERREPROX').AsString = 'S';

    if Assigned(FindField('usuario')) then
      Usuario := FieldByName('usuario').AsString; // El usuario que lo tiene en ese momento (ya sea bloqueado o en seguimiento)

    if Assigned(FindField('detalle')) then
      Detalle := FieldByName('detalle').AsString;

    if Assigned(FindField('st_id')) then
      IdSeguimiento := FieldByName('st_id').AsInteger;

    if Assigned(FindField('st_idusuario')) then
      IdUsuarioSeguimiento := FieldByName('st_idusuario').AsInteger;

    if Assigned(FindField('rt_id')) then
    begin
      IdRespuesta := FieldByName('rt_idrespuesta').AsInteger;
      ObservacionRespuesta := FieldByName('rt_observacion').AsString;
    end;
  except
  end;
end;

procedure TfrmABMAgendaBaseTarea.LoadBasicData(AProceso, AEvento: String; AIdAgendaEvento: Integer);
begin
  fraProceso.Codigo := AProceso;
  fraProcesoPropiedadesChange(nil);
//  esto lo suspendo por ahora...
//  fraMotivoIngreso.Codigo := AEvento;
  OnChangeMotivoIngreso(nil);
  TApptTarea(ApptObject).IDAgendaEvento := AIdAgendaEvento;
  VCLExtra.LockControls([fraRepite], True);
end;

procedure TfrmABMAgendaBaseTarea.LoadFromAppt(objAppt: TJvTFAppt);
var
  sSQL: String;
  objQuery: TSDQuery;
begin
  ApptObject.Assign(TApptTarea(objAppt));
  lbAsignados.Enabled := False;
  sSQL := 'UPDATE agenda.aat_agendatarea ' +
             'SET at_leido = :leido ' +
           'WHERE at_idusuario = :userid ' +
             'AND at_id = :id ';
  EjecutarSqlEx(sSQL, ['S', Sesion.ID, TApptTarea(ApptObject).IdTabla]);

  sSQL := 'SELECT ate.*, ast.*, (SELECT se_nombre FROM art.use_usuarios WHERE se_id = at_idusuario) as usuario, ' +
                '(SELECT se_mail FROM art.use_usuarios WHERE se_id = at_idusuario) as mail, ' +
                 'ex_siniestro, ex_orden, ex_recaida ' +
            'FROM art.sex_expedientes, agenda.ast_seguimientotarea ast, agenda.aat_agendatarea ate ' +
           'WHERE at_id = :id ' +
             'AND at_id = st_idtarea(+) ' +
             'AND at_idexpediente = ex_id(+) ';
  objQuery := GetQueryEx(sSQL, [ApptObject.IdTabla]);
  with objQuery do
  try
    AssignRecordToAppt(TApptTarea(ApptObject), objQuery);

    if (ModoABM = abmModificacion) then
      TApptTarea(ApptObject).IdAgendaEvento := FieldByName('at_idagendaevento').AsInteger;

    if not FieldByName('AT_IDUSUARIO').IsNull then
    begin
      fraSeleccionUsuarios.UsuariosAsignados.AddObject(FieldByName('usuario').AsString, TUserData.Create(FieldByName('AT_IDUSUARIO').AsInteger, FieldByName('mail').AsString));
      if fraSeleccionUsuarios.UsuariosAsignados.Count = 1 then
        lbAsignados.Caption := fraSeleccionUsuarios.UsuariosAsignados.Strings[0];
    end;
    edFechaVencimiento.Date := Trunc(FieldByName('AT_FECHAVENCIMIENTO').AsDateTime);
    edHoraVencimiento.Time := FieldByName('AT_FECHAVENCIMIENTO').AsDateTime - Trunc(FieldByName('AT_FECHAVENCIMIENTO').AsDateTime);
             
    LoadApptIntoComponents(ApptObject);
  finally
    Free;
  end;
  InternalLoadExtraQuerys;
  SetExtraCondition;
end;

procedure TfrmABMAgendaBaseTarea.LoadFromQuery(objQuery: TSDQuery; bModoCallCenter: Boolean = False; bAutorizacion: Boolean = False);
begin
  inherited;
  if objQuery.Active and not objQuery.IsEmpty then
    TApptTarea(ApptObject).IDAgendaEvento := objQuery.FieldByName('at_idagendaevento').AsInteger;

  InternalLoadExtraQuerys;
end;

procedure TfrmABMAgendaBaseTarea.LockAnswer(ALockControls: Boolean = True);
begin
  inherited;
  VCLExtra.LockControls([edResultadoNuevo], ALockControls);
  if Trim(edResultado.Text) > '' then
    VCLExtra.LockControls([edResultado], True);
end;

function TfrmABMAgendaBaseTarea.Save: Boolean;
  procedure CompletarDestinatarios(AIdTabla: Integer);
  var
    sSQL, sSQLAux: String;
  begin
    sSQLAux := 'SELECT se_id AS ID, se_nombre AS nombre, se_mail AS mail ' +
                 'FROM art.use_usuarios, agenda.ate_tipoevento, agenda.aat_agendatarea ' +
                'WHERE at_idtipoevento = te_id ' +
                  'AND te_iddestinatario = -1 ' +
                  'AND se_fechabaja IS NULL ' +
                  'AND se_mail IS NOT NULL ' +
                  'AND DECODE(te_destinatario_idsector, NULL, se_idsector, te_destinatario_idsector) = se_idsector ' +
                  'AND DECODE(te_destinatario_sector, NULL, se_sector, te_destinatario_sector) = se_sector ' +
                  'AND DECODE(te_destinatario_cargo, NULL, se_cargo, te_destinatario_cargo) = se_cargo ' +
                  'AND at_id = :id';

    sSQL := ValorSQLEx('SELECT NVL(td_sql, :sql) ' +
                         'FROM agenda.atd_tipodestinatario ' +
                        'WHERE td_id = :id', [sSQLAux, fraTipo.sdqDatos.FieldByName('te_iddestinatario').AsInteger]);
    if Trim(sSQL) > '' then
    with GetQueryEx(sSQL, [ApptObject.IdTabla]) do
    try
      if IsEmpty then
      begin
        with GetQueryEx('SELECT se_id, se_nombre, se_mail ' +
                          'FROM art.use_usuarios, comunes.chg_hechogeneradormail, comunes.chu_hechousuario ' +
                         'WHERE hu_usuario = se_usuario ' +
                           'AND hu_idhechogeneradormail = hg_id ' +
                           'AND hg_codigo = :clave ' +
                           'AND se_fechabaja IS NULL', ['SGC_RESP']) do
        try
          while not Eof do
          begin
            fraSeleccionUsuarios.UsuariosAsignados.AddObject(Fields[1].AsString, TUserData.Create(Fields[0].AsInteger, Fields[2].AsString));
            Next;
          end;
        finally
          Free;
        end;
      end else
        while not Eof do
        begin
          fraSeleccionUsuarios.UsuariosAsignados.AddObject(Fields[1].AsString, TUserData.Create(Fields[0].AsInteger, Fields[2].AsString));
          Next;
        end;
    finally
      Free;
    end;
  end;

  procedure InsertarSeguimientoTarea(AUsuario: Integer; AMail: String);
  begin
    if not ExisteSQLEx('SELECT 1 ' +
                         'FROM agenda.ast_seguimientotarea  ' +
                        'WHERE st_idtarea = :idtarea ' +
                          'AND st_idusuario = :idusuario ' +
                          'AND st_estado IN (''A'', ''T'')', [IdTarea, AUsuario]) then
    begin
      SQL.Clear; //No meter adentro del with...
      with Sql, Fields do
      begin
        TableName := 'agenda.ast_seguimientotarea';
        AddInteger('st_idtarea', IdTarea);
        AddInteger('st_idusuario', AUsuario);
        AddString('st_mail', AMail);
        AddString('st_estado', 'A');
        SqlType := stInsert;
        PrimaryKey.Add('st_id', GetSecNextVal('agenda.seq_ast_id'));
        EjecutarSQLST(Sql);

        SqlType := stUpdate;
        AddExpression('st_fechaenviomail', exDateTime);
        EjecutarSQLST(Sql);
      end;
    end;
  end;
  procedure InsertarTarea(AMultiple: Boolean; AUsuario: Integer);
  var
    i, iIdCodigo, iIdInsatisfaccion: Integer;
  begin
    SQL.Clear; //No meter adentro del with...
    with Sql, Fields do
    begin
      TableName := 'AGENDA.AAT_AGENDATAREA';
      if ModoABM = abmBaja then
      begin
        iIdCodigo := IdTarea;
        Add('AT_USUBAJA', Sesion.UserID);
        Add('AT_FECHABAJA', exDateTime);
        SqlType := stUpdate;
      end else
      begin
        if AUsuario > 0 then
          Add('AT_IDUSUARIO', AUsuario, True);
        {
        else
          AddExpression('AT_IDUSUARIO', exNull);
        }
        Add('AT_IDTIPOEVENTO', fraTipo.Codigo);
        Add('AT_IDMOTIVOINGRESO', fraMotivoIngreso.Codigo);
        AddString('AT_TODOELDIA', iif(cbTodoElDia.Checked, 'S', 'N'));
        Add('AT_INSATISFACCION', SQLBoolean(chkInsatisfaccion.Checked, False), True);
        Add('AT_IDTIPOREPETICION', fraRepite.Codigo);
        AddInteger('AT_CONTRATO', fraXX_CONTRATO.Contrato, True);
        AddInteger('AT_IDTRABAJADOR', Max(fraTrabajadorAgenda.Value, fraXX_IDEXPEDIENTE.Value), True);
        AddInteger('AT_NROESTABLECI', fraEstablecimientoAgenda.NroEstablecimiento, True);
        AddString('AT_REQUIEREUBICACIONESTAB', iif(fraDomicilioEstablecimientoAGENDA.RequiereDomicilio, 'S', 'N'));

        if fraDomicilioEmpresaAGENDA.RequiereDomicilio then
          AddString('AT_DOMICILIOCONTRATO', iif(fraDomicilioEmpresaAGENDA.Legal, 'L', iif(fraDomicilioEmpresaAGENDA.Postal, 'P', '')));
      
        if fraDomicilioUbicacion.IsSelected then
        begin
          Add('AT_CALLE', fraDomicilioUbicacion.Calle);
          Add('AT_NUMERO', fraDomicilioUbicacion.Numero);
          Add('AT_PISO', fraDomicilioUbicacion.Piso);
          Add('AT_DEPARTAMENTO', fraDomicilioUbicacion.Departamento);
          Add('AT_CPOSTAL', fraDomicilioUbicacion.CodigoPostal);
          Add('AT_CPOSTALA', fraDomicilioUbicacion.CPA);
          Add('AT_LOCALIDAD', fraDomicilioUbicacion.Localidad);

          if fraDomicilioUbicacion.Prov <> 0 then
            Add('AT_PROVINCIA', fraDomicilioUbicacion.Prov)
          else
            Add('AT_PROVINCIA', exNull);
        end;
      
        Add('AT_CONTACTO', fraContactoLibreAGENDA.Nombre);
        Add('AT_NUMEROTELEFONO', StrLeft(fraContactoLibreAGENDA.Telefono, 50));
        Add('AT_CORREOELECTRONICO', StrLeft(fraContactoLibreAGENDA.CorreoElectronico, 60));      
        AddInteger('AT_IDCONTACTO', fraContactoAgenda.ContactoID, True);
        AddDateTime('AT_FECHAVENCIMIENTO', edFechaVencimiento.Date + (edHoraVencimiento.Time - Trunc(edHoraVencimiento.Time)), True);
        Add('AT_DESCRIPCION', edDescripcion.Text);
        Add('AT_PRIORIDAD', fraPrioridad.Value);
        TApptTarea(ApptObject).Prioridad := StrToIntDef(fraPrioridad.Codigo, 0);

        Add('AT_IDEXPEDIENTE', fraXX_IDEXPEDIENTE.IdSiniestro, True);
        Add('AT_IDPRESTADOR', fraXX_IDPRESTADOR.Value, True);
        Add('AT_NUMAUTO', fraXX_NUMAUTO.Value, True);
        Add('AT_DATOFECHA', fraXX_DATOFECHA.Date, dmDate);

        Add('AT_IDENTIDAD', fraEntidadVendedorAGENDA.IdEntidad, True);
        Add('AT_IDVENDEDOR', fraEntidadVendedorAGENDA.IdVendedor, True);

        Add('at_idformulario', fraXX_IDFORMULARIO.Value, True);

        Add('at_cuit', fraProspecto.CUIT, True);
        Add('at_razonsocial', fraProspecto.RazonSocial, True);
        Add('at_ciiu', fraProspecto.Actividad, True);
        Add('at_canttrabajadores', fraProspecto.Trabajadores, True);
        Add('at_masasalarial', fraProspecto.MasaSalarial, 2);
        Add('at_notificaralcierre', SqlBoolean(chkNotificacionCierre.Checked, False));
        Add('at_notificarcierreprox', SqlBoolean(chkNotificacionCierreProx.Checked, False));        

//        {$MESSAGE HINT 'Revisar este estado, no se debe actualizar a 1 si era 5.'}
        AddString('AT_ESTADO', iif(AMultiple, iif((AUsuario <> 0) and (AUsuario <> Sesion.ID),
                                                  ESTADO_EVENTO_PENDIENTEAUTORIZACION,
                                                  ESTADO_EVENTO_PENDIENTE),
                                              iif(FinishAppt,
                                                  ESTADO_EVENTO_TERMINADO,
                                                  ESTADO_EVENTO_PENDIENTE)));

        if ModoEvento then
          Add('AT_IDAGENDAEVENTO', IDAgendaEvento, True);

        if ModoABM = abmAlta then
        begin
          SqlType := stInsert;
          iIdCodigo := GetSecNextVal('AGENDA.SEQ_AAT_ID');
          ApptObject.IdTabla := iIdCodigo;

          if AUsuario <> Sesion.ID then
            EjecutarSqlSTEx('INSERT INTO agenda.asa_solicitudautorizacion ' +
                            ' (sa_id, sa_idevento, sa_tipo, sa_usualta, sa_fechaalta ) ' +
                            'VALUES ' +
                            ' (agenda.seq_asa_id.NEXTVAL, :IdEvento, :Tipo, :Usuario, SYSDATE)', [iIdCodigo, 'T', Sesion.UserID]);

          Add('AT_USUALTA', Sesion.UserID);
          Add('AT_FECHAALTA', exDateTime);
          Add('AT_LEIDO','N');
        end else
        begin
          SqlType := stUpdate;
          iIdCodigo := IdTarea;
          Add('AT_USUMODIF', Sesion.UserID);
          Add('AT_FECHAMODIF', exDateTime);
          Add('AT_USUBAJA', exNull);
          Add('AT_FECHABAJA', exNull);
        end;
      end;

      PrimaryKey.Add('AT_ID', iIdCodigo);
      EjecutarSQLST(Sql);

      if fraRespuesta.IsSelected or (Trim(edResultado.Lines.Text) > '') then
      with ApptObject do
      begin
        if IDRespuestaAgenda <> 0 then
        begin
          EjecutarSqlSTEx('UPDATE agenda.art_respuestaagendatarea ' +
                             'SET rt_fechamodif = SYSDATE, ' +
                                 'rt_usumodif = :usuario, ' +
                                 'rt_idrespuesta = DECODE(:idrespuesta, 0, NULL, :idrespuesta), ' +
                                 'rt_observacion = :observacion ' +
                           'WHERE rt_id = :id', [Sesion.UserID, IDRespuesta, IDRespuesta, ObservacionRespuesta, IDRespuestaAgenda]);
        end else
        begin
          IDRespuestaAgenda := GetSecNextVal('agenda.seq_art_id');
          EjecutarSqlSTEx('INSERT INTO agenda.art_respuestaagendatarea ' +
                          '(rt_id, rt_idrespuesta, rt_idagendatarea, rt_idusuariorespuesta, rt_fechahorarespuesta, ' +
                          ' rt_usualta, rt_fechaalta, rt_observacion) ' +
                          ' VALUES (:id, DECODE(:idrespuesta, 0, NULL, :idrespuesta), :idtarea, :idusuario, ART.ACTUALDATE, :usualta, sysdate, :observacion)',
                          [IDRespuestaAgenda, IDRespuesta, IDRespuesta, IdTabla, Sesion.ID,
                           Sesion.UserID, ObservacionRespuesta]);
        end;
      end;

      if (btnInsatisfaccion.State = ssOn) and (ModoABM = abmAlta) then
      with ApptObject do
      begin
        iIdInsatisfaccion := GetSecNextVal('agenda.seq_ain_id');
        EjecutarSqlSTEx('INSERT INTO agenda.ain_insatisfaccion ' +
                        '(in_id, in_idagendaevento, in_idagendatarea, in_comentario, in_usuario, in_fecha) ' +
                        'VALUES ' +
                        '(:id, DECODE(:idevento, 0, NULL, :idevento), :idtarea, :comentario, :usuario, sysdate)',
                        [iIdInsatisfaccion,
                         TApptTarea(ApptObject).IdEventoOriginante,
                         TApptTarea(ApptObject).IdEventoOriginante,
                         IdTabla,
                         InsatisfaccionComentario,
                         Sesion.UserID]);

        for i := 0 to InsatisfaccionDetalle.Count - 1 do
        begin
          EjecutarSqlSTEx('INSERT INTO agenda.aid_insatisfacciondetalle (ID_IDINSATISFACCION, ID_IDINSATISFACCIONCONF, ID_MARCA) ' +
                          'VALUES (:id_insatisfaccion, :id_conf, :marca)', [iIdInsatisfaccion, InsatisfaccionDetalle[i], 'S']);
        end;
      end;
    end;
  end;
var
  i: Integer;
begin
  Result := inherited Save;
  BeginTrans(True);
  try
    InsertarTarea(False, 0);

    if ModoABM <> abmModificacion then
    begin
      ModoABM := abmModificacion;

      if fraSeleccionUsuarios.UsuariosAsignados.Count = 0 then
        CompletarDestinatarios(ApptObject.IdTabla);

      if fraSeleccionUsuarios.UsuariosAsignados.Count = 0 then
      begin
        InsertarTarea(False, iif(ModoABM = abmAlta, Sesion.ID, 0));
        InsertarSeguimientoTarea(Sesion.ID, Sesion.UserMail)
      end else
      begin
        if (btnInsatisfaccion.State = ssOn) then
        begin //Si manifiesta insatisfacción, agrego a el/los jefe/s...
          for i := 0 to fraSeleccionUsuarios.UsuariosAsignados.Count - 1 do
          begin
            with GetQueryEx('SELECT jefe.se_id, jefe.se_nombre, jefe.se_mail ' +
                              'FROM art.use_usuarios jefe, art.use_usuarios usuario ' +
                             'WHERE jefe.se_usuario = usuario.se_respondea ' +
                               'AND usuario.se_id = :id', [fraSeleccionUsuarios.GetUserIdByIndex(i)]) do
            try
              if not IsEmpty then
                fraSeleccionUsuarios.UsuariosAsignados.AddObject(Fields[1].AsString, TUserData.Create(Fields[0].AsInteger, Fields[2].AsString));
            finally
              Free;
            end;
          end;
        end;

        if fraSeleccionUsuarios.UsuariosAsignados.Count = 1 then
        begin
          InsertarTarea(False, fraSeleccionUsuarios.GetUserIdByIndex(0));
          InsertarSeguimientoTarea(fraSeleccionUsuarios.GetUserIdByIndex(0), fraSeleccionUsuarios.GetUserMailByIndex(0));
        end else
        begin
          InsertarTarea(True, 0);
          for i := 0 to fraSeleccionUsuarios.UsuariosAsignados.Count - 1 do
            if Sesion.ID <> fraSeleccionUsuarios.GetUserIdByIndex(i) then
              InsertarSeguimientoTarea(fraSeleccionUsuarios.GetUserIdByIndex(i), fraSeleccionUsuarios.GetUserMailByIndex(i));
        end;
      end;
    end;
    
    CommitTrans(True);

    if not SaveWithoutClosing then
      ModalResult := mrOk
    else
      SaveWithoutClosing := False;
  except
    on E:Exception do
    begin
      Rollback(True);
      InvalidMsg(btnAceptar, E.Message);
    end;
  end;  
end;

function TfrmABMAgendaBaseTarea.Validar(PermiteCerrar: Boolean = True; GeneraTarea: Boolean = False): Boolean;
begin
  Verificar(fraPrioridad.IsEmpty, fraPrioridad.edCodigo, 'Debe especificar la prioridad de la tarea.');

  {$IFDEF COBRANZAS}
  if SaveWithoutClosing and RequiereRespuesta(StrToIntDef(fraTipo.Id, 0)) and fraRespuesta.IsEmpty then
  begin
    AdvToolBarPager.ActivePage := tsRespuestas;
    InfoHint(fraRespuesta, 'La tarea ' + fraTipo.Descripcion + ' requiere una respuesta para poder ser cerrada.', True);
  end;
  {$ENDIF}

  Result := inherited Validar;
end;

initialization
  RegisterClasses([TfraEstablecimiento, TfraEstablecimientoAGENDA]);

end.
