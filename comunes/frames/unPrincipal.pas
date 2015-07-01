unit unPrincipal;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ImgList, Placemnt, artSeguridad, Login, artDbLogin, ComCtrls,
  StdCtrls, unArtFrame;

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    mnuSalir: TMenuItem;
    sbEstado: TStatusBar;
    mnuVentana: TMenuItem;
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
    ilImagenes: TImageList;
    ilColor: TImageList;
    ilByN: TImageList;
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
  private
  public
  end;

procedure MostrarEstado (Const Parrafo : String);

var
  frmPrincipal: TfrmPrincipal;

implementation

uses unDmPrincipal;

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

  Caption := Application.Title + ' - ' + DBLogin.Usuario ;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmPrincipal.DBLoginLogin(Sender: TObject);
begin
  Seguridad.Ejecutar ;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
