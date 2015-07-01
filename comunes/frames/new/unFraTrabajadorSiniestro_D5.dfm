inherited fraTrabajadorSiniestro_D5: TfraTrabajadorSiniestro_D5
  object lbSiniestro: TLabel [0]
    Left = 300
    Top = 4
    Width = 40
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Siniestro'
  end
  inherited cmbNombre: TArtComboBox
    Width = 207
  end
  object edSiniestro: TSinEdit [3]
    Left = 344
    Top = 0
    Width = 100
    Height = 21
    Hint = 'C'#243'digo de Siniestro '
    Anchors = [akTop, akRight]
    TabOrder = 2
    OnSelect = edSiniestroSelect
  end
end
