unit unPrincipal;

interface

uses
  SysUtils, Classes, XPMenu, ImgList, Controls, artSeguridad, Login,
  artDbLogin, Graphics, ExtCtrls, Forms, Buttons, ComCtrls, Menus, 
  ToolWin, unDmPrincipal, General, unCustomPrincipal, AdvOfficeHint,
  Dialogs, JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton,
  Placemnt;
                       
{
ResourceString
     REG_SOURCE      = 'Software\ART\ArchSin';
     REG_REPORTE     = 'Software\FireSoft\Reportes';
     REG_INFORME100  = 'ExportarInforme100';
     FILE_INFORME100 = 'INFORME100.DOC';
}

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    imgGenColor: TImageList;
    imgGenBW: TImageList;
    imgLogo: TImage;
    mnuReconfirmaciones: TMenuItem;
    mnuSegReconfirmaciones: TMenuItem;
    mnuEstudio: TMenuItem;
    AnlisisySeguimiento1: TMenuItem;
    mnuAdmCartasDoc: TMenuItem;
    mnuSeguimientoPQ: TMenuItem;
    mnuSeguimientoEstudios: TMenuItem;
    mnuSeguimientoLotes: TMenuItem;
    mnuAsigLotes: TMenuItem;
    mnuInformes: TMenuItem;
    mnuDetInfoAMP: TMenuItem;
    N3: TMenuItem;
    mnuAnormPorCIIU: TMenuItem;
    mnuConsEstTipPeriodo: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuCartas: TMenuItem;
    MnuManCodRecepcion: TMenuItem;
    mnuManFirmantesCartas: TMenuItem;
    mnuManAreasCartasDoc: TMenuItem;
    mnuTextosCartasDocumento: TMenuItem;
    mnuRelaciones: TMenuItem;
    mnuEstudiosporRiesgo: TMenuItem;
    mnuRiesgoporActividad: TMenuItem;
    N5: TMenuItem;
    MotivosenLotes1: TMenuItem;
    mnuMotivosDebito: TMenuItem;
    mnuMotivosBajaTrab: TMenuItem;
    mnuMotivosTerminacionLote: TMenuItem;
    mnuMotivosAnulacionLote: TMenuItem;
    mnuMotivosBajaLote: TMenuItem;
    mnuMotivosRechazoLote: TMenuItem;
    mnuUbicacionesGeograficas: TMenuItem;
    mnuManPRG_RIESGOS: TMenuItem;
    mnuMedicos: TMenuItem;
    mnuManCtb: TMenuItem;
    mnuEstudios: TMenuItem;
    mnuConsExpuestos: TMenuItem;
    mnuTransicionesDeEstados: TMenuItem;
    mnuEstadosdeLotes: TMenuItem;
    LotesdeEstudios1: TMenuItem;
    mnuEstudiosAsociados: TMenuItem;
    mnuProtPosForzadas: TMenuItem;
    mnuHistoriasClinicas: TMenuItem;
    mnuPerfilAMP: TMenuItem;
    mnuUsuariosPerfilesAMP: TMenuItem;
    Reconfirmaciones1: TMenuItem;
    mnuMotivosdeRechazo: TMenuItem;
    mnuAsigLotesReconf: TMenuItem;
    mnuSegLotesReconf: TMenuItem;
    mnuSegRec: TMenuItem;
    mnuAnalisisAsignacionLote: TMenuItem;
    mnuObservacionesSubLotes: TMenuItem;
    mnuNotifcacionEmpresa: TMenuItem;
    mnuGestionRelevamientosExpuestos: TMenuItem;
    mnuEstadoPresentacion: TMenuItem;
    mnuCausa: TMenuItem;
    mnuManAsignacionFijadePreventores: TMenuItem;
    mnuCotizacion: TMenuItem;
    mnuPrestadoresFijos: TMenuItem;
    procedure mnuRiesgoporActividadClick(Sender: TObject);
    procedure mnuEstudiosporRiesgoClick(Sender: TObject);
    procedure mnuEstudiosClick(Sender: TObject);
    procedure mnuManPRG_RIESGOSClick(Sender: TObject);
    procedure mnuAnormPorCIIUClick(Sender: TObject);
    procedure mnuDetInfoAMPClick(Sender: TObject);
    procedure mnuAsigLotesClick(Sender: TObject);
    procedure mnuEstudioClick(Sender: TObject);
    procedure mnuSegReconfirmacionesClick(Sender: TObject);
    procedure mnuManCtbClick(Sender: TObject);
    procedure mnuConsEstTipPeriodoClick(Sender: TObject);
    procedure mnuMedicosClick(Sender: TObject);
    procedure mnuSeguimientoLotesClick(Sender: TObject);
    procedure mnuSeguimientoEstudiosClick(Sender: TObject);
    procedure mnuSeguimientoPQClick(Sender: TObject);
    procedure mnuMotivosBajaTrabClick(Sender: TObject);
    procedure mnuMotivosRechazoLoteClick(Sender: TObject);
    procedure mnuMotivosBajaLoteClick(Sender: TObject);
    procedure mnuMotivosAnulacionLoteClick(Sender: TObject);
    procedure mnuMotivosTerminacionLoteClick(Sender: TObject);
    procedure mnuMotivosDebitoClick(Sender: TObject);
    procedure mnuAdmCartasDocClick(Sender: TObject);
    procedure mnuManAreasCartasDocClick(Sender: TObject);
    procedure mnuManFirmantesCartasClick(Sender: TObject);
    procedure MnuManCodRecepcionClick(Sender: TObject);
    procedure mnuTextosCartasDocumentoClick(Sender: TObject);
    procedure mnuConsExpuestosClick(Sender: TObject);
    procedure mnuTransicionesDeEstadosClick(Sender: TObject);
    procedure mnuEstadosdeLotesClick(Sender: TObject);
    procedure mnuEstudiosAsociadosClick(Sender: TObject);
    procedure mnuProtPosForzadasClick(Sender: TObject);
    procedure mnuPerfilAMPClick(Sender: TObject);
    procedure mnuUsuariosPerfilesAMPClick(Sender: TObject);
    procedure mnuMotivosdeRechazoClick(Sender: TObject);
    procedure mnuAsigLotesReconfClick(Sender: TObject);
    procedure mnuSegLotesReconfClick(Sender: TObject);
    procedure mnuSegRecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuAnalisisAsignacionLoteClick(Sender: TObject);
    procedure mnuManAsignacionFijadePreventoresClick(Sender: TObject);
    procedure mnuObservacionesSubLotesClick(Sender: TObject);
    procedure mnuNotifcacionEmpresaClick(Sender: TObject);
    procedure mnuGestionRelevamientosExpuestosClick(Sender: TObject);
    procedure mnuEstadoPresentacionClick(Sender: TObject);
    procedure mnuCausaClick(Sender: TObject);
    procedure mnuCotizacionClick(Sender: TObject);
    procedure mnuPrestadoresFijosClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

uses
  GamaCIIU, Explota, unAbmAnalisis, unManPRG_RIESGOS, unComunes, unManMedicos,
  UnManEstudioRiesgo, unManActividadRiesgo, unManEstudios, unManCtbTablasAMP,
  unConsEstTipPeriodoClick, unManCtbUbicGeograficas, unGenLotesAMP,
  unSeguimientoLote, unSeguimientoEstudios, unSeguimientoPQ, unManMotivosBaja,
  unManMotivosRechazo, unElementosEnviados, unAMPAdministracionCartas,
  unManCAT_AREATEXTO, unManCFI_FIRMA, unManCTB_CODRE, unManCTC_TEXTOCARTA,
  unConsRelevExpuestos, unManTransicionEstados, unManEstadosLote,
  unManEstudiosAsociados, unProtPosForzadas, unManPerfilesAMP,
  unManUsuarioPerfilAMP, unGestionReconfirmacion, unGenLotesReconf,
  unSegReconfirmaciones, unAnalisisAsignacion,unManObservacionesSubLotes,
  unEmpresaNotificada, unGestionRelevamientosExpuestos, unManEstadoPresentacion,
  unManCausa, unManAsigPrestaFijo, unCotizacionHYS, unManPrestadorContrato;

procedure TfrmPrincipal.mnuRiesgoporActividadClick(Sender: TObject);
begin
  TfrmManActividadRiesgo.Create( Self );
  mnuRiesgoporActividad.Enabled := False;
end;

procedure TfrmPrincipal.mnuEstudiosporRiesgoClick(Sender: TObject);
begin
  TfrmManEstudioRiesgo.Create( Self );
  mnuEstudiosporRiesgo.Enabled := False;
end;

procedure TfrmPrincipal.mnuEstudiosClick(Sender: TObject);
begin
  with TfrmManEstudios.Create( Self ) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManPRG_RIESGOSClick(Sender: TObject);
begin
  TfrmManPRG_RIESGOS.Create( Self );
  mnuManPRG_RIESGOS.Enabled := False;
end;

procedure TfrmPrincipal.mnuAnormPorCIIUClick(Sender: TObject);
var
  GamaCIU: TGamaCIU;
begin
  GamaCIU := TGamaCIU.Create( Self );
  try
    GamaCIU.ShowModal;
  finally
    GamaCIU.Free;
  end;
end;

procedure TfrmPrincipal.mnuDetInfoAMPClick(Sender: TObject);
var
  frmExplota: TfrmExplota;
begin
  frmExplota := TfrmExplota.Create( Self );
  try
    frmExplota.ShowModal;
  finally
    frmExplota.Free;
  end;
end;

procedure TfrmPrincipal.mnuAsigLotesClick(Sender: TObject);
begin
  TfrmGenLotesAMP.Create(mnuAsigLotes);
end;

procedure TfrmPrincipal.mnuEstudioClick(Sender: TObject);
begin
  Abrir(TfrmAbmAnalisis, frmAbmAnalisis, tmvMDIChild, mnuHistoriasClinicas);
end;

procedure TfrmPrincipal.mnuSegReconfirmacionesClick(Sender: TObject);
begin
  TfrmGestionReconfirmacion.Create(mnuSegReconfirmaciones);
end;

procedure TfrmPrincipal.mnuManCtbClick(Sender: TObject);
begin
  with TfrmManCtbTablasAMP.Create( Self ) do
  begin
    MenuItem  := TMenuItem( Sender );
    Caption   := 'Mantenimiento de ' + StringReplace(MenuItem.Caption, '&', '', []);
    Clave     := MenuItem.Hint;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuConsEstTipPeriodoClick(Sender: TObject);
begin
  TfrmConsEstTipPeriodoClick.Create( Self );
end;

procedure TfrmPrincipal.mnuMedicosClick(Sender: TObject);
begin
  with TfrmManMedicos.Create( Self ) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuSeguimientoLotesClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoLote, frmSeguimientoLote, tmvMDIChild, mnuSeguimientoLotes);
  frmSeguimientoLote.Caption := frmSeguimientoLote.Caption + ' - Periódicos';
end;

procedure TfrmPrincipal.mnuSeguimientoEstudiosClick(Sender: TObject);
begin
  TfrmSeguimientoEstudios.Create(mnuSeguimientoEstudios);
end;

procedure TfrmPrincipal.mnuSeguimientoPQClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoPQ, frmSeguimientoPQ, tmvMDIChild, mnuSeguimientoPQ);
end;

procedure TfrmPrincipal.mnuMotivosBajaTrabClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosBaja, frmManMotivosBaja, tmvMDIChild, mnuMotivosBajaTrab);
end;

procedure TfrmPrincipal.mnuMotivosRechazoLoteClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosRechazo, frmManMotivosRechazo, tmvMDIChild, mnuMotivosRechazoLote);
  frmManMotivosRechazo.Caption := 'Motivos de Rechazo de Lotes';
  frmManMotivosRechazo.FTipo := 'R';
  frmManMotivosRechazo.tbRefrescarClick(nil)
end;

procedure TfrmPrincipal.mnuMotivosBajaLoteClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosRechazo, frmManMotivosRechazo, tmvMDIChild, mnuMotivosBajaLote);
  frmManMotivosRechazo.Caption := 'Motivos de Baja de Lotes';
  frmManMotivosRechazo.FTipo := 'B';
  frmManMotivosRechazo.tbRefrescarClick(nil)
end;

procedure TfrmPrincipal.mnuMotivosAnulacionLoteClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosRechazo, frmManMotivosRechazo, tmvMDIChild, mnuMotivosAnulacionLote);
  frmManMotivosRechazo.Caption := 'Motivos de Anulación de Lotes';
  frmManMotivosRechazo.FTipo := 'A';
  frmManMotivosRechazo.tbRefrescarClick(nil)
end;

procedure TfrmPrincipal.mnuMotivosTerminacionLoteClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosRechazo, frmManMotivosRechazo, tmvMDIChild, mnuMotivosAnulacionLote);
  frmManMotivosRechazo.Caption := 'Motivos de Terminación de Lotes';
  frmManMotivosRechazo.FTipo := 'T';
  frmManMotivosRechazo.tbRefrescarClick(nil)
end;

procedure TfrmPrincipal.mnuMotivosDebitoClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosRechazo, frmManMotivosRechazo, tmvMDIChild, mnuMotivosDebito);
  frmManMotivosRechazo.Caption := 'Motivos de Débito de Estudios';
  frmManMotivosRechazo.FTipo := 'D';
  frmManMotivosRechazo.tbRefrescarClick(nil)
end;

procedure TfrmPrincipal.mnuAdmCartasDocClick(Sender: TObject);
var
  frmAMPAdministracionCartas: TfrmAMPAdministracionCartas;
begin
  Abrir(TfrmAMPAdministracionCartas, frmAMPAdministracionCartas, tmvMDIChild, mnuAdmCartasDoc);
  frmAMPAdministracionCartas.Area := AREA_MLB;
  frmAMPAdministracionCartas.Caption := 'Administración de Cartas Documento AMP';
end;

procedure TfrmPrincipal.mnuManAreasCartasDocClick(Sender: TObject);
begin
  with TfrmManCAT_AREATEXTO.Create(Self) do
  begin
    Area      := aMedLab;
    MenuItem  := mnuManAreasCartasDoc;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuManFirmantesCartasClick(Sender: TObject);
begin
  with TfrmManCFI_FIRMA.Create(Self) do
  begin
    Area      := aMedLab;
    MenuItem  := mnuManFirmantesCartas;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.MnuManCodRecepcionClick(Sender: TObject);
begin
  with TfrmManCTB_CODRE.Create(Self) do
  begin
    MenuItem  := MnuManCodRecepcion;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuTextosCartasDocumentoClick(Sender: TObject);
begin
  with TfrmManCTC_TEXTOCARTA.Create(Self) do
  begin
    Area      := aMedLab;
    MenuItem  := mnuTextosCartasDocumento;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuConsExpuestosClick(Sender: TObject);
begin
  TfrmConsExpuestos.Create(mnuConsExpuestos);
end;

procedure TfrmPrincipal.mnuTransicionesDeEstadosClick(Sender: TObject);
begin
  Abrir(TfrmManTransicionEstados, frmManTransicionEstados, tmvMDIChild, mnuTransicionesDeEstados);
end;

procedure TfrmPrincipal.mnuEstadosdeLotesClick(Sender: TObject);
begin
  Abrir(TfrmManEstadosLote, frmManEstadosLote, tmvMDIChild, mnuEstadosdeLotes);
end;

procedure TfrmPrincipal.mnuEstudiosAsociadosClick(Sender: TObject);
begin
  Abrir(TfrmManEstudiosAsociados, frmManEstudiosAsociados, tmvMDIChild, mnuEstudiosAsociados);
end;

procedure TfrmPrincipal.mnuProtPosForzadasClick(Sender: TObject);
begin
  Abrir(TfrmProtPosForzadas, frmProtPosForzadas, tmvMDIChild, mnuProtPosForzadas);
end;

procedure TfrmPrincipal.mnuPerfilAMPClick(Sender: TObject);
begin
  Abrir(TfrmManPerfilesAMP, frmManPerfilesAMP, tmvMDIChild, mnuPerfilAMP);
end;

procedure TfrmPrincipal.mnuUsuariosPerfilesAMPClick(Sender: TObject);
begin
  with TfrmManUsuariosPerfilesAMP.Create( Self ) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuMotivosdeRechazoClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosRechazo, frmManMotivosRechazo, tmvMDIChild, mnuMotivosRechazoLote);
  frmManMotivosRechazo.Caption := 'Motivos de Rechazo de Reconfirmaciones';
  frmManMotivosRechazo.FTipo := 'F';
  frmManMotivosRechazo.tbRefrescarClick(nil)
end;

procedure TfrmPrincipal.mnuAsigLotesReconfClick(Sender: TObject);
begin
  TfrmGenLotesReconf.Create(mnuAsigLotesReconf);
end;

procedure TfrmPrincipal.mnuSegLotesReconfClick(Sender: TObject);
begin
  Abrir(TfrmSeguimientoLote, frmSeguimientoLoteReconf, tmvMDIChild, mnuSegLotesReconf);
  frmSeguimientoLoteReconf.Caption := frmSeguimientoLoteReconf.Caption + ' - Reconfirmaciones';
  frmSeguimientoLoteReconf.FOrigenAMP := false;
  frmSeguimientoLoteReconf.ActualizarStatusBar;
end;

procedure TfrmPrincipal.mnuSegRecClick(Sender: TObject);
begin
  Abrir(TfrmSegReconfirmaciones, frmSegReconfirmaciones, tmvMDIChild, mnuSegRec);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Seguridad.Ejecutar
end;

procedure TfrmPrincipal.mnuAnalisisAsignacionLoteClick(Sender: TObject);
begin
  Abrir(TfrmAnalisisAsignacion, frmAnalisisAsignacion, tmvMDIChild, nil);
end;

procedure TfrmPrincipal.mnuManAsignacionFijadePreventoresClick(Sender: TObject);
begin
  Abrir(TfrmManAsigPrestaFijo, frmManAsigPrestaFijo, tmvMDIChild, mnuManAsignacionFijadePreventores);
  frmManAsigPrestaFijo.Caption := StringReplace(mnuManAsignacionFijadePreventores.Caption, '&', '', []);
end;

procedure TfrmPrincipal.mnuObservacionesSubLotesClick(Sender: TObject);
begin
  Abrir(TfrmManObservacionesSubLotes, frmManObservacionesSubLotes, tmvMDIChild, mnuObservacionesSubLotes);
end;

procedure TfrmPrincipal.mnuNotifcacionEmpresaClick(Sender: TObject);
begin
  Abrir(TfrmEmpresaNotificada,frmEmpresaNotificada,tmvMDIChild,mnuNotifcacionEmpresa);
end;

procedure TfrmPrincipal.mnuGestionRelevamientosExpuestosClick(
  Sender: TObject);
begin
  inherited;
  Abrir(TfrmGestionRelevamientosExpuestos,frmGestionRelevamientosExpuestos,tmvMDIChild,mnuGestionRelevamientosExpuestos);
end;

procedure TfrmPrincipal.mnuEstadoPresentacionClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManEstadoPresentacion,frmManEstadoPresentacion,tmvMDIChild,mnuEstadoPresentacion);
end;

procedure TfrmPrincipal.mnuCausaClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManCausa,frmManCausa,tmvMDIChild,mnuCausa);
end;

procedure TfrmPrincipal.mnuCotizacionClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmCotizacionHYS,frmCotizacionHYS,tmvMDIChild,mnuCotizacion);
end;

procedure TfrmPrincipal.mnuPrestadoresFijosClick(Sender: TObject);
begin
  Abrir(TfrmManPrestadorContrato,frmManPrestadorContrato,tmvMDIChild,mnuPrestadoresFijos);
end;

end.

