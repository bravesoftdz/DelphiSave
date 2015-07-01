object frmListDiasCaidos: TfrmListDiasCaidos
  Left = 306
  Top = 202
  Width = 526
  Height = 257
  Caption = 'Control de D'#237'as Ca'#237'dos'
  Color = clBtnFace
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
  DesignSize = (
    518
    230)
  PixelsPerInch = 96
  TextHeight = 13
  object dbgListado: TArtDBGrid
    Left = 4
    Top = 32
    Width = 509
    Height = 194
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsDatos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FormPlacement
    RowColorsUse = True
    RowColor1 = clWindow
    RowColor2 = clInfoBk
    OnPaintFooter = dbgListadoPaintFooter
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'EX_SINIESTRO'
        Title.Caption = 'Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ORDEN'
        Title.Caption = 'Orden'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_RECAIDA'
        Title.Caption = 'Reca'#237'da'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIT'
        Title.Caption = 'CUIT'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'R.Social'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIL'
        Title.Caption = 'CUIL'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_BAJAMEDICA'
        Title.Caption = 'Baja M'#233'dica'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICOOMS'
        Title.Caption = 'CIE10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICO'
        Title.Caption = 'Diagn'#243'stico'
        Width = 247
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECAIDAS'
        Title.Caption = 'Rec.Anteriores'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAXEVO'
        Title.Caption = 'Ult.Movi.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_FECHAALTA'
        Title.Caption = 'Fecha de Alta'
        Width = 68
        Visible = True
      end>
  end
  object CoolBar1: TCoolBar
    Left = 340
    Top = 0
    Width = 176
    Height = 29
    Align = alNone
    Anchors = [akLeft, akTop, akRight]
    Bands = <
      item
        Break = False
        Control = ToolBar1
        ImageIndex = -1
        Width = 172
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 159
      Height = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      Images = frmPrincipal.imgGenBW
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'Refrescar (F5)'
        ImageIndex = 4
        OnClick = tbRefrescarClick
      end
      object ToolButton1: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbOrden: TToolButton
        Left = 31
        Top = 0
        Hint = 'Orden (Ctrl+O)'
        ImageIndex = 5
        OnClick = tbOrdenClick
      end
      object Sep1: TToolButton
        Left = 54
        Top = 0
        Width = 8
        Caption = 'Sep1'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbExportar: TToolButton
        Left = 62
        Top = 0
        Hint = 'Exportar Datos (Ctrl+E)'
        ImageIndex = 1
        OnClick = tbExportarClick
      end
      object tbImprimir: TToolButton
        Left = 85
        Top = 0
        Hint = 'Imprimir Resultados (Ctrl+I)'
        Caption = 'tbImprimir'
        ImageIndex = 7
        OnClick = tbImprimirClick
      end
      object ToolButton4: TToolButton
        Left = 108
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 116
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'Salir'
        ImageIndex = 8
        OnClick = tbSalirClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 29
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      337
      29)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Tipo de Listado'
    end
    object cmbTipoListado: TComboBox
      Left = 84
      Top = 4
      Width = 249
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Control de 7 d'#237'as'
        'Control de 15 d'#237'as'
        'Control de 30 d'#237'as'
        'Control de 60 d'#237'as'
        'Control de denuncias')
    end
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 16
    Top = 79
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 44
    Top = 79
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
        OnShortCutPress = tbOrdenClick
        LinkControl = tbOrden
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
        Key = 16467
        OnShortCutPress = tbSalirClick
        LinkControl = tbSalir
      end>
    Left = 72
    Top = 79
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT ex_siniestro, ex_orden, ex_recaida, '
      '       nvl(ex_fecharecaida, ex_fechaaccidente) FECHA,  '
      '       ex_cuit, mp_nombre, ex_cuil, tj_nombre, ex_bajamedica, '
      '       ex_diagnosticooms,  ex_diagnostico, '
      
        '       Amebpba.Get_Recaidas(ex_siniestro, ex_orden, ex_recaida) ' +
        'RECAIDAS,  '
      
        '       Amebpba.Get_Maxevo(ex_siniestro, ex_orden, ex_recaida) MA' +
        'XEVO, ex_fechaalta'
      'FROM ctj_trabajadores, cmp_empresas, sex_expedientes  '
      'WHERE ex_cuit = mp_cuit  '
      'AND ex_cuil = tj_cuil  '
      'AND ex_altamedica is null  '
      ''
      'AND 1=2')
    Left = 16
    Top = 108
  end
  object dsDatos: TDataSource
    DataSet = sdqDatos
    Left = 44
    Top = 108
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'EX_SINIESTRO'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Orden'
        DataField = 'EX_ORDEN'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Reca'#237'da'
        DataField = 'EX_RECAIDA'
        Order = otAscending
        FieldIndex = 0
      end
      item
        Title = 'Fecha'
        DataField = 'FECHA'
        FieldIndex = 0
      end
      item
        Title = 'CUIT'
        DataField = 'EX_CUIT'
        FieldIndex = 0
      end
      item
        Title = 'R.Social'
        DataField = 'MP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'CUIL'
        DataField = 'EX_CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Nombre'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Baja M'#233'dica'
        DataField = 'EX_BAJAMEDICA'
        FieldIndex = 0
      end
      item
        Title = 'CIE10'
        DataField = 'EX_DIAGNOSTICOOMS'
        FieldIndex = 0
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'EX_DIAGNOSTICO'
        FieldIndex = 0
      end
      item
        Title = 'Rec.Anteriores'
        DataField = 'RECAIDAS'
        FieldIndex = 0
      end
      item
        Title = 'Ult.Movi.'
        DataField = 'MAXEVO'
        FieldIndex = 0
      end
      item
        Title = 'Fecha de Alta'
        DataField = 'EX_FECHAALTA'
        FieldIndex = 0
      end>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 72
    Top = 108
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blBottom]
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'EX_SINIESTRO'
        TotalType = ttCount
        MaxLength = 8
      end
      item
        Title = 'Ord.'
        TitleAlignment = taCenter
        DataField = 'EX_ORDEN'
        Alignment = taCenter
        MaxLength = 3
      end
      item
        Title = 'Rec.'
        TitleAlignment = taCenter
        DataField = 'EX_RECAIDA'
        Alignment = taCenter
        MaxLength = 3
      end
      item
        Title = 'Fecha'
        DataField = 'FECHA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'CUIT'
        TitleAlignment = taCenter
        DataField = 'EX_CUIT'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'R.Social'
        DataField = 'MP_NOMBRE'
        MaxLength = 25
      end
      item
        Title = 'CUIL'
        TitleAlignment = taCenter
        DataField = 'EX_CUIL'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Nombre'
        DataField = 'TJ_NOMBRE'
        MaxLength = 25
      end
      item
        Title = 'Baja M'#233'dica'
        DataField = 'EX_BAJAMEDICA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Rec.Anteriores'
        DataField = 'RECAIDAS'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Ult.Movi.'
        DataField = 'MAXEVO'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'Fecha Alta'
        DataField = 'EX_FECHAALTA'
        Alignment = taCenter
        MaxLength = 9
      end
      item
        Title = 'CIE10'
        TitleAlignment = taCenter
        DataField = 'EX_DIAGNOSTICOOMS'
        Alignment = taCenter
        MaxLength = 8
      end
      item
        Title = 'Diagn'#243'stico'
        DataField = 'EX_DIAGNOSTICO'
        MaxLength = 20
      end>
    DataSource = dsDatos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'MS Sans Serif'
    Title.Font.Style = [fsBold]
    Title.Logo.Alignment = taLeftJustify
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
    PageOrientation = pxLandscape
    Left = 16
    Top = 137
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    Fields = <>
    Quote = '"'
    QuoteList.Strings = (
      '{NINGUNO}'
      '"'
      #39
      '`'
      #180)
    Rows = 0
    Separator = #9
    SeparatorList.Strings = (
      '{NINGUNO}'
      '{TAB}'
      ';'
      ':')
    Left = 44
    Top = 137
  end
  object PrintDialog: TPrintDialog
    Left = 72
    Top = 137
  end
end
