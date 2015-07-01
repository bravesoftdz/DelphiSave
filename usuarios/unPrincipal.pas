unit unPrincipal;

interface
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, SHDocVw,
  Menus, ToolWin, ComCtrls, StdCtrls, ImgList, artSeguridad, artDbLogin, General, shellapi,
  DisplaySet, Placemnt, Login, JvTrayIcon, JvComponent, JvCaptionButton, JvBackgrounds,
  XPMenu, unCustomPrincipal, AdvOfficeHint, ExtCtrls, JvAppEvent, ComObj, ActiveX, Variants,
  JvWavePlayer, DB, SDEngine, JvExExtCtrls, JvImage, JvSpecialImage,
  JvExControls, JvImageTransform, JvAnimatedImage, JvGIFCtrl, FormPanel,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraUsuarioConSectorIntranet, AdvGlassButton, jpeg, pngextra, JvPanel,
  unFraDomicilio, unFraDomicilioGIS, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, JvExtComponent, JvComponentBase,
  RxPlacemnt;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    ImgColor2: TImageList;
    imgBN2: TImageList;
    mnuManUsuarios: TMenuItem;
    ImgPermisos: TImageList;
    mnuMantenimiento: TMenuItem;
    mnuManPerfiles: TMenuItem;
    mnuManSectores: TMenuItem;
    mnuDireccionesCorreo: TMenuItem;
    mnuRelacionUsuarioSector: TMenuItem;
    mnuUsuariosExternos: TMenuItem;
    mnuPerfilesdeDigitalizacion: TMenuItem;
    mnuManFFU_FORMULARIOUSUARIO: TMenuItem;
    mnuFaxFormularios: TMenuItem;
    N3: TMenuItem;
    ilByN2: TImageList;
    ilColor2: TImageList;
    mnuPerfilesDeFax: TMenuItem;                                
    mnuMantenimientoNovedades: TMenuItem;
    mnuTickets: TMenuItem;
    mnuSectoresdelaIntranet: TMenuItem;
    N5: TMenuItem;
    N8: TMenuItem;
    mnuMotivosSolicitud: TMenuItem;
    mnuGestion: TMenuItem;
    N9: TMenuItem;
    mnuBanner: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    Pedidoswebvaalertas1: TMenuItem;
    mnuRotulosReporte: TMenuItem;
    mnuReportesWeb: TMenuItem;
    mnuConsultaRotulo: TMenuItem;
    TimerNoticias: TTimer;
    JvAppEvents: TJvAppEvents;
    mnuAlertas: TMenuItem;
    N13: TMenuItem;
    mnuMantenimientoAlertas: TMenuItem;
    mnuSubAlertas: TMenuItem;
    mnuAcciones: TMenuItem;
    mnuMonitordeAlertas: TMenuItem;
    mnuEquipos: TMenuItem;
    TimerActualizacion: TTimer;
    N14: TMenuItem;
    mnuModulodeEstadisticas: TMenuItem;
    mnuImpoExpo: TMenuItem;
    mnuInvocarunImpoExpo: TMenuItem;
    mnuVisualizarArchivos: TMenuItem;
    Procesos1: TMenuItem;
    N15: TMenuItem;
    mnuMantenimientoImpoExpo: TMenuItem;
    mnuProcesosImpoExpo: TMenuItem;
    N16: TMenuItem;
    mnuArchivosdeImportacionExportacion: TMenuItem;
    mnuManConsultas: TMenuItem;
    mnuProcesosdeOracle: TMenuItem;
    N17: TMenuItem;
    mnuMigraciones: TMenuItem;
    mnuBuquedaEnJEDI: TMenuItem;
    mnuDesarrollo: TMenuItem;
    N18: TMenuItem;
    mnuFaxGeneral: TMenuItem;
    N19: TMenuItem;
    mnuManAgenda: TMenuItem;
    mnuConfiguracion: TMenuItem;
    mnuABMEventos: TMenuItem;
    mnuABMMotivosyTareas: TMenuItem;
    mnuABMRespuestas: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    mnuAgendaEventos: TMenuItem;
    mnuAgendaCargaConsulta: TMenuItem;
    mnuTransaccionesWeb: TMenuItem;
    mnuAccionesWEB: TMenuItem;
    mnuParametrosWEB: TMenuItem;
    mnuUsuariosAD: TMenuItem;
    mnuTestUIF: TMenuItem;
    mnuAgendaAutorizacion: TMenuItem;
    TimerJodasAudio: TTimer;
    mnuImpresionMasiva: TMenuItem;
    pnlStatusImpresion: TPanel;
    TimerImagen: TTimer;
    TimerInstantaneo: TTimer;
    N24: TMenuItem;
    mnuCambioUsuario: TMenuItem;
    fpCambioUsuario: TFormPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    fraUsuarioConSectorIntranet: TfraUsuarioConSectorIntranet;
    mnuTipoDestinatarios: TMenuItem;
    N25: TMenuItem;
    mnuSistemaIntegradoDeComunicaciones: TMenuItem;
    N26: TMenuItem;
    mnuEstadisticas: TMenuItem;
    btnSIC: TAdvGlassButton;
    pnlEstadisticas: TJvPanel;
    btnEstadisticas: TPNGButton;
    Label1: TLabel;
    Label2: TLabel;
    N27: TMenuItem;
    mnuCargaMasivaEventos: TMenuItem;
    mnuSolicitudesCambioEjec: TMenuItem;
    mnuDocumentador: TMenuItem;
    mnuDocCompiladorObjetos: TMenuItem;
    mnuDocTablas: TMenuItem;
    mnuDocObjetos: TMenuItem;
    mnuDocDocumentadores: TMenuItem;
    mnuDocEditores: TMenuItem;
    mnuDocExploradordeDatos: TMenuItem;
    mnuDocConsultas: TMenuItem;
    ControldedomiciliosGIS1: TMenuItem;
    Prestadores1: TMenuItem;
    fpDomicilio: TFormPanel;
    fraDomicilioGIS: TfraDomicilioGIS;
    edMensaje: TMemo;
    Panel1: TPanel;
    btnClear: TButton;
    btnClose: TButton;
    btnEmpezar: TButton;
    lbCorrectos: TLabel;
    Label3: TLabel;
    chkDetener: TCheckBox;
    mnuCargosdelosUsuarios: TMenuItem;
    mnuUsuarioModuloMantenimiento: TMenuItem;
    mnuSeguimientoProcesos: TMenuItem;
    mnuPedidosEnviados: TMenuItem;
    lbIncorrectos: TLabel;
    lbCaptionIncorrectos: TLabel;
    mnuDestinatariosTickets: TMenuItem;
    mnuMonitorDeTransaccionesSML: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    mnuControlGoogleMaps: TMenuItem;
    mnuEstadoDeLosServicios: TMenuItem;
    btnAlarmas: TButton;
    btnImpoExpo: TButton;
    N33: TMenuItem;
    mnuImportarInformes: TMenuItem;
    N34: TMenuItem;
    mnuTercerizadoras: TMenuItem;
    mnuTercUsuarios: TMenuItem;
    mnuTercEmpresas: TMenuItem;
    mnuBloqueosDB: TMenuItem;
    mnuSistemasDeTickets: TMenuItem;
    procedure mnuAgendaAutorizacionClick(Sender: TObject);
    procedure mnuManUsuariosClick(Sender: TObject);
    procedure mnuManPerfilesClick(Sender: TObject);
    procedure mnuManSectoresClick(Sender: TObject);
    procedure mnuDireccionesCorreoClick(Sender: TObject);
    procedure mnuRelacionUsuarioSectorClick(Sender: TObject);
    procedure mnuUsuariosExternosClick(Sender: TObject);
    procedure mnuPerfilesdeDigitalizacionClick(Sender: TObject);
    procedure mnuManFFU_FORMULARIOUSUARIOClick(Sender: TObject);
    procedure mnuFaxFormulariosClick(Sender: TObject);
    procedure mnuPerfilesDeFaxClick(Sender: TObject);
    procedure mnuMantenimientoNovedadesClick(Sender: TObject);
    procedure mnuTicketsClick(Sender: TObject);
    procedure mnuSectoresdelaIntranetClick(Sender: TObject);
    procedure mnuMotivosSolicitudClick(Sender: TObject);
    procedure mnuBannerClick(Sender: TObject);
    procedure mnuGestionClick(Sender: TObject);
    procedure mnuConsultaRotuloClick(Sender: TObject);
    procedure mnuReportesWebClick(Sender: TObject);
    procedure mnuRotulosReporteClick(Sender: TObject);
    procedure TimerNoticiasTimer(Sender: TObject);
    procedure JvAppEventsIdle(Sender: TObject; var Done: Boolean);
    procedure mnuSubAlertasClick(Sender: TObject);
    procedure mnuAccionesClick(Sender: TObject);
    procedure mnuMonitordeAlertasClick(Sender: TObject);
    procedure mnuEquiposClick(Sender: TObject);
    procedure AnuloTimerIdle(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnEmpezarClick(Sender: TObject);
    procedure mnuElementosEnviadosClick(Sender: TObject);
    procedure sbEstadoClick(Sender: TObject);
    procedure TimerActualizacionTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuModulodeEstadisticasClick(Sender: TObject);
    procedure mnuInvocarunImpoExpoClick(Sender: TObject);
    procedure mnuVisualizarArchivosClick(Sender: TObject);
    procedure mnuProcesosImpoExpoClick(Sender: TObject);
    procedure mnuArchivosdeImportacionExportacionClick(Sender: TObject);
    procedure mnuMigracionesClick(Sender: TObject);
    procedure mnuProcesosdeOracleClick(Sender: TObject);
    procedure mnuManConsultasClick(Sender: TObject);
    procedure mnuBuquedaEnJEDIClick(Sender: TObject);
    procedure mnuConfiguracionClick(Sender: TObject);
    procedure mnuABMEventosClick(Sender: TObject);
    procedure mnuABMMotivosyTareasClick(Sender: TObject);
    procedure mnuABMRespuestasClick(Sender: TObject);
    procedure mnuAccionesWEBClick(Sender: TObject);
    procedure mnuParametrosWEBClick(Sender: TObject);
    procedure mnuUsuariosADClick(Sender: TObject);
    procedure mnuAgendaClick(Sender: TObject);
    procedure mnuTestUIFClick(Sender: TObject);
    procedure JvAppEventsActivate(Sender: TObject);
    procedure mnuCambioUsuarioClick(Sender: TObject);
    procedure mnuCargaMasivaEventosClick(Sender: TObject);
    procedure mnuCargosdelosUsuariosClick(Sender: TObject);
    procedure mnuDestinatariosTicketsClick(Sender: TObject);
    procedure mnuEstadisticasClick(Sender: TObject);
    procedure mnuImpresionMasivaClick(Sender: TObject);
    procedure mnuTipoDestinatariosClick(Sender: TObject);
    procedure TimerInstantaneoTimer(Sender: TObject);
    procedure TimerJodas(Sender: TObject);
    procedure mnuDocCompiladorObjetosClick(Sender: TObject);
    procedure mnuDocExploradordeDatosClick(Sender: TObject);
    procedure mnuDocTablasClick(Sender: TObject);
    procedure mnuDocObjetosClick(Sender: TObject);
    procedure mnuDocConsultasClick(Sender: TObject);
    procedure mnuMonitorDeTransaccionesSMLClick(Sender: TObject);
    procedure mnuSolicitudesCambioEjecClick(Sender: TObject);
    procedure Prestadores1Click(Sender: TObject);
    procedure mnuUsuarioModuloMantenimientoClick(Sender: TObject);
    procedure mnuSeguimientoProcesosClick(Sender: TObject);
    procedure mnuPedidosEnviadosClick(Sender: TObject);
    procedure mnuControlGoogleMapsClick(Sender: TObject);
    procedure mnuEstadoDeLosServiciosClick(Sender: TObject);
    procedure btnAlarmasClick(Sender: TObject);
    procedure btnImpoExpoClick(Sender: TObject);
    procedure mnuImportarInformesClick(Sender: TObject);
    procedure mnuTercUsuariosClick(Sender: TObject);
    procedure mnuTercEmpresasClick(Sender: TObject);
    procedure mnuBloqueosDBClick(Sender: TObject);
    procedure mnuSistemasDeTicketsClick(Sender: TObject);
  private
    dUltimaActualizacion, dUltimaActualizacionAudio: TDateTime;
    procedure PlayAudio(Sender: TObject);
    procedure FreeAudio(Sender: TObject);
    procedure ShowImage(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unDmPrincipal, unManUsuarios, unManPerfiles, unManSectores, unManCHG_HECHOGENERADORMAIL,
  unManCUS_USUARIOSECTOR, unConsultaUsuariosExternos, unPerfilesDigitalizacion,
  unManFFO_FAXFORMULARIO, unManFFU_FORMULARIOUSUARIO, unManCNO_NOVEDADES,
  unPerfilesFax, unGestionSistemas, unManSectoresIntranet,
  unManCMS_MOTIVOSOLICITUD, CustomDlgs, Math, unSesion,
  unManConsultasRotulos, unManReportesWeb, unManRotulosReporte,
  unManAcciones, unManAlertas, unMonitorAlertas, unManEquipos,
  unElementosEnviadosGlobal, unEstadisticas, Modbus, unImpoExpoWizard, unImpoExpo,
  unVisualizarArchivos, unManProcesos, unManProcesosOracle,
  unManArchivosExp, unMigraciones, unManConsultas,
  unBusquedaControlVersion,
  {$IFDEF AGENDA_SIC}
  unManAGENDA, unManami_motivoingreso,
  unManATE_TIPOEVENTO, unManARS_RESPUESTA,
  unAgendaBase, unAutorizacionAgenda, unAgendaCargaConsulta, unManATD_TIPODESTINATARIO,
  unEstadisticasAGENDA,
  {$ENDIF}
  unSeleccionMultiple, unManWAW_ACCIONWEB, unManWAP_ACCIONPARAMETROS,
  unActiveDirectory_Usuarios, unTesterLT, unSistemas, IniFiles, unArt,
  unRptDictamenFundMedicos, unComunes, CUIT, unEspera, ParamFuncs,
  unWelcomeSplash, unImageSplash, unSolicitudesCambioExe, unCompileSchemas,
  frm_Esrtructura, frm_DocumTabla, frm_DocObjetos, frm_Consulta, frm_Login, 
  unManCTB_USCAR, unManUsuariosMantenimiento, unSeguimientoProcesos,
  unPedidosEnviados, unDestinatarioTickets, unMonitorSincronizacionSML,
  unControlGIS, unEstadoServicios, unGIS, unFraGIS_APIv3, StrUtils,
  strfuncs, SqlFuncs, AnsiSql, DBFuncs, unImportarInformes, unManTercEmpresas,
  unManTercUsuarios, unBloqueosDB, unSistemasdeTickets;

const
  DIRECTORIO = '\\ntnas1\archivos\Gerencia Sistemas\COMPARTIDO GERENCIA\Audio\';
  CONFIGURACION = 'config.ini';

  PANEL_NOTICIAS = 2;
  PANEL_MAILS_PENDIENTES = 3;
  PANEL_ULTIMA_ACTUALIZACION = 4;

(*
var
  mbServer, data, data2: Variant;
*)
{$R *.DFM}

procedure TfrmPrincipal.mnuAgendaAutorizacionClick(Sender: TObject);
begin
  {$IFDEF AGENDA_SIC}
  Abrir(TfrmAutorizacionAgenda, frmAutorizacionAgenda, tmvMDIChild, mnuAgendaAutorizacion);
  {$ENDIF}
end;

procedure TfrmPrincipal.mnuManUsuariosClick(Sender: TObject);
begin
  Abrir(TfrmManUsuarios, frmManUsuarios, tmvMDIChild, mnuManUsuarios);
end;

procedure TfrmPrincipal.mnuManPerfilesClick(Sender: TObject);
begin
  Abrir(TfrmManPerfiles, frmManPerfiles, tmvMDIChild, mnuManPerfiles);
end;

procedure TfrmPrincipal.mnuManSectoresClick(Sender: TObject);
begin
  Abrir(TfrmManSectores, frmManSectores, tmvMDIChild, mnuManSectores);
end;

procedure TfrmPrincipal.mnuDireccionesCorreoClick(Sender: TObject);
begin
  Abrir(TfrmManCHG_HECHOGENERADORMAIL, frmManCHG_HECHOGENERADORMAIL, tmvMDIChild, mnuDireccionesCorreo);
end;

procedure TfrmPrincipal.mnuRelacionUsuarioSectorClick(Sender: TObject);
begin
  Abrir(TfrmManCUS_USUARIOSECTOR, frmManCUS_USUARIOSECTOR, tmvMDIChild, mnuRelacionUsuarioSector);
end;

procedure TfrmPrincipal.mnuUsuariosExternosClick(Sender: TObject);
begin
  Abrir(TfrmConsultaUsuariosExternos, frmConsultaUsuariosExternos, tmvMDIChild, mnuUsuariosExternos);
end;

procedure TfrmPrincipal.mnuPerfilesdeDigitalizacionClick(Sender: TObject);
begin
  Abrir(TfrmPerfilesDigitalizacion, frmPerfilesDigitalizacion, tmvMDIChild, mnuPerfilesdeDigitalizacion);
end;

procedure TfrmPrincipal.mnuManFFU_FORMULARIOUSUARIOClick(Sender: TObject);
begin
  Abrir(TfrmManFFU_FORMULARIOUSUARIO, frmManFFU_FORMULARIOUSUARIO, tmvMDIChild, mnuManFFU_FORMULARIOUSUARIO);
end;

procedure TfrmPrincipal.mnuFaxFormulariosClick(Sender: TObject);
begin
  Abrir(TfrmManFFO_FAXFORMULARIO, frmManFFO_FAXFORMULARIO, tmvMDIChild, mnuFaxFormularios);
end;

procedure TfrmPrincipal.mnuPerfilesDeFaxClick(Sender: TObject);
begin
  Abrir(TfrmPerfilesFax, frmPerfilesFax, tmvMDIChild, mnuPerfilesDeFax);
end;

procedure TfrmPrincipal.mnuMantenimientoNovedadesClick(Sender: TObject);
begin
  Abrir(TfrmManCNO_NOVEDADES, frmManCNO_NOVEDADES, tmvMDIChild, mnuMantenimientoNovedades);
end;

procedure TfrmPrincipal.mnuTicketsClick(Sender: TObject);
begin
  Abrir(TfrmGestionSistemas, frmGestionSistemas, tmvMDIChild, mnuTickets);
end;

procedure TfrmPrincipal.mnuSectoresdelaIntranetClick(Sender: TObject);
begin
  Abrir(TfrmManSectoresIntranet, frmManSectoresIntranet, tmvMDIChild, mnuSectoresdelaIntranet);
end;

procedure TfrmPrincipal.mnuMotivosSolicitudClick(Sender: TObject);
begin
  Abrir(TfrmManCMS_MOTIVOSOLICITUD, frmManCMS_MOTIVOSOLICITUD, tmvMDIChild, mnuMotivosSolicitud);
end;

procedure TfrmPrincipal.mnuBannerClick(Sender: TObject);
var
  tslTexto: TStringList;
begin
  inherited;
  tslTexto := TStringList.Create;
  try
    if mnuBanner.Tag = 0 then
    begin
      if MsgAsk('¿Desea colocar un banner de noticias ahora?') then
      begin
        if InputMemoBox('Banner de noticias', tslTexto) then
        begin
          if Trim(tslTexto.Text) > '' then
          begin
            EjecutarSQLEx('INSERT INTO COMPUTOS.CBN_BANNERNOTICIAS ' +
                         '(bn_id, bn_descripcion, bn_fechaalta, bn_idusualta, bn_fechafin, bn_idusufin, bn_idsistematicket) ' +
                         'VALUES (0, :DESCRIPCION, SYSDATE, :USER, NULL, NULL, :SISTEMA_TICKET)', [tslTexto.Text, Sesion.Id, GetIdSistemaTicket()]);
            sbEstado.Panels[PANEL_NOTICIAS].Text := tslTexto.Text;
          end else
            InfoHint(sbEstado, 'No se colocó ningún anuncio porque no se especificó el mensaje.');
        end else
          MsgBox('No se colocó ningún anuncio.');
      end;
    end else
    begin
      if MsgAsk('¿Desea remover el banner de noticias ahora?') then
      begin
        EjecutarSQLEx('UPDATE COMPUTOS.CBN_BANNERNOTICIAS ' +
                         'SET BN_FECHAFIN = SYSDATE, ' +
                             'BN_IDUSUFIN = :USUFIN ' +
                       'WHERE BN_FECHAFIN IS NULL ' +
                         'AND BN_IDSISTEMATICKET = :sistemas', [Sesion.Id, GetIdSistemaTicket()]);
        sbEstado.Panels[PANEL_NOTICIAS].Text := '';
      end;
    end;
  finally
    tslTexto.Free;
  end;
end;

procedure TfrmPrincipal.mnuBloqueosDBClick(Sender: TObject);
begin
  Abrir(TfrmBloqueosDB, frmBloqueosDB, tmvMDIChild, mnuBloqueosDB);
end;

procedure TfrmPrincipal.mnuGestionClick(Sender: TObject);
begin
  inherited;
  if ExisteSQLEx('SELECT 1 FROM COMPUTOS.CBN_BANNERNOTICIAS WHERE BN_FECHAFIN IS NULL AND BN_IDSISTEMATICKET = :sistemas', [GetIdSistemaTicket()]) then
  begin
    mnuBanner.Caption := 'Remover banner de noticias';
    mnuBanner.Tag := 1;
  end else
  begin
    mnuBanner.Caption := 'Colocar banner de noticias';
    mnuBanner.Tag := 0;
  end;
end;

procedure TfrmPrincipal.mnuRotulosReporteClick(Sender: TObject);
begin
  Abrir(TfrmManRotulosReporte, frmManRotulosReporte, tmvMDIChild, mnuRotulosReporte);
end;

procedure TfrmPrincipal.mnuReportesWebClick(Sender: TObject);
begin
  Abrir(TfrmManReportesWeb, frmManReportesWeb, tmvMDIChild, mnuReportesWeb);
end;

procedure TfrmPrincipal.mnuConsultaRotuloClick(Sender: TObject);
begin
  Abrir(TfrmManConsultasRotulo, frmManConsultasRotulo, tmvMDIChild, mnuConsultaRotulo);
end;
(*
function ReadData: String;
var
  device,device2,
  address,
  quantity,
  j,i: Integer;
begin
  address := 1;
  quantity := 1;
  device := 1;
  device2 := 2;
  data := VarArrayCreate([0,quantity-1], varvariant);
  data2 := VarArrayCreate([0,quantity-1], varvariant);

  { I used just readoutputregisters and ReadOutputStatus functions
    you can use ReadInputStatus and ReadInputRegisters if you wish }
  { Read register as integer.
    To read as other data types varinteger constant should be replaced with constants
    defined in system unit}

  //CHEQUEO DE TEMPERATURA
  mbServer.ReadOutputRegisters(device,address,quantity,data,varinteger);
  for i := 0 to quantity - 1 do
  begin
    Result := 'Temp. ' + String(data[i]);
  end;

  mbserver.ReadOutputRegisters(device2,address,quantity,data,varinteger);
  //CHEQUEO DE HUMEDAD
  for j := 0 to quantity - 1 do
  begin
    Result := Result + '° Hum. ' + String(data[j]);
  end;
end;

function Start(): String;
begin
  mbServer.OpenConnection('Serial', mblocal);  // open serial connection

  mbServer.Comport          := 1;
  mbServer.Baudrate         := 1200;
  mbServer.Parity           := mbNOPARITY;
  mbServer.FlowControl      := mbFC_NONE;
  mbServer.SilentInterval   := 200;
  mbServer.TimeOut          := 1000;
  mbServer.TransmissionMode := mbMODE_RTU;
  mbServer.ByteSize         := 8;
  mbServer.StopBits         := 0;
  mbServer.RaiseError       := False;

  // Let server raise errors, so we can handle
  // mbserver.connect = true expression is not true since return value
  // is -1 while true and 0 while result is 0
  // Everything seems clear in fi-then-else statement

  if (mbServer.Connect = True_Bool) then // if connected to serial device
  begin
    Result := ReadData;
  end else
  begin
    Beep;
    Result := 'Problemas con el módulo de comunicación conectado';
  end;
end;
*)
procedure TfrmPrincipal.TimerNoticiasTimer(Sender: TObject);
const
  MINUTOS_30 = 1/48;
  MINUTOS_5 = 1/48/6;
var
  dTiempoTranscurrido: TDateTime;
begin
  inherited;
  dTiempoTranscurrido := (Now - dUltimaActualizacion);
  if (not Assigned(Sender)) or ((Sesion.IdSectorIntranet <> SECTOR_DESARROLLO) and (dTiempoTranscurrido > MINUTOS_5)) or (dTiempoTranscurrido > MINUTOS_30) then
  begin
    dUltimaActualizacion := Now;
  //  sbEstado.Panels[1].Text := Start();
    sbEstado.Panels[1].Text := ValorSQLEx('SELECT ''Usuarios en el edificio '' || ' +
                                                 '(SELECT COUNT(*) ' +
                                                   ' FROM art.use_usuarios ' +
                                                  ' WHERE se_dentrofueraedificio = :V1 ' +
                                                    ' AND se_delegacion = :DELEGACION ' +
                                                    ' AND se_fechabaja IS NULL ' +
                                                    ' AND se_usuariogenerico = :generico) ' +
                                                ' || ''/'' || ' +
                                                 '(SELECT COUNT(*) ' +
                                                   ' FROM art.use_usuarios ' +
                                                  ' WHERE se_dentrofueraedificio IN(:V1, :V2) ' +
                                                    ' AND se_delegacion = :DELEGACION ' +
                                                    ' AND se_fechabaja IS NULL ' +
                                                    ' AND se_usuariogenerico = :generico) ' +
                                           ' FROM DUAL', ['in', '840', 'N', 'in', 'out', '840', 'N'], '-', False);

    sbEstado.Panels[PANEL_NOTICIAS].Text := ValorSQLEx('SELECT BN_DESCRIPCION ' +
                                                         'FROM COMPUTOS.CBN_BANNERNOTICIAS ' +
                                                        'WHERE BN_FECHAFIN IS NULL ' +
                                                          'AND BN_IDSISTEMATICKET = :sistemas', [GetIdSistemaTicket()], 'Sin novedades', False);
    sbEstado.Panels[PANEL_MAILS_PENDIENTES].Text :=
      Format('%s de envío', [ValorSQLEx('SELECT DECODE(count(*), 0, :sin_mails, ' +
                                                               ' 1, :hay || TO_CHAR(count(*)) || :pendiente, ' +
                                                                  ' :hay || TO_CHAR(count(*)) || :pendientes) ' +
                                          'FROM comunes.cee_emailaenviar ' +
                                         'WHERE ee_fechamensaje between ART.ACTUALDATE and SYSDATE ' +
                                           'AND ee_fechaenvio is null ' +
                                           'AND ee_estado = :estado', ['No hay mails pendientes',
                                                                       'Hay ',
                                                                       ' mail pendiente',
                                                                       'Hay ',
                                                                       ' mails pendientes',
                                                                       'N'], '0', False)]);
    TimerNoticias.Enabled := False;
  end;
end;

procedure TfrmPrincipal.JvAppEventsIdle(Sender: TObject; var Done: Boolean);
begin
  if Application.Active and (Sesion.Sector = 'COMPUTOS') then
    TimerNoticias.Enabled := True;
end;

procedure TfrmPrincipal.mnuSubAlertasClick(Sender: TObject);
begin
  Abrir(TfrmManAlertas, frmManAlertas, tmvMDIChild, mnuSubAlertas);
end;

procedure TfrmPrincipal.mnuAccionesClick(Sender: TObject);
begin
  Abrir(TfrmManAcciones, frmManAcciones, tmvMDIChild, mnuAcciones);
end;

procedure TfrmPrincipal.mnuMonitordeAlertasClick(Sender: TObject);
begin
  Abrir(TfrmMonitorAlertas, frmMonitorAlertas, tmvMDIChild, mnuMonitordeAlertas);
end;

procedure TfrmPrincipal.mnuEquiposClick(Sender: TObject);
begin
  Abrir(TfrmManEquipos, frmManEquipos, tmvMDIChild, mnuEquipos);
end;

procedure TfrmPrincipal.AnuloTimerIdle(Sender: TObject);
begin
  TimerNoticias.Enabled := False;
end;

procedure TfrmPrincipal.mnuElementosEnviadosClick(Sender: TObject);
begin
//  inherited;
  Abrir(TfrmElementosEnviadosGlobal, frmElementosEnviadosGlobal, tmvMDIChild, mnuElementosEnviados);
end;

procedure TfrmPrincipal.sbEstadoClick(Sender: TObject);
begin
  inherited;
  TimerNoticiasTimer(nil);
end;

procedure TfrmPrincipal.TimerActualizacionTimer(Sender: TObject);
var
  dHora: TDateTime;
begin
  inherited;
  dHora := Now - dUltimaActualizacion;
  sbEstado.Panels[PANEL_ULTIMA_ACTUALIZACION].Text := 'Última actualización: ' + FormatDateTime('nn', dHora) + ''' ' + FormatDateTime('ss', dHora) + '''''';
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
(*
  CoInitializeEx(nil, COINIT_MULTITHREADED);
  mbserver := CreateOleObject('ModbusSrv.ModbusSrv.1'); // Create server as ole object
*)
  inherited;
  sbEstado.Panels[0].Text := Sesion.Usuario;
  pnlStatusImpresion.Visible := (Sesion.Sector = 'COMPUTOS') and CommandExists('DICTAMENES');
  TimerNoticiasTimer(nil);
  mnuImportarInformes.Enabled := AreIn(Sesion.UserId, ['JLOVATTO', 'EVILA']);
end;

procedure TfrmPrincipal.mnuModulodeEstadisticasClick(Sender: TObject);
begin
  Abrir(TfrmEstadisticas, frmEstadisticas, tmvMDIChild, mnuModulodeEstadisticas);
end;

procedure TfrmPrincipal.mnuInvocarunImpoExpoClick(Sender: TObject);
var
  frmImpoExpoWizard: TfrmImpoExpoWizard;
begin
  Abrir(TfrmImpoExpoWizard, frmImpoExpoWizard, tmvModal, mnuInvocarunImpoExpo);
end;

procedure TfrmPrincipal.mnuVisualizarArchivosClick(Sender: TObject);
var
  frmVisualizarArchivos: TfrmVisualizarArchivos;
begin
  Abrir(TfrmVisualizarArchivos, frmVisualizarArchivos, tmvMDIChild, mnuVisualizarArchivos);
end;

procedure TfrmPrincipal.mnuProcesosImpoExpoClick(Sender: TObject);
var
  frmManProcesos: TfrmManProcesos;
begin
  Abrir(TfrmManProcesos, frmManProcesos, tmvMDIChild, mnuProcesosImpoExpo);
end;

procedure TfrmPrincipal.mnuArchivosdeImportacionExportacionClick(Sender: TObject);
begin
  Abrir(TfrmManArchivosExp, frmManArchivosExp, tmvMDIChild, mnuArchivosdeImportacionExportacion);
end;

procedure TfrmPrincipal.mnuMigracionesClick(Sender: TObject);
begin
  Verificar(Sesion.Sector <> 'COMPUTOS', nil, 'Solo los usuarios de Sistemas pueden migrar procesos');
  Abrir(TfrmMigraciones, frmMigraciones, tmvMDIChild, mnuMigraciones);
end;

procedure TfrmPrincipal.mnuProcesosdeOracleClick(Sender: TObject);
var
  frmManProcesosOracle: TfrmManProcesosOracle;
begin
  Abrir(TfrmManProcesosOracle, frmManProcesosOracle, tmvMDIChild, mnuProcesosdeOracle);
end;

procedure TfrmPrincipal.mnuManConsultasClick(Sender: TObject);
var
  frmManConsultas: TfrmManConsultas;
begin
  Abrir(TfrmManConsultas, frmManConsultas, tmvMDIChild, mnuManConsultas);
end;

procedure TfrmPrincipal.mnuBuquedaEnJEDIClick(Sender: TObject);
begin
  Abrir(TfrmBusquedaControlVersion, frmBusquedaControlVersion, tmvNormal, mnuBuquedaEnJEDI);
end;

procedure TfrmPrincipal.mnuConfiguracionClick(Sender: TObject);
begin
{$IFDEF AGENDA_SIC}
  Abrir(TfrmManAGENDA, frmManAGENDA, tmvModal, mnuManAgenda);
{$ENDIF}
end;

procedure TfrmPrincipal.mnuABMEventosClick(Sender: TObject);
begin
{$IFDEF AGENDA_SIC}
  Abrir(TfrmManami_motivoingreso, frmManami_motivoingreso, tmvMDIChild, mnuABMEventos);
{$ENDIF}
end;

procedure TfrmPrincipal.mnuABMMotivosyTareasClick(Sender: TObject);
begin
{$IFDEF AGENDA_SIC}
  Abrir(TfrmManATE_TIPOEVENTO, frmManATE_TIPOEVENTO, tmvMDIChild, mnuABMMotivosyTareas);
{$ENDIF}
end;

procedure TfrmPrincipal.mnuABMRespuestasClick(Sender: TObject);
begin
{$IFDEF AGENDA_SIC}
  Abrir(TfrmManARS_RESPUESTA, frmManARS_RESPUESTA, tmvMDIChild, mnuABMRespuestas);
{$ENDIF}
end;

procedure TfrmPrincipal.mnuAccionesWEBClick(Sender: TObject);
begin
  Abrir(TfrmManWAW_ACCIONWEB, frmManWAW_ACCIONWEB, tmvMDIChild, mnuAccionesWEB);
end;

procedure TfrmPrincipal.mnuParametrosWEBClick(Sender: TObject);
begin
  Abrir(TfrmManWAP_ACCIONPARAMETROS, frmManWAP_ACCIONPARAMETROS, tmvMDIChild, mnuParametrosWEB);
end;

procedure TfrmPrincipal.mnuUsuariosADClick(Sender: TObject);
begin
  Abrir(TfrmUser, frmUser, tmvMDIChild, mnuUsuariosAD);
end;

procedure TfrmPrincipal.mnuAgendaClick(Sender: TObject);
begin
  //Abrir(TfrmAdministracionEventosSISTEMAS, frmAdministracionEventosSISTEMAS, tmvMDIChild, mnuAgenda);
end;

procedure TfrmPrincipal.mnuTestUIFClick(Sender: TObject);
begin
  Abrir(TTesterUIF, TesterUIF, tmvMDIChild, mnuTestUIF);
end;

procedure TfrmPrincipal.JvAppEventsActivate(Sender: TObject);
begin
  inherited;
  if Application.Active and (Sesion.Sector = 'COMPUTOS') then
    TimerNoticiasTimer(Sender);
end;

procedure TfrmPrincipal.TimerJodas(Sender: TObject);
  function ConvertToInterval(ADifFechas: Extended): Cardinal;
  begin
    Result := Trunc((ADifFechas) * 24 * 60 * 60 * 1000);
  end;
  procedure Procesar(dFecha: TDateTime; sTimerName: String; Evento: TNotifyEvent);
  var
    nInterval: Cardinal;
    dAhora: TDateTime;
  begin
    dAhora := DBDateTime;
    if (dFecha > dAhora) then
    begin
      if Assigned(FindComponent(sTimerName)) then
      begin
        nInterval := TTimer(FindComponent(sTimerName)).Interval;

        if (nInterval - ConvertToInterval(Abs(dAhora - dUltimaActualizacionAudio))) <> ConvertToInterval(Abs(dFecha - dAhora)) then
          TTimer(FindComponent(sTimerName)).Free;
      end;

      if not Assigned(FindComponent(sTimerName)) then
        with TTimer.Create(Self) do
        begin
          dUltimaActualizacionAudio := dAhora;
          Name := sTimerName;
          Interval := Trunc((dFecha - dAhora) * 24 * 60 * 60 * 1000);
          Enabled := True;
          OnTimer := Evento;
        end;
    end else
      if Assigned(FindComponent(sTimerName)) then
        TTimer(FindComponent(sTimerName)).Free;
  end;
var
  dFecha: TDateTime;
  sTimerName: String;
begin
  inherited;
  if FileExists(DIRECTORIO + CONFIGURACION) then
    with TIniFile.Create(DIRECTORIO + CONFIGURACION) do
    try
      try
        dFecha := StrToDateTime(ReadString('AUDIO', 'NextExec', ''));
      except
        dFecha := 0;
      end;

      sTimerName := 'TimerAudio';
      Procesar(dFecha, sTimerName, PlayAudio);

      try
        dFecha := StrToDateTime(ReadString('IMAGEN', 'NextExec', ''));
      except
        dFecha := 0;
      end;

      sTimerName := 'TimerImagen';
      Procesar(dFecha, sTimerName, ShowImage);
    finally
      Free;
    end;
end;

procedure TfrmPrincipal.FreeAudio(Sender: TObject);
begin
  Sender.Free;
end;

procedure TfrmPrincipal.mnuImportarInformesClick(Sender: TObject);
begin
  Abrir(TfrmImportarInformes, frmImportarInformes, tmvMDIChild, mnuTestUIF);
end;

procedure TfrmPrincipal.mnuImpresionMasivaClick(Sender: TObject);
var
  sFecIngreso, sTarea, sSql, sCuit, sCuil, sFAccidente, sTipo, sSiniestro, sLugarAccid,
  //sFileName,
  sSector, sTareaA :String;
  sdqDicta, qry3, qry2, qry: TSDQuery;
  frmDictamen :TqrDictamenFundMedicos;
  bEsSinGobernacion :Boolean;
  nCantidad, NumSiniestro, NumOrden, NumRecaida: Integer;
begin
  if not msgask('¿Desea iniciar la impresión masiva?' + CRLF + '(Se le preguntará cuántas hojas quiere imprimir)') then
    Abort;

  nCantidad := InputBoxInteger('Impresión', '¿Cuántas?', 100);

  if nCantidad = -1 then
    Abort;

  sdqDicta := GetQuery('SELECT siniestro, orden, nl_tarea tarea, NVL(diagnostico, NVL(nl_enfermedad, ex_diagnostico)) diagnostico, cie10, ' +
                              'NVL(agente, NVL(nl_agente, NVL(lm_descripcion, la_descripcion))) AGENTE, usu_impre ' +
                         'FROM SIN.sla_lesionagente, SIN.slm_lesionagentematerial, art.sex_expedientes, SIN.snl_enfermedadnolistada b, pau.dicta_impre a ' +
                        'WHERE ex_siniestro = siniestro ' +
                          'AND ex_orden = orden ' +
                          'AND ex_recaida = 0 ' +
                          'AND ex_id = nl_idexpediente(+) ' +
                          'AND nl_marcado(+) = ''S'' ' +
                          'AND nl_fechabaja(+) IS NULL ' +
                          'AND lm_id(+) = ex_idagentematerial ' +
                          'AND la_id(+) = ex_idagente ' +
                          'AND fimpre is null ' +
//                          'AND siniestro in (529377, 598897, 598958, 653252) ' +
                     'ORDER BY siniestro, orden');

  with sdqDicta do
  try
    while not Eof do
    try
      NumSiniestro := FieldByName('siniestro').AsInteger;
      NumOrden := FieldByName('orden').AsInteger;
      NumRecaida := 0;

      pnlStatusImpresion.Caption := 'Hoja ' + IntToStr(RecNo {$IFDEF VER150}+ 1{$ENDIF}) + ' de ' + IntToStr(RecordCount);
      application.ProcessMessages;

      sSql := ' SELECT ex_cuit, ex_cuil, ex_tipo, ' +
                     ' art.utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida) siniestro, ' +
                     ' to_char(ex_fechaaccidente, ''dd/mm/yyyy'') fechaaccidente, ex_horaaccidente, ' +
                     ' ci_descripcion tareaaccidente' +
                ' FROM sex_expedientes, sin.sde_denuncia, cci_ciuo ' +
               ' WHERE de_tareaaccidente = ci_id(+) ' +
                 ' AND ex_siniestro=:Siniestro ' +
                 ' AND ex_orden=:Orden ' +
                 ' AND ex_recaida=:Recaida ' +
                 ' AND ex_id=de_idexpediente(+)';
      with GetQueryEx(sSql, [NumSiniestro, NumOrden, NumRecaida]) do
      try
        if not EOF then
        begin
          sCuit       := FieldByName('EX_CUIT').AsString;
          sCuil       := FieldByName('EX_CUIL').AsString;
          sTipo       := FieldByName('EX_TIPO').AsString;
          sFAccidente := FieldByName('FECHAACCIDENTE').AsString;
          sSiniestro  := FieldByName('SINIESTRO').AsString;
          sTareaA     := NVL(sdqDicta.FieldByName('TAREA').AsString, FieldByName('TAREAACCIDENTE').AsString);
    (*
          if (ValorSqlEx('SELECT utiles.is_cuitvalido(:CUIL) FROM dual', [sCuil]) = 'N') and
             (MsgBox('El CUIL del trabajador es inválido, ¿desea continuar?', MB_ICONQUESTION or MB_YESNO, 'Error') = mrNo) then
          begin
            bCancela := True;
            Exit;
          end;
    *)
          sSql := 'SELECT tj_nombre, tj_localidad, tj_cpostal, tj_documento, ' +
                        ' utiles.armar_domicilio(tj_calle, tj_numero, tj_piso, tj_departamento) domicilio, ' +
                        ' tj_sexo, to_char(tj_fnacimiento, ''dd/mm/yyyy'') fnacimiento, pv_descripcion ' +
                   ' FROM ctj_trabajador, cpv_provincias ' +
                  ' WHERE tj_cuil=:Cuil ' +
                    ' AND tj_provincia=pv_codigo(+)';
          qry := GetQueryEx(sSql, [sCuil]);
          try
            if qry.EOF then
              //InfoHint(Nil, 'El trabajador no existe')
            else begin
              frmDictamen := TqrDictamenFundMedicos.Create(Self);
              with frmDictamen do
              try
    (*
                if qry.FieldByName('FNACIMIENTO').IsNull  and
                (MsgBox('Falta la fecha de nacimiento del trabajador, ¿desea continuar?', MB_ICONQUESTION or MB_YESNO, 'Error') = mrNo) then
                begin
                  bCancela := True;
                  Exit;
                end;
    *)
                bEsSinGobernacion := Is_SiniestroGobernacion(NumSiniestro);
                if bEsSinGobernacion then
                begin
                  qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART_GOB');
                  qrlDatosEmpDep.Caption := 'DATOS DE LA DEPENDENCIA';   // Lu 25/06
                  qrlEmpDep.Caption      := 'Dependencia:';
                end
                else begin
                  qriLogoART.Picture.Bitmap.LoadFromResourceName(hInstance, 'LOGO_PART');
                  qrlDatosEmpDep.Caption := 'DATOS DEL EMPLEADOR';       // Lu 25/06
                  qrlEmpDep.Caption      := 'Empleador:';
                end;

                qrlNroSiniestro.Caption   := sSiniestro;
                qrlNombreTrab.Caption     := qry.FieldByName('TJ_NOMBRE').AsString;
                qrlCuilTrab.Caption       := PonerGuiones(sCuil);
                qrlDomTrab.Caption        := qry.FieldByName('DOMICILIO').AsString;
                qrlLocTrab.Caption        := qry.FieldByName('TJ_LOCALIDAD').AsString;
                qrlProvTrab.Caption       := qry.FieldByName('PV_DESCRIPCION').AsString;
                qrlCPTrab.Caption         := qry.FieldByName('TJ_CPOSTAL').AsString;
                qrlSexoTrab.Caption       := qry.FieldByName('TJ_SEXO').AsString;
                qrlFechaNacTrab.Caption   := qry.FieldByName('FNACIMIENTO').AsString;
                qrlNroDocTrab.Caption     := qry.FieldByName('TJ_DOCUMENTO').AsString;
                qrlTareaAccidente.Caption := sTareaA;

                sSql := 'SELECT to_char(dl_fecingreso, ''dd/mm/yyyy'') fecingreso, ' +
                              ' dl_tarea tarea, dl_sector sector ' +
                         ' FROM cdl_datoslaborales ' +
                        ' WHERE dl_cuil=:Cuil ' +
                          ' AND dl_cuit=:Cuit';
                qry2 := GetQueryEx(sSql, [sCuil, sCuit]);
                try
                  if qry2.EOF then
                  begin
                    sSql := 'SELECT to_char(a.hl_fechaalta, ''dd/mm/yyyy'') fecingreso, ' +
                                  ' a.hl_tarea tarea,  a.hl_sector sector ' +
                             ' FROM chl_histolaboral a ' +
                            ' WHERE a.hl_cuil=:Cuil ' +
                              ' AND a.hl_cuit=:Cuit ' +
                              ' AND a.hl_fecha=(SELECT max(b.hl_fecha) ' +
                                                ' FROM chl_histolaboral b ' +
                                               ' WHERE a.hl_cuil=b.hl_cuil ' +
                                                 ' AND a.hl_cuit=b.hl_cuit)';
                    qry3 := GetQueryEx(sSql, [sCuil, sCuit]);
                    try
                      if qry3.EOF then
                      begin
                        sFecIngreso := '';
                        sTarea      := '';
                        sSector     := '';
                      end
                      else begin
                        sFecIngreso := qry3.FieldByName('FECINGRESO').AsString;
                        sTarea      := qry3.FieldByName('TAREA').AsString;
                        sSector     := qry3.FieldByName('SECTOR').AsString;
                      end;
                    finally
                      qry3.Free;
                    end;
                  end
                  else begin
                    sFecIngreso := qry2.FieldByName('FECINGRESO').AsString;
                    sTarea      := qry2.FieldByName('TAREA').AsString;
                    sSector     := qry2.FieldByName('SECTOR').AsString;
                  end;
                finally
                  qry2.Free;
                end;

                qrlFechaIngTrab.Caption       := sFecIngreso;
                qrlFechaIngTrab2.Caption      := sFecIngreso;
                qrlTareaHabitualTrab.Caption  := sTarea;
                qrlSector.Caption             := sSector;

                sSql := 'SELECT em_nombre, dc_localidad, dc_cpostal, dc_telefonos, ' +
                              ' utiles.armar_domicilio(dc_calle, dc_numero, dc_piso, dc_departamento) domicilio, ' +
                              ' pv_descripcion, ac_codigo, ac_descripcion ' +
                         ' FROM cac_actividad, cpv_provincias, adc_domiciliocontrato, ' +
                              ' aco_contrato, aem_empresa ' +
                        ' WHERE em_cuit=:Cuit ' +
                          ' AND co_contrato=get_vultcontrato(em_cuit) ' +
                          ' AND dc_provincia=pv_codigo(+) ' +
                          ' AND dc_contrato=co_contrato ' +
                          ' AND dc_tipo= ''L'' ' +
                          ' AND co_idactividad=ac_id(+)';
                qry2 := GetQueryEx(sSql, [sCuit]);
                try

                  if qry2.EOF then
                    //InfoHint(Nil, 'La empresa no existe')
                  else begin
                    qrlNombreEmp.Caption  := qry2.FieldByName('EM_NOMBRE').AsString;
                    qrlCuitEmp.Caption    := PonerGuiones(sCuit);
                    qrlDomEmp.Caption     := qry2.FieldByName('DOMICILIO').AsString;
                    qrlLocEmp.Caption     := qry2.FieldByName('DC_LOCALIDAD').AsString;
                    qrlProvEmp.Caption    := qry2.FieldByName('PV_DESCRIPCION').AsString;
                    qrlCPEmp.Caption      := qry2.FieldByName('DC_CPOSTAL').AsString;
                    qrlTelEmp.Caption     := qry2.FieldByName('DC_TELEFONOS').AsString;
                    qrlActivEmp.Caption   := qry2.FieldByName('AC_DESCRIPCION').AsString;
                    qrlFechaSin.Caption   := sFAccidente;
                    qrlFecha.Caption      := sFAccidente;
                    qrlHoraAccid.Caption  := FieldByName('EX_HORAACCIDENTE').AsString;
                    qrlNombreEmp2.Caption := qry2.FieldByName('EM_NOMBRE').AsString;

                    sLugarAccid := 'En su lugar de trabajo';                
    (*
                    if sTipo = '1' then
                      sLugarAccid := 'En su lugar de trabajo'
                    else if sTipo = '2' then
                      sLugarAccid := 'In Itinere'
                    else
                      sLugarAccid := '';
    *)
                    qrlLugarAccidente.Caption := sLugarAccid;
                               (*
                    qrlDiagnostico.Caption := sdqDicta.FieldByName('DIAGNOSTICO').AsString;
  //                  qrlCIE10.Caption := sdqDicta.FieldByName('CIE10').AsString;
                    qrlAgente.Caption := sdqDicta.FieldByName('AGENTE').AsString;
                    qrlUsuImpre.Caption := sdqDicta.FieldByName('USU_IMPRE').AsString;

                                *)
    //                if TipoSalida = 'I' then //impresora
                    Print;
                    application.ProcessMessages;
                    EjecutarSQLEx('UPDATE pau.dicta_impre SET fimpre = sysdate WHERE siniestro = :v1 and orden = :v2', [sdqDicta.FieldByName('siniestro').AsInteger, sdqDicta.FieldByName('orden').AsInteger]);   
    (*
                    else if TipoSalida = 'M' then //mail
                    begin
                      Cuerpo.Add('Dictamen de Fundamentos Médicos');
                      sFileName := Get_NombreArchivoPDF('DictamenFundMedicos', NumSiniestro, NumOrden, NumRecaida, '');
                      ExportarPDF(frmDictamen, sFileName);
                      AddAttach(sFileName, 0, vAdjuntos);
                    end;
    *)
                  end;
                finally
                  qry2.Free;
                end;
              finally
               Free
              end;
            end;
          finally
            qry.Free;
          end;
        end;
      finally
        Free;
      end;

      Next;
      if RecNo {$IFNDEF VER150}- 1{$ENDIF} = nCantidad then
        break;
    finally
      application.processmessages;
    end;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.PlayAudio(Sender: TObject);
begin
  if Sesion.Sector <> 'COMPUTOS' then
    Abort;
    
  Application.ProcessMessages;
//  MostrarAlarma('Noticia de último momento', 'Si tenés parlantes, ajustá el volumen...' + CRLF + '(En 10 segundos se viene lo mejor)');
//  Application.ProcessMessages;
//  Sleep(10000);
//  Application.ProcessMessages;  
  if FileExists(DIRECTORIO + CONFIGURACION) then
    with TIniFile.Create(DIRECTORIO + CONFIGURACION) do
    try
      if FileExists(DIRECTORIO + ReadString('AUDIO', 'FileName', '')) then
        with TJvWavePlayer.Create(Self) do
        begin
          FileName := DIRECTORIO + ReadString('AUDIO', 'FileName', '');
          Play;
          AfterPlaying := FreeAudio;
        end;
    finally
      Free;
    end;
end;

function TaskBarHeight: integer;
var
  hTB: HWND; // taskbar handle
  TBRect: TRect; // taskbar rectangle
begin
  hTB:= FindWindow('Shell_TrayWnd', '');
  if hTB = 0 then
    Result := 0
  else begin
    GetWindowRect(hTB, TBRect);
    Result := TBRect.Bottom - TBRect.Top;
  end;
end;

procedure TfrmPrincipal.btnAceptarClick(Sender: TObject);
begin
  inherited;
  Verificar(fraUsuarioConSectorIntranet.fraUsuarioSeleccionado.IsEmpty, fraUsuarioConSectorIntranet.fraUsuarioSeleccionado.edCodigo, 'Debe seleccionar un usuario.');
  fpCambioUsuario.ModalResult := mrOk;
end;

procedure TfrmPrincipal.btnClearClick(Sender: TObject);
begin
  edMensaje.Clear;
  lbCorrectos.Caption := '0';
  lbIncorrectos.Caption := '0';  
end;

procedure TfrmPrincipal.btnCloseClick(Sender: TObject);
begin
  fpDomicilio.Close;
end;
(*
procedure ResetProcessWorkingSet(MinMem: DWORD);
var
  xHandle: THandle;
  xOldMin, xOldMax: DWORD;
begin
  minmem := minmem * 1024 * 1024;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    xHandle := GetCurrentProcess;
    if not GetProcessWorkingSetSize(xHandle, xOldMin, xOldMax) or
       not SetProcessWorkingSetSize(xHandle, min(xoldmin,minmem), max(minmem,xOldMax)) then
    begin
      raise exception.Create('Error resetting the ProcessWorkingSize');
    end;
  end;
end;
*)
procedure CleanMemory;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    SetProcessWorkingSetSize(GetCurrentProcess, $ffffffff, $ffffffff);
    sleep(100);
  end;
end;

procedure TfrmPrincipal.btnEmpezarClick(Sender: TObject);
var
  fAux1, fAux2, fAux3, fAux4: Extended;
begin
  with GetQueryEx('SELECT ca_identificador, ca_descripcion, ca_fechamodif, ca_lat, ca_lng ' +
                    'FROM art.cpr_prestador, pablo.prestadores_gis ' +
                   'WHERE ca_lat IS NOT NULL ' +
                     'AND ca_identificador = id(+) ' +
                'ORDER BY fecha, NVL(ca_fechamodif, ca_fechalta) DESC', []) do
  try
    edMensaje.Lines.Add('Total: ' + IntToStr(RecordCount));
    while (not Eof) and (not chkDetener.Checked) do
    begin
      fraDomicilioGIS.IdPrestador := FieldByName('ca_identificador').AsInteger;
      edMensaje.Lines.Add('Nro. ' + IntToStr(RecNo{$IFDEF VER150}+ 1{$ENDIF}));
      if fraDomicilioGIS.GeoCodificar(True, 'P') then
      begin
        fAux1 := Trunc(fraDomicilioGIS.Coordenadas.Latitude * 1000);
        fAux2 := Trunc(FieldByName('ca_lat').AsFloat * 1000);
        fAux3 := Trunc(fraDomicilioGIS.Coordenadas.Longitude * 1000);
        fAux4 := Trunc(FieldByName('ca_lng').AsFloat * 1000);

        if (fAux1 <> fAux2) or (fAux3 <> fAux4) then
        begin
          EjecutarSQLEx('UPDATE art.cpr_prestador ' +
                           'SET ca_lat = NULL, ' +
                               'ca_lng = NULL ' +
                         'WHERE ca_identificador = :id', [fraDomicilioGIS.IdPrestador]);
          edMensaje.Lines.Add(Format('Error en prestador %s (%s)', [FieldByName('ca_descripcion').AsString, FieldByName('ca_fechamodif').AsString]));
          edMensaje.Lines.Add(Format('                  GPS >>  - LatDB: %s - LatGIS: %s - LngDB: %s - LngGIS: %s',
                              [
                              FieldByName('ca_lat').AsString,
                              FloatToStr(fraDomicilioGIS.Coordenadas.Latitude),
                              FieldByName('ca_lng').AsString,
                              FloatToStr(fraDomicilioGIS.Coordenadas.Longitude)
                              ]));
          lbIncorrectos.Caption := IntToStr(StrToIntDef(lbIncorrectos.Caption, 0) + 1);
          EjecutarSQLEx('UPDATE pablo.prestadores_gis ' +
                           'SET fecha = SYSDATE, correcto = :correcto ' +
                         'WHERE id = :id', ['N', fraDomicilioGIS.IdPrestador]);
        end else
        begin
          EjecutarSQLEx('UPDATE pablo.prestadores_gis ' +
                           'SET fecha = SYSDATE, correcto = :correcto ' +
                         'WHERE id = :id', ['S', fraDomicilioGIS.IdPrestador]);

          lbCorrectos.Caption := IntToStr(StrToIntDef(lbCorrectos.Caption, 0) + 1);
          edMensaje.Lines.Add('Bien prestador ' + FieldByName('ca_descripcion').AsString);
        end;
      end else
        edMensaje.Lines.Add('Error al geocodificar prestador ' + FieldByName('ca_descripcion').AsString);


      edMensaje.Lines.SaveToFile('E:\log_pres_gis.log');
      Delay(2000);

      {
      fraDomicilioGIS.fraGISDomicilio.ResetMemoryLeak;
      FreeAndNil(fraDomicilioGIS);
      Application.ProcessMessages;
      fraDomicilioGIS := TfraDomicilioGIS.Create(fpDomicilio);
      fraDomicilioGIS.Parent := fpDomicilio;
      fraDomicilioGIS.Align := alTop;
      //ResetProcessWorkingSet(32);
      }

      Next;
      CleanMemory;
    end;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuCambioUsuarioClick(Sender: TObject);
begin
  inherited;
  {$IFDEF AGENDA_SIC}
  if fpCambioUsuario.ShowModal = mrOk then
  begin
    Sesion.CambiarUsuario(fraUsuarioConSectorIntranet.fraUsuarioSeleccionado.Codigo);
    Caption := Application.Title + ' - ' + Sesion.Usuario;
    sbEstado.Panels[0].Text := Sesion.Usuario;
    if Assigned(frmAgendaBase) then
    with frmAgendaBase do
    try
      if Assigned(fraSeleccionUsuarios) then
      begin
        fraSeleccionUsuarios.UsuariosAsignados.Clear;
        fraSeleccionUsuarios.UsuariosAsignados.AddObject(Sesion.Usuario, TUserData.Create(Sesion.ID, Sesion.UserMail));
        lbAsignados.Caption := Sesion.Usuario;
        sdqEventos.Close;
        Actualizar;
        RefreshTreeView;
      end;
    except
    end;
  end;
  {$ENDIF}
end;

procedure TfrmPrincipal.mnuCargaMasivaEventosClick(Sender: TObject);
begin
  ImpoExpoWizard('SICCM');
end;

procedure TfrmPrincipal.mnuCargosdelosUsuariosClick(Sender: TObject);
begin
  Abrir(TfrmManCTB_USCAR, frmManCTB_USCAR, tmvMDIChild, mnuCargosdelosUsuarios);
end;

procedure TfrmPrincipal.mnuDestinatariosTicketsClick(Sender: TObject);
begin
  Abrir(TfrmDestinatarioTickets, frmDestinatarioTickets, tmvMDIChild, mnuDestinatariosTickets);
end;

procedure TfrmPrincipal.mnuEstadisticasClick(Sender: TObject);
begin
  {$IFDEF AGENDA_SIC}
  Abrir(TfrmEstadisticasAGENDA, frmEstadisticasAGENDA, tmvMDIChild, mnuEstadisticas);
  {$ENDIF}
end;

procedure TfrmPrincipal.mnuTipoDestinatariosClick(Sender: TObject);
begin
  {$IFDEF AGENDA_SIC}
  Abrir(TfrmManATD_TIPODESTINATARIO, frmManATD_TIPODESTINATARIO, tmvMDIChild, mnuTipoDestinatarios);
  {$ENDIF}
end;

procedure TfrmPrincipal.ShowImage(Sender: TObject);
var
  objForm: TfrmImageSplash;
  sAux: String;
begin
  if Sesion.Sector <> 'COMPUTOS' then
    Abort;

  TimerImagen.Enabled := False;
  inherited;
  if FileExists(DIRECTORIO + CONFIGURACION) then
  try
    with TIniFile.Create(DIRECTORIO + CONFIGURACION) do
    try
      sAux := DIRECTORIO + ReadString('IMAGEN', 'FileName', '');

      if FileExists(sAux) then
      begin
        objForm := TfrmImageSplash.Create(nil);

        with objForm do
        try
          Show;
          Bitmap.LoadFromFile(sAux);
          Top := Screen.Height;
          Left := Screen.Width - Bitmap.Width;
          Hide;
          ShowOnTop;

          while Top > (Screen.Height - Bitmap.Height - TaskBarHeight) do
          begin
            Top := Top - 3;
            Update;
          end;

          Sleep(2000);
        finally
          objForm.Close;
        end;
      end;
    finally
      Free;
    end;
  finally
    TimerImagen.Enabled := True;
  end;
end;

procedure TfrmPrincipal.TimerInstantaneoTimer(Sender: TObject);
begin
  inherited;
  ShowImage(nil);
end;

procedure TfrmPrincipal.mnuDocCompiladorObjetosClick(Sender: TObject);
begin
  if DoLogin then
    Abrir(TfrmCompInvalid, frmCompInvalid, tmvMDIChild, mnuDocCompiladorObjetos);
end;

procedure TfrmPrincipal.mnuDocExploradordeDatosClick(Sender: TObject);
begin
  if DoLogin then
    Abrir(TFrm_Estructura, frmEstructura, tmvMDIChild, mnuDocExploradordeDatos);
end;

procedure TfrmPrincipal.mnuDocTablasClick(Sender: TObject);
begin
  if DoLogin then
    Abrir(TFrm_DocTabla, frmDocTabla, tmvMDIChild, mnuDocTablas);
end;

procedure TfrmPrincipal.mnuDocObjetosClick(Sender: TObject);
begin
  if DoLogin then
    Abrir(TFrm_DocObjects, frmDocObjects, tmvMDIChild, mnuDocObjetos);
end;

procedure TfrmPrincipal.mnuDocConsultasClick(Sender: TObject);
begin
  if DoLogin then
    Abrir(TFrm_Consultas, frmConsultas, tmvMDIChild, mnuDocConsultas);
end;

procedure TfrmPrincipal.mnuMonitorDeTransaccionesSMLClick(Sender: TObject);
begin
  Abrir(TfrmMonitorSincronizacionSML, frmMonitorSincronizacionSML, tmvMDIChild, mnuMonitorDeTransaccionesSML);
end;

procedure TfrmPrincipal.mnuSolicitudesCambioEjecClick(Sender: TObject);
begin
  Abrir(TfrmSolicitudesCambioExe, frmSolicitudesCambioExe, tmvMDIChild, mnuSolicitudesCambioEjec);
end;

procedure TfrmPrincipal.Prestadores1Click(Sender: TObject);
begin
  fpDomicilio.ShowModal;
end;

procedure TfrmPrincipal.mnuUsuarioModuloMantenimientoClick(Sender: TObject);
begin
  Abrir(TfrmManUsuariosMantenimiento, frmManUsuariosMantenimiento, tmvMDIChild, mnuUsuarioModuloMantenimiento);
end;

procedure TfrmPrincipal.mnuSeguimientoProcesosClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoProcesos, frmSeguimientoProcesos, tmvMDIChild, mnuSeguimientoProcesos);
end;

procedure TfrmPrincipal.mnuSistemasDeTicketsClick(Sender: TObject);
begin
  Abrir(TfrmSistemasDeTickets,frmSistemasDeTickets,tmvMDIChild, mnuSistemasDetickets);
end;

procedure TfrmPrincipal.mnuPedidosEnviadosClick(Sender: TObject);
begin
  Abrir(TfrmPedidosEnviados, frmPedidosEnviados, tmvMDIChild, mnuPedidosEnviados);
end;

procedure TfrmPrincipal.mnuControlGoogleMapsClick(Sender: TObject);
begin
  Abrir(TfrmControlGIS, frmControlGIS, tmvMDIChild, mnuControlGoogleMaps);
end;

procedure TfrmPrincipal.mnuEstadoDeLosServiciosClick(Sender: TObject);
begin
  Abrir(TfrmEstadoServicios, frmEstadoServicios, tmvMDIChild, mnuEstadoDeLosServicios);
end;

function TieneAsignacion(ASQL: String): Boolean;
  begin
    Result := Pos(':=', ASQL) > 0;
  end;

  function ReemplazarAsignaciones(ASQL: String): String;
  var
    iPos, iAux, iPosIgual, iPosBlanco, iPosPuntoComa: Integer;
    //sSQL: String;
  begin
    while Pos(':=', Copy(ASQL, Pos('begin', LowerCase(ASQL)), MAXINT)) > 0 do
    begin
      iPosIgual := Pos(':=', ASQL);
      iPosPuntoComa := PosEx(';', ASQL, iPosIgual);

      for iAux := iPosIgual - 1 downto 0 do
      begin
        if not AreIn(ASQL[iAux], [Chr(13), Chr(10), ' ']) then
          Break;
      end;

      iPos := iAux;

      for iAux := iPos downto 0 do
      begin
        if AreIn(ASQL[iAux], [Chr(13), Chr(10), ' ']) then
          Break;
      end;

      iPosBlanco := iAux;

      if iPosBlanco = 0 then
      begin
        ShowMessage('Error! ' + ASQL);
        Result := '';
        Exit;
      end;

      iPosBlanco := iPosBlanco + 1;

      ASQL := Copy(ASQL, 1, iPosBlanco - 1) +
              'SELECT ' +
              Trim(Copy(ASQL, iPosIgual + 2, iPosPuntoComa - iPosIgual - 2)) +
              ' INTO ' +
              Trim(Copy(ASQL, iPosBlanco, iPosIgual - iPosBlanco)) +
              ' FROM DUAL;' + 
              Copy(ASQL, iPosPuntoComa + 1, Length(ASQL));
    end;

    Result := ASQL;
  end;

procedure TfrmPrincipal.btnAlarmasClick(Sender: TObject);
var
  sdqAux: TSDQuery;
  sSQL: String;
begin
  inherited;
  sdqAux := GetQuery('SELECT 1 FROM dual');

  with GetQuery('SELECT ae_sql, ae_idaccion, ae_orden, al_codigo ' +
                  'FROM comunes.cae_accionevento, comunes.caa_alertaaccion, comunes.cal_alerta ' +
                 'WHERE aa_idaccion = ae_idaccion ' +
                   'AND aa_idalerta = al_id ' +
                   'AND ae_fechabaja IS NULL ' +
                   'AND al_fechabaja IS NULL ' +
                   'AND aa_fechabaja IS NULL ') do
  try
    if not IsEmpty then
    while not Eof do
    begin
      sdqAux.Close;

      if TieneAsignacion(Fields[0].AsString) then
      begin
        ShowMessage('Alarma: ' + Fields[3].AsString);

        try
          CheckAndOpenQuery(sdqAux, Fields[0].AsString, False);
        except
          ShowMessage('Este query ya no andaba de antes!');
        end;

        sSQL := ReemplazarAsignaciones(Fields[0].AsString);

        try
          if CheckAndOpenQuery(sdqAux, sSQL, False) and (not IsEmptyString(sSQL)) then
          begin
            BeginTrans(True);

            sdqAux.SQL.Text := sSQL;
            SaveBlob('SELECT AE_SQL' +
                        ' FROM CAE_ACCIONEVENTO' +
                       ' WHERE AE_IDACCION = ' + SqlValue(Fields[1].AsInteger) +
                         ' AND AE_ORDEN = ' + SqlValue(Fields[2].AsInteger),
                       'UPDATE CAE_ACCIONEVENTO' +
                         ' SET AE_SQL = :AE_SQL' +
                       ' WHERE AE_IDACCION = ' + SqlValue(Fields[1].AsInteger) +
                         ' AND AE_ORDEN = ' + SqlValue(Fields[2].AsInteger),
                       'AE_SQL', sdqAux.SQL);

            CommitTrans(True);
          end else
            ShowMessage('Error en Accion: ' + Fields[1].AsString + ' orden: ' + Fields[2].AsString);
        except
          ShowMessage('Este query no anda ahora!');
          sdqAux.SQL.SaveToFile('e:\temp\alarma_' + Fields[3].AsString + '_accion_' + Fields[1].AsString + '_orden_' + Fields[2].AsString + '.sql');
        end;
      end;
      Next;
    end;
  finally
    Free;
    sdqAux.Free;
  end;
end;

procedure TfrmPrincipal.btnImpoExpoClick(Sender: TObject);
var
  sdqAux: TSDQuery;
  sSQL: String;
  AParams: TParams;
  AParam: TParam;
  i: Integer;
  sdqSql,
//  sdqEvento,
  sdqCampos: TSDQuery;
begin
  inherited;
  (*
  sdqAux := GetQuery('SELECT 1 FROM dual');

  with GetQuery('SELECT ps_sql, ps_id ' +
                  'FROM impoexpo.ips_procesoserver ' +
                 'WHERE ps_fechabaja IS NULL ') do
  try
    if not IsEmpty then
    while not Eof do
    begin
      sdqAux.Close;

      if TieneAsignacion(Fields[0].AsString) then
      begin
        //ShowMessage('Alarma: ' + Fields[3].AsString);

        try
          CheckAndOpenQuery(sdqAux, Fields[0].AsString, False);
        except
          //ShowMessage('Este query ya no andaba de antes!');
        end;

        sSQL := ReemplazarAsignaciones(Fields[0].AsString);

        try
          if CheckAndOpenQuery(sdqAux, sSQL, False) and (not IsEmptyString(sSQL)) then
          begin
            BeginTrans(True);

            sdqAux.SQL.Text := sSQL;
            SaveBlob('SELECT PS_SQL FROM IPS_PROCESOSERVER WHERE PS_ID = ' + SqlValue(Fields[1].AsInteger),
                     'UPDATE IPS_PROCESOSERVER SET PS_SQL = :PS_SQL WHERE PS_ID = ' + SqlValue(Fields[1].AsInteger),
                     'PS_SQL', sdqAux.SQL);

            CommitTrans(True);
          end else
            //ShowMessage('Error en Accion: ' + Fields[1].AsString + ' orden: ' + Fields[2].AsString);
        except
          //ShowMessage('Este query no anda ahora!');
          sdqAux.SQL.SaveToFile('e:\temp\proceso_oracle_' + Fields[1].AsString + '.sql');
        end;
      end;
      Next;
    end;
  finally
    Free;
    sdqAux.Free;
  end;
  *)

  sdqAux := GetQuery('SELECT 1 FROM dual');

  with GetQuery('SELECT ae_sql, ae_idarchivo, ae_orden, pr_codigo, ae_tipoaccion, ar_sql  ' +
                  'FROM impoexpo.ipr_proceso, impoexpo.ipa_procesoaccion, impoexpo.iar_archivo, impoexpo.iae_archivoevento ' +
                 'WHERE ae_idarchivo = pa_relacion ' +
                   ' AND pa_idproceso = pr_id ' +
                   ' AND ae_idarchivo = ar_id ' +
   //                ' AND pr_codigo IN (''REAGA'') '  +
                   ' AND pr_codigo NOT IN (''HSR46'', ''RECVO'') '  +
                   ' AND pa_tipoaccion = ''A'' ' +
                   ' AND ae_fechabaja IS NULL ' +
                   ' AND ar_fechabaja IS NULL ' +
                   ' AND pr_fechabaja IS NULL ') do
  try
    if not IsEmpty then
    while not Eof do
    begin
      sdqAux.Close;

      if TieneAsignacion(Fields[0].AsString) then
      begin
        //ShowMessage('Alarma: ' + Fields[3].AsString);

        try
          //CheckAndOpenQuery(sdqAux, Fields[0].AsString, False);
        except
          //ShowMessage('Este query ya no andaba de antes!');
        end;

        sSQL := ReemplazarAsignaciones(Fields[0].AsString);
        sdqCampos := GetQueryEx('SELECT * from impoexpo.IAC_ARCHIVOCAMPO WHERE ac_idarchivo = :idarchivo', [Fields[1].AsInteger]);
        sdqSql := nil;

        if AreIn(Fields[4].AsString, [ATA_WRITE, ATA_ALL]) then
        begin
          try
            sdqSql := GetQuery(Fields[5].AsString);
            CheckAndOpenQuery(sdqSql, Fields[5].AsString, True);
          except
          end;
        end;

        AParams := TParams.Create(Self);
        try
          { Agrega los Parámetros del Sistema }
          for i := Low(PARAMETROS_ALL) to High(PARAMETROS_ALL) do
          begin
            AParam := TParam.Create(AParams);
            AParam.Name := PARAMETROS_ALL[i];
            AParam.DataType := PARAMETROS_ALL_TIPO[i];
          end;

          if AreIn(Fields[4].AsString, [ATA_WRITE, ATA_ALL]) and Assigned(sdqSql) then
            for i := 0 to sdqSql.Fields.Count - 1 do
            begin
              AParam := TParam.Create(AParams);
              AParam.Name := FIELD_PARAM + sdqSql.Fields[i].FieldName;
              AParam.DataType := sdqSql.Fields[i].DataType;
            end;

          if AreIn(Fields[4].AsString, [ATA_READ, ATA_ALL]) then
            with TDataCycler.Create(sdqCampos) do
            try
              repeat
                AParam := TParam.Create(AParams);
                AParam.Name := FIELD_PARAM + sdqCampos.FieldByName('AC_NOMBRE').AsString;
                AParam.DataType := ftString;
              until not Cycle;
            finally
              Free;
            end;

          { Agrega los Parámetros de los procesos }
          with GetQueryEx('SELECT DISTINCT PP_CODIGO, PP_TIPO ' +
                            'FROM IPA_PROCESOACCION, IPP_PROCESOPARAMETRO ' +
                           'WHERE PA_TIPOACCION = ''' + TA_FILE + ''' ' +
                             'AND PA_IDPROCESO = PP_IDPROCESO ' +
                             'AND (PA_TIPOARCHIVO = :TipoArchivo OR :TipoArchivo = ''' + ATA_ALL + ''') ' +
                             'AND PA_RELACION = :Relacion ',
                          [Fields[4].AsString,
                           Fields[4].AsString,
                           Fields[1].AsInteger]) do
          try
            First;
            while not EOF do
            begin
              AParam := TParam.Create(AParams);
              AParam.Name := FieldByName('PP_CODIGO').AsString;
              AParam.DataType := TipoDatoToFieldType(FieldByName('PP_TIPO').AsString);

              Next;
            end;
          finally
            Free;
          end;

          try
            if CheckAndOpenQuery(sdqAux, sSQL, False, AParams) and (not IsEmptyString(sSQL)) then
            begin
              BeginTrans(True);

              sdqAux.SQL.Text := sSQL;
              SaveBlob('SELECT AE_SQL ' +
                         'FROM IAE_ARCHIVOEVENTO ' +
                        'WHERE AE_IDARCHIVO = ' + SqlValue(Fields[1].AsInteger) + ' ' +
                          'AND AE_ORDEN = ' + SqlValue(Fields[2].AsInteger),

                       'UPDATE IAE_ARCHIVOEVENTO ' +
                          'SET AE_SQL = :AE_SQL ' +
                        'WHERE AE_IDARCHIVO = ' + SqlValue(Fields[1].AsInteger) + ' ' +
                          'AND AE_ORDEN = ' + SqlValue(Fields[2].AsInteger),

                       'AE_SQL', sdqAux.SQL);

              CommitTrans(True);
            end else
              //ShowMessage('Error en Accion: ' + Fields[1].AsString + ' orden: ' + Fields[2].AsString);
          except
            //ShowMessage('Este query no anda ahora!');
            sdqAux.SQL.SaveToFile('e:\temp\impoexpo_' + Fields[3].AsString + '_archivo_' + Fields[1].AsString + '_orden_' + Fields[2].AsString + '.sql');
          end;
        finally
          AParams.Free;
          sdqCampos.free;
          if Assigned(sdqSql) then
            sdqSql.Free;
        end;
      end;
      Next;
    end;
  finally
    Free;
    sdqAux.Free;
  end;
end;

procedure TfrmPrincipal.mnuTercEmpresasClick(Sender: TObject);
begin
  Abrir(TfrmManTercEmpresas, frmManTercEmpresas, tmvMDIChild, mnuTercEmpresas);
end;

procedure TfrmPrincipal.mnuTercUsuariosClick(Sender: TObject);
begin
  Abrir(TfrmManTercUsuarios, frmManTercUsuarios, tmvMDIChild, mnuTercUsuarios);
end;

end.
