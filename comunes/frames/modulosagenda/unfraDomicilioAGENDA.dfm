inherited fraDomicilioGISAGENDA: TfraDomicilioGISAGENDA
  Width = 596
  Height = 80
  inherited lbCalle: TLabel
    Left = 52
    Top = 28
  end
  inherited lbNro: TLabel
    Left = 420
    Top = 28
  end
  inherited lbPiso: TLabel
    Left = 484
    Top = 28
  end
  inherited lbDto: TLabel
    Left = 536
    Top = 28
  end
  inherited lbCPostal: TLabel
    Left = 36
    Top = 56
  end
  inherited lbCPA: TLabel
    Left = 136
    Top = 56
  end
  inherited lbLocalidad: TLabel
    Left = 244
    Top = 56
  end
  inherited lbProvincia: TLabel
    Left = 440
    Top = 56
  end
  object lbUbicacion: TLabel [8]
    Left = 8
    Top = 4
    Width = 54
    Height = 13
    Caption = 'Ubicaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited cmbCalle: TArtComboBox
    Left = 80
    Top = 24
    Width = 240
  end
  inherited edNumero: TEdit
    Left = 436
    Top = 24
  end
  inherited edPiso: TEdit
    Left = 508
    Top = 24
  end
  inherited edDto: TEdit
    Left = 560
    Top = 24
  end
  inherited edCPostal: TIntEdit
    Left = 80
    Top = 52
  end
  inherited cmbLocalidad: TArtComboBox
    Left = 292
    Top = 52
    Width = 140
  end
  inherited edProvincia: TEdit
    Left = 488
    Top = 52
  end
  inherited edCPA: TPatternEdit
    Left = 160
    Top = 52
  end
  inherited btnBuscar: TButton
    Left = 136
    Top = 24
  end
  inherited btnBuscarGIS: TAdvGlowButton
    Left = 324
    Top = 24
  end
  inherited btnMapaGIS: TAdvGlowButton
    Left = 368
    Top = 24
  end
  inherited sdqLocalidad: TSDQuery
    Top = 80
  end
  inherited dsLocalidad: TDataSource
    Top = 80
  end
  inherited TimerCuelgue: TTimer
    Top = 80
  end
end
