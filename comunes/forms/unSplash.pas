unit unSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvComponent, JvgProgress, jpeg, ExtCtrls, JvgLabel,
  JvThreadTimer, StdCtrls, JvThread, JvWaitingGradient;

type
  TfrmSplash = class(TForm)
    Imagen: TImage;
    stConectando: TStaticText;
    Progreso: TJvWaitingGradient;
    procedure FormCreate(Sender: TObject);
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  Show;
  Update;
  Progreso.Active := True;
end;

end.
