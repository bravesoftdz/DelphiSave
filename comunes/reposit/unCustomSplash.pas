{

begin
  Application.Initialize;
  with TfrmCustomSplash.Create(Application) do
    Try
      ShowOnTop;
      Application.CreateForm(TForm1, Form1);
    finally
      Free;
    end;
    Application.Run;
end.

}
{
procedure TfrmCustomSplash.WMPaint(var Message: TWMPaint);
begin
  if Assigned(Background) Then
    Canvas.Draw(0, 0, Background);
end;}

unit unCustomSplash;

interface

uses
  Forms, Graphics, Windows, Classes, Messages, ExtCtrls, Controls;

type
  TfrmCustomSplash = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FWindowList: Pointer;
    FRegion: HRGN;
//    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
  protected
    Background: Graphics.TBitmap;
    BackColor: TColor;
    AutoRegion: Boolean;
    procedure CheckWindowList;
    procedure DoShow; override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ShowOnTop;
  end;

implementation

uses
  Win32Regions, ParamFuncs;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomSplash.ShowOnTop;
begin
  if not CommandExists('SplashOff') then
  begin
    FWindowList := DisableTaskWindows(Handle);
    Show;
    Update;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CheckWindowList;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomSplash.CheckWindowList;
begin
  if FWindowList <> nil Then
  begin
    EnableTaskWindows( FWindowList );
    FWindowList := Nil;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomSplash.DoShow;
begin
  if Assigned(Background) Then
  begin
    ClientHeight := Background.Height;
    ClientWidth  := Background.Width;
    if AutoRegion then
    begin
      FRegion := BitmapToRegion(Background, BackColor);
      SetWindowRgn(Handle, FRegion, True);
    end;
  end;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
destructor TfrmCustomSplash.Destroy;
begin
  if FRegion <> 0 Then
    DeleteObject(FRegion);

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
constructor TfrmCustomSplash.Create(AOwner: TComponent);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomSplash.Paint;
begin
  if Assigned(Background) Then
    Canvas.Draw(0, 0, Background);

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmCustomSplash.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
  BackColor := clNone;
  AutoRegion := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
end.
