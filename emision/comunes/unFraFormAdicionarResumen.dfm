object fraFormAdicionarResumen: TfraFormAdicionarResumen
  Left = 0
  Top = 0
  Width = 319
  Height = 50
  TabOrder = 0
  object lblFechaPresentacion: TLabel
    Left = 4
    Top = 29
    Width = 60
    Height = 13
    Caption = 'Fecha Pres.:'
  end
  object lblEmpleados: TLabel
    Left = 4
    Top = 5
    Width = 57
    Height = 15
    AutoSize = False
    Caption = 'Empleados:'
    WordWrap = True
  end
  object lblMasaSalarial: TLabel
    Left = 161
    Top = 5
    Width = 67
    Height = 17
    AutoSize = False
    Caption = 'Masa Salarial:'
    WordWrap = True
  end
  object edFechaPresentacion: TDateComboBox
    Left = 66
    Top = 26
    Width = 90
    Height = 20
    TabOrder = 2
  end
  object edEmpleados: TIntEdit
    Left = 66
    Top = 2
    Width = 89
    Height = 21
    TabOrder = 0
    Text = '0'
    Alignment = taRightJustify
    MaxLength = 6
    MaxValue = 999999
  end
  object edMasaSalarial: TCurrencyEdit
    Left = 229
    Top = 2
    Width = 80
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 $;-,0.00 $'
    MaxLength = 12
    MaxValue = 999999999.000000000000000000
    TabOrder = 1
    ZeroEmpty = False
  end
end
