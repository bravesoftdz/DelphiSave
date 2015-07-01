(************************************************************
Author: Deepak Shenoy
        shenoy@agnisoft.com
Copyright (C) 2000 Agni Software Pvt. Ltd.
All Rights Reserved.
http://www.agnisoft.com

Description:
The main form.
Shows the list of users, with the appropriate properties.
Lists out groups the user is a member of.
You can change group membership using this form, but not anything else.
(like password never expires, etc.)
This doesn't mean you can't - it means I was too lazy to do it.
********************************************************)
unit unActiveDirectory_Usuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, adshlp, ActiveDs_TLB, ImgList, StdCtrls, Variants,
  unCustomForm, XPMenu, Placemnt;

type
  TfrmUser = class(TfrmCustomForm)
    trUser: TTreeView;
    UserImages: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    edtDomainName: TEdit;
    btnCambiar: TButton;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label2: TLabel;
    edtUserName: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    chbChangeAtNextLogon: TCheckBox;
    chbCannotChangePass: TCheckBox;
    chbPassNeverExpires: TCheckBox;
    chbAcctDisabled: TCheckBox;
    chbAcctLockedOut: TCheckBox;
    edtFullName: TEdit;
    edtDescription: TEdit;
    GroupBox1: TGroupBox;
    lbGroups: TListBox;
    lbGroupPath: TListBox;
    btnAgregar: TButton;
    btnRemover: TButton;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCambiarClick(Sender: TObject);
    procedure trUserChange(Sender: TObject; Node: TTreeNode);
    procedure lbGroupsDblClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    dom : IADsContainer;
    FUserName, FPassword,
    FDomain : string;
    FUseOpenObject : boolean;
  public
    procedure AddToTree( disp : IADs );
    function GetGroupType( grp : IADsGroup ) : String;
    function ChooseDomain : boolean;
    procedure EnumGroups( usr : IADsUser);
  end;

var
  frmUser: TfrmUser;

implementation

uses
  ActiveX, unActiveDirectory_Dominio, unActiveDirectory_Grupos, unActiveDirectory_ListaDeGrupos;

{$R *.DFM}

procedure TfrmUser.AddToTree(disp: IADs);
var
  Node: TTreeNode;
begin                           
  Node := trUser.Items.Add(nil, disp.Name);
  if Supports(disp, IADsUser) then
    if (disp as IADsUser).AccountDisabled then
      Node.ImageIndex := 1
    else if (disp as IADsUser).IsAccountLocked then
      Node.ImageIndex := 2
    else
      Node.ImageIndex := 0;
end;

procedure TfrmUser.FormShow(Sender: TObject);
begin
  if FDomain = '' then Exit; // Release has been called , but this event WILL occur
  if dom <> nil then Dom := nil;
  if FUseOpenObject then
    ADsOpenObject('WinNT://' + FDomain, FUserName, FPassword, 1, IADsContainer, dom)
  else
    ADsGetObject('WinNT://' + FDomain, IADsContainer, dom);
  dom.Filter := VarArrayOf(['user']);
  trUser.Items.Clear;
  ADsEnumerateObjects(dom, AddToTree);
  //dom._Release;
end;

procedure TfrmUser.FormCreate(Sender: TObject);
begin
  FDomain := '';
  if not ChooseDomain then
    Release;
end;

function TfrmUser.ChooseDomain: boolean;
begin
  Result := TRUE;
  frmChooseDomain := TfrmChooseDomain.Create(nil);
  try
    if FDomain <> '' then frmChooseDomain.edtDomain.Text := FDomain;
    if frmChooseDomain.ShowModal = mrOk then
      with frmChooseDomain do
      begin
        FDomain := edtDomain.Text;
        FUseOpenObject := (chbUseOpenObject.Checked);
        if FUseOpenObject then
        begin
          FUserName := edtNewUser.Text;
          FPassword := edtPassword.Text;
        end;
        edtDomainName.Text := edtDomain.Text;
      end
    else
      Result := FALSE;
  finally
    frmChooseDomain.Free;
  end;
end;

procedure TfrmUser.btnCambiarClick(Sender: TObject);
begin
  if ChooseDomain then
    FormShow(Sender);
end;

procedure TfrmUser.trUserChange(Sender: TObject; Node: TTreeNode);
var
  usr: IAdsUser;
  flags: integer;
begin
  if Node = nil then Exit;
  if FUseOpenObject then
    ADsOpenObject('WinNT://' + FDomain + '/' + Node.Text, FUserName, FPassword, 1, IADsUser, usr)
  else
    ADsGetObject('WinNT://' + FDomain + '/' + Node.Text, IADsUser, usr);

  Assert(usr <> nil);
  edtUserName.Text := node.Text;
  edtFullName.Text := usr.FullName;
  edtDescription.Text := usr.Description;
  flags := usr.Get('userFlags');
  chbChangeAtNextLogon.Checked := usr.Get('PasswordExpired');
  chbCannotChangePass.Checked := (flags AND ADS_UF_PASSWD_CANT_CHANGE)<>0;
  chbPassNeverExpires.Checked := (flags and ADS_UF_DONT_EXPIRE_PASSWD)<>0;
  chbAcctDisabled.Checked := usr.AccountDisabled;
  chbAcctLockedOut.Checked := usr.IsAccountLocked;
  EnumGroups( usr );
  //usr._Release;

  if usr.AccountDisabled then
    Node.ImageIndex := 1
  else if usr.IsAccountLocked then
    Node.ImageIndex := 2
  else
    Node.ImageIndex := 0;
end;

procedure TfrmUser.EnumGroups(usr: IADsUser);
var
  Enum: IEnumVariant;
  grps: IAdsMembers;
  sGroupType: string;
  grp: IAdsGroup;
  varGroup: OleVariant;
  Temp: LongWord;
begin
  lbGroups.Items.Clear;
  lbGroupPath.Items.Clear;
  grps := usr.Groups;
  Enum := grps._NewEnum as IEnumVariant;
  if Enum <> nil then
  begin
    while (Enum.Next(1,varGroup, Temp) = S_OK) do
    begin
      grp := IDispatch(varGroup) as IAdsGroup;
      sGroupType := GetGroupType(grp);
      lbGroups.Items.Add(grp.Name + ' (' +  sGroupType + ')');
      lbGroupPath.Items.Add(grp.ADsPath);
      VariantClear(varGroup);
    end;
  end;
end;

function TfrmUser.GetGroupType( grp : IAdsGroup) : string;
var
  groupType: OleVariant;
begin
  Result := 'Unknown';
  groupType := grp.Get('groupType');
  If (groupType = ADS_GROUP_TYPE_GLOBAL_GROUP) Then
    Result := 'Global Group'
  Else If (groupType = ADS_GROUP_TYPE_DOMAIN_LOCAL_GROUP) Then
      Result := 'Local Group'
end;

procedure TfrmUser.lbGroupsDblClick(Sender: TObject);
var
  grp: IAdsGroup;
  obj: IADsOpenDSObject;
  szPath: string;
begin
  with TfrmGroup.Create(nil) do
  try
    szPath := lbGroupPath.Items[lbGroups.ItemIndex];
    if FUseOpenObject then
    begin
      AdsGetObject('WinNT:', IADsOpenDSObject, obj);
      grp := obj.OpenDSObject(szPath, FUserName, FPassword, 1) as IADsGroup;
    end
    else
      ADsGetObject(szPath, IADsGroup, grp);
    Group := grp;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmUser.btnAgregarClick(Sender: TObject);
var
  grp: IAdsGroup;
  usr: IAdsUser;
begin
  with TfrmGroupList.Create(nil) do
  try
    SetContainer(dom);
    if ShowModal=mrOk then
    begin
      if GroupPath <> '' then
      begin
       AdsGetObject(GroupPath, IADsGroup, grp);
       usr := dom.GetObject('user', edtUserName.Text) as IAdsUser;
       grp.Add (usr.ADsPath);
       EnumGroups( usr );
       usr := nil;
       grp := nil;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmUser.btnRemoverClick(Sender: TObject);
var
  usr: IADsUser;
  grp: IADsGroup;
  szPath: string;
begin
//----- Remove the group membership ------'
  if lbGroups.ItemIndex = -1 then Exit;
  szPath := lbGroupPath.Items[lbGroups.ItemIndex];
  If (szPath <> '') Then
  begin
    usr := dom.GetObject('user', edtUserName.Text) as IADsUser;
    ADsGetObject(szPath, IAdsGroup, grp);
    grp.Remove (usr.ADsPath); //To remove the group, you should pass the user/group ADsPath
    EnumGroups( usr );
    usr := nil;
    grp := nil;
  end;
end;

end.
