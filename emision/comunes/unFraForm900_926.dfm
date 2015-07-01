object fraForm900_926: TfraForm900_926
  Left = 0
  Top = 0
  Width = 428
  Height = 246
  TabOrder = 0
  object lblTotalHojas: TLabel
    Left = 8
    Top = 12
    Width = 57
    Height = 13
    Caption = 'Total Hojas:'
  end
  object lblCodigoRectificativa: TLabel
    Left = 165
    Top = 13
    Width = 87
    Height = 13
    Caption = 'C'#243'd. Rectificativa:'
  end
  object lblFechaPresentacion: TLabel
    Left = 164
    Top = 37
    Width = 60
    Height = 13
    Caption = 'Fecha Pres.:'
  end
  object edTotalHojas: TIntEdit
    Left = 69
    Top = 9
    Width = 80
    Height = 21
    Hint = 'Total de Hojas'
    TabOrder = 0
    MaxLength = 2
  end
  object edCodigoRectificativa: TPatternEdit
    Left = 290
    Top = 9
    Width = 25
    Height = 21
    Hint = 'C'#243'digo de la Rectificativa'
    MaxLength = 2
    TabOrder = 1
  end
  object chkConTicket: TCheckBox
    Left = 7
    Top = 36
    Width = 141
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Con Ticket'
    TabOrder = 2
    OnClick = chkConTicketClick
  end
  object edFechaPresentacion: TDateComboBox
    Left = 227
    Top = 32
    Width = 90
    Height = 21
    TabOrder = 3
  end
  object gbDetalle: TGroupBox
    Left = 0
    Top = 62
    Width = 428
    Height = 184
    Align = alBottom
    Caption = 'Detalle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      428
      184)
    object lblTotalEmpxHoja: TLabel
      Left = 8
      Top = 19
      Width = 87
      Height = 13
      Caption = 'Total Emp. x Hoja:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblTotalMasaSalxHoja: TLabel
      Left = 9
      Top = 40
      Width = 110
      Height = 13
      Caption = 'Total Masa Sal. x Hoja:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblSumEmpleHojas: TLabel
      Left = 6
      Top = 160
      Width = 85
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Total. Empleados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSumMasaSalHojas: TLabel
      Left = 155
      Top = 160
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
    object lblSumCantHojas: TLabel
      Left = 311
      Top = 160
      Width = 58
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Cant. Hojas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edTotalEmpleadosxHoja: TIntEdit
      Left = 121
      Top = 16
      Width = 79
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 6
      MaxValue = 999999
    end
    object edTotalMasaSalarialxHoja: TCurrencyEdit
      Left = 121
      Top = 38
      Width = 79
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 $;-,0.00 $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 12
      MaxValue = 999999999.000000000000000000
      ParentFont = False
      TabOrder = 1
      ZeroEmpty = False
    end
    object tbComandosDetalle900_926: TToolBar
      Left = 210
      Top = 20
      Width = 81
      Height = 29
      Align = alNone
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object tbAddHoja: TToolButton
        Left = 0
        Top = 2
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 28
        OnClick = tbAddHojaClick
      end
      object tbDeleteHoja: TToolButton
        Left = 23
        Top = 2
        Hint = 'Modificar (Ctrl+M)'
        ImageIndex = 27
        OnClick = tbDeleteHojaClick
      end
      object tbLimpiarHoja: TToolButton
        Left = 46
        Top = 2
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 1
        OnClick = tbLimpiarHojaClick
      end
    end
    object dbgDetalleHoja: TDBGrid
      Left = 7
      Top = 61
      Width = 408
      Height = 92
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsDetalleHoja
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Empleados'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MasaSalarial'
          Title.Caption = 'Masa Salarial'
          Width = 221
          Visible = True
        end>
    end
    object edSumMasaSalHojas: TCurrencyEdit
      Left = 234
      Top = 159
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
      TabOrder = 4
    end
    object edSumCantHojas: TCurrencyEdit
      Left = 372
      Top = 159
      Width = 43
      Height = 16
      TabStop = False
      AutoSize = False
      Color = 16051436
      Ctl3D = False
      DisplayFormat = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Anchors = [akLeft, akBottom]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edSumEmpleHojas: TIntEdit
      Left = 93
      Top = 159
      Width = 58
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
      TabOrder = 6
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
  end
  object cdsDetalleHoja: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Empleados'
        DataType = ftInteger
      end
      item
        Name = 'MasaSalarial'
        DataType = ftFloat
      end
      item
        Name = 'idDetalleHoja'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 360
    Top = 8
  end
  object dsDetalleHoja: TDataSource
    DataSet = cdsDetalleHoja
    Left = 392
    Top = 8
  end
end
