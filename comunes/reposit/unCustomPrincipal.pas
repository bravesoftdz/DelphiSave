unit unCustomPrincipal;

interface

uses
  {$IFDEF VER150} ToolEdit, Placemnt, {$ELSE} rxToolEdit, rxPlacemnt, JvComponentBase, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, ToolWin, ComCtrls, StdCtrls, ImgList, artSeguridad, artDbLogin, Login,
  jpeg, ExtCtrls, JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton, XPMenu, JvThreadTimer, SDEngine, DB, unCustomForm, JvAppHotKey, AdvOfficeHint,
  JvBaseDlg, JvDesktopAlert;
                      
type
  TSIC_AbrirCargaConsulta = procedure(MenuItem: TMenuItem);

  TfrmCustomPrincipal = class(TfrmCustomForm)
    mnuPrincipal: TMainMenu;
    mnuSalir: TMenuItem;
    sbEstado: TStatusBar;
    Mnu_Ventana: TMenuItem;
    mnuMaximizar: TMenuItem;
    mnuRestaurar: TMenuItem;
    mnuMinimizar: TMenuItem;
    sep1: TMenuItem;
    mnuCascada: TMenuItem;
    mnuMosaicoHorizontal: TMenuItem;
    mnuMosaicoVertical: TMenuItem;
    mnuOrganizarIconos: TMenuItem;
    DBLogin: TDBLogin;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    ilSingleImages: TImageList;
    mnuLibretaDeDirecciones: TMenuItem;
    mnuElementosEnviados: TMenuItem;
    JvCaptionButton: TJvCaptionButton;
    JvTrayIcon: TJvTrayIcon;
    JvBackground: TJvBackground;
    N1: TMenuItem;
    mnuVentanas: TMenuItem;
    mnuMantenimientoGeneral: TMenuItem;
    mnuMantenimientoAgenda: TMenuItem;
    mnuRespuestas: TMenuItem;
    mnuAgenda: TMenuItem;
    mnuRevisarEventosPendientes: TMenuItem;
    PrintDialog: TPrintDialog;
    N2: TMenuItem;
    mnuDigitalizacion: TMenuItem;
    mnuFax: TMenuItem;
    mnuElementosEnviadosFax: TMenuItem;
    mnuBandejadeEntrada: TMenuItem;
    AdvOfficeHint: TAdvOfficeHint;
    mnuTiposdeDocumento: TMenuItem;
    mnuDigitalizacionManual: TMenuItem;
    N999: TMenuItem;
    mnuNovedades: TMenuItem;
    mnuFormulariodeValidacinyRectificacindeDatosyEstablecimientos: TMenuItem;
    N7: TMenuItem;
    N11: TMenuItem;
    mnuSRT: TMenuItem;
    mnuVentanillaElectronica: TMenuItem;
    mnuAgendaTelefonica: TMenuItem;
    mnuGeneral: TMenuItem;
    mnuAyuda: TMenuItem;
    separadorrrrr1: TMenuItem;
    mnuGIS: TMenuItem;
    mnuExcepcionesDelGIS: TMenuItem;
    mnuAnexoRes365VentanillaElectronica: TMenuItem;
    mnuRecepcionRelevamientoGeneralRiesgosLaborales: TMenuItem;
    N22: TMenuItem;
    mnuClasificaciondeActivos: TMenuItem;
    mnuClasificacionAct: TMenuItem;
    N23: TMenuItem;
    mnuPlazosdeGuarda: TMenuItem;
    mnuTiposDeActivo: TMenuItem;
    mnuSIC: TMenuItem;
    mnuSICCargaConsulta: TMenuItem;
    mnuSICAgenda: TMenuItem;
    mnuPrepararLote: TMenuItem;
    mnuVerImagen: TMenuItem;
    mnuSMS: TMenuItem;
    mnuEnviarSMS: TMenuItem;
    mnuSMSRecibidos: TMenuItem;
    mnuSMSEnviados: TMenuItem;
    mnuInfoSistema: TMenuItem;
    mnuDocMesaEntradas: TMenuItem;
    N998: TMenuItem;
    tChat: TTimer;
    tjvChatMensaje: TJvDesktopAlert;
    mnuEnviosVentanillaElectronica: TMenuItem;
    procedure mnuSalirClick(Sender: TObject);
    procedure mnuMaximizarClick(Sender: TObject);
    procedure mnuRestaurarClick(Sender: TObject);
    procedure mnuMinimizarClick(Sender: TObject);
    procedure mnuCascadaClick(Sender: TObject);
    procedure mnuMosaicoHorizontalClick(Sender: TObject);
    procedure mnuMosaicoVerticalClick(Sender: TObject);
    procedure mnuOrganizarIconosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLoginLogin(Sender: TObject);
    procedure JvCaptionButtonClick(Sender: TObject);
    procedure JvTrayIconDblClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mnuEnviarCorreoClick(Sender: TObject);
    procedure mnuLibretaDeDireccionesClick(Sender: TObject);
    procedure mnuElementosEnviadosClick(Sender: TObject);
    procedure Mnu_VentanaClick(Sender: TObject);
    procedure mnuVentaShowClick(Sender: TObject);
    procedure mnuAfiConfigurarImpresoraClick(Sender: TObject);
    procedure mnuMantenimientoAgendaClick(Sender: TObject);
    procedure mnuRevisarEventosPendientesClick(Sender: TObject);
    procedure DoEjecutarProcesosAGA(Sender: TObject);
    procedure mnuElementosEnviadosFaxClick(Sender: TObject);
    procedure mnuBandejadeEntradaClick(Sender: TObject);
    procedure mnuTiposdeDocumentoClick(Sender: TObject);
    procedure mnuNovedadesClick(Sender: TObject);
    procedure mnuFormulariodeValidacinyRectificacindeDatosyEstablecimientosClick(Sender: TObject);
    procedure mnuVentanillaElectronicaClick(Sender: TObject);
    procedure mnuAgendaTelefonicaClick(Sender: TObject);
    procedure mnuGISClick(Sender: TObject);
    procedure mnuExcepcionesDelGISClick(Sender: TObject);
    procedure mnuAnexoRes365VentanillaElectronicaClick(Sender: TObject);
    procedure mnuRecepcionRelevamientoGeneralRiesgosLaboralesClick(Sender: TObject);
    procedure mnuPlazosdeGuardaClick(Sender: TObject);
    procedure mnuTiposDeActivoClick(Sender: TObject);
    procedure mnuClasificacionActClick(Sender: TObject);
    procedure mnuSICAgendaClick(Sender: TObject);
    procedure mnuSICCargaConsultaClick(Sender: TObject);
    procedure mnuSICClick(Sender: TObject);
    procedure mnuEnviarSMSClick(Sender: TObject);
    procedure mnuInfoSistemaClick(Sender: TObject);
    procedure mnuSMSRecibidosClick(Sender: TObject);
    procedure mnuDocMesaEntradasClick(Sender: TObject);
    procedure tChatTimer(Sender: TObject);
    procedure AbrirChat(Sender: TObject);
    procedure mnuEnviosVentanillaElectronicaClick(Sender: TObject);
  private
    DLLHandle: THandle;
    FVentanasChat: Integer;
    SIC_AbrirCargaConsulta: TSIC_AbrirCargaConsulta;
    {$IFNDEF LIBRARY}
    procedure DoMostrarInfoSistema;
    {$ENDIF}
  public
    procedure AfterConstruction; override;
  end;

procedure LimpiarEstado;
procedure MostrarEstado(const Parrafo: String);

implementation

uses
  unPrincipal, General, unCustomConsulta, unCITRIX, unDmPrincipal, unSesion, unLibretaDeDirecciones, unMoldeEnvioMail, unElementosEnviados, SpoolFuncs,
  Printers, unArt, StrFuncs, CustomDlgs, DateTimeFuncs,
  {$IFDEF ART2} unCargaDocumentosDigitaliz, unFrmConsultaCarpetas, unFrmArmadoLote, unVerImagenes,
    {$IFDEF AGENDA_SIC}unAgendaCargaConsulta, unAgendaBase, {$ENDIF}{$ENDIF}
  {$IFNDEF LIBRARY}
    unAlarmas, unFaxEnviados, unConsFax, unManRDO_DOCUMENTO, unNovedades, unManCGI_GIS, unAnexoRes365,
    unFormularioValidacionYRectificacionDatosEstablecimientos, unVentanillaElectronica, unExportPDF, unAgendaTelefonica, unGoogleMaps, unRGRL,
    unManCPG_PLAZOGUARDA, unManCTA_TIPOACTIVOS, unClasificacionActivos, unManCVS_VENTANILLA_SUBTEMAS, unEnvioSMS,
    {$IFDEF SISTEMAS} unSMS_BandejaEntrada,{$ENDIF}unDocumentacion,
  {$ENDIF}
  unEspera, unCustomDataModule, unChat, unEnviosVentanillaElectronica;

{$R *.DFM}

procedure TfrmCustomPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
end;

procedure MostrarEstado(const Parrafo: String);
begin
  {$IFDEF RED_PRES}
  frmPrincipal.Sb_BarraDeEstado.SimpleText := Parrafo;
  {$ELSE}
  frmPrincipal.sbEstado.SimpleText := Parrafo;
  {$ENDIF}
end;

procedure LimpiarEstado;
begin
  {$IFDEF RED_PRES}
  frmPrincipal.Sb_BarraDeEstado.SimpleText := '';
  {$ELSE}
  frmPrincipal.sbEstado.SimpleText := '';
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuMaximizarClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmCustomPrincipal.mnuRestaurarClick(Sender: TObject);
begin
  WindowState := wsNormal;
end;

procedure TfrmCustomPrincipal.mnuMinimizarClick(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

procedure TfrmCustomPrincipal.mnuCascadaClick(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmCustomPrincipal.mnuMosaicoHorizontalClick(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TfrmCustomPrincipal.mnuMosaicoVerticalClick(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TfrmCustomPrincipal.mnuOrganizarIconosClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TfrmCustomPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

  Caption := Application.Title + ' - ' + dbLogin.Usuario;

  //Setea los Formatos de la Configuración Regional para la Aplicación
  Application.UpdateFormatSettings := False;
  CurrencyString    := '$';
  DecimalSeparator  := ',';
  ThousandSeparator := '.';
  DateSeparator     := '/';
  TimeSeparator     := ':';
  ShortTimeFormat   := 'HH:mm:ss';
  LongTimeFormat    := 'HH:mm:ss';
  ShortDateFormat   := 'dd/mm/yyyy';

  FVentanasChat := 0;

  IMG_FILTROS_SHOW := 10;
  IMG_FILTROS_HIDE := 11;

  if IsCITRIX then
  begin
    XPMenu.Active := False;
    JvBackground.Image.Picture.Assign(nil);
    JvCaptionButton.Visible := False;
    Color := clBtnFace;
  end;

  {$IFDEF ART2}
  {Hasta que se implemente el sistema lo dejo así...}
  mnuSIC.Visible := (not dmPrincipal.Is_ConectadoProduccion) and (Sesion.UserID = 'PTAVASCI');
  {$ELSE}
  mnuSIC.Visible := False;
  {$ENDIF}

  mnuRevisarEventosPendientes.Visible := False;
  mnuMantenimientoAgenda.Visible      := True; //Ventanilla electrónica
  mnuRespuestas.Visible               := False;

  if Assigned(XPMenu) and IsWin2008Server or IsWindows7 or IsDelphiRunning then
    XPMenu.FlatMenu := False;

  if JvTrayIcon.Hint = 'Provincia A.R.T.' then
    JvTrayIcon.Hint := Application.Title;

  JvBackground.Clients.Add(Self);

  mnuEnviarSMS.Enabled    := Sesion.Sector = 'COMPUTOS';
  mnuSMSRecibidos.Enabled := Sesion.Sector = 'COMPUTOS';
  mnuSMSEnviados.Enabled  := Sesion.Sector = 'COMPUTOS';
  mnuDocMesaEntradas.Enabled := (Seguridad.Activar(mnuDocMesaEntradas) and (Get_CTBEspecial2('TDOCR', '0') = 'S'));
end;

procedure TfrmCustomPrincipal.DBLoginLogin(Sender: TObject);
begin
  Seguridad.Ejecutar;

  mnuClasificacionAct.Enabled := Seguridad.Activar(mnuClasificacionAct) or Sesion.EsJefe or (Sesion.Sector = 'COMPUTOS');
  mnuPlazosdeGuarda.Enabled   := Seguridad.Activar(mnuPlazosdeGuarda) or Sesion.EsJefe or (Sesion.Sector = 'COMPUTOS');
  mnuTiposDeActivo.Enabled    := Seguridad.Activar(mnuTiposDeActivo) or (Sesion.Sector = 'COMPUTOS');
end;

procedure TfrmCustomPrincipal.JvCaptionButtonClick(Sender: TObject);
begin
  JvTrayIcon.Active := True;
  JvTrayIcon.HideApplication;
end;

procedure TfrmCustomPrincipal.JvTrayIconDblClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  JvTrayIcon.ShowApplication;
  JvTrayIcon.Active := False;
end;

procedure TfrmCustomPrincipal.mnuLibretaDeDireccionesClick(Sender: TObject);
begin
  with TfrmLibretaDeDirecciones.Create(Self) do
  begin
    MenuItem := mnuLibretaDeDirecciones;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmCustomPrincipal.mnuEnviarCorreoClick(Sender: TObject);
begin
  EnviarMailBD('', '', [oAlwaysShowDialog, oAutoFirma]);
end;

procedure TfrmCustomPrincipal.mnuElementosEnviadosClick(Sender: TObject);
begin
  with TfrmElementosEnviados.Create(Self) do
  begin
    MenuItem := mnuElementosEnviados;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmCustomPrincipal.Mnu_VentanaClick(Sender: TObject);
var
  i: Integer;
  mnuItem: TMenuItem;
begin
  mnuVentanas.Clear;
  for i := 0 to MDIChildCount - 1 do
  begin
    mnuItem := TMenuItem.Create(MDIChildren[i]);
    mnuItem.Caption := MDIChildren[i].Caption;
    mnuItem.OnClick := mnuVentaShowClick;
    mnuVentanas.Add(mnuItem);
  end;
end;

procedure TfrmCustomPrincipal.tChatTimer(Sender: TObject);
  function CrearAlerta(const aIdSesion: Integer): TJvDesktopAlert;
  begin
    Result := TJvDesktopAlert.Create(Self);

    with Result do
    begin
      AutoFocus := True;
      AutoFree := True;
      Name := 'jvChatMensaje_' + IntToStr(aIdSesion);
      Options := [daoCanClick];
      StyleOptions.DisplayDuration := 7000;
//      StyleOptions.DisplayDuration := 180000;
      Tag := aIdSesion;
    end;
  end;

  function GetTiempo(aHoras, aMinutos, aSegundos: Integer): String;
  begin
    Result := '';

    if aHoras = 1 then
      Result := '1 hora'
    else if aHoras > 1 then
      Result := IntToStr(aHoras) + ' horas';

    if Result <> '' then
      Result := Result + ' y ';

    if aMinutos = 1 then
      Result := Result + '1 minuto'
    else if aMinutos > 1 then
      Result := Result + IntToStr(aMinutos) + ' minutos';

    if (aHoras = 0) and (aMinutos = 0) then
    begin
      if aSegundos = 1 then
        Result := '1 segundo'
      else
        Result := IntToStr(aSegundos) + ' segundos';
    end;

    Result := Trim(Result);
  end;

var
  aAlerta: TJvDesktopAlert;
  sSql: String;
begin
Exit;








  // Actualizo el estado del operador..
  sSql :=
    'UPDATE web.woc_operadoreschat' +
      ' SET oc_estado = ''A'',' +
          ' oc_fechamodif = SYSDATE,' +
          ' oc_usumodif = :usumodif' +
    ' WHERE oc_fechabaja IS NULL' +
      ' AND oc_idusuario = :idusuario';
  EjecutarSqlEx(sSql, [Sesion.UserID, Sesion.ID]);

  // Busco nuevos chats..
  sSql :=
    'SELECT TRUNC((SYSDATE - sc_fechaconexionusuario) * 24) horas,' +
          ' TRUNC((SYSDATE - sc_fechaconexionusuario) * 24 * 60) - (TRUNC((SYSDATE - sc_fechaconexionusuario) * 24) * 60) minutos,' +
          ' sc_fechaconexionusuario, sc_id,' +
          ' TRUNC((SYSDATE - sc_fechaconexionusuario) * 24 * 60 * 60) - (TRUNC((SYSDATE - sc_fechaconexionusuario) * 24 * 60) * 60) segundos' +
     ' FROM web.wsc_sesioneschat, web.woc_operadoreschat' +
    ' WHERE sc_idsectoroperador = oc_idsector' +
      ' AND sc_estado = 1' +
      ' AND oc_estado = ''A''' +
      ' AND TO_DATE(TO_CHAR(SYSDATE, ''hh24:mi''), ''hh24:mi'') BETWEEN TO_DATE(NVL(oc_horarioatencioninicio, ''00:00''), ''hh24:mi'') AND TO_DATE(NVL(oc_horarioatencionfin, ''23:59''), ''hh24:mi'')' +
      ' AND oc_idusuario = :idusuario' +
   ' ORDER BY sc_id';
  with GetQueryEx(sSql, [Sesion.ID]) do
  try
    while not Eof do
    begin
      aAlerta := TJvDesktopAlert(Self.FindComponent('jvChatMensaje_' + IntToStr(FieldByName('sc_id').AsInteger)));
      if not Assigned(aAlerta) then
      begin
        aAlerta := CrearAlerta(FieldByName('sc_id').AsInteger);
        aAlerta.HeaderText := 'CHAT WEB';
        aAlerta.MessageText := Format('[%s] Se ha abierto un nuevo chat desde www.provinciart.com.ar hace %s. Haga clic aquí para responderlo.',
                                     [FieldByName('sc_id').AsString,
                                      GetTiempo(FieldByName('horas').AsInteger, FieldByName('minutos').AsInteger, FieldByName('segundos').AsInteger)]);
        aAlerta.OnMessageClick := AbrirChat;
        aAlerta.Execute;
      end;

      Next;
    end;
  finally
    Free;
  end;
end;

procedure TfrmCustomPrincipal.mnuVentaShowClick(Sender: TObject);
begin
  TForm(TComponent(Sender).Owner).Show;
end;

procedure TfrmCustomPrincipal.mnuAfiConfigurarImpresoraClick(Sender: TObject);
begin
  if PrintDialog.Execute then
    SetDefaultPrinter(Printers.Printer.PrinterIndex);
end;

procedure TfrmCustomPrincipal.mnuMantenimientoAgendaClick(Sender: TObject);
begin
  Abrir(TfrmManCVS_VENTANILLA_SUBTEMAS, frmManCVS_VENTANILLA_SUBTEMAS, tmvMDIChild, mnuMantenimientoAgenda);
end;

procedure TfrmCustomPrincipal.mnuRevisarEventosPendientesClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Alarma.Activar;
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.DoEjecutarProcesosAGA(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  {$IFDEF ART2}
  if Sender = mnuDigitalizacion then
    Abrir(TfrmConsultaCarpetas, frmConsultaCarpetas, tmvMDIChild, mnuDigitalizacion)
  else if Sender = mnuDigitalizacionManual then
    Abrir(TfrmCargaDocumentosDigitaliz, frmCargaDocumentosDigitaliz, tmvModal, mnuDigitalizacionManual)
  else if Sender = mnuPrepararLote then
    Abrir(TFrmArmadoLote, frmArmadoLote, tmvMDIChild, mnuPrepararLote)
  else if Sender = mnuVerImagen then
    Abrir(TfrmVerImagenes, frmVerImagenes, tmvModal, mnuVerImagen);
  {$ENDIF}
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuElementosEnviadosFaxClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmFaxEnviados, frmFaxEnviados, tmvMDIChild, mnuElementosEnviadosFax);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuBandejadeEntradaClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmConsFax, frmConsFax, tmvMDIChild, mnuBandejadeEntrada);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuTiposdeDocumentoClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmManRDO_DOCUMENTO, frmManRDO_DOCUMENTO, tmvMDIChild, mnuTiposdeDocumento);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.AfterConstruction;
begin
  inherited;
end;

procedure TfrmCustomPrincipal.mnuNovedadesClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  MostrarNovedades(True);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuFormulariodeValidacinyRectificacindeDatosyEstablecimientosClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmFormularioValidacionYRectificacionDatosEstablecimientos,
        frmFormularioValidacionYRectificacionDatosEstablecimientos, tmvMDIChild,
        mnuFormulariodeValidacinyRectificacindeDatosyEstablecimientos);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuVentanillaElectronicaClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmVentanillaElectronica, frmVentanillaElectronica, tmvMDIChild, mnuVentanillaElectronica);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuAgendaTelefonicaClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmAgendaTelefonica, frmAgendaTelefonica, tmvMDIChild, mnuAgendaTelefonica);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuGISClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmGoogleMaps, frmGoogleMaps, tmvMDIChild, mnuGIS);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuExcepcionesDelGISClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmManCGI_GIS, frmManCGI_GIS, tmvMDIChild, mnuExcepcionesDelGIS);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuAnexoRes365VentanillaElectronicaClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmAnexoRes365, frmAnexoRes365, tmvMDIChild, mnuAnexoRes365VentanillaElectronica);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuRecepcionRelevamientoGeneralRiesgosLaboralesClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmRGRL, frmRGRL, tmvMDIChild, mnuRecepcionRelevamientoGeneralRiesgosLaborales);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuPlazosdeGuardaClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmManCPG_PLAZOGUARDA, frmManCPG_PLAZOGUARDA, tmvMDIChild, mnuPlazosdeGuarda);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuTiposDeActivoClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmManCTA_TIPOACTIVOS, frmManCTA_TIPOACTIVOS, tmvMDIChild, mnuTiposDeActivo);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuClasificacionActClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmClasificacionActivos, frmClasificacionActivos, tmvMDIChild, mnuClasificacionAct);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuDocMesaEntradasClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmDocumentacion, frmDocumentacion, tmvMDIChild, mnuDocMesaEntradas);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuSICAgendaClick(Sender: TObject);
begin
  {$IFDEF ART2}
  {$IFDEF AGENDA_SIC}
  Abrir(TfrmAgendaBase, frmAgendaBase, tmvMDIChild, mnuSICAgenda);
  {$ENDIF}
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuSICCargaConsultaClick(Sender: TObject);
begin
  {$IFDEF AGENDA_SIC}
  try
    SIC_AbrirCargaConsulta(mnuSICCargaConsulta);
  except
  end;
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuSICClick(Sender: TObject);
begin
  if DLLHandle = 0 then
  begin
    DLLHandle := LoadLibrary('ProvART_SIC_Library.dll');

    if DLLHandle > 0 then
    begin
      @SIC_AbrirCargaConsulta := GetProcAddress(DLLHandle, 'SIC_AbrirCargaConsulta');
    end else
      ShowMessage('No se encontró la librería del Sistema Integrado de Comunicaciones');
  end;
end;

procedure TfrmCustomPrincipal.mnuSMSRecibidosClick(Sender: TObject);
begin
  {$IFDEF SISTEMAS}
  {$IFNDEF LIBRARY}
  Abrir(TfrmSMS_BandejaEntrada, frmSMS_BandejaEntrada, tmvMDIChild, mnuSMSRecibidos);
  {$ENDIF}
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuEnviarSMSClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  Abrir(TfrmEnvioSMS, frmEnvioSMS, tmvModal, mnuEnviarSMS);
  {$ENDIF}
end;

procedure TfrmCustomPrincipal.mnuEnviosVentanillaElectronicaClick(Sender: TObject);
begin
  Abrir(TfrmEnviosVentanillaElectronica, frmEnviosVentanillaElectronica, tmvMDIChild, mnuEnviosVentanillaElectronica);
end;

procedure TfrmCustomPrincipal.mnuInfoSistemaClick(Sender: TObject);
begin
  {$IFNDEF LIBRARY}
  DoMostrarInfoSistema;
  {$ENDIF}
end;

{$IFNDEF LIBRARY}
procedure TfrmCustomPrincipal.DoMostrarInfoSistema;
const
  CANTPAD: Integer = 30;
var
  iDiaSemana: Integer;
  iDiaSemanaBD: Integer;
  Info: TStringList;
  sSep: String;
  sSql: String;
  sValor: String;
begin
  sSep   := Chr(9);
  sValor := '';

  sValor := sValor + RPad('VERSION DEL CLIENTE', ' ', CANTPAD) + sSep + Get_OracleClientVersion() + CRLF;
  sValor := sValor + RPad('LIBRERÍA DE CONEXIÓN CLIENTE', ' ', CANTPAD) + sSep + Get_ClientLibraryLoaded() + CRLF;
  sValor := sValor + RPad('VERSION DE DELPHI', ' ', CANTPAD) + sSep + {$IFDEF VER150}'7'{$ELSE}'XE2'{$ENDIF} + CRLF + CRLF;

  sValor := sValor + RPad('CLIENTE PDF PARA REPORTES', ' ', CANTPAD) + sSep + Iif(IsConversionLocal(teReporte, PDF_EXTENSION), 'SI', 'NO') + CRLF;
  sValor := sValor + RPad('CLIENTE PDF PARA IMAGENES', ' ', CANTPAD) + sSep + Iif(IsConversionLocal(teTif, PDF_EXTENSION), 'SI', 'NO') + CRLF + CRLF;

  sValor       := sValor + RPad('TERRITORIO CLIENTE ORACLE', ' ', CANTPAD) + sSep + Iif(dmPrincipal.VerificarTerritoryDB(), 'BIEN CONFIGURADO', 'MAL CONFIGURADO') + CRLF;
  iDiaSemana   := (4 + (DaysBetween(DBDate(), StrToDate('01/01/2014')) MOD 7)) MOD 7;   // 4 porque 01/01/2014 cae miércoles
  iDiaSemanaBD := ValorSqlInteger('SELECT TO_CHAR(SYSDATE, ''D'') FROM DUAL') MOD 7;
  sValor       := sValor + RPad('HOY ES ' + Ucase(ValorSql('SELECT TRIM(TO_CHAR(SYSDATE, ''day'')) FROM DUAL')), ' ', CANTPAD) + sSep + Iif(iDiaSemana = iDiaSemanaBD, 'BIEN CONFIGURADO', 'MAL CONFIGURADO') + CRLF + CRLF;

  sSql :=
    'SELECT PARAMETER, VALUE' +
     ' FROM NLS_SESSION_PARAMETERS' +
 ' ORDER BY PARAMETER';

  with GetQuery(sSql) do
  try
    while not Eof do
    begin
      sValor := sValor + RPad(Fields[0].AsString, ' ', CANTPAD) + sSep + Fields[1].AsString + CRLF;
      Next;
    end;

    Info := TStringList.Create();
    with Info do
    try
      Text := sValor;
      InputMemoBox('Información del Sistema', Info, True, 0, 'Courier New', False);
    finally
      Info.Free;
    end;
  finally
    Free;
  end;
end;
{$ENDIF}

procedure TfrmCustomPrincipal.AbrirChat(Sender: TObject);
  function GetLeft(const aLeft: Integer): Integer;
  var
    iCoeficiente: Integer;
  begin
    iCoeficiente := FVentanasChat mod 10;
    Result := aLeft + (iCoeficiente * 20)
  end;

  function GetTop(const aTop: Integer): Integer;
  var
    iCoeficiente: Integer;
  begin
    iCoeficiente := FVentanasChat mod 10;
    Result := aTop + (iCoeficiente * 20)
  end;

var
  aChat: TfrmChat;
begin
  aChat := TfrmChat(Self.FindComponent('frmChat_' + IntToStr(TJvDesktopAlert(Sender).Tag)));
  if not Assigned(aChat) then
  begin
    aChat := TfrmChat.Create(Self);
    aChat.IdSesion := TJvDesktopAlert(Sender).Tag;
    aChat.Left := GetLeft(aChat.Left);
    aChat.Name := 'frmChat_' + IntToStr(TJvDesktopAlert(Sender).Tag);
    aChat.Top := GetTop(aChat.Top);
  end;

  aChat.Mostrar;

  Inc(FVentanasChat);
end;

end.
