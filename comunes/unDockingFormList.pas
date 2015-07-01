unit unDockingFormList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvgCaption, JvDockControlForm, JvDockVIDStyle, JvDockVSNetStyle,
  JvComponent, StdCtrls, JvgListBox, JvgGroupBox, Menus, JvMenus, JvHint,
  ImgList, DB, SDEngine;

type
  TfrmDockingFormList = class(TForm)
    gb: TJvgGroupBox;
    glList: TJvgListBox;
    DockClient: TJvDockClient;
    DockStyle: TJvDockVSNetStyle;
    FrCaption: TJvgCaption;
    sdqConsulta: TSDQuery;
    ilListaItems: TImageList;
    HintDisplay: TJvHint;
    PopUpMenu: TJvPopupMenu;
    ilListaPopUp: TImageList;
    Eliminar1: TMenuItem;
    Ordenar1: TMenuItem;
    N1: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure gbCollapsed(Sender: TObject);
  private
    procedure Resize;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDockingFormList: TfrmDockingFormList;

implementation

{$R *.dfm}

procedure TfrmDockingFormList.FormResize(Sender: TObject);
begin
    Resize;
end;

procedure TfrmDockingFormList.Resize;
begin
  if Trunc(self.Height * (266 / 300)) = glList.Height then  glList.Height := Trunc(self.Height * (266 / 300));
//  if Trunc(self.Width * (292 / 300)) = glList.Width then  glList.Width := Trunc(self.Width * (292 / 300));
end;

procedure TfrmDockingFormList.gbCollapsed(Sender: TObject);
begin
  self.Height := glList.Height;
//  self.Width := glList.Width;
end;

end.
