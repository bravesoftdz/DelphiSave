object fraFormAdicionarDetalle: TfraFormAdicionarDetalle
  Left = 0
  Top = 0
  Width = 400
  Height = 273
  TabOrder = 0
  DesignSize = (
    400
    273)
  object gbDetalle: TGroupBox
    Left = 0
    Top = 33
    Width = 400
    Height = 240
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
      400
      240)
    object lblSumEmple: TLabel
      Left = 5
      Top = 217
      Width = 74
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Total Registros:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblCantidadEncontrados: TLabel
      Left = 134
      Top = 217
      Width = 88
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Trab.Encontrados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSumCantPeriodos: TLabel
      Left = 277
      Top = 217
      Width = 68
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Trab. no Enc.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbgRegistros: TDBGrid
      Left = 7
      Top = 16
      Width = 389
      Height = 190
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsRegistros
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Cuil'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Periodo'
          Title.Caption = 'Per'#237'odo'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MasaSalarial'
          Title.Caption = 'Masa Salarial'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FechaPresentacion'
          Title.Caption = 'Fecha Presentaci'#243'n'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DiasTrabajados'
          Title.Caption = 'D'#237'as Trabajados'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ExisteTrabajador'
          Title.Caption = 'Existe Trabajador'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ExisteDDJJ'
          Title.Caption = 'Existe DDJJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Error'
          Width = 300
          Visible = True
        end>
    end
    object edTrabEncontrados: TIntEdit
      Left = 224
      Top = 216
      Width = 48
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
      TabOrder = 1
      Text = '0'
      Alignment = taRightJustify
    end
    object edTrabNoEncontrados: TIntEdit
      Left = 348
      Top = 216
      Width = 48
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
      TabOrder = 2
      Text = '0'
      Alignment = taRightJustify
    end
    object edTotalRegistros: TIntEdit
      Left = 81
      Top = 216
      Width = 48
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
      TabOrder = 3
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
  end
  object tbComandosDetalleAdicDetalle: TToolBar
    Left = 301
    Top = 1
    Width = 98
    Height = 29
    Align = alNone
    Anchors = [akTop, akRight]
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
    TabOrder = 1
    object tbAddFile: TToolButton
      Left = 0
      Top = 2
      Hint = 'Nuevo Archivo (Ctrl+N)'
      ImageIndex = 25
      OnClick = tbAddFileClick
    end
    object tbProcesar: TToolButton
      Left = 23
      Top = 2
      Hint = 'Procesar'
      Caption = 'Procesar'
      ImageIndex = 32
      OnClick = tbProcesarClick
    end
    object tbLimpiar: TToolButton
      Left = 46
      Top = 2
      Hint = 'Limpiar (Ctrl+L)'
      ImageIndex = 1
      OnClick = tbLimpiarClick
    end
    object tbExport: TToolButton
      Left = 69
      Top = 2
      Caption = 'Exportar Grilla'
      ImageIndex = 3
      OnClick = tbExportClick
    end
  end
  object edArchivo: TEdit
    Left = 8
    Top = 6
    Width = 289
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 2
  end
  object cdsRegistros: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Cuil'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Periodo'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'MasaSalarial'
        DataType = ftFloat
      end
      item
        Name = 'FechaPresentacion'
        DataType = ftDate
      end
      item
        Name = 'DiasTrabajados'
        DataType = ftInteger
      end
      item
        Name = 'ExisteTrabajador'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ExisteDDJJ'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'idDetalle'
        DataType = ftInteger
      end
      item
        Name = 'idddjj'
        DataType = ftInteger
      end
      item
        Name = 'idtrabajador'
        DataType = ftInteger
      end
      item
        Name = 'Error'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'cdsRegistrosIndex'
        Fields = 'Cuil'
        Options = [ixUnique]
      end>
    IndexName = 'cdsRegistrosIndex'
    Params = <>
    StoreDefs = True
    AfterOpen = cdsRegistrosAfterOpen
    Left = 352
    Top = 88
  end
  object dsRegistros: TDataSource
    DataSet = cdsRegistros
    Left = 384
    Top = 88
  end
  object OpenDialog: TOpenDialog
    Left = 352
    Top = 120
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = cdsRegistros
    Fields = <>
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 384
    Top = 120
  end
end
