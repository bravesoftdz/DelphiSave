unit unWebBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvMemo, AdvmWS, StdCtrls, ComCtrls, OleCtrls, SHDocVw, Menus,
  ToolWin, ActnList, ImgList, AdvGlowButton, AdvToolBar, AdvToolBarStylers,
  unCustomForm, XPMenu, Placemnt;

type
  TfrmWebBrowser = class(TfrmCustomForm)
    WebBrowser: TWebBrowser;
    ActionList1: TActionList;
    BackAction: TAction;
    ForwardAction: TAction;
    StopAction: TAction;
    RefreshAction: TAction;
    AdvToolBarPager1: TAdvToolBarPager;
    AdvPage1: TAdvPage;
    AdvToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    AdvToolBar1: TAdvToolBar;
    BackBtn: TAdvGlowButton;
    RefreshBtn: TAdvGlowButton;
    StopBtn: TAdvGlowButton;
    FowardBtn: TAdvGlowButton;
    ImageList: TImageList;
    procedure BackActionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FowardBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure WebBrowserBeforeNavigate2(Sender: TObject; const pDisp: IDispatch; var URL, Flags, TargetFrameName,
                                        PostData, Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowserDownloadBegin(Sender: TObject);
    procedure WebBrowserDownloadComplete(Sender: TObject);
    procedure BackActionUpdate(Sender: TObject);
    procedure ForwardActionUpdate(Sender: TObject);
  private
    FUrl: String;
    HistoryIndex: Integer;
    HistoryList: TStringList;
    procedure FindAddress;
  public
    procedure LoadUrl(aUrl: String);
  end;

var
  frmWebBrowser: TfrmWebBrowser;

implementation

{$R *.dfm}

procedure TfrmWebBrowser.LoadUrl(aUrl: String);
begin
  FUrl := aUrl;
  FindAddress;
end;

procedure TfrmWebBrowser.BackActionClick(Sender: TObject);
begin
  FUrl := HistoryList[HistoryIndex - 1];
  FindAddress;
end;

procedure TfrmWebBrowser.FormCreate(Sender: TObject);
begin
  inherited;
  HideTitlebar;
  HistoryIndex := -1;
  HistoryList := TStringList.Create;
end;

procedure TfrmWebBrowser.FormDestroy(Sender: TObject);
begin
  HistoryList.Free;
end;

procedure TfrmWebBrowser.FindAddress;
var
  Flags: OLEVariant;
begin
  Flags := 0;
  WebBrowser.Navigate(WideString(FUrl), Flags, Flags, Flags, Flags);
end;                                      

procedure TfrmWebBrowser.FowardBtnClick(Sender: TObject);
begin
  FUrl := HistoryList[HistoryIndex + 1];
  FindAddress;
end;

procedure TfrmWebBrowser.StopBtnClick(Sender: TObject);
begin
  WebBrowser.Stop;
end;

procedure TfrmWebBrowser.RefreshBtnClick(Sender: TObject);
begin
  FindAddress;
end;

procedure TfrmWebBrowser.WebBrowserBeforeNavigate2(Sender: TObject; const pDisp: IDispatch; var URL, Flags,
                                                   TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
var
  NewIndex: Integer;
begin
  NewIndex := HistoryList.IndexOf(URL);
  if NewIndex = -1 then
  begin
    { Remove entries in HistoryList between last address and current address }
    if (HistoryIndex >= 0) and (HistoryIndex < HistoryList.Count - 1) then
      while HistoryList.Count > HistoryIndex do
        HistoryList.Delete(HistoryIndex);
    HistoryIndex := HistoryList.Add(URL);
  end
  else
    HistoryIndex := NewIndex;
  FUrl := URL;
end;

procedure TfrmWebBrowser.WebBrowserDownloadBegin(Sender: TObject);
begin
  StopBtn.ImageIndex := 4;
end;

procedure TfrmWebBrowser.WebBrowserDownloadComplete(Sender: TObject);
begin
  StopBtn.ImageIndex := 2;
end;

procedure TfrmWebBrowser.BackActionUpdate(Sender: TObject);
begin
  if HistoryList.Count > 0 then
    BackAction.Enabled := HistoryIndex > 0
 else
    BackAction.Enabled := False;
end;

procedure TfrmWebBrowser.ForwardActionUpdate(Sender: TObject);
begin
  if HistoryList.Count > 0 then
    ForwardAction.Enabled := HistoryIndex < HistoryList.Count - 1
  else
    ForwardAction.Enabled := False;
end;

end.
