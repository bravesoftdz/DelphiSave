object frmConsultasAdicionales: TfrmConsultasAdicionales
  Left = 265
  Top = 207
  Caption = 'Consultas'
  ClientHeight = 272
  ClientWidth = 543
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 411
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    543
    272)
  PixelsPerInch = 96
  TextHeight = 13
  object GridAdicionales: TArtDBGrid
    Left = 0
    Top = 33
    Width = 543
    Height = 238
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsAdicionales
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = GridAdicionalesKeyDown
    OnGetCellParams = GridAdicionalesGetCellParams
    FooterBand = False
    OnPaintFooter = GridAdicionalesPaintFooter
    TitleHeight = 17
    AutoTitleHeight = True
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 1
    Width = 543
    Height = 29
    Align = alNone
    Anchors = [akLeft, akTop, akRight]
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 27
        Width = 537
      end>
    object ToolBar1: TToolBar
      Left = 11
      Top = 0
      Width = 528
      Height = 27
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbImprimirAdic: TToolButton
        Left = 0
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 4
        OnClick = tbImprimirAdicClick
      end
      object tbImprimirCarta: TToolButton
        Left = 25
        Top = 0
        Hint = 'Impresi'#243'n de la carta'
        ImageIndex = 30
        Visible = False
        OnClick = tbImprimirCartaClick
      end
      object ToolButton4: TToolButton
        Left = 50
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbVendedorPrincipal: TToolButton
        Left = 58
        Top = 0
        Hint = 'Vendedor Principal'
        ImageIndex = 26
        OnClick = tbVendedorPrincipalClick
      end
      object tbVendedorVisible: TToolButton
        Left = 83
        Top = 0
        Hint = 'Visible'
        ImageIndex = 13
        OnClick = tbVendedorVisibleClick
      end
      object tbSeparadorVendedor: TToolButton
        Left = 108
        Top = 0
        Width = 8
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbExportar: TToolButton
        Left = 116
        Top = 0
        Hint = 'Exportar'
        Caption = 'Exportar'
        ImageIndex = 3
        OnClick = tbExportarClick
      end
      object tbOrdenar: TToolButton
        Left = 141
        Top = 0
        Hint = 'Ordenar (Ctrl+O) '
        ImageIndex = 2
        OnClick = tbOrdenarClick
      end
      object ToolButton5: TToolButton
        Left = 166
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 174
        Top = 0
        Hint = 'Salir'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
      object pnlVendedores: TPanel
        Left = 199
        Top = 0
        Width = 181
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object chkMostrarVendActivos: TCheckBox
          Left = 4
          Top = 4
          Width = 175
          Height = 17
          Caption = 'Solo vend. activos y en vigencia'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkMostrarVendActivosClick
        end
      end
    end
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqAdicionales
    SortFields = <>
    FixedRows = 0
    Left = 95
    Top = 84
  end
  object dsAdicionales: TDataSource
    DataSet = sdqAdicionales
    Left = 67
    Top = 84
  end
  object sdqAdicionales: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqAdicionalesAfterOpen
    Left = 39
    Top = 84
  end
  object PrintDialog: TPrintDialog
    Copies = 1
    Options = [poPageNums]
    Left = 38
    Top = 112
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsAdicionales
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
    PageOrientation = pxLandscape
    PrinterOptions.PrintDialog = PrintDialog
    PrinterOptions.Copies = 1
    Left = 66
    Top = 112
  end
  object ExportDialog: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqAdicionales
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
    VersionExcel = msExcel97
    Left = 94
    Top = 112
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'VerInvisibles'
      end>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = True
    Left = 39
    Top = 140
  end
end
