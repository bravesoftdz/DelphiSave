object frmModificaTraspasoEgresos: TfrmModificaTraspasoEgresos
  Left = 216
  Top = 107
  Width = 752
  Height = 490
  Caption = 'Modificaci'#243'n Traspaso Egresos'
  Color = clBtnFace
  Constraints.MinHeight = 490
  Constraints.MinWidth = 752
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tlbControl: TToolBar
    Left = 0
    Top = 0
    Width = 744
    Height = 28
    Caption = 'tlbControl'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = frmPrincipal.ilColor
    Images = frmPrincipal.ilByN
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    DesignSize = (
      740
      24)
    object tlbNuevo: TToolButton
      Left = 0
      Top = 0
      Hint = 'Nuevo (Ctrl -  N)'
      Caption = 'tlbNuevo'
      ImageIndex = 6
      OnClick = tlbNuevoClick
    end
    object tlbModificacion: TToolButton
      Left = 23
      Top = 0
      Hint = 'Modificaci'#243'n (Ctrl-M)'
      Caption = 'tlbModificacion'
      ImageIndex = 7
      OnClick = tlbModificacionClick
    end
    object tlbBaja: TToolButton
      Left = 46
      Top = 0
      Hint = 'Baja (Ctrl-B)'
      Caption = 'tlbBaja'
      ImageIndex = 8
      OnClick = tlbBajaClick
    end
    object tblSeparador1: TToolButton
      Left = 69
      Top = 0
      Width = 4
      Caption = 'tblSeparador1'
      ImageIndex = 6
      Style = tbsDivider
    end
    object ToolButton4: TToolButton
      Left = 73
      Top = 0
      Caption = 'ToolButton4'
      ImageIndex = 2
      OnClick = ToolButton4Click
    end
    object ToolButton2: TToolButton
      Left = 96
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 104
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 30
      OnClick = ToolButton1Click
    end
    object tblSeparador2: TToolButton
      Left = 127
      Top = 0
      Width = 5
      Caption = 'tblSeparador2'
      ImageIndex = 6
      Style = tbsDivider
    end
    object tbImprimir: TToolButton
      Left = 132
      Top = 0
      Hint = 'Imprimir (Ctrl+I)'
      Caption = 'tbImprimir'
      ImageIndex = 4
      OnClick = tbImprimirClick
    end
    object ToolButton3: TToolButton
      Left = 155
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object tlbSalir: TToolButton
      Left = 163
      Top = 0
      Hint = 'Salir (Ctrl-S)'
      Caption = 'tlbSalir'
      ImageIndex = 5
      OnClick = tlbSalirClick
    end
    object lbCUIT: TLabel
      Left = 186
      Top = 0
      Width = 12
      Height = 22
      AutoSize = False
    end
    inline fraEmpresa: TfraEmpresa
      Left = 198
      Top = 0
      Width = 540
      Height = 22
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
        Left = 438
      end
      inherited edContrato: TIntEdit
        Left = 483
      end
      inherited cmbRSocial: TArtComboBox
        Width = 301
        DataSource = nil
      end
    end
  end
  object ArtDBGrid: TArtDBGrid
    Left = 0
    Top = 56
    Width = 744
    Height = 408
    Align = alClient
    DataSource = dsCargaDatos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'TE_CODIGO'
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
        FieldName = 'TE_FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_DEUDA'
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
        FieldName = 'TE_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_DEUDANOMINAL'
        Title.Caption = 'Deuda Nominal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_INTERESES'
        Title.Caption = 'Intereses'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TE_CONSOLIDADO'
        Title.Caption = 'Consolidado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TE_RGRL'
        Title.Alignment = taCenter
        Title.Caption = 'RGRL'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RGRLHOY'
        Title.Alignment = taCenter
        Title.Caption = 'RGRL Hoy'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TE_CLAUSULARGRL'
        Title.Alignment = taCenter
        Title.Caption = 'Cla'#250'sula RGRL'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'te_fechaalta'
        Title.Caption = 'Fecha de Alta'
        Width = 102
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 28
    Width = 744
    Height = 28
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      744
      28)
    object Label1: TLabel
      Left = 454
      Top = 6
      Width = 65
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Deuda Actual'
    end
    object Label2: TLabel
      Left = 606
      Top = 6
      Width = 52
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Empleados'
    end
    object Label3: TLabel
      Left = 6
      Top = 8
      Width = 55
      Height = 13
      Caption = 'ART Futura'
    end
    object edEmpleados: TIntEdit
      Left = 663
      Top = 3
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object edDeudaActual: TCurrencyEdit
      Left = 521
      Top = 3
      Width = 75
      Height = 21
      AutoSize = False
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object edARTFutura: TEdit
      Left = 64
      Top = 4
      Width = 327
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
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
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 108
    Top = 111
  end
end
