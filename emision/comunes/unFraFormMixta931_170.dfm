object fraFormMixta931_170: TfraFormMixta931_170
  Left = 0
  Top = 0
  Width = 429
  Height = 479
  TabOrder = 0
  object gbfrm931: TGroupBox
    Left = 0
    Top = 41
    Width = 413
    Height = 178
    Align = alTop
    Caption = 'Formulario 931'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    inline fraForm931: TfraForm931
      Left = 2
      Top = 15
      Width = 409
      Height = 158
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited lblCodigoRectificativa: TLabel
        ParentFont = False
      end
      inherited lblNumeroVerificador_1: TLabel
        Left = 176
        ParentFont = False
      end
      inherited lblEmpleados: TLabel
        ParentFont = False
      end
      inherited lblMasaSalarial: TLabel
        Left = 176
        ParentFont = False
      end
      inherited lblNotaRelac: TLabel
        OnClick = nil
      end
      inherited btnBuscarNotaRelac: TSpeedButton
        OnClick = nil
      end
      inherited edCodigoRectificativa: TPatternEdit
        ParentFont = False
      end
      inherited edEmpleados: TIntEdit
        ParentFont = False
        OnChange = fraForm931edEmpleadosChange
      end
      inherited edMasaSalarial: TCurrencyEdit
        Left = 255
        ParentFont = False
        OnChange = fraForm931edMasaSalarialChange
      end
      inherited chkSinEmpleados: TCheckBox
        ParentFont = False
      end
      inherited chkConTicket: TCheckBox
        Left = 174
        ParentFont = False
      end
      inherited gbTicket: TGroupBox
        Left = 1
        Top = 112
        Width = 407
        Height = 46
        Align = alCustom
      end
      inherited edNumeroVerificador_1: TPatternEdit
        Left = 255
      end
    end
    object pnl931: TPanel
      Left = 338
      Top = 11
      Width = 70
      Height = 81
      BevelOuter = bvNone
      TabOrder = 1
      object lblNotaRelac931: TLabel
        Left = 6
        Top = 30
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
        OnClick = lblNotaRelac931Click
      end
      object btnBuscarNotaRelac931: TSpeedButton
        Left = 14
        Top = 5
        Width = 22
        Height = 22
        Hint = 'B'#250'squeda Manual'
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
        Visible = False
        OnClick = btnBuscarNotaRelac931Click
      end
      object btnBuscarManualNotaRelac931: TSpeedButton
        Left = 37
        Top = 5
        Width = 22
        Height = 22
        Hint = 'B'#250'squeda Autom'#225'tica'
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
        Visible = False
        OnClick = btnBuscarManualNotaRelac931Click
      end
      object tbComandosNota931: TToolBar
        Left = 22
        Top = 49
        Width = 28
        Height = 28
        Align = alNone
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        HotImages = DmEmision.ilByN
        Images = DmEmision.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object btnLimpiarNota931: TToolButton
          Left = 0
          Top = 2
          Hint = 'Limpiar (Ctrl+L)'
          ImageIndex = 1
          OnClick = btnLimpiarNota931Click
        end
      end
    end
  end
  object gbfrm170: TGroupBox
    Left = 0
    Top = 219
    Width = 413
    Height = 296
    Align = alBottom
    BiDiMode = bdLeftToRight
    Caption = 'Formulario 170'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    inline fraForm170: TfraForm165_170
      Left = 2
      Top = 11
      Width = 408
      Height = 281
      TabOrder = 0
      inherited gbDetalle: TGroupBox
        inherited fraCondicion: TfraStaticCodigoDescripcion
          inherited cmbDescripcion: TComboGrid
            Width = 213
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
        inherited edSumMasaSalarial: TCurrencyEdit
          OnChange = fraForm170edSumMasaSalarialChange
        end
        inherited edSumTotalEmpleados: TIntEdit
          OnChange = fraForm170edSumTotalEmpleadosChange
        end
      end
      inherited cdsTrab: TClientDataSet
        Left = 237
        Top = 1
      end
      inherited dsTrab: TDataSource
        Left = 267
        Top = 1
      end
    end
    object pnl170: TPanel
      Left = 329
      Top = 11
      Width = 79
      Height = 81
      BevelOuter = bvNone
      TabOrder = 1
      object lblNotaRelac170: TLabel
        Left = 6
        Top = 30
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
        OnClick = lblNotaRelac170Click
      end
      object btnBuscarNotaRelac170: TSpeedButton
        Left = 22
        Top = 5
        Width = 22
        Height = 22
        Hint = 'B'#250'squeda Manual'
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
        Visible = False
        OnClick = btnBuscarNotaRelac170Click
      end
      object btnBuscarManualNotaRelac170: TSpeedButton
        Left = 45
        Top = 5
        Width = 22
        Height = 22
        Hint = 'B'#250'squeda Autom'#225'tica'
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
        Visible = False
        OnClick = btnBuscarManualNotaRelac170Click
      end
      object tbComandosNota170: TToolBar
        Left = 30
        Top = 49
        Width = 28
        Height = 28
        Align = alNone
        BorderWidth = 1
        Caption = 'ToolBar'
        EdgeBorders = []
        HotImages = DmEmision.ilByN
        Images = DmEmision.ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object btnLimpiarNota170: TToolButton
          Left = 0
          Top = 2
          Hint = 'Limpiar (Ctrl+L)'
          ImageIndex = 1
          OnClick = btnLimpiarNota170Click
        end
      end
    end
  end
  object gbTotalMixta: TGroupBox
    Left = 0
    Top = 0
    Width = 413
    Height = 41
    Align = alTop
    Caption = 'Totales Mixta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      413
      41)
    object lblSumTotalEmpleados: TLabel
      Left = 13
      Top = 17
      Width = 82
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Total Empleados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edSumlMasaSalarial: TLabel
      Left = 184
      Top = 17
      Width = 74
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Total Masa Sal:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edSumMasaSalarial: TCurrencyEdit
      Left = 263
      Top = 16
      Width = 72
      Height = 16
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DisplayFormat = '$ ,0.00;$ - ,0.00'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Anchors = [akLeft, akBottom]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edSumTotalEmpleados: TIntEdit
      Left = 99
      Top = 16
      Width = 72
      Height = 16
      TabStop = False
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
  end
end
