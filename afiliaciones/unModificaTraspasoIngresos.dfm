object frmModificaTraspasoIngresos: TfrmModificaTraspasoIngresos
  Left = 216
  Top = 116
  Width = 785
  Height = 216
  Caption = 'Modificaci'#243'n Traspaso Ingresos'
  Color = clBtnFace
  Constraints.MinHeight = 215
  Constraints.MinWidth = 785
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 777
    Height = 27
    ButtonWidth = 25
    Caption = 'tlbControl'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    DesignSize = (
      773
      23)
    object tlbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl -  N)'
      Caption = 'tlbNuevo'
      ImageIndex = 6
      OnClick = tlbNuevoClick
    end
    object tlbModificacion: TToolButton
      Left = 25
      Top = 0
      Hint = 'Modificaci'#243'n (Ctrl-M)'
      Caption = 'tlbModificacion'
      ImageIndex = 7
      OnClick = tlbModificacionClick
    end
    object tlbBaja: TToolButton
      Left = 50
      Top = 0
      Hint = 'Baja (Ctrl-B)'
      Caption = 'tlbBaja'
      ImageIndex = 8
      OnClick = tlbBajaClick
    end
    object tblSeparador1: TToolButton
      Left = 75
      Top = 0
      Width = 5
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbOrdenar: TToolButton
      Left = 80
      Top = 0
      Caption = 'tbOrdenar'
      ImageIndex = 2
      OnClick = tbOrdenarClick
    end
    object tblSeparador2: TToolButton
      Left = 105
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tlbCartas: TToolButton
      Left = 110
      Top = 0
      Hint = 'Cartas'
      Caption = 'Cartas'
      ImageIndex = 30
      OnClick = tlbCartasClick
    end
    object ToolButton2: TToolButton
      Left = 135
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tbImprimir: TToolButton
      Left = 143
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      Caption = 'tbImprimir'
      DropdownMenu = mnuImprimir
      ImageIndex = 4
      Style = tbsDropDown
      OnClick = tbImprimirClick
    end
    object ToolButton3: TToolButton
      Left = 181
      Top = 0
      Width = 9
      Caption = 'ToolButton3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tlbSalir: TToolButton
      Left = 190
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = tlbSalirClick
    end
    object ToolButton1: TToolButton
      Left = 215
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object lbCUIT: TLabel
      Left = 223
      Top = 0
      Width = 6
      Height = 22
      Align = alTop
      AutoSize = False
      Caption = '          '
    end
    object Label2: TLabel
      Left = 229
      Top = 0
      Width = 28
      Height = 22
      Align = alClient
      Caption = 'CUIT '
      Layout = tlCenter
    end
    object edSA_CUIT: TMaskEdit
      Left = 257
      Top = 0
      Width = 81
      Height = 22
      TabStop = False
      AutoSize = False
      Color = clActiveBorder
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      ReadOnly = True
      TabOrder = 0
    end
    object Label1: TLabel
      Left = 338
      Top = 0
      Width = 49
      Height = 22
      Align = alClient
      Caption = '  Nombre: '
      Layout = tlCenter
    end
    object edSA_NOMBRE: TEdit
      Left = 387
      Top = 0
      Width = 249
      Height = 22
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Color = clActiveBorder
      ReadOnly = True
      TabOrder = 1
    end
    object Label3: TLabel
      Left = 636
      Top = 0
      Width = 60
      Height = 22
      Align = alClient
      Anchors = [akTop, akRight]
      Caption = '  Formulario: '
      Layout = tlCenter
    end
    object edFORMULARIO: TEdit
      Left = 696
      Top = 0
      Width = 72
      Height = 22
      TabStop = False
      Anchors = [akTop, akRight]
      AutoSize = False
      Color = clActiveBorder
      ReadOnly = True
      TabOrder = 2
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 0
    Top = 27
    Width = 777
    Height = 162
    Align = alClient
    DataSource = dsCargaDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = ArtDBGridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'TI_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_DE_EVENTO'
        Title.Caption = 'Evento'
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_DEUDA'
        Title.Caption = 'Deuda'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_DE_CARTA'
        Title.Caption = 'Tipo de Carta'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 202
        Visible = True
      end>
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16462
        LinkControl = tlbNuevo
      end
      item
        Key = 16450
        LinkControl = tlbBaja
      end
      item
        Key = 16463
        LinkControl = tlbModificacion
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tlbSalir
      end
      item
        Key = 16461
        LinkControl = tlbModificacion
      end>
    Left = 24
    Top = 83
  end
  object sdqCargaDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   ti_id, ti_idformulario, ti_codigo, ti_fecha, ti_observa' +
        'ciones, ti_deuda, ti_idcarta, ht_nombre AS tipo_de_carta,'
      '         ca_fechaimpresion, tb_descripcion AS tipo_de_evento,'
      
        '         art.utiles.iif_compara('#39'IN'#39', '#39'CA_RECEPCIONOK'#39', '#39'S N'#39', 0' +
        ',(actualdate - ca_fechaimpresion)) AS dias_transcurridos,'
      '         co_contrato, ca_recepcionok, ti_fechabaja'
      
        '    FROM ati_traspasoingreso, cca_carta, comunes.cht_historicote' +
        'xtocarta, ctb_tablas, aco_contrato'
      '   WHERE tb_fechabaja IS NULL'
      '     AND ti_codigo = tb_codigo'
      '     AND tb_clave = '#39'EVTIN'#39
      '     AND ti_idformulario = co_idformulario(+)'
      '     AND ti_idcarta = ca_id(+)'
      '     AND ca_idhistoricotextocarta = ht_id(+)'
      '     AND ti_idformulario = 40'
      'ORDER BY ti_id'
      '')
    Left = 52
    Top = 83
  end
  object dsCargaDatos: TDataSource
    DataSet = sdqCargaDatos
    Left = 80
    Top = 83
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
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
    PageOrientation = pxLandscape
    PageSize = psLegal
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 80
    Top = 111
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Options = [poPageNums]
    Left = 52
    Top = 111
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqCargaDatos
    SortFields = <>
    FixedRows = 0
    Left = 24
    Top = 111
  end
  object mnuImprimir: TPopupMenu
    Left = 108
    Top = 111
    object mnuGrilla: TMenuItem
      Caption = 'Grilla'
      OnClick = mnuGrillaClick
    end
    object mnuCarta: TMenuItem
      Caption = 'Carta'
      OnClick = mnuCartaClick
    end
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 108
    Top = 83
  end
end
