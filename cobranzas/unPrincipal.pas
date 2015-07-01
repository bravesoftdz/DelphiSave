unit unPrincipal;
      
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ImgList, Placemnt, artSeguridad, Login,
  artDbLogin, Menus, ComCtrls, StdCtrls, unArtFrame, XPMenu, JvTrayIcon, JvComponent, JvCaptionButton, JvBackgrounds,
  unCustomPrincipal, AdvOfficeHint, JvComponentBase, RxPlacemnt;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnufrmConsultaPlanes: TMenuItem;
    Cobranzas1: TMenuItem;
    mnuManCobranzas: TMenuItem;
    mnuManCodigodeMovimiento: TMenuItem;
    mnuManVencimientodeCuota: TMenuItem;
    mnuManInteresPorMora: TMenuItem;
    mnuEstadodeCuenta: TMenuItem;
    mnuSeguimientodeValores: TMenuItem;
    mnuEventosValores: TMenuItem;
    mnuDeposito: TMenuItem;
    mnuCobManCartaArea: TMenuItem;
    mnuReclamoAFIP: TMenuItem;
    mnuIngresosdeValores: TMenuItem;
    mnuCompensacion: TMenuItem;
    mnuCompSelecionAprobacion: TMenuItem;
    mnuCompReimpresionCartas: TMenuItem;
    mnuGestion: TMenuItem;
    mnuGestionArmarSelEmpresas: TMenuItem;
    mnuGestionArrancarAccion: TMenuItem;
    mnuCobAdministraciondeCartas: TMenuItem;
    CargadeDisketteAFIP: TMenuItem;
    mnuCobCargaManualMovimientos: TMenuItem;
    mnuCargaDisketteAFIP_Cobranzas: TMenuItem;
    mnuCargaDisketteAFIP_Debitos: TMenuItem;
    mnuCargaDisketteAFIP_RecAnalisis: TMenuItem;
    mnuEnvioSRTCancelaciones: TMenuItem;
    mnuControldeImputacion: TMenuItem;
    mnuControldeImputacionPlanesdePago: TMenuItem;
    mnuControldeImputacionAFIP: TMenuItem;
    mnuGestionExclusionContratos: TMenuItem;
    mnuGestionEmpresasEstado9: TMenuItem;
    N5: TMenuItem;
    mnuExportaciones: TMenuItem;
    mnuGestionEmpresasRescindidas: TMenuItem;
    mnuManCodigoRespReclAFIP: TMenuItem;
    mnuRemesasAFIP: TMenuItem;
    mnuManRedondeoPlanes: TMenuItem;
    mnuCobManCarta: TMenuItem;
    mnuCobManCartaTexto: TMenuItem;
    mnuCobManCartaFirmante: TMenuItem;
    mnuCertificadosRetencion: TMenuItem;
    mnuCobSeguimientoProcesos: TMenuItem;
    mnuControldeImputacionValoresConciliados: TMenuItem;
    mnuCancelaciones: TMenuItem;
    mnuManRedondeoEmision: TMenuItem;
    mnuConfigEmpresas: TMenuItem;
    mnuEmpresasABonificar: TMenuItem;
    mnuGestionEmpresasBajaTraspaso: TMenuItem;
    mnuLibreDeuda: TMenuItem;
    mnuBajaOficioSRTPagos: TMenuItem;
    mnuCompens: TMenuItem;
    mnuCompensSaldoAcreedor: TMenuItem;
    mnuManNivelAutorizacion: TMenuItem;
    mnuPlanesPago: TMenuItem;
    mnuPlanesConsultaHistrico: TMenuItem;
    mnuPlanesConsultaAutorizaciones: TMenuItem;
    mnuCompensIntereses: TMenuItem;
    mnuGestionIndicadoresGestTel: TMenuItem;
    N3: TMenuItem;
    mnuFondoGaranta: TMenuItem;
    mnuFondoGarantiaConsulta: TMenuItem;
    mnuFondoGarantiaPagos: TMenuItem;
    mnuDevolPagoExceso: TMenuItem;
    mnuDevolPagoExcesoConsulta: TMenuItem;
    mnuDevolPagoExcesoPagos: TMenuItem;
    mnuManNivelAutorizacionPlanPago: TMenuItem;
    mnuManNivelAutorizacionBonificacion: TMenuItem;
    mnuControldeImputacionAnulacionRemesas: TMenuItem;
    mnuTableroControl: TMenuItem;
    mnuConsBonificaciones: TMenuItem;
    mnuEmpresasReglasSegunLey: TMenuItem;
    mnuControldeImputacionAjustePCP: TMenuItem;
    mnuManParametros: TMenuItem;
    mnuManGestorDeCuenta: TMenuItem;
    procedure mnuManCodigodeMovimientoClick(Sender: TObject);
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
    procedure mnuManVencimientodeCuotaClick(Sender: TObject);
    procedure mnuManInteresPorMoraClick(Sender: TObject);
    procedure mnuEstadodeCuentaClick(Sender: TObject);
    procedure mnuEventosValoresClick(Sender: TObject);
    procedure mnuSeguimientodeValoresClick(Sender: TObject);
    procedure mnuManTextoClick(Sender: TObject);
    procedure mnuCobManCartaAreaClick(Sender: TObject);
    procedure mnuManCodigodeRecepcionClick(Sender: TObject);
    procedure mnuManFirmanteClick(Sender: TObject);
    procedure mnufrmConsultaPlanesClick(Sender: TObject);
    procedure mnuDepositoClick(Sender: TObject);
    procedure mnuReclamoAFIPClick(Sender: TObject);
    procedure mnuIngresosdeValoresClick(Sender: TObject);
    procedure mnuCompSelecionAprobacionClick(Sender: TObject);
    procedure mnuCompReimpresionCartasClick(Sender: TObject);
    procedure mnuGestionArmarSelEmpresasClick(Sender: TObject);
    procedure mnuGestionArrancarAccionClick(Sender: TObject);
    procedure mnuCobAdministraciondeCartasClick(Sender: TObject);
    procedure CargadeDisketteAFIPClick(Sender: TObject);
    procedure mnuCobCargaManualMovimientosClick(Sender: TObject);
    procedure mnuCargaDisketteAFIP_DebitosClick(Sender: TObject);
    procedure JvCaptionButtonClick(Sender: TObject);
    procedure JvTrayIconDblClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mnuCargaDisketteAFIP_RecAnalisisClick(Sender: TObject);
    procedure mnuEnvioSRTCancelacionesClick(Sender: TObject);
    procedure Mnu_VentanaClick(Sender: TObject);
    procedure mnuVentaShowClick(Sender: TObject);
    procedure mnuControldeImputacionPlanesdePagoClick(Sender: TObject);
    procedure mnuControldeImputacionAFIPClick(Sender: TObject);
    procedure mnuGestionExclusionContratosClick(Sender: TObject);
    procedure mnuGestionEmpresasEstado9Click(Sender: TObject);
    procedure mnuGestionEmpresasRescindidasClick(Sender: TObject);
    procedure mnuExportacionesClick(Sender: TObject);
    procedure mnuManCodigoRespReclAFIPClick(Sender: TObject);
    procedure mnuRemesasAFIPClick(Sender: TObject);
    procedure mnuManRedondeoPlanesClick(Sender: TObject);
    procedure mnuCertificadosRetencionClick(Sender: TObject);
    procedure mnuCobSeguimientoProcesosClick(Sender: TObject);
    procedure mnuControldeImputacionValoresConciliadosClick(Sender: TObject);
    procedure mnuCancelacionesClick(Sender: TObject);
    procedure mnuManRedondeoEmisionClick(Sender: TObject);
    procedure mnuEmpresasABonificarClick(Sender: TObject);
    procedure mnuGestionEmpresasBajaTraspasoClick(Sender: TObject);
    procedure mnuLibreDeudaClick(Sender: TObject);
    procedure mnuBajaOficioSRTPagosClick(Sender: TObject);
    procedure mnuCompensSaldoAcreedorClick(Sender: TObject);
    procedure mnuPlanesConsultaHistricoClick(Sender: TObject);
    procedure mnuPlanesConsultaAutorizacionesClick(Sender: TObject);
    procedure mnuCompensInteresesClick(Sender: TObject);
    procedure mnuGestionIndicadoresGestTelClick(Sender: TObject);
    procedure mnuFondoGarantiaConsultaClick(Sender: TObject);
    procedure mnuFondoGarantiaPagosClick(Sender: TObject);
    procedure mnuDevolPagoExcesoConsultaClick(Sender: TObject);
    procedure mnuDevolPagoExcesoPagosClick(Sender: TObject);
    procedure mnuManNivelAutorizacionPlanPagoClick(Sender: TObject);
    procedure mnuManNivelAutorizacionBonificacionClick(Sender: TObject);
    procedure mnuControldeImputacionAnulacionRemesasClick(Sender: TObject);
    procedure mnuTableroControlClick(Sender: TObject);
    procedure mnuConsBonificacionesClick(Sender: TObject);
    procedure mnuEmpresasReglasSegunLeyClick(Sender: TObject);
    procedure mnuControldeImputacionAjustePCPClick(Sender: TObject);
    procedure mnuManParametrosClick(Sender: TObject);
    procedure mnuManGestorDeCuentaClick(Sender: TObject);
  end;

procedure MostrarEstado(const Parrafo: String);

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

uses
  unDmPrincipal, unConsultaPlanes, unCargaDepositoManual, CustomDlgs, unManCodigoMovimiento, unManVencimientoCuota,
  unManInteresPorMora, unConsultaEstadoDeCuenta, unAdminEstadoDeCuenta, unManCTB_EVCHE, unSeguimientoDeValores,
  unManCTC_TEXTOCARTA, AnsiSql, unManCAT_AREATEXTO, unManCFI_FIRMA, unManCTB_CODRE, unManCtbTablas, unReclamoAFIP,
  unIngresoValores, unComunes, unCompSelecionAprobacion, unCompReimpresionCartas, unGestionArmarSelEmpresas,
  unGestionArrancarAccion, unCobAdministracionCartas,
  unCargaManualMovimientos, unImpoExpoWizard, General, unRecaudacionAnalisis, unCITRIX,
  unMoldeEnvioMail, unLibretaDeDirecciones, unElementosEnviados, unManCRR_RESPUESTA, unAlarmas,
  unControlImputacion, unControlImputacionAFIP, unManExclusionContratos, unEmpresasEstado9, unEmpresasRescindidas,
  unExportaciones, unManCtbRespReclAFIP, unRemesasAFIP, unSeguimientoProcesos,
  unManZRP_REDONDEOPLAN, unCargaCertificadoRetencion, SpoolFuncs, Printers, unReversionMovimientos,
  unValoresConciliados, unConsultaCancelaciones, unManRedondeosEmision, unConsFax, unFaxEnviados,
  unNovedades, unFormularioValidacionYRectificacionDatosEstablecimientos,
  unfrmEmpresasABonificar, unEmpresasBajaTraspaso, unLibreDeuda, unBajaOficioSRTPagos, unCompensarDeuda,
  unNivelAutorizacion, unHistoricoPlanesPago, unConsultaAutorizaciones, unCompensarIntereses, unIndicadoresGestionTel,
  unFondoGarantia, unPagosFondoGarantia, unDevolPagoExcesoCons, unDevolPagoExcesoPagos, unNivelAutorizacionBonif,
  unAnularcionRemesas, ShellAPI, unConsultaBonificaciones, unFrmEmpresasRegla, unMovimientosCUILAFIP,
  unManParametros, unManAGC_GESTORCUENTA;

procedure MostrarEstado(const Parrafo: String);
begin
  frmPrincipal.sbEstado.SimpleText := Parrafo;
end;

procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
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

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  if Alarma.Saludo then
    MostrarAlarma(Application.Title, 'Bienvenido al sistema de cobranzas.');
end;

procedure TfrmPrincipal.DBLoginLogin(Sender: TObject);
begin
  Seguridad.Ejecutar;
end;

procedure TfrmPrincipal.mnuManCodigodeMovimientoClick(Sender: TObject);
begin
  frmManCodigoMovimiento.Free;
  frmManCodigoMovimiento := TfrmManCodigoMovimiento.Create(Self);
  frmManCodigoMovimiento.Area := aCobranzas;
  mnuManCodigodeMovimiento.Enabled := False;
end;

procedure TfrmPrincipal.mnuManVencimientodeCuotaClick(Sender: TObject);
begin
  Abrir(TfrmManVencimientoCuota, frmManVencimientoCuota, tmvMDIChild, mnuManVencimientodeCuota);
end;

procedure TfrmPrincipal.mnuManInteresPorMoraClick(Sender: TObject);
begin
  frmManInteresPorMora.Free;
  frmManInteresPorMora := TfrmManInteresPorMora.Create(Self);
end;

procedure TfrmPrincipal.mnuEstadodeCuentaClick(Sender: TObject);
begin
  frmConsultaEstadoDeCuenta.Free;
  frmConsultaEstadoDeCuenta := TfrmConsultaEstadoDeCuenta.Create(Self);
  mnuEstadodeCuenta.Enabled := False;
end;

procedure TfrmPrincipal.mnuEventosValoresClick(Sender: TObject);
begin
  with TfrmManCTB_EVCHE.Create(Self) do
  begin
    MenuItem  := TMenuItem(Sender);
    FormStyle := fsMDIChild;
    Area      := aCobranzas;
  end;
end;

procedure TfrmPrincipal.mnuSeguimientodeValoresClick(Sender: TObject);
begin
  frmSeguimientoDeValores.Free;
  frmSeguimientoDeValores := TfrmSeguimientoDeValores.Create(Self);
end;

procedure TfrmPrincipal.mnuManTextoClick(Sender: TObject);
begin
  with TfrmManCTC_TEXTOCARTA.Create(Self) do
    begin
      Area := aCobranzas;
      MenuItem := TMenuItem(Sender);
    end
end;

procedure TfrmPrincipal.mnuCobManCartaAreaClick(Sender: TObject);
begin
  with TfrmManCAT_AREATEXTO.Create(Self) do
    begin
      Area := aCobranzas;
      MenuItem := TMenuItem(Sender);
    end
end;

procedure TfrmPrincipal.mnuManCodigodeRecepcionClick(Sender: TObject);
begin
  with TfrmManCTB_CODRE.Create(Self) do
  begin
    MenuItem  := TMenuItem(Sender);
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuManFirmanteClick(Sender: TObject);
begin
  with TfrmManCFI_FIRMA.Create(Self) do
    begin
      Area := aCobranzas;
      MenuItem := TMenuItem(Sender);
    end
end;

procedure TfrmPrincipal.mnuManGestorDeCuentaClick(Sender: TObject);
begin
  Abrir(TfrmManAGC_GESTORCUENTA, frmManAGC_GESTORCUENTA, tmvMDIChild, mnuManGestorDeCuenta);
  frmManAGC_GESTORCUENTA.EsEstudio := False;
end;

procedure TfrmPrincipal.mnufrmConsultaPlanesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaPlanes, frmConsultaPlanes, tmvMDIChild, mnufrmConsultaPlanes);
end;

procedure TfrmPrincipal.mnuDepositoClick(Sender: TObject);
begin
  frmCargaDepositoManual.Free;
  frmCargaDepositoManual := TfrmCargaDepositoManual.Create(Self);
end;

procedure TfrmPrincipal.mnuReclamoAFIPClick(Sender: TObject);
begin
  frmReclamoAFIP.Free;
  frmReclamoAFIP := TfrmReclamoAFIP.Create(Self);
end;

procedure TfrmPrincipal.mnuIngresosdeValoresClick(Sender: TObject);
begin
  TfrmIngresoValores.Create(Self);
  mnuIngresosdeValores.Enabled := False;
end;

procedure TfrmPrincipal.mnuCompSelecionAprobacionClick(Sender: TObject);
begin
  TfrmCompSelecionAprobacion.Create(mnuCompSelecionAprobacion);
end;

procedure TfrmPrincipal.mnuCompReimpresionCartasClick(Sender: TObject);
begin
  TfrmCompReimpresionCartas.Create(mnuCompReimpresionCartas);
end;

procedure TfrmPrincipal.mnuGestionArmarSelEmpresasClick(Sender: TObject);
begin
  TfrmGestionArmarSelEmpresas.Create(Self);
  mnuGestionArmarSelEmpresas.Enabled := False;
end;

procedure TfrmPrincipal.mnuGestionArrancarAccionClick(Sender: TObject);
begin
  TfrmGestionArrancarAccion.Create(Self);
  mnuGestionArrancarAccion.Enabled := False;
end;

procedure TfrmPrincipal.mnuCobAdministraciondeCartasClick(Sender: TObject);
var
  frmCobAdminCartas: TfrmCobAdministracionCartas;
begin
  Abrir(TfrmCobAdministracionCartas, frmCobAdminCartas, tmvMDIChild, mnuCobAdministraciondeCartas);
  frmCobAdminCartas.Area := AREA_COB;
  frmCobAdminCartas.Caption := 'Administración de cartas de Cobranzas';
end;

procedure TfrmPrincipal.mnuControldeImputacionAjustePCPClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmMovimientosCUILAFIP, frmMovimientosCUILAFIP, tmvMDIChild, mnuControldeImputacionAjustePCP);
end;

procedure TfrmPrincipal.CargadeDisketteAFIPClick(Sender: TObject);
begin
  ImpoExpoWizard('CCDD');
end;

procedure TfrmPrincipal.mnuCobCargaManualMovimientosClick(Sender: TObject);
begin
  Abrir(TfrmCargaManualMovimientos, frmCargaManualMovimientos, tmvMDIChild, mnuCobCargaManualMovimientos);
  frmCargaManualMovimientos.Comportamiento := cfCobranzas;
end;

procedure TfrmPrincipal.mnuCargaDisketteAFIP_DebitosClick(Sender: TObject);
begin
  ImpoExpoWizard('CCDA');
end;

procedure TfrmPrincipal.JvCaptionButtonClick(Sender: TObject);
begin
  JvTrayIcon.Active := True;
  JvTrayIcon.HideApplication;
end;

procedure TfrmPrincipal.JvTrayIconDblClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  JvTrayIcon.ShowApplication;
  JvTrayIcon.Active := False;
end;

procedure TfrmPrincipal.mnuCargaDisketteAFIP_RecAnalisisClick(Sender: TObject);
begin
  Abrir(TfrmRecaudacionAnalisis, frmRecaudacionAnalisis, tmvNormal, mnuCargaDisketteAFIP_RecAnalisis);
end;

procedure TfrmPrincipal.mnuEnvioSRTCancelacionesClick(Sender: TObject);
begin
  ImpoExpoWizard('CA');
end;

procedure TfrmPrincipal.Mnu_VentanaClick(Sender: TObject);
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

procedure TfrmPrincipal.mnuVentaShowClick(Sender: TObject);
begin
  TForm(TComponent(Sender).Owner).Show;
end;

procedure TfrmPrincipal.mnuControldeImputacionPlanesdePagoClick(Sender: TObject);
begin
  Abrir(TfrmControlImputacion, frmControlImputacion, tmvMDIChild, mnuControldeImputacionPlanesdePago);
end;

procedure TfrmPrincipal.mnuControldeImputacionAFIPClick(Sender: TObject);
begin
  Abrir(TfrmControlImputacionAFIP, frmControlImputacionAFIP, tmvMDIChild, mnuControldeImputacionAFIP);
end;

procedure TfrmPrincipal.mnuGestionExclusionContratosClick(Sender: TObject);
begin
  TfrmManExclusionContratos.Create(Self);
  mnuGestionExclusionContratos.Enabled := False;
end;

procedure TfrmPrincipal.mnuGestionEmpresasEstado9Click(Sender: TObject);
begin
  Abrir(TfrmEmpresasEstado9, frmEmpresasEstado9, tmvMDIChild, mnuGestionEmpresasEstado9);
end;

procedure TfrmPrincipal.mnuGestionEmpresasRescindidasClick(Sender: TObject);
begin        
  Abrir(TfrmEmpresasRescindidas, frmEmpresasRescindidas, tmvMDIChild, mnuGestionEmpresasRescindidas);
end;

procedure TfrmPrincipal.mnuExportacionesClick(Sender: TObject);
begin
  Abrir(TfrmExportaciones, frmExportaciones, tmvMDIChild, mnuExportaciones);
end;

procedure TfrmPrincipal.mnuManCodigoRespReclAFIPClick(Sender: TObject);
begin
  with TfrmManCtbRespReclAFIP.Create(Self) do
  begin
    MenuItem  := TMenuItem(Sender);
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuRemesasAFIPClick(Sender: TObject);
begin
  Abrir(TfrmRemesasAFIP, frmRemesasAFIP, tmvMDIChild, mnuRemesasAFIP);
end;

procedure TfrmPrincipal.mnuManRedondeoPlanesClick(Sender: TObject);
begin
  Abrir(TfrmManZRP_REDONDEOPLAN, frmManZRP_REDONDEOPLAN, tmvMDIChild, mnuManRedondeoPlanes);
end;

procedure TfrmPrincipal.mnuCertificadosRetencionClick(Sender: TObject);
begin
  Abrir(TfrmCargaCertificadoRetencion, frmCargaCertificadoRetencion, tmvMDIChild, mnuCertificadosRetencion);
end;

procedure TfrmPrincipal.mnuCobSeguimientoProcesosClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoProcesos, frmSeguimientoProcesos, tmvMDIChild, mnuCobSeguimientoProcesos);
  frmSeguimientoProcesos.Sector := 'COB';
end;

procedure TfrmPrincipal.mnuControldeImputacionValoresConciliadosClick(Sender: TObject);
begin
  Abrir(TfrmValoresConciliados, frmValoresConciliados, tmvMDIChild, mnuControldeImputacionValoresConciliados);
end;

procedure TfrmPrincipal.mnuCancelacionesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaCancelaciones, frmConsultaCancelaciones, tmvMDIChild, mnuCancelaciones);
end;

procedure TfrmPrincipal.mnuManRedondeoEmisionClick(Sender: TObject);
begin
  Abrir(TfrmManRedondeosEmision, frmManRedondeosEmision, tmvMDIChild, mnuManRedondeoEmision);
end;

procedure TfrmPrincipal.mnuEmpresasABonificarClick(Sender: TObject);
begin
  Abrir(TFrmEmpresasABonificar, frmEmpresasABonificar, tmvMDIChild, mnuEmpresasABonificar);
end;

procedure TfrmPrincipal.mnuGestionEmpresasBajaTraspasoClick(Sender: TObject);
begin
  Abrir(TfrmEmpresasBajaTraspaso, frmEmpresasBajaTraspaso, tmvMDIChild, mnuGestionEmpresasBajaTraspaso);
end;

procedure TfrmPrincipal.mnuLibreDeudaClick(Sender: TObject);
begin
  Abrir(TfrmLibreDeuda, frmLibreDeuda, tmvMDIChild, mnuLibreDeuda);
end;

procedure TfrmPrincipal.mnuBajaOficioSRTPagosClick(Sender: TObject);
begin
  Abrir(TfrmBajaOficioSRTPagos, frmBajaOficioSRTPagos, tmvMDIChild, mnuBajaOficioSRTPagos);
end;

procedure TfrmPrincipal.mnuCompensSaldoAcreedorClick(Sender: TObject);
begin
  Abrir(TfrmCompensarDeuda, frmCompensarDeuda, tmvMDIChild, mnuCompensSaldoAcreedor);
end;

procedure TfrmPrincipal.mnuPlanesConsultaHistricoClick(Sender: TObject);
begin
  Abrir(TfrmHistoricoPlanesPago, frmHistoricoPlanesPago, tmvMDIChild, mnuPlanesConsultaHistrico);
end;

procedure TfrmPrincipal.mnuPlanesConsultaAutorizacionesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaAutorizaciones, frmConsultaAutorizaciones, tmvMDIChild, mnuPlanesConsultaAutorizaciones);
end;

procedure TfrmPrincipal.mnuCompensInteresesClick(Sender: TObject);
begin
  Abrir(TfrmCompensarIntereses, frmCompensarIntereses, tmvMDIChild, mnuCompensIntereses);
end;

procedure TfrmPrincipal.mnuGestionIndicadoresGestTelClick(Sender: TObject);
begin
  Abrir(TfrmIndicadoresGestionTel, frmIndicadoresGestionTel, tmvMDIChild, mnuGestionIndicadoresGestTel);
end;

procedure TfrmPrincipal.mnuFondoGarantiaConsultaClick(Sender: TObject);
begin
  Abrir(TfrmFondoGarantia, frmFondoGarantia, tmvMDIChild, mnuFondoGarantiaConsulta);
end;

procedure TfrmPrincipal.mnuFondoGarantiaPagosClick(Sender: TObject);
begin
  Abrir(TfrmPagosFondoGarantia, frmPagosFondoGarantia, tmvMDIChild, mnuFondoGarantiaPagos);
end;

procedure TfrmPrincipal.mnuDevolPagoExcesoConsultaClick(Sender: TObject);
begin
  Abrir(TfrmDevolPagoExcesoCons, frmDevolPagoExcesoCons, tmvMDIChild, mnuDevolPagoExcesoConsulta);
end;

procedure TfrmPrincipal.mnuDevolPagoExcesoPagosClick(Sender: TObject);
begin
  Abrir(TfrmDevolPagoExcesoPagos, frmDevolPagoExcesoPagos, tmvMDIChild, mnuDevolPagoExcesoPagos);
end;

procedure TfrmPrincipal.mnuManNivelAutorizacionPlanPagoClick(Sender: TObject);
begin
  Abrir(TfrmNivelAutorizacion, frmNivelAutorizacion, tmvMDIChild, mnuManNivelAutorizacionPlanPago);
end;

procedure TfrmPrincipal.mnuManParametrosClick(Sender: TObject);
begin
  Abrir(TfrmManParametros, frmManParametros, tmvMDIChild, mnuManParametros);
end;

procedure TfrmPrincipal.mnuManNivelAutorizacionBonificacionClick(Sender: TObject);
begin
  Abrir(TfrmNivelAutorizacionBonif, frmNivelAutorizacionBonif, tmvMDIChild, mnuManNivelAutorizacionBonificacion);
end;

procedure TfrmPrincipal.mnuControldeImputacionAnulacionRemesasClick(Sender: TObject);
begin
  Abrir(TfrmAnularcionRemesas, frmAnularcionRemesas, tmvMDIChild, mnuControldeImputacionAnulacionRemesas);
end;

procedure TfrmPrincipal.mnuTableroControlClick(Sender: TObject);
var
  sDirWeb: String;
begin
  sDirWeb := 'http://nthouse.artprov.com.ar:7778/portal/page?_pageid=33,20563,33_22562&_dad=portal&_schema=PORTAL';

  ShellExecute(Application.Handle, nil, PChar(sDirWeb), '', '', SW_SHOWNORMAL)
end;

procedure TfrmPrincipal.mnuConsBonificacionesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaBonificaciones, frmConsultaBonificaciones, tmvMDIChild, mnuConsBonificaciones);
end;

procedure TfrmPrincipal.mnuEmpresasReglasSegunLeyClick(Sender: TObject);
begin
  Abrir(TfrmEmpresasRegla, frmEmpresasRegla, tmvMDIChild, mnuEmpresasReglasSegunLey);
end;

end.

