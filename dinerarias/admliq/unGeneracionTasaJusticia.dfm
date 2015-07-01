object frmGeneracionTasaJusticia: TfrmGeneracionTasaJusticia
  Left = 359
  Top = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Generaci'#243'n de tasa de justicia'
  ClientHeight = 146
  ClientWidth = 263
  Color = clBtnFace
  Constraints.MaxHeight = 173
  Constraints.MaxWidth = 271
  Constraints.MinHeight = 173
  Constraints.MinWidth = 271
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultPosOnly
  PixelsPerInch = 96
  TextHeight = 13
  object btnCancelarInt: TBitBtn
    Left = 176
    Top = 115
    Width = 81
    Height = 28
    Caption = '&Cancelar'
    TabOrder = 0
    Kind = bkCancel
  end
  object btnAceptarInt: TBitBtn
    Left = 94
    Top = 115
    Width = 75
    Height = 28
    Caption = '&Aceptar'
    TabOrder = 1
    OnClick = btnAceptarIntClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object GroupBox6: TGroupBox
    Left = 3
    Top = 4
    Width = 256
    Height = 104
    TabOrder = 2
    object Label6: TLabel
      Left = 138
      Top = 60
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total tasa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 138
      Top = 14
      Width = 110
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe liquidaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edSumaFija: TCurrencyEdit
      Left = 27
      Top = 69
      Width = 66
      Height = 20
      TabStop = False
      AutoSize = False
      Color = 15262169
      DisplayFormat = '$ ,0.00;$ -,0.00'
      ReadOnly = True
      TabOrder = 2
      OnChange = edSumaFijaChange
    end
    object edTasaJusticia: TCurrencyEdit
      Left = 139
      Top = 77
      Width = 90
      Height = 20
      TabStop = False
      AutoSize = False
      Color = 15262169
      DisplayFormat = '$ ,0.00;$ -,0.00'
      ReadOnly = True
      TabOrder = 3
    end
    object edCapital: TCurrencyEdit
      Left = 139
      Top = 31
      Width = 90
      Height = 20
      TabStop = False
      AutoSize = False
      Color = 15262169
      DisplayFormat = '$ ,0.00;$ -,0.00'
      ReadOnly = True
      TabOrder = 4
    end
    object rbPorcentajeTJ: TRadioButton
      Left = 8
      Top = 20
      Width = 77
      Height = 17
      Caption = 'Porcentaje'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbPorcentajeTJClick
    end
    object rbSumaFijaTJ: TRadioButton
      Left = 8
      Top = 46
      Width = 69
      Height = 17
      Caption = 'Suma fija'
      TabOrder = 1
      OnClick = rbPorcentajeTJClick
    end
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 3
    Top = 115
  end
end
