inherited frmGrabarDocumentoCarpeta: TfrmGrabarDocumentoCarpeta
  Left = 179
  Top = 142
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Digitalizaci'#243'n y Guarda de Documentos'
  ClientHeight = 65
  ClientWidth = 549
  OldCreateOrder = True
  DesignSize = (
    549
    65)
  PixelsPerInch = 96
  TextHeight = 13
  object lblAclaracion: TLabel [0]
    Left = 3
    Top = 33
    Width = 387
    Height = 29
    AutoSize = False
    WordWrap = True
  end
  object btnAceptar: TButton [1]
    Left = 394
    Top = 37
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [2]
    Left = 472
    Top = 37
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  inline fraDetalleArchivo: TfraSDA_DETALLEARCHIVO [3]
    Left = 4
    Top = 8
    Width = 543
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      543
      23)
    inherited Label2: TLabel
      Left = 396
    end
    inherited cmbDA_OPCION: TComboBox
      Width = 317
    end
    inherited edDA_HOJAS: TIntEdit
      Left = 488
    end
    inherited edDA_HOJASDef: TIntEdit
      Left = 518
    end
  end
  inherited FormStorage: TFormStorage [4]
    Left = 16
    Top = 136
  end
  inherited XPMenu: TXPMenu [5]
    Left = 44
    Top = 136
  end
  inherited ilByN: TImageList [6]
    Left = 16
    Top = 164
  end
  inherited ilColor: TImageList [7]
    Left = 44
    Top = 164
  end
  inherited IconosXP: TImageList
    Left = 72
    Top = 164
  end
end
