object fraFormWebDetalleRNS: TfraFormWebDetalleRNS
  Left = 0
  Top = 0
  Width = 400
  Height = 273
  TabOrder = 0
  DesignSize = (
    400
    273)
  object lblSecuencia: TLabel
    Left = 8
    Top = 7
    Width = 59
    Height = 13
    Caption = 'Transacci'#243'n'
  end
  object gbDetalle: TGroupBox
    Left = 0
    Top = 33
    Width = 400
    Height = 240
    Anchors = [akLeft, akTop, akRight, akBottom]
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
    object dbgRegistros: TDBGrid
      Left = 7
      Top = 16
      Width = 389
      Height = 219
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
          FieldName = 'op_Cuil'
          Title.Caption = 'Cuil'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_nombre'
          Title.Caption = 'Nombre'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_periodo'
          Title.Caption = 'Per'#237'odo'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_sueldobruto'
          Title.Caption = 'Masa Salarial'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_sueldo'
          Title.Caption = 'Sueldo'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_presentismo'
          Title.Caption = 'Presentismo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_premios'
          Title.Caption = 'Premios'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_bonus'
          Title.Caption = 'Bonus'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_antiguedad'
          Title.Caption = 'Antiguedad'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_viaticos'
          Title.Caption = 'Viaticos'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_refrigerio'
          Title.Caption = 'Refrigerio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_otrosconceptos'
          Title.Caption = 'Otros Conceptos'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_sac'
          Title.Caption = 'SAC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_vacaciones'
          Title.Caption = 'Vacaciones'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_horasextras'
          Title.Caption = 'Horas Extras'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'op_cantdiastrabajador'
          Title.Caption = 'D'#237'as Trabajados'
          Width = 86
          Visible = True
        end>
    end
  end
  object tbComandosDetalleAdicDetalle: TToolBar
    Left = 346
    Top = 1
    Width = 52
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
    object tbExport: TToolButton
      Left = 0
      Top = 2
      Caption = 'Exportar Grilla'
      ImageIndex = 3
      OnClick = tbExportClick
    end
    object tbPdf: TToolButton
      Left = 23
      Top = 2
      Hint = 'Ver PDF'
      Caption = 'Ver PDF'
      ImageIndex = 14
      OnClick = tbPdfClick
    end
  end
  object edNroTransaccion: TEdit
    Left = 73
    Top = 4
    Width = 101
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 2
  end
  object dsRegistros: TDataSource
    DataSet = sdqRegistros
    Left = 316
    Top = 88
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqRegistros
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
    Left = 316
    Top = 120
  end
  object sdqRegistros: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqRegistrosAfterOpen
    Left = 284
    Top = 88
  end
end
