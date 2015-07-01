object fraForm931: TfraForm931
  Left = 0
  Top = 0
  Width = 352
  Height = 167
  TabOrder = 0
  object lblCodigoRectificativa: TLabel
    Left = 8
    Top = 13
    Width = 87
    Height = 13
    Caption = 'C'#243'd. Rectificativa:'
  end
  object lblNumeroVerificador_1: TLabel
    Left = 183
    Top = 13
    Width = 76
    Height = 13
    Caption = 'Nro. Verificador:'
  end
  object lblEmpleados: TLabel
    Left = 8
    Top = 36
    Width = 57
    Height = 15
    AutoSize = False
    Caption = 'Empleados:'
    WordWrap = True
  end
  object lblMasaSalarial: TLabel
    Left = 183
    Top = 36
    Width = 67
    Height = 17
    AutoSize = False
    Caption = 'Masa Salarial:'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 7
    Top = 97
    Width = 70
    Height = 15
    AutoSize = False
    Caption = 'Tipo N'#243'mina:'
    WordWrap = True
  end
  object lblNotaRelac: TLabel
    Left = 184
    Top = 77
    Width = 49
    Height = 13
    Cursor = crHandPoint
    Caption = 'Ver Relac.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    Visible = False
    OnClick = lblNotaRelacClick
  end
  object btnBuscarNotaRelac: TSpeedButton
    Left = 302
    Top = 74
    Width = 20
    Height = 19
    Hint = 'B'#250'squeda Autom'#225'tica'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000084C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C000000000000000000000000000000000000000000000
      00000000840000FF000084C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0848484C6C6C6
      C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000840000FF0000FF000084C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0848484FFFFFFFF0000FF0000FF0000FF000000008400
      FFFF0000FFC6C6C60000FF000084000000C0C0C0C0C0C0C0C0C0848484FFFFFF
      C6C6C6FFFFFFC6C6C6FFFFFF0000FF0000FFC6C6C6C6C6C60000FF0000840000
      00C0C0C0C0C0C0C0C0C0848484FFFFFFFF0000FF0000FF0000FF0000FF0000FF
      0000FFFFFFC6C6C60000000000FF000084C0C0C0C0C0C0C0C0C0848484FFFFFF
      C6C6C6FFFFFFC6C6C6FFFFFFC6C6C6FFFFFFC6C6C6C6C6C60000000000FF0000
      84C0C0C0C0C0C0C0C0C0848484FFFFFFFF0000FF0000FF0000FF0000FF0000FF
      0000FFFFFFC6C6C6000000C6C6C60000FF000084C0C0C0C0C0C0848484FFFFFF
      FFFFFFFFFFFFC6C6C6FFFFFFC6C6C6FFFFFFC6C6C6C6C6C6000000C6C6C60000
      FF000084C0C0C0C0C0C0848484FFFFFF000084000084000084000084FFFFFFC6
      C6C6FFFFFFC6C6C6000000C6C6C60000000000FF000084C0C0C0848484FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6C6C6C6000000C6C6C60000
      00C0C0C00000FF000084848484FFFFFF0000FF0000FF000084FFFFFFFFFFFFC6
      C6C6FFFFFFC6C6C6000000C6C6C6000000C0C0C0C0C0C00000FF848484FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6000000C6C6C60000
      00C0C0C0C0C0C0C0C0C084848484848484848484848484848484848484848484
      8484848484848484000000C6C6C6000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C60000
      00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C084848484848484848484848484848484
      8484848484848484848484848484000000C0C0C0C0C0C0C0C0C0}
    ParentShowHint = False
    ShowHint = True
    OnClick = btnBuscarNotaRelacClick
  end
  object btnBuscarManualNotaRelac: TSpeedButton
    Left = 324
    Top = 74
    Width = 20
    Height = 19
    Hint = 'B'#250'squeda Manual'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000CCCCCC382F27
      43302C140C0ACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      CCCCCCCCCCCCCCCCCCCCCCCCCC95ADBE7790DBAE9094150C0ACCCCCCCCCCCCCC
      CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC6AC4F2
      60BAF37085D3AF9294130B0ACCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC62C4F33CBFFF6E89DBA98E930C0A0ACC
      CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC0C0A0A
      0D0E1F2E729C2DB2FF6786CD453A3C22111475605C8B7C784F3F3C0A0A0A0A0A
      0A100A0A0A0A0ACCCCCCCCCCCCBA8462BC8769B98062A9C2CFB3C1C9C4ABA4E5
      DAC2E5E5DCE5E5E5E5E5E3B39F9C704738D0A9927C5039CCCCCCCCCCCCDFCFB5
      D8E5E5D8E4E5D7E1E2CCC4C3DDCCB8E0E1C8DEDFCCDDDFD5E0E3E5E5E5E2A098
      97D1E0E4978377CCCCCCCCCCCCDAC5A6CCDDE5C9D1D4C6CED2CEC2BAD7D0BAD3
      CDB9D5D6C9D5D6D2D7D8D8E2E5DBC5BCAFB7BDC1927D70CCCCCCCCCCCCDAC4A6
      CDDDE5CAD2D4C7CCD0D2C8BDD3CDB8D1CAB6D2D4C3D3D6CAD5D8CDDDE1CFCEC5
      B5BABDC1937A6CCCCCCCCCCCCCDAC3A6CFDDE5CBD3D5CBD1D6CEC5BCD9D8C5D5
      CCBCD5D0BAD6D5C3D7D6C4E4E5CCC2B0A1C9CFD3947A69CCCCCCCCCCCCDBC3A6
      D0DEE5CCD3D4CDD6D7CAC6C6D3CBC7DCDFE1DCD6C3DCD0B7E0DCC2DBCCB5B5AA
      AAE0E5E5907460CCCCCCCCCCCCDCC4A6CFDCE5CAD1D2CCD2D3CAD0D3C6C2C3CF
      C8C3D8D0BEDDD2BCD7C9B9C0B3B1C8D1D6E5E5E58F7159CCCCCCCCCCCCDCC6AA
      D0DFE5CCD3D7CCD4D8CDD6DACDD7DCC6C9CCBEBABDC4C0C4C7C9CED0DBE1D4DE
      E4E4E5E591745CCCCCCCCCCCCCDAC8B0D2E3E5CFDADFD0DBDFD0DBDFD0DBE0D1
      DEE3D3E0E5D2E0E5D3DFE4D4DEE3D4DFE1E5E5E595785DCCCCCCCCCCCCBE782D
      BF813FC1823DC1803CC1823DC1823DC1803CC1803CBF7F39C68D4DC78C48BF8D
      53B49C8C81521CCCCCCCCCCCCCD57F1CE5851AE3800FE57F0FE37E0BE58010E2
      810EE47B07E17801E78211EA850FE3861FCB86497A460BCCCCCC}
    ParentShowHint = False
    ShowHint = True
    OnClick = btnBuscarManualNotaRelacClick
  end
  object edCodigoRectificativa: TPatternEdit
    Left = 142
    Top = 9
    Width = 25
    Height = 21
    Hint = 'C'#243'digo de la Rectificativa'
    MaxLength = 2
    TabOrder = 0
  end
  object edEmpleados: TIntEdit
    Left = 85
    Top = 33
    Width = 83
    Height = 21
    TabOrder = 2
    Text = '0'
    Alignment = taRightJustify
    MaxLength = 6
    MaxValue = 999999
  end
  object edMasaSalarial: TCurrencyEdit
    Left = 262
    Top = 33
    Width = 80
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 $;-,0.00 $'
    MaxLength = 12
    MaxValue = 999999999.000000000000000000
    TabOrder = 3
  end
  object chkSinEmpleados: TCheckBox
    Left = 7
    Top = 56
    Width = 162
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Sin Empleados'
    TabOrder = 4
  end
  object chkConTicket: TCheckBox
    Left = 181
    Top = 57
    Width = 161
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Con Ticket'
    TabOrder = 5
    OnClick = chkConTicketClick
  end
  object gbTicket: TGroupBox
    Left = 0
    Top = 117
    Width = 352
    Height = 50
    Align = alBottom
    Caption = 'Ticket'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object lblNumeroVerificador_2: TLabel
      Left = 9
      Top = 20
      Width = 76
      Height = 13
      Caption = 'Nro. Verificador:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblFechaPresentacion: TLabel
      Left = 183
      Top = 21
      Width = 60
      Height = 13
      Caption = 'Fecha Pres.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtFechaPresentacion: TDateComboBox
      Left = 255
      Top = 17
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edNumeroVerificador_2: TPatternEdit
      Left = 89
      Top = 17
      Width = 78
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 0
      OnExit = edNumeroVerificadorExit
      Pattern = '0123456789'
    end
  end
  object edNumeroVerificador_1: TPatternEdit
    Left = 262
    Top = 9
    Width = 80
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 1
    OnExit = edNumeroVerificadorExit
    Pattern = '0123456789'
  end
  object chkErrorV8: TCheckBox
    Left = 7
    Top = 75
    Width = 162
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Error V28'
    TabOrder = 6
  end
  inline fraTipoNomina: TfraCodigoDescripcionExt
    Left = 85
    Top = 93
    Width = 261
    Height = 23
    TabOrder = 7
    inherited cmbDescripcion: TArtComboBox
      Left = 32
      Width = 228
    end
    inherited edCodigo: TPatternEdit
      Width = 28
    end
  end
end
