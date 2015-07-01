inherited fraCuadroTarifario: TfraCuadroTarifario
  Width = 512
  Height = 92
  Constraints.MinHeight = 88
  Constraints.MinWidth = 464
  ExplicitWidth = 512
  ExplicitHeight = 92
  DesignSize = (
    512
    92)
  object lbCIIU: TLabel
    Left = 54
    Top = 4
    Width = 21
    Height = 13
    Caption = 'CIIU'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbNivel: TLabel
    Left = 456
    Top = 2
    Width = 23
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Nivel'
  end
  object lbPROCENTAJE_MASA_SALARIAL: TLabel
    Left = 35
    Top = 49
    Width = 42
    Height = 13
    Caption = '% Tarifa'
  end
  object lbDESC_MASA_SALARIAL: TLabel
    Left = 2
    Top = 71
    Width = 73
    Height = 13
    Caption = 'Desc. M. Salar.'
  end
  object lbDESC_HyS: TLabel
    Left = 156
    Top = 71
    Width = 63
    Height = 13
    Caption = 'Desc. H. y S.'
  end
  object lbMASA_SALARIAL: TLabel
    Left = 165
    Top = 49
    Width = 57
    Height = 13
    Caption = '% M. Salar.'
  end
  object lb_Tarifa: TLabel
    Left = 37
    Top = 27
    Width = 37
    Height = 13
    Caption = '$ Tarifa'
  end
  object lbSumaFija: TLabel
    Left = 162
    Top = 27
    Width = 55
    Height = 13
    Caption = '$ Suma Fija'
  end
  object lbTarifa: TLabel
    Left = 300
    Top = 27
    Width = 27
    Height = 13
    Caption = 'Tarifa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbCantEmpleados: TLabel
    Left = 329
    Top = 49
    Width = 56
    Height = 13
    Caption = 'Cant. Empl.'
  end
  object lbMasaSalarial: TLabel
    Left = 319
    Top = 71
    Width = 62
    Height = 13
    Caption = 'Masa Salarial'
  end
  object edNIVEL: TPatternEdit
    Left = 481
    Top = 0
    Width = 27
    Height = 21
    Anchors = [akTop, akRight]
    MaxLength = 1
    TabOrder = 1
    Pattern = '01234'
  end
  object edALICUOTAPESOS: TCurrencyEdit
    Left = 77
    Top = 23
    Width = 75
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    MaxLength = 9
    TabOrder = 2
    Value = 0.600000000000000000
    OnExit = edALICUOTAPESOSExit
  end
  object edSUMAFIJATARIFA: TCurrencyEdit
    Left = 221
    Top = 23
    Width = 75
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    Color = clActiveBorder
    Enabled = False
    TabOrder = 9
  end
  object edMASATOTAL: TCurrencyEdit
    Left = 386
    Top = 67
    Width = 75
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    MaxLength = 13
    MaxValue = 9999999999.990001000000000000
    TabOrder = 8
    OnExit = edMASATOTALExit
  end
  object edALICUOTAPORC: TCurrencyEdit
    Left = 77
    Top = 45
    Width = 75
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '0.0000'
    MaxLength = 7
    TabOrder = 3
    OnChange = edALICUOTAPORCChange
    OnExit = edALICUOTAPORCExit
  end
  object edPORCDESCVOLUMEN: TCurrencyEdit
    Left = 77
    Top = 67
    Width = 75
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00'
    MaxLength = 6
    TabOrder = 4
    OnExit = edPORCDESCVOLUMENExit
  end
  object edPORCDESCNIVEL: TCurrencyEdit
    Left = 221
    Top = 67
    Width = 75
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DisplayFormat = '0.00'
    MaxLength = 6
    TabOrder = 5
    OnExit = edPORCDESCNIVELExit
  end
  object edPORCMASATARIFA: TCurrencyEdit
    Left = 221
    Top = 45
    Width = 75
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    Color = clInactiveCaption
    DecimalPlaces = 4
    DisplayFormat = '0.0000'
    Enabled = False
    TabOrder = 10
  end
  object edTOTEMPLEADOS: TCurrencyEdit
    Left = 386
    Top = 45
    Width = 75
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    TabOrder = 7
  end
  inline fraTIPOTARIFA: TfraStaticCTB_TABLAS
    Left = 329
    Top = 22
    Width = 181
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    ExplicitLeft = 329
    ExplicitTop = 22
    ExplicitWidth = 181
    inherited cmbDescripcion: TComboGrid
      Width = 117
      ExplicitWidth = 117
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
  inline fraCIIU: TfraStaticActividad
    Left = 76
    Top = 0
    Width = 374
    Height = 22
    TabOrder = 0
    ExplicitLeft = 76
    ExplicitWidth = 374
    ExplicitHeight = 22
    inherited cmbDescripcion: TComboGrid
      Width = 310
      ExplicitWidth = 310
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja')
      ColWidths = (
        40
        300
        -1
        -1)
    end
  end
end
