unit unFraNavegadorWEB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, OleCtrls, SHDocVw;

type
  TfraNavegadorWEB = class(TArtFrame)
  private
    function GetURL: String;
  protected
    wbNavegadorWEB: TWebBrowser;
  public
    constructor Create(AComponent: TComponent); override;
    procedure Clear; override;
    procedure Navigate(AURL: String);
    procedure ResetMemoryLeak; virtual;
    property URL: String read GetURL;    
  end;

var
  fraNavegadorWEB: TfraNavegadorWEB;

implementation

{$R *.dfm}

procedure TfraNavegadorWEB.Clear;
begin
  Navigate('about:blank');
end;

constructor TfraNavegadorWEB.Create(AComponent: TComponent);
begin
  inherited;
  wbNavegadorWEB := TWebBrowser(Self.FindComponent('wbNavegadorWEB'));
end;

function TfraNavegadorWEB.GetURL: String;
begin
  Result := wbNavegadorWEB.LocationURL;
end;

procedure TfraNavegadorWEB.Navigate(AURL: String);
var
  Flags: OleVariant;
begin
  Flags := navNoHistory;
  wbNavegadorWEB.Navigate(AURL, Flags);
end;

procedure TfraNavegadorWEB.ResetMemoryLeak;
begin
  wbNavegadorWEB.Free;
  wbNavegadorWEB := TWebBrowser.Create(Self);
  wbNavegadorWEB.Align := alClient;
end;

initialization
  RegisterClasses([TWebBrowser]);
end.
