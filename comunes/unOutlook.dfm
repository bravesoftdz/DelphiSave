inherited frmOutlook: TfrmOutlook
  Left = 283
  Top = 172
  Width = 639
  Height = 466
  BorderIcons = [biSystemMenu]
  Caption = 'Correo Electr'#243'nico | Administraci'#243'n'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 280
    Top = 68
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object tvFolders: TTreeView [1]
    Left = 8
    Top = 32
    Width = 257
    Height = 401
    Anchors = [akLeft, akTop, akBottom]
    Indent = 19
    TabOrder = 0
    OnChange = tvFoldersChange
  end
  object Button1: TButton [2]
    Left = 8
    Top = 4
    Width = 109
    Height = 25
    Caption = 'Traer carpetas'
    TabOrder = 1
    OnClick = Button1Click
  end
  inherited FormStorage: TFormStorage
    Left = 144
  end
  inherited XPMenu: TXPMenu
    Left = 172
  end
  inherited ilByN: TImageList
    Left = 144
  end
  inherited ilColor: TImageList
    Left = 172
  end
end
