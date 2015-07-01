{-----------------------------------------------------------------------------
 Unidad:    unEspera
 Autor:     ptavasci
 Fecha:     06-Oct-2005
 Prósito:   mostrar espera y avance en otro thread
 Historia:  primera versión.
-----------------------------------------------------------------------------}
unit unEspera;

interface

uses
  {$IFDEF VER140}Variants, {$ENDIF} {$IFDEF VER150}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, JvAnimatedImage,
  JvGIFCtrl, JvExControls, JvComponent;

type
  TEspera = class(TThread)
  private
    FMensaje: String;
  protected
    procedure Execute; override;
    procedure DoTerminate; override;
  public
    constructor Create(CreateSuspended: Boolean; AMensaje: String); overload;
    procedure MostrarEspera;
    procedure Actualizar;
    property Mensaje: String read FMensaje write FMensaje;
  end;

  TfrmEspera = class(TForm)
    ImagenGIF: TJvGIFAnimator;
    lbMensaje: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FAllowClose: Boolean;

    procedure SetFormWidth(const aMensaje);
  public
    property AllowClose: Boolean read FAllowClose write FAllowClose;
  end;

  procedure IniciarEspera(AMensaje: String = 'Espere por favor...');
  procedure DetenerEspera;

var
  frmEspera: TfrmEspera;
  WindowList: Pointer;

implementation

{$R *.dfm}

var
  Espera: TEspera;
  ActiveFrm: TCustomForm;
  iCounter: integer;

procedure IniciarEspera(AMensaje: String = 'Espere por favor...');
begin
  if iCounter = 0 then
  begin
    ActiveFrm := Screen.ActiveForm;
    Espera := TEspera.Create(True, AMensaje);
    Espera.Priority := tpTimeCritical;
    Espera.FreeOnTerminate := False;
    Application.ProcessMessages;
    Espera.Resume;
    Application.ProcessMessages;
    Application.HandleMessage;
  end
  else
  begin
    Espera.Mensaje := AMensaje;
    Espera.Synchronize(Espera.MostrarEspera);
  end;
  Inc(iCounter);
end;

procedure DetenerEspera;
begin
  if iCounter = 1 then
  try
//      Espera.DoTerminate;
		Espera.Terminate;
    Application.ProcessMessages;
    Sleep(251);
//      EnableTaskWindows(WindowList);
	except
  	if Assigned(WindowList) then
    	EnableTaskWindows(WindowList);
  end
  else
    if Assigned(frmEspera) then
    begin
      frmEspera.Show;
      frmEspera.Invalidate;
    end;
  Dec(iCounter);
end;

procedure TfrmEspera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{ TEspera }

procedure TEspera.Actualizar;
begin
  if Assigned(frmEspera) then
    frmEspera.Invalidate;
end;

constructor TEspera.Create(CreateSuspended: Boolean; AMensaje: String);
begin
  inherited Create(CreateSuspended);
  Mensaje := AMensaje;
end;

procedure TEspera.DoTerminate;
begin
  inherited;
  if Assigned(frmEspera) then
  begin
    frmEspera.AllowClose := True;
    frmEspera.Close;
    frmEspera := nil;
  end;
end;

procedure TEspera.Execute;
begin
  try
    Synchronize(MostrarEspera);
    Synchronize(Actualizar);
    while not Terminated do
    begin
      Synchronize(Actualizar);
      Sleep(250);
    end;
  finally
    EnableTaskWindows(WindowList);
  end;
end;

procedure TEspera.MostrarEspera;
begin
  if (iCounter = 0) or not Assigned(frmEspera) then
  begin
    frmEspera := TfrmEspera.Create(ActiveFrm);
    {$IFNDEF VER130}
    frmEspera.AlphaBlend := True;
    frmEspera.AlphaBlendValue := 220;
    {$ENDIF}
    try
      frmEspera.ImagenGIF.Animate := True;
    except
    	//
    end;
    WindowList := DisableTaskWindows(0);

    frmEspera.Show;
  end;

  if iCounter >= 0 then
  begin
    frmEspera.lbMensaje.Caption := Mensaje;
    frmEspera.SetFormWidth(Mensaje);
    frmEspera.Show;
    frmEspera.Invalidate;
    Application.ProcessMessages;
  end;
end;

procedure TfrmEspera.FormCreate(Sender: TObject);
begin
  AllowClose := False;
end;

procedure TfrmEspera.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := AllowClose;
end;

procedure TfrmEspera.SetFormWidth(const aMensaje);
begin
	Width := lbMensaje.Width + 16;

  if Width = 200 then
  	lbMensaje.Width := Width - 8;
end;

end.
