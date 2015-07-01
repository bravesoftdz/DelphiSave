inherited fraTrabajadorSinGrave: TfraTrabajadorSinGrave
  Width = 610
  Height = 46
  DesignSize = (
    610
    46)
  inherited lbSiniestro: TLabel
    Left = 318
    FocusControl = edSiniestro
  end
  object lbNroDenSRT: TLabel [1]
    Left = 136
    Top = 4
    Width = 86
    Height = 13
    Caption = 'N'#186' Denuncia SRT'
    FocusControl = edDG_NRODENUNCIASRT
  end
  object lbCUIL: TLabel [2]
    Left = 4
    Top = 4
    Width = 24
    Height = 13
    Caption = 'CUIL'
    FocusControl = mskCUIL
  end
  object Label1: TLabel [3]
    Left = 4
    Top = 28
    Width = 37
    Height = 13
    Caption = 'Nombre'
    FocusControl = cmbNombre
  end
  inherited mskCUIL: TMaskEdit
    Left = 48
  end
  inherited cmbNombre: TArtComboBox
    Left = 48
    Top = 24
    Width = 562
    TabOrder = 3
  end
  inherited edSiniestro: TSinEdit
    Left = 366
  end
  object edDG_NRODENUNCIASRT: TPatternEdit [7]
    Left = 228
    Top = 0
    Width = 81
    Height = 21
    TabOrder = 1
    OnKeyPress = edDG_NRODENUNCIASRTKeyPress
  end
  inherited sdqDatos: TSDQuery
    Left = 65532
    Top = 56
  end
  inherited dsDatos: TDataSource
    Left = 24
    Top = 56
  end
end
