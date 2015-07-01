unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ImgList, Placemnt, artSeguridad, Login,
  artDbLogin, Menus, ComCtrls, unCustomPrincipal, JvTrayIcon, JvCaptionButton, AdvOfficeHint,
  JvBackgrounds, XPMenu, JvComponent;
  
type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuManMotivosRechazoDeNomina: TMenuItem;
    mnuManPerfiles: TMenuItem;
    mnuManTiposNominas: TMenuItem;
    mnuAnalisisdeEmision: TMenuItem;
    mnuAdminFacturacion: TMenuItem;
    mnuEmisCargaManualMovimientos: TMenuItem;
    mnuAdminNominas: TMenuItem;
    GestionNotas: TMenuItem;
    mnuMantenimientoGestion: TMenuItem;
    mnuArmadoGestion: TMenuItem;
    unProcesoGestion: TMenuItem;
    mnuConfiguracionSeteo: TMenuItem;
    mnuCargaNotas: TMenuItem;
    mnuEstadodeCuenta: TMenuItem;
    mnuAdminTiposGestion: TMenuItem;
    mnuAccionespObservaciones: TMenuItem;
    mnuTopesSalariales: TMenuItem;
    mnuGruposdeEmision: TMenuItem;
    mnuAdministracionLote: TMenuItem;
    N3: TMenuItem;
    mnuSimulacion: TMenuItem;
    mnuAutorizaciones: TMenuItem;
    AutorizacionesaMovimientosManuales1: TMenuItem;
    mnuGestionAutorizaciones: TMenuItem;
    mnuParmetrosdelSistema: TMenuItem;
    mnuAjustes: TMenuItem;
    mnuCargaporConceptosdeEmision: TMenuItem;
    mnuTiposFormularios: TMenuItem;
    CargaMasivadeFormularios1: TMenuItem;
    mnuManAjustes: TMenuItem;
    mnuCodigosdeMovimientoEmision: TMenuItem;
    mnuConceptosdeAjuste: TMenuItem;
    mnuNivelesdeAutorizacionRequerida: TMenuItem;
    mnuConfiguracion: TMenuItem;
    mnuProgramacindeEjecucion: TMenuItem;
    mnuConsultas: TMenuItem;
    mnuEmpresasAOmitir: TMenuItem;
    mnuReclculodeDevengado: TMenuItem;
    mnuOtrosSolicitantesNota: TMenuItem;
    mnuBlockNotas: TMenuItem;
    N5: TMenuItem;
    mnuConfigEmpresas: TMenuItem;
    mnuEmpresasABonificar: TMenuItem;
    mnuEmpresasSinFondo: TMenuItem;
    mnuEmpresasSdoAcreedor: TMenuItem;
    mnuEmpresasSinTopeo: TMenuItem;
    mnuMotivosAutorizacion: TMenuItem;
    mnuPedidosRecalculo: TMenuItem;
    mnuGestionRecalculo: TMenuItem;
    mnuObservacionesRecalculo: TMenuItem;
    mnuMotivosRecalculo: TMenuItem;
    mnuMantenimientoRecalculo: TMenuItem;
    mnuManAutorizaciones: TMenuItem;
    mnuMantenimientoMotivosAceptDDJJ: TMenuItem;
    mnuMinimosEmpresa: TMenuItem;
    mnuMotivosRechazoSim: TMenuItem;
    mnuEmpresasActividades: TMenuItem;
    mnuEmiSeguimientoProcesos: TMenuItem;
    mnuAnalisisdeEmisionVie: TMenuItem;
    mnuAnalisisdeEmisionNue: TMenuItem;
    mnuConsVisualizador: TMenuItem;
    mnuConsSaldoAcreedorTopes: TMenuItem;
    mnuManEmisAsesoresEmision: TMenuItem;
    mnuEmpresasAAnular: TMenuItem;
    mnuEmpresasSiniestrados: TMenuItem;
    mnuImpoExpoInformacion: TMenuItem;
    mnuIE_GeneracdiferenciasdealtastempranasvsDDJJWF55581: TMenuItem;
    mnuIE_GeneracdiferenciasdealtaswebvsaltastempranasWF58811: TMenuItem;
    mnuIE_GeneraccantidaddiferenciasdealtastempranasvsDDJJWF58811: TMenuItem;
    mnuIE_GeneraccantidaddiferenciasaltaswebvsaltastempranasWF58811: TMenuItem;
    mnuIE_Bajamasivadeeventosdegestdeclientes: TMenuItem;
    mnuIE_Cargamasivadeeventosdegestdeclientes: TMenuItem;
    mnuIE_Cargadeasesoresencontratos: TMenuItem;
    mnuIE_BajadeNotassistemanuevo: TMenuItem;
    mnuIE_ModificacindeNotassistemanuevo: TMenuItem;
    mnuIE_ImportaciondeContratoPeriodopublicadoeneldiscoverer: TMenuItem;
    mnuIE_ImportaciondeCuitPeriodopublicadoeneldiscoverer: TMenuItem;
    mnuIE_DatosdeempleadoressegnAFIP: TMenuItem;
    mnuIE_PasaAutorizacionesylasSimulacionesdeNivel: TMenuItem;
    mnuIE_ActualizacionMasaSalarialyQdeTbjResumendelEstadodeCuentas: TMenuItem;
    mnuIE_Empresasporcodigosiniestradotk1098: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    mnuGestion: TMenuItem;
    mnuAdministracionCartas: TMenuItem;
    mnuConsultaLotes: TMenuItem;
    mnuEmpresasModosPresentacion: TMenuItem;
    mnuIE_InvalidarDDJJ: TMenuItem;
    mnuEmpresasSAC: TMenuItem;
    mnuGestionesPendientes: TMenuItem;
    mnuControlFormularioDeAfiliaciones: TMenuItem;
    mnuAnalisisDiferencias: TMenuItem;
    N12: TMenuItem;
    mnuWeb: TMenuItem;
    mnuMantenimientoUsuarios: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuSalidasLote: TMenuItem;
    mnuArea: TMenuItem;
    mnuFirmante: TMenuItem;
    mnuTextoCarta: TMenuItem;
    mnuTextoMail: TMenuItem;
    mnuGestionables: TMenuItem;
    mnuSolicitantesSitFac: TMenuItem;
    mnuEmpresasReglasSegunLey: TMenuItem;
    EmpresasconLey26773LiqIndem: TMenuItem;
    procedure mnuEmisFormSinPersonalCIndividualClick(Sender: TObject);
    procedure mnuManMotivosRechazodeNominaClick(Sender: TObject);
    procedure mnuManTiposNominasClick(Sender: TObject);
    procedure mnuEmisCargaManualMovimientosClick(Sender: TObject);
    procedure mnuAdminNominasClick(Sender: TObject);
    procedure mnuCargaNotasClick(Sender: TObject);
    procedure mnuConfiguracionSeteoClick(Sender: TObject);
    procedure unProcesoGestionClick(Sender: TObject);
    procedure mnuArmadoGestionClick(Sender: TObject);
    procedure mnuEstadodeCuentaEmisionClick(Sender: TObject);
    procedure mnuAccionespObservacionesClick(Sender: TObject);
    procedure mnuAdminTiposGestionClick(Sender: TObject);
    procedure mnuTopesSalarialesClick(Sender: TObject);
    procedure mnuGruposdeEmisionClick(Sender: TObject);
    procedure mnuAdministracionLoteClick(Sender: TObject);
    procedure mnuSimulacionClick(Sender: TObject);
    procedure mnuParmetrosdelSistemaClick(Sender: TObject);
    procedure mnuTiposFormulariosClick(Sender: TObject);
    procedure mnuNivelesdeAutorizacionRequeridaClick(Sender: TObject);
    procedure mnuCargaporConceptosdeEmisionClick(Sender: TObject);
    procedure mnuGestionAutorizacionesClick(Sender: TObject);
    procedure ExpressButton1Click(Sender: TObject);
    procedure mnuEmpresasAOmitirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuReclculodeDevengadoClick(Sender: TObject);
    procedure mnuAgendaClick(Sender: TObject);
    procedure mnuOtrosSolicitantesNotaClick(Sender: TObject);
    procedure mnuBlockNotasClick(Sender: TObject);
    procedure mnuEmpresasABonificarClick(Sender: TObject);
    procedure mnuEmpresasSinFondoClick(Sender: TObject);
    procedure mnuEmpresasSdoAcreedorClick(Sender: TObject);
    procedure mnuEmpresasSinTopeoClick(Sender: TObject);
    procedure mnuMotivosAutorizacionClick(Sender: TObject);
    procedure mnuPedidosRecalculoClick(Sender: TObject);
    procedure mnuObservacionesRecalculoClick(Sender: TObject);
    procedure mnuMotivosRecalculoClick(Sender: TObject);
    procedure mnuMantenimientoMotivosAceptDDJJClick(Sender: TObject);
    procedure mnuMinimosEmpresaClick(Sender: TObject);
    procedure mnuMotivosRechazoSimClick(Sender: TObject);
    procedure mnuEmpresasActividadesClick(Sender: TObject);
    procedure mnuEmiSeguimientoProcesosClick(Sender: TObject);
    procedure mnuAnalisisdeEmisionNueClick(Sender: TObject);
    procedure mnuAnalisisdeEmisionVieClick(Sender: TObject);
    procedure mnuConsVisualizadorClick(Sender: TObject);
    procedure mnuConsSaldoAcreedorTopesClick(Sender: TObject);
    procedure mnuManEmisAsesoresEmisionClick(Sender: TObject);
    procedure mnuEmpresasAAnularClick(Sender: TObject);
    procedure mnuEmpresasSiniestradosClick(Sender: TObject);
    procedure mnuImpoExpo(Sender: TObject);
    procedure mnuAyudaClick(Sender: TObject);
    procedure mnuAdministracionCartasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuConsultaLotesClick(Sender: TObject);
    procedure mnuControlFormularioDeAfiliacionesClick(Sender: TObject);
    procedure mnuEmpresasModosPresentacionClick(Sender: TObject);
    procedure mnuEmpresasSACClick(Sender: TObject);
    procedure mnuGestionesPendientesClick(Sender: TObject);
    procedure mnuAnalisisDiferenciasClick(Sender: TObject);
    procedure mnuMantenimientoUsuariosClick(Sender: TObject);
    procedure mnuAreaClick(Sender: TObject);
    procedure mnuFirmanteClick(Sender: TObject);
    procedure mnuTextoCartaClick(Sender: TObject);
    procedure mnuTextoMailClick(Sender: TObject);
    procedure mnuGestionablesClick(Sender: TObject);
    procedure mnuSolicitantesSitFacClick(Sender: TObject);
    procedure mnuEmpresasReglasSegunLeyClick(Sender: TObject);
    procedure EmpresasconLey26773LiqIndemClick(Sender: TObject);
//    procedure mnuConsultasClick(Sender: TObject);
  private
  public
  end;

procedure MostrarEstado(const Parrafo: String);

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

uses
  unDmEmision,  unDmPrincipal, unFrmConsultaNotas, unfrmAdmistracionAccionesObservaciones, unFrmAdministracionTopes,
  unfrmGruposContrato, unFrmAdministracionNominas, unfrmEmpresasABonificar, unfrmEmpresasSinFondoHip,
  unFrmEmpresasNoSdoAcre, unfrmEmpresasSinTopeo, unfrmSolicitudRecalculo, unManObservacionesRecalculo,
  unManMotivosRecalculo, unFrmConsultaNotasGestion, unfrmConsultaEmpresaMinimos, unFrmMotivosRechazoSim,
  unFrmEmpresasActividades, unAnalisisDeEmision, unAnalisisEmision, unfrmEmpresasAAnularDev, unFrmEmpresasSAC,
  unComunesGestion, unManGestionables, unFrmSeteos, unFrmAdministracionObservaciones, General, Printers,
  unFrmAdministracionParametros, unFrmTiposFormularios, unFrmAdministracionNivelAutorizacion,
  unFrmSolicitudAutorizacion, unfrmConsultasEmision, unFrmEmpresasAOmitir, unAdminEstadoDeCuenta,
  unManCTC_TEXTOCARTA_EMI, unEspera, unFuncionesEmision, unRecalculoDevengado, unCargaManualMovimientos,
  unSeguimientoProcesos, unAlarmas, unMoldeEnvioMail, unLibretaDeDirecciones, unElementosEnviados,
  unManSolicitantesNotas, unfrmABMBlockNotas, unFrmMotivosAutorizacion, unFrmMotivosAceptacionRechazo,
  unReversionMovimientos, unConsSaldoAcreedorTopes, unManIAS_ASESOREMISION, unImpoExpoWizard,
  unFormularioValidacionYRectificacionDatosEstablecimientos, unFrmEmpresasCodSiniestrados, unWebBrowser,
  unConsultaLotes, unFrmEmpresasTipoPresentacion, unConsultaGestiones, unManCAT_AREATEXTO,
  unManControlCargaAFI, unfrmGestionAnalisisEmision, unManUsuarioWebEmision, unManCFI_FIRMA,
  unComunes, unEMIAdministracionCartas, unManTextoEmailGestion,
  unManSolicitantesSitFac, unFrmEmpresasRegla, unfrmEmpresasLiquidacionIndemnizaciones;

procedure MostrarEstado(const Parrafo: String);
begin
  frmPrincipal.sbEstado.SimpleText := Parrafo;
end;

procedure TfrmPrincipal.mnuEmisFormSinPersonalCIndividualClick(Sender: TObject);
begin
(*
  with TfrmCargaIndividual.Create(self)  do
  try
     Showmodal;
  finally
     free;
  end;
*)
end;

procedure TfrmPrincipal.mnuManMotivosRechazodeNominaClick(Sender: TObject);
begin
  TfrmAdministracionObservaciones.Create(Self);
end;

procedure TfrmPrincipal.mnuManTiposNominasClick(Sender: TObject);
begin
(*
  TfrmManITN_TIPONOMINA.Create( Self );
  mnuManTiposNominas.Enabled := False;
*)
end;

procedure TfrmPrincipal.mnuEmisCargaManualMovimientosClick(Sender: TObject);
begin
  Abrir(TfrmCargaManualMovimientos, frmCargaManualMovimientos, tmvMDIChild, mnuEmisCargaManualMovimientos);
  frmCargaManualMovimientos.Comportamiento := cfEmision;
end;

procedure TfrmPrincipal.mnuAdminNominasClick(Sender: TObject);
begin
  with TfrmAdministracionNominas.Create(Self) do
    Show;
end;

procedure TfrmPrincipal.mnuCargaNotasClick(Sender: TObject);
begin
  TfrmConsultaNotas.Create(Self);
end;

procedure TfrmPrincipal.mnuConfiguracionSeteoClick(Sender: TObject);
begin
  TFrmSeteos.Create(Self);
end;

procedure TfrmPrincipal.unProcesoGestionClick(Sender: TObject);
begin
//  TfrmGestionLote.Create(Self);
end;

procedure TfrmPrincipal.mnuArmadoGestionClick(Sender: TObject);
begin
  TfrmConsultaNotasGestion.Create(Self);
end;

procedure TfrmPrincipal.mnuEstadodeCuentaEmisionClick(Sender: TObject);
begin
  TfrmAdminEstadoDeCuenta.Create(Self);
  mnuEstadodeCuenta.Enabled := False;
end;

procedure TfrmPrincipal.mnuAccionespObservacionesClick(Sender: TObject);
begin
  TfrmAdministracionAccionesObservaciones.Create(Self);
end;

procedure TfrmPrincipal.mnuAdminTiposGestionClick(Sender: TObject);
begin
//  TfrmAdministracionTiposGestion.Create(Self);
end;

procedure TfrmPrincipal.mnuTopesSalarialesClick(Sender: TObject);
begin
  //Administración de los topes salariales.
  TFrmAdministracionTopes.Create(Self);
end;

procedure TfrmPrincipal.mnuGruposdeEmisionClick(Sender: TObject);
begin
  TFrmGruposContrato.Create(Self);
end;

procedure TfrmPrincipal.mnuAdministracionLoteClick(Sender: TObject);
begin
(*
  with TfrmAdministracionLotes.Create(Self) do
  try
    Hide;
    FormStyle := fsNormal;
    Showmodal;
  finally
    Free;
  end;
*)  
end;

procedure TfrmPrincipal.mnuSimulacionClick(Sender: TObject);
begin
(*
  with TFrmSimulacion.Create(self) do
  try
    Hide;
    FormStyle := fsNormal;
    ShowModal;
  finally
    Free;
  end;
*)
end;

procedure TfrmPrincipal.mnuParmetrosdelSistemaClick(Sender: TObject);
begin
  TFrmAdministracionParametros.Create(Self);
end;

procedure TfrmPrincipal.mnuTiposFormulariosClick(Sender: TObject);
begin
  TfrmTiposFormularios.Create(Self);
end;

procedure TfrmPrincipal.mnuNivelesdeAutorizacionRequeridaClick(Sender: TObject);
begin
  TFrmAdministracionNivelesAutorizacion.Create(Self)
(*
 with TFrmAdministracionNivelesAutorizacion.Create(self) do
 try
   FormStyle := fsNormal;
   Hide;
   showmodal;
 finally
   free;
 end;
 *)
end;

procedure TfrmPrincipal.mnuCargaporConceptosdeEmisionClick(Sender: TObject);
begin
//  TfrmConsultaAjustesPorConcepto.Create(self);
end;

procedure TfrmPrincipal.mnuGestionAutorizacionesClick(Sender: TObject);
begin
  TFrmSolicitudAutorizacion.create(Self);
end;

procedure TfrmPrincipal.ExpressButton1Click(Sender: TObject);
begin
 with TFrmAdministracionNivelesAutorizacion.Create(Self) do
 try
   FormStyle := fsNormal;
   Hide;
   showmodal;
 finally
   Free;
 end;
end;

procedure TfrmPrincipal.mnuEmpresasAOmitirClick(Sender: TObject);
begin
  TFrmEmpresasAOmitir.Create(Self);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//  AnimateWindow( Handle, 1000, AW_ACTIVATE or AW_BLEND );
//  RedrawWindow( Handle, nil, 0, RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN );
  inherited;
  IniciarEspera;
  try
    Do_inicializartraza;
  finally
    DetenerEspera;
  end;
  VerificarGestionesPendientes;
end;

procedure TfrmPrincipal.mnuReclculodeDevengadoClick(Sender: TObject);
begin
  with TfrmRecalculoDevengado.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuAgendaClick(Sender: TObject);
begin
//  Abrir(TfrmAdministracionEventosEMISION, frmAdministracionEventosEMISION, tmvMDIChild, mnuAgenda);
end;

procedure TfrmPrincipal.mnuOtrosSolicitantesNotaClick(Sender: TObject);
begin
  TfrmManSolicitantesNota.Create(Self);
  mnuOtrosSolicitantesNota.Enabled := False;
end;

procedure TfrmPrincipal.mnuBlockNotasClick(Sender: TObject);
begin
  TfrmABMBlockNotas.Create(Self);
end;

procedure TfrmPrincipal.mnuEmpresasABonificarClick(Sender: TObject);
begin
  TFrmEmpresasABonificar.Create(Self);
end;

procedure TfrmPrincipal.mnuEmpresasSinFondoClick(Sender: TObject);
begin
  TFrmEmpresasSinFondoHip.Create(Self);
end;

procedure TfrmPrincipal.mnuEmpresasSdoAcreedorClick(Sender: TObject);
begin
  TFrmEmpresasNoSdoAcre.Create(Self);
end;

procedure TfrmPrincipal.mnuEmpresasSinTopeoClick(Sender: TObject);
begin
  TfrmEmpresasSinTopeo.Create(Self);
end;

procedure TfrmPrincipal.mnuMotivosAutorizacionClick(Sender: TObject);
begin
  TfrmMotivosAutorizacion.Create(Self);
end;

procedure TfrmPrincipal.mnuPedidosRecalculoClick(Sender: TObject);
begin
  TfrmPedidosRecalculo.Create(Self);
end;

procedure TfrmPrincipal.mnuObservacionesRecalculoClick(Sender: TObject);
begin
  TfrmManObsRecalculo.Create(Self);
end;

procedure TfrmPrincipal.mnuMotivosRecalculoClick(Sender: TObject);
begin
  TfrmManMotivoRecalculo.Create(Self);
end;

procedure TfrmPrincipal.mnuMantenimientoMotivosAceptDDJJClick(Sender: TObject);
begin
  TfrmMotivosAceptacionRechazo.Create(Self);
end;

procedure TfrmPrincipal.mnuMinimosEmpresaClick(Sender: TObject);
begin
  TfrmConsultaEmpresasMinimos.Create(Self);
end;

procedure TfrmPrincipal.mnuMotivosRechazoSimClick(Sender: TObject);
begin
  TfrmMotivosRechazoSim.Create(Self);
end;

procedure TfrmPrincipal.mnuEmpresasActividadesClick(Sender: TObject);
begin
  TfrmEmpresasActividades.Create(Self);
end;

procedure TfrmPrincipal.mnuEmiSeguimientoProcesosClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoProcesos, frmSeguimientoProcesos, tmvMDIChild, mnuEmiSeguimientoProcesos);
  frmSeguimientoProcesos.Sector := 'EMI';
end;

procedure TfrmPrincipal.mnuAnalisisdeEmisionNueClick(Sender: TObject);
begin
  Abrir(TfrmAnalisisDeEmision, frmAnalisisDeEmision, tmvModal, mnuAnalisisdeEmisionNue);
end;

procedure TfrmPrincipal.mnuAnalisisdeEmisionVieClick(Sender: TObject);
begin
  Abrir(TfrmAnalisisEmision, frmAnalisisEmision, tmvModal, mnuAnalisisdeEmisionVie);
end;

procedure TfrmPrincipal.mnuConsVisualizadorClick(Sender: TObject);
begin
  TfrmConsultas.Create(Self);
end;

procedure TfrmPrincipal.mnuConsSaldoAcreedorTopesClick(Sender: TObject);
begin
  Abrir(TfrmConsSaldoAcreedorTopes, frmConsSaldoAcreedorTopes, tmvMDIChild, mnuConsSaldoAcreedorTopes);
end;

procedure TfrmPrincipal.mnuManEmisAsesoresEmisionClick(Sender: TObject);
begin
  Abrir(TfrmManIAS_ASESOREMISION, frmManIAS_ASESOREMISION, tmvMDIChild, mnuManEmisAsesoresEmision);
end;

procedure TfrmPrincipal.mnuEmpresasAAnularClick(Sender: TObject);
begin
  TfrmEmpresasAAnularDev.Create(Self);
end;

procedure TfrmPrincipal.mnuEmpresasSiniestradosClick(Sender: TObject);
begin
  TfrmEmpresasCodSiniestrados.Create(Self);
end;

procedure TfrmPrincipal.mnuImpoExpo(Sender: TObject);
begin
  ImpoExpoWizard(TMenuItem(Sender).Hint);
end;

procedure TfrmPrincipal.mnuAyudaClick(Sender: TObject);
begin
  with TfrmWebBrowser.Create(Self) do
    LoadUrl(get_parametrobyclave('FILEHELP'));
end;

procedure TfrmPrincipal.mnuAdministracionCartasClick(Sender: TObject);
begin
  Abrir(TfrmEmiAdministracionCartas, frmEmiAdministracionCartas, tmvMDIChild, mnuAdministracionCartas);
  frmEmiAdministracionCartas.Area := AREA_EMI;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Seguridad.Ejecutar;
end;

procedure TfrmPrincipal.mnuConsultaLotesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaLotes, frmConsultaLotes, tmvMDIChild, mnuConsultaLotes);
end;

procedure TfrmPrincipal.mnuControlFormularioDeAfiliacionesClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManControlCargaAFI, frmManControlCargaAFI, tmvMDIChild, mnuControlFormularioDeAfiliaciones);
end;

procedure TfrmPrincipal.mnuEmpresasModosPresentacionClick(Sender: TObject);
begin
  Abrir(TfrmEmpresasTipoPresentacion, frmEmpresasTipoPresentacion, tmvMDIChild, nil);
end;

procedure TfrmPrincipal.mnuEmpresasSACClick(Sender: TObject);
begin
  Abrir(TfrmEmpresasSAC, frmEmpresasSAC, tmvMDIChild, nil);
end;

procedure TfrmPrincipal.mnuGestionesPendientesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaGestiones, frmConsultaGestiones, tmvMDIChild, mnuGestionesPendientes);
  frmConsultaGestiones.ModoForm := mfGestionPendiente;
end;

procedure TfrmPrincipal.mnuAnalisisDiferenciasClick(Sender: TObject);
begin
  TfrmGestionAnalisisEmision.create(Self);
end;

procedure TfrmPrincipal.mnuMantenimientoUsuariosClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManUsuarioWebEmision, frmManUsuarioWebEmision, tmvMDIChild, nil);
end;

procedure TfrmPrincipal.mnuAreaClick(Sender: TObject);
begin
  with TfrmManCAT_AREATEXTO.Create(Self) do
  begin
    Area := aEmision;
    MenuItem := TMenuItem(Sender);
  end;
end;

procedure TfrmPrincipal.mnuFirmanteClick(Sender: TObject);
begin
  with TfrmManCFI_FIRMA.Create(Self) do
  begin
    Area := aEmision;
    MenuItem := TMenuItem(Sender);
  end;
end;

procedure TfrmPrincipal.mnuTextoCartaClick(Sender: TObject);
begin
  with TfrmManCTC_TEXTOCARTA_EMI.Create(Self) do
  begin
    Area := aEmision;
    MenuItem := TMenuItem(Sender);
  end;
end;

procedure TfrmPrincipal.mnuTextoMailClick(Sender: TObject);
begin
  with TfrmManTextoEmailGestion.Create(Self) do
  begin
    MenuItem := TMenuItem(Sender);
  end;
end;

procedure TfrmPrincipal.mnuGestionablesClick(Sender: TObject);
begin
  Abrir(TfrmManGestionables, frmManGestionables, tmvMDIChild, mnuGestionables);
end;

procedure TfrmPrincipal.mnuSolicitantesSitFacClick(Sender: TObject);
begin
  Abrir(TfrmSolicitantesSitFac, frmSolicitantesSitFac, tmvMDIChild, mnuSolicitantesSitFac);
end;

procedure TfrmPrincipal.mnuEmpresasReglasSegunLeyClick(Sender: TObject);
begin
  TfrmEmpresasRegla.Create(Self);
end;

procedure TfrmPrincipal.EmpresasconLey26773LiqIndemClick(Sender: TObject);
begin
  TfrmEmpresasLiquidacionIndemnizaciones.Create(Self);
end;

end.
