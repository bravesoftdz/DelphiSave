unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Menus, ToolWin, ComCtrls, StdCtrls, ImgList,
  artSeguridad, artDbLogin, Placemnt, Login, ExtCtrls, RxGIF, jpeg, XPMenu, FormPanel, Dialogs, unCustomPrincipal,
  AdvOfficeHint, JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton,
  JvComponentBase, RxPlacemnt;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuRecupero: TMenuItem;
    mnuAdministracionRecupero: TMenuItem;
    mnuImportacion: TMenuItem;
    mnuListados: TMenuItem;
    mnuPosibleRecupero: TMenuItem;
    mnuGestindeDeuda: TMenuItem;
    mnuConcursosyQuiebras: TMenuItem;
    mnuGesDeudAdmin: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuAbogados: TMenuItem;
    mnuOtrosCodigos: TMenuItem;
    mnuAdministracindeJuiciosCQ: TMenuItem;
    mnuListado: TMenuItem;
    XPMenu1: TXPMenu;
    mnuJuicioMediacion: TMenuItem;
    mnuSeguimientoJuicioYMediacion: TMenuItem;
    mnuAdminSeguimJuicios: TMenuItem;
    mnuPagos: TMenuItem;
    mnuAbogados2: TMenuItem;
    mnuTiposReclamo: TMenuItem;
    mnuTiposTarea: TMenuItem;
    ipoEvento1: TMenuItem;
    Peritos1: TMenuItem;
    Parmetros1: TMenuItem;
    Formulas1: TMenuItem;
    mnuAprobacionPagos: TMenuItem;
    mnuEmisionPagosAprobados: TMenuItem;
    mnuDictmenesAcustatorios: TMenuItem;
    mnuNormas: TMenuItem;
    mnuFirmantesSrt: TMenuItem;
    mnuSumarios: TMenuItem;
    mnuAdministraciondeFrmulasJuicios: TMenuItem;
    AdministraciondeFrmulasdeSumarios1: TMenuItem;
    FrmulasdeSumarios1: TMenuItem;
    mnuOficios: TMenuItem;
    mnuEntidadesOficiantes: TMenuItem;
    mnuMesadeEntrada: TMenuItem;
    mnutareasJuicios: TMenuItem;
    mnuJurisdiccion: TMenuItem;
    mnuJuzgado: TMenuItem;
    mnuLiquidacionesPagoEfectivizadas: TMenuItem;
    mnuPagosBeneficiarios: TMenuItem;
    mnuTiposBeneficiarios: TMenuItem;
    mnuManAcreedores: TMenuItem;
    Pagos1: TMenuItem;
    mnuAutorizacionPagoSumarios: TMenuItem;
    LiquidacionesdePagoAprobadas1: TMenuItem;
    LiquidacionesdePagoEfectivizadas2: TMenuItem;
    mnuAdministracionSumarios: TMenuItem;
    mnuEmbargos: TMenuItem;
    mnuEmbargosPendientesAsignar: TMenuItem;
    mnuTiposAplicacionEmbargos: TMenuItem;
    mnuDevolucionesSinAsignar: TMenuItem;
    mnuManUsuariosWeb: TMenuItem;
    mnuGesDeudHonorarios: TMenuItem;
    mnuGesDeudLiquidHonorarios: TMenuItem;
    mnuGesDeudFactHonorarios: TMenuItem;
    mnuGesDeudLiquidacionHonorarios: TMenuItem;
    mnuGesDeudExcepcionesHonorarios: TMenuItem;
    mnuGesDeudPorcentajesHonorarios: TMenuItem;
    mnuManGestorDeCuenta: TMenuItem;
    mnuDocumentacion: TMenuItem;
    mnuDocAdministracion: TMenuItem;
    mnuManTiposAplicacionRecursosExtraord: TMenuItem;
    mnuRecursosExtraordinarios: TMenuItem;
    mnuRecExtrDevolucionesSinAsignar: TMenuItem;
    mnuParteDemandada: TMenuItem;
    mnuParteActora: TMenuItem;
    mnuTiposdeGastos: TMenuItem;
    mnuMantCartasDoc: TMenuItem;
    mnuManTextosCartas: TMenuItem;
    mnuManAreasCartasDoc: TMenuItem;
    MnuManCodRecepcion: TMenuItem;
    mnuManFirmantesCartas: TMenuItem;
    mnuAdministracionCartas: TMenuItem;
    N30: TMenuItem;
    mnuMediaciones: TMenuItem;
    mnuMediadores: TMenuItem;
    mnuEstudiosJuridicos: TMenuItem;
    mnuAdministracionMediaciones: TMenuItem;
    mnuMedicos: TMenuItem;
    mnuLiquidacionesMultiplesDemandada: TMenuItem;
    mnuLiquidacionesMultiplesMediacion: TMenuItem;
    mnuLiquidacionesMultiplesActora: TMenuItem;
    mnuLiquidacionMultiplesSumarios: TMenuItem;
    mnuAudiencia: TMenuItem;
    N31: TMenuItem;
    mnuEventosParteDemandada: TMenuItem;
    mnuNormasReservas: TMenuItem;
    mnuRecIngresoValores: TMenuItem;
    mnuRecPlanesPago: TMenuItem;
    mnuIncumplimientoEspecfico: TMenuItem;
    mnuFuero: TMenuItem;
    mnuPrestacionesDinerarias: TMenuItem;
    mnuPagosJudiciales: TMenuItem;
    mnuExportacionSRT: TMenuItem;
    mnuMotivoResolucionSRT: TMenuItem;
    mnuNotificacionCambioPoliticas: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mnuPosibleRecuperoClick(Sender: TObject);
    procedure mnuGesDeudAdminClick(Sender: TObject);
    procedure mnuOtrosCodigosClick(Sender: TObject);
    procedure mnuAbogadosClick(Sender: TObject);
    procedure mnuAdministracionRecuperoClick(Sender: TObject);
    procedure mnuImportacionClick(Sender: TObject);
    procedure mnuAdministracindeJuiciosCQClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuListadoClick(Sender: TObject);
    procedure mnuAdministraciondeFrmulasJuiciosClick(Sender: TObject);
    procedure mnuAbogados2Click(Sender: TObject);
    procedure mnuTiposReclamoClick(Sender: TObject);
    procedure mnuTiposTareaClick(Sender: TObject);
    procedure ipoEvento1Click(Sender: TObject);
    procedure Peritos1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure Formulas1Click(Sender: TObject);
    procedure mnuEmisionPagosAprobadosClick(Sender: TObject);
    procedure mnuAprobacionPagosClick(Sender: TObject);
    procedure mnuNormasClick(Sender: TObject);
    procedure mnuFirmantesSrtClick(Sender: TObject);
    procedure AdministraciondeFrmulasdeSumarios1Click(Sender: TObject);
    procedure mnuOficiosClick(Sender: TObject);
    procedure mnuEntidadesOficiantesClick(Sender: TObject);
    procedure mnutareasJuiciosClick(Sender: TObject);
    procedure mnuJurisdiccionClick(Sender: TObject);
    procedure mnuJuzgadoClick(Sender: TObject);
    procedure mnuLiquidacionesPagoEfectivizadasClick(Sender: TObject);
    procedure mnuPagosBeneficiariosClick(Sender: TObject);
    procedure mnuTiposBeneficiariosClick(Sender: TObject);
    procedure mnuManAcreedoresClick(Sender: TObject);
    procedure mnuAutorizacionPagoSumariosClick(Sender: TObject);
    procedure LiquidacionesdePagoAprobadas1Click(Sender: TObject);
    procedure LiquidacionesdePagoEfectivizadas2Click(Sender: TObject);
    procedure mnuAdministracionSumariosClick(Sender: TObject);
    procedure mnuEmbargosPendientesAsignarClick(Sender: TObject);
    procedure mnuTiposAplicacionEmbargosClick(Sender: TObject);
    procedure mnuDevolucionesSinAsignarClick(Sender: TObject);
    procedure mnuManUsuariosWebClick(Sender: TObject);
    procedure mnuGesDeudLiquidHonorariosClick(Sender: TObject);
    procedure mnuGesDeudFactHonorariosClick(Sender: TObject);
    procedure mnuGesDeudLiquidacionHonorariosClick(Sender: TObject);
    procedure mnuGesDeudExcepcionesHonorariosClick(Sender: TObject);
    procedure mnuGesDeudPorcentajesHonorariosClick(Sender: TObject);
    procedure mnuManGestorDeCuentaClick(Sender: TObject);
    procedure mnuDocAdministracionClick(Sender: TObject);
    procedure mnuManTiposAplicacionRecursosExtraordClick(Sender: TObject);
    procedure mnuRecExtrDevolucionesSinAsignarClick(Sender: TObject);
    procedure mnuParteDemandadaClick(Sender: TObject);
    procedure mnuParteActoraClick(Sender: TObject);
    procedure mnuTiposdeGastosClick(Sender: TObject);
    procedure mnuManAreasCartasDocClick(Sender: TObject);
    procedure MnuManCodRecepcionClick(Sender: TObject);
    procedure mnuManFirmantesCartasClick(Sender: TObject);
    procedure mnuManTextosCartasClick(Sender: TObject);
    procedure mnuAdministracionCartasClick(Sender: TObject);
    procedure mnuMediadoresClick(Sender: TObject);
    procedure mnuEstudiosJuridicosClick(Sender: TObject);
    procedure mnuAdministracionMediacionesClick(Sender: TObject);
    procedure mnuMedicosClick(Sender: TObject);
    procedure mnuLiquidacionesMultiplesDemandadaClick(Sender: TObject);
    procedure mnuLiquidacionesMultiplesMediacionClick(Sender: TObject);
    procedure mnuLiquidacionesMultiplesActoraClick(Sender: TObject);
    procedure mnuLiquidacionMultiplesSumariosClick(Sender: TObject);
    procedure mnuAudienciaClick(Sender: TObject);
    procedure mnuEventosParteDemandadaClick(Sender: TObject);
    procedure mnuNormasReservasClick(Sender: TObject);
    procedure mnuRecIngresoValoresClick(Sender: TObject);
    procedure mnuRecPlanesPagoClick(Sender: TObject);
    procedure ClienteWindowProc(var Message: Messages.TMessage);
    procedure mnuIncumplimientoEspecficoClick(Sender: TObject);
    procedure mnuFueroClick(Sender: TObject);
    procedure mnuPagosJudicialesClick(Sender: TObject);
    procedure mnuExportacionSRTClick(Sender: TObject);
    procedure mnuMotivoResolucionSRTClick(Sender: TObject);
    procedure mnuNotificacionCambioPoliticasClick(Sender: TObject);
  private
    fBMP: Graphics.TBitmap;
    fClienteWndAntes: Windows.TFarProc;
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
	unDmPrincipal, General, unLstPosibleRecupero, unMaeCTB, unConsultaAdminstracionJuicio,
  unConsultaAdministracionRecupero, unImportacion, unConsultaConcursosQuiebras, unListadoCyQ, unManLBO_ABOGADOS,
  unConsultaJuiciosEnTramite, unFrmFormulasCalculoReservaJuicios, unManAbogados, unManReclamos, unManTareas,
  unManTipoEvento, unManPeritos, unManParametros, unConsultaDictamenesAcusatorios,
  unManLno_Norma, unManFirmanteSrt, unFrmFormulasCalculoReservaSumarios, unConsultaOficios, unManEntidadesOficiantes,
  unConsultaTareasSeguimientoJuicio, unfrmABMJurisdiccion, unfrmABMJuzgado, unAutorizacionPagosLegales,
  UnRptLiquidacionesPagadas, unAutorizacionPagosSumarios, unManPagosBeneficiarios, unManTiposBeneficiarios,
  unManAcreedoresLegales, unEmbargosPendientesAsignar, unTiposAplicacionEmbargos, unDevolucionesSinAsignar,
  unManUsuariosWeb, unNovedades, unLiquidaciones, unFacturasHonorarios, unLiquidacionHonorarios,
  unExcepcionesHonorarios, unPorcentajesHonorarios, unManAGC_GESTORCUENTA, unDocumentacion,
  unTiposAplicacionRecursosExtraord, unRecExtrDevolucionesSinAsignar,unConsultaJuicioParteDemandada,
  unConsultaJuicioParteActora, unManTipoGastos, unManCAT_AREATEXTO, unManCTB_CODRE, unManCFI_FIRMA,
  unComunes, unManCTC_TEXTOCARTA, unRedPresAdministracionCartasLegales,unConsultaMediaciones,
  unManMediador, unManEstudioJuridicos, unManMedicos, unConsultaPagosLiquidacion, unAudiencia,
  unVerEventosJuicios, unManNormasReserva, unValIngreso, unArt, unAfiliaciones, unConsultaPlanesPago,
  unCustomConsulta, unManIncumplimientoEspecifico, unManFueros,unProcesoArchivoLegales,
  unListPagosJudiciales, unManMotivoResolucionSRT, unNotificacionCambioPolitica;

{$R *.DFM}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;

  //DecimalSeparator := '.';
  //ThousandSeparator := #0;
  //ShortTimeFormat   := 'H:mm:ss';
  //LongTimeFormat    := 'H:mm:ss';

  fBMP := Graphics.TBitmap.Create;
  fBMP.LoadFromResourceName(HInstance, 'JUSTICIA');
end;

procedure TfrmPrincipal.mnuPosibleRecuperoClick(Sender: TObject);
begin
  TfrmLstPosibleRecupero.Create(Self);
  mnuPosibleRecupero.Enabled := False;
end;

procedure TfrmPrincipal.mnuGesDeudAdminClick(Sender: TObject);
begin
  frmConsultaAdminstracionJuicio    := TfrmConsultaAdminstracionJuicio.Create(Self);
  mnuGesDeudAdmin.Enabled := False;
end;

procedure TfrmPrincipal.mnuOtrosCodigosClick(Sender: TObject);
begin
  TfrmMaeCTB.Create(Self);
  mnuOtrosCodigos.Enabled := False;
end;

procedure TfrmPrincipal.mnuAbogadosClick(Sender: TObject);
begin
  TfrmManLBO_ABOGADOS.Create(Self);
end;

procedure TfrmPrincipal.mnuAdministracionRecuperoClick(Sender: TObject);
begin
  mnuAdministracionRecupero.Enabled := False;
  frmConsultaAdministracionRecupero := TfrmConsultaAdministracionRecupero.Create(Self);
end;

procedure TfrmPrincipal.mnuImportacionClick(Sender: TObject);
begin
  mnuImportacion.Enabled := False;
  TfrmImportacion.Create(Self);
end;

procedure TfrmPrincipal.mnuAdministracindeJuiciosCQClick(Sender: TObject);
begin
  mnuAdministracindeJuiciosCQ.Enabled := False;
  TfrmConsultaConcursosQuiebras.Create(Self);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
//     BackGround.Free;
	if (nil <> fBMP) then
  begin
  	fBMP.Free;
    fBMP := nil;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
{
var
	Proc_Cliente: Windows.TFarProc;
  lValor: LongInt;
}
begin
{
	// Obtener la dirección de nuestro procedimiento de ventana
  Proc_Cliente := Forms.MakeObjectInstance(ClienteWindowProc);
  if (nil <> Proc_Cliente) then
  begin
  	// Obtener el procedimiento de ventana original del área cliente
    lValor := Windows.GetWindowLong(Self.ClientHandle, GWL_WNDPROC);
    if (0 < lValor) then
    begin
    	// Sobrescribir el procedimiento de ventana original con el nuestro
      if (0 < Windows.SetWindowLong(Self.ClientHandle, GWL_WNDPROC, LongInt(Proc_Cliente))) then
      begin
      	// Guardar el procedimiento de ventana
        fClienteWndAntes := Windows.TFarProc(lValor);
      end;
    end;
	end;
}
  inherited;  
end;

procedure TfrmPrincipal.ClienteWindowProc(var Message: Messages.TMessage);
var
	Rect: Windows.TRect;
begin
	// Llamar al procedimiento original de la ventana cliente o no se
  // se enterará de nada de lo que hagamos con las ventanas hijas.
  Message.Result := Windows.CallWindowProc(fClienteWndAntes, ClientHandle, Message.Msg, Message.wParam, Message.lParam);
  case (Message.Msg) of
  	WM_ERASEBKGND:
    begin
    	if (nil <> fBMP) then  // Sólo si hay algo que dibujar
      begin
      	// Obtener las dimensiones del área cliente
        Windows.GetClientRect(ClientHandle, Rect);

				Rect.Left := System.Round((Rect.Right - Rect.Left - fBMP.Width));
        Rect.Top := System.Round((Rect.Bottom - Rect.Top - fBMP.Height));

        // Dibujar gráfico
        Windows.BitBlt(HDC(Message.WParam),  // HDC de destino
               				 Rect.Left,            // Coordenada X de destino
                       Rect.Top,             // Coordenada Y de destino
                       fBMP.Width,           // Anchura de la zona a dibujar
                       fBMP.Height,          // Altura de la zona a dibujar
                       fBMP.Canvas.Handle,   // HDC de origen
                       0,                    // Coordenada X de origen
                       0,                    // Coordenada Y de origen
                       SRCCOPY               // Modo: copia simple
            					);
			end;
		end;
    WM_NCCALCSIZE,  // Cambio de tamaño
    WM_HSCROLL,     // Desplazamiento Horizontal
    WM_VSCROLL:     // Desplazamiento Vertical
    begin
    	// Obligar a repintar el área cliente
      Windows.InvalidateRect(ClientHandle,nil, TRUE);
    end;
	end;
end;

{----------------------------------------------------------------------------------------------------------------------
    Listados.
}
procedure TfrmPrincipal.mnuListadoClick(Sender: TObject);
begin
  TfrmListadoCyQ.Create(Self);
end;

procedure TfrmPrincipal.mnuAdministraciondeFrmulasJuiciosClick(Sender: TObject);
begin
	TfrmFormulasCalculoReservaJuicios.Create(self);
end;

procedure TfrmPrincipal.mnuAbogados2Click(Sender: TObject);
begin
   //Free en onFormClose
  TfrmManAbogados.Create(self);
end;

procedure TfrmPrincipal.mnuTiposReclamoClick(Sender: TObject);
begin
  //Free en onFormClose
  TfrmManReclamos.Create(self);
end;

procedure TfrmPrincipal.mnuTiposTareaClick(Sender: TObject);
begin
  //Free en onFormClose
  TfrmManTareas.Create(self);
end;

procedure TfrmPrincipal.ipoEvento1Click(Sender: TObject);
begin
  //Free en onFormClose
  TFrmManTipoEvento.Create(self);
end;

procedure TfrmPrincipal.Peritos1Click(Sender: TObject);
begin
  //Free en onFormClose
	TFrmManPeritos.Create(self);
end;

procedure TfrmPrincipal.Parmetros1Click(Sender: TObject);
begin
  //Free en onFormClose
	TFrmManParametros.Create(self);
end;

procedure TfrmPrincipal.Formulas1Click(Sender: TObject);
begin
	TfrmFormulasCalculoReservaJuicios.Create(Self);
end;

procedure TfrmPrincipal.mnuEmisionPagosAprobadosClick(Sender: TObject);
begin
  with TfrmAutorizacionPagosLegales.Create(Self) do
    begin
      if Sender = mnuEmisionPagosAprobados then
        TipoPago := tpJuicio
      else
        TipoPago := tpMediacion;

      MostrarLiquidacionesAprobadas;
    end;
end;

procedure TfrmPrincipal.mnuAprobacionPagosClick(Sender: TObject);
begin
  with TfrmAutorizacionPagosLegales.Create(Self) do
    begin
      if Sender = mnuAprobacionPagos then
        TipoPago := tpJuicio
      else
        TipoPago := tpMediacion;

      MostrarLiquidacionesPendientesDeAprobar;
    end;
end;

procedure TfrmPrincipal.mnuNormasClick(Sender: TObject);
begin
  TfrmManLnoNorma.Create(Self);
end;

procedure TfrmPrincipal.mnuFirmantesSrtClick(Sender: TObject);
begin
  TfrmManFirmanteSrt.Create(Self);
end;

procedure TfrmPrincipal.AdministraciondeFrmulasdeSumarios1Click(Sender: TObject);
begin
  TfrmFormulasCalculoReservaSumarios.Create(Self);
end;

procedure TfrmPrincipal.mnuOficiosClick(Sender: TObject);
begin
  TfrmConsultaOficios.Create(Self);
end;

procedure TfrmPrincipal.mnuEntidadesOficiantesClick(Sender: TObject);
begin
  TfrmManEntidadesOficiantes.MostrarAbm;
end;

procedure TfrmPrincipal.mnutareasJuiciosClick(Sender: TObject);
begin
  TfrmConsultaTareasSeguimientoJuicios.Create(Self);
end;

procedure TfrmPrincipal.mnuJurisdiccionClick(Sender: TObject);
begin
  TfrmABMJurisdiccion.Create(Self);
end;

procedure TfrmPrincipal.mnuJuzgadoClick(Sender: TObject);
begin
  TfrmABMJuzgado.Create(Self);
end;

procedure TfrmPrincipal.mnuLiquidacionesPagoEfectivizadasClick(Sender: TObject);
begin
  with TfrmAutorizacionPagosLegales.Create(Self) do
  begin
    TipoPago := tpJuicio;
    MostrarLiquidacionesPagadas;
  end;  
end;

procedure TfrmPrincipal.mnuPagosBeneficiariosClick(Sender: TObject);
begin
  TfrmManConPagosBeneficiarios.Create(self);
end;

procedure TfrmPrincipal.mnuTiposBeneficiariosClick(Sender: TObject);
begin
  TfrmManTiposBeneficiarios.Create(self);
end;

procedure TfrmPrincipal.mnuManAcreedoresClick(Sender: TObject);
begin
  Abrir(TfrmManAcreedoresLegales, frmManAcreedoresLegales, tmvMDIChild, mnuManAcreedores);
end;

procedure TfrmPrincipal.mnuAutorizacionPagoSumariosClick(Sender: TObject);
begin
  with TfrmAutorizacionPagosSumarios.Create(Self) do
    MostrarLiquidacionesPendientesDeAprobar;
end;

procedure TfrmPrincipal.LiquidacionesdePagoAprobadas1Click(Sender: TObject);
begin
  with TfrmAutorizacionPagosSumarios.Create(Self) do
    MostrarLiquidacionesAprobadas;
end;

procedure TfrmPrincipal.LiquidacionesdePagoEfectivizadas2Click(Sender: TObject);
begin
  with TfrmAutorizacionPagosSumarios.Create(Self) do
    MostrarLiquidacionesPagadas;
end;

procedure TfrmPrincipal.mnuAdministracionSumariosClick(Sender: TObject);
begin
  TfrmConsultaDictamenesAcustorios.Create(Self);
end;

procedure TfrmPrincipal.mnuEmbargosPendientesAsignarClick(Sender: TObject);
begin
  Abrir(TfrmEmbargosPendientesAsignar, frmEmbargosPendientesAsignar, tmvMDIChild, mnuEmbargosPendientesAsignar);
end;

procedure TfrmPrincipal.mnuTiposAplicacionEmbargosClick(Sender: TObject);
begin
	Abrir(TfrmTiposAplicacionEmbargos, frmTiposAplicacionEmbargos, tmvMDIChild, mnuTiposAplicacionEmbargos);
end;

procedure TfrmPrincipal.mnuDevolucionesSinAsignarClick(Sender: TObject);
begin
	Abrir(TfrmDevolucionesSinAsignar, frmDevolucionesSinAsignar, tmvMDIChild, mnuDevolucionesSinAsignar);
end;

procedure TfrmPrincipal.mnuManUsuariosWebClick(Sender: TObject);
begin
	Abrir(TfrmManUsuariosWeb, frmManUsuariosWeb, tmvMDIChild, mnuManUsuariosWeb);
end;

procedure TfrmPrincipal.mnuGesDeudLiquidHonorariosClick(Sender: TObject);
begin
	Abrir(TfrmLiquidaciones, frmLiquidaciones, tmvMDIChild, mnuGesDeudLiquidHonorarios);
end;

procedure TfrmPrincipal.mnuGesDeudFactHonorariosClick(Sender: TObject);
begin
	Abrir(TfrmFacturasHonorarios, frmFacturasHonorarios, tmvMDIChild, mnuGesDeudFactHonorarios);
end;

procedure TfrmPrincipal.mnuGesDeudLiquidacionHonorariosClick(Sender: TObject);
begin
  with TfrmLiquidacionHonorarios.Create(Self) do
    try
      DoLiquidarHonorarios;
    finally
      Free;
    end;
end;

procedure TfrmPrincipal.mnuGesDeudExcepcionesHonorariosClick(Sender: TObject);
begin
	Abrir(TfrmExcepcionesHonorarios, frmExcepcionesHonorarios, tmvMDIChild, mnuGesDeudExcepcionesHonorarios);
end;

procedure TfrmPrincipal.mnuGesDeudPorcentajesHonorariosClick(Sender: TObject);
begin
	Abrir(TfrmPorcentajesHonorarios, frmPorcentajesHonorarios, tmvMDIChild, mnuGesDeudPorcentajesHonorarios);
end;

procedure TfrmPrincipal.mnuManGestorDeCuentaClick(Sender: TObject);
begin
  with TfrmManAGC_GESTORCUENTA.Create(Self) do
    EsEstudio := True;

  mnuManGestorDeCuenta.Enabled := False;
end;

procedure TfrmPrincipal.mnuDocAdministracionClick(Sender: TObject);
begin
	Abrir(TfrmDocumentacion, frmDocumentacion, tmvMDIChild, mnuDocumentacion);
end;

procedure TfrmPrincipal.mnuManTiposAplicacionRecursosExtraordClick(Sender: TObject);
begin
	Abrir(TfrmTiposAplicacionRecursosExtraord, frmTiposAplicacionRecursosExtraord, tmvMDIChild, mnuManTiposAplicacionRecursosExtraord);
end;

procedure TfrmPrincipal.mnuRecExtrDevolucionesSinAsignarClick(Sender: TObject);
begin
	Abrir(TfrmRecExtrDevolucionesSinAsignar, frmRecExtrDevolucionesSinAsignar, tmvMDIChild, mnuRecExtrDevolucionesSinAsignar);
  frmRecExtrDevolucionesSinAsignar.PermitirAsignar := True;
end;

procedure TfrmPrincipal.mnuParteDemandadaClick(Sender: TObject);
begin
  Abrir(TfrmConsultaJuicioParteDemandada, frmConsultaJuicioParteDemandada, tmvMDIChild, mnuParteDemandada);
  frmConsultaJuicioParteDemandada.VerEnvioWebEstudios := True;
end;

procedure TfrmPrincipal.mnuParteActoraClick(Sender: TObject);
begin
  Abrir(TfrmConsultaJuicioParteActora, frmConsultaJuicioParteActora, tmvMDIChild, mnuParteActora);
end;

procedure TfrmPrincipal.mnuTiposdeGastosClick(Sender: TObject);
begin
  Abrir(TfrmManTipoGasto, frmManTipoGasto, tmvMDIChild, mnuTiposdeGastos);
end;

procedure TfrmPrincipal.mnuManAreasCartasDocClick(Sender: TObject);
begin
  with TfrmManCAT_AREATEXTO.Create(Self) do
  begin
    Area      := aLegales;
    MenuItem  := mnuManAreasCartasDoc;
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

procedure TfrmPrincipal.mnuManFirmantesCartasClick(Sender: TObject);
begin
  with TfrmManCFI_FIRMA.Create(Self) do
  begin
    Area      := aLegales;
    MenuItem  := mnuManFirmantesCartas;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuManTextosCartasClick(Sender: TObject);
begin
  with TfrmManCTC_TEXTOCARTA.Create(Self) do
  begin
    Area      := aLegales;
    MenuItem  := mnuManTextosCartas;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuAdministracionCartasClick(Sender: TObject);
begin
  mnuAdministracionCartas.Enabled := False;
  with TfrmRedPresAdministracionCartasLegales.Create(Self) do
  begin
    Area      := AREA_LEG;
    PermitirSinRechazadoGenCartasAdmin := True;
    MenuItem  := mnuAdministracionCartas;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuMediadoresClick(Sender: TObject);
begin
  Abrir(TfrmManMediador, frmManMediador, tmvMDIChild, mnuMediadores);
end;

procedure TfrmPrincipal.mnuEstudiosJuridicosClick(Sender: TObject);
begin
  Abrir(TfrmManEstudioJuridico, frmManEstudioJuridico, tmvMDIChild, mnuEstudiosJuridicos);
end;

procedure TfrmPrincipal.mnuAdministracionMediacionesClick(Sender: TObject);
begin
  Abrir(TfrmConsultaMediaciones, frmConsultaMediaciones, tmvMDIChild, mnuAdministracionMediaciones);
end;

procedure TfrmPrincipal.mnuMedicosClick(Sender: TObject);
begin
  Abrir(TfrmManMedico, frmManMedico, tmvMDIChild, mnuMedicos);
end;

procedure TfrmPrincipal.mnuLiquidacionesMultiplesDemandadaClick(Sender: TObject);
begin
  mnuLiquidacionesMultiplesDemandada.Enabled := False;
  with TfrmConsultaLiquidacionPagos.Create(Self) do
  begin
    MenuItem := mnuLiquidacionesMultiplesDemandada;
    ModoForm := mJuicioDemandada;
  end;
end;

procedure TfrmPrincipal.mnuLiquidacionesMultiplesMediacionClick(
  Sender: TObject);
begin
  mnuLiquidacionesMultiplesMediacion.Enabled := False;
  with TfrmConsultaLiquidacionPagos.Create(Self) do
  begin
    MenuItem := mnuLiquidacionesMultiplesMediacion;
    ModoForm := mMediacion;
  end;
end;

procedure TfrmPrincipal.mnuLiquidacionesMultiplesActoraClick(
  Sender: TObject);
begin
  mnuLiquidacionesMultiplesActora.Enabled := False;
  with TfrmConsultaLiquidacionPagos.Create(Self) do
  begin
    MenuItem := mnuLiquidacionesMultiplesActora;
    ModoForm := mJuicioActora;
  end;
end;

procedure TfrmPrincipal.mnuLiquidacionMultiplesSumariosClick(
  Sender: TObject);
begin
  mnuLiquidacionMultiplesSumarios.Enabled := False;
  with TfrmConsultaLiquidacionPagos.Create(Self) do
  begin
    MenuItem := mnuLiquidacionMultiplesSumarios;
    ModoForm := mSumario;
  end;
end;

procedure TfrmPrincipal.mnuAudienciaClick(Sender: TObject);
begin
  Abrir(TfrmAudiencia, frmAudiencia, tmvMDIChild, mnuAudiencia);
end;

procedure TfrmPrincipal.mnuEventosParteDemandadaClick(Sender: TObject);
begin
  Abrir(TfrmVerEventosJuicios, frmVerEventosJuicios, tmvMDIChild, mnuEventosParteDemandada);
end;

procedure TfrmPrincipal.mnuNormasReservasClick(Sender: TObject);
begin
  Abrir(TfrmManNormasReservas, frmManNormasReservas, tmvMDIChild, mnuNormasReservas);
end;

procedure TfrmPrincipal.mnuNotificacionCambioPoliticasClick(Sender: TObject);
begin
  inherited;
  Abrir(TfrmNotificacionCambioPolitica, frmNotificacionCambioPolitica, tmvMDIChild, mnuNotificacionCambioPoliticas);
end;

procedure TfrmPrincipal.mnuRecIngresoValoresClick(Sender: TObject);
begin
  Abrir(TfrmValIngreso, frmValIngreso, tmvMDIChild, mnuRecIngresoValores);
  with frmValIngreso do
    begin
      TipoEmpresa   := teDeudora;
      EditType      := fsAgregar;
      IdValor       := ART_EMPTY_ID;
      SectorIngreso := siLegales;
    end;
end;

procedure TfrmPrincipal.mnuRecPlanesPagoClick(Sender: TObject);
begin
  Abrir(TfrmConsultaPlanesPago, frmConsultaPlanesPago, tmvMDIChild, mnuRecPlanesPago);
end;

procedure TfrmPrincipal.mnuIncumplimientoEspecficoClick(Sender: TObject);
begin
  Abrir(TfrmManIncumplimientoEspecifico, frmManIncumplimientoEspecifico, tmvMDIChild, mnuIncumplimientoEspecfico);
end;

procedure TfrmPrincipal.mnuFueroClick(Sender: TObject);
begin
  Abrir(TfrmManFuero, frmManFuero, tmvMDIChild, mnuFuero);
end;

procedure TfrmPrincipal.mnuPagosJudicialesClick(Sender: TObject);
begin
  Abrir(TfrmListPagosJudiciales, frmListPagosJudiciales, tmvMDIChild, mnuPagosJudiciales);    // por Plan Pagos Judiciales (Prestaciones Dinerarias)
end;

procedure TfrmPrincipal.mnuExportacionSRTClick(Sender: TObject);
begin
  Abrir(TfrmProcesoArchivoLegales, frmProcesoArchivoLegales, tmvMDIChild, mnuExportacionSRT);
end;

procedure TfrmPrincipal.mnuMotivoResolucionSRTClick(Sender: TObject);
begin
  Abrir(TfrmManMotivoResolucionSRT, frmManMotivoResolucionSRT, tmvMDIChild, mnuMotivoResolucionSRT);
end;

end.

