object frmDetFact: TfrmDetFact
  Left = 391
  Top = 239
  Caption = 'Detalle de la Factura'
  ClientHeight = 523
  ClientWidth = 933
  Color = clBtnFace
  Constraints.MinHeight = 230
  Constraints.MinWidth = 444
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar: TCoolBar
    Left = 0
    Top = 0
    Width = 933
    Height = 29
    Bands = <
      item
        Break = False
        Control = ToolBar1
        ImageIndex = -1
        Width = 927
      end>
    ParentShowHint = False
    ShowHint = True
    object ToolBar1: TToolBar
      Left = 11
      Top = 0
      Width = 918
      Height = 25
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      TabOrder = 0
      object tbRefrescar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Refrescar (F5)'
        Caption = 'tbRefrescar'
        ImageIndex = 4
        OnClick = tbRefrescarClick
      end
      object tbFiltros: TToolButton
        Left = 23
        Top = 0
        Hint = 'Filtros'
        Caption = 'tbFiltros'
        DropdownMenu = pMnuSiniestros
        ImageIndex = 16
        Style = tbsDropDown
      end
      object Sep1: TToolButton
        Left = 61
        Top = 0
        Width = 8
        Caption = 'Sep1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbOrdenar: TToolButton
        Left = 69
        Top = 0
        Hint = 'Ordenar (Ctrl+O)'
        Caption = 'Ordenar'
        ImageIndex = 5
        OnClick = tbOrdenarClick
      end
      object tbExportar: TToolButton
        Left = 92
        Top = 0
        Hint = 'Exportar'
        Caption = 'tbExportar'
        DropdownMenu = pmnuExportar
        ImageIndex = 1
        Style = tbsDropDown
        OnClick = tbExportarClick
      end
      object Sep2: TToolButton
        Left = 130
        Top = 0
        Width = 8
        Caption = 'Sep2'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object tbPreview: TToolButton
        Left = 138
        Top = 0
        Hint = 'Vista Previa (Ctrl+R)'
        Caption = 'tbPreview'
        ImageIndex = 14
        OnClick = tbPreviewClick
      end
      object tbImprimir: TToolButton
        Left = 161
        Top = 0
        Hint = 'Imprimir (Ctrl+I)'
        Caption = 'tbImprimir'
        DropdownMenu = pmnuImprimir
        ImageIndex = 7
        Style = tbsDropDown
        OnClick = tbImprimirClick
      end
      object tbEnviarMail: TToolButton
        Left = 199
        Top = 0
        Hint = 'Enviar por mail al prestador'
        Caption = 'tbEnviarMail'
        ImageIndex = 39
        OnClick = tbEnviarMailClick
      end
      object ToolButton4: TToolButton
        Left = 222
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbSalir: TToolButton
        Left = 230
        Top = 0
        Hint = 'Salir'
        Caption = 'tbSalir'
        ImageIndex = 8
        OnClick = tbSalirClick
      end
    end
  end
  object dbgListado: TArtDBGrid
    Left = 0
    Top = 29
    Width = 910
    Height = 306
    Align = alClient
    DataSource = dsDetalle
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    IniStorage = FormPlacement
    RowColor1 = 16119285
    RowColor2 = 15263976
    ShowGlyphs = False
    OnGetCellParams = dbgListadoGetCellParams
    OnPaintFooter = dbgListadoPaintFooter
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numauto'
        Title.Caption = 'Aut.'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Title.Caption = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIL'
        Title.Caption = 'CUIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CP_DENPAGO'
        Title.Caption = 'Concepto de Pago'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPFACT'
        Title.Caption = 'Monto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPPAFCONRET'
        Title.Caption = 'Monto a Pagar'
        Width = 76
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
        FieldName = 'PRESTACION'
        Title.Caption = 'Prestaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'iv_Numvolante'
        Title.Caption = 'Secuencia'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Caption = 'Observaciones'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'iv_auditado'
        Title.Caption = 'Auditado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dv_original'
        Title.Caption = 'Original'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dv_codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dv_secuencia'
        Title.Caption = 'Sec. d'#233'bito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dv_codoriginal'
        Title.Caption = 'Cod. Original'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRATO'
        Title.Caption = 'Contrato'
        Width = 80
        Visible = True
      end>
  end
  object ScrollBox1: TScrollBox
    Left = 235
    Top = 220
    Width = 889
    Height = 589
    TabOrder = 2
    Visible = False
    object qrpReporte: TQuickRep
      Left = 28
      Top = 8
      Width = 816
      Height = 1056
      IDReport = 0
      DataSet = sdqDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Functions.Strings = (
        'PAGENUMBER'
        'COLUMNNUMBER'
        'REPORTTITLE')
      Functions.DATA = (
        '0'
        '0'
        #39#39)
      Options = [FirstPageHeader, LastPageFooter]
      Page.Columns = 1
      Page.Orientation = poPortrait
      Page.PaperSize = Letter
      Page.Continuous = False
      Page.Values = (
        100.000000000000000000
        2794.000000000000000000
        100.000000000000000000
        2159.000000000000000000
        100.000000000000000000
        100.000000000000000000
        0.000000000000000000)
      PrinterSettings.Copies = 1
      PrinterSettings.OutputBin = Auto
      PrinterSettings.Duplex = False
      PrinterSettings.FirstPage = 0
      PrinterSettings.LastPage = 0
      PrinterSettings.UseStandardprinter = False
      PrinterSettings.UseCustomBinCode = False
      PrinterSettings.CustomBinCode = 0
      PrinterSettings.ExtendedDuplex = 0
      PrinterSettings.UseCustomPaperCode = False
      PrinterSettings.CustomPaperCode = 0
      PrinterSettings.PrintMetaFile = False
      PrinterSettings.PrintQuality = 0
      PrinterSettings.Collate = 0
      PrinterSettings.ColorOption = 0
      PrintIfEmpty = True
      ReportTitle = 'Detalle de la Factura'
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      PrevInitialZoom = qrZoomToFit
      PreviewDefaultSaveType = stQRP
      PreviewLeft = 0
      PreviewTop = 0
      object QRBand1: TQRBand
        Left = 38
        Top = 38
        Width = 740
        Height = 35
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          92.604166666666680000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbTitle
        object qrlTitulo: TQRLabel
          Left = 0
          Top = 0
          Width = 741
          Height = 30
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            79.375000000000000000
            0.000000000000000000
            0.000000000000000000
            1960.562500000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Detalle de la Factura Nro: XXXX'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 18
        end
      end
      object QRGroup1: TQRGroup
        Left = 38
        Top = 73
        Width = 740
        Height = 44
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          116.416666666666700000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        Expression = 'sdqDatos.SINIESTRO'
        FooterBand = qrbFooter
        Master = qrpReporte
        ReprintOnNewPage = False
        object QRLabel5: TQRLabel
          Left = 0
          Top = 16
          Width = 741
          Height = 17
          Frame.Color = clYellow
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            44.979166666666700000
            0.000000000000000000
            42.333333333333300000
            1960.562500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = '  '
          Color = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object qrdbNroVolante: TQRDBText
          Left = 1
          Top = 4
          Width = 107
          Height = 26
          Size.Values = (
            68.791666666666680000
            2.645833333333333000
            10.583333333333330000
            283.104166666666700000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'SINIESTRO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 16
        end
        object QRLabel1: TQRLabel
          Left = 0
          Top = 28
          Width = 233
          Height = 14
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            37.041666666666700000
            0.000000000000000000
            74.083333333333300000
            616.479166666667000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = ' Observaciones'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel3: TQRLabel
          Left = 161
          Top = 28
          Width = 213
          Height = 14
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            37.041666666666700000
            425.979166666667000000
            74.083333333333300000
            563.562500000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Concepto de Pago'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel4: TQRLabel
          Left = 505
          Top = 28
          Width = 88
          Height = 14
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            37.041666666666700000
            1336.145833333330000000
            74.083333333333300000
            232.833333333333000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Monto  '
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel6: TQRLabel
          Left = 591
          Top = 28
          Width = 94
          Height = 14
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            37.041666666666700000
            1563.687500000000000000
            74.083333333333300000
            248.708333333333000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Monto a Pagar'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRDBText1: TQRDBText
          Left = 192
          Top = 16
          Width = 77
          Height = 14
          Size.Values = (
            37.041666666666700000
            508.000000000000000000
            42.333333333333300000
            203.729166666667000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'EX_CUIL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText2: TQRDBText
          Left = 272
          Top = 16
          Width = 60
          Height = 14
          Size.Values = (
            37.041666666666670000
            719.666666666666800000
            42.333333333333340000
            158.750000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'TJ_NOMBRE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRLabel2: TQRLabel
          Left = 442
          Top = 28
          Width = 63
          Height = 14
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            37.041666666666700000
            1169.458333333330000000
            74.083333333333300000
            166.687500000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Fecha'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel15: TQRLabel
          Left = 370
          Top = 28
          Width = 75
          Height = 14
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            37.041666666666700000
            978.958333333333000000
            74.083333333333300000
            198.437500000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Prestaci'#243'n'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel16: TQRLabel
          Left = 684
          Top = 28
          Width = 56
          Height = 14
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            37.041666666666700000
            1809.750000000000000000
            74.083333333333300000
            148.166666666667000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'N'#186' Sec.'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNone
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
      end
      object QRBand2: TQRBand
        Left = 38
        Top = 117
        Width = 740
        Height = 12
        AlignToBottom = False
        Color = 8454143
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        LinkBand = QRGroup1
        Size.Values = (
          31.750000000000000000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbDetail
        object QRDBText3: TQRDBText
          Left = 165
          Top = 0
          Width = 208
          Height = 14
          Size.Values = (
            37.041666666666700000
            436.562500000000000000
            0.000000000000000000
            550.333333333333000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'CP_DENPAGO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object qrdbMonto: TQRDBText
          Left = 514
          Top = 0
          Width = 81
          Height = 14
          Size.Values = (
            37.041666666666700000
            1359.958333333330000000
            0.000000000000000000
            214.312500000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'IMPFACT'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          OnPrint = qrdbMontoPrint
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object qrdbMontoAPagar: TQRDBText
          Left = 604
          Top = 0
          Width = 75
          Height = 14
          Size.Values = (
            37.041666666666700000
            1598.083333333330000000
            0.000000000000000000
            198.437500000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'IMPPAFCONRET'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          OnPrint = qrdbMontoPrint
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRLabel8: TQRLabel
          Left = 530
          Top = 0
          Width = 7
          Height = 17
          Size.Values = (
            44.979166666666670000
            1402.291666666667000000
            0.000000000000000000
            18.520833333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '$'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel9: TQRLabel
          Left = 620
          Top = 0
          Width = 7
          Height = 17
          Size.Values = (
            44.979166666666670000
            1640.416666666667000000
            0.000000000000000000
            18.520833333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '$'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRDBText4: TQRDBText
          Left = 0
          Top = -1
          Width = 161
          Height = 14
          Size.Values = (
            37.041666666666700000
            0.000000000000000000
            -2.645833333333330000
            425.979166666667000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          AutoStretch = True
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'OBS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText5: TQRDBText
          Left = 442
          Top = -1
          Width = 62
          Height = 14
          Size.Values = (
            37.041666666666700000
            1169.458333333330000000
            -2.645833333333330000
            164.041666666667000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'FECHA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText6: TQRDBText
          Left = 372
          Top = -1
          Width = 72
          Height = 14
          Size.Values = (
            37.041666666666700000
            984.250000000000000000
            -2.645833333333330000
            190.500000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'PRESTACION'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText7: TQRDBText
          Left = 681
          Top = 0
          Width = 55
          Height = 14
          Size.Values = (
            37.041666666666700000
            1801.812500000000000000
            0.000000000000000000
            145.520833333333000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatos
          DataField = 'IV_NUMVOLANTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Mask = '#'
          OnPrint = qrdbMontoPrint
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
      end
      object qrbFooter: TQRBand
        Left = 38
        Top = 129
        Width = 740
        Height = 16
        Frame.DrawBottom = True
        AlignToBottom = False
        Color = clYellow
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          42.333333333333340000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbGroupFooter
        object QRExpr1: TQRExpr
          Left = 604
          Top = 1
          Width = 75
          Height = 15
          Size.Values = (
            39.687500000000000000
            1598.083333333330000000
            2.645833333333330000
            198.437500000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Color = clWhite
          OnPrint = qrdbMontoPrint
          ParentFont = False
          ResetAfterPrint = True
          Transparent = True
          Expression = 'SUM(sdqDatos.IMPPAFCONRET)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRExpr2: TQRExpr
          Left = 514
          Top = 0
          Width = 81
          Height = 15
          Size.Values = (
            39.687500000000000000
            1359.958333333330000000
            0.000000000000000000
            214.312500000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Color = clWhite
          OnPrint = qrdbMontoPrint
          ParentFont = False
          ResetAfterPrint = True
          Transparent = True
          Expression = 'SUM(sdqDatos.IMPFACT)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel7: TQRLabel
          Left = 442
          Top = 0
          Width = 49
          Height = 17
          Size.Values = (
            44.979166666666670000
            1169.458333333333000000
            0.000000000000000000
            129.645833333333300000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Subtotal'
          Color = clWhite
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
        object QRLabel10: TQRLabel
          Left = 530
          Top = 0
          Width = 7
          Height = 17
          Size.Values = (
            44.979166666666670000
            1402.291666666667000000
            0.000000000000000000
            18.520833333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '$'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel11: TQRLabel
          Left = 620
          Top = 0
          Width = 7
          Height = 17
          Size.Values = (
            44.979166666666670000
            1640.416666666667000000
            0.000000000000000000
            18.520833333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '$'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
      end
      object qrbPgFooter: TQRBand
        Left = 38
        Top = 189
        Width = 740
        Height = 20
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          52.916666666666670000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbPageFooter
        object QRLabel18: TQRLabel
          Left = 500
          Top = 6
          Width = 30
          Height = 11
          Size.Values = (
            29.104166666666670000
            1322.916666666667000000
            15.875000000000000000
            79.375000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Usuario:'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 6
        end
        object QRShape13: TQRShape
          Left = 0
          Top = 0
          Width = 1270
          Height = 5
          Size.Values = (
            13.229166666666700000
            0.000000000000000000
            0.000000000000000000
            3360.208333333330000000)
          XLColumn = 0
          Shape = qrsHorLine
          VertAdjust = 0
        end
        object qrlUsuario: TQRLabel
          Left = 534
          Top = 6
          Width = 133
          Height = 11
          Size.Values = (
            29.104166666666700000
            1412.875000000000000000
            15.875000000000000000
            351.895833333333000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'Nombre del Usuario'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 6
        end
        object QRSysData2: TQRSysData
          Left = 668
          Top = 6
          Width = 23
          Height = 11
          Size.Values = (
            29.104166666666670000
            1767.416666666667000000
            15.875000000000000000
            60.854166666666680000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Color = clWhite
          Data = qrsDate
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          FontSize = 6
        end
      end
      object QRBand3: TQRBand
        Left = 38
        Top = 145
        Width = 740
        Height = 44
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          116.416666666666700000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbSummary
        object QRLabel12: TQRLabel
          Left = 530
          Top = 24
          Width = 7
          Height = 17
          Size.Values = (
            44.979166666666670000
            1402.291666666667000000
            63.500000000000000000
            18.520833333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '$'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRExpr3: TQRExpr
          Left = 514
          Top = 24
          Width = 82
          Height = 17
          Size.Values = (
            44.979166666666700000
            1359.958333333330000000
            63.500000000000000000
            216.958333333333000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Color = clWhite
          OnPrint = qrdbMontoPrint
          ParentFont = False
          ResetAfterPrint = False
          Transparent = True
          Expression = 'SUM(sdqDatos.IMPFACT)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel13: TQRLabel
          Left = 620
          Top = 24
          Width = 7
          Height = 17
          Size.Values = (
            44.979166666666670000
            1640.416666666667000000
            63.500000000000000000
            18.520833333333330000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '$'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRExpr4: TQRExpr
          Left = 604
          Top = 24
          Width = 78
          Height = 17
          Size.Values = (
            44.979166666666700000
            1598.083333333330000000
            63.500000000000000000
            206.375000000000000000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Color = clWhite
          OnPrint = qrdbMontoPrint
          ParentFont = False
          ResetAfterPrint = False
          Transparent = True
          Expression = 'SUM(sdqDatos.IMPPAFCONRET)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRLabel14: TQRLabel
          Left = 456
          Top = 24
          Width = 29
          Height = 17
          Size.Values = (
            44.979166666666670000
            1206.500000000000000000
            63.500000000000000000
            76.729166666666680000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Total'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 10
        end
      end
    end
    object qrpDetalleAbreviado: TQuickRep
      Left = 24
      Top = 313
      Width = 816
      Height = 1056
      IDReport = 0
      DataSet = sdqDatosDetAbrev
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Functions.Strings = (
        'PAGENUMBER'
        'COLUMNNUMBER'
        'REPORTTITLE')
      Functions.DATA = (
        '0'
        '0'
        #39#39)
      Options = [FirstPageHeader, LastPageFooter]
      Page.Columns = 1
      Page.Orientation = poPortrait
      Page.PaperSize = Letter
      Page.Continuous = False
      Page.Values = (
        100.000000000000000000
        2794.000000000000000000
        100.000000000000000000
        2159.000000000000000000
        100.000000000000000000
        100.000000000000000000
        0.000000000000000000)
      PrinterSettings.Copies = 1
      PrinterSettings.OutputBin = Auto
      PrinterSettings.Duplex = False
      PrinterSettings.FirstPage = 0
      PrinterSettings.LastPage = 0
      PrinterSettings.UseStandardprinter = False
      PrinterSettings.UseCustomBinCode = False
      PrinterSettings.CustomBinCode = 0
      PrinterSettings.ExtendedDuplex = 0
      PrinterSettings.UseCustomPaperCode = False
      PrinterSettings.CustomPaperCode = 0
      PrinterSettings.PrintMetaFile = False
      PrinterSettings.PrintQuality = 0
      PrinterSettings.Collate = 0
      PrinterSettings.ColorOption = 0
      PrintIfEmpty = True
      ReportTitle = 'Detalle Abreviado'
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      PrevInitialZoom = qrZoomToFit
      PreviewDefaultSaveType = stQRP
      PreviewLeft = 0
      PreviewTop = 0
      object QRBand5: TQRBand
        Left = 38
        Top = 38
        Width = 740
        Height = 8
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          21.166666666666670000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbTitle
      end
      object QRBand6: TQRBand
        Left = 38
        Top = 65
        Width = 740
        Height = 18
        Frame.Style = psDot
        AlignToBottom = False
        Color = clCaptionText
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          47.625000000000000000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbDetail
        object QRDBText21: TQRDBText
          Left = 138
          Top = -1
          Width = 123
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            50.270833333333330000
            365.125000000000000000
            -2.645833333333333000
            325.437500000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatosDetAbrev
          DataField = 'EX_CUIL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText22: TQRDBText
          Left = 625
          Top = -1
          Width = 115
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            50.270833333333330000
            1653.645833333333000000
            -2.645833333333333000
            304.270833333333400000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatosDetAbrev
          DataField = 'IMPFACT'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          OnPrint = qrdbMontoPrint
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText24: TQRDBText
          Left = 0
          Top = -1
          Width = 139
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            50.270833333333330000
            0.000000000000000000
            -2.645833333333333000
            367.770833333333400000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatosDetAbrev
          DataField = 'SINIESTRO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText25: TQRDBText
          Left = 512
          Top = -1
          Width = 114
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            50.270833333333330000
            1354.666666666667000000
            -2.645833333333333000
            301.625000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatosDetAbrev
          DataField = 'FECHA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
        object QRDBText26: TQRDBText
          Left = 260
          Top = -1
          Width = 253
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            50.270833333333330000
            687.916666666666800000
            -2.645833333333333000
            669.395833333333400000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Color = clWhite
          DataSet = sdqDatosDetAbrev
          DataField = 'TJ_NOMBRE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FullJustify = False
          MaxBreakChars = 0
          FontSize = 8
        end
      end
      object QRBand9: TQRBand
        Left = 38
        Top = 83
        Width = 740
        Height = 43
        AlignToBottom = False
        Color = clWhite
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          113.770833333333300000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbSummary
        object QRLabel43: TQRLabel
          Left = 637
          Top = 21
          Width = 8
          Height = 15
          Size.Values = (
            39.687500000000000000
            1685.395833333333000000
            55.562500000000000000
            21.166666666666670000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = '$'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRExpr8: TQRExpr
          Left = 645
          Top = 21
          Width = 91
          Height = 15
          Size.Values = (
            39.687500000000000000
            1706.562500000000000000
            55.562500000000000000
            240.770833333333300000)
          XLColumn = 0
          Alignment = taRightJustify
          AlignToBand = False
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Color = clWhite
          OnPrint = qrdbMontoPrint
          ParentFont = False
          ResetAfterPrint = False
          Transparent = True
          Expression = 'SUM(sdqDatosDetAbrev.IMPFACT)'
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRShape1: TQRShape
          Left = 2
          Top = 38
          Width = 737
          Height = 1
          Size.Values = (
            2.645833333333333000
            5.291666666666667000
            100.541666666666700000
            1949.979166666667000000)
          XLColumn = 0
          Shape = qrsRectangle
          VertAdjust = 0
        end
        object QRLabel17: TQRLabel
          Left = 598
          Top = 21
          Width = 30
          Height = 15
          Size.Values = (
            39.687500000000000000
            1582.208333333333000000
            55.562500000000000000
            79.375000000000000000)
          XLColumn = 0
          Alignment = taLeftJustify
          AlignToBand = False
          Caption = 'Total'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 8
        end
        object QRShape2: TQRShape
          Left = 2
          Top = 16
          Width = 737
          Height = 1
          Size.Values = (
            2.645833333333333000
            5.291666666666667000
            42.333333333333340000
            1949.979166666667000000)
          XLColumn = 0
          Shape = qrsRectangle
          VertAdjust = 0
        end
        object QRShape3: TQRShape
          Left = 1
          Top = 16
          Width = 1
          Height = 22
          Size.Values = (
            58.208333333333340000
            2.645833333333333000
            42.333333333333340000
            2.645833333333333000)
          XLColumn = 0
          Shape = qrsRectangle
          VertAdjust = 0
        end
        object QRShape4: TQRShape
          Left = 738
          Top = 17
          Width = 1
          Height = 21
          Size.Values = (
            55.562500000000000000
            1952.625000000000000000
            44.979166666666670000
            2.645833333333333000)
          XLColumn = 0
          Shape = qrsRectangle
          VertAdjust = 0
        end
      end
      object ColumnHeaderBand2: TQRBand
        Left = 38
        Top = 46
        Width = 740
        Height = 19
        AlignToBottom = False
        Color = clWindow
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          50.270833333333330000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbColumnHeader
        object QRLabel46: TQRLabel
          Left = 0
          Top = 0
          Width = 139
          Height = 20
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            52.916666666666660000
            0.000000000000000000
            0.000000000000000000
            367.770833333333400000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Siniestro'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
        object QRLabel47: TQRLabel
          Left = 138
          Top = 0
          Width = 123
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            50.270833333333330000
            365.125000000000000000
            0.000000000000000000
            325.437500000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'CUIL'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
        object QRLabel48: TQRLabel
          Left = 260
          Top = 0
          Width = 253
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            50.270833333333330000
            687.916666666666800000
            0.000000000000000000
            669.395833333333400000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Trabajador'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
        object QRLabel49: TQRLabel
          Left = 512
          Top = 0
          Width = 114
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            50.270833333333330000
            1354.666666666667000000
            0.000000000000000000
            301.625000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Fec. Prestaci'#243'n'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
        object QRLabel50: TQRLabel
          Left = 625
          Top = 0
          Width = 114
          Height = 19
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          Size.Values = (
            50.270833333333330000
            1653.645833333333000000
            0.000000000000000000
            301.625000000000000000)
          XLColumn = 0
          Alignment = taCenter
          AlignToBand = False
          AutoSize = False
          Caption = 'Monto'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          FontSize = 9
        end
      end
    end
  end
  object pnlBottom2: TPanel
    Left = 0
    Top = 453
    Width = 933
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    object edObservaciones: TDBMemo
      Left = 100
      Top = 2
      Width = 831
      Height = 37
      Align = alClient
      DataField = 'OBS'
      DataSource = dsDetalle
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 98
      Height = 37
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'Observaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object AdvToolPanelTabLateral: TAdvToolPanelTab
    Left = 910
    Top = 29
    Width = 23
    Height = 306
    AutoOpenCloseSpeed = aocVeryFast
    Color = clWhite
    ColorTo = 15527920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Position = ppRight
    SlideSpeed = ssFast
    Style = esOffice2003Classic
    TabColor = clWhite
    TabColorTo = 13226453
    TabHoverColor = 13811126
    TabHoverColorTo = 13811126
    Version = '1.5.4.2'
    OnTabSlideOutDone = BuscarDomicilios
    object AdvToolPanelGIS: TAdvToolPanel
      Left = 0
      Top = 0
      Width = 0
      Height = 304
      AllowDocking = False
      AutoLock = True
      BackgroundTransparent = False
      BackGroundPosition = bpTopLeft
      Button3D = False
      HoverButtonColor = 13811126
      HoverButtonColorTo = 13811126
      DownButtonColor = 11899525
      DownButtonColorTo = 11899525
      CaptionButton = False
      Color = 15198191
      ColorTo = 13029070
      GradientDirection = gdVertical
      DockDots = False
      CanSize = False
      Caption = 'GIS - Mapas'
      CaptionGradientDirection = gdVertical
      FocusCaptionFontColor = clBlack
      FocusCaptionColor = 14671839
      FocusCaptionColorTo = 11511715
      NoFocusCaptionFontColor = clBlack
      NoFocusCaptionColor = 15724527
      NoFocusCaptionColorTo = 12634569
      OpenWidth = 664
      CloseHint = 'Close panel'
      LockHint = 'Fijar mapa'
      UnlockHint = 'Ocultar mapa'
      Sections = <>
      SectionLayout.CaptionColor = 15198183
      SectionLayout.CaptionColorTo = 14606046
      SectionLayout.CaptionFontColor = clBlack
      SectionLayout.CaptionRounded = False
      SectionLayout.Corners = scRectangle
      SectionLayout.BackGroundColor = 16250871
      SectionLayout.BackGroundColorTo = 15527920
      SectionLayout.BorderColor = clWhite
      SectionLayout.BorderWidth = 1
      SectionLayout.BackGroundGradientDir = gdVertical
      SectionLayout.Indent = 4
      SectionLayout.Spacing = 4
      SectionLayout.ItemFontColor = clBlue
      SectionLayout.ItemHoverTextColor = clBlue
      SectionLayout.ItemHoverUnderline = True
      SectionLayout.UnderLineCaption = False
      ShowCaptionBorder = False
      ShowClose = False
      Style = esOffice2003Classic
      Version = '1.5.4.2'
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 494
    Width = 933
    Height = 29
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    DesignSize = (
      933
      29)
    object ImagenGIF: TJvGIFAnimator
      Left = 2
      Top = 4
      Width = 929
      Height = 23
      AsyncDrawing = True
      AutoSize = False
      Center = True
      Image.Data = {
        66040000474946383961B4000C00A20000CCCCCCFFFFFF999999FFAA00000000
        00000000000000000021FF0B4E45545343415045322E30030100000021F90404
        0A0000002C00000000B4000C000003B428BADCFE30CA49ABBD386B39FA0881F7
        05400980E6499A28BB962DFCAA694CBBF56CEF7A9FFFB8A00C3814DE8A488042
        0462FA8C3CE2711A853E9355EC95BACD72A5B6A5A739EE9AC1672B7AAD6E6BD9
        6FF754DC21D7D3F1FC57EEEDE3F77A7E7073024E4E83827C7F89818B8E887F74
        23878A909695988D979A994A8565949CA280A48CA58F9DA65E9276239BA7AFAA
        A8A3B2B133AC2165B6BBA9B3B0BDBC49B8A1BFB4BEB5C0C9C6521BCDCECFD0D1
        D2D302090021F904040A0000002C0100010016000A00000329080A11CB61C8D1
        E6780DC759A7D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB332
        4B020021F904040A0000002C0D00010016000A00000329080A11CB61C8D1E678
        0DC759A7D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B02
        0021F904040A0000002C1900010016000A00000329080A11CB61C8D1E6780DC7
        59A7D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021
        F904040A0000002C2500010016000A00000329080A11CB61C8D1E6780DC759A7
        D656277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904
        040A0000002C3100010016000A00000329080A11CB61C8D1E6780DC759A7D656
        277D8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A
        0000002C3D00010016000A00000329080A11CB61C8D1E6780DC759A7D656277D
        8B486D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000
        002C4900010016000A00000329080A11CB61C8D1E6780DC759A7D656277D8B48
        6D63E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000002C
        5500010016000A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63
        E9A8217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000002C6100
        010016000A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8
        217AA920E7928A69D2506BE1F60CB3324B020021F904040A0000002C6D000100
        16000A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217A
        A920E7928A69D2506BE1F60CB3324B020021F904040A0000002C790001001600
        0A00000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920
        E7928A69D2506BE1F60CB3324B020021F904040A0000002C8500010016000A00
        000329080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920E792
        8A69D2506BE1F60CB3324B020021F904040A0000002C9100010016000A000003
        29080A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920E7928A69
        D2506BE1F60CB3324B020021F904040A0000002C9D00010016000A0000032908
        0A11CB61C8D1E6780DC759A7D656277D8B486D63E9A8217AA920E7928A69D250
        6BE1F60CB3324B02003B}
      Align = alBottom
      Visible = False
    end
    object btnCerrar: TAdvGlowButton
      Left = 863
      Top = 2
      Width = 68
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Spacing = 4
      TabOrder = 0
      TabStop = True
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object pnlDirecciones: TPanel
    Left = 0
    Top = 335
    Width = 933
    Height = 118
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 6
    DesignSize = (
      933
      118)
    inline fraDireccionDesde: TfraDomicilioGIS
      Left = 32
      Top = 4
      Width = 843
      Height = 59
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 32
      ExplicitTop = 4
      ExplicitWidth = 843
      inherited lbNro: TLabel
        Left = 666
        ExplicitLeft = 666
      end
      inherited lbPiso: TLabel
        Left = 730
        ExplicitLeft = 730
      end
      inherited lbDto: TLabel
        Left = 782
        ExplicitLeft = 782
      end
      inherited lbProvincia: TLabel
        Left = 686
        ExplicitLeft = 686
      end
      inherited cmbCalle: TArtComboBox
        Width = 515
        ExplicitWidth = 515
      end
      inherited edNumero: TEdit
        Left = 682
        ExplicitLeft = 682
      end
      inherited edPiso: TEdit
        Left = 754
        ExplicitLeft = 754
      end
      inherited edDto: TEdit
        Left = 806
        ExplicitLeft = 806
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 411
        ExplicitWidth = 411
      end
      inherited edProvincia: TEdit
        Left = 734
        ExplicitLeft = 734
      end
      inherited btnBuscar: TButton
        Left = 382
        ExplicitLeft = 382
      end
      inherited btnBuscarGIS: TAdvGlowButton
        Left = 570
        ExplicitLeft = 570
      end
      inherited btnMapaGIS: TAdvGlowButton
        Left = 616
        ExplicitLeft = 616
      end
    end
    inline fraDireccionHasta: TfraDomicilioGIS
      Left = 32
      Top = 58
      Width = 843
      Height = 55
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 32
      ExplicitTop = 58
      ExplicitWidth = 843
      ExplicitHeight = 55
      inherited lbNro: TLabel
        Left = 666
        ExplicitLeft = 666
      end
      inherited lbPiso: TLabel
        Left = 730
        ExplicitLeft = 730
      end
      inherited lbDto: TLabel
        Left = 782
        ExplicitLeft = 782
      end
      inherited lbProvincia: TLabel
        Left = 686
        ExplicitLeft = 686
      end
      inherited cmbCalle: TArtComboBox
        Width = 515
        ExplicitWidth = 515
      end
      inherited edNumero: TEdit
        Left = 682
        ExplicitLeft = 682
      end
      inherited edPiso: TEdit
        Left = 754
        ExplicitLeft = 754
      end
      inherited edDto: TEdit
        Left = 806
        ExplicitLeft = 806
      end
      inherited cmbLocalidad: TArtComboBox
        Width = 411
        ExplicitWidth = 411
      end
      inherited edProvincia: TEdit
        Left = 734
        ExplicitLeft = 734
      end
      inherited btnBuscar: TButton
        Left = 382
        ExplicitLeft = 382
      end
      inherited btnBuscarGIS: TAdvGlowButton
        Left = 570
        ExplicitLeft = 570
      end
      inherited btnMapaGIS: TAdvGlowButton
        Left = 616
        ExplicitLeft = 616
      end
    end
    object AdvGlowButton1: TAdvGlowButton
      Left = 872
      Top = 9
      Width = 57
      Height = 49
      Anchors = [akRight, akBottom]
      Caption = 'Desde'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 2
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object AdvGlowButton2: TAdvGlowButton
      Left = 872
      Top = 65
      Width = 57
      Height = 49
      Anchors = [akRight, akBottom]
      Caption = 'Hasta'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 3
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
  object dbgAux: TArtDBGrid
    Left = 12
    Top = 377
    Width = 233
    Height = 112
    Color = clTeal
    DataSource = dsDetalle
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    IniStorage = FormPlacement
    RowColor1 = 16119285
    RowColor2 = 15263976
    ShowGlyphs = False
    OnGetCellParams = dbgListadoGetCellParams
    OnPaintFooter = dbgListadoPaintFooter
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_CUIL'
        Title.Caption = 'CUIL'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Trabajador'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Caption = 'Fecha'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPFACT'
        Title.Caption = 'Monto'
        Width = 38
        Visible = True
      end>
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 336
    Top = 4
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDatosAfterOpen
    AfterScroll = sdqDatosAfterScroll
    SQL.Strings = (
      
        'SELECT IV_SINIESTRO ||'#39'-'#39' || IV_ORDEN || '#39'-'#39' || IV_RECAIDA SINIE' +
        'STRO,'
      
        '       EX_CUIL, TJ_NOMBRE, '#39'  '#39'|| TJ_NOMBRE NOMTRAB,  CP_DENPAGO' +
        ', IV_FECPRESTA FECHA, '
      
        '       IIF_Compara('#39'<'#39', iv_impfacturado, 0, 0, iv_impfacturado) ' +
        'impfact,'
      
        '       IIF_Compara('#39'<'#39', iv_impfacturado, 0, iv_impfacturado, iv_' +
        'imppagconret) imppafconret,'
      
        '       IV_OBSERVACIONES OBS, iv_pres_codigo PRESTACION,iv_Numvol' +
        'ante, iv_auditado, '
      '      dv_original, dv_codigo, dv_secuencia, dv_codoriginal'
      
        'from sex_expedientes, ctj_trabajadores, scp_conpago, siv_itemvol' +
        'ante'
      'where iv_siniestro = ex_siniestro'
      '  and iv_orden     = ex_orden'
      '  and iv_recaida   = ex_recaida'
      '  and ex_cuil      = tj_cuil'
      '  and iv_estado <> '#39'X'#39
      '  and iv_conpago   = cp_conpago'
      '  and iv_volante = 1818')
    Left = 280
    Top = 4
  end
  object dsDetalle: TDataSource
    DataSet = sdqDatos
    Left = 308
    Top = 4
  end
  object pMnuSiniestros: TPopupMenu
    AutoHotkeys = maManual
    Left = 364
    Top = 4
    object mnuTodosSini: TMenuItem
      Caption = '(Todos los Siniestros)'
      OnClick = mnuTodosSiniClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
  object SortDialog: TSortDialog
    Caption = 'Orden'
    DataSet = sdqDatos
    SortFields = <>
    IniStorage = FormPlacement
    FixedRows = 0
    Left = 392
    Top = 4
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
        Key = 16466
        OnShortCutPress = tbPreviewClick
        LinkControl = tbPreview
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
    Left = 420
    Top = 4
  end
  object ExportDialogDet: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatos
    ExportFileType = etExcelFile
    Fields = <>
    IniStorage = FormPlacement
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
    Left = 448
    Top = 4
  end
  object pmnuExportar: TPopupMenu
    AutoHotkeys = maManual
    Left = 476
    Top = 4
    object mnuExportaDetalle: TMenuItem
      Caption = 'Detalle'
      OnClick = mnuExportaDetalleClick
    end
    object mnuExportaDetalleAbreviado: TMenuItem
      Caption = 'Detalle Abreviado'
      OnClick = mnuExportaDetalleAbreviadoClick
    end
  end
  object ExportDialogDetAbrev: TExportDialog
    Caption = 'Exportaci'#243'n de Datos'
    DataSet = sdqDatosDetAbrev
    ExportFileType = etExcelFile
    Fields = <
      item
        DataField = 'SINIESTRO'
        Title = 'Siniestro'
      end
      item
        DataField = 'EX_CUIL'
        Title = 'Cuil'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Trabajador'
      end
      item
        DataField = 'FECHA'
        Title = 'Fecha'
      end
      item
        DataField = 'IMPFACT'
        Title = 'Monto'
        Alignment = taRightJustify
      end>
    IniStorage = FormPlacement
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
    Left = 504
    Top = 4
  end
  object pmnuImprimir: TPopupMenu
    AutoHotkeys = maManual
    Left = 532
    Top = 4
    object mnuImpDetFact: TMenuItem
      Caption = 'Detalle de la Factura'
      OnClick = mnuImpDetFactClick
    end
    object mnuImpDetAbrev: TMenuItem
      Caption = 'Detalle Abreviado'
      OnClick = mnuImpDetAbrevClick
    end
  end
  object sdqDatosDetAbrev: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT IV_SINIESTRO ||'#39'-'#39' || IV_ORDEN || '#39'-'#39' || IV_RECAIDA SINIE' +
        'STRO,'
      
        '       EX_CUIL, TJ_NOMBRE, '#39'  '#39'|| TJ_NOMBRE NOMTRAB,  CP_DENPAGO' +
        ', IV_FECPRESTA FECHA, '
      
        '       IIF_Compara('#39'<'#39', iv_impfacturado, 0, 0, iv_impfacturado) ' +
        'impfact,'
      
        '       IIF_Compara('#39'<'#39', iv_impfacturado, 0, iv_impfacturado, iv_' +
        'imppagconret) imppafconret,'
      
        '       IV_OBSERVACIONES OBS, iv_pres_codigo PRESTACION,iv_Numvol' +
        'ante'
      
        'from sex_expedientes, ctj_trabajadores, scp_conpago, siv_itemvol' +
        'ante'
      'where iv_siniestro = ex_siniestro'
      '  and iv_orden     = ex_orden'
      '  and iv_recaida   = ex_recaida'
      '  and ex_cuil      = tj_cuil'
      '  and iv_estado <> '#39'X'#39
      '  and iv_conpago   = cp_conpago'
      '  and iv_volante = 1818')
    Left = 68
    Top = 76
  end
  object dsDatosDetAbrev: TDataSource
    DataSet = sdqDatosDetAbrev
    Left = 96
    Top = 76
  end
end
