unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Login, artDbLogin, artSeguridad, ImgList, Placemnt, XPMenu,
  Menus, ComCtrls, JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton,
  AdvOfficeHint, unCustomPrincipal, JvComponentBase, RxPlacemnt;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuLiquidaciones: TMenuItem;
    mnuLiqMortBeneficiarios: TMenuItem;
    mnuLiqMortCalculos: TMenuItem;
    mnuAdmLiquidaciones: TMenuItem;
    mnuListados: TMenuItem;
    MnuMantenimiento: TMenuItem;
    mnuListLiqAprobadas: TMenuItem;
    mnuListPagosDirILT: TMenuItem;
    mnuListTableroControl: TMenuItem;
    mnuListLiqIncapacidades: TMenuItem;
    mnuListLiqCompensables: TMenuItem;
    mnuManOtrosAcreedores: TMenuItem;
    mnuManZonasAfip: TMenuItem;
    mnuManMotBajaLiqAut: TMenuItem;
    mnuManBeneficiariosCheque: TMenuItem;
    mnuListGralLiquidaciones: TMenuItem;
    mnuLiqAprobacion: TMenuItem;
    mnuLiqAprobIndiv: TMenuItem;
    mnuLiqAprobMasiva: TMenuItem;
    mnuLiqGenAutomatica: TMenuItem;
    mnuManFechaReapertura: TMenuItem;
    mnuManCiaSegRetiro: TMenuItem;
    mnuManAFJP: TMenuItem;
    mnuManObrasSociales: TMenuItem;
    mnuManEmpBloqueoILT: TMenuItem;
    mnuManAsigFam: TMenuItem;
    mnuManTiposAsigFam: TMenuItem;
    mnuManMontosAsigFam: TMenuItem;
    mnuManAMPO: TMenuItem;
    mnuManImportesAMPO: TMenuItem;
    mnuManEmpresasSinAMPO: TMenuItem;
    mnuLiqIncapacidades: TMenuItem;
    mnuLiqCartasDoc: TMenuItem;
    mnuCartasDocPuestaDisp: TMenuItem;
    mnuCartasDocILPsinDDJJ: TMenuItem;
    mnuResumenLiqDinerarias: TMenuItem;
    mnuManLiquidadoresPorCUIT: TMenuItem;
    MnuSeguimientoDocumentacion: TMenuItem;
    mnuManEmpresasPagoDirILT: TMenuItem;
    mnuManDocumentacion: TMenuItem;
    mnuSeguimientoCasosLiquidar: TMenuItem;
    mnuManMotivosAportes: TMenuItem;
    mnuListAportesContribuciones: TMenuItem;
    mnuListControversiaReserva: TMenuItem;
    mnuListSiniestrosConEmbargo: TMenuItem;
    mnuActInfoDictamen: TMenuItem;
    mnuSinGranInvalidez: TMenuItem;
    mnuCtasBancEmp: TMenuItem;
    mnuManBenefChequePorCuit: TMenuItem;
    mnuManMotivoCancLiquidaciones: TMenuItem;
    mnuManMotivosDeDiferencia: TMenuItem;
    mnuManMontoMaxAprobPorUsuario: TMenuItem;
    mnuManImportesAMPO_nuevo: TMenuItem;
    mnuListPagosJudiciales: TMenuItem;
    mnuListSiniConLiqMensuales: TMenuItem;
    mnuManActualizacionValores: TMenuItem;
    mnuAdmCartas: TMenuItem;
    mnuMotBajaPuestaDisp: TMenuItem;
    mnuManLiquidadores: TMenuItem;
    mnuSeguimientoCasosPagoDir: TMenuItem;
    mnuMotivosBajaCasos: TMenuItem;
    mnuSeguimientoCasos: TMenuItem;
    mnuSeguimientoCasosReintegros: TMenuItem;
    mnuSeguimientoCasosILP: TMenuItem;
    mnuSinNoAutorizados: TMenuItem;
    mnuSeguimientoCasosMortales: TMenuItem;
    mnuLiquidacionesModificadas: TMenuItem;
    mnuSegRemisionFondos: TMenuItem;
    mnuAccionesRemisionFondos: TMenuItem;
    procedure mnuLiqMortBeneficiariosClick(Sender: TObject);
    procedure mnuLiqMortCalculosClick(Sender: TObject);
    procedure mnuListLiqAprobadasClick(Sender: TObject);
    procedure mnuListPagosDirILTClick(Sender: TObject);
    procedure mnuListTableroControlClick(Sender: TObject);
    procedure mnuListLiqIncapacidadesClick(Sender: TObject);
    procedure mnuListLiqCompensablesClick(Sender: TObject);
    procedure mnuManOtrosAcreedoresClick(Sender: TObject);
    procedure mnuManZonasAfipClick(Sender: TObject);
    procedure mnuManMotBajaLiqAutClick(Sender: TObject);
    procedure mnuManBeneficiariosChequeClick(Sender: TObject);
    procedure mnuListGralLiquidacionesClick(Sender: TObject);
    procedure mnuManFechaReaperturaClick(Sender: TObject);
    procedure mnuManCiaSegRetiroClick(Sender: TObject);
    procedure mnuManAFJPClick(Sender: TObject);
    procedure mnuManObrasSocialesClick(Sender: TObject);
    procedure mnuManEmpBloqueoILTClick(Sender: TObject);
    procedure mnuManTiposAsigFamClick(Sender: TObject);
    procedure mnuManMontosAsigFamClick(Sender: TObject);
    procedure mnuManImportesAMPOClick(Sender: TObject);
    procedure mnuManEmpresasSinAMPOClick(Sender: TObject);
    procedure mnuLiqAprobIndivClick(Sender: TObject);
    procedure mnuLiqAprobMasivaClick(Sender: TObject);
    procedure mnuCartasDocPuestaDispClick(Sender: TObject);
    procedure mnuCartasDocILPsinDDJJClick(Sender: TObject);
    procedure mnuLiqIncapacidadesClick(Sender: TObject);
    procedure mnuLiqGenAutomaticaClick(Sender: TObject);
    procedure mnuResumenLiqDinerariasClick(Sender: TObject);
    procedure mnuManLiquidadoresPorCUITClick(Sender: TObject);
    procedure MnuSeguimientoDocumentacionClick(Sender: TObject);
    procedure mnuManEmpresasPagoDirILTClick(Sender: TObject);
    procedure mnuManDocumentacionClick(Sender: TObject);
    procedure mnuSeguimientoCasosLiquidarClick(Sender: TObject);
    procedure mnuManMotivosAportesClick(Sender: TObject);
    procedure mnuListAportesContribucionesClick(Sender: TObject);
    procedure mnuListControversiaReservaClick(Sender: TObject);
    procedure mnuListSiniestrosConEmbargoClick(Sender: TObject);
    procedure mnuActInfoDictamenClick(Sender: TObject);
    procedure mnuSinGranInvalidezClick(Sender: TObject);
    procedure mnuCtasBancEmpClick(Sender: TObject);
    procedure mnuManBenefChequePorCuitClick(Sender: TObject);
    procedure mnuManMotivoCancLiquidacionesClick(Sender: TObject);
    procedure mnuManMotivosDeDiferenciaClick(Sender: TObject);
    procedure mnuManMontoMaxAprobPorUsuarioClick(Sender: TObject);
    procedure mnuManImportesAMPO_nuevoClick(Sender: TObject);
    procedure mnuListPagosJudicialesClick(Sender: TObject);
    procedure mnuListSiniConLiqMensualesClick(Sender: TObject);
    procedure mnuManActualizacionValoresClick(Sender: TObject);
    procedure mnuAdmCartasClick(Sender: TObject);
    procedure mnuMotBajaPuestaDispClick(Sender: TObject);
    procedure mnuManLiquidadoresClick(Sender: TObject);
    procedure mnuSeguimientoCasosPagoDirClick(Sender: TObject);
    procedure mnuMotivosBajaCasosClick(Sender: TObject);
    procedure mnuSeguimientoCasosILPClick(Sender: TObject);
    procedure mnuSinNoAutorizadosClick(Sender: TObject);
    procedure mnuSeguimientoCasosMortalesClick(Sender: TObject);
    procedure mnuLiquidacionesModificadasClick(Sender: TObject);
    procedure mnuSegRemisionFondosClick(Sender: TObject);
    procedure mnuAccionesRemisionFondosClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unDmPrincipal, UnLiqBeneficiarios, unCustomConsulta, unBeneficiarios,
  General, unListPagosDirILT, unListLiqDocUsuario,
  unListLiqIncapacidades, unLiquidacionesCompensables,
  unLiquidacionesAprobadas, unManAcreedores, unManZonasAFIP,
  unManMotivoBajaLiqAut, unManCAN_CHEQUEANOMBRE, unListGralLiquidaciones,
  unAperturaSiniestro, unManSegRetiro, unManAFJP, unManEmpresasBloqueoILT,
  unMantMontosAsigFam, unMantTiposAsigFam, unMantImportesValoresAmpo,
  unMantEmpresasSinTopeAMPO, unLiqAprobacion, unManObrasSociales,
  unLiqCartasDocumento, unCartasDocSinDDJJ, unLiqIncapacidades,
  unLiqAutomaticas, unListResumenDinerarias, unManLiquidadoresxCUIT,
  unSeguimientoDocumentacion, unManEmpresasPagoDirectoILT,
  unManTipoDocumento, unSeguimientoCasosLiquidar, unManMotivosAportes,
  unListAportesContribuciones, unListControversiaReserva,
  unListSiniestrosConEmbargo, unActInfoDictamen, unSinGranInvalidez,
  unCtasBancEmp, unManBenefChequePorCuit, unManMotivoCancLiquidaciones,
  unManMotivosDeDiferencia, unManMontoMaxAprobPorUsuario,
  unManImportesValoresAmpo, unListPagosJudiciales,
  unListSiniConLiqMensuales, unManActualizacionValores,
  unPuestaDisposicion, unDinerariasAdministracionCartas, unComunes,
  unManMotBajaPuestaDisp, unTableroControl, unManLiquidadores,
  unSeguimientoCasosPagoDir, unMotivosBajaCasos, unSeguimientoCasosILP,
  unSiniestrosNoAutorizados, unSeguimientoCasosMortales, unLiquidacionesModificadas,
  unSegRemisionFondos, unAccionesRemisionFondos;

{$R *.dfm}

procedure TfrmPrincipal.mnuLiqMortBeneficiariosClick(Sender: TObject);
begin
  Abrir(TfrmBeneficiarios, frmBeneficiarios, tmvMDIChild, mnuLiqMortBeneficiarios);
end;

procedure TfrmPrincipal.mnuLiqMortCalculosClick(Sender: TObject);
begin
  Abrir(TfrmLiqBeneficiarios, frmLiqBeneficiarios, tmvMDIChild, mnuLiqMortCalculos);
end;

procedure TfrmPrincipal.mnuListLiqAprobadasClick(Sender: TObject);
begin
  Abrir(TfrmLiquidacionesAprobadas, frmLiquidacionesAprobadas, tmvMDIChild, mnuListLiqAprobadas);
end;

procedure TfrmPrincipal.mnuListPagosDirILTClick(Sender: TObject);
begin
   Abrir(TfrmListPagosDirILT, frmListPagosDirILT, tmvMDIChild, mnuListPagosDirILT);
end;

procedure TfrmPrincipal.mnuListTableroControlClick(Sender: TObject);
begin
  Abrir(TfrmTableroControl, frmTableroControl, tmvMDIChild, mnuListTableroControl);
end;

procedure TfrmPrincipal.mnuListLiqIncapacidadesClick(Sender: TObject);
begin
  Abrir(TfrmListLiqIncapacidades, frmListLiqIncapacidades, tmvMDIChild, mnuListLiqIncapacidades);
end;

procedure TfrmPrincipal.mnuListLiqCompensablesClick(Sender: TObject);
begin
  Abrir(TfrmLiquidacionesCompensables, frmLiquidacionesCompensables, tmvMDIChild, mnuListLiqCompensables);
end;

procedure TfrmPrincipal.mnuManOtrosAcreedoresClick(Sender: TObject);
begin
  Abrir(TfrmManAcreedores, frmManAcreedores, tmvMDIChild, mnuManOtrosAcreedores);
  frmManAcreedores.Origen := oPrestDin;
end;

procedure TfrmPrincipal.mnuManZonasAfipClick(Sender: TObject);
begin
  Abrir(TfrmManZonasAFIP, frmManZonasAFIP, tmvMDIChild, mnuManZonasAfip);
end;

procedure TfrmPrincipal.mnuManMotBajaLiqAutClick(Sender: TObject);
begin
  Abrir(TfrmManMotivoBajaLiqAut, frmManMotivoBajaLiqAut, tmvMDIChild, mnuManMotBajaLiqAut);
end;

procedure TfrmPrincipal.mnuManBeneficiariosChequeClick(Sender: TObject);
begin
  Abrir(TfrmManCAN_CHEQUEANOMBRE, frmManCAN_CHEQUEANOMBRE, tmvMDIChild, mnuManBeneficiariosCheque);
end;

procedure TfrmPrincipal.mnuListGralLiquidacionesClick(Sender: TObject);
begin
  Abrir(TfrmListGralLiquidaciones, frmListGralLiquidaciones, tmvMDIChild, mnuListGralLiquidaciones);
end;

procedure TfrmPrincipal.mnuManFechaReaperturaClick(Sender: TObject);
begin
  Abrir(TfrmAperturaSiniestro, frmAperturaSiniestro, tmvMDIChild, mnuManFechaReapertura);
end;

procedure TfrmPrincipal.mnuManCiaSegRetiroClick(Sender: TObject);
begin
  with TfrmManSegRetiro.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManAFJPClick(Sender: TObject);
begin
  with TfrmManAFJP.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManObrasSocialesClick(Sender: TObject);
begin
  Abrir(TfrmManObrasSociales, frmManObrasSociales, tmvMDIChild, mnuManObrasSociales);
end;

procedure TfrmPrincipal.mnuManEmpBloqueoILTClick(Sender: TObject);
begin
  Abrir(TfrmManEmpresasBloqueoILT, frmManEmpresasBloqueoILT, tmvMDIChild, mnuManEmpBloqueoILT);
end;

procedure TfrmPrincipal.mnuManTiposAsigFamClick(Sender: TObject);
begin
  with TfrmMantTiposAsigFam.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManMontosAsigFamClick(Sender: TObject);
begin
  with TfrmMantMontosAsigFam.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManImportesAMPOClick(Sender: TObject);
begin
  with TfrmMantImportesValoresAmpo.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManEmpresasSinAMPOClick(Sender: TObject);
begin
  with TfrmMantEmpresasSinTopeAMPO.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuLiqAprobIndivClick(Sender: TObject);
begin
  Abrir(TfrmLiqAprobacion, frmLiqAprobacion, tmvMDIChild, mnuLiqAprobIndiv);
end;

procedure TfrmPrincipal.mnuLiqAprobMasivaClick(Sender: TObject);
begin
  Abrir(TfrmLiqAprobacion, frmLiqAprobacion, tmvMDIChild, mnuLiqAprobMasiva);
end;

procedure TfrmPrincipal.mnuCartasDocPuestaDispClick(Sender: TObject);
begin
  //Abrir(TfrmLiqCartasDoc, frmLiqCartasDoc, tmvMDIChild, mnuCartasDocPuestaDisp);
  Abrir(TfrmPuestaDisposicion, frmPuestaDisposicion, tmvMDIChild, mnuCartasDocPuestaDisp);
end;

procedure TfrmPrincipal.mnuSeguimientoCasosMortalesClick(Sender: TObject);
begin
  Abrir(TfrmSeguimCasosMortales, frmSeguimCasosMortales, tmvMDIChild, mnuSeguimientoCasosMortales);
end;

procedure TfrmPrincipal.mnuCartasDocILPsinDDJJClick(Sender: TObject);
begin
  Abrir(TfrmCartasDocSinDDJJ, frmCartasDocSinDDJJ, tmvMDIChild, mnuCartasDocILPsinDDJJ);
end;

procedure TfrmPrincipal.mnuLiqIncapacidadesClick(Sender: TObject);
begin
  Abrir(TfrmLiqIncapacidades, frmLiqIncapacidades, tmvMDIChild, mnuLiqIncapacidades);
end;

procedure TfrmPrincipal.mnuLiqGenAutomaticaClick(Sender: TObject);
begin
  Abrir(TfrmLiqAutomaticas, frmLiqAutomaticas, tmvMDIChild, mnuLiqGenAutomatica);
end;

procedure TfrmPrincipal.mnuResumenLiqDinerariasClick(Sender: TObject);
begin
  Abrir(TfrmListResumenDinerarias, frmListResumenDinerarias, tmvMDIChild, mnuResumenLiqDinerarias);
end;

procedure TfrmPrincipal.mnuManLiquidadoresClick(Sender: TObject);
begin
  Abrir(TfrmManLiquidadores, frmManLiquidadores, tmvMDIChild, mnuManLiquidadores);
end;

procedure TfrmPrincipal.mnuManLiquidadoresPorCUITClick(Sender: TObject);
begin
  Abrir(TfrmManLiquidadoresxCUIT, frmManLiquidadoresxCUIT, tmvMDIChild, mnuManLiquidadoresPorCUIT);
end;

procedure TfrmPrincipal.MnuSeguimientoDocumentacionClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoDocumentacion, frmSeguimientoDocumentacion, tmvMDIChild, MnuSeguimientoDocumentacion);
end;

procedure TfrmPrincipal.mnuManEmpresasPagoDirILTClick(Sender: TObject);
begin
  Abrir(TfrmManEmpresasPagoDirectoILT, frmManEmpresasPagoDirectoILT, tmvMDIChild, mnuManEmpresasPagoDirILT);
end;

procedure TfrmPrincipal.mnuManDocumentacionClick(Sender: TObject);
begin
  Abrir(TfrmManTipoDocumento, frmManTipoDocumento, tmvMDIChild, mnuManDocumentacion);
end;

procedure TfrmPrincipal.mnuSegRemisionFondosClick(Sender: TObject);
begin
  Abrir(TfrmSegRemisionFondos, frmSegRemisionFondos, tmvMDIChild, mnuSegRemisionFondos);
end;

procedure TfrmPrincipal.mnuSeguimientoCasosILPClick(Sender: TObject);
begin
  Abrir(TfrmSeguimCasosILP, frmSeguimCasosILP, tmvMDIChild, mnuSeguimientoCasosILP);
end;

procedure TfrmPrincipal.mnuSeguimientoCasosLiquidarClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoCasosLiquidar, frmSeguimientoCasosLiquidar, tmvMDIChild, mnuSeguimientoCasosLiquidar);
end;

procedure TfrmPrincipal.mnuSeguimientoCasosPagoDirClick(Sender: TObject);
begin
  Abrir(TfrmSeguimCasosPagoDir, frmSeguimCasosPagoDir, tmvMDIChild, mnuSeguimientoCasosPagoDir);
end;

procedure TfrmPrincipal.mnuManMotivosAportesClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosAportes, frmManMotivosAportes, tmvMDIChild, mnuManMotivosAportes);
end;

procedure TfrmPrincipal.mnuListAportesContribucionesClick(Sender: TObject);
begin
  Abrir(TfrmListAportesContribuciones, frmListAportesContribuciones, tmvMDIChild, mnuListAportesContribuciones);
end;

procedure TfrmPrincipal.mnuListControversiaReservaClick(Sender: TObject);
begin
  Abrir(TfrmListControversiaReserva, frmListControversiaReserva, tmvMDIChild, mnuListControversiaReserva);
end;

procedure TfrmPrincipal.mnuListSiniestrosConEmbargoClick(Sender: TObject);
begin
  Abrir(TfrmListSiniestrosConEmbargo, frmListSiniestrosConEmbargo, tmvMDIChild, mnuListSiniestrosConEmbargo);
end;

procedure TfrmPrincipal.mnuAccionesRemisionFondosClick(Sender: TObject);
begin
  Abrir(TfrmAccionesRemisionFondos, frmAccionesRemisionFondos, tmvMDIChild, mnuAccionesRemisionFondos);

end;

procedure TfrmPrincipal.mnuActInfoDictamenClick(Sender: TObject);
begin
  Abrir(TfrmActInfoDictamen, frmActInfoDictamen, tmvMDIChild, mnuActInfoDictamen);
end;

procedure TfrmPrincipal.mnuSinGranInvalidezClick(Sender: TObject);
begin

  Abrir(TfrmSinGranInvalidez, frmSinGranInvalidez, tmvMDIChild, mnuSinGranInvalidez);
end;

procedure TfrmPrincipal.mnuSinNoAutorizadosClick(Sender: TObject);
begin
  Abrir(TfrmSiniestrosNoAutorizados, frmSiniestrosNoAutorizados, tmvMDIChild, mnuSinNoAutorizados);
end;

procedure TfrmPrincipal.mnuCtasBancEmpClick(Sender: TObject);
begin
  Abrir(TfrmCtasBancEmp, frmCtasBancEmp, tmvMDIChild, mnuCtasBancEmp);
end;

procedure TfrmPrincipal.mnuManBenefChequePorCuitClick(Sender: TObject);
begin
  Abrir(TfrmManBenefChequePorCuit, frmManBenefChequePorCuit, tmvMDIChild, mnuManBenefChequePorCuit);   // TK  39134
end;

procedure TfrmPrincipal.mnuManMotivoCancLiquidacionesClick(Sender: TObject);
begin
  Abrir(TfrmManMotivoCancLiquidaciones, frmManMotivoCancLiquidaciones, tmvMDIChild, mnuManMotivoCancLiquidaciones);   // Plan Registro de pagos cancelados
end;

procedure TfrmPrincipal.mnuManMotivosDeDiferenciaClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosDeDiferencia, frmManMotivosDeDiferencia, tmvMDIChild, mnuManMotivosDeDiferencia);    // TK 39345
end;

procedure TfrmPrincipal.mnuManMontoMaxAprobPorUsuarioClick(Sender: TObject);  // TK 43455
begin
  Abrir(TfrmManMontoMaxAprobPorUsuario, frmManMontoMaxAprobPorUsuario, tmvMDIChild, mnuManMontoMaxAprobPorUsuario);
end;

procedure TfrmPrincipal.mnuManImportesAMPO_nuevoClick(Sender: TObject);     // TK 43975 nueva pantalla que va a reemplazar a la otra
begin
  Abrir(TfrmManImportesValoresAmpo, frmManImportesValoresAmpo, tmvMDIChild, mnuManImportesAMPO_nuevo);
end;

procedure TfrmPrincipal.mnuListPagosJudicialesClick(Sender: TObject);
begin
  Abrir(TfrmListPagosJudiciales, frmListPagosJudiciales, tmvMDIChild, mnuListPagosJudiciales);    // por Plan Pagos Judiciales
end;

procedure TfrmPrincipal.mnuListSiniConLiqMensualesClick(Sender: TObject);
begin
  Abrir(TfrmListSiniConLiqMensuales, frmListSiniConLiqMensuales, tmvMDIChild, mnuListSiniConLiqMensuales);    // por Plan SIPA

end;

procedure TfrmPrincipal.mnuManActualizacionValoresClick(Sender: TObject);
begin
  Abrir(TfrmManActualizacionValores, frmManActualizacionValores, tmvMDIChild, mnuManActualizacionValores);       // por plan RIPTE
end;

procedure TfrmPrincipal.mnuAdmCartasClick(Sender: TObject);
begin
  mnuAdmCartas.Enabled := False;
  with TfrmDinerariasAdministracionCartas.Create(Self) do
  begin
    Area      := AREA_DIN;
    MenuItem  := mnuAdmCartas;
    FormStyle := fsMDIChild;
  end;

end;

procedure TfrmPrincipal.mnuMotBajaPuestaDispClick(Sender: TObject);
begin
  Abrir(TfrmMotBajaPuestaDisp, frmMotBajaPuestaDisp, tmvMDIChild, mnuMotBajaPuestaDisp);

end;

procedure TfrmPrincipal.mnuMotivosBajaCasosClick(Sender: TObject);
begin
  Abrir(TfrmMotivosBajaCasos, frmMotivosBajaCasos, tmvMDIChild, mnuMotivosBajaCasos);
end;

procedure TfrmPrincipal.mnuLiquidacionesModificadasClick(Sender: TObject);
begin
  Abrir(TfrmLiquidacionesModificadas, frmLiquidacionesModificadas, tmvMDIChild, mnuLiquidacionesModificadas);
end;


end.
