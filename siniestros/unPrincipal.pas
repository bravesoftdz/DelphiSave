unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ToolWin, ComCtrls, StdCtrls, ImgList, artSeguridad, artDbLogin,
  Login, jpeg, ExtCtrls, JvBackgrounds, JvTrayIcon, JvComponent,
  JvCaptionButton, XPMenu, JvThreadTimer, SDEngine, DB, unCustomForm,
  JvAppHotKey, AdvOfficeHint, unCustomPrincipal, unArtFrame,
  unArtDBAwareFrame, unFraStaticCodigoDescripcion, unFraStaticCodDesc,
  JvComponentBase, RxPlacemnt;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuSiniestros: TMenuItem;
    mnuIncapacidades: TMenuItem;
    mnuLiqIncapacidades: TMenuItem;
    mnuAdmSiniestros: TMenuItem;
    mnuSinCierreExp: TMenuItem;
    mnuMantenimientoLiq: TMenuItem;
    mnuSegIncapacidades: TMenuItem;
    mnuLiquidaciones: TMenuItem;
    mnuManIncapacidades: TMenuItem;
    mnuManComisionesMedicas: TMenuItem;
    mnuManUbicIncapacidad: TMenuItem;
    mnuListadosIncapacidad: TMenuItem;
    mnuEmisionFormularios: TMenuItem;
    mnuListGralIncapacidades: TMenuItem;
    mnuListIncAprobadas: TMenuItem;
    mnuListadosLiquidaciones: TMenuItem;
    mnuLiquidacionesAprobadas: TMenuItem;
    mnuMantenimiento: TMenuItem;
    N3: TMenuItem;
    mnuGestionDeImagenes: TMenuItem;
    mnuBajaPapeleria: TMenuItem;
    mnuListContCartasDoc: TMenuItem;
    mnuListDictEnfNoList: TMenuItem;
    mnuLiqAprobacion: TMenuItem;
    MnuLiqAprobIndiv: TMenuItem;
    MnuLiqAprobMasiva: TMenuItem;
    mnuManBeneficiariosCheque: TMenuItem;
    mnuResumenLiqDinerarias: TMenuItem;
    mnuSeparadorSiniestralidad: TMenuItem;
    mnuInformeSiniestralidad: TMenuItem;
    mnuTrabajadores: TMenuItem;
    mnuManEstabTemp: TMenuItem;
    N5: TMenuItem;
    mnuListados: TMenuItem;
    mnuListDenunciasGraves: TMenuItem;
    mnuSiniestrosNoAutorizados: TMenuItem;
    mnuAvisosDiarios: TMenuItem;
    mnuUsuariosAvisosDiarios: TMenuItem;
    mnuUsuariosCasosMortales: TMenuItem;
    mnuCasosMortales: TMenuItem;
    mnuAuditoriaILT: TMenuItem;
    mnuAvisosAuditILT: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mnuAgendaClick(Sender: TObject);
    procedure mnuLiqIncapacidadesClick(Sender: TObject);
    procedure mnuAdmSiniestrosClick(Sender: TObject);
    procedure mnuSinCierreExpClick(Sender: TObject);
    procedure mnuSegIncapacidadesClick(Sender: TObject);
    procedure mnuManComisionesMedicasClick(Sender: TObject);
    procedure mnuManUbicIncapacidadClick(Sender: TObject);
    procedure mnuEmisionFormulariosClick(Sender: TObject);
    procedure mnuListGralIncapacidadesClick(Sender: TObject);
    procedure mnuListIncAprobadasClick(Sender: TObject);
    procedure mnuLiquidacionesAprobadasClick(Sender: TObject);
    procedure mnuMantenimientoClick(Sender: TObject);
    procedure mnuGestionDeImagenesClick(Sender: TObject);
    procedure mnuBajaPapeleriaClick(Sender: TObject);
    procedure mnuInformeSiniestralidadClick(Sender: TObject);
    procedure mnuListContCartasDocClick(Sender: TObject);
    procedure mnuListDictEnfNoListClick(Sender: TObject);
    procedure MnuLiqAprobIndivClick(Sender: TObject);
    procedure MnuLiqAprobMasivaClick(Sender: TObject);
    procedure mnuManBeneficiariosChequeClick(Sender: TObject);
    procedure mnuResumenLiqDinerariasClick(Sender: TObject);
    procedure mnuTrabajadoresClick(Sender: TObject);
    procedure mnuManEstabTempClick(Sender: TObject);
    procedure mnuListDenunciasGravesClick(Sender: TObject);
    procedure mnuSiniestrosNoAutorizadosClick(Sender: TObject);
    procedure mnuAvisosDiariosClick(Sender: TObject);
    procedure mnuUsuariosAvisosDiariosClick(Sender: TObject);
    procedure mnuUsuariosCasosMortalesClick(Sender: TObject);
    procedure mnuCasosMortalesClick(Sender: TObject);
    procedure mnuAuditoriaILTClick(Sender: TObject);
    procedure mnuAvisosAuditILTClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
 	unCustomConsulta, unAdmSiniestros, unCITRIX, unDmPrincipal, General,
  unLibretaDeDirecciones, unMoldeEnvioMail, unElementosEnviados,
  SpoolFuncs, Printers, unAlarmas, unVisualizadorDigitalizacion,
  unFaxEnviados, unConsFax, unManRDO_DOCUMENTO, unLiqIncapacidades, unArt,
  unCierreExpedientes, unSegIncapacidades, unManComisionesMedicas, unManUbicIncap,
  unEmisionFormularios, unListGralSegIncapacidades, unListIncAprobadas,
  unLiquidacionesAprobadas, unContratoTrabajador, unGestionImagenes,
  unBajaPapeleria, unListContCartasDoc, unListDictEnfNoList, unLiqAprobacion,
  unManCAN_CHEQUEANOMBRE, unListResumenDinerarias, unFiltroRptSiniestralidad,
  unSesion, unManSET_ESTABLECIMIENTO_TEMPORAL, unListDenunciasGraves,
  unSiniestrosNoAutorizados, unAvisosDiarios, unManUsuariosDeAvisos ,
  unCasosMortales, unManUsuariosCasosMortales, unAuditoriaILT,
  unUsuAvisoAuditoriaILT;

{$R *.DFM}


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  mnuAdmSiniestros.Enabled    := Seguridad.Claves.IsActive('VerSiniestros');
  mnuSegIncapacidades.Enabled := Seguridad.Claves.IsActive('VerIncapacidades');
  mnuLiqIncapacidades.Enabled := Seguridad.Claves.IsActive('VerLiquidaciones');

  if Seguridad.Claves.IsActive('FechaInicioART_Especial') then
    SIN_ART_MINFECHA := OTR_MINFECHA
  else
    SIN_ART_MINFECHA := ART_MINFECHA;
  inherited;
  if Alarma.Saludo then
    MostrarAlarma(Application.Title, 'Bienvenido al sistema de Siniestros.');

  if Is_ConectadoProduccion and (Sesion.Sector <> 'COMPUTOS') then
  begin
    mnuInformeSiniestralidad.Visible := False;
    mnuSeparadorSiniestralidad.Visible := False;
  end;
end;

procedure TfrmPrincipal.mnuAgendaClick(Sender: TObject);
begin
//  Abrir(TfrmAdministracionEventosAREAMEDICA, frmAdministracionEventosAREAMEDICA, tmvMDIChild, mnuAgenda);
end;

procedure TfrmPrincipal.mnuAuditoriaILTClick(Sender: TObject);
begin
  Abrir(TfrmAuditoriaILT, frmAuditoriaILT, tmvMDIChild, mnuAuditoriaILT);
end;

procedure TfrmPrincipal.mnuLiqIncapacidadesClick(Sender: TObject);    // Plan 2015 - Avisos Diarios
begin
  Abrir(TfrmLiqIncapacidades, frmLiqIncapacidades, tmvMDIChild, mnuLiqIncapacidades);
end;

procedure TfrmPrincipal.mnuAdmSiniestrosClick(Sender: TObject);
begin
  Abrir(TfrmAdmSiniestros, frmAdmSiniestros, tmvMDIChild, mnuAdmSiniestros);
end;

procedure TfrmPrincipal.mnuSinCierreExpClick(Sender: TObject);
begin
  Abrir(TfrmCierreExpedientes, frmCierreExpedientes, tmvModal, mnuSinCierreExp);
end;

procedure TfrmPrincipal.mnuSiniestrosNoAutorizadosClick(Sender: TObject);
begin
  Abrir(TfrmSiniestrosNoAutorizados, frmSiniestrosNoAutorizados, tmvMDIChild, mnuSiniestrosNoAutorizados);
end;

procedure TfrmPrincipal.mnuSegIncapacidadesClick(Sender: TObject);
begin
  Abrir(TfrmSegIncapacidades, frmSegIncapacidades, tmvMDIChild, mnuSegIncapacidades);
end;

procedure TfrmPrincipal.mnuManComisionesMedicasClick(Sender: TObject);
begin
  with TfrmManComisionesMedicas.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManUbicIncapacidadClick(Sender: TObject);
begin
  with TfrmManUbicIncap.Create(Self) do
  try
    Execute;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuEmisionFormulariosClick(Sender: TObject);
begin
  Abrir(TfrmEmisionFormularios, frmEmisionFormularios, tmvMDIChild, mnuEmisionFormularios);
end;

procedure TfrmPrincipal.mnuListGralIncapacidadesClick(Sender: TObject);
begin
  Abrir(TfrmListGralSegIncapacidades, frmListGralSegIncapacidades, tmvMDIChild, mnuListGralIncapacidades);
end;

procedure TfrmPrincipal.mnuListIncAprobadasClick(Sender: TObject);
begin
  Abrir(TfrmListIncAprobadas, frmListIncAprobadas, tmvMDIChild, mnuListIncAprobadas);
end;

procedure TfrmPrincipal.mnuLiquidacionesAprobadasClick(Sender: TObject);
begin
  Abrir(TfrmLiquidacionesAprobadas, frmLiquidacionesAprobadas, tmvMDIChild, mnuLiquidacionesAprobadas);
end;

procedure TfrmPrincipal.mnuMantenimientoClick(Sender: TObject);
begin
//
end;

procedure TfrmPrincipal.mnuGestionDeImagenesClick(Sender: TObject);
begin
  Abrir(TfrmGestionImagenes, frmGestionImagenes, tmvMDIChild, mnuGestionDeImagenes);
end;

procedure TfrmPrincipal.mnuBajaPapeleriaClick(Sender: TObject);
begin
  Abrir(TfrmBajaPapeleria, frmBajaPapeleria, tmvMDIChild, mnuBajaPapeleria);
end;

procedure TfrmPrincipal.mnuCasosMortalesClick(Sender: TObject);
begin
  Abrir(TfrmCasosMortales, frmCasosMortales, tmvMDIChild, mnuCasosMortales);
end;

procedure TfrmPrincipal.mnuInformeSiniestralidadClick(Sender: TObject);
begin
  Abrir(TfrmFiltroRptSiniestralidad, frmFiltroRptSiniestralidad, tmvMDIChild, mnuInformeSiniestralidad);
end;

procedure TfrmPrincipal.mnuListContCartasDocClick(Sender: TObject);
begin
  Abrir(TfrmListContCartasDoc, frmListContCartasDoc, tmvMDIChild, mnuListContCartasDoc);  // TK 2233
end;

procedure TfrmPrincipal.mnuListDictEnfNoListClick(Sender: TObject);
begin
  Abrir(TfrmListDictEnfNoList, frmListDictEnfNoList, tmvMDIChild, mnuListDictEnfNoList);  // TK 4220
end;

procedure TfrmPrincipal.MnuLiqAprobIndivClick(Sender: TObject);
begin
  Abrir(TfrmLiqAprobacion, frmLiqAprobacion, tmvMDIChild, MnuLiqAprobIndiv);
end;

procedure TfrmPrincipal.MnuLiqAprobMasivaClick(Sender: TObject);
begin
  Abrir(TfrmLiqAprobacion, frmLiqAprobacion, tmvMDIChild, MnuLiqAprobMasiva);
end;

procedure TfrmPrincipal.mnuManBeneficiariosChequeClick(Sender: TObject);
begin
  Abrir(TfrmManCAN_CHEQUEANOMBRE, frmManCAN_CHEQUEANOMBRE, tmvMDIChild, mnuManBeneficiariosCheque);
end;

procedure TfrmPrincipal.mnuResumenLiqDinerariasClick(Sender: TObject);
begin
  Abrir(TfrmListResumenDinerarias, frmListResumenDinerarias, tmvMDIChild, mnuResumenLiqDinerarias);
end;

procedure TfrmPrincipal.mnuTrabajadoresClick(Sender: TObject);
begin
  inherited;
  with TfrmContratoTrabajador.Create(Self) do
  try
    FormStyle := fsMDIChild;
    //Show;
    DoCargarDatos(ART_EMPTY_ID);
  except
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManEstabTempClick(Sender: TObject);   // TK 21228
begin
  Abrir(TfrmManSET_ESTABLECIMIENTO_TEMPORAL, frmManSET_ESTABLECIMIENTO_TEMPORAL, tmvMDIChild, mnuManEstabTemp);
end;

procedure TfrmPrincipal.mnuListDenunciasGravesClick(Sender: TObject);   // TK 27721
begin
  Abrir(TfrmListDenunciasGraves, frmListDenunciasGraves, tmvMDIChild, mnuListDenunciasGraves);
end;


procedure TfrmPrincipal.mnuAvisosAuditILTClick(Sender: TObject);
begin
  Abrir(TfrmUsuAvisoAuditoriaILT, frmUsuAvisoAuditoriaILT, tmvMDIChild, mnuAvisosAuditILT);
end;

procedure TfrmPrincipal.mnuAvisosDiariosClick(Sender: TObject);
begin
  Abrir(TfrmAvisosDiarios, frmAvisosDiarios, tmvMDIChild, mnuAvisosDiarios);
end;

procedure TfrmPrincipal.mnuUsuariosAvisosDiariosClick(Sender: TObject);      // Plan Avisos Diarios
begin
  Abrir(TfrmManUsuariosDeAvisos, frmManUsuariosDeAvisos, tmvMDIChild, mnuUsuariosAvisosDiarios);
end;

procedure TfrmPrincipal.mnuUsuariosCasosMortalesClick(Sender: TObject);
begin
  Abrir(TfrmUsuariosCasosMortales, frmUsuariosCasosMortales, tmvMDIChild, mnuUsuariosCasosMortales);

end;

end.


