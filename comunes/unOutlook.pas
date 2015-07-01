unit unOutlook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomForm, ComCtrls, ImgList, XPMenu, Placemnt, StdCtrls;

type
  TfrmOutlook = class(TfrmCustomForm)
    tvFolders: TTreeView;
    Button1: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure tvFoldersChange(Sender: TObject; Node: TTreeNode);
  private
    procedure RetrieveOutlookFolders(tvFolders: TTreeView);
  public
  end;

var
  frmOutlook: TfrmOutlook;

implementation

uses
  ComObj;

const
  olMailItem = $00000000;
  olAppointmentItem = $00000001;
  olContactItem = $00000002;
  olTaskItem = $00000003;
  olJournalItem = $00000004;
  olNoteItem = $00000005;
  olPostItem = $00000006;

var
  Outlook, NameSpace: OLEVariant;
  FolderIDs: array [1 .. 100] of String;

{$R *.dfm}

procedure TfrmOutlook.RetrieveOutlookFolders(tvFolders: TTreeView);

  procedure LoadFolder(ParentNode: TTreeNode; Folder: OleVariant);
  var
    i: Integer;
    Node: TTreeNode;
  begin
    for i := 1 to Folder.Count do
    begin
      Node := tvFolders.Items.AddChild(ParentNode, Folder.Item[i].Name);
      FolderIDs[i] := Folder.Item[i].EntryID;
      Node.Data := @FolderIDs[i];
      LoadFolder(Node, Folder.Item[i].Folders);
    end;
  end;

begin
  tvFolders.Items.Clear;
  LoadFolder(nil, NameSpace.Folders);
end;

procedure TfrmOutlook.FormCreate(Sender: TObject);
begin
  inherited;
  try
   Outlook := GetActiveOleObject('Outlook.Application');
  except
   Outlook := CreateOleObject('Outlook.Application');
  end;
  NameSpace := Outlook.GetNameSpace('MAPI');
end;

procedure TfrmOutlook.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Outlook := UnAssigned;
end;

procedure TfrmOutlook.Button1Click(Sender: TObject);
begin
  inherited;
  try
    RetrieveOutlookFolders(tvFolders);
  except
  end;
end;

procedure TfrmOutlook.tvFoldersChange(Sender: TObject; Node: TTreeNode);
var
{
  intFolderType: Integer;
  oiItem, Folder: OLEVariant;
  i: integer;
}  
  s: string;
begin
  inherited;
{
  Folder := NameSpace.GetItemFromID(FolderIDs[1]);//String(Node.Data^));
  intFolderType := Folder.DefaultItemType;
  oiItem := Folder.GetItemFromID(String(Node.Data^));

  case intFolderType of
    olMailItem: s := VarToStr(oiItem.SenderName) + oiItem.Subject + oiItem.ReceivedTime + oiItem.ReceivedByName;
    olAppointmentItem: s := oiItem.Subject + oiItem.ReplyTime;
    olContactItem: s := oiItem.FullName + oiItem.Email;
    olTaskItem: s := oiItem.SenderName + oiItem.DueDate + oiItem.PercentComplete;
    olJournalItem: s := oiItem.SenderName;
    olNoteItem: s := oiItem.Subject + oiItem.CreationTime + oiItem.LastModificationTime;
    olPostItem: s := VarToStr(oiItem.SenderName) + oiItem.Subject + oiItem.ReceivedTime;
  end;
}
  Label1.Caption := s;
{
  for i := 0 to Folder.Items.Count - 1 do
  begin
    oiItem := Folder.Items[i];
  end;
}
end;

end.
