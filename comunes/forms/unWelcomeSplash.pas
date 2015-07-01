unit unWelcomeSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomSplash, ExtCtrls, StdCtrls,
  JvExControls, JvComponent, JvAnimatedImage, JvGIFCtrl;

type
  TfrmWelcomeSplash = class(TfrmCustomSplash)
    lbLeyenda: TLabel;
    imgLoading: TJvGIFAnimator;
    jvthrdtmrPuntitos: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure jvthrdtmrPuntitosTimer(Sender: TObject);
  end;

implementation

uses
  Strfuncs;

var
  iPuntos: Integer;

{$R *.DFM}

procedure TfrmWelcomeSplash.FormCreate(Sender: TObject);
begin
//  imgLoading.Animate := True;
  imgLoading.Visible := False;
  lbLeyenda.Visible := False;
  Application.ProcessMessages;
  inherited;
  Background := TBitmap.Create;
  Background.LoadFromResourceName(hInstance, 'SPLASH');
end;

procedure TfrmWelcomeSplash.FormDestroy(Sender: TObject);
begin
  Background.Free;
  inherited;
end;

procedure TfrmWelcomeSplash.FormActivate(Sender: TObject);
begin
  inherited;
  lbLeyenda.Left := Width - lbLeyenda.Width - 16;
  lbLeyenda.Top  := Height - 24;
  imgLoading.Left := 36;
  imgLoading.Top := Height - 24;
//  imgLoading.Visible := True;
  lbLeyenda.Visible := True;  
  Application.ProcessMessages;
end;

procedure TfrmWelcomeSplash.jvthrdtmrPuntitosTimer(Sender: TObject);
begin
  Application.ProcessMessages;
  lbLeyenda.Caption := 'Iniciando aplicación' + RPad('', '.', iPuntos mod 4);
  Inc(iPuntos);
  lbLeyenda.Invalidate;
end;

end.
