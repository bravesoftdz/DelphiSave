unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomPrincipal, AdvOfficeHint,
  JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton, artSeguridad, Login, artDbLogin, Menus, ImgList, XPMenu,
  Placemnt, ComCtrls, StdCtrls, JvComponentBase, RxPlacemnt, unSesion;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuAdministracindeSolicitudes: TMenuItem;
    mnuCargadeSolicitudes: TMenuItem;
    mnuModificaciondeSolicitudes: TMenuItem;
    mnuAprobaciondeSolicitudes: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuEstadodelaSolicitud: TMenuItem;
    mnuOrigendelaSolicitud: TMenuItem;
    mnuFormaJuridica: TMenuItem;
    mnuMotivodeAltadelaSolicitud: TMenuItem;
    mnuART: TMenuItem;
    mnuSectores: TMenuItem;
    mnuTarifas: TMenuItem;
    mnuCargo: TMenuItem;
    mnuArea: TMenuItem;
    mnuTarea: TMenuItem;
    mnuAfiliaciones: TMenuItem;
    mnuManCarta: TMenuItem;
    mnuAfiManFirmante: TMenuItem;
    mnuAfiManTexto: TMenuItem;
    mnuMantenimientoGral: TMenuItem;
    mnuOperacionSTR: TMenuItem;
    mnuHolding: TMenuItem;
    mnuTablas: TMenuItem;
    mnuTablaGral: TMenuItem;
    mnuAfiManCartaArea: TMenuItem;
    mnuManCTB_CODRE: TMenuItem;
    mnuTraspasoIngreso: TMenuItem;
    mnuAdministracindeContrato: TMenuItem;
    mnuModificacionContrato: TMenuItem;
    mnuAfiAdministracionCartas: TMenuItem;
    mnuTesoreria: TMenuItem;
    mnuTesoValores: TMenuItem;
    mnuTesoMantenimiento: TMenuItem;
    mnuTesoValIngreso: TMenuItem;
    mnuTesoValAdministracion: TMenuItem;
    mnuTipoEnvioSRT: TMenuItem;
    mnuCdigodeRechazo: TMenuItem;
    mnuClausulaEspecial: TMenuItem;
    mnuCdigoDeOBservacionSRT: TMenuItem;
    mnuMotivoDeBajaDelContrato: TMenuItem;
    mnuManGestorDeCuenta: TMenuItem;
    mnuManEjecutivoDeCuenta: TMenuItem;
    mnuConsultaEndosos: TMenuItem;
    mnuNotasSRT: TMenuItem;
    mnuConfirmacionEndosos: TMenuItem;
    mnuConsultaContrato: TMenuItem;
    mnuTraspasoEgreso: TMenuItem;
    mnuEndososMultiples: TMenuItem;
    mnuCertificadosdeCobertura: TMenuItem;
    mnuMantenimientoDeTrabajadores: TMenuItem;
    mnuEventosTraspasoIngreso: TMenuItem;
    mnuEventosTraspasoEgreso: TMenuItem;
    mnuManEndosos: TMenuItem;
    mnuManTipodeEndosos: TMenuItem;
    N12: TMenuItem;
    N21: TMenuItem;
    N3: TMenuItem;
    MantenimientodeTrabajadores1: TMenuItem;
    mnuCargaMasivaDiskette: TMenuItem;
    mnuCargaMasivaManual: TMenuItem;
    mnuEnviosSRT: TMenuItem;
    mnuCOEnvioSRT: TMenuItem;
    mnuGeneracionIndividual: TMenuItem;
    mnuGeneracionMasiva: TMenuItem;
    mnuBorrarEnviosSRT: TMenuItem;
    mnuGeneracionMasivaTodos: TMenuItem;
    mnuRecepcionSRT: TMenuItem;
    ObjecionesTraspasosOJ: TMenuItem;
    GeneracinArchivo1: TMenuItem;
    mnuImpresionContratos: TMenuItem;
    mnuGenTarifasMasivas: TMenuItem;
    MantenimientodeTrabajadores2: TMenuItem;
    mnuCargaMasivaDisketteSol: TMenuItem;
    mnuManTarifarioSSN: TMenuItem;
    mnuManTarifarioComercialOriginal: TMenuItem;
    mnuCambiodeCUIL: TMenuItem;
    mnuUpdateTarifaCarta: TMenuItem;
    mnuManGestorDeAumento: TMenuItem;
    mnuManEstudiosContables: TMenuItem;
    N41: TMenuItem;
    mnuFirmantes: TMenuItem;
    mnuFirmanteCertificadosCobertura: TMenuItem;
    mnuFirmanteEndosos: TMenuItem;
    N71: TMenuItem;
    N5: TMenuItem;
    mnuRecepcionVentanillaElectronica: TMenuItem;
    mnuContratosGuarda: TMenuItem;
    mnuDocFaltante: TMenuItem;
    mnuFirmanteAfi: TMenuItem;
    mnuManInformeComercial: TMenuItem;
    mnuManACA_CONTRATOAUTORIZADO: TMenuItem;
    mnuPEP: TMenuItem;
    mnuExposicionBaja: TMenuItem;
    mnuRiesgoCIIU: TMenuItem;
    mnuRiesgoPostal: TMenuItem;
    mnuRiesgoPrima: TMenuItem;
    mnuTablaRiesgo: TMenuItem;
    mnuRecepcion: TMenuItem;
    mnuManPaisesGafi: TMenuItem;
    mnuManRecepcion: TMenuItem;
    mnuStockMateriales: TMenuItem;
    mnuDepositos: TMenuItem;
    mnuMateriales: TMenuItem;
    mnuPermisos: TMenuItem;
    mnuMovimientos: TMenuItem;
    mnuMantenimientoStock: TMenuItem;
    mnuContratosTrabNoConfirmados: TMenuItem;
    mnuManContratosNoSuss: TMenuItem;
    mnuWebServices: TMenuItem;
    mnuWSEstablecimientosPorCuit: TMenuItem;
    mnuManAEP_EJECUTIVOCPOSTAL: TMenuItem;
    mnuSorteoSRT: TMenuItem;
    mnuConversionRegimen: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mnuModificaciondeSolicitudesClick(Sender: TObject);
    procedure mnuCargadeSolicitudesClick(Sender: TObject);
    procedure mnuAprobaciondeSolicitudesClick(Sender: TObject);
    procedure mnuTraspasoIngresoClick(Sender: TObject);
    procedure mnuManCtbTablasClick(Sender: TObject);
    procedure mnuCargaMasivaDisketteSolClick(Sender: TObject);
    procedure mnuConsultaContratoClick(Sender: TObject);
    procedure mnuModificacionContratoClick(Sender: TObject);
    procedure mnuImpresionContratosClick(Sender: TObject);
    procedure mnuCertificadosdeCoberturaClick(Sender: TObject);
    procedure mnuConsultaEndososClick(Sender: TObject);
    procedure mnuConfirmacionEndososClick(Sender: TObject);
    procedure mnuEndososMultiplesClick(Sender: TObject);
    procedure mnuGenTarifasMasivasClick(Sender: TObject);
    procedure mnuNotasSRTClick(Sender: TObject);
    procedure mnuTraspasoEgresoClick(Sender: TObject);
    procedure mnuAfiAdministracionCartasClick(Sender: TObject);
    procedure ImpoExpo(Sender: TObject);
    procedure mnuRecepcionSRTClick(Sender: TObject);
    procedure mnuAfiManCartaAreaClick(Sender: TObject);
    procedure mnuManCTB_CODREClick(Sender: TObject);
    procedure mnuAfiManFirmanteClick(Sender: TObject);
    procedure mnuAfiManTextoClick(Sender: TObject);
    procedure mnuHoldingClick(Sender: TObject);
    procedure mnuEventosTraspasoIngresoClick(Sender: TObject);
    procedure mnuEventosTraspasoEgresoClick(Sender: TObject);
    procedure mnuManTarifarioSSNClick(Sender: TObject);
    procedure mnuManTarifarioComercialOriginalClick(Sender: TObject);
    procedure mnuARTClick(Sender: TObject);
    procedure mnuManEjecutivoDeCuentaClick(Sender: TObject);
    procedure mnuManEstudiosContablesClick(Sender: TObject);
    procedure mnuManGestorDeAumentoClick(Sender: TObject);
    procedure mnuManGestorDeCuentaClick(Sender: TObject);
    procedure mnuManEndososClick(Sender: TObject);
    procedure mnuManTipodeEndososClick(Sender: TObject);
    procedure mnuFirmanteCertificadosCoberturaClick(Sender: TObject);
    procedure mnuFirmanteEndososClick(Sender: TObject);
    procedure mnuMantenimientoDeTrabajadoresClick(Sender: TObject);
    procedure mnuCargaMasivaManualClick(Sender: TObject);
    procedure mnuCargaMasivaDisketteClick(Sender: TObject);
    procedure mnuUpdateTarifaCartaClick(Sender: TObject);
   // procedure mnuBolInterdepositosClick(Sender: TObject);
    procedure mnuTesoValAdministracionClick(Sender: TObject);
    procedure mnuRecepcionVentanillaElectronicaClick(Sender: TObject);
    procedure mnuContratosGuardaClick(Sender: TObject);
    procedure mnuDocFaltanteClick(Sender: TObject);
    procedure mnuFirmanteAfiClick(Sender: TObject);
    procedure mnuManInformeComercialClick(Sender: TObject);
    procedure mnuManACA_CONTRATOAUTORIZADOClick(Sender: TObject);
    procedure mnuExposicionBajaClick(Sender: TObject);
    procedure mnuRiesgoCIIUClick(Sender: TObject);
    procedure mnuRiesgoPostalClick(Sender: TObject);
    procedure mnuRiesgoPrimaClick(Sender: TObject);
    procedure mnuTablaRiesgoClick(Sender: TObject);
    procedure mnuRecepcionClick(Sender: TObject);
    procedure mnuManPaisesGafiClick(Sender: TObject);
    procedure mnuManRecepcionClick(Sender: TObject);
    procedure mnuDepositosClick(Sender: TObject);
    procedure mnuMaterialesClick(Sender: TObject);
    procedure mnuPermisosClick(Sender: TObject);
    procedure mnuMovimientosClick(Sender: TObject);
    procedure mnuContratosTrabNoConfirmadosClick(Sender: TObject);
    procedure mnuManContratosNoSussClick(Sender: TObject);
    procedure mnuWSEstablecimientosPorCuitClick(Sender: TObject);
    procedure mnuManAEP_EJECUTIVOCPOSTALClick(Sender: TObject);
    procedure mnuSorteoSRTClick(Sender: TObject);
    procedure mnuConversionRegimenClick(Sender: TObject);
  private
    procedure DisableMenu;
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unConsultaSolicitud, unCargaSolicitud, unAprobacionSolicitud, unTraspasos, unManCtbTablas, unCargaNominaDskSolicitud,
  unConsultaContrato, unModificaContrato, unImpresionContratos, unCertificadosDeCobertura, unContratoConsultaEndoso,
  unConfirmaTarifa, unEndososMultiples, unTarifasMasivas, unNotaSRT, unTraspasosEgresos, unAfiAdministracionCartas,
  unRecepcionSRT, unManCAT_AREATEXTO, unManCTB_CODRE, unManCFI_FIRMA, unManCTC_TEXTOCARTA, unManHolding, unManCTB_EVTIN,
  unManCTB_EVTEG, unManTarifario, unManTarComercial, unManART, unManAEC_EJECUTIVOCUENTA, unManAEC_ESTUDIOCONTABLE,
  unManAGA_GESTORAUMENTO, unManAGC_GESTORCUENTA, General, unManCTB_MOTEN, unManCTB_FEEND, unFirmanteReporte,
  unContratoTrabajador, unCargaNominaManual, unCargaNominaDsk, unUpdateTarifasCarta, unArt,
  unImpoExpoWizard, unComunes, unRecepcionVentanillaElectronica, unCompatibilidad, unDmPrincipal, AnsiSql,
  unContratosGuarda, unManDocumentacionFaltante, unManFirmanteAfi, unManInformeComercial, unManACA_CONTRATOAUTORIZADO,
  unManPEB_EXPOSICIONBAJA, unManPRC_RIESGOCIIU, unManPRP_RIESGOPOSTAL, unManPRP_RIESGOPRIMA, unManPTR_TABLARIESGO,
  unRecepcionSolicitud, unManPaisesGafi, unManRecepcionSolicitud, unMANDepositoStock, unManAMA_MATERIAL,
  unManPermisosStockMateriales, unManAMS_MOVIMIENTOSTOCK, unManContratosTrabNoConfirmados, unManContratosNoSuss,
  unManWSEstablecimientos, unManAEP_EJECUTIVOCPOSTAL, unManConversionRegimen;

{$R *.dfm}

procedure TfrmPrincipal.DisableMenu;
  procedure Disable(aItem: TMenuItem);
  var
    iLoop: Integer;
  begin
    aItem.Enabled := False;
    for iLoop := 0 to aItem.Count - 1 do
    begin
      aItem.Items[iLoop].Enabled := False;
      Disable(aItem.Items[iLoop]);
    end;
  end;

  procedure EnableMenu(aMenus: Array of TMenuItem; const aEnableChilds: Boolean);
  var
    aItem: TMenuItem;
    iLoop: Integer;
    iLoop2: Integer;
  begin
    for iLoop := Low(aMenus) to High(aMenus) do
    begin
      aMenus[iLoop].Enabled := True;
      if aEnableChilds then
      begin
        aItem := aMenus[iLoop];
        for iLoop2 := 0 to aItem.Count - 1 do
          EnableMenu([aItem[iLoop2]], aEnableChilds);
      end;
    end;
  end;

  procedure SetInvisible(aItem: TMenuItem);
  begin
    aItem.Visible := False;
    {for iLoop := 0 to aItem.Count - 1 do
    begin
      aItem.Items[iLoop].Enabled := False;
      Disable(aItem.Items[iLoop]);
    end;}
  end;
begin
  if Seguridad.Claves.IsActive('DeshabilitarMenus') then
  begin
    Disable(mnuAfiliaciones);
    Disable(mnuTesoreria);
    Disable(mnuGeneral);
  end;

  if Seguridad.Claves.IsActive('VerMenusDeshabilitados') then
    EnableMenu([mnuAfiliaciones, mnuAdministracindeContrato, mnuCertificadosdeCobertura, mnuConsultaContrato,
                mnuImpresionContratos, MantenimientodeTrabajadores1, mnuMantenimientoDeTrabajadores], False);

  if (Sesion.Sector <> 'COMPUTOS') and (Sesion.UserID <> 'CALLO') then
    SetInvisible(mnuWebServices)
//  EnableMenu([mnuEnviosSRT], True);
end;


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

  DisableMenu;
end;

procedure TfrmPrincipal.mnuModificaciondeSolicitudesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaSolicitud, frmConsultaSolicitud, tmvMDIChild, mnuModificaciondeSolicitudes);
end;

procedure TfrmPrincipal.mnuCargadeSolicitudesClick(Sender: TObject);
begin
  Abrir(TfrmCargaSolicitudes, frmCargaSolicitudes, tmvMDIChild, mnuCargadeSolicitudes);
  frmCargaSolicitudes.Mostrar(True);
end;

procedure TfrmPrincipal.mnuAprobaciondeSolicitudesClick(Sender: TObject);
begin
  Abrir(TfrmAprobacionSolicitud, frmAprobacionSolicitud, tmvMDIChild, mnuAprobaciondeSolicitudes);
end;

procedure TfrmPrincipal.mnuTraspasoIngresoClick(Sender: TObject);
begin
  Abrir(TfrmTraspasos, frmTraspasos, tmvMDIChild, mnuTraspasoIngreso);
end;

procedure TfrmPrincipal.mnuManContratosNoSussClick(Sender: TObject);
begin
  Abrir(TfrmManContratosNoSuss, frmManContratosNoSuss, tmvMDIChild, mnuManContratosNoSuss);
end;

procedure TfrmPrincipal.mnuManCtbTablasClick(Sender: TObject);
begin
  Abrir(TfrmManCtbTablas, frmManCtbTablas, tmvMDIChild, TMenuItem(Sender));
  with frmManCtbTablas do
  begin
    Caption   := 'Mantenimiento de ' + StringReplace(TMenuItem(Sender).Caption, '&', '', []);
    Clave     := TMenuItem(Sender).Hint;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuCargaMasivaDisketteSolClick(Sender: TObject);
begin
  Abrir(TfrmCargaNominaDskSolicitud, frmCargaNominaDskSolicitud, tmvMDIChild, mnuCargaMasivaDisketteSol);
end;

procedure TfrmPrincipal.mnuConsultaContratoClick(Sender: TObject);
begin
  Abrir(TfrmConsultaContrato, frmConsultaContrato, tmvMDIChild, mnuConsultaContrato);
end;

procedure TfrmPrincipal.mnuModificacionContratoClick(Sender: TObject);
begin
  Abrir(TfrmModificacionContrato, frmModificacionContrato, tmvMDIChild, mnuModificacionContrato);
  frmModificacionContrato.DoCargarDatos(ART_EMPTY_ID, ART_EMPTY_ID, fsModificar);
end;

procedure TfrmPrincipal.mnuImpresionContratosClick(Sender: TObject);
begin
  Abrir(TfrmImpresionContratos, frmImpresionContratos, tmvMDIChild, mnuImpresionContratos);
end;

procedure TfrmPrincipal.mnuCertificadosdeCoberturaClick(Sender: TObject);
begin
  Abrir(TfrmCertificadosDeCobertura, frmCertificadosDeCobertura, tmvMDIChild, mnuCertificadosdeCobertura);
end;

procedure TfrmPrincipal.mnuConsultaEndososClick(Sender: TObject);
begin
  Abrir(TfrmContratoConsultaEndoso, frmContratoConsultaEndoso, tmvMDIChild, mnuConsultaEndosos);
end;

procedure TfrmPrincipal.mnuConfirmacionEndososClick(Sender: TObject);
begin
  Abrir(TfrmConfirmaTarifa, frmConfirmaTarifa, tmvMDIChild, mnuConfirmacionEndosos);
end;

procedure TfrmPrincipal.mnuEndososMultiplesClick(Sender: TObject);
begin
  Abrir(TfrmEndososMultiples, frmEndososMultiples, tmvMDIChild, mnuEndososMultiples);
end;

procedure TfrmPrincipal.mnuGenTarifasMasivasClick(Sender: TObject);
begin
  Abrir(TfrmTarifasMasivas, frmTarifasMasivas, tmvMDIChild, mnuGenTarifasMasivas);
end;

procedure TfrmPrincipal.mnuNotasSRTClick(Sender: TObject);
begin
  Abrir(TfrmNotaSRT, frmNotaSRT, tmvMDIChild, mnuNotasSRT);
end;

procedure TfrmPrincipal.mnuTraspasoEgresoClick(Sender: TObject);
begin
  Abrir(TfrmTraspasosEgresos, frmTraspasosEgresos, tmvMDIChild, mnuTraspasoEgreso);
end;

procedure TfrmPrincipal.mnuAfiAdministracionCartasClick(Sender: TObject);
begin
  Abrir(TfrmAfiAdministracionCartas, frmAfiAdministracionCartas, tmvMDIChild, mnuAfiAdministracionCartas);
end;

procedure TfrmPrincipal.ImpoExpo(Sender: TObject);
begin
  ImpoExpoWizard(TMenuItem(Sender).Hint);
end;

procedure TfrmPrincipal.mnuRecepcionSRTClick(Sender: TObject);
begin
  Abrir(TfrmRecepcionSRT, frmRecepcionSRT, tmvMDIChild, mnuRecepcionSRT);
end;

procedure TfrmPrincipal.mnuAfiManCartaAreaClick(Sender: TObject);
begin
  Abrir(TfrmManCAT_AREATEXTO, frmManCAT_AREATEXTO, tmvMDIChild, mnuAfiManCartaArea);
  frmManCAT_AREATEXTO.Area := aAfiliaciones;
end;

procedure TfrmPrincipal.mnuManCTB_CODREClick(Sender: TObject);
begin
  Abrir(TfrmManCTB_CODRE, frmManCTB_CODRE, tmvMDIChild, mnuManCTB_CODRE);
  frmManCTB_CODRE.FormStyle := fsMDIChild;
end;

procedure TfrmPrincipal.mnuAfiManFirmanteClick(Sender: TObject);
begin
  Abrir(TfrmManCFI_FIRMA, frmManCFI_FIRMA, tmvMDIChild, mnuAfiManFirmante);
  frmManCFI_FIRMA.Area := aAfiliaciones;
end;

procedure TfrmPrincipal.mnuAfiManTextoClick(Sender: TObject);
begin
  Abrir(TfrmManCTC_TEXTOCARTA, frmManCTC_TEXTOCARTA, tmvMDIChild, mnuAfiManTexto);
  frmManCTC_TEXTOCARTA.Area := aAfiliaciones;
end;

procedure TfrmPrincipal.mnuHoldingClick(Sender: TObject);
begin
  Abrir(TfrmManHolding, frmManHolding, tmvMDIChild, mnuHolding);
end;

procedure TfrmPrincipal.mnuEventosTraspasoIngresoClick(Sender: TObject);
begin
  Abrir(TfrmManCTB_EVTIN, frmManCTB_EVTIN, tmvMDIChild, mnuEventosTraspasoIngreso);
  frmManCTB_EVTIN.FormStyle := fsMDIChild;
end;

procedure TfrmPrincipal.mnuEventosTraspasoEgresoClick(Sender: TObject);
begin
  Abrir(TfrmManCTB_EVTEG, frmManCTB_EVTEG, tmvMDIChild, mnuEventosTraspasoEgreso);
  frmManCTB_EVTEG.FormStyle := fsMDIChild;
end;

procedure TfrmPrincipal.mnuManTarifarioSSNClick(Sender: TObject);
begin
  Abrir(TfrmManTarifario, frmManTarifario, tmvMDIChild, mnuManTarifarioSSN);
end;

procedure TfrmPrincipal.mnuManTarifarioComercialOriginalClick(Sender: TObject);
begin
  Abrir(TfrmManTarComercial, frmManTarComercial, tmvMDIChild, mnuManTarifarioComercialOriginal);
end;

procedure TfrmPrincipal.mnuARTClick(Sender: TObject);
begin
  Abrir(TfrmManAAR_ART, frmManAAR_ART, tmvMDIChild, mnuART);
end;

procedure TfrmPrincipal.mnuManEjecutivoDeCuentaClick(Sender: TObject);
begin
  Abrir(TfrmManAEC_EJECUTIVOCUENTA, frmManAEC_EJECUTIVOCUENTA, tmvMDIChild, mnuManEjecutivoDeCuenta);
end;

procedure TfrmPrincipal.mnuManEstudiosContablesClick(Sender: TObject);
begin
  Abrir(TfrmManAEC_ESTUDIOCONTABLE, frmManAEC_ESTUDIOCONTABLE, tmvMDIChild, mnuManEstudiosContables);
end;

procedure TfrmPrincipal.mnuManGestorDeAumentoClick(Sender: TObject);
begin
  Abrir(TfrmManAGA_GESTORAUMENTO, frmManAGA_GESTORAUMENTO, tmvMDIChild, mnuManGestorDeAumento);
end;

procedure TfrmPrincipal.mnuManGestorDeCuentaClick(Sender: TObject);
begin
  Abrir(TfrmManAGC_GESTORCUENTA, frmManAGC_GESTORCUENTA, tmvMDIChild, mnuManGestorDeCuenta);
  frmManAGC_GESTORCUENTA.EsEstudio := False;
end;

procedure TfrmPrincipal.mnuManEndososClick(Sender: TObject);
begin
  Abrir(TfrmManCTB_MOTEN, frmManCTB_MOTEN, tmvMDIChild, mnuManEndosos);
  frmManCTB_MOTEN.FormStyle := fsMDIChild;
end;

procedure TfrmPrincipal.mnuManTipodeEndososClick(Sender: TObject);
begin
  Abrir(TfrmManCTB_FEEND, frmManCTB_FEEND, tmvMDIChild, mnuManTipodeEndosos);
  frmManCTB_FEEND.FormStyle := fsMDIChild;
end;

procedure TfrmPrincipal.mnuFirmanteCertificadosCoberturaClick(Sender: TObject);
begin
  Abrir(TfrmFirmanteReporte, frmFirmanteReporte, tmvMDIChild, mnuFirmanteCertificadosCobertura);
  with frmFirmanteReporte do
  begin
    ID := 1;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuFirmanteEndososClick(Sender: TObject);
begin
  Abrir(TfrmFirmanteReporte, frmFirmanteReporte, tmvMDIChild, mnuFirmanteEndosos);
  with frmFirmanteReporte do
  begin
    ID := 2;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuMantenimientoDeTrabajadoresClick(Sender: TObject);
begin
  Abrir(TfrmContratoTrabajador, frmContratoTrabajador, tmvMDIChild, mnuMantenimientoDeTrabajadores);
  with frmContratoTrabajador do
  begin
    FormStyle := fsMDIChild;
    DoCargarDatos(ART_EMPTY_ID);
  end;
end;

procedure TfrmPrincipal.mnuCargaMasivaManualClick(Sender: TObject);
begin
  Abrir(TfrmCargaNominaManual, frmCargaNominaManual, tmvMDIChild, mnuCargaMasivaManual);
end;

procedure TfrmPrincipal.mnuCargaMasivaDisketteClick(Sender: TObject);
begin
  Abrir(TfrmCargaNominaDsk, frmCargaNominaDsk, tmvMDIChild, mnuCargaMasivaDiskette);
end;

procedure TfrmPrincipal.mnuUpdateTarifaCartaClick(Sender: TObject);
begin
  Abrir(TfrmUpdateTarifaCarta, frmUpdateTarifaCarta, tmvMDIChild, mnuUpdateTarifaCarta);
end;

procedure TfrmPrincipal.mnuWSEstablecimientosPorCuitClick(Sender: TObject);
begin
  Abrir(TfrmManWSEstablecimientos, frmManWSEstablecimientos, tmvMDIChild, mnuWSEstablecimientosPorCuit);
end;

{procedure TfrmPrincipal.mnuBolInterdepositosClick(Sender: TObject);
begin
  Abrir(TfrmBolInterDep, frmBolInterDep, tmvMDIChild, mnuBolInterdepositos);
end;
}
procedure TfrmPrincipal.mnuTesoValAdministracionClick(Sender: TObject);
begin
//  Abrir(TfrmValAdministracion, frmValAdministracion, tmvMDIChild, mnuTesoValAdministracion);
end;

procedure TfrmPrincipal.mnuRecepcionVentanillaElectronicaClick(Sender: TObject);
begin
  Abrir(TfrmRecepcionVentanillaElectronica, frmRecepcionVentanillaElectronica, tmvMDIChild, mnuRecepcionVentanillaElectronica);
end;

procedure TfrmPrincipal.mnuContratosGuardaClick(Sender: TObject);
begin
  Abrir(TfrmContratosGuarda, frmContratosGuarda, tmvMDIChild, mnuContratosGuarda);
end;

procedure TfrmPrincipal.mnuDocFaltanteClick(Sender: TObject);
begin
  Abrir(TfrmManDocumentacionFaltante, frmManDocumentacionFaltante, tmvMDIChild, mnuDocFaltante);
end;

procedure TfrmPrincipal.mnuFirmanteAfiClick(Sender: TObject);
begin
  Abrir(TfrmManFirmanteAfi, frmManFirmanteAfi, tmvMDIChild, mnuFirmanteAfi);
end;

procedure TfrmPrincipal.mnuManInformeComercialClick(Sender: TObject);
begin
  Abrir(TfrmManInformeComercial, frmManInformeComercial, tmvMDIChild, mnuManInformeComercial);
end;

procedure TfrmPrincipal.mnuManACA_CONTRATOAUTORIZADOClick(Sender: TObject);
begin
  Abrir(TfrmManACA_CONTRATOAUTORIZADO, frmManACA_CONTRATOAUTORIZADO, tmvMDIChild, mnuManACA_CONTRATOAUTORIZADO);
end;

procedure TfrmPrincipal.mnuManAEP_EJECUTIVOCPOSTALClick(Sender: TObject);
begin
  Abrir(TfrmManAEP_EJECUTIVOCPOSTAL, frmManAEP_EJECUTIVOCPOSTAL, tmvMDIChild, mnuManAEP_EJECUTIVOCPOSTAL);
end;

procedure TfrmPrincipal.mnuExposicionBajaClick(Sender: TObject);
begin
   Abrir(TfrmManPEB_EXPOSICIONBAJA, frmManPEB_EXPOSICIONBAJA, tmvMDIChild, mnuExposicionBaja);
end;

procedure TfrmPrincipal.mnuRiesgoCIIUClick(Sender: TObject);
begin
   Abrir(TfrmManPRC_RIESGOCIIU, frmManPRC_RIESGOCIIU, tmvMDIChild, mnuRiesgoCIIU);
end;

procedure TfrmPrincipal.mnuRiesgoPostalClick(Sender: TObject);
begin
  Abrir(TfrmManPRP_RIESGOPOSTAL, frmManPRP_RIESGOPOSTAL, tmvMDIChild, mnuRiesgoPostal);
end;

procedure TfrmPrincipal.mnuRiesgoPrimaClick(Sender: TObject);
begin
  Abrir(TfrmManPRP_RIESGOPRIMA, frmManPRP_RIESGOPRIMA, tmvMDIChild, mnuRiesgoPrima);
end;

procedure TfrmPrincipal.mnuSorteoSRTClick(Sender: TObject);
begin
  ImpoExpoWizard(TMenuItem(Sender).Hint);
end;

procedure TfrmPrincipal.mnuTablaRiesgoClick(Sender: TObject);
begin
  Abrir(TfrmManPTR_TABLARIESGO, frmManPTR_TABLARIESGO, tmvMDIChild, mnuTablaRiesgo);
end;

procedure TfrmPrincipal.mnuRecepcionClick(Sender: TObject);
begin
  Abrir(TfrmRecepcionSolicitud, frmRecepcionSolicitud, tmvMDIChild, mnuRecepcion);
end;

procedure TfrmPrincipal.mnuManPaisesGafiClick(Sender: TObject);
begin
  Abrir(TfrmManPaisesGafi, frmManPaisesGafi, tmvMDIChild, mnuManPaisesGafi);
end;

procedure TfrmPrincipal.mnuManRecepcionClick(Sender: TObject);
begin
  Abrir(TfrmManRecepcionSolicitud, frmManRecepcionSolicitud, tmvMDIChild, mnuManRecepcion);
end;

procedure TfrmPrincipal.mnuDepositosClick(Sender: TObject);
begin
  Abrir(TfrmManDepositoStock, frmManDepositoStock, tmvMDIChild, mnuDepositos);
end;

procedure TfrmPrincipal.mnuMaterialesClick(Sender: TObject);
begin
  Abrir(TfrmManAMA_MATERIAL, frmManAMA_MATERIAL, tmvMDIChild, mnuMateriales);
end;

procedure TfrmPrincipal.mnuPermisosClick(Sender: TObject);
begin
  Abrir(TfrmManPermisosStockMateriales, frmManPermisosStockMateriales, tmvMDIChild, mnuPermisos);
end;

procedure TfrmPrincipal.mnuMovimientosClick(Sender: TObject);
begin
  Abrir(TfrmManAMS_MOVIMIENTOSTOCK, frmManAMS_MOVIMIENTOSTOCK, tmvMDIChild, mnuMovimientos);
end;

procedure TfrmPrincipal.mnuContratosTrabNoConfirmadosClick(
  Sender: TObject);
begin
  Abrir(TfrmManContratosTrabNoConfirmados, frmManContratosTrabNoConfirmados, tmvMDIChild, mnuContratosTrabNoConfirmados);
end;

procedure TfrmPrincipal.mnuConversionRegimenClick(Sender: TObject);
begin
  Abrir(TfrmManConversionRegimen, frmManConversionRegimen, tmvMDIChild, mnuConversionRegimen);
end;

end.
