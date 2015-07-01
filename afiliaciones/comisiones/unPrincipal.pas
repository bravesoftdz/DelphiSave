unit unPrincipal;

interface       

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, ImgList, Placemnt, artSeguridad,
  Login, artDbLogin, ComCtrls, StdCtrls, ExtCtrls, XPMenu, JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton,
  unCustomPrincipal, AdvOfficeHint;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuComisiones: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuManEntidad: TMenuItem;
    mnuManVendedor: TMenuItem;
    mnuManRelacionesEntVend: TMenuItem;
    mnuManBapro: TMenuItem;
    mnuGranOrganizador: TMenuItem;
    mnuManInstitoriosenSucursales: TMenuItem;
    mnuTablas: TMenuItem;
    mnuMododeLiquidacion: TMenuItem;
    mnuCategoriadeEntidades: TMenuItem;
    mnuObjetivo: TMenuItem;
    mnuRetencionIngresosBrutos: TMenuItem;
    mnuConceptos: TMenuItem;
    mnuLiquidacion: TMenuItem;
    mnuComisionesALiquidar: TMenuItem;
    mnuConsultadeComisiones: TMenuItem;
    mnuComisionesaAprobar: TMenuItem;
    mnuPagosNoComisionables: TMenuItem;
    mnuCerrarPagos: TMenuItem;
    mnuLiqMantInstitorios: TMenuItem;
    mnuListados: TMenuItem;
    mnuCuotasNoPagadas: TMenuItem;
    mnuGeneraDBF: TMenuItem;
    mnuReportesBAPRO: TMenuItem;
    mnuEmpresasAfiliadas: TMenuItem;
    mnuListContables: TMenuItem;
    mnuListLiquidacionesExigibles: TMenuItem;
    mnuListCuentaCorriente: TMenuItem;
    mnuRetencionesIIBB: TMenuItem;
    mnuCuentaCorriente: TMenuItem;
    mnuPasajeProductor: TMenuItem;
    mnuFacturas: TMenuItem;
    procedure mnuManEntidadClick(Sender: TObject);
    procedure mnuManVendedorClick(Sender: TObject);
    procedure mnuComisionesALiquidarClick(Sender: TObject);
    procedure mnuConsultadeComisionesClick(Sender: TObject);
    procedure mnuComisionesaAprobarClick(Sender: TObject);
    procedure mnuCuotasNoPagadasClick(Sender: TObject);
    procedure mnuGeneraDBFClick(Sender: TObject);
    procedure mnuReportesBAPROClick(Sender: TObject);
    procedure mnuPagosNoComisionablesClick(Sender: TObject);
    procedure mnuManCTB_Tablas(Sender : TObject);
    procedure mnuCerrarPagosClick(Sender: TObject);
    procedure mnuEmpresasAfiliadasClick(Sender: TObject);
    procedure mnuObjetivoClick(Sender: TObject);
    procedure mnuPasajeProductorClick(Sender: TObject);
    procedure mnuManBaproClick(Sender: TObject);
    procedure mnuGranOrganizadorClick(Sender: TObject);
    procedure mnuRetencionIngresosBrutosClick(Sender: TObject);
    procedure mnuManRelacionesEntVendClick(Sender: TObject);
    procedure mnuConceptosClick(Sender: TObject);
    procedure mnuCuentaCorrienteClick(Sender: TObject);
    procedure mnuFacturasClick(Sender: TObject);
    procedure mnuListLiquidacionesExigiblesClick(Sender: TObject);
    procedure mnuListCuentaCorrienteClick(Sender: TObject);
    procedure mnuRetencionesIIBBClick(Sender: TObject);
    procedure mnuManInstitoriosenSucursalesClick(Sender: TObject);
    procedure mnuLiqMantInstitoriosClick(Sender: TObject);
  end;

  //Esto sirve para poder agregar una cadena que contenga info adicional para un DBcombo (ID)
  TCadena = Class
  private
    FCadena: String;
  public
    property Cadena: String read FCadena write FCadena;
  end;

function ToDate(Cadena: String): String;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unDmPrincipal, unManEntidad, unManVendedor, unComisionesALiquidar, unComisionesConsulta, unComisionesaAprobar,
  unfrmCuotasNoPagadas, unGeneraDBF, unRptListadosBAPRO, unPagosNoComisionables, strFuncs, unManCtbTablas,
  unComisionesCerrarPagos, unConsEntidadVendedor, unConsultaFacturas, unManObjetivos, unPasajeProductor,
  General, unManBapro, unManEntidadGranOrganizador, unManRetencionIngrBrutos, unManRelacionEntVend, unManConceptos,
  unCuentaCorriente, unLiquidacionesExigibles, unLiquidacionesNoExigibles, unListCuentaCorriente, unRetencionesIIBB,
  unLiquidacionesExigibles2, unInstitoriosSucursales, unLiquidacionMantInstitorios;

{$R *.DFM}

function ToDate(Cadena: String): String;
var
  pos: Integer;
begin
  //Cadena puede venir como 10/08/09 hh:mm:ss, y necesito solo la fecha... para evitar eso, trunco la cadena
  pos := AnsiPos(' ', Cadena);
  if pos > 0 then
    Cadena := strLeft(Cadena, Pos - 1);
  result := 'TO_DATE(''' + Cadena + ''',''dd/mm/yyyy'')';
end;

procedure TfrmPrincipal.mnuManEntidadClick(Sender: TObject);
begin
  Abrir(TfrmManEntidad, frmManEntidad, tmvMDIChild, mnuManEntidad);
end;

procedure TfrmPrincipal.mnuManVendedorClick(Sender: TObject);
begin
  Abrir(TfrmManVendedor, frmManVendedor, tmvMDIChild, mnuManVendedor);
end;

procedure TfrmPrincipal.mnuComisionesALiquidarClick(Sender: TObject);
begin
  Abrir(TfrmComisionesALiquidar, frmComisionesALiquidar, tmvMDIChild, mnuComisionesALiquidar);
end;

procedure TfrmPrincipal.mnuConsultadeComisionesClick(Sender: TObject);
begin
  Abrir(TfrmComisionesConsulta, frmComisionesConsulta, tmvMDIChild, mnuConsultadeComisiones);
end;

procedure TfrmPrincipal.mnuComisionesaAprobarClick(Sender: TObject);
begin
  Abrir(TfrmComisionesaAprobar, frmComisionesaAprobar, tmvMDIChild, mnuComisionesaAprobar);
end;

procedure TfrmPrincipal.mnuCuotasNoPagadasClick(Sender: TObject);
begin              
  Abrir(TfrmCuotasNoPagadas, frmCuotasNoPagadas, tmvModal, nil);
end;

procedure TfrmPrincipal.mnuGeneraDBFClick(Sender: TObject);
begin
  Abrir(TfrmGeneraDBF, frmGeneraDBF, tmvModal, nil);
end;

procedure TfrmPrincipal.mnuReportesBAPROClick(Sender: TObject);
begin
  with TfrmRPTListadosBAPRO.Create(Self) do
  begin
    Prepare;
    Free;
  end;
end;

procedure TfrmPrincipal.mnuPagosNoComisionablesClick(Sender: TObject);
begin
  Abrir(TfrmPagosNoComisionables, frmPagosNoComisionables, tmvMDIChild, mnuPagosNoComisionables);
end;

procedure TfrmPrincipal.mnuManCTB_Tablas(Sender: TObject);
begin
  with TfrmManCtbTablas.Create(Self) do
  begin
     MenuItem  := TMenuItem(Sender);
     Caption   := 'Mantenimiento de ' + StringReplace(MenuItem.Caption, '&', '', []);
     Clave     := MenuItem.Hint;
     FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuCerrarPagosClick(Sender: TObject);
begin
  with TfrmComisionesCerrarPagos.Create(Self) do
  try
    DoCerrarPagos;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuEmpresasAfiliadasClick(Sender: TObject);
begin
  Abrir(TfrmConsEntidadVendedor, frmConsEntidadVendedor, tmvMDIChild, mnuEmpresasAfiliadas);
end;

procedure TfrmPrincipal.mnuObjetivoClick(Sender: TObject);
begin
  Abrir(TfrmManObjetivos, frmManObjetivos, tmvMDIChild, mnuObjetivo);
end;

procedure TfrmPrincipal.mnuPasajeProductorClick(Sender: TObject);
begin
  Abrir(TfrmPasajeProductor, frmPasajeProductor, tmvMDIChild, mnuPasajeProductor);
end;

procedure TfrmPrincipal.mnuManBaproClick(Sender: TObject);
begin
  Abrir(TfrmManBapro, frmManBapro, tmvMDIChild, mnuManBapro);
end;

procedure TfrmPrincipal.mnuGranOrganizadorClick(Sender: TObject);
begin
  Abrir(TfrmManEntidadGranOrganizador, frmManEntidadGranOrganizador, tmvMDIChild, mnuGranOrganizador);
end;

procedure TfrmPrincipal.mnuRetencionIngresosBrutosClick(Sender: TObject);
begin
  Abrir(TfrmManRetencionIngrBrutos, frmManRetencionIngrBrutos, tmvMDIChild, mnuRetencionIngresosBrutos);
end;

procedure TfrmPrincipal.mnuManRelacionesEntVendClick(Sender: TObject);
begin
  Abrir(TfrmManRelacionEntVend, frmManRelacionEntVend, tmvMDIChild, mnuManRelacionesEntVend);
end;

procedure TfrmPrincipal.mnuConceptosClick(Sender: TObject);
begin
  Abrir(TfrmManConceptos, frmManConceptos, tmvMDIChild, mnuConceptos);
end;

procedure TfrmPrincipal.mnuCuentaCorrienteClick(Sender: TObject);
begin
  Abrir(TfrmCuentaCorriente, frmCuentaCorriente, tmvMDIChild, mnuCuentaCorriente);
end;

procedure TfrmPrincipal.mnuFacturasClick(Sender: TObject);
begin
  mnuFacturas.Enabled := False;
  with TfrmABMFacturas.Create(Self) do
  begin
    MenuItem := mnuFacturas;
    FormStyle := fsMDIChild;
  end;
end;

procedure TfrmPrincipal.mnuListLiquidacionesExigiblesClick(Sender: TObject);
begin
  Abrir(TfrmLiquidacionesExigibles2, frmLiquidacionesExigibles2, tmvMDIChild, mnuListLiquidacionesExigibles);
end;

procedure TfrmPrincipal.mnuListCuentaCorrienteClick(Sender: TObject);
begin
  Abrir(TfrmListCuentaCorriente, frmListCuentaCorriente, tmvMDIChild, mnuListCuentaCorriente);
end;

procedure TfrmPrincipal.mnuRetencionesIIBBClick(Sender: TObject);
begin
  Abrir(TfrmRetencionesIIBB, frmRetencionesIIBB, tmvMDIChild, mnuRetencionesIIBB);
end;

procedure TfrmPrincipal.mnuManInstitoriosenSucursalesClick(Sender: TObject);
begin
  Abrir(TfrmInstitoriosSucursales, frmInstitoriosSucursales, tmvMDIChild, mnuManInstitoriosenSucursales);
end;

procedure TfrmPrincipal.mnuLiqMantInstitoriosClick(Sender: TObject);
begin
  Abrir(TfrmLiquidacionMantInstitorios, frmLiquidacionMantInstitorios, tmvMDIChild, mnuLiqMantInstitorios);
end;

end.

