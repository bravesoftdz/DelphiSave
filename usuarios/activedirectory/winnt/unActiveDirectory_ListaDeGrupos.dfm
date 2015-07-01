object frmGroupList: TfrmGroupList
  Left = 404
  Top = 236
  Width = 257
  Height = 302
  Caption = 'Groups'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 13
    Caption = 'Grupos'
  end
  object lbGroups: TListBox
    Left = 8
    Top = 24
    Width = 233
    Height = 209
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = Button1Click
  end
  object Button1: TButton
    Left = 44
    Top = 240
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    ModalResult = 1
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 240
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  object lbGroupPath: TListBox
    Left = 128
    Top = 0
    Width = 89
    Height = 17
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object FormStorage: TFormStorage
    StoredValues = <>
    Left = 52
    Top = 92
  end
end
