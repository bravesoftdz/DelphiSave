(************************************************************
Author: Deepak Shenoy
        shenoy@agnisoft.com
Copyright (C) 2000 Agni Software Pvt. Ltd.
All Rights Reserved.
http://www.agnisoft.com

Description:
Form to allow user to choose a domain to connect to.
Can use different user credentials if necessary.
********************************************************)
unit unActiveDirectory_Dominio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Placemnt;

type
  TfrmChooseDomain = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    lblDomComp: TLabel;
    edtDomain: TEdit;
    Button1: TButton;
    Button2: TButton;
    chbUseOpenObject: TCheckBox;
    Bevel2: TBevel;
    lblNewUser: TLabel;
    lblPassword: TLabel;
    edtNewUser: TEdit;
    edtPassword: TEdit;
    FormStorage: TFormStorage;
    procedure RadioButton1Click(Sender: TObject);
    procedure chbUseOpenObjectClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  end;

var
  frmChooseDomain: TfrmChooseDomain;

implementation

{$R *.DFM}

procedure TfrmChooseDomain.RadioButton1Click(Sender: TObject);
begin
  lblDomComp.Caption := (Sender as TRadioButton).Caption;
end;

procedure TfrmChooseDomain.chbUseOpenObjectClick(Sender: TObject);
begin
  lblNewUser.Enabled := (Sender as TCheckbox).Checked;
  lblPassword.Enabled := lblNewUser.Enabled;
  edtNewUser.Enabled := lblNewUser.Enabled;
  edtPassword.Enabled := lblNewUser.Enabled;
end;

procedure TfrmChooseDomain.Button1Click(Sender: TObject);
begin
  if Trim(edtDomain.Text) = '' then
  begin
    ShowMessage('Seleccione un dominio.');
    edtDomain.SetFocus;
    ModalResult := mrNone;
  end;
  if chbUseOpenObject.Checked and (Trim(edtNewUser.Text)='') then
  begin
    ShowMessage('Debe indicar un nombre de usuario.');
    edtNewUser.SetFocus;
    ModalResult := mrNone;
  end;
end;

end.
