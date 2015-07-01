object frmGroup: TfrmGroup
  Left = 175
  Top = 166
  Width = 325
  Height = 449
  Caption = 'Grupo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    317
    415)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object lblName: TLabel
    Left = 68
    Top = 12
    Width = 37
    Height = 13
    Caption = 'lblName'
  end
  object lblType: TLabel
    Left = 68
    Top = 36
    Width = 34
    Height = 13
    Caption = 'lblType'
  end
  object Label3: TLabel
    Left = 8
    Top = 60
    Width = 54
    Height = 13
    Caption = 'Descripci'#243'n'
  end
  object Label4: TLabel
    Left = 8
    Top = 88
    Width = 45
    Height = 13
    Caption = 'Miembros'
  end
  object edtDesc: TEdit
    Left = 68
    Top = 56
    Width = 237
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'Edit1'
  end
  object lbMembers: TListBox
    Left = 8
    Top = 108
    Width = 297
    Height = 271
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object Button1: TButton
    Left = 120
    Top = 386
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Cerrar'
    ModalResult = 1
    TabOrder = 2
  end
  object FormStorage: TFormStorage
    StoredValues = <>
    Left = 156
    Top = 20
  end
end
