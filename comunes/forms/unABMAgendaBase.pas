unit unABMAgendaBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, AdvGlowButton, ComCtrls, unfraContacto,
  StdCtrls, unFraEmpresaAGENDA, unFraCodDesc, Mask, ToolEdit, DateComboBox,
  ExtCtrls, unFraDomicilio, unArtDbFrame, unFraTrabajadorAGENDA, unArtFrame,
  unArtDBAwareFrame, JvTFManager, unFraCodigoDescripcion, unFraEstablecimiento,
  ImgList, AdvOfficePager, AdvOfficePagerStylers, XPMenu, Placemnt, AdvToolBar,
  AdvOfficeStatusBar, AdvOfficeStatusBarStylers, AdvToolBarStylers, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, DB, DBSql, SDEngine, FormPanel, SqlFuncs, JvExDBGrids,
  JvDBGrid, unfraPrestadorAGENDA, unfraContactoAgenda, unFraTrabajadorSiniestroAGENDA,
  unfraEntidadVendedorAGENDA, unFraEmpresa, unFraTrabajadorSiniestro,
  unFraTrabajador, unfraCPR_PRESTADOR, unfraDomicilioEmpresaAGENDA,
  unfraEstablecimientoAGENDA, unfraDomicilioEstablecimientoAGENDA, unAgenda,
  unfraNumAutoAGENDA, unfraContactoLibreAGENDA, unFraDomicilioGIS,
  unfraDomicilioAGENDA, ArtDBGrid, unInterfaces, unFraUsuarioConJerarquias,
  JvExMask, JvToolEdit, AdvOfficeButtons, AdvSmoothSlider, unfraProspectosAGENDA,
  CheckLst, ARTCheckListBox, Login, artDbLogin, artSeguridad, JvExExtCtrls,
  JvComponent, JvPanel, unFraEmpresaAfi, unfraEmpresaSolicitudAGENDA,
  unfraDatoFechaAGENDA, JvNavigationPane, JvComponentBase, JvExtComponent,
  RxToolEdit, RxPlacemnt;

const
  CODPANEL_CONTACTOLIBRE = 2;

type
  TfrmABMAgendaBase = class(TfrmCustomForm)
    AdvOfficePagerOfficeStyler: TAdvOfficePagerOfficeStyler;
    AdvOfficeStatusBarAdjuntos: TAdvOfficeStatusBar;
    AdvOfficeStatusBarObservaciones: TAdvOfficeStatusBar;
    AdvPage: TAdvPage;
    AdvPage1: TAdvPage;
    AdvPage2: TAdvPage;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvToolBarOfficeStylerSpeech: TAdvToolBarOfficeStyler;
    AdvToolBarPager: TAdvToolBarPager;
    AdvToolBarPager11: TAdvPage;
    AdvToolBarPager12: TAdvPage;
    AdvToolBarPager13: TAdvPage;
    AdvToolBarPagerAdjunto: TAdvToolBarPager;
    AdvToolBarPagerInsatisfaccion: TAdvToolBarPager;
    AdvToolBarPagerSpeech: TAdvToolBarPager;
    Bevel1: TBevel;
    BevelAbm: TBevel;
    btnAceptar: TAdvGlowButton;
    btnAceptarAdjunto: TAdvGlowButton;
    btnAceptarInsatisfaccion: TAdvGlowButton;
    btnAceptarMultiplesDatos: TAdvGlowButton;
    btnAgregarAdjunto: TAdvGlowButton;
    btnAgregarObservacion: TAdvGlowButton;
    btnAnalizarPosibleTarea: TAdvGlowButton;
    btnAnularAdjunto: TAdvGlowButton;
    btnAprobar: TAdvGlowButton;
    btnAyuda: TAdvGlowButton;
    btnCancel: TAdvGlowButton;
    btnCancelAprobacion: TAdvGlowButton;
    btnCancelar: TAdvGlowButton;
    btnCancelarAdjunto: TAdvGlowButton;
    btnCancelarInsatisfaccion: TAdvGlowButton;
    btnCancelarMultiplesDatos: TAdvGlowButton;
    btnCerrar: TAdvGlowButton;
    btnColocarRtaSugerida: TAdvGlowButton;
    btnDarOtraRespuesta: TAdvGlowButton;
    btnEliminarObservacion: TAdvGlowButton;
    btnGuardar: TAdvGlowButton;
    btnIncluirTareas: TAdvGlowButton;
    btnInsatisfaccion: TAdvSmoothSlider;
    btnModificarAdjunto: TAdvGlowButton;
    btnModificarObservacion: TAdvGlowButton;
    btnRechazar: TAdvGlowButton;
    btnSpeech: TAdvGlowButton;
    btnUtilizarRespuesta: TAdvGlowButton;
    btnVerArchivo: TAdvGlowButton;
    cbTodoElDia: TAdvOfficeCheckBox;
    chkInsatisfaccion: TAdvOfficeCheckBox;
    chkNuevoContacto: TCheckBox;
    clbOpciones: TARTCheckListBox;
    clbOpcionesInicio: TARTCheckListBox;
    dbgAdjuntos: TARTDBGrid;
    dbgMultiplesDatos: TArtDBGrid;
    dbgObservaciones: TJvDBGrid;
    DBLogin: TDBLogin;
    dsAdjuntos: TDataSource;
    dsConsulta: TDataSource;
    dsTexto: TDataSource;
    edArchivoAdjunto: TJvFilenameEdit;
    edComentarioInsatisfaccion: TMemo;
    edComentarioInsatisfaccionInicio: TMemo;
    edDescripcion: TMemo;
    edFechaAdjunto: TDateComboBox;
    edFechaAlarma: TDateComboBox;
    edFechaEvento: TDateComboBox;
    edFechaFin: TDateComboBox;
    edFechaObservacion: TDateComboBox;
    edFechaRespuesta: TDateComboBox;
    edFechaVencimiento: TDateComboBox;
    edHoraVencimiento: TDateTimePicker;
    edMemo: TRichEdit;
    edObservacion: TMemo;
    edUsuRespuesta: TEdit;
    fpAbm: TFormPanel;
    fpABMAdjunto: TFormPanel;
    fpInsatisfaccion: TFormPanel;
    fpMultiplesDatos: TFormPanel;
    fpSpeech: TFormPanel;
    fraContactoAgenda: TfraContactoAgenda;
    fraContactoLibreAGENDA: TfraContactoLibreAGENDA;
    fraDomicilioEmpresaAGENDA: TfraDomicilioEmpresaAGENDA;
    fraDomicilioEstablecimientoAGENDA: TfraDomicilioEstablecimientoAGENDA;
    fraDomicilioUbicacion: TfraDomicilioGISAGENDA;
    fraEntidadVendedorAGENDA: TfraEntidadVendedorAGENDA;
    fraMotivoIngreso: TfraCodDesc;
    fraNuevoCanal: TfraCodDesc;
    fraProceso: TfraCodDesc;
    fraProspecto: TfraProspectosAGENDA;
    fraRepite: TfraCodigoDescripcion;
    fraRespuesta: TfraCodDesc;
    fraTipo: TfraCodDesc;
    fraTrabajadorAgenda: TfraTrabajadorAGENDA;
    fraUsuarioAdjunto: TfraCodigoDescripcion;
    fraUsuarioAsignado: TfraUsuarioConJerarquias;
    fraUsuarioObservacion: TfraCodigoDescripcion;
    fraXX_IDEXPEDIENTE: TfraTrabajadorSiniestroAGENDA;
    fraXX_IDPRESTADOR: TfraPrestadorAGENDA;
    fraXX_NUMAUTO: TfraNumAutoAGENDA;
    IconosVista: TImageList;
    imgTabs: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbArchivoAdjunto: TLabel;
    lbDescripcion: TLabel;
    lbEvento: TLabel;
    lbFecha: TLabel;
    lbFechaAdjunto: TLabel;
    lbFechaAlarma: TLabel;
    lbFechaHasta: TLabel;
    lbFechaObservacion: TLabel;
    lbObservacion: TLabel;
    lbObservacionRespuesta: TLabel;
    lbProceso: TLabel;
    lbRespuesta: TLabel;
    lbSeRepite: TLabel;
    lbTipo: TLabel;
    lbUsuarioAdjunto: TLabel;
    lbUsuarioAsig: TLabel;
    lbUsuarioObservacion: TLabel;
    lbVencimiento: TLabel;
    PageControlEventos: TPageControl;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pgEventos: TAdvPage;
    pgObservaciones: TAdvPage;
    pnlAdjunto: TPanel;
    pnlBotoneraInsatisfaccion: TPanel;
    pnlBottomMultiplesDatos: TPanel;
    pnlBottomSpeech: TPanel;
    pnlComentarioInicio: TPanel;
    pnlDato1: TPanel;
    pnlDato10: TPanel;
    pnlDato11: TPanel;
    pnlDato12: TPanel;
    pnlDato13: TPanel;
    pnlDato15: TPanel;
    pnlDato2: TPanel;
    pnlDato25: TPanel;
    pnlDato26: TPanel;
    pnlDato27: TPanel;
    pnlDato28: TPanel;
    pnlDato29: TPanel;
    pnlDato3: TPanel;
    pnlDato30: TPanel;
    pnlDato31: TPanel;
    pnlDato32: TPanel;
    pnlDato4: TPanel;
    pnlDato5: TPanel;
    pnlDato6: TPanel;
    pnlDato7: TPanel;
    pnlDato8: TPanel;
    pnlDato9: TPanel;
    pnlGeneral: TPanel;
    pnlGralInsatisfaccion: TPanel;
    pnlObservaciones: TPanel;
    pnlOpcionesInicio: TPanel;
    pnlRespuesta: TPanel;
    pnStatus: TPanel;
    pnStatusAprobacion: TPanel;
    ScrollBox: TScrollBox;
    sdqAdjuntos: TSDQuery;
    sdqConsulta: TSDQuery;
    sdqTexto: TSDQuery;
    Seguridad: TSeguridad;
    tbpObservaciones: TAdvToolBarPager;
    teHoraAlarma: TDateTimePicker;
    teHoraDesde: TDateTimePicker;
    teHoraHasta: TDateTimePicker;
    TimerBotones: TTimer;
    TituloSpeech: TAdvToolBarPager;
    toolBarStyleAgenda: TAdvOfficeStatusBarOfficeStyler;
    tsDocumentacion: TTabSheet;
    tsDocumentacionAdjunta: TAdvPage;
    tsEvento: TTabSheet;
    tsEventos: TAdvPage;
    tsInsatisfaccion: TTabSheet;
    tsInsatisfacciones: TAdvPage;
    tsObservacion: TTabSheet;
    tsObservaciones: TAdvPage;
    tsRespuesta: TTabSheet;
    tsRespuestas: TAdvPage;
    btnAgendaTelefonica: TAdvGlowButton;
    pnlResultado: TPanel;
    edResultado: TMemo;
    sdqRespuestas: TSDQuery;
    pnlInfoExtraRespuesta: TJvPanel;
    objRichEditAux: TRichEdit;
    clbOpcionesFin: TARTCheckListBox;
    edComentarioInsatisfaccionFin: TMemo;
    fraXX_CONTRATO: TfraEmpresaAGENDA;
    pnlDato16: TPanel;
    pnlNotificacionCierreProx: TJvPanel;
    chkNotificacionCierreProx: TCheckBox;
    fraXX_DATOFECHA: TfraDatoFecha;
    JvNavPaneStyleManager: TJvNavPaneStyleManager;
    procedure AdvToolBarPagerChange(Sender: TObject);
    procedure AnalizoInsatisfaccion(Sender: TObject);
    procedure btnAceptarAdjuntoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnAceptarInsatisfaccionClick(Sender: TObject);
    procedure btnAgendaTelefonicaClick(Sender: TObject);
    procedure btnAgregarAdjuntoClick(Sender: TObject);
    procedure btnAgregarObservacionClick(Sender: TObject);
    procedure btnAnularAdjuntoClick(Sender: TObject);
    procedure btnAprobarClick(Sender: TObject);
    procedure btnAyudaClick(Sender: TObject);
    procedure btnCancelarInsatisfaccionClick(Sender: TObject);
    procedure btnCancelarRespuestaClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnInsatisfaccionStateChanged(Sender: TObject; State: TAdvSmoothSliderState; Value: Double);
    procedure btnModificarAdjuntoClick(Sender: TObject);
    procedure btnModificarObservacionClick(Sender: TObject);
    procedure btnRechazarClick(Sender: TObject);
    procedure btnSpeechClick(Sender: TObject);
    procedure btnUtilizarRespuestaClick(Sender: TObject);
    procedure btnVerArchivoClick(Sender: TObject);
    procedure cbTodoElDiaClick(Sender: TObject);
    procedure chkNuevoContactoClick(Sender: TObject);
    procedure dbgAdjuntosDblClick(Sender: TObject);
    procedure dbgAdjuntosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgMultiplesDatosDblClick(Sender: TObject);
    procedure dbgObservacionesDblClick(Sender: TObject);
    procedure dbgObservacionesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fpInsatisfaccionShow(Sender: TObject);
    procedure fpSpeechBeforeShow(Sender: TObject);
    procedure fraDomicilioEmpresaAGENDAchkRequiereDomicilioClick(Sender: TObject);
    procedure fraDomicilioEstablecimientoAGENDAchkRequiereDomicilioClick(Sender: TObject);
    procedure fraMotivoIngresocmbDescripcionDropDown(Sender: TObject);
    procedure fraProcesocmbDescripcionDropDown(Sender: TObject);
    procedure fraProcesoPropiedadesChange(Sender: TObject);
    procedure fraRespuestacmbDescripcionDropDown(Sender: TObject);
    procedure fraXX_IDEXPEDIENTEbtnClearClick(Sender: TObject);
    procedure OnChangeMotivoIngreso(Sender: TObject); virtual;
    procedure OnChangeTipo(Sender: TObject); virtual;
    procedure PageControlEventosChange(Sender: TObject);
    procedure PageControlEventosChanging(Sender: TObject; var AllowChange: Boolean);
    procedure sdqAdjuntosAfterOpen(DataSet: TDataSet);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure TimerBotonesTimer(Sender: TObject);
  private
    FModoABM: TModoABM;
    FRespuestaMostrada: String;
    FVincularEventoMultipleConTarea: Boolean;

    function  GetIDAgendaEvento: Integer;
    function  GetScheduleObject: TJvTFScheduleManager;

    procedure AcomodarRichEdit;
    procedure MostrarSpeech(sCaption, sAyuda: string);
    procedure PostAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure SetApptObject(const Value: TApptBase);
    procedure SetFrameTipoExtraCondition;
  protected
    fraEstablecimientoAgenda: TfraEstablecimientoAGENDA;
    fraXX_IDFORMULARIO: TfraEmpresaSolicitudAGENDA;  
    EventoAlmacenadoPeroEnModoAlta: Boolean;
    FApptObject: TApptBase;
    FIDMotivoIngreso,
    FIDTipoEvento: Integer;
    FModoCallCenter, FFinishAppt, FSaveWithoutClosing: Boolean;
    FObservaciones_Tabla,
    FObservaciones_Prefijo,
    FObservaciones_ForeignKey,

    FAdjuntos_Tabla,
    FAdjuntos_Prefijo,
    FAdjuntos_ForeignKey,

    FCondicionEvento,
    FCondicionProceso,
    FCondicionRespuesta,
    FCondicionRespuesta1,
    FCondicionRespuesta2,
    FCondicionTipoEvento,
    FIDAppt: String;
    FScheduleObject: TJvTFScheduleManager;
    FUltimaAltura: Integer;
    Sql: TCustomSql;
    function  EventoCalendarizado: Boolean;
    function  GetApptObject: TApptBase; virtual;
    function  SetPanel(nNroPanel: Integer; bActivar: Boolean; nUltimaAltura: Integer; var AFrameModuloAgenda: TFrame): Integer;

    procedure Adjuntos_ABM_Alta;
    procedure Adjuntos_ABM_Baja;
    procedure Adjuntos_ABM_Modificacion; virtual;
    procedure AprobarRechazar(ATipo: String; AEstado: Integer); virtual;
    procedure Guardar(CanClose: Boolean = True); virtual; abstract;
    procedure InternalLoadExtraQuerys; virtual; abstract;
    procedure InternalSetModoAutorizacion; virtual; abstract;
    procedure LimpiarCambioEvento(ASoloInvisibles: Boolean = False);
    procedure LoadApptIntoComponents(objAppt: TApptBase; bSoloDatos: Boolean = False); virtual;
    procedure LoadFromAppt(objAppt: TJvTFAppt); virtual; abstract;
    procedure LockAdjuntos(AValue: Boolean = True);
    procedure LockAnswer(ALockControls: Boolean = True); virtual;
    procedure LockDataObjects(ALockControls: Boolean = True); virtual;
    procedure LockObservaciones(AValue: Boolean = True);
    procedure Observaciones_ABM_Baja;
    procedure Observaciones_ABM_Modificacion; virtual; 
    procedure RecuperarInsatisfaccion; virtual;
    procedure RecuperarResolucion; virtual; abstract;
    procedure SaveApptToDataBase; virtual; abstract;
    procedure SaveComponentsToAppt(objAppt: TApptBase); virtual;
    procedure SetExtraCondition; virtual;
    procedure SetExtraConditionRespuesta;
    procedure SetModoABM(const Value: TModoABM); virtual;
    procedure SetModoCallCenter(Value: Boolean); virtual;
  public
    procedure AcomodarTamanio;
    class procedure AssignRecordToAppt(objAppt: TJvTFAppt; objQuery: TSDQuery); virtual; abstract;
    procedure ClearAppt; virtual;
    procedure InvisibilizarPaneles; virtual;
    procedure LimpiarCamposEventos;
    procedure LoadFromQuery(objQuery: TSDQuery; bModoCallCenter: Boolean = False; bAutorizacion: Boolean = False); virtual;
    function Save: Boolean; virtual;
    function Validar(PermiteCerrar: Boolean = True; GeneraTarea: Boolean = False): Boolean; virtual;
    property ApptObject: TApptBase read GetApptObject write SetApptObject;
    property FinishAppt: Boolean read FFinishAppt write FFinishAppt;
    property IDAgendaEvento: Integer read GetIDAgendaEvento;
    property ModoABM: TModoABM read FModoABM write SetModoABM;
    property ModoCallCenter: Boolean read FModoCallCenter write SetModoCallCenter;
    property SaveWithoutClosing: Boolean read FSaveWithoutClosing write FSaveWithoutClosing;
    property ScheduleObject: TJvTFScheduleManager read GetScheduleObject write FScheduleObject;
    property VincularEventoMultipleConTarea: Boolean read FVincularEventoMultipleConTarea write FVincularEventoMultipleConTarea;
  end;

var
  frmABMAgendaBase: TfrmABMAgendaBase;

implementation

uses
  VCLExtra, unDmPrincipal, AnsiSql, CustomDlgs, unSesion,
  General, unArt, unAlarmas, unAyuda,
  unRtti, TypInfo, unGrids, Numeros, Strfuncs, ArchFuncs, unArchivoVisor, 
  unComunes, unAgendaTelefonica, unSIC;

const
  COMP_PANEL_DATO = 'pnlDato';
  MAX_PANEL_DE_DATOS = 20;
  MAX_CANT_MODULOS = 35;

{$R *.dfm}

procedure TfrmABMAgendaBase.AdvToolBarPagerChange(Sender: TObject);
begin
  if Assigned(Sender) then
    HideAllBalloons;

  if AdvToolBarPager.ActivePage = tsEventos then
    PageControlEventos.ActivePage := tsEvento
  else if AdvToolBarPager.ActivePage = tsObservaciones then
    PageControlEventos.ActivePage := tsObservacion
  else if AdvToolBarPager.ActivePage = tsRespuestas then
    PageControlEventos.ActivePage := tsRespuesta
  else if AdvToolBarPager.ActivePage = tsDocumentacionAdjunta then
    PageControlEventos.ActivePage := tsDocumentacion
  else if AdvToolBarPager.ActivePage = tsInsatisfacciones then
    PageControlEventos.ActivePage := tsInsatisfaccion;

  PageControlEventosChange(nil);
end;

procedure TfrmABMAgendaBase.AnalizoInsatisfaccion(Sender: TObject);
begin
  inherited;
  if Sender is TAdvOfficeCheckBox then
    btnInsatisfaccion.State := iif(chkInsatisfaccion.Checked, ssOn, ssOff)
  else
    chkInsatisfaccion.Checked := btnInsatisfaccion.State = ssOn;

  if (btnInsatisfaccion.State = ssOn) and ((ModoABM = abmAlta) or (EventoCalendarizado and (ModoABM = abmModificacion))) then
  begin
    HideAllBalloons;
    if fpInsatisfaccion.ShowModal = mrOk then
    begin
      //
    end else
    begin
      if Assigned(Sender) then
      begin
        chkInsatisfaccion.Checked := False;
        btnInsatisfaccion.State := ssOff
      end else
        Abort;
    end;
  end;
end;

procedure TfrmABMAgendaBase.btnAceptarAdjuntoClick(Sender: TObject);
begin
  Verificar((edArchivoAdjunto.Color <> LOCK_COLOR) and not FileExists(edArchivoAdjunto.FileName), edArchivoAdjunto, 'Debe indicar el archivo adjunto para poder guardar.');
  fpABMAdjunto.ModalResult := mrOk;
end;

procedure TfrmABMAgendaBase.btnAceptarClick(Sender: TObject);
begin
  Verificar(Trim(edObservacion.Lines.Text) = '', edObservacion, 'Debe completar las observaciones para poder guardar.');
  Verificar(chkNuevoContacto.Checked and fraNuevoCanal.IsEmpty, fraNuevoCanal, 'Si indica que esta observación representa un nuevo contacto debe indicar el canal.');
  fpAbm.ModalResult := mrOk;
end;

procedure TfrmABMAgendaBase.btnAceptarInsatisfaccionClick(Sender: TObject);
begin
  inherited;
  Verificar(clbOpciones.CheckedItems.Count = 0, clbOpciones, 'Debe seleccionar algún tipo de insatisfacción para manifestarla.');
  Verificar(Trim(edComentarioInsatisfaccion.Text) = '', edComentarioInsatisfaccion, 'Debe realizar algún comentario acerca del motivo de la queja o reclamo.');
  fpInsatisfaccion.ModalResult := mrOk;
end;

procedure TfrmABMAgendaBase.btnAgregarAdjuntoClick(Sender: TObject);
var
  nID: Integer;
  Stream: TFileStream;
  sFileName: String;
begin
  //Verificar(ModoABM = abmAlta, btnAgregarAdjunto, 'Debe almacenar el evento o tarea para poder añadirle documentación adjunta.');

  if (ModoABM = abmAlta) then
  begin
    if MsgAsk('Para continuar dando de alta un adjunto debe almacenar lo cargado hasta el momento.' + CRLF + '¿Desea hacerlo ahora?') then
    begin
      FinishAppt := False;
      SaveWithoutClosing := True;
      //EventoAlmacenadoPeroEnModoAlta := True;

      if Validar(False) then
      begin
        Guardar(False);
        LoadApptIntoComponents(ApptObject);
        LockDataObjects;
        LockObservaciones(False);
        LockAdjuntos(False);
        SaveWithoutClosing := False;
      end else
        Abort;
    end else
      Abort;
  end;
  
  Adjuntos_ABM_Baja;

  VCLExtra.LockControls(edArchivoAdjunto, False);
  edFechaAdjunto.Date := DBDateTime;
  fraUsuarioAdjunto.Codigo := Sesion.UserID;

  HideAllBalloons;
  if fpABMAdjunto.ShowModal = mrOk then
  begin
    sFileName := StringReplace(edArchivoAdjunto.FileName, #$200F, '', [rfReplaceAll]);
    BeginTrans(True);
    Sql.Clear;
    with Sql, Fields do
    try
      TableName := FAdjuntos_Tabla;
      Add(FAdjuntos_Prefijo + 'filename', ExtractFileName(sFileName));
      Add(FAdjuntos_Prefijo + 'fullpathfilename', sFileName);
      Add(FAdjuntos_Prefijo + FAdjuntos_ForeignKey, ApptObject.IdTabla);

      SqlType := stInsert;
      Add(FAdjuntos_Prefijo + 'usualta', Sesion.UserID);
      Add(FAdjuntos_Prefijo + 'fechaalta', exDateTime);
      nID := GetSecNextVal('agenda.seq_a' + FAdjuntos_Prefijo + 'id');
      PrimaryKey.Add(FAdjuntos_Prefijo + 'id', nID);

      EjecutarSqlST(Sql);
      Stream := TFileStream.Create(edArchivoAdjunto.FileName, fmOpenRead);
      try
        SaveBlob('SELECT ' + FAdjuntos_Prefijo + 'file' +
                  ' FROM ' + FAdjuntos_Tabla +
                 ' WHERE ' + FAdjuntos_Prefijo + 'id = ' + SqlValue(nID),
                 'UPDATE ' + FAdjuntos_Tabla +
                   ' SET ' + FAdjuntos_Prefijo + 'file = :' + FAdjuntos_Prefijo + 'file' +
                 ' WHERE ' + FAdjuntos_Prefijo + 'id = ' + SqlValue(nID),
                 FAdjuntos_Prefijo + 'file', Stream);
      finally
        Stream.Free;
      end;
      CommitTrans(True);
      Verificar(ExisteSqlEx('SELECT 1 FROM ' + FAdjuntos_Tabla + ' WHERE ' + FAdjuntos_Prefijo + 'file IS NULL AND ' + FAdjuntos_Prefijo + 'id = :id', [nID]),
                btnAgregarAdjunto,
                'Hubo un incidente al adjuntar el archivo seleccionado, consulte con Sistemas sobre la posible causa.' + CRLF + CRLF +
                'Tenga en cuenta que el archivo que acaba de adjuntar no podrá ser visualizado por otros usuarios en estas condiciones.');
    except
      Rollback(True);
    end;
  end;

  if (ApptObject is TApptEvento) and (TApptEvento(ApptObject).IdTareaOrigen > 0) then
    OpenQueryEx(sdqAdjuntos, [IDAgendaEvento, 'N', IDAgendaEvento, 'N', TApptEvento(ApptObject).IdTareaOrigen])
  else
    OpenQueryEx(sdqAdjuntos, [ApptObject.IdTabla]);
end;

procedure TfrmABMAgendaBase.btnAgregarObservacionClick(Sender: TObject);
begin
  Verificar(ModoABM = abmAlta, btnAgregarObservacion, 'Debe almacenar ' + iif(Self.ClassName = 'TfrmABMAgendaBaseEvento', 'el evento', 'la tarea') + ' para poder añadirle una observación.');
  Observaciones_ABM_Baja;

  VCLExtra.LockControls([edObservacion, chkNuevoContacto], False);
  edFechaObservacion.Date := DBDateTime;
  fraUsuarioObservacion.Codigo := Sesion.UserID;

  HideAllBalloons;
  if fpAbm.ShowModal = mrOk then
    AgregarObservaciones(FObservaciones_Tabla, FObservaciones_Prefijo, FObservaciones_ForeignKey, ApptObject.IdTabla, edObservacion.Text, StrToIntDef(fraNuevoCanal.Codigo, 0));

  OpenQueryEx(sdqConsulta, [ApptObject.IdTabla]);
end;

procedure TfrmABMAgendaBase.btnAnularAdjuntoClick(Sender: TObject);
begin
  if not sdqAdjuntos.IsEmpty then
  begin
    Verificar(not sdqAdjuntos.FieldByName(FAdjuntos_Prefijo + 'fechabaja').IsNull, btnAnularAdjunto, 'El adjunto ha sido dado de baja y no se permite su visualización');
    if MsgAsk('Usted está a punto de eliminar el ajunto ' + ExtractFileName(sdqAdjuntos.FieldByName(FAdjuntos_Prefijo + 'fullpathfilename').AsString) + CRLF + CRLF + '¿Desea continuar?') then
    try
      if TApptEvento(ApptObject).IdTareaOrigen > 0 then
      begin
        FAdjuntos_Tabla := 'agenda.ajt_adjuntotarea';
        FAdjuntos_Prefijo := 'jt_';
      end else
      begin
        FAdjuntos_Tabla := 'agenda.aje_adjuntoevento';
        FAdjuntos_Prefijo := 'je_';
      end;

      BeginTrans(True);
      Sql.Clear;
      with Sql, Fields do
      try
        TableName := FAdjuntos_Tabla;

        SqlType := stUpdate;
        Add(FAdjuntos_Prefijo + 'usubaja', Sesion.UserID);
        Add(FAdjuntos_Prefijo + 'fechabaja', exDateTime);
        PrimaryKey.Add(FAdjuntos_Prefijo + 'id', sdqAdjuntos.FieldByName(FAdjuntos_Prefijo + 'id').AsInteger);

        EjecutarSqlST(Sql);
        CommitTrans(True);
        sdqAdjuntos.Refresh;
      except
        RollBack(False);
      end;
    finally
      FAdjuntos_Tabla := 'agenda.aje_adjuntoevento';
      FAdjuntos_Prefijo := 'je_';
    end;
  end;
end;

procedure TfrmABMAgendaBase.btnAprobarClick(Sender: TObject);
begin
  AprobarRechazar('A', 1);
end;

procedure TfrmABMAgendaBase.btnAyudaClick(Sender: TObject);
begin
  HideAllBalloons;
  MostrarAyuda('Explicación sobre el motivo seleccionado', fraTipo.sdqDatos.FieldByName('TE_AYUDA').AsString, True);
end;

procedure TfrmABMAgendaBase.btnCancelarInsatisfaccionClick(Sender: TObject);
begin
  fpInsatisfaccion.ModalResult := mrCancel;
end;

procedure TfrmABMAgendaBase.btnCancelarRespuestaClick(Sender: TObject);
begin
  AdvToolBarPager.ActivePage := tsEventos;
  fpSpeech.ModalResult := mrCancel;
end;

procedure TfrmABMAgendaBase.btnCerrarClick(Sender: TObject);
begin
  inherited;
  if fraRespuesta.IsEmpty and IsEmptyString(edResultado.Lines.Text) then
  begin
    AdvToolBarPager.ActivePage := tsRespuestas;
    InfoHint(fraRespuesta, Format('Debe tener una respuesta seleccionada para poder cerrar %s o bien escribir algo en las observaciones de la respuesta.',
             [iif(Self.ClassName = 'TfrmABMAgendaBaseEvento', 'un evento', 'una tarea')]), True);
  end;
  FinishAppt := True;

  if Validar then
    Save;
end;

procedure TfrmABMAgendaBase.btnGuardarClick(Sender: TObject);
begin
  if Validar then
    Guardar;
end;

procedure TfrmABMAgendaBase.btnInsatisfaccionStateChanged(Sender: TObject; State: TAdvSmoothSliderState; Value: Double);
begin
  AnalizoInsatisfaccion(Sender);
end;

procedure TfrmABMAgendaBase.btnModificarAdjuntoClick(Sender: TObject);
begin
  inherited;
  if not sdqAdjuntos.IsEmpty then
  begin
    Verificar(not sdqAdjuntos.FieldByName(FAdjuntos_Prefijo + 'fechabaja').IsNull, btnModificarAdjunto, 'El adjunto ha sido dado de baja y no se permite su visualización');
    Adjuntos_ABM_Baja;
    Adjuntos_ABM_Modificacion;
    HideAllBalloons;
    fpABMAdjunto.ShowModal;
  end;
end;

procedure TfrmABMAgendaBase.btnModificarObservacionClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  begin
    Observaciones_ABM_Baja;
    Observaciones_ABM_Modificacion;
    HideAllBalloons;
    fpAbm.ShowModal;
  end;
end;

procedure TfrmABMAgendaBase.btnRechazarClick(Sender: TObject);
begin
  inherited;
  AprobarRechazar('R', 4);
end;

procedure TfrmABMAgendaBase.btnSpeechClick(Sender: TObject);
var
  sSQL, sTexto: String;
  iValor: Integer;
  iValorInt64: Int64;
  sValor: String;
  i, j: Integer;
  PropInfo: PPropInfo;
begin
  if not IsEmptyString(FRespuestaMostrada) and (Sender = btnColocarRtaSugerida) then
  begin
    if IsEmptyString(edResultado.Text) then
      edResultado.Text := FRespuestaMostrada
    else
      edResultado.Text := edResultado.Text + CRLF + FRespuestaMostrada;

    FRespuestaMostrada := '';
  end else
  begin
    inherited;
    { Muestra un texto emergente de este estilo...
    'Sr./a Cliente, le informo que el traslado consultado por usted está aprobado y gestionado. El remis/ambulancia pasará a buscarlo por su domicilio para llevarlo hasta el prestador xxx al turno que tiene asignado el día xxx, a la hora xxx.'
    }
    sSQL := VarToStr(fraTipo.sdqDatos.FieldByName('TE_SQL').Value);
    sdqTexto.SQL.Text := RemoveFirstSQLCommment(sSQL);

    sdqTexto.Prepare;
    if sdqTexto.Params.Count > 0 then
    begin
      for i := 0 to sdqTexto.Params.Count - 1 do
      begin
        for j := 0 to ComponentCount - 1 do
          if Supports(Components[j].ClassType, IModuloAgenda) then
            if (Components[j] as IModuloAgenda).Visible then
              if UpperCase(sdqTexto.Params[i].Name) = (Components[j] as IModuloAgenda).ParamName then
                if ExistsProperty(Components[j], sdqTexto.Params[i].Name) or ExistsProperty(Components[j], UpperCase(sdqTexto.Params[i].Name)) then
                begin
                  if (Components[j] as IModuloAgenda).IsSelected then
                  begin
                    PropInfo := TypInfo.GetPropInfo(Components[j], sdqTexto.Params[i].Name);

                    if (PropInfo <> Nil) and (PropInfo^.PropType^.Kind = tkInteger) then
                    begin
                      GetPropByName(Components[j], sdqTexto.Params[i].Name, iValor);
                      sdqTexto.Params[i].Value := iValor;
                    end else
                      if (PropInfo <> Nil) and (PropInfo^.PropType^.Kind = tkInteger) then
                      begin
                        GetPropByName(Components[j], sdqTexto.Params[i].Name, iValorInt64);
                        sdqTexto.Params[i].Value := iValorInt64;
                      end else
                        if (PropInfo <> Nil) and (PropInfo^.PropType^.Kind = tkLString) then
                        begin
                          GetPropByName(Components[j], sdqTexto.Params[i].Name, sValor);
                          sdqTexto.Params[i].Value := sValor;
                        end else
                          sdqTexto.Params[i].Value := 0;
                  end else
                  begin
                    sdqTexto.Params[i].Value := Null;
                    sdqTexto.Params[i].DataType := ftInteger; 
                  end;
                end;
      end;
    end;

    for i := 0 to sdqTexto.Params.Count - 1 do
      Verificar(sdqTexto.Params[i].DataType = ftUnknown, btnSpeech, 'Hay un parámetro cuyo valor no ha sido definido.');

    with sdqTexto do
    begin
      OpenQuery(sdqTexto);
      if Active and not IsEmpty then
      begin
        if RecordCount > 1 then
        begin
          dbgMultiplesDatos.Align := alLeft;
          //InfoHint(btnSpeech, 'Se encontró mas de un dato para mostrar.');
          VCLExtra.DynColWidthsByData(dbgMultiplesDatos);
          if Assigned(dbgMultiplesDatos.ColumnByField['TEXTO']) then
          begin
            dbgMultiplesDatos.ColumnByField['TEXTO'].Visible := False;
            dbgMultiplesDatos.ColumnByField['TEXTO'].Index := dbgMultiplesDatos.Columns.Count - 1;
          end;

          dbgMultiplesDatos.Width := GetColumnWidths(dbgMultiplesDatos, True) - 2;
          fpMultiplesDatos.Width := dbgMultiplesDatos.Width + 16;
          fpMultiplesDatos.Height := Min(Screen.Height - 100, TituloSpeech.Height + 36 + pnlBottomMultiplesDatos.Height + sdqTexto.RecordCount * 18);
          First;
          dbgMultiplesDatos.Align := alClient;
          dbgMultiplesDatos.ShowSearchButton := RecordCount > 5;

          HideAllBalloons;
          if fpMultiplesDatos.ShowModal = mrOk then
          begin
            if Assigned(FindField('TEXTO')) then
              sTexto := FindField('TEXTO').AsString
            else
              sTexto := Fields[0].AsString;
          end else
            Abort;
        end else
          if Assigned(FindField('TEXTO')) then
            sTexto := FindField('TEXTO').AsString
          else
            sTexto := Fields[0].AsString;

        if Trim(sTexto) > '' then
        begin
          MostrarSpeech('Respuesta sobre el motivo seleccionado', sTexto);
          FRespuestaMostrada := sTexto;
          if Sender = btnColocarRtaSugerida then
            btnSpeechClick(Sender);
        end
      end else
        InfoHint(btnSpeech, 'Para los datos especificados el sistema no puede elaborar una respuesta sugerida.');
    end;
  end;
end;

procedure TfrmABMAgendaBase.btnUtilizarRespuestaClick(Sender: TObject);
begin
  FRespuestaMostrada := edMemo.Lines.Text;
  fpSpeech.ModalResult := mrOk;
  AdvToolBarPager.ActivePage := tsRespuestas;
  if btnColocarRtaSugerida.Enabled then
    btnSpeechClick(btnColocarRtaSugerida);
end;

procedure TfrmABMAgendaBase.btnVerArchivoClick(Sender: TObject);
var
  sFileName, sPrefijo: String;
  Stream: TFileStream;
begin
  inherited;
  Verificar(sdqAdjuntos.IsEmpty, btnVerArchivo, 'No hay ningún adjunto para visualizar.');
  sPrefijo := sdqAdjuntos.FieldByName('prefijo').AsString;

  if FileExists(sdqAdjuntos.FieldByName(FAdjuntos_Prefijo + 'fullpathfilename').AsString) then
    sFileName := sdqAdjuntos.FieldByName(FAdjuntos_Prefijo + 'fullpathfilename').AsString
  else if not sdqAdjuntos.FieldByName(FAdjuntos_Prefijo + 'file').IsNull then
  begin
    sFileName := IncludeTrailingPathDelimiter(TempPath) + ExtractFileName(sdqAdjuntos.FieldByName(FAdjuntos_Prefijo + 'fullpathfilename').AsString);
    Stream := TFileStream.Create(sFileName, fmCreate);
    try
      BlobSql('SELECT ' + sPrefijo + 'file' +
              '  FROM ' + sdqAdjuntos.FieldByName('tabla').AsString +
              ' WHERE ' + sPrefijo + 'id = ' + sdqAdjuntos.FieldByName('id').AsString, Stream);
    finally
      Stream.Free;
    end;
  end;
{
  Verificar(ExisteSqlEx('SELECT 1 FROM ' + FAdjuntos_Tabla + ' WHERE ' + FAdjuntos_Prefijo + 'file IS NULL AND ' + FAdjuntos_Prefijo + 'id = :id', [sdqAdjuntos.FieldByName('id').AsString]),
            btnAgregarAdjunto,
            'Hubo un incidente al adjuntar el archivo seleccionado, consulte con Sistemas sobre la posible causa.' + CRLF + CRLF +
            'Tenga en cuenta que el archivo que acaba de adjuntar no podrá ser visualizado por otros usuarios en estas condiciones.');
}  
  Verificar(not FileExists(sFileName), btnVerArchivo, 'Ocurrió un problema con el archivo que intenta abrir, consulte con Sistemas.');
  AbrirArchivoVisor(sFileName, True, True);
end;

procedure TfrmABMAgendaBase.cbTodoElDiaClick(Sender: TObject);
begin
  Verificar(edFechaEvento.Date = 0, edFechaEvento, 'Debe seleccionar la fecha.');
  if cbTodoElDia.Checked then
  begin
    teHoraDesde.Date := edFechaEvento.Date;
    teHoraHasta.Date := edFechaEvento.Date;
    teHoraDesde.Time := 0;
    teHoraHasta.Time := 0.99999999;
    edFechaFin.Date := edFechaEvento.Date;
    VCLExtra.LockControls([teHoraDesde, teHoraHasta, edFechaFin], True);
  end
  else
    VCLExtra.LockControls([teHoraDesde, teHoraHasta, edFechaFin], False);
end;

procedure TfrmABMAgendaBase.chkNuevoContactoClick(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([fraNuevoCanal], edObservacion.ReadOnly or (not chkNuevoContacto.Checked) or (Sesion.Sector = 'CALLCENT'));
  if chkNuevoContacto.Checked and (Sesion.Sector = 'CALLCENT') then
    fraNuevoCanal.Codigo := '1';
end;

procedure TfrmABMAgendaBase.dbgAdjuntosDblClick(Sender: TObject);
begin
  btnModificarAdjunto.Click;
end;

procedure TfrmABMAgendaBase.dbgAdjuntosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqAdjuntos.FieldByName(FAdjuntos_Prefijo + 'FECHABAJA').IsNull then
  begin
    AFont.Color := IIF(Highlight, clMaroon, clRed);
    AFont.Style := AFont.Style + [fsStrikeOut]; 
  end;
end;

procedure TfrmABMAgendaBase.dbgMultiplesDatosDblClick(Sender: TObject);
begin
  inherited;
  btnAceptarMultiplesDatos.Click;
end;

procedure TfrmABMAgendaBase.dbgObservacionesDblClick(Sender: TObject);
begin
  btnModificarObservacion.Click;
end;

procedure TfrmABMAgendaBase.dbgObservacionesGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName(FObservaciones_Prefijo + 'FECHABAJA').IsNull then
  begin
    AFont.Color := IIF(Highlight, clMaroon, clRed);
    AFont.Style := AFont.Style + [fsStrikeOut]; 
  end;
end;

procedure TfrmABMAgendaBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fraDomicilioEmpresaAGENDA.FrameEmpresa := nil;
  fraXX_CONTRATO.FrameEstablecimiento := nil;
  fraXX_IDFORMULARIO.FrameEstablecimiento := nil;
  fraEstablecimientoAgenda.fraEmpresa := nil;
  fraDomicilioEstablecimientoAGENDA.FrameEstablecimiento := nil;
  fraTrabajadorAgenda.FrameEmpresa := nil;
  fraXX_IDEXPEDIENTE.FrameEmpresa := nil;
  fraXX_IDEXPEDIENTE.FrameNumAuto := nil;
  fraXX_NUMAUTO.FrameSiniestro := nil;
  fraXX_NUMAUTO.FramePrestador := nil;
  fraXX_NUMAUTO.FrameTipo := nil;

//  ClearAppt;
  try
    if Assigned(Sql) then
      Sql.Free;
  except
    Sql := nil;
  end;
  inherited;
  HideAllBalloons;
end;

procedure TfrmABMAgendaBase.FormCreate(Sender: TObject);
begin
  AdvToolBarPager.TabStop := False;
  teHoraAlarma.Time := 0;
  edHoraVencimiento.Time := 0;
  toolBarStyleAgenda.Style := psOffice2010Black;
  AdvOfficePagerOfficeStyler.Style := TOfficePagerStyle(psOffice2010Black);
  AdvToolBarOfficeStyler.Style := bsOffice2007Obsidian;
  AdvToolBarOfficeStyler.PagerCaption.Font.Color := $00C8C8C8;
  //IniciarEspera;
  try
    HideTitlebar;
    ModoABM := abmNone;
    pnlDato27.Align := alBottom;
    pnlDato30.Align := alBottom;
    Height := 150;
    FUltimaAltura := 0;

    fraEstablecimientoAgenda := TfraEstablecimientoAGENDA.Create(Self);
    with fraEstablecimientoAgenda do
    begin
      Parent := pnlDato5;
      Align := alClient;
    end;

    with fraXX_CONTRATO do
    begin
      FrameEstablecimiento := fraEstablecimientoAgenda;
      FrameTrabajador      := fraTrabajadorAgenda;
      FrameSiniestro       := fraXX_IDEXPEDIENTE;
      FrameContacto        := fraContactoAgenda;
      FrameContactoLibre   := fraContactoLibreAGENDA;
      ShowBajas            := True;
    end;

    fraXX_IDFORMULARIO := TfraEmpresaSolicitudAGENDA.Create(Self, pnlDato16.Handle);
    with fraXX_IDFORMULARIO do
    begin
      Parent := pnlDato16;
      Align := alClient;
    end;
    
    with fraXX_IDFORMULARIO do
    begin
      FrameEstablecimiento := fraEstablecimientoAgenda;
      FrameTrabajador      := fraTrabajadorAgenda;
      FrameSiniestro       := fraXX_IDEXPEDIENTE;
      FrameContacto        := fraContactoAgenda;
      FrameContactoLibre   := fraContactoLibreAGENDA;
      ShowBajas            := True;
    end;

    fraDomicilioEmpresaAGENDA.ShowBajas := True;
    fraXX_IDPRESTADOR.ShowBajas := True;
    fraEstablecimientoAgenda.ShowBajas := True;
    fraDomicilioEstablecimientoAGENDA.ShowBajas := True;

    fraDomicilioEmpresaAGENDA.FrameEmpresa := fraXX_CONTRATO;
    fraEstablecimientoAgenda.fraEmpresa := fraXX_CONTRATO;
    fraDomicilioEstablecimientoAGENDA.FrameEstablecimiento := fraEstablecimientoAgenda;
    fraTrabajadorAgenda.FrameEmpresa := fraXX_CONTRATO;
    fraXX_IDEXPEDIENTE.FrameEmpresa := fraXX_CONTRATO;
    fraXX_IDEXPEDIENTE.FrameNumAuto := fraXX_NUMAUTO;
    fraXX_NUMAUTO.FrameSiniestro := fraXX_IDEXPEDIENTE;
    fraXX_NUMAUTO.FramePrestador := fraXX_IDPRESTADOR;
    fraXX_NUMAUTO.FrameTipo := fraTipo;

    inherited;

    Sql := TDBSql.Create;
    AdvToolBarPager.ToolBarStyler :=  AdvToolBarOfficeStyler;
    VCLExtra.LockControls([fraUsuarioAsignado, clbOpcionesInicio, clbOpcionesFin,
                           edComentarioInsatisfaccionInicio, edComentarioInsatisfaccionFin,
                           edUsuRespuesta, edFechaRespuesta], True);
    clbOpcionesInicio.DisableItems;

    FCondicionEvento :=
      ' AND((EXISTS ( ' +
      '           SELECT 1 ' +
      '             FROM agenda.ate_tipoevento, agenda.ati_tipoeventomotivoingreso, agenda.ats_tipoeventosector ' +
      '            WHERE te_id = ts_idtipoevento ' +
      '              AND ti_idtipoevento = te_id ' +
      '              AND ti_idmotivoingreso = mi_id ' +
      '              AND art.agenda_pkg.get_privacidad(' + SqlValue(Sesion.Id) + ', te_id, ' + SqlValue(Sesion.Id) + ', %s) = ''S'' ' +
      '              AND NVL(te_idproceso, 0) = %s ' +
      '              AND te_tipoevento = ' + SqlString(iif(Self.ClassName = 'TfrmABMAgendaBaseEvento', 'E', 'T'), True) +
      '              AND te_fechabaja IS NULL ' +
      '              AND NVL(te_idpadre, 0) IN (0, %s) ' +
      '              AND ts_fechabaja IS NULL ' +
      '              AND ti_fechabaja IS NULL ' +
      '              AND ts_tipooperacion = ''M'') ' +
      '       AND mi_fechabaja IS NULL ' +
      '     ) ' +
      '  OR (mi_id = ';

    FCondicionProceso := 'AND EXISTS(SELECT 1 ' +
                                      'FROM agenda.ate_tipoevento, agenda.ati_tipoeventomotivoingreso ' +
                                     'WHERE te_idproceso = po_id ' +
                                       'AND ti_idtipoevento = te_id ' +
                                       'AND NVL(ti_idmotivoingreso, 0) = %s)';

    FCondicionTipoEvento :=
      ' AND (((EXISTS ( ' +
      '           SELECT 1 ' +
      '             FROM agenda.ats_tipoeventosector ' +
      '            WHERE ts_fechabaja IS NULL ' +
      '              AND te_id = ts_idtipoevento ' +
      '              AND art.agenda_pkg.get_privacidad(' + SqlValue(Sesion.Id) + ', te_id, ' + SqlValue(Sesion.Id) + ', %s) = ''S'' ' +
      '              AND ts_tipooperacion = ''M'') ' +
      '      AND te_fechabaja IS NULL ' +
      '     ) ';

    FCondicionRespuesta :=
      ' AND ((EXISTS (SELECT 1 ' +
      '                 FROM agenda.are_respuestaevento, agenda.ats_tipoeventosector, art.use_usuarios ' +
      '                WHERE re_idtipoeventosector = ts_id ' +
      '                  AND re_idrespuesta = rs_id ' +
      '                  AND se_usuario = ' + SqlValue(Sesion.UserID) +
      '                  AND ts_idtipoevento = ';
    FCondicionRespuesta1 :=
      '                  AND art.agenda_pkg.is_sectordependiente(CASE ts_privacidad ' +
                                                                'WHEN ''GE'' THEN art.varios.get_idgerenciausuario(se_usuario) ' +
                                                                'WHEN ''JE'' THEN art.varios.get_idjefaturausuario(se_usuario) ' +
                                                                'WHEN ''SE'' THEN se_idsector ELSE ts_idsector END, ts_idsector) = ''S'' ';
    FCondicionRespuesta2 :=
      '                  AND re_fechabaja IS NULL ' +
      '                  AND ts_fechabaja IS NULL) ' +
      '       AND rs_fechabaja IS NULL) ' +
      '   OR (rs_id = ';

    fraUsuarioAsignado.ModoUsuario := muTodos;
    with fraUsuarioObservacion do
    begin
      TableName := 'art.use_usuarios';
      FieldDesc := 'se_nombre';
      FieldID := 'se_id';
      FieldCodigo := 'se_usuario';
      FieldBaja := 'se_fechabaja';
      CaseSensitive := False;
      ShowBajas := True;
    end;
    with fraUsuarioAdjunto do
    begin
      TableName := 'art.use_usuarios';
      FieldDesc := 'se_nombre';
      FieldID := 'se_id';
      FieldCodigo := 'se_usuario';
      FieldBaja := 'se_fechabaja';
      CaseSensitive := False;
      ShowBajas := True;
    end;
    with fraRepite do
    begin
      TableName := 'agenda.atr_tiporepeticion';
      FieldDesc := 'tr_descripcion';
      FieldID := 'tr_id';
      FieldCodigo := 'tr_id';
      FieldBaja := 'tr_fechabaja';
      CaseSensitive := False;
      ShowBajas := True;
    end;

    AdvToolBarPager.ActivePageIndex := 0;
    PageControlEventos.ActivePageIndex := 0;
    fraContactoAgenda.fraTelefonos.Initialize(True, 'TN_IDCONTACTO', 'TN', 'ATN_TELEFONOCONTACTO');
    //VCLExtra.LockControls(fraDomicilioEstablecimientoAGENDA,True);
    VCLExtra.LockControls(fraContactoAgenda, True);
    fraContactoAgenda.TabStop := True;

    VCLExtra.LockControls([edFechaObservacion, fraUsuarioObservacion, edFechaAdjunto, fraUsuarioAdjunto], True);
  finally
    //DetenerEspera;
  end;
end;

procedure TfrmABMAgendaBase.FormShow(Sender: TObject);
begin
  inherited;
  btnCerrar.Visible := (ModoABM <> abmAlta) and not ModoCallCenter;
  btnInsatisfaccion.Enabled := False;
  if ModoABM = abmModificacion then
    AdvToolBarPager.Caption.Caption := 'Modificación de ' + iif(Self.ClassName = 'TfrmABMAgendaBaseEvento', 'evento', 'tarea') +
                                       ' N° ' + IntToStr(ApptObject.IdTabla) + iif(Self.ClassName = 'TfrmABMAgendaBaseEvento', iif(TApptEvento(ApptObject).IdTareaOrigen > 0, ' - Tarea N° ' + IntToStr(TApptEvento(ApptObject).IdTareaOrigen), ''), '');
  fraXX_CONTRATO.Change;
  fraXX_IDFORMULARIO.Change;
end;

procedure TfrmABMAgendaBase.fpInsatisfaccionShow(Sender: TObject);
begin
  clbOpciones.Color := clGray;//$00CCCCCC;
  clbOpciones.SQL := 'SELECT ic_descripcion, ic_id ' +
                       'FROM agenda.aic_insatisfaccionconf ' +
                      'WHERE 1 = 1 ' +
                        'AND ic_tipo = ' + SQLString(iif((Self.ClassName = 'TfrmABMAgendaBaseEvento') and
                                                         (ApptObject is TApptEvento) and
                                                         (TApptEvento(ApptObject).IdTareaOrigen > 0), 'R', 'P'), True) + ' ' +
                        'AND NVL(' + SqlDate(TApptBase(ApptObject).FechaAlta) + ', SYSDATE) BETWEEN ic_fechaalta AND NVL(ic_fechabaja, SYSDATE) ' +
                   'ORDER BY ic_tipo, ic_orden';
  fpInsatisfaccion.Height := pnlBotoneraInsatisfaccion.Height + 184 + (clbOpciones.Items.Count * (clbOpciones.ItemHeight + 4));
  pnlGralInsatisfaccion.Height := fpInsatisfaccion.Height;
end;

procedure TfrmABMAgendaBase.fpSpeechBeforeShow(Sender: TObject);
begin
  if ModoABM = abmAlta then
    AdvToolBarPagerSpeech.CaptionButtons := AdvToolBarPagerSpeech.CaptionButtons - [cbClose]
  else
    AdvToolBarPagerSpeech.CaptionButtons := AdvToolBarPagerSpeech.CaptionButtons + [cbClose];

  inherited;
  btnUtilizarRespuesta.Enabled := (ModoABM = abmAlta);
  btnDarOtraRespuesta.Enabled := (ModoABM = abmAlta);
end;

procedure TfrmABMAgendaBase.fraDomicilioEmpresaAGENDAchkRequiereDomicilioClick(Sender: TObject);
begin
  inherited;
  fraDomicilioEmpresaAGENDA.chkRequiereDomicilioClick(Sender);
  AcomodarTamanio;
end;

procedure TfrmABMAgendaBase.fraDomicilioEstablecimientoAGENDAchkRequiereDomicilioClick(Sender: TObject);
begin
  inherited;
  fraDomicilioEstablecimientoAGENDA.chkRequiereDomicilioClick(Sender);
  AcomodarTamanio;
end;

procedure TfrmABMAgendaBase.fraMotivoIngresocmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  SetExtraCondition;
  fraMotivoIngreso.cmbDescripcionDropDown(Sender);
end;

procedure TfrmABMAgendaBase.fraProcesocmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  SetExtraCondition;
  fraProceso.cmbDescripcionDropDown(Sender);
end;

procedure TfrmABMAgendaBase.fraProcesoPropiedadesChange(Sender: TObject);
begin
  if fraProceso.IsSelected then
  begin
    SetExtraCondition;
    SetFrameTipoExtraCondition;
    if fraTipo.IsSelected and fraProceso.IsSelected and
      ({(fraTipo.sdqDatos.FieldByName('te_idevento').AsString <> fraMotivoIngreso.ID) or}
       (fraTipo.sdqDatos.FieldByName('te_idproceso').AsString <> fraProceso.ID)) then
    begin
      fraTipo.Clear;
      LimpiarCambioEvento;
      InvisibilizarPaneles;
      AcomodarTamanio;
    end;
  end else
  begin
    fraTipo.Clear;
    fraTipo.Propiedades.ExtraCondition := '';
  end;

//  VCLExtra.LockControls(fraMotivoIngreso, fraProceso.IsEmpty);
  VCLExtra.LockControls(fraTipo, fraMotivoIngreso.IsEmpty or fraProceso.IsEmpty);
end;

procedure TfrmABMAgendaBase.SetExtraConditionRespuesta;
begin
  fraRespuesta.Propiedades.ExtraCondition := FCondicionRespuesta  + IntToStr(Max(ApptObject.TipoEvento, StrToIntDef(fraTipo.Codigo, 0)))+
                                             iif(fraRespuesta.Locked, '', FCondicionRespuesta1) + FCondicionRespuesta2 + IntToStr(ApptObject.IDRespuesta)+'))';
end;

procedure TfrmABMAgendaBase.fraRespuestacmbDescripcionDropDown(Sender: TObject);
begin
  inherited;
  SetExtraConditionRespuesta;
  fraRespuesta.cmbDescripcionDropDown(Sender);
end;

procedure TfrmABMAgendaBase.fraXX_IDEXPEDIENTEbtnClearClick(Sender: TObject);
begin
 inherited;
  fraXX_IDEXPEDIENTE.btnClearClick(Sender);
end;

procedure TfrmABMAgendaBase.OnChangeMotivoIngreso(Sender: TObject);
begin
  if fraMotivoIngreso.IsSelected then
  begin
    SetFrameTipoExtraCondition;
    if fraTipo.IsSelected and not ExisteSQLEx('SELECT 1 ' +
                                                'FROM agenda.ati_tipoeventomotivoingreso ' +
                                               'WHERE ti_idtipoevento =:idtipoevento ' +
                                                 'AND ti_idmotivoingreso = :idmotivoingreso ' +
                                             iif((ModoABM = abmModificacion) or (ModoABM = abmNone),
                                                 '',
                                                 'AND ti_fechabaja is null'), [fraTipo.ID, fraMotivoIngreso.ID]) then
    begin
      fraTipo.Clear;
      LimpiarCambioEvento;
      InvisibilizarPaneles;
      AcomodarTamanio;
    end;

    FIDTipoEvento := StrToIntDef(fraMotivoIngreso.Codigo, 0);
  end else
  begin
    fraTipo.Clear;
    fraTipo.Propiedades.ExtraCondition := '';
  end;

  VCLExtra.LockControls(fraTipo, fraMotivoIngreso.IsEmpty or fraProceso.IsEmpty);

  if fraMotivoIngreso.IsEmpty then
    fraRespuesta.Propiedades.ExtraCondition := ' AND 1 = 2';

  SetExtraCondition;  
end;

procedure TfrmABMAgendaBase.OnChangeTipo(Sender: TObject);
var
  sSQL : String;
  iMinutos, iPanel: Integer;
  auxFrame: TFrame;
begin
  Constraints.MinHeight := 0;
  FUltimaAltura := pnlDato25.Height + pnlDato26.Height + pnlDato28.Height + pnlDato29.Height;
  InvisibilizarPaneles;

  if fraTipo.IsSelected then
  begin
    btnInsatisfaccion.Enabled := ModoABM = abmAlta;
    FIDTipoEvento := StrToIntDef(fraMotivoIngreso.Codigo, 0);
    sSQL := '  SELECT mo_codigopanel, (SELECT dep.mo_codigopanel ' +
            '                            FROM agenda.amo_modulo dep ' +
            '                           WHERE dep.mo_tipomodulo = mod.mo_tipomodulodependiente) as depende_de, ' +
            '         tm_obligatorio ' +
            '    FROM agenda.ate_tipoevento, ' +
            '         agenda.atm_tipomoduloevento, ' +
            '         agenda.amo_modulo mod ' +
            '   WHERE tm_idtipoevento = te_id ' +
            '     AND tm_idmoduloevento = mo_id ' +
            '     AND tm_fechabaja IS NULL ' +
            '     AND te_id = :id ' +
            'ORDER BY tm_orden ';
    with GetQueryEx(sSQL, [fraTipo.Codigo]) do
    try
      while not Eof do
      begin
        iPanel := Fields[0].AsInteger;
        FUltimaAltura := SetPanel(iPanel, True, FUltimaAltura, auxFrame);

        if Assigned(auxFrame) and Supports(auxFrame, IModuloAgenda) then
          (auxFrame as IModuloAgenda).IsRequired := Fields[2].AsString = 'S';

        if not Fields[1].IsNull then
          FUltimaAltura := SetPanel(Fields[1].AsInteger, True, FUltimaAltura, auxFrame);

        Next;
      end;
    finally
      Free;
    end;

    if ModoCallCenter then
    begin
      SetPanel(CODPANEL_CONTACTOLIBRE, True, FUltimaAltura, auxFrame);
      (Self.FindComponent(COMP_PANEL_DATO + IntToStr(CODPANEL_CONTACTOLIBRE)) as TPanel).Top := pnlDato30.Top;
    end;

    SetChildTaborders(ScrollBox);
    if fraTipo.CanFocus then
    try
      fraTipo.SetFocus;
      PostMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    except
    end;

    fraProceso.Codigo := fraTipo.sdqDatos.FieldByName('TE_IDPROCESO').AsString;
    btnSpeech.Enabled := (not fraTipo.sdqDatos.FieldByName('TE_SQL').IsNull) and (EventoAlmacenadoPeroEnModoAlta or
                                                                                  (not ((Sesion.Sector = 'CALLCENT') and
                                                                                        (ModoABM = abmModificacion))));
    btnColocarRtaSugerida.Enabled := not fraTipo.sdqDatos.FieldByName('TE_SQL').IsNull;
    btnAyuda.Enabled := not fraTipo.sdqDatos.FieldByName('TE_AYUDA').IsNull;
  end else
    FIDTipoEvento := 0;

  LimpiarCambioEvento(True);
  AcomodarTamanio;
  Application.ProcessMessages;

  if fraTipo.IsSelected then
  begin
    SetExtraConditionRespuesta;
    OpenQueryEx(sdqRespuestas, [fraTipo.Value]);
    pnlInfoExtraRespuesta.Caption := sdqRespuestas.Fields[0].AsString;
    pnlInfoExtraRespuesta.Visible := not IsEmptyString(pnlInfoExtraRespuesta.Caption);
    pnlNotificacionCierreProx.Visible := (TApptEvento(ApptObject).IdTareaOrigen > 0) and pnlInfoExtraRespuesta.Visible;
    pnlNotificacionCierreProx.Enabled := True;

    with objRichEditAux do
    begin
      Height := 24 * 6;
      Width := pnlInfoExtraRespuesta.Width;
      Text := pnlInfoExtraRespuesta.Caption;
    end;
  end else
  begin
    fraRespuesta.Propiedades.ExtraCondition := ' AND 1 = 2';
    pnlInfoExtraRespuesta.Visible := False;
  end;

  if (ModoABM = abmAlta) and fraTipo.IsSelected and not fraTipo.sdqDatos.FieldByName('te_tiemporesolucion').IsNull then
  begin
    iMinutos := fraTipo.sdqDatos.FieldByName('te_tiemporesolucion').AsInteger;

    if GetDecimales(iMinutos / 24 / 60) = 0 then //El vencimiento fue configurado en cantidad de días
    begin
      edFechaVencimiento.Date := CalcDiasHabiles(Trunc(DBDate), Trunc(iMinutos / 24 / 60) - 1);
      edHoraVencimiento.Time := 1/24 * 22 // 22:00hs.
    end else
    begin
      edFechaVencimiento.Date := Trunc(DBDateTime + (iMinutos / 24 / 60));
      edHoraVencimiento.Time := edFechaVencimiento.Date - (DBDateTime + (iMinutos / 24 / 60));
    end;
    
    VCLExtra.LockControls([edFechaVencimiento, edHoraVencimiento], True);
  end else
    VCLExtra.LockControls([edFechaVencimiento, edHoraVencimiento], False);
end;

procedure TfrmABMAgendaBase.PageControlEventosChanging(Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  if AdvToolBarPager.ActivePageIndex <> PageControlEventos.ActivePageIndex then
    AdvToolBarPager.ActivePageIndex := PageControlEventos.ActivePageIndex;
end;

procedure TfrmABMAgendaBase.sdqAdjuntosAfterOpen(DataSet: TDataSet);
var
  nAnchoColumnas: Integer;
begin
  if sdqAdjuntos.IsEmpty then
    tsDocumentacionAdjunta.ImageIndex := 2
  else
    tsDocumentacionAdjunta.ImageIndex := 1;

  VCLExtra.DynColWidthsByData(dbgAdjuntos);
  nAnchoColumnas := GetColumnWidths(dbgAdjuntos, True);
  if nAnchoColumnas < dbgAdjuntos.Width then
    dbgAdjuntos.Columns[0].Width := dbgAdjuntos.Columns[0].Width + (dbgAdjuntos.Width - nAnchoColumnas);
end;

procedure TfrmABMAgendaBase.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.IsEmpty then
    tsObservaciones.ImageIndex := 2
  else
    tsObservaciones.ImageIndex := 1;
end;

procedure TfrmABMAgendaBase.TimerBotonesTimer(Sender: TObject);
begin
  inherited;
  btnCancelar.Enabled := True;
  TimerBotones.Enabled := False;
end;

procedure TfrmABMAgendaBase.AcomodarRichEdit;
var
  Bajando: boolean;
  i: Integer;
begin
  with fpSpeech do
  begin
    Height := 137;
    AdvToolBarPagerSpeech.Height := 102;
    Height := 137;
    edMemo.Update;
    Bajando := False;

    while edMemo.Lines.Strings[edMemo.Lines.Count - 1] = '' do
      edMemo.Lines.Delete(edMemo.Lines.Count - 1);

    edMemo.Update;

    while ( (AdvToolBarPagerSpeech.Height < (Screen.Height div 2))
    and     (RE_GetLastVisibleLine(edMemo) < edMemo.Lines.Count - 1) ) do
    begin
      AdvToolBarPagerSpeech.Height := AdvToolBarPagerSpeech.Height + 2;
      if Bajando then
      begin
        AdvToolBarPagerSpeech.Top := AdvToolBarPagerSpeech.Top - 2;
        Bajando := False;
      end
      else
        Bajando := True;

      edMemo.Update;
      if AdvToolBarPagerSpeech.Height = (Screen.Height div 2) then
      begin
        edMemo.ScrollBars := ssVertical;
        edMemo.Enabled := True;
        Break;
      end
    end;

    for i := 0 to 10 do
      AdvToolBarPagerSpeech.Height := AdvToolBarPagerSpeech.Height + 2;

    Height := AdvToolBarPagerSpeech.Height + pnlBottomSpeech.Height;
    edMemo.Enabled := True;
  end;
end;

function TfrmABMAgendaBase.GetIDAgendaEvento: Integer;
begin
  Result := ApptObject.IdAgendaEvento;
end;

function TfrmABMAgendaBase.GetScheduleObject: TJvTFScheduleManager;
begin
  if not Assigned(FScheduleObject) then
  begin
    FScheduleObject := TJvTFScheduleManager.Create(Self);
    FScheduleObject.OnPostAppt := PostAppt;
    FScheduleObject.Cache.CacheType := ctNone;
  end;

  Result := FScheduleObject;
end;

procedure TfrmABMAgendaBase.MostrarSpeech(sCaption: string; sAyuda: string);
begin
  with fpSpeech do
  begin
    Caption := sCaption;
    AdvToolBarPagerSpeech.Caption.Caption := sCaption;

    edMemo.Lines.Clear;
    edMemo.Update;
    edMemo.Lines.Text := sAyuda;

    AcomodarRichEdit;
    HideAllBalloons;
    if ShowModal <> mrOk then
    begin
      ShowAllBalloons;
      Abort;
    end;
  end;
end;

procedure TfrmABMAgendaBase.PostAppt(Sender: TObject; Appt: TJvTFAppt);
begin
  SaveApptToDataBase;
end;

procedure TfrmABMAgendaBase.SetApptObject(const Value: TApptBase);
begin
  if Assigned(FApptObject) then
    FApptObject.Assign(Value)
  else
    FApptObject := Value;
end;

procedure TfrmABMAgendaBase.SetFrameTipoExtraCondition;
begin                                                 
  fraTipo.Propiedades.ExtraCondition := StringReplace(Format(FCondicionTipoEvento, [String(iif(ModoABM = abmAlta, '''S''', '''N'''))]), '%r%', 'TE_IDPROCESO = ' + SqlValue(fraProceso.Codigo), [rfReplaceAll]) +
                                        ' AND TE_IDPROCESO = ' + SqlValue(fraProceso.Codigo) + ') ' +
                                        ' AND EXISTS(SELECT 1 ' +
                                                     ' FROM agenda.ati_tipoeventomotivoingreso ' +
                                                    ' WHERE ti_idtipoevento = te_id ' +
                                                      ' AND ti_idmotivoingreso = ' + SqlValue(fraMotivoIngreso.Codigo) +
                                        iif((ModoABM = abmModificacion) or (ModoABM = abmNone),
                                                      '',
                                                      ' AND ti_fechabaja IS NULL ') + ') ' +
                                        '  OR (TE_ID = ' + IntToStr(FIDTipoEvento) + ' AND EXISTS(SELECT 1 ' +
                                                                                                  ' FROM agenda.ati_tipoeventomotivoingreso ' +
                                                                                                 ' WHERE ti_idtipoevento = te_id ' +
                                                                                                   ' AND ti_idmotivoingreso = ' + SqlValue(fraMotivoIngreso.Codigo) + ')))';
end;

procedure TfrmABMAgendaBase.Adjuntos_ABM_Alta;
begin
  VCLExtra.LockControls(edArchivoAdjunto, False);
  edFechaAdjunto.Date := DBDateTime;
  fraUsuarioAdjunto.Codigo := Sesion.UserID;
end;

procedure TfrmABMAgendaBase.Adjuntos_ABM_Baja;
begin
  edFechaAdjunto.Clear;
  fraUsuarioAdjunto.Clear;
  edArchivoAdjunto.Clear;

  btnAceptarAdjunto.Visible := True;
  btnCancelarAdjunto.Caption := '&Cancelar';
end;

procedure TfrmABMAgendaBase.Adjuntos_ABM_Modificacion;
begin
  VCLExtra.LockControls(edArchivoAdjunto, True);
  with sdqAdjuntos do
  begin
    edFechaAdjunto.Date      := FieldByName(FAdjuntos_Prefijo + 'fechaalta').AsDateTime;
    fraUsuarioAdjunto.Codigo := FieldByName(FAdjuntos_Prefijo + 'usualta').AsString;
    edArchivoAdjunto.Text    := FieldByName(FAdjuntos_Prefijo + 'filename').AsString;

    btnAceptarAdjunto.Visible := False;
    btnCancelarAdjunto.Caption := '&Cerrar';
  end;
end;

procedure TfrmABMAgendaBase.AprobarRechazar(ATipo: String; AEstado: Integer);
begin
  Close;
end;

function TfrmABMAgendaBase.GetApptObject: TApptBase;
begin
  Result := FApptObject;
end;

procedure TfrmABMAgendaBase.LimpiarCambioEvento(ASoloInvisibles: Boolean = False);
  procedure ClearControl(AWinControl: TWinControl);
  begin
    if Supports(AWinControl, IModuloAgenda) then
      if ASoloInvisibles and Assigned(AWinControl.Parent) and AWinControl.Parent.Visible then
        (AWinControl as IModuloAgenda).Clear;
  end;
var
  i, iAux: Integer;
  objPanel: TCustomPanel;
  auxFrame: TFrame;
begin
  iAux := pnlDato25.Height + pnlDato26.Height + pnlDato28.Height + pnlDato29.Height;
  for i := MAX_PANEL_DE_DATOS downto 0 do
  begin
    if Assigned(Self.FindComponent(COMP_PANEL_DATO + IntToStr(i))) then
    begin
      objPanel := TCustomPanel(Self.FindComponent(COMP_PANEL_DATO + IntToStr(i)));

      iAux := SetPanel(i, objPanel.Visible, iAux, auxFrame);
      if Assigned(auxFrame) and Supports(auxFrame, IModuloAgenda) and (not ASoloInvisibles or not objPanel.Visible) then
        (auxFrame as IModuloAgenda).Clear;
    end;
  end;
end;

procedure TfrmABMAgendaBase.LoadApptIntoComponents(objAppt: TApptBase; bSoloDatos: Boolean = False);
var
  i, j: Integer;
  auxFrame: TFrame;
begin
  if Assigned(objAppt) then
  with objAppt do
  try
    if (Sesion.Sector = 'CALLCENT') and (ModoABM = abmModificacion) then
      btnSpeech.Enabled := False;
      
    if (IDUsuario > 0) then
      fraUsuarioAsignado.Value := {$IFDEF ART2}IDUsuario{$ELSE}IntToStr(IDUsuario){$ENDIF};
    pnlDato27.Visible := (IDUsuario > 0) and (ApptObject.IDUsuario <> Sesion.ID);

    if not bSoloDatos then
    begin
      fraTipo.Codigo := IntToStr(TipoEvento);
      fraMotivoIngreso.Codigo := IntToStr(MotivoIngreso);
      OnChangeMotivoIngreso(nil);
      OnChangeTipo(nil);
    end;

    if Insatisfaccion then
      btnInsatisfaccion.State := ssOn;

    edFechaEvento.Date                  := NvlDT(StartDate, FechaDesde);
    teHoraDesde.Time                    := NvlDT(StartTime, FechaDesde);
    teHoraHasta.Time 		                := NvlDT(EndTime, FechaHasta);
    edFechaFin.Date                     := NvlDT(EndDate, FechaDesde + FechaHasta);
    cbTodoElDia.Checked                 := TodoElDia;
    chkInsatisfaccion.Checked           := Insatisfaccion;
    fraXX_CONTRATO.Contrato             := Contrato;
    fraXX_IDFORMULARIO.IdFormulario     := IdFormulario;
    pnlDato31.Visible                   := FechaDesde > DBDateTime;

    if (objAppt.ClassName = ApptObject.ClassName) then
      fraRepite.Codigo := InttoStr(TipoRepeticion);

    if fraXX_CONTRATO.IsSelected then
      fraDomicilioEmpresaAGENDA.UbicacionContrato := UbicacionContrato;

    if fraXX_CONTRATO.IsSelected and (NroEstableci <> 0) and fraEstablecimientoAgenda.Visible then
      fraEstablecimientoAgenda.Codigo   := IntToStr(NroEstableci);

    if fraDomicilioEmpresaAGENDA.RequiereDomicilio then
      fraDomicilioEmpresaAGENDAchkRequiereDomicilioClick(nil);

    fraDomicilioEstablecimientoAGENDA.RequiereDomicilio := ReqUbicacionEstab;

    if fraDomicilioEstablecimientoAGENDA.RequiereDomicilio then
      fraDomicilioEstablecimientoAGENDAchkRequiereDomicilioClick(nil);

    fraTrabajadorAgenda.IdEmpresa       := fraXX_CONTRATO.Value;
    fraTrabajadorAgenda.Value           := Trabajador;
    edFechaAlarma.Date                  := FechaHoraAlarma;
    teHoraAlarma.Time                   := FechaHoraAlarma;

    fraContactoAgenda.LoadContrato(Contrato);
    fraContactoAgenda.ContactoID        := IDContacto;
    edDescripcion.Text                  := Descripcion;

    fraXX_IDEXPEDIENTE.IdSiniestro      := IdExpediente;
    fraXX_IDPRESTADOR.Value             := IdPrestador;
    fraXX_NUMAUTO.Value                 := NumAuto;
    fraXX_DATOFECHA.Date                := DatoFecha;
    fraEntidadVendedorAGENDA.IdEntidad  := IdEntidad;
    fraEntidadVendedorAGENDA.IdVendedor := IdVendedor;

    chkNotificacionCierreProx.Checked := NotificarAlCierreProx;

    if ModoABM = abmAlta then
    begin
      chkNotificacionCierreProx.Caption := 'Deseo recibir una notificación si se genera una tarea en base a mi respuesta cuando ésta sea resuelta';
      chkNotificacionCierreProx.Enabled := True;
    end else
    begin
      if NotificarAlCierreProx and (TApptEvento(ApptObject).IdTareaOrigen > 0) and pnlNotificacionCierreProx.Visible then
      begin
        chkNotificacionCierreProx.Enabled := not Estado = ESTADO_TAREA_AGENDADA;
        if Estado = ESTADO_TAREA_AGENDADA then
          chkNotificacionCierreProx.Caption := UsuarioAlta + ' recibió una notificación cuando se resolvió la tarea generada a partir de esta respuesta'
        else
          chkNotificacionCierreProx.Caption := UsuarioAlta + ' será notificado al resolver la tarea generada a partir de esta respuesta';
      end;
    end;

    fraProspecto.LoadValues(CUIT, RazonSocial, Actividad, Trabajadores, MasaSalarial);
    fraContactoLibreAGENDA.LoadData(Contacto, Telefono, CorreoElectronico);
    if Contacto > '' then
    begin
      SetPanel(CODPANEL_CONTACTOLIBRE, True, 0, auxFrame);
      (Self.FindComponent(COMP_PANEL_DATO + IntToStr(CODPANEL_CONTACTOLIBRE)) as TPanel).Top := pnlDato30.Top;
      AcomodarTamanio;
    end;
    
    if HasDomicilioLoaded then
      fraDomicilioUbicacion.Cargar(Calle, CPostal, Localidad, Numero, Piso, Departamento, Provincia, CPostala);

    if (IdTabla <> 0) and (objAppt.ClassName = ApptObject.ClassName) then
      LockDataObjects;

    RecuperarInsatisfaccion;
    SetExtraConditionRespuesta;
    RecuperarResolucion;

    if (not bSoloDatos) and (Estado = ESTADO_EVENTO_TERMINADO) and (ApptObject.IdTabla > 0) then
    begin
      VCLExtra.LockControls([btnCerrar, btnRechazar, btnAprobar], True);

      btnCerrar.Visible := False;
      btnCancelar.Caption := '&Salir';
      btnCancelar.ModalResult := mrCancel;

      VCLExtra.LockControls([btnGuardar], True);
      for i := 0 to ScrollBox.ControlCount - 1 do
        if ScrollBox.Controls[i] is TWinControl then
          for j := 0 to TWinControl(ScrollBox.Controls[i]).ControlCount - 1 do
            if TWinControl(ScrollBox.Controls[i]).Controls[j] is TWinControl then
              VCLExtra.LockControls([TWinControl(TWinControl(ScrollBox.Controls[i]).Controls[j])], True);
    end else
    begin
      btnCancelar.Caption := '&Cancelar';
      btnCancelar.ModalResult := mrCancel;
      
      VCLExtra.LockControls([btnGuardar], False);
    end;
  except
    on E: Exception do
      InfoHint(btnAceptar, 'Ocurrió un error al recuperar los datos de este evento.');
  end;
end;

procedure TfrmABMAgendaBase.LockAdjuntos(AValue: Boolean = True);
begin
  btnAgregarAdjunto.Enabled := not AValue;
  btnModificarAdjunto.Enabled := not AValue;
  btnAnularAdjunto.Enabled := not AValue;
end;

procedure TfrmABMAgendaBase.LockAnswer(ALockControls: Boolean = True);
begin
  VCLExtra.LockControls([fraRespuesta, edResultado], ALockControls);
end;

procedure TfrmABMAgendaBase.LockDataObjects(ALockControls: Boolean = True);
begin
  VCLExtra.LockControls([fraMotivoIngreso, fraProceso, fraTipo, edFechaEvento, teHoraDesde, teHoraHasta, edFechaAlarma,
                         edFechaFin, cbTodoElDia, fraRepite, fraXX_CONTRATO, fraXX_IDFORMULARIO, fraDomicilioEmpresaAGENDA,
                         fraTrabajadorAgenda, fraEstablecimientoAgenda, teHoraAlarma,
                         fraDomicilioEstablecimientoAGENDA, fraDomicilioUbicacion,
                         fraContactoLibreAGENDA, fraContactoAgenda, edDescripcion, chkInsatisfaccion,
                         fraXX_IDPRESTADOR, fraXX_IDEXPEDIENTE, fraXX_NUMAUTO, fraXX_DATOFECHA,
                         fraEntidadVendedorAGENDA, edFechaVencimiento, edHoraVencimiento,
                         fraProspecto], ALockControls);
  LockAnswer(ALockControls and (ApptObject.Estado = ESTADO_EVENTO_TERMINADO));
end;

procedure TfrmABMAgendaBase.LockObservaciones(AValue: Boolean = True);
begin
  btnAgregarObservacion.Enabled := not AValue;
  btnModificarObservacion.Enabled := not AValue;
  btnEliminarObservacion.Enabled := not AValue;
end;

procedure TfrmABMAgendaBase.Observaciones_ABM_Baja;
begin
  edFechaObservacion.Clear;
  fraUsuarioObservacion.Clear;
  edObservacion.Clear;
  chkNuevoContacto.Checked := False;
  fraNuevoCanal.Clear;
  VCLExtra.LockControls([fraNuevoCanal], True);  
end;

procedure TfrmABMAgendaBase.Observaciones_ABM_Modificacion;
begin
  VCLExtra.LockControls([edObservacion, chkNuevoContacto, fraNuevoCanal], True);
  with sdqConsulta do
  begin
    edFechaObservacion.Date      := FieldByName(FObservaciones_Prefijo + 'fechaalta').AsDateTime;
    fraUsuarioObservacion.Codigo := FieldByName(FObservaciones_Prefijo + 'usualta').AsString;
    edObservacion.Text           := FieldByName(FObservaciones_Prefijo + 'observaciones').AsString;
    chkNuevoContacto.Checked     := not FieldByName(FObservaciones_Prefijo + 'idmotivoingreso').IsNull;
    fraNuevoCanal.Codigo         := FieldByName(FObservaciones_Prefijo + 'idmotivoingreso').AsString;
  end;
end;

procedure TfrmABMAgendaBase.RecuperarInsatisfaccion;
var
  sSQL, sSELECT, sFiltro, sFiltro2, sFiltro3, sFiltro4, sComentarioAnterior: String;
begin
  tsInsatisfacciones.TabVisible := ApptObject.Insatisfaccion;

  if ApptObject.Insatisfaccion then
  begin
    tsInsatisfacciones.ImageIndex := 1;

    clbOpcionesInicio.SQL := 'SELECT ic_descripcion, ic_id ' +
                               'FROM agenda.aic_insatisfaccionconf ' +
                              'WHERE 1 = 1 ' +
                           iif((ApptObject is TApptEvento) and
                               (TApptEvento(ApptObject).IdTareaOrigen > 0) or EsTareaGestionada(TApptEvento(ApptObject).IdTabla),
                                '',
                                'AND ic_tipo = ' + SQLString(iif((Self.ClassName = 'TfrmABMAgendaBaseEvento') and
                                                                 (ApptObject is TApptEvento) and
                                                                 (TApptEvento(ApptObject).IdTareaOrigen > 0), 'R', 'P'), True) + ' ') +
                                'AND NVL(' + SqlDate(TApptBase(ApptObject).FechaAlta) + ', SYSDATE) BETWEEN ic_fechaalta AND NVL(ic_fechabaja, SYSDATE) ' +
                                'AND ic_tipo = ''P'' ' +
                           'ORDER BY ic_tipo, ic_orden';

    clbOpcionesFin.SQL    := 'SELECT ic_descripcion, ic_id ' +
                               'FROM agenda.aic_insatisfaccionconf ' +
                              'WHERE 1 = 1 ' +
                         {
                           iif((ApptObject is TApptEvento) and
                               ((TApptEvento(ApptObject).IdTareaOrigen > 0) or EsTareaGestionada(TApptEvento(ApptObject).IdTabla)),
                                '',
                                'AND ic_tipo = ' + SQLString(iif((Self.ClassName = 'TfrmABMAgendaBaseEvento') and
                                                                 (ApptObject is TApptEvento) and
                                                                 (TApptEvento(ApptObject).IdTareaOrigen > 0), 'R', 'P'), True) + ' ') +
                          }
                                'AND NVL(' + SqlDate(TApptBase(ApptObject).FechaAlta) + ', SYSDATE) BETWEEN ic_fechaalta AND NVL(ic_fechabaja, SYSDATE) ' +
                                'AND ic_tipo = ''R'' ' +                                
                           'ORDER BY ic_tipo, ic_orden';                           

    clbOpcionesInicio.DisableItems;
    clbOpcionesFin.DisableItems;    
    pnlOpcionesInicio.Height := 48 + Max(clbOpcionesInicio.Items.Count, clbOpcionesFin.Items.Count) * (clbOpcionesInicio.ItemHeight + 4);

    sSELECT := 'SELECT id_idinsatisfaccionconf, in_comentario, ic_tipo ' +
                 'FROM agenda.aid_insatisfacciondetalle, agenda.ain_insatisfaccion, agenda.aic_insatisfaccionconf ' +
                'WHERE id_idinsatisfaccion = in_id ' +
                  'AND id_idinsatisfaccionconf = ic_id ';

    if (ApptObject is TApptEvento) then
    begin
      sFiltro  := 'AND in_idagendaevento = ' + SQLValue(ApptObject.IdTabla);
      sFiltro2 := 'AND in_idagendatarea = (SELECT at_id FROM agenda.aat_agendatarea WHERE at_ideventotarea = ' + SQLValue(ApptObject.IdTabla) + ')';
      sFiltro3 := 'AND in_idagendaevento = (SELECT at_idagendaevento FROM agenda.aat_agendatarea WHERE at_ideventotarea = ' + SQLValue(ApptObject.IdTabla) + ')';
      sFiltro4 := 'AND in_idagendaevento = (SELECT at_idagendaevento FROM agenda.aat_agendatarea WHERE at_id = ' + SQLValue(TApptEvento(ApptObject).IdTareaOrigen) + ')';      
    end else
    begin
      if (ModoABM = abmModificacion) then
      begin
        sFiltro  := 'AND in_idagendatarea = ' + SQLValue(ApptObject.IdTabla);
        sFiltro2 := 'AND in_idagendaevento = ' + SQLValue(TapptTarea(Apptobject).IdAgendaEvento);
        sFiltro3 := 'AND in_idagendaevento = ' + SQLValue(TapptTarea(Apptobject).IdEventoOriginante);
        sFiltro4 := 'AND in_idagendaevento = (SELECT at_ideventotarea FROM agenda.aat_agendatarea WHERE at_id = ' + SQLValue(TapptTarea(ApptObject).IdTabla) + ')';
      end else
        sFiltro := 'AND in_idagendaevento = ' + SQLValue(TapptTarea(Apptobject).IdAgendaEvento);
    end;

    sSQL := sSELECT + sFiltro;

    if not IsEmptyString(sFiltro2) then
      sSQL := sSQL + ' UNION ' + sSELECT + sFiltro2;

    if not IsEmptyString(sFiltro3) then
      sSQL := sSQL + ' UNION ' + sSELECT + sFiltro3;

    if not IsEmptyString(sFiltro4) then
      sSQL := sSQL + ' UNION ' + sSELECT + sFiltro4;

    with ApptObject, GetQuery(sSQL) do
    try
      while not Eof do
      begin
        if sComentarioAnterior <> FieldByName('in_comentario').AsString then
          if FieldByName('ic_tipo').AsString = 'P' then
            edComentarioInsatisfaccionInicio.Lines.Add(FieldByName('in_comentario').AsString)
          else
            edComentarioInsatisfaccionFin.Lines.Add(FieldByName('in_comentario').AsString);

        clbOpcionesInicio.Check(Fields[0].AsString);
        clbOpcionesFin.Check(Fields[0].AsString);

        sComentarioAnterior := FieldByName('in_comentario').AsString;
        Next;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TfrmABMAgendaBase.SaveComponentsToAppt(objAppt: TApptBase);
begin
  if Assigned(ApptObject) then
  with ApptObject do
  begin
  //  SetStartEnd(edFechaEvento.Date, teHoraDesde.Time, edFechaFin.Date, teHoraHasta.Time);
    SetRangoFechas(edFechaEvento.Date + GetDecimales(teHoraDesde.Time), edFechaFin.Date + GetDecimales(teHoraHasta.Time)); 
  //  FAppt.AlarmEnabled 				 := chkAlarmaActivada.Checked;
  //  FAppt.AlarmAdvance 				 := ceMinutosAviso.Value;
  //  FAppt.DescripcionResultado := mDescripcionResultadoTarea.Text;
    TipoEvento      := StrToInt(fraTipo.Codigo);
    MotivoIngreso   := StrToInt(fraMotivoIngreso.Codigo);    
    TodoElDia       := cbTodoElDia.Checked;
    Insatisfaccion  := chkInsatisfaccion.Checked;

    TipoRepeticion  := StrToInt(fraRepite.Codigo);
    Contrato        := fraXX_CONTRATO.Contrato;
    IdFormulario    := fraXX_IDFORMULARIO.IdFormulario;
    IdUsuario       := StrToIntDef(fraUsuarioAsignado.ID, 0);

    if fraDomicilioEmpresaAGENDA.RequiereDomicilio then
    begin
      if fraDomicilioEmpresaAGENDA.Legal then
        UbicacionContrato := 'L'
      else if fraDomicilioEmpresaAGENDA.Postal then
        UbicacionContrato := 'P';
    end;

    Trabajador        := Max(fraTrabajadorAgenda.Value, fraXX_IDEXPEDIENTE.Value);
    NroEstableci      := fraEstablecimientoAgenda.NroEstablecimiento;
    ReqUbicacionEstab := fraDomicilioEstablecimientoAGENDA.RequiereDomicilio;

    if fraDomicilioUbicacion.IsSelected then
    begin
      Calle           := fraDomicilioUbicacion.Calle;
      Numero          := fraDomicilioUbicacion.Numero;
      Piso            := fraDomicilioUbicacion.Piso;
      Departamento    := fraDomicilioUbicacion.Departamento;
      CPostal         := fraDomicilioUbicacion.CodigoPostal;
      CPostala        := fraDomicilioUbicacion.CPA;
      Localidad       := fraDomicilioUbicacion.Localidad;
      Provincia       := IntToStr(fraDomicilioUbicacion.Prov);
    end;

    Contacto          := fraContactoLibreAGENDA.Nombre;
    Telefono          := fraContactoLibreAGENDA.Telefono;
    CorreoElectronico := fraContactoLibreAGENDA.CorreoElectronico;
    FechaHoraAlarma   := edFechaAlarma.Date+ Frac(teHoraAlarma.Time);
    IDContacto        := fraContactoAgenda.ContactoID;
    Descripcion       := edDescripcion.Text;
    IdPrestador       := fraXX_IDPRESTADOR.Value;
    IdExpediente      := fraXX_IDEXPEDIENTE.IdSiniestro;
    NumAuto           := fraXX_NUMAUTO.Value;
    DatoFecha         := fraXX_DATOFECHA.Date;
    IdEntidad         := fraEntidadVendedorAGENDA.IdEntidad;
    IdVendedor        := fraEntidadVendedorAGENDA.IdVendedor;

    CUIT              := fraProspecto.CUIT;
    RazonSocial       := fraProspecto.RazonSocial;
    Actividad         := fraProspecto.Actividad;
    Trabajadores      := fraProspecto.Trabajadores;
    MasaSalarial      := fraProspecto.MasaSalarial;

    IdRespuesta          := StrToIntDef(fraRespuesta.ID, 0);
    ObservacionRespuesta := edResultado.Text;
    NotificarAlCierreProx := chkNotificacionCierreProx.Checked;

    if Insatisfaccion then
    begin
      InsatisfaccionDetalle.CommaText := clbOpciones.CheckedValues.CommaText;
      InsatisfaccionComentario := edComentarioInsatisfaccion.Lines.Text;
    end else
    begin
      InsatisfaccionDetalle.Clear;
      InsatisfaccionComentario := '';
    end;
  end;
end;

procedure TfrmABMAgendaBase.SetExtraCondition;
var
  sAux: String;
begin
  try
    if Self.ClassName = 'TfrmABMAgendaBaseEvento' then
    begin
      sAux := '0';
    end else
    begin
      if ModoABM = abmAlta then
        sAux := 'te_idpadre'
      else
        sAux := IntToStr(TApptTarea(ApptObject).IdTabla);
    end;

    fraMotivoIngreso.Propiedades.ExtraCondition := iif(not AreInNumber(Sesion.IdSectorIntranet, [SECTOR_RECEPCION, SECTOR_GESTION_Y_SERVICIOS, SECTOR_DESARROLLO_DE_SISTEMAS]) and (ModoABM = abmAlta), ' AND mi_id <> 13 ', '') +
                                                   iif((Sesion.Sector = 'CALLCENT') and (ModoABM = abmAlta), ' AND mi_id <> 11 ', '') +
                                                   Format(FCondicionEvento, [SqlString(iif(ModoABM = abmAlta, 'S', 'N'), True),
                                                                             String(iif(fraProceso.IsSelected,
                                                                                        StrToIntDef(fraProceso.ID, 0),
                                                                                        'te_idproceso')),
                                                                             sAux]
                                                   ) + IntToStr(FIDMotivoIngreso) + '))';
    fraProceso.Propiedades.ExtraCondition := Format(FCondicionProceso, [String(iif(fraMotivoIngreso.IsSelected,
                                                                                   StrToIntDef(fraMotivoIngreso.ID, 0),
                                                                                   'ti_idmotivoingreso'))]
                                                   );
  except
  end;
end;

procedure TfrmABMAgendaBase.SetModoABM(const Value: TModoABM);
var
  bShowBajas: Boolean;
begin
  FModoABM := Value;
  bShowBajas := ModoABM <> abmAlta;
  fraMotivoIngreso.Propiedades.ShowBajas := bShowBajas;
  fraTipo.ShowBajas := bShowBajas;
  fraProceso.ShowBajas := bShowBajas;
  fraXX_IDEXPEDIENTE.ShowBajas := bShowBajas;
end;

procedure TfrmABMAgendaBase.SetModoCallCenter(Value: Boolean);
begin
  inherited;
  FModoCallCenter := Value;
  if Value then
  begin
    lbFechaHasta.Visible := False;
    teHoraHasta.Visible := False;
    edFechaFin.Visible := False;
    cbTodoElDia.Visible := False;
    lbSeRepite.Visible := False;
    fraRepite.Visible := False;
    VCLExtra.LockControls([edFechaEvento, teHoraDesde], True);
  end;
end;

function TfrmABMAgendaBase.SetPanel(nNroPanel: Integer; bActivar: Boolean; nUltimaAltura: Integer; var AFrameModuloAgenda: TFrame): Integer;
var
  objPanel: TCustomPanel;
  i: Integer;
begin
  if Assigned(Self.FindComponent(COMP_PANEL_DATO + IntToStr(nNroPanel))) then
  begin
    objPanel := TCustomPanel(Self.FindComponent(COMP_PANEL_DATO + IntToStr(nNroPanel)));
    if Assigned(objPanel) then
    begin
      if (objPanel.Visible <> bActivar) then
      begin
        objPanel.Visible := bActivar;

        { Esto sirve para debug...
        AcomodarTamanio;
        Invalidate;
        ShowMessage(IntToStr(nUltimaAltura));
        Invalidate;
        }

        if bActivar then
        begin
          nUltimaAltura := objPanel.Top + objPanel.Height + 1; 
          if nUltimaAltura > 0 then
            objPanel.Top := nUltimaAltura;

          Result := nUltimaAltura;
        end else
          Result := nUltimaAltura;
      end else
        Result := nUltimaAltura;

      AFrameModuloAgenda := nil;
               
      for i := 0 to objPanel.ControlCount - 1 do
        if Supports(objPanel.Controls[i].ClassType, IModuloAgenda) then
          AFrameModuloAgenda := TFrame(objPanel.Controls[i]);
    end else
      Result := nUltimaAltura;
  end else
    Result := nUltimaAltura;
    
  Application.ProcessMessages;
end;

procedure TfrmABMAgendaBase.AcomodarTamanio;
var
  vTamanio, nAltura: Integer;
  objPanel: TCustomPanel;
  i: Byte;
const
  ALTURA_AUXILIAR = 20;
  ALTURA_MOVIMIENTO = 32;
begin
  Invalidate;
  Application.ProcessMessages;
  vTamanio := 0;

  for i := 0 to MAX_CANT_MODULOS do
  begin
    if Assigned(Self.FindComponent(COMP_PANEL_DATO + IntToStr(i))) then
    begin
      objPanel := TCustomPanel(Self.FindComponent(COMP_PANEL_DATO + IntToStr(i)));

      if Assigned(objPanel) and objPanel.Visible then
        vTamanio := vTamanio + objPanel.Height;
    end;
  end;

  vTamanio := vTamanio + AdvToolBarPager.Height;

  if vTamanio > (Screen.Height - pnStatus.Height - ALTURA_AUXILIAR) then
    vTamanio := Screen.Height - 100;

  Constraints.MinHeight := 0;
  Constraints.MaxHeight := Max(vTamanio + pnStatus.Height + ALTURA_AUXILIAR, Constraints.MaxHeight);

  nAltura := vTamanio + {pnStatus.Height +} ALTURA_AUXILIAR;
  Invalidate;
  Application.ProcessMessages;

  if Height < nAltura then
    while Height < nAltura do
    begin
      Height := Height + ALTURA_MOVIMIENTO;
      Top := Round(Screen.Height/2 - Height/2);
      if Top <= 0 then
        Break;
    end
  else
    while Height > nAltura do
    begin
      Height := Height - ALTURA_MOVIMIENTO;
      Top := Round(Screen.Height/2 - Height/2);
      if Top <= 0 then
        Break;
    end;

  Constraints.MinHeight := vTamanio + pnStatus.Height + ALTURA_AUXILIAR;
  Application.ProcessMessages;
  
  Left := Round(Screen.Width/2 - Width/2);
  Width := Width + 2;
  Width := Width - 1;
  Height := Height + 1;
  Height := Height - 1;
end;

procedure TfrmABMAgendaBase.btnAgendaTelefonicaClick(Sender: TObject);
begin
  Abrir(TfrmAgendaTelefonica, frmAgendaTelefonica, tmvModal, nil);
end;

procedure TfrmABMAgendaBase.ClearAppt;
begin
  FreeAndNil(FApptObject);
end;

procedure TfrmABMAgendaBase.InvisibilizarPaneles;
var
  i, iAux: Integer;
  objPanel: TCustomPanel;
  auxFrame: TFrame;
begin
  iAux := pnlDato25.Height + pnlDato26.Height + pnlDato28.Height + pnlDato29.Height;
  for i := MAX_PANEL_DE_DATOS downto 0 do
  begin
    if Assigned(Self.FindComponent(COMP_PANEL_DATO + IntToStr(i))) then
    begin
      objPanel := TCustomPanel(Self.FindComponent(COMP_PANEL_DATO + IntToStr(i)));

      if Assigned(objPanel) and objPanel.Visible then
        objPanel.Visible := False;

      iAux := SetPanel(i, False, iAux, auxFrame);
      if Assigned(auxFrame) and Supports(auxFrame, IModuloAgenda) then
        (auxFrame as IModuloAgenda).IsRequired := False;
    end;
  end;
end;

procedure TfrmABMAgendaBase.LimpiarCamposEventos;
begin
  fraMotivoIngreso.Clear;
  fraTipo.Clear;
  fraTipo.Propiedades.ExtraCondition := '';
  edFechaEvento.Clear;
  teHoraDesde.DateTime := 0;
  teHoraHasta.DateTime := 0;
  edFechaFin.Clear;
  fraRepite.Clear;
  LimpiarCambioEvento;
end;

procedure TfrmABMAgendaBase.LoadFromQuery(objQuery: TSDQuery; bModoCallCenter: Boolean = False; bAutorizacion: Boolean = False);
begin
  pnStatus.Visible := not bAutorizacion;
  pnStatusAprobacion.Visible := bAutorizacion;
  ModoCallCenter := bModoCallCenter;
  AssignRecordToAppt(ApptObject, objQuery);
  LoadFromAppt(ApptObject);
    
  if bAutorizacion then
    InternalSetModoAutorizacion;
end;

procedure TfrmABMAgendaBase.PageControlEventosChange(Sender: TObject);
begin
  inherited;
  if PageControlEventos.ActivePage = tsRespuesta then
  begin
    if fraRespuesta.TieneDatosSeleccionables and fraRespuesta.IsEmpty and (not fraRespuesta.Locked) then
      InfoHint(fraRespuesta.cmbDescripcion, 'Tenga en cuenta que puede seleccionar una respuesta predeterminada en esta ocasión.', False, 'Sugerencia', blnInfo, 2);
      
    with objRichEditAux do
    begin
      Update;
      Application.ProcessMessages;
      pnlInfoExtraRespuesta.Height := 8 + (24 * Max(RE_GetLastVisibleLine(objRichEditAux), 1));
      pnlInfoExtraRespuesta.Top := pnlResultado.Height -1;
      objRichEditAux.SendToBack;
    end;
  end;
end;

function TfrmABMAgendaBase.Save: Boolean;
begin
  SaveComponentsToAppt(ApptObject);
  Result := True;
end;

function TfrmABMAgendaBase.Validar(PermiteCerrar: Boolean = True; GeneraTarea: Boolean = False): Boolean;
var
  i, j: Integer;
begin
  Verificar(fraMotivoIngreso.IsEmpty, fraMotivoIngreso.cmbDescripcion, 'Debe seleccionar el motivo.');
  Verificar(fraTipo.IsEmpty, fraTipo.cmbDescripcion, 'Debe seleccionar ' + iif(Self.ClassName = 'TfrmABMAgendaBaseEvento', 'el evento', 'la tarea') + '.');
  Verificar(fraRepite.IsEmpty, fraRepite.cmbDescripcion, 'Debe seleccionar el tipo de repetición.');
  Verificar((ModoABM = abmAlta) and (fraRepite.Codigo <> '1') and (edFechaEvento.Date = edFechaFin.Date), edFechaFin, 'Si indica algún tipo de repetición, debe especificar la fecha de finalización del evento y ésta debe ser distinta de la fecha de inicio del mismo.');

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i].InheritsFrom(TPanel) then
      for j := 0 to TPanel(Components[i]).ControlCount - 1 do
      begin
        if Supports(TPanel(Components[i]).Controls[j].ClassType, IModuloAgenda) then
          if (TPanel(Components[i]).Controls[j] as IModuloAgenda).IsRequired then
            (TPanel(Components[i]).Controls[j] as IModuloAgenda).Validate;
      end;
  end;

  Verificar((not IsEmptyString(edResultado.Text)) and (Length(edResultado.Text) > edResultado.MaxLength), edResultado, 'La descripción de la resolución no debe superar los ' + IntToStr(edResultado.MaxLength) + ' caracteres.'); 

  if (ApptObject is TApptEvento) and (TApptEvento(ApptObject).IdTareaOrigen > 0) then
    if (ModoABM = abmModificacion) or not EventoCalendarizado then
      AnalizoInsatisfaccion(nil);

  Result := True;
end;

function TfrmABMAgendaBase.EventoCalendarizado: Boolean;
var
  dHoy: TDateTime; 
begin
  dHoy := DBDate;
  Result := (edFechaEvento.Date > dHoy) or ((edFechaEvento.Date = dHoy) and
                                            (GetDecimales(teHoraDesde.Time) > GetDecimales(DBDateTime)));
end;

initialization
  RegisterClasses([TfraEstablecimiento, TfraEstablecimientoAGENDA]);

end.
