unit unEsperaSimple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomForm, JvExControls, JvComponent, JvAnimatedImage, JvGIFCtrl,
  ImgList, XPMenu, Placemnt, ExtCtrls, JvExExtCtrls, JvPanel, JvExtComponent,
  RxPlacemnt;

type
  TfrmEsperaSimple = class(TfrmCustomForm)
    Panel1: TPanel;
    Panel2: TPanel;
    imgEspera: TJvGIFAnimator;
    pnlTexto: TJvPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure FormShow(Sender: TObject);
  end;

  procedure IniciarEspera(ATexto: String = 'Espere por favor...');
  procedure DetenerEspera(AForzarDetencion: Boolean = False);  

var
  frmEsperaSimple: TfrmEsperaSimple;

implementation

{$R *.dfm}

uses General;

var
  iCounter: Integer;

procedure IniciarEspera(ATexto: String);
begin
  if not Assigned(frmEsperaSimple) then
    frmEsperaSimple := TfrmEsperaSimple.Create(nil);
    
  frmEsperaSimple.pnlTexto.Caption := ATexto;
  Application.ProcessMessages;
  Inc(iCounter);
end;

procedure DetenerEspera(AForzarDetencion: Boolean);
begin
  Dec(iCounter);
  if ((iCounter = 0) or AForzarDetencion) and Assigned(frmEsperaSimple) then
  begin
    FreeAndNil(frmEsperaSimple);
    if AForzarDetencion then
      iCounter := 0;
  end;

  if (iCounter < 0) then
  begin
    iCounter := 0;
    if IsDelphiRunning then
      MsgBox('Atención! Es posible que haya un problema en la gestión de Pantallas de Espera si éstas se crean en forma anidada. Revise los lugares donde se crean y se destruyen las mismas.');
  end;
end;

procedure TfrmEsperaSimple.FormShow(Sender: TObject);
begin
  TJvGIFAnimator(imgEspera).Animate := True;
  Self.DoubleBuffered := True;
end;

end.
