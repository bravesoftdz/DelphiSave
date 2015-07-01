inherited fraDomicilioEmpresa: TfraDomicilioEmpresa
  Width = 584
  Height = 69
  DesignSize = (
    584
    69)
  inherited lbNro: TLabel
    Left = 371
  end
  inherited lbPiso: TLabel
    Left = 443
  end
  inherited lbDto: TLabel
    Left = 519
  end
  inherited lbCPostal: TLabel
    Top = 28
  end
  inherited lbCPA: TLabel
    Left = 112
    Top = 28
  end
  inherited lbLocalidad: TLabel
    Left = 220
    Top = 28
  end
  inherited lbProvincia: TLabel
    Left = 424
    Top = 28
  end
  object lbTelefonos: TLabel [8]
    Left = 0
    Top = 52
    Width = 47
    Height = 13
    Caption = 'Tel'#233'fonos'
  end
  inherited cmbCalle: TArtComboBox
    Left = 52
    Width = 292
  end
  inherited edNumero: TEdit
    Left = 393
    TabOrder = 1
  end
  inherited edPiso: TEdit
    Left = 469
    TabOrder = 2
  end
  inherited edDto: TEdit
    Left = 540
    Width = 44
    TabOrder = 3
  end
  inherited edCPostal: TIntEdit
    Left = 52
    Top = 24
    TabOrder = 4
  end
  inherited cmbLocalidad: TArtComboBox
    Left = 272
    Top = 24
    Width = 145
    TabOrder = 6
  end
  inherited edProvincia: TEdit
    Left = 472
    Top = 24
    Width = 112
  end
  inherited edCPA: TPatternEdit
    Left = 138
    Top = 24
    TabOrder = 5
  end
  object edTelefonos: TEdit [17]
    Left = 52
    Top = 48
    Width = 532
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
  end
  inherited btnBuscar: TButton
    Left = 346
    Width = 21
    TabOrder = 9
  end
  inherited sdqLocalidad: TSDQuery
    Left = 300
    Top = 36
  end
  inherited dsLocalidad: TDataSource
    Left = 328
    Top = 36
  end
end
