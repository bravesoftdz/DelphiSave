unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomPrincipal, AdvOfficeHint, JvBackgrounds, JvTrayIcon,
  JvComponent, JvCaptionButton, artSeguridad, Login, artDbLogin, Menus,
  ImgList, XPMenu, Placemnt, ComCtrls;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuPresupuesto: TMenuItem;
    mnuPresAdministracion: TMenuItem;
    mnuConcAdministracion: TMenuItem;
    mnuPresDetalle: TMenuItem;
    mnuPresConsulta: TMenuItem;
    mnuMantenimiento: TMenuItem;
    mnuPresCartera: TMenuItem;
    mnuPresRRHH: TMenuItem;
    procedure mnuPresAdministracionClick(Sender: TObject);
    procedure mnuConcAdministracionClick(Sender: TObject);
    procedure mnuPresDetalleClick(Sender: TObject);
    procedure mnuPresConsultaClick(Sender: TObject);
    procedure mnuPresCarteraClick(Sender: TObject);
    procedure mnuPresRRHHClick(Sender: TObject);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  General, unAdministracionConceptos, unAdministracionPresupuestos, unDetallePresupuesto,
  unConsultaPresupuesto, unPresupuestoCartera, unPresupuestoRRHH;

procedure TfrmPrincipal.mnuPresAdministracionClick(Sender: TObject);
begin
  Abrir(TfrmAdministracionPresupuestos, frmAdministracionPresupuestos, tmvMDIChild, mnuPresAdministracion);
end;

procedure TfrmPrincipal.mnuConcAdministracionClick(Sender: TObject);
begin
  Abrir(TfrmAdministracionConceptos, frmAdministracionConceptos, tmvMDIChild, mnuConcAdministracion);
end;

procedure TfrmPrincipal.mnuPresDetalleClick(Sender: TObject);
begin
  Abrir(TfrmDetallePresupuesto, frmDetallePresupuesto, tmvMDIChild, mnuPresDetalle);
end;

procedure TfrmPrincipal.mnuPresConsultaClick(Sender: TObject);
begin
  Abrir(TfrmConsultaPresupuesto, frmConsultaPresupuesto, tmvMDIChild, mnuPresConsulta);
end;

procedure TfrmPrincipal.mnuPresCarteraClick(Sender: TObject);
begin
  Abrir(TfrmPresupuestoCartera, frmPresupuestoCartera, tmvMDIChild, mnuPresCartera);
end;

procedure TfrmPrincipal.mnuPresRRHHClick(Sender: TObject);
begin
  Abrir(TfrmPresupuestoRRHH, frmPresupuestoRRHH, tmvMDIChild, mnuPresRRHH);
end;

end.

