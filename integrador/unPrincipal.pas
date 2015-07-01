unit unPrincipal;

interface
                     
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, ToolWin, ComCtrls, StdCtrls, ImgList,
  artSeguridad, artDbLogin, Placemnt, Login, jpeg, ExtCtrls, JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton,
  XPMenu, JvThreadTimer, SDEngine, DB, unCustomForm, JvAppHotKey, AdvOfficeHint, unCustomPrincipal,
  JvComponentBase, RxPlacemnt, JvBaseDlg, JvDesktopAlert;
                                            
type                              
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuCRM: TMenuItem;
    mnuSiniestros: TMenuItem;
    mnuAdmSiniestros: TMenuItem;
    mnuLiqIncapacidades: TMenuItem;
    mnuAdmLicitaciones: TMenuItem;
    mnuComercial: TMenuItem;
    mnuLicitaciones: TMenuItem;
    mnuAlertas: TMenuItem;
    mnuSegIncapacidades: TMenuItem;
    mnuConfirmacionEndosos: TMenuItem;
    mnuAnalisisCliente: TMenuItem;
    Sep99: TMenuItem;
    mnuListadoDePrestadores: TMenuItem;
    N3: TMenuItem;
    mnuComMantenimiento: TMenuItem;
    mnuComManDelegacion: TMenuItem;
    mnuInformesSiniestralidad: TMenuItem;
    mnuSiniestralidad: TMenuItem;
    N5: TMenuItem;
    mnuGrandesCuentas: TMenuItem;
    mnuEmpresasVIP: TMenuItem;
    mnuMotivosEmpresasVIP: TMenuItem;
    mnuContratoVendedores: TMenuItem;
    N8: TMenuItem;
    mnuEmpresasCompensables: TMenuItem;
    mnuAvisosContrato: TMenuItem;
    N9: TMenuItem;
    mnuController: TMenuItem;
    mnuContrCargaTablas: TMenuItem;
    mnuEncuestas: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    mnuConfiguracionEncuestas: TMenuItem;
    mnuGestiondeEncuestas: TMenuItem;
    mnuManEncuestas: TMenuItem;
    mnuManCategoriasEncuesta: TMenuItem;
    mnuManPreguntas: TMenuItem;
    mnuEncuestasEstadisticas: TMenuItem;
    mnuVisitas: TMenuItem;
    N13: TMenuItem;
    mnuConfiguracionVisitas: TMenuItem;
    mnuManVisitas: TMenuItem;
    mnuManCategoriasVisitas: TMenuItem;
    mnuManTemasVisitas: TMenuItem;
    mnuGestionDeVisitas: TMenuItem;
    procedure mnuEmpresasVIPClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuAdmSiniestrosClick(Sender: TObject);
    procedure mnuCRMClick(Sender: TObject);
    procedure mnuLiqIncapacidadesClick(Sender: TObject);
    procedure mnuAdmLicitacionesClick(Sender: TObject);
    procedure mnuAlertasClick(Sender: TObject);
    procedure mnuSegIncapacidadesClick(Sender: TObject);
    procedure mnuAnalisisClienteClick(Sender: TObject);
    procedure mnuListadoDePrestadoresClick(Sender: TObject);
    procedure mnuComManDelegacionClick(Sender: TObject);
    procedure mnuMotivosEmpresasVIPClick(Sender: TObject);
    procedure mnuSiniestralidadClick(Sender: TObject);
    procedure mnuContratoVendedoresClick(Sender: TObject);
    procedure mnuEmpresasCompensablesClick(Sender: TObject);
    procedure mnuAvisosContratoClick(Sender: TObject);
    procedure mnuContrCargaTablasClick(Sender: TObject);
    procedure mnuManEncuestasClick(Sender: TObject);
    procedure mnuManCategoriasEncuestaClick(Sender: TObject);
    procedure mnuManPreguntasClick(Sender: TObject);
    procedure mnuGestiondeEncuestasClick(Sender: TObject);
    procedure mnuEncuestasEstadisticasClick(Sender: TObject);
    procedure mnuManVisitasClick(Sender: TObject);
    procedure mnuManCategoriasVisitasClick(Sender: TObject);
    procedure mnuManTemasVisitasClick(Sender: TObject);
    procedure mnuGestionDeVisitasClick(Sender: TObject);
  public
    procedure AfterConstruction; override;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
 	unCustomConsulta, unAdmSiniestros, unCITRIX, unDmPrincipal, General, unLibretaDeDirecciones, unMoldeEnvioMail,
  unElementosEnviados, SpoolFuncs, Printers, unAlarmas,
  unVisualizadorDigitalizacion, unFaxEnviados, unConsFax, unManRDO_DOCUMENTO, unIntegrador,
  unLiqIncapacidades, unConsultaLicitacion, unABMAgenda,
  unSegIncapacidades, unAnalisisCliente, UnListConsPrest, unManDEL_DELEGACION, unInformesSiniestralidad,
  unSesion, unManEmpresasVIP, unManCMV_MOTIVOEMPRESAVIP, CustomDlgs, unContratoVendedor2,
  unManSEC_EMPRESASCOMPENSABLES, unAvisosContrato, unCargaTablasSin,
  unManCEN_ENCUESTA, unManCEC_ENCUESTACATEGORIA, unManCEP_ENCUESTAPREGUNTA, unGestionDeEncuestas, unFiltroEncuestaEstadistica, unManCVS_VISITA,
  unManCVC_VISITACATEGORIA, unManCVT_VISITATEMA, unGestionDeVisitas, unVentanillaElectronica, unEnviosVentanillaElectronica;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

  if Alarma.Saludo then
    MostrarAlarma(Application.Title, 'Bienvenido al sistema de Integración de Provincia A.R.T.');

  mnuAnalisisCliente.Visible := (Sesion.Sector = 'COMPUTOS');
  mnuContratoVendedores.Visible := (AreIn(Sesion.UserId, ['SSAIRE', 'JBALESTRINI']));  
end;

procedure TfrmPrincipal.mnuGestiondeEncuestasClick(Sender: TObject);
begin
  Abrir(TfrmGestionDeEncuestas, frmGestionDeEncuestas, tmvMDIChild, mnuGestionDeEncuestas);
end;

procedure TfrmPrincipal.mnuGestionDeVisitasClick(Sender: TObject);
begin
    Abrir(TfrmGestionDeVisitas, frmGestionDeVisitas, tmvMDIChild, mnuGestionDeVisitas);
end;

procedure TfrmPrincipal.mnuAdmSiniestrosClick(Sender: TObject);
begin
  Abrir(TfrmAdmSiniestros, frmAdmSiniestros, tmvMDIChild, mnuAdmSiniestros);
end;

procedure TfrmPrincipal.mnuCRMClick(Sender: TObject);
begin
  Abrir(TfrmIntegrador, frmIntegrador, tmvMDIChild, mnuCRM);
end;

procedure TfrmPrincipal.AfterConstruction;
begin
  inherited;
end;

procedure TfrmPrincipal.mnuEmpresasVIPClick(Sender: TObject);
begin
  Abrir(TfrmManEmpresasVIP, frmManEmpresasVIP, tmvMDIChild, mnuEmpresasVIP);
end;

procedure TfrmPrincipal.mnuEncuestasEstadisticasClick(Sender: TObject);
begin
  Abrir(TfrmFiltroEncuestaEstadistica, frmFiltroEncuestaEstadistica, tmvModal, mnuEncuestasEstadisticas);
end;

procedure TfrmPrincipal.mnuLiqIncapacidadesClick(Sender: TObject);
begin
  Abrir(TfrmLiqIncapacidades, frmLiqIncapacidades, tmvMDIChild, mnuLiqIncapacidades);
end;

procedure TfrmPrincipal.mnuAdmLicitacionesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaLicitacion, frmConsultaLicitacion, tmvMDIChild, mnuAdmLicitaciones);
end;

procedure TfrmPrincipal.mnuAlertasClick(Sender: TObject);
begin
  Abrir(TfrmABMAgenda, frmABMAgenda, tmvMDIChild, mnuAlertas);
end;

procedure TfrmPrincipal.mnuSegIncapacidadesClick(Sender: TObject);
begin
  Abrir(TfrmSegIncapacidades, frmSegIncapacidades, tmvMDIChild, mnuSegIncapacidades);
end;

procedure TfrmPrincipal.mnuAnalisisClienteClick(Sender: TObject);
begin
  Abrir(TfrmAnalisisCliente, frmAnalisisCliente, tmvMDIChild, mnuAnalisisCliente);
end;

procedure TfrmPrincipal.mnuListadoDePrestadoresClick(Sender: TObject);
begin
  Abrir(TfrmConsPrest, frmConsPrest, tmvMDIChild, mnuListadoDePrestadores);
end;

procedure TfrmPrincipal.mnuComManDelegacionClick(Sender: TObject);
begin
  Abrir(TfrmManDEL_DELEGACION, frmManDEL_DELEGACION, tmvMDIChild, mnuComManDelegacion);
end;

procedure TfrmPrincipal.mnuManCategoriasEncuestaClick(Sender: TObject);
begin
  Abrir(TfrmManCEC_ENCUESTACATEGORIA, frmManCEC_ENCUESTACATEGORIA, tmvMDIChild, mnuManCategoriasEncuesta);
end;

procedure TfrmPrincipal.mnuManCategoriasVisitasClick(Sender: TObject);
begin
  Abrir(TfrmManCVC_VISITACATEGORIA, frmManCVC_VISITACATEGORIA, tmvMDIChild, mnuManCategoriasVisitas);
end;

procedure TfrmPrincipal.mnuManEncuestasClick(Sender: TObject);
begin
  Abrir(TfrmManCEN_ENCUESTA, frmManCEN_ENCUESTA, tmvMDIChild, mnuManEncuestas);
end;

procedure TfrmPrincipal.mnuManPreguntasClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmManCEP_ENCUESTAPREGUNTA, frmManCEP_ENCUESTAPREGUNTA, tmvMDIChild, mnuManPreguntas);
end;

procedure TfrmPrincipal.mnuManVisitasClick(Sender: TObject);
begin
  Abrir(TfrmManCVS_VISITA, frmManCVS_VISITA, tmvMDIChild, mnuManVisitas);
end;

procedure TfrmPrincipal.mnuMotivosEmpresasVIPClick(Sender: TObject);
begin
  Abrir(TfrmManCMV_MOTIVOEMPRESAVIP, frmManCMV_MOTIVOEMPRESAVIP, tmvMDIChild, mnuMotivosEmpresasVIP);
end;

procedure TfrmPrincipal.mnuSiniestralidadClick(Sender: TObject);
begin
  Abrir(TfrmInformesSiniestralidad, frmInformesSiniestralidad, tmvMDIChild, mnuSiniestralidad);
end;

procedure TfrmPrincipal.mnuManTemasVisitasClick(Sender: TObject);
begin
  Abrir(TfrmManCVT_VISITATEMA, frmManCVT_VISITATEMA, tmvMDIChild, mnuManTemasVisitas);
end;

procedure TfrmPrincipal.mnuContratoVendedoresClick(Sender: TObject);
var
  iContrato: Integer;
begin
  iContrato := InputBoxInteger('Contrato Vendedores', 'Contrato', 0);

  if iContrato > 0 then
    with TfrmContratoVendedor.Create(Self) do
    try
      DoCargarDatos(iContrato);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmPrincipal.mnuEmpresasCompensablesClick(Sender: TObject);
begin
  Abrir(TfrmManSEC_EMPRESASCOMPENSABLES, frmManSEC_EMPRESASCOMPENSABLES, tmvMDIChild, mnuEmpresasCompensables);
end;

procedure TfrmPrincipal.mnuAvisosContratoClick(Sender: TObject);
begin  
  Abrir(TfrmAvisosContrato, frmAvisosContrato, tmvMDIChild, mnuAvisosContrato);
end;

procedure TfrmPrincipal.mnuContrCargaTablasClick(Sender: TObject);
begin
  Abrir(TfrmCargaTablasSin, frmCargaTablasSin, tmvMDIChild, mnuContrCargaTablas);
end;

end.

