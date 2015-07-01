object fraFormEscuelas: TfraFormEscuelas
  Left = 0
  Top = 0
  Width = 402
  Height = 311
  TabOrder = 0
  DesignSize = (
    402
    311)
  object gbDetalle: TGroupBox
    Left = 0
    Top = 30
    Width = 402
    Height = 281
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
      402
      281)
    object lblSumEmple: TLabel
      Left = 5
      Top = 257
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
      Top = 257
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
      Top = 257
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
    object lblTextoGestion: TLabel
      Left = 8
      Top = 176
      Width = 80
      Height = 13
      Caption = 'Texto Gesti'#243'n'
    end
    object dbgRegistros: TDBGrid
      Left = 7
      Top = 16
      Width = 391
      Height = 153
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
          FieldName = 'TotalMasaSalarial'
          Title.Caption = 'T. Masa Salarial'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MasaSalarialAdic'
          Title.Caption = 'Masa Adicionada'
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
      Top = 256
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
    object edTrabNoEncontrados: TIntEdit
      Left = 348
      Top = 256
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
    end
    object edTotalRegistros: TIntEdit
      Left = 81
      Top = 256
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
      TabOrder = 4
      Text = '0'
      Alignment = taRightJustify
      MaxLength = 0
    end
    object edTextoGestion: TMemo
      Left = 7
      Top = 192
      Width = 391
      Height = 58
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object tbComandosDetalle900_926: TToolBar
    Left = 321
    Top = 1
    Width = 76
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
  end
  object edArchivo: TEdit
    Left = 8
    Top = 6
    Width = 308
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
        Name = 'TotalMasaSalarial'
        DataType = ftFloat
      end
      item
        Name = 'MasaSalarialAdic'
        DataType = ftFloat
      end
      item
        Name = 'FechaPresentacion'
        DataType = ftDate
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
    IndexDefs = <>
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
end
