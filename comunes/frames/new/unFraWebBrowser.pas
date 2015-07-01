unit unFraWebBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unArtFrame, cefvcl, ceflib;

const
  BLANK_URL = 'about:blank';

type
  TfraWebBrowser = class(TArtFrame)
    SaveDialog: TSaveDialog;
    procedure wbNavegadorWEBGetDownloadHandler(Sender: TObject; const browser: ICefBrowser; const mimeType, fileName: ustring; contentLength: Int64; var handler: ICefDownloadHandler; out Result: Boolean);
    procedure wbNavegadorWEBAuthCredentials(Sender: TObject; const browser: ICefBrowser; isProxy: Boolean; Port: Integer; const host, realm, scheme: ustring; var username, password: ustring; out Result: Boolean);
    procedure wbNavegadorWEBLoadEnd(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer; out Result: Boolean);
    procedure wbNavegadorWEBLoadStart(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame);
  private
    FLoading: Boolean;
    FURL: String;
    function GetURL: String;
  protected
    FOldCursor: TCursor;
    wbNavegadorWEB: TChromium;
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
    procedure Clear; override;
    procedure Navigate(AURL: String); virtual;
    procedure ResetMemoryLeak; virtual;
    property Loading: Boolean read FLoading;
    property URL: String read GetURL;
  end;

  TCefStreamDownloadHandler = class(TCefDownloadHandlerOwn)
  private
    FStream: TStream;
    FOwned: Boolean;
  protected
    function ReceivedData(data: Pointer; DataSize: Integer): Integer; override;
    procedure Complete; override;
  public
    constructor Create(stream: TStream; Owned: Boolean); reintroduce;
    destructor Destroy; override;
  end;
  
var
  fraWebBrowser: TfraWebBrowser;

implementation

uses Strfuncs;

{$R *.dfm}

procedure TfraWebBrowser.Clear;
begin
  if URL <> BLANK_URL then
    Navigate(BLANK_URL);
end;

constructor TfraWebBrowser.Create(AComponent: TComponent);
begin
  inherited;
  wbNavegadorWEB := TChromium(Self.FindComponent('wbNavegadorWEB'));
  wbNavegadorWEB.Options.HistoryDisabled := True;
end;

destructor TfraWebBrowser.Destroy;
begin
  Screen.Cursor := FOldCursor;
  inherited;
end;

function TfraWebBrowser.GetURL: String;
begin
  try
    if Assigned(wbNavegadorWEB.Browser.MainFrame) and (not IsEmptyString(wbNavegadorWEB.Browser.MainFrame.Url)) then
      Result := wbNavegadorWEB.Browser.MainFrame.Url
    else
      Result := FURL;
  except
    Result := FURL;
  end;
end;

procedure TfraWebBrowser.Navigate(AURL: String);
begin
  FURL := AURL;
  FOldCursor := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  wbNavegadorWEB.Load(AURL);
end;

procedure TfraWebBrowser.ResetMemoryLeak;
begin
  wbNavegadorWEB.Free;
  wbNavegadorWEB := TChromium.Create(Self);
  wbNavegadorWEB.Align := alClient;
end;

procedure CefOnRegisterCustomSchemes(const registrar: ICefSchemeRegistrar);
begin
  registrar.AddCustomScheme('dcef', True, False, False);
end;

procedure TfraWebBrowser.wbNavegadorWEBGetDownloadHandler(Sender: TObject; const browser: ICefBrowser; const mimeType, fileName: ustring; contentLength: Int64; var handler: ICefDownloadHandler; out Result: Boolean);
begin
  SaveDialog.FileName := fileName;
  if SaveDialog.Execute then
    handler := TCefStreamDownloadHandler.Create(TFileStream.Create(SaveDialog.FileName, fmCreate), True);
  Result := True;
end;

procedure TfraWebBrowser.wbNavegadorWEBAuthCredentials(Sender: TObject; const browser: ICefBrowser; isProxy: Boolean; Port: Integer; const host, realm, scheme: ustring; var username, password: ustring; out Result: Boolean);
{$IFDEF DELPHI12_UP}
var
  u, p: ustring;
  r: Boolean;
{$ENDIF}
begin
{$IFDEF DELPHI12_UP}
  TThread.Synchronize(nil, procedure begin
    with TPasswordDlg.Create(nil) do
    try
      if ShowModal = mrOk then
      begin
        u := edtusername.Text;
        p := edtPassword.Text;
        r := True;
      end else
        r := False;
    finally
      Free;
    end
  end);

  Result := r;
  if r = True then
  begin
    username := u;
    password := p;
  end;
{$ENDIF}
end;

{ TCefStreamDownloadHandler }

procedure TCefStreamDownloadHandler.Complete;
begin
  inherited;
//  MainForm.StatusBar.SimpleText := 'Download complete';
end;

constructor TCefStreamDownloadHandler.Create(stream: TStream; Owned: Boolean);
begin
  inherited Create;
  FStream := stream;
  FOwned := Owned;
end;

destructor TCefStreamDownloadHandler.Destroy;
begin
  if FOwned then
    FStream.Free;

  inherited;
end;

function TCefStreamDownloadHandler.ReceivedData(data: Pointer; DataSize: Integer): Integer;
begin
  Result := FStream.Write(data^, DataSize);
//  MainForm.StatusBar.SimpleText := 'Downloading ... ' + IntToStr(FStream.Position div 1000) + ' Kb';
end;

procedure TfraWebBrowser.wbNavegadorWEBLoadEnd(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer; out Result: Boolean);
begin
  inherited;
  if (browser <> nil) and (browser.GetWindowHandle = wbNavegadorWEB.BrowserHandle) and ((frame = nil) or (frame.IsMain)) then
    FLoading := False;
  Screen.Cursor := FOldCursor;
end;

procedure TfraWebBrowser.wbNavegadorWEBLoadStart(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame);
begin
  inherited;
  if (browser <> nil) and (browser.GetWindowHandle = wbNavegadorWEB.BrowserHandle) and ((frame = nil) or (frame.IsMain)) then
    FLoading := True;
end;

initialization
  RegisterClasses([TChromium]);
  {
  *** Directorio donde guarda una caché local ***
  CefCache := 'cache';
  }
  CefRegisterCustomSchemes := CefOnRegisterCustomSchemes;
//  CefRegisterSchemeHandlerFactory('dcef', '', True, TFileScheme);
end.
