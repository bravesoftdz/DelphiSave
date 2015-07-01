object frmCustomConsulta: TfrmCustomConsulta
  Left = 160
  Top = 215
  ClientHeight = 306
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FSFormDestroy
  AutoTabs = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFiltros: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 37
    Hint = 'pnlFiltros'
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object CoolBar: TCoolBar
    Left = 0
    Top = 37
    Width = 436
    Height = 29
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 430
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 423
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        ImageIndex = 0
        OnClick = tbRefrescarClick
      end
      object ToolButton5: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 14
        Style = tbsSeparator
        Visible = False
      end
      object tbNuevo: TToolButton
        Left = 31
        Top = 0
        Hint = 'Nuevo (Ctrl+N)'
        ImageIndex = 6
        Visible = False
      end
      object tbModificar: TToolButton
        Left = 54
        Top = 0
        Hint = 'Modificar (Ctrl+M)'
        Enabled = False
        ImageIndex = 7
        Visible = False
      end
      object tbEliminar: TToolButton
        Left = 77
        Top = 0
        Hint = 'Eliminar (Ctrl+Del)'
        Enabled = False
        ImageIndex = 8
        Visible = False
      end
      object ToolButton4: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
        Visible = False
      end
      object tbPropiedades: TToolButton
        Left = 108
        Top = 0
        Hint = 'Propiedades'
        ImageIndex = 13
        Visible = False
      end
      object ToolButton3: TToolButton
        Left = 131
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbLimpiar: TToolButton
        Left = 139
        Top = 0
        Hint = 'Limpiar (Ctrl+L)'
        ImageIndex = 1
        OnClick = tbLimpiarClick
      end
      object tbOrdenar: TToolButton
        Left = 162
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        ImageIndex = 2
        OnClick = tbOrdenarClick
      end
      object tbMostrarOcultarColumnas: TToolButton
        Left = 185
        Top = 0
        Hint = 'Mostrar / Ocultar Columnas'
        ImageIndex = 14
        Visible = False
        OnClick = tbMostrarOcultarColumnasClick
      end
      object ToolButton6: TToolButton
        Left = 208
        Top = 0
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbImprimir: TToolButton
        Left = 216
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Enabled = False
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      object tbExportar: TToolButton
        Left = 239
        Top = 0
        Hint = 'Exportar (Ctrl+E)'
        Enabled = False
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object tbEnviarMail: TToolButton
        Left = 262
        Top = 0
        Hint = 'Enviar E-Mail'
        Enabled = False
        ImageIndex = 31
        Visible = False
        OnClick = tbEnviarMailClick
      end
      object ToolButton8: TToolButton
        Left = 285
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbMostrarFiltros: TToolButton
        Left = 293
        Top = 0
        Hint = 'Ocultar Filtros'
        ImageIndex = 11
        Style = tbsCheck
        OnClick = tbMostrarFiltrosClick
      end
      object tbMaxRegistros: TToolButton
        Left = 316
        Top = 0
        Hint = 'Cantidad'
        ImageIndex = 12
        Style = tbsCheck
        OnClick = tbMaxRegistrosClick
      end
      object ToolButton11: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 347
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object Grid: TArtDBGrid
    Left = 0
    Top = 66
    Width = 436
    Height = 240
    Align = alClient
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = GridDblClick
    OnKeyDown = GridKeyDown
    IniStorage = FormStorage
    FooterBand = False
    TitleHeight = 17
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqConsultaAfterOpen
    Left = 24
    Top = 228
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 52
    Top = 228
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqConsulta
    SortFields = <>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 24
    Top = 256
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqConsulta
    Fields = <>
    IniStorage = FormStorage
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
    Left = 52
    Top = 256
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsConsulta
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
    SubTitle.Font.Charset = DEFAULT_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -13
    SubTitle.Font.Name = 'Tahoma'
    SubTitle.Font.Style = [fsBold]
    Headers.Color = 14211288
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clBlack
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
    PrinterOptions.PrintDialog = PrintDialog
    Left = 52
    Top = 284
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <>
    OnDisableComponent = SeguridadDisableComponent
    PermitirEdicion = True
    Left = 24
    Top = 200
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 52
    Top = 200
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 24
    Top = 284
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 80
    Top = 200
  end
  object FieldHider: TFieldHider
    IniStorage = FormStorage
    DBGrid = Grid
    SortDialog = SortDialog
    QueryPrint = QueryPrint
    ExportDialog = ExportDialog
    Left = 80
    Top = 228
  end
end
