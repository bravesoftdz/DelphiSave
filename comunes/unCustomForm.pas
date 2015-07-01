{

Formulario para herencia visual
Autor intelectual: PTavasci.
Asesor intelectual: NKuster.
}         

unit unCustomForm;

interface

uses
  {$IFNDEF VER150}
  rxPlacemnt,
  rxToolEdit,
  {$ELSE}
  Placemnt,
  ToolEdit,
  {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  XPMenu, Menus, ImgList;

type
  TfrmCustomForm = class(TForm)
    FormStorage: TFormStorage;
    XPMenu: TXPMenu;
    ilByN: TImageList;
    ilColor: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FMenuItem: TMenuItem;
    procedure SetMenuItem(const Value: TMenuItem);
    function GetFormPadre: TForm;
  protected
    procedure HideTitlebar;
  public
    procedure AfterConstruction; override;

    property MenuItem  : TMenuItem read FMenuItem write SetMenuItem;
    property FormPadre : TForm     read GetFormPadre;
  end;

var
  frmCustomForm: TfrmCustomForm;

implementation

uses
  unRTTI, General;

{$R *.DFM}
{$ASSERTIONS OFF}

procedure TfrmCustomForm.AfterConstruction;
begin
  inherited;
  XPMenu.Free;
end;

procedure TfrmCustomForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(MenuItem) then
    MenuItem.Enabled := True;
end;

procedure TfrmCustomForm.SetMenuItem(const Value: TMenuItem);
begin
  FMenuItem := Value;
  if Assigned(MenuItem) then
    MenuItem.Enabled := False;
end;

procedure TfrmCustomForm.FormCreate(Sender: TObject);
var
  i: integer;
  Value: TObject;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if ExistsProperty(Components[i], 'DataSource') then
    begin
      GetPropByName(Components[i], 'DataSource', Value);

      if (not Components[i].InheritsFrom(TFrame)) and not ExistsProperty(Components[i], 'LookupSource') and (Components[i].ClassName <> 'TSDQuery') and not Assigned(Value) then
        try
          raise Exception.Create('Al componente ' + Components[i].Name + ' le falta asignar la propiedad DataSource.');
        except
        end;
    end;
  end;

  if IsWin2008Server or IsWindows7 or IsDelphiRunning then
    XPMenu.FlatMenu := False;
end;

function TfrmCustomForm.GetFormPadre: TForm;
var
  Aux: TComponent;
begin
  Aux := Self.Owner;

  while not Aux.InheritsFrom(TForm) do
    Aux := Aux.Owner;

  Result := TForm(Aux);
end;

procedure TfrmCustomForm.HideTitlebar;
var
  Style: Longint;
begin
  if BorderStyle = TFormBorderStyle(bsNone) then Exit;
  Style := GetWindowLong(Handle, GWL_STYLE);
  if (Style and WS_CAPTION) = WS_CAPTION then
  begin
    case BorderStyle of
      TFormBorderStyle(bsSingle),
      bsSizeable: SetWindowLong(Handle, GWL_STYLE, Style and
          (not (WS_CAPTION)) or WS_BORDER);
      bsDialog: SetWindowLong(Handle, GWL_STYLE, Style and
          (not (WS_CAPTION)) or DS_MODALFRAME or WS_DLGFRAME);
    end;
    Height := Height - GetSystemMetrics(SM_CYCAPTION);
    Refresh;
  end;
end;

end.
