unit unPrincipal;

interface

Uses
  {$IFDEF TRON}
  AppTron,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ToolWin, ComCtrls, StdCtrls, ImgList, artSeguridad, artDbLogin, General, shellapi,
  DisplaySet, Placemnt, Login, ExtCtrls, Mask, ToolEdit;

  Procedure MostrarEstado (Const Parrafo : String);

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    mnuSalir: TMenuItem;
    sbEstado: TStatusBar;
    Mnu_Ventana: TMenuItem;
    mnuMaximizar: TMenuItem;
    mnuRestaurar: TMenuItem;
    mnuMinimizar: TMenuItem;
    sep1: TMenuItem;
    mnuCascada: TMenuItem;
    mnuMosaicoHorizontal: TMenuItem;
    mnuMosaicoVertical: TMenuItem;
    mnuOrganizarIconos: TMenuItem;
    DBLogin: TDBLogin;
    Seguridad: TSeguridad;
    FormPlacement: TFormPlacement;
    mnuBolInterdepositos: TMenuItem;
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
    ilSingleImages: TImageList;
    ilColor: TImageList;
    ilByN: TImageList;
    Afiliaciones: TMenuItem;
    mnuManCarta: TMenuItem;
    mnuManFirmante: TMenuItem;
    mnuManTexto: TMenuItem;
    mnuMantenimientoGral: TMenuItem;
    mnuOperacionSTR: TMenuItem;
    mnuHolding: TMenuItem;
    mnuTablas: TMenuItem;
    mnuTablaGral: TMenuItem;
    mnuManCartaArea: TMenuItem;
    mnuManCTB_CODRE: TMenuItem;
    mnuTraspasoIngreso: TMenuItem;
    mnuAdministracindeContrato: TMenuItem;
    mnuModificacionContrato: TMenuItem;
    mnuAdminCartas: TMenuItem;
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
    mnuManDelegaciones: TMenuItem;
    mnuConsultaContrato: TMenuItem;
    mnuNotasSRT: TMenuItem;
    mnuConfirmacionEndosos: TMenuItem;
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
    procedure mnuBolInterdepositosClick(Sender: TObject);
    procedure mnuCargadeSolicitudesClick(Sender: TObject);
    procedure mnuModificaciondeSolicitudesClick(Sender: TObject);
    procedure mnuManCtbTablas(Sender: TObject);
    procedure mnuManFirmanteClick(Sender: TObject);
    procedure mnuManTextoClick(Sender: TObject);
    procedure mnuManCartaAreaClick(Sender: TObject);
    procedure mnuManCTB_CODREClick(Sender: TObject);
    procedure mnuTraspasoIngresoClick(Sender: TObject);
    procedure mnuCodigoRecepcionClick(Sender: TObject);
    procedure mnuARTClick(Sender: TObject);
    procedure mnuAdminCartasClick(Sender: TObject);
    procedure mnuTesoValAdministracionClick(Sender: TObject);
    procedure mnuAprobaciondeSolicitudesClick(Sender: TObject);
    procedure mnuModificacionContratoClick(Sender: TObject);
    procedure mnuConsultaContratoClick(Sender: TObject);
    procedure mnuManDelegacionesClick(Sender: TObject);
    procedure mnuManEjecutivoDeCuentaClick(Sender: TObject);
    procedure mnuManGestorDeCuentaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure mnuNotasSRTClick(Sender: TObject);
    procedure mnuConfirmacionEndososClick(Sender: TObject);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;
  {$IFDEF TRON}
  ApplicatioTron : TAppTron;
  {$ENDIF}

implementation

uses unDmPrincipal, AnsiSQL, unBolInterDep,
  unCargaSolicitud, unModificacionSolicitud, unManCFI_FIRMA,
  unManCTC_TEXTOCARTA, unManCtbTablas, unManCAT_AREATEXTO, unManCTB_CODRE,
  unTraspasos, unART, unManART, unManCCA_CARTA, unAprobacionSolicitud,
  unModificaContrato, unManAGC_GESTORCUENTA, unManAEC_EJECUTIVOCUENTA,
  unManDEL_DELEGACION, unContratoConsultaEndoso, unContratoVendedor
  , Auxiliar, unNotaSRT, unConfirmaTarifa
  {, unValAdministracion};

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
Procedure MostrarEstado (Const Parrafo : String);
begin
  frmPrincipal.sbEstado.SimpleText := Parrafo;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuMaximizarClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuRestaurarClick(Sender: TObject);
begin
  WindowState := wsNormal;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuMinimizarClick(Sender: TObject);
begin
  WindowState := wsMinimized;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuCascadaClick(Sender: TObject);
begin
  Cascade;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuMosaicoHorizontalClick(Sender: TObject);
begin
  TileMode  := tbHorizontal;
  Tile;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuMosaicoVerticalClick(Sender: TObject);
begin
  TileMode  := tbVertical;
  Tile;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuOrganizarIconosClick(Sender: TObject);
begin
  ArrangeIcons ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Caption           := Application.Title + ' - ' + dbLogin.Usuario;

  //Setea los Formatos de la Configuración Regional para la Aplicación
  Application.UpdateFormatSettings := False;
  CurrencyString    := '$';
  DecimalSeparator  := ',';
  ThousandSeparator := '.';
  DateSeparator     := '/';
  TimeSeparator     := ':';
  ShortTimeFormat   := 'H:mm:ss';
  LongTimeFormat    := 'H:mm:ss';
  ShortDateFormat   := 'dd/mm/yyyy';

  {$IFDEF TRON}
  ApplicatioTron :=  TAppTron.Create;
  {$ENDIF}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.DBLoginLogin(Sender: TObject);
begin
  Seguridad.Ejecutar ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuCargadeSolicitudesClick(Sender: TObject);
begin
  if not Assigned( frmCargaSolicitudes ) then begin
     frmCargaSolicitudes := TfrmCargaSolicitudes.Create( Self );
     frmCargaSolicitudes.Show;
  end else begin
     frmCargaSolicitudes.Show;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuModificaciondeSolicitudesClick(Sender: TObject);
begin
  if not Assigned( frmModificacionSolicitud ) then
     frmModificacionSolicitud := TfrmModificacionSolicitud.Create( Self );

  frmModificacionSolicitud.Show;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManCtbTablas(Sender: TObject);
begin
  With TfrmManCtbTablas.Create( Self ) do begin
     MenuItem      := TMenuItem( Sender );
     Caption       := 'Mantenimiento de ' + StringReplace(MenuItem.Caption, '&', '', []);
     Clave         := MenuItem.Hint;
     FormStyle     := fsMDIChild;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuBolInterdepositosClick( Sender: TObject);
begin
  TfrmBolInterDep.Create( Self );
  mnuBolInterdepositos.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManFirmanteClick(Sender: TObject);
begin
  TfrmManCFI_FIRMA.Create( Self );
  mnuManFirmante.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManTextoClick(Sender: TObject);
begin
  TfrmManCTC_TEXTOCARTA.Create( Self );
  mnuManTexto.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManCartaAreaClick(Sender: TObject);
begin
  TfrmManCAT_AREATEXTO.Create( Self );
  mnuManCartaArea.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManCTB_CODREClick(Sender: TObject);
begin
  With TfrmManCTB_CODRE.Create( Self ) do begin
     MenuItem      := TMenuItem( Sender );
     FormStyle     := fsMDIChild;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuTraspasoIngresoClick(Sender: TObject);
begin
     TfrmTraspasos.Create( Self );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuCodigoRecepcionClick(Sender: TObject);
begin
//
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuARTClick(Sender: TObject);
begin
     TfrmManAAR_ART.Create( Self );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuAdminCartasClick(Sender: TObject);
begin
  TfrmAfiAdministracionCartas.Create( Self );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuTesoValAdministracionClick(Sender: TObject);
begin
{
  TfrmValAdministracion.Create( Self );
  mnuTesoValAdministracion.Enabled := False;
}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuAprobaciondeSolicitudesClick(Sender: TObject);
begin
  TfrmAprobacionSolicitud.Create(Self);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuModificacionContratoClick(Sender: TObject);
begin
//  with TfrmModificacionContrato.Create(Self) do
//    try
//      if DoCargarDatos(0, fsModificar) then
//        ShowModal;
//    finally
//      Free;
//    end;
  with TfrmModificacionContrato.Create(Self) do
    DoCargarDatos(0, fsModificar);
  mnuModificacionContrato.Enabled := false;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuConsultaContratoClick(Sender: TObject);
begin
//  with TfrmContratoBuscaEndoso.Create(Self) do
//    try
//      ShowModal;
//    finally
//      Free;
//    end;
  TfrmContratoBuscaEndoso.Create(Self);
  mnuConsultaContrato.Enabled := false;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManDelegacionesClick(Sender: TObject);
begin
  TfrmManDEL_DELEGACION.Create( Self );
  mnuManDelegaciones.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManEjecutivoDeCuentaClick(Sender: TObject);
begin
  TfrmManAEC_EJECUTIVOCUENTA.Create( Self );
  mnuManEjecutivoDeCuenta.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuManGestorDeCuentaClick(Sender: TObject);
begin
  TfrmManAGC_GESTORCUENTA.Create( Self );
  mnuManGestorDeCuenta.Enabled := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuNotasSRTClick(Sender: TObject);
begin
  TfrmNotaSRT.Create(Self);
  mnuNotasSRT.Enabled := false;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.mnuConfirmacionEndososClick(
  Sender: TObject);
begin
  TfrmConfirmaTarifa.Create(Application);
  mnuConfirmacionEndosos.Enabled := false;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  {$IFDEF TRON}
  ApplicatioTron.Free;
  {$ENDIF}
end;
{----------------------------------------------------------------------------------------------------------------------}
end.

