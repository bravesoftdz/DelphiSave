(************************************************************
Author: Deepak Shenoy
        shenoy@agnisoft.com
Copyright (C) 2000 Agni Software Pvt. Ltd.
All Rights Reserved.
http://www.agnisoft.com

Description:
A form that shows all the groups in the domain
********************************************************)
unit unActiveDirectory_ListaDeGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActiveDs_TLB, Variants, Placemnt;

type
  TfrmGroupList = class(TForm)
    lbGroups: TListBox;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    lbGroupPath: TListBox;
    FormStorage: TFormStorage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    GroupPath : string;
    procedure SetContainer( cont : IAdsContainer);
    procedure AddToList( disp : IADs );
  end;

var
  frmGroupList: TfrmGroupList;

implementation

uses adshlp, unActiveDirectory_Usuarios;

{$R *.DFM}

{ TfrmGroupList }

procedure TfrmGroupList.AddToList(disp: IADs);
begin
  lbGroups.Items.Add(disp.Name + ' (' +frmUser.GetGroupType(disp as IAdsGroup) + ')' );
  lbGroupPath.Items.Add(disp.AdsPath); 
end;

procedure TfrmGroupList.SetContainer(cont: IAdsContainer);
begin
  lbGroups.Items.Clear;
  lbGroupPath.Items.Clear;
  cont.Filter := VarArrayOf(['Group']);
  ADsEnumerateObjects(cont, AddToList);
end;

procedure TfrmGroupList.Button1Click(Sender: TObject);
begin
  if lbGroups.ItemIndex<>-1 then
    GroupPath := lbGroupPath.Items[lbGroups.ItemIndex];
end;

procedure TfrmGroupList.FormCreate(Sender: TObject);
begin
  GroupPath := '';
end;

end.
