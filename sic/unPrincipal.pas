unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, AdvOfficeHint, JvBackgrounds, JvTrayIcon,
  JvComponent, JvCaptionButton, artSeguridad, Login, artDbLogin, Menus,
  ImgList, XPMenu, Placemnt, ComCtrls, ShellAPI, StdCtrls,
  AdvToolBar, AdvToolBarStylers,  AdvGlowButton, ActnList,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraUsuarioConSectorIntranet,
  FormPanel, AdvOfficeStatusBar, AdvOfficeStatusBarStylers, JvAppEvent, JvMenus,
  DB, SDEngine;

type
  TfrmPrincipal = class(TfrmCustomForm)
    tiIconoBarraEstado: TJvTrayIcon;
    DBLogin: TDBLogin;
    Seguridad: TSeguridad;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    JvAppEvents: TJvAppEvents;
    ActionList: TActionList;
    acCargaConsulta: TAction;
    acAgenda: TAction;
    acEstadisticas: TAction;
    PopupMenu: TPopupMenu;
    mnuAgendadeEventosyTareas: TMenuItem;
    mnuCargayConsulta: TMenuItem;
    mnuEstadisticas: TMenuItem;
    acSalir: TAction;
    mnuSalir: TMenuItem;
    N1: TMenuItem;
    acManEventosTareas: TAction;
    acManDestinatarios: TAction;
    acMotivosIngreso: TAction;
    AdvToolBarPager: TAdvToolBarPager;
    tsGestion: TAdvPage;
    btnCargaConsulta: TAdvGlowButton;
    btnAgenda: TAdvGlowButton;
    btnEstadisticas: TAdvGlowButton;
    tsMantenimiento: TAdvPage;
    btnManEventosTareas: TAdvGlowButton;
    btnManDestinatarios: TAdvGlowButton;
    btnManMotivoIngreso: TAdvGlowButton;
    tsOtros: TAdvPage;
    btnCambioUsuario: TAdvGlowButton;
    acCambioUsuario: TAction;
    fpCambioUsuario: TFormPanel;
    btnCancelar: TButton;
    fraUsuarioConSectorIntranet: TfraUsuarioConSectorIntranet;
    btnAceptar: TButton;
    sbEstado: TAdvOfficeStatusBar;
    AdvOfficeStatusBarOfficeStyler: TAdvOfficeStatusBarOfficeStyler;
    imgPopUp: TImageList;
    btnArbolSectores: TAdvGlowButton;
    acManArbolSectores: TAction;
    acManRespuestas: TAction;
    btnAyuda: TAdvGlowButton;
    btnNovedades: TAdvGlowButton;
    btnRespuestas: TAdvGlowButton;
    btnUsuariosPorSector: TAdvGlowButton;
    acManUsuariosPorSector: TAction;
    sdqMensaje: TSDQuery;
    btnPublicaciones: TAdvGlowButton;
    acManPublicaciones: TAction;
    tsCampanas: TAdvPage;
    btnMantenimientoDeCuentas: TAdvGlowButton;
    acMantenimientoDeCuentas: TAction;
    btnAgendaTelefonica: TAdvGlowButton;
    btnManExcepciones: TAdvGlowButton;
    acManExcepciones: TAction;
    btnMailsEnviados: TAdvGlowButton;
    btnCuboStats: TAdvGlowButton;
    procedure acAgendaExecute(Sender: TObject);
    procedure acCambioUsuarioExecute(Sender: TObject);
    procedure acCargaConsultaExecute(Sender: TObject);
    procedure acEstadisticasExecute(Sender: TObject);
    procedure acManArbolSectoresExecute(Sender: TObject);
    procedure acManDestinatariosExecute(Sender: TObject);
    procedure acManEventosTareasExecute(Sender: TObject);
    procedure acManExcepcionesExecute(Sender: TObject);
    procedure acManPublicacionesExecute(Sender: TObject);
    procedure acManRespuestasExecute(Sender: TObject);
    procedure acMantenimientoDeCuentasExecute(Sender: TObject);
    procedure acManUsuariosPorSectorExecute(Sender: TObject);
    procedure acMotivosIngresoExecute(Sender: TObject);
    procedure acSalirExecute(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnAgendaTelefonicaClick(Sender: TObject);
    procedure btnAyudaClick(Sender: TObject);
    procedure btnNovedadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvAppEventsException(Sender: TObject; E: Exception);
    procedure JvAppEventsMinimize(Sender: TObject);
    procedure btnMailsEnviadosClick(Sender: TObject);
    procedure btnCuboStatsClick(Sender: TObject);
  public
    procedure AfterConstruction; override;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  SDOra, unAgendaCargaConsulta, unAgendaBase, General, unEstadisticasAGENDA,
  unManAMI_MOTIVOINGRESO, unManATD_TIPODESTINATARIO, unManATE_TIPOEVENTO,
  unSesion, unDmPrincipal, unSeleccionMultiple, unManAGENDA,
  unManARS_RESPUESTA, unNovedades, unWebBrowser, unABMUsuariosPorSector,
  Strfuncs, unAlarmas, unArt, CustomDlgs, unManATS_TIPOEVENTOSECTOR,
  unManAMC_MANTENIMIENTOCUENTA, unAgendaTelefonica, unSistemas,
  unManAEX_EXCEPCIONUSUARIOTAREA, unElementosEnviados, unCuboSIC;

{$R *.dfm}


procedure TfrmPrincipal.acAgendaExecute(Sender: TObject);
begin
  Abrir(TfrmAgendaBase, frmAgendaBase, tmvModal, nil);
end;

procedure TfrmPrincipal.acCambioUsuarioExecute(Sender: TObject);
begin
  if fpCambioUsuario.ShowModal = mrOk then
  begin
    Sesion.CambiarUsuario(fraUsuarioConSectorIntranet.fraUsuarioSeleccionado.Codigo);
    Seguridad.Ejecutar;    
    Caption := Application.Title + ' - ' + Sesion.Usuario;
    Seguridad.Ejecutar;    
    sbEstado.Panels[0].Text := Sesion.Usuario;
    FormShow(nil);

    if False {Esto ya no puede ocurrir, las ventanas son modales} and Assigned(frmAgendaBase) then
    with frmAgendaBase do
    try
      if Assigned(fraSeleccionUsuariosEventos) then
      begin
        fraSeleccionUsuariosEventos.UsuariosAsignados.Clear;
        fraSeleccionUsuariosEventos.UsuariosAsignados.AddObject(Sesion.Usuario, TUserData.Create(Sesion.ID, Sesion.UserMail));
        lblUsuariosEventosAsignados.Caption := Sesion.Usuario;
      end;

      if Assigned(fraSeleccionUsuariosTareas) then
      begin
        fraSeleccionUsuariosTareas.UsuariosAsignados.Clear;
        fraSeleccionUsuariosTareas.UsuariosAsignados.AddObject(Sesion.Usuario, TUserData.Create(Sesion.ID, Sesion.UserMail));
        lblUsuariosTareasAsignados.Caption := Sesion.Usuario;
      end;

      sdqEventos.Close;
      Actualizar;
      RefreshTreeView;
    except
    end;
  end;
end;

procedure TfrmPrincipal.acCargaConsultaExecute(Sender: TObject);
begin
  Abrir(TfrmAgendaCargaConsulta, frmAgendaCargaConsulta, tmvModal, nil);
end;

procedure TfrmPrincipal.acEstadisticasExecute(Sender: TObject);
begin
  Abrir(TfrmEstadisticasAGENDA, frmEstadisticasAGENDA, tmvModal, nil);
end;

procedure TfrmPrincipal.acManArbolSectoresExecute(Sender: TObject);
begin
  Abrir(TfrmManAGENDA, frmManAGENDA, tmvModal, nil);
end;

procedure TfrmPrincipal.acManDestinatariosExecute(Sender: TObject);
begin
  Abrir(TfrmManATD_TIPODESTINATARIO, frmManATD_TIPODESTINATARIO, tmvModal, nil);
end;

procedure TfrmPrincipal.acManEventosTareasExecute(Sender: TObject);
begin
  Abrir(TfrmManATE_TIPOEVENTO, frmManATE_TIPOEVENTO, tmvModal, nil);
end;

procedure TfrmPrincipal.acManExcepcionesExecute(Sender: TObject);
begin
  Abrir(TfrmManAEX_EXCEPCIONUSUARIOTAREA, frmManAEX_EXCEPCIONUSUARIOTAREA, tmvModal, nil);
end;

procedure TfrmPrincipal.acManPublicacionesExecute(Sender: TObject);
begin
  Abrir(TfrmManATS_TIPOEVENTOSECTOR, frmManATS_TIPOEVENTOSECTOR, tmvModal, nil);
end;

procedure TfrmPrincipal.acManRespuestasExecute(Sender: TObject);
begin
  Abrir(TfrmManARS_RESPUESTA, frmManARS_RESPUESTA, tmvModal, nil);
end;

procedure TfrmPrincipal.acMantenimientoDeCuentasExecute(Sender: TObject);
begin
  Abrir(TfrmAMC_MANTENIMIENTOCUENTA, frmAMC_MANTENIMIENTOCUENTA, tmvModal, nil);
end;

procedure TfrmPrincipal.acManUsuariosPorSectorExecute(Sender: TObject);
begin
  Abrir(TfrmABMUsuariosPorSector, frmABMUsuariosPorSector, tmvModal, nil);
end;

procedure TfrmPrincipal.acMotivosIngresoExecute(Sender: TObject);
begin
  Abrir(TfrmManAMI_MOTIVOINGRESO, frmManAMI_MOTIVOINGRESO, tmvModal, nil);
end;

procedure TfrmPrincipal.acSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.AfterConstruction;
begin
  inherited;
  FormShow(nil);
end;

procedure TfrmPrincipal.btnAceptarClick(Sender: TObject);
begin
  Verificar(fraUsuarioConSectorIntranet.fraUsuarioSeleccionado.IsEmpty, fraUsuarioConSectorIntranet.fraUsuarioSeleccionado.edCodigo, 'Debe seleccionar un usuario.');
  fpCambioUsuario.ModalResult := mrOk; 
end;

procedure TfrmPrincipal.btnAgendaTelefonicaClick(Sender: TObject);
begin
  Abrir(TfrmAgendaTelefonica, frmAgendaTelefonica, tmvModal, nil);
end;

procedure TfrmPrincipal.btnAyudaClick(Sender: TObject);
begin
  with TfrmWebBrowser.Create(Self) do
  try
    LoadUrl('http://www.provinciart.com.ar/sic/');
  except
    Free;
  end;
end;

procedure TfrmPrincipal.btnNovedadesClick(Sender: TObject);
begin
  MostrarNovedades(True);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  HideTitlebar;
  AdvToolBarPager.ActivePageIndex := 0;
  tsMantenimiento.TabVisible := AreIn(Sesion.Sector, ['COMPUTOS', 'GERGEN', 'CALIDAD', 'CONTGEST']) or Seguridad.Claves.IsActive('Administrador');
  tsOtros.TabVisible := tsMantenimiento.TabVisible;
  tsCampanas.TabVisible := tsMantenimiento.TabVisible;
  acCambioUsuario.Enabled := AreIn(IntToStr(Sesion.IdSectorIntranet), [IntToStr(SECTOR_DESARROLLO), IntToStr(SECTOR_SEGINFO)]);
  sbEstado.Panels[0].Text := Sesion.Usuario;
  //btnMailsEnviados.Visible := AreIn(Sesion.Sector, ['COMPUTOS', 'CALIDAD']);
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
  AdvToolBarPager.Height := Height - GetSystemMetrics(SM_CYFRAME)*2 - sbEstado.Height;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  sMensaje: String;
  btGlobo: JvTrayIcon.TBalloonType;
begin
  inherited;
  try
    OpenQueryEx(sdqMensaje, [Sesion.UserID]);
    try
      sMensaje := sdqMensaje.FieldByName('mensaje').AsString;

      case sdqMensaje.FieldByName('estado').AsInteger of
        0: btGlobo := JvTrayIcon.TBalloonType(btNone);
        1: btGlobo := JvTrayIcon.TBalloonType(btError);
        2: btGlobo := JvTrayIcon.TBalloonType(btInfo);
        3: btGlobo := JvTrayIcon.TBalloonType(btWarning);
        else
           btGlobo := JvTrayIcon.TBalloonType(btNone);        
      end;
    finally
      sdqMensaje.Close;
    end;

    if not IsEmptyString(sMensaje) then
      tiIconoBarraEstado.BalloonHint('Información sobre el SIC', sMensaje, btGlobo, 10000);
  except
  end;
end;

procedure TfrmPrincipal.JvAppEventsException(Sender: TObject; E: Exception);
begin
  inherited;
  if E.InheritsFrom(EAccessViolation) then
    InfoHint(sbEstado, 'Ocurrió un error grave en el sistema, puede que tenga que salir del mismo para poder volver a usarlo.', True, 'Error grave', blnError)
  else if E.InheritsFrom(EDatabaseError) then
  begin
    if E.InheritsFrom(ESDOraError) and (ESDOraError(E).ErrorCode = 4068) then
      InfoHint(sbEstado, 'Se está realizando mantenimiento en la base de datos, intente la operación nuevamente por favor.', True, 'Mantenimiento', blnWarning)
    else if E.InheritsFrom(ESDOraError) and (ESDOraError(E).ErrorCode = 1012) then
      InfoHint(sbEstado, 'Su sesión de la base de datos ha sido desconectada a propósito por algún motivo, por favor cierre el sistema antes de volver a usarlo.', True, 'Cierre preventivo', blnError)
    else
      InfoHint(sbEstado, 'Ocurrió un error al ejecutar la consulta, verifique la información ingresada.', False, 'Error proveniente de la base de datos', blnWarning)
  end else
    InfoHint(sbEstado, E.Message);
end;

procedure TfrmPrincipal.JvAppEventsMinimize(Sender: TObject);
begin
  tiIconoBarraEstado.BalloonHint('Sistema Integrado de Comunicaciones',
                                 'El sistema seguirá ejecutándose en segundo plano para notificarle sobre los sucesos que ocurran.',
                                  btInfo, 5000, True);
  tiIconoBarraEstado.HideApplication;
end;

procedure TfrmPrincipal.btnMailsEnviadosClick(Sender: TObject);
begin
  Abrir(TfrmElementosEnviados, frmElementosEnviados, tmvModal, nil);
end;

procedure TfrmPrincipal.btnCuboStatsClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmCuboSIC, frmCuboSIC, tmvModal, nil);
end;

end.
