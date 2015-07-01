unit unVisorExcel;

interface

{$IFNDEF MSACCESS}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unVisor, ActnList, AdvToolBar, AdvToolBarStylers, ImgList,
  XPMenu, Placemnt, ExtCtrls, JvExExtCtrls, JvComponent, JvPanel, ComCtrls,
  JvExComCtrls, JvComCtrls, AdvGlowButton, OleServer, OleCtnrs, RxPlacemnt,
  JvExtComponent;

type
  TfrmVisorExcel = class(TfrmVisor)
    ocContenedor: TOleContainer;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  protected
    procedure Crear_Visor(AFileName: String); override;
    procedure Imprimir_Visor; override;
    procedure SetearZoom_Visor(Zoom: Integer); override;
  end;

var
  frmVisorExcel: TfrmVisorExcel;

implementation

uses unExcel, unSesion;

{$R *.dfm}

procedure TfrmVisorExcel.FormCreate(Sender: TObject);
begin
  inherited;

  with sdGuardarCopia do
    begin
      DefaultExt := '*.xls';
      Filter     := 'Documento de Excel (*.xls)|*.xls';
    end;
end;

procedure TfrmVisorExcel.Crear_Visor(AFileName: String);
begin
  Visor := ocContenedor;

  with ocContenedor do
    begin
      Visible      := False;
      Parent       := sbContenedor;
      Align        := alClient;
      AutoActivate := aaGetFocus;
      FormStyle    := fsStayOnTop;

      CreateObjectFromFile(AFileName, False);
      DoVerb(ovHide);

      Visible := True;
    end;

    ocContenedor.OleObject.ActiveSheet.Protect('myPassword', true, true, true);
end;

procedure TfrmVisorExcel.Imprimir_Visor;
begin
  ocContenedor.OleObject.ActiveSheet.PrintOut;
end;

procedure TfrmVisorExcel.SetearZoom_Visor(Zoom: Integer);
begin
//
end;

procedure TfrmVisorExcel.FormResize(Sender: TObject);
var
  c, h, v: Integer;
begin
  inherited;

  h := GetSystemMetrics(SM_CYHSCROLL);
  v := GetSystemMetrics(SM_CYVSCROLL);
  c := GetSystemMetrics(SM_CXSIZEFRAME) * 2;

  with pnlOcultarBotonBarraHerramientas do
    begin
      Top    := AdvToolBarPager.Height + 1;
      Height := Self.Height - c - pnlOcultarBotonBarraHerramientas.Top - h - 2;
      Left   := 0;
      Width  := sbContenedor.Width - v - 2;
      BringToFront;
      Visible := False;
    end;
end;
{$ELSE}
  implementation
{$ENDIF}

end.

