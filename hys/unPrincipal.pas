unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ImgList, Placemnt, artSeguridad, Login, artDbLogin, ComCtrls, StdCtrls,
  unArtFrame, unFraStaticCodigoDescripcion, XPMenu, General, unCustomPrincipal,
  unDmPrincipal, unManPRG_RIESGOS, unInfInvestigacionAccidentes,unSeguimientoInvestigacion,
  unConsExpuestos, unABMPRAM, unInfCancerigenos, unManSectores,unSeguimientoAccidente,
  AdvOfficeHint, JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton,
  JvComponentBase, RxPlacemnt;
type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuInformeCancerigenos: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuManPRG_RIESGOS: TMenuItem;
    mnuConsultas: TMenuItem;
    mnuInformes: TMenuItem;
    mnuInfInvestigacionAccidentes: TMenuItem;
    mnuConsExpuestos: TMenuItem;
    mnuABMPRAM: TMenuItem;
    mnuSectores: TMenuItem;
    mnuUsosProductos: TMenuItem;
    mnuMotivosIncumplimiento: TMenuItem;
    mnuFET: TMenuItem;
    mnuCargaPaqueteDatos: TMenuItem;
    mnuManTipoRanking: TMenuItem;
    mnuDefRanking: TMenuItem;
    mnuAutorizaEAS: TMenuItem;
    mnuMantMotivosMovEAS: TMenuItem;
    mnuSeguimientoPQ: TMenuItem;
    mnuAnalisisMotivos: TMenuItem;
    mnuMantPreventores: TMenuItem;
    mnuReasigCP: TMenuItem;
    mnuMantEstablecimientos: TMenuItem;
    mnuPerfiles: TMenuItem;
    mnuGestionEmpresas: TMenuItem;
    mnuActividades: TMenuItem;
    mnuMotivosAsignacionPreventor: TMenuItem;
    mnuEventos: TMenuItem;
    mnuMotivosVisitas: TMenuItem;
    mnuGestionConstruccion: TMenuItem;
    mnuManObservaciones: TMenuItem;
    mnuGestion: TMenuItem;
    mnuConstrucciones: TMenuItem;
    mnuPaquetesDeDatos: TMenuItem;
    mnuPreventores: TMenuItem;
    Establecimientos1: TMenuItem;
    mnuEAS: TMenuItem;
    mnuManFET: TMenuItem;
    mnuControldeAccidentes: TMenuItem;
    mnuTablerodeAccidentes: TMenuItem;
    mnuSeguimientoAccidente: TMenuItem;
    mnuSeguimientoInvestigacion: TMenuItem;
    mnuManEventosAccidentes: TMenuItem;
    mnuVigenciaOperativo: TMenuItem;
    mnuControlEnfermedades: TMenuItem;
    mnuAgendaPrincipal: TMenuItem;
    mnuAutorizacion: TMenuItem;
    mnuViaticos: TMenuItem;
    mnuCargaViaticos: TMenuItem;
    mnuResolucion463: TMenuItem;
    mnuCargaRapidaRes463: TMenuItem;
    mnuRelevRiesgosLabRes463: TMenuItem;
    mnuAnalisisCargaRelevamientos: TMenuItem;
    mnuManRelevObservacion: TMenuItem;
    mnuImportacionSRT: TMenuItem;
    mnuModAsignaciones: TMenuItem;
    mnuInfInvestigacionEnfermedades: TMenuItem;
    mnuInvDifenilos: TMenuItem;
    mnuInvAccMayores: TMenuItem;
    mnuPuestos: TMenuItem;
    mnuControlErgonomia: TMenuItem;
    mnuAmpliaciondePlazos: TMenuItem;
    mnuInfSiniestralidad: TMenuItem;
    mnuConsultadeTareas: TMenuItem;
    mnuErgonomia: TMenuItem;
    mnuManEstadoErgonomia: TMenuItem;
    mnuRelevamientodeExpuestos: TMenuItem;
    mnuCargarSinExpuestos: TMenuItem;
    mnuImportacionNominas: TMenuItem;
    mnuFGRLcargadoporWeb: TMenuItem;
    mnuCotizacion: TMenuItem;
    mnuEstimacionEstablecimientos: TMenuItem;
    mnuZonasCotizacion: TMenuItem;
    mnuCotizacionPrevencion: TMenuItem;
    mnuPlandeVisitas: TMenuItem;
    mnuAsignaciondeVisitas: TMenuItem;
    mnuCargaTareas: TMenuItem;
    mnuEstadisticaIndicadores: TMenuItem;
    mnuPlanVisitasDetalle: TMenuItem;
    mnuCambiodePeriodicidad: TMenuItem;
    mnuSellarDocumento: TMenuItem;
    mnuGestVencidos: TMenuItem;
    mnuAdmVencidos: TMenuItem;
    mnuObservacionesVencidos: TMenuItem;
    mnuConsultoria: TMenuItem;
    mnuControlDenuncias: TMenuItem;
    mnuTareasaRevisar: TMenuItem;
    mnuEstimacionVisitasAnual: TMenuItem;
    mnuAvisodeObraWeb: TMenuItem;
    mnuTableros: TMenuItem;
    mnuEmpresasAltaSiniestralidad: TMenuItem;
    mnuEmpresasPyMes: TMenuItem;
    mnuObras: TMenuItem;
    mnuRarWeb: TMenuItem;
    mnuCargadeVisitasalPlan: TMenuItem;
    mnuImpresionMasiva463: TMenuItem;
    procedure CargadeSinExpuestos1Click(Sender: TObject);
    procedure mnuSalirClick(Sender: TObject);
    procedure mnuMaximizarClick(Sender: TObject);
    procedure mnuRestaurarClick(Sender: TObject);
    procedure mnuMinimizarClick(Sender: TObject);
    procedure mnuCascadaClick(Sender: TObject);
    procedure mnuMosaicoHorizontalClick(Sender: TObject);
    procedure mnuMosaicoVerticalClick(Sender: TObject);
    procedure mnuOrganizarIconosClick(Sender: TObject);
    procedure DBLoginLogin(Sender: TObject);
    procedure Importacindenminas1Click(Sender: TObject);
    procedure mnuInformeCancerigenosClick(Sender: TObject);
    procedure mnuManPRG_RIESGOSClick(Sender: TObject);
    procedure mnuInfInvestigacionAccidentesClick(Sender: TObject);
    procedure mnuConsExpuestosClick(Sender: TObject);
    procedure mnuImpresoraConfigurarClick(Sender: TObject);
    procedure mnuABMPRAMClick(Sender: TObject);
    procedure mnuSectoresClick(Sender: TObject);
    procedure mnuUsosProductosClick(Sender: TObject);
    procedure mnuMotivosIncumplimientoClick(Sender: TObject);
    procedure mnuFETClick(Sender: TObject);
    procedure mnuCargaPaqueteDatosClick(Sender: TObject);
    procedure mnuManTipoRankingClick(Sender: TObject);
    procedure mnuDefRankingClick(Sender: TObject);
    procedure mnuAutorizaEASClick(Sender: TObject);
    procedure mnuMantMotivosMovEASClick(Sender: TObject);
    procedure mnuSeguimientoPQClick(Sender: TObject);
    procedure mnuAnalisisMotivosClick(Sender: TObject);
    procedure mnuMantPreventoresClick(Sender: TObject);
    procedure mnuReasigCPClick(Sender: TObject);
    procedure mnuMantEstablecimientosClick(Sender: TObject);
    procedure mnuPerfilesClick(Sender: TObject);
    procedure mnuGestionEmpresasClick(Sender: TObject);
    procedure mnuActividadesClick(Sender: TObject);
    procedure mnuMotivosAsignacionPreventorClick(Sender: TObject);
    procedure mnuEventosClick(Sender: TObject);
    procedure mnuMotivosVisitasClick(Sender: TObject);
    procedure mnuGestionConstruccionClick(Sender: TObject);
    procedure mnuManObservacionesClick(Sender: TObject);
    procedure mnuControldeAccidentesClick(Sender: TObject);
    procedure mnuSeguimientoAccidenteClick(Sender: TObject);
    procedure mnuSeguimientoInvestigacionClick(Sender: TObject);
    procedure mnuManEventosAccidentesClick(Sender: TObject);
    procedure mnuVigenciaOperativoClick(Sender: TObject);
    procedure mnuControlEnfermedadesClick(Sender: TObject);
    procedure mnuAutorizacionClick(Sender: TObject);
    procedure mnuCargaViaticosClick(Sender: TObject);
    procedure mnuCargaRapidaRes463Click(Sender: TObject);
    procedure mnuRelevRiesgosLabRes463Click(Sender: TObject);
    procedure mnuAnalisisCargaRelevamientosClick(Sender: TObject);
    procedure mnuManRelevObservacionClick(Sender: TObject);
    procedure mnuImportacionSRTClick(Sender: TObject);
    procedure mnuInfInvestigacionEnfermedadesClick(Sender: TObject);
    procedure mnuModAsignacionesClick(Sender: TObject);
    procedure mnuInvDifenilosClick(Sender: TObject);
    procedure mnuPuestosClick(Sender: TObject);
    procedure mnuControlErgonomiaClick(Sender: TObject);
    procedure mnuAmpliaciondePlazosClick(Sender: TObject);
    procedure mnuInfSiniestralidadClick(Sender: TObject);
    procedure mnuConsultadeTareasClick(Sender: TObject);
    procedure mnuManEstadoErgonomiaClick(Sender: TObject);
    procedure mnuFGRLcargadoporWebClick(Sender: TObject);
    procedure mnuInvAccMayoresClick(Sender: TObject);
    procedure mnuEstimacionEstablecimientosClick(Sender: TObject);
    procedure mnuZonasCotizacionClick(Sender: TObject);
    procedure mnuCotizacionPrevencionClick(Sender: TObject);
    procedure mnuAsignaciondeVisitasClick(Sender: TObject);
    procedure mnuCargaTareasClick(Sender: TObject);
    procedure mnuEstadisticaIndicadoresClick(Sender: TObject);
    procedure mnuPlanVisitasDetalleClick(Sender: TObject);
    procedure mnuCambiodePeriodicidadClick(Sender: TObject);
    procedure mnuSellarDocumentoClick(Sender: TObject);
    procedure mnuAdmVencidosClick(Sender: TObject);
    procedure mnuObservacionesVencidosClick(Sender: TObject);
    procedure mnuConsultoriaClick(Sender: TObject);
    procedure mnuControlDenunciasClick(Sender: TObject);
    procedure mnuTareasaRevisarClick(Sender: TObject);
    procedure mnuEstimacionVisitasAnualClick(Sender: TObject);
    procedure mnuAvisodeObraWebClick(Sender: TObject);
    procedure mnuEmpresasAltaSiniestralidadClick(Sender: TObject);
    procedure mnuEmpresasPyMesClick(Sender: TObject);
    procedure mnuObrasClick(Sender: TObject);
    procedure mnuRarWebClick(Sender: TObject);
    procedure mnuCargadeVisitasalPlanClick(Sender: TObject);
    procedure mnuImpresionMasiva463Click(Sender: TObject);
  end;

procedure MostrarEstado(const Parrafo: String);

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unManUsosProductos, unManIncumplimientos, unSolicitudConsultas,
  unManRanking, unDefinicionRanking, unAutorizacionesEAS,
  unManMotivosMovEAS, unSeguimientoPQ, unAnalisisMotivos, unManPreventores,
  unReasignacionCP, unAbmPerfiles, unGestionEmpresasPreventor,
  unManActividades, unManMotivoAsignacionPreventor, unManEventos,
  unManMotivosVisitas, unGestionConstruccion, unManObservaciones, unFet,
  unTipoEstablecimientoPreventor, unImportacionNominas, unManEventosAccidente,
  unManVigenciaOperativo, unControlAccidente,
  unrptAnexo2, unControlEnfermedades,unSeleccionMultiple,
  unAutorizacionAgenda, unCargaDeViaticos, unRelevamientoRiesgosLaborales,
  unRelevamientoCargaRapida, unRelevAnalisisCarga, unManRelevObservacion,
  unImportacionEstablecimientosSRT, unAsignaciones, unInfInvestigacionEnfermedades,
  unConsultaDifenilos, unConsultaAccidentesMayores, unManPuesto, unControlErgonomia,
  unManRelevamientosPactados, unInformesSiniestralidad, unConsultaTareas,
  unManEstadoErgonomia, unManSinExpuestos, unConsultaRelevWeb, unManEstimacionEstablecimiento,
  unManZonaCotizacion, unCotizacionPrevencion, unPlanVisitas, unCargaTareas,
  unEstadisticaIndicadores, unPlanVisitasDetalle, unManFrecuenciaVisita,
  ShellAPI, unAdmVencidos, unManObservacionesVencidos,
  unControlDeEnvioNotasDenuncia, unControlDenunciasRiesgos, unConsultoria,
  unTareasaRevisar, unConsultaVisitasAnual, unAvisoDeObraWeb, unTableroET,
  unTableroEP, unTableroCO, unRARWeb, unVisitasManuales, unImpresionRelevamientoRiesgosLaborales;

{$R *.DFM}

procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
end;

procedure MostrarEstado(const Parrafo: String);
begin
  frmPrincipal.sbEstado.SimpleText := Parrafo;
end;

procedure TfrmPrincipal.CargadeSinExpuestos1Click(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManSinExpuestos, frmManSinExpuestos, tmvMDIChild, mnuCargarSinExpuestos);  
end;

procedure TfrmPrincipal.mnuMaximizarClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmPrincipal.mnuRestaurarClick(Sender: TObject);
begin
  WindowState := wsNormal;
end;

procedure TfrmPrincipal.mnuMinimizarClick(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

procedure TfrmPrincipal.mnuCascadaClick(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmPrincipal.mnuMosaicoHorizontalClick(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TfrmPrincipal.mnuMosaicoVerticalClick(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TfrmPrincipal.mnuOrganizarIconosClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TfrmPrincipal.DBLoginLogin(Sender: TObject);
begin
  Seguridad.Ejecutar;
end;

procedure TfrmPrincipal.Importacindenminas1Click(Sender: TObject);
begin
  inherited;
  Abrir(TfrmImportacionNominas,frmImportacionNominas,tmvMDIChild,mnuImportacionNominas);  
end;

procedure TfrmPrincipal.mnuInformeCancerigenosClick(Sender: TObject);
begin
  TfrmInfCancerigenos.Create(Self);
  mnuInformeCancerigenos.Enabled := False;
end;

procedure TfrmPrincipal.mnuManPRG_RIESGOSClick(Sender: TObject);
begin
  TfrmManPRG_RIESGOS.Create(Self);
  mnuManPRG_RIESGOS.Enabled := False;
end;

procedure TfrmPrincipal.mnuInfInvestigacionAccidentesClick(Sender: TObject);
begin
  TfrmInfInvestigacionAccidentes.Create(Self);
  mnuInfInvestigacionAccidentes.Enabled := False;
end;
            
procedure TfrmPrincipal.mnuConsExpuestosClick(Sender: TObject);
begin
  TfrmConsExpuestos.Create(mnuConsExpuestos);
end;

procedure TfrmPrincipal.mnuImpresionMasiva463Click(Sender: TObject);
begin
  inherited;
  Abrir(TfrmImpresionRelevamientoRiesgosLaborales,frmImpresionRelevamientoRiesgosLaborales,tmvMDIChild,mnuImpresionMasiva463);
end;

procedure TfrmPrincipal.mnuImpresoraConfigurarClick(Sender: TObject);
begin
  PrintDialog.Execute;
end;

procedure TfrmPrincipal.mnuABMPRAMClick(Sender: TObject);
begin
  Abrir(TfrmABMPRAM, frmABMPRAM, tmvMDIChild, mnuABMPRAM);
end;

procedure TfrmPrincipal.mnuSectoresClick(Sender: TObject);
begin
  Abrir(TfrmManSectores, frmManSectores, tmvMDIChild, mnuSectores);
end;

procedure TfrmPrincipal.mnuUsosProductosClick(Sender: TObject);
begin
  Abrir(TfrmManUsosProductos, frmManUsosProductos, tmvMDIChild, mnuSectores);
end;

procedure TfrmPrincipal.mnuMotivosIncumplimientoClick(Sender: TObject);
begin
  Abrir(TfrmManIncumplimientos, frmManIncumplimientos, tmvMDIChild, mnuMotivosIncumplimiento);
end;

procedure TfrmPrincipal.mnuFETClick(Sender: TObject);
begin
  Application.CreateForm(TfrmFet, frmFet);
  try
    frmFet.ShowModal;
  finally
    frmFet.free;
  end;
end;

procedure TfrmPrincipal.mnuCargadeVisitasalPlanClick(Sender: TObject);
begin
  Abrir(TfrmVisitasManuales, frmVisitasManuales, tmvMDIChild, mnuCargadeVisitasalPlan);
end;

procedure TfrmPrincipal.mnuCargaPaqueteDatosClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSolicitudConsultas, frmSolicitudConsultas);
  frmSolicitudConsultas.ShowModal;
end;

procedure TfrmPrincipal.mnuManTipoRankingClick(Sender: TObject);
begin
  Abrir(TfrmManRanking, frmManRanking, tmvMDIChild, mnuManTipoRanking);
end;

procedure TfrmPrincipal.mnuDefRankingClick(Sender: TObject);
begin
  Abrir(TfrmDefRanking, frmDefRanking, tmvMDIChild, mnuDefRanking);
end;

procedure TfrmPrincipal.mnuAutorizaEASClick(Sender: TObject);
begin
  Abrir(TfrmAutorizacionesEAS, frmAutorizacionesEAS, tmvMDIChild, mnuAutorizaEAS);
end;

procedure TfrmPrincipal.mnuMantMotivosMovEASClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosMovEAS, frmManMotivosMovEAS, tmvMDIChild, mnuMantMotivosMovEAS);
end;

procedure TfrmPrincipal.mnuSeguimientoPQClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoPQ, frmSeguimientoPQ, tmvMDIChild, mnuSeguimientoPQ);
end;

procedure TfrmPrincipal.mnuAnalisisMotivosClick(Sender: TObject);
begin
  Abrir(TfrmAnalisisMotivos, frmAnalisisMotivos, tmvMDIChild, mnuAnalisisMotivos);
end;

procedure TfrmPrincipal.mnuMantPreventoresClick(Sender: TObject);
begin
  Abrir(TfrmAbmPreventores, frmAbmPreventores, tmvMDIChild, mnuMantPreventores);
end;

procedure TfrmPrincipal.mnuRarWebClick(Sender: TObject);
begin
  Abrir(TfrmRARWeb, frmRARWeb, tmvMDIChild, mnuRarWeb);
end;

procedure TfrmPrincipal.mnuReasigCPClick(Sender: TObject);
begin
  Abrir(TfrmReasignacionCP, frmReasignacionCP, tmvMDIChild, mnuReasigCP);
end;

procedure TfrmPrincipal.mnuMantEstablecimientosClick(Sender: TObject);
begin
  with TfrmAbmTipoEstablecimientoPreventor.Create(self) do
  try
    ShowModal;
  finally
    free;
  end;
end;

procedure TfrmPrincipal.mnuPerfilesClick(Sender: TObject);
begin
  Abrir(TfrmPerfiles, frmPerfiles, tmvMDIChild, mnuPerfiles);
end;

procedure TfrmPrincipal.mnuGestionEmpresasClick(Sender: TObject);
begin
  Abrir(TfrmGestionEmpresasPreventor, frmGestionEmpresasPreventor, tmvMDIChild, mnuGestionEmpresas);
end;

procedure TfrmPrincipal.mnuActividadesClick(Sender: TObject);
begin
  Abrir(TfrmManActividades,frmManActividades,tmvMDIChild,mnuActividades);
end;

procedure TfrmPrincipal.mnuMotivosAsignacionPreventorClick(Sender: TObject);
begin
  Abrir(TfrmMotivoAsignacionPreventor,frmMotivoAsignacionPreventor,tmvMDIChild,mnuMotivosAsignacionPreventor);
end;

procedure TfrmPrincipal.mnuEventosClick(Sender: TObject);
begin
  Abrir(TfrmManEventos, frmManEventos, tmvMDIChild, mnuEventos);
end;

procedure TfrmPrincipal.mnuMotivosVisitasClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosVisitas,frmManMotivosVisitas,tmvMDIChild,mnuMotivosVisitas);
end;

procedure TfrmPrincipal.mnuGestionConstruccionClick(Sender: TObject);
begin
  Abrir(TfrmGestionConstruccion,frmGestionConstruccion,tmvMDIChild,mnuGestionConstruccion);
end;

procedure TfrmPrincipal.mnuManObservacionesClick(Sender: TObject);
begin
  Abrir(TfrmManObservaciones,frmManObservaciones,tmvMDIChild,mnuManObservaciones);
end;

procedure TfrmPrincipal.mnuControldeAccidentesClick(Sender: TObject);
begin
  Abrir(TfrmControlAccidente, frmControlAccidente, tmvMDIChild, mnuTablerodeAccidentes);
end;

procedure TfrmPrincipal.mnuSeguimientoAccidenteClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoAccidente, frmSeguimientoAccidente, tmvMDIChild, mnuSeguimientoAccidente);
end;

procedure TfrmPrincipal.mnuSeguimientoInvestigacionClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoInvestigacion, frmSeguimientoInvestigacion, tmvMDIChild, mnuSeguimientoInvestigacion);
end;

procedure TfrmPrincipal.mnuManEventosAccidentesClick(Sender: TObject);
begin
  Abrir(TfrmManEventosAccidente, frmManEventosAccidente, tmvMDIChild, mnuManEventosAccidentes);
end;

procedure TfrmPrincipal.mnuVigenciaOperativoClick(Sender: TObject);
begin
  Abrir(TfrmManVigenciaOperativo, frmManVigenciaOperativo, tmvMDIChild, mnuVigenciaOperativo);
end;

procedure TfrmPrincipal.mnuControlEnfermedadesClick(Sender: TObject);
begin
  Abrir(TfrmControlEnfermedades, frmControlEnfermedades, tmvMDIChild, mnuControlEnfermedades);
end;

procedure TfrmPrincipal.mnuAutorizacionClick(Sender: TObject);
begin
  Abrir(TfrmAutorizacionAgenda, frmAutorizacionAgenda, tmvMDIChild, mnuAutorizacion);
end;

procedure TfrmPrincipal.mnuCargaViaticosClick(Sender: TObject);
begin
  Abrir(TfrmCargaDeViaticos, frmCargaDeViaticos, tmvMDIChild, mnuCargaViaticos);
end;

procedure TfrmPrincipal.mnuCargaRapidaRes463Click(Sender: TObject);
begin
  inherited;
  Abrir(TfrmRelevamientoCargaRapida, frmRelevamientoCargaRapida, tmvModal, mnuCargaRapidaRes463);
end;

procedure TfrmPrincipal.mnuRelevRiesgosLabRes463Click(Sender: TObject);
begin
  inherited;
  Abrir(TfrmRelevamientosRiesgosLaborales, frmRelevamientosRiesgosLaborales, tmvModal, mnuRelevRiesgosLabRes463);
end;

procedure TfrmPrincipal.mnuAnalisisCargaRelevamientosClick(
  Sender: TObject);
begin
  inherited;
  Abrir(TFrmRelevAnalisiCarga, frmRelevAnalisiCarga, tmvMDIChild, mnuAnalisisCargaRelevamientos);
end;

procedure TfrmPrincipal.mnuManRelevObservacionClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManRelevObservaciones, frmManRelevObservaciones, tmvMDIChild, mnuManRelevObservacion);
end;

procedure TfrmPrincipal.mnuImportacionSRTClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmImportacionEstablecimientosSRT, frmImportacionEstablecimientosSRT, tmvMDIChild, mnuImportacionSRT);
end;

procedure TfrmPrincipal.mnuInfInvestigacionEnfermedadesClick(Sender: TObject);
begin
  Abrir(TfrmInfInvestigacionEnfermedades, frmInfInvestigacionEnfermedades, tmvMDIChild, mnuInfInvestigacionEnfermedades);
end;

procedure TfrmPrincipal.mnuModAsignacionesClick(Sender: TObject);
begin
  Abrir(TfrmAsignaciones, frmAsignaciones, tmvMDIChild, mnuModAsignaciones);
end;

procedure TfrmPrincipal.mnuInvDifenilosClick(Sender: TObject);
begin
  Abrir(TfrmConsultaDifenilos, frmConsultaDifenilos, tmvMDIChild, mnuInvDifenilos);
end;

procedure TfrmPrincipal.mnuPuestosClick(Sender: TObject);
begin
  Abrir(TfrmManPuesto, frmManPuesto, tmvMDIChild, mnuPuestos);
end;

procedure TfrmPrincipal.mnuControlErgonomiaClick(Sender: TObject);
begin
  Abrir(TfrmControlErgonomia, frmControlErgonomia, tmvMDIChild, mnuControlErgonomia);
end;

procedure TfrmPrincipal.mnuAmpliaciondePlazosClick(Sender: TObject);
begin
  Abrir(TfrmManRelevamientosPactados, frmManRelevamientosPactados, tmvMDIChild, mnuAmpliaciondePlazos);
end;

procedure TfrmPrincipal.mnuInfSiniestralidadClick(Sender: TObject);
begin
  Abrir(TfrmInformesSiniestralidad, frmInformesSiniestralidad, tmvMDIChild, mnuInfSiniestralidad);
end;

procedure TfrmPrincipal.mnuConsultadeTareasClick(Sender: TObject);
begin
  Abrir(TfrmConsultaTareas, frmConsultaTareas, tmvMDIChild, mnuConsultadeTareas);
end;

procedure TfrmPrincipal.mnuManEstadoErgonomiaClick(Sender: TObject);
begin
  Abrir(TfrmManEstadoErgonomia,frmManEstadoErgonomia,tmvMDIChild,mnuManEstadoErgonomia);
end;

procedure TfrmPrincipal.mnuFGRLcargadoporWebClick(Sender: TObject);
begin
  Abrir(TfrmConsultaRelevWeb,frmConsultaRelevWeb,tmvMDIChild,mnuFGRLcargadoporWeb);
end;

procedure TfrmPrincipal.mnuInvAccMayoresClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmConsultaAccMayores, frmConsultaAccMayores, tmvMDIChild, mnuInvAccMayores);
end;

procedure TfrmPrincipal.mnuEstimacionEstablecimientosClick(
  Sender: TObject);
begin
  inherited;
  Abrir(TfrmManEstimacionEstablecimiento, frmManEstimacionEstablecimiento, tmvMDIChild, mnuEstimacionEstablecimientos);
end;

procedure TfrmPrincipal.mnuZonasCotizacionClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManZonaCotizacion, frmManZonaCotizacion, tmvMDIChild, mnuZonasCotizacion);
end;

procedure TfrmPrincipal.mnuCotizacionPrevencionClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmCotizacionPrevencion, frmCotizacionPrevencion, tmvMDIChild, mnuCotizacionPrevencion);
end;

procedure TfrmPrincipal.mnuAsignaciondeVisitasClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmPlanVisitas, frmPlanVisitas, tmvMDIChild, mnuAsignaciondeVisitas);
end;

procedure TfrmPrincipal.mnuCargaTareasClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmCargaTareas, frmCargaTareas, tmvMDIChild, mnuCargaTareas);
end;

procedure TfrmPrincipal.mnuEmpresasAltaSiniestralidadClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmTableroET, frmTableroET, tmvMDIChild, mnuEmpresasAltaSiniestralidad);
end;

procedure TfrmPrincipal.mnuEmpresasPyMesClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmTableroEP, frmTableroEP, tmvMDIChild, mnuEmpresasPyMes);
end;

procedure TfrmPrincipal.mnuEstadisticaIndicadoresClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmEstadisticasIndicadores, frmEstadisticasIndicadores, tmvMDIChild, mnuEstadisticaIndicadores);
end;

procedure TfrmPrincipal.mnuPlanVisitasDetalleClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmPlanVisitasDetalle, frmPlanVisitasDetalle, tmvMDIChild, mnuPlanVisitasDetalle);
end;

procedure TfrmPrincipal.mnuCambiodePeriodicidadClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManFrecuenciaVisita, frmManFrecuenciaVisita, tmvMDIChild, mnuCambiodePeriodicidad);
end;

procedure TfrmPrincipal.mnuSellarDocumentoClick(Sender: TObject);
begin
  inherited;
//  ShellExecute(frmFet.Handle, nil, PAnsiChar('http://www.artprov.com.ar/index.php?pageid=42'),PAnsiChar(sArchivoLOG), nil, SW_SHOWNORMAL);
  ShellExecute(Application.Handle, nil, PChar('http://www.artprov.com.ar/index.php?pageid=42'), '', '', SW_SHOWNORMAL)
end;

procedure TfrmPrincipal.mnuAdmVencidosClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmAdmVencidos, frmAdmVencidos, tmvMDIChild, mnuAdmVencidos);
end;

procedure TfrmPrincipal.mnuObrasClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmTableroCO, frmTableroCO, tmvMDIChild, mnuObras);
end;

procedure TfrmPrincipal.mnuObservacionesVencidosClick(Sender: TObject);
begin
  Abrir(TfrmManObservacionVencidos, frmManObservacionVencidos, tmvMDIChild, mnuObservacionesVencidos);
end;

procedure TfrmPrincipal.mnuConsultoriaClick(Sender: TObject);
begin
  Abrir(TfrmConsultoria, frmConsultoria, tmvMDIChild, mnuConsultoria);
end;

procedure TfrmPrincipal.mnuControlDenunciasClick(Sender: TObject);
begin
  Abrir(TfrmControlDeEnvioNotasDenuncia, frmControlDeEnvioNotasDenuncia, tmvMDIChild, mnuControlDenuncias);

end;

procedure TfrmPrincipal.mnuTareasaRevisarClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmTareasaRevisar, frmTareasaRevisar, tmvMDIChild, mnuTareasaRevisar);
end;

procedure TfrmPrincipal.mnuEstimacionVisitasAnualClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmConsultaVisitasAnual, frmConsultaVisitasAnual, tmvMDIChild, mnuEstimacionVisitasAnual);
end;

procedure TfrmPrincipal.mnuAvisodeObraWebClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmAvisoDeObraWeb, frmAvisoDeObraWeb, tmvMDIChild, mnuAvisodeObraWeb);
end;

end.

