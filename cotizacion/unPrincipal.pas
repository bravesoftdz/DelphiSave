unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomPrincipal, AdvOfficeHint, JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton,
  artSeguridad, Login, artDbLogin, Menus, ImgList, XPMenu, Placemnt, ComCtrls, JvBaseDlg, JvDesktopAlert, ScktComp, DateUtils, SortDlg, unSeleccionDestinatarios, JvComponentBase,
  RxPlacemnt;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    ClientSocket: TClientSocket;
    ServerSocket: TServerSocket;
    JvDesktopAlert: TJvDesktopAlert;
    mnuCentroComercializacion: TMenuItem;
    mnuSolicitudesdeReafiliacion: TMenuItem;
    mnuSolicitudCotizacion: TMenuItem;
    mnuComercial: TMenuItem;
    mnuTecnica: TMenuItem;
    mnuCotizaciones: TMenuItem;
    mnuPonderados: TMenuItem;
    mnuAdminPonderado: TMenuItem;
    mnuConsultaPonderado: TMenuItem;
    mnuRecotizaciones: TMenuItem;
    mnuReafiliaciones: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuManCanales: TMenuItem;
    mnuManACR_CENTROREGIONAL: TMenuItem;
    mnuEmailsComercial: TMenuItem;
    mnuManAGE_GRUPOECONOMICO: TMenuItem;
    mnuManASU_SUCURSAL: TMenuItem;
    mnuVendedoresPorCanal: TMenuItem;
    mnuZonasGeograficas: TMenuItem;
    mnuManCostoSiniestral: TMenuItem;
    mnuGastosEstructura: TMenuItem;
    mnuReservaCuit: TMenuItem;
    mnuManTarifarioComercial: TMenuItem;
    mnuManTarifarioComercial2006: TMenuItem;
    mnuManTarifarioComercialOriginal: TMenuItem;
    mnuManTarifarioSSN: TMenuItem;
    mnuCantidadDiasClonacion: TMenuItem;
    mnuCIIU: TMenuItem;
    mnuCIIUExcluidos: TMenuItem;
    mnuCIIUNocotizables: TMenuItem;
    mnuCIIUSinDescripcion: TMenuItem;
    mnuMotivos: TMenuItem;
    mnuMotivosCancelacion: TMenuItem;
    mnuMotivosCancelacionRevisionPrecios: TMenuItem;
    mnuMotivosCierre: TMenuItem;
    mnuMotivosExcepcion: TMenuItem;
    mnuMotivosRespuestaRevision: TMenuItem;
    mnuMotivosRevision: TMenuItem;
    mnuParametrosCotizador: TMenuItem;
    mnuPonderadoresPorAno: TMenuItem;
    mnuPonderadoresTipoSiniestro: TMenuItem;
    mnuValorReferenciaCartera: TMenuItem;
    mnuEstCuentaWeb: TMenuItem;
    mnuUsuariosSuscripcion: TMenuItem;
    mnuUsuariosAutorizacion: TMenuItem;
    mnuUsuariosExcepcionYRevision: TMenuItem;
    mnuUsuariosMinutaComisiondeNegocios: TMenuItem;
    mnuUsuariosWeb: TMenuItem;
    mnuUsuariosSolicitudPermisoRevisionLegales: TMenuItem;
    mnuRemitosSolicitudesCargadas: TMenuItem;
    ValorPesosPromedioJuicio: TMenuItem;
    mnuCIIUTipoRiesgo: TMenuItem;
    mnuUsuariosPermisoDescuento: TMenuItem;
    mnuUsuariosPermisoRecargo: TMenuItem;
    mnuCIIUDescuento1raCuota: TMenuItem;
    ResponsabilidadCivil1: TMenuItem;
    mnuSumaAsegurada: TMenuItem;
    mnuSiniestralidad: TMenuItem;
    mnuRangoCapitas: TMenuItem;
    mnuPrestacionMensualGranInvalidez: TMenuItem;
    mnuFactores: TMenuItem;
    mnuManAPC_PERMITECLONACION: TMenuItem;
    mnuManARE_RELACIONESTADOS: TMenuItem;
    mnuEstadosCotizacion: TMenuItem;
    mnuEstadosRevisionPrecio: TMenuItem;
    mnuPrimaMinimaCapita: TMenuItem;
    mnuCuitNoAutocotiza: TMenuItem;
    mnuCampanaF931: TMenuItem;
    mnuTablaIncidenciaInItinereTipoSiniestroCiiu: TMenuItem;
    mnuCoeficientes: TMenuItem;
    mnuCampanaF9312: TMenuItem;
    ControlCampanaF931: TMenuItem;
    mnuSeclos: TMenuItem;
    mnuUsuariosPermisoTarifaMinima: TMenuItem;
    mnuComisionPiso: TMenuItem;
    mnuUsuariosVisualizacionPrestacionesEspeciales: TMenuItem;
    mnuRecepcionExpress: TMenuItem;
    mnuPermisoRecepcionExpress: TMenuItem;
    mnuMinimoCompensacion: TMenuItem;
    mnuCIIUSuspendidosAutomaticamente: TMenuItem;
    mnuMantenimientoComercial: TMenuItem;
    mnuMantenimientoSuscripcion: TMenuItem;
    N10: TMenuItem;
    mnuUsuariosComercial: TMenuItem;
    mnuImportacionInformes: TMenuItem;
    mnuLimiteSSN: TMenuItem;
    mnuObservacionesporCUIT: TMenuItem;
    ServerSocketEndoso: TServerSocket;
    mnuLimiteMicroPyme: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure mnuCentroComercializacionClick(Sender: TObject);
    procedure mnuSolicitudesdeReafiliacionClick(Sender: TObject);
    procedure mnuSolicitudCotizacionClick(Sender: TObject);
    procedure mnuAdminCotizacionClick(Sender: TObject);
    procedure mnuConsultaCotizacionClick(Sender: TObject);
    procedure mnuAdminPonderadoClick(Sender: TObject);
    procedure mnuConsultaPonderadoClick(Sender: TObject);
    procedure mnuRecotizacionesClick(Sender: TObject);
    procedure mnuReafiliacionesClick(Sender: TObject);
    procedure mnuManCanalesClick(Sender: TObject);
    procedure mnuManACR_CENTROREGIONALClick(Sender: TObject);
    procedure mnuEmailsComercialClick(Sender: TObject);
    procedure mnuManAGE_GRUPOECONOMICOClick(Sender: TObject);
    procedure mnuManASU_SUCURSALClick(Sender: TObject);
    procedure mnuVendedoresPorCanalClick(Sender: TObject);
    procedure mnuZonasGeograficasClick(Sender: TObject);
    procedure mnuManCostoSiniestralClick(Sender: TObject);
    procedure mnuGastosEstructuraClick(Sender: TObject);
    procedure mnuReservaCuitClick(Sender: TObject);
    procedure mnuManTarifarioComercial2006Click(Sender: TObject);
    procedure mnuManTarifarioComercialOriginalClick(Sender: TObject);
    procedure mnuManTarifarioSSNClick(Sender: TObject);
    procedure mnuCantidadDiasClonacionClick(Sender: TObject);
    procedure mnuCIIUExcluidosClick(Sender: TObject);
    procedure mnuCIIUNocotizablesClick(Sender: TObject);
    procedure mnuCIIUSinDescripcionClick(Sender: TObject);
    procedure mnuMotivosCancelacionClick(Sender: TObject);
    procedure mnuMotivosCancelacionRevisionPreciosClick(Sender: TObject);
    procedure mnuMotivosCierreClick(Sender: TObject);
    procedure mnuMotivosExcepcionClick(Sender: TObject);
    procedure mnuMotivosRespuestaRevisionClick(Sender: TObject);
    procedure mnuMotivosRevisionClick(Sender: TObject);
    procedure mnuPonderadoresPorAnoClick(Sender: TObject);
    procedure mnuPonderadoresTipoSiniestroClick(Sender: TObject);
    procedure mnuValorReferenciaCarteraClick(Sender: TObject);
    procedure mnuEstCuentaWebClick(Sender: TObject);
    procedure mnuUsuariosAutorizacionClick(Sender: TObject);
    procedure mnuUsuariosExcepcionYRevisionClick(Sender: TObject);
    procedure mnuUsuariosMinutaComisiondeNegociosClick(Sender: TObject);
    procedure mnuUsuariosWebClick(Sender: TObject);
    procedure mnuUsuariosSolicitudPermisoRevisionLegalesClick(Sender: TObject);
    procedure mnuRemitosSolicitudesCargadasClick(Sender: TObject);
    procedure ValorPesosPromedioJuicioClick(Sender: TObject);
    procedure mnuCIIUTipoRiesgoClick(Sender: TObject);
    procedure mnuUsuariosPermisoDescuentoClick(Sender: TObject);
    procedure mnuUsuariosPermisoRecargoClick(Sender: TObject);
    procedure mnuCIIUDescuento1raCuotaClick(Sender: TObject);
    procedure mnuSumaAseguradaClick(Sender: TObject);
    procedure mnuSiniestralidadClick(Sender: TObject);
    procedure mnuRangoCapitasClick(Sender: TObject);
    procedure mnuPrestacionMensualGranInvalidezClick(Sender: TObject);
    procedure mnuFactoresClick(Sender: TObject);
    procedure mnuManAPC_PERMITECLONACIONClick(Sender: TObject);
    procedure mnuManARE_RELACIONESTADOSClick(Sender: TObject);
    procedure mnuEstadosCotizacionClick(Sender: TObject);
    procedure mnuEstadosRevisionPrecioClick(Sender: TObject);
    procedure mnuPrimaMinimaCapitaClick(Sender: TObject);
    procedure mnuCuitNoAutocotizaClick(Sender: TObject);
    procedure mnuTablaIncidenciaInItinereTipoSiniestroCiiuClick(Sender: TObject);
    procedure mnuCoeficientesClick(Sender: TObject);
    procedure mnuCampanaF9312Click(Sender: TObject);
    procedure ControlCampanaF931Click(Sender: TObject);
    procedure mnuSeclosClick(Sender: TObject);
    procedure mnuUsuariosPermisoTarifaMinimaClick(Sender: TObject);
    procedure mnuComisionPisoClick(Sender: TObject);
    procedure ServerSocketClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure mnuUsuariosVisualizacionPrestacionesEspecialesClick(Sender: TObject);
    procedure mnuRecepcionExpressClick(Sender: TObject);
    procedure mnuPermisoRecepcionExpressClick(Sender: TObject);
    procedure mnuMinimoCompensacionClick(Sender: TObject);
    procedure mnuCIIUSuspendidosAutomaticamenteClick(Sender: TObject);
    procedure mnuImportacionInformesClick(Sender: TObject);
    procedure mnuLimiteSSNClick(Sender: TObject);
    procedure mnuObservacionesporCUITClick(Sender: TObject);
    procedure ServerSocketEndosoClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketEndosoClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure mnuLimiteMicroPymeClick(Sender: TObject);
    procedure mnuCotizacionesClick(Sender: TObject);
  private
    FConnected: Boolean;
  public
    procedure SendMsgBySocket(const aTerminalName, aMsg: String; const aPuerto: Integer = 7451);
  end;

var
  frmPrincipal: TfrmPrincipal;

  function GetComputerAndUserName: String;
  function SortNumerico(Sort: TSortDialog): String;
  function ToFloat(sCadena: String; const aDefault: Double = 0): Double; overload;
  function ToStrDec(dNumero: Double; bEliminaDecimales: Boolean): String;

  procedure NotificacionPorMail(const aArea, aMensaje, aAsunto: String; const aTipoRegistro: String; const aIdTipoRegistro: Integer; aDirecciones: String = ''; const aDireccionRespuesta: String = '');
  procedure ShowJvMessage(const HeaderTexto, aMsg: String);

implementation

uses
  unPonderadoresPorAno, unCentroComercializacion, Strfuncs, CustomDlgs, unSesion, unDmPrincipal, General, unMoldeEnvioMail, unReAfiliacion, unConsultaSolicitud,
  unAdminCotizacion, unConsultaCotizacion, unAdminPonderado, unConsultaPonderado, unRecotizaciones, unManACA_CANAL, unManACR_CENTROREGIONAL, unManEmailsComercial,
  unManAGE_GRUPOECONOMICO, unManASU_SUCURSAL, unManVendedoresPorCanal, unZonasGeograficas, unManCostoSiniestral, unReservasCuit, unManTarComercial2006,
  unManTarComercial, unManTarifario, unManCIIUExcluidos, unManCIIUNoAutoCotizables, unManCIIUSinDescripcion, unManMotivosCancelacion,
  unMotivosCancelacionRevisionPrecios, unManMotivosCierre, unManMotivosExcepcion, unManARS_RESPUESTASOLICREAFILIACION, unManMotivosRevision, unPonderadoresTipoSiniestro,
  unManEstCuentaWeb, unUsuariosAutorizacion, unUsuariosExcepcionRevision, unUsuariosMinutaComiteNegocios, unUsuariosWeb, unGastosEstructura, unCotizacion, Numeros,
  unManValorReferenciaCartera, unUsuariosSolicitudPermisoRevisionLegales, unRemitoSolicitudesCargadas, unManCIIUTipoRiesgo, unUsuariosPermisoDescuento,
  unUsuariosPermisoRecargo, unManCIIUDescuentoPrimeraCuota, unManSiniestralidad, unManSumaAsegurada, unManRangoCapitas, unFactoresCotizador, unManAPC_PERMITECLONACION,
  unManARE_RELACIONESTADO, unManPermisoCotizacion, unManPermisoRevisionPrecio, unPrimaMinimaCapita, unCuitsNoAutomaticos, unCampanaF931, unManIncidenciaInItinere,
  unManCoeficientes, unControlCampanaF931, unManSECLOS, unUsuariosPermisoTarifaMinima, unUsuariosVisualizacionPrestacionesEspeciales, unRecepcionSolicitud,
  unUsuariosPermisoRecepcionExpress, unCiiusSuspendidosAutomaticamente, unImportarInformes, unManLimiteSSN, unManObservacionesCuit, unManLimiteMicroPyme;

{$R *.dfm}

function GetComputerAndUserName: String;
begin
  Result := Format('%s/%s', [frmPrincipal.DBLogin.WindowsComputerName, Sesion.UserID]);
end;

function SortNumerico(Sort: TSortDialog): String;
var
  sCadena: String;
  iLoop: Integer;
begin
// Convierte los nombres de los campos en numeros (ubicacion) para poder hacer el Order by de un Select sin importar
// si este usa Nombres No Ascii
  for iLoop := 0 to Sort.SortFields.Count - 1 do
  begin
    if Sort.SortFields.Items[iLoop].Order = otAscending then
      sCadena := sCadena + ', ' + IntToStr(Sort.SortFields.Items[iLoop].Index + 1);
    if Sort.SortFields.Items[iLoop].Order = otDescending then
      sCadena := sCadena + ', ' + IntToStr(Sort.SortFields.Items[iLoop].Index + 1) + ' DESC';
  end;
  if sCadena <> '' then
    Result := ' ORDER BY ' + Copy(sCadena, 2, Length(sCadena) - 1)
  else
    Result := '';
end;

function ToFloat(sCadena: String; const aDefault: Double = 0): Double;
begin
  try
    if (sCadena = '') then
      sCadena := '0';

    sCadena := StrReplace(sCadena, '.',''); //Elimino el punto que es separador de unidades como por ej. "1.000"
    sCadena := Trim(strReplace(sCadena, '$','')); //Elimino el signo $
    sCadena := Trim(StrReplace(sCadena, '%', '')); //Elimino el signo %

    Result := StrToCurr(sCadena);
  except
    Result := aDefault;
  end;
end;

function ToStrDec(dNumero: Double; bEliminaDecimales: Boolean): String;
var
  Valor: String;
begin
  Valor := ToStr(dNumero);
  if (bEliminaDecimales and (Length(Valor) > 3) and (Copy(Valor, Length(Valor) - 2, 3) = ',00')) then
    Valor := Copy(Valor, 0, Length(Valor) - 3);
  Result := Valor;
end;


procedure NotificacionPorMail(const aArea, aMensaje, aAsunto: String; const aTipoRegistro: String; const aIdTipoRegistro: Integer; aDirecciones: String = '';
                              const aDireccionRespuesta: String = '');
var
  sDireccion: String;
  sSql: String;
begin
  // Elige de donde toma las direcciones
  if aDirecciones <> '' then
  begin
    sSql :=
      'SELECT NVL(se_mail, se_usuario)' +
       ' FROM use_usuarios' +
      ' WHERE se_usuario = :V1' +
        ' AND se_fechabaja IS NULL';
    sDireccion := ValorSqlEx(sSql, [aDirecciones]);
    if sDireccion > '' then
      aDirecciones := sDireccion;
  end;

  if aDirecciones = '' then
  begin
    sSql :=
      'SELECT TB_DESCRIPCION' +
       ' FROM CTB_TABLAS' +
      ' WHERE TB_CLAVE = ''MAIL''' +
        ' AND TB_CODIGO = ''' + aArea + '''';
    aDirecciones := ValorSql(sSql, '');
  end;
  aDirecciones := StringReplace(aDirecciones, ';', ',', [rfReplaceAll]);

  EnviarMailBD(aDirecciones, aAsunto, [oAutoFirma, oSinNotaAlPie], aMensaje, nil, 0, tcDefault, False, False, 2500, -1,
               [tdContactoContrato], '', False, aDireccionRespuesta, aTipoRegistro, aIdTipoRegistro);
end;

procedure TfrmPrincipal.SendMsgBySocket(const aTerminalName, aMsg: String; const aPuerto: Integer = 7451);
var
  aStartDate: TDateTime;
begin
  try
    try
      FConnected := False;

      aStartDate := DBDateTime;
      ClientSocket.Port := aPuerto;   //7451 el pedido de recotizacion original, 7452 pedido de endoso.
      ClientSocket.Host := aTerminalName;
      ClientSocket.Open;

      while not FConnected do
      begin
        Application.ProcessMessages;
        if SecondsBetween(DBDateTime, aStartDate) >= 3 then
          Break;
      end;

      ClientSocket.Socket.SendText(aMsg);
    finally
      ClientSocket.Close;
    end;
  except
    //
  end;
end;

procedure ShowJvMessage(const HeaderTexto, aMsg: String);
begin
  with frmPrincipal.JvDesktopAlert do
  begin
    HeaderText := HeaderTexto;
    MessageText := aMsg;

    Execute;
  end;
end;


procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Assigned(frmPonderadoresPorAno)) and (not frmPonderadoresPorAno.CanClose) then
  begin
    frmPonderadoresPorAno.BringToFront;
    InfoHint(frmPonderadoresPorAno, 'La suma de la columna Ponderador debe ser igual a 100.');
    Action := caNone;
    Exit;
  end;

  inherited;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

  if Sesion.Delegacion = 840 then    // Solo abro el socket que escucha si es de capital..
  try
    ServerSocket.Open;
    Application.ProcessMessages;
    ServerSocketEndoso.Open;
    Application.ProcessMessages;
  except
    //
  end;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  inherited;

  try
    ServerSocket.Close;
  except
    //
  end;
end;

procedure TfrmPrincipal.ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  FConnected := True;
end;

procedure TfrmPrincipal.ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  sMsg: String;
  sSql: String;
begin
  if StrToIntDef(Socket.ReceiveText, 0) > 0 then
  try
    sSql :=
      'SELECT em_nombre, sr_nrosolicitud' +
       ' FROM asr_solicitudreafiliacion, aem_empresa' +
      ' WHERE sr_cuit = em_cuit' +
        ' AND sr_id = :id';
    with GetQueryEx(sSql, [Socket.ReceiveText]) do
    try
      sMsg := Format('Se ha cargado la Solicitud de Revisión Nº %d correspondiente a la empresa %s.', [FieldByName('sr_nrosolicitud').AsInteger, FieldByName('em_nombre').AsString]);
    finally
      Free;
    end;

    ShowJvMessage('Solicitud de Revisión de Precio cargada', sMsg);
  except
    //
  end;
end;

procedure TfrmPrincipal.ServerSocketEndosoClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  MsgBox(Format('Server Error %d. Informe a Sistemas de este error, gracias.', [ErrorCode]));
end;

procedure TfrmPrincipal.ServerSocketEndosoClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  sMsg: String;
  sSql: String;
  Text: String;
begin
  Text := StringReplace(Socket.ReceiveText,#$D#$A,'',[rfReplaceAll]);

  if StrToIntDef(Text, 0) > 0 then
  try
    sSql :=
      'SELECT em_nombre, sr_nrosolicitud, et_id' +
       ' FROM asr_solicitudreafiliacion' +
       ' LEFT JOIN aem_empresa ON sr_cuit = em_cuit' +
       '  LEFT JOIN afi.aet_endosotarifario ON et_idrevisionprecios = sr_id ' +
      ' WHERE sr_id = :id';
    with GetQueryEx(sSql, [Text]) do
    try
      sMsg := Format('Se ha cargado un Pedido de Endoso a la Solicitud de Revisión Nº %d correspondiente a la empresa %s.', [FieldByName('sr_nrosolicitud').AsInteger, FieldByName('em_nombre').AsString]);
    finally
      Free;
    end;

    ShowJvMessage('Pedido de Endoso cargado', sMsg);
  except
    //
  end;
end;

procedure TfrmPrincipal.mnuCentroComercializacionClick(Sender: TObject);
begin
  Abrir(TfrmCentroComercializacion, frmCentroComercializacion, tmvMDIChild, mnuCentroComercializacion);
end;

procedure TfrmPrincipal.mnuSolicitudesdeReafiliacionClick(Sender: TObject);
begin
  Abrir(TfrmReAfiliacion, frmReAfiliacion, tmvMDIChild, mnuSolicitudesdeReafiliacion);
  frmReAfiliacion.SetArea;
end;

procedure TfrmPrincipal.mnuSolicitudCotizacionClick(Sender: TObject);
begin
  Abrir(TfrmConsultaSolicitud, frmConsultaSolicitud, tmvMDIChild, mnuSolicitudCotizacion);
end;

procedure TfrmPrincipal.mnuAdminCotizacionClick(Sender: TObject);
begin
//  Abrir(TfrmAdminCotizacion, frmAdminCotizacion, tmvMDIChild, mnuAdminCotizacion);
//  frmAdminCotizacion.DoCargar(0, 'seleccion');
end;

procedure TfrmPrincipal.mnuConsultaCotizacionClick(Sender: TObject);
begin
//  Abrir(TfrmConsultaCotizacion, frmConsultaCotizacion, tmvMDIChild, mnuConsultaCotizacion);
end;

procedure TfrmPrincipal.mnuAdminPonderadoClick(Sender: TObject);
begin
  Abrir(TfrmAdminPonderado, frmAdminPonderado, tmvMDIChild, mnuAdminPonderado);
  frmAdminPonderado.DoCargar(0, 'seleccion');
end;

procedure TfrmPrincipal.mnuConsultaPonderadoClick(Sender: TObject);
begin
  Abrir(TfrmConsultaPonderado, frmConsultaPonderado, tmvMDIChild, mnuConsultaPonderado);
end;

procedure TfrmPrincipal.mnuCotizacionesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaCotizacion, frmConsultaCotizacion, tmvMDIChild, mnuCotizaciones);
end;

procedure TfrmPrincipal.mnuRecotizacionesClick(Sender: TObject);
begin
  Abrir(TfrmRecotizaciones, frmRecotizaciones, tmvMDIChild, mnuRecotizaciones);
end;

procedure TfrmPrincipal.mnuReafiliacionesClick(Sender: TObject);
begin
  Abrir(TfrmReAfiliacion, frmReAfiliacion, tmvMDIChild, mnuReafiliaciones);
  frmReAfiliacion.SetArea;
end;

procedure TfrmPrincipal.mnuManCanalesClick(Sender: TObject);
begin
  Abrir(TfrmManACA_CANAL, frmManACA_CANAL, tmvMDIChild, mnuManCanales);
end;

procedure TfrmPrincipal.mnuManACR_CENTROREGIONALClick(Sender: TObject);
begin
  Abrir(TfrmManACR_CENTROREGIONAL, frmManACR_CENTROREGIONAL, tmvMDIChild, mnuManACR_CENTROREGIONAL);
end;

procedure TfrmPrincipal.mnuEmailsComercialClick(Sender: TObject);
begin
  Abrir(TfrmManEmailsComercial, frmManEmailsComercial, tmvMDIChild, mnuEmailsComercial);
end;

procedure TfrmPrincipal.mnuManAGE_GRUPOECONOMICOClick(Sender: TObject);
begin
  Abrir(TfrmManAGE_GRUPOECONOMICO, frmManAGE_GRUPOECONOMICO, tmvMDIChild, mnuManAGE_GRUPOECONOMICO);
end;

procedure TfrmPrincipal.mnuManASU_SUCURSALClick(Sender: TObject);
begin
  Abrir(TfrmManASU_SUCURSAL, frmManASU_SUCURSAL, tmvMDIChild, mnuManASU_SUCURSAL);
end;

procedure TfrmPrincipal.mnuVendedoresPorCanalClick(Sender: TObject);
begin
  Abrir(TfrmManVendedoresPorCanal, frmManVendedoresPorCanal, tmvMDIChild, mnuVendedoresPorCanal);
end;

procedure TfrmPrincipal.mnuZonasGeograficasClick(Sender: TObject);
begin
  Abrir(TfrmZonasGeograficas, frmZonasGeograficas, tmvMDIChild, mnuZonasGeograficas);
end;

procedure TfrmPrincipal.mnuManCostoSiniestralClick(Sender: TObject);
begin
  Abrir(TfrmManCostoSiniestral, frmManCostoSiniestral, tmvMDIChild, mnuManCostoSiniestral);
end;

procedure TfrmPrincipal.mnuGastosEstructuraClick(Sender: TObject);
begin
  Abrir(TfrmGastosEstructura, frmGastosEstructura, tmvMDIChild, mnuGastosEstructura);
end;

procedure TfrmPrincipal.mnuReservaCuitClick(Sender: TObject);
begin
  Abrir(TfrmReservasCuit, frmReservasCuit, tmvMDIChild, mnuReservaCuit);
end;

procedure TfrmPrincipal.mnuManTarifarioComercial2006Click(Sender: TObject);
begin
  Abrir(TfrmManTarComercial2006, frmManTarComercial2006, tmvMDIChild, mnuManTarifarioComercial2006);
end;

procedure TfrmPrincipal.mnuManTarifarioComercialOriginalClick(Sender: TObject);
begin
  Abrir(TfrmManTarComercial, frmManTarComercial, tmvMDIChild, mnuManTarifarioComercialOriginal);
end;

procedure TfrmPrincipal.mnuManTarifarioSSNClick(Sender: TObject);
begin
  Abrir(TfrmManTarifario, frmManTarifario, tmvMDIChild, mnuManTarifarioSSN);
end;

procedure TfrmPrincipal.mnuCantidadDiasClonacionClick(Sender: TObject);
var
  sCantidad: String;
  sSql: String;
begin
  sCantidad := IntToStr(Get_DICLO);
  if InputQuery('Cantidad Días Clonación', 'Cantidad máxima de días en que una clonación debe variar datos con respecto a una clonada', sCantidad) then
  begin
    if not IsNumber(sCantidad) then
      MsgBox('El valor ingresado no es númérico.')
    else
    begin
      sSql :=
        'UPDATE ctb_tablas' +
          ' SET tb_codigo = :valor' +
        ' WHERE tb_clave = :clave';
      EjecutarSqlEx(sSql, [sCantidad, 'DICLO']);
    end;
  end;
end;

procedure TfrmPrincipal.mnuCIIUExcluidosClick(Sender: TObject);
begin
  Abrir(TfrmManCIIUExcluidos, frmManCIIUExcluidos, tmvMDIChild, mnuCIIUExcluidos);
end;

procedure TfrmPrincipal.mnuCIIUNocotizablesClick(Sender: TObject);
begin
  Abrir(TfrmManCIIUNoAutoCotizables, frmManCIIUNoAutoCotizables, tmvMDIChild, mnuCIIUNocotizables);
end;

procedure TfrmPrincipal.mnuCIIUSinDescripcionClick(Sender: TObject);
begin
  Abrir(TfrmCIIUSinDescripcion, frmCIIUSinDescripcion, tmvMDIChild, mnuCIIUSinDescripcion);
end;

procedure TfrmPrincipal.mnuMotivosCancelacionClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosCancelacion, frmManMotivosCancelacion, tmvMDIChild, mnuMotivosCancelacion);
end;

procedure TfrmPrincipal.mnuMotivosCancelacionRevisionPreciosClick(Sender: TObject);
begin
  Abrir(TfrmMotivosCancelacionRevisionPrecios, frmMotivosCancelacionRevisionPrecios, tmvMDIChild, mnuMotivosCancelacionRevisionPrecios);
end;

procedure TfrmPrincipal.mnuMotivosCierreClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosCierre, frmManMotivosCierre, tmvMDIChild, mnuMotivosCierre);
end;

procedure TfrmPrincipal.mnuMotivosExcepcionClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosExcepcion, frmManMotivosExcepcion, tmvMDIChild, mnuMotivosExcepcion);
end;

procedure TfrmPrincipal.mnuMotivosRespuestaRevisionClick(Sender: TObject);
begin
  Abrir(TfrmManARS_RESPUESTASOLICREAFILIACION, frmManARS_RESPUESTASOLICREAFILIACION, tmvMDIChild, mnuMotivosRespuestaRevision);
end;

procedure TfrmPrincipal.mnuMotivosRevisionClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosRevision, frmManMotivosRevision, tmvMDIChild, mnuMotivosRevision);
end;

procedure TfrmPrincipal.mnuObservacionesporCUITClick(Sender: TObject);
begin
  Abrir(TfrmManObservacionesCuit, frmManObservacionesCuit, tmvMDIChild, mnuObservacionesporCUIT);
end;

procedure TfrmPrincipal.mnuPonderadoresPorAnoClick(Sender: TObject);
begin
  Abrir(TfrmPonderadoresPorAno, frmPonderadoresPorAno, tmvMDIChild, mnuPonderadoresPorAno);
end;

procedure TfrmPrincipal.mnuPonderadoresTipoSiniestroClick(Sender: TObject);
begin
  Abrir(TfrmPonderadoresTipoSiniestro, frmPonderadoresTipoSiniestro, tmvMDIChild, mnuPonderadoresTipoSiniestro);
end;

procedure TfrmPrincipal.mnuValorReferenciaCarteraClick(Sender: TObject);
begin
  Abrir(TfrmManValorReferenciaCartera, frmManValorReferenciaCartera, tmvMDIChild, mnuValorReferenciaCartera);
end;

procedure TfrmPrincipal.mnuEstCuentaWebClick(Sender: TObject);
begin
  Abrir(TfrmManEstCuentaWeb, frmManEstCuentaWeb, tmvMDIChild, mnuEstCuentaWeb);
end;

procedure TfrmPrincipal.mnuUsuariosAutorizacionClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosAutorizacion, frmUsuariosAutorizacion, tmvMDIChild, mnuUsuariosAutorizacion);
end;

procedure TfrmPrincipal.mnuUsuariosExcepcionYRevisionClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosExcepcionRevision, frmUsuariosExcepcionRevision, tmvMDIChild, mnuUsuariosExcepcionYRevision);
end;

procedure TfrmPrincipal.mnuUsuariosMinutaComisiondeNegociosClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosMinutaComiteNegocios, frmUsuariosMinutaComiteNegocios, tmvMDIChild, mnuUsuariosMinutaComisiondeNegocios);
end;

procedure TfrmPrincipal.mnuUsuariosWebClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosWeb, frmUsuariosWeb, tmvMDIChild, mnuUsuariosWeb);
end;

procedure TfrmPrincipal.mnuUsuariosSolicitudPermisoRevisionLegalesClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosSolicitudPermisoRevisionLegales, frmUsuariosSolicitudPermisoRevisionLegales, tmvMDIChild, mnuUsuariosSolicitudPermisoRevisionLegales);
end;

procedure TfrmPrincipal.mnuRemitosSolicitudesCargadasClick(Sender: TObject);
begin
  Abrir(TfrmRemitoSolicitudesCargadas, frmRemitoSolicitudesCargadas, tmvMDIChild, mnuRemitosSolicitudesCargadas);
end;

procedure TfrmPrincipal.ValorPesosPromedioJuicioClick(Sender: TObject);
var
  iValor: Integer;
  sSql: String;
  sValor: String;
begin
  sSql :=
    'SELECT tb_descripcion' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''VPPPJ''' +
      ' AND tb_codigo = ''1''';
  sValor := ValorSql(sSql);

  if InputQuery('Cotizador', 'Valor $ promedio por Juicio', sValor) then
  begin
    if not TryStrToInt(sValor, iValor) then
      MsgBox('El valor ingresado no es entero.')
    else
    begin
      sSql :=
        'UPDATE ctb_tablas' +
          ' SET tb_descripcion = :valor,' +
              ' tb_fechamodif = SYSDATE,' +
              ' tb_usumodif = :usuario' +
        ' WHERE tb_clave = ''VPPPJ''' +
          ' AND tb_codigo = ''1''';
      EjecutarSqlEx(sSql, [sValor, Sesion.UserID]);
    end;
  end;
end;

procedure TfrmPrincipal.mnuCIIUTipoRiesgoClick(Sender: TObject);
begin
  Abrir(TfrmManCIIUTipoRiesgo, frmManCIIUTipoRiesgo, tmvMDIChild, mnuCIIUTipoRiesgo);
end;

procedure TfrmPrincipal.mnuUsuariosPermisoDescuentoClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosPermisoDescuento, frmUsuariosPermisoDescuento, tmvMDIChild, mnuUsuariosPermisoDescuento);
end;

procedure TfrmPrincipal.mnuUsuariosPermisoRecargoClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosPermisoRecargo, frmUsuariosPermisoRecargo, tmvMDIChild, mnuUsuariosPermisoRecargo);
end;

procedure TfrmPrincipal.mnuCIIUDescuento1raCuotaClick(Sender: TObject);
begin
  Abrir(TfrmCIIUDescuentoPrimeraCuota, frmCIIUDescuentoPrimeraCuota, tmvMDIChild, mnuCIIUDescuento1raCuota);
end;

procedure TfrmPrincipal.mnuSumaAseguradaClick(Sender: TObject);
begin
  Abrir(TfrmManSumaAsegurada, frmManSumaAsegurada, tmvMDIChild, mnuSumaAsegurada);
end;

procedure TfrmPrincipal.mnuSiniestralidadClick(Sender: TObject);
begin
  Abrir(TfrmManSiniestralidad, frmManSiniestralidad, tmvMDIChild, mnuSiniestralidad);
end;

procedure TfrmPrincipal.mnuRangoCapitasClick(Sender: TObject);
begin
  Abrir(TfrmManRangoCapitas, frmManRangoCapitas, tmvMDIChild, mnuRangoCapitas);
end;

procedure TfrmPrincipal.mnuPrestacionMensualGranInvalidezClick(Sender: TObject);
var
  iValor: Extended;
  sSql: String;
  sValor: String;
begin
  sSql :=
    'SELECT tb_descripcion' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''VPPPJ''' +
      ' AND tb_codigo = ''2''';
  sValor := StringReplace(ValorSql(sSql), '.', ',', []);

  if InputQuery('Cotizador', 'Prestación Mensual Gran Invalidez', sValor) then
  begin
    if not TryStrToFloat(sValor, iValor) then
      MsgBox('El valor ingresado no es válido.')
    else
    begin
      sSql :=
        'UPDATE ctb_tablas' +
          ' SET tb_descripcion = :valor,' +
              ' tb_fechamodif = SYSDATE,' +
              ' tb_usumodif = :usuario' +
        ' WHERE tb_clave = ''VPPPJ''' +
          ' AND tb_codigo = ''2''';
      EjecutarSqlEx(sSql, [StringReplace(sValor, ',', '.', []), Sesion.UserID]);
    end;
  end;
end;

procedure TfrmPrincipal.mnuFactoresClick(Sender: TObject);
begin
  Abrir(TfrmFactoresCotizador, frmFactoresCotizador, tmvMDIChild, mnuFactores);
end;

procedure TfrmPrincipal.mnuManAPC_PERMITECLONACIONClick(Sender: TObject);
begin
  Abrir(TfrmManAPC_PERMITECLONACION, frmManAPC_PERMITECLONACION, tmvMDIChild, mnuManAPC_PERMITECLONACION);
end;

procedure TfrmPrincipal.mnuManARE_RELACIONESTADOSClick(Sender: TObject);
begin
  Abrir(TfrmManARE_RELACIONESTADO, frmManARE_RELACIONESTADO, tmvMDIChild, mnuManARE_RELACIONESTADOS);
end;

procedure TfrmPrincipal.mnuEstadosCotizacionClick(Sender: TObject);
begin
  Abrir(TfrmManPermisoCotizacion, frmManPermisoCotizacion, tmvMDIChild, mnuEstadosCotizacion);
end;

procedure TfrmPrincipal.mnuEstadosRevisionPrecioClick(Sender: TObject);
begin
  Abrir(TfrmManPermisoRevisionPrecio, frmManPermisoRevisionPrecio, tmvMDIChild, mnuEstadosRevisionPrecio);
end;

procedure TfrmPrincipal.mnuPrimaMinimaCapitaClick(Sender: TObject);
begin
  Abrir(TfrmPrimaMinimaCapita, frmPrimaMinimaCapita, tmvMDIChild, mnuPrimaMinimaCapita);
end;

procedure TfrmPrincipal.mnuCuitNoAutocotizaClick(Sender: TObject);
begin
  Abrir(TfrmCuitsNoAutomaticos, frmCuitsNoAutomaticos, tmvMDIChild, mnuCuitNoAutocotiza);
end;

procedure TfrmPrincipal.mnuTablaIncidenciaInItinereTipoSiniestroCiiuClick(Sender: TObject);
begin
  Abrir(TfrmManIncidenciaInItinere, frmManIncidenciaInItinere, tmvMDIChild, mnuTablaIncidenciaInItinereTipoSiniestroCiiu);
end;

procedure TfrmPrincipal.mnuCoeficientesClick(Sender: TObject);
begin
  Abrir(TfrmManCoeficientes, frmManCoeficientes, tmvMDIChild, mnuCoeficientes);
end;

procedure TfrmPrincipal.mnuCampanaF9312Click(Sender: TObject);
begin
  Abrir(TfrmCampanaF931, frmCampanaF931, tmvMDIChild, mnuCampanaF9312);
end;

procedure TfrmPrincipal.ControlCampanaF931Click(Sender: TObject);
begin
  Abrir(TfrmControlCampanaF931, frmControlCampanaF931, tmvMDIChild, ControlCampanaF931);
end;

procedure TfrmPrincipal.mnuSeclosClick(Sender: TObject);
begin
  Abrir(TfrmManSeclos, frmManSeclos, tmvMDIChild, mnuSeclos);
end;

procedure TfrmPrincipal.mnuUsuariosPermisoTarifaMinimaClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosPermisoTarifaMinima, frmUsuariosPermisoTarifaMinima, tmvMDIChild, mnuUsuariosPermisoTarifaMinima);
end;

procedure TfrmPrincipal.mnuComisionPisoClick(Sender: TObject);
var
  iValor: Extended;
  sSql: String;
  sValor: String;
begin
  sSql :=
    'SELECT tb_descripcion' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''COMPI''' +
      ' AND tb_codigo = ''1''';
  sValor := StringReplace(ValorSql(sSql), '.', ',', []);

  if InputQuery('Administración de Cotizaciones', 'Comisión Piso', sValor) then
  begin
    if not TryStrToFloat(StringReplace(sValor, '.', ',', []), iValor) then
      MsgBox('El valor ingresado no es válido.')
    else
    begin
      sSql :=
        'UPDATE ctb_tablas' +
          ' SET tb_descripcion = :valor,' +
              ' tb_fechamodif = SYSDATE,' +
              ' tb_usumodif = :usuario' +
        ' WHERE tb_clave = ''COMPI''' +
          ' AND tb_codigo = ''1''';
      EjecutarSqlEx(sSql, [StringReplace(sValor, ',', '.', []), Sesion.UserID]);
    end;
  end;
end;

procedure TfrmPrincipal.ServerSocketClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  MsgBox(Format('Server Error %d. Informe a Sistemas de este error, gracias.', [ErrorCode]));
end;

procedure TfrmPrincipal.ClientSocketError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
//  MsgBox(Format('Client Error %d. Informe a Sistemas de este error, gracias.', [ErrorCode]));
  ErrorCode := 0;
end;

procedure TfrmPrincipal.mnuUsuariosVisualizacionPrestacionesEspecialesClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosVisualizacionPrestacionesEspeciales, frmUsuariosVisualizacionPrestacionesEspeciales, tmvMDIChild, mnuUsuariosVisualizacionPrestacionesEspeciales);
end;

procedure TfrmPrincipal.mnuRecepcionExpressClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT 1' +
     ' FROM afi.apv_permisorevisionexpress' +
    ' WHERE pv_usuario = :usuario' +
      ' AND pv_fechabaja IS NULL';
  if ExisteSqlEx(sSql, [Sesion.UserID]) then
    Abrir(TfrmRecepcionSolicitud, frmRecepcionSolicitud, tmvMDIChild, mnuRecepcionExpress)
  else
    MsgBox('Usted no tiene permiso para entrar al módulo de Recepción Epxress.');
end;

procedure TfrmPrincipal.mnuPermisoRecepcionExpressClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosPermisoRecepcionExpress, frmUsuariosPermisoRecepcionExpress, tmvMDIChild, mnuPermisoRecepcionExpress);
end;

procedure TfrmPrincipal.mnuMinimoCompensacionClick(Sender: TObject);
var
  iValor: Extended;
  sSql: String;
  sValor: String;
begin
  sSql :=
    'SELECT tb_descripcion' +
     ' FROM ctb_tablas' +
    ' WHERE tb_clave = ''MINCO''' +
      ' AND tb_codigo = ''1''';
  sValor := StringReplace(ValorSql(sSql), '.', ',', []);

  if InputQuery('Cotizador', 'Mínimo Compensación', sValor) then
  begin
    if not TryStrToFloat(sValor, iValor) then
      MsgBox('El valor ingresado no es válido.')
    else
    begin
      sSql :=
        'UPDATE ctb_tablas' +
          ' SET tb_descripcion = :valor,' +
              ' tb_fechamodif = SYSDATE,' +
              ' tb_usumodif = :usuario' +
        ' WHERE tb_clave = ''MINCO''' +
          ' AND tb_codigo = ''1''';
      EjecutarSqlEx(sSql, [StringReplace(sValor, ',', '.', []), Sesion.UserID]);
    end;
  end;
end;

procedure TfrmPrincipal.mnuCIIUSuspendidosAutomaticamenteClick(Sender: TObject);
begin
  Abrir(TfrmCiiusSuspendidosAutomaticamente, frmCiiusSuspendidosAutomaticamente, tmvMDIChild, mnuCIIUSuspendidosAutomaticamente);
end;

procedure TfrmPrincipal.mnuImportacionInformesClick(Sender: TObject);
begin
  Abrir(TfrmImportarInformes, frmImportarInformes, tmvMDIChild, mnuImportacionInformes);
end;

procedure TfrmPrincipal.mnuLimiteMicroPymeClick(Sender: TObject);
begin
  Abrir(TfrmManLimiteMicroPyme, frmManLimiteMicroPyme, tmvMDIChild, mnuLimiteMicroPyme);
end;

procedure TfrmPrincipal.mnuLimiteSSNClick(Sender: TObject);
begin
  Abrir(TfrmManLimiteSSN, frmManLimiteSSN, tmvMDIChild, mnuLimiteSSN);
end;

end.
