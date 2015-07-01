unit unPrincipal;

{********************************************************}
{                                                        }
{    Sistema de Fax - Menú Principal                     }
{                                                        }
{    Autor: Federico Firenze                             }
{    Fecha:  10/2003                                     }
{                                                        }
{********************************************************}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ImgList, Placemnt, artSeguridad, Login,
  artDbLogin, Menus, ComCtrls, ActnList, StdCtrls, JvBackgrounds, JvTrayIcon, JvComponent, JvCaptionButton, XPMenu;

procedure MostrarEstado(const Parrafo: String);

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
    ilSingleImages: TImageList;
    ilColor: TImageList;
    ilByN: TImageList;
    Consulta1: TMenuItem;
    Mantenimiento1: TMenuItem;
    Formularios1: TMenuItem;
    FormulariosporUsuario1: TMenuItem;
    ActionList: TActionList;
    actConsFaxes: TAction;
    ActManFormulario: TAction;
    ActManFormularioUsuario: TAction;
    XPMenu: TXPMenu;
    JvCaptionButton: TJvCaptionButton;
    JvTrayIcon: TJvTrayIcon;
    JvBackground: TJvBackground;
    N1: TMenuItem;
    PrintDialog: TPrintDialog;
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
    procedure actConsFaxesExecute(Sender: TObject);
    procedure ActManFormularioExecute(Sender: TObject);
    procedure ActManFormularioUsuarioExecute(Sender: TObject);
    procedure mnuAfiConfigurarImpresoraClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  unDmPrincipal, unCustomConsulta, unConsFax, unManFFO_FAXFORMULARIO, unManFFU_FORMULARIOUSUARIO, unCITRIX;

{$R *.DFM}

procedure MostrarEstado(const Parrafo: String);
begin
  frmPrincipal.sbEstado.SimpleText := Parrafo;
end;

procedure TfrmPrincipal.mnuSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.mnuMaximizarClick(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmPrincipal.mnuRestaurarClick(Sender: TObject);
begin
  WindowState := wsNormal;
end;

procedure TfrmPrincipal.mnuMinimizarClick(Sender: TObject);
begin
  WindowState := wsMinimized;
end;

procedure TfrmPrincipal.mnuCascadaClick(Sender: TObject);
begin
  Cascade;
end;

procedure TfrmPrincipal.mnuMosaicoHorizontalClick(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TfrmPrincipal.mnuMosaicoVerticalClick(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TfrmPrincipal.mnuOrganizarIconosClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Caption := Application.Title + ' - ' + dbLogin.Usuario;

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

  IMG_FILTROS_SHOW := 10;
  IMG_FILTROS_HIDE := 11;

  EjecutarSql('INSERT INTO FFO_FAXFORMULARIO ' +
              '(FO_ID, FO_DESCRIPCION, FO_USUALTA) ' +
              'SELECT DISTINCT FE_IDFORMULARIO, ''Formulario Nº '' || FE_IDFORMULARIO, ''AUTO'' ' +
                'FROM FFE_FAXENTRANTES ' +
               'WHERE NOT EXISTS (SELECT 1 ' +
                                   'FROM FFO_FAXFORMULARIO ' +
                                  'WHERE FO_ID = FE_IDFORMULARIO)');

  if IsCITRIX then
  begin
    XPMenu.Active := False;
    JvBackground.Image.Picture.Assign(nil);
    JvCaptionButton.Visible := False;
    Color := clBtnFace;
  end;
end;

procedure TfrmPrincipal.DBLoginLogin(Sender: TObject);
begin
  Seguridad.Ejecutar;
end;

procedure TfrmPrincipal.actConsFaxesExecute(Sender: TObject);
begin
  TfrmConsFax.Create(Self);
end;

procedure TfrmPrincipal.ActManFormularioExecute(Sender: TObject);
begin
  TfrmManFFO_FAXFORMULARIO.Create(Self);
  ActManFormulario.Enabled := False;
end;

procedure TfrmPrincipal.ActManFormularioUsuarioExecute(Sender: TObject);
begin
  TfrmManFFU_FORMULARIOUSUARIO.Create(Self);
  ActManFormularioUsuario.Enabled := False;
end;

procedure TfrmPrincipal.mnuAfiConfigurarImpresoraClick(Sender: TObject);
begin
	PrintDialog.Execute;
end;

end.
