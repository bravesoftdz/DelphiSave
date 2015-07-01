inherited fraProspectosAGENDA: TfraProspectosAGENDA
  Height = 112
  Font.Name = 'Tahoma'
  ParentFont = False
  DesignSize = (
    445
    112)
  object lbProspecto: TLabel [0]
    Left = 8
    Top = 6
    Width = 57
    Height = 13
    Caption = 'Prospecto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbRSocial: TLabel [1]
    Left = 168
    Top = 32
    Width = 60
    Height = 13
    Caption = 'Raz'#243'n Social'
    FocusControl = edRazonSocial
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbCUIT: TLabel [2]
    Left = 36
    Top = 32
    Width = 40
    Height = 13
    Caption = 'C.U.I.T.'
  end
  object lbActividad: TLabel [3]
    Left = 12
    Top = 60
    Width = 65
    Height = 13
    Caption = 'Actividad real'
  end
  object lbTrabajadores: TLabel [4]
    Left = 12
    Top = 88
    Width = 64
    Height = 13
    Caption = 'Trabajadores'
  end
  object lbMasaSalarial: TLabel [5]
    Left = 176
    Top = 88
    Width = 61
    Height = 13
    Caption = 'Masa salarial'
  end
  object mskCUIT: TMaskEdit [6]
    Left = 80
    Top = 28
    Width = 82
    Height = 21
    Hint = 'CUIT de la Empresa'
    EditMask = '99-99999999-9;0;'
    MaxLength = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = mskCUITExit
  end
  object edRazonSocial: TEdit [7]
    Left = 232
    Top = 28
    Width = 205
    Height = 21
    Hint = 'Raz'#243'n Social de la Empresa'
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  inline fraActividadReal: TfraActividad [8]
    Left = 79
    Top = 56
    Width = 361
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object edTrabajadores: TIntEdit [9]
    Left = 80
    Top = 84
    Width = 89
    Height = 21
    TabOrder = 3
  end
  object edMasaSalarial: TCurrencyEdit [10]
    Left = 244
    Top = 84
    Width = 105
    Height = 21
    AutoSize = False
    TabOrder = 4
  end
  inherited sdqDatos: TSDQuery [11]
    Left = 380
    Top = 4
  end
  inherited dsDatos: TDataSource
    Left = 408
    Top = 4
  end
end
