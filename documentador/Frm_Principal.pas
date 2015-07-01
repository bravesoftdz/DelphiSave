unit Frm_Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ToolWin, ComCtrls, StdCtrls, ImgList, ActnList, ExtCtrls, RXCtrls,
  Placemnt;


type
  TPrincipal = class(TForm)
    cMnu_Principal: TMainMenu;
    Mnu_Salir: TMenuItem;
    Sb_BarraDeEstado: TStatusBar;
    Tbar_BarraDeHerramientas: TToolBar;
    ImagenesBarraDeHerramientas: TImageList;
    Tb_Salir: TToolButton;
    Mnu_Ventana: TMenuItem;
    Mnu_Maximizar: TMenuItem;
    Mnu_Restaurar: TMenuItem;
    Mnu_Minimizar: TMenuItem;
    N1: TMenuItem;
    Mnu_Cascada: TMenuItem;
    Mnu_MosaicoHorizontal: TMenuItem;
    Mnu_MosaicoVertical: TMenuItem;
    Mnu_OrganizarIconos: TMenuItem;
    Mnu_Editores: TMenuItem;
    Tb_Explorar: TToolButton;
    ToolButton1: TToolButton;
    Mnu_ExploradordeDatos: TMenuItem;
    Mnu_DocTablas: TMenuItem;
    Mnu_Consultas: TMenuItem;
    N2: TMenuItem;
    Mnu_Documentadores: TMenuItem;
    Mnu_DocObjetos: TMenuItem;
    FormPlacement1: TFormPlacement;
    Tb_Sql: TToolButton;
    ilColor: TImageList;
    ilByN: TImageList;
    tbCompile: TToolButton;
    procedure Mnu_SalirClick(Sender: TObject);
    procedure Tb_SalirClick(Sender: TObject);
    procedure Mnu_MaximizarClick(Sender: TObject);
    procedure Mnu_RestaurarClick(Sender: TObject);
    procedure Mnu_MinimizarClick(Sender: TObject);
    procedure Mnu_CascadaClick(Sender: TObject);
    procedure Mnu_MosaicoHorizontalClick(Sender: TObject);
    procedure Mnu_MosaicoVerticalClick(Sender: TObject);
    procedure Mnu_OrganizarIconosClick(Sender: TObject);
    procedure Mnu_ExploradordeDatosClick(Sender: TObject);
    procedure Mnu_DocTablasClick(Sender: TObject);
    procedure Tb_ExplorarClick(Sender: TObject);
    procedure Mnu_ConsultasClick(Sender: TObject);
    procedure Mnu_DocObjetosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbCompileClick(Sender: TObject);
//    procedure FormCreate(Sender: TObject);
  private
  public
    procedure MostrarEstado(const Parrafo: string);
  end;

var
  Principal: TPrincipal;

implementation

uses BaseDeDatos, Frm_Esrtructura, Frm_DocumTabla, Registros,
  Frm_Consulta, Frm_DocObjetos, General, unCompileSchemas;

{$R *.DFM}

procedure TPrincipal.Mnu_SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TPrincipal.MostrarEstado(const Parrafo: string);
begin
  Sb_BarraDeEstado.SimpleText := Parrafo;
  Sb_BarraDeEstado.Refresh;
end;

procedure TPrincipal.Tb_SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TPrincipal.Mnu_MaximizarClick(Sender: TObject);
begin
  Principal.WindowState := wsMaximized;
end;

procedure TPrincipal.Mnu_RestaurarClick(Sender: TObject);
begin
  Principal.WindowState := wsNormal;
end;

procedure TPrincipal.Mnu_MinimizarClick(Sender: TObject);
begin
  Principal.WindowState := wsMinimized;
end;

procedure TPrincipal.Mnu_CascadaClick(Sender: TObject);
begin
  Principal.Cascade;
end;

procedure TPrincipal.Mnu_MosaicoHorizontalClick(Sender: TObject);
begin
  Principal.TileMode := tbHorizontal;
  Principal.Tile;
end;

procedure TPrincipal.Mnu_MosaicoVerticalClick(Sender: TObject);
begin
  Principal.TileMode := tbVertical;
  Principal.Tile;

end;

procedure TPrincipal.Mnu_OrganizarIconosClick(Sender: TObject);
begin
  Principal.ArrangeIcons;
end;

procedure TPrincipal.Mnu_ExploradordeDatosClick(Sender: TObject);
var
  Frm_Estructura: TFrm_Estructura;
begin
  Frm_Estructura := TFrm_Estructura.Create(Self);
  Frm_Estructura.Show;
end;

procedure TPrincipal.Mnu_DocTablasClick(Sender: TObject);
begin
  TFrm_DocTabla.Create(Self.Parent);
end;

procedure TPrincipal.Tb_ExplorarClick(Sender: TObject);
begin
  Mnu_ExploradordeDatosClick(Sender);
end;

procedure TPrincipal.Mnu_ConsultasClick(Sender: TObject);
var
  Frm_Consultas: TFrm_Consultas;
begin
  Frm_Consultas := TFrm_Consultas.Create(Self.Parent);
  Frm_Consultas.Show;
end;


procedure TPrincipal.Mnu_DocObjetosClick(Sender: TObject);
var
  Frm_DocObjetos: TFrm_DocObjects;
begin
  Frm_DocObjetos := TFrm_DocObjects.Create(Self.Parent);
  Frm_DocObjetos.Show;
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  AlinearMenu(Self.cMnu_Principal, Mnu_Salir, 1);
  Caption := Caption + ' - ' + BaseDeDatos.DM_BaseDeDatos.Usuario +
    '@' + BasedeDatos.DM_BaseDeDatos.BaseDeDatos.RemoteDatabase;
  MostrarEstado('Conectado a ' +
    BasedeDatos.DM_BaseDeDatos.BaseDeDatos.RemoteDatabase);
end;

procedure TPrincipal.tbCompileClick(Sender: TObject);
begin
  with TfrmCompInvalid.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
