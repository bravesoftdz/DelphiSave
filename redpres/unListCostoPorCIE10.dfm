object frmListCostoPorCIE10: TfrmListCostoPorCIE10
  Left = 108
  Top = 250
  Width = 626
  Height = 321
  Caption = 'Listado de Costos por CIE10'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFiltros: TPanel
    Left = 4
    Top = 2
    Width = 438
    Height = 31
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    inline fraCIE10: TfraCIE10
      Left = 4
      Top = 4
      Width = 431
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      inherited cmbDescripcion: TArtComboBox
        Width = 340
      end
    end
  end
  object ToolBar: TToolBar
    Left = 445
    Top = 2
    Width = 170
    Height = 31
    Align = alNone
    Anchors = [akTop, akRight]
    BorderWidth = 1
    Caption = 'ToolBar'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.imgGenColor
    Images = frmPrincipal.imgGenBW
    TabOrder = 1
    object tbRefrescar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Refrescar (F5)'
      Caption = 'Refrescar'
      ImageIndex = 4
      OnClick = tbRefrescarClick
    end
    object tbOrdenar: TToolButton
      Left = 23
      Top = 0
      Hint = 'Ordenar (Ctrl+O)'
      Caption = 'tbOrdenar'
      ImageIndex = 5
      OnClick = tbOrdenarClick
    end
    object ToolButton5: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbExportar: TToolButton
      Left = 54
      Top = 0
      Hint = 'Exportar Datos (Ctrl+E)'
      ImageIndex = 1
      OnClick = tbExportarClick
    end
    object tbImprimir: TToolButton
      Left = 77
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      Caption = 'tbImprimir'
      ImageIndex = 7
      OnClick = tbImprimirClick
    end
    object ToolButton1: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object tbLimpiar: TToolButton
      Left = 108
      Top = 0
      Hint = 'Limpiar (Ctrl+L)'
      Caption = 'tbLimpiar'
      ImageIndex = 3
      OnClick = tbLimpiarClick
    end
    object ToolButton3: TToolButton
      Left = 131
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object tbSalir: TToolButton
      Left = 139
      Top = 0
      Caption = 'tbSalir'
      ImageIndex = 8
      OnClick = tbSalirClick
    end
  end
  object DBGrid: TArtDBGrid
    Left = 92
    Top = 40
    Width = 523
    Height = 251
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGridTitleClick
    OnGetCellParams = DBGridGetCellParams
    OnPaintFooter = DBGridPaintFooter
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'DG_CODIGO'
        Title.Caption = 'CIE10'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DESCRIPCION'
        Title.Caption = 'Descripcón'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CC_FECHA'
        Title.Caption = 'Fecha'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DIASLEVE'
        Title.Caption = 'Días Leve'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DIASMODERADO'
        Title.Caption = 'Días Moderado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_DIASGRAVE'
        Title.Caption = 'Días Grave'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASPROMEDIO'
        Title.Caption = 'Días Promedio'
        Visible = True
      end
      item
        Color = 14811135
        Expanded = False
        FieldName = 'DIASPROMEDIO_REAL'
        Title.Caption = 'Días Promedio Real'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CC_CASOSALTA'
        Title.Caption = 'Casos Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_COSTOLEVE'
        Title.Caption = 'Costos Leve'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_COSTOMODERADO'
        Title.Caption = 'Costos Moderado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DG_COSTOGRAVE'
        Title.Caption = 'Costos Grave'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COSTOPROMEDIO'
        Title.Caption = 'Costos Promedio'
        Visible = True
      end
      item
        Color = 14811135
        Expanded = False
        FieldName = 'COSTOPROMEDIO_REAL'
        Title.Caption = 'Costos Promedio Real'
        Visible = True
      end
      item
        Color = 14811135
        Expanded = False
        FieldName = 'CC_CASOSPAGOS'
        Title.Caption = 'Casos Pagos'
        Visible = True
      end>
  end
  object lstFechas: TCheckListBox
    Left = 4
    Top = 40
    Width = 81
    Height = 251
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        OnShortCutPress = tbRefrescarClick
        LinkControl = tbRefrescar
      end
      item
        Key = 16463
        OnShortCutPress = tbOrdenarClick
        LinkControl = tbOrdenar
      end
      item
        Key = 16453
        OnShortCutPress = tbExportarClick
        LinkControl = tbExportar
      end
      item
        Key = 16457
        OnShortCutPress = tbImprimirClick
        LinkControl = tbImprimir
      end
      item
        Key = 16460
        OnShortCutPress = tbLimpiarClick
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end>
    Left = 164
    Top = 80
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    PermitirEdicion = True
    DBLogin = frmPrincipal.DBLogin
    Claves = <>
    Left = 220
    Top = 80
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'CIE10'
        DataField = 'DG_CODIGO'
        FieldIndex = 0
      end
      item
        Title = 'Descripcón'
        DataField = 'DG_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'CC_FECHA'
        FieldIndex = 0
      end
      item
        Title = 'Días Leve'
        DataField = 'DG_DIASLEVE'
        FieldIndex = 0
      end
      item
        Title = 'Días Moderado'
        DataField = 'DG_DIASMODERADO'
        FieldIndex = 0
      end
      item
        Title = 'Días Grave'
        DataField = 'DG_DIASGRAVE'
        FieldIndex = 0
      end
      item
        Title = 'Días Promedio'
        DataField = 'DIASPROMEDIO'
        FieldIndex = 0
      end
      item
        Title = 'Días Promedio Real'
        DataField = 'DIASPROMEDIO_REAL'
        FieldIndex = 0
      end
      item
        Title = 'Costos Alta'
        DataField = 'CC_CASOSALTA'
        FieldIndex = 0
      end
      item
        Title = 'Costos Leve'
        DataField = 'DG_COSTOLEVE'
        FieldIndex = 0
      end
      item
        Title = 'Costos Moderado'
        DataField = 'DG_COSTOMODERADO'
        FieldIndex = 0
      end
      item
        Title = 'Costos Grave'
        DataField = 'DG_COSTOGRAVE'
        FieldIndex = 0
      end
      item
        Title = 'Costos Promedio'
        DataField = 'COSTOPROMEDIO'
        FieldIndex = 0
      end
      item
        Title = 'Costos Promedio Real'
        DataField = 'COSTOPROMEDIO_REAL'
        FieldIndex = 0
      end
      item
        Title = 'Casos Pagos'
        DataField = 'CC_CASOSPAGOS'
        FieldIndex = 0
      end>
    IniStorage = FormStorage
    FixedRows = 0
    Left = 220
    Top = 108
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT DG_CODIGO, DG_DESCRIPCION, CC_FECHA,'
      '       DG_DIASLEVE, DG_DIASMODERADO, DG_DIASGRAVE, '
      
        '       ROUND((DG_DIASLEVE + DG_DIASMODERADO + DG_DIASGRAVE) / 3,' +
        ' 2) DIASPROMEDIO,'
      
        '       ROUND(CC_DIASCAIDOS / CC_CASOSALTA, 2)  DIASPROMEDIO_REAL' +
        ','
      '       CC_CASOSALTA,'
      '       DG_COSTOLEVE, DG_COSTOMODERADO, DG_COSTOGRAVE, '
      
        '       ROUND((DG_COSTOLEVE + DG_COSTOMODERADO + DG_COSTOGRAVE) /' +
        ' 3, 2) COSTOPROMEDIO,'
      '       ROUND(CC_IMPORTE / CC_CASOSPAGOS, 2)  COSTOPROMEDIO_REAL,'
      '       CC_CASOSPAGOS'
      'FROM CDG_DIAGNOSTICO, CCC_COSTOPORCIE10'
      'WHERE DG_CODIGO = CC_CIE10'
      'AND CC_FECHA = TO_DATE('#39'18/09/2000'#39' ,'#39'DD/MM/YYYY'#39')')
    Left = 164
    Top = 108
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 192
    Top = 108
  end
  object ExportDialog: TExportDialog
    DataSet = sdqDatos
    OutputFile = 'OperacionesProgramadas.txt'
    Separator = #9
    Quote = '"'
    RemoveCR = True
    RemoveLF = True
    Fields = <>
    Caption = 'Exportación de Datos'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      '´')
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    IniStorage = FormStorage
    Left = 248
    Top = 80
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'CIE10'
        TitleAlignment = taCenter
        DataField = 'DG_CODIGO'
        Alignment = taCenter
        TotalType = ttCount
        MaxLength = 5
      end
      item
        Title = 'Descripcón'
        DataField = 'DG_DESCRIPCION'
        MaxLength = 48
      end
      item
        Title = 'Fecha'
        TitleAlignment = taCenter
        DataField = 'CC_FECHA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Días Leve'
        TitleAlignment = taCenter
        DataField = 'DG_DIASLEVE'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'D.Moderado'
        TitleAlignment = taCenter
        DataField = 'DG_DIASMODERADO'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'Días Grave'
        TitleAlignment = taCenter
        DataField = 'DG_DIASGRAVE'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'D.Promedio'
        TitleAlignment = taCenter
        DataField = 'DIASPROMEDIO'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'D.Prom.Real'
        TitleAlignment = taCenter
        DataField = 'DIASPROMEDIO_REAL'
        Alignment = taRightJustify
        FormatFloat = '0.00'
        MaxLength = 10
      end
      item
        Title = 'Costos Alta'
        TitleAlignment = taCenter
        DataField = 'CC_CASOSALTA'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'Costos Leve'
        TitleAlignment = taCenter
        DataField = 'DG_COSTOLEVE'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'C.Moderado'
        TitleAlignment = taCenter
        DataField = 'DG_COSTOMODERADO'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'Costos Grave'
        TitleAlignment = taCenter
        DataField = 'DG_COSTOGRAVE'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'C.Promedio'
        TitleAlignment = taCenter
        DataField = 'COSTOPROMEDIO'
        Alignment = taRightJustify
        MaxLength = 10
      end
      item
        Title = 'C.Prom.Real'
        TitleAlignment = taCenter
        DataField = 'COSTOPROMEDIO_REAL'
        Alignment = taRightJustify
        FormatFloat = '0.00'
        MaxLength = 10
      end
      item
        Title = 'Casos Pagos'
        TitleAlignment = taCenter
        DataField = 'CC_CASOSPAGOS'
        Alignment = taRightJustify
        MaxLength = 10
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Costos por CIE10'
    SubTitle.Font.Charset = ANSI_CHARSET
    SubTitle.Font.Color = clWindowText
    SubTitle.Font.Height = -8
    SubTitle.Font.Name = 'Small Fonts'
    SubTitle.Font.Style = [fsBold]
    SubTitle.Alignment = taLeftJustify
    Headers.Color = 11184810
    Headers.Font.Charset = DEFAULT_CHARSET
    Headers.Font.Color = clWhite
    Headers.Font.Height = -8
    Headers.Font.Name = 'Tahoma'
    Headers.Font.Style = [fsBold]
    Detail.Color = 14737632
    Detail.Font.Charset = DEFAULT_CHARSET
    Detail.Font.Color = clWindowText
    Detail.Font.Height = -8
    Detail.Font.Name = 'Tahoma'
    Detail.Font.Style = []
    Detail.GridLinesWidth = 0
    Footer.Font.Charset = DEFAULT_CHARSET
    Footer.Font.Color = clWindowText
    Footer.Font.Height = -8
    Footer.Font.Name = 'Tahoma'
    Footer.Font.Style = []
    Totals.Color = 14079702
    Totals.Font.Charset = DEFAULT_CHARSET
    Totals.Font.Color = clWindowText
    Totals.Font.Height = -8
    Totals.Font.Name = 'Tahoma'
    Totals.Font.Style = []
    Totals.TotalsStyle = tsFillOnlyData
    SubTotals.Color = 12961221
    SubTotals.Font.Charset = DEFAULT_CHARSET
    SubTotals.Font.Color = clWindowText
    SubTotals.Font.Height = -8
    SubTotals.Font.Name = 'Tahoma'
    SubTotals.Font.Style = []
    SubTotals.TotalsStyle = tsFillOnlyData
    PageOrientation = pxLandscape
    PageSize = psLetter
    Left = 248
    Top = 108
  end
  object FormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 192
    Top = 80
  end
  object PrintDialog: TPrintDialog
    Left = 276
    Top = 109
  end
end
