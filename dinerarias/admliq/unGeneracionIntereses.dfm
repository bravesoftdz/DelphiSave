object frmGeneracionIntereses: TfrmGeneracionIntereses
  Left = 359
  Top = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Generaci'#243'n de intereses'
  ClientHeight = 209
  ClientWidth = 316
  Color = clBtnFace
  Constraints.MaxHeight = 236
  Constraints.MaxWidth = 324
  Constraints.MinHeight = 236
  Constraints.MinWidth = 324
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultPosOnly
  PixelsPerInch = 96
  TextHeight = 13
  object gbIntereses: TGroupBox
    Left = 6
    Top = 7
    Width = 305
    Height = 159
    TabOrder = 0
    object Label6: TLabel
      Left = 9
      Top = 133
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Intereses'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 25
      Top = 106
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Capital'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCalcularInt: TSpeedButton
      Left = 161
      Top = 128
      Width = 23
      Height = 24
      Hint = 'Calcular intereses'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      OnClick = btnCalcularIntClick
    end
    object edInteresesInt: TCurrencyEdit
      Left = 71
      Top = 130
      Width = 90
      Height = 20
      TabStop = False
      AutoSize = False
      Color = 15262169
      DisplayFormat = '$ ,0.00;$ -,0.00'
      ReadOnly = True
      TabOrder = 6
    end
    object edCapitalInt: TCurrencyEdit
      Left = 71
      Top = 103
      Width = 90
      Height = 20
      TabStop = False
      AutoSize = False
      Color = 15262169
      DisplayFormat = '$ ,0.00;$ -,0.00'
      TabOrder = 5
    end
    object rbRecapitInt: TRadioButton
      Left = 8
      Top = 12
      Width = 97
      Height = 17
      Caption = 'Recapitalizaci'#243'n'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbRecapitIntClick
    end
    object pnlFechasInt: TPanel
      Left = 5
      Top = 42
      Width = 136
      Height = 49
      BevelOuter = bvNone
      TabOrder = 3
      object Label9: TLabel
        Left = 8
        Top = 4
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label12: TLabel
        Left = 8
        Top = 28
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object edDesdeInt: TDateComboBox
        Left = 44
        Top = 1
        Width = 90
        Height = 21
        MaxDateCombo = edHastaInt
        Color = clWhite
        TabOrder = 0
        OnChange = edDesdeIntChange
      end
      object edHastaInt: TDateComboBox
        Left = 44
        Top = 25
        Width = 90
        Height = 21
        MinDateCombo = edDesdeInt
        Color = clWhite
        TabOrder = 1
        OnChange = edDesdeIntChange
      end
    end
    object rbActivaInt: TRadioButton
      Left = 108
      Top = 12
      Width = 81
      Height = 17
      Caption = 'Tasa activa'
      TabOrder = 1
      OnClick = rbRecapitIntClick
    end
    object rbPasivaInt: TRadioButton
      Left = 200
      Top = 12
      Width = 81
      Height = 17
      Caption = 'Tasa pasiva'
      TabOrder = 2
      OnClick = rbRecapitIntClick
    end
    object pnlTasasInt: TPanel
      Left = 145
      Top = 42
      Width = 142
      Height = 49
      BevelOuter = bvNone
      TabOrder = 4
      object Label13: TLabel
        Left = 4
        Top = 4
        Width = 60
        Height = 13
        Caption = 'Tasa original'
      end
      object Label67: TLabel
        Left = 4
        Top = 28
        Width = 46
        Height = 13
        Caption = 'Tasa final'
      end
      object edTasaOrigInt: TCurrencyEdit
        Left = 71
        Top = 1
        Width = 66
        Height = 21
        AutoSize = False
        Color = 15262169
        DecimalPlaces = 4
        DisplayFormat = ',0.0000;- ,0.0000'
        MaxValue = 9999.999900000000000000
        ReadOnly = True
        TabOrder = 0
        OnChange = edDesdeIntChange
      end
      object edTasaFinInt: TCurrencyEdit
        Left = 71
        Top = 25
        Width = 66
        Height = 21
        AutoSize = False
        Color = 15262169
        DecimalPlaces = 4
        DisplayFormat = ',0.0000;- ,0.0000'
        MaxValue = 9999.999900000000000000
        ReadOnly = True
        TabOrder = 1
        OnChange = edDesdeIntChange
      end
    end
  end
  object btnCancelarInt: TBitBtn
    Left = 234
    Top = 175
    Width = 75
    Height = 28
    Caption = '&Cancelar'
    TabOrder = 1
    Kind = bkCancel
  end
  object btnAceptarInt: TBitBtn
    Left = 154
    Top = 175
    Width = 75
    Height = 28
    Caption = '&Aceptar'
    TabOrder = 2
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
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 11
    Top = 179
  end
end
