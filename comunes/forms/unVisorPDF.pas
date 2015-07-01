unit unVisorPDF;

interface

{$IFNDEF MSACCESS}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unVisor, ActnList, AdvToolBar, AdvToolBarStylers, ImgList,
  XPMenu, Placemnt, ExtCtrls, JvExExtCtrls, JvComponent, JvPanel, ComCtrls,
  JvExComCtrls, JvComCtrls, AdvGlowButton, AcroPDFLib_TLB, unMoldeEnvioMail,
  unSeleccionDestinatarios, OleCtnrs, RxPlacemnt, JvExtComponent,
  AdvSmoothTrackBar, AdvSmoothProgressBar, Vcl.StdCtrls;

type
  TfrmVisorPDF = class(TfrmVisor)
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  protected
    procedure Crear_Visor(AFileName: String); override;
    procedure Imprimir_Visor; override;
    procedure Imprimir_Visor_SinDialogo; override;
    procedure SetearZoom_Visor(Zoom: Integer); override;
  end;

  function AbrirPDF(AFileName: String; APermiteEnvioMail: Boolean = True; APermiteGuardarCopia: Boolean = False; aImprimeSolo : Boolean = False): Boolean;
  {$IFNDEF SERVICE}
  function AbrirPDFMail(AFileName, sAddresses, sSubject: String;
                        Opciones: TOpcionesEnvioMail;
                        sBody: String = 'Provincia ART';
                        nContrato: Integer = 0;
                        iWaitingProgress: Integer = 2500;
                        iIdOrigenGeneracion: Integer = -1;
                        OpcTipoDestinatarios: TOpcionesTipoDestinatario = [tdContactoContrato];
                        APermiteGuardarCopia: Boolean = False): Boolean;
  {$ENDIF}
  function ImprimirPDF(AFileName: String): Boolean;
implementation

uses
  unArchivoVisor;

{$R *.dfm}

procedure TfrmVisorPDF.FormCreate(Sender: TObject);
begin
  inherited;

  with sdGuardarCopia do
    begin
      DefaultExt := '*.pdf';
      Filter     := 'Archivo Adobe PDF (*.pdf)|*.pdf';
    end;
end;

procedure TfrmVisorPDF.Crear_Visor(AFileName: String);
begin
  // Da error, para que ande en Adobe Reader X en adelante hay que: Iniciar Adobe Reader manualmente,
  // e ir a Edición:Preferencias. Ir a la categoría General y destildar 'Activar modo protegido al iniciar'.
  Visor := TAcroPDF.Create(frmVisor);

  with TAcroPDF(Visor) do
    begin
      Visible := False;
      Parent  := sbContenedor;
      Align   := alClient;

      setShowToolbar(False);
      setShowScrollbars(True);

      LoadFile(AFileName);
      gotoFirstPage;

      Visible := True;
    end;
end;

procedure TfrmVisorPDF.Imprimir_Visor;
begin
  TAcroPDF(Visor).Print;
end;

procedure TfrmVisorPDF.Imprimir_Visor_SinDialogo;
begin
  inherited;
  TAcroPDF(Visor).PrintAll;
end;

procedure TfrmVisorPDF.SetearZoom_Visor(Zoom: Integer);
begin
  TAcroPDF(Visor).setZoom(Zoom);
end;

procedure TfrmVisorPDF.FormResize(Sender: TObject);
begin
  inherited;

  with pnlOcultarBotonBarraHerramientas do
    begin
      Top    := sbContenedor.Top;
      Height := sbContenedor.Height;
      Left   := 0;
      Width  := 45;
    end;
end;

// por compatibilidad
function AbrirPDF(AFileName: String; APermiteEnvioMail: Boolean = True; APermiteGuardarCopia: Boolean = False;AImprimeSolo : Boolean = False): Boolean;
begin

  Result := AbrirArchivoVisor(AFileName, APermiteEnvioMail, APermiteGuardarCopia, AImprimeSolo);
end;

{$IFNDEF SERVICE}
// por compatibilidad
function AbrirPDFMail(AFileName, sAddresses, sSubject: String;
                      Opciones: TOpcionesEnvioMail;
                      sBody: String = 'Provincia ART';
                      nContrato: Integer = 0;
                      iWaitingProgress: Integer = 2500;
                      iIdOrigenGeneracion: Integer = -1;
                      OpcTipoDestinatarios: TOpcionesTipoDestinatario = [tdContactoContrato];
                      APermiteGuardarCopia: Boolean = False): Boolean;
begin
  Result := AbrirArchivoVisorMail(AFileName, sAddresses, sSubject, Opciones, sBody, nContrato, iWaitingProgress, iIdOrigenGeneracion, OpcTipoDestinatarios, APermiteGuardarCopia);
end;
{$ENDIF}

function ImprimirPDF(AFileName: String) : Boolean;
begin
  Result := AbrirPDF(AFileName, True, False, True);
end;

{$ELSE}
implementation
{$ENDIF}

end.

