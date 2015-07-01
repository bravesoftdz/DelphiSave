inherited fraSDA_DETALLEARCHIVO: TfraSDA_DETALLEARCHIVO
  Width = 437
  Height = 23
  Font.Name = 'Tahoma'
  ParentFont = False
  DesignSize = (
    437
    23)
  object Label1: TLabel
    Left = 0
    Top = 4
    Width = 65
    Height = 13
    Caption = 'Destino Papel'
  end
  object Label2: TLabel
    Left = 290
    Top = 4
    Width = 88
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Cantidad de Hojas'
  end
  object cmbDA_OPCION: TComboBox
    Left = 72
    Top = 0
    Width = 211
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
    OnChange = cmbDA_OPCIONChange
    Items.Strings = (
      'Digitalizaci'#243'n'
      'Guarda'
      'Archivo ART'
      'Sin Papel')
  end
  object edDA_HOJAS: TIntEdit
    Left = 382
    Top = 0
    Width = 53
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 1
    MaxLength = 3
  end
  object edDA_HOJASDef: TIntEdit
    Left = 412
    Top = 8
    Width = 21
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
    Visible = False
    MaxLength = 3
  end
end
