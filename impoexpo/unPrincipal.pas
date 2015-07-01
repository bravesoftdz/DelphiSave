unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Menus, ToolWin, ComCtrls, StdCtrls, ImgList,
  artSeguridad, artDbLogin, Placemnt, Login, XPMenu, SDEngine, AnsiSql, Db,
  JvBackgrounds, unCustomPrincipal, AdvOfficeHint, Dialogs, JvTrayIcon,
  JvComponent, JvCaptionButton;

type
  TfrmPrincipal = class(TfrmCustomPrincipal)
    mnuProcesos: TMenuItem;
    mnuMantenimiento: TMenuItem;
    procedure mnuManProcesosClick(Sender: TObject);
    procedure mnuExportacionClick(Sender: TObject);
    procedure mnuManArchivosExpClick(Sender: TObject);
    procedure mnuVisualizarClick(Sender: TObject);
    procedure mnuManProcesosOracleClick(Sender: TObject);
    procedure mnuManConsultasClick(Sender: TObject);
    procedure mnuMigracionesClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unDmPrincipal, unImpoExpoWizard, unManArchivosExp, CustomDlgs, unVisualizarArchivos, unManProcesosOracle,
  unManProcesos, unManConsultas, unMigraciones, unSesion, General;

{$R *.DFM}

procedure TfrmPrincipal.mnuManProcesosClick(Sender: TObject);
begin
  TfrmManProcesos.Create(Self);
end;

procedure TfrmPrincipal.mnuExportacionClick(Sender: TObject);
begin
  with TfrmImpoExpoWizard.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.mnuManArchivosExpClick(Sender: TObject);
begin
  with TfrmManArchivosExp.Create(Self) do
    FormStyle := fsMDIChild;
end;

procedure TfrmPrincipal.mnuVisualizarClick(Sender: TObject);
begin
  TfrmVisualizarArchivos.Create(Self);
end;

procedure TfrmPrincipal.mnuManProcesosOracleClick(Sender: TObject);
begin
  with TfrmManProcesosOracle.Create(Self) do
    FormStyle := fsMDIChild;
end;

procedure TfrmPrincipal.mnuManConsultasClick(Sender: TObject);
begin
  with TfrmManConsultas.Create(Self) do
    FormStyle := fsMDIChild;
end;

procedure TfrmPrincipal.mnuMigracionesClick(Sender: TObject);
begin
  Verificar(Sesion.Sector <> 'COMPUTOS', nil, 'Solo los usuarios de Sistemas pueden migrar procesos');
  with TfrmMigraciones.Create(Self) do
    FormStyle := fsMDIChild;
end;

end.

