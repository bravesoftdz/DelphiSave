object frmRecibosValorPlanPago: TfrmRecibosValorPlanPago
  Left = 119
  Top = 137
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Recibos del Valor en Planes de Pago'
  ClientHeight = 300
  ClientWidth = 702
  Color = clBtnFace
  Constraints.MaxHeight = 327
  Constraints.MaxWidth = 710
  Constraints.MinHeight = 327
  Constraints.MinWidth = 710
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblNroCheque: TLabel
    Left = 4
    Top = 12
    Width = 60
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Nro. Cheque'
  end
  object lblFVencimiento: TLabel
    Left = 395
    Top = 12
    Width = 56
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'F. Vencim.'
  end
  object lblBanco: TLabel
    Left = 4
    Top = 39
    Width = 60
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Banco'
  end
  object lblImporte: TLabel
    Left = 547
    Top = 12
    Width = 40
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Importe'
  end
  object edNroCheque: TPatternEdit
    Left = 70
    Top = 8
    Width = 310
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object edFVencimiento: TDateComboBox
    Left = 455
    Top = 8
    Width = 88
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object edBanco: TEdit
    Left = 70
    Top = 35
    Width = 625
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edImporte: TCurrencyEdit
    Left = 594
    Top = 8
    Width = 100
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    MaxLength = 15
    ReadOnly = True
    TabOrder = 3
  end
  object dbgRecibos: TArtDBGrid
    Left = 7
    Top = 93
    Width = 690
    Height = 202
    DataSource = dsRecibos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    IniStorage = FormStorage1
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NRORECIBO'
        Title.Alignment = taCenter
        Title.Caption = 'Recibo'
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Siniestro'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Alignment = taCenter
        Title.Caption = 'Contrato'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RSOCIAL'
        Title.Caption = 'Raz'#243'n Social'
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLAN'
        Title.Alignment = taCenter
        Title.Caption = 'Plan'
        Width = 58
        Visible = True
      end>
  end
  object CoolBar: TCoolBar
    Left = 7
    Top = 60
    Width = 689
    Height = 29
    Align = alNone
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 685
      end>
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 672
      Height = 27
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilColor
      Images = frmPrincipal.ilByN
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbImprimir: TToolButton
        Left = 0
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      object ToolButton30: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton30'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 31
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  object sdqRecibos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterOpen = sdqRecibosAfterOpen
    SQL.Strings = (
      ''
      ''
      ' ')
    Left = 88
    Top = 164
  end
  object dsRecibos: TDataSource
    DataSet = sdqRecibos
    Left = 116
    Top = 164
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 16
    Top = 218
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 88
    Top = 127
  end
  object ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
    Left = 44
    Top = 218
  end
  object QueryPrint: TQueryPrint
    Border.Lines = [blTop, blLeft, blRight, blBottom]
    Fields = <>
    DataSource = dsRecibos
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -19
    Title.Font.Name = 'Tahoma'
    Title.Font.Style = [fsBold]
    Title.Text = 'Recibos del Valor en Planes de Pago'
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
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
    PrinterOptions.PrintDialog = PrintDialog
    Left = 116
    Top = 127
  end
end
