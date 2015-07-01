unit unVisor;

interface

{$IFNDEF MSACCESS}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomForm, Menus, OleCtrls, ImgList, XPMenu, Placemnt,
  AdvGlowButton, AdvToolBar, AdvToolBarStylers, ActnList, ComCtrls,
  JvExComCtrls, JvComCtrls, StdCtrls, ExtCtrls, unEnvioMail, unMoldeEnvioMail,
  unSeleccionDestinatarios, JvExExtCtrls, JvComponent, JvPanel,
  ShortCutControl, JvExtComponent, RxPlacemnt, AdvSmoothTrackBar,
  AdvSmoothProgressBar;

type
  TfrmVisor = class(TfrmCustomForm)
    AdvToolBarPager: TAdvToolBarPager;
    pagMenu: TAdvPage;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvToolBar2: TAdvToolBar;
    advgbEnviarMail: TAdvGlowButton;
    AdvTBZoom: TAdvToolBar;
    alAcciones: TActionList;
    acClose: TAction;
    acSendMail: TAction;
    acPrint: TAction;
    AdvToolBar3: TAdvToolBar;
    advgbImprimir: TAdvGlowButton;
    advgbSalir: TAdvGlowButton;      
    sliderZoom: TJvTrackBar;
    sbContenedor: TScrollBox;
    pnlOcultarBotonBarraHerramientas: TJvPanel;
    acSaveCopy: TAction;
    advgbGuardarCopia: TAdvGlowButton;
    sdGuardarCopia: TSaveDialog;
    TimerImpresion: TTimer;
    ScrollBar1: TScrollBar;
    pnlBottom: TPanel;
    aspbImpresionAutomatica: TAdvSmoothProgressBar;
    pnlTituloImpresion: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure mnuCerrarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure acSendMailExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure sliderZoomChange(Sender: TObject);
    procedure acSaveCopyExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TimerImpresionTimer(Sender: TObject);
  private
    FFileName: String;
    FIdOrigenGeneracion, FWaitingProgress: Integer;
    FOpciones: TOpcionesEnvioMail;
   {$IFNDEF SERVICE}
    FContrato: Integer;
    FMailAddress, FSubject, FBody: String;
    FOpcTipoDestinatarios: TOpcionesTipoDestinatario;
    {$ENDIF}
    FContadorTimer: Integer;
    FCierreAutomatico: Integer;
  protected
    Visor: TComponent;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Crear_Visor(AFileName: String); virtual;
    procedure Imprimir_Visor; virtual;
    procedure Imprimir_Visor_SinDialogo; virtual;
    procedure SetearZoom_Visor(Zoom: Integer); virtual;
  public
    class function CrearVisor(ClaseVisor: TComponentClass; Zoom: Boolean): TfrmVisor; virtual;
  end;

  function AbrirVisor(AFileName: String; APermiteEnvioMail: Boolean = True; APermiteGuardarCopia: Boolean = False; AImprimeSolo : Boolean = False): Boolean;
  {$IFNDEF SERVICE}
  function AbrirVisorMail(AFileName, sAddresses, sSubject: String;
                          Opciones: TOpcionesEnvioMail;
                          sBody: String = 'Provincia ART';
                          nContrato: Integer = 0;
                          iWaitingProgress: Integer = 2500;
                          iIdOrigenGeneracion: Integer = -1;
                          OpcTipoDestinatarios: TOpcionesTipoDestinatario = [tdContactoContrato];
                          APermiteGuardarCopia: Boolean = False): Boolean;
   {$ENDIF}

var
  frmVisor: TfrmVisor;

implementation

uses
  ArchFuncs;

{$R *.DFM}

function Abrir_Visor(AFileName: String; APermiteEnvioMail, APermiteGuardarCopia: Boolean; AImprimeSolo : Boolean = False): Boolean;
begin
  if FileExists(AFileName) then
    with frmVisor do
    begin
      acSendMail.Enabled := APermiteEnvioMail;
      acSaveCopy.Enabled := APermiteGuardarCopia;

      if (APermiteEnvioMail and (FOpciones = [])) or APermiteGuardarCopia then
      begin
        FFileName := AFileName;

        if APermiteEnvioMail then
          begin
            FOpciones := [oShowDialogIfEmpty, oAlwaysShowDialog, oAutoFirma];
            FIdOrigenGeneracion := -1;
            FWaitingProgress := 2500;
          end;
      end;

      Crear_Visor(AFileName);

      if AdvTBZoom.Enabled then
        begin
          sliderZoom.Position := 80;
          sliderZoomChange(nil);
        end;

      Resize;
      if AImprimeSolo then
        TimerImpresion.Enabled := True;

      if not (Screen.ActiveForm.FormStyle = fsMDIChild) then
      begin
        Hide;
        frmVisor.ShowModal;
      end else
      begin
        frmVisor.FormStyle := fsMDIChild;
        Show;
        BringToFront;
      end;

      Result := True;
    end
  else
    Result := False;
end;

function AbrirVisor(AFileName: String; APermiteEnvioMail: Boolean = True; APermiteGuardarCopia: Boolean = False; AImprimeSolo : Boolean = False): Boolean;
begin
  Result := Abrir_Visor(AFileName, APermiteEnvioMail, APermiteGuardarCopia, AImprimeSolo);
  if frmVisor.FormStyle <> fsMDIChild then
    FreeAndNil(frmVisor);
end;

 {$IFNDEF SERVICE}
function AbrirVisorMail(AFileName, sAddresses, sSubject: String;
                        Opciones: TOpcionesEnvioMail;
                        sBody: String = 'Provincia ART';
                        nContrato: Integer = 0;
                        iWaitingProgress: Integer = 2500;
                        iIdOrigenGeneracion: Integer = -1;
                        OpcTipoDestinatarios: TOpcionesTipoDestinatario = [tdContactoContrato];
                        APermiteGuardarCopia: Boolean = False): Boolean;
begin
  with frmVisor do
  begin
    FFileName    := AFileName;
    FMailAddress := sAddresses;
    FSubject     := sSubject;
    FOpciones    := Opciones;
    FBody        := sBody;
    FContrato    := nContrato;
    FWaitingProgress      := iWaitingProgress;
    FIdOrigenGeneracion   := iIdOrigenGeneracion;
    FOpcTipoDestinatarios := OpcTipoDestinatarios;
  end;

  Result := Abrir_Visor(AFileName, True, APermiteGuardarCopia);

  if frmVisor.FormStyle <> fsMDIChild then
    FreeAndNil(frmVisor);
end;
{$ENDIF}

procedure TfrmVisor.FormCreate(Sender: TObject);
begin
  inherited;
  HideTitlebar;
end;

procedure TfrmVisor.mnuCerrarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmVisor.FormResize(Sender: TObject);
begin
  inherited;
  if Assigned(frmVisor) and frmVisor.Visible then
  begin
    if AdvTBZoom.Enabled then
      sliderZoom.SetFocus;

    if TWinControl(Visor).CanFocus then
      TWinControl(Visor).SetFocus;
  end;
end;

procedure TfrmVisor.acSendMailExecute(Sender: TObject);
begin
  inherited;
  {$IFNDEF SERVICE}
   EnviarMailBD(FMailAddress, FSubject, FOpciones, FBody, GetAttachments(FFileName, 0), FContrato, tcDefault, True, False, FWaitingProgress, FIdOrigenGeneracion, FOpcTipoDestinatarios);
  {$ENDIF}
end;

procedure TfrmVisor.acCloseExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmVisor.acPrintExecute(Sender: TObject);
begin
  inherited;
  Imprimir_Visor;
end;

procedure TfrmVisor.sliderZoomChange(Sender: TObject);
begin
  inherited;
  SetearZoom_Visor(sliderZoom.Position);
end;

procedure TfrmVisor.TimerImpresionTimer(Sender: TObject);
begin
  inherited;
  pnlBottom.Visible := True;
  
  if FContadorTimer < 20 then
    FContadorTimer := FContadorTimer +1
  else
    FCierreAutomatico := FCierreAutomatico + 1;
  aspbImpresionAutomatica.GoToValue(FContadorTimer-FCierreAutomatico);
  if (FContadorTimer = 20) and (FCierreAutomatico = 0) then
  begin
    TimerImpresion.Enabled := False;
    Imprimir_Visor_SinDialogo;
    pnlTituloImpresion.Caption := 'Cierre automático';
    TimerImpresion.Enabled := True;
  end;
  if FCierreAutomatico = 20 then
  begin
    TimerImpresion.Enabled := False;
    Close;
  end;
end;

procedure TfrmVisor.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style and not WS_CAPTION;
end;

class function TfrmVisor.CrearVisor(ClaseVisor: TComponentClass; Zoom: Boolean): TfrmVisor;
begin
  if not Assigned(frmVisor) then
    Application.CreateForm(ClaseVisor, Result)
  else
    Result := frmVisor;

  with Result do
    begin
      AdvTBZoom.Enabled := Zoom;
      if not Zoom then
        sliderZoom.Position := 0;
    end;
end;

procedure TfrmVisor.acSaveCopyExecute(Sender: TObject);
begin
  inherited;
  if sdGuardarCopia.Execute then
    CopyFileExt(FFileName, sdGuardarCopia.FileName, True);
end;

procedure TfrmVisor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if FormStyle = fsMDIChild then
    frmVisor := nil;
end;

procedure TfrmVisor.FormShow(Sender: TObject);
begin
  Resize;
end;

procedure TfrmVisor.Crear_Visor(AFileName: String);
begin
//
end;

procedure TfrmVisor.Imprimir_Visor;
begin
//
end;

procedure TfrmVisor.Imprimir_Visor_SinDialogo;
begin
//
end;

procedure TfrmVisor.SetearZoom_Visor(Zoom: Integer);
begin
//
end;

{$ELSE}
  implementation
{$ENDIF}

end.

