inherited fraRespuestaCarta: TfraRespuestaCarta
  Width = 300
  Height = 27
  Constraints.MinHeight = 27
  Constraints.MinWidth = 300
  object lbAceptacion: TLabel
    Left = 3
    Top = 6
    Width = 57
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Aceptaci'#243'n:'
  end
  object lbFechaAceptacion: TLabel
    Left = 119
    Top = 6
    Width = 90
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Fecha Aceptaci'#243'n:'
  end
  object edFecha: TDateComboBox
    Left = 210
    Top = 2
    Width = 88
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 0
  end
  object cmbAceptacion: TComboBox
    Left = 62
    Top = 2
    Width = 55
    Height = 21
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      'Si'
      'No')
  end
end
