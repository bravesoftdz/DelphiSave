unit unPrincipal;

{********************************************************}
{                                                        }
{    Módulo de Tesorería - Menú Principal                }
{                                                        }
{********************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, ImgList, Placemnt,
  artSeguridad, Login, artDbLogin, ComCtrls, StdCtrls, ExtCtrls, Db, SDEngine,
  XPMenu, JvTrayIcon, JvComponent, JvCaptionButton, JvBackgrounds, FormPanel, Mask, ToolEdit,
  DateComboBox, unCustomPrincipal, AdvOfficeHint, RxToolEdit, JvComponentBase,
  RxPlacemnt;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuTesoVal: TMenuItem;
    mnuTesoValAdministracion: TMenuItem;
    mnuTesoValIngreso: TMenuItem;
    mnuTesoMantenimiento: TMenuItem;
    mnuTesoMantEmpresasDeudoras: TMenuItem;
    mnuTesoMantBancos: TMenuItem;
    mnuTesoMantTablas: TMenuItem;
    mnuTesoRecibos: TMenuItem;
    mnuTesoMantTablasMotivosRechazoValores: TMenuItem;
    mnuTesoMantTablasMotivosAnulacionRecibos: TMenuItem;
    mnuTeso: TMenuItem;
    mnuCierredecaja: TMenuItem;
    mnuAdminBoletaDeposito: TMenuItem;
    mnuContaduria: TMenuItem;
    mnuContConcBancaria: TMenuItem;
    mnuContMantenimiento: TMenuItem;
    mnuContManTolerancias: TMenuItem;
    mnuContCargaManualExtracto: TMenuItem;
    mnuContManCodigosConciliacion: TMenuItem;
    mnuContManTipoValor: TMenuItem;
    mnuContManConceptosValores: TMenuItem;
    mnuContManCuentasBancarias: TMenuItem;
    mnuConsIngresosDepositos: TMenuItem;
    N3: TMenuItem;
    mnuTesoRecibosAdministracion: TMenuItem;
    mnuTesoRecibosBolDeposito: TMenuItem;
    mnuTesoChequesEmitidos: TMenuItem;
    mnuValUbicacion: TMenuItem;
    CargadelExtracto: TMenuItem;
    mnuCodigoExtracto: TMenuItem;
    mnuConsultaDeSaldoContable: TMenuItem;
    N5: TMenuItem;
    mnuEstadosdeCheques: TMenuItem;
    mnuDetalle: TMenuItem;
    mnuResumen: TMenuItem;
    mnuPeriodosContables: TMenuItem;
    mnuTesoListados: TMenuItem;
    mnuChequesEmitidos: TMenuItem;
    mnuAdministracionInterfaces: TMenuItem;
    mnuGenerarTABLAS: TMenuItem;
    mnuImpresionLibros: TMenuItem;
    mnuRegistrodeSiniestrosRecuperosyReaseguros: TMenuItem;
    mnuRegistrodeDenunciasdeSiniestros: TMenuItem;
    mnuSubdiariodeRecuperodeDeudporPremios: TMenuItem;
    mnuSubdiariodeAmortizacindeDeudporPremios: TMenuItem;
    mnuSubdiarioCobranza: TMenuItem;
    mnuSubdiarioEmisin: TMenuItem;
    mnuDiario: TMenuItem;
    mnuAfiliaciones: TMenuItem;
    FormPanel: TFormPanel;
    Panel1: TPanel;
    lbPROCESO: TLabel;
    Animate: TAnimate;
    mnuCuentasBancarias: TMenuItem;
    mnuControldeCarga: TMenuItem;
    mnuProveedores: TMenuItem;
    mnuChequesReemplazados: TMenuItem;
    mnuSituacionesDeCheques: TMenuItem;
    mnuCuentasPagar: TMenuItem;
    mnuContabilidadGeneral: TMenuItem;
    mnuPrevisionIncobrables: TMenuItem;
    mnuSubdiarioVolantes: TMenuItem;
    mnuLibros: TMenuItem;
    mnuLiquidacionesCompensables: TMenuItem;
    fpIngresarFecha: TFormPanel;
    Label1: TLabel;
    dcbFecha: TDateComboBox;
    btnAceptar: TButton;
    btnCancelar: TButton;
    mnuReservas: TMenuItem;
    mnuContManReservas: TMenuItem;
    mnuRegistroDenunciasSiniestrosFFEP: TMenuItem;
    mnuRegistroCobranzasFFEP: TMenuItem;
    mnuRegistroSiniestrosPagadosFFEP: TMenuItem;
    mnuTesoSobres: TMenuItem;
    mnuTesoAdminEfectivo: TMenuItem;
    mnuEmbargos: TMenuItem;
    mnuControlInterfaces: TMenuItem;
    mnuGirosTransferencias: TMenuItem;
    mnuRecursosExtraordinarios: TMenuItem;
    mnuRecExtraordStock: TMenuItem;
    mnuRecExtraordDevolSinAsignar: TMenuItem;
    mnuEmbAdministracion: TMenuItem;
    mnuEmbAplicacion: TMenuItem;
    mnuInteresesEmbargos: TMenuItem;
    mnuEstadoResultadosContrato: TMenuItem;
    mnuTesoTransferenciasBAPRO: TMenuItem;
    mnuEmbDevolucion: TMenuItem;
    mnuTesoTransfBancarias: TMenuItem;
    mnuPrevisionIncobrablesCons: TMenuItem;
    mnuPrevisionIncobrablesExcep: TMenuItem;
    SubdiarioIVACompras1: TMenuItem;
    mnuCuentasValidadas: TMenuItem;
    mnuTesoTransfCuentas: TMenuItem;
    mnuFFEP: TMenuItem;
    mnuSiniestrosMarcados: TMenuItem;
    mnuFFEPPagos: TMenuItem;
    mnuFFEPEnvios: TMenuItem;
    mnuPrevisionIncobrablesGenTablas: TMenuItem;
    mnuAdminGPBA: TMenuItem;
    mnuAdminGPBAConsPagos: TMenuItem;
    mnuAdminGPBAPorcentajes: TMenuItem;
    mnuAdminGPBAPagosGenericos: TMenuItem;
    mnuAdminGPBAConceptos: TMenuItem;
    mnuAdminGPBACuentaCorriente: TMenuItem;
    mnuResReservas: TMenuItem;
    mnuResActuariales: TMenuItem;
    mnuContRecuperoTerceros: TMenuItem;
    mnuPagoElectronico: TMenuItem;
    mnuTesoTransfBAPRO_Transf: TMenuItem;
    mnuTesoTransfBAPRO_PagoElectr: TMenuItem;
    mnuTesoTransfBAPRO_PagoElectr_Archivo: TMenuItem;
    mnuTesoMantSucursalBancaria: TMenuItem;
    mnuImpuestos: TMenuItem;
    mnuImpLiquidaciones: TMenuItem;
    mnuImpMantenimiento: TMenuItem;
    mnuImpMantEntidadesRecaudadoras: TMenuItem;
    mnuImpMantConceptos: TMenuItem;
    mnuImpMantPeriodosContables: TMenuItem;
    mnuImpMantRelacionesEntidadesConceptos: TMenuItem;
    mnuImpMantTiposLiquidaciones: TMenuItem;
    mnuImpMantCodigosdmpuestos: TMenuItem;
    N8: TMenuItem;
    mnuImpListados: TMenuItem;
    mnuImpListLiquidacionesAprob: TMenuItem;
    mnuImpListVencimientos: TMenuItem;
    mnuTesoCashFlow: TMenuItem;
    mnuResEmbargos: TMenuItem;
    mnuResRecExtraordinarios: TMenuItem;
    mnuF817CompILT: TMenuItem;
    mnuManFechasPuestaDisposicion: TMenuItem;
    mnuLiquidacionesModificadas: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mnuTesoValAdministracionClick(Sender: TObject);
    procedure mnuTesoValIngresoClick(Sender: TObject);
    procedure mnuTesoMantBancosClick(Sender: TObject);
    procedure mnuTesoMantEmpresasDeudorasClick(Sender: TObject);
    procedure mnuTesoMantTablasMotivosRechazoValoresClick(Sender: TObject);
    procedure mnuTesoMantTablasMotivosAnulacionRecibosClick(Sender: TObject);
    procedure mnuCierredecajaClick(Sender: TObject);
    procedure mnuAdminBoletaDepositoClick(Sender: TObject);
    procedure mnuContConcBancariaClick(Sender: TObject);
    procedure mnuContCargaManualExtractoClick(Sender: TObject);
    procedure mnuContManToleranciasClick(Sender: TObject);
    procedure mnuContManCodigosConciliacionClick(Sender: TObject);
    procedure mnuContManTipoValorClick(Sender: TObject);
    procedure mnuContManConceptosValoresClick(Sender: TObject);
    procedure mnuContManCuentasBancariasClick(Sender: TObject);
    procedure mnuConsIngresosDepositosClick(Sender: TObject);
    procedure mnuTesoRecibosAdministracionClick(Sender: TObject);
    procedure mnuTesoRecibosBolDepositoClick(Sender: TObject);
    procedure mnuTesoChequesEmitidosClick(Sender: TObject);
    procedure mnuValUbicacionClick(Sender: TObject);
    procedure CargadelExtractoClick(Sender: TObject);
    procedure mnuCodigoExtractoClick(Sender: TObject);
    procedure mnuConsultaDeSaldoContableClick(Sender: TObject);
    procedure mnuVentaShowClick(Sender: TObject);
    procedure mnuManCTB_TABLAS(Sender: TObject);
    procedure mnuResumenClick(Sender: TObject);
    procedure mnuPeriodosContablesClick(Sender: TObject);
    procedure mnuChequesEmitidosClick(Sender: TObject);
    procedure mnuGenerarTABLASClick(Sender: TObject);
    procedure mnuAfiliacionesClick(Sender: TObject);
    procedure mnuDiarioClick(Sender: TObject);
    procedure mnuSubdiarioEmisinClick(Sender: TObject);
    procedure mnuSubdiarioCobranzaClick(Sender: TObject);
    procedure mnuSubdiariodeAmortizacindeDeudporPremiosClick(Sender: TObject);
    procedure mnuSubdiariodeRecuperodeDeudporPremiosClick(Sender: TObject);
    procedure mnuRegistrodeDenunciasdeSiniestrosClick(Sender: TObject);
    procedure mnuRegistrodeSiniestrosRecuperosyReasegurosClick(Sender: TObject);
    procedure mnuProveedoresClick(Sender: TObject);
    procedure mnuControldeCargaClick(Sender: TObject);
    procedure mnuChequesReemplazadosClick(Sender: TObject);
    procedure mnuSituacionesDeChequesClick(Sender: TObject);
    procedure mnuCuentasPagarClick(Sender: TObject);
    procedure mnuSubdiarioVolantesClick(Sender: TObject);
    procedure mnuLibrosClick(Sender: TObject);
    procedure mnuLiquidacionesCompensablesClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure mnuContManReservasClick(Sender: TObject);
    procedure mnuRegistroDenunciasSiniestrosFFEPClick(Sender: TObject);
    procedure mnuRegistroCobranzasFFEPClick(Sender: TObject);
    procedure mnuRegistroSiniestrosPagadosFFEPClick(Sender: TObject);
    procedure mnuTesoSobresClick(Sender: TObject);
    procedure mnuTesoAdminEfectivoClick(Sender: TObject);
    procedure mnuAgendaClick(Sender: TObject);
    procedure mnuControlInterfacesClick(Sender: TObject);
    procedure mnuGirosTransferenciasClick(Sender: TObject);
    procedure mnuRecExtraordStockClick(Sender: TObject);
    procedure mnuRecExtraordDevolSinAsignarClick(Sender: TObject);
    procedure mnuEmbAdministracionClick(Sender: TObject);
    procedure mnuEmbAplicacionClick(Sender: TObject);
    procedure fpIngresarFechaEnter(Sender: TObject);
    procedure mnuInteresesEmbargosClick(Sender: TObject);
    procedure mnuEstadoResultadosContratoClick(Sender: TObject);
    procedure mnuEmbDevolucionClick(Sender: TObject);
    procedure mnuTesoTransfBancariasClick(Sender: TObject);
    procedure mnuPrevisionIncobrablesConsClick(Sender: TObject);
    procedure mnuPrevisionIncobrablesExcepClick(Sender: TObject);
    procedure SubdiarioIVACompras1Click(Sender: TObject);
    procedure mnuCuentasValidadasClick(Sender: TObject);
    procedure mnuTesoTransfCuentasClick(Sender: TObject);
    procedure mnuSiniestrosMarcadosClick(Sender: TObject);
    procedure mnuFFEPPagosClick(Sender: TObject);
    procedure mnuFFEPEnviosClick(Sender: TObject);
    procedure mnuPrevisionIncobrablesGenTablasClick(Sender: TObject);
    procedure mnuAdminGPBAConsPagosClick(Sender: TObject);
    procedure mnuAdminGPBAPorcentajesClick(Sender: TObject);
    procedure mnuAdminGPBAPagosGenericosClick(Sender: TObject);
    procedure mnuAdminGPBAConceptosClick(Sender: TObject);
    procedure mnuAdminGPBACuentaCorrienteClick(Sender: TObject);
    procedure mnuResReservasClick(Sender: TObject);
    procedure mnuResActuarialesClick(Sender: TObject);
    procedure mnuContRecuperoTercerosClick(Sender: TObject);
    procedure mnuPagoElectronicoClick(Sender: TObject);
    procedure mnuTesoTransfBAPRO_TransfClick(Sender: TObject);
    procedure mnuTesoTransfBAPRO_PagoElectr_ArchivoClick(Sender: TObject);
    procedure mnuTesoMantSucursalBancariaClick(Sender: TObject);
    procedure mnuImpMantEntidadesRecaudadorasClick(Sender: TObject);
    procedure mnuImpMantConceptosClick(Sender: TObject);
    procedure mnuImpMantTiposLiquidacionesClick(Sender: TObject);
    procedure mnuImpMantCodigosdmpuestosClick(Sender: TObject);
    procedure mnuImpMantPeriodosContablesClick(Sender: TObject);
    procedure mnuImpMantRelacionesEntidadesConceptosClick(Sender: TObject);
    procedure mnuImpLiquidacionesClick(Sender: TObject);
    procedure mnuImpListLiquidacionesAprobClick(Sender: TObject);
    procedure mnuImpListVencimientosClick(Sender: TObject);
    procedure mnuTesoCashFlowClick(Sender: TObject);
    procedure mnuResEmbargosClick(Sender: TObject);
    procedure mnuResRecExtraordinariosClick(Sender: TObject);
    procedure mnuF817CompILTClick(Sender: TObject);
    procedure mnuManFechasPuestaDisposicionClick(Sender: TObject);
    procedure mnuLiquidacionesModificadasClick(Sender: TObject);
  private
    procedure AbreVentanaModal(ClassName: TComponentClass);
    procedure DoActualizarDatosGirosTransferencias;
  end;

procedure FinalizarEspera;
procedure IniciarEspera(AMensaje: String = 'Espere por favor...');

var
  frmPrincipal: TfrmPrincipal;
  iIndex      : Integer;
  sNombreQRP  : String;
  sPediodoRPT : String;
  sSql        : String;

implementation

uses
  AnsiSQL, General, unDmPrincipal, unValAdministracion, unValIngreso, unArt, unAfiliaciones, unManZBA_BANCO,
  unManRED_EMPDEUDORA, CustomDlgs, unValRecibos, unManMotivosRechValores, unManMotivosAnulacionRecibos, unManCierreDeCaja,
  unAdminBoletaDeposito, unConciliacionBancaria, unContCargaManualExtracto, unManOTC_TOLERANCIACONCILIACION,
  unManOCO_CODIGOCONCILIACION, unManOTV_TIPOVALOR, unManOCV_CONCEPTOVALOR, unManZCB_CUENTABANCARIA,
  unConsIngresosDepositos, unValRecibosBoletaDeposito, unConsCheques, SqlFuncs, unManRUV_UBICACIONVALOR, unImpoExpoWizard,
  unManCodigoExtracto, unConsSaldoContable, unCITRIX, unManCtbTablas, unRptDetalleIngresosDepositos,
  unManPeriodosContables, unqrListadoChequesEmitidos, unAdmInterfaces, unGeneracionTABLAS, unLibroAfiliaciones,
  unLibroDiario, unRptSubDiarioEmision, unConcBanc, unRptSubDiarioCobranzas, unRptSubDiarioAmortizacion,
  unRptSubDiaroRecupero, unRegDenunciasSini, unRptRegSiniestroRecupReaseg, unCuentasBancariasProveedores,
  unControlCarga_CuentasBancarias, unRptChequeReemplazados, unManSituacionesCheques, unContabilidadGeneral,
  unPrevisionIncobrables, unSubdiarioSiniestro, unSesion, unDmFinancials, DateTimeFuncs, unReservas,
  unManOCR_CALCULORESERVA, unRegDenunciasSiniFFEP, unRegCobranzasFFEP, unRegPagosFFEP, unSobres,
  unAdministracionEfectivo, unAlarmas, unEmbargos, unControlInterfaces, unRptProvGiroTransferencia,
  unRptNacionGiroTransferencia, unRecursosExtraordinarios, unRecExtrDevolucionesSinAsignar,
  unEmbargosAplicacion, unTesoreria, unEstadoResultadosContrato, unTransferenciasBAPRO, unAltaDevolucionEmbargos,
  unTransfBancarias, unManOEP_EXCEPCIONPREVISION, unLibroSubDiarioIVACompras, unCuentasBancariasValidadas,
  unTransferenciaCuentas, unEspera, unSiniestrosMarcados, unFFEPPagos, unFFEPEnvios, unGeneracionTABLASPrevIncobrables,
  unConsultaPagosGPBA, unPorcentajesGPBA, unPagosGenericosGPBA, unConceptosGBPBA, unCuentaCorrienteGPBA,
  unReservasActuariales, unRecuperoTerceros, unListadoPagoElectronico, unManZSB_SUCURSALBANCO,
  unImpuestosManEntidadRecaudadora, unImpuestosManConceptos, unImpuestosManTiposLiquidacion,
  unImpuestosManCodigosImpuestos, unImpuestosManPeriodosContables, unImpuestosManRelacionesEntConceptos,
  unImpuestosConsultaFacturas, unRptImpuestosLiquidaciones, unRptImpuestosResumenLiquidaciones,
  unRptImpuestosVencimientos, unCashFlow, unReservasEmbargos, unReservasRecExtraordinarios,
  unCobranzas, unQRF817, unComunes, unManFechasPuestaDisposicion,
  unLiquidacionesModificadas;

{$R *.DFM}

procedure FinalizarEspera;
begin
  unEspera.DetenerEspera;
end;

procedure IniciarEspera(AMensaje: String = 'Espere por favor...');
begin
  unEspera.IniciarEspera(AMensaje);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  if Alarma.Saludo then
    MostrarAlarma(Application.Title, 'Bienvenido al sistema de Tesorería de Provincia A.R.T.');

  ShortTimeFormat   := 'H:mm:ss';
  LongTimeFormat    := 'H:mm:ss';
  Animate.ResName   := 'CLOCK2';
end;

procedure TfrmPrincipal.mnuTesoValAdministracionClick(Sender: TObject);
begin
  Abrir(TfrmValAdministracion, frmValAdministracion, tmvMDIChild, mnuTesoValAdministracion);
end;

procedure TfrmPrincipal.mnuTesoValIngresoClick(Sender: TObject);
begin
  Abrir(TfrmValIngreso, frmValIngreso, tmvMDIChild, mnuTesoValIngreso);
  with frmValIngreso do
    begin
      TipoEmpresa   := teDeudora;
      EditType      := fsAgregar;
      IdValor       := ART_EMPTY_ID;
    end;
end;

procedure TfrmPrincipal.mnuTesoMantBancosClick(Sender: TObject);
begin
  Abrir(TfrmManZBA_BANCO, frmManZBA_BANCO,tmvMDIChild, mnuTesoMantBancos);
end;

procedure TfrmPrincipal.mnuTesoMantEmpresasDeudorasClick(Sender: TObject);
begin
  Abrir(TfrmManRED_EMPDEUDORA, frmManRED_EMPDEUDORA, tmvMDIChild, mnuTesoMantEmpresasDeudoras);
end;

procedure TfrmPrincipal.mnuTesoMantTablasMotivosRechazoValoresClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosRechValores, frmManMotivosRechValores, tmvMDIChild, mnuTesoMantTablasMotivosRechazoValores);
end;

procedure TfrmPrincipal.mnuTesoMantTablasMotivosAnulacionRecibosClick(Sender: TObject);
begin
  Abrir(TfrmManMotivosAnulacionRecibos, frmManMotivosAnulacionRecibos, tmvMDIChild, mnuTesoMantTablasMotivosAnulacionRecibos);
end;

procedure TfrmPrincipal.mnuCierredecajaClick(Sender: TObject);
begin
  Abrir(TfrmManCierreDeCaja, frmManCierreDeCaja, tmvMDIChild, mnuCierredecaja);
end;

procedure TfrmPrincipal.mnuAdminBoletaDepositoClick(Sender: TObject);
begin
  Abrir(TfrmAdminBoletaDeposito, frmAdminBoletaDeposito, tmvMDIChild, mnuAdminBoletaDeposito);
end;

procedure TfrmPrincipal.mnuContConcBancariaClick(Sender: TObject);
begin
  Abrir(TfrmConciliacionBancaria, frmConciliacionBancaria, tmvMDIChild, mnuContConcBancaria);
end;

procedure TfrmPrincipal.mnuContCargaManualExtractoClick(Sender: TObject);
begin
  Abrir(TfrmContCargaManualExtracto, frmContCargaManualExtracto, tmvMDIChild, mnuContCargaManualExtracto);
end;

procedure TfrmPrincipal.mnuContManToleranciasClick(Sender: TObject);
begin
  Abrir(TfrmManOTC_TOLERANCIACONCILIACION, frmManOTC_TOLERANCIACONCILIACION, tmvMDIChild, mnuContManTolerancias);
end;

procedure TfrmPrincipal.mnuContManCodigosConciliacionClick(Sender: TObject);
begin
  Abrir(TfrmManOCO_CODIGOCONCILIACION, frmManOCO_CODIGOCONCILIACION, tmvMDIChild, mnuContManCodigosConciliacion);
end;

procedure TfrmPrincipal.mnuContManTipoValorClick(Sender: TObject);
begin
  Abrir(TfrmManOTV_TIPOVALOR, frmManOTV_TIPOVALOR, tmvMDIChild, mnuContManTipoValor);
end;

procedure TfrmPrincipal.mnuContManConceptosValoresClick(Sender: TObject);
begin
  Abrir(TfrmManOCV_CONCEPTOVALOR, frmManOCV_CONCEPTOVALOR, tmvMDIChild, mnuContManConceptosValores);
end;

procedure TfrmPrincipal.mnuContManCuentasBancariasClick(Sender: TObject);
begin
  Abrir(TfrmManZCB_CUENTABANCARIA, frmManZCB_CUENTABANCARIA, tmvMDIChild, mnuContManCuentasBancarias);
end;

procedure TfrmPrincipal.mnuConsIngresosDepositosClick(Sender: TObject);
begin
  Abrir(TfrmConsIngresosDepositos, frmConsIngresosDepositos, tmvMDIChild, mnuDetalle);
end;

procedure TfrmPrincipal.mnuTesoRecibosAdministracionClick(Sender: TObject);
begin
  Abrir(TfrmValRecibos, frmValRecibos, tmvMDIChild, mnuTesoRecibosAdministracion);
end;

procedure TfrmPrincipal.mnuTesoRecibosBolDepositoClick(Sender: TObject);
begin
  Abrir(TfrmValRecibosBoletaDeposito, frmValRecibosBoletaDeposito, tmvMDIChild, mnuTesoRecibosBolDeposito);
end;

procedure TfrmPrincipal.mnuTesoChequesEmitidosClick(Sender: TObject);
begin
  Abrir(TfrmConsCheques, frmConsCheques, tmvMDIChild, mnuTesoChequesEmitidos);
  frmConsCheques.WindowState := wsMaximized;
end;

procedure TfrmPrincipal.mnuValUbicacionClick(Sender: TObject);
begin
  TfrmManRUV_UBICACIONVALOR.Create(mnuValUbicacion);
end;

procedure TfrmPrincipal.mnuVentaShowClick(Sender: TObject);
begin
  TForm(TComponent(Sender).Owner).Show;
end;

procedure TfrmPrincipal.CargadelExtractoClick(Sender: TObject);
begin
  ImpoExpoWizard('CCEB');
end;

procedure TfrmPrincipal.mnuCodigoExtractoClick(Sender: TObject);
begin
  Abrir(TfrmManCodigoExtracto, frmManCodigoExtracto, tmvMDIChild, mnuCodigoExtracto);
end;

procedure TfrmPrincipal.mnuConsultaDeSaldoContableClick(Sender: TObject);
begin
  Abrir(TfrmConsSaldoContable, frmConsSaldoContable, tmvMDIChild, mnuConsultaDeSaldoContable);
end;

procedure TfrmPrincipal.mnuManCTB_TABLAS(Sender: TObject);
begin
  with TfrmManCtbTablas.Create(Self) do
  begin
    MenuItem  := TMenuItem(Sender);
    Caption   := 'Mantenimiento de ' + StringReplace(MenuItem.Caption, '&', '', []);
    Clave     := MenuItem.Hint;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuResumenClick(Sender: TObject);
var
  dFecha: TDateTime;
begin
  dFecha := InputBoxDate('Listado', 'Fecha', DBDateTime);

  if dFecha < 1 then
    Abort;

  with TqrDetalleIngresosDepositos.Create(Self) do
    Imprimir(dFecha);
end;

procedure TfrmPrincipal.mnuPeriodosContablesClick(Sender: TObject);
begin
  Abrir(TfrmManPeriodosContables, frmManPeriodosContables, tmvMDIChild, mnuPeriodosContables);
end;

procedure TfrmPrincipal.mnuChequesEmitidosClick(Sender: TObject);
var
  dFecha: TDateTime;
begin
  dFecha := InputBoxDate('Listado de Cheques Emitidos', 'Fecha', DBDateTime);

  if dFecha < 1 then
    Abort;

  with TqrListadoChequesEmitidos.Create(Self) do
    Imprimir(dFecha);
end;

procedure TfrmPrincipal.mnuGenerarTABLASClick(Sender: TObject);
begin
  AbreVentanaModal(TfrmGeneracionTABLAS);
end;

procedure TfrmPrincipal.mnuAfiliacionesClick(Sender: TObject);
begin
  AbreVentanaModal(TfrmLibroAfiliaciones);
end;

procedure TfrmPrincipal.mnuDiarioClick(Sender: TObject);
begin
  dmFinancials.Conectar;
  try
    AbreVentanaModal(TfrmLibroDiario);
  finally
    dmFinancials.Desconectar;
  end;
end;

procedure TfrmPrincipal.mnuSubdiarioEmisinClick(Sender: TObject);
var
  rptSubDiarioEmision: TrptSubDiarioEmision;
begin
  rptSubDiarioEmision := TrptSubDiarioEmision.Create(Self);
  try
    sPediodoRPT := rptSubDiarioEmision.GetPeriodo;
    sNombreQRP := 'SubDiarioEmision';
    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar((iIndex = -1), nil, 'No se encontró la Impresora PDF.');
    rptSubDiarioEmision.PrinterSettings.PrinterIndex := iIndex;

    IniciarEspera;
    rptSubDiarioEmision.sdqReporte.Open;
    FinalizarEspera;

    if rptSubDiarioEmision.sdqReporte.IsEmpty  then
      MsgBox('No se encontraron datos para la selección actual.')
    else
      rptSubDiarioEmision.Print;
  finally
    rptSubDiarioEmision.Free;
  end;
end;

procedure TfrmPrincipal.mnuSubdiarioCobranzaClick(Sender: TObject);
var
  rptSubDiarioCobranzas: TrptSubDiarioCobranzas;
begin
  rptSubDiarioCobranzas := TrptSubDiarioCobranzas.Create(Self);
  try
    sPediodoRPT := rptSubDiarioCobranzas.GetPeriodo;
    sNombreQRP := 'SubDiarioCobranza';
    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar((iIndex = -1), nil, 'No se encontró la Impresora PDF.');
    rptSubDiarioCobranzas.PrinterSettings.PrinterIndex := iIndex;

    IniciarEspera;
    rptSubDiarioCobranzas.sdqReporte.Open;
    FinalizarEspera;

    if rptSubDiarioCobranzas.sdqReporte.IsEmpty then
      MsgBox('No se encontraron datos para la selección actual.')
    else
      rptSubDiarioCobranzas.Print;
  finally
    rptSubDiarioCobranzas.Free;
  end;
end;

procedure TfrmPrincipal.mnuSubdiariodeAmortizacindeDeudporPremiosClick(Sender: TObject);
begin
  rptSubDiarioAmortizacion:= TrptSubDiarioAmortizacion.Create(Self);
  try
    sPediodoRPT := rptSubDiarioAmortizacion.GetPeriodo;
    sNombreQRP := 'SubDiarioAmortizacion';
    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar((iIndex = -1), nil, 'No se encontró la Impresora PDF');
    rptSubDiarioAmortizacion.PrinterSettings.PrinterIndex := iIndex;

    IniciarEspera;
    rptSubDiarioAmortizacion.sdqReporte.Open;
    FinalizarEspera;

    if rptSubDiarioAmortizacion.sdqReporte.IsEmpty  then
      MsgBox('No se encontraron datos para la selección actual')
    else
      rptSubDiarioAmortizacion.Print;
  finally
    rptSubDiarioAmortizacion.Free;
  end;
end;

procedure TfrmPrincipal.mnuSubdiariodeRecuperodeDeudporPremiosClick(Sender: TObject);
begin
  rptSubDiaroRecupero := TrptSubDiaroRecupero.Create(Self);
  try
    sPediodoRPT := rptSubDiaroRecupero.GetPeriodo;
    sNombreQRP := 'SubDiarioRecupero';
    SetNombrePDF(sNombreQRP, sPediodoRPT);
    iIndex := GetPrinterPDF();
    Verificar((iIndex = -1), nil, 'No se encontró la Impresora PDF');
    rptSubDiaroRecupero.PrinterSettings.PrinterIndex := iIndex;

    IniciarEspera;
    rptSubDiaroRecupero.sdqReporte.Open;
    FinalizarEspera;

    //Solo para imprimir el 1. rptSubDiaroRecupero.PreviewModal;
    if rptSubDiaroRecupero.sdqReporte.IsEmpty  then
      MsgBox('No se encontraron datos para la selección actual')
    else
      rptSubDiaroRecupero.Print;
  finally
    rptSubDiaroRecupero.Free;
  end;
end;

procedure TfrmPrincipal.mnuRegistrodeDenunciasdeSiniestrosClick(Sender: TObject);
begin
  AbreVentanaModal(TfrmRegDenunciasSini);
end;

procedure TfrmPrincipal.mnuRegistrodeSiniestrosRecuperosyReasegurosClick(Sender: TObject);
begin
  dmFinancials.Conectar;
  rptRegSiniestroRecupReaseg := TrptRegSiniestroRecupReaseg.Create(Self);
  try
    sPediodoRPT := rptRegSiniestroRecupReaseg.GetPeriodo;
    sNombreQRP := 'SiniestrosRecReAseg';
    SetNombrePDF(sNombreQRP, sPediodoRPT);
    Verificar((iIndex = -1), nil, 'No se encontró la Impresora PDF');
    iIndex := GetPrinterPDF();
    Verificar((iIndex = -1), nil, 'No se encontró la Impresora PDF');
    rptRegSiniestroRecupReaseg.PrinterSettings.PrinterIndex := iIndex;

    IniciarEspera;
    rptRegSiniestroRecupReaseg.sdqReporte.Open;
    FinalizarEspera;

    if rptRegSiniestroRecupReaseg.sdqReporte.IsEmpty then
      MsgBox('No se encontraron datos para la selección actual.')
    else
      rptRegSiniestroRecupReaseg.Print;
  finally
    dmFinancials.Desconectar;
    rptRegSiniestroRecupReaseg.Free;
  end;
end;

procedure TfrmPrincipal.AbreVentanaModal(ClassName: TComponentClass);
var
  Form: TForm;
begin
  Application.CreateForm(ClassName, Form);
  try
    TForm(Form).ShowModal;
  finally
    TForm(Form).Free;
  end;
end;

procedure TfrmPrincipal.mnuProveedoresClick(Sender: TObject);
begin
  AbreVentanaModal(TfrmCuentasBancariasProveedores);
end;

procedure TfrmPrincipal.mnuControldeCargaClick(Sender: TObject);
begin
  with TfrmControlCarga_CuentasBancarias.Create(Self) do
    FormStyle := fsMDIChild;
end;

procedure TfrmPrincipal.mnuChequesReemplazadosClick(Sender: TObject);
begin
  with TfrmRptChequeReemplazados.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuSituacionesDeChequesClick(Sender: TObject);
begin
  Abrir(TfrmManSituacionesCheques, frmManSituacionesCheques, tmvMDIChild, mnuSituacionesDeCheques);
end;

procedure TfrmPrincipal.mnuCuentasPagarClick(Sender: TObject);
begin
  AbreVentanaModal(TfrmAdmInterfaces);
end;

procedure TfrmPrincipal.mnuSubdiarioVolantesClick(Sender: TObject);
begin
  FreeAndNil(frmSubdiarioSiniestro);
  frmSubdiarioSiniestro := TfrmSubdiarioSiniestro.Create(Self);
  frmSubdiarioSiniestro.Show;
end;

procedure TfrmPrincipal.mnuLibrosClick(Sender: TObject);
begin
  AbreVentanaModal(TfrmContabilidadGeneral);
end;

procedure TfrmPrincipal.mnuLiquidacionesCompensablesClick(Sender: TObject);
begin
  if fpIngresarFecha.ShowModal = mrOk then
    DoEjecutarInterfaceAsientos('V', dcbFecha.Date);
end;

procedure TfrmPrincipal.mnuLiquidacionesModificadasClick(Sender: TObject);
begin
  Abrir(TfrmLiquidacionesModificadas, frmLiquidacionesModificadas, tmvMDIChild, mnuLiquidacionesModificadas);
end;

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  fpIngresarFecha.Close;
end;

procedure TfrmPrincipal.btnAceptarClick(Sender: TObject);
begin
  Verificar(dcbFecha.IsEmpty, dcbFecha, 'Por favor ingrese la fecha.');
  fpIngresarFecha.ModalResult := mrOk;
end;

procedure TfrmPrincipal.mnuContManReservasClick(Sender: TObject);
begin
  Abrir(TfrmManOCR_CALCULORESERVA, frmManOCR_CALCULORESERVA, tmvMDIChild, mnuContManReservas);
end;

procedure TfrmPrincipal.mnuRegistroDenunciasSiniestrosFFEPClick(Sender: TObject);
begin
  AbreVentanaModal(TfrmRegDenunciasSiniFFEP);
end;

procedure TfrmPrincipal.mnuRegistroCobranzasFFEPClick(Sender: TObject);
begin
  AbreVentanaModal(TfrmRegCobranzasFFEP);
end;

procedure TfrmPrincipal.mnuRegistroSiniestrosPagadosFFEPClick(Sender: TObject);
begin
  AbreVentanaModal(TfrmRegPagosFFEP);
end;

procedure TfrmPrincipal.mnuTesoSobresClick(Sender: TObject);
begin
  Abrir(TfrmSobres, frmSobres, tmvMDIChild, mnuTesoSobres);
end;

procedure TfrmPrincipal.mnuTesoAdminEfectivoClick(Sender: TObject);
begin
  Abrir(TfrmAdministracionEfectivo, frmAdministracionEfectivo, tmvMDIChild, mnuTesoAdminEfectivo);
end;

procedure TfrmPrincipal.mnuAgendaClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmPrincipal.mnuControlInterfacesClick(Sender: TObject);
begin
  Abrir(TfrmControlInterfaces, frmControlInterfaces, tmvModal, mnuControlInterfaces);
end;

procedure TfrmPrincipal.DoActualizarDatosGirosTransferencias;
var
  sSql: String;
begin
  IniciarEspera;
  try
    BeginTrans;
    try
   (*  sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                 'SET CE_SITUACION = (SELECT CASE ' +
                                              'WHEN     CP_IDBANCO = 3 ' +
                                                   'AND CP_NROCUENTA IS NOT NULL THEN ''18'' ' +
                                              'WHEN     CP_IDBANCO = 3 ' +
                                                   'AND CP_NROCUENTA IS NULL THEN ''16'' ' +
                                              'WHEN CP_IDBANCO = 6 THEN ''17'' ' +
                                            'END ' +
                                       'FROM CCP_CUENTAPAGO ' +
                                      'WHERE CP_TIPOACREEDOR = ''TA'' ' +
                                        'AND CP_FECHABAJA IS NULL ' +
                                        'AND CP_IDACREEDOR = CE_IDTRABAJADOR), ' +
                     'CE_FECHASITUACION = ACTUALDATE, ' +
                     'CE_USUSITUACION = :Usuario ' +
               'WHERE CE_FECHAIMPRESIONNOTA IS NULL ' +
                 'AND CE_IDTRABAJADOR IN (SELECT CP_IDACREEDOR ' +
                                           'FROM CCP_CUENTAPAGO ' +
                                          'WHERE CP_TIPOACREEDOR = ''TA'' ' +
                                            'AND CP_FECHABAJA IS NULL)';
      EjecutarSqlSTEx( sSql, [Sesion.UserID] ); *)

      sSql := 'INSERT INTO RSO_SOBRE ' +
                         '(SO_ID, SO_IDCHEQUEEMITIDO, SO_CALLE, SO_NUMERO, SO_PISO, SO_DEPARTAMENTO, SO_LOCALIDAD, SO_CPOSTAL, SO_PROVINCIA, ' +
                          'SO_FECHAALTA, SO_USUALTA) ' +
             'SELECT SEQ_RSO_ID.NEXTVAL, CE_ID, TJ_CALLE, TJ_NUMERO, TJ_PISO, TJ_DEPARTAMENTO, TJ_LOCALIDAD, TJ_CPOSTAL, TJ_PROVINCIA, ' +
                    'SYSDATE, :Usuario ' +
               'FROM CTJ_TRABAJADOR, RCE_CHEQUEEMITIDO, CCP_CUENTAPAGO ' +
              'WHERE TJ_ID = CE_IDTRABAJADOR ' +
                'AND CP_IDACREEDOR = CE_IDTRABAJADOR ' +
                'AND CP_TIPOACREEDOR = ''TA'' ' +
                'AND CP_FECHABAJA IS NULL ' +
                'AND CE_FECHAIMPRESIONNOTA IS NULL ' +
                'AND TJ_CALLE IS NOT NULL';
      EjecutarSqlSTEx( sSql, [Sesion.UserId] );

      sSql := 'UPDATE RCE_CHEQUEEMITIDO ' +
                 'SET CE_FECHAIMPRESIONNOTA = SYSDATE ' +
               'WHERE CE_FECHAIMPRESIONNOTA IS NULL ' +
                 'AND CE_IDTRABAJADOR IN (SELECT CP_IDACREEDOR ' +
                                           'FROM CCP_CUENTAPAGO ' +
                                          'WHERE CP_TIPOACREEDOR = ''TA'' ' +
                                            'AND CP_FECHABAJA IS NULL)';
      EjecutarSqlST( sSql );

      CommitTrans;
    except
      on E: Exception do
        begin
          Rollback;
          ErrorMsg(E, 'Error al actualizar tablas.');
        end;
    end;
  finally
    FinalizarEspera;
  end;
end;

procedure TfrmPrincipal.mnuGirosTransferenciasClick(Sender: TObject);
begin
  DoImprimirProvGiroTransferencia('G');    // Giro y Transferencia
  DoImprimirProvGiroTransferencia('I');    // Interdepósito
       
  DoImprimirNacionGiroTransferencia('G');  // Giro y Transferencia
  DoImprimirNacionGiroTransferencia('T');  // Transferencia

  DoActualizarDatosGirosTransferencias;
end;

procedure TfrmPrincipal.mnuRecExtraordStockClick(Sender: TObject);
begin
  Abrir(TfrmRecursosExtraordinarios, frmRecursosExtraordinarios, tmvMDIChild, mnuRecursosExtraordinarios);
end;

procedure TfrmPrincipal.mnuRecExtraordDevolSinAsignarClick(Sender: TObject);
begin
	Abrir(TfrmRecExtrDevolucionesSinAsignar, frmRecExtrDevolucionesSinAsignar, tmvMDIChild, mnuRecExtraordDevolSinAsignar);
  frmRecExtrDevolucionesSinAsignar.PermitirAsignar := False;
end;

procedure TfrmPrincipal.mnuEmbAdministracionClick(Sender: TObject);
begin
  Abrir(TfrmEmbargos, frmEmbargos, tmvMDIChild, mnuEmbAdministracion);
end;

procedure TfrmPrincipal.mnuEmbAplicacionClick(Sender: TObject);
begin
  Abrir(TfrmEmbargosAplicacion, frmEmbargosAplicacion, tmvMDIChild, mnuEmbAplicacion);
end;

procedure TfrmPrincipal.fpIngresarFechaEnter(Sender: TObject);
begin
  dcbFecha.Clear;
end;

procedure TfrmPrincipal.mnuInteresesEmbargosClick(Sender: TObject);
begin
  if fpIngresarFecha.ShowModal = mrOk then
    DoEjecutarInterfaceAsientos('E', dcbFecha.Date);
end;

procedure TfrmPrincipal.mnuEstadoResultadosContratoClick(Sender: TObject);
begin
  Abrir(TfrmEstadoResultadosContrato, frmEstadoResultadosContrato, tmvMDIChild, mnuEstadoResultadosContrato);
end;

procedure TfrmPrincipal.mnuEmbDevolucionClick(Sender: TObject);
begin
  with TfrmAltaDevolucionEmbargos.Create(Self) do
    try
      EsConcilBancaria := False;

      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmPrincipal.mnuTesoTransfBancariasClick(Sender: TObject);
begin
  Abrir(TfrmTransfBancarias, frmTransfBancarias, tmvMDIChild, mnuTesoTransfBancarias);
end;

procedure TfrmPrincipal.mnuPrevisionIncobrablesConsClick(Sender: TObject);
begin
  Abrir(TfrmPrevisionIncobrables, frmPrevisionIncobrables, tmvMDIChild, mnuPrevisionIncobrablesCons);
end;

procedure TfrmPrincipal.mnuPrevisionIncobrablesExcepClick(Sender: TObject);
begin
  Abrir(TfrmManOEP_EXCEPCIONPREVISION, frmManOEP_EXCEPCIONPREVISION, tmvMDIChild, mnuPrevisionIncobrablesExcep);
end;

procedure TfrmPrincipal.SubdiarioIVACompras1Click(Sender: TObject);
begin
  dmFinancials.Conectar;
  try
    AbreVentanaModal(TfrmLibroSubDiarioIVACompras);
  finally
    dmFinancials.Desconectar;
  end;
end;

procedure TfrmPrincipal.mnuCuentasValidadasClick(Sender: TObject);
begin
  Abrir(TfrmCuentasBancariasValidadas, frmCuentasBancariasValidadas, tmvMDIChild, mnuCuentasValidadas);
end;

procedure TfrmPrincipal.mnuTesoTransfCuentasClick(Sender: TObject);
begin
  Abrir(TfrmTransferenciaCuentas, frmTransferenciaCuentas, tmvMDIChild, mnuTesoTransfCuentas);
end;

procedure TfrmPrincipal.mnuSiniestrosMarcadosClick(Sender: TObject);
begin
  Abrir(TfrmSiniestrosMarcados, frmSiniestrosMarcados, tmvMDIChild, mnuSiniestrosMarcados);
end;

procedure TfrmPrincipal.mnuFFEPPagosClick(Sender: TObject);
begin
  Abrir(TfrmFFEPPagos, frmFFEPPagos, tmvMDIChild, mnuFFEPPagos);
end;

procedure TfrmPrincipal.mnuF817CompILTClick(Sender: TObject);
var
  IdCompensacion: TTableId;
begin
  while True do
    begin
      IdCompensacion := InputBoxInteger('F817 - Compensación ILT', 'Ingrese el nro. de proceso', 0);

      if IdCompensacion = -1 then
        Break
      else if IdCompensacion = 0 then
        InfoHint(nil, 'Debe indicar el nro. de proceso de compensación.')
      else if not Is_ExisteIdCompensacion(IdCompensacion) then
        InfoHint(nil, 'El nro. de proceso de compensación no existe.')
      else if not Do_ImprimirF817(ART_EMPTY_ID, 0, srPreview, 1, '', 0, IdCompensacion) then
        InfoHint(nil, 'No se han encontrado periodos con deuda.')
      else
        Break;
    end;
end;

procedure TfrmPrincipal.mnuManFechasPuestaDisposicionClick(Sender: TObject);
begin
   Abrir(TfrmManFechasPuestaDisposicion, frmManFechasPuestaDisposicion, tmvMDIChild, mnuManFechasPuestaDisposicion);
end;

procedure TfrmPrincipal.mnuFFEPEnviosClick(Sender: TObject);
begin
  Abrir(TfrmFFEPEnvios, frmFFEPEnvios, tmvMDIChild, mnuFFEPEnvios);
end;

procedure TfrmPrincipal.mnuPrevisionIncobrablesGenTablasClick(Sender: TObject);
begin
  Abrir(TfrmGeneracionTABLASPrevIncobrables, frmGeneracionTABLASPrevIncobrables, tmvModal, mnuPrevisionIncobrablesGenTablas);
end;

procedure TfrmPrincipal.mnuAdminGPBAConsPagosClick(Sender: TObject);
begin
  Abrir(TfrmConsultaPagosGPBA, frmConsultaPagosGPBA, tmvMDIChild, mnuAdminGPBAConsPagos);
end;

procedure TfrmPrincipal.mnuAdminGPBAPorcentajesClick(Sender: TObject);
begin
  Abrir(TfrmPorcentajesGPBA, frmPorcentajesGPBA, tmvMDIChild, mnuAdminGPBAPorcentajes);
end;

procedure TfrmPrincipal.mnuAdminGPBAPagosGenericosClick(Sender: TObject);
begin
  Abrir(TfrmPagosGenericosGPBA, frmPagosGenericosGPBA, tmvMDIChild, mnuAdminGPBAPagosGenericos);
end;
 
procedure TfrmPrincipal.mnuAdminGPBAConceptosClick(Sender: TObject);
begin
  Abrir(TfrmConceptosGBPBA, frmConceptosGBPBA, tmvMDIChild, mnuAdminGPBAConceptos);
end;

procedure TfrmPrincipal.mnuAdminGPBACuentaCorrienteClick(Sender: TObject);
begin
  Abrir(TfrmCuentaCorrienteGPBA, frmCuentaCorrienteGPBA, tmvMDIChild, mnuAdminGPBACuentaCorriente);
end;

procedure TfrmPrincipal.mnuResRecExtraordinariosClick(Sender: TObject);
begin
  Abrir(TfrmReservasRecExtraordinarios, frmReservasRecExtraordinarios, tmvMDIChild, mnuResRecExtraordinarios);
end;

procedure TfrmPrincipal.mnuResReservasClick(Sender: TObject);
begin
  Abrir(TfrmReservas, frmReservas, tmvMDIChild, mnuResReservas);
end;

procedure TfrmPrincipal.mnuResActuarialesClick(Sender: TObject);
begin
  Abrir(TfrmReservasActuariales, frmReservasActuariales, tmvMDIChild, mnuResActuariales);
end;

procedure TfrmPrincipal.mnuResEmbargosClick(Sender: TObject);
begin
  Abrir(TfrmReservasEmbargos, frmReservasEmbargos, tmvMDIChild, mnuResEmbargos);
end;

procedure TfrmPrincipal.mnuContRecuperoTercerosClick(Sender: TObject);
begin
  Abrir(TfrmRecuperoTerceros, frmRecuperoTerceros, tmvMDIChild, mnuContRecuperoTerceros);
end;

procedure TfrmPrincipal.mnuPagoElectronicoClick(Sender: TObject);
begin
  Abrir(TfrmListadoPagoElectronico, frmListadoPagoElectronico, tmvModal, mnuPagoElectronico);
end;

procedure TfrmPrincipal.mnuTesoTransfBAPRO_TransfClick(Sender: TObject);
begin
  Abrir(TfrmTransferenciasBAPRO, frmTransferenciasBAPRO, tmvMDIChild, mnuTesoTransfBAPRO_Transf);
end;

procedure TfrmPrincipal.mnuTesoTransfBAPRO_PagoElectr_ArchivoClick(Sender: TObject);
begin
  ImpoExpoWizard('TPEPR');
end;

procedure TfrmPrincipal.mnuTesoMantSucursalBancariaClick(Sender: TObject);
begin
  Abrir(TfrmManZSB_SUCURSALBANCO, frmManZSB_SUCURSALBANCO, tmvMDIChild, mnuTesoMantSucursalBancaria);
end;

procedure TfrmPrincipal.mnuImpMantEntidadesRecaudadorasClick(Sender: TObject);
begin
  Abrir(TfrmImpuestosManEntidadRecaudadora, frmImpuestosManEntidadRecaudadora, tmvMDIChild, mnuImpMantEntidadesRecaudadoras);
end;

procedure TfrmPrincipal.mnuImpMantConceptosClick(Sender: TObject);
begin
  Abrir(TfrmImpuestosManConceptos, frmImpuestosManConceptos, tmvMDIChild, mnuImpMantConceptos);
end;

procedure TfrmPrincipal.mnuImpMantTiposLiquidacionesClick(Sender: TObject);
begin
  Abrir(TfrmImpuestosManTiposLiquidacion, frmImpuestosManTiposLiquidacion, tmvMDIChild, mnuImpMantTiposLiquidaciones);
end;

procedure TfrmPrincipal.mnuImpMantCodigosdmpuestosClick(Sender: TObject);
begin
  Abrir(TfrmImpuestosManCodigosImpuestos, frmImpuestosManCodigosImpuestos, tmvMDIChild, mnuImpMantCodigosdmpuestos);
end;

procedure TfrmPrincipal.mnuImpMantPeriodosContablesClick(Sender: TObject);
begin
  Abrir(TfrmImpuestosManPeriodosContables, frmImpuestosManPeriodosContables, tmvMDIChild, mnuImpMantPeriodosContables);
end;

procedure TfrmPrincipal.mnuImpMantRelacionesEntidadesConceptosClick(Sender: TObject);
begin
  Abrir(TfrmImpuestosManRelacionesEntConceptos, frmImpuestosManRelacionesEntConceptos, tmvMDIChild, mnuImpMantRelacionesEntidadesConceptos);
end;

procedure TfrmPrincipal.mnuImpLiquidacionesClick(Sender: TObject);
begin
  Abrir(TfrmImpuestosConsultaFacturas, frmImpuestosConsultaFacturas, tmvMDIChild, mnuImpLiquidaciones);
end;

procedure TfrmPrincipal.mnuImpListLiquidacionesAprobClick(Sender: TObject);
var
  dFecha: TDateTime;
begin
  repeat
    dFecha := InputBoxDate('Liquidaciones', 'Fecha de Aprobación', DBDateTime);

    if dFecha = 0 then
      InfoHint(nil, 'Debe ingresar una fecha de aprobación.', False)
    else if dFecha > 0 then
      begin
        DoImprimirDetLiquidacionesImpuestos(dFecha);
        DoImprimirResLiquidacionesImpuestos(dFecha);
      end;
  until dFecha <> 0
end;

procedure TfrmPrincipal.mnuImpListVencimientosClick(Sender: TObject);
var
  dFecha: TDateTime;
begin
  repeat
    dFecha := InputBoxDate('Impuestos', 'Fecha de Vencimiento', DBDateTime);

    if dFecha = 0 then
      InfoHint(nil, 'Debe ingresar una fecha de vencimiento.', False)
    else if dFecha > 0 then
      DoImprimirVencimientosImpuestos(dFecha);
  until dFecha <> 0
end;

procedure TfrmPrincipal.mnuTesoCashFlowClick(Sender: TObject);
begin
  Abrir(TfrmCashFlow, frmCashFlow, tmvMDIChild, mnuTesoCashFlow);
end;

end.


