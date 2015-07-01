object fraFormPagos: TfraFormPagos
  Left = 0
  Top = 0
  Width = 406
  Height = 231
  TabOrder = 0
  object lblNotaRelac: TLabel
    Left = 9
    Top = 7
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
    Left = 129
    Top = 6
    Width = 20
    Height = 19
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
    OnClick = btnBuscarNotaRelacClick
  end
  object btnBuscarManualNotaRelac: TSpeedButton
    Left = 151
    Top = 6
    Width = 20
    Height = 19
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
    OnClick = btnBuscarManualNotaRelacClick
  end
  object gbDetalle: TGroupBox
    Left = 0
    Top = 26
    Width = 406
    Height = 205
    Align = alBottom
    Caption = 'Detalle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      406
      205)
    object lbCUIL: TLabel
      Left = 8
      Top = 21
      Width = 24
      Height = 13
      Caption = 'CUIL'
      FocusControl = edCUIL
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblMasaSalarial: TLabel
      Left = 210
      Top = 21
      Width = 67
      Height = 17
      AutoSize = False
      Caption = 'Masa Salarial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblCondicion: TLabel
      Left = 8
      Top = 44
      Width = 50
      Height = 13
      Caption = 'Condici'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSumTotalEmpleados: TLabel
      Left = 10
      Top = 186
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
      Left = 169
      Top = 186
      Width = 77
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Total Masa Sal.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblFechaPresentacion: TLabel
      Left = 99
      Top = 67
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
    object Label6: TLabel
      Left = 352
      Top = 186
      Width = 48
      Height = 13
      Caption = 'Sin Ticket'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edCUIL: TMaskEdit
      Left = 72
      Top = 17
      Width = 83
      Height = 21
      Color = 16051436
      EditMask = '99-########-c;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edMasaSalarialCuil: TCurrencyEdit
      Left = 281
      Top = 17
      Width = 80
      Height = 21
      AutoSize = False
      Color = 16051436
      DisplayFormat = ',0.00 $;-,0.00 $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 12
      MaxValue = 999999999.000000000000000000
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ZeroEmpty = False
    end
    object tbComandosDetalle: TToolBar
      Left = 371
      Top = 13
      Width = 29
      Height = 31
      Align = alNone
      Anchors = [akLeft, akTop, akBottom]
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object tbModificar: TToolButton
        Left = 0
        Top = 2
        Hint = 'Modificar'
        ImageIndex = 3
        OnClick = tbModificarClick
      end
    end
    inline fraCondicion: TfraStaticCodigoDescripcion
      Left = 71
      Top = 39
      Width = 293
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      DesignSize = (
        293
        23)
      inherited edCodigo: TPatternEdit
        Width = 39
        Color = 16051436
        ReadOnly = True
      end
      inherited cmbDescripcion: TComboGrid
        Left = 42
        Width = 250
        Color = 16051436
        ReadOnly = True
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
    object dbgDetalleCUIL: TRxDBGrid
      Left = 9
      Top = 90
      Width = 393
      Height = 90
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsTrab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = dbgDetalleCUILGetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'Cuil'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MasaSalarial'
          Title.Caption = 'Masa Salarial'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ConTicket'
          Title.Caption = 'Ticket'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FechaPresentacion'
          Title.Caption = 'Fecha'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Condicion'
          Title.Caption = 'Condici'#243'n'
          Width = 210
          Visible = True
        end>
    end
    object edSumMasaSalarial: TCurrencyEdit
      Left = 251
      Top = 185
      Width = 72
      Height = 16
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DisplayFormat = '$ ,0.00;$ - ,0.00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Anchors = [akLeft, akBottom]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edSumTotalEmpleados: TIntEdit
      Left = 97
      Top = 185
      Width = 59
      Height = 16
      TabStop = False
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edFechaPresentacion: TDateComboBox
      Left = 161
      Top = 63
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object chkConTicket: TCheckBox
      Left = 6
      Top = 67
      Width = 79
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Con Ticket'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = chkConTicketClick
    end
    object Panel3: TPanel
      Left = 332
      Top = 184
      Width = 16
      Height = 16
      BevelOuter = bvNone
      Color = 13041606
      TabOrder = 9
    end
  end
  object cdsTrab: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Cuil'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MasaSalarial'
        DataType = ftFloat
      end
      item
        Name = 'IdCondicion'
        DataType = ftInteger
      end
      item
        Name = 'Condicion'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ConTicket'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FechaPresentacion'
        DataType = ftDate
      end
      item
        Name = 'idddjjTrabajador'
        DataType = ftInteger
      end
      item
        Name = 'SoloLectura'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'cdsTrab165_170Index'
        Fields = 'Cuil'
        Options = [ixUnique, ixDescending]
      end>
    IndexName = 'cdsTrab165_170Index'
    Params = <>
    StoreDefs = True
    AfterScroll = cdsTrabAfterScroll
    Left = 342
    Top = 3
  end
  object dsTrab: TDataSource
    DataSet = cdsTrab
    Left = 371
    Top = 3
  end
end
