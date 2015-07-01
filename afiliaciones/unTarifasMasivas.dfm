object frmTarifasMasivas: TfrmTarifasMasivas
  Left = 224
  Top = 114
  ActiveControl = fraCodigoModulo.edCodigo
  Caption = 'Generaci'#243'n de Tarifas Masivas'
  ClientHeight = 440
  ClientWidth = 640
  Color = clBtnFace
  Constraints.MinHeight = 470
  Constraints.MinWidth = 646
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    640
    440)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 403
    Width = 541
    Height = 39
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Resultados'
    TabOrder = 2
    object Label4: TLabel
      Left = 5
      Top = 16
      Width = 86
      Height = 13
      Caption = 'Total Procesados:'
    end
    object Label5: TLabel
      Left = 194
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Total con Error:'
    end
    object Label6: TLabel
      Left = 368
      Top = 16
      Width = 75
      Height = 13
      Caption = 'Total Correctos:'
    end
    object edTotal: TIntEdit
      Left = 94
      Top = 12
      Width = 87
      Height = 21
      TabOrder = 0
      Text = '0'
      MaxLength = 0
    end
    object edError: TIntEdit
      Left = 270
      Top = 12
      Width = 87
      Height = 21
      TabOrder = 1
      Text = '0'
      MaxLength = 0
    end
    object edCorrectos: TIntEdit
      Left = 446
      Top = 12
      Width = 87
      Height = 21
      TabOrder = 2
      Text = '0'
      MaxLength = 0
    end
  end
  object Grid: TArtDBGrid
    Left = 0
    Top = 211
    Width = 639
    Height = 192
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    MultiSelect = True
    OnContextPopup = GridContextPopup
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_CONTRATO'
        Title.Caption = 'Contrato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NROLINEA'
        Title.Caption = 'Nro. Registro'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_CIIU'
        Title.Caption = 'C'#243'digo del CIIU'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_ERROR'
        Title.Caption = 'Error'
        Width = 557
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 640
    Height = 175
    Align = alTop
    Caption = 'Identificaci'#243'n de la Empresa'
    TabOrder = 0
    DesignSize = (
      640
      175)
    object Label10: TLabel
      Left = 326
      Top = 68
      Width = 38
      Height = 13
      Caption = 'Autoriz'#243
    end
    object Label1: TLabel
      Left = 7
      Top = 124
      Width = 39
      Height = 13
      Caption = 'Archivo:'
    end
    object Label3: TLabel
      Left = 337
      Top = 20
      Width = 27
      Height = 13
      Caption = 'T&exto'
    end
    object Label7: TLabel
      Left = 4
      Top = 44
      Width = 40
      Height = 13
      AutoSize = False
      Caption = '&Firmante'
    end
    object Label8: TLabel
      Left = 326
      Top = 44
      Width = 38
      Height = 13
      Caption = 'Fo&rmato'
    end
    object Label9: TLabel
      Left = 11
      Top = 68
      Width = 33
      Height = 13
      AutoSize = False
      Caption = 'C&orreo'
    end
    object Label2: TLabel
      Left = 12
      Top = 92
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object Label12: TLabel
      Left = 9
      Top = 20
      Width = 35
      Height = 13
      AutoSize = False
      Caption = 'M'#243'd&ulo'
    end
    object edFilename: TFilenameEdit
      Left = 47
      Top = 120
      Width = 560
      Height = 21
      Filter = 'Archivo XLS (*.xls)|*.xls'
      DialogOptions = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
      DialogTitle = 'Selecci'#243'n de archivo externo'
      Color = clBtnFace
      DirectInput = False
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 7
    end
    inline fraCtbTablasCorreo: TfraStaticCTB_TABLAS
      Left = 48
      Top = 64
      Width = 272
      Height = 24
      TabOrder = 4
      ExplicitLeft = 48
      ExplicitTop = 64
      ExplicitWidth = 272
      ExplicitHeight = 24
      inherited cmbDescripcion: TComboGrid
        Width = 208
        ExplicitWidth = 208
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline fraCodigoCodTexto: TfraStaticCodigoDescripcion
      Left = 368
      Top = 16
      Width = 266
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 368
      ExplicitTop = 16
      ExplicitWidth = 266
      ExplicitHeight = 24
      inherited cmbDescripcion: TComboGrid
        Width = 203
        ExplicitWidth = 203
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
    inline fraCtbTablasTipoSalida: TfraStaticCTB_TABLAS
      Left = 368
      Top = 40
      Width = 266
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 368
      ExplicitTop = 40
      ExplicitWidth = 266
      inherited cmbDescripcion: TComboGrid
        Width = 202
        ExplicitWidth = 202
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline fraCodigoCodFirmante: TfraStaticCodigoDescripcion
      Left = 48
      Top = 40
      Width = 272
      Height = 24
      TabOrder = 2
      ExplicitLeft = 48
      ExplicitTop = 40
      ExplicitWidth = 272
      ExplicitHeight = 24
      inherited cmbDescripcion: TComboGrid
        Width = 209
        ExplicitWidth = 209
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
    inline fraEN_MOTIVO: TfraStaticCTB_TABLAS
      Left = 48
      Top = 88
      Width = 274
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      ExplicitLeft = 48
      ExplicitTop = 88
      ExplicitWidth = 274
      ExplicitHeight = 24
      inherited cmbDescripcion: TComboGrid
        Width = 210
        ExplicitWidth = 210
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    inline fraCodigoModulo: TfraStaticCodigoDescripcion
      Left = 48
      Top = 16
      Width = 272
      Height = 25
      TabOrder = 0
      ExplicitLeft = 48
      ExplicitTop = 16
      ExplicitWidth = 272
      ExplicitHeight = 25
      inherited cmbDescripcion: TComboGrid
        Width = 209
        ExplicitWidth = 209
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
    object btnCargar: TButton
      Left = 8
      Top = 146
      Width = 72
      Height = 25
      Caption = '&Cargar'
      TabOrder = 8
      OnClick = btnCargarClick
    end
    object BarProgreso: TProgressBar
      Left = 85
      Top = 150
      Width = 547
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      Position = 50
      Smooth = True
      TabOrder = 9
    end
    object ToolBar1: TToolBar
      Left = 605
      Top = 118
      Width = 29
      Height = 26
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      object tbFormatoContrato: TToolButton
        Left = 0
        Top = 0
        Hint = 'Ver Formato...'
        Caption = 'tbFormatoContrato'
        ImageIndex = 40
        OnClick = tbFormatoContratoClick
      end
    end
    inline fraUsuarioAutoriza: TfraCodDesc
      Left = 368
      Top = 64
      Width = 266
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      ExplicitLeft = 368
      ExplicitTop = 64
      ExplicitWidth = 266
      inherited cmbDescripcion: TArtComboBox
        Width = 201
        ExplicitWidth = 201
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'BAJA'
        FieldCodigo = 'CODIGO'
        FieldDesc = 'DESCRIPCION'
        FieldID = 'ID'
        TableName = 'usuarios'
      end
    end
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 179
    Width = 637
    Height = 29
    Align = alNone
    Anchors = [akLeft, akTop, akRight]
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 631
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 624
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbGuardar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Proceso Generaci'#243'n de Tarifas'
        Caption = 'tbGuardar'
        Enabled = False
        ImageIndex = 3
        OnClick = tbGuardarClick
      end
      object ToolButton4: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
        Visible = False
      end
      object tbLimpiar: TToolButton
        Left = 31
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object tbOrdenar: TToolButton
        Left = 54
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Enabled = False
        ImageIndex = 2
        OnClick = tbOrdenarClick
      end
      object ToolButton6: TToolButton
        Left = 77
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 85
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Enabled = False
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      object tbExportar: TToolButton
        Left = 108
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Enabled = False
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object ToolButton8: TToolButton
        Left = 131
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 4
        Style = tbsSeparator
        Visible = False
      end
      object tbSalir: TToolButton
        Left = 139
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select *'
      'from tmp_tarifamasiva'
      'where mp_valido = '#39'N'#39)
    Left = 322
    Top = 216
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 350
    Top = 216
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'Contrato'
        DataField = 'MP_CONTRATO'
        Width = 350
        MaxLength = 0
        DataFormat = False
      end
      item
        Title = 'Nro. Linea'
        DataField = 'MP_NROLINEA'
        Width = 200
        MaxLength = 0
        DataFormat = False
      end
      item
        Title = 'Error'
        DataField = 'MP_ERROR'
        MaxLength = 0
        DataFormat = False
      end>
    DataSource = dsConsulta
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Carga Masiva de Trabajadores'
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    SubTitle.Alignment = taLeftJustify
    SubTitle.PrintOptions = poFirstPage
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -11
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = clWhite
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLines = [glHorizontal, glVertical]
    Detail.GridLinesWidth = 0
    Detail.MultiLine = mlAuto
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxPortrait
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 406
    Top = 216
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    MaxPage = 2147483647
    Options = [poPageNums]
    Left = 378
    Top = 216
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <>
    FixedRows = 0
    Left = 294
    Top = 244
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
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
    Left = 322
    Top = 244
  end
  object ExcelWB: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 294
    Top = 280
  end
  object ExcelWS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 326
    Top = 280
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 358
    Top = 280
  end
end
