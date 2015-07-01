unit unPrincipal;

interface

uses
  {$IFDEF VER150} Placemnt, {$ELSE} rxPlacemnt, {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomPrincipal, AdvOfficeHint, JvBackgrounds, JvTrayIcon,
  JvComponent, JvCaptionButton, artSeguridad, Login, artDbLogin, Menus,
  ImgList, XPMenu, ComCtrls, JvComponentBase;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuInversiones: TMenuItem;
    mnuInvMantenimiento: TMenuItem;
    mnuInvMantTiposInstrumento: TMenuItem;
    mnuInvMantTiposOperac: TMenuItem;
    mnuInstrumentos: TMenuItem;
    mnuInstrConsultar: TMenuItem;
    mnuInvMantTasasRef: TMenuItem;
    mnuCotizaciones: TMenuItem;
    mnuInvReportes: TMenuItem;
    mnuInvRepMinutas: TMenuItem;
    mnuInvMantAutorizaciones: TMenuItem;
    mnuInvMonedas: TMenuItem;
    mnuInvMantPerContables: TMenuItem;
    mnuInvMantInstituciones: TMenuItem;
    mnuInvRepCarteraRes: TMenuItem;
    mnuInstrPlazoFijo: TMenuItem;
    mnuInstrOperacionesyResultados: TMenuItem;
    mnuInvMantEmisor: TMenuItem;
    mnuInvMantFiduciario: TMenuItem;
    mnuInstrEnAnalisis: TMenuItem;
    mnuInvMantTipo: TMenuItem;
    mnuInvMantGrupo: TMenuItem;
    mnuInvReAsientosContabilizar: TMenuItem;
    mnuInvRepCartera: TMenuItem;
    mnuInvRepCarteraAltas: TMenuItem;
    mnuInvRepCarteraBajas: TMenuItem;
    mnuInvRepCarteraTenencias: TMenuItem;
    mnuInvRepCarteraPlazosFijos: TMenuItem;
    procedure mnuInvMantTiposInstrumentoClick(Sender: TObject);
    procedure mnuInvMantTiposOperacClick(Sender: TObject);
    procedure mnuInstrConsultarClick(Sender: TObject);
    procedure mnuInvMantTasasRefClick(Sender: TObject);
    procedure mnuCotizacionesClick(Sender: TObject);
    procedure mnuInvRepMinutasClick(Sender: TObject);
    procedure mnuInvMantAutorizacionesClick(Sender: TObject);
    procedure mnuInvMonedasClick(Sender: TObject);
    procedure mnuInvMantPerContablesClick(Sender: TObject);
    procedure mnuInvMantInstitucionesClick(Sender: TObject);
    procedure mnuInvRepCarteraResClick(Sender: TObject);
    procedure mnuInstrPlazoFijoClick(Sender: TObject);
    procedure mnuInstrOperacionesyResultadosClick(Sender: TObject);
    procedure mnuInvMantEmisorClick(Sender: TObject);
    procedure mnuInvMantFiduciarioClick(Sender: TObject);
    procedure mnuInstrEnAnalisisClick(Sender: TObject);
    procedure mnuInvMantTipoClick(Sender: TObject);
    procedure mnuInvMantGrupoClick(Sender: TObject);
    procedure mnuInvReAsientosContabilizarClick(Sender: TObject);
    procedure mnuInvRepCarteraAltasClick(Sender: TObject);
    procedure mnuInvRepCarteraBajasClick(Sender: TObject);
    procedure mnuInvRepCarteraTenenciasClick(Sender: TObject);
    procedure mnuInvRepCarteraPlazosFijosClick(Sender: TObject);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  General, unInvTiposInstrumento, unInvTiposOperacion, unInvConsultarInstrumentos,
  unInvConsultarTasasReferencia, unInvConsultarCotizaciones, unInvReporteMinuta,
  unInvAutorizaciones, unInvMonedas, unInvPeriodosContables, unInvInstituciones,
  unInvReporteResumenCartera, unInvConsultarPlazoFijo, unInvConsultarOperacionesResultados,
  unInvEmisores, unInvFiduciarios, unInvInstrumentoAnalisis, unManCtbTablas,
  unInvRptAsientosContabilizar, CustomDlgs, unInvRptAltasCartera,
  unInvRptBajasCartera, unInvRptTenenciasCartera, unInvRptPlazosFijosCartera,
  unArt;

procedure TfrmPrincipal.mnuInvMantTiposInstrumentoClick(Sender: TObject);
begin
  Abrir(TfrmInvTiposInstrumento, frmInvTiposInstrumento, tmvMDIChild, mnuInvMantTiposInstrumento);
end;

procedure TfrmPrincipal.mnuInvMantTiposOperacClick(Sender: TObject);
begin
  Abrir(TfrmInvTiposOperacion, frmInvTiposOperacion, tmvMDIChild, mnuInvMantTiposOperac);
end;

procedure TfrmPrincipal.mnuInstrConsultarClick(Sender: TObject);
begin
  Abrir(TfrmInvConsultarInstrumentos, frmInvConsultarInstrumentos, tmvMDIChild, mnuInstrConsultar);
end;

procedure TfrmPrincipal.mnuInvMantTasasRefClick(Sender: TObject);
begin
  Abrir(TfrmInvConsultarTasasReferencia, frmInvConsultarTasasReferencia, tmvMDIChild, mnuInvMantTasasRef);
end;

procedure TfrmPrincipal.mnuCotizacionesClick(Sender: TObject);
begin
  Abrir(TfrmInvConsultarCotizaciones, frmInvConsultarCotizaciones, tmvMDIChild, mnuCotizaciones);
end;

procedure TfrmPrincipal.mnuInvReAsientosContabilizarClick(Sender: TObject);
var
  dFechaContable: TDateTime;
begin
  dFechaContable := InputBoxDate('Asientos a Contabilizar', 'Fecha Contable:', 0);

  if dFechaContable > 0 then
    begin
      DoImprimirAsientoAContabilizar('O', '', dFechaContable, ART_EMPTY_ID);
      DoImprimirAsientoAContabilizar('R', '', dFechaContable, ART_EMPTY_ID);
    end;
end;

procedure TfrmPrincipal.mnuInvRepMinutasClick(Sender: TObject);
begin
  Abrir(TfrmInvReporteMinuta, frmInvReporteMinuta, tmvModal, mnuInvRepMinutas);
end;

procedure TfrmPrincipal.mnuInvMantAutorizacionesClick(Sender: TObject);
begin
  Abrir(TfrmInvAutorizaciones, frmInvAutorizaciones, tmvMDIChild, mnuInvMantAutorizaciones);
end;

procedure TfrmPrincipal.mnuInvMonedasClick(Sender: TObject);
begin
  Abrir(TfrmInvMonedas, frmInvMonedas, tmvMDIChild, mnuInvMonedas);
end;

procedure TfrmPrincipal.mnuInvMantPerContablesClick(Sender: TObject);
begin
  Abrir(TfrmInvPeriodosContables, frmInvPeriodosContables, tmvMDIChild, mnuInvMantPerContables);
end;

procedure TfrmPrincipal.mnuInvMantInstitucionesClick(Sender: TObject);
begin
  Abrir(TfrmInvInstituciones, frmInvInstituciones, tmvMDIChild, mnuInvMantInstituciones);
end;

procedure TfrmPrincipal.mnuInvRepCarteraAltasClick(Sender: TObject);
begin
  Abrir(TfrmInvRptAltasCartera, frmInvRptAltasCartera, tmvModal, mnuInvRepCarteraAltas);
end;

procedure TfrmPrincipal.mnuInvRepCarteraBajasClick(Sender: TObject);
begin
  Abrir(TfrmInvRptBajasCartera, frmInvRptBajasCartera, tmvModal, mnuInvRepCarteraBajas);
end;

procedure TfrmPrincipal.mnuInvRepCarteraPlazosFijosClick(Sender: TObject);
begin
  Abrir(TfrmInvRptPlazosFijosCartera, frmInvRptPlazosFijosCartera, tmvModal, mnuInvRepCarteraPlazosFijos);
end;

procedure TfrmPrincipal.mnuInvRepCarteraResClick(Sender: TObject);
begin
  Abrir(TfrmInvReporteResumenCartera, frmInvReporteResumenCartera, tmvModal, mnuInvRepCarteraRes);
end;

procedure TfrmPrincipal.mnuInvRepCarteraTenenciasClick(Sender: TObject);
begin
  Abrir(TfrmInvRptTenenciasCartera, frmInvRptTenenciasCartera, tmvModal, mnuInvRepCarteraTenencias);
end;

procedure TfrmPrincipal.mnuInstrPlazoFijoClick(Sender: TObject);
begin
  Abrir(TfrmInvConsultarPlazoFijo, frmInvConsultarPlazoFijo, tmvMDIChild, mnuInstrPlazoFijo);
end;

procedure TfrmPrincipal.mnuInstrOperacionesyResultadosClick(Sender: TObject);
begin
  Abrir(TfrmInvConsultarOperacionesResultados, frmInvConsultarOperacionesResultados, tmvMDIChild, mnuInstrOperacionesyResultados);
end;

procedure TfrmPrincipal.mnuInvMantEmisorClick(Sender: TObject);
begin
  Abrir(TfrmInvEmisores, frmInvEmisores, tmvMDIChild, mnuInvMantEmisor);
end;

procedure TfrmPrincipal.mnuInvMantFiduciarioClick(Sender: TObject);
begin
  Abrir(TfrmInvFiduciarios, frmInvFiduciarios, tmvMDIChild, mnuInvMantFiduciario);
end;

procedure TfrmPrincipal.mnuInvMantTipoClick(Sender: TObject);
begin
  with TfrmManCtbTablas.Create(Self) do
    begin
      MenuItem  := TMenuItem(Sender);
      FormStyle := fsMDIChild;
      Clave     := 'ITIPO';
      Caption   := 'Mantenimiento de Tipos';
    end;
end;

procedure TfrmPrincipal.mnuInvMantGrupoClick(Sender: TObject);
begin
  with TfrmManCtbTablas.Create(Self) do
    begin
      MenuItem  := TMenuItem(Sender);
      FormStyle := fsMDIChild;
      Clave     := 'IGRUP';
      Caption   := 'Mantenimiento de Grupos';
    end;
end;

procedure TfrmPrincipal.mnuInstrEnAnalisisClick(Sender: TObject);
begin
  Abrir(TfrmInvInstrumentoAnalisis, frmInvInstrumentoAnalisis, tmvMDIChild, mnuInstrEnAnalisis);
end;

end.

