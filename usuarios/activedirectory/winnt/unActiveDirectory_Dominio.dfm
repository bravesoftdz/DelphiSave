object frmChooseDomain: TfrmChooseDomain
  Left = 347
  Top = 286
  Width = 368
  Height = 248
  BorderIcons = [biSystemMenu]
  Caption = 'Choose Domain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 12
    Width = 345
    Height = 77
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Conectar a'
  end
  object lblDomComp: TLabel
    Left = 144
    Top = 24
    Width = 37
    Height = 13
    Caption = 'Dominio'
  end
  object Bevel2: TBevel
    Left = 8
    Top = 100
    Width = 345
    Height = 77
    Shape = bsFrame
  end
  object lblNewUser: TLabel
    Left = 16
    Top = 124
    Width = 36
    Height = 13
    Caption = 'Usuario'
    Enabled = False
  end
  object lblPassword: TLabel
    Left = 16
    Top = 148
    Width = 56
    Height = 13
    Caption = 'Contrase'#241'a'
    Enabled = False
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 32
    Width = 113
    Height = 17
    Caption = 'Dominio'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 56
    Width = 113
    Height = 17
    Caption = 'Equipo'
    TabOrder = 1
  end
  object edtDomain: TEdit
    Left = 144
    Top = 40
    Width = 201
    Height = 21
    TabOrder = 2
    Text = 'artprov.com.ar'
  end
  object Button1: TButton
    Left = 192
    Top = 184
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    ModalResult = 1
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 276
    Top = 184
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
  object chbUseOpenObject: TCheckBox
    Left = 24
    Top = 96
    Width = 193
    Height = 17
    Caption = 'Conectar usando otras credenciales'
    TabOrder = 5
    OnClick = chbUseOpenObjectClick
  end
  object edtNewUser: TEdit
    Left = 80
    Top = 120
    Width = 265
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object edtPassword: TEdit
    Left = 80
    Top = 144
    Width = 265
    Height = 21
    Enabled = False
    PasswordChar = '*'
    TabOrder = 7
  end
  object FormStorage: TFormStorage
    StoredValues = <>
    Left = 248
    Top = 8
  end
end
