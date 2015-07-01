unit unFrmSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvComponent, JvWaitingGradient, jpeg,
  ExtCtrls, JvAnimatedImage, JvGIFCtrl;

type
  TfrmSplash = class(TForm)
    Image1: TImage;
    stConectando: TStaticText;
    Progreso: TJvGIFAnimator;
    procedure FormCreate(Sender: TObject);
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  Progreso.Animate := True;
end;

end.
