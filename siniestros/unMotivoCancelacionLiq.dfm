inherited frmMotivoCancelacionLiq: TfrmMotivoCancelacionLiq
  Left = 130
  Top = 162
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Motivo de Cancelaci'#243'n'
  ClientHeight = 65
  ClientWidth = 381
  OldCreateOrder = True
  DesignSize = (
    381
    65)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 1
    Top = 13
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Motivo'
  end
  inline fraMotivoCancelacion: TfraStaticCTB_TABLAS [1]
    Left = 44
    Top = 8
    Width = 332
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      332
      23)
    inherited cmbDescripcion: TComboGrid
      Width = 268
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja'
        'TB_CLAVE'
        'TB_ESPECIAL1')
      ColWidths = (
        40
        300
        -1
        -1
        -1
        -1)
    end
  end
  object btnAceptar: TButton [2]
    Left = 224
    Top = 37
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton [3]
    Left = 299
    Top = 37
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
  inherited FormStorage: TFormStorage [4]
    Left = 96
    Top = 188
  end
  inherited XPMenu: TXPMenu [5]
    Left = 124
    Top = 188
  end
  inherited ilByN: TImageList [6]
    Left = 96
    Top = 216
  end
  inherited ilColor: TImageList [7]
    Left = 124
    Top = 216
  end
  inherited IconosXP: TImageList
    Left = 152
    Top = 216
  end
end
