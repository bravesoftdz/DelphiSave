unit unFrmGestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, PatternEdit, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, PeriodoPicker, StdCtrls, unArtFrame, unFraCodigoDescripcion,
  ExtCtrls, ComCtrls, ToolWin, FormPanel, JvExExtCtrls, JvNetscapeSplitter,
  JvExComCtrls, JvStatusBar, ToolEdit, CurrEdit, CardinalEdit,
  unfraCtbTablas, DB, SDEngine, unFraCriterios, unArtDBAwareFrame;

type
  TfrmGestion = class(TForm)
    cbEstadoCuenta: TCoolBar;
    ToolBar: TToolBar;
    tbRefrescar: TToolButton;
    tbPropiedades: TToolButton;
    tbLimpiar: TToolButton;
    tbOrdenar: TToolButton;
    tbMostrarOcultarColumnas: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    tbEnviarMail: TToolButton;
    tbSalir: TToolButton;
    pnFiltros: TPanel;
    dbgContratos: TArtDBGrid;
    btnAsignarALote: TToolButton;
    tbDesasignarDelLote: TToolButton;
    tbLotes: TToolButton;
    tbRealizarGestion: TToolButton;
    ToolButton13: TToolButton;
    od: TOpenDialog;
    btnAnexarDesde: TToolButton;
    ToolButton26: TToolButton;
    sb: TJvStatusBar;
    splitter: TJvNetscapeSplitter;
    pgGestion: TPageControl;
    ts: TTabSheet;
    GroupBox3: TGroupBox;
    dbgPresentaciones: TArtDBGrid;
    GroupBox4: TGroupBox;
    dbgTrabajadores: TArtDBGrid;
    tsObservaciones: TTabSheet;
    gbObservaciones: TGroupBox;
    dbgGestion: TArtDBGrid;
    gbLoteGestion: TGroupBox;
    lblNroLote: TLabel;
    lblGestorEmision: TLabel;
    lblTamanio: TLabel;
    edtNroLote: TEdit;
    edtGestorEmision: TEdit;
    edtTamanio: TEdit;
    gbAccionesTomadas: TGroupBox;
    dbgAccionesTomadas: TArtDBGrid;
    cb: TCoolBar;
    tbObservaciones: TToolBar;
    ToolButton16: TToolButton;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    tbMostrarGestion: TToolButton;
    tsCriteriosDefinidos: TTabSheet;
    CoolBar: TCoolBar;
    tbEstadoCuenta: TToolBar;
    tbRefrescarEstadoCuenta: TToolButton;
    ToolButton5: TToolButton;
    tbOrdenartbRefrescarEstadoCuenta: TToolButton;
    tbImprimirtbRefrescarEstadoCuenta: TToolButton;
    tbExportartbRefrescarEstadoCuenta: TToolButton;
    dbgEstadoCuenta: TArtDBGrid;
    TabSheet2: TTabSheet;
    dbgNotasPresentadas: TArtDBGrid;
    sdqCriterios: TSDQuery;
    dsCriterios: TDataSource;
    ToolButton2: TToolButton;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    pcCriteriosParaDefinicion: TPageControl;
    tsCriteriosArmadoLote: TTabSheet;
    fraEdicionCriterios: TfraCriterios;
    tsCriteriosLibres: TTabSheet;
    gbDetalleBusqueda: TGroupBox;
    lblCondicionSuss: TLabel;
    lblCUITS: TLabel;
    lblHolding: TLabel;
    lblEjecutivo: TLabel;
    lblTrabajadores: TLabel;
    lblTrabajadoresHasta: TLabel;
    lblVendedor: TLabel;
    lblMasa: TLabel;
    lblMasaHasta: TLabel;
    lblDJAdeudadas: TLabel;
    lblDJAdeudadasHasta: TLabel;
    lblCantidadObservaciones: TLabel;
    lblCantidadObservacionesHasta: TLabel;
    lblObservado: TLabel;
    lblEstadoCuenta: TLabel;
    lblEstadoCuentaHasta: TLabel;
    lblPrima: TLabel;
    lblPrimaHasta: TLabel;
    fraCondicionSUSS: TfraCodigoDescripcion;
    edtCuits: TEdit;
    fraHolding: TfraCodigoDescripcion;
    edtTrabajadoresDesde: TPatternEdit;
    edtTrabajadoresHasta: TPatternEdit;
    fraEjecutivo: TfraCodigoDescripcion;
    fraVendedor: TfraCodigoDescripcion;
    edtMasaDesde: TPatternEdit;
    edtMasaHasta: TPatternEdit;
    edtDJAdeudadasDesde: TPatternEdit;
    edtDJAdeudadasHasta: TPatternEdit;
    edtCantidadObservacionesDesde: TPatternEdit;
    edtCantObservacionesHasta: TPatternEdit;
    edtObservado: TfraCodigoDescripcion;
    edtEstadoCuentaDesde: TPatternEdit;
    edtEstadoCuentaHasta: TPatternEdit;
    edtPrimaDesde: TPatternEdit;
    edtPrimaHasta: TPatternEdit;
    tbDesdeArchivo: TToolBar;
    tbAbrirArchivo: TToolButton;
    pnOpciones: TPanel;
    gbPeriodos: TGroupBox;
    StaticText1: TStaticText;
    chkEmpresasSinPresentacionPeriodo: TCheckBox;
    chkEmpresasSinEmisionRealPeriodo: TCheckBox;
    chkConObservacionesPeriodo: TCheckBox;
    chkConContratoDadoBajaPeriodo: TCheckBox;
    chkSinAsignarALoteGestion: TCheckBox;
    chkEmpresasObservacionesSalvadas: TCheckBox;
    gbGestion: TGroupBox;
    lblLote: TLabel;
    lblLoteHasta: TLabel;
    lblGestor: TLabel;
    lblTipoGestion: TLabel;
    edtGestor: TfraCodigoDescripcion;
    edtLoteDesde: TPatternEdit;
    edtLoteHasta: TPatternEdit;
    edtTipoGestion: TfraCodigoDescripcion;
    ppDesde: TPeriodoPicker;
    ppHasta: TPeriodoPicker;
    procedure btnAdministrarClick(Sender: TObject);
    procedure btnAsignarALoteClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    procedure ArmarConsultaLibre;
    procedure UtilizarCriterioDefinido;
    procedure AgregarContratosALote(AIdLote: integer);
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses unfrmAdministracionLotes, unDmEmision, unfrmAdmistracionAccionesObservaciones,
  unfrmSeleccionLotes;

{$R *.dfm}

procedure TfrmGestion.btnAdministrarClick(Sender: TObject);
begin
    with TfrmAdministracionAccionesObservaciones.Create(self) do
    try
      ShowModal;
    finally
      free;
    end;
end;

procedure TfrmGestion.btnAsignarALoteClick(Sender: TObject);
begin
  with TfrmSeleccionLote.Create(self) do
  try
     if Showmodal = mrOK then
       AgregarContratosALote(IdLoteSelecciondo);

  finally
    free;
  end;
end;


procedure TfrmGestion.AgregarContratosALote(AIdLote : integer);
begin
  //FIXME .. completar la seleccion.
end;

procedure TfrmGestion.tbRefrescarClick(Sender: TObject);
begin
  if pcCriteriosParaDefinicion.ActivePage = tsCriteriosLibres then
  	ArmarConsultaLibre
  else
  	UtilizarCriterioDefinido;
end;

procedure TfrmGestion.ArmarConsultaLibre;
begin

//  sSql := '
//  if fraCondicionSUSS.IsSelected then

end;

procedure TfrmGestion.UtilizarCriterioDefinido;
begin
//
end;

end.
