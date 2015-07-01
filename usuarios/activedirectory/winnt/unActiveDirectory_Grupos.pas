(************************************************************
Author: Deepak Shenoy
        shenoy@agnisoft.com
Copyright (C) 2000 Agni Software Pvt. Ltd.
All Rights Reserved.
http://www.agnisoft.com

Description:
A form that shows the members of the selected group
********************************************************)
unit unActiveDirectory_Grupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActiveDs_Tlb, Placemnt;

type
  TfrmGroup = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtDesc: TEdit;
    lblName: TLabel;
    lblType: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbMembers: TListBox;
    Button1: TButton;
    FormStorage: TFormStorage;
    procedure FormShow(Sender: TObject);
  private
    procedure AddToList( disp : IADs );
  public
    Group : IADsGroup;
  end;

var
  frmGroup: TfrmGroup;

implementation

uses
  adshlp, unActiveDirectory_Usuarios;

{$R *.DFM}

procedure TfrmGroup.AddToList(disp: IADs);
begin
  lbMembers.Items.Add(Disp.Name + ' (' + Disp.Class_ + ')');
end;

procedure TfrmGroup.FormShow(Sender: TObject);
begin
  if Group <> nil then
  begin
    lblName.Caption := Group.Name;
    lblType.Caption := frmUser.GetGroupType(Group);
    edtDesc.Text := Group.Description;
    AdsEnumerateMembers(Group.Members, AddToList);
  end;
end;

end.

