object frmCargaNominaDskSolicitud: TfrmCargaNominaDskSolicitud
  Left = 339
  Top = 193
  Width = 650
  Height = 400
  Caption = 'Carga de N'#243'minas de Solicitudes desde Diskette.'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 650
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    642
    374)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 325
    Width = 640
    Height = 17
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object BarProgreso: TJvSpecialProgress
    Left = 84
    Top = 139
    Width = 554
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsSingle
    Caption = 'BarProgreso'
    Color = clGray
    EndColor = clLime
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Position = 50
    Solid = True
    StartColor = clGreen
    Step = 1
    TextCentered = True
    TextOption = toPercent
  end
  object GroupBox5: TGroupBox
    Left = 2
    Top = -2
    Width = 637
    Height = 39
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      637
      39)
    object lbCUIT: TLabel
      Left = 138
      Top = 16
      Width = 28
      Height = 13
      Caption = 'CUIT:'
    end
    object Label7: TLabel
      Left = 3
      Top = 15
      Width = 56
      Height = 13
      Caption = 'Nro. Interno'
    end
    inline fraEmpresa: TfraEmpresaSolicitud
      Left = 168
      Top = 11
      Width = 463
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited lbContrato: TLabel
        Left = 228
        Visible = False
      end
      inherited lbFormulario: TLabel
        Left = 335
      end
      inherited edContrato: TIntEdit
        Left = 273
        TabOrder = 3
        Visible = False
      end
      inherited cmbRSocial: TArtComboBox
        Width = 203
      end
      inherited edFormulario: TPatternEdit
        Left = 387
        TabOrder = 2
      end
    end
    object edSA_NROINTERNO: TCardinalEdit
      Left = 62
      Top = 12
      Width = 71
      Height = 21
      TabOrder = 1
      OnExit = edSA_NROINTERNOExit
      OnKeyPress = edSA_NROINTERNOKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 37
    Width = 635
    Height = 97
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Identificaci'#243'n de la Empresa'
    TabOrder = 1
    DesignSize = (
      635
      97)
    object lbEstablecimento: TLabel
      Left = 152
      Top = 21
      Width = 74
      Height = 13
      Caption = 'Establecimiento'
    end
    object Label1: TLabel
      Left = 34
      Top = 46
      Width = 39
      Height = 13
      Caption = 'Archivo:'
    end
    object Label2: TLabel
      Left = 34
      Top = 21
      Width = 39
      Height = 13
      Caption = 'Periodo:'
    end
    object edFilename: TFilenameEdit
      Left = 76
      Top = 42
      Width = 532
      Height = 21
      Filter = 'Hojas de C'#225'lculo (*.xls)|*.xls'
      DialogOptions = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
      DialogTitle = 'Selecci'#243'n de archivo externo'
      Color = clBtnFace
      DirectInput = False
      Anchors = [akLeft, akTop, akRight]
      NumGlyphs = 1
      TabOrder = 2
    end
    object chkBajas: TCheckBox
      Left = 76
      Top = 72
      Width = 292
      Height = 17
      Caption = 'Dar de baja a los trabajadores no incluidos en el archivo.'
      TabOrder = 4
    end
    object edPeriodo: TPeriodoPicker
      Left = 76
      Top = 17
      Width = 49
      Height = 21
      TabOrder = 0
      Color = clWindow
      Periodo.AllowNull = False
      Periodo.Orden = poAnoMes
      Periodo.Separador = '/'
      Periodo.Mes = 1
      Periodo.Ano = 2004
      Periodo.Valor = '2004/01'
      Periodo.MaxPeriodo = '2053/12'
      Periodo.MinPeriodo = '1954/01'
      WidthMes = 19
      Separation = 0
      ShowButton = False
      ShowOrder = poAnoMes
      ReadOnly = False
      Enabled = True
      Fuente.Charset = DEFAULT_CHARSET
      Fuente.Color = clWindowText
      Fuente.Height = -11
      Fuente.Name = 'MS Sans Serif'
      Fuente.Style = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NullDropDown = SetMax
    end
    inline fraEstablecimiento: TfraCodigoDescripcion
      Left = 228
      Top = 16
      Width = 404
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 339
      end
    end
    object btnVerFormato: TBitBtn
      Left = 609
      Top = 41
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      TabStop = False
      OnClick = btnVerFormatoClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000525252005252
        5200525252005252520052525200525252005252520052525200525252005252
        52005252520052525200525252005252520052525200FF00FF00A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6006363FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C6000000FF00C6C6C600C6C6C6000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C6000000FF006363FF006363FF000000
        FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A5007373
        7300C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600737373007373730073737300737373007373730073737300737373007373
        730073737300737373007373730073737300C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60052525200A5A5A500A5A5
        A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
        A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500FF00FF00}
    end
  end
  object btnProcesar: TButton
    Left = 5
    Top = 138
    Width = 75
    Height = 25
    Caption = '&Procesar'
    TabOrder = 2
    OnClick = btnProcesarClick
  end
  object btnImprimir: TButton
    Left = 412
    Top = 347
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Imprimir'
    TabOrder = 5
    OnClick = btnImprimirClick
  end
  object btnGrabar: TButton
    Left = 489
    Top = 347
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Grabar'
    TabOrder = 6
    OnClick = btnGrabarClick
  end
  object btnSalir: TButton
    Left = 566
    Top = 347
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Salir'
    TabOrder = 7
    OnClick = btnSalirClick
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 296
    Width = 539
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'Resultados'
    TabOrder = 4
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
    Top = 166
    Width = 642
    Height = 128
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = mnuGrid
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    MultiSelect = True
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'MP_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_APELLIDO'
        Title.Caption = 'Apellido'
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
        FieldName = 'MP_ERROR'
        Title.Caption = 'Error'
        Width = 557
        Visible = True
      end>
  end
  object pnComputerUser: TPanel
    Left = 4
    Top = 346
    Width = 192
    Height = 24
    Anchors = [akLeft, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'select *'
      'from tmp_afinomi'
      'where mp_valido = '#39'N'#39)
    Left = 322
    Top = 189
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 350
    Top = 189
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <
      item
        Title = 'CUIL'
        DataField = 'MP_CUIL'
        Width = 350
        MaxLength = 0
        DataFormat = False
      end
      item
        Title = 'Apellido'
        DataField = 'MP_APELLIDO'
        Width = 1000
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
    Top = 189
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    MaxPage = 2147483647
    Options = [poPageNums]
    Left = 378
    Top = 189
  end
  object mnuGrid: TPopupMenu
    Left = 432
    Top = 190
    object mnuIgnorar: TMenuItem
      Caption = 'Ignorar Error'
      OnClick = mnuIgnorarClick
    end
  end
end
