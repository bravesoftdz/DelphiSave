object RptOrdenPago: TRptOrdenPago
  Left = 56
  Top = 214
  Caption = 'RptOrdenPago'
  ClientHeight = 746
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrpOrdenPago: TQuickRep
    Left = 36
    Top = 24
    Width = 816
    Height = 1056
    IDReport = 0
    BeforePrint = qrpOrdenPagoBeforePrint
    DataSet = sdqOrdenPago
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      50.000000000000000000
      2794.000000000000000000
      50.000000000000000000
      2159.000000000000000000
      50.000000000000000000
      50.000000000000000000
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
    ReportTitle = 'Orden de Pago'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object qrbTitulo: TQRBand
      Left = 19
      Top = 19
      Width = 778
      Height = 295
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        780.520833333333300000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape9: TQRShape
        Left = 1
        Top = 258
        Width = 778
        Height = 7
        Size.Values = (
          17.638888888888890000
          1.763888888888889000
          682.625000000000000000
          2058.458333333333000000)
        XLColumn = 0
        Brush.Color = clMenu
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrdOP: TQRDBText
        Left = 225
        Top = 16
        Width = 251
        Height = 26
        Size.Values = (
          68.791666666666670000
          595.312500000000000000
          42.333333333333330000
          664.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'ORDEN_DE_PAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 16
      end
      object qrlCheque: TQRLabel
        Left = 4
        Top = 271
        Width = 135
        Height = 17
        Size.Values = (
          45.861111111111110000
          10.583333333333330000
          717.902777777777800000
          356.305555555555600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tipo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlFecha: TQRLabel
        Left = 140
        Top = 271
        Width = 71
        Height = 17
        Size.Values = (
          45.861111111111110000
          370.416666666666700000
          717.902777777777800000
          188.736111111111100000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlDescripcion: TQRLabel
        Left = 334
        Top = 271
        Width = 323
        Height = 17
        Size.Values = (
          45.861111111111110000
          883.708333333333300000
          717.902777777777800000
          855.486111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Concepto / Descripci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlImporteAplicado: TQRLabel
        Left = 660
        Top = 271
        Width = 110
        Height = 17
        Size.Values = (
          45.861111111111110000
          1746.250000000000000000
          717.902777777777800000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Monto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrdImporteApli: TQRDBText
        Left = 1563
        Top = 306
        Width = 48
        Height = 17
        Size.Values = (
          45.861111111111110000
          4134.555555555556000000
          809.625000000000000000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'MONTO'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrlOrdenPago: TQRLabel
        Left = 1
        Top = 16
        Width = 221
        Height = 26
        Size.Values = (
          68.791666666666670000
          2.645833333333333000
          42.333333333333330000
          584.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ORDEN DE PAGO N'#186
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 16
      end
      object qrlFechaEmision: TQRLabel
        Left = 412
        Top = 202
        Width = 120
        Height = 17
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          534.458333333333300000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrdFechaEmision: TQRDBText
        Left = 534
        Top = 202
        Width = 242
        Height = 17
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          534.458333333333300000
          640.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrdProveedor: TQRDBText
        Left = 105
        Top = 144
        Width = 304
        Height = 17
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          381.000000000000000000
          804.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'PROVEEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrdDomicilioUno: TQRDBText
        Left = 105
        Top = 163
        Width = 304
        Height = 17
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          432.152777777777800000
          804.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'DOMICILIO_L1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrdDomicilioDos: TQRDBText
        Left = 105
        Top = 183
        Width = 304
        Height = 17
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          483.305555555555600000
          804.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'DOMICILIO_L2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrdCodigoPostal: TQRDBText
        Left = 105
        Top = 202
        Width = 304
        Height = 17
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          534.458333333333300000
          804.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'DOMICILIO_L3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText5: TQRDBText
        Left = 105
        Top = 221
        Width = 304
        Height = 17
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          583.847222222222200000
          804.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'DOMICILIO_L4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText6: TQRDBText
        Left = 105
        Top = 239
        Width = 304
        Height = 17
        Size.Values = (
          45.861111111111110000
          278.694444444444400000
          631.472222222222200000
          804.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'CP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrlCuitART: TQRLabel
        Left = 534
        Top = 144
        Width = 242
        Height = 17
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          381.000000000000000000
          640.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlCuitART'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        OnPrint = qrlCuitARTPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel10: TQRLabel
        Left = 214
        Top = 271
        Width = 119
        Height = 17
        Size.Values = (
          45.861111111111110000
          566.208333333333300000
          717.902777777777800000
          315.736111111111100000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'N'#250'mero'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel11: TQRLabel
        Left = 14
        Top = 144
        Width = 88
        Height = 17
        Size.Values = (
          45.861111111111110000
          37.041666666666670000
          381.000000000000000000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Proveedor:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel12: TQRLabel
        Left = 14
        Top = 163
        Width = 88
        Height = 17
        Size.Values = (
          45.861111111111110000
          37.041666666666670000
          432.152777777777800000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Domicilio:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel13: TQRLabel
        Left = 14
        Top = 239
        Width = 88
        Height = 17
        Size.Values = (
          45.861111111111110000
          37.041666666666670000
          631.472222222222200000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CP:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel14: TQRLabel
        Left = 412
        Top = 163
        Width = 120
        Height = 17
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          430.388888888888900000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'IVA:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlIBART: TQRLabel
        Left = 534
        Top = 183
        Width = 242
        Height = 17
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          483.305555555555600000
          640.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlIBART'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        OnPrint = qrlIBARTPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel15: TQRLabel
        Left = 412
        Top = 221
        Width = 120
        Height = 17
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          583.847222222222200000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'N'#186' de Cheque:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel6: TQRLabel
        Left = 1
        Top = 46
        Width = 92
        Height = 19
        Size.Values = (
          50.270833333333330000
          2.645833333333333000
          121.708333333333300000
          243.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Beneficiario:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 11
      end
      object QRDBText2: TQRDBText
        Left = 95
        Top = 46
        Width = 434
        Height = 55
        Size.Values = (
          144.638888888888900000
          252.236111111111100000
          121.708333333333300000
          1148.291666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'BENEFICIARIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRLabel16: TQRLabel
        Left = 534
        Top = 163
        Width = 242
        Height = 17
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          430.388888888888900000
          640.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'RESPONSABLE INSCRIPTO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel17: TQRLabel
        Left = 412
        Top = 144
        Width = 120
        Height = 17
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          381.000000000000000000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CUIT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel18: TQRLabel
        Left = 412
        Top = 183
        Width = 120
        Height = 17
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          483.305555555555600000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Ingresos Brutos:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape14: TQRShape
        Left = 1
        Top = 291
        Width = 778
        Height = 7
        Size.Values = (
          17.638888888888890000
          1.763888888888889000
          769.055555555555600000
          2058.458333333333000000)
        XLColumn = 0
        Brush.Color = clMenu
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qriLogo: TQRImage
        Left = 613
        Top = 4
        Width = 163
        Height = 64
        Size.Values = (
          169.333333333333300000
          1621.895833333333000000
          10.583333333333330000
          431.270833333333300000)
        XLColumn = 0
        Stretch = True
      end
      object QRLabel19: TQRLabel
        Left = 412
        Top = 239
        Width = 120
        Height = 17
        Size.Values = (
          45.861111111111110000
          1090.083333333333000000
          631.472222222222200000
          317.500000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'M'#233'todo de Pago:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRDBText4: TQRDBText
        Left = 534
        Top = 221
        Width = 242
        Height = 17
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          583.847222222222200000
          640.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'NRO_DE_CHEQUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText7: TQRDBText
        Left = 534
        Top = 239
        Width = 242
        Height = 17
        Size.Values = (
          45.861111111111110000
          1412.875000000000000000
          631.472222222222200000
          640.291666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'METODO_DE_PAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrlCodBarrasST: TQRLabel
        Left = 642
        Top = 72
        Width = 133
        Height = 21
        Size.Values = (
          54.680555555555560000
          1698.625000000000000000
          190.500000000000000000
          352.777777777777800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlCodBarrasST'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = '3 of 9 Barcode'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 20
      end
      object qrlNumeroCodBarrasST: TQRLabel
        Left = 642
        Top = 93
        Width = 133
        Height = 15
        Size.Values = (
          40.569444444444440000
          1698.625000000000000000
          245.180555555555600000
          352.777777777777800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlNumeroCodBarrasST'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlInfoAdic1CodBarrasST: TQRLabel
        Left = 642
        Top = 108
        Width = 133
        Height = 15
        Size.Values = (
          40.569444444444440000
          1698.625000000000000000
          285.750000000000000000
          352.777777777777800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlInfoAdic1CodBarrasST'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object qrlInfoAdic2CodBarrasST: TQRLabel
        Left = 642
        Top = 123
        Width = 133
        Height = 15
        Size.Values = (
          40.569444444444440000
          1698.625000000000000000
          326.319444444444400000
          352.777777777777800000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlInfoAdic2CodBarrasST'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBDetail: TQRBand
      Left = 19
      Top = 314
      Width = 778
      Height = 20
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qrdNroCheque: TQRDBText
        Left = 4
        Top = 2
        Width = 135
        Height = 18
        Size.Values = (
          47.625000000000000000
          10.583333333333330000
          5.291666666666667000
          357.187500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'TIPO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrdFecha: TQRDBText
        Left = 140
        Top = 2
        Width = 71
        Height = 18
        Size.Values = (
          47.625000000000000000
          370.416666666666700000
          5.291666666666667000
          187.854166666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText3: TQRDBText
        Left = 214
        Top = 2
        Width = 119
        Height = 18
        Size.Values = (
          47.625000000000000000
          566.208333333333300000
          5.291666666666667000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrdDescripcion: TQRDBText
        Left = 334
        Top = 2
        Width = 323
        Height = 18
        Size.Values = (
          47.625000000000000000
          883.708333333333300000
          5.291666666666667000
          854.604166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object QRDBText1: TQRDBText
        Left = 660
        Top = 2
        Width = 110
        Height = 18
        Size.Values = (
          47.625000000000000000
          1746.250000000000000000
          5.291666666666667000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Color = clWhite
        DataSet = sdqOrdenPago
        DataField = 'MONTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Mask = '0.00'
        OnPrint = FormatMonto
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
    end
    object QRBSubTotal: TQRBand
      Left = 19
      Top = 334
      Width = 778
      Height = 29
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel1: TQRLabel
        Left = 521
        Top = 10
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1378.479166666667000000
          26.458333333333330000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Neto a Pagar:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRExpr2: TQRExpr
        Left = 608
        Top = 10
        Width = 162
        Height = 17
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          26.458333333333330000
          428.625000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Color = clWhite
        OnPrint = FormatMonto
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'SUM(sdqOrdenPago.MONTO)'
        Mask = '0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape8: TQRShape
        Left = 1
        Top = 0
        Width = 778
        Height = 7
        Size.Values = (
          18.520833333333330000
          2.645833333333333000
          0.000000000000000000
          2058.458333333333000000)
        XLColumn = 0
        Brush.Color = clMenu
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand1: TQRBand
      Left = 19
      Top = 363
      Width = 778
      Height = 443
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1172.104166666667000000
        2058.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrlRecibio: TQRLabel
        Left = 229
        Top = 89
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          605.895833333333300000
          235.479166666666700000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Revis'#243
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlFirmaCheque: TQRLabel
        Left = 411
        Top = 90
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          1087.437500000000000000
          238.125000000000000000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Firma de Cheque'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlEntrego: TQRLabel
        Left = 589
        Top = 90
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          1558.395833333333000000
          238.125000000000000000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Entreg'#243
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape1: TQRShape
        Left = 38
        Top = 78
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          100.541666666666700000
          206.375000000000000000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 229
        Top = 78
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          605.895833333333300000
          206.375000000000000000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 411
        Top = 78
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          1087.437500000000000000
          206.375000000000000000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 589
        Top = 78
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          1558.395833333333000000
          206.375000000000000000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 310
        Top = 238
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          820.208333333333300000
          629.708333333333300000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlRecibido: TQRLabel
        Left = 310
        Top = 250
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          820.208333333333300000
          661.458333333333300000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'N'#186' de Documento'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlFechaRecibido: TQRLabel
        Left = 589
        Top = 254
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          1558.395833333333000000
          672.041666666666700000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Fecha'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape7: TQRShape
        Left = 589
        Top = 242
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          1558.395833333333000000
          640.291666666666700000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 38
        Top = 238
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          100.541666666666700000
          629.708333333333300000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 38
        Top = 250
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          100.541666666666700000
          661.458333333333300000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Firma'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape5: TQRShape
        Left = 310
        Top = 350
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          820.208333333333300000
          926.041666666666700000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 310
        Top = 362
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          820.208333333333300000
          957.791666666666700000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Por'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel3: TQRLabel
        Left = 589
        Top = 366
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          1558.395833333333000000
          968.375000000000000000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Car'#225'cter'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRShape11: TQRShape
        Left = 589
        Top = 354
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          1558.395833333333000000
          936.625000000000000000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 38
        Top = 350
        Width = 140
        Height = 7
        Size.Values = (
          18.520833333333330000
          100.541666666666700000
          926.041666666666700000
          370.416666666666700000)
        XLColumn = 0
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 38
        Top = 362
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          100.541666666666700000
          957.791666666666700000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Aclaraci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel9: TQRLabel
        Left = 38
        Top = 89
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          100.541666666666700000
          235.479166666666700000
          370.416666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Confeccion'#243
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object qrlCodBarras: TQRLabel
        Left = 4
        Top = 399
        Width = 773
        Height = 23
        Size.Values = (
          60.854166666666670000
          10.583333333333330000
          1055.687500000000000000
          2045.229166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlCodBarras'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = '3 of 9 Barcode'
        Font.Style = []
        OnPrint = qrlCodBarrasPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 22
      end
      object qrmTexto: TQRMemo
        Left = 15
        Top = 133
        Width = 755
        Height = 45
        Size.Values = (
          119.062500000000000000
          39.687500000000000000
          351.895833333333300000
          1997.604166666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          
            'RECIB'#205' DE PROVINCIA ART S.A. EL CHEQUE PRECEDENTEMENTE DESCRIPTO' +
            ', POR LOS CONCEPTOS ARRIBA INDICADOS, PRESTANDO PLENA Y EXPRESA ' +
            'CONFORMIDAD CON LOS CONCEPTOS, IMPORTES, D'#201'BITOS Y RETENCIONES P' +
            'RACTICADOS.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrlNumeroCodBarras: TQRLabel
        Left = 4
        Top = 423
        Width = 773
        Height = 14
        Size.Values = (
          37.041666666666670000
          10.583333333333330000
          1119.187500000000000000
          2045.229166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlNumeroCodBarras'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 2
        Top = 61
        Width = 208
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          161.395833333333300000
          550.333333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = sdqEncabezado
        DataField = 'CONFECCIONO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
    end
  end
  object sdqOrdenPago: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      ' SELECT DECODE(IV.INVOICE_TYPE_LOOKUP_CODE,'
      '              '#39'STANDARD'#39', '#39'FACTURA'#39','
      '              '#39'CREDIT'#39', '#39'NOTA DE CREDITO'#39','
      '              '#39'DEBIT'#39', '#39'NOTA DE DEBITO'#39','
      '              '#39'MIXED'#39', '#39'COMPROBANTE INTERNO'#39') TIPO,'
      
        '       IV.INVOICE_DATE FECHA, IV.INVOICE_NUM NUMERO, IV.DESCRIPT' +
        'ION DESCRIPCION, IV.INVOICE_AMOUNT MONTO'
      
        '  FROM AP_CHECKS_ALL AC, AP_INVOICE_PAYMENTS_ALL IP, AP_INVOICES' +
        '_ALL IV'
      ' WHERE IP.INVOICE_ID = IV.INVOICE_ID'
      '   AND IP.CHECK_ID = AC.CHECK_ID'
      '   AND AC.STATUS_LOOKUP_CODE = '#39'NEGOTIABLE'#39
      '   AND IP.CHECK_ID = :op'
      ' UNION'
      
        'SELECT '#39'CERT. DE RETENCION'#39', JC.AWT_DATE, JC.ATTRIBUTE1, JC.AWT_' +
        'TYPE_CODE, JC.WITHHOLDING_AMOUNT'
      '  FROM AP_CHECKS_ALL AC, JL_AR_AP_AWT_CERTIF_ALL JC'
      ' WHERE JC.STATUS <> '#39'VOID'#39
      '   AND JC.CHECK_NUMBER = AC.CHECK_NUMBER'
      '   AND JC.CHECKRUN_NAME = AC.CHECKRUN_NAME'
      '   AND AC.CHECK_ID = :op'
      ' ORDER BY FECHA'
      ''
      '')
    Left = 11
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'op'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'op'
        ParamType = ptInput
      end>
  end
  object sdqEncabezado: TSDQuery
    DatabaseName = 'dbfinancials'
    Options = []
    SQL.Strings = (
      
        'SELECT   CH.CHECK_ID ORDEN_DE_PAGO, PROVART_BENEFICIARY_FN(CH.VE' +
        'NDOR_ID, CH.CHECKRUN_NAME, CH.CHECK_ID) BENEFICIARIO,'
      
        '         CH.VENDOR_NAME PROVEEDOR, CH.ADDRESS_LINE1 DOMICILIO_L1' +
        ', CH.ADDRESS_LINE2 DOMICILIO_L2, CH.ADDRESS_LINE3 DOMICILIO_L3,'
      
        '         CH.CITY DOMICILIO_L4, CH.STATE || '#39' '#39' || CH.ZIP || '#39' '#39' ' +
        '|| CH.COUNTRY CP, AISC.CHECK_DATE FECHA,'
      
        '         CH.CHECK_NUMBER NRO_DE_CHEQUE, CHS.ATTRIBUTE2 METODO_DE' +
        '_PAGO, U.DESCRIPTION CONFECCIONO'
      
        '    FROM AP_CHECKS_ALL CH, AP_CHECK_STOCKS_ALL CHS, FND_USER U, ' +
        'AP_BANK_ACCOUNTS_ALL BA, AP_BANK_BRANCHES BB,'
      '         AP_INV_SELECTION_CRITERIA_ALL AISC'
      '   WHERE CH.BANK_ACCOUNT_ID = BA.BANK_ACCOUNT_ID'
      '     AND CH.CHECK_ID = :op'
      '     AND BA.BANK_BRANCH_ID = BB.BANK_BRANCH_ID'
      '     AND CH.CHECKRUN_NAME = AISC.CHECKRUN_NAME'
      '     AND CH.LAST_UPDATED_BY = U.USER_ID'
      '     AND CH.CHECK_STOCK_ID = CHS.CHECK_STOCK_ID'
      'ORDER BY CH.CHECK_NUMBER'
      ''
      ''
      '')
    Left = 39
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OP'
        ParamType = ptInput
      end>
  end
end
