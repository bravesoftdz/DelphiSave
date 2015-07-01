inherited frmImportacionEstablecimientosSRT: TfrmImportacionEstablecimientosSRT
  Left = 516
  Top = 323
  Width = 450
  Height = 111
  Caption = 'Importacion Establecimientos SRT'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbArchivoOrigen: TLabel [0]
    Left = 12
    Top = 7
    Width = 70
    Height = 13
    Caption = 'Archivo Origen'
  end
  object btnImportar: TButton [1]
    Left = 281
    Top = 30
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Importar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnImportarClick
  end
  object edOrigen: TFilenameEdit [2]
    Left = 89
    Top = 4
    Width = 353
    Height = 22
    AcceptFiles = True
    Filter = 'Archivos Excel y Texto|*.xls;*.txt'
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
  end
  object btnCancelar: TButton [3]
    Left = 363
    Top = 30
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 6
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object StatusBar: TStatusBar [4]
    Left = 0
    Top = 58
    Width = 442
    Height = 19
    Panels = <>
  end
  inherited FormStorage: TFormStorage
    Top = 12
  end
  inherited XPMenu: TXPMenu
    Top = 12
  end
  inherited ilByN: TImageList
    Top = 40
  end
  inherited ilColor: TImageList
    Top = 40
  end
  inherited IconosXP: TImageList
    Top = 40
  end
end
